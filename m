Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF83A5FB89
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 17:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D5910E8EE;
	Thu, 13 Mar 2025 16:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7d89QWk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F8D10E1F3;
 Thu, 13 Mar 2025 16:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741883160; x=1773419160;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=1zZ9z4RbEX+1+MIZ4SJfT3Kiu79+Mz2fIPBJWewH3WI=;
 b=T7d89QWk2T/GEIluN9B0/Wxu6/0bhUQl1YqELdu4exnFwPOqd3MZW4ET
 djevH3OYeZL2b7YU3r+4iqbEtEEKxy80AJshyZ7zQ+1jK0E9usvT3ATf+
 +dSWb8whLvtQMVtuPP1LWw1sNpZm/COga+j6xNgmICYVllHVlokVBLuYg
 cJJj9M5cKqZQGitKP9pbFs6/LZ+g/2zonophTp6qcp6JUE3iz1qTCKJDr
 12uOa7pBDJKYTZC/+1+RXWvwfQjLYpGNn69jGzsPmSai9wS3QMon98jsC
 z8aP13fQ/h/6Y+wv6jxAxXyhbbpntoHLJx5zq4gKVLM+yHxd1f/6lNDIp A==;
X-CSE-ConnectionGUID: sTaNKBw3RQKOCnodGPirGw==
X-CSE-MsgGUID: lx1w2d+6To6RxL4792bmHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="46800484"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="46800484"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 09:25:58 -0700
X-CSE-ConnectionGUID: UiqX/TT9QDqaNQemxup8AA==
X-CSE-MsgGUID: lZgFFE7/QzOcjQ3iwL69YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="120963148"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 09:25:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Mar 2025 09:25:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Mar 2025 09:25:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 09:25:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGogyjGHQrQv5TIkj5H4oFpDrxE75xz1dv0pCWtspI7vBUMS2tAuQqdNATr/8Rdenq2Aj/ZYMcmx6F4wmm9XVV7BtBENXUPhUEafWawdqXOLjH/s/aBV2xyPE+i0ZsUvw2u9PquMeVT1I+fnKoE5IlKjDLQj2/KrvGOOp0xJL6u7fbGXmbQJiGVFwQrzB9Qgfu1n8XopnDYxv0NTDtjMTmr6NHmZ8KuXNt4bfl/jcogZlyQ8xdaeMMOLpshLUy2xi47I7Ft6hmy3uOokDGYXMQD5CKqSvj3AVjUvuegmzOf9g13zEUCyo5+ez9csnWCltPaWyr/4dj2Tb/eO2XnEuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uRD2lC8jp3679GOuItk7jth0/ILxJQr3jkICQf6ED8=;
 b=ToHCdvQc/K/9KmnrWM36uPYWAXYZ0hbcyD1ud7Dae9ObujSi3OavESwncRnK0PFhOTKYsZ2ELiIkPOsqauXNeAxvv1Rnyy3GadiAzjaCv8Sv0rsUw9OSuLfuE68LVRcX4XQxUv/B1zhr/jawL130ue1bap7u7Y2mwCevGQRpbsz9oVXzclXHPL1j3Zw3EulV/m5BmOdCIrjFB2ECpcvzixXKL1SeA9QHbWYbMYoIb5IlkHK8viYO5IA1HniBAFzUGg0s/eZ7nQODgfirF3+5cC9Rzt1toYQjsIERqiNFVNqs5HUKjLNFPK3LZvP2KB+7Lgk5nGBdBTp+ODQEc6IFUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.30; Thu, 13 Mar
 2025 16:25:11 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 16:25:11 +0000
Date: Thu, 13 Mar 2025 12:25:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-fixes
Message-ID: <Z9MG4fH-6Q8dTHE1@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:303:2b::31) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 344e9d8d-0e2a-4191-2c74-08dd624ba055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3ia9T+WAKMSKtYMtKWvwYdmjcS14ci+Ad6RyB0uzkQHZ3G9lR2zMKZT6nB?=
 =?iso-8859-1?Q?4WeR/37l7AdqBOCxZ5Iq+Hk4nKQPtbvt75wZ4LOkF3DqVmAd7ujt8FLGqO?=
 =?iso-8859-1?Q?3bsOvuE/Kb9TkVRUmhdorNz9EoZxVoQiS4GW4GXLn/D/6pNJQ8FtCCZqNY?=
 =?iso-8859-1?Q?51rtsrP/JSEu/oEZX93vzxkVd8YwCGtzKLeXLzviCf9xQuCo2nrTR938gU?=
 =?iso-8859-1?Q?DkOowHOeGBqio+bUctjLk3HV/xYoN9zUBxvAufnmI+Iw53oFLCdT4Ld+7s?=
 =?iso-8859-1?Q?ryk/Dg7mn/f27LI+MGcVp0kohZOzdUbFQacUjtW1xpDYSIcbNNMoDAZdu2?=
 =?iso-8859-1?Q?LzZfL/zMSj2dEO7eoKCX6EwllBDcWcKbh0Zb67/3D7sQe53CS4K0BAeyME?=
 =?iso-8859-1?Q?Zh7UvFDFvAusm5M9ycan/oG/DzgWBHovpGleW6fCBzWnMctd0qxNucYXKm?=
 =?iso-8859-1?Q?PqunfUhlm8dWRGkb86mSU74T/VbTAZbYYGhNm/dky//x5lI3YypEsZRpko?=
 =?iso-8859-1?Q?AfWcRJnD4xVz4NlAoC4o1aLCCkEof+fic5BvRjqWi3Z8/9ofNoQLS+5GIZ?=
 =?iso-8859-1?Q?4zvVdck8NdKx302/d3Ks72o69aD8SNbYY5bMR7TfEN5p9m1/kurmCD1to1?=
 =?iso-8859-1?Q?EdJGRyu2rAeM1Xeyu6uJWjUOAKQAealS2iPD5pJbxFxnNOY5jCKxgio20b?=
 =?iso-8859-1?Q?+uAwUK05ottbjkiv5XXnFtdnMLLcwhPj68CuhRkei9t0E8YR+tMoFL4exk?=
 =?iso-8859-1?Q?sQjr8Z1OduzolNkSRc2rK05DrF4I9Gs+HNdrl8rr5BYGFkn3JtOjdYjLqr?=
 =?iso-8859-1?Q?S0q6cVi+0ms2d6ODYiuJUn27VhG+5SC7k4M3fGuLeHf1pQmNKWtrSs4wIL?=
 =?iso-8859-1?Q?Y1tSapO2BrxpvL4lrwDtTAx9RMMpmBgVFwrcfNoOi6CpI5ZwijD4LOPbJV?=
 =?iso-8859-1?Q?JnLcVjTllNlXDLY27gCmZSLLgVNeRFRUSGIVs2VgklCR0z/EZSB7TUffIm?=
 =?iso-8859-1?Q?hp7LQam3XfLAfcT3DIWdiWX+O0q/X4sM66xo2+AgyAi8PQQcO0yr84nGtP?=
 =?iso-8859-1?Q?djI8EiE/R6RAAY6hlDVZBcxOz48/J5bhs41d06D1teN7u7FUun2qldl7Mj?=
 =?iso-8859-1?Q?gDvOWYDAugV19YhZivEoSh/6rUzNgwcyBNhSoUXihT1GfTZe5e96DN8tor?=
 =?iso-8859-1?Q?5j602i+q3wdLX08BXV2xO1tvNoVSSb+LhQNUudByQvOlmUkhe4HAM6nFm7?=
 =?iso-8859-1?Q?hM1Ow6SeswRxVJmH+j+/JrfkVLJYNAwqGRVKh6uU/CSPDLFfbJNLqemMHk?=
 =?iso-8859-1?Q?VWjKQD3SU7+jpiMzKBaF7v3HjFscyjjOJkYvIB9lLDzdD8ZiwJnuNVa3WX?=
 =?iso-8859-1?Q?uBuPyT58J/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TutGsGLArR4ufWEN76IJ/3eL+g4S+aha9vHBIRqtNhE5F+m3y/6L5iAbtk?=
 =?iso-8859-1?Q?FOOha99m1X1g79Xru0Cnz/eG2iF2XZTKA55w6ZIaIXLWIJ6U6tc3pvpN8a?=
 =?iso-8859-1?Q?e8P2o6T0IOEdn8vgH7p63vpBo0w2QEt++OHkSxuKbXRzj74FSkZHRt5wcK?=
 =?iso-8859-1?Q?e6RzyzELYZaDHXmVnHsCJMFSBYuz8a414tixG02o7DwhM9QuKJlP/yb2mg?=
 =?iso-8859-1?Q?b9n8uwkY5YpZvukdkPWGo0DO0sxJXKToc1PqE3TD88CFLgzgB7B/Lln6xZ?=
 =?iso-8859-1?Q?lZXduatZU84mHGa+HeCErSUM6Ywsacpmf/1bjrXOHWbqupTEM4mJuWr94Z?=
 =?iso-8859-1?Q?PWPx38nygqcPMXFeLaKi+jmZeqn135/XIqAvYmOLXqkCV82sy/VH+k7wjH?=
 =?iso-8859-1?Q?7lWvk5LcEJOzxY2LivGC8faS3McsWoey330Zuva04khXABaYtKAhGjPK7/?=
 =?iso-8859-1?Q?ZFPLRo7a614TGWjKPrBBl1njZB7rSIvYsq8yoXX9fu9ws5BfJYLgWu5kKX?=
 =?iso-8859-1?Q?vW3YXWrtMz3nD9F2ty0aQ0TVTfRC2GQbyTGjsuQyqnhtEf5p8BN7x3JmMc?=
 =?iso-8859-1?Q?da0gW1MgtfualddIt5RZE3wtyEGZEzDMkew+7ijMsQ1SmSTVoqM8mk6znk?=
 =?iso-8859-1?Q?Akr+Wp01ETcO2q6bcWE6u0/68VuIDRxoo8YqNzI8E7Oe78ynoLDMGdAK2f?=
 =?iso-8859-1?Q?eF5EE+y5A2YXQ+VlDzz/hB4aIwfDW5u93WxSlItlsf8wxA5YjZaq8p0rGZ?=
 =?iso-8859-1?Q?LxDh47IFEhQiSrmgsIrJWkew44ScfwPaLN3HJRu0BIsJvqEWEVh2wj3Myv?=
 =?iso-8859-1?Q?NgNPtTC05s6Zqjl2q/YTlcto63hkTONisN06fW+bTYMqRvHOqYlLkNAIX0?=
 =?iso-8859-1?Q?gwojnNPVePbutV6eAr8VVcIxIqgb0IZUKnF92DwnlyYTCKw/K0e+XoaglJ?=
 =?iso-8859-1?Q?0cIXHChcRkmiAp1/1OSxCKhFmLAscWtp/agdlDepuy7gMC+swhd64zxSXm?=
 =?iso-8859-1?Q?w+5MYD4Vk3iuIH0URHJYpLBJTi5reFnHkn8MSgqv68QbOiyIC3GUKZcI3M?=
 =?iso-8859-1?Q?hLiwuMEym+R9o0GY2+RHz8FrWH2fTSt4fveTt0AMTP/UpnBna6danxISPs?=
 =?iso-8859-1?Q?37zt0zdNndj/HZutzAxzAqTiL6kRQ24Y3DM+DItH6Fa/AerxrEuLjkmk1A?=
 =?iso-8859-1?Q?JhHv7hp/8JQ8q4eR36EMrMm1QlDBap0esth00Nn9uSyDEO24Q9BA6FlE/S?=
 =?iso-8859-1?Q?0FHWVRTwALFFgSbV/6Mw2bkUTZOCakWSA4rgIVO1K7CTesw4xa5Ke48x92?=
 =?iso-8859-1?Q?RuAXGK9yuQOwBvllDvjbC1iZAJaRkxelKfibtiF/PQnwhYs23O0IQTR3hf?=
 =?iso-8859-1?Q?LU5oyVnNlJ37v75fCpFAi+M6OoaUByAaFRmWGegMNaTzKloxP59CgxAetf?=
 =?iso-8859-1?Q?eeIn9LZ/orQfTixANjyYNHkBKI12SsFsI3Zggro2BQXfuqFdTx58NFRYm1?=
 =?iso-8859-1?Q?GvZgMZXXAUvPdMJ5WXPLDw4KEmXTuBc9aYC/iV5OmsrpgxZ8jTk/f7qgik?=
 =?iso-8859-1?Q?z0NE31pG1Sa9j9wnFtnUEzhpdfaQnFcGJSoyr+m8Kq4KL+vu/DCL5ZZe/r?=
 =?iso-8859-1?Q?u07X1lYFs57D5CygnshyuOib/pgs0iNQErDxbOdpUci8AL03nX8t2Qpg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 344e9d8d-0e2a-4191-2c74-08dd624ba055
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 16:25:11.0689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKVMXv5EHzzMDeavV/tdHk1jNiYLNf0bcliGk3IFuykItrNN1Pxu+Lkf5hX9ds1zfc6WcIKK+SvaUGHiSnVn0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
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

Hi Dave and Sima,

Here goes i915 fixes for this week.

The most interesting seems to be a bump in the MMAP_GTT_VERSION
to indicate a missing support for partial mmaps, which had
been previously introduced by commit 255fc1703e42 ("drm/i915/gem:
Calculate object page offset for partial memory mapping") and it
is a information that Mesa needs in the way that mesa is using it.

Thanks,
Rodrigo.

drm-intel-fixes-2025-03-13:
- Do cdclk post plane programming later (Ville)
- Bump MMAP_GTT_VERSION: missing indication of partial mmaps support (Jose)
The following changes since commit 80e54e84911a923c40d7bee33a34c1b4be148d7a:

  Linux 6.14-rc6 (2025-03-09 13:45:25 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-03-13

for you to fetch changes up to a8045e46c508b70fe4b30cc020fd0a2b0709b2e5:

  drm/i915: Increase I915_PARAM_MMAP_GTT_VERSION version to indicate support for partial mmaps (2025-03-11 14:51:36 -0400)

----------------------------------------------------------------
- Do cdclk post plane programming later (Ville)
- Bump MMAP_GTT_VERSION: missing indication of partial mmaps support (Jose)

----------------------------------------------------------------
José Roberto de Souza (1):
      drm/i915: Increase I915_PARAM_MMAP_GTT_VERSION version to indicate support for partial mmaps

Ville Syrjälä (1):
      drm/i915/cdclk: Do cdclk post plane programming later

 drivers/gpu/drm/i915/display/intel_display.c | 5 ++---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c     | 5 ++++-
 2 files changed, 6 insertions(+), 4 deletions(-)
