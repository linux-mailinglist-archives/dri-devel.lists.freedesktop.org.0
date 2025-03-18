Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719CDA67872
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 16:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9320310E4AD;
	Tue, 18 Mar 2025 15:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LF+5z2GG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50EA10E227
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 15:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Du89kFAzAGKSeETEZWdUbbwxtkK2iO2p2z8eTkLyl4k=; b=LF+5z2GGBYI2S/f+Lw17yhX5WI
 upV/jkLNYCQS+dZIyWgtdSsrDo7QgAtPTR3QafdCDDRi/XtQXUop/CBW4LDUL9vnurte6uTjuz2Q4
 w0NmxetTg32RX7e0uBkJ2f0+pCx+skX9h1Cyz8qc44Ucm9SlM9xcfE82503O2Cpe+lbr5WtATW+t/
 fL+1hHGJjgtBQj9LDv6PUiP4o/AREQApmRHlsv426J5IF75U/9BPsXWXNaOLR4jB4GfhVdJ6F9Jhk
 w4ICntMoLBKgXckroipIse2TuXPEVwg2ECjNwI8+OJvmrE2q+dYRIuD1XpmjKN2ArmDcbTy99ZMKA
 9+LFbYiQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tuZGv-002ngl-3n; Tue, 18 Mar 2025 16:54:29 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 4/7] drm/syncobj: Use put_user in drm_syncobj_query_ioctl
Date: Tue, 18 Mar 2025 15:54:20 +0000
Message-ID: <20250318155424.78552-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250318155424.78552-1-tvrtko.ursulin@igalia.com>
References: <20250318155424.78552-1-tvrtko.ursulin@igalia.com>
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
index cdda2df06bec..74d1dc0d1f8b 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1643,6 +1643,9 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 	if (args->count_handles == 0)
 		return -EINVAL;
 
+	if (!access_ok(points, args->count_handles * sizeof(*points)))
+		return -EFAULT;
+
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
@@ -1684,10 +1687,10 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
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

