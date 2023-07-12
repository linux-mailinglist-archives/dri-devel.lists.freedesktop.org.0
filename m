Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4843C751093
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 20:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC9610E5C5;
	Wed, 12 Jul 2023 18:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9210C10E5C5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 18:32:11 +0000 (UTC)
Date: Wed, 12 Jul 2023 18:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1689186728; x=1689445928;
 bh=mEcVm4tfMc7/DP4+6fbxFmxZzLDoO289IkjvzjfsIuw=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=wrWRaMFZtVquiFugXS2wZ4Bq5F79XrHEYQlcSGk+VtOdb48KT5gQzOCdZ/elASPiq
 sqaN8ypCmEPm+Xug9ofdFzayqSxGGfjBP8neGo2amwZJvbmRmT7i/GgmNz113/46M3
 s55cFp9R2/t6TRuizV1TwnALMEXr/xPlKnfLp5JrCZ66kAPwet71PECiymlworXfCx
 BwcoB5jgsaZFG5lrJk+v67H8pBd97TKi3LBcai04gwwjTxlN4EBDww41ehh7kRkarv
 34Cbe3KGXuixyAcQEf85ZJzOlyensoLccxq6k/16DjGcMqoIZ+uc39NdHrxicNEj76
 rBrpFHBZogsVg==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/doc: document that PRIME import/export is always supported
Message-ID: <20230712183156.191445-1-contact@emersion.fr>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 6b85aa68d9d5 ("drm: Enable PRIME import/export for all
drivers"), import/export is always supported. Document this so that
user-space knows what to expect.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 include/uapi/drm/drm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index a87bbbbca2d4..56c194df527e 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -673,6 +673,9 @@ struct drm_gem_open {
  * Bitfield of supported PRIME sharing capabilities. See &DRM_PRIME_CAP_IM=
PORT
  * and &DRM_PRIME_CAP_EXPORT.
  *
+ * Starting from kernel version 6.6, both &DRM_PRIME_CAP_IMPORT and
+ * &DRM_PRIME_CAP_EXPORT are always advertised.
+ *
  * PRIME buffers are exposed as dma-buf file descriptors. See
  * Documentation/gpu/drm-mm.rst, section "PRIME Buffer Sharing".
  */
@@ -682,6 +685,8 @@ struct drm_gem_open {
  *
  * If this bit is set in &DRM_CAP_PRIME, the driver supports importing PRI=
ME
  * buffers via the &DRM_IOCTL_PRIME_FD_TO_HANDLE ioctl.
+ *
+ * Starting from kernel version 6.6, this bit is always set in &DRM_CAP_PR=
IME.
  */
 #define  DRM_PRIME_CAP_IMPORT=09=090x1
 /**
@@ -689,6 +694,8 @@ struct drm_gem_open {
  *
  * If this bit is set in &DRM_CAP_PRIME, the driver supports exporting PRI=
ME
  * buffers via the &DRM_IOCTL_PRIME_HANDLE_TO_FD ioctl.
+ *
+ * Starting from kernel version 6.6, this bit is always set in &DRM_CAP_PR=
IME.
  */
 #define  DRM_PRIME_CAP_EXPORT=09=090x2
 /**
--=20
2.41.0


