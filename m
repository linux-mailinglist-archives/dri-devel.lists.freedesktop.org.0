Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484D692DA96
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 23:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3509C10E1AD;
	Wed, 10 Jul 2024 21:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3iOyVVIM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D1F10E1AD;
 Wed, 10 Jul 2024 21:13:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6IT5kzIjImY/48uVC7HRgTHwSekjhgu+0b/T+tSmvfgRIXpKgs/A3jBx/GJJoY5GaB8MieHGmGfykt0+9FNFYA3sWzMmo5gep03LeiG5/hypmsc3wF1CymY+HsH9SydsOxE4+G8F6GkkeLCIHkqOmLEDHo29nhVlTwi0jcXr38Kod0iWmvfzseITn/GBNUrGAo0epjoYOqZJDooHcAuVRYezzHDiisoN+smd/1AZ0t/y6uHYWR1yALFQrcCxSowldKSJxrBNZ00n5vV80SDBqahZs7V6MIAjO+KhDg2aUak+yQ1Pszl4Qf5wML0k1w8z5S5xq2sHnY4dKx376qf1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhZOpNaoWox8bwqB4FhFlhS1oJYbleT7CU+b0E41xb8=;
 b=R+xsLOa/7D6igVHwXNs254WM/0V2sQTcYTi8jXAoT6Q3wbyjnDxnVBiiqozlbCk8U/Rasba3zuMqEsjMm3oV5Si7Q7FtslGXVNg5jwxPe/FjuZ8B4HmReWZhH7tb1sNUag3lEXHJr6Tv7CF4Fr8uX9s88XRyE0GKoaC9Mh78k5w2qEQ6bGCKw3ZRiTJDREb2ao22yCma62Y8U97Y2qayol7y5PbRCfeTnFgayxpR2ToNBies78vsMp2OKq3JLBZJWNXQGbVjOfHxSFzBrG8ntPUJu2ggOfg+Zdpb43PZNXSa6IXAdebAuV+o4sec/dfbaWZM0uDO8wyU38DSj6HQvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhZOpNaoWox8bwqB4FhFlhS1oJYbleT7CU+b0E41xb8=;
 b=3iOyVVIMhNgWf/M2a2d1VAutdepYSLQfVT4xPrswKiMiZqmctP6dUYnZyqnNpw5ta94hm9YUGovIFMwOGk7Ab0yx7hMa/zq3RsXyxwURpindfhHzcKhrvUDisHzTCroRNpGepN99pjU9dYchSH7hAZYNJlZC5D2DccMNiLj/p0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by DS0PR12MB9039.namprd12.prod.outlook.com (2603:10b6:8:de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Wed, 10 Jul
 2024 21:13:22 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%6]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 21:13:22 +0000
Message-ID: <bd3da8d0-a60f-4905-b27d-cf549844c683@amd.com>
Date: Wed, 10 Jul 2024 17:13:18 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amd/display: use drm_crtc_set_vblank_offdelay()
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Hung <alex.hung@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240708202907.383917-1-hamza.mahfooz@amd.com>
 <20240708202907.383917-2-hamza.mahfooz@amd.com>
 <Zo0Dm_XeF3dMqK1C@phenom.ffwll.local> <Zo0MSB7eSp1H0iPI@phenom.ffwll.local>
 <3214e5a3-a616-4bcd-8f1d-238e1bf346fe@amd.com>
 <Zo5Ju2bWFUVBHeKX@phenom.ffwll.local>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <Zo5Ju2bWFUVBHeKX@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0099.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::8) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|DS0PR12MB9039:EE_
X-MS-Office365-Filtering-Correlation-Id: 749397a0-85aa-4bd5-77aa-08dca1252108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnprMlY0MUVrNjhJeTFMaVVMU3Rqb05PSHdkZVV0U3M1K2dPbmxUby9LUWpP?=
 =?utf-8?B?TlJDS0J2MWNFeE90T2EyWSsxRGF5QXN5c0dHZU00SURuNFBLYlZJYXhTSkJG?=
 =?utf-8?B?eE5uNndaSGR3ZUFVY0QvaURiUVFwUmQ5L0lSYTFyMHUyajRQMytFbUZ5eWg5?=
 =?utf-8?B?SlhIZUEwZWNMRjBETWZ5TEF4bmVzTVhsb3p2UFIvcVBpQkR1OUtleWE4MUJv?=
 =?utf-8?B?RzF4RjRDdXU3K2JPYStuemIzK1NPSURFdDJhTk5nQzNpbS9jUXNDVkVTaHJL?=
 =?utf-8?B?VEFScmNoUzloRSt0ZmtBTVI3VGlrbGlsTHZBSER1aEpuM2w4cFlkV25POTAz?=
 =?utf-8?B?dUFNWUVNK1FkRVYvNnZad3BmeExCY0dNYktyZWd5RUUvNVBXZHRLS05xM295?=
 =?utf-8?B?RUVxRVFYNnl4Ym9IbDl3T0toQnRJUGx1SW4waVNMbTc0OG1BV0IwUjY3cTFB?=
 =?utf-8?B?NWJzNzF2dkcyVU5TNTQ5SHNSSkdUT2k0ejBiUGEwN29sdlZ3OUJudS9kREFi?=
 =?utf-8?B?Umw0d1NEWGNaZisvNytBV1RnY242ci9aRUJsUlZ6U05xK253UEVmQ0YxZW5x?=
 =?utf-8?B?VzF3ZVlmaE1zWGh5QVo1TVJZNXJ3WGVoSTBFOGRIaEtNYTJCeU5mMFBtcEVk?=
 =?utf-8?B?eEZhM2MrdVpFdFJRaG91TEVISER5Z291eGJXTVJvZERGM2F0L3ZnWlR0VllY?=
 =?utf-8?B?QTB0YVFPaE9tTmlBVmRFMnlkZ2xtSENOMHFncDlBM3NkYWxwRE5yU2d1c3hN?=
 =?utf-8?B?cEdMZVMveEd3ZEh0RExNUEJHSFdIU1JvSGRkeXdWaGVScDU2Z1NjME12TXJH?=
 =?utf-8?B?VWJVYVRNbFZZWENpYVdVeVR5aEpLb0NZTnhsRTgvbXRGYmJPQmorL3JxazJu?=
 =?utf-8?B?NmxJdFFHMllleE53WFRVMzhoREhncnVCSGFjaEF1cDBmUkFCdEMyR0tJNFQ0?=
 =?utf-8?B?NlRGUjdMMktWQ1VzMnczZ0FuODdOanhtTVNuOU9xSVdua0ZNUGdSNGFENDBL?=
 =?utf-8?B?K2hhL1RWaG04S3Q0MDN4alErdG1iVGhxTXJqN3JYRDVhWXhDOC9DenlWMGJ2?=
 =?utf-8?B?WmhaU1h4Y2d3b2NBdVpPbXM1WTRvR0RZQTdFU29JQVZLb09FdGQ2M2ZKMnd2?=
 =?utf-8?B?VmY4UmR1YWt5ZWZ6TEVRSStlUGhsTFlDd0h1NXpNOGEzT0NNVEtMVm14ZGNj?=
 =?utf-8?B?RjR2MmtvR1FLYndnOWwrQk9FaHlEelJ5ZzhLc2QveEV4RG05THpVR3Rma0tj?=
 =?utf-8?B?dUF2V2kySGZiNHVJdzNVY1huaTBlQkVQN2VFaW9YTFZ4MWJzS1NNU0NPQnJG?=
 =?utf-8?B?cHg0cEFwSEsxajhwalhmWTNOS2Z3Y09pQTBhYTJHOWVXclFMejhSdGErNFh2?=
 =?utf-8?B?bGErM3NVMWhSQjJIK2VEMmpXdjE4Zm5pekt6T0oxcVBTS3BYcnBMbEVzeFB3?=
 =?utf-8?B?cmFyZFF3aXZoVDMybW5HWUFteDBiVzZzK215L1dRcHRQTjdkbDhTZWJ6NTlX?=
 =?utf-8?B?MVNXVGlUQWVXa21HN0ljUTJ0WjhkQXJQSG9WREVzNkFsM1Znbm9UY0FHNzQv?=
 =?utf-8?B?dktacnRaeTlQYllYaE4rT2xLUUhVeU9QTm1XVmRHcEw2bUNERUNCTWdmbXIr?=
 =?utf-8?B?NUx3VjR1aVdVVXJ2Z3hUS0lmU0E3eFY0REZoeUc2ZG5wR0gvcUYwS0ZObVRP?=
 =?utf-8?B?VWRCZ3N6cjZEL01IZERVWENtWHZVU2oyc044K2VWWjdUVlN6M2pER0xBY1Zt?=
 =?utf-8?B?U1ozNzI5SE8wZlFJN3ZmNmpudDByUWxta21NMjlwWExHSnZpSG5aUm9nQk5W?=
 =?utf-8?B?M1VyREVEdHhhZ2RDSjhEUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVk4UmFaa2JrelJlTmZnT0w4MHlsZUlKVzA4TmFxTklVUnNaUTNqenpET1RC?=
 =?utf-8?B?TVVzci9ialQvTVpiTENjK1ErWXgzQWE1c0lyeVphY3FJbjBDcS9mcSsxQ3FH?=
 =?utf-8?B?VEpVeFEycHN6MDV6SnNMS2tQL3hWZ0llYStydWxZL3JVQ2QybXI4U1loS3ZB?=
 =?utf-8?B?Y3NZci85RTJNelhNbXlZSnEvM0FQeGF6elVPLytIakE3aGFLK2FWUFpNYjNj?=
 =?utf-8?B?ZUx6VkFxTmVBdHgvekoxOVVOZkN4VVRwWTBpYjc4RjNsNUI0WXVqZVp3aU9z?=
 =?utf-8?B?ZEJ1S2RCbENWVnhLajVWTFY4d3dXVG5meTJXRWx4L2l4SmdaaTd4ZWZCWURx?=
 =?utf-8?B?OGlacXNGalo1WWoxZmRvUW9Fc1RzcU54Q3hZODFEckl2ZHpwZHV6anFISEFX?=
 =?utf-8?B?cENZMHNZYjMvdFMxcmh2RzB4c1R4NmxESjl1MHNVWkpvSW1RVklzNzRFNW1q?=
 =?utf-8?B?bFo1WDhQQnpNcXBQb0Y5aVdoUTVVTVc0MW9VZFkzdGhoREt6VGh3RUhBQlRs?=
 =?utf-8?B?enk5bkNUTVhNSWdJSmc2TTZZdkdFSTFKeVI2K092MmlLN1l4MEhxbVRKaTMv?=
 =?utf-8?B?cGkwVTJ1YUVLWmEyNjMraFJrSU1CME5PTVp3alY1eVVyeUkvbERrMUI2eHRs?=
 =?utf-8?B?bnZHOElTRTFJU2JjbkpDeEh6cU93ak9ybFlaaWV2U0s4U3BtT3g0bkFIaUhO?=
 =?utf-8?B?R3FsQXJ2M1BBU2NNUXhnOVNpdXg0QmxjcXZPa3N5NllZWmdKbTJvcHFoYlBa?=
 =?utf-8?B?VVg3MXcrdTJvc25NaTdYTE1XTUYrbDRPZCtLWDFmSU1ISjc4UUVFanFMYk50?=
 =?utf-8?B?Y1VNVnQ1NVhJNjJIVEM1RTBCL3k4Y0NiNTFLWXhPKytnQ3VzTkRJRTNDUncr?=
 =?utf-8?B?b1hpUzJXQUo0aXhjdzVhTjJIS2VrTTdicnlPUUF0YzFtNGNpbGtQRFkwUlNW?=
 =?utf-8?B?a1VZOTBGN2Z5ZGRZQWpHa3dwNzRHTXFXR0d3WTV6RDFZZDBVeTlSUXJKVDdG?=
 =?utf-8?B?SVdGNDVYUHJ0VmZiQmU2MnBjN01vekJQTFJ2WVJHR0J2NldCMjdWbHRKRXJJ?=
 =?utf-8?B?Tzhadk5qMlR0VmxibVE3Z1dQMysvTlFjWXZZREtoUDhMc05kSG5FQjYxRDIv?=
 =?utf-8?B?MEpuTkx3VDRPZVdFZkM0VGU1WWlMNTFCUUYrWWdyMGtLeFlhaFE4TXBaemIy?=
 =?utf-8?B?VjNEbXZWeWRsdU51R3lCNnlWMnVGaEhVMXFRcnIxQXRsSyt0cFRVa004MUtQ?=
 =?utf-8?B?T0h3YVltb2hvKzBBR3JsckZ6ajFZaVdLQ3Vob0FIVWdzMGl0cTNvRXptanJu?=
 =?utf-8?B?UmtlQzB1bUVJSHBnY0VEaWNWUFY2ZU14L3BUa0xpcjhWSEtQVkNKWXRRbHRQ?=
 =?utf-8?B?dk93alpDRU02T0FYYXFvREszeFZ0RjZUdytXTW05WmtZOU5BazhsVmhRcnlX?=
 =?utf-8?B?YWNWb2NGRUhzU3VzQTArK2VlVENTblNhck44L0ZsZHMyRENmbFZXMkZrYXBy?=
 =?utf-8?B?aGszY2FjelFiLzFDbVN6R1Y5TjdIbkZCZXZ6dmJtKzQzVVpXZkxtRzRNVWtq?=
 =?utf-8?B?anB0WnFpamU3TnhDQm4yZmw5ZDFZeHZwZGJRZW5vWEJtbXJmTXFwU2JGaTM2?=
 =?utf-8?B?OVBWNGRWSzlYdFdKbmNKbWhRcjBTcyswZVZWYkNxN053ZWJHSHNVZDFycTRY?=
 =?utf-8?B?Q0xoQm5sZnowSFd3clFhd3BDZ2xrRC81czA3T3pXcTg5TG5lYmlGU2ZKR2NF?=
 =?utf-8?B?a1M5VEE4bURsZE9mNm5JNGpiYjVEYm5SbkdsVk5UYlAyeTc3ZVVWRW9TVjRs?=
 =?utf-8?B?VEFwbXhDYjVSUVg1VU9xMGpSVWwvaG95UXFVVDloWlQ3WkhWUTgrSmM4Y0k5?=
 =?utf-8?B?cHFZc3RZZ3F2S2hjQ3RHV0x0RWRldm9HaEdaNUJzQUFPMzZjdGVwamhrK2NR?=
 =?utf-8?B?TllweWwzWFVacVdqdmM1Nmk2anVzUS9FVmVCMmYyQWlHeHJmcDB6UjFsQ3lK?=
 =?utf-8?B?amtMRExzSzZyRHkzcWtpU2FKaTAyUUg0UDMxeEFvZW5zMVEzdGFibFg4Mjhw?=
 =?utf-8?B?UjFDT0xKNnl4V2RwdjVnVzJ6elNraFkwQ0dELzN6d2RiVlYwbkxoWjAvd0pQ?=
 =?utf-8?Q?V8ng/C36dTcOIw613zc0rA5w7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 749397a0-85aa-4bd5-77aa-08dca1252108
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 21:13:22.1010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9Nev1IWyhu9xdXveWffbcVAmsxAElRWys7HXmuhYwq5OKu/nFUmnUt+FDcIDQUl1krLYtEKdthy3c0wuMPzTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9039
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

On 7/10/24 04:43, Daniel Vetter wrote:
> On Tue, Jul 09, 2024 at 10:02:08AM -0400, Hamza Mahfooz wrote:
>> On 7/9/24 06:09, Daniel Vetter wrote:
>>> On Tue, Jul 09, 2024 at 11:32:11AM +0200, Daniel Vetter wrote:
>>>> On Mon, Jul 08, 2024 at 04:29:07PM -0400, Hamza Mahfooz wrote:
>>>>> Hook up drm_crtc_set_vblank_offdelay() in amdgpu_dm, so that we can
>>>>> enable PSR more quickly for displays that support it.
>>>>>
>>>>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>>>> ---
>>>>>    .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 30 ++++++++++++++-----
>>>>>    1 file changed, 22 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> index fdbc9b57a23d..ee6c31e9d3c4 100644
>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> @@ -8231,7 +8231,7 @@ static int amdgpu_dm_encoder_init(struct drm_device *dev,
>>>>>    static void manage_dm_interrupts(struct amdgpu_device *adev,
>>>>>    				 struct amdgpu_crtc *acrtc,
>>>>> -				 bool enable)
>>>>> +				 struct dm_crtc_state *acrtc_state)
>>>>>    {
>>>>>    	/*
>>>>>    	 * We have no guarantee that the frontend index maps to the same
>>>>> @@ -8239,12 +8239,25 @@ static void manage_dm_interrupts(struct amdgpu_device *adev,
>>>>>    	 *
>>>>>    	 * TODO: Use a different interrupt or check DC itself for the mapping.
>>>>>    	 */
>>>>> -	int irq_type =
>>>>> -		amdgpu_display_crtc_idx_to_irq_type(
>>>>> -			adev,
>>>>> -			acrtc->crtc_id);
>>>>> +	int irq_type = amdgpu_display_crtc_idx_to_irq_type(adev,
>>>>> +							   acrtc->crtc_id);
>>>>> +	struct dc_crtc_timing *timing;
>>>>> +	int offdelay;
>>>>> +
>>>>> +	if (acrtc_state) {
>>>>> +		timing = &acrtc_state->stream->timing;
>>>>> +
>>>>> +		/* at least 2 frames */
>>>>> +		offdelay = 2000 / div64_u64(div64_u64((timing->pix_clk_100hz *
>>>>> +						       (uint64_t)100),
>>>>> +						      timing->v_total),
>>>>> +					    timing->h_total) + 1;
>>>>
>>>> Yeah, _especially_ when you have a this short timeout your really have to
>>>> instead fix the vblank driver code properly so you can enable
>>>> vblank_disable_immediate. This is just cheating :-)
>>>
>>> Michel mentioned on irc that DC had immediate vblank disabling, but this
>>> was reverted with f64e6e0b6afe ("Revert "drm/amdgpu/display: set
>>> vblank_disable_immediate for DC"").
>>>
>>> I haven't looked at the details of the bug report, but stuttering is
>>> exactly what happens when the driver's vblank code has these races. Going
>>> for a very low timeout instead of zero just means it's a bit harder to hit
>>> the issue, and much, much harder to debug properly.
>>>
>>> So yeah even more reasons to look at the underlying root-cause here I
>>> think.
>>> -Sima
>>
>> The issue is that DMUB (display firmware) isn't able to keep up with all of
>> the requests that the driver is making. The issue is fairly difficult to
>> reproduce (I've only seen it once after letting the system run with a
>> program that would engage PSR every so often, after several hours).
>> It is also worth noting that we have the same 2 idle frame wait on the
>> windows
>> driver, for the same reasons. So, in all likelihood if it is your opinion
>> that
>> the series should be NAKed, we will probably have to move the wait into the
>> driver as a workaround.
> 
> Well that's an entirely different reason, and needs to be recorded in the
> commit log that disabling/enabling vblank is too expensive and why. Also
> would be good to record that windows does the same.

Point taken.

> 
> I'm also not entirely sure this is a good interface, so some
> thoughts/question:
> 
> - is the issue only with psr, meaning that if we switch the panel to a
>    different crtc, do we need to update the off delay.

I can't say definitively, but all of the public reports (that I've seen)
and my local repro are PSR related.

> 
> - there's still the question of why vblank_immediate_disable resulted in
>    stuttering, is that the same bug? I think for consistency it'd be best
>    if we enable immediate vblank disabling everywhere (for maximum
>    testing), and then apply the 2 frame delay workaround only where needed
>    explicitly. Otherwise if there's other issues than DMUB being slow, they
>    might be mostly hidden and become really hard to track down when they
>    show up.

Ya, I believe they are all DMUB related since the stuttering issues are
accompanied by the following dmesg log entry:

[drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR* Error waiting for DMUB 
idle: status=3

(which is pretty much an unspecified firmware timeout)

Also, setting vblank_immediate_disable unconditionally for amdgpu, while 
only
enabling the delay for cases that we know that we need it seems 
reasonable to me.

> 
> - I think an interface to set the right values in lockstep with the vblank
>    on/off state would be best, so maybe a special drm_crtc_vblank_on_config
>    that takes additional parameters?

Sure, that seems fine, what parameters besides the off delay did you have
in mind though?

> 
> Cheers, Sima
-- 
Hamza

