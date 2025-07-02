Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A906CAF1010
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43EF10E694;
	Wed,  2 Jul 2025 09:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPh0NV7C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF3010E671;
 Wed,  2 Jul 2025 09:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751448972; x=1782984972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uB6jE2ptaaA4U5D/ApIUi1fmomOOwaLYQh3KKTiAAN0=;
 b=GPh0NV7CTy60T2VwwdGkK0n+DKIPuV4eADNH5Xcy203oC/Jmz04BPkO7
 O419/K2XceeJQO831gh3xjM/0zqHVh0O1Sdh1RMqsx/U6k2Uhy8gJaPcl
 bS8hS6lOKMOZqexvmqD0FLbyUg10TomyutV3Nk3OJa0ATMCK38s4qww0s
 HKEfwTYRWJAm4nYMqMKRPTOksBgz0KdNgSE+qK7BONfx0MO96vroKJRLh
 mfF+MzZu3aspZzlaAD6+umgxsFZtZQqwcYXXVH/ogHB0MymSfSvWXTcz8
 b/G6QvfWihA7e2oFbVn4F/MGmRA8Rz5PeNGGzhJSnU0HuDQCmSwR5bCK5 w==;
X-CSE-ConnectionGUID: 5xEpT99HTw2wIcT/Oa9rPg==
X-CSE-MsgGUID: 83LX88yZTWaNaflJJdbQJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53852630"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53852630"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:36:11 -0700
X-CSE-ConnectionGUID: Ll1SFtMCQjaTljZvZFCTIQ==
X-CSE-MsgGUID: 5AuwsBwHTTuF0PiFNSd0RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="158404606"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:36:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 02:36:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 02:36:10 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.77) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 02:36:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aq/9s14am/uZ0WBB6G0fSfqt6BeDrpAarKK1EbnT7B2ec49Kji0jJUYdhXEQPK9lAKfkgH9tffp5hht8ac3PZGrMN8GU4vBuK5oSJcBcWbpUUk07zyXEvf9uH2NdIYohZ8XoxgykTQSYNd0ozUs0yJHS/6OwO2OA9Y2ekLNBCLJuPFjs2gI08eVzndg7Ti55YE2WBMdtX+J+Obf8amSPP7KYPCYQEUfY+4z4wfck94Y/1kAYl6QGtSVlK/uQ+aeOWu9ZTwoP96QBaEp4m6KIF6PN2vhk/k4Cx0jK7dYE2mVek2AQyIaC4+yqodXRzLC6b7j8Zq0ey0FdYVc/+xlvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdhivEEa2YyxAtZG7/glAqLR/1dCP6VTGUCf8VJBiqY=;
 b=UV6y+W/Pd3VPR6cn83Mexs89zn/DNAuPsBW23L+AFO42I+5Oo2pakF677hko2S/DPXSj+ug7gtt3LcPq+FmWvzc1FRazQ48RndeZWPw/XPEXcdqM9sHLAhgF0QHtq4TCMXKg8IhjmTUnEqxx+nZ9vr1fu8akrfaU0C9AbyqrvL+zzraPmx0JsOrk2GiQJFQG4iyqlIL/SD5SzW9MT9xK4OQkDTxb4RIZHCvFbDA9XVtlLPHFc9QI8ml4r9dem6F7Xe9G3BnP3FRaDImNoc48t8RgVSZZ+4/+VIpV1fAAjdX7KRrhyhDBUHUF6OjlpebOoB0sy5AxFGb6PsOm6yXQ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB4846.namprd11.prod.outlook.com (2603:10b6:a03:2d8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 09:35:46 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 09:35:46 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v10 1/5] PCI/IOV: Restore VF resizable BAR state after reset
Date: Wed, 2 Jul 2025 11:35:18 +0200
Message-ID: <20250702093522.518099-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702093522.518099-1-michal.winiarski@intel.com>
References: <20250702093522.518099-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0068.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::45) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB4846:EE_
X-MS-Office365-Filtering-Correlation-Id: 696cf265-0d6c-4fae-b537-08ddb94bd24c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWtrMVhyV0l0SStOOGJERDZCTlJ0eWdkRTY2TnBCNVdvdzdpQjVNbW5FaTRR?=
 =?utf-8?B?KzY3MlVWTXlTcENXdUFDWWUrNUJYQWRvWTltWEFveG5Zd28xM0pURGR0TW5Z?=
 =?utf-8?B?Wmt1RlR3cDNXOW56Q0FUOUJmTUFkUkZSNktUZ0dEb203MVlLK2diV3UrUDVs?=
 =?utf-8?B?cXk1Z1FPWjRLc05xUW1lb3Bib2J6RWJuSGVCV21SbTZ2RDAydTNuUXpVbTBE?=
 =?utf-8?B?RnR2Lzg5WG84U0JuOCs4NEJCY2JxeWx3WXp5c0VCck1FcVh6N1NGTVBSOElv?=
 =?utf-8?B?bURKaVZsWDFSeHp2RC9oLzJrcEQ3elFCSWdrVVowWjhjVWFZN0p2dDI3WXNo?=
 =?utf-8?B?N1dEUVlIQU9kMHE0ZkgwcW5NM2JacmRxVXhvY3NtbWRZNVRJR1ExWGdVMGRO?=
 =?utf-8?B?TndPejRvNmdoWi96a3RvK1ZGbnVvUW9NVU45YTYwckc2dTl5alJxNStnOUNi?=
 =?utf-8?B?MzE1SWhwczhEdTRWelpqQkpYT3RIcjhXckY3emlrWEVYSDJ3cmc4UHlNWDBH?=
 =?utf-8?B?bEt2VEpuUlhINmhlN2M0VjY3K1E4VWx3eHdHSDNPaU80Y2ZFL0tBR1lGMGh5?=
 =?utf-8?B?Wm53WUt0Qjk3V0pGd3d4MUl2dzlGaFVrc1d6VlJNRnFWd25PamY1WjlYSFA0?=
 =?utf-8?B?ck11Q1Zzd2piYnFsY2hQVzdrUmgrQ0RRT2VvMGp1Y05QU25wM2RkRGh6U2Z6?=
 =?utf-8?B?OFpWYllHQTR1Q1ZDcVk3WFVGemgyM0dJQVVCb0VuUytsckEzLzhJWlZvZjU1?=
 =?utf-8?B?bVduMFQxeHJSQU5RRVZMckZhRW9Mbk40elg2WFhxdzYrRmlxMTNDZE8xM0oz?=
 =?utf-8?B?NUd3SVZ4ZEp4Q1VISFZ6VTVjOGxISW40T0xlWFdST2djNGVjSGlPbWRsc2Vt?=
 =?utf-8?B?eXFjc2tPQisvcnpOTHRlc01EMnczWUdqQ2V5RTBVK2xnSzhzNlNYZWpCdGRp?=
 =?utf-8?B?TXpYZGI4MUFIbHJ4UUdoVlNDWHR1YjVyeDduSFdGMGEzK0xhS2Z6M2g0bjhx?=
 =?utf-8?B?UnFiT3gwbmR3dGJEOWpYZERPY3FVQWdMREp4TGcwNWJNQXQrQWMwdzJBZmlI?=
 =?utf-8?B?T0hnaWtqMkRHUWhleHc4K2FLVlNtT2cyVUhWWTl6UzZGWDlPZXRPbmM0bVZx?=
 =?utf-8?B?bUkreHVrZ2d4Y0xNWlFEalYrTWd2ZnRjK1BOZDVnWkhWbWxhMFlFMy9tb0pF?=
 =?utf-8?B?T0ZBNHRva2owQm5CSHVmUWFvcWdNWVl0bDdMeTB6QllUU3plVHZYSGEyUnd4?=
 =?utf-8?B?WVNzb2NEMks3K1g0Z1ZHSlFieUxUSTZzRDcxL3lNbHZIUkVhZHlMWFlMZGhT?=
 =?utf-8?B?UE53ZGhJYzdHZjRqRzJQZmdrbHk0bUV1VjVpU0VCdjhuaGFPMjRWVy9CR0NJ?=
 =?utf-8?B?Z1NtQmh6UThsWW51alptbGh1V3BwUlM0dEw0TFFrazE0cmxqZ1B2Vk9kbERI?=
 =?utf-8?B?QnJMZXZMd095STJGSWRjSTVXZGU3K1dYU0RlS3RuZXMxc2lrQlRBWE51d28w?=
 =?utf-8?B?c0gwZ3dpcTZHTFhETEJNVjJURWNOWHkrN2hhQ2hjSTRGRytqNnhRQm4yWWRK?=
 =?utf-8?B?dWZXdjZtSG1xcXBlR09OM2V1eDZmaGJMbW9DSnNBYkFITDdRQjlKZFpSUlRy?=
 =?utf-8?B?VGdnVHpuTDc3TVVCeW9SaWZYd3dldWlJYnRJcmlqbFBKYU1DL25BWXhjWnox?=
 =?utf-8?B?MXZXTm9CMnpZa3NUaHR6V093dUcyQ3I0VTVScHNqTTc3cDhmaWhpZVZCQnkw?=
 =?utf-8?B?Q0w2YlE4b0lmM3R2SXhUdXhjaWtMTHMrTW8yanRScjczSk9IV3EvN0pUMTN3?=
 =?utf-8?B?Szg0dUZPaGZta2JDdzlZYVc2WHpjYTdIZ29Rcll3YkFkYUJJeDV5OTE0enVS?=
 =?utf-8?B?aHNURFJhczJ6NXNMSGpJYmZ3bmhVZ3NVQ0Jtb1dlQ0xKemc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEV3WVZJZERra1lqTzhvSjhwS2g5dlNLZC9NZnc2SFVldFFVTE50R0kyc0Rr?=
 =?utf-8?B?ZXRkeHlieFcwS056bm44NW5Tak0xaVFMNit3MFMyR2VEMTRyK0k3M0VvOUE4?=
 =?utf-8?B?dndycjNLcnpnUlVnSVV1WXozbERRVlJEcUc4OEtzczdaQlBtcTVIZEF6c0NV?=
 =?utf-8?B?WDBGK3BDb1pwd1lpQjdKRG5BaTVleEFhSUFHK0F4VXd5ZjdidjhiWTd1OW40?=
 =?utf-8?B?UmJOUUErMU9MMXR3ZUpvS3B2RWNHMXRnV3JYQzJhTm8yTkppaWd4UWVlb1Bh?=
 =?utf-8?B?T2hHQjV1ZXkvQTRieXZQM3BsdjBsY0RhdURQOS96UGpmNlR6TGNsVVFQVHJN?=
 =?utf-8?B?S21ETGk1K0VvTitRQSt1K1pSZU1uNk1hK3ZLOGhMR296cHpVWWVLTzQvdnlR?=
 =?utf-8?B?dkdjb1B6ZjBudzJFR25zSUdXQjBMaDBiQ1RiUkZpVEIyTk5JUUJJd3Z3YVRo?=
 =?utf-8?B?MC9wVVZaNHBUV3A1U2VUNEtJVVorVDdWbHR5QU94NVlwMThsc2M5V2ZsanZL?=
 =?utf-8?B?M1hvV09IL0xMUUpBSk9MN012ZGpwUlJYZEQ0Q25NRHA3Y3UrcCsydlFtM1pH?=
 =?utf-8?B?bjdUalhMVWI1ZTRLK3NmOWpWT0FEWE9wcHVISUs4SVFFTHhkeG4rbWcvL3V5?=
 =?utf-8?B?QlFZTHBacnUyLzloUGFlcTBWNFJwbnIxcUFNcGVWUGRDMzJqbzk4KzFRcENI?=
 =?utf-8?B?SWtUcjVQYlVQT2l1aGJ4bkJpSEtmdkxuSXBzQWsyalgwZk5BTTFzWjFCdTBY?=
 =?utf-8?B?WkNXS1hwN2g1b1g3MlMzQnJxM2FJVW11Z1BOTGZnd0Q0a21yMzFaeTd2d2RT?=
 =?utf-8?B?QkdvMDluelpyajR0Z3R3RndpWm9memRSQzdYTW9pdGtobnFHc09IaEd1ekxt?=
 =?utf-8?B?YUMxSStmUjFiMVUxYi96Tk9kaDIxQm96dDdES3JsYnNZZG1OMGNGZkJDdXJv?=
 =?utf-8?B?V241Y0plVkRMSTdISVR6NUFJb3h2eVdKSm1iWnl0VCtBbXkreGRpUHQ3TVg1?=
 =?utf-8?B?T0lQQklYa2VlQkpuZHJ3M0o1NkNvZTRvdk1qaXR3R3BGUm92VVN3VVgydUV2?=
 =?utf-8?B?NWxpTmhmOWRCTUVUeUNVMEozSXNlc1cyS1NzUmJZMENNQzFsaVZYRkl4Wm1y?=
 =?utf-8?B?VGVFaGNRUVo1VWsyMG1KL3Zlay9mcVhQWEpQMkVaTHRmVUFwaVAvR0NHcmNG?=
 =?utf-8?B?V0xVWE9RWjRVRHlUN2FJUWFWMTB6ZFcvSFZPbnprakJOb0pYNHRWMTkxS2hW?=
 =?utf-8?B?V3VvL1JWZGpJUUJ4UUorb1dwMm9jRmZjYlZRQWRrUjVJMkYvMXJtaDhPYXlp?=
 =?utf-8?B?U0FUY3Qzd3NlZTJqVFhrTUtzZnVGZHUzSkF0MVBBSGtXVWZIRkFvV1kzZ0dL?=
 =?utf-8?B?WmVLaVRyTHFvMmplOUpQVlVhY0VaclJ5NXI1emwwck5lQzZMVm5MQVFUNi9i?=
 =?utf-8?B?a0p5ekpwVG5PNXRjcWNuMlUvQUlvRUw0NzlUNlVET09iNHFZMkFaZUZtQkZl?=
 =?utf-8?B?QkRVeGMvdEZWS1pwM0xUNklZMGF5TzlRSU5vMTQwR2ZMQWJwRndVeXZIUkJO?=
 =?utf-8?B?RWZPK2JZNEJWS2hNWFhuNVRSOTBocnBqcWlNSmJEQ2QwYU9UVnpBSEQ5MXh4?=
 =?utf-8?B?bHE5aWY0RS92OEYxQzFSWjR1eDB1aWxxeXJHaVRWdkVjZnVDMElqVUdqNlg1?=
 =?utf-8?B?MmtBVThQYVRQcTl6bWpoa1FzNXQ3MWFQMVkwQ2tKUzdLWXNJMUFmSW5ta2NE?=
 =?utf-8?B?Yy9jeXZPa3FFaTVSaEZhMXpVaFpsL0g0UXZXZ3huUjg5RmJ5d294Um1XOUtt?=
 =?utf-8?B?dDIxcHdZOVpEZHZudVk5SnVJcHd6VXJ5Q1E3OVhLanlRQU8wdlgrNlkwTTJV?=
 =?utf-8?B?Z2FrQzJOUDE2bGVtZG04WmpVNzBlK2lnVWpEQk83MCtkRlBhdWdrT3E0eGdr?=
 =?utf-8?B?S0tKbzlHUlZqZE1TeHN1V1kwenRjRlJKSkhlKyt0QlE4TTVrZXh3ZGhqdURZ?=
 =?utf-8?B?alRGUnp0bUlYY2RzWHluUzRWdjJuRHZhR1hucnZNdmIyTE41cjJYeTZPVUw0?=
 =?utf-8?B?T3FsVzhNd2Uyb3RhYU1rUkFsVHlSNnA5cGhlejZNeFRVUzRDWHQwZWZrNEQ2?=
 =?utf-8?B?aGw0NDlFMXV0SGtIQytzbHA5QlJncmhGRjZWdndnaXVnRUFvSlBaaDE0Y2c0?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 696cf265-0d6c-4fae-b537-08ddb94bd24c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 09:35:45.9500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTWyzPtFJy8dkXrkRKGH1xKLGFrl57WCykVCR4+i54TGyp74JUakGyo4TmRZCEcEocH6JiIn8eSBFNYibuId7ZAlVChsVm29WiA/u8mZbOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4846
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

Similar to regular resizable BAR, VF BAR can also be resized, e.g. by
the system firmware or the PCI subsystem itself.

The capability layout is the same as PCI_EXT_CAP_ID_REBAR.

Add the capability ID and restore it as a part of IOV state.

See PCIe r6.2, sec 7.8.7.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/pci/iov.c             | 30 +++++++++++++++++++++++++++++-
 drivers/pci/pci.h             | 12 ++++++++++++
 include/uapi/linux/pci_regs.h |  9 +++++++++
 3 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 10693b5d7eb66..10ccef8afe145 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2009 Intel Corporation, Yu Zhao <yu.zhao@intel.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/export.h>
@@ -850,6 +851,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
 	pci_read_config_byte(dev, pos + PCI_SRIOV_FUNC_LINK, &iov->link);
 	if (pci_pcie_type(dev) == PCI_EXP_TYPE_RC_END)
 		iov->link = PCI_DEVFN(PCI_SLOT(dev->devfn), iov->link);
+	iov->vf_rebar_cap = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_VF_REBAR);
 
 	if (pdev)
 		iov->dev = pci_dev_get(pdev);
@@ -888,6 +890,30 @@ static void sriov_release(struct pci_dev *dev)
 	dev->sriov = NULL;
 }
 
+static void sriov_restore_vf_rebar_state(struct pci_dev *dev)
+{
+	unsigned int pos, nbars, i;
+	u32 ctrl;
+
+	pos = pci_iov_vf_rebar_cap(dev);
+	if (!pos)
+		return;
+
+	pci_read_config_dword(dev, pos + PCI_VF_REBAR_CTRL, &ctrl);
+	nbars = FIELD_GET(PCI_VF_REBAR_CTRL_NBAR_MASK, ctrl);
+
+	for (i = 0; i < nbars; i++, pos += 8) {
+		int bar_idx, size;
+
+		pci_read_config_dword(dev, pos + PCI_VF_REBAR_CTRL, &ctrl);
+		bar_idx = FIELD_GET(PCI_VF_REBAR_CTRL_BAR_IDX, ctrl);
+		size = pci_rebar_bytes_to_size(dev->sriov->barsz[bar_idx]);
+		ctrl &= ~PCI_VF_REBAR_CTRL_BAR_SIZE;
+		ctrl |= FIELD_PREP(PCI_VF_REBAR_CTRL_BAR_SIZE, size);
+		pci_write_config_dword(dev, pos + PCI_VF_REBAR_CTRL, ctrl);
+	}
+}
+
 static void sriov_restore_state(struct pci_dev *dev)
 {
 	int i;
@@ -1047,8 +1073,10 @@ resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno)
  */
 void pci_restore_iov_state(struct pci_dev *dev)
 {
-	if (dev->is_physfn)
+	if (dev->is_physfn) {
+		sriov_restore_vf_rebar_state(dev);
 		sriov_restore_state(dev);
+	}
 }
 
 /**
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index adabf59bae40e..3bd507583c3fa 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -494,6 +494,7 @@ struct pci_sriov {
 	u16		subsystem_vendor; /* VF subsystem vendor */
 	u16		subsystem_device; /* VF subsystem device */
 	resource_size_t	barsz[PCI_SRIOV_NUM_BARS];	/* VF BAR size */
+	u16		vf_rebar_cap;	/* VF Resizable BAR capability offset */
 	bool		drivers_autoprobe; /* Auto probing of VFs by driver */
 };
 
@@ -718,6 +719,13 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno);
 resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
 void pci_restore_iov_state(struct pci_dev *dev);
 int pci_iov_bus_range(struct pci_bus *bus);
+static inline u16 pci_iov_vf_rebar_cap(struct pci_dev *dev)
+{
+	if (!dev->is_physfn)
+		return 0;
+
+	return dev->sriov->vf_rebar_cap;
+}
 static inline bool pci_resource_is_iov(int resno)
 {
 	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
@@ -742,6 +750,10 @@ static inline int pci_iov_bus_range(struct pci_bus *bus)
 {
 	return 0;
 }
+static inline u16 pci_iov_vf_rebar_cap(struct pci_dev *dev)
+{
+	return 0;
+}
 static inline bool pci_resource_is_iov(int resno)
 {
 	return false;
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index a3a3e942dedff..f5b17745de607 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -745,6 +745,7 @@
 #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
 #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
 #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
+#define PCI_EXT_CAP_ID_VF_REBAR 0x24	/* VF Resizable BAR */
 #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
 #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
 #define PCI_EXT_CAP_ID_NPEM	0x29	/* Native PCIe Enclosure Management */
@@ -1141,6 +1142,14 @@
 #define PCI_DVSEC_HEADER2		0x8 /* Designated Vendor-Specific Header2 */
 #define  PCI_DVSEC_HEADER2_ID(x)		((x) & 0xffff)
 
+/* VF Resizable BARs, same layout as PCI_REBAR */
+#define PCI_VF_REBAR_CAP	PCI_REBAR_CAP
+#define  PCI_VF_REBAR_CAP_SIZES		PCI_REBAR_CAP_SIZES
+#define PCI_VF_REBAR_CTRL	PCI_REBAR_CTRL
+#define  PCI_VF_REBAR_CTRL_BAR_IDX	PCI_REBAR_CTRL_BAR_IDX
+#define  PCI_VF_REBAR_CTRL_NBAR_MASK	PCI_REBAR_CTRL_NBAR_MASK
+#define  PCI_VF_REBAR_CTRL_BAR_SIZE	PCI_REBAR_CTRL_BAR_SIZE
+
 /* Data Link Feature */
 #define PCI_DLF_CAP		0x04	/* Capabilities Register */
 #define  PCI_DLF_EXCHANGE_ENABLE	0x80000000  /* Data Link Feature Exchange Enable */
-- 
2.49.0

