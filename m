Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6737FB89A18
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 15:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53DB10E9F8;
	Fri, 19 Sep 2025 13:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QN13dMD5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D7D10E9E2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 13:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tdoh7JO5ie6RvxWmaV1bQLdeehGz9LImdDCOtdUs2Ps=; b=QN13dMD5R7EGGBeAhmHYESjI7B
 TzbWbWMaEbMBlXvzTukShvDlJvFKn66TG1rjuzpPhHYqE9RlUUF/5h/otgLfJNw6m6i48Huqjr/4W
 tLaAySDTXnKE3PMmYUlIqFoFdZFOQxy8euvp9hnlQpiY5TbkJ/C0ZiO29LdbVJ0KQZVDE7z0cFccC
 yPVVN4NkilyTAheJLRwJLSkMxHL6xwpVLK9tXupijxwoF+LM5pLoFE8+sfN2AeeLe1HbhkuiYKYLR
 g/Iyzk77sMhF7Upm1zmcEeKL+9AlfRoSGBgbSdZT+3YG7t/LuX2DGEnX3/1Y6kCTImE7R85lW1s5g
 dBfeAR2w==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uzaxf-00E6Nm-Ao; Fri, 19 Sep 2025 15:15:39 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 2/4] drm/ttm: Resource cannot be NULL in
 ttm_resource_intersects
Date: Fri, 19 Sep 2025 14:15:28 +0100
Message-ID: <20250919131530.91247-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250919131530.91247-1-tvrtko.ursulin@igalia.com>
References: <20250919131530.91247-1-tvrtko.ursulin@igalia.com>
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

Function has a single caller and the resource cannot be NULL therefore
remove the early return check.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index e2c82ad07eb4..b78be0c342f2 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -445,9 +445,6 @@ bool ttm_resource_intersects(struct ttm_device *bdev,
 {
 	struct ttm_resource_manager *man;
 
-	if (!res)
-		return false;
-
 	man = ttm_manager_type(bdev, res->mem_type);
 	if (!place || !man->func->intersects)
 		return true;
-- 
2.48.0

