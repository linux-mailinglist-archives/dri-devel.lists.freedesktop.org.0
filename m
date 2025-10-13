Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3064FBD351E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A817410E398;
	Mon, 13 Oct 2025 14:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="REJln2UQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6861C10E38B;
 Mon, 13 Oct 2025 14:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760364170; x=1791900170;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nTrWAaA8RbuDig6+aKNEz//PefIBcweY+A2lSDeQWWY=;
 b=REJln2UQ2Sx3GjsPpmo2p1kzAdG6A4JTrN/2+RTj8TrhISyknQVkRG9f
 So+kiMzBHyF8UzB3HKFo25xu1kQvSbdaxsB8f2Z0DCL7EbxInU3QtPGCf
 VQzea1VI9c4PsKUFUzh7EAR3k0xO+y2GTG51MfTjPqynFar7gyyVZuaCr
 SGwDnzAWP+mhGdaEFDMbdQvECVCSXIqMsoYes/jWlL/AehsuCz9O6+Tn2
 pUHLi5sC7UTSfx7AYQwmEpJxLMJhX/nUpXObyuywzY09r5AlPU2nOCMl9
 TDZmmGVSsrxQHsEQ4j69Rn53zlVMwx0WTfBMcGgKyTwymXzJ5QOMZEyun w==;
X-CSE-ConnectionGUID: rD/4QZgXQ+6PL/AvgnAflQ==
X-CSE-MsgGUID: jofEfwUTSe2Oy31HmfLUXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73606546"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73606546"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 07:02:47 -0700
X-CSE-ConnectionGUID: +80mbEQgQAeNv/GwxPchbA==
X-CSE-MsgGUID: 87ilfGwkTy6bYX38lv9ZPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="182042256"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 07:02:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 07:02:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 07:02:45 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 07:02:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHxzBp36+w2OSELkysVYFC52CHJ9x2XRbMjHK8jAGf3mpDeVjZcLawMcpls/kUm3RyGAEo8YZmkYzo1xQlcjAwLkBBqVwyoDd5vfU6X/n5DFs5MgZCixPbZVvef8A7u0kBG5AA5KYgnhqg0TsGP+0pj5R7ZD5VbV4Vr5noLqjA3wkrdQwHapFrhsEDVmRdEuuyUL/qfm7B0GW7b1rzrd6DFz2X8zUwmwTvXd3XdXtHIQ5DsFmOM7Hph6Ly6+chlqlreZ6Z2vlXRj9QNO0zuRiM5GUrKwwAzNR+QrUWjPNiNNLPevRS33In53S73gW3Jaj9rvPEfnJwUi3uuTArSTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQZGgpOQmlt3WMwOn/AGeM/UcmXvq8ZsEc0fbb3R3g4=;
 b=kW+dAzOu5E5R4Eb4yj1aJHafqKXBbHA/DNqBW3dHAqDu0RMT8QvCF8Adlerkt0sRITJ61wbtwCSmaAmo8LNicpHmHoIXAEpz013OtNDKFPDzJ8NQQq/Y0n4khwMwlV7Lo+TVVKgzFBBd0GRChpDyuPQtpp0FftV8nXvwFxqYz3w+z5+3Ia2l+Xyyp1SXSE8XnEgJtVbDHJwX1nc2R4NBCyjxwUwwUDVU17Nqp6gxouhE+tgY5SCy6Ew9Btfp+DHDcwHFtFmPrZYjyNFvOuxAT7U31/scQNfzGflzS564+YA0d5wDRwnrUPUeQzx3BfG5OofuAUJlA5obHPr3KdqMkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB5772.namprd11.prod.outlook.com (2603:10b6:a03:422::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 14:02:42 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 14:02:42 +0000
Message-ID: <7cacd33e-e8f2-486b-a507-9b9259e4473d@intel.com>
Date: Mon, 13 Oct 2025 16:02:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/26] drm/xe/pf: Export helpers for VFIO
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-26-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251011193847.1836454-26-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0289.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: db97bc17-4e30-48d4-34cc-08de0a612d68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmRCWHp3Yjd2bTdTNVlzY1R5UVc2dm5MSWk2QXRhdnJpYXB3b0lRWU1uazFE?=
 =?utf-8?B?K1VBZ1kydlFoRXhPNDNaQ2FlS3dlQzlxVjl5ZlpCaVoyVE9lTWVWS3FuWEdX?=
 =?utf-8?B?d0NYWDF1UXZ5dG9weVdIcDVqaTNxdStqanBVNkpkZmVxczhIaGZNZEt4ZWhB?=
 =?utf-8?B?WmNMazU3em1Dck5uclhockgvbTlwZ1BiRllwR0p2a005SW1iajlDVDJIcXhT?=
 =?utf-8?B?QmU3RXY2T0diRHRJUGdnQU1SMVEvZnJoR0wwenU2STVlTDBQNkVyYlVMcC9I?=
 =?utf-8?B?T1duNnN4T21jM01hWU4vTTlOSGQ4bTdzYTB1dEhGdlNmVjRaYUdodjh0Z01B?=
 =?utf-8?B?NWdtUFVON0xUcWpCTHB6Qk1vVzhvK01MMllONldqUERhMTVYWVhaMHBLR1Zi?=
 =?utf-8?B?MGkxMktqYlkwOU9RQ1dwRm5CNVFNR1RGZE9nZTY5S0cyaC90T002OWRKM2JJ?=
 =?utf-8?B?c1YrU1pteTNlZGVKbTFSODFDakVKb3R4NEpGVUJXY0haZ0RnTlgwUGlWZHR5?=
 =?utf-8?B?NXMwa0NONGJxUE1iMFBBZVU2V0lKV240MTBiNGIrS2tZZmpPQjBoQytwU3Fk?=
 =?utf-8?B?WnhmU3Jmdm13WHFpSmN0d05EQ1pydXZ6eVdCaDVTS2tDckdDTk9RWUJGb0Jx?=
 =?utf-8?B?bU10NHhXL3R2NmdEODhSTnY4OTZENFFodHhFakVTTkE2K214clZnRjM3cTBJ?=
 =?utf-8?B?SDQvOE5KSkdwM1l6T2pSeENPbXpLajBJelYzeEZzZUl4bHhaM0poY2JsWlhC?=
 =?utf-8?B?ZzBFQ2dOWGovY21vZFhkaEVFWlNSNTdxamoralA5TWJMVzNnbXU2dHB2QWpB?=
 =?utf-8?B?KzUzQUZjSEFpWVNTa2hUMkRwMzdWbGh3UWY4SlNENGdXNXpRY3hZUCt2c2Zp?=
 =?utf-8?B?RHlLUm5nUS9hcm53Z0xQcDF4MVpOYnhOTElEeDM4TFFpMTR2RUFOZFlibE5y?=
 =?utf-8?B?UlpjZjkwUk5CY29SWGY5cTdic092MTZKTVIvV1l1cGNOak1neEpBcE1Hby91?=
 =?utf-8?B?VU9hczFROHpCeVBHOXRLeFI4eWZKUS8ycS9OL09NSGY1cnlGbEgrMHVRWHZ4?=
 =?utf-8?B?clJTZHRiSUh4ek5wMjdNNFVuS3hpbUl4YXordXJtTjAyeTVsb2ZkQTFkYnk5?=
 =?utf-8?B?bCtnNXBHcjBSdzlmMFgvYmUxRVlxdHJaUFpjVHRJbU5yWG5OWi9sOUMwa3gx?=
 =?utf-8?B?YTJLNTVJY1JnV0ROejVsWnB4dGs4eWJ4Y3VOMHZZYVhkTy9MV29xQlB0b1pW?=
 =?utf-8?B?c1orZ0ZIVEZkaHhSaEdiRk5CYkYweTY2U2hYUlUyMG9pV0wrYVZvd2xkR2xY?=
 =?utf-8?B?VER6eUZIZk9mdk5zUkJQOTVZSlhlYlBBV2wzd1N2Nm9RQWZsTUtWajNuYm5C?=
 =?utf-8?B?WFk5NHBCY0FQTzljVkdFeDl5NC9jY3dlRU9ObTFlbXpoQXA5bkRZNmxHdzJV?=
 =?utf-8?B?dUhORnVsL2RhWkhObVV6SXRSblFZNnluSi9Fa0FvYm9ZQnE2L1YxcVRRWlQ0?=
 =?utf-8?B?Wm9XNk81dGNzUk1ucnpoSGRQQUhOTmxPdXNQdXptOFM0WHcrTG5DVFZveTB1?=
 =?utf-8?B?L1RlU2grQnNwRHJZNjlwMkw0dzNuM1duc1hYR2htalN3ajI1R21SSTJZTExV?=
 =?utf-8?B?OXFOUlNwRHpodmRCVFlKZzBMZmp1dWhaaXVBUUFnQ1czSkpQNlRPTytCUGdm?=
 =?utf-8?B?MCtqMUttTTBLN0ZTTnhISnRVWitYS3RxWjUrK3ZZeGEvbng5dkh2WHRValJh?=
 =?utf-8?B?dXJOS0h2dzY3Z1pBRk9JUkZHOWt6U0NzQUI1NXN3dmJTYmE3NkFBZDJBNmMv?=
 =?utf-8?B?Q21XWmNiYm9sQ0x0d2tsV1VIVUtKVGhqUlUwNldMZVFNRnpQWDZlQ0Q1UjU2?=
 =?utf-8?B?VXI4Wk1VZ096dnFKTzJmVkJEcjhGL1NmeFU1ckYvdE1MVHRWbXo0b2VCNlIw?=
 =?utf-8?B?anZCWHVJd1JFQ05NVEF0c1RXWVY3S2drVE9nN05KdlZwNmlRVUtrcFF0S2pp?=
 =?utf-8?Q?QiJXOUajJVR/MUHJSylWPJ3dmqSsVE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVhnZFVCNktmUTNCOHRUbHNGbVR6WjA2UmFua2RGOTNNc2ZNZSt3am4rVU1T?=
 =?utf-8?B?alY0UDVSekJYdCtiNDBqQ1FJVENhekI1TStoeXp6ZnJiL2huNVFoYVBLZ1U0?=
 =?utf-8?B?V05tYjhJZTdmbTNVdVlCdjV1eFJ5amNTeG9XTXFtZk8vV01aZDJ1dVRVQ1dP?=
 =?utf-8?B?b05Xa1loSWw1Rkx3dGpFSy9hQ0kwLzFDckFZbUxEa2hzdjZycDNwbGVhSVN3?=
 =?utf-8?B?N0xVRWNRSm1HRVhVeEZpeTRYbU14aXJKcU0xVi9sSWZNT1RpOWo3UGcwNTZ2?=
 =?utf-8?B?dXR3RVhzU3FIYTJ1UUxwWlBFTEI5elhySnJSNVNiRE1sM2pHTG40ZW4wR0tP?=
 =?utf-8?B?bXhKWVBxUCtrMmx4NjJ1bUhzQ2s0Sm5kTEg2ZHNxVlFFdExmVVFNbU5jUU9E?=
 =?utf-8?B?Yy8rQUJQTFJ6VG9rbFVHZi9oR3lHYmtYeGI3bHdoMFo4Nk9aUVB0ZFZmWnVD?=
 =?utf-8?B?ZkFyMTdWSnFnNDBEWk0xcVFML3h4U0k4NU1taEtmUTdXV2xyUHZMR2Nkc3ph?=
 =?utf-8?B?NUJlY2FsMmJiVkhZM0wvWHVIK3hoK0piOWVDc1NlM0xQOXVZSnB4cE5SQVlk?=
 =?utf-8?B?WS9mdyt1bEw2R3JwTEc1WkJCYXZKR3AwcFlDNVdOUFdMb0NUZWFoQ09ra1Qw?=
 =?utf-8?B?dXdYMzNXKytWTkllK2RpVUR1bGtFY1N2dkE2S3c3Z0VPYkVHNFYzblIyTm5v?=
 =?utf-8?B?bjZEYkF3dDhqOUhDMjJpMWJIU3FpbllaNHZtbjhaR2I1NTgzOWQySTFuVkJ3?=
 =?utf-8?B?ei83c3ZYd1lwa3M0NGc5c1JTUHpLZC9SaGYreVk0SmhkaGVGVGxyMlFnRURr?=
 =?utf-8?B?SzRQRXVuVXBFcElJQThLMEw5RjhkQkpXYlRuWVVNSllNaW83Z0NjbjFRNmdP?=
 =?utf-8?B?a0dMNHc4RkpjWVJPTU4yMmdEckl6cVhlejVyOUljYWFDdnc2S2ZkQ1hadm9o?=
 =?utf-8?B?QWYvc0xNUndxZ2hOVUt3eDRLL0RTdTRkUitZdkxoMUJ2dDgra0JiVzdVM1BR?=
 =?utf-8?B?YmltcS9YN1U0MjdwZk5tcmxiRUVaT0RkOGZBTGs0Rm4yUkF5TnB4NTIrVTJH?=
 =?utf-8?B?c28yTUJWQ1p5M3hoMEZXVzJlcVhVRTIzWjlNTllvcy9ad2hEREdteFZocWdt?=
 =?utf-8?B?QmhwUlR6Y0tYTWw3ZTgzNDFyVkVIemlOVnRFT0JIUUJhQ3RPRlB0c0F1emQx?=
 =?utf-8?B?NXRXWldXL3BOTXQxbUFOcEhrdHk0YWdKZE5Jd0lSWjFlK3BSVXlJaW1FNm1v?=
 =?utf-8?B?TXZ4TktrREJQODIwT1g1WUNScURwNlRXSGR4MWZRb3BPdkJQaUhJK2ZtK25o?=
 =?utf-8?B?OVplYllzWXJRT1hZOFVqaXEvYmdzemlicjhzS2wyR0M1UWJHcURlMjl3NFpu?=
 =?utf-8?B?RzNtWERncUpaZjBHS3czMEVISzA4NXlyeHZybXVnWkRaRTdsNUpGS1piYnc1?=
 =?utf-8?B?UWtlc29tQ2E1Q3g3WmxSOSswNUoyK2RpVHdBVDJoblVyWk9IUVliVGF0QWRI?=
 =?utf-8?B?UzFWMjVKUUVlN0ZUemhPUmVsT1R4TGVwcmszUG5ZdEFrNjZRRVlHQTZQSzlO?=
 =?utf-8?B?a3RJYlk1ejA5K3BrUXI2RDZJL29GSW12SmpnTVlQZlI3aVl6UDZKNzFyN2V3?=
 =?utf-8?B?Qk9hN1JUWFdBZW1hRVNMbzU5cndXNnp0QWpqWEd4Nm02Qk9lSC9NcUJzMzRF?=
 =?utf-8?B?dVRKWXdVV3UrbkF2ZEtabGtxVDVvY2lWZlVpbi9mbWk0L0MzVjErQk02dWs5?=
 =?utf-8?B?dk82RTA0c0hpQ3IxRlBpQzVlbHVZUktURVNNNzZnT0tCMTdrdlppZW1VWmZ5?=
 =?utf-8?B?Y3d5YXB3UDFGSnplQWJ4RnpJQ2pRV3FkQjVlbFViaXRFME1pZ2trb1hnYVBU?=
 =?utf-8?B?bHVyUGdpOHRiMXRtSk1USjlYbnZuOFd2VWpwSkVaWEplaVVMam5IMUdocit3?=
 =?utf-8?B?WStOUENIR0lOd0NMOGhla3JEUmhZRUllVW44bEpjc2loSERlSG5KMldlOHNt?=
 =?utf-8?B?eEY0TjZlNmpyTGVqaHVyZVgyWStIWUtveVRuWFRkQUk5TGpXSzd4ai8rTlg5?=
 =?utf-8?B?MjNQNWZZNFJzaTZ1ZkdkZlN0OEZoZ01pUjdoS0p6RjBRK2VHK29udWZCd2Z1?=
 =?utf-8?B?NW5TNGFlNVV4RHVhaW1zdXFaUDZycnpNMC96cHVXcFFPN2xKNU95MnNROUpB?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db97bc17-4e30-48d4-34cc-08de0a612d68
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 14:02:42.6043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LONx3SMikNJuZqH63sjARzsEQMcUCHcqP29xLfhe8eNaFUyQTzt1fc8pPq5efr4JFVGWM9Sww2OOw626N/VP6Y2rbdx7NNNoZcpNYy/jtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5772
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



On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> Vendor-specific VFIO driver for Xe will implement VF migration.
> Export everything that's needed for migration ops.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile        |   2 +
>  drivers/gpu/drm/xe/xe_sriov_vfio.c | 252 +++++++++++++++++++++++++++++
>  include/drm/intel/xe_sriov_vfio.h  |  28 ++++
>  3 files changed, 282 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
>  create mode 100644 include/drm/intel/xe_sriov_vfio.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e253d65366de4..a5c5afff42aa6 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -181,6 +181,8 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_sriov_pf_service.o \
>  	xe_tile_sriov_pf_debugfs.o
>  
> +xe-$(CONFIG_XE_VFIO_PCI) += xe_sriov_vfio.o
> +
>  # include helpers for tests even when XE is built-in
>  ifdef CONFIG_DRM_XE_KUNIT_TEST
>  xe-y += tests/xe_kunit_helpers.o
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vfio.c b/drivers/gpu/drm/xe/xe_sriov_vfio.c
> new file mode 100644
> index 0000000000000..a510d1bde93f0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vfio.c
> @@ -0,0 +1,252 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <drm/intel/xe_sriov_vfio.h>
> +
> +#include "xe_pm.h"
> +#include "xe_sriov.h"
> +#include "xe_sriov_pf_control.h"
> +#include "xe_sriov_pf_migration.h"
> +#include "xe_sriov_pf_migration_data.h"
> +
> +/**
> + * xe_sriov_vfio_migration_supported() - Check if migration is supported.
> + * @pdev: PF PCI device
> + *
> + * Return: true if migration is supported, false otherwise.
> + */
> +bool xe_sriov_vfio_migration_supported(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	return xe_sriov_pf_migration_supported(xe);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_migration_supported, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_wait_flr_done - Wait for VF FLR completion.
> + * @pdev: PF PCI device
> + * @vfid: VF identifier

or

 * @pdev: the PF struct &pci_dev device
 * @vfid: the VF identifier (can't be 0)

> + *
> + * This function will wait until VF FLR is processed by PF on all tiles (or
> + * until timeout occurs).
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_wait_flr_done(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;

you also need to validate:

	vfid != PFID
and
	vfid <= xe_sriov_pf_get_totalvfs()

this applies to all exported functions below
> +
> +	return xe_sriov_pf_control_wait_flr(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_wait_flr_done, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_stop - Stop VF.
> + * @pdev: PF PCI device
> + * @vfid: VF identifier
> + *
> + * This function will pause VF on all tiles/GTs.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_stop(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	xe_pm_runtime_get(xe);

maybe we should use xe_pm_runtime_get_if_active() to avoid awaking PF if there are no VFs?

when VFs are enabled xe_pm_runtime_get_if_active() will always return true


> +	ret = xe_sriov_pf_control_pause_vf(xe, vfid);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_run - Run VF.
> + * @pdev: PF PCI device
> + * @vfid: VF identifier
> + *
> + * This function will resume VF on all tiles.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_run(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_sriov_pf_control_resume_vf(xe, vfid);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_run, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_stop_copy_enter - Copy VF migration data from device (while stopped).
> + * @pdev: PF PCI device
> + * @vfid: VF identifier
> + *
> + * This function will save VF migration data on all tiles.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_stop_copy_enter(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_sriov_pf_control_save_vf(xe, vfid);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_enter, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_stop_copy_exit - Wait until VF migration data save is done.
> + * @pdev: PF PCI device
> + * @vfid: VF identifier
> + *
> + * This function will wait until VF migration data is saved on all tiles.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_stop_copy_exit(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_sriov_pf_control_wait_save_vf(xe, vfid);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_exit, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_resume_enter - Copy VF migration data to device (while stopped).
> + * @pdev: PF PCI device
> + * @vfid: VF identifier
> + *
> + * This function will restore VF migration data on all tiles.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_resume_enter(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_sriov_pf_control_restore_vf(xe, vfid);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_enter, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_resume_exit - Wait until VF migration data is copied to the device.
> + * @pdev: PF PCI device
> + * @vfid: VF identifier
> + *
> + * This function will wait until VF migration data is restored on all tiles.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_resume_exit(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_sriov_pf_control_wait_restore_vf(xe, vfid);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_exit, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_error - Move VF to error state.
> + * @pdev: PF PCI device
> + * @vfid: VF identifier
> + *
> + * This function will stop VF on all tiles.
> + * Reset is needed to move it out of error state.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_error(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_sriov_pf_control_stop_vf(xe, vfid);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_error, "xe-vfio-pci");
> +

add kernel-doc

> +ssize_t xe_sriov_vfio_data_read(struct pci_dev *pdev, unsigned int vfid,
> +				char __user *buf, size_t len)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);

missing param validation

	is PF
	is valid VFID

no RPM ?

> +
> +	return xe_sriov_pf_migration_data_read(xe, vfid, buf, len);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_read, "xe-vfio-pci");
> +
> +ssize_t xe_sriov_vfio_data_write(struct pci_dev *pdev, unsigned int vfid,
> +				 const char __user *buf, size_t len)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +
> +	return xe_sriov_pf_migration_data_write(xe, vfid, buf, len);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_write, "xe-vfio-pci");
> +
> +ssize_t xe_sriov_vfio_stop_copy_size(struct pci_dev *pdev, unsigned int vfid)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +
> +	return xe_sriov_pf_migration_size(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_size, "xe-vfio-pci");
> diff --git a/include/drm/intel/xe_sriov_vfio.h b/include/drm/intel/xe_sriov_vfio.h
> new file mode 100644
> index 0000000000000..24e272f84c0e6
> --- /dev/null
> +++ b/include/drm/intel/xe_sriov_vfio.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_VFIO_H_
> +#define _XE_SRIOV_VFIO_H_
> +
> +#include <linux/types.h>
> +
> +struct pci_dev;
> +
> +bool xe_sriov_vfio_migration_supported(struct pci_dev *pdev);
> +int xe_sriov_vfio_wait_flr_done(struct pci_dev *pdev, unsigned int vfid);
> +int xe_sriov_vfio_stop(struct pci_dev *pdev, unsigned int vfid);
> +int xe_sriov_vfio_run(struct pci_dev *pdev, unsigned int vfid);
> +int xe_sriov_vfio_stop_copy_enter(struct pci_dev *pdev, unsigned int vfid);
> +int xe_sriov_vfio_stop_copy_exit(struct pci_dev *pdev, unsigned int vfid);
> +int xe_sriov_vfio_resume_enter(struct pci_dev *pdev, unsigned int vfid);
> +int xe_sriov_vfio_resume_exit(struct pci_dev *pdev, unsigned int vfid);
> +int xe_sriov_vfio_error(struct pci_dev *pdev, unsigned int vfid);
> +ssize_t xe_sriov_vfio_data_read(struct pci_dev *pdev, unsigned int vfid,
> +				char __user *buf, size_t len);
> +ssize_t xe_sriov_vfio_data_write(struct pci_dev *pdev, unsigned int vfid,
> +				 const char __user *buf, size_t len);
> +ssize_t xe_sriov_vfio_stop_copy_size(struct pci_dev *pdev, unsigned int vfid);
> +
> +#endif /* _XE_SRIOV_VFIO_H_ */

this is a very simple header, no need to repeat include guard name here

