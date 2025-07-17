Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9BAB086AF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 09:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82ED410E722;
	Thu, 17 Jul 2025 07:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQN2umtn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF3510E71B;
 Thu, 17 Jul 2025 07:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752737459; x=1784273459;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bNkDhnwiOMx/cwMjgJ72LZoLFX+kYj3CAOEQTmPg4WM=;
 b=bQN2umtnD9BjCIMsxbjTORWv/uE9wh+xnK4Yoc7eWUcaB4W7uAf1hxtI
 r+epJoLAm7wOq/MN+q08mpFEdcvuaKS+wN9uVUPQOJ6waE6udwvRqp3s1
 Qv0n7boakvLm6O6A8qUEeJELXUVVZHsHxp+wKtw6P+E+LW/AKg/E8FL7r
 RzS/HB/HTd8Up4O7RnnJ2/yeIBnCgCso5YvJ/WuADF+p+kkFSSHccMkgx
 S2BUVpUT1ZdzFaydKJAswNGz9MX/Ip6tMFesBXntnNJd3D10qK//lz47s
 VUAesG88fCHzgYRHJPwbkWt/rqNP4rM2g/5n9eW/txu5g9/d7efmejnyn Q==;
X-CSE-ConnectionGUID: fOijH9JETAmEtWgVc8+KLw==
X-CSE-MsgGUID: 9R5SpxAAS2GiKpbSdobFhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58809540"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="58809540"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 00:30:58 -0700
X-CSE-ConnectionGUID: hZbCZieCRUCp6x24s2qb6A==
X-CSE-MsgGUID: 2Kq132VzTSCSzsfMw0QmNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="157112168"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 00:30:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 00:30:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 00:30:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.74) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 00:30:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A163+uk+HZpJBncgqoUjVOtVMuM0/6dLQ8/TDIpHrCuUHU5YCrVXKSrjr48Eglrf9K+3MnM3k+LUl8WOra60VTaEKywveNCc0tkJDriMeqS6Wa2xj3Ywhsq0m/RGXgkVNPCtRTPW4Ln/WCj0N2bBO1TDbQc1nAJMIOg0660agNBTJn/+ck2BLXI7z9sAuTccZ0tR2wOdxHL3UFL5qqrFoUDzqAF6Rdr/YQM1lyEHtZSys4vMfopwdjsapiHB76vxV3BurywzGa777QYDvQ2qFG510bxMHOiG8UOAgw8ThJvRClePvOthYUKar+ZDUQLcWVYyDPZ2X6OWNG4vv2tJ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sk7wQHLjjUcsr/i+pYKw4gP1JrsydxklYIOIPjr0DR4=;
 b=L5WwkyC99KLDvZlQSZj8kwKLVEHmhyY2L8ch60KEioiyYxRO1ivbOT+46XH2VnnZ5Wk2eVSYnL/HcjLqdCtjOMsPe8sO17fqYStj2naXUj97kUdEYIy8pKld+JPiJcJopH3tYfnUFg9rpkwxs5iJ6beqXKJ+8feKQRDxr5789w6DvJnmn/9qoG36NmjO8c3bcjr6Se26ak4Ix1HlbmLNOBkJLmVGvZKqo6Lh4n10lKlhxGP+HKvPYOJ4V7lOQGOzXBnvpQggUHl8DgvNkP899DyV2OUQEZwumlzC7eH/N8ckjgkZo2WQin7/TmSr69O93XfbJAKZlmfmzS7TOLWW9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ2PR11MB8565.namprd11.prod.outlook.com (2603:10b6:a03:56b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Thu, 17 Jul
 2025 07:30:53 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 07:30:52 +0000
Message-ID: <5998d67d-2096-4c93-b0b6-8af582d901ea@intel.com>
Date: Thu, 17 Jul 2025 13:00:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] drm/i915/display: Avoid unsupported 300Hz output
 mode on a TUXEDO device
To: Werner Sembach <wse@tuxedocomputers.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
CC: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250704192007.526044-1-wse@tuxedocomputers.com>
 <20250704192007.526044-2-wse@tuxedocomputers.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20250704192007.526044-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::14) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SJ2PR11MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c95dac-1802-49e3-90d1-08ddc503dc21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEttbkkrd1VvS1hwVW5zV3J0NktENFJ0RjhsVTRlUzlJNUllSWRRNEJmVGlr?=
 =?utf-8?B?bTVsMjFxQnFZcUJCdmU1bnZKZHBTMlZybXp3UmwxaUQ1QXZpYkVaSkRmSFdw?=
 =?utf-8?B?aFNsUGRRamU5ZWJ5QXZFWHA4cjBCK21HSHNIWUR5aHpXd0tzTkc5ZzI2ak9O?=
 =?utf-8?B?N2pPSVFZcFliWkhXQUJ5cVNaOVFvTmRadnA4UDNhWFJINDh4SEpxT00xY2Na?=
 =?utf-8?B?Y001MGN3THNJMEdGR1ZIVXBaQTRmSmJPQ1k1M1VneWNMVHhVQ3o1ME5NaTNk?=
 =?utf-8?B?Nm1RNDJUY25NNWhwc3lnNDgwTUo3UlU3SUJ3aWdrNytpd1doQklSQUxNUkhZ?=
 =?utf-8?B?SG0vOTVTd1BvWFN5T1lldzB5djlmcEFPaWxjK0ZvcTVnZWNrMXhrWnZaMFdy?=
 =?utf-8?B?cVpwWmU0RGIzNFo0Y1hxYWtBRXV0MzZlVmRnTDkyM21wTDlubXE4WFA2b3Yw?=
 =?utf-8?B?blY0U1F3ZUNGbm42eTN0WVJETFFkSjhGbjFTOU1uVzJ3QWFPaTY1TGdJazdN?=
 =?utf-8?B?anpnYlIzcmh1T2ZzQVBjL1BqZDdlMFQxaVlKQm44MnlWSnl6Qmd5NTBLMVJl?=
 =?utf-8?B?cC9tZW5RVUhuc3Y5YWUvOW9JSER5Q21haHY5RW83OVhhKzJwckEyR2dqSEV0?=
 =?utf-8?B?MmxyV29PNENwM3p5VGlQMjd2WnptZFRrSGQ4RDVHMkFtMmtHNTRWYjNhWXF2?=
 =?utf-8?B?c2RweXRKVWVuSm9vNVdPNWZxZEpPaVBKYUJkeHlpeVgxaERFTGxXa0tReVlS?=
 =?utf-8?B?VTJTRmhEa1ovU2pSR2FPSkFOaFhPaTUvRzVTM0NZWUkzaHRBSXJGOXJ1dnNK?=
 =?utf-8?B?c0hvTFA5Vm4rblYrMW81M25PYlFPTkdwT0duYkUwdmZwWC9KZ21Yc3QzNDNP?=
 =?utf-8?B?MEc1YWJQbElWQW03VCtGR1RjdGpmYnBib1JZMDJmV3I2WFZhT0VHTk5kdXk2?=
 =?utf-8?B?ZE1INnVvc0hxc09sR29YdEo0TitDcFpvZWIxdGZoaVp1Z2NTL2pOamhXQU4r?=
 =?utf-8?B?T3VIY0dFUnk5clpONWdsRHNHeVo5dDBKeDl0OXBkQ3ozV0lYK2pJQXhGc1V3?=
 =?utf-8?B?L013NUJvWkV0Q2Jya21pZ3BZY0JTS1VrUHNsQW0wZnBvVFBzbzRUYjBOUnQ2?=
 =?utf-8?B?aXBuTmJad05pbExKUGN0K0htei9GRjYwOGJGNEVuY2pocGpzUTFUc2ZaeEFD?=
 =?utf-8?B?ck5jTmwzc1E2V3owY3BwVGxlalNsNGMxQUFHT2ZGdGVBRWd5em9IdzkrMDBR?=
 =?utf-8?B?dW9wTUhpZ2ZSLzEvczhYczhtbHFuRExZOUZmZzFYV005QXVxNFFqYlRmVGJp?=
 =?utf-8?B?dEhQOUd2Z2FUbUN3Y1FVZkVKbXYzeUVGWjhhcXhPeVpsa1k2azZIR05pTjNi?=
 =?utf-8?B?cEZubkpBR29nNDhkZEpNU0FTbjgwdzdqaFhQbVZUNi9ROFZHRDlMaGlrSDhX?=
 =?utf-8?B?QWFVM05LcFpBQ3d5Z2tveGljRFRLMUZ2NjVwTDA1M090WWJJS0ZkUzVRZlFU?=
 =?utf-8?B?RVVtVXY0Z3dvSlJPbVJLcytIVnROWXplQksrR2pLcE9aUitTRnFqU3FYL1dV?=
 =?utf-8?B?VHJRYnpWdVRybklSVEpsTUxwWHNoMFp6MVVXdnZodDE3aHQ1KzBENTdRRVNS?=
 =?utf-8?B?OXFXZzJWeFJad1puWHBOaDJkUVZ5QThqa1JocWw0U3BETTRyRjlyMlY5WUFr?=
 =?utf-8?B?UHg0eXVBZzV3N0Z4OWVpT1NGVjVSMWdZeHh2Y3pSbkoxemg1ZW02dkRlcElC?=
 =?utf-8?B?N1BYZXBGRVF5VFd5NkxJdUJYR01Bb0Rvb3QrcmkxWXB4KzNGSllZTmtiZlVi?=
 =?utf-8?B?TU9RdVFUb3VnN3ZLL0lXVHlQUFl1QnUzWG00cjA2dlUrdjdPRk1qTGhnZFpt?=
 =?utf-8?B?YmtLMlNtR3g1V3lnNTNxY3k4S0h6SjJxbS9iamhCOWhXd0R3N2pNZVU4V0E4?=
 =?utf-8?Q?NmYf33V+hTQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzA1aWJWSzFkYlpqVjMvZVB0dGpHbXRXN0UwVTRnM0E5QUxWbHRlWUozRWRT?=
 =?utf-8?B?VUpCT2FpOUdNalVnelFnbGRETnZXUFV2cVpOLytSek1neUxldFNiV1RVNFVC?=
 =?utf-8?B?eUxiNW5ZWDdiRjJZZjBLc2FYQkRiWm5NMlZUU3ZGZ0tqTzhHMlpPV280dWYw?=
 =?utf-8?B?YUVGUlgyREs0dE9neVlZbnQrRFpsU2FIaXdyMTk3YlJzdllXa3MweXlsUkFz?=
 =?utf-8?B?Ui95aXlqYlE5eGltSFBGNzRpRHAzWC83a2QzNm1MZ3hlM1dUVTIrTEVjV0cr?=
 =?utf-8?B?VHdRMDNKcGRHY3lQV1BOL3BVTEtUZG9pdnROdUZjaHB1UlBkTVZZTVBnZFNW?=
 =?utf-8?B?TGFwUE01eEkrckRad0xLcXZxbGZBSVA2SnYwR1FpOTIySWFQTk45S1dsYkFX?=
 =?utf-8?B?eUx0TnMwdEV1TEhsdnd4Z1BhMHdWL25nVTJTcU90V3hrNXhOMnEvQnc4Y1Q2?=
 =?utf-8?B?VVY1UXRjbjNxMzRpRThWdnh1SCtTSXQ2a1RTS243NkVVVXBhRU4yc0lvVkRO?=
 =?utf-8?B?bUFSMDlyYjd3OVJCV25iZmVDdnprZS8vL280MjFGRm1Ed1RhS1NmblEwZWJD?=
 =?utf-8?B?dzQ5NXhCVGVnanVrME5kWFQ3Qmt2Ky9BMWlxRFZTdTgySjBUUVlHZVBYME9y?=
 =?utf-8?B?SEZMZVBSaHA2YkZ5Vks2a3ZiQW5MUklhNUVGYlNaN0ZrdDhPWDdvVmp6ME1W?=
 =?utf-8?B?NHdjd2hNMENuN0RDa2VIdHEvMkhVRTNwS0cyd2JTTnZWbHluNGppQWZ2MVBa?=
 =?utf-8?B?ZXVrbzFkSUtMQUg3cHhXRENLYmUyRFQ3am5raFE5VGRjR3g5Mm1xdFVkRERW?=
 =?utf-8?B?MVg2WGJsVDNFYjhoS2t6UnRBUDRPVW1sNW9hekZDN2k4VW0zTTJsTEJCeHdH?=
 =?utf-8?B?dlRnWlplN2JpY2Vud3A4WXBrbG1weTJjMnpxcjFXVWd2c1ZhL3pkR2hNVnhX?=
 =?utf-8?B?amljTVhxQ2Q0WjFPU3RXdUdicWlVU01uMFJZa3N2NDRsNmFKSDU3cFJjc21X?=
 =?utf-8?B?bnM2MVJCelVCaVArN01xLzg4SHNEZHQ1cHNyOGFhVFVHYmwzd0xFbFNFcnpr?=
 =?utf-8?B?SmpGV1FLVnUySEZMNXVhUFMwaG5oTjZJMWNIV0FHQ0xaQnd5U2NxVUpmVjJL?=
 =?utf-8?B?aE82d2dsM1J3ckxwM2tzRHlMYVRKN0VJUmN4TStackx5UHd1Y2VMMWVrU04y?=
 =?utf-8?B?dGlocHJNOVlCVmxFVm1GbGk2bW51WTY4KzVza0h6KytQTWhNZTgvclVydjJv?=
 =?utf-8?B?L1hkYjY3YzVSM2Y2dGkxOWZ6b1F5bVk5clViWmdMdG5mWm1LNHN4Y3ducUpw?=
 =?utf-8?B?UzEvOVk5SWQ1dGRGVWRXNjRwc1hZbFNkdEtlTXJ3djk0K0lRV0RlcUpod21s?=
 =?utf-8?B?L3JiTHdDeHBCM1c0b0FTcVZHbzY4eGZNZDI0TUkyWHd1TEtCRW8zSGFQL0J6?=
 =?utf-8?B?UVVFRVFFejhYU0ZNb2FRcGpsMGxmTDlzMUxjNjlJdVZ4Lzk3a3dSQTlFeXBY?=
 =?utf-8?B?SC9yY3RFN0ZHWnhudWM1ME1xL2NidzBlbHlxYm5ENEkwOXVqRlJCMUNERVVB?=
 =?utf-8?B?Vm44aUlQSnlvcFpXbnExbUE0NVV3blVRa2ljc01XRTlxdnZ2b0phd1dUZ2xZ?=
 =?utf-8?B?L0ZkV0gvQTBQSkdDWnZZVG5HeDZ6SW4raEVCV2JDakpoNUFkMi9iRnVudXIz?=
 =?utf-8?B?aFE1OTNkTmo3U0lteXZNYTBXMmVRNzBoVGtzc0xYaE0zMDBYcGdwVDg2SGVJ?=
 =?utf-8?B?b2hpaFVjTmNocGJhdnBQbWxybVBHQW1tSWtrcDFvTmdCWXZWRWxVbDJSK3lV?=
 =?utf-8?B?eXRZRElXNWNSdkowWlFyQ0g3bnU2Q29OTjMvNWNTVWpob0FFa3g4RytFYmto?=
 =?utf-8?B?Q0pkS0RaUi9lVkhibnJvaEdkdjlLWGhseFM3dDRncW42Rm9YeSt6QUtjTkw1?=
 =?utf-8?B?a3VvNkIzZ3FwTlYyZ0J4UkhidE9HZXh2Q1l4a1A4RWJsWE10c3JVclhWMDFN?=
 =?utf-8?B?WWxsVFZYejhSbndiSDI3QTBmZlBwUTN3SkdYT3dNaGdQcFhkOGNmMG84bHpX?=
 =?utf-8?B?K3hQdVgraklJZ1NyRGRoNnR0VzdCdGk0OE1Qd2JJNTN3d2RCS1lTSDVpVDhz?=
 =?utf-8?Q?r1JFxNtHT3GRYGUaI+Hta2V4q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c95dac-1802-49e3-90d1-08ddc503dc21
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 07:30:52.8606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r78gygJjqv6JXfWsAXvJ+ZZE7WCNQEdt33B17gXwVj96ApR+v+cDw7W+bN56py5CBjPpgMSq57+whdaea46fEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8565
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


> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Werner
> Sembach
> Sent: Saturday, July 5, 2025 12:34 AM
> To: Jani Nikula <jani.nikula@linux.intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; Joonas Lahtinen <joonas.lahtinen@linux.intel.com>;
> Tvrtko Ursulin <tursulin@ursulin.net>; David Airlie <airlied@gmail.com>;
> Simona Vetter <simona@ffwll.ch>
> Cc: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>; Werner Sembach
> <wse@tuxedocomputers.com>; intel-gfx@lists.freedesktop.org; intel-
> xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org
> Subject: [RFC PATCH 1/1] drm/i915/display: Avoid unsupported 300Hz output
> mode on a TUXEDO device
> 
> From: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>
> 
> Removes all display modes with more than 240 Hz for the integrated display on
> a TUXEDO Stellaris 16 Gen7, because using the iGPU with higer refresh rates
> causes screen flicker.
> 
> Signed-off-by: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>
> Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c     |  5 ++++
>  drivers/gpu/drm/i915/display/intel_quirks.c | 30 +++++++++++++++++++++
> drivers/gpu/drm/i915/display/intel_quirks.h |  1 +
>  3 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 640c43bf62d4c..5ce00cfe36ee1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1436,6 +1436,11 @@ intel_dp_mode_valid(struct drm_connector
> *_connector,
>  	if (mode->clock < 10000)
>  		return MODE_CLOCK_LOW;
> 
> +	if (intel_has_quirk(display, QUIRK_EDP_MAX_240HZ_HOOK) &&
> +	    intel_dp_is_edp(intel_dp) &&
> +	    drm_mode_vrefresh(mode) > 240)
> +		return MODE_BAD;
> +
Adding a quirk for this is not the right approach. If this is not 
supported by the display, should have been pruned by the driver.

Thanks and Regards,
Arun R Murthy
------------->  	fixed_mode = intel_panel_fixed_mode(connector, mode);
>  	if (intel_dp_is_edp(intel_dp) && fixed_mode) {
>  		status = intel_panel_mode_valid(connector, mode); diff --git
> a/drivers/gpu/drm/i915/display/intel_quirks.c
> b/drivers/gpu/drm/i915/display/intel_quirks.c
> index a32fae510ed27..438ce2cb37a01 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.c
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
> @@ -72,6 +72,12 @@ static void quirk_no_pps_backlight_power_hook(struct
> intel_display *display)
>  	drm_info(display->drm, "Applying no pps backlight power quirk\n");  }
> 
> +static void quirk_edp_max_240hz_hook(struct intel_display *display) {
> +	intel_set_quirk(display, QUIRK_EDP_MAX_240HZ_HOOK);
> +	drm_info(display->drm, "Applying max 240Hz quirk\n"); }
> +
>  static void quirk_fw_sync_len(struct intel_dp *intel_dp)  {
>  	struct intel_display *display = to_intel_display(intel_dp); @@ -120,6
> +126,12 @@ static int intel_dmi_no_pps_backlight(const struct dmi_system_id
> *id)
>  	return 1;
>  }
> 
> +static int intel_dmi_edp_max_240hz(const struct dmi_system_id *id) {
> +	DRM_INFO("Restrict output refreshrate to maximum 240Hz %s\n", id-
> >ident);
> +	return 1;
> +}
> +
>  static const struct intel_dmi_quirk intel_dmi_quirks[] = {
>  	{
>  		.dmi_id_list = &(const struct dmi_system_id[]) { @@ -166,6
> +178,24 @@ static const struct intel_dmi_quirk intel_dmi_quirks[] = {
>  		},
>  		.hook = quirk_no_pps_backlight_power_hook,
>  	},
> +	{
> +		.dmi_id_list = &(const struct dmi_system_id[]) {
> +			{
> +				.callback = intel_dmi_edp_max_240hz,
> +				.ident = "TUXEDO Stellaris 16 Intel Gen7",
> +				.matches =
> {DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
> +				},
> +			},
> +			{
> +				.callback = intel_dmi_edp_max_240hz,
> +				.ident = "TUXEDO Stellaris 16 Intel Gen7",
> +				.matches =
> {DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
> +				},
> +			},
> +			{ }
> +		},
> +		.hook = quirk_edp_max_240hz_hook,
> +	},
>  };
> 
>  static struct intel_quirk intel_quirks[] = { diff --git
> a/drivers/gpu/drm/i915/display/intel_quirks.h
> b/drivers/gpu/drm/i915/display/intel_quirks.h
> index cafdebda75354..8fe3f3467106a 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.h
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.h
> @@ -20,6 +20,7 @@ enum intel_quirk_id {
>  	QUIRK_LVDS_SSC_DISABLE,
>  	QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK,
>  	QUIRK_FW_SYNC_LEN,
> +	QUIRK_EDP_MAX_240HZ_HOOK,
>  };
> 
>  void intel_init_quirks(struct intel_display *display);
> --
> 2.43.0



