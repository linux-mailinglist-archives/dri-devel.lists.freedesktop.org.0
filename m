Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9287595540C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 02:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E7B10E847;
	Sat, 17 Aug 2024 00:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DBnT4Xhg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C494510E06B;
 Sat, 17 Aug 2024 00:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723853183; x=1755389183;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=09ZozBhYH/6h2PCtlQysb8k0UzNs9JXvlZwr8U3LWp4=;
 b=DBnT4Xhgd7ZCMPTjSyeQWMd7VQHsvQP31+n21QJzJm2F1iCBUQgLhJVG
 D3XPi+MFPBW+dybU/nun48Z9hiyG5wQ+EVZWvSIT8FAW2czKSachGyEZz
 82OBq9cZa6N86XUxTTSFMhGhMHETdstasuQ6ZONfFDZT2rv17W+qzZCxG
 +Remm53xGZRTsCQyQ7f8/u2tvRNFr/TL1sh8ZKL0JOLEr8GwaW9YedlwZ
 D6SmBgsaOAvKdSDyMah+ilMb/g8ruCQtcjk6xbFWZmMyYrXiO/3Lrkk19
 pzPfC+idOo5NwMxGOi0/Bl1QZiCAsvsvzjpIePSR1WRwhAghQrcRoMzjF Q==;
X-CSE-ConnectionGUID: 5+yKP7eVR4SyqSLwybFt4g==
X-CSE-MsgGUID: NRm1QNpnR/SxWFwZ/w8vOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22132576"
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="22132576"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 17:06:23 -0700
X-CSE-ConnectionGUID: cpPEh3ToQniEJikoXxMF2w==
X-CSE-MsgGUID: es0px48jT1K669v/iJADrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="59516604"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 17:06:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 17:06:21 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 17:06:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 17:06:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 17:06:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3oL1Rv6xOLJhCtT4x76ipP27PkQ4LzZl4eY3Dcv08C038meaBGbOZdIHqY3hUvMyoX0k52rh2yLzFNjRIGPE8+L3wTQwchTgJcO3u9BdEF524BhxsmUPpeZhkMq1BpP8RLX9WP6uMYmviH4KHOQZQ+3QnKHS9BlWcv2uJIBW71/Xa/dceZiABaNlO3+sISSFvKumKHvcepMpsAfMr2P5QT98aipNJ/o+/XHgvJwBD0Rl3mXjdIrZI0gPv3FiKaGushpxEFJ4gjK2dC3dTLzCPkjdBpTCEUIFU+YKHc8W4xOhgE7QwQ+TKI14WKyxdccTDsBVS+vGbA+k7QFkTuSRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfvT5QmRenS44PDFr/PkuJZmQzcfc+1XMlQL8Wt39Y4=;
 b=RBaAbgYMQmepuofRmTovY3w6RVpZwfqC2mZUcU8Oo3UP0WKbAEdcMRy9eW9svYwdw1iVM6850wFOC3yazoyOyp7voqSe2UNNI+md5So92OCgfKmidNH6rn2otOd/2fsciJ7WfPVX5/xU1osNhZk5YrGdYdwWB+o1zEi9NdqHpTC/bIIPljGBeQ31Ay0DVSMml1890T7BsukvUK7JzZ7OBaNvE1sRqCWSMQ5K68lNgo4E/ZArVAg9smEXBzVJKlbQG+KYnvK1OKczyZ8mGagE2cWGwFW0E+YF3XLcDYiBG2tc8Cx9fV9ZDmyV/7tZ1bBfr5xOz5fdzjbVwplBhPc8zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB8112.namprd11.prod.outlook.com (2603:10b6:806:2ea::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Sat, 17 Aug
 2024 00:06:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Sat, 17 Aug 2024
 00:06:19 +0000
Date: Fri, 16 Aug 2024 19:06:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/3] drm/fourcc: define Intel Xe2 related tile4 ccs
 modifiers
Message-ID: <j362retusy4czdvzt4jc55aoww273fuam5zx4k4pgoznjml5wl@jgafsq7qqdex>
References: <20240816115229.531671-1-juhapekka.heikkila@gmail.com>
 <20240816115229.531671-3-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240816115229.531671-3-juhapekka.heikkila@gmail.com>
X-ClientProxiedBy: MW4P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB8112:EE_
X-MS-Office365-Filtering-Correlation-Id: 953bd8c0-5d3f-4797-65e2-08dcbe506b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ra59vz8xPOujmh4FpZ5C3130spQw/EFTiHJ9vjqCumcWZpylqnnfq+kzLg+k?=
 =?us-ascii?Q?bkpSa1397ACZUCmsfQiab+PwkqAN6O3fdnn8fko4MaiJ01RQlE7jiR82HHqZ?=
 =?us-ascii?Q?aSdUYZdTmUOBEL9SjGA9N1O04T2d/43oFIoNcTbs0ZAPT/gBP7gFk2anu1JF?=
 =?us-ascii?Q?4TvziqdlRq2XCwYqPsYrW5lORgKYTKLAU+pAp5q7xLiMr7X7bIVET+w3GYgz?=
 =?us-ascii?Q?TZd9IvXTgDPy7yVaEvicsAJ/tRprBzH85hFfrM9E4fq8NLxvrw3AWAqNLzZ/?=
 =?us-ascii?Q?W2GQf/8u+Ipy4WG42GbiFySu2uFfLp6syVsdTO0xMiF+ueFQ0GEz2ak72jQv?=
 =?us-ascii?Q?K/Hh/TYJk45PqIYZYHtrtn4U1xBfEmA8cXsLGE+QXHP/iEGPG1IpMqZyJ6Kh?=
 =?us-ascii?Q?VRle8uhf+tqfbHnURqcqR21cfhWafawwiYQcYQUrkPtimd5zWThcJQO86Pqd?=
 =?us-ascii?Q?ghLyC774N7uUcnaHqc8YSsfrytUNLfmhQXVg+o8EZ7dkVNaAY0B8wq5ZG+Qz?=
 =?us-ascii?Q?kOEANfMGRatZ82yb08PP29oQdoOqT7c+N7+GeqmC7bo961HvVBgSBdWF122y?=
 =?us-ascii?Q?u4MtJysf9mPTui2AECqTU2Pxz+Ebjxbqk2xrv5XGIzF+0EBw1h/6SKQghKbr?=
 =?us-ascii?Q?LtDS1QHq9Obl/6qNojJtAO6/pYLS0n5j9QbxHF44r0tG+Vx0wms6r7R9dtLS?=
 =?us-ascii?Q?QoBE1W2hWadj3oMPaxB+cCpLo/a31NhZua+2DpJMWSASTYo5GDtThMNFUfUu?=
 =?us-ascii?Q?C5b5dgUPS+mFE80VcX1eruvGN7v+P/JamLHtQffuAQfbXAMzyewOLxz/9Ufg?=
 =?us-ascii?Q?d/DGPX8si4vByHOVhwZbpJqnN8UCmQ7h7yzqxtsKrDdxCh9MhdB8gdQA4bQw?=
 =?us-ascii?Q?a40aehU0Od/j90yTG1OiSl0HcVAv1oZyoGXcYeaGSsFsq4tDhf4Znpzkjolf?=
 =?us-ascii?Q?Q50NxN7M9eXnHxl3FaE1adO5c1Xrs4ylZD8s0BZjQn4RH60QirncPLzGdzpq?=
 =?us-ascii?Q?sDprac9Lvl9RQWq/WNRWcf0nrq/q9yDoPIyPNuNZZB73c6dizeyHYu9q30p9?=
 =?us-ascii?Q?17TzWLXvrPNulEP+RYoBOx44UIy061/bQwfLerv2YAj3cHWY8wHbBMLDGSwB?=
 =?us-ascii?Q?ulLgkNx55abYJ9ySJVsyZjXP7nfrhDKWboXzSpPiQ+3oOCrSYhExf9apAN6f?=
 =?us-ascii?Q?vX+F4xvwderndlPaC8/7sD3l6pyDO74xTIvGBtdRZzmlk44Eue6BNHKx0Y8P?=
 =?us-ascii?Q?ryrGFrS8DzF9brGlMTseQpAHmEDFRVjzEViHA4Ww1/gv+ixo0ha/KGVmSF+p?=
 =?us-ascii?Q?a7OmWAS+cB03pGHUzQv2Vy5YDfVVIA/JgDqvS56tFOb6FQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OG7kiAXobVId1RQjKXNplARfKYdHSGn75B3UahX3KoCVVlGKetOpqky2s/ge?=
 =?us-ascii?Q?BetR2IwVzmBfWP7v7RBPGFw371Ofsx/yGOF9/BJdAM8na9NJphyUP7m/H834?=
 =?us-ascii?Q?XRK56MSfsMCF49/N7/Yo+1d+79xNQcwDVCL7Uh+DTrxpns1XPljbVk76E02+?=
 =?us-ascii?Q?vPoB0wLAzPgeKsXi2DnQl0qgunBqd5QrrweLxYWZsIQq5jh6WGsksU6YyPIN?=
 =?us-ascii?Q?3CKGflX6+ccmsGIiS7Ce2wTj/Y+N658h4gCqD15dJPUmnrTAIHVOw5kSNnMx?=
 =?us-ascii?Q?HBWwKVgOLB5MHDQJHQZfT6JmzW+LELATtOvjxaD9hYPQHG5Yx6DDBRG3I/zY?=
 =?us-ascii?Q?xs77xWUEhcu1WjlYSvAk+H6RFqiFaaXC2XzOj4Wh7Oz3dIjdkPM2Ld4Q3vEz?=
 =?us-ascii?Q?Q+TDpllGyk5vEATaVv2882aeD0FtxsYLcY3ogJBlTkpDno4xUNSacsDAzHlg?=
 =?us-ascii?Q?G9BOjOnoY7eBq3/c6+f1LIH0X5wMYHL/O+8GG6KIqVIRpe5U3SSTsOlMD7UX?=
 =?us-ascii?Q?9jwe4SH5ED+502s60sMSXL2Y/5GmU4X6qEH7FRjQYZdRbCVwqMDNyrjkLfQN?=
 =?us-ascii?Q?dKNICZpGwBp1n9683ompU9ZBKzUm4ZWl7a8THI2mjhnfEZlOR5ovPLtKaalB?=
 =?us-ascii?Q?7TlCp8/HoHcoXupM8bY1yUlc8h81/Bg31EFNMXb5geSyMswEXnwC4/PIXB8b?=
 =?us-ascii?Q?c54C8D+h3dzu4T8LbvO1D87f87hvJorL3VqmpEi2FyXrnvmIIvWenINKfnWc?=
 =?us-ascii?Q?UldTag65ImXThuNvSBapJ1Paj+8vyI7HqDoxBHEVUI86pK9Se4IPXnQ4w3us?=
 =?us-ascii?Q?TgMsXsPKURfBfT5WMey8cGsT2uZEUR6N8UBOhrokcop4q6eteSrtVc820ywz?=
 =?us-ascii?Q?aRfA7S7JzvPKbSP/TXiMUHlyu6Y0ukmqCNxCq1zJF+ibc+SjlEjB70bCybRp?=
 =?us-ascii?Q?sG9dOjhL2Jvk/ctN74ejdy2jDAxxVsDc0iWUBFBQs6vFhS7V/l5x9BxRlQjg?=
 =?us-ascii?Q?gn56JSY4KU4dEbDP5fTUyrHgDTjvFgINin/eJsbR9pru8eqtAkn6A+PDS/IX?=
 =?us-ascii?Q?ccEhhzSev6T7ocDNliGyfar4FaJEBf5k3aFcG4z5FeDDyFgxv5C3LhFhNYj9?=
 =?us-ascii?Q?AeiaHzD+qNLd6YkdUxq/HNGeqO50MUCsN5gBtV0p245xtCdm4BQ2bDDLdlY8?=
 =?us-ascii?Q?C4mCHYiPJd0jHj44/mpQLrg6RX4sYcye69lM3pVey2c33zAnRw0GN+VT/+Oa?=
 =?us-ascii?Q?W6DCRMEs3+GOc2BZQqKiaUK3ByZy7R9rfn0pqyBp3/11j5epUE+7+B+fZpfh?=
 =?us-ascii?Q?LSr4IcxYMRbDmXyxZBIePf4z18ukJvJGnyBTaos1GMpLStP4LkgKZUihprHk?=
 =?us-ascii?Q?3e0Jkn+isoAL+rxmlAeq5md0JdOcmjDcnyfBaLhgfqEgd/JWhb+2j1S8JXnq?=
 =?us-ascii?Q?BeJkp04L1zYCWyYhX2HW4rBEl9PJKD+DT1T4GIO+ToMir0rEUpkmBTi3lZsg?=
 =?us-ascii?Q?GtNJd8wx+SEajrnHhlEm0jzqeBTLs6DLSNlhgZ159VhP8Ot+WnsheShHZthi?=
 =?us-ascii?Q?xeT8I8FulxbZTGMeJ9C/04MW3DJLARit4yCPNG+eskXcWFLOtwwmA9a+UQcC?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 953bd8c0-5d3f-4797-65e2-08dcbe506b85
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 00:06:19.2297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhZOeqVmC6Bm321tgXJDeTQ6w1g8zA3cPBhGCP7pfws3s3hx3xzLIrtdHzia39ILeZIrqIKUR5KIxYUaUIpn+jjbpHWvTnvSbJs9dVqIhbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8112
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

On Fri, Aug 16, 2024 at 02:52:28PM GMT, Juha-Pekka Heikkila wrote:
>Add Tile4 type ccs modifiers to indicate presence of compression on Xe2.
>Here is defined I915_FORMAT_MOD_4_TILED_LNL_CCS which is meant for
>integrated graphics with igpu related limitations
>Here is also defined I915_FORMAT_MOD_4_TILED_BMG_CCS which is meant
>for discrete graphics with dgpu related limitations
>
>Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

not very fond of adding the platform names, but looks like this was
always the approach, so this keeps the consistency.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

We will need an ack from drm-misc maintainer to merge this through
drm-intel. Let's add some Cc.

Lucas De Marchi

>---
> include/uapi/drm/drm_fourcc.h | 25 +++++++++++++++++++++++++
> 1 file changed, 25 insertions(+)
>
>diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>index 2d84a8052b15..78abd819fd62 100644
>--- a/include/uapi/drm/drm_fourcc.h
>+++ b/include/uapi/drm/drm_fourcc.h
>@@ -702,6 +702,31 @@ extern "C" {
>  */
> #define I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC fourcc_mod_code(INTEL, 15)
>
>+/*
>+ * Intel Color Control Surfaces (CCS) for graphics ver. 20 unified compression
>+ * on integrated graphics
>+ *
>+ * The main surface is Tile 4 and at plane index 0. For semi-planar formats
>+ * like NV12, the Y and UV planes are Tile 4 and are located at plane indices
>+ * 0 and 1, respectively. The CCS for all planes are stored outside of the
>+ * GEM object in a reserved memory area dedicated for the storage of the
>+ * CCS data for all compressible GEM objects.
>+ */
>+#define I915_FORMAT_MOD_4_TILED_LNL_CCS fourcc_mod_code(INTEL, 16)
>+
>+/*
>+ * Intel Color Control Surfaces (CCS) for graphics ver. 20 unified compression
>+ * on discrete graphics
>+ *
>+ * The main surface is Tile 4 and at plane index 0. For semi-planar formats
>+ * like NV12, the Y and UV planes are Tile 4 and are located at plane indices
>+ * 0 and 1, respectively. The CCS for all planes are stored outside of the
>+ * GEM object in a reserved memory area dedicated for the storage of the
>+ * CCS data for all compressible GEM objects. The GEM object must be stored in
>+ * contiguous memory with a size aligned to 64KB
>+ */
>+#define I915_FORMAT_MOD_4_TILED_BMG_CCS fourcc_mod_code(INTEL, 17)
>+
> /*
>  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>  *
>-- 
>2.45.2
>
