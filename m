Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A2C7D596B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 19:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5059410E438;
	Tue, 24 Oct 2023 17:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6821410E437;
 Tue, 24 Oct 2023 17:08:16 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1ca74e77aecso41802595ad.1; 
 Tue, 24 Oct 2023 10:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698167295; x=1698772095; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L1FF1gJxqcl+lR8fc3NGAGh6ZriqzXwUPpSOpQVAdLg=;
 b=DsvaGXu3kh/a7ecm7OWwSWTqFg8QL6vcwwcaae+2NTgYVuVDNeNd3reptd45FO47SD
 bR/RbjFJx2akosSSW+XCX207cYajUhu7H11zmcTgamq+HjPIYMm4r6tFy+OIs2VVSPcr
 HAk8sOWGvruBJTDu2mZkB7jVY8QeYlIIyDubDIr/OBqAv1nBK1a9Q2O+o16nlqb/nOqZ
 lVM/ke7O4b0ehmFuKaj6URiLt1d1WIALn3Z5eLXsH0r0DDmgxhOZrA1CJThWJ7zJeihT
 5PsVAzJT5jlzTA1huucaVrFBICOfAwrTSWZ29Bq771uWcmS0QgN2imNH3SfIlpMclh9l
 lxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698167295; x=1698772095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L1FF1gJxqcl+lR8fc3NGAGh6ZriqzXwUPpSOpQVAdLg=;
 b=CNChW+b8s+sYkYpXSng1sfHP0CprN6R2iTHzRogUvl4GusghsBV8prOLJpi/y9Ojus
 CwczGLHuieZQtm7dCN3BmM0BB89IV5+TB8WNr68OEAiyQnzKO5gu5+HQjzalslFcq30N
 +7K4vqTZ7hkNNDeWd4+ye62PTQxcxI5YiXtQ9VqNZ5TBJ+sgUuCunsvq0qAXq/JpbUtD
 coiiLU0Z2eZ8mXr0WgAdFdDEXdURuwuOCxFeZ0uzRughBucmgLyZ9m8MLm0sttUFI8r+
 ns5LHGrJBBtOc3ME8x5ZTOyD75b9wgUt9if8dDOSvn2DoSDdjeIXGuASM8XTgoD6t4SG
 Y+Og==
X-Gm-Message-State: AOJu0YzKBRG3Pju0gJxkaOpM6tgBmmm1+aqK1pulMehRYpI5ERCQQ0SA
 MfDIyh8+w+ppK4XHG4NluyAd0CJbJac=
X-Google-Smtp-Source: AGHT+IFrYw8dsyIm3wa76gPXIlJD6mCKZud3nLXbi2Pkdu07NBSpFOpwpLw8r87FtVPVDzGmLLxbPg==
X-Received: by 2002:a17:90a:db82:b0:27d:2ce9:d6d5 with SMTP id
 h2-20020a17090adb8200b0027d2ce9d6d5mr16990053pjv.12.1698167295057; 
 Tue, 24 Oct 2023 10:08:15 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 ha8-20020a17090af3c800b0026f919ff9a1sm9041271pjb.10.2023.10.24.10.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 10:08:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/gem: Demote allocations to __GFP_NOWARN
Date: Tue, 24 Oct 2023 10:08:05 -0700
Message-ID: <20231024170806.194563-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231024170806.194563-1-robdclark@gmail.com>
References: <20231024170806.194563-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

For allocations with userspace controlled size, we should not warn on
allocation failure.  Fixes KASAN splat:

   WARNING: CPU: 6 PID: 29557 at mm/page_alloc.c:5398 __alloc_pages+0x160c/0x2204
   Modules linked in: bridge stp llc hci_vhci tun veth xt_cgroup uinput xt_MASQUERADE rfcomm ip6table_nat fuse 8021q r8153_ecm cdc_ether usbnet r8152 mii venus_enc venus_dec uvcvideo algif_hash algif_skcipher af_alg qcom_spmi_adc_tm5 qcom_spmi_adc5 qcom_vadc_common qcom_spmi_temp_alarm cros_ec_typec typec hci_uart btqca qcom_stats snd_soc_sc7180 venus_core ath10k_snoc ath10k_core ath coresight_tmc coresight_replicator coresight_etm4x coresight_funnel snd_soc_lpass_sc7180 mac80211 coresight bluetooth ecdh_generic ecc cfg80211 cros_ec_sensorhub lzo_rle lzo_compress zram joydev
   CPU: 6 PID: 29557 Comm: syz-executor Not tainted 5.15.110-lockdep-19320-g89d010b0a9df #1 45bdd400697a78353f2927c116615abba810e5dd
   Hardware name: Google Kingoftown (DT)
   pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
   pc : __alloc_pages+0x160c/0x2204
   lr : __alloc_pages+0x58/0x2204
   sp : ffffffc0214176c0
   x29: ffffffc0214178a0 x28: ffffff801f7b4000 x27: 0000000000000000
   x26: ffffff808a4fa000 x25: 1ffffff011290781 x24: ffffff808a59c000
   x23: 0000000000000010 x22: ffffffc0080e6980 x21: 0000000000000010
   x20: 0000000000000000 x19: 00000000080001f8 x18: 0000000000000000
   x17: 0000000000000000 x16: 0000000000000000 x15: 0000000020000500
   x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000001
   x11: 0000000000000000 x10: 1ffffff804282f06 x9 : 0000000000000000
   x8 : ffffffc021417848 x7 : 0000000000000000 x6 : ffffffc0082ac788
   x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000010
   x2 : 0000000000000008 x1 : 0000000000000000 x0 : ffffffc021417830
   Call trace:
   __alloc_pages+0x160c/0x2204
   kmalloc_order+0x50/0xf4
   kmalloc_order_trace+0x38/0x18c
   __kmalloc+0x300/0x45c
   msm_ioctl_gem_submit+0x284/0x5988
   drm_ioctl_kernel+0x270/0x418
   drm_ioctl+0x5e0/0xbf8
   __arm64_sys_ioctl+0x154/0x1d0
   invoke_syscall+0x98/0x278
   el0_svc_common+0x214/0x274
   do_el0_svc+0x9c/0x19c
   el0_svc+0x5c/0xc0
   el0t_64_sync_handler+0x78/0x108
   el0t_64_sync+0x1a4/0x1a8

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 9f16af761bf0..6d8ec1337e8b 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -43,7 +43,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	if (sz > SIZE_MAX)
 		return ERR_PTR(-ENOMEM);
 
-	submit = kzalloc(sz, GFP_KERNEL);
+	submit = kzalloc(sz, GFP_KERNEL | __GFP_NOWARN);
 	if (!submit)
 		return ERR_PTR(-ENOMEM);
 
@@ -234,7 +234,7 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 			ret = -ENOMEM;
 			goto out;
 		}
-		submit->cmd[i].relocs = kmalloc(sz, GFP_KERNEL);
+		submit->cmd[i].relocs = kmalloc(sz, GFP_KERNEL | __GFP_NOWARN);
 		if (!submit->cmd[i].relocs) {
 			ret = -ENOMEM;
 			goto out;
-- 
2.41.0

