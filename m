Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E5886B32A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 16:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CDC10E9F7;
	Wed, 28 Feb 2024 15:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJV1ars9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCDD10E9FC;
 Wed, 28 Feb 2024 15:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709134336; x=1740670336;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oo5Nckm/PVQ5lUpnslR1GiHlhtaOkDSshl77hXKgYEg=;
 b=IJV1ars9HT5ntMn5uw9feQBZ3sbG6w82hnyJfH4FPB2+PYoXYlxda7wB
 Ayp92dmbsehkE7dAKUxhAtjQit4OTWu8tUt1gBDKzb5rk7StIGOKGbm1O
 smACwpbC2fbr8HkHQFfvGRhnpF+FpYe+TwS2MqsGY7XbYOHeKlGcamKWc
 UaDnzZhcUcSdFfp1WsH/aXO8UzQXmGpW660jfQtuPr3gzczdZPXU40VZX
 ar3mYyOXmUSnAOijcN93H/f0Gx6QJVmSu0Kakj0facEVNV/KbxlGW92bu
 bADlhrVnKgSXLX7Gu7wmu8PZWW+j0Ej47Gc5RulFUPStW3KwrDS5Wipw3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="20992827"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="20992827"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 07:32:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="12185984"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 07:32:15 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 07:32:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 07:32:14 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 07:32:14 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 07:32:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMDH7IaoUyTBEUJmkbqu62HV+cmFf2NAPwRRzpw/KfsK52+NwjthQSuKyvbV+YQqW0C3w9jKaCaH6x1M603IZnvSyGytDI2Cne6Z0fGfZZA3aC9uyADxRSiForOokNANsOWBl6HfYaDkLYrKHkIVqx29DZ0c/eXLkuMzYt3NUyVPXIVhp7dlBCYzcjniEHoM4STl5Hg+tqi3OlrO/Hwg0YF5MflsmlPyJntXLg+YTP/DpGMHBG8uERdmVEm/roBZvzqC4PDNhPOK5PqlfnvOZa1kB3D2Oy5Jaj9b1tOavD8zOPlbeHwIoeYmJ0StRGRT//l80bAM22V7yfhuRVlCZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BngxKu8kIHPJ7l0Cdxk9bQiJ8KBv3jrcglINQZmxjYE=;
 b=Qx286lPVMQRI8FuPBrcRJBEMDOeuUOohJjGTv1hzAYWBRMrnWpWU+ZomTY6Hz/agkJlYDL1Z0IcQn8LtmakH8vlAVjaC3+x5mD3VKDdx2IFNf9XfltELQUHb/tDAdvsyUe2pk4csVOKNegWvdNpgHfOLzTwxLd1tR4x0eNAlNEzqzjA6WdYSUq/c72N6iAlAgdihyD2IcXWIICYoARjKkutF+wh4mhyUc4BvNKRWT7qOMeMq0gPC6mY7k0ntcwjsJF1TadVcyoCxb3y1FvZ9XL1YbHdt/MCYvgCa4LbKSbvHPeyJu/szgqL4FACAfHGOS6/II2l8bj4Ei9xB6il04w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5951.namprd11.prod.outlook.com (2603:10b6:510:145::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.24; Wed, 28 Feb
 2024 15:32:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 15:32:04 +0000
Date: Wed, 28 Feb 2024 09:32:01 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Oded Gabbay <ogabbay@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, Justin Stitt <justinstitt@google.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <llvm@lists.linux.dev>
Subject: Re: [PATCH 2/3] [v2] drm/xe/mmio: fix build warning for BAR resize
 on 32-bit
Message-ID: <445lzbkrgtohdtv32rectqzysezqtmf2ar4bhrafcigsclztzl@c2gvmxv65giy>
References: <20240226124736.1272949-1-arnd@kernel.org>
 <20240226124736.1272949-2-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240226124736.1272949-2-arnd@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f925ad8-93fe-4989-2a91-08dc38726a79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EzFk6iG5qlCvfJmWKKKErvCDi7h1OAPDtjwGrui0FWMBqkd8s1GJwRi+x6IqdpzHHhIzxTdvKRvV/VnmGL+Nru+2S2X+YhlHLj0RxVf9fTYTgQtv62WOUw89XWIbnuVOkyUwwITRPNBJakNLXCEYJNzcQ/M+aJ3z/wqHQTUq4EZqeAx60gCMN+WMJWkkmG4Mfd1mzliqfjoY3mOM5+ztaMXuacqUdxe7PIhvGrYBNGvQ57MchH8quROHelE+Po0EiG/kEyt/DBXxlpMy6wVcXYanL/L9mbkAbqILL1p/2T3RzkCTzChtzRkqoLgolJC+sIq83Jo+2Mglx0oYZMqA8hJh2lh1hiRpkLZ7Y0yOADbFQi2u+PmsvA05sFcKWbgB3/hdwXphlMhk7Av9NTcECJQI+vaFlEEHImFE5gBn17FwAl1mlKeiChw4dwXPwEYXSeavi9WW2lx+xtUgWCB2zouNCFZT5R/nRh76J417iyvfw/ErnoVnbnYwcVqOTBwZkV8VPpbY9K+Z03Lc1InwlXWKwLG7gzmFsdPBbVaQDthmrm/L9ZoeRftXsXbxmO6pnkLwm0mniSHPWMfG+G35avIG5SWwGCFV9S8WQNZBkY2B1QJF+/kqCI1F6Kq2/SAdJeSLdGDp4h9bPbSLAO1o3jAKhz6MKfimRYySbR5wfvs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G+ysUDctIOVKDfslV+9rxBaSaEBZG4N/oa7yFGeJ1jmS37KNsmI7TMWDQDzk?=
 =?us-ascii?Q?cUmuajlP/o6nn71BGHXBj+d3zY2I0LMqo/0cf5+YLrBmPn1teSkq3azWoVEr?=
 =?us-ascii?Q?CIep/6Fm7DHLTjDUamltBboh2UEYg0by6ZpYqK2fzmFomXVTWnrD2vkQ1Gm3?=
 =?us-ascii?Q?0Rfb5oS87HY3WdgH1Igv+Vv4RdvBoYOFk9gIS8tVCVhC0vGZaFZ0pQO3482d?=
 =?us-ascii?Q?cQLfgfg4kFBUaUaUEoyM5ZttP3K5aVB4b8j6blW80cV5128ClQwqKvk+ZBz0?=
 =?us-ascii?Q?lDpI/T4ACqR38GFOM+CyM/vLmwExEDDtDxu/uRjaZg5pv1uGLt/WPdEO08rF?=
 =?us-ascii?Q?qWB1uguohrLW2W6MuDcXNDp90eewovKlUlm2zCl2TqaPDZ7zNfwMC9bwhKio?=
 =?us-ascii?Q?Qbla9/mDeYvuI7AMs31+TUVLGSZv7X3ejHRfsuJGauyVIvENuAWs0VJI73FI?=
 =?us-ascii?Q?XCCCZWpFj29y2ls4q2xHBIS5pcUc+yLEsibT6hphvM6bH6AUmEl4HduANpkX?=
 =?us-ascii?Q?H9TV5ELvOOj1TDfEFWzaUmHla7dJ7WFlATZ3FUKh6PVpQ6O1k8AWZD3pzl8G?=
 =?us-ascii?Q?bXHo9t53uqWhycNiUNr6Jt5E80fjESTTEUp4AHCkjaljEOsYQwMmNFuE/u2x?=
 =?us-ascii?Q?uG0uU6JaM5aOcPiac8Z3tR+T2+hZKJZu9C88fJ0L132cFHMHWbbQkHIsMqlg?=
 =?us-ascii?Q?V9Tkh9T1lC0Jn+H6DAnW4bcCKibC+i1+hGBmZIaB8qHNLJWaeeI0yM4u5v8L?=
 =?us-ascii?Q?Qn4DpjFpgLKTujLDj90IaUgJtSd3yKy99GdaT38lGpF31Vj3zFu0+7GQVLJh?=
 =?us-ascii?Q?crwFvOA8SKCToMPin1MKhaCf2REcOvDbCNpjVNcT6bXl0G8CM2EeRI02z5Sy?=
 =?us-ascii?Q?9XZCDsQhOZhUFEvSoNrq2Q5WXpqdrTCqT0rFqggC+KE5Ce93RDQIphwiHkrw?=
 =?us-ascii?Q?SfYcS21QNJdcYZpF1lEjLrYzr8+rQZRrvJlgyQDiceFl1h5DB7alNlEKFSKx?=
 =?us-ascii?Q?KLPnwfWngbzl0hF4eK37nNh1yeOnplk09nMF3LF5wb0c/fNQjgkGFrNCqlyu?=
 =?us-ascii?Q?YB+cBnPKMincocOwzIyxxk73I04PvGaE5z900vETsk8Gh9XLZv5UVUZ3CJDv?=
 =?us-ascii?Q?fvDYYhsols2UJmPiwq77WgAHQlFTZRgSt3LoHaUq/LjobYsXreJoEGyMjRUU?=
 =?us-ascii?Q?kKS/CmLQSH9FiQywEHBrCYrraCrKE3RYNJMK+WWVICfv23QAxqn0zBClruNk?=
 =?us-ascii?Q?8PLtmbifXe4QVt1uYkYzikM+71QlcD52Iu+hEPrS1azw13MfGzUM7PhYeugr?=
 =?us-ascii?Q?3hRSVzdPlG9xEVtcOTUGNGQNE7wfK7HNSF1Vg8vmyalqbnl9rXkk0pNOEhH8?=
 =?us-ascii?Q?jMPcWiBFYi5rU6kpJ0LukEzU7pw2nOk+OHmjQOwKIJO0WgV/jAW4RMTE+z+i?=
 =?us-ascii?Q?r8ReF1OL/veek8/aPQyBtXTIKXh/eUspqn12Hu4vYGGGh+sHlPwiYWQfH9Cf?=
 =?us-ascii?Q?cmHCPmni3Nasl9TNkR1aC8INcpUHoLYBndsRDOCZq+E7GRYauWrPAVOSQFWP?=
 =?us-ascii?Q?eBSJ96X0XNLvSKW7SynBCuvYT0SsKGsv0Fvsx1l9gTHsvEzR5r5nh7BAq+za?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f925ad8-93fe-4989-2a91-08dc38726a79
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 15:32:04.5139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXljN2Zwgu4cTiO8t7efJVvgDrB+t1/f4y/rYm8mvk+BrSJVXf5ff4EY2KQYXHnEOtlZ6+GDXePM1B/h0+nRXk1p7wN68X98oK2YNxH4RfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5951
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

On Mon, Feb 26, 2024 at 01:46:37PM +0100, Arnd Bergmann wrote:
>From: Arnd Bergmann <arnd@arndb.de>
>
>clang complains about a nonsensical test on builds with a 32-bit phys_addr_t,
>which means resizing will always fail:
>
>drivers/gpu/drm/xe/xe_mmio.c:109:23: error: result of comparison of constant 4294967296 with expression of type 'resource_size_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>  109 |                     root_res->start > 0x100000000ull)
>      |                     ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
>
>Previously, BAR resize was always disallowed on 32-bit kernels, but
>this apparently changed recently. Since 32-bit machines can in theory
>support PAE/LPAE for large address spaces, this may end up useful,
>so change the driver to shut up the warning but still work when
>phys_addr_t/resource_size_t is 64 bit wide.
>
>Fixes: 9a6e6c14bfde ("drm/xe/mmio: Use non-atomic writeq/readq variant for 32b")
>Fixes: 237412e45390 ("drm/xe: Enable 32bits build")
>Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
>v2: use correct Fixes tag
>---
> drivers/gpu/drm/xe/xe_mmio.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index e3db3a178760..7ba2477452d7 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -106,7 +106,7 @@ static void xe_resize_vram_bar(struct xe_device *xe)
>
> 	pci_bus_for_each_resource(root, root_res, i) {
> 		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
>-		    root_res->start > 0x100000000ull)
>+		    (u64)root_res->start > 0x100000000ul)
> 			break;
> 	}
>
>-- 
>2.39.2
>
