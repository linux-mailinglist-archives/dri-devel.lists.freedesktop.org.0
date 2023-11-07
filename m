Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD17D7E3CF5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7570610E559;
	Tue,  7 Nov 2023 12:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2677A10E544;
 Tue,  7 Nov 2023 12:24:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id AD080B8169F;
 Tue,  7 Nov 2023 12:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66DBC433C7;
 Tue,  7 Nov 2023 12:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699359853;
 bh=jANAccXOyM3Ic1M6x3oFrpRUJ4ZWysCN6xLILM3+jqU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=scV/M4fDotDNOYdJF1pDu3PXrIFLyXSG0V/trhtVqPaR9btcyzkBgfBPLbM5t2XB7
 7IJSZpcnLzfSMO7s97FChXMxcsJMaiKJ+VNViBYZvaAQSVHo2K41wRgPwHUPE6k+Tu
 JDTLW4XjlvHTIeRyAtjf9OoXriNPyzpAq0EEZAa30h5Sor4PHXnaGanspEU3Euah0W
 8w/hZ2zgMA6eyQgZgw53EcnHesoC49nGEWwg8eV2eYzd+OPnIxdl8O7PnkQ8CsxSly
 x+7nqv5qulzOK0cr2hLoN92QJqn1ID0FQqB1sgxB3Z8e9Mb/N2r0RG8RbNWYXxrPLf
 w+2CwTVoxkD6g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 02/37] drm/amdkfd: ratelimited SQ interrupt
 messages
Date: Tue,  7 Nov 2023 07:21:13 -0500
Message-ID: <20231107122407.3760584-2-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107122407.3760584-1-sashal@kernel.org>
References: <20231107122407.3760584-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
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
index f0731a6a5306c..02695ccd22d6e 100644
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

