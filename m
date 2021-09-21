Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D600A4129D4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 02:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C750A6E8B9;
	Tue, 21 Sep 2021 00:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA356E8B6;
 Tue, 21 Sep 2021 00:14:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="308810710"
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="308810710"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 17:14:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="518035246"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 20 Sep 2021 17:14:00 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 20 Sep 2021 17:13:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 20 Sep 2021 17:13:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 20 Sep 2021 17:13:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyS0+RMhZbgxiu/GXa9+Au6GJG+ryv0t+KjOinEDbLX8b6ATU5++oLOyRpkuLChjAK0IzJsPxsok7CnIk6C2O9q55ErM9rnP2TKTO8ZF97khxLZfmlUnO3ncy9cQCpiy67rnqpw/j+SpMbI68RS8HlwEEfy6GaqecLv/q3OqoIKzIrLZzb74mBxOE2lMs2lC2/q3/+0n9qdJzEWPb485inqFRt3HWt6yiHUOeY3fydaKcTYhLTIBqoGpUvAvuKGcdNzZ7+sJLHmNNapsvHN94n+RVnkZCI7GtBTd3abF8F3MKn5v4kDU23Wiacqae4LEnvRLtE3vS7/C0Lf2iZMxRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=lqwZV07PbTKzrjc8+VHrj+8zsGNAOwGdsliX/ySAr6o=;
 b=eeofXjMBgJwev0LOGEQSCGBbEFeRI0090jrVw/cS34hiwAvQoum+82PIutX50AqLAFqnSU2ylIJvQB/wj2u7FrJn2AyWfVEhzj/8oz7fLVaSm4BypQUgXfPSTQ2H2/Ir6DGqdh/GPrg3iSg+iwu5uISBq3YztvROlYnh8e1gUk98zna33ZQvlgpwPREE94n3dIggDrFX/EqJ4ZrH/PhK3ar12OrMpfxqAgdtJlQj3Q5FqpW+bIkYESah76AGQGKvY41NCERR+Q6wi4m6070/rpkpbxBxnKF3PRMMPbN1nbesxkPUYoh1on4VQBPcwqgiCr0y4GBJp27pFJ6PL4M7fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqwZV07PbTKzrjc8+VHrj+8zsGNAOwGdsliX/ySAr6o=;
 b=ffBI8+53lV+Hh/nyCHYhCtKAlucXElVW3IxM3aWkhQZ5an+AucnB7T7CkwdYtLnjj78ZO8X3JkTdoVuQoi9Iga62YqF3Boz2ZenSt1HrzrhcIAd1yZxgtGZ7jPkuAVnIT/LNzJMb4gOB2c6Ult1EssP+JkzUeYUjDxxM4g76I68=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5609.namprd11.prod.outlook.com (2603:10b6:510:e0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 00:13:58 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 00:13:58 +0000
Subject: Re: [Intel-gfx] [PATCH 21/27] drm/i915/doc: Update parallel submit
 doc to point to i915_drm.h
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-22-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <f0cb41ed-c69e-0aaa-68a7-4253b134d81a@intel.com>
Date: Mon, 20 Sep 2021 17:12:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20210820224446.30620-22-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR04CA0169.namprd04.prod.outlook.com
 (2603:10b6:303:85::24) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MW4PR04CA0169.namprd04.prod.outlook.com (2603:10b6:303:85::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 00:13:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc10b1ab-95f5-40d4-6382-08d97c94b460
X-MS-TrafficTypeDiagnostic: PH0PR11MB5609:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5609A88CCA07A60621F9C184BDA19@PH0PR11MB5609.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lTAh12aQ9QIsMt7Aq1Pm/cMIN/WsbMUpOSSJspwMknB/x6/qCe/I5wGZ2aA+NwMpnHoiIkw3tlBlDcfzAyIp9rVVNjt0nwIEDtUBgOHz1fKImFUaP7f9SylIH6DJu8qxOGjWzv84C7M56n+vUxsgq971VP3uWSaKgPOdMiY5n7TrLMFXOxLoruO/ssvNygoVT3KXaknAv2N4OpGVakaCfYPqDnI1+5d0wt5FcrrC7DCJzM/jIVq0C3z+zJrDLyHh5uTLEEFQDEJQjG9GsZkNqzgZsu9X96M0r3bkFW/F5W7IV+6xRu5bwJ0XuRTFEsP/tka0tIdNGqRniY7hOilU8zbmpiOF1e+RN9CYpw+RyJNELQshXOcu8L7MtX0qhYZ0S7iURG2yWnzAs8tMp4Idu1FEf+Q0W5rkcrR7QRcWYFwsmIHkjvw2tyRNIsTZApYmxZsbvMxUybvInV+k+6H1IBvB2HyDcwqOyCkfd4ABoXelbTvzW82G56gqNx+2TIW+5cbgqcF8KEoNZHbTLrRxns0MmN9KCygRwnzFDgL5qoXHIefE1vKE4Ko9mdU6cUlRQySvXfPP4kb1VVvXggmJmDlsaHFPnXMaNc+MWW34OPV8bLlQAkh90B0oZ1Sdjk4RgPEIR6O3XN9ZBWMde1UhfuloDlO39GSUiFzwUBjBSBlvyVaaZ+SsnmkNAAjAsUo1o1I/2JOBtUOloaTPpbPh89AkUchqpzoGZpe1iNmTF7H48y7zRUtMwvC5SStSgfDp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(36756003)(53546011)(107886003)(508600001)(26005)(15650500001)(31686004)(38100700002)(8936002)(956004)(83380400001)(8676002)(2616005)(66476007)(186003)(316002)(5660300002)(16576012)(66946007)(6486002)(31696002)(4326008)(86362001)(66556008)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3hFM1NRdW5lRGUzYnFxTmVrdFNXcE9TOU5yN1A1ZUxNcUlzNlhoWFdPelpG?=
 =?utf-8?B?VkVJZnUrZVZGdnRXZnl0Q2ZqRHE2N1l4YkVrWTZON0dibmxjY25vK2pkbFJM?=
 =?utf-8?B?bnd3YU92MXhDSVRqdGtNa08rT00wV1lrQzdpTmN0N29XVmlXMjVNWTFFOFJk?=
 =?utf-8?B?dWxMTkF0c3ZsdzdWRTBMZjEzNmtUL01WWGFXeHRTSDRVY3RjVHo4SXFIR3F1?=
 =?utf-8?B?d2djdkhRYkg2NFpCeGQ2Ynd1SjAxaXp1SXJSOEc4R0tBeVg3enVqeUZSR2Vh?=
 =?utf-8?B?dnRiQTl1VkdMQ1hzdTd1OUNvNUN3RkcyVjJwNEUwdEVBRXFJNWdvZ2tTZW16?=
 =?utf-8?B?R3VNZWFTeG13YXZWYklRenVuenNFWUlkbFZ6dVQ4SVlmZ1lrN0txR21pNTBD?=
 =?utf-8?B?OHgrQlB5QUlaVGRnajlIczlLbGdHRjhQcTNpalJ4WG1wRWZDRk04VDZHK0RZ?=
 =?utf-8?B?Z0xkUXc5U3RVdWtqYlY1UU1RbklIRll2THIzdEJWY243VEFBTEJLM05XQmdy?=
 =?utf-8?B?QklvZmcyM3N0dERCQ1drdW1YcHVKTGg1WnV2N2lqbnFpUnNjOWhRVlh2T01t?=
 =?utf-8?B?Tmt5WVFqTXptMGQrWEJXZTJuZXRhOUNERHpTa1puS290c1JqbktSWEFnZi96?=
 =?utf-8?B?K0ZCVDF0UnJER1M0MVpEdW5uRE05OW5PdVBnVmtCZlhlcStJS1NZRmZhbXIw?=
 =?utf-8?B?NXZFemQ2YmhqdW9FV1dHQjJwK1JDbW9pWDR4b1BCMGtXN2JJRWZRY1Vwd3Vo?=
 =?utf-8?B?N21CMFI2Z011R0Q2TmpocG1CZ3BVYXpQZEJSWHZBRXVSaXY5bXhicndNYmlw?=
 =?utf-8?B?Q0tkbmRPRnROdFdpaVFxek9pQlFLOTBOZjZ4ZzF1VGpScFFUYUkvWVZmVGtr?=
 =?utf-8?B?bWsza2p1QzFua3RGRHRUV0REcTN3N0s4MVhSVC9wN1l6L0NrVVVWV0ZqbjdC?=
 =?utf-8?B?VnlWYjkxcnNwdERXL0Y4NGU2ZHhvOXluVWozT3FzOXViYlFDZzNzSGhnclY3?=
 =?utf-8?B?VW5EUktVcFh2OGhBYldtY2RFMlRDZTNDQXc4eGVMRG03QU45UGZsQ1pFcGVt?=
 =?utf-8?B?ZGcyNDRmbWpWNVlnK2hUc1YyV29SdGpVdFA2cXVxRG1DczVvaXc2R2VNaGhK?=
 =?utf-8?B?QWU0TG1LaDJPQlU5TzA2QUw0VEUyeEFIbEVsZDZ0aGRQL2hyZ3VpYnRoZlRE?=
 =?utf-8?B?YXczY2VBOXZrTlZpR3FkUlFvNVIvQ0s3QndVQUUxU09PWnJUS003U1JJWFBH?=
 =?utf-8?B?ZUh6WnBzWHI0eE9uRkpqdlAwSi85SlJRNGFiKys2Q3VrUEV4MzgxdFRXTVJW?=
 =?utf-8?B?dm9JemEzZytTVU5NZkRPeDVkclFsb1JabHBxdmt0NTZnTnRmYXBHMllYTGxz?=
 =?utf-8?B?aWR5VjlMcnZIczdwUXJZSUdHelJjSWdlVFRZYm1PVnRlLzdHVDRLS1JONG9C?=
 =?utf-8?B?bFpWSFNJMmxOYllITjk3WVhDRUp5bWpTb2hhTC9qV0plYzg4Mi9jSDN1TXJq?=
 =?utf-8?B?a0Z6RXNOS3VnTjA4ZTI1SkJ3U2xDTlJmamRUZTNXSEFZanM4clY1ZEZOdWxY?=
 =?utf-8?B?RkkxTk85eFdvT1FIa0ptT3N3akNma2VERFkvNExWZGUwMmhZOXJra2ovcVFJ?=
 =?utf-8?B?UVNRUFhXeDRZSlF1dE9ZMU9HM25Fd2plaXVwSmJZdk5qR2FmT1psZ3hWeHJV?=
 =?utf-8?B?bGdmTEY5VDgwcG9xS0lBRnlUa04vbnZSaFRyRGJ1MWN3QlgrdklreEoxd0ND?=
 =?utf-8?Q?2/tIF/SkpQNU3UjoqE6dddIPq12NeZERKYk/HT6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc10b1ab-95f5-40d4-6382-08d97c94b460
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 00:13:57.4837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UG1D09xETqwlwLezaDKhFyePHKecqs47Tdj8j1Kj4KKaLnuR5I+m5ERMFGLfABDlHtAzw+kMluMX9uxAwzocy+lt/1D2ZfxXr8B5XCqFAWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5609
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/20/2021 15:44, Matthew Brost wrote:
> Update parallel submit doc to point to i915_drm.h
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


> ---
>   Documentation/gpu/rfc/i915_parallel_execbuf.h | 122 ------------------
>   Documentation/gpu/rfc/i915_scheduler.rst      |   4 +-
>   2 files changed, 2 insertions(+), 124 deletions(-)
>   delete mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
>
> diff --git a/Documentation/gpu/rfc/i915_parallel_execbuf.h b/Documentation/gpu/rfc/i915_parallel_execbuf.h
> deleted file mode 100644
> index 8cbe2c4e0172..000000000000
> --- a/Documentation/gpu/rfc/i915_parallel_execbuf.h
> +++ /dev/null
> @@ -1,122 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2021 Intel Corporation
> - */
> -
> -#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
> -
> -/**
> - * struct drm_i915_context_engines_parallel_submit - Configure engine for
> - * parallel submission.
> - *
> - * Setup a slot in the context engine map to allow multiple BBs to be submitted
> - * in a single execbuf IOCTL. Those BBs will then be scheduled to run on the GPU
> - * in parallel. Multiple hardware contexts are created internally in the i915
> - * run these BBs. Once a slot is configured for N BBs only N BBs can be
> - * submitted in each execbuf IOCTL and this is implicit behavior e.g. The user
> - * doesn't tell the execbuf IOCTL there are N BBs, the execbuf IOCTL knows how
> - * many BBs there are based on the slot's configuration. The N BBs are the last
> - * N buffer objects or first N if I915_EXEC_BATCH_FIRST is set.
> - *
> - * The default placement behavior is to create implicit bonds between each
> - * context if each context maps to more than 1 physical engine (e.g. context is
> - * a virtual engine). Also we only allow contexts of same engine class and these
> - * contexts must be in logically contiguous order. Examples of the placement
> - * behavior described below. Lastly, the default is to not allow BBs to
> - * preempted mid BB rather insert coordinated preemption on all hardware
> - * contexts between each set of BBs. Flags may be added in the future to change
> - * both of these default behaviors.
> - *
> - * Returns -EINVAL if hardware context placement configuration is invalid or if
> - * the placement configuration isn't supported on the platform / submission
> - * interface.
> - * Returns -ENODEV if extension isn't supported on the platform / submission
> - * interface.
> - *
> - * .. code-block:: none
> - *
> - *	Example 1 pseudo code:
> - *	CS[X] = generic engine of same class, logical instance X
> - *	INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> - *	set_engines(INVALID)
> - *	set_parallel(engine_index=0, width=2, num_siblings=1,
> - *		     engines=CS[0],CS[1])
> - *
> - *	Results in the following valid placement:
> - *	CS[0], CS[1]
> - *
> - *	Example 2 pseudo code:
> - *	CS[X] = generic engine of same class, logical instance X
> - *	INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> - *	set_engines(INVALID)
> - *	set_parallel(engine_index=0, width=2, num_siblings=2,
> - *		     engines=CS[0],CS[2],CS[1],CS[3])
> - *
> - *	Results in the following valid placements:
> - *	CS[0], CS[1]
> - *	CS[2], CS[3]
> - *
> - *	This can also be thought of as 2 virtual engines described by 2-D array
> - *	in the engines the field with bonds placed between each index of the
> - *	virtual engines. e.g. CS[0] is bonded to CS[1], CS[2] is bonded to
> - *	CS[3].
> - *	VE[0] = CS[0], CS[2]
> - *	VE[1] = CS[1], CS[3]
> - *
> - *	Example 3 pseudo code:
> - *	CS[X] = generic engine of same class, logical instance X
> - *	INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> - *	set_engines(INVALID)
> - *	set_parallel(engine_index=0, width=2, num_siblings=2,
> - *		     engines=CS[0],CS[1],CS[1],CS[3])
> - *
> - *	Results in the following valid and invalid placements:
> - *	CS[0], CS[1]
> - *	CS[1], CS[3] - Not logical contiguous, return -EINVAL
> - */
> -struct drm_i915_context_engines_parallel_submit {
> -	/**
> -	 * @base: base user extension.
> -	 */
> -	struct i915_user_extension base;
> -
> -	/**
> -	 * @engine_index: slot for parallel engine
> -	 */
> -	__u16 engine_index;
> -
> -	/**
> -	 * @width: number of contexts per parallel engine
> -	 */
> -	__u16 width;
> -
> -	/**
> -	 * @num_siblings: number of siblings per context
> -	 */
> -	__u16 num_siblings;
> -
> -	/**
> -	 * @mbz16: reserved for future use; must be zero
> -	 */
> -	__u16 mbz16;
> -
> -	/**
> -	 * @flags: all undefined flags must be zero, currently not defined flags
> -	 */
> -	__u64 flags;
> -
> -	/**
> -	 * @mbz64: reserved for future use; must be zero
> -	 */
> -	__u64 mbz64[3];
> -
> -	/**
> -	 * @engines: 2-d array of engine instances to configure parallel engine
> -	 *
> -	 * length = width (i) * num_siblings (j)
> -	 * index = j + i * num_siblings
> -	 */
> -	struct i915_engine_class_instance engines[0];
> -
> -} __packed;
> -
> diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
> index cbda75065dad..d630f15ab795 100644
> --- a/Documentation/gpu/rfc/i915_scheduler.rst
> +++ b/Documentation/gpu/rfc/i915_scheduler.rst
> @@ -135,8 +135,8 @@ Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
>   drm_i915_context_engines_parallel_submit to the uAPI to implement this
>   extension.
>   
> -.. kernel-doc:: Documentation/gpu/rfc/i915_parallel_execbuf.h
> -        :functions: drm_i915_context_engines_parallel_submit
> +.. kernel-doc:: include/uapi/drm/i915_drm.h
> +        :functions: i915_context_engines_parallel_submit
>   
>   Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
>   -------------------------------------------------------------------

