Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D02B3F511D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 21:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C4889A59;
	Mon, 23 Aug 2021 19:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 33148 seconds by postgrey-1.36 at gabe;
 Mon, 23 Aug 2021 19:16:40 UTC
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (unknown
 [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AC689A59
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 19:16:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3toI6lgyJfvN94Rz0pItpk4K5Kfu3sv1lypZVOuWMvukQiJ+8ry3ufdaTEBKX8vXZ2FoK8PTPXgc/kBq0nWBMC6ENgstVLvAfbG+Ds4eHqAYG8jF2Xq4zGuLCK4owb2FFEd6OOba9lHXvoct6c/LNkrQ7+OZhabnYQ336s9fyG4m7n7xiKOC7WGRKoOH3ifMz73Cu4AuqZX2eycpHLWT0tDBYrYvLpJQ+HWqtBTEmLfXCg54Tznt5ZRx9FC2Rp1wlSpuqb6K9JhQdP7zYZXrdWRV6+VfOqPMd7sVMLvP7QXGzcXG6ITSJe2D78xCGk4YrJOIjjRZ46tfo2ixMRxQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIVcik9WXTkRujmEkyU0dHyklU390RjK4sBgCWHusa8=;
 b=LMwxhOZ8+g2AYxRuU7TGx2kTPTlB8/dwhrL8/G5tw+iRcR4dtOEgMYUykfH7zBWIITDF1GyTA87QglLA/9ljOVUbWBzIBzybsO7qB14qwVqBZGkPuIGTcu+l3mWoJafyjkJ3n6ktKDXW19Q2hNlDoxqrxVglwc82BMaG/TkcHhGL3irH78IKqsP0j7UQKL4bdPAP4QuzsqB0vxFRAgghIv0t3TJ7/GdNEsZ811prN0Sgc5WwztOgSTqQTbWW4z9AumOIMBvdiH1pnG8ZaIxcTQvmSNV3u1GsvSh9fB8XspeyUQAlWZZb9Fv8CXnM0i6jLA7Lp9TkexED/pSCS6WS4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIVcik9WXTkRujmEkyU0dHyklU390RjK4sBgCWHusa8=;
 b=Q6W+ZLkf3UTl/SnvUAtfHAD20VQS3KZe2t5Mq48bq95BjP3VzOYHm8g4hhuBjYlQW4TZmip3rybu4jVTH06ZMNVbiD4xSYzjZtLoo9JO6l+11AZPJF3YKw8GirZt6zKQ3jZePPI205ykiLDJpiVe8ldM6Kv/oWbqJZlNfNY/aog=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4781.namprd12.prod.outlook.com (2603:10b6:208:38::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Mon, 23 Aug
 2021 19:01:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 19:01:39 +0000
Subject: Re: [PATCH] drm/amd/pm: And destination bounds checking to struct copy
To: Kees Cook <keescook@chromium.org>, Lijo Lazar <lijo.lazar@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Feifei Xu <Feifei.Xu@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Jiawei Gu <Jiawei.Gu@amd.com>, Evan Quan <evan.quan@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <luben.tuikov@amd.com>, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Dennis Li <Dennis.Li@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 Jonathan Kim <jonathan.kim@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 David M Nieto <David.Nieto@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Lee Jones <lee.jones@linaro.org>, John Clements <John.Clements@amd.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20210819201441.3545027-1-keescook@chromium.org>
 <4922d89d-1293-7b32-d684-c731c246e6c1@amd.com>
 <FB2A077F-78CB-4D84-A8F2-C63C57923496@chromium.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <07a77a6c-f754-c676-5063-72ad418351d5@amd.com>
Date: Mon, 23 Aug 2021 21:01:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <FB2A077F-78CB-4D84-A8F2-C63C57923496@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR1PR01CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7fec:37fc:e924:4b3]
 (2a02:908:1252:fb60:7fec:37fc:e924:4b3) by
 PR1PR01CA0011.eurprd01.prod.exchangelabs.com (2603:10a6:102::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 19:01:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5df959a4-0f7f-4949-8c2f-08d966686fbd
X-MS-TrafficTypeDiagnostic: MN2PR12MB4781:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4781BB092CC9FA11B720C89083C49@MN2PR12MB4781.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PDzlX9ka+3uodRQuMGQSG3Gr7PBhhWoURxGJBe+kg/Yh+dKl7G3q5nzOgM6BP5LBaAMU0TGftdbHNdBiv+Jq4VpSYcvV9jhF2uC1S08T5Z3gPWETxWLRmfeeEmdqaK9Er/jYrfc8SoYtE0UPrGgByfFw/E8/QYNwshRH04LUtfqK5UW02R/G3B5zTpHZ3tP6aeYKFDHZyG6viAvPhVcNIhUqqko+IQy63C0y5NkUjUjvGjIzeZf7M2Z3cAM/kBJQvWAfBxuyCVYeepMG8PZGQsddUlp+5/MZ5EZQBXoUJAL4dD5yYVXxdkyl72xhleizbLEg3Bsfv9/pw1YkpvUDZmbORzsPBRBpLZ5+mPXDctYyw4L3/qBGQ4Olww6MkE80KwxzUUS30Kv875en9gvUMl/KL+jgG0BDsOLKwFn4JRIf6GIuR1cVH5NyXdYsclXDNAwRbGDSLF5S1QMQiel1Gtok35ibPR0LKJgcgrmK1uMB1PKMLxAUJ1c1ne4sAlIQkNYKAJZYbbax+2bG0Uq9xmRwCn3bd8Ft/6kFYXyxIvQx0Lp76f+HKGQ4pFrMdmDLWwgNqyudHHTD/fyvoka2BDtDppSoJHKaWG2n2jCrjC91ltgqb9cbe0E/MrGtoWmCU/ZayzLs5uCy2H3K9nqvwKF3vvcI0H/cHox1ZKfO38+gn7Kkbru4c0kITqR+ceCjHRdzUEfzK7G/LrMKMRm3sA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(316002)(5660300002)(6666004)(478600001)(6636002)(83380400001)(66946007)(66556008)(54906003)(110136005)(36756003)(186003)(31686004)(86362001)(2906002)(8676002)(4326008)(8936002)(6486002)(38100700002)(2616005)(66476007)(31696002)(66574015)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N04waEZZZCs0cWlneWJReTZOQ1lqZDQ2VjdSYm1HQ1F0TEZ2UXAyMndiUUU0?=
 =?utf-8?B?TXZsRUZUOWxCcFM4aGliZjdzV1Ziay95YjZzdzdQMXVqZVYvWjNsaTg2eXFu?=
 =?utf-8?B?blNxTEk5czhGQXYwQXdQdW0ySWxKNHFPcGlCanVDTEhGUUxVZVFXOTRqM1pu?=
 =?utf-8?B?N01pM2lCZDJ2ZWh0Um9tRHJ4MWRZd1JQWTZjQnVmcTFELzJWVDFkZjlPanUx?=
 =?utf-8?B?d2pjeWMxOWNEUmFITzgrcEFMNXBBR3hQTk9NK3hJa2JRRWd1bHQxV1VDU0N0?=
 =?utf-8?B?WXF6VDVXUm1rUWUxK3VVWHp1VVR4cVhoRng2NHpzYUs4eElRWml2aEo1TnVJ?=
 =?utf-8?B?QVovYVI2ak9YWC81SjNjSEpucy9hWEE3bFRqTXdGL1dGTnd4SERsUkZhVjBS?=
 =?utf-8?B?cXBJNjgxQjcwZ0NTakNjN1lTazRFVGw1Rk1jRUY1NkFBWFhQZWJSLys3M2Vl?=
 =?utf-8?B?UGVLRFl6cFV5Rnk2UE81RFVzMW1jM0xJZzZVdWJrbDFMaE84N1ljYkVPdDdo?=
 =?utf-8?B?b2RKTFprRXlWUm1iMEZHTnhCckF5TDNERTBpSDBXOHRmR3VhdU5nVHdzL1Nr?=
 =?utf-8?B?QUp5cWhvT3pjcFprRG5QR3V2UmNvZ3V6V0VUVWlEM3MzQ2YrOFZLMitYMHlk?=
 =?utf-8?B?dmM4OE1ZaWpJQjN2K3NDcjY5WnE0MWZHelNRK0hMOHlsV3hSUVkrU2kyOEI4?=
 =?utf-8?B?OVh2MkFCQW5UYU5UYU9UQ2JYUFFYKzRLc2t6K3R0SWRPa1NZdzY2U2pybGpl?=
 =?utf-8?B?YXU0OTlTL2hpZ3NyZXhVSmlxS1dFOFordlRqTlM0S2RuTHlLeWxLdUsxUElE?=
 =?utf-8?B?djk0STFBbWxaV2JRYTFHMHNMWjNNS0ZtNC9FNUlPU2VhYUxXZkJ1dHl4eGFh?=
 =?utf-8?B?VHVTLzBZcmRpNmNqbndVb21YS3hqbXllTU1uQ2s4UUxYajZTQ1ZidjNmVm5s?=
 =?utf-8?B?VWsycCtDYXcvRXRsZ3FsK3E5S1I5NUZuMmQzU0R3M1dJQ0hVZmlmanRNQW8w?=
 =?utf-8?B?UEFPL3RMMnJKeFJOVFF5UUNnREhRNGhyek5MNkRtYzAyNjNPTVNkaWRxT0lm?=
 =?utf-8?B?S2s3MTB1cjMyMXUvUVVINGE3bjFYdXRXeFdWYlNCaFJ3aFgrOHFxbVJHa1pK?=
 =?utf-8?B?aFhDTDNEcGNEL1BidzhUd3pGdDlzNjN0WDZySE5yRmsxS0ZBWnRzRVBGS3Vy?=
 =?utf-8?B?Z1hkUkl1KzEvOTRrNFJpQ2FNYW5nQlh3M05oa1o1bCtoZHlYV1gvbDRDak1Z?=
 =?utf-8?B?b3NtVzVhTTZlZEtDY0FWb0IweXErelVleGtqRzhNK1MreElkaEZiOGV3WFVZ?=
 =?utf-8?B?NURmcXNHV1FnbU9xL25jUDU3Qnd5VFQvVlZTMnlHZ0xvVDZsaWxWUTR2S1Yz?=
 =?utf-8?B?U0Z6dElnRmpNVzdkRE9jenozOHh1cnE2NHN1SmFzZDEwMi9BTW9XS1k5dnRH?=
 =?utf-8?B?aWJkdVh6dE1qRUR1MEtKTUwyaFJ5QWtqUE1rVFcxTnR6QTRiWFRxaktGZjFD?=
 =?utf-8?B?dE5BM2VsTlF2ZEE0eGVyRkIwUHlqNzUxc2VPbml5NE5ndGoxcUNYcjBObk11?=
 =?utf-8?B?YnNwb3g1Q2liVnZ5UG9uMWZUWWo5YzlUZ01FL1p6NDR1N3ZBOVYxTXMvM2Fo?=
 =?utf-8?B?dzQ1L1pEMXNNaUx2a29EdUZYRENtcUtqY2k3cFhNWGp2WmxJcWZkOFhJbmdJ?=
 =?utf-8?B?M1JlZENHZ0NYU3A5dnlFZ20xcmt0M05MajdwSWdqN0NPTjc3M0tOeVdqMUZh?=
 =?utf-8?B?RjU1ZkNZSGxHZi90c3MrTWQwaHF3d2YzNnpWL0pEeEZNcVNKS0lOQXozaEdN?=
 =?utf-8?B?dWRYczJ3SjhPMkd5blMyc09tc0thUzZDZFZuQnlPaFA2UkdoZ0VrSERqMXpJ?=
 =?utf-8?Q?kbSlbqK0yHza3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df959a4-0f7f-4949-8c2f-08d966686fbd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 19:01:39.0738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: islwvfUYs+xWSQnCz2DlpkY3j28/7gDlpzFPRT/T+rFdrKSlbkCN/JT+W+SWMlL6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4781
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

Am 23.08.21 um 16:23 schrieb Kees Cook:
>
> On August 22, 2021 11:28:54 PM PDT, "Christian König" <christian.koenig@amd.com> wrote:
>>
>> Am 19.08.21 um 22:14 schrieb Kees Cook:
>>> [...]
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> index 96e895d6be35..4605934a4fb7 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> @@ -1446,4 +1446,29 @@ static inline int amdgpu_in_reset(struct amdgpu_device *adev)
>>>    {
>>>    	return atomic_read(&adev->in_gpu_reset);
>>>    }
>>> +
>>> +/**
>>> + * memcpy_trailing - Copy the end of one structure into the middle of another
>>> + *
>>> + * @dst: Pointer to destination struct
>>> + * @first_dst_member: The member name in @dst where the overwrite begins
>>> + * @last_dst_member: The member name in @dst where the overwrite ends after
>>> + * @src: Pointer to the source struct
>>> + * @first_src_member: The member name in @src where the copy begins
>>> + *
>>> + */
>>> +#define memcpy_trailing(dst, first_dst_member, last_dst_member,		   \
>>> +		        src, first_src_member)				   \
>> Please don't add a function like this into amdgpu.h, especially when it
>> is only used by the SMU code.
> Sure, I'm happy to move it. It wasn't clear to me which headers were considered "immutable". Which header should I put this in?

I think amdgpu_smuio.h, but I'm not 100% sure. Alex do you have a better 
idea?

We don't want to put anything new into amdgpu.h any more since this is 
basically only a legacy leftover.

Thanks,
Christian.

>
>> And please give it an amdgpu_ prefix so that we are not confusing it
>> with a core function.
> Sure, I will include that.
>
>> Apart from that looks good to me.
> Thanks!
>
> -Kees

