Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 043898CB189
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 17:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506B810E0DC;
	Tue, 21 May 2024 15:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DLvqoX2j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B8510EC93;
 Tue, 21 May 2024 15:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716306014; x=1747842014;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Jx8aDUpQ4VhwPLI+ymdqUDcDYeC4hny/+Y/v7fGcl5c=;
 b=DLvqoX2jBEvRzeBP0cU1brjGyMw2K7a2m/2hXxb3DIRDbtw7f+ra3jz9
 DGZhO3iNJJe+SEP+xBvIiKb8MgsqyrKqPYG54a+AXAzIAOsbg+5fWJq5N
 sZc/2Hdv5RM5Zhvv56aWIa6DZBgKRuK73r/0yDz9pok3xjDtKKTjfxeOY
 HmE2pVJB7uDbm0WtrwvJI2/H4i0DgBY1FYyfnd+aCRJ47watwyF36sfZZ
 Usg/4ZA9uI8X0XZo8uvFBqK6Ea5HSNUXwOPEJfNTbq4qmGo4hiDETAhY/
 JbaHC8aO/srtL1x36JslmMiXWdtkOYRVt8chPsMcsEYpYaObptppnHMwU w==;
X-CSE-ConnectionGUID: iZ2JXoytRviPDNrUiauKlQ==
X-CSE-MsgGUID: 7qgMwyW+QyyHw0N4u13Oeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12300566"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12300566"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 08:39:49 -0700
X-CSE-ConnectionGUID: T/yXTMQOSJiAl5eB+8rUYQ==
X-CSE-MsgGUID: HedUeAFOR7yz7OUvf6Z9Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="56188302"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 08:39:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:39:49 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:39:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 08:39:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 08:39:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNp7d0A/rhEf0ZclyBczLhTXgHtkI5Z5rR5zPyslhtal5rLJqMtw9e5AOeVXpFphSBTuRD15+xbkF3xoCd3XmXQsJc2+rpBbpdJbzGP0658ymD64H+JXZ/+4T8LqklgdK/jZEBzPUAT6aJ7l7AEW3ypSrgrcQurFG4d/LKOp5fe1vr8RQztGpj4rW4XovBcdRS+S3h1d+nenUHm2lFCsIiurnP43mz0zEycQ/+eMWaX1oj40SdYcYpwG3cBBMEDKcJRtmdrMLIzGSHhA+RAZT8Brd8FcHKzPEV4/Fkb5TBZY99CJNwqR2ujw60rrWM0CNk8esmwmK4LTDgMzjd+GRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DH94hUxiRQqZDNz1ycGDTaGkXqffBmGkmos3S8y20Wo=;
 b=D3dAig7FjmJ+Q92BapRmjxMjs47g/bAxrgStXgKVyR306o4KsmmAqLm0d/Nv0Ehh76LcAXOQF8OYUQyyQ9UiauPbYCQDceLff2zx0YEdbFysdBxyxY4PYDHO/gPsqXh53OnGrCieBJ6hz8Cbl02IxFxhZ9tRQ62egJeloeuCvhP+lo+uCDIAl0+4sk0VsnDrOiPkqrpmNmf719eBaxFJjXy5No5G9VwRgTALUBJQqOCa0BdT7O447ELS01v/E2copAmbUagqFNejJ6xYTKEH12tSleZWENGyAMDkjKKYXRe2QQHsdnZYMMdUsBk5V8WsCOBVXoH+kootKS7LVzGAeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB6369.namprd11.prod.outlook.com (2603:10b6:208:3af::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 15:39:46 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 15:39:46 +0000
Date: Tue, 21 May 2024 15:39:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 02/21] drm/ttm: Slightly clean up LRU list iteration
Message-ID: <ZkzAKC1khD2znv7H@DUT025-TGLU.fm.intel.com>
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
 <20240521071639.77614-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240521071639.77614-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::9) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB6369:EE_
X-MS-Office365-Filtering-Correlation-Id: 38b8f410-e318-422b-58c2-08dc79ac3e06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?hKNe332AOi0RkZsqWen/oGRWh0hvRlRtA3gXwrDle3FNl2nwKrllbhxIuW?=
 =?iso-8859-1?Q?e+7R4j+pLD1NwphBPhj3SKpI6Gy9M0y0LwDeubz+mzrrckfzhA0Ioo+ojz?=
 =?iso-8859-1?Q?nfO0/SDzXU2N2rlbVbdd6hT8K3AG9ibE2pAcjMcA1J0vOqqWCi+Jipf54p?=
 =?iso-8859-1?Q?cGA4MwAtwzT3WnSb5aL4PiAtBxD0K7qBuQyyliAHxVyVK3HhFkHPf2mqbJ?=
 =?iso-8859-1?Q?npJ06KIlV3T+wjYBYgxXIsfhSemsxVGzPTTTmJq+cVHiOd7muWyqh+XCgK?=
 =?iso-8859-1?Q?S1CdkP7DdDvGTp2CFYVkgYO30FfThMWPhqy0bHGNDWf17K2qC7/aVicvsa?=
 =?iso-8859-1?Q?5Fw4hxQCVjN76zK0HSaRx08rjVWtB7fDDVCCDgDBCoEh9kjdqxmMOyv0nb?=
 =?iso-8859-1?Q?sIc5CQydZAE2FqR4gtrwQaRaPXkNFlVTExcCNfj0EwFuESzGOcM7bmdYK4?=
 =?iso-8859-1?Q?AOLYnrednCdMTZYMtDplB0jQrAkiM2g7Fshft0CrnmhXawM5WIIBVVNpLj?=
 =?iso-8859-1?Q?uL1TAiHg0ocIExlIXXvVZ4MpIq+FmBBXnVkYMdrTxBGdvXvdxJk8UEJjn4?=
 =?iso-8859-1?Q?IDKhG/YwwCARj7O9zrkiM9KOI7a67Vbm0YB1GHKXg+HGUSWuCu28OB5/GH?=
 =?iso-8859-1?Q?eSXr9ex0hvZ+HgZeJofR0MhUkySmCwTuqmF1owdzjOOnv1ZV4HJQsFa/ln?=
 =?iso-8859-1?Q?hXPCeeO3ZJM7nT00Bj/FBb9Qwcb/pdJxWJ37R9DhTqckJV5xCILjJP6Fr0?=
 =?iso-8859-1?Q?jXWL7DLFT/KNUSU/LlcU91lR8/3cb8GtdkDTk0Yl7IB15xjT5xgwTbZWWT?=
 =?iso-8859-1?Q?FgLTKAOkO4IZudedMfAtIOCSo3jFZRIvBr3UVM9WkjCiqqDVgiqnYiZ3FQ?=
 =?iso-8859-1?Q?eBHAGUAYEefnI3BpLrgFnwRGZGMizmGdBZE/Ak4t9xtGMJwHFyLohyN68T?=
 =?iso-8859-1?Q?2R7BnRIwIHjHOB43nYMvGHXLzIch6rdppqSpPj9s5eiu20423CCwfsAPtA?=
 =?iso-8859-1?Q?n7zrBWbSybOWMuQY7ZGuFxogWH9zCcG2VqBQ4PdUuuFW09ANKHa4xsH8z7?=
 =?iso-8859-1?Q?mtob4zjR9xPM2PoBLRWb3bZHjz5/x04SMIhm6vVOoSkJ48dzJUeyjx1siN?=
 =?iso-8859-1?Q?Px/ClRldQb9jgrvFLpijJZ8heWPJrw5fHiOd1LMccDpMa7EUOyxSRbuPNP?=
 =?iso-8859-1?Q?DtbTJIHx2OW/fwOQc9xuX3R3r+G1KTYiv4BIFeRt6IfaqgqTgmQCR9SaBi?=
 =?iso-8859-1?Q?lql3XYXbVwnPtpD4HR5C2W6HoNOh9PmTIBpVDNz49grq8vSAhGbK8vHnNV?=
 =?iso-8859-1?Q?g6HQ8sGp+1vvzxqRQtUoScKKpQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yObLq033TKt/4w62H0bXfoOHTDS5lj4D4OCvkHYuc/yzylTHICPpH0lpTx?=
 =?iso-8859-1?Q?WxNFE9E5XrS3gEYXZeuKGchcldZu0EH7whbgJ5Eq/7xKTEEUjA+ZSELZR7?=
 =?iso-8859-1?Q?5z16I5aGpnBFECPIP5OHt9DjWrfF7S0Apada/jkiFLS5HkZ4qPtJRw0jBw?=
 =?iso-8859-1?Q?HWDUjasvE3DOaHAgfjo1E91yGzsolLGziFOLSKuYmRTwjCLypsyazBwqeq?=
 =?iso-8859-1?Q?soNY26B1tOEBmmED3LD/fs61iyohD/KKcYDzL5SknsC1EYAM08BI6BGKF9?=
 =?iso-8859-1?Q?VEFzn/7fe0c0Bd3JjdhaE0+4lDl+h5JiRN7GtEqZUXrqyaRBGOliwkZCRs?=
 =?iso-8859-1?Q?0edygl/yju8HmoUkRvPBTt8P7oSMR2qAvf64gO02RV3+Z23Z+KYiUxMwSs?=
 =?iso-8859-1?Q?plAhMXlt9pln/NsmeL2bAM/IdXqaOVd4Dqdw5nY8PDywA9ydOlBFwgGhns?=
 =?iso-8859-1?Q?l0pfUV1TSAui8la0dDQ4dSwB/Uqukc7ou5OQaEMu225eaZVozbQ9DvoIoh?=
 =?iso-8859-1?Q?q5EMcoAaB6Eh0YW1YAewAyEBIJKjoE4yYmneth33RRq2rj5uT2tNy0GZ1p?=
 =?iso-8859-1?Q?MPYex6lB3lllf+4UXwDGFh/46ME5laYwfOryx5wEB5x0hRqXORgA2Gdg51?=
 =?iso-8859-1?Q?UkTle+qlQvt7h6ZzZNoHszt9zHF5nfCax19JJguLePRh0Iv5Z0KaZ2bN0d?=
 =?iso-8859-1?Q?bKPXwoBbH+70ARE396AR9GtyUYJddJKqMecLHzWeV55oIKBvBHFm5WLxuR?=
 =?iso-8859-1?Q?ahHzMgwCXH7WHEahIwMoeRtldn9U4bmwfqDGa4C8tI6C+qNLY+FlL/FBZw?=
 =?iso-8859-1?Q?QnZXE9rl7VG8Sc1XkwVfVsmHiloiyXwkXjPJepUtYKfSbAehMR7eaOvFud?=
 =?iso-8859-1?Q?nFw7hCr0huI89JpRqVRKkaWoTXq115TFG39DuuGK9WF5ksdrDWLc+M34r2?=
 =?iso-8859-1?Q?exXpllp1YwBlUTR/PNB/lkHIHaeTI2PWsSmbvSoYkaTXVmkuF6Rj+6wtvz?=
 =?iso-8859-1?Q?js4q4bw9040haC5tIjVrWiLavVEqRAJoTTIUqmYwIv3a4337fekQ5Fk7C5?=
 =?iso-8859-1?Q?YtNRHN/JTsviJGyPeIaaLCww4EbWe1x6Lx6InT/iFpAEIviGFZDFGi8LLm?=
 =?iso-8859-1?Q?dn/9dbT3yrUbZWKal3YFX8WekWR+IC+k6pLlLrP933ZoPJwtyx3BpGpHXw?=
 =?iso-8859-1?Q?E8mjsWai6Wz6fdC2q2Ta9r3NngfWv/eEUCXxU47uUsOe+3kmJlujvPXvzC?=
 =?iso-8859-1?Q?mlDKHozYK4aDEzE0wT+i9ex8KU+n5FJEmzz7Sh0/rJ7Ddy95isyQNNXQrs?=
 =?iso-8859-1?Q?+PHQIuDvY49/ePgelnxWkyG738CNPsfIHNxmSNL5IHx0YkR391ysDDVHQV?=
 =?iso-8859-1?Q?IwSTJk/eiBOk5hpO0LBhFYJc5oAzxRFNrtLo9mAspThy8cPLzGUVPV8IHe?=
 =?iso-8859-1?Q?86GE/x7lnmVvzAwN/CNiZKYliue7N8JFMYdTB6Vu31lmpxwUn7xlpAqbRD?=
 =?iso-8859-1?Q?8QxXYMF3ezV60NUWBYMyEzc3ezoFuz66Jx513l9moYd8r87WMeRkMWqpzI?=
 =?iso-8859-1?Q?iW5B3PbetMCp5dUy6heDAG3H/VPcCdv8hifCAGYQWmFmUjptIvC0Z31tDC?=
 =?iso-8859-1?Q?qf5E3X5jIJ22wesQm0tJa+tR2FaJ2BbNF1A2HzHzWwGzPsTkW1he9ecA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b8f410-e318-422b-58c2-08dc79ac3e06
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 15:39:46.3721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLUiIC6hbf/E1xHPFQ+oEShh6iTusMXYGqL48Ri76iQuPK5WrP4M+UyUHtvnpxxLEsKwBL4T96BDOBjJbXqCNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6369
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

On Tue, May 21, 2024 at 09:16:20AM +0200, Thomas Hellström wrote:
> To make the transition to using lru hitches easier,
> simplify the ttm_resource_manager_next() interface to only take
> the cursor and reuse ttm_resource_manager_next() functionality
> from ttm_resource_manager_first().
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_resource.c | 48 +++++++++++++-----------------
>  include/drm/ttm/ttm_resource.h     | 10 ++++---
>  2 files changed, 27 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index db9a7a3717c4..8bfbddddc0e8 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -496,50 +496,44 @@ struct ttm_resource *
>  ttm_resource_manager_first(struct ttm_resource_manager *man,
>  			   struct ttm_resource_cursor *cursor)
>  {
> -	struct ttm_lru_item *lru;
> -
>  	lockdep_assert_held(&man->bdev->lru_lock);
>  
> -	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
> -	     ++cursor->priority)
> -		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
> -			if (ttm_lru_item_is_res(lru))
> -				return ttm_lru_item_to_res(lru);
> -		}
> -
> -	return NULL;
> +	cursor->priority = 0;
> +	cursor->man = man;
> +	cursor->cur = &man->lru[cursor->priority];
> +	return ttm_resource_manager_next(cursor);
>  }
>  
>  /**
>   * ttm_resource_manager_next
>   *
> - * @man: resource manager to iterate over
>   * @cursor: cursor to record the position
> - * @res: the current resource pointer
>   *
> - * Returns the next resource from the resource manager.
> + * Return: the next resource from the resource manager.
>   */
>  struct ttm_resource *
> -ttm_resource_manager_next(struct ttm_resource_manager *man,
> -			  struct ttm_resource_cursor *cursor,
> -			  struct ttm_resource *res)
> +ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>  {
> -	struct ttm_lru_item *lru = &res->lru;
> +	struct ttm_resource_manager *man = cursor->man;
> +	struct ttm_lru_item *lru;
>  
>  	lockdep_assert_held(&man->bdev->lru_lock);
>  
> -	list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
> -		if (ttm_lru_item_is_res(lru))
> -			return ttm_lru_item_to_res(lru);
> -	}
> -
> -	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
> -	     ++cursor->priority)
> -		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
> -			if (ttm_lru_item_is_res(lru))
> -				ttm_lru_item_to_res(lru);
> +	for (;;) {
> +		lru = list_entry(cursor->cur, typeof(*lru), link);
> +		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
> +			if (ttm_lru_item_is_res(lru)) {
> +				cursor->cur = &lru->link;
> +				return ttm_lru_item_to_res(lru);
> +			}
>  		}
>  
> +		if (++cursor->priority >= TTM_MAX_BO_PRIORITY)
> +			break;
> +
> +		cursor->cur = &man->lru[cursor->priority];
> +	}
> +
>  	return NULL;
>  }
>  
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 1511d91e290d..7d81fd5b5b83 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -272,11 +272,15 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
>  /**
>   * struct ttm_resource_cursor
>   *
> + * @man: The resource manager currently being iterated over.
> + * @cur: The list head the cursor currently points to.
>   * @priority: the current priority
>   *
>   * Cursor to iterate over the resources in a manager.
>   */
>  struct ttm_resource_cursor {
> +	struct ttm_resource_manager *man;
> +	struct list_head *cur;
>  	unsigned int priority;
>  };
>  
> @@ -438,9 +442,7 @@ struct ttm_resource *
>  ttm_resource_manager_first(struct ttm_resource_manager *man,
>  			   struct ttm_resource_cursor *cursor);
>  struct ttm_resource *
> -ttm_resource_manager_next(struct ttm_resource_manager *man,
> -			  struct ttm_resource_cursor *cursor,
> -			  struct ttm_resource *res);
> +ttm_resource_manager_next(struct ttm_resource_cursor *cursor);
>  
>  struct ttm_resource *
>  ttm_lru_first_res_or_null(struct list_head *head);
> @@ -455,7 +457,7 @@ ttm_lru_first_res_or_null(struct list_head *head);
>   */
>  #define ttm_resource_manager_for_each_res(man, cursor, res)		\
>  	for (res = ttm_resource_manager_first(man, cursor); res;	\
> -	     res = ttm_resource_manager_next(man, cursor, res))
> +	     res = ttm_resource_manager_next(cursor))
>  
>  struct ttm_kmap_iter *
>  ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
> -- 
> 2.44.0
> 
