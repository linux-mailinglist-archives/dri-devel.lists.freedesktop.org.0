Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B81FAB117E1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F9210E436;
	Fri, 25 Jul 2025 05:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RECTfOw4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9288310E12F;
 Fri, 25 Jul 2025 05:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753420976; x=1784956976;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yn0yUxGOOdeHX30ED4NMtXGWgQ/U8kTzTUOdRbF3psQ=;
 b=RECTfOw41SceIscBqkm3r6jvJk8OtOMDqaprMKnxVzzrbZbT3daRQrHp
 aiWz6ly8WXaqgIjRmNCntvYYhDh6gBTxGpZlJ59xgfRgZpuOeFRZQKHlA
 JVShN86VsURb1N64BvT8kP2ziF5lwk7jYEOZXOSx3TGu59PUxNVw8D63s
 XvZLrOYur+4OYa7nGENpglQ/5zPZ1WJQqF1l9rJTbjT73pNpVH9OpMncA
 OYJrcb13LTgEU1/r7vFGePoO+aYcz5p3dmLIERapWUtLCjhXUM4qkUOu7
 QQjvQhsC7btBIrpoF0V/KGkoYagz7E/3py9hXktzSBikJDVALNf9Xz14Z A==;
X-CSE-ConnectionGUID: Xient7+6TMa+oNrRBJ0Qsg==
X-CSE-MsgGUID: b4k1Emu9Qt2GhuKv2o8ipw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55605824"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="55605824"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:22:55 -0700
X-CSE-ConnectionGUID: NgUJOwDETdyQ6IpdAGLzHQ==
X-CSE-MsgGUID: S7XVtk1GT0OpK4zXpiXdDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160962475"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:22:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 22:22:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 22:22:54 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 22:22:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRV4T9l+eaNYt6lWM2OdcQYrKd1Mhbl3rFZrIM7ZFnRiMkhr1HYv+Ti+66y/6TkUf/uPU5wgdjKb1kTcrOVVXs0VdUbRdICyrZhze2rkThm1c577SralY12FnA/aS2Jqcz3Jg8devdBBLU720L/IWy+5HcuUHB2wVATZOS7dXewWnz5kO5j+yw1tEJ+XGCL6vLoRN24y0E1b3/X9XghsQvjl4Ks1YJhUcb2dlJLc86DVmul7vqFxbrS1YO4gJ0ihx6qZk2WGy0AinJuBK3J6DamS9xpXff4J7j0xoGHiBRBRtW1IAYOL1kvDHeD7er9Y4aZmMGqCisGGatgZuHH1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Lbe63Qr7xNoUtZVksicSEc0VSE4ibEMX3+lygBj1q0=;
 b=hk9ySsj0J3J3XckKFf95PiTZ0zZxzhEtZrq5eHmLUfOn49dHxilP+TWjThkC6V01flhMsodbosH7m3mC98Emk2bjTXYlnK4DLCiz4vOSV71spbIslNRiw4kNe4zFd3XaqXtVvH2v3XNMvcyOgeHN5tN3Gz7jukdPRDA7bY7GvuOiETlmO/kA+7/I9z0SBh6jx0xXk8DXPnn0KZbysbjOCSuhMKDUdNDT5HFyFTdkUHOd9zaoa4WzrvOCpSSzNT4iBg1/cK5UwpPhIl2Kic9fyl0Nryg5J/9LkF1H1BIq3pBNaeNbD34fzerlHFwAmujGu5cV5PynA+rhslrzFeg5SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CO1PR11MB5041.namprd11.prod.outlook.com (2603:10b6:303:90::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.22; Fri, 25 Jul 2025 05:22:12 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.8943.029; Fri, 25 Jul 2025
 05:22:11 +0000
Message-ID: <f1350a4a-8731-4f7a-8e04-94d75c5b3681@intel.com>
Date: Fri, 25 Jul 2025 10:52:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/9] drm: Add a vendor-specific recovery method to drm
 device wedged uevent
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, David Airlie <airlied@gmail.com>
References: <20250724143440.232862-1-riana.tauro@intel.com>
 <20250724143440.232862-2-riana.tauro@intel.com> <aIJc0asrYbD7DzHL@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aIJc0asrYbD7DzHL@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CO1PR11MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d43c6b9-b5b0-4726-a91d-08ddcb3b355d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWg5WlVuUEx4aEJNN05qdTZ5TmY1SzRGQ2tWOFhrSDFTVk5ZVy9aOWdCQnlY?=
 =?utf-8?B?Q3REWVpLc0QxOU1wVitoZ2U0QmZVUkt2ZUwzTUFWbVUxaEZ4NFNGT2Fmczhh?=
 =?utf-8?B?TXBySFJ2N0F5VHRzTnIxRWYxcndFSkRJWXh3bzJkLzJrKzRKQ2lLSWJOdVRD?=
 =?utf-8?B?TFRuT1YyZ3lITEZreDE0UHVMVHRYbjgvUHdPRk9MTWJpNExlZ2VsM1hxb3pq?=
 =?utf-8?B?a2xpN3ZqZUZNMVF1OTIvcS9NR2p2R05uV3FDdHZnWGNUVFRDNitUVTZtK2pI?=
 =?utf-8?B?Zkgzci9YYVlIVUQ5VDhKQnRPaVhBTW1DTVY0NkJoYmRiYjBNZkRkUkU3c0ly?=
 =?utf-8?B?WHpFWUVoL0d3aG5rd04vdXZUSnhkdXV0NFVQOFdGOWU3aTA5S3hNa1lVQ2l4?=
 =?utf-8?B?bml4NXN5V1VwUmtPM0ZaYnBaWm8yOU5hNm8yWm5tNlZvU2xYejd4Ung4V3Mx?=
 =?utf-8?B?SFkwWXpKaHJqaVFhMUZ0VXU1V2NnNGd4dDJNWE5SZUV5Mm5ZSkF5SDJMdXgr?=
 =?utf-8?B?WnJaQjNjN1JRcUtrK1loVk1sdzM4V05tOFpoRHZzWUhGMms2SmZCbHlPM2lp?=
 =?utf-8?B?ZytUekdBQzI1T3MrcmJUTVVOejBsWGY5c2lFc0ZCQ2FKaGpGZmk4R2E3cGt3?=
 =?utf-8?B?TmJhbUpManZqcnJCcXpGWUJNeWx4TmFFTEZMTjVEekJHNitMMC9yaFh4OFFW?=
 =?utf-8?B?YndmMVcvbTV3eTVCamlQMzI2OWZyaWxLUGJybEExS094VTk2VXNNc2t3ZElm?=
 =?utf-8?B?UU5tblFaVTAwTW5FMVFYYnIrZlA4dHRtQStPTW45RDc2T1pyQ3BmdlFTNmRP?=
 =?utf-8?B?dVpQRkg0KzNMMjcyV1VEZjFnd3p4QUFiNlVYVjY0YUNYemFtSmt4RnFxeDZK?=
 =?utf-8?B?TjdkNmRFZ2RUd2l3OEhzb3JqZWFtc0NicGttamIvM0haSWtIMUpzYlN4ZVgy?=
 =?utf-8?B?bjhJM2VuNEpuOEF5ckhVcnNibGpveEdGZUN5cXU4a3B3Ty9wSFpjZ3N0dnU1?=
 =?utf-8?B?ekIzVTFOeStXVmcrOW9ONEVJZFFpVk9BR2dXY05LeXVWNHdoKzFaa2JIbUpu?=
 =?utf-8?B?ejRWcDhQcUgyUVc2OXRxV3p3NHdHTWhGS2Y5RS82dlZhblRRLzY4MnVEZkVZ?=
 =?utf-8?B?UjE5SW9pcE1CZzlaTXFod1d4YUpUQk5oT0hTM1JQaXBLd21ReEp6KzhWUjQ3?=
 =?utf-8?B?L3NvMXhEMGVSZkMvWmhIeDN1TWlXUlNPeFNBS0xvKzdjVURuS0crcHdpdy9h?=
 =?utf-8?B?MUkvK0JZNmZKZThqcFZpRldxZVptRzdUaGZYMDlkZDEvR2lITkZIbFdrNXlr?=
 =?utf-8?B?VnYzYjZ1S3ZzUWFoWnFZT2xyVWNWY2IrMGdCTjArWktpUlV5M2x3TjNZV3lC?=
 =?utf-8?B?UkpCYm9XSEVzZVRxYmMwbjdHTHQwZ1ZTR2ZXS0JteFh2YVhIV1I1VnBUaXBE?=
 =?utf-8?B?SFdFRi94MnkrM1RqK25GOFZzMUVMWEw2anZMVzJYaHdhUU1ST3pZRCt3QVNn?=
 =?utf-8?B?aUNoa3hrdXFSTWxtQkZ0SDVOeFVBN2c2MENibHBOUXh5YkwwMGxIM2NXbXVM?=
 =?utf-8?B?ZUFlUklRRlc4Uno0Um1tV1E5VzByVHFzdGdLVmVpT25WcVZvT1l5dEFQSGZr?=
 =?utf-8?B?allLYVY0MjVseXhMM0lnSjFsR2QwOGIzdEFrbFRtL1JkM2tOMGt5SjdiVWdk?=
 =?utf-8?B?ZXBEMWlWZXRLR0o4V0dOQUtxbjdJS0ViQ2VPZURQelNMVGdjRC9OS0Q5UWEw?=
 =?utf-8?B?RFdFNmFaWXpBUU1SNVlpM2tUQkxvWlVhYUxoVEFNd2Ruak1IclZBRXB4c1c0?=
 =?utf-8?B?c3ZDUkZhN1A4VG16Q2pheWN0NFRld0NZbGpUVDFFSGNqU3pHQUpUMVhhK2RG?=
 =?utf-8?B?MHJ0Wm14eFJKZ2NKeGdUbVJFTW9aVW5Fb3RaS2xTUGFjRTFvdVJzT0dvRGFK?=
 =?utf-8?Q?vGPlE5yqHKw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3VhanVVS0s5TldId1hRTnp1TXkxSjRkSHRIeTNwbDBaOVZnazQ4c2VBZjFJ?=
 =?utf-8?B?aDZEVlk5ZzNXL3RBSWdCd1ovZHVWMjF2Z3RNQ2tTdWJnd0RaOUtTN0tFQkxR?=
 =?utf-8?B?TWZ4ejNrampiTkRnbjJVdm9LQ09DVEZzSDZPVDQ2L2c1QlFLZlhLMG02UTk2?=
 =?utf-8?B?TTFXL01odkFmTUxLb3FrR3BsRTJCQVF1RjMyOXY5dWxsNEM3QXc3Ty80YkhQ?=
 =?utf-8?B?TE8vc1hkZUZoSFNNQXZPYzBiOVJlcVdJN3pUaGRGSFJUZk5XdjBrNVcrQTRV?=
 =?utf-8?B?SVdFYml3YlJMbzJVR3RZZ3doQkRCZzQrZW0zUFdTWHNpa2JIZGJtdnJzdXB1?=
 =?utf-8?B?Z0JpZ1JVYmlKcG90Mm44NER0UTRxUDN0eS9Ec0dERjA2Q1c4dmdTbUg0cW5P?=
 =?utf-8?B?TktiL1B1QWJzU2dqNmdTZUtMaE5qblB3V21QeWZGY2VjVFhySnI0cXVsU241?=
 =?utf-8?B?NFVCRmRWcmhrMm1naCs1Qm1FTnR6cnFjT0ZkQmRjOEQwU1FXYnRpTHpheDRI?=
 =?utf-8?B?aWtwYm5lSTZuNTJTSk9UVjNwQ1A3NHZkTFFWYWR2WWZTS3M4VmVLOWNPMGR5?=
 =?utf-8?B?WHdmVFFhYlBLcFhWdzJsZnZPL3ZSdWdoTjh6ZVgyQ3YrOXljSUhvYUt1OEl2?=
 =?utf-8?B?dy8wd0o4cnBWYnlMZFhPY3dyS3NuMVBQQlpBQ1RMNDNDcnVVaThMeXM0cFdn?=
 =?utf-8?B?VFh1d2JVSGROSVpWU3RxNGhFam9RQnl0RXhyZG9aY3craTVjaEo3dG1kcytG?=
 =?utf-8?B?MlFGaHVOanR3ZVNFYVZIOG1VRVh5NkZuRGxPS2dxS3NERUVxa0ZHbDhyRVQv?=
 =?utf-8?B?alNJSkxlMm40MVFWQk9Oam9VWEljNVBWeEdycjBhaThkOFVrc0pnYjRGZC9M?=
 =?utf-8?B?QURDeTNTZ3U5RTVYQTR1b0RPYzhEVjV0NEZmYkxMaUpYbWZFWU45S0RZZU1n?=
 =?utf-8?B?ZUpRd3AyVDgyQWYvOFc4RFpqQWNacmpKdFp2TXZOODRsajQrSW9JZnZiaTFv?=
 =?utf-8?B?UUY2a1Z6K3FFMGlaZHNyeVJJQktvRkhJcHJNc3RTeVJOekpHN3o4QStvTEFP?=
 =?utf-8?B?YWJTZ1dKM05IU0hYMUIwbEhCSFpqRFZ3dUtVTS9LVkRqcVgrU1F4OFh6MTNi?=
 =?utf-8?B?NlZYb3I5UmhGU3lXNTRRb2xoL3huRmpNcTNIb3dwbkUwQk5qQXFKbElOdkdK?=
 =?utf-8?B?T1YyMnY1QUx0L041K2t1Q0JuNnBYS0xDYmVxSmhZeHBQSVVZVWwvMldiYm50?=
 =?utf-8?B?TFVFMFVLOFB2QU1sZW50aEw0dGJaMWhqTWNrRWtudVgyM0hFVUpSVWZIdmYw?=
 =?utf-8?B?V3JsNHIxd2p0YVcvSDQ0Zys1cXh4RnB1SzIrYnZnL2srSFVueUt3SVpLVXhK?=
 =?utf-8?B?VVQ5RzkwRUw4ZTVFQWVZcVZ5NnhzOHlNSTM0R2gxaXptQ1cyZ2s5bVZ2dVBv?=
 =?utf-8?B?OVp1WFpNN0F2U293UHl4bDBGK3VrOGZvVXZ6NFp6MVlobEROWU51NHpvL3gv?=
 =?utf-8?B?RnN2QzZSMjA5SExSWjVZWmI1NERxMnhmTlkyOTBtT25UM24wVXczQTJKWG52?=
 =?utf-8?B?RStRNmRmWXdVd05JaVdjNm1OV0ZDZ1MzRlRjdm5UeHFWVnEybEJ4LzJJN2hG?=
 =?utf-8?B?MGJhYTlBdWdzM0xMQjU1R2ZWT0hCYXQ0dDMyaHlJa3B2b285cXU4OXFzMXNl?=
 =?utf-8?B?MVZLOENQVDkzS3lqNzVabWh4YkJKYVpHN1hKT2hDc2xGM1JVNWxCRU42YUdz?=
 =?utf-8?B?Z2dMNy80VE1JVWYvWnFHSEg3S3M4MjU5T0NaSno5Q1RGODhtTDBXcGVOblZk?=
 =?utf-8?B?UjZNQ210WVE5K1JUbUQvcXpxTEZGTjRPc2k4ZHdGd3YwOXFPVXZhVy9aSytE?=
 =?utf-8?B?Q2owbG5vUGR5VmxjV2thMGt2NFV6Q3NWd3MyMDE2eUt6elRGQzRhYm9nbHB2?=
 =?utf-8?B?SGxJSVJxODhLUzZUY3d2UGlJU21VbCtlOVRRYUR5MkQ1SUNvMFcrMktVbjh0?=
 =?utf-8?B?S2pzV3BNZERUVTA5ekxTaVJyMTYxL2tTSGx3VE53eHpKeTZSYWhLeGNBMFdn?=
 =?utf-8?B?aVh5S05LV1NJTWNJUWRZZ0E0Uzk5R0IyUTNCTStESUNlUkM4eEtZSnNkUXVY?=
 =?utf-8?Q?SJwFQM+1RDapnNpQxGKyf1j/P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d43c6b9-b5b0-4726-a91d-08ddcb3b355d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 05:22:11.8823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRwXEJtfDg2hqvuFgTQJsPurqcYP7diKzoHjmipurRWlNetzfoZpqI2ZILMYD+1Dx1dndSgjgZns00GVHenEIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5041
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



On 7/24/2025 9:48 PM, Rodrigo Vivi wrote:
> On Thu, Jul 24, 2025 at 08:04:30PM +0530, Riana Tauro wrote:
>> This patch addresses the need for a recovery method (firmware flash
>> on Firmware errors) introduced in the later patches of Xe KMD. Whenever
>> XE KMD detects a firmware error, a drm device wedged uevent needs to be sent
>> to the system administrator/userspace to trigger a firmware flash.
>>
>> The initial proposal to use 'firmware-flash' as a recovery method was
>> not applicable to other drivers and could cause multiple recovery
>> methods specific to vendors to be added.
>> To address this a more generic 'vendor-specific' method is introduced,
>> guiding users to refer to vendor specific documentation and system logs
>> for detailed vendor specific recovery procedure.
>>
>> Add a recovery method 'WEDGED=vendor-specific' for such errors.
>> Vendors must provide additional recovery documentation if this method
>> is used.
>>
>> It is the responsibility of the consumer to refer to the correct vendor
>> specific documentation and usecase before attempting a recovery.
>>
>> For example: If driver is XE KMD, the consumer must refer
>> to the documentation of 'Device Wedging' under 'Documentation/gpu/xe/'.
>>
>> Recovery script contributed by Raag.
>>
>> v2: fix documentation (Raag)
>> v3: add more details to commit message (Sima, Rodrigo, Raag)
>>      add an example script to the documentation (Raag)
>> v4: use consistent naming (Raag)
>>
>> Cc: André Almeida <andrealmeid@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: David Airlie <airlied@gmail.com>
> 
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thank you Rodrigo for the review.

@Simona/@Christian/@Andre If you are okay with the new recovery method 
and documentation, could you please provide an RB/Ack for this patch

Thanks
Riana
> 
>> Co-developed-by: Raag Jadav <raag.jadav@intel.com>
>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   Documentation/gpu/drm-uapi.rst | 42 ++++++++++++++++++++++++++++------
>>   drivers/gpu/drm/drm_drv.c      |  2 ++
>>   include/drm/drm_device.h       |  4 ++++
>>   3 files changed, 41 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>> index 843facf01b2d..5691b29acde3 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -418,13 +418,15 @@ needed.
>>   Recovery
>>   --------
>>   
>> -Current implementation defines three recovery methods, out of which, drivers
>> +Current implementation defines four recovery methods, out of which, drivers
>>   can use any one, multiple or none. Method(s) of choice will be sent in the
>>   uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>> -more side-effects. If driver is unsure about recovery or method is unknown
>> -(like soft/hard system reboot, firmware flashing, physical device replacement
>> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
>> -will be sent instead.
>> +more side-effects. If recovery method is specific to vendor
>> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
>> +specific documentation for the recovery procedure. As an example if the driver
>> +is 'Xe' then the documentation for 'Device Wedging' of Xe driver needs to be
>> +referred for the recovery procedure. If driver is unsure about recovery or
>> +method is unknown, ``WEDGED=unknown`` will be sent instead.
>>   
>>   Userspace consumers can parse this event and attempt recovery as per the
>>   following expectations.
>> @@ -435,6 +437,7 @@ following expectations.
>>       none            optional telemetry collection
>>       rebind          unbind + bind driver
>>       bus-reset       unbind + bus reset/re-enumeration + bind
>> +    vendor-specific vendor specific recovery method
>>       unknown         consumer policy
>>       =============== ========================================
>>   
>> @@ -472,8 +475,12 @@ erroring out, all device memory should be unmapped and file descriptors should
>>   be closed to prevent leaks or undefined behaviour. The idea here is to clear the
>>   device of all user context beforehand and set the stage for a clean recovery.
>>   
>> -Example
>> --------
>> +For ``WEDGED=vendor-specific`` recovery method, it is the responsibility of the
>> +consumer to check the driver documentation and the usecase before attempting
>> +a recovery.
>> +
>> +Example - rebind
>> +----------------
>>   
>>   Udev rule::
>>   
>> @@ -491,6 +498,27 @@ Recovery script::
>>       echo -n $DEVICE > $DRIVER/unbind
>>       echo -n $DEVICE > $DRIVER/bind
>>   
>> +Example - vendor-specific
>> +-------------------------
>> +
>> +Udev rule::
>> +
>> +    SUBSYSTEM=="drm", ENV{WEDGED}=="vendor-specific", DEVPATH=="*/drm/card[0-9]",
>> +    RUN+="/path/to/vendor_specific_recovery.sh $env{DEVPATH}"
>> +
>> +Recovery script::
>> +
>> +    #!/bin/sh
>> +
>> +    DEVPATH=$(readlink -f /sys/$1/device)
>> +    DRIVERPATH=$(readlink -f $DEVPATH/driver)
>> +    DRIVER=$(basename $DRIVERPATH)
>> +
>> +    if [ "$DRIVER" = "xe" ]; then
>> +        # Refer XE documentation and check usecase and recovery procedure
>> +    fi
>> +
>> +
>>   Customization
>>   -------------
>>   
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index cdd591b11488..0ac723a46a91 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>>   		return "rebind";
>>   	case DRM_WEDGE_RECOVERY_BUS_RESET:
>>   		return "bus-reset";
>> +	case DRM_WEDGE_RECOVERY_VENDOR:
>> +		return "vendor-specific";
>>   	default:
>>   		return NULL;
>>   	}
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index a33aedd5e9ec..59fd3f4d5995 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -26,10 +26,14 @@ struct pci_controller;
>>    * Recovery methods for wedged device in order of less to more side-effects.
>>    * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>>    * use any one, multiple (or'd) or none depending on their needs.
>> + *
>> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
>> + * details.
>>    */
>>   #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>>   #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>>   #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
>>   
>>   /**
>>    * struct drm_wedge_task_info - information about the guilty task of a wedge dev
>> -- 
>> 2.47.1
>>

