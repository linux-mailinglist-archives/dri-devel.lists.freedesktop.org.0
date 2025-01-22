Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD676A193ED
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 15:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E57710E30E;
	Wed, 22 Jan 2025 14:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F3LFaIPF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C8510E30E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 14:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737556269; x=1769092269;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ReP82mtpRK7LEMJ45/MthBbo1DTUxjnWXfRGrt4MeJA=;
 b=F3LFaIPFZY+b6FIIzw68FLdptOIZS4fBG9SLvAfMUaPK4eoLFu1q3tpQ
 CpuLerQdVR52rqsvd0YSZC4AkeGAWe/hzxnYeXWNvnQN/S1lyYcDn7rFt
 9DytVHOkXZ7+e5uVq8rYvCfHkcPMz4QySoDjv1XFwzACA7D1lJ6kKZdvj
 2pqjW99atUimez//53gDirXL6+roGkq/G7o2r4QX1bH8UimaeZ0kBTnYo
 4TGzkVTTfL8e3tCBc5QszeY3u1n+fWmGycIGlTVYN57CtN0AbSs7uy7no
 SqnWWlbTsbM4t+Z4Yu4ptTSkFYHJ+uXvbPciN/h6z7gLeaaOyv9yU76Vj Q==;
X-CSE-ConnectionGUID: CEHMUv3mS9G/NYLMxh0ItA==
X-CSE-MsgGUID: oCzRS71WR8SuQKydxOgFEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38264857"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="38264857"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 06:30:50 -0800
X-CSE-ConnectionGUID: HcUvIJMzR3m+hV6Q6ffIHg==
X-CSE-MsgGUID: /VLxX9tGTK6QLqAzkQgjEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112246305"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 06:30:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 06:30:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 06:30:50 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 06:30:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vi1zX1Dv95XabOOatCnhK0WAYOMmzf8tFvkXyBY0xFdmn0OHiYSewkg9uufmNt2M5eZtsxLqvigiHmEOXrkZI6Ln2OqrijNKfREGOSiXnnUG6m0vV9rbdIbRhT714NwOLUeBtd6TP5rJFQxdRpUkrWddOS73IfNYPFeFhHCLJVz0oTI6Ox8PkTsHB/Z+O4C0gqic1gIwwy6hZzXY5dS6ukwfxCyTKW4VxE2Yz2udjga1HQSDlaEIP37iRsSXijBBwBWsjzuYZKKCYspW4KJN5DJOClKhuKG43sNv9nBEVUqnWPc9IoNHFYdBsSpH867ZruexdhNEratBSkj9Pl52cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSWzOco3ZgS8Qweyu6io7Y1ogydZnHFFVjDOKeVESTE=;
 b=N9LOA1FGoTsVsPrWuyF4K1wwnl0JNNfPrfvMHDIDZec19OCx+EpXgWXWKLXSJkB7MyXsKJY0iIZfCOba1u3C4u3x5/7ZcntAeWqdF/ow4goVNUI8UIDR9FU9jEqjwTEa3hnYTDFgT0qMZO+QdwvIyjEGV6lDqOMlRakekOYwnDs4nWYQazRYKlb6hPP5nYFMSr/XKNmuOCQ83ND/Xkmk4DgRK5sd0noWq3h9A3LS4rDIBeT15Xn27BxU5Ced5y6rzw/nxII7gto27U5rCGn8kCnduzbmP2/OK3l/Qe4ml7znHxd2v4oVz2/xkKQbnfZ9dYiUvVEfEX3praMZ2K8hlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 14:30:47 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 14:30:47 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87jzanndzc.fsf@intel.com>
References: <20250121210935.84357-1-gustavo.sousa@intel.com>
 <Z5DSeQjrUKym5Dzb@phenom.ffwll.local>
 <173755097154.5500.15568058785162208000@intel.com> <87jzanndzc.fsf@intel.com>
Subject: Re: [PATCH] drm/print: Include drm_device.h
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <dri-devel@lists.freedesktop.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>
Date: Wed, 22 Jan 2025 11:30:41 -0300
Message-ID: <173755624141.5500.13245593483082552961@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:303:16d::31) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MN6PR11MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: 48df2eca-3154-4764-4c42-08dd3af15c85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TG9MY21lR3BQYUY3T28xVFpBbzErNHZKb3Q1d3pETHVaU1cyaU1vWjBoODc2?=
 =?utf-8?B?MU0rK21oRnpvMU9rRDdaTUtBOWw5M2J4anF6NFAwQS82dmtld0l5WWhlOER1?=
 =?utf-8?B?aTZQNjhWK3N0WEdZNFFtRjhaSkRtRjlYSngycGt4MDdqRWplYVY5YytYQVV4?=
 =?utf-8?B?blpoV091TUZ4QzdjOVlwK2JPb3dESCtoZC9Ea2tUNW13RTBSU3ZjeXJJVHc0?=
 =?utf-8?B?T2Fmb1F3NWJiV05uRTU1cm12UW1ndUN5bFBYQjErTW9XVk5MUXJnL3h4eGU0?=
 =?utf-8?B?RUJpQTh5a1FJRnk3REduYkFnMk5rdU5OVzFJT0JDck1IclNLS204ZFNkOFV5?=
 =?utf-8?B?VE4xLy9NbUxpc094bDc2Y3htYjRiSE4zcVZEVXdHbS83VnlzMEtjVmNMSTE2?=
 =?utf-8?B?U25FaEFmbU90bDcyWWRkVkZrbWhVYjE5UFMxN3NkMHdqTFROb2lQdzNuT3RU?=
 =?utf-8?B?RFE1QTdEdkZ5U3VONlorSGlxL0JsMTZOQ2tCY1pGeEFaQThKcTBKUFozL1Fr?=
 =?utf-8?B?Rm1NSDIrZlpUMHlRNVpkQ1JMRWtGV3ZlcWc2ZHViQjJKUFhMWnREUHZBSkRz?=
 =?utf-8?B?N2dEcXo2eUtkV3Q1ZTFQdjhsQWMwd2J5Q1F2SHhtOGJLYmRrbFRlQlBCK3Vt?=
 =?utf-8?B?Q2VZRjB5N0JSS1Nuem0xZFd1NzRTZG5oTjZaUzhkVkt2N05FaXRaNUsxemxL?=
 =?utf-8?B?MW1xQ2hRdCtGcE8yTjJaNzI2ZEJxeDZPa0hoMGxWOGpjc3h6cGVmOHBqZnFL?=
 =?utf-8?B?ZmFwcmFlWTRQUkVya2VuUUVOR2ZkWFBjS0NKdis5V0ZPRHN3MGlxYmdSckg1?=
 =?utf-8?B?MkN0T01DOStVeWtiRHpYOFI0VVFwbFEvVEkxUkg3M1IzbndGTVlQUUhqMmJH?=
 =?utf-8?B?aE4wVCtab3VqOWdmVFV4UTJqNVZZKzBVMWhhYXNBZWh3bGgwRnovRG9qUTNx?=
 =?utf-8?B?dXhyWDJkWUFhK0JjWXdYRzd5WWdtLzZNRElGcFZTTGN4cmpGU3VtckQ5azJ0?=
 =?utf-8?B?eDNnVGFZS3o4Z1dWZkNReEtpSU1JL2wwVGswbjBFUHpncG9BeHlpNEtCc0ly?=
 =?utf-8?B?L3hFUVVVa1hZaUdOQWR2UkcxMFlOWVZFZHM5Wit5QVhHeEFSQjZJQWxvdklW?=
 =?utf-8?B?M3JzR0xHRElyM3JmZ1oybnZibDVSbFhtMGdMWHRUTVg2ZWkyZEJUNDhlNks0?=
 =?utf-8?B?UmhPeEY4RjlFb0R3ZFRzMm1BY0Fzc05zc01nejVXNzNlbkw5V2JMMVZEK1Bz?=
 =?utf-8?B?SDNmakE4ZTVoWnN0OG03MWF3RW5pakVKMStlMWtLOW1GTUxXaC9FZTBlbVdD?=
 =?utf-8?B?L0EvQVZNSERxRnM3c2xhYVk1eVA1OHdRNzR4akZQWkYxQ2hDRCt5dGc4LzhY?=
 =?utf-8?B?cXFTTEhsR0dsUWpGait5a05rQ0ZCV0tiR2xGNHYvcDZOSlVBakphU1NFK2NX?=
 =?utf-8?B?Mmk4Y3BaWjQzQS96WGdhZGtTQU1EOHA1NW04dm54NUo0N1ZudkxFZVEyQ3R0?=
 =?utf-8?B?NS96NnAwRGM2TkxEUFRTaW9pTDVadUZrbXk4RTJ0aXRiam9vY3hBcnBNSzhF?=
 =?utf-8?B?eGJlVmFBYWV5dVVGWU5xc21DdS8ya1BEMzdscGVSZER5a0hZQUw3YlBnZGZW?=
 =?utf-8?B?VzhmWjMraGljdUorRWNiSmRocFlmZVhoRlhZMDV4THNVaG1vTEYxejQ1cjJj?=
 =?utf-8?B?OXZvbE1WUXdWMjhNdHVZRmtRVWxNUUs1TDE5eUVGS3FwOEN5czhFeU54VDI3?=
 =?utf-8?Q?OhpeYwEFxL7qHXdSTpNpm9fLkcAAQuT606qZEy4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1VHS2tIMEw2bTVJYy9OS2x0YkJSN0VxS3dZeThjZTUvWk5oUzYyOFV0RTM4?=
 =?utf-8?B?YUNkL21wQUFDa2RyUDJEN0VBUkJWbFI0dUYwTkt1VkpITDBsVlNkdE9SZytm?=
 =?utf-8?B?T2hadE5Lbm91b2NRNnF5RzdEelJoY1FXRHFDc3ZLVUtkSk02MHZXQk5paTJ6?=
 =?utf-8?B?MW1HcVhNODV2cU1RMnZYNUF3NTZRVDNkOUh4eGdKQmcrNnNXam9ucXBRMHFs?=
 =?utf-8?B?eGsyUEphblhEUkE2b2RLZlRNbjJ3R1BNSFlNejRkTTFyYlpDVEppTUtaMW5F?=
 =?utf-8?B?Qi9KMjJiUG9vb0phenhJWXNacFhhbDhtZE0rQzhwTmhoa2JWWmk0VGtvSlhU?=
 =?utf-8?B?WHdmc1QvdlRoS3BLT29pbjVrR2VnVFNESTZ2UlBvTzhpZnhqbFVEUytXd2Nw?=
 =?utf-8?B?aGZveUpaV0VZT25wSGd5YzArNkdaKzVTeS83bEEwNVVMWlc4M281dmNKSk0r?=
 =?utf-8?B?QnFWdlp1L2UxckcvdWR0UTBqazM3QmZBOFUrVFJwWExGekQ5NGYxWjFSQmc1?=
 =?utf-8?B?SXFIekxhYXZkVnE3K1V4SEg0bjVYbWRsQ2hvTDFYU2ZTRVZhV2wvTndxWElr?=
 =?utf-8?B?Wi9jTStseFl1blJ0clJ1M3hTektrYitkTmx1UlJIb29OaU1xTjNjZU9EcGlv?=
 =?utf-8?B?WDd6eXpuZmMzdi9iV1E2ZlRnR0V2OUV2Nk8vUE5JSkh3UWFwdlVyaE9GbXdy?=
 =?utf-8?B?UVlKK1ZBdm5rUGpJMWZUUkRlb3R0N29YYnpuaTdpQVo4ZmdCMlFHZW5uWEdP?=
 =?utf-8?B?MXg2ZG5DNGZzb2JEWDFSbnBXQ0daaE1ncHJ2RXFNd0Q3dFdQTXJVbHVkRkFJ?=
 =?utf-8?B?aHIycWVXdkwxNmZUWUM1L0ZCcWxjQlo2U09TeXJnR09BVHdvY2RrRDFBUlRZ?=
 =?utf-8?B?V1BGdjVPOTlaRFNDajkxNmtjNHErcUZRb1VjR3ZXN3Y4WEdVSWo0WUxZU1FH?=
 =?utf-8?B?UjFyWTFMd1QvVVZQZVE5WlNvN081akNpUytVZFpLa3ZlaTVKS2ljbVZ2S2Jl?=
 =?utf-8?B?c0pLOWtjOTh2QmJrbnVDOUtUUlFUaFdvSlpmeHlBZFZTdmJvdWNLZVVrMjY5?=
 =?utf-8?B?bXNrQjJSckQ1NXFXRTlSbUhQTDZsZ25DOXBVWXhrZFNKYUczUHIydjJ6WlYr?=
 =?utf-8?B?MGljRFpYZW05alBWalpNVTd3QmIvNGpsTjgwSjZFdTM4azluc2g3UzJXRit5?=
 =?utf-8?B?UkVoNWRyQS9oODVZWG94VlBMckNBWE1Mc0RhQS9rUktyRmZYVHc0MVhlUEtu?=
 =?utf-8?B?MGdEOE1hdEIvNEpiRHJMNXoybC9aMEo3a2YydnlVZENYSFVmN0k1RHd2ckRa?=
 =?utf-8?B?eThSQS9yQjhPRzVOT2w3eThsT3BTMGNRRVpkTXRvbzg4bXFxYjNzZm9Fak4y?=
 =?utf-8?B?NC9KNnNCVUxYWmUvaFlmeE5rbHR1enl3UmpFWW9oR0Z3VHV5bm82VDRsR2cy?=
 =?utf-8?B?aWVzelZvVkpvOFpLcm1mQ05hTVpqSGZWWHlUS2RCckNhbVptZVpFNkZHRkdw?=
 =?utf-8?B?c2Uxelh6NXBuUFFpZmphVnJjRWNCZ2QxNlMvditrV1Y0MzZiZHYrUjNPTm1z?=
 =?utf-8?B?QWk4SDBkVnhvS1RScUdrbjRmZUZGTUFZb0JIeVI0WjVuVDdNSHI4N21HR1hK?=
 =?utf-8?B?MkM1andsVWk4emhvNDJDVWVleGhOaXFQdmdEMFY4aWhNaVVvaUJDZWM2ZnVk?=
 =?utf-8?B?Y095QWVEekFXODhkdFBBL2ZWMy9iZVpqMmtkbU9acytNcXhYclRjN1djaVRN?=
 =?utf-8?B?Uis4ZlhuN1VXQ040U3YxbXNMaGJYRDNhcDJTdU5tV3c1TU11dE9wZ2gwRlQw?=
 =?utf-8?B?VFB5T1JFanhDd2dRZTlCUEcrTDNITVAxUlVsZXg2cEdSQ2k2MFVlek1wcE5i?=
 =?utf-8?B?cXBsNlJhRktEYmFaNGxrQk5rUDcrYWQ5NGZOSitreXdad0FmZ1RxcEJiNURp?=
 =?utf-8?B?NUFEWC90VW9mVmRucW9ldjFoVmRDY3FEUEdpVkx0V3M3a0NlM2xLUFJhakNa?=
 =?utf-8?B?eXZhdzU2VDgyQjFpbXpWNFNGSVRCWHIySUp4RmZ0NWNFYUdhcVB6UnMyaGJ0?=
 =?utf-8?B?dnprc3pCSHpxQWVEaFg3c0E4UmZ5U3Y3dzY1TXIybkpOQ25oMUt5NTlGUVRZ?=
 =?utf-8?B?dGozMDg1cGJnWHdKd2cydlFYd1FydmEycmQrOEU3UDJudXVTZFBhbkloR2Ni?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48df2eca-3154-4764-4c42-08dd3af15c85
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 14:30:47.2180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VXmZfuCgQeAQ44VMCHiScuFmOiCUqLZrx6dPphZl9/NhMvqsg3CfdOYYtiZmHfD/SzOesqH2e4phLvkRgAYYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8146
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

Quoting Jani Nikula (2025-01-22 11:02:31-03:00)
>On Wed, 22 Jan 2025, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>> Quoting Simona Vetter (2025-01-22 08:11:53-03:00)
>>>On Tue, Jan 21, 2025 at 06:09:25PM -0300, Gustavo Sousa wrote:
>>>> The header drm_print.h uses members of struct drm_device pointers, as
>>>> such, it should include drm_device.h to let the compiler know the full
>>>> type definition.
>>>>=20
>>>> Without such include, users of drm_print.h that don't explicitly need
>>>> drm_device.h would bump into build errors and be forced to include the
>>>> latter.
>>>>=20
>>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>> ---
>>>>  include/drm/drm_print.h | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>=20
>>>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>>>> index f77fe1531cf8..9732f514566d 100644
>>>> --- a/include/drm/drm_print.h
>>>> +++ b/include/drm/drm_print.h
>>>> @@ -32,6 +32,7 @@
>>>>  #include <linux/dynamic_debug.h>
>>>> =20
>>>>  #include <drm/drm.h>
>>>> +#include <drm/drm_device.h>
>>>
>>>We much prefer just a struct device forward decl to avoid monster header=
s.
>>>Is that not doable here?
>>
>> I don't think so. This header explicitly uses members of struct
>> drm_device, so the compiler needs to know the full type definition. As
>> an example see the definition of drm_WARN(), it uses (drm)->dev.
>
>I grudgingly agree. I don't think there are actual cases where this
>happens, but I can imagine you could create one.

It happened to me, and that motivated me to send this patch.

I had a local patch where I just needed the drm_print.h header, but I
ended up having to include drm_device.h in my .c file.

>
>>> Worst case I'd convert the drm_info_printer() static inline to a
>>> macro, not sure about the exact rules here if you never deref a
>>> pointer.
>
>The forward declaration is enough for passing pointers around without
>dereferencing. It's the dereferencing in the macros that could fail the
>build if the .c using them doesn't include drm_device.h.
>
>To balance things out, I think we could probably drop drm/drm.h if we
>inlined one use of DRM_NAME to just "drm".
>
>
>BR,
>Jani.
>
>
>>>-Sima
>>>
>>>> =20
>>>>  struct debugfs_regset32;
>>>>  struct drm_device;
>>>> --=20
>>>> 2.48.1
>>>>=20
>>>
>>>--=20
>>>Simona Vetter
>>>Software Engineer, Intel Corporation
>>>http://blog.ffwll.ch
>
>--=20
>Jani Nikula, Intel
