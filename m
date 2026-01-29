Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMkwCP+0e2neHwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 20:29:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5152EB3F85
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 20:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7251910E341;
	Thu, 29 Jan 2026 19:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlUIABqB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0CA10E2AB;
 Thu, 29 Jan 2026 19:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769714926; x=1801250926;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=T+yrggyJG+eE8sSm4RhI3oMnmRvvFsgnX9SMVSACJPk=;
 b=mlUIABqBbYZNvRrgJsFBFZIlGiHzxeXfMdbcOSHuvOl+IZns6Vq8hYXz
 r82Z5K9tnxqbOWJvj7C54ya5fkhwo2qIJznyZv7cnHEJMiSj6z2EpIgNr
 hwAUJzP1w5GSuRbapaPCJKXjwuH6haXkhKxZbZuA8CFzzd07Kja+ImIfr
 Im9yqiEPtEYGtOqXtVVHg9djHAJZPxb1zGKjeFXQ0Ns2Wt/CElBukU1X9
 ODJY9MiOiBO8IBwS5jvw4onf6xeKusF4MRv6o6KFi9Uhq1dO0Y+wRDJ8g
 gxfMjMy/GtcEmelorLqs2St6LJz8j0APXDT7yY/8rqS4OlAdnw3/HchUe g==;
X-CSE-ConnectionGUID: +WVbqjipSc22R/NevcKoNw==
X-CSE-MsgGUID: X0VVtJUWTIq5jekftHvppw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70165484"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70165484"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 11:28:45 -0800
X-CSE-ConnectionGUID: o3neulDPSQGmkyRtg0KkNg==
X-CSE-MsgGUID: ATHrINVUT36N89lJ5w1lBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="207785233"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 11:28:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 11:28:44 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 11:28:44 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 11:28:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xj8YRHYDLajQuSR71/s8wczCe0sNXm99tIJMA06G0jCdMoQVJDrCdvSxot4hFsx+C1QwAajyStNT1mrb9A9MBQH3H+oIWUP80SHgIEXpG0X3I/qwPZtJH4HB+ETmDsZiFguf7Esu67VhMxgRwZu2PcDn2KoGX/zQ1jC8FGNaTtepfnFUI4cC/mPmhUbd61dqM4W85zHTZE+FeBQnrD0LycZCo0G5xQhrE9jZapARrxv4vYt0gOaG7f7ZxoaMv5MjDmhxg754VYNw7k2ROVA/1Lm4n4ZqZynF2kpKixZPHTLWvvLs2qhJi+hwpqLuQu1Hk1FsdE2qQ+tA0xWm1sbAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btvvRPgZbROXYaLxAcZdRHkXbntob0PA4Ql3MmxR0IA=;
 b=TiC9Kt/6Ew8YmhS1Y/EkAc0+xdLn6IMXbVcZe/RaY8K++47JsbapJOP1MVECMkFjhqS47TNypGVmwawm4gBzmGnnozCkjvo4Aw7J1BR/xT+6DoFqUMIbEWDjjV/QHJFRru9tdBC7t3ndHVqE4cove5bR6QPBsl3hzlgeUP3WuoPHdLQCwQrB0tfl/7i7Lp0ayhyq9EbVeg7EYj/xNNKE6FjGJGRFTZb9V8Uk5V9X7APGIulHB7MVjkPlWuf9ySkMsq/aNV+mTrc3LHvCgL94QkDI7hj79vQirQLX6uX0EZkxYhIp1NEPT7dRa+l8MQMW1c1ZCw2SUgujNFICxHSC9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7741.namprd11.prod.outlook.com (2603:10b6:208:400::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 19:28:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 19:28:41 +0000
Date: Thu, 29 Jan 2026 11:28:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <leonro@nvidia.com>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH v3 06/11] drm/pagemap: Add IOVA interface to DRM
 pagemap
Message-ID: <aXu05pVbw8EbkRZX@lstrano-desk.jf.intel.com>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-7-matthew.brost@intel.com>
 <20260128151458.GJ1641016@ziepe.ca>
 <aXpYrfUmEaaOsse8@lstrano-desk.jf.intel.com>
 <20260128193509.GU1641016@ziepe.ca>
 <aXpwecQRovIurYKV@lstrano-desk.jf.intel.com>
 <20260129185731.GA2333318@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260129185731.GA2333318@nvidia.com>
X-ClientProxiedBy: MW4PR03CA0321.namprd03.prod.outlook.com
 (2603:10b6:303:dd::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7c987c-0b49-4e17-4f29-08de5f6c9c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGtZWHZUVnVsNGF0SmlkSlYrU2l4ekNDOXhKN2hYR25XZXpTSkxMSUFlbjRQ?=
 =?utf-8?B?emFGZWQwQk1NYzkwdlR5Vjc0UktLamd4WU1JK1NSUk9qWW1Yclp6WmYyYlVx?=
 =?utf-8?B?Wk1rT043T2xJcTFTTkNEa3NEbjM5a255Z0IzdUJnMEpCZDI0L0E3QWtMS09E?=
 =?utf-8?B?SGhrblpWTDBkNG5CUUpZMjNnOXlyT0RCK0hUelNFV1Q2SElBRHM4Q3ZzM2dv?=
 =?utf-8?B?dTJYVStXZ2dXeTA4UTc2Ni84d2JqOThHYWJxdlcrVm5TbjBxNTkvRVgyUEdD?=
 =?utf-8?B?cTQveXRTWnVpeWNWdEVOSFpoY0ZMaGpDQlp3NWsyTHB2aFhwZUZSRkk2ZXhR?=
 =?utf-8?B?VXRxcVZOTFpZNHllMkkzTC9mR3VEU1pBM2RMUmdHenMvc1dXZDBsaDRaMmJ3?=
 =?utf-8?B?eFJXOWY2ek0zQTh1M2lkMXJMZW03SURaYnlyeUFCM293aVNFZmFMRVpGNzlu?=
 =?utf-8?B?ZS9mZWY1Rlo2MUFjSnJucXcyV2w0YVo1K1pnL2FRMG1UTWE2VkFTYWpnSGhq?=
 =?utf-8?B?WVJuelJWL29WNlN3QjRIQVMyajZqaDcvOGRoMTNPdUdRT2o2azU0MVZHZW1w?=
 =?utf-8?B?NjBCcUZtaUZtUXFqcVgzZVhOa1RUWlUzc1NldFpjVzhhMVQ1Y2RYbXdmYTFC?=
 =?utf-8?B?bXF5SzlLZnQ4VmlUTDFYbk9veTBwZm1hRTFMbFdnbHUwS1NHRm5kenFoTWtv?=
 =?utf-8?B?TDBiQktiS1hneVZUYlZrMkZSTlZXRkVHN1BySnMwMVRkdnNtbXVqcVFzaGdM?=
 =?utf-8?B?bndBSU5mekJCMm5qc250ckM5Y1VuekNBQTB3dTFjN3JyeWJqelBnN3A3aEw4?=
 =?utf-8?B?VlN6UFNSV21lYmlZUzVVQXFqRVc5ZEpmQ3R4SWtwMWEzWHhUN3huUUM4VnUx?=
 =?utf-8?B?YXJ2bGtDUXRjOFd4ak1BVFRWMWQxWmE0MlEvZTFMdTY0Q1F3cTFycThUaXp4?=
 =?utf-8?B?dDk2bWdrMlprek10cEZmeWFNRFNWQ0hMdEtNbEFZODE1WVdpbmRPSno5OEQy?=
 =?utf-8?B?RHFsRTJSK2s4N1JnTUdydWllZFNBT2xXbzZCcndySmd5OURDUXVCemVHdnJ5?=
 =?utf-8?B?Rk5JU2FSKzRZZFhkS2JkVlBlcE8xODZIem8wakFrUDVheUtIcnlZUGFTV3pa?=
 =?utf-8?B?UEZmOW5mODd1ZHh0NnZlSnk4ZlVJSGNsL1U1S2pWOTdlTmdNTjZZbjBaL1hr?=
 =?utf-8?B?Q1pQRU9wZ2h2cnpMdldPSitTc2Q2VzZEU3J0SVlxWk1YUWdUaG1YdldUTkZi?=
 =?utf-8?B?QWsxdmQ5Rzg4a2E1akdKSW9BVFpsdXZwVnhRUCtLM3RkNkQxazJBNkdaaHh5?=
 =?utf-8?B?WFBVOEVCS2dnSjd4WVJHM2dVMFBoTFViR3pYYWNnYzVvUGU1RFJhcFBhVG0x?=
 =?utf-8?B?YUNHUXVoRjllVzRQOHVGanl4NWtnMmhDWXlhcllwMnFrUVZBSytrcks1RUFR?=
 =?utf-8?B?N2plck1naTFxQ2F6ODNpSzJqT1Yvb0NTanhCU3RtTzg1bVdJYXZma0xxc1FS?=
 =?utf-8?B?S0JpbW5PWXgxL01aMXZMZkdaZWJqNTZhYmlnR1hkU0xNRWJGVENKWTI1YXJS?=
 =?utf-8?B?dUx3OGJXb0hRaDBIU3d2Ym96V0lMYVVtaVJVY09lbWo4UmJTNkNyb0loZzJ0?=
 =?utf-8?B?ckwzTU1lRWxhZ3FLc1kzbDBDSHkxL2EyRFJzU3ZPM1FvdXo3OU9yWldRUk1I?=
 =?utf-8?B?SG14aGhhTUVBMStKeXRXVXhEdENsWk9YWU12eVFNK2xsMFEyQzZseVlZMk5T?=
 =?utf-8?B?L00yTzNMenBHZVRocitJNWN1Ry90U2svNGNQVHJFUnEzd0s0QVpTYzA3QjhP?=
 =?utf-8?B?S3Frekg2UzMwZFFuRFErUmNvQUJlN2svZS9lajljZDZrUXhNT3p2T2E4TlMr?=
 =?utf-8?B?WHZGenpqS3orK1daRDZPUkYvLzl0SVFZZCtubDlubXdJZmlVanMwdEdFUHZV?=
 =?utf-8?B?WCtnYmtuVmQzNnNlYjhrb0k1L1dwVnJEaitzN0IzNXA4UzZjWGg5b0R2NFl4?=
 =?utf-8?B?WXR2RWNKbUhYNTg3bTVCOWRwTFd1VVJlUUpWSGsya3dDdU1KZVI4RnRrTlRt?=
 =?utf-8?B?bVFKdmlLTW92bFl0OGdIY21QZU1zRUg4b3lPa0tOd1NDWXB6OGdxWnc4UVU0?=
 =?utf-8?Q?IJ/0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmE5Q3pTekIvaTZ3ZlUvV1ZLcnovVkFYR0g2TFBTQTF5VFE0emZudXY3U1lW?=
 =?utf-8?B?Nitid0tPZ29RSGtoYm01RUZ2N2pXZ0h5dDJaTHZnUUdoYjRPWGloV1o3WTRG?=
 =?utf-8?B?SHh4L0hRRFhZK3RUZkRxUGtLTElPbmkybWZRRWJhVXhoWVl6NHpZcDZ5K2U0?=
 =?utf-8?B?a2hLc3pMY3YwK1lGcE1MZWoxVzRHZFdQRS9Rd3hLMVVTNEtINVNhbXdiM29W?=
 =?utf-8?B?WkdBRUErVlE0MklhOUNCK3pGcHhSb1AvVzM4RVhHVTVaZXJBd2pJalpyQ3ZZ?=
 =?utf-8?B?TE03LzcyL2R6TnVjTjFjUXlRWm5yNzUyVFBoNU1vb1JCNFQ1OEhpaHV2Q1E3?=
 =?utf-8?B?V3JqVFZ1eVhNekdpdGxKQmk5NUw1bDNZVDRrcVFWdDIzS1F5TTl2RXZEZjRR?=
 =?utf-8?B?L3hIRWhQOTBWbnJjdWRoNFg0K0E2dmt0OXRJMFJPUVQ2cklBcEprd2RRK3F1?=
 =?utf-8?B?MEhmaUZlSUpPTkp3Ym5sc0VYK0l4TjNuYTdFbVdrVW9paHpjb1l0citYWUM4?=
 =?utf-8?B?c1RmQTNvN1Yzd08xV3FvVGZEKzJia09JNFJodXpwdGFUZXZOQTRzZ0NCQTB1?=
 =?utf-8?B?SnFRWFJESm5RZXNvSjRtOEF2K25pcitacnZoVUo2SktRV1FSR1ZvcW91U05s?=
 =?utf-8?B?bUFPOCtqQ2c4eU1kWE5nUTdHTjh3L21XY1U1alErR1pPakFCcThHVGQ3MFBU?=
 =?utf-8?B?UzhyaGtDMmdjYUcvUmJqUnVtRXlpSWJYYThTekI2WjJEZHpBdi9DKzVVMDJm?=
 =?utf-8?B?eUZQMTVIcVFybFY0OXNRaGplME9BaDRURXVrRG5QN0F3OXRsNE5FQk5jT21K?=
 =?utf-8?B?UDFBTkhTR3R0Rmg1NlBUYUt2dVR5dm5HNUc1OVJsUlZQaTlRakNxSXNVQUhK?=
 =?utf-8?B?MlBVVDM3cjNpa3dMZ2FBM1E1TmlHVUMxYVNwR3pNckhhMHFkWk1MblJyU2Ji?=
 =?utf-8?B?VWcrcXBub08wcGZNZVFueU1DNkd6ekVMcWJzcVNsSzB2RkhManJVS256ZDJR?=
 =?utf-8?B?dGhkLzI5MXVqQlRtdEFpSDJuRklYZDlFNmdWN1ZKcXRYZUlLMVA5RjBud2E4?=
 =?utf-8?B?aDl2QVFjVVFaeXpjbTVYS1RCY29aSmVmTno2SjJ6MjdFdHd2UHJyaVF5eStY?=
 =?utf-8?B?K3NSTUE4SXMyMXB4ZlYvOTN4dEFVWHp2NGtYUEc3bUpYdUMxM3owZFpwVXJD?=
 =?utf-8?B?Wlh1SmltRUw1bXBoZllRV1h3ZHNxK2MzQXByM2l1bzVNZExGajNsaDJGdlky?=
 =?utf-8?B?ZnNDTXYxTGpKamlaSGxmVUpTZW5iU20zR3NQVnNrbDZhbHFJOEM5em5GRkVi?=
 =?utf-8?B?dzF5UnhKRGw2ckQ2a0xwZzREM1NudUd6Q05hZ0FQbHZqdWhsNWd0R3crRGdj?=
 =?utf-8?B?UGREcFN3eE5ubEM2WDZJQzlRNmpraG5IK21aKzdycjVpb0lYK0l5ODJNbEhU?=
 =?utf-8?B?OEdtYWxJakVjZGtSQitHNG9SSXE0MlUvdVlsWDdYdTNSckRZRldaZ3FSbGlh?=
 =?utf-8?B?U2V1TDVnakVzN29TR0lDSWEvSXM1aFoyWk5nZERoSTRza0VEMm53aWx1WVlm?=
 =?utf-8?B?WHpNcW9VaDczQ05KaThBWW1RMzJZZGYvN3gyRGgvVXZqVkg0d3ljb2dRVjQ3?=
 =?utf-8?B?OHhBNUN5MVhRZTZBcE9hVWNIQlo1d1Q2Q0ZYbmtHSEI5VVpoeTZmZG9EZk9q?=
 =?utf-8?B?bU9rUnk4WnpJNDJnNUw2Zm40MkkydDdaRjYyUkVJUHRGRzNhTDZqYWY3aDh6?=
 =?utf-8?B?UDVmUmZSQUpYMkFBYjIvRllrcUxBT04yYVoxazdNQm0vUWtBUDVIOCtrWXRa?=
 =?utf-8?B?U0ZsTUt3cWNFanNmTU1ObjgyWWNaTnhFbUJDSzlXYkVua1loUWtGREgxdW1q?=
 =?utf-8?B?c3dpZWJqS0llbUNaUDE3RS8vank1cDYxeFhjODFwUmJteDhkWFF3R0pPQXNJ?=
 =?utf-8?B?QTk2YjZobndvdlRaVVFHczhyOXM2MGxUbGlnZ2pBMjhNZkluamlFQVB6aVZk?=
 =?utf-8?B?MTAwd3g1WmcvTlFuaHpDLzQwcVhhSHF0VlpUNmMycEl0TlBSNDlVZU5rWndj?=
 =?utf-8?B?Ykp4emFzWmxzL2JvWTJqK0puRmcyTTVSaGY4bStwMSt6TFV5RUNJUmFjV2I4?=
 =?utf-8?B?OEp0RzAvenFxcVB5aFdPeFV5d0xzbnZsNS9EcWJFTjJiU2M0WXBkUnFWS09a?=
 =?utf-8?B?TENMVjN5NitXYkluOVF0Tm5vRnBEQnFJSllxdExUNk1DQUN5WldBRjBlMkdU?=
 =?utf-8?B?TGpLQ2FQMmJWSGpSSUFXVVhNajdFNmtzbllYb1JXYSt3TkRQSW5oemlrcU1r?=
 =?utf-8?B?ZEJHTzNEWm5pZXN1MFpHZGUzT1k4SWFuK3VoamVQOU51bVhaMVFwR0RvYjlV?=
 =?utf-8?Q?plwDVqa7UCu83aDU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7c987c-0b49-4e17-4f29-08de5f6c9c4b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 19:28:41.7962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2bEWDO4YWIfQMcPq/dWTEaWHa6C3bfg7vCt3mNjcCUqqLfnGlbmg/YQHx/Yj8TnPYzOJSURsONFDu/P5109TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7741
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 5152EB3F85
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 02:57:31PM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 28, 2026 at 12:24:25PM -0800, Matthew Brost wrote:
> > On Wed, Jan 28, 2026 at 03:35:09PM -0400, Jason Gunthorpe wrote:
> > > On Wed, Jan 28, 2026 at 10:42:53AM -0800, Matthew Brost wrote:
> > > > Yes, this is exactly what I envision here. First, let me explain the
> > > > possible addressing modes on the UAL fabric:
> > > > 
> > > >  - Physical (akin to IOMMU passthrough)
> > > >  - Virtual (akin to IOMMU enabled)
> > > > 
> > > > Physical mode is straightforward — resolve the PFN to a cross-device
> > > > physical address, then install it into the initiator’s page tables along
> > > > with a bit indicating routing over the network. In this mode, the vfuncs
> > > > here are basically NOPs.
> > > 
> > > Ugh of course they would invent something so complicated.
> > 
> > Why wouldn't we... But conceptually really fairly close to IOMMU
> > paththrough vs. enabled.
> 
> Why do you need address virtualization on the scale up fabric :( I can
> see access control but full virtualization sounds like overkill,
> especially considering how slow it will necessarily be compared to the
> fabric itself.
> 
> We are already in a world where even PCI can't manage untranslated
> requests and a scale up fabric with 3TB/sec of bandwidth is somehow
> going to have address translation too? Doesn't seem reasonable.
> 

I don’t design hardware…

But inter-OS security wants virtualization. In practice, intra-OS (what
we’re talking about here) should always be physical, but it doesn’t have
to be. Thus, IMO, any common API we come up with should support all
conceivable addressing modes that might be implemented.

> > > I'm not convinced this should be hidden inside DRM. The DMA API is the
> > 
> > 
> > Well, what I’m suggesting isn’t in DRM. A UAL API would be its own
> > layer, much like the DMA API. Of course we could stick this in the DMA
> > API and make it high-speed-fabric-generic, etc., but I do think the
> > fabric functions would have their own signatures and semantics (see my
> > explanation around device_ual_alloc reclaim rules, what locks it is
> > allowed to take, etc.).
> 
> DMA API is already bus agnostic, I think there is no issue to plug in
> a ualink_device or whatever under there and make it do something

I have thought about this, which is why our idea was to roughly duplicate
the DMA API and layer it almost exactly the same. My only concern would
be the semantics.

dma_iova_alloc() ← This is reclaim-safe currently, AFAIK.

ual_iova_alloc() ← If this allocates GPU memory for page tables, it is
basically impossible to make reclaim-safe (i.e. call under a notifier
lock), avoid dma-resv locks (i.e., call in map_dma_buf) without
subsysem-level rewrites in DRM for allocating memory and driver-level
rewrites of the bind code / for Xe, Nouveau (likely Nova), and AMDGPU.

Then of course dma_addr_t now means something entirely different from
the original intent.

If we can work something out here, then yes, maybe we can just use the
DMA API, as I believe it should work aside from the semantic changes and
perhaps minor tweaks to go from struct page -> physical address over the
network.

> sensible, and it would be *particularly* easy if the address
> translation can slot in as an attached iommu.

I'm out of my depth on the IOMMU layer so I can't really comment.

Matt

> 
> Jason
