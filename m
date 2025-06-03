Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B835EACC617
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 14:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B42110E5FD;
	Tue,  3 Jun 2025 12:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QrXYU9fQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8AF10E5FD;
 Tue,  3 Jun 2025 12:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748952165; x=1780488165;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BqdOWdBe4ITG+Jr4EZr4i5W6L5gVsobZy/N13nisO+o=;
 b=QrXYU9fQjjcT0MHhw4U+b3E3w53FHsuiLpgGu1b7mhGlnWMDyV5cPuam
 Xh8gjLek0F7Qm7pAS6VdUsXNIHl1ksN+0VMWFGaM5BiGunLBnkNNkwQVu
 H0a6SCXxuPWWqj8TyeKeZOBvBF5xCNi49djAv0bQpkv+3r6z+NOP4awX4
 WugsLph5Tc8qV5aZqeDAo4cPoEhr8rs6URLFAsxDWtLqmVYY9b0+OHdpo
 YfXYUmSJu5BhiCOkwRPi1OWiYFIO6eaPe9cDz3RCAAMTcornPjte5FuV9
 DCLyGb8kAHK6KIESnZucAjHGNjyT+DDrZdr3Fzgksn3XVeHVildFpZtFH g==;
X-CSE-ConnectionGUID: JTl8s0TWSu622Efs8L9vsQ==
X-CSE-MsgGUID: poCbSKRmRVWOaapqNsx/BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50850131"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="50850131"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:01:33 -0700
X-CSE-ConnectionGUID: XSWSyaOIQjK935JfnJg1cw==
X-CSE-MsgGUID: A5fclLp3Tj2WRi3VNLpr1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149713209"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:01:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 05:01:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 05:01:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.57)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 05:01:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8aagLBcjmy3IzSpJR0Q89OL17JRU22iFI/zhCvMj4b1R4y8mK8GY9k4trvlevN2ptHXZiTO0aXgswPc6MvqbmG4jRzEOkoslJ/SiWig0rxkUhdHS8FVbTvxXG6RBkLwxA+TAVFafbg268r2yfG+hXKEKOfQyx4GyDuz9Gfa2fPkNwNgnyxiNa39YhBX0NEM4tcliejzN7Aed4/RoS/x+AASHD+rEFUH4cgMbG8y0bjEJLamwlXMBt3w2AHCjiw0M1mzeslhCrVKNGRnG3Gx2pnSYKQxz5vx/vJNnFZqBetCSQ0ecQ9vnBe8HMRMVFenIYTJopXHZSe/yVFw438EDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72yX4ye6PwF+lkCgg8Vp/D9iPiNfHEkeNUiFgPIvmAE=;
 b=UuygdBHbgmbNVrJe2RbvVj7FoxPpsSf9CWkRoKfWOO1sFe3J2g2rDXVhN+5HNFcYE8phcUm7Tu3+YPgQaD3sXULniZDi7dvcgoVQMuR/wN12H7kQeftqmXzneQndSjuWb0MOpdmox+a1YqhK/lQRgQqmIkc6wsfV1GLe5QVD6D02bp128fIXO+w6ME8AOkVb+9aJv565j8rtQs32vrBCx5Lz8wiDgb+YL3pzWZ8KLkir32FkOdsU8sXeYQOzRLz9lWYJkumQpWZd9KMhul8dbmqaRyaRJCAvlDM8CEQaPe5y8Y202hRmqVtR8TA7Mh47/b5sEPOnfoV+uEymeOlj/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SN7PR11MB7139.namprd11.prod.outlook.com (2603:10b6:806:2a2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Tue, 3 Jun
 2025 12:01:15 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%6]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 12:01:13 +0000
Message-ID: <052041b1-4199-4953-9fe8-5595b67f70db@intel.com>
Date: Tue, 3 Jun 2025 17:31:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/9] mei: late_bind: add late binding component driver
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-3-badal.nilawar@intel.com>
 <f9c351fc-da71-4583-9487-3678e354569d@intel.com>
 <CY5PR11MB63661EF99D9F0B57F03F1507ED8BA@CY5PR11MB6366.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CY5PR11MB63661EF99D9F0B57F03F1507ED8BA@CY5PR11MB6366.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ME0P300CA0030.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:220:20b::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SN7PR11MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: 06707b65-7777-4580-66a6-08dda2965661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ciswYWs2aXVYeXVkZkh4VWg5Y20wQTZVRnhUa2JUd094WjZVTnVWYm1QY3BI?=
 =?utf-8?B?RlJLMkdJWXcyRWVzelEza05BNTJTRXdtNVpNWnpjaGNtTkh0REdiZndXYTFU?=
 =?utf-8?B?a1VPc0wrenM5d09tM3VSeDZrUjNQMmFMdUU1b2cwcFlocUV4NmQ0RUdXcTBQ?=
 =?utf-8?B?bXc0ZWdYb1JUY0c2bElGWjk0QittNlBSRUMxd2xXeUowM0dVbEJHYTkxTFJ2?=
 =?utf-8?B?TU5vZHRXY3RrTHNsNzlNcGZ0ckRNd1B6V3B1Y05JNXh1RUVucDFpRUU4a2JD?=
 =?utf-8?B?OGdyNGVOUGdQVVcxS3hUd3FJQTh0ZWsvejdtSU1iN3crYzNtdGJ5aWxkZGJm?=
 =?utf-8?B?V3dOQkYwK2k3OFc4eGIvOUhGdXpFdkhVelhUREZUQ0RITGF1STIwR1pZYTFN?=
 =?utf-8?B?UFBndG50anIrTWhrQ3VzNVRzWDloK0JvMGJFRkRiZ3NRditUNWZ6L1RKRzha?=
 =?utf-8?B?bm05S1JNT3hUSEszbVpSOHR0a20yUU5vZ1VRQ2tIRThzZVJLK1RWcnQ2TVZp?=
 =?utf-8?B?MXpIZDNPNTVtLy9JRGhsL2YrNWxkUUVMVEVhcXk5ZFdrY0RLeG13ZlNld1Fn?=
 =?utf-8?B?WGVQSldxNFE1YjNQTGs3MnZibHh2cmJrZGlVdlpSZHI5RHBpY1lTV0ZPcDg2?=
 =?utf-8?B?T2dzeVJPN2dURmRsc1FXWElGOWVYSEI3T3phbGZkZUlWQytxOWxIYTZVVjE1?=
 =?utf-8?B?Ry80Q3BxcklsZjBWSW04UDArZjYyWVNUbzcxQTFUblMyS1hDNXBZbWpJUFVu?=
 =?utf-8?B?OWM2Mk9lM1c2RVFXYnNUQXJjV2pNUmM5SnBEL0xiZUpaWVZwS0NzQ1draXRI?=
 =?utf-8?B?WWl2UUx2VWNTNlJJM1dNRmNqYXN3RDJkOW05SU1tYnFaVE5HRUJZQ3pOQW83?=
 =?utf-8?B?NGJtYTBjMTluQnVhczJrcHVBL1pkeCtmT2hpY05SOG1tTk1mUDlqQXgwOHh1?=
 =?utf-8?B?Z0paeVpLamJpV0xWNldqZGxobnR0UldlbVdWMTE1ZjQxTi9Dai9uek5mN3E1?=
 =?utf-8?B?V25zSU1kYjZaMVd2TVFvMC9BYnJ4OFkrNFIxNEF4KysvazI3dWNiZVhDVzVT?=
 =?utf-8?B?aFM4ZWNXd2JibEh3TGkySHg0dVQ0WDZjRTNaa2QvVGdkeU1ZSG8xMS9QbXJn?=
 =?utf-8?B?eXlNemxaVUZ1Q2Rxcyt5ajVSYU1pM0FjTTBQZ0xUdTlvVFlNREtyMWxaQ3Fk?=
 =?utf-8?B?aUJHL1ZqbGk5NmNmYmFuUFhGMzcwakhlUENiOGhKL3dWU0Z1bWN4YUJvMnd1?=
 =?utf-8?B?MHVjNnBsbEx4NXcyKzNOR2xJbXdlbXBhTXlqSUltV2NzMHBudS92ZlQyN09v?=
 =?utf-8?B?S2NPc3RLNEhrbzM1OXMxczRXam8vQ1NJNGo0VjBTbzhSTlJQbWhjWlRDcG4w?=
 =?utf-8?B?RXhDNzVjc3ErSURpcEF1M2VaMkU2Y2EzSEJRd0daV2p2L3ExR0x4Y2tsMnVC?=
 =?utf-8?B?VFVia0ZIVWpoM3FGYkhueUJxMm9HaFp4a0loSGF2WndjVW92YlIxdWFINHFF?=
 =?utf-8?B?V0ZTNVNZOUJ6d3ZIb2lYZHZXL1JGWmZJeCtTQnNXY2Y4bW9zbkp3dk90R3F1?=
 =?utf-8?B?Snl0WGY1TGQ5OUFlVnBjNW1YWE9aa0d0UmhZSFdXTW1vcmQ4Z01tbmJ6aTV1?=
 =?utf-8?B?K0dNVWZvRFF1cUdNNTg0YnBPZkdlT05OS2hJRHg4bnR6clJycFFZcXh2YzVU?=
 =?utf-8?B?ejZlTDRtRmU0TFdHdmxCS3pXK3dGNHJIV2N3ZFVtSmNnMm9GK2txb21UQk9G?=
 =?utf-8?B?aURXWUZzQmJ0Z3Z1VlVqd1ZneG1UUHRSZCttendYdXhJSHdNbERoN3FybWls?=
 =?utf-8?B?K2tGSnlpR01aNEI4TU51TXRGYThpUElkMHZ4djJiZEdDcWsrbkFla1o0MUhM?=
 =?utf-8?B?R01WLy8ybzlLWmlYUkJVUEJIYlM5K2R4cW1QblVMakxOT2hSLzJONTVUYVNI?=
 =?utf-8?Q?tgZJSC5V7Rs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm5TKzYzcitNM0hHeS9wejNGTldIazd6NEh4UXZSSjFJR1NvT3ZjbGZvZUx6?=
 =?utf-8?B?K1UyUmVCOGNjbGgvVGN1WVppRjF1aktlYkF1NDQzd241MmtBdWZNVWk4VW5w?=
 =?utf-8?B?MWhHVy9EdVA3enplVHhnUEtQaE1haERndXovRnU1WWgxQkdjblVyV3ZZOVJO?=
 =?utf-8?B?aEpMSm9KcllZNWVMcUtwT1Jib3grVkJVcEUySStlYmlMYm5WZlhhcjlaUFlN?=
 =?utf-8?B?TFc4Q0g2akxMYTE1NUR6WXdQeHNTRjJQc2Jvb1F4Z255LzBxUmMxZmNRZE1E?=
 =?utf-8?B?YzBnbi9RYm9qK2NFMlFoYktTbGpQV0haSEhXNUxwOGdqZThWRnBYbWRGZU5E?=
 =?utf-8?B?WTJhRDNaeXZwb2pWZUhEY0ozUTNzbGkyS0dQb2NKQ2Y0MlY3RDhYUUZZRjJF?=
 =?utf-8?B?cEFsVUVqWTNtNUg5QXRITGV3T2NMaGNqWmxwb0ZxWlZyZk9LTVBHK3crV1lG?=
 =?utf-8?B?bkUwK0xjM3ArajEvMmVtWWZnNmhGNUhGRk9WWS9jQ1UzWUNTc3J6aXhqYWVQ?=
 =?utf-8?B?bXFlK05CbzduNkJjN3FlN3Y0bFdiWE82RG8rMlNjYVdMNzdqTWhDY0pBcjJD?=
 =?utf-8?B?bkQwbFNzdmkwVVhHKy9BMURFQ1BnY0lnRjlLU1Faa2lhTjcrbVkzT1gzZjJ5?=
 =?utf-8?B?aXhwVlJqR0FUOUlMdVBBaTZIWHVhU1JkYlovbjBqc24vcUhvWWthMWRyME00?=
 =?utf-8?B?aWhlWEUwRUlyVXN1MndDa2tuMUJZdmNybWJaMWJGQm5BaWJyQ2tPS0hLcWFT?=
 =?utf-8?B?bTlqMDZycmZVRm9EcDdHenFqcXVjd0EwZnhPTDBmWGR2cS9LWFdCOHhTSTlr?=
 =?utf-8?B?M0lQWWxKeUhLSXNWTnBTQlRwSUM4YkJHMkg5SnBZak1VOUExZmh4SUZtVDFM?=
 =?utf-8?B?bnZRTHNmYTlZd0tJOG9CT0ZVVXRRSHpBUkcwam0yNEUwWmJTRkpOeHJDTEhP?=
 =?utf-8?B?OFNnVDVPUHhNbTVZUEozY2dWM1QzenlJSGFNclN5aThFUXorT2RBZVNJeDU2?=
 =?utf-8?B?VXcrdVdsY2xnck1qSWVoMXNvNzlYelZDajdkS1hkZ3BmMmx3N1ZKc2p0VHRy?=
 =?utf-8?B?MWs2K01BdFFsNFJ1R0FXK2JkdEpXMDNlZS9DNFBIb0prVG5BdlY1YzFJcXMw?=
 =?utf-8?B?YnJhbHI4bnFTQitWVzdjRmhBQ2V3dXhVT3pSU056VlFaczlOb0k1QW1LYXBR?=
 =?utf-8?B?Mld1ekZqR3VXTlA1UnI2RnNzR3QwcGpMRkYySGVYeEpDZlVLMW0rOVFGVUpK?=
 =?utf-8?B?U1JjQldLTkROcHU2YlNaZ1o4ZkpMNU9iVjRSRXlTNCtoUG1mL2JtcGs0S1pw?=
 =?utf-8?B?ZmhLVFUrVWRsU01kUTVKOGNRMUYwVC9ReTl4SDJYQXB6all6Q1ZZOUZzajk0?=
 =?utf-8?B?YmRKTU5JZkV0dmkzb0QyVWNOUTBjblVkSjBMNG9kV2xWd3AzeXgzN2dRYTJ3?=
 =?utf-8?B?cHh5bGpiSklIZ2FjNjVRTjBUTnNEMUlGVFNEck40Mk5YZUp0RkV2MFlKWFZu?=
 =?utf-8?B?VEp1aEtvWkVJdzhRWkdsQTZmbHZlS3hBZGtybXRpUHJSU1NLUWRldDRzS1NF?=
 =?utf-8?B?YVJIVGE3QmpCVlRiakM2MWtvSmxXTGZkeDlTNElIdlFkcUMvWUZzd0dBVW1o?=
 =?utf-8?B?WWZEYWVLR1RZOVMwTEZDdHNGUllCK2dvMFhzZlpQNWFCYkt5Vk4yNUpNY3pG?=
 =?utf-8?B?Z3Y3R2VLWmZjRGF2aC8yS05mVjdvZWcvTmRySkVnOXdrUmhQYmN5U2EwOEVW?=
 =?utf-8?B?UktiaGd6WkRmOVBRYVdnS0pkVW9IUCtQSzFOdU1iY1lEOWFvNVp0SGlEL2t1?=
 =?utf-8?B?UkpmZDMyeFROb092RmU2OGxjL0JudnVDZVJhVHFmVm5IYnZHVXNJZnY0cUt3?=
 =?utf-8?B?bC9YSXU3M3JUVllwS3N2RFdka2lXSy9ia1RETm5VSmg3MHpIZlI3alBDQ0pV?=
 =?utf-8?B?dlhabTNicHRLeWJ6VW5Cdm9xVGdUL3c5WDhDQkJVYlR5KzNzNExiZ1loNXZp?=
 =?utf-8?B?MkNPbjdVS2ZhbC9pRFhSYnM0M3hIVkJsZmdrVlBFelNmRzJLVWxBb2dYbWE2?=
 =?utf-8?B?ZjErdE95SnRZZzkwTzMxYWdIZVZKNmx4UFFqWGVCVXE4T2VNTG1QZEc0Wmxj?=
 =?utf-8?Q?XKChf7BnEXit1d5EzEqmWclyW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06707b65-7777-4580-66a6-08dda2965661
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 12:01:13.7976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOJAOTcWgH9Pc9PeCA54Mt6R9pjN8wSlgxXRzWFXiMaZi8j5kZ+WFlWOX/WBFJiAoJoxS5gWm3wbdCV0y24CHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7139
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


On 08-05-2025 11:11, Usyskin, Alexander wrote:
>> <snip>
>>> diff --git a/include/drm/intel/xe_late_bind_mei_interface.h
>> b/include/drm/intel/xe_late_bind_mei_interface.h
>>> new file mode 100644
>>> index 000000000000..4005c4c6184f
>>> --- /dev/null
>>> +++ b/include/drm/intel/xe_late_bind_mei_interface.h
>>> @@ -0,0 +1,49 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright (c) 2025 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_LATE_BIND_MEI_INTERFACE_H_
>>> +#define _XE_LATE_BIND_MEI_INTERFACE_H_
>>> +
>>> +#include <linux/types.h>
>>> +
>>> +struct device;
>>> +struct module;
>>> +
>>> +/**
>>> + * struct xe_late_bind_component_ops - ops for Late Binding services.
>>> + * @owner: Module providing the ops
>>> + * @push_config: Sends a config to FW.
>>> + */
>>> +struct xe_late_bind_component_ops {
>>> +	struct module *owner;
>>> +
>>> +	/**
>>> +	 * @push_config: Sends a config to FW.
>>> +	 * @dev: device struct corresponding to the mei device
>>> +	 * @type: payload type
>>> +	 * @flags: payload flags
>>> +	 * @payload: payload buffer
>>> +	 * @payload_size: payload buffer size
>>> +	 *
>>> +	 * Return: 0 success, negative errno value on transport failure,
>>> +	 *         positive status returned by FW
>>> +	 */
>>> +	int (*push_config)(struct device *dev, u32 type, u32 flags,
>>> +			   const void *payload, size_t payload_size);
>>> +};
>>> +
>>> +/**
>>> + * struct xe_late_bind_component - Late Binding services component
>>> + * @mei_dev: device that provide Late Binding service.
>>> + * @ops: Ops implemented by Late Binding driver, used by Xe driver.
>>> + *
>>> + * Communication between Xe and MEI drivers for Late Binding services
>>> + */
>>> +struct xe_late_bind_component {
>>> +	struct device *mei_dev;
>>> +	const struct xe_late_bind_component_ops *ops;
>>> +};
>> Does this structure actually need to be defined here? Differently from
>> other components, for this component we're only passing the
>> xe_late_bind_component_ops via the component_bind_all call, so in the Xe
>> driver we should be free to use wherever type we want to store this info.
>>
>> Daniele
>>
> You are right, this struct may be dropped from this header.
> Badal, let's move it out into Xe code.

Sure, I will move this structure to xe code.

Thanks,
Badal

>
> - -
> Thanks,
> Sasha
>
>
>>> +
>>> +#endif /* _XE_LATE_BIND_MEI_INTERFACE_H_ */
