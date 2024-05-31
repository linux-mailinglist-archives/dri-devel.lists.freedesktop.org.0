Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 845CD8D6669
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 18:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1A510E795;
	Fri, 31 May 2024 16:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXE2Mzas";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEC610E288;
 Fri, 31 May 2024 16:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717171990; x=1748707990;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6sSAJUfIO15lbYA/OPt5pS5FuTBsG9fztfEHxJ6etUw=;
 b=JXE2Mzas/tIft3iXqho2qEeBfsG8Tfg8Ywr4o+DVnMVErAtUSHYEkLok
 JT5FSiWUz8wqG7wfHUVTpxUeBgBbEz3dhSGhH/qmgAPym4XT7P7lZDIuc
 oWB6MqcJm5Za/3kgM7YGKu18I0KJd1vY5Akn1TRnNiJzfY881HjX/td8h
 +JpXX0dTBjrV5pSGfkhm1Zn1sQ/6rhSoVMWr208Z1xTSsyCJi3CCdQcSP
 jdO1JsJ1vkNNqsXHqbwIK3NXg1FmAdumwDzPUlNZkHr7FmQFL6OKvFFLX
 M9+hizIe63x0PxvWkuWMxrWGPDkneQze3q90kocGaO69KG0rkVt24lTR9 Q==;
X-CSE-ConnectionGUID: AJU6q1fnQkilRxMFPkx9Fg==
X-CSE-MsgGUID: lE31N/4pQWKO9eq/u4nZ1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13590298"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="13590298"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 09:12:48 -0700
X-CSE-ConnectionGUID: 5jz9EwlBQ8+xfqdmpol7ew==
X-CSE-MsgGUID: zL1Ko4VoTf+qW2IW4zCpeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="59384526"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 09:12:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 09:12:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 09:12:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 09:12:47 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 09:12:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABaa/ZpIoYC8vFGzCKj//JMLCLRwaFvo6c6hRip0OWgC7ZntdRvxgC80XQBruZDqtp/fvzbb/UVJbE8rlP7E9rN31BVb49etlUINf4TWhm1AsywsTG2SbNxoIX7gdbLom17kJ3Lc/i/IEqR16ekWSQfTZcUO9C2/DDIQE84/Vybd4dUPVbYLCQcO5HajMObWkf8rcDZaqUuXUca8SwY8mQnFGUDOcir/1vATBgk/TiaDfvAq/+0nrT7Nxvw441/zNQLvh0nLXW6lQIeqtciyMM71tseJu1Fp1/8QuAr2+MJezziO+NT59fK7Bl8fwZZgFDcUmpsN/BK1UDxr7xwvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnDuiJ97SS520FMX1cjY3B2Iobow9u9LjJRBStRh8dY=;
 b=HYlVfwz558mAV2fFvrHs7B2kCqClO44ecGSCpEjMTRIyLeUTwobxCTSrFQrLP9LwVGSc8w7QBnpVE2S2SQ8yVcnzzzwAu9qKykuNBpsJLuR+xDJIENOOW8jRNwJUnw5O3LRfiRSEzFHJGG/WhrgzGZnIpcehtWvJ0MC86Cg3KaLYYvh5mFN5i9Y/NPhxySupS4UO5vVLYnQwRMI1AOF/+Svz8TDTupYd0ANOgYCExD4+qSqW1psUBFhabjSLcP+Ql/rW7RXqq7iljUdHVmk2LiAEAM0nIRmVXeOTAUBmOY4Y/H+dMXyvzcvbJuIEXXfMibldQzsSRuqd0I54EltD6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7010.namprd11.prod.outlook.com (2603:10b6:930:56::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Fri, 31 May
 2024 16:12:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 16:12:23 +0000
Date: Fri, 31 May 2024 11:12:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: Update Xe driver maintainers
Message-ID: <vqghuk2q6jpvymfo5vudcuc5tku32ovxjooxquztqqy43yvn3g@vzhmjrouo3kp>
References: <20240531141051.504610-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240531141051.504610-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:303:16d::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: 45458c4c-b6df-4f5a-a45e-08dc818c74da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4XY24jR2BV5suVOEL/UxOmmWwAyUd1q44qoNRguIKzO4NLog2yY1z88Ao1?=
 =?iso-8859-1?Q?7EfujmwxUwZ0nWwMuh9nc/pXfZJevSrL6o470+zSpTQ80YxvpQS9z/8SE4?=
 =?iso-8859-1?Q?U7bN9yTzDk/WHUIi/yVx7CAq266AIasTQFwGymp+DQwIW2y1IlnOIlGpPG?=
 =?iso-8859-1?Q?0WywZjcmgB+MeZm4iFepQ8Z+UapKmb/QK5fY6p2C2rjkmh8mgdqEe6jrP6?=
 =?iso-8859-1?Q?W+ZHuyz8kURCJiPSZ7CT5kwe5USt9lXi9NfXOleOgihvYLy7KZgwK9uh5V?=
 =?iso-8859-1?Q?cSEboEwjDOk7/SEpuPQ1dJb6gv/yQfqBWIvj1+cHM3YPAUQaDapwLC6IaU?=
 =?iso-8859-1?Q?vnVflE58SYroGP1eGsGrDJNRN4NC7c8aYhFESQaeIwpmC/GlKyZgWjEiVT?=
 =?iso-8859-1?Q?21XwVvin1y3B7qhKL1Vh4u7x01tuivz4mugnShhPj7Xlxxpy75CljhM7qd?=
 =?iso-8859-1?Q?psFo+xmoa9jgYY56fbNqbpbenbdvTRPE4fUlpeLnX9dBc3RrQYwc40Ec7D?=
 =?iso-8859-1?Q?E1CA8ffgMgBTiazxuowWJhCyaf5HHSwhtAzEMmhALM7Bq3jLGSBkKuc+UW?=
 =?iso-8859-1?Q?JFcXfUd2pdXT445xUuBF+iLwwo31hiYy58l7DvlLbfMTQrBsUbyaYFP/vt?=
 =?iso-8859-1?Q?+frSrTgk1dg7lRpN08394cWddPsse4VJOYQTFlP5P+Pvwwsw/IYv7yxRcT?=
 =?iso-8859-1?Q?irE7bAofwYjea5PrOMHlVd5HhVgXrya/U9ASVlwrPS0MXqt+iHVwNnHTy9?=
 =?iso-8859-1?Q?qa/hazMLIr+VsYKMdvDtJfaXlzyfzfdauHgSYrdAUi1XVzMiTeCwFaHE2F?=
 =?iso-8859-1?Q?ZUJX780EHjvo8aXePteSaZ8t0TQ1JF3JzSYReNoRFQtTyX+sSYEcmMZ5ql?=
 =?iso-8859-1?Q?4Nckyb98sOQUoApiOmvhy4JVcboZYHVmkgMcQMP3oK7ZfrWRcgj3ooecD/?=
 =?iso-8859-1?Q?CpYPBERwzKrO/mzBYMS90SdEdLPvxJ+3/vY1rWdV2DLUeUueKQsdsHen58?=
 =?iso-8859-1?Q?HPLgFfKxw32ntPszcL7WrzCSVE5vghmHexQUvLz6hnyDjsunHSzKN5il5j?=
 =?iso-8859-1?Q?hAlPXWa8iJO0S7C39SvPXJo6gIMtQbGaaU1ml/v9oWOtJrnbBaixJo5pXt?=
 =?iso-8859-1?Q?NMXn9zK8cfIZINTt5ml0f5K6EC4az2FWv18tjkhTEm6OLOptgrji+6IaR2?=
 =?iso-8859-1?Q?WqphjLEExrppB8uSFn+RF0vvk7cb+GSVrGfKsAjN315UkdvzoKjujxRlJs?=
 =?iso-8859-1?Q?GuSbMXsR0pSfPCodiMnZ3lWVuHEWaKLP84XjjxzbQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vhLeGp8rVKTNAOMa/8S15pMQCI9E8pCXgK5g7Rkro0J72XdPGlFNRNUQhr?=
 =?iso-8859-1?Q?LqKScZ3LL13xSzYCOKnKpVtg7To/gheRG47lsgOJ0E9o4M3ZQ+RKF0DGRn?=
 =?iso-8859-1?Q?yW3IO06nfRXdPW3Gt3Eomn+EtX3goBLziNpK6MDJ2/p6ZxasWSlvNDAYQV?=
 =?iso-8859-1?Q?XFxoihV6sFSXbOeA5K4hLmde8R3pY8J4OEOTd3f9DQ0e1glpsdUVT8imY6?=
 =?iso-8859-1?Q?+CmMkJ7ArI/uqciY3NsMgFRCFDFC8Kad+6vQRt1i2Z/+kUgUmU9yloSJ+U?=
 =?iso-8859-1?Q?uyGfMhYWMwJZleyRo7C+XYZOZgRhkD/xbVdTS5wjP7NCxgg+HbXBV6sO3+?=
 =?iso-8859-1?Q?G0l1Q8FYYIkfpqrAiWnyA1lfy2mkmPbIvOS6rq97DoWJhpgKPYgRQGxSRS?=
 =?iso-8859-1?Q?6LfVoTsMWarUSOHqqZ9WjCMOdWbeSUML7CUHiFWZmYgeXyBJoad3RobKD/?=
 =?iso-8859-1?Q?4IFvujiypgWu+X38ihByJyv3TS1y9rz0vcbyY/2EfMrwTBYs11J8y5vI8n?=
 =?iso-8859-1?Q?jXnF9BSzXZnVPKtgduTHGN3dMmbn3CAqBmx9T9dZwstNuznboS2dgCU17j?=
 =?iso-8859-1?Q?ryyZEACBGC0XUOMAg5utz431uXSMhw6iqa0sWbzrqbJ4UokPUFYgEZ+xL8?=
 =?iso-8859-1?Q?u5gL5jnpbe1282aVM0AijXsASe/ZchWKjT7FROfgbiqxkQTaYK0a9McKfl?=
 =?iso-8859-1?Q?XL0LkOt1TsoN03i/w9CgoVxVIN20fU+1Qcdur8OX+APFE8PnT8kM3d/r2C?=
 =?iso-8859-1?Q?XfWjv9SEn0MgFjj8LJ9QekPYyDA99Y/XQCFc+nj8SCo4DSCCemMvnDvYs2?=
 =?iso-8859-1?Q?PfergSR31zA5iEX6Um0NpSlUrdHgLjClWB+HDdEpTAmB2Q2wWEh7FZ9wsN?=
 =?iso-8859-1?Q?ZLxzl2nJCOOZMcUgceuuyr4IFmQSHrMyHAA3vN+xkrkHII6I2BQVaNtEaC?=
 =?iso-8859-1?Q?erxjiop7v4vRH9tQCXa+5qN0mMnYs/7BgfI5XXjb67rs8VMWujYoD6wx/j?=
 =?iso-8859-1?Q?8Q2V7iGuMFjyoVbr7sPvhTj3TwPX4lE0MLF+VpiCAXFpMP1DgTev165tJg?=
 =?iso-8859-1?Q?bbjGey0W/PkOf19FiK8BUWOCpk/17MgtEK3eD99vaKUecmHs0CF1U4Laxb?=
 =?iso-8859-1?Q?Rw5qyzYVZ5wVoaKOxvHrt02HUez+31RiK8/oEs1wDJdnVc9z8wZ0waTQIg?=
 =?iso-8859-1?Q?QV/JgrsivtkXZkS7rH/Ao0ARPkBU/8d08do7e/Ic1U6xJaMlYq4J62H8NU?=
 =?iso-8859-1?Q?5sz6CyMc0aLiu8nQVs6VHo6HbpcElRERofj1ZW07PcXi84K4OPviDCz9N2?=
 =?iso-8859-1?Q?zbxhvCFuKQVEIyGhrJgRJ/pvTkmgwfcpC5qzZCqvEH+Z+wtFFjAsQJDMQ+?=
 =?iso-8859-1?Q?sTaOzpuxdbDPoGlTclUO8YebVqRzfPMHVmwq01QNR+XiihJuzXEqNVgqCf?=
 =?iso-8859-1?Q?+czDL/nSOG3N54pRQIRc2jLmP5aFct1ZFvo2H9bWxVfwAby149PbaPEF4m?=
 =?iso-8859-1?Q?+mDS0LI16Du1iFHMjqzjQcUTnHllIDfxlhakWX8+GE+F1BwTQ+S5c7uTOI?=
 =?iso-8859-1?Q?IOzRLyt1JaFWJ/9U8AHK/CHvRK2azQBnibFSOeLPULq8/E1YOpP6sFnT3c?=
 =?iso-8859-1?Q?kcE9DtawAMMFGrHgju4XLE2KsTez36tggGuM2ufR2T2VjMyjc78HatKw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45458c4c-b6df-4f5a-a45e-08dc818c74da
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 16:12:23.7397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6nga53YpTUnd6YTomcQve8Kirh7GPNOPvgibYT0lluaOJ+4G/P1yLdSh9kkxR8DoC9yufHhrUxAPsXkA0Er7VTX7t98J6XMwLdUvoCRj0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7010
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

On Fri, May 31, 2024 at 04:10:51PM GMT, Thomas Hellström wrote:
>Add Rodrigo Vivi as an Xe driver maintainer.
>
>Cc: David Airlie <airlied@gmail.com>
>Cc: Daniel Vetter <daniel@ffwll.ch>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: dri-devel@lists.freedesktop.org
>Cc: linux-kernel@vger.kernel.org
>

shouldn't have a blank line here. Otherwise git doesn't consider the
lines above as part of the trailer.

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>


Maybe we should also add a

T:     git https://gitlab.freedesktop.org/drm/i915/kernel.git

on the display side so we direct display patches to go through
drm-intel like we are currently doing. But we can leave this for another
patch.

thanks
Lucas De Marchi

>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>---
> MAINTAINERS | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 572be0546e21..8f9982c99257 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -11037,6 +11037,7 @@ F:	include/uapi/drm/i915_drm.h
> INTEL DRM XE DRIVER (Lunar Lake and newer)
> M:	Lucas De Marchi <lucas.demarchi@intel.com>
> M:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
>+M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
> L:	intel-xe@lists.freedesktop.org
> S:	Supported
> W:	https://drm.pages.freedesktop.org/intel-docs/
>-- 
>2.44.0
>
