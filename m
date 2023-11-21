Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9C07F3569
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 18:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C86F10E54D;
	Tue, 21 Nov 2023 17:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2474910E54D;
 Tue, 21 Nov 2023 17:57:47 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1r5V0K-0006Bk-Gx; Tue, 21 Nov 2023 18:57:44 +0100
Message-ID: <c1b0bc05-41ee-403c-a0c7-0a2fc0e6b0a8@leemhuis.info>
Date: Tue, 21 Nov 2023 18:57:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/msm/dp: attach the DP subconnector property
Content-Language: en-US, de-DE
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Johan Hovold
 <johan@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
 <20231025092711.851168-3-dmitry.baryshkov@linaro.org>
 <ZVR8Flrjxy-wgqgJ@hovoldconsulting.com>
 <a35623df-6a8e-b398-a0b2-7f11b9ec4e5d@quicinc.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <a35623df-6a8e-b398-a0b2-7f11b9ec4e5d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1700589467;
 d106d9ee; 
X-HE-SMSGID: 1r5V0K-0006Bk-Gx
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
Cc: Sean Paul <sean@poorly.run>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Abel Vesa <abel.vesa@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15.11.23 19:06, Abhinav Kumar wrote:
> On 11/15/2023 12:06 AM, Johan Hovold wrote:
>> On Wed, Oct 25, 2023 at 12:23:10PM +0300, Dmitry Baryshkov wrote:
>>> While developing and testing the commit bfcc3d8f94f4 ("drm/msm/dp:
>>> support setting the DP subconnector type") I had the patch [1] in my
>>> tree. I haven't noticed that it was a dependency for the commit in
>>> question. Mea culpa.
>>
>> This also broke boot on the Lenovo ThinkPad X13s.
>>
>> Would be nice to get this fixed ASAP so that further people don't have
>> to debug this known regression.
> 
> I will queue this patch for -fixes rightaway.

Thx. I noticed that this fix is still not in -next. I then investigated
and I found it was applied on Thursday last week here:
https://gitlab.freedesktop.org/drm/msm/-/commits/msm-fixes?ref_type=heads

Makes me wonder: when will that patch go to a branch that is included in
-next? And when will it move on towards mainline?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

>>> Since the patch has not landed yet (and even was not reviewed)
>>> and since one of the bridges erroneously uses USB connector type instead
>>> of DP, attach the property directly from the MSM DP driver.
>>>
>>> This fixes the following oops on DP HPD event:
>>>
>>>   drm_object_property_set_value (drivers/gpu/drm/drm_mode_object.c:288)
>>>   dp_display_process_hpd_high (drivers/gpu/drm/msm/dp/dp_display.c:402)
>>>   dp_hpd_plug_handle.isra.0 (drivers/gpu/drm/msm/dp/dp_display.c:604)
>>>   hpd_event_thread (drivers/gpu/drm/msm/dp/dp_display.c:1110)
>>>   kthread (kernel/kthread.c:388)
>>>   ret_from_fork (arch/arm64/kernel/entry.S:858)
>>
>> This only says where the oops happened, it doesn't necessarily in itself
>> indicate an oops at all or that in this case it's a NULL pointer
>> dereference.
>>
>> On the X13s I'm seeing the NULL deref in a different path during boot,
>> and when this happens after a deferred probe (due to the panel lookup
>> mess) it hangs the machine, which makes it a bit of a pain to debug:
>>
>>     Unable to handle kernel NULL pointer dereference at virtual
>> address 0000000000000060
>>     ...
>>     CPU: 4 PID: 57 Comm: kworker/u16:1 Not tainted 6.7.0-rc1 #4
>>     Hardware name: Qualcomm QRD, BIOS
>> 6.0.220110.BOOT.MXF.1.1-00470-MAKENA-1 01/10/2022
>>     ...
>>     Call trace:
>>      drm_object_property_set_value+0x0/0x88 [drm]
>>      dp_display_process_hpd_high+0xa0/0x14c [msm]
>>      dp_hpd_plug_handle.constprop.0.isra.0+0x90/0x110 [msm]
>>      dp_bridge_atomic_enable+0x184/0x21c [msm]
>>      edp_bridge_atomic_enable+0x60/0x94 [msm]
>>      drm_atomic_bridge_chain_enable+0x54/0xc8 [drm]
>>      drm_atomic_helper_commit_modeset_enables+0x194/0x26c
>> [drm_kms_helper]
>>      msm_atomic_commit_tail+0x204/0x804 [msm]
>>      commit_tail+0xa4/0x18c [drm_kms_helper]
>>      drm_atomic_helper_commit+0x19c/0x1b0 [drm_kms_helper]
>>      drm_atomic_commit+0xa4/0x104 [drm]
>>      drm_client_modeset_commit_atomic+0x22c/0x298 [drm]
>>      drm_client_modeset_commit_locked+0x60/0x1c0 [drm]
>>      drm_client_modeset_commit+0x30/0x58 [drm]
>>      __drm_fb_helper_restore_fbdev_mode_unlocked+0xbc/0xfc
>> [drm_kms_helper]
>>      drm_fb_helper_set_par+0x30/0x4c [drm_kms_helper]
>>      fbcon_init+0x224/0x49c
>>      visual_init+0xb0/0x108
>>      do_bind_con_driver.isra.0+0x19c/0x38c
>>      do_take_over_console+0x140/0x1ec
>>      do_fbcon_takeover+0x6c/0xe4
>>      fbcon_fb_registered+0x180/0x1f0
>>      register_framebuffer+0x19c/0x228
>>      __drm_fb_helper_initial_config_and_unlock+0x2e8/0x4e8
>> [drm_kms_helper]
>>      drm_fb_helper_initial_config+0x3c/0x4c [drm_kms_helper]
>>      msm_fbdev_client_hotplug+0x84/0xcc [msm]
>>      drm_client_register+0x5c/0xa0 [drm]
>>      msm_fbdev_setup+0x94/0x148 [msm]
>>      msm_drm_bind+0x3d0/0x42c [msm]
>>      try_to_bring_up_aggregate_device+0x1ec/0x2f4
>>      __component_add+0xa8/0x194
>>      component_add+0x14/0x20
>>      dp_display_probe+0x278/0x41c [msm]
>>
>>> [1] https://patchwork.freedesktop.org/patch/555530/
>>>
>>> Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector
>>> type")
>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
>> Tested-by: Johan Hovold <johan+linaro@kernel.org>
>>
> 
> Thanks !
> 
>> Johan
