Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E363BD3034
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 14:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5231810E392;
	Mon, 13 Oct 2025 12:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVKmW2qg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729E9890EB;
 Mon, 13 Oct 2025 12:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760359029; x=1791895029;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2bFjSK30GSaQGpYzSISBH7H+dQagt1aMpSJlfMaXjEE=;
 b=YVKmW2qg0etHi4dhGOU3faIMnc2nXICezNiDVruCn7zenVmqqQgRanGM
 /H+GXlmWaLebj5phG3VCRm3sZ3zeoOvEdisJOLTibEoKUkCmGetXJntrs
 ykmOLki9DHTJkehh1eUBUQ4jxFqK9MDLCZUvVKWDGe4y+XIVKjSJggZQ5
 ZKcA2h0K3r28Hyj40eQsWNYGmC9ZdkvZYVOAbiA1qa2kZ5Roozhxkge+c
 Dnz83P11JgH8wAFSMEP5PHNGP1LkuBE01l1CcCTZsBMhY4r+uEsNKOEJd
 eHZcm5cDsJqAMsEL0Pzip3jdvTz3MOm3S+c1KU421SGArNnmKnvrDJtrZ w==;
X-CSE-ConnectionGUID: 1Uqry1Y9QraRL6Rtyuhg6g==
X-CSE-MsgGUID: rzVmYCGqRBeWbP7/rMYtAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="72754983"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="72754983"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 05:37:08 -0700
X-CSE-ConnectionGUID: QY3IYlsKRd6qY+O/bBaMbQ==
X-CSE-MsgGUID: Bj4yX0LSQMiuBLMmSdo8bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="181399810"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 05:37:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 05:37:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 05:37:07 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 05:37:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9DpVjpEhJ9xWHYE7L4/6R5aCtV+/okbQdHyIgKG28b6OmCCD5plp6VXvnY9icWKkgBie4Vb4OXzCcEcNgPBkeIF5vqom3XjkYhg0TT92Y9PGAWBnneLS9quHPGKvtuIB0dySbHGw5lQhUzS8FjhF3ufKxdcZjQ4CSz3jJagF4khO02akeL5ppX192+puFq0GO1VvjHjYE8fEbkX3m6mY9qIS560ST6LZQL/8mlxg5FgV7r3YsyGnu+zkJ9qZkEy+YsThKYJLdnSQE9nhe12Uj5nmRLe2MIZOXo0+aRWDMY2ISfr29kiL3LCtXX0s+SpDWGbpNeOoP4r3SbhG4VtBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmL3+L7Cl5dAckDnVUE+Iiti8aK6RZLRV+gD723tGQU=;
 b=wrypKI5NshRRmjTPZIFF04arwJxNgYUIAIk8RX766IoeBZ3zqrAG/e5EJ/YQNuaonw9Xc5k489YK4GNOxOgj9JOqUux3tDxjHYeJOiC7P6r0ZiD/Op5Fe/rLQ1KyRSzSfw5Ng/0J8br8NU8alKxHn56mJubPVc9Gw6VH+31NdJP/KOYFY5mJdaKqo/j5ePVbvvO4tsQDFoKZySS8OqLT8itMVZz8ezF5qAmSFkZY8qrWTlb3TY+JXqh2R7iifsmiGZ26QMeYjgHgTGGkkcOOA9xxsApndoaV2AqSUrWxCcg/VcXyHicEV+CoUmHhW1CN45/dT4iHoVx/xHR5xP1jow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW3PR11MB4716.namprd11.prod.outlook.com (2603:10b6:303:53::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Mon, 13 Oct
 2025 12:37:04 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 12:37:03 +0000
Message-ID: <07d33e0b-0078-4075-bc70-e09a8ec17a97@intel.com>
Date: Mon, 13 Oct 2025 14:36:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/26] drm/xe/pf: Handle GGTT migration data as part of PF
 control
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
 <20251011193847.1836454-19-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251011193847.1836454-19-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR08CA0027.eurprd08.prod.outlook.com
 (2603:10a6:803:104::40) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW3PR11MB4716:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e607722-44fe-4d87-c1b3-08de0a553620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjN2QjJweS9zYmxEWkliY3F1djdEVGJNYlIvcHNUUUpzbFNIcm0yQlJoTlQ0?=
 =?utf-8?B?MXFqL3p4ZXJUQWp3U2pzeUV4UkQ5S2IrQ2xOR1o3YW41MEdRaHNYVUtGR2FI?=
 =?utf-8?B?TzdrRkkrVnkxZUhUQ3htQVRSd25LaGNKNUJkWThwTTVVNENmM3l6SFNPS2hr?=
 =?utf-8?B?OTRrU3lKSW94ZGZkSmVjcVYrK2lEYUR0ZmZ1ZkxaRnRORFNXd0tHbHNEM1Zo?=
 =?utf-8?B?N1pWNWpFdlN6bzQ4TU8rSWlCR2w5ZmFJdjlMS0h2OFQzcEVDZy96YjVrbjZ2?=
 =?utf-8?B?TXNHTzdleFBJK0xQK3dQL1BlbFVobjJWM1duaGFqRjdXVDM3NUFESFRKV29M?=
 =?utf-8?B?aDUyWndMRldFemNxY0VVTjhyYWtDOEZpM1VzaWFGSWpjakNkMk5oR2NkQmpG?=
 =?utf-8?B?NmdGclJFVnE0d2hyYXExdmdoL1lNeTU2dXJxdG8zYUZZQzRTNHJPRGp4aWp6?=
 =?utf-8?B?T0tpN01Xd0RVa1JnOFpwZmM4NWlFYUZhR0ZTVGJlTXRBelQySHdzN3NvcU1t?=
 =?utf-8?B?OTRsanZCMnR1ZjB5QWFHYkkzc0RiQURqUWhmdk1meXZGQkpVT1VlQTFTTTQ3?=
 =?utf-8?B?N3lpVDZMcUdBbW44YmpyQ25QTW03ZzA2V0dTaTZic2w0eC9XU1Vha09VM3p2?=
 =?utf-8?B?RTl3Sy9YWWQydmMrbjR2Q3RKOElVY2Z3NmZHbFEwck12UThKOFJRUGk5ZW5l?=
 =?utf-8?B?U0Noc29TSUo5T3lDU3VBZnEyc1hzQVdyaUo0NlBQUGlUZXloQVQwVVJLSFVU?=
 =?utf-8?B?Vk1JMVM2bUNORjluK0lBRjRXSTVCcktWRGdUNWpVZzlLNkZlMEhpcVpHaWxr?=
 =?utf-8?B?cUtZVWpyd0YxVjY2SjRmaWloN3BwYU1rK1JFb255NDV3cjU2dTd4eVUydWkx?=
 =?utf-8?B?QjkrQktRUk5LZjhuNVR2dGlNNU0xaHdEa3dTQjBiNzhadGhTZXdoMWN3MHFr?=
 =?utf-8?B?dE5qVzNCZ3JORXh0YWxuaTd6Q0k4bkF2Q1VqeUhZd3ZDWXM1WXByWlFLQWpm?=
 =?utf-8?B?eUpYRVozTXZ0cHNza1FGV0ZJNlI1dkJXcFpGVDdCdG0xYUsrOTlEamlWRUMx?=
 =?utf-8?B?U2ZDRFlxQkxWMVhnRjNwc1k1WW5TcGdTbXlwYjNNNm92dk9UWE5iNm9zd2Vn?=
 =?utf-8?B?RTBUdkY3bWN5K0xEbVNXRzNFUjJNWkl4dDRYbTR6NUs3eWZlUHNKUXpibEZT?=
 =?utf-8?B?bEhGcXFZZnl2N0RJWXJDWDVkbW1BaFVrZU5CUzdSbUEzNDNTQTUwdlIxRkZi?=
 =?utf-8?B?MnF0Z0FpVk1tWU1JeVNuSVJEKzNWWCtnU0hzd0pVWG8yOEhQY0E1d0J2SGJ4?=
 =?utf-8?B?VU84cm92UVlzUGVqeUtDRFZDbVRBZFZMN0Q3S09CWDhaZVlnUkVYQ1MzcTVV?=
 =?utf-8?B?YitCYndYRmw0bHpvODE2R0FjTDFSemo2R0Jvak5SSlBnMXFud3I3cUhsSGJK?=
 =?utf-8?B?UjlmTStySUREbzFLMlRYRlBGajNPVlBEZFh6YjRyOHJheU5GdVo1YkhCZG1z?=
 =?utf-8?B?Z3VQbXlVNU5PMlBFeU54ZVJ6dG9zcW1ydWUwR1lvWDF2aTBtOG1yRTA2SUJO?=
 =?utf-8?B?R3Jad1cvU2p4VlJlTmZJbmprbG1HcmI4RlFjbGdyMXV1ejcxSDJvSHNHeDNX?=
 =?utf-8?B?UkhYTklsM1NtcnhJekZkTUdYem9GdXJQZWZud3pjVnNKeDVyZ2psK1k3S201?=
 =?utf-8?B?cXFXNW80eGEvQlV4NG4rTDhSVnIzcjY4QTd2TllIeUtFRkczc3BiVS9FbEdN?=
 =?utf-8?B?NzE0ZlpKait5SE9UVjBTYlBJNTVjOHo2Tit4bUVOL1pRVy85N0FTOVduaEVR?=
 =?utf-8?B?VTJCeWYrNU45SS9UNkdIblhoNXQydnFMbE9sMWwrc1M0R2U4TXdTQXVHZnJF?=
 =?utf-8?B?VDM0MmlGQ1Q0Z2pIb3lzVmp0MW14Z01OVWNmQ2J5Z3hIbmtocnVPNXZSRHFW?=
 =?utf-8?B?UEtuR0k0STU3bjlPUGRkMVNKQ1BEQWVGOENWTVkwTlVvTE83TVRpZVFFMEVM?=
 =?utf-8?Q?sVmZsSOxIiNE+05CEG4HCXms2Zae4I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDArbnpnVzNvU2c4ZGRRRnJtRHljSE5WbHpYckF1bHFtRGJjOGlIb01telNZ?=
 =?utf-8?B?eHdKZDJ6eDFMQWMyOFNoNGtFcm9PeDM4NU9Nbi9zNmltRE5NYVJVbHhMVDgz?=
 =?utf-8?B?NS9TTFZZRmI1RzdMbnlMQ2hkZWtnN21qOTN1RHNaTFBSNEhOWHhQTHNSdTcz?=
 =?utf-8?B?RnBObWVTNGpOY0ZOY3VkdjRwYkR2eDZ0MnVFdnBZYW9wWGhPR21NTk14Z1Zo?=
 =?utf-8?B?YU12dW9BRWUvZEZSejVDYXNHSERSUFQyMG94VEdJOHZlZ09jZWg3TkxLSnVj?=
 =?utf-8?B?Uk8vUGxkZHhkc3JPRnB0RkdZcHg2bWRlb1F5QW9pZWRTQ1lWSkZvNUtoZzBN?=
 =?utf-8?B?QkpZSzM3Rms5YVRkTmwrRVA3M1EvRlAvazBKOWRGakFPZElTQzM5Q1AwZXF4?=
 =?utf-8?B?V2xkSkJYZ0d4QzIxcGg5MnQyVVNYU240N2w2RzkrUkJrdmhZNEdCdDhVcTJH?=
 =?utf-8?B?eVRnZGhiNjZsTmwrTjE3OXhWN1hPanJjeGpDb1VZQzVDWENRUEdqSnJ5NmJK?=
 =?utf-8?B?M1hBNm92N1pFQVd3RHNTRG1NcEEwL0pTZEoxWi9zQkJIbkR2SE5vT0NsWUgr?=
 =?utf-8?B?eXlHWElVWjRiZ1JYc1JMSVF3ZlBtOEVlUXJqbUdCZXFIK3hFaVBPUjZJUHAr?=
 =?utf-8?B?eHF0a1lMZWxoMWpZaWhPNUg1Y3NpMnUxRjErTU9VUGlyUldHUzV2TnZFOUJl?=
 =?utf-8?B?R0hMVFB0Vm1HdHo0R2lQdDlBZVprQTRBRWl3RG8yQ2t1SVB2ZHNmUzRWcUNs?=
 =?utf-8?B?eGF1dW5TTUlLdnVpcTNmS2xKWmg2UjlyTUFhcWdlYncyNkZwYnhPUm85cEFt?=
 =?utf-8?B?Vk1MSE0vUHlrTHkvU0VaZ3luMnB2ZTk1bVFXTmJrbFVrV1QzSVQ5YjErVlRh?=
 =?utf-8?B?Z1B2ZmFSMityc0o3RFM2UGVibnF3UldTWHY4QjB0aWhROXFucWthd3g5NjJP?=
 =?utf-8?B?b1hKbml2eTBvbmF3Nk1lRWJwSVAzcmprTlJPK3RYMWF5aHV0RlNvUXJweFd6?=
 =?utf-8?B?NmZzNTV5bzcxSmRoNENITWpFTll0dDJuVjlmdkpZYndGeFBMRnNCRG5zMm5F?=
 =?utf-8?B?c1VPcW1PaFF2VGVZZTBMSzY2ZnZzWDZUYXZkbkpqSVpneEk2bkR3cTNHMUJV?=
 =?utf-8?B?K0xDMVMwRDZkK0VnSmdiVksxUHZoWjk5TFNnam1raC9GdlBzTXJJMlY1RDlw?=
 =?utf-8?B?RzRVcklNMm5qRThnbDJiMVVFZmZwNG01Nm1EMG9Hd0w5TXlwNlFteWlNZy9r?=
 =?utf-8?B?MDhqQ0hlSGR1WjRQc1pYcU9TZzU5M0VaNFdwRmY1RWpYU0UwZ21xeW9rYmFV?=
 =?utf-8?B?ZTVsZlZWNnJTbU5FV210STJpcTQ1bVdxbUx5TTRyM01GOFlTbnd1OEZJWnRa?=
 =?utf-8?B?d0J5MmJkaGRlSXRDMWRwUzhPaSt5UjhrcUJ4UWZMczNxc2huZUNzSTk3S2Ft?=
 =?utf-8?B?MkhleElva28wTitybnNsU0oxWTV5YWR0VmRtbGFlVUxuNzlOMUtIRmRseDlp?=
 =?utf-8?B?Y3ZlVzdWZkxEMjB6Qk85OGV2NGUzUDB0ZUduNFE3TUg1Y2R3bFRZTS9JWUZ1?=
 =?utf-8?B?c2hOTkt6TFRoeGJLTmdOdURyeUI0bVVoamxLOXUwbnN1dGxVSk5GeUtEbExx?=
 =?utf-8?B?amZuUHgzTUw2UUVVQUVicncyY2Z4eWJIUmVsNm1obzBMb08zbFRtK2FaR3dN?=
 =?utf-8?B?MHV2bEY0ME1QRXFPamdlTVF3YzVtMGJPRjdicFo5eFFIUEttSVEwKzJMQ1kv?=
 =?utf-8?B?U2paeHN4VUpFYXVpTlpCL1BEU0ovT1Z5NC9CalVLNXlQR2ErdkNFYjRObXBp?=
 =?utf-8?B?RkJRc0ZlNzdab0xUZnNWdFRhdXgxTnAwbkx1UmczQkZtM1lacHNIU0IvUEZr?=
 =?utf-8?B?ZmVPWGRBTjlHRHZEUXdLdC9FTlV6K2VSL0gxYUg5L0FjY0tmenFYdTVFYzVJ?=
 =?utf-8?B?eVJISE4yUUpVUGh6dWxXdmhncWd3TmNNYVlPblgzcHRiVTFzZllrRFF4bjF1?=
 =?utf-8?B?T2VHMWYxa0w4OW5tMzdxR2V0MmRlMkp0MmtIL2Nsd3BkdHRkU21GZGp3QzBQ?=
 =?utf-8?B?M1RyaytBNDRnV2psT2VBaGNUeENiZlIyaWkrdm9sSFAxT09FcWMvK2JKMlVL?=
 =?utf-8?B?b3pPQTRJSFcvcXdYWHowR0EySTVjS1hhVWw3WXNXeCs4UzYrL29FdG5KcUZE?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e607722-44fe-4d87-c1b3-08de0a553620
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 12:37:03.2522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6ts6I3/9UNSqs+Dw+2RpzNR5FUbfWfttDre5YaU1rlutOVD4i1W0b2pZthAkbPQ3XtWKtKSlM2aDBg0uiIgWlaUNuKDbriIruc4XYFDHRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4716
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
> Connect the helpers to allow save and restore of GGTT migration data in
> stop_copy / resume device state.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  13 ++
>  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |   1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 119 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   4 +
>  4 files changed, 137 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index f73a3bf40037c..a74f6feca4830 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -188,6 +188,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
>  	CASE2STR(MIGRATION_DATA_WIP);
>  	CASE2STR(SAVE_WIP);
>  	CASE2STR(SAVE_DATA_GUC);
> +	CASE2STR(SAVE_DATA_GGTT);
>  	CASE2STR(SAVE_FAILED);
>  	CASE2STR(SAVED);
>  	CASE2STR(RESTORE_WIP);
> @@ -803,6 +804,7 @@ void xe_gt_sriov_pf_control_vf_data_eof(struct xe_gt *gt, unsigned int vfid)
>  
>  static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  {
> +	pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT);
>  	pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
>  }
> @@ -843,6 +845,13 @@ static bool pf_handle_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  		return true;
>  	}
>  
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT)) {
> +		ret = xe_gt_sriov_pf_migration_ggtt_save(gt, vfid);
> +		if (ret)
> +			goto err;
> +		return true;
> +	}
> +
>  	xe_gt_sriov_pf_control_vf_data_eof(gt, vfid);
>  	pf_exit_vf_save_wip(gt, vfid);
>  	pf_enter_vf_saved(gt, vfid);
> @@ -862,6 +871,8 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  		pf_enter_vf_wip(gt, vfid);
>  		if (xe_gt_sriov_pf_migration_guc_size(gt, vfid) > 0)
>  			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
> +		if (xe_gt_sriov_pf_migration_ggtt_size(gt, vfid) > 0)
> +			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT);
>  		pf_queue_vf(gt, vfid);
>  		return true;
>  	}
> @@ -970,6 +981,8 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid,
>  				     struct xe_sriov_pf_migration_data *data)
>  {
>  	switch (data->type) {
> +	case XE_SRIOV_MIG_DATA_GGTT:
> +		return xe_gt_sriov_pf_migration_ggtt_restore(gt, vfid, data);
>  	case XE_SRIOV_MIG_DATA_GUC:
>  		return xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
>  	default:
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> index b9787c425d9f6..c94ff0258306a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> @@ -72,6 +72,7 @@ enum xe_gt_sriov_control_bits {
>  
>  	XE_GT_SRIOV_STATE_SAVE_WIP,
>  	XE_GT_SRIOV_STATE_SAVE_DATA_GUC,
> +	XE_GT_SRIOV_STATE_SAVE_DATA_GGTT,
>  	XE_GT_SRIOV_STATE_SAVE_FAILED,
>  	XE_GT_SRIOV_STATE_SAVED,
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index 0c10284f0b09a..92ecf47e71bc7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -7,6 +7,7 @@
>  
>  #include "abi/guc_actions_sriov_abi.h"
>  #include "xe_bo.h"
> +#include "xe_gt_sriov_pf_config.h"
>  #include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_migration.h"
> @@ -37,6 +38,117 @@ static void pf_dump_mig_data(struct xe_gt *gt, unsigned int vfid,
>  	}
>  }
>  
> +static int pf_save_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_sriov_pf_migration_data *data;
> +	size_t size;
> +	int ret;
> +
> +	size = xe_gt_sriov_pf_config_get_ggtt(gt, vfid);
> +	if (size == 0)
> +		return 0;
> +	size = size / XE_PAGE_SIZE * sizeof(u64);

maybe it would be better to avoid reusing the var and have two:

	u64 alloc_size = xe_gt_sriov_pf_config_get_ggtt(...);
	u64 pte_size = xe_ggtt_pte_size(alloc_size);

> +
> +	data = xe_sriov_pf_migration_data_alloc(gt_to_xe(gt));
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = xe_sriov_pf_migration_data_init(data, gt->tile->id, gt->info.id,
> +					      XE_SRIOV_MIG_DATA_GGTT, 0, size);
> +	if (ret)
> +		goto fail;
> +
> +	ret = xe_gt_sriov_pf_config_ggtt_save(gt, vfid, data->vaddr, size);
> +	if (ret)
> +		goto fail;
> +
> +	pf_dump_mig_data(gt, vfid, data);
> +
> +	ret = xe_gt_sriov_pf_migration_ring_produce(gt, vfid, data);
> +	if (ret)
> +		goto fail;
> +
> +	return 0;
> +
> +fail:
> +	xe_sriov_pf_migration_data_free(data);
> +	xe_gt_sriov_err(gt, "Unable to save VF%u GGTT data (%d)\n", vfid, ret);

use %pe for errors

> +	return ret;
> +}
> +
> +static int pf_restore_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid,
> +				       struct xe_sriov_pf_migration_data *data)
> +{
> +	size_t size;
> +	int ret;
> +
> +	size = xe_gt_sriov_pf_config_get_ggtt(gt, vfid) / XE_PAGE_SIZE * sizeof(u64);
> +	if (size != data->hdr.size)
> +		return -EINVAL;

do we need this ?

there seems to be similar check in xe_ggtt_node_load() called by restore() below

> +
> +	pf_dump_mig_data(gt, vfid, data);
> +
> +	ret = xe_gt_sriov_pf_config_ggtt_restore(gt, vfid, data->vaddr, size);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_ggtt_size() - Get the size of VF GGTT migration data.
> + * @gt: the &struct xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: size in bytes or a negative error code on failure.
> + */
> +ssize_t xe_gt_sriov_pf_migration_ggtt_size(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (gt != xe_root_mmio_gt(gt_to_xe(gt)))
> +		return 0;
> +
> +	return xe_gt_sriov_pf_config_get_ggtt(gt, vfid) / XE_PAGE_SIZE * sizeof(u64);

this conversion logic should be done by xe_ggtt layer helper
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_ggtt_save() - Save VF GGTT migration data.
> + * @gt: the &struct xe_gt
> + * @vfid: the VF identifier

since there is assert, probably you should also say: "(can't be 0)"

> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	return pf_save_vf_ggtt_mig_data(gt, vfid);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_ggtt_restore() - Restore VF GGTT migration data.
> + * @gt: the &struct xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_pf_migration_data *data)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	return pf_restore_vf_ggtt_mig_data(gt, vfid, data);
> +}
> +
>  /* Return: number of dwords saved/restored/required or a negative error code on failure */
>  static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
>  				      u64 addr, u32 ndwords)
> @@ -290,6 +402,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
>  		size += sizeof(struct xe_sriov_pf_migration_hdr);
>  	total += size;
>  
> +	size = xe_gt_sriov_pf_migration_ggtt_size(gt, vfid);
> +	if (size < 0)
> +		return size;
> +	else if (size > 0)
> +		size += sizeof(struct xe_sriov_pf_migration_hdr);
> +	total += size;
> +
>  	return total;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index 5df64449232bc..5bb8cba2ea0cb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -16,6 +16,10 @@ ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
>  					 struct xe_sriov_pf_migration_data *data);
> +ssize_t xe_gt_sriov_pf_migration_ggtt_size(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_pf_migration_data *data);
>  
>  ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
>  

