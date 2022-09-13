Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C025B7121
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 16:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8F310E6FF;
	Tue, 13 Sep 2022 14:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1581310E6FF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 14:43:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14C5C106F;
 Tue, 13 Sep 2022 07:43:25 -0700 (PDT)
Received: from 000377403353.arm.com (000377403353.arm.com [10.2.13.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE8A43F73B;
 Tue, 13 Sep 2022 07:43:16 -0700 (PDT)
From: Brian Starkey <brian.starkey@arm.com>
To: ville.syrjala@linux.intel.com,
	butterflyhuangxx@gmail.com
Subject: [PATCH] drm/fourcc: Fix vsub/hsub for Q410 and Q401
Date: Tue, 13 Sep 2022 15:43:06 +0100
Message-Id: <20220913144306.17279-1-brian.starkey@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YyA9Y+Cs8ZCYHXAT@intel.com>
References: <YyA9Y+Cs8ZCYHXAT@intel.com>
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
Cc: tzimmermann@suse.de, jonas@kwiboo.se, airlied@linux.ie, Liviu.Dudau@arm.com,
 linux-kernel@vger.kernel.org, George Kennedy <george.kennedy@oracle.com>,
 dri-devel@lists.freedesktop.org, ben.davis@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These formats are not subsampled, but that means hsub and vsub should be
1, not 0.

Fixes: 94b292b27734 ("drm: drm_fourcc: add NV15, Q410, Q401 YUV formats")
Reported-by: George Kennedy <george.kennedy@oracle.com>
Reported-by: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Signed-off-by: Brian Starkey <brian.starkey@arm.com>
---
 drivers/gpu/drm/drm_fourcc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

Sorry, I lost track of this - I thought it got fixed after the previous
thread[1].

-Brian

[1] https://lore.kernel.org/all/26fdb955-10c8-a5d6-07b6-85a4374e7754@oracle.com/

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 07741b678798..6768b7d18b6f 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -263,12 +263,12 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		  .vsub = 2, .is_yuv = true },
 		{ .format = DRM_FORMAT_Q410,		.depth = 0,
 		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
-		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
-		  .vsub = 0, .is_yuv = true },
+		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 1,
+		  .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_Q401,		.depth = 0,
 		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
-		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
-		  .vsub = 0, .is_yuv = true },
+		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 1,
+		  .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
 		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
 		  .hsub = 2, .vsub = 2, .is_yuv = true},
-- 
2.25.1

