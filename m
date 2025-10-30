Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4FAC1DF19
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 01:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63AC10E875;
	Thu, 30 Oct 2025 00:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9Qm4mGs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB3B10E871;
 Thu, 30 Oct 2025 00:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761785045; x=1793321045;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DAzy5qBbN5LFPlBclGLmM4V8qqzoXf/63IIKpo2Fs8U=;
 b=S9Qm4mGsz7g2Kro5IA6T3NQzzOT9fHkp55ANv8onAwCRS6voKWaPLP7c
 b/abLNVVhq1NRC7rW61GMRQt+e8UW9JODe/xmZevQEDRFRQdKvgE+wTNy
 uxUYqxqWmuUAU5M6DgDkPE69q2vV4tIYJ7ZI0yNxtVAGrFGLn/ew6WwSC
 MrFoK+XouqnWtFdDRUgbEjMszlM/+9XXoxsKQe6riJWI9989TzGC0pomM
 g1p53R+CW+Q32/p5vR8VzbYYdDqTAD8bPY2po+/VkIrsoXJYG70fEexfA
 3oVmGRYorFSFOSHl0JDSc1N0ZY1drqQNFtZipxbnz4lG7YybEKIbJnCn5 Q==;
X-CSE-ConnectionGUID: k8MrAslpSPeLILvzGLsBeA==
X-CSE-MsgGUID: 1Brw2/9mSUeirYru3EIx9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="86546728"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="86546728"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 17:44:04 -0700
X-CSE-ConnectionGUID: Sx6X89bRQPaE6H/tHxygJA==
X-CSE-MsgGUID: S43kY2uJQVGKe5eUacwTQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="185746168"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 17:44:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 17:44:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 17:44:03 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 17:44:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJiv25VXMY8Gn2FRr2mrd+fPU8JT8+8mcnaWQuFN4/acVTRYA9Xr2WOcxh5/S8GgJkKRrsxDcMFv3FdNXxPStPIeBdwXwaDw9wQ4a/rZDVllId83iQVcKjidcKDKzFVmldqpOw3huDnXqDpmIxpgCt8ERjFvm0ct25JxzEUn6O9IqIJZ3r/dD70qpeXPhKLBXKb+ytCTofQNfkfNq8eFV74YAuKzofZCxgL0FoUGtKVBp9Usw0I71qvBLGxWquBcQ2FZKAZry08CpkYongoqGx93Hwp8rSeafi+hoZlXvCdmfXco/Q3yMw/jkimJSfkBxvOh0moVE1tXQTYD1i+P9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fBN5CH1q1A9LkaibykID1p6+PB9cV8WHoLTK8aEduM=;
 b=olyHZXsfrdRDh/5NE5J52DZkiT5TBz9xDqGUpAZUVoLkuPq7dL54hUjUDq1H97IGTQjAAgCHBfSe3SHSi3zhTIOxke40YQ6T7x5GoM7BcLd9ddpWy1uc0atE/1CFxBGdcugdjaoKAh+1x9ijEO1DjcQV3cipbiDS+GXMJhu688JL4v9X6MzQ0bg9luWdELvwYsT+YP0oiyvpQcFjufS8KYWxtkRrZ91E5pzq47+MYGVXmjFJu+JU8Ok1yW2z3DHan9sz3jw4soGkKSK+ClQP+LA4/colZWWUK0sx1x0X5wKtCivutec+TlnzWQvjndWjeQDTxUNp18X2BFdmhjCYXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPF8C0509479.namprd11.prod.outlook.com (2603:10b6:518:1::d37)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 00:44:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Thu, 30 Oct 2025
 00:43:59 +0000
Date: Wed, 29 Oct 2025 17:43:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 05/15] drm/xe: Use the drm_pagemap cache and shrinker
Message-ID: <aQK0zQCAwgd5tHXe@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-6-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0044.namprd07.prod.outlook.com
 (2603:10b6:a03:60::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPF8C0509479:EE_
X-MS-Office365-Filtering-Correlation-Id: 460c9422-f0e1-48d3-a961-08de174d6a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHVJaDhvRjQvS3dHbHhmSjFBTWFNbmtNbjYzREQ4VmE1N29RSDdlNEVVdkE5?=
 =?utf-8?B?dXJ1ai9BbFJVM2JERUlUQzh1UGsvZk9NdTIwdnJ4OGVNald3WGFpZG40UzVz?=
 =?utf-8?B?ZVRaMi8wRkxTTHhsVWtUS3Z5ZWxPanFncjR0TTJGdjZnOWhzL1lHOTBWc3lX?=
 =?utf-8?B?TldLV3Vnd3lkaHlEdVZ3c2w0bHA0WC9yWmFKbWU5cHl1d3pubWdDalF4cWRm?=
 =?utf-8?B?MWg3bUdOdkkvZU9CcVUvdmcrdU8wdVZWOGt2b2dmUkVNM0VEYnlTUWIyd3VF?=
 =?utf-8?B?MWxyOFNBNGNrOHorUlIyZi9KR3h5SWhQSHdLeDNtY2l5NmwyeWo3UHdZeHdn?=
 =?utf-8?B?dUpyQUtwNldLS01talFPK2hvR2x1TDRnK21LazhJUVBoc1NCTzRCKy9uYVE3?=
 =?utf-8?B?UUJzbUk1VkJiOEJ5STFkK2ZDRzQ5NVdFODQ0emZXVmZCOXlzbkNTa1VPalNo?=
 =?utf-8?B?N0V3cmZtS1lVNEw1OWJVSTlNQnpWNCtJZEFWUUswSWp0SG5yU3ZtNWcxdDR3?=
 =?utf-8?B?UXF1ajZIaVM1SzZ3a0c1R0hDbFhMVkNCUWQzTW51c0hwTGxrd3kzQzRnNDFv?=
 =?utf-8?B?SW53QW9WaVE5dmNzbVlLWHM3UGUyeGticXF3ajBNZTJJcHVoelY4NWIxQW5F?=
 =?utf-8?B?SEViYk1DMUdXTWVrTU1IRUdUVndLc2FSRStLWk42ekR6SW5NYkdtQTE3Y2t0?=
 =?utf-8?B?VlFMN3lWSnNIYll0T2JLd2Jxam1UZGdmckJsblh6TkNMZGF2ZHRaSXFNZlNm?=
 =?utf-8?B?SVpaWnRpSkhobnRWU0F2VEpWa1pPY1NjVjcxVGw4NHVQQXNZazRBNmlERHd1?=
 =?utf-8?B?NlVSOEtTZ1hiMVcxMUpMRU1MWUpTSkdWYUxGcWdVekdlY1lwZUNZeW0rd0Jk?=
 =?utf-8?B?c3EwSldaSHhUUmZaU0VSYzRaWFBFM3dCVThhNFl4YjBGeE1ray9YbGpVZUdn?=
 =?utf-8?B?ZU9JbXc3SDNHaFFLMTZQdXJGclZrMEtuM3FJK2V6eDdYQldXcVJjYTJSb1Jx?=
 =?utf-8?B?aEN0L1h4aXh4UDB4ZkpBWmpOV3NzK2wwaWM3dXFtL2hmOEpWMGZTTTZSQUlJ?=
 =?utf-8?B?eVFuLzZQTVpETUMrc3NSNUwzVVZvc2FhTzJRSUZ1NURaeThhUytaUHo5TlBG?=
 =?utf-8?B?aEpra2RXaXpqUTFxTDdRNFpjNWx0WVBNWjBkMU0zclRDOVFZQ3Eya2MwYWkx?=
 =?utf-8?B?M3pYcVB1NENERkxuUTgxamdidWVYT0Nuc3F2U0Rkd2N2aS9vYm9HeDJsSm5X?=
 =?utf-8?B?dHU3SXFkbWUvaWowbStkaklWS3N2ZVJ1TyszOUpnRzhNaDUyMUkvdm1KUTJ0?=
 =?utf-8?B?ZXdxTWlodmpBaFNoRFNTNW04Nm50bGYxL09lK3NHSmVDaE4yM3BDaGRqMkFP?=
 =?utf-8?B?Z1Yxamc1Y1ZLNFZFejdMUXBkazNpK0tTTzFZcXhwVGkwQWw3cEhEbnRVdjFY?=
 =?utf-8?B?aUpqam9qT01PVXJqSjBNMVVLbnFKaklqL2krWXB1djk2NFd0K05lWkF2c25Y?=
 =?utf-8?B?Y3ZNK0puT3J2TEdXSklmamtnNjhqZkcrY3N1TW80dC9iMENXeldkUGdQdm9P?=
 =?utf-8?B?aitUM0lwNTRxVnArMERDbTMrdzR0QThJOGVDNVhSSWhQQytXdGFiM0xieG5q?=
 =?utf-8?B?VFd2cVdlWjBNTUJibWNXMFc5cmRQUHMzbHRjM2hycTVHMW9IM3RaOUF6Q2lx?=
 =?utf-8?B?d2w2NTJ6dWNCdm5iaEN4VW9TellSTUlTUXNRT0ZGQkZUTzFBb3RlWkllT1Fq?=
 =?utf-8?B?dm1rbFFDZzZjclZxRG9GNlRQUGNYZ3Y3cWJHMVN0ZEFXK1Fyd2tzQlRTODBF?=
 =?utf-8?B?NzljRmFxajRDTUVVZzVDYSttamtyakI0V1VzYnBlWWZCbUczSDdzN0oxVmg0?=
 =?utf-8?B?WndHaUh0Q1JiNVRsZXBTOWVIWC93N2J3VGE4MjlCYnVEVXhEZXR0L2g0d2FZ?=
 =?utf-8?Q?vkSyq7l1rxFd3MRa2cKyeQbX36M6//JW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHVjMUdpZTdybndscXorUjVqTlVYbVpPVk9RM1ZMTnViVng1eXkyWmR5RkNo?=
 =?utf-8?B?L1hJbGZVeDZMMzA0V0pHdmlPRHdhNjUwSGhZbXlZbG0wclpWSlJFaGplNG0v?=
 =?utf-8?B?MzFqRUp6eURDN2xpbGtZVEx6QnFJaCtMbTFSSUhXKzB1SStsbTROb2Z1SWky?=
 =?utf-8?B?U1V2aWZsMHkrOFBlS0ZBUlFFNWNNWjI0bm5HbGxXQ2xRWEJRYmhNa094RWMv?=
 =?utf-8?B?Uld4YjJIQm9PSUV3amVLdzZ2Nlc2b21UaisxK3o4ZFA0REJEWUlCM1hGcDZY?=
 =?utf-8?B?RUVmRzlHaFVWaXMvY3krdlhjdlhhN2NkRXI2NVZVenB4WU05d0tjK1lORTdB?=
 =?utf-8?B?c2xaK2ZsU2puMHNsbjFCMzBVei80UWdnR3AvcGcrbFBXM2c3NDN4dUhaVFRs?=
 =?utf-8?B?eER0cUpXanlxT2RqWFpzZWJvNmhtTGRkWi9obldCTHRhWnBuR1FVTWNHVFln?=
 =?utf-8?B?UGYwYlArU1VyV1BOSFovWFlKcWxYV2xkYjE0NDM3end1dHY3M0pNNlBkcWhy?=
 =?utf-8?B?Z2FLQVNEcTBwclA2cTcrSEpqWWRFTUpFZFRmWXorY1UzR0F1VjVSVUZKNFd1?=
 =?utf-8?B?RDFpeHorUGVueExFNEEyUFdkdjFsa0o2TS9JVmJJZzJHZjc3K2VVRmg2VTU5?=
 =?utf-8?B?dHVtbkdQcC95SjBoSmNZaWRQNWlscmx1Zi9EOStQMzU0VlJoWjg5ZnBYUzhm?=
 =?utf-8?B?cXhaNTM3NWNPdUc3cTdkWlIwUkRpb3F5SGZmcFVVelJ2ZzAxZS9IeDZ2elhx?=
 =?utf-8?B?TzdtUkxxQnJmSkNhU3h6YzJPU2cxdkpmZlZjQXp1aE1ySnVvZ3dqTGNTZFVC?=
 =?utf-8?B?eWIxQzRFQmFYeDNlekZHVWRzeXBPbDlDcjU2N05RZk1ub1lLN2RsajNtZGVM?=
 =?utf-8?B?Vm9lcEdCd0JZUUNnWGw1QXNVTk1QVEdpUzNmYjZHR1NEc3Zja0srcnQxNUJC?=
 =?utf-8?B?NkhMa1ZhSEtIQmVPcG4zeUxhYzBZdVp5M0xQVG5JLzM3d3lpTVR3aUY3RTAr?=
 =?utf-8?B?N2E3RGRJUUhDV3FhenF1N3dCVmlhQ0VhOHRvM2hNK3VNTnVOYkoxUXE0cEls?=
 =?utf-8?B?VGs5SzJEejdtNmIwTUVkMzJCbjVXbW5iQ2ZjV2plNmpBTjFMcGFFYWd0R0NV?=
 =?utf-8?B?b0E0NDBjS1ZHSk1LdTNwMDViR29mdXdwbzZNNGNxeWpMVkUxVG9iSkhwQlBG?=
 =?utf-8?B?dTZEcXdudGxDUTFURlBpcDByNjZhZHlHakdmYTNFM2VKRU9NWnBlRStaNWNF?=
 =?utf-8?B?Ujkzc2V4UytBOVhjODF6UmhqMjJWaDgvcWJCS093SCsxeTRndldHY0FrV2Qv?=
 =?utf-8?B?ZHpkSU5iU0R2RC93cDVyYXNUMFZOSFNhSU51VDNxclA0QzRjdU9HcytZS09k?=
 =?utf-8?B?cnEwaTFxbVk5ZEt6UjQ3anBCcXJVQm51RnZyZ3RzZmtQaWYwSEdZTUc5V0Z6?=
 =?utf-8?B?dHM5ZEtleXE1VElObExEMS9rSVVjUHBZc3UyU05xNldLQ2R1d2ZmY0pLN1Bk?=
 =?utf-8?B?SUxLRm8zeENGNjlkdUJGeXNZRkMwdllhZTBiTEN4blN4R0pMYjhHVEVZRUZh?=
 =?utf-8?B?Z1FHYzFIZzBSQmVEa2dyUnNKckFxbTNrbk5FcDhJSmduNzZGOUFOVDNJY2dh?=
 =?utf-8?B?SWFjRlpJL0U5QkphbWVPNDRvOG9RallNM0tEQ0tnb1ZzbUl5eEE4K0JNR2JR?=
 =?utf-8?B?Tm5uT2t0R0t2US9BR2lEWVg2SjRLUXZIUHgzUnMrZ0FPRDdDQTNaZW9QZS96?=
 =?utf-8?B?VjJRWFlTaXhZTFBLY09tQjdjajN0UzV1SXo3N1R5dTh1eldjbHRhZEo5Z21k?=
 =?utf-8?B?YWJoUDYxNU9UVDN1b3ErVGRDNElVcm8xQlhmN2tKZUZHNUtPRldSdVVPRTZN?=
 =?utf-8?B?VEZNUVJaZ0FTVnBTM2ZxbmtXWHEwUUdtV29hMUo2TzZoT1lVaU1oakR0azhH?=
 =?utf-8?B?RmZCcGh1QjRRTDNHM0lVWnRQSW9DZ3JpTlhXeEVqOFA5SStVOGYyV1lCWjJi?=
 =?utf-8?B?V0pFTlowa1MzV0pQTDJVSlhURWx2SmNMamFFNS9iZ3d2RkgwS0JvOWFLeXNa?=
 =?utf-8?B?WldLY3plbkFxeGE2YTZuTEhleFJaTzA2M1lrRDVHT0hNWTdGdWdWZVUvUDFY?=
 =?utf-8?B?YWZzdTRjampPNVVFSDg1a2lxaEh0UlhMSjlrSmNVOHkwR3NOM1FRMG9FZDBm?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 460c9422-f0e1-48d3-a961-08de174d6a4f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 00:43:59.8688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQeYGGUkdJTaVN7eXgj2e2l8SKyLScs3B2V7QU73JN765U55xBPtSYftQiaMeRHJgdjK0LQlL/aeMGkxDymOEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8C0509479
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

On Sat, Oct 25, 2025 at 02:04:02PM +0200, Thomas Hellström wrote:
> Define a struct xe_pagemap that embeds all pagemap-related
> data used by xekmd, and use the drm_pagemap cache- and
> shrinker to manage lifetime.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |   6 +
>  drivers/gpu/drm/xe/xe_device_types.h |   5 +
>  drivers/gpu/drm/xe/xe_svm.c          | 354 +++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_svm.h          |  38 ++-
>  drivers/gpu/drm/xe/xe_tile.c         |  34 ++-
>  drivers/gpu/drm/xe/xe_tile.h         |  21 ++
>  drivers/gpu/drm/xe/xe_vm_types.h     |   1 +
>  drivers/gpu/drm/xe/xe_vram_types.h   |  15 +-
>  8 files changed, 379 insertions(+), 95 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5f6a412b571c..ad004aab67ce 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -16,6 +16,7 @@
>  #include <drm/drm_gem_ttm_helper.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_managed.h>
> +#include <drm/drm_pagemap_util.h>
>  #include <drm/drm_print.h>
>  #include <uapi/drm/xe_drm.h>
>  
> @@ -62,6 +63,7 @@
>  #include "xe_shrinker.h"
>  #include "xe_survivability_mode.h"
>  #include "xe_sriov.h"
> +#include "xe_svm.h"
>  #include "xe_tile.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_sys_mgr.h"
> @@ -465,6 +467,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  
>  	init_rwsem(&xe->usm.lock);
>  
> +	err = xe_pagemap_shrinker_create(xe);
> +	if (err)
> +		goto err;
> +
>  	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
>  
>  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 6a62b520f5b5..dbcfe54b36d8 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -35,6 +35,7 @@
>  #endif
>  
>  struct dram_info;
> +struct drm_pagemap_shrinker;
>  struct intel_display;
>  struct intel_dg_nvm_dev;
>  struct xe_ggtt;
> @@ -418,6 +419,10 @@ struct xe_device {
>  		u32 next_asid;
>  		/** @usm.lock: protects UM state */
>  		struct rw_semaphore lock;
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> +		/** @usm.pagemap_shrinker: Shrinker for unused pagemaps */
> +		struct drm_pagemap_shrinker *dpagemap_shrinker;
> +#endif
>  	} usm;
>  
>  	/** @pinned: pinned BO state */
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index f6ee22da2e95..8aced064c83f 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -4,6 +4,9 @@
>   */
>  
>  #include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_pagemap.h>
> +#include <drm/drm_pagemap_util.h>
>  
>  #include "xe_bo.h"
>  #include "xe_exec_queue_types.h"
> @@ -19,6 +22,8 @@
>  #include "xe_vm_types.h"
>  #include "xe_vram_types.h"
>  
> +static int xe_svm_get_pagemaps(struct xe_vm *vm);
> +
>  static bool xe_svm_range_in_vram(struct xe_svm_range *range)
>  {
>  	/*
> @@ -395,22 +400,34 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>  
> -static struct xe_vram_region *page_to_vr(struct page *page)
> +static struct xe_vram_region *xe_pagemap_to_vr(struct xe_pagemap *xpagemap)
>  {
> -	return container_of(page_pgmap(page), struct xe_vram_region, pagemap);
> +	return xpagemap->vr;
>  }
>  
> -static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
> -				      struct page *page)
> +static struct xe_pagemap *xe_page_to_pagemap(struct page *page)
>  {
> -	u64 dpa;
> +	return container_of(page_pgmap(page), struct xe_pagemap, pagemap);
> +}
> +
> +static struct xe_vram_region *xe_page_to_vr(struct page *page)
> +{
> +	return xe_pagemap_to_vr(xe_page_to_pagemap(page));
> +}
> +
> +static u64 xe_page_to_dpa(struct page *page)
> +{
> +	struct xe_pagemap *xpagemap = xe_page_to_pagemap(page);
> +	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
> +	u64 hpa_base = xpagemap->hpa_base;
>  	u64 pfn = page_to_pfn(page);
>  	u64 offset;
> +	u64 dpa;
>  
>  	xe_assert(vr->xe, is_device_private_page(page));
> -	xe_assert(vr->xe, (pfn << PAGE_SHIFT) >= vr->hpa_base);
> +	xe_assert(vr->xe, (pfn << PAGE_SHIFT) >= hpa_base);
>  
> -	offset = (pfn << PAGE_SHIFT) - vr->hpa_base;
> +	offset = (pfn << PAGE_SHIFT) - hpa_base;
>  	dpa = vr->dpa_base + offset;
>  
>  	return dpa;
> @@ -514,11 +531,11 @@ static int xe_svm_copy(struct page **pages,
>  			continue;
>  
>  		if (!vr && spage) {
> -			vr = page_to_vr(spage);
> +			vr = xe_page_to_vr(spage);
>  			gt = xe_migrate_exec_queue(vr->migrate)->gt;
>  			xe = vr->xe;
>  		}
> -		XE_WARN_ON(spage && page_to_vr(spage) != vr);
> +		XE_WARN_ON(spage && xe_page_to_vr(spage) != vr);
>  
>  		/*
>  		 * CPU page and device page valid, capture physical address on
> @@ -526,7 +543,7 @@ static int xe_svm_copy(struct page **pages,
>  		 * device pages.
>  		 */
>  		if (pagemap_addr[i].addr && spage) {
> -			__vram_addr = xe_vram_region_page_to_dpa(vr, spage);
> +			__vram_addr = xe_page_to_dpa(spage);
>  			if (vram_addr == XE_VRAM_ADDR_INVALID) {
>  				vram_addr = __vram_addr;
>  				pos = i;
> @@ -672,9 +689,11 @@ static void xe_svm_devmem_release(struct drm_pagemap_devmem *devmem_allocation)
>  	xe_pm_runtime_put(xe);
>  }
>  
> -static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
> +static u64 block_offset_to_pfn(struct drm_pagemap *dpagemap, u64 offset)
>  {
> -	return PHYS_PFN(offset + vr->hpa_base);
> +	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
> +
> +	return PHYS_PFN(offset + xpagemap->hpa_base);
>  }
>  
>  static struct drm_buddy *vram_to_buddy(struct xe_vram_region *vram)
> @@ -694,7 +713,8 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
>  	list_for_each_entry(block, blocks, link) {
>  		struct xe_vram_region *vr = block->private;
>  		struct drm_buddy *buddy = vram_to_buddy(vr);
> -		u64 block_pfn = block_offset_to_pfn(vr, drm_buddy_block_offset(block));
> +		u64 block_pfn = block_offset_to_pfn(devmem_allocation->dpagemap,
> +						    drm_buddy_block_offset(block));
>  		int i;
>  
>  		for (i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
> @@ -711,6 +731,11 @@ static const struct drm_pagemap_devmem_ops dpagemap_devmem_ops = {
>  	.copy_to_ram = xe_svm_copy_to_ram,
>  };
>  
> +#else
> +static int xe_svm_get_pagemaps(struct xe_vm *vm)
> +{
> +	return 0;
> +}
>  #endif
>  
>  static const struct drm_gpusvm_ops gpusvm_ops = {
> @@ -725,6 +750,26 @@ static const unsigned long fault_chunk_sizes[] = {
>  	SZ_4K,
>  };
>  
> +static void xe_pagemap_put(struct xe_pagemap *xpagemap)
> +{
> +	drm_pagemap_put(&xpagemap->dpagemap);
> +}
> +
> +static void xe_svm_put_pagemaps(struct xe_vm *vm)
> +{
> +	struct xe_device *xe = vm->xe;
> +	struct xe_tile *tile;
> +	int id;
> +
> +	for_each_tile(tile, xe, id) {
> +		struct xe_pagemap *xpagemap = vm->svm.pagemaps[id];
> +
> +		if (xpagemap)
> +			xe_pagemap_put(xpagemap);
> +		vm->svm.pagemaps[id] = NULL;
> +	}
> +}
> +
>  /**
>   * xe_svm_init() - SVM initialize
>   * @vm: The VM.
> @@ -743,12 +788,21 @@ int xe_svm_init(struct xe_vm *vm)
>  		INIT_WORK(&vm->svm.garbage_collector.work,
>  			  xe_svm_garbage_collector_work_func);
>  
> +		err = xe_svm_get_pagemaps(vm);
> +		if (err)
> +			return err;
> +
>  		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
>  				      current->mm, 0, vm->size,
>  				      xe_modparam.svm_notifier_size * SZ_1M,
>  				      &gpusvm_ops, fault_chunk_sizes,
>  				      ARRAY_SIZE(fault_chunk_sizes));
>  		drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
> +
> +		if (err) {
> +			xe_svm_put_pagemaps(vm);
> +			return err;
> +		}
>  	} else {
>  		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)",
>  				      &vm->xe->drm, NULL, 0, 0, 0, NULL,
> @@ -768,6 +822,7 @@ void xe_svm_close(struct xe_vm *vm)
>  {
>  	xe_assert(vm->xe, xe_vm_is_closed(vm));
>  	flush_work(&vm->svm.garbage_collector.work);
> +	xe_svm_put_pagemaps(vm);
>  }
>  
>  /**
> @@ -861,7 +916,8 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  				      struct mm_struct *mm,
>  				      unsigned long timeslice_ms)
>  {
> -	struct xe_vram_region *vr = container_of(dpagemap->pagemap, typeof(*vr), pagemap);
> +	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
> +	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
>  	struct xe_device *xe = vr->xe;
>  	struct device *dev = xe->drm.dev;
>  	struct drm_buddy_block *block;
> @@ -1370,11 +1426,6 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>  
> -static struct drm_pagemap *tile_local_pagemap(struct xe_tile *tile)
> -{
> -	return tile->mem.vram->dpagemap;
> -}
> -
>  /**
>   * xe_vma_resolve_pagemap - Resolve the appropriate DRM pagemap for a VMA
>   * @vma: Pointer to the xe_vma structure containing memory attributes
> @@ -1400,7 +1451,7 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
>  		return NULL;
>  
>  	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE)
> -		return IS_DGFX(tile_to_xe(tile)) ? tile_local_pagemap(tile) : NULL;
> +		return IS_DGFX(tile_to_xe(tile)) ? xe_tile_local_pagemap(tile) : NULL;
>  
>  	/* TODO: Support multi-device with drm_pagemap_from_fd(fd) */
>  	return NULL;
> @@ -1423,7 +1474,7 @@ int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
>  	xe_assert(tile_to_xe(tile), range->base.pages.flags.migrate_devmem);
>  	range_debug(range, "ALLOCATE VRAM");
>  
> -	dpagemap = tile_local_pagemap(tile);
> +	dpagemap = xe_tile_local_pagemap(tile);
>  	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
>  				       xe_svm_range_end(range),
>  				       range->base.gpusvm->mm,
> @@ -1442,7 +1493,7 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
>  	dma_addr_t addr;
>  
>  	if (pgmap_dev == dev) {
> -		addr = xe_vram_region_page_to_dpa(page_to_vr(page), page);
> +		addr = xe_page_to_dpa(page);
>  		prot = XE_INTERCONNECT_VRAM;
>  	} else {
>  		addr = DMA_MAPPING_ERROR;
> @@ -1452,94 +1503,243 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
>  	return drm_pagemap_addr_encode(addr, prot, order, dir);
>  }
>  
> -static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
> -	.device_map = xe_drm_pagemap_device_map,
> -	.populate_mm = xe_drm_pagemap_populate_mm,
> -};
> +static void xe_pagemap_destroy_work(struct work_struct *work)
> +{
> +	struct xe_pagemap *xpagemap = container_of(work, typeof(*xpagemap), destroy_work);
> +	struct dev_pagemap *pagemap = &xpagemap->pagemap;
> +	struct drm_device *drm = xpagemap->dpagemap.drm;
> +	int idx;
>  
> -static void xe_devm_release(void *data)
> +	/*
> +	 * Only unmap / release if devm_ release hasn't run yet.
> +	 * Otherwise the devm_ callbacks have already released, or
> +	 * will do shortly.
> +	 */
> +	if (drm_dev_enter(drm, &idx)) {
> +		devm_memunmap_pages(drm->dev, pagemap);
> +		devm_release_mem_region(drm->dev, pagemap->range.start,
> +					pagemap->range.end - pagemap->range.start + 1);
> +		drm_dev_exit(idx);
> +	}
> +	kfree(xpagemap);
> +}
> +
> +static void xe_pagemap_destroy(struct drm_pagemap *dpagemap, bool from_atomic_or_reclaim)
>  {
> -	struct xe_vram_region *vr = data;
> +	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
> +	struct xe_device *xe = to_xe_device(dpagemap->drm);
>  
> -	drm_pagemap_put(vr->dpagemap);
> -	vr->dpagemap = NULL;
> +	if (from_atomic_or_reclaim)
> +		queue_work(xe->destroy_wq, &xpagemap->destroy_work);
> +	else
> +		xe_pagemap_destroy_work(&xpagemap->destroy_work);
>  }
>  
> +static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
> +	.device_map = xe_drm_pagemap_device_map,
> +	.populate_mm = xe_drm_pagemap_populate_mm,
> +	.destroy = xe_pagemap_destroy,
> +};
> +
>  /**
> - * xe_devm_add: Remap and provide memmap backing for device memory
> - * @tile: tile that the memory region belongs to
> - * @vr: vram memory region to remap
> + * xe_pagemap_create() - Create a struct xe_pagemap object
> + * @xe: The xe device.
> + * @vr: Back-pointer to the struct xe_vram_region.
>   *
> - * This remap device memory to host physical address space and create
> - * struct page to back device memory
> + * Allocate and initialize a struct xe_pagemap. On successful
> + * return, drm_pagemap_put() on the embedded struct drm_pagemap
> + * should be used to unreference.
>   *
> - * Return: 0 on success standard error code otherwise
> + * Return: Pointer to a struct xe_pagemap if successful. Error pointer
> + * on failure.
>   */
> -int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
> +static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram_region *vr)
>  {
> -	struct xe_device *xe = tile_to_xe(tile);
> -	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
> +	struct device *dev = xe->drm.dev;
> +	struct xe_pagemap *xpagemap;
> +	struct dev_pagemap *pagemap;
> +	struct drm_pagemap *dpagemap;
>  	struct resource *res;
>  	void *addr;
> -	int ret;
> +	int err;
> +
> +	xpagemap = kzalloc(sizeof(*xpagemap), GFP_KERNEL);
> +	if (!xpagemap)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pagemap = &xpagemap->pagemap;
> +	dpagemap = &xpagemap->dpagemap;
> +	INIT_WORK(&xpagemap->destroy_work, xe_pagemap_destroy_work);
> +	xpagemap->vr = vr;
> +
> +	err = drm_pagemap_init(dpagemap, pagemap, &xe->drm, &xe_drm_pagemap_ops);
> +	if (err)
> +		goto out_no_dpagemap;
>  
>  	res = devm_request_free_mem_region(dev, &iomem_resource,
>  					   vr->usable_size);
>  	if (IS_ERR(res)) {
> -		ret = PTR_ERR(res);
> -		return ret;
> +		err = PTR_ERR(res);
> +		goto out_err;
>  	}
>  
> -	vr->dpagemap = drm_pagemap_create(&xe->drm, &vr->pagemap,
> -					  &xe_drm_pagemap_ops);
> -	if (IS_ERR(vr->dpagemap)) {
> -		drm_err(&xe->drm, "Failed to create drm_pagemap tile %d memory: %pe\n",
> -			tile->id, vr->dpagemap);
> -		ret = PTR_ERR(vr->dpagemap);
> -		goto out_no_dpagemap;
> +	pagemap->type = MEMORY_DEVICE_PRIVATE;
> +	pagemap->range.start = res->start;
> +	pagemap->range.end = res->end;
> +	pagemap->nr_range = 1;
> +	pagemap->owner = xe_svm_devm_owner(xe);
> +	pagemap->ops = drm_pagemap_pagemap_ops_get();
> +	addr = devm_memremap_pages(dev, pagemap);
> +	if (IS_ERR(addr)) {
> +		err = PTR_ERR(addr);
> +		devm_release_mem_region(dev, res->start, res->end - res->start + 1);
> +		goto out_err;
>  	}
> -	ret = devm_add_action_or_reset(dev, xe_devm_release, vr);
> -	if (ret)
> -		goto out_no_dpagemap;
> +	xpagemap->hpa_base = res->start;
> +	return xpagemap;
>  
> -	vr->pagemap.type = MEMORY_DEVICE_PRIVATE;
> -	vr->pagemap.range.start = res->start;
> -	vr->pagemap.range.end = res->end;
> -	vr->pagemap.nr_range = 1;
> -	vr->pagemap.ops = drm_pagemap_pagemap_ops_get();
> -	vr->pagemap.owner = xe_svm_devm_owner(xe);
> -	addr = devm_memremap_pages(dev, &vr->pagemap);
> -	if (IS_ERR(addr)) {
> -		ret = PTR_ERR(addr);
> -		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %pe\n",
> -			tile->id, ERR_PTR(ret));
> -		goto out_failed_memremap;
> +out_err:
> +	drm_pagemap_put(dpagemap);
> +	return ERR_PTR(err);
> +
> +out_no_dpagemap:
> +	kfree(xpagemap);
> +	return ERR_PTR(err);
> +}
> +
> +/**
> + * xe_pagemap_find_or_create() - Find or create a struct xe_pagemap
> + * @xe: The xe device.
> + * @cache: The struct xe_pagemap_cache.
> + * @vr: The VRAM region.
> + *
> + * Check if there is an already used xe_pagemap for this tile, and in that case,
> + * return it.
> + * If not, check if there is a cached xe_pagemap for this tile, and in that case,
> + * cancel its destruction, re-initialize it and return it.
> + * Finally if there is no cached or already used pagemap, create one and
> + * register it in the tile's pagemap cache.
> + *
> + * Note that this function is typically called from within an IOCTL, and waits are
> + * therefore carried out interruptible if possible.
> + *
> + * Return: A pointer to a struct xe_pagemap if successful, Error pointer on failure.
> + */

I'd mention that not only is a xe_pagemap returned, but also a reference
that must eventually be dropped.

> +static struct xe_pagemap *
> +xe_pagemap_find_or_create(struct xe_device *xe, struct drm_pagemap_cache *cache,
> +			  struct xe_vram_region *vr)
> +{
> +	struct drm_pagemap *dpagemap;
> +	struct xe_pagemap *xpagemap;
> +	int err;
> +
> +	err = drm_pagemap_cache_lock_lookup(cache);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	dpagemap = drm_pagemap_get_from_cache(cache);
> +	if (IS_ERR(dpagemap)) {
> +		xpagemap = ERR_CAST(dpagemap);
> +	} else if (!dpagemap) {
> +		xpagemap = xe_pagemap_create(xe, vr);
> +		if (IS_ERR(xpagemap))
> +			goto out_unlock;
> +		drm_pagemap_cache_set_pagemap(cache, &xpagemap->dpagemap);
> +	} else {
> +		xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
> +	}
> +
> +out_unlock:
> +	drm_pagemap_cache_unlock_lookup(cache);
> +	return xpagemap;
> +}
> +
> +static int xe_svm_get_pagemaps(struct xe_vm *vm)
> +{
> +	struct xe_device *xe = vm->xe;
> +	struct xe_pagemap *xpagemap;
> +	struct xe_tile *tile;
> +	int id;
> +
> +	for_each_tile(tile, xe, id) {
> +		struct xe_vram_region *vr;
> +
> +		if (!((BIT(id) << 1) & xe->info.mem_region_mask))
> +			continue;
> +
> +		vr = xe_tile_to_vr(tile);
> +		xpagemap = xe_pagemap_find_or_create(xe, vr->dpagemap_cache, vr);
> +		if (IS_ERR(xpagemap))
> +			break;
> +		vm->svm.pagemaps[id] = xpagemap;
> +	}
> +
> +	if (IS_ERR(xpagemap)) {
> +		xe_svm_put_pagemaps(vm);
> +		return PTR_ERR(xpagemap);
>  	}
> -	vr->hpa_base = res->start;
>  
> -	drm_dbg(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
> -		tile->id, vr->io_start, vr->io_start + vr->usable_size, res);
>  	return 0;
> +}
>  
> -out_failed_memremap:
> -	drm_pagemap_put(vr->dpagemap);
> -out_no_dpagemap:
> -	devm_release_mem_region(dev, res->start, resource_size(res));
> -	return ret;
> +/**
> + * xe_pagemap_shrinker_create() - Create a drm_pagemap shrinker
> + * @xe: The xe device
> + *
> + * Create a drm_pagemap shrinker and register with the xe device.
> + *
> + * Return: %0 on success, negative error code on failure.
> + */
> +int xe_pagemap_shrinker_create(struct xe_device *xe)
> +{
> +	xe->usm.dpagemap_shrinker = drm_pagemap_shrinker_create_devm(&xe->drm);
> +	return PTR_ERR_OR_ZERO(xe->usm.dpagemap_shrinker);
>  }
> +
> +/**
> + * xe_pagemap_cache_create() - Create a drm_pagemap cache
> + * @tile: The tile to register the cache with
> + *
> + * Create a drm_pagemap cache and register with the tile.
> + *
> + * Return: %0 on success, negative error code on failure.
> + */
> +int xe_pagemap_cache_create(struct xe_tile *tile)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +
> +	if (IS_DGFX(xe)) {

I think we need to skip this step if vram->dpagemap_cache is already
set. IIRC, some patches were merged allowing tile->vram to be the same
object across multiple tiles. No current platforms use this mode, but
it’s forward-looking for potential upcoming platforms.

> +		struct drm_pagemap_cache *cache =
> +			drm_pagemap_cache_create_devm(xe->usm.dpagemap_shrinker);
> +
> +		if (IS_ERR(cache))
> +			return PTR_ERR(cache);
> +
> +		tile->mem.vram->dpagemap_cache = cache;
> +	}
> +
> +	return 0;
> +}
> +
>  #else
> -int xe_svm_alloc_vram(struct xe_tile *tile,
> -		      struct xe_svm_range *range,
> -		      const struct drm_gpusvm_ctx *ctx)
> +
> +int xe_pagemap_shrinker_create(struct xe_device *xe)
>  {
> -	return -EOPNOTSUPP;
> +	return 0;
>  }
>  
> -int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
> +int xe_pagemap_cache_create(struct xe_tile *tile)
>  {
>  	return 0;
>  }
>  
> +int xe_svm_alloc_vram(struct xe_tile *tile,
> +		      struct xe_svm_range *range,
> +		      const struct drm_gpusvm_ctx *ctx)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
>  struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
>  {
>  	return NULL;
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index fa757dd07954..8a49ff17ef0c 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -27,8 +27,13 @@ static inline void *xe_svm_devm_owner(struct xe_device *xe)
>  
>  #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
>  
> +struct drm_device;
> +struct drm_file;
> +
>  struct xe_bo;
>  struct xe_gt;
> +struct xe_device;

Alphabetical order.

> +struct xe_vram_region;
>  struct xe_tile;
>  struct xe_vm;
>  struct xe_vma;
> @@ -55,6 +60,22 @@ struct xe_svm_range {
>  	u8 tile_invalidated;
>  };
>  
> +/**
> + * struct xe_pagemap - Manages xe device_private memory for SVM.
> + * @pagemap: The struct dev_pagemap providing the struct pages.
> + * @dpagemap: The drm_pagemap managing allocation and migration.
> + * @destroy_work: Handles asnynchronous destruction and caching.
> + * @hpa_base: The host physical address base for the managemd memory.
> + * @vr: Backpointer to the xe_vram region.
> + */
> +struct xe_pagemap {
> +	struct dev_pagemap pagemap;
> +	struct drm_pagemap dpagemap;
> +	struct work_struct destroy_work;
> +	resource_size_t hpa_base;
> +	struct xe_vram_region *vr;
> +};
> +
>  /**
>   * xe_svm_range_pages_valid() - SVM range pages valid
>   * @range: SVM range
> @@ -171,6 +192,10 @@ static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
>  
>  void xe_svm_flush(struct xe_vm *vm);
>  
> +int xe_pagemap_shrinker_create(struct xe_device *xe);
> +
> +int xe_pagemap_cache_create(struct xe_tile *tile);
> +
>  #else
>  #include <linux/interval_tree.h>
>  #include "xe_vm.h"
> @@ -179,7 +204,7 @@ struct drm_pagemap_addr;
>  struct drm_gpusvm_ctx;
>  struct drm_gpusvm_range;
>  struct xe_bo;
> -struct xe_gt;
> +struct xe_device;
>  struct xe_vm;
>  struct xe_vma;
>  struct xe_tile;
> @@ -346,6 +371,17 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
>  static inline void xe_svm_flush(struct xe_vm *vm)
>  {
>  }
> +
> +static inline int xe_pagemap_shrinker_create(struct xe_device *xe)
> +{
> +	return 0;
> +}
> +
> +static inline int xe_pagemap_cache_create(struct xe_tile *tile)
> +{
> +	return 0;
> +}
> +
>  #define xe_svm_range_has_dma_mapping(...) false
>  #endif /* CONFIG_DRM_XE_GPUSVM */
>  
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 4f4f9a5c43af..051b191377df 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -6,6 +6,7 @@
>  #include <linux/fault-inject.h>
>  
>  #include <drm/drm_managed.h>
> +#include <drm/drm_pagemap_util.h>
>  
>  #include "xe_bo.h"
>  #include "xe_device.h"
> @@ -180,17 +181,19 @@ ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
>  int xe_tile_init_noalloc(struct xe_tile *tile)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
> +	int err;
>  
>  	xe_wa_apply_tile_workarounds(tile);
>  
> -	if (xe->info.has_usm && IS_DGFX(xe))
> -		xe_devm_add(tile, tile->mem.vram);
> +	err = xe_pagemap_cache_create(tile);
> +	if (err)
> +		return err;
>  
>  	if (IS_DGFX(xe) && !ttm_resource_manager_used(&tile->mem.vram->ttm.manager)) {

I think you potentially move xe_pagemap_cache_create under this logic
too to avoid double init when tiles point to the vram object.


> -		int err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
> -
> +		err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
>  		if (err)
>  			return err;
> +
>  		xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
>  	}
>  
> @@ -215,3 +218,26 @@ void xe_tile_migrate_wait(struct xe_tile *tile)
>  {
>  	xe_migrate_wait(tile->migrate);
>  }
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> +/**
> + * xe_tile_local_pagemap() - Return a pointer to the tile's local drm_pagemap if any
> + * @tile: The tile.
> + *
> + * Return: A pointer to the tile's local drm_pagemap, or NULL if local pagemap
> + * support has been compiled out.
> + */

Mention no reference is taken?

> +struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
> +{
> +	struct drm_pagemap *dpagemap =
> +		drm_pagemap_get_from_cache_if_active(xe_tile_to_vr(tile)->dpagemap_cache);
> +
> +	if (dpagemap) {
> +		xe_assert(tile_to_xe(tile), kref_read(&dpagemap->ref) >= 2);
> +		drm_pagemap_put(dpagemap);
> +	}
> +
> +	return dpagemap;
> +}
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index dceb6297aa01..734132eddda5 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -8,6 +8,7 @@
>  
>  #include "xe_device_types.h"
>  
> +struct xe_pagemap;
>  struct xe_tile;
>  
>  int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
> @@ -23,4 +24,24 @@ static inline bool xe_tile_is_root(struct xe_tile *tile)
>  	return tile->id == 0;
>  }
>  
> +/**
> + * xe_tile_to_vr() - Return the struct xe_vram_region pointer from a
> + * struct xe_tile pointer
> + * @tile: Pointer to the struct xe_tile.
> + *
> + * Return: Pointer to the struct xe_vram_region embedded in *@tile.
> + */
> +static inline struct xe_vram_region *xe_tile_to_vr(struct xe_tile *tile)
> +{
> +	return tile->mem.vram;
> +}
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> +struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile);
> +#else
> +static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
> +{
> +	return NULL;
> +}
> +#endif
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index d6e2a0fdd4b3..9f0d8bf1af4f 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -191,6 +191,7 @@ struct xe_vm {
>  			 */
>  			struct work_struct work;
>  		} garbage_collector;
> +		struct xe_pagemap *pagemaps[XE_MAX_TILES_PER_DEVICE];

I know this file isn't great at kernel doc, but let's not make it worse
but omitting it.

Matt

>  	} svm;
>  
>  	struct xe_device *xe;
> diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
> index c0d2c5ee8c10..646e3c12ae9f 100644
> --- a/drivers/gpu/drm/xe/xe_vram_types.h
> +++ b/drivers/gpu/drm/xe/xe_vram_types.h
> @@ -66,19 +66,8 @@ struct xe_vram_region {
>  #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>  	/** @migrate: Back pointer to migrate */
>  	struct xe_migrate *migrate;
> -	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> -	struct dev_pagemap pagemap;
> -	/**
> -	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
> -	 * pages of this tile.
> -	 */
> -	struct drm_pagemap *dpagemap;
> -	/**
> -	 * @hpa_base: base host physical address
> -	 *
> -	 * This is generated when remap device memory as ZONE_DEVICE
> -	 */
> -	resource_size_t hpa_base;
> +	/** @dpagemap_cache: drm_pagemap cache. */
> +	struct drm_pagemap_cache *dpagemap_cache;
>  #endif
>  };
>  
> -- 
> 2.51.0
> 
