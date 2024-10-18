Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0462C9A4754
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 21:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F91F10E976;
	Fri, 18 Oct 2024 19:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lrb/+I0a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1A510E976
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 19:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729280801; x=1760816801;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=43r3Plb/OSKSw4ykbfNQRHqfkJxfYDG0K3esCt6GIdI=;
 b=Lrb/+I0aPmb9493q3UZQ6kmn6qhvGPOHtGwYdD1fmPbDjIj81Svnk9HZ
 BcgeMPIPTrfLtI2+Iu6zYWcejBJUbcSwLcjgO2VCJeL2/9Oa/DHVtNqpT
 5bY3HLkHaFbBJ14qo/50TlrOZr3fcyHRgFI5eCwvI9IIzBW3NB0SpwruU
 UygsU/RErjyGPI+kBIdn8u30NMIVArJnqhvB5aO0MD2yTp1NkIEEldzBB
 +6Ee8fy+lTEhHayH5RU+uXFSz7anTP58vbbYZgbAqmcpAe1MD75P7tfXP
 S5lsg16f2NgI5QcUjim1btbp00SDVgx71dB7/R8Yhzleiuyx61ALyzQyE w==;
X-CSE-ConnectionGUID: UGr3UGSjR7KLrCDX+TlcjQ==
X-CSE-MsgGUID: Ba4ssq7FRACIzQLNO/9ojQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28707020"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28707020"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 12:46:41 -0700
X-CSE-ConnectionGUID: CT+G2imhQ/6hmQCJUwbqLQ==
X-CSE-MsgGUID: 9IxShbf0Qc+c8rRFkDQFSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="83536222"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 12:46:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 12:46:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 12:46:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 12:46:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 12:46:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8UvQhsqkyIRJlxR+ltZHAsvusnVHdaRAd3Cv+PBT4KC7LPFrHMUWK0VSwAD9x875jAp/ua2k8+9oilRxmbKHwCVA/Gd1dk7HH2IQtrebQE6RhyFLfC7GbzZ9Bm8dZhACq9/fkkwUedA5MWkXkISItdkmvaNaLOAWeWZdlVg86AXUTLTV7T69FCsMEK+VxOtIC3aVEMhH3lvAEJN2MFe+GNLYOpkNLF1OdDPgr9f6tQ4F4Hzjz4DD1SDiVspTTPmh6Wr9fxfgHsDXkHJxCI7zrViTWY/76ldDp9IlX3Hqvfz/zpPs6LV36wbWo7t2LMEYKgp2TLnJGTCmI5iEKs8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGR8O7O2BuYGXUv3RmZSOIGRoGgfDYnQkbfp20NGcbc=;
 b=uwSHLBWVjzwGzeoWSerMTzCnYlPIZh96PWhPojI3SWIdFFX2c4O0O48vIao1J4P8Yw6MAkTbjCuLqzPz3yaf4hoW4qqGiV/Ia+Tc8Aztj3cvk4M6Ga+a7MRXWYKr5h6rf4Eb9k9LPMcKVisvvmroiRNtpR0dIaqd9QQBZE22UOIEymz8CNY2XTPyd3cAOZhrVB0TrJyPRUxxBRzUE+SuTG+MnxWWxX52x7re7JA54YBLK3MVaf7o5RtTduq223jaPAD4JT59s5PKcd2PXfbsyWqwVaPPqWAVJDmdV41q5DmkebycbWanQk5zL4fK63N6sBYSiZXDo2loMFbERxtF/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYXPR11MB8709.namprd11.prod.outlook.com (2603:10b6:930:dd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Fri, 18 Oct
 2024 19:46:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 19:46:34 +0000
Date: Fri, 18 Oct 2024 14:46:31 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Ingo
 Molnar" <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Umesh
 Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, Ian Rogers
 <irogers@google.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 3/5] perf: Add pmu get/put
Message-ID: <qtivtftbdvarukcxdr4yfwstzvnh4z7eipukwxymi4e2x76y54@dxqn3y22u2pw>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
 <20241008183501.1354695-4-lucas.demarchi@intel.com>
 <20241014173246.GI16066@noisy.programming.kicks-ass.net>
 <lunkl4llip7aafnyctwztggum37wsiznktb7z3ly73batmt6bu@m75kow4b4u6y>
 <20241014192519.GN16066@noisy.programming.kicks-ass.net>
 <20241016120302.GP33184@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241016120302.GP33184@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: MW4PR04CA0058.namprd04.prod.outlook.com
 (2603:10b6:303:6a::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYXPR11MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b7b709-e6b1-4d47-e675-08dcefad9223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O+l7yufo8YXCYv9VcvTrPn1vhX+594g8PGJQ54Dq339VsEqzi9WHIUaMNQrW?=
 =?us-ascii?Q?foYpWshYJgzdz6y+QFqYLn6I9ih0033vpn68GjzD/gSMvzasP6r6UbmPSt/X?=
 =?us-ascii?Q?Vd66ekzbrwMknDktBVniGrfSPQY4KYR9N5lGBweTy4i+M++zpmP3rgWVWtSl?=
 =?us-ascii?Q?fVb/67tTwDpRy6ItpIgJ1FZ0/HYD17XZpsoQ2EdnCiOaz8BkPkABP+wQHosY?=
 =?us-ascii?Q?9+0OdEvMxE4Jwx9DvKcQmfG5pgFSykr+mQeRkIy3/2Qr4TREwTGSaoG8zm5A?=
 =?us-ascii?Q?+edqDJkuYTPOczoLxOdXuyYuQLCjdcJz3pPSM4bnBNNifnRSj4mog2z0xVyP?=
 =?us-ascii?Q?+CfSlfK0489ngpSYls8CpJZ5VoFxBW1cHgtfMRYUhacYp+tcl2OtqEJFIDlN?=
 =?us-ascii?Q?nHyq2tlqWpaIyy+NpHsgjmpVYkFRlFCeGGnklrJLo0k/MX9MTPTpi30rvtop?=
 =?us-ascii?Q?Le1z1nwya+oUxcikWgc/tUfHthKn9LlxdnmB5OpqpRPU6LdCzpCcE/s3GOjQ?=
 =?us-ascii?Q?vxFcxboOdbYoyhso6eZMi8CVBG+NaXgPzoX2WiOx5VqJWMCB1qVGAbDXp4Tz?=
 =?us-ascii?Q?zBNoT2W78I3HaC1WAh1uSICoy0m1vCll5k8gneRYSKcYxt2b5uSfacSZ64dN?=
 =?us-ascii?Q?H/bY7HjsYJBihE19eP9gjTjL7A8VJD+5OKl8T4ZC3BPbflf4gLnXozZPDXSO?=
 =?us-ascii?Q?hSZx+r+Cr1JiCRA8M0mguMHdRmZSBM0Yp1Yf600R+Hcd35cYGP8N46Fx/miF?=
 =?us-ascii?Q?2Ojb0Le0cJltmiBTf5cbuXNU0mqtyxpolR18LS7x3cVMd2zljW96ryFd26DF?=
 =?us-ascii?Q?LUIUuV7sok9ckaz7DV741wxlQo+v837zXsqYGDbQgF9i0ypW+DnG+u+uLOt3?=
 =?us-ascii?Q?U44zjfIQ1ojlsrUjk68VD4UpqFeIj0H0xIuIBzBiGMam/VbgrZr9XEtUoMvG?=
 =?us-ascii?Q?y1EreTrpzUAQeXTURBkca1UJyJJTTOOGBlsvbSek5wV8rWfYeXbXrRMlsxd0?=
 =?us-ascii?Q?3IH0BRTofGV2g4FDwn7Ia99C39bsENJE+mKxk3Oo1K1EifpFEHWHX97S+Myy?=
 =?us-ascii?Q?O5bWu+hDxfjJL4jc1J9rrFsbxP9C69WgduUilfpkfsdvvV3DpQYiMNVrIqoJ?=
 =?us-ascii?Q?PwafX8inirmUWoev2XOqA6b2VhuXP3+1XoPqKptutuctofncSUf7Pp/MNxnp?=
 =?us-ascii?Q?GricPBjGgYxKgaf10cjS5sb2J2aYPkMEN+Qs5pf+IpDKyiK2keDNFznQUYUY?=
 =?us-ascii?Q?mHk79RWCmZEA8+L/J3t/JsRAybxIw41LZSo5pvc6/tG2CtFdcY0JlsMyuSNd?=
 =?us-ascii?Q?CYvvWWT/CYSxOiNgZ9IP90Z9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lk12T7wmoJhCYgCm9kAu/JTLeYUE1otiukpLaoWSxQswxDxinyyPYOJHnIkj?=
 =?us-ascii?Q?+KMJ+yA/ceqUvXJ0AD4XUz/p9edPIYDiHRS49mEBpy2NRx9EPiZvwjUec6O/?=
 =?us-ascii?Q?VSGG67XZr6fr1WPLr7ndNSjqy5NEvsbwDn0Ambe9knctZFiIctT/IkZ9BMDc?=
 =?us-ascii?Q?KuYfQeLcd0mexCJOzPlvmpHS7hZ3KYKMwhObBTJzF0j0HWiEgbvf/0XrZwRG?=
 =?us-ascii?Q?5xWCX3hP0R45RKqt5nk4sWPpnBY6hKjMU9VySfTauQI/u4jND24N9enc9Jmv?=
 =?us-ascii?Q?N0Q4dsjoBaWeWRnP6wXg5pgDDPUjX2Gx9MepTQbXahg4hFRNcrPlYSqhV2RB?=
 =?us-ascii?Q?ncZ0uN8KCL8Pu/f/cpV0246AZqQPUkFg4ieeJj+PVkzgqiDT8G1+XdyBezbN?=
 =?us-ascii?Q?MiS7COhTqXMzldUSC9CEDyjNVhl9oefh6qS56Qdy5Nc8mbzS5QxSkuiCJsrN?=
 =?us-ascii?Q?q7RBLggReWE+ftwa8PJg/c4aUb1nY7iLZC5G/91U8qA5R5qn6pJi9yTezH9T?=
 =?us-ascii?Q?Sg45QUPiB+Qvj+3UjD/PvZCGLwbrTwCm6GvXRLRemVKn2hCcnrL1l5zgX1VJ?=
 =?us-ascii?Q?ktXRz3JWEzuKsvtQpkAPHdA26nvUzjTXiCQa3SdfZCUtvMLdxCL/1I09L758?=
 =?us-ascii?Q?l1zlt2YDW0qd5SdSAyZgu0+gfWwuQkD4Q0fHFu63q8HCYZFQ9UzwkzKCWgUi?=
 =?us-ascii?Q?xj6WVHNWcu+3WEhmw6dNHD1/wyuUugKEEFVsR8wwUXM3oduovQmVZ+25LY3U?=
 =?us-ascii?Q?bwp79675t2nJsx36AqQL0yocm3tm8a8N/LNeJEXuW7QlB4x0CsxHvbzvNHjR?=
 =?us-ascii?Q?7WYnaXv5CQojm5s6FE8JbGR6Lfmag4+sHGXLl25c2xZBP99zQJjPykx8ykTQ?=
 =?us-ascii?Q?2FqKkrbxwFKh7A9a5xiQjPWE1Dku8Kh50j53wscxcHzIDzXpqOD596Z4jwEm?=
 =?us-ascii?Q?mD98moQwvTnAxuvV59kfKNoXKXLqPe/fA8sVf+4I+hVjUqbn1jFD6D2Plk8+?=
 =?us-ascii?Q?d3wTWwikHgi4HcZhBa4ZFtGYhm9rmKxnjgIaVCd/E68qRRPnDTRoiHkBH9GJ?=
 =?us-ascii?Q?rr4niLc+956um+irf2iBD4wZRgANQvNJi8gtqGpaniALUI5w3Crcf8FNTuLd?=
 =?us-ascii?Q?+dbkHG2U0WTcEeiLDTaSc75+PznBR2dsEnnZKfaUlh+P0MlWMcCMisB/7vTh?=
 =?us-ascii?Q?hbNmM7vADYcocoE1hSgrPdCMCINx8MyIF7eXkfroqPHhxuvstw/Ij71oUQUB?=
 =?us-ascii?Q?ctnH2cIVzl695eZYNJWtf8fT4iQLnaTUSkCWSxms1tGrOQIz3KEoCs2WwBWK?=
 =?us-ascii?Q?gBO0qg67XvvpGQBnoKEq+0BMxmt6yyfB9PBRwfGUJu4hAdCC+kB/gHmeJaC1?=
 =?us-ascii?Q?8cgjhd2M/5RDkluhXTHVxr8+1jZmSHI+9nXYYcuSlq5ktegXcWy+xfqVwJ9l?=
 =?us-ascii?Q?5HPEIHMt0E4zqyDKcHEWd+4X1GyKZ03n8IxwK3+lxXnzSdBdgsr17ukENfDa?=
 =?us-ascii?Q?aaaIQnTRi9QUo3Pz0oCmpcslWE37fgg3UCrse8JQzSGsgv2/iQmAWtKg4DSu?=
 =?us-ascii?Q?YDzA5XOoxlwSIu7aR6NEj+p9nYhgyqOOuiyYlKYL9sHboar8iZH4DnubTquO?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b7b709-e6b1-4d47-e675-08dcefad9223
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 19:46:34.1716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGJXcbd3QMnsenf479KY89Ja52BKSmbUnwLQXdLSx5/BTTunVphxUe0T/zfkBuPfE8Tln8lX0tj33poZLjafB24iXpa+ZoVizhENTu8CkSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8709
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

On Wed, Oct 16, 2024 at 02:03:02PM +0200, Peter Zijlstra wrote:
>On Mon, Oct 14, 2024 at 09:25:19PM +0200, Peter Zijlstra wrote:
>
>> Let me ponder that a little bit.
>
>So I did the thing on top of the get/put thing that would allow you to
>get rid of the ->closed thing, and before I was finished I already hated
>all of it :-(
>
>The thing is, if you're going to the effort of adding get/put and
>putting the responsibility on the implementation, then the ->closed
>thing is only a little extra ask.
>
>So... I wondered, how hard it would be for perf_pmu_unregister() to do
>what you want.
>
>Time passed, hacks were done...
>
>and while what I have is still riddled with holes (more work is
>definitely required), it does pass your dummy_pmu test scipt.
>
>I'll poke at this a little longer. Afaict it should be possible to make
>this good enough for what you want. Just needs more holes filled.
>
>---
> include/linux/perf_event.h |  13 ++-
> kernel/events/core.c       | 260 ++++++++++++++++++++++++++++++++++++++-------
> 2 files changed, 228 insertions(+), 45 deletions(-)
>
>diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
>index fb908843f209..20995d33d27e 100644
>--- a/include/linux/perf_event.h
>+++ b/include/linux/perf_event.h
>@@ -318,6 +318,9 @@ struct perf_output_handle;
> struct pmu {
> 	struct list_head		entry;
>
>+	spinlock_t			events_lock;
>+	struct list_head		events;

oh... I looked at several lists and was wondering which one would
contain the events of our pmu. Now I see we didn't have that :)

>+
> 	struct module			*module;
> 	struct device			*dev;
> 	struct device			*parent;
>@@ -612,9 +615,10 @@ struct perf_addr_filter_range {
>  * enum perf_event_state - the states of an event:
>  */
> enum perf_event_state {
>-	PERF_EVENT_STATE_DEAD		= -4,
>-	PERF_EVENT_STATE_EXIT		= -3,
>-	PERF_EVENT_STATE_ERROR		= -2,
>+	PERF_EVENT_STATE_DEAD		= -5,
>+	PERF_EVENT_STATE_REVOKED	= -4, /* pmu gone, must not touch */
>+	PERF_EVENT_STATE_EXIT		= -3, /* task died, still inherit */
>+	PERF_EVENT_STATE_ERROR		= -2, /* scheduling error, can enable */
> 	PERF_EVENT_STATE_OFF		= -1,
> 	PERF_EVENT_STATE_INACTIVE	=  0,
> 	PERF_EVENT_STATE_ACTIVE		=  1,
>@@ -853,6 +857,7 @@ struct perf_event {
> 	void *security;
> #endif
> 	struct list_head		sb_list;
>+	struct list_head		pmu_list;
>
> 	/*
> 	 * Certain events gets forwarded to another pmu internally by over-
>@@ -1103,7 +1108,7 @@ extern void perf_aux_output_flag(struct perf_output_handle *handle, u64 flags);
> extern void perf_event_itrace_started(struct perf_event *event);
>
> extern int perf_pmu_register(struct pmu *pmu, const char *name, int type);
>-extern void perf_pmu_unregister(struct pmu *pmu);
>+extern int perf_pmu_unregister(struct pmu *pmu);
>
> extern void __perf_event_task_sched_in(struct task_struct *prev,
> 				       struct task_struct *task);
>diff --git a/kernel/events/core.c b/kernel/events/core.c
>index cdd09769e6c5..e66827367a97 100644
>--- a/kernel/events/core.c
>+++ b/kernel/events/core.c
>@@ -2406,7 +2406,9 @@ ctx_time_update_event(struct perf_event_context *ctx, struct perf_event *event)
>
> #define DETACH_GROUP	0x01UL
> #define DETACH_CHILD	0x02UL
>-#define DETACH_DEAD	0x04UL
>+#define DETACH_EXIT	0x04UL
>+#define DETACH_REVOKE	0x08UL
>+#define DETACH_DEAD	0x10UL
>
> /*
>  * Cross CPU call to remove a performance event
>@@ -2421,6 +2423,7 @@ __perf_remove_from_context(struct perf_event *event,
> 			   void *info)
> {
> 	struct perf_event_pmu_context *pmu_ctx = event->pmu_ctx;
>+	enum perf_event_state state = PERF_EVENT_STATE_OFF;
> 	unsigned long flags = (unsigned long)info;
>
> 	ctx_time_update(cpuctx, ctx);
>@@ -2429,16 +2432,22 @@ __perf_remove_from_context(struct perf_event *event,
> 	 * Ensure event_sched_out() switches to OFF, at the very least
> 	 * this avoids raising perf_pending_task() at this time.
> 	 */
>-	if (flags & DETACH_DEAD)
>+	if (flags & DETACH_EXIT)
>+		state = PERF_EVENT_STATE_EXIT;
>+	if (flags & DETACH_REVOKE)
>+		state = PERF_EVENT_STATE_REVOKED;
>+	if (flags & DETACH_DEAD) {
> 		event->pending_disable = 1;
>+		state = PERF_EVENT_STATE_DEAD;
>+	}
> 	event_sched_out(event, ctx);
> 	if (flags & DETACH_GROUP)
> 		perf_group_detach(event);
> 	if (flags & DETACH_CHILD)
> 		perf_child_detach(event);
> 	list_del_event(event, ctx);
>-	if (flags & DETACH_DEAD)
>-		event->state = PERF_EVENT_STATE_DEAD;
>+
>+	event->state = state;
>
> 	if (!pmu_ctx->nr_events) {
> 		pmu_ctx->rotate_necessary = 0;
>@@ -4508,7 +4517,8 @@ static void perf_event_enable_on_exec(struct perf_event_context *ctx)
>
> static void perf_remove_from_owner(struct perf_event *event);
> static void perf_event_exit_event(struct perf_event *event,
>-				  struct perf_event_context *ctx);
>+				  struct perf_event_context *ctx,
>+				  bool revoke);
>
> /*
>  * Removes all events from the current task that have been marked
>@@ -4535,7 +4545,7 @@ static void perf_event_remove_on_exec(struct perf_event_context *ctx)
>
> 		modified = true;
>
>-		perf_event_exit_event(event, ctx);
>+		perf_event_exit_event(event, ctx, false);
> 	}
>
> 	raw_spin_lock_irqsave(&ctx->lock, flags);
>@@ -5121,6 +5131,7 @@ static bool is_sb_event(struct perf_event *event)
> 	    attr->context_switch || attr->text_poke ||
> 	    attr->bpf_event)
> 		return true;
>+
> 	return false;
> }
>
>@@ -5321,6 +5332,8 @@ static void perf_pending_task_sync(struct perf_event *event)
>
> static void _free_event(struct perf_event *event)
> {
>+	struct pmu *pmu = event->pmu;
>+
> 	irq_work_sync(&event->pending_irq);
> 	irq_work_sync(&event->pending_disable_irq);
> 	perf_pending_task_sync(event);
>@@ -5330,6 +5343,7 @@ static void _free_event(struct perf_event *event)
> 	security_perf_event_free(event);
>
> 	if (event->rb) {
>+		WARN_ON_ONCE(!pmu);
> 		/*
> 		 * Can happen when we close an event with re-directed output.
> 		 *
>@@ -5349,12 +5363,16 @@ static void _free_event(struct perf_event *event)
> 			put_callchain_buffers();
> 	}
>
>-	perf_event_free_bpf_prog(event);
>-	perf_addr_filters_splice(event, NULL);
>-	kfree(event->addr_filter_ranges);
>+	if (pmu) {
>+		perf_event_free_bpf_prog(event);
>+		perf_addr_filters_splice(event, NULL);
>+		kfree(event->addr_filter_ranges);
>+	}
>
>-	if (event->destroy)
>+	if (event->destroy) {
>+		WARN_ON_ONCE(!pmu);
> 		event->destroy(event);
>+	}
>
> 	/*
> 	 * Must be after ->destroy(), due to uprobe_perf_close() using
>@@ -5363,8 +5381,10 @@ static void _free_event(struct perf_event *event)
> 	if (event->hw.target)
> 		put_task_struct(event->hw.target);
>
>-	if (event->pmu_ctx)
>+	if (event->pmu_ctx) {
>+		WARN_ON_ONCE(!pmu);
> 		put_pmu_ctx(event->pmu_ctx);
>+	}
>
> 	/*
> 	 * perf_event_free_task() relies on put_ctx() being 'last', in particular
>@@ -5373,8 +5393,14 @@ static void _free_event(struct perf_event *event)
> 	if (event->ctx)
> 		put_ctx(event->ctx);
>
>-	exclusive_event_destroy(event);
>-	module_put(event->pmu->module);
>+	if (pmu) {
>+		exclusive_event_destroy(event);
>+		module_put(pmu->module);
>+		scoped_guard(spinlock, &pmu->events_lock) {
>+			list_del(&event->pmu_list);
>+			wake_up_var(pmu);
>+		}
>+	}
>
> 	call_rcu(&event->rcu_head, free_event_rcu);
> }
>@@ -5492,7 +5518,11 @@ int perf_event_release_kernel(struct perf_event *event)
> 	 * Thus this guarantees that we will in fact observe and kill _ALL_
> 	 * child events.
> 	 */
>-	perf_remove_from_context(event, DETACH_GROUP|DETACH_DEAD);
>+	if (event->state > PERF_EVENT_STATE_REVOKED) {
>+		perf_remove_from_context(event, DETACH_GROUP|DETACH_DEAD);
>+	} else {
>+		event->state = PERF_EVENT_STATE_DEAD;
>+	}
>
> 	perf_event_ctx_unlock(event, ctx);
>
>@@ -5803,7 +5833,7 @@ __perf_read(struct perf_event *event, char __user *buf, size_t count)
> 	 * error state (i.e. because it was pinned but it couldn't be
> 	 * scheduled on to the CPU at some point).
> 	 */
>-	if (event->state == PERF_EVENT_STATE_ERROR)
>+	if (event->state <= PERF_EVENT_STATE_ERROR)
> 		return 0;
>
> 	if (count < event->read_size)
>@@ -5842,8 +5872,14 @@ static __poll_t perf_poll(struct file *file, poll_table *wait)
> 	struct perf_buffer *rb;
> 	__poll_t events = EPOLLHUP;
>
>+	if (event->state <= PERF_EVENT_STATE_REVOKED)
>+		return EPOLLERR;
>+
> 	poll_wait(file, &event->waitq, wait);
>
>+	if (event->state <= PERF_EVENT_STATE_REVOKED)
>+		return EPOLLERR;
>+
> 	if (is_event_hup(event))
> 		return events;
>
>@@ -6013,7 +6049,7 @@ static inline int perf_fget_light(int fd, struct fd *p)
> }
>
> static int perf_event_set_output(struct perf_event *event,
>-				 struct perf_event *output_event);
>+				 struct perf_event *output_event, bool force);
> static int perf_event_set_filter(struct perf_event *event, void __user *arg);
> static int perf_copy_attr(struct perf_event_attr __user *uattr,
> 			  struct perf_event_attr *attr);
>@@ -6023,6 +6059,9 @@ static long _perf_ioctl(struct perf_event *event, unsigned int cmd, unsigned lon
> 	void (*func)(struct perf_event *);
> 	u32 flags = arg;
>
>+	if (event->state <= PERF_EVENT_STATE_REVOKED)
>+		return -ENODEV;
>+
> 	switch (cmd) {
> 	case PERF_EVENT_IOC_ENABLE:
> 		func = _perf_event_enable;
>@@ -6065,10 +6104,10 @@ static long _perf_ioctl(struct perf_event *event, unsigned int cmd, unsigned lon
> 			if (ret)
> 				return ret;
> 			output_event = fd_file(output)->private_data;
>-			ret = perf_event_set_output(event, output_event);
>+			ret = perf_event_set_output(event, output_event, false);
> 			fdput(output);
> 		} else {
>-			ret = perf_event_set_output(event, NULL);
>+			ret = perf_event_set_output(event, NULL, false);
> 		}
> 		return ret;
> 	}
>@@ -6472,6 +6511,7 @@ static void perf_mmap_close(struct vm_area_struct *vma)
> 	unsigned long size = perf_data_size(rb);
> 	bool detach_rest = false;
>
>+	/* FIXIES vs perf_pmu_unregister() */
> 	if (event->pmu->event_unmapped)
> 		event->pmu->event_unmapped(event, vma->vm_mm);
>
>@@ -6591,7 +6631,15 @@ static int perf_mmap(struct file *file, struct vm_area_struct *vma)
> 	unsigned long vma_size;
> 	unsigned long nr_pages;
> 	long user_extra = 0, extra = 0;
>-	int ret = 0, flags = 0;
>+	int ret, flags = 0;
>+
>+	ret = security_perf_event_read(event);
>+	if (ret)
>+		return ret;
>+
>+	/* XXX needs event->mmap_mutex? */
>+	if (event->state <= PERF_EVENT_STATE_REVOKED)
>+		return -ENODEV;
>
> 	/*
> 	 * Don't allow mmap() of inherited per-task counters. This would
>@@ -6604,10 +6652,6 @@ static int perf_mmap(struct file *file, struct vm_area_struct *vma)
> 	if (!(vma->vm_flags & VM_SHARED))
> 		return -EINVAL;
>
>-	ret = security_perf_event_read(event);
>-	if (ret)
>-		return ret;
>-
> 	vma_size = vma->vm_end - vma->vm_start;
>
> 	if (vma->vm_pgoff == 0) {
>@@ -6810,6 +6854,9 @@ static int perf_fasync(int fd, struct file *filp, int on)
> 	struct perf_event *event = filp->private_data;
> 	int retval;
>
>+	if (event->state <= PERF_EVENT_STATE_REVOKED)
>+		return -ENODEV;
>+
> 	inode_lock(inode);
> 	retval = fasync_helper(fd, filp, on, &event->fasync);
> 	inode_unlock(inode);
>@@ -11513,6 +11560,7 @@ static int perf_event_idx_default(struct perf_event *event)
>
> static void free_pmu_context(struct pmu *pmu)
> {
>+	free_percpu(pmu->pmu_disable_count);
> 	free_percpu(pmu->cpu_pmu_context);
> }
>
>@@ -11753,6 +11801,7 @@ int perf_pmu_register(struct pmu *pmu, const char *name, int type)
> 	if (type >= 0)
> 		max = type;
>
>+	// XXX broken vs perf_init_event(), this publishes before @pmu is finalized
> 	ret = idr_alloc(&pmu_idr, pmu, max, 0, GFP_KERNEL);
> 	if (ret < 0)
> 		goto free_pdc;
>@@ -11809,8 +11858,14 @@ int perf_pmu_register(struct pmu *pmu, const char *name, int type)
> 	if (!pmu->event_idx)
> 		pmu->event_idx = perf_event_idx_default;
>
>-	list_add_rcu(&pmu->entry, &pmus);
> 	atomic_set(&pmu->exclusive_cnt, 0);
>+	INIT_LIST_HEAD(&pmu->events);
>+	spin_lock_init(&pmu->events_lock);
>+
>+	/*
>+	 * Publish the pmu after it is fully initialized.
>+	 */
>+	list_add_rcu(&pmu->entry, &pmus);
> 	ret = 0;
> unlock:
> 	mutex_unlock(&pmus_lock);
>@@ -11832,10 +11887,110 @@ int perf_pmu_register(struct pmu *pmu, const char *name, int type)
> }
> EXPORT_SYMBOL_GPL(perf_pmu_register);
>
>-void perf_pmu_unregister(struct pmu *pmu)
>+static void __pmu_detach_event(struct pmu *pmu, struct perf_event *event,
>+			       struct perf_event_context *ctx)
> {
>+	/*
>+	 * De-schedule the event and mark it EXIT_PMU.
>+	 */
>+	perf_event_exit_event(event, ctx, true);
>+
>+	/*
>+	 * All _free_event() bits that rely on event->pmu:
>+	 */
>+	perf_event_set_output(event, NULL, true);
>+
>+	perf_event_free_bpf_prog(event);
>+	perf_addr_filters_splice(event, NULL);
>+	kfree(event->addr_filter_ranges);
>+
>+	if (event->destroy) {
>+		event->destroy(event);
>+		event->destroy = NULL;
>+	}
>+
>+	if (event->pmu_ctx) {
>+		/*
>+		 * Make sure pmu->cpu_pmu_context is unused. An alternative is
>+		 * to have it be pointers and make put_pmu_ctx()'s
>+		 * epc->embedded case be another RCU free case.
>+		 */
>+		put_pmu_ctx(event->pmu_ctx);
>+		event->pmu_ctx = NULL;
>+	}
>+
>+	exclusive_event_destroy(event);
>+	module_put(pmu->module);
>+
>+	event->pmu = NULL; /* force fault instead of UAF */
>+}
>+
>+static void pmu_detach_event(struct pmu *pmu, struct perf_event *event)
>+{
>+	struct perf_event_context *ctx;
>+
>+	ctx = perf_event_ctx_lock(event);
>+	__pmu_detach_event(pmu, event, ctx);
>+	perf_event_ctx_unlock(event, ctx);
>+
>+	scoped_guard(spinlock, &pmu->events_lock)
>+		list_del(&event->pmu_list);
>+}
>+
>+static struct perf_event *pmu_get_event(struct pmu *pmu)
>+{
>+	struct perf_event *event;
>+
>+	guard(spinlock)(&pmu->events_lock);
>+	list_for_each_entry(event, &pmu->events, pmu_list) {
>+		if (atomic_long_inc_not_zero(&event->refcount))
>+			return event;
>+	}
>+
>+	return NULL;
>+}
>+
>+static bool pmu_empty(struct pmu *pmu)
>+{
>+	guard(spinlock)(&pmu->events_lock);
>+	return list_empty(&pmu->events);
>+}
>+
>+static void pmu_detach_events(struct pmu *pmu)
>+{
>+	struct perf_event *event;
>+
>+	for (;;) {
>+		event = pmu_get_event(pmu);
>+		if (!event)
>+			break;
>+
>+		pmu_detach_event(pmu, event);
>+		put_event(event);
>+	}
>+
>+	/*
>+	 * wait for pending _free_event()s
>+	 */
>+	wait_var_event(pmu, pmu_empty(pmu));


ok... so now we are synchronosly moving the events to a revoked state
during unregister, so we wouldn't need the refcount on the driver side
anymore and can just free the objects right after return.

I will give this a try with i915 and/or xe.

thanks
Lucas De Marchi


>+}
>+
>+int perf_pmu_unregister(struct pmu *pmu)
>+{
>+	/*
>+	 * FIXME!
>+	 *
>+	 *   perf_mmap_close(); event->pmu->event_unmapped()
>+	 *
>+	 * XXX this check is racy vs perf_event_alloc()
>+	 */
>+	if (pmu->event_unmapped && !pmu_empty(pmu))
>+		return -EBUSY;
>+
> 	mutex_lock(&pmus_lock);
> 	list_del_rcu(&pmu->entry);
>+	idr_remove(&pmu_idr, pmu->type);
>+	mutex_unlock(&pmus_lock);
>
> 	/*
> 	 * We dereference the pmu list under both SRCU and regular RCU, so
>@@ -11844,16 +11999,29 @@ void perf_pmu_unregister(struct pmu *pmu)
> 	synchronize_srcu(&pmus_srcu);
> 	synchronize_rcu();
>
>-	free_percpu(pmu->pmu_disable_count);
>-	idr_remove(&pmu_idr, pmu->type);
>+	/*
>+	 * PMU is removed from the pmus list, so no new events will
>+	 * be created, now take care of the existing ones.
>+	 */
>+	pmu_detach_events(pmu);
>+
>+	/*
>+	 * PMU is unused, make it go away.
>+	 */
> 	if (pmu_bus_running && pmu->dev && pmu->dev != PMU_NULL_DEV) {
> 		if (pmu->nr_addr_filters)
> 			device_remove_file(pmu->dev, &dev_attr_nr_addr_filters);
> 		device_del(pmu->dev);
> 		put_device(pmu->dev);
> 	}
>+
>+	/*
>+	 * XXX -- broken? can still contain SW events at this point?
>+	 * audit more, make sure DETACH_GROUP DTRT
>+	 */
> 	free_pmu_context(pmu);
>-	mutex_unlock(&pmus_lock);
>+
>+	return 0;
> }
> EXPORT_SYMBOL_GPL(perf_pmu_unregister);
>
>@@ -12330,6 +12498,9 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
> 	/* symmetric to unaccount_event() in _free_event() */
> 	account_event(event);
>
>+	scoped_guard(spinlock, &pmu->events_lock)
>+		list_add(&event->pmu_list, &pmu->events);
>+
> 	return event;
>
> err_callchain_buffer:
>@@ -12493,7 +12664,7 @@ static void mutex_lock_double(struct mutex *a, struct mutex *b)
> }
>
> static int
>-perf_event_set_output(struct perf_event *event, struct perf_event *output_event)
>+perf_event_set_output(struct perf_event *event, struct perf_event *output_event, bool force)
> {
> 	struct perf_buffer *rb = NULL;
> 	int ret = -EINVAL;
>@@ -12549,8 +12720,12 @@ perf_event_set_output(struct perf_event *event, struct perf_event *output_event)
> 	mutex_lock_double(&event->mmap_mutex, &output_event->mmap_mutex);
> set:
> 	/* Can't redirect output if we've got an active mmap() */
>-	if (atomic_read(&event->mmap_count))
>-		goto unlock;
>+	if (atomic_read(&event->mmap_count)) {
>+		if (!force)
>+			goto unlock;
>+
>+		WARN_ON_ONCE(event->pmu->event_unmapped);
>+	}
>
> 	if (output_event) {
> 		/* get the rb we want to redirect to */
>@@ -12740,6 +12915,10 @@ SYSCALL_DEFINE5(perf_event_open,
> 		if (err)
> 			goto err_fd;
> 		group_leader = fd_file(group)->private_data;
>+		if (group_leader->state <= PERF_EVENT_STATE_REVOKED) {
>+			err = -ENODEV;
>+			goto err_group_fd;
>+		}
> 		if (flags & PERF_FLAG_FD_OUTPUT)
> 			output_event = group_leader;
> 		if (flags & PERF_FLAG_FD_NO_GROUP)
>@@ -12916,7 +13095,7 @@ SYSCALL_DEFINE5(perf_event_open,
> 	event->pmu_ctx = pmu_ctx;
>
> 	if (output_event) {
>-		err = perf_event_set_output(event, output_event);
>+		err = perf_event_set_output(event, output_event, false);
> 		if (err)
> 			goto err_context;
> 	}
>@@ -13287,10 +13466,11 @@ static void sync_child_event(struct perf_event *child_event)
> }
>
> static void
>-perf_event_exit_event(struct perf_event *event, struct perf_event_context *ctx)
>+perf_event_exit_event(struct perf_event *event,
>+		      struct perf_event_context *ctx, bool revoke)
> {
> 	struct perf_event *parent_event = event->parent;
>-	unsigned long detach_flags = 0;
>+	unsigned long detach_flags = DETACH_EXIT;
>
> 	if (parent_event) {
> 		/*
>@@ -13305,16 +13485,14 @@ perf_event_exit_event(struct perf_event *event, struct perf_event_context *ctx)
> 		 * Do destroy all inherited groups, we don't care about those
> 		 * and being thorough is better.
> 		 */
>-		detach_flags = DETACH_GROUP | DETACH_CHILD;
>+		detach_flags |= DETACH_GROUP | DETACH_CHILD;
> 		mutex_lock(&parent_event->child_mutex);
> 	}
>
>-	perf_remove_from_context(event, detach_flags);
>+	if (revoke)
>+		detach_flags |= DETACH_GROUP | DETACH_REVOKE;
>
>-	raw_spin_lock_irq(&ctx->lock);
>-	if (event->state > PERF_EVENT_STATE_EXIT)
>-		perf_event_set_state(event, PERF_EVENT_STATE_EXIT);
>-	raw_spin_unlock_irq(&ctx->lock);
>+	perf_remove_from_context(event, detach_flags);
>
> 	/*
> 	 * Child events can be freed.
>@@ -13390,7 +13568,7 @@ static void perf_event_exit_task_context(struct task_struct *child)
> 	perf_event_task(child, child_ctx, 0);
>
> 	list_for_each_entry_safe(child_event, next, &child_ctx->event_list, event_entry)
>-		perf_event_exit_event(child_event, child_ctx);
>+		perf_event_exit_event(child_event, child_ctx, false);
>
> 	mutex_unlock(&child_ctx->mutex);
>
