Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB8B50EE29
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 03:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B4010EF5F;
	Tue, 26 Apr 2022 01:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A6010EF5F;
 Tue, 26 Apr 2022 01:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650937338; x=1682473338;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZwwGoZGU63yhmvq0v9od27MNH4QuLJNEMvyZ2P0W2xc=;
 b=p3nZmc9k8wIfFYwNo17yLpRoUS5ArSzUwBsS7pBr19/BqgJWcwqyQUmm
 2VnRwv72en8rqztFuMmYJVMOsoiSfVQ3EDqEIdyyszbWBN07pgrMxskew
 kO4Ao13K7IOoDnKlrG+Va88iaFy64/2ZJ9xoJLMWCKAuQomtDGu3/Pmep o=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Apr 2022 18:42:17 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 18:42:16 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Apr 2022 18:42:16 -0700
Received: from [10.111.165.107] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 25 Apr
 2022 18:42:13 -0700
Message-ID: <9b4ccdef-c98a-b907-c7ee-a92456dc5bba@quicinc.com>
Date: Mon, 25 Apr 2022 18:42:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: move add fail safe mode to
 dp_connector_get_mode()
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com>
 <3b9588d2-d9f6-c96f-b316-953b56b59bfe@linaro.org>
 <73e2a37e-23db-d614-5f5c-8120f1869158@quicinc.com>
 <CAA8EJprjuzUrfwXodgKmbWxgK6t+bY601E_nS7CHNH_+4Tfn5Q@mail.gmail.com>
 <9b331b16-8d1b-4e74-8fee-d74c4041f8d7@quicinc.com>
 <CAD=FV=VxEnbBypNYSq=iTUTwZUs_v620juSA6gsMW4h2_3HyBQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAD=FV=VxEnbBypNYSq=iTUTwZUs_v620juSA6gsMW4h2_3HyBQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Aravind
 Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug

On 4/25/2022 5:26 PM, Doug Anderson wrote:
> Hi,
> 
> On Sat, Apr 23, 2022 at 8:34 AM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> On 4/22/2022 11:25 PM, Dmitry Baryshkov wrote:
>>> On Sat, 23 Apr 2022 at 03:12, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 4/22/2022 5:07 PM, Dmitry Baryshkov wrote:
>>>>> On 23/04/2022 02:45, Kuogee Hsieh wrote:
>>>>>> Current DP driver implementation has adding safe mode done at
>>>>>> dp_hpd_plug_handle() which is expected to be executed under event
>>>>>> thread context.
>>>>>>
>>>>>> However there is possible circular locking happen (see blow stack trace)
>>>>>> after edp driver call dp_hpd_plug_handle() from dp_bridge_enable() which
>>>>>> is executed under drm_thread context.
>>>>>>
>>>>>> To break this circular locking, this patch have safe mode added at
>>>>>> dp_connector_get_mode() which is executed under drm thread context.
>>>>>> Therefore no lock acquired required for &dev->mode_config.mutex while
>>>>>> adding fail safe mode since it has been hold by drm thread already.
>>>>>>
>>>>>> ======================================================
>>>>>>     WARNING: possible circular locking dependency detected
>>>>>>     5.15.35-lockdep #6 Tainted: G        W
>>>>>>     ------------------------------------------------------
>>>>>>     frecon/429 is trying to acquire lock:
>>>>>>     ffffff808dc3c4e8 (&dev->mode_config.mutex){+.+.}-{3:3}, at:
>>>>>> dp_panel_add_fail_safe_mode+0x4c/0xa0
>>>>>>
>>>>>>     but task is already holding lock:
>>>>>>     ffffff808dc441e0 (&kms->commit_lock[i]){+.+.}-{3:3}, at:
>>>>>> lock_crtcs+0xb4/0x124
>>>>>>
>>>>>>     which lock already depends on the new lock.
>>>>>>
>>>>>>     the existing dependency chain (in reverse order) is:
>>>>>>
>>>>>>     -> #3 (&kms->commit_lock[i]){+.+.}-{3:3}:
>>>>>>            __mutex_lock_common+0x174/0x1a64
>>>>>>            mutex_lock_nested+0x98/0xac
>>>>>>            lock_crtcs+0xb4/0x124
>>>>>>            msm_atomic_commit_tail+0x330/0x748
>>>>>>            commit_tail+0x19c/0x278
>>>>>>            drm_atomic_helper_commit+0x1dc/0x1f0
>>>>>>            drm_atomic_commit+0xc0/0xd8
>>>>>>            drm_atomic_helper_set_config+0xb4/0x134
>>>>>>            drm_mode_setcrtc+0x688/0x1248
>>>>>>            drm_ioctl_kernel+0x1e4/0x338
>>>>>>            drm_ioctl+0x3a4/0x684
>>>>>>            __arm64_sys_ioctl+0x118/0x154
>>>>>>            invoke_syscall+0x78/0x224
>>>>>>            el0_svc_common+0x178/0x200
>>>>>>            do_el0_svc+0x94/0x13c
>>>>>>            el0_svc+0x5c/0xec
>>>>>>            el0t_64_sync_handler+0x78/0x108
>>>>>>            el0t_64_sync+0x1a4/0x1a8
>>>>>>
>>>>>>     -> #2 (crtc_ww_class_mutex){+.+.}-{3:3}:
>>>>>>            __mutex_lock_common+0x174/0x1a64
>>>>>>            ww_mutex_lock+0xb8/0x278
>>>>>>            modeset_lock+0x304/0x4ac
>>>>>>            drm_modeset_lock+0x4c/0x7c
>>>>>>            drmm_mode_config_init+0x4a8/0xc50
>>>>>>            msm_drm_init+0x274/0xac0
>>>>>>            msm_drm_bind+0x20/0x2c
>>>>>>            try_to_bring_up_master+0x3dc/0x470
>>>>>>            __component_add+0x18c/0x3c0
>>>>>>            component_add+0x1c/0x28
>>>>>>            dp_display_probe+0x954/0xa98
>>>>>>            platform_probe+0x124/0x15c
>>>>>>            really_probe+0x1b0/0x5f8
>>>>>>            __driver_probe_device+0x174/0x20c
>>>>>>            driver_probe_device+0x70/0x134
>>>>>>            __device_attach_driver+0x130/0x1d0
>>>>>>            bus_for_each_drv+0xfc/0x14c
>>>>>>            __device_attach+0x1bc/0x2bc
>>>>>>            device_initial_probe+0x1c/0x28
>>>>>>            bus_probe_device+0x94/0x178
>>>>>>            deferred_probe_work_func+0x1a4/0x1f0
>>>>>>            process_one_work+0x5d4/0x9dc
>>>>>>            worker_thread+0x898/0xccc
>>>>>>            kthread+0x2d4/0x3d4
>>>>>>            ret_from_fork+0x10/0x20
>>>>>>
>>>>>>     -> #1 (crtc_ww_class_acquire){+.+.}-{0:0}:
>>>>>>            ww_acquire_init+0x1c4/0x2c8
>>>>>>            drm_modeset_acquire_init+0x44/0xc8
>>>>>>            drm_helper_probe_single_connector_modes+0xb0/0x12dc
>>>>>>            drm_mode_getconnector+0x5dc/0xfe8
>>>>>>            drm_ioctl_kernel+0x1e4/0x338
>>>>>>            drm_ioctl+0x3a4/0x684
>>>>>>            __arm64_sys_ioctl+0x118/0x154
>>>>>>            invoke_syscall+0x78/0x224
>>>>>>            el0_svc_common+0x178/0x200
>>>>>>            do_el0_svc+0x94/0x13c
>>>>>>            el0_svc+0x5c/0xec
>>>>>>            el0t_64_sync_handler+0x78/0x108
>>>>>>            el0t_64_sync+0x1a4/0x1a8
>>>>>>
>>>>>>     -> #0 (&dev->mode_config.mutex){+.+.}-{3:3}:
>>>>>>            __lock_acquire+0x2650/0x672c
>>>>>>            lock_acquire+0x1b4/0x4ac
>>>>>>            __mutex_lock_common+0x174/0x1a64
>>>>>>            mutex_lock_nested+0x98/0xac
>>>>>>            dp_panel_add_fail_safe_mode+0x4c/0xa0
>>>>>>            dp_hpd_plug_handle+0x1f0/0x280
>>>>>>            dp_bridge_enable+0x94/0x2b8
>>>>>>            drm_atomic_bridge_chain_enable+0x11c/0x168
>>>>>>            drm_atomic_helper_commit_modeset_enables+0x500/0x740
>>>>>>            msm_atomic_commit_tail+0x3e4/0x748
>>>>>>            commit_tail+0x19c/0x278
>>>>>>            drm_atomic_helper_commit+0x1dc/0x1f0
>>>>>>            drm_atomic_commit+0xc0/0xd8
>>>>>>            drm_atomic_helper_set_config+0xb4/0x134
>>>>>>            drm_mode_setcrtc+0x688/0x1248
>>>>>>            drm_ioctl_kernel+0x1e4/0x338
>>>>>>            drm_ioctl+0x3a4/0x684
>>>>>>            __arm64_sys_ioctl+0x118/0x154
>>>>>>            invoke_syscall+0x78/0x224
>>>>>>            el0_svc_common+0x178/0x200
>>>>>>            do_el0_svc+0x94/0x13c
>>>>>>            el0_svc+0x5c/0xec
>>>>>>            el0t_64_sync_handler+0x78/0x108
>>>>>>            el0t_64_sync+0x1a4/0x1a8
>>>>>>
>>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/dp/dp_display.c |  6 ------
>>>>>>     drivers/gpu/drm/msm/dp/dp_panel.c   | 23 +++++++++++++----------
>>>>>>     2 files changed, 13 insertions(+), 16 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>> index 92cd50f..01453db 100644
>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>> @@ -555,12 +555,6 @@ static int dp_hpd_plug_handle(struct
>>>>>> dp_display_private *dp, u32 data)
>>>>>>         mutex_unlock(&dp->event_mutex);
>>>>>> -    /*
>>>>>> -     * add fail safe mode outside event_mutex scope
>>>>>> -     * to avoid potiential circular lock with drm thread
>>>>>> -     */
>>>>>> -    dp_panel_add_fail_safe_mode(dp->dp_display.connector);
>>>>>> -
>>>>>>         /* uevent will complete connection part */
>>>>>>         return 0;
>>>>>>     };
>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c
>>>>>> b/drivers/gpu/drm/msm/dp/dp_panel.c
>>>>>> index 1aa9aa8c..23fee42 100644
>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>>>>>> @@ -151,15 +151,6 @@ static int dp_panel_update_modes(struct
>>>>>> drm_connector *connector,
>>>>>>         return rc;
>>>>>>     }
>>>>>> -void dp_panel_add_fail_safe_mode(struct drm_connector *connector)
>>>>>> -{
>>>>>> -    /* fail safe edid */
>>>>>> -    mutex_lock(&connector->dev->mode_config.mutex);
>>>>>> -    if (drm_add_modes_noedid(connector, 640, 480))
>>>>>> -        drm_set_preferred_mode(connector, 640, 480);
>>>>>> -    mutex_unlock(&connector->dev->mode_config.mutex);
>>>>>> -}
>>>>>> -
>>>>>>     int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>>>>>>         struct drm_connector *connector)
>>>>>>     {
>>>>>> @@ -216,7 +207,11 @@ int dp_panel_read_sink_caps(struct dp_panel
>>>>>> *dp_panel,
>>>>>>                 goto end;
>>>>>>             }
>>>>>> -        dp_panel_add_fail_safe_mode(connector);
>>>>>> +        /* fail safe edid */
>>>>>> +        mutex_lock(&connector->dev->mode_config.mutex);
>>>>>> +        if (drm_add_modes_noedid(connector, 640, 480))
>>>>>> +            drm_set_preferred_mode(connector, 640, 480);
>>>>>> +        mutex_unlock(&connector->dev->mode_config.mutex);
>>>>>>         }
>>>>>>         if (panel->aux_cfg_update_done) {
>>>>>> @@ -266,6 +261,14 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
>>>>>>             return -EINVAL;
>>>>>>         }
>>>>>> +    /*
>>>>>> +     * add fail safe mode (640x480) here
>>>>>> +     * since we are executed in drm_thread context,
>>>>>> +     * no mode_config.mutex acquired required
>>>>>> +     */
>>>>>> +    if (drm_add_modes_noedid(connector, 640, 480))
>>>>>> +        drm_set_preferred_mode(connector, 640, 480);
>>>>>> +
>>>>>>         if (dp_panel->edid)
>>>>>>             return dp_panel_update_modes(connector, dp_panel->edid);
>>>>> Also, wouldn't calling get_modes() several times make cause adding more
>>>>> and more 640x480 modes to the modes list?
>>>>>
>>>>
>>>> Shouldnt DRM be blocking that here? Call should trickle down here only
>>>> if count_modes was 0
>>>>
>>>>       if (out_resp->count_modes == 0) {
>>>>            if (is_current_master)
>>>>                connector->funcs->fill_modes(connector,
>>>>                                 dev->mode_config.max_width,
>>>>                                 dev->mode_config.max_height);
>>>>            else
>>>>                drm_dbg_kms(dev, "User-space requested a forced probe on
>>>> [CONNECTOR:%d:%s] but is not the DRM master, demoting to read-only probe",
>>>>                        connector->base.id, connector->name);
>>>>        }
>>>>
>>>
>>> count_modes is set by userspace:
>>>           /*
>>>            * This ioctl is called twice, once to determine how much space is
>>>            * needed, and the 2nd time to fill it.
>>>            */
>>>
>>> So, nothing prevents userspace from passing zero count_mode more than once.
>> Ack, some non-optimized usermodes can do this.
>>>
>>> However drm_helper_probe_single_connector_modes() will set old modes
>>> to MODE_STALE and then will call get_modes().
>>> Then drm_mode_prune_invalid() will prune stale modes. So, this should be fine.
>>>
>> Got it.
>>> A more generic question is why do we need to add the mode in two places?
>>>
>> Answering behalf of kuogee but the two places are for different purposes:
>>
>> 1) When there is no EDID read
>>
>> if (!dp_panel->edid) {
>>
>> That case we should add the fail-safe mode as otherwise display will be
>> blank for cases where there was nothing wrong with the monitor as such
>> but the EDID read from aux failed for some reason. Even DRM does this
>> but just not 640x480 here:
>>
>> 518     if (count == 0 && (connector->status == connector_status_connected ||
>> 519                        connector->status == connector_status_unknown))
>> 520             count = drm_add_modes_noedid(connector, 1024, 768);
> 
> But drm_add_modes_noedid() _will_ add the 640x480 modes, won't it? It
> will add all "failsafe" modes that are less than or equal to 1024x768
> and 60Hz or less. See the table "drm_dmt_modes". I don't understand
> why the DRM core's call doesn't solve the problem for you in the first
> place?

This is a good point that drm_add_modes_noedid() will add all modes 
<=1024x768. Perhaps we can drop the call for the case where there was no 
EDID and let DRM fwk handle that.

But that wont fix this problem, will explain in (2).

> 
> 
>> 2) When there was a valid EDID but no 640x480 mode
>>
>> This is the equipment specific case and the one even I was a bit
>> surprised. There is a DP compliance equipment we have in-house and while
>> validation, it was found that in its list of modes , it did not have any
>> modes which chromebook supported ( due to 2 lanes ). But my
>> understanding was that, all sinks should have atleast 640x480 but
>> apparently this one did not have that. So to handle this DP compliance
>> equipment behavior, we had to do this.
> 
> That doesn't seem right. If there's a valid EDID and the valid EDID
> doesn't contain 640x480, are you _sure_ you're supposed to be adding
> 640x480? That doesn't sound right to me. I've got a tiny display in
> front of me for testing that only has one mode:
> 
>    #0 800x480 65.68 800 840 888 928 480 493 496 525 32000
> 

As I had wrote, DRM core kicks in only when the count of modes is 0.
Here what is happening is the count was not 0 but 640x480 was not 
present in the EDID. So we had to add it explicitly.

Your tiny display is a display port display?

I am referring to only display port monitors. If your tiny display is 
DP, it should have had 640x480 in its list of modes.


> It wouldn't be correct to add a 640x480 mode to this panel... ...and,
> in fact, after applying ${SUBJECT} patch I see that DRM (incorrectly)
> thinks that my display supports 640x480. I see:
> 
>    #0 800x480 65.68 800 840 888 928 480 493 496 525 32000
>    #1 640x480 59.94 640 656 752 800 480 490 492 525 25175
> 
Its not incorrect if its display port as it should have had it.
The equipment we had did not have it which was incorrect.

So typically for DP monitors this change should cause no change as 
640x480 mode should already be present.


> So IMO we _shouldn't_ land ${SUBJECT} patch.
> 
> Just for testing, I also tried a hack to make EDID reading fail
> (return -EIO in the MSM dp_aux_transfer() function if msg->request <
> 8). Before ${SUBJECT} patch I'd see these modes:
> 
>    #0 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000
>    #1 800x600 60.32 800 840 968 1056 600 601 605 628 40000
>    #2 800x600 56.25 800 824 896 1024 600 601 603 625 36000
>    #3 848x480 60.00 848 864 976 1088 480 486 494 517 33750
>    #4 640x480 59.94 640 656 752 800 480 490 492 525 25175
> 
> ...and after ${SUBJECT} patch I'd see:
> 
>    #0 640x480 59.94 640 656 752 800 480 490 492 525 25175
>    #1 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000
>    #2 800x600 60.32 800 840 968 1056 600 601 605 628 40000
>    #3 800x600 56.25 800 824 896 1024 600 601 603 625 36000
>    #4 848x480 60.00 848 864 976 1088 480 486 494 517 33750
> 
> ...so your patch causes 640x480 to be prioritized. That also doesn't
> seem ideal. If it was ideal, the DRM core should have listed 640x480
> first.

So this is a different display or these modes are coming due to the 
drm_add_modes_noedid() call because of the EDID read fail right?

If its coming due to the drm_add_modes_noedid() call and then we are 
adding the 640x480 mode on top of that, like I mentioned in my previous 
comment, we can remove the call for the !edid case to address this.

> 
> I'll repeat my refrain that I'm not a DRM expert, but if I were doing
> things, I'd rather revert commit 8b2c181e3dcf ("drm/msm/dp: add fail
> safe mode outside of event_mutex context") and commit d4aca422539c
> ("drm/msm/dp: always add fail-safe mode into connector mode list") and
> then go back and look more carefully about what the problem was in the
> first place. Why didn't the failsafe modes added by the DRM core solve
> the problem for you in the first place?

I have explained why DRM core did not solve this problem. Thats because 
it will hit only when count of modes is 0, here count of modes is not 0.
So we know the root-cause.
> 
> -Doug
