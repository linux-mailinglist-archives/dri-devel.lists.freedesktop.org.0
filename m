Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4D0ACEE84
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 13:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996EA10EA03;
	Thu,  5 Jun 2025 11:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ceV/t+l0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3A710E9FF;
 Thu,  5 Jun 2025 11:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749122719; x=1780658719;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dozI7/mzzMfihOgs9KUp2LOm24Ys+VRBac4HW6FmTYQ=;
 b=ceV/t+l0d080xrTjXJKJmyni9EZAVy8yoNFSrq9u6sbuOKWsVDhaMQc1
 8fY9zizMw5vqvO/OA1e6yTpp5bSthhwvV5dDzZHfcPIDcyrjhSbjE4wU2
 T9JSc56fG5VFdV8NeK7ubC9b5Kzl3ZajdSvJID3hxrAWSWaZXlATlGNfR
 f77YkjYbzwfWS0gtHmMcLx/upDi1midZogqjpI9k4ji3pDv8jo3aA17mm
 Li8b1UrC/IxL083rpOMMhziXCobN7PYMVWsgWcvirxpf8BwKOAm3w3o/U
 Ly0bLSewHI2d46UsrQsFiuEWY1vNh3LPN9o/6kvn+vLMpfAyb6RsIZ5xv g==;
X-CSE-ConnectionGUID: SaZ0hQl9QPWjy03CbSD5jw==
X-CSE-MsgGUID: fUMtEEitQOKFXRDkMfuQEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51107448"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="51107448"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 04:25:17 -0700
X-CSE-ConnectionGUID: m1g3oQ5GTui73hyCRVYt8A==
X-CSE-MsgGUID: 2Jd3oN+qSISpUIO1hkp6mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="150635907"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 04:25:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 04:25:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 04:25:16 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.59)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 04:25:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6OuEuZ5geKApzxBDXDFmsG8pXOgk6zyNcUyPxHNj23+LCn+xPCy7Pd+vfuVplZwBveE97qqFAZ7YtzCfHKLTvYXAX+GiIBWKM1ErmOGY58MxMzPs2uOxK1hay7Q5ZUlE4NMmJl7BkqxcMjXAq1KSDq9PB1YcF0BxUEDFO9EHg1FSdpnYg4IoeD4UwilCYPJjWQEWWZDbVzERySCf9OMDr0LCRubDHBxo7JtissNkECnSWmSpkyLERfLRRranOAz579csC4O2YeVf6CzU5q5mSINU4Clpvd9dSJORG6c7k1Br/Gw7+bhOI/nOzJPtE4/jFrl4stkwuTSBzTvzBLSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toI3yx1tnzZtbNJFytEKyvSgmP700YUGcTfAEMpl/ZU=;
 b=loWvw2awjSf0Vp2oWtCDVO0ngJGhC41mUQcgS67WbkwKnBiBHFQ5LpWet4TNiWDeLFEjDBWmXzmMX55pyFTmlqNdyiyTjfRffJFRzdJyg28RwWm4dbBtuUA7ivuEMJ9CQnAlt9g/Q+pqSjeKuo0atSxoY7Pm6DX4+oGnF1XFZuSMwIL4h6QEgWHO0HA1GCIbdLR+kq/yKp/OC9I4s4fCJsFeoKGcsNzUYlUijJwmmKdyraViW+yEirX2vaHCfXk7DlW4lYbtcOfGo1Zi8CQ/3wH3OpMfSJcmG8tvh1x0TBBJm2TZGYlJmHFYkZ6+sv7al+lV5MRxpNjG38z4kXPrPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM3PPF1FCD3EAF0.namprd11.prod.outlook.com (2603:10b6:f:fc00::f12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Thu, 5 Jun
 2025 11:24:33 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 11:24:32 +0000
Message-ID: <062a11d5-ada1-47e7-ad33-46c4b48da439@intel.com>
Date: Thu, 5 Jun 2025 16:54:24 +0530
User-Agent: Mozilla Thunderbird
From: Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH 1/4] drm: Add a firmware flash method to device wedged
 uevent
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <frank.scarbrough@intel.com>,
 <andrealmeid@igalia.com>, <christian.koenig@amd.com>
References: <20250603081409.1509709-1-riana.tauro@intel.com>
 <20250603081409.1509709-2-riana.tauro@intel.com>
 <aEAjaGK9BYK89U3Z@black.fi.intel.com>
Content-Language: en-US
In-Reply-To: <aEAjaGK9BYK89U3Z@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::34) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM3PPF1FCD3EAF0:EE_
X-MS-Office365-Filtering-Correlation-Id: 272258b9-ef24-4670-7eb1-08dda4238b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2V1TGxGRzhIR3JJNjJ1a2FmNjFSQi9MOEY4TGwyZG93T0tVRXRQRU0wZjcz?=
 =?utf-8?B?MlhPYWM2MXRrNzhoSEtEbVp6YjJsR2ZQOXI5d0lNU3VEMzhmRk8vQjQ3MGVO?=
 =?utf-8?B?Tnptd1FZdHBIckwzMFkxUDYxZ1JhNzFsTEpmejFoSEhUMi9vUG40Wm1yUmNS?=
 =?utf-8?B?NGJHRUZGT2drUmkxQVFIRGtadUJzQVdFMWFva1U1ZVhNcnM5VHYvZDhKRjRP?=
 =?utf-8?B?NURLbWl4VkY1S2RGL2ZUazdiNW82Q00yQlk1SG1ZemhJc1A5NzhEbFZqSlYr?=
 =?utf-8?B?NGlXSmRmWTVCZ05xeTVyaEJhM3M3L1pnYWxTblBWYzN0aXM4Y3JwckNUd2d1?=
 =?utf-8?B?ek1sNFRxK2tmMXl0TVc1RDZPdXBVRmcvVkppNndUelpMd0NBdUN5WHVLWVJD?=
 =?utf-8?B?Ky8rQ0FKSjdVMGdGSW5SWWgwQVpMWjZ2cmNoNUlnUzc5MlRPRlE0Tm5JYVFP?=
 =?utf-8?B?SHFNRXJYcXphbmZzUFY4a0t3ckQybGUwK3ZEem1hZUQwL3BWYUxoYzE3VEgv?=
 =?utf-8?B?dXBzY0t5TjBzWXdicG4rQjdmYlkrdTdxQTN2aU1hd0NxSEpNZzNhQ09STWx4?=
 =?utf-8?B?UkQ2ak41LzVJU3VYRmV6aGdseXptQnA2MlFxeE9BUnI1aVZicE55VnlEL1d5?=
 =?utf-8?B?Zk9QQzQ5d25TQVpFMGxMNVJBMVZPa2VJZUtpd3F2bFhvT0NheGl0dWZDTDc0?=
 =?utf-8?B?QThMR3g5eDNhNDJaa3VWQUNrRmxsTVR0dkZ5S3czWFdBa0JpZUlRUDZFczl4?=
 =?utf-8?B?eC9veldWYWZReC9NVkdBNUVSZk5hZTc2YmFlOXhza3RsVW4xY05zWEhvbUFP?=
 =?utf-8?B?Q0M0S3h1a09qN1puNkFGMURFTzFEQ01kZzNZa25TdVNVV3RpdWJYU3FEUWRW?=
 =?utf-8?B?dFhnTitydi9ZM295ZlJEMytnYlFVQ1ZPNTVMSEJiK3dBbjAvNmRVWHhTbm5r?=
 =?utf-8?B?aU90eWhXemp4SVZaLzZVLzJueFBhRzA2NDNJOWF0OUVnWW14ZDBBc0VZS2kx?=
 =?utf-8?B?ZTdmQmNKSmF4RGJOZkhyRUFTQmZOdndLNG9RWitnQ3NmcXJFUUFiaEZiN2Rw?=
 =?utf-8?B?ZzJvRDFqVDBGMG9jdkVjZnJ4RWd6UVV3eVVZbm1tNkk1YUIzUGk0YkxUV3VT?=
 =?utf-8?B?STZJa2lWTzViYm1NQ0hiclNoSTJleURqYXZYbXh1enVpTmpxL3lIdW9JUU1H?=
 =?utf-8?B?VFlkWEZ0K0JJZE5odWh1MlNOb0tiUGhwOUc0MklZZWJJOWc4UTNkRHNwME9u?=
 =?utf-8?B?TWREU2thSXRoZjFtL205MVRoV0NkTm5jdTZQckVFbUlmaGVrYTQ4U0k2R3M5?=
 =?utf-8?B?bHl6eitET2ZYOFZzY0VienVraGRYeVlSRWk1ZnNyTUdCODJOZDZLTVdTd3ZQ?=
 =?utf-8?B?YzMrcXAzOG0zM1JFazdrYU5UNDBmSjJEVktHMy9ocU5mT2RDOHkxNTljSWNH?=
 =?utf-8?B?RWoxcnFFQWt3N3k0eXF4R3VpMTZ0V2MzUFlwMm1FZ29nWnp2OWxCT3ZPcVU0?=
 =?utf-8?B?cTlLdVRsK29hek5ZSzlrVFk0dWhTUklDeVorejdTcGRMRnV6S1lBWGViZTlP?=
 =?utf-8?B?dFhlOXlRcjdLSCt5UEtycVI3WkJBb1JLZkpHdVlyMVQ3dklOcWZsQkx2UHow?=
 =?utf-8?B?a2ZPdjZ2UVNZajZ4SlkwbjJueWFBWGExbnowak40TW9jSy9pZXgrMkxzNjFq?=
 =?utf-8?B?c29HdmQ0eE9PaWdFZXF2QnFMeGJHbU90VGNLUk1nZm9MbUFqYmJ0QytsaTg4?=
 =?utf-8?B?ck9uNXVxRXhxUVpCT2laRnFnR2xIeDhuMEhwQ0dqcHV1TXFIQ1RIUnZsdXJX?=
 =?utf-8?B?dGIxTWY5ZlVWL01jRDlnOXJGZUxKV284cXMySzVGbnYzSjViNndadFJsOXBu?=
 =?utf-8?B?dXhka0VVMEpJb2Z6UFRJU2Z2NFRtQTMycGhCK2xmMFNYZGtWeVJGbkZSMlJ3?=
 =?utf-8?Q?uPVoosg8RCg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVFKWExoYWQvbm9GSEVOenBCemgzVlJUN0xoN2MyNkYyNDBGcjNvQ1gxTXlQ?=
 =?utf-8?B?TjlEU2xROEszaGF5eUZPcm5SbENKWDlsSVNqYVdvNGowcnBsWXVXUDM5U2JC?=
 =?utf-8?B?RTd0ZnZlR2laL2RzcHcyaGR4SkphdktCRVNTTHBvSTRqWWVIMVd6WjlrL2Jh?=
 =?utf-8?B?QnNoQUlSUTMwZEgxbHpSRTFZcEdWU3hEUHJzQ3JsT20yRXBzL2M1QVVZdW1w?=
 =?utf-8?B?Q3krMlNpaDRFOVZJcjVlbzlvZk1oTGFpRjFHM2ord09lL3lIQ0F6alJYeFp6?=
 =?utf-8?B?YUo5R2dwSFFmUUlhWEdDd0k2bGcvdHRLYW5uMGE2enRzVDdPdENKSnNyZzRP?=
 =?utf-8?B?T3V0TjhDVVBuRXN2aW13VXFGMVdOL0pPU2N0UkJBWWEvSkFLVzdMSTFkWWZx?=
 =?utf-8?B?a3hlVXI2QzdyM0lqS08wcVBhK3plWTRsQnd4aCtzNWNmZnhURDZ2RUQ4OE9q?=
 =?utf-8?B?UlVuMDRxOGRYeGJjb0VQWWJQVTJmejVWS2M0cVhIdC93T1FydVZja2hGNmZN?=
 =?utf-8?B?VUFGeFBrOU5Sa2srZFlvOVFicjhzNEtGMHFFenR4Tkdud3U4YlhzQWV2ODZM?=
 =?utf-8?B?L1hFUXRoWVo2eDlaZHdobjltcDFMNXM4K21BTnloN1BnN2JFS2dHWnBmV2xC?=
 =?utf-8?B?MEMwUHdOQVdLSnBnWngyallYenR4YVlZbHVWa0RCQkJvV2VWZVpZUlBzbUVS?=
 =?utf-8?B?ZTE2SEN1ZEFFdjFOQnVWUFJ4UGY0dzJ2bFlTZ05aaysraXp4L1pVVXByL1NN?=
 =?utf-8?B?ZDI1NFkyblVsYkoydzl5VjJSRDFadGc3WnFtbTdvN3Q3ZS9wSG9JTkdsN3Q1?=
 =?utf-8?B?MUV6Zk42bmMwa21SMmV3dlBoYzJjdE9LQURIK0djcS9uRjlkWHNDd0JudU1p?=
 =?utf-8?B?QXRlbUlsVmwwcVVjakJ0Q3FTb3p6dUtoLzhFV1d6d0pHWXd0NzZ4d1RLTG03?=
 =?utf-8?B?TEQvSWsxdHF4M1FSRWFQb3pzcEVHYklMVWtjTy81YjdUaGcrOFROTVZ5ZVNq?=
 =?utf-8?B?ekNmdE5GM3d2SnFLUWo1cHFuTC9yT1c0ZVFTYlJYckpuMVliOE83UVVoSU9u?=
 =?utf-8?B?ay9Cb3ZMTVpFYzZlWUpxMkJRZmNGQ3Y5ZzBrNjZRd21FRi9IMzM4YnJ4bWVl?=
 =?utf-8?B?YU1DcXZlUStBdnlPSS9IK3ZROW14NE9MVHV0UzZTZkNDRVdBR2ZOZVAxU2Vs?=
 =?utf-8?B?YTE0L2tsOWhwOVNFNGxvMDJ6U3BLak56RTVVVW9iakNkMHpZcjAyblp2Q1Jo?=
 =?utf-8?B?bVpEbVJmelFhaGs2U09QZjg4cTY4MU8zdUF4NVlEZ3JMVmxwWXE5OUZMczNu?=
 =?utf-8?B?dkd5T0tLblEvQlJrdDFvc21paHREY3lwUUFBOU9CU2RBaGVPc0JnUU9YaFA2?=
 =?utf-8?B?aVRObVdQREYwcVZDeURQSHdGd1lTK01LNEF2ak9sd1ZYNkVwdzY1TG01NmRP?=
 =?utf-8?B?UzU1YzdPZGxjSlJSeStPOS9zSDYrS1Boak1oRllkaFJScWQ5clFtLzZCQ0Z5?=
 =?utf-8?B?VFM5WkdBOGlGK3ErK3d5TFNBYlIxMVdsTXNYZEJ1RUMvOTBxUTJvS3JuYi9r?=
 =?utf-8?B?emVrZnF5VmFvU1ZkOUo1Wm9mRDJRdHZicFB0eWM5RkJnS0lZc2JjTWxGVmc4?=
 =?utf-8?B?N1RNMTVYMFg4eEhaUnFpSkdzRXNWN1Z0UHZ1dXduVldZRlVqOFpmWU5kbGk2?=
 =?utf-8?B?WFI2SUJhdHhhb3NLQTZyMTlQblhPMlNET1RSQnVibEplTEJEeVpuOTFRbWsy?=
 =?utf-8?B?YmQwYjAycDlGWXA1aUd2UmNERlIrM1hqOUFudW54Qnp4YjBsbC9oazlkV0hN?=
 =?utf-8?B?MEJpSUNKaFl3UjRhZ0xZRmY3eWFmT1NQY0hsSmdlZ2Q4TE8rbVUrdXZhZXpn?=
 =?utf-8?B?Vno1VWNDMThNVHdoY2NoakNUUElWLzNNTlliSjI0K1NXcHlXQ09mTWZaNWRJ?=
 =?utf-8?B?WlkwUUJDUEsyaUtvQWNtZk9naER0UEZLSmJKcyt4aEp6SUp4WnJnT21ra2w0?=
 =?utf-8?B?QVkrdWZleWxORWpDN2lnZFhUU3lXcURuQURaZlliUnhxZGpON3JqRjlsbHBI?=
 =?utf-8?B?dDJ2Z0dXNFBZSUlCLzdLUmFmaFBFM01ka3FWVStGTE05K3ZLTkxYQ3RENklj?=
 =?utf-8?Q?+xN6jgSozknfInZBDkFORrQOK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 272258b9-ef24-4670-7eb1-08dda4238b65
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 11:24:32.7862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVM6oAuZVpNYV71C6gjcbt2yb8zqNm+gdNr9xdBk2SEok9lgtRxap6cIGqO4DS80PQ4pswF794MgYjJqImBcHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1FCD3EAF0
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


Hi Raag

On 6/4/2025 4:13 PM, Raag Jadav wrote:
> On Tue, Jun 03, 2025 at 01:43:57PM +0530, Riana Tauro wrote:
>> A device is declared wedged when it is non-recoverable from
>> the driver context. Some firmware errors can also cause
>> the device to enter this state and the only method to recover
>> from this would be to do a firmware flash
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   Documentation/gpu/drm-uapi.rst | 6 +++---
>>   drivers/gpu/drm/drm_drv.c      | 2 ++
>>   include/drm/drm_device.h       | 1 +
>>   3 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>> index 4863a4deb0ee..524224afb09f 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -422,9 +422,8 @@ Current implementation defines three recovery methods, out of which, drivers
>>   can use any one, multiple or none. Method(s) of choice will be sent in the
>>   uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>>   more side-effects. If driver is unsure about recovery or method is unknown
>> -(like soft/hard system reboot, firmware flashing, physical device replacement
>> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
>> -will be sent instead.
>> +(like soft/hard system reboot, physical device replacement or any other procedure
>> +which can't be attempted on the fly), ``WEDGED=unknown`` will be sent instead.
>>   
>>   Userspace consumers can parse this event and attempt recovery as per the
>>   following expectations.
>> @@ -435,6 +434,7 @@ following expectations.
>>       none            optional telemetry collection
>>       rebind          unbind + bind driver
>>       bus-reset       unbind + bus reset/re-enumeration + bind
>> +    firmware-flash  unbind + firmware flash + bind
> 
> Can you guarantee this to be generic for all drivers?


Firmware flash as a method was mentioned as unknown in the document. So 
if there is an error that requires firmware flash to recover, mentioning 
this as recovery method should be okay

Wanted to get some comments on unbind/bind. If this is not required will 
remove it.

Adding reviewers for inputs

Thanks
Riana


> 
> Raag

