Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6DC6883DC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 17:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CB510E46D;
	Thu,  2 Feb 2023 16:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E20310E46D;
 Thu,  2 Feb 2023 16:12:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMEA5qtItSLmtHB2FT3k4UjQYYcJEPokSRT9IG58lNKG0Uqzb1lhWTSYOuK8WE5GgRO0WNaE9MtUTvbuEJzQWYszQS6ISWU9WzXrj7yoMcLq+/KjTF/x94fMyh8TgJpdCgStksR+TjK21l7d1Ag2ZFIGJ7RtIVZec4HXZkzsscVxSVEghazokU0sl3KrRie+45yMFUE9M1l39Fy3Qq+98WmYf+ljzIhb7BI73/7QXTDl3LvpnBqj1XWbsZUKT6jnPxKTdAZnYBqndkrQvTlQ1bDSrU1vQCX0WUkzMY+CLemjMW+MPCl4uy2aztvDaJqMwUg81Wwkg3fklVLRA99h3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBA04wjWZ0oSZWUxsozCqKSobMPF2V8jq+K2l3GzJlY=;
 b=ERpsNBcuqGvqG5NvzcrBT/EQywodJqiHgULdp7UTEOnnWEkC6P0eK7MQFtuHt1O5pBB9oeG3qn11rFVm4MQ31rQjCoGkWMtJMC5g1oq9WToMiABClyDZK/aTr+gwmGZ+Or6Anczke3QQfPAWYVyDVKjQFCjahqffgBOtMjo0U/YxYCo9Qn6Hlw5rCxyWWDpFmugNhOVW6ANUJ1BOap4/75rt4uHItzJ/YrHmkoJ4/41Q22qOjWHcMdAhX/xOV0StmR1jIbRTk56cKL4oYaCfq09L3wYDxWJAUZ+4nHZF9CwhoZyntM+s/ex4vT+Lp1KrPmI5msDB1I2CPSuBfJBLvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBA04wjWZ0oSZWUxsozCqKSobMPF2V8jq+K2l3GzJlY=;
 b=TeDMdTlbziChwKVmnrSrtHotgJoM2lV3BSrOyGTq2rB0T9w2yr0G46QUGxMFU5wkz32gAVyA4vuDtsNU9hS/r6mrwxaBEEiiWNC0xe/YIWZNv+cvXIOmv1fdhpaSXssQG5ZCBlhD9f0LpQliaUYnToMku+TxqKmSNVfYcJ8Q1b4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BY5PR12MB5509.namprd12.prod.outlook.com (2603:10b6:a03:1d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Thu, 2 Feb
 2023 16:12:41 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e%7]) with mapi id 15.20.6043.023; Thu, 2 Feb 2023
 16:12:41 +0000
Message-ID: <f7805d0a-6fbd-7389-a2fd-d6343ef4598b@amd.com>
Date: Thu, 2 Feb 2023 11:12:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-CA
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, amd-gfx@lists.freedesktop.org
References: <20230202134856.1382169-1-gpiccoli@igalia.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v3] drm/amdgpu/fence: Fix oops due to non-matching
 drm_sched init/fini
In-Reply-To: <20230202134856.1382169-1-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::18) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|BY5PR12MB5509:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d55613a-2917-4bdb-0524-08db05384f7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VOzAjPcVBYHr64DITUtBNQ5rqCZz3lWR/GVR8Wgy9Nq0c0tq/lgmHNSJaJR6OKXLOspl8+A3iGZS8ddDgV2wBK29xUDI5aMXBzSjtXxqm073wvN7vSjI5+UcJup0DGwvfHrkKTlVIHME1L5DVY+9pOXdhSxX/vCKLqH1hYdv5gAYDrDtS35PIoYYR6aIfIo0WL8uOhQTu9dv5Ndgsffa49f8QSpClmeJz9B9ssNqjNVgltHbXrKNcZ1yf75YewZtRB2rfQpahjGTU/aYZod4xFVrpKJ78JMSDDOynVyNe9Jetiwr9s+pyYhe/IB9879Q8WucW5PiGicp4ktSC96x6MIAmt2HSYTfxIBSNVrKqUZspxRMu0pIJXpYbAW2BI2jCtGJZK+YoW+mnlxi/rCqS0SGDkxgiL0B0xHpguiwQjWspGZEns0g+j2zy/ets5ZK5Wx5q7YxXLFnt+vTDPzlXPe6b629AUkLsH5nBMDylmyf8KhQmDbFRu/3XMDVhTfiExK2iI9U/k31lU5iIwjWZmBPBiyozYkBMgGLmbXCzVXjxCCxHmHZ+KBPPf+v85hlvBkY9E9B8IVfh0eAe/A4I+yVo/U9CN50AT1jSDW0FIi4AxmjurGXy9K8g0Rhcbkt7pALjFs3oTEM3bo+5lapw+UU2wIA0KdrUF5eWNCTGG3feMexJXsesPx2BnrWEgrB9AL+Vf3DqLKPD6SFhX/tnJ3wVTOJyrpLTvvLNVEgbEN3c+iv9cRrcbCFq42c9fgXFjFWDPp+FEyPkmRMivaT63w3bicJ9ZjlM6nIOTUrjA0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199018)(2906002)(316002)(31686004)(6486002)(966005)(4326008)(8676002)(478600001)(66476007)(66556008)(66899018)(54906003)(8936002)(66946007)(38100700002)(31696002)(5660300002)(6666004)(6506007)(53546011)(26005)(86362001)(186003)(36756003)(6512007)(2616005)(44832011)(66574015)(83380400001)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzQ4dzE0RHFIN210MGdFQVNMTTBaU0hwZmhsbnZJOFI1RHE0Qmw0VGVvV2RV?=
 =?utf-8?B?d0ljbVdnbnNWRmc0OE50K0E3RmlIVVYzZ1hKZ1NqSTdrVDdCdXNvM2xXYUlM?=
 =?utf-8?B?VDE4dDhCMEdxL2NQNGpaUmY3TVp0R0FVL202TFNrUktiOVNRdms3eVFVZ3dy?=
 =?utf-8?B?VmgvTTZtazVWTEgwZDFQcUpIODRZMzBIRVVMZk9vZmY1cjM0ekhVSDFpODBT?=
 =?utf-8?B?K0xxbEgrNldsQ28ySHFyVnVvMkVtVzI1dlFHZzlGNzVaaC9PYmxWR2tuak9G?=
 =?utf-8?B?enkzeEhpR2JzWVF4UDZ3L283ODV0RzhEdU9UekNPaElKYzdUd0lHZkgvNlNl?=
 =?utf-8?B?OFFXaVJqQjVFU3FYd3JlQytLZVdGdlZ1R01jWWxhV2xmWmY0bWFZekhBcHdY?=
 =?utf-8?B?MjVydWhnRjhSUjliajErQTFCcWoxbC9vWm0wWlpQbjN5RWw4NGJ4SHV2TFdw?=
 =?utf-8?B?aS9mMGxLeFQwOGw3SDgwbHBPdUdvL0VoRzhESDc2L09TVmlQNmxDQ1Y1SXQw?=
 =?utf-8?B?Ti9YUFp4SllnTkxJYlhDQlVMVFhXOVRZbTZBelJVWWFweS9Kd2RBcUhqb3Bl?=
 =?utf-8?B?cnVEbjBndU53TGRPTzFZMEM0M1huZXVtNzBjWnVKMHpUMTR6VHJCR2Z1a0dn?=
 =?utf-8?B?WTN1K2Y5ckxzOFJYeWVRTzZaUFFxeXkwS1gyU0h5U1Nyem9zeFRNalRhTWdu?=
 =?utf-8?B?ZDlySDNNOWhYU3dVSTV2bHIwRkNqdW1IdzZoZ1ExbUlyMmpOa3JseFBJRnFU?=
 =?utf-8?B?SW5xeElKUnpxc0c2cStnQmxpZDhlTGk1cUpJcVVNek43NjhrbGMwZmdkTWV2?=
 =?utf-8?B?L25nZXo4MUI1NWJoQTI5VEIzSFFhWUVhQklQcmpYZ05BRko2cWtxNDJvYzFi?=
 =?utf-8?B?bG81V2lvSnluN0xlblVmZTFhWWFYOXJBb2toWklXZ1ptZXJRaklsNlFTLzR4?=
 =?utf-8?B?dkhDaUVVdDBvRFBoS2QyYUhyMEhqQUhLQ0ZpYzB0RnkzSkV4UGt1cnBWS21W?=
 =?utf-8?B?OXZPVmh1azBGZmdjeGdWZExqZHg4UWNxOHc0QU1mNHgwcmdSTzlGY2FOL2Q1?=
 =?utf-8?B?MXNibWx1Q0wwMlB0VDBLTFkvd1EzSHVBcmx5QU5mc3lXdFNycjRWSmZDRzFr?=
 =?utf-8?B?Mkt0YkU5Y2JjVE1kRjBsUlU3RDVqV0NlRytnR2FlbktpYTIrU1l0c2E3eFJU?=
 =?utf-8?B?ZkE4RWRHSEVxWm9ydGUvK2ljbWRhZkt5Q3BSNDJpR2xZcjNFdjMwZnJqZzVx?=
 =?utf-8?B?amRSWXgrSzh6ak1hZkJaRzJxbHYxYlBuU3lFYzdjcDRGVkdhaHR2WTZEc1Q4?=
 =?utf-8?B?c05CREdYclZGRjlqUFpWSExadE11RElSV0ozblFsNHhWeHF5bWZpMW5kSDJw?=
 =?utf-8?B?T2pIZ0MvaHNpUnVUdWVka0p5YWhEK0lmTUJjaGVkckJWdllodkY2Nkl6NVlD?=
 =?utf-8?B?T1ZZR3pPVEpnZTBxclYxQXdHUG1FVWxBRk1DRkY3QzNEbUNPaXBhZDZ2SHFV?=
 =?utf-8?B?b2llekJVclBscEZ0R3FVcmVaMlgyRFZyazdibktMVVNhc3FscnZWWDhUU1Bn?=
 =?utf-8?B?NkJXYVlUUjZjQWJNNWNUREltQllLVjhGTTY3emtIVHQvSWVDOE04ZURESWli?=
 =?utf-8?B?TGRwczE1NlB0eXMzMDlvTEFwNHpnQ0M4RkpudFgvK0pPMjZYU2ovSEpHNlNi?=
 =?utf-8?B?TkRiVmJMZjhpSzVqbFdJS1pnbzV4a2N5SWpsUitXdnpEM1lHbkxSYlZaN3c2?=
 =?utf-8?B?YVV6OTJsTVBoSnVTZ2UwNnJPeHpFTHdZaHdmN3YvU2VLeTNzR3h1YjF2VWRE?=
 =?utf-8?B?NnMwWVRiT2NzckY1Kzl4Y3NXL2ZjWXJtRFJBWXlzWkN1RUJoSHJLTmxvZUVX?=
 =?utf-8?B?ZnNEeVVrWVRSaE50enpTdWY2V2N4bWtPSHdhRlJHUE9NUG5kdjQrUVlIYTRn?=
 =?utf-8?B?emhtUzl4UjR0NkVqU2RjcWhXQVY0WWcwR0VYekh0dUhsTzg1U2N1Z2ZYamJC?=
 =?utf-8?B?dHplcVc0OFd1bzhrd1Q4ZmlDTDE5aHRQWlpISFdTZ2J2ZWhxb2tOS0xSU3VP?=
 =?utf-8?B?Y3EvY1RsN0hDUzY1bGhnK3NlbS9ReVhiQXhKMTFGeHA0OHpWV3F6ZDRpdjdY?=
 =?utf-8?Q?Ss8cwM1CDwKFTVLP7lC2akefp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d55613a-2917-4bdb-0524-08db05384f7b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 16:12:41.5014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rr04QA1mWXBPje0rkW9M61zBv8E1IITDJeuGZBwq1UFV29MbLmXmeNz7+mlcbliR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5509
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
Cc: kernel@gpiccoli.net, Guchun Chen <guchun.chen@amd.com>, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, Mario Limonciello <mario.limonciello@amd.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guilherme,

Thanks for redoing to a v3. This patch is:

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

On 2023-02-02 08:48, Guilherme G. Piccoli wrote:
> Currently amdgpu calls drm_sched_fini() from the fence driver sw fini
> routine - such function is expected to be called only after the
> respective init function - drm_sched_init() - was executed successfully.
> 
> Happens that we faced a driver probe failure in the Steam Deck
> recently, and the function drm_sched_fini() was called even without
> its counter-part had been previously called, causing the following oops:
> 
> amdgpu: probe of 0000:04:00.0 failed with error -110
> BUG: kernel NULL pointer dereference, address: 0000000000000090
> PGD 0 P4D 0
> Oops: 0002 [#1] PREEMPT SMP NOPTI
> CPU: 0 PID: 609 Comm: systemd-udevd Not tainted 6.2.0-rc3-gpiccoli #338
> Hardware name: Valve Jupiter/Jupiter, BIOS F7A0113 11/04/2022
> RIP: 0010:drm_sched_fini+0x84/0xa0 [gpu_sched]
> [...]
> Call Trace:
>  <TASK>
>  amdgpu_fence_driver_sw_fini+0xc8/0xd0 [amdgpu]
>  amdgpu_device_fini_sw+0x2b/0x3b0 [amdgpu]
>  amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
>  devm_drm_dev_init_release+0x49/0x70
>  [...]
> 
> To prevent that, check if the drm_sched was properly initialized for a
> given ring before calling its fini counter-part.
> 
> Notice ideally we'd use sched.ready for that; such field is set as the latest
> thing on drm_sched_init(). But amdgpu seems to "override" the meaning of such
> field - in the above oops for example, it was a GFX ring causing the crash, and
> the sched.ready field was set to true in the ring init routine, regardless of
> the state of the DRM scheduler. Hence, we ended-up using sched.ops as per
> Christian's suggestion [0], and also removed the no_scheduler check [1].
> 
> [0] https://lore.kernel.org/amd-gfx/984ee981-2906-0eaf-ccec-9f80975cb136@amd.com/
> [1] https://lore.kernel.org/amd-gfx/cd0e2994-f85f-d837-609f-7056d5fb7231@amd.com/
> 
> Fixes: 067f44c8b459 ("drm/amdgpu: avoid over-handle of fence driver fini in s3 test (v2)")
> Suggested-by: Christian König <christian.koenig@amd.com>
> Cc: Guchun Chen <guchun.chen@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 00444203220d..faff4a3f96e6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -618,7 +618,13 @@ void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev)
>  		if (!ring || !ring->fence_drv.initialized)
>  			continue;
>  
> -		if (!ring->no_scheduler)
> +		/*
> +		 * Notice we check for sched.ops since there's some
> +		 * override on the meaning of sched.ready by amdgpu.
> +		 * The natural check would be sched.ready, which is
> +		 * set as drm_sched_init() finishes...
> +		 */
> +		if (ring->sched.ops)
>  			drm_sched_fini(&ring->sched);
>  
>  		for (j = 0; j <= ring->fence_drv.num_fences_mask; ++j)

-- 
Regards,
Luben

