Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15240626349
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 21:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0366810E8C6;
	Fri, 11 Nov 2022 20:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50AF10E8AD
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 19:50:16 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id l2so3242618qtq.11
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 11:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1KH+9DnybePERv04muJMWfidDb3fPimLOhb4bQHi9hY=;
 b=RHjf12jHGHZlV6LxazAvl/5fZwStrXPkGDsdKj20bcVMeSXNquWMtMx/Bsdq/o5JYm
 eAfmViLAt2OLTkbQbsClDh4FCyBu1w5nu3AzI7kME+tNrhg4OayMskXk5hBLP5WSLQYN
 vTRUqiZVfCQevVB5j1H2sbOljVncceXkIvv5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1KH+9DnybePERv04muJMWfidDb3fPimLOhb4bQHi9hY=;
 b=o6cqA1ICD81wV0aTSJrc1BetkJCwuQ0YfyW/S6ALKcrQkaHanMcEw1SypzPZJglAeS
 7li6gm12jvIF528Ukx1uRhvAgFsREPG89bNwis+cSEmfyfnpr9+PDfu8mxl/NthFq5Jo
 aSFagP0cfdEJNmiSybdt7vD/5dbSkNryNZYj9SUeZS6z3I2ovj6kt4mXVAStt+6C6jWr
 niekYmvFnAD5zMFq4dXmSzjHRfgf5K6owfzCbR6D13DQh20kcBh18lAzJFEmgw35MTZ4
 8dM6FgmEE/Y9wdkTgm/rgg1O1JQbQwjWajCbtnPwBQ5wlyLJcbSOxEI3kVczsWVEKevZ
 jvFg==
X-Gm-Message-State: ANoB5pnbNYDWS0oXuPee3tXtIjipHARBuQWJC84gbaseGClG3G/zrqzg
 om0+Z65Kl7/H+2ICopUxY/K55Q==
X-Google-Smtp-Source: AA0mqf5c6zKhevDvTLNf9Ctrgvya3+388MKGvFGBoi33TAcyrdTqZHtjc+V5gDh69jQ6VTNdJcrmDQ==
X-Received: by 2002:ac8:44d7:0:b0:39c:c7ba:4af4 with SMTP id
 b23-20020ac844d7000000b0039cc7ba4af4mr2862729qto.99.1668196215864; 
 Fri, 11 Nov 2022 11:50:15 -0800 (PST)
Received: from joelboxx.c.googlers.com.com
 (228.221.150.34.bc.googleusercontent.com. [34.150.221.228])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a05620a25cb00b006ef1a8f1b81sm1985277qko.5.2022.11.11.11.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 11:50:15 -0800 (PST)
From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] adreno: Detect shutdown during get_param()
Date: Fri, 11 Nov 2022 19:49:57 +0000
Message-Id: <20221111194957.4046771-2-joel@joelfernandes.org>
X-Mailer: git-send-email 2.38.1.493.g58b659f92b-goog
In-Reply-To: <20221111194957.4046771-1-joel@joelfernandes.org>
References: <20221111194957.4046771-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 11 Nov 2022 20:58:22 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Ross Zwisler <zwisler@kernel.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even though the GPU is shut down, during kexec reboot we can have userspace
still running. This is especially true if KEXEC_JUMP is not enabled, because we
do not freeze userspace in this case.

To prevent crashes, track that the GPU is shutdown and prevent get_param() from
accessing GPU resources if we find it shutdown.

This fixes the following crash during kexec reboot on an ARM64 device with adreno GPU:

[  292.534314] Kernel panic - not syncing: Asynchronous SError Interrupt
[  292.534323] Hardware name: Google Lazor (rev3 - 8) with LTE (DT)
[  292.534326] Call trace:
[  292.534328]  dump_backtrace+0x0/0x1d4
[  292.534337]  show_stack+0x20/0x2c
[  292.534342]  dump_stack_lvl+0x60/0x78
[  292.534347]  dump_stack+0x18/0x38
[  292.534352]  panic+0x148/0x3b0
[  292.534357]  nmi_panic+0x80/0x94
[  292.534364]  arm64_serror_panic+0x70/0x7c
[  292.534369]  do_serror+0x0/0x7c
[  292.534372]  do_serror+0x54/0x7c
[  292.534377]  el1h_64_error_handler+0x34/0x4c
[  292.534381]  el1h_64_error+0x7c/0x80
[  292.534386]  el1_interrupt+0x20/0x58
[  292.534389]  el1h_64_irq_handler+0x18/0x24
[  292.534395]  el1h_64_irq+0x7c/0x80
[  292.534399]  local_daif_inherit+0x10/0x18
[  292.534405]  el1h_64_sync_handler+0x48/0xb4
[  292.534410]  el1h_64_sync+0x7c/0x80
[  292.534414]  a6xx_gmu_set_oob+0xbc/0x1fc
[  292.534422]  a6xx_get_timestamp+0x40/0xb4
[  292.534426]  adreno_get_param+0x12c/0x1e0
[  292.534433]  msm_ioctl_get_param+0x64/0x70
[  292.534440]  drm_ioctl_kernel+0xe8/0x158
[  292.534448]  drm_ioctl+0x208/0x320
[  292.534453]  __arm64_sys_ioctl+0x98/0xd0
[  292.534461]  invoke_syscall+0x4c/0x118
[  292.534467]  el0_svc_common+0x98/0x104
[  292.534473]  do_el0_svc+0x30/0x80
[  292.534478]  el0_svc+0x20/0x50
[  292.534481]  el0t_64_sync_handler+0x78/0x108
[  292.534485]  el0t_64_sync+0x1a4/0x1a8
[  292.534632] Kernel Offset: 0x1a5f800000 from 0xffffffc008000000
[  292.534635] PHYS_OFFSET: 0x80000000
[  292.534638] CPU features: 0x40018541,a3300e42
[  292.534644] Memory Limit: none

Cc: Rob Clark <robdclark@chromium.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
Cc: Ross Zwisler <zwisler@kernel.org>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 2 +-
 drivers/gpu/drm/msm/msm_gpu.h              | 3 +++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index f0cff62812c3..03d912dc0130 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -612,6 +612,7 @@ static void adreno_shutdown(struct platform_device *pdev)
 {
 	struct msm_gpu *gpu = dev_to_gpu(&pdev->dev);
 
+	gpu->is_shutdown = true;
 	WARN_ON_ONCE(adreno_system_suspend(&pdev->dev));
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 382fb7f9e497..6903c6892469 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -251,7 +251,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 
 	/* No pointer params yet */
-	if (*len != 0)
+	if (*len != 0 || gpu->is_shutdown)
 		return -EINVAL;
 
 	switch (param) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index ff911e7305ce..f18b0a91442b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -214,6 +214,9 @@ struct msm_gpu {
 	/* does gpu need hw_init? */
 	bool needs_hw_init;
 
+	/* is the GPU shutdown? */
+	bool is_shutdown;
+
 	/**
 	 * global_faults: number of GPU hangs not attributed to a particular
 	 * address space
-- 
2.38.1.493.g58b659f92b-goog

