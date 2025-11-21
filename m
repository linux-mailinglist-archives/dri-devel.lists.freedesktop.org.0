Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FDCC7BBC7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 22:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3862210E903;
	Fri, 21 Nov 2025 21:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JHULf5Uh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAFA10E903
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 21:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763760004; x=1795296004;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E9zzJ+BdyVGUoJ0rBI5BqQHD7vTmAiq/x5FDgjQb/OI=;
 b=JHULf5Uh+MAYYhZ5OoJrObQWeJ9ro7Vq0+pHvWTgqANqRf88sTPr/w36
 bQ7oelfpn9I+VF+23v7MdmO0QFQJLzuukR7NWYBaY36UEKYMeo8LipM/O
 SBQQJpkj8uPdZzPeHZYSObkrq6RUP2RB+9vnDbvWT4ABe1WByboBBmQGo
 IogkXf9TMq2XdS6VuJWNhiwnAB+IxUEJPyjTiYTJ4CASEKcC3AR6BSxZ3
 gkxLk19CnBhgZOY+HPcHMbYoQpDJNZRtZHY+7JO/+NEtAJUaGKzeBAYMv
 I4I07DpbAwcQY64ul+ct5pfapGFC7xrLcIG7vNCWtpu+mc/Sxb6GbHJBp w==;
X-CSE-ConnectionGUID: B/ib329TTM+bnAB5lG+p2Q==
X-CSE-MsgGUID: MkVA3JPqQkuKy9UlP278sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="83481952"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="83481952"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 13:19:42 -0800
X-CSE-ConnectionGUID: fB7twbo6QdqyhOb92Uzi6Q==
X-CSE-MsgGUID: 34+fofLpSle4BdwMDxRiRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="191092117"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 13:19:42 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 13:19:41 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 13:19:41 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.37)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 13:19:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5e2jiRsLvFjYzfOfdlw8BYyOS+Nz923durcSYNYBOlRvsZf2EX8Azma10acEgfCka5du4rm5KtPZELnHA4NiPs2CEBCz6Qu7CldBqflodBdQWAdsh6quwX62dVdvWXx44E0FowWp+vDwODTufzsaOrytrQ7Xc57gUX1QUE4qTzei1wxayieRT5ezoTECL+CImUaFePSmCLIEKXvWxrzPlFbFC5D7EYLtwbOjU71GKlUbU4UTHBRwzGYOHVkpOCeflR2IOJhBUnqN5o2ZDpJoqEcjhUpAmupLuY1/OWWro5mwlpmICx90Vjz+USg+Ed+OcCPI5ly+FKADNL2wk4RAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9zzJ+BdyVGUoJ0rBI5BqQHD7vTmAiq/x5FDgjQb/OI=;
 b=izq2QSD9RM/qkYPy9UV35Tl3UeSfmOsM6DtRE6mTvncseTudkZsWBSNHVSfZO7fLD7lvevLZVQKPT0RGMw13QVmq2X4z/WTXMISgzbiMga/E/by7RU+RzbTwtP0fm/dms7NWrro2+XdRCl7ICIosRuF2vUUxJ/FfPkgW8MZWBqzqXSpW76V9XCYCQ6WxbjSfZgUiUoevcpLhiX5Dn5+IGd0qcvP36mVNXzBar0E5H3DOPkawB4WaR2mM7YiKuIiTDjp+NNr1DvkNKQGAfvVm/QE5zvrBZH7sQo2J/ffqFKsJJEIVjkMSG0O3+CJDlylM9+EPddBAZeMHhHIWyhQxwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 by PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 21:19:37 +0000
Received: from PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773]) by PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 21:19:37 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "airlied@redhat.com" <airlied@redhat.com>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "nirmoyd@nvidia.com" <nirmoyd@nvidia.com>
Subject: RE: [PATCH v6 3/3] drm/virtio: Add PM notifier to restore objects
 after hibernation
Thread-Topic: [PATCH v6 3/3] drm/virtio: Add PM notifier to restore objects
 after hibernation
Thread-Index: AQHcU8OzUktLRH3oA0Sjzb9+ERz0crTu4sCAgAIvo2CAAReXAIAIqvZwgAKodACAAC+oAIAAA9bQ
Date: Fri, 21 Nov 2025 21:19:37 +0000
Message-ID: <PH0PR11MB511207F35B6FE86AA64ED739FAD5A@PH0PR11MB5112.namprd11.prod.outlook.com>
References: <20251027205323.491349-1-dongwon.kim@intel.com>
 <20251027205323.491349-4-dongwon.kim@intel.com>
 <90f9c416-05d6-45f4-8205-027fc36e88e0@collabora.com>
 <55556365-4c6e-450c-89aa-9c49ede53b00@collabora.com>
 <PH0PR11MB5112533F30F495410F5E71AEFACDA@PH0PR11MB5112.namprd11.prod.outlook.com>
 <66183a1b-c724-41fe-ae90-4d73e5f2aa67@collabora.com>
 <PH0PR11MB51122A5436CF812363F1C614FAD4A@PH0PR11MB5112.namprd11.prod.outlook.com>
 <9df778af-76bf-439b-a66e-a4e9b809176a@collabora.com>
 <fc91634e-c6df-4486-bd91-bc3af62b2bbf@collabora.com>
In-Reply-To: <fc91634e-c6df-4486-bd91-bc3af62b2bbf@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5112:EE_
x-ms-office365-filtering-correlation-id: 79406658-b826-4bcb-b61f-08de2943ad29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?S0V1OUlIQXZwZnpTK2RUYWlrb1VLVWs3TzEyb3kzNVlNQzdhMVRCaU9sT01n?=
 =?utf-8?B?TXQzbzZDSmhNZ0VtZEV5aXVvUkNPNWdoTDBZMFhtWmZYVDB3TVlDUERPOU11?=
 =?utf-8?B?TzhxMWZKblpzdjhKcjlBTWY2bkRMcU40NWF4SktqbmxFbzllUHFhVlhvaGUr?=
 =?utf-8?B?OG9HNnViRFdKRkU2Z244UVRZMlBIUnRXcHN1eFNTVjBrQjZlZ3BOblYwTm9O?=
 =?utf-8?B?TzNoTkdDbG53cEdVOUphWHRqT1NESnJJUjcwTm0wMUo4ZXgzd2IrSmpRaVBi?=
 =?utf-8?B?UUxOczlQS0kxOEFCanBIZVNEZEdYNEhPVEJZNnpObkFGV1FTV3Q0MnB3MUo5?=
 =?utf-8?B?N0hUbHdndm42Vm9XdnFPcGk4ZHl4MTBqN3J5MDJHT1VWTVZaaHpSLzNmQkth?=
 =?utf-8?B?RUwyRWhzd3Z4eHlGV0s4UHFtMWYzNEZHbk5GcVpTbURWOExrVzkySnhwckJZ?=
 =?utf-8?B?YmdtMlFOT2NZSU9hbjBaN2pRamI2Y3lQeTBDS0dsM3FkdWdid1NKempaWEVN?=
 =?utf-8?B?U2hzUW1BZG81UlhuK2RsbXlWVHBnS0Y3b1RlcEJpam0zRkFaWGE4UktzZHdq?=
 =?utf-8?B?bTNNKzNVT2U5bitQQS9hNkN4bzYvNVQxV2hkbmk0M0E1emhqbmxSNUhhQzhK?=
 =?utf-8?B?VDUzc3B3Vy9aL09RbW5CRlQ0RG83WHR4OUkyU0hUazNoUGlKOHpiVUhlYlNx?=
 =?utf-8?B?RDFVdFlseExINDAzbUx4M0ZLTkVJQnNEdUNOelA4aFlGYWRaVDNUczNrTmZN?=
 =?utf-8?B?QmdJYmFUOEVYOWRUbHVhWTlCeDdJaVU0c05tdURORk0zcjVPd04zb3JLb080?=
 =?utf-8?B?UWFmbk84SE13MnF4VnRpeDNwb3htdXdiSi9OREJTUGhWYW1XVjhIVzVjUU84?=
 =?utf-8?B?K0Z0enQ1Y2I0ckRwbkdGeVNaTmVDRGNrSzR6WjV1ckRtMEVOSUs4UzBLdzFT?=
 =?utf-8?B?cHhoYlVUSi9CNnkrcW9aRzNQcDdSUjA3bmhjaisvRDA4Vmx5S1FFNW5palpX?=
 =?utf-8?B?WkduUHB0dTNTbWZxZEZ1VldXL2VXcVB3R21CREtBOGNsN0hndWVidllPTGgz?=
 =?utf-8?B?SS9Xb014ZkwyWU1IZ2pGTlBJaXpYY2tFTGdDajJtTGpCRlJaTlJ2UUxCK1lJ?=
 =?utf-8?B?MDc1ZHJyMkhwK2xkNUhYRmtIYmxjajl6OG5Ib0Q2Q3VQdWR4d2hUUzVDUHM0?=
 =?utf-8?B?Q0JkY01FWGJreFY1MHRxWEZXUUVWVmZFZjFLaWtsR29tYU1Pa0YwYTV6Rmkr?=
 =?utf-8?B?MGNZbnk5eHBMakwrU01Nb1JGeTZSTndtMGlvUWFWeXJiZXRxT2g4b3R1bzRr?=
 =?utf-8?B?ZG80bTZ2VFZPK0Z2NXVLcE9pR2YyOHd1ZElvRVJQaENURWVCcGFQcXMyOXRa?=
 =?utf-8?B?Uml5R1FQN0RpRytScXFadit6eU5OQ0V2UjY2a2diS1ZKaXBSTU9NUElpY0tl?=
 =?utf-8?B?S2RCTDQ1bWI4cEJiZVE0ZjV4NVgvUFdaNUR4VnV5ZnJodVpyRURoT2JMNjJF?=
 =?utf-8?B?YnF0SjJVM1V6blRCTncvRkwxeTJSdGRzdy9aclJDOXljZGk3UVljWnpVWWdm?=
 =?utf-8?B?dXVnTVRIcENVQndKTDljckJGK3d1SFJ0S0JhZWFBNnpNeE9MeWREYytONU1o?=
 =?utf-8?B?Tk8xU2FPRytXVDJuVkQvYzBrZGNjRVk5V3lXTjN2K1FYL1d0RjBQTWpieGZ0?=
 =?utf-8?B?Wlp3aWJXeDh4OHVQME15K3ljMkFpTkhJbEV2MHhvc1JWQ01tUFgraW5ZMk42?=
 =?utf-8?B?M2NWLzEyYVVYU0M1NDRlKzU5bG12ZjBQSUd2ZnFUSENyeUk4enV3SnpXa1lQ?=
 =?utf-8?B?MkwzdDJHcjYwUDVjQjlEaU5weGpNcWtiRk15Z1Nzd2Jwbll6NHlVbWY0WTRj?=
 =?utf-8?B?WUV2MitsQVhFM0pPclBmSHlha1RWWXpGZ3g4TjBjVXhKcER0NUJxRFlWa2M0?=
 =?utf-8?B?NFJTM3p1SnN0V2s2blFSM2I0ZndQYlZXUjNuNDNJaFVBdVNyeXM1anVvRmY0?=
 =?utf-8?B?aWVTMmFyQmppT2xmUE5wSTMveFNScldUcFZoa3ppQXdUekZEUVV2ZWpBRk8r?=
 =?utf-8?Q?8A85Xu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5112.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UExqSFlJVC9wSzRJZnVsYTVNSS9jL3dUU3diK1B5V1JpOEZuOHNNd3drMHJv?=
 =?utf-8?B?UE9laEk0WC9XVHZkN2xQK1VkTGVERWhPcklUL25XRDh5aWJ4Uk9vWlBPeEwv?=
 =?utf-8?B?NGRkc0NkaTZkQW9DWDdZcXJSWUd0TTd3Q3BhRk5mQ3Z0MG4yOEpXZkgxQWpY?=
 =?utf-8?B?cG11U3Q4dWxDOW9IUkVZWi9qaDRqMzJBZXc1WTJYQklTMFFxT1RDUTRpTWpj?=
 =?utf-8?B?blRNTU1NY3FkRHlEVFVybnd3OEU1VlBPWC9QVVFJRytZNTB4M2dZT3FMZmtL?=
 =?utf-8?B?Zm12RURteGE4ajZROVJ4K3U3TEhpL0RIVUlkbzdTWnlyc1dXUmxiQVF2YmRR?=
 =?utf-8?B?c2xQaytOaDdZZDE0QlRxRFFlRDdOWXFzbE44Z3ZvcmpFNHZGS2pPdUIxVi8v?=
 =?utf-8?B?SmcvMktQWjMwYnVPTWd6cE1JNmV2NEI5RVdwVEhSQUUrdGs0YWF4SjkvZzV0?=
 =?utf-8?B?RW9QZVpqT3pCdkQ0RWE3eWZhVXhpbEViY1VYcU5tU0lwd0NCNVRaeXAwV08x?=
 =?utf-8?B?N2daaDQ4M0Y3dlNtZUhDZ1oycFlmaVEzNHNCZ0gxMTFMZTY1RGhMejBaWUp2?=
 =?utf-8?B?Y3JkUldWQkt6MzNFWW9HenJMRkhiK3hCcTV1djBPUVFucTVsc3dzTmRoNHJp?=
 =?utf-8?B?Q291K0NVbzJpcGg2YzE5TDd0dWlNQUJJcWN5V0VYMnNCWGh6WW1iNGNnYVdw?=
 =?utf-8?B?bUxkRmgra3poMkdIcVd5Tjl4eTExL0ZJZlgrcjA3dU9xWTZWd2dyZGtTNWF3?=
 =?utf-8?B?OHdvUmc1cDd3TzNEZ0NiV3llR3VTNHd0WnJHSlNLQlpMMStRTXBNN2pybnVi?=
 =?utf-8?B?SUliZzhUUWhlQXdDVW1zbTRRREpjR2lWT3IrRlhNM01WaHhzVHVrQm9GTzB1?=
 =?utf-8?B?cHpuQzE4TGc4VStzVk1iTHJrWWxkQVVyMENXaEM1SHNOUlRnRERlcVUvL0kv?=
 =?utf-8?B?aS9yTEZFSWZkUS9jaG5JZmhqRWFudzJHdXhnL1pSTjdWZEtpdGJ1V3d2ZWM4?=
 =?utf-8?B?RkVxWm5OQy95Sm1qVUEvNXVFRUNMYUNySWVoVGRSdWJEN2owd3dBeVhGSUFL?=
 =?utf-8?B?d3RJUVpYM0dBTlhiaWZib0p5aU5TWkFnS3VzQ21OdjBCQTZpVUFMb1RqeGY0?=
 =?utf-8?B?c3pyK1c2MGN0MGhSc2VrQVBLUWRnZTlCK0NJMnpvbmZkVU5MNjBkdnFkQUhi?=
 =?utf-8?B?RU43T0h0OFBkSFVhWG1tL1dITytCOG8yQi91RGRMVko4OE1iS1RTdStEaGNT?=
 =?utf-8?B?bTQ1YXozaElxdkcwTnFEaXJkbXRwQlpRdFZHQjB2SSsyZU4zaEprdTJoT3ha?=
 =?utf-8?B?bHhqMU9uTW94T1hqT2dmckpNTmdGQ1J1bytvb1JKQzZ6OWFRRkFJZ1hET0xQ?=
 =?utf-8?B?cjdRRmxaQVZVbngrTVNSVmxkZ05ndGtHaUtjRHJEWkdGQTJNN1BvZDhsa1cw?=
 =?utf-8?B?UEJTODRDRHVORUZqaU5mMWJYbHdFY2xlLzl6SE5MMFA4TEkwU2FhdkRiVUFO?=
 =?utf-8?B?OUFjS2t5VmhDYTh6N0VKbzdPcytVWGo1VXZWYnpRYWxEcUIzbnJpc3J2UjhM?=
 =?utf-8?B?K2ltUy9vWVR3VW1tbEsrZHpBNHZFZzY4Rk5rSHJkODNiOXpFUEpaeSswelUr?=
 =?utf-8?B?WFYrTjFDUERUaHlqdU1ESlNsVWcyaHZkQ0x5ZWplYnJDZnhqcHArU3RIRExB?=
 =?utf-8?B?dHN2SkJiRkFDSndycDdSZk0zc2N4U3lsZ0ZBaWlKdWZiam9kdlRuMFVnY0dL?=
 =?utf-8?B?WDF6c3dqdEE2WUhXaVJKZzdXR3lyT2ZnQWlZdWFITEJsVXgrbkZJOG1DaTZE?=
 =?utf-8?B?ZjRldnpqY2hoYXlRejJ2YjZaVytnS3d5cmpzS3ZIR0drRGgyZmVuVlhFbU05?=
 =?utf-8?B?ZnlNMWtDdW5CdXBHMk9qSGJhU2JPa1B5S3RQcXAxWWZuNkQ1S1NvU2VvWGp2?=
 =?utf-8?B?b3VWZ25jUlZSYzhQVzBlTXN6bTBwemZ6UEZpSzBmdjJEenhyck5VOG9KbE4y?=
 =?utf-8?B?SitITG51dUhxeDRyQ3NKZXVic0J4OXo5cGt6Qmp2ODFDSndvR3ZzeDNFVWha?=
 =?utf-8?B?bnJzN2dTT3MxRlZudmZvODBmeEtZSTlHZ3ZjVXEvOHJBaTNlT2VnUHFTVGVv?=
 =?utf-8?Q?Dyp2Jv8hb1PqoB6AhezUR2OMD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5112.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79406658-b826-4bcb-b61f-08de2943ad29
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 21:19:37.7707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7AUuObrn6K+3onJ4vrRXfHojXBdz6i4Jj61mC0n7sHKxw61VPrgt/+JBiHWtylOpPnxorDgM8xF9tOskDU4SSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5112
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

SGkgRG1pdHJ5LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERtaXRy
eSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+DQo+IFNlbnQ6IEZyaWRh
eSwgTm92ZW1iZXIgMjEsIDIwMjUgMTowNCBQTQ0KPiBUbzogS2ltLCBEb25nd29uIDxkb25nd29u
LmtpbUBpbnRlbC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBh
aXJsaWVkQHJlZGhhdC5jb207IGtyYXhlbEByZWRoYXQuY29tOyBuaXJtb3lkQG52aWRpYS5jb20N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAzLzNdIGRybS92aXJ0aW86IEFkZCBQTSBub3RpZmll
ciB0byByZXN0b3JlIG9iamVjdHMgYWZ0ZXINCj4gaGliZXJuYXRpb24NCj4gDQo+IE9uIDExLzIx
LzI1IDIxOjEyLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6DQo+ID4gSGksDQo+ID4NCj4gPiBPbiAx
MS8yMC8yNSAwNDo0MSwgS2ltLCBEb25nd29uIHdyb3RlOg0KPiA+PiBIaSBEbWl0cnksDQo+ID4+
DQo+ID4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4gRnJvbTogRG1pdHJ5IE9z
aXBlbmtvIDxkbWl0cnkub3NpcGVua29AY29sbGFib3JhLmNvbT4NCj4gPj4+IFNlbnQ6IEZyaWRh
eSwgTm92ZW1iZXIgMTQsIDIwMjUgNToxNiBBTQ0KPiA+Pj4gVG86IEtpbSwgRG9uZ3dvbiA8ZG9u
Z3dvbi5raW1AaW50ZWwuY29tPjsgZHJpLQ0KPiA+Pj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+ID4+PiBDYzogYWlybGllZEByZWRoYXQuY29tOyBrcmF4ZWxAcmVkaGF0LmNvbTsgbmly
bW95ZEBudmlkaWEuY29tDQo+ID4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDMvM10gZHJtL3Zp
cnRpbzogQWRkIFBNIG5vdGlmaWVyIHRvIHJlc3RvcmUNCj4gPj4+IG9iamVjdHMgYWZ0ZXIgaGli
ZXJuYXRpb24NCj4gPj4+DQo+ID4+PiBPbiAxMS8xMy8yNSAyMzo0NywgS2ltLCBEb25nd29uIHdy
b3RlOg0KPiA+Pj4+PiBPbmUgb3B0aW9uIGNvdWxkIGJlIHRvIGV4cGxpY2l0bHkgZGVzdHJveSBh
bGwgc3RvcmVkIG9ianMgdXBvbg0KPiA+Pj4+PiBoaWJlcm5hdGlvbiwgdGhhdCB3YXkgdGhlIHJl
c3RvcmluZyB3aWxsIGFsd2F5cyB3b3JrLg0KPiA+Pj4+IFllcywgd2UgY2FuIGRvIGl0IHRvIGF2
b2lkIHRoYXQgY29ybmVyIGNhc2UuIE9yIG1heWJlIHdlIGNhbiBqdXN0DQo+ID4+Pj4gbGV0IGl0
IGp1c3QNCj4gPj4+IHJ1bi4NCj4gPj4+PiBJbiB0aGlzIGNhc2UsIHZpcnRpb19ncHVfb2JqZWN0
X3Jlc3RvcmVfYWxsIHdvbid0IGZhaWwgYXMgc2htZW0NCj4gPj4+PiBpbml0IHdpbGwgc3RpbGwg
d29yayBidXQgUUVNVSB3aWxsIGp1c3RzZW5kIGJhY2sgZXJyb3JlZCByZXBsaWVzIGFzDQo+ID4+
Pj4gYWxsIG9mIHRob3NlIHJlc291cmNlcyBmb3IgQk9zIGFyZSBzdGlsbCB0aGVyZSBpbiBRRU1V
IHNpZGUgYnV0IEkNCj4gPj4+PiB0aGluayBpdCB3b24ndCBicmVhayBhbnl0aGluZy4gRG8geW91
IHNlZSBhbnkgaXNzdWVzIGluIGRvaW5nIHRoaXMNCj4gPj4+PiB0aGF0IEkgbWlnaHQgYmUgbWlz
c2luZz8/IE15IGFzc3VtcHRpb24gaGVyZSBpcyB0aGF0IHRoZSBRRU1VDQo+ID4+Pj4gaGFzbid0
IGRvbmUgYW55IG9mDQo+ID4+PiB2aXJ0aW8tZ3B1IHJlc2V0cyBoZXJlIGFzIGhpYmVybmF0aW9u
IGZhaWxlZC4NCj4gPj4+DQo+ID4+PiBDb3JyZWN0LCBRRU1VIHdpbGwgZW1pdCBhIHRvbiBvZiAi
cmVzb3VyY2UgYWxyZWFkeSBleGlzdHMiIGVycm9ycyBvbg0KPiA+Pj4gYWJvcnRlZCBoaWJlcm5h
dGlvbi4gVGhlcmUgc2hvdWxkIGJlIG5vIGVycm9ycyBuZWl0aGVyIGZyb20gZ3Vlc3QsIG5vcg0K
PiBmcm9tIGhvc3QuDQo+ID4+PiBOb3RlIHRoYXQgUUVNVSBpcyBub3QgdGhlIG9ubHkgVk1NIHVz
aW5nIFZpcnRJTy1HUFUuDQo+ID4+Pg0KPiA+Pj4gVHdvIG9wdGlvbnMgaGVyZToNCj4gPj4+DQo+
ID4+PiAxLiBEZXN0cm95IHN0b3JlZCBob3N0IHJlc291cmNlcyB1cG9uIGhpYmVybmF0aW9uIDIu
IEV4dGVuZA0KPiA+Pj4gaGliZXJuYXRpb24gY29yZSBbMV0gd2l0aCBhZGRpdGlvbiBvZiBQTV9I
SUJFUk5BVElPTl9VTlBSRVBBUkUgZXZlbnQNCj4gPj4+IHRoYXQgd2lsbCBiZSBpbnZva2VkIHdo
ZW4gaGliZXJuYXRpb24gZmFpbHMsIHdoaWxlDQo+ID4+PiBQTV9QT1NUX0hJQkVSTkFUSU9OIHdp
bGwgYmUgaW52b2tlZCBvbmx5IGFmdGVyIGEgc3VjY2Vzc2Z1bA0KPiA+Pj4gaGliZXJuYXRpb24N
Cj4gPj4+DQo+ID4+PiBZb3UgbWF5IHN0YXJ0IHdpdGggaW1wbGVtZW50aW5nIHRoZSBmaXJzdCBv
cHRpb24gcmlnaHQgYXdheSBhbmQNCj4gPj4+IGxhdGVyIGltcGxlbWVudCB0aGUgc2Vjb25kLg0K
PiA+Pg0KPiA+PiBJIGFtIHRlc3RpbmcgdGhlIGZpcnN0IG1ldGhvZCAtIHNlbmQgdW5yZWYgbWVz
c2FnZSB0byBRRU1VIHNvIHRoYXQNCj4gPj4gY29ubmVjdGVkIHJlc291cmNlcyBjYW4gYmUgYWxs
IHJlbW92ZWQgZnJvbSBRRU1VLiBCdXQgSSBmb3VuZCBvdXQNCj4gPj4gdGhlcmUgaXMgY2IgdGhh
dCBjbGVhbiB1cCB0aGUgb2JqZWN0IG9uY2UgdGhpcyB1bnJlZiBpcyBwcm9jZXNzZWQgYW5kDQo+
ID4+IHJlc3BvbnNlIGlzIHJlY2VpdmVkLiBJdCBtZWFucyB0aGF0IHdlIGNhbid0IGp1c3QgcmVt
b3ZlIHRoZQ0KPiA+PiByZXNvdXJjZS9ibyBvbmx5IGluIFFFTVUgc2lkZS4gVGhlcmUgaXMgYSB3
YXkgdG8gZG8gdGhpcyB0aG91Z2guIFdlDQo+ID4+IGNhbiBzaW1wbHkgYWRkIG9uZSBtb3JlIGZ1
Y3Rpb24gaW4gdmlydGdwdV92cS5jIHRoYXQgaGFuZGxlcyB1bnJlZiBidXQgd2l0aA0KPiBjYiA9
IE5VTEwuIElzIHRoaXMgd2hhdCB5b3Ugd2FudCB0byB0cnkgb3IgZG8geW91IGhhdmUgYW55IGJl
dHRlciBpZGVhcz8NCj4gPiBUaGUgY2IgY2VydGFpbmx5IHNoYWxsIG5vdCBiZSBpbnZva2VkLiBZ
b3Ugb25seSBuZWVkIHRvIHNlbmQgdGhlDQo+ID4gIkRFVEFDSCIgY21kIHRvIGhvc3QuIFRoaXMg
c2hvdWxkIGJlIGFraW4gdG8gd2hhdCBJIGRpZCBpbiBteSBvbGRlcg0KPiA+IHBhdGNoZXMgYWRk
aW5nIG1lbW9yeSBzaG1lbSBzaHJpbmtlciBzdXBwb3J0IHRvIHZpcnRpby1ncHUsIHBsZWFzZSBz
ZWUNCj4gPiBbMV0gZm9yIGluc3BpcmF0aW9uLg0KPiA+DQo+ID4gWzFdDQo+ID4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjMxMDI5MjMwMjA1LjkzMjc3LTI2LWRtaXRyeS5v
c2lwZQ0KPiA+IG5rb0Bjb2xsYWJvcmEuY29tLw0KPiANCj4gQWN0dWFsbHksIGluIHlvdXIgY2Fz
ZSBpdCB3aWxsIGJlIHRoZSAiVU5SRUYiIGNtZCwgbm90ICJERVRBQ0giLiBCdXQgdGhlIGlkZWEN
Cj4gaW4gdGhlIHNhbWUsIHlvdSBuZWVkIHRvIGRlc3Ryb3kgcmVzb3VyY2Ugb25seSBvbiBob3N0
IG9uIHN1c3BlbmQuDQoNClllcywgdGhpcyBpcyB0aGUgcG9pbnQuIEN1cnJlbnQgdW5yZWYgY29t
bWFuZCBhbHdheXMgY29tZXMgd2l0aCBhIGNhbGxiYWNrIHRoYXQgDQpjbGVhbnMgdXAgdmlydGlv
LWdwdSBibyBvbiB0aGUgZ3Vlc3Qgc2lkZS4gT25lIHdheSB0byBhdm9pZCBpcyB0byBpbnRyb2R1
Y2UgYW5vdGhlcg0Kc3BlY2lhbCB2ZXJzaW9uIG9mIHVucmVmIHRoYXQgZG9lc24ndCByZWdpc3Rl
ciBhbnkgY2FsbGJhY2sgb3IuLiBJIGFtIHdvbmRlcmluZyBpZg0Kd2UganVzdCBtYWtlIHZpcnRp
by1ncHUgZHJpdmVyIGlnbm9yZXMgdGhhdCBjYWxsYmFjayBpbiB0aGlzIHNwZWNpZmljIHNpdHVh
dGlvbiAocHJlDQpoaWJlcm5hdGlvbj8/KS4gRWl0aGVyIHdheSBsb29rcyBsaWtlIGEgZGlydHkg
aGFjayB0byBtZSB0aG91Z2guIFdoYXQgZG8geW91IHRoaW5rPw0KDQo+IA0KPiAtLQ0KPiBCZXN0
IHJlZ2FyZHMsDQo+IERtaXRyeQ0K
