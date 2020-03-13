Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1211846F8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 13:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90F66E29E;
	Fri, 13 Mar 2020 12:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750074.outbound.protection.outlook.com [40.107.75.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A076E043;
 Fri, 13 Mar 2020 12:35:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kU2BzkL6JlkN1SSC5+K6tQUQfMW2z28kee3wursaMLQ6wPXmVFjrpIJEOjf8LLl0g7LUV1da5cG8zq13oH4BCW1ZD1y1w2OLdZPVm03E1xqT1TDz2gjZPwav4a1nj5PzGLjaLNIqXLhhXbZquvgW2PiP+OAQ+datHnmtRgeMXvptS2mX23Nm2GwN+1FU3PVY/bwmbCvgMVBbl27ddZZu+h7mrWa8c7Dr04izZOFqEi6zOM5rjIAlsq/tdqFMN2j4OxjevMlED50BKjTLPhIZSciuKut20TPxbG6l/A6TLKda6ytpuJKlTo9l62HbVIw6H74K4zaBA5pAowZzmHv1tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LIRJNdB3A5gqzVorRgiIUxbyECZKe6MMJK+HR0lKYQ=;
 b=AB3bKThv77d0ERNn0NxPlUuF0Hk40tDQe9vKPZGNyjKbLOlNGjqnabbnDEnO5Md3R/0KZDlpWsp4PIbrwLfmEMOnd2IUKctUqMtr1KEGutC5pM1fazxBDKUdTnJz9dRHCwf2R6VNqJ2Jnh+vKbH47I6hOWTvdLo/Xb1pV7FnUt8XeFYxurS6RMBPTRTnRPnWqn193tFynK0+8XpL0WdUFdSjZoJb7VaL/guDaC/6iBMy5a9ihEhBM/oEPEwe8fuhPOEpQbBf9dSRkHLJPO3H33n6gyFTu9D/lBF1TrvxEhsy1IcDle36kTwFyqrSPx+2Va1jjcScu2yjWXUIGmKyWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LIRJNdB3A5gqzVorRgiIUxbyECZKe6MMJK+HR0lKYQ=;
 b=nd0CA7YczQ53JPEnOFXXZ4zl/BkSIoq1TsA/EOKPo2+3MYjK5aUkjzMxCFm2dMLfE8kXqTj2CM/fULpQmqgB6GbfNXHUzW1EjGgCSB774EqzLsy2o77zky4gyxgNXOHxoImiz8GSshMhce+x+bhjK/adAY8xgn07oqmNQukieC4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BYAPR12MB3189.namprd12.prod.outlook.com (2603:10b6:a03:134::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Fri, 13 Mar
 2020 12:35:35 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e8:c007:9a5:da4d]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e8:c007:9a5:da4d%5]) with mapi id 15.20.2793.021; Fri, 13 Mar 2020
 12:35:34 +0000
Subject: Re: [PATCH] drm/amd/display: Fix pageflip event race condition for
 DCN. (v2)
To: Alex Deucher <alexdeucher@gmail.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>
References: <20200305212044.3857-1-mario.kleiner.de@gmail.com>
 <CADnq5_PoEbgyQ1a+DMkSpTkN2QHHEpHie53Wxo7eRktsKxKs7Q@mail.gmail.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <cd4b7cfd-1fec-db5a-ded1-65e89b14ea35@amd.com>
Date: Fri, 13 Mar 2020 08:35:30 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <CADnq5_PoEbgyQ1a+DMkSpTkN2QHHEpHie53Wxo7eRktsKxKs7Q@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::33) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.29.1.94] (165.204.55.250) by
 YTBPR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.18 via Frontend Transport; Fri, 13 Mar 2020 12:35:33 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a538de95-32eb-45b3-7698-08d7c74b0694
X-MS-TrafficTypeDiagnostic: BYAPR12MB3189:|BYAPR12MB3189:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB31890CC40E17E7F488D60714ECFA0@BYAPR12MB3189.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 034119E4F6
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(199004)(4326008)(81156014)(316002)(6486002)(66556008)(966005)(86362001)(31696002)(16576012)(110136005)(8676002)(30864003)(66946007)(2906002)(36756003)(54906003)(31686004)(66476007)(8936002)(81166006)(2616005)(956004)(5660300002)(478600001)(52116002)(53546011)(16526019)(26005)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3189;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SjJdosEvnM9oKFCLldz0k0oV2YCwSDXNTCWm4N1qef6OVyOtdeThywcJbGxhYe5uX0aIoTLPRZMSlP0eGqSmF5UA7CBcQVJo6wHVbIJNN95oBRQ8oHgat8/XWVHLaTdG+yLVPrw7yfgODddpiku9Xelew8sBRMzJk17Oh3h0VLW1CFHjxTmJx3ceDdaa0YfhNlo+2IegZDcREyTk/MvarRi+fINuVams+yYIct40aYlhmJv4TP3RFlGhVAxn1um5DIyPNllM5cubzAoMzMnZZC9xiKfBYvtAS19okbTyJrLGp1o+VLjocxSl8hJf9fT+P9Xl5obhkJnIFTqLj00in3l29dE50isEO2sPjuVVCF+whwW06mJbfAAmggdwZW4Kz5cp2XdWERv/dxQ1cnxqGeGUCnn8Z9uG88vYL7SqqgjzMr8wJcIrmdjiOtSPBFNWTl5j2qL3jgJLNtjjxzeIsWQp7zmLUU5HL8KnR7Vw/cU=
X-MS-Exchange-AntiSpam-MessageData: mS7Tnnd0uksLXF6Bglau2BsxdJFFHL2Mnh+Gx4p84gQxZJhnmYa/hzSWuDltTI9Hge+pHm/H0v3KUX6TtI68vvrRQLEzubeSnt6FFLwa8poNe6itatIL4NVR8LqbF/rXVKOvun+q1NTxj9GAZxMIJA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a538de95-32eb-45b3-7698-08d7c74b0694
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2020 12:35:34.6440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DnMMEDVCeIujuBYjX9yWoKKEuhhXEaamhBsasHsVhhiGQ6BIKej0+Vfx8lU6IXmOZBgp/CIgPTDKJT+4CtfkUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3189
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-12 10:32 a.m., Alex Deucher wrote:
> On Thu, Mar 5, 2020 at 4:21 PM Mario Kleiner <mario.kleiner.de@gmail.com> wrote:
>>
>> Commit '16f17eda8bad ("drm/amd/display: Send vblank and user
>> events at vsartup for DCN")' introduces a new way of pageflip
>> completion handling for DCN, and some trouble.
>>
>> The current implementation introduces a race condition, which
>> can cause pageflip completion events to be sent out one vblank
>> too early, thereby confusing userspace and causing flicker:
>>
>> prepare_flip_isr():
>>
>> 1. Pageflip programming takes the ddev->event_lock.
>> 2. Sets acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED
>> 3. Releases ddev->event_lock.
>>
>> --> Deadline for surface address regs double-buffering passes on
>>      target pipe.
>>
>> 4. dc_commit_updates_for_stream() MMIO programs the new pageflip
>>     into hw, but too late for current vblank.
>>
>> => pflip_status == AMDGPU_FLIP_SUBMITTED, but flip won't complete
>>     in current vblank due to missing the double-buffering deadline
>>     by a tiny bit.
>>
>> 5. VSTARTUP trigger point in vblank is reached, VSTARTUP irq fires,
>>     dm_dcn_crtc_high_irq() gets called.
>>
>> 6. Detects pflip_status == AMDGPU_FLIP_SUBMITTED and assumes the
>>     pageflip has been completed/will complete in this vblank and
>>     sends out pageflip completion event to userspace and resets
>>     pflip_status = AMDGPU_FLIP_NONE.
>>
>> => Flip completion event sent out one vblank too early.
>>
>> This behaviour has been observed during my testing with measurement
>> hardware a couple of time.
>>
>> The commit message says that the extra flip event code was added to
>> dm_dcn_crtc_high_irq() to prevent missing to send out pageflip events
>> in case the pflip irq doesn't fire, because the "DCH HUBP" component
>> is clock gated and doesn't fire pflip irqs in that state. Also that
>> this clock gating may happen if no planes are active. According to
>> Nicholas, the clock gating can also happen if psr is active, and the
>> gating is controlled independently by the hardware, so difficult to
>> detect if and when the completion code in above commit is needed.
>>
>> This patch tries the following solution: It only executes the extra pflip
>> completion code in dm_dcn_crtc_high_irq() iff the hardware reports
>> that there aren't any surface updated pending in the double-buffered
>> surface scanout address registers. Otherwise it leaves pflip completion
>> to the pflip irq handler, for a more race-free experience.
>>
>> This would only guard against the order of events mentioned above.
>> If Step 5 (VSTARTUP trigger) happens before step 4 then this won't help
>> at all, because 1-3 + 5 might happen even without the hw being programmed
>> at all, ie. no surface update pending because none yet programmed into hw.
>>
>> Therefore this patch also changes locking in amdgpu_dm_commit_planes(),
>> so that prepare_flip_isr() and dc_commit_updates_for_stream() are done
>> under event_lock protection within the same critical section.
>>
>> v2: Take Nicholas comments into account, try a different solution.
>>
>> Lightly tested on Polaris (locking) and Raven (the whole DCN stuff).
>> Seems to work without causing obvious new trouble.
> 
> Nick, any comments on this?  Can we get this committed or do you think
> it needs additional rework?
> 
> Thanks,
> 
> Alex

Hi Alex, Mario,

This might be a little strange, but if we want to get this in as a fix 
for regressions caused by the original vblank and user events at 
vstartup patch then I'm actually going to give my reviewed by on the 
*v1* of this patch (but not this v2):

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

You can feel free to apply that one.

Reason 1: After having thought about it some more I don't think we 
enable anything today that has hubp powered down at the same time we 
expect to be waiting for a flip - eg. DMCU powering down HUBP during PSR 
entry. Static screen interrupt should happen after that flip finishes I 
think.

The CRTC can still be powered on with zero planes, and I don't think any 
userspace explicitly asks for vblank events in this case but it doesn't 
hurt to have the check.

Reason 2: This new patch will need much more thorough testing from side 
to fully understand the consequences of locking the entire DC commit 
sequence. For just a page flip that sounds fine, but for anything more 
than (eg. full updates, modesets, etc) I don't think we want to be 
disabling interrupts for potentially many milliseconds.

Maybe we could just use a lock-free queue here for the events. It's 
single producer/single consumer per CRTC.

Regards,
Nicholas Kazlauskas

> 
>>
>> Fixes: 16f17eda8bad ("drm/amd/display: Send vblank and user events at vsartup for DCN")
>> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 80 ++++++++++++++++---
>>   1 file changed, 67 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index d7df1a85e72f..aa4e941b276f 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -287,6 +287,28 @@ static inline bool amdgpu_dm_vrr_active(struct dm_crtc_state *dm_state)
>>                 dm_state->freesync_config.state == VRR_STATE_ACTIVE_FIXED;
>>   }
>>
>> +/**
>> + * dm_crtc_is_flip_pending() - Is a pageflip pending on this crtc?
>> + *
>> + * Returns true if any plane on the crtc has a flip pending, false otherwise.
>> + */
>> +static bool dm_crtc_is_flip_pending(struct dm_crtc_state *acrtc_state)
>> +{
>> +       struct dc_stream_status *status = dc_stream_get_status(acrtc_state->stream);
>> +       const struct dc_plane_status *plane_status;
>> +       int i;
>> +       bool pending = false;
>> +
>> +       for (i = 0; i < status->plane_count; i++) {
>> +               plane_status = dc_plane_get_status(status->plane_states[i]);
>> +               pending |= plane_status->is_flip_pending;
>> +               DRM_DEBUG_DRIVER("plane:%d, flip_pending=%d\n",
>> +                                i, plane_status->is_flip_pending);
>> +       }
>> +
>> +       return pending;
>> +}
>> +
>>   /**
>>    * dm_pflip_high_irq() - Handle pageflip interrupt
>>    * @interrupt_params: ignored
>> @@ -435,6 +457,11 @@ static void dm_vupdate_high_irq(void *interrupt_params)
>>                                  spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
>>                          }
>>                  }
>> +
>> +               if (acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED) {
>> +                       DRM_DEBUG_DRIVER("%s:crtc:%d, flip_pending=%d\n", __func__,
>> +                                           acrtc->crtc_id, dm_crtc_is_flip_pending(acrtc_state));
>> +               }
>>          }
>>   }
>>
>> @@ -489,6 +516,11 @@ static void dm_crtc_high_irq(void *interrupt_params)
>>                                  &acrtc_state->vrr_params.adjust);
>>                          spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
>>                  }
>> +
>> +               if (acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED) {
>> +                       DRM_DEBUG_DRIVER("%s:crtc:%d, flip_pending=%d\n", __func__,
>> +                                        acrtc->crtc_id, dm_crtc_is_flip_pending(acrtc_state));
>> +               }
>>          }
>>   }
>>
>> @@ -543,13 +575,29 @@ static void dm_dcn_crtc_high_irq(void *interrupt_params)
>>                          &acrtc_state->vrr_params.adjust);
>>          }
>>
>> -       if (acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED) {
>> +       /*
>> +        * If there aren't any active_planes, or PSR is active, then DCH HUBP
>> +        * may be clock-gated. In that state, pageflip completion interrupts
>> +        * won't fire and pageflip completion events won't get delivered.
>> +        *
>> +        * Prevent this by sending pending pageflip events from here if a flip
>> +        * has been submitted, but is no longer pending in hw, ie. has already
>> +        * completed.
>> +        *
>> +        * If the flip is still pending in hw, then use dm_pflip_high_irq()
>> +        * instead, handling completion as usual by pflip irq.
>> +        */
>> +       if (acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED &&
>> +           !dm_crtc_is_flip_pending(acrtc_state)) {
>>                  if (acrtc->event) {
>>                          drm_crtc_send_vblank_event(&acrtc->base, acrtc->event);
>>                          acrtc->event = NULL;
>>                          drm_crtc_vblank_put(&acrtc->base);
>>                  }
>>                  acrtc->pflip_status = AMDGPU_FLIP_NONE;
>> +
>> +               DRM_DEBUG_DRIVER("crtc:%d, pflip_stat:AMDGPU_FLIP_NONE\n",
>> +                                acrtc->crtc_id);
>>          }
>>
>>          spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
>> @@ -6325,7 +6373,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>>                          to_dm_crtc_state(drm_atomic_get_old_crtc_state(state, pcrtc));
>>          int planes_count = 0, vpos, hpos;
>>          long r;
>> -       unsigned long flags;
>> +       unsigned long flags = 0;
>>          struct amdgpu_bo *abo;
>>          uint64_t tiling_flags;
>>          uint32_t target_vblank, last_flip_vblank;
>> @@ -6513,17 +6561,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>>                          usleep_range(1000, 1100);
>>                  }
>>
>> -               if (acrtc_attach->base.state->event) {
>> -                       drm_crtc_vblank_get(pcrtc);
>> -
>> -                       spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
>> -
>> -                       WARN_ON(acrtc_attach->pflip_status != AMDGPU_FLIP_NONE);
>> -                       prepare_flip_isr(acrtc_attach);
>> -
>> -                       spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
>> -               }
>> -
>>                  if (acrtc_state->stream) {
>>                          if (acrtc_state->freesync_vrr_info_changed)
>>                                  bundle->stream_update.vrr_infopacket =
>> @@ -6575,6 +6612,15 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>>                                  acrtc_state->stream->link->psr_allow_active)
>>                          amdgpu_dm_psr_disable(acrtc_state->stream);
>>
>> +               if (pflip_present && acrtc_attach->base.state->event) {
>> +                       drm_crtc_vblank_get(pcrtc);
>> +
>> +                       spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
>> +
>> +                       WARN_ON(acrtc_attach->pflip_status != AMDGPU_FLIP_NONE);
>> +                       prepare_flip_isr(acrtc_attach);
>> +               }
>> +
>>                  dc_commit_updates_for_stream(dm->dc,
>>                                                       bundle->surface_updates,
>>                                                       planes_count,
>> @@ -6582,6 +6628,14 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>>                                                       &bundle->stream_update,
>>                                                       dc_state);
>>
>> +               /*
>> +                * Must event_lock protect prepare_flip_isr() above and
>> +                * dc_commit_updates_for_stream within same critical section,
>> +                * or pageflip completion will suffer bad races on DCN.
>> +                */
>> +               if (pflip_present && acrtc_attach->pflip_status == AMDGPU_FLIP_SUBMITTED)
>> +                       spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
>> +
>>                  if ((acrtc_state->update_type > UPDATE_TYPE_FAST) &&
>>                                                  acrtc_state->stream->psr_version &&
>>                                                  !acrtc_state->stream->link->psr_feature_enabled)
>> --
>> 2.20.1
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
