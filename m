Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E5945A5EF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C843E6E176;
	Tue, 23 Nov 2021 14:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EC06E176;
 Tue, 23 Nov 2021 14:41:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIpXH8Evuzab5TpGTrsZl2J4CW9hUqGKqkTgMj1iRP5X8W4w5DRiaEsji1ep7nuCeSJuw3shIUH8AQaE4pkf5vr8J2RfE7eGY2f6KIatseL4z9GgfnK3CQpwtH+S2Xq4Mk9oP3ZJ0Ga51wZluaaFUkfDUKgTXIlVNbKWBHK2B9wYNwphMgxf75oUFbsTL+nTU80lXbvt+H2r0IHB4VFQBBDD9joOYYzKu/7Eh0r0GVViKzNfykLgu091oNoPx+uF+qhq7GEV3KIX1amhqShV3SEjh41LGmZoFzbt8kI6zFOJx0G3LJXbnSpySHy8pCuvwAvKbTwX8AODZ+1LkXAs5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81ZFQluNKlv5vWotlHPDj+ZkQ/73cijfS2zPAg9G3yk=;
 b=UWaZLnTRL4EjzWqP3nOKpPtz9QfRFPbMX3hduDXPHRGbnG2ZK7/X0Ry1fM/6mbKZ3BnC+ApCfhcs/6sJIG5H5tCkfVA6qaMmnRXMM6JnhDAzBuSIZFzuJ8ATkg7GTgjrWmra84Nkt1uKx/lodh3oBJjpFLzkZswL48TnGgfedABAUVTUH4oC/gf1LIfLmOk6iTLzroc5xhGQhuuNOvfNoI4aX395X9H4N3NLSM8SSk2A0cdOHMtDd4+NSTwePNLYRqzCCjmwPz2OerGJi88nApL2gP5bcrSKJyYTlIEtswaeHBod2LN2xDMDoidBukup56LhBGaSHKl8XDS9FjA4PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81ZFQluNKlv5vWotlHPDj+ZkQ/73cijfS2zPAg9G3yk=;
 b=uZHXR9WpyFdGtNfRU3cwvdGOAh2fElFVuuCC4h4U7resvHZPAtZvwIhh7hc+H34EKlDLVmvgUlKKAeHey9+ewodmnomKUBw2ugX2NLXVq5SGZ/FuV0QGfriy6jKTZexktocWkHkuYxi03lmibGeui8O04ggaqpLnRFv392FfgUk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5476.namprd12.prod.outlook.com (2603:10b6:303:138::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 14:41:03 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46%5]) with mapi id 15.20.4713.025; Tue, 23 Nov 2021
 14:41:03 +0000
Message-ID: <7da31336-551d-6d3c-e2a4-6db927b30c6e@amd.com>
Date: Tue, 23 Nov 2021 09:40:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range struct
 for HDR planes
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-6-uma.shankar@intel.com>
 <52ce874c-64ae-d7a9-bc4e-255cfa49f410@amd.com> <YY1H//+XISVMFZNL@intel.com>
 <edc4b80279354ec7bcdb0a890dae7d79@intel.com>
 <4a26ada6-feaa-76df-3ffe-d694e367d809@amd.com>
 <965b42dd64844e7c8c1b0af7582a4306@intel.com>
 <20211112103702.7139cec7@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211112103702.7139cec7@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::18) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR01CA0046.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:2::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.20 via Frontend Transport; Tue, 23 Nov 2021 14:41:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0400dea-b206-423e-fc43-08d9ae8f45f7
X-MS-TrafficTypeDiagnostic: CO6PR12MB5476:
X-Microsoft-Antispam-PRVS: <CO6PR12MB54763B223E490F39D5326CB48C609@CO6PR12MB5476.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7PJtVX+ODxtWT61/Vk+2JgkIrR6svqDpzA/mUQyBwxYtTejnKJSd8jtcob+5b9NgecJ0YAwhAsJG1kcNBZXPnJ7+KhCHz28guVWEWszRxkoH4gmCryypfjGxPPKEbV9F0zbeFCep5KEBYUFP9zuFL9ElczfdiD4kUwaS6Ys9fZ7wV/a29/E9HQNSoVe9bkEPT1TinHpG2Tu6Ub4V6IKBJKScAW0Fjl9PeuGNLtAMSqgiHPJUP+thuwnZLTQ88VdahxJDbiwCuDMUNz3w/Zb9yvJJSHT3HIlm2a29qQoa8p23lu0NnbCEmbo2XzCTOj05u8UBP3Z9nH2+Ri29hfvusjvQ8GXNKD1ZMpducA6jqXfcpxMyX33SiJmch+SbE9Vio64QD6RM+Y3+z7fl01VsUWWBhh87dp87fTc4NR9lEp0ndz0gwfzYDX0WS61XFcb1yvv6hBalvusqB/kwCXjRztfDuJTCaJHqAnFcSUcRmUMknXsxTj4bJfbSLadLsfpdE6aJCgwtwH2cACGFB13FrJfKXwUjnLY6dAuhGJmrn2zcKRPdv414B7PvutZ4iQf16sUjqf4KzcTWG5aBXjiBnHAk/NdmcBq9cDfNYPDjDSAoVcM59o+PM/qFmzXXO6H2LhZkCnOoEnNN1GV5245lGlquMAx9OQL2xhX2YrjwaoG6dMfRfU0Oisj3mH/KLR0GupIDpOou0UCLT13S1Q8pG3Z7PfQ7nDbuRfoiwTthyx6+XjmeQKL74Es3aYkVMyJz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(16576012)(44832011)(6486002)(316002)(31696002)(2616005)(83380400001)(966005)(956004)(186003)(26005)(38100700002)(66574015)(8676002)(66476007)(508600001)(66946007)(8936002)(53546011)(66556008)(5660300002)(31686004)(110136005)(4001150100001)(4326008)(86362001)(36756003)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmFDV2E0TFV4TzIwNGk3d1hWcVBDdm9yeWxHZDNNbnB4dVIvNUNzdTlaelVo?=
 =?utf-8?B?aGMzRHpKdGI4OC8zekcyb3ZQN3hqZTVVMjJRSzFobEFnbHVJWFhZS3BkTXNY?=
 =?utf-8?B?SEhuMG5wY2tBUzFPVldQYjdWTURIcDhKQnlySGFpNndMWkZQb0NTRmQrc3dE?=
 =?utf-8?B?VUthWmtXazNJejNIWmMrOWVKalBzalVNRlJkRW1LcVR1MzZZY0t2akM2VlJz?=
 =?utf-8?B?a0JQWWNMUTd5Q1VLSTdwWllXdEpjZ3hXSnJDQmJabVovaC9IdGczMWcvNFZ2?=
 =?utf-8?B?Ny8zblFFUzdoUUUyVm9NK2ZOc0tQVE9PZHhyRUdRYVE4VHJLTEFNb2R5TnYv?=
 =?utf-8?B?aWVGQm05Tzdhd0Y4NEcrTDBkdFFXMzJrL1lGcnNtNm9PVHVvdndrdGdINFdK?=
 =?utf-8?B?R2VFOG9MWGZ1SVZVNHlHcEFUQzBmczIzWkpGaEVrbFZSK24xeW4rM05WaGRp?=
 =?utf-8?B?MlIyU0pmR3ZpV1NHVDNMWXY1ekU3bmFoV0wvcjZEOU1RWmNMV1ZYdVNaZzUv?=
 =?utf-8?B?OXhWS01McDVOT2ZtUDgza2FZUUszTW95VlJBeHBPeHp4WTVibjJQM1pqekZV?=
 =?utf-8?B?SXBoeHlla1ZiV3NHNTFCYmlZNGZRbjkrNzcvMEpJNnpScWtDU2F3SG9MeTJ0?=
 =?utf-8?B?dEtyRyt4QWU2RlhCditmb1BnZUpDRGJyTW5kYlhaYWI0d3d6SmJiZ0RWcE9Y?=
 =?utf-8?B?LzhaRnZ5enFPQUM3bmErUEZhS2IxemgwZkx3anNNcjJDMEQ0VkJMT0Y4bjFI?=
 =?utf-8?B?UjNlTXJyUURsZ0xMNXhnWWx4cWtSRms1Rm1BR256QWx0ZHdKbHRWd1ZoRS9p?=
 =?utf-8?B?OGdHQU1MU3AwYjhRU01MWlBSNlZqanVyTTVwSHNkTHJIblE2RW0wUk1Ea1A1?=
 =?utf-8?B?dTFjOENEaE9UYzRocnVrQ2RLbEpoQUk0L0N1Uk5wb242UXhxTWF1WEcwOWNH?=
 =?utf-8?B?OE1JdEFXNWtwZTBzdDVYR2ZZRWJSWTNYUkVxT25yZVoxSWJ6TjlzMWMzWTBv?=
 =?utf-8?B?RjFIZFJWZ3F1MUZmNjJDNURzYTVTbHljNU9mT3B3ajU3UWszWWlwbm9OcDIr?=
 =?utf-8?B?djVkN0FKS0VEdmVneUN1UWZnTTgwcDVUVDFVbDV6S3J4YlFCVU40VFBhK01h?=
 =?utf-8?B?eWNNQ09KOW5vSjZ2Z2t1NjU2cXo0U0lPdS91U2JqWWw3VzhJbk1yeUs5Ymhr?=
 =?utf-8?B?L0E1STR3dGxJK1czTnozcDQzLzNJbUtxTDhkMDQ2ZU1BcnBzbWwrc0JmZkkr?=
 =?utf-8?B?YWJ0ZHRUWlVzVks3S2gwOU82MDJFMTA1NnljWjlnRVdoTTNWNXFJT2I0L0ZK?=
 =?utf-8?B?T3d1WlcxckorZ3hRRHh1ZnR6aW1IUXI4NmxWS2lhbGVxSnQyMzRJZENsY1A4?=
 =?utf-8?B?N1ppeHpiUytzOHdGS1J6UnRMSGxKV1g5NldqZmZYUVpacUxhQ2s4QzRXRHRv?=
 =?utf-8?B?K0JlVHVXeUN1eHZ1TzE0cVZ0cGlhTEJyTnJiNHhaQTlwZHhqNTA3MnFQZE5N?=
 =?utf-8?B?TllucmhLc3NHM3l2cXBhZ2RpazQ3ZTVCTkI3azBVb3FHUnRkN1FhamNNR1Nx?=
 =?utf-8?B?d29uQTQ5K0tkcCt6NFhpaEg5c0cydkVveDRiNk9WV0NiYmg5UnFGR1AvKzFK?=
 =?utf-8?B?L0FhMXMxY1ByTVQraFY3bTR6YWlRdUxZYzJSMjNBRHJLWnRlQXpyaDhiNnlH?=
 =?utf-8?B?QnZWbUsrVWEwb2hWcGJKaENzem96eWVZdXNxcFJMTzVYUy9BaGR4SEpvQnpu?=
 =?utf-8?B?dndLVDBqT3UxdDNMeUNETm8rOFVKK2hhUlp4bTRXMVZhbE1kK3U4c05qd0F5?=
 =?utf-8?B?bVhuYWhxMnJDVDQ4ay91c3J3a3p2WE00d3B5dlVIWUYrTS84Rm42WWM3SWF3?=
 =?utf-8?B?eFBGbCtEcnpqUGhFWDVKNU5xaFBmUWF6VkpnMzBjdC9VUEc0bjQrc3RIWlMy?=
 =?utf-8?B?cU1UNWhEeHE4SEtzWEd5TlJtYnYxMTB4VVdYQ1cyakg0Q2REMktRY0J6Y0V5?=
 =?utf-8?B?eGFhVEtHWnZUVjhsZjdYdzhHRGtPV1VpK2Y2aFBXcVhuTzg5VVh3dUFKNXlT?=
 =?utf-8?B?QU1oaHlVM0lGZXkrZEl3cUhXWjJVTzR2UkkzZlJwcUVFNndnbUN5L3JkOWtI?=
 =?utf-8?B?Y2VsN0xqbmozem1oY1kxMTA2bzdRUUxwQzVudTVyZ1VPZmEwdm1Md2R4ejJk?=
 =?utf-8?Q?gdjCksdEeu/u4QQBJjPS4BM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0400dea-b206-423e-fc43-08d9ae8f45f7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 14:41:02.8744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyURIbnbBtbs2n1vrjhyB+gkEBgiGdpZhDmtKsbBcM82K31bMiai4Tk/RSgDuxcb1q53NQY469L3Ub5oLqTIfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5476
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
Cc: "Shashank.Sharma@amd.com" <Shashank.Sharma@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-11-12 03:37, Pekka Paalanen wrote:
> On Thu, 11 Nov 2021 21:58:35 +0000
> "Shankar, Uma" <uma.shankar@intel.com> wrote:
> 
>>> -----Original Message-----
>>> From: Harry Wentland <harry.wentland@amd.com>
>>> Sent: Friday, November 12, 2021 2:41 AM
>>> To: Shankar, Uma <uma.shankar@intel.com>; Ville Syrjälä
>>> <ville.syrjala@linux.intel.com>
>>> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
>>> ppaalanen@gmail.com; brian.starkey@arm.com; sebastian@sebastianwick.net;
>>> Shashank.Sharma@amd.com
>>> Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range struct for
>>> HDR planes
>>>
>>>
>>>
>>> On 2021-11-11 15:42, Shankar, Uma wrote:  
>>>>
>>>>  
>>>>> -----Original Message-----
>>>>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>>> Sent: Thursday, November 11, 2021 10:13 PM
>>>>> To: Harry Wentland <harry.wentland@amd.com>
>>>>> Cc: Shankar, Uma <uma.shankar@intel.com>;
>>>>> intel-gfx@lists.freedesktop.org; dri- devel@lists.freedesktop.org;
>>>>> ppaalanen@gmail.com; brian.starkey@arm.com;
>>>>> sebastian@sebastianwick.net; Shashank.Sharma@amd.com
>>>>> Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range
>>>>> struct for HDR planes
>>>>>
>>>>> On Thu, Nov 11, 2021 at 10:17:17AM -0500, Harry Wentland wrote:  
>>>>>>
>>>>>>
>>>>>> On 2021-09-06 17:38, Uma Shankar wrote:  
>>>>>>> Define the structure with XE_LPD degamma lut ranges. HDR and SDR
>>>>>>> planes have different capabilities, implemented respective
>>>>>>> structure for the HDR planes.
>>>>>>>
>>>>>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/i915/display/intel_color.c | 52
>>>>>>> ++++++++++++++++++++++
>>>>>>>  1 file changed, 52 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
>>>>>>> b/drivers/gpu/drm/i915/display/intel_color.c
>>>>>>> index afcb4bf3826c..6403bd74324b 100644
>>>>>>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>>>>>>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>>>>>>> @@ -2092,6 +2092,58 @@ static void icl_read_luts(struct
>>>>>>> intel_crtc_state  
>>>>> *crtc_state)  
>>>>>>>  	}
>>>>>>>  }
>>>>>>>
>>>>>>> + /* FIXME input bpc? */
>>>>>>> +__maybe_unused
>>>>>>> +static const struct drm_color_lut_range d13_degamma_hdr[] = {
>>>>>>> +	/* segment 1 */
>>>>>>> +	{
>>>>>>> +		.flags = (DRM_MODE_LUT_GAMMA |
>>>>>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
>>>>>>> +			  DRM_MODE_LUT_INTERPOLATE |
>>>>>>> +			  DRM_MODE_LUT_NON_DECREASING),
>>>>>>> +		.count = 128,
>>>>>>> +		.input_bpc = 24, .output_bpc = 16,
>>>>>>> +		.start = 0, .end = (1 << 24) - 1,
>>>>>>> +		.min = 0, .max = (1 << 24) - 1,
>>>>>>> +	},
>>>>>>> +	/* segment 2 */
>>>>>>> +	{
>>>>>>> +		.flags = (DRM_MODE_LUT_GAMMA |
>>>>>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
>>>>>>> +			  DRM_MODE_LUT_INTERPOLATE |
>>>>>>> +			  DRM_MODE_LUT_REUSE_LAST |
>>>>>>> +			  DRM_MODE_LUT_NON_DECREASING),
>>>>>>> +		.count = 1,
>>>>>>> +		.input_bpc = 24, .output_bpc = 16,
>>>>>>> +		.start = (1 << 24) - 1, .end = 1 << 24,
>>>>>>> +		.min = 0, .max = (1 << 27) - 1,
>>>>>>> +	},
>>>>>>> +	/* Segment 3 */
>>>>>>> +	{
>>>>>>> +		.flags = (DRM_MODE_LUT_GAMMA |
>>>>>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
>>>>>>> +			  DRM_MODE_LUT_INTERPOLATE |
>>>>>>> +			  DRM_MODE_LUT_REUSE_LAST |
>>>>>>> +			  DRM_MODE_LUT_NON_DECREASING),
>>>>>>> +		.count = 1,
>>>>>>> +		.input_bpc = 24, .output_bpc = 16,
>>>>>>> +		.start = 1 << 24, .end = 3 << 24,
>>>>>>> +		.min = 0, .max = (1 << 27) - 1,
>>>>>>> +	},
>>>>>>> +	/* Segment 4 */
>>>>>>> +	{
>>>>>>> +		.flags = (DRM_MODE_LUT_GAMMA |
>>>>>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
>>>>>>> +			  DRM_MODE_LUT_INTERPOLATE |
>>>>>>> +			  DRM_MODE_LUT_REUSE_LAST |
>>>>>>> +			  DRM_MODE_LUT_NON_DECREASING),
>>>>>>> +		.count = 1,
>>>>>>> +		.input_bpc = 24, .output_bpc = 16,
>>>>>>> +		.start = 3 << 24, .end = 7 << 24,
>>>>>>> +		.min = 0, .max = (1 << 27) - 1,
>>>>>>> +	},
>>>>>>> +};  
>>>>>>
>>>>>> If I understand this right, userspace would need this definition in
>>>>>> order to populate the degamma blob. Should this sit in a UAPI header?  
> 
> Are you asking whether 'struct drm_color_lut_range` is defined in any
> userspace visible header?
> 
> It seems to be in patch 2.
> 
>>>>
>>>> Hi Harry, Pekka and Ville,
>>>> Sorry for being a bit late on the replies, got side tracked with various issues.
>>>> I am back on this. Apologies for delay.
>>>>  
>>>>> My original idea (not sure it's fully realized in this series) is to
>>>>> have a new GAMMA_MODE/etc. enum property on each crtc (or plane) for
>>>>> which each enum value points to a kernel provided blob that contains one of  
>>> these LUT descriptors.  
>>>>> Userspace can then query them dynamically and pick the best one for
>>>>> its current use case.  
>>>>
>>>> We have this as part of the series Ville. Patch 3 of this series
>>>> creates a DEGAMMA_MODE property just for this. With that userspace can
>>>> just query the blob_id's and will get the various degamma mode possible and the  
>>> respective segment and lut distributions.  
>>>>
>>>> This will be generic, so for userspace it should just be able to query
>>>> this and parse and get the lut distribution and segment ranges.
>>>>  
>>>
>>> Thanks for the explanation.
>>>
>>> Uma, have you had a chance to sketch some of this out in IGT? I'm trying to see how
>>> userspace would do this in practice and will try to sketch an IGT test for this myself,
>>> but if you have it already we could share the effort.  
>>
>> Yes Harry, we do have some sample IGT's to test this. Will send those out and will copy
>> you and all the stakeholders.
>>

Thanks. The set is on my list of items to review.

>>>>> The algorithm for choosing the best one might be something like:
>>>>> - prefer LUT with bpc >= FB bpc, but perhaps not needlessly high bpc
>>>>> - prefer interpolated vs. direct lookup based on current needs (eg. X
>>>>>   could prefer direct lookup to get directcolor visuals).
>>>>> - prefer one with extended range values if needed
>>>>> - for HDR prefer smaller step size in dark tones,
>>>>>   for SDR perhaps prefer a more uniform step size
>>>>>
>>>>> Or maybe we should include some kind of usage hints as well?  
>>>>
>>>> I think the segment range and distribution of lut should be enough for
>>>> a userspace to pick the right ones, but we can add some examples in UAPI  
>>> descriptions as hints.  
>>>>  
>>>
>>> The range might be enough, but we're already parsing hints like "GAMMA"
>>> or "DEGAMMA". I wonder if it would make sense to add a flag for "HDR" or "SDR" as
>>> well.  
> 
> What hints are GAMMA or DEGAMMA and who's parsing them? I thought they
> are just arbitrary names to identify the element's position in the
> abstract pipeline.
> 

They are provided with the segment definitions, e.g. in 
https://patchwork.freedesktop.org/patch/452589/?series=90826&rev=2

I believe they are indicating whether a segment definition is
intended for degamma (linearization) use or for gamma (delinearization)
use.

>>
>> On Intel hardware, we differentiate this with precision and have HDR planes (they have extra
>> Lut precision and samples) separately called out. We could add SDR/HDR FLAG as well.
> 
> What about wide color gamut SDR? That probably needs more precision
> than "normal" SDR but is not HDR.
> 
> I can't think of how SDR/HDR flags would work or what they would mean.
> Feels a bit too simple for practice. Maybe that concept should be
> created by a hypothetical userspace helper library instead.
> 

Maybe this is a decision best left up to compositors. A compositor
will know best what precision and range it needs.

Harry

> 
> Thanks,
> pq
> 

