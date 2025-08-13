Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E469B24605
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 11:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FAE10E6C0;
	Wed, 13 Aug 2025 09:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jyfjO0mm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD7C10E6C0;
 Wed, 13 Aug 2025 09:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755078681; x=1786614681;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=JmHlTf60jkbSSX0vREi2B54/Q0k/K0D8p8LrE3wqQI4=;
 b=jyfjO0mmj03AcNbwf8Jwz0WGI8+Rv0VATZshyH2ftw1tqq0rbzlmmcaJ
 9VJqPwZUkgrX7Hhf6aD0B5IOxq5JY539+1O6oNvhrz1VLaANMv776WTQG
 djbfpMmj1ItHygdSMtgyZqA7QQQnOuKLZSVeh9YsMV+ZNS5PP+OsqJW4M
 i4o2qZSiLpHtDjDHd2g/i2gBlAL2PXhF+C+Vj4wIfLGbTzZJKnH8n3BgI
 +Ln73/g8mXO55I/hPgfZvJVlZ4KxlT3ZGr/AWQFerjIfroqHR9HK2Xtjg
 QbPQv+SiH/12/5R0CrB7j70BgHHDRX1F1Q/c1qKRlMrOCMldv9BcjjEJo A==;
X-CSE-ConnectionGUID: kzsnHatTRY6dhDoIYM+W7w==
X-CSE-MsgGUID: ovkBjjwnRV6do3otZaboBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57483894"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208,217";a="57483894"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 02:51:20 -0700
X-CSE-ConnectionGUID: LfZkgObGSL+78C6MQHrGdg==
X-CSE-MsgGUID: KMUfoOsxRd2ksFN3ABXwIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
 d="scan'208,217";a="165615095"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 02:51:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 02:51:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 02:51:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 02:51:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/YJOqbyNcwOpplR9LrTzJEx8eE0xPLnLrdbLql37kJFViKllVbsUxdgbfrtDkixA7/+zEky41AWd54ULXIgnYoB0NuO6Uhi2EcUVnv9R7kVTOF93gt+CU5sI+DAhSa2kFFidnrQ6f0wDCpfocONLoEy91PTls+dErY1yAfA2JX4ausHoaUmHcp2uaE2Q9JHMC5enMeM8gc6OsqZ24QUJRe1ihcU3JqfCf5cxRBzpVw31azQFmrYOh/NdjzockW2jFnZ8dkuJf1hx5KEKdnznF4EJDB15f87w6wCFanlOZOWqXrp4xWXEU7s7mq/qjs4FxmKkqAMcZuBvXcdM+QdiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfWwNqaq96AQvtO8SPXLWfaGRBnlW1WZ9JinMR5cTEw=;
 b=pqxNX7G41ofmIw6v0ME/Tkpu1U6n4U5hXQZYFQlpShO0yaNFZ0I/CuNpS46IfhoWQJNAOypKxFr/tl71n6OmsH8HE5O+gaVAhW2Gfdgxcm7Z0o5719OqOboMnf6ueoE+spIJNrwi00chmaZmEiukVGRaNcBEL2eMP2tGpfeubVEcs2b8P9741Widc40/VlkoGwMAmZl18+ZdVFDs5+bSzQsd003iZCZlwl1GCOe5Nt/OjA3vZ0edEJmu7h6+NLOJJHvZdGFAS8O+z3Ojma83xHPh2pq4RDMxzjiTp6kW+SWIOJYmObRNXoHin3+k3yqSgQJTRiMBTUjPT6FcWpGz1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH3PR11MB8095.namprd11.prod.outlook.com (2603:10b6:610:154::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 09:51:18 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.9031.012; Wed, 13 Aug 2025
 09:51:18 +0000
Content-Type: multipart/alternative;
 boundary="------------g1HiTFqHyYpvKQcMbeZLh5fT"
Message-ID: <7aa74159-a9a8-4ca7-9635-a806c57bf7f4@intel.com>
Date: Wed, 13 Aug 2025 15:21:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] mei: late_bind: add late binding component driver
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>, Greg KH
 <gregkh@linuxfoundation.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>
References: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
 <20250710150831.3018674-13-rodrigo.vivi@intel.com>
 <2025071611-decode-hastiness-df63@gregkh>
 <CY5PR11MB63666310C54B48FB3624D9E0ED56A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2025071603-guide-definite-70e3@gregkh>
 <CY5PR11MB636646E936C800D689BFBEEBED56A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2025071619-sterile-skiing-e64b@gregkh>
 <CY5PR11MB6366AF03A73910CED71C7E37ED5BA@CY5PR11MB6366.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CY5PR11MB6366AF03A73910CED71C7E37ED5BA@CY5PR11MB6366.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA0PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::11) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH3PR11MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: 61de01f0-47b5-4c7c-35e1-08ddda4ef333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnpIcVpxYjl6LzE0TFBENlM4L243Qy9KWXZxV2NjdnlSSjltNlVCdEdZdWVa?=
 =?utf-8?B?enkwUUlaK29HM3dOZFVlQWxWazRZdVI1UndVMVNjRmNkU3daSk5aZUg4MGxo?=
 =?utf-8?B?Ly9rSlVubFJacndDNE9PZEhUUEt4TTQ0bk91OVQyekdBcUVDSGx4eUExREFi?=
 =?utf-8?B?MXJwenhnWXUxRFBvUXAzV0xEZG1RL2NqYWpvWTdGcXRWU1p3bWtObVpETWJu?=
 =?utf-8?B?eWNST2tzbGhOREFOWEMwczZYZzMvR2I3aXVSUEtsclp1RUdQcmRyMUg5c081?=
 =?utf-8?B?MVlRcmduNHJseDdZN1BQMkg1TGhTVUd2dHQ3RHNXLzhWOUx5R29kY205QnEw?=
 =?utf-8?B?RFJnazdvN0dPR0w2UjZkeUtFNE5mbm4zUU43WUxIMkFkUEwwSW5sdnp1cFhC?=
 =?utf-8?B?RFpuZnBXZW5vTExtWk1FNW42Qlc2bE5Ma1dsM1J2UTByVzg4Qi94eU1iSVpR?=
 =?utf-8?B?N09hZFRDemtqemo2QzYwNUV0YjlsQTVyWUVKbVVlRk1mR1hmMlhkaXA5c2Yx?=
 =?utf-8?B?d3M1dnEyL2c3T0c0MmF0UXZlS1FjR2JENGZtWGZsSjZFZWJSQWZ4NXdPbXBy?=
 =?utf-8?B?RDlDcmJ3QnJvUGw5NHdBOGwvRnRZVXBHUytvQ0VvS05mNll5Z3B1MkRNQlpB?=
 =?utf-8?B?a3BhTXlmeWpWazVDeUJKVUVqSmJlaWFrRGVOSGE1cFFkbEZBVmRLT200SzNw?=
 =?utf-8?B?bHUvRW9rcGVuaHU2YVZVbEx5Rlo5OHJXcjVxWmI2N1piTjVHdmF1QjdyMEs2?=
 =?utf-8?B?dlI2Rld4KzJZdFFpZkNDM25UbVVGM0xIV28vdDFmeHhnZmZpU1JLUnFIeFVr?=
 =?utf-8?B?VkgxK2VCUllHV0V2QW5kUlZtNEJ0dU45N2xoWHZDRm5sYjJST24rVExnZ0xz?=
 =?utf-8?B?OWdjUndMQVZrQjc4eXVLcWt6NWJSbGp2N3cwbjQ0RUowdVRUOXd2Ty9nbGRP?=
 =?utf-8?B?WlpWRVVvaW9tS3IvVUxrVFVSR05pbVI4UjV5SmJ5MmxPR3ltTWtQeVh0THpU?=
 =?utf-8?B?MlFiT2syUDRlUENnYmNYOVRwckhZb1Zka21kTTliQzNNU0NPSWNYb09DSWFt?=
 =?utf-8?B?b0swVnBINUFpbGZhb1A5cVZMV3N6emRtajgwbVVSYWlFNCtva2FWeHNQdW05?=
 =?utf-8?B?N0dISzhPamdZM0RydUJTWkRLbSsyVVRBcmlOYktQNVNuMk9keTlXbzBRQk9r?=
 =?utf-8?B?ZFpJWFdyMWJ0ZXhqbFNJWXNMcWVVODBNa1c0QVZyRmN3MTY4MHVBTjhVZnZL?=
 =?utf-8?B?cmhMMDk4TkV3TUtJMDVGeHQramVNSnZmNXl0R21mRjBaUXZRUGFnUmQwZDR6?=
 =?utf-8?B?RXFHVUdtTFBBVXhoSDhjT05DVHhHREtRSDhkRWV0OE81RXFmTGt1TjViTmhU?=
 =?utf-8?B?MzM1dWRoT005NnBoS0ZyeHZla2FVR3hUTWJhVVpYRExyek9HL2xEWDRVdWFB?=
 =?utf-8?B?L0ZjQ3RyT1p6eWdodlE1aFBZbkNjTXZ5SGU1Ykl0a1A2VEZneUNwbk43c3Ax?=
 =?utf-8?B?bnJRczdET09WQzZsV3FuRGRvdlZpM1c2Ylc5WmRKdTNwZ3pQcXdNV2NmbnhK?=
 =?utf-8?B?a01zbFdXQkxheDQxcjlhNWZIamdQQnVFK1BhUWk2eitsMXZ0M3ZkanR2TXNh?=
 =?utf-8?B?clJLdmtmTjlsK00rUi9lS1JmbFZrR1NiWlFjSUNjMTZiWVlBamtmVSt4dDZU?=
 =?utf-8?B?dW5TTDBLUFpWVGIyY0RtMG5FZGdwNFZOUkZqSWNTRXlHQzdBUEhqNVM3Mzll?=
 =?utf-8?B?b3BWRWRTUjQ3ajRaelFId25NOVdhd0YvWm9WV1VPRHZ1VWpxcHNDMUZFMlE5?=
 =?utf-8?B?V28yb2FXZ0VwMFplcTJGRjdaYnZ0ZTN0Rmg4NkhlYVJyU2NhT29qaVhHQmwr?=
 =?utf-8?B?TUVWR1l2T3E2NUNCVSs5Q3pNK2gwanpjZTZKdHA3cFh6MWV5WTlPN3pPNjVo?=
 =?utf-8?Q?NaEp1bqIYIk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHBmU0habkdkU3d0YXRFVDhFUHRnYUxMejcydWU4Z3RlQitLQ0oyOWZBU0xK?=
 =?utf-8?B?eE1ucG5PVnFFMW9QblpqVjA1SjM2VjU3bTlsOHd4YWxteFdSQmtsQzJMTlQr?=
 =?utf-8?B?ZXYwME9zWWVibUdXUThpWDI1WE5rc2I3V3VUWXNia09mTDdWT1NFN0hRSjB6?=
 =?utf-8?B?cm5RZGZlcW1Ud09CWlIxY3FWdzhCRCtIcVZDYmRyemVMQWpkWUwwM3Bua1hY?=
 =?utf-8?B?dEVjL09IYmJZWkZBelEzVmJNa0pjNHlpWm5QVCtwN0R6eU05NzRMMjdpSVhv?=
 =?utf-8?B?a3hHWG56Rll6RzgwNzdxcnpoQUU5RjBwZW9CbThwbWFna092Tko3OGM3WkEv?=
 =?utf-8?B?bnJPSy9rRG45Wk51c2dhV09hT24wdFZ6bmdBUnFKcTYxTkl0bmthOHpOckdF?=
 =?utf-8?B?eGc0VkFxdnhoaE8rbjVPdnhRWUxUWW1GYXc3MWd0UzhpNlN6UmZiQUlpbnlr?=
 =?utf-8?B?bEVwTjVYdVE1UWp4Y1pIenlabVBWa2ZxR0xCSWJvMTFFcGRmOGYxbUo3UjQx?=
 =?utf-8?B?bmZIQU5wa3ZFbGMrWXgrU0dqcFU5eFBkMDBTQ3BiNVNtQU5KS0IwcVdyamxO?=
 =?utf-8?B?c1EraTA4QVpyNTdKYlVGZXFDMmk2WEtIekQyS2FIbkxTTE1WMmZRUHJDSElp?=
 =?utf-8?B?ZXlTdzc0UU5tQ2tycVdRcy81YzJlS0FMY1JNdXZ1QXVJNDRXRmRBa0d4RTdE?=
 =?utf-8?B?d24rR0JHdFhtMkt4QjdGRXQrUWQvOTVjL0NsanhiVE10aS9nT1NISmJnSHl1?=
 =?utf-8?B?aEpTUjBDZVlOc0NOcVpVeWlXcm1OeUltU2IrNGRoSXM2emRSR2hlcGg0OHFs?=
 =?utf-8?B?dGl4ejZxYjBROEdBKzBxNjgybkgzNlZjWnVzRjk0eDN6NUJHWDFvL3U0YkJm?=
 =?utf-8?B?ZmxDUmFYek1DMm4yZVR6dndFQW9xMUsySzVyL1ZvekJQTEJVVzhNZklLNVIv?=
 =?utf-8?B?RHUwRWtrTE8zZ2VzVlp1ZS80TVFOLzFYT2VwcTM0eHZuRUR2QW5pT3VReWt0?=
 =?utf-8?B?ZkxseWdlcCtadW1HeXpGdlAwb281NDJNZlZmeXZiQlBMZGI1RzkyRWZacWJv?=
 =?utf-8?B?VTY0V0JpNEV0akEwc0FIRnJMOEZpWit6blZRak1nY2pzb1M1aTFLSUFDVVRO?=
 =?utf-8?B?UE1sQkN5eDlGSkE1VVZwME9iNmpsYkdHNTUzR2lBc29FZU9aMmlsa1pQTno5?=
 =?utf-8?B?bFFBWXhEZjA0enRYTjNxU3FqZFl4ZlZsZjFHWDJjeHdoUnVNUmhIcVF5SXox?=
 =?utf-8?B?TmgwRmtkVTVoemdTN0g0czFhU0ZMSmVqWTI4aHM2eTkzV2kvQ044TUtBUDNB?=
 =?utf-8?B?UXhaSnZ6M201L1FaQ2ZKWXczMndvbTlTNE9zTnd2eTlKOFJyNlhZUGtyMkMr?=
 =?utf-8?B?UHQzUXlnNVNXb2U2MnFTSlJGby9OUytBM2gvZnRJQkZaQ1BUY0Q3ZDdTWjRX?=
 =?utf-8?B?NWZmeXpnL0cvMlVrUVIrTW9ibHlFdDlQZHRJWHhxMDZWclBGYkNkTGl3c2dG?=
 =?utf-8?B?SXMxa293enhMY1VQcTVoU0R1bDVIaDJJUWsvWEJrejVWY3VUREw0WC9lWWY1?=
 =?utf-8?B?N1RISi9xanUwUURZMVFZN1A2ZjhXSEwvbkRPSkpYQmlZbGF5VWRMUTdXaFYv?=
 =?utf-8?B?QmpMajNBcVo3eW1wVy91VnpPbHo2U1FJNUdnRnlSS3ExamQrd1hUN3owS1hx?=
 =?utf-8?B?NmRYVEdBTVM3QXYzcStOaTZOa1dLL0lCbWhjQnJVOUVjYkkxbVF3OG1wVDhY?=
 =?utf-8?B?NnVZaEFiT1JLWWxxOEFKTlpnWXcyRHRXZjQvZDM3c1lueW5MWnJJdHhjMlRi?=
 =?utf-8?B?bHJMRE9PY2hzdHhheGtMQzNGU2pIZklkTnhMNExFN2lCTGlUbW5FTXlaOEtE?=
 =?utf-8?B?dG82bGR0RGNWa28wbnFhb3NRbmhoOXlUSm8wMm9Cb0lFRnZ6OUVZeWZsVEVi?=
 =?utf-8?B?RzUvSjRSKzdZQkNhNUQwL05RRURpNTN4YkIwVUNCS2dmbXJIQ3crc2hFU2ZX?=
 =?utf-8?B?enRlQ2tGbTdabC8yTEZsZWNVREtRK2xtSzZuMnhjTWRmeEZVamRlL0UwbUVV?=
 =?utf-8?B?MlZtUkF4cnNWVFd1Z29xMHI5SWNTelpnbjdjWHVmZWVDOVdhQWtsR09xTk4w?=
 =?utf-8?B?Ui8yVjVkbFY5dFRaWTI5aVVoelJuUVhPS0xKUE1GNVBCVTNDWjI1aWR5dzlR?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61de01f0-47b5-4c7c-35e1-08ddda4ef333
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 09:51:18.2527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjEyLSxznZ1yCHySSw2l7iKFqcXamxUupzaqWcO/aiOKvvYXOX3hiUZdN0gqfGfiZUBcxcAmViL6mpVJyj378w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8095
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

--------------g1HiTFqHyYpvKQcMbeZLh5fT
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Greg,

On 27-07-2025 20:16, Usyskin, Alexander wrote:
>> Subject: Re: [PATCH 2/9] mei: late_bind: add late binding component driver
>>
>> On Wed, Jul 16, 2025 at 02:26:26PM +0000, Usyskin, Alexander wrote:
>>>>>>> +	if (bytes < sizeof(rsp)) {
>>>>>>> +		dev_err(dev, "bad response from the firmware: size
>> %zd <
>>>>>> %zu\n",
>>>>>>> +			bytes, sizeof(rsp));
>>>>>>> +		ret = -EPROTO;
>>>>>>> +		goto end;
>>>>>>> +	}
>>>>>> Why not check this above when you check against the size of the
>> header?
>>>>>> You only need one size check, not 2.
>>>>> Firmware may return only header with result field set without the data.
>>>> Then the firmware is broken :)
>>>>
>>>>> We are parsing the header first and then starting to parse data.
>>>>> If we check for whole message size at the beginning we'll miss the result
>>>> data.
>>>>
>>>> You mean you will make it harder to debug the firmware, as you will not
>>>> be printing out the header information?  Or something else?  The
>>>> bytes variable HAS to match the full structure size, not just the header
>>>> size, according to this code.  So just test for that and be done with
>>>> it!
>>> The CSME firmware returns only command header if, like, command is not
>> recognised.
>>> This may happen because of firmware bug or for firmware is
>> configured/compiled
>>> that way.
>>> This seems reasonable for the complex protocols where firmware may not be
>>> aware of this particular command at all and have no idea what the data size
>> it
>>> should send in reply.
>>> Printing result from the header will allow us to understand either this is the
>> firmware
>>> problem or driver sent something wrong.
>> Then make it obvious in your checking and in your error messages as to
>> what you are doing here.  Checking the size of the buffer in two
>> different places, with different values is very odd, and deserves a lot
>> of explaination.
>>
> Is this addition
>         /*
>          * Received message size may be smaller than the full message size when
>          * reply contains only MKHI header with result field set to the error code.
>          * Check the header size and content first to output exact error, if needed,
>          * and then process to the whole message.
>          */
>
> and remodelling error messages like "received less then header size from the firmware"
> made it clean for people not involved with our firmware?
> I'm too deep in this to judge the wording.

I'm planning to include the following code in the next revision. Does 
this change align with your recommendation?

    +      /*
    +        * Received message size may be smaller than the full
    message size when
    +        * reply contains only MKHI header with result field set to
    the error code.
    +        * Check the header size and content first to output exact
    error, if needed,
    +        * and then process to the whole message.
    +        */
             if (bytes < sizeof(rsp.header)) {
    -               dev_err(dev, "bad response header from the firmware:
    size %zd < %zu\n",
    +               dev_err(dev, "received less than header size from
    the firmware: %zd < %zu\n",
                             bytes, sizeof(rsp.header));
                     ret = -EPROTO;
                     goto end;
             }
             if (mei_lb_check_response(dev, &rsp.header)) {
    -               dev_err(dev, "bad result response from the firmware:
    0x%x\n",
    +               dev_err(dev, "bad response from the firmware:
    header: 0x%x\n",
                             *(uint32_t *)&rsp.header);
                     ret = -EPROTO;
                     goto end;
             }
             if (bytes < sizeof(rsp)) {
    -               dev_err(dev, "bad response from the firmware: size
    %zd < %zu\n",
    +               dev_err(dev, "received less than message size from
    the firmware: %zd < %zu\n",
                             bytes, sizeof(rsp));
                     ret = -EPROTO;
                     goto end;

Thanks,
Badal

>
> - -
> Thanks,
> Sasha
>
>
--------------g1HiTFqHyYpvKQcMbeZLh5fT
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Greg,</p>
    <div class="moz-cite-prefix">On 27-07-2025 20:16, Usyskin, Alexander
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CY5PR11MB6366AF03A73910CED71C7E37ED5BA@CY5PR11MB6366.namprd11.prod.outlook.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Subject: Re: [PATCH 2/9] mei: late_bind: add late binding component driver

On Wed, Jul 16, 2025 at 02:26:26PM +0000, Usyskin, Alexander wrote:
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">+	if (bytes &lt; sizeof(rsp)) {
+		dev_err(dev, &quot;bad response from the firmware: size
</pre>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">%zd &lt;
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">%zu\n&quot;,
</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">+			bytes, sizeof(rsp));
+		ret = -EPROTO;
+		goto end;
+	}
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">
Why not check this above when you check against the size of the
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">header?
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">You only need one size check, not 2.
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Firmware may return only header with result field set without the data.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">
Then the firmware is broken :)

</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">We are parsing the header first and then starting to parse data.
If we check for whole message size at the beginning we'll miss the result
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">data.

You mean you will make it harder to debug the firmware, as you will not
be printing out the header information?  Or something else?  The
bytes variable HAS to match the full structure size, not just the header
size, according to this code.  So just test for that and be done with
it!
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
The CSME firmware returns only command header if, like, command is not
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">recognised.
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">This may happen because of firmware bug or for firmware is
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">configured/compiled
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">that way.
This seems reasonable for the complex protocols where firmware may not be
aware of this particular command at all and have no idea what the data size
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">it
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">should send in reply.
Printing result from the header will allow us to understand either this is the
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">firmware
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">problem or driver sent something wrong.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Then make it obvious in your checking and in your error messages as to
what you are doing here.  Checking the size of the buffer in two
different places, with different values is very odd, and deserves a lot
of explaination.

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is this addition
       /*
        * Received message size may be smaller than the full message size when
        * reply contains only MKHI header with result field set to the error code.
        * Check the header size and content first to output exact error, if needed,
        * and then process to the whole message.
        */

and remodelling error messages like &quot;received less then header size from the firmware&quot;
made it clean for people not involved with our firmware?
I'm too deep in this to judge the wording.</pre>
    </blockquote>
    <p><span style="color: rgb(66, 66, 66); font-family: &quot;Segoe Sans&quot;, &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(250, 250, 250); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">I'm
        planning to include the following code in the next revision.
        Does this change align with your recommendation?</span></p>
    <blockquote>
      <p><span style="color: rgb(66, 66, 66); font-family: &quot;Segoe Sans&quot;, &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(250, 250, 250); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">+&nbsp;
          &nbsp; &nbsp; &nbsp;/*<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; * Received message size may be smaller than the full
          message size when<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; * reply contains only MKHI header with result field
          set to the error code.<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; * Check the header size and content first to output
          exact error, if needed,<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; * and then process to the whole message.<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; */<br>
          &nbsp; &nbsp; &nbsp; &nbsp; if (bytes &lt; sizeof(rsp.header)) {<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dev_err(dev, &quot;bad response header from the
          firmware: size %zd &lt; %zu\n&quot;,<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dev_err(dev, &quot;received less than header size
          from the firmware: %zd &lt; %zu\n&quot;,<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bytes, sizeof(rsp.header));<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret = -EPROTO;<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto end;<br>
          &nbsp; &nbsp; &nbsp; &nbsp; }<br>
          &nbsp; &nbsp; &nbsp; &nbsp; if (mei_lb_check_response(dev, &amp;rsp.header)) {<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dev_err(dev, &quot;bad result response from the
          firmware: 0x%x\n&quot;,<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dev_err(dev, &quot;bad response from the firmware:
          header: 0x%x\n&quot;,<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *(uint32_t *)&amp;rsp.header);<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret = -EPROTO;<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto end;<br>
          &nbsp; &nbsp; &nbsp; &nbsp; }<br>
          &nbsp; &nbsp; &nbsp; &nbsp; if (bytes &lt; sizeof(rsp)) {<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dev_err(dev, &quot;bad response from the firmware:
          size %zd &lt; %zu\n&quot;,<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dev_err(dev, &quot;received less than message size
          from the firmware: %zd &lt; %zu\n&quot;,<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bytes, sizeof(rsp));<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret = -EPROTO;<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto end;</span></p>
    </blockquote>
    <p>Thanks,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:CY5PR11MB6366AF03A73910CED71C7E37ED5BA@CY5PR11MB6366.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

- - 
Thanks,
Sasha


</pre>
    </blockquote>
  </body>
</html>

--------------g1HiTFqHyYpvKQcMbeZLh5fT--
