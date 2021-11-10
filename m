Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 156C844C42E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 16:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA876E58E;
	Wed, 10 Nov 2021 15:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11966E58E;
 Wed, 10 Nov 2021 15:18:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvv6orc1YAO7/Zqdu0u3dBNxguP4Ggei3oALRm0XfIbbEHYLJvxXTE0CMJvntkjLC3fChGgsINYtJFUz5tQMNMSwMf4u051qZhHRERq/V7ZmVBqfifWrL9TOkAItSLTzcRM8UuzM9Umz47sjA/hPHjdqoX9FGAN22oNELdKNi4woTVmuMhFmG91Jd+/3O/kuSAmzVbVdDW3yLy5emfBREexMu3dwvBTGduaCKsZuxEq8f1oUaAc2VLp4gmP6AK+Iy2D1eVVmKjfyr290hc4SyjAwr7lgBqr5tLA3iI6lC+NWcLcYyGayOTUXV2jj0GzFQMs2OWKMQOFHUYoGuHuF0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjnXw8ehDNPPwhv5sWqZ0d0JUv5GeYGyuF7mKCQg3eI=;
 b=cmwjk7+Nmos8umHgL86uenL2puD3l/u90NE3KNU9BcCyJqZzS7d6slKDsoQ4G6obaYpf2eStUg+m/vtEDf7UcqYnyxlYsccjwD1jgsg8zaSg76rxFwpqK7rMSPRPhodkSHbWqjAJ3ogCD/AevVnzSmaKKZtSi1YaK2jgisZH695By9rIox4CPuKN4OfIosA4znov30jjBCfAmxxDlSx4fTErQULNj8V4/6NcbDOrPyc34JS7AFdgwRcDAoCXVuLMaHGga0c7Hf3fe05qJNMA0ZmzwpeVUNm8BXonJqQXD7jaoB4NYB5C0GFFuk+qHqVXau6w6HvVPjdMaoP3YY9lmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjnXw8ehDNPPwhv5sWqZ0d0JUv5GeYGyuF7mKCQg3eI=;
 b=yb1+RmKJyN0azsoV5Hpq9+04Orbk3baOK2JZpLfRFMxigCkKk63F/BJ+fBrLbwoqiyGJloRsuKQybzmS245y2csK8/be3hHzwc/f1JbEieulNpv6oJfBnNYsUXsPM8LAk4lC7NSkA7jVRMQImjInS/rj84RPRCWboVdV0WRn0mc=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5459.namprd12.prod.outlook.com (2603:10b6:303:13b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Wed, 10 Nov
 2021 15:18:03 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975%3]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 15:18:03 +0000
Message-ID: <c94046bc-a083-278a-c9ec-738716da889d@amd.com>
Date: Wed, 10 Nov 2021 10:17:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC v2 02/22] drm: Add Enhanced Gamma and color lut range
 attributes
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-3-uma.shankar@intel.com>
 <d67a9761-91b4-3432-dd55-f85bb0657b68@amd.com>
 <20211104103827.2cf48bb7@eldfell>
 <5780b3b6-5b12-df66-03be-5f1918d28989@amd.com>
 <20211108115427.5c3f162e@eldfell>
 <8f189780-707d-0dda-778f-1a42b74ff4ae@amd.com> <YYrv6Mlp0K+9pZ+A@intel.com>
 <20211110104924.08c3b744@eldfell> <YYuzGhHZiMQ79h8l@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <YYuzGhHZiMQ79h8l@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0091.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::24) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0091.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16 via Frontend
 Transport; Wed, 10 Nov 2021 15:18:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a21ab12e-9f90-4052-a1a6-08d9a45d49d6
X-MS-TrafficTypeDiagnostic: CO6PR12MB5459:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5459BDAB492D258C44AB67D78C939@CO6PR12MB5459.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xR/w4apc0c4xVCb2Yr3Qvc199cvhHY59EhReC3cRIcqm1sSTN4coTGcEynsqD5z2ofpACT6tfat4f62RuRYpn8CTZeFmFOYJ/PeYRB37KuDTjriwxWmk2xh6TBIFCpZs8GtdIQVlcXhc+JDJYFtmPxml4XOeXdNIBjEt/u4BlbXcqWBRJ4nnmEqvV717/StmmtVQ9MAvuBxdiPWykLWIua3Y6nzj13jrdeFAVL8D0P37dimcwMPYzW9uqNgK1qiI2AUi9Q2tGU39DcqnMEfHJ9GAgekb6YOd+eAhIcdTUKQh2AmAph+QZgrQ52U8pvtHjnsG3lVGr2tOJKuW9VOdsRXFkPih6Iuf5l0buolPh+nzinkeuRRTfX9rt18Cqdjtk/FHUqagBgdd2yAoN+V+QllbNJtvDtouS4yhPGLMLe85SQYYZa570wFccMiDsv+EAfUChiFw6B86s8th8r6LIL6hin7KSGTClwYnzaQ3UE0DLv3GIF3FPnYyPleflJmCbEcGPwFB93HbTKA1JGXV8KONWuBuSY1JaRKaynBujl8CMbwKShADT/QFcshz2v90snT45vieh2a3xWa4/ccu1lYDtEdvq41P0ZqUT+oFWhVGg1+m3hmui+wmgf97n9Nl5w7oBwfKUjead+pePV+QRdFKcgXxwpFQIlEp8bF5Wh4KOlRruHkyS8CRK3arzpVAKSa/b9sR2oE6oqquGPTK/Ey7XlGH142X0j7x9Q8NCoI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(36756003)(66574015)(86362001)(6486002)(4001150100001)(44832011)(110136005)(2616005)(316002)(66476007)(54906003)(956004)(5660300002)(4326008)(508600001)(66946007)(2906002)(8936002)(26005)(186003)(38100700002)(66556008)(53546011)(31696002)(8676002)(16576012)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWl1QkJON1hKSEVsc2VsNXl3RE15dXMvSnR0TjdNT1JxVUtxRlpnaDQvZ29J?=
 =?utf-8?B?SWl4NEFtUW4vcHBNOGo4NzcxVWJLNjRPbjk0WDhIZm9kb05adHV3R3ZkNEJP?=
 =?utf-8?B?bkxrbUgyYkZsOTIvTG9xR3c3S2dyYU54V1ArVnlLLzF3Uk9FTEMycVlleHZF?=
 =?utf-8?B?dEhmWG9QR3NWM2hHR0xhY0dnMlZaQjl6U2JkVzlBVXdwY2NmZXZuQk5WU0VD?=
 =?utf-8?B?cDVYZUZldHNSQTE3cnBkTExzeDFnYkkwdU1GTnl6MTNIcTlTZnk0a1I5eGlM?=
 =?utf-8?B?ZTZzSW9mVTFsWDFUNkZhMkNSVXdtL3BDU3hMUTQ2c2YvNzcrWmpYYTQ5WXJn?=
 =?utf-8?B?dDQyaFk4cjNzaGdDTjRLemtsOVVEbTFsSUNyRjhKZkgvT3FhUmllc1pTRk1D?=
 =?utf-8?B?eWlwZHV3K05UNElRbU9jY3FjME54UmlibmhvR3kyNnhuMkdGd1Q1aHFEYnI1?=
 =?utf-8?B?T2VXR3dldUs1b2JueFBCV0psNlRITC9ORnBua2o0VUZ2VW0rMDNueGh3bTIv?=
 =?utf-8?B?Y29ldGFNYnRqaTdNd252d3RaeG42eU4wOExLdTF6ckJkWjkxL2U5bWdjT2dX?=
 =?utf-8?B?Sm9hM0ZBS2JjOGF0bFdLL1dqSGRkdXdSUVlpb1RQUlpUV1dMUWNmQUZTY1N5?=
 =?utf-8?B?UVAraDBTNTU5NkFFYllmemdyWkR3SDBVQUFTN3pRTWl1RHIrWnFkRmozanlh?=
 =?utf-8?B?dlpUenlzNEVUZ0k5QjVaY1V3Ynh2NnBuTXRzZ2duQzk4TTJmT01DdWNmeXRm?=
 =?utf-8?B?V1l1bzdxcU5GbkpRMUdkeXJnNkNVdUZqTnEvak9ZWTF0U1BNRUxXNHBGbFZ1?=
 =?utf-8?B?NWFFc1NGY002SWVxVmM1V0tPSWFlNklQOFFlZUIvVy8yTm9GRmlLK1c1UldU?=
 =?utf-8?B?eWh5b1NYMCs0MVF6dEhIVHpSSjhIUXBqVXo4TzI4NndES3BXaEVFN2lJR21K?=
 =?utf-8?B?UnROZjR4L01MSlkwY3NSVjdrK0FTbnhORkc5RjRnaXVrZWJqUDdEblRVd1gw?=
 =?utf-8?B?TitKTlpPWmFobG5QZ2NSWjYyZkRsUGpDT2VHdG9UOStVUzAwTjNhajNueFdC?=
 =?utf-8?B?aU5BN3l3SWs3QllRVWtyczhoa1dPOXRnQmZXOWlNWlJCUzBYSFRtY2Y3TTdG?=
 =?utf-8?B?dTlUYWFLOStIeEJLWGZJbFRCUnB4eXh2QjBpSGhWdjNRVmJZUEt5VFRDSlJi?=
 =?utf-8?B?WEJiMEtCd0tYb2dnVys4TVM4ejJETVY2SkorUUp1anlTZXpQRTVMQkh1Umgz?=
 =?utf-8?B?aVIwMktIdCtlRCtqT0xrWkU2VHlubC9rUkZzTmRyQ2xZRzFpVFRUS0Zaanoy?=
 =?utf-8?B?YzJLbjMxZDJXTktrTVFPb0wrcERjNlpVUEhwYktPL1ZuRngvbzVVcmIrOUh5?=
 =?utf-8?B?N0FZZDdEUkJZcXlqSWlleUtuaDUyNGtKS2VpdkQ4UDZwVUdNUDhGMWtma2Jq?=
 =?utf-8?B?V3BXV3RlaFlNd3kxZHFBOHNTSGNwSXA2aVBYcHJHcmJhTS8raC9uVHV3elAx?=
 =?utf-8?B?WU90VitlY3plUmN6NG5rekpvN3hvNjBYeU5pNDlZeGVZMS9BeFNxQVhjTzAw?=
 =?utf-8?B?NmFKQXhiRkRkcTNCRkpzakdHcTFBRTZTa3drTjB6aUk3d250eitvU1BGZTRP?=
 =?utf-8?B?RUE5ODA2YUpyVDl1Yk9FYXU1aVBuSjdabGU3MlBLY3JRYi80OEpobHAvT1RT?=
 =?utf-8?B?aUliQlBCRnV0VVk1b0NZck1OZk8yOXFGdVJxS2NMc2k2WWp3YWZ5SWVYRkdi?=
 =?utf-8?B?OXVqR2xXNEhFMlpuRGI0TS93RXVMWlh6MU56RXNqSjdKOXcxNklEQ2xBdG9t?=
 =?utf-8?B?M29xejM2SHFXZG1YSnAwSHd2Zi9VNTRtWVFsS1RGSytrbldOMVdGOEJ0bzR0?=
 =?utf-8?B?UVFMd1dGQXZPZzlVdGo4STdBV2pXa0dKV0luaDRIeUFqdWlQYzAxL2xwZzYx?=
 =?utf-8?B?ZEZUY2dUQ0lYQVdhNHlkRWFySktzcFJFZnBQaVBaTnNyejlBVXJydGUyamJ0?=
 =?utf-8?B?YU5aaEtVdVY3M0tyb3BLcHNpYWxhOU9IbzdGWVNzRW1rd09BVFpySStGOHdP?=
 =?utf-8?B?dXF2cjJxTVhoVmFqcnVMbXloQXZobWdFUFJUUlNlU2RjWVJxKzNrcklZV1ZG?=
 =?utf-8?B?alU1d3c0ckt6N01yZytxNTZpak1wOUY0dXJPRytQQUlmZjVjUXFXQVlkRW1t?=
 =?utf-8?Q?/Oh0WB7cwuzGTYzClK2Yt70=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a21ab12e-9f90-4052-a1a6-08d9a45d49d6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 15:18:03.3634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMLs4HFmlGK6cO9vnLtCK8k0D3NcYeifsiVleUh/ZouFdQJ4unDtW6n4IRnSebhiUhWzHbwDE6VrRNHBFgFVeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5459
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
Cc: Shashank.Sharma@amd.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, sebastian@sebastianwick.net,
 Uma Shankar <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-11-10 06:55, Ville Syrjälä wrote:
> On Wed, Nov 10, 2021 at 10:49:24AM +0200, Pekka Paalanen wrote:
>> On Wed, 10 Nov 2021 00:02:16 +0200
>> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>>
>>> On Tue, Nov 09, 2021 at 03:47:58PM -0500, Harry Wentland wrote:
>>>> On 2021-11-08 04:54, Pekka Paalanen wrote:  
>>>>> On Thu, 4 Nov 2021 12:27:56 -0400
>>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>>   
>>>>>> On 2021-11-04 04:38, Pekka Paalanen wrote:  
>>>>>>> On Wed, 3 Nov 2021 11:08:13 -0400
>>>>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>>>>     
>>>>>>>> On 2021-09-06 17:38, Uma Shankar wrote:    
>>>>>>>>> Existing LUT precision structure is having only 16 bit
>>>>>>>>> precision. This is not enough for upcoming enhanced hardwares
>>>>>>>>> and advance usecases like HDR processing. Hence added a new
>>>>>>>>> structure with 32 bit precision values.
>>>>>>>>>
>>>>>>>>> This also defines a new structure to define color lut ranges,
>>>>>>>>> along with related macro definitions and enums. This will help
>>>>>>>>> describe multi segmented lut ranges in the hardware.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>>>>>>>>> ---
>>>>>>>>>  include/uapi/drm/drm_mode.h | 58 +++++++++++++++++++++++++++++++++++++
>>>>>>>>>  1 file changed, 58 insertions(+)
>>
>> ...
>>
>>>>>> If the framebuffer is not in FP16 the question then becomes how
>>>>>> the integer pixel values relate to LUT addressing.  
>>>>>
>>>>> Traditionally, and in any API I've seen (GL, Vulkan), a usual mapping
>>>>> is to match minimum unsigned integer value to 0.0, and unsigned maximum
>>>>> integer value to 1.0. This is how things work on the cable too, right?
>>>>> (Also taking full vs. limited range video signal into account. And
>>>>> conversion to cable-YUV if that happens.)
>>>>>
>>>>> If you want integer format FB values to map to something else, then you
>>>>> have to tag the FB with that range information, somehow. New UAPI.
>>>>>   
>>>>
>>>> On the cable we send integer values, not floating point. AMD HW uses
>>>> floating point internally, though, and the PWL API defines floating
>>>> point entries, so on some level we need to be clear what the floating
>>>> point entries mean. Either we document that to be [0.0, 1.0] or we
>>>> have some UAPI to define it. I'm leaning toward the latter but have
>>>> to think about it some more.  
>>>
>>> As for Intel hw if you have an integer pixel value of 0xff... (with
>>> however many bits you have with a specific pixel format) it will get
>>> extended to 0.fff... (to whatever precision the pipe has internally).
>>> So if we go by that a fixed point 1.0 value in the proposed
>>> drm_color_lut_range would be considered just outside the gamut. And
>>> pretty sure fp16 input of 1.0 should also result in a 0.fff... internal
>>> value as well [1]. I think that definition pretty much matches how GL
>>> UNORM<->float conversion works as well.
>>
>> Does it work that way in GL though?
>>
>> I've always thought that with GL_UNSIGNED_BYTE, 0xff maps to 1.0, not
>> 255.0/256.0.
>>
>> Taking a random spec: OpenGL ES 2.0.25
>>
>> Section 2.1.2 Data Conversions says:
>>
>> 	Normalized unsigned integers represent numbers in the range
>> 	[0, 1]. The conversion from a normalized unsigned integer c to
>> 	the corresponding floating-point f is defined as
>> 	f = c / (2^b - 1)
>>
>> Note how the divisor has -1.
> 
> That seems to match what I said, or at least tried to say (~0 <-> 1.0 in
> float). drm_color_lut_range being fixed point would follow the ~0 side of
> that. Or at least that interpretation would very easily map to our hw.
> 

If I understand you right Intel HW represents 0xff (assuming 8 bpc) as
the largest (representable) float that is less than 1.0. That float would
be bigger than 255.0/256.0 but smaller than 256.0/256.0.

Harry

