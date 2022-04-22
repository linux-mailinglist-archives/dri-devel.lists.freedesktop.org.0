Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF00150BDD9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 19:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5350E10E55C;
	Fri, 22 Apr 2022 17:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F6D10E31B;
 Fri, 22 Apr 2022 17:04:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aE9cJSOs1RkVx3mNoJAYgiHIGuJGg/QQf3L0oaoswHxTyPBRemn3wjBRTKwL3HpY+YonHzvz4kR4/+IRdxYaTZYYWcDz2FxR8z50DMtbYYIifRPVycHL0wpkS0KGqEaIcc87yzSCOZaYJ1niuDTulsp9jaar+2F+SWxQLveX5rNcQu4Fk5nyEFQJCmYzhkHln9LB4vgG3jwvd+INAI44yRxSApl1IiO84HP8+xwkKYr1gdCKnX5bqZjNuGHlx0hMaAAJxUBgf7f3r76Pv09cJ+ncUYZCh9mSllQOwOpF+Zn9nTAZg6XwqMSLBfAlbybZQcJ9eS4IvxmoiTnQwx+Bnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJuhlSQVbxbytdYPMtMRqBup0N7szCqk833rLFJezQE=;
 b=aDh4rc+Hrgy6r0nncDINhsz6L0rpS2kcPduzMIVSK8DLQG2VmZaQhv3do4P+eOoNKjZxgpNDTllZX+9M1eBtX8MoW1a7xtONPxQWfU44Uw0ZqnOd1Wb2k98LSxfBK2lJWCb7iYinlDiOE+TFF029Bjm7lOVHYEcKOM4+ZuycJOakZP8bjQDtxIz8kPnRtjdjxtBLeFxkrCj3nP3FqQb/YoiXa1ojvYwXseciSuPoRGwEWcXZEOgwQIQtxuaH9QPXQKVKpBo8oi3yTnUVAZrHOA4KfAu2p/LtMizgc8vkua5RQQLvfHebEaGs0tGkWdgYSjg8Gs7sVpbNOD/0UNGaeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJuhlSQVbxbytdYPMtMRqBup0N7szCqk833rLFJezQE=;
 b=oy/6mbzcKFx0M7Hmk1KvfCbn6OBFlIkgRGTiWI0XsadK7oCohotPYvaZ20aWcrVZhsLModTKZ9g5vn/PCRPOkAVnyM7TguqlzP4lTSTErWcfOh/etbtFIc2+OY1EUakReYxw8nhtnGMI+HvCnmJfDaO5oOueQEsAQnV6NeCatik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL1PR12MB5093.namprd12.prod.outlook.com (2603:10b6:208:309::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Fri, 22 Apr
 2022 17:04:34 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3c53:b805:4206:6620]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3c53:b805:4206:6620%9]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 17:04:34 +0000
Message-ID: <349e170a-9121-900d-88b3-87eb9a7d2cd5@amd.com>
Date: Fri, 22 Apr 2022 13:04:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: AMD display drivers handling DRM CRTC color mgmt props
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20220421143747.247mohbio436ivqo@mail.igalia.com>
 <06891dd7-b2f4-ece6-b1a5-b9ad15f5f899@amd.com>
 <20220421191945.yn4plwv757jlri2n@mail.igalia.com>
 <b94504d9-4d19-5663-f67d-7b1376827335@amd.com>
 <20220422142811.dm6vtk6v64jcwydk@mail.igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220422142811.dm6vtk6v64jcwydk@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::18) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e605c7a2-dfcf-4054-0e52-08da24822ca0
X-MS-TrafficTypeDiagnostic: BL1PR12MB5093:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5093B76AA1E506437148B6C38CF79@BL1PR12MB5093.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4rtjwfu2oyede4muc6ZSbIJj8+2OYjt3sUjy5OJlEwTRFN74uQGD5X4970Svx++WvKchAPSswcTIPaOiJhXw+da+uQL+4FwGvugUv6ylVmSV7qtSKd6brIQVQ0oXVjBfRBOA+JuSyipbtQUl18MILDdKYfMaLaFGIM8MZdaShERyr1PQmUCL3Q36AHTFWunXZfbBxtaRG3k+Hy+gUe9RlHY69y0F8kWh4F0oJ/37VqeJoh7NoWzE9o+Y2ZMvwdNf/Md0Io4E+FPO3ByvSkzDfw45XUrLxZrKypCLCG/hkbf0kgG+TGJGbXyda5AuVnNlUfugVnVEHeeSJ1AIy0f0P9ndTo3p9x9Q/NFWHyhygDWKJM5kpLnBs9tJKVcEAwNddqP5Ulo/8enkOFa3rwXpXpzKUJAeVEbkPtlUcqX+1DUe+GNgGDxnu2oJx+IgOo1evtdFei4iN/eLY2pMvCukuaYcAL++JBXGQkZbNwg+AFpUl4ct3RHiunVu8drMGZmTmBu7c4PVCRy3MaQm8z7JbKxvxREHtXOesMOSe00zxKvLqPSsEo4f4VMXRFHjG4DWutu+RLYApvB2L22F7+S8F9m4AEXiRURIZOmahqsQ/j8rAGs+OlDUrxmS+YhDyRCJQURuVlOpYdQHU1AZ1oRtmPzxbMWa9SNalKQuXb4FFaVVA5aPX3Lt3lW0WA6YiMbLhMaLf+JX7ATioscb7BKvsjSSi3DsVqG3/fHRtYoK56/hXfOS6mELZ8aoKXmpR/klMEJDbpguQ2MFegoeFNtpemB8LzNVhLLAPEkwYZHbYFLOH+1cLcGAFGhEHsUXaIzwFmsKkgiqpJlKGm+6KlxwBJ7gYrLtzQw/3SQeEj1UszM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(6916009)(316002)(966005)(6666004)(66946007)(508600001)(83380400001)(4326008)(8936002)(5660300002)(86362001)(6506007)(6512007)(53546011)(36756003)(38100700002)(26005)(31686004)(2616005)(66476007)(6486002)(8676002)(66556008)(2906002)(186003)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zlp4Zk1qSm5vUzd6Nm1rSmZ4b210elQ1SmpnVklGRTRReUNXNkU1VXRXbHdJ?=
 =?utf-8?B?aGlQdE80Tmd1ZzlsUFlRZzhUUVZrS1B5aHgzNTBwUUdZWE5oVnNBRzd4a1dl?=
 =?utf-8?B?WW9JZGVpdExrMmRSUE5BNk9qWVpkbG9xMnJkNGFadXFDcTAyODZpT1Y0TG5X?=
 =?utf-8?B?Q01UVVpsUU5neTJqTnk4L1pUNEJiS05LTmRQck44UEVzTkMwV0dZK21BWDR2?=
 =?utf-8?B?em01N0VuWjlvcUlTSGFCV0xsNDVJNUZtV3Z6VFNtdlI5UUo4WE8rYVJzeU5Q?=
 =?utf-8?B?SnFEaFNJeEFzRzlFTnlLdm9JZDlkTWhSSFMvNDVNeEdJN2E4NWRSQkw5di9L?=
 =?utf-8?B?ekIvWnhETTQzMUtxUXc4aEc5Z1pIMXVrL1R3NElPWEppMzFtVGJ1ZGFETEEw?=
 =?utf-8?B?K2dXMHpYbFhYZXI1aEc3czRvWTB3Z1lMd0sxR0VRUDU2aW5tRlIvV0J3dmRz?=
 =?utf-8?B?Z2dBRU1NblhqbDBqdUhnTFdtbGFzQ3g0SWRTQlRJZHVnd3BhWlBDeC95OStP?=
 =?utf-8?B?OURrZ1dHWHZKbXVIeHJpYkI1aUZvRUU3QmI3ZmtGb3BqRksvTlJkclhERU4v?=
 =?utf-8?B?Y29yRS85dERjRlJPYkdnbG1YUU1hd2ZULy9NUXJrelAxNDlsZENXQzlLclNj?=
 =?utf-8?B?anFCVzFYRkNLcEUrZmNieFBXdW9OVXU2MUMvVVlRNExoMW9OYXk5SmpISjNU?=
 =?utf-8?B?UUZvWVBOTmQyTjc0cGYxandudDVlaGsveDZYVjNhRHg4MWx5NG5OalRSWDUz?=
 =?utf-8?B?S0xPaVNUTlBkeDQ5NDJubzBDL2ZtQnlKNzYrMHA5Zjc2UWUrQmEwby9BZUFt?=
 =?utf-8?B?S1BLN2Yxbm03NWhQQms5OVBkdDZaSHZhc096MEFaaC9qNUZVM0NRbDVIek9D?=
 =?utf-8?B?amFTbThkQ0hjN2tEc0FPNUQ5cHFyUUQzcnlTQnlSRkpvTGhjRUNNMGVub2RP?=
 =?utf-8?B?enF0VU4ydGxZaHNDZUVBWWZDa3QzeSthV0xXK0ZzamxqTWE4MmlQMnhEcTlk?=
 =?utf-8?B?dHRQNGZraThpWWtaNDFZeXEvWkgwQVE0QnRFNU4vVWhKQ21hcktaeDNseG1Q?=
 =?utf-8?B?SzY1alpMTUtTbEttR0JJSE1oeGxJdnU5M0Z4cEhsLzM2Y2JGamQvcFVaZktS?=
 =?utf-8?B?VHVzSEZ3MDdpUTRWR1V0WDVzelpKTjlDWm8vRkwzRWJpOXZwaWZZZUtnMVJq?=
 =?utf-8?B?TnFRSXNXRXdwT3FUamhwTm1LbC9QWlU5Z3hwcGlDQk5Td3VkNnJLMEZJWERN?=
 =?utf-8?B?NVF4em5wMjNwSmtkTEsrdWhzSnRZWmRRdVdQSDQvRTdFMno1MmNjQmhhNWVq?=
 =?utf-8?B?bi9sNm9vaDVRMVM5OTlkQUg1OG45VlBCUUhBT1Y4Wjh4eUdsaFlvZTFXbSs5?=
 =?utf-8?B?UVFycHI3V1ZtZHJzSy9hUGJGUGE0WWxGQVVxdnN3alBpTlQvSk5mWnZ4L29j?=
 =?utf-8?B?cldsbWx6dExHd05YeWYyNmNvUXB2eG5jcnltU0hVUmZCWlJkZU4xanFWUGUx?=
 =?utf-8?B?bi9nV3hWazJLZThyS0xiOTNYa0VoTW1IcXdNczVTYjd4QmgxY1F0cGxUV2xJ?=
 =?utf-8?B?SkI3WkNZLzFTVldncGpBdXV2TEZsYTlvQ2MzK01Halk4bkZ6QTc1ZzFmRVhS?=
 =?utf-8?B?R3puUnloV05qemEvRkhXZkt2eXlFTFk3T2ZoVTUvSEZxb1hXS1Z3MXZxRk5x?=
 =?utf-8?B?MWJPWk83elRZdmpXV3BxRnRLTWFlWVk0cE5XQVFrVzVSb3Y0QXdPQ3pqdk1q?=
 =?utf-8?B?M0kvVVBXTTJiNGQ2MmJxY1dudHRqVE1jZnRZb1cwYUplVUlsS00ya0t0T1Vu?=
 =?utf-8?B?RVQzN2dTSXhSakFrU1BRakR2UDFnRXF5WlFnZzdiVFpacUlWWUFKMzQvNWhh?=
 =?utf-8?B?UCs3NnEvR25INkRtTzBuVUxGYmd3MXREYWdLZjE0cWJSUE1wSXd3V243Tk8y?=
 =?utf-8?B?NWJKS0NGUUczbTgzVnpmNjMydXZGVWJmb3IxOGF6aUhyY1lldFhXNzd2MlhI?=
 =?utf-8?B?VVhtNHBqenc3OXppY0dZdzhtcXQ5TFF5RmUvWWl1L0ZHbzJFcmE0Nkd5Y3Av?=
 =?utf-8?B?UVJlSUczU3MyL3BuYTA5dnNleXZtWVY1K0pDSk9MQndWbTRERFNwZHBlTFRs?=
 =?utf-8?B?a3hZT2lPOVR3ZnZuaEFCcFdpNWgzVXM0a0NzUXlXMUxia2pPTmRoS2RXazZN?=
 =?utf-8?B?bTNSUnhlb1JlL3EzenF1R1NOd0JGcDBrSGlFMUZtQmxua2ZZWHkvWGpnMVhT?=
 =?utf-8?B?bXkveDNjcFExTmc1MGFYZmtJa3RESldoZ25PeEpwMEFRa3BFNnBVK2JsRWdu?=
 =?utf-8?B?MWNLc01SWVQwWFVqNUgveWtsRlJwN2NkcHgxN2t6K09YTmRZYldmZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e605c7a2-dfcf-4054-0e52-08da24822ca0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 17:04:34.2350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: odM6aXn5XzOxQWwHqBazlunlCA6yaQ9alG7XBvupZ6uq/Gf80FDtrJX91bL9xBDpgbWRjznsVIUqmiOqS3T3fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5093
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
Cc: Rodrigo.Siqueira@amd.com, dri-devel@lists.freedesktop.org,
 Nicholas.Kazlauskas@amd.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com, Bhawanpreet.Lakha@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-04-22 10:28, Melissa Wen wrote:
> On 04/21, Harry Wentland wrote:
>>
>>
>> On 2022-04-21 15:20, Melissa Wen wrote:
>>> On 04/21, Harry Wentland wrote:
>>>>
>>>>
>>>> On 2022-04-21 10:37, Melissa Wen wrote:
>>>>> Hi all,
>>>>>
>>>>> I'm examining how DRM color management properties (degamma, ctm, gamma)
>>>>> are applied to AMD display drivers. As far I could understand thanks
>>>>> Nicholas documentation on amdgpu_dm/amdgpu_dm_color, DC drivers have
>>>>> per-plane color correction features:
>>>>>
>>> Hi Harry,
>>>
>>> Wow, thanks so much for all details!
>>>>
>>>> DC programs some of the color correction features pre-blending but
>>>> DRM/KMS has not per-plane color correction properties.
>>>>
>>>> See this series from Uma Shankar for an RFC on how to introduce those
>>>> properties for 1D LUTs and CSC matrix:
>>>> https://patchwork.freedesktop.org/series/90826/
>>>>
>>>> Bhanuprakash has a series of IGT tests for these properties:
>>>> https://patchwork.freedesktop.org/series/96895/
>>>>
>>>> I've rebased these on amd-staging-drm-next and maintain a kernel and IGT
>>>> branch with these patches:
>>>> https://gitlab.freedesktop.org/hwentland/linux/-/tree/color-and-hdr
>>>> https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/color-and-hdr
>>>>
>>>> We've had many discussions with Weston guys on this. In order to merge the
>>>> kernel properties we need a canonical userspace implementation that are
>>>> using it. Weston guys are working towards that but if you want to suggest a
>>>> different userspace to serve as that vehicle I'd be all ears. :)
>>>>
>>>> Note that in order to show this all working we also need a Wayland Protocol
>>>> update.
>>>>
>>>> See
>>>> https://gitlab.freedesktop.org/pq/color-and-hdr
>>>> https://gitlab.freedesktop.org/swick/wayland-protocols
>>>> https://gitlab.freedesktop.org/wayland/weston/-/issues/467
>>>
>>> So, I've followed these discussions (until the issue on naming) because
>>> initially I considered it addresses our current goals for color
>>> correction. But after some discussions, what we are targeting is a 3D
>>> LUT after blending (per-CRTC). I found past proposals on dri-devel
>>> [1][2] to extend the DRM CRTC color management properties, but they
>>> didn't move forward and were never applied.
>>>
>>
>> They're stuck in limbo until we have an upstream userspace
>> implementation that's making use of them.
> 
> Yes... afaiu, the basic requirements for all of these changes are IGT
> tests + open userspace usage, right?
> 

Correct. See [1] and [2].

[1] https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#requirements
[2] 
https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-userspace-requirements

>>
>>>>
>>>>> * - Input gamma LUT (de-normalized)
>>>>> * - Input CSC (normalized)
>>>>> * - Surface degamma LUT (normalized)
>>>>> * - Surface CSC (normalized)
>>>>> * - Surface regamma LUT (normalized)
>>>>> * - Output CSC (normalized)
>>>>> so DM is "adapting" those DRM per-CRTC properties to fit into three of
>>>>> these color correction stages, which I guess are the surface stages:
>>>>>
>>>>> * - Surface degamma LUT (normalized)
>>>>> * - Surface CSC (normalized)
>>>>> * - Surface regamma LUT (normalized)
>>>>>
>>>>> I'm trying to understand what this mapping is doing. A comment mentions
>>>>> that is not possible to do these color corrections after blending, so,
>>>>> the same color correction pipe is performed on every plane before
>>>>> blending?  (is the surface the plane?) Does this adaptation affect the
>>>>> expected output?  Moreover, is there something that I misunderstood? :)
>>>>>
>>>>
>>>> What's possible to do before and after blending has changed quite a bit
>>>> between DCN generations. We program the CRTC Gamma and CTM after blending.
>>>> See attached picture for a view relating the color bits between the DRM
>>>> interface, DC interface and DCN 3.0 HW blocks.
>>>
>>> This picture is really enlightening, thanks!
>>> You said it changes between generations, therefore, I can't consider the
>>> DCN 2.x family follow the same mapping, right? If so, can you share the
>>> main differences for a DCN 2.x regarding per-CRTC properties?
>>>
>>
>> See attached diagram for DCN 2.0.
> 
> Thanks again!
> 
>>
>>>>
>>>>> That said, if the DRM color mgmt supports per-CRTC 3D LUT as the last
>>>>
>>>> Where do you see 3D LUT support in DRM? Is there a new proposal that I've
>>>> missed?
>>>
>>> So, it's exactly what I aim to work: a proposal to add 3D LUT to the
>>> current range of DRM per-CRTC color properties. But I also need to
>>> understand how this property will be mapped to AMD display once it
>>> exists in the DRM framework.
>>>
>>
>> Ah, nice to see. :)
>>
>>> One of the things that caught my attention after seeing the attached
>>> picture is the position of 3D LUT. I was expecting to see the 3D LUT
>>> correction after gamma correction. Is this position a particularity of
>>> DCN 3.0 (that varies between hw) or was I expecting a wrong color
>>> correction pipeline at all?
>>>
>>
>> Before DCN 3.0 there was no 3D LUT after blending.
>>
> By comparing these diagrams, I'm curious: in case we have a per-CRTC 3D
> LUT support on DRM, DCN 2.0 generations would initially map this
> property as a pre-blending property on DPP (currently the same approach
> for CTM, for example), right? But after we also have a per-plane color
> management property, those per-CRTC property would be ignored? And how
> about degamma for both generations? No problem if there isn't an answer
> yet (many if's), but it may help me to think of a more generic solution.
> 

We'll need to define what the expectations are for the API 
implementations in DRM drivers, as well as for the implementing userspace.

The way I think about this it might make sense to introduce a 3D LUT on 
a drm_plane, as well as on drm_crtc and a driver exposes whatever HW 
supports. Userspace can then figure out what it can use based on driver 
support.

It should be possible to use pre-blending 3D LUTs to accomplish the same 
as a post-blending 3D LUT, but we might need the ability to linearize 
before blending, but after applying the 3D LUT, and de-linearize after 
blending again. Something like this:

3dlut > linearize (1dlut) > blend > de-linearize (1dlut) > output

Instead of this for the post-blending 3dlut:

linearize (1dlut) > blend > de-linearize (1dlut) > 3dlut > output

Though it depends a bit on the color model in the compositor or 
rendering app.

>> Note in the diagram that our HW (and DC interface) have a Shaper LUT
>> available before the 3D LUT. You could expose if you want to shape your
>> content post-blending before applying the 3D LUT.
>>
>> The 3D LUT is most effective when it's in non-linear space. Currently
>> DRM has no way to specify a way for drm_plane to be linearized (see notes
>> (1) and (2)) so it is assumed that you're blending in non-linear space and
>> therefore your pixels would already be non-linear going into your 3D LUT.
>>
>> (1) unless you use the drm_plane PWL API that was proposed
>> (2) amdgpu_dm is currently setting the drm_crtc degamma LUT on the
>>      DC plane. This might lead to unexpected behavior when using
>>      multiple planes (though I believe gamescope is making use of
>>      this behavior).
> 
> Thanks for raising these points. In fact, I was considering unexpected
> behavior when I saw this DRM <-> DC mapping. >>
>> Have you looked at [1] yet? It might provide a good example on how to
>> define a 3D LUT. For AMD HW you'll want a 17x17x17 LUT.
>>
>> [1] http://intel.github.io/libva/structVAProcFilterParameterBuffer3DLUT.html
> 
> Not yet, but it seems helpful. I'll take as a reference... until now,
> I've only examined details on DC drivers.
> 

Sounds great.

Harry

> Thanks,
> 
> Melissa
> 
>>
>> Harry
>>
>>> Melissa
>>>
>>> [1] https://lore.kernel.org/all/20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com/
>>> [2] https://github.com/vsyrjala/linux/commit/4d28e8ddf2a076f30f9e5bdc17cbb4656fe23e69
>>>>
>>>> I'm thinking of putting a 3D LUT proposal together but haven't gotten around
>>>> to it yet. We'll want a pre-blending 3D LUT, and possible a programmable
>>>> post-blending one as well.
>>>>
>>>> Thanks,
>>>> Harry
>>>>
>>>>> step of color correction, I don't see how to accommodate it in the
>>>>> mapping above, but I see DC already supports programming 3D LUT on DPP.
>>>>> Once DRM has the 3D LUT interface and DM mapped it as a DPP property,
>>>>> the 3D LUT will be at the end of the color correction pipeline? Is there
>>>>> anything I need to worry about mapping DRM 3D LUT support? Or any
>>>>> advice?
>>>>>
>>>>> Thanks in advance,
>>>>>
>>>>> Melissa
>>>
>>>
> 
> 
