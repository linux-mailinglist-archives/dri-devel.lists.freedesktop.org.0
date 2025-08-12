Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44996B21E26
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 08:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EF210E0AD;
	Tue, 12 Aug 2025 06:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OVKS/JR7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB0910E0AD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 06:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754979528; x=1786515528;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6vQ+Afk0ElLNabOyAhLd3xno5sb0zF1ZHSChP4tgumE=;
 b=OVKS/JR7b6iTXVBA0LBKXFTC9TW5W6GyLB3rbyGCpuHAVVLji5YqGMhH
 YBpCqRaAnOZnti9/lk+xlfAD3O2JhobWr7JofB1P+ghXgurfHlirZGLm5
 RO7WUap8Slxasn6ehQ4/rt/DUwtR1A3JcgmsEbIl0D73H56i7M66qopKc
 dAb7oR6JkR9Sxxj+YlFNsqGSWUuO1T1dR9qZBer8zRvZqqbITdkUyldyw
 IUq0pVfs/8L388lXF2VyN5CiGJudAobAU3FRz08WqBMP2Qn8pmEeUovtK
 +/wlHRxMX9pCD9Rq4SXUOSGHtIlCik2sDjhhRuK5U90oIZC3yXG7GHGUD A==;
X-CSE-ConnectionGUID: O9RcbmvsTbGXV86L4zX9sg==
X-CSE-MsgGUID: oHgQx50iTzGiIutu7OmSVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68618524"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="68618524"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 23:18:45 -0700
X-CSE-ConnectionGUID: Z7wFvNX3RW+kretjh7BCRg==
X-CSE-MsgGUID: 1WUiRDlFTQmRNARwOkOI6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="170314218"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 23:18:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 23:18:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 23:18:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 11 Aug 2025 23:18:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uoQ6mBVpZL3pH8klfvsHQGS410X30M9LnsdWbtNgIAoQ5aQHb8cm4VRdO9WrdNLiD/Ibat9yG+nbPK4ItnGsv8Mvj6x6J1rHGc6dw7yrHsemFWwXBRhQGHm41uBsUGAh24ZrJb/ngAJR7P7rM3GgLuj8NLPGXWsD3VaQRzm7KB9m634mmD89ldW5pHl51u6UNVPPmveqNoU2+VKjwRjAKucMtLTBI4CMtFv5PSoj1GwBk5L2lvUXCX826HbcodHKaDr8OUQsj0AV6xBQSCyP00uYCKQh3xfvoXTE+RzZfz0zPZUeXrSRSNfGYmsjw/Oop6U8GSpONj6qpBU8UjwKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEAR/Fc1G+FN3qYNvablhu/Z445AwkULthuCQznI8oQ=;
 b=RAZCP9rVwHKGByJ7G+JT5wv6JDSq/VHLoBZ2oALvSmtbUMWZEiKRcAr1Sj2ICs8AyFc7E3iTibV8A/XUaF4QbfRGwgqUVn40PwamD9D5vHHDuSKrT7XWEnDKfSl9ZUqeIcmgziImeviSczfB+1OOCbXvN5L4PKDx1DMeuzM8vN2M6pm+5VrlM8C0c9Q/JezJYJkvsJ7II7Ag8xjWChxyF/XlpSkhOnbhQIOrP+sJD/a23LV+VZpMHUi1B5uzOJi6dMTft023qLdAUr8YUy9dA4k8O6JbfIya0GE7fNokBGC4D35oIa8tIQ6U9D1VK71IpMdpFqoN4ZqOs+zM6o8mvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6844.namprd11.prod.outlook.com (2603:10b6:930:5f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 06:18:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 06:18:41 +0000
Date: Mon, 11 Aug 2025 23:18:38 -0700
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
Message-ID: <aJrcvpx5tiSKD88x@lstrano-desk.jf.intel.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
 <20250812024036.690064-4-balbirs@nvidia.com>
 <81ca37d5-b1ff-46de-8dcc-b222af350c77@redhat.com>
 <aJrW/JUBhdlL2Kur@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJrW/JUBhdlL2Kur@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:a03:333::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6844:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a16db5-baeb-4798-12ff-08ddd9681535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVI2UGFEVW82NC8vTnd6VVBmdERkUVB0NnpwOHpMbmwrSUhXcExNTHIweTds?=
 =?utf-8?B?Y3VLUmhNMmNrcldkMUdJNFM1eGxXWFd5LzNUVmluWlhuQWpDaUtYV2ROaU9y?=
 =?utf-8?B?bm5waGNhRDZ1a01pdDZSMlFMS3ovZ1lLSmsrL2hYOGFrNnRNWjhvTDhST2hD?=
 =?utf-8?B?RFNBZFBMMXZSVVE2OThDdk4zT2ZyaDhEdENUdzJFMFduU3hQYnYwSDZPNEpr?=
 =?utf-8?B?THU4bTBGTkFBRTFZY202MmR6a1dRR05BOXl3M3VvR0xpVE1renBwaUI5endQ?=
 =?utf-8?B?WTRCcFJEVDQzYTBiaEFTM0NVR1BBWUMxVlhuTE5jOThwYUtlU1grUk5tZDhO?=
 =?utf-8?B?TnJwNGFKK3oyak90YUhjR1RpUjRoSFlQYmNvM1cwZm1PQzI0T3ZwVlZEMnB0?=
 =?utf-8?B?Qjh6Wk9wUkozZlF0ajEySUlMdjZtMEk0eTNVMkwzdXpud201NDExajBIMGhF?=
 =?utf-8?B?c1VnK1p4d2laM2c4TmpoR08zOUlSUFVkRXJjOGRJUW1uYW1weVl5c1g1TmVM?=
 =?utf-8?B?b3A1elpIMEJLajR3OWphbmxONTZaU0gzaU1oNlFIb3lrcnhrUThDS0RSNVl5?=
 =?utf-8?B?ZWNQSGtIUyswMzlxU0QwSlVKTmJ3SGZ3aVZuRGhYeGlmckM2RUp5YzNTSzFt?=
 =?utf-8?B?c2dCbWtOakdPSmVzb2J6bWtUV3pDMzFDNmhtMkNnbjdyT0pKYmFlRUpYamFL?=
 =?utf-8?B?a2pzejEvakNScnFpc2VRQk1Sem4yV2dWR1FQZXN1OFRQck1ldThVdWxjKzdU?=
 =?utf-8?B?T2xML1hJNncrcWh0RXE4WjM0NXlPTXc5ODBtRWlHdWQxVEhKSWJMV2IvWjQr?=
 =?utf-8?B?N1ZjQjltZlAzSE1jblgxUGNuamJVZmZnWm4yL3NTMWxnd0NEMU00bzRlbHdk?=
 =?utf-8?B?bEtlUmtPcStZd3lER0UwYnJ2bWlDZ1RNZEZGSmxFNmNpUmRaSmwzWTEwMS9Y?=
 =?utf-8?B?ZFRqWW5aT3dBdGJWOG4wTGZWRmNiTjRqYi9kV2RMb04yeU9qS1g0RTRBK1Vi?=
 =?utf-8?B?aTNpTnQ5NTVBekl4Q1ZEdHJyYURXYytWb25MNHhPME81SGpBc0NUMGZtVkVV?=
 =?utf-8?B?OVJ5NnJMa0pnVlVmWjZya0grL3BCQlNQZmRkRXBqeWRFaTdXSGFZbEllRFor?=
 =?utf-8?B?aGpPdDZ4aWljeXBmY0NLYzErTEV0enozNlEvL0pBUTk0MVpYOWdSRXl2MXhQ?=
 =?utf-8?B?Q3VacVlNRWtQaWRNVGZWSHM0ekp2SWx0UTJZZ2gvQXBLZ1Uybk9pRERZaERM?=
 =?utf-8?B?T0V3UmlmNzZCUGphcHdpNkFzSi9sbG9HNmhBZHBkbEo3Tlg5Y0F6d3gzNlhF?=
 =?utf-8?B?aWZvemttZGNUS0Z2MVdYbEFCY2lGVFJYUzVDcEVteTdDMytIbGkvZ1MvR1Ji?=
 =?utf-8?B?STJXbmpVSElwVUhCUnB2dEtzcXVwSklOd3hjVmtnS0pEUnlKU0ovTlZlc0ky?=
 =?utf-8?B?RmdyVEhQK3ZkdHpRUnV6b1J5WVpUcGlibHd6elJlc0s0c3JGTVRWWkxjNlFE?=
 =?utf-8?B?SzlHUXlmWXEzWnRqdHhBdXBoSTBld2VtYlh1ams4b2F2aUl6QWY0R1ZEWWtP?=
 =?utf-8?B?NytHOEpWRHBQcDBONmxLbnFmd1p0ZmFBQkFITUhZT3U1TW5SdkN2VzhsV0M3?=
 =?utf-8?B?WFNPcnNiM0lYQzdMa3cvd0ljbzRSVTlQY3BuZ1RUSHRRekhOampnanRBQ3ho?=
 =?utf-8?B?ZjE4SGFlWmpXY1JQWHM5Y1ljSVI3ZjlnandvbklPUTUzNWUwTERIOE1TbHJj?=
 =?utf-8?B?VC9uKzFxaWN0cGlmTWtkVlJ4M1h2WDJuVlpGUzkvN0FvSXlsQlQ0MjNCMysz?=
 =?utf-8?B?dE50S04rSGoxTnNLOUFxd0hCOWtCTHk5YldUWmRlWXJGNG0yeVg2OVBPeHRx?=
 =?utf-8?B?cnJDZG9DeHoydWI3MWl1bWV2elJtN0wxbTBONVNkZGFYa3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nnd2NWVycDhlc2NZZklrUU5DaXkwNEs3MTJMOENxM1pDTXNGN1RVZzVtbi9p?=
 =?utf-8?B?RjdnTDMySTRZUGFxMzZiRHNWVXk5VDNJZTlOL0JFbFhVc29tZTN5K3RpdVAw?=
 =?utf-8?B?ZzlDa2F4ZlV6OE12cFpKM1EzcXVRKzYyUWxUemFHVW92R1FvMndEdEV5WDds?=
 =?utf-8?B?TWd6ZTFJYSt6M1BpRTJSTUxnTzlMV280cStPSDYzMzBReDNmWTg4RGt2V2Ra?=
 =?utf-8?B?UFFMMnhWaktNbXd4cXNsSGZrZi9taVFVOFpzUXFHQThlN01EcTcvc1ZjVytE?=
 =?utf-8?B?L3VraVN2bm83WDN2cUFzcHVLNXpBRFBWMytPTml5QmRvYk92VUNZQWNMcVVh?=
 =?utf-8?B?OFMyR3liZDgvY0swWmpyZ1lPUExZNngzMm83eTVaVjcrOEtkYkxvSGFkYnZF?=
 =?utf-8?B?enlCb05WWk1QU0RnenQwSGhqVWhqRGFZK1BzaVBQTlBUbk9UeUVibHZqRlB0?=
 =?utf-8?B?VVBBWk5MYXpBT2NVZ1oveis3cFB3TnRqOWVsUmx0OTBzY0VnL1dVQllDUVlh?=
 =?utf-8?B?WThMZDdVbWJZS2tFc3c2MVRGejlhM0Jmek9TOFE2eSs2bThOR3hoT0NKNXVM?=
 =?utf-8?B?VERkOWlMNUgxemFweDhqRkFxaVdXL3YyZFhZVzJwdnNqaXk5ZCswekFtQlUw?=
 =?utf-8?B?SkRiU25nb202ajdKNlhsNFpjN2tscnZQdlhYOEVXbTIrWko2Q0ZNZzNWbjdl?=
 =?utf-8?B?MFIrUlRnaXlBVjdRNFU5bUtKbmNZVWJjdXBNaGFKV1B4UDkySmYxa1QyWUtS?=
 =?utf-8?B?QUU3RU9rcmhiR01jdWpaTHdMYjhHRmk3TG5ibC9xTXlJbXM4OGFHZHNOVGts?=
 =?utf-8?B?UXRlenU4cmp4Mmg1Wm1Ba05qSW5YZk80K0hNelVHN25kaEh4YUVGWDM0STRt?=
 =?utf-8?B?T1k4eVlKVGw3aC83Q2xkRFh1UUlJcDZrUzZNaGhobGZGMExRTHZ6akhzeTR5?=
 =?utf-8?B?RURNWFFXQ0RKMC9qYmlVaTJNK0ZzZkR3akJ2K0dDUWZxWEVLQk5CSVNXMzBj?=
 =?utf-8?B?emJVK2lOK3Jldld4VkV6Mm5yYmRIdXhzck5pMUlrbVNkU0pXUTZpeFpJTllS?=
 =?utf-8?B?WW1EdHVYME13QnhySldkMnFuQVprenBJbHh1NlVMb3pEbHduVUwyeW1DcFE3?=
 =?utf-8?B?Mys2WkZOMXNIU3hPTFVUVzFpT2crN3c1N3JBNStPejRBekZBVmFzaWI2UGhn?=
 =?utf-8?B?WEREVnZOUk5QeDVkSU9jeTJqRTc3QVcxUXFBZkJXVC9Ud1ExekhqSU5EbnRW?=
 =?utf-8?B?bFBYbnpGNyswTXgyOGdKa1JOdS9ydU0xdytLazgvOUl1OW5RYzk1eldKNVVj?=
 =?utf-8?B?VWJZcFBEK213UC9wbWJudUkxVnFudlRwK0hhVEdzSG1jYmJGOE1PcTRLakRi?=
 =?utf-8?B?SisvQUFrbmsreHl5cHlOK3p4TG1ObGVoUk9mMkdScjFXZ3BBSTMxV29UNVBj?=
 =?utf-8?B?RnJWZHVVU1VyQXFmYy94VWVlbXNncTcySGc1anlqK2RMcmk0c3M4cTE4NUc0?=
 =?utf-8?B?ajNNMlBRbC9IMWpIUml6S0tPMzdKbXB1d1plN0JESGMrWnExc3FWbW0wd1JO?=
 =?utf-8?B?Qm45YnVSUjRMcEhaQkYrYzhjSlRscm5iY1JjVVJhWEg3YU1BdjNmYUV2M0Z3?=
 =?utf-8?B?MXc1K3g1WTRicTNQTFYrWkwyOXU3VlNuZmdadjVwU25DblRPTGNJU1JtVzNk?=
 =?utf-8?B?WXowNGs5UElMUUlxb1IycUtIa1VkNVFYRVhQa21pY2dkY012NkN0WGg5SUNH?=
 =?utf-8?B?aU1MQjFlSFVBMFdHdytjYzF2cmprNUVmTDhCM0dEejJneDQ4ZjVscVpRWndu?=
 =?utf-8?B?bW9TMWJzTVhjQmt4d0M5bWZlSHRrdHI0azArL2pMMXA4aFY1My9GV0tMcit2?=
 =?utf-8?B?eFJzbURZMkNqUkxqOFB1MXZ0YnlOcGhnZEJmVEdJUVNyckgrMnE1cG9ueEpT?=
 =?utf-8?B?YWt2NlVkNlNlenNqdFVieDNCODg2QWgyQ0Y0Z3dkaUdBSm94MDF0MTdQaVg1?=
 =?utf-8?B?a0lKMnpOVGtzeVFWNzllQlY5V3haWnlyQzQ1WVhsRGJjcGozWkFxNmtHNXlM?=
 =?utf-8?B?RGdDRThnY3VOMVRJeDNRTGlXbkdCc2w5T25GRDIyNmMrMEk2YWdzTE9hbUlm?=
 =?utf-8?B?V1pHdUM1ck8wRGZIWWdRRWQrbDB3M2t1NHo5Y0ZleE1lWTVndzFOYWdZZ2xL?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a16db5-baeb-4798-12ff-08ddd9681535
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 06:18:41.4782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aO274BzJUOISzkQRjDStdbexKaNF15DT3/+VEHVOiaMx8Fi7iVKfFw1XSZkdaZavG4Rr3oTyfTg6DfuoTG0gNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6844
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

On Mon, Aug 11, 2025 at 10:54:04PM -0700, Matthew Brost wrote:
> On Tue, Aug 12, 2025 at 08:35:49AM +0300, Mika Penttilä wrote:
> > Hi,
> > 
> > On 8/12/25 05:40, Balbir Singh wrote:
> > 
> > > MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
> > > migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
> > > device pages as compound pages during device pfn migration.
> > >
> > > migrate_device code paths go through the collect, setup
> > > and finalize phases of migration.
> > >
> > > The entries in src and dst arrays passed to these functions still
> > > remain at a PAGE_SIZE granularity. When a compound page is passed,
> > > the first entry has the PFN along with MIGRATE_PFN_COMPOUND
> > > and other flags set (MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the
> > > remaining entries (HPAGE_PMD_NR - 1) are filled with 0's. This
> > > representation allows for the compound page to be split into smaller
> > > page sizes.
> > >
> > > migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP
> > > page aware. Two new helper functions migrate_vma_collect_huge_pmd()
> > > and migrate_vma_insert_huge_pmd_page() have been added.
> > >
> > > migrate_vma_collect_huge_pmd() can collect THP pages, but if for
> > > some reason this fails, there is fallback support to split the folio
> > > and migrate it.
> > >
> > > migrate_vma_insert_huge_pmd_page() closely follows the logic of
> > > migrate_vma_insert_page()
> > >
> > > Support for splitting pages as needed for migration will follow in
> > > later patches in this series.
> > >
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Cc: David Hildenbrand <david@redhat.com>
> > > Cc: Zi Yan <ziy@nvidia.com>
> > > Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> > > Cc: Rakie Kim <rakie.kim@sk.com>
> > > Cc: Byungchul Park <byungchul@sk.com>
> > > Cc: Gregory Price <gourry@gourry.net>
> > > Cc: Ying Huang <ying.huang@linux.alibaba.com>
> > > Cc: Alistair Popple <apopple@nvidia.com>
> > > Cc: Oscar Salvador <osalvador@suse.de>
> > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > > Cc: Nico Pache <npache@redhat.com>
> > > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > > Cc: Dev Jain <dev.jain@arm.com>
> > > Cc: Barry Song <baohua@kernel.org>
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Simona Vetter <simona@ffwll.ch>
> > > Cc: Ralph Campbell <rcampbell@nvidia.com>
> > > Cc: Mika Penttilä <mpenttil@redhat.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > >
> > > Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> > > ---
> > >  include/linux/migrate.h |   2 +
> > >  mm/migrate_device.c     | 457 ++++++++++++++++++++++++++++++++++------
> > >  2 files changed, 396 insertions(+), 63 deletions(-)
> > >
> > > diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> > > index acadd41e0b5c..d9cef0819f91 100644
> > > --- a/include/linux/migrate.h
> > > +++ b/include/linux/migrate.h
> > > @@ -129,6 +129,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
> > >  #define MIGRATE_PFN_VALID	(1UL << 0)
> > >  #define MIGRATE_PFN_MIGRATE	(1UL << 1)
> > >  #define MIGRATE_PFN_WRITE	(1UL << 3)
> > > +#define MIGRATE_PFN_COMPOUND	(1UL << 4)
> > >  #define MIGRATE_PFN_SHIFT	6
> > >  
> > >  static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
> > > @@ -147,6 +148,7 @@ enum migrate_vma_direction {
> > >  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
> > >  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
> > >  	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
> > > +	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
> > >  };
> > >  
> > >  struct migrate_vma {
> > > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > > index 0ed337f94fcd..6621bba62710 100644
> > > --- a/mm/migrate_device.c
> > > +++ b/mm/migrate_device.c
> > > @@ -14,6 +14,7 @@
> > >  #include <linux/pagewalk.h>
> > >  #include <linux/rmap.h>
> > >  #include <linux/swapops.h>
> > > +#include <asm/pgalloc.h>
> > >  #include <asm/tlbflush.h>
> > >  #include "internal.h"
> > >  
> > > @@ -44,6 +45,23 @@ static int migrate_vma_collect_hole(unsigned long start,
> > >  	if (!vma_is_anonymous(walk->vma))
> > >  		return migrate_vma_collect_skip(start, end, walk);
> > >  
> > > +	if (thp_migration_supported() &&
> > > +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
> > > +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
> > > +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
> > > +		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE |
> > > +						MIGRATE_PFN_COMPOUND;
> > > +		migrate->dst[migrate->npages] = 0;
> > > +		migrate->npages++;
> > > +		migrate->cpages++;
> > > +
> > > +		/*
> > > +		 * Collect the remaining entries as holes, in case we
> > > +		 * need to split later
> > > +		 */
> > > +		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
> > > +	}
> > > +
> > >  	for (addr = start; addr < end; addr += PAGE_SIZE) {
> > >  		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE;
> > >  		migrate->dst[migrate->npages] = 0;
> > > @@ -54,57 +72,151 @@ static int migrate_vma_collect_hole(unsigned long start,
> > >  	return 0;
> > >  }
> > >  
> > > -static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > > -				   unsigned long start,
> > > -				   unsigned long end,
> > > -				   struct mm_walk *walk)
> > > +/**
> > > + * migrate_vma_collect_huge_pmd - collect THP pages without splitting the
> > > + * folio for device private pages.
> > > + * @pmdp: pointer to pmd entry
> > > + * @start: start address of the range for migration
> > > + * @end: end address of the range for migration
> > > + * @walk: mm_walk callback structure
> > > + *
> > > + * Collect the huge pmd entry at @pmdp for migration and set the
> > > + * MIGRATE_PFN_COMPOUND flag in the migrate src entry to indicate that
> > > + * migration will occur at HPAGE_PMD granularity
> > > + */
> > > +static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
> > > +					unsigned long end, struct mm_walk *walk,
> > > +					struct folio *fault_folio)
> > >  {
> > > +	struct mm_struct *mm = walk->mm;
> > > +	struct folio *folio;
> > >  	struct migrate_vma *migrate = walk->private;
> > > -	struct folio *fault_folio = migrate->fault_page ?
> > > -		page_folio(migrate->fault_page) : NULL;
> > > -	struct vm_area_struct *vma = walk->vma;
> > > -	struct mm_struct *mm = vma->vm_mm;
> > > -	unsigned long addr = start, unmapped = 0;
> > >  	spinlock_t *ptl;
> > > -	pte_t *ptep;
> > > +	swp_entry_t entry;
> > > +	int ret;
> > > +	unsigned long write = 0;
> > >  
> > > -again:
> > > -	if (pmd_none(*pmdp))
> > > +	ptl = pmd_lock(mm, pmdp);
> > > +	if (pmd_none(*pmdp)) {
> > > +		spin_unlock(ptl);
> > >  		return migrate_vma_collect_hole(start, end, -1, walk);
> > > +	}
> > >  
> > >  	if (pmd_trans_huge(*pmdp)) {
> > > -		struct folio *folio;
> > > -
> > > -		ptl = pmd_lock(mm, pmdp);
> > > -		if (unlikely(!pmd_trans_huge(*pmdp))) {
> > > +		if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
> > >  			spin_unlock(ptl);
> > > -			goto again;
> > > +			return migrate_vma_collect_skip(start, end, walk);
> > >  		}
> > >  
> > >  		folio = pmd_folio(*pmdp);
> > >  		if (is_huge_zero_folio(folio)) {
> > >  			spin_unlock(ptl);
> > > -			split_huge_pmd(vma, pmdp, addr);
> > > -		} else {
> > > -			int ret;
> > > +			return migrate_vma_collect_hole(start, end, -1, walk);
> > > +		}
> > > +		if (pmd_write(*pmdp))
> > > +			write = MIGRATE_PFN_WRITE;
> > > +	} else if (!pmd_present(*pmdp)) {
> > > +		entry = pmd_to_swp_entry(*pmdp);
> > > +		folio = pfn_swap_entry_folio(entry);
> > > +
> > > +		if (!is_device_private_entry(entry) ||
> > > +			!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
> > > +			(folio->pgmap->owner != migrate->pgmap_owner)) {
> > > +			spin_unlock(ptl);
> > > +			return migrate_vma_collect_skip(start, end, walk);
> > > +		}
> > >  
> > > -			folio_get(folio);
> > > +		if (is_migration_entry(entry)) {
> > > +			migration_entry_wait_on_locked(entry, ptl);
> > >  			spin_unlock(ptl);
> > > -			/* FIXME: we don't expect THP for fault_folio */
> > > -			if (WARN_ON_ONCE(fault_folio == folio))
> > > -				return migrate_vma_collect_skip(start, end,
> > > -								walk);
> > > -			if (unlikely(!folio_trylock(folio)))
> > > -				return migrate_vma_collect_skip(start, end,
> > > -								walk);
> > > -			ret = split_folio(folio);
> > > -			if (fault_folio != folio)
> > > -				folio_unlock(folio);
> > > -			folio_put(folio);
> > > -			if (ret)
> > > -				return migrate_vma_collect_skip(start, end,
> > > -								walk);
> > > +			return -EAGAIN;
> > >  		}
> > > +
> > > +		if (is_writable_device_private_entry(entry))
> > > +			write = MIGRATE_PFN_WRITE;
> > > +	} else {
> > > +		spin_unlock(ptl);
> > > +		return -EAGAIN;
> > > +	}
> > > +
> > > +	folio_get(folio);
> > > +	if (folio != fault_folio && unlikely(!folio_trylock(folio))) {
> > > +		spin_unlock(ptl);
> > > +		folio_put(folio);
> > > +		return migrate_vma_collect_skip(start, end, walk);
> > > +	}
> > > +
> > > +	if (thp_migration_supported() &&
> > > +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
> > > +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
> > > +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
> > > +
> > > +		struct page_vma_mapped_walk pvmw = {
> > > +			.ptl = ptl,
> > > +			.address = start,
> > > +			.pmd = pmdp,
> > > +			.vma = walk->vma,
> > > +		};
> > > +
> > > +		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
> > > +
> > > +		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
> > > +						| MIGRATE_PFN_MIGRATE
> > > +						| MIGRATE_PFN_COMPOUND;
> > > +		migrate->dst[migrate->npages++] = 0;
> > > +		migrate->cpages++;
> > > +		ret = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
> > > +		if (ret) {
> > > +			migrate->npages--;
> > > +			migrate->cpages--;
> > > +			migrate->src[migrate->npages] = 0;
> > > +			migrate->dst[migrate->npages] = 0;
> > > +			goto fallback;
> > > +		}
> > > +		migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
> > > +		spin_unlock(ptl);
> > > +		return 0;
> > > +	}
> > > +
> > > +fallback:
> > > +	spin_unlock(ptl);
> > > +	if (!folio_test_large(folio))
> > > +		goto done;
> > > +	ret = split_folio(folio);
> > > +	if (fault_folio != folio)
> > > +		folio_unlock(folio);
> > > +	folio_put(folio);
> > > +	if (ret)
> > > +		return migrate_vma_collect_skip(start, end, walk);
> > > +	if (pmd_none(pmdp_get_lockless(pmdp)))
> > > +		return migrate_vma_collect_hole(start, end, -1, walk);
> > > +
> > > +done:
> > > +	return -ENOENT;
> > > +}
> > > +
> > > +static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > > +				   unsigned long start,
> > > +				   unsigned long end,
> > > +				   struct mm_walk *walk)
> > > +{
> > > +	struct migrate_vma *migrate = walk->private;
> > > +	struct vm_area_struct *vma = walk->vma;
> > > +	struct mm_struct *mm = vma->vm_mm;
> > > +	unsigned long addr = start, unmapped = 0;
> > > +	spinlock_t *ptl;
> > > +	struct folio *fault_folio = migrate->fault_page ?
> > > +		page_folio(migrate->fault_page) : NULL;
> > > +	pte_t *ptep;
> > > +
> > > +again:
> > > +	if (pmd_trans_huge(*pmdp) || !pmd_present(*pmdp)) {
> > > +		int ret = migrate_vma_collect_huge_pmd(pmdp, start, end, walk, fault_folio);
> > > +
> > > +		if (ret == -EAGAIN)
> > > +			goto again;
> > > +		if (ret == 0)
> > > +			return 0;
> > >  	}
> > >  
> > >  	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> > > @@ -222,8 +334,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > >  			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
> > >  		}
> > >  
> > > -		/* FIXME support THP */
> > > -		if (!page || !page->mapping || PageTransCompound(page)) {
> > > +		if (!page || !page->mapping) {
> > >  			mpfn = 0;
> > >  			goto next;
> > >  		}
> > > @@ -394,14 +505,6 @@ static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
> > >  	 */
> > >  	int extra = 1 + (page == fault_page);
> > >  
> > > -	/*
> > > -	 * FIXME support THP (transparent huge page), it is bit more complex to
> > > -	 * check them than regular pages, because they can be mapped with a pmd
> > > -	 * or with a pte (split pte mapping).
> > > -	 */
> > > -	if (folio_test_large(folio))
> > > -		return false;
> > > -
> > 
> > You cannot remove this check unless support normal mTHP folios migrate to device, 
> > which I think this series doesn't do, but maybe should?

I also agree that, eventually, what I detail below (collecting mTHP or
THPs in PTEs) should be supported without a split, albeit enabled by a
different migrate_vma_direction flag than introduced in this series.

Reasoning for a differnet flag: Handling of mTHP/THP at the upper layers
(drivers) will have to adjusted if the THP doesn't align to a PMD.
Fairly mirror but upper layer should maintain control if they want
non-aligned mTHP/THP to PMDs collected.

I also just noticed an interface problem — migrate_vma does not define
flags as migrate_vma_direction, but I digress.

Matt

> > 
> 
> Currently, mTHP should be split upon collection, right? The only way a
> THP should be collected is if it directly maps to a PMD. If a THP or
> mTHP is found in PTEs (i.e., in migrate_vma_collect_pmd outside of
> migrate_vma_collect_huge_pmd), it should be split there. I sent this
> logic to Balbir privately, but it appears to have been omitted.
> 
> I’m quite sure this missing split is actually an upstream bug, but it
> has been suppressed by PMDs being split upon device fault. I have a test
> that performs a ton of complete mremap—nonsense no one would normally
> do, but which should work—that exposed this. I can rebase on this series
> and see if the bug appears, or try the same nonsense without the device
> faulting first and splitting the pages, to trigger the bug.
> 
> Matt
> 
> > --Mika
> > 
