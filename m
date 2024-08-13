Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F400950C93
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 20:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068CD10E3D5;
	Tue, 13 Aug 2024 18:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YGklP2Hw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9283E10E3D6;
 Tue, 13 Aug 2024 18:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723575391; x=1755111391;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/rd83dZH4kvcWNksQX/v9pl8bj4ko49PVvVr7sFOyBE=;
 b=YGklP2HwBkQr9yEVo3Ph2YeRj2p6qrXpFsdUn9yXHfhKfVoogS5Jx6Kg
 dtH0Rd2SLE4HoJKzaIL45JdAM/hM2MiPnZq3fr0dMuvNlYFuMPcNrDCII
 f0oheIv/EL50lKrZn3c8O3u8Dc7XwNbPjp7rCMDVC+jBim3NOjxOOMaNs
 I7mpfCf0XSXZw+qv/LjHTAhC4/G+j2MfVQbV0W3DByZUMqaBOvd9nbY7G
 /+NA11/xK/V1Uj+JKiP3Gd6SQJ89IMYPrWU2dZPI2dCSOi4X8URd0eHg1
 SIvTpM+SGmMyZabZAJr4pHiJlTSGmKSWisoSuEitXkLtzxyDG5fjh6LzH w==;
X-CSE-ConnectionGUID: jlGFz9BzQd64xOipwaxu6g==
X-CSE-MsgGUID: VQO0RDEwQBqKvcOK811bTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32440810"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="32440810"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 11:56:31 -0700
X-CSE-ConnectionGUID: cRun1nO5TP+lNGzKtZYaLQ==
X-CSE-MsgGUID: Xn1FAe0tR/+kcXWutQZ+qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="81987821"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 11:56:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 11:56:30 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 11:56:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 11:56:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 11:56:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGhi/BmNw3DdViTSNgLKI0tFLff0oxDwbKpUQ6nnvCXA+2h70u2JIYWZ+5M0ZMOqFl19ae06Sitm71tfnwlbrhbb6qXewQIx1ccdgpmZdEvhCvVrjFy08S4KVs1sNKEd9wc1sGbpVFOLnttX5Gd7hSr3A/AuHOzjaCbh5g97EyEsjw0M1AI8nnVQkLwFFyMKZH0/W8gipPwXAGLzw9Xe/AxcMqX7HLu5KBs9rW6P7DIdwkbWo1zdnJVeXgXhsBuPORN05+sYhPSvPCrOgVPH9Xi8uDlTGWMsNX8MLj5cQDEDhJFwUhr3aSBP+smVhBCf1qDeWoshrm8/oL8xKRw1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQiDFnhP2lKBplTsM6J7vKSE501Lm/pvq5vtMuWNfdc=;
 b=Z49OakZNkIr9dAoY25v+rwop0sk5uYw+oYk0nC7me32x4PnyfOqfga6udphgoNxJoAR29fNrUKDB8px50dEwqgWB02aPb4Miyk1N27dGSEBZ2L3qVsnpf1b71xWYj/WRdNfOUPUkPYJS1MVlslaQHcqzvdj4zPOiXx4ravbGcBR33qZjyiz+hSpKgcp64yktMXWD4JG5U3UABD/8Xf2h39z6+0bgG6PWd3ViPIHz4ER9ytudMOaTCW49pLHtjvpP0ue0LCvbn9IqyISrNNIpqzUENkpbrPmDX2XZBJ3/G4GiVaF+B5qB1Zr48sD/ZL7rWensBNmDchwhmdQrT7yhgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6778.namprd11.prod.outlook.com (2603:10b6:510:1c9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Tue, 13 Aug
 2024 18:56:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Tue, 13 Aug 2024
 18:56:24 +0000
Date: Tue, 13 Aug 2024 18:55:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejun Heo <tj@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <jiangshanlai@gmail.com>,
 <christian.koenig@amd.com>, <ltuikov89@gmail.com>, <daniel@ffwll.ch>
Subject: Re: [PATCH v3 3/5] workqueue: Add interface for user-defined
 workqueue lockdep map
Message-ID: <ZrusGBG7/EkNlbsk@DUT025-TGLU.fm.intel.com>
References: <20240809222827.3211998-1-matthew.brost@intel.com>
 <20240809222827.3211998-4-matthew.brost@intel.com>
 <ZruraicqNAvPWGJ1@slm.duckdns.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZruraicqNAvPWGJ1@slm.duckdns.org>
X-ClientProxiedBy: BY5PR17CA0027.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ca536b-94e1-4c1f-1f56-08dcbbc9a0fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jxyowoJiAXC2mVo4dbPY7aIw80H/Uh+EN8LDnQ6ULMgOakENyuoQP/Vk6Gw3?=
 =?us-ascii?Q?vLZbGUMM+Gf3v0SR4VuPtjxM5Cgym8xK+HO5rAZsbor0cGB7wCWGawc5mwYi?=
 =?us-ascii?Q?KGwshft6H7rT+3U/D5ri4rpNC4G/F6SynYG2Wt6r2FKXuD6h5EE9CTxE2Y+m?=
 =?us-ascii?Q?hXZcVycozPjyBItjrnW6FcIWFvhf8lP1enFuAOOWXt0gUrOSyPbBgyQ/0h+U?=
 =?us-ascii?Q?xfkDkTfVdUk8qAymibGG3vAQ+nYrbVx2iPTYUOzJxUN9u4a0eoOzi7NGCgT0?=
 =?us-ascii?Q?OvoLcH33gUANgG9BE6EAfEXkdBFxbVwIq6lubv83pm7U/CNGUDyTXm+BwYNp?=
 =?us-ascii?Q?rWA5z0cw2S3t1zNiyUuAK6ImEfafqrO3eBQHkGAJuCNe8mk/a7QMBLqrC6Zc?=
 =?us-ascii?Q?ik9Q1/zCtFZ35R/SMafiBaoAxd2vPEy2P8eIVsvjr+t1ZB98kmTJHovd5SSe?=
 =?us-ascii?Q?8UncqdwugK2rPqbj6/5e2ZRboNYHDXCjRHKcRv+pIja/9QsFrdte7D+qt9JJ?=
 =?us-ascii?Q?Ez8maGFEn14xyfaYSQjG/zdzakwuYnVRhZPEw5bxZPmRJkeFXnGNM31ztyJc?=
 =?us-ascii?Q?nAZXwR+5vz4tdeaqZlCGLIwgyVuqv6feaadyzQsR+slcnqHuyFDqrzpM+AlM?=
 =?us-ascii?Q?NXqJLMBsTsOIPninoDqmxuodel9HHC7nuX4uDNpoloh5KbFkRGWcdR5nTOi8?=
 =?us-ascii?Q?x9Rszfz0TmsYthAMEikqZj8ZaDnY7P8jdVaqM0hhgOwk9C5hmxocD2dziJpb?=
 =?us-ascii?Q?2kv7dtQlzQCe8M8pNKrEOwacH1pAuP2naVz+X6Yy2xvfaKCIroVYnkayuYHy?=
 =?us-ascii?Q?g/rGw+zgZmpIuC8TZHqOI4onkfe7XAszjAVRmjEvyStglHB3DqLNLL/FnMmn?=
 =?us-ascii?Q?N4j84sfVkNgEzWMTSgJNMhS64y1ALmapi3bzDjfeQIdSg8WIeL6Xe0Q2FlyR?=
 =?us-ascii?Q?18lxH7g+AOrTa4a03imt55yMraudUJ64c95UpoIbS6j13KJJmZ9oHMyMA+GR?=
 =?us-ascii?Q?GasTwgtp8mG6cpkJJsZ402dDOjPnKI7OHmMdB+0dFph5+CLn5lO0Zhwe2d/o?=
 =?us-ascii?Q?31cPlh9sj7bIBH4/IblSbnsmS8ql2Czx52MJq+rK66I3B8cUvEA1EUlYWakR?=
 =?us-ascii?Q?Op8Fi31UhVBSlZcZi9oacJrKAAeUW1NalStuJu8ktqzQgz25pQgu7kPGZIWJ?=
 =?us-ascii?Q?b3kmaOZAeC9NNMf8+5jg0KQ54tL83M9HReFvknQTCBKPxNat+D6x9G8ZgPYm?=
 =?us-ascii?Q?gjw5FPPRxELmqm500WWzZ5UXeHyT6IvlNGlhabG4tzh7uuHuGkiA7s2uCpMS?=
 =?us-ascii?Q?D7U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u4JQ6yF5JbgVA/XlR00mTv9stQx/urYmJ8GVR1pPnv1mDNjYKc1Qv1F8RDOt?=
 =?us-ascii?Q?bXC/5Tx4AWRjVWfm6zk0exMpdRH2U+x4eXFBVkdX8XTkKgSuKC7rBmgm/7IP?=
 =?us-ascii?Q?tScEMXnDZKwOdAL8AwaIY0NzmfS4OwLrUGOxONdnoGvfcXVVzPBDVYdMOPia?=
 =?us-ascii?Q?NtLWfF9he84S4LU974RYo5WtISVSkve2w4vKXPQUEOAnJ3vbrOJDlUSjlKMX?=
 =?us-ascii?Q?LcD0x2ctm6vG2syyp1XqB1A7HzxgTEi3RxMcndl0XB0vTSGTockqMW88pUsc?=
 =?us-ascii?Q?EP8o/Xg5WCsKfnSoDI7QAY9OWBNNxPySuW7GRueP+HiJVNFOWuSTt1UJA0OW?=
 =?us-ascii?Q?/rjTIeAW6sP+T/3jPZJ4hqzFSbCrrlQN1BXhWnQcbYVvEFblD6CGMdQ0oteL?=
 =?us-ascii?Q?H8rUmP12XJFy+nwytdJEdvxwnQM4gQpHV+6b2sP4D3ZxtYCALhoGonGwLG+s?=
 =?us-ascii?Q?+/aglBTBJ0VfrU6IBxIHKGCOfFb2TkZnOJ29qQWtdZtUno/w3QVBklgjH+um?=
 =?us-ascii?Q?Bv/OyfD4pVnzWa1kaa1WmRwc0j1t7VLKY7HoFeh+BV+VAk66bUXy2FFSrpYi?=
 =?us-ascii?Q?gdX20Y+iPz2dktRQQFFNGQQrCrREbPREvop7AKRw2Z6sFb2Tf3n0p/aH5l7+?=
 =?us-ascii?Q?ohipOB+htkpCmZpMCOfNqORZ3hFA+ASuy3H3aYjCRqVKheyR6Wozn3mwCpts?=
 =?us-ascii?Q?REFgMcUmqRprCN/TuaFlWmm0h7EstRbU/o/9XxDky0OnMcrHDZPekHXOlObW?=
 =?us-ascii?Q?vaRkdJ8WksaU6nk2xId7fCDrQ55Ipt2dp/tPQukMp1oek/+2/XenQjflT8lV?=
 =?us-ascii?Q?NFfo5fxY6KcAVy3TQ3CL/arzX0M+wthsq1itnW/4yn/NqNoFLpW4DruCjjqY?=
 =?us-ascii?Q?soopH7CbXcFpko1UXtRY4YKXk+7KYXdMJLfedAMndNDIjc1BD19w/Bpr3U5v?=
 =?us-ascii?Q?0+yjOF+mBK+YYUKJ6VHpT5gvUdk6OsLdREtlmCydJfhBeS6RClJYu9jE929o?=
 =?us-ascii?Q?49pVls4JMsBfA/+ek7FjtmBQnkR/x89fKrHd6yuS9UaOKqWEoUKpZeXVaEmg?=
 =?us-ascii?Q?P/roLrowg5UcEULEH0yw6xxKx72Zmcd230dRwPJeQi6Ig6VFr92cMVpkGTT8?=
 =?us-ascii?Q?94Zo4Ma1RDtzcf/MS9BBn/z+W4SmbhLGPTkzMF0YepKYG2dkDoUdlxMsl8+z?=
 =?us-ascii?Q?jgShYXDbr2kN+3y75ikfqLaaT4umA3ztC71866drOpiyLJV9wTS/UzL1c4YR?=
 =?us-ascii?Q?uN6XuM9/BJROWBY44ygheX2x6ymq5o247PcPHPxlhrgKBIVV8TxYLqZxwXmf?=
 =?us-ascii?Q?2Ol+YIqaIaFQwBXry/WfVWcHp5y0bqJObhaedeSsRqQxlu90vWXC53+KihVU?=
 =?us-ascii?Q?cgcJqtcTKtC4lSAzoWGrvVGFnVW4TP/DG/pIu1x2Hp0ZVQjLR1Jerseu8STy?=
 =?us-ascii?Q?WNZ/MBHfNEBEFIas1fP3Np+nr9YVlcb0xecjCPcfS5FnTdSz1MZv9ILq4YWv?=
 =?us-ascii?Q?2Jr0NOisuGeGEMlBii1wj/Kiyd7OlMUQCzlhKnzMmfZh/jmqyjMweY1xuam6?=
 =?us-ascii?Q?fqyY31cmSj9Cv4d77LCUWZOiRPjxBxcrwmWUF6zIwa35iU45zP6Glpbse5Vj?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ca536b-94e1-4c1f-1f56-08dcbbc9a0fe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 18:56:24.5223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjUOxKT2+fX2G1dxyaV/NuYiMe1BCjN/CMznMrY/vU9QnjSd6eD7mT027O5J/nrF2kLrLo8mp1DVBSSaLvuAzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6778
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

On Tue, Aug 13, 2024 at 08:52:26AM -1000, Tejun Heo wrote:
> On Fri, Aug 09, 2024 at 03:28:25PM -0700, Matthew Brost wrote:
> > Add an interface for a user-defined workqueue lockdep map, which is
> > helpful when multiple workqueues are created for the same purpose. This
> > also helps avoid leaking lockdep maps on each workqueue creation.
> > 
> > v2:
> >  - Add alloc_workqueue_lockdep_map (Tejun)
> > v3:
> >  - Drop __WQ_USER_OWNED_LOCKDEP (Tejun)
> >  - static inline alloc_ordered_workqueue_lockdep_map (Tejun)
> > 
> > Cc: Tejun Heo <tj@kernel.org>
> > Cc: Lai Jiangshan <jiangshanlai@gmail.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> 1-3 look fine to me. Would applying them to wq/for-6.12 and pulling them
> from the dri tree work?
> 

Yes, I wanted to get this into 6.12 as I believe we are removing
forceprobe for our driver and it would be good to have this in for that.

Any idea what this is about though [1]?

Matt

[1] https://patchwork.freedesktop.org/patch/607769/?series=136701&rev=3#comment_1105151

> Thanks.
> 
> -- 
> tejun
