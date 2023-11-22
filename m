Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4810E7F4C38
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 17:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AF510E67E;
	Wed, 22 Nov 2023 16:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6B210E687;
 Wed, 22 Nov 2023 16:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F4k94dWeA9E9cnOAfUovq7CO/D9PnaeF/xo2VAuyrQ8=; b=nJBdGwjvU0dNBeukokNJqEIt7q
 NFXNy1p2tlY4GBZFgTcFSWqROlfrIIN6rZ7Fv/i6Rk5NFGzjEKS94pUIrnDizTttanSJQrW+0ZY2M
 0rE4g0GrVr+OO/SUHU+45K8EpMIbFv7CIrB5fN4FSl+ULA0QMv0RFyEeA5MSamvEKMYQmrrKzfJGt
 wJ2tSDKWa+Zz+uoXQixgEXr/wiRRdg+le9/bvVarqqJIkIe5atEnnnKwoIVhS7FF+hhsymFhYC1Zb
 en9mBJ6qTNWfs7I0nbkWCwX5u6V0k2A6omOOsr10aFvS56D0zR4/xJHGfY0f9Fsft9RDGzAmgmODI
 E6wV9pMQ==;
Received: from 189-69-166-209.dial-up.telesp.net.br ([189.69.166.209]
 helo=steammachine.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r5pxs-0061lT-RP; Wed, 22 Nov 2023 17:20:37 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/4] drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits
Date: Wed, 22 Nov 2023 13:19:39 -0300
Message-ID: <20231122161941.320564-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231122161941.320564-1-andrealmeid@igalia.com>
References: <20231122161941.320564-1-andrealmeid@igalia.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 intel-gfx@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Simon Ser <contact@emersion.fr>

If the driver supports it, allow user-space to supply the
DRM_MODE_PAGE_FLIP_ASYNC flag to request an async page-flip.
Set drm_crtc_state.async_flip accordingly.

Document that drivers will reject atomic commits if an async
flip isn't possible. This allows user-space to fall back to
something else. For instance, Xorg falls back to a blit.
Another option is to wait as close to the next vblank as
possible before performing the page-flip to reduce latency.

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Co-developed-by: André Almeida <andrealmeid@igalia.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v9: dropped atomic_async_page_flip_not_supported
---
 drivers/gpu/drm/drm_atomic_uapi.c | 25 ++++++++++++++++++++++---
 include/uapi/drm/drm_mode.h       |  9 +++++++++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index ed46133a2dd7..de4265423ddc 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1368,6 +1368,18 @@ static void complete_signaling(struct drm_device *dev,
 	kfree(fence_state);
 }
 
+static void
+set_async_flip(struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+	int i;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		crtc_state->async_flip = true;
+	}
+}
+
 int drm_mode_atomic_ioctl(struct drm_device *dev,
 			  void *data, struct drm_file *file_priv)
 {
@@ -1409,9 +1421,13 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	}
 
 	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) {
-		drm_dbg_atomic(dev,
-			       "commit failed: invalid flag DRM_MODE_PAGE_FLIP_ASYNC\n");
-		return -EINVAL;
+		if (!dev->mode_config.async_page_flip) {
+			drm_dbg_atomic(dev,
+				       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not supported\n");
+			return -EINVAL;
+		}
+
+		async_flip = true;
 	}
 
 	/* can't test and expect an event at the same time. */
@@ -1514,6 +1530,9 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	if (ret)
 		goto out;
 
+	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC)
+		set_async_flip(state);
+
 	if (arg->flags & DRM_MODE_ATOMIC_TEST_ONLY) {
 		ret = drm_atomic_check_only(state);
 	} else if (arg->flags & DRM_MODE_ATOMIC_NONBLOCK) {
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 09e7a471ee30..95630f170110 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -957,6 +957,15 @@ struct hdr_output_metadata {
  * Request that the page-flip is performed as soon as possible, ie. with no
  * delay due to waiting for vblank. This may cause tearing to be visible on
  * the screen.
+ *
+ * When used with atomic uAPI, the driver will return an error if the hardware
+ * doesn't support performing an asynchronous page-flip for this update.
+ * User-space should handle this, e.g. by falling back to a regular page-flip.
+ *
+ * Note, some hardware might need to perform one last synchronous page-flip
+ * before being able to switch to asynchronous page-flips. As an exception,
+ * the driver will return success even though that first page-flip is not
+ * asynchronous.
  */
 #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
 #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
-- 
2.42.1

