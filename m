Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FC1BCFBAE
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3795310E112;
	Sat, 11 Oct 2025 19:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFtxYH4I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0EC10E350;
 Sat, 11 Oct 2025 19:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211677; x=1791747677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qOzO+gKf+CzPENdV5uoTSiSnQQ1nvNfNIOFp5UIZmVY=;
 b=ZFtxYH4Ixu26wyCAo0vPgSvEO/VG6ASAsEoL6PQodUd1pBTD9Bqrzm/B
 W/nSMOde2yG3sl/OUEzcuR10w0OnM5wSjt1cGBPihZzj400BSadWtAP9M
 XF7lgk/hfj6uDTdL1QmWG7FDA42MPLLnKK9TLGLLxVGhh0PPOCwodT1AT
 MNuzh81XjcfjXAuoU2r+0rp6Kz4pgzz8UgoImOWfDctCOdayRbd30tRWn
 eIRBh4Tt5fv0MBj9TkGJOE7L7sPx35y/4ehijkyV5hFJXyPRpmYQEN8j2
 FrZgbEtfK44xV8nSQo4iIxhB35g/Q1Uv8RdnBeL3j9DHb5l3oWE2URKyK A==;
X-CSE-ConnectionGUID: Ztt8D1CZSpy4YLoODG0z2Q==
X-CSE-MsgGUID: z+BhM1nVRJOoaZZRX88nOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="73842055"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="73842055"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:16 -0700
X-CSE-ConnectionGUID: 2Xzzckq8RuCJf3cMtfMWCA==
X-CSE-MsgGUID: z3V9hCPGREaE9iq5ytj//w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="186343993"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:41:16 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGlqDc7vMhPQpMoWSkaPYpwbkh6q1DI7b4S1Wj8qWrfOh1uytP3jNZ1b/puV2HHlJ3F9VW6lniFQvigZGm/rP30umgSoPOHdhL1R1tSZxfi+OutHudCl4odgLdktiEmUGyZ/tVYgFd4+iCChtpxX0ftvJAayHYEL5EgpgVdx7BulYgu15WpRF0JvthW2jolnm3GPIlVFjGW8jEVzbrSx1mu/Ve47eyIdae/Hpxgpi/SmJXop8Bs3rRlyDBWZTdEBMSRFN7L2X8+pvOgeuVpe+25FeT/HplVN0PQbNNLDohi6p+uxB4c71XQQamE86r2NWwGoiMlrnY7obtIkHDBSyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeOTfDOZrR0PmyWi3+AB61On6FfgpN15kmNWvx2UF5E=;
 b=gs2E6lO1yAZrKK+cUV4j6XYTqbfOLySeH/0FGHCEYMn/mc3Hi2C8RmtpCcCfXWjWgRGsY94tp+epin+Xi0dxhTEZcV+vXSo5PVVke0aE52BDPpkcd3XHHa9m07dmd2V+oOW8Ae0jBmse33FFeoi0AUhGFnx1CI1u4B49z9C7gOGV0ssGBlXXBAXDoEG2Kal8vcIvikoDaIyOdgTj1xTfzwQ1XzQUNUjPETZ5ptTpLUh/hvY3RwlFoOukjE5VZk5FPIXLpJFdmAY6svrx1SazqEIIUwh5tvDSqaxdgrvqXPTo5N7B0jTz8N0fhQPkk7saIEVcnlhzjU7FehZsdesbjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 19:41:14 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:41:14 +0000
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
Subject: [PATCH 13/26] drm/xe/pf: Remove GuC migration data save/restore from
 GT debugfs
Date: Sat, 11 Oct 2025 21:38:34 +0200
Message-ID: <20251011193847.1836454-14-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::9) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: cd6d6266-d1e6-4b67-8963-08de08fe2349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTc4Ylg1OUVkVjhOQ25Fd2NjVjk5dk9rZTlQZE1GZ2xHeTU0WHhvazBDMXQw?=
 =?utf-8?B?MXpLT2JhS1V6TUtaNjVOUGdqTDluODhzTlh5cjZidit6NUswMFVTM3pkbW9U?=
 =?utf-8?B?NU8xeC9pbUt3QWVaV3JGbGpGVEJwdDNRY2RxRVlTQ0ppUno2cUNjT3N4RlRi?=
 =?utf-8?B?Y0c0eE9UZkJrcHltS0FONFAyc0dzUGE0cWo1UlZKb0QzaDdoZkZtY3cwbFJM?=
 =?utf-8?B?UVlTVnpKcWhkWkVHTlY0ME5iTlplVXhLbFBUbm4yRE1QRzdzbi9FbW5kdnF3?=
 =?utf-8?B?R1JrbmVCTlU1NHVvNGp6bEQ4N1BtaVZWWUxabDRjMGN1aUpZZWlXOVNBY2Jk?=
 =?utf-8?B?V3U1NVlYcWphZ1p6M2VRcElrVDd3NXh3ZC8zcW0rVFYrUFpqS21uSE5ZR1hF?=
 =?utf-8?B?SHZFSk1Hc3JnOWtSSFppb2hicnlIZTI3VkVVT3Vkc2ZRWFZPU3NMb0hWU0JB?=
 =?utf-8?B?WmZ4N1RLWFZLZ2FnQTJNYWxyU0JldWJUVjNmREE0eHl2cDdNVDlzZWRUSjlN?=
 =?utf-8?B?R01jQ1pPZnM1N3FXb2M2cEtPdTFZWG5tcy8xS3BjYkJzam5OcW0zbk02NWpl?=
 =?utf-8?B?TEE3Vm9xQjhNK1M3bnBWQjlVQUp3VkpWaHZ3YkIyWXRZb3dseXZCelAwc0pa?=
 =?utf-8?B?c2tsWEdUOEdsQkcwSVpsa0Naek93WndFMHlYSjJDTnc3S21VR0NoRDg2d082?=
 =?utf-8?B?ZTd3cmdwRWQrZmJNV2VnWGFQWnN4TlZJL1ZjWVVYb1Q0OEZwMENkZ1R0ZStG?=
 =?utf-8?B?SzJRWWRza1B6aEpFanpOTWM3RXRoVDYxMkgrVXpIU0ZMTkJmdi9zVmk0Um15?=
 =?utf-8?B?djVoU3VWSlRYT0MyVWRIeXVjK0pkK3VhOWpyVlI2Z3ltcWhvb1RuUFd1V3R1?=
 =?utf-8?B?VGJXQ3VrSzlUaEVRNkhyVW5RRHd6U3A4SGhOR25vTWxwUnc0TXRTYXRhUXp4?=
 =?utf-8?B?MERZYW5taUtHeWF2Y1JxTU5RQ0k3a0JDTitnNW1HMXNrNTFGTVRUd2ZJQjM4?=
 =?utf-8?B?OWhlT3pSSVdzYWFNNnh2WlIxdzBxbzdCZmVabkhDbml5bEloVCt1TDVhdkxy?=
 =?utf-8?B?Qy9SdmQrK2dGMmJJOFpzQjYyMXd6YmpLMHVxUkZ0RkpVeVhpcDlXbURQNzRV?=
 =?utf-8?B?Z3lSMS9tMDJjbEVwcThPWlZ6TVJ3R05aV2tSWkFQeCsvWU5UeC9oc1VXR3g2?=
 =?utf-8?B?Uk9sL0ZucVlaRnNEeERXNDJXVHRmQTRONm9kVUE2NXBjT0RwRzE1bGV0dUxZ?=
 =?utf-8?B?TjVYbmJoSXplc0hoT0VuRkt4YmltQjFjbEYxS2pzOTFvMG4zRWU5dG8yOGl2?=
 =?utf-8?B?bHljYWlKMUdoRGhrdkZINUNCQnExb0EyOTI2SkZoMTVEVEkxM3h5anhXMGR4?=
 =?utf-8?B?cnRseG5oNTZHNDVJeWZKT1lnQ2N2R0drYkVkU01qRHROYkxPOElKd1FPSE9j?=
 =?utf-8?B?M2FnUUtBVkh4RFhYL1kyQ2FEalRtUCtGR1BacVlEVkcrakdrK0NNMWlPMjc4?=
 =?utf-8?B?VTVhNFFVM2twL3UwUWoxSFNzbmQ1NmpYaVhrbUFaMjFwb0N3dHpQckl1cmh2?=
 =?utf-8?B?UGc2NG1TSFh4aXRIWTZ3dUxpWnAwUWIyU2crT1NaMmZtOGROTUhzaVVEdHBi?=
 =?utf-8?B?SFQzK0VEbFF3ZmxzdUxwQjdEWkQrOGhPaHNkZ0lEdUZFcGorNVpLSEhZM0py?=
 =?utf-8?B?SmZKVnVMVFp4RWtaWlNGVnlwMDlveDBMSnFCc1QwL1Y2TWdUdDBLN1FGQ0Y2?=
 =?utf-8?B?dUFFT2ZqMGJ0Lzg3VFFwcWtCYVM3YmNlQnBhNm50L2lPQ1VYTTVlZnJzT0VG?=
 =?utf-8?B?N2U2UDdLVEY4RHI5Tk1vRmgyV0RaeWFDVmdaUGhuSHlWaWVjNk5KM1IxQkxz?=
 =?utf-8?B?WU14NXM2c0IrOFJTK1k1MDJ3Zi9nVXI3YTVaaDlnQVF6b1EwS2FOUCtIM1pr?=
 =?utf-8?B?SlR4Mi85ZWk5SWZaN0xDMndqaTBLOWtJNm9HVDVJS1VtRHlFck1mV3NHYjll?=
 =?utf-8?Q?6YNr60vbEGrBkGD6LPOlKK7fj6uuqw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVpwVElhVkg5U0ZTYnVIbjZOQW5pNDNTQ3pzZGdWRGxydUYrMkNUVHhsQmc2?=
 =?utf-8?B?N1Yvem5xNnVXb0MwU3FHL0tLUUQyUC94UzVwME90VDR6UmZRUTNlT1M5U1V5?=
 =?utf-8?B?YzVmWnBJbEtDKzdsNGhBZnlLY1hXa3dQcmlRRHBScUZhTTlLTTBGYTJsUnNH?=
 =?utf-8?B?YS9CeU9qQjdueDZVZWl0eG85ZmZwem1NNk91cERFeGI1cU9JbW9QTDJjbFV1?=
 =?utf-8?B?ZWhyNkcvdlorR0xDdFFRdzFQeTNOT3Z1ck1vbnVsZTZ1dklyeDZTSGhzK3Rm?=
 =?utf-8?B?WW1LM0c4NWFoMVdDVWVRNm0yL3drcnBNMVZSa2pqVFIyZ01XWTNkRnBaZVVG?=
 =?utf-8?B?T3VYYlFmTThqdjIvRlc1dlk4M2xuU2daRDVISVYrVjN0TEhUTFhaZFBCNElL?=
 =?utf-8?B?dTFVUkxEZUZOYmlBS3dUVEFYSllNUGp5M2RUQTArek5zQnlpakVnd2JQYWhF?=
 =?utf-8?B?SVFrV0xGN1JsVEEvQjBYNmZsem5RbHVTZURXeEdSSGNIUGRVSitZa05HZ0Zm?=
 =?utf-8?B?TjJvdHdJemF2UVJJNDR6RUJmcmgyWFVDT1VTRm5ZQjN6ai8zU2crQkwvNnc0?=
 =?utf-8?B?QTI3b1BLRUVmRmxHb05uODF4N0xYSy9Xc0JXaHNnc2UrK1dZRVhPazRDV29t?=
 =?utf-8?B?ZHlha3BkYnhudXBzck9Ma040Wkw1bDI2dXNHdzVQUmVHamRhL0NVeGg4eWlJ?=
 =?utf-8?B?TTU5MTlOa1pBaDhrVlQxMXVuaHNjNS9vTy84T2hRa05zMzQ2MUgvWjJXYU9C?=
 =?utf-8?B?QkdJNFh2d2hpTmk0SFpIUWx0ekZLV1FOTndqKzhXRzkvYWhRSHQrRjU3TVVM?=
 =?utf-8?B?a2F5amFhMEloT1VGbzZ3WHlKRmtZV25jRnYxdXpmMlV6OHU2bnZiS2J6aWFM?=
 =?utf-8?B?bUNYN2x3QXY3ME9PTGJYYWhzS2ZqWDVFY1ZmeGQwemVsN1FCRTlUMVN2YVk5?=
 =?utf-8?B?QVVseHhJUFcwNXVlS3hTUFEycGJOWTlET213QzVISyt2NnBOTm95S0d2V0xP?=
 =?utf-8?B?L3N0Y25mV3plMkpKbmx2MDUzMDJtbGM1aElhNGpEcjc1Z1A3VFNWOWpwdjhZ?=
 =?utf-8?B?MnI3UitWUEoxTUhyTVdpdWtReEczOTYraVQybW1lNmNBTk1NcXJ2VUQ0bzlF?=
 =?utf-8?B?ZTJRVCtPY3FmVnFUbTcrTEUySGtscXNjMXRyc3lCRTF2ZzFTUkprcXVKcmtE?=
 =?utf-8?B?d2hHNGl1cVJJdVdmUVVhQlFGdDc2YmpKenEyWHRYc29veEk4L0NVd0QxVmZB?=
 =?utf-8?B?cGxqZzJJL1RldHpFa1IvY0doRnZPWkllREh0WU5tSlpuWWpKR2tMaWVXYllx?=
 =?utf-8?B?N2Y1NEU0Rnp4a29OVkNDeXdQVUVjOFhKQnY1bjcyLzdxcjFBSU5wSDVaREhD?=
 =?utf-8?B?VjZ0aXd5NUJwS2h4RXduV2lzVnF0ME04WldUeHJlSnVIQW5JTHBHaDhWdkt5?=
 =?utf-8?B?aDVHblg4WFhEbU50dlBkUVVsV0l0ekVZS2NmNHJhbmpscExSeThDNjQzZFAx?=
 =?utf-8?B?WTQrYmtQUXI4bzVUVFdCazZLMkNqd0M2NnhVcG1aUURWa1hrMm9QeHQ2VnlF?=
 =?utf-8?B?RlB4LzRsbjlYSy82ZEVMWmFNS0JQN0plU1lwRzJhVEpEci84UC9LNDIyTDNO?=
 =?utf-8?B?TjREcHd5eXdOeHZIdU9pb0tFT1Y2VjY4QmxOd01ZVlNqRDROQ0t6bDBjTS9O?=
 =?utf-8?B?cHlFcFYzQThudVd4eEpuSGhrWU9sRW0raUVxV0VIbmZyTnlxSEFvaDFjYytK?=
 =?utf-8?B?eVZVWGxHSkw1eW45TjdxQkNndytQR05XRjF5UGVSQnlsVzd1MGlBekczd1lo?=
 =?utf-8?B?VWRWc2FRK2RlTmFkRUZOR3hLUU1sZnNXUUtVL2Zta2U1QyttVXRtZGMzQ2VZ?=
 =?utf-8?B?b0kwQU0vT0VvTkFsUHJQSkF5NEhOLzdqdEhwa3lpR0tmTGJLTnMxdE1tRlpw?=
 =?utf-8?B?RlBLbktuV1Q2VEV6bGZ0dElxY3R1UWRTTzdzRVNtVkwwTzlGYm1HNy9wUzAr?=
 =?utf-8?B?R0VBclU3V0xXSGF3MUVLZDQyRm8rbmJxbEFHVFppSW5JSTJKV3lIS2tlRmdV?=
 =?utf-8?B?RzZyWTJwa0V6Snd3NDI4RnNkNVhiWmVrenFNZmg0ajhZb1g0MitBU2s0dXdk?=
 =?utf-8?B?Ri9CSWVUZGpyMDBDdTJkUmNHVlN0UG9tVThVYjlTRTh0TVd2Q3A3Y2U3MUsv?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6d6266-d1e6-4b67-8963-08de08fe2349
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:41:14.1199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5ClulcyNFHViNxFjDSdAhdHC/u7+CML0Ar6GpoXyElSIk1Z/fHeLDoWpE0h6dCPZmz6n0FeX0ad3gN/29U+wIv+ZkQq3/my42P0uBG3O/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
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

In upcoming changes, SR-IOV VF migration data will be extended beyond
GuC data and exported to userspace using VFIO interface (with a
vendor-specific variant driver) and a device-level debugfs interface.
Remove the GT-level debugfs.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 47 ---------------------
 1 file changed, 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index c026a3910e7e3..c2b27dab13aa8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -320,9 +320,6 @@ static const struct {
 	{ "stop", xe_gt_sriov_pf_control_stop_vf },
 	{ "pause", xe_gt_sriov_pf_control_pause_vf },
 	{ "resume", xe_gt_sriov_pf_control_resume_vf },
-#ifdef CONFIG_DRM_XE_DEBUG_SRIOV
-	{ "restore!", xe_gt_sriov_pf_migration_restore_guc_state },
-#endif
 };
 
 static ssize_t control_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
@@ -386,47 +383,6 @@ static const struct file_operations control_ops = {
 	.llseek		= default_llseek,
 };
 
-/*
- *      /sys/kernel/debug/dri/BDF/
- *      ├── sriov
- *      :   ├── vf1
- *          :   ├── tile0
- *              :   ├── gt0
- *                  :   ├── guc_state
- */
-
-static ssize_t guc_state_read(struct file *file, char __user *buf,
-			      size_t count, loff_t *pos)
-{
-	struct dentry *dent = file_dentry(file);
-	struct dentry *parent = dent->d_parent;
-	struct xe_gt *gt = extract_gt(parent);
-	unsigned int vfid = extract_vfid(parent);
-
-	return xe_gt_sriov_pf_migration_read_guc_state(gt, vfid, buf, count, pos);
-}
-
-static ssize_t guc_state_write(struct file *file, const char __user *buf,
-			       size_t count, loff_t *pos)
-{
-	struct dentry *dent = file_dentry(file);
-	struct dentry *parent = dent->d_parent;
-	struct xe_gt *gt = extract_gt(parent);
-	unsigned int vfid = extract_vfid(parent);
-
-	if (*pos)
-		return -EINVAL;
-
-	return xe_gt_sriov_pf_migration_write_guc_state(gt, vfid, buf, count);
-}
-
-static const struct file_operations guc_state_ops = {
-	.owner		= THIS_MODULE,
-	.read		= guc_state_read,
-	.write		= guc_state_write,
-	.llseek		= default_llseek,
-};
-
 /*
  *      /sys/kernel/debug/dri/BDF/
  *      ├── sriov
@@ -561,9 +517,6 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
 
 		/* for testing/debugging purposes only! */
 		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
-			debugfs_create_file("guc_state",
-					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
-					    dent, NULL, &guc_state_ops);
 			debugfs_create_file("config_blob",
 					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
 					    dent, NULL, &config_blob_ops);
-- 
2.50.1

