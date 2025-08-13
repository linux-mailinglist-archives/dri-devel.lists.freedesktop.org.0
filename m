Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32A7B243AD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 10:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35A410E4D2;
	Wed, 13 Aug 2025 08:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="msferBsE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFDB10E4CD;
 Wed, 13 Aug 2025 08:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755072365; x=1786608365;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QgRI3e/Tp3d+BTf4CXzonbs046/Mf24wHOyE3Pnr8us=;
 b=msferBsEyGZ6JkmgkcfD9G8YhMmfUs+Kiu3SZ08PofzKK4DHKD661+vI
 dmIpt/DRxscAHI7oan3Pvbbkfot0eh5UHGyyvFgCRx6dVkkcU0jqLAUxP
 73Ib2VpweQEkxyQbQKuMc1fSlZTyUIQX/EImbzbG/wRsFN+oMKDp0Nbq7
 DGpeP/bxf57WhpdOIWJLcrx0bHGRFsZGyaubl/2xw4vfcANDEh6cZpzGN
 patSPAtxFHqNFv/8XtgxjDbcqOBqCdlw/+IObBOxBeQMjB6horhS8+xKX
 0Ha6jBVtGEbhcnGDsV3aZDnlQ2oS/4+8XYmMkN4RZTGiu2POdKCau91Q2 Q==;
X-CSE-ConnectionGUID: rgcMhi4ORCCLKpzl5DCqKQ==
X-CSE-MsgGUID: FY/3zWjvRmGPTpQq3NnK+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="59978856"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="59978856"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 01:06:04 -0700
X-CSE-ConnectionGUID: MwUI43gbQg2pur1CfCSvSw==
X-CSE-MsgGUID: +uKaZ+S8TnqxYhCzt+kbKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="203588126"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 01:06:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 01:06:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 01:06:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 01:05:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWnQOoklsktVaOkMm8NYnO/LLBjZH6xc9/ArGxbEvBTUe4YDKfoKk2+5IBozQT1BlQB1A6EqOGlThbOY50f+RITYb4oMIoAyxezHGIZd24rEVL4bAXQo40sxME/tPz8hVXFrPYT8Esu60/JaG6LN1iLsZGpamobJ/zaA3mAgu0FqdkDA9n38RSd6u9UWMTauJs1snj0hbV5ov5ExlOffWlSL7Q9nlprMeYCHJHB/FzZ7gkx33fzPLZNWEMdmQJEeibDR6xPcz6SZUAbmI7OuwfCchKj4p4OT4rKUx3nTNL/jk5zP7Q95oCpHPtIxP+DuGquhDtZvVSCPiksXx7Azrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLLMUOhLnbo5PPi2J0YzZVfF7BIxN6JXfOmPlAcy+U4=;
 b=ebKZGeyp8k6WMVzC3wTl20c2ROZijeneaZr6apC9t05kX+GAN6CkbsyQH7NWSKW2xfritj1ARWPhKxWgRstWKYliw6cWfqVRB57BC8WAKp7eNkpGpcABudRrbqYXSUUBgjUWJSt4VxQ6PKJTYZUiWU0EcosiBhUvVC3DDApEPftjI2TWO1OX3wjOpK5YdvFlny6nQL+OtlgNEGYzWflsD4tlaJ2j9J/cOmYwn3o+N4+uHhL1Ak9gmO9+5l4ezLJglpqqBR6ewZK3ZV53dUCgoTzHwP9u/NErpafZtElCL62A0Fdb9v8XzD0HuGZS8J40B9O3a8pBpNFnjyAH8m0kEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BN9PR11MB5243.namprd11.prod.outlook.com (2603:10b6:408:134::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Wed, 13 Aug
 2025 08:05:56 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.9031.012; Wed, 13 Aug 2025
 08:05:56 +0000
Date: Wed, 13 Aug 2025 11:05:44 +0300
From: Imre Deak <imre.deak@intel.com>
To: Timur Tabi <timur@kernel.org>
CC: <nouveau@lists.freedesktop.org>, Danilo Krummrich <dakr@kernel.org>, "Mark
 Brown" <broonie@kernel.org>, Ville Syrjala <ville.syrjala@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 19/19] drm: Make passing of format info to
 drm_helper_mode_fill_fb_struct() mandatory
Message-ID: <aJxHWM8LBLcV5SDD@ideak-desk>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-20-ville.syrjala@linux.intel.com>
 <98b3a62c-91ff-4f91-a58b-e1265f84180b@sirena.org.uk>
 <aIOIX8W6olY8ryTN@finisterre.sirena.org.uk>
 <aIOTaOA6bUelUtBm@ideak-desk>
 <aIPES8pWAdCVB07L@finisterre.sirena.org.uk>
 <aIdPW1a5OgTlHweN@ideak-desk>
 <CAOZdJXWKs0ZWjpiOKFOZRn8UiSsFnAsQ86f=KaCYJwhuvqkDDg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOZdJXWKs0ZWjpiOKFOZRn8UiSsFnAsQ86f=KaCYJwhuvqkDDg@mail.gmail.com>
X-ClientProxiedBy: DUZPR01CA0029.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::18) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BN9PR11MB5243:EE_
X-MS-Office365-Filtering-Correlation-Id: 895507b3-0e31-4ec9-d3dc-08ddda403b13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTBKY0ExYjNnMFFZSStMNjRobnhtaUJ2eis5UStMRDBiT3ZSNENwSmVpTjAw?=
 =?utf-8?B?OTZwQWpiKzZDdWJSaS9GMlhubDRwM1ZMVTBYanUwVUxodUJLTEpteUNrZFFy?=
 =?utf-8?B?MDljVXBaN2ppMGFCa0phWEFqU3ZhVmhQUkFZa1JjSjBzV2xrSjQ5aFJZZjE3?=
 =?utf-8?B?N1hkSUFqeEdlNiswK2xYR0d1OUJISlpLZGcrNnN4Q2UzVDdudVZ3OEpBeEsy?=
 =?utf-8?B?NjFhR3FKSnpDRW1CeWcwVklYdXg4ZlFnamV0cEN1OXFqZFBxOFl6TGFRVzM0?=
 =?utf-8?B?bHdVMWVBdWZRRzZabFFOcjc3Z0wwelRGVW5FNGVWZlBNanUwWVI4aVBOK2xj?=
 =?utf-8?B?Vk1NZEV0NkgvaXg0QU5VWUNmekxRUWlFSmtxdEc0YmxrRm5aWjA3S1l3VnNx?=
 =?utf-8?B?a0k2UlljYWhlSWl3dHMvYlVOZW5WblpzR2oxTDNZZytaUUNZaEl5TGVpR0xV?=
 =?utf-8?B?NDNCMG9QOTJwbExrSlNBY2UrREtzWXJRNXMzemh0bW4rWE1qOUU1YnpZR085?=
 =?utf-8?B?cWI2bFFqNzFTcGFDSDZUcllMV1VQTzJuM1MySktPeG1CbXBvQ3lMcEtoZGdh?=
 =?utf-8?B?Rlp6dlZFYXFMcWwxb3NiQk9ZY1RHWi9tRS9CYkxOTVVqeDEwT0xkd2ppVTJG?=
 =?utf-8?B?SFFLZFRHUWFEd1NJYVhad3hpaHlkMlQ4dGMxaThOdWpwU0ZsVVZ0KzJGUmhw?=
 =?utf-8?B?d3lVN243L3R2WWE2NCtoSEVYRFh1bE5UemhxSWNFMnM3Znd5WkErWFB4RVhw?=
 =?utf-8?B?RjAybTNaa0Q1K29yWkxvVkIrWERtZU0wMEQ1QTBPcHVZRUxRWlp6RFdrbFNU?=
 =?utf-8?B?S1kzTkFsMkdHdVpibE8rU04xN2ZFVHdwNEFUNjA4VXBzUGdTcGRkOEdyM2l6?=
 =?utf-8?B?TFg2Q1pDMC9rak51bU4zTzN1QzZMc3JOZzM4Y1JhZUVqeDBtRDUvdFhvUHha?=
 =?utf-8?B?SHBQSlJQbzhXL3lTUWxCU2NTN3VxangrYmRvczF1UzBlMC9waklFb3FNN2Vm?=
 =?utf-8?B?SVZSNEp2ZE5Bbk54QlRRaUFHTTRxVFVwWE5PUEFxVU5WTHBGdDI2eS9nZWlL?=
 =?utf-8?B?Mm9uV3hyN1ZFTWlEcGZId0FmcnlWb29UaVFOWGhYV0tKYm56cW56bnV6UXNm?=
 =?utf-8?B?TDMySGo2ODdUM0hQZ1RoeFNyZHRLMEV3ZmExMVoyeUViWURDaGZhTU1xUURL?=
 =?utf-8?B?ZXpFVG9xN2VqWDliOW5mL0pDUHlrVVVFbElMWTZBTitCbjJnRjllM2g4dUZH?=
 =?utf-8?B?UWVjMEtYWGd3QXJ6b2RhUXRwRnhLenRxd1pjNXgzZW5MUEhNWXMwOUtKNkdm?=
 =?utf-8?B?WGhyUHpVaDNHREhtUTZjZmNGcm92bTNHb1E3WUkzZ0g5aUhpZnVtV2tHWlUr?=
 =?utf-8?B?UnBxWEs4VXVST0wvbEMra2l0d2NyaEluVmY0WHpDZ0x5WC8waGxrTlJhQkVW?=
 =?utf-8?B?MDB1SGZhZzlQSS94eCt1eWtEVFA4bCtkQnNGSjFNUTBSc0oxQ0oxTzNaOHlN?=
 =?utf-8?B?NVVSd3ZReVVBZmpLdG9TVERBZnNKNm44U2pKcjE3MzUrT0ZPM2RaZ21ONmln?=
 =?utf-8?B?b2REV3A3dkNxd0gyL3ZkUGpMZ0V1UnpQbTh5ZFZhclM5cWxVSm00Ny9yVkhk?=
 =?utf-8?B?b3lJRy9ZVnQwYWZ5bkRLanFsWTJpejBRbHpUT1MrZFpRUFhqcWo0aml5ZzlG?=
 =?utf-8?B?L002SlZuYm1BNHQ5bVhKV0dXMlNvOWJyTElBZDg0MXhJZ3I3UTB2SGR2Nytm?=
 =?utf-8?B?MmFMVnlNS3pySkxzOHRPYTUreU5pR0FUWW9PQktYeDlvR1Y2aXBvNnpJNnJI?=
 =?utf-8?Q?BpYjJ1GvsxFxfrJHWK9QpEwpWEiNG5vU0EPy8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDVFNXk2TmZGcG9nbDl0QjRrVHZMTTA2NCt3ejFQdWxXVGxzRFZxeTJXMUtD?=
 =?utf-8?B?WTNpQk9KSkdwZHZLNGtPbXkwL1BKVXBIV0dCODBzdUY4cTJsU0Q1SW4zTmky?=
 =?utf-8?B?Mlc2UWpyYU5GOFoxZUZRR2s0QlcwRUNpMHp1Q0NJUEhFUHdJRThwUzVTWEZH?=
 =?utf-8?B?a2c4RE9iVDZpOVlKLzV5bk1Ia3pJMWpVRi9VOGlIZHl6QlhncXlFTjZXMnlW?=
 =?utf-8?B?TWkxb1FscGpRM05Ma3ZOamFMWWJ3WEdHWkdLWnlPNEhnSkFRczhCanNnb3pa?=
 =?utf-8?B?S2p2ZU9SZnd1dVNDV0Z5K3g0QlNNc09OQ3pnQkcrT2ZaTGNaU1ZGSE9yaTJV?=
 =?utf-8?B?S3p5NjNPYW8ycnpzRzBzdmwyaDBCWFdRWlRBTjlnR0lCc2xVS3VnYnZCTWRD?=
 =?utf-8?B?MFdIdTYzNmMvMEZTWHZkeWoxWEorcEVGRld0VStaVWxtMkJnY0hPWno1Ykp0?=
 =?utf-8?B?TTgwYVkwdUViN1VCVjMzNjBTSjV2UW9xWjkwMXJTU05FbG4rc3l6RmpTNTVx?=
 =?utf-8?B?K0ZkMW1HMitCS3E3eVpkMnZjQzBlRkJXYnJNd29meUthS3JMNVRSNnpwZkN5?=
 =?utf-8?B?UkQyaVo5Qk9wL0FLUzg1dmdOZUcwTmEwUDlwOWZ0bWppeVFtdGlsZXc2UjhU?=
 =?utf-8?B?SHZFaE5PUVBmRmQyQjlEYUQ0QlNRNzloQ0YxTkl5bVFVcm1RWXc5Z0M1V0J5?=
 =?utf-8?B?cTcvWXo5NGNxbWRjL2VvaGtWNlFsN0JCb01NUlB4TXcxaU13TG0xV25Wc2tm?=
 =?utf-8?B?RkhLaXhGK2JxY2ppN1ptYkhHUkRkZWpuRUM4Q2NLVkZJbVRaY1Zvb3JuSXJ5?=
 =?utf-8?B?cDlMalF5WW81OXNvZHM3Wi9EV1FVVWNhSGRYU2NEOW9jVDVybU5qam56NXlP?=
 =?utf-8?B?N0RSK1QzRVZibDl4alJCTVpkY3dRTHB3WE5WZmQrMWozQmwyUCtyRmtRczJH?=
 =?utf-8?B?YWV2eWx2Z3FuYTNtS3Z5a3JiNTJIN08ySjlkRVg2VjNXb3VZR3laMGlmRk90?=
 =?utf-8?B?ZWVoeTYvSlZnY0krU0EvSGoxcnpDd3VEQXZibDR0cUdwOWdtWUo0OE1ERnQx?=
 =?utf-8?B?M2ZCaUFWbWJGbjhiY1NQa09tRmZ2azZyd1RtNFJ6blNhS1Z0ZGVrMEFxYUJx?=
 =?utf-8?B?TWNRdlRJVUtkUVdTc3Njd2RDalRYSStwWU5SNmFLSjNRVnZCcFI3R1dlR01L?=
 =?utf-8?B?YlUzaHR2QTBWM3RqR3hWcENPVHQ5TjVjaXg4SUVpSHpzb0U5M092KzNvdVc0?=
 =?utf-8?B?VXFSN1FEQTBEUDlud0pudXNsUi81aTErNGRoR1RTaU95eUZ4QzhCMDB3VGFi?=
 =?utf-8?B?aGgzVjl5citIOGVkR0VzWmhCaENvZWlja2FhVmVVS0hlSXNnUy9vTzZZMzBh?=
 =?utf-8?B?eU95UG44MGNFdWRXaEwvajR5SXBBMlNPZngybE1rUDNIQnR2Ry9jaWRWeTJZ?=
 =?utf-8?B?QitLbHByNlRyNVp5a0FDZDN0UGhSRGVWMDd1cjFsU2drcll2eDJJWEZvVzJV?=
 =?utf-8?B?M250aENTYTIwSi9KWmd4SWhmY0MrcFFVdkozS1FqQzZWT2p1TFBrWkl0Y3E0?=
 =?utf-8?B?am1wMUxON0dPRzNHUDZhVitBRC9uYzE5NW5yMisxNWN5L1kwN2VxSUxpUGlT?=
 =?utf-8?B?cTZvMTc1RGd3eDJkTjQ3a292R2FvOXJjQnRNd2d1S09LQzIrV085dkVDYjRI?=
 =?utf-8?B?ZHYvek1OTGd3ZUVSZ1ZmcEpXc0x3aUtBWGpVY3dxM3pKM3FnM3FhaWdNZWlz?=
 =?utf-8?B?NXhvbGVXb1UzNTE1NG4zWldBU1Zya0tVd1A4U041UkVpM1dtdkdIY3BNVFEx?=
 =?utf-8?B?RW9hUzY2L3daV1BCdWdGc1dRcDh5RC9tK0F0aENqZjFKMForRjVmeXQzQ0VV?=
 =?utf-8?B?K3dNM2ZnUWRNYnlnOU5zWGdjTHR6bzUwYTBBem1NMWkrS05Od1praTRWZEw4?=
 =?utf-8?B?dFFyUzZJS0pUczhqQXV1aXZYb3k5VzcvRTFEbHZTQVJ0LzZHRmdBOGgwQVYr?=
 =?utf-8?B?dmRQZzFFMUMvR2lnRk00Q3dVaklZN1A4cmpsYiszZGNJa3ZKbjJMSGdWT2dM?=
 =?utf-8?B?cGtEZi90ZGhrSXVzSm5QaytVeUJDSmZJVDNtaStPTEYvNSttS3BHS3VvQVJF?=
 =?utf-8?B?Qmt6YnJlQzlsLzBrc2RnaTVRSnVOOVU1RnlDekx0SjY4U1RVaWZ5V29ZYU1p?=
 =?utf-8?Q?tsEJ3mupWamuGVN4sXPjeH+ReByALafedkSDB51N57Cy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 895507b3-0e31-4ec9-d3dc-08ddda403b13
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 08:05:56.2140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dt38FXwxCs5xzrNtqy2w3SaiemlzJTrloghWV4+6wmWXcXoTLI6QQIenHB+FTiAijxShBw3lsau91Cy1KkADVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5243
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 12, 2025 at 04:33:48PM -0500, Timur Tabi wrote:
> On Mon, Jul 28, 2025 at 5:25 AM Imre Deak <imre.deak@intel.com> wrote:
> >
> > Ok, thanks for testing it. I realized that it's better to fix this
> > aligning with the conversion for the rest of the drivers in the original
> > [1] patchset, could you still give a try if the corresponding patch [2]
> > also fixes the issue for you?
> 
> Looks like Nouveau is broken the same way:
> 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> > index 1ddd92901526..e1e542126310 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> > @@ -321,7 +321,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
> >         if (!(fb = *pfb = kzalloc(sizeof(*fb), GFP_KERNEL)))
> >                 return -ENOMEM;
> >
> > -       drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
> > +       drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
> >         fb->obj[0] = gem;
> >
> >         ret = drm_framebuffer_init(dev, fb, &nouveau_framebuffer_funcs);
> 
> fb->format is NULL when drm_framebuffer_init() is called.  This is in
> the drm-misc-next branch.

The issue got fixed by
https://cgit.freedesktop.org/drm/drm-misc/commit/?h=drm-misc-next-fixes&id=d2b524c90643
