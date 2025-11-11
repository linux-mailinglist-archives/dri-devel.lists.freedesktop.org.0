Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61683C4A325
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43C410E4CC;
	Tue, 11 Nov 2025 01:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nuTvUXMv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFB010E4CC;
 Tue, 11 Nov 2025 01:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823183; x=1794359183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sizYxiw/i/8r8ogCd+7yLCBQm+gX0NcvXZIpcppOVmM=;
 b=nuTvUXMv5Bt91Umk50sq1F4Vz9hzCq4S1wW7tv9flMxjfbj2rnVj5R8J
 jVFcetgt+hFcYdyIXDbP73KZgmNLpcAmq5TsP2kAFbTRWMoQhX3rgzRJ9
 OyfjAdMeQ/d6a8/6BCylm/TZpnMraCkxpzOPocz35lhDppaLw+Y/DoR5D
 Ce5U8GGrT9bgJ80ZBMf6gRswMH8Hq9ytYbyANGS/DC6UipbVkd6UnyGnL
 Z/iSzBSiS7Ni6Wqul8ujTxQVge82p/QZ0dvVlFRG5VOGPRLJUEaCgL4I5
 rowK/dyogyofuLC1JA0wxTZOXnF2DjVvKbw21ApkA4PQUDTtOejrzsJmP g==;
X-CSE-ConnectionGUID: vJsL4+bkQwa5ts+NGJXduw==
X-CSE-MsgGUID: H6GzCUf6Rne7XxYzhMoHzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64969644"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="64969644"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:23 -0800
X-CSE-ConnectionGUID: 0oxk9Ca6S7a9Aqix685kjw==
X-CSE-MsgGUID: M2neOT5PS8yVHodFJ/iNpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188657238"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:22 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:22 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:06:22 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHrxmBhUZ+mUjKb/uTMIVZONsF8epFCKndLzwxvd7wv+mU5GB11XSNBh++cRRRc4x5O03GqhA/kpVdIwwUwHa5lfGgR65DFRdNugiFXExU1Wjp8hrvlneaIDZIWIy06xCRBD+hTSoS8T8muhtMQlNSW8SGjFcCDzvEdIRE9R80DVsFKInf5UlzJ6yHY3voRePOsAQF7rS2h1ARoIm8NvybNgOH6D2UYbqEF9IyM0Ahu3rbmeN5q4LITTpInTHm+Kt+llF51FgOe3ZsRDzVc//sxNSJo90823W/I2BdkETyc1LRkoriQG7ZC3MViDJZLpaMfFO7vxtYJUj5FvJ7oRAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahmIcA3lX4ElQs52mznjIobMwPl8/sw9nldUTP0dIYU=;
 b=kXOY2EmUsbHE7shve+5KZJagE8pgVfCMAgq1YpyDsHaXkcrD5Y7bAOc52ZeD5ISmgUGU8a8p0+Dqo57F0Q+E3IrjHeNKTnBBPXwSAynd1IK8q6dlnxw88H2xpiWz9G58iwAy/1MP/ti6Nlv+cnwakB1k+tIJIEhN96mkkvjW+Fcy8GNME/mPLQBi89+hlvGH8yrPppyV5kjfyUO2kQww6vNPgshT3N4oHqHuivygMoPIh40Tpv+UrTYwbuDpytvS2Nv16omEl/GrkUO5QI4BFvTbaKQc+cbwxgQlWqGwTFFpWTEoKuE1gcZN6RqEcBTTMG9qC/mjvKuVHVHgDU15ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:06:19 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:06:19 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v5 17/28] drm/xe/pf: Add helpers for VF GGTT migration data
 handling
Date: Tue, 11 Nov 2025 02:04:28 +0100
Message-ID: <20251111010439.347045-18-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0202CA0026.eurprd02.prod.outlook.com
 (2603:10a6:803:14::39) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 45276c76-57da-4b89-b726-08de20be85e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZURhL2FDaHVUbXhJQUgzcFR6UG1KckhQTkFFT25PQ2ZMalRzYi9KT2pKeCtm?=
 =?utf-8?B?TkNTTUZJQkxkK2VKSzJMazRZNDRKRFFTYklwQWNCMWNUeDFxZmx4YmYzVHZO?=
 =?utf-8?B?QW5UQWpBa2dkQm1pVVpYSW9xbkYxczllUkkwVlB4Tkw1UkNaY1JHWjk2cTFO?=
 =?utf-8?B?UEF3ZUJHWnhyZmNCVTd2YjBLNG5ick82SFloWjJWejZBZDcrK3BPQUtzZmhz?=
 =?utf-8?B?aGp6VHc5OTBVcGE1MGhOZWRQOGU5RzJELzZoc3FOZnlUZ0lpc1RZWUxpeU5y?=
 =?utf-8?B?dGVBMHhjZ1J4c3lqcUNTWnZWOVZoWHNZRkxLMmdJVWdBZXVZNkphMHoyZ1Ex?=
 =?utf-8?B?dkp0QXNJZGlWT08vNWJDQTdha0RxMGtmc2J6UDdsOHBESkR2ZzFNc3g4Q1Jj?=
 =?utf-8?B?SGJyVDROWjFWQ1RTNEs5VmpTY0NsWUpJcUN3emF2MmdFQnBHZVZYRkdLYVcw?=
 =?utf-8?B?QmNwclJNUHVoMEhnTlpNNmJSczFFUkVvd1BTK3MwTGJVZ1F0eWdWYy9PMG5m?=
 =?utf-8?B?ZVlCbGxERVU5aE9aSmxHeVFSSVc4RThxSEhUdTc4cXluY1hNMnVzODlSTDhp?=
 =?utf-8?B?SG10YTZvR01mMkxSSDNUNEVncGdTbE9xeHBYUzFkOURCc0ZmbGE2OS8rOG1B?=
 =?utf-8?B?Q0JUR2UzRkxPTVA5SFFMSE9GSmhQNlhtSEthcEFXU3A2cG5abHVaUmhsKzBN?=
 =?utf-8?B?ejFmQVJwWXJxV3o0alBKdGgxQk5JcjJrZzVnOUNQN1YxQ2EyRWxZSUVGUWcz?=
 =?utf-8?B?c3dISDdUYVplOFN1VmVreWtsK21pb1F1WUJETCtjU2RqaGNhMHBDbTZBU3U4?=
 =?utf-8?B?YVl6bU9mYXF3MGdnZW12aW9pQ2tCNDlKd2ZLZEdvOVJBUXhXQ0JBTm14WVU4?=
 =?utf-8?B?a3lidUZIR3JFaXA0TENKU2lNb1hBOERMc2JUZW9FbWdyNVJyMGNhL3BHL25U?=
 =?utf-8?B?STdtSnV0emc2dGlKeUFEVm5MVmV0MmFrV1NsZE5vOVo4T2V0dHZ1bEtucklQ?=
 =?utf-8?B?NzdZVUdNQUF0UXlzTHYvSjM0ZDJSMjY0MWhLUUF3anRlTEFQS215RjArd3Nj?=
 =?utf-8?B?ajdkaE03SXBoMThHWTNWOW5ka2Fwb21KMERXY3BrVlVjM3h1N1VsTUNHcFlT?=
 =?utf-8?B?QjFTdTZFZkk0S1lIL29ZVVhraThDWmw4SFg2MnB4Q3FyV2QzV1NvRmdqc1JM?=
 =?utf-8?B?aHV3WFNzS1ZhaDJaNUhzbi96UUpMMWl4elNyUVBIQ28xUkpTTEdHWVlvR0sx?=
 =?utf-8?B?elN5UlBCVnVvcDcyV3praDUvT0JkMnAzdkh3KzN5ZzdqNmhPeDBCK3o3N05U?=
 =?utf-8?B?L082N3Y4R1RFRUNERy9CQzlHeHRQcTQycGoxVFZvVTNIT0ROcWx3T1l4b21L?=
 =?utf-8?B?VmxnZldyOFVzZGVtNU5YVStLeUI2RDBISUt2QjNTMFkyemlmaGxBR2IzOWpa?=
 =?utf-8?B?ODAwMGZycGdCUUVDa2VFdnZUU3FGYkVVWnpWVlI0ZzdxYVRyL0lZRjN3czFo?=
 =?utf-8?B?ZHJYamprdlJsdVpuWFlncFVHZWhCTDV0citiVlRaSmhXY0tkSTRnS2E5K2tH?=
 =?utf-8?B?OE5tenBUODAycnhLbFZoKytRRThsNy9wcDdWSnBvY0lGdzlXVFNnV011am1G?=
 =?utf-8?B?NW9mQS9Qd1gwTXNBdC9qcVVTbkpZaTZzQ0VnR0lJbExyNWo3UnZZbGJPUmph?=
 =?utf-8?B?L1ZvU0YrUVJ2QWw5cFl3dEpaNmFPRGg1ZGovN0l4MjI5TDgwaWtZV0w4anlQ?=
 =?utf-8?B?VkpiR1R4M2dra0ZxcDJaeHVxaU9mcVpaeVFKblRnUDZKZnU0QjRQQTZVM2xu?=
 =?utf-8?B?VUJmeEpIK3FPdFVoRWlqb3p5bFdRVkpZSnpob251bkhSZVpxSUdWaFZvTjJZ?=
 =?utf-8?B?dzVRb0w0bkJjc0pJM3NZSjlWclJ6UENXOWFJUlJOaWo2OVA5azVabDIvNWcx?=
 =?utf-8?B?TzVSdklrNGtJVE4rWWNaLzVRbTI3MkRuV3NJMjdkVGpEUG9PelVDV0F3cEt5?=
 =?utf-8?Q?ON1sl579pG+JjM6tXzHD37wa3adt0Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVRaRXNkMmhzUEdqQW85OGJ0SFArblZBY3JEL0M4NmZhNG9TQ21NNC9NeHRL?=
 =?utf-8?B?SHNCbExRaWFwbmZSUFI2WU8yTzFXOTR2Y3NBUERuT0JsQ3JWRHZjeW93T2Nj?=
 =?utf-8?B?VlRHcmRzelExWWtpbzZWd0E2dVR6Zk9NY2ZDYXlDeXVLTFNxaWdmV1FwZ3Ni?=
 =?utf-8?B?ZG9yWnJQblRkaDcwU1VPM0tteXZyUW1VTVRGaDltTFo4Rllzb2gyd0tWUVh6?=
 =?utf-8?B?QXZlYWFCOGNpYWdNemVGQ3NaYi9ZZk5KbG11aUlEUmZrdlRleFI0WTB1WEtr?=
 =?utf-8?B?bkZ0Q215b0JwLzZXc2V4NHJqNStHZ29UVWs3bVJHS0tvdDdEL0hCVEh5K3pO?=
 =?utf-8?B?OTBFU3hXaU01anN3TlMxbEYwd01rRklJdkNLTWZBNmxPY2ZDdmpBcmNOMTY4?=
 =?utf-8?B?aE90bWM1UkRKSWxvcE5jVExENThiaGx1S0RYSVZIeHJESkoyOVBKaEtoSHht?=
 =?utf-8?B?aDUwYVpQbUhjUm10eTRPR1ZkYmVZMmJ4VFRlRmd2QTVpZFJwM1UyTzFIT3h2?=
 =?utf-8?B?ODZ5ZE5XOGtySUluMkxiUnlIV3YvcFpSTkRNVW9RM2JDODZ4REZRTDFQRE1q?=
 =?utf-8?B?UkhIRlprNGE3RkdLWFV0Q2NEVnpOeXlGdFlpZ1doZ0phTDRqVzd5cmRqSWpz?=
 =?utf-8?B?ZnhZU1VReHhMR3Y1akZMZkdGZ0NzbmRwWE9xaUJXWEQvWUh0ZkVNUjRJbVUx?=
 =?utf-8?B?SERtREMyYm9uVzVkbER6Y01SQWF0L0d2b3VhOWVNUE92NFZxQ0Y5WmtOMzgx?=
 =?utf-8?B?SzNXNXpFT1FIRHA2VmtyeUFMN1VXZStlOStwbi9iMUlFL2JSSWlRclh0aEJO?=
 =?utf-8?B?V3QwUVNoK2ZzN2Q2bHlFczRYZFZ6S3BCcDk0Tk9FWWM1QWl3cHNhbW1YamJB?=
 =?utf-8?B?MFQ0Snhta09ORElmMnhGV2ppUVhTbzlQSEF5T1hIcjMzWWJoSG1WeStDdVdx?=
 =?utf-8?B?RnlWd0hqcUxWQ2xzWi84UXlEKyt5ZGNIZ2s4TVlhWWl1cVJGeHNWV2dVQUV6?=
 =?utf-8?B?dVQ5VzZ5OG5ta1FUOVNxRFNyZXpBaUZDUWRKNk1kMkU1TXM2YmJ6SlF4MmRl?=
 =?utf-8?B?NGpTTDNNTCtSVGU3ZE9hS3MyYXBDYUEyOGxWRjFGNjBYeExscTYxdkpMK3N6?=
 =?utf-8?B?anU3dHFrRk5tcUREVUlJYjBnRmlBa0J0dXpjMzcxNDFKRWx4VTZ6SlpHWU91?=
 =?utf-8?B?T1AxbDhjMEpwVEx0ek5WcW1RVDBVeitQandZdmtOOHB4NVVvTnUweUt5aGY3?=
 =?utf-8?B?WWhacXh1TnhKenB6M3hSb2Qvd21VU1JDQzlhcVYwV3Zpc3I3QURLQndlSE55?=
 =?utf-8?B?aUluZjRVd0VQcy96VFlzRXRaN29ndVc2Tmx0Vk0wVjFWSUYyY0sxUWRsckFo?=
 =?utf-8?B?VGVYRC9TOXI3dmRGaDRLTjI2S0NMeXdsZXNkQ3FtZ2N6VGozTDJJTld5QWor?=
 =?utf-8?B?MEJsb1NQWnRCbUhwRWJ6YysxSFF4UTJNYzgyTnM0bERPSzNrWmYrZkFlVDR0?=
 =?utf-8?B?dXJBMHNoYnl3ZngyRVp3bmR2dmRkMjVtdXBZM21JQmd6U2liOUYxaGM5ZjIy?=
 =?utf-8?B?dmhydkRHTWpwazVJOXRZVnVNYWZtU2pxWFp3TEhYSFQ2OXdGUWV4NFZmOXFs?=
 =?utf-8?B?cllMdmpmRU9UL3oxLzNuaGFEcHR2dVJvYlV1M3hqSG4xeDNDc1FvZXk3dm1R?=
 =?utf-8?B?N0J6QitMMXRjYVRvaTR6aUltNG0xSi9SdVpWVmlRM0NWZmFmVUd6bHU4bGE3?=
 =?utf-8?B?azlkUnJzaWE2b04xT2tWOGF6YnFUcFNlRjFhZmF2ZUJlUFpPTlROTitBL0F0?=
 =?utf-8?B?M2drMEJySE44NU9Gdy9wZ1dzdE83bktOU2crd2RKQzlORmFHb2NuYmg0dERq?=
 =?utf-8?B?eVBIRnNwNERibHdjMDlKSmNoanU5ZnNZeWJGV2V3RUVJSnRsZVhOQVV1Z1J3?=
 =?utf-8?B?bUhiSlZqaThsZ1h2Q0RVK0dhaFpRSjloZjBlRVQrSHpHMlh4bEVGWE1SOVVt?=
 =?utf-8?B?TU5USWFjNWh1QnR4U3lDSjJpOGFHQTN5YjVaK3ExdE5jczJyVXcxRGphbEdk?=
 =?utf-8?B?QjhjL1gxTnlDYm9GQTBXY0hlTjJzcU1MVXpOYXV6WHZlRDl1LzgzY1p5eC9L?=
 =?utf-8?B?d0hzSTM3dTEzV3RQcHhzcnIybXB3Yk9OUEVtb216MTZscjNONXozRzZweVBu?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45276c76-57da-4b89-b726-08de20be85e1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:06:19.7782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvHgtj4HTZrBf6V8kVrbUH3XZPlOwHVrQXSk279trekBjak3rNuFsWEATBDlKhl4hkOm1T+S6GTiEJoFUjjMmIxG5738jhnhDkdVo5nt8fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
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

In an upcoming change, the VF GGTT migration data will be handled as
part of VF control state machine. Add the necessary helpers to allow the
migration data transfer to/from the HW GGTT resource.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 104 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |   3 +
 drivers/gpu/drm/xe/xe_ggtt_types.h         |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  57 +++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   5 +
 5 files changed, 171 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 20d226d90c50f..ef481b334af45 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -151,6 +151,14 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 	ggtt_update_access_counter(ggtt);
 }
 
+static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
+{
+	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
+	xe_tile_assert(ggtt->tile, addr < ggtt->size);
+
+	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
+}
+
 static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
@@ -233,16 +241,19 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
 static const struct xe_ggtt_pt_ops xelp_pt_ops = {
 	.pte_encode_flags = xelp_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte,
+	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
 static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
 	.pte_encode_flags = xelpg_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte,
+	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
 static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.pte_encode_flags = xelpg_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
+	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
 static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
@@ -697,6 +708,20 @@ bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
 	return drm_mm_node_allocated(&node->base);
 }
 
+/**
+ * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
+ * @node: the &xe_ggtt_node
+ *
+ * Return: GGTT node page table entries size in bytes.
+ */
+size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node)
+{
+	if (!node)
+		return 0;
+
+	return node->base.size / XE_PAGE_SIZE * sizeof(u64);
+}
+
 /**
  * xe_ggtt_map_bo - Map the BO into GGTT
  * @ggtt: the &xe_ggtt where node will be mapped
@@ -930,6 +955,85 @@ void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid)
 	xe_ggtt_assign_locked(node->ggtt, &node->base, vfid);
 	mutex_unlock(&node->ggtt->lock);
 }
+
+/**
+ * xe_ggtt_node_save() - Save a &xe_ggtt_node to a buffer.
+ * @node: the &xe_ggtt_node to be saved
+ * @dst: destination buffer
+ * @size: destination buffer size in bytes
+ * @vfid: VF identifier
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid)
+{
+	struct xe_ggtt *ggtt;
+	u64 start, end;
+	u64 *buf = dst;
+	u64 pte;
+
+	if (!node)
+		return -ENOENT;
+
+	guard(mutex)(&node->ggtt->lock);
+
+	if (xe_ggtt_node_pt_size(node) != size)
+		return -EINVAL;
+
+	ggtt = node->ggtt;
+	start = node->base.start;
+	end = start + node->base.size - 1;
+
+	while (start < end) {
+		pte = ggtt->pt_ops->ggtt_get_pte(ggtt, start);
+		if (vfid != u64_get_bits(pte, GGTT_PTE_VFID))
+			return -EPERM;
+
+		*buf++ = u64_replace_bits(pte, 0, GGTT_PTE_VFID);
+		start += XE_PAGE_SIZE;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_ggtt_node_load() - Load a &xe_ggtt_node from a buffer.
+ * @node: the &xe_ggtt_node to be loaded
+ * @src: source buffer
+ * @size: source buffer size in bytes
+ * @vfid: VF identifier
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid)
+{
+	u64 vfid_pte = xe_encode_vfid_pte(vfid);
+	const u64 *buf = src;
+	struct xe_ggtt *ggtt;
+	u64 start, end;
+
+	if (!node)
+		return -ENOENT;
+
+	guard(mutex)(&node->ggtt->lock);
+
+	if (xe_ggtt_node_pt_size(node) != size)
+		return -EINVAL;
+
+	ggtt = node->ggtt;
+	start = node->base.start;
+	end = start + node->base.size - 1;
+
+	while (start < end) {
+		vfid_pte = u64_replace_bits(*buf++, vfid, GGTT_PTE_VFID);
+		ggtt->pt_ops->ggtt_set_pte(ggtt, start, vfid_pte);
+		start += XE_PAGE_SIZE;
+	}
+	xe_ggtt_invalidate(ggtt);
+
+	return 0;
+}
+
 #endif
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 75fc7a1efea76..93fea4b6079ce 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -29,6 +29,7 @@ int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags);
 void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
 bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
+size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node);
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 		    struct xe_bo *bo, u16 pat_index);
 void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
@@ -43,6 +44,8 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
 
 #ifdef CONFIG_PCI_IOV
 void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
+int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid);
+int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid);
 #endif
 
 #ifndef CONFIG_LOCKDEP
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index c5e999d58ff2a..dacd796f81844 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -78,6 +78,8 @@ struct xe_ggtt_pt_ops {
 	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
 	/** @ggtt_set_pte: Directly write into GGTT's PTE */
 	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
+	/** @ggtt_get_pte: Directly read from GGTT's PTE */
+	u64 (*ggtt_get_pte)(struct xe_ggtt *ggtt, u64 addr);
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 80cc3f2cd047d..5b4e1d2da5adc 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -726,6 +726,63 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
 	return xe_gt_sriov_pf_config_bulk_set_ggtt(gt, vfid, num_vfs, fair);
 }
 
+/**
+ * xe_gt_sriov_pf_config_ggtt_save() - Save a VF provisioned GGTT data into a buffer.
+ * @gt: the &xe_gt
+ * @vfid: VF identifier (can't be 0)
+ * @buf: the GGTT data destination buffer (or NULL to query the buf size)
+ * @size: the size of the buffer (or 0 to query the buf size)
+ *
+ * This function can only be called on PF.
+ *
+ * Return: size of the buffer needed to save GGTT data if querying,
+ *         0 on successful save or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
+					void *buf, size_t size)
+{
+	struct xe_ggtt_node *node;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid);
+	xe_gt_assert(gt, !(!buf ^ !size));
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	node = pf_pick_vf_config(gt, vfid)->ggtt_region;
+
+	if (!buf)
+		return xe_ggtt_node_pt_size(node);
+
+	return xe_ggtt_node_save(node, buf, size, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_config_ggtt_restore() - Restore a VF provisioned GGTT data from a buffer.
+ * @gt: the &xe_gt
+ * @vfid: VF identifier (can't be 0)
+ * @buf: the GGTT data source buffer
+ * @size: the size of the buffer
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+				       const void *buf, size_t size)
+{
+	struct xe_ggtt_node *node;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid);
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	node = pf_pick_vf_config(gt, vfid)->ggtt_region;
+
+	return xe_ggtt_node_load(node, buf, size, vfid);
+}
+
 static u32 pf_get_min_spare_ctxs(struct xe_gt *gt)
 {
 	/* XXX: preliminary */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 14d036790695d..66223c0e948db 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -71,6 +71,11 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
 int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
 				  const void *buf, size_t size);
 
+ssize_t xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
+					void *buf, size_t size);
+int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+				       const void *buf, size_t size);
+
 bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
 
 int xe_gt_sriov_pf_config_init(struct xe_gt *gt);
-- 
2.51.2

