Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 390D8C3B333
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AC010E8C0;
	Thu,  6 Nov 2025 13:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dY3Bwsxg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505BE10E8C0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cmB7EbE5N487xYek/VJGaR4wrZQQS0/BhVQQpd5jFaQ=; b=dY3Bwsxgc+CMgR/r2IBRBRfWtB
 rxQh7pmaKQaK+oaKkBM82Ov6hCtTK1An5Adu0GiJWosINI7K8QQa6ngJU3V5v+pxmEO2PSmPvQrW0
 whs8MOdyqzyXY1oJm6WhQcVcUEJ0EBtpPPyuBRcIBVAluXJgPDLBrTR5YnsOvADmjht9UML61uXKp
 M1T64HPVO4glofX1K5RZjxWbkGhQ7GoCR2kfV99It6a8G5EpQZDCOM39ArJ+OE52YYgHXlHbpAzR0
 WzXvyQViBZ3f/A8oFRBMBmGedclk1qTcNdPFT6mGbhu7F7U/keT2fZtDUB1dxkDUQkRXUtIEKop4e
 ShiOm6fw==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vH00m-0030kN-Iw; Thu, 06 Nov 2025 14:26:48 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 1/3] drm/syncobj: Use vmemdup_array_user in
 drm_syncobj_array_find
Date: Thu,  6 Nov 2025 13:26:43 +0000
Message-ID: <20251106132645.28208-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251106132645.28208-1-tvrtko.ursulin@igalia.com>
References: <20251106132645.28208-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using a helper shrinks the code and separating the user and kernel slabs
is more secure.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/drm_syncobj.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index e1b0fa4000cd..1333ef0ea03b 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1294,15 +1294,10 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
 	struct drm_syncobj **syncobjs;
 	int ret;
 
-	handles = kmalloc_array(count_handles, sizeof(*handles), GFP_KERNEL);
-	if (handles == NULL)
-		return -ENOMEM;
-
-	if (copy_from_user(handles, user_handles,
-			   sizeof(uint32_t) * count_handles)) {
-		ret = -EFAULT;
-		goto err_free_handles;
-	}
+	handles = memdup_array_user(user_handles, count_handles,
+				    sizeof(*handles));
+	if (IS_ERR(handles))
+		return PTR_ERR(handles);
 
 	syncobjs = kmalloc_array(count_handles, sizeof(*syncobjs), GFP_KERNEL);
 	if (syncobjs == NULL) {
-- 
2.48.0

