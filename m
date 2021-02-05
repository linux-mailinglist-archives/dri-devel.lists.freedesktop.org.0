Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B13310CC0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 15:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4016F468;
	Fri,  5 Feb 2021 14:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5643D6F463;
 Fri,  5 Feb 2021 14:54:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYHOB2sftIZ96I7znEazY7cIri4GxL9wxx/1FnyNE4FaOUq/8JVRJqbgpajIG2kHSkMA9NGuZiYkWo+1yJBxEi5PrfGxwDThvDdOdMTCH5sdEre0nZ1C28Aqy3COAoQkbFoJDs7pzQXLY9wkDueS5xcKRctm0iPKU+kSX8Rkej5DbAy5jdtht4ubI9xWfhW95T8BE8Vb9331Mez4pwWtYDRYF6JQqv22MRapnEgQKsRxHqIC9igJ4sELtA8E9Amvb/Uwo9dklx8kZ9PsFCqTHHEuTIey0xx12G8J3Jg91OM0I94MlP3GqYJfV+MU+IhXf9Zf+d73qvKcBccUvXQq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHOrb2hcV685+As+4rFweEPv2Conhj5AMH5mCeBraho=;
 b=EXxE8/3Fz2L01t6iY26eHHhk+8M/PZ1E6nHMMky/VweeifSco+bj/BlVGVR8wbaPPUh3ZMgy5zwpAnjK6U7xGgLgkNDEc1ZBilE/B9fv70LxTj6ejX9601NoiKxgq06YmTfYhw9+sJWcjqKro49qWJeOGCRRXAnWwSuVr0uG5Si0UvaJVwyO0h6YhFB2S2Jv7+pnuX1Nf2/CDFR9fsZ7RQZbDWhG/tSW64JVE6dPf4ygQzqYvUUJ+zTFsz/f4tdNwEMwDRqHOgm42Yk6nlEO+zMlU8g4t5YOHLL8Jmo7rbCaaecAnhUPobUoPYMUkeThMssYwL2wAj6GFesOsGXDuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHOrb2hcV685+As+4rFweEPv2Conhj5AMH5mCeBraho=;
 b=ve3l+ed0P7pZj88yEPjKAkgZCFfw8s1p7hWHljxKlhXs/4YyfhbB0KcAdJKfJ7MtoBIuhH1cwldn0VXkwduqSKqFNZL9+2xdgtYZpaQvhtfXc6fjp8DgCS+4aIEwuktFoIG/eY8o0n7xsDMBoxUZXxGw2p8jUL5Ja1sevLm39as=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4048.namprd12.prod.outlook.com (2603:10b6:208:1d5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.24; Fri, 5 Feb
 2021 14:53:59 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.023; Fri, 5 Feb 2021
 14:53:59 +0000
Subject: Re: [PATCH 3/3] drm/amdgpu: share scheduler score on VCN3 instances
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Liu, Leo" <Leo.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210204144405.2737-1-christian.koenig@amd.com>
 <20210204144405.2737-3-christian.koenig@amd.com>
 <036c900b-df46-5259-dbd2-d882f9a7341b@amd.com>
 <16461e0e-703e-207e-35c3-b6b71429410c@gmail.com>
 <MN2PR12MB4488DFD306A90EE9F1F44F9BF7B29@MN2PR12MB4488.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <73693127-79ae-1628-b9f3-b37a5262f164@amd.com>
Date: Fri, 5 Feb 2021 15:53:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <MN2PR12MB4488DFD306A90EE9F1F44F9BF7B29@MN2PR12MB4488.namprd12.prod.outlook.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0101CA0076.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::44) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0101CA0076.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Fri, 5 Feb 2021 14:53:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c4969b37-043a-44de-39f8-08d8c9e5de3a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4048:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4048B93CFC74099534FB778283B29@MN2PR12MB4048.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wFMYqerVjpMX8cpXu722v+gE1GLWy0Fi4wKYDbwOylC3ryKfMIDPkOs6xPUKpUxxWvaubGlKpOtRM/r3rx6wTH5Gu6cMJIP5eum8DFqc7AQXO+I4VSZ4IbPqwn4pFx5M8woQApsxFxF6thswv3Ur9DSjCgfuTCDzvQjNHxbE1t5DTKpocLQHnGUD1d2obOg1Rr5+tbp5Ru2rgchgGo5vBPGDBRfeEQu2slKV0dVRq98c5l8q3RgCf4Z2/Da2W3RD2Zqi7w+aJ/2qXjAIsnKgrcimLsSest/QbKgjvr+EfnFZEB3Fg3XAOM3/xKdzBIzNuMTvSlLa8LMxrBB1FLkKcbAZTRjDJfzYPURDBEiOSZg56EK0kOBqmGHNS9Z8wrHJMg62pcdkEbtmQ2zdkOC1c17TJ2zbKgvGJKwyBpQbfs69nM2H8lZQpnnf3wCijcp3Sh/Uok8wJv/u1nwLBFpP2Q9ktUB6MNsz+wkmq9nwfPlvdJ3S9BYSiHo5W1asgrhSp6+oSlNlMcT3o7ibGMJGO5udR3Ho9hPX2HLLS9mHn/9FAQywXYcKkuS0zidwNECP1go1hOpnSKN3/Vu4iWsxnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(450100002)(186003)(16526019)(478600001)(5660300002)(316002)(31696002)(33964004)(36756003)(19627405001)(86362001)(8936002)(66556008)(66946007)(66476007)(83380400001)(31686004)(2906002)(53546011)(6666004)(110136005)(8676002)(52116002)(2616005)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHlVWkFiS2tscmY1Y2FLQWVTWU96UDU2K3c4Y2lIYkpIMW03RTJ6MVFoZ0Za?=
 =?utf-8?B?c0Zia0VMY2lqMEpFRVNBTzJNU0UrcjdEOEJ0YlJ3T3VDb2phaUMxWExUOFJ3?=
 =?utf-8?B?cHhEcGhENk5lOVpReCtQclprV2RGWXRuSmNlLzZzREFDOVNCU2JJVitDWW8y?=
 =?utf-8?B?cG90NlhXck12eG15UnNyenBPbzFtaTVnZmNlSW9XcndML2JaN1BtNVVPc0sx?=
 =?utf-8?B?L0R1NlBFWFQ3TVJFSzBXM3ExSGhvbXFzRXdCR1hYN1RHRmZZZzJqcHVxOHFH?=
 =?utf-8?B?bVJVVlpBSGFpVGdWeVJ6OVJyeldrR1Q0MllwTlEwUkpWL0hsN1d2NDRXdnVm?=
 =?utf-8?B?OWM0NzYxMU90NUVlb3huTC90cVNMenRKcGVvajhubHB2eFdkQkRVOThJSkVY?=
 =?utf-8?B?em4rb29BKzEwTXoweDFlR2g0cGo3Tit2aFBDRFBhb0srOHJoQTdwV3UrRmNz?=
 =?utf-8?B?M0loYU53YUFPU09kWkRKN0tSQjNhOEVZUWVRcWNQcGROSjFIeXFPTkdnNnJK?=
 =?utf-8?B?TVZWUDVMWm5EWjRrZ1pwYXR5bUhLclIrTzdiS3lxZmZscEpxNHZBWnZpRUtN?=
 =?utf-8?B?TElvNWN0SnA0LzF4SGNVUjZ1VjFjRHlNTmtzTVVMZEJsQnRxTVNoeVpwTEhX?=
 =?utf-8?B?MG9tNkp6N0RyN2ZBZEtLYWtXZ29IQURDMHlHNnMzbkJ1S1NYTVU5SnRlaDl4?=
 =?utf-8?B?NWRxWU5RZ2JXVEhONkxWeVpxT1dxUWNDdUJtMGFjdmtKTU4vcWpVT0VnMTBK?=
 =?utf-8?B?NWJFcEt6d2hPR0VXcXA0RjVVWWZLczFmYkJXMnBkcUNMNHZUUmFzMlkxZnY5?=
 =?utf-8?B?MUUrRmpERThybWdEWXdJYzI5ZGc0Nmd0OFJnN0h4VWhnM2JoQ0Q1Z1dWYlpv?=
 =?utf-8?B?eEw1aVRsbjNiK21jZWt4eDBqeTFLQ3NuN2FNR0I5QkFvcnBtSDFKSjlyZm1B?=
 =?utf-8?B?LzQ0VlJBbVUwL0I4Yk5sNXV0UytMVTQvczFZVWhRTjA0LzZPQVA4WU9OekMv?=
 =?utf-8?B?S1hrdVZwdXVHREM2Y3BLN2tDWEdhbXljM1VuWmZqYVo0SkxJNTZiMDJLQjU1?=
 =?utf-8?B?R3FWRUw1ZXEwSWpsUStzQ0JaZHl0YU9rQ2VqZEFZVGRVeGxNQ1cwSzNFRWo5?=
 =?utf-8?B?OG85Z2EyZmxZUkxVcDNIZitFUEZtVC9QVVhpYm0wV3lOWXUwaW5NWEc1N1BZ?=
 =?utf-8?B?NWxuRG8yVnhqT3ovTVNRK0ZsUUJOazFka3o5MGNYdGRndkVlR1Buck14ayt4?=
 =?utf-8?B?SkZKR2xBcno4UWVvOWlIQzkyUUt4OTllVkhPMXBIbHdLdXhCWlpiTWoxcmoz?=
 =?utf-8?B?L1RiOUk1TzJIT0VkY2lmZ0t3bHJ5aVNnZnBGSndabGdCSW5HVzlrYVRiTlV1?=
 =?utf-8?B?RW5IU1ZPSEFSRVZIU3QxUjR5ZTBvdnlRMjVocC9QVkIwbW02SllqN09RMEI0?=
 =?utf-8?B?c0FGZlZGekoxZHlHelBWek1PRmVxMlhFd2wzclBuQm9YTll1R2szUTJHdHB2?=
 =?utf-8?B?b2lYTU5FSXo4emZkYkl6aGN6b29TdHJUU0xIaWxGMC9teG0vYlZlY0paRGxE?=
 =?utf-8?B?R21jOHE5OTVXVUxzMkEvd2ZhQWpPQmUvZ0FXM2lSclZMeEg2eGs3cnRoV3J6?=
 =?utf-8?B?NnFKU0ptNjI0SXYwME5tOXNIUXVaU0ZyVWd0bTBLSGFMandwUlNFbGFBT0Mv?=
 =?utf-8?B?SGJ2SW9zZ1F0WFlnRW9HM0JaZDJ4cGRyVDZLTVd5cmxZdE5Ndk5TSkFLRXNz?=
 =?utf-8?B?LzBIeUZNeHJRQ1VTRVlTa0xHRThLZHlhcURjVExNdGpHNWxkV0ZkS0RnQUtL?=
 =?utf-8?B?RkpwTHJSRHdvU1JWdFZOK1R2S0xEdEZJaDdaemFjMitJTlRKcmFwRytuNk0v?=
 =?utf-8?Q?b7e5Fhk5VMvHD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4969b37-043a-44de-39f8-08d8c9e5de3a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:53:59.7140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1rRvrABvCcA/5EvRtUHybDuCtM7FVQEERDz9hICPHWDDPkI0C3fPXizhovVTBdc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4048
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
Content-Type: multipart/mixed; boundary="===============1229951874=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1229951874==
Content-Type: multipart/alternative;
 boundary="------------D67C834D7CE42DEF2F56AE84"
Content-Language: en-US

--------------D67C834D7CE42DEF2F56AE84
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

The alternative is to wait till drm-misc-next is merged into drm-next, 
then rebase amd-staging-drm-next on top of that (or directly 
drm-misc-next) and push then.

Would give us at least a clean history. Question is rather if we want it 
in 5.12?

Christian.

Am 05.02.21 um 15:50 schrieb Deucher, Alexander:
>
> [AMD Official Use Only - Internal Distribution Only]
>
>
> Good question.  I think push it to drm-misc-next for upstream.  We can 
> carry it internally in amd-staging-drm-next for internal testing and I 
> can coordinate with drm-next.  I think the amdgpu changes are pretty 
> straightforward, so shouldn't be too hard keep the merge straight.  I 
> dunno.
>
> Alex
>
> ------------------------------------------------------------------------
> *From:* Christian König <ckoenig.leichtzumerken@gmail.com>
> *Sent:* Friday, February 5, 2021 4:58 AM
> *To:* Liu, Leo <Leo.Liu@amd.com>; amd-gfx@lists.freedesktop.org 
> <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org 
> <dri-devel@lists.freedesktop.org>; Deucher, Alexander 
> <Alexander.Deucher@amd.com>
> *Subject:* Re: [PATCH 3/3] drm/amdgpu: share scheduler score on VCN3 
> instances
> Alex how do we want to merge this?
>
> I've just pushed the first patch to drm-misc-next since that needed a
> rebase because it touches other drivers as well.
>
> But the rest is really AMD specific and I'm not sure if the dependent
> stuff is already in there as well.
>
> So if I push it to drm-misc-next you will probably need to merge and if
> I push it to amd-staging-drm-next somebody else might need to merge when
> drm-misc-next is merged.
>
> Ideas?
>
> Christian.
>
> Am 04.02.21 um 19:34 schrieb Leo Liu:
> > The series are:
> >
> > Reviewed-and-Tested-by: Leo Liu <leo.liu@amd.com>
> >
> >
> > On 2021-02-04 9:44 a.m., Christian König wrote:
> >> The VCN3 instances can do both decode as well as encode.
> >>
> >> Share the scheduler load balancing score and remove fixing encode to
> >> only the second instance.
> >>
> >> Signed-off-by: Christian König <christian.koenig@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h |  1 +
> >>   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c   | 11 +++++++----
> >>   2 files changed, 8 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> >> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> >> index 13aa417f6be7..d10bc4f0a05f 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> >> @@ -211,6 +211,7 @@ struct amdgpu_vcn_inst {
> >>       void            *saved_bo;
> >>       struct amdgpu_ring    ring_dec;
> >>       struct amdgpu_ring ring_enc[AMDGPU_VCN_MAX_ENC_RINGS];
> >> +    atomic_t        sched_score;
> >>       struct amdgpu_irq_src    irq;
> >>       struct amdgpu_vcn_reg    external;
> >>       struct amdgpu_bo    *dpg_sram_bo;
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> >> b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> >> index 239a4eb52c61..b33f513fd2ac 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> >> @@ -171,6 +171,7 @@ static int vcn_v3_0_sw_init(void *handle)
> >>         for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
> >>           volatile struct amdgpu_fw_shared *fw_shared;
> >> +
> >>           if (adev->vcn.harvest_config & (1 << i))
> >>               continue;
> >>   @@ -198,6 +199,8 @@ static int vcn_v3_0_sw_init(void *handle)
> >>           if (r)
> >>               return r;
> >>   + atomic_set(&adev->vcn.inst[i].sched_score, 0);
> >> +
> >>           ring = &adev->vcn.inst[i].ring_dec;
> >>           ring->use_doorbell = true;
> >>           if (amdgpu_sriov_vf(adev)) {
> >> @@ -209,7 +212,8 @@ static int vcn_v3_0_sw_init(void *handle)
> >>               ring->no_scheduler = true;
> >>           sprintf(ring->name, "vcn_dec_%d", i);
> >>           r = amdgpu_ring_init(adev, ring, 512,
> >> &adev->vcn.inst[i].irq, 0,
> >> -                     AMDGPU_RING_PRIO_DEFAULT, NULL);
> >> +                     AMDGPU_RING_PRIO_DEFAULT,
> >> + &adev->vcn.inst[i].sched_score);
> >>           if (r)
> >>               return r;
> >>   @@ -227,11 +231,10 @@ static int vcn_v3_0_sw_init(void *handle)
> >>               } else {
> >>                   ring->doorbell_index =
> >> (adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 2 + j + 8 * i;
> >>               }
> >> -            if (adev->asic_type == CHIP_SIENNA_CICHLID && i != 1)
> >> -                ring->no_scheduler = true;
> >>               sprintf(ring->name, "vcn_enc_%d.%d", i, j);
> >>               r = amdgpu_ring_init(adev, ring, 512,
> >> &adev->vcn.inst[i].irq, 0,
> >> - AMDGPU_RING_PRIO_DEFAULT, NULL);
> >> + AMDGPU_RING_PRIO_DEFAULT,
> >> + &adev->vcn.inst[i].sched_score);
> >>               if (r)
> >>                   return r;
> >>           }
>


--------------D67C834D7CE42DEF2F56AE84
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">The alternative is to wait till
      drm-misc-next is merged into drm-next, then rebase
      amd-staging-drm-next on top of that (or directly drm-misc-next)
      and push then.<br>
      <br>
      Would give us at least a clean history. Question is rather if we
      want it in 5.12?<br>
      <br>
      Christian.<br>
      <br>
      Am 05.02.21 um 15:50 schrieb Deucher, Alexander:<br>
    </div>
    <blockquote type="cite" cite="mid:MN2PR12MB4488DFD306A90EE9F1F44F9BF7B29@MN2PR12MB4488.namprd12.prod.outlook.com">
      
      <style type="text/css" style="display:none;"> P {margin-top:0;margin-bottom:0;} </style>
      <p style="font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" align="Left">
        [AMD Official Use Only - Internal Distribution Only]<br>
      </p>
      <br>
      <div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          Good question.&nbsp; I think push it to drm-misc-next for
          upstream.&nbsp; We can carry it internally in amd-staging-drm-next
          for internal testing and I can coordinate with drm-next.&nbsp; I
          think the amdgpu changes are pretty straightforward, so
          shouldn't be too hard keep the merge straight.&nbsp; I dunno.&nbsp; <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          Alex</div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <hr style="display:inline-block;width:98%" tabindex="-1">
        <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b>
            Christian König <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a><br>
            <b>Sent:</b> Friday, February 5, 2021 4:58 AM<br>
            <b>To:</b> Liu, Leo <a class="moz-txt-link-rfc2396E" href="mailto:Leo.Liu@amd.com">&lt;Leo.Liu@amd.com&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>; Deucher, Alexander
            <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a><br>
            <b>Subject:</b> Re: [PATCH 3/3] drm/amdgpu: share scheduler
            score on VCN3 instances</font>
          <div>&nbsp;</div>
        </div>
        <div class="BodyFragment"><font size="2"><span style="font-size:11pt;">
              <div class="PlainText">Alex how do we want to merge this?<br>
                <br>
                I've just pushed the first patch to drm-misc-next since
                that needed a <br>
                rebase because it touches other drivers as well.<br>
                <br>
                But the rest is really AMD specific and I'm not sure if
                the dependent <br>
                stuff is already in there as well.<br>
                <br>
                So if I push it to drm-misc-next you will probably need
                to merge and if <br>
                I push it to amd-staging-drm-next somebody else might
                need to merge when <br>
                drm-misc-next is merged.<br>
                <br>
                Ideas?<br>
                <br>
                Christian.<br>
                <br>
                Am 04.02.21 um 19:34 schrieb Leo Liu:<br>
                &gt; The series are:<br>
                &gt;<br>
                &gt; Reviewed-and-Tested-by: Leo Liu
                <a class="moz-txt-link-rfc2396E" href="mailto:leo.liu@amd.com">&lt;leo.liu@amd.com&gt;</a><br>
                &gt;<br>
                &gt;<br>
                &gt; On 2021-02-04 9:44 a.m., Christian König wrote:<br>
                &gt;&gt; The VCN3 instances can do both decode as well
                as encode.<br>
                &gt;&gt;<br>
                &gt;&gt; Share the scheduler load balancing score and
                remove fixing encode to<br>
                &gt;&gt; only the second instance.<br>
                &gt;&gt;<br>
                &gt;&gt; Signed-off-by: Christian König
                <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a><br>
                &gt;&gt; ---<br>
                &gt;&gt; &nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h |&nbsp; 1
                +<br>
                &gt;&gt; &nbsp; drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c&nbsp;&nbsp; | 11
                +++++++----<br>
                &gt;&gt; &nbsp; 2 files changed, 8 insertions(+), 4
                deletions(-)<br>
                &gt;&gt;<br>
                &gt;&gt; diff --git
                a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h <br>
                &gt;&gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h<br>
                &gt;&gt; index 13aa417f6be7..d10bc4f0a05f 100644<br>
                &gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h<br>
                &gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h<br>
                &gt;&gt; @@ -211,6 +211,7 @@ struct amdgpu_vcn_inst {<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *saved_bo;<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_ring&nbsp;&nbsp;&nbsp; ring_dec;<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_ring&nbsp;&nbsp;&nbsp;
                ring_enc[AMDGPU_VCN_MAX_ENC_RINGS];<br>
                &gt;&gt; +&nbsp;&nbsp;&nbsp; atomic_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sched_score;<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_irq_src&nbsp;&nbsp;&nbsp; irq;<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vcn_reg&nbsp;&nbsp;&nbsp; external;<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo&nbsp;&nbsp;&nbsp; *dpg_sram_bo;<br>
                &gt;&gt; diff --git
                a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c <br>
                &gt;&gt; b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c<br>
                &gt;&gt; index 239a4eb52c61..b33f513fd2ac 100644<br>
                &gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c<br>
                &gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c<br>
                &gt;&gt; @@ -171,6 +171,7 @@ static int
                vcn_v3_0_sw_init(void *handle)<br>
                &gt;&gt; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i = 0; i &lt;
                adev-&gt;vcn.num_vcn_inst; i++) {<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; volatile struct amdgpu_fw_shared
                *fw_shared;<br>
                &gt;&gt; +<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;vcn.harvest_config &amp;
                (1 &lt;&lt; i))<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
                &gt;&gt; &nbsp; @@ -198,6 +199,8 @@ static int
                vcn_v3_0_sw_init(void *handle)<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
                &gt;&gt; &nbsp; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                atomic_set(&amp;adev-&gt;vcn.inst[i].sched_score, 0);<br>
                &gt;&gt; +<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring =
                &amp;adev-&gt;vcn.inst[i].ring_dec;<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring-&gt;use_doorbell = true;<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_sriov_vf(adev)) {<br>
                &gt;&gt; @@ -209,7 +212,8 @@ static int
                vcn_v3_0_sw_init(void *handle)<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring-&gt;no_scheduler = true;<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sprintf(ring-&gt;name, &quot;vcn_dec_%d&quot;,
                i);<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r = amdgpu_ring_init(adev, ring, 512,
                <br>
                &gt;&gt; &amp;adev-&gt;vcn.inst[i].irq, 0,<br>
                &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_RING_PRIO_DEFAULT,
                NULL);<br>
                &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_RING_PRIO_DEFAULT,<br>
                &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &amp;adev-&gt;vcn.inst[i].sched_score);<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
                &gt;&gt; &nbsp; @@ -227,11 +231,10 @@ static int
                vcn_v3_0_sw_init(void *handle)<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring-&gt;doorbell_index = <br>
                &gt;&gt; (adev-&gt;doorbell_index.vcn.vcn_ring0_1
                &lt;&lt; 1) + 2 + j + 8 * i;<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;asic_type ==
                CHIP_SIENNA_CICHLID &amp;&amp; i != 1)<br>
                &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring-&gt;no_scheduler = true;<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sprintf(ring-&gt;name,
                &quot;vcn_enc_%d.%d&quot;, i, j);<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r = amdgpu_ring_init(adev, ring,
                512, <br>
                &gt;&gt; &amp;adev-&gt;vcn.inst[i].irq, 0,<br>
                &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                AMDGPU_RING_PRIO_DEFAULT, NULL);<br>
                &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                AMDGPU_RING_PRIO_DEFAULT,<br>
                &gt;&gt; + &amp;adev-&gt;vcn.inst[i].sched_score);<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
                &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                <br>
              </div>
            </span></font></div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------D67C834D7CE42DEF2F56AE84--

--===============1229951874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1229951874==--
