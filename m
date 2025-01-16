Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA62A144ED
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 23:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D4F10E0F7;
	Thu, 16 Jan 2025 22:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQBW6Uhc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314A610E0F7;
 Thu, 16 Jan 2025 22:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737068264; x=1768604264;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eeMRdP7lHzmXfhR0SViSEka9B3dee7BMPAo4ow73HZA=;
 b=GQBW6UhcwfEYhv3Zt1iL0brplSrgMZMZjFTWdKZpZybFdcRXO8u7kA1Q
 noCd1myOlXXGhAw3kRFhaQHx4O6SwjhiYn/l663uwwpBmfyAjwJfxN9v0
 J7OUEqAP14K3tKki/hzUgmhlJr3XfiNEU8naPXWsur0bivJVgVfO1HZEa
 mfelI3wgb6Y2PQ/Wd2ubBSLsltgRX9wwvzAULbSDXg/1WJMgGKMpOvzLX
 LIiJLtDBY9Ecy9TR6eNsEbILN7Tw3DOEi0Qrh5dvWd1JaPHsUn5HgxzMT
 Qz97UVSZKqXqH+M8AHzy17HGMkta05CstEKWmgOq2wLjYIoXbIIucTqh+ Q==;
X-CSE-ConnectionGUID: RDdtOyqjQdOkEVHLmvuIPw==
X-CSE-MsgGUID: 1VPll2LWQrG0ruPI41NOwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="36693414"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="36693414"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 14:57:43 -0800
X-CSE-ConnectionGUID: jrMsZlHrSReUJrXQ4h0caA==
X-CSE-MsgGUID: UZKZIEOmTpy6Vq7pwwlqjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110743027"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 14:57:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 14:57:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 14:57:42 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 14:57:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6PA2pEZXlzTtZ/N3Pwq2ddJL2htaq/BKwR1GEQ0nEadtZ/73xkpF8fTsgrp/xPzJRdzcBgZn0F0HGJ0uejq4abuIUbszf4NND+edTa/Co2Fq2ObU8uMhz87OG0ld9DwxAChfNnbmpvQDWPq0PvLcKRwbULQoZzOIx22wm+BHadbWIuHe4ZgqDiBJ2K8FsTYxL7oS0wQMY1aZ+uZUwSA42DFJ7Zt21ZF3IuF172UuZKKQ2Y+665jXFy/vx1Af+/X3A3yHi0q3PDTQb/kys0m8hezANVw8gZQD8rSERAOg2wSR6mIW57ETVL+WH91gtOrwPvEfF1nf9TU5oepoHriJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPPzyUXhsFsFGpiqcRb4ZYru/lcDSo4sVs1Rv/arP5E=;
 b=PqGmtBxs8qFb0NrAlaNAcEho69D40VQWWR33qU5OM3IdH83lVGdDVDd0YYl3Q7A3gPGszp3iL/DH9js2YOjKtk2Y5dzRV7UYaA8LzxKuSEG/m1miI/0MNTqrbDh/IN9+bM2rMdDELZMN3kz8WRqWCj4gexJbdGnbgkiDOn0QyYr3QpTqGUSrU5pfMlhsvvrKKqu+pzDq4l6+9uWdwxHBbtUahfJI9/UB8P/eEU3F/yhCC15piCN+LdD7yhdiJwbXA5dmyjntrzuAxJr0mPglaDvQaZSlc7PnRYGLuNDW4kc82cz8Iasga54F0CydMgYZ26p/O6a4KgcfyMdM625BTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by CH3PR11MB7937.namprd11.prod.outlook.com (2603:10b6:610:12c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 22:57:09 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 22:57:08 +0000
Date: Thu, 16 Jan 2025 17:57:05 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
Subject: Re: [PATCH v2] drm/i915/slpc: Add sysfs for SLPC power profiles
Message-ID: <Z4mOwZz1tJCxLeP0@intel.com>
References: <20250110232151.2844865-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250110232151.2844865-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:303:6a::13) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|CH3PR11MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: 6da5bb44-f40b-4fd7-155a-08dd36811ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CxBpUwdKZGNB7G6G9lX/cHtv4u/ZvLs5AHwz2hzIiQjmxnzITYgAQupyQpMH?=
 =?us-ascii?Q?hkjtkK3bwsNBiiuXDzzKh1jbgcQ9JD9RGe1MBZ3NKbcEg0VP9s5dA4uGzETt?=
 =?us-ascii?Q?BojfCOnTEWHhfk3+B9DIeWxUUssvRM6Mo2+EVMFjJOUgTlzw+RtIH50CsI4C?=
 =?us-ascii?Q?jsMUdvj691jmzA43zYhJa0De58hs/AxUOE64dbiDWOMGKlmpHPY0SOsePP15?=
 =?us-ascii?Q?m5gKmW7y3KJd8uaKfx/OV3jUQ47A/d+QU2r3XOhlJsD6LvShH+gAqJfwEqYj?=
 =?us-ascii?Q?zDCmghNl+FXPUb/OsMXjybAsF3bQIeAIXj/jA53phvQllb4pTd3Jt6iz/35y?=
 =?us-ascii?Q?BZed4fbgaSzFbO8hdxVqEBIeiVzr4V4absaAyNlC8mCuqY03l2ao3yTHBOFQ?=
 =?us-ascii?Q?7g9vyJ/3s21Kt6OAbhYQAVX3fjLVmQY7q+jlfpJH68oXvwSp/RxP6SUDL45b?=
 =?us-ascii?Q?x2dKXn7Pz7CaGIVFH7MQxX8/Y26ftK1HAqEbMKg36TJr/mB8F0/jhTNKqy9B?=
 =?us-ascii?Q?+IB4tGBdjIJ35ekqD4ZQGU0jqSoPa+lOvtx1i92IpMD1hNFd3u8WG2rzBerP?=
 =?us-ascii?Q?LXwdY9BekIpBTTMKJLWeh7gk6B9eHRqOhD33RXdwHaZjF8MchGHR3uRqzDSl?=
 =?us-ascii?Q?YPzJgADXKDtyywzGd9oOk6I5kbiOj+WVes0kDgFFrtwRc8X0BcZS3zNkmyCu?=
 =?us-ascii?Q?MJECYPz3v6qaM2OU7zrRrpH62BNpAQJNjzfTZw7F75czKSmC0MUUd82p4i9C?=
 =?us-ascii?Q?PxZGk2kXu4zdiLGekZWaM7AhuuGo9+LVswx8w4lgb5VvlXZQqo0Pr4E9XMQt?=
 =?us-ascii?Q?vMI2LFmdU42kKGMhqRPY8WE9SGQbynBu1Hp1PDeVGN113LyENhyI7dKPWdOW?=
 =?us-ascii?Q?LO6/cIueE3JQymyHgpR7gzCSi17R7sSLKwKIwAvXPblghSEUWPK4JZ4nDjGD?=
 =?us-ascii?Q?+LOha6V1Zg6ehPiZem+I4YcmFMrRDjNZ1gpQeqijZDTAoAs2TA4n8qpNivYv?=
 =?us-ascii?Q?MHGVMf6aRgdjTQ80QnOPbkre8YR2jnzIbstoXuD325moamuYLwFDWkxl7vXk?=
 =?us-ascii?Q?zW/WBoJcIRNUmDnk4+zqonHp3h9HJ0JKTTe/eAH9/uIipXYdUYr6pgNnTmW1?=
 =?us-ascii?Q?2vtHkBCk8l4f3gg9YXnP+quWeMgZBDIKi19gmv1zE6IwNhPcW8fGxhuUV7LT?=
 =?us-ascii?Q?8JSHKByTrRM5fDLw/WYGSf32/8L39GT8L04l6ydP/QO5TXtooiH7AGF1aUvc?=
 =?us-ascii?Q?q2zQBIKP8WnvQW8efdIR86//3KIqS4K3uOIi04gFDYO4Nko98UmeaON/4dNO?=
 =?us-ascii?Q?aHBjZ+O/zWw34nbAeYdwQ1KdxSBrbB5+cKeVvf+rDJdDLg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rsWHu/a9DNdFPHl0HxmX9cYdzpOmySdp11cY1kJHfCsmZuIPlZYN10m0ie1A?=
 =?us-ascii?Q?lXg4QLPyqtmUsQm4GPpgiUEqIo+JmeX1BYGd7PqK4gxZbKhBCXoJSyCXD/sq?=
 =?us-ascii?Q?3RUkUizeulqIcNJdzePnm4SeWDha8aUHY+E4/eV2L14t/rVntGKK6AUKMzxF?=
 =?us-ascii?Q?iVBtRQA9llBgpbwGy7ipHqgV+GllmPVoakmwZP4TKlXY/cDZlrtX0G3dSxAJ?=
 =?us-ascii?Q?fR2eSWtzhF/CSNSE//5m9QRA6C8eeP+h5SwOr4MBcUu4FbzpOk25ywwmgbNT?=
 =?us-ascii?Q?dMPsVdTul6g+ydOI7DEgXFWiihlWkAOK+baXKpcHA+zSGWyjNv/WwqegA3Q7?=
 =?us-ascii?Q?qmy64EfSDmKeAxI5ldndKnuhwZ54AdPw/7tglhM5XR6FbOqFQN6UmBSgPhi/?=
 =?us-ascii?Q?YuVIXhpBGUbZV9yIhIovP4I1jhqALWWfck7oElFo9K53i+z1dnEHyx7nZzPp?=
 =?us-ascii?Q?lEGH5pCOvtJVDjQC97Wi20zN7fVA0YKa56sJCObuXvTXskhy1RrvOCDK6cDV?=
 =?us-ascii?Q?iHjlaWl2Tz6ERpfc/n7mzR+RSqEkkwki2HH+k9FiS3bsWwsPxdgATkxQuRms?=
 =?us-ascii?Q?qNjNzqkX77uYA92rs60yxGbUFnK0w+HBg7GjWvdV3s8bcu+ZTRkmYOliwZE7?=
 =?us-ascii?Q?+Kj2kuiF2wPujUQpa5BUznsPNzOc/MImEOx33qxU0SoXPQCgv1C2c93u7SM0?=
 =?us-ascii?Q?mveHQCh1IedNMxrKg1IztVSxuBecPN7jk2A8flxwZ3Jb5bgGf7/8nVrk08xh?=
 =?us-ascii?Q?E+1DRJ5zFYu42cq1f8Q0TPRXwDzmluMmKRBkYSO7b95IWSuNQD6wxf+CIzb1?=
 =?us-ascii?Q?7HQW99KF+G5S1NwMRjG0xd9v7wjEq+Dgushyq83sZYbra/sn28OQG+Aut/ka?=
 =?us-ascii?Q?ustboujokNlA37OtgfrBwL20PXIVQZeRc0nojXEsoIlqULlZYwcfVsLWetdP?=
 =?us-ascii?Q?zh43qj1V5GhSnG4I4Ko5Q91W71YPACkRrBpxB0BrfuhzBjHNiGauhSRMhZ/O?=
 =?us-ascii?Q?GHoCSRquLriIjuTOBG9sxf+hI9pQPb7edQu86mI89StTEXYfgDIVyc+nQq6l?=
 =?us-ascii?Q?m9WD+VOQZvvbnh0iD/no2rGa8YwzEDSZWIRO+Al523Kfc1JnYvbFfuhvT4Lb?=
 =?us-ascii?Q?l0K5+Ku2NlzYDI6n0YFJH02Rv6HZMH7I+bZVJh+IHSuv03ckdUB3Fy2AsYln?=
 =?us-ascii?Q?OLcWQzYEsA6SzwZvozr6SEttGaZpyuWWtiMU+r3IKjs/pCBtx4IcqULTBn8S?=
 =?us-ascii?Q?dI3+xrT3nmcVcNCnuBJ5lvIusn3/gHPOOdPa8vIUYaTOTsbKVC5LdckVamay?=
 =?us-ascii?Q?Cw+Jcrnhs9fJRHH/opHzMKd+/K1aovHiM/2U7IzyiJdPkunTpStbiV85QGfG?=
 =?us-ascii?Q?wtmjU5unHY9zXS4acXZAPZx0u4lCOBvIf8/iT+ZmIoqy8sv4VmYfTpZTazhk?=
 =?us-ascii?Q?zqAe7aMt+ySRvfVQ3WN0DqDI9CIhSW3BSloifq6ixSaHeCCG2ZI3zoaeeQU3?=
 =?us-ascii?Q?uL0urJyl0J5vLufd7DogH9MhM+jnTHoFVyffr7WDxzbTDecDm2Nrsa419Oa1?=
 =?us-ascii?Q?fr1EgOv7m/RA1/ZnPSAU7ZBqsNl3d2cUIu1WD2GJNkqT/MNEaD8C93MbG3lp?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da5bb44-f40b-4fd7-155a-08dd36811ae5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 22:57:08.9078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JS+MJHryhc+mWoTvsIonNThqVrWlxbEwvLwMWDLFIbd7AOplvcdjrX250M7gkeHCjYf5Xyfa/s30Ul01T/UH3w==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 10, 2025 at 03:21:51PM -0800, Vinay Belgaumkar wrote:
> Default SLPC power profile is Base(0). Power Saving mode(1)
> has conservative up/down thresholds and is suitable for use with
> apps that typically need to be power efficient.
> 
> Selected power profile will be displayed in this format-
> 
> $ cat slpc_power_profile
> 
>   [base]    power_saving
> 
> $ echo power_saving > slpc_power_profile
> $ cat slpc_power_profile
> 
>   base    [power_saving]
> 
> v2: Disable waitboost in power saving profile and updated sysfs
> format and add some kernel doc for SLPC (Rodrigo)
> 
> Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 47 +++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_rps.c           |  4 ++
>  .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h |  5 ++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 60 +++++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
>  .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  3 +
>  6 files changed, 120 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> index d7784650e4d9..83a7cc7dfbc8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> @@ -464,6 +464,45 @@ static ssize_t slpc_ignore_eff_freq_store(struct kobject *kobj,
>  	return err ?: count;
>  }
>  
> +static ssize_t slpc_power_profile_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr,
> +				       char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
> +	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
> +
> +	switch (slpc->power_profile) {
> +	case SLPC_POWER_PROFILES_BASE:
> +		return sysfs_emit(buff, "[%s]    %s\n", "base", "power_saving");
> +	case SLPC_POWER_PROFILES_POWER_SAVING:
> +		return sysfs_emit(buff, "%s    [%s]\n", "base", "power_saving");

I had thought about something generic like kernel/power/main.c, but that is
indeed not needed since we do only have 2 options. This came out cleaner
than I though, although not generic...

> +	}
> +
> +	return sysfs_emit(buff, "%u\n", slpc->power_profile);
> +}
> +
> +static ssize_t slpc_power_profile_store(struct kobject *kobj,
> +					struct kobj_attribute *attr,
> +					const char *buff, size_t count)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
> +	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
> +	char power_saving[] = "power_saving";
> +	char base[] = "base";
> +	int err;
> +	u32 val;
> +
> +	if (!strncmp(buff, power_saving, sizeof(power_saving) - 1))
> +		val = SLPC_POWER_PROFILES_POWER_SAVING;
> +	else if (!strncmp(buff, base, sizeof(base) - 1))
> +		val = SLPC_POWER_PROFILES_BASE;
> +	else
> +		return -EINVAL;
> +
> +	err = intel_guc_slpc_set_power_profile(slpc, val);
> +	return err ?: count;
> +}
> +
>  struct intel_gt_bool_throttle_attr {
>  	struct attribute attr;
>  	ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,
> @@ -668,6 +707,7 @@ INTEL_GT_ATTR_RO(media_RP0_freq_mhz);
>  INTEL_GT_ATTR_RO(media_RPn_freq_mhz);
>  
>  INTEL_GT_ATTR_RW(slpc_ignore_eff_freq);
> +INTEL_GT_ATTR_RW(slpc_power_profile);
>  
>  static const struct attribute *media_perf_power_attrs[] = {
>  	&attr_media_freq_factor.attr,
> @@ -864,6 +904,13 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
>  			gt_warn(gt, "failed to create ignore_eff_freq sysfs (%pe)", ERR_PTR(ret));
>  	}
>  
> +	if (intel_uc_uses_guc_slpc(&gt->uc)) {
> +		ret = sysfs_create_file(kobj, &attr_slpc_power_profile.attr);
> +		if (ret)
> +			gt_warn(gt, "failed to create slpc_power_profile sysfs (%pe)",
> +				    ERR_PTR(ret));
> +	}
> +
>  	if (i915_mmio_reg_valid(intel_gt_perf_limit_reasons_reg(gt))) {
>  		ret = sysfs_create_files(kobj, throttle_reason_attrs);
>  		if (ret)
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index fa304ea088e4..2cfaedb04876 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -1025,6 +1025,10 @@ void intel_rps_boost(struct i915_request *rq)
>  		if (rps_uses_slpc(rps)) {
>  			slpc = rps_to_slpc(rps);
>  
> +			/* Waitboost should not be done with power saving profile */
> +			if (slpc->power_profile == SLPC_POWER_PROFILES_POWER_SAVING)
> +				return;

hmmm... I'm afraid this is not enough... Although I just noticed that we
still have a problem for the low context strategy.

Please notice the intel_display_rps_boost_after_vblank...

So we probably need something like these:
https://github.com/rodrigovivi/linux/commit/42e24a146239a1b950ed047f619f334f5205ae8a

other than that I believe this is good, thanks for adding this

> +
>  			if (slpc->min_freq_softlimit >= slpc->boost_freq)
>  				return;
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> index c34674e797c6..6de87ae5669e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> @@ -228,6 +228,11 @@ struct slpc_optimized_strategies {
>  
>  #define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
>  
> +enum slpc_power_profiles {
> +	SLPC_POWER_PROFILES_BASE = 0x0,
> +	SLPC_POWER_PROFILES_POWER_SAVING = 0x1
> +};
> +
>  /**
>   * DOC: SLPC H2G MESSAGE FORMAT
>   *
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 706fffca698b..bee78467d4a3 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -15,6 +15,29 @@
>  #include "gt/intel_gt_regs.h"
>  #include "gt/intel_rps.h"
>  
> +/**
> + * DOC: SLPC - Dynamic Frequency management
> + *
> + * Single Loop Power Control is a GuC based algorithm which manages
> + * GT frequency based on how KMD initializes its parameters. SLPC is
> + * almost completely in control after initialization except for the
> + * waitboost scenario.
> + *
> + * KMD uses concept of waitboost to ramp frequency up to RP0 when
> + * there are pending submissions. The addition of power profiles adds
> + * another level of control to these mechanisms. When we choose the power
> + * saving profile, SLPC will use conservative thresholds to ramp frequency,
> + * thus saving power. KMD will disable waitboosts when this happens to aid
> + * further power savings. The user has some level of control through sysfs
> + * where min/max frequencies can be altered and the use of efficient freq
> + * can be modified as well.
> + *
> + * Another form of frequency control happens through per context hints.
> + * A context can be marked as low latency during creation. That will ensure
> + * that SLPC uses an aggressive frequency ramp when that context is active.
> + *

Thanks for adding the doc!
but now I'm missing the documentation of these new profile strategies in here...

> + */
> +
>  static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
>  {
>  	return container_of(slpc, struct intel_guc, slpc);
> @@ -265,6 +288,8 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>  	slpc->num_boosts = 0;
>  	slpc->media_ratio_mode = SLPC_MEDIA_RATIO_MODE_DYNAMIC_CONTROL;
>  
> +	slpc->power_profile = SLPC_POWER_PROFILES_BASE;
> +
>  	mutex_init(&slpc->lock);
>  	INIT_WORK(&slpc->boost_work, slpc_boost_work);
>  
> @@ -567,6 +592,34 @@ int intel_guc_slpc_set_media_ratio_mode(struct intel_guc_slpc *slpc, u32 val)
>  	return ret;
>  }
>  
> +int intel_guc_slpc_set_power_profile(struct intel_guc_slpc *slpc, u32 val)
> +{
> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
> +	intel_wakeref_t wakeref;
> +	int ret = 0;
> +
> +	if (val > SLPC_POWER_PROFILES_POWER_SAVING)
> +		return -EINVAL;
> +
> +	mutex_lock(&slpc->lock);
> +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
> +
> +	ret = slpc_set_param(slpc,
> +			     SLPC_PARAM_POWER_PROFILE,
> +			     val);
> +	if (ret)
> +		guc_err(slpc_to_guc(slpc),
> +			"Failed to set power profile to %d: %pe\n",
> +			 val, ERR_PTR(ret));
> +	else
> +		slpc->power_profile = val;
> +
> +	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
> +	mutex_unlock(&slpc->lock);
> +
> +	return ret;
> +}
> +
>  void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
>  {
>  	u32 pm_intrmsk_mbz = 0;
> @@ -728,6 +781,13 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  	/* Enable SLPC Optimized Strategy for compute */
>  	intel_guc_slpc_set_strategy(slpc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>  
> +	/* Set cached value of power_profile */
> +	ret = intel_guc_slpc_set_power_profile(slpc, slpc->power_profile);
> +	if (unlikely(ret)) {
> +		guc_probe_error(guc, "Failed to set SLPC power profile: %pe\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> index 1cb5fd44f05c..fc9f761b4372 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> @@ -46,5 +46,6 @@ void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
>  void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
>  int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val);
>  int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val);
> +int intel_guc_slpc_set_power_profile(struct intel_guc_slpc *slpc, u32 val);
>  
>  #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> index a88651331497..83673b10ac4e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> @@ -33,6 +33,9 @@ struct intel_guc_slpc {
>  	u32 max_freq_softlimit;
>  	bool ignore_eff_freq;
>  
> +	/* Base or power saving */
> +	u32 power_profile;
> +
>  	/* cached media ratio mode */
>  	u32 media_ratio_mode;
>  
> -- 
> 2.38.1
> 
