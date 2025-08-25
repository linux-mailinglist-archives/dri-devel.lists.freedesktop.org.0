Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ECEB34E19
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 23:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5774310E364;
	Mon, 25 Aug 2025 21:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eFAnyPAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B287610E364;
 Mon, 25 Aug 2025 21:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756157644; x=1787693644;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aNHIRIGXvYWD02mtz7Y1DwE0exU7d6pmUeu52XrD2jY=;
 b=eFAnyPAOD8o4mU38/R5akAJ4dDWjRhVhrXGJnT7dBxl+3rkPlbN3u9yV
 EFWQLA0s3u/kMs+vZ9xLQsoWBOxQuDJ32ZYXqkqxmcuon1RbuNQG1sEvW
 iP5Wv+0aQmNhfssLkbV5WnvczJwA6MVx01Y5abRwOLN1nTpEM7yVeTnv2
 MB6UO0Bsf0jkL3qRBljrGPaQPXk2ExpqqXQNl8RM1MxZ23Swd2lY4R9Yf
 H/S/Dwkw+p9nCGbDjR+J+yUz6xP9chk/PMDAEG4zY9DvW/yz4p99yQyuR
 HszzSSW1M8n7uVA6A8STptNZ/sYJesxP3s3OMJfaM9eWSRbmvKi/M2q59 Q==;
X-CSE-ConnectionGUID: u/r1/1taR9KOayBsHTXuSw==
X-CSE-MsgGUID: SSCYRFOHR+q5Ab1zflP1mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="61016496"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="61016496"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 14:34:04 -0700
X-CSE-ConnectionGUID: oFcNW4/4TGClg0VIfatIXw==
X-CSE-MsgGUID: wTA6qzDyTiKLlvswXqPRZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="170228020"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 14:34:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 14:34:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 14:34:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.80) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 14:34:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pk3W6xK2AQIlzZHC2ZwixsCxLx6K8bdJnsyN7oHLzrpQ9ZKQtV8hECJdp44Qn4jNkP937FFWxWLetb2gZxrv8F+ol2qwQHxHa1CEIAnirwYG56HKoSYOtYB98K5c7sfspttLlEUrZeJfdOoBuzyl44uQlVuIVYXiCc79nDY5NxeM0inBVV4UDi1qPJzgSVSOOjJTJfBgmlK8wuj4NGlRjGh3pJLi+7gILwHmig/UPxNbKo29vkjyQglbNivWO7IDpNbxOhfZoLMnya3AE/DUMuWK9CvG3PnJbwPnVNwras/mgvgI5cpe+1rILmmseN+nhisbx/OYy/g3vXcHkGHqxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNP/kL5BW4Gl2DSY+YGlbWE+l5RUXjzaeyKE74NeazI=;
 b=Tc6ugscSNjTRCwMmOoy71odfeQUj0ehdD6KUxoYyL+sL4F0QahfmejmBk1XvOR+jhxFe70SJqdWRiQetczNEHSBtB4udiNZ1pU1HDCPde2Ayo0YJSU9sMeIOnbkh/dvjcJFyiMPeMj7IV+uLKbFhoVjojW7RNSY16IcchdEzpCa8kfRozOAo/xeZeaiRJyQ9TzUQyVzMql4KoXiMjmLOnluOMiWVrqXUwkHzXsDcz139RFRbSXVvoziQvyMaB6MrtBsk+qCxDWAe5tmHtKIfqaVWsYL4S7OMubfGgy7m4keycgm3qklhyiXK9cymIh+tBeFLPArNmmkN9X5LLCMQ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW4PR11MB6788.namprd11.prod.outlook.com (2603:10b6:303:208::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 21:34:01 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 21:34:00 +0000
Message-ID: <0309a6e9-e664-4130-bfc9-4e28e68cc74a@intel.com>
Date: Mon, 25 Aug 2025 17:33:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/i915/guc: Add synchronization on interrupt enable
 flag
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Andi Shyti <andi.shyti@kernel.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
References: <20250825211924.300253-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250825211924.300253-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:303:16d::24) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW4PR11MB6788:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0ec7dc-b291-4f89-fa0d-08dde41f1b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjB0QThCOFUzalZaV240TFBFRGlORE9iNlVKR0grYXBaWkN3VzZ0bzRoRUxK?=
 =?utf-8?B?MnBka3pLckhrbmZqNnl4VEs0bmM0dUVBQWo0bHNwQk9wTEhqaXJuemZoUmJS?=
 =?utf-8?B?UDhkTHVza05Lb2IzL29Dd3BTSE83dVpKNDFYdytGeEVwR080RTFNdlJjTmhL?=
 =?utf-8?B?OTV3dFBrSDR0dHlMUmJZNVpyT1p4NXE3SDdSNldEdXhzY3Jya0JUY24vVEty?=
 =?utf-8?B?bDlrbkdVZWxoV0RZa2lxTkxFNHZFNmhuNVBpczkzN1JaZ2JodGliTDlxamJZ?=
 =?utf-8?B?bjEzTzA4YVNFaTNCYnJVRmtaT05yb0pZcHJNNS8rSVV3aU5aYUNOTjF3UFVN?=
 =?utf-8?B?NmxURVprM1QxbXNjcWNiM3BvdDVmY2crbXNWOHhkRUZwUTVUU0tYaUZNb2Fn?=
 =?utf-8?B?L3NWRGM2UURpV2ZhU294UlpnUktLQmp3U0dQY0FxUVBwbjZFempERk5sTE1x?=
 =?utf-8?B?NmFLVVNRMW4xQ25JWGQ4dHRrVG5QMWsxNi9tbEI4VmNnSk44SWZqazZsQzhC?=
 =?utf-8?B?YnlMWEpRNVBIMHU1ZzNmRE5zVldSMWlPZ3lGSFRDdlZMejRtbjFDOEtaaUE2?=
 =?utf-8?B?TDBndVJzMTNVaTBYMWZEaEoxdGFOUEtObWovekYzQ3ZUa0tCcDRHdWtENFUz?=
 =?utf-8?B?M1d0WFBjdVJBUFgwNmJCT202RlZpNlYzWUJNV0pOV1FEWmtJbjZ2dlA5UjRJ?=
 =?utf-8?B?MHJ3Sjk0SUV1SGl4anF1OFRvZEllbVRxc29aR3J6cFg1NTllYzhuZ2ptdk9E?=
 =?utf-8?B?RVBXWFlpaFpPei82YytVTHByNE1VS0xhMDJ3RW16a1lhd3BGUTZ1QndNYVZj?=
 =?utf-8?B?MDBGOFhEZFNjMTFZQllEaVZRbHUzOEcwWWkzWG1LV1YwK0g1WDg5YmQrMEt0?=
 =?utf-8?B?Vm0rK0lPdVNRQWthWVN0c080c1cxakZ4SkJIbnFsN2M1Q3Znckh6MUN4dlJK?=
 =?utf-8?B?L3NUdnpKUjhFdG1EL1pockpUNXZoWXlzUFJnRytOYlZwL3BNVjBQL2dVMlNr?=
 =?utf-8?B?RDZrNjdsUTQrOFBKclQ4MlBUcnU1S1hmWjVKdDFOdzVpMDAxVXl4M0VXWEtQ?=
 =?utf-8?B?ZmN3cjBiNUZvKzV0cVM1L0s1SVZJLzVmVThyRWVJTHFuRDRZbnZkWEVyVm1z?=
 =?utf-8?B?a0JaNUw1ZW40dUN0UFdZdkswTW5hVWdrM1B0YmhxQ0NSazdJZUJJNDl0ZHZw?=
 =?utf-8?B?bUJ0MjRjeVFoa2ljQ1lZaTViRE5oMFdrcVlOQ0Z0WkJSVFlWTFFXZ2dWZVo2?=
 =?utf-8?B?bUZmY25xNE8vZUpYMEY1a2lZdEExTUxvVFNSMjlsY09kZkFjcnZNQjFUVEUz?=
 =?utf-8?B?Y1NaOTRiZW5lRjdBNVY0TDV0S3MzcG5nRmN3TXJlQ1RoYW9nc0ZsRXg5ald4?=
 =?utf-8?B?cGo3SDFKNkk0Y2Y0bzQwM0pYQzNmYWp1b1dCNWQ5czBoMFVRNGZpRzlubTRq?=
 =?utf-8?B?MFZOejhDdUk2WVZxUjc0cnpiYTNLcDR2Q2krRzRuSDFoRjJQcDNtVmJtR1p4?=
 =?utf-8?B?QTJJTGdJOTBDWGRsWHlBN1BlUnBLWFllemNKOVQ1OW9DMXcxdmdQbkFYU0VK?=
 =?utf-8?B?b21mWWhrcElOWFN6cGpPaXJUd3RsYmlhNW9IaGpWd0krNUdnMHRsZU16eEZn?=
 =?utf-8?B?OXFmQ2tJeDRsVHRVL0hFQkFvUGRzN0RVMVBGNHAvV0o0endLT1ZGTnV0d0xD?=
 =?utf-8?B?QkR5eW1ET1lweU5LY29ITEk1T2xUWmptMk95ZWtXZnkzd1RlalpZTHNBdXNN?=
 =?utf-8?B?RXZHeDkvR2VxajlNOWFNeTVrcmM2MGRaUm1wMFo0MTIvckQ0ZHVwaTZwY3Fo?=
 =?utf-8?Q?/CCQQQVRTZH0rg9hrH0VAB19QJLA1CpqPi9qg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkRHc1l2dThIbllSNytmMmJYamxwNnNWa2NVQ2RWUjVUZFUxMGkvcTFEY1RF?=
 =?utf-8?B?NkdVYTlCeTYxUVVHSVVKOUN2Unk0UjErK1plYVd2c0c3STdmQVhSZnptM01j?=
 =?utf-8?B?RlVqSURPNGsxdTI4WTdVL0J6LzVncVpaa3ZoejhybDdQd1M1V0JxYVVsbG0z?=
 =?utf-8?B?bXVVZkxPWXZxMmlKRFU2alNUeVdUSXVhd2dBRks5TEJZMFdJM2F0MkhOTzI3?=
 =?utf-8?B?akxVQ2VzQ1FSRExMdlJNa0w0QVU5WGNJbHZMcFloRTAyZ1RLdXMyb0lpZXI0?=
 =?utf-8?B?Q3ovMDYyQXZiVkZxalNqQnQ4RzhaMkdQQTZXWnJxbmNVR091dzc4R0NzUi8w?=
 =?utf-8?B?RTZzdTVMY2JydmZTbFFpcG9EakllZG91dzY3ejNBemVqd3l1UWJscDQ5dHpv?=
 =?utf-8?B?UFR1ajg4cEVoRWE4L1dMVGUrY3Bzb0U3a1NYYXFrYVUrU0x1c0FGMjd1T1Js?=
 =?utf-8?B?TVErOGRYaWdpLzE2bElKWG5lOGdhSlczOXFqMXRYM0dJNDBwZVFXcDBPaEdP?=
 =?utf-8?B?UEd3c1Q0VXBvOWtZZ2FPZmtvWlNHK0hGcVNpNUZsM0swZWFGd0xqWVRXZGlD?=
 =?utf-8?B?YmJNRS9GdEwzY2VKQzNTS3FrcHIrV01HM3RlT3JRbmNXMHRZdXRNeG40Z2Jr?=
 =?utf-8?B?blpDTXgycTM2UnBaaTAvajdmUS9uVEhzT3c5akd5OEd4b3V6VktlVkhWbFY1?=
 =?utf-8?B?c3RRTWpiSVBYK1VoRHdsL2tQMUNIV1dVMEdwMllZR3JlN0VpcTBHMDNLU1kw?=
 =?utf-8?B?aTdhWndDWkJLWDNEaGJtYmE0cmZOSWlvN1JBSEVLTkx2T3dObXlhLzBvOCs1?=
 =?utf-8?B?Nm5tSE9iR082M3FaVENTK3YxVlRHV1ZKZ3Y4R1JuTS9SM3JXM0ZVUWR4LzRr?=
 =?utf-8?B?eEJIckUySVA5dk45V2tPUWx2aWh0cjlWOExOaTM0MnVRdFhDZjBxWmVXcHJ4?=
 =?utf-8?B?S1NiQWExRG1TS2FGblZNWFZOQTJtV2x0NXRiTXp0NHJIVHJyMzEvU2Nyck96?=
 =?utf-8?B?Z2JPeFI1ZXMrK3JUZi9GbEtsTWhjR2tzNkRpMzJ0blBiWmdjb1VIQ0FhNkVL?=
 =?utf-8?B?dkJJeGpETEplVHpvazZDYlRUenJYem1IeFBZQ2UyYzNuSmgzYTIzeS8raDFs?=
 =?utf-8?B?aDBPbllXaXVuMHgydUlOUHh5M0FSMzhQaEFmWWNjUHdJbWFGYTZaTjZ3Ty9G?=
 =?utf-8?B?WnZCMm1BUElDdW5LVmRaUUR1aGFZU1dIeDZaTkN2UlFFVmFVTldNVFAxM2E1?=
 =?utf-8?B?WnBYbnN0STAxeXEvUm4rR08zRWlhN1lKL3Z4aUVEc29MUzhHNnoraS90MkN2?=
 =?utf-8?B?OWVsNjZwQW1sb0dOV25YaHM0aWNHRXZ4Rmh6cmZySWQ3eDFSa2VseWJtb3Nx?=
 =?utf-8?B?ZnMzNmxzbE5kd2tsYTlLcnU2M3VJR3EyLzlqTHcycmlEMFFSb3FBUGwycjVl?=
 =?utf-8?B?VTl6OFE2TjV4bHVuQ3V5YmJQVTl2TkFQU0NlRVRDMkdodFY1SENxT1JFVmkv?=
 =?utf-8?B?eDVNc1hCQ3FXNlRabmhxWGE0RUNObWRBdHFHbkxNTnEvZE43aENVSXMxWFBv?=
 =?utf-8?B?WndyRWtZUUhOY3BVRmxGckVOdzZvc2FWUk83N0FSdVhlTVI4c0pDQ2t2bjgr?=
 =?utf-8?B?TmtYdVR2OW5ZUkFiM3VNSXdycm05UG1TSUNFNlNuZEFjWGZoV3lZb2krRUIw?=
 =?utf-8?B?K0xWQkpCR0xpMmFpd0p3MlBGL1ZpV3B0RXFkQVRvbk1WeE1YUTllUHVHK0NG?=
 =?utf-8?B?SE5KTTk2L2drMGxPTHNqY09QRWdURnplTWxIaHkzZXVtdGxKb1pYTkgxbjhQ?=
 =?utf-8?B?Z2lEZks5SXJ0aDI3MytzMnB4VXQySVVMVnR3OElrWGhMeW5iNXNIZTUzdGNK?=
 =?utf-8?B?TmpZSkpHWXRuVDR3Z21LZWFxMXVpT1g2a1A4ZnZDL0x3UWE0RXlnV3c0aExa?=
 =?utf-8?B?VnRjUXN3YjFNZkdySU1NUW1EZVpSamdudmlmWm1MY1NMekJTR0phLzF0NW0z?=
 =?utf-8?B?OU8rbytYc1FZckZncXpwaXRSWms5bkFVRDY3NllIRWpTcXc4dyt1SHFKSFBn?=
 =?utf-8?B?c2hsTlpWdmhZaHJUQkdpZ1pCMGRQdGVJdzFFdFV6bHZNLzYrUzdlcmJJNU95?=
 =?utf-8?B?QUt6WThGVDRRdGVHV3NBQWgwOFRrUGJRV3I5UDVYampGNzNXdlZwZXJBMWxs?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0ec7dc-b291-4f89-fa0d-08dde41f1b04
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 21:34:00.6668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwRzvaOq/YbfHxvmU9WXJ+pcTxg9W6GX1aoCzI53RqPq6DwC8lmwv0avK+LGIHWo3p0joaO8SV6cnkTxv7fXcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6788
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

The skip on disabled case for tasklet add in v2, effected part:
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c 
b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 380a11c92d63..f0ee3f1235d4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -1326,6 +1326,9 @@  static void ct_try_receive_message(struct 
intel_guc_ct *ct)
  {
  	int ret;

+	if (!atomic_read(&ct_to_guc(ct)->interrupts.enabled))
+		return;
+
  	if (GEM_WARN_ON(!ct->enabled))
  		return;

This part was dropped, caller intel_guc_to_host_event_handler already 
did that check.

Regards,
Zhanjun Dong

On 2025-08-25 5:19 p.m., Zhanjun Dong wrote:
> Boolean flag access from interrupt context might have synchronous issueis
> on multiple processor platform, flags modified by one core might be read
> as an old value by another core. This issue on interrupt enable flag might
> causes interrupt misses or leakage.
> Change the interrupts.enable type to atomic to ensure memory
> synchronization.
> 
> Fixes: a187f13d51fa0 ("drm/i915/guc: handle interrupts from media GuC")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14834
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> ---
> Change history:
> v3: Drop skip on disabled case for tasklet
>      Drop memory barrier
> v2: Add skip on disabled case for tasklet
>      Add memory barrier after flag changed
>      Add Closes tag and typo fix
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_irq.c |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c | 11 +++++++----
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h |  4 ++--
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c  |  5 +++--
>   4 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index 75e802e10be2..21804eec8320 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -20,7 +20,7 @@
>   
>   static void guc_irq_handler(struct intel_guc *guc, u16 iir)
>   {
> -	if (unlikely(!guc->interrupts.enabled))
> +	if (unlikely(!atomic_read(&guc->interrupts.enabled)))
>   		return;
>   
>   	if (iir & GUC_INTR_GUC2HOST)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index f360f020d8f1..1b8d3bbfa16d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -100,8 +100,8 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
>   			 gt->pm_guc_events);
>   	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
>   	spin_unlock_irq(gt->irq_lock);
> +	atomic_set(&guc->interrupts.enabled, true);
>   
> -	guc->interrupts.enabled = true;
>   }
>   
>   static void gen9_disable_guc_interrupts(struct intel_guc *guc)
> @@ -109,7 +109,8 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>   	struct intel_gt *gt = guc_to_gt(guc);
>   
>   	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
> -	guc->interrupts.enabled = false;
> +	atomic_set(&guc->interrupts.enabled, false);
> +
>   
>   	spin_lock_irq(gt->irq_lock);
>   
> @@ -146,14 +147,16 @@ static void gen11_enable_guc_interrupts(struct intel_guc *guc)
>   	__gen11_reset_guc_interrupts(gt);
>   	spin_unlock_irq(gt->irq_lock);
>   
> -	guc->interrupts.enabled = true;
> +	atomic_set(&guc->interrupts.enabled, true);
> +
>   }
>   
>   static void gen11_disable_guc_interrupts(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   
> -	guc->interrupts.enabled = false;
> +	atomic_set(&guc->interrupts.enabled, false);
> +
>   	intel_synchronize_irq(gt->i915);
>   
>   	gen11_reset_guc_interrupts(guc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 053780f562c1..40242bbb166e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -93,7 +93,7 @@ struct intel_guc {
>   
>   	/** @interrupts: pointers to GuC interrupt-managing functions. */
>   	struct {
> -		bool enabled;
> +		atomic_t enabled;
>   		void (*reset)(struct intel_guc *guc);
>   		void (*enable)(struct intel_guc *guc);
>   		void (*disable)(struct intel_guc *guc);
> @@ -393,7 +393,7 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
>   /* Only call this from the interrupt handler code */
>   static inline void intel_guc_to_host_event_handler(struct intel_guc *guc)
>   {
> -	if (guc->interrupts.enabled)
> +	if (atomic_read(&guc->interrupts.enabled))
>   		intel_guc_ct_event_handler(&guc->ct);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 4a3493e8d433..9d01c3c3d504 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -659,7 +659,8 @@ void intel_uc_runtime_suspend(struct intel_uc *uc)
>   	struct intel_guc *guc = &uc->guc;
>   
>   	if (!intel_guc_is_ready(guc)) {
> -		guc->interrupts.enabled = false;
> +		atomic_set(&guc->interrupts.enabled, false);
> +
>   		return;
>   	}
>   
> @@ -687,7 +688,7 @@ void intel_uc_suspend(struct intel_uc *uc)
>   	wake_up_all_tlb_invalidate(guc);
>   
>   	if (!intel_guc_is_ready(guc)) {
> -		guc->interrupts.enabled = false;
> +		atomic_set(&guc->interrupts.enabled, false);
>   		return;
>   	}
>   

