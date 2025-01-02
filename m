Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791EF9FFF8D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 20:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F79910E7A8;
	Thu,  2 Jan 2025 19:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rS+3F9x8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D6610E7A3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 19:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FQ5A9W9ZLTBiJtsr+i23qEAdyUGsDQgwgROsAboy+5c=; b=rS+3F9x8yEbY4Qbzlpz97chrBp
 zXCg6NEmGSq2+V+6Rr4tFsHYmhnp06f8DmZRY9Fj00ECih+CK5kz2OVGldLbbhzw47P7hV7x/Ergd
 26xhi7F+zcyk6o1lHS1DROY4m0TCi3EkiL/KAW7QOytvITOQ1Bu1G0w4ufYNXd7N8uxJu5EOSmweD
 XuzJuHZwDYjWDLLxigMhNOeQChcXGGryzjGHBmXihDOT17fn6GkcEWhQqGN/qrF5Dm5LI3lTBSmk3
 1tShSuoJhF5UaVyaGpVPeOA3uAGNiQvlYHIO17GXJ2KxqTq+msn2Qr1BiGynySCjFTnj1ii2gOCcV
 C5CfuWVw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tTR7Q-00Au7d-UK; Thu, 02 Jan 2025 20:44:33 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 5/6] drm/syncobj: Use put_user in drm_syncobj_query_ioctl
Date: Thu,  2 Jan 2025 19:44:16 +0000
Message-ID: <20250102194418.70383-6-tursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250102194418.70383-1-tursulin@igalia.com>
References: <20250102194418.70383-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Since the query loop is using copy_to_user() to write out a single u64 at
a time it feels more natural (and is a tiny bit more compact) to replace
it with put_user().

Access_ok() check is added to the input checking for an early bailout in
case of a bad buffer passed in.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/drm_syncobj.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 5838a7c71a76..d8756763f517 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1641,6 +1641,9 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 	if (args->count_handles == 0)
 		return -EINVAL;
 
+	if (!access_ok(points, args->count_handles * sizeof(*points)))
+		return -EFAULT;
+
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
@@ -1682,10 +1685,10 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 			point = 0;
 		}
 		dma_fence_put(fence);
-		ret = copy_to_user(&points[i], &point, sizeof(uint64_t));
-		ret = ret ? -EFAULT : 0;
-		if (ret)
+		if (put_user(point, points++)) {
+			ret = -EFAULT;
 			break;
+		}
 	}
 	drm_syncobj_array_free(syncobjs, args->count_handles);
 
-- 
2.47.1

