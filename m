Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFC9CC85C5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 16:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F50910E7E1;
	Wed, 17 Dec 2025 15:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="Pb+qA2WW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 424 seconds by postgrey-1.36 at gabe;
 Wed, 17 Dec 2025 15:12:47 UTC
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [91.218.175.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E143910E7FB
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 15:12:47 +0000 (UTC)
Message-ID: <8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1765983941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BU61uOE5rQFMg5G4aoZO7QP4QinbxTTLs0nJykuT8sQ=;
 b=Pb+qA2WWptWdsEksD+2nkZcRJvnq0032Qdw/x8F8Yh/Ryo31ap3ucPFTAXwfwceB3yQcR0
 H+FUbJ8YO+GXJj83trUH7u8d2IaeBJyLBaSz+Ji295q83uCKcJVQtzPZUbMc5wiAOrPWWP
 9mZdS3ecncoc7ujqlP8rHzTEH8xF6bfij661GCT4gcW+6Pc8qefkXHfHQKnimrPZtxdyJo
 XP6g9kyDP2xo5C5slSaVJQ8dcqxn1C4Oo86R14hLKria24kjsMRtWGKg5SPpVUfhh3tqO1
 gCCAwB97pxiFjxqPYk/EPFiJQeEiWg4D75Vzqw/wLhHqpKCy97kSqX1AtXFjww==
Date: Wed, 17 Dec 2025 18:05:31 +0300
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Re: [PATCH] drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Sajna <sajattack@postmarketos.org>, barnabas.czeman@mainlining.org
References: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On 11.12.2025 04:25, Dmitry Baryshkov wrote:
> Currently MDP5 3.x (MSM8998, SDM630 and SDM660) platforms are support
> by both DPU and MDP5 drivers. Support for them in the DPU driver is
> mature enough, so it's no longer sensible to keep them enabled in the
> MDP5 driver. Not to mention that MSM8998 never used an MDP5 compatible
> string. Drop support for the MDP5 3.x genration inside the MDP5
> driver and migrate those to the DPU driver only.
> 
> Note: this will break if one uses the DT generated before v6.3 as they
> had only the generic, "qcom,mdp5" compatible string for SDM630 and
> SDM660. However granted that we had two LTS releases inbetween I don't
> think it is an issue.
> 

I've retested DPU driver on our downstream release based on 6.18 (by
using msm.prefer_mdp5=false kernel cmdline parameter) on all devices
at my disposal, and I can confirm DPU driver working fine an all SDM660, 
SDM636 ones, but not on SDM630. Some logs from sdm630-sony-nile-pioneer
(Sony Xperia XA2):

[    2.356546] msm_dpu c901000.display-controller: bound c994000.dsi 
(ops dsi_ops [msm])
[    2.357328] adreno 5000000.gpu: GPU speedbin fuse 146 (0x92), mapped 
to opp-supp-hw 0x4
[    2.364802] msm_dpu c901000.display-controller: bound 5000000.gpu 
(ops a3xx_ops [msm])
[    2.444649] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x30030000
[    2.449793] [drm] Initialized msm 1.13.0 for 
c901000.display-controller on minor 1
...
[    2.911900] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu 
error]enc33 intf1 ctl start interrupt wait failed
[    2.911916] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait 
for commit done returned -22
...
[    3.176171] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu 
error]enc33 intf1 ctl start interrupt wait failed
[    3.176367] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait 
for commit done returned -22

Which results in horrendous ~3-5 fps in shell.

The block "enc33 intf1 ctl start interrupt wait failed" + "wait for
commit done returned -22" is repeated few times per second whenever
the display is turned on, and stops when it's turned off.

Meanwhile it is working fine using MDP5 driver (msm.prefer_mdp5=true).
Well, as fine as possible considering [1], using several FD_MESA_DEBUG
tricks to work around GPU issues.

P.S. I have not yet tested MSM8998, but I can try if required

[1] https://gitlab.freedesktop.org/mesa/mesa/-/issues/8442

--
Regards,
Alexey Minnekhanov
