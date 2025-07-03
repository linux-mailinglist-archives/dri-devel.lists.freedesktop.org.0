Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C1FAF7E5E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 19:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B2A10E088;
	Thu,  3 Jul 2025 17:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ad2yJP+V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCD510E010;
 Thu,  3 Jul 2025 17:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751562412; x=1783098412;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zgJtkFj7+D0o9KNZud9RkuPgAWcuPMKxrFTEsxQoG/o=;
 b=ad2yJP+VruyOhqes+AdFGGD7MW7gm4G7hLtrQMJvs/PeeDV3IKU37/dr
 DePKkaKwBvwDNLPwbXcQ6bHMlKk450fiLqEIla+b6AxhlBSq3wZwl+Cy4
 TfqqdmQJPRTPB5kRDsHqzQ0FnMj/pzGjMMDka3gQRzbYAEP85u3+DwZZ+
 lHgNBk45vP8zTK1+ctCjUsv+B2BW3OWlZIn6EaZS6EzXRlQFluXpb35qv
 4VZ5QDht0AWXRJf6pesl+bZG0b+w1kF932k3ES+0pZxGndQrIBRqc6Zho
 oxAEV2rQcfOHPM8YNpsajGyuQy6iDGqLiZtMCxz6ae5kVng6ZAah0UHMu w==;
X-CSE-ConnectionGUID: dF/0nk4/TgyJlMn32+InRQ==
X-CSE-MsgGUID: XQyA10/6Rb+ViZjxfMDdaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53618969"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="53618969"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 10:06:50 -0700
X-CSE-ConnectionGUID: UfAnm58xSn+8eS3luiI5HA==
X-CSE-MsgGUID: +m+nnR9yTEKSwGFQr8OlyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="154991347"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 10:06:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 10:06:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 10:06:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 10:06:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZOgkcTLq4qbsdvrs74pOC3jv/lPP2SsLdMsngHIniFjY+dy+eAvyGtOH7rzGmDmXygAOoxv94JyjxULN4MGSMx5AU2aA0ACNxPk3/facHi7bRmGFTD7pymrCSNUXPXuWX1f9aTueLTfVt8drqUvwb/zbjXUBsjO06FxJpaSnpPnARGVNw6vqOe6cY5QiEtf+XTA1tryacXCk+ChZo4bsxx6rTxQ4EgEfS1F9jvx30BhUk5ytJMJ9TmM8FdyC4i14bAmlIjy4Tw0AvntVKA9+4fcOWDwDavOZjiEv0NY6Fl/bdywWDY7qdqdWFuEtE8xjupnvHVQCoTJvJvjkqV4Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtrlIKzfKyW8tS36eBn79ZHtZw30J9hoRjKEZASvDZA=;
 b=pUk/8J5XgiEqc8OYCvOG5h15Wys3z1aQL0x5uUNJvGEgbMBoV75X8Wk1nK/bbkhlvO0XeZVSbPxEJLwfK2HxznB8G2rL//Nnj0wOxmrMTWtkbaMsAcWo9df4/qL8Hp65Ii+XBIME2wf35FAjtud7TJWocZTBqvJKy6WWSIUmQW6Kle+wjwaTpxnljw26cyANhahUdqsFc1EDyxvHTWtUdT79u7PCpikMXh8dwEjCjkxXHuuCNNUatbsnVfs168muU0XTYKsJikx73qxXYBm1tc0ENPqTGBws1mCO32cOYrW4Cd0a4Rp17GBpCRdIFgNSy3LAfUZTBNyto6E0shHziw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA3PR11MB9275.namprd11.prod.outlook.com (2603:10b6:208:57e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 3 Jul
 2025 17:06:43 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8857.025; Thu, 3 Jul 2025
 17:06:43 +0000
Message-ID: <737a4487-d474-4adc-b369-2a88792c81c4@intel.com>
Date: Thu, 3 Jul 2025 10:06:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] drm/xe/xe_late_bind_fw: Select
 INTEL_MEI_LATE_BIND for CI
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>
References: <20250702165216.557074-1-badal.nilawar@intel.com>
 <20250702165216.557074-11-badal.nilawar@intel.com>
 <aGWpHRrPR39LWKQ1@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <aGWpHRrPR39LWKQ1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA3PR11MB9275:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2dfe6d-f3cc-44a9-0f40-08ddba53fc00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NW9nUHlWVStQMDllaEhVQTRqQ0RkdWpJL0d4S0lqbzlENkhaMHk3T1BlUC94?=
 =?utf-8?B?ODFtSGlLR1M1Y1pRekRXaGR3SS9OSThPNWY0czA2ZmJPd1U4MXZYa2NrbENL?=
 =?utf-8?B?cjJMT1V0NWc5L3ZYOThSRm1xZkJ2bndndFgxcjRPc3RxbUc1SjY2K3RQN2c3?=
 =?utf-8?B?NEVyOWRnSC9DOWdQZHJCTnFQdE1nbHYvOGlJaUZUSVU5MTdhMVhYZmp5aDV2?=
 =?utf-8?B?QStqZFB2dGVXdHZSVXZkenFOQnp3NUdrb2pJVWZ4eVdjeGhOZmxjdTlYd2FR?=
 =?utf-8?B?Z0NIV21BeU9yK2hJY1AzUlozdHllUDAwSmt2ZU5xQ2dVWFVocTdCbDdnd0Fa?=
 =?utf-8?B?RFdrS25pN3lvblZDS3BKTFhpL3N4Vll3SzIzTmdKMWM0NmNVR3ptdWVJdlpi?=
 =?utf-8?B?MjRYQ2l4eVh4bVpOTWk5dWpKeWovS04xcHhqWm9JRlVSVGZRbGpFejBIS0lH?=
 =?utf-8?B?TmVSaEp3aFdDS0QrYkRSVlJ3OHEyU3cxcDlDNldHc1VwRFg2K0QzeFNSaUFs?=
 =?utf-8?B?bldvVWRkTWh2R2xZdlQ4cnF2T3pIREdZOUpZaGU1aGg2QkFmZ0FzaVI1cnZK?=
 =?utf-8?B?bDdDbTllV3FMTlkyTnBQRzVsTVRwdFlZMFM2b04zOU1QMWZsOTBsdmVkWjA1?=
 =?utf-8?B?OGptaFNkbXhIamhuaUVsR0owTUorNEo4TjArRjJ3NzhnQ2VMYVV1YzlKWTdh?=
 =?utf-8?B?aW03MUp5b3o3ZmpEVGJYTGFCQnFrNE5OSnFGZjJlSDlPZzR1SlhDbVFyTDM2?=
 =?utf-8?B?Uklmak13UlBOZzZXd1FGWE91S0J4a0JNNHphTUltTFlOWVFlYkN1NHhhNlA3?=
 =?utf-8?B?cFI4azVQaWxCMzhmWVhwVXFZZVZGdG8yakI1dFBYTldKQThzNlVFVnpaNTZ2?=
 =?utf-8?B?VGNQK2xzeTRmWTFMTkpWQi93MlBZQlhQWHZQMXhzT25xQXBvWTZzMnc4Z25v?=
 =?utf-8?B?N2NuejVOaFlJbFViM3BjTlJ1RHdFVndJTFVmRDRNZkNUN2xaQ0FlMXRPUVNH?=
 =?utf-8?B?cDZoaVlKNnpFRW5yVTJwMFgyU0tBdlRJOFArcVBMZjhrSU44cTdYdDFjeFVy?=
 =?utf-8?B?NnZaN3VNNDZwRi81M3g0NFlwY2h2N2h5MUxjOWRpcHpHK2tHRGV3OEhzVE1C?=
 =?utf-8?B?UVZlbWVyNzZrWjJEU0VlVmd0VkZIRERrMFFCWjd3ZC8xRGlPczRQaXh1V1BB?=
 =?utf-8?B?c2dUNWlROGtFWUlsb1ZCMmpva3M4MWtrOXVpNUo2N2hYcjFiek9uYzZzbjFi?=
 =?utf-8?B?MkxMK3puZ3FJZkxtNEFveks3elE0Mm1NbHhweGhUVzdXUC9ldGZydHBJajZi?=
 =?utf-8?B?bGllV281bXQyLzl6Y1l5UTJrVnNvL1RXdEZRN09oKzA5QXovNHU2UjB3dlE0?=
 =?utf-8?B?cm1idkF1d2VzcFgvNTJvZWtySStESGdtZ2JLeU9VVVJKOVRyS2k2VUVrd09N?=
 =?utf-8?B?T1c3MlBPb3RNQ3czMS90ZzgzMVh2eGFiTG84dGRsWEVpc3JVbFU3bXpDNDdG?=
 =?utf-8?B?Y2ZoNlZYc1E2S2ZiR2FIaitDVVFxaFhFZnJKcWFEWkZLZVZ4Vk4xcFNqZmJs?=
 =?utf-8?B?ZWZsNUxJM3UrRTdiVVNUM3ppLzJLRkxLeUFxUUhVRk4vZXN5Zi9udzQ1VkZD?=
 =?utf-8?B?YjFEUFNKZS9hOFhiMVZsR2NPSWRwbTY5SEFvYU0zR2V0WTRxc2hEYlQrdFR3?=
 =?utf-8?B?NFd0ckJ0b2RvMmIzWkNOekRWeGU3dFZ6WmhHczdqWkp6TjFjc0txUm5jQXNj?=
 =?utf-8?B?b3dWcU9lc1MxVm55RUJ0ZVZ5dGUrcko3Zlc3VzRRWGpUVU1vWnMrcXEveDBj?=
 =?utf-8?B?Y2c1MEZKS3k4cldzc0psTlg2dGNWZWZkL3d5M1Z3T2M4TnVSdFZWRS9nanFM?=
 =?utf-8?B?Y29SbFZYTVEyaUFQZWN2Y1lHRVlqUk1oUFIvTmZWR2l0dnlHTHUzanQyMEZ2?=
 =?utf-8?Q?zT2uLbQuHnU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTNhcGVnWUNKdUU5TXhwY25mWEZ4bmp0cGFJRE8wMGxJd29zN3czWVVwZU1z?=
 =?utf-8?B?QzF0Rk9aY0JReW9lN2paTTVqSGNGVFVoTXIxWEdSVmRJY29iNC94clQ3cGRu?=
 =?utf-8?B?REFNaXdTeHowaWkxY1UyNldZQnA5aWJ1bzhaVXhLOXM5aUJmY1AzY2txcEJH?=
 =?utf-8?B?OTZ0WGluT3ZKT0tpQm12L2x2SEVLNTBJQjZYdjJZQmkzZVN3UjR4QW9sUVRT?=
 =?utf-8?B?UXVyMjlzZVZUa25PakpabzJEQmxzYVZRNUFCQ1BGS3ZJNFVJc0p0U1RPUHpm?=
 =?utf-8?B?Z3VRV2QycEJMcmVpTDY1VVdlWC83Z2FDenBtQzVDcS9rNmN5VmtLT2E4NC9r?=
 =?utf-8?B?VEd0UUw2NnA0YllkNUpuKzVHUlFIaXhMWVoyMEgyNmVSK1ROVU9UZmlLUGc4?=
 =?utf-8?B?VzhQWnFBc0dqNlN2aC9NaE5HR0Z4SkJsR0M0a2d0a0cvajNPQ3hQaXRzLyty?=
 =?utf-8?B?QVpQUXM1VTZiNzlDclltUEtXcGlCbjZMZFArZHkwZ0RTQVJWVzVGWGxSTzc2?=
 =?utf-8?B?a3BqUldheVhkdEtyWWR2YWQvMUxXYWFGY2VETzVGT3ZxbkZNYytFTlhzdzNU?=
 =?utf-8?B?bFhab1dPU3BhbjVYbm1TZmlzeERkaEI4MXVwazUrRllvbnJPTmxHQTFwMzh2?=
 =?utf-8?B?ZjJBejRSQXczeENTdkNzbmFPR0ZrWmFLUzl1amFVcGNHOGdRZ0cxc3FuWUNW?=
 =?utf-8?B?YlRTZnIra1BDSUpGNTloYXNIYUJTZlJHRHFpeGxHdkRmZm54WERrWkF0K3k4?=
 =?utf-8?B?L1hzREsxNTV5dWVyQUVvb1pzaDRYWFN3QXVkNUxYMFB1S2E4S1NNRDVoRjdV?=
 =?utf-8?B?QkV0R2hJTFlZS3lzcS9iTFpKSU5FemhSa2NMVnJlK1EzVnNCd0tXMnY5TytU?=
 =?utf-8?B?VFAweE1GRndiaXJWQVpwamJzRENJeTVGQlVFSG5TekNNaFRVRUw5UXZVZ28y?=
 =?utf-8?B?aHIzcVhpWW50QzJ2UlFPbC8zcjNOMm11WjBxTDROUnlWRFhmOE54bEkxb2Zh?=
 =?utf-8?B?YjRlakFpdGhzNVJnck45T0dSNDlIWmlhZlZLaWtETHlIbnl1UVhCdzVwQlN1?=
 =?utf-8?B?ZW5XNm50dEtOemROTCtuazhRR2xFb2t4TTJqVTRSUXRoL1A5V2VTV05KNTlo?=
 =?utf-8?B?QUJnb3hRa2dSV0ZoS0hBcldtVzRvNnlQUlpDeGxjb3NZbk5CdmtUWWJFbUpx?=
 =?utf-8?B?UU5KMkRKSEpjM2Q1b0hYRUZ1cTVRVnFHaHhVVkhsMEt6K2R5WlZuQUVCdDlE?=
 =?utf-8?B?TjF0a3VWeURLUmViSlBCWnQxRlcxcVJnWE9ZR2xrN2VUL2RRdkJLK05HOWE4?=
 =?utf-8?B?R2dhWnZUNU5ITXhhaDM2M01pc1B6eXNiQWl2Qys5ejFKazh3N3E0cytZbzZU?=
 =?utf-8?B?RTJwNitYdnFrSUxiQk1PYkw3RXFqajFScHNFbUd4V01qK1VaWW9raE1kM1F2?=
 =?utf-8?B?TGR6NW9MK3lxbElZcWtQVzJORXRTT0RWMWVhcGZ5MmhGOWVDZkFIMGxBSFVn?=
 =?utf-8?B?V25kNkxlR2tVMHhhNjQvZmhWaTYzT0RwUTVBWDU2OUR6Z3BEQVlVcWMxMWE5?=
 =?utf-8?B?TzQrdmhxUnFKOWprU1ZFTmRHTlEwTk9QYm5CMHdWVFZnTmJyaE5YcEx2a24y?=
 =?utf-8?B?WDYwYlNsUW5yK00rRS9ZL3NCQmNTQjJXRndGY2Q4UEtyMEZ1L3BUSnBOcUJa?=
 =?utf-8?B?WXVqSEg3TTlOaGZZaTZWM1NsS2xDQlIwVWFyOHdLM2Vnc2phdG9iS3FGNXp3?=
 =?utf-8?B?cmlPd2YwN2RrSWkrY3ZSSjgrMExtSUp2SzVuemhRanBZUkFQQUY4U0Y2cXVt?=
 =?utf-8?B?bDh0eHpYNHQ5VGg3UlNFL0dIZ05PM3JqcVh4QWs4UVZma3dhS0I4cCs4RFZP?=
 =?utf-8?B?N3lTUmdBbTBKbnhuU3dKaENadmxrWUkxTmQwN3NVYkI0R25oVVhKQXZkWC9z?=
 =?utf-8?B?MjNzN2tza3diY0VOMGllUUJvYzNOWjBkUjdIbWh6NmRiMmpHSldxcVZraEI3?=
 =?utf-8?B?ODVrcWJlZ2trM2xLWUwvR1VydExVZDlaZElBWnZDUkluZFE1cXdTb2FnL1lI?=
 =?utf-8?B?RWRNaDZSbW9pM3lQWS9aVEoxUVllaGl1SHQyNU9WWVdOY1JZQWV2bVFLY015?=
 =?utf-8?B?RFdJV2FBVmIrdjNGZHl6Y2MrUEVIb2oxd3VoR2ljU1pzTXd0a3U4ckRtVHpu?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2dfe6d-f3cc-44a9-0f40-08ddba53fc00
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 17:06:43.0704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FkhUlyuoBrIQGjTHZT2Qj6EoN8Lv1lvNX5C10Z6YWdHxHpdd9HX0IUGUeIhwq6dwXLbTiRm9T2ELTSjUHLg2Kw7xwcBNqRkf33g97ZgN6z0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9275
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



On 7/2/2025 2:48 PM, Rodrigo Vivi wrote:
> On Wed, Jul 02, 2025 at 10:22:16PM +0530, Badal Nilawar wrote:
>> Do not review
> Why?
>
> Why don't we add this dependency here?

For INTEL_MEI_LATE_BIND to work we also need  INTEL_MEI_GSC, which is 
the config for the mei child device and depends on the config for our 
driver, so a "depends on" tag would go circular.
INTEL_MEI_GSC also has further dependencies, so if we wanted to "select" 
it (instead of marking it with a "depends on") we'd have to select those 
dependencies as well, which doesn't scale well.
This patch only works as-is because our CI config does enable 
INTEL_MEI_GSC with all its dependencies.

For other mei components (e.g. PXP, HDCP) what we did was notify the 
distros that they had to enable the option in their kernel builds if 
they wanted the feature to be enabled, so the idea was to do the same here.

Unless there is a kconfig trick we're missing that would make this work?

Daniele

>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index f66e6d39e319..ef3f4807b0b3 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -45,6 +45,7 @@ config DRM_XE
>>   	select WANT_DEV_COREDUMP
>>   	select AUXILIARY_BUS
>>   	select HMM_MIRROR
>> +	select INTEL_MEI_LATE_BIND
>>   	help
>>   	  Driver for Intel Xe2 series GPUs and later. Experimental support
>>   	  for Xe series is also available.
>> -- 
>> 2.34.1
>>

