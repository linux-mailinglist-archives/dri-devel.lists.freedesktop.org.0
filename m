Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5C85170B5
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 15:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7F210E85B;
	Mon,  2 May 2022 13:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1185C10E85B;
 Mon,  2 May 2022 13:39:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcqnpqQ+1/kOyAOl2CIokAYyLl7yhMZowLSq+ZGYtpPwZzkUIpBYoLWsBe/rT8jMAYEAGQuNbWYQxfYHM+T1v6t6tM54d8wp0/2MS2UoSiJ0gLVQqHLZFAhp66O2h7WkyPD9gkURqyInrI5qu6B8dMxZCVzHlXM5hr80LLckXHJ8wT0EhSZ14ooj9yWFjmP6Etj2Jw4fHyEUHbK6M7OCpbpsyduKf8RXfC/HLzGTJV75q1s8tMIbpfuSC7MfL0ME375t7owqQ3/+yf40W82di1OVtgDjPMF61EY66tcThcmg+RuxpK4hTCDs3hVFjtQLhM2EUFX6zBUCEYPj1s2WbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWl7C/yG1DcY6d09r9KGj8AugUPl/JaroXQ408VHH78=;
 b=LSzrYOc/4sh5aC8BI9LccZV2zOBkV6G3o/jV6KBJDee7k32N4SIR6ts4BW89g3B2V/tTY989WdhMMSxxP9PTE87qB1fsLWb8KT8mAkSxhkVmghvvfWox/8zAAe8AAsFr0h0DSOMb3oSfvTGtKV+R6iDcSOu+vdN0LfHxxFaUrdjlq4DUdRJaE6UCasS7aqrs4zqQituLI1Laoy8kRdD2yfPEl/txNGejmbN/unUH4FtzSmRwS1WXzKyUhEReoi0rocLniAjooCEe6k67UnYvobFHi3zB8jUH9llmnSFDV2/NeW1gYyvd8uXTCkt/W4BkKAH8lHE1pc+jWqbTuxv4lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWl7C/yG1DcY6d09r9KGj8AugUPl/JaroXQ408VHH78=;
 b=2dfdeddNn49yACFNrx/uGrVmCBmK7kIpGZ2j4TZj61EhupgmxgAekiJvuzdp1m8tWtbMlP/bZz3NcxjR2VWq3m3cyJyTM43ybULCJxb0mfkrFSpwElumFkJfwU7sE3aQCPYgLzH5pBO6k+zDuufpZ61mjwFHsuIrJUAwxhxoCuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BYAPR12MB3463.namprd12.prod.outlook.com (2603:10b6:a03:ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.28; Mon, 2 May
 2022 13:39:02 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::540e:d76a:bdf0:ed0d]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::540e:d76a:bdf0:ed0d%6]) with mapi id 15.20.5206.013; Mon, 2 May 2022
 13:39:02 +0000
Message-ID: <8a9ba046-5e2c-442f-aec2-f1683097d100@amd.com>
Date: Mon, 2 May 2022 09:38:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [V2 3/3] drm/amd/display: Move connector debugfs to
 drm
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
 <20220411095129.1652096-4-bhanuprakash.modem@intel.com>
 <DM6PR11MB31778321FCA58010AE44D867BAFC9@DM6PR11MB3177.namprd11.prod.outlook.com>
 <29f40e83-a9a8-c0ac-1702-f9d0bf0f8861@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <29f40e83-a9a8-c0ac-1702-f9d0bf0f8861@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0102.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::21) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13e776f1-5b0a-4396-0f4e-08da2c411e41
X-MS-TrafficTypeDiagnostic: BYAPR12MB3463:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3463735F7B9C49B818DF23438CC19@BYAPR12MB3463.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wpvR+eVgbM5ZZcRJcsFwGS23SvIz6/fvMPxH9zSw0SKIwn1BkU9FgqUKGXGbLCson4/Ie/KGapGW+uegT9N38Z6IfuUNUPiQMPRgX/pVaFPnZhUUU1HSlwmsiVCn0hf78vhOgkiHiypC2/v8IVnju2LluyB7DBVN6vBSKPnDP3Ahp7sEz8gfAdZSMobrE7+dw6j+xL5gVjw2Xg45k/7VYcX41Jddv/w1Q0pUrEn8fGNVIbJNN+wiq8YLcHASb9SDGDRDj1RSVzHrSutcv7ZQn1COVev97jxLJwwnhA/+9n8JOXxFoPd3Wa0/JIyzk46qzkkDWgzkEc4Kmh4yZl4sN0Xf6KE0nPa830iUEuVt2sLbZpE9lCFr29f9kycxgDz/kLFhSLwrFU1gSYuoMrXbwyOK4aZbtogA23MxoKNgDxi7lnrQVybetkxR/XGkKjcOLd+wPyfVezmzKkmDFTxp5vhrcDDcNqcXo0yIhs3iKmmDold4OPtnJsDcBOWNok5VQxYw7LepPiDNiRIxjOIewoDN1XlNV9gK/ddJTrZEsIIezGdW3eD/+xD0nFqLs07Ii3eHN/NaNQX6yo2rn3V96+PxnnVFvdsDONiwBhrc3CHUUOmuMEp63vVekdtPh9tbr0Gi0Wnn70338Xy+uoajYvNpMQYlbt2hCl3k7i2PrplvfgjJDJZhlQoOyojc/etNUO798waphu/MoxD71m6mLQtPnSCQ8qwcdkaUTIlIgxRkmHhVKtGNbfIGhwLXTDQT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(316002)(110136005)(66556008)(66946007)(66476007)(4326008)(8676002)(36756003)(86362001)(31696002)(38100700002)(921005)(2616005)(8936002)(508600001)(44832011)(5660300002)(6486002)(6666004)(2906002)(26005)(6512007)(83380400001)(6506007)(53546011)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEVVMHMxVEpVdVRuSnhPUHdYS3VLQnBzRnNHKzJHTE1MWHYrU1V5QXErN2FK?=
 =?utf-8?B?djczU3hsaTFITk8wRG42MkdHQWdYZlorL0lKNjVmNUE2SkdjTmxHTWFHOGg3?=
 =?utf-8?B?K2ZzejRZcnJIbjVvcVdjZmZKMXZxL2U4VHFtbVBYT0RSZEQ3UGJRSDBWV2xi?=
 =?utf-8?B?a1ZEdTdlRmtrbVE3Q2pZNFBNajEvblNzTUMvZGkzRExKNnpjaFJFaHpBMXUy?=
 =?utf-8?B?elNhNTl0RjBHdGRhcU03NjZ4MjZ4RkJHdjNXN1BiRUIvdndENXVZK0h1dlAw?=
 =?utf-8?B?Vk4rbityMS9GUDVhczdSY3FPUUh0RVpVM0NZNmNlcE1OdVI3OXJDT2ZZZ2Yy?=
 =?utf-8?B?NUtLMWpzN3ZWdXBXcVpINGdtdTlEQmFtRW1aaXZtVE0vK0NaM1pMR0QyUE5j?=
 =?utf-8?B?NXR3RGphSVZMOExsREhyNFY0VGVUdk5CdXR2Zmt0a0VEcW9kL3BTcVRkYjdk?=
 =?utf-8?B?aWZMQzl4cVhVQXkwQlhndi9veUxFaGRyc243a0FyYmJtUXVIV1RKaTdKQkVI?=
 =?utf-8?B?WExvS3BlWXlXMXRNOWdXcERXeERWM1l0Vi9vZWgvRGxOcmN3WWZlaGZlTmxW?=
 =?utf-8?B?aDlhcXN4NjJ2QzkyS0V3VDN1YkxhbFJFTWFveGNGZW10NFk2cTZ5S21vZ3BQ?=
 =?utf-8?B?cGxBd0pSV2FDeENLTFdaeHJtK2hweW9BTHpKTHBicVBBM3pYKzduaTVUK0ZB?=
 =?utf-8?B?K1RkbTdkYjEzZVpmK0lyVjBFTFN0aEwyeXhQMlpCZWhkNWxEM3Z5VGcweEJ1?=
 =?utf-8?B?MjJSQkhtc3hNYkVVOWtOM3p3eUFyd1ZvOXBqNEtEZ1gxWGFYUXRRaEQxNEVY?=
 =?utf-8?B?VExQeWt0bXhSU0RzeC9YOEs2VTJTbVpnczhPVmhrVEhkaUE4VTZBYkNHY2VX?=
 =?utf-8?B?cERaRGVUWkxQYVlGU3ZoR3gzcExWVGt5a2d1M2hveHdJUGRBSFQybU0wSFdG?=
 =?utf-8?B?dHdKWSttVlljU212RjRSUnpvNExWOTdxb1IzTDlOQ1M3Vlc5anN1NGJ1dmcx?=
 =?utf-8?B?aEk3WkxzWkVpVjVtaXFaUng2R0JkZkV4dTQydWROekhxVGE5bVAvbzlDYlc3?=
 =?utf-8?B?REc2SkVSUzRQM1hieVVjeEJMY3A1UjZFY04zNlEvM1JHTU5ZS0wvcnFCNHRs?=
 =?utf-8?B?cFM5ejZCelA1bTRMN2FrcGdRUFVJQldGbVd1YXArZ1B2MWJkOVFDOEdrM2Ey?=
 =?utf-8?B?WG5wNWNRczMwaS9UVWg3dnlRVlV4K3VJNEJmRHkrUFRUckVhWml6b2x1RkZm?=
 =?utf-8?B?ODcrcmVPNHY2Sk1MeXpBRmNNbDZoVk1XSXhUNVRPZXhILzRuL3F0OWZLNjlX?=
 =?utf-8?B?MGVnSENoRW9NbUh0SFZtbFI2azcrMXdWaTltektXZVF6SjVyaFViWWY4K1dG?=
 =?utf-8?B?OUE3ZFlrbElFSlNaT2pSY29KeTFEeFlBWC9oWHVRS1VYS3hkNjJzMEp1aGd4?=
 =?utf-8?B?QjdGY0NubzMvUDlqdXNlTVE4UXBIZUNBb0tncnpOcFhBWEduYjF4WFMzb254?=
 =?utf-8?B?T1JwOCtxWFZyNk9uZlEzQWJrc2JYeW9SdmhvS3cxRDlzZ0JQdmdtMWV5Qisv?=
 =?utf-8?B?K3JWQVI0VmZQUDRHTEViWHJIamtOTWlCRGljWWlDem9Nd1RyUE9ydFZ2dUU0?=
 =?utf-8?B?cHFWOEtSRW5SbnhqT3ZPdjlSUitkQUhXLy8rNmxrZmhkTGJFWElzMHJYQWFF?=
 =?utf-8?B?d3VRUkxuWnB2UnlOK2gvRDFGb3h5NXE2d2R6cWRENktzRmdudDV2VHlMVk5B?=
 =?utf-8?B?Z1plYnNIQ3RwQTcvWEdlVDQxVlIrZXNva1ZVZVNpbEtUM2EvbVo5ZUIzRWhj?=
 =?utf-8?B?bWxBMDhkZnVuMldtUmFNQmZZSlM4VSs4R2IwclBzQ2JrdzNNME1US2Zyd3FM?=
 =?utf-8?B?SGtZbW1YN1NDbnpsRkdOemlHWENqUTlOa3ZZSzJ5RWhNVjcycUxPZFNwMlVO?=
 =?utf-8?B?bC9uOTVxNHVrRGV2dE82UjVVTHE1R2w0citwMHp0TitYaFIyamRSUS9Qa0cz?=
 =?utf-8?B?U3NXSTRXRUozSzljK01kS1B4Rk9Rb0tZSEg0Wm51S3QyaFZSNkVRcXZNcjEv?=
 =?utf-8?B?cTdDZ09FSUY2RXRyV0M1Y3l1MWZrdlBLOC9UcDgza1M2dVZRS0I0UFZXQWxP?=
 =?utf-8?B?S3dVZ053Y0JWVXhHWWREdTBkRE9iUzcxMGZIZjA2VWtyVk9Wdk82Sys2Qm1s?=
 =?utf-8?B?Vm04S25wNVZ5WnVFakNDRXg2VEZEdklDRkxWUGUyUDNnVWlib3RBdHdpTE1Q?=
 =?utf-8?B?MjUyVW5wR1BlWE4xVG5ERURqRXlQY0IxOHpXRXgzNnFiczh3YmNwYk1QL2Rn?=
 =?utf-8?B?by9UdnNpS2FGVUEyZVVEeUk0aWhGamc2L1p5clFHc0ZYcVJTRXlsdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e776f1-5b0a-4396-0f4e-08da2c411e41
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 13:39:02.0609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gehu3PH9shKwViaOf508XvcExrl/s4WrgwSXRqsPoRkk3WRhCLJ02EDJDwbmDFE8BRagKd3gA9z5WmTwNwGi+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3463
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-05-02 09:28, Modem, Bhanuprakash wrote:
> On Fri-29-04-2022 08:02 pm, Murthy, Arun R wrote:
>>
>>
>>> -----Original Message-----
>>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
>>> Bhanuprakash Modem
>>> Sent: Monday, April 11, 2022 3:21 PM
>>> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
>>> amd-
>>> gfx@lists.freedesktop.org; jani.nikula@linux.intel.com;
>>> ville.syrjala@linux.intel.com; harry.wentland@amd.com; Sharma, Swati2
>>> <swati2.sharma@intel.com>
>>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>> Subject: [Intel-gfx] [V2 3/3] drm/amd/display: Move connector debugfs to
>>> drm
>>>
>>> As drm_connector already have the display_info, instead of creating
>>> "output_bpc" debugfs in vendor specific driver, move the logic to the
>>> drm
>>> layer.
>>>
>>> This patch will also move "Current" bpc to the crtc debugfs from
>>> connector
>>> debugfs, since we are getting this info from crtc_state.
>>>
>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> ---
>> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
> 
> Thanks Arun,
> 
> @Harry/@Rodrigo, If this change sounds good to you, can you please help
> to push it?
> 

This changes the output_bpc debugfs behavior on amdgpu and breaks
the amd_max_bpc IGT test. I don't think we should merge this as-is.

This patch also seems dependent on patch 1 of the series. Shouldn't
they be merged together (please don't merge them as-is, though)?

Harry

> - Bhanu
> 
>>
>> Thanks and Regards,
>> Arun R Murthy
>> --------------------
> 
