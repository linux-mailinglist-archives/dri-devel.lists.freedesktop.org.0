Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E953AC8B0C1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 17:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2AE10E693;
	Wed, 26 Nov 2025 16:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VT5/RKJr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BD610E662;
 Wed, 26 Nov 2025 16:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764175722; x=1795711722;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YfjJCs4z7Xh4N0qCO136wilFLY7XT5d3wac5WutMQuM=;
 b=VT5/RKJrl1Qzz9wIhjCovjT3ToPg4QdNN6HbRLL+bx62pk+/WwfFoDMg
 RWhm5xpqsW4YccCOdnfB+Bd8mGou4FYz3j2qQCfIepjGPU5OfUdngtNNp
 SJo5hJDE6p9bBUrn5IRObzzM0lGTcdJ69lMM3Zkp+2E/jia/DGwMlFUnE
 rENl2jrPO2SKukZCT4jWvR+StMjaPoAkJvwAU3oy9qlQcM9zqAGmhrqFj
 gw/iPb7liO3CzgVRayClDcOqEGv03L6OA6syh2HfiwfA7VqdhTfm0lr6I
 MAZL+vzcy7ajIOCU0YJis7BtAG6mCnTGRLkSXq1PbuH9i2sWNyDR7NN4F Q==;
X-CSE-ConnectionGUID: xLK4RkwgQ26Jbqvf6sw8FA==
X-CSE-MsgGUID: 45TT6cGFS9W+sisQlGQvUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77692114"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="77692114"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 08:48:41 -0800
X-CSE-ConnectionGUID: IXBH7IcAQpeX/o3mXvPheg==
X-CSE-MsgGUID: EIZwJ7DWQyWoF1ZinUH3xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192874509"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 08:48:40 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 08:48:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 08:48:39 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 08:48:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvMl4YgO//tdhDRAmgFnKFTuHAksHdlYJGByGtdn8qQ//LuBw5ofHZ/itiXKrAEwn2e8k/AiH/4K0PRuPK2fJUhWaZUzWGSWHZ04dE0LQzRtI+m62MPWaDeEH/9EEjBWrdJK10Azz3wctHIrHNxknFHYVOtQ/5XNm7aUsjW/OLebnTWEgDFMsRWtYsAGe0YBpKfBqa2GyGuyM5U3ygTXKgH4r1jAIKhW7KtKTnG6b39Ooww3jGTw/XMFrv+zUMiaUM4bJWGQ/0NLjXeB17Nj4ACk+Rr/B3OjEkVWC8W8TXY/rMUFfWOXGKi9nNp+6K1sz4EQJUq5fc1eQsH66pRSIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8mXEJXRTrc/AkwhJ4Ibj6kFSYhtiMKB59stjIohEck=;
 b=hIy/HN8XEy6G6isVPiOOChYAoJBDmJWV+aGJRTGlwFt9pVsDrS0TH2FhEd8DWqJWHfuNppcPzC90aPJ9yOD7th61w9VDPL92Nx1M2lSIRxzJCM4Q9WHlZEoa04lUVtA+n/EAop6dWV3HbC8a1mBTK0ncWo6ZiA0+TTMNReXO1IyqTRSgHWckEcLjnXPcN6d9UVyJk7sQCv19D2JLJCNZJYQLVtqGdHYilK/iTXxJyt7b6VYzV6W+ZkNe/cedbinytxpqbc0xaIyxOYRQd/9IvreZ60ch80q4kiWrb2LhlG9es/SvAQBg2SYu7l7cl/JUG1CFX0Niv6bev+gx2gvFog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5115.namprd11.prod.outlook.com (2603:10b6:806:118::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 16:48:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 16:48:37 +0000
Date: Wed, 26 Nov 2025 08:48:33 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <phasta@kernel.org>
CC: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 3/6] drm/gpu/xe: Ignore dma_fenc_signal() return code
Message-ID: <aScvYd0zEXpn87S/@lstrano-desk.jf.intel.com>
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-5-phasta@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251126131914.149445-5-phasta@kernel.org>
X-ClientProxiedBy: MW4PR04CA0284.namprd04.prod.outlook.com
 (2603:10b6:303:89::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5115:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b9df1f9-58ac-472c-2949-08de2d0ba4f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?KJBh8C8cn6bNhey7ogNXkj0F7ni0x3FotbPluzE4Ul4MFQZXj+knUUDLnu?=
 =?iso-8859-1?Q?wGn5M5v5ENn7lthW7j2FMeYcgficf7ZwHg+3Ot/TAheBk6fInU08J3kVCr?=
 =?iso-8859-1?Q?iHt8zeYIqXHkD/oVtUrt9cyr1VRpzCxcr1Mc65ztTBg2RXT8Y+PGZLPeiP?=
 =?iso-8859-1?Q?GzC8Wl9PjJrVJQ7blIKTg6LLfjS5iKyccyqYH5EU3fY5iJapTQTaOylP0b?=
 =?iso-8859-1?Q?+z7bhNipV99GCGwEihovdVcDPQSGw/BQyZt+iCPa4cnd2SkRp92XNYQ1qC?=
 =?iso-8859-1?Q?Kx1Ng6CDyziBdpBT4IfjC/QAucdnxyFEkM30MIn0ZljRaQtO2awbNSiFYL?=
 =?iso-8859-1?Q?gt5djsURc6/KhSjufbgt5QYebx3Zd/kXPscDpXZLw22C3KtDSviQthEBId?=
 =?iso-8859-1?Q?dGWLSKszBSdUi6AwxUWuaJ67sQe91vYb2E97eYYKRQw3lCrZ99LvHEshxn?=
 =?iso-8859-1?Q?OwktF4RktwG2av+Ty14HMJBRrUnqjM0BE/M6+6zya/NaYaahyNQ6iV9BGg?=
 =?iso-8859-1?Q?MmVlMmkvjDGZuoXq5VBr9Xj7lqIAbYQxDYZv28g3/Amfq44stCuR2Bl68a?=
 =?iso-8859-1?Q?ajqyYRdpGp/M469iWbOp8YIloLepx/D3Z6tmyyLd0ZzdY7hBn5VyNVYSCW?=
 =?iso-8859-1?Q?sHXliur4KqKvZl/iRqfRFgcbOz3b/knBvxPAkeaUn62I7iXwD4tkph02HZ?=
 =?iso-8859-1?Q?vZ7eiETGMTHAfPG368lUCeyo3Je2vqQzYbbSPmM90NYCm3tT/T/NH7z3Kc?=
 =?iso-8859-1?Q?PSfdWIE9p4EoKxhBcQpsPvQxswXUNlMXj3U/WP1tomp/lRv1D79BGuGZaI?=
 =?iso-8859-1?Q?aLL1iUCR8FmD79Rv6qkbIIjamt0pEvOZ8xKigwkJvAyQD3jhpjp+X+29UN?=
 =?iso-8859-1?Q?k3IFzUeQ+iO30qMdn0sE7/lll+oX/tKMony6OSd5k61JhB+AsVcawUwxrA?=
 =?iso-8859-1?Q?JCpjwG+dMW1Ot1DYkyKQea4P63xj5ou6wsyNHVVtSAp2dRvgH7b/YSVjy3?=
 =?iso-8859-1?Q?2IFmMsfuxbM7/idMkp+sGMY32FWvqMCX4kqazN7l8UPwbzscrjcs/0CcBv?=
 =?iso-8859-1?Q?X5pOqGf13OYrO+Wn3GfJR3Qe1GOVbogFj29NKLn9yVkHMAmrpGjM0jqC2u?=
 =?iso-8859-1?Q?NlGfOE05X+yhKQMRu5A2mMAtTsf6O+sfovtpXSRFjJIXM3U2aXOF5UHDQ/?=
 =?iso-8859-1?Q?5tXZjUMAfwd127O88U6ldWcweJaADEzLWVxo4Mo/eWdZU4hSzcDDgDjwyY?=
 =?iso-8859-1?Q?ps+zzfMESM1mh4XIH7/vMwEdagCZwGUzsq6OPcUFCxfBqEtn1nwmJhdC9R?=
 =?iso-8859-1?Q?VjSu/f9yUTiDjIShcSWJKAWXaLwVpcefaNwEudCKumRlCLhqJZW+LcFZTh?=
 =?iso-8859-1?Q?AExyKYALEtykCp0mk+4HFp8H80X5UIMeLJ2isLQK7U3oZeItrybFT+7Huj?=
 =?iso-8859-1?Q?TIH4gwAv2mh8140wx82ydHN6Rp620QY6usoYzPJEwwVWPbaBlZ2O7hnug5?=
 =?iso-8859-1?Q?DPXTy4ow+Ff7PrAVFb3z/b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SDCRUIYe+wkJin6G5KLVyDcrg7Dyv9vXrxoFAoslGdIaq92fgxbFkWuqgN?=
 =?iso-8859-1?Q?vNqM3cAiOTRKod8ndiTYeTQLJeZ5SMBdl55SsBm4FSotpzW+LK2Q5iLnHd?=
 =?iso-8859-1?Q?NBHGkRGzvRrvB9YWs0C3wIYp+bc7F8rJcbxwPRo/qXRajKLMJNG5iICM+F?=
 =?iso-8859-1?Q?uYOJnUZxc3ZUEBl0YDa71nWuCXAWw4hW3dhhf6yYxOwkdGxGql+wjKONwB?=
 =?iso-8859-1?Q?vSXN2bq+dUpa7IP+UaT8YbRXZGJxtZ0FEzObG8JlrsrNkMgJY2B5QHHJt6?=
 =?iso-8859-1?Q?jX56m9pLIMgtatzhN118pPYtsPyRulkXwnufrokSV7Ju5gORnNdSpF+a3G?=
 =?iso-8859-1?Q?m9LkBRqizUC/b1rFcPu4tEF+27D+18IyRPd3Cl93rQ1Co6aWBXVwXMyTb2?=
 =?iso-8859-1?Q?j5ohfMQLkaADhAY+7bBtjiCmhc+Zor3VoX8pORfYnb3YjB0LsFbzRSuZlZ?=
 =?iso-8859-1?Q?6+T3NRi27UW8UIevMcATO1hbJujlMwwwOQKqOsbvMcvjQVLNG5f8ce8QEL?=
 =?iso-8859-1?Q?sB2Z7cZrQjtTv6QVvSMNe554chU5ycTX3QhfULeJcVvi3LUUXZ8JvN5iRF?=
 =?iso-8859-1?Q?U/1v+0dRA0R8YAvOxP+6rOdxNmhB1swk1c/QKKeDZmHFEkkmE6O7P9qq5D?=
 =?iso-8859-1?Q?SMzbTZiKKAcc2gqB0pZCzkqAe3iRRScNA6iyOeILjp9vOsp4pAyCqCo+7U?=
 =?iso-8859-1?Q?okw/VbQgACWDlFULPMbj34Ebt6YZjE7rE78g3oldEkD+GTYMdDVDOttDJz?=
 =?iso-8859-1?Q?fHifGsV2y3XzrWiSTcy7JbyAd43SLHbYi76mmAxkv8+B9Um5d29PjGXm/c?=
 =?iso-8859-1?Q?UfSFVNcwvQaxAc1cWFSditFsWhcRVZllma1tupOKsduq5rJggP7Ja7TS3n?=
 =?iso-8859-1?Q?q2NbVnEyOnOCQtvm9+TpAEdb3cFR2bu3RenqUSyVzcnzT7negmSOkgc2Um?=
 =?iso-8859-1?Q?UJvPw9zdJNsS2mzuTJzoS/rxXvjav13I061BGOBdTIR2wnvWGiDb5//tJf?=
 =?iso-8859-1?Q?f8zIcCuhqpJpyA5beyydP2Z0apTnDgZS1jcAMoRJz/SkQHIlnekvsFwROK?=
 =?iso-8859-1?Q?jl9EUzrs7OnubP+G/kdl3baVzjbtiU2zFWz5Yre2bMsM/bnvxByjvCdALR?=
 =?iso-8859-1?Q?go4zO1IjgLAMM4OKZq3Dk5NcnndUbnTUstm3mAMA+MoxT8U+hCKTgwm9S7?=
 =?iso-8859-1?Q?lU8oecF99rkB0muSAkl38B0VZisIFpgMkACUVIbSnKKll/6DnCFtVn8q1M?=
 =?iso-8859-1?Q?MRvGKbq7rlY/yiXUCCsNsDPEg2SEQ6BAdZp1a8W1k8c6LXqqOeseEpwbP8?=
 =?iso-8859-1?Q?JtGZiH0m+JJMk+/4d025w4cLtX5lfk9b1JM8qFooCRC0UCsweD+8EX0EgK?=
 =?iso-8859-1?Q?YZayAXFWh3ew7fsNuIpABwAePA80xlHRITZ6crMstxOEuCrR+VD9Lqi5ud?=
 =?iso-8859-1?Q?+d5hb6a91uPYjR9hs2S56Agj73Bsv4lI0SKXj6GYiLMOiviPInuej5XuxZ?=
 =?iso-8859-1?Q?+DY+U2eyXt16j+T6SwO3sD8EDBfOXNsWtEs+dN4yU03vpeJ1nTvNsZwlGW?=
 =?iso-8859-1?Q?Ey3sFMii8tBnLabRyGtI4lleXnp4UwzZqXlNbvZtm+8z1a9dqq2eT5jge8?=
 =?iso-8859-1?Q?wxpJwF8+R45R9Vkg0pf/mBY2ErkSazZFrA7afYWU5RSG7eWu54kIWM1w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b9df1f9-58ac-472c-2949-08de2d0ba4f7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:48:36.9850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QneGtOH5yjZg8q/aPgK2SX65ZGqiRpxD/7vmF1yR4BOaCAXQApJcWREQytsMYuvqlQuVXfBeE+Q9KKcn/rWIFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5115
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

On Wed, Nov 26, 2025 at 02:19:12PM +0100, Philipp Stanner wrote:
> The return code of dma_fence_signal() is not really useful as there is
> nothing reasonable to do if a fence was already signaled. That return
> code shall be removed from the kernel.
> 
> Ignore dma_fence_signal()'s return code.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/xe/xe_hw_fence.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
> index b2a0c46dfcd4..959b30dde724 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> @@ -85,7 +85,6 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
>  {
>  	struct xe_hw_fence *fence, *next;
>  	unsigned long flags;
> -	int err;
>  	bool tmp;
>  
>  	if (XE_WARN_ON(!list_empty(&irq->pending))) {
> @@ -93,9 +92,9 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
>  		spin_lock_irqsave(&irq->lock, flags);
>  		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
>  			list_del_init(&fence->irq_link);
> -			err = dma_fence_signal_locked(&fence->dma);
> +			XE_WARN_ON(dma_fence_test_signaled_flag(&fence->dma));
> +			dma_fence_signal_locked(&fence->dma);

If you also want fix Xe to use dma_fence_test_signaled_flag in all
places where we manually check DMA_FENCE_FLAG_SIGNALED_BIT, I'm not
going to complain. Ofc I can also do this in follow if patch when patch
#1 merges too.

Anyways this patch LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  			dma_fence_put(&fence->dma);
> -			XE_WARN_ON(err);
>  		}
>  		spin_unlock_irqrestore(&irq->lock, flags);
>  		dma_fence_end_signalling(tmp);
> -- 
> 2.49.0
> 
