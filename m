Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06061798901
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 16:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDBF10E8D2;
	Fri,  8 Sep 2023 14:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2878510E8C5;
 Fri,  8 Sep 2023 14:40:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbTRoDFBKW5uTzyFfEU/TZ+0396FgLr0/+hJmdeH2aodbwSHZoBY6fPrmsPKQpMOO3+hilvIgir93rOgPVrsSRQMjp6HbjAT8IkodLuuLiZND/J+B+Rd4r8wVV/hshe32vIEuECTWPHZGv5EMeOZQc5ZxRzxagl5czPsGgWW8gwOikxC2f3rakQGtmKwlMAIB1425OVp/54Q1EDGPGOlba0Kjvq7MCJrRDPx68C8CCe9jwgnjiy9c/wr7izN6ym+nqu5rxhVzQSqLO/P+2xwQCqEhjGZvyNqjVWuGFbuShhR5VqvcyAfdDaF4yW5fDqjH68igaFg3z5noLXWrelSbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQPQjE69gjtBYCngxAveT09oHtXWsrybf3lEKyIiDP8=;
 b=a/vWYog6ONBk67QKs/GLC8uRmr0WHcjyLPYxSAnqVXY3Z3LexyYPUptKc71H7ZvdRDMQjSKR6BUJ5oBFEZH83XRBkS+hQsK3gJFmhqs5YE968NbL2PRvg8AbsZMSrziEWPuDDFOneU+g1B96SJV2S+H0QTnXPZQkmkmtkvxotququB53mQAYpS1kIth39hoRlqGmSBrONKBTjzNqrGCh91OPvK9WNPyXiuWen4jqmgJNqB0vxU04+Z+Wlm30Ku4VpQAzGI62ZVW9q/RFMtdLPHfO4qUjLCI1kI/l1EaTjVy5D63imRXbrXCIjUjlKvffR5fHFvlRrj5awU22wbXNng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQPQjE69gjtBYCngxAveT09oHtXWsrybf3lEKyIiDP8=;
 b=VsTqM13AYeP72nlDZ84sche2tx7MPL+Nq1tU3zsnP8o01dtuW+sFl7oWJ+/HYCbatAOIiYaghwBPfncYp2ee8VKxS0QjFCXst2BCnStPvSbxzVx81H2nX9o0xleBsXJ9Em4e4YSUUYnWmH9W0WJIokKc4qy2HG871UysbVFgxoo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ2PR12MB7824.namprd12.prod.outlook.com (2603:10b6:a03:4c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 14:40:13 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 14:40:13 +0000
Message-ID: <93a868ae-9734-478d-86b7-dd17cd67fecb@amd.com>
Date: Fri, 8 Sep 2023 10:40:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/34] drm/amd/display: fix segment distribution for
 linear LUTs
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-2-mwen@igalia.com>
 <7e11c23d-2824-4f32-b863-13cc631a6d40@amd.com>
 <20230908141159.6hfne5r7hxi6bycs@mail.igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230908141159.6hfne5r7hxi6bycs@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0021.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::8) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ2PR12MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: 957eed19-6759-457c-bc9c-08dbb0798272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IhH2x2dELmCzG3BZzSHnBFg+uMlR96xvytxm94K6wAgK2FymVNzmxTNelSXzvnpc1x8rtz5eHP7DKK9MVsx2R/kzPag/wpBm+57pPBtBonjs4t5YpCtngpkfGm9Vj6K8iQMyVeqv0lT0bQz8Lqt0EDkFWxW+ZMWR3oefN7tqxFj0cL6XwE+ESz13JjRn7/TkUE/3KWlWhrdVCeits3QjXPXl6JCn32ynFH/AMSdYLvC1ijFGSV353VQEqmuUhqYhBnvFMkG7QfXh+KRzFb9ZdkDF2N3s5lmyi2q4+XfPtT6o5cPS5s+cbvDWIUK0jNvy9+biFA8a57PCsuAbVibDlTH9COtaNeGaacvy9YSsystn911UFRoGCUmnF94DJckp4J1p4w2qZvfnkQtUddh8K2+juIl5P0iRsO1Z8ty0NL5YUgsvD6aBCJ2jtPa+Csr4ZwnmjLXE9u8uac2peStR561ydqiF6aLnWCkBGgowL9/fI3zhsv5Jj7EIOqYo/bwGg6fl3j1YITlIz2tNbjjePsWIVj71YOZqeBXROc6i/wWLPbbGHMs1zLeHD/t9LzdvcbTFLJGkr7WzhWPXDWWQiOExYWDp606qEevpNtTmWrK4x6cTvoj7zYTWMM9Qzaa4/vnmHH/MuRU3CjF7ceQjDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199024)(186009)(1800799009)(53546011)(6486002)(6506007)(6666004)(6512007)(83380400001)(478600001)(2616005)(26005)(6916009)(2906002)(7416002)(44832011)(66556008)(316002)(54906003)(66946007)(66476007)(41300700001)(5660300002)(8676002)(4326008)(8936002)(86362001)(36756003)(31696002)(38100700002)(31686004)(66899024)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djB4NmZtcmFoNGZ5NWVxUFRrZG5iZkNtendabEdBV0Q4Vm8xcytPNU8yeWNy?=
 =?utf-8?B?bUlVRE5CRE5nbCs2U3graElQcEl4Rkl3bS9hWUN3UmUvODhjS0RQenBPL1o0?=
 =?utf-8?B?ZUcxU2FKNm5LOXAxTG0yNnNNbmtBL0FBWUZGWWVkSnVpNFE1dEx0QzI3UldN?=
 =?utf-8?B?c2VSY3RyU3dySC8yTDBNZG5JRk5YZGVXN2Q5ZGljazMvNHplYXZ3QWtPajdy?=
 =?utf-8?B?Nnk3VjRFZW1RaHE5SHJaYVYxMFBjbEp4ck5DbWZXSW1vZHNESTJJL2lZOG5M?=
 =?utf-8?B?Z056WjA4SWR6R0MyZzhCTmdtNkR5b0Q1c2JpZGlpYzQrNHA4cFN5dHVhbTRN?=
 =?utf-8?B?WkFXWWpJWEhaUnBmelFjdGplQzg2SnV5c3lyTVZEZFVmZDlKeHlnUHB0UDBw?=
 =?utf-8?B?R3VmZ3YrZWVBVGhGSW9lN25Xa0g3NFRjd1gwcXJzNnQvU1llaXo0cUFYTmdv?=
 =?utf-8?B?czcvaytaT2hPTFlEVUFsVDVqcUFiSGRCcmxtSWRTUmZybGp5TW9nRlozYmlT?=
 =?utf-8?B?RkVPaVFEV0U3cXZDTEdZczduYzh6WWZHZmJhRzlkMkk0cXpHdEpHWHFwaGV6?=
 =?utf-8?B?bkoyRkwzcHQ3dVNGSW8rLzZRSEVjQkViOXBQbmx6WWxMWFRFWlowZzN3Ujhs?=
 =?utf-8?B?SmdTTTZRNy8wSTBmSGtQblhuenBoa0RGTThrbWNGeEt1Q2hod3R3WkxrMStN?=
 =?utf-8?B?bXJRWTRldGZ0U1BBdTNvZUszZVFZaTAzSkhFOVl5dkhpTEVlTnltVUpQbkZi?=
 =?utf-8?B?c2gwNUxxVG9XejBIUDNIZXFxTjZzVnBnYnd5RzVONm11YWtWMUFvOUFyWXlj?=
 =?utf-8?B?K3ZySG03dHBXSFZLTHliWUFKS0RDSjVBZjdiUml6THBCRUI0TytPRXk2OHlU?=
 =?utf-8?B?dXhaMU1SNlAwQ0pUNE5vbkRhNFJ3WVpSam5LSmJNaVA3Z0dhV3QwcHNjWmw2?=
 =?utf-8?B?cXZGbkE5bE5WRTVlazlGY2pGVnA5RUlmTkNhZFBrdWVxaFJHTUR6MFR4T2la?=
 =?utf-8?B?MGp4Vnk1TldqV2g3eW1lUlhLNWJvZ095aUcyenNvZWpucEpzcXpUaGJEU0F5?=
 =?utf-8?B?enRGTW5JM1hNUGdOMjdlNkVtcVVBS1BSWWdWQklpYTJiZ29tbHE5MUpUY3k1?=
 =?utf-8?B?ZjZsdk5BSWp4Ky9CU3NOcEdVMGtpSnFvakZiN0I1U01Hb3VYNjZuSGtibDcz?=
 =?utf-8?B?OG9mV2RPMXRwQUxJcVc5RWdjOVBGUjdpd0RSQ0tjM2FWTUM4dDh4V1E1SEVt?=
 =?utf-8?B?L2JVdnliVEQzWVl6M29YQUhCR0lLV3pGb1Erc3ZNK0pXZGpLTi9GZHBLeUFK?=
 =?utf-8?B?eUFxMEY0dDk3U0tXZVRQL2ZPTmpsQ1RocFM5MkNUTTFLbnJmK0QzZ2FkZjB3?=
 =?utf-8?B?UWdZdHIwUzAwbFo3U0RjU3BPYzdNR0c3Z3dFZDUwaEoyTWR3d3gwNWhjckJD?=
 =?utf-8?B?S1VqMDlJZ0M5WEVwSWllRm1zWUVUSGhnU1dJOGhBS3dkUGRrVVRuNEVQTG5D?=
 =?utf-8?B?VFVsQ1BsNjBPNXVGMGd6STF5ZjhpMFRYVmpvOW5yNmh3UUt6Mm93VVJNQ1Nh?=
 =?utf-8?B?c3ViWTN4MmRXUUd2OGVlWXlEWmhPRXNjU2xXZHp6dnpHUWFoVUE1YUlIM3hy?=
 =?utf-8?B?UEJwZDBIajRmUElLeXBUcUZGWWU2N3Frb3J2Z3pNamNhamNOa0hmY0w0RzRV?=
 =?utf-8?B?OURHeG80ZGFGRXV3bmdwbUdlbUhSR0V4aDlxcjdLM290akVxZmh0cm1ZTFdI?=
 =?utf-8?B?RzdINHNCOWswV0EwRUt2UkZweFlCTnl3UVFOeXZUNC9XQjljdEJOalF1UHp1?=
 =?utf-8?B?SEJlaDdYRGtvSGJpbmpYeGpKQjlJOEp0YXViQVUxeDhyZWVEc0VsdkZXdG1y?=
 =?utf-8?B?Ym5kYm5odlNpVmxnaHRaQVlmeWxSbGdzZEZUL1NHMXZIVHYxdlUzd2E5WmFL?=
 =?utf-8?B?Z1hERVRJb3g3QkNjbFhFeTUrTkk0YTFFdWliek9nNmU1MDBnazRlRy9OT25H?=
 =?utf-8?B?d1R6Y09rTXdqR1NGbndVTDBESjNQUXoxczN1L3YzWDY0ODlCc05yTXExNFRq?=
 =?utf-8?B?R3dVdkt5aGxGZFBDUkdERTk1SzU4bEdiM1htM2ZpSHhFMjFuNlUrUlhlUnRO?=
 =?utf-8?Q?jKgDa+0kZWFh1Nn2AQShY9WTU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 957eed19-6759-457c-bc9c-08dbb0798272
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 14:40:13.1243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mM5fNH89PRXUsPkdrw7SV3rdclBnzsgVI8nCaSCaX65TTbDH9QSwPeuDyZb4zi9ElHgq3pCjuvD54n7e/3g4Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7824
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-09-08 10:11, Melissa Wen wrote:
> On 09/06, Harry Wentland wrote:
>> On 2023-08-10 12:02, Melissa Wen wrote:
>>> From: Harry Wentland <harry.wentland@amd.com>
>>>
>>> The region and segment calculation was incapable of dealing
>>> with regions of more than 16 segments. We first fix this.
>>>
>>> Now that we can support regions up to 256 elements we can
>>> define a better segment distribution for near-linear LUTs
>>> for our maximum of 256 HW-supported points.
>>>
>>> With these changes an "identity" LUT looks visually
>>> indistinguishable from bypass and allows us to use
>>> our 3DLUT.
>>>
>>
>> Have you had a chance to test whether this patch makes a
>> difference? I haven't had the time yet.
> 
> Last time I tested there was a banding issue on plane shaper LUT PQ ->
> Display Native, but it seems I don't have this use case on tester
> anymore, so I wasn't able to double-check if the issue persist. Maybe
> Joshua can provide some inputs here.
> 
> Something I noticed is that shaper LUTs are the only 1D LUT on DCN30
> pipeline that uses cm_helper_translate_curve_to_hw_format(), all others
> (dpp-degamma/dpp-blend/mpc-regamma) call cm3_helper_translate_curve_*.
> 

Yeah, they use different codepaths, unfortunately. Might be nice if we
could make them use the same.

> We can drop it from this series until we get the steps to report the
> issue properly.
> 

Thanks. If you have concrete steps that show the issue (or even better,
an IGT test) I would be happy to include this.

Harry

> Melissa
> 
>>
>> Harry
>>
>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>   .../amd/display/dc/dcn10/dcn10_cm_common.c    | 93 +++++++++++++++----
>>>   1 file changed, 75 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
>>> index 3538973bd0c6..04b2e04b68f3 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
>>> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c
>>> @@ -349,20 +349,37 @@ bool cm_helper_translate_curve_to_hw_format(struct dc_context *ctx,
>>>   		 * segment is from 2^-10 to 2^1
>>>   		 * There are less than 256 points, for optimization
>>>   		 */
>>> -		seg_distr[0] = 3;
>>> -		seg_distr[1] = 4;
>>> -		seg_distr[2] = 4;
>>> -		seg_distr[3] = 4;
>>> -		seg_distr[4] = 4;
>>> -		seg_distr[5] = 4;
>>> -		seg_distr[6] = 4;
>>> -		seg_distr[7] = 4;
>>> -		seg_distr[8] = 4;
>>> -		seg_distr[9] = 4;
>>> -		seg_distr[10] = 1;
>>> +		if (output_tf->tf == TRANSFER_FUNCTION_LINEAR) {
>>> +			seg_distr[0] = 0; /* 2 */
>>> +			seg_distr[1] = 1; /* 4 */
>>> +			seg_distr[2] = 2; /* 4 */
>>> +			seg_distr[3] = 3; /* 8 */
>>> +			seg_distr[4] = 4; /* 16 */
>>> +			seg_distr[5] = 5; /* 32 */
>>> +			seg_distr[6] = 6; /* 64 */
>>> +			seg_distr[7] = 7; /* 128 */
>>> +
>>> +			region_start = -8;
>>> +			region_end = 1;
>>> +		} else {
>>> +			seg_distr[0] = 3; /* 8 */
>>> +			seg_distr[1] = 4; /* 16 */
>>> +			seg_distr[2] = 4;
>>> +			seg_distr[3] = 4;
>>> +			seg_distr[4] = 4;
>>> +			seg_distr[5] = 4;
>>> +			seg_distr[6] = 4;
>>> +			seg_distr[7] = 4;
>>> +			seg_distr[8] = 4;
>>> +			seg_distr[9] = 4;
>>> +			seg_distr[10] = 1; /* 2 */
>>> +			/* total = 8*16 + 8 + 64 + 2 = */
>>> +
>>> +			region_start = -10;
>>> +			region_end = 1;
>>> +		}
>>> +
>>>   
>>> -		region_start = -10;
>>> -		region_end = 1;
>>>   	}
>>>   
>>>   	for (i = region_end - region_start; i < MAX_REGIONS_NUMBER ; i++)
>>> @@ -375,16 +392,56 @@ bool cm_helper_translate_curve_to_hw_format(struct dc_context *ctx,
>>>   
>>>   	j = 0;
>>>   	for (k = 0; k < (region_end - region_start); k++) {
>>> -		increment = NUMBER_SW_SEGMENTS / (1 << seg_distr[k]);
>>> +		/*
>>> +		 * We're using an ugly-ish hack here. Our HW allows for
>>> +		 * 256 segments per region but SW_SEGMENTS is 16.
>>> +		 * SW_SEGMENTS has some undocumented relationship to
>>> +		 * the number of points in the tf_pts struct, which
>>> +		 * is 512, unlike what's suggested TRANSFER_FUNC_POINTS.
>>> +		 *
>>> +		 * In order to work past this dilemma we'll scale our
>>> +		 * increment by (1 << 4) and then do the inverse (1 >> 4)
>>> +		 * when accessing the elements in tf_pts.
>>> +		 *
>>> +		 * TODO: find a better way using SW_SEGMENTS and
>>> +		 *       TRANSFER_FUNC_POINTS definitions
>>> +		 */
>>> +		increment = (NUMBER_SW_SEGMENTS << 4) / (1 << seg_distr[k]);
>>>   		start_index = (region_start + k + MAX_LOW_POINT) *
>>>   				NUMBER_SW_SEGMENTS;
>>> -		for (i = start_index; i < start_index + NUMBER_SW_SEGMENTS;
>>> +		for (i = (start_index << 4); i < (start_index << 4) + (NUMBER_SW_SEGMENTS << 4);
>>>   				i += increment) {
>>> +			struct fixed31_32 in_plus_one, in;
>>> +			struct fixed31_32 value, red_value, green_value, blue_value;
>>> +			uint32_t t = i & 0xf;
>>> +
>>>   			if (j == hw_points - 1)
>>>   				break;
>>> -			rgb_resulted[j].red = output_tf->tf_pts.red[i];
>>> -			rgb_resulted[j].green = output_tf->tf_pts.green[i];
>>> -			rgb_resulted[j].blue = output_tf->tf_pts.blue[i];
>>> +
>>> +			in_plus_one = output_tf->tf_pts.red[(i >> 4) + 1];
>>> +			in = output_tf->tf_pts.red[i >> 4];
>>> +			value = dc_fixpt_sub(in_plus_one, in);
>>> +			value = dc_fixpt_shr(dc_fixpt_mul_int(value, t),  4);
>>> +			value = dc_fixpt_add(in, value);
>>> +			red_value = value;
>>> +
>>> +			in_plus_one = output_tf->tf_pts.green[(i >> 4) + 1];
>>> +			in = output_tf->tf_pts.green[i >> 4];
>>> +			value = dc_fixpt_sub(in_plus_one, in);
>>> +			value = dc_fixpt_shr(dc_fixpt_mul_int(value, t),  4);
>>> +			value = dc_fixpt_add(in, value);
>>> +			green_value = value;
>>> +
>>> +			in_plus_one = output_tf->tf_pts.blue[(i >> 4) + 1];
>>> +			in = output_tf->tf_pts.blue[i >> 4];
>>> +			value = dc_fixpt_sub(in_plus_one, in);
>>> +			value = dc_fixpt_shr(dc_fixpt_mul_int(value, t),  4);
>>> +			value = dc_fixpt_add(in, value);
>>> +			blue_value = value;
>>> +
>>> +			rgb_resulted[j].red = red_value;
>>> +			rgb_resulted[j].green = green_value;
>>> +			rgb_resulted[j].blue = blue_value;
>>>   			j++;
>>>   		}
>>>   	}
>>
