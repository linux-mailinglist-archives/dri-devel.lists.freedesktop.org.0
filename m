Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63424C03629
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 22:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8967010E1CF;
	Thu, 23 Oct 2025 20:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G5oBCxQv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D8910E1CF;
 Thu, 23 Oct 2025 20:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761251118; x=1792787118;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pb+WIdBOu5Og8irlu57BoiFvR9ongFxwnCEfDqLfMcw=;
 b=G5oBCxQvlVTXwBQocYXlHQdzYs/e7LHL08nt0l6E9R0VJuUikfgkTtO/
 M3gw5PeSkssMUbj5zBzJbcek37rMEhpAFUcz9Ll1a5rfHW3lkBBa2ZSej
 eNF2V3FSxjsyPXnpD7dm6x1W8xgj9U+IuGSIhKjKaMlp8rFs8bFwTcYcE
 cIQTlLldwsHpGzeBEX4uS5NWWWRjcTv2M4vRkPnrge1S/RSbcraz/1cap
 eZT8bCHMLW+34n4u2PZZ3Rq6I9FrTBRjDA0ZUG7Musvj6dNDa/cFbY6AX
 fRniaBnt0u1XrDfQAcdzImSpQrbORzmDRVrk87EOtLzrM9vcPHBpAdj1K g==;
X-CSE-ConnectionGUID: 521XBCUqTkKMoxDGs7uzXA==
X-CSE-MsgGUID: WTW4Vz3lRR6ta6rpTsGHRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74553144"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="74553144"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 13:25:18 -0700
X-CSE-ConnectionGUID: RJZdeZaSTF2vYo5AWeL76A==
X-CSE-MsgGUID: H5ewBnzORUyeQVxz9l5Hyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184731778"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 13:25:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 13:25:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 13:25:17 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 13:25:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTvLCDvRFNkZ3gP+h/YrZ35fNu3G6WBvSH1F4ORUgM2VLd5s9/FvjExBK4pcJexq3Psw7+lSaUkKyBIKuGlV9OXjrqiPAgvEg26XdATYgH+/5ydLIKo+IKBo2bnDH5EebbS90KPoF2N7At3woKrZ0E+etp2/LF3wshYecM8B8oUULD3jTL/V1m6WEtj8eyGegvzh4K5a8KpFWLBcYTVN/i4kGVMvCcke0+o5Ef6OLZj15gmyN82W0QzrCBqn9a99/K6bTBBIO5sWKGvSovRgyIQQu4zpNshen7O14TgzzZwvP0KUtMewtLSXJDLFXVcaYRk/NJGRRbtqrKvrTNIdUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9OByEB7sfR4XufJVzBgzaekMBe4HAxj673ptHRxjkw=;
 b=ayEgXTqLQZ5wG9mRgIF59H0vWGToNhxZab0V3Utn/gOgXQQdw4Kb310fhNVBEeNMx72CMf2pOSNL40TiTXrVeLVy3RMyzawK8eiz0KMU0fAnO6CYBYVxXpnpXnc91TASVJ4jmbI/YhXedyslqm3zLbMDb1/CZ0vJ8/vX9u0f8yWjhV7U0g9D2Dj9MoTPMHfqcl4vf751XIA3jDX9QSXL0HPl8+Ddqwy8xVZbfCG7Z33YuciWh76vxXZd2wkwTdb2NQ/RjPkoL/SlFBLb1ImGpHlXgf3dmk0N3PG9mdayFFI80l2NUloMKGXANLO9hebWcz7VxMaYgXKvGOOcpYou1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 20:25:14 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 20:25:14 +0000
Message-ID: <db1669c3-a1d8-47cd-a321-b6cecffd8c6f@intel.com>
Date: Thu, 23 Oct 2025 22:25:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/26] drm/xe/pf: Add helper to retrieve VF's LMEM
 object
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
 <20251021224133.577765-21-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021224133.577765-21-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0902CA0042.eurprd09.prod.outlook.com
 (2603:10a6:802:1::31) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY8PR11MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c977038-4ac9-4ff8-85bd-08de12724619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0xKVVZiRnpqTksxajNoTE5ITXp6a3M4NTdiaDJUczRCU2E4eXo5OGtROHZM?=
 =?utf-8?B?Yk05WlQxQjFtQTBKOGZQdlpmeHN5dWVsZlNHQ1pJZ2x1alk1UTBnelQ2QTV1?=
 =?utf-8?B?TXF4Z1RLVUF4b0crdXVjMllObTRkZUtlaWVoWkdHcXR4eHowNkh3eTdwZzJJ?=
 =?utf-8?B?c1dBL3JZMnF1VXFUbU9yb2pOK211akhmN3Bidi9RLzEvOG16WmtrdnloSGYr?=
 =?utf-8?B?bHBrekQ2WSttNDZZcXpYbTdkTmNXUGpKOFR4a0FBSmJtMnV1dU9Tb3dORTNV?=
 =?utf-8?B?QjdnNjJ4d3VIdTFzRE94RDlXN0JVTEFtQVkvRGFHQ0JYZjVibmhMazdnN2JK?=
 =?utf-8?B?RWUveHJnMUpENU5aajRzQ1U4MlpuWWVHWk1QMko4ZG1XUU9lQ0dJZS9raWdE?=
 =?utf-8?B?UHVOeUgrTVJ6TUZITDVTSWhWb1N1WjJmbHFFM0ZTVmJrcTRZRFdhRkRrYWU3?=
 =?utf-8?B?dGI5d1hkMkpXTHNpVVUxbFdiWlBmNmdHS2syZlN0Q3pnTjROTXhFUE4vMll2?=
 =?utf-8?B?b1JnM0p5eG5OM2l2UW9pRERiRGh5OUMzZVc5dzI1elpnSXJlWUlRbTNOUk5Q?=
 =?utf-8?B?YlZwd0NERXRZRHNsSitscmNGWFF0R0ZkMW5WNENuZzlXcXdmNUdEa0YwcTBE?=
 =?utf-8?B?MjJaWWhuemNReGtRYnEvNSsxSllrZ3pNYTVBUk81L2JjVllTa3NkZ2s1WTZV?=
 =?utf-8?B?Z2xENWg0cmN1ck9JUzgrS2c2eDFyeENrQTFkeWJ4SGRmSUdlL0xHRDJDOVZY?=
 =?utf-8?B?SnNKV0JyRG1LNko3dDU3S0xzbkU4ZHljdnRWbzBrUzVqdHVCODBYcHcrZWd0?=
 =?utf-8?B?SzRNa3AxL2VxM0R4cStHN2UwenVkekxWRERQWGpCUW1UMmt6VnR4Vmd6L0Vv?=
 =?utf-8?B?ZHVEWGpPUTNFZktkRStHOFZTNGphMUNwd0JkbU1BVlJIM2lHQkhvVUVqUHZ4?=
 =?utf-8?B?aVV2ZFR0L09xSDBQMmdoS2wyelFwemdubk5oYTVVR2RnVHBrK2wvTHd3c0p2?=
 =?utf-8?B?YW15RjBoMHpGWnJhREpZcXZzOGlYWHZmTWthU2duampQMnFheUMvUTQwWmhT?=
 =?utf-8?B?dmJJRC9NamtFTENjT2EvWjk0TlhKVkc5RlY0akZ6MWkwZnJXUm9BUmlwOXZa?=
 =?utf-8?B?Umt4a2I4RlV1cVFZMHptaUlJbVc4SWRhd0VJSTUrVUlJeGpROURvQXpYeE5E?=
 =?utf-8?B?YTlJYklKT2ZEdFZ4MDR3YVI4cUF1NXo1Vi9UWnQyYUtnc1Z2L2tRSURNU21L?=
 =?utf-8?B?dXZSc05tQTNLZ3JIK2ZEdTRFcnBTamc5ZFp2aXdnOSs0UEllck44U294YlFz?=
 =?utf-8?B?eDk4WjJQMGVXcVJCUUwra2xpQzI5cmpxVUhsSnZxM2poS0hhdjZoU1djeHhJ?=
 =?utf-8?B?MitGVEJpUUpFWm5wSVAzQ2Zja1lVMTY0WkdZWDBMZVB3emtCZld0S2JHR0Nl?=
 =?utf-8?B?aXBvZmdnZHpMendaSG5TamtodzNrNloxOEkyQXpWUmFJRE1ZVkNDSzRtR0Ux?=
 =?utf-8?B?NUNvQm4wTHloVGlSU1pOdUFVeGovUG9PeGlvSGkraVhML2g3allEazAvd2hy?=
 =?utf-8?B?UW9UYkYzUGFhTlBQMjE3ZUVhVGlzeTlzOWNNb1d2WnpRTnVjQkpsQ29wd3NF?=
 =?utf-8?B?QXNackp5Z1RFcG9YZGluRzcwYVZvU1BKTHpXOVlDd3h3anJ4WTJNR3RJWnF2?=
 =?utf-8?B?cEJrMk1ZYTEyaVVKWjIwUTViVHpqSGlOQlZjLzhkZXJiaW9VWktrak1qWlA2?=
 =?utf-8?B?aUxVZ3VKMTAvQ1NIWEIxdHZiamE4WWsvRlAyc2R4dkppbTZTQ3hNN2J3TDhx?=
 =?utf-8?B?cXVOcks2MUhPdDA1S1pld0lqTTJQcjRJUzlmRy9zNUo4dElLS2JDZkJVbUdn?=
 =?utf-8?B?c2J6VVZjQXl5QWF5azNxT1FEb0dsQk1wMU5lREUzMTNsUVRJdTF4aDVoRHBO?=
 =?utf-8?B?OWprSGZsWW1meTlaM0h1R0wvU1Q2c0Z4VnllRzgvUjlXYTV2WnphdG9JOGNz?=
 =?utf-8?Q?mxjRHjjpo8HMCwdz1OU2lmZNUZ8VwQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2U4YTRWOGZ0Y0J0Skx6UFlwbGtvZGY0aVN4aGF0b0c4V3Q1OE9OaG15SDQ0?=
 =?utf-8?B?OFVsVmxobW82MHBpSTFlbmRZUnFLSkNNaW9ZS3htY3ZIZFNBM25BcDlRc1ln?=
 =?utf-8?B?SzBBd0R1c0d0UjdpODFWZ3p0WWhiT3lzclRvNFZCaXVmeUMrcVJNUk8vRnRL?=
 =?utf-8?B?aFZXMjZSM0p2alo4SDlqRnp3TWFLYWdPK0RSRmZPTzMyTGE5MnhOcTl5ZXpw?=
 =?utf-8?B?Z2dNMVkzaDRNd3BPUENzNTdFVUhZN25UU205eUNnL1JlenNqelFqSEZZRHJn?=
 =?utf-8?B?U1lZaEZLdHlnNDNSWW4rOXRvdjE2WFdTNWR3WExVNW0zT3NNaHZibzdZYXlO?=
 =?utf-8?B?NTNlUERFaGZEZk9GM1JCajkzR3dxRG5yc3pVWlYrWlk5NzY1dHlyZ1RhRjRx?=
 =?utf-8?B?eUs3cW5ObitjdVRiZ0Z6aCtLVERaZVhDNEN3c0lKUmpUNC9HM2Y2d093VWxF?=
 =?utf-8?B?SDJsL1R5SEJ2UEtEd3hQRWJrek5VN1ZPVzFueEpEYUZicUFDR3pNSzg3SHJP?=
 =?utf-8?B?OE1FQjQ2TGlwQ3ZVWFFaNkZFRUNCazlNd3ZKS0tkRzNnVzBxVVhyRlpkS29Q?=
 =?utf-8?B?cHRjbWdNSjlkdEdvUUZ2dnk0Yzh4b2M1eW5PaFNlcmF4MnYweWVWMXVNWmEx?=
 =?utf-8?B?WjAvTGorUTJZZ1Zscm9JdW5EZjAzZy9jZ1VnM0xoNFJYNTllQTVtTlJ1cEwx?=
 =?utf-8?B?U1Z2amRFR2Z5ZjR5RHNOTVBqdkw4YTNRdGhQSWV3Rk1MZzVhM2JEUHkxUVNR?=
 =?utf-8?B?R1NSOXVXemlnR2RxZlVZeXJyRkdBOGNnYW5MMHFoV29yaWV3bkJzVGNuREJl?=
 =?utf-8?B?djQ4dFgwSklqc21DTVZhQlZpbS82Z2daV2hqSkhicXpMRzhzU3VXRitndXBp?=
 =?utf-8?B?dVA2ZGltRmhZUE42d3VrdVBhRC9XZ3lrRFZKVDcraVdPZ1J2RHUwNGJJMFJv?=
 =?utf-8?B?dDN1RStFU2FLYTlidkFEbVRjQzZxY1ZUeVhHdFVrZnJoZytPZnIvM3hldlNq?=
 =?utf-8?B?S1ZsNFRYeXRFc1NoN04yeEN4bGo1ODFxdTg4WWdqTTYva2toMFVxRDhtZk45?=
 =?utf-8?B?UzZXTWd4NFhoTXNzQUpmYkI5N2owZVZBK2pZM3dLQ3hTZjhnbkwwQ2pDV0Y4?=
 =?utf-8?B?ZmxvSXJrUHdhU2JJYlJFUDNIQnZuN3pCY2FwbkhtR3Q2NndpMjhUc0pTU2Ji?=
 =?utf-8?B?VHA1SUh6bUlvTDgwd2RDTkF1L0ROamMxL2h3bEpvYnFJaVk3dGYrOWxJRzRu?=
 =?utf-8?B?M3hUd2d4b0ZIaFFKMEpxeG8vR1cwdFVTSXcreGFnSFRIZ0pPVittNUpPZ1Aw?=
 =?utf-8?B?eFdpOVhSWm9zeXJjeC9VK3g2ZUliZTJPT3RVd3hiR01WK3VLdXBNd0xSc1RX?=
 =?utf-8?B?YUdRWk0rOGd3dXpiaDRtQWMyTm1ZbDVjQ0VMY1puWEFGVVhuTVcyODZQQlor?=
 =?utf-8?B?WEFBcWlOUnRFL0Y0WkZPL2JhMVR3T3FlaU52cThGQmp3U0QrbTFHSXBjRnlP?=
 =?utf-8?B?cy9ReUNJK2VNaERHaDBBYlVwU1IrSnFLWE1ORUNoNUJsRHF1Wm5FYk9lM1d3?=
 =?utf-8?B?M1NyYjl2Q1dHclhPUVJxMU5TeUlUejFPU3R5dkJucUgvNUZzN1pZUTF5enJ2?=
 =?utf-8?B?OHMxaVpwWTRRU3NNL0JiYUhvYzA4bUFXaGlsQjFJemFLVklHUzJYTlNTWWpZ?=
 =?utf-8?B?bmNaMTNLbmhKQW5tNCtUZVlXbmFuN29LQVJXaURSalpYeUpVaWViVXE0Z1U1?=
 =?utf-8?B?ZFR4RkZnb1RScWVlVFdZcklCTzhyNjJndnR1T0ZTd3NBQ01JTHlkS0lvdkpv?=
 =?utf-8?B?OU10SlJPS0lwbHRqWlYrNlpjQVBoZGpZSllHQUxGOVFwQTc1dEdqYVF4WVBT?=
 =?utf-8?B?aHZGdkZtUXI0YlI2MXZMUVJVVVdYcG1xRE9tbEhzL0FOUlp4SnNvZGppWnhE?=
 =?utf-8?B?dDVLem5wWkdYakN2a1V5aFh1WDJ5Tzh2SFZ0UWxqS3ZVSU41ZXp2c25qRTdj?=
 =?utf-8?B?NjZKbHpyWi9YeE1yaFRiRjlTZkJvUVlnSVVGZ20wKytTcHdSUjFuaFM1ejBz?=
 =?utf-8?B?blZNak5jRGxqYzMvWnFjOVFXWDBUbmgwenRaSzRka1dIWnlweHJ2YUxPaXlw?=
 =?utf-8?B?WTdTbGZDZngrRjM1eDhDb0pieEdHd3RFaGtvYjN5cjdrRVZYOVpMUFNqRncw?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c977038-4ac9-4ff8-85bd-08de12724619
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 20:25:14.6937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtupOmyJ1wb4xbHEGHTJ2f0NsO42VBcnsLoKWew+Tb8wV3XDkIeDFPMdvdCXmwd3Xp3k2VAGO5WVGKH955o9IdyJ5Wh3cPWCA7H7aDWMkXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6940
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
> Instead of accessing VF's lmem_obj directly, introduce a helper function
> to make the access more convenient.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 31 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index c857879e28fe5..28d648c386487 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1643,6 +1643,37 @@ int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid,
>  					   "LMEM", n, err);
>  }
>  
> +static struct xe_bo *pf_get_vf_config_lmem_obj(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +
> +	return config->lmem_obj;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_get_lmem_obj - Take a reference to the struct &xe_bo backing VF LMEM.

    * xe_gt_sriov_pf_config_get_lmem_obj() - Take ...

> + * @gt: the &xe_gt
> + * @vfid: the VF identifier

since you assert vfid below, add "(can't be 0)"

> + *
> + * This function can only be called on PF.
> + * The caller is responsible for calling xe_bo_put() on the returned object.
> + *
> + * Return: pointer to struct &xe_bo backing VF LMEM (if any).
> + */
> +struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_bo *lmem_obj;
> +
> +	xe_gt_assert(gt, vfid);
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	lmem_obj = pf_get_vf_config_lmem_obj(gt, vfid);
> +	xe_bo_get(lmem_obj);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return lmem_obj;

or just

{
	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));

	return xe_bo_get(pf_get_vf_config_lmem_obj(gt, vfid));
}

> +}
> +
>  static u64 pf_query_free_lmem(struct xe_gt *gt)
>  {
>  	struct xe_tile *tile = gt->tile;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 6916b8f58ebf2..03c5dc0cd5fef 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -36,6 +36,7 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
>  int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
>  int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
>  					u64 size);
> +struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid);
>  
>  u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum);

probably we should block VF's reprovisioning during the SAVE/RESTORE,
but that could be done later as follow up

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

