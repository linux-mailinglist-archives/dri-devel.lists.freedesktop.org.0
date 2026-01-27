Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNdiK8zteGk6uAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 17:54:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BF29806A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 17:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A38210E5A0;
	Tue, 27 Jan 2026 16:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLDxdxpW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBB410E0DB;
 Tue, 27 Jan 2026 16:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769532871; x=1801068871;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=br76kLN2ZwTDzcr7VAyOWKesTysi6O/9P1fHjGjXWcg=;
 b=OLDxdxpWM3v6C2F6LZSfNNlTWAmtAJL+EEH8VK5+uOQzieOZv9gp9a3e
 K2hZltJL8KBPMBxp6ihMAb3xwkbcAuMrOlpYp4UNbyZKW9ksa0fbpkjId
 CUz7cDS7X2LOeugz52kts0KkJZQqb5ZLSgUlX0ni6g3kPaRCLsNkGKMCH
 DKON+wMCNIbsiYEZLZzoyKrW+Z9eOUd7lEVlKI2taH85CtqMoRwAReH2I
 eWlD0+pOiujEFH58S1e7FhohrGvpfNUWGmwWgG+SI66dlx9xZFU0M8RH0
 +oTtpsVN9xvi1MJS4KDG3yRLFjFokUHbC+oWiohdt3xMK0nimvuJQ+dC7 Q==;
X-CSE-ConnectionGUID: nr7fmuqtR+Wb+tI+zxuZpw==
X-CSE-MsgGUID: eKQRKCMbSZCbKkr13B3kWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93392395"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93392395"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 08:54:30 -0800
X-CSE-ConnectionGUID: tw813gwwQZCSDi858k9iLg==
X-CSE-MsgGUID: RzaW74G5STe/AjjpQSq53g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207265274"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 08:54:30 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 08:54:30 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 08:54:30 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 08:54:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yor4xErRHa+wOfyAaNZBtwDMgh10y1EGCO50hyW+QPThrPbZAE56EVMVJW6QmS72JWPM5I90MA9sPEln66ioEqMyrZPK5e/pJrhI3CQqGxYG6e3MCiNe1tVaNYWJybJIl5RQ87W05gtfrZCzz2+XoRnD2aKJ1sd9SF31hxKEprvatrEPplkRor2hSf6qLEn/DnkB85HSECgw3IeCAKZfVbsT7/DXvYjxLhtHsRtTfxitWtqsMS+ove15CnkScYNuHz2r3NOh19fe63F5UZ3Q/m0+D0gYGGURRHVDUfZ6K7W7KL4QP1LhU7gI6X3D9GXQBHb5lgg0BXOaexdAxtB70w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0s9KL45LLFVsGScnJpeKxMec9ZYCLMZvUt0k/MshBLs=;
 b=d0e8egXGLDLaj+fYi3m4hI1//RKKawrtjcMV5xvU+Y5OvWQLCeP2iRF7DgWcw4VY2jh8MGNysdjNoUD5fFYjsnq5jNkYGp6dHbDsydKgFoZy7XzrZr1FDECYd5roF7z27ZeIUnH5QFz3+ZLW7ae7qLeeMUjrBOPibXILOWnnx014yuuLRBE5989uCVJ8ZA3h7rSqw3TixKMTqlkVcU5RkKsEdDc2Wa2txfuAfLQe6qaIcBTM0xI76HeRcQRvE7VvkuOd/IGWnGI4EOixpNX2BRGiaBqiYRO4G3ZRSPs2uzTJiIXHPsxkAyzJMPfhOdPtx2RBsIY2pGZ+FZtfsdwFaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9372.namprd11.prod.outlook.com (2603:10b6:208:568::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 16:54:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 16:54:25 +0000
Date: Tue, 27 Jan 2026 08:54:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <leonro@nvidia.com>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH v2 0/3] Use new dma-map IOVA alloc, link, and sync
 API in GPU SVM and DRM pagemap
Message-ID: <aXjtvj/2AZxY1MwO@lstrano-desk.jf.intel.com>
References: <20260123215907.1643088-1-matthew.brost@intel.com>
 <20260123224146.GB1641016@ziepe.ca>
 <aXP8B/tAuJO1hfx1@lstrano-desk.jf.intel.com>
 <20260124002610.GC1641016@ziepe.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260124002610.GC1641016@ziepe.ca>
X-ClientProxiedBy: MW4PR04CA0165.namprd04.prod.outlook.com
 (2603:10b6:303:85::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9372:EE_
X-MS-Office365-Filtering-Correlation-Id: aded4913-9a56-446f-9259-08de5dc4ba23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CiQXfmlHVEGiX26nBmIyvbbBjGPj6H7O9NHU/VnDR47JQCnWiTMmDvv5T6ee?=
 =?us-ascii?Q?vLQ8lY9LiXZQ2eUN3s50fwdAyHYRkyHhw9tkEklvYCy/ChoL1vngZBkpIB2h?=
 =?us-ascii?Q?NKe8nk3dPzPvV4fYpx0+oH586ZdV5xJFpwngz4hLPyVevj1Jic4GM11Xi/oV?=
 =?us-ascii?Q?GWHSgO4WoK7brPo64druXHmXe/LJi3ZSu5qbCWQaUVpjy83QAIH+8WiSyUtQ?=
 =?us-ascii?Q?HMY7Bv8ualcriKXjRuHymzSXs+sSIATYC1VLRVSQFzmPVK/xC5VwcG7Zl1Wr?=
 =?us-ascii?Q?Ao0JJWup7S1y3JJzvzxFZYHFUnNiPEgX3JKE4kYgcjmijzDCyrnxruL/P0u0?=
 =?us-ascii?Q?b2gpCYezJ6r+3N5xdws9oAxUVeTaBxu0Ju+9D2hQngH0WFH/00YGjRqc5jgT?=
 =?us-ascii?Q?YbJyX0075ElGIzjZdhr+CfZ0yRiO8zmR3KxftIf9SCxvVOdJo2mxQ1FQn53N?=
 =?us-ascii?Q?svp4OZQ32YbNnMHmnxZv8Tklfd86Y8MIN9Fy0cUJwvK+W8FzF8ttZI33oozd?=
 =?us-ascii?Q?CWunEO816vTUH12mBW7F3BSo5zPR0jEzf6N2crogoW2rTA4Jlq/+CmXEI3kL?=
 =?us-ascii?Q?AMn8r3vFmovVHhTh7qlhHe5/4/7EoZWqjPqSAAU74Sli9jCip5zy3vT+CJuw?=
 =?us-ascii?Q?B58jmvXdAhUvKRq5n0Tb6MKbL0+0GEY5gRMgxatsFDQUzRPBy7MLW/ZiQCfP?=
 =?us-ascii?Q?ig3Njf7u1D6v5dZVBa7AfeDMPkHy3S3sfbGOmgJoHTEHRcgPfiNPhDg6yhKK?=
 =?us-ascii?Q?p6vh7aMmUlTRYAMnXMOvFlwI6YwzbKlseL5DjLmeV1/aVhwwCcl7U0QvfN9g?=
 =?us-ascii?Q?yxUUQceKvde9qUK9khNysIQ1BpV52bWeoTO10oxBYZXN9IMT4RnnMpUP7TUz?=
 =?us-ascii?Q?VoAvipNOnrE7orRcsPSdSfPEE9Uyk0676T9ul2Bv5+nZ3SHbxm9d0zkdbrgU?=
 =?us-ascii?Q?/YNNZsVNFiurx422Ao58HSFKHl0AqDwJM5ZYU62BxuFHmkp5KCbXZ5sgYxu8?=
 =?us-ascii?Q?V02A00ynyhjxns09yAX0uHFEE9IKh0NeaUHNgRq2J0CLdPugMC/wMRUh/ayt?=
 =?us-ascii?Q?wrbD4PazhS0JUgxzIkA7nou/xbFpthu3jutUV3fveqg/cQFULMOwDpMt9kZc?=
 =?us-ascii?Q?Q1uYvIrTK+xHUrRMOUUDHwmFx+Giewqevp8sJpYfk1Ux4Y2nrfMqeXMAG8hI?=
 =?us-ascii?Q?tL7Iypwk734r+uN1iv+d7LUxdNqxlGouqguOAtMiP5XEDVaTwrjp5Dcx9GsN?=
 =?us-ascii?Q?vJn0PZIOd95si+UH7YhytDW4bBuZfIg324BmxIBHoW6ZlArmxO1BJ0+HzXGK?=
 =?us-ascii?Q?bTNDGhoaCLc8ojddFKwWT/Um3ltP6lgXsP15d2JiMvkkUXnJTX0uwwd3l0/+?=
 =?us-ascii?Q?pmxjaMUj4KrmdZ6v+YuNrDvF3CnuVE0lMh2bio7ug3yh8g4OnvovOK3Lx8XQ?=
 =?us-ascii?Q?DUAS5Ga3N6uC/Pky6BBQjXUINZHO6KFW4xjicY9Iu676L42N0uRBJX8PkKa6?=
 =?us-ascii?Q?4P7aROznx0WwtyM3uDYWEIH4S5yQs1Huj/3GXdNGL6C7h3PrO/BID6IdBtH6?=
 =?us-ascii?Q?by1U8cOUgHFmRENH99U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GCPfOaoXs6bmn3Q4g/axdQlrhIqotH2zhkaqfHtfeWL32fLrR8NutEhnkBGX?=
 =?us-ascii?Q?o4hlkOBh+oJezC10QwjlUrxOiZ4lU2f926vvw+RCE6MOQJZ+HEAmWfGtRiIW?=
 =?us-ascii?Q?ljSm1a1QlSLHDFT2n8eDDAlwo6xuny1gRSx6bk4SIepiqpWwA1i7svpsBJyu?=
 =?us-ascii?Q?ErU8GeU+ah7Zg/hX9mKIzaRx277nj/rHoFru00QkpWE5GXeaapmfj+yqRvcj?=
 =?us-ascii?Q?uTGYLaqlf3EGhzFtsK34HXZE6zS3Cjh1QglTrFsbYfNwdC1uvfu//mYccug7?=
 =?us-ascii?Q?b3mg8fJxszThX2YsFIV/uXczWV+50qZ+kJROHFhlHsdBV4LnFJJ+ZH5mRY83?=
 =?us-ascii?Q?s28CmzwZaFt242yQZ4xObzDz1uHnkLp5VE7psxTM0hiuDrw+dBnbnXErHhOm?=
 =?us-ascii?Q?5fPiOq41Q1NYAuVZFbMmwc1gw2mzJ+M0ZRrMSJyKtPNhEodHJ8oh3kXMA/sn?=
 =?us-ascii?Q?Vq1b9CbJ8tQuIJI5nWbporMYylGKY+o6vxzAtc4WObUMjtSP9b3mUyFl3xkR?=
 =?us-ascii?Q?euFF6scV67ZIytiHeOoc3561lWsC4gyWfA/UJsLOKzisxo5KEg16RJ92xHe2?=
 =?us-ascii?Q?1/BuFLgdy07yRTzIqjSRt/mTNJVjlhjbG5iOav4CnO9brym/0nI13213RLKi?=
 =?us-ascii?Q?nze3ULhgmW9dcjqz3ptkKdmt/0NtZh827O0k1MkWHOJiV8MRry6mJaGqOqAi?=
 =?us-ascii?Q?DxHs/kXmFq33Dz67srTiGCvS45xTiGTSOQOzWZas4oAtiaAHaUtd/bcUGQ98?=
 =?us-ascii?Q?ih478S1IcP79EQfDriJCUhhkakBvo9N0jguwjxfhpJgCwKNz1BsytJzLuYl+?=
 =?us-ascii?Q?iRRqpBmFnaIQYwTuYnODxw3wTgXVfE6D6wLdng0p7imdhM0PrBvitxvtSFFD?=
 =?us-ascii?Q?IGYYzCPe0QP9e7AgR3AXtUOVjzZukjnpVVXyA3pVgbWrNiWUi7Tz1UKnhTaw?=
 =?us-ascii?Q?QL1PQsU/ykA5CwtUAralCXcKHQkdCuEv13Vj0CQDq9ufGrs9fchA5bP+4oeW?=
 =?us-ascii?Q?OUKqJ+Uqnb44ZCLKgsB2fXAUWVYG/UMClVDt6NLpZeVVFiSolP+5Nfo0oiyK?=
 =?us-ascii?Q?JdkjF0xRuPPHwyt6MVoPGS8aYckDYRYQeEPoNpctAqfJ0rmZLSv2F9840QbR?=
 =?us-ascii?Q?xE2ctoEEUbkcv/wk3E+e/HfADOm/+6kzl2NWInceXd3usxjRH8jpPS7HDwRl?=
 =?us-ascii?Q?k8yeFUoGDSst/ujWvRacIU0FqzdGmFT1vXlcc/f4tH9DXiUi76AjrPPoetqO?=
 =?us-ascii?Q?NG52ffZRVkGoyMp35ha40VyBw8WzuWZt2KyUfwxDrknenMdGuOyEbtki1MO5?=
 =?us-ascii?Q?67r9rDVp6deV4P+r1Z8gvYvj78DLlujoblCInbFLcIrrfGtRxguO7uAOZS89?=
 =?us-ascii?Q?rOCEMfJCfdoytrPpUHDVff5AvqqaIL/zc5r8uuJdPdN89MdToRoDq5FWmjtv?=
 =?us-ascii?Q?Lqe8iebld5wjhJvQ1kyv6HC03jp/en9oX66fHyTvLilx3BiTgUPBUxDJ+JwE?=
 =?us-ascii?Q?D2oSrN3/QcNVq9/ztjJbtZf3OVyZj3yvY5iY/jTO8LIiG7lEZ8NHoEU/h78u?=
 =?us-ascii?Q?6UgUM5On3UO20FyvMRwzva9DIdOwiFwx3v5Bv5USJ4qSRuQdmrh2SXZuuVeg?=
 =?us-ascii?Q?iuIcrginvg0WEQJHDkRcaT3wsvfVhFnIyraagyBwIe0LyJHoFfbTu2t566Dg?=
 =?us-ascii?Q?e6YJ+evWgNHgK/G519Nczav+zx5vEnJz/dfpZRJIafEe8Lkfv5PZIRZhXa2n?=
 =?us-ascii?Q?uWVYLprhvw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aded4913-9a56-446f-9259-08de5dc4ba23
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 16:54:25.3676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJcnW9i11WbMDN4aRhozR0PFuUyUdhUIwkxS2dL+OwoYpEL9zp0CEYThEYIDR2QqArYuM8ixEtuE2mSNo9xwVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9372
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 16BF29806A
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 08:26:10PM -0400, Jason Gunthorpe wrote:
> On Fri, Jan 23, 2026 at 02:53:59PM -0800, Matthew Brost wrote:
> > > Thats a 2x improvement in overall full operation? Wow!
> > > 
> > > Did you look at how non-iommu cases perform too?
> > > 
> > 
> > Like intel_iommu=off kerenl command line? I haven't checked that but can.
> 
> iommu.passthrough=1
> 
> This is generally what we recommend everyone who cares about
> performance more than iommu protection should use by default. It

Yes, worked in HPC for a long time and we always set the IOMMU to
passthrough.

> leaves the iommu HW turned on, which x86 requires for other reasons,
> but eliminates the performance cost to DMA.
> 

iommu.passthrough=1 brings the 2M case to roughly 130us for 2M - this
stat includes migrate_vma_* functions btw, also for reference this time
drops to ~10us in any scenario with 2M device pages.

> > > I think we can do better still for the non-cached platforms as I have
> > > a way in mind to batch up lines and flush the line instead of flushing
> > > for every 8 byte IOPTE written. Some ARM folks have been talking about
> > > this problem too..
> > 
> > Yes, prior to the IOMMU changes I believe the basline was ~330us so
> > dma-map/unmap are still way slower than before and if this affect
> > platforms other than Intel x86 there will be complaints everyone until
> > the entire kernel moves to the IOVA alloc model.
> 
> I have managed to get a test showing that when cache flushing is
> turned on the new code is 50% slower. I'm investigating this..
> 
> map_pages
>    pgsz  ,avg new,old ns, min new,old ns  , min % (+ve is better)
>      2^12,    331,249   ,     289,214     , -35.35
>      2^21,    335,243   ,     306,222     , -37.37
>      2^30,    226,238   ,     205,215     ,   4.04
>     # test_map_unmap_benchmark:
> unmap_pages
>    pgsz  ,avg new,old ns, min new,old ns  , min % (+ve is better)
>      2^12,    389,272   ,     347,237     , -46.46
>      2^21,    321,261   ,     297,239     , -24.24
>      2^30,    237,251   ,     214,228     ,   6.06
> 
> So it looks to me like this is isolated to Intel GPU for the moment
> because it is the only device that would use the cache flushing flow
> until we convert ARM.
> 
> FWIW, on my system enabling cache flushing goes from 60ns to 250ns, it
> has a huge, huge cost to these flows.

I see that you have fixed this one, we verfieid it, thanks!.

> 
> > Also another question does IOVA alloc support modes similar to
> > dma_map_resource between per device? We also do that and I haven't
> > modified that code or check that for perf regressions.
> 
> Yes, and no.. The API does, but Christoph doesn't want to let arbitary
> drivers use it. So you need to figure out some way to get there.
> 

Yes, I see that API allows this and it seems to work too.

> For reference Leon added dma_buf_phys_vec_to_sgt() which shows this
> flow to create a sg_table.
> 

That will likely work for dma-buf, let me see if I can convert our
dma-buf flows to use this helper. But it won't work for things like SVM,
so it would be desirable to figure out to have an API drivers can use to
iova alloc/link/sync/unlink/free for multi-device or just agree we trust
drivers enough to use the existing API.

Matt

> There are also hmm helpers for the mapping too if this is in a hmm
> context.
> 
> A PCI device calling map_resource is incorrect usage of the DMA API,
> but it was the only option till now.
> 
> Jason
