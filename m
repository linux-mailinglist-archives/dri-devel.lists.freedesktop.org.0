Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B695CB1C66A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 14:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202F510E3D6;
	Wed,  6 Aug 2025 12:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j3fSG84Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AE310E3D6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 12:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754484939; x=1786020939;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=ceRm90Z3HQ3CFMwJV6yoOc9UBEidFaESA3k0sC+9Y5o=;
 b=j3fSG84ZjwcMUflolfvffDyczXL+t0njbleQN24XY3w+jzAHDUKrkm85
 SZ2i1UaeJvmPpJvhOMDB6OXqnAAMbMP1bLoj+5YdjVhwdMK46s7sZcndT
 VAkZnwXFoymnqIBRhbIr0SMEsc2KeeCHeQ93e86LHmd5nD5RielX0E3yN
 r2l8QFyTda6uoOWK0aOa1czLyMJTCYlAlB0/afAMLGc7Ipk3x3IMoIjzN
 T+GdXOocrVIJ8/+MT86YkYC638H5OmCsWflSn9J23RY3wdsDV/D2oVanO
 uzx9gI2nZ/enrWFaApP2qJjxy5LrwsQWpZnP1nXtffXbuchRPUD1j8zQw Q==;
X-CSE-ConnectionGUID: mZVrOAiaSLy8VhYHGbUpwQ==
X-CSE-MsgGUID: KvRF9kpNS9Kvrrjc4tsiSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="67876035"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="67876035"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 05:55:38 -0700
X-CSE-ConnectionGUID: eKvTjUHeTnSg6RuOlYMyIw==
X-CSE-MsgGUID: DQ8kZEs8SuK+JeRLOyV9FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="201935457"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 05:55:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 05:55:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 05:55:37 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 6 Aug 2025 05:55:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nO3IOkFJXvE+iAr7qXi4MY3bcklm8rr5sW6d6P2pQb/l7yUVvgufGgBJsSzyCrO0GvJVY5+t/29VwxA17E70FxHuDyQQz66h7dDPI9i5HqP6mCm2YbiQD/Y3CHPFA00xu33nXPxrVMqETKWKxXlJzaR2PLc9UiqZzapYPv3J6G3btG7i+u392Lc6XlLzsyokn5mc6Tneq6tH/MpwRkwcHJmaxmK3iTg5pM4XAd/ZiDOKWmA0+RzzfSG1ry3l1mFwDq4i2ucGTTm0CtgGI67HwX4aAJyJVfd4+IUMiNk62vgP+mJh/qOipDsyPnsmgPp8sJiaDEVrPEbWLAN0GIWRyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVqAikAu8iksABsDyMLhbrxD4vIAibWE3dPe/TwPyeo=;
 b=vgsH/KO9+9gofoC+igjBH9vj+ebKEpvft+9vJzHcgoeVFVp/MAHokuPZ4Q/WUiliswBHhbXLN+uygI0ZjdftnSuXE8tGEemeIIeT+E9qMsls5li+rlYSTPkormWyDBoyof4NlZ0C1IGKkdIlh0VCUNbmiRwR8ryGJFNfnEuZ5VsldN8Srt+uTI3qD5SxMJQYen112kZiv2uHc7BJi0kWIyBeqQ2YDU2QkEBJEcOcgx0lNkpGmQ8nWxlZN3UF0o7GX5wptaWpkNysjPP0IUIL2udylCOXCEIq/jGaFcEwnF2PxGEm3JgQrKv+PxaoGs0XwYQTnx72UonkgLCaB41s4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CH3PR11MB7937.namprd11.prod.outlook.com (2603:10b6:610:12c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Wed, 6 Aug
 2025 12:55:33 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 12:55:32 +0000
Date: Wed, 6 Aug 2025 15:55:26 +0300
From: Imre Deak <imre.deak@intel.com>
To: Sasha Levin <sashal@kernel.org>
CC: <tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <laurent.pinchart+renesas@ideasonboard.com>,
 <ville.syrjala@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/omapdrm: Pass format info to
 drm_helper_mode_fill_fb_struct()
Message-ID: <aJNQvlWZNI04BU_l@ideak-desk>
References: <20250806121235.622437-1-sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250806121235.622437-1-sashal@kernel.org>
X-ClientProxiedBy: DUZPR01CA0059.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::13) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CH3PR11MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: d78d8c40-d269-4504-7d79-08ddd4e88774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dMFz0loRAUgWlsUz6qmV38Pm1jQIga2jbRMm037xznrJsIA6PHxkxu2cB10T?=
 =?us-ascii?Q?JX2buSjTG0Y5jXiv/YGJ5BEL2bVglgRxnUlfvdpXk2+CcS/op3JAuoiz0nuI?=
 =?us-ascii?Q?qVMWV5rRqmKZ2ggPcUH8yEdRT5Agzdoho3eIsRyJlVyBTFKBA+EndWCv26q3?=
 =?us-ascii?Q?eG6Hqb2vfMAIXCAYdc/sOQhSJdch22/Zz/E3ivQFBCU7p8BSDo8dwplX2kUi?=
 =?us-ascii?Q?JOGwn0hkk0p+cXs21dByuGxTvTv+HTup5D2U9ajzQ5H6UTrVkz4vzPD7Kp33?=
 =?us-ascii?Q?y8gqfQrCMfeNa+a+vZw4oci60aPLasxCCYTeUx6DvB7E40skMBkm4cK8hq4D?=
 =?us-ascii?Q?++tMAdWH6hc2wNf/Zk5u5bQ1RbavVS+BKRYXXCqw7Mg4D4inT5u1ptaLL+3T?=
 =?us-ascii?Q?LIE9u2lCcYWyTxLi9ZjDNl2DSGsPioKz4Iu3NvV1W/O6CAgp+zPhYUkjruTv?=
 =?us-ascii?Q?c/aZV71znBblOmdAUdNdfpi8oVf4tHSEeGf9nluMYdZoiCefX75YTrwIYZn2?=
 =?us-ascii?Q?ulsHRsBvJ8tRtFbLniSze4X0TifDpvOYZ1buls0UjGcUynI7F7pNSWwEun1L?=
 =?us-ascii?Q?mIppysuPJkyaKx8pzOvyXXGYlzDJ+FHMGTysM0yquvcgxyVRGTNKUI6u6GeE?=
 =?us-ascii?Q?7sFF9t864NkmuF5L/4cVc/fqGq8+GSdgd3JVGjsnFBDBVivECyyAPigh8Xe5?=
 =?us-ascii?Q?RAkJ7z3cdczYdB0nKDA0ncG5wAeYTEDEtbfcEolKGpk8WqAeE59epn8UqWS8?=
 =?us-ascii?Q?Dq7vjsoZ0ZhYaogSJYf1ZSax9cqhGzP3XmSaws9BxieBDzCX+YhwMDfT6KAu?=
 =?us-ascii?Q?VHjPIgZUBNBAuCiS5Rrvtn4LM0bqS/D0E9HNYmP/03/4VVA+syuj8C9r0ymZ?=
 =?us-ascii?Q?yQQTN7hIYFj8LGt+649ff5khyFFEzOjEnaZBG9ddhEh4MT6Qd61Or0YH5Y5a?=
 =?us-ascii?Q?imG5DfY6thsrb2dRw1NZlCLmSvkY3sMCIHncCp5RM2VGIz4YhOUvF4CIkfAg?=
 =?us-ascii?Q?GmmyhfgC+Sy99/1nBMxYsM31RyUVNoWdOA8V0teSCWYxLvI4HJdycv2yFwKs?=
 =?us-ascii?Q?kdc0M5HAPKNZUUZCIP/BYAj/wX8l3hVqtadE4ULP6ovOFYD+z2M8atsV8w+1?=
 =?us-ascii?Q?NHgTZvcZ1g4pLrW5wJYHj2ezCEYEorbEWx1cjA1r/pn/N9N6sW/yweXJpmG2?=
 =?us-ascii?Q?/jDPHbch4Sm7V6J3xRxJXvlBs2Tg5uxZTvHJWKNqpgBlPurejC3jt5+pGkMq?=
 =?us-ascii?Q?2MLZ8sCmgSo9Ihy6I2nKce+nS+PTanP2GXiYP8jEPbk/SUgqn3NM7wTksdvs?=
 =?us-ascii?Q?SOu+GYAqW146Myrar/3Pr2VD6kNAblHxDQYFSGjciK5iYLwW4vUo541ieuXj?=
 =?us-ascii?Q?RYCky6pWsj5ORc3eHm1NbuDK+Q1HttEZ8LFYvG2bK/flOLC2iFxCYZ1/VPVy?=
 =?us-ascii?Q?qd00Edwcb2E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rt/yBlIglpwhls9u3+5TWITWdrtePv7HPH1XYGx/czzOHb0B5RDR8AjpUkPf?=
 =?us-ascii?Q?StUKUjM3sqb2MfTesZKYky/JQwudZfyvudrshBE0SxCoqi53GGSQ86V3JaYs?=
 =?us-ascii?Q?85I6t21WL+0/2hPsmydugMDqh7TUUkP03zQuoLHUFFOfdTz9gFWmN9Hx58JD?=
 =?us-ascii?Q?otK3fe4lz1pamVHSdInQsxopIGO5APayFYWoBlWqxEZ4l5EJ+C7NYV+G4q+A?=
 =?us-ascii?Q?uitLHFHVVm4uOL0NsSeofcFIpf3YixOx+qYdhcKbYphUAHCTSh3TULdbpJNM?=
 =?us-ascii?Q?sICkIWiJrKtg2cQ1s7/34sLAQ0GrxBdA3ozZffG/Gq0yZhqD8GWdWoGJGlsJ?=
 =?us-ascii?Q?cKk+zsMeBtKpSagtOY6eJd1NB6Dlc15r6HpFmoVZqwzZwZvMKAEGFHxX6VjQ?=
 =?us-ascii?Q?JSd/zitbENXRbRvu6ihztxLmSN91MjYV2teOyndsykEzFB5yXUzJtV2FiSes?=
 =?us-ascii?Q?/iQd1B+977JAcYvlfBkyWno383Xqf2HKX4Kncvzm/ZFTFJygs+oh7d/NSfez?=
 =?us-ascii?Q?+7E1vsGdTwp//M4PxT0uIDukm56rtQ1i/9mXP7GElI6dUzs6qsYKWdJ6HI95?=
 =?us-ascii?Q?GrqY87bDG5etYKATm9fPIYKv9R1tgAlroSPMcVz43iAsbom7iILgZRUJAjdi?=
 =?us-ascii?Q?pnxOVIEolx/0sEhcKT1ndVWL0MfzxrA5iM+CUY/aSJPtyYyvpZOwG6EHL8p4?=
 =?us-ascii?Q?t/sQPFp+f5Z+98a5YXmNJbljIyMOnnAhne30xh8thX9oMBlzSWTymbjYFSWl?=
 =?us-ascii?Q?WFN3s+V7f7qHXytBJCAtxAaG/1hTEKfIYYek1KcMjqi3AJP3DMO6R9KCgkBb?=
 =?us-ascii?Q?nLj5S6xVGC+N2j0yOnXEo5bvqvsDRowJlsDfupeH7cE0Nvhei+Eu91vxkbQ3?=
 =?us-ascii?Q?Tng9JeuicWCJgq990RJLx5oTuHBlaPEgaxCksoHGR6t86HSX7hdoD2sT/yAB?=
 =?us-ascii?Q?uAsEcFyXsanI4khtMx+pZ/hMTkGh6fz85TJE5vJrPtzqNkPRaOHMtXagVo1d?=
 =?us-ascii?Q?lpTV8bemB2YIrH37+zcevPuSvwweVzzg3tMs+FGyKlp2gNo+qnyAvkm8uyPz?=
 =?us-ascii?Q?oxRlsB6G2+7wawoTT7DCPTKJAVVnub5KXMx58CBaDi1FLL/EAHNozLTQjku0?=
 =?us-ascii?Q?0InHvmUgItYc+B3xnfLMhj6/OSd5vGsgkqI3D1Y+Q3XPKGpdujIPO9BT2nN8?=
 =?us-ascii?Q?O6b6dax/RhBN4hZ7//0y8g10F3033Ne7vwHNV9TOGmw3OC5yVgS2sr1DeTTd?=
 =?us-ascii?Q?RvX0lQp0lfKACd4eKP6yPTqO5cFP0pHrVwzz4jGvjASqvzYCiIE2NdNYhZkF?=
 =?us-ascii?Q?JaxC+pjGC7HdTZ+W8mSfmFSuJJxubMF8nZdKy/ixrgE1Y+TbcEepPSMt1nhR?=
 =?us-ascii?Q?zi9RqSly8D184IeQSPYtSZWY/NX+XsWEQSuzCIaHC4ZGfO8n0jjjJ1KikTmh?=
 =?us-ascii?Q?4V63Jw/YY4PIHdxsfDYx+5ravSuTdMQ1bjKHykLi3KFMbg0ByKjVXLQwyX3A?=
 =?us-ascii?Q?gXBdeUT9CS5VWm1qz5VcdnF0SFSFeFj46JIy8FdSA0vb0sI243KAHf701ek1?=
 =?us-ascii?Q?2Tkh8+EM4aadiTlm7Rw8Y8avpu6p4o5HYpSS/mqf3H1tmM6QsX0ycBH8kvHo?=
 =?us-ascii?Q?Z7LTpp12yktezBe+AwsHEBmiphftpxSdE0qb8rrizIFT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d78d8c40-d269-4504-7d79-08ddd4e88774
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 12:55:32.9101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dwAINWEW3/tCN1730LwQ0zlp5Jp9vqzjrilSQjk9y/L+SBxn29aVw8TGwIF5FrLV3RUQZ0Ah1rJbguNN8vrwlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7937
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

On Wed, Aug 06, 2025 at 08:12:35AM -0400, Sasha Levin wrote:
> Commit 41ab92d35ccd ("drm: Make passing of format info to
> drm_helper_mode_fill_fb_struct() mandatory") removed the fallback
> format lookup in drm_helper_mode_fill_fb_struct(), making the
> format info parameter mandatory.
> 
> The coccinelle script in commit a34cc7bf1034 ("drm: Allow the caller
> to pass in the format info to drm_helper_mode_fill_fb_struct()")
> correctly added NULL as the format parameter to omapdrm's call to
> drm_helper_mode_fill_fb_struct(). However, omapdrm was subsequently
> overlooked in the follow-up series that updated drivers to pass the
> actual format info instead of NULL (commits b4d360701b76 through
> 3f019d749671 updated other drivers like amdgpu, exynos, i915, msm,
> tegra, virtio, vmwgfx, etc., but omapdrm was not included).
> 
> This causes fb->format to be NULL, triggering a warning in
> drm_framebuffer_init() at line 870 and causing framebuffer
> initialization to fail with -EINVAL, followed by an oops when
> drm_framebuffer_remove() tries to clean up the failed initialization.
> 
> Note: Unlike other drivers that were fixed to pass format info from
> their fb_create() callbacks all the way down to avoid redundant lookups,
> we don't do that here because omap_framebuffer_init() is also called
> from the fbdev code path (omap_fbdev.c) which doesn't have the format
> info readily available. Changing the function signature to accept format
> info would require adding a format lookup in the fbdev caller, so the
> total number of lookups would remain the same - we'd just be moving the
> lookup from omap_framebuffer_init() to its fbdev caller.

With this change the format would be still looked up twice, in the
drm_internal_framebuffer_create() -> (drm_mode_config_funcs::fb_create)
omap_framebuffer_create() -> omap_framebuffer_init() call path.

This is the same wrt. the other drivers, which also have both an fbdev
and other framebuffer users (the latter calling
drm_mode_config_funcs::fb_create()) and so OMAP should look up/pass down
the format info the same way.

I posted the fix based on the above, see
https://lore.kernel.org/all/20250805175752.690504-2-imre.deak@intel.com

which is now also pushed to drm-misc-next-fixes -> drm-tip.

> Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/omapdrm/omap_fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
> index 30c81e2e5d6b..42da78bcb5a6 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fb.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fb.c
> @@ -440,7 +440,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
>  		plane->dma_addr  = 0;
>  	}
>  
> -	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, fb, format, mode_cmd);
>  
>  	ret = drm_framebuffer_init(dev, fb, &omap_framebuffer_funcs);
>  	if (ret) {
> -- 
> 2.39.5
> 
