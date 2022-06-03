Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FC853D1AF
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 20:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE83710F9C5;
	Fri,  3 Jun 2022 18:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2088.outbound.protection.outlook.com [40.107.102.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9200C10F9C5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 18:41:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Co+7IzkM+T7oToCXmV16MZgP0Ah3Qa76IRub2fIjZs5ELWL3T7XmHIn2N+xOIJfAx2RWHqfRAnf0JhmhM7VoyjiPmXEWuLhjyV0br4bikEIo9XCrXdV2yBfScD3DvtinGau+y0wdi7Zfx+2W6gNytJACIIW99VHSz6pRow9OBrRe2uha/yi7dFRwmh3K9nYiLV1Jxt5u97Vt7Tj0XGxluZ+BQN9JjXtLuFzk8WkDpsLjeHsDsNGEqQfNN4IObjgreO5QY9aW/lHL5L8bctdMK3VCImq3pteHnnGa+qj/1iednn7ML1bvNBArczUiAIjnfEVp1vj4xGB41GGLI4wt1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nX8cJVI1hsulEz7EcH57rODP/YSvQgfPblaHbB1XCI0=;
 b=bhqd/xPWVS1oN1C1O6XRLKOae9QE/82EeeOXxcafblZIQes0adP+hhv4mcFw+NtDr6RndShH8xkX5iejbsc6NSD7ATQ04JvZ02MKmTnVy6uqPLOboDCmqdAAmRU38mALeVs+TBl1x/dW2WrW6lCAt8whoZX3KBRbnD75KCNTcQhUzo0OeB1dFUnxEEsEfzLHbxULGxqrXaOYWGIDpknmczpaXOpmbv6EYoihRh2T3hahoyDqmqE/7zzp9wQc8+Iny77CGAj/Bh/zhj2QM9et/K/5/4YsF/y6eup1uLjuFjdlPRg2QAEXDF8PrUIeUkCWeNph9vdwZWbyZhZRROp4kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nX8cJVI1hsulEz7EcH57rODP/YSvQgfPblaHbB1XCI0=;
 b=Jtlf8oKHFAf48mZib/XsU6tuImihk6GcbFUKFSf8jHRQQP0xfzH35he8O/XisHnyAHE8WMeKSY54BucgXwBC4bJl0UM2JI3EMsgbjCM3RBHGikbYjb/p1lMprEnREcCvWy4XdfDRmlwjVmvdzOe6GPUnQ4lXOeYfjoj3xqVZujU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR1201MB0261.namprd12.prod.outlook.com (2603:10b6:910:1c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Fri, 3 Jun
 2022 18:41:09 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 18:41:09 +0000
Message-ID: <98c1ea95-2b1e-36dd-6706-b3667f0f5f47@amd.com>
Date: Fri, 3 Jun 2022 20:41:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
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
 <6c7e8167-fd72-ef7f-c390-8750c61bc411@amd.com>
 <CAP+8YyGRf2XRoaw9aZhwFBryxccYTRrpSLVh8X6WG02zO5ed0A@mail.gmail.com>
 <4d30fb54-be88-7913-74f5-fa998c28f033@amd.com>
 <CAP+8YyFKOM1qztPBNGk4nzsaX7Dq8-cwg0h_GUgz6sUxBZLhEw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAP+8YyFKOM1qztPBNGk4nzsaX7Dq8-cwg0h_GUgz6sUxBZLhEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0388.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::31) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f13d0c9b-1b61-40d6-4cb4-08da45909ffc
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0261:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB02614BDF77D18497734C0F0F83A19@CY4PR1201MB0261.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w6b+GLaRaRVn5FKqjV7jD+x4xs+1rEZ6nVyn7uA+LRQ/HF6qI4u8L2AiCURm+Amo4lVCKrwXwJ7ysESzsXW5+TgLZPwtKI/1r2Dl0GctVyZ1LpYLQviKxciaXrfBkytUDwd1J+8BUZfYIJNivTSKCu06xNmz10X/56IEFpXzQn2cFKs1+/3z8Pfb2RlgtsLOfX7GjYdU8/bJUfblz89BNEXMN57JGk5opBmMdau1rbiEFm0/Utgq5BkDJAB8GVCQ6WdaTgNVV9h0FiPjsA7NpINVgrbpfQZoPdokMJf1X7QNqK8dEis5lFupD4LtQK3rmNZCMhReUqlaU6yEDO5w9Czn1sORCkGWkCTfEZbQtqSRsCs4aHR5esnUT4szSgKU2MrF9WTnlebB2FNdGiv+8SdMZkSnyaq1mxGcU3rcL+fybmGdUn1eNmUJPdtHNu9HI69N22IVe10HQK3OjKDxwQ9yP9uzipf6mQG/NWiH2by4SalbuB+2vv+GVEu+Mt90193p3zb5XfgYmVJQme8xyPo2sDcVZ82Y/fdZ+j9MJsG6MZ9hXE16KKzqxxbNOOEORhAzoF+4bfLNPwyQV8L+Qy899zjTvu/S62azSY1GV+rqh0lOLfodxUmjwTOj2DoW1uxjvfE11iBWsLu6sGBZ3YoazUGtne8CtTs3eyyJ/yrVlEjkbE73wcbOuzHLZ7M6KvGQYY2D/9zu5Kq/MStorti5F4v27XmCQSKcSaz2DSAEHjgjN8/0A6YSGGgYYDz9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(2906002)(8676002)(66476007)(66556008)(6486002)(66946007)(8936002)(6512007)(5660300002)(31696002)(31686004)(86362001)(54906003)(36756003)(2616005)(4326008)(186003)(6916009)(83380400001)(316002)(38100700002)(6506007)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1JmMWRiYTVzTVNlVE5SRCt5RGxPemV2ZkozejlkTXB5L0VjUlNvVUdzRUEz?=
 =?utf-8?B?K0lqYVF5Q1dSRk90U1A5THc4QlZuSUJVdGZLanpyTDZ6bVd2Y052RGpXbnhl?=
 =?utf-8?B?emphaDhtWm5abDVOanQ5YWdVQ2JMTGRJa3JLTHVUaHJaV3A5RzVja1lHUnFn?=
 =?utf-8?B?V1pjeDlEMUZHVVJjUzQxZmVUOTlBYnFNbnVyMlZyVEdaeDV5VE9pb1E0YkY3?=
 =?utf-8?B?MWV5RXp1WmhpS0tOWmd4Yit2T0hvS2Vqd05xTHZraFgvUHdqeTN4SUgxdHk4?=
 =?utf-8?B?WkJUcDNhZVNrdC9ock05NDVzZXNXbmxkWWRMRUcrbGwrWXN2TWdlbXBaQmRG?=
 =?utf-8?B?KzJnWVhGUDNIZDU2QW10RWZQUW9ZUEE4alVPRVBkbXZxSDZGbHFOQ1hyTSt2?=
 =?utf-8?B?cHN2aFk0Q1RXY29MUktENnhZZ1NVaTlhVWc4QjRBWHZPQklmd0x5bkozTXdT?=
 =?utf-8?B?RElySEZ6RWRrTFpHdTZnWERFeUUxdXlFNWZvSlZ4MmIwT0luQ1k2SHVlSC9v?=
 =?utf-8?B?RXhwL0lvbm0wMFZaZkc0VnpYNGs5Q2ZxMG9kd3ZrSEhpVXFQaDNScHFtMXhY?=
 =?utf-8?B?V1laUEVQNG9rdm1JWFRCUGkzZ1ZZUitXSnRMWXBZY01DblZCMXlqTkY4a2NZ?=
 =?utf-8?B?TXdwQTRmNGxFZnc5TWRmcEtCVjZFQ2Exb242MjRRRUdweUx3amRjdWhGeWJt?=
 =?utf-8?B?L0RWU1VCa3g2ZEN0USt1N21VRlROV2wvTW5mOEduZjhqVUlIZENmcGpBTmJK?=
 =?utf-8?B?L2V3dGFVZko5Z0JBbmUxdllzaWRKZmx4Q0pQaGh2c2NKWmpCa3ZuRG1teWhm?=
 =?utf-8?B?Wmt4Y0ZNWXF3ODBucEVreUJEQlU5YktFa2tjNGNZZmtVcnlINzVmSEhyemhR?=
 =?utf-8?B?elU4cVIyS1I0d0tRZWp5VnpMQXNvSEh5ek1lelpjbFdZRnlkTy9DSDM4dFpE?=
 =?utf-8?B?OXZ3VExhT1N4ZXEwa2VVanVub0FjVEg1ZlYwUlJUcTBSTE8yY0oyRWZkWjlP?=
 =?utf-8?B?T2kxSElmTVpiUlhYTmlQQWJLSHd4bGQ3VHdzODJsdDJtR2RnREpPWTdTYk8w?=
 =?utf-8?B?OVpwTzlTVlJxS1NxdWl6OUJXY0VPMjJ6blRzeDQyK3ZEVEtnUjZiRlFXeE5H?=
 =?utf-8?B?bTVPcGtwaDdrdGYxZ2pOU2hXQ004RjZNM3o4VFp4NWoxZVRvWjBRNnhybFpy?=
 =?utf-8?B?N2VhYlUzaHFoT09FSFlhSXN4bi96UDBpVVNiWjVDUFE5aGwwZTYwd3RpeUZr?=
 =?utf-8?B?MW9jd1hISWtpeHppRHFSdGRlWVdmQzZob2U5SHFRMDJLTnVVeVZNazgwdlZH?=
 =?utf-8?B?VDFoQ0xYRXlwNnlFb0NFeEswZmRWcys2eVpXZGprcm56NjNyeVY3T1ZMVkEy?=
 =?utf-8?B?SFMrTmN2UDc1YWVLZG1mRlZ3bFJjQlhON0VSc1lYK05rR2g4QWJpanh1Rkl5?=
 =?utf-8?B?cUIyZVlKV3BSZUxpeTMvQmlUbE5lRkU0c3lSREsvTW9QMk4wQXRicm1DVjNF?=
 =?utf-8?B?M044aWNwN2w2SExsdHhUZld6K3F1ekZ0YXVWZ2hNcFArbzJIZTlLNStjV1NG?=
 =?utf-8?B?K3ZiNEJJUElBRmI4N2RKNDU3Sk9aRnNCN2FBREhiZDdzejNocnN5MzNmd21U?=
 =?utf-8?B?TlcvMjdIRlJwaVFlTm5UM2d6eEE1Q2w4RHdMR2pJTWg0Zks2TkxhRWNRQ0Ja?=
 =?utf-8?B?U2pmWGVYVEc3OGRYcGVoZWdQODlkYkVqVFQ4c3dOMW9zOEpZS1JKa3VoWDJD?=
 =?utf-8?B?Nk9MbW4rWllkaWtwUmhHUWFqM0ovMEx1bWIvd2R4L0F2eHZJc2w5em9nNFhM?=
 =?utf-8?B?TW8zMGtuZldMY0Z3OWtjejFQVDJNaVhzMU1jbVFUdDNSN0dmYVRSTExoemFF?=
 =?utf-8?B?SG9ZSzc3UEIxVTh2UHNIeUJlVVNtMFdwK0ZyNEVoQkRYSk9ZeGdJSzdrczNX?=
 =?utf-8?B?d2VMeWdzTTV2RDFLa3ltYUxzYS9RRmZaNmZYRmlVSjFMVDVSQnp4SkR0Mktu?=
 =?utf-8?B?THFpS0hKU3E5N1k5WUU5dkYwVW5hRVdjS1h2OGFwYm9KbG91YXA1R1RRWG8x?=
 =?utf-8?B?a082QmFaVG1xcklVWGswV01wREU0aXovNU9Vd1R1V0VCMEQ5N1NpVTJFbXl3?=
 =?utf-8?B?MUZKa2FWSUZheDBkNm13ZkpsZHdIMzJadHhVdXJWSmUrbnJocHg3ZXB6R2JU?=
 =?utf-8?B?V3puYURUVm5wL3JVa1RmblZ3S0swZDhhWXNVTkNFR0ZMeFdjM2ZKYlBpTHhN?=
 =?utf-8?B?U0EyNU80UzRPdzRnNmFiSVF3REtaYjV6UWtnc0pic3J3QU9kaTZQRDVXc3Jq?=
 =?utf-8?B?b1pzMWtaVldTSU9Bam0zWFJRWW5ub2NSRnBURnZTZy8zbUhXaUFIK0Y4SEpE?=
 =?utf-8?Q?O6kimdcGw/4Jf03eMBXO3ZJiOz/WeugNRfdjQojOJ5C08?=
X-MS-Exchange-AntiSpam-MessageData-1: zCzHIJJRwCsKnw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13d0c9b-1b61-40d6-4cb4-08da45909ffc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 18:41:08.9784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJ92XIm52Rt+4o3QTtNRiUGR4lYWgpU9P9QXngeXwCc32uL0VmTmNcpfbLG5Nq+8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0261
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

Am 03.06.22 um 19:50 schrieb Bas Nieuwenhuizen:
> [SNIP]
>>>> Yeah, but that's exactly the bubble we try to avoid. Isn't it?
>>> For this series, not really.  To clarify there are two sides for
>>> getting GPU bubbles and no overlap:
>>>
>>> (1) VM operations implicitly wait for earlier CS submissions
>>> (2) CS submissions implicitly wait for earlier VM operations
>>>
>>> Together, these combine to ensure that you get a (potentially small)
>>> bubble any time VM work happens.
>>>
>>> Your series (and further ideas) tackles (2), and is a worthwhile thing
>>> to do. However, while writing the userspace for this I noticed this
>>> isn't enough to get rid of all our GPU bubbles. In particular when
>>> doing a non-sparse map of a new BO, that tends to need to be waited on
>>> for the next CS anyway for API semantics. Due to VM operations
>>> happening on a single timeline that means this high priority map can
>>> end up being blocked by earlier sparse maps and hence the bubble in
>>> that case still exists.
>>>
>>> So in this series I try to tackle (1) instead. Since GPU work
>>> typically lags behind CPU submissions and VM operations aren't that
>>> slow, we can typically execute VM operations early enough that any
>>> implicit syncs from (2) are less/no issue.
>> Ok, once more since you don't seem to understand what I want to say: It
>> isn't possible to fix #1 before you have fixed #2.
>>
>> The VM unmap operation here is a barrier which divides the CS operations
>> in a before and after. This is intentional design.
> Why is that barrier needed? The two barriers I got and understood and
> I think we can deal with:
>
> 1) the VM unmap is a barrier between prior CS and later memory free.
> 2) The TLB flush need to happen between a VM unmap and later CS.
>
> But why do we need the VM unmap to be a strict barrier between prior
> CS and later CS?

Exactly because of the two reasons you mentioned.

#1 Is rather easy to fix, you just need to copy all dma_fences from the 
page table dma_resv object over to the BOs dma_resv object in the gem 
close handler. E.g. exactly what you suggested with the dma_resv_copy 
function.

#2 is a nightmare.

We can't move the TLB flush at the end of the unmap operation because on 
async TLB flushes are either a bit complicated (double flushes etc..) or 
don't even work at all because of hw bugs. So to have a reliable TLB 
flush we must make sure that nothing else is ongoing and that means 
CS->VM->CS barrier.

We try very hard to circumvent that already on maps by (for example) 
using a completely new VMID for CS after the VM map operation.

But for the unmap operation we would need some kind special dma_fence 
implementation which would not only wait for all existing dma_fence but 
also for the one added until the unmap operation is completed. Cause 
otherwise our operation we do at #1 would simply not catch all 
dma_fences which have access to the memory.

That's certainly doable, but I think just using the drm_exec stuff I 
already came up with is easier.

When we can grab locks for all the BOs involved amdgpu_vm_clear_freed() 
goes away and we can keep track of the unmap operations in the bo_va 
structure.

With that done you can make the explicit sync you noted in the bo_va 
structure and implicit sync when the bo_va structure goes away.

Then the only reason I can see why we would need a CS->VM dependency is 
implicit synchronization, and that's what we are trying to avoid here in 
the first place.

Regards,
Christian.

>
>> To get rid of this barrier you must first fix the part where CS
>> submissions wait for the VM operation to complete, e.g. the necessity of
>> the barrier.
>>
>> I'm working on this for a couple of years now and I'm really running out
>> of idea how to explain this restriction.
>>
>> Regards,
>> Christian.
>>

