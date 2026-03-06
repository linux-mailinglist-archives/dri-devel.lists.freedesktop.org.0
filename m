Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBcAMxiEqmnRSwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:36:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3257621C866
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:36:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733A110E39D;
	Fri,  6 Mar 2026 07:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="injQ8VU8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457F510E392;
 Fri,  6 Mar 2026 07:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772782613; x=1804318613;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=M26QUocVF5HLAWzSJUkvu16JpbqgbJqYGrElKL+4yEQ=;
 b=injQ8VU8wcuxxW1VqUnOSJVTNk87MKLtyc27s2JC1oM/0j9wU/WOWvE0
 bkuS13+6ZyVzLw9Wmoupf78vkNQ8YnqADBJbPEQf7r2ilBJTVPZLz2DIQ
 wHTejA8HqexTWrQhKUXFxjJQm0uC01iNGUU6iInyb3ie1KDK5kyDCB+uU
 0QbspO54+YJaANNV89EQ8NPP/BH9lhO+yVKv0/LYhaRZgH2aALojyNNcF
 uVNtOudtOk1E9cvv70g41PUWSIIJHEplQ/7aB/v0rTmA18jR7kkbKHAsL
 iHl7Glk0Cs5rsWzaHTozUUUX9Vli+op7XSE+nBtSuMfFC3h3qBJjlqki5 g==;
X-CSE-ConnectionGUID: YKnEjFgdSrS5LZBR14o0+A==
X-CSE-MsgGUID: 4HwZvIgrSy2yOimpCikJ/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84519695"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="84519695"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 23:36:53 -0800
X-CSE-ConnectionGUID: kHASJDMlQSyT9dI1vAg64Q==
X-CSE-MsgGUID: VZtuxWOqQKWrAqOTDhTcKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="219065695"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 23:36:53 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 23:36:51 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 23:36:51 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 23:36:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m4XWh4m8UsY+JKs+os4igxIYxlDkt0Hl42KJMX8rpKcShhu2IYxOKj0iKTtrEec/iHkQez8esC0//0wcRd7FHXcXyLbOngRkukzPfiEwYYaTcS24AzIkJWf5jYK/r2a18smGjBwMqmhHLUJ0OmoXzsB6FbiM0W9xOgSrDUKBpfBs2CjQgagIBYyuXprsw000YuNwjybcke2PRhVcjm4ItUmiYSmF8+4pmVeqr9yn7oWWdcTwxi+53WsnAfUrYm9ABgo+MijqMEMnT3Dbxk8O9gbPYkzjHHf5Ut/kBZLQd7raMOuqBIsxuhoyCmE7ZxVY1hMxDvlXX0T47PevfiHNjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNRwKiTpEgFDt1HTmlqoxXXo0Yhpo22kJBAudEBZDuI=;
 b=NsiD/XteA5mojfX9vjqAmtuWzostmKV9bjFvFm49Ivkm5fMYV/SCgcWVLbqTjmf7s9Pr9lFsgR0vULfKp6itCVRmnLgIj+hlifK4yd14gVF+kaAiPQN4UBQoWebTfgRCXa5ps5uJFPMTxlF8Wvo5fLVdtr67oN2lGDdwqEAg/izCxwnPF/SdkOqiAzXM5tcpedEdcS0oqp4otQyGNtH5d1mWCZNl2JPjzNBjb/5C1LmhVmKyYFXaHls3561HuAnQauYQCJvfbBM2fYJVPNvl5w/cs6m+bCBZ2bQ8X5SGkhPmm+3G49pA+e4utnfzKuM3P5caXP9OgwfJ9kzd2K7RTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7639.namprd11.prod.outlook.com (2603:10b6:806:32a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 07:36:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 07:36:48 +0000
Date: Thu, 5 Mar 2026 23:36:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Chia-I Wu <olvaffe@gmail.com>
CC: Boris Brezillon <boris.brezillon@collabora.com>, ML dri-devel
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Steven
 Price" <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, Christian
 =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, open list <linux-kernel@vger.kernel.org>
Subject: Re: drm_sched run_job and scheduling latency
Message-ID: <aaqEDd7XQuWTOhR6@lstrano-desk.jf.intel.com>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <20260305102323.11b07502@fedora>
 <CAPaKu7R3t0Vz3WLg0G9aAVgmWhTGQWPKc6YHsH+2cRKnUjtqow@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPaKu7R3t0Vz3WLg0G9aAVgmWhTGQWPKc6YHsH+2cRKnUjtqow@mail.gmail.com>
X-ClientProxiedBy: BYAPR07CA0069.namprd07.prod.outlook.com
 (2603:10b6:a03:60::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: bddb0c49-0644-47b1-2273-08de7b531fb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: 1CXT2hXC4wcR4lRFSn51QWfaaOnmCpjPRf7L23WWHuLUyHGHd57qe2GUWGhAL+Z4lkKJwx+RecnF6YEnVKnArAZfj3X0MyJGNuk3b0l7tZ7IPbjR62ScpTZoQeMgGlVO4h09UVedmW+1snh1Z2bT0r2Ebv0Dlsk2XuXo2i29wF9gjHbg/LSfzZEpDNF7UFVqihkCG91W232U0PZwqUAFqHj1t4w9tO8NzRSusVkWinjFGK6nP9oBwFhwBrfyGkdaT3MLfT3y0p0iJqWIv1MkUwLuGd0BiXvCKGmJI5rREY9QzetfBe4/ItXp1lS5pbBlUmmATxdkm0zp3pMeF0gMHrpjkdCiWg/XRTlOFxZrjXTDj2WpXy1K/tkeW195YNQGT0HNrXpuGI0Y4OrvVsepDyMG/fUcCtoUtH1eRTFTX4XnJQRlRqj+GSXq59eZlOsSLTY0QrOIBbnxYD8cRcJVTqkXh0QGR8HR5S3u/riWsiIMtl3T+flH+ZY3svydh7shzouGDqpZdqvmY7CdRNL5zD0u4k70WEefeM/SLWxywJLjw8iDtzqUo/TjzFlnRx8pE+QvIrzDIUxS3sGqDHWP+cag/UzxVsodiQzplJD/wnzaSsW70CKTArx/57cWy0FVCO/8pEkDCjIvsbtwXyc3cwBjxz4qVMCKwrfH7kPku9QZonwJu1pKMooGLHuVN3eGf5zycUuOzZDejtpR15p/AeX5S/G7sfM/EArqjCAC3b0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFVCVFNIVU1uSGp1QW8vblR2eWs5R296T1hhV3Irb0cvOHVwUURrTGRKWjds?=
 =?utf-8?B?cmVvaWlBeXBGU3AxSWt1dTR2WGgvcWxxeGtLSUQrbUNyTy9lYm9QeS9Lbnkx?=
 =?utf-8?B?Vmo2UkprbWFUU2FkeWg5b3QxdGJ4aWliWnZLbTJ3QytKYTNQY2xDYWhwN1ZY?=
 =?utf-8?B?alAxLzhLZVI4eEFGM0FNNStQdjd1NkNOcXpHVWhkclZ0cnE5Z0hhbGVhZk1i?=
 =?utf-8?B?MTU2UHFlOVUzNDRoeE1Cc0ppa1g1Vmgza0oxVmlnN0tWMWlZVzZ3clFhSlVJ?=
 =?utf-8?B?K2JZVStxRC91Z1E4NTZpN3dBcnlmZnRYRkRPd3o0VEt3aTBQb3hXOWpMc1Mw?=
 =?utf-8?B?am82VFVtVUQ2VE9BZFVmdDFnZ0FnTGd6NmU4Mi9oL2JrQ2NTM1lObnBWSlRl?=
 =?utf-8?B?NFVLbFFRMmZ3SC96ZUk0OFZBbEpEdFFIbDZ4L3MxSnJIN0xvY09LUEtub2M5?=
 =?utf-8?B?TVpkNkJ5YjYyaHNic0s3eThoWjY4Q1dnaVY0WnNJWDFqUXowanRwRlRMemZj?=
 =?utf-8?B?U0d2Vnl3ejFEL2hxcEdFS0ZMbXpXbXBJOUFOdXhwQStBb25xWm1xWkxwem5P?=
 =?utf-8?B?Z3JlKzhRYUY2RHZLdS9tT3dZZ0drcWoxempkRStBNmVyLzU2QnNJM1lubkI4?=
 =?utf-8?B?eS8rK1FmMnUrdTk1NmIyMkd6WG9SSzlueElLM1ZiMjUwUnZwUjBwaG9BMkcx?=
 =?utf-8?B?Nll4MSs4dDJaRTlOdXMvUXVRZFc0K0tUaW1NWDVOYllNT1V6YlpKay92c3BY?=
 =?utf-8?B?Yk01aTZybStXbEE3YTMxWXZlbkhlWUFFNUMxUURUNzZMY00zd0o2TlFjNlVW?=
 =?utf-8?B?bkJyL25YemtsMWtSbUYycUl3eU5Lbi8vYW5BNnl5NVp1QVA4b05YdW5oa0NV?=
 =?utf-8?B?MjB0MHJHejFTdGViZTExbERVMnV5ZGpXRWxyaVY5V0JVMEViSS9tSWRNZkVq?=
 =?utf-8?B?ejFmMW5jSkkyaHZDbDVXNzlDdnh5dEZ0UFhnLzVORk9ydTVRWlNLRTlMWEs3?=
 =?utf-8?B?cUs5L1diOWdjUHR6YTRFbkx2enpmSTJJWVNjWmZVeGd5LzZnME1IR3R0ZlJD?=
 =?utf-8?B?R2JNQ1lFUVU4c1RPNWJFNHJuOWM2eHRjd0hrcmRkTUhQckR6NE9lcWZFbGxh?=
 =?utf-8?B?ZG9vaTV1QmgvVVhyWjgxNXFBRUYrWFFDQXRVdW1BNS9GV0dxZnZMaUpnaEQ0?=
 =?utf-8?B?MlhFUHJwOHV0anJ6RDFXSGMxSUlkaElNWWZjSkM5QUVha2ZjemZnN0ZkSGg5?=
 =?utf-8?B?b3JsQVp6bFY5ekIvQ3pWY3ZHQ0QrQ2tnOHhaZGpQL2dsQ3cwVTNkUDJEM2xJ?=
 =?utf-8?B?cHUrK2ZUcms0VHVBRHdkWHlzcys5Rjg4aGFCWWtoSjNTeUdmLzBDcGcrUWdx?=
 =?utf-8?B?UXpEQ2VaenVrc245emxpQmFMcUFHRmpZNWNsZlFrQUp3TGlhalVSUG9qMS9u?=
 =?utf-8?B?UE5PZHZOSldIZng2dU93VSs3cGd3TzFqRTNEalltOGgrdXc1RkVFMno1QU94?=
 =?utf-8?B?WmI2dG9KQjBnYk92cnQwMHJSeEdmUkhTUWRJaHBmK2JQTTNTR3djclZQTkRG?=
 =?utf-8?B?UHpraU9JSnBHTVZ2cEtDWXUxWHhZdWNtbWI1dTBRT3o5NHM4bkFxSDNSUjJk?=
 =?utf-8?B?QTBBaXpSVk81Wjg2TXFPSzlvRTB1SEp6VDFiRlY5TUVYM0ltc0NLcDgyekNl?=
 =?utf-8?B?TVBqTU9oUk9qQnMvcTArYXV6U1d3Um5sdkVnRE5Cck1tRTNyRFdDdGhrMHZ2?=
 =?utf-8?B?RVE0QUNkbGhLVVdSdnVjanE4cjNnU2lCR1JzZHZ2Um13YmlSelpxQmIyVmhs?=
 =?utf-8?B?Z0x5clE2TCs3bHI4WXhISGFIT1BoUk5ZRTBwVGdXSjRpQVhXazQ1cTk0YjAx?=
 =?utf-8?B?OGpZcE9xVmxFNytOdjhIMnRXS1hPR3lBbHlwYUNkcU0ySWVNdWgyVXBqendU?=
 =?utf-8?B?K0x1dTlabmluVzhHZU5odUxzMUQ0RXFUaklDbFRIU0ZDY1cxQ1QwREg4UWpv?=
 =?utf-8?B?Nm5JQlNHL0hjSldHUUZ1OFp2Y1ZvYlR0N1AwQTdZTnR3K1FpQnJwdXo2V3pP?=
 =?utf-8?B?UVR5OVZoRW1kTVU4U0NBZ21IWUw3OXZuU0hVbVZVRGMwR3ZSTTFNY0VzMVcw?=
 =?utf-8?B?VlBod1hiazBSV2p1R2RCdDRDQTl1dWxFS2tEemlXZEhSZFhwNlhwM1Y1UTlS?=
 =?utf-8?B?V3hRM0xhd2tYb1dpSHY4R3FWVVNMWUxmcll4c3hTY0UwVlBDNFJWakhyc3Av?=
 =?utf-8?B?VXFOSjNYSHE5VzNsa3JMeC8yM0NxT08vblA2TWRVZUxLRVNmYkhCYSswTGpB?=
 =?utf-8?B?OWg4Z3Yvc2tWbnlWU0tPQk40UW1yQndzYTdqWWVpS0h2U2Zxd1FrZFVXbHlo?=
 =?utf-8?Q?DGFRZmpwFV34ekic=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bddb0c49-0644-47b1-2273-08de7b531fb7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:36:47.9373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1IIVDhMnmV2SdwKh9lnfpClkvZKtLqjCCekWK/76FpNL7a9gVDgSDmTQdGhu0pTmoPWg//4IEEMdee7yl1R0SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7639
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
X-Rspamd-Queue-Id: 3257621C866
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,collabora.com:email];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[collabora.com,lists.freedesktop.org,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 09:33:36PM -0800, Chia-I Wu wrote:
> On Thu, Mar 5, 2026 at 1:23 AM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > On Wed, 4 Mar 2026 14:51:39 -0800
> > Chia-I Wu <olvaffe@gmail.com> wrote:
> >
> > > Hi,
> > >
> > > Our system compositor (surfaceflinger on android) submits gpu jobs
> > > from a SCHED_FIFO thread to an RT gpu queue. However, because
> > > workqueue threads are SCHED_NORMAL, the scheduling latency from submit
> > > to run_job can sometimes cause frame misses. We are seeing this on
> > > panthor and xe, but the issue should be common to all drm_sched users.
> > >
> > > Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
> > > meet future android requirements). It seems either workqueue needs to
> > > gain RT support, or drm_sched needs to support kthread_worker.
> > >
> > > I know drm_sched switched from kthread_worker to workqueue for better
> > > scaling when xe was introduced.
> >
> > Actually, it went from a plain kthread with open-coded "work" support to
> > workqueues. The kthread_worker+kthread_work model looks closer to what
> > workqueues provide, so transitioning drivers to it shouldn't be too
> > hard. The scalability issue you mentioned (one thread per GPU context
> > doesn't scale) doesn't apply, because we can pretty easily share the
> > same kthread_worker for all drm_gpu_scheduler instances, just like we
> > can share the same workqueue for all drm_gpu_scheduler instances today.
> > Luckily, it seems that no one so far has been using
> > WQ_PERCPU-workqueues, so that's one less thing we need to worry about.
> > The last remaining drawback with a kthread_work[er] based solution is
> > the fact workqueues can adjust the number of worker threads on demand
> > based on the load. If we really need this flexibility (a non static
> > number of threads per-prio level per-driver), that's something we'll
> > have to add support for.
> Wait, I thought this was the exact scaling issue that workqueue solved
> for xe and panthor? We needed to execute run_jobs for N
> drm_gpu_scheduler instances, where N is in total control of the
> userspace. We didn't want to serialize the executions to a single
> thread.
> 

I honestly doubt more threads help here. In Xe, the time to push a job
(run_job) to the hardware is maybe 1µs. In Xe, individual workqueues
are mostly for our compute use cases, where we sometimes need to sleep
inside the work item and don’t want that sleep to interfere with other
clients. For 3D, I suspect we could use a shared workqueue (still with a
dedicated scheduler instance per user queue) among all clients and not
see a noticeable change in performance - it might actually be better. At
one point I converted Xe to do this, but I lost track of the patches in
the stack.

> Granted, panthor holds a lock in its run_job callback and does not
> benefit from a workqueue. I don't know how xe's run_job does though.
> 

We grab a shared mutex for the firmware queue push, but it is a very
tight path and likely within the window where the mutex is still
spinning.

> >
> > For Panthor, the way I see it, we could start with one thread per-group
> > priority, and then pick the worker thread to use at drm_sched_init()
> > based on the group prio. If we need something with a thread pool, then
> > drm_sched will have to know about those threads, and do some load
> > balancing when queueing the works...
> >
> > Note that someone at Collabora is working on dynamic context priority
> > support, meaning we'll have to be able to change the drm_gpu_scheduler
> > kthread_worker at runtime.
> >
> > TLDR; All of this is doable, but it's more work (for us, DRM devs) than
> > asking RT prio support to be added to workqueues.
> 
> It looks like WQ_RT was last brought up in
> 
>   https://lore.kernel.org/all/aPJdrqSiuijOcaPE@slm.duckdns.org/
> 

Tejun says hard no on WQ_RT.

> Maybe adding some form of bring-your-own-worker-pool support to
> workqueue will be acceptable?
>

Before doing anything too crazy, I think we should consider a direct
submit path, given that you’ve confirmed SurfaceFlinger does not have
input dependencies. I’m fairly close to having something I feel good
about posting. If you could test it out and report back, I think that
would be a good place to start — then we can duke it out among the
maintainers if this is acceptable.

Matt

> >
> > > But if drm_sched can support either
> > > workqueue or kthread_worker during drm_sched_init, drivers can
> > > selectively use kthread_worker only for RT gpu queues. And because
> > > drivers require CAP_SYS_NICE for RT gpu queues, this should not cause
> > > scaling issues.
> >
> > I think, whatever we choose to go for, we probably don't want to keep
> > both models around, because that's going to be a pain to maintain.
