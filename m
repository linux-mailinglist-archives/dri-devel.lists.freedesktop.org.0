Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJHbFAuSnmlzWQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 07:09:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B73D192462
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 07:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F24C10E6A6;
	Wed, 25 Feb 2026 06:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lGiw3ZOA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC2E10E6A6;
 Wed, 25 Feb 2026 06:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771999749; x=1803535749;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZXMf5rmcD5ZfEotffbqDs5s6vTxbDRQJl2Vyrwh5HqU=;
 b=lGiw3ZOAgSQYGGMykOXOg2qT3nCag0P2TwOV/oRgQAXqVocMuhxv4YAe
 ga5IT/QNV0Y3BfSVGUTxfF+/c7pvVtu8guMcnpcQjdtYO2s+Fw3/vTx5e
 X2kqHGCZPy7CIhXEGHw0zVLH+jk5VDgALb6dk1eEu760BSt0pKD2eCZ3N
 0jaDks1IX6o09N05GxxezFFyOhB8HfrlHUNm/SqNQSIyEnMt+OnE2lmzI
 iRVr8+6I9HZFa12H/hFzWUwLa0oP07lSd9v90IFPKZ/csoK23BealIhS1
 df3HaGJX4CUYAIJ0r9ANlL5j6krr3lcdmITjdn0mfrg8yEeBe34cz3JeV Q==;
X-CSE-ConnectionGUID: KWCJB+23RHSaEQ8CT58ZQA==
X-CSE-MsgGUID: nmglN0sSSrye2LxNzbZceQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73100804"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="73100804"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 22:09:08 -0800
X-CSE-ConnectionGUID: nPo0Od35SGy8kpWXhCQOgA==
X-CSE-MsgGUID: 10hJFOTaSpmuw61ixgCYUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="214286136"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 22:09:08 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 22:09:07 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 22:09:07 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 22:09:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0LILwiVLrD2BUPUCzfgw2BTH0PO8g0ZihRJldmJtrDD0dtxNvhRMDNHpkxN3dh6UETQYHWvwCWXJNKHmud3Oh4alvhd5Rtz0/kgOUs+PhAPeYxxgkUvBCDkl+SGzruoeV/tgOkXPqa32ntt9w1Lz+da6i626kQV6yOuOWkRJgXvm9ooNjp0ozcbhV5Vg//Uc6YmrTT6JRTQu5KCh62G24V9LiUPSKWxQ83gj5iWrvILAwZvm8dWbM/ym7sqeVhQk+UyL5xws7PPjRrzkWtaj0vFBfoSsqpxmE8FOyaw4r7FHsEWm3DuXc2DUbf43L2nvsEYb2Jh8bLShenxhk5HFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oa2L4xRD5WxlX/TvuzjnfJA+h5zxlUFLM457TcD1U80=;
 b=JI/VbyiCJsUkZj2nRxWvqmn9TINVnvZgw0BRyYDjteF6S2JcDpmhqYun1WPSfbOnFuJCQ/2vVbEnwt6X52AtkzV45Uu581URaVSGr+GRJIeu0R1TcMg48ITs8TSRYwmleRbEAzHRVOY54+9FdHGGnxnZX66mb0CdWPVQ3iQGaVwvDViJWgVdOEj2eSYdM6S7mQEGiK1LfCBwL1zm+WCuXbDiPIHzp1IhK1EiQVpT2ZYTuqxCErVXcHjPmS6e5Y9L1Me3GKbVz0MSJDQw5ohguty1XbSDsbBg+F7FftwanCwwbejr19KhqOrTgGyEeVZQkqslPc/Vww6rNiwItRJ82Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV8PR11MB8557.namprd11.prod.outlook.com (2603:10b6:408:1e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 06:09:05 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 06:09:05 +0000
Message-ID: <686b63cc-2dfb-467b-a472-b6766b2c8dd2@intel.com>
Date: Wed, 25 Feb 2026 11:38:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] drm/ras: Introduce the DRM RAS infrastructure over
 generic netlink
To: Jakub Kicinski <kuba@kernel.org>, <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <raag.jadav@intel.com>, <anvesh.bakwad@intel.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Lijo Lazar <lijo.lazar@amd.com>,
 "Hawking Zhang" <Hawking.Zhang@amd.com>, "David S. Miller"
 <davem@davemloft.net>, "Paolo Abeni" <pabeni@redhat.com>, Eric Dumazet
 <edumazet@google.com>, <netdev@vger.kernel.org>
References: <20260223060541.526397-7-riana.tauro@intel.com>
 <20260223060541.526397-8-riana.tauro@intel.com>
 <20260224162203.279f7b74@kernel.org>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20260224162203.279f7b74@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0186.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV8PR11MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 97203f12-8a93-4ccd-bf40-08de743460e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFBOWXdHVWQyMDJId2I1SDhIU1hrUFB2dXJWcXMxSm42djdib3BDSko5S1hL?=
 =?utf-8?B?RUwxcnRKM3dqT2hMNU55U3BwOG44TnZ1R2xEcG5OY0MwaFRrc25aRlhrcFZr?=
 =?utf-8?B?WWsxSVRIZCtNakEwY3IvdUFKekJZZGFwWXNqOTBvU3JPNUowbW1yK0Z6bWlx?=
 =?utf-8?B?TUwxT0h3S2tzcGZhTjYvSWYyeldJazJMd0QwRmJPSklNWmI4emd2Z0RrU0Rr?=
 =?utf-8?B?K1Y2NUVST3YxREJaMm1yNDlVS0NWVDZWVDZZSUJjUEE0Wk90dm1NaVdzOHIr?=
 =?utf-8?B?enU5V1ZDYkxXRXNqcnh1NEllb2h6N3REUUhaM1YxL1RKdDY4RlJXQkRELzVW?=
 =?utf-8?B?SXc1Qnh0RElDS2VjbUpLSE4xQlF4VERzTWNLQ2pMQSszOXN5Vy93YnZyZGVh?=
 =?utf-8?B?NUVKZVQyL21Yb2R1N3lBTDh1cER1eEc0enBEQjl1cWVXMFZzaGRrd0FneWlH?=
 =?utf-8?B?MnYwNXd0bHdJWW55TG5YM0plRk14cm9idStwSDhNNDN5emZ3OUt3U2pGK1pW?=
 =?utf-8?B?bjgvVzU0Tkl0ZXFORTdzWXJvcmVMeFJsalRwMURqa1pTRzh2Wkh2bVVwS0Yx?=
 =?utf-8?B?RnowY3JXODM2NFEvYjJ1dGhDVHU4bUs3Y0tXL0xpK3BhaU1rbDlxSk1IUmlB?=
 =?utf-8?B?UFcya2g2YlJ0U25rc0lRam1taVJNVU4zSGhnVC8wVVc1WkkyTHB3Wm41V01D?=
 =?utf-8?B?Q0VlcjlTVCtIVW83RHBUMHEzR3FTY3BFY205dG1Dc2wrbWRFRlY0WUxzb1E0?=
 =?utf-8?B?QlVsK3hUcnFGL1I3c3VUWnh1Q3Bvc2N0MWpoUWRWRXgrNnEwc0FxR3dwYVcx?=
 =?utf-8?B?Y1dhbEN4ZDZYMXcxQVJYVjRqNFRTdzRZM2xCOGV2bVZaN2h4Z28wOEdEa1dq?=
 =?utf-8?B?ZHh6S3gxVVA1bXdacmx5dFI5cHovclVzOHJKVmNWYnBMbVJwWjFCMUdLblk4?=
 =?utf-8?B?bUFkVS9hNVRnLzBtbnVEbU5RY0VjVDZIMG4vR3ZzOGxpckhnRmFXcTlwQlpQ?=
 =?utf-8?B?bWpRL0xBbHJXbUgybVNmVWxTc2ZNb2Rsa0tJcXVUZ1ZRaE9kZ1ZJN2hYck4y?=
 =?utf-8?B?TlpMRFVDYnNFemJxRjNnNVJEcGtlOWgxY2FSblNDeXdEVVdpRWdYdDRkalI4?=
 =?utf-8?B?ZDhXSmltVUsvTW54UVd5UFZHSUdGbGhESzlIVUpUdkE4WmNNcWRCcUs5N241?=
 =?utf-8?B?MVpIaUFSTUZ0NkhaM3BzVFBPeGZqL1JXbWI5VWw0NHI1Wk56aGZJWmdCMEFU?=
 =?utf-8?B?MW96VnVIT2Qwakd4SEpUcUdGVmVWRnYvQ283cXhBbUlhMGR1MVpmQlZkUlY0?=
 =?utf-8?B?aTNGS2Y1V2RPSE04aTZBZHpDRkU0cDMxdzk2ZnljSFJKSStzU1FiN0FVdEhO?=
 =?utf-8?B?a1FmMkRkY1g5aGVXZEYwNmQ5OFVBNVh6VlRuMFE2cFJPZW1nYzR2VWdzU2pz?=
 =?utf-8?B?cVlXZ2duQWdDNU5JWHdsMHhoSWpKdDRqQ2YrTlJJbHd0djhMQWtHZmMxRVFi?=
 =?utf-8?B?ZHN4SHBTN3lSRkw5TUZ4YXVOUnlweXF0NEJwZnRrSjBFRk1PN09YbnZJMURq?=
 =?utf-8?B?VXNSaWRmcytTSGllYnN5dVVCSmUvY29iQnRROGRnV1B6QmRXcDREQmJXa1N0?=
 =?utf-8?B?NE5BQlk0UXpaS0F3RmtLbDAzaDMwL1VyQ1JWTHM2ZWdnRkhack1jSnBGek8v?=
 =?utf-8?B?eEZnSWE1bHVwWEpPNExpd250S0JjRTlDUXdrMmxkWmxDTGNYUjJncno2QWJr?=
 =?utf-8?B?azlXdndkV0ZtWWtaci9mNVpFRTN1Y3JISVJ2TDhZaTFOdFVSNWo2Zjhya1RS?=
 =?utf-8?B?UGtLS3lJYTJ3R2dOOXhqL25MNzNURlgxUzdQcXlmK01MQ0dsWG1tVlZ2bW1z?=
 =?utf-8?B?cTBWZDdNUzNMY2wxbi94eWpBMGpkbEUzQ0VQRy9reHlrR1dxWDN2bzBoZEl2?=
 =?utf-8?B?cHV4KzZOTWVXOC9xNDd4SnhNMk5ndkRNcGpqcG5jZ1pNWElNOEQzMGc5V3FP?=
 =?utf-8?B?YlBHL1prZlR4aWVYalAvWW5FaXdaOHdhaGpRYVFqZldha0xDcHFpNVVqUURX?=
 =?utf-8?B?R1kzWUl3NldCbG1jcWxaNGRNZ0xBajRCcU5GWWJISDdqem41VlNmelJtNStn?=
 =?utf-8?Q?2iYo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE9YNlloeWx3cmpBYk9UdSszbXNKc041TDhwUCszeVBSOGp0MlRnV1o4N2d5?=
 =?utf-8?B?QjFJenVFNjd1QU83Wjk1eGIvcGFuSkxxeUZlWFZqRXZ2NmFxSXRFekhqQjUx?=
 =?utf-8?B?T2Fwcko4Rng5UWZXU0JlZ1AwcGpoUkZiWUdyOCtubEtPcG1sTU1qZkpBUFZW?=
 =?utf-8?B?VkJ4Tzlmc0RRZWZzaU5tOWx5Ky9SUTlxV3hFUlpGS09GK2ttZUxPSEIralF5?=
 =?utf-8?B?QVRlUUJaOHBCbm9ZSnZ3MVhOQXBZOWhSQ09tcmI4Y2xuQzJ0R3pyUUlnZGRD?=
 =?utf-8?B?RDZrMWlxNEJDaG1xdFF3UjdXZVJDS0hCdU5SL1VGUDNRMVFrazArMmxlZ1Nj?=
 =?utf-8?B?VklVTEJIcTE0RXB2VmlhaThML3FIRmwyMmJGVVJUM1FYZ2dtMDd2N25OMW5n?=
 =?utf-8?B?aGwwSWhVN2d2NFdsUHV3Wm91K3J1bkp5TmxianZVRDRpQmRLL3d2YTVoSGM3?=
 =?utf-8?B?L3k1K3BKREx6R3NjdXQ0bTh1U1A0dW9BNmVJekw1MmczREJCTE5VR29INGtR?=
 =?utf-8?B?TFIzNG94c0RGNlNmemIvKzFYc1lLeDVyelZkeEoxT0poa1JHdmxXMnNyZ1dt?=
 =?utf-8?B?NW0za1ZDdFRuS01nSHROR0xqMVhjQUV0TWpUNUNaSzBsVGg5eGV6ckVicDg2?=
 =?utf-8?B?cmxkUzJORHdKQnIrbDIwaVRpdkw5bEtudmExbGRjRlBuMUhDU0xyT0NUVDF6?=
 =?utf-8?B?ckozMTZ5M2hIeWlVWEFpcURwMVh1RTJWWUgwNEhiUldoeGs3TTFmcUdFQ3Uv?=
 =?utf-8?B?cE8wVURmOWJ4VlA2S0FmMVJ0aDdvelE0QU1MMEd4Wjc3VWdrWnNEMTc5bDVj?=
 =?utf-8?B?M3BlR3Y4UTRrcjJweDY1NzllbjFOazRUbnI0RTZLSW9hSi8zZTFlNCtBcnFL?=
 =?utf-8?B?dlkxdnZ5cVlmdmFFOFlHOEtWaGltcGw2MC9CbzV5dzdQWFJPZ3VoYndRM0NK?=
 =?utf-8?B?OUJxVjRHUE9XSEpqYVdQOXVxd1g5REFacVNvRDYyb2V6aFFGa0o5L255VERP?=
 =?utf-8?B?Nlp0cWJzcHlrSk03bVoyN1BjNFFJSDltajBNbkxMWmduUlRDN0Z3VTloZHFY?=
 =?utf-8?B?MVFCeGFNaEhqazVpNjdab0tmd0t4VnRjNDV4ZitPL3BlUTIySWxtK2pEYmt0?=
 =?utf-8?B?LzZMRThLUE40b2pGTmJtMjIrYjFIM2xWaHBCRGJEOTgwWnFPdEZxL0lwVms5?=
 =?utf-8?B?R0t5eE84Z3BHMXh2Wkd2WUErZGU2M21BQjhaNS9YSW1nOHRJTG1RREpVLzE3?=
 =?utf-8?B?OUROQW0wTnVad1RLRXhVdHpYNFpncXJ5RVFjY0lxRVhwclVUZ3VGU1ozU3lT?=
 =?utf-8?B?cXkxQmZGWWJxTFRKMDIxMnlqYzI0UmI3TEVrR0IxL1hYRXlCcnNFNXF2TWlG?=
 =?utf-8?B?VGpEbktyUURoNEUvaUNwRjZBYUNIeW45WFVSSDVBc0NwUHR6cVZrUVFBS1Qr?=
 =?utf-8?B?dWxZc3dVQ0U4VEczSEtxRDlyS3pGSTloK1RmZjZqTEtybG14VENmU3pOL2RI?=
 =?utf-8?B?TWp1YzBWakJHWG50L2sySW94dDFtOG00MUgxWllENmJqcmhxVlkyNTA1MCt4?=
 =?utf-8?B?LzV0cFpPQ0ErR1kwaS9VaUIreWlTMDVmd1lzR3Brd05PbVBCTk5RQXRBU0Rl?=
 =?utf-8?B?cXNwdHJ3MVZ3YXArTW80Nm5aamNaaHVBeUlJRVNhK0NKdkZuRk5wUFhVLzhF?=
 =?utf-8?B?NjFNUXJpUzhTUWpQT05xWlhpMGtoVVYwSFltKzI4OUF6UFZXZlNkdVdkbzVm?=
 =?utf-8?B?WGxpRTh0b0ZDM01aWERtRCtxV09RL2VLQUVmdjdNRUo3N2xqOTZhM1p0eUc1?=
 =?utf-8?B?aVYrZTY5Z2RBbytYdVdWRmZveFoySXYvc0hiVGRvWitaOGltLzlDUzd3bVIw?=
 =?utf-8?B?MmtvZ0ZRSnkwTUtjQkRFTklDRE10ZjZ3ek1HckYvNXhQQTNwRUxyNnlCTjNP?=
 =?utf-8?B?dURjUjhDQTZoS0ZwaXgwT3h4Qm1sbWdLV1dLU3hoVGZjUldwTlpKU0wxSWsy?=
 =?utf-8?B?WnRTclNDbG1SandoNUl3c3kwd0JhM0RpWkhUYjEwakJ1V2x0bURteGpEc0xl?=
 =?utf-8?B?azY2QmhhN2hBMU43aTk4eHJGcXZPSnpnKzQ5NkVPb3JTYndMUyszNlllTFAz?=
 =?utf-8?B?WWk2YW5xV05wZHU0dHgwVVdERHYwN0lmRXE5Qm13VlJoaU1hazJacjlFZ1hJ?=
 =?utf-8?B?T1pjekhpS0hlcDRvTHZFN2ZjclpDaStFMFRqNmJjZ0JzVnZGRVZDTXFxSkIy?=
 =?utf-8?B?aU1yWCt2WE9RSG5oOG1qN09TMUZIenZOT214dWpSYjAvUWhsUXU0Z1hKOFoy?=
 =?utf-8?B?U0pYc2tteE82QTV1MTdSN3VmTmpGWG9vVGVaUjNaVm55djVBd2IyZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97203f12-8a93-4ccd-bf40-08de743460e4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 06:09:05.1018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgCZiDiPnkhCj0HqXXYF8XM45l+lJ3gOJgGZLU5rd6068DnRE52wELXA/9j2OxuT0ufUoPtrvOTUyJOcSYZQmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8557
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com,oss.qualcomm.com,amd.com,davemloft.net,redhat.com,google.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 9B73D192462
X-Rspamd-Action: no action

Hi Jakub/Rodrigo

On 2/25/2026 5:52 AM, Jakub Kicinski wrote:
> On Mon, 23 Feb 2026 11:35:41 +0530 Riana Tauro wrote:
>> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> Introduces the DRM RAS infrastructure over generic netlink.
>>
>> The new interface allows drivers to expose RAS nodes and their
>> associated error counters to userspace in a structured and extensible
>> way. Each drm_ras node can register its own set of error counters, which
>> are then discoverable and queryable through netlink operations. This
>> lays the groundwork for reporting and managing hardware error states
>> in a unified manner across different DRM drivers.
> 
> Family itself LGTM.
> 
> I'm getting this diff when running regen:
> 

I hadn't run regen with -f. Yeah got the same diff

> diff --git a/drivers/gpu/drm/drm_ras_nl.c b/drivers/gpu/drm/drm_ras_nl.c
> index 4714a574a143..8bc85eab751f 100644
> --- a/drivers/gpu/drm/drm_ras_nl.c
> +++ b/drivers/gpu/drm/drm_ras_nl.c
> @@ -7,6 +7,8 @@
>   #include <net/netlink.h>
>   #include <net/genetlink.h>
>   
> +#include "drm_ras_nl.h"
> +
>   #include <uapi/drm/drm_ras.h>
>   #include <drm/drm_ras_nl.h>
>   

$ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
  Documentation/netlink/specs/drm_ras.yaml --mode uapi --header \
  > include/uapi/drm/drm_ras.h

$ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
  Documentation/netlink/specs/drm_ras.yaml --mode kernel --header \
  > drivers/gpu/drm/drm_ras_nl.h

$ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
  Documentation/netlink/specs/drm_ras.yaml --mode kernel --source \
  > drivers/gpu/drm/drm_ras_nl.c


I used above commands to generate the initial files moving the 
drm_ras_nl.h from include/ to drm layer.

Even after that if i regen using tools/net/ynl/ynl-regen.sh -f
I see the above diff.

Am i using the commands wrong or missing something?

Thanks
Riana

> 
> Is there a reason why drm_ras_nl.h is in the global include/ path and
> not in drivers/gpu/drm/, directly? This header is meant to be used
> just between the generated C code (which is mostly structs at this
> point) and the C source implementing the family. We haven't had any
> use case which would require making it global so generator doesn't
> support that.
> 
> The source needs to be clean after regen, so we either need to move
> the header in this patch or I can send you a patch to add a new
> generator feature to override the header location. LMK.

