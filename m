Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 804BE9A0041
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 06:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C67810E65E;
	Wed, 16 Oct 2024 04:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6jbyN9K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA11010E65A;
 Wed, 16 Oct 2024 04:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729053747; x=1760589747;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/vfA7wqnegc45Ge9Szmy8vSfdE7X+QoRvcpxNfyy0DQ=;
 b=a6jbyN9KND/bIAMgqsVuEaxo1qQ0XRja/uSgZ9A1Os0J3vm1X7SSAkcY
 RAGckIc2ntDy0V9Gjy/fzfAivOJ2kGU4g0GoJFawcuxsC3PoXSgLBtKbD
 A1C3+zOa928tQB/3MTqkF1xjzV5KonHNfPKOhnBu5o+fkdhLUoI2jmP3p
 oS/9kX8vwq7mqoZHbaocUSFDiLtmaiIJ9F2WLKGRO+mPJmunQ2HbTF3wk
 de5CrqTvtm90LKcJMOZ9RgmPWMrAToqoqUQOtWLi1VqMGNcd9cENzNL7e
 PEkuCRoe1vez1WKkl3Um1GvDALBBuRecx3SexyP8lEtCl1SeRpy8ThBy5 g==;
X-CSE-ConnectionGUID: jwFYV9snRA69Bew/ffiPKw==
X-CSE-MsgGUID: h1Zyrk2iQL60bRgpWkS2mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39856093"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="39856093"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 21:42:26 -0700
X-CSE-ConnectionGUID: W4yP9ZcMStWiExPKZg0R+w==
X-CSE-MsgGUID: O9EM77iOQVSoLSrj8RTBFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="78000263"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 21:42:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 21:42:25 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 21:42:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 21:42:25 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 21:42:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AH5s2jzLiFH/PKnMfMECqUDGmEQU8HiEpKkR/02T9MGG/1ZstmxXhAzQ0BlvOuTueqlySzyB2q5DuhGl1sVktdACzf0lyLTHt3BSw84VPunxIbTsUFdvioEJN6RXYYggQuGHHzDZFCrXA+uTixrHezRvBLt9EIlTlnvWlOsXqy+eAHLlJuVx1u680PPMzY8fA4YmuW3k0A58ZlSe0pr3zJzCo18s3VQJN/8A0gcJSx1nIKfgMMlGvCyX9sIjEZCUqQr8V8S/VS+w9IeWKTF3I7KKlCcO8AYLUdyZQv2aHQb/zRZhyES+hbUn4x0anJUfkPdJgyVeW8hlQeyX7TS+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pw3lKZX4x4GdQ/lzazf4YjEJSEncIEO2cgjs0yT8CZ8=;
 b=GPxhXon4UfSIxH/lP+Q5iBSLF1X42x/rAY8K2pMxrrZShu7HeGPh7AXO+7s+6QFOFAnhZ/qLdJIeVONnCFl+mCPBik2piPpov2hNORgCeeJdCKrnm39AXhZ+f7/rEAEZwuiHWa/QwPZj4Q9SlQ68R2vtjuDTvEf/oJnlVbAWrd+qv51iTj7RyYZZQkFMM0VdBOOw61bgYAsU0dtt78b4BZYyqyoPFCsv4GroIY4PC8fhc4H/vbdoTYC8kVAa8QVbx6rAZIzTHJL4LrEz5uWuzxuoK/xsNRAx1yZ+LVIMo7sIylRg9th4JQ8biuCqIvbLTkd/4YzJOvmq4B+74g4rCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 04:42:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 04:42:22 +0000
Date: Wed, 16 Oct 2024 04:41:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 03/29] mm/migrate: Trylock device page in do_swap_page
Message-ID: <Zw9EBRHCZkLvXmZs@DUT025-TGLU.fm.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-4-matthew.brost@intel.com>
 <87sesw8ziu.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sesw8ziu.fsf@nvdebian.thelocal>
X-ClientProxiedBy: SJ0PR05CA0126.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 51e5f995-8ac5-455f-a295-08dced9cec9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?AMqvdqvCrWENV5uXTqIpVsiiL+UBG7V+ZHRwf0aKiVhPqfG+UCz83pj6Wj?=
 =?iso-8859-1?Q?OlC+++6zOIEJBXcS5GkMrM2QKziuw+qtAk9DP1DvzrTxf7uLBuYsPddpTG?=
 =?iso-8859-1?Q?Wsnebk6XG2czhxICkNt2K/1fBKl4WCNCi4/0+C6w+4MKOytQP0e9AaYCZ7?=
 =?iso-8859-1?Q?1I9fLnOpyJ7Uu/qSXB1m5LrfJhSds2mFvnQlUUtI/aCwpqMxgUwd9XY/Kc?=
 =?iso-8859-1?Q?/BayYIBiC3Eegu0VQtpyLBnEx1CC5T5NoQCNAEsgDN1/tzi7NTGEIZ88LV?=
 =?iso-8859-1?Q?AWTDKmLF+t6OIa3S34fRvDfHAIuDlikYlzBILlZOyowD6zm+g+NwsOHhvd?=
 =?iso-8859-1?Q?bmvMedbbVSmWfS0M1rVGRlxWgwbzsIVZQDJeH9ymnDx3iHTAn5jCBeqwTO?=
 =?iso-8859-1?Q?SGvn/7Ys9FfjuYeUeLAfkQpVwWAy/O7C81PBk/NZPz301KWMLw24b7/vWw?=
 =?iso-8859-1?Q?sOrT6Dk53F0cdWrnBBVSPqHI6yQ1TuPFNOh6Pc3Cql7ADgnccRDGqPdS5+?=
 =?iso-8859-1?Q?LIttsmLLL5tE6DulOfCx2O2celU6zA8cBUQYJ10r3GyTVcqEoGXChpfiZf?=
 =?iso-8859-1?Q?8Mt/PudfLR4eIJovnYaQxK88S8XpctiEjeCJlnGEDddGTjE330S/EryS0d?=
 =?iso-8859-1?Q?9Y76eLtTLlvJZuPSJwbGMR31/y/YjKJ+TUdyFTZnWktNbn2NBDyCuLVYxK?=
 =?iso-8859-1?Q?lGU7ZlddDUYpscunDMowR9mJ5yleswQcS2aAOV1mYYWP5TTG/YZPhF35f5?=
 =?iso-8859-1?Q?ldr+xgYM2AlCc3QWZ/O3Xvr4uBSAiBPPUQfpenPInEPFHKt31PDVheFqA8?=
 =?iso-8859-1?Q?1hwqMiEI6tOmLahTQ5AEO9cgRyA5P5/uYOpkAk1MKFzV/j4PlWhGXMgI8X?=
 =?iso-8859-1?Q?X0leklP0hy1hb7mUgB0JWX5/keUcvhpTJpyWtqfvuBy+t6KUNYZj438bHQ?=
 =?iso-8859-1?Q?qWQaWkVwGqVEUKr0fZ4ozNt7QFGn9vmUJwdsTOjW6jLpqt84Yvn4oeb+6X?=
 =?iso-8859-1?Q?uWCLB4Mu0ILd3sWUDspXNqEn7Tl6kWGDZYIoGHOi+TgBu2ArSV6IfeAEEQ?=
 =?iso-8859-1?Q?O5rUfAZd0VUcZPKTaVMJcOTsUIXiMsgst+TMmDv0Qss0FBWxLk+vmN+Xsj?=
 =?iso-8859-1?Q?7+YKPY7LJW28F5YEM0TOzO2Tzp9madwrq8WwhbPtgwI7PPaUs4eCvtS7lK?=
 =?iso-8859-1?Q?C3IJTetQinyE0RUpk4jVLJw5BQKARp/5KE0QiybLidAtXPh5pPymaVfdIg?=
 =?iso-8859-1?Q?BQStnubRdrT1jTrHuMlPh9R3UTBZ06OdyvmoXFXvPxd05Svbb0ierX7XTN?=
 =?iso-8859-1?Q?o0Nik5LK0P21muyVBoTpPMwdyw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?M1mqMyLTTQo5+Lvii8tv2IbY+0PSoy9ix2KKVyv81cFAZAJ6mM17BpluEB?=
 =?iso-8859-1?Q?B/gb95aVal8787EZdBSbNXgCciR22ze/nVi0M0cvoo27rtA3MacZeyBUwF?=
 =?iso-8859-1?Q?3T8Npl2SgLPfnbgN1ZwXvn9v6vc6ge4wRfLwETnQtR/oVZay/uFf8F4oiw?=
 =?iso-8859-1?Q?efT+GVom5DGpcEC4JCKzErQUHeX8jvh6pcpC81VceqWjlSKESVtSadlkoZ?=
 =?iso-8859-1?Q?BMwIRSOmdB/fxEU3IF1GbrjvFiFHxtEpXx3b9uWX9Sml+1xCcGnKks0ivf?=
 =?iso-8859-1?Q?dUaGOLwshK5ypZcLjxhFJoTW2LcGs78MCu3SURLVMOkBPYDTwDSgl8y2Yf?=
 =?iso-8859-1?Q?5ZRz7MUeiOJ3T4QTPhsaXiGoMgY+G80oeGfsQsUqFdpcY/HINax9hrMf+x?=
 =?iso-8859-1?Q?gZnotArp4UI5ZlCqoPlNMMx83hTbl0gsq4r4JGm+Gg7WYg6tEAab4qVtHk?=
 =?iso-8859-1?Q?XpsVF0IrvwKcd3TKjbCQqdrySL57iHLzskqeSZchska8r4MsfJ5u5ideWL?=
 =?iso-8859-1?Q?dw93gjjilmoHDmYRn+HoQoWyynNx3qUuO7ukkKUD+xKpplao1SvpRwlKcS?=
 =?iso-8859-1?Q?hHjJ6e0Rubq6dd3JUyZ7I8RsuaWC65E0xFs5CUjqcbKoNfSOkdL0KSImCc?=
 =?iso-8859-1?Q?PMaF5sOcK7e98r+8SjXJLUybdrfC88RZN2z+kYVOGxG/hJwaO9fmRCi2BU?=
 =?iso-8859-1?Q?wwaNGa7NcTabmLXt47KOmGLvFq8UrtL33j2BvtTjDS0HqtB0ItRW3LEtal?=
 =?iso-8859-1?Q?oLJx1rfA4wch7eVuNp6QmiKXv77ZS9B9Zz7+OQ4SBQavXZurRJbuHDYyQV?=
 =?iso-8859-1?Q?lHUZQoqJuzLk3frgWpyNpwF3X8PSs1HXIs5PSBpfdZB9kiK0MqpmbjuI6y?=
 =?iso-8859-1?Q?VnwYHkHQbv5odNy3UyM1D3KqggsgPZ3w5HmXvi99XrI+0uUDTIINMCTLKA?=
 =?iso-8859-1?Q?uayq8hSwNDyhmd/cYa34rYcDVeB2fKKXytGNSLKmupxXGbLyb32jRgiayE?=
 =?iso-8859-1?Q?E922zaURVnvI2njWK6lzfnu7hR5T/BHMfc9kCswNB4LOD4K2WZKRmLjCGL?=
 =?iso-8859-1?Q?ctqSq/JSFPnMAKfMcRCa3GNS9o5JQEU8o8F9+jAjrt06GXudazincBm2iu?=
 =?iso-8859-1?Q?UV6VYEUdRHpWzY7JnWtB92J649jZkFctfFeqOZfrMDrFa8Xdk7hblAlili?=
 =?iso-8859-1?Q?CeOhOvTSeCJVasO8UrQxMCgJ92+bhyFqLPgybrAC3tm2vNEcOJor+UnJ0B?=
 =?iso-8859-1?Q?P8C/aIM7VFQVR0FutMqWGp0G8Tx8wDVXUxWtHW5mHpoZqG2tm37TzYiNFP?=
 =?iso-8859-1?Q?C0vP/WgC5SXLnr5NEp7Xn/JIr3l+k7395oh1ayBFVs9q+BefeIUH6fdaju?=
 =?iso-8859-1?Q?PGYgywb2+2LpHdM9e3EtEM/gi/z8jPiGf+Udc9wfCk2WjGa5eQYT8AdcFH?=
 =?iso-8859-1?Q?K03pdDBBTyVRt3kqZDcfHqMrHY0eUL8jq7Tc4vAN4UvRCyT2JLCKw/fK2U?=
 =?iso-8859-1?Q?/sFFUKG+tn4lEzOt39Fsc2J3jiT+ADhtv4i2jGPnE4/el9Y0jxb3aiXv+0?=
 =?iso-8859-1?Q?bWP7+1X7IxuXdaHpwO6ys+acKKnz1XmTt9H93HZCV1556Q+nugdO3uXJXJ?=
 =?iso-8859-1?Q?/XJ782iUORwVXLVIoVBDQsAAaTvAhBMNOjVN2gJZZ4K+KmSg9uwl4v5w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e5f995-8ac5-455f-a295-08dced9cec9b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 04:42:22.1206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /XilQALvVR917dZFvmBeziTcGYAzwJoKR51wHIZebTgAjMyiC698Opyai8JGmfuYh74GxJDlyAue3MdfsU26OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
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

On Wed, Oct 16, 2024 at 03:00:08PM +1100, Alistair Popple wrote:
> 
> Matthew Brost <matthew.brost@intel.com> writes:
> 
> > Avoid multiple CPU page faults to the same device page racing by trying
> > to lock the page in do_swap_page before taking an extra reference to the
> > page. This prevents scenarios where multiple CPU page faults each take
> > an extra reference to a device page, which could abort migration in
> > folio_migrate_mapping. With the device page being locked in
> > do_swap_page, the migrate_vma_* functions need to be updated to avoid
> > locking the fault_page argument.
> >
> > Prior to this change, a livelock scenario could occur in Xe's (Intel GPU
> > DRM driver) SVM implementation if enough threads faulted the same device
> > page.
> >
> > Cc: Philip Yang <Philip.Yang@amd.com>
> > Cc: Felix Kuehling <felix.kuehling@amd.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  mm/memory.c         | 13 ++++++---
> >  mm/migrate_device.c | 69 ++++++++++++++++++++++++++++++---------------
> >  2 files changed, 56 insertions(+), 26 deletions(-)
> >
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 2366578015ad..b72bde782611 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -4252,10 +4252,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> >  			 * Get a page reference while we know the page can't be
> >  			 * freed.
> >  			 */
> > -			get_page(vmf->page);
> > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> > -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > -			put_page(vmf->page);
> > +			if (trylock_page(vmf->page)) {
> > +				get_page(vmf->page);
> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > +				put_page(vmf->page);
> > +				unlock_page(vmf->page);
> 
> I don't think my previous review of this change has really been
> addressed. Why don't we just install the migration entry here? Seems
> like it would be a much simpler way of solving this.
> 

I should have mentioned this in the cover-letter, I haven't got around
to trying that out yet. Included this existing version for correctness
but I also think this is not strickly required to merge this series as
our locking in migrate_to_ram only relies on the core MM locks so
some thread would eventually win the race and make forward progress.

So I guess just ignore this patch and will send an updated version
individually with installing a migration entry in do_swap_page. If for
some reason that doesn't work, I'll respond here explaining why.

Matt

> > +			} else {
> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > +			}
> >  		} else if (is_hwpoison_entry(entry)) {
> >  			ret = VM_FAULT_HWPOISON;
> >  		} else if (is_pte_marker_entry(entry)) {
> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > index f163c2131022..2477d39f57be 100644
> > --- a/mm/migrate_device.c
> > +++ b/mm/migrate_device.c
> > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  				   struct mm_walk *walk)
> >  {
> >  	struct migrate_vma *migrate = walk->private;
> > +	struct folio *fault_folio = migrate->fault_page ?
> > +		page_folio(migrate->fault_page) : NULL;
> >  	struct vm_area_struct *vma = walk->vma;
> >  	struct mm_struct *mm = vma->vm_mm;
> >  	unsigned long addr = start, unmapped = 0;
> > @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  
> >  			folio_get(folio);
> >  			spin_unlock(ptl);
> > -			if (unlikely(!folio_trylock(folio)))
> > +			if (unlikely(fault_folio != folio &&
> > +				     !folio_trylock(folio)))
> >  				return migrate_vma_collect_skip(start, end,
> >  								walk);
> >  			ret = split_folio(folio);
> > -			folio_unlock(folio);
> > +			if (fault_folio != folio)
> > +				folio_unlock(folio);
> >  			folio_put(folio);
> >  			if (ret)
> >  				return migrate_vma_collect_skip(start, end,
> > @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  		 * optimisation to avoid walking the rmap later with
> >  		 * try_to_migrate().
> >  		 */
> > -		if (folio_trylock(folio)) {
> > +		if (fault_folio == folio || folio_trylock(folio)) {
> >  			bool anon_exclusive;
> >  			pte_t swp_pte;
> >  
> > @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  
> >  				if (folio_try_share_anon_rmap_pte(folio, page)) {
> >  					set_pte_at(mm, addr, ptep, pte);
> > -					folio_unlock(folio);
> > +					if (fault_folio != folio)
> > +						folio_unlock(folio);
> >  					folio_put(folio);
> >  					mpfn = 0;
> >  					goto next;
> > @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> >  					  unsigned long npages,
> >  					  struct page *fault_page)
> >  {
> > +	struct folio *fault_folio = fault_page ?
> > +		page_folio(fault_page) : NULL;
> >  	unsigned long i, restore = 0;
> >  	bool allow_drain = true;
> >  	unsigned long unmapped = 0;
> > @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> >  		remove_migration_ptes(folio, folio, 0);
> >  
> >  		src_pfns[i] = 0;
> > -		folio_unlock(folio);
> > +		if (fault_folio != folio)
> > +			folio_unlock(folio);
> >  		folio_put(folio);
> >  		restore--;
> >  	}
> > @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
> >  		return -EINVAL;
> >  	if (args->fault_page && !is_device_private_page(args->fault_page))
> >  		return -EINVAL;
> > +	if (args->fault_page && !PageLocked(args->fault_page))
> > +		return -EINVAL;
> >  
> >  	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> >  	args->cpages = 0;
> > @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
> >  }
> >  EXPORT_SYMBOL(migrate_vma_pages);
> >  
> > -/*
> > - * migrate_device_finalize() - complete page migration
> > - * @src_pfns: src_pfns returned from migrate_device_range()
> > - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > - * @npages: number of pages in the range
> > - *
> > - * Completes migration of the page by removing special migration entries.
> > - * Drivers must ensure copying of page data is complete and visible to the CPU
> > - * before calling this.
> > - */
> > -void migrate_device_finalize(unsigned long *src_pfns,
> > -			unsigned long *dst_pfns, unsigned long npages)
> > +static void __migrate_device_finalize(unsigned long *src_pfns,
> > +				      unsigned long *dst_pfns,
> > +				      unsigned long npages,
> > +				      struct page *fault_page)
> >  {
> > +	struct folio *fault_folio = fault_page ?
> > +		page_folio(fault_page) : NULL;
> >  	unsigned long i;
> >  
> >  	for (i = 0; i < npages; i++) {
> > @@ -824,7 +828,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >  
> >  		if (!page) {
> >  			if (dst) {
> > -				folio_unlock(dst);
> > +				if (fault_folio != dst)
> > +					folio_unlock(dst);
> >  				folio_put(dst);
> >  			}
> >  			continue;
> > @@ -834,14 +839,16 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >  
> >  		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
> >  			if (dst) {
> > -				folio_unlock(dst);
> > +				if (fault_folio != dst)
> > +					folio_unlock(dst);
> >  				folio_put(dst);
> >  			}
> >  			dst = src;
> >  		}
> >  
> >  		remove_migration_ptes(src, dst, 0);
> > -		folio_unlock(src);
> > +		if (fault_folio != src)
> > +			folio_unlock(src);
> >  
> >  		if (folio_is_zone_device(src))
> >  			folio_put(src);
> > @@ -849,7 +856,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >  			folio_putback_lru(src);
> >  
> >  		if (dst != src) {
> > -			folio_unlock(dst);
> > +			if (fault_folio != dst)
> > +				folio_unlock(dst);
> >  			if (folio_is_zone_device(dst))
> >  				folio_put(dst);
> >  			else
> > @@ -857,6 +865,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >  		}
> >  	}
> >  }
> > +
> > +/*
> > + * migrate_device_finalize() - complete page migration
> > + * @src_pfns: src_pfns returned from migrate_device_range()
> > + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > + * @npages: number of pages in the range
> > + *
> > + * Completes migration of the page by removing special migration entries.
> > + * Drivers must ensure copying of page data is complete and visible to the CPU
> > + * before calling this.
> > + */
> > +void migrate_device_finalize(unsigned long *src_pfns,
> > +			unsigned long *dst_pfns, unsigned long npages)
> > +{
> > +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
> > +}
> >  EXPORT_SYMBOL(migrate_device_finalize);
> >  
> >  /**
> > @@ -872,7 +896,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
> >   */
> >  void migrate_vma_finalize(struct migrate_vma *migrate)
> >  {
> > -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> > +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> > +				  migrate->fault_page);
> >  }
> >  EXPORT_SYMBOL(migrate_vma_finalize);
> 
