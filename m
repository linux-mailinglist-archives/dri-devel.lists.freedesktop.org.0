Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5288C95BE42
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 20:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18F210EBCB;
	Thu, 22 Aug 2024 18:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5J9TO1L";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC08810EBCA;
 Thu, 22 Aug 2024 18:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724351599; x=1755887599;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hFTHifbcGps0FjdbWWrzMTl9epI4aRzaDMWd6tUTyJY=;
 b=m5J9TO1L7AiCArSsjlcFQo8nSgFvjptfNmxhuIfxenei0wzma3LF7jI9
 3MmolwSzAQcVVuSPO12cphPXtjRk5X6jiAdLMVcCsDuV6ovUa8ybQ5/Ng
 crn1h+DC3w0Heu9DoZYy3pxlELvAtx5EQGRWvyto9Tbk97/CofLqUSice
 giqJb3ywSqNjFOHp3khU79YktvfiCL6mZkbJsHoBY8ChmLla5zQYpXMXs
 gdQSSdrZuuFKWaNKOkySebCaEeu5hOzSM70sj90mLQZKuO7YhJDq29Ryi
 SczRdP6J4GpzdmdKb9FMA82U3dYgjbAyo3pWB3uTz55D47hCX8nEmGCMj A==;
X-CSE-ConnectionGUID: x3+ba7BITYuk3FIz+sintA==
X-CSE-MsgGUID: Kn6X6QEvRv66YOQRBd45lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33457056"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="33457056"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 11:33:18 -0700
X-CSE-ConnectionGUID: H2PVAUPOQGWJlCdmtgf2vQ==
X-CSE-MsgGUID: aJMfadIoTKGPhsDAlcMAkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="61389404"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 11:33:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 11:33:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 11:33:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 11:33:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 11:33:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzadruRjYvedjSS1cFALWRhQFzjObHk6oyWct83ZWAur/kOiy6BGWobIYXKPD8/FYDP87z7lrVxWdi0dYQTDAbvNX9lhR/pvyjZ1DHS8Z15VhMTq7IHAIHn+N8dpUHRPo/ESN/ISS0WzyLXdoixa7gz4LUv/jW4O4udSw/ptyOF3uzf7Mft2t6O2WdnCHkHyxkXuTyyn1YnbFF7wVd2LW8BNI8vnFdcYwbdyEhEimJ2d/WkBAIO2T2UxD2CbONVqDSNvp3qO7itCu11BGjFQ4ht4x1IXkwJpSMPAgT6TB3x9pCzpoHNvMHmapRCCv8kMc6TuCxt8LrlQSLAK8KgE+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6VGRQcUQ5qFKXZdmXrgkHNSGFLH1Z+NjiAArkR6zN8=;
 b=UsMK07G/sx9M/YVdTWxegFQroQ1aCrvezfUPJ3GyzcK+ih2q3/OnDj3jAzl19EKcOqNamEVK/iUYjLWtqOnHCvgdD1ACMo/LJpqYhFN6VhOmufNWm8Gl0fqwzdUz8KAolgq8wROtCOr5q5A6doNbAXibVZEnN3SHiG/GMBX46yi9tjne0e+FsK4yd1Ro8lZLc50mVQHsaN2g7T9ZNdoPb6yxF4cjrwq/UnJpHxfkC5PZf/RUatLtXxnR8ERTis6LpXDImzJ76uQFR6D7fsKpxand/UqEjzP7/xWl8Dm/CPo81JT+lQbejbEW6JYBpfe8ddKaqnY/pn5K4/Z278ir2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV3PR11MB8505.namprd11.prod.outlook.com (2603:10b6:408:1b7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 18:33:13 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 18:33:13 +0000
Date: Thu, 22 Aug 2024 14:33:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <John.C.Harrison@intel.com>, <Intel-GFX@lists.freedesktop.org>,
 <DRI-Devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915: ARL requires a newer GSC firmware
Message-ID: <ZseEZeJ1_mvPJy0n@intel.com>
References: <20240802031051.3816392-1-John.C.Harrison@Intel.com>
 <7853e9a0-d2fb-4ce3-b071-2cf8fda45a43@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7853e9a0-d2fb-4ce3-b071-2cf8fda45a43@intel.com>
X-ClientProxiedBy: MW3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:303:2b::17) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV3PR11MB8505:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bec44b3-6467-44a4-b8b7-08dcc2d8e121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GTyJ324v4W+z+rBQB8k/xoU8JDA4Audm9ZtMEUWywY2yTTpheX7RN7dxVwF9?=
 =?us-ascii?Q?F6rZBnZI1EI58C1PLgiPED6w21goiKQSlG7XyEd3/6RXKuSUDfEBhnqxCQSk?=
 =?us-ascii?Q?zVyx7Q/KHiG5G0f5ulUNwjEm3tpICrHiaStv1RxT/KMDcu8gqFHOM3yEr379?=
 =?us-ascii?Q?CBautbaN4s+AKJtfeBhbuMmxKcnQV3GebcAQuVlVMegE6gvETKiMlph3zMr9?=
 =?us-ascii?Q?gb+7/WpilOPTC6A/R0QK8Y7HJeXYhxe/Gr3bEX9V3jd21QXHLlN4hQp5qZi+?=
 =?us-ascii?Q?s9YfMq6VkVk4e24GDAwYg16DuZC39uYLi6z2YhYtaEntT2YUtVYtpUirdGE1?=
 =?us-ascii?Q?NOO3dXm/na5E5sa0z/y9Mv5y+etiZgZ1DvZoMZQor7XZiPnSumAacDUlAt3A?=
 =?us-ascii?Q?ZEgJvyTvLeu7XiATGRllJL+V4y3ttkeZSQL6OPkMrZ/yE+ZL5mF0xbcyiFoW?=
 =?us-ascii?Q?H9Bkbn/LSU6Xj4WA4FL5WXpGvyiclJVciCHNkNuSDz7YDYO2QcMyp+w7g2NW?=
 =?us-ascii?Q?JCAEQZcCm9HrR/OVVz+2lwGS5J7d2IimkgVB06YrmJv9J7g5TB7msfRE/wjF?=
 =?us-ascii?Q?HkRuxV+wcICmzg207HDBzgA9gJMpwidE4DrgEo7H8VUWyown0rpFYuQFLhnM?=
 =?us-ascii?Q?jQPCeNh5EMxzHyoP2vt/zCp+jPgcowwQsQkXoibuvBqnvHr+5SRl+eIKOg5R?=
 =?us-ascii?Q?UiogikIYjriwYR4PxgG3lOr1JwoRa/H1cjybrL6mLA+VWPmzr6OeevrAtcjk?=
 =?us-ascii?Q?LjvFqCQpGq9ddEzAPsPhUpZow/5mufvZ2hlnFhTOa7Al6ZaFATgHLhxdgts6?=
 =?us-ascii?Q?ivUUbKrHwsYr3iwElrnkuDcdGvJcmlOk/MBddb+kheHUhhpkeEkZOBCMFbRr?=
 =?us-ascii?Q?E2mwUK06lpIclsbi17jv2GRgwMv/uijWvuzNRj1VU5XsQbWfZrtnj1XyGc05?=
 =?us-ascii?Q?uD6riZ2KraaHIp9bJlhau8qYFQ7okps3MgmKAzfm+iIMNLFW+hMPZejpjI94?=
 =?us-ascii?Q?R4+ZP4xDDlbJwlnbDeOHfWmTG9ekCXQtZDTejAzZKKrOGnR7Hp7/vpvjSPdj?=
 =?us-ascii?Q?jHyju8htwMCxjf3L4jV+EhC3hDBxZ1aSSR6jUO55GwtaSIdlAGlQ6htzgXZ5?=
 =?us-ascii?Q?QiZIwL41riJWokrdwqLKRMDeidN+VX3smhuNyR+ts2CtYn0/3xnf79bTOsc9?=
 =?us-ascii?Q?ZTJ1uAJzh/F8anEt+Y/o/IcXgh+wpwu2PsKAScytasdONYkUe1L5nwJpFvBq?=
 =?us-ascii?Q?zMrVqIxhXhh92e4avm6ITi8IlWmUtk//sXUz1KTZQPS1xsik1xD/7fgiw5ko?=
 =?us-ascii?Q?uSj0z+gJ2iOUYZ8GXZf3Z0/bJoqDnWoftKzcpu1vNkUCww=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4C+4sySC/6GU0OsjleXmbUOI+I2AQBKjFlCOsyT8EUxNfZdepYh/QVH45aSF?=
 =?us-ascii?Q?CLNZn6+q84uQcDvWj7u87X6AMW+TN09Ng+NDWkumXGAB3JFe+KEhvOtJbo6Z?=
 =?us-ascii?Q?plMgQ31/DQEXMLOtcBqiipf3+OCLtkHcobBtqbZCIDUJAoC582ufPgchykdG?=
 =?us-ascii?Q?9BjLME+jHSVBqyOd+0woeq26EDUcGs1JZ5pf86l785xcvOXTLuix51lHyfQa?=
 =?us-ascii?Q?/KKR7neWzC5Z1kabG7Ioqp84cY4+PSxOKqnoy0jFAc7skOhuyHU15qXTUwYj?=
 =?us-ascii?Q?mDEI3t+4AcqKcY0HpGQVPrkU4sN/nrQI4vJdY1oIFfp09qRdxhYNXZHmLo1i?=
 =?us-ascii?Q?s9/av4HtXi3mcaXjqE4qtRvsQC5hWfTEcJqWEVfIybCfnozNbqh0tn5CIFOM?=
 =?us-ascii?Q?AKeX8DATw1p8obkih0ggTk5eyDp9XYHyZSxEis7MXAK4Z3fJ5TFHQAtg8M15?=
 =?us-ascii?Q?UfmVpZkxWzgcm9p9dCwLPKayJtpZ7aC+N3gs4Hhpkfe3cOiHnEtLvzZd6E8b?=
 =?us-ascii?Q?HqMwyy+PkoFpKxo6O69rsMTAMvgQqdNJJSU+0OnYr1XfG5LKSl1MpcSo8wDg?=
 =?us-ascii?Q?BEW7uGsRQiWkjOokbhYOhjFhAVdGkiuK29QQl6phbxx9cR+UuxD9TPeOnSiV?=
 =?us-ascii?Q?tchDOBx66QfNP3uvi8fsNozPboDbBnRLQCRx47WPjn+KDxRcjEcKSA3pHhgC?=
 =?us-ascii?Q?P48tagQH9Uq9KfPXBuYl809RBYIGs62FLAlqnf65IfJ3Ve5vhsGf53/GyPRw?=
 =?us-ascii?Q?6XqBQhcNPSUluxBl1Evh/qM9e6FRTLqpsjwy1lALvGBfPX/78PgaIQteNRHS?=
 =?us-ascii?Q?FpGyNJ1mR2FDGxdvofUd5hCufAawuNgQ0zb7QkCTDg35dWHC2R1YbPuMm9iq?=
 =?us-ascii?Q?2TqbJoe1TYcND7eC8TUv2Jye7gyolNAskcpSiJap1I1fGQgdyGAiR9VfyCZv?=
 =?us-ascii?Q?Q1mAttUOdI7TgaraG8mnhKyc8wgj53ZTQWYFrcwMMs0fM8+P8jMF5xfKiH//?=
 =?us-ascii?Q?BD8ARgk3aQWWRcMNr24dvZ/F3xF5g0BYtFg5DfA85y2XSRGRAhM02xYP4qhA?=
 =?us-ascii?Q?9puPJXl9qy7BVaP657o8eHGzikDMmLgxfzFh3bxo71tzB+UGLPBWK7P+U5e/?=
 =?us-ascii?Q?Ks+OiAXsa4rPtW+FfKH88/rIFTXSnIBmZ81Wu8o+NWxqTw45IFlDUyQ25pRk?=
 =?us-ascii?Q?pSD9otzEGmPf7Z2UVX5jBy8rnY0S8qoxMYOOW6mXzQxBeMOo53YeX16hTgoj?=
 =?us-ascii?Q?orNkpaPFObLpoMhk4ks4fz9J+VrKRip3vs2kg+a3Mn6ZuPdnNihUZ9M3m4SN?=
 =?us-ascii?Q?VAbuoYSKF/2dyJtvCTI4FqZnO+CTubsZAnTBXDjo79LXGq4FnGfQCvu+B5BZ?=
 =?us-ascii?Q?vt2DdD4b9BGTAvgmoxCHFHo4wPFRAxCuc+xMjM22zEB2crU5pt11PZvRFWe4?=
 =?us-ascii?Q?xLPwHszNK8l7vKTTnbjQ4dOr0pgQL+/4Phe6njBJYW0BAVJ2MtFM5f4J6r15?=
 =?us-ascii?Q?/MH2rEdlZtVjSOJmJRyKESGLnP/QyMh4miC1mZlj4OB+8ICmlG6SSg+yJ4ww?=
 =?us-ascii?Q?uNtQsMx67bz8kCTt97gXSk/G5R/zlgMhzwkxTbWMfxwwLVqibkny14TUCOl8?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bec44b3-6467-44a4-b8b7-08dcc2d8e121
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 18:33:12.9788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1h8v+EmwMr7jl4bp1aGOzJdgMu0mq/a6BihoNjSPXEnE3dYkRXlHx99kXFPzuzu0B0sBSpDPaYQWt1ojBkkLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8505
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

On Mon, Aug 05, 2024 at 02:22:13PM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 8/1/2024 8:10 PM, John.C.Harrison@Intel.com wrote:
> > From: John Harrison <John.C.Harrison@Intel.com>
> > 
> > ARL and MTL share a single GSC firmware blob. However, ARL requires a
> > newer version of it.
> > 
> > So add differentiate of the PCI ids for ARL from MTL and create ARL as
> > a sub-platform of MTL. That way, all the existing workarounds and such
> > still treat ARL as MTL exactly as before. However, now the GSC code
> > can check for ARL and do an extra version check on the firmware before
> > committing to it.
> > 
> > Also, the version extraction code has various ways of failing but the
> > return code was being ignore and so the firmware load would attempt to
> > continue anyway. Fix that by propagating the return code to the next
> > level out.
> > 
> > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> 
> This needs a fixes tag. AFAICS we already had the ARL-S pci ID in the kernel
> by the time we removed the MTL force probe, so the best fix tag is probably:
> 
> Fixes: 213c43676beb ("drm/i915/mtl: Remove the 'force_probe' requirement for
> Meteor Lake")

yes, we do need this Fixes tag.

Please let's also ensure we propagate that to stable.

Cc: stable@vger.kernel.org # v6.7+

I even wondered if we should have the removal of the pci id in a separate
patch that is easily propagated. So, please check this option.

I mean, if this applies cleanly to 6.7 or if it is easy to backport it
is okay a single patch..

> 
> > ---
> >   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 31 +++++++++++++++++++++++
> >   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 10 ++++++--
> >   drivers/gpu/drm/i915/i915_drv.h           |  2 ++
> >   drivers/gpu/drm/i915/intel_device_info.c  |  7 +++++
> >   drivers/gpu/drm/i915/intel_device_info.h  |  3 +++
> >   include/drm/intel/i915_pciids.h           | 11 +++++---
> >   6 files changed, 58 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> > index 3b69bc6616bd3..551b0d7974ff1 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> > @@ -212,6 +212,37 @@ int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, s
> >   		}
> >   	}
> > +	if (IS_ARROWLAKE(gt->i915)) {
> > +		bool too_old = false;
> > +
> > +		/*
> > +		 * ARL requires a newer firmware than MTL did (102.0.10.1878) but the
> > +		 * firmware is actually common. So, need to do an explicit version check
> > +		 * here rather than using a separate table entry. And if the older
> > +		 * MTL-only version is found, then just don't use GSC rather than aborting
> > +		 * the driver load.
> > +		 */
> > +		if (gsc->release.major < 102) {
> > +			too_old = true;
> 
> nit: the 102 major number just indicates that it is a MTL/ARL image, so
> unless the binary is corrupted (which should be caught by the checks higher
> up this function) it should be guaranteed that this matches. You could
> probably skip checking for it (below as well).
> 
> Apart from this nit the patch LGTM, so with the fixes tag added:
> 
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> However, given that this is a non-backward compatible change that we'd be
> propagating as a fix, please get a maintainer ack as well. IMO there should
> be no problem since this is only breaking for ARL and that platform hasn't
> been publicly released yet, but I'd still prefer a maintainer to confirm.

We really need to be careful with this for the next platforms.
If we have this risk we need to start splitting better the PCI IDs
into the different platforms and removing force_probe individually.

But for now, let's move with this.
Not only because the platforms is not at the shelves yet, but because
it is GSC, not GuC and because it looks like the platform would
be broken anyway with new firmware. So it is not a regression, but
a fix really needed for the older platforms.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Daniele
> 
> > +		} else if (gsc->release.major == 102) {
> > +			if (gsc->release.minor == 0) {
> > +				if (gsc->release.patch < 10) {
> > +					too_old = true;
> > +				} else if (gsc->release.patch == 10) {
> > +					if (gsc->release.build < 1878)
> > +						too_old = true;
> > +				}
> > +			}
> > +		}
> > +
> > +		if (too_old) {
> > +			gt_info(gt, "GSC firmware too old for ARL, got %d.%d.%d.%d but need at least 102.0.10.1878",
> > +				gsc->release.major, gsc->release.minor,
> > +				gsc->release.patch, gsc->release.build);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> >   	return 0;
> >   }
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> > index d80278eb45d73..ec33ad942115a 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> > @@ -698,12 +698,18 @@ static int check_gsc_manifest(struct intel_gt *gt,
> >   			      const struct firmware *fw,
> >   			      struct intel_uc_fw *uc_fw)
> >   {
> > +	int ret;
> > +
> >   	switch (uc_fw->type) {
> >   	case INTEL_UC_FW_TYPE_HUC:
> > -		intel_huc_fw_get_binary_info(uc_fw, fw->data, fw->size);
> > +		ret = intel_huc_fw_get_binary_info(uc_fw, fw->data, fw->size);
> > +		if (ret)
> > +			return ret;
> >   		break;
> >   	case INTEL_UC_FW_TYPE_GSC:
> > -		intel_gsc_fw_get_binary_info(uc_fw, fw->data, fw->size);
> > +		ret = intel_gsc_fw_get_binary_info(uc_fw, fw->data, fw->size);
> > +		if (ret)
> > +			return ret;
> >   		break;
> >   	default:
> >   		MISSING_CASE(uc_fw->type);
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > index 02f28a6170c39..17561b53648e2 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -546,6 +546,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
> >   #define IS_LUNARLAKE(i915) (0 && i915)
> >   #define IS_BATTLEMAGE(i915)  (0 && i915)
> > +#define IS_ARROWLAKE(i915) \
> > +	IS_SUBPLATFORM(i915, INTEL_METEORLAKE, INTEL_SUBPLATFORM_ARL)
> >   #define IS_DG2_G10(i915) \
> >   	IS_SUBPLATFORM(i915, INTEL_DG2, INTEL_SUBPLATFORM_G10)
> >   #define IS_DG2_G11(i915) \
> > diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
> > index d26de37719a72..eede5417cb3fe 100644
> > --- a/drivers/gpu/drm/i915/intel_device_info.c
> > +++ b/drivers/gpu/drm/i915/intel_device_info.c
> > @@ -203,6 +203,10 @@ static const u16 subplatform_g12_ids[] = {
> >   	INTEL_DG2_G12_IDS(ID),
> >   };
> > +static const u16 subplatform_arl_ids[] = {
> > +	INTEL_ARL_IDS(ID),
> > +};
> > +
> >   static bool find_devid(u16 id, const u16 *p, unsigned int num)
> >   {
> >   	for (; num; num--, p++) {
> > @@ -260,6 +264,9 @@ static void intel_device_info_subplatform_init(struct drm_i915_private *i915)
> >   	} else if (find_devid(devid, subplatform_g12_ids,
> >   			      ARRAY_SIZE(subplatform_g12_ids))) {
> >   		mask = BIT(INTEL_SUBPLATFORM_G12);
> > +	} else if (find_devid(devid, subplatform_arl_ids,
> > +			      ARRAY_SIZE(subplatform_arl_ids))) {
> > +		mask = BIT(INTEL_SUBPLATFORM_ARL);
> >   	}
> >   	GEM_BUG_ON(mask & ~INTEL_SUBPLATFORM_MASK);
> > diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> > index d1a2abc7e5139..df73ef94615dd 100644
> > --- a/drivers/gpu/drm/i915/intel_device_info.h
> > +++ b/drivers/gpu/drm/i915/intel_device_info.h
> > @@ -127,6 +127,9 @@ enum intel_platform {
> >   #define INTEL_SUBPLATFORM_N    1
> >   #define INTEL_SUBPLATFORM_RPLU  2
> > +/* MTL */
> > +#define INTEL_SUBPLATFORM_ARL	0
> > +
> >   enum intel_ppgtt_type {
> >   	INTEL_PPGTT_NONE = I915_GEM_PPGTT_NONE,
> >   	INTEL_PPGTT_ALIASING = I915_GEM_PPGTT_ALIASING,
> > diff --git a/include/drm/intel/i915_pciids.h b/include/drm/intel/i915_pciids.h
> > index b21374f76df23..2bf03ebfcf73d 100644
> > --- a/include/drm/intel/i915_pciids.h
> > +++ b/include/drm/intel/i915_pciids.h
> > @@ -772,15 +772,18 @@
> >   	INTEL_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
> >   /* MTL */
> > +#define INTEL_ARL_IDS(MACRO__, ...) \
> > +	MACRO__(0x7D41, ## __VA_ARGS__), \
> > +	MACRO__(0x7D51, ## __VA_ARGS__), \
> > +	MACRO__(0x7D67, ## __VA_ARGS__), \
> > +	MACRO__(0x7DD1, ## __VA_ARGS__)
> > +
> >   #define INTEL_MTL_IDS(MACRO__, ...) \
> > +	INTEL_ARL_IDS(MACRO__, ## __VA_ARGS__), \
> >   	MACRO__(0x7D40, ## __VA_ARGS__), \
> > -	MACRO__(0x7D41, ## __VA_ARGS__), \
> >   	MACRO__(0x7D45, ## __VA_ARGS__), \
> > -	MACRO__(0x7D51, ## __VA_ARGS__), \
> >   	MACRO__(0x7D55, ## __VA_ARGS__), \
> >   	MACRO__(0x7D60, ## __VA_ARGS__), \
> > -	MACRO__(0x7D67, ## __VA_ARGS__), \
> > -	MACRO__(0x7DD1, ## __VA_ARGS__), \
> >   	MACRO__(0x7DD5, ## __VA_ARGS__)
> >   /* LNL */
> 
