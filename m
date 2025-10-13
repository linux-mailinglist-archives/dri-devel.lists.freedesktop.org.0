Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49F5BD39CC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA3C10E489;
	Mon, 13 Oct 2025 14:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZCOgbIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B3C10E489
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760366399; x=1791902399;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KL1ikxoBMshQvOSpp4AvGOGEfdNVBvtG+8McHdS4JT8=;
 b=kZCOgbInmdmlD6m1x949CO+LSqFxQx/CGdNiWuU4dG+LGmzxVztPi2lT
 z7ohUJW3ON7q4zqUf4Q6BfZLcJs/MspRnj6v8jejH6ClTLHlrBdNjF4HF
 1E0viFdPwqLC83BSq/o4NOnPXphwCicBSLUGT48E1GsTQmpcUYRJkvxfm
 XN9bkPU/LrRe6YRh7D62Km0T5+HoP4BpD+MAT/WsuXUuluULAjUY2nUbS
 2ArN1n6Q26JxdaJoPllQj3oezjGdN1dSn3Aq0uu8VEOxJUHdDlsCMAn47
 2SI7427jHhXwjKh3M1N71wC17UMykw0MoqwZK+skhryTxCBoiVrqFpbLq A==;
X-CSE-ConnectionGUID: Dkn8B89uT2aaNAX64sUOYQ==
X-CSE-MsgGUID: gYZyqAG9Tvu5xCuzOyZFmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73188101"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73188101"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 07:39:59 -0700
X-CSE-ConnectionGUID: vTYb3ICqR0CTMCGbM4A89w==
X-CSE-MsgGUID: 9MMy/AAhQuSTbSH+57nrTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="186699699"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 07:39:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 07:39:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 07:39:57 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 07:39:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrRvoLErYy0CnwP6ij+stT8Dh89O3Xi3G4Yun23HJO6FYJx+NM+Z6UB6oj6AUnEUABqiTJM3H6KVTDahut73aQHacNtO+Q9kI0DA/v1RwAFwAsyOij3NjN1fIVP1441fi02cxiR8jCRqEbf9GeYCVTECKGemVa0AtiIyx13ZVxQ+UfBXpJhRNvdYPajgAb9haVS2EE7ikn0R78v7G3IZFY3/S308BBk7ZkkwHYQTaS5S+twdlhhs5vHoNOVQj9LQptOphatCrwAhpTWlXLDe+SBCkuQO604IL9fs9cYKrJQbZODCzm3a6QPX55ahG6kc5Wm9lngY2vpo1UXrEZdPeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KL1ikxoBMshQvOSpp4AvGOGEfdNVBvtG+8McHdS4JT8=;
 b=bBLMp4aglQoy5vX362DaI1J8Hpplgc7XP6E/s9j1/kzCxcx7EC6L//TM8MABc/uArT6q7YaJwfSZObs9/ZtrC3eVCxpgNZT2aMrUpc1VxveMd/IfdpE9B+fD3Z2xp6/KjY2FqD58YQ4E8cpV8JatqPynw+BYAuBuwyLytyXKpI5PMolyJvZPud7YYJu3SsCzUO1+1MI6jHWEThVVPOt6PFdyfn3CZ5GbLBrBhtexamS/f7IJJWTxTb6mr39C36cPYK7HIlt5msgx+iMhAyDAEN76fjY5KOVW9eEGmKg1fYzhNnXW3pNe4bRI5s7svL4OXvAmQvP1urzjkVu3iS+LQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by LV3PR11MB8765.namprd11.prod.outlook.com (2603:10b6:408:21d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 14:39:50 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 14:39:50 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>
Subject: RE: [PATCH 1/2] dma-buf: replace "#if" with just "if"
Thread-Topic: [PATCH 1/2] dma-buf: replace "#if" with just "if"
Thread-Index: AQHcNsfGQXY92IIBjEudozjkjKXfs7TALtEQ
Date: Mon, 13 Oct 2025 14:39:50 +0000
Message-ID: <IA1PR11MB6418179599E7B35F9040C7F2C1EAA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20251006134713.1846-1-christian.koenig@amd.com>
In-Reply-To: <20251006134713.1846-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|LV3PR11MB8765:EE_
x-ms-office365-filtering-correlation-id: 1d936349-add9-4ca3-4fdd-08de0a665d57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TWhYUFRUWktxRHhqempiN1B1d2UzWWFncU5IeEtXbVBEcEhLem9NSityL1E2?=
 =?utf-8?B?Y2FvNkx5RFMrQ2tYRmpWcjlwRmp2cW1rWnkrdS9BWUsyQ2tGWHlxU3VlWGJM?=
 =?utf-8?B?aWE0QTFzeVJuNGZ4WFVtdC9YN2k4RkJEeWhPYW40SzR6MGhnWTV0QklsQ1Y5?=
 =?utf-8?B?OFV6ZEhGeFoxMWNBQTkyK1IySGNOV09NS2x4RHJPS1J0dGltTTgxbFRvNW9s?=
 =?utf-8?B?S2ZSdFlIU0JOMDNxakFEdmxDRkI2cXBiVmxvS3BubzZTNmdUdWJ2NHlDRHJZ?=
 =?utf-8?B?REwrRXJmeXk1QzRCck9TNzBsbUdGR1BobmRZWlFZcXRRNCtMOEVHWi9ZdEN6?=
 =?utf-8?B?ZEVRa0U5SlBrdWtzeWRjQllWbS91Y295bFpXeWFyZ3VKdlUrM29CZE9wSnVP?=
 =?utf-8?B?QlZsNy8vV2p4b2EzQktSWmxoNVNnY1RPTVc3Y2lrZGhvb2lDNVJYZ0R4YXJp?=
 =?utf-8?B?MXFSMFdnemZqbWpkSmRmbElvdWFVdzBGZzNGRC8yYVpKMjNTZG1EN0dKd2M5?=
 =?utf-8?B?UVlKcXhlc0Rib01qUXNZcEZMSUpBbmtUdTZhM1BrREQrL2d2cnFNaTFLUmFx?=
 =?utf-8?B?MzltOXdGLytQZDZjc0R3Tk5raVovbXBadFdpdStBek94V1dwdTE5TTV2aGxt?=
 =?utf-8?B?bElHaXlBS3JueUxhYkFZdDlRS3dITVlnSTg5YzRMU3NWYVYrREtEQUowN0pH?=
 =?utf-8?B?N2JqVU9qeGtwQXB6RCtrU2IwMHB2UDVYVmhKT21IWEw1MUcrRDRaUWFmanY1?=
 =?utf-8?B?eEszRlpuTUhZckw3WWY3amV0Z3FGNDhnUHphcU9BUS9DVmpKUy9FODFBYXk0?=
 =?utf-8?B?Y0JUWTRoTEc5SXY5Z0xTSk9BcStPaGorMm1leWEzcEY2Y1RGOFRUaTI5NUxq?=
 =?utf-8?B?YmVGYUsxc09PSlJNTTA5cDJQMHBiTEFwcjVOc1ZTenc5TGJJNFlKS2VoU1JO?=
 =?utf-8?B?WGc2RW5rNkwrTHBVSWdHK2RtRHRzVitKbmZpaTNidEZLTFQ5V01raDd6QUtl?=
 =?utf-8?B?ZVlmTjYybHJnVWpuQXlDQlQ0anA0dWZDY1ljY25sbk9kZ0JRODV0V1R2OFRl?=
 =?utf-8?B?TWxwQjFJWDZ4TzA0UWRoanlhVDFZc29QNFZaTVpMd0F4UU9MUzZRaEUyMUJX?=
 =?utf-8?B?RlQybU96TmhaVnYyUFZnSURwdXdCZk9XZFJjNmI3NVlYWlVZZ3BOWjFBbk91?=
 =?utf-8?B?MzdWaldNRzRKNkpkMXovNHJmZndrTS9HTjNqK1NLeThWeUZWbkxrTU5GMXJT?=
 =?utf-8?B?eFZhbXVpOXlsOE43N2lHYk9PWE9ITHZsbllaZ05BNXFJbXVRL1JTMWJvTDE2?=
 =?utf-8?B?V0Zmb2g1bE9Ka24xTTRuUkpCVlpNTmtIU3JhYlBoRUZEbmJONHVTeERocFJx?=
 =?utf-8?B?YkdRN0t2OUpBY3c1S2sybHBqaWhjUVJKekNDdHVUcTRzMERWNXdqMVZ4UUxo?=
 =?utf-8?B?bjZibk10aXZUZHJFSmIxdmMvVUxGbFJZOTdKSmJxdTJBcHZNbyszZUFOSE9D?=
 =?utf-8?B?RWVJSDhMOGxjOVcrR3gzZ2dQbTFHckFldlhRb0Nib2tieWZzOWhCMnh1cHNE?=
 =?utf-8?B?UU1EOVpHYWxjb080U3huK2czM0pkZ1N1aVZ4a3ByRkJlNTJYdkN4L0tNUWts?=
 =?utf-8?B?WnplZ3JNQ1hrUkI0UEhZeUo0YWNDaWtrQ0M1TDl1OTZSLzh4aW4zWk9taHFN?=
 =?utf-8?B?bzlDcnplVGF5c01UMGRzRi9waUtMZjdUZWRZTE5ObjA3SEVMTHo4Z1BWVmUx?=
 =?utf-8?B?OVo5OXA1UzcyYWFGaWFuNU1OeFl5clZwUVkzeFlkdk03ODFPZzkzN1daNGg2?=
 =?utf-8?B?dUF0S2NHQW9yTFJqYlNZd2dSQUxiSWpZTGhpZkloQ2hUL2VCVlNUVFpXTlI3?=
 =?utf-8?B?Q2RsM3VnQTdmZWk2di9KQ3BMbzc4Wk5sM0xLTXlKMGVjOEJYZzFKamxEeUpi?=
 =?utf-8?B?eVU2cTB4U0loMmxuQVRvWHJYU3poSVFySHZsWE5ZOG41Z0FYaCtzcEo4Vmlw?=
 =?utf-8?B?b1psb1V3aThtSzZPZWdrTG43UUJVbnY0ZXZON01WZW44cG5ZYzZpalBXOEhk?=
 =?utf-8?Q?gd4WuV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vk9tK01LSXc5ZlpHcVNJczlwRlQ3TGtmTkFJZThhdnAvVjBHL1Zra0JFSy9i?=
 =?utf-8?B?Y1JlVmZ2aVVLVDduak1vUnBVTFVyd2tEZVFvcEgrNmIwYW40ZXFRWkJ0VTN4?=
 =?utf-8?B?MUY1bnI0YWRTeWxGcVg3Zi9zYVRsVnVVZUQwMmZIYkFGaFpKbUpyc1lBODJo?=
 =?utf-8?B?a0JLTFpvejc5ckxjUDZGY2hXZVAwUU5GNEQ5ak9lRXI3NHkwaEVMZ3BtU09Y?=
 =?utf-8?B?WWsvTmZpZW1EOXlINkZMcEpuWnBsdnFUWUdmckF2aTZnNXRIK012K01JOFFX?=
 =?utf-8?B?a25YaHREUGRmR0U5R3FkTld6SEpmWFRINjVRWFdPNDRFUWxBMEYvMDRlWW1C?=
 =?utf-8?B?elp5ODFVWER2Y2lWbGRNVU92T2FKc1lXdFZGRDNZZTFpdWpNZ1lqZExQSGxs?=
 =?utf-8?B?SU5JWUdhRTdxdkZXc1dRQlZaWFF5UWpOY3FUdUVvZFh3c1BkYXArd3JDVk9R?=
 =?utf-8?B?TjVZc1UrNGcrSllBdG5neklmMUJQejNDMGxwOHZMdEhpUlpWb2c0ampqQWFD?=
 =?utf-8?B?clQvME16T0IvNmRRZmI1MnVhdklmdG9ES2h0VmRUdDFXL1hkWmRCd2FkUXpt?=
 =?utf-8?B?aGVmVFY1dDJRS1FFNk9NWGZlQnVpTjVkZUhNRGhRTStDYVJvVWR1YmNUdHRu?=
 =?utf-8?B?MXFBVG5COUEvN3BJMFZMdlNnNlNpaFhKV2dwdU14bndETWg4SUJRWGdoblgw?=
 =?utf-8?B?ZStWMzFEZmNoSjBybHVhSTNaNDJSTHByanRScVR0MTRMeW5ILzczNTlnS1BV?=
 =?utf-8?B?N3VUV0l4V052R2o1clQrcjY3Z3JVNGhORXZCbDdUcFZxM0gvVVJQb24zbzZ5?=
 =?utf-8?B?YWFVZ0RUU3llVTM1a0xsNGwrTll2d3ZHdDdxaW52SmJZbld4bTgxU2ZHSndG?=
 =?utf-8?B?b1ZwREhaRjI0WUFva1ZZL29mREUwZDQ2cTJVZ2lMODZuTEJTYkNhV1pRa0tI?=
 =?utf-8?B?ZGY0MEJoRE9XV0pGOW0wT0FGelVaSmVkRWEzRnEzdmUyTGg4TXpMbDlKZXRU?=
 =?utf-8?B?dXlVQjlIV3ZGdEwwd0JZUDJkRHZreHBaVmhxcEs4SzRMRHQ5NnlNVitKOUhj?=
 =?utf-8?B?YXZ3MXVVVXgrOWR4cjV2SUhHaFZZVE5ZTlFFL0ZXaEovRXJ4d09ZMi9HaGFZ?=
 =?utf-8?B?dXQ4cCt1dlNxVFhOYVRKbW05Vy9IRnRYbW53QUV3SnhWVTdjaEgwbWdERU4r?=
 =?utf-8?B?RE5HSHZHRjVsTFpibGZNUS9VK2VNTlQrTy9LT3ZjcTJQK3VEUlk0WGNlZFkw?=
 =?utf-8?B?dGVsWGpQemxIcy9Db0pmUDlWVittd2kxQ2g5YjJ1NFBjc2pJdE1ja2d1cGYv?=
 =?utf-8?B?VlpCYkE2Q3Q1VXErM0p3azNpaVo5K3U5cmRSMDhSRTRuMTJ5TmszUXh6R1dG?=
 =?utf-8?B?dHlvUVNPcVZrSHNJSXFlMGZSbm1TMldtTTRYYU42WWprV1NUYUMrOWFiZWRV?=
 =?utf-8?B?VDFLalAwNzRHVVdPUTZ6ZXkvS3Fpd0NtbVRlV2ovNmRtRHZwSzdUcVM1azBs?=
 =?utf-8?B?Sjc4N2M5MnFiblFpSTEyazRUTzBiTzVyK2hNS09OTXRlMm9wdEhWVHBpbm5x?=
 =?utf-8?B?UGVNV3A5TnhLWWlKZEFsaXFNSm9XeWY5dWttZmYraWVib2pGbE5jVWl3OG1Y?=
 =?utf-8?B?VVlYc0FSK0Q3Yk50bTl2K0t4N3ZTV1IzazdPbXkwVUUvOUZIaGVrdmRtZklm?=
 =?utf-8?B?QUdFbmFIdFczNTFLTWdZWk12WFpCNytsc3BRMUpXMjBsNkExNm1ubTdGY2lO?=
 =?utf-8?B?c0huOFRMQVpvRHNHRi8xNWhaeEROZFFza2NERS93cEJDQ2FHOVpuaFF3NzBu?=
 =?utf-8?B?RGoyS3IyYUh4SkJONEtuMm55d3d1dDZyUmt4emg3YjJKNWxLendWMGtSOC9V?=
 =?utf-8?B?S2E2WUc5TlJZSkVROWlRam94UGpxNDh0Qk5jVjBQU2QvQWJ4N0g2YStMNU5h?=
 =?utf-8?B?UlY5ZUJWL3VDM2J6RUQ0RU5Yc1J0NkZ2M3k2WmhKNWV4SlIxNDN1NGJZNlZr?=
 =?utf-8?B?VVdMOGphbllBT1dQcVVFaEhYMEdHZWZVY1Y1OHBHSUJNT3JsMndBUlErSmJk?=
 =?utf-8?B?RFF3SWdBa29CSlFFVGxFSCtiUE5BZU5vNjZjWWxUK1E4ZlN2MzZERkI5dzl5?=
 =?utf-8?Q?vHUSV8HrOEF2p5WcVR0TvV142?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d936349-add9-4ca3-4fdd-08de0a665d57
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 14:39:50.1687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sqQymonkz87YZZh3P28bvDggt7v3P4dQQwhAu1gWUPwJ/3ADsgDFSvNFEb3mH6UDsiqLjb6m1thE7tMm6Zz3P2ECvQc6hJKRxUJkqjiXHN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8765
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPkNocmlzdGlhbiBL
w7ZuaWcNCj5TZW50OiBNb25kYXksIE9jdG9iZXIgNiwgMjAyNSA5OjQ3IEFNDQo+VG86IHN1bWl0
LnNlbXdhbEBsaW5hcm8ub3JnOyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGRyaS0NCj5k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9y
ZzsNCj5zaW1vbmEudmV0dGVyQGZmd2xsLmNoDQo+U3ViamVjdDogW1BBVENIIDEvMl0gZG1hLWJ1
ZjogcmVwbGFjZSAiI2lmIiB3aXRoIGp1c3QgImlmIg0KPg0KPk5vIG5lZWQgdG8gY29uZGl0aW9u
YWwgY29tcGlsZSB0aGF0IGNvZGUsIGxldCB0aGUgY29tcGlsZXJzIGRlYWQgY29kZQ0KPmVsaW1p
bmF0aW9uIGhhbmRsZSBpdCBpbnN0ZWFkLg0KDQpNYWtlcyBzZW5zZSB0byBtZS4NCg0KUmV2aWV3
ZWQtYnk6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPg0KDQo+U2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0K
Pi0tLQ0KPiBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwgNSArKy0tLQ0KPiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPg0KPmRpZmYgLS1naXQgYS9k
cml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYw0KPmlu
ZGV4IDJiY2Y5Y2VjYTk5Ny4uMjMwNWJiMmNjMWYxIDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvZG1h
LWJ1Zi9kbWEtYnVmLmMNCj4rKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jDQo+QEAgLTEx
NDEsOCArMTE0MSw3IEBAIHN0cnVjdCBzZ190YWJsZSAqZG1hX2J1Zl9tYXBfYXR0YWNobWVudChz
dHJ1Y3QNCj5kbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwNCj4gCX0NCj4gCW1hbmdsZV9zZ190
YWJsZShzZ190YWJsZSk7DQo+DQo+LSNpZmRlZiBDT05GSUdfRE1BX0FQSV9ERUJVRw0KPi0Jew0K
PisJaWYgKElTX0VOQUJMRUQoQ09ORklHX0RNQV9BUElfREVCVUcpKSB7DQo+IAkJc3RydWN0IHNj
YXR0ZXJsaXN0ICpzZzsNCj4gCQl1NjQgYWRkcjsNCj4gCQlpbnQgbGVuOw0KPkBAIC0xMTU0LDEw
ICsxMTUzLDEwIEBAIHN0cnVjdCBzZ190YWJsZQ0KPipkbWFfYnVmX21hcF9hdHRhY2htZW50KHN0
cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwNCj4gCQkJaWYgKCFQQUdFX0FMSUdORUQo
YWRkcikgfHwgIVBBR0VfQUxJR05FRChsZW4pKSB7DQo+IAkJCQlwcl9kZWJ1ZygiJXM6IGFkZHIg
JWxseCBvciBsZW4gJXggaXMgbm90IHBhZ2UNCj5hbGlnbmVkIVxuIiwNCj4gCQkJCQkgX19mdW5j
X18sIGFkZHIsIGxlbik7DQo+KwkJCQlicmVhazsNCj4gCQkJfQ0KPiAJCX0NCj4gCX0NCj4tI2Vu
ZGlmIC8qIENPTkZJR19ETUFfQVBJX0RFQlVHICovDQo+IAlyZXR1cm4gc2dfdGFibGU7DQo+DQo+
IGVycm9yX3VubWFwOg0KPi0tDQo+Mi40My4wDQoNCg==
