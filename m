Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFC2C032D9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 21:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7C110E11F;
	Thu, 23 Oct 2025 19:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLK/FhJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59F810E11F;
 Thu, 23 Oct 2025 19:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761247783; x=1792783783;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nk4tNQAJjA6bfCuFxUn+ROx5Tee/e8s2n8jdWxSwCwQ=;
 b=dLK/FhJpRtsvUASpG/sG0X2cyf432VlBQG14iSgMb26Kht5ocrwgu3hJ
 7sQbUIIaviu8OrK5FfIHX+gbYp+DhLUO8ugfEBy29xoyaNaBavP6/KlqZ
 xoYRbkTKp58KnBKShzmxLDFsfWZZFLOYNwg8qpxEEY5xyByqu0YB27n3G
 LMKVOCi3Dc5AqsTUYSEuA/loxmFyYoYFT5MaR1TWEwWQ4uUJzNrXPE6bP
 TjgeGJPdMHkOGSiwYpUK8gD0NNsqPqSukgRiMQwoKnNEhTYQz6uob9DGV
 UugCBQ4r1kcC6FPwL8g03v0Lbvv9XYHkWvDCqitNFzHZDyQwRH9nFKz3b A==;
X-CSE-ConnectionGUID: Hk0NjOOPTQuSHRASiUGl4Q==
X-CSE-MsgGUID: ZVRrfcE2QzaYyCbZevsjxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86058648"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="86058648"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 12:29:43 -0700
X-CSE-ConnectionGUID: cH82gdoaTzmj0oN/711JCA==
X-CSE-MsgGUID: lW/barLCTRmtu463VGDsLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="221437508"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 12:29:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 12:29:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 12:29:42 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 12:29:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IT6Ub68NV6WwdusWUnXWNt5vhuTJB7iXWZWuuaYnyrSitd52m/e+WmUxlTMWD+KWSJKiFHQQVX+53M5Hlj7NbL2iC0trEYQAo/vJjEdjpPkPaZ87FwSgN5h9bZU/2ndwDuzAkI2ptMfRRjV9tZaqQ0auezLk/kpZzgwIaOM9Ys+942ZorbL1aap9LCzGliRdnddxQnV7PcfL3RQpSZQYEhlSNLEQVrdsz/O9KLEclOdWyyn2OkJqryMassb7IUt6Vt86JWXrqjuQp/hl16UN733Bof2cFJ6nk95W6Pj2YuOZSqx6mjYDPUaYgts3aBqd/fmjO+R/3rP3ncT2hDt2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pu78Z26Np14sEMOcR7nQhbW/tp0+qw4N+SIZNQe7CDE=;
 b=KfLBOKtXT9DoXre7SoaxhDnVMWDs0dNt4yeEW3uJQEpMqcaSNKOzXXtGokuaGu3ews+vQPpPP2/b8v97YxVRTyIid/qO3GT/AKvWD3YX+xLvUKC3DN/GF64eZeBkgzRR6AvZTOLEwEG1KJzZ0uia/84cXirMFmulrfNRUyO5PK65mr7ROpYErN35mz+3EJjCuZMx9XGNOjYrsRGWeBy8zsmPSgLZTAYtzt/neWHQ4N8AOh0BaYAvSAG4awjWT981CjZaYELZAPtspxr4AOd895l5GCqyzOelh67Oy8+lPaSRWi17CyCEnQ2K3d9lA/wuMLKNthEIoEVy6cXmOJUNuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM3PPF2B3CC4BE4.namprd11.prod.outlook.com (2603:10b6:f:fc00::f16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 19:29:40 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 19:29:40 +0000
Message-ID: <72f0caa9-50b3-4fb0-bc4b-41e67886be35@intel.com>
Date: Thu, 23 Oct 2025 21:29:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/26] drm/xe/migrate: Add function to copy of VRAM
 data in chunks
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-22-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021224133.577765-22-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0163.eurprd09.prod.outlook.com
 (2603:10a6:800:120::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM3PPF2B3CC4BE4:EE_
X-MS-Office365-Filtering-Correlation-Id: 6331bda6-9206-4b2f-e4e9-08de126a8268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVZhYjV0U3pHdWUwWm81SHZBMjh5RERHZ0pCQ1ExNTdIZ1NIRnNPQlhKTVNx?=
 =?utf-8?B?YmI5NjVhWDdSa1BYbVRlR25kUVhJQkx2MkhZR0tzTU5lOEpBVUxtVHhJWkJ6?=
 =?utf-8?B?TU11UWJRR2VpTWgwWU9VU2NzSEZITmQ5b09wUFQzSU85aDl0bGd3Y2NZOTcw?=
 =?utf-8?B?bkJHSmN0UkJKV2FOTWNUNWZFQm8zZDNsRWZyN1BWSE1tOXRXSkl4NTBVSjI4?=
 =?utf-8?B?VWdKdk1SNUFNSW9iOGdsU2daMy9RYXdSU2ZGb1d0b1VYcm5pcE9KaEE0NXc3?=
 =?utf-8?B?Rk1ZYjVFMHdnLzVJSU4ycE9zWHU3cjkza20waEFBQ3JaOFFaeXNFOTZtMzVY?=
 =?utf-8?B?clJlbXhLYVJLTjNPOGcxcjhOeDE1RkUxVC94bmEwVGIySENVRS9uV2FHSTlO?=
 =?utf-8?B?aWxsa0F5QUFZMGw1Wnc0cXBNQU92T083SWs3RXVSaWdVRTZZWUJHNktBd0Ri?=
 =?utf-8?B?aGhKTnZYL00xeVRxK0dLcnZJTGx6eE9qZ1dja0trajlCZFl2UGNvTG5UQ3lW?=
 =?utf-8?B?TVpRVnVpS2JDa3RvS1ppQ0tmZ2YwNDVoL1g0U1hWMk45Y1RyZERjN1JIWHo3?=
 =?utf-8?B?SG1FMm1FbFFBeURHQUlVbVoySlZXM0QvanAxcnhaWHkxT2VQYmxUZGd2dGRh?=
 =?utf-8?B?QWpkc0h2bFUvWmEvb1pLU1VzZmlWYnNPWmpGK3ZPMS9qWmVYT3FROGZXeVk3?=
 =?utf-8?B?K1FwN28yaGxjWXdKeUl4YXZpR2E0ZzVxVUIwZHl1WXN3cVVQZjZ5T2VOSmsy?=
 =?utf-8?B?czdNcSthQTNTY1B3VGp1NUtzWXlGUnoyTjA2UGNRN3Fra2RnaUFYUUtaanpy?=
 =?utf-8?B?cDdIa3Vob04wUWlVV3IzQ2RWcVZMSncycW5lK2p6VUhUR1ZZZFJUb24rVzFO?=
 =?utf-8?B?dGtTUEU2eHZDSTNTWWhNaDJRUGNGNHppN1lwNnQxOUNtN3Nma2lIR2dFN21x?=
 =?utf-8?B?MGEwbTNYRTBtSWpNL1VNNkUvaTl4dGpQN3NvVmJVeHowajh5aXhNaG1ubFcw?=
 =?utf-8?B?V0k4c2cvOEowYmI4b0kyRDE4Y3VPSDFMZ2ZLc051ZzdCSjB4bllCWWF4cWdK?=
 =?utf-8?B?N005TDdaOTVCNS9ZRVhJRDZOZzRRWjUvSXRiVVlMbU51azRkbDRxN0dSend5?=
 =?utf-8?B?cWVJa0pPU3pBSC9QUjJzOURNSTBMWXJCTk44TlRVUW5wajhRYlpVVXRtRUFZ?=
 =?utf-8?B?c3dCN2toVE0yQjBhRWsxRTVJWHlCQkhGcFBxWU05NVNkbXJWR3UrcURxdXV5?=
 =?utf-8?B?ZUp3UFdQMkEwamc2VGFCa2NCa2dBdVJ0dzNuVVIwVjRrMDY3MTgyMkEyalkr?=
 =?utf-8?B?SC9mU3N1YWluQmV5TzRDRnBWU3EvQlI5MFVpS2w3SU8wOS9HVGFLc29QMTBv?=
 =?utf-8?B?OFFNaVM3MFlkSXd1NC9qSFRITzAwVDZoRldUVWN6RUVmWmRkZlBDWHlVTWkv?=
 =?utf-8?B?b3BuQ21pck1sVmo3OUtRUFFaZENBVmZlZkFwVDJLZ2N3SUxGZFNnb1NEWDgz?=
 =?utf-8?B?eWN5VyttWkNZZnRZZHhtbVhUcmV2eHFURWk5d01GWnZPaVNYOTYzVTlVNjJG?=
 =?utf-8?B?Q2FaVHJEUnJycXY0eGZIWGFTOE5WRVRxclRHZEt2Q2F4OHZtYmEwbzR2UWJN?=
 =?utf-8?B?eXBjK2Nja1F0L2g2ZURuZENnQUtoKzJGSWRMV2laR2duUEZJNXczZ09pSExV?=
 =?utf-8?B?RE4vRSsxZElRTThaOXAzSmJIeXRyRXR0cDhkZ0o2MXFQdEN3RmdyZnFyc3Na?=
 =?utf-8?B?RWhoM3llMCs5VFdLNjNnSTVBNTdEUHpyRUtmc3N2ejhwRFdEeWY2NGNYMCtE?=
 =?utf-8?B?YitYUWl0MVBhN0x0NU9WT1lwZ1ZYcVZtWnp5RVVGSGVtd1dHcVJLUXNXNkpm?=
 =?utf-8?B?cDVYZjloR2Y0b0RiRU9MZi9pRzIvSHJTcEdPYktFS0hoelZ3N1d2VFFJQzhI?=
 =?utf-8?B?K3NYdkk5UXp2NkY4VjVONVNVcy93MGI1RXM2VkxVV21FNU9McnZMREFsNDVH?=
 =?utf-8?Q?HCRACEa5p82m4RUMvEydkFmlRk3CMo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWVuYWx5cXhzelF2TmloRnFPeXg3V0VzQXFpMzY1THovWWRydXhDUlhrSy9W?=
 =?utf-8?B?OU5zNWNxaWpGQUhYaSs0S3hSVDcvcnpWdVZNM21vSFJqbzlWVkF6QkkzTkRI?=
 =?utf-8?B?TUl6NmFCL3o2RVlIeXhreTJLSGhtQXRKWFNlSkk4dW50TWpUbjhDQmNpK1Vk?=
 =?utf-8?B?ZGRHMG90OEZrc0U0aDcyZWtINkdLRGxwVmhJVnpJZC9CazFYenJxb0F4dEVZ?=
 =?utf-8?B?cjcybUlUS0E4NzFrY0hmbEV1ZlFqUkdudnlOKzFqVzVZenBheDNGRGJ3YStm?=
 =?utf-8?B?NkRCdzU3ejB1ZFg2T21jdWF5Q25hV0VVSWZDZTY2L2VrYjIzTDFFbEhoUXVZ?=
 =?utf-8?B?cCtqOE1sSnFCQjdwa0gxalJPRlE1dEVsMW1UTlIrWTNiSSticFo1c1BMTUlk?=
 =?utf-8?B?NS9tMzJsR3dvNWUrbDVZVStoUUo2SGR3N2hKUUtpb0tJWVgyS2g4OWVPajcx?=
 =?utf-8?B?NnJrbDJTWjg4anNHbGVGMEU1ckZQRFJ6L01kUUxCaFZVY1ZTYlcxSnJMQjdm?=
 =?utf-8?B?ODBVUytVVUEzSSttNjBIbW1jWEwyR3R4ODl5RlM5cldiUWRQUkJ3V2NySEho?=
 =?utf-8?B?ODg2MmUwS3k4d3lzdXFJcG9kUERHZk1kc0pkd3A4U2hTSDJFUXFhNmZhVlJt?=
 =?utf-8?B?cnBnc3p4TUZQQ01zcUNFOVVoL2hMYStOanFtb2w5dEFaMHhJcFJESjZoY1pt?=
 =?utf-8?B?cXhUTkJEWmVmRm1wb0NweEVyOHltaWpldGtldjNxdndjditDZEhqcisrdGls?=
 =?utf-8?B?aEZEU1lmRXNCUWdWejBPN0VMazQzL2YxM0QrZnF5UU5VdHdVU08vWkRFUEdT?=
 =?utf-8?B?S0FPdFVnNFpDZXA0N2RML0swaDlFV1hBdmYxaUwrWWd2ZVl6MUs3MEVWVy9Z?=
 =?utf-8?B?WXF2d3hnejB1ZmhxMFFZT0xrc0Vqd01pUCtzVkJxVkxCYnZwR2ZHTTNJRmU2?=
 =?utf-8?B?NjF3NkZwNjQvT0Z5R21MczIwSklIenAraEFQTksvZXlsN0VPVDBxV2M0Ukhp?=
 =?utf-8?B?QmVBSlVCbEc5MlhkdkdPNEN0bmtJQ1RsRkp3U1kzemVoYkMrVy84bFZIcVFl?=
 =?utf-8?B?RE5zRTBtbUpQd2NQV2VodE90RGVXdlNZanFJTjJGZ2ZMYVRwQzdrZXhGYzlO?=
 =?utf-8?B?N0VnNEhISjM0cFg5d2RmeThpdEZZYit6dFY0ckpEZFVJV3RpSXNyMi90Q3ha?=
 =?utf-8?B?SFVqMTU2aUw2akoramxNNVFvbC9CL0dTZWNuSXh2TFN3aEFLTys2Y0c4RWRi?=
 =?utf-8?B?K3NxTlRnc0pHMEVvS3YxTC9oazdRLzRscFo1VExhV1B3ZThJWThXMTlSd2Vh?=
 =?utf-8?B?YWlMdHBsOHpsU0ZIMFBmTm5jbmVFd2ZwM3hHWE14bWhodk8yRGtRbE15Zzll?=
 =?utf-8?B?ZTRKNUxQbVpxcXd4b3N3c3RUaEJ3L21wSGlPNTkrc3d5SDNWU0RjeWlXMVRF?=
 =?utf-8?B?T0JVbE5YL0VrdFhyQVczV2RJQmhhMGFIYmY0S0pJV2hweEFqYk0xSUxaY0h3?=
 =?utf-8?B?MmxNOWhFWXNscitSRktUZk43ZDVhL1BrVUFlZ2FtMFNLWit3U3o0Q1BrTk4r?=
 =?utf-8?B?R3JFYXFsY1hIcVFDUEhjOVRuZHZqdHZmaVRhN0p2aTZZbDV6dFdNVzRSdTBi?=
 =?utf-8?B?bGdFejNpN3lleWRaaE9JYlFjdmJncFJ1ZU1CWnFhQnUrUnQvZUVucGlzSnZC?=
 =?utf-8?B?NkpSWUh3aDlvREtGWFRLT25hTndLWlB6YnR1amRwRjRocWNxS2VYNUFlOEg3?=
 =?utf-8?B?M1RLYlZmZkFOZzBRVTI4d0FobDFraHFZMlN5S2Z1ZWFhd0dyZFJER3ZUMjUw?=
 =?utf-8?B?ZTc4b3JXZXlINExDRERlL3ZMMSsrRzhjem4va1RRWVNrS0NCZVp5WW1rSlk2?=
 =?utf-8?B?R0k1a1Jxdk1nQnUxLzRaMStIckZhZERUNHFKNzlFNHhxVTU2MWpOWUptRDlu?=
 =?utf-8?B?NzJEQkVzamt2bzE2M01wVjQxVHBPcGxGVW12MzNxWitMVDBSRDY4ZytONEkv?=
 =?utf-8?B?bTB0YXl5N3ZLRDZ3Unc5QTczcC9uQlNBbFluWG9KNEhmNTlpdEVEKzFMNGRn?=
 =?utf-8?B?Y2Y1d1VLTXdRT0J3ZGg2QUV1b2lNTTE2c21oKzh4dWdSd3kvNWVZcmRiUmFo?=
 =?utf-8?B?K1IxdTNlN0N0OU55YWQ1MktrL1NVK3VZaU5HalpBMGVYRVRILzc5Sm5mMmw4?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6331bda6-9206-4b2f-e4e9-08de126a8268
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 19:29:39.9434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqpsqY3hRQNrCox03sLgVfw92ijOJVHDvUF7r1iD8GNI5hFjqRGUqvTBxdnyV8pDYk8rj99JzKBnHEdQcl7ybv+zUj+OAXttzLuCTZyI3k4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2B3CC4BE4
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



On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> From: Lukasz Laguna <lukasz.laguna@intel.com>
> 
> Introduce a new function to copy data between VRAM and sysmem objects.
> The existing xe_migrate_copy() is tailored for eviction and restore
> operations, which involves additional logic and operates on entire
> objects.
> The xe_migrate_vram_copy_chunk() allows copying chunks of data to or
> from a dedicated buffer object, which is essential in case of VF
> migration.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 134 ++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_migrate.h |   8 ++
>  2 files changed, 136 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 3112c966c67d7..d30675707162b 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -514,7 +514,7 @@ int xe_migrate_init(struct xe_migrate *m)
>  
>  static u64 max_mem_transfer_per_pass(struct xe_device *xe)
>  {
> -	if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
> +	if ((!IS_DGFX(xe) || IS_SRIOV_PF(xe)) && xe_device_has_flat_ccs(xe))

being a PF is permanent case, while your expected usage is only during of the handling of the VF migration.

maybe it would be better to introduce flag FORCE_CCS_LIMITED_TRANSFER and pass it to the migration calls when really needed ?


>  		return MAX_CCS_LIMITED_TRANSFER;
>  
>  	return MAX_PREEMPTDISABLE_TRANSFER;
> @@ -1155,6 +1155,133 @@ struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate)
>  	return migrate->q;
>  }
>  
> +/**
> + * xe_migrate_vram_copy_chunk() - Copy a chunk of a VRAM buffer object.
> + * @vram_bo: The VRAM buffer object.
> + * @vram_offset: The VRAM offset.
> + * @sysmem_bo: The sysmem buffer object.
> + * @sysmem_offset: The sysmem offset.
> + * @size: The size of VRAM chunk to copy.
> + * @dir: The direction of the copy operation.
> + *
> + * Copies a portion of a buffer object between VRAM and system memory.
> + * On Xe2 platforms that support flat CCS, VRAM data is decompressed when
> + * copying to system memory.
> + *
> + * Return: Pointer to a dma_fence representing the last copy batch, or
> + * an error pointer on failure. If there is a failure, any copy operation
> + * started by the function call has been synced.
> + */
> +struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
> +					     struct xe_bo *sysmem_bo, u64 sysmem_offset,
> +					     u64 size, enum xe_migrate_copy_dir dir)
> +{
> +	struct xe_device *xe = xe_bo_device(vram_bo);
> +	struct xe_tile *tile = vram_bo->tile;
> +	struct xe_gt *gt = tile->primary_gt;
> +	struct xe_migrate *m = tile->migrate;
> +	struct dma_fence *fence = NULL;
> +	struct ttm_resource *vram = vram_bo->ttm.resource;
> +	struct ttm_resource *sysmem = sysmem_bo->ttm.resource;
> +	struct xe_res_cursor vram_it, sysmem_it;
> +	u64 vram_L0_ofs, sysmem_L0_ofs;
> +	u32 vram_L0_pt, sysmem_L0_pt;
> +	u64 vram_L0, sysmem_L0;
> +	bool to_sysmem = (dir == XE_MIGRATE_COPY_TO_SRAM);
> +	bool use_comp_pat = to_sysmem &&
> +		GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe);
> +	int pass = 0;
> +	int err;
> +
> +	xe_assert(xe, IS_ALIGNED(vram_offset | sysmem_offset | size, PAGE_SIZE));
> +	xe_assert(xe, xe_bo_is_vram(vram_bo));
> +	xe_assert(xe, !xe_bo_is_vram(sysmem_bo));
> +	xe_assert(xe, !range_overflows(vram_offset, size, (u64)vram_bo->ttm.base.size));
> +	xe_assert(xe, !range_overflows(sysmem_offset, size, (u64)sysmem_bo->ttm.base.size));
> +
> +	xe_res_first(vram, vram_offset, size, &vram_it);
> +	xe_res_first_sg(xe_bo_sg(sysmem_bo), sysmem_offset, size, &sysmem_it);
> +
> +	while (size) {
> +		u32 pte_flags = PTE_UPDATE_FLAG_IS_VRAM;
> +		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
> +		struct xe_sched_job *job;
> +		struct xe_bb *bb;
> +		u32 update_idx;
> +		bool usm = xe->info.has_usm;
> +		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> +
> +		sysmem_L0 = xe_migrate_res_sizes(m, &sysmem_it);
> +		vram_L0 = min(xe_migrate_res_sizes(m, &vram_it), sysmem_L0);
> +
> +		drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, vram_L0);

nit: there is xe_dbg()

> +
> +		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
> +		batch_size += pte_update_size(m, pte_flags, vram, &vram_it, &vram_L0,
> +					      &vram_L0_ofs, &vram_L0_pt, 0, 0, avail_pts);
> +
> +		batch_size += pte_update_size(m, 0, sysmem, &sysmem_it, &vram_L0, &sysmem_L0_ofs,
> +					      &sysmem_L0_pt, 0, avail_pts, avail_pts);
> +		batch_size += EMIT_COPY_DW;
> +
> +		bb = xe_bb_new(gt, batch_size, usm);
> +		if (IS_ERR(bb)) {
> +			err = PTR_ERR(bb);
> +			return ERR_PTR(err);
> +		}
> +
> +		if (xe_migrate_allow_identity(vram_L0, &vram_it))
> +			xe_res_next(&vram_it, vram_L0);
> +		else
> +			emit_pte(m, bb, vram_L0_pt, true, use_comp_pat, &vram_it, vram_L0, vram);
> +
> +		emit_pte(m, bb, sysmem_L0_pt, false, false, &sysmem_it, vram_L0, sysmem);
> +
> +		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> +		update_idx = bb->len;
> +
> +		if (to_sysmem)
> +			emit_copy(gt, bb, vram_L0_ofs, sysmem_L0_ofs, vram_L0, XE_PAGE_SIZE);
> +		else
> +			emit_copy(gt, bb, sysmem_L0_ofs, vram_L0_ofs, vram_L0, XE_PAGE_SIZE);
> +
> +		job = xe_bb_create_migration_job(m->q, bb, xe_migrate_batch_base(m, usm),
> +						 update_idx);
> +		if (IS_ERR(job)) {
> +			err = PTR_ERR(job);
> +			goto err;

this goto inside 'while' loop is weird

> +		}
> +
> +		xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
> +
> +		WARN_ON_ONCE(!dma_resv_test_signaled(vram_bo->ttm.base.resv,
> +						     DMA_RESV_USAGE_BOOKKEEP));
> +		WARN_ON_ONCE(!dma_resv_test_signaled(sysmem_bo->ttm.base.resv,
> +						     DMA_RESV_USAGE_BOOKKEEP));

xe_WARN_ON_ONCE() ?

but why do not use asserts() if we are sure that this shouldn't happen ?

> +
> +		mutex_lock(&m->job_mutex);

scoped_quard(mutex) ?

> +		xe_sched_job_arm(job);
> +		dma_fence_put(fence);
> +		fence = dma_fence_get(&job->drm.s_fence->finished);
> +		xe_sched_job_push(job);
> +
> +		dma_fence_put(m->fence);
> +		m->fence = dma_fence_get(fence);

> +		mutex_unlock(&m->job_mutex);
> +
> +		xe_bb_free(bb, fence);
> +		size -= vram_L0;
> +		continue;
> +
> +err:
> +		xe_bb_free(bb, NULL);
> +
> +		return ERR_PTR(err);
> +	}
> +
> +	return fence;
> +}
> +
>  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  				 u32 size, u32 pitch)
>  {
> @@ -1852,11 +1979,6 @@ static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr *sram_addr,
>  	return true;
>  }
>  
> -enum xe_migrate_copy_dir {
> -	XE_MIGRATE_COPY_TO_VRAM,
> -	XE_MIGRATE_COPY_TO_SRAM,
> -};
> -
>  #define XE_CACHELINE_BYTES	64ull
>  #define XE_CACHELINE_MASK	(XE_CACHELINE_BYTES - 1)
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 4fad324b62535..d7bcc6ad8464e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -28,6 +28,11 @@ struct xe_vma;
>  
>  enum xe_sriov_vf_ccs_rw_ctxs;
>  
> +enum xe_migrate_copy_dir {
> +	XE_MIGRATE_COPY_TO_VRAM,
> +	XE_MIGRATE_COPY_TO_SRAM,
> +};

nit: it's time for xe_migrate_types.h ;)

but not as part of this series

> +
>  /**
>   * struct xe_migrate_pt_update_ops - Callbacks for the
>   * xe_migrate_update_pgtables() function.
> @@ -131,6 +136,9 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  
>  struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
>  struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
> +struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
> +					     struct xe_bo *sysmem_bo, u64 sysmem_offset,
> +					     u64 size, enum xe_migrate_copy_dir dir);
>  int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  			     unsigned long offset, void *buf, int len,
>  			     int write);

