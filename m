Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC09BB23095
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 19:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F1F10E622;
	Tue, 12 Aug 2025 17:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G3zUKaUV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1158710E622;
 Tue, 12 Aug 2025 17:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755021283; x=1786557283;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=INOvCD+gf8UQ9I0DOxCliS6NZF1QMuxTsqr+9TPeWb0=;
 b=G3zUKaUVn0qA4Q3OlD2nhrOmWlU7O66dmhWoEJTTFJ9NWvqtApXmvzEe
 JtPLQp1MCi4A1rEKHVkEuRckr9LVieJM2n49ma9E28pn5zOgaFWHWJNdQ
 l6aVXKqNbWA8h+LFUdOYPLKmR2kTkicyt1d/4Ml8F2TkrkkOzHrUzKn1O
 M3aoU2bHPvF1pt1tD7ZMwdqudgjC3FXbYoLPIWcv2JphWDdqbyamFYyfu
 m2rTopF6XjpYtIStjBcvZs5GHqB/M5+cQtJXd9tT3nCGlSAm32xl4wNyh
 221RhqqaeADs5F1t6puxR2rpMoJU//Trcm7x794JkVbv08NNnZyb1cHHi w==;
X-CSE-ConnectionGUID: 0PLYq0Z+RaK+NWrekPArCA==
X-CSE-MsgGUID: QGO7l1iYTBePu/S+9i3hPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="44882706"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="44882706"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 10:54:42 -0700
X-CSE-ConnectionGUID: Rs4+GtpaSZONtJk4U/a8ag==
X-CSE-MsgGUID: GpnfjtDgRv6eLNKRsEb16g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="165760106"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 10:54:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 Aug 2025 10:54:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 12 Aug 2025 10:54:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.86)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 10:54:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NM3SHqAr5QF+MMJ61wF/8Zuhkp0SNBTfAGFjcvtsR1f7mzdjrnM033qXdOlJMjSxHjho02rNqoSrbTYebtI+zyJak6FPQR2KBPtZ58SxxlzGm4s3vALdGckUZsdEII90sZZ6EJOJm7y2QKPZRYl6PC2Hf26dNNdc935InUFHiPiF67YyvbHiecvjoWW5SrvlQLNc8z1qraBz+Et/9JjwnXt9MlNnZYIqCtVS6QLAVkMccYHchra9E6vmiIP7j+1oY/dt0qYl/eyVw6C8scQSg7iW+xV6YxtifF0zMOi8qqiN+usy938aYtd4FOhE/WnScWUMKocsZLchq/yjbxlsKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=as3OkYdCggvIVtiBqarSouqId8eu2RrlWd6wMUAYdv4=;
 b=mVpPzqPrURZf3HAvJljAEn7CoBmVGlVnSPWYZY/v5MNg2ig2a0xR0NKumL+bVjRPV9O2bicNxnFHLjJsf5exKDsaP8uyZGeh3m2j2kJEZ+sLzkC0lvVURy19QsZYAekTax/gcSw0jzujmGaZaVgfrqvAFD2YpKTOg8QiXKvYfPPVYLm0eSiKM/ED40ol1z1LPfBlH6gFJXgyVeQcb4ep+BA1k4efLibToZWsVZdxZ7SEClTcFSQvFU6+TH5fuEt6BSTT+j8wT2MFBabfAuNMmYqBQq0TSUj22Ddp3Ba7s1+4jRL7ltQxcuDMW1jHIj3K69PBDpp6KGQPhXC9G/gFNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA1PR11MB6783.namprd11.prod.outlook.com
 (2603:10b6:806:25f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 17:54:39 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%5]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 17:54:39 +0000
Message-ID: <b27f5d01-52a4-4b9f-baa0-bcb0fe68626c@intel.com>
Date: Tue, 12 Aug 2025 23:24:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/26] drm/gpuvm: Introduce
 DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE flag
To: Danilo Krummrich <dakr@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Boris
 Brezillon" <bbrezillon@kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-5-himal.prasad.ghimiray@intel.com>
 <DC0LXQF855NM.1ODUF3CKB5X4K@kernel.org>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <DC0LXQF855NM.1ODUF3CKB5X4K@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::19) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA1PR11MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c9bbc3-714d-4824-7330-08ddd9c94e98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFpqYXFQcEdRa2paS0Y1YzRuUFdqNGxNRGRDUnJOL09ma3Y3SVI5WkpWQmN5?=
 =?utf-8?B?NnJKMCt0aThBM0Y1alRRY2djUC8zOGJ2V1AwcWtYWEM5QWNPWjR2elBFWGNm?=
 =?utf-8?B?OTUxQlBXeUlQeWlneFRIRFpPVm1YOGtTbjdQUzdGbFYra3NjUUYwclpRRkJP?=
 =?utf-8?B?OUJhdS90dVkwaUpSYmV3S2l2OXFRK09VNDc0S253d1BBR2ZuUjljU0xhdEpO?=
 =?utf-8?B?cjlKUVVYYyt6WE9zRlNyY1g5cFNxZUZad0NiQ1hGenQ2UHhJdGpVV0lTTldN?=
 =?utf-8?B?ajE2NHJCN0ZGcVc1a0J0elh5SWdHeE5ETFFQSFFxMGRFR0VYbENxMXFSNUxp?=
 =?utf-8?B?UExvTWg3UFBYdVpiRjY5T1VkK2xzREg4OVBWRXJ1UkZpMUVCcnFkNkNsRGg4?=
 =?utf-8?B?WGpwM0tYendERFRoOUFJSkhsQ1NFREphZ01vYUo4dVBQZFJlRWxVeUxUUFli?=
 =?utf-8?B?YjhQZUFZQkJGWXhpbFRUemF0YVBFTDVBMi9Mc1k1Z21LbHZvQmlzd2wrTjZ5?=
 =?utf-8?B?cHJpTXRUR0xNWFZQR0RxUkhHeDlUdmpZZW90dDM1clBlU1dOb2JiV1ozY2Fs?=
 =?utf-8?B?L1NGYlJ4c3J6V0FzTnlISnNpbHJ4WGp2SHo0YnBEczE4RExPdkNFMTJHZlRY?=
 =?utf-8?B?Y25kT2tpMzVrdk0vV3FNaUZ0bWpUc0tyUTRndnE0QWo4VStoaWdpeDBjYmEr?=
 =?utf-8?B?MS9NQ2R0N0hwOVlJd25GS2JhU0tKY2drdTZNWFNhd056ZW9aeGU1dXI3djZT?=
 =?utf-8?B?T0hoSTBScE92V0hVUW52cTFMci9OQmhUeC9ud2cyMTBWU0w0WG9aS2l5ZlVx?=
 =?utf-8?B?VG0wMGN1ZjRGUnFGejdubFZ4OEhMNW80MDRHZFpSY3lpaktPK0t6RnBoYUNL?=
 =?utf-8?B?eHBUKzg3VFdVU1FSMHVibFovV3hPd09iUGtGaEhXY2M2SHcvZ1ZLOUxreHVU?=
 =?utf-8?B?RE1LaEZmcDAxUndkNmNROGlLeWl5UDE5VEYvMWUxWFRwcy9YbmRVTGZGbURj?=
 =?utf-8?B?SWZDdGxhMVBicU5FLzNYK1VaT3RCSVRmMjFROVZjSlBCYnlURk9jalVYMHE2?=
 =?utf-8?B?emRWTXlXVjZVYnBqTjJFaStLU00wTVdrMVVMZW1vWXRpdUdTZEQzM0Q1NTI4?=
 =?utf-8?B?RlFNalpGdHN3VFhiWURPNElrODhpSmRZVlhnYUZadXhjUTZsUXhrdDQ4Z001?=
 =?utf-8?B?NHFNU3RNcTIrK09vWGhYcW5Sd0psYXNDZCtUR1NzbjFLdTJ0Zk1HMmJYdG85?=
 =?utf-8?B?OGJuUXNPWWdHOUVaeDNwY3Y3aG9WUWdpV0t5cEFweXVTY1JmTGZvaGQxUHc4?=
 =?utf-8?B?YlBVZlppTHg2dlBFNWphYi8vcFhuTHgvRnJVM3M4L0NMRXdMMnYrSW5XREpL?=
 =?utf-8?B?OG5UVXhvNllMdU43V2I1VGtUNmE1ZWZ5eHdhb2crM2ZaeWl0bmpmZEZoc0F6?=
 =?utf-8?B?Zm1JK2dJVmc4UnErRE5UbmhudG9PREhoVU84SmxMQzlKTjRCaWNiWG5vaXpI?=
 =?utf-8?B?bEZIRElxcnlCbkxrWlZoa3p4a09jSWd6em5JVUk4Q2Y5Z3B4WTlVQytNNnlZ?=
 =?utf-8?B?L01TK2JFVldNTE1aMjlBSXVBS3RpbTRXaDl4L1Q1WUZseVpxaUNIVTZqbG1D?=
 =?utf-8?B?MUM2bEcwYnhhU0p0V09CTEl6RjVLSWNKQkNZL0FmR0dNZUlQZG9WQWhvL1I5?=
 =?utf-8?B?RC9sRzA4MjdzSWs4UVNwc1pPWVN2eHRBV21wYy9tYlQwZFhmNHUvay9ZUTJZ?=
 =?utf-8?B?NlZnL1ZFc0Q3dnZ3clZldWdrUFpqU010VTIvZ3lZWENtMk5TWVRvMmgwTVdS?=
 =?utf-8?B?b2FzZHVhTmdKck9aVk9RcnNTZ1ppWXdRNTVxdnpDY0x4MHV3ZGtDMmcxV0hY?=
 =?utf-8?B?a0pQWEdGSFNTaWV0ZnZaa3ByUjExN2NQZ3ZjbGd1QlVPRFpRN09YeTFmUU9n?=
 =?utf-8?Q?3dfGG8Y473E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHBaYWt3M3hjU1pNaTNTam4xSGRaZFNqd2h2VFN6UWhZU1dZZ2l1YnI3RExz?=
 =?utf-8?B?c29EQ2w0dnZxc1d0Q2pHSWg1Q1c0M3FoVDhoZ2dlZXpsbiswTit6YkFUa0l3?=
 =?utf-8?B?VEVEb3BPRkJvY0Z3S09hb0xHV1oxYnBOdEZoaGViK0hPcmZIcmc2TFJwUnd4?=
 =?utf-8?B?K2VKaTVFc0RRaUxGOHpUT2R0cGNBZ25BamNZb3F1WTFmUmpIT1VkTXo2VWM2?=
 =?utf-8?B?OERhWlJ4dW4wNGswdjRBb3ZYZ2VMbWMwdTJYYXdUY1NVQXRRTk42K2JqbnJP?=
 =?utf-8?B?QmszTjU1d25OVHFrYzJmTWtHSzVjOG5qaGU2QjM0Qkd3UVNxYk1DWituYTNp?=
 =?utf-8?B?T0JtMmp3TzkvK0VMYW1mcThQWTdSdEE2b2xOV0RPV1FhTUU5M2RvVlo1ZDds?=
 =?utf-8?B?VVpqSnl3bEtocCsxMDVyTFUwOW0vb2l4WFlEQ0tUMllmdnFyTmUwZWlLckp4?=
 =?utf-8?B?dWpsWUJNcWJnWDM1OTFVKzBqNER2LytOZ3BSUmR0MjU1YVpwYnFJVWs3OTJ2?=
 =?utf-8?B?b0VvWDlOeUtKbkg1c2x5YjNXV1VaME9kWUhjaXJ0bWozQ0svSnJGU1d2ZGVp?=
 =?utf-8?B?dlZKYXYwMEdJSHp3cVdOSkZ5L1lYS0QyUDJsOUVsL0Iwa2dzaGJobHBNWE9J?=
 =?utf-8?B?QzFONDEvUmJzVFBFZEdvVFZaYWRCRHRKWDl3TSs0Vmc3b3IybHdUVndseVpv?=
 =?utf-8?B?YzFJQlp5dUNWeEZvOUI4b3FqL1lTbVkzRmpGL0NWQVFac01kcm9rdkNTTWts?=
 =?utf-8?B?Q29hTXozVEQ5ZEZ0MTdaclI0emJiZ1hHblB1YW1Hb0JFQVA3R0xUNWs2eWo5?=
 =?utf-8?B?TWxrR3Qwbm5mVkVHb3pxeXVSVzdLSlkxcEFpMzNDMmxxSSt5T0J2NTdZWlFn?=
 =?utf-8?B?QXJQTDNES1I3SWlwOVNseHBVMnJrUXlqbTVFSnZZd0JnZ2N2VnZHK1oxQ1Y0?=
 =?utf-8?B?NjNQcmxxMXRMNXlqZXBLR3ZJSXFkWHFOTml0a2FudFZUR2VnTFcxYW41VWpp?=
 =?utf-8?B?cXF5TFdzU1NGalQ4WUNkckhFODBscHVlSU0rTFpNN3YyZC9HN1V6ckN5RjNp?=
 =?utf-8?B?M1NQNGEwMXhra2lHcHNQRjJobS92eFkvKzFqdExMQ0JOVFpjVmV5dDBIZ1RK?=
 =?utf-8?B?S1VXMWdrTEcweUpGVzVaT21lRDU4TXc2WW9kcVh5TzUyZWNIdmZTTUNlSU8w?=
 =?utf-8?B?UExUSnBCOGlZWDVaYVR3cGZlZ2d1VE9kQUh1WHpZVmhPV3JoSlN6N2dvWFF4?=
 =?utf-8?B?bnArL05yZmZDdEc0eHhzOGg2L1BSOWNRcEQ4Y3hjR0U0bkJSelVodWRjcVhM?=
 =?utf-8?B?WWJhNXZiUXJhalJIWUN3V0szZzdocUFZSXpoNnpteWF4ZW1paktvSkdoRW5k?=
 =?utf-8?B?eExRMVFpQ3F3UTdyWkJiM1o1bVZDdUUxWXdVMW5TN2tkZzBTbFd6ZXdpTWZ4?=
 =?utf-8?B?ZENSRWFnN0ZyanlzeE5VRUhWNTNIbHhSa3BoeWZKRW5ja0ZkOWRmVlZoaFJh?=
 =?utf-8?B?NitESk1GYjJlbVN1di94MjJ1ZWdYOXJJMjJ5QWI2U3RtVmYxOGQvajZ1REoy?=
 =?utf-8?B?M3hGRkd1bEJlNXpSaUpEL0F0RDlubytORkhVR1Z1NklqNE5rejBqK1hBQ2JH?=
 =?utf-8?B?S05LNnRvVTkwYkhRNC9WMC9wWmlnM21tNzNxdVkvVlRBQ1BYWTc0QTBFbzhn?=
 =?utf-8?B?aWF0OXFrZ28waE9EZDNZOVBwaGEvU0daTmxTK0l0bmZGZFdXM3hxZzErM1Nv?=
 =?utf-8?B?Vld0M1VwZHUzdE9sOU9ZNzRkVy9WcGhBY2h2b0tGTGxXMHgrUkJnSW91RGFT?=
 =?utf-8?B?MHozN0NUS2lWV3VPS0tmcnhTMTFpWHRESVVRdWczRis4Qk55S0hmb2lPSHlT?=
 =?utf-8?B?YVovbnFpaVkzNHM2MFlybmxYSEdyR0tlYldrb1lLbTNPSmVqYmx3MzUxWmts?=
 =?utf-8?B?U3RKS2YzcjZTLzdMUEJyN2NNM2N6eW41OE9CREYzRytMdFlReU91b3ZIRDkv?=
 =?utf-8?B?RUh3RXg0c3dRRUt4RnBuK1ZmVWxHYXAxTEViTjNwK1lWVi9QeGxOQWRHbUlN?=
 =?utf-8?B?VGlLK1E3SDRFeFV0YUJOYTdtdFQ5MzVEYWdIcEo5bFZKaTh4MUdoeWNucjAy?=
 =?utf-8?B?VnQ4NUJGcHRJWDZkMyt0Sy9DenpIV01ac0VGWklRMlU3bUJ1SWhWbzBjYU1S?=
 =?utf-8?Q?v7SO6JiQkz0dVw6N4kuXWaU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c9bbc3-714d-4824-7330-08ddd9c94e98
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 17:54:39.1058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPl8pY5Auosr4g7YXugL30WASxxLi3VMb0PENf0nRm2aKX5QCIlGnoYyig2eTqGYFO2+O28Ia1v1XV9SCU1/dnvlipXswr1rKqKQMiZYr0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6783
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



On 12-08-2025 22:28, Danilo Krummrich wrote:
> On Thu Aug 7, 2025 at 6:43 PM CEST, Himal Prasad Ghimiray wrote:
>> @@ -2110,6 +2110,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   {
>>   	struct drm_gpuva *va, *next;
>>   	u64 req_end = req->op_map.va.addr + req->op_map.va.range;
>> +	bool is_madvise_ops = (req->flags & DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE);
> 
> Let's just call this 'madvise'.

Sure.

> 
>> +	bool needs_map = !is_madvise_ops;
>>   	int ret;
>>   
>>   	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req->op_map.va.addr, req->op_map.va.range)))
>> @@ -2122,26 +2124,35 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   		u64 range = va->va.range;
>>   		u64 end = addr + range;
>>   		bool merge = !!va->gem.obj;
>> +		bool skip_madvise_ops = is_madvise_ops && merge;
> 
> IIUC, you're either going for continue or break in this case. I think continue
> would always be correct and break is an optimization if end <= req_end?
> 
> If that's correct, please just do either
> 
> 	if (madvise && va->gem.obj)
> 		continue;

Will use this.>
> or
> 
> 	if (madvise && va->gem.obj) {
> 		if (end > req_end)
> 			break;
> 		else
> 			continue;
> 	}
> 
> instead of sprinkling the skip_madvise_ops checks everywhere.

True, recommended checks make it cleaner.

> 
>>   
>> +		needs_map = !is_madvise_ops;
>>   		if (addr == req->op_map.va.addr) {
>>   			merge &= obj == req->op_map.gem.obj &&
>>   				 offset == req->op_map.gem.offset;
>>   
>>   			if (end == req_end) {
>> -				ret = op_unmap_cb(ops, priv, va, merge);
>> -				if (ret)
>> -					return ret;
>> +				if (!is_madvise_ops) {
>> +					ret = op_unmap_cb(ops, priv, va, merge);
>> +					if (ret)
>> +						return ret;
>> +				}
>>   				break;
>>   			}
>>   
>>   			if (end < req_end) {
>> -				ret = op_unmap_cb(ops, priv, va, merge);
>> -				if (ret)
>> -					return ret;
>> +				if (!is_madvise_ops) {
>> +					ret = op_unmap_cb(ops, priv, va, merge);
> 
> I think we should pass madvise as argument to op_unmap_cb() and make it a noop
> internally rather than having all the conditionals.

Makes sense. Will modify in next version.

> 
>> +					if (ret)
>> +						return ret;
>> +				}
>>   				continue;
>>   			}
>>   
>>   			if (end > req_end) {
>> +				if (skip_madvise_ops)
>> +					break;
>> +
>>   				struct drm_gpuva_op_map n = {
>>   					.va.addr = req_end,
>>   					.va.range = range - req->op_map.va.range,
>> @@ -2156,6 +2167,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   				ret = op_remap_cb(ops, priv, NULL, &n, &u);
>>   				if (ret)
>>   					return ret;
>> +
>> +				if (is_madvise_ops)
>> +					needs_map = true;
> 
> I don't like this needs_map state...
> 
> Maybe we could have
> 
> 	struct drm_gpuvm_map_req *op_map = madvise ? NULL : req;
> 
> at the beginning of the function and then change this line to
> 
> 	if (madvise)
> 		op_map = req;
> 
> and op_map_cb() can just handle a NULL pointer.
> 
> Yeah, I feel like that's better.

Agreed.

Thanks for the review.

