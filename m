Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66691854A45
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 14:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891AE10E0BC;
	Wed, 14 Feb 2024 13:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A9410E0BC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 13:18:56 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1raFA0-0008JP-Ud; Wed, 14 Feb 2024 14:18:49 +0100
Message-ID: <4737bc92-e4e5-4266-a249-d122f15e7ab9@leemhuis.info>
Date: Wed, 14 Feb 2024 14:18:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/msm: DisplayPort regressions in 6.8-rc1
Content-Language: en-US, de-DE
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Johan Hovold
 <johan@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, quic_jesszhan@quicinc.com,
 quic_sbillaka@quicinc.com, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org
References: <ZctVmLK4zTwcpW3A@hovoldconsulting.com>
 <343710b1-f0f4-5c05-70e6-3c221cdc9580@quicinc.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <343710b1-f0f4-5c05-70e6-3c221cdc9580@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1707916737;
 a0e54d9e; 
X-HE-SMSGID: 1raFA0-0008JP-Ud
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13.02.24 19:00, Abhinav Kumar wrote:
> 
> Thanks for the report.
> 
> I do agree that pm runtime eDP driver got merged that time but I think
> the issue is either a combination of that along with DRM aux bridge
> https://patchwork.freedesktop.org/series/122584/ OR just the latter as
> even that went in around the same time.

In that case allow me a stupid question from the cheap seats:

Is there anything affected users can do to help getting us closer to the
real problem? Like testing a specific commit or two before or after the
merge of one of those features for example? That might help to rule out
a few things.

Ciao, Thorsten

> Thats why perhaps this issue was not seen with the chromebooks we tested
> on as they do not use pmic_glink (aux bridge).
> 
> So we will need to debug this on sc8280xp specifically or an equivalent
> device which uses aux bridge.
> 
> On 2/13/2024 3:42 AM, Johan Hovold wrote:
>> Hi,
>>
>> Since 6.8-rc1 the internal eDP display on the Lenovo ThinkPad X13s does
>> not always show up on boot.
>>
>> The logs indicate problems with the runtime PM and eDP rework that went
>> into 6.8-rc1:
>>
>>     [    6.006236] Console: switching to colour dummy device 80x25
>>     [    6.007542] [drm:dpu_kms_hw_init:1048] dpu hardware
>> revision:0x80000000
>>     [    6.007872] [drm:drm_bridge_attach [drm]] *ERROR* failed to
>> attach bridge /soc@0/phy@88eb000 to encoder TMDS-31: -16
>>     [    6.007934] [drm:dp_bridge_init [msm]] *ERROR* failed to attach
>> panel bridge: -16
>>     [    6.007983] msm_dpu ae01000.display-controller:
>> [drm:msm_dp_modeset_init [msm]] *ERROR* failed to create dp bridge: -16
>>     [    6.008030] [drm:_dpu_kms_initialize_displayport:588] [dpu
>> error]modeset_init failed for DP, rc = -16
>>     [    6.008050] [drm:_dpu_kms_setup_displays:681] [dpu
>> error]initialize_DP failed, rc = -16
>>     [    6.008068] [drm:dpu_kms_hw_init:1153] [dpu error]modeset init
>> failed: -16
>>     [    6.008388] msm_dpu ae01000.display-controller:
>> [drm:msm_drm_kms_init [msm]] *ERROR* kms hw init failed: -16
>>     
>> and this can also manifest itself as a NULL-pointer dereference:
>>
>>     [    7.339447] Unable to handle kernel NULL pointer dereference at
>> virtual address 0000000000000000
>>     
>>     [    7.643705] pc : drm_bridge_attach+0x70/0x1a8 [drm]
>>     [    7.686415] lr : drm_aux_bridge_attach+0x24/0x38 [aux_bridge]
>>     
>>     [    7.769039] Call trace:
>>     [    7.771564]  drm_bridge_attach+0x70/0x1a8 [drm]
>>     [    7.776234]  drm_aux_bridge_attach+0x24/0x38 [aux_bridge]
>>     [    7.781782]  drm_bridge_attach+0x80/0x1a8 [drm]
>>     [    7.786454]  dp_bridge_init+0xa8/0x15c [msm]
>>     [    7.790856]  msm_dp_modeset_init+0x28/0xc4 [msm]
>>     [    7.795617]  _dpu_kms_drm_obj_init+0x19c/0x680 [msm]
>>     [    7.800731]  dpu_kms_hw_init+0x348/0x4c4 [msm]
>>     [    7.805306]  msm_drm_kms_init+0x84/0x324 [msm]
>>     [    7.809891]  msm_drm_bind+0x1d8/0x3a8 [msm]
>>     [    7.814196]  try_to_bring_up_aggregate_device+0x1f0/0x2f8
>>     [    7.819747]  __component_add+0xa4/0x18c
>>     [    7.823703]  component_add+0x14/0x20
>>     [    7.827389]  dp_display_probe+0x47c/0x568 [msm]
>>     [    7.832052]  platform_probe+0x68/0xd8
>>
>> Users have also reported random crashes at boot since 6.8-rc1, and I've
>> been able to trigger hard crashes twice when testing an external display
>> (USB-C/DP), which may also be related to the DP regressions.
>>
>> I've opened an issue here:
>>
>>     https://gitlab.freedesktop.org/drm/msm/-/issues/51
>>
>> but I also want Thorsten's help to track this so that it gets fixed
>> before 6.8 is released.
>>
>> #regzbot introduced: v6.7..v6.8-rc1
>>
>> The following series is likely the culprit:
>>
>>     https://lore.kernel.org/all/1701472789-25951-1-git-send-email-quic_khsieh@quicinc.com/
>>
>> Johan
> 
> 
