Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 423A1BE1C4A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E5C10E961;
	Thu, 16 Oct 2025 06:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AK8mhZ3n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E859A10E961
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760596651; x=1792132651;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HcxLJw6fKDEpqEy4yfajzTbsQy1M8YOBmRtLPTOAGuo=;
 b=AK8mhZ3nwAQxkXVWjf/2Sruck/EQijjMJe+GwzGhLRyR3g0MQCMZ6Gp2
 UkUh+HScNN3fh/LuUrro/mjK1d4ae+oKjcXz045d0gkYblbFR5MDGcWNt
 UdzGWbKCo1UI8QePxEInAsD9RrKr7QQ+D+zkwW/rZ6GYZwejzan1LvSRe
 3qqV8chdRjUp1vbSpdzPu9Lbs55POo7eJrOqgp3SXmmKnhUWEDTC1eS5j
 oZ9/DDFPFdUekEx5XHNoUTQT45TlHF7UDkH1X4Mp2oGDm/nuOIOAOszuY
 rDtwSG0rHVqa7uljs7XAQnhPQt9rD/Rokl5JwGr+yaZKoybKbkU5u/RrO A==;
X-CSE-ConnectionGUID: 4vodqkMlQWWLfJniAbtvTA==
X-CSE-MsgGUID: uufwUfGcSVCwS+oirqmODg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="74227610"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="74227610"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 23:37:30 -0700
X-CSE-ConnectionGUID: WnIUyATNQW660qkkNwfn1g==
X-CSE-MsgGUID: WFpyX6cySTmXV1eBQgcYOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="187655568"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 23:37:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 23:37:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 23:37:29 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 23:37:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqNGf6p3V6honOk00rs1jgP/5c2cGZEm9akupIdDz1c7cCkebLDbz+Q1mpoY6slT+PUdvy+eNEhoChBsSQN16Q4RGFk9yxbo0z4WJ4ELhZp8pOwcPB5GnbtX47zgv69ah6nhnrrjpzciK12W5Sp7x6ucQDK9IB4FyEwsw80cyQmnTAkGYVBJPl5G04dKnbxeW/3XfB0JmQ5KF7T6puXGOW53idg71FG4tiPaeP8QKJRFheT7gx106nCiszS0S+K2lqH/kA9hsI59qPN0PiTdl/xZD6d4fAQmL6xzUy9OtHgNfD/SyJfdX/EDSKPvtDY4z+CeV/LjgF3W6kEgEzdydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etWOVCdGQCw5qOSFExZY3swAG5xpJbu27qqXvU2TD3k=;
 b=LerBFfCWOLMESnEcMJ9ch9oYkN3Iw2Oe2s2wU2l+mj9wiIEF/jzeJK7HZHjPfIJ5Pju2+ung/xjJrW9QF35hHL956CpFPmdGj4AR0mFKOZUqtvOwcwKCnWQ79psBmBixEHEbEysh34S66MlYPZ6TBAEIxPiC++iXuzFt/Ad2BbNhjZRehFRjkEUKcFaH79Rt2gFkDfpXtH/dKXw4AuI5lUChbpTFTCLTbrf83c/dqFrC22f8DJoTQNVUW6ahkSwzUAWVAvMAVW3xhOlKAd3DQBLpDI6Oez6bTSxwX9uCDDlc2Y1tWiNw33c78keNfg3XsGKWKgk+JM9kvIi2eHrE9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DM3PR11MB8714.namprd11.prod.outlook.com (2603:10b6:0:b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.11; Thu, 16 Oct 2025 06:37:26 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 06:37:26 +0000
Date: Thu, 16 Oct 2025 09:36:58 +0300
From: Imre Deak <imre.deak@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 05/16] drm/dp_mst: Switch private_obj initialization to
 reset
Message-ID: <aPCSijktaEguA_nA@ideak-desk>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-5-805ab43ae65a@kernel.org>
 <aOZv88NgbjmT49N1@intel.com> <aOaQLx-7EpsHRwkH@ideak-desk>
 <hzj77xgrwfcsv5zsuknazt3kgdctvtho7wgagu5bonq2nfwb2l@rubsf75usj46>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hzj77xgrwfcsv5zsuknazt3kgdctvtho7wgagu5bonq2nfwb2l@rubsf75usj46>
X-ClientProxiedBy: DUZP191CA0061.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::16) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DM3PR11MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ab71120-e630-4878-97b9-08de0c7e788e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HG1ySC0bFWYiAPWVYAZwYnb9kVetdEx0VBJrLpzHzw0pRIYR8ofDmgJotS?=
 =?iso-8859-1?Q?k2ZdSb8wXcy94I8cVsoksUeiIgJD8AfqKIRBToaVJYq3VQTqlkwfR8TBbs?=
 =?iso-8859-1?Q?9rEVCL4fyS3CtDeQ8jI+HI7Sa45X3Ehdaycvcf0Xbay7hrbdSxxJgBTuUK?=
 =?iso-8859-1?Q?+DgWUhGnR7dPzm1b0m9gHij+Ovs5sSJLYrPb2sA8zn+RUv28LBXwKr7vMw?=
 =?iso-8859-1?Q?VfPPyXikhVTI0U/Epyb/OCE+/aOWB9Kmqx8rDEgZt4bPiJ3NJzVcZJID47?=
 =?iso-8859-1?Q?R+9LIgd4vZMBCIzYQbXzfFOFnOUCSxTu7iLXnLmIEThdwDHhTjNU/Q2crf?=
 =?iso-8859-1?Q?kW4E966wYOHsP7H9FNFB5v9MbXcTHcxpHH+8zznGnQGd/QyzC4Pyw92cKN?=
 =?iso-8859-1?Q?gEj1VWQqnlQmCRKP6jBSuxj9kiRFBQ7D7EYz0IH/4uqEllgudUAVWy+CmH?=
 =?iso-8859-1?Q?0P/u4Rx2aIGwvL9egIKtlB4k3hrJXybt0qL4T/fuBuokUZMJx5suvPZ2Uo?=
 =?iso-8859-1?Q?+MRF2DCo6SrGCPmMps1Z+KKHF+2Mj4hA8bCLiVVB5G2pvr04ZFcMVc1jO5?=
 =?iso-8859-1?Q?sVmD97rR/R64yz0p3p/IZ/UF6S8Lvq4Vfcr8P5G9ltMvuLp0wnX7K7Nmpk?=
 =?iso-8859-1?Q?SGXI6Vaq7/iQZotJOm2Kw1AwsrbFN8PIzVsa3m4RnPNXdWdi0YB2w2Yp8A?=
 =?iso-8859-1?Q?QTEP3tGOng+BRIORRhQCGcU050jb6UyYpW92bpYCxKhWYAU66wP7zAobTK?=
 =?iso-8859-1?Q?344hgtuyXuqtGK6lMEETEvwsfrbbPCw+hDTIlBBZIe1DnIZJO04Fe92N0V?=
 =?iso-8859-1?Q?V0tbh5oYrsW7ztZ95ih6r/nDM+aNzipxmZLRCTgNmD4EoRKbpKbXlQ49cY?=
 =?iso-8859-1?Q?39zgIsyobOIbnz3QZoFed2gjeWZ4nrbBbn+1ImEPT5F4Os9o/hJnxlAqot?=
 =?iso-8859-1?Q?vSdy50zjtu5Itsa6Xemp/aUzSD2dPfJSaRCxO+gv1bHKd/mzZVdWLu2s11?=
 =?iso-8859-1?Q?iOMyWcgasb4/wWMe3OnSbwUEsd+AE1ynfOLqQ/9cqk9uMjYUEfaMgHyqoO?=
 =?iso-8859-1?Q?YPtdDZpYOZ6Hllzm4AK19pR4CiAXb8mphRvKzA3bg5EUa/9ZcmXZcEd6HY?=
 =?iso-8859-1?Q?f/8gyrp6NuxBdTOtTA2+pxGDwELrM/rdQrPP/Xjx/5t/L8oOBU/ly9OCLW?=
 =?iso-8859-1?Q?qW72aBfxWAFErmZZ4WwqIorDOPV+UxNrzReddLiXqn2hEwcrmhdr3hk6cW?=
 =?iso-8859-1?Q?itC/9DVXoAqd0F3GA0dYwn/2dePBbY4NizuRrC/iDcCrhC0X9sYB4/nuZB?=
 =?iso-8859-1?Q?lyE3cRqd9XlypnSflxKifGQH3k1LevYNhEiBkY9WtBFdfxWfcZ1C5RpaFf?=
 =?iso-8859-1?Q?0T40p1Qksi+WeJaWtBk6CS4iiqiFA7sqkVKsKEK7sN8FFzDc0QkTdMU9OQ?=
 =?iso-8859-1?Q?4MiqbqaR5aSs+lsU7uELOYpwYJwPoYW1CrG1PwdlO++uS0fIko43k7fox8?=
 =?iso-8859-1?Q?nBq/4oB4Np2BKmPQjiN4N1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NBgIugLklwcR00ApH7VzMC44bG+FTQZIlDPsBHhE8FzznFIepXGdOkc1Ko?=
 =?iso-8859-1?Q?y72vuVvB3SqTL+M9UClf/r3tFqEKuvIlnRk1FD+0gXPgjouyZgSq2004C5?=
 =?iso-8859-1?Q?pF82UhE+9C9Xlo1O04ujXhW6zZ0YtMVBW7CIaomjFZf1ZUVNwUILntZF4+?=
 =?iso-8859-1?Q?14jNRByiHDyHl9oRXSOBHCh9tNfARZM0+HKKYuNJKY6A3O5Ra/06EISQxr?=
 =?iso-8859-1?Q?nSzldqkAvZUr8OcKAfD3f/d7Bj0SBr6csTmnLgL9Oq84ATdYHruzUcfwrs?=
 =?iso-8859-1?Q?npat3dfPBZwORyS1gSXB/KGCCX9K8GYiCyn2QsKfQ8LyFsWqhzhAVHxHT3?=
 =?iso-8859-1?Q?unR3zhs6VTiZXZhCklaosEi3w7MrMwKuDB7IXkpCiU03DOChtntPrT3yux?=
 =?iso-8859-1?Q?YGibW+uNzJLckUhwC6QPE8l50sAj3xT2h69sOHZfubnoi1TS5VbYIBlX2V?=
 =?iso-8859-1?Q?pZ9UV8hZjvWM80QN9FASy6EuxL2gJqrwmFJVRsiHNd4bjaaT0rfkcGvO36?=
 =?iso-8859-1?Q?8fuWxlNsUhg/euPqMA7lJ8Uy0nVUzzHLkHbeJGR4oOgkxQWd5zpPnV7+4B?=
 =?iso-8859-1?Q?+1iHm8ZTquXj3Dv8UhxRA0QFM8xBmCKnOfJ+SDLMFMJWkPmxtwTSyyogJf?=
 =?iso-8859-1?Q?R9FZ9L5A5HuEkqMOFdPuclKynF/CoaZZN/aAC7O/aqsfvj1SB5kOQ9Y39V?=
 =?iso-8859-1?Q?GGn7mXDiEVHmD6LQImnk0z3GgRUAhgvKPus4VpJoXF+/bFM+mYcOARcOO4?=
 =?iso-8859-1?Q?hQVkJJkh9VMZ+Ie1r9M0oK+c9biWNMVarEy4IumBRT5CRMvq6rYCAWs3D2?=
 =?iso-8859-1?Q?W6AYr42cPI+YPFRiigDN5zHEbFCE5EY0vT/f9AoBl5HiI6HZLtTJgGPQgA?=
 =?iso-8859-1?Q?w57OGBHRnKmNmFfZgpsKazb4ltaaM2Z1O3gWT5mYIC99peTlpdwCwdfLqK?=
 =?iso-8859-1?Q?HfhjC7GWDzAqmHcJyxlMM58GOD9gP8CtzgjbKUYegdqoAKfO+mJgDw2EQU?=
 =?iso-8859-1?Q?GFD+VESpEr5MILcgVxW8Kt6OcYAGc/iuAGPpLS5TDV0oemmuRyTXYFgEyk?=
 =?iso-8859-1?Q?ezMoiTXtUx59Wnwu3waYoA0aEFKrbBBXhC/1NYdUMvK1XMjQxDbppAjqGT?=
 =?iso-8859-1?Q?3J7mqUkKIM1G2lK4SIsyH9Ru3ayLGKkUPPTYQGOmQI0onj9Z2yI68jQEJs?=
 =?iso-8859-1?Q?/Z1M5EcM0pjQdYs7seizcnvZWwOW9JyHcT5Xykd3xeCYWS1DaLB5wM5ClP?=
 =?iso-8859-1?Q?uOpNomLZFvnhKdOJZxsGBFlsdTkBC5xi4tn/em9QV2KPUz2VN+jm9u6Ioq?=
 =?iso-8859-1?Q?xmHbk/I3jYeWxvAY1NneF6baqARz0b5P9FZ7E1wOCJzRyS+cbBmQZPnRaT?=
 =?iso-8859-1?Q?BPT81UGhc9jml5s04unxdHROTAMJKanWhg/eSEniLQJf4MMV7n2yUv6hpD?=
 =?iso-8859-1?Q?xCp94mvieARegNE5GBvNfWzQZ6srk7tO27dbOMm/wCgwYZrpN8fivT4j2V?=
 =?iso-8859-1?Q?cw1rHtskllpzC8+L30fFaWMCXJqFc16sVFoaAvU3bQENjRpkw6RXZe27R7?=
 =?iso-8859-1?Q?tGEiZvaeDa95mnFmFb7jujp4pGbl6FMzD1yBD25q9ujyHpKAe8mlWDUSKm?=
 =?iso-8859-1?Q?uKCzMVqPnNkyx1hB7i0efIXNi6uie9NLp3UdxmFAm4c2lEviJnpW/ynypM?=
 =?iso-8859-1?Q?1/cdYIqKsh+wph39kJN7DRJl37TQEPfe01XtWjKW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab71120-e630-4878-97b9-08de0c7e788e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:37:26.4693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUKe8H7cxamuj16hknyTom8XVdhjS0xxcvgNLhjTAyC+QXDEkplpgK8pFO0dwRS7aqQPQcy6hiIeUzn9xHLtgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8714
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 15, 2025 at 01:35:47AM +0300, Dmitry Baryshkov wrote:
> On Wed, Oct 08, 2025 at 07:24:15PM +0300, Imre Deak wrote:
> > On Wed, Oct 08, 2025 at 05:06:43PM +0300, Ville Syrjälä wrote:
> > > On Wed, Oct 08, 2025 at 02:04:03PM +0200, Maxime Ripard wrote:
> > > > The DP MST implementation relies on a drm_private_obj, that is
> > > > initialized by allocating and initializing a state, and then passing it
> > > > to drm_private_obj_init.
> > > > 
> > > > Since we're gradually moving away from that pattern to the more
> > > > established one relying on a reset implementation, let's migrate this
> > > > instance to the new pattern.
> > > > 
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > ---
> > > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 39 ++++++++++++++++++---------
> > > >  1 file changed, 26 insertions(+), 13 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > index 64e5c176d5cce9df9314f77a0b4c97662c30c070..255fbdcea9f0b6376d15439e3da1dc02be472a20 100644
> > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > @@ -5181,10 +5181,34 @@ static void drm_dp_mst_destroy_state(struct drm_private_obj *obj,
> > > >  
> > > >  	kfree(mst_state->commit_deps);
> > > >  	kfree(mst_state);
> > > >  }
> > > >  
> > > > +static void drm_dp_mst_reset(struct drm_private_obj *obj)
> > > > +{
> > > > +	struct drm_dp_mst_topology_mgr *mgr =
> > > > +		to_dp_mst_topology_mgr(obj);
> > > > +	struct drm_dp_mst_topology_state *mst_state;
> > > > +
> > > > +	if (obj->state) {
> > > > +		drm_dp_mst_destroy_state(obj, obj->state);
> > > > +		obj->state = NULL;
> > > 
> > > I'm not a big fan of this "free+reallocate without any way to handle
> > > failures" pattern.
> > > 
> > > Currently i915 does not do any of this, and so there are no unhandled
> > > points of failure. But the mst and tunneling changes here force it
> > > on i915 as well.
> > > 
> > > I think for the common things it would be nicer to just implement
> > > the reset as just that "a reset of the current state", and leave
> > > the "let's play fast and loose with kmalloc() failures" to the
> > > drivers that want it.
> > > 
> > > That said I haven't even thought through whether this mst and
> > > tunneling state reset might have some undesired side effects
> > > since we previously did none of it. I suspect it should be fine,
> > > but at least the mst code does some questionable things with
> > > the state so not 100% sure.
> > > 
> > > Imre, do you recall if we might somehow depend on preserving
> > > the state across drm_mode_config_reset()?
> > 
> > Yes, the stream payload info in the MST state and the stream BW info in
> > the tunnel state is computed for the active streams (i.e. CRTCs) before
> > suspend and this info is reused after resume. These active streams must
> > be restored to their pre-suspend state after resume, which will need the
> > above payload/BW info.
> > 
> > The restore should happen without recomputing the state for CRTCs, so
> > the payload/BW info should be also preserved across suspend/resume.
> > 
> > crtc/plane/connector objects which have the reset semantic added now in
> > this patch for private objects do preserve their state across
> > suspend/resume, see drm_atomic_helper_duplicate_state() and
> > drm_atomic_helper_commit_duplicated_state().
> 
> Doesn't this mean that we should implement handling of private objects
> in those functions too? E.g. we track resource allocation in the private
> object. It should also be restored to exactly the same state as it was
> before suspend.

Yes, I think so. Ville mentioned that someone has sent already patches
to that extent. Note that, things also do work atm without the
save/restore for the mst, tunnel private objects, at least for i915,
since everything does get recomputed during resume: the effectively
reset/zeroed private object state (due to the last disabling modeset
during suspend) will get recomputed from other states (crtc state, sink
capabilities) during resume. However this dependency on the other states
should be removed eventually and then saving/restoring the private obj
state would be required.

> -- 
> With best wishes
> Dmitry
