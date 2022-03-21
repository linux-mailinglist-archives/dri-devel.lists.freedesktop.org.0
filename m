Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5525E4E2E08
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 17:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADB810E403;
	Mon, 21 Mar 2022 16:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508B910E3E3;
 Mon, 21 Mar 2022 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647880310; x=1679416310;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2/GNyx7dXUS0Y8h5OcA4+nzVV21jbnkKXqTO1xUTYjk=;
 b=gF3jkqHPGeugPKPtVSLhBhYvFg8z3CG/o+B88N2vLUbXQYGwHE2M5459
 SAjVfJXcpAITXmiTH57kOZtFc6oTkUaxlmuK7/MGHj0hov/VARKlLiXMA
 wp4RhQe5CHBPQ3i761KehonKl2GHLDuGsddoaOXAvgFoN+fzPCVdmodSb
 mHyifcBDE7Re1q9ElI/lO/L2KfoqoFaD5bIKq39Prd6+BevIWGDukqixW
 l2eErw79x36AY7XrDvRCoqEr+iiYkhtj1kkvMhkM6iHD1iqA17pFCY+Sb
 E4XMe/y4T7jtWoE72kVZKECwEXM3xhGAZsLdNMnmF0GTutLlP/8/9+bhS Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="245064679"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="245064679"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 09:31:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="646661687"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2022 09:31:47 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 09:31:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 21 Mar 2022 09:31:47 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 21 Mar 2022 09:31:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCt7genfKhsu7aw2SfK5STu/TfI+fk7a+qDs6yf+F8qdsft1geuq2feERpA/CoFqeb2ldGKw0cpsYf11tpAKV9n76a5iLomD9Fn5f1Vi1g1M0tLkcc1lJrD3QwbUTKQURWhryLKQcsK2naEKroD7ZvH4E1LOg3K4p6obH7YUwzblMGK3RktYZpM7LduwBcGbmZ0pJIMPl09SvIwsT+TmO5CJTFg1qLOcv2GkbVH3s7H5la/QyYIFhsqI+F/ubIrBFPuiZspJ0yDfl66I7Rt3Tn6BHZ6tMor911a8PXX92S0jqQGEmFVP2CBrPlabjgkyuOUtORUORYIPKPFso72nLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=latSKv8GRcanEX3T87QIwIiIDPIrso5iQGsNCTfQpXs=;
 b=Qp8GOGurCK4PP+f8VCQwDgr419xg6AZfhBTC9N989C5lnA1VYwQnN7QDcjLgSQMHEDK6wGrj81VYEre+iJfvGnc/pRi1Vau+rRcsdYs7hi3Uqp4oMuNUAKnjzeBBgHcfmH6ElwcoErYr0ZO/5ARvMTtCRqV5Ifacr3f3SISymXDSC3vSoHThhEa8uHTPJWigccFb8s1wtvEoRk1qL5l31aGgKAdqn+HS4vW7e/sGIT43RcEsecI41WLsg5TR7MlHwUIRJxzPRXt1Hu+L1ffi7hhEH1EUBNAtnJJMiRFYuvImXIu0aorh1+WBxXNPiSwkaNcRnz64TR1ZYPxUsMRSOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by BYAPR11MB2997.namprd11.prod.outlook.com (2603:10b6:a03:8b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Mon, 21 Mar
 2022 16:31:39 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0%7]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 16:31:39 +0000
Message-ID: <05e56e59-81ed-0b99-6c3d-7f9f413ecd4a@intel.com>
Date: Mon, 21 Mar 2022 09:31:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] i915/gem: drop wbinvd_on_all_cpus usage
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220319194227.297639-1-michael.cheng@intel.com>
 <20220319194227.297639-2-michael.cheng@intel.com>
 <fc7c729b-5c87-f046-04dd-7ca8296487dd@linux.intel.com>
From: Michael Cheng <michael.cheng@intel.com>
In-Reply-To: <fc7c729b-5c87-f046-04dd-7ca8296487dd@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0226.namprd04.prod.outlook.com
 (2603:10b6:303:87::21) To MWHPR11MB1645.namprd11.prod.outlook.com
 (2603:10b6:301:b::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2773926d-8720-4387-6cdb-08da0b584627
X-MS-TrafficTypeDiagnostic: BYAPR11MB2997:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB2997B45379297C6A5B383A97E1169@BYAPR11MB2997.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: runztW/i+Jq3KyTQIwg3voAPQ05GYtHeLoc7/7JBsTU4UQY6nsEoUZlqTiT0IBqWjgvG9dNwYncWGCSXuaFTbnECq2i/j8iXtGZFUZ4pt5wi2pF65MpxWiCpFz/kA3K10SogLlJ08qudu8Lu5c1O9G2Q40L4E0ruN7M0as5VwVh/u+xTKo4S9vUgh08pkhKcgLxosJEPXXBPqQnXYIWR33cttqbAi7xwrBEqGxbHBZ3JUfqLfNUEWz+OBtd2MWoEmhW0Lz/xI6n8iSvLhG4kxLIRvP7pOAht6JKtXkuCcF7+TnjCQ2EuXV601Qqa+pBRCIAgojqeluBqD68z1ZkIFVdJNt7RvLCBoM9JxCQFJhU0t4QOjVC1aKXyES0xX7Vn0ZfeYc2p6n+tg8sFNPki+bVmmC59iTH+li+Yp9XCwZNXTRw8mL6AJ6dxJsAhQjkQI70d+MauBnoQkajgIUjCCY+IVc2ZFPC+axwwQdhPJAbkcNOQv0jCcVVWw2iO8xXRRYmcBJT2++R6Buk3iGbM1HgzngWhROE6SMHjlPoFKVBwEpnPZCPcd8tPYeQ+OjM6gCNimmicUthDKahUp7WfcIJAG9I+IlgeVgS/6r7V5Gpn9WIgU8jn6HVdEBGNL/FFxvDdbbYyG4I/6d/TpkFNaiex0biHhpBQ3x9ZJ3IDOboA+89taCJrCdHz8Si3aUzFHkAZ5eELRaMtsfzuw4ArWzjIGoRp8j5NIZ4wjLMBIgWP/EfQ6GSnrCrg4hhcTmHh9pFWjL5v7yI0ZUvNTpm5/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(8676002)(4326008)(508600001)(66476007)(6486002)(82960400001)(5660300002)(8936002)(66946007)(66556008)(83380400001)(2906002)(53546011)(6506007)(36756003)(6512007)(2616005)(6666004)(38100700002)(86362001)(44832011)(316002)(31686004)(31696002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEhHQzhMM08zc2NEdU0xNHo3WVh1eXFIUjgwN3ZiS29ZM0lxRGpXUnRKdVY4?=
 =?utf-8?B?TGRySjJzWVY2QWozVHpjT3JCNktYNHh2QVI3NDV2UXJuSlZGRmsyQjBIekFQ?=
 =?utf-8?B?R014WTZIaFU4UkFOSmRudHZFMXpIR0lCRzR3RFAwSFQvWkM3WlUvK1pXV3pK?=
 =?utf-8?B?aERZQ0x5dEVRSjMwWTNWQzFKNXVnZitFZ2trSGhxSW1lTVptUzJ4cDNiWFZq?=
 =?utf-8?B?eE9wcUZNdmUyYlJBRm92WW5aa3ltbUFiYktubnlITms5S2ZVZzMvM0VmazJB?=
 =?utf-8?B?UW40enIxUmpXbDhna1ZwY3IwTlFjSnYzeGZCeGtDY1U3Q3RaamZaazFNNFYz?=
 =?utf-8?B?UWtubDdxZmhGalZKQjZLT2FsRVozMjYwdk8rY0tTSjF0OE9HdGM0Qk9US2JO?=
 =?utf-8?B?ZEtNSzhTWHZ4S1JobE1nUGdDREU2T3ByZDc1bGFtaUhueG9sZGpXa3lzb0xS?=
 =?utf-8?B?Z2xQbEYzREZORVV4TzdTSDBwZFZYVnJlcExUN1F5bEVHbDh0Y29IOHVGS1NG?=
 =?utf-8?B?RXREcHREU3hRbmVjYldLWXlxTTh3OFJMcHVvaTVKdVQ4c00vTVErRDV5ZTFy?=
 =?utf-8?B?aDV6dzBYdzRtcWNjRjZmSCtBNDlOT2dPL1NuRzBYcnpiU3JaeWJRLzVBNjNm?=
 =?utf-8?B?OTlGRzkyYnNwZm5ud3UrN20wT3RzMENzSkFXakVLbGR5ZTlQRXFRQ0xVazVB?=
 =?utf-8?B?MnFCcm1YWVlJN3BZOGxNVy9MRlU5anNsNzdHaTVvS255allxK0NxemY0Q0t1?=
 =?utf-8?B?Z1ZYTTcxOUs5dW5lckZMNUtPWE4yeUZZZ1p1YVZkcmlZQlVobDNpYUIvenNz?=
 =?utf-8?B?VFAvMW5sQncvUWx4ajFBM2NSc3c5aE5Qbk5ZVXl3MUNrL1cyT2xWSWFvOVV1?=
 =?utf-8?B?SmM3SHFmelFaVlo4M3dkajZsaW95TUlnT0djRFc4Q0d4T0RSTnF4MHZ5N1hm?=
 =?utf-8?B?WE5sUmtCa3JYdFdPa05Pbm16NFRFWU4vbWo0dGE2bllqUzNWY1BVZzhPZ0dR?=
 =?utf-8?B?c3Irb051V2QyTzZsNzlBeHYrcEV2MThNcnMzWEYyT2VTOVlWZlpvWW1XUGtm?=
 =?utf-8?B?NWlaVTNXWlJZb216cURwVGFIbzBIeVk1Z3dYMGlRa2FzemxVM3BjVkhJYWln?=
 =?utf-8?B?Y3BqemFqQ3pNeUk4ZGRpTm5tcUQrOVcvcFh4YUhwZ2xCckR2STREczJVREsz?=
 =?utf-8?B?azdRcU94a3J4ODVPUGZ3UEdnR21kUFpBYVkvMFlNZzZvbHVjMGJSRUhjZHN2?=
 =?utf-8?B?eGxBdExiR2JOTm1TVWV0Q2pJMURzZmpQRUNtQmdnUUIzZTFRa3JLaEFGdS82?=
 =?utf-8?B?bjBQRkRsRTA2SDZiLy9aQU0zSEtIRmZEKzl3TzFXeWt5NEpTTXVjZlVRRmdE?=
 =?utf-8?B?YzhWdVN1VXJVelJWM0pxUHlrMnJHYTRQNm00NEtDYnZ4N2Y4UE5ZRE5WWXd3?=
 =?utf-8?B?QURON0g5M0prM1FudkMyREdmaUlOV1ZJb3JJMU51b1lRNWw4YisrdWk2RURM?=
 =?utf-8?B?aUpFeDUzbzZETEhnaFQ2MTJRQWZ4dUszZEFFRmpUMHlPSkVDelVGM25ncWYv?=
 =?utf-8?B?WXdPaWJyTCs0MFVLQkEzNlBySFIrY0JubEVUbFlyTlZWckdxTFhOM003Y2RR?=
 =?utf-8?B?MVlNM25nSmgza1lUazk1enIxWUlucWhVdnpPRzI2MG5ES3A3bEhEcklSa0hx?=
 =?utf-8?B?QWZFM1NnZmdzV1BZMTBIQUR3NGZ1L0VIbDZRRzQwQVlRdmgrWmJ0V0EvQTBR?=
 =?utf-8?B?U2RBNkdCenFyZ1VsN3hqaUVybHJLY01lWGVtVzRENXAzRFZoTVptSmlZWmM4?=
 =?utf-8?B?eWdrcWFieWlDVnY5VGNiZ09PME1DYjdSZkcrR3gxZGpDdU0xVGVtZjE0bXNG?=
 =?utf-8?B?TDBiR1dGN2J4akw1NmJFVlJPN0R0Y24rb2FjTmhiU3YxR0lHWitlWGFvNUYv?=
 =?utf-8?B?aW1ITkJBMnhFUUh1SXozUmVZRGxkdm1JQWxEbTJFdnd6TnQ5SnlKZWxBN09I?=
 =?utf-8?B?aVFvamFPcXNiZUpTTzJ4VFRBSktPMXBIMWxnVkRQb0J4V2wyaCtNNzlKWGNz?=
 =?utf-8?B?czNUSmhxMXdHM3M0Y2JBOVF6NUp5TVk5ajljQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2773926d-8720-4387-6cdb-08da0b584627
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 16:31:39.0394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /nxPhA5Y5BoBp13NtlHxAJxCkoBOSd3RrIEpBl64C+Blq7BRPh8tiAvGbwLVJrKjt0irjTzU2+tvy6BeE1JR8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2997
X-OriginatorOrg: intel.com
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
Cc: thomas.hellstrom@linux.intel.com, wayne.boyer@intel.com,
 daniel.vetter@ffwll.ch, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-03-21 3:30 a.m., Tvrtko Ursulin wrote:

>
> On 19/03/2022 19:42, Michael Cheng wrote:
>> Previous concern with using drm_clflush_sg was that we don't know 
>> what the
>> sg_table is pointing to, thus the usage of wbinvd_on_all_cpus to flush
>> everything at once to avoid paranoia.
>
> And now we know, or we know it is not a concern?
>
>> To make i915 more architecture-neutral and be less paranoid, lets 
>> attempt to
>
> "Lets attempt" as we don't know if this will work and/or what can/will 
> break?

Yes, but it seems like there's no regression with IGT .

If there's a big hit in performance, or if this solution gets accepted 
and the bug reports come flying in, we can explore other solutions. But 
speaking to Dan Vetter, ideal solution would be to avoid any calls 
directly to wbinvd, and use drm helpers in place.

+Daniel for any extra input.

>> use drm_clflush_sg to flush the pages for when the GPU wants to read
>> from main memory.
>>
>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 9 ++-------
>>   1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> index f5062d0c6333..b0a5baaebc43 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/highmem.h>
>>   #include <linux/dma-resv.h>
>>   #include <linux/module.h>
>> +#include <drm/drm_cache.h>
>>     #include <asm/smp.h>
>>   @@ -250,16 +251,10 @@ static int 
>> i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>>        * DG1 is special here since it still snoops transactions even 
>> with
>>        * CACHE_NONE. This is not the case with other HAS_SNOOP 
>> platforms. We
>>        * might need to revisit this as we add new discrete platforms.
>> -     *
>> -     * XXX: Consider doing a vmap flush or something, where possible.
>> -     * Currently we just do a heavy handed wbinvd_on_all_cpus() here 
>> since
>> -     * the underlying sg_table might not even point to struct pages, 
>> so we
>> -     * can't just call drm_clflush_sg or similar, like we do 
>> elsewhere in
>> -     * the driver.
>>        */
>>       if (i915_gem_object_can_bypass_llc(obj) ||
>>           (!HAS_LLC(i915) && !IS_DG1(i915)))
>> -        wbinvd_on_all_cpus();
>> +        drm_clflush_sg(pages);
>
> And as noticed before, drm_clfush_sg still can call wbinvd_on_all_cpus 
> so are you just punting the issue somewhere else? How will it be 
> solved there?
>
Instead of calling an x86 asm directly, we are using what's available to 
use to make the driver more architecture neutral. Agreeing with Thomas, 
this solution falls within the "prefer range-aware clflush apis", and 
since some other generation platform doesn't support clflushopt, it will 
fall back to using wbinvd.
> Regards,
>
> Tvrtko
>
>>         sg_page_sizes = i915_sg_dma_sizes(pages->sgl);
>>       __i915_gem_object_set_pages(obj, pages, sg_page_sizes);
