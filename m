Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF540444AE5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 23:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8853F7ABD3;
	Wed,  3 Nov 2021 22:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716487ABD2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 22:31:27 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id b13so3993402plg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 15:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wYuh1JY2j6LUOSTdqyWesZ0R/Q+mBuPiwKHvgPQt+68=;
 b=G/B3rxka7UN4c6zf8gYuxii9Qwd9no3+m+kLb94LFVc3JKwJlMEPU2wxhRRbATpHfN
 wHkjJ26kzj4Jkg7MbNuppZUX1ABhA5WkGKEptJKiiloJgl6oMSfvL2JFOJaxuoE3txIn
 pXuo6auKkl8DQCdZSVSgVrLMYdfjL6z9+o7LI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wYuh1JY2j6LUOSTdqyWesZ0R/Q+mBuPiwKHvgPQt+68=;
 b=xBuniWJsMns5qkpOGsVFS62HB6FStUI6QygPDwoYLzc4akdNlXQQDybfGWxat3mQIA
 WHRCUwzTQ7Ik0Tc9vK9WJw3aNziXaOTTRP5qNcPP207b8/2wUwUvDw4G67VxqU3GQcWQ
 ECUXvXSj3fbVW/NyYWzH90RxDkzKQz0OzelMpTtyyrljRL4cCj3lPRfL7V31zzPwyBIG
 sGoWnBcuAbeiBD0kcIC0Z2aHpWpfF9otJalYZY86u3zEvkxwzRR2/Gbjv7iQdVHf84sR
 FOdEItrWaKjjKsg4x2r/Sy0AN03vP9hXPd/3V98CDhlG8hq3Bg0Gsaa1JGt9tq/RMvBE
 Xpeg==
X-Gm-Message-State: AOAM532Lw+xhQxrOCksweMFlqkuimmrkKa1Cg940oa2J8vHnQcbnfS8v
 Jdygo66KeedXOyfdPSf13b39Pg==
X-Google-Smtp-Source: ABdhPJwj3QFK3X8rRdGJf8MTmYNgv50bk2p3Le7VnOeB8x8pGV3kxUC0IhqOQLkuVMyU13+3e2zYSw==
X-Received: by 2002:a17:90a:cb98:: with SMTP id
 a24mr17742425pju.153.1635978687072; 
 Wed, 03 Nov 2021 15:31:27 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:8d42:7991:8f12:2672])
 by smtp.gmail.com with ESMTPSA id f16sm3657259pfe.172.2021.11.03.15.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 15:31:26 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH] drm/msm/a6xx: Allocate enough space for GMU registers
Date: Wed,  3 Nov 2021 15:31:08 -0700
Message-Id: <20211103153049.1.Idfa574ccb529d17b69db3a1852e49b580132035c@changeid>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In commit 142639a52a01 ("drm/msm/a6xx: fix crashstate capture for
A650") we changed a6xx_get_gmu_registers() to read 3 sets of
registers. Unfortunately, we didn't change the memory allocation for
the array. That leads to a KASAN warning (this was on the chromeos-5.4
kernel, which has the problematic commit backported to it):

  BUG: KASAN: slab-out-of-bounds in _a6xx_get_gmu_registers+0x144/0x430
  Write of size 8 at addr ffffff80c89432b0 by task A618-worker/209
  CPU: 5 PID: 209 Comm: A618-worker Tainted: G        W         5.4.156-lockdep #22
  Hardware name: Google Lazor Limozeen without Touchscreen (rev5 - rev8) (DT)
  Call trace:
   dump_backtrace+0x0/0x248
   show_stack+0x20/0x2c
   dump_stack+0x128/0x1ec
   print_address_description+0x88/0x4a0
   __kasan_report+0xfc/0x120
   kasan_report+0x10/0x18
   __asan_report_store8_noabort+0x1c/0x24
   _a6xx_get_gmu_registers+0x144/0x430
   a6xx_gpu_state_get+0x330/0x25d4
   msm_gpu_crashstate_capture+0xa0/0x84c
   recover_worker+0x328/0x838
   kthread_worker_fn+0x32c/0x574
   kthread+0x2dc/0x39c
   ret_from_fork+0x10/0x18

  Allocated by task 209:
   __kasan_kmalloc+0xfc/0x1c4
   kasan_kmalloc+0xc/0x14
   kmem_cache_alloc_trace+0x1f0/0x2a0
   a6xx_gpu_state_get+0x164/0x25d4
   msm_gpu_crashstate_capture+0xa0/0x84c
   recover_worker+0x328/0x838
   kthread_worker_fn+0x32c/0x574
   kthread+0x2dc/0x39c
   ret_from_fork+0x10/0x18

Fixes: 142639a52a01 ("drm/msm/a6xx: fix crashstate capture for A650")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I don't actually know how to trigger a GPU crash. I just happened to
trigger one by getting "lucky" and hitting a timeout after being in
kdb. Thus this is just compile tested. However, it looks pretty sane
to me. ;-)

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 7501849ed15d..6e90209cd543 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -777,12 +777,12 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
 	a6xx_state->gmu_registers = state_kcalloc(a6xx_state,
-		2, sizeof(*a6xx_state->gmu_registers));
+		3, sizeof(*a6xx_state->gmu_registers));
 
 	if (!a6xx_state->gmu_registers)
 		return;
 
-	a6xx_state->nr_gmu_registers = 2;
+	a6xx_state->nr_gmu_registers = 3;
 
 	/* Get the CX GMU registers from AHB */
 	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[0],
-- 
2.33.1.1089.g2158813163f-goog

