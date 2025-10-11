Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC1CBCFB78
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E9B10E10D;
	Sat, 11 Oct 2025 19:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7MnbPyV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F9210E0EF;
 Sat, 11 Oct 2025 19:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211626; x=1791747626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=k9MOGXt63CKO9/BsnZPewbPUQktkACC+LTqhrjD/Noo=;
 b=G7MnbPyVC2kw/LwzQXSfzTo2D4bJ5zFM4E6FCVsmMnML8pwLGeCRLuRE
 yq7kCKHlHrSrsGZLSfjR22P45fqR6KumscOaCDty6dcxBpBDwCmZvC2qo
 vkjysoXTCFol2LPY8Yz/Tpojb3uYZfGZUEA1wSonnKe037yP3RRU45eCa
 +0c7cPDVGJ2bKdYuO5sDmfHMTfiAayRxCT0T/WpoLzUsZpOYZG7HeReE2
 ezAcsK5k6ni84yx5ProuYV137ecapbJl+e4CTyEf6J4WYmCZ5PXPOfmk8
 MXcHCk8cN5Z9oVg1XyUWhBpAse5VcEqe6FPlQsWp7TMHZIAs9Nhrqn58S Q==;
X-CSE-ConnectionGUID: 6xChsdgvS0SAsDyNTn3kmw==
X-CSE-MsgGUID: UZDG68WFQh6EKUCRcjN3iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="61431527"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="61431527"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:40:26 -0700
X-CSE-ConnectionGUID: Wo0cM7ZESL2FfDPEJYLnZw==
X-CSE-MsgGUID: FM/EDzXuROy3Y7323Quk4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="212202585"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:40:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:40:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:40:25 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:40:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShdcR2Ucd5KItiwvKVxwsE3NG8wAF3g1kz4NoM8KLQ3u2ZPuMEdNe68DtcqzfLn/SzxkZg/p3nX09vwCb/BFGmJJhYpk6YYcbL3cCxCzpe2+4qQE3ibgrRrT9eRqNEL61DSald/U7aflc1+Cd+tSaAM0b5BM6AcsMrffROJRGBzx9UivO68QGIx7cC9EIl+RafBUbQDneNAi3vYROfcM1RX53jB14Z9hN8Nfe78Qm9Q5J2J1NpKafh2nRRxc3W/j8+NvvdAPix8AG0emmpM3KOb6qG+nHBXUejQwWafi9FZm6YN5l7dUP8yw+kJDJfuSUhsBlEs+gKzO1E9RdXt2BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtAc8H3WfZlqIjJa2DAUdMKrvZqUXlm0OKlqQxLptwc=;
 b=YAUueMQchJgV2Gh1PV2dGgqA+XUO0A6D8gZ2XjaaFhjHehEoTjApaWc7H+tLZxV5gZfcWDxV9nAvyk2/9KlaSp8J6/HC4XK4iXQXx4tMwp7XKUxOzu0//0g6NSIKwhhsmgtefmSIcDClHUwieLApnIE3Z2+dw/CLPSuGzXfNMf6bvEpG2HaOradVc1uv+Pw94CxQKTT5YVDbvSsSU75ciicIuaV8OdfZbB2a4JhShpBWofWkKBG9H2ssjyB/SkXMCvsxQZSDq8zzTBhJaq1RoXHgg6qcpOvqZgq/XiH/K1ux1VbJPHaxIaWE+cN091LMhHdqIh97gt8+y/7hDFZlLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 19:40:22 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:40:22 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 02/26] drm/xe: Move migration support to device-level struct
Date: Sat, 11 Oct 2025 21:38:23 +0200
Message-ID: <20251011193847.1836454-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0037.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: f82deca6-8a2a-4f7a-7852-08de08fe048b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zk95cmExNWFiMXlVMG5WcHR5VHI3ODYxTTdqSnpUbDR4cVgxMXBwWFY0NkNa?=
 =?utf-8?B?YW5ZNVVXLzJraDUxMlpScFJEZEFZa0s5SE43OHVPdDhHSVh6MDhmMERLajNp?=
 =?utf-8?B?Y21JRUkzWHRvYmsreElaRjdDRkhGbmlxL2ZraXpRYzY4L2lBRUQ0M3JBUHdk?=
 =?utf-8?B?ZW1RMmxiZTFxV3g4ZzJlSEtrYnA0aU5uMk1FOEJTS2ZmeUxQRjlCcjFjc1Bl?=
 =?utf-8?B?TlVlSmVwYzNmWXN0UDZhY3pzY3grL1Q2U3ZCZFZ4SGNjWnBrNlA1TzNDN2Q4?=
 =?utf-8?B?WHN6ZlVleVY0eE9MMmkxL0s1UEM4L2x1c1VHNVU0N1BCRTJOTGUyamdKSHRF?=
 =?utf-8?B?Wi9XSGpLMTdTMEtiUWloa0pKREY1Y0M3L3JXMGJxcGhqNHFCZW9JTXhUUjZD?=
 =?utf-8?B?czRkRmlGQkZoTUtpL0tKU2EyVlZ2U2NzVndkdWxlUERIZXRGT2ltNTVxR1VS?=
 =?utf-8?B?bHliRWZ0MDFRa0RTbHE3eUtLTjc2L1g0NXZqbU1GWlIzSWJsL1pRQkVXd2hq?=
 =?utf-8?B?RXJTSitPQ3JMRXJTNXRkOWxBMDhIN2tjN0svaEovUnVKeWNvNVdaRHJuRDIv?=
 =?utf-8?B?dU8wMTRNTGc1amFubDFtK3RaMnJJMG1PNmR4YjNCcFpyQTFheWI3b1NLeHpx?=
 =?utf-8?B?N2JOQ1Z6WlNGM2NST0w2aWlPSmE4SW5NSE9XVUxEclpEVGVRNE9ub2luV2N5?=
 =?utf-8?B?amhqVXVNdWQ5SGt1RnZzK3JEb2JuMitHV0Y3MS95TUw0SUlLcE9ocGU0Vkd1?=
 =?utf-8?B?WHB3NGY5L3lDaERXZkVsdHVMM1UvLzJjVTFXaTFYR2RPdlR5MTk5cUlCRy9U?=
 =?utf-8?B?dk1mbkk1Y25rSVZOaXAyNXFaWDd2ZFc1bngxdHZCQm9pZVJNcUhMTjM0VENo?=
 =?utf-8?B?OU5nSjFRTFFwZXU3TGxTVG9ucGh6K1h4RlZ5dlJtWUlKL09Ja0E1QXE3MWxj?=
 =?utf-8?B?TzR3NGNEbzNGVUx5OSsrcmhLWndvdjFaelVsUHZTUTVac3UyM0NweThSNjFB?=
 =?utf-8?B?UnR2aUFhTUpsazdxSG9rNGc2ZzhyZ0N3ZVM2dnkxd1VyaUw2OVhnYUdaZjFL?=
 =?utf-8?B?Qm94UHpFbzhQRWhwUUJFcFpuQS9oZnNQckc0K2xYZnBBMklieVdFaFFFc3Nx?=
 =?utf-8?B?Z05aYVpwUHg4UmovekFsdWZlWmFrRnJ1ZXhUVExoa2RBR2oyZVczdjhkekZa?=
 =?utf-8?B?RVkyTVVXbCtabUplYUVPcTVqdDNtT2ZYSkwvcThZYy9NSnc4NGppeXFUcG9H?=
 =?utf-8?B?a0FMWEJLc05NZVlpblFmVHRmajE3dVJIc25OeGN5YzZIc212SkZvZDF1Qk9p?=
 =?utf-8?B?VWV0dkVHYnRPd2dteDZJR0xIdmpqZHkzOWFQR3didWM3RWlxbk9WQWQzbFpL?=
 =?utf-8?B?eFNLdFJxZFVaalIvQ0FlQlZIWnFiRk56K2ltNXpqd2ZNSFR4NGc2VUx4ZFRJ?=
 =?utf-8?B?eTkrMVhObUI5NW8xU3JxdXUreUxoZnFQdnJ1UjN4VjlsT3lRY3EwdnN5bUx3?=
 =?utf-8?B?ZHg1U2ovMGtyU3Q1elQvMWxoT0NoSGVYN3c0UHFrMnU3V3JDZUFyNXVhd1ND?=
 =?utf-8?B?c0FrU05xdHFvRTNuNDNReFk3Mk1IaUl6S0tmY3JnanFoc2NIb0VjVUNNa3o1?=
 =?utf-8?B?MnF5WTZzRmZ3T2NiakxiaDNQR3F1MUg2WWhuVFR3WWhXaUE4Q2p3Y1AzQ0Zq?=
 =?utf-8?B?YjRPUG1ERFU4NmNja2JHMDFYa3BFVzI3UU81NkU0RXZHVTM0L0E2TSs5ZkpR?=
 =?utf-8?B?WDA3TzNmenlDSElLcWZLWXJwSjB3aXFsbVRIMkF2RlNzNEpMbVlMa0hlTWNF?=
 =?utf-8?B?MEhvT3plMlZwV1NnMEVYNDRoSTlmRG5JVFJ2RExsRnQzekZ4akdrVXlneUFt?=
 =?utf-8?B?My9yZkpIblJEV1l1cHkyTDBzZ3FtMm1HT1Myc2pVajEvdm1nQTAxYWVZWmZS?=
 =?utf-8?B?VndWVzJubmdMUlRNWFJ6UjFXcUhoWUpDdkZkRWFMaUUrTXREUnpxVjBSSVlp?=
 =?utf-8?Q?p8SErXYgxG1kF0MfalFdcayyQKkpNU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGVOdzZYTjVpOTlkUWF0dG5NMVFzdXdWUUZXa1VhS0NsN21PWWhSWmNPSm03?=
 =?utf-8?B?bmNYQ25xbFNBVGkvRndDR3VSemY1eE1wOXpzSWZQYmZCZHEyUkRVNDFXczBK?=
 =?utf-8?B?V3UzejNqMUIxT3dFczRGd0pjQmo5Y1lTd1VzbHhPTEptOElUT2FFL05sNUZE?=
 =?utf-8?B?VEVMd1c1NEl5M2dtb0M2MDlybG1GWTArTWsyS2JCNEZRVVcwaURlcE95bmpL?=
 =?utf-8?B?b2tsL2wrbnBpMVQzaG1qN3NpRzhySFVDc0dISU9iNkRIV0hkNkVVYTBlRFdj?=
 =?utf-8?B?U1Roalp5SElNT0wwbW1FTHIxUkR4Qy9nbzAwc0NUbTFaaG5jd1ppQ1FZaDZy?=
 =?utf-8?B?YkZoVFlHanZldDJVYXJGMkpFUkg4Qk9pVHVUSDQ1MlA3QWpBdFhYc0RxUnIy?=
 =?utf-8?B?WDdqKzBUdk1zbDBvUkNYdUtsckN2ZHFTbEpFT0t2Uk53MUhyK3JwNm1OSzNv?=
 =?utf-8?B?eWczeXB4eFBsclBlZG1weFVUWTUzakd3eHFjVmJxVmRSTll5MkEwYkVaQngw?=
 =?utf-8?B?a1ZMVWJUK2QxZGdIcy9zcTVNZEFqU1VnWHJwaWVjMXpmdU9hQXdrb3BtenE3?=
 =?utf-8?B?MzYrWnVUbkxFTUd4STVxclhVK3FmK21qenI0dmp2S2MwYTZHNUlWK0VQVnhG?=
 =?utf-8?B?dG1FdDVTMU5tb0ZNRUxwSkVXc1dEeThpWnF5VXVEQkp4bnVzT2lvbHVxck5C?=
 =?utf-8?B?WmpaOTZCb3BGMmhZWG1BRC9ONnRsd3VyQS9RZ0JwNlVOT3NBQ216eEJsRmVl?=
 =?utf-8?B?VmphOGptdGg2R1laWGxLSnp1U1ZjWE41YUE1SzVoNlN6YzdhNzYvWjZBUXlr?=
 =?utf-8?B?WnR0aGVTeTRjM3FxWGw1RytjNUVSajZwb3RYNWFkRXpleFJNelVvSnYwb0x0?=
 =?utf-8?B?SlFSOG9KNjNJd0pkcHNOUGVyRittdTJwYXFRNmtNQnBZNElES0NxNERmakxD?=
 =?utf-8?B?b1F2U2xpR0h1QWY3Y0FZMGhkUFo4RTNnWmxaNWk2YUhDVHZHdlQ2aHdVTDJY?=
 =?utf-8?B?d3N3aWI2emQ0Mm56QTV3RWRicFBjb1ZRd3NpcFNNTzVTempVMEJzMmJuOEdK?=
 =?utf-8?B?VUJQazk1NHJUQ2ZoaFNTMUdwTDZMWVY1Yjk1YjdZWmhrUWphbldmUjVQQThJ?=
 =?utf-8?B?MGZjU2ZYVy9UMWNZdFdRU0ZjVXg1RXUwdG0rc2t4eHM1L29GdHltdjBuTlhG?=
 =?utf-8?B?NmpLaktvMUllZi9JSldxNEZaeW9wSHIyYmc4MklxYkZRSzRlSXFNK3U0OVh5?=
 =?utf-8?B?N1RhODU0UFg4M1BNVmdKczM2UWhyTjQycjhuOS9tbjZ3RUZITE1vbWZhMkZx?=
 =?utf-8?B?Ynk1ckU2RVk3U3Fkc3dIOGVLSlNoazRKcGl0Wm1HVS9hOVd5ZTJlQVpJYjE2?=
 =?utf-8?B?NkpQYjJ1UmhGNGYzYkpDdDI3VnZxc3c5VVR2WlhVb21tMUdUUUdZWER0RUdP?=
 =?utf-8?B?OFBSeWpOcmVnU2dIczgzZHdscXM0OWR2OFFSbnRRQ2NrODk3ZnBnZHlQYzRt?=
 =?utf-8?B?RUtyclRib2h1UkNBYnVGY1hacG1wZ3lqS08xb2p6Y1lQdHFpcDJYRGE5cisr?=
 =?utf-8?B?bEpORUtBUzdFdGFUaDBHZTRRMW1xdjlZV0lvNkQ0QVgxemo2bDE2cGJFaG1I?=
 =?utf-8?B?cW1JQklGWDdneVBkVkl0M1Zyd1lmaVZxRnZVTTB0Q1hNbmxvZi92eGZCYU9K?=
 =?utf-8?B?QzZ5dlcrZ2FBbytlbXczRnRIU2ZsUmNMR2wxSzFQUjFGVFRzTklyVnhBMEk1?=
 =?utf-8?B?UTFIaG94TEplcG1NR0hEb1Vwc0M3aDNmUWtqdnNOaUpIOTRCUjByYldFb1Ix?=
 =?utf-8?B?Y0RNdlBLdXpQalVZWkFSMzAxcFJUc1lGMndiM2xZWFdaVUlKMXFHcEZWbW9h?=
 =?utf-8?B?QnZVZktMbmtkbHZ2SVlFa20wNkZxUHRxVEVIL0J4d2E0SkVEMXEwYXRyOGhv?=
 =?utf-8?B?VWF2N2JGWTNFamVSWG1ZRlo3Ujl1ZEEzUDBKU0lYcFhqS0dEOWVyZnR3UlZM?=
 =?utf-8?B?NTU4V3JLZVBiQ2dReUlkVHh0b1A5aVBESVJJNm96eUIydXpZdzFNQmdOMDZ3?=
 =?utf-8?B?dlZxTzU4OTZQR21PRW9NRXdaNThxdVRtMVI4R1F0MnZGVmhjc3drSjB1QXRR?=
 =?utf-8?B?anJvWk8xazlYNndUM0lHMDNOT3BVVm5EdnQvTDc3anFTNCswUjZsa1ZITlpy?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f82deca6-8a2a-4f7a-7852-08de08fe048b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:40:22.5730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxzhO0CmZyweBwLeNtkyTsUHFrSUOhSkKKnIoZ2ilJgMpSZo5VScr8pWt1UfJtCPvy0oJ+qvfrAYv1wYFfM8hIbvcXZ+VWOj9KnZHqkdWjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
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

Upcoming changes will allow users to control VF state and obtain its
migration data with a device-level granularity (not tile/gt).
Change the data structures to reflect that and move the GT-level
migration init to happen after device-level init.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 12 +-----
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  3 --
 drivers/gpu/drm/xe/xe_sriov_pf.c              |  5 +++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 43 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    | 27 ++++++++++++
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  0
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  5 +++
 8 files changed, 83 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 84321fad32658..71f685a315dca 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -176,6 +176,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_sriov_pf.o \
 	xe_sriov_pf_control.o \
 	xe_sriov_pf_debugfs.o \
+	xe_sriov_pf_migration.o \
 	xe_sriov_pf_service.o \
 	xe_tile_sriov_pf_debugfs.o
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index a5bf327ef8889..ca28f45aaf481 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -13,6 +13,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf_migration.h"
 
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
@@ -115,8 +116,7 @@ static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
 
 static bool pf_migration_supported(struct xe_gt *gt)
 {
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	return gt->sriov.pf.migration.supported;
+	return xe_sriov_pf_migration_supported(gt_to_xe(gt));
 }
 
 static struct mutex *pf_migration_mutex(struct xe_gt *gt)
@@ -382,12 +382,6 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 }
 #endif /* CONFIG_DEBUG_FS */
 
-static bool pf_check_migration_support(struct xe_gt *gt)
-{
-	/* XXX: for now this is for feature enabling only */
-	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
-}
-
 /**
  * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
  * @gt: the &xe_gt
@@ -403,8 +397,6 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_PF(xe));
 
-	gt->sriov.pf.migration.supported = pf_check_migration_support(gt);
-
 	if (!pf_migration_supported(gt))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 1f3110b6d44fa..9d672feac5f04 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -30,9 +30,6 @@ struct xe_gt_sriov_state_snapshot {
  * Used by the PF driver to maintain non-VF specific per-GT data.
  */
 struct xe_gt_sriov_pf_migration {
-	/** @supported: indicates whether the feature is supported */
-	bool supported;
-
 	/** @snapshot_lock: protects all VFs snapshots */
 	struct mutex snapshot_lock;
 };
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index bc1ab9ee31d92..95743c7af8050 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -15,6 +15,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_sriov_printk.h"
 
@@ -101,6 +102,10 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_sriov_pf_migration_init(xe);
+	if (err)
+		return err;
+
 	xe_sriov_pf_service_init(xe);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
new file mode 100644
index 0000000000000..cf6a210d5597a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_sriov.h"
+#include "xe_sriov_pf_migration.h"
+
+/**
+ * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
+ * @xe: the &struct xe_device
+ *
+ * Return: true if migration is supported, false otherwise
+ */
+bool xe_sriov_pf_migration_supported(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	return xe->sriov.pf.migration.supported;
+}
+
+static bool pf_check_migration_support(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	/* XXX: for now this is for feature enabling only */
+	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
+}
+
+/**
+ * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
+ * @xe: the &struct xe_device
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_migration_init(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
new file mode 100644
index 0000000000000..d3058b6682192
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_MIGRATION_H_
+#define _XE_SRIOV_PF_MIGRATION_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+
+#ifdef CONFIG_PCI_IOV
+int xe_sriov_pf_migration_init(struct xe_device *xe);
+bool xe_sriov_pf_migration_supported(struct xe_device *xe);
+#else
+static inline int xe_sriov_pf_migration_init(struct xe_device *xe)
+{
+	return 0;
+}
+static inline bool xe_sriov_pf_migration_supported(struct xe_device *xe)
+{
+	return false;
+}
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
new file mode 100644
index 0000000000000..e69de29bb2d1d
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
index 956a88f9f213d..2d2fcc0a2f258 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -32,6 +32,11 @@ struct xe_device_pf {
 	/** @driver_max_vfs: Maximum number of VFs supported by the driver. */
 	u16 driver_max_vfs;
 
+	struct {
+		/** @migration.supported: indicates whether VF migration feature is supported */
+		bool supported;
+	} migration;
+
 	/** @master_lock: protects all VFs configurations across GTs */
 	struct mutex master_lock;
 
-- 
2.50.1

