Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2790C92D829
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 20:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F6510E86E;
	Wed, 10 Jul 2024 18:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZX0HMi1G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A3810E86E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 18:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720635609; x=1752171609;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hTUIriTKqI0/t8tQ4b4rdACGEKud+utF7pPV6fr9FTE=;
 b=ZX0HMi1GsVAJtIT738Au7FCninsvcd0vz+PaJsgyT0Fj4NjsY4AGmMSC
 2qLeqv9Q94MIk8ds4hAcedOuiPJrwrSgbIFMSfFFpLUu5nnP7w9fizOIs
 nq0dhkKJNoXjG1Wh9ddIfX63b1VXaQX9xnLT+qJ+N3+hNzcY+wix398Yy
 aUaFOBdho9Qmp1vl0twmCgSfEnsbIwqnM5d2Qx/lWLey0qc9AZuupYXaz
 ORhFkFiKqGl8Bqs1Y5uf69Zyb288cqtIVez46hHgCyrPmWM2YAmPuvTR2
 65yt1BxQt7evBAgkmm2rLCMO5PBJxQIbuX6cqg83y9AxxU+K/VmUkPzha Q==;
X-CSE-ConnectionGUID: BenQ07dFSAy5REqH206z+A==
X-CSE-MsgGUID: upVyMToIQN6dbzySq/0v3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18115710"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="18115710"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 11:20:08 -0700
X-CSE-ConnectionGUID: RxG7G37TRHKSQ32xBK8BZg==
X-CSE-MsgGUID: OLrmfpCTSdGrrs8pNQXXxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="52899382"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 11:20:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 11:20:07 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 11:20:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 11:20:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 11:20:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fokOj91Ln4W0WrM/R8uMXn4iTMkA3RBRUyMvXtpRU2tpI9iNFJ6TMbhnaL7R6u+wUDuIDddIpNeyKJrHRHnZhbfdv9O4xEhEKVSck+7irTv5c/yHpyUz2B6bdhIgV3vpNmjXONMvJ5tCqMJXRg1cOAbc9duWVr4WjGqhLaIAi5xjA71gBL/lBKt9Ggv4hzq5Z2skqeXIYKqXzxUKA9WB73R5Stllb/jkwNLgLRun01CsNbxgzSakg8+kf0wbeM9CfkWjiOdoHOjs2chUhYE1YwVdQ8zs6s/XAcz3+YSfYzKrll52Y2fSmYrXGsoWORu8CAa8E1yNDED0jFCvOM8glg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0NykuCF4Xjxkn/7HlmQdnf50Kpp8FzwffhXCN2HQ/g=;
 b=k9WIbgvHcrxe3ug5jdveR33PWAFUDO6k2qVM+569uRG827RtJStji+hGbRqwewd/sRPzxGW4vOJQsMDJPNMWf+G2Ua72/KNAPYLrTg5Wqn0LxSMO1uLAWlJvLSHSFajqr3BjWd/IkE2/lVvAJQ9dYPGXdA+/q3Z2L+4bv5piSoZMsd1772lPET0ftLJYYWNDjzngyaJvvJbBNTA+AUgFmZfREVXlPKjZV5eom1UKCHDPblcJXF5hhbaL9Yk5VJxUwBy5ykRKYmoYRI3H895S8MhAGaHlSTX+9zPJeA/pG4xUJluFeSbh4grFIj2zuK+flcDJvvypMUYFDLDI1hR6uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA2PR11MB4779.namprd11.prod.outlook.com (2603:10b6:806:11a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.40; Wed, 10 Jul
 2024 18:20:03 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 18:20:03 +0000
Date: Wed, 10 Jul 2024 18:19:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <thomas.hellstrom@linux.intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
Message-ID: <Zo7QpJKtVNw4RvUd@DUT025-TGLU.fm.intel.com>
References: <20240710124301.1628-1-christian.koenig@amd.com>
 <20240710124301.1628-5-christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240710124301.1628-5-christian.koenig@amd.com>
X-ClientProxiedBy: SJ0PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::16) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA2PR11MB4779:EE_
X-MS-Office365-Filtering-Correlation-Id: 20f9177b-6edc-44bc-b60d-08dca10ceae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?SNUiJLmqLr0Y/qOlmM0/3PDbNezIz10dd3JWWmrOZXA/jcI1gFmyFM7Y4T?=
 =?iso-8859-1?Q?LOpKnH9nKWbyFrlxmvBFt5OdsF+/dtauRjiVoJ+I2f5oNNa4l6qZE2iSel?=
 =?iso-8859-1?Q?sMcJC9dST0/03HvkjtCHB/LgRbkdFvolBtHFoBK2ZGCn/DQz4oaGc9CZSV?=
 =?iso-8859-1?Q?ZKIqYtHyy53YWYfunKSOdfk0m2SS00Ms6nWKNfY/bcqqFfaozksSkeU90F?=
 =?iso-8859-1?Q?GPNfcACI8+rt9bz5R8JLFaL2tP4PbDT3L3Z38M6Ut7e9gsWJZtTNdt4hTF?=
 =?iso-8859-1?Q?SvPccwG0FOtTvwET8bRpfgLerx2PqOTneBdigxXziqbzP3uYm3U3qfns6u?=
 =?iso-8859-1?Q?CbXpaPn9pH9S7HaQu3liUJS5gSE35yM3VFA3bu65izqav5OhkZGEM+bjPW?=
 =?iso-8859-1?Q?mdw3pwQgpAiMyrvBSue3mUA7iR1WqBsIY4Z9NLg9rqRkVrN8Tt52O+tfCW?=
 =?iso-8859-1?Q?yBIm+vnPIIxqDV121dlxazN/gEGgL0JC3vAaEOQ+XNTxdc5/X9dIaPUFWm?=
 =?iso-8859-1?Q?dc3hhYUYE0/bMtRJ09uZUDW8zS1EbBiFZ1VRUoqaqltOLogL3BI2MjRdhr?=
 =?iso-8859-1?Q?San+uInud2pUyp4OTnDlyLioLJxazuWhPH2aHilSjTX9cJvXyKk/GR0Qw2?=
 =?iso-8859-1?Q?wjjOhHfNPSrPR30vPkDr93VflZEKBMkCr8jgq0SjMY6Mu4lO+dmRoR6bGg?=
 =?iso-8859-1?Q?zSNdljaqiXY39aB/Cry0KZWNz5MS6LOFosiV5JHPZsssh2a+Cg9gPM33aF?=
 =?iso-8859-1?Q?0OqtMIEkQF+IgoKVnZYHa32cy6vnp7+1wkddBEEzAp8Jb/vrvLwsq+d9h8?=
 =?iso-8859-1?Q?zILZcWRZeun51JEZPDBgvIwh1TH33J0KZErUa7k2aq0H/4tTMXsLFjAA8c?=
 =?iso-8859-1?Q?RqQH8U/vVV5OjS2zo4iuLcU/x9R7SoBZ7nZXzzV3+9TCdKeJLy/KSIYhpB?=
 =?iso-8859-1?Q?10T/vbvgexQjpSvM6u2hZJ/hL7VJuvMM/WBmSGCWqbUgLbqD0wJ+nI6r6v?=
 =?iso-8859-1?Q?EtXijDHgclC7BZ9bhGHGiozOfsrug5vxTh7XZYOJczb+1grTpd1VUzYpDe?=
 =?iso-8859-1?Q?XnxMnxquFVoKDDfklmgr5tBIE/OBrZMCFuYAKQqNod93pSjXfyGd+Qx+bB?=
 =?iso-8859-1?Q?5hglPzLte4+ELqFfCphr8fzPUm679bZYAMbWZJiWKcIWV1cTlpMA3As24w?=
 =?iso-8859-1?Q?j0xv6BlHnQY6obkMFr2lpVWzKRQQGU/9lEbAlgmMl20r2CAbEfi3LmpcRl?=
 =?iso-8859-1?Q?d6swW8zH+jMVoUpqhE9JIG5NYtZ/WgzbJ6BJaomknNn551RVWv7hekjlGg?=
 =?iso-8859-1?Q?oPOXT7cCZszq/Fmp52ptqQgxmys5PrugNNeT8dOBdJ4Lw8Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?G4mary6YDDyT+UWJhdtMH+sX8jsVvJeT622pf9SGNnwzk5uDdgCEg+e//a?=
 =?iso-8859-1?Q?P1TM4rlLNk+DoRmgOetDv56RPTamZGv2BofDoyk39Krb+0UiCkly3gawe9?=
 =?iso-8859-1?Q?Au70vq1AUsUn6ic2gbCUa+VG+/RL9TWbUPwQAiu6LJ8FKdBjEf1aosZskO?=
 =?iso-8859-1?Q?XCXEly4f29ITh9S47h8VN/uBrOU7TUjbmoVFLR9XNn0eUNfmgYVIM62Vyk?=
 =?iso-8859-1?Q?Dd/SWRDWXekIKjcJR/UqrzqW/e+LFjlbxLu3LwwTSB+QqchfZfJL7Q75is?=
 =?iso-8859-1?Q?1Y3cLWitz6WRw2h070RUn8mY193bcfIC28FoTRppbXw0MeBPy05MbpRFzH?=
 =?iso-8859-1?Q?P8wB7xgb0RBuOuP8VKsuj9h3cCtVvbgsnGRwit4MFj+9rqJjNSspskdtHA?=
 =?iso-8859-1?Q?crHJA3q6K9uBo1/UOHHT7BXk75lhXnjr2KzDG1or2rugdOG29V9ykl0cvA?=
 =?iso-8859-1?Q?tAvfpdCUPa0XG3Zowr6GO0dH1qJIuGFjxEnNByF32czZFLTi7jfcj44sIk?=
 =?iso-8859-1?Q?RZHrhlefF+6aqUITOJxTVBTqljauxnRjZzy/J7k/Q6Z9WBaeGOIUQKvXgx?=
 =?iso-8859-1?Q?SHOalcYu51JKdIRXpSPQnCGbcIrnCTiL1ehDcBjpyYSXGABfDkt95tZDdF?=
 =?iso-8859-1?Q?AfRTRw3BR/nBLe1rquGNdERAUKRw2B1ebkamcNYsnW4Z8YbtmWP3oICDFQ?=
 =?iso-8859-1?Q?iDEh38BAjrbNJlfadt2Yjg1aWafTmmtdYKyzZWXfXwqnTqNFaZXpDoQpHM?=
 =?iso-8859-1?Q?XE8BqNiqk2EKF5EoNTwXO5I04olL6kBe30U/KhrbIPkaCLJipVjV66jr/7?=
 =?iso-8859-1?Q?Okj9bZvRp453/DqR8RyNDoqdHOJgYI82Z8lvcywOJe1YNc8sJKX6DmYFeE?=
 =?iso-8859-1?Q?0kGPu0Gpa7T4CL4Ii81iy92rHN1OcLBaCiFOZj/wofo89qoo9NYSoCDw+3?=
 =?iso-8859-1?Q?matz+fXVxx+IR0IDuEPRfX5FmgBNJlAO9lam32UgTrjPUEWIy07WwCY5ve?=
 =?iso-8859-1?Q?mW7aNc2iHiiUFirBYrlzV898FPYiq+Gge3xDRTS3SQwFYl4o9MgmamegC0?=
 =?iso-8859-1?Q?6n2zJf56XeA9W031cjsPLXsB888vJFf/m/82RP+UbSO1zDexXh1B6ts4N4?=
 =?iso-8859-1?Q?Fm4wcc6zCR3cL08zGzjLFq1UncdiSi4ixrF9+z2I7fu+Pt9EhHBBqBIPEt?=
 =?iso-8859-1?Q?VD2DellzsnvUyb2oLGT7pb227pQy8eE5S38axBrwvzIkj9NwEkbkGaTP7b?=
 =?iso-8859-1?Q?PgJ0UjadwC5bsV6mjOTFUeK8xk3EoWdTk1YJES+UQBMS9VWgRc+YRJXfcA?=
 =?iso-8859-1?Q?NJoTjjOR7oFd0i3Rjrk5f/WOAn6lD97h1o5Jhh3AZAyqkAJjJ/g2a3zYkZ?=
 =?iso-8859-1?Q?2aMqL4uHm5dIbfTAzKX3ohzEmh7vpnFVXqk0Jml9BMALTNkMMooKKx9fmV?=
 =?iso-8859-1?Q?Qc0BsG4+6H7plONCJm6UubCMh1aBiyFJpU36Hg7+acbPnd1V5HC4EZx3rG?=
 =?iso-8859-1?Q?WsT6G2j6n8pZva43/2ydRtgdLwWMnoCNXLxwJZ8Jn0FiW0SdVSefbW4SU5?=
 =?iso-8859-1?Q?2hfhHZghjbDPxxQz5PhwFYXock3JvKS9kLr/XItHGZc5W2lYuDq5/cAvT6?=
 =?iso-8859-1?Q?QwZLdYwpgGVIqBapGIdBvKTqTClOYBW7ilSuRXFfWsig1JVq+cjpuwdQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f9177b-6edc-44bc-b60d-08dca10ceae8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 18:20:03.3624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRw+i47DoURRDyYtz1EO7GdgvqoLAzUFou5celdIsC8173x1nvDbdDfcEA57p7MLeW/peuPpotJOC8KJ07Fmww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4779
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

On Wed, Jul 10, 2024 at 02:42:58PM +0200, Christian König wrote:
> That is something drivers really shouldn't mess with.
> 

Thomas uses this in Xe to implement a shrinker [1]. Seems to need to
remain available for drivers.

Matt

[1] https://patchwork.freedesktop.org/patch/602165/?series=131815&rev=6

> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c      |  1 +
>  drivers/gpu/drm/ttm/ttm_bo_util.c |  2 +
>  drivers/gpu/drm/ttm/ttm_bo_util.h | 67 +++++++++++++++++++++++++++++++
>  include/drm/ttm/ttm_bo.h          | 35 ----------------
>  4 files changed, 70 insertions(+), 35 deletions(-)
>  create mode 100644 drivers/gpu/drm/ttm/ttm_bo_util.h
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 0131ec802066..41bee8696e69 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -45,6 +45,7 @@
>  #include <linux/dma-resv.h>
>  
>  #include "ttm_module.h"
> +#include "ttm_bo_util.h"
>  
>  static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
>  					struct ttm_placement *placement)
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 3c07f4712d5c..03e28e3d0d03 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -37,6 +37,8 @@
>  
>  #include <drm/drm_cache.h>
>  
> +#include "ttm_bo_util.h"
> +
>  struct ttm_transfer_obj {
>  	struct ttm_buffer_object base;
>  	struct ttm_buffer_object *bo;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.h b/drivers/gpu/drm/ttm/ttm_bo_util.h
> new file mode 100644
> index 000000000000..c19b50809208
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/**************************************************************************
> + * Copyright 2024 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + **************************************************************************/
> +#ifndef _TTM_BO_UTIL_H_
> +#define _TTM_BO_UTIL_H_
> +
> +struct ww_acquire_ctx;
> +
> +struct ttm_buffer_object;
> +struct ttm_operation_ctx;
> +struct ttm_lru_walk;
> +
> +/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
> +struct ttm_lru_walk_ops {
> +	/**
> +	 * process_bo - Process this bo.
> +	 * @walk: struct ttm_lru_walk describing the walk.
> +	 * @bo: A locked and referenced buffer object.
> +	 *
> +	 * Return: Negative error code on error, User-defined positive value
> +	 * (typically, but not always, size of the processed bo) on success.
> +	 * On success, the returned values are summed by the walk and the
> +	 * walk exits when its target is met.
> +	 * 0 also indicates success, -EBUSY means this bo was skipped.
> +	 */
> +	s64 (*process_bo)(struct ttm_lru_walk *walk,
> +			  struct ttm_buffer_object *bo);
> +};
> +
> +/**
> + * struct ttm_lru_walk - Structure describing a LRU walk.
> + */
> +struct ttm_lru_walk {
> +	/** @ops: Pointer to the ops structure. */
> +	const struct ttm_lru_walk_ops *ops;
> +	/** @ctx: Pointer to the struct ttm_operation_ctx. */
> +	struct ttm_operation_ctx *ctx;
> +	/** @ticket: The struct ww_acquire_ctx if any. */
> +	struct ww_acquire_ctx *ticket;
> +	/** @tryock_only: Only use trylock for locking. */
> +	bool trylock_only;
> +};
> +
> +s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
> +			   struct ttm_resource_manager *man, s64 target);
> +
> +#endif
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index d1a732d56259..5f7c967222a2 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -194,41 +194,6 @@ struct ttm_operation_ctx {
>  	uint64_t bytes_moved;
>  };
>  
> -struct ttm_lru_walk;
> -
> -/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
> -struct ttm_lru_walk_ops {
> -	/**
> -	 * process_bo - Process this bo.
> -	 * @walk: struct ttm_lru_walk describing the walk.
> -	 * @bo: A locked and referenced buffer object.
> -	 *
> -	 * Return: Negative error code on error, User-defined positive value
> -	 * (typically, but not always, size of the processed bo) on success.
> -	 * On success, the returned values are summed by the walk and the
> -	 * walk exits when its target is met.
> -	 * 0 also indicates success, -EBUSY means this bo was skipped.
> -	 */
> -	s64 (*process_bo)(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo);
> -};
> -
> -/**
> - * struct ttm_lru_walk - Structure describing a LRU walk.
> - */
> -struct ttm_lru_walk {
> -	/** @ops: Pointer to the ops structure. */
> -	const struct ttm_lru_walk_ops *ops;
> -	/** @ctx: Pointer to the struct ttm_operation_ctx. */
> -	struct ttm_operation_ctx *ctx;
> -	/** @ticket: The struct ww_acquire_ctx if any. */
> -	struct ww_acquire_ctx *ticket;
> -	/** @tryock_only: Only use trylock for locking. */
> -	bool trylock_only;
> -};
> -
> -s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
> -			   struct ttm_resource_manager *man, s64 target);
> -
>  /**
>   * ttm_bo_get - reference a struct ttm_buffer_object
>   *
> -- 
> 2.34.1
> 
