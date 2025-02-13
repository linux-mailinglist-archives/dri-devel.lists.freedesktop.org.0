Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDF4A34DB8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 19:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FAE10EB75;
	Thu, 13 Feb 2025 18:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Csf5aDbz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B1410E0E2;
 Thu, 13 Feb 2025 18:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739471388; x=1771007388;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=al7pwiQ/9KgdP+SJkyKwdxZEi4cZ80DL1B4TCE7ahXo=;
 b=Csf5aDbzhDKBw4gDYTlCNh2t/Xgs011TjyZYu6lX8dtL5xNWIuvJm1xT
 bNniCgyqMQUdlgrupmoaRa2brRg8g0eZfqM2JVXJ1Pg90lKVDA/VE8/W2
 AClJAK/ZzT/WhaQy+xcXkTzh1qBZpeRYGMD5hXDwogBBuBq3xyu1DnVQe
 78Bmv+QmBqlzX7KUKWOlk3b7vA2Bc6Dji/8lA/DmYfeYN/Iy+cIVZUIoJ
 fle8sq0P+QYJqUbkmsgbCS3Qq0vJhOTSn2BtPXMnPvmN87bvktmWnrbmE
 7j2ne5r6ItHhv0pWxlqtkZJL3VSTigStoG/42PlRBvSPfa4IFJSfdcg51 g==;
X-CSE-ConnectionGUID: 5c5xIwx7TlGEAB11WcfakA==
X-CSE-MsgGUID: rEcS4BPbS7m3SkYLcXsbUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="62663782"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="62663782"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 10:29:48 -0800
X-CSE-ConnectionGUID: Fke9ogOuQcelAiPQGpIwOQ==
X-CSE-MsgGUID: bHzC4E4sTKGPK1VKEv1DVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113406974"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 10:29:48 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Feb 2025 10:29:47 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 10:29:47 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 10:29:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DeQuLtISNOL1x7oWHyiSDexjF+boh5dHhr6hbqqKRdx4uAmCnvoYDeTEl9V9wlHNO1qKQ4n2ApCmqBdeEptxnVJyNEZL3YRib9WTVdlrj+X5csMl8oKt3N4Us2oNJHetsEjg4V7oWVDGzhEsy5uUV9ARA86ynu3lB5voE3uE4g5H0sFD7GU+Mp3vZkLcmBFqpyLgC3akFqIDbYimZhyvrMZSxV7go0DWAwcd7jiZrkDY2OPv1yaFZHY2Me0kEzIp87XDEyj9MxfuYGY25SBWwC1jraP3SilUQsdretHs/Dhilpbwwxe/X44l/jnuVAjaAEgSNDmTuxzi1LDsZVYg3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLFCYLdSHNih7Pv0Dv31E7mwL/ZTyUGsamCNaQegJOc=;
 b=NRTGvOt+wgsXf+Q4UmfbAHUIdwPM1Am289KAC5LRkn2cHim4Uwe1WvqJqranA5DuuAkRCMD2OG1RgDqr+ONOmiQKTqjMSp5jwc/s8rfaSiYRHTxpgSy/QLdhAMMLLJFr/1vxNaUTf075e3kJIzrf87sYVLAxj/E8jn/V5GK4r5f7deN4tvSEy2x8jtYbb1qgQNbW8go96fh10ARy+zclh0/0ZUJTxTR42mX23TpftPofMn27ie35uYS8QsCw0D4K7g7x6njTiYLC2vo/MffhS4PsTqtmWlfT0z1ZQ8HX2q5qrJm6CBY1A8YDbdiVLbc6vSNA2UUpqnIbsuQsxzEd5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA2PR11MB4778.namprd11.prod.outlook.com (2603:10b6:806:119::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Thu, 13 Feb
 2025 18:29:44 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 18:29:44 +0000
Message-ID: <63df5551-3bbe-43fe-835a-a917800abf56@intel.com>
Date: Thu, 13 Feb 2025 23:59:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 26/32] drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-27-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250213021112.1228481-27-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::33) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA2PR11MB4778:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e5f3df-11fe-41fc-a996-08dd4c5c632c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elFoa0czOTBFSUE5NUhzV0NvUDhIZmJ4bHFnNVdobWJDWjZvb3JyclhNRDJU?=
 =?utf-8?B?THFvRm9sV21Mb0tKQXJ3LytqaS9KcjFWcitGVlRSV0MxbzFQaEYwY2paQXFL?=
 =?utf-8?B?WmlPWEU0RHhpc0NwRC81WWlUN3dTWFE3TkNKa1hFL2FGQzl2Ri9hVjgrSnVE?=
 =?utf-8?B?c1dackdueTU3b1g4eStmVXRoT0trZ1hqaFRiVHlYbTZ4QmwvVnVOZSszUzlH?=
 =?utf-8?B?dFo2c1ZDamZBcUEzNE9GKzRVWE5sTGdKdldNR1hHOFJ5VWcyeUF5ZTcySGVw?=
 =?utf-8?B?U21OaWd0dGVmSVl4L0p1dnNqeFFwODl0eW51dm1ac0wzVzZkTm9yeTk4TDl0?=
 =?utf-8?B?MmhqU3RnNExTc1dzSCs4SDltZjM1eC9qeGdwclJUN3FSZDFteWowM213Vk84?=
 =?utf-8?B?bDBmSjlQWHpwTER0L1RRQlBhNlZqMmRHWlcrQnpva0M1WUlIN0Yra0hsUVZ1?=
 =?utf-8?B?anVGSzdIZjVlTHdkZERHRCtSY0xkNVFJVXhIa2FCNGkyL3dvd25LcjJTamJ3?=
 =?utf-8?B?Y2VwVGkwc0cwVTcyUmQvME53OW9tTHVBS2M5ZFJWZWJhTzU4TmVISG9sV1gy?=
 =?utf-8?B?NW0xbkpTUkpxM3Ywc0djbFZtd2lBQXBRSVRnN1pSMDZDSHBkOVE0eWh6YXg3?=
 =?utf-8?B?WEF6aHNaZk50ZGZ2RDVTRUNqNzBIUEEyL09QMmhmY2tCSE5ZNFk4TTNXYlhl?=
 =?utf-8?B?SUVBRGI2VHFjWU9qOXU4YlgzZWlhTEd0cm5RVGRtZ2FLY09lVC83ZnRHazdK?=
 =?utf-8?B?angrM3A5OHNWR0UxQkhnNlE3aXZ2MzVEL1ZlSGV4TjV2TFFDczM2WU41eTZO?=
 =?utf-8?B?aXVuNEZ3dHRqZDUwRUl1WUxNYXZWcG85RmdCTWpkY2VjRW12STJyTS9uV056?=
 =?utf-8?B?MTJ4NUxad1Exa1lnRlFXdlVqWDJFZ3VlVWdUY0ovM1B2SGY4SFUzRjgvNGlj?=
 =?utf-8?B?NUpMTXhXeUpQOWFvRkdpT21iVTJWakdlY1FtQ2YrYU92ZjNTYnhRbGhUcUNU?=
 =?utf-8?B?VFYvMUp1RG5TcUE1OExIZDZqcW9TaHI3Q1dRY0lyM2l4SExsNDVFSVJ5emxx?=
 =?utf-8?B?UU5SN2oxM2czc1R1Vk5zUTdGUnI5UGlYNUFXaGM0Q0VlVGdBdC83YWJaQ3VQ?=
 =?utf-8?B?dkY5Wmk0NUhPVEZZSE5DTzhJNk52N1laNnV2cjhzOURxMjFKaFNYdmRuMTV4?=
 =?utf-8?B?cTlBUG9SU2VmTHlwV1NqcEcwN0ZkN1A0ZEdueTg5clQ1TFVGMGJZV09sZnpj?=
 =?utf-8?B?OVpVOGI4aUdWYmkxUUVYM05zNjNxblFiZUhCOWlQWlJhc1lqS1F1T1R4VzNj?=
 =?utf-8?B?R3hWbURZSEJ0SldCbzB3MmtJek9aQzJzbys0dmZyUmtDOFZENU94WVRSVTlm?=
 =?utf-8?B?WTdDWWwrYms3L2U4QjMvSmxHVVphcEMxeXY1SXhRUHdnaHI5azRRZ1hpbWxk?=
 =?utf-8?B?YkdPaG5aS1Z2YVlWWEFwb3ZCVWMwUHR2WUVaWTdFWW1pMTY0TGM5V01IUFJk?=
 =?utf-8?B?Sm45MmNhUlRZeU4ySjNia3UyTlBkSWtFMkVIL0xGY1EyMmlteFY4dFhQNmtL?=
 =?utf-8?B?c1FqL2JRMm1qQkpFcnJxdzkxaC96R1ozQkJZeVhrQzA0N0J1Ylo1UlpWZ0Fh?=
 =?utf-8?B?TG0vWHdlVEpsYWhTL1k2VUFmM1grZ1grRzRaNnRZb3p0WVRhS2IzeTdvT2pB?=
 =?utf-8?B?cUpZdUJrZ3gvY1p5aUtmWE4veStjcTNoZlJkNW0xWGtzZ05oSjFHZjdqM2hX?=
 =?utf-8?B?S3BLT0xXdkNmTXdFWEh5anc4V3FzbEpBV25PQ1paSjNIcC9JNmkrN1E3WTRS?=
 =?utf-8?B?WVh2VDk2NUQwbG51Vi92Rk9QTm92L0lKVkdDckUzUlh0N2ExWlZXRWFSdmRl?=
 =?utf-8?Q?KgvhEfEkqRulb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkFJUzZScisyWnBzb050UEtCeER3STlyM202d21zL0JFdlZmRzFYLzZGSnc0?=
 =?utf-8?B?WVgyTGtYdit3dzhyVkpRRS9RUEpUN3JLa0dYV1ZwZzFYdzRQc01YYXRlZi9T?=
 =?utf-8?B?bTZDM3I2YnZQa2FvaGp2RzhPZ2VuN2dxdEcxeFczeXJqTDNZK0toL0dZWTZo?=
 =?utf-8?B?ajE5OGRjblExU0dXMjdYcXM1SGsyM2tkSFRoMWR4d3EvUVJYVXJVN215TG9w?=
 =?utf-8?B?alVUaEJHSjVJMEhaNHZRNHlwU096T1RHTnp5dU5xRHkwU2ZxSzVKT2Rnei82?=
 =?utf-8?B?OGFhVm0xMkNnOU4wb0taYW9NMXQ4SVVqNnlTZStuS2MxU1AyQWM1L1U0eXVy?=
 =?utf-8?B?RUhqQktWSk0zNXhWdXJOdlF0NjI1OUFFWWkwdkdUbmdVVnVVVkZMWWFoMkdH?=
 =?utf-8?B?V3d1eWJNditvY2IzTEh2MWM4TS80emJvelg0N0FmeHFveTY2UEg1Unh5NHZQ?=
 =?utf-8?B?UjRyTjdzK0RnSnd3RjFxNWE4OHlhb2NpVDc4ZmJNSkN2MVpTNHp2UGlKeG9a?=
 =?utf-8?B?RHVkUjhaUDk3WW5BbWw5WGprYmNpclpLalJvU3FQVlJuWllmc2NjNkJoTTkv?=
 =?utf-8?B?VTRQRmkzUDhzeG1sdlBENWhlTXJ1SlpnV0srcktzU1VxNVp1bk54Mnh1RCtH?=
 =?utf-8?B?MDFJemZCZC9uLzlFTDRNb3lCc1VpSktUaTV3T0F3dVEvMHVqanhvME1pMm1s?=
 =?utf-8?B?MVl4YjF2eDIrY2dRQkhuaWdTSk1FQWJwSUp4SXM2NXBJdklYa3VKdlJEZ2cw?=
 =?utf-8?B?TDRRYW1aOG5FMDVJeFhMUFpXNjZvRVU3T01nWkFmMjQ3cFNpRnV1SnZMcHg5?=
 =?utf-8?B?Z1locmhYblo3N0Z0THllLzRQNzQ1VVNsQVkzbFowSzFwUXM0ZW1iS2hsUVU1?=
 =?utf-8?B?YTZjS2J6SDBRb1M2OUtSRlB0eElZMG01eTJFc256UGM5U0xKK1JHd09McWx2?=
 =?utf-8?B?MnltcG1Kbll2U3BZTmhlU0dDR3VtekovbTFEdFRjQ2g3cmtPMzlnWVNhOE1G?=
 =?utf-8?B?R3RpRnk3S1UrbGNYd1pTQzkyQlQrMWdrWktLLzRCbkk0K2dnZFhJR1EzMFNx?=
 =?utf-8?B?OHk1K1NrRVluL0lKWmRqVGdtRWQ4ai9aZ1c2ZjNPZnR3akVFaUhWanlCK1lj?=
 =?utf-8?B?c1Z2NlQ0dENRSnRtMXZlQXZ0Z2RFYzBhSFFTZ203SVowcURnWWlFTzBXWVNY?=
 =?utf-8?B?b1FJamQ5eTlKL1F0RjhZOVlaWktLRWs1MjE1S3dCQ2NRUUplQjdsVUM1M0Y3?=
 =?utf-8?B?b0tBcUU3TjdrdW9VK1p1d3kxTERjWTE3ZDRwYWgxR2I0YzB1ekRmQ0VVdVZi?=
 =?utf-8?B?M2xIMnlaUUhEVlRWbUpQeXlUU3pnaFFEMnlKdGYwSXBETmQrWlZOTkE2OXZZ?=
 =?utf-8?B?cEFOK2ZHR0UybTRVV2ZGNUN4SUhGcXkzRXZCU2FXWjBwOXRFMHRmWnp1N2Fw?=
 =?utf-8?B?c3NoRkJRaWhFRW5QeG5jUGdBdXM4MkVrMVJjQzUybGwzT1lxV243bDdoRWN4?=
 =?utf-8?B?REZzT2VvNWxqUVVTaGRtMTVtTWhtdWxpV2lUbU5IOHBjM0x0K3VzRXBEcXdY?=
 =?utf-8?B?cDBHMURnaGt0VHE1MjROaTdDL09HaUZyalJ5VktvNlJYTGM0djFncVBFeEtq?=
 =?utf-8?B?eGNWRVI4ellQN1pUUTNNYlE5MDFvQ21EYWpkSWMva0NpaWF1ajk5Q0s2UlVW?=
 =?utf-8?B?VTg5RDFZRjBBbzN0N1QxT0xibkdUSUtCQkszQlBCbk1SNUJHSnQwWjJQbElF?=
 =?utf-8?B?MEduRHh2bHduc0Vjd3NobjlEZTZ4SWRBc0dFTWxZd1V3bUtlaTVGVmZ6Y2xV?=
 =?utf-8?B?WlVOLzViMlJMOWo5Zmk4MmxKcTFrajR2SFZYaWY5eEU4TmdVeXUwS1ZPSTFx?=
 =?utf-8?B?UmpXSC9wVFk4cXgyM0grQzNoNlA1dXdQYzlHN2U0eC9HSzhYYU1LQ3IzellE?=
 =?utf-8?B?S3kxT2t0dWRoNUttWGdrcjI5TXFZdDJuT0lUZ3UzL3dqbk9TNXlrZ1FkNElV?=
 =?utf-8?B?a05qT0dCZ1p3UHp6VzhoNGxOcVBKMkhxWkRQN3l6SUgrK0xWWkFoSmtrYWZT?=
 =?utf-8?B?L2dzanR0UWoyYTBvSGlDY0ZTcGRMaDg0TXhPVVNySWhYb2EvdEFpMTF3ZGMv?=
 =?utf-8?B?TFRKYUQvcUttZCtDbFpsNDBrQzdVQ2dZa0Z5NFRxTXRTeVZneFQ1RStvY1Ji?=
 =?utf-8?Q?IF+Btn4tvEWwKJQzwCuo900=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e5f3df-11fe-41fc-a996-08dd4c5c632c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 18:29:44.3773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e13VpH4OGE+Lr8QlD6A96Th3HTHhKQ9haZ9RUUDV4MK1+Wkn/lTD5ZJ3dMaIAwh8doh147wI8XQIjo1iZc7/E3d6/KaEZbmF5/hBUwKSPZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4778
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



On 13-02-2025 07:41, Matthew Brost wrote:
> Implement with a simple BO put which releases the device memory.
> 
> v2:
>   - Use new drm_gpusvm_devmem_ops
> v3:
>   - Better commit message (Thomas)
> v4:
>   - Use xe_bo_put_async (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_svm.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 974d69a39445..0a78a838508c 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -3,6 +3,7 @@
>    * Copyright © 2024 Intel Corporation
>    */
>   
> +#include "xe_bo.h"
>   #include "xe_gt_tlb_invalidation.h"
>   #include "xe_migrate.h"
>   #include "xe_pt.h"
> @@ -471,6 +472,13 @@ static struct xe_bo *to_xe_bo(struct drm_gpusvm_devmem *devmem_allocation)
>   	return container_of(devmem_allocation, struct xe_bo, devmem_allocation);
>   }
>   
> +static void xe_svm_devmem_release(struct drm_gpusvm_devmem *devmem_allocation)
> +{
> +	struct xe_bo *bo = to_xe_bo(devmem_allocation);
> +
> +	xe_bo_put_async(bo);
> +}
> +

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
>   {
>   	return PHYS_PFN(offset + vr->hpa_base);
> @@ -506,6 +514,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
>   
>   __maybe_unused
>   static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
> +	.devmem_release = xe_svm_devmem_release,
>   	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
>   	.copy_to_devmem = xe_svm_copy_to_devmem,
>   	.copy_to_ram = xe_svm_copy_to_ram,

