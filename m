Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D770BA3DCEE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 15:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A9610E2BD;
	Thu, 20 Feb 2025 14:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NiksL6P5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D99710E2BD;
 Thu, 20 Feb 2025 14:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740062109; x=1771598109;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9cCMugux1g9XznjdyeeYVdqD6rY0hYEpcBqv7/4rnS4=;
 b=NiksL6P5rJEola1s9c7bvp6Tb5fegXUdW7nLnPRd4F31P4ayb2KQ4jB8
 VhiUFFVjA1oP8vbv1FUGdGrcZvjaYVV/T0Xanhw3/K1bNysJorIG0ZIup
 sJRq3NEIlXCoWm/LYPzOJACEUP1aJAqG3Y8A5wdsbiv5FT9EuDVYQ1r1f
 AjH84oasD6fRB+kCECWE1Ia8aHviR+4ueve7Od4Uf5SWRa+sDt7iQHy+Y
 rrwgtIBOhDJumKiChSgXxvSmx0RZtrt2rXeVjcbMmR1RXNNBMf4zXrG52
 y+k0XLbPjQGqeLF/cgPXfVy8sftBaxiBWzgRQV005oiIJha43AIfx+L5L Q==;
X-CSE-ConnectionGUID: gk7inw3fT1aWsdjebenb6Q==
X-CSE-MsgGUID: l5kPIun9RXK3ixAqWb3fLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="43675207"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="43675207"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 06:35:07 -0800
X-CSE-ConnectionGUID: 8O38WmJdTeWOH/0WMnT9Rg==
X-CSE-MsgGUID: MwMkZAyhS+OS3giLPNZJDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145949952"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 06:35:07 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 06:35:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 06:35:06 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 06:34:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOq7EfqPCqyjPcXBjL6q0OUyEZbsvKwZnqOGZxBss8rDjtfVunlQ7CgODmqWKvR2HiTRDVtN2++EA5m/rgjEsUrfZ5alnHwGHZhhk99JHVrcgFHQGP0xEXxOh7QssrdlRTzvoKLaTcqElxCE8ducus0Ge6JrB0hoAlE6Cni7vpE+5HchmOpDDBbkiqLqYsH9kJHPuVbeplaEwGHSkYlcmSEHzqF/Z/EX+paqWFGSVhO3oTL8iKNhbw/VHD1/i03MhGXizy7oyx1827xe1hcHmH1v+rUgjuus8URGzbX119pp3QPDBH9eZkatu0bO0j0g1zN53Y6K/7DKckeiuGcX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PS6jFdOEk/ygCXA3Y0wh74915TkoSG0ycy9isWwTns=;
 b=x2O6i8F3MGmbaacSfZTRrwMovlSuM3mIVQ4xZl2XjkvzfMojXLnyc6w3JYmi584734yVO1XKVhBxifmL4C1NEWIEKAIm/4fwrGJ58B6G+R4IMks/hz/0wrIE64uj4FP9x5fp3DT9c0XcZPAmgRl6dALs7LJVzkwPuG2b9xwY7bxXSoFiiOEggYTCZMDyImB7ycurzGSvHoQ9ue7R4OMVgRrurlkiaWH0davbqGJlN1LMzTOj0C8SDjMRUfIDam7/hQ8OJ7t2g86azMayaiXFfVd9/vlGrD9cbb8JdA0y3dQRylf3xs0p45MK5XahgBl62NX4BK+qR7ib3+fwAvcUgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.14; Thu, 20 Feb 2025 14:34:21 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%2]) with mapi id 15.20.8445.017; Thu, 20 Feb 2025
 14:34:21 +0000
Message-ID: <0e8510f6-1fc2-4bac-8c05-13b97094d4b4@intel.com>
Date: Thu, 20 Feb 2025 16:33:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/32] drm/xe/bo: Introduce xe_bo_put_async
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>,
 <airlied@gmail.com>, <thomas.hellstrom@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-6-matthew.brost@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20250213021112.1228481-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0051.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::20) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|CO1PR11MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: 55d06925-c519-4aa6-af45-08dd51bbaa31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVd6VGJSQ1pKRmpPUkF2REJWYlhXeGl4YWNWRHMwdjYvMzUrc1FmM1M1ZzFx?=
 =?utf-8?B?NEJRa0lveWdTMXMvVEtZR25Da1RWMzRQY3hYS285R0pxajBFVWQ5bnFUNmM5?=
 =?utf-8?B?YVhGNlM1MnVjQThnNnBjMXJGbFlvWTBDNC85V3hoZjRqWFNDaUJpNFcvMmdO?=
 =?utf-8?B?OGQzTG5vNTZONzd5djh6ZXQ4MkNMYkZXcnN0WXBTeGU3d1dWVUdVMENMeXUx?=
 =?utf-8?B?VEYwSllWU3VRZjd1bHJwS2VkWC9YbXczU2dnSEFWYmxEeXdVb2ZPOVBtK3FK?=
 =?utf-8?B?cFFHeG1nRGxib2dUZnNUOEx3RG1JcG5Ed3RsZC8ybmRpOTdRc1BRMEZmWU1v?=
 =?utf-8?B?VEsrL1FML0FzeUpLU3VXTVhRTld2VW1DZmxPcUhyVGFWNW9zL3BXZWZtZlZ4?=
 =?utf-8?B?ZDZlN0FJUitDdmdHYktFRkZFV1VPVDRxK1lOOTYxQ1o5cTlyYXcxZ2lLb1Zs?=
 =?utf-8?B?M1NVRUVub1cyRCtaeGYvRFFMbWVJQ1lMREhIOEFyT3JIdHBSL3B6Wm9OTmNC?=
 =?utf-8?B?Zjh4YUZFcnBrbEdZcXVsdnp4U2xuZGRiSWEwQzN0V0dzRXJzdzZnbG0xM1Vn?=
 =?utf-8?B?cVA0cWdDKzluRE5mRFVGUW5TZUNWQmNwNjBtSmsyblNSQzNSS2Q4ZUdYQ1Zi?=
 =?utf-8?B?NnJBTm5FQ3prSGgzakpqdjUyckE5cnRGT05lKy9DbjRCSHcxd2RLNWtSbDFm?=
 =?utf-8?B?clVLbWFMVFBLT1hpSlE2TVk3WGU0VEhuL2dxT0MvTmVKMW9ZUDhxRWxWWlpm?=
 =?utf-8?B?bG5HUzZSYlRyRW40R3NBMUI0U3VMOU4ramIvWnlMeWNhclQvZ1ZjOGtEaVFW?=
 =?utf-8?B?MjJ5cEE1SjlDdWlhMjVYTmtKZHhub2FjRCttU3dpRTkvRG5HU1JMSjJyeWQz?=
 =?utf-8?B?bEpNN2tBdGY5U0tHNHNzaFJ4TTlSWDVxWjUwd0pzS2NjU1paNEcrRFdkMnZx?=
 =?utf-8?B?eG5kMHM5MENGSVVpaU5jUGVvRWYxMks0bzE1MmhxbHFTbGIyUytCM2ViYkRQ?=
 =?utf-8?B?NW8reVJyRHpKYzlYRjVVVFVuTXdneVlLYW5wQkVUQk9xV1NhbmVPdmVHTXpK?=
 =?utf-8?B?bjhzOFc4L0ZpRVZHV1VxTWRsbXFuL25ycVZGNC9rZEUwTWpKMTZ4NUhoV1p3?=
 =?utf-8?B?UTR2YW5QVHRwbFd5cG5UOW50bHJJeFViSVZseEpQK2ZyTHpaMnBhaDFaREtQ?=
 =?utf-8?B?Y0NQcklkaVl2eXZRbDcwcC85eUwxUFJXNU1RVnhnUS9zQUhwYzNyd3BhVW9G?=
 =?utf-8?B?S1c4RzBha2pWVnd6WUk4T1RGZkpmOFY0ZzdtUFNDVGlRY1AvYmRQdEUrdW1F?=
 =?utf-8?B?aXFzc2hQOWI5TGhkWDRycXRYYTI1ZTJhVTVvUnRpTHpQRXRsL1Q5bXphSHdm?=
 =?utf-8?B?L2xOaWhqdXVOU25sdHhWVEUyNG4rTngwNmFLYTlnWkJ2eGdHUHk1Z21Eckxw?=
 =?utf-8?B?VDlsYTBicERmZGZhdVBNT3dvRmY0MVluRHM3NXQxZ1g1MWlJVzFFTmRGMXg3?=
 =?utf-8?B?dnZ6cWxuVUZSOWs5aWxLR1htVzdxM2JtLy9WeHhoWUV1cjJyRzFHZ3NuZkMy?=
 =?utf-8?B?bHVISXNyQnlnS25pU2NSZ1lPTE8waDNGeUd0SGlwbHdhU2JHVWRYZVYzZGYz?=
 =?utf-8?B?bCtuYmN5N2NkL1R0clJ1TnhjbEl3OGlTWWRqUXp3N2F5UzY3Ni9CKzRCNEZU?=
 =?utf-8?B?ZTd5NmVkTDZlTk1FSmZwbU80ck9JelN2bGhaQmpTblQzd09XOWs3V1IxRjdY?=
 =?utf-8?B?QndHK3NpNGo2MTJvZXVDcXR4Ynl0OEk2RGJJS2d4UHA2YXFyaEpZVEMzR25X?=
 =?utf-8?B?d1hDajZGMXc0cFRTZmw4ZTFjYzlWb1ZCWTlCeUd2cncxSXFyamg2UU4rZ1h2?=
 =?utf-8?Q?BlG7Rcq6mcCGc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTI4NGZhcWpQSHNlVmhWME1zNFNka0VpcFpTUXhuRi9BbmtQNnVUeG5yNlZo?=
 =?utf-8?B?MVYzZ1BrVDZyYUxYbzMvRWxaTjVWeU5GSEhtZ3l0OGplbmZ1TStqcCtuVk9P?=
 =?utf-8?B?WGVPbGVOOWdXcWhqRGljOGk5UmRWbkFqaEsvUjQ5K3VwT1gxb1h6MnhKWGJa?=
 =?utf-8?B?VUZxUlJXYVBuU2taNmxrK3R3VzBaay9kM0xPdmI0a21ncVdSUlBxaG5oRlJt?=
 =?utf-8?B?bHFsRjNRZlFVM1RjWU1ZZk9vYzhyZ29OSmg2cFZVcnArdFdjRTM3SU4yampq?=
 =?utf-8?B?OFJtOWczZUFhcVJpVnZNQk54b1FXQlEvTjJNU1RXQjVlaTJCZmRDR21sZTZ3?=
 =?utf-8?B?ZkV6MVg1bUoxKytianltRm1zTmVZR213bHZLanMvTitQMjVwbTdaejVyUmZD?=
 =?utf-8?B?TmJFOVZ4NjExRnNTUElncGdVNzR0WkxRTjZzdE9NWS8vQ0NVS005a3hLRUtj?=
 =?utf-8?B?MTZua21kakd1aGI0NFlOMS9XZUtLaGhpUXRUdG9KeEQ2L0IrVUdRN3hFV0tq?=
 =?utf-8?B?V0d0eWpnSThXN2RidjV6aytERU5QbEF6M2thd3dYbFRJeFcySXNLd3gxK3dj?=
 =?utf-8?B?blBxUjlYOGlaYVB2YWduV2RseDdmYVVMRGFhenhuODV4NHhNdytCdndkSzdt?=
 =?utf-8?B?RUZiZEVCV2EvZUtUZXo3ZnZOcEMyVXlkcWsySmp1cmVVMG5BNXBsMFU3NHht?=
 =?utf-8?B?cmRNTEFEOWM3dWM5UU1KMHdMemlNQkxzRVQ5OG5CV2N2VW90SmZvUWVpZ2tM?=
 =?utf-8?B?K2ZTWXQ4M2tYa044UTNXaFJwckQzOGlCZWx5cFZibkF1SXZlNlVsQ3hNYnhr?=
 =?utf-8?B?a2t0dG1RMXY3c1RxTzI0ZE1iNEp5TDdmYUVMVUYxSlN3NEY4M25ZV1JuUkVK?=
 =?utf-8?B?bVZ3dHl3bGhmZFd4WnZTRE12dDZ0elFuK29rU2tVa2hNQituS21HRFljcGIz?=
 =?utf-8?B?ek5Ca3VtUWd1WU5HZ08vN2lYZWJYOWhJcUdqbzRBb20wenhDaUw5a1l4MjBJ?=
 =?utf-8?B?ZC9iZ1NucitteEpXVGN1d0E5TFRhWm1Wb0ZHanBRUHJOZjUrUzIrYXZhNHVL?=
 =?utf-8?B?V3JJbmRFdWR6NWhXZVJ3YithZWNCeEFwN3RBZ3Nodk5XdnYxMXpKK3NQNzZJ?=
 =?utf-8?B?aDNRSTZtUWJaWjFyaEhSOWVwaXNSWUNQWG14VGY0L294b0RTWEpXQVpJdUN2?=
 =?utf-8?B?WjVFYThXSXBFVDJxMTNVNWVvS0VOdVlnUzR5Q2tBNEdNdmJHN0QzeFFibVRz?=
 =?utf-8?B?emluNWpzbi9nRVVOdEhFb2kvYlRwYWs5RlJiN2tEZGVYeEJ2elBZYjhZdHdt?=
 =?utf-8?B?R1NkT0RUMXVMaU5xT3BTQS9XZFk2QVpITG95UlhGWE1TMy9pZGo1K3NIQ01D?=
 =?utf-8?B?ZUxqeFI4WGRoWmNWZENsT3RuOFZlMzU2ZnI1NEFIREVqTmpBTS9qbXU1S043?=
 =?utf-8?B?RHFOM0pSZC8vMTF0bkg4bWRFb2tybzFMUmV2R1Y2QXZ4RUhQY2pRRnJTWk90?=
 =?utf-8?B?dTBKMkQ3d0RGS2xUZzNkeGtYVWxTSml0M2ZoQWhjcHlkTFFQbk1nSG5DdmZE?=
 =?utf-8?B?ZEltdW96Ykx4NEtDc21aMDJUTGRrbGU3aVBQWXFKYktacjdYSW5tQTd5Nnd5?=
 =?utf-8?B?SFl0NUluZE9CYzV6Q3I1ZDJ4MVNlaE1JcWJCK0krQWpjSVdlTkJmTXZoUUtE?=
 =?utf-8?B?Y0FxUHBwOHdTNmdtWVYzUkJWRzVSTlA0ak5wbUdHeDcrSlNmY1RqTG5FWmZX?=
 =?utf-8?B?Uzg0SThjbkdURDQrOGJnamQxY1JrT3JNNTRUVEpxb3FEOGttV0RCSVgxQytB?=
 =?utf-8?B?Y3d0bE43ZFlUNGp6U01NL0k0amZGeFlUUmlzamRpZ3lmNlN4S01jQVRZdU9i?=
 =?utf-8?B?U2FZWUdLK2t6ZGdDS1JmVEFRRnA0Y2JVNnhpTDJjOWZFVCt4OGZ4d1dQK3ZF?=
 =?utf-8?B?aWErNUxMTnh4WHJrRG1Vd2pHb0xpTndpRWV6VWZoNlhLSlBLb1RYNkZGSmtO?=
 =?utf-8?B?TjM2NEhLQ1JkMnliOXNCVlVtZUlnOTcrenBVYnpwYkVjV2JUMjIzelY0U0Q0?=
 =?utf-8?B?QzZmb29oTU41bGxBT3o2R1lobkVBUXBjMGszdHdVVGlkRzRCajFaOEMwQnlE?=
 =?utf-8?B?WjNmaG5KSGlXTlBYNzZTNmtJSmVQWkRQNUEzakY5UnhOL1gxRk1YbGJDakk3?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d06925-c519-4aa6-af45-08dd51bbaa31
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 14:34:21.6569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vG7QOwnf5IKFSknl/oRrXGpfsJu8hXRnSEzGogygjTr8jrmz+wYgspWSLsVBD+9wu91c6mGCXLq7DjA5Naiz4SO0qa+fCgmJfYRbXsED3kQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
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



On 2/13/25 4:10 AM, Matthew Brost wrote:
> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> Introduce xe_bo_put_async to put a bo where the context is such that
> the bo destructor can't run due to lockdep problems or atomic context.
> 
> If the put is the final put, freeing will be done from a work item.
> 
> v5:
>   - Kerenl doc for xe_bo_put_async (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c           | 25 +++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_bo.h           | 19 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device.c       |  3 +++
>   drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
>   4 files changed, 55 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index cd1c693c0b62..a2a924b531e5 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2644,6 +2644,31 @@ void xe_bo_put_commit(struct llist_head *deferred)
>   		drm_gem_object_free(&bo->ttm.base.refcount);
>   }
>   
> +static void xe_bo_dev_work_func(struct work_struct *work)
> +{
> +	struct xe_bo_dev *bo_dev = container_of(work, typeof(*bo_dev), async_free);
> +
> +	xe_bo_put_commit(&bo_dev->async_list);
> +}
> +
> +/**
> + * xe_bo_dev_init() - Initialize BO dev to manage async BO freeing
> + * @bo_dev: The BO dev structure
> + */
> +void xe_bo_dev_init(struct xe_bo_dev *bo_dev)
> +{
> +	INIT_WORK(&bo_dev->async_free, xe_bo_dev_work_func);
> +}
> +
> +/**
> + * xe_bo_dev_fini() - Finalize BO dev managing async BO freeing
> + * @bo_dev: The BO dev structure
> + */
> +void xe_bo_dev_fini(struct xe_bo_dev *bo_dev)
> +{
> +	flush_work(&bo_dev->async_free);
> +}
> +
>   void xe_bo_put(struct xe_bo *bo)
>   {
>   	struct xe_tile *tile;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index f09b9315721b..9dfec438d1c7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -322,6 +322,25 @@ xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
>   
>   void xe_bo_put_commit(struct llist_head *deferred);
>   
> +/**
> + * xe_bo_put_async() - Put BO async
> + * @bo: The bo to put.
> + *
> + * Put BO async, the final put is deferred to a worker to exit an IRQ context.
> + */
> +static inline void
> +xe_bo_put_async(struct xe_bo *bo)
> +{
> +	struct xe_bo_dev *bo_device = &xe_bo_device(bo)->bo_device;
> +
> +	if (xe_bo_put_deferred(bo, &bo_device->async_list))
> +		schedule_work(&bo_device->async_free);
> +}
> +
> +void xe_bo_dev_init(struct xe_bo_dev *bo_device);
> +
> +void xe_bo_dev_fini(struct xe_bo_dev *bo_device);
> +
>   struct sg_table *xe_bo_sg(struct xe_bo *bo);
>   
>   /*
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 36d7ffb3b4d9..756099e870cd 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -388,6 +388,8 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>   {
>   	struct xe_device *xe = to_xe_device(dev);
>   
> +	xe_bo_dev_fini(&xe->bo_device);
> +
>   	if (xe->preempt_fence_wq)
>   		destroy_workqueue(xe->preempt_fence_wq);
>   
> @@ -425,6 +427,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   	if (WARN_ON(err))
>   		goto err;
>   
> +	xe_bo_dev_init(&xe->bo_device);
>   	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
>   	if (err)
>   		goto err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 833c29fed3a3..6a41f608a7a1 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -525,6 +525,14 @@ struct xe_device {
>   		int mode;
>   	} wedged;
>   
> +	/** @bo_device: Struct to control async free of BOs */
> +	struct xe_bo_dev {
> +		/** @async_free: Free worker */
> +		struct work_struct async_free;
> +		/** @async_list: List of BOs to be freed */
> +		struct llist_head async_list;
> +	} bo_device;
> +
>   	/** @pmu: performance monitoring unit */
>   	struct xe_pmu pmu;
>
Looks good to me.

Tested-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

