Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79990B21D93
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 07:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F59410E58E;
	Tue, 12 Aug 2025 05:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHhHWzG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F338A10E58E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754978056; x=1786514056;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5R+kAdDvH7Q9Z7k1b9XgXFgUVPDoViTfqllez9kxQDs=;
 b=IHhHWzG0kjW5uka1qVr44GPO+fphJpg6eogagEfuGaQBbONqEWq4pZ4T
 SLmeo5WxDFqcG7PifqrsxOW+Q1HMGg1F7HZljR8LIkZWcxDz6BOtRybTi
 0QNjY3KRwBSJb/UccYC3l7WwBhNsjteoIYHkaAxuKc5Ir4E9kjOEvoPlK
 4Dt83+DszaGyKHONjCgeECI6d0P2XKZ1/OvVhHA4zmojeqFWCXk8uaz6V
 eDDPkKtI1o/UmnPYgxo29Ava0iTlREbbdv7HVk7XIbGbsrgBwXjOxw76q
 489YsnDYF5IsfNcwNT8ZmOo5t5BpzhuSifCIuzYWpku7N1k3oTxu2JAv6 w==;
X-CSE-ConnectionGUID: 9R+h5Ug+SGe0o2vCB4BZcg==
X-CSE-MsgGUID: pDGowhHdSfyrvkI81YqAuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="79813167"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="79813167"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 22:54:15 -0700
X-CSE-ConnectionGUID: iRAlcl+4T/+IyFb3SIYWyQ==
X-CSE-MsgGUID: vu33A235THm/xo7jOYCLHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="170552715"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 22:54:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 22:54:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 22:54:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 22:54:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vd+S+VKjWAa1U37zEDLG1d4nYr5MPxImK+3+b5ygM/+SXggr2ffyVSe0EPIk+unzk9xXgIaMdzpyQjT9IfHnwDsqfutKr2/xIs6EZZHM3QEUKsnPF2UGBooW6mxCg4h8YCzdE2T3bSCeI6JwB+4/T0TjBKHW4u2f84LIH/pxDobQ9cPAMt+YM4h4kodwujNjP26cEEYD7pYz9a7Gs+28h6lD3hBYizrbMsHcgLRgMqPd8hdO6CXaVoAcfhXa3KHzEElmXLY700Qsb/P8tQHhVPcVExmT7qSE5zwKgtBPuX666gRALBAJVJq30bkZNpqvvlts3/uhGOxKP9vwVTU7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7qlp5Choj65dNvzRCL+KBwOUq5Di89Lqlv7Zjr2Dwk=;
 b=Eyf4WNHysFx2aN7mO32JcZQuw+VQXMT8+Jh4mtE/9jYSLILdVYLCU8dArmokNh4eQgCW2EzAlcHvW6PUCl7sA3OzeJIqxUZ2Pz4aRk0jS0tCXFmQ5FJ2kfN+WFehF4VpjAkngZU/w8pMRlKR6XAg9YXyGlE4szXVlsA6uY5/YxLyDz74q+cJ9AFZndF1upA68pWJaixMl4y4E7M7LEvLvMhV3rzlV0F+H14xAgW3s71tDIhLPcj4nvaYQRglhG1qcLSHEWD59UrBJ4hC7Ze/hOi+oHd3OUqJlPX3xmrFMvTckKB3FuDucb+BSrrwzn7hjG/qt06ynIX7YlbD/9AWIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4793.namprd11.prod.outlook.com (2603:10b6:806:fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 05:54:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 05:54:07 +0000
Date: Mon, 11 Aug 2025 22:54:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>
CC: Balbir Singh <balbirs@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, Zi Yan
 <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim
 <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price
 <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, "Alistair
 Popple" <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain
 <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lyude Paul
 <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Ralph Campbell
 <rcampbell@nvidia.com>, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v3 03/11] mm/migrate_device: THP migration of zone device pages
Message-ID: <aJrW/JUBhdlL2Kur@lstrano-desk.jf.intel.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
 <20250812024036.690064-4-balbirs@nvidia.com>
 <81ca37d5-b1ff-46de-8dcc-b222af350c77@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81ca37d5-b1ff-46de-8dcc-b222af350c77@redhat.com>
X-ClientProxiedBy: SJ0PR13CA0037.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4793:EE_
X-MS-Office365-Filtering-Correlation-Id: 5efe1281-d84d-4e80-c2c0-08ddd964a69c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTdXNFB5U2Y1U2ZqSDl3ZVZwUEw4dUljUE55dForM2dBbjBpSkZYVDVmNGtk?=
 =?utf-8?B?czh3U0FzenBCazBZb0hXZFp5aU1HbGNNQ1R4WFVkdDNSN2JtOE96ekNJVjdx?=
 =?utf-8?B?ZStOeVRraCtqM3BJVGQ1L2p6UnZQYWJZUXJtZ2pqNzJPUTJ4cWVUMVhFd2dT?=
 =?utf-8?B?eGpNVUxKVGpIbGJaYXFDaWRRanRTWlNPQnE3c1dkUEZYMGRrYWUvT2gySnda?=
 =?utf-8?B?NWFpTG95UEpoZmc0a3U0Z1oyS3R0bjlNTzhxTUZjcEpEUHRnWFp3T2NIU1BT?=
 =?utf-8?B?dnkzQkVTRFlNdUxiMTF1Y3hBcEwzT1l0eUxVOFRRTlVKTUVXWDJ2bUFNSGRV?=
 =?utf-8?B?bWVVaGlTQklvckVhWUJhc3pLcWV4WmRiOEh3TDIwWks3TVhma0VRNjUvMWs2?=
 =?utf-8?B?UWxQbDlKaTRhSGl4c1pleko3SytvTm5LU0pJczVDZStHQkRxUEZhcEtNYWll?=
 =?utf-8?B?Y0VOdEFMZU1Fd3lqa2pEUVQvS01YR1ZRUS9LOXhaQmhCVkVHeFpFeU0wNHZR?=
 =?utf-8?B?T3FYL0M0cDBnZFB1OVR3SVJDZXdBbFBmWXFzZ2l1elZFTnMrcG9JQkxkMUhX?=
 =?utf-8?B?TlVHVktVOHNGSlBkR1FDandQeE1kMFVCWVMyZzNadE5QckRhM2N1ZldSMVRB?=
 =?utf-8?B?VE1QV1poYXdZSFIyTTkvMXhpNlBIREpCMzFCcllOeDIrQ1pZQ3lWYXBMb3Fy?=
 =?utf-8?B?ZEl1dlY5bW02QU55U3J1S1hGRXRqRkpodTJ6dDFFVHFVWHdUdVMwRFB5a3NV?=
 =?utf-8?B?WTBsV2ZJbmpreEdWcjhvUnRhcVJoN1ZGZnloT29KalhTY0hBOXRiMmlRRm5T?=
 =?utf-8?B?SDkrYTRDOVFqK2JqZ2RVMFd1SFpCMEhPZzFOOXo4S2FINVFwYWNBdk5uKzdt?=
 =?utf-8?B?UFBCOXZEbkJTQ3JNNDRlTXRJVkN0SzY2RmxuUmh1cnFzeTZ6TUhWSzNMN3ZJ?=
 =?utf-8?B?MWZJY2t5UDJYUzY5NEk2RzIrQm00dS9GZzZrZ3lkN2FQVXpDUUlmSmdEeTZF?=
 =?utf-8?B?QmJjTlVvOWlrZDI4VEMvZ1JPY0IzZ3MwYnV0ekFtVjRkVUNrVmNjNEluV25N?=
 =?utf-8?B?a3ZFS2tPRnh2eG5ZR3d1U1Rva2t5eVFnRTRpSTBraG9UR3VuVC9BWEJJeXhQ?=
 =?utf-8?B?RWk1N1BFbFNxZzkyeVRoMkxFS0NraFNKQW1RbE9Wb3cvLy9GbW9ZaUpyUi9h?=
 =?utf-8?B?MDhNdGl3b0lOTmxsdnVHVVNBc0VtSkptRElKK3JsLy9WTkRveGVwZnMycm5U?=
 =?utf-8?B?dmdqTE9wbExmdFdMYXBhL0RhVGREVmNmSEdSRzgyU1B6V0ozQ0N5c1FWRHVs?=
 =?utf-8?B?SG4zZmhvREFHWWprREhvS210TDFyZnR5eG96Rm13MHhiNFZGaDVkZ2NkWksw?=
 =?utf-8?B?ZzZJMWpZbE1kYlloM2ZaN2Q0TUV0Mkt2czA1U1hDeGx6WnRwNWk4MFdhcHow?=
 =?utf-8?B?TUpMZjNlSDRacFUwSjVCa1RRd0NjN0xaMU9LMHJmck9vYWV2QW1HNVE0OWFQ?=
 =?utf-8?B?eENaaS8rSXNPVjRhaitQbjFlSzRqN1F6NlluUEE5ZTJEbk4zd2NYWGYyZGxB?=
 =?utf-8?B?ZzJwT0NKS0pBTDJ2OU1OK1hTdjJTUm8yeCtqOFVOVGdoVjVFWlY4bmtSV29T?=
 =?utf-8?B?UGN5RkdwcUt1M1Jpb1MzTHFncXAyNytKT3RpUUhaUkZBbE5USGNjdE9hWnI4?=
 =?utf-8?B?VnFIRTRHK3dwZ2xhREFsbWltNWNZcHdLTXE0YlNuQW1kL3NvcmhmVW1rcjE3?=
 =?utf-8?B?WHVITVZCRXkvOE9jMUNRRHZ0aGxjVTJ0bjJlUGNlTGJRZmJxcGw0Q2VNWGtY?=
 =?utf-8?B?blpOWm5oTTFrcUV1TXlpNWV0UlB0YkxMWTdOV01VMTdhL1ZpZCs1aThXOXVD?=
 =?utf-8?B?Rm5PS3VIVlI3TUlodVJmaUdjL3VOempLTnRySnlXR3VYcnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ti9nZkIvV2ozSk0vaWp5eGNVZ2dxcGRsZk5KQ0lGM2dGdWtVRUl5ekIvZWVh?=
 =?utf-8?B?SFFKYzVmc3VXTSsvVGRuS0wrZEVHeTN4VjJxd2xielViTzE0cllJNUdwRDIr?=
 =?utf-8?B?T0FYaDVJODV6UEErK3p5QW9SbHZIL1JQMExtb2lmVFdvYlN0T2o1bFBZOG41?=
 =?utf-8?B?WnVxaFFnNFpFeHVkNFR4bktwNnhpcGFxUWo3SmorVk90OUpqRnpFNmZlempy?=
 =?utf-8?B?VGZWWnZYYjVHSXpCWS9ZYk8vdkNBQTZGanZXR1FHNC9NR1RtSm1hc2JtZllS?=
 =?utf-8?B?MjcycjFJVUpXV3VtRlJZUmc3U2M2Qlg2RGRnQU5Ia1pJQ0Nzbmc5ZjVLOFdZ?=
 =?utf-8?B?UkR2MU5KdFlZYThYZ2Vmc0dJTzJwTVVScFBPUFYreVdsN1pvdmxoUXFNRlNy?=
 =?utf-8?B?WFFOY00rVkZXUFcxR0hyYTZ3NHBKK2Fjcmd0bHMxazVzU0h5bTViRWl0cFo4?=
 =?utf-8?B?RlhlUE1BOE55OWRGck5VZDRpRjlmVWdFZmt2MGMwVCt6cWNha2xCZWgxMlps?=
 =?utf-8?B?TUIvaGxndU5PZ3hkVUN0UVY4TnI4cU4wL1NaWUkydHNmeVVBT3oyY0lMemRo?=
 =?utf-8?B?aXUwZ1gySWZzVHFzMGQ3WWx3SUhqUWJvc20yUW5rbUZMREJ4bStzM2tiQmE0?=
 =?utf-8?B?MWxjM2liR0xZTWV3T2gwTzRDQ1VIelFWU05rUVNtS25TeXVRWkJVdXAzL2Fa?=
 =?utf-8?B?ck5CVm5CS3pQeE1udHAzdzJMcThKR1FqRTZQRmpzZVU3aUxQK0E1c2owdzJN?=
 =?utf-8?B?UEhpMzlrZ1ZHS1BtdklESFJUVzJqWFhhQXBySC9UUHg5NzdtbjhQOE5ta3Ja?=
 =?utf-8?B?S0pFV0d2R09JMFZmclRkTGl2Zi9yU29mMzR3QXcwcUxuc0k1YlNpZkxRaVh5?=
 =?utf-8?B?dndzanBTMmlQZGpnMVJvaGNxVnhCZ0lXNmRkV09sSjY2bG14Wm42TUM2Sk45?=
 =?utf-8?B?aTYyeEEzbStIcC9GbWRoZDYvTGtSaWFsam52dTVQSE5TaGRUcnRZWU9QWW56?=
 =?utf-8?B?dXFnSWFwMWRsTGg4ck1yMGdMZW55Z1B3SVN6bW9ObGdUYmlSL09qdE5tRysr?=
 =?utf-8?B?ekpBOW83ejk1Z1pMWThNejdhUnZDdFBQQ0Q2bjdWcksyTDhwS3h2WUVsaTRT?=
 =?utf-8?B?U2VWOStWVndGSkw5TVpJcmlxdjkwbW5kNE0vQW9yVUN2a21VVzVUNGxuWG1Y?=
 =?utf-8?B?MnBjeFkrWWNlZllidGMxTnVGTThtT3FWU3VIVEFLdGtmRmlwWlRoLzE4cUpK?=
 =?utf-8?B?d2NCdXhGWEJHMHFEK2t1UzJLWXlhWkV1UnowbmdLQytCb0hxcUpEN3dRZENx?=
 =?utf-8?B?ZzE2OU5Oam1KTFk5N1JyN3V1S2VJMEFpdE5ibEtJMDl5ak1HYkVpVmZ5ZDlB?=
 =?utf-8?B?UVA2Z3FhT1NRZlBkNlNhbVZCdWZpSDdmSHNhNUE2MGRuS0srV25leDQ1eDhV?=
 =?utf-8?B?N04zNmtCb1RJRjFTMkR1a3FobGMzcC9RZEp4LzZyMHY1REpSdEROM3ppQXoz?=
 =?utf-8?B?TVVKNXU0Y09rL0w4ZzdGOHpxTzlDOFludSt3eFRLZnlYc1g5VFRxMnE0YTlF?=
 =?utf-8?B?YXZabnZlQmNhWGc0SHNUQXRBVGpTUzJuWDd0cGlmQjhnditwam1HS3JINlgz?=
 =?utf-8?B?b3lOUUJ1L0RQbmpPcW9WS0JXSHI1UlloNUc5OTZCN2YyNmp0K0tuNU1nbDU2?=
 =?utf-8?B?czU4bEdFdzgyMUJ1dk4wKzdURGtOeXhJWmlGMHlRYWFCZ3dMZG9DR2ZWN2xq?=
 =?utf-8?B?RFo0d0VnNUJQRzByZlFRKzJPWHB4VEV4b0hoTU9wak42ZzN1dGtkVUlGU25X?=
 =?utf-8?B?ejRoWlhHb1IyUlRiUEcxMDlEMlBrNUJrdElTeG5aaHQyYTdQbXdGeDcxeitB?=
 =?utf-8?B?ZVhBbllNK3dQTkdwcGpVYWFSb2oxajhrWEcxcmR3b0s0Z0QyQlZHVnJ4Qzgr?=
 =?utf-8?B?NmdiVXdDTmJXbk1MVWpDb29SUy9zRU9zd0JISTcxaU93RDVjTFh3d2xjN1Zw?=
 =?utf-8?B?VW1KYTl6U2kyUnRVKzU0S1lTK2srK0krNC9xd1pDTktZWEllazljZ0syR3VF?=
 =?utf-8?B?elFhRXQ0WGJkQXk2WE1jNlB5Z21yZm1VaWRwTG41MHFycGdtYTVqZzJGVXZ0?=
 =?utf-8?B?dEE5UEdCejFGbGRjSDdkbXY4ZklMVnR5Ynhyem9ZaHVlcVdEbWpieGFoaG9V?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5efe1281-d84d-4e80-c2c0-08ddd964a69c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 05:54:07.3452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JN+Z8Z7LA9z72g7QvDSISKsOIlm172NucWMijk7sLVJDWKSJSoE6vbMXsdMJs5TzuDOKa/gCZRwHl/06+Q8YSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4793
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

On Tue, Aug 12, 2025 at 08:35:49AM +0300, Mika Penttilä wrote:
> Hi,
> 
> On 8/12/25 05:40, Balbir Singh wrote:
> 
> > MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
> > migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
> > device pages as compound pages during device pfn migration.
> >
> > migrate_device code paths go through the collect, setup
> > and finalize phases of migration.
> >
> > The entries in src and dst arrays passed to these functions still
> > remain at a PAGE_SIZE granularity. When a compound page is passed,
> > the first entry has the PFN along with MIGRATE_PFN_COMPOUND
> > and other flags set (MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the
> > remaining entries (HPAGE_PMD_NR - 1) are filled with 0's. This
> > representation allows for the compound page to be split into smaller
> > page sizes.
> >
> > migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP
> > page aware. Two new helper functions migrate_vma_collect_huge_pmd()
> > and migrate_vma_insert_huge_pmd_page() have been added.
> >
> > migrate_vma_collect_huge_pmd() can collect THP pages, but if for
> > some reason this fails, there is fallback support to split the folio
> > and migrate it.
> >
> > migrate_vma_insert_huge_pmd_page() closely follows the logic of
> > migrate_vma_insert_page()
> >
> > Support for splitting pages as needed for migration will follow in
> > later patches in this series.
> >
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Zi Yan <ziy@nvidia.com>
> > Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> > Cc: Rakie Kim <rakie.kim@sk.com>
> > Cc: Byungchul Park <byungchul@sk.com>
> > Cc: Gregory Price <gourry@gourry.net>
> > Cc: Ying Huang <ying.huang@linux.alibaba.com>
> > Cc: Alistair Popple <apopple@nvidia.com>
> > Cc: Oscar Salvador <osalvador@suse.de>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > Cc: Nico Pache <npache@redhat.com>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Dev Jain <dev.jain@arm.com>
> > Cc: Barry Song <baohua@kernel.org>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: Ralph Campbell <rcampbell@nvidia.com>
> > Cc: Mika Penttilä <mpenttil@redhat.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> >
> > Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> > ---
> >  include/linux/migrate.h |   2 +
> >  mm/migrate_device.c     | 457 ++++++++++++++++++++++++++++++++++------
> >  2 files changed, 396 insertions(+), 63 deletions(-)
> >
> > diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> > index acadd41e0b5c..d9cef0819f91 100644
> > --- a/include/linux/migrate.h
> > +++ b/include/linux/migrate.h
> > @@ -129,6 +129,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
> >  #define MIGRATE_PFN_VALID	(1UL << 0)
> >  #define MIGRATE_PFN_MIGRATE	(1UL << 1)
> >  #define MIGRATE_PFN_WRITE	(1UL << 3)
> > +#define MIGRATE_PFN_COMPOUND	(1UL << 4)
> >  #define MIGRATE_PFN_SHIFT	6
> >  
> >  static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
> > @@ -147,6 +148,7 @@ enum migrate_vma_direction {
> >  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
> >  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
> >  	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
> > +	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
> >  };
> >  
> >  struct migrate_vma {
> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > index 0ed337f94fcd..6621bba62710 100644
> > --- a/mm/migrate_device.c
> > +++ b/mm/migrate_device.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/pagewalk.h>
> >  #include <linux/rmap.h>
> >  #include <linux/swapops.h>
> > +#include <asm/pgalloc.h>
> >  #include <asm/tlbflush.h>
> >  #include "internal.h"
> >  
> > @@ -44,6 +45,23 @@ static int migrate_vma_collect_hole(unsigned long start,
> >  	if (!vma_is_anonymous(walk->vma))
> >  		return migrate_vma_collect_skip(start, end, walk);
> >  
> > +	if (thp_migration_supported() &&
> > +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
> > +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
> > +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
> > +		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE |
> > +						MIGRATE_PFN_COMPOUND;
> > +		migrate->dst[migrate->npages] = 0;
> > +		migrate->npages++;
> > +		migrate->cpages++;
> > +
> > +		/*
> > +		 * Collect the remaining entries as holes, in case we
> > +		 * need to split later
> > +		 */
> > +		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
> > +	}
> > +
> >  	for (addr = start; addr < end; addr += PAGE_SIZE) {
> >  		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE;
> >  		migrate->dst[migrate->npages] = 0;
> > @@ -54,57 +72,151 @@ static int migrate_vma_collect_hole(unsigned long start,
> >  	return 0;
> >  }
> >  
> > -static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > -				   unsigned long start,
> > -				   unsigned long end,
> > -				   struct mm_walk *walk)
> > +/**
> > + * migrate_vma_collect_huge_pmd - collect THP pages without splitting the
> > + * folio for device private pages.
> > + * @pmdp: pointer to pmd entry
> > + * @start: start address of the range for migration
> > + * @end: end address of the range for migration
> > + * @walk: mm_walk callback structure
> > + *
> > + * Collect the huge pmd entry at @pmdp for migration and set the
> > + * MIGRATE_PFN_COMPOUND flag in the migrate src entry to indicate that
> > + * migration will occur at HPAGE_PMD granularity
> > + */
> > +static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
> > +					unsigned long end, struct mm_walk *walk,
> > +					struct folio *fault_folio)
> >  {
> > +	struct mm_struct *mm = walk->mm;
> > +	struct folio *folio;
> >  	struct migrate_vma *migrate = walk->private;
> > -	struct folio *fault_folio = migrate->fault_page ?
> > -		page_folio(migrate->fault_page) : NULL;
> > -	struct vm_area_struct *vma = walk->vma;
> > -	struct mm_struct *mm = vma->vm_mm;
> > -	unsigned long addr = start, unmapped = 0;
> >  	spinlock_t *ptl;
> > -	pte_t *ptep;
> > +	swp_entry_t entry;
> > +	int ret;
> > +	unsigned long write = 0;
> >  
> > -again:
> > -	if (pmd_none(*pmdp))
> > +	ptl = pmd_lock(mm, pmdp);
> > +	if (pmd_none(*pmdp)) {
> > +		spin_unlock(ptl);
> >  		return migrate_vma_collect_hole(start, end, -1, walk);
> > +	}
> >  
> >  	if (pmd_trans_huge(*pmdp)) {
> > -		struct folio *folio;
> > -
> > -		ptl = pmd_lock(mm, pmdp);
> > -		if (unlikely(!pmd_trans_huge(*pmdp))) {
> > +		if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
> >  			spin_unlock(ptl);
> > -			goto again;
> > +			return migrate_vma_collect_skip(start, end, walk);
> >  		}
> >  
> >  		folio = pmd_folio(*pmdp);
> >  		if (is_huge_zero_folio(folio)) {
> >  			spin_unlock(ptl);
> > -			split_huge_pmd(vma, pmdp, addr);
> > -		} else {
> > -			int ret;
> > +			return migrate_vma_collect_hole(start, end, -1, walk);
> > +		}
> > +		if (pmd_write(*pmdp))
> > +			write = MIGRATE_PFN_WRITE;
> > +	} else if (!pmd_present(*pmdp)) {
> > +		entry = pmd_to_swp_entry(*pmdp);
> > +		folio = pfn_swap_entry_folio(entry);
> > +
> > +		if (!is_device_private_entry(entry) ||
> > +			!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
> > +			(folio->pgmap->owner != migrate->pgmap_owner)) {
> > +			spin_unlock(ptl);
> > +			return migrate_vma_collect_skip(start, end, walk);
> > +		}
> >  
> > -			folio_get(folio);
> > +		if (is_migration_entry(entry)) {
> > +			migration_entry_wait_on_locked(entry, ptl);
> >  			spin_unlock(ptl);
> > -			/* FIXME: we don't expect THP for fault_folio */
> > -			if (WARN_ON_ONCE(fault_folio == folio))
> > -				return migrate_vma_collect_skip(start, end,
> > -								walk);
> > -			if (unlikely(!folio_trylock(folio)))
> > -				return migrate_vma_collect_skip(start, end,
> > -								walk);
> > -			ret = split_folio(folio);
> > -			if (fault_folio != folio)
> > -				folio_unlock(folio);
> > -			folio_put(folio);
> > -			if (ret)
> > -				return migrate_vma_collect_skip(start, end,
> > -								walk);
> > +			return -EAGAIN;
> >  		}
> > +
> > +		if (is_writable_device_private_entry(entry))
> > +			write = MIGRATE_PFN_WRITE;
> > +	} else {
> > +		spin_unlock(ptl);
> > +		return -EAGAIN;
> > +	}
> > +
> > +	folio_get(folio);
> > +	if (folio != fault_folio && unlikely(!folio_trylock(folio))) {
> > +		spin_unlock(ptl);
> > +		folio_put(folio);
> > +		return migrate_vma_collect_skip(start, end, walk);
> > +	}
> > +
> > +	if (thp_migration_supported() &&
> > +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
> > +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
> > +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
> > +
> > +		struct page_vma_mapped_walk pvmw = {
> > +			.ptl = ptl,
> > +			.address = start,
> > +			.pmd = pmdp,
> > +			.vma = walk->vma,
> > +		};
> > +
> > +		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
> > +
> > +		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
> > +						| MIGRATE_PFN_MIGRATE
> > +						| MIGRATE_PFN_COMPOUND;
> > +		migrate->dst[migrate->npages++] = 0;
> > +		migrate->cpages++;
> > +		ret = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
> > +		if (ret) {
> > +			migrate->npages--;
> > +			migrate->cpages--;
> > +			migrate->src[migrate->npages] = 0;
> > +			migrate->dst[migrate->npages] = 0;
> > +			goto fallback;
> > +		}
> > +		migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
> > +		spin_unlock(ptl);
> > +		return 0;
> > +	}
> > +
> > +fallback:
> > +	spin_unlock(ptl);
> > +	if (!folio_test_large(folio))
> > +		goto done;
> > +	ret = split_folio(folio);
> > +	if (fault_folio != folio)
> > +		folio_unlock(folio);
> > +	folio_put(folio);
> > +	if (ret)
> > +		return migrate_vma_collect_skip(start, end, walk);
> > +	if (pmd_none(pmdp_get_lockless(pmdp)))
> > +		return migrate_vma_collect_hole(start, end, -1, walk);
> > +
> > +done:
> > +	return -ENOENT;
> > +}
> > +
> > +static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > +				   unsigned long start,
> > +				   unsigned long end,
> > +				   struct mm_walk *walk)
> > +{
> > +	struct migrate_vma *migrate = walk->private;
> > +	struct vm_area_struct *vma = walk->vma;
> > +	struct mm_struct *mm = vma->vm_mm;
> > +	unsigned long addr = start, unmapped = 0;
> > +	spinlock_t *ptl;
> > +	struct folio *fault_folio = migrate->fault_page ?
> > +		page_folio(migrate->fault_page) : NULL;
> > +	pte_t *ptep;
> > +
> > +again:
> > +	if (pmd_trans_huge(*pmdp) || !pmd_present(*pmdp)) {
> > +		int ret = migrate_vma_collect_huge_pmd(pmdp, start, end, walk, fault_folio);
> > +
> > +		if (ret == -EAGAIN)
> > +			goto again;
> > +		if (ret == 0)
> > +			return 0;
> >  	}
> >  
> >  	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> > @@ -222,8 +334,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
> >  		}
> >  
> > -		/* FIXME support THP */
> > -		if (!page || !page->mapping || PageTransCompound(page)) {
> > +		if (!page || !page->mapping) {
> >  			mpfn = 0;
> >  			goto next;
> >  		}
> > @@ -394,14 +505,6 @@ static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
> >  	 */
> >  	int extra = 1 + (page == fault_page);
> >  
> > -	/*
> > -	 * FIXME support THP (transparent huge page), it is bit more complex to
> > -	 * check them than regular pages, because they can be mapped with a pmd
> > -	 * or with a pte (split pte mapping).
> > -	 */
> > -	if (folio_test_large(folio))
> > -		return false;
> > -
> 
> You cannot remove this check unless support normal mTHP folios migrate to device, 
> which I think this series doesn't do, but maybe should?
> 

Currently, mTHP should be split upon collection, right? The only way a
THP should be collected is if it directly maps to a PMD. If a THP or
mTHP is found in PTEs (i.e., in migrate_vma_collect_pmd outside of
migrate_vma_collect_huge_pmd), it should be split there. I sent this
logic to Balbir privately, but it appears to have been omitted.

I’m quite sure this missing split is actually an upstream bug, but it
has been suppressed by PMDs being split upon device fault. I have a test
that performs a ton of complete mremap—nonsense no one would normally
do, but which should work—that exposed this. I can rebase on this series
and see if the bug appears, or try the same nonsense without the device
faulting first and splitting the pages, to trigger the bug.

Matt

> --Mika
> 
