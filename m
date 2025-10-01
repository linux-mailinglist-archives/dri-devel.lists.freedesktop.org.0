Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52131BB1059
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 17:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAA710E72D;
	Wed,  1 Oct 2025 15:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROd3hOpr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670B610E0B4;
 Wed,  1 Oct 2025 15:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759331936; x=1790867936;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HBq8WjvBbbz3i3EV+gMM8ZZzSQiYTXRkvJUdYqDti7o=;
 b=ROd3hOprrxKZ7vNIrxvVChH/9eDs8hPWHganmNeOV7JS/MEjEwxREOLX
 sW/IEY+sm1bomjNdYwL3HPMqXOeYMiGpfjlLlEIu3obTxt16opNegRjD1
 JOSzJFeXIyjCR2cSBAiyb8N3RG3NOepHnNII9+Wt7Zs0zbUIGvbOnoMtR
 PRNx1N5gJCbhzdwo0J8rtFwoLV1vbYtFScu4HhGytRiHh+NWIYJo5j4dj
 ZhLVDCHaL/+BGg84CrOS0/UlHvvL/xqhe0/ggdrJrgN0pIqoGQa2TPaez
 Bavo1W9kGRRXxbkuMwsj0ppaVX0PYNez0m54+rNPArN8zPLPhnUZ5JCLn A==;
X-CSE-ConnectionGUID: tunsWiBOQgi8tJKi/On3kg==
X-CSE-MsgGUID: CbN/I8ypRM+c6zRYc1zQIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61772829"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="61772829"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 08:18:55 -0700
X-CSE-ConnectionGUID: xUQvthrVR2mwXugJp5uepA==
X-CSE-MsgGUID: nOZBjSQySEmAQaB8gD+Zvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="178759121"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 08:18:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 08:18:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 08:18:53 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.57)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 08:18:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ym0aGe814JFR8hFr0Dv4PyaIVLOgh3yvw9GIkWpYF9UHKkFT9mP20pCwRIJGVttAOFCeelm9KGOiMR4riU+9KF3H40zJpDL6ePSVg2J4QV3AJbeoxEUZGoIVhkPn7OKIpMIaVg2nRju7kkO+xUiErM/vyyHxL6UEwen7KfdMacv4gniJA6aBjkkSVv4G5nw8KiMOuQPH73Y8wK2jbc9bUdHOhivaVEscwbFq4rwNQaoEdXnryDwWIgdBwMwU9ROjpbWqMYBH+LNlMN+laH+oCDR1nkAuTrWyFkZ/N+Q+mET+Ef5CnraA106Fm9XUDNiWWTuPxMsa0V7ny6s7fPYXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpdvHcEiLbCcVLulLn2vc9PaUioaPKxoVejoTujbixc=;
 b=W+T8ilXwlFBMmwYyLMCltD9FWGmoFRXy9J4RcFQMv6qOWnLA08yfzF4nlQMeO2UcYAu3Lmge9ZgKCtxwrNxuVf/o7teizpHhP1Z4Fq5lwF8/05H9qQ0fiH7gFJnTRCnEJ0hLT3me/eb9NWr+kF3dnCOMuG5vIyaS+QaHo8YId7TGLhDnK2ORZLcsDzTXbUi8gZC8xD/IDDxfNUbIIHInr14b1eTPmbzW3m9xh3SxHHAmxFK/1Ms8Vh8FF6jc9RjZrwrHUot+ZznxwwBWRjoHyLEWCoyZLqKY+ZEboIWb/a5gD6pKxKVl6KduyQtBIaPyYpfe7mt06tQd4YPvWsb20Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7261.namprd11.prod.outlook.com (2603:10b6:8:13d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 15:18:49 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 15:18:49 +0000
Date: Wed, 1 Oct 2025 11:18:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <lyude@redhat.com>, <dakr@kernel.org>,
 <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <jfalempe@redhat.com>, <javierm@redhat.com>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/client: Remove holds_console_lock parameter from
 suspend/resume
Message-ID: <aN1GU86CMXmikbua@intel.com>
References: <20251001143709.419736-1-tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251001143709.419736-1-tzimmermann@suse.de>
X-ClientProxiedBy: SJ0PR03CA0060.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e9fbf4a-27f9-4797-e274-08de00fdd298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kXtP7Pc4rPKlFZpiSKwiNik6JlflhyXuVNyNu4pslUZfRxXbH7AkIMTjilr3?=
 =?us-ascii?Q?0p39sH9ZNu9nZc8QGHWplcVS6KIIOjDHIDXC/ybinUSXYGaa6NQ3SZ0LDZJQ?=
 =?us-ascii?Q?HUGgjhyrPejO/1mKZfVP6M62Nwg28JQXQkbpBcedI+AwZ6OhDaRnWH42zVDZ?=
 =?us-ascii?Q?AIBjed3hDoOifa0IDuneM4rd10zuUdT4CQRfeysY7L8xyLA+FpMSvHfjDHvN?=
 =?us-ascii?Q?4lLgk0GTLFL6m+FvwOcuA8uUTGPtbFr6myIK3wd9rvj4SofGfuR/vu0ORU2L?=
 =?us-ascii?Q?GM8gUvo9IbZo1xsUau9ioaxNCW3PHWY4LbvwBzgy4nDUsyEDh+I0ISjXPm+V?=
 =?us-ascii?Q?f7glDNdjpBIf1cMZzonnY1fC6aDmLVIR7CiRQf+0wZVDHz5yW+KzA2fgPiLs?=
 =?us-ascii?Q?Uf5n9n8yHLhLgJ2ST7g2NL24bx+Vhod+1w2gHGjRSV+9zhwWDnhYuD9pu8SZ?=
 =?us-ascii?Q?KsS9xwFUuSZkWA71FpR8CEb9NYC4WqVwRWJN/A9ggDr9UCI0IjnBmKjlaI9S?=
 =?us-ascii?Q?HYsCxnkR5Jx1v8F+hACrmECnCk6GnOvWmCzRiE5VgZdmC+UJBkkbXB7zvyoD?=
 =?us-ascii?Q?9hX4fzf6X9ksBOL0W3Lsj4BvjzYhzEsx2cEEUD9midIpLIMKFTeQ2E7H7Poa?=
 =?us-ascii?Q?Agtv7irouKWFvDiskLVaU+8o4c+3YneIe83NkeK54zvpnSWynEO22EENbqId?=
 =?us-ascii?Q?59YYlhscNco77o/P25b63a4kJWrpc09tb/1Opwt89thPMMmy3djNklpmkn/I?=
 =?us-ascii?Q?RIU9L2Wy+iDrbVh9eZsIUZlxA27ZYjX5UrOfXs5BbJn48er6MAUyj66cVK1b?=
 =?us-ascii?Q?aGy+pBHlFqYDEGJWlUrFdLx77PHHAFnaZT/pN/HYFIdsGgIOx45O2+COTLl4?=
 =?us-ascii?Q?iWmUTLiRCP/6SVaR2BYbR/nMvrXYFwRyOWBkNBs8szw+O3H0P8BJXkQ7pEl1?=
 =?us-ascii?Q?KFszg8PK+xrVDY2yrSma4+mUpOnPmoVkU8ttTQLzP8wdDiyZvrfMAXDYU/Fc?=
 =?us-ascii?Q?B4tL8VHwq3WeKfKkGy2Bx2lmn/QffuDjFPeRUlv/jlHIVsYzM9iL51ifXuX1?=
 =?us-ascii?Q?Eir9o7tSsoxC3GWkHmBZDX6sLwZQVXe7GPH0ZWO7RcUBf+vRBDAenJH08/xX?=
 =?us-ascii?Q?0uTslSi6LqMphQsDoLmSbEKQPmYNGOan2cQrM1a4nAUfIp0G2rbvmXKjYWKT?=
 =?us-ascii?Q?7w3WMlNHaczbxuRhyuA6T2P9WJu0DPYOMM8iwuxR3tPkVN+2fzdGYd5ILFoQ?=
 =?us-ascii?Q?CT4P2iZwCC8mU1gPJN2UhDNpP/MtcnaXUvO+mLFF6NVQVRhQGcKkL5bL2nB6?=
 =?us-ascii?Q?M9BODsqX29uXAfJ4TP54JF34XholHEYdOypk/AlN4TkTuIdtZn6WTK/ZZ3Bl?=
 =?us-ascii?Q?s2JjflHJlgjwi36v1DW2Nvqk3Ug8KbLkd96XBVM9PAs7XoQp5Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PUMIFDsTtKevKNFQrMHef2UjDv9CMDNYkXHWSw80obJ6gNaD64ki1POYByHa?=
 =?us-ascii?Q?+4fGu6EmDgjspEXtlcVlrstcKfIzQZxe97M19Q+rYShUwHrjNKJGQzEItt2d?=
 =?us-ascii?Q?DwJ9BWFRTY9sJPltwYkO6SGefj2lcUnK9LFMK3N9SoJB+fXwtB4cEGzAMX1i?=
 =?us-ascii?Q?LvGxKBLDNJmgfK2NC50JabaEJ8P8HZYIIxoyI7AZIT8kg6Ihxo8mvoWDwqjd?=
 =?us-ascii?Q?yPMhrB3x72hrzJmGTj8SoVzmD8D2nTraGa7voLjANduDDhTh7JJ9H7mKePa4?=
 =?us-ascii?Q?mf4uYPm3WejeK6jePMWQPTGNI0Dv1WxjzqKjn2H//Rdyhy9ALKgSf6ifnJcg?=
 =?us-ascii?Q?c+Pi2dZaNBOf/sSG89swJat+E9havprJyWuVOwKngOhyzAkPd30QEQxYQWnU?=
 =?us-ascii?Q?HNyJQDTRB2cgwjaGNufKL/iccscevaKGX4ld7Wd8Yco6dCkzuXm/avSG7yun?=
 =?us-ascii?Q?93ZDtw1+J5H10GHkbkiJDiY+WhUs+uCh7+l4591Hot9J48brcBIabYT+qcv4?=
 =?us-ascii?Q?Y66tlJusiesb+DgDzXy61By99lov6FUZ5xwyszkrjdVV+XsJe1PZ8OjpTKEK?=
 =?us-ascii?Q?4ZZ6W2hAt5w7emKwDC/8kmMbKU0Ijco/qV4YI59gYwyhzuX1OAb6EQWo0fSI?=
 =?us-ascii?Q?DXjXGCieRsqLd3JDECqqW1i62tGP48/uYv2fqwG7QFhOOb676B4MdU+FCEsu?=
 =?us-ascii?Q?OxCOM+PRK1DiT8uhnu4xaF85FS3bWUs+2DjvnBGYxYrtLkSTq7KxPapp0ELa?=
 =?us-ascii?Q?XJQ5POjlNSd4B46nYhwaVbs9RVyPTzdaFdIX+xdUa4+KrXbet/k2xSs2o3/4?=
 =?us-ascii?Q?sCB7GMAdi1BWf4v4ibGNX3/LO9QWbaIlUcxgqDPj3rAJU0/OUD/kA7tLDDU5?=
 =?us-ascii?Q?8vJCoaVUqRjvV1BuNgCJBJYmr0XEuz9BQ+Q6Zn+jpXlHWMyQ1jwWknsaYhro?=
 =?us-ascii?Q?1qpzpVn1eagyTQoG9Qm3TQ3ziVcnGk/wgTbzfxYDIVX+mZzWS/dXJQrSzV4e?=
 =?us-ascii?Q?TuRcITXrknBtnNLmeLi2eN3Ph3VkaSq9i6zQYopv/HxozAM9D+5Ai6gi9mdz?=
 =?us-ascii?Q?HDEUhK0dheoUQIDbROGfGIE02Fypx0O4AUE2MzBKEY90Zn6AkzZOxJZXHQ8m?=
 =?us-ascii?Q?Dpy3e6scqEVQ/A2JzOxSA+OicgmaFhudfhKcFRoWD1Iml8CpwVAD9u8ceQ/o?=
 =?us-ascii?Q?/9zXF2HzzS83d9uhwerMq/+KYx7xIk38Gl3wX1Gf36Zabm2slD06L0bKeYJs?=
 =?us-ascii?Q?QT+bGVD7lzUZ9/KXPKdROq7L658rYtwLTxwdY2nyYmT3U2fx6pkIplyydsV7?=
 =?us-ascii?Q?Tg4X92mEQmbvBJ7DaG0DshZbSZ5NpwH5Cg4b3hPPZm+UkKahkRsnL3FJZDnh?=
 =?us-ascii?Q?KQ/Us0DOpow9XM7xHRvxVOGx9Drr4auIrFqOCoc+YIQG55BOpnCdqYt+hdCY?=
 =?us-ascii?Q?WZ7YPMfKDZ9xsGjkkRwOxSUZ4rrl+CrAPEZFzYu7lMXUt+ybjEwLpxuCUl+Y?=
 =?us-ascii?Q?c+V0jkPLmI3GL0E1VFiN7c562oE4ll0zGlDrjyjPCWTQ25/+qWN80wSTEI7H?=
 =?us-ascii?Q?OntHS/KWf9+fA3GfJZ4PWzLh3mu4iHBLiXz64WAW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e9fbf4a-27f9-4797-e274-08de00fdd298
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 15:18:49.5201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tr4YkrvLaMBhqPd8S4HX4uXwlGvhm6SP0LbAHdtwOxpkOFR4mfzOUxbqt7rk5zV0qpEbD79axjJibrL3N2A8Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7261
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

On Wed, Oct 01, 2025 at 04:37:03PM +0200, Thomas Zimmermann wrote:
> No caller of the client resume/suspend helpers holds the console
> lock. The last such cases were removed from radeon in the patch
> series at [1]. Now remove the related parameter and the TODO items.
> 
> v2:
> - update placeholders for CONFIG_DRM_CLIENT=n
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://patchwork.freedesktop.org/series/151624/ # [1]

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
(for both xe and i915 changes)

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  8 ++++----
>  drivers/gpu/drm/clients/drm_fbdev_client.c | 14 ++++----------
>  drivers/gpu/drm/clients/drm_log.c          |  4 ++--
>  drivers/gpu/drm/drm_client_event.c         | 16 ++++++++--------
>  drivers/gpu/drm/drm_modeset_helper.c       |  6 +++---
>  drivers/gpu/drm/i915/i915_driver.c         |  6 +++---
>  drivers/gpu/drm/nouveau/nouveau_display.c  |  4 ++--
>  drivers/gpu/drm/radeon/radeon_device.c     |  4 ++--
>  drivers/gpu/drm/xe/display/xe_display.c    |  6 +++---
>  include/drm/drm_client.h                   | 14 ++------------
>  include/drm/drm_client_event.h             |  8 ++++----
>  11 files changed, 37 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index a77000c2e0bb..f068e26d5080 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5212,7 +5212,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
>  		dev_warn(adev->dev, "smart shift update failed\n");
>  
>  	if (notify_clients)
> -		drm_client_dev_suspend(adev_to_drm(adev), false);
> +		drm_client_dev_suspend(adev_to_drm(adev));
>  
>  	cancel_delayed_work_sync(&adev->delayed_init_work);
>  
> @@ -5346,7 +5346,7 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>  	flush_delayed_work(&adev->delayed_init_work);
>  
>  	if (notify_clients)
> -		drm_client_dev_resume(adev_to_drm(adev), false);
> +		drm_client_dev_resume(adev_to_drm(adev));
>  
>  	amdgpu_ras_resume(adev);
>  
> @@ -5951,7 +5951,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
>  				if (r)
>  					goto out;
>  
> -				drm_client_dev_resume(adev_to_drm(tmp_adev), false);
> +				drm_client_dev_resume(adev_to_drm(tmp_adev));
>  
>  				/*
>  				 * The GPU enters bad state once faulty pages
> @@ -6286,7 +6286,7 @@ static void amdgpu_device_halt_activities(struct amdgpu_device *adev,
>  		 */
>  		amdgpu_unregister_gpu_instance(tmp_adev);
>  
> -		drm_client_dev_suspend(adev_to_drm(tmp_adev), false);
> +		drm_client_dev_suspend(adev_to_drm(tmp_adev));
>  
>  		/* disable ras on ALL IPs */
>  		if (!need_emergency_restart && !amdgpu_reset_in_dpc(adev) &&
> diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/drm/clients/drm_fbdev_client.c
> index f894ba52bdb5..ec5ab9f30547 100644
> --- a/drivers/gpu/drm/clients/drm_fbdev_client.c
> +++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
> @@ -62,26 +62,20 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
>  	return ret;
>  }
>  
> -static int drm_fbdev_client_suspend(struct drm_client_dev *client, bool holds_console_lock)
> +static int drm_fbdev_client_suspend(struct drm_client_dev *client)
>  {
>  	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
>  
> -	if (holds_console_lock)
> -		drm_fb_helper_set_suspend(fb_helper, true);
> -	else
> -		drm_fb_helper_set_suspend_unlocked(fb_helper, true);
> +	drm_fb_helper_set_suspend_unlocked(fb_helper, true);
>  
>  	return 0;
>  }
>  
> -static int drm_fbdev_client_resume(struct drm_client_dev *client, bool holds_console_lock)
> +static int drm_fbdev_client_resume(struct drm_client_dev *client)
>  {
>  	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
>  
> -	if (holds_console_lock)
> -		drm_fb_helper_set_suspend(fb_helper, false);
> -	else
> -		drm_fb_helper_set_suspend_unlocked(fb_helper, false);
> +	drm_fb_helper_set_suspend_unlocked(fb_helper, false);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index d239f1e3c456..fd8556dd58ed 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -319,7 +319,7 @@ static int drm_log_client_hotplug(struct drm_client_dev *client)
>  	return 0;
>  }
>  
> -static int drm_log_client_suspend(struct drm_client_dev *client, bool _console_lock)
> +static int drm_log_client_suspend(struct drm_client_dev *client)
>  {
>  	struct drm_log *dlog = client_to_drm_log(client);
>  
> @@ -328,7 +328,7 @@ static int drm_log_client_suspend(struct drm_client_dev *client, bool _console_l
>  	return 0;
>  }
>  
> -static int drm_log_client_resume(struct drm_client_dev *client, bool _console_lock)
> +static int drm_log_client_resume(struct drm_client_dev *client)
>  {
>  	struct drm_log *dlog = client_to_drm_log(client);
>  
> diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
> index c83196ad8b59..c3baeb4d4e6b 100644
> --- a/drivers/gpu/drm/drm_client_event.c
> +++ b/drivers/gpu/drm/drm_client_event.c
> @@ -122,7 +122,7 @@ void drm_client_dev_restore(struct drm_device *dev)
>  	mutex_unlock(&dev->clientlist_mutex);
>  }
>  
> -static int drm_client_suspend(struct drm_client_dev *client, bool holds_console_lock)
> +static int drm_client_suspend(struct drm_client_dev *client)
>  {
>  	struct drm_device *dev = client->dev;
>  	int ret = 0;
> @@ -131,7 +131,7 @@ static int drm_client_suspend(struct drm_client_dev *client, bool holds_console_
>  		return 0;
>  
>  	if (client->funcs && client->funcs->suspend)
> -		ret = client->funcs->suspend(client, holds_console_lock);
> +		ret = client->funcs->suspend(client);
>  	drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
>  
>  	client->suspended = true;
> @@ -139,20 +139,20 @@ static int drm_client_suspend(struct drm_client_dev *client, bool holds_console_
>  	return ret;
>  }
>  
> -void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_lock)
> +void drm_client_dev_suspend(struct drm_device *dev)
>  {
>  	struct drm_client_dev *client;
>  
>  	mutex_lock(&dev->clientlist_mutex);
>  	list_for_each_entry(client, &dev->clientlist, list) {
>  		if (!client->suspended)
> -			drm_client_suspend(client, holds_console_lock);
> +			drm_client_suspend(client);
>  	}
>  	mutex_unlock(&dev->clientlist_mutex);
>  }
>  EXPORT_SYMBOL(drm_client_dev_suspend);
>  
> -static int drm_client_resume(struct drm_client_dev *client, bool holds_console_lock)
> +static int drm_client_resume(struct drm_client_dev *client)
>  {
>  	struct drm_device *dev = client->dev;
>  	int ret = 0;
> @@ -161,7 +161,7 @@ static int drm_client_resume(struct drm_client_dev *client, bool holds_console_l
>  		return 0;
>  
>  	if (client->funcs && client->funcs->resume)
> -		ret = client->funcs->resume(client, holds_console_lock);
> +		ret = client->funcs->resume(client);
>  	drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
>  
>  	client->suspended = false;
> @@ -172,14 +172,14 @@ static int drm_client_resume(struct drm_client_dev *client, bool holds_console_l
>  	return ret;
>  }
>  
> -void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lock)
> +void drm_client_dev_resume(struct drm_device *dev)
>  {
>  	struct drm_client_dev *client;
>  
>  	mutex_lock(&dev->clientlist_mutex);
>  	list_for_each_entry(client, &dev->clientlist, list) {
>  		if  (client->suspended)
> -			drm_client_resume(client, holds_console_lock);
> +			drm_client_resume(client);
>  	}
>  	mutex_unlock(&dev->clientlist_mutex);
>  }
> diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
> index 988735560570..a57f6a10ada4 100644
> --- a/drivers/gpu/drm/drm_modeset_helper.c
> +++ b/drivers/gpu/drm/drm_modeset_helper.c
> @@ -203,10 +203,10 @@ int drm_mode_config_helper_suspend(struct drm_device *dev)
>  	if (dev->mode_config.poll_enabled)
>  		drm_kms_helper_poll_disable(dev);
>  
> -	drm_client_dev_suspend(dev, false);
> +	drm_client_dev_suspend(dev);
>  	state = drm_atomic_helper_suspend(dev);
>  	if (IS_ERR(state)) {
> -		drm_client_dev_resume(dev, false);
> +		drm_client_dev_resume(dev);
>  
>  		/*
>  		 * Don't enable polling if it was never initialized
> @@ -252,7 +252,7 @@ int drm_mode_config_helper_resume(struct drm_device *dev)
>  		DRM_ERROR("Failed to resume (%d)\n", ret);
>  	dev->mode_config.suspend_state = NULL;
>  
> -	drm_client_dev_resume(dev, false);
> +	drm_client_dev_resume(dev);
>  
>  	/*
>  	 * Don't enable polling if it is not initialized
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 95165e45de74..162e50315beb 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -978,7 +978,7 @@ void i915_driver_shutdown(struct drm_i915_private *i915)
>  	intel_runtime_pm_disable(&i915->runtime_pm);
>  	intel_power_domains_disable(display);
>  
> -	drm_client_dev_suspend(&i915->drm, false);
> +	drm_client_dev_suspend(&i915->drm);
>  	if (intel_display_device_present(display)) {
>  		drm_kms_helper_poll_disable(&i915->drm);
>  		intel_display_driver_disable_user_access(display);
> @@ -1060,7 +1060,7 @@ static int i915_drm_suspend(struct drm_device *dev)
>  	/* We do a lot of poking in a lot of registers, make sure they work
>  	 * properly. */
>  	intel_power_domains_disable(display);
> -	drm_client_dev_suspend(dev, false);
> +	drm_client_dev_suspend(dev);
>  	if (intel_display_device_present(display)) {
>  		drm_kms_helper_poll_disable(dev);
>  		intel_display_driver_disable_user_access(display);
> @@ -1257,7 +1257,7 @@ static int i915_drm_resume(struct drm_device *dev)
>  
>  	intel_opregion_resume(display);
>  
> -	drm_client_dev_resume(dev, false);
> +	drm_client_dev_resume(dev);
>  
>  	intel_power_domains_enable(display);
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 54aed3656a4c..00515623a2cc 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -765,7 +765,7 @@ nouveau_display_suspend(struct drm_device *dev, bool runtime)
>  {
>  	struct nouveau_display *disp = nouveau_display(dev);
>  
> -	drm_client_dev_suspend(dev, false);
> +	drm_client_dev_suspend(dev);
>  
>  	if (drm_drv_uses_atomic_modeset(dev)) {
>  		if (!runtime) {
> @@ -796,7 +796,7 @@ nouveau_display_resume(struct drm_device *dev, bool runtime)
>  		}
>  	}
>  
> -	drm_client_dev_resume(dev, false);
> +	drm_client_dev_resume(dev);
>  }
>  
>  int
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index 9e35b14e2bf0..60afaa8e56b4 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1635,7 +1635,7 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
>  	}
>  
>  	if (notify_clients)
> -		drm_client_dev_suspend(dev, false);
> +		drm_client_dev_suspend(dev);
>  
>  	return 0;
>  }
> @@ -1739,7 +1739,7 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool notify_clients)
>  		radeon_pm_compute_clocks(rdev);
>  
>  	if (notify_clients)
> -		drm_client_dev_resume(dev, false);
> +		drm_client_dev_resume(dev);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 19e691fccf8c..d3cc6181842c 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -324,7 +324,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
>  	 * properly.
>  	 */
>  	intel_power_domains_disable(display);
> -	drm_client_dev_suspend(&xe->drm, false);
> +	drm_client_dev_suspend(&xe->drm);
>  
>  	if (intel_display_device_present(display)) {
>  		drm_kms_helper_poll_disable(&xe->drm);
> @@ -356,7 +356,7 @@ void xe_display_pm_shutdown(struct xe_device *xe)
>  		return;
>  
>  	intel_power_domains_disable(display);
> -	drm_client_dev_suspend(&xe->drm, false);
> +	drm_client_dev_suspend(&xe->drm);
>  
>  	if (intel_display_device_present(display)) {
>  		drm_kms_helper_poll_disable(&xe->drm);
> @@ -481,7 +481,7 @@ void xe_display_pm_resume(struct xe_device *xe)
>  
>  	intel_opregion_resume(display);
>  
> -	drm_client_dev_resume(&xe->drm, false);
> +	drm_client_dev_resume(&xe->drm);
>  
>  	intel_power_domains_enable(display);
>  }
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index bdd845e383ef..3556928d3938 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -70,13 +70,8 @@ struct drm_client_funcs {
>  	 * Called when suspending the device.
>  	 *
>  	 * This callback is optional.
> -	 *
> -	 * FIXME: Some callers hold the console lock when invoking this
> -	 *        function. This interferes with fbdev emulation, which
> -	 *        also tries to acquire the lock. Push the console lock
> -	 *        into the callback and remove 'holds_console_lock'.
>  	 */
> -	int (*suspend)(struct drm_client_dev *client, bool holds_console_lock);
> +	int (*suspend)(struct drm_client_dev *client);
>  
>  	/**
>  	 * @resume:
> @@ -84,13 +79,8 @@ struct drm_client_funcs {
>  	 * Called when resuming the device from suspend.
>  	 *
>  	 * This callback is optional.
> -	 *
> -	 * FIXME: Some callers hold the console lock when invoking this
> -	 *        function. This interferes with fbdev emulation, which
> -	 *        also tries to acquire the lock. Push the console lock
> -	 *        into the callback and remove 'holds_console_lock'.
>  	 */
> -	int (*resume)(struct drm_client_dev *client, bool holds_console_lock);
> +	int (*resume)(struct drm_client_dev *client);
>  };
>  
>  /**
> diff --git a/include/drm/drm_client_event.h b/include/drm/drm_client_event.h
> index 1d544d3a3228..985d6f02a4c4 100644
> --- a/include/drm/drm_client_event.h
> +++ b/include/drm/drm_client_event.h
> @@ -11,8 +11,8 @@ struct drm_device;
>  void drm_client_dev_unregister(struct drm_device *dev);
>  void drm_client_dev_hotplug(struct drm_device *dev);
>  void drm_client_dev_restore(struct drm_device *dev);
> -void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_lock);
> -void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lock);
> +void drm_client_dev_suspend(struct drm_device *dev);
> +void drm_client_dev_resume(struct drm_device *dev);
>  #else
>  static inline void drm_client_dev_unregister(struct drm_device *dev)
>  { }
> @@ -20,9 +20,9 @@ static inline void drm_client_dev_hotplug(struct drm_device *dev)
>  { }
>  static inline void drm_client_dev_restore(struct drm_device *dev)
>  { }
> -static inline void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_lock)
> +static inline void drm_client_dev_suspend(struct drm_device *dev)
>  { }
> -static inline void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lock)
> +static inline void drm_client_dev_resume(struct drm_device *dev)
>  { }
>  #endif
>  
> -- 
> 2.51.0
> 
