Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491A093F68E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 15:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C0210E3D8;
	Mon, 29 Jul 2024 13:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PoO9R2WR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B308A10E3D8;
 Mon, 29 Jul 2024 13:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722259290; x=1753795290;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=a2aEeVap8fVpCApHGD95qsz0nXGuyW+TiUvLDP73Wg8=;
 b=PoO9R2WRR4hzSpjAOSdkdBrzpENn6Cx8cYEnxFk8bASBB9O7F4Qzrnc8
 dvevSwUJq91VmtC9QQKDo9+dN2wMpoaYZcPrAg8Yr0xHYjVLTrAZRLUFN
 K2rGOydovDhTcJUVp/t3/pa6z8Es3Is3WdfVqRjtJOJ/8uA3jyWbPLGW7
 jydJk0YM9pTX+NdHafDF3DcjkMGzYN/qSSalslq2R37rA4bgTNKyJVqUx
 aZ5ElTRicxu2rxfuCkfqfVcL95ZUTnUVV9MtsAj9L+jOSyW2Gij58F8bU
 XXObY+1FMNTv7F4DjvzOPjv4BkPkXkWpC/97tdursWYO/bGZRoxxH7ctB w==;
X-CSE-ConnectionGUID: zCLrw0VOSNmqyk+4G0rUYg==
X-CSE-MsgGUID: qZWZXDFLRSq4e8Q0fSI9lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31162867"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31162867"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 06:21:29 -0700
X-CSE-ConnectionGUID: n0ge+QttTNuYOQUxZbjlyA==
X-CSE-MsgGUID: Ntbl5dIrTuKCRftCXmOGvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="58820528"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 06:21:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 06:21:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 06:21:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 06:21:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 06:21:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDcIZeXRHqzFhbCcpQQDpnFFVYGxTXkWPI3707aKnEFWqhnW2IStmEUDi9ptOBscl5wyqMm928dzq5U4PqDlI+ytVk1ipGyRYraSx5pEniTl+xWFPHecC3Uw/Ptka5mEwuoLcJANmc7OnEjqPOjeI89V8UA0wxMtxcfkEUmU8J5mpx/P//tiEBZZLp7ZuP4IRSpRuJwjxdg2hsxW0ozCWiwfwAbxc9J2lVojpsmeKWvWVbR469EhHnZ7hRqvbFF6a1VxhGgQVXNMVfxbwAGRjxERmCcLX5rxsXB+wHdLfVkrMNI/AcTs3TIkj+a9FEV3qQh/wuiEY1RhUUD3GrNOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7n4efUwMDKuS/x0bIPt8GBL5MB7ccP8S3QqTDUf2Mo=;
 b=qwN3UDjtkzrNscgY1oVUtYhdXQje5AmAae6R/haqIhcKXcHnuhp7HMrqirS3mcqswLzs5IHpaH87ZmdQjuaWfR/fDcU18JqhDcEcrJynHB97xgILhXwqur2oitBiLFFV+DZCRXAHlKBiY74gSp3mognqBn8ozS19vovRsZ51e1lRgrOeqau5hB9GKYq9i3Pl3izQ+RJcbYlNgax9GhJa12CGtZBvynAuN7USKtXItWD7zfB+mRo14W4d9xV7ZGhd8pCfUdEtMoCH3X1RI+LaZWRxbc3oM6/7/j4C/o0pFi5xN00irXhAGym/HfxUAqrHhwzGU7lVkBdgb2ISsxtlNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5914.namprd11.prod.outlook.com (2603:10b6:510:138::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Mon, 29 Jul
 2024 13:21:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 13:21:24 +0000
Date: Mon, 29 Jul 2024 08:21:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, =?utf-8?B?Sm9zw6k=?=
 Roberto de Souza <jose.souza@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe/oa/uapi: Make bit masks unsigned
Message-ID: <s7tjuildazggjsuza53ixn3ts7t6rw2rwy2et4neijbnkx6ve7@nb4pyxmhhquj>
References: <20240729092634.2227611-1-geert+renesas@glider.be>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240729092634.2227611-1-geert+renesas@glider.be>
X-ClientProxiedBy: MW4PR04CA0316.namprd04.prod.outlook.com
 (2603:10b6:303:82::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f70f146-0ad1-457c-65a9-08dcafd15826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eW5yRVd4YmJEcWxoYzl4dU5Deit3NThpc2FiU3JLdStwY1JnUnBkYWRuU3dO?=
 =?utf-8?B?Mzc2TzJBUUZ1QTBzZlhnS1k3VkVKVmJkNDFCQmRUOUFHeFpTU1Rkcnc4aFBE?=
 =?utf-8?B?SGRNQUQ5OE5vWjNOMkgyL044blRJSGtVMm8zSjJncDlidHQ1V29RWENURU9C?=
 =?utf-8?B?L2JnWmdvYWtubjlvY0I3Vy9LUW5hdmNnbHRqTUxlWm9aQ1VpMEl4b1RiV1p4?=
 =?utf-8?B?eWVidUFYVFVRWFlCck50NGQ5bFJrdzhwUXNIUDg5L2IwclR6RWlMR3BPSzRy?=
 =?utf-8?B?L1FhSWRndDFTVGM4OHE2SDJGVENJaS9LeDc3a3M0MUtka2xLa3BERHB3bFd4?=
 =?utf-8?B?ZXlyMTBDYnppYkVpVkxnNDM3SkU1ZWNlNTE5OVpzdXd4a3NmOFZVM25jd1lU?=
 =?utf-8?B?SzErdTF6Z2RsUWNrakpOaXFCRUNPamZWdzgwZmhBeVFzWnR0d3loaE9GSU9W?=
 =?utf-8?B?b1NMVkxjdlhEbnZYRnUwTVVrUkh4d3pVQmNWVklKcnN4Z3MwZjJwc3FtM3Fq?=
 =?utf-8?B?VUgvUlg3MXp1VWdjcmExbEYxb3FOTmlEaDNYNlhOUEVPWWZnS0Rxc2FjNkY1?=
 =?utf-8?B?UTN6Z2VoZU9ndk1wZGoxbjNsNjZvazAzRDJUamFuYkFzR3RmRDBZc3VvQnFY?=
 =?utf-8?B?c3pYZFQwVlorTm1QN2ZLU2FpRVdrcGhobFZad0JDM2JzWWNqK2pNbnduTHhI?=
 =?utf-8?B?ekwwV2dzUElPRWZOdWVvay9aa0plU2gwWFVUdnM3TklMdllaZ0ZFTE4rcXN3?=
 =?utf-8?B?VkY4TUh5RjA3bmNya29sclJWQkErbXFIWXZhd0x5bHd2RTR0SE5qRXZxcVRF?=
 =?utf-8?B?eFpJcFU1a3JpbVdPNUhWTVl6QzAwUEp2ZXR4RUlxQ3NvVG5mak1KMXF4WEhw?=
 =?utf-8?B?RzhnRjkzR3lJUmpERVYrTjBaUk9lUnZpZ0NyTVl4aThQU0ZzVm5yQ1NwdHJ1?=
 =?utf-8?B?WkRvaEJ4MGZrQUZjM21Sci9KMk5zdHdnWXd3UjBBRjNBWkkxK3BqdWhnVTJ0?=
 =?utf-8?B?UGg2Kzg2WTVjMThMeHdlL0hlS1c5MzFFK2hWR0F1SWQ2Um9CQkJLcUZaSlpY?=
 =?utf-8?B?QjZiVTZmN1oweEw4NmowVzdVYmRxQ29iRHpIVUZVS3BiemlOdTdjdjdTY2lu?=
 =?utf-8?B?di9IWExOT21oOWI3bUNJTCtSV0FabHg2Zm9EbHlLVDJDNVVkb212V2x5VW83?=
 =?utf-8?B?WmRoTGloSXMwaitNOEE2YnlhN2VhaTRWdG9LYmVoRGNmZUVqVWI5WUhwamJs?=
 =?utf-8?B?c2k5OUpxaEpMZVBaRTlRdnlkR016b0JBeXJ4cUZ5NGxEbmREOGl5K0xuczMr?=
 =?utf-8?B?THVEcFFRc2d4YWhERS9YcEtNR3hzT3YzWDFjOEdUaFR6QXpWaHNwbGdvdmZs?=
 =?utf-8?B?Y0lkYWZvZXpoTUtscytkNG01K0hqMndHZ0t2Y3hxV1dzZi84UHZlTVFCYzQ4?=
 =?utf-8?B?eDl2b0dYdGpXNEtmRk4yUDluaW4rZGY5VXl6Y0VpSTYzNzJhbWFEN3UvTzNM?=
 =?utf-8?B?OFJWZnFMaEtBaEdqUDBseEorQUF5MnRobStCOUQ5ak5Qb0k4UU42YWlxTlQz?=
 =?utf-8?B?UVBkZmxGN0hYVFNHalVCZ3Z1QkVpcnZhTXBnYXBIYkk4VlRGRGFIWFdOUEZy?=
 =?utf-8?B?bzFNUTRoeERkS1FGRm1uYkg4aHlHMWJJaHVhTm9MeVk3V3F5Zy9QNUJUR0dT?=
 =?utf-8?B?ZmdSelVlV3IyZFRhSEV0UnNLaXY3U243bWhlY0dLU2FyYWZVNHZobFdMV2lE?=
 =?utf-8?B?REdZOGRNN3k3YkpCNCtyYlZkNWYwS3I3N0FjYzdwMG1FR0w1Y1M0ci9QbG5T?=
 =?utf-8?B?bjZ1YXgxQWhmN05SZTJIdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWtqKzRYdWIwOGNmdGV0eUxHVFlvNi9qVWtLVFpkelRhazBranU0YkplQ3U3?=
 =?utf-8?B?aWlLUkh1T1dXOS9WNkFrUnRlWlJuUWl5emRJNklvMkh4NDNDUHFDTHNGRTJr?=
 =?utf-8?B?SnhndU9iaVZUQWdRMUcvVlZ1QWhYZWNQV3kzRW1ybnllUTk4RnRvb3k2bVoz?=
 =?utf-8?B?WUhwZ1VRbmdwZ0Q0NkJ1TDNiNmF5Nk1PeCtacitwNjMrOEkwSjJ5UEltU2lq?=
 =?utf-8?B?Y09PRWx6MjN6LzFLQVlGQ2l3SG9vOGlYUVJSaE5tWnpTdHk2T0lra3B0UnJD?=
 =?utf-8?B?VVlIM1VZU2lvbS9YTTJxK3ZvdGxkY0V6RVgrWmVKd3JsQ0tCUmxWUjFHS2p1?=
 =?utf-8?B?a0ZDbGlJcitnYWtXTWZyUmZrcjc2K0dURkpSUmM2L2I5RUFwQjJmc3E5U0VM?=
 =?utf-8?B?aUNNa2tzZXZZNlFEWHNFcXhHVjQ5cEtwa0I1OERBakhTNkI3VlE5M2RHUFNw?=
 =?utf-8?B?MlpJUWl6Q1pTWHV6TEJOcnRtRDlrVzdJb0paY0VTS2NrOEdyWGFGZUJlWVBs?=
 =?utf-8?B?ckZTclRacklGM0NTZmZ2cGtEdUxFYVN0TWpKaEwzaThzalR2clU5NmlORmJG?=
 =?utf-8?B?ZjdlTGk2VFdvQ0NTS0tVc3Z2YU1yNDlkaHZXQXJnL1V2dFNHMFVqejIxeXBn?=
 =?utf-8?B?eHJhZzFBUXU5UDl5MkpTbkU2eUxYMFAvcFc5VExBYzJQWXNiY2dhQzNnbnhD?=
 =?utf-8?B?blpkSnpHUDZuMlJnaFhsc3ZReUxyRklOM0g1Y0YrM3lWL1I2OVlqK0t3WlZJ?=
 =?utf-8?B?SHk4OFhNdzQ3aERaOWl5TlFCK2hsay9Ga3hXVEEwdlgwekovUjZpc1lCY3A1?=
 =?utf-8?B?RkR1MUI4QzNoVTJNU3NVdzRWTXZOWXNPNm5Nc3ROZXd1dVYvNjJOUkJNaWtv?=
 =?utf-8?B?Rkc1TmdtaTlxTjVKTElyemhHekZ6a0cxNjRTWS9EYm1LNXQxZVpMakJaQXQy?=
 =?utf-8?B?aE1vK2VsSXlubFJ1UElSUlhTR3dNWWF3MGdNN3crclBacnlZUVpYVmNLTmY4?=
 =?utf-8?B?aWxxczVuZmNIY09McEJrVmh4WnBacklsbnlTMytkckFVWTFIOW8wNWExcVF5?=
 =?utf-8?B?OU43ZUlCU2t3VExvOGtFeCs3N2JVOGNHOGpTS0sxLzY2TjE2MUNXVXk5YmJZ?=
 =?utf-8?B?S1UwaStkS1J6N0haRWFXMmp0UEdUWWxXMTJoMHNzNnBvdGV3UC9kcERlcFN1?=
 =?utf-8?B?dlB6VFRFZHYxdXdlbXI1WmVDa0MyS01LNDczTnlZMHhiU2I4U2ZvdXhxM0p6?=
 =?utf-8?B?VjBJZHN5L2ljNGxkVjhBendhZFNXcFg1UEg4dXUvOTNvcUtOalc4bnFsQjZJ?=
 =?utf-8?B?OURJbFFPRWlCb3BVcHdDYldkaXd3NUdzdExoZUVqbUhoSVloZm05Rzc0ajY3?=
 =?utf-8?B?OE9JRWdCWGh2Y0txb1h0Rm81elN3WVA5bXczSzZhc2ZCd0FNeExaNUFkbS9o?=
 =?utf-8?B?YVg2R1ZNR1prUmxhdUJxN0JIME1xY3N4citXMjc1OG4yOERQazdza1drb3lw?=
 =?utf-8?B?MlQvL29hVmVERFgrUk4xNnR5M0srUjAxQmxKaVhhemJVcHdwSEJ2aXcvUnhJ?=
 =?utf-8?B?Z3VzV0hrZTRWMmYxRlViK2RlbURWWEh5eUdLVzNHUFVuTlplTzg5UTBGSDJ6?=
 =?utf-8?B?M050bWF1bTEyOStNcmxib25RZmd2VUIxOUVKV3VWbWR4Y0owQmdyTVpIb2to?=
 =?utf-8?B?ekdxMjN3b2FLVzVsOSt4K3ZCTHdJS3IzZFk3clFxQWM5RFFNMzlmUlU4Wjd1?=
 =?utf-8?B?MWhMYnJZQThiVFNEb1ljQ1VkTDFTTVlzcmZ0eFRvT3VEUFlUUC9PbmJvLzdv?=
 =?utf-8?B?MGYwNlZxYkhGU2lmZUZJcUZGU0JnSEhnS3FUUE1XMTBSR2hIR0x3Y3NOVXZL?=
 =?utf-8?B?ODM1aG1JaDd3djRMdVdkbGFQQUN6aWNrU3IzMStQeWJ3QWMzN2l5S01vY0hT?=
 =?utf-8?B?U0phQWVFUUtNWVlYZXEwa1FhTjdGUHBjbnh5bXJIa0d3T3FKb2JlV1l6SFVh?=
 =?utf-8?B?U2xDaFhnQ3JWWkhLQXp6OWI4NWJ4OVlVRk1qcmhFVHpsc3dTYlEzSm5ZdTF0?=
 =?utf-8?B?Wmw5c2MwL2NhOEwwTUNJY1BaRHdpMUpBbkNZUERIdGpUd2huUzhFOXVLcmxX?=
 =?utf-8?B?N1ZjN1JVdk82YXQzOUN1V3pFbjZ5R1VPV1FvOENXUU94dDdKWUorZXcvTUZY?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f70f146-0ad1-457c-65a9-08dcafd15826
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 13:21:24.3428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnOA4wwbLir8opqq18DPlWHjv2eIkY6m4XQFGNvOXJzwSq/Bson3cNIyyBwdLSGZAgY1n0U0p/RCp/Ze3tzS7U5doMYgsKgJoYfWb7+0SSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5914
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

On Mon, Jul 29, 2024 at 11:26:34AM GMT, Geert Uytterhoeven wrote:
>When building with gcc-5:
>
>    In function ‘decode_oa_format.isra.26’,
>	inlined from ‘xe_oa_set_prop_oa_format’ at drivers/gpu/drm/xe/xe_oa.c:1664:6:
>    ././include/linux/compiler_types.h:510:38: error: call to ‘__compiletime_assert_1336’ declared with attribute error: FIELD_GET: mask is not constant
>    [...]
>    ./include/linux/bitfield.h:155:3: note: in expansion of macro ‘__BF_FIELD_CHECK’
>       __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: "); \
>       ^
>    drivers/gpu/drm/xe/xe_oa.c:1573:18: note: in expansion of macro ‘FIELD_GET’
>      u32 bc_report = FIELD_GET(DRM_XE_OA_FORMAT_MASK_BC_REPORT, fmt);
>		      ^
>
>Fixes: b6fd51c6211910b1 ("drm/xe/oa/uapi: Define and parse OA stream properties")
>Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


That fixes the build, but question to Ashutosh: it's odd to tie the
format to a bspec. What happens on next platform if the HW changes?
Hopefully it doesn't change in an incompatible way, but looking at this
code it seems we could still keep the uapi by untying the HW from the
uapi in the documentation.

Lucas De Marchi

>---
>Compile-tested only.
>---
> include/uapi/drm/xe_drm.h | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 19619d4952a863f7..db232a25189eba9f 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1590,10 +1590,10 @@ enum drm_xe_oa_property_id {
> 	 * b. Counter select c. Counter size and d. BC report. Also refer to the
> 	 * oa_formats array in drivers/gpu/drm/xe/xe_oa.c.
> 	 */
>-#define DRM_XE_OA_FORMAT_MASK_FMT_TYPE		(0xff << 0)
>-#define DRM_XE_OA_FORMAT_MASK_COUNTER_SEL	(0xff << 8)
>-#define DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE	(0xff << 16)
>-#define DRM_XE_OA_FORMAT_MASK_BC_REPORT		(0xff << 24)
>+#define DRM_XE_OA_FORMAT_MASK_FMT_TYPE		(0xffu << 0)
>+#define DRM_XE_OA_FORMAT_MASK_COUNTER_SEL	(0xffu << 8)
>+#define DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE	(0xffu << 16)
>+#define DRM_XE_OA_FORMAT_MASK_BC_REPORT		(0xffu << 24)
>
> 	/**
> 	 * @DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT: Requests periodic OA unit
>-- 
>2.34.1
>
