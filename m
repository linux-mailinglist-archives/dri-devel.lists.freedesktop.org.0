Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE8DAE7175
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 23:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915D210E164;
	Tue, 24 Jun 2025 21:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e31OaOOG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696ED10E14E;
 Tue, 24 Jun 2025 21:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750799829; x=1782335829;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wAdBNWucUWmlRS2UfI5wm88QEEvrTFA715Cgzhp/z8g=;
 b=e31OaOOGwMu0r7uHYMMrORw0TtCFv7IU4vaX+1GDlKjZGVeFbfeXNDNP
 +2mCFGhARsK78ghJcOmzqPOtBqHQPhCVyCNsPPpxSPSj5yWxqRjfkUz+0
 mPqASuplHJOthmjqVKSqDyOSuneNm1jzACRjWh8IvCkkFthygaOT/RTFJ
 QaoMRpAGKUo6SDUoXCd+ftYqddLZrBF1c187pjw0MHOiEOEuqtRyIVPAO
 /h3MJPmQRGvFSUXcvd/3l0vobwcXwnFb29Sk61lZo6z2WseZVesRM1S4T
 pGI9FdnfNb0lj2bl60nOB9S3bZ7OanveiXbWZ7y0KFz6fX49XkWdvAD8W Q==;
X-CSE-ConnectionGUID: Kk3o31JrTOGKVJDkZMBg7g==
X-CSE-MsgGUID: mkNVQVZaRUOY1EeKtFAdAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="70624623"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="70624623"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 14:17:06 -0700
X-CSE-ConnectionGUID: wCqtk0fTSaWm2UcYwc5wEg==
X-CSE-MsgGUID: 3vw2TvRzTD+nhmDBiCriIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="157795083"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 14:17:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:17:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 14:17:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:17:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNkwxxaHE9I5/IdW4fZdIlx5sUfbov5jWCAGYjkZLT2gJRjWic5pp3/x0EnjI6BiedLoFexVawqZV5nNphHrmxZZT1SH4TfulcJlsjjW8hzRll+8ULRdVFuuXCoO+W8z7oyRSqJZqUR3YvGHYTtlwcyMhDOKzopCXkqBrvN7UDkajdT54e5cvyzUdcraqy+Nw7UEGKmKjrdYc2Qc8fx8cwFQS4qm7FAJvfBnd82qeceBZbo0VR7/cRBPcPZ/wDD3HeYUor8HV8AjD0lso/Th9hwPJ3QDqTD0VrpZ2SpyImqKmp1obbuRXQOltVeAnJKiYFY1BlXGqb9yjj6WjdDmqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXCieTRL8hKfxlttzoe5Mg/Bx6CnOS/ybj7/76jSd5Q=;
 b=DXtn0gTL2Lwh4uDVilWz0z/OkbSTDABpSxpFb/thGfZXk4WPvDRCKKBuPv1A5akZVss/ry/9V9EctujNzWkvWMhmZWSxGEdTqc5vozf+/NNw/Ei2HMVjhProy/eGz1Jn10uSRxqY3/4mTlDZ7jwsxkiy2PwH1MeHQjoycbdRUe0TbOjdKDcwJ764978M+haEr8h6DGzSimxj/j+CU/233CKzWnY/GXDmUyKj94NMbwQL6N2/uIvuFS0FqtWiU3b7a/O2XCtbPgdNDzRjHDu+XIzaigKPs8n6tezs/f2Nvfe5f5IEnEP0QCqxSRMbiCUowTyWSetDD5mTkUowOQQNpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB6292.namprd11.prod.outlook.com (2603:10b6:208:3e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 21:17:02 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 21:17:02 +0000
Date: Tue, 24 Jun 2025 17:16:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Arnd
 Bergmann" <arnd@arndb.de>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Vinod Govindapillai
 <vinod.govindapillai@intel.com>, Suraj Kandpal <suraj.kandpal@intel.com>,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, Stanislav Lisovskiy
 <stanislav.lisovskiy@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/i915/wm: reduce stack usage in skl_print_wm_changes()
Message-ID: <aFsVydrSSuj-1M5S@intel.com>
References: <20250620113748.3869160-1-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250620113748.3869160-1-arnd@kernel.org>
X-ClientProxiedBy: BYAPR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::31) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa3221a-7ff4-4eed-7b83-08ddb36476b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?njmVCEp0pJOqxGzS5SK+dDtIrxTfWJ/0v8HoG2bd9/nA7AKy135LMKVad33d?=
 =?us-ascii?Q?KOIClSvHBDnj9p496Yw1ZPwn999efXV1FePGXbbDhi4rXFoNzyQDEgk8Tyrr?=
 =?us-ascii?Q?ei3q0jcVzT/jmVjJ0WExQ/Y5N/5NdnusL+gzzM+vA1ztQYr/qjLy0qlsBHiq?=
 =?us-ascii?Q?wgc01H5EdeVQe1KnNomxHjCKKRmVYzyp3OqH5awK8LeAHNhkaWrzkZB5HRal?=
 =?us-ascii?Q?fDvKZnZL1Dd+Ue8KKuAdliQ0uMuyQsm5O8xd5i+/syKpinHJfBO+RJ5qTBpL?=
 =?us-ascii?Q?bC05+xGLhAwiA4K6LDGoSuLva+xCeLrDXgj3W26bVT/VjaI7hSQRCvZFG6O2?=
 =?us-ascii?Q?GzyGUCW9UuKb/wSmCakt97DjBoXe5A4d8+glrVEiE6EMlwJM4fp/a4uJCi61?=
 =?us-ascii?Q?cKcbDHtgb5vj3xpMx9I/TTNNBmiMU4FL9X73wpfSOBW6oZORE/4UWN/Apk1K?=
 =?us-ascii?Q?tLviEuGuVWbNv+CzNOVa8W9lKtUegDbHAJ/jTmr9eXNRJhUisbXlve+a+ch1?=
 =?us-ascii?Q?sRbTcKLX/trEbRPJZuTGg9/LNiPTH942HMVFwx49f/MMN/NCMAIVHK8714Eg?=
 =?us-ascii?Q?qyoh8g/nRyuJ9kS9CcdTF1s4eBXV2VHGdixDvW0SewROq8sD7385Cq4VR+fp?=
 =?us-ascii?Q?/pSk4vq6aHQjsPFH8zx3mmHbilSnGmiRSSkK4pO72VH/7RcUSl5obIb0Sy4A?=
 =?us-ascii?Q?th8kegVqz/EvXwQlCv1i2+GhQrveFtR0xeLY1c9eX15K8xXxLGbxiLizXcjT?=
 =?us-ascii?Q?XYOomQn9cERuUhGnfG2Or1GrMoE1L3TVcE5MuUKOsVYGNZNEkAO2g/riLppX?=
 =?us-ascii?Q?AaMLVSAuaIvP+HK35GKwGLcOitb9DS2XbLwE8XdlZg29TyqwkwWIML1awyQA?=
 =?us-ascii?Q?mo0CyMncybDAhVuYcX2M+ctHG34RtIi78aUAi+/4QG9uAHqrJh8g+swEnhcz?=
 =?us-ascii?Q?1OmOVjWDU6gHZhdsbQskX0wLy9s+oJgO6xL3C0+X3q+yZkQQV4WF5ri+fBVT?=
 =?us-ascii?Q?vljW0nAx8seFOnBWYmnp9KpAxe85i4mNllZrkl8YtI1jrKP4Ed5Er89kMxhk?=
 =?us-ascii?Q?9MPLISUEJa0YU6VLEmeiz2Rn9tdElLMTd6DAI6HToBk6qXgOBAnw5wdYzxQF?=
 =?us-ascii?Q?d/88Zc8gkFQhFMlF/hyg3TCJuOp5Y8+0vsvk7YiUuCRLO9N+XvNPHZ4f4b4Y?=
 =?us-ascii?Q?tdJGptKGeJ/fGXZ9EcSF1IDNiEqBBkptSJMQy6SkAefsYYn6Eut+wF99Z55d?=
 =?us-ascii?Q?Is29kCoY9g2dKu4WC73MiDLY7IrMnAi3dRCiLnLT4k7lsQj1emC3a4SZjNEq?=
 =?us-ascii?Q?zStZtUaSADlFg/rSHChEQyIOgeqyvnWc0wzbj05kiCwCvfgww3Je7fvXb5QS?=
 =?us-ascii?Q?8VuO40tpHDa80bAPElNjd4tWXk22Ac0v0ew7AajJKpad1G3zaVHr/VRSsrPT?=
 =?us-ascii?Q?AhkubzyVE1Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VDsIod74W+UR3OK9ucyE+ErtrDcfokq8a15Q/X1XC+SwV4lIyaVUu0/bREd2?=
 =?us-ascii?Q?CfNXkUH2d83cwIhXHld1L4Pf/ZjDhxJR5dp3JK1Q9RSk6AxRqibR62obad6v?=
 =?us-ascii?Q?V7TaxUEXgUcVdNhKRlmN6uXZ/WddfLinV38hqXAaUNcT1noKllz9E/ugD1vA?=
 =?us-ascii?Q?OQtY7CNUMm50bFfeWPeyMMZ47Ydwuw8KWSWYfobSJ21nbyaS5k3LRwJ1y8we?=
 =?us-ascii?Q?ilv0BoO9D8mKPJU00xDIzHl4CxtThlgzKZggm1Dpegxywxu7WAXKEOeNCwE3?=
 =?us-ascii?Q?2m2Rn6RX21euE4EEpmYwbwu7RKGCMIlUt2oWTREUZ9oDTqTtOWAn4Bpalyt1?=
 =?us-ascii?Q?ptM352oWuOpW/VlhCuJbx6/WwpgnavUT3irpzDHx5mpvMbugkgbYScM/IeJS?=
 =?us-ascii?Q?MxS0iKJfH/OTzRMK6a2/dT6he8toklUaREbc/k0vbdqCQavOFa8+zt/FN7c0?=
 =?us-ascii?Q?fhx2IcVu8nqeknXz2uErxjwAZ4SN0fSOAh+0v7wP0vD0y0WCZUwDrrx1bljP?=
 =?us-ascii?Q?0XnU1M4fFcWIAqJLJKx3ufoGB7GK4i8HPeTZxRxv9pD76Ps3OFdMvgPflv7P?=
 =?us-ascii?Q?CL9q3J09SHFCME82UqZI+jTNFB/jRHgzjiVD68YQ8NpCIYMZHUo9B5Dy04uT?=
 =?us-ascii?Q?X3T1HqSkyogDi/pdKDUR5SwDSURfFG1VlezQZ8yMtMfNysRrg80glM8gv7d8?=
 =?us-ascii?Q?5+7XKV55/JOoE9UUly5NaJAliMdQX7d8hzy4/xMSw9bKxHtdj+PKqJtMQKzE?=
 =?us-ascii?Q?hXN7PYWlzr57tdp5ZopETjyQeENj1IgtgACCVpZJzU+0WCSWanjMqXtUhGPN?=
 =?us-ascii?Q?xHOfsyNDJOJLE1XWuXdCFEDgMKKJt+DKgM706ZSdpy7cOp5CxZJXvlD4PqFp?=
 =?us-ascii?Q?A57iY33UhN2uH7EsEy/mLOrX7t6BiNvjMgY9s3T73+FCq5jgyPBWlJP/Gewt?=
 =?us-ascii?Q?S2S8w9D5ERpGGxYm6X1YpHJHIhx/wvV5l2L7wRE0Zt77ke+j2hkfxXATIboD?=
 =?us-ascii?Q?bGlOFW7MEuwStQ/A9l8r+KGR82iZ/2EVWObd3d7+Y7ClgVmhkEYAKJ8fJA6u?=
 =?us-ascii?Q?/eyvtQRoNAtIhblvXUn/vh3mUVRcShpZU6vh7JdamDSJ55Mmc2IFhwzCarHP?=
 =?us-ascii?Q?aTEU+kkrbaRW3ld9TcFm+x+RPfH40tm0VZuaED9KPztWiS+LEMId+oeX1tBo?=
 =?us-ascii?Q?YupuDzy8MHmSZPTV/0ENgitG3m/UfayCE2LGzRZqrCCuuANSyJJPSAZUt1yY?=
 =?us-ascii?Q?q6p7clNEdnVDYhlSOtS/Vt9Bz+QFYPitVsq+nmwwNWefIV10nat60ybHyb9w?=
 =?us-ascii?Q?BaO7ROLKzLJH5ra9s0Pp39zwLcDJWx+MPVxo9hyuJMJG86F7fY4iksdoRhRE?=
 =?us-ascii?Q?GV2Fe9UOCdnRXNN1DzeiDqjdBaXKeebLeuT83KT5/OIBvsXk8dvwpKQvBvtI?=
 =?us-ascii?Q?D421PiYlOBr6M0mRY8Rtg10u7hmvXpZFZdnCm1Ve9oBW5wyg2dJ+3jzC8nmR?=
 =?us-ascii?Q?USoSQSfV0JFH9OEZcxcykKPVxEhzAD0jFDXy9hDjl870lyzjgyHImMwsbBZo?=
 =?us-ascii?Q?cvfCXO28iboQuktveOfgOVvPAO5cFCU09imY2V4B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa3221a-7ff4-4eed-7b83-08ddb36476b8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:17:02.8226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JTi8rrjSP/QbRJJZIlQ/o1CCWeJB2TzpWtX0cQqDLw80VWERYeSxt4UHamB07ByMeWnZTdmUWHveLpHbbq92hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
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

On Fri, Jun 20, 2025 at 01:37:45PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When KMSAN is enabled, this function causes has a rather excessive stack usage:
> 
> drivers/gpu/drm/i915/display/skl_watermark.c:2977:1: error: stack frame size (1432) exceeds limit (1408) in 'skl_compute_wm' [-Werror,-Wframe-larger-than]
> 
> This is apparently all caused by the varargs calls to drm_dbg_kms(). Inlining
> this into skl_compute_wm() means that any function called by skl_compute_wm()
> has its own stack on top of that.
> 
> Move the worst bit into a separate function marked as noinline_for_stack to
> limit that to the one code path that actually needs it.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/i915/display/skl_watermark.c | 176 ++++++++++---------
>  1 file changed, 92 insertions(+), 84 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
> index 2c2371574d6f..b7c92c718c8f 100644
> --- a/drivers/gpu/drm/i915/display/skl_watermark.c
> +++ b/drivers/gpu/drm/i915/display/skl_watermark.c
> @@ -2680,6 +2680,97 @@ static char enast(bool enable)
>  	return enable ? '*' : ' ';
>  }
>  
> +static noinline_for_stack void

on this I'm mostly trusting you and your compiler, but it looks safe
enough...


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushing to drm-intel-next as well...

Thanks for all the patches

> +skl_print_plane_changes(struct intel_display *display,
> +			struct intel_plane *plane,
> +			const struct skl_plane_wm *old_wm,
> +			const struct skl_plane_wm *new_wm)
> +{
> +	drm_dbg_kms(display->drm,
> +		    "[PLANE:%d:%s]   level %cwm0,%cwm1,%cwm2,%cwm3,%cwm4,%cwm5,%cwm6,%cwm7,%ctwm,%cswm,%cstwm"
> +		    " -> %cwm0,%cwm1,%cwm2,%cwm3,%cwm4,%cwm5,%cwm6,%cwm7,%ctwm,%cswm,%cstwm\n",
> +		    plane->base.base.id, plane->base.name,
> +		    enast(old_wm->wm[0].enable), enast(old_wm->wm[1].enable),
> +		    enast(old_wm->wm[2].enable), enast(old_wm->wm[3].enable),
> +		    enast(old_wm->wm[4].enable), enast(old_wm->wm[5].enable),
> +		    enast(old_wm->wm[6].enable), enast(old_wm->wm[7].enable),
> +		    enast(old_wm->trans_wm.enable),
> +		    enast(old_wm->sagv.wm0.enable),
> +		    enast(old_wm->sagv.trans_wm.enable),
> +		    enast(new_wm->wm[0].enable), enast(new_wm->wm[1].enable),
> +		    enast(new_wm->wm[2].enable), enast(new_wm->wm[3].enable),
> +		    enast(new_wm->wm[4].enable), enast(new_wm->wm[5].enable),
> +		    enast(new_wm->wm[6].enable), enast(new_wm->wm[7].enable),
> +		    enast(new_wm->trans_wm.enable),
> +		    enast(new_wm->sagv.wm0.enable),
> +		    enast(new_wm->sagv.trans_wm.enable));
> +
> +	drm_dbg_kms(display->drm,
> +		    "[PLANE:%d:%s]   lines %c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%4d"
> +		      " -> %c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%4d\n",
> +		    plane->base.base.id, plane->base.name,
> +		    enast(old_wm->wm[0].ignore_lines), old_wm->wm[0].lines,
> +		    enast(old_wm->wm[1].ignore_lines), old_wm->wm[1].lines,
> +		    enast(old_wm->wm[2].ignore_lines), old_wm->wm[2].lines,
> +		    enast(old_wm->wm[3].ignore_lines), old_wm->wm[3].lines,
> +		    enast(old_wm->wm[4].ignore_lines), old_wm->wm[4].lines,
> +		    enast(old_wm->wm[5].ignore_lines), old_wm->wm[5].lines,
> +		    enast(old_wm->wm[6].ignore_lines), old_wm->wm[6].lines,
> +		    enast(old_wm->wm[7].ignore_lines), old_wm->wm[7].lines,
> +		    enast(old_wm->trans_wm.ignore_lines), old_wm->trans_wm.lines,
> +		    enast(old_wm->sagv.wm0.ignore_lines), old_wm->sagv.wm0.lines,
> +		    enast(old_wm->sagv.trans_wm.ignore_lines), old_wm->sagv.trans_wm.lines,
> +		    enast(new_wm->wm[0].ignore_lines), new_wm->wm[0].lines,
> +		    enast(new_wm->wm[1].ignore_lines), new_wm->wm[1].lines,
> +		    enast(new_wm->wm[2].ignore_lines), new_wm->wm[2].lines,
> +		    enast(new_wm->wm[3].ignore_lines), new_wm->wm[3].lines,
> +		    enast(new_wm->wm[4].ignore_lines), new_wm->wm[4].lines,
> +		    enast(new_wm->wm[5].ignore_lines), new_wm->wm[5].lines,
> +		    enast(new_wm->wm[6].ignore_lines), new_wm->wm[6].lines,
> +		    enast(new_wm->wm[7].ignore_lines), new_wm->wm[7].lines,
> +		    enast(new_wm->trans_wm.ignore_lines), new_wm->trans_wm.lines,
> +		    enast(new_wm->sagv.wm0.ignore_lines), new_wm->sagv.wm0.lines,
> +		    enast(new_wm->sagv.trans_wm.ignore_lines), new_wm->sagv.trans_wm.lines);
> +
> +	drm_dbg_kms(display->drm,
> +		    "[PLANE:%d:%s]  blocks %4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%5d"
> +		    " -> %4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%5d\n",
> +		    plane->base.base.id, plane->base.name,
> +		    old_wm->wm[0].blocks, old_wm->wm[1].blocks,
> +		    old_wm->wm[2].blocks, old_wm->wm[3].blocks,
> +		    old_wm->wm[4].blocks, old_wm->wm[5].blocks,
> +		    old_wm->wm[6].blocks, old_wm->wm[7].blocks,
> +		    old_wm->trans_wm.blocks,
> +		    old_wm->sagv.wm0.blocks,
> +		    old_wm->sagv.trans_wm.blocks,
> +		    new_wm->wm[0].blocks, new_wm->wm[1].blocks,
> +		    new_wm->wm[2].blocks, new_wm->wm[3].blocks,
> +		    new_wm->wm[4].blocks, new_wm->wm[5].blocks,
> +		    new_wm->wm[6].blocks, new_wm->wm[7].blocks,
> +		    new_wm->trans_wm.blocks,
> +		    new_wm->sagv.wm0.blocks,
> +		    new_wm->sagv.trans_wm.blocks);
> +
> +	drm_dbg_kms(display->drm,
> +		    "[PLANE:%d:%s] min_ddb %4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%5d"
> +		    " -> %4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%5d\n",
> +		    plane->base.base.id, plane->base.name,
> +		    old_wm->wm[0].min_ddb_alloc, old_wm->wm[1].min_ddb_alloc,
> +		    old_wm->wm[2].min_ddb_alloc, old_wm->wm[3].min_ddb_alloc,
> +		    old_wm->wm[4].min_ddb_alloc, old_wm->wm[5].min_ddb_alloc,
> +		    old_wm->wm[6].min_ddb_alloc, old_wm->wm[7].min_ddb_alloc,
> +		    old_wm->trans_wm.min_ddb_alloc,
> +		    old_wm->sagv.wm0.min_ddb_alloc,
> +		    old_wm->sagv.trans_wm.min_ddb_alloc,
> +		    new_wm->wm[0].min_ddb_alloc, new_wm->wm[1].min_ddb_alloc,
> +		    new_wm->wm[2].min_ddb_alloc, new_wm->wm[3].min_ddb_alloc,
> +		    new_wm->wm[4].min_ddb_alloc, new_wm->wm[5].min_ddb_alloc,
> +		    new_wm->wm[6].min_ddb_alloc, new_wm->wm[7].min_ddb_alloc,
> +		    new_wm->trans_wm.min_ddb_alloc,
> +		    new_wm->sagv.wm0.min_ddb_alloc,
> +		    new_wm->sagv.trans_wm.min_ddb_alloc);
> +}
> +
>  static void
>  skl_print_wm_changes(struct intel_atomic_state *state)
>  {
> @@ -2709,7 +2800,6 @@ skl_print_wm_changes(struct intel_atomic_state *state)
>  
>  			if (skl_ddb_entry_equal(old, new))
>  				continue;
> -
>  			drm_dbg_kms(display->drm,
>  				    "[PLANE:%d:%s] ddb (%4d - %4d) -> (%4d - %4d), size %4d -> %4d\n",
>  				    plane->base.base.id, plane->base.name,
> @@ -2727,89 +2817,7 @@ skl_print_wm_changes(struct intel_atomic_state *state)
>  			if (skl_plane_wm_equals(display, old_wm, new_wm))
>  				continue;
>  
> -			drm_dbg_kms(display->drm,
> -				    "[PLANE:%d:%s]   level %cwm0,%cwm1,%cwm2,%cwm3,%cwm4,%cwm5,%cwm6,%cwm7,%ctwm,%cswm,%cstwm"
> -				    " -> %cwm0,%cwm1,%cwm2,%cwm3,%cwm4,%cwm5,%cwm6,%cwm7,%ctwm,%cswm,%cstwm\n",
> -				    plane->base.base.id, plane->base.name,
> -				    enast(old_wm->wm[0].enable), enast(old_wm->wm[1].enable),
> -				    enast(old_wm->wm[2].enable), enast(old_wm->wm[3].enable),
> -				    enast(old_wm->wm[4].enable), enast(old_wm->wm[5].enable),
> -				    enast(old_wm->wm[6].enable), enast(old_wm->wm[7].enable),
> -				    enast(old_wm->trans_wm.enable),
> -				    enast(old_wm->sagv.wm0.enable),
> -				    enast(old_wm->sagv.trans_wm.enable),
> -				    enast(new_wm->wm[0].enable), enast(new_wm->wm[1].enable),
> -				    enast(new_wm->wm[2].enable), enast(new_wm->wm[3].enable),
> -				    enast(new_wm->wm[4].enable), enast(new_wm->wm[5].enable),
> -				    enast(new_wm->wm[6].enable), enast(new_wm->wm[7].enable),
> -				    enast(new_wm->trans_wm.enable),
> -				    enast(new_wm->sagv.wm0.enable),
> -				    enast(new_wm->sagv.trans_wm.enable));
> -
> -			drm_dbg_kms(display->drm,
> -				    "[PLANE:%d:%s]   lines %c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%4d"
> -				      " -> %c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%4d\n",
> -				    plane->base.base.id, plane->base.name,
> -				    enast(old_wm->wm[0].ignore_lines), old_wm->wm[0].lines,
> -				    enast(old_wm->wm[1].ignore_lines), old_wm->wm[1].lines,
> -				    enast(old_wm->wm[2].ignore_lines), old_wm->wm[2].lines,
> -				    enast(old_wm->wm[3].ignore_lines), old_wm->wm[3].lines,
> -				    enast(old_wm->wm[4].ignore_lines), old_wm->wm[4].lines,
> -				    enast(old_wm->wm[5].ignore_lines), old_wm->wm[5].lines,
> -				    enast(old_wm->wm[6].ignore_lines), old_wm->wm[6].lines,
> -				    enast(old_wm->wm[7].ignore_lines), old_wm->wm[7].lines,
> -				    enast(old_wm->trans_wm.ignore_lines), old_wm->trans_wm.lines,
> -				    enast(old_wm->sagv.wm0.ignore_lines), old_wm->sagv.wm0.lines,
> -				    enast(old_wm->sagv.trans_wm.ignore_lines), old_wm->sagv.trans_wm.lines,
> -				    enast(new_wm->wm[0].ignore_lines), new_wm->wm[0].lines,
> -				    enast(new_wm->wm[1].ignore_lines), new_wm->wm[1].lines,
> -				    enast(new_wm->wm[2].ignore_lines), new_wm->wm[2].lines,
> -				    enast(new_wm->wm[3].ignore_lines), new_wm->wm[3].lines,
> -				    enast(new_wm->wm[4].ignore_lines), new_wm->wm[4].lines,
> -				    enast(new_wm->wm[5].ignore_lines), new_wm->wm[5].lines,
> -				    enast(new_wm->wm[6].ignore_lines), new_wm->wm[6].lines,
> -				    enast(new_wm->wm[7].ignore_lines), new_wm->wm[7].lines,
> -				    enast(new_wm->trans_wm.ignore_lines), new_wm->trans_wm.lines,
> -				    enast(new_wm->sagv.wm0.ignore_lines), new_wm->sagv.wm0.lines,
> -				    enast(new_wm->sagv.trans_wm.ignore_lines), new_wm->sagv.trans_wm.lines);
> -
> -			drm_dbg_kms(display->drm,
> -				    "[PLANE:%d:%s]  blocks %4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%5d"
> -				    " -> %4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%5d\n",
> -				    plane->base.base.id, plane->base.name,
> -				    old_wm->wm[0].blocks, old_wm->wm[1].blocks,
> -				    old_wm->wm[2].blocks, old_wm->wm[3].blocks,
> -				    old_wm->wm[4].blocks, old_wm->wm[5].blocks,
> -				    old_wm->wm[6].blocks, old_wm->wm[7].blocks,
> -				    old_wm->trans_wm.blocks,
> -				    old_wm->sagv.wm0.blocks,
> -				    old_wm->sagv.trans_wm.blocks,
> -				    new_wm->wm[0].blocks, new_wm->wm[1].blocks,
> -				    new_wm->wm[2].blocks, new_wm->wm[3].blocks,
> -				    new_wm->wm[4].blocks, new_wm->wm[5].blocks,
> -				    new_wm->wm[6].blocks, new_wm->wm[7].blocks,
> -				    new_wm->trans_wm.blocks,
> -				    new_wm->sagv.wm0.blocks,
> -				    new_wm->sagv.trans_wm.blocks);
> -
> -			drm_dbg_kms(display->drm,
> -				    "[PLANE:%d:%s] min_ddb %4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%5d"
> -				    " -> %4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%5d\n",
> -				    plane->base.base.id, plane->base.name,
> -				    old_wm->wm[0].min_ddb_alloc, old_wm->wm[1].min_ddb_alloc,
> -				    old_wm->wm[2].min_ddb_alloc, old_wm->wm[3].min_ddb_alloc,
> -				    old_wm->wm[4].min_ddb_alloc, old_wm->wm[5].min_ddb_alloc,
> -				    old_wm->wm[6].min_ddb_alloc, old_wm->wm[7].min_ddb_alloc,
> -				    old_wm->trans_wm.min_ddb_alloc,
> -				    old_wm->sagv.wm0.min_ddb_alloc,
> -				    old_wm->sagv.trans_wm.min_ddb_alloc,
> -				    new_wm->wm[0].min_ddb_alloc, new_wm->wm[1].min_ddb_alloc,
> -				    new_wm->wm[2].min_ddb_alloc, new_wm->wm[3].min_ddb_alloc,
> -				    new_wm->wm[4].min_ddb_alloc, new_wm->wm[5].min_ddb_alloc,
> -				    new_wm->wm[6].min_ddb_alloc, new_wm->wm[7].min_ddb_alloc,
> -				    new_wm->trans_wm.min_ddb_alloc,
> -				    new_wm->sagv.wm0.min_ddb_alloc,
> -				    new_wm->sagv.trans_wm.min_ddb_alloc);
> +			skl_print_plane_changes(display, plane, old_wm, new_wm);
>  		}
>  	}
>  }
> -- 
> 2.39.5
> 
