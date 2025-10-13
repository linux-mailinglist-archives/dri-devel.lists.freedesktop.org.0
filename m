Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B86EBD2B42
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 13:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAED10E424;
	Mon, 13 Oct 2025 11:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X76P4JXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E3B10E0EA;
 Mon, 13 Oct 2025 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760353488; x=1791889488;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4w/9gp3qlOLGvTYlIWfMwjwX5UboElKpKn58GmhUxJc=;
 b=X76P4JXathXVOmhD1SF2OoFgW6Qrrz8ZzIYO29PAS8WKzKdluDnQ8dYU
 pUI5QI9DlNS5rFMtst16OjS5Luq7JmFS4etDYdjopdtnr6+r3+Oqs/K2z
 72InCSVT/rMJg9iGoWaDtopX1J3cvDtXE3WOBgRx7Yyz1gv8t5b5AFWFB
 DUO/NEYtPD3aWdqRFdqYwihj0xGfS79EIcIYYEU+J+qqjV4ja4OBdAHny
 JOelBVo6G+meaYcVydfNRKQ4w9kMzkFQc2/nOxkKwix9m/Y9l8t4WaIYL
 nl2IEpJPuq9KIlokOM2u8gU1gV7c88HMK+VJOFNEvhbsf0zmyfNGo1/aR g==;
X-CSE-ConnectionGUID: XuAdOlmPReu0Y0TLPQTMBQ==
X-CSE-MsgGUID: GJVKkOyqTu+gR76Y5/OXWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="66143452"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="66143452"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 04:04:33 -0700
X-CSE-ConnectionGUID: wHCgcRlCT4a3KkaHCGTLiQ==
X-CSE-MsgGUID: p/El7mEjSdOfgVWvvyDCCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="182330963"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 04:04:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 04:04:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 04:04:31 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 04:04:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLlH2ns8SFweu5LPsxVmyxev328TBaFDRvs3VvafW51JASoZ4wrPSKeJjZTCjX5ApS2Y2kp3ZVy8+5KEpHmubpEf2/NTYEikZ7KTBuDeGxYmrU+hUle5J/+E2ST1Nepj1RSM9pJxw9OS5p07ahY3xIAKHufRqUQbXxgsrGka+IkRWGbo8a6BalOjUGSYC8iF2lKp4L/6U0ptsY40ZB90qgYNmn2c9gGL/z7c78iHueW02X9OtHJfEXCEmVER7brtJvN91nJnP+F4hTPiFCHdAQiuDJv275ImzB4mJuztUip3Hnjx3O5sIzhtZPnjp+fzq4CeqCdKVwkRGXzZ5Qv4rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjzU+fTJyNUAmxOzU76LH/ycswa4CA37rOhl59a43GE=;
 b=w+U7+tjurIi65sldKrvEDtd2AgSY9/0kKZiHa7TNON3iqn0oAtmFdmkwnCapc2S9g4m/Ri3WCv8/kJQ2b+7tNODAmZIGh0Dqb7DxdgokZ6JfpDQpdtdo9HsIR8On21cO+jAN9t86hsQNxfMxS8JK3MDi2nJ74cP0g8GZNZsQTzkyCphLcJnJ5xBMlj0LEqnuxBzCedgZhn0YoMOgxsjzMFxr1cfL2DxdnYx4xd/EecmZTMNAa7GsUBpp1zj1BM2wuh5qYCYR7cCoOhhJUWpVJdo9rF6YNSOFILjPRNKPvFobMwIZyFQmPDcSK4OoPDcxAN8dXiPaaeA5PMhpOvVntQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB6709.namprd11.prod.outlook.com (2603:10b6:806:259::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 11:04:29 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 11:04:29 +0000
Message-ID: <d3e0f5df-4c9c-4b8b-8441-71561282c4dd@intel.com>
Date: Mon, 13 Oct 2025 13:04:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/26] drm/xe/pf: Expose VF migration data size over
 debugfs
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
 <20251011193847.1836454-10-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251011193847.1836454-10-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0142.eurprd07.prod.outlook.com
 (2603:10a6:802:16::29) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB6709:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b6df5e6-a397-4870-daf2-08de0a4847df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnBWU3htMWVoNndPSWp4dVFEeXpXenFzUzNYN2U0eEF4UWxlbmhXMUhhS3E4?=
 =?utf-8?B?VnpJdnZIYzlKaU9BcktCK3VxNExvS3gyQW1jaTIxTjFZb0pTUW5wTWdYOGVq?=
 =?utf-8?B?aXZtYmVycVA4L3Vxd253dnNVNDRXMEg0YnR4Z3h4QkVwY1pkeC85cjFTQUpD?=
 =?utf-8?B?N0hCZituSWNGeFRCdXBmSlo4MW0yR2M0OTlqZUVYOGlvdXdEYVVFYXhQMVd3?=
 =?utf-8?B?N3JGcXdEVDBoeSs1aU1Cdyt2SUhRRDVKcXplbDRGSVRRbFBkVVd0cWszS1lC?=
 =?utf-8?B?OG96eWY0SHRidXZ6bmFHU1ZjcWV6c0t4UzJNTi81TmtZUGdCaFlxeXNOQ0hl?=
 =?utf-8?B?b3ZXUE41SWZTRWZueTh1Q01jVlJMNmR4THA0WFJmVXNPWTRFSzlYQVpQSVcx?=
 =?utf-8?B?ZlhnNmpKRVc3YU5CSDBNR3dXa09Va2pCZDRTTlN0dnpLVWp0cEJmNlViSnly?=
 =?utf-8?B?YlR4T0JzSTh1OFVydjIyV25PaGI3YUkxeTMzRWYyRVExTE5RM3Q3WlBoS2l6?=
 =?utf-8?B?SWcwZG5OaCtvNE5ycloxaURzaHdWWSt1WXFRU0xjeHg2YU9FQlUxYVhkT1l2?=
 =?utf-8?B?ZytRRm0wb0R5Y3cydkxSVHpKRTlON2szYnBBTXkzSE1DQlN4Y29MVUxHYk8w?=
 =?utf-8?B?ckR5cFlQZ3dTdFA5RVhSZVNIbjVkRllIbXdGRkI0OTlQN0YvMmNmNVZSeXhO?=
 =?utf-8?B?Z3YvcUgraEhMaWVDcERMMkZQdnJDc2xRdk5uM25CdndxRmZJNzdycnNBLy9q?=
 =?utf-8?B?aGE3czd4dFNaZmZWRHNwYlRkUWZmdU9LdFJsSml3V2tNOXNyY3lIeUgxcCtR?=
 =?utf-8?B?YXZPdk5kNWxseDJhR0Zzc05ZR1A0MVFKV0VONTc1U0VxekladjlXQVhzb2NY?=
 =?utf-8?B?dElVRTJtVWU4all6bWtIMlJWNksyTXIzd1k5QlNnN0NzRXBpNFJlS2JoUEFs?=
 =?utf-8?B?ZU85dXR6WjltZlI2NmFjNUQwSkl5MkdyVTd2WUJsSDRnd0pYYzNWdUZqQllQ?=
 =?utf-8?B?Q3c5aXV5azFPcGhYejNvM2lDYkxIa25qdldRQ2xJYkI3enR3eWJuNTdwc0tT?=
 =?utf-8?B?TnpvazgvUVpHZHl4dFhJcHNaSzdNR01ZWDJzTHVhVTdIYXFSRC96N3Y1MTZQ?=
 =?utf-8?B?cFBXcVMyUi9GM2VzenR5b2dVczZKNmY0TjdQSTF5TXEyR0ZqOVIvc0E2aFZD?=
 =?utf-8?B?WldGalNEMkpBaEhGcms1Zk8wTDFGVnR4RFVOTnVMVTJwV1RqVUd3TGlpU05w?=
 =?utf-8?B?ZHJHdHRidno5aE43dmY0cnZSQ2tCSnB1eEpLSEwxekRKaEc0Rm9uelZsRFpX?=
 =?utf-8?B?cklMcklWTENwVnZPUm9RUHRYQnA5VE5RWGo4YWdEOGtIUVNUZDlvRzZHdjcr?=
 =?utf-8?B?Yk81MmhRZXB2ZFZvS2tOUjczK0FLakdhWkFVZ09iUWI4cVFQaUVkSFNwNzJ4?=
 =?utf-8?B?cGpqbDArU2MrYVcxK2J1VGdJNG1ybi9zMnhHWXlaRGQ3QVdiVjdDbzRRODN3?=
 =?utf-8?B?WHliY2F5UitJTlR1aTMzcW1rdzIyOU1iclByZ1dpUWpsaWdwRkNKZFBZRzFa?=
 =?utf-8?B?ZUV2U1Y1SDE0UDF2Zkh2K0Irbm5NZk5wdTUzWnZINHQ3eG1hNllsR3hmV0pC?=
 =?utf-8?B?MDZPQmV0aHFrV0xrRnUwVlZtUjV0NVo0N3R1UzJOQWxIdE1VdnpGMzhHOUdI?=
 =?utf-8?B?UEFORksrV2RPblc0cS8rMnlZeVV1bnE2RVlxTVpya2JEVjAzV21FejVxWmM3?=
 =?utf-8?B?bThTd0pBemZEUm9DK0tyaHpBNUZGM0JxOWtxakJQSGowSm50QzJ3K0hZb0ls?=
 =?utf-8?B?UktmSkNEUWxOSW0zOVNNaDhSY0taTUlFTG14LytaQUZBb2p5ckF2TU5kNHVV?=
 =?utf-8?B?L3RDZ2t4d2c2T1d6K3FaWkU3YSthUlhwVkkwbzVpdE1lMzljK3dSaEpJNnl2?=
 =?utf-8?B?Y2xLSjJpaU8xSitlZldueHQwVWJleTZoemx5dVNsRUJ3Z01Ga0NRaGNPd096?=
 =?utf-8?Q?pmPRCZY1JP1gfyuP/5gxfa+VCwK0UQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTlTaGxMNURHWGFKSlhkenc0VzdDZDRXek5maUk2WmRkMDNha0NWVkJQVVZj?=
 =?utf-8?B?WEpTTk11MEVWTWdSNWlJZi9Yd3ExaUZzME9CT2dwdzZjS2lIT1kyU0MrM0hH?=
 =?utf-8?B?Q0pSUEltaS83Wm9qOGt5cEhaZkdQK1FEL2ZCVE94UnZCZXk2emN0V2pzcitJ?=
 =?utf-8?B?WkNQWnp6UnBKK2dsVU9SdnBPLzJTdmxXaGF3ejZOVFR5aDYycHM2eG9iVEJN?=
 =?utf-8?B?aW1ub2tsaEpuYUVVRm5rSkh2Vm54QUt5OHh5MWwrd1ZkSlVGekZLVVBueS9v?=
 =?utf-8?B?SzNsUVlabFhKdzVUaVBKYXFDM2M0SG9Ibmcwc0pyNUVieWpNV3FRbzFmajdq?=
 =?utf-8?B?MVk0MlNEZE85NFI4ZTB4RFVNL3U4SHFGZnJxQmE0aXN5SHlBcXBqTDQrRW9J?=
 =?utf-8?B?REFLb2Zaend5TWJCYlJpQ2ROa2pLYmxraDUvS01rWWFQK09LeE45UVJ1VGhL?=
 =?utf-8?B?MnEwVUtmWUZkUnZjZ0lvOExSMGliWXN1RXhXZ2M3b1daMWtaQVlBVkJmdExz?=
 =?utf-8?B?Wk1ZUWordHcxSGFyZ2xpM005ZFFVTlkvK1huTnQrZmhqM1VlMy84WVRlWXJT?=
 =?utf-8?B?SmNSaTgybDU2YWtXaTBhMmdWMUNKWHpySmNBc1lPTnV1dXd1ZzF5ZjJjWWpT?=
 =?utf-8?B?WEFNamdPRE4rOUZNY2ZGenMvQmlWdHE5TkRYSy80NFJ1SzVscXFNZXE5OHQx?=
 =?utf-8?B?R1J5Vjd0RHpLTTdWNWVDTHU3UEFWdURub3luQUkrQndxWHJuZmIybllGTFlO?=
 =?utf-8?B?a3pwUnlkMFdEQnlnQ0MvVE1uNDdabHdkY1FZUnNoWGlKbmdxcVZ2MTcrVUVm?=
 =?utf-8?B?akZkY3l6bVgyaEphaTJxS3c2ZzZtQThJelR3bnlXUGFIM0d4VjZwbkJlQ1A3?=
 =?utf-8?B?UTFJMkhNeFNLdDBoYkZqVWFUbUFRMVNrYVR5NTJWYkZMNzVLSGFQR3JoZFQ2?=
 =?utf-8?B?aXFxZW1wV1N1SHpXc0lITEY5bUVkcHlOdm5VVGFnZWIvditwR3NPYThKYzkr?=
 =?utf-8?B?MkFHT2pzc2c1VmJCYi9BcnFRMjE0Q1AzWWxKK0JOcDNqQzQ5Q29vdWRocjJv?=
 =?utf-8?B?cTZBUTJsWlVEM1NBOHN5WGM5dWJ0b1BqeW8vbDJXakdIQWtJcE9INjU4ampZ?=
 =?utf-8?B?cjlEV0pJSXJQUitkeGFubGQwOGRjWEwyR0pzWUpGZDNwQzgzaitaRkVoaHZ1?=
 =?utf-8?B?bnJEK1A3amUyc1Q4cldseGVoSHd6ZkFSSFRiRkplRkFDaStFOXF1VThGZ240?=
 =?utf-8?B?MFFlMHY1ME8xczk1QUNIbytCRHNKWWwxcllDb0N5WWZWS3BLNW55UFo4M1lM?=
 =?utf-8?B?M3JzRnRZNkZ4dHlQSkt1ZGdUOGo1Rk93OGxpOXZPN3BNS3M0OGwySktwUWg5?=
 =?utf-8?B?Y3U3TWsrOEw2dWdjVkZVNmh0eGZEWG9yV21ZSWtKVDZ4SnkvMGdXb1orTFEx?=
 =?utf-8?B?QnpuSTA5ZGx5U2s5VTNrUlptM2F2KzVBQk1NUzVOajdKZjZYRUIzT2o2eXdF?=
 =?utf-8?B?QktoS0pJUzUxUE9iQ095V1lPMndKSGNKWXRDQ3BwK0w5RGozOGpFT2l5QkVh?=
 =?utf-8?B?UkVyd1p3RW5QVnFOdFo5Vkx5dUthU2ZWUStjMEtDallicDBleVBpaUd0NE1h?=
 =?utf-8?B?QWhlaWJOSENMS0hPenhWSitSUnF6ajRzbVhrSUhZUEtTcFptRmxhYUVWaGNk?=
 =?utf-8?B?NnVBUFNXdGlNTEI3bjNnZVZ4OXRYUkNvZnVEbVNpMGdRNWZxV2xJUUp4Q1Vz?=
 =?utf-8?B?OVZoSlJoOTZSc2RGV3hFRGlWNlFreVV1MzcyZWhHekp3TndTbjFKNmc1eU13?=
 =?utf-8?B?R3cyYk5qM3lKMitUUzJBczFYRWNtbFhlNHFPbjQ2TTlJZG9DMVMxdUhJWjZl?=
 =?utf-8?B?bFRxNFNLNnBlWHE4eXBSQWM5c2x3d09vK3FWQ084VnFhV0ZJTUdsallKVEhG?=
 =?utf-8?B?ZElZZmRrc2RGZ25mV296aW9yT1VsbnFtRkVLc0h6VWNkTTdpT3R4OXN2dkY1?=
 =?utf-8?B?VjRjb01EN0lMMC9JakszMEtGYnU2UTFwYnorVm9RWjcxd3JKcVhwT0pobHph?=
 =?utf-8?B?bStVQWVNeW0zb0xsMU1FRU9wcGNwN3lFam55Y1YyL0MyMlpyN0VCVWZvNjJy?=
 =?utf-8?B?Qk5Ld0czZUlFRnlNcjQ4K1JvaFJpZ2FhOE9Hd1VWZytsSnBmbjhTeEppczgw?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6df5e6-a397-4870-daf2-08de0a4847df
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 11:04:29.5168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye3Wvj1CDgSLVjDLkWL6W7+sIOEe+ZBR5PGasNVbpTtdK0VkQ9pASgSAAtYre45Q/Tvx3NWX4QyVhMCii0apjYUGWlTjY8NpWk2MlLPbEaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6709
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
> The size is normally used to make a decision on when to stop the device
> (mainly when it's in a pre_copy state).
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 18 ++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 34 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 30 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  1 +
>  5 files changed, 85 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index 582aaf062cbd4..50f09994e2854 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -395,6 +395,24 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  }
>  #endif /* CONFIG_DEBUG_FS */
>  
> +/**
> + * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT
> + * @gt: the &struct xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: total migration data size in bytes or a negative error code on failure.
> + */
> +ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
> +{
> +	ssize_t total = 0;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +

as this is so trivial now, maybe add some note why it is like that for now

> +	return total;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty
>   * @gt: the &struct xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index 1e4dc46413823..e5298d35d7d7e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -15,6 +15,8 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
>  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
>  
> +ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
> +
>  bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_ring_produce(struct xe_gt *gt, unsigned int vfid,
>  					  struct xe_sriov_pf_migration_data *data);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> index ce780719760a6..b06e893fe54cf 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> @@ -13,6 +13,7 @@
>  #include "xe_sriov_pf_control.h"
>  #include "xe_sriov_pf_debugfs.h"
>  #include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_pf_migration.h"
>  #include "xe_sriov_pf_migration_data.h"
>  #include "xe_sriov_pf_service.h"
>  #include "xe_sriov_printk.h"
> @@ -203,6 +204,38 @@ static const struct file_operations data_vf_fops = {
>  	.llseek		= default_llseek,
>  };
>  
> +static ssize_t size_read(struct file *file, char __user *ubuf, size_t count, loff_t *ppos)
> +{
> +	struct dentry *dent = file_dentry(file);
> +	struct dentry *vfdentry = dent->d_parent;
> +	struct dentry *migration_dentry = vfdentry->d_parent;
> +	unsigned int vfid = (uintptr_t)vfdentry->d_inode->i_private;
> +	struct xe_device *xe = migration_dentry->d_inode->i_private;

use helpers

> +	char buf[21];
> +	ssize_t ret;
> +	int len;
> +
> +	xe_assert(xe, vfid);
> +	xe_sriov_pf_assert_vfid(xe, vfid);

it doesn't matter for this function, so why assert here?

> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_sriov_pf_migration_size(xe, vfid);
> +	xe_pm_runtime_put(xe);
> +	if (ret < 0)
> +		return ret;
> +
> +	len = scnprintf(buf, sizeof(buf), "%zd\n", ret);
> +
> +	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
> +}
> +
> +static const struct file_operations size_vf_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= simple_open,
> +	.read		= size_read,
> +	.llseek		= default_llseek,
> +};
> +
>  static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
>  {
>  	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
> @@ -212,6 +245,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
>  	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
>  	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
>  	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
> +	debugfs_create_file("migration_size", 0400, vfdent, xe, &size_vf_fops);
>  }
>  
>  static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index a0cfac456ba0b..6b247581dec65 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -249,3 +249,33 @@ int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
>  
>  	return xe_gt_sriov_pf_migration_ring_produce(gt, vfid, data);
>  }
> +
> +/**
> + * xe_sriov_pf_migration_size() - Total size of migration data from all components within a device
> + * @xe: the &struct xe_device
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: total migration data size in bytes or a negative error code on failure.
> + */
> +ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid)
> +{
> +	size_t size = 0;
> +	struct xe_gt *gt;
> +	ssize_t ret;
> +	u8 gt_id;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	for_each_gt(gt, xe, gt_id) {
> +		ret = xe_gt_sriov_pf_migration_size(gt, vfid);
> +		if (ret < 0) {
> +			size = ret;
> +			break;

just:
			return ret;
> +		}
> +		size += ret;
> +	}
> +
> +	return size;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> index f2020ba19c2da..887ea3e9632bd 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> @@ -14,6 +14,7 @@ struct xe_device;
>  #ifdef CONFIG_PCI_IOV
>  int xe_sriov_pf_migration_init(struct xe_device *xe);
>  bool xe_sriov_pf_migration_supported(struct xe_device *xe);
> +ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid);
>  struct xe_sriov_pf_migration_data *
>  xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid);
>  int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,

