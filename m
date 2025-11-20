Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA93C75A95
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 18:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9563110E7A0;
	Thu, 20 Nov 2025 17:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EzZU2mUu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C769110E7A8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 17:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763659662; x=1795195662;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1vQOBix1q8q+7acNk5kJVGYV20r2ZTW39EG1fKIFlyw=;
 b=EzZU2mUuif65LWNWEHVX8lpAQMDSZPtWp8asTcerXlnvGFPHija4Vyi3
 2Yi3VbZMDvNNDQoNnOBFHajzruwsUVR5CQ3nQvLjqN076xbGZtbzbml5N
 fm+CAFkaybd9hX4BD6s+x7FjJR63WCeKt69mp4Y3RaAmD3jwrkmlmr5HL
 O1Gx57pRZkk2DRN02+WpRCZ0lXVMJeS3fkIra4wPYT1CIoMtUAVGqg68K
 t6FdAGWmMsMvWFEly08Roa5ys11CqBpeKOkDagPQzqb3d4Gt9PozEY6+a
 vSxVAMYGM0VOiPr2SJ7Lv+MYrX5KbxLKwBVaWZmz8oO4L+baviPxPD6QP A==;
X-CSE-ConnectionGUID: TMeB11KwQV6bzCQZKazn0w==
X-CSE-MsgGUID: DWERvKQiQzijWaxxfsNb/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65768277"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65768277"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 09:27:41 -0800
X-CSE-ConnectionGUID: flTyXRNLRrihy9nEVBStsA==
X-CSE-MsgGUID: +LFtsuPMSSCtFWVLTviUcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="195729469"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 09:27:40 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 09:27:40 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 09:27:40 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 09:27:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MlULLQB8MVe57FBKoDRfo5gR8CgO7dMnfziFJpah5QqG/ql/rB9C47htf8QO7e3lzS78PbhP7ausqhGsyiusvrVilClD+f9GujSmeHMTt/TEeVypSRUUXcTU0QTCHktpsBxsE6cWWDySacwbLgVb0Ol/k7o+hdaNORVD6ba5a4FFemi0Q/Tjcew7jRzpwM+L950ncnHs2kzZBaqQLCzRXMTt3Z/B5o4NHGv4L00T4+O29BO1ZYoV2ryYz3jq0HZCC2DE4bB7LGSGcHoNqhKQijNkMBOXqtM/iTFO9sNPg9F1QPAdMR5ZDOkdL+oG/JU/66gHS+QxMVCpQdiIVozMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSZ40ALWmUiKkKVbq/AAtJBclwJe781DZi9y9oTiPgU=;
 b=vh4yKEY1rxWfwrnwtSCn5/wfoxNMzU4Wpc4w0Q/CulRDeEGU9eoNinyGJaIgaGzL6XPNrVwWBP7dzPf14a3RB9y75UP8JVqCEU7jHSKcfa84MqIX6UjzKRmo7tLjNmDx+bfh0VGYkdUuAK2EvAiida+RnWYXWmj4PijmRKPNRfRHWENlaSdyQam+D0XtGX+ecp2rqLpno151JCq1bZ3KUcyVHwMk/PdJK+PxKVmx346ztvvxMVaUUsE0RpFD1qGe549VGlsXX7VBHgE09gxuSHAIyWmUKsXC43emlPHvdOWpjZrDy5TfA7AfkAa4nruujZujQcnCbzJOmXx68fy2sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7321.namprd11.prod.outlook.com (2603:10b6:610:150::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 17:27:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 17:27:37 +0000
Date: Thu, 20 Nov 2025 09:27:34 -0800
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
Message-ID: <aR9Phl4tsMHHJJwI@lstrano-desk.jf.intel.com>
References: <aOePfeoDuRW+prFq@lstrano-desk.jf.intel.com>
 <20251111154326.bc48466a6962fbbffd8ebdd0@linux-foundation.org>
 <7a0f2704-80b5-4cbd-8f3b-ac03692eefd3@nvidia.com>
 <aR5/uUFboeeSwN0z@lstrano-desk.jf.intel.com>
 <7ecb3faa-8bc7-4eb1-9342-404a9ff52b97@nvidia.com>
 <24d8d39b-5ebe-4f29-93ff-3f7ca2a9b1cc@nvidia.com>
 <aR6HtvxhmVxUvd+h@lstrano-desk.jf.intel.com>
 <e8efd187-237c-47c7-ab99-33183e0988df@nvidia.com>
 <aR6szF6Ga8K2ZRjR@lstrano-desk.jf.intel.com>
 <aac2caec-0909-40ef-978e-97fdb34e1937@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aac2caec-0909-40ef-978e-97fdb34e1937@nvidia.com>
X-ClientProxiedBy: BYAPR01CA0055.prod.exchangelabs.com (2603:10b6:a03:94::32)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d3aaef-3b7e-4c97-5d97-08de285a1967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2I5Y2Noc05hVXZZaXk1SWhGM05NUU9wUDFHdk56Z1N6ZnFDMDFjYnBFNzhV?=
 =?utf-8?B?NW5Hd09nSFlwdGMwRzNSUStKYThqSXVGSGZiTUFNcGtTUUNteStJM2FtdjVl?=
 =?utf-8?B?WFpSWS9yU2F5SzB2Z2NERThuTjBydjVhQ2k5KzBtejNRTDU4VldMYmsyRDk1?=
 =?utf-8?B?SUM1dDhiNUxSYVJZWmI2OTdobG1Lb3poaGVJa3RKNDRHT1FHeVhZcTg3R1BZ?=
 =?utf-8?B?dzRTV2J0Y2JkMWpCeFRxcVVQRGdKY1k5dmdoRzF3WnlpQUo0emtqN0JKMkF2?=
 =?utf-8?B?Y3MwcGRHanppYlFkbjA1cDdwb25oazB5Sk4zVlBFMlRha25nODA4VXNQK1pV?=
 =?utf-8?B?bEVCQjIxbm9WWjJvb2hNY1UxREYxMkNuc0pOSSs2UHBJMHo2dFhWelcrUERj?=
 =?utf-8?B?ZVFiRGJrR1plVzRDVzkrQkd2L21ydlJ6RE9yTWtTbjBhektkSzNYMEJwbk5r?=
 =?utf-8?B?WEpHRmhXd1VRcSs1ckJLY3EwUlBuWlRrT200Z1ZmZEVCSUNXanlESFJWVXFF?=
 =?utf-8?B?NXBZRGlMbHBQMUNJdTViWEMvdUxvZzZTelJtTEF5Sndmc2hpeFhRV2pQYXBT?=
 =?utf-8?B?TmFYaTVsb3dLS0t0YWhoYk80cnFFZDFZckM0R2t1bzhOSlpkbHhqR2QxR0JR?=
 =?utf-8?B?VllVa1lQOTdzWk9jczlJMzhPVVpXR21ydWVUbStxRFdLekx5RzdkZ1pRY3I2?=
 =?utf-8?B?NHZzVjVyTGJYamNWTTkzZE5jeU5kU2VNazBLRUlqc2EvY3VmRldlbThpczlD?=
 =?utf-8?B?MVFkS2xYS0hrS2J1cTFjS0w1RGpSWDRSMURBbDIydnpqUHRhbHhmWUFKakk1?=
 =?utf-8?B?VFJReHVRSjBIYmZURC90R2FBeElFQVp0V1RQN3hsV1BJbm1KY1o3MWNyT3JW?=
 =?utf-8?B?V0JjRVpoL0s2THFmdVRtOUdmeUUvcGlTak82R1FGdWtCYjFET0U4eUkyNm5a?=
 =?utf-8?B?QWlrQjgxOXRqNUpHRzdjRzRxb2hVU2Z0NStKUW9PUkg5SnFkaEFBcU1ISjdJ?=
 =?utf-8?B?VUhFY1hqZSsxTG1GZGxydzRnQjhpZFlialZtTWNkL29vTUl3bk9UL0VScDRu?=
 =?utf-8?B?d0QzT1ZHaU5UZW1CWXduN2I0RmRBSG50UDFNUTdvUjVuODhuTldxbmtiOWxX?=
 =?utf-8?B?VEEzK0cyRTlPSVphZEZ2U0JjcDZvaGdhc1ZYRXBqMm5YczZvTDFQYmd0ZGxp?=
 =?utf-8?B?ZkxYQnhwekdUUEhPbVRUYkk4YTJSaFRBS25kNUlJZzhaVTJ1dlJKKzZsM0Ju?=
 =?utf-8?B?Q054d3lzeWxkWnZPRXhZNm1WWlM5RWZ0V0RvV1NMQm05Y1BMaUZ5SzR5UVpi?=
 =?utf-8?B?dDhweUw0YnhqWm5SYjZ3dnJqZmdkR1JzclMxQnZWT1l6U1lrMVFRM2gyenhI?=
 =?utf-8?B?eS9UbzNuU2RNeXV5b3BrU2pHd0ozcnlQRTltSksyeFIxVEpDM1dVejYxWEw3?=
 =?utf-8?B?U0ZkUlZTeE1RcGVWUUxoazFRc2JaQW9oelFGY2xCUGFDZkF3d2txTDczN1k0?=
 =?utf-8?B?S3FTSFI3QXNXa3p6YnRUZGJYUVVCUUM4dEJ5WkdkT000ckl0NnQzVkdlVjZN?=
 =?utf-8?B?Q0hOUTQ5RldSZXFPTTFXeWZ5dW5iKzNhWnhXT0lqdjZSVXdiUmlkQlJ2U2VW?=
 =?utf-8?B?Nk0wU28ydXB3cnRuNzhKeDRIcUpMQlZ3NGovczU1clUvSjAvS0svUTk1TzJ3?=
 =?utf-8?B?RkhvVEt4bFN3bit2MjJ4WXBHYkhaTnR6bHZNdlh3Vlk2eXA4MkRxUi9icnJ0?=
 =?utf-8?B?SFlyTDVnN3ZCYVo4YXp4bDIwRUFtUHBydXJuOCszaDhFQ3JvSnV3Q1ExV3Bs?=
 =?utf-8?B?dENrK0s0TDlBZ3EvNE12MFkvK3grbDUxUVYxVmlrSjlGZkJhSmFSdjRkUlNP?=
 =?utf-8?B?ZFBvZkNWaGxmbFd3MG5uWWtNZmo1TjlFN3E1R1lacWN3eHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVEwclFEYnFmcTdwRXczbEs3L3A1Z21yVkhIN2g2NGM2RVpYalNVbUFkSFZ4?=
 =?utf-8?B?c1RIeTB0TlN1REtZRTlIV1RtMzNhQnJxT28yNXBWcGM3SVVuNTUxOGJrUzNG?=
 =?utf-8?B?c0Zaci9hcDMwQXpnc2J1dDFKVzRZVXF3MGJkMFJJNlFsZWJXdUZXUTlhbDln?=
 =?utf-8?B?WlBhTER5cDJ6TGR4bWJYREFvNmJPb3A0WWxlaWJuNjh2UzdZNXhMUU1YS3Yx?=
 =?utf-8?B?MXRkV256YWp4SFhYQ1VtU0l6L0RtdGZiNGxndnF4ZUpORWoxRmd4K0ZOYXRr?=
 =?utf-8?B?RnA3dGVkVU1QRGhCOUtJOUhvU2pjeEsySVJjVzg4WTlDTllqWWkzZUhjRnU4?=
 =?utf-8?B?ZnBiTzJWQStxQUh4WHF1NUZHdDNxNGhpc1JNR04zN1ZiaktJbVpadXpjcFpp?=
 =?utf-8?B?MVZoNWcyTktDRGZoZjJnYTBQTmFHSklHZERnM3RxYmg4TWRlMWdqcXVNMUJW?=
 =?utf-8?B?WkJuQ0Vubm53bVlGbis5WUk3bkVxZlJLVHlyU2RNY0RGaEE0ZDAyYytPQyt3?=
 =?utf-8?B?d1dueDFQSE5EcytSSDVxd1NOYm1oU29CejVWRU1zb3p0bUFBR0xic3FuNGRI?=
 =?utf-8?B?aWVXc2psUVJOaWZoMElmVUJ0cUQ5VEFWMkl6SUlRMEpTY3Frb0crQ1J3TjlF?=
 =?utf-8?B?NXdWR3FLN211aEFRRzJ1K1M1MWxmLzhIZ1JDZXA1WGRYcDFldnZ2WTJsNmJW?=
 =?utf-8?B?cTJNSkNZQ1dKYUxYakljdnNBWm9CbmcrWVh6SmlqM2RoNVpBZ0QvZVp3MGhp?=
 =?utf-8?B?ZDgvUGxCUmhVRXA3UzRKdzJicUI5NStRSFhGZmxwQXRYNFBYUXZITWcySElC?=
 =?utf-8?B?VFQrb3NDYnFGeGtsbVF0NnNnZ2RQZktOd2tjUkY0amRMaU5DR0dBRkZHN282?=
 =?utf-8?B?S2pBUktnVG0yUVNPNUYxeFdQWkJ5TTNXczh4cFMxaVM4OTg0WkV0Rkk2aEpU?=
 =?utf-8?B?cVAzaUdxWlhJdi9tcmdOcWtnYVpQSjQ5UmJOSjlYdmc0TzF1L3JMYnN4TWtr?=
 =?utf-8?B?U0VPbjFSU1hqNlozcVM4QzJ2bkw4Z2x3bUJJQ3JWZFBRZWRNWTBiWHpDdXRy?=
 =?utf-8?B?czBLaTgzeGpnYlpTaEZsT0xGbmpSSTZCT1BQUGhrelNNenc3WnFBUENvSVZw?=
 =?utf-8?B?aFl3TWtWNU01S3J3TTNNUUpjTWY3VjI2dmhLRXVnVFZwVk9wSzdSb3RITjVn?=
 =?utf-8?B?dGZZMmJ3TWpPZElBYnozYkN4aCtFUzJ5amNPMkNlRXVRd1BENnhHUzlQQUQz?=
 =?utf-8?B?d0FIUlpnRHNYY2hwYVNZYk5MMXFRUmt6TUMwTjFEZ1doSWpyTnAyaGtqZ2xn?=
 =?utf-8?B?SmpSandTajUwMFhFd2JXSmJEUnNMQ3BmRmFmS3hwak1kc0wvZzQrVGdrUVo4?=
 =?utf-8?B?dW0rVVpTM280TXoybHRORzRwYU5wbHIwZkZkYWdVZkFHRjdUVkVIM0dBclQ0?=
 =?utf-8?B?M3VjaTFkUWZLeWVCOFFVd1IxQ3FRME5INmkxUU0wbWMwYmVuYWQ3ZlBKanky?=
 =?utf-8?B?dkdmc3dwRi9lM3g2a2dNM3pxVDJTVDMyTkN5RzJ4SHl6TlNQR05aZU5haC9k?=
 =?utf-8?B?dkJJVFdBMmdoSnNQUEZ0YVZsdEp0TFJySk1QY1k0bFZsaVU5VGZ3YzRHck02?=
 =?utf-8?B?SXdIUVB1bWZoN1ZrQVgzMlFjWnJZQ1pTZXozVXd0SFJ1RThNc0l3UUVBTStH?=
 =?utf-8?B?Y2RjU3RsQ2ZPdUF0Wnd5Si8yZ2hsbHBNY2Z0dVRuQmcxcVlYekR4eFVSbGt1?=
 =?utf-8?B?bUtSa0Q3K21Vend2WEtxMVRiUTFLNk8ydkRpMm5vUllMY3lLb0FMYjVvcEJo?=
 =?utf-8?B?WDMyZFBkeVdoV2kvVFp3Y2RjVEFFQWlzZ3A4alRxOGtFK092YzQ3ekNBZHor?=
 =?utf-8?B?dUNXS3dJakZwUjRiL1hJaW5EK01RbzYxcVFyS0ZlKzVLRHd0Q0ZqRHhCVW5p?=
 =?utf-8?B?anNva3Jydm1BcGFLNjFGbnZJV09RMlo4WkFjR1cwb2x6Z2VneVA1d1VyTUJQ?=
 =?utf-8?B?anlWajFQSHNoTHFSOVJJVjJCRGVCYU1nbGlzWFdSaWNaWGo5UFZvZDdaVGsv?=
 =?utf-8?B?RXFMcjM1dytHMmVNTCsrSlkzbEUvR1pwMWJMK08vZGVucjEwa09MRGlHTk9j?=
 =?utf-8?B?Y0tZTU5hVzhZeC90Y2hrTjR2Q3FpR2hyZ3Q3Q1c4ekhUVTRYdDA4OWpVVHBO?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d3aaef-3b7e-4c97-5d97-08de285a1967
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 17:27:37.3730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0DsRWow1OFrN//mgZG7Nqgdglq7fspx+XAk4lOdYlMXuv8mZfkTJIz/tTsWcP7jKckMU4uwpIrvgwyQnidHCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7321
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

On Thu, Nov 20, 2025 at 05:03:36PM +1100, Balbir Singh wrote:
> On 11/20/25 16:53, Matthew Brost wrote:
> > On Thu, Nov 20, 2025 at 02:58:58PM +1100, Balbir Singh wrote:
> >> On 11/20/25 14:15, Matthew Brost wrote:
> >>> On Thu, Nov 20, 2025 at 01:59:09PM +1100, Balbir Singh wrote:
> >>>> On 11/20/25 13:50, Balbir Singh wrote:
> >>>>> On 11/20/25 13:40, Matthew Brost wrote:
> >>>>>> On Wed, Nov 12, 2025 at 10:52:43AM +1100, Balbir Singh wrote:
> >>>>>>> On 11/12/25 10:43, Andrew Morton wrote:
> >>>>>>>> On Thu, 9 Oct 2025 03:33:33 -0700 Matthew Brost <matthew.brost@intel.com> wrote:
> >>>>>>>>
> >>>>>>>>>>>> This patch series introduces support for Transparent Huge Page
> >>>>>>>>>>>> (THP) migration in zone device-private memory. The implementation enables
> >>>>>>>>>>>> efficient migration of large folios between system memory and
> >>>>>>>>>>>> device-private memory
> >>>>>>>>>>>
> >>>>>>>>>>> Lots of chatter for the v6 series, but none for v7.  I hope that's a
> >>>>>>>>>>> good sign.
> >>>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> I hope so too, I've tried to address the comments in v6.
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Circling back to this series, we will itegrate and test this version.
> >>>>>>>>
> >>>>>>>> How'd it go?
> >>>>>>>>
> >>>>>>
> >>>>>> My apologies for the delay—I got distracted by other tasks in Xe (my
> >>>>>> driver) and was out for a bit. Unfortunately, this series breaks
> >>>>>> something in the existing core MM code for the Xe SVM implementation. I
> >>>>>> have an extensive test case that hammers on SVM, which fully passes
> >>>>>> prior to applying this series, but fails randomly with the series
> >>>>>> applied (to drm-tip-rc6) due to the below kernel lockup.
> >>>>>>
> >>>>>> I've tried to trace where the migration PTE gets installed but not
> >>>>>> removed or isolate a test case which causes this failure but no luck so
> >>>>>> far. I'll keep digging as I have time.
> >>>>>>
> >>>>>> Beyond that, if I enable Xe SVM + THP, it seems to mostly work (though
> >>>>>> the same issue as above eventually occurs), but I do need two additional
> >>>>>> core MM patches—one is new code required for Xe, and the other could be
> >>>>>> considered a bug fix. Those patches can included when Xe merges SVM THP
> >>>>>> support but we need at least not break Xe SVM before this series merges.
> >>>>>>
> >>>>>> Stack trace:
> >>>>>>
> >>>>>> INFO: task kworker/u65:2:1642 blocked for more than 30
> >>>>>> seconds.
> >>>>>> [  212.624286]       Tainted: G S      W           6.18.0-rc6-xe+ #1719
> >>>>>> [  212.630561] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> >>>>>> disables this message.
> >>>>>> [  212.638285] task:kworker/u65:2   state:D stack:0     pid:1642
> >>>>>> tgid:1642  ppid:2      task_flags:0x4208060 flags:0x00080000
> >>>>>> [  212.638288] Workqueue: xe_page_fault_work_queue
> >>>>>> xe_pagefault_queue_work [xe]
> >>>>>> [  212.638323] Call Trace:
> >>>>>> [  212.638324]  <TASK>
> >>>>>> [  212.638325]  __schedule+0x4b0/0x990
> >>>>>> [  212.638330]  schedule+0x22/0xd0
> >>>>>> [  212.638331]  io_schedule+0x41/0x60
> >>>>>> [  212.638333]  migration_entry_wait_on_locked+0x1d8/0x2d0
> >>>>>> [  212.638336]  ? __pfx_wake_page_function+0x10/0x10
> >>>>>> [  212.638339]  migration_entry_wait+0xd2/0xe0
> >>>>>> [  212.638341]  hmm_vma_walk_pmd+0x7c9/0x8d0
> >>>>>> [  212.638343]  walk_pgd_range+0x51d/0xa40
> >>>>>> [  212.638345]  __walk_page_range+0x75/0x1e0
> >>>>>> [  212.638347]  walk_page_range_mm+0x138/0x1f0
> >>>>>> [  212.638349]  hmm_range_fault+0x59/0xa0
> >>>>>> [  212.638351]  drm_gpusvm_get_pages+0x194/0x7b0 [drm_gpusvm_helper]
> >>>>>> [  212.638354]  drm_gpusvm_range_get_pages+0x2d/0x40 [drm_gpusvm_helper]
> >>>>>> [  212.638355]  __xe_svm_handle_pagefault+0x259/0x900 [xe]
> >>>>>> [  212.638375]  ? update_load_avg+0x7f/0x6c0
> >>>>>> [  212.638377]  ? update_curr+0x13d/0x170
> >>>>>> [  212.638379]  xe_svm_handle_pagefault+0x37/0x90 [xe]
> >>>>>> [  212.638396]  xe_pagefault_queue_work+0x2da/0x3c0 [xe]
> >>>>>> [  212.638420]  process_one_work+0x16e/0x2e0
> >>>>>> [  212.638422]  worker_thread+0x284/0x410
> >>>>>> [  212.638423]  ? __pfx_worker_thread+0x10/0x10
> >>>>>> [  212.638425]  kthread+0xec/0x210
> >>>>>> [  212.638427]  ? __pfx_kthread+0x10/0x10
> >>>>>> [  212.638428]  ? __pfx_kthread+0x10/0x10
> >>>>>> [  212.638430]  ret_from_fork+0xbd/0x100
> >>>>>> [  212.638433]  ? __pfx_kthread+0x10/0x10
> >>>>>> [  212.638434]  ret_from_fork_asm+0x1a/0x30
> >>>>>> [  212.638436]  </TASK>
> >>>>>>
> >>>>>
> >>>>> Hi, Matt
> >>>>>
> >>>>> Thanks for the report, two questions
> >>>>>
> >>>>> 1. Are you using mm/mm-unstable, we've got some fixes in there (including fixes to remove_migration_pmd())
> >>>
> >>> remove_migration_pmd - This is a PTE migration entry.
> >>>
> >>
> >> I don't have your symbols, I thought we were hitting, the following condition in the walk
> >>
> >> 	if (thp_migration_supported() && pmd_is_migration_entry(pmd)) {
> >>
> >> But sounds like you are not, PMD/THP has not been enabled in this case
> >>
> > 
> > No, migration_entry_wait rather than pmd_migration_entry_wait.
> > 
> >>
> >>>>>    - Generally a left behind migration entry is a symptom of a failed migration that did not clean up
> >>>>>      after itself.
> >>>
> >>> I'm on drm-tip as I generally need the latest version of my driver
> >>> because of the speed we move at.
> >>>
> >>> Yes, I agree it looks like somehow a migration PTE is not getting
> >>> properly removed.
> >>>
> >>> I'm happy to cherry pick any patches that you think might be helpful
> >>> into my tree.
> >>>
> >>
> >> Could you try the mm/mm-new tree with the current xe driver?
> >>
> > 
> > Unfortunately, this is a tough one. We land a lot of patches in Xe/DRM,
> > so bringing the driver up to date with an MM branch is difficult, and
> > I’m not an expert at merging branches. It would be nice if, in the DRM
> > flow, we could merge patches from outside our subsystem into a
> > bleeding-edge kernel for the things we typically care about—but we’d
> > need a maintainer to sign up for that.
> > 
> >> In general, w.r.t failure, I would check for the following
> >>
> >> 1. Are the dst_pfns in migrate_vma_pages() setup correctly by the device driver?
> >> 2. Any failures in folio_migrate_mapping()?
> >> 3. In migrate_vma_finalize() check to see if remove_migration_ptes() failed
> >>
> >> If (3) fails that will explain the left over migration entries
> >>
> > 
> > Good tips, but think I got it via biscet.
> > 
> > Offending patch is:
> > 
> > 'mm/migrate_device: handle partially mapped folios during collection'
> > 
> > The failing test case involves some remap-related issue. It’s a
> > parameterized test, so I honestly couldn’t tell you exactly what it’s
> > doing beyond the fact that it seems nonsensical but stresses remap. I
> > thought commit '66d81853fa3d selftests/mm/hmm-tests: partial unmap,
> > mremap and anon_write tests' would catch this, but it looks like I need
> > to make the remap HMM test cases a bit more robust—similar to my
> > driver-side tests. I can take an action item to follow up on this.
> > 
> > Good news, I can tell you how to fix this...
> > 
> > In 'mm/migrate_device: handle partially mapped folios during collection': 
> > 
> > 109 +#if 0
> > 110 +                       folio = page ? page_folio(page) : NULL;
> > 111 +                       if (folio && folio_test_large(folio)) {
> > 112 +                               int ret;
> > 113 +
> > 114 +                               pte_unmap_unlock(ptep, ptl);
> > 115 +                               ret = migrate_vma_split_folio(folio,
> > 116 +								  migrate->fault_page);
> > 117 +
> > 118 +                               if (ret) {
> > 119 +                                       ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> > 120 +                                       goto next;
> > 121 +                               }
> > 122 +
> > 123 +                               addr = start;
> > 124 +                               goto again;
> > 125 +                       }
> > 126 +#endif
> > 
> > You can probably just delete this and use my patch below, but if you
> > want to try fixing it with a quick look: if migrate_vma_split_folio
> > fails, you probably need to collect a hole. On success, you likely want
> > to continue executing the remainder of the loop. I can try playing with
> > this tomorrow, but it’s late here.
> > 
> > I had privately sent you a version of this patch as a fix for Xe, and
> > this one seems to work:
> > 
> > [PATCH] mm/migrate: Split THP found in middle of PMD during page collection
> > 
> > The migrate layer is not coded to handle a THP found in the middle of a
> > PMD. This can occur if a user manipulates mappings with mremap(). If a
> > THP is found mid-PMD during page collection, split it.
> > 
> > Cc: Balbir Singh <balbirs@nvidia.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  mm/migrate_device.c | 37 +++++++++++++++++++++++++++++++++++--
> >  1 file changed, 35 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > index abd9f6850db6..9ffc025bad50 100644
> > --- a/mm/migrate_device.c
> > +++ b/mm/migrate_device.c
> > @@ -65,6 +65,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >         struct vm_area_struct *vma = walk->vma;
> >         struct mm_struct *mm = vma->vm_mm;
> >         unsigned long addr = start, unmapped = 0;
> > +       struct folio *split_folio = NULL;
> >         spinlock_t *ptl;
> >         pte_t *ptep;
> > 
> > @@ -107,10 +108,11 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >                 }
> >         }
> > 
> > -       ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> > +       ptep = pte_offset_map_lock(mm, pmdp, start, &ptl);
> >         if (!ptep)
> >                 goto again;
> >         arch_enter_lazy_mmu_mode();
> > +       ptep += (addr - start) / PAGE_SIZE;
> > 
> >         for (; addr < end; addr += PAGE_SIZE, ptep++) {
> >                 struct dev_pagemap *pgmap;
> > @@ -209,6 +211,11 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >                         bool anon_exclusive;
> >                         pte_t swp_pte;
> > 
> > +                       if (folio_order(folio)) {
> > +                               split_folio = folio;
> > +                               goto split;
> > +                       }
> > +
> >                         flush_cache_page(vma, addr, pte_pfn(pte));
> >                         anon_exclusive = folio_test_anon(folio) &&
> >                                           PageAnonExclusive(page);
> > @@ -287,8 +294,34 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >         if (unmapped)
> >                 flush_tlb_range(walk->vma, start, end);
> > 
> > +split:
> >         arch_leave_lazy_mmu_mode();
> > -       pte_unmap_unlock(ptep - 1, ptl);
> > +       pte_unmap_unlock(ptep - 1 + !!split_folio, ptl);
> > +
> > +       /*
> > +        * XXX: No clean way to support higher-order folios that don't match PMD
> > +        * boundaries for now — split them instead. Once mTHP support lands, add
> > +        * proper support for this case.
> > +        *
> > +        * The test, which exposed this as problematic, remapped (memremap) a
> > +        * large folio to an unaligned address, resulting in the folio being
> > +        * found in the middle of the PTEs. The requested number of pages was
> > +        * less than the folio size. Likely to be handled gracefully by upper
> > +        * layers eventually, but not yet.
> > +        */
> > +       if (split_folio) {
> > +               int ret;
> > +
> > +               ret = split_folio(split_folio);
> > +               if (fault_folio != split_folio)
> > +                       folio_unlock(split_folio);
> > +               folio_put(split_folio);
> > +               if (ret)
> > +                       return migrate_vma_collect_skip(addr, end, walk);
> > +
> > +               split_folio = NULL;
> > +               goto again;
> > +       }
> > 
> >         return 0;
> >  }
> > 
> > If I apply the #if 0 change along with my patch above (plus one core
> > MM patch needed for Xe that adds a support function), Xe SVM fully
> > passes our test cases with both THP enabled and disabled.
> > 
> Excellent work! Since you found this, do you mind sending the fix to Andrew as a fixup

Done. Here is a dri-devel patchworks link [1] to the patch.

Matt

[1] https://patchwork.freedesktop.org/series/157859/

> to the original patch. Since I don't have the test case, I have no way of validating the
> change or any change on top of it would continue to work
> 
> FYI: The original code does something similar, I might be missing the 
> migrate_vma_collect_skip() bits.
> 
> Thanks!
> Balbir
> 
> 
