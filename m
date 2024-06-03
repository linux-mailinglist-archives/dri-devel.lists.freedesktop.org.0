Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DF78D7F30
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 11:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2053F10E139;
	Mon,  3 Jun 2024 09:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KssdBm6d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB5910E139
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 09:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717407968; x=1748943968;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X/+tEUdXkewZdzKzKonJW5lQmiZb5vOIJIWxwcGt+Jc=;
 b=KssdBm6dRP+Bv6w8nDkwiyaj87vnKB+QwkSzEJj576EWmiTa4UzynAQP
 d18m36uVF9zu6C75B+rNTtybsk5IsSgHiKqMLmxKHRqtslDRtN2b8ZjfN
 CinPdTJ+l/TD4NJ8kOPqwluThqq5OM3O2+Cz84/MGbnliYl6b+wBYI+Rx
 86GpNU9wW0XgiznlXf+o28SJF0Sb69sPk52M4gIgnRCnazpDecz/OVIuA
 5q22Mk6sFqIIfk8i3WA6txgoOtX9dKNMWIEQbbqDLVqCoI39bab869hoa
 3HKlf1YcitxX5/tJD3rnu58gAg03jdrrnltDJLzYvJR0IS11y8oYgzK/H g==;
X-CSE-ConnectionGUID: pScJqc3YQFWrgUUyZ2Jj7Q==
X-CSE-MsgGUID: NZf/tpc/RZaVYeOftvjPWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="25295021"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="25295021"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 02:46:07 -0700
X-CSE-ConnectionGUID: lFcBdt4tRwm9TRqpVAUB8Q==
X-CSE-MsgGUID: 8kMtFqwfRSmsXpHMWFj4Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36940052"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 02:46:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 02:46:07 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 02:46:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 02:46:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 02:46:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXCfsrE7OnF5/470SspVWiK4/4oRjOxs0NfZke8KPQ2rg2tF1OOXA0SmA+TO+DqOs4pQ4+soXilWj2bNTc1RbP0d0PBNbjJkicS8QUHRVoueNkomB1XElqQFVO31nwLpPpXpEQ1p6zb1EakBKMEYEXtJ+3ISqaXxVm409TSx97sTZCOxia/vVCC1QvfCRhHYH6LrHiyRNFugTIFqRNZmjyNwn8dSlJY0eWVo80Y5yHbaaIx/mQUveaPF55/rWVT5hTvRA6far0atT8Qb5T8xZxOsiAWOi6q1ByCyotdqSVGsVGgDqRSe2ThQDW9AXqT2EQR+3KPCFB912qVR5oBcqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXvKhVzaMRvNUP4K1/rUbf6khIAl4EcGT9rGZxLetUA=;
 b=EdrgTHksFygtvlg0d+vAloU9V65oEpD7oSRmqU4gIxQxfa0JliGcDRdvT2atNsIkCCDe1EqrAUw7ZzOlv3700fWyBw6TQbe90ZZEE18mjtfwsHxtXJUsWbeoTA7F6g5gfHrHuKjgDTXZNBgPE+frQgrZiavBWaCuDxhMAOYjKJIcMWA2968u4HVzTDb5dVdNWFoFxQPyG2Znh+BwlxFT8NfU5yrhwan9ouUfVEKAo4Tpxkm2yeYEeaqJb4S1gu5FGvTIWEsJGAWltuRWlkxb1XbpmITjYDxlKQEssWP5HKLzw+Nn1oGzz81YWWy7MU4a4Wvf09Z11qjeElKcat0rfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by CY5PR11MB6415.namprd11.prod.outlook.com (2603:10b6:930:35::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Mon, 3 Jun
 2024 09:46:04 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%3]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 09:46:03 +0000
Message-ID: <f96506a8-0013-4fab-aa10-af60931abc25@intel.com>
Date: Mon, 3 Jun 2024 11:46:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 06/10] drm/ttm/tests: Add tests with mock resource
 managers
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Amaranath Somalapuram <asomalap@amd.com>
References: <cover.1715767062.git.karolina.stolarek@intel.com>
 <fc62475ddc5ee32f9be197ee72b146209f31972e.1715767062.git.karolina.stolarek@intel.com>
 <43d9493358353fc40df56023e474ae827dbfd2ec.camel@linux.intel.com>
 <5be44989-d259-4ede-90db-297046776cb8@intel.com>
 <780eccefb82b08c3e87185d510f8e99ee6a174da.camel@linux.intel.com>
 <aedb4864-afbc-4261-9618-3489a1755f0d@intel.com>
 <7ba3ffaa4c05692ecb10b0b3b2f16ab973b05d64.camel@linux.intel.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <7ba3ffaa4c05692ecb10b0b3b2f16ab973b05d64.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU6P191CA0031.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::10) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|CY5PR11MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: b25d499f-389f-4f41-76ee-08dc83b1fbdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTZyZWFZQ1EzTVRWeWY2dzA4TXpGVGNwSzlLKzJYVlU1QWZlY2pqbDBuUUhX?=
 =?utf-8?B?c2JEVlNYM01NUnNoWjVub00xb2N5S0luZWxuWlYzV0tpK2FHVXE4OGFlQzFy?=
 =?utf-8?B?WEpjSk9WVTdLZzN0ZVFuQStUL284NWFiblFvQTdNeXBoL292SjEzQlhZSkRO?=
 =?utf-8?B?WjhXMGlGbkRYQ2h4Qk4ybElIS2c1aTNSTVF1VXhDeW9URVlrQXJJeXlTR2F1?=
 =?utf-8?B?VVlveUcyUWJhSTF1cUhpN3BuQVQ1VE5COG9CdUdTTFVOMEowdU9NWmdpM2c3?=
 =?utf-8?B?cFRxL2xRbzhzQVBKSE9QeVBEWW94SGRpRGl5MmVmZzNJZEF0dWMzSFI0TEdL?=
 =?utf-8?B?SERmdXFNSURnelVoekRiV1hzZFRaR1FpRE0rMDM4UkRxenZGOXU0bVo2NUJo?=
 =?utf-8?B?b2crU1gyRGV5aytUVDBXZm9kTXptOGJaeFZYZFNSa0tRM1hmZzB1YlA1L1Jk?=
 =?utf-8?B?NkZVN09WTFJHa1AyM1RwTUUxaVh1bzBBbm11cS9WOTA5d05XZCthb2E3aWdB?=
 =?utf-8?B?dEdpZmp5TnNNaEhsaDFqbUVrWERZL2E0ajNOUk1CZE83WmZ4dW82WUMrTzlz?=
 =?utf-8?B?STFZRGI3N2Rwc1JjdWJkUXQ1c3VFN09XMHpwZ09hY0RXbWdZWW0xOFBRZlcy?=
 =?utf-8?B?WG5uVHo0VzNnRVJZVUtJdzN1M3JHbWMwYldxS0ZQZXg0bnozN1I3eHpEZkZr?=
 =?utf-8?B?cVFVRkxBUUNwVkhmRzFwVzU0bTJPZmtlTE9wcjhVWi8xeHl4Z2x4eW9WMWJZ?=
 =?utf-8?B?U3ozRXBFV2FKMHAxSk54eXJIRW4yK3VwTXZyQmwzSmZTZFByd2cyekVYd0Jr?=
 =?utf-8?B?dlZvWDBGbGZkaHhnZWVHQjNwQmxsU0E3c0g5S2EzYjlWZGNQSEp3QWRYUVB4?=
 =?utf-8?B?NEM5VWJENk9VRmRIcHpoL0RqQTZTTHRjWWVtbmw0bllpRUdlSW53YjFRVWpi?=
 =?utf-8?B?MEhjUzNnNlVld21JNDA0VHg5Vkk3TjgxaERrR1pyc2loR1BUVmFlcmZhNXFM?=
 =?utf-8?B?em44ZmQ4THV5cUFxb2hNN2dyRlRLdUZoYTRrZUpIZXYrSnJMQ2dvTGs3SUw4?=
 =?utf-8?B?aE5yYzFWYURzVmVkWUx0TzRtcnFDYXdxU25WMVF1UVJCbmZBSUhWSnd2Smd1?=
 =?utf-8?B?bWZodk1SSURGbWxtWktlaW9FektnMjBSVjNoejhJUFBnQURnRWZ4cWRsQlpy?=
 =?utf-8?B?eEhaWEhHclYzTXRvV0loaEdUUjAyczNaUFNLZ3JLazlKcTBoRy9SUStwRG9S?=
 =?utf-8?B?UndPaWdVYm5zMy82NTF1Tm5BSWd5QTJFOW1WSit5ZjJ3TTB6Q0J0YUdJVGZE?=
 =?utf-8?B?ekp1ZWQweTVURkdwTmV3OHJ2NWtEVzFYNk90UEoxcWJlMHdDanRTMXh5bVM0?=
 =?utf-8?B?eklzZVJrbXh4MHYxVDhkZ2Y4cnY2MUEveWlGMGNreHMwVTdXUzVISW52TFkz?=
 =?utf-8?B?NHVSdmY1WWRhRk52SW1SeE56OUFvSnhEUWRGYkxGbmhhbXdXcjF1UXNpSnFl?=
 =?utf-8?B?K2ZSa0FxZlljbkxsY1BvUjFreldxdG44cjNXZEczbjJrWXpVMjhLODA2MGZw?=
 =?utf-8?B?ZmJSMjRxL0R6QnB0elZONWpKdGR5RVQvMlJlWG1rOUZoYXhxSjZWY1BCc3pp?=
 =?utf-8?B?WDM3QkwzdnZ0K2Z0NkZYYlAxSXM4a1JXVi9BVHRVQnpxcnN0SmN3S0FWY0xS?=
 =?utf-8?B?WkJwMXJ2Z2pxcUt6NjIxWU5rZE1Gc2R4cDhXeWc2Skl0SzBnQXo5MG93PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXkzMDhGOHI0N3E0V0RyNE81bStFbnBpcktJRHBmNGpFbWYrUGs0L2JwWmdo?=
 =?utf-8?B?ZFBGNDZoZ3BwbmVJSkppV0JmOEtvclVSemFLL3k1U0FXVURqK29vbk1kU1Q5?=
 =?utf-8?B?dTdaeHAwNWpMTk5YMCtsRVN0cThwYUFYSWY1M09OeVkwWDBqTUtSc1BrTFlx?=
 =?utf-8?B?UVJkNEcwaEhMY2VBR1ZlT1JsbG9pVGRFY05TOUJ5SXk4Q1VRMUpRZGozUDVi?=
 =?utf-8?B?M2NybnhzSm0zamw3Njg4U3plWlI2dWFXNy9vYU5aTk1pek1COWE3QXBUV3JV?=
 =?utf-8?B?alVFbmEzSGFmYlZJdmdaM1hDS2Z0aGJEY0VyeUthZGNTOTMwc29LNldkQy9S?=
 =?utf-8?B?eFZ5OXh1bEpQM2xOaFFqTFlnMXc3L0xOUUV5V20xMEJqejRXNlJJejZtVzEw?=
 =?utf-8?B?ZGRWMHZkcUY0UUU5Tmt6aGY2Si80bTFXeTZzdnNvS3pCbWl4THI0QXJiL0ts?=
 =?utf-8?B?dU9Va2RFWms1Uk1FbU9uS3M1aDJBTVBNaFlpMTE1aXBmazEzWXhsMEtiL1Fh?=
 =?utf-8?B?eG9VcVhqVS9IR0t4SThuWm13bk1oQ2FTQ2hSNzY4YnVRTGtWMitMVnFiS05u?=
 =?utf-8?B?NStrd2tQNndBTnJZeVEycGVESGk3dlNBaVBtbUtsWWI1ZkNmTjRpZzdsQm9H?=
 =?utf-8?B?TDNHeThqNGh4L1p5UU1KVGxUV1NCQmJPVEJ1Wmp5ZTRVQXdJSXVqVjFPdzg1?=
 =?utf-8?B?eVE5NkVrbUYxRmU2ek53UTFKQmdoZ1YwUjlnbzMyNDAyMmdjTlRkdkg3d01r?=
 =?utf-8?B?SWxRbGNPcE9TcXFsbkVJUENFYUZzTjBpdUEwb3lEYytRMmlSc0ZGMXZCbFBS?=
 =?utf-8?B?QnUyWldQVXBTd0huVSs5MlRQTzR4WnN5QWdWZlMwYUQ1Uk1idUlKOGV4WGdL?=
 =?utf-8?B?eFBBb1gxR3p3NnRlZTQwbHh2ZjVkOTVTRWxpRXRNdUx2NFlpNXB0NUdtUGZR?=
 =?utf-8?B?ckVBVExZWU55OWlSbzJTS2VCdTRtd1BjNUhNaDY1L1MyaENxOFU2bFN4b3do?=
 =?utf-8?B?TiswdVRvNHBEWTM1cmt4NXVLSWNvNERBNFZXSzQ0cC9YQkQxRkxKbzJuVU5t?=
 =?utf-8?B?R3FCUnA3UHdnZDBpeWF6YTlWNkJoNHpjbnBQa3dDSmtjSGhSeFcxWSs4cXBQ?=
 =?utf-8?B?S0wwSHJBelFXZlZTdVJPWUVTVXcyT1dsaldkMlRMWmVDc2dzWk9LRWdIeHNN?=
 =?utf-8?B?aDNlcnlBRkRleDhMc0w3L0s3SEFDR1ZQWWlndFdqSTdDbGMvNGtYRXBwTVQ5?=
 =?utf-8?B?SG1idWFyc3ExdDUxMDlNY0ZZb0t6M0R4RUNjZWtqekhyVXZ6WWxnbHE2ZDRT?=
 =?utf-8?B?ZnJpT2FEcTNMdm14c0d5WkJ1c3pORWM1bnBqbVNmdTVZdHRIeXZ4QkVjSXFI?=
 =?utf-8?B?dG9McENUTzVPR0ZkYklYNzh4bW5Idjlxdis5OHU1RExXV2NUSTRqeG9FRnhU?=
 =?utf-8?B?UytDK21TM1MxN0s1UnFodnF3VjY0TWVOK3huOGJiWG9lUW13UVkwdldxdms0?=
 =?utf-8?B?MzVmaGVxcERHcURPL3BCUkc5eTZ6Q2lCV1hQTjV2M0ZOQTlpcTdKMENNQlJi?=
 =?utf-8?B?NkxhYW13QTNNckNZaDBlRHlWdnd6NWdZRldRUjVOam5aYU9GbkFIVDNXdkt2?=
 =?utf-8?B?U1lmVWxvSVdQZHBZZ1ZueXRBRXdpbHVBQXFWaUlhRnEyZTBaVHVGM0kvcUpt?=
 =?utf-8?B?dFJTYk12bGRXcUFYTFlIRjRsd2VhSElhcm5nYVJ4Rk9UMXYzQ21rY3NXRm05?=
 =?utf-8?B?MG1JT0piUTV2b3c4dDFKdjNhRTI1MnUzOTFhbzZsNllTVWdNMUIxazFCZzZM?=
 =?utf-8?B?cUJROGFQRmpzdXQ3V1lJOTErM1RLaVVPdHAyVUgzMUdOWHAySjNsdWxkL2Zn?=
 =?utf-8?B?T0g5cjNJNEhyaDRqWVZVbW9rcUVlOVFVRm1iQmdsblVQWm1iRTZNSmN0a2Ns?=
 =?utf-8?B?SnJiNXZIVlUwRDhTdW1SektxMlcrOTFFRlhINDNCY2lnd2U3ajFKSDJJTTM0?=
 =?utf-8?B?RWtUSEZDRkZVLzVUOVNrckJyQ21FRnZwZUY1dWlwRmFrbDhOWStyTWd1VSt3?=
 =?utf-8?B?TSt1MVJsV2RwVzVVUExiYXAyQXlkdmdIRjgzc2ladnlDakpiUndLTmtnRkFT?=
 =?utf-8?B?bVpmdTk1U1RYOUJGaDI2a0hmK2U0U3Q3Tjk1Zk14T1ZTUUd0OXRlTGtZaHZ5?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b25d499f-389f-4f41-76ee-08dc83b1fbdb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 09:46:03.9034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33jhkqCGq/2YeZnAzT1r6sVTGWeXos5dChmhcrkRuF+/y5N7fT/GSTTSIfOQOQPkHtQ/6u6tRdn/cjYM9+G3vRKZbRSYSGARl+bRERFO+rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6415
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

On 3.06.2024 11:30, Thomas Hellström wrote:
> On Mon, 2024-06-03 at 10:28 +0200, Karolina Stolarek wrote:
>>>>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>>>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>>>> index 2f590bae53f8..2a2585b37118 100644
>>>>>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>>>> @@ -27,8 +27,42 @@ static int mock_move(struct
>>>>>> ttm_buffer_object
>>>>>> *bo,
>>>>>> bool evict,
>>>>>>     		     struct ttm_resource *new_mem,
>>>>>>     		     struct ttm_place *hop)
>>>>>>     {
>> (...)
>>>>>> +
>>>>>> +		if (ret)
>>>>>> +			return ret;
>>>>>> +
>>>>>> +		ttm_resource_free(bo, &bo->resource);
>>>>>> +		ttm_bo_assign_mem(bo, new_mem);
>>>>>> +		return 0;
>>>>>> +	}
>>>>>> +
>>>>>> +	return ttm_bo_move_memcpy(bo, ctx, new_mem);
>>>>>
>>>>> Do we hit this move_memcpy()? Since the mock manager doesn't
>>>>> actually
>>>>> reserve any memory to manager, I'd expect this to run into
>>>>> problems?
>>>>
>>>> We do. The mock manager has use_tt=true, so on move, we'd use
>>>> ttm_kmap_iter_tt_init() for src and dest and copy the pages. I'm
>>>> not
>>>> sure if that's the right approach, but it enables me to test if
>>>> ttm_operation_ctx's bytes_moved is correctly updated.
>>>
>>> Ah, ok. It's probably not a common use-case since with both src and
>>> dst
>>> having use_tt, IIRC ttm should keep the pages and their content
>>> mostly
>>> intact across a move. So you would memcpy the source on itself?
>>>
>>> But it would give some coverage of the copy code though.
>>
>> I dug around and it looks like, in the current scenario,
>> ttm_bo_move_memcpy() is just ttm_bo_move_sync_cleanup()
>> (ttm_resource_free + ttm_bo_assign_mem). That means I should revisit
>> the
>> definitions of move and mock manager... I'll try to simplify them.
>>
>> Do I understand correctly that we'd prefer to have a mock manager
>> with
>> user_tt=false?
> 
> Yes, but then you need to allocate a chunk of contigous memory for the
> mock manager to manage. And instead of using drm_buddy you'd have to
> use drm_mm to manage it, since the ttm_kmap_iter default iterators can
> only handle either
> a) Contigous memory regions as returned from the drm_mm manager.
> b) Fragmented memory regions as returned from the drm_buddy manager,
> but in that case, they currently only handle pci io memory.
> 
> So I'd suggest to go with the current code and mark as a TODO: to
> implement a) above.

I understand, thank you for your explanation, that would require some 
rewrite indeed. I'll follow your suggestion and include it in the TODO file.

All the best,
Karolina
