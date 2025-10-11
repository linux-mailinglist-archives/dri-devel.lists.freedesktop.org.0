Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308FABCFBCC
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA9A10E34E;
	Sat, 11 Oct 2025 19:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvRqGgOF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C17C10E354;
 Sat, 11 Oct 2025 19:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211704; x=1791747704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OB6wJh3i+9Pw2Z19Tr6P7Ixv/3ZbKi10EQ1cai74Bk0=;
 b=gvRqGgOFhDMJWYMx9dpw8v01lmDRYloHLNcVx5gRqp8jkZY6xz3OLl3c
 HOJXuE/gXnrSckNcsdEGqustziXm0HOU2Md8jntge8KP8ahRgYDeutiA7
 63L4/hXfLEjqrelogsGdDQrW+By1NSrfuPOTPBnJZBkoyk9Z5mHHtoGOg
 JOVs3JOuEyXHpyVoKhDuq+TwoacZC5+zHsQYT+tRUdr8VKIq0eWfpjAD5
 aUnW2HqbuxIj5x97ULdOvuzoLk7BAASL9KY+FPIogWq8VJTggtLMrCQHv
 F5/+yob03Lf7yALQoK8aTRhuF2MjzXT5LXw7MeC9rEhtsWR9ntxjL4Dqc w==;
X-CSE-ConnectionGUID: Urc3I7wNSCq5U07gZICUHg==
X-CSE-MsgGUID: 7v7BuXq1SmeG4Ze1SmGCGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="61431615"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="61431615"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:43 -0700
X-CSE-ConnectionGUID: sVPTh8QXT2WQiVQHn66aeA==
X-CSE-MsgGUID: GB7aYeEOQ7+m773OtREJNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="212202686"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:41:42 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+dI0mLt/pe9IUjRTA8p5esQZXjjlbblZFSVSwsRw33iI9wWA1MwzGjmYpurKslOmsBjUl3F81OVGV+yf+UwsxeeUlmYSDzFm+0pDQmgmWvm3g9botPWh1gYjJTL57vNlCUHYdNdc4/EH7GWxNVCRXvFxF59Pc1NlmPSLaJ5bEv5/DZsrT5yVUn1RojQWt0i5mQgTjOKQAwjiOXv87E6zHhUgstLHhna56jniuMBTJMJKbXskIWDsIeOND5kwKDxA4damCffIQwmH5LXN/a06waM+0zoAkzy7VkYeYnrobAkGvB/qk4o7uCWfetJGf4GStUCTGcpgG8n4y+UBfUeIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/5fEFjkwMePosngfTiOrw+gWl/kZMsvaI/ifSjSIXQ=;
 b=avsScF+jxEElDjzhQJYVZ8ib1/3vxyJBHavkOJZmTO8iHSIAnZ5NGotAdFtOlV838FoSECNwvS0bpPRILQO/MIMxnavsihbn26ahH2DBnSGt7YgI+Bm7R6o6poqgbKlxfHaUPUv8A1TjPvMejqT6h4ZhgsCZHtvO4eEgbY7ib3IN1Iw5hVHPqAasbLgW/PJHHAdXh6PEoh3xaZe030K7FlshIj+nm9OdRXUXAr7ugmrLqUtcJVhHmDDPyhgA78V9uzkiNgn9+hWE1CoM523F5S7mwbtMDY0ocKI4bySKDnmNhQ0yLcvnKXhpXLZYAvtgt680KvR1qsTcX1ITRvOpjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW3PR11MB4681.namprd11.prod.outlook.com (2603:10b6:303:57::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.11; Sat, 11 Oct 2025 19:41:41 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:41:41 +0000
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
Subject: [PATCH 19/26] drm/xe/pf: Add helpers for VF MMIO migration data
 handling
Date: Sat, 11 Oct 2025 21:38:40 +0200
Message-ID: <20251011193847.1836454-20-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0141.eurprd07.prod.outlook.com
 (2603:10a6:802:16::28) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW3PR11MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: 25b4749a-9141-472b-2895-08de08fe3347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nk1rRzVxWngyY085UWhEZ3RzSVJVU1dRSWlmWm1xaTZsTmhaMWVkMVRLU0Ev?=
 =?utf-8?B?dkp4OWhSRk9DRUorODZrUEgzNUMzSjNOUE9KM2ZnU0VqVGovQkRLRk5PT3di?=
 =?utf-8?B?Mnk5M21PMndyOXFFN0VSZkhRa05RRGc2SWZqNHZXT3QxeVRvVVIxQXVBL2Zr?=
 =?utf-8?B?MDIxMi9vclVwZjhmSWI4MXpWTXJjS3VxM2xOMTZ0bHdIa0lKOUlaNUJ2VWVC?=
 =?utf-8?B?UFNiSG9VZ3Nmb2JiZVZRakRQYytwL1JvanB0Ujd1bWdhTFZHcWdyNUUwWW43?=
 =?utf-8?B?TDNBVEdxY1dSZytLdktOV3MyRlhReitlU2RCWWJ1UDhLcDgwT3RhNjRRdlE5?=
 =?utf-8?B?VWl0dkd2M0ZTaHRqbEh4Q0hBMUtaVFZZTFVyUjExUm42b1ArRTZsdnlCa3Zr?=
 =?utf-8?B?bFVGaGo0Y3FJR0pKY2NwT3o2c3lNazkvS0Q0NVVJNVFQNFZnSkRZbE04ZGJ3?=
 =?utf-8?B?YXJISm9XOVpFdVQ0VFZLVnBQei96VnhwczF2eVlPRno2UHIrd0h0eXVkYUV5?=
 =?utf-8?B?QWxxbnRJL0FteWI5MXY3MGVFQ2w3VGNvTlBvZ0Q4aUZHanM5SFk1R0tKMlZ6?=
 =?utf-8?B?L0FUOVR5bFhTQzk1Y3VHL3E1TUlWbjdyS09KV0h0RDFZa1NyamRtUUFtd0Jy?=
 =?utf-8?B?Nk5iYURZNDZDaFRyNWNpTm0rOXZhM1R6V1VSWlV1dFdvODQzeHJMa0J5YU51?=
 =?utf-8?B?RStreGQyaVhsRlVBVjVMdVF0cHZLMHZqa2FGVDdvOWZod0xFNUxOTUFpSjg0?=
 =?utf-8?B?NVdsWnNEYTBaTUY4bWIzNDhJY2IvcUM0T2NZRTdpZmtNbnBmcC9Oc3BGb0lm?=
 =?utf-8?B?TVdQKzlSOTBSdGJ3QUdLQXZwb0RNdEZSN3I2S3JKOFdkVk5NQng5aklsc2Zt?=
 =?utf-8?B?TEx5WE84V1FGNkhKWC9ONVNxaGY1eUZZbWFva1ltKzhPelhZT3hJN3YvRm5V?=
 =?utf-8?B?bkpvZDJ0K09haGkzTHhxY3lMUEV3TjR2TEx5WTJuVk5adE55bTBjZXQ2RHFi?=
 =?utf-8?B?Qmo0VElhN3NMVXFlUk9GTTZDbkN5QU1ENWV5eG9xcExZNzJEUC9YNjlBdkND?=
 =?utf-8?B?d20xL0M1THdyeGhLVmNqelZ0cTAxK3ZEekQyOERxOVlMdlVZZEw4UXZ4dGgv?=
 =?utf-8?B?WWpBTFFYUVYwMlNRZHF1dFJ6K1BCL2txaVFMdk5YQ0pDakJzVFZnNkV2LzRj?=
 =?utf-8?B?QnRPTXRQOUgzK0FTNUI1VlBpKzJhOUdoaU1WUEl0dTA0c1dnZ2xvaWFkdkZt?=
 =?utf-8?B?OW1VY3VuZEh6UkFxYlRpemRYRE13WFlHZlBWY2h5ZXZsR3hxSEZiYkxrYnhi?=
 =?utf-8?B?Y3g5NzBtMm90cXlpei93aHhiMDlZVUFyeExicVRQWlh1aUowWjRiL2J4Ti9q?=
 =?utf-8?B?THNKWmVVdktsUXh6UWx6ay9rYnNOa0gxRnVyaXR6RzlpMnFkMTUzdU80Q3Bt?=
 =?utf-8?B?MnorNjY2cU9Fb2dsd2kvZmJ6R25GRTNIOUNJNzBnckxURlJacDFEeGo5cnd3?=
 =?utf-8?B?OWRJVVhHOVZXLy90RHBKVkZLZkZZUXdQczNxWndNNFhvaGwzUmhTZWYyREtk?=
 =?utf-8?B?dXgyRnBQeThqNWh5aXNJNmtwTXhTbW1seW5aS0lpS3hyZkZqbTJmVExVOCtx?=
 =?utf-8?B?T2c2cGpUTjRtbW9QTnV5TnJibEpuR3FrbFRKZldSb1BXWDNZMnFTbjhmZis3?=
 =?utf-8?B?akdxSnlDUThxbVJub0FCVVgxWGwvLzVOd0lnaVJlU0ZncEpkYTB2TU9DV3hT?=
 =?utf-8?B?WmZYdU1VWGtnZGwrdTQvRWFkUThGZDdxOUxuVWtoR2Q3bWxtZHJkS25BVmxB?=
 =?utf-8?B?Q1YzQTRhZWVLandqS1FSRkFxZ1hmZ0xLUFI0TUdQWHdKZ2kwaXlRamJJQk9I?=
 =?utf-8?B?U0NEbXN0M1BybnFOVkd6VXE1bE80aUNKSUJTVVdrYkV5WTF0RDNTODNoMWhk?=
 =?utf-8?B?NHBiRXowV0hrYjhaTGxZYlRmTEY5azFLS3ZadWpac2FsbmV5Yi8xQ2Z3anhG?=
 =?utf-8?Q?lGHow86HmiFy7KzavpdrvV7r2y7Ueg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmNya1VSSUFOQ3lzalRKUkdnVU1USEhVRE5EU2ZzTFVLTnVGZkVRZnNZelhD?=
 =?utf-8?B?WTFaMmtpRWY3cW5MbHRCRmZITG9veWtqM1hWZWpJbDI3VFZ5YWFpWlRPVEJU?=
 =?utf-8?B?TG9HTXBZOWl5ZDNBSjQ5Z0ZJOG4zM1hiRXdZN2c0aFh1RG91TzVWYlE0d3NH?=
 =?utf-8?B?V0RscHFLMjFibSt3U0prcThWcGtvVmRpM241UHFqWjZCWjhYcERwNGlJaFRS?=
 =?utf-8?B?eVBuWVlmUlgwS1NNQVk0ZDFwVURjUEF6TG9tTmdlR1FHNzRpOUZPeGFNNkly?=
 =?utf-8?B?YkZpWHlZZStlWlUxQVZKZUJaV2twUXFmUXZaRlNoTzRXdGRWQzZZYUp3WEZQ?=
 =?utf-8?B?SWVJQ3Q5ZytWOE02TXRuN1V0N2lkWTJtSG0rSUErU1VmdSs0WmdyUFJQOHRl?=
 =?utf-8?B?V28yUzZlNENYL0xSV21RYTU4U2FMVWo4WmlhK0lPU0JFOWdQMVFGYXhqZXpR?=
 =?utf-8?B?NHJhT2grcUJrWm1wRXFrRnFzOVQzWk9CVm5QbzR2THNyM3dwQ0dnaFVybXIx?=
 =?utf-8?B?VkNWY0lRdGVoeVpxWThwMzlUK1hhUWJ5Wmo1cElwc2d1a0FoUjFkc1VGekR0?=
 =?utf-8?B?TkhEL3Z3QWpmeDNsNzlGbTRNQWpKbHRIYUZXOFRkdGFJdWppTGhXQTBBUjVN?=
 =?utf-8?B?MUJiUUhlaWlKYmp0ZGFTanpoZ3ZpMEVmK0hkOUwwK0diZmE3Y05DK1RJUW8r?=
 =?utf-8?B?Z3V3WjFUdjBrN3R6SXlWN0o1bklZbjl3YlhKZ3QrM1JoT084N0Z6a1ZzWldI?=
 =?utf-8?B?WVEvUFJrc2huYTJxamRDcEUwR0tpcElrd2RJMnpEQlR2NVUxTmlPY0N3bFNE?=
 =?utf-8?B?SEUvOXoxZU93ZmJyNW1IYXN0TnFEVDRjVnF4TmY3bWppblJpOEtZcGxySlF1?=
 =?utf-8?B?Sy9zSlZoZ1RWRWM0WlV1MWJkVllwNzJJaGE4NGN3bVNYM0Juc1NNYTVVcXBK?=
 =?utf-8?B?QUNKQ3lmVGt2a2RKT2hPZDN0SlppSXFiUE5BVGF6UVk0MzZpVldpenU5YUQv?=
 =?utf-8?B?R05NdERCZU9iNEtOSHE4ejV3VDNDZEp1T1lrUTIvYlNBTU9OTUhYMCtzbUVL?=
 =?utf-8?B?VEpVRU0yekZFMjdjcjJTMlRNekJkUS9aTFR4S0xhNGxqTTZ3OUswUWhNNnVR?=
 =?utf-8?B?b3I4UDF4RGw2UXNsdnFtRXdUL2xaQXlSN3ByNDZEbThMa0hhTms0cVQ3am1K?=
 =?utf-8?B?T0JDSFh2amh1YmdsQXNLR2RYdTBONDl2MHhxd1JrSDRqRHdtTFFoRFZXOG1R?=
 =?utf-8?B?S2k5ell2cllnT1prc202Um9Td082VVRRSU1MYmZtZGYraXpjYTNwMEwvYlFq?=
 =?utf-8?B?aEhFS1hFeFlJV2dFRHRERFdDNk9Idk9BTThiZnBvTi9aZUI4Um1pTXY4UUhl?=
 =?utf-8?B?SzJDeUJSSml0VlEvaUFRVVFVODNtdVlCQWpFQllBS25xNVlBQnk1eS90cXBq?=
 =?utf-8?B?amFOYXlzUXR6dE8ycVNWWFZJRFFvWit3aFJkc3p5b1FIZExia0pZeVdBUnBz?=
 =?utf-8?B?ZlNPaE9aczg3d2pnendCT0hzSlhkQUs3dkkvS1BOTEVVOWh4UlRKTG9GV1Fm?=
 =?utf-8?B?ZlYrai9XRUJYVmRIM0hucm1KdndXUFQrUHZsbUNPQk52K09QRWNsT0QzNXEy?=
 =?utf-8?B?MUN4eHEzZ1pBVUR6M3lYSm9NYkJsQWZ4eSs3WllWMmkxYkxKN1g3QnRVYXlY?=
 =?utf-8?B?UGI3aEVuUy8rVExSMTdmYUhNWmo0YWNYdW41d215ZWRKbzlja292d2dOZ2Ny?=
 =?utf-8?B?cnFHb1REZy9vUFNhSzJjWjNTZzRsa1RJL2t6K1liSnZzSFhHSlF4YXg3VEdC?=
 =?utf-8?B?c3Yxd3IxZklwaVdkWFNXUmlCK0VwbFg4WDUyV3o1V2FwK0lHVWFXZFZHelNO?=
 =?utf-8?B?Z0k1Y1pMWU9UZHdsendBRGpWZ2ZiR25HS1BnN3F0dVJsWklJRDBpd3N0K3Fs?=
 =?utf-8?B?VzBTelA2dGFXaE0xWUtzYmIzY2RGSDZ1UHFMbHk4OUxwQWh3cWFlMkhmVzZV?=
 =?utf-8?B?NmZJdWtQV3JKdUw2ZlB2NDVGSG8vK3oxT3JjeTZpbXJ5Z0I0ZkxVeGt1TXUy?=
 =?utf-8?B?R05UVmxnanI4ZUw1R3pEcXUrVE9hSGEzcTFkdXdSU3VqUTArSEhkYWIrOWp5?=
 =?utf-8?B?Y1lyb3BMWmNGZmJoNkxrOUFZa3VRRWowUEljZWdMVDB3c2lJTlZhTGRialRC?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b4749a-9141-472b-2895-08de08fe3347
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:41:40.9649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vlg5oYVUWw8sMfRWUqCD9gFM6ikjZDO4HvMCCvVMHDMkYEgLdjra1D0Fw+yHCkPiD/SkCbZ8JJVMOhSNpxsHmcJI58W4W9/R/llpKi0PZ14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4681
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

In an upcoming change, the VF MMIO migration data will be handled as
part of VF control state machine. Add the necessary helpers to allow the
migration data transfer to/from the VF MMIO registers.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 88 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h | 19 +++++++
 2 files changed, 107 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index c4dda87b47cc8..6ceb9e024e41e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -194,6 +194,94 @@ static void pf_clear_vf_scratch_regs(struct xe_gt *gt, unsigned int vfid)
 	}
 }
 
+/**
+ * xe_gt_sriov_pf_mmio_vf_size - Get the size of VF MMIO register data.
+ * @gt: the &struct xe_gt
+ * @vfid: VF identifier
+ *
+ * Return: size in bytes.
+ */
+size_t xe_gt_sriov_pf_mmio_vf_size(struct xe_gt *gt, unsigned int vfid)
+{
+	if (xe_gt_is_media_type(gt))
+		return MED_VF_SW_FLAG_COUNT * sizeof(u32);
+	else
+		return VF_SW_FLAG_COUNT * sizeof(u32);
+}
+
+/**
+ * xe_gt_sriov_pf_mmio_vf_save - Save VF MMIO register values to a buffer.
+ * @gt: the &struct xe_gt
+ * @vfid: VF identifier
+ * @buf: destination buffer
+ * @size: destination buffer size in bytes
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_mmio_vf_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size)
+{
+	u32 stride = pf_get_vf_regs_stride(gt_to_xe(gt));
+	struct xe_reg scratch;
+	u32 *regs = buf;
+	int n, count;
+
+	if (size != xe_gt_sriov_pf_mmio_vf_size(gt, vfid))
+		return -EINVAL;
+
+	if (xe_gt_is_media_type(gt)) {
+		count = MED_VF_SW_FLAG_COUNT;
+		for (n = 0; n < count; n++) {
+			scratch = xe_reg_vf_to_pf(MED_VF_SW_FLAG(n), vfid, stride);
+			regs[n] = xe_mmio_read32(&gt->mmio, scratch);
+		}
+	} else {
+		count = VF_SW_FLAG_COUNT;
+		for (n = 0; n < count; n++) {
+			scratch = xe_reg_vf_to_pf(VF_SW_FLAG(n), vfid, stride);
+			regs[n] = xe_mmio_read32(&gt->mmio, scratch);
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_mmio_vf_restore - Restore VF MMIO register values from a buffer.
+ * @gt: the &struct xe_gt
+ * @vfid: VF identifier
+ * @buf: source buffer
+ * @size: source buffer size in bytes
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_mmio_vf_restore(struct xe_gt *gt, unsigned int vfid,
+				   const void *buf, size_t size)
+{
+	u32 stride = pf_get_vf_regs_stride(gt_to_xe(gt));
+	const u32 *regs = buf;
+	struct xe_reg scratch;
+	int n, count;
+
+	if (size != xe_gt_sriov_pf_mmio_vf_size(gt, vfid))
+		return -EINVAL;
+
+	if (xe_gt_is_media_type(gt)) {
+		count = MED_VF_SW_FLAG_COUNT;
+		for (n = 0; n < count; n++) {
+			scratch = xe_reg_vf_to_pf(MED_VF_SW_FLAG(n), vfid, stride);
+			xe_mmio_write32(&gt->mmio, scratch, regs[n]);
+		}
+	} else {
+		count = VF_SW_FLAG_COUNT;
+		for (n = 0; n < count; n++) {
+			scratch = xe_reg_vf_to_pf(VF_SW_FLAG(n), vfid, stride);
+			xe_mmio_write32(&gt->mmio, scratch, regs[n]);
+		}
+	}
+
+	return 0;
+}
+
 /**
  * xe_gt_sriov_pf_sanitize_hw() - Reset hardware state related to a VF.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
index e7fde3f9937af..5e5f31d943d89 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
@@ -6,6 +6,8 @@
 #ifndef _XE_GT_SRIOV_PF_H_
 #define _XE_GT_SRIOV_PF_H_
 
+#include <linux/types.h>
+
 struct xe_gt;
 
 #ifdef CONFIG_PCI_IOV
@@ -16,6 +18,10 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
 void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
 void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt);
 void xe_gt_sriov_pf_restart(struct xe_gt *gt);
+size_t xe_gt_sriov_pf_mmio_vf_size(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_mmio_vf_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size);
+int xe_gt_sriov_pf_mmio_vf_restore(struct xe_gt *gt, unsigned int vfid,
+				   const void *buf, size_t size);
 #else
 static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
 {
@@ -38,6 +44,19 @@ static inline void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt)
 static inline void xe_gt_sriov_pf_restart(struct xe_gt *gt)
 {
 }
+size_t xe_gt_sriov_pf_mmio_vf_size(struct xe_gt *gt, unsigned int vfid)
+{
+	return 0;
+}
+int xe_gt_sriov_pf_mmio_vf_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size)
+{
+	return -ENODEV;
+}
+int xe_gt_sriov_pf_mmio_vf_restore(struct xe_gt *gt, unsigned int vfid,
+				   const void *buf, size_t size)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif
-- 
2.50.1

