Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B48A98BF7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 15:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0908A10E6B0;
	Wed, 23 Apr 2025 13:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDRkAj//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B2310E6AF;
 Wed, 23 Apr 2025 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745416480; x=1776952480;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yUvHBhvuMi9QUPPr0JsiqBJ6gLxbOFcaGRWxrC3doDo=;
 b=PDRkAj//n3e505C7n5sM84icWy0oNmfOQ9YEnGilX5hS3vqkbKTpXWuP
 Hcj6fpruEREDN8kxs+C8C8sQjiImNbMpZkDov/mPZSvLzwyZ8frwsrM8L
 S+SoFOQz5amWDfZQgSakJkpSNjPi5ZcNgsCi3tKHrZmq9d0bec92m5BeN
 wCgHWTV4raj8U+HBVOCSC4fbUZTSjGhtW0ky1YRH2eDZsTp2DhePvTgN/
 B7lkIITpN1rjzldgSf3sDCJjaoC8TX0+qCIbXQ/7zktU90wy2IiEekUmy
 s35N2NgkIKltCYlp7k8N3XJdUsskox9LNnTKwZZLLdj6jV3aGvcCIKd5t g==;
X-CSE-ConnectionGUID: GbUyqTBVTPyoS4wLNX080g==
X-CSE-MsgGUID: RdVSm6C9S8m7HLzf2h6J8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="58000042"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="58000042"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 06:54:40 -0700
X-CSE-ConnectionGUID: Ty+mvIq8RGe7/NHVOU1gTA==
X-CSE-MsgGUID: vfw2Gi7/TbeFnXstpQiUTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132853326"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 06:54:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 06:54:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 06:54:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 06:54:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sM/UXtJi4JR2OxEMM7fWep1dVz+Wmri9VRKL8XbSuOlJILGrCpUIjqccNGYLfPF5CzeZq5pSgDaIurBxj8ugmnNhmxbG3/w2e9F1D6au3xwDnOempRZQIW7CWPb68yHEWddQ3AzzaR1AKw9zy8u9JO0DsyDBFi0CFZZJHcrzWcm2nvT8/bl/P8gTy1QduP7zUEQ5RCZBd5kVfn1psplgxQW+m4SLxNn1mQL5mo9z+Y4p5KWqPMqek2EzoQEZlHh2Jma1O56LBniAnkfbjEJ+exEGSqq/CAdy+V9nle12AVVNGQrQoySk0S8KMnSbVRS6RLsSd4zkduFXgOgYD91Shw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUvHBhvuMi9QUPPr0JsiqBJ6gLxbOFcaGRWxrC3doDo=;
 b=LNoMbDnj10scnOBeJmpDM7sKc8VhKwmapoPO1rEcXZ0xHddx8pZj/nQFGHcb2vsdH8cQWrRJbIc6WyTnjUjONJYvuiLuZshVaQZOAaxQLb4D93tsc3M0yPG1DYBp4favH5adQgV8YnGB96dk1VnM9cLXNhm3tjJFhlpVNaEtrXk0pmlUnWOtxSIdyRWPrvLfQrUQVlDZbHWbGEsG5qZwmzEu6iD7I59/rivA7JjRcTCA1L+Q4Igjpg96fv5h3kita2mrt9HMqfzs271K9PTbnJslBE7vXIaOiUcRBsnhGCLLNa9kFv/wLIwpdAEqxcdRW4HqAjsIog1R8NCXQfr8mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM3PPF027BB0053.namprd11.prod.outlook.com (2603:10b6:f:fc00::f05)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 13:54:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 13:54:21 +0000
Date: Wed, 23 Apr 2025 08:54:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Arshad Mehmood <arshad.mehmood@intel.com>, 
 Chris Wilson <chris.p.wilson@linux.intel.com>, Andi Shyti
 <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 0/6] Remove I915_ENGINE_FIRST_RENDER_COMPUTE
Message-ID: <dipidufa27npr5xjelj5l7wf3wjwveuhupepj7i3yvoecuhyp3@3d6evu34rf7i>
References: <20250326234005.1574688-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250326234005.1574688-1-andi.shyti@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0229.namprd04.prod.outlook.com
 (2603:10b6:303:87::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM3PPF027BB0053:EE_
X-MS-Office365-Filtering-Correlation-Id: ac356af8-4e88-4dd4-2284-08dd826e595e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZHwSB0r1rvohlHJ2Z5fXUMMvMuKYl3FhwI5hIpMpE5497fCTmrIJI/rIO8cI?=
 =?us-ascii?Q?bInz8iD3w6cCJelQ3AI1X1K1ZOBBQJXwlCA2cGKne/zG9qZHLj5dz/kpxLwS?=
 =?us-ascii?Q?4pfBh72jV/Zdk7NopFrkOVJDmmu8hO4Kq5it51pKV3BwbCjjvOaK2Rf0D/9I?=
 =?us-ascii?Q?46HdoqGdVSRjawGy9qdmyJZtVOCSTdYu6Vpo6kIAvIqz1cZKY9Fp5qGT27uc?=
 =?us-ascii?Q?wuxD33w9lCF7v/tYRMZ6/aQQZs7Wcy3hrdcXRwz8dqW2XSOAoZsI5a/0jgU+?=
 =?us-ascii?Q?g/tUqQ2ZPv0E77A3lXdJE6eiSUCT4bUb1D6mtVBWlyNTAyFC8BQk9u0aMYIy?=
 =?us-ascii?Q?9HQBai2/QW0jmzi8IBtCFvlt/khHJXkisEyqAjDZosyBXOXlWf4ewAmOb8c3?=
 =?us-ascii?Q?SRWVLqgdA2evC/PsF5QXMw9HGRZY/PzmTNH51X6nT0m6V4Y2yZqSKL6WvdUn?=
 =?us-ascii?Q?uEMkGGclNf3TlD1tz9MP8g5pNQOm0PFRVHOXD0NqhLbYty91bBwaqn2nx8Kh?=
 =?us-ascii?Q?2oOshIBzfSlpSejFq5WJ+S5sIoN/2L4i4omogmo8xGyv5cmAJTJo8i+GQsz+?=
 =?us-ascii?Q?9OIHDYDJS7N6aSxvJvLDxwc72s0tZi9KeagZG9wg4PIurrtDhPaijozRwu9F?=
 =?us-ascii?Q?dT+2R52lXr3XdqzCwfeMEh+QbLQSTlIzZEfe3v5vOBz4DSpE0E7VP4Ffyr0J?=
 =?us-ascii?Q?qHuNDQOGPWCIgZoZyfYRVU8i/X6pCqLlHWpzh6nnXGXTr0epsZ7xgtvaoYYY?=
 =?us-ascii?Q?lctb/EV6cdt/97g2160kFhq+wTSos/+EFU6IQebO8+zMpJs7c3j3kdOIs+k1?=
 =?us-ascii?Q?F6coenfnjGXUDIFjvaO06mPhW33i0tFb94qlKs4HKdindhhAtMYAx1Hdi1A2?=
 =?us-ascii?Q?yA3isFLyl7CJnVefS02l6y7GJz5suOnRvMCe3nsnu9lndzHwqASGtwJXi9xC?=
 =?us-ascii?Q?3CrFCG2ygI8zB61/A/bPz8ewT5XdiLZGTjudsZeoqxudssIxj3w2y/xkJihv?=
 =?us-ascii?Q?hCuCSE/r350BrJHGSkPSk4zsDMDCN9hn+cE36btzuxtbgnl8uOZWBqRnXn81?=
 =?us-ascii?Q?pSMzuru6Hx9WBm+q7jLNui7J/Ct/K1FCmClAvhgxXNOW3SeAZceCtbi9WBxV?=
 =?us-ascii?Q?7zSAC1PJkYLIbk6EN4qybpWL/td4RhLvvIXHw4EOBojKpkj7cP1edqtiR1F4?=
 =?us-ascii?Q?GoGz7NlExmaS7eWpAIoc+AgzemwzN7blG+WButnwPFJW46Kv1Qro2tJZYcqB?=
 =?us-ascii?Q?1nxY1o0/4Ib2z0Aj7RJrUnJ/d4IPYQGWsdRpQ3k7MWzdJlALlDqdLgsZain+?=
 =?us-ascii?Q?UnWl4F0rPi87tZgbMkDUH4Jl1fwNPGNVCIInS99LRa/nFS11rNotOq2MranI?=
 =?us-ascii?Q?83FMJooVVf0NtJ9nlFr2nIxvNcGCrFXd+07kTMwIvM4BYeqBQq6+vxARv7Hy?=
 =?us-ascii?Q?+uOatnH933k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nRPqDtHQ0GMfkhT09Nb3MSJEWjOuhk/5uWxP8FPxmUwtwaLytEHDEPLTiSxL?=
 =?us-ascii?Q?OKJNm9g7vXpOil7ObCtmtSjlOXKu3ZbV3i4dhjvzP3W1MCVKDlobLbK357GU?=
 =?us-ascii?Q?x05JJ0uRysqppkpONRvmWoaktx7r37u7vW31E6XdI+FI5sJf6k8FtCkXKGIl?=
 =?us-ascii?Q?PoDawgf1RpsfeoUDXUzdOa7SZcG6vfWRnxy4bCqPNoh0M8+1+HXn4DPMHj+7?=
 =?us-ascii?Q?OgfPjbnAAi0Yz0xPz+1QRIbjKnoCVlqLtbTcko8kNqw+EQhrMqMizftLqq6y?=
 =?us-ascii?Q?P9yyip7g1drOenn+ghxzQOhy0SkRKLQSce1SiGlF7xHrJxsDO03vBhTL4h3E?=
 =?us-ascii?Q?6G1V4guPJXTOBHSOV+cQ1hplcXS6iNCz1av8hBBU8Al3nnwuyRGaHgi7V/yH?=
 =?us-ascii?Q?ANhNOs3Me4R+3US4WsIiFOHNxwKQrcRce4h1/hCSI7GfDTElMfhO82D1HlE5?=
 =?us-ascii?Q?WYLgLg5qQGCLX7drYFlo0pCX07+CQqU4PweN0Hxw3vXBXHWiX5mwkwb30vN0?=
 =?us-ascii?Q?t/tv33yzwd1qFV9/zMP0/sk/SW83Gu/5cAfu7cDpTf3CUDQPVUvX95Tmrk5I?=
 =?us-ascii?Q?EQa0OHO19wPjpt/uJKXDTjMp+vEl2cCgvvE495ZrBhDH4T+0WbX7NAu0aVcQ?=
 =?us-ascii?Q?rCcIlWl6oWI/rfiLC0x2Dh2PY2qVxfqh0pbjzW55sA+2vk+eca5oBIEEsnHL?=
 =?us-ascii?Q?AHS4ojw5jrqhAFahjaPq3Nu9TFgin6hobZEO9x6O6TgweL+d14tKKsL7N1SL?=
 =?us-ascii?Q?w7fpb0CO0YMAKGZnguST/eMZya8vJGdcw8zgT74By+ti1+zPWV9lb521Rrav?=
 =?us-ascii?Q?hi+mh1jzqwMWewcT/uR1crbY8hYO/V4tnyy5ySwuXxhYCKAK7jGa/UDD4Ze5?=
 =?us-ascii?Q?k8LmnxjFUVoMesnr621U6ryDBn4Z05EXLKtHpgqPw1RwXejfZAUJ1Y7ffRZh?=
 =?us-ascii?Q?kf6efDzq8VHJeJ02QqfjzaHHwku4b9ct6o6GOUwULdUhQmAs8eYOYGPUBqAt?=
 =?us-ascii?Q?H3nsQL1yFvMCA60ENMzGWnushutjKtLK4xzgcbI4SFxLuCqMWe8RCMtdhFlS?=
 =?us-ascii?Q?9fwpdn8x/UrjaTzxJmVOmDSXGiufjgznHhiRx0DuhSNEk/+7s7aOwUmx/PwJ?=
 =?us-ascii?Q?ENoN115Pgk44ZhIPQLFskU7cY7JOYmtD6DFN1bwqfzQZed050Y5zv/wNuBHq?=
 =?us-ascii?Q?1Hba6F15HAKnO7LlJ49vpZCQ5XLop7Vl60qEMBSxNSTjv00B6DzFNurTware?=
 =?us-ascii?Q?9HBa+uodQSS4cVJHFy1Oozh9sOUDiOBUhC2L+BdhxxeBTCf2Nfw3uyYBlLEK?=
 =?us-ascii?Q?UJraUQBZmFqYSwi+EgyQXASpWeJjf4jWXu4bi3bBP7RvHoPzSavPfshlhv8v?=
 =?us-ascii?Q?ZnxZDx0co/E9W1h8VrdOC++FtAB9fn4V/CYMVfroQosO8eNvmJ+BykrWt6lx?=
 =?us-ascii?Q?d4BpxPwmE01QUAJ3ve3uAUpq5itNP/ajM1m1YgJyWSX4owRVvIscixch4aZz?=
 =?us-ascii?Q?12rhOPocqu77IL1C4SWkO3l/k7o2tLx9zaSTPnlHI5C0njClV6DP5tcRifNk?=
 =?us-ascii?Q?m2CjLPEoOQ8P76yBk/SH05E7BSnCckJpjyVUeCGJ+QsNeIjIzc8uGNYdwDop?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac356af8-4e88-4dd4-2284-08dd826e595e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 13:54:21.6547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8CU50Ltlmzmq8Hc0xOq5tdPwCk72ewTLUWn36jHwmjPaeJSJqBtDY1iij7klutBY86q8GfEVbWiMqtHFnO4gRQWrLXUaALhlEmENgck288=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF027BB0053
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

On Thu, Mar 27, 2025 at 12:39:59AM +0100, Andi Shyti wrote:
>Hi,
>
>While testing the multi-CCS static load balancing, Arshad
>discovered that the CCS workaround was being applied twice, due
>to commit [*].
>
>Further discussions with Lucas led to rethinking the purpose of
>I915_ENGINE_FIRST_RENDER_COMPUTE. This flag was originally
>introduced to handle platforms with different CCS/RCS setups.
>However, for all GPUs currently supported by i915, we can assume
>the presence of at least one RCS engine, so the logic can shift
>to focus on the first CCS engine.

Not sure I follow this... The WAs in "first render or compute" are for
things that are shared between RCS and CCS in the hardware. Why are
shifting the focus to "first CCS engine" when that one can be fused
off/unavailable rather then doing the simple "always do these WAs in the
RCS since that one is always available". And yes, if unofficial support
for PVC is desired, then that can't be done, but shifting it to be
always on CCS would be wrong too.

Lucas De Marchi
