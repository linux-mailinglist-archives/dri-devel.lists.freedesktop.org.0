Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3893C852FBB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 12:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA1C10E5FF;
	Tue, 13 Feb 2024 11:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZGgT/ET7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426AF10E5EC;
 Tue, 13 Feb 2024 11:42:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 857A961347;
 Tue, 13 Feb 2024 11:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED0DC433C7;
 Tue, 13 Feb 2024 11:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707824521;
 bh=1GtEqKV+wQs0MT2SIs+9S6c4LRpp7sxXEmK272Gtxpg=;
 h=Date:From:To:Cc:Subject:From;
 b=ZGgT/ET7ls9NrBGdLxIAC0UWI4xJYDbxoV9/v+C/uAWRn0JFRVxM93plQwxAKyLBb
 Hly2wL+syAtopYQ6Vb0znNINhkDdxjsOgd6XDrJ/vYfJnBPNgL70AQ6H4UdXSvYzRn
 Zx1Qzk++dZx9WWT/Iuwgjuo7p5Fd0dchYjhkL2a9GRD1nLavEoBWbEp0L4ySefp8Zf
 HN1WV6a5QHbOLs1Ffj2qyxMCx3LgyOW0TfSGwARG1bByAPHEJ0DBI4EhmkzsduosLi
 9E6eiG7fR899DrgOlWWMXVGz+feqhf4OLNnJi8uOoR6VgK9cWa1nfDbJADd58FIJDz
 OCMMIQT1kIujA==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rZrB2-000000007yd-1wrs;
 Tue, 13 Feb 2024 12:42:17 +0100
Date: Tue, 13 Feb 2024 12:42:16 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: drm/msm: DisplayPort regressions in 6.8-rc1
Message-ID: <ZctVmLK4zTwcpW3A@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi,

Since 6.8-rc1 the internal eDP display on the Lenovo ThinkPad X13s does
not always show up on boot.

The logs indicate problems with the runtime PM and eDP rework that went
into 6.8-rc1:

	[    6.006236] Console: switching to colour dummy device 80x25
	[    6.007542] [drm:dpu_kms_hw_init:1048] dpu hardware revision:0x80000000
	[    6.007872] [drm:drm_bridge_attach [drm]] *ERROR* failed to attach bridge /soc@0/phy@88eb000 to encoder TMDS-31: -16
	[    6.007934] [drm:dp_bridge_init [msm]] *ERROR* failed to attach panel bridge: -16
	[    6.007983] msm_dpu ae01000.display-controller: [drm:msm_dp_modeset_init [msm]] *ERROR* failed to create dp bridge: -16
	[    6.008030] [drm:_dpu_kms_initialize_displayport:588] [dpu error]modeset_init failed for DP, rc = -16
	[    6.008050] [drm:_dpu_kms_setup_displays:681] [dpu error]initialize_DP failed, rc = -16
	[    6.008068] [drm:dpu_kms_hw_init:1153] [dpu error]modeset init failed: -16
	[    6.008388] msm_dpu ae01000.display-controller: [drm:msm_drm_kms_init [msm]] *ERROR* kms hw init failed: -16
	
and this can also manifest itself as a NULL-pointer dereference:

	[    7.339447] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
	
	[    7.643705] pc : drm_bridge_attach+0x70/0x1a8 [drm]
	[    7.686415] lr : drm_aux_bridge_attach+0x24/0x38 [aux_bridge]
	
	[    7.769039] Call trace:
	[    7.771564]  drm_bridge_attach+0x70/0x1a8 [drm]
	[    7.776234]  drm_aux_bridge_attach+0x24/0x38 [aux_bridge]
	[    7.781782]  drm_bridge_attach+0x80/0x1a8 [drm]
	[    7.786454]  dp_bridge_init+0xa8/0x15c [msm]
	[    7.790856]  msm_dp_modeset_init+0x28/0xc4 [msm]
	[    7.795617]  _dpu_kms_drm_obj_init+0x19c/0x680 [msm]
	[    7.800731]  dpu_kms_hw_init+0x348/0x4c4 [msm]
	[    7.805306]  msm_drm_kms_init+0x84/0x324 [msm]
	[    7.809891]  msm_drm_bind+0x1d8/0x3a8 [msm]
	[    7.814196]  try_to_bring_up_aggregate_device+0x1f0/0x2f8
	[    7.819747]  __component_add+0xa4/0x18c
	[    7.823703]  component_add+0x14/0x20
	[    7.827389]  dp_display_probe+0x47c/0x568 [msm]
	[    7.832052]  platform_probe+0x68/0xd8

Users have also reported random crashes at boot since 6.8-rc1, and I've
been able to trigger hard crashes twice when testing an external display
(USB-C/DP), which may also be related to the DP regressions.

I've opened an issue here:

	https://gitlab.freedesktop.org/drm/msm/-/issues/51

but I also want Thorsten's help to track this so that it gets fixed
before 6.8 is released.

#regzbot introduced: v6.7..v6.8-rc1

The following series is likely the culprit:

	https://lore.kernel.org/all/1701472789-25951-1-git-send-email-quic_khsieh@quicinc.com/

Johan
