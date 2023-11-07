Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A74B7E4662
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 17:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D467710E137;
	Tue,  7 Nov 2023 16:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C0C10E621;
 Tue,  7 Nov 2023 16:52:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LL7x9vBCIvVX2GO+z5dFntBxIYfXhcTOGFsZGI9YLV7I8s48pmdglF6tyGU3Qt9iQuHbEgspD5BAMmZf8xHVpY38oYtcH0g9z6Gz26dv41GQS27cFaDzq6mtjW/8rMbUy/kivKHo+A9MhI1sN40WAcRG8p+WPb/0mBCNrTj1Q4Patv7a6BZpB8yhQ7pzCiNYg+WPMUac7q1V30SaFKjXEUqoorV1wHBgd+G+f7emdkwwquxqEXzPI1NK1OQhfmjasK6ioT96llxm0k43tlL3JGoHdhp/UG9OQR214I/iOtCeKnWuNxlPM9N0YRTNZnhV3lqEVMyhJl0h92qYLrr3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLkjkCqyCoan2vHND/OWctrEcVuycJrxo1Xy6kTz2nI=;
 b=bs0ivsFpI8n2uPdKvVKVahUWL6RQBhl4+1MSMfHkhCZVcdl2VpaJHdYbCOCt5h2MCZpGPqR/TI3WpRG9Go/8fe6GMljZV/7NMNbNQ+pOrvys2cnPjmMcylZEINTGRcGmkec3Ms6W3ofnMruy9YxeSAErAVoDXA4v01EGkFCB09fEvUO2CDDQP8j7Chpsa8yLQ5rgN/2H4mZagnsSCHaXinTXGfXckhZ3cbzie1fqQlnugL1OcQAXY5CzoSaE0Drp5vdY0+WRyAKVufrH/fiQBw//xazZSVIIn1yHPtdmw7fYSONrj40iDe3si2oDpXAgg2VumOFgHJqgurtCiN0S/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLkjkCqyCoan2vHND/OWctrEcVuycJrxo1Xy6kTz2nI=;
 b=eojeexPjlXZaWz7p9pJkULbpwnfpimJLU/MesdEV4jMA195s9Kuyc+M77Yl7IVXGr5DQhW2V/VX87UxEk5vxzgUikhz6Ei1dBeZpObRKYiI/HLz4BYWXfpH5AF/6+B0sX7Ma5GJ8mLBIkegefY5nGs8KbrivpLJqWBNLUpsF4pU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH0PR12MB5418.namprd12.prod.outlook.com (2603:10b6:510:e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 16:52:22 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 16:52:22 +0000
Message-ID: <0dc74587-e2f8-4f6d-95d8-c4a0679e78bf@amd.com>
Date: Tue, 7 Nov 2023 11:52:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Content-Language: en-US
To: Christopher Braga <quic_cbraga@quicinc.com>,
 Alex Goins <agoins@nvidia.com>, Sebastian Wick <sebastian.wick@redhat.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox> <20231020175703.09cd2578@eldfell>
 <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
 <20231023111219.6e287958@eldfell>
 <bf69b740-dce7-94f1-293d-a4b274b52f55@nvidia.com>
 <20231026115747.44cbddad@eldfell> <20231026173003.GA319477@toolbox>
 <1255ad3-e22b-063-ffb8-18ea852f054@nvidia.com>
 <7aa2519b-4eac-4378-8d9c-9180428ef0b2@quicinc.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <7aa2519b-4eac-4378-8d9c-9180428ef0b2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0304.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH0PR12MB5418:EE_
X-MS-Office365-Filtering-Correlation-Id: 379905c5-5fa6-4ce4-a138-08dbdfb1e945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YwUNVLqr6w8VhbvgrM5+hSSFKJLkKLAk9yI6gS/ZxSpoxJPc1x6CzdcE4IUNuVwIs2hQQOUX3faZZa1nLWmbaitFga6wMWGFP/lDpPP7yCwekafVIGJ/fa1xre6AqNM/7zvEaf0JpfKDcG9eXtfbqQKB7aZ0BI4BEy+fZDorP6liFCX+nPKEAbaE5hbsdpTfP2LjZ56opJgwu7P8a54mXdUwMQd5+iWHHyQ77Go44H25u4G7AkmPwr4usvTNCtde1kTUe1kt2aW0wKm2CUO+5ZvEU6Gubj6UGRWqiqpO73hTzDPEjzPxsGDBq1wF0dxKf7dL6Dr1c40O3ocny7x2Sj8uTUwqrnZRcS9tr4tbigtU50sHTFV08OQl762H2vJnLQnKjDUi6UdOQSDkJXgsPSV8MGmu19HGzlFL2AeI76g8PT+gF4ZDYc/q7XEaMRGgUckUcRp7k1PZvSPy9gcleMVPZeruZBUVdoATfflnAIgfnEwfh3gB9QRUcwJK1TBDfAlRsHaKyhYYGOJkNaycux9WhE295rmYFFXAUzTqYThuLtZ4ZWQl1p7XIc/py22f4OMIXEJ2pAVOdc6V2wrB74hDt/VdOQhpFre5TQDepxsSq1ToP1Oejk54VBXRVesgR0VnmfViEHu1N/Hx6mMJsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(31686004)(478600001)(6506007)(6666004)(6512007)(2616005)(53546011)(6486002)(36756003)(31696002)(38100700002)(86362001)(5660300002)(110136005)(4001150100001)(44832011)(7416002)(316002)(66556008)(41300700001)(66476007)(83380400001)(54906003)(2906002)(30864003)(26005)(66946007)(4326008)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U05pdUg1R1NVak9HYnNkL25wQUxFUWxaZXZIVWFFQm5WQTZlcEpPZ3VMVDZN?=
 =?utf-8?B?aXZ0ZVcvdmFXdkRwNkV4TXYvdERKSTNxRGJnV2F4Wno0TWxIeVpzcmJoUEV0?=
 =?utf-8?B?dStTSUVRYjBxckkvb2JzK1dRVWFWall3YzB1WmpNWDRIOG5LcnQzZ0Fkcnho?=
 =?utf-8?B?VUZ0RTVTR2VaVnp2ajREVE91M1F3SVcrVC9Vek0yVTFHYVVwei82YjVDNHFS?=
 =?utf-8?B?S0R0b2EwTUFVZFJqYTYrSWVQNDREaitRRnc4dGtXZjExR3BFQ0VLZDlvZ1Iz?=
 =?utf-8?B?NURJbW1JVzFuVDNsR3hFaUNjMGFBWlVxaE5hamNaYjJOelZ3c1hrdWtZaTQy?=
 =?utf-8?B?ZlMyRDRFbDZhMUluTWZQS0pDeVMwNlBYZzFDM3lKVURiVXFMaHlUVmF4T2Zz?=
 =?utf-8?B?NFUvZWVwY2tHRUJwc0hlS25JTnZQVU4vQUg4cHAzM0hZbGtsc09SdEV3TEpJ?=
 =?utf-8?B?TVlLOWRCb2Z5WnNoNHhuK0c1QjhDcnRwT0F4TVlKZi91MjZXLzN1UTg5ZnJC?=
 =?utf-8?B?Tm12NVZBQzhEeXFWVXhFYlFkcThuMVAyTkxyUVZYR090RjJzbUJCSHlNUnMw?=
 =?utf-8?B?R094SjVSRHAxNUpITytXUzFzWEtvZEVKcFVaTE1tVzdMdFhWcitJbFlmMjFw?=
 =?utf-8?B?WmFZNmVaVGk2WklBck5PbDNjK2NnOFdnczMrNWh2MnZ0Ly9SZ3gyeEh2SHc3?=
 =?utf-8?B?eTlma2hnTThIem5sM1pnay9pVElxVU1WckdxWnhpTDRBR09TU3VKWFl3c0pq?=
 =?utf-8?B?WXRFT3NjcmhmN0FKaU9tRUhhdnQyUDJRVU8wa2hEcUlqOVNydWZpMEFaT1JB?=
 =?utf-8?B?ZXMzV24wejJJRWpqQXBUMk1PTEp5OE5YK21zUHBGOVpRMWFBZUhHR3VRdGl3?=
 =?utf-8?B?QzkyTU1pNnVxTjVOQkd5aG4yQS9DRmZ5MG91OEg3dldrcUphcDNmdlpZNEdI?=
 =?utf-8?B?UkF1YktHczAxbzFoS3BMdXFmYUxzQTRSRjFBTHN6MklHeThJb0dza1hNZ2JH?=
 =?utf-8?B?RE5yL2VDcnAzMW1ua0k4cTg3VXBnbWVabGRGdlJBL1NaVEJWekdNVEtySlZr?=
 =?utf-8?B?K2Fxc1JBRnd4VHdOMzE4MFo0K3pVMkRuY2FpcUd0UFZ3d2dhaEtZZnorTEtQ?=
 =?utf-8?B?RDFWV2FjTjJRNXp1OVdaRFE2NmM1QkdORVZOa3hUak5Ra3JWVWlNMm1KTlZH?=
 =?utf-8?B?NW9mVkZVdGh4WmRpclpmS0hSME84Y0hFQmRsM0hSNlFrUHRJcGs3Ty9PcUUv?=
 =?utf-8?B?cndrTnhZUHB5VFZmNFM4dWxUTTYwaGxEazg1UFRLaC9ycUhhdHdsd0FJNW1w?=
 =?utf-8?B?MXZpM3FSRUloMldTMHZzU2tVUGMxZE1wNEFaQnZHZTdFcnU0d3dka0x3ejND?=
 =?utf-8?B?ejlMTFQ2NFVzRUtjK0lndVJVZHFta2wwSWN4dTJmcVhLN09WVlpRZ3BlbXZ4?=
 =?utf-8?B?ZmFNMFE3RkptYUxtSEFNRXRSWTdmNGYweXpHYUg2WGVPajRuYW5kaW5lV1c2?=
 =?utf-8?B?cmM1S2FhSENMVGIwRytTUHBYUVQyNlBqSjNBL3pMeTd6N0RKZEpJVUJhVHc1?=
 =?utf-8?B?QUt4bW5ROHExY3A4WGlzSlJLVlk2Wlhmd3hvYXFES2c3VXoxdzc5M0ZZV2dY?=
 =?utf-8?B?Rkk3T0x4UmhCazl6Uko5aEwxNlFDU3JrWmY4Yzhhb1NRcHp1VkdWMTBvc2ZE?=
 =?utf-8?B?dVp0R0Y5VUhtaHVBMi90Y1V6U2tZZEdYSXZGb1ZTWG9FN0YrOTUxa1c3UVBC?=
 =?utf-8?B?R0UvZ3FjK1V3aXMyaXNLWDNQdDVlSEZOS1Yzbk1Lc3Y4RVA1czh4b09MRVFs?=
 =?utf-8?B?Y3h3Yi9wQzIydzBxMVhTWWhBckV3NTNQQ0R3OStSc0NoMnJ4bVpmdGFmLzY3?=
 =?utf-8?B?TEdZK2Y3ak1pK1dPQ2ZEZTFTa2Y4NlZTRmtjamlLY3U2TEhhcGh2Qy9xL2JY?=
 =?utf-8?B?TVpadklBNUJmc0Y3bVhXbTByY05xL3NtQ2E3bFhSVS9aVG1tMGNjektibzVG?=
 =?utf-8?B?NUhvb1owTG44RjhVc2xqMjh5elNSYWRjR2Z0cGFPZkVuZVlabHV4ZFlWQyty?=
 =?utf-8?B?Q3AwdEhhekJ5SHo0cFhqU084VVpidDFTUzlBMWhNcHRhSEhmbHdoWTBBUVBT?=
 =?utf-8?Q?GLnzGIn1wmtNQ3smdiGjhmFhY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379905c5-5fa6-4ce4-a138-08dbdfb1e945
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 16:52:22.0099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWeuXB4c+yXMVC7hJb8OuwSeo0zHtAwFtAAm+Hl2MptTY3n6vtngj8RYtjjK3k4rpDWzjjJfcwMdNhAPXJcnVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5418
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
Cc: Aleix Pol <aleixpol@kde.org>, Sasha McIntosh <sashamcintosh@google.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Hector Martin <marcan@marcan.st>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org,
 Victoria Brekenfeld <victoria@system76.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Joshua Ashton <joshua@froggi.es>, Uma Shankar <uma.shankar@intel.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, wayland-devel@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-11-04 19:01, Christopher Braga wrote:
> Just want to loop back to before we branched off deeper into the programming performance talk
> 
> On 10/26/2023 3:25 PM, Alex Goins wrote:
>> On Thu, 26 Oct 2023, Sebastian Wick wrote:
>>
>>> On Thu, Oct 26, 2023 at 11:57:47AM +0300, Pekka Paalanen wrote:
>>>> On Wed, 25 Oct 2023 15:16:08 -0500 (CDT)
>>>> Alex Goins <agoins@nvidia.com> wrote:
>>>>
>>>>> Thank you Harry and all other contributors for your work on this. Responses
>>>>> inline -
>>>>>
>>>>> On Mon, 23 Oct 2023, Pekka Paalanen wrote:
>>>>>
>>>>>> On Fri, 20 Oct 2023 11:23:28 -0400
>>>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>>>
>>>>>>> On 2023-10-20 10:57, Pekka Paalanen wrote:
>>>>>>>> On Fri, 20 Oct 2023 16:22:56 +0200
>>>>>>>> Sebastian Wick <sebastian.wick@redhat.com> wrote:
>>>>>>>>
>>>>>>>>> Thanks for continuing to work on this!
>>>>>>>>>
>>>>>>>>> On Thu, Oct 19, 2023 at 05:21:22PM -0400, Harry Wentland wrote:

snip

>>>>> Actually, the current examples in the proposal don't include a multiplier color
>>>>> op, which might be useful. For AMD as above, but also for NVIDIA as the
>>>>> following issue arises:
>>>>>
>>>>> As discussed further below, the NVIDIA "degamma" LUT performs an implicit fixed
> 
> If possible, let's declare this as two blocks. One that informatively declares the conversion is present, and another for the de-gamma. This will help with block-reuse between vendors.
> 
>>>>> point to FP16 conversion. In that conversion, what fixed point 0xFFFFFFFF maps
>>>>> to in floating point varies depending on the source content. If it's SDR
>>>>> content, we want the max value in FP16 to be 1.0 (80 nits), subject to a
>>>>> potential boost multiplier if we want SDR content to be brighter. If it's HDR PQ
>>>>> content, we want the max value in FP16 to be 125.0 (10,000 nits). My assumption
>>>>> is that this is also what AMD's "HDR Multiplier" stage is used for, is that
>>>>> correct?
>>>>
>>>> It would be against the UAPI design principles to tag content as HDR or
>>>> SDR. What you can do instead is to expose a colorop with a multiplier of
>>>> 1.0 or 125.0 to match your hardware behaviour, then tell your hardware
>>>> that the input is SDR or HDR to get the expected multiplier. You will
>>>> never know what the content actually is, anyway.
>>
>> Right, I didn't mean to suggest that we should tag content as HDR or SDR in the
>> UAPI, just relating to the end result in the pipe, ultimately it would be
>> determined by the multiplier color op.
>>
> 
> A multiplier could work but we would should give OEMs the option to either make it "informative" and fixed by the hardware, or fully configurable. With the Qualcomm pipeline how we absorb FP16 pixel buffers, as well as how we convert them to fixed point data actually has a dependency on the desired de-gamma and gamma processing. So for an example:
> 
> If a source pixel buffer is scRGB encoded FP16 content we would expect input pixel content to be up to 7.5, with the IGC output reaching 125 as in the NVIDIA case. Likewise gamma 2.2 encoded FP16 content would be 0-1 in and 0-1 out.
> 
> So in the Qualcomm case the expectations are fixed depending on the use case.
> 
> It is sounding to me like we would need to be able to declare three things here:
> 1. Value range expectations *into* the de-gamma block. A multiplier wouldn't work here because it would be more of a clipping operation. I guess we would have to add an explicit clamping block as well.
> 2. What the value range expectations  at the *output* of de-gamma processing block. Also covered by using another multiplier block.
> 3. Value range expectations *into* a gamma processing block. This should be covered by declaring a multiplier post-csc, but only assuming CSC output is normalized in the desired value range. A clamping block would be preferable because it describes what happens when it isn't.
> 

What about adding informational input and output range properties
to colorops? I think Intel's PWL definitions had something like
that, but I'd have to take a look at that again. While I'm not
in favor of defining segmented LUTs at the uAPI the input/output
ranges seem to be something of value.

> All this is do-able, but it seems like it would require the definition of multiple color pipelines to expose the different limitations for color block configuration combinations. Additionally, would it be easy for user space to find the right pipeline?
> 

I'm also a little concerned that some of these proposals mean we'd
have to expose an inordinate number of color pipelines and color
pipeline selection becomes difficult and error prone.

snip

>>>> Given that elements like various kinds of look-up tables inherently
>>>> assume that the domain is [0.0, 1.0] (because the it is a table that
>>>> has a beginning and an end, and the usual convention is that the
>>>> beginning is zero and the end is one), I think it is best to stick to
>>>> the [0.0, 1.0] range where possible. If we go out of that range, then
>>>> we have to define how a LUT would apply in a sensible way.
>>
>> In my last reply I mentioned a static (but actually programmable) LUT that is
>> typically used to convert FP16 linear pixels to fixed point PQ before handing
>> them to the scaler and tone mapping operator. You're actually right that it
>> indexes in the fixed point [0.0, 1.0] range for the reasons you describe, but
>> because the input pixels are expected to be FP16 in the [0.0, 125.0] range, it
>> applies a non-programmable 1/125.0 normalization factor first.
>>
>> In this case, you could think of the LUT as indexing on [0.0, 125.0], but as you
>> point out there would need to be some way to describe that. Maybe we actually
>> need a fractional multiplier / divider color op. NVIDIA pipes that include this
>> LUT would need to include a mandatory 1/125.0 factor immediately prior to the
>> LUT, then LUT can continue assuming a range of [0.0, 1.0].
>>
>> Assuming you are using the hardware in a conventional way, specifying a
>> multiplier of 1.0 after the "degamma" LUT would then map to the 80-nit PQ range
>> after the static (but actually programmable) PQ LUT, whereas specifying a
>> multiplier of 125.0 would map to the 10,000-nit PQ range, which is what we want.
>> I guess it's kind of messy, but the effect would be that color ops other than
>> multipliers/dividers would still be in the [0.0, 1.0] domain, and any multiplier
>> that exceeds that range would have to be normalized by a divider before any
>> other color op.
>>
> 
> Hmm. A multiplier would resolve issues when input linear FP16 data that has different ideas on what 1.0 means in regards to nits values (think of Apple's EDR as an example). For a client to go from their definition to hardware definition of 1.0 = x nits, we would need to expose what the pipeline sees as 1.0 though. So in this case the multiplier would be programmable, but the divisor is informational? It seems like the later would have an influence on how the former is programmed.
> 

A programmable multiplier would either need to be backed by a HW block
to perform the operation or require a driver to scale the LUT or matrix
values of an adjacent LUT or matrix block.

snip

>>>>>>
>>>>>> Yeah, this is why we need a definition. I understand "informational" to
>>>>>> not change pixel values in any way. Previously I had some weird idea
>>>>>> that scaling doesn't alter color, but of course it may.
>>>>>
>>>>> On recent hardware, the NVIDIA pre-blending pipeline includes LUTs that do
>>>>> implicit fixed-point to FP16 conversions, and vice versa.
>>>>
>>>> Above, I claimed that the UAPI should be defined in nominal
>>>> floating-point values, but I wonder, would that work? Would we need to
>>>> have explicit colorops for converting from raw pixel data values into
>>>> nominal floating-point in the UAPI?
>>
>> Yeah, I think something like that is needed, or another solution as discussed
>> below. Even if we define the UAPI in terms of floating point, the actual
>> underlying pixel format needs to match the expectations of each stage as it
>> flows through the pipe.
>>
> 
> Strongly agree on this. Pixel format and block relationships definitely exist.
> 

Interesting to see this isn't just an AMD thing. :)

snip

>>>>
>>>> Both blending and scaling are fundamentally the same operation: you
>>>> have two or more source colors (pixels), and you want to compute a
>>>> weighted average of them following what happens in nature, that is,
>>>> physics, as that is what humans are used to.
>>>>
>>>> Both blending and scaling will suffer from the same problems if the
>>>> operation is performed on not light-linear values. The result of the
>>>> weighted average does not correspond to physics.
>>>>
>>>> The problem may be hard to observe with natural imagery, but Josh's
>>>> example shows it very clearly. Maybe that effect is sometimes useful
>>>> for some imagery in some use cases, but it is still an accidental
>>>> side-effect. You might get even better results if you don't rely on
>>>> accidental side-effects but design a separate operation for the exact
>>>> goal you have.
>>>>
>>>> Mind, by scaling we mean changing image size. Not scaling color values.
>>>>
>>
>> Fair enough, but it might not always be a choice given the hardware.
>>
> 
> Agreeing with Alex here. I get there is some debate over the best way to do this, but I think it is best to leave it up to the driver to declare how that is done.

Same.

snip

>>>>
>>>> What I was left puzzled about after the XDC workshop is that is it
>>>> possible to pre-load configurations in the background (slow), and then
>>>> quickly switch between them? Hardware-wise I mean.
>>
>> This works fine for our "fast" LUTs, you just point them to a surface in video
>> memory and they flip to it. You could keep multiple surfaces around and flip
>> between them without having to reprogram them in software. We can easily do that
>> with enumerated curves, populating them when the driver initializes instead of
>> waiting for the client to request them. You can even point multiple hardware
>> LUTs to the same video memory surface, if they need the same curve.
>>
>>>
>>> We could define that pipelines with a lower ID are to be preferred over
>>> higher IDs.
>>
>> Sure, but this isn't just an issue with a pipeline as a whole, but the
>> individual elements within it and how to use them in a given context.
>>
>>>
>>> The issue is that if programming a pipeline becomes too slow to be
>>> useful it probably should just not be made available to user space.
>>
>> It's not that programming the pipeline is overall too slow. The LUTs we have
>> that are relatively slow to program are meant to be set infrequently, or even
>> just once, to allow the scaler and tone mapping operator to operate in fixed
>> point PQ space. You might still want the tone mapper, so you would choose a
>> pipeline that includes them, but when it comes to e.g. animating a night light,
>> you would want to choose a different LUT for that purpose.
>>
>>>
>>> The prepare-commit idea for blob properties would help to make the
>>> pipelines usable again, but until then it's probably a good idea to just
>>> not expose those pipelines.
>>
>> The prepare-commit idea actually wouldn't work for these LUTs, because they are
>> programmed using methods instead of pointing them to a surface. I'm actually not
>> sure how slow it actually is, would need to benchmark it. I think not exposing
>> them at all would be overkill, since it would mean you can't use the preblending
>> scaler or tonemapper, and animation isn't necessary for that.
>>
>> The AMD 3DLUT is another example of a LUT that is slow to update, and it would
>> obviously be a major loss if that wasn't exposed. There just needs to be some
>> way for clients to know if they are going to kill performance by trying to
>> change it every frame.
>>
>> Thanks,
>> Alex
>>
> 
> To clarify, what are we defining as slow to update here? Something we aren't able to update within a frame (let's say at a low frame rate such as 30 fps for discussion's sake)? A block that requires a programming sequence of disable + program + enable to update? Defining performance seems like it can get murky if we start to consider frame concurrent updates among multiple color blocks as well.
> 

I think any definition for slow would need to be imprecise on some level.
In the AMD 3DLUT case we can take around 8 ms. Some compositors need the
programming time to be well under 1 ms, even for low frame rates. Those
compositors might want to know if an operation might be undesirable if
they care about latency. I'm not sure we could reliably indicate more.

Harry

> Thanks,
> Christopher
> 
>>>
>>>>
>>>>
>>>> Thanks,
>>>> pq
>>>
>>>

