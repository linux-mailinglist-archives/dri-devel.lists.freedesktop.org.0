Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F778A796A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 01:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D268210EE96;
	Tue, 16 Apr 2024 23:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8807210EE96
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 23:57:46 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B6BC33EFF8;
 Wed, 17 Apr 2024 01:57:43 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 0/7] drm/msm: Initial fixes for DUALPIPE (+DSC) topology
Date: Wed, 17 Apr 2024 01:57:40 +0200
Message-Id: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHUQH2YC/x3MQQqDMBBG4avIrDuQaKrgVUoX0UzqDyYNmbYUx
 Ls3dPnx4B2kUiFKc3dQlQ8Uz9xgLx2tm88PYYRm6k3vjLMjh5o4aWJkvOB3Dm+/FxThoCtHfEV
 5iGay18UMS3TURqXKP7TP7X6eP3beIJV0AAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Archit Taneja <architt@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Vinod Koul <vkoul@kernel.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Rajesh Yadav <ryadav@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13.0
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

This series covers a step-up towards supporting the DUALPIPE DSC
topology, also known as 2:2:2 topology (on active-CTL hardware).  It
involves 2 layer mixers, 2 DSC compression encoders, and 2 interfaces
(on DSI, this is called bonded-DSI) where bandwidth constraints (e.g. 4k
panels at 120Hz) require two interfaces to transmit pixel data.

Enabling this topology will be hard(er) than downstream as hacking a
layout type in DTS won't be describing the hardware, but "dynamically"
determining it at runtime may pose some of a challenge that is left to a
future series.  Such changes will also involve the 1:1:1 topology needed
for constrained hardware like the Fairphone 5 on SC7280 with access to
only one DSC encoder and thus ruled out of the current 2:2:1 topology.

Likewise, the patches and discussions around improving active-CTL
configuration to support bonded interfaces (that share a single CTL
block) are still in full swing and hence elided from this series, apart
from one patch to fix the ACTIVE_DSC register coding to support updates,
so that it is not forgotten about.

Note that some patches are applicable to DSC-less DUALPIPE bonded mode
as well, such as the patch that allows the slave interface to always be
flushed as that is only supposed to be excluded in the yet-unsupported
PPSPLIT topology.

This series also contains some patches that I'm not too sure about:

  drm/msm/dpu: Correct dual-ctl -> dual-intf typo in comment

    Downstream doesn't skip the slave INTF flush on active-CTL [1]
    (again, just like cmdmode, only when PPSPLIT is enabled [2]), and
    even added an extra comment [1] explaining this case.  Hence a
    dual-intf but single-flush case doesn't seem to exist as there's
    only one CTL according to the remainder of the comment.
    Maybe the whole comment is wrong?

  drm/msm/dsi: Set PHY usescase before registering DSI host

    It seems intentional to only set the usecase after
    msm_dsi_host_register() in case it fails, so maybe a non-zero `ret`
    here should reset the usecase?  Likewise should the function call be
    moved in !IS_BONDED_DSI() above?

    Ideally we also understand what I am doing differently (maybe
    wrongly) in my panel driver that makes the PLL turn on and configure
    before the usecase has been set, even though these calls are messy
    and error-prone nevertheless.

[1]: https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.4.r1-rel/msm/sde/sde_encoder_phys_vid.c?ref_type=heads#L794-804
[2]: https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.4.r1-rel/msm/sde/sde_encoder_phys_cmd.c?ref_type=heads#L1131-1139

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
Marijn Suijten (7):
      drm/msm/dsi: Print dual-DSI-adjusted pclk instead of original mode pclk
      drm/msm/dsi: Pass bonded-DSI hdisplay/2 to DSC timing configuration
      drm/msm/dpu: Always flush the slave INTF on the CTL
      drm/msm/dpu: Allow configuring multiple active DSC blocks
      drm/msm/dpu: Correct dual-ctl -> dual-intf typo in comment
      drm/msm/dsi: Set PHY usescase before registering DSI host
      drm/msm/dpu: Rename `ctx` parameter to `intf` to match other functions

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c           |  9 ++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 14 +++++++-------
 drivers/gpu/drm/msm/dsi/dsi_host.c                   | 14 +++++++-------
 drivers/gpu/drm/msm/dsi/dsi_manager.c                | 15 +++++++++++----
 6 files changed, 32 insertions(+), 25 deletions(-)
---
base-commit: 6bd343537461b57f3efe5dfc5fc193a232dfef1e
change-id: 20240416-drm-msm-initial-dualpipe-dsc-fixes-3f0715b03bf4

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>

