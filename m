Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C80C9B0FFEE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 07:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5988D10E879;
	Thu, 24 Jul 2025 05:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iz3li163";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039FC10E879;
 Thu, 24 Jul 2025 05:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753334751; x=1784870751;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2xUFiv8MVf7zt1cHKd3xm6Q9JSF0l70WuU5tIME5OLM=;
 b=iz3li163BjoPNXELujO7EySaAMp7I8eeW/2rki9uUcO4b93LsT0IcQGH
 uFJeTahNo7j2eUBV49jmh47SlVmLEDJTEgjeymvCWz0hHxi6Umkorr32h
 Mug1rM7+i2lSv9J5HG3q7Kj7gBuaD3zZEdshwgP6xgT0EQEbPNcETj1Qh
 H+FgHYmZW1YpaEEW9v1wIxpQDr5T6RmZtdrQd4DD6qxrSEbNahFStKAoH
 kuIPLJHxTgz9m+9DFbMHtv0wVWU1a1XY69Kc2qeN2fj6NXxjcNpAhrMqo
 qWXM9O7zjCd8xX6T5TcRaOci3d+iDudvpzL8frsNHKUxRFUm9JQxAB52r g==;
X-CSE-ConnectionGUID: nZhX4vGKQ0u2CipkSQ3gGg==
X-CSE-MsgGUID: n8VpzdOmQ+WEMV3GGUH/1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55725264"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="55725264"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 22:25:18 -0700
X-CSE-ConnectionGUID: K2ewLPnmTWyBJXicSbFokw==
X-CSE-MsgGUID: ipzbhO7FR7KfJodkQ1nKxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="159727805"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 22:25:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 22:25:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 22:25:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 22:25:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTN0UI8gFWkurwzLDRb9zeV8vO+SrmR0A8lX6B03w2YNk1GAxO+PcMB/I3t2VynbtMgUt+RMixA1Na63kSYSwlH57uJ31Yhi8d6sybhesk3pb8gbU2YmYSReePG+DFPz//Dgm9tNlHP3cgiPqjxZmG/uq1iXnnBinRp5FyoJfRAcX4o/yDqYgv/1UYB6Nu9ofhlJXkcSeklPYwqhExxUOjbcYe6PdRvS0BTaCYj7cRItWYxPLg1f8enVCS/ywLylyiFvbYdkGt4Ma7kZHlBU6s44tlWvsreZ+9RODZ1w8aI5aHr8RjXL9GRJizV1sn0iuYoePNBejSABvQKoFs4afg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIPsMwxg5HOZp6ODb/YHKle6IA5ZRi9IuKK2IJAI2io=;
 b=XoeKYx9YWTIdcH5jxHAvLKj4K4a4A6skDCln+WJM+Y8u2ZyUCYePcbW8GlLgss/akR5A4tzSY/WWO3k1pnLve6pLAio03PcU8J8EsBL8uPg8+QYTwHoULfVu5SLl4bQFCD7Kt0PyXvrmUTjPX+Uj6XVF2DbBNwtwR3bhn+bZiNFtNoFvbkmkX7O/bvB8/8jpRyd7KT/qUu/o0OxYZIwVrMKdcsUph05VGCT2+oznSJjLXrvVCdYV1uRjAo8nSMlHqQup7u2Cx8n/FaYmxooUWA5eF+26qR9Waciwqmr5u+AqhXpv+vuHTjm0ZE2liNoSBFSG910V5VIlcVMxM2Rq1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB6995.namprd11.prod.outlook.com (2603:10b6:806:2ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Thu, 24 Jul
 2025 05:25:15 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 05:25:15 +0000
Message-ID: <73b62f68-700a-4fe6-ab3d-2a9a4bbce169@intel.com>
Date: Thu, 24 Jul 2025 10:55:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] drm/xe/doc: Document device wedged and runtime
 survivability
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, <simona.vetter@ffwll.ch>, <airlied@gmail.com>
References: <20250715104730.2109506-1-riana.tauro@intel.com>
 <20250715104730.2109506-7-riana.tauro@intel.com>
 <aIDk5XBEolQVTVHU@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aIDk5XBEolQVTVHU@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::36) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: 23be586d-c3b0-4028-60ce-08ddca72785b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnV6eWZ0eGNxcE9WR2xvd1NGblNrNjdibmtvdGZ4OFFsSWVZUlovUzZRaUQ2?=
 =?utf-8?B?K0ErUDNsSjRlN1h5TDZFNFo5YlhMYkJyeTdvVDZSNWVmU2VIYXdKREFWVk5k?=
 =?utf-8?B?ekRySWdDeTRnSjFXeHV0WDZkS0g5ZnFkdUY3QmJDWU5qOFRVN0gzelF4NEUy?=
 =?utf-8?B?cnVaTEJ0QVVrVFJmTE9hcE9ZY0JFQXhvaEdiYThtSHBxSDA3VERRakozbG8w?=
 =?utf-8?B?dDZJVGdaMGx4cGs0NnNmY0tSQW02NTRsU3lVREZyd05kMGJCMEFvQmQ2MzIv?=
 =?utf-8?B?eFR3NGZBd1JlL0JnS3VlaHZUVktBb1VXU1Q3K2xvREpvdUZJNGsxTmxzS0pk?=
 =?utf-8?B?MDNXRGczbkVsdzVmeVo1U3RBNUtES05xdmFSNittQy9RWVM3RWZxeVdxMWVU?=
 =?utf-8?B?NTdzVjk0Uml0MU1KQ0ErQnBjTzVLWU84ZjdnUFJmN3V6TnV2Z1hmK0F6UTdz?=
 =?utf-8?B?OU5rcURlS1QwTmx3QzRuOUNRNlJjcU5QZC9Vb2czVVFabGJJQ1dla3RHa2k3?=
 =?utf-8?B?alR2MklTd3h6cUhYS0M2SythUlVLSGNMckNLRUdRRWtSQnFxeWxEcndrODQ1?=
 =?utf-8?B?Z0hyY0gvcktLUFF6U0d1RU1JbHBHbFBVdnV0dmdhL2wyQkJtT0pEeDA4b3RB?=
 =?utf-8?B?NENpOEcvdUxOUVhwbG5ZUVlQUi9iWnBkOTZWYzN4M29qZWZQMXdCcTc5OEdB?=
 =?utf-8?B?bkoyVGNFRWxsU3VaMG5JM1V3MVpVdVc5Zms2TlNZeUlBdWlGMHlSRGxiNGly?=
 =?utf-8?B?dkN4TlE0NkgwcElQWlFIczdZMVcyVzhncmN6aG1VL2lEdkhWMjU5L0xNbjJu?=
 =?utf-8?B?dVdrNUllSTJWbXV2YjIyU2VvbTdia1oraFdlRTdjWThGWU5MWllHbnNNbGhl?=
 =?utf-8?B?L25uSnZRcnRGam0vaHJrNUFld2NoRzJUT2RrS2hha3EvTjBRZ3BKeDNLNGhO?=
 =?utf-8?B?eWNSekROdUkxazAzd0dLY092K3U5YkxjRjRxOW1zdmIxY3Z6NWVoQzc1NUZ0?=
 =?utf-8?B?NnRad3pIOU1QbkhJRndRaG5Ya1NiMU8yNjhwNFVDZjZqdERpQ3dCcVdEQkN5?=
 =?utf-8?B?cEpsSUM4VVdYWVpYNWNtN2pOVHJSY0x1NDNpZHlBZjlGd2xqcG05b1RhU2hM?=
 =?utf-8?B?SmtuNlBLMXNZM0tTTTBBUzVmSWprVzVnbEt3eGNLWStzbndIVWZSc0VzZFJM?=
 =?utf-8?B?UFRuajhFWHQ0VlArdXBKeHZPZC9rOHpaTDN3RDNQdisrSEJOcUFDU3QxWWta?=
 =?utf-8?B?eE0wZzRzOFM1SklPd3ZZMGdSVysrQS9rVktxckJjNUpUbXNtRkpNTHhoc3Fk?=
 =?utf-8?B?blpVdGdlaW9QcVJBeGJtQkhUZjRhUGxtT1ZPUTUzMm5SbEN2eXIvcC81a2Rj?=
 =?utf-8?B?VmNhWEZiYXpLaW45ekoxZXpqbU1vaUFDMWgvQm9lV2FnRVZiU3Y0MDNwMzZ3?=
 =?utf-8?B?MjlPTEllOUxXRUNHdVFxMW9JYlVPK1VEZEh4WFRSMzFLYmovU0xSVVVxQXRS?=
 =?utf-8?B?YlE4eVdNTE1rN2JwQUJWNnRoVXl6aFJUUHA0dGlsVVVRWTQ5VVpRVE1PS3do?=
 =?utf-8?B?RjQrTzZJS1lyMzFjdnBhbmtYWGE0S1g2RXB4MDlzU1FOYzNJaVFIQ0Q4d3RJ?=
 =?utf-8?B?Q25LNkxUMUpmOGJXQW5uT3EwQkg2RHNwR21hK0RnT3JBRWJxNHp4YWIyU0J2?=
 =?utf-8?B?M09QSzJtMFRvM3B6eVMxSVlOR0dJTi9oVkpHdGJlUjdmZlZxMUlrU3dQZGtQ?=
 =?utf-8?B?MEIyWnd1K1J6QklRaGVLbU5CODMyM3BDWmtTOERkRWQzMUJ0cW9wV2NhaVVZ?=
 =?utf-8?B?MjFGd2xUVFp2MGdwd2x4bEg2c1lqRlhlTGFEUjhwSGpmV1JOWFhYSkxNNU1v?=
 =?utf-8?B?bjVGdVJrenRQdFc0bk1ZWHNHNWZQbnVkNnZNWFZDY0FwOFU5c0xyZTJXQ2cw?=
 =?utf-8?Q?4IXVAy1Yw2s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmRtbDFvN0k0SlM1d3M4elU3eEZEd1FxN09rOFZwVFJudk1aTitkNVBGVmto?=
 =?utf-8?B?TVdYTlBnZndhMG1XTFlteStVaThodGs5U3lKdURNemlhNkJWcW5UK2x2UHZU?=
 =?utf-8?B?bEJQT2tleXVyWHZGVDAwdStGMnNiZHY4TmJhdExzcFpsQnpzK3JxSzNVWXJh?=
 =?utf-8?B?UndZODd2dHFrY2pDOUhWUHdDVGFOWEFGV0o3ckxRclcxMnNoZUZRUFhWUlFN?=
 =?utf-8?B?ZHBMZ3g4cWlhVVBGRzJDN3czZzdPZEhJZVpXVXJ1ZVVuaGZhVjNWUGFGazZh?=
 =?utf-8?B?RG9wOS9pVTI0VFdEQnZkTWdHa1IxbTFEVzkvNGtLQmZ6bjdZa1B6WG5WVkRR?=
 =?utf-8?B?NDFsazJTTDhnNUx4RURlYjJaNitqeTFkQWU5V1BURnA4aDNRVzZKV0FSQjJx?=
 =?utf-8?B?TW1HL2hMVVpPSjRqVE9waDZKbHo4UlZCeFJlMzJQZXJodG1GQ0pzUHNuRXEv?=
 =?utf-8?B?NExFVm5tbnJuTlFyYXBhSXZWOElZeHRBVVd4ZXVDZ2tmaFhGUzFocVhtT1BV?=
 =?utf-8?B?ZGdnMTVDblFwbWpnWk96OGUwWHRQeTUwQXZjWllZUUs3RE9WeGdkYjVTZHRw?=
 =?utf-8?B?NWRYd2hlNm1WbWU1VmdxQS9BV04zdFd4WU52dFZXYWQ1YTdGcFhTZjI3U0U0?=
 =?utf-8?B?MmI1bzRFK2pBSStvNjJhM2pGbjlKMUx1Vm9NQ2VHZnFDYVRBckZWTjZrb3kv?=
 =?utf-8?B?ZUI0TS9hZGQwWThmcGtqSWpBYlFlMjFpRHREd1RXbk1qVjRSaFlPRSt4MWNG?=
 =?utf-8?B?NjhXeFVVNFIzVG5ZUTl3RUlsbUVuQ3UzSTFlcUpiVk52WDkyRFp2anpreC8r?=
 =?utf-8?B?SytkTmZVQUZ2ZXZGMEJUMkhGN05VZGIzNGNtcytFc2lkWncrUXlxaGpDVncx?=
 =?utf-8?B?MStjSE00aXc2QVlRZlBna2FJTWl4eDNVdU4xR01XMzAzd21PSTdCTFJDYXE1?=
 =?utf-8?B?ZjNKNEpxdTJ0Y0tVM3ZncUtuNGN3WjdmNjk0c05MTFRxTVVYNmJmMklCUERL?=
 =?utf-8?B?OVI1OGIvTHBBMkZRK2Z2bVNwM2dNelF3OFJyYUJZR3VmTWsrQUprSkNjdkc0?=
 =?utf-8?B?Y0VQZURPaXgxVjMvdHI1YW5xdVdQK1E0Yk5ncTcvQzZPVkdEQWVMOStDTWFs?=
 =?utf-8?B?SUJ1NzhCdUpWN2tlNnAvTnliako4NGpnNEFHNU04Mlp5eE1IL1A0MlBhR3FO?=
 =?utf-8?B?czZybnpva3lHam9IZjlDb3F4VUFJbEpEMjNaOU9ENHl6THlDd3Y5cnpVS0Ri?=
 =?utf-8?B?Zi9vL1NIM0F6MStYbDV3dCt3Y01ieStkL3M1b3h0c0kxZmxnVW5yYkRpWStW?=
 =?utf-8?B?VXpxUW1kWDRNcGRtcTA0c3hYd3I4bXhNenFOZWpTWGRoaEwwcnBPN2RGMWZ4?=
 =?utf-8?B?bGNrRHpyTFlPS0ZUTU0vWWpZTzljZFRUek56c3AvLzZKV3ZzckhBcGRGaG5Y?=
 =?utf-8?B?cWRMRkpybFg3SUJSeEFEMXlrb0NFYjAva2QrOVpoaFNIZUd3UlpUdEJmSm1P?=
 =?utf-8?B?SGh0NnRadHZIczRqSFJMbTdyRmpCNDIwbE1MV1dlMnlFbjBLM3RTYXBDVkJx?=
 =?utf-8?B?OTVqMXp5Vkhkb2VMcW9KR0JocWkwQ1VHMERGUCtUeUo1NERFMlV0dk1xcEh4?=
 =?utf-8?B?Mk5kaHNJaXJiOW13dzVSVW9wcnk4MGtTRTAyVThHY25CNmtVc3NZSDFWRUtw?=
 =?utf-8?B?Ri9SQllCekJ5WUU2TWEyNkpidzJETFUrc2p0Y0RYYnJuY3Zqbm9lOGtBWkI3?=
 =?utf-8?B?THJEa1ordzVxdzkrL3RJaTFab05LUU5jMENDWnFlWWpUcjhVL3ZVMHpJOHFD?=
 =?utf-8?B?ZnJSR0tZZ09sdEpBdXkvYitaZzQrZWFrakMvaERxWExFMUl6R1Z1THJSYnhZ?=
 =?utf-8?B?dUwvR1psRUV4aHc2YzJXUGY3Z0M4MWIzRE9yaUFMcUszVVNSQVF1UlZyQ1Zo?=
 =?utf-8?B?TjU1RUR5MmRMajZ2UHpEMjcwYTd1d05FaWlLUWhLa255bFBpYnM0S2p3Ulpu?=
 =?utf-8?B?OUphQzdQY09iSkxIemY3bEdMd1YzSVJkMWRWMmxUZGFGTWRUWEhTelhRb203?=
 =?utf-8?B?cjlReWU1cGRWQklMRFFocGZsN2Z4dWpkSFJnTFVLWndROG4vSVNNNFFIWnpn?=
 =?utf-8?Q?dUGDC3F+y0MAAKzkzQ3LP2fYE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23be586d-c3b0-4028-60ce-08ddca72785b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 05:25:15.3106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPr/+V9U0heTRL52vKhtOx1O0/3DHOvx3RRPojuWEjMRDscvKc3JmtCZxOa3+Vi5V6n6q+hEtNwEInpLUIMeLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6995
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



On 7/23/2025 7:04 PM, Raag Jadav wrote:
> On Tue, Jul 15, 2025 at 04:17:26PM +0530, Riana Tauro wrote:
>> Add documentation for vendor specific device wedged recovery method
>> and runtime survivability.
> 
> ...
> 
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index bd81ebd370cb..d28c92f8b80c 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -1133,6 +1133,28 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>>   }
>>   
>>   /**
>> + * DOC: Device Wedging
> 
> Xe Device Wedging?

The document title is Xe Device Wedging.
This is just the tag
> 
>> + * Xe driver uses device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
>> + *
>> + * When device is in wedged state, every IOCTL will be blocked and GT cannot be
>> + * used. Certain critical errors like gt reset failure, firmware failures can cause
>> + * the device to be wedged. The default recovery mechanism for a wedged state
> 
> method
> 
>> + * is re-probe (unbind + bind)
> 
> Let's use uapi naming for consistency.
> 
>> + * Another recovery method is ``WEDGED=vendor-specific`. Below are the usecases
> 
> If we mean method, it's just ``vendor-specific`` with correct quoting.
> 
>> + * that trigger vendor-specific drm wedged uevent and actions to be performed
>> + * to recover the device.
>> + *
>> + * Case 1: CSC firmware errors require a firmware flash to restore normal device
>> + *         operation. Since firmware flash is a vendor-specific action
>> + *         `WEDGED=vendor-specific`` recovery method along with
>> + *         :ref:`runtime survivability mode <xe-survivability-mode>` is used to
>> + *         notify userspace. User can then initiate a firmware flash using userspace tools
>> + *         like fwupd to restore device to normal situation.
>> + */
>> +
>> +/*
>>    * xe_device_set_wedged_method - Set wedged recovery method
>>    * @xe: xe device instance
>>    * @method: recovery method to set
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 267d0e3fd85a..9f770db116f4 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -22,15 +22,18 @@
>>   #define MAX_SCRATCH_MMIO 8
>>   
>>   /**
>> - * DOC: Xe Boot Survivability
>> + * DOC: Survivability Mode
>>    *
>> - * Boot Survivability is a software based workflow for recovering a system in a failed boot state
>> + * Survivability Mode is a software based workflow for recovering a system in a failed boot state
>>    * Here system recoverability is concerned with recovering the firmware responsible for boot.
>>    *
>> - * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
>> - * to be flashed through mei and collect telemetry. The driver's probe flow is modified
>> - * such that it enters survivability mode when pcode initialization is incomplete and boot status
>> - * denotes a failure.
>> + * Boot Survivability
>> + * ===================
>> + *
>> + * Boot Survivability is implemented by loading the driver with bare minimum (no drm card) to allow
>> + * the firmware to be flashed through mei and collect telemetry. The driver's probe flow is
> 
> 'mei driver' or it gives the impression of a tool. Also, what telemetry?

Okay will fix this.
vsec is initialized for any telemetry collection
> 
>> + * modified such that it enters survivability mode when pcode initialization is incomplete and boot
>> + * status denotes a failure.
>>    *
>>    * Survivability mode can also be entered manually using the survivability mode attribute available
>>    * through configfs which is beneficial in several usecases. It can be used to address scenarios
>> @@ -46,7 +49,7 @@
>>    * Survivability mode is indicated by the below admin-only readable sysfs which provides additional
> 
> If it's sensitive, does it make sense to also log it?
> 
>>    * debug information::
>>    *
>> - *	/sys/bus/pci/devices/<device>/surivability_mode
>> + *	/sys/bus/pci/devices/<device>/survivability_mode
>>    *
>>    * Capability Information:
>>    *	Provides boot status
>> @@ -56,6 +59,22 @@
>>    *	Provides history of previous failures
>>    * Auxiliary Information
>>    *	Certain failures may have information in addition to postcode information
>> + *
>> + * Runtime Survivability
>> + * =====================
>> + *
>> + * Certain runtime firmware errors can cause the device to enter a wedged state
>> + * (:ref:`xe-device-wedging`) requiring a firmware flash to restore normal operation.
>> + * Runtime Survivability Mode indicates that a firmware flash is necessary to recover the device and
>> + * is indicated by the presence of survivability mode sysfs::
>> + *
>> + *	/sys/bus/pci/devices/<device>/survivability_mode
>> + *
>> + * Survivability mode sysfs provides information about the type of survivability mode.
>> + *
>> + * When such errors occur, userspace is notified with the drm device wedged uevent and runtime
>> + * survivability mode. User can then initiate a firmware update using userspace tools like fwupd
>> + * to restore device to normal operation.
>>    */
> 
> Overall looks good and gets the point across, but I think consistent
> termiologies would make it more easy to follow and understand.
> 
> method/mechanism/actions
> wedged uevent/drm wedged uevent/drm device wedged uevent
> firmware flash/firmware update
> operation/situation
> 

Sure will fix this

Thanks,
Riana

> ... and so on.
> 
> Raag

