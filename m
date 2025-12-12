Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0ECCB8878
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 10:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B1210E5C1;
	Fri, 12 Dec 2025 09:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O5vJE+V/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863D110E337;
 Fri, 12 Dec 2025 09:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765533112; x=1797069112;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+CLIn4R6UghvmvGZXHDjCw+5hwtKiENGrekuaHyCXAE=;
 b=O5vJE+V/2CU8Mu07bO2yA5qSek/vZxQpZmVOtZ+LXbQSWpuxWbL29d61
 xFK2vyGe36LbfkzbKnhLOUpjWTFuLhe8T/sXyfOoX4h+QPZYuo0WkdoLn
 2vsTEi1ioYzK2ee1RuLsGpuAgCr0l4HSf5ohhrv4qwLGG2X6xxRDmeJCN
 v4q6phhoKgyAnyRavsUNIVux5tCqsZH3iRTsHQM2J6NhCdjwtu/2iuqKX
 uNRkWSMC1H7HwcNYWPESTQF0H3HWk/3PSKGMnfhmvNgPoHVb5dWsYSB9q
 pGlUrYk23RM4H1Fkrs/wNNItljTGR0Agd9N0gdXx/9oPM0vHS/Z1Gyvzu w==;
X-CSE-ConnectionGUID: oPAm5WTUTjKApFtj5WqAog==
X-CSE-MsgGUID: 2rFZvtyKQ8GTBikTB08EwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67571043"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="67571043"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:51:51 -0800
X-CSE-ConnectionGUID: m8OYTc+aTJWR4/d05+Nnyg==
X-CSE-MsgGUID: PbzCtd3kRwWpFttccqv4jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="197031137"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:51:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 01:51:50 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 01:51:50 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.66)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 01:51:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRuTcel4WGpXcXra56wGYV7I+2RzpT9pMppSHUBxs+RUmmHk/9VsUb393EcYv5EC8TKzZ6sdjSEAmAt12JPn6YwPNqPxcksO0CKunC4/nsBqWHp2OWvPVgYJqiBW2Zg2t/a3FLZw/i+9uDWsetRJ7nvBXXOzX2nAx9KDbNvlFVK3DPzwOkKUIouTQT21NhNBdC5rBt4Qx+mce4AEcoFzdKwqnImq4yKWXG4LOJgPQQRvPGi0GabZyG6QzRRrZzxd+hfPh3uFnwv5woKpOAjeqQ041tFeJsZ9IPBJ6GQBu/stDtGJrqtLWhRFdofXOn2misg32jFL7gwSiCAiSU/8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cy+Ic3YnRuYcOOciKR3+95GISsYge8TXImvE8gLS+hE=;
 b=yOHxK0IqtV+4zlOOWxseRjs/es6oZTw+48sFCb5WH+JnctzxtHbhpEsmLzE79K6D1vObl1zuR9S6nFqSrE2VPrgQVnFx1uB09zVKm8TSA37o/o/z68A3EWcv+tpOob0Bz4GF10qILGR8SWDN3eyy7Q6oHfbYKEqQbJLAPAAH5cY4DJ7UeNE+ByzMcreNrqnhwgVZYXjoXqgEB9spJAJz+hw2424uiV7qxxXyYSAZkKRFn11L1Ka2z1h9aR2bv/ZNH+CdKIk0pVZA1argw9alhhkOmfseM04vzZQiEtLN9lRpFwGB7B/b9FWrFTLOvtSl2N5uw+iTkx47Vj3vRnAdcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH0PR11MB5015.namprd11.prod.outlook.com
 (2603:10b6:510:39::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 09:51:48 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5%8]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:51:48 +0000
Message-ID: <105630a3-a5f4-46cc-86a8-6fa37a15a8d3@intel.com>
Date: Fri, 12 Dec 2025 15:21:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/22] drm/xe: Use the vma attibute drm_pagemap to
 select where to migrate
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <apopple@nvidia.com>,
 <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dakr@kernel.org>, "Mrozek, Michal" <michal.mrozek@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
 <20251211165909.219710-13-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20251211165909.219710-13-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::17) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH0PR11MB5015:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a14b41-bae9-4d44-9db7-08de39641118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXZzcFJJQms5OE0rdGhHMnRuUU1VTGJBelB0Rk90ODdIL2FHT1dQVHVZMjJD?=
 =?utf-8?B?cWtSaHBWbXZ4R05za3hob241eEJxdm55OTZ0WWJCZzJQc25ZN0V5TDdHUHB2?=
 =?utf-8?B?SFp5SFFOVXRzb1JxZlhSSWd3RVQzSC9nR1VkOEQ0VDFkbzZUbVNYTVR1YjV2?=
 =?utf-8?B?Z3hrV3R0Q1BSMXhrMWlpV1QwVmZQV3dyZndWY1FGcktTT3lvcVBualFYbDdZ?=
 =?utf-8?B?NXNwUFYrWFFBV01YbUc5K0pleG1uNU9zdkM3RG90c3d6TERQOGt6ZXRxVmZY?=
 =?utf-8?B?aXZQQUduMnZ0cmtyR1pBd05DSjRJcFdjSENUcVg1TnFKcmovb2tRaGg5Rm1r?=
 =?utf-8?B?dFkwUVBqS2R2N2dsazdYVWFDTGw2L1NHOVFQREk0QmpjU3RGZWdmRnh5Tk9W?=
 =?utf-8?B?SWxyd0M0b3h2UnNwRUdDWDhuT0FPVmZ6a0pwT1MzNzFFelh1eTUwQ21ZQzdK?=
 =?utf-8?B?MzRDTTBuZFhZbVJjTmtEcDUwK2xockhNV0ljd2piMmV5bHJ3RVdZSFBxQVRI?=
 =?utf-8?B?aWhqQTRxMW41T082SHNUREpHVUc4eXdvazM3T1AyYzF1SWpvUEdjcUFGeDM0?=
 =?utf-8?B?RFZrZGhVZThXZGdUenlXelM1V0xnd0RqWUx3b0Jsb01ScW43RVNHMWFPanRG?=
 =?utf-8?B?aUgyTXRFS2hpeGRVcTZCcUhrcHd0SnVjT05wLzRLajBDQ1BNK29xZTFUSzhM?=
 =?utf-8?B?aWpGWUQ3dTRHNDRSUEdma3N4Zmd4VnM1OWJwVDlISlh5WGJWMDFhcEsybmNs?=
 =?utf-8?B?Y2YyR0JrRW5iMTg5NDlabWtvVmg0WVhleUxuRjFCTVFlWEdWRnZkTm95RDg4?=
 =?utf-8?B?L2lvU0ljL2hSZ3ZWbXVTWDkvb0xucmNxRUsvZ1h6ZzF4Kzl3Z1RkT2lTd09E?=
 =?utf-8?B?N05vZFY0cGt5S1EwZUZQQTljQ01iZXp3QkJTNEZ1SGJpRXNIK0ZSaVdWZzc4?=
 =?utf-8?B?elpLUVk4MVF6S0RmdytpbHYvL2Y2dE5EWjE4aFE5aEU5YXZyOUpTWjM1ZVFs?=
 =?utf-8?B?bXFlM2R5QkN5dVlZR2w0bVp2U3VidHYxUk9NR2g0bTV0S3Y1YmVhNVJRMEFv?=
 =?utf-8?B?VVNMR2RlYXhxYzhTVnF4a0NBNzZENEVlK3llc09Tbk0rWUpLL3RsTlpwTnYz?=
 =?utf-8?B?NUUyTENQMERyVUppbTQ0enJENGRXcnZ5NGVBY3MzSUx0UnQzZHJSL0MvSDBa?=
 =?utf-8?B?RTI3dncvUkl1SVNoRGlPc0tKWDZpUVc0dEpLMHFHQVVYTVcxMHpiQUI4TitT?=
 =?utf-8?B?MkFFekQ0ditnSlJSOXVmY0FZYWNNUWExZzVhK2NVNVNTRmZJQUY5VG55Yzg2?=
 =?utf-8?B?ZXlsSERINFRMTjUwN1N6TzgxckxpbUxscmdHdnF2dWFGb3M3MTIvRkl4UlJ6?=
 =?utf-8?B?MjVqMEZ4UXpyY3BvaTd1b2tLeWtaemVTNEZ5MnRxVTd5WlBrS08yNzQ5b1Ix?=
 =?utf-8?B?dUFYbEdWZnFEQjNRa2treFJzKzE3RUpNUU9GaXJxOEpmMnI2dHFpaXU3eC9N?=
 =?utf-8?B?OTV1Znl1dkZKeGlZNlNTTGl2Q1pDRXJLZFVuY0l2cU9wNnhhRkljRzQ4MlNM?=
 =?utf-8?B?a3lnZWJlaU03RTdXb1RnbW1xM3AvTHBRS1lCak56WXo4dy9pdktIaW92RlVH?=
 =?utf-8?B?Q3hmM09QR2diN0lNSVUzdE51NHhHcytDVHBoRGJtVlJ6amltelg5cHQ0Nzlv?=
 =?utf-8?B?ZUdRaWlVcjB2a1ZZZFFKMzhseXdLc0w4RzFTMEd6aWpOUGtyZzBRdTUyZSsy?=
 =?utf-8?B?b3RVR3lYeVYraDd6SU9zOUQzSm9LbWIrZWlxT1F6VFRxZGFxbHd5QjlKSlVv?=
 =?utf-8?B?cFQrTSswNzhaR3plQkJpRUxvQllQQmtxc252cGVwRVNnKzFxYkQxVHhiNWVi?=
 =?utf-8?B?Y1UwTGtXdDZjNXUwNjFUQnp3MGozdnh6TkRiV21FaVJrY3RIT05saTlqaDhX?=
 =?utf-8?Q?QMKuGiWKNB41ejsbByQRb20/SjBIdrN1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTNraklpelhqSkNXVWxhTWtVM2RMVDhZRDQzZnhmNDFMcFZsTUdEUGJMbGlZ?=
 =?utf-8?B?aUpPaGMyTlhDZS8rNWdMQzNXYmEwRXJKYjFBeWExYWxoKzJSd01FMjZ0a3Jh?=
 =?utf-8?B?SWMrYm5CZTFqa0lPWFVmQ3B0TTdpUGNWaW0rakdNeVRyY3lOWWlsOXNISHBU?=
 =?utf-8?B?b1NCdGtZeldQM3VSTVZHc3FCc20xanUybzV6VWZOMCszK2s4RG1lbVlKd0tO?=
 =?utf-8?B?d1NNUWc2bmtFaVh3eWRPU3ZyS0lETitEcnk0aHlGRTdGVFU3dkdxL2x4a25r?=
 =?utf-8?B?Zk1ScHR6Q3FXMHdudDhXaTlXQWR6ZWtZV1RZekpvbFVYWVZRb25lM1Y3LzZx?=
 =?utf-8?B?RVVCQVVHbGI5RERUMUNMUU5VVytaSWRqZzB6TWpObEs5STltRUs3SDROc0tB?=
 =?utf-8?B?WGx5REtpbTNtUHpIbk9VanJlaGIzYzVUa0tRcEVkODZrWnVDVVEzclRoTFVH?=
 =?utf-8?B?YjgraUFGU2dnbVNHNzk5M3BYTzNTUjYyeFhPOVpSUFhNUml6ZVNtOStydmFu?=
 =?utf-8?B?NEF4bDY0c3BnMzZ2YTAzOGpZcVNFeWJlMy93ZXpKUUdFNXpWQklmcGtCVUV2?=
 =?utf-8?B?aktiV0pYSnNra2RRSDRVVUt4eEZ5dDlhS3d5a1ppL1pCL05Ic3BrcUhKeU9r?=
 =?utf-8?B?eE4wN1FYcDgyL0JZaCtzM1gwbjJZZU01ZzdaWEc4UGZpcXJocEJTRHkzMU0y?=
 =?utf-8?B?ZktwU3FZcW00Zkl1bk4yVjNaYm5JUWhBYnkvT20vcGVVQXNEL1BnOW1SZVls?=
 =?utf-8?B?U3k5MTZtNjVuRGFYUGgrUUU3L0pKVEhlRy9mQjJ0MkYzampZVDgwSGtjZ1dZ?=
 =?utf-8?B?RUtTWGMxU0xNUE5vbkJGc1lmeVFrdVlONHJadDg2azM1cUYyRWFPb3J4djBx?=
 =?utf-8?B?cjNQQWllVVlKRVdLKzdUUlVuNTJhQ0NOcGZpSWprN3M4cmV0RklZM2pjbnVJ?=
 =?utf-8?B?SzJaR0g2TXFxeXVZdkRVN01mUFdRbnlGNnBYeTZkQXpvL1o1RkEvazgwNHpt?=
 =?utf-8?B?WWxzRWJJNUJmL0MwQmdwYmVnMkhCc0VRTzkvZ1RBVENFTVRZVXN2UjBITE9B?=
 =?utf-8?B?eitLRUdYUysvWUlIVmJ3QU1hcmlVUmw1cFVGZnlkOEdLTHZZMSsvRXIzOVVr?=
 =?utf-8?B?K0c2aDN1Z3JnMkFmNytJQUZBeFF5YUxlYTcrbDBCTng0SGhKZjR6ZTVOYW1k?=
 =?utf-8?B?Z2JwSlFwdGRNVjRFckxQdmM5bHJhQzJwSGExZUlxR0I5V1MzNXpTelRvN1M2?=
 =?utf-8?B?WEdXU0Q4TTVhTDFBbk81bGJMSnhrWnFubVZRQkRESHppMlNEU3ZzZm1INFhG?=
 =?utf-8?B?RkRkTDBVN0tyK2VTRmhTTG5MN3EwMGx0MHpXQnJ4REF1akNUWWsxb1hCVzh0?=
 =?utf-8?B?SXFLb1VxVVJhQkVOL2VZSGZVVW9CU0ljWDBuNG5ZaWY5ZFBJeUtiVXVEZk03?=
 =?utf-8?B?TVAwVGNEU2JhYWdXQ1BYclowYzA4UnlDWi9kUDNsY2E1UG83Rk9PTEozVDZl?=
 =?utf-8?B?TVVFOHVuN3dsRlVLWFp2WUZlOW81MDN4VGhib1FVdVhBR2UwUnV0UnpCVk4z?=
 =?utf-8?B?K09EU084L0JHRzQ3ZkhZMHJZcnQwbDFhTmt4ajJkeXNIWEhuemlwekx6U25z?=
 =?utf-8?B?aWJDMmpHZ2hjSWlmTC9wY0VrVlhwTVZUVDdIem1BT1JDSWhXdkkrYTVYemJn?=
 =?utf-8?B?TVVWWEJJVCthOEpCRm5lMTRrb0tDb01iSUhTNGcwVnhaRENGczlHQ05SWmhS?=
 =?utf-8?B?YjNCTUdoKzN5TkdYczB3RVd3TFQveWdHVHBPc3VFZnRWTHp2L1Q0a2lQZGRL?=
 =?utf-8?B?VURQL1FtWWs3S0plOGwzUnF6T3BjQ0d5elYxUDFXQkZMRjQyaWFRZTMxRTlF?=
 =?utf-8?B?U3UyTWZMakQyMDExQm04TTBIS3Vlam9PcEdpa05MbVVKdGpFMUFEVHlwVFRB?=
 =?utf-8?B?c1dWMXk5bkxWVkU3SDhIdFV1TDl3VEtFaXIyYmhwQWhKRGwyYnFtbVA5a3F0?=
 =?utf-8?B?L00zRzloV0Zhbmw5ZTFjbDR3SVl0TWY3N3J6YjRRSTl4bE92VG9qaFJwMkJx?=
 =?utf-8?B?QjlTMkllSURyZ3VCMy9JakxQL01IQzFJdjE1SFpuQnpiVU5wMlBRdUtmdmdK?=
 =?utf-8?B?OUFxcHhHQXhvZmZpUW5LR0VGSDdvNUcwcDloSkJMeGVRQVgrVWlGcE05NUR3?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a14b41-bae9-4d44-9db7-08de39641118
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:51:48.5690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDoWS9ARy4trqraCprfAGDsfgZu58zq++th//o7pecAl3Anle36nREGp67L2h2Istu/4vE8ZSygGjMfqu5V7wPtVF/QW9phdxvE+EsbUpoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5015
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



On 11-12-2025 22:28, Thomas Hellström wrote:
> Honor the drm_pagemap vma attribute when migrating SVM pages.
> Ensure that when the desired placement is validated as device
> memory, that we also check that the requested drm_pagemap is
> consistent with the current.
> 
> v2:
> - Initialize a struct drm_pagemap pointer to NULL that could
>    otherwise be dereferenced uninitialized. (CI)
> - Remove a redundant assignment (Matt Brost)
> - Slightly improved commit message (Matt Brost)
> - Extended drm_pagemap validation.
> 
> v3:
> - Fix a compilation error if CONFIG_DRM_GPUSVM is not enabled.
>    (kernel test robot <lkp@intel.com>)
> 

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_svm.c      | 86 ++++++++++++++++++++------------
>   drivers/gpu/drm/xe/xe_svm.h      | 14 +++---
>   drivers/gpu/drm/xe/xe_vm.c       | 24 ++++-----
>   drivers/gpu/drm/xe/xe_vm_types.h |  6 +--
>   4 files changed, 72 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 3b41ea1e1e73..0c82ef0f34aa 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -922,13 +922,34 @@ void xe_svm_fini(struct xe_vm *vm)
>   	drm_gpusvm_fini(&vm->svm.gpusvm);
>   }
>   
> +static bool xe_svm_range_has_pagemap_locked(const struct xe_svm_range *range,
> +					    const struct drm_pagemap *dpagemap)
> +{
> +	return range->base.pages.dpagemap == dpagemap;
> +}
> +
> +static bool xe_svm_range_has_pagemap(struct xe_svm_range *range,
> +				     const struct drm_pagemap *dpagemap)
> +{
> +	struct xe_vm *vm = range_to_vm(&range->base);
> +	bool ret;
> +
> +	xe_svm_notifier_lock(vm);
> +	ret = xe_svm_range_has_pagemap_locked(range, dpagemap);
> +	xe_svm_notifier_unlock(vm);
> +
> +	return ret;
> +}
> +
>   static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>   				  struct xe_tile *tile,
> -				  bool devmem_only)
> +				  bool devmem_only,
> +				  const struct drm_pagemap *dpagemap)
> +
>   {
>   	return (xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
>   					    range->tile_invalidated) &&
> -		(!devmem_only || xe_svm_range_in_vram(range)));
> +		(!devmem_only || xe_svm_range_has_pagemap(range, dpagemap)));
>   }
>   
>   /** xe_svm_range_migrate_to_smem() - Move range pages from VRAM to SMEM
> @@ -949,7 +970,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
>    * @vm: xe_vm pointer
>    * @range: Pointer to the SVM range structure
>    * @tile_mask: Mask representing the tiles to be checked
> - * @devmem_preferred : if true range needs to be in devmem
> + * @dpagemap: if !%NULL, the range is expected to be present
> + * in device memory identified by this parameter.
>    *
>    * The xe_svm_range_validate() function checks if a range is
>    * valid and located in the desired memory region.
> @@ -958,14 +980,15 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
>    */
>   bool xe_svm_range_validate(struct xe_vm *vm,
>   			   struct xe_svm_range *range,
> -			   u8 tile_mask, bool devmem_preferred)
> +			   u8 tile_mask, const struct drm_pagemap *dpagemap)
>   {
>   	bool ret;
>   
>   	xe_svm_notifier_lock(vm);
>   
> -	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask &&
> -	       (devmem_preferred == range->base.pages.flags.has_devmem_pages);
> +	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask;
> +	if (dpagemap)
> +		ret = ret && xe_svm_range_has_pagemap_locked(range, dpagemap);
>   
>   	xe_svm_notifier_unlock(vm);
>   
> @@ -1079,22 +1102,22 @@ static bool supports_4K_migration(struct xe_device *xe)
>    * xe_svm_range_needs_migrate_to_vram() - SVM range needs migrate to VRAM or not
>    * @range: SVM range for which migration needs to be decided
>    * @vma: vma which has range
> - * @preferred_region_is_vram: preferred region for range is vram
> + * @dpagemap: The preferred struct drm_pagemap to migrate to.
>    *
>    * Return: True for range needing migration and migration is supported else false
>    */
>   bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
> -					bool preferred_region_is_vram)
> +					const struct drm_pagemap *dpagemap)
>   {
>   	struct xe_vm *vm = range_to_vm(&range->base);
>   	u64 range_size = xe_svm_range_size(range);
>   
> -	if (!range->base.pages.flags.migrate_devmem || !preferred_region_is_vram)
> +	if (!range->base.pages.flags.migrate_devmem || !dpagemap)
>   		return false;
>   
>   	xe_assert(vm->xe, IS_DGFX(vm->xe));
>   
> -	if (xe_svm_range_in_vram(range)) {
> +	if (xe_svm_range_has_pagemap(range, dpagemap)) {
>   		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
>   		return false;
>   	}
> @@ -1191,9 +1214,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	if (err)
>   		return err;
>   
> -	dpagemap = xe_vma_resolve_pagemap(vma, tile);
> -	ctx.device_private_page_owner =
> -		xe_svm_private_page_owner(vm, !dpagemap && !ctx.devmem_only);
> +	dpagemap = ctx.devmem_only ? xe_tile_local_pagemap(tile) :
> +		xe_vma_resolve_pagemap(vma, tile);
> +	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
>   	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
>   
>   	if (IS_ERR(range))
> @@ -1206,7 +1229,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   		goto out;
>   	}
>   
> -	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only)) {
> +	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only, dpagemap)) {
>   		xe_svm_range_valid_fault_count_stats_incr(gt, range);
>   		range_debug(range, "PAGE FAULT - VALID");
>   		goto out;
> @@ -1215,16 +1238,11 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	range_debug(range, "PAGE FAULT");
>   
>   	if (--migrate_try_count >= 0 &&
> -	    xe_svm_range_needs_migrate_to_vram(range, vma, !!dpagemap || ctx.devmem_only)) {
> +	    xe_svm_range_needs_migrate_to_vram(range, vma, dpagemap)) {
>   		ktime_t migrate_start = xe_svm_stats_ktime_get();
>   
> -		/* TODO : For multi-device dpagemap will be used to find the
> -		 * remote tile and remote device. Will need to modify
> -		 * xe_svm_alloc_vram to use dpagemap for future multi-device
> -		 * support.
> -		 */
>   		xe_svm_range_migrate_count_stats_incr(gt, range);
> -		err = xe_svm_alloc_vram(tile, range, &ctx);
> +		err = xe_svm_alloc_vram(range, &ctx, dpagemap);
>   		xe_svm_range_migrate_us_stats_incr(gt, range, migrate_start);
>   		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
>   		if (err) {
> @@ -1541,7 +1559,13 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>    */
>   struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
>   {
> -	s32 fd = (s32)vma->attr.preferred_loc.devmem_fd;
> +	struct drm_pagemap *dpagemap = vma->attr.preferred_loc.dpagemap;
> +	s32 fd;
> +
> +	if (dpagemap)
> +		return dpagemap;
> +
> +	fd = (s32)vma->attr.preferred_loc.devmem_fd;
>   
>   	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM)
>   		return NULL;
> @@ -1549,28 +1573,24 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
>   	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE)
>   		return IS_DGFX(tile_to_xe(tile)) ? xe_tile_local_pagemap(tile) : NULL;
>   
> -	/* TODO: Support multi-device with drm_pagemap_from_fd(fd) */
>   	return NULL;
>   }
>   
>   /**
>    * xe_svm_alloc_vram()- Allocate device memory pages for range,
>    * migrating existing data.
> - * @tile: tile to allocate vram from
>    * @range: SVM range
>    * @ctx: DRM GPU SVM context
> + * @dpagemap: The struct drm_pagemap representing the memory to allocate.
>    *
>    * Return: 0 on success, error code on failure.
>    */
> -int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
> -		      const struct drm_gpusvm_ctx *ctx)
> +int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
> +		      struct drm_pagemap *dpagemap)
>   {
> -	struct drm_pagemap *dpagemap;
> -
> -	xe_assert(tile_to_xe(tile), range->base.pages.flags.migrate_devmem);
> +	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
>   	range_debug(range, "ALLOCATE VRAM");
>   
> -	dpagemap = xe_tile_local_pagemap(tile);
>   	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
>   				       xe_svm_range_end(range),
>   				       range->base.gpusvm->mm,
> @@ -1840,9 +1860,9 @@ int xe_pagemap_cache_create(struct xe_tile *tile)
>   	return 0;
>   }
>   
> -int xe_svm_alloc_vram(struct xe_tile *tile,
> -		      struct xe_svm_range *range,
> -		      const struct drm_gpusvm_ctx *ctx)
> +int xe_svm_alloc_vram(struct xe_svm_range *range,
> +		      const struct drm_gpusvm_ctx *ctx,
> +		      struct drm_pagemap *dpagemap)
>   {
>   	return -EOPNOTSUPP;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 5adce108f7eb..a003f571c82a 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -94,8 +94,8 @@ int xe_svm_bo_evict(struct xe_bo *bo);
>   
>   void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
>   
> -int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
> -		      const struct drm_gpusvm_ctx *ctx);
> +int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
> +		      struct drm_pagemap *dpagemap);
>   
>   struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
>   						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx);
> @@ -104,13 +104,13 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>   			   struct drm_gpusvm_ctx *ctx);
>   
>   bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
> -					bool preferred_region_is_vram);
> +					const struct drm_pagemap *dpagemap);
>   
>   void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range);
>   
>   bool xe_svm_range_validate(struct xe_vm *vm,
>   			   struct xe_svm_range *range,
> -			   u8 tile_mask, bool devmem_preferred);
> +			   u8 tile_mask, const struct drm_pagemap *dpagemap);
>   
>   u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
>   
> @@ -276,8 +276,8 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
>   }
>   
>   static inline int
> -xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
> -		  const struct drm_gpusvm_ctx *ctx)
> +xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
> +		  struct drm_pagemap *dpagemap)
>   {
>   	return -EOPNOTSUPP;
>   }
> @@ -318,7 +318,7 @@ static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
>   
>   static inline
>   bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
> -					u32 region)
> +					const struct drm_pagemap *dpagemap)
>   {
>   	return false;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b1e708a1b236..ae2c1d500d54 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2339,7 +2339,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>   			struct xe_tile *tile;
>   			struct xe_svm_range *svm_range;
>   			struct drm_gpusvm_ctx ctx = {};
> -			struct drm_pagemap *dpagemap;
> +			struct drm_pagemap *dpagemap = NULL;
>   			u8 id, tile_mask = 0;
>   			u32 i;
>   
> @@ -2357,23 +2357,17 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>   
>   			xa_init_flags(&op->prefetch_range.range, XA_FLAGS_ALLOC);
>   			op->prefetch_range.ranges_count = 0;
> -			tile = NULL;
>   
>   			if (prefetch_region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
>   				dpagemap = xe_vma_resolve_pagemap(vma,
>   								  xe_device_get_root_tile(vm->xe));
> -				/*
> -				 * TODO: Once multigpu support is enabled will need
> -				 * something to dereference tile from dpagemap.
> -				 */
> -				if (dpagemap)
> -					tile = xe_device_get_root_tile(vm->xe);
>   			} else if (prefetch_region) {
>   				tile = &vm->xe->tiles[region_to_mem_type[prefetch_region] -
>   						      XE_PL_VRAM0];
> +				dpagemap = xe_tile_local_pagemap(tile);
>   			}
>   
> -			op->prefetch_range.tile = tile;
> +			op->prefetch_range.dpagemap = dpagemap;
>   alloc_next_range:
>   			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
>   
> @@ -2392,7 +2386,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>   				goto unwind_prefetch_ops;
>   			}
>   
> -			if (xe_svm_range_validate(vm, svm_range, tile_mask, !!tile)) {
> +			if (xe_svm_range_validate(vm, svm_range, tile_mask, dpagemap)) {
>   				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
>   				goto check_next_range;
>   			}
> @@ -2914,7 +2908,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>   {
>   	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
>   	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> -	struct xe_tile *tile = op->prefetch_range.tile;
> +	struct drm_pagemap *dpagemap = op->prefetch_range.dpagemap;
>   	int err = 0;
>   
>   	struct xe_svm_range *svm_range;
> @@ -2927,15 +2921,15 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>   	ctx.read_only = xe_vma_read_only(vma);
>   	ctx.devmem_possible = devmem_possible;
>   	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
> -	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !tile);
> +	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
>   
>   	/* TODO: Threading the migration */
>   	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> -		if (!tile)
> +		if (!dpagemap)
>   			xe_svm_range_migrate_to_smem(vm, svm_range);
>   
> -		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, !!tile)) {
> -			err = xe_svm_alloc_vram(tile, svm_range, &ctx);
> +		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
> +			err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
>   			if (err) {
>   				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
>   					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 0eaaebb42d9a..84976c793506 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -408,10 +408,10 @@ struct xe_vma_op_prefetch_range {
>   	/** @ranges_count: number of svm ranges to map */
>   	u32 ranges_count;
>   	/**
> -	 * @tile: Pointer to the tile structure containing memory to prefetch.
> -	 *        NULL if prefetch requested region is smem
> +	 * @dpagemap: Pointer to the dpagemap structure containing memory to prefetch.
> +	 * NULL if prefetch requested region is smem
>   	 */
> -	struct xe_tile *tile;
> +	struct drm_pagemap *dpagemap;
>   };
>   
>   /** enum xe_vma_op_flags - flags for VMA operation */

