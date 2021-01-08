Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640552EFACC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 22:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1BC6E85E;
	Fri,  8 Jan 2021 21:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2666E85B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 21:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610143138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rY5ZPZc+UpoVk06JLNrDEFfoZnlAUfsw6zwHWZ87dfE=;
 b=Z5WU6gTSOzGFnP4rt+e2CjqpjfwT5BJjQnYj92n8hVLfuI3u5njp7mNOV/0b5wZkEpNlu/
 tJSrk+czOjgrGqLOjdSji1bw7P61Za+1DiFVMU1bOAPyFK/IekaKqBqQU25gxMJygYvj3o
 +qJGSfANmq8cg0eVi/kvTBj/OC9k/3s=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-zd-K_wl2P_y9fx9h0Z0Sxg-1; Fri, 08 Jan 2021 16:58:56 -0500
X-MC-Unique: zd-K_wl2P_y9fx9h0Z0Sxg-1
Received: by mail-io1-f70.google.com with SMTP id a1so8947754ios.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 13:58:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rY5ZPZc+UpoVk06JLNrDEFfoZnlAUfsw6zwHWZ87dfE=;
 b=DdPc9Qdzxw401PaQ3qGqGLDH6ZZQGJuzpYrXNKJv0fh5kehMob3gsc4XidPkGMCaXk
 aePVHUYD/DNImON24jElZP+7la1tbc46LKWm1WTnpfKSqMIn2GuuXm8PGaLCXZTthkZH
 6KVVp2vnkFqJNvBsJ1v93rQ1gQvujZnwDwbcQHfe9Tsk83deJa02MRVM0872TcfOl/kT
 P8S6XuH5ggBBbZr2OV4RCJTKoheXuXaLDkILvJb44dqugBq7XpMEIGA5MWXtmng2upN/
 QrX1g6eJsnG2roXJSt2VV36MhCciQHeNaRUky1H/q9O7rw69/hlSIxirqp9o1sxwHBwx
 FFgQ==
X-Gm-Message-State: AOAM532DQ5BZ3yAOHNKX4TJRo161QiF45zv7NJ1jl5PiWI0tLfaZ8kj4
 QTqAg0ExfVHeTOohGs0DSOf10zHXsGyN7WlV8bVnzc6fPZkAwP5zkoGgWpLkkgP//I0YBnaATzq
 In+4ziVZI/AQ4+BpCwzHArFassnxQ
X-Received: by 2002:a6b:1454:: with SMTP id 81mr7014760iou.96.1610143135589;
 Fri, 08 Jan 2021 13:58:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcL32QS4piiA/+xZFlxxD2vJ8+gVoEA1QeikN8eAe85m5gz3Phc/CaInN+y9uuwjkvaGhbYw==
X-Received: by 2002:a6b:1454:: with SMTP id 81mr7014752iou.96.1610143135364;
 Fri, 08 Jan 2021 13:58:55 -0800 (PST)
Received: from dev.jcline.org ([2605:a601:a63a:4d01:c440:5c61:43ba:350c])
 by smtp.gmail.com with ESMTPSA id h18sm5961873ioh.30.2021.01.08.13.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 13:58:54 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>
Subject: [PATCH] amdgpu: Avoid sleeping during FPU critical sections
Date: Fri,  8 Jan 2021 16:58:38 -0500
Message-Id: <20210108215838.470637-1-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jeremy Cline <jcline@redhat.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dcn20_resource_construct() includes a number of kzalloc(GFP_KERNEL)
calls which can sleep, but kernel_fpu_begin() disables preemption and
sleeping in this context is invalid.

The only places the FPU appears to be required is in the
init_soc_bounding_box() function and when calculating the
{min,max}_fill_clk_mhz. Narrow the scope to just these two parts to
avoid sleeping while using the FPU.

Fixes: 7a8a3430be15 ("amdgpu: Wrap FPU dependent functions in dc20")
Cc: Timothy Pearson <tpearson@raptorengineering.com>
Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index e04ecf0fc0db..a4fa5bf016c1 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -3622,6 +3622,7 @@ static bool init_soc_bounding_box(struct dc *dc,
 	if (bb && ASICREV_IS_NAVI12_P(dc->ctx->asic_id.hw_internal_rev)) {
 		int i;
 
+		DC_FP_START();
 		dcn2_0_nv12_soc.sr_exit_time_us =
 				fixed16_to_double_to_cpu(bb->sr_exit_time_us);
 		dcn2_0_nv12_soc.sr_enter_plus_exit_time_us =
@@ -3721,6 +3722,7 @@ static bool init_soc_bounding_box(struct dc *dc,
 			dcn2_0_nv12_soc.clock_limits[i].dram_speed_mts =
 					fixed16_to_double_to_cpu(bb->clock_limits[i].dram_speed_mts);
 		}
+		DC_FP_END();
 	}
 
 	if (pool->base.pp_smu) {
@@ -3777,8 +3779,6 @@ static bool dcn20_resource_construct(
 	enum dml_project dml_project_version =
 			get_dml_project_version(ctx->asic_id.hw_internal_rev);
 
-	DC_FP_START();
-
 	ctx->dc_bios->regs = &bios_regs;
 	pool->base.funcs = &dcn20_res_pool_funcs;
 
@@ -3959,8 +3959,10 @@ static bool dcn20_resource_construct(
 				ranges.reader_wm_sets[i].wm_inst = i;
 				ranges.reader_wm_sets[i].min_drain_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MIN;
 				ranges.reader_wm_sets[i].max_drain_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MAX;
+				DC_FP_START();
 				ranges.reader_wm_sets[i].min_fill_clk_mhz = (i > 0) ? (loaded_bb->clock_limits[i - 1].dram_speed_mts / 16) + 1 : 0;
 				ranges.reader_wm_sets[i].max_fill_clk_mhz = loaded_bb->clock_limits[i].dram_speed_mts / 16;
+				DC_FP_END();
 
 				ranges.num_reader_wm_sets = i + 1;
 			}
@@ -4125,12 +4127,10 @@ static bool dcn20_resource_construct(
 		pool->base.oem_device = NULL;
 	}
 
-	DC_FP_END();
 	return true;
 
 create_fail:
 
-	DC_FP_END();
 	dcn20_resource_destruct(pool);
 
 	return false;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
