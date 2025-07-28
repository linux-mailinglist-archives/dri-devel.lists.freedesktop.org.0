Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300FCB138B2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 12:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D8B10E4C7;
	Mon, 28 Jul 2025 10:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lRFzWnpE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A6E10E4BF
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753697777; x=1785233777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lv4UuHrDIj9QZsNuRXaqMLgBwTJwBYQNeRR4v/MyehU=;
 b=lRFzWnpEkbGkgNI6cfRjf+60sIG3PtWs4ni2CAWH316V31GQj794QRlW
 rFQjOYYc0i8NGkp69b3gkIxkSXC4WT6fwc4wSOdYTMRBJpro51vXm2xgO
 7fjxKD12jTGHY9Tbfqgawn/lrciiBn6guaPS/JtBk0yeAFG8TrKeZDOJk
 U1SuuyLz0vmCW8SvnpA3a9VHtCJDrQYKvOyu3WJej2/yLoO5b2Inw5bI3
 h1kwD2mLNE0eqjIvPseljG/+jbpIJ8LtXMKuUuRz8UlvIomEGvyLzs67s
 fFiLjiXBhc6bIfODVexr+QMTBNElweZjc0UKPwnlv6uZkxacOLi9GaFmN Q==;
X-CSE-ConnectionGUID: CeA5PBwcRjWNBZeeHuA9mQ==
X-CSE-MsgGUID: 1in+XjhxTZ2fnBn8OjfASw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55797842"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55797842"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:16:17 -0700
X-CSE-ConnectionGUID: ldtWlOl/TYu3S3hU2ApWRA==
X-CSE-MsgGUID: PdOLlb1+QyemvoSpQq+SMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162695713"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:16:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 03:16:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 03:16:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 03:16:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMpSqu4T6ika6O8OqFxwmnIg3xfUbipkcZ8QNNMgD2cOak5NUbGUo/SZUDiabbPDO71lz/jUGvQhoPNtnzSpu3Fj076tDQ1ELqHFS6zDdK+TxqTpfgn0+A1ayuIAdtl05AWt/xi/zQlpUvRYpeIPUPJK0QwNNtqmxcWRkoQ9CDAkr9j+6asSVwSt/sWog4HM2ejWvXCW8iVy7o5KTIOPeYho/dGoiJ6QDGLzHkizV0mqQN+LMrLBqwr0LmuMyMW4UvbzGan3BrsI/lihPHUaYi+dOBBgStyGG3TSylja9dFItKWHvJ3/l21tXvrspOVeBBaJJciBXpQ28tTo7IibOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHlhqWHdgGJtcBefZb+DWTPqJWVrjJ8OWA1RwkGET7Q=;
 b=KdyAgpmc87FOrkEOVfSAGv58hPuMo83yRW56TCQjSjgvaEV3bCtsKoOnPyAFcGpUPWj+cp/WS9t8ZfndcbPnaHZrAyu0tHYalsoFs53oB6wrLV/wrQSq5fENEhhCyMhfRdA6pnRHPCK7CGQrON1fawqcH1GhwY5DXgSmKRdBiPA2fFaE4nqdw0304u6nwlW8/wy9EvFoktI0A7p8IqsAlpgM6bLRz9sHziIS8H/rILud4XUnOisO8JL+kcBtf0XhmC764aa1vdb1al9I6DMqlpCiF4ncCXRiLOtdmyituS2Guukh9DNRyZ8eZPM1/D8ODjJj2qZLihPhkZlGkfFwjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ2PR11MB7517.namprd11.prod.outlook.com (2603:10b6:a03:4cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 10:16:14 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%7]) with mapi id 15.20.8964.023; Mon, 28 Jul 2025
 10:16:14 +0000
From: Imre Deak <imre.deak@intel.com>
To: <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 2/3] drm/nouveau: Pass along the format info from .fb_create()
 to drm_helper_mode_fill_fb_struct()
Date: Mon, 28 Jul 2025 13:16:02 +0300
Message-ID: <20250728101603.243788-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250728101603.243788-1-imre.deak@intel.com>
References: <20250728101603.243788-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::11) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ2PR11MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: d9275237-ed12-43b2-2fbe-08ddcdbfc863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmZJS05XbEdMVkdDM1JBWWxQSVlod1BFTmtpb0RJSi9aaUxFTEh6aFVjcjNV?=
 =?utf-8?B?ZTRYTmZVc2VrdXkwSklXaS80Q0hwMkcrbTVPaXJlS25lMlhyOUUydGRDRjc5?=
 =?utf-8?B?K1FnWWR5SHJERWlwNWwzYjBucTJ5REV2ZmJteTkrTjJNMzJQMnVLbDFZVzhq?=
 =?utf-8?B?RlBxM3g2YlR3bkN4a3hwN0ZESmtneXhXZTVVWm9icXliZUdSeDc2Vzd0MEtw?=
 =?utf-8?B?ZVVKL1JFWE9mejRnaW1QeWRDM1owdHMwNmRsQThRR3FHb0lKZkZleWw5Wm95?=
 =?utf-8?B?Qk15eC9iY1pCaEZEb0RDYUk5ZnJXcXo5eUZWSXlOYUFibFplYlo1QWVYNHZw?=
 =?utf-8?B?UnZ3WmJqSS9FbFJVMXcvOHdiRUpEdlRPU0hYQ08wTURnaG5ubFZJWjlGQ2dr?=
 =?utf-8?B?cERscFBwWWFtUzZXZXlXckZaQ2krbnBUdzY5UEIrVWJTa2JlNFdlSDBtMkd2?=
 =?utf-8?B?RjV0cTI0eE5BWkppckpyVGdDejIranR1WGEwWFo2bUtxMHVpS1hRSlduWUJj?=
 =?utf-8?B?bUR0cTIxOVBtR2MydHpGQTlqQXpmZGVlV2I1NG5QVC9Leis4NmVhWG9TUUh4?=
 =?utf-8?B?MUgvMHRPMExzdmNvM09rOWJKZno5V2xLTGMxbmRZbkVacUNOanZvUHFyNUYv?=
 =?utf-8?B?SWRQUjlNZHJyekNjUmlSeDdTN1hqM20rVnhnbkZzSmNxbnJoSS8weXJWZi81?=
 =?utf-8?B?OWtYVVFIZmxVNWg1QWlKUmcwVHZPRWt3dHlIZVd5VFdsS3RXdEJNT1c1TWc4?=
 =?utf-8?B?N09HSzZzRkt6a1c4NTdKQWswSzc2VE5Pd21tS0hBZGxodUNEeG8wcGE0TXJt?=
 =?utf-8?B?dzlYNnNYZ281Q011L242cEU3SmVhd2hST1hieWIrWXpMWGxhSGlQT2NmSFdp?=
 =?utf-8?B?ZkxpbkNXV2hHSk91RDZuVUd4SjMyNU1DVHFwYWdiS2VoWllidEpQaWprZUpn?=
 =?utf-8?B?b3FIQTJpSHVGbDBWa0FwalpHS2h4NjJRU3g5ZnZyRXFvMlovL2RYUXJrY00w?=
 =?utf-8?B?eUtpZlBXWk9YczM4RHczR3d1N2ZhbURFNnhXbjB1OHRvWnFOSGU1NU9mdG1q?=
 =?utf-8?B?eU5kelJ6RmpvUEpWak82K1BUWEVTUmQ1bWV0d0VadGZYYTNJNlI5QVo4eDFS?=
 =?utf-8?B?WldqVDZzN2Z4L2syc3FhWjZ3eHFRVXpPRmNRQ2Z4TFNDM0pabUhEandzRURY?=
 =?utf-8?B?WkloQXEzWUFvOTIvMzZzQkhpU29kNU84cjgwV0FSV1p4OFM1NUFmZWxrN3VC?=
 =?utf-8?B?V0I0Z2tUa0Q5V2JQMUFqOEo5UllUaXYwU3dyNXFaNVZSK3ZYVjNsMlBsdzlk?=
 =?utf-8?B?RVg5M3cya01CNTZXcXFpZTFmcjNqTHBYeUl6OFpHVHZWM201ZXZBTnlDeEtQ?=
 =?utf-8?B?eGRGbzYrZmhwVVZXVFR4TVI1MjBBd3dob0NhbGxYRTlOQXduR0drYzcyL1BR?=
 =?utf-8?B?MzhHZlNuYytRUlM3VjhZUW9ZUmZ3R29jb3NuQm5aZU9UV0tGNElONHVBZnQ4?=
 =?utf-8?B?dUJzZDBSaXRpZy9pS2VKMnZNOVFKNEd2V3lva24yL2Z6MTVQeEFoV01yQTVF?=
 =?utf-8?B?dFdydVdMQkM5WCtEVWd0eFNKSkc0WTVxSytDSGJ6TlpEdmhmQVBuWXJZM2la?=
 =?utf-8?B?aENBV002V1Z1NEg1N1pQL0JTTGZQaExRVGpuZGRJQ09ndmlZUkZMUzlJb0pY?=
 =?utf-8?B?U2NabUNLQUNmamsySlh5a0RlK2hoZk9aMm5VSzl3WXdDTXlMUG9YY2c1OFVU?=
 =?utf-8?B?SFRxZ2FQUG1PbzBOTmRCMjVvOG4vaXM1R2FjYUZ0dXZIVkRlbEVkbUJOUGl6?=
 =?utf-8?B?Z1J5cjFzdXJlQm5ybDF0alMvcXk5WU5DRldWOU5KTGdPWGlWNVFuc2pXMTFv?=
 =?utf-8?B?bEtzSE1HOHQ1VTJ4KzJYYnZSamVvZVdkZEVyRkh0M2d5YnE1TktRMmNtR2Nh?=
 =?utf-8?Q?ltJwbArQTb8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk5wRHZvV1NKSloyWXN6Q0U4cUpoNFA0WkRxN1RRUG5HTmF0Mlhpam1aQVRY?=
 =?utf-8?B?VkJ4dGVpSkVSeEFadHVicWtQSDBJUy9jbVNyeFUrTitTMTZTbC9NUjNwRUxp?=
 =?utf-8?B?SnMyVW84NmpNNXptWVNUYlRuYUVPOXpNRDIxQy91S3NjVG9GM21JWnQxaEJs?=
 =?utf-8?B?SjRjS1VHRUJjd3JNV3BlQXBSd3dJVnJKYWJhSDQ3Qk9LOEsrSGdxYnhlelBw?=
 =?utf-8?B?Rm1zRHcxVVpUY1E3YnY5YzN1TU5Ma1VaU0hPUVVxd2dLenVMUm1SOHlmVW5O?=
 =?utf-8?B?QWE5RGU4aDF6YmN3M1krNHJCTzgvbzgzbkhHVUQ0MDg0dExFWWVXc2xPQ0dp?=
 =?utf-8?B?U2MxS3JhTkxYRkU0MW9WSlMwbzRtMEFEU2ZhSFJHMnNFWGNOSDNxTHQ4VWRK?=
 =?utf-8?B?QW41L0o2Y2NQTFBMaytJQWJ0Sm4zV3N4eFNmdDRnRk9qTkpWTVduMC9ia0dF?=
 =?utf-8?B?MUhyVGU1dlphZmI4S1k2NWpXUldLamVrZG5lVGlXWkJ5SzZhbEszcVZUWjVW?=
 =?utf-8?B?emovYWpKcmkraEF6VStlUU1vdjVSajhYL1FNMmtRclkwSzNtYzhLMmhtTWl2?=
 =?utf-8?B?Yjd4eGpCdnh2aWFxbzNxbW83dzF5ZkwwOENkckMrZVdBNVgvODlBRnNaT2NL?=
 =?utf-8?B?QmZRSHUvZjdiNGIrQ1lqclcrdkx6WitrTjZETzRtRzUyd3I3dkIyenQ4ekgv?=
 =?utf-8?B?THp4YWpnNjZReE85YmFEQmFlb3pjMXJoUldXQTR0cE5sajQ4ZWwxVURYTFI3?=
 =?utf-8?B?SlljUzVzd1I5SVE1MDdUaGYrKzVWbUVJUEVmVDNJMXAyWkZUSU5VdWhmV01Z?=
 =?utf-8?B?b3JCM1NlSENRYmVvS3FyZHlEdnJMUzhPaXg2VTFGYyt5S0xDSXVCekd0bVUy?=
 =?utf-8?B?NU9XTVBtOXlla2poZXRJdjg4c3o4L2E2SHhERitCZlFGOTA3YmxDNnpHYXp0?=
 =?utf-8?B?VHpYOU9Cc3Y1SjIvaE04WTRjN3l5Q0hjNU1tU2VicGZPTWRyNGcrZkIya0hO?=
 =?utf-8?B?RG10UUk4Ui9ISk5HaEI4M3BYdVJOOUhjYnFuVVlTSWhabHlZQUtQN01RemND?=
 =?utf-8?B?RWJLQzJvSkZBa3h3MGJtR3dIaGl2Q040eGV5anFFenBnTlRBN2dxZ3VJUXJn?=
 =?utf-8?B?NGJTaHpxWkpZUkc4WUhVelZDQy9uUjZZL0VpdUw5WW1MK3hiSzZCYjJvSlRQ?=
 =?utf-8?B?OXpYMEdVMFVTblJNakhlT09IQW9FeGN1a3BzVVdFUGNGQnN5dGZNdng1R29M?=
 =?utf-8?B?di9PZ0xycUxkWERsam4rQ1owRkpxdExPdW9ZMkp2WHcvT0F3aU00aE9EZUIr?=
 =?utf-8?B?dzRmZXVFeVVSdCs1MU5TSlhnSHJFenVEMlpzOXY5Yi82TkFNckN6c3lKR1dn?=
 =?utf-8?B?QktRbkhNSEhsd2ViTERFQVFCUGZLUlFMVzY4OUIzcTdCTklIcmdrNE4vNnVP?=
 =?utf-8?B?clR2Y3BkczgzTzh0QUhoVk1ENlpiREYvb3ZDV0NHSktLVkVQVkw0K2NIZzZH?=
 =?utf-8?B?VTBvcHZxZkZUZW5mSGU3NXEwSndwcTlwVUFjWVpLZ3lKditVWEpDVWFUWm9a?=
 =?utf-8?B?Y0c2QXhtSWppc1pFS3JLUVlFb1R5ZE1rUHhjb1lvR1NkQVE2RDM2RWxnRXNF?=
 =?utf-8?B?VHVvWnNLRkNPUzIwVHFueUlvZHY4YXcwek1OTnVJQVJpYkhsVWt5SVFOUTJG?=
 =?utf-8?B?elZIZS83Y0k3Y1F6NkNzVnVNSVRhU2NJUzFvVFZwcVRKUWJNZVZTUnZjSjVB?=
 =?utf-8?B?Rjc2Y01sL2RxUlBGRURjMGsvTzlHM3ZzTG5GSjRLV3VQR0dRK21veHk1SUZB?=
 =?utf-8?B?RGltN2Evc0JoVmNUSFdmWVJtZG4weVRITSs2bzhTTU1BbVVoVEEyQjM1djUw?=
 =?utf-8?B?RStreUdHdWpZNFppYmxzTEhTeTdIS3RJQU14WXdjNVFHMVJ0djh2dS9ic3Zz?=
 =?utf-8?B?aDVtdHZRWkpNN09DYmFUZEdQb2NsSDRMUGxQR3FZRU0vNVZBRVZOSURtdlNz?=
 =?utf-8?B?UzZwU1dkenEvcjNwYmxKMEYrOFNINGlYd1ZhaS9kR3AvRXFYSTBPZ1laRTNC?=
 =?utf-8?B?eDJXWkloR1pydGM4TGZNNkhJODNEWDdoTXp6YnhpNTNhRU5sc3pOcDE1ZG5a?=
 =?utf-8?B?dDBhbElQMkowM1VDbG1BWE04eGZzUTBXK1k0NkE1U2xGY0hjVWZ6enR0WGtl?=
 =?utf-8?Q?PAHJdMPOcmHjR1a6BtSS5fZvLr7AvMdbqq/feNzCpzQg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9275237-ed12-43b2-2fbe-08ddcdbfc863
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 10:16:14.2249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q61u5eZrPFzYizHD3X7jIf73oo9gNMF/1TfTN+ne1Q1i2Y94Iz3QIJERRAo9rc+ltAdn1pe2W9dagTq1EkXGug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7517
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

Plumb the format info from .fb_create() all the way to
drm_helper_mode_fill_fb_struct() to avoid the redundant
lookup.

The patch is based on the driver parts of the patchset at Link:
below, which missed converting the nouveau driver.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
Link: https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 9 +++------
 drivers/gpu/drm/nouveau/nouveau_display.h | 3 +++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index e1e5421263103..805d0a87aa546 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -253,6 +253,7 @@ nouveau_check_bl_size(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
 
 int
 nouveau_framebuffer_new(struct drm_device *dev,
+			const struct drm_format_info *info,
 			const struct drm_mode_fb_cmd2 *mode_cmd,
 			struct drm_gem_object *gem,
 			struct drm_framebuffer **pfb)
@@ -260,7 +261,6 @@ nouveau_framebuffer_new(struct drm_device *dev,
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct drm_framebuffer *fb;
-	const struct drm_format_info *info;
 	unsigned int height, i;
 	uint32_t tile_mode;
 	uint8_t kind;
@@ -295,9 +295,6 @@ nouveau_framebuffer_new(struct drm_device *dev,
 		kind = nvbo->kind;
 	}
 
-	info = drm_get_format_info(dev, mode_cmd->pixel_format,
-				   mode_cmd->modifier[0]);
-
 	for (i = 0; i < info->num_planes; i++) {
 		height = drm_format_info_plane_height(info,
 						      mode_cmd->height,
@@ -321,7 +318,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
 	if (!(fb = *pfb = kzalloc(sizeof(*fb), GFP_KERNEL)))
 		return -ENOMEM;
 
-	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
 	fb->obj[0] = gem;
 
 	ret = drm_framebuffer_init(dev, fb, &nouveau_framebuffer_funcs);
@@ -344,7 +341,7 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
 	if (!gem)
 		return ERR_PTR(-ENOENT);
 
-	ret = nouveau_framebuffer_new(dev, mode_cmd, gem, &fb);
+	ret = nouveau_framebuffer_new(dev, info, mode_cmd, gem, &fb);
 	if (ret == 0)
 		return fb;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index e45f211501f61..470e0910d4845 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -8,8 +8,11 @@
 
 #include <drm/drm_framebuffer.h>
 
+struct drm_format_info;
+
 int
 nouveau_framebuffer_new(struct drm_device *dev,
+			const struct drm_format_info *info,
 			const struct drm_mode_fb_cmd2 *mode_cmd,
 			struct drm_gem_object *gem,
 			struct drm_framebuffer **pfb);
-- 
2.49.1

