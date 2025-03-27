Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A238A72BAD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 09:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5B910E87C;
	Thu, 27 Mar 2025 08:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="O9QVTKy3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D1110E883
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 08:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HI/REpNzZw8EFH7D7Dudv6QJr7vF6ziPJAMEZFVkcGw=; b=O9QVTKy3QvtaGQnzNm8zKhmiEi
 XGSMYi4tH2JndmBcsXwN7RiI/y65ZIOuf9EZKD0kD56wWJxwj2wF7I6vsUKS7xSXDyf7COB4GiD1g
 r2bfxQlBj86Zk94VVgVkhYqlpWn2vDLZ8oWzCtHU0Xy2j/J3Ecn4Yf6Qvs1C5ssF5nPhHDNF46too
 +HcTwMhEkEOtq1KewJ4W/KSoYUtDuSyNvRHrst8xyYvNRZ2rP+alMvIsoPXF2zKXHHz0hdTIHbwE2
 mQM9wZSaboQAL6rXtkj5fD47QZlJcCJ+PUXhq6636osPx/Jx22Y5KydGrjL0DLxLYpMrg6uChGZqj
 EAy4cruQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1txiog-0078l6-GU; Thu, 27 Mar 2025 09:42:22 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v2 4/7] drm/syncobj: Use put_user in drm_syncobj_query_ioctl
Date: Thu, 27 Mar 2025 08:42:11 +0000
Message-ID: <20250327084215.26662-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250327084215.26662-1-tvrtko.ursulin@igalia.com>
References: <20250327084215.26662-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Since the query loop is using copy_to_user() to write out a single u64 at
a time it feels more natural (and is a tiny bit more compact) to replace
it with put_user().

Access_ok() check is added to the input checking for an early bailout in
case of a bad buffer passed in.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_syncobj.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index cd36c888f112..9f51bd4dbfc4 100644
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
+		if (__put_user(point, points++)) {
+			ret = -EFAULT;
 			break;
+		}
 	}
 	drm_syncobj_array_free(syncobjs, args->count_handles);
 
-- 
2.48.0

