Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4D7C72487
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 06:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5A610E299;
	Thu, 20 Nov 2025 05:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7e5IurE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5D410E299
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 05:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763618004; x=1795154004;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BChzAsrnKrIU0EvLSqQPRFkglMv31ixp6p9GApIxOJU=;
 b=I7e5IurEbe77izPEdg+TqknEYAsfYA+TA5OBQBPkoMzfFh0HgJO7Kwyx
 wGE8eJaotCCPYcdM9rdTeV+3G+KkMwTFjTovCpwz+jIINwhTZsgA/LC0K
 5Z9OJBBGO1SmGXnkPwvXrBkbtNNJ2g8Xqq70JT31uW5iAAFKmlO7IT336
 wiyO+ChJdocHakLb292+6A041DVEbD47gxEa0W3iHbs1pgXitgwc4OjOn
 MvM0+EteSBt+DW6LRvteHRN5d3ISIgn/mHVVNJJ3mW8osbCvzGbG44gR3
 tHZfw+SVU3a89Ft1MCcZH9d/u34Y4bKoyZI26pa2XARmZgXPZsnVNhq7X w==;
X-CSE-ConnectionGUID: /q+GXuBsSf2bT7ojgxi5Dg==
X-CSE-MsgGUID: AoH0vRssQjGepHjEtEFHoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="88330334"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="88330334"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 21:53:23 -0800
X-CSE-ConnectionGUID: CSoT+FK4T76Z3+9/FQZKeA==
X-CSE-MsgGUID: MSlPIKWzSFCAQnqa8aMp8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="192063735"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 21:53:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 21:53:22 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 21:53:22 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 21:53:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDNryQ8zFDcrR0miw8LLFporX1SBvtbciC6qGWX2dKLlrDNfWLIhUzSAl5ixmpB+wz/89bSDoVF/hdXPn/iKHWjkEf0kj4DXyqdrWa+9U9pbpxV0VL1/1RDpsSKusq6TfKqlYlObXXCwsqa5Xyq0eDgdrNGEO6fRonKHQxowfli4VatHu8SZNONcTGQX2jHh8MXUMgXEadVr7NlKGtYd79SkxqiEqg53y/FLHZv+ZR1ZUHU88Myg833ySkH/kW97VfGD5YRxkBKvyrhNHQYApkT6PsSlLp2WSI7jZg2e/whEv8ePHNPm73ls68RHU0GuY4M/Fov5bxgSVVB+IRfRiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XjlNMIJxIhw3ooUEn7DbX+F8lvudsvoY69LKaQVUtI=;
 b=e1x7SEtlg1uYGGv22Tqoca9PVvI4pdm0aSf/GI8NF+ZRd/0/EOtKaOnDmbZgQMOfRcW59v+4FL7uKyDDO4Xuwdrj33wwarr5nX2wEVakmwyPthYRQGRvY95ppm0zG1ntEc7Jxx8ZSYwqOpJrON3lmzKRXx56GKeRJ9oEf2GtvQ17HoRGUc8+wfiJ2xPBGxhAHO+A0AnQCYq8lwByCDVvZsUUf68iFuFlJMTWTw8T4g7f5pwnlt+NoaMD9LGxR1pBzGU7WneN6b/C9cISFbTMkxHeS++3syyWZ/Oo8VdwxQPWtAHhvf+asnrCmwwufL74zpDy85wcd8y4ZGi8xQ3nLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6622.namprd11.prod.outlook.com (2603:10b6:a03:478::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 05:53:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 05:53:19 +0000
Date: Wed, 19 Nov 2025 21:53:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
CC: Andrew Morton <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-mm@kvack.org>, David Hildenbrand
 <david@redhat.com>, Zi Yan <ziy@nvidia.com>, Joshua Hahn
 <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park
 <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, "Oscar
 Salvador" <osalvador@suse.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>, Mika
 =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: Re: [v7 00/16] mm: support device-private THP
Message-ID: <aR6szF6Ga8K2ZRjR@lstrano-desk.jf.intel.com>
References: <20251008201740.d9507f4807a73058d4da23a8@linux-foundation.org>
 <a5992f11-5841-4bbf-b190-b5df41b68b0c@nvidia.com>
 <aOePfeoDuRW+prFq@lstrano-desk.jf.intel.com>
 <20251111154326.bc48466a6962fbbffd8ebdd0@linux-foundation.org>
 <7a0f2704-80b5-4cbd-8f3b-ac03692eefd3@nvidia.com>
 <aR5/uUFboeeSwN0z@lstrano-desk.jf.intel.com>
 <7ecb3faa-8bc7-4eb1-9342-404a9ff52b97@nvidia.com>
 <24d8d39b-5ebe-4f29-93ff-3f7ca2a9b1cc@nvidia.com>
 <aR6HtvxhmVxUvd+h@lstrano-desk.jf.intel.com>
 <e8efd187-237c-47c7-ab99-33183e0988df@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8efd187-237c-47c7-ab99-33183e0988df@nvidia.com>
X-ClientProxiedBy: SJ0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: 198c45a3-ba0e-4e23-4c81-08de27f91b70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eG5hUUpqU1gvdEMyai9ZVU5jUXMrNGZCUi9rMG56UGk4SGZnRHNEanR0N3VJ?=
 =?utf-8?B?d0o4VnVpcExDNWcydzRnVlRTdGhGNTVhTEFFUEVMbnJwTnkvNEhibmpvZHdH?=
 =?utf-8?B?Smx6ZFVkdHBkNDk2WW5lV2QvaXZZWUxDMTdQTWo2ZlJ4ZGVBc25kRnZISmtS?=
 =?utf-8?B?cS8zMzgxd3c1TVZrR3d6SmhaZjd6OSs0VlZhcGJ3TVZ2alJkeUZLd3pMT0lz?=
 =?utf-8?B?R3V4SjFOU1R2dVdBYUNjNHlRdVBza3hvekt2VW5pcHduU3RldU5TTHVnaXY0?=
 =?utf-8?B?V0dmbzFCRTBSQ0Mvc1M2VVJVOHRJZ3hRVWNaVG5yK0pwMjkzVFdsTjQrUGZB?=
 =?utf-8?B?VUg5dzhydFU3RDVOQmxmTjJDK2VwS1dTMFk4RlJwVlZNa1RZWm5lc1hXeW9k?=
 =?utf-8?B?Q2JQeHR1anJQZlRra2IxUUZ4TVIvRTJYaE9ieTZGRXJock95dE1JTE1tNEVh?=
 =?utf-8?B?RUtzRE5hOXl2UEg4YU10akVwc05PMnNZY0wzTEw0NzBzOEtnMDBUaTFCd0FO?=
 =?utf-8?B?OXlIQjIvTTFhMGU0V0czaUtlSDM0eldIQzhpd3BqQnRyN0h6bmFKR2dzbG5v?=
 =?utf-8?B?UHlYL1BLWTVjeWNFKzk1VFkyS2d4cWNsMWhCS3JYc212VFoxWnpGWHZ6NWZJ?=
 =?utf-8?B?OFhUVnRRekpYVDY2RzBVRmZrM2lzZTFoUnRSTC9oQzg1UVpUMHYvdGU3Yjkw?=
 =?utf-8?B?STNQbnlSVVdwdGJLc21pWGtUOHhnM1o2M01STWZIeTdUUnJ4dU9CTW1zNXVy?=
 =?utf-8?B?VEgraEdVN2JSRGhZUWdOTDcybDVTM1dXTmZRb3JKZkwwOG55MExVeXFNRGh1?=
 =?utf-8?B?ZHpHazViSjZmVXF6bzd0MTc1dHZXNDh0YjkzVFVjRWhzTmRtNHNZQTBYVDNq?=
 =?utf-8?B?Tmwzc05oaE53ZzA1TmxicXVpWE8vUmRycW82UUI4RTdUZkdMdWxwUkhpVVJZ?=
 =?utf-8?B?QmRoMThzNkM2ODBIS0xqUmNzRzJ0enJDZ3E2WThsUkVyamtxZGRlbWdrZitS?=
 =?utf-8?B?MUhTU0ErcThRK1lzTlVkVkRpT0M0UlcwbU9uSFJkMGxOOEUvZmQ3emZicDJR?=
 =?utf-8?B?cnVrb0svVXRNdzZUeFJtVml1S3JEL0x1MGV6UkMzTEtudkxHNVl6Nyt5Vm9K?=
 =?utf-8?B?WmNoclRrdkx6LzFVVjFKYlhXVlNBVFdIMHdZRzhFZXEvUXVGOHF5RzZrZ0NG?=
 =?utf-8?B?ckRnUXdCSEE4TnFJb01VUk5aWTViQnRRV2E1UWRPamVya2d2TEJGUWNwWTY5?=
 =?utf-8?B?N0lMNlh6UzUyTytXNDF3MzdXUEYyUmkxZDNVRjA1S3F6SjBNRE01aTlzOWlR?=
 =?utf-8?B?dWRacmgzeE5sQXdQTUMzZlZlK1Y3WE4vRFVEUXNKOFE5bTQ1NFdqN0VGTGtM?=
 =?utf-8?B?eVNjZ2pQSElnS2ozcncxSlVoVXlSMFllV29HcUxRVVVVa1R4dGxhTW5RR0tj?=
 =?utf-8?B?dTBvSlRvMTV1QzRBVXNQcXF5bXlGbWwrUkRnNENBNTY3R0huei9HNHZHUGRI?=
 =?utf-8?B?SGNGSERYZ3VBeGljakp0SGgzbHZqTFArNGlQc0J4VkszKzF6MmVBS2tXMjll?=
 =?utf-8?B?Uk4vSEkybGNGQndTSzZkQTVFRWJNbmtFSlF1UFRVTWFXenZMSWxJUmxLYmww?=
 =?utf-8?B?R2Q3TGlpSWExSzY2eFVBcXRTNzA4NEhtalNzaStUWEJ5TkdrM3B5WnRoZWpy?=
 =?utf-8?B?dmhCRzNsR3NEVXNtcWpqeXZ1M09zc0RhMXpyVVBMUFlpSU9rdnlpZ3FDZEVj?=
 =?utf-8?B?T05LTHEreDZUUm9EajBJTnhjc0Q4a3RLZklxR0piTkg3UXcwd05Pc3JiNFox?=
 =?utf-8?B?R3BManZEamZxeisrZTQrMHFiZkYwak01aFhUUE1KTzdwMmV2Y2UzckxBdER3?=
 =?utf-8?B?bW1nWkhra25DVFhyV21mZ3RycVJlTUFqanlPdXAvZU5PTk5sWS9EWWFiWnN5?=
 =?utf-8?B?WFJmYWpTcnhGeWJzNnE4bisya01Ta25ObC9IMERMOWpiSWUveUo0bG1PVzVT?=
 =?utf-8?B?M2tCUWxNb1VnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmFjeVVtS3YveEh6OVJaUUQyaE85UVA5R0JuVC9yaGk4YTFHNlU0YkRFVEdK?=
 =?utf-8?B?VTZRTXNRaWF0TVI2by9kOW5tTmgxcXA1NENoTkswNTQxWWRjRUZqRzF5SkZB?=
 =?utf-8?B?b2J6VkY0SXYyeUJsbDRWS3N1VGRuM0hLcWZFODg0ZnFtS1g5bVpoMUh5Z1dY?=
 =?utf-8?B?eHRNcXdQK1ZKZld3VlhHUUYxR2dINlp4MXN1RCthOU1scFJUT0FzTmhtdk5p?=
 =?utf-8?B?aWJGUVh6Qk5UYk0zbHg5aDRxQXQ0TGpxeUw4YVJDMjFOSGpyd2V4YlFCRXlS?=
 =?utf-8?B?dXBZQTk0SGgrYnJsTHdrdHRQWlJrcWgyMEtDakozVUk5K0tXUHFiRFhQT3Zz?=
 =?utf-8?B?Vm1OT0pyaVFhdHNTM1UwaWF1TFdVZloveENVR3pmVHMxME1WcS9CcEJYaEsw?=
 =?utf-8?B?WkVIUCtaL29OMWhXd1ZjTng2Q1M2VVdVaHpnakhDOFAycW9ucFM1M2tUVHlV?=
 =?utf-8?B?d2w3RHJMSFdRbjJoT1JiSTZ0T1Zpakh3K1RzV2p2dXBTeTVTMXRkMjNjRG05?=
 =?utf-8?B?aUhhZnRrMDUySlUyN2dyRVkvQStPeDRzV2Q3SVFvK08wVkxJdlBJWnBnYmZJ?=
 =?utf-8?B?N2c2OW04T3NQaEJIY1YwK2JRanpoUmN0bWhCT1JmTXUzKzdCcGpTRmlCV0xE?=
 =?utf-8?B?Y0l6Tm5aQmdqQ1c4M09XdWRXd3lKbEdVQmtrV0VnODl0R2RYYjJUQ29MWGN0?=
 =?utf-8?B?Ly84VG1ldVBZMlNKUE96clUyNnFNZGZEYVdBWnBVdVAzRk41ZFFmQndZaVlD?=
 =?utf-8?B?aWVVY1AzSENUMjJORjhrT0thdnZjalE0MlJtYmozZ0JzNTk5RnNYNFErR1dS?=
 =?utf-8?B?Rk5ENFUzOUpYWlkxUWFZRmVOVExOa1NiajI1NWdmanFzMGY3SEd6d1pBV3Fz?=
 =?utf-8?B?dXBTVjZheGJXNWxCTkxDZmtHcDhpc2VKME44Rks4eG14WjN1T1VUR0NZSkRa?=
 =?utf-8?B?NU5CLzhnV3dXaVZZSC9HK083a2FJdWlZWUY5VVlDa2dpVXdZWXRZSURDSm1H?=
 =?utf-8?B?RXpXN2VONm9ob1pPc3RzZ1ZyL001VzZMNVJQT3p2dWUrWFRCVllLWVBqL1k3?=
 =?utf-8?B?dG9kaXhIdGo5V1M2a2xjRVJiZG16d1FwakRRTk1selZxeVcya3FGdmkybUxs?=
 =?utf-8?B?U1czdGhJTi9paVV3cXM3eTdFVGd3TXNaZGdPWS94SnZLdzIzazNrOFVlbVgx?=
 =?utf-8?B?QVhDSlE1Vjh4YnlVRDZVY2UyWnR2eEIyRlp1WmJ2UmJ0Q2pJUGdjSEgwRFpJ?=
 =?utf-8?B?MHkwSkJUdkdGWSt3U1VzMlZqd09NcUI2NWZjcVJiYWljWUQ3UUpOSWI3UVRl?=
 =?utf-8?B?MnBjaWluamZpdkFIcWxLc3RmVnpqTlA1MmtjemwzYk9TeDkycytyaUQxQWND?=
 =?utf-8?B?M2V4WlduVlV4OGFXRW9kbnBsNVNlNlQ5VUIwbXo5ZU1SNFhyenlnOHJDY0ln?=
 =?utf-8?B?TEM0TTZXa29UZ3lVcnRqN1BOaWNzeHFtVkNFMURkMk1ncjlHaFhZNldMQmhH?=
 =?utf-8?B?bXdjOFYvdVRjSlBsNkNSYzFXTC9nTlNsd1QwSm85YVVURXBhck1jcVFBc1Ns?=
 =?utf-8?B?TWdXT25LZWxFNE11WERtUU1qbDJYVWlBa1RFSjBUN1NIYk9kK0RtbzNSZ0dh?=
 =?utf-8?B?eE5BTFYzL0NzN1dLOFpzOFg5R2RzUS91NEdwM3k3cThPRHd6ajh1S0JzMG5G?=
 =?utf-8?B?bjhsRFpzZUgyaEdsTWlKMVo0c0oyd05DL3d0MEJZYU9UTnN4aTA1Q2pMQmRD?=
 =?utf-8?B?bDB6QTF3cmFPT2lrcmkzL25lNThYTUFZa2N2RitPN0ZQQmtmd1NiREhCcHd5?=
 =?utf-8?B?b1ViSGxkY1dSTWlZaHV5dnJKT3VWTk9TYVRCWld6VTJlV3IxVmdqc2RvUmVv?=
 =?utf-8?B?dUtCeHJrWWpwRi95eS9PeVRkMTBxS3huMjlaaURZeVhRTldWUHl1YUxxNGV5?=
 =?utf-8?B?SGZuN0xYYzNodzRQYzNDc3ZFZzhOSG9qdHorTTVRL0NGSmxrRDFtR3Y3cHNE?=
 =?utf-8?B?QmIwS3RFWFJHa3VmcHhOZFY2TTRlV21mbnI4WTF2UHBDOFN4NytwcnNabW1D?=
 =?utf-8?B?TTBiQXk0WStZWjBJdityRHlUdHdQZmlHSW0wNk9XOEhkUTdkV1pPdmltR1I0?=
 =?utf-8?B?eEc2bnQ4OHNzVEFnbkFuVUVWdk93OHhoUGtIblNLbUF3WVBCcHFzNWF1ZnY5?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 198c45a3-ba0e-4e23-4c81-08de27f91b70
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 05:53:19.5739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+B6stLK2tvGeYsTJSb5OAv/zf6/Q53g9iAYKdeJCtf401ae47gb5U13v0Pdr5fKI4ivJXWGCAWqnAE65NoAig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6622
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

On Thu, Nov 20, 2025 at 02:58:58PM +1100, Balbir Singh wrote:
> On 11/20/25 14:15, Matthew Brost wrote:
> > On Thu, Nov 20, 2025 at 01:59:09PM +1100, Balbir Singh wrote:
> >> On 11/20/25 13:50, Balbir Singh wrote:
> >>> On 11/20/25 13:40, Matthew Brost wrote:
> >>>> On Wed, Nov 12, 2025 at 10:52:43AM +1100, Balbir Singh wrote:
> >>>>> On 11/12/25 10:43, Andrew Morton wrote:
> >>>>>> On Thu, 9 Oct 2025 03:33:33 -0700 Matthew Brost <matthew.brost@intel.com> wrote:
> >>>>>>
> >>>>>>>>>> This patch series introduces support for Transparent Huge Page
> >>>>>>>>>> (THP) migration in zone device-private memory. The implementation enables
> >>>>>>>>>> efficient migration of large folios between system memory and
> >>>>>>>>>> device-private memory
> >>>>>>>>>
> >>>>>>>>> Lots of chatter for the v6 series, but none for v7.  I hope that's a
> >>>>>>>>> good sign.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> I hope so too, I've tried to address the comments in v6.
> >>>>>>>>
> >>>>>>>
> >>>>>>> Circling back to this series, we will itegrate and test this version.
> >>>>>>
> >>>>>> How'd it go?
> >>>>>>
> >>>>
> >>>> My apologies for the delay—I got distracted by other tasks in Xe (my
> >>>> driver) and was out for a bit. Unfortunately, this series breaks
> >>>> something in the existing core MM code for the Xe SVM implementation. I
> >>>> have an extensive test case that hammers on SVM, which fully passes
> >>>> prior to applying this series, but fails randomly with the series
> >>>> applied (to drm-tip-rc6) due to the below kernel lockup.
> >>>>
> >>>> I've tried to trace where the migration PTE gets installed but not
> >>>> removed or isolate a test case which causes this failure but no luck so
> >>>> far. I'll keep digging as I have time.
> >>>>
> >>>> Beyond that, if I enable Xe SVM + THP, it seems to mostly work (though
> >>>> the same issue as above eventually occurs), but I do need two additional
> >>>> core MM patches—one is new code required for Xe, and the other could be
> >>>> considered a bug fix. Those patches can included when Xe merges SVM THP
> >>>> support but we need at least not break Xe SVM before this series merges.
> >>>>
> >>>> Stack trace:
> >>>>
> >>>> INFO: task kworker/u65:2:1642 blocked for more than 30
> >>>> seconds.
> >>>> [  212.624286]       Tainted: G S      W           6.18.0-rc6-xe+ #1719
> >>>> [  212.630561] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> >>>> disables this message.
> >>>> [  212.638285] task:kworker/u65:2   state:D stack:0     pid:1642
> >>>> tgid:1642  ppid:2      task_flags:0x4208060 flags:0x00080000
> >>>> [  212.638288] Workqueue: xe_page_fault_work_queue
> >>>> xe_pagefault_queue_work [xe]
> >>>> [  212.638323] Call Trace:
> >>>> [  212.638324]  <TASK>
> >>>> [  212.638325]  __schedule+0x4b0/0x990
> >>>> [  212.638330]  schedule+0x22/0xd0
> >>>> [  212.638331]  io_schedule+0x41/0x60
> >>>> [  212.638333]  migration_entry_wait_on_locked+0x1d8/0x2d0
> >>>> [  212.638336]  ? __pfx_wake_page_function+0x10/0x10
> >>>> [  212.638339]  migration_entry_wait+0xd2/0xe0
> >>>> [  212.638341]  hmm_vma_walk_pmd+0x7c9/0x8d0
> >>>> [  212.638343]  walk_pgd_range+0x51d/0xa40
> >>>> [  212.638345]  __walk_page_range+0x75/0x1e0
> >>>> [  212.638347]  walk_page_range_mm+0x138/0x1f0
> >>>> [  212.638349]  hmm_range_fault+0x59/0xa0
> >>>> [  212.638351]  drm_gpusvm_get_pages+0x194/0x7b0 [drm_gpusvm_helper]
> >>>> [  212.638354]  drm_gpusvm_range_get_pages+0x2d/0x40 [drm_gpusvm_helper]
> >>>> [  212.638355]  __xe_svm_handle_pagefault+0x259/0x900 [xe]
> >>>> [  212.638375]  ? update_load_avg+0x7f/0x6c0
> >>>> [  212.638377]  ? update_curr+0x13d/0x170
> >>>> [  212.638379]  xe_svm_handle_pagefault+0x37/0x90 [xe]
> >>>> [  212.638396]  xe_pagefault_queue_work+0x2da/0x3c0 [xe]
> >>>> [  212.638420]  process_one_work+0x16e/0x2e0
> >>>> [  212.638422]  worker_thread+0x284/0x410
> >>>> [  212.638423]  ? __pfx_worker_thread+0x10/0x10
> >>>> [  212.638425]  kthread+0xec/0x210
> >>>> [  212.638427]  ? __pfx_kthread+0x10/0x10
> >>>> [  212.638428]  ? __pfx_kthread+0x10/0x10
> >>>> [  212.638430]  ret_from_fork+0xbd/0x100
> >>>> [  212.638433]  ? __pfx_kthread+0x10/0x10
> >>>> [  212.638434]  ret_from_fork_asm+0x1a/0x30
> >>>> [  212.638436]  </TASK>
> >>>>
> >>>
> >>> Hi, Matt
> >>>
> >>> Thanks for the report, two questions
> >>>
> >>> 1. Are you using mm/mm-unstable, we've got some fixes in there (including fixes to remove_migration_pmd())
> > 
> > remove_migration_pmd - This is a PTE migration entry.
> > 
> 
> I don't have your symbols, I thought we were hitting, the following condition in the walk
> 
> 	if (thp_migration_supported() && pmd_is_migration_entry(pmd)) {
> 
> But sounds like you are not, PMD/THP has not been enabled in this case
> 

No, migration_entry_wait rather than pmd_migration_entry_wait.

> 
> >>>    - Generally a left behind migration entry is a symptom of a failed migration that did not clean up
> >>>      after itself.
> > 
> > I'm on drm-tip as I generally need the latest version of my driver
> > because of the speed we move at.
> > 
> > Yes, I agree it looks like somehow a migration PTE is not getting
> > properly removed.
> > 
> > I'm happy to cherry pick any patches that you think might be helpful
> > into my tree.
> > 
> 
> Could you try the mm/mm-new tree with the current xe driver?
>

Unfortunately, this is a tough one. We land a lot of patches in Xe/DRM,
so bringing the driver up to date with an MM branch is difficult, and
I’m not an expert at merging branches. It would be nice if, in the DRM
flow, we could merge patches from outside our subsystem into a
bleeding-edge kernel for the things we typically care about—but we’d
need a maintainer to sign up for that.

> In general, w.r.t failure, I would check for the following
> 
> 1. Are the dst_pfns in migrate_vma_pages() setup correctly by the device driver?
> 2. Any failures in folio_migrate_mapping()?
> 3. In migrate_vma_finalize() check to see if remove_migration_ptes() failed
> 
> If (3) fails that will explain the left over migration entries
> 

Good tips, but think I got it via biscet.

Offending patch is:

'mm/migrate_device: handle partially mapped folios during collection'

The failing test case involves some remap-related issue. It’s a
parameterized test, so I honestly couldn’t tell you exactly what it’s
doing beyond the fact that it seems nonsensical but stresses remap. I
thought commit '66d81853fa3d selftests/mm/hmm-tests: partial unmap,
mremap and anon_write tests' would catch this, but it looks like I need
to make the remap HMM test cases a bit more robust—similar to my
driver-side tests. I can take an action item to follow up on this.

Good news, I can tell you how to fix this...

In 'mm/migrate_device: handle partially mapped folios during collection': 

109 +#if 0
110 +                       folio = page ? page_folio(page) : NULL;
111 +                       if (folio && folio_test_large(folio)) {
112 +                               int ret;
113 +
114 +                               pte_unmap_unlock(ptep, ptl);
115 +                               ret = migrate_vma_split_folio(folio,
116 +								  migrate->fault_page);
117 +
118 +                               if (ret) {
119 +                                       ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
120 +                                       goto next;
121 +                               }
122 +
123 +                               addr = start;
124 +                               goto again;
125 +                       }
126 +#endif

You can probably just delete this and use my patch below, but if you
want to try fixing it with a quick look: if migrate_vma_split_folio
fails, you probably need to collect a hole. On success, you likely want
to continue executing the remainder of the loop. I can try playing with
this tomorrow, but it’s late here.

I had privately sent you a version of this patch as a fix for Xe, and
this one seems to work:

[PATCH] mm/migrate: Split THP found in middle of PMD during page collection

The migrate layer is not coded to handle a THP found in the middle of a
PMD. This can occur if a user manipulates mappings with mremap(). If a
THP is found mid-PMD during page collection, split it.

Cc: Balbir Singh <balbirs@nvidia.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 mm/migrate_device.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index abd9f6850db6..9ffc025bad50 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -65,6 +65,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
        struct vm_area_struct *vma = walk->vma;
        struct mm_struct *mm = vma->vm_mm;
        unsigned long addr = start, unmapped = 0;
+       struct folio *split_folio = NULL;
        spinlock_t *ptl;
        pte_t *ptep;

@@ -107,10 +108,11 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
                }
        }

-       ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
+       ptep = pte_offset_map_lock(mm, pmdp, start, &ptl);
        if (!ptep)
                goto again;
        arch_enter_lazy_mmu_mode();
+       ptep += (addr - start) / PAGE_SIZE;

        for (; addr < end; addr += PAGE_SIZE, ptep++) {
                struct dev_pagemap *pgmap;
@@ -209,6 +211,11 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
                        bool anon_exclusive;
                        pte_t swp_pte;

+                       if (folio_order(folio)) {
+                               split_folio = folio;
+                               goto split;
+                       }
+
                        flush_cache_page(vma, addr, pte_pfn(pte));
                        anon_exclusive = folio_test_anon(folio) &&
                                          PageAnonExclusive(page);
@@ -287,8 +294,34 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
        if (unmapped)
                flush_tlb_range(walk->vma, start, end);

+split:
        arch_leave_lazy_mmu_mode();
-       pte_unmap_unlock(ptep - 1, ptl);
+       pte_unmap_unlock(ptep - 1 + !!split_folio, ptl);
+
+       /*
+        * XXX: No clean way to support higher-order folios that don't match PMD
+        * boundaries for now — split them instead. Once mTHP support lands, add
+        * proper support for this case.
+        *
+        * The test, which exposed this as problematic, remapped (memremap) a
+        * large folio to an unaligned address, resulting in the folio being
+        * found in the middle of the PTEs. The requested number of pages was
+        * less than the folio size. Likely to be handled gracefully by upper
+        * layers eventually, but not yet.
+        */
+       if (split_folio) {
+               int ret;
+
+               ret = split_folio(split_folio);
+               if (fault_folio != split_folio)
+                       folio_unlock(split_folio);
+               folio_put(split_folio);
+               if (ret)
+                       return migrate_vma_collect_skip(addr, end, walk);
+
+               split_folio = NULL;
+               goto again;
+       }

        return 0;
 }

If I apply the #if 0 change along with my patch above (plus one core
MM patch needed for Xe that adds a support function), Xe SVM fully
passes our test cases with both THP enabled and disabled.

> >>> 2. The stack trace is from hmm_range_fault(), not something that this code touches.
> >>>
> > 
> > Agree this is a symptom of the above issue.
> > 
> >>> The stack trace shows your code is seeing a migration entry and waiting on it.
> >>> Can you please provide a reproducer for the issue? In the form of a test in hmm-tests.c
> >>>
> > 
> > That will be my plan. Right now I'm opening my test up which runs 1000s
> > of variations of SVM tests and the test that hangs is not consistent.
> > Some of these are threaded or multi-process so it might possibly be a
> > timing issue which could be hard to reproduce in hmm-tests.c. I'll do my
> > best here.
> > 
> >>> Have you been able to bisect the issue?
> >>
> > 
> > That is my next step along with isolating a test case.
> > 
> >> Also could you please try with 10b9feee2d0d ("mm/hmm: populate PFNs from PMD swap entry")
> >> reverted?
> >>
> > 
> > I can try but I highly doubt this is related. The hanging HMM code in is
> > PTE walk step after this, also I am not even enabling THP device pages
> > in my SVM code to reproduce this.
> > 
> 
> Thanks, do regular hmm-tests pass for you in that setup/environment?
> 

Yes. As noted above, I need to make the remap HMM case a bit more
robust. I’ll try to get to this before the Thanksgiving break in the US
(next Thursday-Friday).

Matt

> Balbir
> 
> > Matt
> > 
> >>>
> >>> Balbir
> >>>
> >>>
> >>>> Matt 
> >>>>
> >>>>>> Balbir, what's the status here?  It's been a month and this series
> >>>>>> still has a "needs a new version" feeling to it.  If so, very soon
> >>>>>> please.
> >>>>>>
> >>>>>
> >>>>> I don't think this needs a new revision, I've been testing frequently
> >>>>> at my end to see if I can catch any regressions. I have a patch update for
> >>>>> mm-migrate_device-add-thp-splitting-during-migration.patch, it can be applied
> >>>>> on top or I can send a new version of the patch. I was waiting
> >>>>> on any feedback before I sent the patch out, but I'll do it now.
> >>>>>
> >>>>>> TODOs which I have noted are
> >>>>>>
> >>>>>> https://lkml.kernel.org/r/aOePfeoDuRW+prFq@lstrano-desk.jf.intel.com
> >>>>>
> >>>>> This was a clarification on the HMM patch mentioned in the changelog
> >>>>>
> >>>>>> https://lkml.kernel.org/r/CABzRoyZZ8QLF5PSeDCVxgcnQmF9kFQ3RZdNq0Deik3o9OrK+BQ@mail.gmail.com
> >>>>>
> >>>>> That's a minor comment on not using a temporary declaration, I don't think we need it, let me know if you feel strongly
> >>>>>
> >>>>>> https://lkml.kernel.org/r/D2A4B724-E5EF-46D3-9D3F-EBAD9B22371E@nvidia.com
> >>>>>
> >>>>> I have a patch for this, which I posted, I can do an update and resend it if required (the one mentioned above)
> >>>>>
> >>>>>> https://lkml.kernel.org/r/62073ca1-5bb6-49e8-b8d4-447c5e0e582e@
> >>>>>>
> >>>>>
> >>>>> I can't seem to open this
> >>>>>
> >>>>>> plus a general re-read of the
> >>>>>> mm-migrate_device-add-thp-splitting-during-migration.patch review
> >>>>>> discussion.
> >>>>>>
> >>>>> That's the patch I have
> >>>>>
> >>>>> Thanks for following up
> >>>>> Balbir
> >>>
> >>
> 
