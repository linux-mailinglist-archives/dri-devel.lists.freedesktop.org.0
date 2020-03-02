Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1AC175C70
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 14:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE3A6E29A;
	Mon,  2 Mar 2020 13:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA4489D5B;
 Mon,  2 Mar 2020 13:57:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuA4ecMGBIiwd69FPusmuyS6e/MRXIuC8JgnMhpjXHpzmghHJBgzE8Wcxx4EaemRtzlIQDzS9SEvDOLKG8EQwr9T5nZgAb/rKNByM0zBaiJpqbQemYxsrstFvBJuOowSPRTzWcowAEgSr0SwpbopR/T777LL7S/zceqa013tc9WbO3uEqLzBxLmaJB4gN/F8oGWUIm0gn6G8mcAn17dkUJGk0RE0R3nUxDOQ98OYMxMAZ6yxKLu3qofothATsYAC8YhQUoV4olEWVcGf7S0Ef0mkcC9YIAu2BJE3LNLvakwGuhcjafLXRclTmj3xNGLb8pO9Sie7MViBG80ZdPNyuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhSspGmYZfsvLTb+dMpM3BKEXR6myvxU+jgvjkrT7+I=;
 b=Jys/tP3clWJMpC9rTv3j3bYEIfqp1WQ3jWu6GXsLKBzcJxvwj6EJxxd+U84DO+ygZnqXVIcti/QlVjbVSLYIfR5b6oiyGV2+vppwzlJy25HtNhYkzH8zP6vk43LkeZngUvqYiiM1UNA2z9+qsPecWnFGRFBxQKbl7xkC8kaNqifWdIwmV9vObmVUMws9Ns9ngWWLnAiCFOHsomJwJw/a75q+4suztWZQHw8hAwBAOSDX4JdSIPrYXWMdat2HBwiITG7Xcata3JiHzozrHop9BezCL/28qqV+JbRVUMYViASPkAHgKK9Q7vWyrxq5lPVvmh7WZl/CI91TXyvrdaAHlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhSspGmYZfsvLTb+dMpM3BKEXR6myvxU+jgvjkrT7+I=;
 b=Ru2PGQS3SmoD1c5KlVTCiM0Vb3aXnkAE6Omjdw3HjRKtF9zJpiPErMyYhb9+kW204AyDg6KEnUVjm3gu6GWjTX3eueqZbgdOFJTcznSszpD17SdJKEh7BM7+HRhElRq/W7UVjFnLECnQTyAYgK049POJla/RVvJPVXnxdu6NCVI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BYAPR12MB2742.namprd12.prod.outlook.com (2603:10b6:a03:6a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.16; Mon, 2 Mar
 2020 13:57:08 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e8:c007:9a5:da4d]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e8:c007:9a5:da4d%5]) with mapi id 15.20.2772.018; Mon, 2 Mar 2020
 13:57:08 +0000
Subject: Re: [PATCH] drm/amd/display: Fix pageflip event race condition for
 DCN.
To: Mario Kleiner <mario.kleiner.de@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 sunpeng.li@amd.com
References: <20200302061732.28577-1-mario.kleiner.de@gmail.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <7c853b66-8747-3a7c-7a76-c2f418c0b101@amd.com>
Date: Mon, 2 Mar 2020 08:57:05 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <20200302061732.28577-1-mario.kleiner.de@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::21) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.29.1.94] (165.204.55.250) by
 YTBPR01CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14 via Frontend Transport; Mon, 2 Mar 2020 13:57:07 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d7a3fb4a-2665-49b6-d8d2-08d7beb198dd
X-MS-TrafficTypeDiagnostic: BYAPR12MB2742:|BYAPR12MB2742:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB27422250D47E5DD0E7F980C8ECE70@BYAPR12MB2742.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 033054F29A
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(199004)(189003)(5660300002)(26005)(81166006)(81156014)(956004)(2616005)(8676002)(16526019)(186003)(6636002)(66946007)(66476007)(66556008)(31696002)(53546011)(316002)(16576012)(86362001)(478600001)(52116002)(6486002)(4326008)(31686004)(36756003)(8936002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2742;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zPlqfxlYpizgkbbss+oDQntjuH3ASktsZA63jo2kwqxcezJKEGSGu92CkK9sqgH+9GpO9R1HOsqk4NUhykXCYCw+luHDg3nLr63pT7ye3AdLq19u+Y3UM8chKzjk0/fyLBk+ntJVL6TaiFAfJkFkpfbOfabwbsuzH+UD3SMIsrJmdM2hIkwL89pN7QChLChPVD97fmTZ0gF+oja7wBt8M9GQ0cTX2HDP1l/niL/ksSRhY8Ys9a9weuTxa7BWkHyXfag5hA6aeEMA7FaxT+SxdZQc0XvjCTCEhFkksekDwmmMXcbITMjD3d9Wj7ZEswjeKfWOamuW009V2cv4fzHihPVJlGWDiWd+oUR2Sq1D0C5G9VXNLtqZy2Uug6zzp34Jr3magPJ3JF8/bZ9vE4MacUYpX3ByWRT1SAy5Tv+t4IkKaJnrmqHwPRvTeFltqmkZ
X-MS-Exchange-AntiSpam-MessageData: 06hdsSV4EEx1ik6dQh8fxKvzf26NHK1fYhgr1JCkTRTM69MF578Ntcqa6YbFTS39uD/aCXlS23ZKNrQq2JKmLkU4zGhKbJcbka30cm+JCE7NQE7AIsUlxy7FYSSmQU/x48ZdCZAwFU0mt6WZ9NkXAg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a3fb4a-2665-49b6-d8d2-08d7beb198dd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2020 13:57:08.2327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PHXNx7lameO92fEmgkQjUYeu4Sk7xGZ5UW1Tgjy0iaP2JUt7Jlv+ANG1v6RzZQaorkN56G2h/q1B66MsdKkvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2742
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
Cc: alexander.deucher@amd.com, hwentlan@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-02 1:17 a.m., Mario Kleiner wrote:
> Commit '16f17eda8bad ("drm/amd/display: Send vblank and user
> events at vsartup for DCN")' introduces a new way of pageflip
> completion handling for DCN, and some trouble.
> 
> The current implementation introduces a race condition, which
> can cause pageflip completion events to be sent out one vblank
> too early, thereby confusing userspace and causing flicker:
> 
> prepare_flip_isr():
> 
> 1. Pageflip programming takes the ddev->event_lock.
> 2. Sets acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED
> 3. Releases ddev->event_lock.
> 
> --> Deadline for surface address regs double-buffering passes on
>      target pipe.
> 
> 4. dc_commit_updates_for_stream() MMIO programs the new pageflip
>     into hw, but too late for current vblank.
> 
> => pflip_status == AMDGPU_FLIP_SUBMITTED, but flip won't complete
>     in current vblank due to missing the double-buffering deadline
>     by a tiny bit.
> 
> 5. VSTARTUP trigger point in vblank is reached, VSTARTUP irq fires,
>     dm_dcn_crtc_high_irq() gets called.
> 
> 6. Detects pflip_status == AMDGPU_FLIP_SUBMITTED and assumes the
>     pageflip has been completed/will complete in this vblank and
>     sends out pageflip completion event to userspace and resets
>     pflip_status = AMDGPU_FLIP_NONE.
> 
> => Flip completion event sent out one vblank too early.
> 
> This behaviour has been observed during my testing with measurement
> hardware a couple of time.
> 
> The commit message says that the extra flip event code was added to
> dm_dcn_crtc_high_irq() to prevent missing to send out pageflip events
> in case the pflip irq doesn't fire, because the "DCH HUBP" component
> is clock gated and doesn't fire pflip irqs in that state. Also that
> this clock gating may happen if no planes are active. This suggests
> that the problem addressed by that commit can't happen if planes
> are active.
> 
> The proposed solution is therefore to only execute the extra pflip
> completion code iff the count of active planes is zero and otherwise
> leave pflip completion handling to the pflip irq handler, for a
> more race-free experience.
> 
> Note that i don't know if this fixes the problem the original commit
> tried to address, as i don't know what the test scenario was. It
> does fix the observed too early pageflip events though and points
> out the problem introduced.

This looks like a valid race condition that should be addressed.

Unfortunately this also doesn't fix the problem the original commit was 
trying to address.

HUBP interrupts only trigger when it's not clock gated. But there are 
cases (for example, PSR) where the HUBP can be clock gated but the 
active plane count is greater than zero.

The clock gating switch can typically happens outside of x86 control 
flow so we're not really going to understand in advance whether or not 
we'll be able to receive the pflip IRQ.

While we do have plane status/flip pending bits available to check in 
the VSTARTUP IRQ handler, this obviously doesn't work for resolving the 
core of the issue - that we probably don't know whether or not the HUBP 
will be on before sending out the event.

Maybe we can guess based on what features are enabled.

Regards,
Nicholas Kazlauskas

> 
> Fixes: 16f17eda8bad ("drm/amd/display: Send vblank and user events at vsartup for DCN")
> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 63e8a12a74bc..3502d6d52160 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -522,8 +522,9 @@ static void dm_dcn_crtc_high_irq(void *interrupt_params)
>   
>   	acrtc_state = to_dm_crtc_state(acrtc->base.state);
>   
> -	DRM_DEBUG_DRIVER("crtc:%d, vupdate-vrr:%d\n", acrtc->crtc_id,
> -				amdgpu_dm_vrr_active(acrtc_state));
> +	DRM_DEBUG_DRIVER("crtc:%d, vupdate-vrr:%d, planes:%d\n", acrtc->crtc_id,
> +			 amdgpu_dm_vrr_active(acrtc_state),
> +			 acrtc_state->active_planes);
>   
>   	amdgpu_dm_crtc_handle_crc_irq(&acrtc->base);
>   	drm_crtc_handle_vblank(&acrtc->base);
> @@ -543,7 +544,18 @@ static void dm_dcn_crtc_high_irq(void *interrupt_params)
>   			&acrtc_state->vrr_params.adjust);
>   	}
>   
> -	if (acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED) {
> +	/*
> +	 * If there aren't any active_planes then DCH HUBP may be clock-gated.
> +	 * In that case, pageflip completion interrupts won't fire and pageflip
> +	 * completion events won't get delivered. Prevent this by sending
> +	 * pending pageflip events from here if a flip is still pending.
> +	 *
> +	 * If any planes are enabled, use dm_pflip_high_irq() instead, to
> +	 * avoid race conditions between flip programming and completion,
> +	 * which could cause too early flip completion events.
> +	 */
> +	if (acrtc->pflip_status == AMDGPU_FLIP_SUBMITTED &&
> +	    acrtc_state->active_planes == 0) {
>   		if (acrtc->event) {
>   			drm_crtc_send_vblank_event(&acrtc->base, acrtc->event);
>   			acrtc->event = NULL;
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
