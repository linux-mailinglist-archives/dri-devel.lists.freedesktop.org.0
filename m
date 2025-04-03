Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131B5A7A88E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 19:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B86310E2BC;
	Thu,  3 Apr 2025 17:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qxt2BCCZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29EE10E256
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 17:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743701240; x=1775237240;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:mime-version;
 bh=IYbQ4eaSLWJaAtu6lQ0bpNGF0uxE42G2qDM/eyoGAwg=;
 b=Qxt2BCCZenUuokz3pipqOKBO0pWZYH78XMS0RKqnFqhaD2ZsfeKADC/b
 zFvX06IqeA16rnCUCtpVv57ceK9iHTlhwaZMmKY5CvexVftobs1Dh/Uli
 AGQI2XOEu4bHsB5jcZ04KxI4qYlX9CV7Ccy3v7L/F7LZ/Axbu2NiDlF2S
 xs9+cSAQkXMzVIxaNsnw6evUGHtPyPm69Lhob/1q1dD64WgvYTbvrIHN/
 dRWc5sqRLgxxxuvm8Nuk8IReNXTa4nKa++mbdUiICTh/z2brPlWT/rEy0
 p1mCeW+/LmUR6TtZ2JK0uzpQJF89hv80Tc2Wg2cE755wih8gQXRneuz6J A==;
X-CSE-ConnectionGUID: JMgRYcDyTtS562atfkwusg==
X-CSE-MsgGUID: mBN8RN3DR26s67upCtlNyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55754719"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208,217";a="55754719"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:27:19 -0700
X-CSE-ConnectionGUID: LQIvgkwCQUOmulEvtIRH4Q==
X-CSE-MsgGUID: b6norUg2TD6jShptbONiHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
 d="scan'208,217";a="126972572"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:27:19 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 3 Apr 2025 10:27:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 3 Apr 2025 10:27:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 10:27:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dcuak00w0DIWLJAMvY4wHoi1wsqL+TRHeVZk2KDiSVK3ptqMlCvwm95bzfzbWwW7LszUWCt3WWPTVEFzuscYvXiwHldyH+RG+SEobJ17Ic4AxTd4vTwCKdydFC7XjKoptrLs/z3BqpGDub0RpHQrOy47Pc+DUVIjVwSzyBWFmdiQqLSLs36Kjoixev/iSg34S0jmUOa9XpPwICU4rSTfRdZO8JgSVugdoHly9O4rVe3/MaNH6sYsEwJI+oYCeRtnAmnrEbgk7+49MBF5Im0UNwm6TMpBbNFYQxcEzatqUFnfm0yAkDI7LkOd/r/r6QcbtihSmNEgE3rrP9//qxucTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffuJLPuZteH1I+JbFvwZJpiETxrUrLclfYtgk66AFkY=;
 b=sW+M9Wm42FhSpxjNJ0gGQJ7iLhxDgahTBri5FWGUM3sRYUU1H122CeJRWrexg7TpZTlJK0u+5VhpYXTNlikbeXAoX105HtI7VXtnCPA02FGCTGiZTpFXo1MpT1hCR57CFFAVmrVvhtp4lotezA2HpZUY+g1YGDlB3JlIgNPU8SzqxgTw60ZApURsEzUsjjCJa0Jg7qtAkA9+O9B/2k3VmpDFoRQcbZkZxxr5BxSSL0zaMoapf++XcCN6zWj1I9byMGziwIsCuxZC8g6q6LLOLMpRu+nCSWzZnaXR+9ICQJzxJCgDdXAHVNXEKEDKBzWtIhn69pM9mO+lO8vRr9btXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6707.namprd11.prod.outlook.com (2603:10b6:510:1c6::16)
 by IA0PR11MB7751.namprd11.prod.outlook.com (2603:10b6:208:43a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 17:26:41 +0000
Received: from PH8PR11MB6707.namprd11.prod.outlook.com
 ([fe80::f373:2133:3926:3cdd]) by PH8PR11MB6707.namprd11.prod.outlook.com
 ([fe80::f373:2133:3926:3cdd%6]) with mapi id 15.20.8534.045; Thu, 3 Apr 2025
 17:26:41 +0000
Content-Type: multipart/alternative;
 boundary="------------r0uPJFml04Fe9z6JBDebHnt1"
Message-ID: <38422ac6-a783-465e-9e4e-94608f10e5d2@intel.com>
Date: Thu, 3 Apr 2025 19:26:36 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v6 2/4] drm/xe/sriov: Shifting GGTT area post migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>
References: <20250331132107.1242954-1-tomasz.lis@intel.com>
 <20250331132107.1242954-3-tomasz.lis@intel.com>
 <69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com>
Content-Language: en-US
In-Reply-To: <69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com>
X-ClientProxiedBy: WA1P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::27) To PH8PR11MB6707.namprd11.prod.outlook.com
 (2603:10b6:510:1c6::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6707:EE_|IA0PR11MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: 57848add-720b-4890-25f9-08dd72d4b277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTB6TnBPRU9KeW1pR3kyUmxsYWZ0U3BYaGN2MHFTK3lJZVo2UDlyYjRWWlhI?=
 =?utf-8?B?aU1mZytmaUxjNzBQUVBNVHZTcjJrd1FzTGZhSnpnRGN5OWF1Tk5kcWRhNUZy?=
 =?utf-8?B?RXMwNW5kTFhCdHppT1NnVGYySXNHSTIyTUQ5WEN6TUxaV2VVLzE1RWdZM0xo?=
 =?utf-8?B?Q1dicVpEZlp4TjV1aEZHYzBNZ0ZSbVZRODNxMzRBajJKTXlqV21kbmdKVFlT?=
 =?utf-8?B?dFlxb2NLZU1DY1ZOYUtvT3FZUzNPNnRWdVpEL3l6b092TU9UTnM3RlFYT2Yz?=
 =?utf-8?B?NEx6VHBjSUdDbExVU2QvY1oyeUJYSlI5c1BDZXRkSFlMMDdIbkQ0NkxBOERL?=
 =?utf-8?B?UlBESzYrUjhoV1RKUmkvakVJM0RRcEtrQkc4Yy9xOThHZ21ZNjBUYmpRVXNt?=
 =?utf-8?B?NkNYV1lzZTlVdFRHL05qM1JyTkZ2Yk94ckxFQW1Jc2lkUVlMRzg4VUJwQ1VE?=
 =?utf-8?B?SXFnTnNaQVlyRW5nbjJSK29iV0FrSkduZzlLTlVLT1hXaE1GM2xqY0FYeEdN?=
 =?utf-8?B?d1RuNzFCTTMvK3hZSjdJNzRxY3pNaVVDcmJ6cS9qM0NCUVRtZ3lCeW13MS8x?=
 =?utf-8?B?a3kwT0VkQkE4T09kMHhET1lyRHp2eE5yRmJvZG8yZEplVkxSTUdUU0hVVnoz?=
 =?utf-8?B?MWt6RHcweElwNVpFc1dJeHVzRlpNS2x5b1M1Mld0U2d6ajE0VzI1ZzNTbkN5?=
 =?utf-8?B?YkIwNVdiUmtKQ21zMVNsNDFsWGdNb2RrNnUxb2xzOFE1R1ZSb2w3WjlScHcw?=
 =?utf-8?B?cmNYMEIxdHBBWThPR2FKRXlaemN0WnUxekVxeCtBQjRoeWFlM0xFQU92Qm5B?=
 =?utf-8?B?QzNJQjJDQVNYSUI2ejZnblBSOTlzQmRoK0R3YzNxeWNYVGR0OG14Y0k2VEdt?=
 =?utf-8?B?YytYNllhbXVzcWJ3UE9YaVFpSzExOVJYaW5ZZmNOY0ZzNUY2dXRjK0gvZ0M5?=
 =?utf-8?B?cWRhVHYvcUg1Q2tMUGVHU1J5UGg4bjF4ODRxM1g2NlN3d25HOEZScUJhMnd1?=
 =?utf-8?B?eVVFU210VEdpQktrRStFK25yRUF6N0I5aWRHRGs2NmNOU2RXZXFGTUxsOVVI?=
 =?utf-8?B?OUt1K0JKWE5DSWY2aHdMQmhPNXhTelExVzFKWTAvTC8rMklaWmw5RjBUdUtl?=
 =?utf-8?B?aDFieUJ5VTNZb0tCd3Ixa1hpdTNkOWY1d3JBTllsNi9lUU42eDcrSFI2ZmNT?=
 =?utf-8?B?ZTBtUDhrUG5CbGRpclJkNTZraHhXR3dzb3VGbGJLVVpQV2pjSTBYZU1KZUJV?=
 =?utf-8?B?Y2lNMHBsbGRwcExqQW9ndmhlTk1tVk96aEtpMmdtQ1RPbTBobkpRRjIvVzQ3?=
 =?utf-8?B?YlNCQVp5ajJHWDYvMy9iQjM4ckFHZ2F1R1NtNDVwK2x1UlBXVG1idHRWb2hD?=
 =?utf-8?B?QU50VXVCcksrWWdCdW1FdVFMcEwxSzZsVWdoeHpDRTRmZStJRGlBTUFkNFlj?=
 =?utf-8?B?MHoyaW5PNUlMU0wxMnBxUVFUK0lld3Q5cmwzdkdFSmJEVDRpUFNKRHdDWGVD?=
 =?utf-8?B?NFpHaEx3VWpjempJemtPREtyVVJQRjB3WGd6YTRWOGFpcUVvUG83SVQ3M3lq?=
 =?utf-8?B?SEZ5eXJtNlJHcUU4WExxZ0xuQzcxc0JiNjJLTWFKWTZoVS9ZRlpleHlZZFpX?=
 =?utf-8?B?MnNwZlZjMlo4dzViQXdRWTlMdzRkOUdZaDdGYUpUS3JzZ1oxOG1uczZiUUN5?=
 =?utf-8?B?bFhQclY3L1cvYWZwMWR2K1JHaHFkaHJYVWVNdElvd2lHQzZmZmsyN0MzVEFD?=
 =?utf-8?B?dWdPNXRXZjM3MmhsVnhkaGFsazZWaHJLQ0ZLMVRSMUx5R2Z0SmdiMGlhV1dM?=
 =?utf-8?B?QVZkN3B5ZUc0dkVtdnNNMEI0dEpYL1g2WUdFaXBNOGxRcUREaGlsQk1ab3ZM?=
 =?utf-8?Q?zrX3vTE4RqymD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE8wVnVBS2FnNmY1TFhLaTQySUsyODBISStqZkRnWXhzZ1h5T2hMV292aHZr?=
 =?utf-8?B?U256VThURW1VOGIzTGxmNXp1OXdBK0M1RUhPdEdJeWpsYXF4VGdYYkdqbEVw?=
 =?utf-8?B?elg2UFBkbkNneHM3V2ZsODRkYVZiQnZ4d3lXZHdTdWdzSnNJYVFST3d0VDc5?=
 =?utf-8?B?a3pORFl1ZjNMWmlTZU1vTjFIdDN2TTExbUhKYW9mTkVNUHpoSlRyMDVUalQz?=
 =?utf-8?B?WTBiS05rMHVZTjlnMGJuVlRNc3dsL3A3NFJkVjdmeDZTdDVxSUVkT2V5SE9m?=
 =?utf-8?B?NGFUdHNoYm1HQms5ZmJCUWZVNkdRZnZoUEJMK0QrYkhSUUVRM3RrK2VzN3dp?=
 =?utf-8?B?bWlXM005QVI0T29jRnRSVy9jeWE4bTgxSXpvalhEOHNzSDFEMXBkRTZTVWM4?=
 =?utf-8?B?bThVeHo1d3FsaG05bWF6OVN4RW5YajB5VXZ3UWZ0NTVHZHBDZkZSMGdOUnZk?=
 =?utf-8?B?WklUb1hvOGpaS2hhRjZ6RlYyZmNYeWY3QUoxbGRyYi9CNTZjSjZTTUQvandq?=
 =?utf-8?B?K3dDZ3FST1Q2UEcyclYwbk9tbXh2dkR5ak9aK2FXWlp6RTFIN3VDUERvV2Mv?=
 =?utf-8?B?YVlVWVQ5THdFeERKZm5UMFZIaVA0L2d1RHhHcG5yUWhXcDl4SEhweW4rbCsw?=
 =?utf-8?B?S2Zwemo5eStWR2xCc1VnQlA2UHhvQ3plT1gzbnMvSTVtZ1FManlpMDR4eUx6?=
 =?utf-8?B?WElscDNiWEZoNjdROEU4czlwZmYwTXdhcDVOdlAwY21SRDlIZGVyeFI4WnBD?=
 =?utf-8?B?WEhMR0JFdHBuWFJNRnExbzZlazhpanpabi9wZlc5d0crdE5wNkxnNTUvSDlJ?=
 =?utf-8?B?ajJ1N0p6SUhlYzUvT2x2R0RxenJ2SFV3MGppeWg2amlEbG9aQXR1ZDBMbTNJ?=
 =?utf-8?B?TVcxL3JRYUJxNEtLMDZ1L3labHQzODFqUTFGSnBobkJsVTc1RXF3QW45QURu?=
 =?utf-8?B?OHNVZnYrSTlxZk5xOXlJcjBHV0ZvaDRGa08ybkU2WXhQek5rMVh0bDRGakFR?=
 =?utf-8?B?c1RkSG1IWG5jc054WGdCV0Ntb2pFRnRIRVB6Q0lpU1ZYbGRnN0xBUkpQajMr?=
 =?utf-8?B?a1ZETHdlMGhROUg3ZXU4MGlWSUZLV3JBaUsrSFpCM0pPcGJPSk9IUy9zZElj?=
 =?utf-8?B?U0pRT1pIK1ByRWFwTk9OTEVMZk8rdkM3T0JVcEhPc2xKazlxT1NqS2tWb2dl?=
 =?utf-8?B?VGNVcjZ6ckdTcjl6Nms5UlRRb3lieHFoYVltLzdUbDdzMGpjQWEzWEFING1H?=
 =?utf-8?B?MHpLVHhHS3h1MWdGck1lNFV0MXJ6Zng5dVNDMVNWUkZ5UFpqVnJ5RXZmM3Vw?=
 =?utf-8?B?dFIzc3dHa0h4U1pLUHFMWmk0WkVFVG5zckUwa3o4clZSaVdDQXpuNUZZaGV1?=
 =?utf-8?B?eFNQZVowK3VRZThPTTdKUWl1TEpTLzJkV0h4Z2c0TVBBVW5EYWJwdnBvMnQy?=
 =?utf-8?B?UGtYTXFaYlhtUU5aWWdiV3pUREU0bFhiY2tYb1pFT1kwS3J2aFJzeVc1Rm9s?=
 =?utf-8?B?VUZhdHlHTzVGRHlhL2ovVTlzbStSMjlPblpFUjY4T0dKVC9kc2J2TStkM3Z6?=
 =?utf-8?B?ZkM5YUFhbUlFVFBIMnZ4NzZHQnRiZDNmMUxRUU5paE4xeHJCYmI0L3VUUFVR?=
 =?utf-8?B?SXYvdi9MM0hQcE1VQ01CRkIxMWQ2ejBlbk8yRU4wUFE1cUEvcWZId0ttemFn?=
 =?utf-8?B?TXROSUY2Skh1T1FyWjFWSmFzQzdTMGF2d0ljT0FnVzd5Wk1zaWlEMCthMGxk?=
 =?utf-8?B?WEc3TlRJc0VIQVpMSnBYK3I3L1hjZmtxUGZ0M0JWTmRGNUFJRHZWZE8zdzNx?=
 =?utf-8?B?cjRKa3NZZXlreExnSHhTZGlFOThQbjBNTnZlYkRRRmNnamVDY2doSUpoR2dK?=
 =?utf-8?B?MjJHeUtJdVpiOWlhUW0xZWU5YVNGZXVLYis0ZkdqbVVudHYrK0ZqZENxVUxV?=
 =?utf-8?B?SkF4MlFVV3lGelBwOVpVYk1vUFg1dytrdXE1d2YxWU1OZUUvZk53VmR3N1V5?=
 =?utf-8?B?a3BsaVhGVi9MZ3QzQ1o2R3J2M1VtNGIxUGtBbkRMVEpMN1lZRWVKUzZjc2pB?=
 =?utf-8?B?R3pZOUxSY0NxOWQxMkE5T01oMmZxWVJiYTFKZ3d2b3BJV1QvSGlBRDRaZHVz?=
 =?utf-8?Q?1gHbRR0x3opUrVTbbqNUm/k4+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57848add-720b-4890-25f9-08dd72d4b277
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 17:26:41.4524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: saHMGT1AaY/SMyCI++b8i+7bgZhaiuOr3oK7Qq+7GteC+jvsvWH0WVxM5Tpgh54N6wxNp3kEEQU5ibwTBBw6vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7751
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

--------------r0uPJFml04Fe9z6JBDebHnt1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 01.04.2025 19:24, Michal Wajdeczko wrote:
> please use "drm/xe/vf:" in the subject as this patch is still more VF
> oriented, then general SRIOV
ok.
> On 31.03.2025 15:21, Tomasz Lis wrote:
>> We have only one GGTT for all IOV functions, with each VF having assigned
>> a range of addresses for its use. After migration, a VF can receive a
>> different range of addresses than it had initially.
>>
>> This implements shifting GGTT addresses within drm_mm nodes, so that
>> VMAs stay valid after migration. This will make the driver use new
>> addresses when accessing GGTT from the moment the shifting ends.
>>
>> By taking the ggtt->lock for the period of VMA fixups, this change
>> also adds constraint on that mutex. Any locks used during the recovery
>> cannot ever wait for hardware response - because after migration,
>> the hardware will not do anything until fixups are finished.
>>
>> v2: Moved some functs to xe_ggtt.c; moved shift computation to just
>>    after querying; improved documentation; switched some warns to asserts;
>>    skipping fixups when GGTT shift eq 0; iterating through tiles (Michal)
>> v3: Updated kerneldocs, removed unused funct, properly allocate
>>    balloning nodes if non existent
>> v4: Re-used ballooning functions from VF init, used bool in place of
>>    standard error codes
>> v5: Renamed one function
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ggtt.c              | 33 +++++++++
>>   drivers/gpu/drm/xe/xe_ggtt.h              |  1 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 83 +++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 +
>>   drivers/gpu/drm/xe/xe_sriov_vf.c          | 17 +++++
>>   6 files changed, 137 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 2d7456e37ef4..b13c4a12393e 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -482,6 +482,39 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
>>   	drm_mm_remove_node(&node->base);
>>   }
>>   
>> +/**
>> + * xe_ggtt_shift_mm_nodes - Shift GGTT nodes to adjust for a change in usable address range.
> drop "mm" from the function name as it is implementation detail
>
> 	xe_ggtt_shift_nodes()

The fact that nodes are used for Memory Management is an implementation 
detail?

I will remove `mm` from the name, because no other function uses that 
shortcut. But let's stick

to real arguments, ie. that no other function dealing with nodes has the 
_mm_ in name.

>> + * @ggtt: the &xe_ggtt struct instance
>> + * @shift: change to the location of area provisioned for current VF
> this function is quite generic and while it is used by the VF only, the
> parameter doesn't have to be described as such
I just changed the subject line because (from comment above) the patch 
is VF oriented.
> you may add here, in the 'longer description' part of the kernel-doc,
> after explaining how it works, that function is mostly used by the VF,
> and why we believe it will succeed

Not "mostly" but "only". There is no other scenario where we could 
anticipate this function to be used.

While universalization is generally a good direction, pretending that 
this code will ever be used for anything else than VF is not a direction 
with any chance for future benefits.

For the comment about errors - will add.

>> + */
>> +void xe_ggtt_shift_mm_nodes(struct xe_ggtt *ggtt, s64 shift)
>> +{
>> +	struct drm_mm_node *node, *tmpn;
>> +	LIST_HEAD(temp_list_head);
>> +	int err;
>> +
>> +	lockdep_assert_held(&ggtt->lock);
>> +
>> +	/*
>> +	 * Move nodes, from range previously assigned to this VF, to a temp list.
> nit: no need for multi-line comment style
>
> also, maybe it could be moved to the 'longer description' part of the
> function kernel-doc, after sanitize it from the 'VF' specific wording
>
>> +	 */
>> +	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
>> +		drm_mm_remove_node(node);
>> +		list_add(&node->node_list, &temp_list_head);
>> +	}
>> +
>> +	/*
>> +	 * Now the GGTT VM contains no nodes. We can re-add all VF nodes with
>> +	 * shifted offsets.
>> +	 */
> also consider to move this comment to function kernel-doc

Not sure why we want a detail on implementation in the function description.

Also not sure why we want detailed description block in this function, 
when we already have that in the caller.

But I don't mind, will move.

>> +	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
>> +		list_del(&node->node_list);
>> +		node->start += shift;
>> +		err = drm_mm_reserve_node(&ggtt->mm, node);
>> +		xe_tile_assert(ggtt->tile, !err);
> while we believe it should be always possible to 'shift' all nodes, as
> we just released our balloons, I'm not sure that this assert here alone
> is sufficient
>
> maybe before starting any movements, check that 'shift' is valid, and
> add asserts for each node that shifted location is within GGTT space?

Before starting? How exactly do we check the shift before we have any 
nodes? Without nodes, we have nothing to compare to.

I assume that what you're going for, is just to add more asserts on each 
node. Will do.

>> +	}
>> +}
>> +
>>   /**
>>    * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
>>    * @node: the &xe_ggtt_node to be inserted
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>> index 27e7d67de004..a07194cd3724 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>> @@ -18,6 +18,7 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>>   int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
>>   				u64 start, u64 size);
>>   void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
>> +void xe_ggtt_shift_mm_nodes(struct xe_ggtt *ggtt, s64 shift);
>>   
>>   int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
>>   int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 9edbe34f45f4..e9e7ddeb4254 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -415,6 +415,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>   	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>>   				start, start + size - 1, size / SZ_1K);
>>   
>> +	config->ggtt_shift = start - (s64)config->ggtt_base;
> on the first probe, shouldn't we store it as '0' ?

`ggtt_shift` is a part of`xe_gt`, allocated in `xe_gt_alloc()` using `kzalloc` variant. It is 
always zero on probe, regardless if first or not. But even regardless of 
that, the value of this parameter is valid only when within the 
post-migration recovery worker. It is not accessed outside, and noone 
cares about its value outside.

>>   	config->ggtt_base = start;
>>   	config->ggtt_size = size;
>>   
>> @@ -972,6 +973,88 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt)
>>   	return err;
>>   }
> hmm, are you sure that place between
>
> 	xe_gt_sriov_vf_query_runtime
> and
> 	vf_runtime_reg_cmp
>
> is the best place for this function?
>
> maybe at least place it closer to
>
> 	xe_gt_sriov_vf_migrated_event_handler
>
> that is at least partially related,
> but not sure if also not miss-located
no problem, will place it there.
>>   
>> +/**
>> + * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
>> + * @gt: the &xe_gt struct instance
>> + * Return: True if fixups are necessary
>> + *
>> + * Since Global GTT is not virtualized, each VF has an assigned range
>> + * within the global space. This range might have changed during migration,
>> + * which requires all memory addresses pointing to GGTT to be shifted.
> This 'longer description' shall be _after_ 'Return' description
>
> seehttps://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation
I see from the link than you meant `Return:` at the end. But I agreed to 
your comments below so the return vanishes completely.
>> + */
>> +bool xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt)
>> +{
>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> you should introduce xe_gt_sriov_vf_ggtt_shift() earlier than patch 4/4
> and use it here (or better let the caller use it and pass ggtt_shift as
> parameter)
will move that function earlier.
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
>> +	s64 ggtt_shift;
>> +
> assert that gt is not a media one
ok
>> +	mutex_lock(&ggtt->lock);
>> +	ggtt_shift = config->ggtt_shift;
>> +	/*
>> +	 * Move nodes, including balloons, from range previously assigned to this VF,
>> +	 * into newly provisioned area.
>> +	 *
>> +	 * The balloon nodes are there to eliminate unavailable ranges from use: one
>> +	 * reserves the GGTT area below the range for current VF, and another one
>> +	 * reserves area above.
>> +	 *
>> +	 * Below is a GGTT layout of example VF, with a certain address range assigned to
>> +	 * said VF, and inaccessible areas above and below:
>> +	 *
>> +	 *  0                                                                        4GiB
>> +	 *  |<--------------------------- Total GGTT size ----------------------------->|
>> +	 *      WOPCM                                                         GUC_TOP
>> +	 *      |<-------------- Area mappable by xe_ggtt instance ---------------->|
>> +	 *
>> +	 *  +---+---------------------------------+----------+----------------------+---+
>> +	 *  |\\\|/////////////////////////////////|  VF mem  |//////////////////////|\\\|
>> +	 *  +---+---------------------------------+----------+----------------------+---+
>> +	 *
>> +	 * Hardware enforced access rules before migration:
>> +	 *
>> +	 *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
>> +	 *
>> +	 * drm_mm nodes used for tracking allocations:
> use of drm_mm is implementation detail of the xe_ggtt and it is not
> relevant here, just say 'GGTT nodes'

We are trying to hide implementation details. Not because these details 
can vary/change - this will never happen.

We're just calling some things implementation details and hiding them 
because it is doable.

We've talked about this before, so will disagree but commit.

>> +	 *
>> +	 *     |<----------- balloon ------------>|<- nodes->|<----- balloon ------>|
>> +	 *
>> +	 * After the migration, GGTT area assigned to the VF might have shifted, either
>> +	 * to lower or to higher address. But we expect the total size and extra areas to
>> +	 * be identical, as migration can only happen between matching platforms.
>> +	 * Below is an example of GGTT layout of the VF after migration. Content of the
>> +	 * GGTT for VF has been moved to a new area, and we receive its address from GuC:
>> +	 *
>> +	 *  +---+----------------------+----------+---------------------------------+---+
>> +	 *  |\\\|//////////////////////|  VF mem  |/////////////////////////////////|\\\|
>> +	 *  +---+----------------------+----------+---------------------------------+---+
>> +	 *
>> +	 * Hardware enforced access rules after migration:
>> +	 *
>> +	 *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for VF ------->|
>> +	 *
>> +	 * So the VF has a new slice of GGTT assigned, and during migration process, the
>> +	 * memory content was copied to that new area. But the drm_mm nodes within xe kmd
>> +	 * are still tracking allocations using the old addresses. The nodes within VF
>> +	 * owned area have to be shifted, and balloon nodes need to be resized to
>> +	 * properly mask out areas not owned by the VF.
>> +	 *
>> +	 * Fixed drm_mm nodes used for tracking allocations:
>> +	 *
>> +	 *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
>> +	 *
>> +	 * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
>> +	 * overlap; but our node shifting will fix addresses properly regardless.
>> +	 */
> this inline comment is now much bigger than actual implementation
>
> why not promote it to the full DOC: as then it could be included in the
> master SRIOV documentation

will do.

..but for this case only. I will oppose to any tries of having the 
architecture docs rewritten as code comments.

>> +	if (ggtt_shift) {
>> +		xe_gt_sriov_vf_deballoon_ggtt(gt);
>> +		xe_ggtt_shift_mm_nodes(ggtt, ggtt_shift);
>> +		xe_gt_sriov_vf_balloon_ggtt(gt);
>> +	}
>> +	mutex_unlock(&ggtt->lock);
>> +	return ggtt_shift != 0;
>> +}
>> +
>>   static int vf_runtime_reg_cmp(const void *a, const void *b)
>>   {
>>   	const struct vf_runtime_reg *ra = a;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index c87b0e9c7ebc..13c04e313aa6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -20,6 +20,7 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_balloon_ggtt(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_deballoon_ggtt(struct xe_gt *gt);
>> +bool xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> index a57f13b5afcd..5ccbdf8d08b6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> @@ -40,6 +40,8 @@ struct xe_gt_sriov_vf_selfconfig {
>>   	u64 ggtt_base;
>>   	/** @ggtt_size: assigned size of the GGTT region. */
>>   	u64 ggtt_size;
>> +	/** @ggtt_shift: difference in ggtt_base on last migration */
>> +	s64 ggtt_shift;
>>   	/** @lmem_size: assigned size of the LMEM. */
>>   	u64 lmem_size;
>>   	/** @num_ctxs: assigned number of GuC submission context IDs. */
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index c1275e64aa9c..2eb6b8d8a217 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -7,6 +7,7 @@
>>   
>>   #include "xe_assert.h"
>>   #include "xe_device.h"
>> +#include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_pm.h"
>> @@ -170,6 +171,20 @@ static bool vf_post_migration_imminent(struct xe_device *xe)
>>   	work_pending(&xe->sriov.vf.migration.worker);
>>   }
>>   
>> +static bool vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
>> +{
>> +	struct xe_tile *tile;
>> +	unsigned int id;
>> +	bool need_fixups = false;
> try to define vars in reverse-xmas-tree order
>
> 	bool need_fixups = false;
> 	struct xe_tile *tile;
> 	unsigned int id;
ok
>> +
>> +	for_each_tile(tile, xe, id) {
>> +		struct xe_gt *gt = tile->primary_gt;
> 		shift = xe_gt_sriov_vf_ggtt_shift(gt);
> 		if (shift) {
> 			need_fixups = true;
> 			xe_gt_sriov_vf_fixup_ggtt_nodes(gt, shift);
> 		}

So in this specific place we want to make the function look longer and 
reveal a detail.

Makes no sense to me, but since you don't seem convinced by previous 
review round - will do this.

-Tomasz

>> +
>> +		need_fixups |= xe_gt_sriov_vf_fixup_ggtt_nodes(gt);
>> +	}
>> +	return need_fixups;
>> +}
>> +
>>   /*
>>    * Notify all GuCs about resource fixups apply finished.
>>    */
>> @@ -191,6 +206,7 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
>>   
>>   static void vf_post_migration_recovery(struct xe_device *xe)
>>   {
>> +	bool need_fixups;
>>   	int err;
>>   
>>   	drm_dbg(&xe->drm, "migration recovery in progress\n");
>> @@ -201,6 +217,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   	if (unlikely(err))
>>   		goto fail;
>>   
>> +	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>>   	/* FIXME: add the recovery steps */
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
--------------r0uPJFml04Fe9z6JBDebHnt1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 01.04.2025 19:24, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com">
      <pre wrap="" class="moz-quote-pre">please use &quot;drm/xe/vf:&quot; in the subject as this patch is still more VF
oriented, then general SRIOV</pre>
    </blockquote>
    ok.<br>
    <blockquote type="cite" cite="mid:69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com">
      <pre wrap="" class="moz-quote-pre">On 31.03.2025 15:21, Tomasz Lis wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">We have only one GGTT for all IOV functions, with each VF having assigned
a range of addresses for its use. After migration, a VF can receive a
different range of addresses than it had initially.

This implements shifting GGTT addresses within drm_mm nodes, so that
VMAs stay valid after migration. This will make the driver use new
addresses when accessing GGTT from the moment the shifting ends.

By taking the ggtt-&gt;lock for the period of VMA fixups, this change
also adds constraint on that mutex. Any locks used during the recovery
cannot ever wait for hardware response - because after migration,
the hardware will not do anything until fixups are finished.

v2: Moved some functs to xe_ggtt.c; moved shift computation to just
  after querying; improved documentation; switched some warns to asserts;
  skipping fixups when GGTT shift eq 0; iterating through tiles (Michal)
v3: Updated kerneldocs, removed unused funct, properly allocate
  balloning nodes if non existent
v4: Re-used ballooning functions from VF init, used bool in place of
  standard error codes
v5: Renamed one function

Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_ggtt.c              | 33 +++++++++
 drivers/gpu/drm/xe/xe_ggtt.h              |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 83 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 +
 drivers/gpu/drm/xe/xe_sriov_vf.c          | 17 +++++
 6 files changed, 137 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 2d7456e37ef4..b13c4a12393e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -482,6 +482,39 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
 	drm_mm_remove_node(&amp;node-&gt;base);
 }
 
+/**
+ * xe_ggtt_shift_mm_nodes - Shift GGTT nodes to adjust for a change in usable address range.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">drop &quot;mm&quot; from the function name as it is implementation detail

	xe_ggtt_shift_nodes()</pre>
    </blockquote>
    <p>The fact that nodes are used for Memory Management is an
      implementation detail?</p>
    <p>I will remove `mm` from the name, because no other function uses
      that shortcut. But let's stick</p>
    <p>to real arguments, ie. that no other function dealing with nodes
      has the _mm_ in name.<br>
    </p>
    <blockquote type="cite" cite="mid:69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * @ggtt: the &amp;xe_ggtt struct instance
+ * @shift: change to the location of area provisioned for current VF
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">this function is quite generic and while it is used by the VF only, the
parameter doesn't have to be described as such</pre>
    </blockquote>
    I just changed the subject line because (from comment above) the
    patch is VF oriented.<br>
    <blockquote type="cite" cite="mid:69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com">
      <pre wrap="" class="moz-quote-pre">you may add here, in the 'longer description' part of the kernel-doc,
after explaining how it works, that function is mostly used by the VF,
and why we believe it will succeed</pre>
    </blockquote>
    <p>Not &quot;mostly&quot; but &quot;only&quot;. There is no other scenario where we
      could anticipate this function to be used.</p>
    <p>While universalization is generally a good direction, pretending
      that this code will ever be used for anything else than VF is not
      a direction with any chance for future benefits.</p>
    <p>For the comment about errors - will add.<br>
    </p>
    <blockquote type="cite" cite="mid:69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ */
+void xe_ggtt_shift_mm_nodes(struct xe_ggtt *ggtt, s64 shift)
+{
+	struct drm_mm_node *node, *tmpn;
+	LIST_HEAD(temp_list_head);
+	int err;
+
+	lockdep_assert_held(&amp;ggtt-&gt;lock);
+
+	/*
+	 * Move nodes, from range previously assigned to this VF, to a temp list.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">nit: no need for multi-line comment style

also, maybe it could be moved to the 'longer description' part of the
function kernel-doc, after sanitize it from the 'VF' specific wording

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	 */
+	drm_mm_for_each_node_safe(node, tmpn, &amp;ggtt-&gt;mm) {
+		drm_mm_remove_node(node);
+		list_add(&amp;node-&gt;node_list, &amp;temp_list_head);
+	}
+
+	/*
+	 * Now the GGTT VM contains no nodes. We can re-add all VF nodes with
+	 * shifted offsets.
+	 */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">also consider to move this comment to function kernel-doc</pre>
    </blockquote>
    <p>Not sure why we want a detail on implementation in the function
      description.</p>
    <p>Also not sure why we want detailed description block in this
      function, when we already have that in the caller.<br>
    </p>
    <p>But I don't mind, will move.</p>
    <blockquote type="cite" cite="mid:69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	list_for_each_entry_safe(node, tmpn, &amp;temp_list_head, node_list) {
+		list_del(&amp;node-&gt;node_list);
+		node-&gt;start += shift;
+		err = drm_mm_reserve_node(&amp;ggtt-&gt;mm, node);
+		xe_tile_assert(ggtt-&gt;tile, !err);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">while we believe it should be always possible to 'shift' all nodes, as
we just released our balloons, I'm not sure that this assert here alone
is sufficient

maybe before starting any movements, check that 'shift' is valid, and
add asserts for each node that shifted location is within GGTT space?</pre>
    </blockquote>
    <p>Before starting? How exactly do we check the shift before we have
      any nodes? Without nodes, we have nothing to compare to.<br>
    </p>
    <p>I assume that what you're going for, is just to add more asserts
      on each node. Will do.<br>
    </p>
    <blockquote type="cite" cite="mid:69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	}
+}
+
 /**
  * xe_ggtt_node_insert_locked - Locked version to insert a &amp;xe_ggtt_node into the GGTT
  * @node: the &amp;xe_ggtt_node to be inserted
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 27e7d67de004..a07194cd3724 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -18,6 +18,7 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
 int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
 				u64 start, u64 size);
 void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
+void xe_ggtt_shift_mm_nodes(struct xe_ggtt *ggtt, s64 shift);
 
 int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
 int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 9edbe34f45f4..e9e7ddeb4254 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -415,6 +415,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 	xe_gt_sriov_dbg_verbose(gt, &quot;GGTT %#llx-%#llx = %lluK\n&quot;,
 				start, start + size - 1, size / SZ_1K);
 
+	config-&gt;ggtt_shift = start - (s64)config-&gt;ggtt_base;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">on the first probe, shouldn't we store it as '0' ?</pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre">`ggtt_shift` is a part of <span style="white-space: normal">`xe_gt`, allocated in `xe_gt_alloc()` using `kzalloc` variant. It is always zero on probe, regardless if first or not.
But even regardless of that, the value of this parameter is valid only when within the post-migration recovery worker. It is not accessed outside, and noone cares about its value outside.

</span></pre>
    <blockquote type="cite" cite="mid:69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	config-&gt;ggtt_base = start;
 	config-&gt;ggtt_size = size;
 
@@ -972,6 +973,88 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt)
 	return err;
 }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">hmm, are you sure that place between

	xe_gt_sriov_vf_query_runtime
and
	vf_runtime_reg_cmp

is the best place for this function?

maybe at least place it closer to

	xe_gt_sriov_vf_migrated_event_handler

that is at least partially related,
but not sure if also not miss-located</pre>
    </blockquote>
    no problem, will place it there.<br>
    <blockquote type="cite" cite="mid:69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 
+/**
+ * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
+ * @gt: the &amp;xe_gt struct instance
+ * Return: True if fixups are necessary
+ *
+ * Since Global GTT is not virtualized, each VF has an assigned range
+ * within the global space. This range might have changed during migration,
+ * which requires all memory addresses pointing to GGTT to be shifted.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">This 'longer description' shall be _after_ 'Return' description

see <a class="moz-txt-link-freetext" href="https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation">https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation</a></pre>
    </blockquote>
    I see from the link than you meant `Return:` at the end. But I
    agreed to your comments below so the return vanishes completely.<br>
    <blockquote type="cite" cite="mid:69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ */
+bool xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt)
+{
+	struct xe_gt_sriov_vf_selfconfig *config = &amp;gt-&gt;sriov.vf.self_config;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">you should introduce xe_gt_sriov_vf_ggtt_shift() earlier than patch 4/4
and use it here (or better let the caller use it and pass ggtt_shift as
parameter)</pre>
    </blockquote>
    will move that function earlier.<br>
    <blockquote type="cite" cite="mid:69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_ggtt *ggtt = tile-&gt;mem.ggtt;
+	s64 ggtt_shift;
+
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">assert that gt is not a media one</pre>
    </blockquote>
    ok<br>
    <blockquote type="cite" cite="mid:69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	mutex_lock(&amp;ggtt-&gt;lock);
+	ggtt_shift = config-&gt;ggtt_shift;
+	/*
+	 * Move nodes, including balloons, from range previously assigned to this VF,
+	 * into newly provisioned area.
+	 *
+	 * The balloon nodes are there to eliminate unavailable ranges from use: one
+	 * reserves the GGTT area below the range for current VF, and another one
+	 * reserves area above.
+	 *
+	 * Below is a GGTT layout of example VF, with a certain address range assigned to
+	 * said VF, and inaccessible areas above and below:
+	 *
+	 *  0                                                                        4GiB
+	 *  |&lt;--------------------------- Total GGTT size -----------------------------&gt;|
+	 *      WOPCM                                                         GUC_TOP
+	 *      |&lt;-------------- Area mappable by xe_ggtt instance ----------------&gt;|
+	 *
+	 *  +---+---------------------------------+----------+----------------------+---+
+	 *  |\\\|/////////////////////////////////|  VF mem  |//////////////////////|\\\|
+	 *  +---+---------------------------------+----------+----------------------+---+
+	 *
+	 * Hardware enforced access rules before migration:
+	 *
+	 *  |&lt;------- inaccessible for VF -------&gt;|&lt;VF owned&gt;|&lt;-- inaccessible for VF -&gt;|
+	 *
+	 * drm_mm nodes used for tracking allocations:
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">use of drm_mm is implementation detail of the xe_ggtt and it is not
relevant here, just say 'GGTT nodes'</pre>
    </blockquote>
    <p>We are trying to hide implementation details. Not because these
      details can vary/change - this will never happen.</p>
    <p>We're just calling some things implementation details and hiding
      them because it is doable.<br>
    </p>
    <p>We've talked about this before, so will disagree but commit.<br>
    </p>
    <blockquote type="cite" cite="mid:69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	 *
+	 *     |&lt;----------- balloon ------------&gt;|&lt;- nodes-&gt;|&lt;----- balloon ------&gt;|
+	 *
+	 * After the migration, GGTT area assigned to the VF might have shifted, either
+	 * to lower or to higher address. But we expect the total size and extra areas to
+	 * be identical, as migration can only happen between matching platforms.
+	 * Below is an example of GGTT layout of the VF after migration. Content of the
+	 * GGTT for VF has been moved to a new area, and we receive its address from GuC:
+	 *
+	 *  +---+----------------------+----------+---------------------------------+---+
+	 *  |\\\|//////////////////////|  VF mem  |/////////////////////////////////|\\\|
+	 *  +---+----------------------+----------+---------------------------------+---+
+	 *
+	 * Hardware enforced access rules after migration:
+	 *
+	 *  |&lt;- inaccessible for VF --&gt;|&lt;VF owned&gt;|&lt;------- inaccessible for VF -------&gt;|
+	 *
+	 * So the VF has a new slice of GGTT assigned, and during migration process, the
+	 * memory content was copied to that new area. But the drm_mm nodes within xe kmd
+	 * are still tracking allocations using the old addresses. The nodes within VF
+	 * owned area have to be shifted, and balloon nodes need to be resized to
+	 * properly mask out areas not owned by the VF.
+	 *
+	 * Fixed drm_mm nodes used for tracking allocations:
+	 *
+	 *     |&lt;------ balloon ------&gt;|&lt;- nodes-&gt;|&lt;----------- balloon -----------&gt;|
+	 *
+	 * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
+	 * overlap; but our node shifting will fix addresses properly regardless.
+	 */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">this inline comment is now much bigger than actual implementation

why not promote it to the full DOC: as then it could be included in the
master SRIOV documentation</pre>
    </blockquote>
    <p> will do.</p>
    <p>..but for this case only. I will oppose to any tries of having
      the architecture docs rewritten as code comments.</p>
    <blockquote type="cite" cite="mid:69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	if (ggtt_shift) {
+		xe_gt_sriov_vf_deballoon_ggtt(gt);
+		xe_ggtt_shift_mm_nodes(ggtt, ggtt_shift);
+		xe_gt_sriov_vf_balloon_ggtt(gt);
+	}
+	mutex_unlock(&amp;ggtt-&gt;lock);
+	return ggtt_shift != 0;
+}
+
 static int vf_runtime_reg_cmp(const void *a, const void *b)
 {
 	const struct vf_runtime_reg *ra = a;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index c87b0e9c7ebc..13c04e313aa6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -20,6 +20,7 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
 int xe_gt_sriov_vf_balloon_ggtt(struct xe_gt *gt);
 void xe_gt_sriov_vf_deballoon_ggtt(struct xe_gt *gt);
+bool xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt);
 int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index a57f13b5afcd..5ccbdf8d08b6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -40,6 +40,8 @@ struct xe_gt_sriov_vf_selfconfig {
 	u64 ggtt_base;
 	/** @ggtt_size: assigned size of the GGTT region. */
 	u64 ggtt_size;
+	/** @ggtt_shift: difference in ggtt_base on last migration */
+	s64 ggtt_shift;
 	/** @lmem_size: assigned size of the LMEM. */
 	u64 lmem_size;
 	/** @num_ctxs: assigned number of GuC submission context IDs. */
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index c1275e64aa9c..2eb6b8d8a217 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -7,6 +7,7 @@
 
 #include &quot;xe_assert.h&quot;
 #include &quot;xe_device.h&quot;
+#include &quot;xe_gt.h&quot;
 #include &quot;xe_gt_sriov_printk.h&quot;
 #include &quot;xe_gt_sriov_vf.h&quot;
 #include &quot;xe_pm.h&quot;
@@ -170,6 +171,20 @@ static bool vf_post_migration_imminent(struct xe_device *xe)
 	work_pending(&amp;xe-&gt;sriov.vf.migration.worker);
 }
 
+static bool vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	unsigned int id;
+	bool need_fixups = false;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">try to define vars in reverse-xmas-tree order

	bool need_fixups = false;
	struct xe_tile *tile;
	unsigned int id;</pre>
    </blockquote>
    ok<br>
    <blockquote type="cite" cite="mid:69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	for_each_tile(tile, xe, id) {
+		struct xe_gt *gt = tile-&gt;primary_gt;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">		shift = xe_gt_sriov_vf_ggtt_shift(gt);
		if (shift) {
			need_fixups = true;
			xe_gt_sriov_vf_fixup_ggtt_nodes(gt, shift);
		}</pre>
    </blockquote>
    <p>So in this specific place we want to make the function look
      longer and reveal a detail.</p>
    <p>Makes no sense to me, but since you don't seem convinced by
      previous review round - will do this.</p>
    <p>-Tomasz<br>
    </p>
    <blockquote type="cite" cite="mid:69797928-bf34-4f1f-b38f-dd68427d9fea@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+		need_fixups |= xe_gt_sriov_vf_fixup_ggtt_nodes(gt);
+	}
+	return need_fixups;
+}
+
 /*
  * Notify all GuCs about resource fixups apply finished.
  */
@@ -191,6 +206,7 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
 
 static void vf_post_migration_recovery(struct xe_device *xe)
 {
+	bool need_fixups;
 	int err;
 
 	drm_dbg(&amp;xe-&gt;drm, &quot;migration recovery in progress\n&quot;);
@@ -201,6 +217,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	if (unlikely(err))
 		goto fail;
 
+	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
 	/* FIXME: add the recovery steps */
 	vf_post_migration_notify_resfix_done(xe);
 	xe_pm_runtime_put(xe);
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------r0uPJFml04Fe9z6JBDebHnt1--
