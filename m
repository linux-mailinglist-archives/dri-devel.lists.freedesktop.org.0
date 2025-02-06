Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDFDA2AD6E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 17:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EB910E8BC;
	Thu,  6 Feb 2025 16:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X7tSaVmz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA9010E38D;
 Thu,  6 Feb 2025 16:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738858503; x=1770394503;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VTJhxR/x7VdWYd2gfAqyusoJoBMzTgAcfDCfJOGNsY4=;
 b=X7tSaVmzmyw3mXpjWzmk0CZhz1KIBcZ6FbCAOHjBv+0N3gg3vJa6seKH
 A6/3Q2HbeFbKr7/R8vcOof1P/IiuUOSq7yl5o2w42F0KcMQFOxkXot2SR
 dphapKquJp/pzvnZy64Ck7+1o6EazU9UnWg8QAipgmzwO7ghnKiNR5Y8v
 8l43ZPWT/9oyW2sQFe1nHMbREE2SvYN+BUQwF23OVt1k/H/bkSet4PudJ
 +Nl/juJNIIQO1+stzfyycypDpgIO3JjKHB0iM78nUtqsXRUT2Y+btJ1zO
 gU2X4h3dA/jzMT683Q7rzYGll/salZ7wLPDuos+HMQEbrPm21yrXLwYPT A==;
X-CSE-ConnectionGUID: Rfd6jvTQQHG9p9A1SkqYiQ==
X-CSE-MsgGUID: PtOvw59bTSuLF8tXTRK25w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39361776"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="39361776"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 08:14:10 -0800
X-CSE-ConnectionGUID: +d6kMgxxQqeIVF7TR/WkaQ==
X-CSE-MsgGUID: FA4oJrNzRumSjnb1c5ne+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112142684"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 08:14:08 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 08:14:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 08:14:06 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 08:14:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ez3jhyn4pbLN3Uhh8MDZzJDTlE5P+BnFRA+JEn8yOsdlipnhQKGeIs5iP/AcLUl7UmillKRExOHa62vqjG3bSIt6+ojfa8Rz9O8AdMLDWxuvUK8L/444PrU9lfwAJU+dge9pjFic0S5FhY+GF1iE7hOvZAhGUBG/dhY7zwpPmPT1BVGoaxFoDO8LbwvR8IdD48ilm9T9sF6M9sNQ+9lytD5yMQBKJA+gHpcoEg5B60Iw5LViuHdPtMjikwewf1EIAopBIhrSMIBf19uCfKiYYlIHsuKR8Wgj3yWXqwpIdfkJgSniQBgCyX+Vpiglo/9Gx9ETNNXrZbPyLwcR44ov2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHYF6+afrI/VgibuofeGJB3r1NBTO7cSizozLQMhaQo=;
 b=yfgmlRZG6SbLDqwNRzYFsG4OowChTcWQVKfu81TAJ/iObKPPewboQ8mdrXAVrG1OFFpuHnkAln+sMoyBoyrERijOKmhZPcEBEZWOjX9lfnk4cW7kLhruAbobQQOIoQpTPZwIfCFSIJlQNiF/VWz9gzg8ZuKKoe6rhBQXqzzgUPD6uVRefVAnh2IW6flyjWawaikIUMTUmTQeZoSGin/YvzX4H3SSevGJhIHMlfQ92GwHO50BkXGW29QuFwwS4y8q8G1MasI4SeLf+qQEK9C+2mkhg3szJ2CZVf4EYxnkzdvYFis2pktkuwjtcmUpPxO6HoaQWNsGrZLAjJEGDOi9QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SN7PR11MB8068.namprd11.prod.outlook.com (2603:10b6:806:2e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 16:14:02 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 16:14:02 +0000
Message-ID: <01316a42-bcc0-4255-8750-3c5e8329161f@intel.com>
Date: Thu, 6 Feb 2025 21:43:54 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IENvbXBpbGUgZXJyb3Igb24gImVycm9yOiBjYWxsIHRvIOKAmF9f?=
 =?UTF-8?Q?compiletime=5Fassert=5F581=E2=80=99_declared_with_attribute_error?=
 =?UTF-8?Q?=3A_clamp=28=29_low_limit_dsc=5Fmin=5Fbpc_*_3_greater_than_high_l?=
 =?UTF-8?Q?imit_dsc=5Fmax=5Fbpc_*_3=22?=
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CY8PR11MB7134D2D3BD641BE58310EF0189F62@CY8PR11MB7134.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <CY8PR11MB7134D2D3BD641BE58310EF0189F62@CY8PR11MB7134.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::20) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SN7PR11MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: fc9dd3c4-b4e7-4dfc-dbc1-08dd46c9455e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmhOWE5aTDRNRVF2d1Z0cVFIZVRCWGRtTUNoVFprbGZaT1UzZGdaV1ZjNUpT?=
 =?utf-8?B?RmFPd2Y1NFZBcTRRRjBrdzE3djlVSzMwQWRDdG5IblNOaEc5b3ZPWTRvc1VV?=
 =?utf-8?B?NmNObGdNblFMQ0RhNE1xb3VvNTBjOUh5NjBNbzlJRzdqZGQ5NVpYUnV2ODdz?=
 =?utf-8?B?UjAzc1JGTTh3dlY3bElxa09LdFJ2eHZGR0dKUzZRWGxKSDhwaGZwVXd0Q0dh?=
 =?utf-8?B?ajgyVUMvbTRDeFdxdmxrZzJmVndQMG5Ec1k2WkxYZFpPYTd0VlI1ZGhPQkdM?=
 =?utf-8?B?UjRKenJObjBTUm11dHFVT2VGRE1hN09Ga2tWTllFY1JITlpDWVhNR2hhaTM1?=
 =?utf-8?B?NUZuSGlhbk5ZSW9wN3NkL25VbS8rYkRoUDNQRmhqTmN2NTR1NjNEcm1ENlFW?=
 =?utf-8?B?VEN5SXpQRlNFZ0lycVVEVHJhQ2VQdEw2bXZhSmU2NkdlSEJ0VE1JeGpjK3o4?=
 =?utf-8?B?UDl3MjBWNUVPSjhtMlNaNGVBdFAwWlh5Y0pEZnczK0JtR0ZTbHJEMmtrWnho?=
 =?utf-8?B?NWFQc3RZMFZqSVVqT1BiT1RlTE9rMXpsN2ZUZWNyS29pYklRSWdOVlBmRVNx?=
 =?utf-8?B?VmZ4YmdRbnZHMWVQL1FMYkdzMVllRWM1U3huS09FVldZYUxNMW1pT016NFpj?=
 =?utf-8?B?a0hYUTBvYkRVd2J0aW1OTURWaGNsNHpPYUNrZnlydDhQRXZjQ1l1Mm03QnFu?=
 =?utf-8?B?WmNtVmZlazJVR05ucERZY2VHUitZdDViMHhvbWtDdTh0QlFHdDAvUHk3RXQ1?=
 =?utf-8?B?WU1xaHVDWFJISlNHcXRLRlpNeUIvb3BxSHZjN29CUFZuNUhpeWhJTVNkd0Zj?=
 =?utf-8?B?OVJoQUN0cHRidEJtZFBsNFM0OXhNaEtZUEZJUGJtaUdYRzZFMFFEbWhUYTJm?=
 =?utf-8?B?Q1lIYjM4T3dYb2hERDY0MHZycFVBZ09Lb2dnbW16ejBKRHRrZmczbW9jTTJt?=
 =?utf-8?B?N2tINjR5V0pLMWxFeDR0ZTZiSk1CYmluZEt5MittYmdKSXJSNllnZDZMTzRR?=
 =?utf-8?B?VnBnN3lGTWI4SGNEeDNQUnNWVUJpenlnd1BhekFTbjA1MkdBNFVMWnQ5LzJq?=
 =?utf-8?B?NjdTNGdTMWtmcDFTenBwRFdtYjg4YzV2VUwxS1JtemVQSktPcHJrTFlQNHhL?=
 =?utf-8?B?QWx2UnRucWZJZnNpTnI2UE9BNHlTc0FSZExHQldHU3RPaW0wYWhQcUl5VUZK?=
 =?utf-8?B?aCtsRHBlZkZFTXVSSlA1WEE5WkhyMG1JL3lneXY2alBabVVJdHp0TUc2RW53?=
 =?utf-8?B?K2Q4RmJHRFZIZS9uZmpoN3pYUVhhZmgzWFdEekRJa3ZsMGF4R3ZkSElXNmEz?=
 =?utf-8?B?TXhpUXdjNGptUDZVa2pURjloSG8ranpXOElCRGNwbDNCcDVFc1hZU25uWHpU?=
 =?utf-8?B?NVR2WDA2elRlTjlHQytMNmtZM3VGeTBNb05TQWxieklQVkZiWFBKVkRKSjdC?=
 =?utf-8?B?LzMvc2JlVVhMTmdjV2pnaEN1RUVtaUFDK2VPUFJCQnBqLzJYVGNVdzdxK09p?=
 =?utf-8?B?b0JsUmxlT1E0S0VtbE9Nbkw5L3VYaEJtY24xdTJzbGpMMG9uNUw1Q2pCeGNx?=
 =?utf-8?B?NFlkREZoYmhvY1hWRVFwWWxzb0xCZ0ZWaWcvalZsL3hVTWFERzZwS1pwVE5L?=
 =?utf-8?B?VEc5ZnNmM2hXVXRMbVdvUk81REREalhnMkVhZ050ejZ5LzRTYnRtZG1JbmJ2?=
 =?utf-8?B?Sjd3V2grZit1NlRtVlVXcUVtN1crYkNhaVdUa2xvNlc1LzVKRU5sY0RweFN5?=
 =?utf-8?B?Znk1akkyUWhGSmJIdlE0cmRHdytLY3A5OXpJVGV3ZStobExTSjR0QUNIV3Fa?=
 =?utf-8?B?Y21lMnBWTHB0YkFMYVJZZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2VXT2h5dkJkMWUrZERHQ3N4ekZxVlhKRHNCMWtPMjVNeFJCNHYrSzlaM1NY?=
 =?utf-8?B?aEg2NjZac2g5ZUFzSVBqS1lldmZnRkRxcDFRbzYvWkR5TEJlTFY2U0FzRVRo?=
 =?utf-8?B?WDU4bklJR3dSek96Um9OZ25RcVlsVytMYTRQNzF5dVFwQjQvc1ROd0JINXlh?=
 =?utf-8?B?YW8wRXQzU29iTWRKZUpNT2haUGhkWmR1eDJ1aEl5dGI3RkZMbVVXdFlHQXp3?=
 =?utf-8?B?TDZCQVE0bXd1VUkwdkJEVks5N0gxRnRTUk1vd3Q5RjVLVzdHSm5KbzRjNDd1?=
 =?utf-8?B?YVI2aWw3NTRjYzkwUGVncjg4dkZkS054TStBcVBPbzdqa0RnRlA1cmw2L2JP?=
 =?utf-8?B?OHVWamt2NTkybUtlUjYxTzQ2UnZOM3p2NHE4SytHNHJkdTNaZnhDL0g4Znpu?=
 =?utf-8?B?aDFLMUVGY2plYXQ0WVlabGR6djdMYXJDOHRhSDhrWXBoNnVDZzFKSGp0QkxF?=
 =?utf-8?B?WWNFbTM5QWlxWUIrWHMyZTdDYzkvS3MwWkFCWDQ1V1VMY092UmhNMVM3ajFq?=
 =?utf-8?B?bzBlbzF2S3dYV2tWVWZDUkZiejlVcjQwenVXTHBKSkZBUkIzY2VvL2tQQVdu?=
 =?utf-8?B?TjR5N1VJYVkyU1VXaVZwcWdWT1JhdzNYYWFWL1RnQURUeHVldmFxeHJuNXkx?=
 =?utf-8?B?ZERuS0Jub25ndzQ0Vmh5Ync5TGlSUmFJUFJtSUUraWRTWTltelV1UnljM1Fj?=
 =?utf-8?B?NlVObmNXM2lKMVpmZ01pSkVtdStJZW51QVZ0ZTA3Um54YmN4ZUlCVUpvODFz?=
 =?utf-8?B?Qk9xekZqenpiai9zUWpxbGc4dUR3dFA1RUVYZ3VyNXl4NnQ0ZStiVHdyaEF2?=
 =?utf-8?B?eWkzc3hUc3FZcUxKSnNMeVMrQnUzVEMyNHBZS1pRbnZ6bGFEMm1nTXlENzg0?=
 =?utf-8?B?V1ZzQ0VIVm96OFRma0JhR01kbEl2UmhPcit5anJVMTZTQ3FweFNMT0NUOVVH?=
 =?utf-8?B?NlMxK3pJWEpFQ3Q0V241M0g1U2poWEcxOVZGcGIvM1Q3L1QyZHFuc2hzQ3Z6?=
 =?utf-8?B?K1J5Z3g4eWczWm1Gd0FVc1ZxcFpJakhKS0xCTy9obnprN1FXNGMzRUlodjBt?=
 =?utf-8?B?dTdIbU96SWJYRkwrdi9YR1dIMGxUVitnaWdxbXNRWVEzeU9ybnQzZXNJQXNX?=
 =?utf-8?B?eDQ0VUtwSGJwYldPcTdPbEs0ZjRjZ2JzRVJkS1A3dWNBcUhSSmlSaWtXWUJL?=
 =?utf-8?B?M0ZsTnNpUFF4dGYxTnJKTHVIRFl4Z3IyWDhqeUxkNjd1V1FCSlZMUnUwenc2?=
 =?utf-8?B?cHdicFpMcit6bWVJR2JxUytQaVpvbCtTOXVZQVhqcFdzRVRxdFJWRW16VFBV?=
 =?utf-8?B?a2k3Nkh1dmNCQitHT2dLUHRTMUhPNnl0KzJDWjFuaWlBWTFTbFVLT2FJeHI0?=
 =?utf-8?B?UEpVREdHRkVvaWVuQUV2TmY3YVFQZkhRZWl1Um1kVytIVlZ2dWFxTGFNRStQ?=
 =?utf-8?B?UUllS3lQbURYd3NWbTVkV1lTckdsbkpkVkc5bW1xYUVFbVRLN29hR2tLbC9h?=
 =?utf-8?B?WTIwZHZwTTE1VUZQYm9UZGJUeUdYaEtDdDFpZXpEZ05TQTBnU3BVK3lqZEF1?=
 =?utf-8?B?K2hxcWRmMHJnaUlmNXIzYjR1a2ZrK1JwQlN4dTN5NC8xZUpPWEpzblVSb3JK?=
 =?utf-8?B?NWhsQTI4ZDZDdWpRTmlid1hMQTRuOHVDMjJuRUFCODNUV1UxekVyRGZzMmtm?=
 =?utf-8?B?aTZzSk80cnNxdUVTY2YvbGcrY1o5aExkVFZZMWRwVFYvUmx2OXV2K0FrWHpz?=
 =?utf-8?B?M2FWcEdFOXRYWWp3UEdERnJKME5xY1JtZDFxTVVVR1EwTEVGR3g5b0NXVm8x?=
 =?utf-8?B?MzNnQ1JzY2Y0TFNWLzVvZTZFVTdzVHJDY0MwU25GdmE5dUZEcG0veHFiMUU4?=
 =?utf-8?B?eU9hWlB4M01WcUV4QjBnRnZsaVlwenVwaXBiR1B5TUtYYUlMM0dVb3RvQ092?=
 =?utf-8?B?TzE5V01VZEozanNZeFdzclFlZTB5dHlxdUFQbU1QYXJtckxaS1F4RURzWVhU?=
 =?utf-8?B?VzZKcWcva2MzNjlqdHBQaE9Sb1d0clgvanQ2MDNKVWxIKzQ0ZE1oOXBqekls?=
 =?utf-8?B?SCtoMVNTdVVjdDA3YThHSitLbThpZlZTT3B0aThkdDZxYzVoK1Z6TjNaNTZi?=
 =?utf-8?B?VXZicHJwWlI5eGtIRVZCZ01zRFlFUjhUNjZhdTJRUHZZNjdvZnQxbHFuWnpw?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9dd3c4-b4e7-4dfc-dbc1-08dd46c9455e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:14:02.7168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RgoUICoUTcTUmz7CMYvkjbtAs70bTP84HI4g0rLHDycOOet379Dj9uDtSrk6COgySjQsHLZ4WSNRnal65ZKl3wsN4LMGS5tJ9gx5YKgt3g8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8068
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


On 2/6/2025 1:34 PM, Zhuo, Qiuxu wrote:
> Hi,
>
> I got the compile error as below.
> My GCC is: gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
> kernel: v6.14-rc1

Hi Qiuxu,

Thanks for the mail.

Fix was sent and merged in drm-intel-next : 
https://cgit.freedesktop.org/drm/drm-intel/commit/?h=drm-intel-next&id=a67221b5eb8d59fb7e1f0df3ef9945b6a0f32cca

Regards,

Ankit


>
> --- compile error log ---
>
>    CC      drivers/gpu/drm/i915/display/intel_dp.o
> In file included from <command-line>:0:0:
> In function ‘intel_dp_dsc_compute_pipe_bpp_limits.isra.77’,
>      inlined from ‘intel_dp_compute_config_limits’ at drivers/gpu/drm/i915/display/intel_dp.c:2547:3:
> ././include/linux/compiler_types.h:542:38: error: call to ‘__compiletime_assert_581’ declared with attribute error: clamp() low limit dsc_min_bpc * 3 greater than high limit dsc_max_bpc * 3
>    _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                        ^
> ././include/linux/compiler_types.h:523:4: note: in definition of macro ‘__compiletime_assert’
>      prefix ## suffix();    \
>      ^~~~~~
> ././include/linux/compiler_types.h:542:2: note: in expansion of macro ‘_compiletime_assert’
>    _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>    ^~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:39:37: note: in expansion of macro ‘compiletime_assert’
>   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                       ^~~~~~~~~~~~~~~~~~
> ./include/linux/minmax.h:188:2: note: in expansion of macro ‘BUILD_BUG_ON_MSG’
>    BUILD_BUG_ON_MSG(statically_true(ulo > uhi),    \
>    ^~~~~~~~~~~~~~~~
> ./include/linux/minmax.h:195:2: note: in expansion of macro ‘__clamp_once’
>    __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
>    ^~~~~~~~~~~~
> ./include/linux/minmax.h:206:28: note: in expansion of macro ‘__careful_clamp’
>   #define clamp(val, lo, hi) __careful_clamp(__auto_type, val, lo, hi)
>                              ^~~~~~~~~~~~~~~
> drivers/gpu/drm/i915/display/intel_dp.c:2506:25: note: in expansion of macro ‘clamp’
>    limits->pipe.max_bpp = clamp(limits->pipe.max_bpp, dsc_min_bpc * 3, dsc_max_bpc * 3);
>                           ^~~~~
> drivers/gpu/drm/xe/Makefile:165: recipe for target 'drivers/gpu/drm/xe/i915-display/intel_dp.o' failed
>
