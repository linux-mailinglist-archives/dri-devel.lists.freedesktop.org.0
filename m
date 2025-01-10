Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8277AA08AC7
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 09:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC7610F01E;
	Fri, 10 Jan 2025 08:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S56e3YXp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0139010E03D;
 Fri, 10 Jan 2025 08:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736499425; x=1768035425;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y9adq9tni3Lk07or8cG3ZQwDkgcUzGdaaiqemNcUcEg=;
 b=S56e3YXpu9i94TS27+ZHBVwWkqpwuxK9bxQ5NQUUL8DmoWgbJKPPf6of
 09BeB6ssVFNxRdH2mQLON9DhBsmrVl8Blz1Xkzer3RFOCSLDZytO8Qs7B
 P1QmDSHIjN0KBMNKSFDKuQCenQaaOHsUYKGcgdA+1+nRKzn0yGZlEHS0q
 DuAgjWoEoCf4mEkCPIUn6fwLepYoZ+KPq1lSi0XSt+HXLQK/1MO1D2B+l
 W9wfY9/zOnBBtt12+EitUq2K9yTsH4iqqgbgD4GN7bp/5yWHmnnNwFiY5
 TIPjp2WZ6DCQVrhAQIzJJuwPhfSJofeI++7brIlyxEEPvnFseIyrOa8wy w==;
X-CSE-ConnectionGUID: S3DWVrIaRqORQpNlF2TjSg==
X-CSE-MsgGUID: P2TJd3VLR3KTnka6ry48Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36686545"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36686545"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 00:57:04 -0800
X-CSE-ConnectionGUID: WQVsgNkOTuCRqjJe9sU4ug==
X-CSE-MsgGUID: waBQq38dQQKEOlaYd3ELYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="108673007"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2025 00:57:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 10 Jan 2025 00:57:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 10 Jan 2025 00:57:04 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 10 Jan 2025 00:57:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSWZYvVwvW87WtWfQFDOpfVTCHHx3GnFKwtZbVSjLqrftLoV77n/cWfxLH64QI4jfFnLnB1K3VampM5XSsk4OmDPm9l8xH2qdWZttRiYJ/YdjMI+qPybb86uFFibEvLlQHgacgVjBKyCWHBWzIhBUTeFOwzj+YkqN6G8oIkSBl59k2X0kmsMpwkf++8viIHRoInul9XCJ0on9BEKyl4Qzdw1CvkEuIJb9bVPCTmMoP6k3WRMmpoNAlQTnVr3HaRDZ86bfyBulvv7ZeYGJzpdK5CbEhCIdhUnLqgVsex4o+XoGwO7sJiNXh61zj3WMGJ1U6j4G5vDEvZJKB+7i4OMiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfReyaNNNQHCEIOlL0r6OoX6+F4wZ/i0vXmMfYTcz4A=;
 b=CtJMUjYLtviDeWf3FC5ONaCa0O82mAQj3P1xS2mK+mdEKILpVZX5a5J5ecVgI0qY0uHrA9Sl+HwkqpOo1iLqmCVSBRUA1iZRpgRo60/D0sPlJf9Fo0sSU3a0dtzSX5kDP4FMT/+TUncsYSykNB1DX9SWWSBfvb/YIEU/gXYd2Dlkf7YkbVk2hZANX5KsRCYM3D450hJDd2OQDl6SfZwyFdnA+56ncZM0erD2i3u2ioUyt01cdMe+bvPMnB2NJZtEwiuijwVWLmVdvek/p6z27Fe9QbVwTcJnJG64nnRiN+nWVKVSkkcKIN77DhJr3ETC0IuyHZA/H2GQS2yKv5MHXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SA2PR11MB4892.namprd11.prod.outlook.com (2603:10b6:806:f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 08:56:47 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 08:56:47 +0000
Date: Fri, 10 Jan 2025 08:56:37 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tursulin@ursulin.net>,
 <karol.wachowski@intel.com>, <tomasz.rusinowicz@intel.com>
Subject: Re: [PATCH] drm/i915: Add VM_DONTEXPAND to exported buffers
Message-ID: <5osppar4nsaysb4nbqpembbsjqweyq5p3id4b4hr2r6xgkthvi@f22j4pkxrutn>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250108105346.240103-1-jacek.lawrynowicz@linux.intel.com>
 <mk5kmhrk5kpqaf4o2wfkqt4rqijsprj6r5om5ygcempavigl46@eqeupyenr2xj>
 <805016ca-c8b7-4455-9187-3972dab21fbc@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <805016ca-c8b7-4455-9187-3972dab21fbc@linux.intel.com>
X-ClientProxiedBy: ZR2P278CA0003.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::6) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SA2PR11MB4892:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c0f645b-155e-4e64-359e-08dd3154b6ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnhTSHhUK0ZTMEVsTGx2OENMT1JhR2N2TkJDTkFkKzFuSmpHWm4zUC9FZnZm?=
 =?utf-8?B?bStKRmJJaWtDK0VlbFhCTFFIeS9BZFJFYmcwdWRYb281NC9aMmV0QytSNml6?=
 =?utf-8?B?QmpyZnJUbGxlR1hSVzNRaGh6Q0VxblA2OWJUQVlPOEZHTmh2S0ZUbHQyM2Fw?=
 =?utf-8?B?T05lb2cyckhGdnIxRUc1QzFHbXlUYmdyZ05iVmdOSU03N1dyQXpVd0REL0tC?=
 =?utf-8?B?SUtpWE9WTmlGQnFjL2FKWkVWUWV6WG8wbUtxK1UybGNteXRYMWgyY0VVKzhE?=
 =?utf-8?B?MU9mYVNmN3IvSzUzVW5XNkF3SUd3N0VySFZHbk1EOWpCVWtIT2FEbXRaSEpm?=
 =?utf-8?B?YUxpTkNMdnFHWXBIYmVkdk5kNE1QQVhPMkxkREZjd3VSb01uMmhDNTgxRGhT?=
 =?utf-8?B?NlV2NFFqdkZQMGtqL1hheERaVEtjMktkRk5WVnhHMXFkemNaQnI3cmRGcEh0?=
 =?utf-8?B?S2hWbnBLV0YvMHdsdDRlaXF6eGFRNTFhS2EveERjcUNON2ZORm9xdTNzK1Bp?=
 =?utf-8?B?UEJrYkRIMkkyWTRvL3NkNVN0aSt3NEVwcVkxemhWb0pLd0x5SW12d2NscWRT?=
 =?utf-8?B?WnF4bHdKV04ycHBLcUVSbkt0UWxDYktMU3RBdTZDanVUdmRPWU83QUpteHo5?=
 =?utf-8?B?Yks5WnNnOEphTzg0KytROVU3MTNBNzhCT0NBZTByVnZWb2swSDVYZTA3TUVW?=
 =?utf-8?B?b01pZmRCaFdaV0tWS0E5L0lXb2FKUGNUZE41bWswT24rNDBDYXpHQkQzc29D?=
 =?utf-8?B?QW9IeGptbW1aQ1RHc3BuVzhpclNqUUY0VHFkTWloWXd5RHJwZnpkU01TUkdL?=
 =?utf-8?B?dzBsSTE4RmZhbFVzUEduRlRZUmpNaWpoWjJhWSswY1NBUEU2bzRUMlA2TnYv?=
 =?utf-8?B?ZmFHS1Q3ZExMbnFyNVJXZXg0eFIxR2VZUllGK3RHMVAwT0Zub3FKRmovVHhO?=
 =?utf-8?B?MTlqVCsxTjVqdmpSN0JuWlhUYTFaUHlZRHMxYks0VVAwS1k0SGErQUdoRTdI?=
 =?utf-8?B?WVFaVFRuZ012T0RUMW1RMHNUeEhlMjVJeURNaDQrQWR5NFZaYS9xa1RZWHlq?=
 =?utf-8?B?L0p3Ykxtd1ZSaEkyOFcrUm9UWG5pcU1UQ1JYRjk4N2FHQzJibFhMa3RtUkpz?=
 =?utf-8?B?a2xjUUVxUnp5WHQ0dzIwN1QxUTR5RGYwVmp5L3NZMXM5OCtUY09aRTM4Zjdx?=
 =?utf-8?B?alF1Vlp5bjVUYVdLbnZqUURWK3VGZExWY3o4VndGbitIU3ArSGIzcGlza2ts?=
 =?utf-8?B?VWtNSyt0Zm0zalYvNHRJWlhxSnRIOURHc2JKR25iR2FtdE8reGNoaVh5eEht?=
 =?utf-8?B?M1RTaHhPK1BodmkzWVlwekNwUFNvSElYeks3bkk4OFN1UkIwQWRaNExWK2pa?=
 =?utf-8?B?c2wvK0NRZmdGWVl5MEpxYjBsNXhXUjV4UGpETmlYZUtybWJEZncwYlltcitQ?=
 =?utf-8?B?dG9SQ0VQOFdkRzVTa2NYb293TW5VeGdDZWxMa1hXQ2lQZ2JOd1JIMlZMdmw4?=
 =?utf-8?B?ZmdMWUIvK0dhUW1sdmhSSzAwbXBhZTE1TXVscFhBNTZFNWQzaEFwbFJ3VmlL?=
 =?utf-8?B?Qnl2aFQvSU9lUmQvd215enBKTi9Bdjg3QkJobDBZT1hQMmhrbVJpVDR3cTZo?=
 =?utf-8?B?Uy9jR0oydTdPNzdSeHBoR0VQUGllVkNLeWgvczR1Q0JNL3dldnJmRC9nTkpP?=
 =?utf-8?B?TFhmeUJrNDlab3hwckZhRWFrZVFnSkR2NzlERnNrSitUejMrSjJ0dVpQUWgx?=
 =?utf-8?B?YW5HNnRrNGU5OVRmMzVqOCtGZ1JWYmwybzFTRmF4Yno0QUtDZ3F5ZnIyNDJs?=
 =?utf-8?B?TU1tMEtxWE1aK2Q2Q3AxblB1ZTR3RUtoRmhxL0Z6Y1k1a1graWtrMHBKV0xB?=
 =?utf-8?Q?gw/xolGA1QDpt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OExYbmpMK01BT24rQktFUDVMeU1pTFRoVmpiRUVNUFh0TWRvdCtvd2dsWkUv?=
 =?utf-8?B?aE5FWjNOL0JwZ3l0dVViazJkbEt4Nm5QYlhObnJOUThkcVYzbjRxU2VDLzd6?=
 =?utf-8?B?bndZcmkyNllQL3lReGQyYm5iYW4yY0NPbHBOZk10MkpuL1YrQUZzRVo4Nk90?=
 =?utf-8?B?a0FMRWVibzk3UDRvSkh1YndCZ3lMN01FSXo1b2d4S2l0VTJsd1hLLzRRMng2?=
 =?utf-8?B?STVmL0pLN2tvbUpjWVN4N2NWSXFhQ1p3dU9HcVhSSmkyaXZZeW8xYU1SWVZm?=
 =?utf-8?B?V0ZSbS9tRnJYc2ZSZWtac2tNT2Z6WlJaVTFGeGlNbUpoWVFnNysvQlpvaG5S?=
 =?utf-8?B?aW1UcDhtMEQwalhGTWlSNWx2bHhZYkM1amhwMVdoTUdUeU1QRG41cTlkVTlZ?=
 =?utf-8?B?RVpOMzJpVlJWYTRMa0VSY1BHWWUvQWtORUYvUnRaaitGNUgxRHpwSmoraXhm?=
 =?utf-8?B?ZUdrK1dFWFg0MDVTVTBWRUI2U1JJODd0K0U4MDAzMVkxUUJkNzFJNEVXbGkw?=
 =?utf-8?B?OENTR2YzRWpIdFpMZWkzbENxT1dSQVhkNCszTUs1YnF6TXF0dVJBVTBWUmRX?=
 =?utf-8?B?SzZDM3dvTDViVkhWc09xa2o4QmttQ2ZVQ3NtSzlDc0VRcmppeXo4aGVPMlcx?=
 =?utf-8?B?NVY4NG1QTG45TkM0SGNjTVUzRy93UXhMcWNMZS9oLzJIKzMwNVlaL2ZMaVlj?=
 =?utf-8?B?ZS9yRDB1VHQ3MEpUNnVBYVA5NDZscDAyOHF3U1NrU09oRHBrWmVNak1HZXda?=
 =?utf-8?B?SGJIdFFYWjQ2enBJUDdudlhxYlBVa0pTcXlLY0xmaGp1SmlVVmdVdzBML1Qy?=
 =?utf-8?B?L1BKTFByM3NOMmEwVVNGQjd1SUNGUTZJLy9kUGhCNnV5L1FzMnJ3YmJsV0sz?=
 =?utf-8?B?OUhXZjJuTHV2TDFHdnRJMWY1MkUzbXlXZ3lyVXZ4TWNVL1pwcWY2N3ZuQ1Zj?=
 =?utf-8?B?TlR5Wmx5Z3YxUWkzUFk1UUFNeittRGpERW1nbGlWb2tQQ1k1UzI3VmEyNmdD?=
 =?utf-8?B?RFBpUFJjMXp6QWM1bnJuaTRBSUVJNi9neTV5ZVZtYnlid3p0Tk1JUVJNUTJa?=
 =?utf-8?B?bnIrTnlMTEVpbUFHOFgyOGR2ckdKcUhLOENxRkZWbkczd3ZCNlg3cW00eUtZ?=
 =?utf-8?B?SFlMZk9taGZKeGZ4THZNYlo3Q3J4VGNFQWw0aWQ4TDQyL0J4eXhZQlZIVVpD?=
 =?utf-8?B?eXFtUGZkSmU5VEJNZlQ1Z3FpTUJFRmpySGE0dWxBM2g0L0tYby8zdXpoMHNn?=
 =?utf-8?B?YVkvcWt4UGhmbHRqaFM0dzM0Q1RJb2VyeFB1cG9CRHpNWTM0dFVibjh6R1ZT?=
 =?utf-8?B?ckRJY2E3OVVNaWVRVlFZazY2T2dYNjZUZkVXSFZUS2kyQVJNTVVnTzZ2aStE?=
 =?utf-8?B?b2xXL2tuNGtrYi8vclkzeWxGc2JpS1pzck40SW1jOVJ5QkRGbDcyZ1ZnZGhn?=
 =?utf-8?B?bmM4dlE4SHloeXFmUTFMSWtwWnhIcUJXRGdrZWViZm53eDNDck1hNVhRVTBB?=
 =?utf-8?B?dnN2eDdIaU9tYm5vVGYzbUROeHUyN1ZvV2JGbUlkOUc3M3RjVXNEN09hT201?=
 =?utf-8?B?R0lQTEpEMWdOODVjZzI4OStBbjVrUjFyYVRBSHlSTDBiNnRtdnZNRXQ0WHVJ?=
 =?utf-8?B?TWRyeVRHZjR0czhrZWwrMnFiTFllTnRSdEhKVWp6V3p5VlQ2eFQxUm0zMW9n?=
 =?utf-8?B?d3l1dklhbHNtWXJYdVozWmhsOENMV0xja2hVRUUrV3RDbTFGeTZjQWhQL3Bk?=
 =?utf-8?B?TCtkdGQ1YmpBMTJpMG1hQlJWdXowejB5OWxhYk9FQWhPbHdPa1YxN2lMMHpQ?=
 =?utf-8?B?dWRDekFaR3BUOVlyZmNlTkY2aklPNnRSNEpWUVhyTFF1OFhUeGh4MnJaK2RD?=
 =?utf-8?B?Qi8zb1o5UkJLVVdzVmdFMHBjT1h2R0tiLzlSQXRzVEtVOW5ubGt4R2oza3Z2?=
 =?utf-8?B?eDk2MERjNCtqQ3FxaWpxUDQrNjlzRXA1cGg4S3VhTmp4cUh3bnMvaG1oaE5K?=
 =?utf-8?B?S0hDTHQwVXZHejdUdGxaT2F2VjhzbmxIUnRHUE95eEoyMmEvdyt1SkEwSEZT?=
 =?utf-8?B?a3lmTFE3WnBMelIxRWZ6eXVpUkYxM3ZvUGhtRG9Yd3BhOWJWdGRMQVF1LzFJ?=
 =?utf-8?B?VUtIOXFsY1RTZTR6NFQxV05yNW9HVU1KRlBleUJDM244STNOVkM3Wkg3ekRq?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0f645b-155e-4e64-359e-08dd3154b6ce
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 08:56:47.1968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrdpvZZd4nRTFmkpX+hGAtTUK2HOOJ1BOND0xZd5SkmktGmcL0wrL4nXoEOBLSbCTFDC1sPe5BR4Wdoi1v72jkbpojzp6Opcc4+SPPHo0aA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4892
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

Hi Jacek,

> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> >> @@ -110,6 +110,7 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> +	vm_flags_set(vma, VM_DONTEXPAND);
> >>  	vma_set_file(vma, obj->base.filp);
> >>  
> >>  	return 0;
> >>
> > Is this an existing issue somewhere (on GitLab for example)? The fix
> > looks good, I'm just curious how you noticed this problem and if the
> > patch should have "Fixes/Closes" labels added.
> 
> We noticed the problem while running internal intel_vpu tests that import buffers from vulkan.
> These tests will be upstreamed at some point but currently there is no external issue for this bug.
Having a test for that would be beneficial - it would let us verify the
necessity of this commit. Looking forward to it :)

> I will add Fixes tag.
Please do, having a reference point would be good.

After you add that:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Krzysztof

