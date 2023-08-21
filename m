Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D62782792
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 13:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D29810E22B;
	Mon, 21 Aug 2023 11:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA92010E22B;
 Mon, 21 Aug 2023 11:07:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYaXdhq0G+uRA/KDzYpJqAdtdIK7H61vBr+rTWx7dsr8SZJIn4BAjH+kAgRkmmeWUfiFRUd4+rF72xrqVNVZhygApS/alNREehKPao8l9zb5HO0hpSLP037/Ll8gnPUNUjy5VGNuswvGf9fMoWT94Sy804XbDPuksSQ7xZc3uTzJR6lN1kna3VAWohPiPmQxB7GzCB5EiwAwrln493cN/9LRZq4iVSd1VKxCPQnAb3c7nrJWYuPIAunP70XMdvD3XH/6vtzlYlvH9N4V2LmiREdfkvljFegGxdWnj5Tmrr1r0K7/1Vj1djzTawsAGzEi97yKO93t4PUYuChkHyrJ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxmZYq4jmnFTJSoqxKIecdgnxAa1ZcIixd5x4Gr4DG0=;
 b=VtTiLi2G91ldYMRKLYE62qqRJPELgxvEdsTt0xdG/3wnVLH28GSv7n/TlLtsUq69648/RNGOgausJLwyjdyrt9DGAq1sWzOqiA2V/VuFDR5CM4yXCYYPwAFIVfChrB0RNJnnwbv4G06ILFV72plJD3CQvYSPbvAvCFPFrGJ6bE1ILp3VYjd/TISTk6D9od7i8EW+t4ezdeStKDiWVxqiHWOmuGp6uT2pkEhxpj400ZCIpB0UpMChavFgxp5HwTUFJgp/t75OtWom8rXfmk1KtZIkIOe129CVWvJk+aIm3D+1Mcic0fiVKc6HVyOS3EhexSNL88xOlhekJi536sER+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxmZYq4jmnFTJSoqxKIecdgnxAa1ZcIixd5x4Gr4DG0=;
 b=SLPfJKwBpXzML+6ERpqYgUo9Mxyf0WbBwCrwlGBM2kiZLzqBIvD1bQoLbtxbli0v4jKCoFkzXXmgNBJkezpA7qdsXPJf+iDeNTHUcTSSZsmctGK2VFoQdq69JO3rWqyxi9ez4aSbC71x24/Lrt3NV5NOpWlAaeauKnAuEiKbgPU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 11:07:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 11:07:33 +0000
Message-ID: <218290b4-b5c0-afb4-dad5-15010546e0b7@amd.com>
Date: Mon, 21 Aug 2023 13:07:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH libdrm v2] amdgpu: Use PRI?64 to format uint64_t
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <8ffa3be3dc7b27345dde3bb32498c4cd3af050fa.1688632590.git.geert+renesas@glider.be>
 <c13c9974-8903-904a-55a8-4065b43a437b@gmail.com>
 <CAMuHMdW226aZY_Nx9nfbS-ivsW2oarbNAjZB10O60W0SUQzmYg@mail.gmail.com>
 <CAMuHMdUzqTF9hfe91QN2woV=ycUjLJ-WsODYG8_jH5ABkNk8mQ@mail.gmail.com>
 <d16bf538-f4f8-50ec-e0e9-5a194b113db4@amd.com>
 <CAMuHMdV0ckw=Bm5-HAy54UPaAEW_zyZLeC8r3K=iBMUZerCjYw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAMuHMdV0ckw=Bm5-HAy54UPaAEW_zyZLeC8r3K=iBMUZerCjYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: adc12659-e49f-46bc-3371-08dba236d170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iIQLTjHkx+xO6fkOSxAjMQ2XP7rWbzwwRiULwGt2AVqgQIsFF80u/wUHy50CGWSV1Rm7yGWf9gjsCLzHJ0/RpWgtHnmBZC9CenRENQj8LTy4rSPATVrkd3CjM/DlNOWDO74t57b59mQUA0QHr0sWpMJNE0KFGwNM6FvCDl9i/g+gfPBLGor704pX6NnV7sfDjWYuddP3gC0SIETxuSt38Xgv14C4TQKZ2nHI0605QeJbX+KH5IqR8jydHqCRAF1BjHjCBfQqnTpcswmnGY3HhWT+SfnE+Og6WA7E5q3Gn6cJdYEzafKmBz53uXaGx2x8R0zEc6pb/gr/4e0c1YvmzshlNKc+u+NZXyjy2Wd1kxHE5ztEK7souaYOaA5XuU9RTUFafah6CPtJcm48RNWoSzXllP6tIVc2eyT7oJJPZRIoSAparWdlhSO8JmB3TESNM1G8+HSjoVkIFKifd1aMBnrkgl3PnNtv5S3gOI7GxyEuxOiMDVTqd5rmM7YT79+33kjNnZKHNBk/0Pkm6Ef3D/vzwQzFjmANYfSz959JJruvAg4zSAh68MZUqQH1ewN55mjpjLdpzpZODgD9ZCpopk+4YASmUmy8aeTCPkXNcIrj3cxP1T0AvNzIoIlXWsvuWmxUUqYQRyzcwjdDx1WOkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(186009)(1800799009)(451199024)(6916009)(66476007)(66556008)(66946007)(6512007)(316002)(8676002)(2616005)(8936002)(4326008)(36756003)(41300700001)(966005)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(66574015)(2906002)(83380400001)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmFDR0krckQzbExrQi81SXdpelhlb0hKVWlDdmVlTWdFVDloYlFiaWl2ZndT?=
 =?utf-8?B?aEFxV1ZxbEhjT3N0Tk13STByZGZDTC9iMCtOMWtYckZyeGJ3UzIxK2NNeFNt?=
 =?utf-8?B?b05aaFYvNGRna2U1bm1oc3pHWGlmd1VnY3VINUo2b3U0RnNNOTBpRUowalBV?=
 =?utf-8?B?NEpwZTJoVWp1T2tUQWxWaUxRRE1zcmRrSkhkd0I3QkUzdlMxRzVVMXR0Y3dq?=
 =?utf-8?B?L0NETG9TS0dwZjNSaWFwOXMxMGUwVHFNTkgyRUEvT0tCOFltMXZ1Y2FpaUFF?=
 =?utf-8?B?T3FyeGMrekZ4ZUQrWXVTVU1rZFlnbTc3cS9kRnN1SzI3MzIyRFhqMXVKRWZ4?=
 =?utf-8?B?dE9ReFVxS3AzR0F0TXVXZE55V0J4VHZiSCs0VVVHUFZVaXo4TnlIK0hZcGZW?=
 =?utf-8?B?SDFjWm5CR2tja2M1TDkxQS9VYzE2NDlyZ3RrTUllblpPTituTzFnM0tVeS9Z?=
 =?utf-8?B?bHdJOEVMUDg3YWVOZE1ldGhmRytSNFlTbHNtaXRsMHVxd0RCbEhFR2N4eFB5?=
 =?utf-8?B?QWo1bDNlTm9mZXhVem9zNFU5YzlVS21rRDV0Yk43OFcvdEZTa2d1U2c3bnl5?=
 =?utf-8?B?djBHYXgyOXp1THNMNHNtR2E1UXR0eEdTQW8vUFV6K2Q3N2Z6dWlCQ1A4NTNV?=
 =?utf-8?B?eDRCSUdRSHlPZlA4RXFmVXd0NlF3cFdsc1BueWV2L0JFblRveGQvQk1mRjZL?=
 =?utf-8?B?RFQwdGZ2Z3NuRS80VXFrNGlMdjJwN0poQVM0REprOHRHaGEwNTB4NlNSVEJu?=
 =?utf-8?B?V01KUXkrb2FkeUJLeGgxTFd4RklHVkJPRnM4MzFpYUphcitlSThsSVhZc01S?=
 =?utf-8?B?NzUxSVpwVzVrT2NZWWowWGRFeTduRGM4dU1PV1pRZzRhQi9Kemp5QTdUcGZ6?=
 =?utf-8?B?SzhPd0szNXR6ZWg5NHJjSFpTOGJkemFxa1pzRy8xaS9ZWnpiY0k0bkxKZE1k?=
 =?utf-8?B?R2U1ZkJmK1ErUW1Ua2RDTVZKaEhnYXNnWGUxM2VscFpWWjRZUnVCL0E5ZlZY?=
 =?utf-8?B?MFNlRytycUVXY3Q3NzlWT2xTMndaV0JXMTdwRmdCeDhBekRrN1VBRWZSdHdC?=
 =?utf-8?B?RFZuK1pQNVhhZW5FekdjOEF5M3Bibkx2aERBNVA1a0VodDFoY1FLZk1wazli?=
 =?utf-8?B?WCtHcUhPc2MwQlZSNTRKOTZWTk16TGJmbVg0MW1WL090ZnEwYTdBd29Lakgw?=
 =?utf-8?B?U2xWSjR3dk1DUWdlSEpFVERNclRBdzFXc0FVcXhJZy9kQmR2YnNXelkvQ2o0?=
 =?utf-8?B?NFI4VkFyaHU5U0VvRDBVVE42L2ZMNjJyZ2RrczV0THV3b0tJcjQzT2tpZkFN?=
 =?utf-8?B?WkRleUkyWVkvR3VHeTNiQWxQa0Evb1hVS1NMV01XczNRdCtUM0lOVlZPZllp?=
 =?utf-8?B?ZEdScTREYU44R3Z4QkN1bGJYYVJGOUFDbEpGV25HdThyazAvWkk1bHBHVUor?=
 =?utf-8?B?ZzRaeFp1QXoxMVQ4MXVHUmlEbnIvNTc5SGtlR2VOSG4rSEcwakxmbW0zYjRP?=
 =?utf-8?B?bS9CWHdIbXFvMUtKUlR0SUpFQVpZampzazNaellITVdIeHBrZUdRTFBFME5F?=
 =?utf-8?B?ZTgwa0RuQUoxOWovZlRmdXZETmE4NDdKcmZsN2xrNVN0ZVM5a0Fhdjd5Ym1W?=
 =?utf-8?B?QUJwVGJKNEhoSXc5a2RncGVlbnR6YWl2NmFIK0EvZVV6eVhOYy9uZHYvVTE5?=
 =?utf-8?B?eC93RXB4YmlsbUFMQkNRdGFZTTBGZ0RIZWxKVk5iVVJ1bTNweDRDRnpTSkNK?=
 =?utf-8?B?V0plS2FITUNISG9pK2Y2RHV4T0JlK0ZCRXFvNHN2cTFTUFozVUhMRnhDbE5h?=
 =?utf-8?B?MjB0WWNSbGJZMFlPNTcyMnphWmcrbEM2c0tTS0tXWU1tNStFNnlYUWN5dVRl?=
 =?utf-8?B?QU91bHczcklaWnNXa3FqQlZKS3hvUE83RjB0aTZWeEZ2czN2QUVmNWZ6Mmth?=
 =?utf-8?B?MXZsQ3d4YVZRdVh0aUhaZUJiaWg0Rk0wTklMUXdHV2hQOTN1dzRaWm1JT1dj?=
 =?utf-8?B?MFNyZFp6WG9LSXpTRDhja20vZVlTdDNOR3NxQUtmUEVvTkQ1ZWJBNkg1QVZF?=
 =?utf-8?B?NW9salNUZUFwd3kwQWYyVGhtdjVjTTlRUXY1TURZWjRGRmNNNE9vYVVBT1Nj?=
 =?utf-8?Q?edfNR5qNBy2ofDGHXTy1g1oV0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adc12659-e49f-46bc-3371-08dba236d170
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 11:07:33.0571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xsP5FIVkrWOIZhZBnsZUDacjFODPo2vmZVgeXO72cZK/d8McBYJgcx0w+6+p8Ek
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8013
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.08.23 um 11:48 schrieb Geert Uytterhoeven:
> Hi Christian,
>
> On Mon, Aug 21, 2023 at 11:34 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 21.08.23 um 11:14 schrieb Geert Uytterhoeven:
>>> On Fri, Jul 7, 2023 at 9:36 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>> On Fri, Jul 7, 2023 at 2:06 PM Christian König
>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>> Am 06.07.23 um 10:36 schrieb Geert Uytterhoeven:
>>>>>> On 32-bit:
>>>>>>
>>>>>>        ../tests/amdgpu/amdgpu_stress.c: In function ‘alloc_bo’:
>>>>>>        ../tests/amdgpu/amdgpu_stress.c:178:49: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 4 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
>>>>>>          fprintf(stdout, "Allocated BO number %u at 0x%lx, domain 0x%x, size %lu\n",
>>>>>>                                                       ~~^
>>>>>>                                                       %llx
>>>>>>           num_buffers++, addr, domain, size);
>>>>>>                          ~~~~
>>>> [...]
>>>>
>>>>>> Fix this by using the proper "PRI?64" format specifiers.
>>>>>>
>>>>>> Fixes: d77ccdf3ba6f5a39 ("amdgpu: add amdgpu_stress utility v2")
>>>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> Well generally good patch, but libdrm changes are now reviewed by merge
>>>>> request and not on the mailing list any more.
>>>> I heard such a rumor, too ;-)
>>>>
>>>> Unfortunately one year later, that process is still not documented in
>>>> https://gitlab.freedesktop.org/mesa/drm/-/blob/main/CONTRIBUTING.rst
>>>> which still instructs me (a casual drive-by developer) to just submit
>>>> my patches to the mailing list...
>>> So a few weeks ago I created gitlab PRs for all my pending libdrm
>>> patch series, and I rebased them regularly when needed.
>>> What needs to be done to get them merged?
>> You need to ping the userspace maintainers for this. Like Marek,
>> Pierre-Eric etc..
> Thanks, I assume (from "git shortlog") you mean Marek Olšák and
> Pierre-Eric Pelloux-Prayer?

Yes, of course.

> How do I find out the maintainers for non-amd parts?

That's a really good question, I don't have the slightest idea either. 
My approach getting libdrm patches upstream used to be asking somebody 
for review and then pushing them.

But that was way before switching to merge requests. Since then I have 
at maximum merged a handful of patches.

>
> Looks like this thread is becoming a "what is missing in
> CONTRIBUTING.rst?" list ;-)

Indeed!

Cheers,
Christian.

>
> Thanks again!
>
> Gr{oetje,eeting}s,
>
>                          Geert
>

