Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38A6BCFB81
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2914210E315;
	Sat, 11 Oct 2025 19:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ttobcno3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228EF10E119;
 Sat, 11 Oct 2025 19:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211637; x=1791747637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2lhyGLoMebQAXB47AfKKbyI2E2aOlPu5+Ym268Vjt5I=;
 b=Ttobcno3vmlm9S9rcw8HRo11+L6Cso7GzqzQzS0d8Ig2vteffzcDd3Cj
 I1EMl0OijI+OlR9qO+6VWZahuukyAy6TuXdBpzZ0/2zwbFDki/xPerhtZ
 bSVtukheJuNZeVyIeC4ivOkKtgCVEbcGPRDIiKOO1y07O8xEQHiofnp9g
 6N22GZmK12CQkZZmFzK+x28v6UrPlSdQR6wlfz/gbT7+hHTzSEXnQ7wEm
 oBOFwlzDzoenFiqYzDJP7vxlRVDvPJ6SHfFyC5CUxPlqE11T1O6c08pT8
 7tPPJoaaxH7CQv4Sxr2x/Jb4h02OdWUGCkuVDC3GhViqwAk0jDyo6k/++ w==;
X-CSE-ConnectionGUID: wsEIeU+wSai7AAjcq7yCtg==
X-CSE-MsgGUID: wXXwGT5lQLi3Jzc8WhrKSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="49956507"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="49956507"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:40:37 -0700
X-CSE-ConnectionGUID: Vjt1QfRDSUO10LDBrk/MVg==
X-CSE-MsgGUID: /OGAEHslRrqQH9X2+uZfRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="180490177"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:40:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:40:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:40:35 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:40:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpKUBE4iFGGe3IoFbl+EtnpHkue+wE33GgTg2bnWdRvg4o8mxXp4IpPHtD47Rznu+WeAKsLlJVUbCyc8jw55cZxLOJIDzzZVzLevxPkIOMM5cWsbmUcKFVJudR/c52XmPsBlnGNlE2sUgAoBJgCl9ZdHIDg6boeSaxSU/MSFvmc4h2g7nH0F7EKrKJTguL7ht8pALVquS8BFWdq51EW1OT7rhISqRtZ/Ub/E1czygyz20areML/Qwu2XvutJ2ZUoZCdTdRmSzdqEcMaVrb4lfFIUQmT//blQQuvJM92cqNAbTQVb2+BQBaFA2U47iGwTTyzM2UyuippTrTHHl56etQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVif1Yc5b5KiVGZe8ZknBWyUk7UWs4lx7ze++Bt+ctA=;
 b=xGdgco0Y/0eRCU/qzmcde9iCu7R6SGd3HZNUr+Mt2iIrtGf0YzTiRnXzTsGgEJCiO3IIfZFWnX1e1eE6Ijfbl/pinOoL8HebiEtsuynkP6n/rHnJA654ZqnkgTNpWoJFhgCX0xPThozagCu6T/8UQS7Hmc2Q/VOVH1pB3cCy2Pen8Q+dZakF1EqzH7E8evPE24zaejP3HxpmbAmtaCb4/2lYfR9QVDArB/FRjXv0X/6XMdLq05megYIczCgCnUtNPZISb35Xo8vLqA7XGdO+aGQ3bLWdXOLr0dyjqWrNq0z6DzBuUftVqWnWCrj+5Ak3SR1btmwfOs2W0V4ZVtcNWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 19:40:32 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:40:32 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 04/26] drm/xe/pf: Extract migration mutex out of its struct
Date: Sat, 11 Oct 2025 21:38:25 +0200
Message-ID: <20251011193847.1836454-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: d69ab0e0-4255-4d51-5756-08de08fe0aa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzlZYVRiZ2lCT2c1Q3ZZQS9xNkU1ZHFabFlyUVJKaEw3NkJsMVByOG9KVHkx?=
 =?utf-8?B?TmQ3RFIxZktrUFNhYnBkZDRzaTU4RXMwTm5SYk9kdDJ1YmRnZ0R2TU1xY2pn?=
 =?utf-8?B?aVpUNk1pNTFCN3E2RmxZOGpWcDV3SldNcVRCRzdJRHhqZWgxWVZ2a0ptUzBR?=
 =?utf-8?B?NHVWeTE1MDA5QWVPS0xiV3IvdkVKb1RCeVNNR1hnUDJ2cTh6YnJXczZBZ0VX?=
 =?utf-8?B?Z2RqUWEyQlRzc0xJQjRrZXUyQlVhT1J4YXlZdU1OUmtzM2pHOENMdUNBam1D?=
 =?utf-8?B?OExMWFBtbm54OWhPd0k3SENRYUhmR2dPMFUzQnNqNnZDc1JxVDlsSkNlSmxB?=
 =?utf-8?B?UmtEam01bWw0Yk56L0xKT1I4MGtSQ2ZDSHJYTU5hNml5YmVkTmwzTlpuY2Qy?=
 =?utf-8?B?RFUwQ2Zjdkw4ZVBzdlFSVXpPMGNCT0t6K2JxOTZWOU5QNDJiaHBYY2ZnYmtP?=
 =?utf-8?B?WGJRUDBvYnBUNm5ieitVb2grbDc1YVNRYnN1L1RmRjNhY3JYbmFRTjFUZldz?=
 =?utf-8?B?a3pxcXgzVUY0ZURzcjNIaWhBUVlkOXJGR3ZDWEprVUNmMWtRL01ZRU11TzRZ?=
 =?utf-8?B?RVV6NlJHYW14WnhuN244eUJuMmVvNDNrdUxwYjVIVFdTT2JLdWJWV3ZuR3FT?=
 =?utf-8?B?ckZCL3ZQSXJDbG5qbFpqZ0M4TkU5bDl1VTh1dUhnUmg4elk0bUdrYnR0U3Ra?=
 =?utf-8?B?ajlkbVNxRmZtcVBHbTNoMG5SSU9vZDJoUE1RbDJzVHFvcFM2c3lpd3hZdzlB?=
 =?utf-8?B?b3lFaFVJWlRrTUNEZVRsZ1ljTElLajRsRldrL25SUnZQRUZKMEh4d21HMFhL?=
 =?utf-8?B?dXY1dWlRZEVpSEUrKzJxVU9TZ21oQlEvdU55ZGtpSmlaWjBxT29mOFpzRWxa?=
 =?utf-8?B?VGY0WHdmZEpUM1FqV0crc0hkYWFFMUxFMTZtNUk5WHJsNWxYZEsxR3Uxd3ZJ?=
 =?utf-8?B?Y01VRm41M0VDTTBNcXJOOGdCYjAvc1VjblRWY21KS2dlZ1lFcVZuUjNPYWp1?=
 =?utf-8?B?TGY0dVBkTHNyYWU5ZEZ6WEE5TXJLTUh0TDlGSXk3d1ZFU29ET1E1QkExaDJj?=
 =?utf-8?B?RlFaZVI4TzZaZmcvKzhQVDl5NXdSNlNtaERmOE02cm4rSlBqZzM4SW53YXdy?=
 =?utf-8?B?Yjc1UDYrekk1ZE1TUjVCQk9teW5hK0xPN01QcXVYYSs4dHpXaHc5NGwyRDJr?=
 =?utf-8?B?RW1ubWNyMUFBYXJnMWhqc1NqUGFIQndZcFE3Zys3eEdzRk5ESEhvem9oRVdP?=
 =?utf-8?B?M3JGZG4ycnVrbmJhT1haaUp0VVduOGtENFk0bnJMbEZzbGVzWFdUa2dCbjBN?=
 =?utf-8?B?MDFBUjZTK0J3QllkWWdtUTZFMm8ybnNuT01rUFg5TXlsamc1clp3OGswa3kv?=
 =?utf-8?B?Nm5KWmZVcXh3L09XRGFkdkROOGVhditRVFV4b3RUd056Mmx3d2dTR0lTTThq?=
 =?utf-8?B?ZkRRR05zM28zdmJsMVVRaDRUZ0R6MzcydXZoYitpR0JxMnExZThScXVQZE5R?=
 =?utf-8?B?K1ExSlQzNVBPcUtXRTJueFpjNFp6N3dXUTkrcnhxZ3NVQkYyYkU5OGRMelp2?=
 =?utf-8?B?ZXVkMnhhd2JyYUEyZUJ4VmI0bityb0MwTnMxcUxwdUFZQ2wrUDJkRDNsLzhF?=
 =?utf-8?B?UDAvYmFBZ1VDdlI4bHJHSFBBeHlYSDB2N3ZDTzNWQzVNdmNDUFQ1WU5UUGhi?=
 =?utf-8?B?bXZwTytYaEVTZmZReE00bW5VN1FVcmlDZFZpWVZKS1IrS0lqbjluNzhNc1Fi?=
 =?utf-8?B?MThLaFBDRE83UmtqMEtEVGl3M0lGRTJOdFg3cGRYY2xtZk1vRm9vRjJJcWw1?=
 =?utf-8?B?SkZJVW11Q2Y2S1lLQUxFY2FqaGU5ZkFwVEJWR3FDWlVpQ2MyUGl4QlJuL2dt?=
 =?utf-8?B?bjI1eHVFVGpmcjdkMldnVWRZQjJlaTBpMnFlUWhtMnpjaW5vK0hDNFdZaXkv?=
 =?utf-8?B?NEVkNXZoSmdIUmJpSnY5UjZ5Tkk5czd5bWF5aVFzTGRtK0VIN2x2bWU0ZDd4?=
 =?utf-8?Q?On2UPQ3iYfy5wvq1B8bDGU5/zPuEzI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1NMVHJ5cmhrWU9uUlk4SmlicXhNM3R3ZXFMYmMvZ2pEMks2cWN4M29IUlNJ?=
 =?utf-8?B?MzNOanA4UngrTmNUcnhqWmVVYVV3QnlsbXZ3SEo5bytnZHJwb2RjU0svdXEv?=
 =?utf-8?B?YVVtNUNrU3VCS2RJUWtIWm1QV3kvcFBhQ045TDFoQVYrYytqdzFuSEhKTzUy?=
 =?utf-8?B?L1M4Y3BHT1JkWW5ySVRrejljTjdLMjA4RVF1NzNjbWR4bHJpWGg1SVlBWkVz?=
 =?utf-8?B?elFyaGZZSURCdHVhZXQ3bkx6WHI0aUg3SkRpVjBJTFBzMFlkRmlMOVlGdUxa?=
 =?utf-8?B?azlmZXNOb295M0VQbkg4MjljOGcvK25zM0IrdnZNTFR2WHVPYVltTWpscURE?=
 =?utf-8?B?V05GYW1CL3ZNdDc5c1EyU0JJT2JZeG53eWRTQk1IVCtwUno3TVFGWVJaQXIy?=
 =?utf-8?B?M2tqSzFOQWlpOHBmTGJFZHdrcHNvTFVkN0x1dVpUS1ArNm11N21GVk1EaSt1?=
 =?utf-8?B?OHhiMGtBR000YmZXUGsrUFJ6MVB5b1g2S0c3R1daRXpLTHh6dVZpM2k5M2Vi?=
 =?utf-8?B?ZzFLTDBjcTlxWlF4WDVYNDVvMVZicXBXSUR6SGlMaGpLWm12TEI0UkdrOEpL?=
 =?utf-8?B?OFE4ZTZydWI5R0pXL1dobUhPaW9DTi9sS3Ewd3NMT0RkTkJQN3lSeXFURUpt?=
 =?utf-8?B?QXdwSWI4UkxiK0F1NU50NmtROXdKcGp0UzFiNjZVL1FoQUxwdkFYTGFWZlZJ?=
 =?utf-8?B?YWxha0VTOGVqaFNDdk9QcCtLYm1SOEJnWVBSYWV6UTk4bmZzaWE2UmpTRyta?=
 =?utf-8?B?enRNN2JTMFNVcGUvWXQxSFlkYUlaUWpnbmRzekJMczAwNmhtTFovcUI0Tjds?=
 =?utf-8?B?OUhpS3ZZaTJYU0V4MEI2azFPbGpIaFJ0L3phc3lQTXBnMU5jOC84VUdlM0Vq?=
 =?utf-8?B?UHR1ek4yeTRpNVNEaElSK3h2elFTYzhmWUZIZnErRjQ1VXVYYjBFS2VubEpv?=
 =?utf-8?B?eHcrS1luWDYzTUdBN3pCRWt5TklhWEFTSTQxelNBOWtwRG94T0VhWUVPdWNM?=
 =?utf-8?B?azF1QU5zeEZXem5jV0grVU1XWTVNQ1ZQdTV2U2NJS0QwTmhWbHl3M2RwY1Rs?=
 =?utf-8?B?ZTdPamd3akZ2bk9kTUl0dGpzWDFlWENxRFVIWmZyT04zZzBlQnM4R3lCT2ZY?=
 =?utf-8?B?Rmg5ZVk3TW9KTVExVGUxMUdFQzdoL2tGZFVZdXZ6U09ob2hSdGwrcVNoVkJn?=
 =?utf-8?B?Nm01Nit2UVY3ZTdiYS8wMEhBUWR3ZE9mZndnQmU5dk92STZ0bUc0YUF5eEs1?=
 =?utf-8?B?Wk1mQUxSc25pcXFhTGI2TUczc0ZXUTUzK1ZnbTJZVkMyK3Mybi9TUnB4eHVF?=
 =?utf-8?B?YU5UUDZnOUtNZFpwOXpDaEhqMy9NaHZkYzFvb1V5ZjRHMWJzSXhyUnlVNG1j?=
 =?utf-8?B?Um5EN2JuZnVVNXZrRTRXcFJpSUtMclUzSStnUWQ1U3NyRkhEMFVOcDJOSVFP?=
 =?utf-8?B?RmplT2IwSE82TUZETmR2UUlVQ0ZwQ1lYNS9GK3R1L0czQ2JHVytYSU5hOVlC?=
 =?utf-8?B?bnpLQlhXbFRWckRCbU1nUWR2OXFaS0g5Q2xKSkVKNndKTjRzZ3VOUjJ6YW92?=
 =?utf-8?B?REQrZWpVNG9tUEQwaEZqcU9GbjhXMHhrcEhKc2IvMjRWTEo2cXplMzQ4L3p2?=
 =?utf-8?B?K2RBOEUwZ0d4Q21QTnlMc1BSSll0RW16R0xBaktaenB5Zm96cGdvN21odVg4?=
 =?utf-8?B?RURvNkQ1VzMrY0krUmVyd2Jtdjc0eFpjVFplK25CQkRGYjBFK3JGSTdYUk9k?=
 =?utf-8?B?UGdiOTNYSE1FNkYrYWp0RU9Ba2ZhRS9MTGJvcnFVTlRkQ2p1NlA5WkwvaVZC?=
 =?utf-8?B?RmkrMU9lZlUwRTRHMm5TcFJzbUxCOHVOdTNZSWFuSk9GWHVnTnRTODlMemRL?=
 =?utf-8?B?ZzVKNGpwR3RPYTZ0U1NPdjBmbzBaUGcwMGFnNjJObk1OU1E3eDdqYVZscWV0?=
 =?utf-8?B?TlRld2RlWEJkcnNINzJvRG00SEdsZW9KV1ppclZlTGVyYnhZT0VSeHJIcGtX?=
 =?utf-8?B?RWdMK205aVE5MW1GOFUrRkVGYlVMUUx3TnkvdyszQWcyRUREcVNYUUlVSkc1?=
 =?utf-8?B?MldKQ004eFFSYVRtVlRuSGlBOVRERURKV2sxVGVSWXFKWTh4UHgvckFjbHUr?=
 =?utf-8?B?QU9zRjBaUzlKWFE1TUNKU2R3SFo1QStyZCtHMlZZbVE1ZEhMSG9mTmJGSU9Q?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d69ab0e0-4255-4d51-5756-08de08fe0aa9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:40:32.8072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9eMiuqBFBbxvOVe1kuKamUj8C2fD8kgqm+Dw7dJj761Zx27xWKsFETUaJDcqOIr1CapJgrkE6hwcaQiQqNnEslb5HUIPPtu7GhW+nLoSXYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
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

As part of upcoming changes, the struct xe_gt_sriov_pf_migration will be
used as a per-VF data structure.
The mutex (which is currently the only member of this structure) will
have slightly different semantics.
Extract the mutex to free up the struct name and simplify the future
changes.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c       | 4 ++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h | 2 --
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h           | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index ca28f45aaf481..f8604b172963e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -122,7 +122,7 @@ static bool pf_migration_supported(struct xe_gt *gt)
 static struct mutex *pf_migration_mutex(struct xe_gt *gt)
 {
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	return &gt->sriov.pf.migration.snapshot_lock;
+	return &gt->sriov.pf.snapshot_lock;
 }
 
 static struct xe_gt_sriov_state_snapshot *pf_pick_vf_snapshot(struct xe_gt *gt,
@@ -400,7 +400,7 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 	if (!pf_migration_supported(gt))
 		return 0;
 
-	err = drmm_mutex_init(&xe->drm, &gt->sriov.pf.migration.snapshot_lock);
+	err = drmm_mutex_init(&xe->drm, &gt->sriov.pf.snapshot_lock);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 9d672feac5f04..fdc5a31dd8989 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -30,8 +30,6 @@ struct xe_gt_sriov_state_snapshot {
  * Used by the PF driver to maintain non-VF specific per-GT data.
  */
 struct xe_gt_sriov_pf_migration {
-	/** @snapshot_lock: protects all VFs snapshots */
-	struct mutex snapshot_lock;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
index a64a6835ad656..9a856da379d39 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -58,7 +58,7 @@ struct xe_gt_sriov_pf {
 	struct xe_gt_sriov_pf_service service;
 	struct xe_gt_sriov_pf_control control;
 	struct xe_gt_sriov_pf_policy policy;
-	struct xe_gt_sriov_pf_migration migration;
+	struct mutex snapshot_lock;
 	struct xe_gt_sriov_spare_config spare;
 	struct xe_gt_sriov_metadata *vfs;
 };
-- 
2.50.1

