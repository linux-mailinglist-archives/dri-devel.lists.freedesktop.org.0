Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BBABA3588
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 12:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4C488DE5;
	Fri, 26 Sep 2025 10:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iOypAos7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F418910E346
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 10:30:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D2D2561D0A;
 Fri, 26 Sep 2025 10:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77021C4CEF4;
 Fri, 26 Sep 2025 10:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758882631;
 bh=FFEdg2iSl5uJ6CbjRZ1qM3Dohr60U2y7aWxkSt4fytc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iOypAos7da21DOM+dzCNHCppd14WSla2gQcz10hywqcWJfRTYd5oFrUYpZwXjmkvo
 ucVxEnxf5YD8ycYbp/X+OAqTh5DhcT5w7oUpJz0OUbEzMaP8LUSKvQcpurxfFi6OCX
 q4+d0ICdCK27caoURhM0YqQVsH99usd5Hbad7XC9oNhRf/JtJsB0sIhkruiHt4ufQK
 64r2BVOSNapR1rqDWw3FefjkHkchBMxilL+oyyZqhRhRDAZMafqXR28WecR3xGMvFG
 1uLVPXOPn3OGZTE1U/n157BoQpIa0Qpdl/4KsRe1LT0q2Sdtg4o/YrnhGAb6cj60dV
 lhguXd6nP0d0w==
Message-ID: <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
Date: Fri, 26 Sep 2025 11:30:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, Xilin Wu <sophon@radxa.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
>> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
>> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
>> use msm_dp_audio_prepare instead. While userspace is still calling
>> hw_params to do audio initialization, and we get the following errors:
>>
>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
>> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
>> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
> 
> And a call to hdmi_codec_prepare() comes only at this place.
> 
> Srini, Mark, when selecting to only implement .prepare for codec ops I
> was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
> hook"), which documents that IEC958 status bit is set after
> .hw_params(), so it's only visible during .prepare(). Is it okay to
> implement both callbacks? Or should the audioreach DAI driver be fixed
> somehow instead (I suppose it assumes that the port is available after
> .hw_params(), not sure if that assumption is correct)?
> 
>>
>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
>> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
>> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
>> hdmi-codec driver can work with userspace alsa.
>>
>> Tested with Radxa Dragon Q6A.
>>
>> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> 
> The patch LGTM, but I would wait for response from audio maintainers.
> 

The ordering matters in this case as we need clocks and audio
configuration on DP codec side to be setup before we start configuring
the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
even before it is ready.

q6apm prepare loads the dsp pipeline and starts configuring the
endpoints, if the DP endpoint is not ready dsp would throw an error.

We might be able to pull in some dsp logs to confirm this, but I dont
have a setup that I can reproduce this issue.


--srini
>> ---
>>
>> Changes in v2:
>> - Link to v1: https://lore.kernel.org/linux-arm-msm/20250924085804.34183-1-liujianfeng1994@gmail.com/
>> - Use more detailed trace log in commit message.
>> - Drop the empty line between Fixex and SoB.
>>
>>  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
>> index 7d78b02c1446..6ca1c7ad0632 100644
>> --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
>> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
>> @@ -130,6 +130,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
>>  
>>  static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
>>  	.audio_startup = drm_connector_hdmi_audio_startup,
>> +	.hw_params = drm_connector_hdmi_audio_prepare,
>>  	.prepare = drm_connector_hdmi_audio_prepare,
>>  	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
>>  	.mute_stream = drm_connector_hdmi_audio_mute_stream,
>> -- 
>> 2.43.0
>>
> 

