Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BBVmCGGof2l9vQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 20:24:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A55C70DE
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 20:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D23610E1EB;
	Sun,  1 Feb 2026 19:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d+wnyDk7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FAE10E0E6;
 Sun,  1 Feb 2026 19:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769973852; x=1801509852;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XYq9OIjAng4/34dCfAjPzP0qwBvTHodIiPZUNoU0T9I=;
 b=d+wnyDk786KpIVZaP71QvVpaO1lcIGbgWV4U6yu7ok9stjwvx5dC7jhW
 NFiI4gRXDuMCX6QgsqUABmz+VP0A2J4ukznE3JbbiUqqJnewCBIwSVA2u
 G8EtjManQGeG0bYFb58SOQKHDTKzJQwJcK+BtJ0oGKsCmSMw7weR3E23l
 v+Y4qtI0kxYFjvUUkjDTcKOES/XSjCjeNT4YPAPagG4iVRSA2FVC0HoBa
 OQpP/m+obF2gEt6qOpcd5aRdL1veZf4xphHBISpCn0r47X8Dx4CtGTsV9
 yYPur/gLKUzv66Xs2hT61+cSlCx85uPnRih6DsSWWkqsOVPo7S8DujKQ5 w==;
X-CSE-ConnectionGUID: occqhvX/Sb2lTdCwwrSYpg==
X-CSE-MsgGUID: gx4BzA9gRo6UEA1EH6XU5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71124961"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; d="scan'208";a="71124961"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 11:24:11 -0800
X-CSE-ConnectionGUID: gcnOAcALRMuTtHFe1heJFg==
X-CSE-MsgGUID: 1WVCCYzvT1a8b3SGdyclGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; d="scan'208";a="209645176"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 11:24:10 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 11:24:09 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 1 Feb 2026 11:24:09 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 11:24:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3nzEZfyPoeM2MCv4bbbdJz3FOQZIU6pfXoNCM6NlgBAasIOgD0sOZZO42dY6MO+HFISdP5oTMEeYmSkfnWNojR581CVPPlbJ6CTIC8vMPIEcaeCj9CCVRLOJJsoZeALcAyYm9/oXrMNfWFOVhBEniB9E6t+nqxbdgW2YWrAKRHlSqtPa5mUK6pDc2yaDeNBcXGJQhfXwbTLxbF6eO8rPr0uvPGaez/8CwQGPy3WY8f2lVsRh0eXtdSIbYxc1g0V4Yp7fCFGs6G6qiGdICEkgBXT065mExUVw9SFD+sLJRUHn357b9QyTm+Sdne6bPQu6Q85XbY92SphiTU7hL92rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NNJL7/J9rSUU2jb8u9N8RWciXmISEJjiZyG7OgeamE=;
 b=ZiEKIdCK7BfdZV0hWpGigC9xI7pyOQrXpLhES0+kJhGLwKwJpyQQnHeZ3iYbxqC74x6hkBtnN2C0uQbrYAX0iwe7hChgPFL//xtuL6I2t3Tv4l377np5YbctrzGPoKMEHTEmZVAJ8Bsi/WD5A8JED2su2eCux1/lhGmBGg/aV5/NHbrFMp8em1vd4PpY3tX6+rA1zlmyBnhSm/39BcI6UVgVA0JsDK5WwQ1JmYgO80bLTi90jzDDSGTioSawdE2onu2XWTG2mlXlkDSU6KeCwWZDA7N6UQKHrrNPdfRgCOqno6DGcsdvSiUMgIAYyeJj90YnDZaC1AMSbC1gwR0NOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA1PR11MB7061.namprd11.prod.outlook.com (2603:10b6:806:2ba::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Sun, 1 Feb
 2026 19:24:06 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%3]) with mapi id 15.20.9564.014; Sun, 1 Feb 2026
 19:24:06 +0000
Date: Sun, 1 Feb 2026 11:24:02 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, <intel-xe@lists.freedesktop.org>,
 Ralph Campbell <rcampbell@nvidia.com>, Christoph Hellwig <hch@lst.de>, "Jason
 Gunthorpe" <jgg@mellanox.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon
 Romanovsky <leon@kernel.org>, <linux-mm@kvack.org>, <stable@vger.kernel.org>, 
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-ID: <aX+oUorOWPt1xbgw@lstrano-desk.jf.intel.com>
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
 <57fd7f99-fa21-41eb-b484-56778ded457a@nvidia.com>
 <2d96c9318f2a5fc594dc6b4772b6ce7017a45ad9.camel@linux.intel.com>
 <aX5RQBxYB029/dkt@lstrano-desk.jf.intel.com>
 <0025ee21-2a6c-4c6e-a49a-2df525d3faa1@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0025ee21-2a6c-4c6e-a49a-2df525d3faa1@nvidia.com>
X-ClientProxiedBy: MW4PR04CA0125.namprd04.prod.outlook.com
 (2603:10b6:303:84::10) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA1PR11MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: 123710ff-f279-439f-3796-08de61c77774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjBObERyZDlaQnNDb1lvOEhkc3BPVTB2TXEweW5GM3c2RXR0RVA0SnlkeWpU?=
 =?utf-8?B?QnZsdmFhVW1sbFZTNmpVRUpKaEFlQkhaeDlNQ3lDZ01zdHE0ZXB0OG9mb3dv?=
 =?utf-8?B?UXdUZHdaRENENDN4N1Q5R0FIUGozUlBZQm1zMjNlMU1sMEVvTmRtUEluTUov?=
 =?utf-8?B?Sjl2V2xBQlRHa3hyTk9wNTh1Ylk0VnkwVXFqRXpRUlNXRjhzeStHWktOdGdU?=
 =?utf-8?B?TmIvbUM4RnZIQm1nV1Y4Tkx0RXFOaHc0TGZsNlUzRXlIV1BmRk5FSlNZTmYw?=
 =?utf-8?B?N2RLQ1ZzT2Z4aGpScERoNGVyUVJNSnRLckJtYkdTRGV6QjhnbjVYMGZ3SnhH?=
 =?utf-8?B?dWVFREhVTHpLcEVKOTkrTTI0MllZNXd4aS9mWlo2bnE4K0RObEM0YmltdFJL?=
 =?utf-8?B?UGFtQmoxaXJIeEpYQ1hFSnpkV1BwbklFZEFVK0RQVmJpeERRNFltOGlYd2Fj?=
 =?utf-8?B?dklicERQK0h4K3owWGN4WTVQQzVmeWg1L2ticmoyZ09tRHRlWlNodHpWUUdl?=
 =?utf-8?B?eFdHSHBvdVBQaXRKTEI3eEhRYlUrQTAwaHF5S0Q1T2t0M0V0K3YvcmYveUgy?=
 =?utf-8?B?OVNZNXVLSFI4WWJhTU5hRUJzb2dyc2taTnV2bnRjYUN2R2phVHdTbmRRK3Jr?=
 =?utf-8?B?RGRDR1pUcXBCY1NUbDZmMHh2UlVCSnZYY090UW0veEZuYnhqWmZNbHNzemFp?=
 =?utf-8?B?OVdDMHpqYkxzNDhhamNEV2ZXeEJCeEJLTG5qS0I3Q0NaaDhrelcxanRJcUIv?=
 =?utf-8?B?WG4yMk9USnhpcXYzVDFtT01NUE9aOEdXaU1tZ052S1A0ejAraTNlQVEzUUpl?=
 =?utf-8?B?QVdYazNyQlJJNG90dzBOcUpaRXlGQW1xVmIvSUJRdXoxVmpJOE9EZ28xSWRJ?=
 =?utf-8?B?ajdGNU9KbU0rUTQ2emxmaDBrdCtDL0lwTjVzbHNQbE5HRjVZcjZ4eDZQZUhQ?=
 =?utf-8?B?TFFiODBvdGdnNzRlY1JmTkFTL0JVZU5tOGhRcWtySWE4RnVaOVIrcXpQcmNK?=
 =?utf-8?B?UTFLbTduZXlzMFlEeWw5MGdKSHMrS1JnYUdYOWppZ1pndG1LdmpIbmdQeThI?=
 =?utf-8?B?ZzN3UWsrb2ZNbG0yNGZhTHdUY3c4NjRXVGJFRlZ2RTM3QkYxVmdUNkNLd2R4?=
 =?utf-8?B?SGRVTkQzQUlCdVZHMmRDQVVOTjY5TnFtZnhwaGdnTkJvMEMxTW9NVm5raitT?=
 =?utf-8?B?bGw0blQ5SGpEY3VhTmlpSzJheFQwRHBTMjJjNit6bHJxNjNyS3pnUnBGTVk5?=
 =?utf-8?B?Ykt1S1NaRTNUTWp0VmlmeDl2VHA4aFgyYUpteE9sNVUzbFNLSVRhQlpzSUdk?=
 =?utf-8?B?ZkFIZWJ3R1FFaXJoczU1TkpWbHZXS1RNZ045SURLSGE3RUliaGFOMElhVWpx?=
 =?utf-8?B?QXp4cmxBbHZOelZKdHhnYm5nd0lwVHdSbGEwMnZPZmMrYkVTRzFmek9qNmxC?=
 =?utf-8?B?K0psc3Vzam1aRjdBS1BIM0lkbUdiWXpjdHFSeWNaNm1XSCtOVldWVzBhdE5S?=
 =?utf-8?B?WkN0aEhUZjIwdWIzV1NvOGJDVUpORTA5dUVjL3AyWjhQN05Nd2dHaTVROXow?=
 =?utf-8?B?UUN2SlBZQ09HVllqSWRxaDhYNEc2SHF3V0xOZGtLSFJuZkRoY3hmaG9CL0l6?=
 =?utf-8?B?aTFkb3RGcExaT0hLNnlGNUFVMEREdzRKc1dRTk9CNkxWVFdobW5NWGRxbmhS?=
 =?utf-8?B?bmsrWVFZWXVNWHVENFprUktiZi9VMSsrdjQ2Z3ZMaC9KZGY0MTlCc2xIY1dT?=
 =?utf-8?B?eUxDQkw2QkYrajNyc1cxbXdvU2pVRExwYUpHejZqdllOTzJGdzdYSDQ4SzU5?=
 =?utf-8?B?YlE1NmYrQS8zL1JIRmErQmFDZGxNTjdPSXlRNHIwNmRodERzUTBCRWxkYklG?=
 =?utf-8?B?SmVwNHlwaHdGcXRWYjJjY1dVWmpQM05mNVlrbkkxZThWczFCMHkvYU1MZklR?=
 =?utf-8?B?eXNrODVJVTFCS3BUKzNEQm1kNktSU3ZLZXduaklCM2pFNXJzWGI5M1ZMWjRJ?=
 =?utf-8?B?K1ZDNVFPeUx5Q05nWGxPWnBablBreXkzbzA2U3RRamp1S0lOWk9EYzJTcW9M?=
 =?utf-8?B?V20rUVNRdG8vV0E5OVNVdG53MWI5V2FuYzlVVWt5WDZleTdVMTRoazFEdzZn?=
 =?utf-8?Q?uJpw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjZnclY2clcxN2QzK3FxempTeFpuL2dkTDZlbkRjcWxwbU1TVTNmYTdkV1Vw?=
 =?utf-8?B?dmVQNFNTUloza3lPYTdKelVIQ0tZSllGRkFpY2x2bHhJcEFtZE93MXFIYXBD?=
 =?utf-8?B?N05xOW43WkJkWnpjbFMwcldwQW1QRWlMOE1wd2VLMDFIdlp0SHY1ekRFbmw0?=
 =?utf-8?B?K3cxZVJUMTZYUjlUS0FvOFBsbGxtdjI5Q2FpWk1ZMVBNNTFVcWJ2c0J3UFVu?=
 =?utf-8?B?NHZHcThKZ3V0eDVSZUdHNXBnREl6RW8vRytpUHkrS2Z0V0pES0NOSFdqeDNi?=
 =?utf-8?B?Q1l5ZGVGQ1BWbWZOUEpmQWF1QmNpMm4wT1UzUVViNVhJa1hWcEFGTzNBTCs4?=
 =?utf-8?B?NWQxL2xNdmUvQTNjYmJRbGVpRzMxbnVGNndFbDAvdlQxdm1wWXJuZnBTdzA2?=
 =?utf-8?B?cDAyNEFKalkvcHpmUjJLc3hMMHR4UmFBTGM2NG1HWW5ONWNoQUdSS05sVFZE?=
 =?utf-8?B?WTNxeU1kUXgwRWVjMTdpZjZHQXNsbTI2K1lSUFNpcEVWOU1CQ1hHNlNncmFI?=
 =?utf-8?B?Sk9vRTlDUThBdnA4SGw3YU1pTjNmOTNhQWh3L3o2K2MrZi80UEppL0ZRelhS?=
 =?utf-8?B?NUlZUjR4ZmNqVXlRVFRzWEM2WnY1NngvMDkxSmtjdFRmbFBqRWZpT3dMNzdR?=
 =?utf-8?B?aDVBUkdtR1daTzhuc1lyekxsa01EcEJSc09kRlR6NlhsU2FXaUg3NWpFSWpW?=
 =?utf-8?B?UVk2cHl0UENDMnhtZXE0WndrMW5qT3hBbmdVY3BQaW1QKzMyOEZ3NW5nOHR0?=
 =?utf-8?B?RGhrSmU0Zjc5N1d5MzRQM3p0M1lRRmR1Qy9CN0t4MXRzRE8wcTRNeTFSSXU3?=
 =?utf-8?B?anZFbUVhNWxxdnQvMWk1WHZCdHpGaFYxTkwxZFdoMjhsTmFOMFJHUmJ3bkV3?=
 =?utf-8?B?SVZmekdVbnFOSk1wcmRpckVnQmtQLzhwR0h0OFdWZzZjN3h0RkZDUWRodUww?=
 =?utf-8?B?dVovYktIOHFvMVNnUlJrbUI5eWlIQURRUXloOEk5dEN1S1dBVU5zdDFyang4?=
 =?utf-8?B?K3RTZjlaNS9zbVFNS0QrU2YzcStERjZlZnpHbHhMNUc0L1R2OG5OWHpUdCtj?=
 =?utf-8?B?OEMzVnlBbHVOeDUyNDBYejI5aFU5VDFoSE9JUFU3dVdxMmYrejIwMEZtK2M4?=
 =?utf-8?B?aklSOHRZTVRBVDlsUld1ZW83NTM3Zi9ZTTc4NGFkMkNLeTVFai9XRndPeXdH?=
 =?utf-8?B?T2Zidks3RlJhYWZzckJZTmJZN2lRNGFGanpkeWdkYWMxM0psbFFsWFptZWxT?=
 =?utf-8?B?VnREbytsTnMrcEdmanBITzR0MmFSWFF3VVRxT0hlQWttUDc5czgyRnhzakV0?=
 =?utf-8?B?T2N3YjBXTG9mOVlIWjQzL05XM3RFMm5yVG5KZjBBZk9PTkZvOVNSbGtxVndY?=
 =?utf-8?B?bDJPL0VEa0V6VWorRXdFdStDeVAxb21SeWN6QnlhcEY3eHY5ZjdCeDYwL3Bw?=
 =?utf-8?B?U28vUjN1Uk1nVXFxeWh0SXVEbUI4NWxkQ0M1QXlkYUJaS20vSVBxRG42dGVh?=
 =?utf-8?B?K2dROS8wWVZ2cGprRDFzSWh3WGRaN2ovZTdlUTAzb3ZZaDRNaThBSURtQ3py?=
 =?utf-8?B?aXk3TWExTjBpTHJ3bkRDWFZZK2ZCeHRUdHJldUtWTWlKS2RtUkIvN0t1UXdj?=
 =?utf-8?B?RGhUQVlabzJhZHZ6SFc0VkRXYlNraTV1REFkUmZIZzh2WGltNUpmamZ5V1Rl?=
 =?utf-8?B?d2VTME5leDZ4VkhqUDRHUnZHVGNUUGlnNUpYL1g5SmRNdzVNMFVPQ2haM2dq?=
 =?utf-8?B?ZmFEVmNNMHpOVGpBZ2tCN2ZiaWFRV3BoL0NHZFZOWStkZVIrNmRLdGpxTitw?=
 =?utf-8?B?ZFpZaWhua2xPM0lXVXAvVzljbFlyU3lDRytWT1FsVGNXMWpseHlWVlhxTlha?=
 =?utf-8?B?MHJXV01yUUt5bXBEaDJGVnY4RC82aTdmaU9hcklaYkJDS0ROVmZCUWYzdmt2?=
 =?utf-8?B?S3kxY0lrN29QNU5KRHZIQUZiZFowQUlteGZJVTRWTzJrQWdPUTN1cnBrc05i?=
 =?utf-8?B?ZEZFK0RYVFFnRXF6dEVWaWNxUzJjYXN6eCtqM0pMRm1ZaXlWVTN1M29yR0Zt?=
 =?utf-8?B?djNtZUpUMnAwQW9YbVphYWY0NG5IOWR1dldlTk1IZVpvNGl3NDQzQXdGQ1N5?=
 =?utf-8?B?Ty9vcXdXdDIwNHlMOWQyTm9vd2c0dmMzSlprUGR1T3h0VkN5RjlGTFpGNWJi?=
 =?utf-8?B?cEJVR3hMSkpDWFRiMGZSQXJ6NndEVXZGY3h5K1ZlOUZaNy9Db2IwNWNNdm1h?=
 =?utf-8?B?bzRlUER2RUpkbnJ5am13NkczaUh0VUl1dGhqQmVaM2gremhvS1MyaGROdHl0?=
 =?utf-8?B?TE4yNFlTTVRJRzFnQ0FUM3BKeWNvcmNnWUFFdkhnMWdJWjhyeHBJdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 123710ff-f279-439f-3796-08de61c77774
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2026 19:24:06.6698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HVapqBYVE0qiCTgEdKhDfnnX49EzWmcAWfNrDhIpuihqA9oeS6chb2LHdjgra0wJVmOtYeyfc+AqKIwAZbZsYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7061
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 62A55C70DE
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 01:42:20PM -0800, John Hubbard wrote:
> On 1/31/26 11:00 AM, Matthew Brost wrote:
> > On Sat, Jan 31, 2026 at 01:57:21PM +0100, Thomas Hellström wrote:
> > > On Fri, 2026-01-30 at 19:01 -0800, John Hubbard wrote:
> > > > On 1/30/26 10:00 AM, Andrew Morton wrote:
> > > > > On Fri, 30 Jan 2026 15:45:29 +0100 Thomas Hellström
> > > > > <thomas.hellstrom@linux.intel.com> wrote:
> > > > ...
> > > It looks like lru_cache_disable() is using synchronize_rcu_expedited(),
> > > which whould be a huge performance killer?
> > > 
> > 
> > Yep. I’ve done some quick testing with John’s patch, and
> > xe_exec_system_alloc slows down by what seems like orders of magnitude in
> 
> ouchie!
> 
> > certain sections. I haven’t done a deep dive yet, but the initial results
> > don’t look good.
> > 
> > I also eventually hit a kernel deadlock. I have the stack trace saved.
> > 
> > >  From the migrate code it looks like it's calling lru_add_drain_all()
> > > once only, because migration is still best effort, so it's accepting
> > > failures if someone adds pages to the per-cpu lru_add structures,
> > > rather than wanting to take the heavy performance loss of
> > > lru_cache_disable().
> 
> Yes, I'm clearly far too biased right now towards "make migration
> succeed more often" (some notes below). lru_cache_disable() is sounding
> awfully severe in terms of perf loss.
> 
> > > 
> > > The problem at hand is also solved if we move the lru_add_drain_all()
> > > out of the page-locked region in migrate_vma_setup(), like if we hit a
> > > system folio not on the LRU, we'd unlock all folios, call
> > > lru_add_drain_all() and retry from start.
> > > 
> > 
> > That seems like something to try. It should actually be pretty easy to
> > implement as well. It’s good to determine whether a backoff like this is
> 
> This does seem like a less drastic fix, and it keeps the same design.
> 

Perhaps Thomas and I can look at this option during the work week.

> > common, and whether the backoff causes a performance hit or leads to a
> > large number of retries under the right race conditions.
> > 
> > > But the root cause, even though lru_add_drain_all() is bad-behaving, is
> > > IMHO the trylock spin in hmm_range_fault(). This is relatively recently
> > > introduced to avoid another livelock problem, but there were other
> > > fixes associated with that as well, so might not be strictly necessary.
> > > 
> > > IIRC he original non-trylocking code in do_swap_page() first took a
> > 
> > Here is change for reference:
> > 
> > git format-patch -1 1afaeb8293c9a
> > 
> > > reference to the folio, released the page-table lock and then performed
> > > a sleeping folio lock. Problem was that if the folio was already locked
> > 
> > So original code never had page lock.
> > 
> > > for migration, that additional folio refcount would block migration
> > 
> > The additional folio refcount could block migration, so if multiple
> > threads fault the same page you could spin thousands of times before
> > one of them actually wins the race and moves the page. Or, if
> > migrate_to_ram contends on some common mutex or similar structure
> > (Xe/GPU SVM doesn’t, but AMD and Nouveau do), you could get a stable
> > livelock.
> > 
> > > (which might not be a big problem considering do_swap_page() might want
> > > to migrate to system ram anyway). @Matt Brost what's your take on this?
> > > 
> > 
> > The primary reason I used a trylock in do_swap_page is because the
> > migrate_vma_* functions also use trylocks. It seems reasonable to
> 
> Those are trylocks because it is collecting multiple pages/folios, so in
> order to avoid deadlocks (very easy to hit with that pattern), it goes
> with trylock.
> 
> > simply convert the lock in do_swap_page to a sleeping lock. I believe
> > that would solve this issue for both non-RT and RT threads. I don’t know
> > enough about the MM to say whether using a sleeping lock here is
> > acceptable, though. Perhaps Andrew can provide guidance.
> 
> This might actually be possible.
> 
> > 
> > > I'm also not sure a folio refcount should block migration after the
> > > introduction of pinned (like in pin_user_pages) pages. Rather perhaps a
> > > folio pin-count should block migration and in that case do_swap_page()
> > > can definitely do a sleeping folio lock and the problem is gone.
> 
> A problem for that specific point is that pincount and refcount both
> mean, "the page is pinned" (which in turn literally means "not allowed
> to migrate/move").
> 
> (In fact, pincount is implemented in terms of refcount, in most
> configurations still.)
> 
> > > 
> > 
> > I’m not convinced the folio refcount has any bearing if we can take a
> > sleeping lock in do_swap_page, but perhaps I’m missing something.
> 
> So far, I am not able to find a problem with your proposal. So,
> something like this I believe could actually work:
> 

I did something slightly more defensive with a refcount protection, but
this seems to work + fix the raised by Thomas and shows no noticeable
performance difference. If we go this route, do_huge_pmd_device_private
would need to be updated with the same pattern as well - I don't have
large device pages enabled in current test branch but would have to test
that part out too.

diff --git a/mm/memory.c b/mm/memory.c
index da360a6eb8a4..1e7ccc4a1a6c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4652,6 +4652,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
                        vmf->page = softleaf_to_page(entry);
                        ret = remove_device_exclusive_entry(vmf);
                } else if (softleaf_is_device_private(entry)) {
+                       struct dev_pagemap *pgmap;
+
                        if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
                                /*
                                 * migrate_to_ram is not yet ready to operate
@@ -4670,21 +4672,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
                                                        vmf->orig_pte)))
                                goto unlock;

-                       /*
-                        * Get a page reference while we know the page can't be
-                        * freed.
-                        */
-                       if (trylock_page(vmf->page)) {
-                               struct dev_pagemap *pgmap;
-
-                               get_page(vmf->page);
-                               pte_unmap_unlock(vmf->pte, vmf->ptl);
+                       pte_unmap_unlock(vmf->pte, vmf->ptl);
+                       lock_page(vmf->page);
+                       if (get_page_unless_zero(vmf->page)) {
                                pgmap = page_pgmap(vmf->page);
                                ret = pgmap->ops->migrate_to_ram(vmf);
                                unlock_page(vmf->page);
                                put_page(vmf->page);
                        } else {
-                               pte_unmap_unlock(vmf->pte, vmf->ptl);
+                               unlock_page(vmf->page);
                        }
                } else if (softleaf_is_hwpoison(entry)) {
                        ret = VM_FAULT_HWPOISON;

> diff --git a/mm/memory.c b/mm/memory.c
> index da360a6eb8a4..af73430e7888 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4652,6 +4652,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>  			vmf->page = softleaf_to_page(entry);
>  			ret = remove_device_exclusive_entry(vmf);
>  		} else if (softleaf_is_device_private(entry)) {
> +			struct dev_pagemap *pgmap;
> +
>  			if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
>  				/*
>  				 * migrate_to_ram is not yet ready to operate
> @@ -4674,18 +4676,13 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>  			 * Get a page reference while we know the page can't be
>  			 * freed.
>  			 */
> -			if (trylock_page(vmf->page)) {
> -				struct dev_pagemap *pgmap;
> -
> -				get_page(vmf->page);
> -				pte_unmap_unlock(vmf->pte, vmf->ptl);
> -				pgmap = page_pgmap(vmf->page);
> -				ret = pgmap->ops->migrate_to_ram(vmf);
> -				unlock_page(vmf->page);
> -				put_page(vmf->page);
> -			} else {
> -				pte_unmap_unlock(vmf->pte, vmf->ptl);
> -			}
> +			get_page(vmf->page);
> +			pte_unmap_unlock(vmf->pte, vmf->ptl);
> +			lock_page(vmf->page);
> +			pgmap = page_pgmap(vmf->page);
> +			ret = pgmap->ops->migrate_to_ram(vmf);
> +			unlock_page(vmf->page);
> +			put_page(vmf->page);
>  		} else if (softleaf_is_hwpoison(entry)) {
>  			ret = VM_FAULT_HWPOISON;
>  		} else if (softleaf_is_marker(entry)) {
> 
> > 
> > > But it looks like an AR for us to try to check how bad
> > > lru_cache_disable() really is. And perhaps compare with an
> > > unconditional lru_add_drain_all() at migration start.
> > > 
> > > Does anybody know who would be able to tell whether a page refcount
> > > still should block migration (like today) or whether that could
> > > actually be relaxed to a page pincount?
> 
> Yes, it really should block migration, see my response above: both
> pincount and refcount literally mean "do not move this page".
> 
> As an aside because it might help at some point, I'm just now testing a
> tiny patchset that uses:
> 
>     wait_var_event_killable(&folio->_refcount,
>                             folio_ref_count(folio) <= expected)
> 
> during migration, paired with:
> 
>      wake_up_var(&folio->_refcount) in put_page().
> 
> This waits for the expected refcount, instead of doing a blind, tight
> retry loop during migration attempts. This lets migration succeed even
> when waiting a long time for another caller to release a refcount.
> 
> It works well, but of course, it also has a potentially serious
> performance cost (which I need to quantify), because it adds cycles to
> the put_page() hot path. Which is why I haven't posted it yet, even as
> an RFC. It's still in the "is this even reasonable" stage, just food
> for thought here.
> 

If you post an RFC we (Intel) can give it try as we have tests that
really stress migration in odd ways and have fairly good metrics to
catch perf issues too.

Matt

> thanks,
> -- 
> John Hubbard
