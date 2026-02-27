Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCXRHiBcoWmDsQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 09:56:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FF41B4C6E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 09:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCCC10E1BF;
	Fri, 27 Feb 2026 08:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewtev+2I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AFF10E1BF;
 Fri, 27 Feb 2026 08:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772182556; x=1803718556;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TxyjVSSfgtnEa5/3BARNv2HqZ38879uP81q8/EFkOKk=;
 b=ewtev+2I6IMFj8UrmFjROcnAGXJNoZY0/koKnH9XcHX5y63Ko/je+Pxo
 bYSXGME9lU2yL+J9w1HG41CvbtxkVRHcw/INlqQjWQgxAurL7qM9hqGsq
 uvek+dnVKS102zRC3k3mJDnnLa5sQnBnCgkljsL7zKfR3B68NUUIjcnDh
 KuLNzo4Atuphx1oIu/pUK6Hpb8aLLBd7xGHAP9P/mTR1/6m6OKC4Hd3x3
 sttI/J2+l5yBmPUJ+rFqNMC2I2EmToiUOZ48eNqGE+Tq0KKHbvjvuluYM
 Gud7x9POGsor+/cEQgb1fY1gWs5mXTqvAKg892l23TjsSEu7oeuel3leZ Q==;
X-CSE-ConnectionGUID: Su+Qqlm2QHSuonL+xcQUrg==
X-CSE-MsgGUID: LZsN/HAsTKax4hf3vfqhyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="76871552"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="76871552"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:55:55 -0800
X-CSE-ConnectionGUID: gNp7nSFaT9e9lDxHiFxa4g==
X-CSE-MsgGUID: wQJTAwpFTu6TUByOmZ9nLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="215022147"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:55:55 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 00:55:54 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 00:55:54 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 00:55:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9fnycB0kEf1B17n2ai58nc+y5hTSjVXIpbg3t6pIG61Ntl7p2I4MIRXBZT3q4JV3iNkHgEZ8Z6Gd+GqT5QVSlYO8NVUUiWfM9Ck8bIChEYVPOcKu5AQTYmswnnwjBSfGVPhaZQ+TPQuTBX3o9wl947c3vrfCraVfGIyfzrS9uBZuEluJNr58tcAOBrvlg8/1mW4HzBhnxY/nMhZq9aFoScHAIey6Be/tVfgT5qhB2WgAw4cAXXmtVpJ867I592hnysduu6LAYgCkAQmUHKgPGbpNwF4RY8u79ecb+CWCRlDMoOGj+8YNHpExn/Rs39l3SWAo/0x7+xP0zf1Oxpnqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VL0Hvll2aEwFsT76NmZct9BqbIerT8wRq7h454Sq+7g=;
 b=MdYYQLS/ceNtHLlOsrO8oGmGi7zgCJm+sDikeOsuW9w8FF+QPK3rpPjqa99H+WW1Nex4I4+4xg280PDD1EcUSuQsqjUXAmrqwQYnOt74BA3Hn6caLcdLRcCgtHG7qMINYewmj1KneioDKmK8io4bFN7oG9ChEsQ6ySxav1b8yuYYlABYdhCQv4VYvvrnJGJXAIL7HMmkab2iWOLMq3iCvDkCp2NFmXYlRUr7S8G0y/d1xu71/cWn7oMPsrfp/4eEnQGZVRGdiOP1xpybeQFomS8delSa2WvUYK+0Shq3ns0szlJ2iyeUc4JWdXe5u+S8fQew5NPgKK4/I1Q83V21JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by DM4PR11MB6042.namprd11.prod.outlook.com (2603:10b6:8:61::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 08:55:50 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::804e:63d1:f2ce:7ce4]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::804e:63d1:f2ce:7ce4%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 08:55:49 +0000
Date: Fri, 27 Feb 2026 16:55:03 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <Alexander.Deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
CC: Luben Tuikov <luben.tuikov@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/scheduler: fix kernel-doc warning for
 drm_sched_job_done()
Message-ID: <aaFb555nr97Rgz5A@X299>
References: <20260227061052.1752354-1-yujie.liu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260227061052.1752354-1-yujie.liu@intel.com>
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|DM4PR11MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: a592c8c6-74c8-43e2-3459-08de75de0111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: SsTS1ErY0tf47HI05/9752syfjtvVoXRJ3frT2t5rnCZcVnFzHkVZqtqmeGkRvVqXw3mWCgIwx/dLtMx9kIDOCY8cNfXfUCjHuQLlcKz9JG3djxBvLb3UeHF4BUe306oe928jANBwtx1j43qKk3iBZfhy95AtPQ3DCfQRBz4e9BYoUHUt4wq1yC0nM4djF9ZWjt6OLAwX9KL2zQFfrWIPgKZP11lqamXXd7KZN4ozYLj4EFEPxZQC3O46tG6SspSK+sxZcaqEz9SV0N2gGHLyG6uqYz/s2asY8aOVZgtHBdbtKFYqbn7SJAAWHhCC7Mrr3agkFuclApRi1j02utnkyAPrKYtOIzqQOp1ouMjiGYNxBtgv3QwGLuJyvHcrj4/Ka29QvcHwxpQaPvaKGGH4xP1+pH85jlPsbZFNv02wqIE1/Ze87tc9kpXQ40KBXg/a/LrmCkPNGMeXZd3n4fRNpi6/1UOxe9p9CvvLYWKVrH8RqHOP86v+rXjsKN3uErmTa26e8pZa0Z5wYgS/FNRpIO38oj32xUzeCrJPt2iveeGFIcRFI9Fu7krNgvq18ijJ54hYNFrubSmNPO4sB97yHinfe/ZWitfVfaXosK4VkXbWfJtGG5Nxtju4uLA/7dlnhOPaC/wQ3gmBJ9HxUbHnXyJxyQeUGLRqMFgORQXXaDEtekbV1b1A7dHPssfCKeN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8393.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CUtFTR8Tq39rLdp4aftvNA/F72HvtcMWXa+u8NAMM+XeoeRhY2NwQ4WA18Gg?=
 =?us-ascii?Q?P5L5v1n2mPBOHtVVDjYZbiIujefCAO7UojzFOL9lA7H3mcU2UfVcJv/Dk5oL?=
 =?us-ascii?Q?h4sYLr14q3yq1y9uCdFpekaV3YxMk/wPvqw50zOREWfSKectal/OoKi+afiY?=
 =?us-ascii?Q?x/ujjXeaipvXFdR17ZFIE+gAkDwfY/fWdt3n9o8tQ6WBWu7UYSc3O55wndcJ?=
 =?us-ascii?Q?6eSAv51uO5PU1L8CId8ZL9LPymOEKnVBojVCaeGs+uHziImW0FLNuSMR1OHy?=
 =?us-ascii?Q?zH9NWUAXPON/pOi8mA0hOjfHbNradWRvGfxUKIup8os8hvBq2mYvIwpHuVqQ?=
 =?us-ascii?Q?hz8U5X44pUz9DT4wszeA5x1H84VWdYlfSqeQjtkV1n2iP2b0sU4IccS0ou96?=
 =?us-ascii?Q?HeXk4l/i4SiYHYqckOTD5hMBEBQhdYmbt5lxvCaUJxJyvz9EYB3veKo64QzS?=
 =?us-ascii?Q?WDSD8eChtarx0+jQ5lAxTpFel7mqjJHWvp0XUarAJXX3Jk2m3gcP+W0vxQlU?=
 =?us-ascii?Q?MdUcfCHTauXObN/sWon15OH/Gdt4QSOu8xMlRogoov0qTyGLmiMP/aMGjOL1?=
 =?us-ascii?Q?dsnrSTaBVsJ3QOyHvGD3fplwJhFocIqW7FsojByO86bD9nnbB+ftwbhxPuoE?=
 =?us-ascii?Q?hWUof9fpDi+y1OQyy3mmbTrJg5IJ/1tI64jG2lbSwRw4EQUV9AiTNOvPsQqz?=
 =?us-ascii?Q?D6SZQGoArezEys4pVMrYuKIyuDSpHC8Eqd9gTze95NUFY4fJxOwvVHya2sKK?=
 =?us-ascii?Q?EjLHVC62lFgx6go2pRScmE3Jbv5dZYh50t8UgY9cVhvCmPYs9KPNSngZsW6t?=
 =?us-ascii?Q?Pd20uYztXW5dZ2Z1OhVJ7CP6EuRq8Zgkfi0S//gD7TA2i28aciCrBnEvkg/D?=
 =?us-ascii?Q?5ysKV+iRJRZKIEheoU3SfCsfvUVy1FtFQSfw3z3Ee943H5rKBJY6MpXtVHU9?=
 =?us-ascii?Q?EwF4MoGKAz3RVOIvAUmPHEGj7fzk++r9ZrfnXKY6tGEET0/tHruMUIM3wO5J?=
 =?us-ascii?Q?YgEf6B+Lk2liJ7+ftMkKmlTd5m0ckoZ3NZ/vOwcodHhzHIBYJ16qayygpzSd?=
 =?us-ascii?Q?IdAKK5o6akXROoVNagSTyKitF2BBBR4pKNT/7RSaNsjwcI5nAZ/WIeeWAqwk?=
 =?us-ascii?Q?Oy9HQvjLhSAx573B9lE1RxQCr6YvjpURXgSObEcYn2ebWnKnpnIZFXeB5wKJ?=
 =?us-ascii?Q?zjSZ1d9ff08SJGnHBfaQwQMwDjiVGb0WwPaEaP/kBrJuwx0xIsuTKSk4LNEg?=
 =?us-ascii?Q?krobhy84t64rWOSiRJ4W6f4K25x9vXR/vK/xqXarRc4WqotKgXrZJIWUGVNF?=
 =?us-ascii?Q?8/zwqs4Qld73kbaDdkjDZvW1+WtYToGN7NP47vw+JJH/Jx3zshL4B5fSJJGn?=
 =?us-ascii?Q?mEe95M8MCeeKS5YtLiHVeZRx9YmGtOQBtfMrOJRmq155kg1UxkaTIZXVD7ru?=
 =?us-ascii?Q?qs2By8KPR+GEtLc/iV8jEVFdHxIN83zKnD7H7dtkeJWhAHKhcgsHstB347SQ?=
 =?us-ascii?Q?q6ciq8kkahv6kJ/cLX63qDU7fwq7NCIcsOrwiXnZw9JtkqRJkrsfLifJSlMF?=
 =?us-ascii?Q?ZtkR/CzweCOOL945+yXcW+y60EnNMCpuBBRpkdRWu0H0SlObH34ZL+EeEQvL?=
 =?us-ascii?Q?m7dOyR0Ms1r0nDgTXjLkyrb4tsCRsa6rCRe8QqFq1hj6iMKrKecdHXVT3RhQ?=
 =?us-ascii?Q?P2oljKrgKcjZR2kNAJEQ+rdJBAvJAA5PqLh/c8FcD+iS1OwSaZ6USwJQVQbJ?=
 =?us-ascii?Q?QEiwf3sCpg=3D=3D?=
X-Exchange-RoutingPolicyChecked: J08gZMB9K1QvV9C9k+HnZOso7chFAKdXgwyDNOR6q+1NK/6P2DHwzzaL8mZtfYnHjWk0QMTBwQnsFcUoxtb1q651nyo4IqtjqGq+oT5qgldWiztE0lVFfObReQHbedPiM5nmJWBjxcgxVFGaGr+CkFuIYxINfjehzQ9S4ylxr8e4saYlh1+PI7o9LkYLLRQDmb3VPFQOd4ShWzEaGfDAv+30E+PJ/p7aeOGYg70S9oa/H44AUDz9wLw1FYUE1HbMkl0xOH34GXs9jjnYNAu/5bQrAnJB678A7kgOd2NEM/43tjCBW+0VpN1leC+sptJjKz3rfD+S6kicIz2u8wSGxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a592c8c6-74c8-43e2-3459-08de75de0111
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 08:55:49.5836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v94MjVD1r8XTZYUdN5B97lFBC8z5QhETkpszOXOihTOU7YY3aW5nOshJQrKTkFpkr3uAyISdPjamFCmCj2n/vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6042
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
X-Spamd-Result: default: False [0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,patchwork.freedesktop.org:url];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yujie.liu@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A9FF41B4C6E
X-Rspamd-Action: no action

Sorry, please ignore this and see the updated v3 at [1].

[1] https://patchwork.freedesktop.org/patch/msgid/20260227082452.1802922-1-yujie.liu@intel.com

On Fri, Feb 27, 2026 at 02:10:52PM +0800, Yujie Liu wrote:
> Warning: drivers/gpu/drm/scheduler/sched_main.c:367 function parameter 'result' not described in 'drm_sched_job_done'
> 
> Fixes: 539f9ee4b52a ("drm/scheduler: properly forward fence errors")
> Signed-off-by: Yujie Liu <yujie.liu@intel.com>
> ---
> Changes in v2:
> - Split from the original patch set
>   https://lore.kernel.org/all/20260226030038.1182961-1-yujie.liu@intel.com/
> - Rebase onto latest drm-tip
> 
>  drivers/gpu/drm/scheduler/sched_main.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index e6ee35406165..fe4c1017734b 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -361,6 +361,7 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
>  /**
>   * drm_sched_job_done - complete a job
>   * @s_job: pointer to the job which is done
> + * @result: 0 on success; -errno on failure
>   *
>   * Finish the job's fence and resubmit the work items.
>   */
> 
> base-commit: 1abdcb654ffbb08bbc96a9806fee60ef65fdad77
> -- 
> 2.43.0
> 
