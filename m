Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4332462D3C9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 08:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA51F10E556;
	Thu, 17 Nov 2022 07:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A6110E550;
 Thu, 17 Nov 2022 07:07:18 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VV-tMJ4_1668668827; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VV-tMJ4_1668668827) by smtp.aliyun-inc.com;
 Thu, 17 Nov 2022 15:07:12 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 2/2] drm/amd/display: Remove set but unused variable cursor_bpp
Date: Thu, 17 Nov 2022 15:06:55 +0800
Message-Id: <20221117070655.52749-2-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20221117070655.52749-1-jiapeng.chong@linux.alibaba.com>
References: <20221117070655.52749-1-jiapeng.chong@linux.alibaba.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Xinhui.Pan@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Variable cursor_bpp is not effectively used in the function, so delete it.

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hwseq.c:217:10: warning: variable ‘cursor_bpp’ set but not used.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3120
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
index 763311ffb967..311be35de315 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
@@ -214,7 +214,6 @@ static uint32_t dcn32_calculate_cab_allocation(struct dc *dc, struct dc_state *c
 	uint32_t lines_per_way = 0;
 	uint8_t num_ways = 0;
 	uint8_t bytes_per_pixel = 0;
-	uint8_t cursor_bpp = 0;
 	uint16_t mblk_width = 0;
 	uint16_t mblk_height = 0;
 	uint16_t mall_alloc_width_blk_aligned = 0;
@@ -288,19 +287,16 @@ static uint32_t dcn32_calculate_cab_allocation(struct dc *dc, struct dc_state *c
 				switch (pipe->stream->cursor_attributes.color_format) {
 				case CURSOR_MODE_MONO:
 					cursor_size /= 2;
-					cursor_bpp = 4;
 					break;
 				case CURSOR_MODE_COLOR_1BIT_AND:
 				case CURSOR_MODE_COLOR_PRE_MULTIPLIED_ALPHA:
 				case CURSOR_MODE_COLOR_UN_PRE_MULTIPLIED_ALPHA:
 					cursor_size *= 4;
-					cursor_bpp = 4;
 					break;
 
 				case CURSOR_MODE_COLOR_64BIT_FP_PRE_MULTIPLIED:
 				case CURSOR_MODE_COLOR_64BIT_FP_UN_PRE_MULTIPLIED:
 					cursor_size *= 8;
-					cursor_bpp = 8;
 					break;
 				}
 
-- 
2.20.1.7.g153144c

