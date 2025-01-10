Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D2BA0987C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 18:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0195B10E0F2;
	Fri, 10 Jan 2025 17:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IV6dfXZe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4C110E0E1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 17:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736530038; x=1768066038;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WhsXwGdjI9k6aAVp2tnQW3P+PwOl0aXZoYufR0R3sSs=;
 b=IV6dfXZeYqPTIEBUOfYE/X7SSP0rdro9qejOZDclOX00Ov88vKtUlmWv
 RT+LzUsb2x19CcYnyKrijJ9NLiK/lMy9QIQ8F9bTDIUe3jS3BKwo+VVxC
 iU1979LkjnQ/d7AItAE7RYLPQWN+PqzfRFNncbO1fFp16ydTAcGhG3cKJ
 DpGxz8NyBMDkrUdzHbPpcqzGYegdcJt3/DMP7utvDugbUeGMe/h6JYT3S
 nswlaNvX3eo+1k9XRfTxN8D5PLfkhuUos5c8IWQcH2hy0cvOUR9Zi4xxz
 NLOeUcsSS99vCU/i+wg+KSUeWAu6wIzEp1zFRWCcLvv3ic1ktUALTo2Ud Q==;
X-CSE-ConnectionGUID: IH49Hdo2Qw240KKvs9ei4g==
X-CSE-MsgGUID: qC9wBxbbR5elv/TaSDIIiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36938642"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36938642"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 09:27:17 -0800
X-CSE-ConnectionGUID: /9Ixe+zURN+ls9zzAc2Vww==
X-CSE-MsgGUID: G6upJBQ/RHKW7+4G+1c3DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="104349123"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2025 09:27:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 10 Jan 2025 09:27:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 10 Jan 2025 09:27:14 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 10 Jan 2025 09:27:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGfi6Grinf4FxK6+XtIZ5fexbhrTE8EW6Tl76c8ewQcXlX2IyXU/0OBE5WjSw2KW1mDNA9l9mvKirpcQ6uZJlYlTka2Wd9NfST65noUh6hmJ6Zsz/QYlHre1oZTtEb/+otl3Un8ROjonU33EmkpnRfM3SENrMgFeMKDdep9UQF87PJZj42CnlABZYLNpu+wNxqt0yCiLs3vLl+A8bdEl4E3HkSqUV0KMpxY3SDpd1ysXz4Hr3I23enKt5qqXD+bOIcHt3ry0MpD2IBK6/PKXcsSFN4kF/Mo7Qc6bezayVVNuEQHlMPJUAZ+OkDHY+BP3FAB1RCg2CaWwb+hso0xwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zy6/H5BgJ9TqAVzTNMAcvgiQJifRgFH2pQpDhMszOew=;
 b=BO/w7v3YGYSvvh6veOWYvB9iZa5E+PY5SEiaHrzGxDX279f+XDLAwdwzjcg7Nz74vBIleR8wOJ6G4415WriQUXQpSCurtB3yNGfr7haf61lwoNguBIr7eWbGUSL6CEQUO8N6G8wZkyJ8+F1y3lG16Nu7xMUNuBCUvskqgf/IwdP2OqIIY7YXR7YxLOqBAWxSibQBCbjryBZ0LAdOlW0+kWSoz7NC6XZzgakUrZJVnkhV2mQPvoUKC8Hp6ANIELzqxOoXv4HbwkLabaVaPZxnuxytWSMifcy7haPbOMDYUoghAsJJTIeYjF3eOgbvKnD+ElQSxlEZ1Y8y0/O1I7Cdeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 17:27:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8335.010; Fri, 10 Jan 2025
 17:27:11 +0000
Date: Fri, 10 Jan 2025 09:28:02 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Danilo Krummrich <dakr@redhat.com>, Tvrtko Ursulin <tursulin@igalia.com>, 
 <dri-devel@lists.freedesktop.org>, <kernel-dev@igalia.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp Stanner
 <pstanner@redhat.com>
Subject: Re: [RFC 00/14] Deadline scheduler and other ideas
Message-ID: <Z4FYog4kkECZSgjk@lstrano-desk.jf.intel.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <Z3433G3-_aIMqJbt@pollux>
 <f7c333dd-6c6e-43ad-8879-8e9ccc374f5c@igalia.com>
 <Z36udQs86Mn1-T5p@pollux>
 <e611e9ee-3809-4370-8402-e7c324812bb1@igalia.com>
 <Z4AqiSBnJshH0PRU@lstrano-desk.jf.intel.com>
 <10052b1d-647d-40c8-a69a-ebea4d9aff99@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <10052b1d-647d-40c8-a69a-ebea4d9aff99@igalia.com>
X-ClientProxiedBy: MW4PR04CA0291.namprd04.prod.outlook.com
 (2603:10b6:303:89::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a44d93d-633c-457b-58e7-08dd319c0480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y9Pe8FNMWzI9DO25VIBblNNFmbBiHLCM1vUm+0RMBRRoyB/3OWMYUpIjtQLo?=
 =?us-ascii?Q?RtkluWhCQmNAhEjiNbNUbj5NMTyfsXXsWhAMV6Fr6qyWtW+IIQLgPpmkgc3y?=
 =?us-ascii?Q?aBk5M9irEDdSd84FC4DXs4Oc3+yqT8tjdYJersECQ7BVFK0VdpLWPQ+rCu6N?=
 =?us-ascii?Q?oEpv2Q2NF2N9MMd2AEMV/rOtcU3zVCvm1NamWvFNP/3W6RfwgmxPcWCLVksk?=
 =?us-ascii?Q?o7ei5ZKvANoYKpxkfmVieIqZmnqHu5VyHH9Cj3r8c0hNnygV/aACAfqMOMJl?=
 =?us-ascii?Q?ib7sZEWvQYty/Bmd55PcNEzG0cDdmo/xPWL14cHMGcDRq3JOhqQA6/cfT29b?=
 =?us-ascii?Q?OI55jY+rJUOSQWq+FNV1nQE0wyXq+RqUZdVl38TJhsGsrZ2fwnNP4QzkaagV?=
 =?us-ascii?Q?f+GjQIZrRIuyyIyrr7Ednp3Ia9LZEHV9QlPyJlIiGCJwdQnEIqvxavSkWOZf?=
 =?us-ascii?Q?wb57Z7FyfIgOfJK3Q7B92gLBUrwN3IbVd+HVO29pPRE6lTMvOs98scyxm2nS?=
 =?us-ascii?Q?rbAMBBFTtY/2XRl+xWjRTICDA9qhnxndkHtxR5Qb6w+1i1oO9pMbK6XM4ius?=
 =?us-ascii?Q?5lcN64ViNJfdttnDKtGtyN9aryRr2+AzWy71VZHsch5paBBFDxR5GS6Sqdzn?=
 =?us-ascii?Q?3xvVhFzll9Effi4IqxTUZaKsLVhmKLhX87ro+TeKMxUIdQpXJjdmMqgaYbVZ?=
 =?us-ascii?Q?JqdGvyNYO19rJwtGUIFxTG0L+UUu32BZFBDAz3Cg6egHT5RJPLXZla7mCzXF?=
 =?us-ascii?Q?4jU8EAy8paWoxga04G6FaPn9uXLy5nifN8Nxy8rVsLLLAUDy49R7uemJdd7d?=
 =?us-ascii?Q?g/iKFvqvWVRYSznscvCbaxLX0IJuB7h0P6BHLpilIJJ4ai5SeTvdt3viPeQW?=
 =?us-ascii?Q?4fpJqCZEESTtrDCYovI2IOvY+Z/5w/LZWqGugBS8RJP4FQ3EIFTepTXmb90W?=
 =?us-ascii?Q?3uJh1bY2ukBGsRAnDP1HfgWLOjswaSDHt+W5gjOPFo9K5tM27rM6W6pormuJ?=
 =?us-ascii?Q?jG+FPvp4vTUCFz/ca1DsQ+IwUi/UFsNIc52dkEWa3arvJ4d8zgNQKVh2HOc0?=
 =?us-ascii?Q?QSOR3OKpIYXUrHx7MrLMTiUazLsjskHwNNvl0mpb8kw25IOJPPWHM3PZEMtM?=
 =?us-ascii?Q?lwxcVDquqH4Uw05t0Jkyv5f0MTD1U4VmeDG9cm5ikP5nK/FV57DtqGneuCzz?=
 =?us-ascii?Q?do3WGe+8zftNzjhwFAcjUmpyWvf5WbXspDvDviBQWtaHQZvtS/AoTk9mXOFL?=
 =?us-ascii?Q?yFASOJTMzvP8QYrjKwv5rNN8pUa5xPJja9EjQD2FTPHHl9eT/LeuiYnfdJ/N?=
 =?us-ascii?Q?deG9E78tg/MmRMD6cRqjP8rl7mN+StbOzC0m62Ukx7HwEA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v0G2/5cXF/3vQpzsglKFdxKjpC/hOeE7aCGag1izrVoClChrEBmOTDQcAZgB?=
 =?us-ascii?Q?coO/C3DSWuPc/lDBdcTb1HDuOZxhZva8gDOE6KkH3CQBxZ3LvlT53aoQC7De?=
 =?us-ascii?Q?8zWUZ9CWL8pgpY8eOgigi9JDZ+pwGOJ8cFySkG0aIVd4Le2B2nrLoasdKGII?=
 =?us-ascii?Q?9a+I1Y2xj6o/Q2K6f/zPROaC/eVrkoAl8euk0bK+tTAg0Smv2VAAf9HARK0N?=
 =?us-ascii?Q?RM4EVmUVzjP4jjdC3J5kkNNG4AXWFhnrM4pwwdiqppmfruXMe3xyXYIdxTmh?=
 =?us-ascii?Q?e+nS606PSR7/ZAzwebDdRAY72+zX7zTIYZqcbspIp63+fk2DTXpEA1uYmgWz?=
 =?us-ascii?Q?Il20hRVyQRcgJ/6J/0IwBbyVOEBNgEM2D+OB0rbwDGWcDtONZcz6oy47LpCw?=
 =?us-ascii?Q?RtffRoahzr7OZq+8bfEZSogdlorA/EOhQxPqHbU+OpkmN861va19DbxFb42L?=
 =?us-ascii?Q?TwZaQO/AYjf8pZUQ0OXVlZ9T24QdyKjOSDXNUYeiWTrX/hncWxsa+bf1ZzFh?=
 =?us-ascii?Q?1lkSwe8IXUPjS0i6HrDuJk1VngxT2xl4kqOfB+cqlPD4pggFhfX4SkRBosgY?=
 =?us-ascii?Q?Bfy9hnZdBusdey1AZdIwl5FRl5QzvF2K8gln8V24xqJxOlja4hkbTC1krIkz?=
 =?us-ascii?Q?nbOMABpuBxdTUWsvbY3rHMt0sYQUeNI8E/bmNjSxQP7mvGTs85mXKjSYpiH6?=
 =?us-ascii?Q?38VCVRDHVIAClze2th+6V0kzF2OFG5mviZaoIt/xwiKewALyoKBEm+RlRaD0?=
 =?us-ascii?Q?5JB7uRxCrNaWDelAdpZhX8F9T/HjsZRNEBAyUPY9mPswLRoXAoedCuYzZgpi?=
 =?us-ascii?Q?OOFl0svZvrZMj5cp4zURSaXQ3ckoPxkiFLtCeGfe27XSN6a0eaL1v8vR9sfU?=
 =?us-ascii?Q?w2UCBrV1XY2wSJndwl6CKIhEqG7yEEFBoQlNXYSa/PEkWH4XcJIzSVtLZT92?=
 =?us-ascii?Q?fR8i0xaVAJI8R9wmALHku5rGyTdBgk7LLiA2CtIKiT2E3B7X+BZApW4dSLNW?=
 =?us-ascii?Q?dCZ1D8yqnClvSdNJYFo76Ja65i/1MfQft257PtFkTmBIej5uFOzLyHTsUJ7U?=
 =?us-ascii?Q?v3rZ/CmTIro228e+EI6MyYl78M6h+UFAoj06C0NbTRV5TE1/EujnAnEWvKBT?=
 =?us-ascii?Q?WPxHxRqZT3i9iOoGCSEVom1uemy9XsAfah8r9Q0iO9abzDm0V8ojIJM1XU0a?=
 =?us-ascii?Q?pSnpMFEfedh/SbyuyLivrwDA8gzZz+rgCntoqvWrn5XdFka95l1eEhMRWUes?=
 =?us-ascii?Q?Bi9Pa+U97IQrJHhd/sftT+sB3dnW5FJKXRHNbWZqZBgL0MCIRSR+SGxaFZcR?=
 =?us-ascii?Q?zjxCWQ3ixwdqz7Neavtrz8/C7UmiDkREZ2seq1b+t80hJYbQ/wqnDTBD+4Zq?=
 =?us-ascii?Q?+hiN8Hikkp1nO6tg+9jp/LGwd7qFbttT8LK+hsSgLyBsh6KnyKB8tRk8L958?=
 =?us-ascii?Q?UO2IAtAEp4SjuoV0eCyNth2WdmKrT3PYwb+AjfFoc04zzucn+s8wYg4eLjZP?=
 =?us-ascii?Q?7t4qahbJn/A5dJuqWTB8/TKo8up1nUmj0ARwkpPuwfZWLVgAfqGwdAO4LArj?=
 =?us-ascii?Q?KaE7jvD+uzDnerOi2gnGUCFvXO3aVUYOYFf1yN9b0WmHgAN7Imi3hRx6cRW8?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a44d93d-633c-457b-58e7-08dd319c0480
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 17:27:11.8619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k387U83dYMNV50GBHJ8n8YJ05ruRhyAuBVTehc/rLfoBZKKTXxu1mb72bo5lKjJx0xv0Lq+65TgQmw60TGfQKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
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

On Fri, Jan 10, 2025 at 09:16:44AM +0000, Tvrtko Ursulin wrote:
> 
> On 09/01/2025 19:59, Matthew Brost wrote:
> > On Wed, Jan 08, 2025 at 06:55:16PM +0000, Tvrtko Ursulin wrote:
> > > 
> > > On 08/01/2025 16:57, Danilo Krummrich wrote:
> > > > On Wed, Jan 08, 2025 at 03:13:39PM +0000, Tvrtko Ursulin wrote:
> > > > > 
> > > > > On 08/01/2025 08:31, Danilo Krummrich wrote:
> > > > > > On Mon, Dec 30, 2024 at 04:52:45PM +0000, Tvrtko Ursulin wrote:
> > > > > > > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > > 
> > > > > > "Deadline scheduler and other ideas"
> > > > > > 
> > > > > > There's a few patches that could be sent outside the scope of this series, e.g.
> > > > > > the first one.
> > > > > > 
> > > > > > I think it would make sense to do so.
> > > > > 
> > > > > For now I'll keep them at the head of this RFC and as they get acked or
> > > > > r-b-ed I can easily send them standalone or re-ordered. Until then having
> > > > > the series separate would make the RFC not standalone.
> > > > > 
> > > > > > > <tldr>
> > > > > > > Replacing FIFO with a flavour of deadline driven scheduling and removing round-
> > > > > > > robin. Connecting the scheduler with dma-fence deadlines. First draft and
> > > > > > > testing by different drivers and feedback would be nice. I was only able to test
> > > > > > > it with amdgpu. Other drivers may not even compile.
> > > > > > 
> > > > > > What are the results from your tests with amdgpu? Do you have some measurements?
> > > > > 
> > > > > We already covered this in the thread with Philipp to a degree. Tl;dr; the
> > > > > main idea is whether we simplify the code and at least not regress.
> > > > > 
> > > > > I don't expect improvements on the amdgpu side with the workloads like games
> > > > > and benchmarks. I did not measure anything significant apart that priorities
> > > > > seem to work with the run queues removed.
> > > > 
> > > > I appreaciate the effort, and generally I like the idea, but I also must admit
> > > > that this isn't the most convincing motiviation for such an integral change
> > > > (especially the "at least not regress" part).
> > > 
> > > It is challenging yes. But for completeness the full context of what you
> > > quoted (if you also read my replies to Philipp) was *if* we can shrink the
> > > code base, add some fairness to FIFO, *and* not regress then those three
> > > added together would IMHO not be bad. We shouldn't be scared to touch it
> > > because only touching it you can truly understand the gotchas which any
> > > amount of kerneldoc will not help with.
> > > > I'd still like to encourage you to send the small cleanups separately, get them
> > > > in soon and leave the deadline scheduler as a separate RFC.
> > > > 
> > > > Meanwhile, Philipp is working on getting documentation straight and digging into
> > > > all the FIXMEs of the scheduler getting to a cleaner baseline. And with your
> > > > cleanups you're already helping with that.
> > > > 
> > > > For now, I'd prefer to leave the deadline scheduler stuff for when things are a
> > > > bit more settled and / or drivers declare the need.
> > > 
> > > I just sent v2:
> > > 
> > > About motivation for the documenting efforts:
> > > 
> > >   13 files changed, 424 insertions(+), 576 deletions(-)
> > > 
> > > Fewer lines to document. ;)
> > > 
> > > On a serious note, I ordered the series (mostly*) so you can read it in
> > > order and for patches/ideas you like please say and I can extract and send
> > > separately if you want. I am reluctant to extract things beforehand, before
> > > knowing which ones people will like and so far there is only one with acks.
> > > 
> > > *)
> > > Mostly because perhaps "drm/sched: Queue all free credits in one worker
> > > invocation" could be interesting to move before the most.
> > > 
> > 
> > I looked into this. When I originally changed the scheduler from a
> > kthread to a worker, I designed it the way your patch implements it:
> > looping in the worker until credits run out or no jobs are available.
> > 
> > If I recall correctly, the feedback from Christian (or Luben?) was to
> > rely on the work queue's requeuing mechanism to submit more than one
> > job. From a latency perspective, there might be a small benefit, but
> > it's more likely that if you queue two jobs back-to-back, even when
> > relying on the work queue's rescheduling, the first job will still be
> > running on the hardware, nullifying any potential latency improvement.
> > 
> >  From a fairness perspective, multiplexing across multiple work queues
> > one job at a time makes a bit more sense, in my opinion.
> 
> You mean multiplexing across multiple _entities_? Because work queue is only

No, I mean if you have multiple schedulers (work queues) with jobs that
are to run dequeuing a job a time per scheduler would let the core work
queue scheduling give a level of fairness.

> one. That it unchanged with my patch. Ie. it is not changing to pick jobs
> from a single entity but still picks a job at a time from the top entity.
> And top entity can change as jobs are popped. What remains is the question
> of why burn CPU cycles and do it in a roundabout way if it is very easy to
> do it directly and at the same time avoid that unconditional final wakeup
> when queues are empty.

Like I said, I had this way initially but the feedback I recieved was to
dequeue 1 job at time and kick the work queue to reschedule itself.
Unless everyone opinion has changed, I don't think this is change we
should make.

Here are the some references...

[1] https://patchwork.freedesktop.org/patch/530652/?series=116055&rev=1
[2] https://patchwork.freedesktop.org/patch/575874/?series=129143&rev=1
[3] https://patchwork.freedesktop.org/patch/576334/?series=129286&rev=1

Matt

> 
> Regards,
> 
> Tvrtko
> 
> > > > > Where something could show is if someone is aware of a workload where normal
> > > > > prio starves low. Since one part of the idea is that with the "deadline"
> > > > > scheme those should work a little bit more balanced.
> > > > > 
> > > > > Also again, feedback (including testing feedback from other drivers) would
> > > > > be great, and ideas of which workloads to test.
> > > > 
> > > > Unfortunately, there's not much I can tell from the Nouveau side of things,
> > > > since we're using the firmware scheduler scheme (one entity per scheduler) and
> > > > hence the scheduling strategy isn't that relevant.
> > > 
> > > Yeah. Hopefully someone with more appropriate hardware gets intrigued to try
> > > it out, or to suggest interesting workloads.
> > > 
> > > Until then I happy to keep it alive in the background and as said you can
> > > pick and choose the parts you like.
> > > 
> > > Regards,
> > > 
> > > Tvrtko
> > > 
> > > > 
> > > > > 
> > > > > Btw I will send a respin in a day or so which will clean up some things and
> > > > > adds some more tiny bits.
> > > > > 
> > > > > Regards,
> > > > > 
> > > > > Tvrtko
> > > > 
