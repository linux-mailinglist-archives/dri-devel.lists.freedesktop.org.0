Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 187B76A057B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 10:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF1210E4C5;
	Thu, 23 Feb 2023 09:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F220910E4A3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 09:57:10 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id j17so10449650ljq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 01:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IXrfXOXzXAnGhXOYy5k/pL1OHE2nAUYxHQGENjE+KGk=;
 b=ohJ0ReUmz5mUYgneH7l3mxg8pMkbyJtTEvBbJCdPMLJ3QiihYV9uXkwJ8ebnfyfcC7
 bivyvVa3n1ZvbWliVMkUyu4/BCOemex76Lp8FLJb/Zsvi/SMUe2aPqT8kdHduQotpH4V
 lbTS+QqSp1eM96oHKRvv0gbfh7abNLZYoTQGzhJD9icpz7RlMPQJt1IvgY0cmveiRYFY
 +iuwztkwjazMUQ4U+G9dKtmP99KYdG1EkHwV98grjgaCJztawJeEvVYpXDnwo19bUwPT
 49kGh0NHGMJPhp3JDBuGG2vjruyR4FS86UxZtvDjbyltg41z0GecpA7wsDZsjA/fr3FW
 BQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IXrfXOXzXAnGhXOYy5k/pL1OHE2nAUYxHQGENjE+KGk=;
 b=w/aMPM+h08AkkhJOd3hcdaoY+nfFTcPzJruddnxAOt795fZbSoJsE7iVTFMp0oHQR0
 fD5LqUKcQMq6R4px76ecHb5uej6kopf6WUa+wH5S4rWoRC2ZPg/vS7CpoYTabG8nr26q
 lZ+lpDFBoDpG/nJ5AtZTlNs3BDuz26a003WW7cl62NVGoH2iTM3qnzJyLv8VpLD+KPmL
 k3RvMZk8Ju+RmJc35/vt7tXAQXNOdLpos8GFFppwp8slQ1rt/ZOWyXl0OGgVsj9GO2gD
 amV+Z6vHzd5quPN2738y+NnvHqgXOzPPISIeCxWy6/3u7heYF7YjHwpf4Vdf9h9Zp+rw
 OZug==
X-Gm-Message-State: AO0yUKXCEvCwyRekuD59o1tee9ZMv9UHav9hePcYytKUU2thgM2++6cB
 SOt7/01blchQFIWjXYhRC1p/JA==
X-Google-Smtp-Source: AK7set/u7ABMRAHGthgTexmgRYtv8dZVgMlfPuUOuCF93sPp/oGCN5yFbmZ42f7om+exFdsnm4d2PA==
X-Received: by 2002:a2e:bc0d:0:b0:294:669b:8f97 with SMTP id
 b13-20020a2ebc0d000000b00294669b8f97mr6159337ljf.46.1677146229148; 
 Thu, 23 Feb 2023 01:57:09 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a2eb552000000b002935899fe3fsm602765ljn.116.2023.02.23.01.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 01:57:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dpu: fix stack smashing in dpu_hw_ctl_setup_blendstage
Date: Thu, 23 Feb 2023 12:57:08 +0300
Message-Id: <20230223095708.3688148-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Cc: Amit Pundir <amit.pundir@linaro.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The rewritten dpu_hw_ctl_setup_blendstage() can lightly smash the stack
when setting the SSPP_NONE pipe. However it was unnoticed until the
kernel was tested under AOSP (with some kind of stack protection/check).

This fixes the following backtrace:

Unexpected kernel BRK exception at EL1
Internal error: BRK handler: 00000000f20003e8 [#1] PREEMPT SMP
Hardware name: Thundercomm Dragonboard 845c (DT)
pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
lr : _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
sp : ffffffc00bdcb720
x29: ffffffc00bdcb720 x28: ffffff8085debac0 x27: 0000000000000002
x26: ffffffd74af18320 x25: ffffff8083af75a0 x24: ffffffc00bdcb878
x23: 0000000000000001 x22: 0000000000000000 x21: ffffff8085a70000
x20: ffffff8083012dc0 x19: 0000000000000001 x18: 0000000000000000
x17: 000000040044ffff x16: 045000f4b5593519 x15: 0000000000000000
x14: 000000000000000b x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000000001 x10: ffffffc00bdcb764 x9 : ffffffd74af06a08
x8 : 0000000000000001 x7 : 0000000000000001 x6 : 0000000000000000
x5 : ffffffc00bdcb878 x4 : 0000000000000002 x3 : ffffffffffffffff
x2 : ffffffc00bdcb878 x1 : 0000000000000000 x0 : 0000000000000002
Call trace:
 dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
 _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
 dpu_crtc_atomic_begin+0xd8/0x22c [msm]
 drm_atomic_helper_commit_planes+0x80/0x208 [drm_kms_helper]
 msm_atomic_commit_tail+0x134/0x6f0 [msm]
 commit_tail+0xa4/0x1a4 [drm_kms_helper]
 drm_atomic_helper_commit+0x170/0x184 [drm_kms_helper]
 drm_atomic_commit+0xac/0xe8
 drm_mode_atomic_ioctl+0xbf0/0xdac
 drm_ioctl_kernel+0xc4/0x178
 drm_ioctl+0x2c8/0x608
 __arm64_sys_ioctl+0xa8/0xec
 invoke_syscall+0x44/0x104
 el0_svc_common.constprop.0+0x44/0xec
 do_el0_svc+0x38/0x98
 el0_svc+0x2c/0xb4
 el0t_64_sync_handler+0xb8/0xbc
 el0t_64_sync+0x1a0/0x1a4
Code: 52800016 52800017 52800018 17ffffc7 (d4207d00)

Fixes: 4488f71f6373 ("drm/msm/dpu: simplify blend configuration")
Reported-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index b88a2f3724e6..6c53ea560ffa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -446,7 +446,9 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 			 * CTL_LAYER has 3-bit field (and extra bits in EXT register),
 			 * all EXT registers has 4-bit fields.
 			 */
-			if (cfg->idx == 0) {
+			if (cfg->idx == -1) {
+				continue;
+			} else if (cfg->idx == 0) {
 				mixercfg[0] |= mix << cfg->shift;
 				mixercfg[1] |= ext << cfg->ext_shift;
 			} else {
-- 
2.30.2

