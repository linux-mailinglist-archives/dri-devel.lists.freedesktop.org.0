Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F33CAE413
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 22:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A5D10E164;
	Mon,  8 Dec 2025 21:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecEf5SfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F5510E0E6;
 Mon,  8 Dec 2025 21:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765229960; x=1796765960;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=S3/SCBfc9hmmCtpMkBeT9yuWyOdZsZd3rW9rcHfvcx4=;
 b=ecEf5SfYXJNW5frteEx2bsj6XF3BPq9dXlCFBxyEBNu0JNpTFsVMnzrz
 EYx5+qOeuAo038gEGOly0NmobFx3ue6efgN8B6eL9D4EYqVo4Qe+kweA9
 FoviaoU/xyWbKoUrUqzJF5VN6k716Z+Gqo1GFwlpxOr69kzeBVoa7zSEX
 xc3ZaJKeK+Jyrz8apehgPimt7Mr+SMP1ulQmtMIxOpWxIFH6Y5x4xQgKT
 B9Xz8vT15tcAGs5tBqyjwIZa89Kv8RMAc8kXyx1HfNIlTfAJY48A9sdYV
 g//VpL0vhAQAIhAWeAjeSJpiIgDJTdkgAepTqxXuMYm831wnPurkAymb1 w==;
X-CSE-ConnectionGUID: Fx70YDAnQKi0Oz9W1UDr0A==
X-CSE-MsgGUID: XIS7GLv5QFi0TXfPvUToaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="77799231"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="77799231"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 13:39:19 -0800
X-CSE-ConnectionGUID: NWO4p2nYRaK/LzqJyvImwA==
X-CSE-MsgGUID: V5ovTrEHS4mjvNI/SBXq+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="200209945"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 13:39:19 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 13:39:18 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 13:39:18 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 13:39:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpkctHhbljcQP4k6ZVTY2RaOdrV9pb0JpnAHQbRieRx+JCkAyoHtMrBGVakcbpKw1U9lnxg9CGLFoaWzmDTwpHIlXf7RKMvRQo5xq8SaN/+LAjkS8RuUDIZwdbRDFF5sTTfSnbPNm0CrtyrLaJqUv6A7c6fY6TQBxm8aoWh6/aP8ouW2RR4BYiQbTZRDaxBWthpWdpakIB0MfhzGLFkd2iasLl0kU0v0ZABnG5i1oXsrBCByuGTIA8Lq3Zy3T9uwe+eGMF5ezYMPwERsYunukDYpmjb+VbNB9iJGXsIyOGHnq4jaeG7vmigo5jrKHYSb7vSb7vHfBjKbaZBLPlIDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSWIZhH5kf8PClNOBqS7TibvPxIGkLNdYtP/lo4Ygmg=;
 b=LcIXNYGGr3vdzADyipgZkqKnZO8SjywRNbt4O1l4fnfPyc3l0bmaH/cCqTCD8K/InutzFHT3uRT/W9ik3kYh1eey2hfmLk7+qz1iEaPvko+1h5EwX3012+aF4qEe57M9RImjxnJyFwmlQF22d+SuxL2d58NDUOxvNSyAwG2TX2eeTrKz5fHxJBQ62hZ5R0TKu1pA3BELSH4i7+bAypp3uLm28f7ekuri8EUZ/CCM3qGpQbIwrUU/aGhZkI7xXj6TGYsbTQdf3KMt4ouYG1a4fatprinqrcKID69hsO7XRCtrrbwFgbaYxTfBOW6R2CVZPlnUgY7ca1oZYiu5LLbTmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8406.namprd11.prod.outlook.com (2603:10b6:930:ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 21:39:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 21:39:16 +0000
Date: Mon, 8 Dec 2025 13:39:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <phasta@kernel.org>, <vitaly.prosyak@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, <dakr@kernel.org>, Boris Brezillon
 <boris.brezillon@collabora.com>, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
Message-ID: <aTdFgVM5s/H5tc4G@lstrano-desk.jf.intel.com>
References: <20251128182235.47912-1-vitaly.prosyak@amd.com>
 <cdecd1e2-de0d-466f-b98b-927b2f364f79@amd.com>
 <c56ecd19d7ddc1f1ed4e7e9e13388c647de855b1.camel@mailbox.org>
 <49de5988-ea47-4d36-ba25-8773b9e364e2@amd.com>
 <aTMW0UCGQuE+MXLk@lstrano-desk.jf.intel.com>
 <21699026216379f294d6597ed6febd187229ffb9.camel@mailbox.org>
 <aTcf4o0huubgUPIQ@lstrano-desk.jf.intel.com>
 <aTcguvAQCZ07xD/C@lstrano-desk.jf.intel.com>
 <212ecf88-b175-44cc-af3f-7371340ed480@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <212ecf88-b175-44cc-af3f-7371340ed480@amd.com>
X-ClientProxiedBy: MW4P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: 87802adf-969a-4c52-063c-08de36a23c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVB6OUNiRXcvYnBhdG1wTE90WWc1TFpsOGxwSCt5Q2lSRG9BZCtkeFNDTWFa?=
 =?utf-8?B?QnE1SHU1c3Y2MTZEbzBIeWpCNE5EdHlFUitLdlpBajlGdFpOYUpkWk44MHRw?=
 =?utf-8?B?WXFuQllmWTRhZHFNNlpRM0FwY3FaVkV5THNRRVFYWW9TR3RXeEcvR1VTY0Mw?=
 =?utf-8?B?bFhYSUdTd1FwdldCMjBiaERnQVVwWjkrMUhlR0xwS0c1eWhxSDcxb0U1V0d2?=
 =?utf-8?B?WGttUElGT0ErNnhvVEY3RHN4c05rRkFTK2hia01YeUl4VmdsbVdNdzRTeVZw?=
 =?utf-8?B?bDNDTzh0bzVqeFRYNmVGTGg2end1dU9BcnR3dUFlTDErK25uMTlOVFBjeUxH?=
 =?utf-8?B?MFloWlE4UHRzR2ZYZTBPUEEvUndCTHFxVjNMbGhteFV5MWxBYlBwMExsa0Z6?=
 =?utf-8?B?NURHdk56eVV3N1VLaEhicDE2K1hXN2JzR1JDV21RRXBBdTd3cjllR2N5c2Q3?=
 =?utf-8?B?NXZyaEJGQ3orVkwvL3FMek4wWFpuYTd4TS9zd3pTMkZPdVJPNmZaZ2I4enZB?=
 =?utf-8?B?bVh2Nzl6VnpUcUpNVWlSdWVUbVdPMUErSDVzZWsvc1VLWjMzbDN4RnhQMzZ4?=
 =?utf-8?B?bmY4a2Vob0hGLy9OTDNBY0hObkxkeUdPd3BFMHJoWFpNcDAwZFNlaDRyV0V2?=
 =?utf-8?B?dHgxcGJORkFkVWtYd3hia3Q4NXdIck5hQUVBUG5KUnpkenZaME5NeW00M3dw?=
 =?utf-8?B?UnlYOC9hdzg4d21OQXhoU3Mxa2Q4bUYxT2diSWJyWXI1ODluc3dOdGJMeFJB?=
 =?utf-8?B?SE9OSkI5SFAwUU5xeWVITHBtNTJRWkgvWi93SVZXME9ZeUJyNjZUdGlPU0Yv?=
 =?utf-8?B?WXZTRWhpZVJnaW5XNTlGSUVVNERjQ0c1S1lCYWxTR0YvOU95WTYvcXVZQ3Nt?=
 =?utf-8?B?WURGcEoveUFpRkw0bW5WQlZNK1FaRklyQnpVdXd1V1N5eG5nN0NZdFkzazBi?=
 =?utf-8?B?N29BMWZHQVhyY3MrbVJ4UkE0MUMxbGU5bnBDOWJ0QUlmQ3JTZnY2VVV2WjJq?=
 =?utf-8?B?eWRwcW04R0FlOUFBNllZOGd5bmY3UG1VcmV0KzUxT1d0MTVQVHRoT3NEWHg3?=
 =?utf-8?B?QWQ4RTB5cmRGSk9kcm4vdzR5eS9BT2FkMjdJNUtBZUVybDNqbnpRaDVXY01h?=
 =?utf-8?B?N0NFeTdIa2g3QUlxc2E5eFpwRWtLMWprVWRGSTZNR3BScExFdVMzYU44bjJp?=
 =?utf-8?B?VGUwN0d4Qi8venllWEhPTWR2ZDJOVWtiVU00RVdJblNTc1JoeUJxUWJHcjdB?=
 =?utf-8?B?MzNYRkxlQWREK3ErS0dwR2lOa0hSZUZDNjE1NWI0RGpaWXVkSmV6cVBWQWht?=
 =?utf-8?B?bFlDZEZJdUpSclcvVmV6b1NhUzVncHRZaW91UWFzejlWUE9DRG1Ja0pFdUVU?=
 =?utf-8?B?UXhvaEZjUzNBai9rZ1B4Z2dCcCtrdjFodkwzdm52RE5NT1B1WDZNVnZxUlNu?=
 =?utf-8?B?R0JBTHNoNWQ5UDZ4d0d5Q2dUZXhoSjRWZzMzSDZVclFheHhBQVNzY0x4bXVC?=
 =?utf-8?B?aG9jbG94eFRxZ1hsTGZIVXR5TGRmdTVDaFlqS0Z4SkhndURvdE85UXNMT29B?=
 =?utf-8?B?dUIxcktRVndDS2dUUTFSZTJKNkxTMThkMU1sSTFXVW5xUW5nQS9kbWlGNVNw?=
 =?utf-8?B?TXhETGdaNzVNRWFnYjh0azdOY0NNeUpRVWI3azFzRGY5QnFKVDgyOElBNi92?=
 =?utf-8?B?cm1wZjBoTngrcmJVS1ZZdGg2VWFGRXRZQ1c2ZjdqVFRPU2t1WmpEMFFjbnhL?=
 =?utf-8?B?VmRuL1ZoTVMxaTBDZG5qTCtpbVhoLzdrbEtlbUFPZWVpSGRLMVpzaFZYaUlU?=
 =?utf-8?B?djNGM1Rlb1dYeDJLejJocmYrdGFkaEJFMnh5YzNLV0Q0WG1aQkxlczE5VEpC?=
 =?utf-8?B?Ujlza0gzZFYramNheUc0MU9TN0ZhWEx5Z3hyZkZzNG9UbHBrOFBuWnFEcVRR?=
 =?utf-8?Q?QrRzKEOR1yDbTqLmkEqAgMyHabEtey5W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk9HLzh6RkxQUC9WMmhGYVE2SWE5VGEzaEVXUWNRYjd1d2R6dDNQQ2luVHJC?=
 =?utf-8?B?SWFsTlBPYmc2aHBSaFk1bTk3WCtxbU5WZ3BDVEhRMmx2bjBvOWRGNm54QTd4?=
 =?utf-8?B?YXZxb2RiWk91RXlvcmcwZU1Ca25pNGVrbW5YWHMxSloyRXpDN1MrdERUTHlL?=
 =?utf-8?B?K0dneDZ5NmpnbklYWm43eXZWajV6Vllla3FNbmtCNzRqcmk0SjJPYVZ1KzZ5?=
 =?utf-8?B?aHhTVUlybkdVdHZQRVZiMUJVcDJjU1pUbEp6L2VFRWdjenUwQUZLczIxRVlr?=
 =?utf-8?B?S29GOUlMRGZnVW5DZzlvOW5YUE9kdFNWaHZZSGNjcDY2anMrTEhQRU1JNXlC?=
 =?utf-8?B?ODBscWJ2Nm9vWVcwM0ZVOUQ0MEZOVnNvMldvZ3BqOVZHRGVZMW5GWXVnYTI0?=
 =?utf-8?B?S25MM1JEK3ZUamw3djRkaWJFL0FYazhuMVlCeThQR0s0RjdNVFM0WllqcXpB?=
 =?utf-8?B?YW5yS29oQmtZejR0REJEQmZGbnJtU3lvSkpqdkFtR2pNT1NaNlFIUjZmaTk0?=
 =?utf-8?B?T2E4d1VJaDlZOXcxQTVFMVpUbXA2eTNteHhrOEFEdzJ4cE5KckJjdXJueHV2?=
 =?utf-8?B?WGdIZkVsUGNPclNZaTNGUkNGTXpaT09xVmxCQ3MwUFgycUlhQWpQRit4b0FH?=
 =?utf-8?B?aEMzR2tZSEdVRzB0RE12TnU4S0R1OE8xTlNjb01QMmtwVytWUEc1OXZCNXRq?=
 =?utf-8?B?ZlM2cnRoSitNd2xFYWxINHpYaFBrck9pWG1MZjZPRE5YdVMwZjF1VlVPVndy?=
 =?utf-8?B?Vzc5UHlHWkczb1JZek5IL2J0UEdKM0h5ajdxQzlyRTlaaVFiUDlzM2pPUEFw?=
 =?utf-8?B?NDFJZloreEV3MWlld2s0UjN2eFRjQ1NUektDdUt3VklhREtQN2dwR29VRXc1?=
 =?utf-8?B?bEJKVnhDdm94TGYzaXVNZWtGeXZMTXd3Qi9QTDVXSy91UmE0SmZDYUlQTlBX?=
 =?utf-8?B?ZFZVbHpDNmhnZDV1VzRrQ0ZCMDVmSkhueHJiZllaeklBaVo0RVFvOVIxdW5s?=
 =?utf-8?B?WVpWeDdoL1FlYnpQU1VoU1dOdlUwaTZtWE1KeGdtSEVJU0NyTFo3S2dUd1hj?=
 =?utf-8?B?MkNKUFRlVGVaSUJPajhNV1dMcUcyMWF5Myt2MlFXKzFBdktKZUhZcGpjeWdl?=
 =?utf-8?B?NThBZUpWQnZQd056eDIwUFU3Wk16bGZ6YXhNZ25SQzNzWnV2RW9kT1MrUTQ0?=
 =?utf-8?B?MVB2anQ5K1RLYVVDdHlsMUYwUXZZTEdDZGJvOEpPWnJZRnEzS3VtcmExZkcz?=
 =?utf-8?B?R05PUTUyZjI5TGYxYzdQcitLbmovOUtEaDVVK3hQdGtlSC9oR1BJcktHTFYy?=
 =?utf-8?B?NkpKT2V3NFhLYW12bm5rMDZFQS9FNjRYTGxuaHlxRTkyNEhaMlViUmtNUlUz?=
 =?utf-8?B?U1hSSzhnbmFubEZ1ZU1GNzJJUTNjSHlmaThhUXBZc2EycDZ0dDNiNUVmd3Nq?=
 =?utf-8?B?eGFZUHBWSk1mOXJDOFlITjdzU3F3My90cHU1bDZkb0twTHloRHVQdUZzcUdy?=
 =?utf-8?B?VnNuWjFzdE0yWjRGaWpwVU9ZL09JUEI3dGZGU0pOcnhhTjVjc1gycGdTQXI1?=
 =?utf-8?B?Qm5wdE1Ha2NIaFNvUXA2RUJvcjNGMy9DMnM5cDFaL0EwUlBQT0orVVZXb0Zz?=
 =?utf-8?B?bVNGNDlZcGhIeGQreWgyL2Q1SGZQZEJzVlY1MVV5RTliQ3Y4NzVjdCtqVU5h?=
 =?utf-8?B?ZXJMOGFNWG1FOE0vYm1zYTE5RnUyNHg3TCtwMkZaYkZUT1dvNzYrbW80aGRV?=
 =?utf-8?B?dE5oU2YvQzZLeXhEdzJOS1hJemp2SzNaY2JsalJ3bElvN2NPVUFtTzVGWHlt?=
 =?utf-8?B?bjhjeENnK25obGRhVnFnQVVxeG9XUzNRcTJiMlgwRVVOeE9BUTJ5N01JVXNP?=
 =?utf-8?B?Uko2Rjd6MU5TTTUxZ3lWN2tPaHBEN0c3YVh4MVN1WGtVSnVJSUlGUmNncG43?=
 =?utf-8?B?YXU1K2R0N09LaFpUdkpVTHRKYnRMN3pjam4ydlI1WUpvVmJlZWdaTGhaRXI5?=
 =?utf-8?B?eFdFTkdPSlNDbG55YVNJMDFkcFJKQkw2SVU5dEc4Z0xodlNuV3p2dXJxazdj?=
 =?utf-8?B?UnNYOEcwdUdEYkdzYTFoSTBOalZNVng3QloxZW1WOFhNRzVoUExvWk1aOXBk?=
 =?utf-8?B?OUhyc292THBBNjBhNEkzTEdNWWd3enZ4YisxU1NWYzVHK2Mxd1NDSFJtcEln?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87802adf-969a-4c52-063c-08de36a23c64
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 21:39:16.0410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rU+C4ggmg/blem9KEfX40lAScGGTr5L4XjAaji90zs0vXfDN0TIcGAMDyHw8nSXuYwHwIjvxY50tlpf3aIbm/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8406
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

On Mon, Dec 08, 2025 at 08:43:03PM +0100, Christian König wrote:
> On 12/8/25 20:02, Matthew Brost wrote:
> > On Mon, Dec 08, 2025 at 10:58:42AM -0800, Matthew Brost wrote:
> >> On Mon, Dec 08, 2025 at 11:35:33AM +0100, Philipp Stanner wrote:
> >>> On Fri, 2025-12-05 at 09:30 -0800, Matthew Brost wrote:
> >>>> On Fri, Dec 05, 2025 at 11:18:21AM +0100, Christian König wrote:
> >>>>> On 12/1/25 10:04, Philipp Stanner wrote:
> ....
> >>>>>> This entire fix idea seems to circle around the concept of relying yet
> >>>>>> again on the scheduler's internal behavior (i.e., when it schedules the
> >>>>>> call to free_job()).
> >>>>>>
> >>>>>> I think we discussed that at XDC, but how I see it if drivers have
> >>>>>> strange job life time requirements where a job shall outlive
> >>>>>> drm_sched's free_job() call, they must solve that with a proper
> >>>>>> synchronization mechanism.
> >>>>>
> >>>>> Well that is not correct as far as I can see.
> >>>>>
> >>>>> The problem here is rather that the scheduler gives the job as parameter to the timedout_job() callback, but doesn't guarantee that ->free_job() callback isn't called while timedout_job() runs.
> >>>>>
> >>>>> This should be prevented by removing the job in question from the pending list (see drm_sched_job_timedout), but for some reason that doesn't seem to work correctly.
> >>>>>
> >>>>
> >>>> Are you sure this is happening? It doesn’t seem possible, nor have I
> >>>> observed it.
> >>>
> >>> It's impossible, isn't it?
> >>>
> >>> static void drm_sched_job_timedout(struct work_struct *work) { struct drm_gpu_scheduler *sched; struct drm_sched_job *job; enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_RESET; sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work); /* Protects against concurrent deletion in drm_sched_get_finished_job */ spin_lock(&sched->job_list_lock); job = list_first_entry_or_null(&sched->pending_list, struct drm_sched_job, list); if (job) { /* * Remove the bad job so it cannot be freed by a concurrent * &struct drm_sched_backend_ops.free_job. It will be * reinserted after the scheduler's work items have been * cancelled, at which point it's safe. */ list_del_init(&job->list); spin_unlock(&sched->job_list_lock); status = job->sched->ops->timedout_job(job);
> >>>
> >>>
> >>>    1. scheduler takes list lock
> >>>    2. removes job from list
> >>>    3. unlocks
> >>>    4. calls timedout_job callback
> >>>
> >>>
> >>> How can free_job_work, through drm_sched_get_finished_job(), get and
> >>> free the same job?
> >>>
> >>
> >> It can't.
> 
> But exactly that happens somehow. Don't ask me how, I have no idea.
> 
> My educated guess is that the job somehow ends up on the pending list again.
> 
> >>
> >>> The pending_list is probably the one place where we actually lock
> >>> consistently and sanely.
> >>>
> >>> I think this needs to be debugged more intensively, Christian.
> >>>
> >>>
> >>>>
> >>>> What actually looks like a problem is that in drm_sched_job_timedout,
> >>>> free_job can be called. Look at [2]—if you’re using free_guilty (Xe
> >>>> isn’t, but [2] was Xe trying to do the same thing), this is actually
> >>>> unsafe. The free_guilty code should likely be removed as that definitely
> >>>> can explode under the right conditions.
> >>>
> >>> I'm right now not even sure why free_guilty exists, but I don't see how
> >>
> >> I'm sure why free_guilty exists either. If the fence is signaled in
> >> timedout job free_job will get scheduled on another work_item.
> >>
> >>> it's illegal for drm_sched to call free_job in drm_sched_job_timedout?
> >>>
> >>> free_job can be called at any point in time, drivers must expect that.
> >>> No lock is being held, and timedout_job already ran. So what's the
> >>> problem?
> >>>
> >>> For drivers with additional refcounting it would be even less of a
> >>> problem.
> >>>
> >>
> >> No, the scheduler can still reference the job.
> >>
> >> 1265         fence = sched->ops->run_job(sched_job);
> >> 1266         complete_all(&entity->entity_idle);
> >> 1267         drm_sched_fence_scheduled(s_fence, fence);
> >> 1268
> >> 1269         if (!IS_ERR_OR_NULL(fence)) {
> >> 1270                 r = dma_fence_add_callback(fence, &sched_job->cb,
> >> 1271                                            drm_sched_job_done_cb);
> >> 1272                 if (r == -ENOENT)
> >> 1273                         drm_sched_job_done(sched_job, fence->error);
> >> 1274                 else if (r)
> >> 1275                         DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> >> 1276
> >> 1277                 dma_fence_put(fence);
> >> 1278         } else {
> >> 1279                 drm_sched_job_done(sched_job, IS_ERR(fence) ?
> >> 1280                                    PTR_ERR(fence) : 0);
> >> 1281         }
> >> 1282
> >> 1283         wake_up(&sched->job_scheduled);
> >> 1284         drm_sched_run_job_queue(sched);
> >>
> >> At line 1269, the run_job work item is interrupted. Timed-out jobs run,
> >> call free_job, which performs the final put. Then the run_job work item
> >> resumes—and boom, UAF. Using the same reasoning, I think moving free_job
> >> to the timed-out work queue could also cause issues.
> >>
> >> If run_job work item took a reference to the job before adding it to the
> >> pending list and dropped it after it was done touching it in this
> >> function, then yes, that would be safe. This is an argument for moving
> >> reference counting into the base DRM scheduler class, it would make
> > 
> > typo: s/DRM scheduler class/DRM job class
> 
> That strongly sounds like re-inventing the scheduler fence.
> 

Perhaps.

> What if we completely drop the job object? Or merge it into the scheduler fence?
> 
> The fence has reference counting, proper state transitions and a well defined lifetime.
> 
> We would just need ->schedule and ->finished functions instead of ->run_job and ->free_job. Those callbacks would then still be called by the scheduler in work item context instead of the irq context of the dma_fence callbacks.

Yes, definitely no IRQ contexts.

> 
> The job can then be a void* in the scheduler fence where drivers can put anything they want and also drivers control the lifetime of that. E.g. they can free it during ->schedule as well as during ->finished.
> 

I think this is a reasonable idea, but it would require major surgery
across the subsystem plus the 11 upstream drivers I’m counting that use
DRM scheduler. This would be a huge coordinated effort.

So I see three options:

1. Rename free_job to put_job and document usage. Rip out free_guilty.
   Likely the easiest and least invasive.

2. Move reference counting to the base DRM scheduler job object, provide a
   vfunc for the final job put, and document usage. Medium invasive.

3. Move job (driver) side tracking to the scheduler fence and let it
   control the lifetime. Very invasive.

I’ll support any option, but my personal bandwidth to dive into
something like #3 just isn’t there (of course, I can help review
scheduler changes and fix up Xe, etc.).

Matt

> Christian.
> 
> > 
> > Matt
> > 
> >> ownership clear rather than relying on ordered work queues to keep
> >> everything safe.
> >>
> >>>>
> >>>> [2] git format-patch -1 ea2f6a77d0c40
> >>>>
> >>>>>> The first question would be: what does amdgpu need the job for after
> >>>>>> free_job() ran? What do you even need a job for still after there was a
> >>>>>> timeout?
> >>>>>
> >>>>> No, we just need the job structure alive as long as the timedout_job() callback is running.
> >>>>>
> >>>>
> >>>> Yes, I agree.
> >>>
> >>> As far as I can see that's how it's already implemented? No one can
> >>> free that job while timedout_job() is running in
> >>> drm_sched_job_timedout().
> >>>
> >>
> >> See above, free guility is still problematic.
> >>  
> >>>>
> >>>>>> And if you really still need its contents, can't you memcpy() the job
> >>>>>> or something?
> >>>>>>
> >>>>>> Assuming that it really needs it and that that cannot easily be solved,
> >>>>>> I suppose the obvious answer for differing memory life times is
> >>>>>> refcounting. So amdgpu could just let drm_sched drop its reference in
> >>>>>> free_job(), and from then onward it's amdgpu's problem.
> >>>>>>
> >>>>>> I hope Matthew can educate us on how Xe does it.
> >>>>>
> >>>>> We discussed this on XDC and it was Matthew who brought up that this can be solved by running timeout and free worker on the same single threaded wq.
> >>>>>
> >>>>
> >>>> No, see my explainations above. This is not my suggestion.
> >>>>
> >>>>>>
> >>>>>> AFAIK Nouveau doesn't have that problem, because on timeout we just
> >>>>>> terminate the channel.
> >>>>>>
> >>>>>> Would also be interesting to hear whether other driver folks have the
> >>>>>> problem of free_job() being racy.
> >>>>>
> >>>>> I think that this is still a general problem with the drm scheduler and not driver specific at all.
> >>>>>
> >>>>
> >>>> Maybe the free_guilty is likely a scheduler problem but I'm not seeing
> >>>> an issue aside from that.
> >>>
> >>> I also can't see the bug. I fail to see how drm_sched can free a job
> >>> that's currently in use in timedout_job(). If that can happen,
> >>> Christian, Vitaly, please point us to where and how. Only then can we
> >>> decide on how to fix it properly.
> >>>
> >>
> >> Again see above.
> >>
> >> Matt
> >>
> >>>
> >>> P.
> >>>
> >>>
> 
