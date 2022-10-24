Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF4B609F68
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 12:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FAD10E387;
	Mon, 24 Oct 2022 10:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EBC10E348;
 Mon, 24 Oct 2022 10:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJZIUsAj+qEiNQ9GPy7mVUYNDeZVL7qtCpRUQ3nMRUZaXWom4OMP+JxTpnT1rc2lWayogNLpIl5GHuhqiET/0n7IZvYQ8xC3Bt27k7Ys6nPG67WSH/NT2qUAj9/Cc9lNzxFg6YiX74sZopaAh6UkPkkQ+bbwgzko5w+En1StjFsC8uLIH07dcUrWXLsuTL/BPAOxtdpA1NVH8D25tGEaOgwkRMva7A/FkMawBQrqAW2wy73DLiYRyrVI7vQEXEBMhfUkaPpWe0x4lEh18Bq4AcZ8GR+OR0L+qegkvB3gTJPgfFQ/bb0UXQtEK9D3mE9j3gvQs1YET2Fg0zB5AFlQEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfxqy81RdVYTACh5+qsBTXuNhMvgQhLmsxwYFneLMg4=;
 b=iVcdaFuHBWY2E+kaFpkBBG/ebtyysO+H+zE1V1HN2OpHHq5HCunLp+ON1SZ4Ug/p3D+x5PuQ3VQqfLh0TJ3/RElYCJsXZC/mbcKh90JuTAXO1qsxFizT4EEOxc1rlZvKRfzSDkJm1Q8ay2plLhNTB27A7SmgVfv9iQeWwAfsm68y5n50sMSj2fRnRnHaZAYDn40dOqqyXNvkgUPwpKot1WeSKdxJhqz4nwnADdg99JnR8qAWeMsh6Ez/DAQ8HM10QKfJe76VVBMRGrlQqFF0abemubJShO6oWjtGw1q8tg8cTjTFULek67mnZuXtfIulO5ltq4KrF6TwwyXO82be3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfxqy81RdVYTACh5+qsBTXuNhMvgQhLmsxwYFneLMg4=;
 b=k3CJ8DuqqhIcVlxPzVxyy28FHSGSZlhtynQVybnmhkw/dHbuw4x3N8PPQHPj8YU3klVm9PZ6vx3EQoGAq1Rjyh4xKwLS3uyCtolg5vuzRhNr5nK40DlysGK0mW+NzeH4GVnmB4i0ivrkalYqA/CQg73zhXo3kMM3Tda1zPdndc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB7564.namprd12.prod.outlook.com (2603:10b6:930:97::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27; Mon, 24 Oct
 2022 10:55:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279%4]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 10:55:02 +0000
Message-ID: <6c8b1e80-4584-6a57-815c-abddf702d87f@amd.com>
Date: Mon, 24 Oct 2022 12:54:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/13] drm/amdgpu: drop amdgpu_sync from amdgpu_vmid_grab
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-6-christian.koenig@amd.com>
 <808ed8b2-ac3f-0476-df64-1a8d1749de0f@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <808ed8b2-ac3f-0476-df64-1a8d1749de0f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0107.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::48) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca1f542-f031-4cd9-c5d3-08dab5ae3376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cvixzLt4zql5bmO1pG6aB0WQifWbiCWQw5MNJmntskF0VBrqCKcvZZ92EFg7wJaoYlE1ASZv24D3ZsNvFMig/zhVhrtJ7Ixnk1Qkdtw16AUdSdsENSBAPKB7U+qMNcMF8dpGAa56FAWcozSzT87BrIoWMt71SCjLBhRMf+fNa1inpQ5YPoLd9a6bb3RqTAbugyNwKY+L0s3iqZ/PGlOmuYhvZ85p2sXo/xo2exBWFddjjQ/RG81O7V9fudcr7NYkkoRxVBzGB+OBiWzbY4RN4XWHWrtIODBXGivHlvCjrveo+X1PzQOEIH3hf+xeISW7I5D0dcEST9TekIIm2y6dEBr13CcXiuZE4RPNm4nSZKD9T79qIlAF4AQpoEMuz+iv67Z5wGSA4ipPMETQ/BZeigyL8GF8cC+qnzxzfGUGSl1FJvU7oKC+l3TeCJb25lhR4M1cnlBLJmhDejSbKc8kxsjIIXtuqcE7Comv/INiPyTuNDtkUffdQ/iABz4wNcxIx1Y3js18x2Fr6wXyLMT9uuZyoEb7NCSFj24m6+swB8Lwh5lm0/LFMeFt+s+PWwM/GVIR5tPQ9ArfnkPa3IHeWqibTOuJ62Jgb8Dl2USdGtRvyTh+0Oocb19mPkWh4GViLRQf+OB3mhDoeWfJ4EGIi+lgUUHNgztD1ZgllO37qA4os0yCmdcuPFbilP0d1aY1kDo2ZCZ6zaRGxWWI/EPblrnzVtW+NeIwHFBGwjjLk7NSLC1CfYvnfY1PPu0XnuGruNnOmpjDxgC07+fTFT4p3Cgsxhv0oTu+ZHX3V0Je0NI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199015)(31696002)(86362001)(36756003)(31686004)(38100700002)(478600001)(4744005)(2906002)(4001150100001)(6666004)(6506007)(6512007)(26005)(2616005)(186003)(53546011)(6486002)(316002)(110136005)(66946007)(66556008)(8676002)(66476007)(8936002)(41300700001)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1NYTEw4MXltL25rYnJ0WXNabFRTQjYxNXFLOHluR05IKzhmUktiRm5xR3cz?=
 =?utf-8?B?VGZFaUhzS0grT2dFYXdpM0VOc0tyNEVGM3VwZWFYNTJyRGxtNmZTbzI3bGp6?=
 =?utf-8?B?QmJKamdlWmpqY0FNSHhPWGlDeDZENWZ1QldUZUc3UnZCOHUxNDY5Y0Y0Rzkr?=
 =?utf-8?B?K3FLQlFrUEFHTEVPeXJkM2ZzTEpnOWJCNStlMFNlUTBnNEJyWUd0V0RZMEEy?=
 =?utf-8?B?UHRQdFJBRmQ1cUJ2VUw5S012Q0J5MGhOeTdlcTVObjFyRlM5R1pvRldya3FS?=
 =?utf-8?B?R0U5OGxDd0QxaEhjeGVBdzA4K1RRWjNERXZqcUg5K0dLUnRTVHUvRW42N0pv?=
 =?utf-8?B?aHA3WktjT3BWbmpwampZbDc1V0hheHdVd1BBZnVXd2w0NmF1VHBzSDYvY3Fz?=
 =?utf-8?B?ZC9FNmZzU25HWGJPWk04TGpER2dEcXlndjJmNVpMUHZKeDF6NlVlOURLNVRw?=
 =?utf-8?B?MXNPS2xjcERQSmt6ZjljVEltV3o5Q0NTdVV0ZkVNMk81U1hoQ3JPNDZjOWE3?=
 =?utf-8?B?N0lmV0hHYnJhRVNNNG1YckFnSW9OVStpckRiZjhVMWlaVXJDSlRxRnloeHVo?=
 =?utf-8?B?K1h6ZGtKMEFXRVNKVWdKWHZ3ZWdRTTA2ZWFJMUhxZFNkUzNRQys3SncwNXE2?=
 =?utf-8?B?cXJKSWZxRjBOclc0djBOaGJLcGtZTDJlUkRDL1VsM2tMYjRUbE9xVzE2Nyt6?=
 =?utf-8?B?bGl6eHdBSjNzeE85NkttUXN1d1NkREtsYjFBUG1GZWxKMkYvd000b2EvblRV?=
 =?utf-8?B?NDE1STZQaUw3ZFNuZVA5L3U3T1kydFJNellnWkZyUFhsaU9zejl2V1ExMUhy?=
 =?utf-8?B?cDZ5dVFaUjNQUTYvYUJudTZpeW5MbHlaYkxSV3JCaTVyeFBtdUlxZGJkMjM5?=
 =?utf-8?B?cGVxTjRDLzJXeGN4dldJL1JQYnI1elNTVkpsOS93OFVHWkxrUlo0NEgxTWMz?=
 =?utf-8?B?M1ptV1ppTk50ZGRYZlIzWFYyZ2FDUDFOV1lRZk84SEFyN1F6UmhVTkpDb0RY?=
 =?utf-8?B?dTFINFN2Tk1pN05lRVZ6R1htb0t6SjRmYWIzZCtGQzRrWHRNenZqUWNJKzdB?=
 =?utf-8?B?cko5QzhrY0RmK3o3cXdxb21SWUZSalMzQkR6ODVUMDlBSkhwZ2lmeXdOQk9u?=
 =?utf-8?B?V1duSFpGV2l2Tk1maHlpQ0o3Q2ZFYXAyWmU1d2FxNkNrQlA2WjRRei8xZ3VB?=
 =?utf-8?B?dUtXOXpUa2dacnpKWU9BeXhTdGNHWHhpZ1lXbldtNG9Ic2Z6NWgyWlVHMnNT?=
 =?utf-8?B?cDdiYW9FaDM2MEF2MDdRYUZpNWgwNzQrTTVFOVpiNEJCZERGWGNSRy93OVky?=
 =?utf-8?B?N2tCT0pWa1FiVFlTUjdnSjJPMlJVdHk5U3RLZnM3Slhkd29pdzNvK0NaVnNq?=
 =?utf-8?B?NHZSWmw0c2dWVWZRT0pXVXFEL29jVTVCMERXakJwU3VPc3E2WGxCNjYwTDZO?=
 =?utf-8?B?TXVrK0FFdnNCK0xFNGdOUWdJZCtiR1lDM0ZQTlVKTnFoUU1PMlVSY1dUZUEz?=
 =?utf-8?B?ZElQekUwSFZxQ3N1dEFQdk5DSGNGOGl5Ry9yYmowTDVMZ3o2OWZzR0dmdHRU?=
 =?utf-8?B?QWFOZXlNNDJTcUJPNTk1YnF5b2dGV2dTbERqT1NNaTRjdlBIVS81d1g4Vis0?=
 =?utf-8?B?UUZOY2JlOForKzE5SHNjRDlVazY4eXljQXY2cjA2clBnTHA1dW5XREpEdlVq?=
 =?utf-8?B?YlQyaTZIYTYxd1pPaU1vaDUvN2k5QTRXSzVaVFR3djRxbXpXWHVHVnNTaXd4?=
 =?utf-8?B?dE42bUpWMktpWUJ4Qmc5L0U5RnNlZ1hyMkpNZnNIWXd5YXJxS1hoOHZXSld4?=
 =?utf-8?B?c1NsMmdMT3REdG9OamFaQjFEcU9aUURDZGp5RHJ3UTB6em9rdWt5UDUvM3hk?=
 =?utf-8?B?cHEzakNramdpaDkxSlZVa2kzbC9tdHFhS0Y3UUdGT1JJaHc0azM0c1JTTE83?=
 =?utf-8?B?Tm9GbXpvTGlMUkVMUkgxb1BaeVFmOW02SUdzS1dGdGg5a2J6NGEyNXJjQnh3?=
 =?utf-8?B?eFZvdHM0NDJnSG8zR0MrdlJDbmJod0lUaGtvVHdlWExFdlgyY0o4U25rZW1p?=
 =?utf-8?B?eVlEVndUYzJtZVZEZnBRd1FXbWJ0Tm1LUDRIRnAweG0rbXNjdTl3U24ydEhs?=
 =?utf-8?Q?GA7S9liNJJF+7Xe2ziN/iundT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca1f542-f031-4cd9-c5d3-08dab5ae3376
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 10:55:02.1048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1vvZjU9EoVNQPzdJUkH4dAOgsTbfiBFfAWZJw5QjxF6fbmBx1MdJM/IcyZlJlvk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7564
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

Am 23.10.22 um 03:25 schrieb Luben Tuikov:
> On 2022-10-14 04:46, Christian König wrote:
>> [SNIP]
>> @@ -254,12 +254,10 @@ static struct dma_fence *amdgpu_job_dependency(struct drm_sched_job *sched_job,
>>   			DRM_ERROR("Error adding fence (%d)\n", r);
>>   	}
>>   
>> -	while (fence == NULL && vm && !job->vmid) {
>> -		r = amdgpu_vmid_grab(vm, ring, &job->sync, job);
>> +	while (fence == NULL && job->vm && !job->vmid) {
> In preliminary application of the patch series, checkpatch.pl complains about comparison to NULL,
> and wants !fence, instead:
>
> 	while (!fence && job->vm && !job->vmid) {
>
> I can see that it had been like this before... and I know it's out of the scope of this series,
> but we should fix this at some point in time.

Thanks for pointing that out. I try to fix it whenever I encounter 
something like this, but sometimes just forget to double check.

Thanks,
Christian.

>
> Regards,
> Luben
>

