Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D355269953A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 14:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD4E10ED68;
	Thu, 16 Feb 2023 13:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6921210ED6E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 13:09:56 +0000 (UTC)
Date: Thu, 16 Feb 2023 13:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1676552994; x=1676812194;
 bh=yE4Ciu1ij80T+R1ISnn6vA5k6dllMDFoXG+eBlAHzz0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=NCtDnz7hASCgSZhUzekTXf4TWchMiQ56YUU8R9284/i5LcpFNQHa7+hXmtBgDRz++
 saE2EHaR2Dqz7dgurJ310EN8Lc099Mp8wuFaDKD5OoKPfg1Jg+l81Ho8cvckP7lwSk
 qharhc9jyiQwhUi4OpxtmQlOhFdP9DrYbAb6pY+ONzxqHGFM6QTngNmOD+5UTmDaG6
 nYCZH8X3w5pf1w+/BhcNOxJMPJTlGvk15fO1uLX8WfnfKYlO/M2hbv+1/B7QxuruCW
 geaU8UdjHvmP3k2f70JJt2NoG0+QlVv+iOGqKUWc2RzUIQyVqdvmXO/iRL9ljYiBCo
 3SnOOts+zbS/Q==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 2/2] drm: document DRM_IOCTL_GEM_CLOSE
Message-ID: <20230216130934.156541-2-contact@emersion.fr>
In-Reply-To: <20230216130934.156541-1-contact@emersion.fr>
References: <20230216130934.156541-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a bit tricky, because of the ref'counting considerations.
See also [1] for more discussion about this topic. Since this is
kernel docs, I've decided to elaborate a bit less on the user-space
details.

[1]: https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/110

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Daniel Stone <daniel@fooishbar.org>
---
 include/uapi/drm/drm.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 54b2313c8332..4829f1fa9570 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -972,6 +972,19 @@ extern "C" {
 #define DRM_IOCTL_GET_STATS             DRM_IOR( 0x06, struct drm_stats)
 #define DRM_IOCTL_SET_VERSION=09=09DRM_IOWR(0x07, struct drm_set_version)
 #define DRM_IOCTL_MODESET_CTL           DRM_IOW(0x08, struct drm_modeset_c=
tl)
+/**
+ * DRM_IOCTL_GEM_CLOSE - Close a GEM handle.
+ *
+ * GEM handles are not reference-counted by the kernel. User-space is
+ * responsible for managing their lifetime. For example, if user-space imp=
orts
+ * the same memory object twice on the same DRM file description, the same=
 GEM
+ * handle is returned by both imports, and user-space needs to ensure
+ * &DRM_IOCTL_GEM_CLOSE is performed once only. The same situation can hap=
pen
+ * when a memory object is allocated, then exported and imported again on =
the
+ * same DRM file description. The &DRM_IOCTL_MODE_GETFB2 IOCTL is an excep=
tion
+ * and always returns fresh new GEM handles even if an existing GEM handle
+ * already refers to the same memory object before the IOCTL is performed.
+ */
 #define DRM_IOCTL_GEM_CLOSE=09=09DRM_IOW (0x09, struct drm_gem_close)
 #define DRM_IOCTL_GEM_FLINK=09=09DRM_IOWR(0x0a, struct drm_gem_flink)
 #define DRM_IOCTL_GEM_OPEN=09=09DRM_IOWR(0x0b, struct drm_gem_open)
--=20
2.39.1


