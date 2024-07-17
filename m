Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF60934266
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 20:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACA610E32F;
	Wed, 17 Jul 2024 18:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ik4gGxXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAFB10E32F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 18:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721242034; x=1752778034;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8EIvqCqH94AnghoKqLWrJ0Bb47FASshrS3Nt7RYAf8E=;
 b=Ik4gGxXMg8nQIqBSfX5V+v2sCHMR0paD5frHAonxOIJIBfGrd+9dnhNu
 m1d8Cf2Ek5v7VKsF6Gs6ajJ3+rh++6gfJC4WTZtNtUHSKnOPacIkGbeEm
 W9pNt0+lNxFC2deCH5SeiOBFVcKuNTsXBepVoagle7IGfHqy9nEeod427
 7ZFUeWvSp1+26MscG2EgPxifVIArxxU20ORDDD0mnu7c3KxKZFRA9l4xg
 lhjal7ZmG3ml0mUdVI1DKGuFNN0VdDrCLx4jl5gVpW1K8Fpieal3V7tX5
 n5aGUhty6kjXjWBdXY+HZM+DTm6aBRmTwYWEd/rwbP7b52ezIJzOixnGZ A==;
X-CSE-ConnectionGUID: NtvcQ2SJR7GalIuhVsC4LQ==
X-CSE-MsgGUID: E7eLWujXRLa5JbLUfBeoTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="44191760"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="44191760"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 11:47:13 -0700
X-CSE-ConnectionGUID: m19xx+YAQM6l8arFx3Uqvw==
X-CSE-MsgGUID: XRwm+SxHTeSVTgokL8Yxfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="50365902"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 11:47:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 11:47:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 11:47:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 11:47:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=muaHo7akr1LNk1hTIa21edkcXpa7hIn8albuMDpRfJJUSGuEBGjwdV1f8/WTeGoFtDYpzdhgz2Rdp+qg20MTKplSLDbRB/X1leQoFf93fIusX3N2EJRCfb6E0kHrDXmV40vrtampz7NfZp5x04Hw209Jg0hFPgnK5iPfa4yM91YezG+nnSOUNytQv6E+PTbJpO2EY+yGmOoc4U02cZK2O6jYeOSandEjnx2DE83IkP4a0mZ7F4q7QmwanyNLVX4b3JxJPPM8LMpO1yFiwpscSo1UZg8GRSOPi1Ff5aSuJEfybhaTEaKAfhZESbub4cpW7QswfhMuNJGfttOU91IGjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gP8FCTkBQI20uAARBkF2TdT1ZwujPGN4h9FSIcj+6A=;
 b=h1eVMarmBwTWlJ583n4/OveJAHduKtgAmCxXL2PSKWHYZJNn20sOcvnMPIgfmm70quIGZw3NXuXK4LrByBE6+wcI/Tgk65ZMUpbmmK77uViVvgI8cNmxLwjWU70+5NzVqrvxUzdiiNv7sanOmwC56sxTbvKLcVJyBA7ZE56oKtdrWg0d1x8tixdBX9XSLiQDep8SzbjheB7zkiSEb+Dg0evh+w4THgleahMFBogW2zTI+BGcjaQlH2oZ48gibblEj1YiKq0Y/KbNpkz33APttS7pBYqYZxqIWIYGAua7dxt744j7QSjHeP+tbGTWoj/C+0bfXb1jHX5Al6qWirTwBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8385.namprd11.prod.outlook.com (2603:10b6:930:c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 18:47:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 18:47:08 +0000
Date: Wed, 17 Jul 2024 18:46:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <thomas.hellstrom@linux.intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 7/9] drm/ttm: revert "Export ttm_bo_get_unless_zero()"
Message-ID: <ZpgReUBL1Hk6Wo3n@DUT025-TGLU.fm.intel.com>
References: <20240716123519.1884-1-christian.koenig@amd.com>
 <20240716123519.1884-8-christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240716123519.1884-8-christian.koenig@amd.com>
X-ClientProxiedBy: SJ0PR05CA0130.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d4b548-4221-45ba-81f4-08dca690dc3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?whVmZB9BOLpiF3gZMj2XZofpGMOPQRFe8kh0+QvOvpvOdp7581asAzSzF6?=
 =?iso-8859-1?Q?xxku/t0GSJEt+pbStE8YD7BfOHG92YDZBCcVHcsIGxTp/VWykKI1a2cd0g?=
 =?iso-8859-1?Q?A6bxyniG2qvq1Q5s62cyIewpFWAoWeJDzfEjJ7YZWdHs4BoqrSk1XDAwl1?=
 =?iso-8859-1?Q?PzdT+wWDbgVbR6GJ/nA5LvzPYBx0NKJN9URdLpQaYOVCRJ76UTC5EmQg3w?=
 =?iso-8859-1?Q?loF/hwI0HKy32JthX7ssXLnBCEmOfW0K6whbYQLaDFWh8sJyjpty89C3sF?=
 =?iso-8859-1?Q?AcmOeQlEJ1ry9kPFTyy61/hzCBupmdU6JEXSxv4yLRdWcuZrN+Ii4w9DR2?=
 =?iso-8859-1?Q?Pyib0V+mLr10QAiLPEzdpHJVtklx1PsdUWEI6B0fvwHX9EDUYf+yQgRNSR?=
 =?iso-8859-1?Q?gUYXqGPHKPJQ8/lnSrgwVcrAKiPR7oPigjCNkGo2XMNh8wl/C8/t4+zYUR?=
 =?iso-8859-1?Q?JeahbuQH7oGLMkvwa1GvNFH/qFILdM2zX2cyNwACb5Re+Ivt9J2oN0LEP2?=
 =?iso-8859-1?Q?WMBtkrC1Dlbrql9P5IhYO/tSyX3L4ULixQRruLa8eCPnO5EisYPB+APyHc?=
 =?iso-8859-1?Q?3eoUtLQuN5TZscV1a3ER86c2kMv3KU1Io0oYaBcHR01uDUR0hxi23U5Ex+?=
 =?iso-8859-1?Q?kQYCHDzMvViOpIle6ihJrMa5rziZ6yz1YiQUz27AzerMsjZ6VK3wDvQ8Vq?=
 =?iso-8859-1?Q?+trEMq5rHkDHp8IHIU0Ekts0BADFoxJ5e3smS/LIm0/ASJAUTEXVVLqXj8?=
 =?iso-8859-1?Q?d32nVPzl59WI2/pw/ag+GfUrYcNivLkuHHu26yIffnfbkdiQqtJJDw4CWm?=
 =?iso-8859-1?Q?7trU7zhHm0ty8ivNeywZs3ZJ9UN5UGmm5eYXBPAbLruKQf2/8k9q8PuzWT?=
 =?iso-8859-1?Q?SzsvjrGcz6xQcBsysQf3vG3ZH9CJfTO+qc7AuDkfy83io8u7QdXNn3zEp0?=
 =?iso-8859-1?Q?exigLR+fzHo/rBL9PIn9XuY7iBgCmsx9iLb6J1B8ixPXwTPenvfmvUxV/M?=
 =?iso-8859-1?Q?pjwwtcA/PboDlq4puJrLcM+MCs6y2A3bm9YX1tEI/7Zfayap3dHcupAcHO?=
 =?iso-8859-1?Q?XePRlDaRKykTQk5XBjEiUwtAvucvzAhmLBxsVEazuKG4NAJXSzGJ78vLq7?=
 =?iso-8859-1?Q?zd0EZRym3+m6E8v2Zw90+LKZw/ZhRWg8yna4FAfqZIC8ugK6K58/2naW/M?=
 =?iso-8859-1?Q?IENpCr8HZed9qn9AjjJlwu5DqRG8gvxnCJNn7oVfO9frasr0dcjxIVEdzm?=
 =?iso-8859-1?Q?nFCBtW0yd0NYvCN9+iSfA/kZAi8MUa21lyjcArBgTGYe+3qaxdWbiqsoI6?=
 =?iso-8859-1?Q?mrz4qKQwJmsX+CzVmn2mxxxKdHxQhbcZgUmK8ximdI8P4A/uncYsIh6VhR?=
 =?iso-8859-1?Q?F8049Q6ysVJ4snLfhGadX2v6BmBtFB2A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FrhQJm4HDV+j/3SQ3UQz4mzozsNUqqqbbgRNxwx3V39gpY9fA0mI313+F+?=
 =?iso-8859-1?Q?XAodYwhdw7lS3UACzZU01a0q83oRpsZAzC7PB4vGyfooNHjztraHXNjONa?=
 =?iso-8859-1?Q?VcvXGYRquN/3wzWIzHUqpqO6osBQ6eAt6qBjRuo7q6sm33HCu1+71NUS2s?=
 =?iso-8859-1?Q?cSZaLzQ3suAhK0D80UFBfNUDEQOiu55TOTJ0RRoPrRQAnthWybNs0lUYdl?=
 =?iso-8859-1?Q?7Mil6FW9BcbCfcJfwIoSmDuIyZunxmFHf0N739XEpVxfPPiqQ+R5wttIrs?=
 =?iso-8859-1?Q?eJTt1JoQBScOSImj30uJFr/Ly9DKtnMJDgI8lJyPqnM+nx++YIU/U+ncMs?=
 =?iso-8859-1?Q?bBjr1tdONc6LPLzzaFKIU82vMzuFMzG3nqdQF/cgU5nwPrS34MK+ctJWet?=
 =?iso-8859-1?Q?01UMyCYKKxnm4kg79rSKoWHbdQ0gvudK4gX/5AMvGGVVZGOvF6pfu6jPtU?=
 =?iso-8859-1?Q?qUeTKkuTDG7p8M0SzBMTACDEQ1ilGPVEq9SSLk/muTLyub0OuA64VCcVG8?=
 =?iso-8859-1?Q?5AzNVLl+D2XqdZTz/gzf133Atr8W2Z9sB+40PGx8UgcsncmXt1mSaMdzqk?=
 =?iso-8859-1?Q?h3IKtehgNmKxntMdmFUl8Gxu2mZbKbJFi2uIkn+ELaIcHPrCxqprQfKdYF?=
 =?iso-8859-1?Q?OdP0gsT1Zu9sUHMNwLVVEu9FDcpCeTdfemNfIeIlVEWMhYZwjK7tvhGzyr?=
 =?iso-8859-1?Q?aFU0vcsYcqK7xhR7rqkGUeAO4DmTLT6WTxSqLeRwl8bcLGdOeQPg7bciiY?=
 =?iso-8859-1?Q?lHWzm+anxQ59GP3Kh0NBnqAH9eVAxNaRQUzKyfHW7BpH0FIOZISGWO/LXO?=
 =?iso-8859-1?Q?fX/YmrUc/vYkA1JqM+Qde6J/mTCVDFIrMuGZ47bG6BLeuSNF6E59CrVTLJ?=
 =?iso-8859-1?Q?C8LIcPQiDMl7zmpWMBSnboWHu3MJqhXMwKWTpIEH7/X1sPnWamTNT6P2rX?=
 =?iso-8859-1?Q?S7TOSzQjFUbhQWvCwDrz+ktEASNM/Jcbhjri7bXWYETN/pDTowS4XmZ76S?=
 =?iso-8859-1?Q?tWmjwjuhgo7tEAA0TY9dpcu/6pFNa27jWsS8u1s9lq+Rjg2AB3Xwiq6a9T?=
 =?iso-8859-1?Q?NLinYnvnSy2sibzDBRHViOaOcAtdZW7Aphmkp3PUHYRQVPEcB6xGwB2aus?=
 =?iso-8859-1?Q?IygM88dyh7zxp8WV8BAq5dPVHzELUFBLiEh6NNPAXZeg0LtI4zkfVHBcOl?=
 =?iso-8859-1?Q?9Un3Hy3BKQyVZ0pb95ChSZjM9LbZdbnGoIN4FHPs4HILbKwF2Q9YbVXf1Y?=
 =?iso-8859-1?Q?l6JBS9qihixRWJwEovipqefeR3OlLdtPzJr9ekSs4S/d2uq0cEhELFz5iz?=
 =?iso-8859-1?Q?SQvAXMsmWfuRqKIANm3xGKQAV4e9WNj2+PgBx8MnArXzEbaRiV1m0o7sVn?=
 =?iso-8859-1?Q?wAM7jPyk0V0SOSpiCpsqozVk73KtaER6XffPSeRNpvq/uNpuRJLj87fwLk?=
 =?iso-8859-1?Q?MhZJwyKfRknW/kRGqjNKj+dzHX9fnQr4gP9j/4XPboWZhTpyvA2/skrplY?=
 =?iso-8859-1?Q?78JRlTpiS9HAQ7NAkklnNESK7+lUHZtMmAtvk27qBEaSCnYKbEiJT+F3dw?=
 =?iso-8859-1?Q?c/vmer0dRUQSK/y++xDy/AKYgh9ZhuivteacD+mBFe1jZKgLH625BJsIqX?=
 =?iso-8859-1?Q?m4Zs303la8FrcS19wsi0dnSTX9lWn3Qj4q5EOtDslshZki/SZj0A8tUQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d4b548-4221-45ba-81f4-08dca690dc3d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 18:47:08.1172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ruv7+1YA1UfLio7HA8BTzXY6Za+kqUIqdiPix0lZeOoZZN4yl13Hzz9q45SN9OXQ+gFbzSgQ6YFzxge4d9erHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8385
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

On Tue, Jul 16, 2024 at 02:35:17PM +0200, Christian König wrote:
> This reverts commit 24dc64c1ba5c3ef0463d59fef6df09336754188d.
> 
> Shouldn't be needed by drivers any more.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c          |  1 +
>  drivers/gpu/drm/ttm/ttm_bo_internal.h | 48 +++++++++++++++++++++++++++
>  drivers/gpu/drm/ttm/ttm_bo_util.c     |  2 ++
>  drivers/gpu/drm/ttm/ttm_device.c      |  1 +
>  include/drm/ttm/ttm_bo.h              | 18 ----------
>  5 files changed, 52 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/gpu/drm/ttm/ttm_bo_internal.h
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 0131ec802066..fe4638ec0976 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -45,6 +45,7 @@
>  #include <linux/dma-resv.h>
>  
>  #include "ttm_module.h"
> +#include "ttm_bo_internal.h"
>  
>  static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
>  					struct ttm_placement *placement)
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_internal.h b/drivers/gpu/drm/ttm/ttm_bo_internal.h
> new file mode 100644
> index 000000000000..6a7305efd778
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/ttm_bo_internal.h
> @@ -0,0 +1,48 @@
> +/*
> + * Copyright 2018 Advanced Micro Devices, Inc.
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
> + *
> + */
> +
> +#ifndef _TTM_BO_INTERNAL_H_
> +#define _TTM_BO_INTERNAL_H_
> +
> +#include <drm/ttm/ttm_bo.h>
> +
> +/**
> + * ttm_bo_get_unless_zero - reference a struct ttm_buffer_object unless
> + * its refcount has already reached zero.
> + * @bo: The buffer object.
> + *
> + * Used to reference a TTM buffer object in lookups where the object is removed
> + * from the lookup structure during the destructor and for RCU lookups.
> + *
> + * Returns: @bo if the referencing was successful, NULL otherwise.
> + */
> +static inline __must_check struct ttm_buffer_object *
> +ttm_bo_get_unless_zero(struct ttm_buffer_object *bo)
> +{
> +	if (!kref_get_unless_zero(&bo->kref))
> +		return NULL;
> +	return bo;
> +}
> +
> +#endif
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 3c07f4712d5c..f7143384ef1c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -37,6 +37,8 @@
>  
>  #include <drm/drm_cache.h>
>  
> +#include "ttm_bo_internal.h"
> +
>  struct ttm_transfer_obj {
>  	struct ttm_buffer_object base;
>  	struct ttm_buffer_object *bo;
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index e7cc4954c1bc..2e7fa3a11dc0 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -36,6 +36,7 @@
>  #include <drm/ttm/ttm_placement.h>
>  
>  #include "ttm_module.h"
> +#include "ttm_bo_internal.h"
>  
>  /*
>   * ttm_global_mutex - protecting the global state
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index d1a732d56259..31ec7fd34eeb 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -239,24 +239,6 @@ static inline void ttm_bo_get(struct ttm_buffer_object *bo)
>  	kref_get(&bo->kref);
>  }
>  
> -/**
> - * ttm_bo_get_unless_zero - reference a struct ttm_buffer_object unless
> - * its refcount has already reached zero.
> - * @bo: The buffer object.
> - *
> - * Used to reference a TTM buffer object in lookups where the object is removed
> - * from the lookup structure during the destructor and for RCU lookups.
> - *
> - * Returns: @bo if the referencing was successful, NULL otherwise.
> - */
> -static inline __must_check struct ttm_buffer_object *
> -ttm_bo_get_unless_zero(struct ttm_buffer_object *bo)
> -{
> -	if (!kref_get_unless_zero(&bo->kref))
> -		return NULL;
> -	return bo;
> -}
> -
>  /**
>   * ttm_bo_reserve:
>   *
> -- 
> 2.34.1
> 
