Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A75D532E70C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 12:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2305D6E1D6;
	Fri,  5 Mar 2021 11:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A296E1CD;
 Fri,  5 Mar 2021 11:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=9IMtNTWCQ0cP72Gz+Jj7FrniCUzLw8jtsPxfq8pOVno=; 
 b=RYvV9WjH3zRvC/dKbDBQUWJJx8TVrrcSw8BKvYDfXy3aUsEOCUUT0DuXITRnVQevNza28CWoTq2pEqoYoB10eZxi4A0wSE0LMyezTg6qCLJlRBC9Ptc4dSF0id6wHxUEreHwJN6KOQxxUlzPqwmpHA0BY/iRP6xrTzVknbdQ7WumsNT3cCDckSjoqSJfEEIrwLb933h7ZPHbG5Py4WFdRleIACEsE4l1MrGfsW81Z8Csvsl7ZH6h4qWhOAl/5fr98GXwNXLBEuOTTqPnHzIVEIyvYUKdJcTvTsh9HAdSm6wDPRJy9kd/cskTSpsLenUj+FJPdFHqUTrEpLbB7r4n3Q==;
Received: from lneuilly-657-1-8-171.w81-250.abo.wanadoo.fr ([81.250.147.171]
 helo=masxo.routerf36dc8.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lI8OO-0008UE-T9; Fri, 05 Mar 2021 12:13:13 +0100
From: Neil Roberts <nroberts@igalia.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] lib/panfrost: Add a utility to madvise a buffer
Date: Fri,  5 Mar 2021 12:12:45 +0100
Message-Id: <20210305111246.1381965-2-nroberts@igalia.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210305111246.1381965-1-nroberts@igalia.com>
References: <20210305111246.1381965-1-nroberts@igalia.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Neil Roberts <nroberts@igalia.com>
---
 lib/igt_panfrost.c | 12 ++++++++++++
 lib/igt_panfrost.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/lib/igt_panfrost.c b/lib/igt_panfrost.c
index 8b0c2b77..ffce66a2 100644
--- a/lib/igt_panfrost.c
+++ b/lib/igt_panfrost.c
@@ -127,6 +127,18 @@ void igt_panfrost_bo_mmap(int fd, struct panfrost_bo *bo)
         igt_assert(bo->map);
 }
 
+bool igt_panfrost_bo_madvise(int fd, struct panfrost_bo *bo, uint32_t madv)
+{
+        struct drm_panfrost_madvise madvise = {
+                .handle = bo->handle,
+                .madv = madv,
+        };
+
+        do_ioctl(fd, DRM_IOCTL_PANFROST_MADVISE, &madvise);
+
+        return madvise.retained;
+}
+
 struct panfrost_submit *igt_panfrost_trivial_job(int fd, bool do_crash, int width, int height, uint32_t color)
 {
         struct panfrost_submit *submit;
diff --git a/lib/igt_panfrost.h b/lib/igt_panfrost.h
index cc7998dc..df326a6c 100644
--- a/lib/igt_panfrost.h
+++ b/lib/igt_panfrost.h
@@ -56,5 +56,6 @@ uint32_t igt_panfrost_get_param(int fd, int param);
 void *igt_panfrost_mmap_bo(int fd, uint32_t handle, uint32_t size, unsigned prot);
 
 void igt_panfrost_bo_mmap(int fd, struct panfrost_bo *bo);
+bool igt_panfrost_bo_madvise(int fd, struct panfrost_bo *bo, uint32_t madv);
 
 #endif /* IGT_PANFROST_H */
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
