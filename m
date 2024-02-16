Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F0C858234
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 17:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36CE10E10C;
	Fri, 16 Feb 2024 16:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BGr+sj5u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD2010E10C;
 Fri, 16 Feb 2024 16:13:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJhZETIh2m+VfBcEiDcsrNbcvR9Ms1gsxQWcROCDG3I43MOQJYNxq2kmXjAxBb4CcXSYaPovdLOXDPNJpuFgRhFv/IgcVK3lJpWt6D04BCm0grJJDlm4EvsRPNy8Uf1Jppf7jGMXcNDMU/31zbfRmIP/fpimM0VYUyAFkSJCEBVOz/LT8SNpYAB5J1g55eK5Eua2OhF5eIdCosgWWh4Uk96PeL4aRU5Sv6XAPr1wznx4p6EaAKHKSoCRd0w9XKqY0fqNQNU8QJDi5uuqjTU+ySihWRrKMzy9gGYilTlLv2NIQZwfDxXp10d6s+W9l+hJo7isrx2WZfz8rVq4hFUm/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFQ/bj6GQDTICITZ6xjvVphNMCXiOGVFxgnXgd2q9dE=;
 b=PB3ZNqvt/D2ETD2OIiqj6LPrUlUYIYcj2rM+TnyNWhU06HeLHeIoqhoGYUexfi6n/ZMh3B4O07Xni1LiboC/glyDUjPmumtYWS24c1Zd4FQSVSkM9Yckubm5ft4iHRgtpVJtSArwVRKn1jpheYiFNDSqNuzk6NzBV/h6JP8NmnVdDK8v9Kend/6ty7rZzzIVU/mdC2QqPgdHLsOEXN5y3nIIE8xfNOU+NZqLw2+qM5EmsVNoN066cFo+Eq0MmA3wt39lRB13jxicuAvGM9txiIcBaV9zSkmgGB57h8GZuWn/dxMlY0+0BTElbQ1nQQMQF16vlpADlCpSJmmsn2LedQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFQ/bj6GQDTICITZ6xjvVphNMCXiOGVFxgnXgd2q9dE=;
 b=BGr+sj5uKah0Afdox3BUVYONBt53tS2K+COEbfChSx4bxcLC3Rk5MNjD7LmAWVvRrpa7qL6wTCf/HY3yIn2XUyF04BS0gHXRjklhnQPKQ4NxtW7/Sq//KeY/RHY0ggD2JybLtV/xebJLF+M15ntFFMKNZtJoLL03lqjYiETVUHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH8PR12MB7025.namprd12.prod.outlook.com (2603:10b6:510:1bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.15; Fri, 16 Feb
 2024 16:13:44 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994%6]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 16:13:44 +0000
Message-ID: <d30e50bf-5b8e-47cb-8abf-e474f8490c99@amd.com>
Date: Fri, 16 Feb 2024 11:13:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: add panel_power_savings sysfs entry
 to eDP connectors
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Hung <alex.hung@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240202152837.7388-1-hamza.mahfooz@amd.com>
 <20240216101936.2e210be2@eldfell>
 <82280a39-4e1d-41ee-82fb-758ceed953e4@amd.com>
 <20240216174242.15d07657@eldfell>
 <a25a6205-c43f-40ab-bb79-8199a8290912@amd.com>
In-Reply-To: <a25a6205-c43f-40ab-bb79-8199a8290912@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::31)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH8PR12MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: b4193c45-8e1e-4c18-56c9-08dc2f0a3fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +d48l5cySRbOcFFHE3uKhn5D6hENyX0LoUFZKoDMbqiVtOn7s+9LKVgY9w3th5pfWejhYVlvMpOy6DSZr3o/vHFDADqkWowkYnCK83AaTczj8K0uClkX0BIG5sWtTgi3IFRKeGAgkxiPYeyGA4wy7PaQ2DHUKBGNwqpuZo6vrqUGySVQNXSW8w2YX4t5p30d9JLvqggRNWy532TjJaLmlJwfadzoc9RBBr9ZyJ6COcmblqel1yUsvhIvDFWGrDnwraOK3I9w9dWnuY1Ig0InbYqakj0KH7tykmYt4N5eqF53kCTCboYIvJtvo1VAEVWQdqmxBYx35SuX9s4UjoOWE4RAMYPJF42OFpAhkNQAdpHirfnN83IFAspv+7UcbK9Ta56QSnGbjIERbfl9zLYXOYe3aDh9CiyqJv4lcnKqrHeXdimVVR10aXAH9KdavivGEaZyR4+ONtSu4PD8p5eqdFQD4KJ/JaDkTRVsMAbjTHL/Cfby/LvO83aHWLei48GvcsrTBuog9ZticZr5lT/n/jWBo2dqtV2thLENCf4M0GQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(396003)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(8676002)(66946007)(5660300002)(44832011)(31686004)(8936002)(2906002)(66556008)(66476007)(6916009)(4326008)(54906003)(316002)(6666004)(6512007)(6506007)(966005)(478600001)(53546011)(41300700001)(6486002)(83380400001)(86362001)(36756003)(38100700002)(2616005)(26005)(31696002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGloNldJTHdSQ3J3S3JLaVZZdUl3QWtZRFhickxncnBiOWZ1a0xNMHA0L2ZB?=
 =?utf-8?B?T1BXMTVCQ1paWjladlJLUVNpeDh1UVNqeit4OWZKR2ptVFJyOTF6RnRLV1o2?=
 =?utf-8?B?eEI4UTcyL0pyT3FqNGovbjRJY2NnMlBGR3dnb3NuV1d4Mm9Kb2VhRDBZRWkw?=
 =?utf-8?B?OWVzdVdob1FZa2RMZzZlZzBiWEJhYWxmdXNQWHhGa25wYk9FQzhOOTBhSWEy?=
 =?utf-8?B?RHpONFdtaXlXa2xmUHBVWWtrQlpkOTFZRHNBZFZGZ1hxVS9XdDhJcUZqUkFi?=
 =?utf-8?B?a0VMZU5BNkg1M3JDeEtqU1pYTC9mTDBzaUVKSHV6MGwyMFBkTStvV1k4ZnZY?=
 =?utf-8?B?NVpIcmM0aUZDKzROQWlVYVVJcGhJUlFBcWZpWC8vb21xUnVGcW1iZHFDaHZz?=
 =?utf-8?B?VE96MjVhYTd2UVh6UTlrb00yZUk3WXN6MEtGa1A0RGRDeVRBRHpObTd4ODNR?=
 =?utf-8?B?SmRZWmxNQ1E4cmtFWjh3R3JrNUNpSU9VemdGS3QvaTlvWVFZR3N3TTJFYzh3?=
 =?utf-8?B?L0ZweWpqK09icThFR1NNY0NISWxaZjhqUUUrTVZYTUxUWFRGRllMZitabGND?=
 =?utf-8?B?K3FheGhkQXgwdjJYSUVXaWhnR1BBaS9DUm1iWnQrVXZnOEVGVDNkb0x6VjBY?=
 =?utf-8?B?bitSN3hRbFo4dnVOSzkvT0dnS2FsYzR2S2x1U3FsMG9aeTZlSWxFVkxpSVFB?=
 =?utf-8?B?ZkVhUGRHcmo5VC81MTZza2YwcVBibmJkd1d2MXNZbzYyT29UUktCUzBOVXh4?=
 =?utf-8?B?bG1LeWg5dnVYMzRZNnN5Q2xWT1diZGlKdENyMVZjbDdXNUpQcHYvcVU1THMw?=
 =?utf-8?B?MXJEU0Yvd29DOTZBRDYxRnhybDNjSnJPRCtybmdRcXkzZnZmUGFZOUVmT2d6?=
 =?utf-8?B?OHJzNHZUY3lGRUdJaHp4ek92RXJkenlRMjNIS290VEY5NGZYWmR6QzJVbDhL?=
 =?utf-8?B?RkNFb3Z4NWR1WWVvUjYrditjOHNVSFhyQ2IwQXZjSlRnblkvbU01QzdwM3Fx?=
 =?utf-8?B?WkhtRDJncTFmREFxTWlhV3hyU1o1dC9kTVRHcW5XOUdoT1EvMWhuZ1VxdDM3?=
 =?utf-8?B?dFo1ZStCTVY4dmFaeXFnaUMvOTVSUXV4Wk4rZFNVekJHSG5UVEpxNVovUWZ6?=
 =?utf-8?B?b0NlaE5xOEg0YUdIbmxmWVhGdW1wWi9Kb1I4TFB6anh6eWw0ZEpyaUVhS01t?=
 =?utf-8?B?VmtZcjhacDFHUG9sR3oyTGFXS2YxZ2VoeThwREM1ZUZJZW1iTkV3Wk8rOHV1?=
 =?utf-8?B?dUlpK1lHSDROWWgxb3VqTzJudFhTUlMwRWI0S2hwR0NIS1lGNUxZcmdUS1M5?=
 =?utf-8?B?b0V4NVZ3a01taCtHTjR1Z3dxMEM2Tjg5L2hQMm9xNG1mSmpOcGl0amdWaEVu?=
 =?utf-8?B?dDBvbmovdnBvUGJqUUowRWJHcmFDcVF6OFArRkFTVGM4NU8wWklOT0phWkdq?=
 =?utf-8?B?UU5CdUpQR3h1M25RbXlYb05Ea1FRTVlMOW5YeDZreDNjMlZHRm93KzRlK0JV?=
 =?utf-8?B?akxudVVIenFweCtZWDJNaFAzSEdSQ21aQWRTR0ZYSlp2ekhsWkcrVjMrOHdG?=
 =?utf-8?B?Z3FzK0M3aE9GWHQzcHNpNEtNRnN1eVRDK3FxS0ExOUJrQ2hkWS94QmNvbWM3?=
 =?utf-8?B?clNwQ2I5RzlvM0Q4Y1FaR05RbnIwVU1Id21GeEZYZHlaYkZGc2dxSk81eUVD?=
 =?utf-8?B?dHdOS0JaRVZXbzI0VnVhZ3o5SUU5YTVuN2VWclRLUEpSTXliYzNvZHFRaXp1?=
 =?utf-8?B?Y0JGakRHRytWZG42eitFQUJsNXRNQ0lmbkRWN1B1WGJuT1RWZDJrVWxxWmFC?=
 =?utf-8?B?YklUS3ZyQTVSQ252YVlyVkFpYllMYkZxYUQ4RnNTV3E0dm1xUzQrRWN5VnBV?=
 =?utf-8?B?cVZWSWlUVm1jTG9jOEIrbUpZc2wrUWtYT1hvWmM0YnNOYzJya0tJS1d5NlA4?=
 =?utf-8?B?dkNZQTNmazhaTklLVjFaZ3labm9tVWdkMWhXL1RJQTVxRlI5eWxyVmRLM1dx?=
 =?utf-8?B?NlRLSUdwcS84V1JKbWtTS1VLbVV0S0dmRlp6QlJmTmdGMVFhQVF3ZUlweU9F?=
 =?utf-8?B?cEV1SWIxRTk1NEZ6ZHhwQXRHbEpXeDh5anRDSHZoZWdGTm1ScytlRUZZbzYw?=
 =?utf-8?Q?SH1rn+PVDFxluKz41u03pnwwn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4193c45-8e1e-4c18-56c9-08dc2f0a3fb6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 16:13:44.6385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8h0HCLhdFv433QKt3nhTZFUATlZPzFQoXbc4iMUgcQ2KjFjbWW0AC8rdJ5zntZIlaRRB/8CNDBQ5+Oc7PMNF/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7025
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



On 2024-02-16 11:11, Harry Wentland wrote:
> 
> 
> On 2024-02-16 10:42, Pekka Paalanen wrote:
>> On Fri, 16 Feb 2024 09:33:47 -0500
>> Harry Wentland <harry.wentland@amd.com> wrote:
>>
>>> On 2024-02-16 03:19, Pekka Paalanen wrote:
>>>> On Fri, 2 Feb 2024 10:28:35 -0500
>>>> Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>>>>   
>>>>> We want programs besides the compositor to be able to enable or disable
>>>>> panel power saving features.  
>>>>
>>>> Could you also explain why, in the commit message, please?
>>>>
>>>> It is unexpected for arbitrary programs to be able to override the KMS
>>>> client, and certainly new ways to do so should not be added without an
>>>> excellent justification.
>>>>
>>>> Maybe debugfs would be more appropriate if the purpose is only testing
>>>> rather than production environments?
>>>>   
>>>>> However, since they are currently only
>>>>> configurable through DRM properties, that isn't possible. So, to remedy
>>>>> that issue introduce a new "panel_power_savings" sysfs attribute.  
>>>>
>>>> When the DRM property was added, what was used as the userspace to
>>>> prove its workings?
>>>>   
>>>
>>> I don't think there ever was a userspace implementation and doubt any
>>> exists today. Part of that is on me. In hindsight, the KMS prop should
>>> have never gone upstream.
>>>
>>> I suggest we drop the KMS prop entirely.
>>
>> Sounds good. What about the sysfs thing? Should it be a debugfs thing
>> instead, assuming the below question will be resolved?
>>
> 
> 
> It's intended to be used by the power profiles daemon (PPD). I don't think
> debugfs is the right choice. See
> https://gitlab.freedesktop.org/upower/power-profiles-daemon/-/commit/41ed5d33a82b0ceb7b6d473551eb2aa62cade6bc
> 
>>> As for the color accuracy topic, I think it is important that compositors
>>> can have full control over that if needed, while it's also important
>>> for HW vendors to optimize for power when absolute color accuracy is not
>>> needed. An average end-user writing code or working on their slides
>>> would rather have a longer battery life than a perfectly color-accurate
>>> display. We should probably think of a solution that can support both
>>> use-cases.
>>
>> I agree. Maybe this pondering should start from "how would it work from
>> end user perspective"?
>>
>> "Automatically" is probably be most desirable answer. Some kind of
> 
> I agree
> 
>> desktop settings with options like "save power at the expense of image
>> quality":
>> - always
>> - not if watching movies/gaming
>> - on battery
>> - on battery, unless I'm watching movies/gaming
>> - never
>>
> 
> It's interesting that you split out movies/gaming, specifically. AMD's
> ABM algorithm seems to have considered movies in particular when
> evaluating the power/fidelity trade-off.
> 
> I wouldn't think consumer media is very particular about a specific
> color fidelity (despite what HDR specs try to make you believe). Where
> color fidelity would matter to me is when I'd want to edit pictures or
> video.
> 
> The "abm_level" property that we expose is really just that, a setting
> for the strength of the power-savings effect, with 0 being off and 4 being
> maximum strength and power saving, at the expense of fidelity.
> 
> Mario's work is to let the PPD control it and set the ABM levels based on
> the selected power profile:
> 0 - Performance
> 1 - Balance
> 3 - Power
> 
> And I believe we've looked at disabling ABM (setting it to 0) automatically
> if we know we're on AC power.
> 
>> Or maybe there already is something like that, and it only needs to be
>> plumbed through?
>>
>> Which would point towards KMS clients needing to control it, which
>> means a generic KMS prop rather than vendor specific?
>>
>> Or should the desktop compositor be talking to some daemon instead of
>> KMS for this? Maybe they already are?
>>
> 
> I think the intention is for the PPD to be that daemon. Mario can elaborate.
> 

Some more details and screenshots on how the PPD is expected to work and look:
https://linuxconfig.org/how-to-manage-power-profiles-over-d-bus-with-power-profiles-daemon-on-linux

Harry

> Harry
> 
>>
>> Thanks,
>> pq
> 

