Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A377E3CB1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2979610E513;
	Tue,  7 Nov 2023 12:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62E010E512;
 Tue,  7 Nov 2023 12:18:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 6C172B811E3;
 Tue,  7 Nov 2023 12:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E0EC433CD;
 Tue,  7 Nov 2023 12:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699359522;
 bh=K00oG+mshpE8EEFrRm7wy4yL4nRymkM8Tj1UMnSaxh4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z+lYj8yydZc91JXyru7G/ld+P/+leD0UKRE3nrRNKj91S4AKf8kylopPAjC9Wn41t
 xxclX5E8J/7WEPfjq9FndTzItAeLUwTwkuM+BwOnup1o8SI1STMqCdpJDpdMcLfFJd
 maCBUgmYJuJEp1HHDGR46BIYrrLrkmDTmv1H43IvwE7/03ERKDHzWT3oxeNnGfHEEA
 yOHhYy4mE+Qf06Sq0emFYEE5HKuoEFdalvPkM7FgaX+Atf9zCSi29qj1xPe2Jl6EsZ
 5eBGQ4hnSU6Zq0yfyHC1TEMQYI5iCTQSv5FgA8Wlbv8CalrAbo5khwK//paf53elfV
 i3uO1xuY5OwxQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 02/40] drm/amdkfd: ratelimited SQ interrupt
 messages
Date: Tue,  7 Nov 2023 07:16:04 -0500
Message-ID: <20231107121837.3759358-2-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107121837.3759358-1-sashal@kernel.org>
References: <20231107121837.3759358-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
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
Cc: Sasha Levin <sashal@kernel.org>, Philip Yang <philip.yang@amd.com>,
 Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>

[ Upstream commit 37fb87910724f21a1f27a75743d4f9accdee77fb ]

No functional change. Use ratelimited version of pr_ to avoid
overflowing of dmesg buffer

Signed-off-by: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Reviewed-by: Philip Yang <philip.yang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c | 6 +++---
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c | 6 +++---
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c  | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c
index c7991e07b6be5..a7697ec8188e0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c
@@ -268,7 +268,7 @@ static void event_interrupt_wq_v10(struct kfd_node *dev,
 						SQ_INTERRUPT_WORD_WAVE_CTXID1, ENCODING);
 			switch (encoding) {
 			case SQ_INTERRUPT_WORD_ENCODING_AUTO:
-				pr_debug(
+				pr_debug_ratelimited(
 					"sq_intr: auto, se %d, ttrace %d, wlt %d, ttrac_buf0_full %d, ttrac_buf1_full %d, ttrace_utc_err %d\n",
 					REG_GET_FIELD(context_id1, SQ_INTERRUPT_WORD_AUTO_CTXID1,
 							SE_ID),
@@ -284,7 +284,7 @@ static void event_interrupt_wq_v10(struct kfd_node *dev,
 							THREAD_TRACE_UTC_ERROR));
 				break;
 			case SQ_INTERRUPT_WORD_ENCODING_INST:
-				pr_debug("sq_intr: inst, se %d, data 0x%x, sa %d, priv %d, wave_id %d, simd_id %d, wgp_id %d\n",
+				pr_debug_ratelimited("sq_intr: inst, se %d, data 0x%x, sa %d, priv %d, wave_id %d, simd_id %d, wgp_id %d\n",
 					REG_GET_FIELD(context_id1, SQ_INTERRUPT_WORD_WAVE_CTXID1,
 							SE_ID),
 					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID0,
@@ -310,7 +310,7 @@ static void event_interrupt_wq_v10(struct kfd_node *dev,
 			case SQ_INTERRUPT_WORD_ENCODING_ERROR:
 				sq_intr_err_type = REG_GET_FIELD(context_id0, KFD_CTXID0,
 								ERR_TYPE);
-				pr_warn("sq_intr: error, se %d, data 0x%x, sa %d, priv %d, wave_id %d, simd_id %d, wgp_id %d, err_type %d\n",
+				pr_warn_ratelimited("sq_intr: error, se %d, data 0x%x, sa %d, priv %d, wave_id %d, simd_id %d, wgp_id %d, err_type %d\n",
 					REG_GET_FIELD(context_id1, SQ_INTERRUPT_WORD_WAVE_CTXID1,
 							SE_ID),
 					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID0,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
index f933bd231fb9c..2a65792fd1162 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
@@ -150,7 +150,7 @@ enum SQ_INTERRUPT_ERROR_TYPE {
 
 static void print_sq_intr_info_auto(uint32_t context_id0, uint32_t context_id1)
 {
-	pr_debug(
+	pr_debug_ratelimited(
 		"sq_intr: auto, ttrace %d, wlt %d, ttrace_buf_full %d, reg_tms %d, cmd_tms %d, host_cmd_ovf %d, host_reg_ovf %d, immed_ovf %d, ttrace_utc_err %d\n",
 		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID0, THREAD_TRACE),
 		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID0, WLT),
@@ -165,7 +165,7 @@ static void print_sq_intr_info_auto(uint32_t context_id0, uint32_t context_id1)
 
 static void print_sq_intr_info_inst(uint32_t context_id0, uint32_t context_id1)
 {
-	pr_debug(
+	pr_debug_ratelimited(
 		"sq_intr: inst, data 0x%08x, sh %d, priv %d, wave_id %d, simd_id %d, wgp_id %d\n",
 		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID0, DATA),
 		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID0, SH_ID),
@@ -177,7 +177,7 @@ static void print_sq_intr_info_inst(uint32_t context_id0, uint32_t context_id1)
 
 static void print_sq_intr_info_error(uint32_t context_id0, uint32_t context_id1)
 {
-	pr_warn(
+	pr_warn_ratelimited(
 		"sq_intr: error, detail 0x%08x, type %d, sh %d, priv %d, wave_id %d, simd_id %d, wgp_id %d\n",
 		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_ERROR_CTXID0, DETAIL),
 		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_ERROR_CTXID0, TYPE),
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
index 830396b1c3b14..27cdaea405017 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
@@ -333,7 +333,7 @@ static void event_interrupt_wq_v9(struct kfd_node *dev,
 			encoding = REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID, ENCODING);
 			switch (encoding) {
 			case SQ_INTERRUPT_WORD_ENCODING_AUTO:
-				pr_debug(
+				pr_debug_ratelimited(
 					"sq_intr: auto, se %d, ttrace %d, wlt %d, ttrac_buf_full %d, reg_tms %d, cmd_tms %d, host_cmd_ovf %d, host_reg_ovf %d, immed_ovf %d, ttrace_utc_err %d\n",
 					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID, SE_ID),
 					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID, THREAD_TRACE),
@@ -347,7 +347,7 @@ static void event_interrupt_wq_v9(struct kfd_node *dev,
 					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID, THREAD_TRACE_UTC_ERROR));
 				break;
 			case SQ_INTERRUPT_WORD_ENCODING_INST:
-				pr_debug("sq_intr: inst, se %d, data 0x%x, sh %d, priv %d, wave_id %d, simd_id %d, cu_id %d, intr_data 0x%x\n",
+				pr_debug_ratelimited("sq_intr: inst, se %d, data 0x%x, sh %d, priv %d, wave_id %d, simd_id %d, cu_id %d, intr_data 0x%x\n",
 					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID, SE_ID),
 					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID, DATA),
 					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID, SH_ID),
@@ -366,7 +366,7 @@ static void event_interrupt_wq_v9(struct kfd_node *dev,
 				break;
 			case SQ_INTERRUPT_WORD_ENCODING_ERROR:
 				sq_intr_err = REG_GET_FIELD(sq_int_data, KFD_SQ_INT_DATA, ERR_TYPE);
-				pr_warn("sq_intr: error, se %d, data 0x%x, sh %d, priv %d, wave_id %d, simd_id %d, cu_id %d, err_type %d\n",
+				pr_warn_ratelimited("sq_intr: error, se %d, data 0x%x, sh %d, priv %d, wave_id %d, simd_id %d, cu_id %d, err_type %d\n",
 					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID, SE_ID),
 					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID, DATA),
 					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID, SH_ID),
-- 
2.42.0

