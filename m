Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 348E373445E
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 00:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9A388A27;
	Sat, 17 Jun 2023 22:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Sat, 17 Jun 2023 22:28:17 UTC
Received: from s.wrqvtzvf.outbound-mail.sendgrid.net
 (s.wrqvtzvf.outbound-mail.sendgrid.net [149.72.126.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C5510E0A1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 22:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:in-reply-to:references:mime-version:to:cc:
 content-transfer-encoding:content-type:cc:content-type:from:subject:to;
 s=s1; bh=knW5hfOdRlNb6ad4KcvWMFXEOrQEnk5DYqTPo5HmSZE=;
 b=Lcs4O2j3t0Zya8gHh1y5Xz1vPnnl19E8vEuvH6W8bEEnX+iTrflGvDeo1iZzMttdvVL+
 98xgNX3tnCR8MrbFidbigyG/aE4uhdKJDEp0YEq++j+djJJlE/DWVKJ4NczNF+N/3DFhyw
 VtLIdf3jFLfBo4Uzv6ppFPZdBJBEDPq1fsZAcxAu66me8wCPAxwun24TTtffKiNE8jqg39
 amqDdIg9yeNRgixtwQ45aS3cCHoKVNRmlGPfRK65vQ6RswoMdT5lVyUIVkstnKvLcAXpkB
 //k+G6QHah1WTLcZ0Z1XQL6P2OivTVqscp00Gi5avguR1rdChqWbf+40lYB4AvQg==
Received: by filterdrecv-66949dbc98-dbt7m with SMTP id
 filterdrecv-66949dbc98-dbt7m-1-648E3250-7
 2023-06-17 22:23:12.210230445 +0000 UTC m=+3278605.771189366
Received: from bionic.localdomain (unknown) by geopod-ismtpd-1 (SG) with ESMTP
 id 4XYLAl6XSH2KsNiMfk1_gA Sat, 17 Jun 2023 22:23:12.024 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 1/2] drm/fourcc: Add NV20 and NV30 YUV formats
Date: Sat, 17 Jun 2023 22:23:12 +0000 (UTC)
Message-Id: <20230617222307.3145714-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230617222307.3145714-1-jonas@kwiboo.se>
References: <20230617222307.3145714-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h=2FnEEJCFmPMWB71Ft?=
 =?us-ascii?Q?+V7t0A=2FzSB2WM2Yr+B+lLlEGl35eOZtuuZWJsdu?=
 =?us-ascii?Q?F1uSpyKMXxuqrraykNbNcSNPUH9XsC0GuueKSit?=
 =?us-ascii?Q?m+tIklElypSvMDKs68jgjfS4mo19puKb72Fqs4G?=
 =?us-ascii?Q?Mxfnxw1rDUlgds8Hbmn+vLYk=2FrKWKl3RXMMAB+?=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Sandy Huang
 <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
X-Entity-ID: P7KYpSJvGCELWjBME/J5tg==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
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
Cc: linux-rockchip@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM_FORMAT_NV20 and DRM_FORMAT_NV30 formats is the 2x1 and non-subsampled
variant of NV15, a 10-bit 2-plane YUV format that has no padding between
components. Instead, luminance and chrominance samples are grouped into 4s
so that each group is packed into an integer number of bytes:

YYYY = UVUV = 4 * 10 bits = 40 bits = 5 bytes

The '20' and '30' suffix refers to the optimum effective bits per pixel
which is achieved when the total number of luminance samples is a multiple
of 4.

V2: Added NV30 format

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Sandy Huang <hjc@rock-chips.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 8 ++++++++
 include/uapi/drm/drm_fourcc.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 0f17dfa8702b..193cf8ed7912 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -299,6 +299,14 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		  .num_planes = 2, .char_per_block = { 5, 5, 0 },
 		  .block_w = { 4, 2, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
 		  .vsub = 2, .is_yuv = true },
+		{ .format = DRM_FORMAT_NV20,		.depth = 0,
+		  .num_planes = 2, .char_per_block = { 5, 5, 0 },
+		  .block_w = { 4, 2, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
+		  .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_NV30,		.depth = 0,
+		  .num_planes = 2, .char_per_block = { 5, 5, 0 },
+		  .block_w = { 4, 2, 0 }, .block_h = { 1, 1, 0 }, .hsub = 1,
+		  .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_Q410,		.depth = 0,
 		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
 		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 1,
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 8db7fd3f743e..3151f1fc7ebb 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -323,6 +323,8 @@ extern "C" {
  * index 1 = Cr:Cb plane, [39:0] Cr1:Cb1:Cr0:Cb0 little endian
  */
 #define DRM_FORMAT_NV15		fourcc_code('N', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane */
+#define DRM_FORMAT_NV20		fourcc_code('N', 'V', '2', '0') /* 2x1 subsampled Cr:Cb plane */
+#define DRM_FORMAT_NV30		fourcc_code('N', 'V', '3', '0') /* non-subsampled Cr:Cb plane */
 
 /*
  * 2 plane YCbCr MSB aligned
-- 
2.40.1

