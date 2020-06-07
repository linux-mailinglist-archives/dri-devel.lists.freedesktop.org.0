Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2AD1F0F91
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 22:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AB06E1D5;
	Sun,  7 Jun 2020 20:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from o1.b.az.sendgrid.net (o1.b.az.sendgrid.net [208.117.55.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626C06E1D5
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 20:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:in-reply-to:references:to:cc:content-type:
 content-transfer-encoding;
 s=001; bh=y4cPh0/f3xkxdbgS5qj6WkCOPZvcYGJkTGyjKr6sOYA=;
 b=V/UDgp0fOZoYYqSnEV7WYd1bN1V0iJF7T9go8ZR4/oRHNdJYs8t2JHrHab3Uh36JHfQt
 rnv2kaJZuVnYJDvc1Z6KMDn6Xr9nZEWxXrXNzX9xuz8sZODjxaEVZgfgbMjTwrle+xRbcr
 SAzf6iHLcMiPL9is3bJFs87OEGRim1rxI=
Received: by filterdrecv-p3mdw1-6f5df8956d-dtkn2 with SMTP id
 filterdrecv-p3mdw1-6f5df8956d-dtkn2-21-5EDD4D35-1F
 2020-06-07 20:25:25.615165994 +0000 UTC m=+346301.434158460
Received: from bionic.localdomain (unknown)
 by ismtpd0001p1lon1.sendgrid.net (SG) with ESMTP
 id 8kV6fIRtTkGGPZ3_nSj1Tg Sun, 07 Jun 2020 20:25:25.442 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 1/2] drm: drm_fourcc: add NV20 YUV format
Date: Sun, 07 Jun 2020 20:25:25 +0000 (UTC)
Message-Id: <20200607202521.18438-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607202521.18438-1-jonas@kwiboo.se>
References: <20200607202521.18438-1-jonas@kwiboo.se>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h=2FtF3WwO9txVSXf8F?=
 =?us-ascii?Q?HjIX=2FR2s7i+VJch9=2FwdL08LjEKxGfZ3lRwZHytH?=
 =?us-ascii?Q?crArFghPPbRhR21qGzFBxRRVKhycnM3RBIN3cC4?=
 =?us-ascii?Q?VCAtchCUZqLZF7b8gpgen82NVkb5gGRDdy3vdsJ?=
 =?us-ascii?Q?2dMONTD6bIvhs5P7MEWIZZUnkm0N=2FC7jI6DijeH?=
 =?us-ascii?Q?aDRPfu7VXYnS0Feij11cA=3D=3D?=
To: Sandy Huang <hjc@rock-chips.com>, Heiko =?iso-8859-1?q?St=FCbner?=
 <heiko@sntech.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Ben Davis <ben.davis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM_FORMAT_NV20 is a 2 plane format suitable for linear memory layout.
The format is similar to P210 with 4:2:2 sub-sampling but has no padding
between components. Instead, luminance and chrominance samples are grouped
into 4s so that each group is packed into an integer number of bytes:

YYYY = UVUV = 4 * 10 bits = 40 bits = 5 bytes

The '20' suffix refers to the optimum effective bits per pixel which is
achieved when the total number of luminance samples is a multiple of 4.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/drm_fourcc.c  | 4 ++++
 include/uapi/drm/drm_fourcc.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 722c7ebe4e88..2a9c8ae719ed 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -278,6 +278,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		  .num_planes = 2, .char_per_block = { 5, 5, 0 },
 		  .block_w = { 4, 2, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
 		  .vsub = 2, .is_yuv = true },
+		{ .format = DRM_FORMAT_NV20,		.depth = 0,
+		  .num_planes = 2, .char_per_block = { 5, 5, 0 },
+		  .block_w = { 4, 2, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
+		  .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_Q410,		.depth = 0,
 		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
 		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index b5bf1c0e630e..244d32433a67 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -242,6 +242,7 @@ extern "C" {
  * index 1 = Cr:Cb plane, [39:0] Cr1:Cb1:Cr0:Cb0 little endian
  */
 #define DRM_FORMAT_NV15		fourcc_code('N', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane */
+#define DRM_FORMAT_NV20		fourcc_code('N', 'V', '2', '0') /* 2x1 subsampled Cr:Cb plane */
 
 /*
  * 2 plane YCbCr MSB aligned
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
