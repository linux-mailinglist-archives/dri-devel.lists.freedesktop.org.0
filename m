Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D09D49DC1B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 08:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A93910E3F7;
	Thu, 27 Jan 2022 07:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2062.outbound.protection.outlook.com [40.107.101.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F2210E3F7;
 Thu, 27 Jan 2022 07:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATldZ8jsGjcpc6ENARpQLaWw6r+jfoP8ILTqvA4kTfWXDzISNNfrfyK69N3t/uDFLywQbBiLVYZc5bpBXSKsKHsiVwmBoOhgl3nXjRk4Y4dj3qd4PC9/DTKbiLnNrCIrRO4zhV3UU3isNLTuQz5g3SjUZ9HScNAMY2LyqH2Vqv7Jd0/tMwtRSkjBH75Kd+1Q6ZLjdSU4amfPcGTJhk0qvOseid2X2ykll8+V5gBxcZyXGGN77KqsUiSaIoFn/AYXqfQLfd39IfrlNja5zS9Jy1WIJH5jhoNBZIUqGBPnebImMk2pj2bNTsDWSnctZ9WJY/ePlmMZxLtbr/UCZsMG1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2Nq308kl5rosZZhJrTCtajQEMqlbFZkICM6/OR/bDM=;
 b=KHZFsdHxWg6aV89jaOCdRMsXTauLH1cFZJQO9FWVu0uTaXbIWCPhB3VBak23yNUsTI5jBgPByPzUJ+ZzOeLJ+uT55KwlklbslXrJ8pHvqKkiYSGrdU5q5ChKVJ9XOll0ahiXUkM++btMx7XQrof5W+yrVeyltI+aZWvO97AxLKqU6WkXGH5lD+e0j9ouMLto/9J7XXBDv0GvWnADEUjAEnO/AE2qI+T17bdEtXKkDbHnZ+G0lmZdcKTXM7KJ8JhcTMjqE6ZCgdSwko9x3litWiJ6l566Wxe3CIOK23bqDPBXEemD5cexhvRzHd1iMswuKoNjzCZqWew7ajXvWXGzyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2Nq308kl5rosZZhJrTCtajQEMqlbFZkICM6/OR/bDM=;
 b=kes76my/nOWaMy9t82jszj0f0kextaaXzf5NecdfgDc0hqIcBSKgvsvSuYYLAY82ji/R0ckbu5A1r51Mutzht83D0vNjKvESFtG01CjObsKRwXT5l7zTW/rJkfZiuLBnN1L/EPiAcCSa1ryzcYrKwWKQfsAqygrswlpt/GYfBSg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 07:59:42 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21%5]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 07:59:41 +0000
Message-ID: <0f948558-6f31-fd81-5349-38ab21379f86@amd.com>
Date: Thu, 27 Jan 2022 08:59:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/19] dma-buf-map: Add read/write helpers
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-2-lucas.demarchi@intel.com>
 <91bfa9d4-99fc-767e-5ba2-a2643cf585f5@amd.com>
 <20220127073637.GA17282@jons-linux-dev-box>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220127073637.GA17282@jons-linux-dev-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0012.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::30) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25fe8214-8a2e-4f42-7a01-08d9e16af953
X-MS-TrafficTypeDiagnostic: CO6PR12MB5473:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB54735FD34C2A5A192C6DE08F83219@CO6PR12MB5473.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yyak0B1fuXFAo7aeEhm080jX4GeAIWh/5/StC3WOoR0AcbVS9f9Dd6XYEQgR/9+714L1n2Ni/nr1kieVIyD0pAja8MHXBrHnyVtR7NawOrF0Nfdwm3F4eoODPObNC7nFLKKiVinusEzf7P1L4VcZI87HYHAgogysVCE9DkOPxjr8R7uVp4+o9wUK6WC9cyPtXOGfMNsvoMaSJ0nzbPH7GxLBKFj3iLtfMpVV0azR6ylJ9KpKvKIvy3ETjbKikZimahSoWWOQ+mcvrt4QxqECsjpniXw5Pa7n1Qc9A9zwKVxwppYk5kzCQgT0r/EFPASiCLwnyrNHNOQUpcQqoFhWOTVeeFcyrYM9MLUfnXx7xHzrKZNlMfUe3BkHgzC0qW1m+VRo48ViGHTa2RUYFLhjmxzlvNZELXcukfIlwXPj0MJLGxyAkjDWf4yAA2Ti99wsU00jkkR/Fz/F7wdsKpTbZW79wwFcpxhUCQIs1FYMlBMbRPLzezm+zkZFmScgOu0wK9ZE0gyNiq5O0MvwAAOV5N+Tp1zelvS3C9LQWgObpIZGHHQgC/eQ8C/P4eoyEl68cixcxFESkcArk9vKXqIp3tAuCnOCodH4rQacf3omX0b2dTiLstn2ZgLxBH1sqUNb8cwCglIk5F+koaDiV/v2A6n4Nn+fxAZaz4bFVZwP1w9xPCpR5LFfrK1GQRDlIUB54Nhzf2mllGk8CCXeu37R+IwcPy2/pJY2ZAX0Gq4mK4Q/75vA73JYqq7l2IVNF7MP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(2616005)(66556008)(66476007)(186003)(8936002)(8676002)(316002)(83380400001)(66946007)(6506007)(2906002)(31696002)(38100700002)(86362001)(31686004)(36756003)(6486002)(5660300002)(508600001)(6916009)(6512007)(4326008)(6666004)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0V4S1VieUFkS1BidGNIclVSWGFwekpoaGZPU1ZFREhjbXloeVhUZFkvY0M5?=
 =?utf-8?B?M0h1SmZoeU40Q29TT042ejl0V0Q3TEJzMVhDQmJDN3ltdTdFZldxMEtUak5I?=
 =?utf-8?B?Z2hKM3V3QVdDTHd6bzdDWXdvbldHUEJRRzdmUDAxMjNJb1NKY1hqaXgzcGcz?=
 =?utf-8?B?WjBjb0FHZkpiUzl4SFQ3eTB1YVQyM1grNFUzWVFOU1dXVFlHeStkd3FhanJu?=
 =?utf-8?B?Z1NnM01HQnc1QUpTb0Fqb2xhcHB0OEoyUXNyZjUyRGlrZEtEMCt6T2FhM2V6?=
 =?utf-8?B?U3g0b05kRHlDQlBJQzBGRTUwN3llVzJWc05rL3J1SEs2dnZNMlhlZEhxaDdl?=
 =?utf-8?B?TWVXL044MEM1ZVBsT1VOTWpHZ2JGYmZWMlBrRmI2OVRCWHdOLy9YTmxwOS9u?=
 =?utf-8?B?YXl2c0V1aHRMSk13cVRxOEVoaTdBbTdxVS9qcmYreGlLdFdsUDg1MGIrc2ZU?=
 =?utf-8?B?d3pjNW14VlR4aU5lS1E1cEl1bjRrVkh4VmVCTmM5d0lTL0ZSdFV3Z1ZqNGdI?=
 =?utf-8?B?RitUdHVDTTBOSmlmOGl4bFgyU25DSzQzd0ZYOSszLzY4TkV2VXpYMUhhM2h0?=
 =?utf-8?B?V0p4eDRXTEozYUl4M0FHRUQ4TC92VXRiWEhURzNIMms1a0s3Z0xjVGZUS2U1?=
 =?utf-8?B?cjlUTnRkMXRSOHVhWkh5aVl3ZVZrZm1Xcm00M3pmdUxtQ3AzYW9VRXFmNmdS?=
 =?utf-8?B?S3BwMG5Fdy96Z092VUVsZFIzRnNzNWRkZVBSY0NUdHdETVhxMWFobkxxb0h6?=
 =?utf-8?B?MVdRTTB5RTd2UXE5d3JBSkhXMzJQNnNnNG9rd0g4aExqaWpFMi8xemxMUWNV?=
 =?utf-8?B?ZWFVbFpwQlJNUVVZTjBUSU9GTHI1K1lDaDRBUnZaYW1hdEVFM2t2L015V2h6?=
 =?utf-8?B?TVFPbVZRSlE0a25aL3JrUnhpdDRHSmU2bzJRVTU0aTdVY0ptaFdiVHZzamY0?=
 =?utf-8?B?NnhUOWpna3FaejFkaUE3NHQ4N1pjR29GekFyNGRHTnJhRTVqeFBwSnJGaFl3?=
 =?utf-8?B?Um9Qay9wOTlVUFVZcTdLZ015b1VneGJ1MHhMbllNekJBTlNJQkZMRjY0Q3hx?=
 =?utf-8?B?a3dEV05DU0w5UnRTNllYbFcwWnQ4b0JmSXNRNEJlQ1BqYXVoeklRay8wRnNW?=
 =?utf-8?B?WFNtbUMrMGpOQWVVU2pRb3NzcEFVNHRHUnVNWE0yYkZ0YVpVQU92NW5IWDFi?=
 =?utf-8?B?WWJtakFqUkYzQm4yUStTZHBCSzJpV2x5M0Mvblc0eFZzalVBZEpyL2NFLysv?=
 =?utf-8?B?MUtpaFZyak1RcHZNRWsza1pxUG5xckFyVE5TeXorNWl1U1dnYmV0cEZnR0Ry?=
 =?utf-8?B?ajNoS3dXVDJtTzJXZzJrVFhOcWVGMzZFNXhoNmNXVFp2UGNPQjZCeDlHNzVE?=
 =?utf-8?B?V0xya3UrMCsxbUw5MTErNjN0TVRrTEdYZkY1NGEzcWVxQXMwdFVBMWQxVHoy?=
 =?utf-8?B?WFBtc1F2ek51KzBJU0FNeU8yeW44TTVHSnNzUFZmdVJSdkN3by9KVGVJVWMw?=
 =?utf-8?B?cUlhVFZhakVPaHVWLzhncXFuVkUxRFp0QnltWUZOblVqSkJNYTQ3NEpJK1JR?=
 =?utf-8?B?aUlLRjYxQ05jK3pNUTZKdmpJdTBZdENqeGdYU3VzOUVneDFFYmwvRW9zb25n?=
 =?utf-8?B?b3d0RmRVMmJQMkd3ZmVRemcwK1FlMi9kZEpMYk5aTFdJaWFMWld6OEgvajly?=
 =?utf-8?B?cVNTYml5Rk1QRS9lcHZyY253YmJKYzNpOStleDhnbkpGVnY4UjlJTEZpWlZT?=
 =?utf-8?B?bGVTUzZTbC93QjI4NVhKTlFlSFM1dzlCcGtkWnQxN1M4YnN4ZTNCZ0ZsNTZu?=
 =?utf-8?B?M1lCNE5GelJPQWpmNzlqVGdjS2hzaEhqUkJ6MGdISER4dHVUcFlsUnppZnRi?=
 =?utf-8?B?VzdvNTFGbDBMcFNaM0tsVm84QjNSMkVza3Fjemp2NEFsQkJWRFVLNFFjVnRW?=
 =?utf-8?B?Z1JsMWRHQjZrc3JEdERjTGNiS1FaUzRDVU9LcW5wNGFRUmpPYjRqd2VTN3Zv?=
 =?utf-8?B?NHpBRWRoNTkvSkFLTGV3d2w2SC9PdHJzcEZZN0NmcDF3UGIwM2lpaDlFZXFL?=
 =?utf-8?B?MVhVUEU5djRxTmhFams5RHBxSGNsTFVhYUhXenlTRER6ODljMCtidjZxMU1Q?=
 =?utf-8?Q?dpSU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25fe8214-8a2e-4f42-7a01-08d9e16af953
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:59:41.7291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FH7lQC+BdagHZQY6wnOxnaXm+Auej+RlIdeI1WENfbEXENvPq8yMQaDDwVpIT6Us
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5473
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
Cc: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.01.22 um 08:36 schrieb Matthew Brost:
> [SNIP]
>>>    /**
>>>     * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
>>>     * @dst:	The dma-buf mapping structure
>>> @@ -263,4 +304,44 @@ static inline void dma_buf_map_incr(struct dma_buf_map *map, size_t incr)
>>>    		map->vaddr += incr;
>>>    }
>>> +/**
>>> + * dma_buf_map_read_field - Read struct member from dma-buf mapping with
>>> + * arbitrary size and handling un-aligned accesses
>>> + *
>>> + * @map__:	The dma-buf mapping structure
>>> + * @type__:	The struct to be used containing the field to read
>>> + * @field__:	Member from struct we want to read
>>> + *
>>> + * Read a value from dma-buf mapping calculating the offset and size: this assumes
>>> + * the dma-buf mapping is aligned with a a struct type__. A single u8, u16, u32
>>> + * or u64 can be read, based on the offset and size of type__.field__.
>>> + */
>>> +#define dma_buf_map_read_field(map__, type__, field__) ({				\
>>> +	type__ *t__;									\
>>> +	typeof(t__->field__) val__;							\
>>> +	dma_buf_map_memcpy_from_offset(&val__, map__, offsetof(type__, field__),	\
>>> +				       sizeof(t__->field__));				\
>>> +	val__;										\
>>> +})
>>> +
>>> +/**
>>> + * dma_buf_map_write_field - Write struct member to the dma-buf mapping with
>>> + * arbitrary size and handling un-aligned accesses
>>> + *
>>> + * @map__:	The dma-buf mapping structure
>>> + * @type__:	The struct to be used containing the field to write
>>> + * @field__:	Member from struct we want to write
>>> + * @val__:	Value to be written
>>> + *
>>> + * Write a value to the dma-buf mapping calculating the offset and size.
>>> + * A single u8, u16, u32 or u64 can be written based on the offset and size of
>>> + * type__.field__.
>>> + */
>>> +#define dma_buf_map_write_field(map__, type__, field__, val__) ({			\
>>> +	type__ *t__;									\
>>> +	typeof(t__->field__) val____ = val__;						\
>>> +	dma_buf_map_memcpy_to_offset(map__, offsetof(type__, field__),			\
>>> +				     &val____, sizeof(t__->field__));			\
>>> +})
>>> +
>> Uff well that absolutely looks like overkill to me.
>>
> Hold on...
>
>> That's a rather special use case as far as I can see and I think we should
>> only have this in the common framework if more than one driver is using it.
>>
> I disagree, this is rather elegant.
>
> The i915 can't be the *only* driver that defines a struct which
> describes the layout of a dma_buf object.

That's not the problem, amdgpu as well as nouveau are doing that as 
well. The problem is DMA-buf is a buffer sharing framework between drivers.

In other words which importer is supposed to use this with a DMA-buf 
exported by another device?

> IMO this base macro allows *all* other drivers to build on this write
> directly to fields in structures those drivers have defined.

Exactly that's the point. This is something drivers should absolutely 
*NOT* do.

That are driver internals and it is extremely questionable to move this 
into the common framework.

Regards,
Christian.

>   Patches
> later in this series do this for the GuC ads.
>
> Matt
>   
>> Regards,
>> Christian.
>>
>>>    #endif /* __DMA_BUF_MAP_H__ */

