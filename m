Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F67858225
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 17:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE0D10EBC5;
	Fri, 16 Feb 2024 16:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="g7t0YA7f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE60B10EBC5;
 Fri, 16 Feb 2024 16:11:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvGkBkKTGGpJUIenc1RwQ0yai5RT1T8VbjqeHZ0jN36ILPWOoEU/nVD50NVC738EJYfVuhF3a3oQjPc9guGqhOMZFWgsdBxbAWDvSMLiuiSxiZYJ5Xmrrno5fXtuRamw+OOz6A1IfHJQAl5I5m+H6p+6Gpq5/3G7AENngPJTDZOovgivLRk/VJagO427YdQZQR+qpq30nNYjsjso0w5Zcxpa50cU877UJppRbjw/sphTJSkJXL0IrSgoNf5wOrQ2ytoKKZtaYmrLThtqBznA7za4zsvqEILShrwl97oKkeP2VVDTOvLzACPT2v+vGr75Bcywdhipc7/DEbmAxvAGHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvPXvgABxturFEEK7or3QCdjn+vzDk25OoML2FJGTxE=;
 b=lEPWEnpUd5tl0bBWSuuvv0RZZCaDA+tkMblAqvxEakgCVToZjilxtn7XaZDHGjBc9+Cx5SYVAYOx8Bt3/L9vva7P9O4U1/HjH0XcpxuHc+mX9COYoUZKRnZZawmvp9J6snQegRVLOhvQmemAy1tj6WX6jzKlVMHC5gDm0z5SnRNs7cv65vmfMLEVWgJurxUyYa71//swbdvna5GXcWFlCsXfh4ekSpPwsb0DkH5OqAWnEN/j6fZxuuvwkq5MbBN6RsjonNldge193CG218VWxzVIdnMGEN+/jM5Y4JTJNoUhYa7FsPKOrS5FYmL8y/vYrZJNgoE0XMCffrqjMOxsFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvPXvgABxturFEEK7or3QCdjn+vzDk25OoML2FJGTxE=;
 b=g7t0YA7f8eT39ZhvXxNW9JktzGGuDHNuMx9FW2AeTNy7UwC2v7Ag54yh1lq+OsYhfQ1reEuEKyf7GnNDydRzwaifFP1KDFHyQyePGoEoGTyI8RCjE35ZkGQnTNuDvcVX8Ijc2ybh52i4h9Rkb0X2CepnjRjDCx4CwE4aFjmWDb0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB8017.namprd12.prod.outlook.com (2603:10b6:8:146::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Fri, 16 Feb
 2024 16:11:57 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994%6]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 16:11:57 +0000
Message-ID: <a25a6205-c43f-40ab-bb79-8199a8290912@amd.com>
Date: Fri, 16 Feb 2024 11:11:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: add panel_power_savings sysfs entry
 to eDP connectors
Content-Language: en-US
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
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240216174242.15d07657@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::24)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e7a36c-8768-4547-0fea-08dc2f09ff7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SlAXPgw/ImNya6a2L1aasXdTvMljGkCvz40ptmkGMnh2SGr6WtkIuYE8MIyNbyqySYXMGDECRg3r05WJ/3nenfllGxPGcP94+KONLLfoK4F+ne24CP3Le5o6xNu4utTogR3F2ixSHIMdmfPCtOUrm/SSuN7M+zhKPJH8FWjA/IENJXTrX1ze4zKkCBaWaUx2rvPnzz0Hhpe0boVFdQIPCmtRRGjiKbKECBmJGlIKQ1H44MkwLbLl0FjXcsaa1lupmjOR8S0VSMfNPAY9qo/lw2fWqkpKDc8LRss24rOU/zYTbPpVvC+tUtPH+Y/uGA2cxFIUmsetSRviO7US1lEYkUtFFOltO9KQcA4ueFJsOF+1IOymvmd474JqAFL5zcCEq2QuJVB8Y/CTAxbYoNb0LeWQmClDEX66ypcATjQA0VL7dX912KREh4PjF53eCV2X9vOYPcXoXHl7WVHWs3UTbV4AvE25S/3h9N95KoAbHdZT87jN6ba2pkfnH+lVEK+UkvBCi8ceFVoeV3ssewd4PJBePe9Pqx+33vIIjVIT2uY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(136003)(346002)(366004)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(31686004)(44832011)(2906002)(5660300002)(2616005)(41300700001)(66946007)(66556008)(478600001)(8936002)(8676002)(4326008)(6506007)(53546011)(6486002)(66476007)(83380400001)(6916009)(6512007)(26005)(316002)(38100700002)(6666004)(966005)(86362001)(54906003)(31696002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVpvc1ZBL3Npak9raThKOVI1OCtiNFlPckNBR0toNFhqelhaUVVBczBQNW1W?=
 =?utf-8?B?Y3UzY3lTM1J4ZTZHZURhUVMrc0g4eHNZZ240aFEzajdYelBRbVFDdjAvdHhF?=
 =?utf-8?B?TEhYcFp5SVkrbDNaS1NXWkpWR1ZWMVhTOGhHOXVCV0wwTTFLcS9tWHVPVFNP?=
 =?utf-8?B?TGNGV2VmRXVqVDlqV0dwNUp5ZWZKOStXRG5vNDlmOERMS1VvNTZUMXo5RmYx?=
 =?utf-8?B?eGhFTDI0cytMWkJmbmorSVFZLzMzWTdQenB5Q0ZYektacWlRaDlGeUNEQ0t1?=
 =?utf-8?B?K2VOaE8wS3VQcEY4V1ZZZU0wcSsvTFhTdXRMT1NKUHNaelJnRnR2emFOZFBM?=
 =?utf-8?B?MVJkekJsOGo5MXB2VEd1UkZ5TmJqQmJqSXZOaXB0S1dqTWtldkRRWWU0NCtt?=
 =?utf-8?B?S1A0RXhURmt3cWtTN2djcFVWYS8waS8ydi9LNnRpYjYyNkpRU0oramJndGh6?=
 =?utf-8?B?VkNoNlc0MDFxaHdtYUJDd1pWWTlPaHlJUVpDRVNiaXNuaXlOQk1ObWhHYStW?=
 =?utf-8?B?QlZYSzhDenI5aWJzV3cxQmdEb2RKMUlVRFVPZ2lQdGV1VVA1Vis0QjJBcTZr?=
 =?utf-8?B?V05uYnNBZkhRSi9aVlVYbHB5cFNWeWljSHE2bkpSZU1QdmVNazNSeDY2QnNv?=
 =?utf-8?B?cUkydkNqUlV1YWhLRVNzNnlDQXlpUGhDbFhTcUVod3dua1hsVDlxdXoyeUhL?=
 =?utf-8?B?UW93SlVFS2ErZkJ1cmxCYiswSkVSMlVJdjFWZk9sZkxnMDZyWmltMWdsUEIz?=
 =?utf-8?B?SXJIOEpHL3dQbmEzOEtKdXhEUFk1eWFYOHA2SjEyaUhsaUt4UVh2UDNFMjAr?=
 =?utf-8?B?SWJZM3BXbTNyRms0YUpac0JOTVlBQUpSMktrTzBkQ2ZhQ050eXVOUHZ5V3pi?=
 =?utf-8?B?SnQ3anpXS2lObXV5RUpuUEdObHVZYTNtaWxGRDZmWDRMcGNDeGJ0UTZXMlND?=
 =?utf-8?B?SldENVl3ckZ5ZEpOUmNETElzUDVWSzBIN1NNaDA5RlJtRkY0ZkxnSzBnR093?=
 =?utf-8?B?cElSM2h2V1pveVdReHZMN2NLSGJ1WjFkNEVBd1hBMGNWZXYyTGorU2dSWDIv?=
 =?utf-8?B?MnpRKzRtcWl3UG9udzBEL1hUbGU0NXJGamNoanlMMW9pbmc5YVA1enZPTy9i?=
 =?utf-8?B?SGxkZCtrN3NrT2p5Q2tBOG5qWHR5bDJGTjJwd2VodFRsbHljZkc0ZUQwY2k3?=
 =?utf-8?B?NU9XejRLOXBwc0FoL3BrTDI0YVNvTVEwUDd2SGkzQzExZURRUGpueXdOOGYy?=
 =?utf-8?B?ZW90NFREa0tjeGptcUoxblIyUlFUZVE5cGo5UU5pWHFLTW9oWnJ3czR0dDIw?=
 =?utf-8?B?K2RIbEdicTBPWStBb2hFY0RLZVhyUmhZZnJ4KytBZm1KMTVod003TnZiQkpL?=
 =?utf-8?B?Uy93dGh2TENLbCttWSsxTVBPRjlsOEVOY3QzNjhuV2J2N1lMMXQ1L1hwV0N6?=
 =?utf-8?B?bGtVc0FuLzVoc3Y0cjAxZlFMSUxNUHBCZk40ZmM1MllBQklBQlhBUW14Ryts?=
 =?utf-8?B?NE55S1dsT2daT3NlZFcyQTh4SG1ZZTdVKzhKUzYwcnNySWpISzFzbkFpQ0VL?=
 =?utf-8?B?TnJybG9hNVFrZGRwVU5ReGFSZ3l2cWtnNHJyVmhqU1VSbU5WYlgyeDJXMWwv?=
 =?utf-8?B?OGRYanBKVFZDSmZtajlqUHZQZlpIMnhwQXJkNEdLS1BWOE1PV0tEenl0dURS?=
 =?utf-8?B?VFZKQi9LdWpadWE5YWZpeVdVUkF4NmZKK1oxSnVVYjNGSGFCQkFGK2pScFVr?=
 =?utf-8?B?eENocHB3cmk1ejRwLzF1RVZMNm9DQSt5WDVLcUlsT0dsL2owV0RZVnM1NmFG?=
 =?utf-8?B?S0VJSDFGQ211V0Nyb055TmxBY3RTNytaK2tLekVwZUFTOUVLSlE4aDhvelIv?=
 =?utf-8?B?K2w5LzEvMStFMXNOM0xZT1NoUTZRNXJOdUJ6WFJsdUt3dEpycGVZYUo5dDdN?=
 =?utf-8?B?UkFlK3FzRUh4RVlPMVROWTcwY3IyUGV1aGV4Rml4bnNiQnFrYWhyYmE1Smsr?=
 =?utf-8?B?MUw1SFk2UEozVVRmUVYzSTVDRDV3MkpNcHl0Q3h6cmRGL2F6MmFrNW5FUWJ4?=
 =?utf-8?B?STNGT3UrRVp4eURoRVV0clhvcWFtQndZR2kvLzRMSDRkZjk4UC9Pb1d4Qnda?=
 =?utf-8?Q?V4HWcEWd4eF533AAjszrdMr/y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e7a36c-8768-4547-0fea-08dc2f09ff7d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 16:11:56.9229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHuMu6di75C/JoiIcdO7p9f/YJWWmhz7DMyUoRt323duObxZwY29+mjQWTh7E5BNLZu5fpp8roOJ/vIHFxYK9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8017
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



On 2024-02-16 10:42, Pekka Paalanen wrote:
> On Fri, 16 Feb 2024 09:33:47 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2024-02-16 03:19, Pekka Paalanen wrote:
>>> On Fri, 2 Feb 2024 10:28:35 -0500
>>> Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>>>   
>>>> We want programs besides the compositor to be able to enable or disable
>>>> panel power saving features.  
>>>
>>> Could you also explain why, in the commit message, please?
>>>
>>> It is unexpected for arbitrary programs to be able to override the KMS
>>> client, and certainly new ways to do so should not be added without an
>>> excellent justification.
>>>
>>> Maybe debugfs would be more appropriate if the purpose is only testing
>>> rather than production environments?
>>>   
>>>> However, since they are currently only
>>>> configurable through DRM properties, that isn't possible. So, to remedy
>>>> that issue introduce a new "panel_power_savings" sysfs attribute.  
>>>
>>> When the DRM property was added, what was used as the userspace to
>>> prove its workings?
>>>   
>>
>> I don't think there ever was a userspace implementation and doubt any
>> exists today. Part of that is on me. In hindsight, the KMS prop should
>> have never gone upstream.
>>
>> I suggest we drop the KMS prop entirely.
> 
> Sounds good. What about the sysfs thing? Should it be a debugfs thing
> instead, assuming the below question will be resolved?
> 


It's intended to be used by the power profiles daemon (PPD). I don't think
debugfs is the right choice. See
https://gitlab.freedesktop.org/upower/power-profiles-daemon/-/commit/41ed5d33a82b0ceb7b6d473551eb2aa62cade6bc

>> As for the color accuracy topic, I think it is important that compositors
>> can have full control over that if needed, while it's also important
>> for HW vendors to optimize for power when absolute color accuracy is not
>> needed. An average end-user writing code or working on their slides
>> would rather have a longer battery life than a perfectly color-accurate
>> display. We should probably think of a solution that can support both
>> use-cases.
> 
> I agree. Maybe this pondering should start from "how would it work from
> end user perspective"?
> 
> "Automatically" is probably be most desirable answer. Some kind of

I agree

> desktop settings with options like "save power at the expense of image
> quality":
> - always
> - not if watching movies/gaming
> - on battery
> - on battery, unless I'm watching movies/gaming
> - never
> 

It's interesting that you split out movies/gaming, specifically. AMD's
ABM algorithm seems to have considered movies in particular when
evaluating the power/fidelity trade-off.

I wouldn't think consumer media is very particular about a specific
color fidelity (despite what HDR specs try to make you believe). Where
color fidelity would matter to me is when I'd want to edit pictures or
video.

The "abm_level" property that we expose is really just that, a setting
for the strength of the power-savings effect, with 0 being off and 4 being
maximum strength and power saving, at the expense of fidelity.

Mario's work is to let the PPD control it and set the ABM levels based on
the selected power profile:
0 - Performance
1 - Balance
3 - Power

And I believe we've looked at disabling ABM (setting it to 0) automatically
if we know we're on AC power.

> Or maybe there already is something like that, and it only needs to be
> plumbed through?
> 
> Which would point towards KMS clients needing to control it, which
> means a generic KMS prop rather than vendor specific?
> 
> Or should the desktop compositor be talking to some daemon instead of
> KMS for this? Maybe they already are?
> 

I think the intention is for the PPD to be that daemon. Mario can elaborate.

Harry

> 
> Thanks,
> pq

