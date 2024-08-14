Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025C99516B8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 10:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDF010E429;
	Wed, 14 Aug 2024 08:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RxmZeuqD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398D410E427;
 Wed, 14 Aug 2024 08:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723624680; x=1755160680;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RswAI+lYvz7jKIPor0QwmEE5FoQ+OGC55K3GuJTOFBY=;
 b=RxmZeuqD++WjgKVbNBaxMAVE/2cYH5ZJLZXBPTjkM64glKLr91JxPX98
 nhsX7hCGa97hWd3Z+Ss9Qp040VpyrSG354XXcu/dBEDHPblIZx3fg7j1m
 Drz0ouX4bAVZQV7EQSPQPoxvySNuUr1aO4EgwZNOdmo92yzxuDzv28Rn+
 O4EEOTm4Y0USN8XOd6oQv1NOerJvl1V0gH6CaIbBdBLpQSP1dbQ+G448z
 KNA6KRjk0KSnunodz4A+ZBc4YRv03KI0m6t9zGKDAq0lBi5NQvOrlImkm
 jX2cJoGjHOVsm84jy1Y+1N03xWF23S+0EN7eIs0niR529QX6y93fkv93k Q==;
X-CSE-ConnectionGUID: qfr7B2YQTCyHIhPFqfqWXg==
X-CSE-MsgGUID: 1E8vuBWyTCSTYJ4kWAsg8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21993565"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="21993565"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 01:37:59 -0700
X-CSE-ConnectionGUID: ifQsMkp/Tz2meO8THR1aqQ==
X-CSE-MsgGUID: Tc87k4V+Q56cpEy5srWKrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="96457748"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 01:37:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 01:37:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 01:37:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 01:37:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 01:37:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXNtN+4Drw6MuWyuaFV6Kp0hom+wVmRwFUoAkYadnt13of8OeyT68CanPCcIRP4E2nLl3Fr1LBilYbbYhunaM+Z6bnvWHnuWNUA/cpHDkRopa6q3um3gdfjigo8y0tC3xo6DQlRNj5n2C6lZXBV9kC2CQYpTRWD7Wp70BO2fRJa8pSpERudWo86pT1DxXprrHdLxEQbngc5b3Z5w46EgerEnMtvqAPZWixKS2H2Ahsp7/JQvvt3yLz4xKOIpwduAtw9l8oRwL9548N3R3rWLy/Lz8WN2FY1c+AwRcH5Uyx42jgfms1n0l+oAW6nTocxkTX5HnS4w7P8QJxOrfJGXnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okB8JQicT6sB+9QldcDgBNv17G3iqF6xGagEZLSO0P4=;
 b=HXlDnkqPO7AwOUJF3sV2zwGQGLpAk94Y1vqiOtozKEJVLrXG/Y/GcLrifk/W0dtYLJrREz8yqCjgtOgIYn6cKxFbUae/HfT96oNrcCn5MA3lUPFEvgZqHW2qfqzTCr8NctczWPSB4mN/USzOe6EdTxSX3fE2TxUIsPcymPg3bUw+aChDNSQBjuzVYt3duEPjivYFEEKh3jwFhha0QXDA98HZXt+T/Q6xxJvJ9V7uHfrxI/3RywDYllm0War7KZl+B74El1hZMHUWN9ZYTs9cq3Qyq42XBE/WN1pwpISW8iHHJxGv6DKAK5oxiXFlS0RVx6t1KXL6AMx5lOH66OIkJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA1PR11MB8376.namprd11.prod.outlook.com (2603:10b6:806:389::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Wed, 14 Aug
 2024 08:37:56 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 08:37:55 +0000
Message-ID: <88320f60-d55b-4aa5-881f-530375659c27@intel.com>
Date: Wed, 14 Aug 2024 14:07:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/i915/hwmon: expose fan speed
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <tursulin@ursulin.net>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <linux@roeck-us.net>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <riana.tauro@intel.com>, <ashutosh.dixit@intel.com>,
 <karthik.poosa@intel.com>, <andriy.shevchenko@linux.intel.com>
References: <20240809061525.1368153-1-raag.jadav@intel.com>
 <23dc7824-50cd-4ba3-be5a-df141e8fe69a@intel.com>
 <ZrXslA1c-BhO6zYr@ashyti-mobl2.lan>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZrXslA1c-BhO6zYr@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::23) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA1PR11MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: f336ed13-502f-48b5-ad03-08dcbc3c64c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1dCRk1RZXFYS3l4OEZVOFpQSmNPODgwSFJzdjlQdlF1eVJaMHYwWWl6MnFn?=
 =?utf-8?B?Qkh6eE1QZ0NVcmZyQkpQZVJBWEU5UHc5dkFuM3NnMWFnRTd1aVVPSkprOHpi?=
 =?utf-8?B?Q3JlMDdWWUdDeFVzOFQrdHY0UkVndHNRZ3RvVzQwQlFxc2tidTZuN05ZODJi?=
 =?utf-8?B?RzdSMEU0UE9KcVNLQWpFdVZaU2djQzhhQmR6Ny9DdWd2czhZTk5zZllYeXV0?=
 =?utf-8?B?VjNqb3JlRXd4cmxKTEFNSVRadGZXdXNLdE1jcG8rY0VYWkxNY2VtalRoVElo?=
 =?utf-8?B?MSs2Wkl6L28xM3lyajY2WElDS1MrMnJUVHdsSmxEclhqY082QkxGY043Zjkw?=
 =?utf-8?B?ck1qUlEzV0tUTFJEZzNBK29hSWlvWjFqZ1NYQ0piWnNYOUVHUDBpMnVBRms3?=
 =?utf-8?B?YTUrcEhubVVGSHIxUjdMbVg3SXhyZGI4WEJtM0UxblRBVWFjWWlUY0d2QlZH?=
 =?utf-8?B?dkprbE1jRktTWXJnWGJFY29MUFhncUk3cytUTk9TUUlFS1NjaGFzd3VENHZa?=
 =?utf-8?B?M21wMzdkYmRhRGQ4RzQ1elFsZ0NDUVVydjY1MWZjak5jSW5pdGtoYUJkb2Jl?=
 =?utf-8?B?R0lTZytrdHppVVhVZHhjY0lKY1FEYUJLVWttNTlIU29NY1dsWFdwRjdiM2dx?=
 =?utf-8?B?M25YcEpraWlLQ2dyNzJ2YmlOYm5DeHIveUtHNnJuNVRJOHBhYzFEdWxNQmh3?=
 =?utf-8?B?ME16dlpsQzlrdXcwcGhMcktIMXlhbW9aY29OUi9RRVhWRFN3UnBxV1hYNWR1?=
 =?utf-8?B?OHV5SEpUSFNRK2hsWXFaY3dGZVVZZkJhZ0pETHVxOFo5K3Y4T24xTDhRVFRE?=
 =?utf-8?B?YWJTWjh2dWw2WDNXWlhrK0JoRDlaai9rZ2FncWQwcHVMamVlRDk3cUFWMnJ2?=
 =?utf-8?B?Z3A1SzBYTXVRYTQvNVhFYjR1RG1FSXd4VVlzaGdPeEZaRXBuc2hZR3RhUmVQ?=
 =?utf-8?B?Y1JVVmF4LzBzeHVSaFA5SW5DN084YnNyTUhqKzdLOFFXOTJZRzVUWHNxd1kw?=
 =?utf-8?B?cDJRQ3hVU3hxenZBN1U3MmtrYllMTU9CWVk0QW1TbU4vZUxFMkFiNysxZDVG?=
 =?utf-8?B?SDdicmsvYlNCc1ZNQTU1NE1EWndQbUJLcmcwc0NwbXFjaEFjbHNodXhzbE4v?=
 =?utf-8?B?YlNGd1IzeU5hVDFrdTY0UXBzQW5pR21KVGgxdkFTY3AxSGlBSS9CUDJ1ME10?=
 =?utf-8?B?VVhnaUxyckpNSE1SZFFSbEt3c0Z5bjBsREN1SkxqMnk1VUc3aEFnZkJWSjVi?=
 =?utf-8?B?aFJEckJKL3J0L2s0eFd5cnN0M0ptY1N2ZXpJenc3VVZQN3R4S0MyV1dJcHVG?=
 =?utf-8?B?U2dZdmZMWjJUcXdXR0hTNkpXd0k4TENjaW9ySE90SWtoOGRyd28rRVY5cmRN?=
 =?utf-8?B?RGhFVmRLTGNKaXBxKzhxNmZXcG05T0hidjF6UWZ2ZEhJK1NTMUlWMWg0UkJG?=
 =?utf-8?B?RjhXVEYxTFpxdjNmNjVWVG5ya2RZYVVML3ZiVnJEcTMyQXFGanozQ1FZbktq?=
 =?utf-8?B?eEV4VGhDd3R3WWFxSy9xalZQVExDMXFLelg4cXpITGhTNUFxbXAwTGQ4SkxI?=
 =?utf-8?B?SUhoZG9odGw4eXpJODhSL1BxZFVzcW9QMUhlZldIYm5mZ3VqcVN2YXdRY2xp?=
 =?utf-8?B?WkVxajZiL0dwTllpVXBUL1VFVXBhcFRSZ2lmeU55MDRVWVRBekUwNVZadUZz?=
 =?utf-8?B?em9OeEI0SGxJbGgwalVTMUpQQ2M2dDQ4SUhyaUlsb1h2Wk1LRGJYaW5yT3pu?=
 =?utf-8?B?SmREZ2RWTUJpMitOWTF6b0c4RXVvNkRydGFhSlgvcm5iUjFwV3ZKY1FoeGdL?=
 =?utf-8?B?ckpGV1ZPbS9hRmo2bTAvUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mnh2ZXIxdGc1RStKbTh4WVlMbkNSbStNbjdKKy96ZFdnVnFpVjl1dElJNHJh?=
 =?utf-8?B?b1VabXhkUE5RQkN5amppM0lwUHdYL2pJZkVBcjU2SVBDNVhqK2xBVDQzdmhB?=
 =?utf-8?B?QWVIVVhpWlZ5K3NnVytsV3Y3R3pGcVVhQlpvajRsZHVxZElHRjVZZ3RScVgy?=
 =?utf-8?B?Q2V3aTQ3STlyZWNoNFZ2NFYyd3NJZEpGRUdyeEdENDFHOGs5YkZnVGxXUis1?=
 =?utf-8?B?SWNKcCtvNTc0ZlExenBpNHkyOXIxcEtNeHJ2YlA1NEhzcFM2YUQ0b3ZDOFFF?=
 =?utf-8?B?dUVHTElBYk1XQVFaNVhLM1ZDWHpLWC9aUXcrVVlTdlh0YlIwdW1EeFc3OURK?=
 =?utf-8?B?ODBMREIzbTJpVFViYk1CU1RoVTd6alA3MGVsa01MM3lHZGgvNy83TjB5aVBi?=
 =?utf-8?B?c0RWMjJMSXJDS25Gb3RjanBxa2dXS0hrTDl5QU8zS29TUkJ3c0RCdHc2MkVO?=
 =?utf-8?B?R1YwU3JJQ0V3MmFkQXJFb3oyNm9tbit1UURXblMwYlREZ1ZSVGRFbUIrYk1J?=
 =?utf-8?B?cnFFZGRlOHV0cEFXS21ncjVjL2pZM2w0ZHU2aDFISXVNYXAyaG9vQU9qZS81?=
 =?utf-8?B?VEdWUDB2Mmp0aXd4bWVFdERVbnF4WG93M0hOcHd1OC9CcExyaERQWitYTnhp?=
 =?utf-8?B?TTE1TmM2MTF3ODAxdGdhSWpxSTJpQVFaVTQ0bWdzcG84ZThDSVd4a3hSWHNM?=
 =?utf-8?B?Wlh5U3pMZFZNOTB1Y05UQ0VCdXlmWmFJK0J6QUpieFl2Q25vdlNJQlkzelc2?=
 =?utf-8?B?aGwxUXU3Q2ErSDJQZ1VhMmlkUURFSkZTSkZFdTFVeU5nalZPdk9QSzFPZ0h5?=
 =?utf-8?B?YUlUcGd4azNxbWdpUk8vb2IyZ0VUK3FETHRkWVhOVDFmK09hRVF6eUhSUVNh?=
 =?utf-8?B?TWxVcVdyNTZrOTlTVjVIMTUxMWxlejdldVA3M2lwai8yTS9lbzdHeEdYMlQr?=
 =?utf-8?B?dmNQeWIvc1FZdEVmSXViWVZmalQvOUN2UGE3cFRLUENqZS9pNTFFQUZMczBE?=
 =?utf-8?B?a2pFNUFId05IQk5CODZUZ25waEZzQzRhaXg3d1BDenZ2ODY1dUtwWnFPbzdx?=
 =?utf-8?B?RzJpNi9nTWswYklTdHNIUndBMC91ZDNla1ZLN1NKZHBETjNtMGtlb0VheFFX?=
 =?utf-8?B?TDVqWitaa3Y5WUowc0huOUtTR1RmVlRNUzJTbFpkRGhtUjhHdWFmU3orK1Rl?=
 =?utf-8?B?dUZ2dDB0Zjh6c0pubDB4SnIzTzF5dG4zTkxYZDJGUDh6azcrdUFQWGdoWHcz?=
 =?utf-8?B?M2RpdGpOME9MZkx2WWlteGNZbUljZzVIcFdMRHgvdGRRTHM2YkxxTU0yZTVy?=
 =?utf-8?B?VDVMVTJrMTNJRVoyblpyZ1JvZUVBcjBqOW83RlNtRC93U0tXcUFlV3JoU0x4?=
 =?utf-8?B?ZForT3phTDYvRTc0ejUycUZjZHJ4MTNVSHU0bmhuTmszUzNRaUFTOXNCTnpU?=
 =?utf-8?B?Ynh6U2ovNkRvakFWMzl4OFljVnZsZUxSNkw0cVhSMFEyWGpDR2JycW9hSG1K?=
 =?utf-8?B?YytyaG5SQU16cUhIMEtPVTAyUTRPNkZwY3RuY3hIamY2OStaWnpTbWZVcnNy?=
 =?utf-8?B?WVZlQ25QRTl2RUxaVjhrL0dleFdpOGZsM0Zqc05lcnNlVzJOZWh4c1dGVm8z?=
 =?utf-8?B?N2pRbGtGdkVZanhDbm8wZGNaV1dVaEZ2ZUh4SFUxRmRyeXU0VVZ2KzUvZjBX?=
 =?utf-8?B?aTg4NkQvWTNtZERjRk4yRU1GNk5wMlpDZ09nL2VkdW5rVDJlNWd1TStlRzda?=
 =?utf-8?B?SVF3VHpkVWR2QTEzMXJNRzlDVmRFeEtXbmlzeTZpMU5VN1djMUZWYzFJajJ1?=
 =?utf-8?B?WEJiL3NiTDc0MEZIYVZndHMybStOZFhtZkJTTVpBSGQ5SHQ1N3cydDVqNGVa?=
 =?utf-8?B?SjVDOWpidDRkZ203V3VnQlIxYklMUXVKK3Q5N3NlMTBOMFVUbG8zb1JsNFQv?=
 =?utf-8?B?dEdtWk9JZ1h4TUxMaGRTcHRzSHBmc01rMFZ3OVVkK2dhTlVQaWMxY1RrOHc1?=
 =?utf-8?B?U1dJWTZSYU91NmJpWXA0RmhIZXBnNVZmYWdWNnJoazFQM2tiWWV2NThjWEFa?=
 =?utf-8?B?RmptSW5yMHNWSGhtN1IwTHZtemVIK01hSmNGQ1BFWUJuVXIwMDBTZHYzeTdu?=
 =?utf-8?B?RnVTVnNYeW9rbTFzR3FVTkJzVmFmcHZrd2hpY1Bxd0Q3OHhXL2dSaWFac21t?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f336ed13-502f-48b5-ad03-08dcbc3c64c6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 08:37:55.8023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGebGcEITL4SOCaU7g6mJDrtc3iE+CTwxiBPHqNB4EVch/jgoXCWE7xX+ovvrg0sIgSzXqjcG1lWu1o+D0uhRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8376
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


Hi Andi,

On 09-08-2024 15:46, Andi Shyti wrote:
> Hi Badal,
> 
>>> +static int
>>> +hwm_fan_read(struct hwm_drvdata *ddat, u32 attr, long *val)
>>> +{
>>> +	struct i915_hwmon *hwmon = ddat->hwmon;
>>> +	struct hwm_fan_info *fi = &ddat->fi;
>>> +	u32 reg_val, pulses, time, time_now;
>>> +	intel_wakeref_t wakeref;
>>> +	long rotations;
>>> +	int ret = 0;
>>> +
>>> +	if (attr != hwmon_fan_input)
>>> +		return -EOPNOTSUPP;
>> Using a switch case in rev3 is more logical here. It will also simplify
>> adding more fan attributes in the future. This is why switch cases are used
>> in other parts of the file.
> 
> it was my suggestion and to be honest I would rather prefer it
> this way. I can understand it if we were expecting more cases in
> the immediate, like it was in your case.
> 
> But I wouldn't have an ugly and unreadable one-case-switch in the
> eventuality that something comes in the future. In that case, we
> can always convert it.

My rationale for suggesting a switch case is that in the current 
alignment hwm_XX_read() function is designed to handle all 
possible/supported attributes of the XX sensor type.
With the proposed change, hwm_fan_read() would only manage the 
hwmon_fan_input attribute.
If a single switch case isn’t preferred, I would recommend creating a 
helper function dedicated to hwmon_fan_input.

hwm_fan_read()
{
	if (attr == hwmon_fan_input)
		return helper(); //hwmon_fan_input_read()
	return -EOPNOTSUPP;
}

Regards,
Badal
> 
> Thanks,
> Andi
