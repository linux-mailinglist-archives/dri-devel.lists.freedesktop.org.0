Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81B6AD0370
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 15:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB2610EAAE;
	Fri,  6 Jun 2025 13:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hDOQ5kBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F45E10EAAA;
 Fri,  6 Jun 2025 13:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749217691; x=1780753691;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=QdW3BRNtDz2UmBVd7bwd4bmvibRJaECKrUV5jVf4uDU=;
 b=hDOQ5kBlfW7aSJJmXOHC4RdhbWnU2CBqTv5b4mn0x/jdb8N2G+QqPU9r
 oHzEAZUpC7Yx9zcwt+Rwn2DAUW/0/IbKhimLMnQ62AOdFvv2TbkxPHvzz
 vOFpkKQ5gRMUHjWfyM/SDGCX0PuQt/SErXcBerQTCD8I/ayIhcsxbosX8
 Z4am+e0hGujCX3jkA7nFhQsWWuSK2Px9wsHJsajVUWlbZrWYwZ8Ya8uaN
 ilmiTHHY7/5NsPD5BP36SEJfUQIMKRFW13yjSlh3gqHAh0MA9USKuWCEq
 5qYh/quJrh+ioNOlxudBo+a+PwWKdaHQOAtb1jkXjA/cDFB+lwW2ItJWJ A==;
X-CSE-ConnectionGUID: Y3jmx99HT8KHFjdrHF9FwQ==
X-CSE-MsgGUID: yXuH6p7RQz+pFrxHezb5VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="55173604"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208,217";a="55173604"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 06:48:03 -0700
X-CSE-ConnectionGUID: hvDNAKMoS1K3Nbz6MmzrGQ==
X-CSE-MsgGUID: bWasDdJaQPqj1H0Iktnh9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
 d="scan'208,217";a="150841757"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 06:48:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 06:48:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 06:48:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.63)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 06:48:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQJA0EB9nPonzRkur6WQ9DDwlRDwYe4Fha5RH+Vus92Wl+0F6YN+L2C4CqS8ZO7mkYh/aDDgoIZn7vjs2UqgwFmUHSSw00/WwFvUqCxuf200W3Ct8Ico4K7XN75K9Meb6lbDv1eF8kgc1qFwAKswn56gFXZBN5kZz2dufkWcPtJ1yhLTeknkgFm98cbR1xRiHTadQk3r6rXkf8CBXzbL+Trj8sTmfySse9NfOI+mHntX9BHMoYABFjPpoXlH9ClpPWjO6AHSrprmqrZDSuVpe3+DiFDeJus+H3SSwoinolDlsj+vRnZnr/SyO+ke40CynymhSaXGIM1g1/+Ceu6KLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6gGsxe94nX8Gh7n33Hci8+w3aWDbC3D9abG49jz2Po=;
 b=pLAcOarNAIwYwWcjsQR9MsLUN+HtkcGYw8+gy7zLMYdWBrzEr2woENgHW09JUOv3NawuNXlijbaDJbjbzz6BMwKDCandthqjqu50AvZFwyBT1WbXF9CJ3k1pviZMMcLbqoOc7Mws90PVMT82Xs3/8VxEXr2VMqAoNZvMJOND5AEZ2u0CuyG1bp+vHVPx5TV9X6SL6ET53O/opkG5U5QeqdXOVwWShRT0vqRhIqxT6YulWpnzKA8PDY9Pjo9pby7vkSjUd3hukINpwX+FnLW+pIVWm68X050OYGX3mAm3NVgMQ2yJRJivMlXF0fEnL3p+9TCWMdKDP1QjxuypNNBf8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM4PR11MB5972.namprd11.prod.outlook.com (2603:10b6:8:5f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.22; Fri, 6 Jun 2025 13:47:58 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%6]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 13:47:57 +0000
Content-Type: multipart/alternative;
 boundary="------------uqRdRCXNxhQ4pK38PfTeUepQ"
Message-ID: <de0bbc62-420f-4b21-ab87-00bd80fe83d1@intel.com>
Date: Fri, 6 Jun 2025 19:17:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 9/9] {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <alexander.usyskin@intel.com>,
 <gregkh@linuxfoundation.org>, <daniele.ceraolospurio@intel.com>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-10-badal.nilawar@intel.com>
 <20250506181353.GA89958@nvidia.com> <aBu5O5odAKaxhhym@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <aBu5O5odAKaxhhym@intel.com>
X-ClientProxiedBy: MA0PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM4PR11MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b69e68-1a88-4806-f2db-08dda500bea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckJHS09FL3VlcVc2VkY5dmRSLzFDYm5RK0RiZ2FGUVVGWkUva3NKVlEvUHF6?=
 =?utf-8?B?Z3d3UDhFK0VGbHJwZ21xUkFGV1pEK2JoakxFUGNSeDJ1NENwSVhHUUJZR3dO?=
 =?utf-8?B?a3Myb2dyZXM4Tkc1OStzZmprRktFeGg0dERFSUVuWDhsYkYzVi9PdmhKaXpk?=
 =?utf-8?B?TStOMHc1c2NmRmFZOFlRSmZ0V3VwRFRGT2pVR2p5R2hBWHQxS1Z6Y2JySENT?=
 =?utf-8?B?RXB3a09oVG45S0xSN3FvYjgyRTMyVFQyd2p0OE5Ta2ZOVTlQMWFheDFHMlZF?=
 =?utf-8?B?VnRSY2lzU3lOVkJ6ZXFrREZtOHlsdCtTSEFOemNJZEZKeUN2UDBWM0tOWWJ3?=
 =?utf-8?B?RnpGTWNRVktXcFlqZEc2Z2JVa3dFd2tRM0ZBM0pkbXh0UGhyTkNITmE4dEZt?=
 =?utf-8?B?aHJQdzJWTEI4UWVNYm5RUG4wZ1h4dlN3ZHpkTVRzSmsvMzhBUVczTUI0dHB0?=
 =?utf-8?B?UHlld3V6OFlYajhhZE9IYWZrQi80UUE5czgvb0tCSTVMUGxvN2RGMUpwVzE2?=
 =?utf-8?B?c0IweFVzcW02N0g5TWZQQ2pSVlVDWjgxcE5lc0RoMzdSSG0rNVgrRWFlWGhQ?=
 =?utf-8?B?dnNvVUg3ZGUyQk1DZURDVTBJZVB6N040Y2o3S0VOa3cwOWZsSjhvalZYdFF4?=
 =?utf-8?B?bXBlaGNUSmR1bnQ2bVJzU0JQSUZuVjRDVXV6SnBqR2IxcG9vV2ZzQVlBUDF1?=
 =?utf-8?B?RmpJNUhDSkU2Rnp6ZnFYVzkvS0hvK1o3b1l3ZDQ4VG1MS1JJV0F4Yi8vaytt?=
 =?utf-8?B?ME4vTWI3T0RVWFp2V09BWk16R04rdHBOc1Z5OWYzUnpLZFk5LzBxdldaUlJM?=
 =?utf-8?B?amhJQmNOZ1QwM04yMHVsRGgxVWdmY3FPa1J0bUhvNnFLdjYxb3VDQ0hSd3ow?=
 =?utf-8?B?VjRjT3oxVU1LM0p1MEZ5dUZ5bjY0ci9yWnlLUDhGaVA2aDRtWWQwVkQrZWRL?=
 =?utf-8?B?V0VwOXdxQkhSWFhaM2cxcXByMkdrdm12cER3UXhOV1JXL0MrbXBlcXRBVUs2?=
 =?utf-8?B?N0Zka25nYThta2c1L3VTWHlJTUNEa1ljTnN1T2o2TXNqeGRISXZwL1Z0MXo1?=
 =?utf-8?B?M29wbVlMZnJSdU5HaFpkUnhKZUJzVm5uc3A1T25oajl3Vkl4SVNqZVpvZ3ZI?=
 =?utf-8?B?R2ovZVB4UjlnMEt0T2dHY2h3WWg4UHVSNGsyOXpURE94M0RkVVpnNEcyeGQv?=
 =?utf-8?B?M3ptMERWZjRwUnRhVFEzVThhOVZUdEhXcFczMVdTYnFBak9DTnp3N1B4M1lK?=
 =?utf-8?B?RUFaYTZJSTUyMGlTWUREKzR2dkxERFFCcVl5UDdOTk5iVEFPZGw4dEVFTThY?=
 =?utf-8?B?MkRXZ0Rja3FFQkdvYW1rMkQ5dFYrOUhzU0RPWW1BRmNOUDFCSytkTEt2ajlV?=
 =?utf-8?B?ZDNBTjdkVHRTVmY2ajg3K2ZFYXdzUkZ5OHQxZG0vY0pPQ1hQMFBaYTVWNE9t?=
 =?utf-8?B?dzdwV3ZnY1R0Z0RtYWZlQ2tIRGc2QWt1SFpObnJvdXFhWkZqbFJvR0p3N2lo?=
 =?utf-8?B?d0lOVy96TkhqNXRUTG9QVzh2ekhSU0xxUVJEM29ZRE5vdUNpYjB1VEpIeStj?=
 =?utf-8?B?RVp4YmcxbnJIYUJwbHpIamRORTFWNEV5WnduTW5BcG94dkhESEFtZFdHSTFr?=
 =?utf-8?B?NWdYRlJDRGNzV1NzYWpzdDlhWTJiemY0YlRUWFc0RmFONTZsUE4wQ1hDL0tB?=
 =?utf-8?B?UWJBNmR1cXorVGdIQmJ6VHBMQU1jTkhzQzNtYVdWZTZKbEtxaFlCSHpLYVJv?=
 =?utf-8?B?QVY2RGwrM3hNYzJHL1hVVjJHb3Z3K1pOUEcwdjZPNWxRNlFUNm1Ea0ZpckND?=
 =?utf-8?B?Rko2K1J1UjBaNFFBaGdsWjh4QVluUittcFBmR1hiNmlXTDNCU21pZnh4NGJr?=
 =?utf-8?B?eW1Sc1Z1ZW9kekc1NmI4VUQyOWNrUmRJQjkyeUZKY0NnNGpZWDFwVHRQS2ow?=
 =?utf-8?Q?0EMp4C/npAw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHpsdlpHQmlTczlWNEpwK1l4Y29BY3ZFTU1SR1RiTFhLMWVabkxpMENFUjJM?=
 =?utf-8?B?Q1lsK1gzenl1dE1TajNsc3FOVHEzU0QxSXBuY0dqa1Z5dmJlSEM3aGxUZDNT?=
 =?utf-8?B?RnNpTG42R0VaY0trY0h6UVNVZGVuaHJUdW16UVZwMGt2dnYwR0RiOGRteXpk?=
 =?utf-8?B?eVBrV281TGhzS3UrUGd2VVJWL01ldUVWNmxSQlU4d0QxQ01RazR1d0xYNWp6?=
 =?utf-8?B?VHhlcFFaWkxaem14VU9ERHZJS1ZabmxSL0lib1ZkMk1MR1FJKzUxMTFub3Fs?=
 =?utf-8?B?Z1JyNWVNWmlsbUFWV3VWTWR6YkRmVjZ1NnlqZ2FHK0lMMjNTbXR3bnYxTk4x?=
 =?utf-8?B?aWpjZ1hBYTdVUGxpdk5Pam9BZE1vVmdxMEVZQU8xV2xSMXZ6TkxrLzVDelVG?=
 =?utf-8?B?Q3ZvbWJ5dG9JYWVneTVQdWlkUFFnWGNSWWtvdnBLb1VvNDRrb0YydlhIL20z?=
 =?utf-8?B?N2FNckpFNEEwREcxZ2I0OG80RVIxRVhDTGI3KzJ0SEk1YS9Bb0kyemY1Nk5U?=
 =?utf-8?B?N3BJRGw4a3JJOW53bjVzaE9NLzB6NG8vNDN6RnNUY0lWMDFuUWNmUFZGUW9r?=
 =?utf-8?B?ZFJaYlFJdmppNHV4TVhpdG0vcFBVbE4vbS9ZMy9PS0ZwQ3FCODBrSnRQallC?=
 =?utf-8?B?L2ZEdWE3UXkzWGNQYjRXNzVpM3RBbnJYQ3d6Ukd0MnpSazRoUXMxN0VENE1P?=
 =?utf-8?B?K3NGb2ticjltcUNIS1NINy93MTNqM1o4MjFGdDl6U3l6RVc0RzEwdXFsb2xz?=
 =?utf-8?B?djJ4YXpNd24rRnNncFlKNTZibHNqdlVlYUNkZjNuc3U5dFFvd0VMYk9PRnZK?=
 =?utf-8?B?RWZJbkdTY09SdXhMS2NLQXBjekMzU0NHbGd4R3FFdE5HdnFUNXFKWHk0bFlR?=
 =?utf-8?B?cExNamp2aXNtQ3FjVmNWRGtzaHpncXhzb0tndDlDb282RHJYUTBLZVNiUFdL?=
 =?utf-8?B?Q1JWQ3Nhcm1KYVQ3bVJPMmdaeDB4UXgzZGN1MDdhRHpaWjJkRlFKN3FUUSto?=
 =?utf-8?B?aUVDWXY4RDhwbHNtZDd1V0FPcUl6ZSt0VWMyR1VEalJjTVJxUFVpbHJTZDFh?=
 =?utf-8?B?KytYL1Y3RFQvaWZYZjZ6SGJpbk85RlhIajE0alM5czlWcXByWndKdXByOC9w?=
 =?utf-8?B?RkIrUjZ4OEd0RitlM3pIU0R3bkFtcGpTcldtKy8rbnU2MkNOc3VsZUxXc3lz?=
 =?utf-8?B?cTgwVDBzZmdBeWV4c21qd0NYa3JDNDdGRFh4MkFMTUlPLzlOTGFGWGZRSVhD?=
 =?utf-8?B?OHFXMnRtNHZMUG02NUVBbVp6c214SkJFQkc3V1I5c250blJPaDRRZktBTE5a?=
 =?utf-8?B?bnMxaGVNVC96OXhQTHlWbitxTGpRMVlVekpyVVFJWXhoU3pvU1krZ1dLeURJ?=
 =?utf-8?B?OHQ0OW5OOGxxOWdEeEtWUDNIRVZ2NlRBanc5dGI1U1BhUFdKSm1kWDkyOS93?=
 =?utf-8?B?K1BtN2ZMdjgzVSs0bFdGQkZIMnRPMTNiMHdQYWFSaDFJemZwL2lCNVRUZkFq?=
 =?utf-8?B?NlFDbUtxWVlyQ3lIcWNvVTdqWThtS0svT3RndmNGdUtQc1NJQVQ5ZThqRHp6?=
 =?utf-8?B?Y2NTbUhQa1lSNUV6bkhLcFNyUTJUTVAxdlAxbWFSMFdQdU55ekJ3MzJHU0Jk?=
 =?utf-8?B?N1NJWENHdnJLdVdVenNaUjBQRmNLU2lhQVZIcjNTR1FFQVZOMVRPNTZRWFlu?=
 =?utf-8?B?U3h3UXNIakNSaXNKRGF6TUpQMDVQcFV5ZUUyekxDUG1tdGpEdGpzM3hMejlV?=
 =?utf-8?B?N2hCNlE0RkNHS05HV1A3dUVBTkc4M3VTZnBVRkxLTXNsQncxZ3E0S29FYldl?=
 =?utf-8?B?bXRmSUlnY0E4Qm8rYi9LOFFia2tOZ0RPMUR2RWp4bExYd1l5MGFjMmlJVkJK?=
 =?utf-8?B?cWpJbG1aMjNJZmZuZWZqRmxNZWt3S3JKMG9NWVoxUVJsL1dqRm1QRE9KS3cv?=
 =?utf-8?B?eVJ6UGNYckF5OHZWY0lCb3VVOWsyS3ZKNGk5VkJVSnAzYk9FaGFoTEpYS0I0?=
 =?utf-8?B?U2xsbkhYYUFnVHdNaTdPQ2JIVGZFVU1iTVNFa1J5OEdVM2V5ZTVhbVNCeThz?=
 =?utf-8?B?N1VXczJwdWl0T1NWdUpISkFscC9TQm1mTUY0alBKbk5pQ3BoYlc3VTZHemNG?=
 =?utf-8?B?ak5HMHYrYmIzaWY3R0kyaXdUOWxqSHR2aXk5S3VzWWQwbUl6T0VCbzE4Ukk0?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b69e68-1a88-4806-f2db-08dda500bea7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 13:47:57.7227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uuyf9dzHB/YrUwmEYW5WykAWc+eXTRsttoQ36fXpjdz4zonZ66nXdUsLZg7KfPP/c1jl0DCEInRdLxhZ65QMJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5972
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

--------------uqRdRCXNxhQ4pK38PfTeUepQ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 08-05-2025 01:19, Rodrigo Vivi wrote:
>>> +static int xe_pcode_fwctl_uctx_open(struct fwctl_uctx *uctx)
>>> +{
>>> +	struct xe_pcode_fwctl_dev *fwctl_dev =
>>> +		container_of(uctx->fwctl, struct xe_pcode_fwctl_dev, fwctl);
>>> +	struct xe_device *xe = fwctl_dev->xe;
>>> +
>>> +	xe_pm_runtime_get(xe);
>> Shouldn't this be in the RPC function? Why keep the device awake as
>> long as a the FD is open?
> In general I prefer the runtime on the outer bounds to avoid funny deadlock
> cases. But right, in this case here it could be inside the xe_pcode calls
> itself, that is when the mmio/mailboxes accesses will really happen.

This I will handle in separate patch. For now will do runtime on rpc 
function.

Regards,
Badal

--------------uqRdRCXNxhQ4pK38PfTeUepQ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08-05-2025 01:19, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aBu5O5odAKaxhhym@intel.com">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite" style="color: #007cff;"><blockquote type="cite" style="color: #007cff;"><pre wrap="" class="moz-quote-pre">+static int xe_pcode_fwctl_uctx_open(struct fwctl_uctx *uctx)
+{
+	struct xe_pcode_fwctl_dev *fwctl_dev =
+		container_of(uctx-&gt;fwctl, struct xe_pcode_fwctl_dev, fwctl);
+	struct xe_device *xe = fwctl_dev-&gt;xe;
+
+	xe_pm_runtime_get(xe);
</pre></blockquote><pre wrap="" class="moz-quote-pre">Shouldn't this be in the RPC function? Why keep the device awake as
long as a the FD is open?
</pre></blockquote><pre wrap="" class="moz-quote-pre">In general I prefer the runtime on the outer bounds to avoid funny deadlock
cases. But right, in this case here it could be inside the xe_pcode calls
itself, that is when the mmio/mailboxes accesses will really happen.</pre></pre>
    </blockquote>
    <p>This I will handle in separate patch. For now will do runtime on
      rpc function.</p>
    <p>Regards,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:aBu5O5odAKaxhhym@intel.com">
      <pre class="moz-quote-pre" wrap=""><pre wrap="" class="moz-quote-pre">
</pre></pre>
    </blockquote>
  </body>
</html>

--------------uqRdRCXNxhQ4pK38PfTeUepQ--
