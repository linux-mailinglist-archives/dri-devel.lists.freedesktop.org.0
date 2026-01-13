Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB25ED173F2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 09:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB0F10E46E;
	Tue, 13 Jan 2026 08:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YcG8Qspp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D4410E46B;
 Tue, 13 Jan 2026 08:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768292416; x=1799828416;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BM1mpgnc1aiL7aulwPlI5lNewI9AVXQ1YjUK1KlJqQo=;
 b=YcG8Qsppy0ktWAeFktamT/Aim6X/gJzZ6JPcwoDbKxbVBdeBNRdGDke0
 l5MHF4kjte2EJrrLPE6msh9MTfM6mTtqXpOh0SlhZZCMofVa7cxAbl42W
 1QhhRjy5cq1eZsm1vgA7SzfdkIGYR1BYxplYg8zK5mtbCObVKw3tbQ53i
 jM55Gr4ZKJknAeujOu+58juaW8Ece+B/lA8GXlNWY5ovTWAWt7S8EOViw
 6qrbVmVd8hJpceTbckDpENMIlFmxx8aYXNlmxqzN/lqPMkG/kpMsv+WqS
 m9KKzThvX1ylpT4BWqovus7sb4dEqw1okFPq9OxW4qYUz8lgHNSwOnEJl w==;
X-CSE-ConnectionGUID: ILHDnSbYQNmt/CDGt+ma+Q==
X-CSE-MsgGUID: //vqCLbLTZiY9Epxd8Ua3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73425698"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="73425698"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 00:20:15 -0800
X-CSE-ConnectionGUID: 9BAlOuQqREG8++CO4/5H+Q==
X-CSE-MsgGUID: DzHE/W1aQmWDPpqhtUKGQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="235564321"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 00:20:15 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 00:20:14 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 00:20:14 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.28)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 00:20:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ks3IhoAfj8n32V0uP7NoVCSMnQRwPwSjJCSCYAMnmWArbqTnW2KWiCHYhO/AHL9POJLP9A3dODNcSWWSuOg3DqOQhgpUCSLYzS5aq3MPGonO72Bq0WGWO/4tjIBKAG/JxhIrxnYP0pdgUvUZVY21olimVrx03JCK9oMWa2Fw/1ut4rTuquoN7Hs6PevX1vXXky+0XUOvJHM51heM0B1uUzaPaVN9tQQ7TJa1yVtrVbADDf904ou+zjLT53nmfYNd/4HyVswl68BJIqQGHhK9nV7NHtVaULzdLyeKbiWBERJVk3yT9NlD0XVx/B1w2EwvBehgfARmVwHcUMTN424qcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SCJewijGOW8PXHTTJ5Jb+GwDnvKa/oBX8t1gslSJgk=;
 b=ll8Zb3uvCo9+/eUF5SxdM9Ld37DZPkcIxConiyiROhAHxkLAnAo/3D9mrc4L97A2tyu41qnvddP6FryBiOgWgMAJNAAAuoKR0/Pu1y8dPjrq3vwqPHvzj3LIrijk0q8ylVlhB7SE7lbT6ewNQcFk2A7AUIc6S9WHNZGgfpPCTJGSqHA94KwzBGIGCkYcLVx0kpct+I5t50/O1FwBRL+4qD2sWoMuGeY8p+gBtivVaQKgU2SF74dVWcE92ZPpwDq3ab9KM1BUsVKInwahSoHk9C7Ex5Ah429q1F+afEQIhGBamoCCunqP2Yze3OzuzuvBdCpVfTXetQQKZvkALQzA2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB7090.namprd11.prod.outlook.com (2603:10b6:806:299::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 08:20:11 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9520.003; Tue, 13 Jan 2026
 08:20:11 +0000
Message-ID: <19fd4d44-b7d6-4bc2-9255-3d5159ec1435@intel.com>
Date: Tue, 13 Jan 2026 13:50:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/ras: Introduce the DRM RAS infrastructure over
 generic netlink
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>
CC: Jakub Kicinski <kuba@kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <aravind.iddamsetty@linux.intel.com>,
 <anshuman.gupta@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <lukas@wunner.de>, <simona.vetter@ffwll.ch>, <airlied@gmail.com>,
 <pratik.bari@intel.com>, <joshua.santosh.ranjan@intel.com>,
 <ashwin.kumar.kulkarni@intel.com>, <shubham.kumar@intel.com>, Lijo Lazar
 <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, "David S.
 Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet
 <edumazet@google.com>, <netdev@vger.kernel.org>
References: <20251205083934.3602030-6-riana.tauro@intel.com>
 <20251205083934.3602030-7-riana.tauro@intel.com> <aTiWNkGmwFsxY-iO@intel.com>
 <b986eb03-0887-4eb2-a7a7-50ef63e51096@oss.qualcomm.com>
 <aWFruAO06O93ADjU@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aWFruAO06O93ADjU@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::30) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: a02a755d-5fb9-406d-780c-08de527c9208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Um1qa3BRZmtWVTZybTVCdzRRR3Y0U3RvMVo4UGxBbGF5TUg5aGdsQ25BTSta?=
 =?utf-8?B?L3VzS1RjYzk5M2FQZEIrdHY5VysrTWRpcDczVmtmSlN2S1JJRlkrellWeDdq?=
 =?utf-8?B?U01SMVFUc2tteFkxQzF6VUVWL3JLR2dTRWxtQSt4RzEwajNwYVJLMEMzZHdP?=
 =?utf-8?B?RkkzQlJMa0ltQXRxbCttem9rMXBHNmk5UXhYZGtmSFM3Ym5DK1NqYVgzTXNJ?=
 =?utf-8?B?YzR3N21OOElFMTVDd0Uvd0lGZENsYVRYaDc2T1dRMmFzZjAzc01KVlpwTWlF?=
 =?utf-8?B?UEFaWFZLM25iRFBHZ0hQUTlHcC93enVSaSsyTldzakszTk56ajA4b2hRVlhi?=
 =?utf-8?B?MDd5S1dkaWdZcW4xMlVXaG85Wmk4VmNVRWM0UDNFNm1jK3YwMEpsbFM0NFQw?=
 =?utf-8?B?UUZQRXhobFRJR3hGamp0b3ZkYVJEb3JwOXZWdk84eUdXRjR5dTFIWk40VjdT?=
 =?utf-8?B?c0djY3psRmgxY0R5RzZ6Ky94TWJVK2NwWDFmdnlFS3ZUUFFYL2lwOVRSVFVI?=
 =?utf-8?B?UEh0MDlZV2dDdnNSekt4LzVVaGhHSHphT3J3eDd2RnZxenZUME1nWjl0N2d4?=
 =?utf-8?B?czhCODBhbjRVUWM3UXVKODVuTEJ4TmpGODc3SWVraU1hV01sUmU1WGhGLy9i?=
 =?utf-8?B?L3lzYjlZcjg2b3VEV051cmhiamdqWXZtMXQvc1NudzYvcE9JbHVMZmYxV20x?=
 =?utf-8?B?V3d0bVRpZk15bEhWbCtXWUJCU2xrNkd5NXhKbDlNS0FwT1ZOLzRnWVJWd3h0?=
 =?utf-8?B?bUhDNGFsUzBKSHIvUWJPT1NmWDlJMGkwcUpRRDU2cHVYckdWWkIvUXVyNzNT?=
 =?utf-8?B?SHhtYXpIK0tkNU5hYVRTYnQ3NnFjNGVkUWxWVFlQZ1E4RllGa2MycjYyT0dr?=
 =?utf-8?B?VFVGdmlnZXk1ZDhaRmNRNTI5a2FEVXl2Ukh3bExQWmF1aDdZQ1BhcTF1Y2ZL?=
 =?utf-8?B?dHJUS1o2UjBXN2dYNTZLU3RJTmNDeUVUZ3pkem9KUWxreVJWK1N0elpVTVZN?=
 =?utf-8?B?SFBYQzlSNlpVdHM1UVdHbmhwQnRkdnN6WWw2SVA1VEVnNXJ2amNIV0I3bFh2?=
 =?utf-8?B?SEFaZXpzY0pjdVp2UUJHcmJnajVGYU1TL0h2RUsxd1BndTNxYXVGTGVUTm9u?=
 =?utf-8?B?enc5bms0QXZHTi81VHc3eVNQa0xDVkhnVFJNMUZNWTJyOXAxMWdMRVF1Y0hx?=
 =?utf-8?B?NkdpZFcrbmlLSTRaRElKMkIvUFNUOGhDWkM2OUFQMkNxcitYeklydVRKTmR0?=
 =?utf-8?B?Y1hqSjBHcndnNWJNTE4rbnpoK2JuVllXbzBvUGNlbjU0TER3dktiT1d2d1F6?=
 =?utf-8?B?cldETS9rSm8vNzhmNWFDOW0vUW5vSlRna0s0bWJpSXZYdUQvaEFmSUJ3QVkv?=
 =?utf-8?B?ZUdZb1BXdVlBQlVJNzBNeDVXdklPUy9EYVluRlpja0s2YUpIWUNkVXU0Zno3?=
 =?utf-8?B?cmdjMHVlVi9XT3NRSmQxa3lBM1NESWhoRXBGZ3cwcklvVEFwUHlRYjJMYXMx?=
 =?utf-8?B?dFFWbkN1UDdhU2FPWHdUN1lFMEp6V2EwZUdheDFEWmkxSVUvZEhpTGt5SlNK?=
 =?utf-8?B?Z1Q1cVRYZTBzaXRYcU0xcUhOSHdNRXRDd0liSW5hTVdlNmRkckwzZEx5U0xH?=
 =?utf-8?B?MnF6UnZoQmVZODUwbUc5TmRMSDhnVzJJVkFhR2FIMnBDcnBBcXA2MjQwbTdF?=
 =?utf-8?B?alFVMlZ0Mm5GMFpqam5uTUtmeWlSVWF5L204cXp4L21lV1BXVmQrMkdYcmVr?=
 =?utf-8?B?dGttTHY1OUk1Ti9aWndVRWx5bERJQ0JZWVpZaFE2NzNLR25Gdll6ME9UVXBO?=
 =?utf-8?B?QWQxSHA4TzF1R2JyTUpUTWliZTZ0d1UxMFpkR2MwNko2T1EyTkdCWmM3cDJI?=
 =?utf-8?B?azNRNEVJQWN5b3FiYzRFVnk0MEVIdFJUdVhvckxQY0ROMExRME9iaGdQSC9z?=
 =?utf-8?Q?1xkKbrE+7h4MzttHLMrOz5RaMya1Gbzn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE4yRTYvcWRWcjF1N2pKeUUwWnBhVUZyVHZSejN4cm5mWnhBbXlSakpheGFp?=
 =?utf-8?B?cFRoT2Jrc3FRNW5VSzJZQ0JVeWhRaHR4OG4wdmxIVnFxdnFadnhFYUo1UnJ5?=
 =?utf-8?B?RW4xdDdmMnpYVTlYRVRnamF3NjFPbVdvVzVranJqQ1ZJUVJqNUxOVEdWSENR?=
 =?utf-8?B?TmZ1a1NDcWtndmNkMlhEM3MyTGJYTDQ3ODlJcXN1a0VZbWtvSDBQZGNmVlhW?=
 =?utf-8?B?Y1NiQ3hNU3lzOWdlcU81djBaRXRIRVpYT3dEbVdlNnVpQUU0Z1g0d2VQcXU3?=
 =?utf-8?B?NTBNNWZ3R0tRSEt6cWRvQ200UCszVVlvYS9nRVNZamxLazNKUzE0UGQ2Zjhx?=
 =?utf-8?B?RWtpMG9JVWZqSDZva05KdTY2UHU3THA5MjRrVmI2VG1zUmZjSTdlOUtsaUFH?=
 =?utf-8?B?VDhlUnRROXBTNjE0TzJrKzdIVDZERzhoMWQraHlpQ0krZUFBM2JDK3dHQ0s0?=
 =?utf-8?B?SmVKSVJoNVRFZ3poOC9YM3hTMVkza21DMDNEZzFFZElQcURUbjRrMExYMXJT?=
 =?utf-8?B?eFVOQ1JhbmMwNWZkN1c2QmhtQUdhcVZZQnFFWnd4amVUZVRURXBwcE5uOXk3?=
 =?utf-8?B?U2JuNWNRblpianZGVzZGMGF6dlJvcmNoSDVBcm9ua3FtYnVJY1lFZ0g0bTR6?=
 =?utf-8?B?Yml1UE1JNVBiMGVPakFtT0h4TW9LbjRHQVUzVitkZlYyOVJWVHVnQWFQZ3Rn?=
 =?utf-8?B?Z2JzWjRhSW82bFJKQjZEZGZydUl4cDhTTjlobWdnNkV0T2JDUmNFeWlzeVBQ?=
 =?utf-8?B?RnZ5eVZOMkVJSXk2V3psRUI3Qkswb1IxenlHVTNOY1FNTXZQbjVwcksvbFFX?=
 =?utf-8?B?bC83NktleHEzelFTOTdiR0tHbzkxaTJmdjB3Rnp3VVRKNExBWGNBdnFmMUtU?=
 =?utf-8?B?QnVOc1FOQW5LWExwRVBhcU5sd3RaanE2UGtNQ3ZKZGFRU0lwVFlJcVQvZUFR?=
 =?utf-8?B?NXFqSk4rQlZ5eXg3K3phK2dXOGIxSnBNZHVaS0dXekhkRHpJM1RpT1Rqenlv?=
 =?utf-8?B?SW1HMUV2UVZZTFovK2d0MXczMklPMWdyaEdHbFVVNms4RWM2VG1TS3c5UzU3?=
 =?utf-8?B?T2dkeUk5cTFnL1BCdGNEMHlTV3A3aGJoeXllV2hkTUdJMkVPOW5JZ3NZQUJx?=
 =?utf-8?B?S2tkUnYzV05Jcjh4c2VJTm83YjJsMDA2YmROdUJSeVJVWjZLdXNhUzdXdENX?=
 =?utf-8?B?TDV5cmNrZ0xnNUJDU0FSNGgwRXl2algxeFhmWTN1YytwUkNyMzBQeXMvUWxj?=
 =?utf-8?B?MWJ1ZGhNVE05cDU4YVdSQW83T3I0SW8xZjBHQ2s4dlFTMms4Q3lKdlQwR1lV?=
 =?utf-8?B?djlyWW14b3pWU1BQT056cW9BWldWZXNWZGxpcFpJellOOGV2dFczcTNYUEYx?=
 =?utf-8?B?WW9QVVh0WDU5eFVkYW51NklyZjdDTVlFR0huRkNVMTU4dWFvWHJNZmRMYkpl?=
 =?utf-8?B?M2tqQkFPUFl2ZkRQV1RtcWZrNDl1em1UQmFGbHFLempsczQvUGNvczdZazhy?=
 =?utf-8?B?dVVEa3p0SC8wallLVDdST002UmpkZGhIV3ZOdUpvSmpKSXIvaVFoNVdXdE1B?=
 =?utf-8?B?WEpIWDBFZjBjOStoclNxaE1GVTl5WlJLbDJmdzBmUjJWRjk1UXZXRElEY1VK?=
 =?utf-8?B?d2JEaGlzanljdDNCdlprVHg3K2xtSzRLZTZkUkxPTkhvUmY4cVVzUFFlbllk?=
 =?utf-8?B?UktkZThQWk1jeWhRWEszYXdrc3RxWWZRV1l3dFlaczJmeEhYeUJHWWdJaDhD?=
 =?utf-8?B?TlVkN1dDTDR1aUM1cWZHWVNqVkVpK0oreXpOYmMzY3BoajE1MkRGaDRJUCtr?=
 =?utf-8?B?ZmYvYVJvTkVyVWFhRXVmUUpSMU9JcVR6NTZhZ2QyRmtLbEg0RWJDdHBQdWp0?=
 =?utf-8?B?dUZ3c3dmbVFMM3A3ZVk3QXhiV1p5SSs0a0RpbFJNdUJqNWlFaUpiT3l2WW9n?=
 =?utf-8?B?SmFEQlZRMmorelBiSkVXN0paSnR0WUFzdVRIUVVzNUlmMVZKcEJhdDdsK0hs?=
 =?utf-8?B?YWhjK2dPQVVPQlh5T3hla1pkRXQ4bTllQ1R2NXlwNnVEaWNKeGNZOWRia2t0?=
 =?utf-8?B?cTR1RGkzVmZpZ0xiZVYrUVJMQ3NPbURac3dOQVF4RllTMkZNSjBHTlVXUjgz?=
 =?utf-8?B?K21vUVFDVXpleTMyMnA1QW9UQ0NmdWgrdGxVMU1zb1NNTVVxS0ZIVVpONnZV?=
 =?utf-8?B?NmV2akVjekxrSWpKRXRtUHZIdGc4SERmZzc3NloyWHkxTUVlVWhHSkJCeVda?=
 =?utf-8?B?aGw5VUU3alRLdmFPUFRBbnJ3YmhTZzluZGQ0cUwyS01vdUF1RHR2Mks0Nzlx?=
 =?utf-8?B?czJtUFMyQ1F6OTY1NnFiQ1J0c25xRnFuMUt6UGVubmFOTEJCQXdiUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a02a755d-5fb9-406d-780c-08de527c9208
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 08:20:11.6019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTG9ykc23udfsMYRR8g/zr5hBBjZtTrtvkUGdRFqyv1wNmimcA9VtBu38QiKxEYtNnp3uMvWxBR7TaX7FFfU+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7090
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

Hi Rodrigo/Zack

On 1/10/2026 2:27 AM, Rodrigo Vivi wrote:
> On Thu, Jan 08, 2026 at 03:36:45PM -0700, Zack McKevitt wrote:
>>
>>
>> On 12/9/2025 2:35 PM, Rodrigo Vivi wrote:
>>
>> Apologies for the delay getting back to this. We are still supportive of
>> this functionality making it into the DRM subsystem but have a couple of
>> questions.
>>
>>> On Fri, Dec 05, 2025 at 02:09:33PM +0530, Riana Tauro wrote:
>>>> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>
>>>> Introduces the DRM RAS infrastructure over generic netlink.
>>>>
>>>> The new interface allows drivers to expose RAS nodes and their
>>>> associated error counters to userspace in a structured and extensible
>>>> way. Each drm_ras node can register its own set of error counters, which
>>>> are then discoverable and queryable through netlink operations. This
>>>> lays the groundwork for reporting and managing hardware error states
>>>> in a unified manner across different DRM drivers.
>>>>
>>>> Currently is only supports error-counter nodes. But it can be
>>>> extended later.
>>>>
>>>> The registration is also no tied to any drm node, so it can be
>>>> used by accel devices as well.
>>
>> Thank you for including the userspace reference implementation. I have
>> begun prototyping an extension for our qaic accel driver to incorporate
>> telemetry functionality by adding a new node type to drm_ras. Overall,
>> extending the interface is intuitive.
> 
> making it extensible was one of the main goals here...
> 
>>
>>>>
>>>> It uses the new and mandatory YAML description format stored in
>>>> Documentation/netlink/specs/. This forces a single generic netlink
>>>> family namespace for the entire drm: "drm-ras".
>>>> But multiple-endpoints are supported within the single family.
>>>>
>>>> Any modification to this API needs to be applied to
>>>> Documentation/netlink/specs/drm_ras.yaml before regenerating the
>>>> code:
>>>>
>>>> $ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
>>>>    Documentation/netlink/specs/drm_ras.yaml --mode uapi --header \
>>>>    > include/uapi/drm/drm_ras.h
>>>>
>>>> $ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
>>>>    Documentation/netlink/specs/drm_ras.yaml --mode kernel --header \
>>>>    > include/drm/drm_ras_nl.h
>>>>
>>>> $ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
>>>>    Documentation/netlink/specs/drm_ras.yaml --mode kernel --source \
>>>>    > drivers/gpu/drm/drm_ras_nl.c
>>>>
>>>> Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
>>>> Cc: Lukas Wunner <lukas@wunner.de>
>>>> Cc: Lijo Lazar <lijo.lazar@amd.com>
>>>> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
>>>> Cc: Jakub Kicinski <kuba@kernel.org>
>>>> Cc: David S. Miller <davem@davemloft.net>
>>>> Cc: Paolo Abeni <pabeni@redhat.com>
>>>> Cc: Eric Dumazet <edumazet@google.com>
>>>> Cc: netdev@vger.kernel.org
>>>> Co-developed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>> v2: fix doc and memory leak
>>>>       use xe_for_each_start
>>>>       use standard genlmsg_iput (Jakub Kicinski)
>>>>
>>>> v3: add documentation to index
>>>>       modify documentation to mention uAPI requirements (Rodrigo)
>>>> ---
>>>>    Documentation/gpu/drm-ras.rst            | 109 +++++++
>>>>    Documentation/gpu/index.rst              |   1 +
>>>>    Documentation/netlink/specs/drm_ras.yaml | 130 +++++++++
>>>>    drivers/gpu/drm/Kconfig                  |   9 +
>>>>    drivers/gpu/drm/Makefile                 |   1 +
>>>>    drivers/gpu/drm/drm_drv.c                |   6 +
>>>>    drivers/gpu/drm/drm_ras.c                | 351 +++++++++++++++++++++++
>>>>    drivers/gpu/drm/drm_ras_genl_family.c    |  42 +++
>>>>    drivers/gpu/drm/drm_ras_nl.c             |  54 ++++
>>>>    include/drm/drm_ras.h                    |  76 +++++
>>>>    include/drm/drm_ras_genl_family.h        |  17 ++
>>>>    include/drm/drm_ras_nl.h                 |  24 ++
>>>>    include/uapi/drm/drm_ras.h               |  49 ++++
>>>>    13 files changed, 869 insertions(+)
>>>>    create mode 100644 Documentation/gpu/drm-ras.rst
>>>>    create mode 100644 Documentation/netlink/specs/drm_ras.yaml
>>>>    create mode 100644 drivers/gpu/drm/drm_ras.c
>>>>    create mode 100644 drivers/gpu/drm/drm_ras_genl_family.c
>>>>    create mode 100644 drivers/gpu/drm/drm_ras_nl.c
>>>>    create mode 100644 include/drm/drm_ras.h
>>>>    create mode 100644 include/drm/drm_ras_genl_family.h
>>>>    create mode 100644 include/drm/drm_ras_nl.h
>>>>    create mode 100644 include/uapi/drm/drm_ras.h
>>>>
>>>> diff --git a/Documentation/gpu/drm-ras.rst b/Documentation/gpu/drm-ras.rst
>>>> new file mode 100644
>>>> index 000000000000..cec60cf5d17d
>>>> --- /dev/null
>>>> +++ b/Documentation/gpu/drm-ras.rst
>>>> @@ -0,0 +1,109 @@
>>>> +.. SPDX-License-Identifier: GPL-2.0+
>>>> +
>>>> +============================
>>>> +DRM RAS over Generic Netlink
>>>> +============================
>>>> +
>>>> +The DRM RAS (Reliability, Availability, Serviceability) interface provides a
>>>> +standardized way for GPU/accelerator drivers to expose error counters and
>>>> +other reliability nodes to user space via Generic Netlink. This allows
>>>> +diagnostic tools, monitoring daemons, or test infrastructure to query hardware
>>>> +health in a uniform way across different DRM drivers.
>>>> +
>>>> +Key Goals:
>>>> +
>>>> +* Provide a standardized RAS solution for GPU and accelerator drivers, enabling
>>>> +  data center monitoring and reliability operations.
>>>> +* Implement a single drm-ras Generic Netlink family to meet modern Netlink YAML
>>>> +  specifications and centralize all RAS-related communication in one namespace.
>>>> +* Support a basic error counter interface, addressing the immediate, essential
>>>> +  monitoring needs.
>>>> +* Offer a flexible, future-proof interface that can be extended to support
>>>> +  additional types of RAS data in the future.
>>>> +* Allow multiple nodes per driver, enabling drivers to register separate
>>>> +  nodes for different IP blocks, sub-blocks, or other logical subdivisions
>>>> +  as applicable.
>>>> +
>>>> +Nodes
>>>> +=====
>>>> +
>>>> +Nodes are logical abstractions representing an error source or block within
>>>> +the device. Currently, only error counter nodes is supported.
>>>> +
>>>> +Drivers are responsible for registering and unregistering nodes via the
>>>> +`drm_ras_node_register()` and `drm_ras_node_unregister()` APIs.
>>>> +
>>>> +Node Management
>>>> +-------------------
>>>> +
>>>> +.. kernel-doc:: drivers/gpu/drm/drm_ras.c
>>>> +   :doc: DRM RAS Node Management
>>>> +.. kernel-doc:: drivers/gpu/drm/drm_ras.c
>>>> +   :internal:
>>>> +
>>>> +Generic Netlink Usage
>>>> +=====================
>>>> +
>>>> +The interface is implemented as a Generic Netlink family named ``drm-ras``.
>>>> +User space tools can:
>>>> +
>>>> +* List registered nodes with the ``get-nodes`` command.
>>>> +* List all error counters in an node with the ``get-error-counters`` command.
>>>> +* Query error counters using the ``query-error-counter`` command.
>>>> +
>>>> +YAML-based Interface
>>>> +--------------------
>>>> +
>>>> +The interface is described in a YAML specification:
>>>> +
>>>> +:ref:`Documentation/netlink/specs/drm_ras.yaml`
>>>> +
>>>> +This YAML is used to auto-generate user space bindings via
>>>> +``tools/net/ynl/pyynl/ynl_gen_c.py``, and drives the structure of netlink
>>>> +attributes and operations.
>>>> +
>>>> +Usage Notes
>>>> +-----------
>>>> +
>>>> +* User space must first enumerate nodes to obtain their IDs.
>>>> +* Node IDs or Node names can be used for all further queries, such as error counters.
>>>> +* Error counters can be queried by either the Error ID or Error name.
>>>> +* Query Parameters should be defined as part of the uAPI to ensure user interface stability.
>>>> +* The interface supports future extension by adding new node types and
>>>> +  additional attributes.
>>>> +
>>>> +Example: List nodes using ynl
>>>> +
>>>> +.. code-block:: bash
>>>> +
>>>> +    sudo ynl --family drm_ras  --dump list-nodes
>>>> +    [{'device-name': '0000:03:00.0',
>>>> +    'node-id': 0,
>>>> +    'node-name': 'correctable-errors',
>>>> +    'node-type': 'error-counter'},
>>>> +    {'device-name': '0000:03:00.0',
>>>> +     'node-id': 1,
>>>> +    'node-name': 'nonfatal-errors',
>>>> +    'node-type': 'error-counter'},
>>>> +    {'device-name': '0000:03:00.0',
>>>> +    'node-id': 2,
>>>> +    'node-name': 'fatal-errors',
>>>> +    'node-type': 'error-counter'}]
>>>> +
>>>> +Example: List all error counters using ynl
>>>> +
>>>> +.. code-block:: bash
>>>> +
>>>> +
>>>> +   sudo ynl --family drm_ras  --dump get-error-counters --json '{"node-id":1}'
>>>> +   [{'error-id': 1, 'error-name': 'error_name_1', 'error-value': 0},
>>>> +   {'error-id': 2, 'error-name': 'error_name_2', 'error-value': 0}]
>>>> +
>>>> +
>>>> +Example: Query an error counter for a given node
>>>> +
>>>> +.. code-block:: bash
>>>> +
>>>> +   sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":2, "error-id":1}'
>>>> +   {'error-id': 1, 'error-name': 'error_name_1', 'error-value': 0}
>>>> +
>>>> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
>>>> index 7dcb15850afd..60c73fdcfeed 100644
>>>> --- a/Documentation/gpu/index.rst
>>>> +++ b/Documentation/gpu/index.rst
>>>> @@ -9,6 +9,7 @@ GPU Driver Developer's Guide
>>>>       drm-mm
>>>>       drm-kms
>>>>       drm-kms-helpers
>>>> +   drm-ras
>>>>       drm-uapi
>>>>       drm-usage-stats
>>>>       driver-uapi
>>>> diff --git a/Documentation/netlink/specs/drm_ras.yaml b/Documentation/netlink/specs/drm_ras.yaml
>>>> new file mode 100644
>>>> index 000000000000..be0e379c5bc9
>>>> --- /dev/null
>>>> +++ b/Documentation/netlink/specs/drm_ras.yaml
>>>> @@ -0,0 +1,130 @@
>>>> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>>>> +---
>>>> +name: drm-ras
>>>> +protocol: genetlink
>>>> +uapi-header: drm/drm_ras.h
>>>> +
>>>> +doc: >-
>>>> +  DRM RAS (Reliability, Availability, Serviceability) over Generic Netlink.
>>>> +  Provides a standardized mechanism for DRM drivers to register "nodes"
>>>> +  representing hardware/software components capable of reporting error counters.
>>>> +  Userspace tools can query the list of nodes or individual error counters
>>>> +  via the Generic Netlink interface.
>>>> +
>>>> +definitions:
>>>> +  -
>>>> +    type: enum
>>>> +    name: node-type
>>>> +    value-start: 1
>>>> +    entries: [error-counter]
>>>> +    doc: >-
>>>> +         Type of the node. Currently, only error-counter nodes are
>>>> +         supported, which expose reliability counters for a hardware/software
>>>> +         component.
>>>> +
>>>> +attribute-sets:
>>>> +  -
>>>> +    name: node-attrs
>>>> +    attributes:
>>>> +      -
>>>> +        name: node-id
>>>> +        type: u32
>>>> +        doc: >-
>>>> +             Unique identifier for the node.
>>>> +             Assigned dynamically by the DRM RAS core upon registration.
>>>> +      -
>>>> +        name: device-name
>>>> +        type: string
>>>> +        doc: >-
>>>> +             Device name chosen by the driver at registration.
>>>> +             Can be a PCI BDF, UUID, or module name if unique.
>>>> +      -
>>>> +        name: node-name
>>>> +        type: string
>>>> +        doc: >-
>>>> +             Node name chosen by the driver at registration.
>>>> +             Can be an IP block name, or any name that identifies the
>>>> +             RAS node inside the device.
>>>> +      -
>>>> +        name: node-type
>>>> +        type: u32
>>>> +        doc: Type of this node, identifying its function.
>>>> +        enum: node-type
>>>> +  -
>>>> +    name: error-counter-attrs
>>>> +    attributes:
>>>> +      -
>>>> +        name: node-id
>>>> +        type: u32
>>>> +        doc:  Node ID targeted by this error counter operation.
>>>> +      -
>>>> +        name: error-id
>>>> +        type: u32
>>>> +        doc: Unique identifier for a specific error counter within an node.
>>>> +      -
>>>> +        name: error-name
>>>> +        type: string
>>>> +        doc: Name of the error.
>>>> +      -
>>>> +        name: error-value
>>>> +        type: u32
>>>> +        doc: Current value of the requested error counter.
>>>> +
>>>> +operations:
>>>> +  list:
>>>> +    -
>>>> +      name: list-nodes
>>>> +      doc: >-
>>>> +           Retrieve the full list of currently registered DRM RAS nodes.
>>>> +           Each node includes its dynamically assigned ID, name, and type.
>>>> +           **Important:** User space must call this operation first to obtain
>>>> +           the node IDs. These IDs are required for all subsequent
>>>> +           operations on nodes, such as querying error counters.
>>
>> I am curious about security implications of this design.
> 
> hmm... very good point you are raising here.
> 
> This current design relies entirely in the CAP_NET_ADMIN.
> No driver would have the flexibility to choose anything differently.
> Please notice that the flag admin-perm is hardcoded in this yaml file.
> 
>> If the complete
>> list of RAS nodes is visible for any process on the system (and one wants to
>> avoid requiring CAP_NET_ADMIN), there should be some way to enforce
>> permission checks when performing these operations if desired.
> 
> Right now, there's no way that the driver would choose not avoid requiring
> CAP_NET_ADMIN...
> 
> Only way would be the admin to give the cap_net_admin to the tool with:
> 
> $ sudo setcap cap_net_admin+ep /bin/drm_ras_tool
> 
> but not ideal and not granular anyway...
> 
>>
>> For example, this might be implemented in the driver's definition of
>> callback functions like query_error_counter; some drivers may want to ensure
>> that the process can in fact open the file descriptor corresponding to the
>> queried device before serving a netlink request. Is it enough for a driver
>> to simply return -EPERM in this case? Any driver that doesnt wish to protect
>> its RAS nodes need not implement checks in their callbacks.
> 
> Fair enough. If we want to give the option to the drivers, then we need:
> 
> 1. to first remove all the admin-perm flags below and leave the driver to
> pick up their policy on when to return something or -EPERM.
> 2. Document this security responsibility and list a few possibilities.
> 3. In our Xe case here I believe the easiest option is to use something like:
> 
> struct scm_creds *creds = NETLINK_CREDS(cb->skb);
> if (!gid_eq(creds->gid, GLOBAL_ROOT_GID))
>      return -EPERM

The driver currently does not have access to the callback or the 
skbuffer. Sending these details as param to driver won't be right as
drm_ras needs to handle all the netlink buffers.

How about using pre_doit & start calls? If driver has a pre callback , 
it's the responsibility of the driver to check permissions/any-pre 
conditions, else the CAP_NET_ADMIN permission will be checked.

@Zack / @Rodrigo thoughts?
@Zack Will this work for your usecase?

yaml
+	dump:
+        pre: drm-ras-nl-pre-list-nodes


drm_ras.c :

+       if (node->pre_list_nodes)
+                return node->pre_list_nodes(node);
+
+        return check_permissions(cb->skb);  //Checks creds

Thanks
Riana

> 
> or something like that?!
> 
> perhaps drivers could implement some form of cookie or pre-authorization with
> ioctls or sysfs, and then store in the priv?
> 
> Thoughts?
> Other options?
> 
>>
>> I dont see any such permissions checks in your driver implementation which
>> is understandable given that it may not be necessary for your use cases.
>> However, this would be a concern for our driver if we were to adopt this
>> interface.
> 
> yeap, this case was entirely with admin-perm, so not needed at all...
> But I see your point and this is really not giving any flexibility to
> other drivers.
> 
>>
>>>> +      attribute-set: node-attrs
>>>> +      flags: [admin-perm]
>>>> +      dump:
>>>> +        reply:
>>>> +          attributes:
>>>> +            - node-id
>>>> +            - device-name
>>>> +            - node-name
>>>> +            - node-type
>>>> +    -
>>>> +      name: get-error-counters
>>>> +      doc: >-
>>>> +           Retrieve the full list of error counters for a given node.
>>>> +           The response include the id, the name, and even the current
>>>> +           value of each counter.
>>>> +      attribute-set: error-counter-attrs
>>>> +      flags: [admin-perm]
>>>> +      dump:
>>>> +        request:
>>>> +          attributes:
>>>> +            - node-id
>>>> +        reply:
>>>> +          attributes:
>>>> +            - error-id
>>>> +            - error-name
>>>> +            - error-value
>>>> +    -
>>>> +      name: query-error-counter
>>>> +      doc: >-
>>>> +           Query the information of a specific error counter for a given node.
>>>> +           Users must provide the node ID and the error counter ID.
>>>> +           The response contains the id, the name, and the current value
>>>> +           of the counter.
>>>> +      attribute-set: error-counter-attrs
>>>> +      flags: [admin-perm]
>>>> +      do:
>>>> +        request:
>>>> +          attributes:
>>>> +            - node-id
>>>> +            - error-id
>>>> +        reply:
>>>> +          attributes:
>>>> +            - error-id
>>>> +            - error-name
>>>> +            - error-value
>>>> +
>>>> +kernel-family:
>>>> +  headers: ["drm/drm_ras_nl.h"]
>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>> index 7e6bc0b3a589..5cfb23b80441 100644
>>>> --- a/drivers/gpu/drm/Kconfig
>>>> +++ b/drivers/gpu/drm/Kconfig
>>>> @@ -130,6 +130,15 @@ config DRM_PANIC_SCREEN_QR_VERSION
>>>>    	  Smaller QR code are easier to read, but will contain less debugging
>>>>    	  data. Default is 40.
>>>> +config DRM_RAS
>>>> +	bool "DRM RAS support"
>>>> +	depends on DRM
>>>> +	help
>>>> +	  Enables the DRM RAS (Reliability, Availability and Serviceability)
>>>> +	  support for DRM drivers. This provides a Generic Netlink interface
>>>> +	  for error reporting and queries.
>>>> +	  If in doubt, say "N".
>>>> +
>>>>    config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>>>>            bool "Enable refcount backtrace history in the DP MST helpers"
>>>>    	depends on STACKTRACE_SUPPORT
>>>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>>>> index 4b3f3ad5058a..cd19573b2d9f 100644
>>>> --- a/drivers/gpu/drm/Makefile
>>>> +++ b/drivers/gpu/drm/Makefile
>>>> @@ -95,6 +95,7 @@ drm-$(CONFIG_DRM_ACCEL) += ../../accel/drm_accel.o
>>>>    drm-$(CONFIG_DRM_PANIC) += drm_panic.o
>>>>    drm-$(CONFIG_DRM_DRAW) += drm_draw.o
>>>>    drm-$(CONFIG_DRM_PANIC_SCREEN_QR_CODE) += drm_panic_qr.o
>>>> +drm-$(CONFIG_DRM_RAS) += drm_ras.o drm_ras_nl.o drm_ras_genl_family.o
>>>>    obj-$(CONFIG_DRM)	+= drm.o
>>>>    obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>>> index 2915118436ce..6b965c3d3307 100644
>>>> --- a/drivers/gpu/drm/drm_drv.c
>>>> +++ b/drivers/gpu/drm/drm_drv.c
>>>> @@ -53,6 +53,7 @@
>>>>    #include <drm/drm_panic.h>
>>>>    #include <drm/drm_print.h>
>>>>    #include <drm/drm_privacy_screen_machine.h>
>>>> +#include <drm/drm_ras_genl_family.h>
>>>>    #include "drm_crtc_internal.h"
>>>>    #include "drm_internal.h"
>>>> @@ -1223,6 +1224,7 @@ static const struct file_operations drm_stub_fops = {
>>>>    static void drm_core_exit(void)
>>>>    {
>>>> +	drm_ras_genl_family_unregister();
>>>>    	drm_privacy_screen_lookup_exit();
>>>>    	drm_panic_exit();
>>>>    	accel_core_exit();
>>>> @@ -1261,6 +1263,10 @@ static int __init drm_core_init(void)
>>>>    	drm_privacy_screen_lookup_init();
>>>> +	ret = drm_ras_genl_family_register();
>>>> +	if (ret < 0)
>>>> +		goto error;
>>>> +
>>>>    	drm_core_init_complete = true;
>>>>    	DRM_DEBUG("Initialized\n");
>>>> diff --git a/drivers/gpu/drm/drm_ras.c b/drivers/gpu/drm/drm_ras.c
>>>> new file mode 100644
>>>> index 000000000000..32f3897ce580
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/drm_ras.c
>>>> @@ -0,0 +1,351 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2025 Intel Corporation
>>>> + */
>>>> +
>>>> +#include <linux/module.h>
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/netdevice.h>
>>>> +#include <linux/xarray.h>
>>>> +#include <net/genetlink.h>
>>>> +
>>>> +#include <drm/drm_ras.h>
>>>> +
>>>> +/**
>>>> + * DOC: DRM RAS Node Management
>>>> + *
>>>> + * This module provides the infrastructure to manage RAS (Reliability,
>>>> + * Availability, and Serviceability) nodes for DRM drivers. Each
>>>> + * DRM driver may register one or more RAS nodes, which represent
>>>> + * logical components capable of reporting error counters and other
>>>> + * reliability metrics.
>>>> + *
>>>> + * The nodes are stored in a global xarray `drm_ras_xa` to allow
>>>> + * efficient lookup by ID. Nodes can be registered or unregistered
>>>> + * dynamically at runtime.
>>>> + *
>>>> + * A Generic Netlink family `drm_ras` exposes two main operations to
>>>> + * userspace:
>>
>> Nit: Three main operations.
> 
> ops, my bad, sorry
> 
>>
>>>> + *
>>>> + * 1. LIST_NODES: Dump all currently registered RAS nodes.
>>>> + *    The user receives an array of node IDs, names, and types.
>>>> + *
>>>> + * 2. GET_ERROR_COUNTERS: Dump all error counters of a given node.
>>>> + *    The user receives an array of error IDs, names, and current value.
>>>> + *
>>>> + * 3. QUERY_ERROR_COUNTER: Query a specific error counter for a given node.
>>>> + *    Userspace must provide the node ID and the counter ID, and
>>>> + *    receives the ID, the error name, and its current value.
>>>> + *
>>>> + * Node registration:
>>>> + * - drm_ras_node_register(): Registers a new node and assigns
>>>> + *   it a unique ID in the xarray.
>>>> + * - drm_ras_node_unregister(): Removes a previously registered
>>>> + *   node from the xarray.
>>>> + *
>>>> + * Node type:
>>>> + * - ERROR_COUNTER:
>>>> + *     + Currently, only error counters are supported.
>>>> + *     + The driver must implement the query_error_counter() callback to provide
>>>> + *       the name and the value of the error counter.
>>>> + *     + The driver must provide a error_counter_range.last value informing the
>>>> + *       last valid error ID.
>>>> + *     + The driver can provide a error_counter_range.first value informing the
>>>> + *       frst valid error ID.
>>>> + *     + The error counters in the driver doesn't need to be contiguous, but the
>>>> + *       driver must return -ENOENT to the query_error_counter as an indication
>>>> + *       that the ID should be skipped and not listed in the netlink API.
>>>> + *
>>>> + * Netlink handlers:
>>>> + * - drm_ras_nl_list_nodes_dumpit(): Implements the LIST_NODES
>>>> + *   operation, iterating over the xarray.
>>>> + * - drm_ras_nl_get_error_counters_dumpit(): Implements the GET_ERROR_COUNTERS
>>>> + *   operation, iterating over the know valid error_counter_range.
>>>> + * - drm_ras_nl_query_error_counter_doit(): Implements the QUERY_ERROR_COUNTER
>>>> + *   operation, fetching a counter value from a specific node.
>>>> + */
>>>> +
>>>> +static DEFINE_XARRAY_ALLOC(drm_ras_xa);
>>>> +
>>>> +/*
>>>> + * The netlink callback context carries dump state across multiple dumpit calls
>>>> + */
>>>> +struct drm_ras_ctx {
>>>> +	/* Which xarray id to restart the dump from */
>>>> +	unsigned long restart;
>>>> +};
>>>> +
>>>> +/**
>>>> + * drm_ras_nl_list_nodes_dumpit() - Dump all registered RAS nodes
>>>> + * @skb: Netlink message buffer
>>>> + * @cb: Callback context for multi-part dumps
>>>> + *
>>>> + * Iterates over all registered RAS nodes in the global xarray and appends
>>>> + * their attributes (ID, name, type) to the given netlink message buffer.
>>>> + * Uses @cb->ctx to track progress in case the message buffer fills up, allowing
>>>> + * multi-part dump support. On buffer overflow, updates the context to resume
>>>> + * from the last node on the next invocation.
>>>> + *
>>>> + * Return: 0 if all nodes fit in @skb, number of bytes added to @skb if
>>>> + *          the buffer filled up (requires multi-part continuation), or
>>>> + *          a negative error code on failure.
>>>> + */
>>>> +int drm_ras_nl_list_nodes_dumpit(struct sk_buff *skb,
>>>> +				 struct netlink_callback *cb)
>>>> +{
>>>> +	const struct genl_info *info = genl_info_dump(cb);
>>>> +	struct drm_ras_ctx *ctx = (void *)cb->ctx;
>>>> +	struct drm_ras_node *node;
>>>> +	struct nlattr *hdr;
>>>> +	unsigned long id;
>>>> +	int ret;
>>>> +
>>>> +	xa_for_each_start(&drm_ras_xa, id, node, ctx->restart) {
>>>> +		hdr = genlmsg_iput(skb, info);
>>>> +		if (!hdr) {
>>>> +			ret = -EMSGSIZE;
>>>> +			break;
>>>> +		}
>>>> +
>>>> +		ret = nla_put_u32(skb, DRM_RAS_A_NODE_ATTRS_NODE_ID, node->id);
>>>> +		if (ret) {
>>>> +			genlmsg_cancel(skb, hdr);
>>>> +			break;
>>>> +		}
>>>> +
>>>> +		ret = nla_put_string(skb, DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
>>>> +				     node->device_name);
>>>> +		if (ret) {
>>>> +			genlmsg_cancel(skb, hdr);
>>>> +			break;
>>>> +		}
>>>> +
>>>> +		ret = nla_put_string(skb, DRM_RAS_A_NODE_ATTRS_NODE_NAME,
>>>> +				     node->node_name);
>>>> +		if (ret) {
>>>> +			genlmsg_cancel(skb, hdr);
>>>> +			break;
>>>> +		}
>>>> +
>>>> +		ret = nla_put_u32(skb, DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
>>>> +				  node->type);
>>>> +		if (ret) {
>>>> +			genlmsg_cancel(skb, hdr);
>>>> +			break;
>>>> +		}
>>>> +
>>>> +		genlmsg_end(skb, hdr);
>>>> +	}
>>>> +
>>>> +	if (ret == -EMSGSIZE)
>>>> +		ctx->restart = id;
>>>
>>> Jakub had mentioned that we don't need this special handling
>>> of the -EMSGSIZE, but then I'm not sure what to use in the
>>> xa_for_each_start, so
>>>
>>> Cc: Jakub Kicinski <kuba@kernel.org>
>>>
>>> to ensure that we are in the right path here.
>>>
>>> Riana, thank you so much for picking up this and addressing all
>>> the comments. Patch looks good to me.
>>>
>>> Thanks,
>>> Rodrigo.
>>>
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int get_node_error_counter(u32 node_id, u32 error_id,
>>>> +				  const char **name, u32 *value)
>>>> +{
>>>> +	struct drm_ras_node *node;
>>>> +
>>>> +	node = xa_load(&drm_ras_xa, node_id);
>>>> +	if (!node || !node->query_error_counter)
>>>> +		return -ENOENT;
>>>> +
>>>> +	if (error_id < node->error_counter_range.first ||
>>>> +	    error_id > node->error_counter_range.last)
>>>> +		return -EINVAL;
>>>> +
>>>> +	return node->query_error_counter(node, error_id, name, value);
>>>> +}
>>
>> Regarding the permission check, node->query_error_counter could be
>> implemented to return -EPERM in this case by checking driver specified
>> fields in node->priv. Thoughts?
> 
> Yeap, please let me know your thoughts above on how drivers could check
> and then return here and let's come to a flexible but secure design.
> 
>>
>>>> +
>>>> +static int msg_reply_value(struct sk_buff *msg, u32 error_id,
>>>> +			   const char *error_name, u32 value)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	ret = nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID, error_id);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = nla_put_string(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
>>>> +			     error_name);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	return nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
>>>> +			   value);
>>>> +}
>>>> +
>>>> +static int doit_reply_value(struct genl_info *info, u32 node_id,
>>>> +			    u32 error_id)
>>>> +{
>>>> +	struct sk_buff *msg;
>>>> +	struct nlattr *hdr;
>>>> +	const char *error_name;
>>>> +	u32 value;
>>>> +	int ret;
>>>> +
>>>> +	msg = genlmsg_new(NLMSG_GOODSIZE, GFP_KERNEL);
>>>> +	if (!msg)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	hdr = genlmsg_iput(msg, info);
>>>> +	if (!hdr) {
>>>> +		nlmsg_free(msg);
>>>> +		return -EMSGSIZE;
>>>> +	}
>>>> +
>>>> +	ret = get_node_error_counter(node_id, error_id,
>>>> +				     &error_name, &value);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = msg_reply_value(msg, error_id, error_name, value);
>>>> +	if (ret) {
>>>> +		genlmsg_cancel(msg, hdr);
>>>> +		nlmsg_free(msg);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	genlmsg_end(msg, hdr);
>>>> +
>>>> +	return genlmsg_reply(msg, info);
>>>> +}
>>>> +
>>>> +/**
>>>> + * drm_ras_nl_get_error_counters_dumpit() - Dump all Error Counters
>>>> + * @skb: Netlink message buffer
>>>> + * @cb: Callback context for multi-part dumps
>>>> + *
>>>> + * Iterates over all error counters in a given Node and appends
>>>> + * their attributes (ID, name, value) to the given netlink message buffer.
>>>> + * Uses @cb->ctx to track progress in case the message buffer fills up, allowing
>>>> + * multi-part dump support. On buffer overflow, updates the context to resume
>>>> + * from the last node on the next invocation.
>>>> + *
>>>> + * Return: 0 if all errors fit in @skb, number of bytes added to @skb if
>>>> + *          the buffer filled up (requires multi-part continuation), or
>>>> + *          a negative error code on failure.
>>>> + */
>>>> +int drm_ras_nl_get_error_counters_dumpit(struct sk_buff *skb,
>>>> +					 struct netlink_callback *cb)
>>>> +{
>>>> +	const struct genl_info *info = genl_info_dump(cb);
>>>> +	struct drm_ras_ctx *ctx = (void *)cb->ctx;
>>>> +	struct drm_ras_node *node;
>>>> +	struct nlattr *hdr;
>>>> +	const char *error_name;
>>>> +	u32 node_id, error_id, value;
>>>> +	int ret;
>>>> +
>>>> +	if (!info->attrs || !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID])
>>>> +		return -EINVAL;
>>>> +
>>>> +	node_id = nla_get_u32(info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID]);
>>>> +
>>>> +	node = xa_load(&drm_ras_xa, node_id);
>>>> +	if (!node)
>>>> +		return -ENOENT;
>>>> +
>>>> +	for (error_id = max(node->error_counter_range.first, ctx->restart);
>>>> +	     error_id <= node->error_counter_range.last;
>>>> +	     error_id++) {
>>>> +		ret = get_node_error_counter(node_id, error_id,
>>>> +					     &error_name, &value);
>>>> +		/*
>>>> +		 * For non-contiguous range, driver return -ENOENT as indication
>>>> +		 * to skip this ID when listing all errors.
>>>> +		 */
>>>> +		if (ret == -ENOENT)
>>>> +			continue;
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		hdr = genlmsg_iput(skb, info);
>>>> +
>>>> +		if (!hdr) {
>>>> +			ret = -EMSGSIZE;
>>>> +			break;
>>>> +		}
>>>> +
>>>> +		ret = msg_reply_value(skb, error_id, error_name, value);
>>>> +		if (ret) {
>>>> +			genlmsg_cancel(skb, hdr);
>>>> +			break;
>>>> +		}
>>>> +
>>>> +		genlmsg_end(skb, hdr);
>>>> +	}
>>>> +
>>>> +	if (ret == -EMSGSIZE)
>>>> +		ctx->restart = error_id;
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +/**
>>>> + * drm_ras_nl_query_error_counter_doit() - Query an error counter of an node
>>>> + * @skb: Netlink message buffer
>>>> + * @info: Generic Netlink info containing attributes of the request
>>>> + *
>>>> + * Extracts the node ID and error ID from the netlink attributes and
>>>> + * retrieves the current value of the corresponding error counter. Sends the
>>>> + * result back to the requesting user via the standard Genl reply.
>>>> + *
>>>> + * Return: 0 on success, or negative errno on failure.
>>>> + */
>>>> +int drm_ras_nl_query_error_counter_doit(struct sk_buff *skb,
>>>> +					struct genl_info *info)
>>>> +{
>>>> +	u32 node_id, error_id;
>>>> +
>>>> +	if (!info->attrs ||
>>>> +	    !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] ||
>>>> +	    !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID])
>>>> +		return -EINVAL;
>>>> +
>>>> +	node_id = nla_get_u32(info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID]);
>>>> +	error_id = nla_get_u32(info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID]);
>>>> +
>>>> +	return doit_reply_value(info, node_id, error_id);
>>>> +}
>>>> +
>>>> +/**
>>>> + * drm_ras_node_register() - Register a new RAS node
>>>> + * @node: Node structure to register
>>>> + *
>>>> + * Adds the given RAS node to the global node xarray and assigns it
>>>> + * a unique ID. Both @node->name and @node->type must be valid.
>>>> + *
>>>> + * Return: 0 on success, or negative errno on failure:
>>>> + */
>>>> +int drm_ras_node_register(struct drm_ras_node *node)
>>>> +{
>>>> +	if (!node->device_name || !node->node_name)
>>>> +		return -EINVAL;
>>>> +
>>>> +	/* Currently, only Error Counter Endpoinnts are supported */
>>>> +	if (node->type != DRM_RAS_NODE_TYPE_ERROR_COUNTER)
>>>> +		return -EINVAL;
>>>> +
>>>> +	/* Mandatorty entries for Error Counter Node */
>>>> +	if (node->type == DRM_RAS_NODE_TYPE_ERROR_COUNTER &&
>>>> +	    (!node->error_counter_range.last || !node->query_error_counter))
>>>> +		return -EINVAL;
>>>> +
>>>> +	return xa_alloc(&drm_ras_xa, &node->id, node, xa_limit_32b, GFP_KERNEL);
>>>> +}
>>>> +EXPORT_SYMBOL(drm_ras_node_register);
>>>> +
>>>> +/**
>>>> + * drm_ras_node_unregister() - Unregister a previously registered node
>>>> + * @node: Node structure to unregister
>>>> + *
>>>> + * Removes the given node from the global node xarray using its ID.
>>>> + */
>>>> +void drm_ras_node_unregister(struct drm_ras_node *node)
>>>> +{
>>>> +	xa_erase(&drm_ras_xa, node->id);
>>>> +}
>>>> +EXPORT_SYMBOL(drm_ras_node_unregister);
>>>> diff --git a/drivers/gpu/drm/drm_ras_genl_family.c b/drivers/gpu/drm/drm_ras_genl_family.c
>>>> new file mode 100644
>>>> index 000000000000..2d818b8c3808
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/drm_ras_genl_family.c
>>>> @@ -0,0 +1,42 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2025 Intel Corporation
>>>> + */
>>>> +
>>>> +#include <drm/drm_ras_genl_family.h>
>>>> +#include <drm/drm_ras_nl.h>
>>>> +
>>>> +/* Track family registration so the drm_exit can be called at any time */
>>>> +static bool registered;
>>>> +
>>>> +/**
>>>> + * drm_ras_genl_family_register() - Register drm-ras genl family
>>>> + *
>>>> + * Only to be called one at drm_drv_init()
>>>> + */
>>>> +int drm_ras_genl_family_register(void)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	registered = false;
>>>> +
>>>> +	ret = genl_register_family(&drm_ras_nl_family);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	registered = true;
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +/**
>>>> + * drm_ras_genl_family_unregister() - Unregister drm-ras genl family
>>>> + *
>>>> + * To be called one at drm_drv_exit() at any moment, but only once.
>>>> + */
>>>> +void drm_ras_genl_family_unregister(void)
>>>> +{
>>>> +	if (registered) {
>>>> +		genl_unregister_family(&drm_ras_nl_family);
>>>> +		registered = false;
>>>> +	}
>>>> +}
>>>> diff --git a/drivers/gpu/drm/drm_ras_nl.c b/drivers/gpu/drm/drm_ras_nl.c
>>>> new file mode 100644
>>>> index 000000000000..fcd1392410e4
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/drm_ras_nl.c
>>>> @@ -0,0 +1,54 @@
>>>> +// SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>>>> +/* Do not edit directly, auto-generated from: */
>>>> +/*	Documentation/netlink/specs/drm_ras.yaml */
>>>> +/* YNL-GEN kernel source */
>>>> +
>>>> +#include <net/netlink.h>
>>>> +#include <net/genetlink.h>
>>>> +
>>>> +#include <uapi/drm/drm_ras.h>
>>>> +#include <drm/drm_ras_nl.h>
>>>> +
>>>> +/* DRM_RAS_CMD_GET_ERROR_COUNTERS - dump */
>>>> +static const struct nla_policy drm_ras_get_error_counters_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID + 1] = {
>>>> +	[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] = { .type = NLA_U32, },
>>>> +};
>>>> +
>>>> +/* DRM_RAS_CMD_QUERY_ERROR_COUNTER - do */
>>>> +static const struct nla_policy drm_ras_query_error_counter_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID + 1] = {
>>>> +	[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] = { .type = NLA_U32, },
>>>> +	[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID] = { .type = NLA_U32, },
>>>> +};
>>>> +
>>>> +/* Ops table for drm_ras */
>>>> +static const struct genl_split_ops drm_ras_nl_ops[] = {
>>>> +	{
>>>> +		.cmd	= DRM_RAS_CMD_LIST_NODES,
>>>> +		.dumpit	= drm_ras_nl_list_nodes_dumpit,
>>>> +		.flags	= GENL_ADMIN_PERM | GENL_CMD_CAP_DUMP,
>>>> +	},
>>>> +	{
>>>> +		.cmd		= DRM_RAS_CMD_GET_ERROR_COUNTERS,
>>>> +		.dumpit		= drm_ras_nl_get_error_counters_dumpit,
>>>> +		.policy		= drm_ras_get_error_counters_nl_policy,
>>>> +		.maxattr	= DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
>>>> +		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DUMP,
>>>> +	},
>>>> +	{
>>>> +		.cmd		= DRM_RAS_CMD_QUERY_ERROR_COUNTER,
>>>> +		.doit		= drm_ras_nl_query_error_counter_doit,
>>>> +		.policy		= drm_ras_query_error_counter_nl_policy,
>>>> +		.maxattr	= DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
>>>> +		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
>>>> +	},
>>>> +};
>>>> +
>>>> +struct genl_family drm_ras_nl_family __ro_after_init = {
>>>> +	.name		= DRM_RAS_FAMILY_NAME,
>>>> +	.version	= DRM_RAS_FAMILY_VERSION,
>>>> +	.netnsok	= true,
>>>> +	.parallel_ops	= true,
>>>> +	.module		= THIS_MODULE,
>>>> +	.split_ops	= drm_ras_nl_ops,
>>>> +	.n_split_ops	= ARRAY_SIZE(drm_ras_nl_ops),
>>>> +};
>>>> diff --git a/include/drm/drm_ras.h b/include/drm/drm_ras.h
>>>> new file mode 100644
>>>> index 000000000000..bba47a282ef8
>>>> --- /dev/null
>>>> +++ b/include/drm/drm_ras.h
>>>> @@ -0,0 +1,76 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2025 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef __DRM_RAS_H__
>>>> +#define __DRM_RAS_H__
>>>> +
>>>> +#include "drm_ras_nl.h"
>>>> +
>>>> +/**
>>>> + * struct drm_ras_node - A DRM RAS Node
>>>> + */
>>>> +struct drm_ras_node {
>>>> +	/** @id: Unique identifier for the node. Dynamically assigned. */
>>>> +	u32 id;
>>>> +	/**
>>>> +	 * @device_name: Human-readable name of the device. Given by the driver.
>>>> +	 */
>>>> +	const char *device_name;
>>>> +	/** @node_name: Human-readable name of the node. Given by the driver. */
>>>> +	const char *node_name;
>>>> +	/** @type: Type of the node (enum drm_ras_node_type). */
>>>> +	enum drm_ras_node_type type;
>>>> +
>>>> +	/* Error-Counter Related Callback and Variables */
>>>> +
>>>> +	/** @error_counter_range: Range of valid Error IDs for this node. */
>>>> +	struct {
>>>> +		/** @first: First valid Error ID. */
>>>> +		u32 first;
>>>> +		/** @last: Last valid Error ID. Mandatory entry. */
>>>> +		u32 last;
>>>> +	} error_counter_range;
>>>> +
>>>> +	/**
>>>> +	 * @query_error_counter:
>>>> +	 *
>>>> +	 * This callback is used by drm-ras to query a specific error counter.
>>>> +	 * counters supported by this node. Used for input check and to
>>>> +	 * iterate in all counters.
>>>> +	 *
>>>> +	 * Driver should expect query_error_counters() to be called with
>>>> +	 * error_id from `error_counter_range.first` to
>>>> +	 * `error_counter_range.last`.
>>>> +	 *
>>>> +	 * The @query_error_counter is a mandatory callback for
>>>> +	 * error_counter_node.
>>>> +	 *
>>>> +	 * Returns: 0 on success,
>>>> +	 *          -ENOENT when error_id is not supported as an indication that
>>>> +	 *                  drm_ras should silently skip this entry. Used for
>>>> +	 *                  supporting non-contiguous error ranges.
>>>> +	 *                  Driver is responsible for maintaining the list of
>>>> +	 *                  supported error IDs in the range of first to last.
>>>> +	 *          Other negative values on errors that should terminate the
>>>> +	 *          netlink query.
>>>> +	 */
>>>> +	int (*query_error_counter)(struct drm_ras_node *ep, u32 error_id,
>>>> +				   const char **name, u32 *val);
>>>> +
>>>> +	/** @priv: Driver private data */
>>>> +	void *priv;
>>>> +};
>>>> +
>>
>> If new node types are frequently added, this struct may contain many
>> unused fields. It seems like the necessary members for any given node
>> type are: id, device_name, node_name, type, and priv. However, since
>> this functionality is designed specifically for RAS, I think its ok.
> 
> Yeap, that was the thought.
> 
> Thank you so much for the review and thoughts here,
> Rodrigo.
> 
>>
>>>> +struct drm_device;
>>>> +
>>>> +#if IS_ENABLED(CONFIG_DRM_RAS)
>>>> +int drm_ras_node_register(struct drm_ras_node *ep);
>>>> +void drm_ras_node_unregister(struct drm_ras_node *ep);
>>>> +#else
>>>> +static inline int drm_ras_node_register(struct drm_ras_node *ep) { return 0; }
>>>> +static inline void drm_ras_node_unregister(struct drm_ras_node *ep) { }
>>>> +#endif
>>>> +
>>>> +#endif
>>>> diff --git a/include/drm/drm_ras_genl_family.h b/include/drm/drm_ras_genl_family.h
>>>> new file mode 100644
>>>> index 000000000000..5931b53429f1
>>>> --- /dev/null
>>>> +++ b/include/drm/drm_ras_genl_family.h
>>>> @@ -0,0 +1,17 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2025 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef __DRM_RAS_GENL_FAMILY_H__
>>>> +#define __DRM_RAS_GENL_FAMILY_H__
>>>> +
>>>> +#if IS_ENABLED(CONFIG_DRM_RAS)
>>>> +int drm_ras_genl_family_register(void);
>>>> +void drm_ras_genl_family_unregister(void);
>>>> +#else
>>>> +static inline int drm_ras_genl_family_register(void) { return 0; }
>>>> +static inline void drm_ras_genl_family_unregister(void) { }
>>>> +#endif
>>>> +
>>>> +#endif
>>>> diff --git a/include/drm/drm_ras_nl.h b/include/drm/drm_ras_nl.h
>>>> new file mode 100644
>>>> index 000000000000..9613b7d9ffdb
>>>> --- /dev/null
>>>> +++ b/include/drm/drm_ras_nl.h
>>>> @@ -0,0 +1,24 @@
>>>> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
>>>> +/* Do not edit directly, auto-generated from: */
>>>> +/*	Documentation/netlink/specs/drm_ras.yaml */
>>>> +/* YNL-GEN kernel header */
>>>> +
>>>> +#ifndef _LINUX_DRM_RAS_GEN_H
>>>> +#define _LINUX_DRM_RAS_GEN_H
>>>> +
>>>> +#include <net/netlink.h>
>>>> +#include <net/genetlink.h>
>>>> +
>>>> +#include <uapi/drm/drm_ras.h>
>>>> +#include <drm/drm_ras_nl.h>
>>>> +
>>>> +int drm_ras_nl_list_nodes_dumpit(struct sk_buff *skb,
>>>> +				 struct netlink_callback *cb);
>>>> +int drm_ras_nl_get_error_counters_dumpit(struct sk_buff *skb,
>>>> +					 struct netlink_callback *cb);
>>>> +int drm_ras_nl_query_error_counter_doit(struct sk_buff *skb,
>>>> +					struct genl_info *info);
>>>> +
>>>> +extern struct genl_family drm_ras_nl_family;
>>>> +
>>>> +#endif /* _LINUX_DRM_RAS_GEN_H */
>>>> diff --git a/include/uapi/drm/drm_ras.h b/include/uapi/drm/drm_ras.h
>>>> new file mode 100644
>>>> index 000000000000..3415ba345ac8
>>>> --- /dev/null
>>>> +++ b/include/uapi/drm/drm_ras.h
>>>> @@ -0,0 +1,49 @@
>>>> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
>>>> +/* Do not edit directly, auto-generated from: */
>>>> +/*	Documentation/netlink/specs/drm_ras.yaml */
>>>> +/* YNL-GEN uapi header */
>>>> +
>>>> +#ifndef _UAPI_LINUX_DRM_RAS_H
>>>> +#define _UAPI_LINUX_DRM_RAS_H
>>>> +
>>>> +#define DRM_RAS_FAMILY_NAME	"drm-ras"
>>>> +#define DRM_RAS_FAMILY_VERSION	1
>>>> +
>>>> +/*
>>>> + * Type of the node. Currently, only error-counter nodes are supported, which
>>>> + * expose reliability counters for a hardware/software component.
>>>> + */
>>>> +enum drm_ras_node_type {
>>>> +	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
>>>> +};
>>>> +
>>>> +enum {
>>>> +	DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
>>>> +	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
>>>> +	DRM_RAS_A_NODE_ATTRS_NODE_NAME,
>>>> +	DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
>>>> +
>>>> +	__DRM_RAS_A_NODE_ATTRS_MAX,
>>>> +	DRM_RAS_A_NODE_ATTRS_MAX = (__DRM_RAS_A_NODE_ATTRS_MAX - 1)
>>>> +};
>>>> +
>>>> +enum {
>>>> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID = 1,
>>>> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
>>>> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
>>>> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
>>>> +
>>>> +	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
>>>> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
>>>> +};
>>>> +
>>>> +enum {
>>>> +	DRM_RAS_CMD_LIST_NODES = 1,
>>>> +	DRM_RAS_CMD_GET_ERROR_COUNTERS,
>>>> +	DRM_RAS_CMD_QUERY_ERROR_COUNTER,
>>>> +
>>>> +	__DRM_RAS_CMD_MAX,
>>>> +	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
>>>> +};
>>>> +
>>>> +#endif /* _UAPI_LINUX_DRM_RAS_H */
>>>> -- 
>>>> 2.47.1
>>>>
>>
>> Thanks,
>>
>> Zack
>>

