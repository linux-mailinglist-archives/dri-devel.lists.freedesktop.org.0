Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC271A69EC4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 04:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26A610E02F;
	Thu, 20 Mar 2025 03:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB0F10E02F;
 Thu, 20 Mar 2025 03:28:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.141.245])
 by APP-03 (Coremail) with SMTP id rQCowAC3vQ1Ai9tniwnXFg--.12911S2;
 Thu, 20 Mar 2025 11:28:05 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
 stable@vger.kernel.org
Subject: [PATCH] drm/amd/display: Add dp_decide_lane_settings() to ensure
 compatibility
Date: Thu, 20 Mar 2025 11:27:25 +0800
Message-ID: <20250320032725.909-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAC3vQ1Ai9tniwnXFg--.12911S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4UGr1DuryxWr4UAr1xGrg_yoW8ur4Dpa
 18KFyDJF1UtrW0qa98tF1I9rW5Wa18C3y7Ar9rGasYyry5AF1Ik3y5Cr9Fkr9rGFWkA3yY
 q3W8Ca1Duwn0kFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
 xVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r48MxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
 w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
 0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb7DG7UUUUU==
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQ4HA2fbeH5JuwAAsL
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

The dp_perform_128b_132b_channel_eq_done_sequence() calls
dp_get_lane_status_and_lane_adjust() but lacks dp_decide_lane_settings().
The dp_get_lane_status_and_lane_adjust() and dp_decide_lane_settings()
functions are essential for DisplayPort link training in the Linux kernel,
with the former retrieving lane status and adjustment needs, and the
latter determining optimal lane configurations. This omission risks
compatibility issues, particularly with lower-quality cables or displays,
as the system cannot dynamically adjust to hardware limitations,
potentially leading to failed connections. Add dp_decide_lane_settings()
to enable adaptive lane configuration.

Fixes: 630168a97314 ("drm/amd/display: move dp link training logic to link_dp_training")
Cc: stable@vger.kernel.org # 6.3+
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 .../amd/display/dc/link/protocols/link_dp_training_128b_132b.c  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_128b_132b.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_128b_132b.c
index db87cfe37b5c..99aae3e43106 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_128b_132b.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_128b_132b.c
@@ -176,6 +176,8 @@ static enum link_training_result dp_perform_128b_132b_cds_done_sequence(
 		wait_time += lt_settings->cds_pattern_time;
 		status = dp_get_lane_status_and_lane_adjust(link, lt_settings, dpcd_lane_status,
 						&dpcd_lane_status_updated, dpcd_lane_adjust, DPRX);
+		dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
+				lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
 		if (status != DC_OK) {
 			result = LINK_TRAINING_ABORT;
 		} else if (dp_is_symbol_locked(lt_settings->link_settings.lane_count, dpcd_lane_status) &&
-- 
2.42.0.windows.2

