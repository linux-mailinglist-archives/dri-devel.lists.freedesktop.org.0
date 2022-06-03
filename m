Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A9553CA30
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 14:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F3610E4C1;
	Fri,  3 Jun 2022 12:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060.outbound.protection.outlook.com [40.107.102.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E4610E4C1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 12:49:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKgoqhWvFSF8CnIDfuleVwiUgDYShr5cnqAfK9dV0N2Ym0/qhSvsSFm85XUPd8iHh/A1DWMk4gmD+A8h40gtQR7WMvV/cWKAsJ27y0nFKNfwaVNBe4j8AAAhevhEYAxbkEsFxFTwh4ozDqu6HE2TMnWc84aB7JQNPmR2ZwPZkcXx8p4aXKhf8NcsEWlGTx/Z4T5mLvL4BTLMhRlGNswhXC0/FF12NNt13OWggeJIegE+3FMb2rQwrYTZu4ZsKgdzhdrJrkA1AxGieO/Ew3ZTUS0Fn9Om2e9IuX2UuMRxCJWuOFUgE+kG6+sF44sB+QoR3Vmb+ECsMPdj0dTM3VbC1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2tiwW0h56Pko/JZCskbvlGwMu3m1jXMND1Kann4Jfw=;
 b=Z91tkkudsT4pUnIuawMlv/B2LrOv3XkP4xNi2/Ku/9U2JgC4aBy/yZKWreKKpnqkQe0uEY8EKKAqeN6tQC3J1DcX54WylsHP56jiiZ+ysPI1QXmRAczlI0bNUPgFSDsFu5qt8WqTFcLKlrYXIoBMXnIFxM8TlZJx6p6+iKXoirzcww6OBOYK2ak393VoD3dR6qY+ecDRGfa3BosGi9CzAhYrNsFk8ib4Up9s+Kggunr+hsX+s+eEfb7f310/YquAOBqjXxuPrPHBrTCXm7iLiLGgTLv4ZZEzpNRFFuG3APRTCoOOo+6kZv3dnMOIvcye5dxCakHjIPBFVRvg+4NssA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2tiwW0h56Pko/JZCskbvlGwMu3m1jXMND1Kann4Jfw=;
 b=3q+dQT1tIZlZZlTZGbdgB8iXIwU/Zbr4oubcXni+SuWEC1LjONl0UKRad0EAUsxadYhSuKwRJODAwanmDeuBtyZQ0S8X/wmNh3JPAUVStU6Ttax/UXD8MrbABzq1gTQ8SJ3uJUX9UZX/MtiSBPPNTjHav0V44T16sE5zGqJiT58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB3815.namprd12.prod.outlook.com (2603:10b6:610:2e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Fri, 3 Jun
 2022 12:49:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 12:49:22 +0000
Message-ID: <6c7e8167-fd72-ef7f-c390-8750c61bc411@amd.com>
Date: Fri, 3 Jun 2022 14:49:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <20220601004014.158247-4-bas@basnieuwenhuizen.nl>
 <e4d8ea99-ceb5-b0dc-362f-94e37b9ddc6b@amd.com>
 <CAP+8YyEy8R3nbJVFkqHnh=3VsmfWKsQyY45tcWTQhm3hujBRbg@mail.gmail.com>
 <e502a4b7-e927-2abf-9014-0b23d15d401b@amd.com>
 <CAP+8YyHdbrvA-sJ=VZccmLkyZ9WCO7CnOp5K0pMoXA=MrHLCsw@mail.gmail.com>
 <bd850268-8324-79cb-854f-b0c843f9581b@amd.com>
 <CAP+8YyGuU_fBMLkSuqBMk7uy-F=BAaopWS-Vxi=-E0P5LGbsRQ@mail.gmail.com>
 <ea49dfd3-3c20-c330-3412-5b48481331cd@amd.com>
 <CAP+8YyGgam6Hr40PS_Rc7Dg=S2dLJdce=87=wNt2B0yAyPEPOw@mail.gmail.com>
 <237f28b7-258e-8b6c-f7b3-93f0db9676d3@amd.com>
 <CAP+8YyHnR=eQZMkxn=RpdzYF69y-54ri2pFrTj8DJuRTtwrDaA@mail.gmail.com>
 <7cba4b1d-724a-3c32-2546-015fa069342d@amd.com>
 <CAP+8YyEMDNR_5=uGf8BEV5DCovr-Z_ZDWS2E7-7zqSFGG7bdKg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAP+8YyEMDNR_5=uGf8BEV5DCovr-Z_ZDWS2E7-7zqSFGG7bdKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0330.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7c153c1-90c6-4526-4ac8-08da455f7b85
X-MS-TrafficTypeDiagnostic: CH2PR12MB3815:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB3815205A52AE8D63E9FDFB2B83A19@CH2PR12MB3815.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 56lujA6UppMb++edms/vXbdhdUJ7NPU7gYFl4epfEnoOLTpWU9/2xb79P+FtIieyizJrVgy2txj0cT945vJ96sAp4BUew1lPEzFXvsuENzd0KOsyxIMct3ymZxoycoac7PkXbcHSR/XM5LXwrEHaMv8SrTxd+86pwexuG3boTtdBKXkGdQuBALjGfTXosFRJH1dLm/nVAe80ypbWsnP31APDMhRHcwKKUXFwCSF4Z7lv1hme4CtMwMTqdWshbdR6cGkJvSPV3wBMmeFEGv05aKeJIS7snUkiaFvgXw6CZNVhnRgFIyXCTsSRZBlRzHQSFD1xwo/aomkpx+MZ9/NuBlYMiNGIK3NsBe9tZXtkJpNJbntSlrSOY0HQgK2RtGICeHzLAmmE3R+6khwTWKQeBqKZWuPfPDfIFY78CUkl2ch7ynJMvZMoZ77cn02SzG+17QVn21ONIYXYbNQY/hdSdGiLw4CeAL6ddQkxhs7EoidLiNHg2zaXW2IwFNQ+feBpc2zUMs51GDxJW9cThVANGgFlkQJW6GHa5KAZiMTbBio6gQduIDSunA7wFyeuzDFeVi/PNAuJImYrXMSZbNFxhXAXz49RcSUtU9VtdZPR+HA8MRRFL0+BUwvnbYb8IuJOkxw6OM+ws9FqfR8sKlMGO6xa6lpeMNOnR05FMm0PxBGaX62mavkNy2iSO9ak24jJs9VEI+dxFGIZiYtIwScQU+Veea3/2r9h93wGb9rzrZQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(31696002)(186003)(2616005)(4326008)(316002)(31686004)(36756003)(66556008)(8676002)(38100700002)(66574015)(6486002)(54906003)(6916009)(66946007)(508600001)(66476007)(8936002)(5660300002)(53546011)(6512007)(83380400001)(2906002)(6666004)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzdrdUpKTXEwN3psQmpuTEtBTmMwdTB2c1NneFBONGVsU3JVak1IcFh3TnM1?=
 =?utf-8?B?OEsvZ1BHVXBrRlFoaTNtT3NFNks4cFg4SGVPd3dIQ2lXWjNGM1dDZ096eGJ6?=
 =?utf-8?B?UWF4TGZvSkc0a2pOQVluOEFnZjhFWmxjWU5HNXJ6MjIyV0tabGVxRFRMZFJE?=
 =?utf-8?B?cWdFTVpSalJ4RTVKcW9qWmVPQ25nbnRMUUIvV3JDd0dXL0l6alZtMlBDRUpH?=
 =?utf-8?B?U3hLL1B2cDJPZjdXU2lkc3o0QVRtQWlGMXphZnJwNEUreFkvT1JNQUdJMmoz?=
 =?utf-8?B?Mjc1b25DMVkvUnpYaGo2Y2ttS3ZjWW5Xc0VHV3JjRnZVT3ZoWnBzWi9iRG5W?=
 =?utf-8?B?NU5sOVBCemV2ckwvdUxnNXR6SE13UUF0WGhFTDhuOTN0QXpZNXczSGhxVmUr?=
 =?utf-8?B?dktKbWVFeGJDNVpaVzBlVmw2L3NMc2ZjS1NJWm9TQXJqSlRLVzBvem1UYXB4?=
 =?utf-8?B?YmtXTHN6dFJSV0NwSXJ4U2tMRFZvZk1VYitBc3Fxb1NhYXhBd21UUUxIQVl2?=
 =?utf-8?B?U284R20rZ0tWTGo4dW12emhTR2RjMmpGLyt1QXZnUlEzdlQ1SWJHUDF5clZD?=
 =?utf-8?B?NFRDQWdxMmpjRnFNd2g0THFkdGxHNk9MUmFpNEg3UDlwWnRjb09nV0FYMVhX?=
 =?utf-8?B?bm9oVCsrd28wakVobzF4MUhpcGVscVJYeCt1SE1lNXVGUGN4RkpYR0VIaFRV?=
 =?utf-8?B?U3l1eVBONFAyZFVRWUdCc0cwYW1FbkpmU0hOamJGeUVjMmplM1cwK3RnZGZ4?=
 =?utf-8?B?Y2h6WGd4RkRWQkRNVW9NQmtVZFA3Q0VONG1LTXl0MmI3UFhScWxOYldYWTMx?=
 =?utf-8?B?alc4RHNOeDc3QjYrM3FLRlFhTUt5Q3owN3JsUjhubFJiRDdhZFcvQ0Fwcy9q?=
 =?utf-8?B?ZE5KUDhHK3JsTjJxRDdVK25MdXlPcUZud1lodE11cFJKUCtrdURlcDRjNENw?=
 =?utf-8?B?OGZ5T2lteGh3eVRJZVZUS1RUVjR5b3NEKzRGU2xUNVNFeDVaZTRFbjFtWHI0?=
 =?utf-8?B?QmVndmJzQmt2VmYxS1ZuYUNsVE9Na3dIMy9Fcit3alVxbE5PY3prVWc2c2NW?=
 =?utf-8?B?aFp3Q1IzZUxQbzM0UHpLSlpqdGNjTzJ1ZDA4TjV0QTZydm9VeFRNemFabTh2?=
 =?utf-8?B?M3JkUHBqM0x1bFRHWm5xV1BGSDVnNVhoMzlaZVRzdCt4cXZ2Qk5ub2tJZ05t?=
 =?utf-8?B?WDFWTVVsRUlpS2lRYVNKaDlLdFA4S2hSSS9aS2NxdHJjN0RsOW1vaGJmVjgz?=
 =?utf-8?B?NVpDVEt1TWpGc1ZpKzFNOTNDYk14c3VkR3BVSzRWRkNZUG91OFY5cEQwbTNE?=
 =?utf-8?B?a2NzMmg3cjNWTW85djI2dzArd0NOWDJQOEltdjFEU2tXTUtCMnBVczBpNGRv?=
 =?utf-8?B?bDhQYVlGQkVuZEhuNWhIK0YrY1ZzWDhqVDVGRkJaY3pYSWVyZjFUSUEvS001?=
 =?utf-8?B?anl5c2NnbkljL1pNWjVtNk5JSkxFRm5VNFNwM2R2UHJvS05Jd1FLVzlrMGZr?=
 =?utf-8?B?VWFrbm5XSFZha3l4c2FHZkJSZlVnVy8vYUZEQjcvZ0ZMdEFVY1JMY1BVY09G?=
 =?utf-8?B?dGlnbHRBL3VnT3BERXRTM3lJMU5JL2pCZDczdjBSSHFTcFNMdUdtNmZRenRN?=
 =?utf-8?B?M2dPVEMzMkoyRTlnVTRvcFYxSkkyWFh1eDIxV1RkcHNvbThBWFFxNXF2cUNH?=
 =?utf-8?B?WGxKV1ZkdVBRNldQblovVURVSTVCandWUERxSDQyY2ZlRTlZUFlUTHpYdnlI?=
 =?utf-8?B?OW0vaEJIVVlsYUpQU3RIUW9IUzhMbEJjbGVud2RmR3F2UHFRdnpFb3NRb3Nm?=
 =?utf-8?B?NWlVUUcxbDliUytEbDhaUTBlMDBNVFBUTlNVQmp2TmVCQ0xQZkIxd3NJMmRJ?=
 =?utf-8?B?VWsrMDBObFFyNUg0R2E0NXBUL2dUdVBHYXhndVNELzJwZ2NMTHB4UmExMFFY?=
 =?utf-8?B?VEhXZE9ycHBqTXJrQ1JoUUVtZndrUE45eW5YTzVVbmxaUkNmV09qOFo1U3RC?=
 =?utf-8?B?TGU5RzJpV1VTTER5aGZBbzl3KzNheFZqNXUrUWRaemR0STRVUFlGOHI3K0J2?=
 =?utf-8?B?S0prb3VLUjFmS0szYWw2UFdjMFgwUXZkUkpja2tuRjBUaUlvaC80OGdvN1Jr?=
 =?utf-8?B?RXFlSHVJeGpoYWkxMkl2WHh6YmtZOVJXTVFxbjlML2xETWJPc1Y3OE5oeXBq?=
 =?utf-8?B?MndSVVMrTFk1d0ZPYXJvTkRHcVFmL2hYcTQ1Z0xmZ2h5bmtCbXkwTExGckdX?=
 =?utf-8?B?WnVBbVA0K1VHZk1HQzBNemlmekpaMnNaMUtvdnRyS29MTFJiZ0VPZ0s2NWlW?=
 =?utf-8?B?c3BBWnpzcEo1a2FXUm9CYlNpTUNYQXdGVTVtekJVamp6cHlaY0x1czlhWWFq?=
 =?utf-8?Q?m0XgUHPpNaUeVuhhj2S0j2txZiZyeRkxovOrK20WOTH9V?=
X-MS-Exchange-AntiSpam-MessageData-1: 5Si4dlme9wFu6g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c153c1-90c6-4526-4ac8-08da455f7b85
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 12:49:22.7732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jacYYw2dETDq1CN42z3zbNkmFB0ZpW+Z9kV8LDGLmsOcG1BA24s6ggr72kfZceAc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3815
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.06.22 um 14:39 schrieb Bas Nieuwenhuizen:
> On Fri, Jun 3, 2022 at 2:08 PM Christian König <christian.koenig@amd.com> wrote:
>> Am 03.06.22 um 13:07 schrieb Bas Nieuwenhuizen:
>>> On Fri, Jun 3, 2022 at 12:16 PM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 03.06.22 um 12:08 schrieb Bas Nieuwenhuizen:
>>>>> [SNIP]
>>>>>>> I do have to fix some stuff indeed, especially for the GEM close but
>>>>>>> with that we should be able to keep the same basic approach?
>>>>>> Nope, not even remotely.
>>>>>>
>>>>>> What we need is the following:
>>>>>> 1. Rolling out my drm_exec patch set, so that we can lock buffers as needed.
>>>>>> 2. When we get a VM operation we not only lock the VM page tables, but
>>>>>> also all buffers we potentially need to unmap.
>>>>>> 3. Nuking the freed list in the amdgpu_vm structure by updating freed
>>>>>> areas directly when they are unmapped.
>>>>>> 4. Tracking those updates inside the bo_va structure for the BO+VM
>>>>>> combination.
>>>>>> 5. When the bo_va structure is destroy because of closing the handle
>>>>>> move the last clear operation over to the VM as implicit sync.
>>>>>>
>>>>> Hi Christian, isn't that a different problem though (that we're also
>>>>> trying to solve, but in your series)?
>>>>>
>>>>> What this patch tries to achieve:
>>>>>
>>>>> (t+0) CS submission setting BOOKKEEP fences (i.e. no implicit sync)
>>>>> (t+1) a VM operation on a BO/VM accessed by the CS.
>>>>>
>>>>> to run concurrently. What it *doesn't* try is
>>>>>
>>>>> (t+0) a VM operation on a BO/VM accessed by the CS.
>>>>> (t+1) CS submission setting BOOKKEEP fences (i.e. no implicit sync)
>>>>>
>>>>> to run concurrently. When you write
>>>>>
>>>>>> Only when all this is done we then can resolve the dependency that the
>>>>>> CS currently must wait for any clear operation on the VM.
>>>>> isn't that all about the second problem?
>>>> No, it's the same.
>>>>
>>>> See what we do in the VM code is to artificially insert a bubble so that
>>>> all VM clear operations wait for all CS operations and then use the
>>>> clear fence to indicate when the backing store of the BO can be freed.
>>> Isn't that remediated with something like the code below? At least the
>>> gem_close case should be handled with this, and the move case was
>>> already handled by the copy operation.
>> That is one necessary puzzle piece, yes. But you need more than that.
>>
>> Especially the explicit unmap operation needs to be converted into an
>> implicit unmap to get the TLB flush right.
> This doesn't change anything about the TLB flush though? Since all
> unmap -> later jobs dependencies are still implicit.
>
> So the worst what could happen (i.f. e.g. userspace gets the
> waits/dependencies wrong) is
>
> 1) non-implicit CS gets submitted that touches a BO
> 2)  VM unmap on that BO happens
> 2.5) the CS from 1 is still active due to missing dependencies
> 2.6) but any CS submission after 2 will trigger a TLB flush

Yeah, but that's exactly the bubble we try to avoid. Isn't it?

When we want to do a TLB flush the unmap operation must already be 
completed. Otherwise the flush is rather pointless since any access 
could reloads the not yet updated PTEs.

And this means that we need to artificially add a dependency on every 
command submission after 2 to wait until the unmap operation is completed.

Christian.

> 3) A TLB flush happens for a new CS
> 4) All CS submissions here see the TLB flush and hence the unmap
>
> So the main problem would be the CS from step 1, but (a) if that
> VMFaults that is the apps own fault and (b) because we don't free the
> memory until (1) finishes it is not a security issue kernel-wise.
>
>> I think I know all the necessary steps now, it's just tons of work to do.
>>
>> Regards,
>> Christian.
>>
>>>
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -187,6 +187,39 @@ static int amdgpu_gem_object_open(struct
>>> drm_gem_object *obj,
>>>          return 0;
>>> }
>>>
>>> +static void dma_resv_copy(struct dma_resv *src, struct dma_resv *dst)
>>> +{
>>> +       struct dma_resv_iter cursor;
>>> +       struct dma_fence *f;
>>> +       int r;
>>> +       unsigned num_fences = 0;
>>> +
>>> +       if (src == dst)
>>> +               return;
>>> +
>>> +       /* We assume the later loops get the same fences as the caller should
>>> +        * lock the resv. */
>>> +       dma_resv_for_each_fence(&cursor, src, DMA_RESV_USAGE_BOOKKEEP, f) {
>>> +               ++num_fences;
>>> +               dma_fence_put(f);
>>> +       }
>>> +
>>> +       r = dma_resv_reserve_fences(dst, num_fences);
>>> +       if (r) {
>>> +               /* As last resort on OOM we block for the fence */
>>> +               dma_resv_for_each_fence(&cursor, src,
>>> DMA_RESV_USAGE_BOOKKEEP, f) {
>>> +                       dma_fence_wait(f, false);
>>> +                       dma_fence_put(f);
>>> +               }
>>> +       }
>>> +
>>> +       dma_resv_for_each_fence(&cursor, src, DMA_RESV_USAGE_BOOKKEEP, f) {
>>> +               dma_resv_add_fence(dst, f, dma_resv_iter_usage(&cursor));
>>> +               dma_fence_put(f);
>>> +       }
>>> +}
>>> +
>>> +
>>> static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>>>                                      struct drm_file *file_priv)
>>> {
>>> @@ -233,6 +266,8 @@ static void amdgpu_gem_object_close(struct
>>> drm_gem_object *obj,
>>>          amdgpu_bo_fence(bo, fence, true);
>>>          dma_fence_put(fence);
>>>
>>> +       dma_resv_copy(vm->root.bo->tbo.base.resv, bo->tbo.base.resv);
>>> +
>>> out_unlock:
>>>          if (unlikely(r < 0))
>>>                  dev_err(adev->dev, "failed to clear page "
>>>
>>>> When you want to remove this bubble (which is certainly a good idea) you
>>>> need to first come up with a different approach to handle the clear
>>>> operations.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>

