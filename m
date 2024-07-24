Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD3A93B962
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 01:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D156E10E0E6;
	Wed, 24 Jul 2024 23:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNZtAktf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6924E10E0B4;
 Wed, 24 Jul 2024 23:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721862381; x=1753398381;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1qBdTT+slTNA1bL0jEMZSsatNI5snLoLKHU9h5upGd0=;
 b=jNZtAktfLnOYYyZSXvKT3+ZEwaa9SYFvLsVKFfT9feJWsbB4W0apY6Jw
 F63NcQOXa49uFg8qVrwSlzYFbkRZOiLoqjCtGDSfdzg1T6/UtvyYKNNu6
 KPnNzri3OhIC1n/JdxjoTH5PXAWeGkKazbqlI+XX5b4+rHG8AsNq5U0mY
 tlSvx7yyyalCqMOCeah9WVIabnFKEbu3aRzeBNUIHJvl9JZ5X+EBcNFUY
 bYIhbNZQOqr56oG41bNor/gVcucn61w6UOlaS7bek0WXWLZeuZWYFpM+d
 nNpYH5QEV/WDADOO1qkqmFDi3tW/yp8LEjKCmm8DGHWmwJSETjb/Q7nsx A==;
X-CSE-ConnectionGUID: 7yIgZ17OR2evgkLW6NaNUQ==
X-CSE-MsgGUID: UuEfFiqCQhqLTQjwW0xMow==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="44996847"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="44996847"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 16:06:20 -0700
X-CSE-ConnectionGUID: 1nZZFpaXSPOvqTDH20py+w==
X-CSE-MsgGUID: z9BKSs4zReW4tJO25FfwPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="52405659"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jul 2024 16:06:19 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 16:06:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 16:06:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 16:06:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gy5MxQOJ1J08531IGEPIprpeM51TWdA2w6cy3JqMZ1SbUC5tWNVL8OL0KLP4H3CoWRmT0alohGnMlhm/upSmNHVRG1XLyKJTjjda7XMmVfqW9ub0Oj5rzBOOzJrjYyZn+gizZqix+BfHcniYbsT+ADqd3zKDucD2xkpVOuefw2TlyVXgej7r+AFuycfY2Naj0w4ipEFxvu/NABG3JFlrMVhCUQqqRmWXlweo5sdfRgcFz5PUa+vEKHz0XRrX0D/sVHb9uD1fca9M75zcakafQSxmS4yZgk9sXtJ9Zf4YRouUz7PYTVEeUGHx4N8s5ROy5cWK41Pm7IXNhiWccA/jtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlxjVuI6XDliNfmMF1KE//DBtqy6R0JL76w8zFtULt8=;
 b=dQPhCPvO3XKSrqer83Zu61Xvout3Kx6Fz/UfMu1RwxZ3qKVO9949Dgf8WzxYh6Wup3/dE8casqUul+k7SUXoFDIHRs1dfELmcfxMjJPzsJIKOgEg0ZRKao5JvsZNY5436TTZ038ZAMiED+3OCzFj9v9hJSHvchfEIYRiO29ZqB95RJ6bj/Pyyhuf/htRIrM/XZGgnizPjHD74aCzYWzCggD+fVSF3AJfELtIOcIhYBlUhyyaSOkcNAShrq4vwj9FK8tNsucWYCZeK6z5rzC/GE4WopVexZtv8ly+lUQypZHJ7gErAIr8zN4j+lTayWNVXroxO1ILdU4FFMjOyDONzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7707.namprd11.prod.outlook.com (2603:10b6:806:322::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Wed, 24 Jul
 2024 23:06:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 24 Jul 2024
 23:06:17 +0000
Date: Wed, 24 Jul 2024 23:05:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <daniel@ffwll.ch>, <ltuikov89@gmail.com>, <Felix.Kuehling@amd.com>,
 <tursulin@igalia.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/scheduler: remove full_recover from drm_sched_start
Message-ID: <ZqGIuH3BBdpcjyTY@DUT025-TGLU.fm.intel.com>
References: <20240722083816.99685-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240722083816.99685-1-christian.koenig@amd.com>
X-ClientProxiedBy: BYAPR06CA0046.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: c4610ee3-7938-4b00-f26f-08dcac353915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?e0JUp+eyycIYtVvO9DO8KQGoEonPKPd0VEMzhqFnmAq6gNCppDGGAero5X?=
 =?iso-8859-1?Q?tFj+mIanv8mPHtCnAM1vywwdFzIBLp3xm2gaM2SgdCsA+4QOEcNEcY7Qr5?=
 =?iso-8859-1?Q?lUg0kn0uG8bzMoBWbgMZOMGb9wqeGyuDHHCSCXvqepZlycnxVZm2MfVif4?=
 =?iso-8859-1?Q?86OJUhRJyu/jjVImdjvcAuxeN9PGSuSjoRw7EYsoU9WUzw7+t5a6b/3bdB?=
 =?iso-8859-1?Q?67qU19FDfQmdUFpCvsgeGUIgN+PR4unjGr5r3P5A8D9LDwnXWjBMWNCKO/?=
 =?iso-8859-1?Q?Lvze/Li8FOA/neerW1SloKDBIb5kN0foWB+3cHEWRLIOG+L8tAMUgwuQ3T?=
 =?iso-8859-1?Q?41q6tZpOey+6OGMOvkYPcGRiX/ZvKSJjD8C9jOV3EXcNAcWFHmHvtZbDJZ?=
 =?iso-8859-1?Q?aHIliUOVYe7zi58B5rCiwm0UkSMTJ+gjq5+tGNVjs/6c9GEjvTii8a2WR+?=
 =?iso-8859-1?Q?3C92QLbCVfLKhyBPODEbNQHixm7YGijbyd+szP2fGPv19LRNN/guRJuElb?=
 =?iso-8859-1?Q?p1V99BiWdTq2rg7/1R/m4rhnvuGlmAwfkXl83sJaCOuQQHBKOILxMolCxK?=
 =?iso-8859-1?Q?SmeV0H/y+o5RMAwI6n0Rr95dFwdsQoRwyp8D3uLb3L1xVNq45x856nAM22?=
 =?iso-8859-1?Q?1kqz/Drw36SoniL09GB0w5MO4a9RqA5pUa4Qhn11nCLyT78r+ox/KEEFq9?=
 =?iso-8859-1?Q?w0jhJ686Xo/UA7LrNwOneXhaYhiw235pYHWvfswIaQlpp2Fq+lT0+p/3Aa?=
 =?iso-8859-1?Q?JWHZmzB/cn7R8X7b1FZDhCKMlDR1DNECHJYb9ZTT2FzdNMdOWbJ5utip7j?=
 =?iso-8859-1?Q?qMZ3bopjnwTdAggubXgY8olbjn00ATfU38sGBs6K/5wxKKCS9rX1SuSy82?=
 =?iso-8859-1?Q?Pmn5bu3VZjW69TJtPzIY6cbsTmRJ+v0rUEIOyoIYmT+rrDLz1ezutfbnRD?=
 =?iso-8859-1?Q?oyXU90yr4mLsTBoCxHCfpEk2Lh8SeClMKddimBMofMLRUmrcQXjOMqRFdl?=
 =?iso-8859-1?Q?RXAN9TRbiUA5ZvQU8WlDJGDKdjYpqnfcxYLd8dKVlWMG/nPGbip4I9Oz7i?=
 =?iso-8859-1?Q?z85PfBXBUn3SfczcweVxnpdvMRQpBZul9nZHoKiSeUL+ekT1PWdQxg9Oma?=
 =?iso-8859-1?Q?7/mFwDnRT2yLGystTYU1ZLxJXVFeN/cfKDbRhX8uSM6Rz5AhthzqGjaUK4?=
 =?iso-8859-1?Q?NQMq9PGysoFfpMp1I3JcHiXFij7Ohb/QrHZbI1baXJNQn1E7Ky5QillRoT?=
 =?iso-8859-1?Q?tZ5l8yzPYFRcl+/55o3K4N0jQPgJ7pEx72SBpK0cy3buw1KLT5PO/zi3zN?=
 =?iso-8859-1?Q?CY8jyjajXDLsxI5QoaZzgxWiB8rh6uN0izOmNpSDVMunOK8kKnvAXjwfFN?=
 =?iso-8859-1?Q?gNiR3SCAg4ESQdjrN/HQ7UBYjOJwAaEQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?veaVfKvHZwSxhLvNn2vA16/o2ztJWBLAFbUkZBh55sSQuz9PNZFF8GlBPp?=
 =?iso-8859-1?Q?fYvAgLve7SR7rn2HsshC6oy7MzTkZfvSWWt5pLWQ82qBQWE0nelBXKKc7+?=
 =?iso-8859-1?Q?JVTTh6l61BsBcoIKTXI+kkIhLG8BVRLcNsW65OGAT5JuIAItV0i/p+MVME?=
 =?iso-8859-1?Q?AY0dVvjW9hWC6WCoCXiec1XerHTjjly1fdlCsdrgrzWMGxeFrFaAlhynSB?=
 =?iso-8859-1?Q?9aE/NCAe4KiBM+11QRyqvovoGPaI3C33/t4AUfflx7aN31KKspF3apaZfc?=
 =?iso-8859-1?Q?Zlc2OPJn8Mn6M+7k8iRMB2YQ7jISkJvmA/g94j471MpD/OyKNGig4pB/Mh?=
 =?iso-8859-1?Q?pcRUWBG5Fmg7zTZsl0JFlx9gCDgS+BjSO7jwNOvstzquI6ytg7YGv6pMVF?=
 =?iso-8859-1?Q?z0iroXRUa0yaQg2ECbSKL1Eg5DweUMoL/zMuxg+oGbaOggjalYS7tCDl2p?=
 =?iso-8859-1?Q?RO2XoHC27GRD/Yf0sshF6ELgasG6ipUuHscmuS4/I883sKbwYixiI+5TjY?=
 =?iso-8859-1?Q?y3BNsCDl/0j27Ttt1cn7AHUM+Ex9GJBai4wgBejIFDWmeCzoqLft92pM42?=
 =?iso-8859-1?Q?mhKqPvqz9LCRFmiJr1dD73ypFbZvIZ02pA9b20Z8hiUlVCXmfnM5ismBmU?=
 =?iso-8859-1?Q?TJmptMgnLMJWEgkkbF/5Kg8d0c2aYAn9yRGPx1dR1Lbbg839vFjM6K4xbF?=
 =?iso-8859-1?Q?vF1HsBkTPtOV7itTU1Lu1vNEyKAdoVSqycUWhYgn1paQKZ1nRg8NsAcyW4?=
 =?iso-8859-1?Q?nFTzdp2ZpYTJr+rWeKeLGpt0oJ/orzl3pYKRfbIhBrHX5KqzmjGDiukl8M?=
 =?iso-8859-1?Q?/6nNnRt37y/Chfy4ILo2YM9ZjBycMpSg/B0Af2a+EaT76AUmqkTsNDgJwD?=
 =?iso-8859-1?Q?SjHP6xO4B0BlJc7OVTmDwVM51tc6iNl3YFd0/L3Isyxn/1CZwMqDjKO9LQ?=
 =?iso-8859-1?Q?zYx1CUynzdT/7yJxtwShPQ4WDno7ke4EQgSOOULXCwg2OAeHaB5kw8YGDO?=
 =?iso-8859-1?Q?/9x0gDOEcLZSQvP1UFInr4EyUp60d0vLIWAo7E0smaqr9+ft0S24uW724b?=
 =?iso-8859-1?Q?rbvvq3m4pYZu/qXZkaeRxhljvtuiG+Tt1lr6/ioAshGKW8khsgmCXBux26?=
 =?iso-8859-1?Q?jEIqNQ5392IgWccsNftP8VhvqkTxxwVTfGiIFo5YHPptYVHKLAgZn2q9hg?=
 =?iso-8859-1?Q?zGPKQKcB44tDKT9FLjINzTCaslskGbLMt3GKr5qbtUePaJkdhOUQuBzAvH?=
 =?iso-8859-1?Q?a34RRkntV0z+eVZKdHX7koOifgmqt6iXFUOfcHcMmGcN0yaOBr8OQ9bxUc?=
 =?iso-8859-1?Q?DNAMdy+lY3YX8T4lEqOEEEsuIpik3BDV5aTfMNDmr8gVa0OsEmtoUE72Ti?=
 =?iso-8859-1?Q?pdNRpExqDMblN2vpLxYxiV5qSRM0/tSE1KEMo/wR4zmhBA72EaDAZyL95P?=
 =?iso-8859-1?Q?vzyUemdIlmlDZyyZcHWfJmaNrJ34JzADS8/KbO9VJT8zUOeYe99ti/los7?=
 =?iso-8859-1?Q?Xrk7DiWIEOPXd2mNb6TcoI50VrZOtVWNpoJd57eW15/vZC3qlp59PA0aix?=
 =?iso-8859-1?Q?kz/hDIuE/6dE3HuzGiNI+6h+15pRCyMnVMmv6YaR2ysCczyarz+W2EyMgZ?=
 =?iso-8859-1?Q?k3hpbQfEeSoHy+TV+n+YIWbZO8d4xj9ZlHKWH2MyG2UsjfiELjK/YnWA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4610ee3-7938-4b00-f26f-08dcac353915
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 23:06:17.1878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +wOTsa7d3WerInkR2lUh6s3RX1YLc/Y4L4W/nNMxUXgPB/Y7CDsOH4sQoTYuqTxC4ktCYRqj5Cp9RPupJFzqRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7707
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

On Mon, Jul 22, 2024 at 10:38:16AM +0200, Christian König wrote:
> This was basically just another one of amdgpus hacks. The parameter
> allowed to restart the scheduler without turning fence signaling on
> again.
> 
> That this is absolutely not a good idea should be obvious by now since
> the fences will then just sit there and never signal.
> 

Yep, this obvious upon looking and it can't be a good idea to never
signal fences.

> While at it cleanup the code a bit.
> 

Patch LGTM, also made be realize in Xe we don't use the drm_sched_stop 
and drm_sched_start and probably should as TDR isn't restarted after we
do a device reset if scheduler / entity didn't cause the reset.

Also I think we have a bug in drm_sched_job_begin too wrt to restarting
the TDR even an existing job is running, will follow up on that too.

Anyways:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  4 +--
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c       |  4 +--
>  drivers/gpu/drm/imagination/pvr_queue.c       |  4 +--
>  drivers/gpu/drm/lima/lima_sched.c             |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c       |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c       |  2 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c         |  2 +-
>  drivers/gpu/drm/panthor/panthor_sched.c       |  2 +-
>  drivers/gpu/drm/scheduler/sched_main.c        | 25 ++++++-------------
>  drivers/gpu/drm/v3d/v3d_sched.c               |  2 +-
>  include/drm/gpu_scheduler.h                   |  2 +-
>  12 files changed, 22 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index 3a3f3ce09f00..2320df51c914 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> @@ -300,7 +300,7 @@ static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool sus
>  			if (r)
>  				goto out;
>  		} else {
> -			drm_sched_start(&ring->sched, false);
> +			drm_sched_start(&ring->sched);
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 861ccff78af9..c186fdb198ad 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5862,7 +5862,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  			if (!amdgpu_ring_sched_ready(ring))
>  				continue;
>  
> -			drm_sched_start(&ring->sched, true);
> +			drm_sched_start(&ring->sched);
>  		}
>  
>  		if (!drm_drv_uses_atomic_modeset(adev_to_drm(tmp_adev)) && !job_signaled)
> @@ -6360,7 +6360,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
>  		if (!amdgpu_ring_sched_ready(ring))
>  			continue;
>  
> -		drm_sched_start(&ring->sched, true);
> +		drm_sched_start(&ring->sched);
>  	}
>  
>  	amdgpu_device_unset_mp1_state(adev);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index c4b04b0dee16..c53641aa146f 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -72,12 +72,12 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
>  
>  	drm_sched_resubmit_jobs(&gpu->sched);
>  
> -	drm_sched_start(&gpu->sched, true);
> +	drm_sched_start(&gpu->sched);
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
>  
>  out_no_timeout:
>  	/* restart scheduler after GPU is usable again */
> -	drm_sched_start(&gpu->sched, true);
> +	drm_sched_start(&gpu->sched);
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
>  
> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
> index 5ed9c98fb599..20cb46012082 100644
> --- a/drivers/gpu/drm/imagination/pvr_queue.c
> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> @@ -782,7 +782,7 @@ static void pvr_queue_start(struct pvr_queue *queue)
>  		}
>  	}
>  
> -	drm_sched_start(&queue->scheduler, true);
> +	drm_sched_start(&queue->scheduler);
>  }
>  
>  /**
> @@ -842,7 +842,7 @@ pvr_queue_timedout_job(struct drm_sched_job *s_job)
>  	}
>  	mutex_unlock(&pvr_dev->queues.lock);
>  
> -	drm_sched_start(sched, true);
> +	drm_sched_start(sched);
>  
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index bbf3f8feab94..1a944edb6ddc 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -463,7 +463,7 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
>  	lima_pm_idle(ldev);
>  
>  	drm_sched_resubmit_jobs(&pipe->base);
> -	drm_sched_start(&pipe->base, true);
> +	drm_sched_start(&pipe->base);
>  
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index ba4139288a6d..eb6c3f9a01f5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -379,7 +379,7 @@ nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
>  	else
>  		NV_PRINTK(warn, job->cli, "Generic job timeout.\n");
>  
> -	drm_sched_start(sched, true);
> +	drm_sched_start(sched);
>  
>  	return stat;
>  }
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index a61ef0af9a4e..df49d37d0e7e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -727,7 +727,7 @@ panfrost_reset(struct panfrost_device *pfdev,
>  
>  	/* Restart the schedulers */
>  	for (i = 0; i < NUM_JOB_SLOTS; i++)
> -		drm_sched_start(&pfdev->js->queue[i].sched, true);
> +		drm_sched_start(&pfdev->js->queue[i].sched);
>  
>  	/* Re-enable job interrupts now that everything has been restarted. */
>  	job_write(pfdev, JOB_INT_MASK,
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index fa0a002b1016..d47972806d50 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -827,7 +827,7 @@ static void panthor_vm_stop(struct panthor_vm *vm)
>  
>  static void panthor_vm_start(struct panthor_vm *vm)
>  {
> -	drm_sched_start(&vm->sched, true);
> +	drm_sched_start(&vm->sched);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 42929e147107..2e1becd87e3a 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2525,7 +2525,7 @@ static void queue_start(struct panthor_queue *queue)
>  	list_for_each_entry(job, &queue->scheduler.pending_list, base.list)
>  		job->base.s_fence->parent = dma_fence_get(job->done_fence);
>  
> -	drm_sched_start(&queue->scheduler, true);
> +	drm_sched_start(&queue->scheduler);
>  }
>  
>  static void panthor_group_stop(struct panthor_group *group)
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 7e90c9f95611..ab53ab486fe6 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -674,13 +674,11 @@ EXPORT_SYMBOL(drm_sched_stop);
>   * drm_sched_start - recover jobs after a reset
>   *
>   * @sched: scheduler instance
> - * @full_recovery: proceed with complete sched restart
>   *
>   */
> -void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
> +void drm_sched_start(struct drm_gpu_scheduler *sched)
>  {
>  	struct drm_sched_job *s_job, *tmp;
> -	int r;
>  
>  	/*
>  	 * Locking the list is not required here as the sched thread is parked
> @@ -692,24 +690,17 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>  
>  		atomic_add(s_job->credits, &sched->credit_count);
>  
> -		if (!full_recovery)
> +		if (!fence) {
> +			drm_sched_job_done(s_job, -ECANCELED);
>  			continue;
> +		}
>  
> -		if (fence) {
> -			r = dma_fence_add_callback(fence, &s_job->cb,
> -						   drm_sched_job_done_cb);
> -			if (r == -ENOENT)
> -				drm_sched_job_done(s_job, fence->error);
> -			else if (r)
> -				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> -					  r);
> -		} else
> -			drm_sched_job_done(s_job, -ECANCELED);
> +		if (dma_fence_add_callback(fence, &s_job->cb,
> +					   drm_sched_job_done_cb))
> +			drm_sched_job_done(s_job, fence->error);
>  	}
>  
> -	if (full_recovery)
> -		drm_sched_start_timeout_unlocked(sched);
> -
> +	drm_sched_start_timeout_unlocked(sched);
>  	drm_sched_wqueue_start(sched);
>  }
>  EXPORT_SYMBOL(drm_sched_start);
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index d193072703f3..42d4f4a2dba2 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -653,7 +653,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
>  
>  	/* Unblock schedulers and restart their jobs. */
>  	for (q = 0; q < V3D_MAX_QUEUES; q++) {
> -		drm_sched_start(&v3d->queue[q].sched, true);
> +		drm_sched_start(&v3d->queue[q].sched);
>  	}
>  
>  	mutex_unlock(&v3d->reset_lock);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 5acc64954a88..fe8edb917360 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -579,7 +579,7 @@ bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
>  void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
>  void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
> -void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
> +void drm_sched_start(struct drm_gpu_scheduler *sched);
>  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
>  void drm_sched_increase_karma(struct drm_sched_job *bad);
>  void drm_sched_reset_karma(struct drm_sched_job *bad);
> -- 
> 2.34.1
> 
