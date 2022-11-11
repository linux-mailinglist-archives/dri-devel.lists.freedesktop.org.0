Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8C162634A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 21:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6313910E8CC;
	Fri, 11 Nov 2022 20:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC21510E0CE
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 19:50:15 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id h24so3246435qta.9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 11:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YU/dVE0ERRRiwLc0HKRhu2fVlyQiYjgDvyxIAHOZXz8=;
 b=UTwWvPMR4j2f2p7up8Le/KvMZlwgGMWDnXQ8RcwwGzzkoHuyjeJwmie5C9GVXHQOeM
 4nOE7CQbS2Rp5oNTgauj01OBG+ZZjUdaZ0z0IfnaKX4HNjv6IZ2fHaOWlPCl9B5mridB
 2dt9pYevIUdALZ+hmKfj0ybst/f34okv6UyGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YU/dVE0ERRRiwLc0HKRhu2fVlyQiYjgDvyxIAHOZXz8=;
 b=eu0hfSscfIaPGi1eW6PcJS6A8XSe43FCIRhYMrGrWLq6SIuTp5jKBjOKkulbpkC4Eq
 olG/G2J3RDIxmi4pPqxcDWxEJdzoQhdNkZxU0aP7oh0zjIHldz/1a/xebZiRKLeLxCdx
 bs6QFOsWdRbpvb8A+F3C5JJ3NdZV4EkP4kvQmTdsmEeI2XMus3Cy6ndphRaL8qy8HJYu
 yL+5ePPg0M+OxeeZIxMgMn6uvLlemmM9GMOhijv1AkuRQsi6gFIiz2fa6Vlkjf2dLk+/
 97GiQicT7BDF7kcZXskfmtFH3mbMIhYG+w0vts8nPE9StGMi/X/WutNBIHHc+C0RheMG
 BXzg==
X-Gm-Message-State: ANoB5pk6WYaREfOyp2apV8FB9Lgs3BAbbpPYqH4mbw6YhSHeqcKnecFk
 u/nsS7yGvLVsVqUdfD/zVjCwiA==
X-Google-Smtp-Source: AA0mqf4f379m8qQ4NDG8WIoePs17+iR7zz+GPC8xaMp8RokfgQW72ZP6ejmf+n05qXiKrn00RS9fgw==
X-Received: by 2002:a05:622a:5083:b0:3a5:404:4c36 with SMTP id
 fp3-20020a05622a508300b003a504044c36mr2767678qtb.653.1668196214671; 
 Fri, 11 Nov 2022 11:50:14 -0800 (PST)
Received: from joelboxx.c.googlers.com.com
 (228.221.150.34.bc.googleusercontent.com. [34.150.221.228])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a05620a25cb00b006ef1a8f1b81sm1985277qko.5.2022.11.11.11.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 11:50:13 -0800 (PST)
From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] adreno: Shutdown the GPU properly
Date: Fri, 11 Nov 2022 19:49:56 +0000
Message-Id: <20221111194957.4046771-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.38.1.493.g58b659f92b-goog
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

During kexec on ARM device, we notice that device_shutdown() only calls
pm_runtime_force_suspend() while shutting down the GPU. This means the GPU
kthread is still running and further, there maybe active submits.

This causes all kinds of issues during a kexec reboot:

Warning from shutdown path:

[  292.509662] WARNING: CPU: 0 PID: 6304 at [...] adreno_runtime_suspend+0x3c/0x44
[  292.509863] Hardware name: Google Lazor (rev3 - 8) with LTE (DT)
[  292.509872] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  292.509881] pc : adreno_runtime_suspend+0x3c/0x44
[  292.509891] lr : pm_generic_runtime_suspend+0x30/0x44
[  292.509905] sp : ffffffc014473bf0
[...]
[  292.510043] Call trace:
[  292.510051]  adreno_runtime_suspend+0x3c/0x44
[  292.510061]  pm_generic_runtime_suspend+0x30/0x44
[  292.510071]  pm_runtime_force_suspend+0x54/0xc8
[  292.510081]  adreno_shutdown+0x1c/0x28
[  292.510090]  platform_shutdown+0x2c/0x38
[  292.510104]  device_shutdown+0x158/0x210
[  292.510119]  kernel_restart_prepare+0x40/0x4c

And here from GPU kthread, an SError OOPs:

[  192.648789]  el1h_64_error+0x7c/0x80
[  192.648812]  el1_interrupt+0x20/0x58
[  192.648833]  el1h_64_irq_handler+0x18/0x24
[  192.648854]  el1h_64_irq+0x7c/0x80
[  192.648873]  local_daif_inherit+0x10/0x18
[  192.648900]  el1h_64_sync_handler+0x48/0xb4
[  192.648921]  el1h_64_sync+0x7c/0x80
[  192.648941]  a6xx_gmu_set_oob+0xbc/0x1fc
[  192.648968]  a6xx_hw_init+0x44/0xe38
[  192.648991]  msm_gpu_hw_init+0x48/0x80
[  192.649013]  msm_gpu_submit+0x5c/0x1a8
[  192.649034]  msm_job_run+0xb0/0x11c
[  192.649058]  drm_sched_main+0x170/0x434
[  192.649086]  kthread+0x134/0x300
[  192.649114]  ret_from_fork+0x10/0x20

Fix by calling adreno_system_suspend() in the device_shutdown() path.

Cc: Rob Clark <robdclark@chromium.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
Cc: Ross Zwisler <zwisler@kernel.org>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 24b489b6129a..f0cff62812c3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -607,9 +607,12 @@ static int adreno_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int adreno_system_suspend(struct device *dev);
 static void adreno_shutdown(struct platform_device *pdev)
 {
-	pm_runtime_force_suspend(&pdev->dev);
+	struct msm_gpu *gpu = dev_to_gpu(&pdev->dev);
+
+	WARN_ON_ONCE(adreno_system_suspend(&pdev->dev));
 }
 
 static const struct of_device_id dt_match[] = {
-- 
2.38.1.493.g58b659f92b-goog

