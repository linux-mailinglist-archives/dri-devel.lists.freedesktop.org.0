Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A263C7D76FE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 23:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D038110E075;
	Wed, 25 Oct 2023 21:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 631 seconds by postgrey-1.36 at gabe;
 Wed, 25 Oct 2023 21:43:33 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E9F10E075
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 21:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1698270211;
 bh=PSE4xeckRKb3xz86Jk8z81faXilq5QfiYs9qzrlEBgs=;
 b=GDYEI/m1CUdpu3BWilvchZCojANJJCajL1UyT9c8Yxf+a4cBzXM8CuOgczhK4B5jwkV84eE8p
 lvzVw+yNCvjw6tWNpmcKVaoLAllhBWLPN8B49xtkY1ExJouB9sASZx+tQIzgfxBynqP3zoH7cMv
 x6zrPiKPRHvSGfdBNpbZfgbqyaDNoZMRNYs/joL+WT1jVLMCx2CJnchu/lIFabLJ6eEs3fTtm1a
 rrKVg+2O/3vhlqBd3rkLe+gS3ZPw8N1U5vs1Oc7ZiFlKztYqMIOa0nAYRlVR6r0mserBJxnB7sS
 EKfr/gxmFIIlbDRo7d+lWhJ+o0IYL3ceUzyc4HBsACwA==
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/rockchip: vop2: Add NV20 and NV30 support
Date: Wed, 25 Oct 2023 21:32:46 +0000
Message-ID: <20231025213248.2641962-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 65398986da73b54fc2dc42e3
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
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>,
 Christopher Obbard <chris.obbard@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the 10-bit 4:2:2 and 4:4:4 formats NV20 and NV30.

These formats can be tested using modetest [1]:

  modetest -P <plane_id>@<crtc_id>:1920x1080@<format>

e.g. on a ROCK 3 Model A (rk3568):

  modetest -P 43@67:1920x1080@NV20 -F tiles,tiles
  modetest -P 43@67:1920x1080@NV30 -F smpte,smpte

[1] https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/329

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 5 +++++
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index ab944010fe14..592f9d726f2e 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -326,11 +326,14 @@ static enum vop2_data_format vop2_convert_format(u32 format)
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV61:
 		return VOP2_FMT_YUV422SP;
+	case DRM_FORMAT_NV20:
 	case DRM_FORMAT_Y210:
 		return VOP2_FMT_YUV422SP_10;
 	case DRM_FORMAT_NV24:
 	case DRM_FORMAT_NV42:
 		return VOP2_FMT_YUV444SP;
+	case DRM_FORMAT_NV30:
+		return VOP2_FMT_YUV444SP_10;
 	case DRM_FORMAT_YUYV:
 	case DRM_FORMAT_YVYU:
 		return VOP2_FMT_VYUY422;
@@ -415,6 +418,8 @@ static bool vop2_win_uv_swap(u32 format)
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV24:
 	case DRM_FORMAT_NV15:
+	case DRM_FORMAT_NV20:
+	case DRM_FORMAT_NV30:
 	case DRM_FORMAT_YUYV:
 	case DRM_FORMAT_UYVY:
 		return true;
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index fdb48571efce..0b4280218a59 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -48,8 +48,10 @@ static const uint32_t formats_rk356x_esmart[] = {
 	DRM_FORMAT_NV15, /* yuv420_10bit linear mode, 2 plane, no padding */
 	DRM_FORMAT_NV16, /* yuv422_8bit linear mode, 2 plane */
 	DRM_FORMAT_NV61, /* yuv422_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV20, /* yuv422_10bit linear mode, 2 plane, no padding */
 	DRM_FORMAT_NV24, /* yuv444_8bit linear mode, 2 plane */
 	DRM_FORMAT_NV42, /* yuv444_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV30, /* yuv444_10bit linear mode, 2 plane, no padding */
 	DRM_FORMAT_YVYU, /* yuv422_8bit[YVYU] linear mode */
 	DRM_FORMAT_VYUY, /* yuv422_8bit[VYUY] linear mode */
 };
-- 
2.42.0

