Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2F787671B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 16:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1971138F4;
	Fri,  8 Mar 2024 15:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HoTcdU5Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBEA1138EF;
 Fri,  8 Mar 2024 15:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709910781; x=1741446781;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dMGcZz0pvTtpPEXoiBLgZc6hs/2ABWk07jQQhHRbCQI=;
 b=HoTcdU5Zuna5Uym6EM0R2kHkpptRP8ccSluSkXTQE1Fxv5yv6JgsDc+M
 mZz4bk5Oy4xwSqz+4M28sfOpir87++WXs7+/XmqqvnxJ4W3IFj2EgJpET
 Wi/KhkdUnu0ddZE3fd/6ABR7ZC/AKeL2V1Axjpv8b2APy1W3vtFJXbAz4
 4iDH1CYq1+Mhl4uH2/FHyIPL8O0AMMRGuM9plrz1Wt+h39czgqhp8y/m2
 NG3N7vBJqscLpMoSGX6P149Eo09P/T2ragQVbWwIukc+dLvOYZhhJ4Zpx
 NauiIZaVBTHeTqqNK7vf+q/FyRyzv9ZEZR9FAIU7Gq2TQsknzgH4RMYBb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4477091"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4477091"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 07:12:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15188264"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 07:12:59 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 07:12:58 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 07:12:58 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 07:12:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LigYCj9bQM27+IUijoiHQ2Mo81nEByq67ONpOlXdHyB1wM2q66AexKEITMgToF2g6bJiQwSXZLxx7zk+leo45f3YT487lpHkqGqn+m3NuZBd5CInfqCZCV417jl3cX2wTLpDQU7L6eO4zvD85FGeHCXO5dDuvzXq1F0B82i/IeSnQbxSEHFNuPMFtMndj8Aa7VeRRquSGBlcF7qdYOg0JZNbA2zdQ7p0KtO28zfhfdgomaaKvAu88NI2SA+MwKlbFpFzw10acf2u31ThEpY7rOrmsuCgMeO0IDzqIMtHW45EFWVJ5tcIOBQgUXo0NFVuGSPwZ4G+SUd8nod1Yv5jSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2Z8Aaho7cSVc7ky0Ek95Syf3icSyDFdCMZhaAYEe0Y=;
 b=czoPed29u1Iib/KbAdgrELkuLPXOhS16+g0p7jiq+OcJuKXsUhMyjv0vgjcrErsUy77DwOG6lDXRitkVN9WML0cJCk8drZHMalzEWUvYAXFM0By3Hu5VDpLrUGmWuIe2XFtiqu/ym2Xm+crJeobvH6WzPgrakWaqis46CJ4YLJ33HavCoi0AE76Ae5Vbk6Ov8YTJsfThFZ15925H3d36PtNr9usnS+GqDGed6J4CwUno/MJwcNpczKt6Rr0mL7795S0i/ru+g8ZhFzGa0FSFKiz41pOtVW5krcTJ1rgDp4Zm2ASbujHzIgMuOAQYC4CVpChJbtXgcleFBONRt/r5og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4812.namprd11.prod.outlook.com (2603:10b6:806:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.8; Fri, 8 Mar
 2024 15:12:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.006; Fri, 8 Mar 2024
 15:12:56 +0000
Date: Fri, 8 Mar 2024 09:12:53 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Masahiro Yamada
 <masahiroy@kernel.org>
Subject: Re: [PATCH v2 15/16] drm: avoid includes in drm_crtc_helper_internal.h
Message-ID: <q252pusyd7c6awvx7rw67d5haqltbw74i2sk44yu4dyqxpsmky@4xpcdpw2ibfg>
References: <cover.1709898638.git.jani.nikula@intel.com>
 <fb7fb2986e19f949bf3a9b16230a59e0f7aaebdf.1709898638.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <fb7fb2986e19f949bf3a9b16230a59e0f7aaebdf.1709898638.git.jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR13CA0108.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4812:EE_
X-MS-Office365-Filtering-Correlation-Id: 342edcb1-a65d-44c0-aa9a-08dc3f823bd3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EosaK//vlhh5r7Vl6KvX++z/6AxAlgOQmGO5uFLzs6+aqfGZjv81StL5J7A2MOa/lMqV0r/kdscjQ84Oss/29sDpcAaIgmd7rk0V+OPFzyXpQoPYwB8vf+prmaKHQmZ21kVw1N0SnnZlrM7TRre854i7NXqpFH8KLmvIX4m3F6o+D4e0H6tqTp1it7jg/vN40cvMyTQjq3Y3rro8VERhzxynUyZot3UOrKuf2Eb5Cs5e9DijYGGKn9th+A12+FNCtNxcQU4Pujd7fowvKekpJznemi655KjASSgZ/VsFrP4NVVjz4FMRYz6M1xlfOklrGZaAwVjoxbfjoIrtcbrxsMEQ2D2Fwx7QEbwjSEXu3EJYJRSPp4YAdybSvc0/mHblNfx7D/Wxj3V4cw/UTzlDSQ56YNbYpRbr1dc+dV6h2fJjAu54ZEStPT7KF8HXlxp3uU4RYp69Xq9PGA1Ow9GU3Z7PWeMGAwRiS0o+qubjWBVVUHzFRWAiu/sgXL4MrJU22tceYEbwNLC6hKW7VaP2ceizoN61aMoMtMT6mcNRj1fjSiIOH+CEIDAHUz6rzNDc6djASOiPzkHtk1EdbOkcKtBkLNVIOSIpIaiJyhXIlwkQLkyywrBzMrktrusucl0bkhWa+3yWyoCuNchc4CT/eWrqBr/rjg+RJ/GApqKd/tI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ydV/nL5hbyk+QyfGPIjXfnouQe+y51ygQHaJUIISeO6v60TI4HZ3OZx9bzzp?=
 =?us-ascii?Q?gpdZe0CZzofyogRLgPaCmHznKrrGd2TsHdWgVl9Qpqo0VJM/6/GuIN3Hqmdd?=
 =?us-ascii?Q?7qurWRcxONEZ2yWghVj63hAefFHaDHxAi8J+oDI61VKyW6vDoiZ+iB6Xslsp?=
 =?us-ascii?Q?S1nTLy+lMgF2ohFzzKrenNkW0d7Yp9ZQHoUx1yP7NabzFgI9BFCKfNDTf0Oi?=
 =?us-ascii?Q?4mqxnHakXp6l1og2ajPvaZA2R1DHBSOo7psL6xEajhwd4QBc2iPBiZjYeFJr?=
 =?us-ascii?Q?jMK88rSh/5+UywRQlaGZsvCX3gGkyHF6K4K77Lry8NHR7v052VdydhIbtapO?=
 =?us-ascii?Q?v2qH1ERZtMVbQ1vYfZ8IJnxwhG1K6n7bOIeCoJ3/MJYT0V7UR7kMe0AJTj0F?=
 =?us-ascii?Q?K+IB0NNT00bw1JSYWj+0jGQ3W9UpmJzJRP4UlSVQuxUt5immLbInkCj74BKy?=
 =?us-ascii?Q?HyA+dyDCugN9i+iH2tz6afvHYAw/5rd6wROVjovw9yH7pNI/hL7Z8fh2EhhG?=
 =?us-ascii?Q?eW/vRCFA1LndwgXSA2oquvid3b70SgqW7NtPXaCE3Ps+4zWLXfloZ90xZn1k?=
 =?us-ascii?Q?SyP+2TmemY4ytQNfL1GJ3o20FnTYE5fXL+WGLxO8uWrYGsAGlLjXZeOBBoU8?=
 =?us-ascii?Q?q2/FdbJNmMKWdg0By3ICjt3Ryw0WLUC/HL9jL8ZsiWzOQZZ6HVMBNcWKVrra?=
 =?us-ascii?Q?9vuXruk7udt+6F5fgDECk2GPLEpApEpl8BSHZgF/oZArpmDzBaR5VU7l+0kd?=
 =?us-ascii?Q?h+8kltY7DCuXVU/dtXFGVvL/4YKPKCuHBRJFjFA94oJGD37ZZtHwmv1Noqln?=
 =?us-ascii?Q?bsREteoRPWwpUPJImQblywNP+SYIN8/4KDtudFi/w1BZK5nHI7q+VUHlb3hc?=
 =?us-ascii?Q?+kbVtV+IwogbfC5MH+HfXKOIIKm8iG58sr46jxcHrftK27TikLZ+ioZ33rVM?=
 =?us-ascii?Q?STmCObLBY5DoOQCDhwHQRHqJgPc+ethvy9PmcB449o/T14SR+QucN6mo7xqR?=
 =?us-ascii?Q?7MFiZ/G9GXXCZcC1J4/VEwfuo7l8ONyDS4ej7jtUdzCkYVGCprx85F88OOxY?=
 =?us-ascii?Q?tqOx3aaRg4fZKpLIpZ2hpQWywH3MF6GlRt2ZImBkTz4hvGybZZNiBVrGfSKN?=
 =?us-ascii?Q?NUcE55w0HkRpn8O+bpWxSWreOEmTFzEaUVeu4MqkHGOPu7hc4ZXCe4KVf7J6?=
 =?us-ascii?Q?uBoaLnJ/x+ZXWyIwmobYdhn+iLRbPInG1E3l5fwLcPTo5yNjut7KNSQ8kckG?=
 =?us-ascii?Q?+EBNWp9OilaBNKvEmYbP0oM1hkzlVdzrPTQ4nwtDXBCPDKJiNrrKfJKfk8I0?=
 =?us-ascii?Q?NvRkviyyNwCLKonyW1LBU9Vs4caxLB0ujOZj3HjDNzKGCxf+ljb8XBB7xU4n?=
 =?us-ascii?Q?4y/RP+6JtBt5UshoxxbUyX4I6WHsn3Y570+6XPHJrGmPWu8WJelg/pr35Phi?=
 =?us-ascii?Q?Byvyjv6nsfX6Wyb0Cmuo7YUjEXg7AxPA2/7tSLasQvnKJK3iUQQoUOC5PoJP?=
 =?us-ascii?Q?509HuPqF4/z8CTn0qt7VAaYHD8QdLWPYOVLrI+KEZRMZWme/A7+EdikhyDHu?=
 =?us-ascii?Q?3jM8CR9tLWzE9ZDm3eHbTpe1WsO5cKzzMwqD9qtkfmBGQ421MfQDFlmX+QCg?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 342edcb1-a65d-44c0-aa9a-08dc3f823bd3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 15:12:56.3149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxOk/zDIfimEE5APnAhzsz0+CHVb4FnE6KvcYdyTkGBuD8JOMnvK/0O9DR7wdFPMkwmWMwfxjNtSexnJNfAHU5Fjp/aCZ/D86cKLgmH6+aU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4812
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

On Fri, Mar 08, 2024 at 01:55:53PM +0200, Jani Nikula wrote:
>Prefer forward declarations over includes where possible.
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/drm_crtc_helper_internal.h | 10 ++++++----
> 1 file changed, 6 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h b/drivers/gpu/drm/drm_crtc_helper_internal.h
>index ed4deed07abd..8059f65c5d6c 100644
>--- a/drivers/gpu/drm/drm_crtc_helper_internal.h
>+++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
>@@ -29,10 +29,12 @@
> #ifndef __DRM_CRTC_HELPER_INTERNAL_H__
> #define __DRM_CRTC_HELPER_INTERNAL_H__
>
>-#include <drm/drm_connector.h>
>-#include <drm/drm_crtc.h>
>-#include <drm/drm_encoder.h>
>-#include <drm/drm_modes.h>
>+enum drm_mode_status;
>+struct drm_connector;
>+struct drm_crtc;
>+struct drm_display_mode;
>+struct drm_encoder;
>+struct drm_modeset_acquire_ctx;
>
> /* drm_probe_helper.c */
> enum drm_mode_status drm_crtc_mode_valid(struct drm_crtc *crtc,
>-- 
>2.39.2
>
