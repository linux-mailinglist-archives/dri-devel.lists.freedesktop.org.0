Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943678668CE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 04:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A448410EDB5;
	Mon, 26 Feb 2024 03:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5M/tlcG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED81A10EDB5;
 Mon, 26 Feb 2024 03:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708918933; x=1740454933;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qF7mDhw/DsOA4d+jt2lM0DBFJEPmnDCvtjE2Qg/Bgus=;
 b=m5M/tlcG4ApUdQndkit+8czhH8TG7obcQrUUR4pNDyL+3xvUWqxalpFY
 7WfGHLNFMRc44AKl30fb6yfQIzD47meBwKRWdWf2BxmiTYkK/3uDgAL1D
 8KhHKYfgmKIFs3jSCk2dZ3VGdi+QFgopWKeXREeKyHoZCaLZ4Ma+byNGy
 sxlI7VbonYOQKp0/qOKPhe8x92/fnOe7hM+NB/3kNjihH80pAo4QZz0+w
 L/mdGXrGROOEpOwst3hfK/lWN10A73qQR31w8rdTG3UKjtYXP+pn5tDZs
 PUZCbjf3wYKhj+Lv+wYD+iWxBS7DDklCyBNxFP5Vs+JCMv9yi1jDFbquz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="14316914"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="14316914"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 19:42:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="7029748"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2024 19:42:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 25 Feb 2024 19:42:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 25 Feb 2024 19:42:11 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 25 Feb 2024 19:42:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEdzrEERhJK2ssBAlvlbtKA+/052tYSznQElawvpzv88DnrqlOjGESZyt0lf1DEjL8rCFKv9jrTHdcDxeM9Ye+g+1Zd8vFT52AEIpqkhnb15TdxTbMYnFucJczogduCs8CAWJxn9Fsf+lekDCkdeYBcCWM8TvVMaHFD/V4bKFago+NsBwvoCYynlH4TFcejd7D3M4v+auSWzpUo/hXpRM3zY5qKnq+h9+doFSz0VNWY5vJQFXFIqBBxadv8Z/V7w14EICT4YS/U/x32IeTIFjv0ZFbhss9S7AoPvcbJrYj76KCaIjW2QVafa4ne76O6OZbj1tj73oUktjkKGvm9S3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVWNeePCousJsfRs3U3L/k5Mr+FTFLv+9yFgNQolR1I=;
 b=J0H/0Yrbj3qcwwRl2dqV9fwNJUOffRRtXxd+dX4og1cxwbOYSPN7F5nFAqLmP4e8pljgkRJYJzf3M/xwF+OHKpyig7TL9WBueQZzqElcJEe3lhxKvN5darydI/3UkrPU1RwmjA0cl313QbLOaWq8pYoSTDO9wSc+AIAEfnMKp2/ZSIdJa+6tvP8y5XDRzvTsCtOtZhbogZxPU3OwDJBRsuBeDIqdFVM2RvQ5gws7KPB0o1ymCtjR4XLuRWZHfIoagx7djRU1pwHSQ+9rHwwrWLJ0G009OH0hgmvSkUI5TxuDPCKxLMLGEYhuLLvDWJbL9Fz7edJCCMzM2Gu4Yz4NYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7333.namprd11.prod.outlook.com (2603:10b6:8:13e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.24; Mon, 26 Feb
 2024 03:42:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Mon, 26 Feb 2024
 03:42:09 +0000
Date: Sun, 25 Feb 2024 21:42:06 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Oded Gabbay <ogabbay@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Francois
 Dugast" <francois.dugast@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm/xe/kunit: fix link failure with built-in xe
Message-ID: <7hfobmmgs6ntnusobalqxslcyv3kqdlnhxjoxbaful4ameavj2@niodl55l7b7g>
References: <20240224121528.1972719-1-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240224121528.1972719-1-arnd@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0096.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: 1380964c-d9f4-489d-2457-08dc367ce946
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4tn0Tc2tV+b9ig2JXkcrISzyQSnl7rUdcABF/Tl/qh1JBLHxFMo23/D/btz1th1rQ9rXJPq0BY6pUujY+RqTt5MAvK2suq+hn79Zm1Oo9W+gWsIu0WA0uOGO2sH32pKLI193snVqbwzJg2ZSA6fuGXv/oPwUiK5NJCQ5tiafxEIMjdbzUSvTe63H2beO9IbA3FItWUEKJEo/el6A9HFTRaV/OqHw7OrwClF2P1fpS80JAck0DywphUvLKece3ZYCxQhF4/p8qcWpHOK6qRiyqYVrbMiUzn5HpJp3fvFv6OZqlfmZFu567oCupQ6kLE6D4LXa6nLVEwCk+qPCefhLyBLaXQ0eLeReKFTyz+oqnQ/6RN4QLgWr6+gbxRBy2hMpLnM3l0EOn6YXGASETrIHz67mNEEl4sCJiQsrnM2oquXWGeJ5T/91PCM2MZwkvfaSr81MDoU+8BsIiWfpsU29WI/dVSABJ1VF5oepJRqOfGZz6ZSY7mCfTMFefEDtf36AXCOfxoiuuPmf5ltbRBJ9dUMV4xr7hsMN4cA5SYmEKOlKv9OZfIBgFoaRZ5kO5xN2JdYC/9lTvOKhE/kNgrS2QhWuwEBr3RbHmGsOsMvfBpQAgwWfUIy2m6i+NHf3XArQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jJuKr1Lt54mBWjUvhWWyYgzpuiYceFD1Z9wULUEJvirRYMz5LRnLWoI7Jh+h?=
 =?us-ascii?Q?g+tDZWmnFHwHpyiN1VMW/SB4zzPqEPeb+HbrPA0x1/QUNG+t7yo9JGIEM7+0?=
 =?us-ascii?Q?KsDnVqjvR4w4rLbTNtrrzy4AD2cC53xS1tHvQa/sSxNy99lITTW2zkGZwsg8?=
 =?us-ascii?Q?6kX4u8Wshf9q/RffHkyBITcmq80OVn2AHp6uaXy8MwmDjc57LhHIP+PBZdPP?=
 =?us-ascii?Q?Z9Bs06vKg43T1OutX4lnzVepiDyw6w0v9k5k1fDoA9qyEfLBmRyID94L7KbU?=
 =?us-ascii?Q?xuCv0ovTPT18mAgQBSoCZzmoowziM8tljQjDsckQXQlXQx9VlCMa0MXasqVb?=
 =?us-ascii?Q?qkRuanzg4NgcbhmBsYifaCCzssVvA/9mnkMIVFY9foDqaKJN0Ltv091ngm9i?=
 =?us-ascii?Q?2Ixe9yf4QKYXBVOPp/2Dqqbo6faSoUemXHX+OHfDZCstHEZ53cz7z2p4u/I4?=
 =?us-ascii?Q?vAoiz4si9U0Hc5GIc9kia7pt8oXEZah62/VzcebbqDcxPcbuVhb1h1JMNZci?=
 =?us-ascii?Q?0/FDCgHAvp5SmpTEciqukgc9Y8ut58ncImROf1UrxAH85KP23Ektjg40FpRh?=
 =?us-ascii?Q?mOZD8B8uMrxcbAYectBqwMImxjmwgSnXoSrojNqfeHKp8u3rb85Cw5TxAHjy?=
 =?us-ascii?Q?KwCTqPtZNlQrAOT4NgHMMybs8ymI2XRnRMSByXJpLyYf5UywWpqYghQAM+Nn?=
 =?us-ascii?Q?6SXhw+k0e/rzG7u1SXaTh4/kCEPtJVMYzRXuDbYUev099cWx/2uAyecqPa4D?=
 =?us-ascii?Q?65bqzaj5BqVKWoZ5rA4P/6QF6RqYUDkH8G5k72k6HBnvPamWrsYVAwQsJ7Uy?=
 =?us-ascii?Q?cpvRbG6KnPoB1H62cMTTW7oLDKVu44NDqeljsJ329eja8YAGJOTpIfSc+kow?=
 =?us-ascii?Q?XHZ5N53wn5isfAU7lvczEsn9jOSm6yktoHMe3gxru0UzfXLlct+McNVx3mCp?=
 =?us-ascii?Q?B0yx8YRjiIMCQlikUKyPvIgSgI2n+kqrCjoK/SVMldxZR9roNr/rOwevclfn?=
 =?us-ascii?Q?IlUfh70iz021F08gKOw0QIDP9CZU5AugrRbmge6q6k/8Fd5SLE9vNHYp87B6?=
 =?us-ascii?Q?kOguT9F8+yWMb4meF4O6jG+e9BnS5/GYcdlqLqljIHnvWqhEfT+oqlzPf3cs?=
 =?us-ascii?Q?BwXryduaoy6GhMxNq28NLX7D0iv6DwoJuak4ThQIbXsr2MW+qqSTVPGAR7UA?=
 =?us-ascii?Q?qH7nlJ6Ze7gD7ChRuN7rgYyoX7PZ4vzpXU0neE/NrtjWxkKYG0AKjNg8Upoa?=
 =?us-ascii?Q?y3vimNMjrtMdl9Te1D4cmxWAIX29Z+B8eEe6E1qJVL2cuasOxY8as4VKxAqJ?=
 =?us-ascii?Q?W+nU4p2T+f7BPV2RFYxRc4o0hPU6TI2uTZYlQcUxUMsfq8KKa3UBixNZ6pwQ?=
 =?us-ascii?Q?wVkynUpUN5ScR4atbPlzOFQgpYSMp2VQ8a9NyDlNxHUG7KbxdJrMhFAwmAfS?=
 =?us-ascii?Q?6BsnDGA9IokRVZIdeZds3+LF8vomKH3QO+gEKG40SU7RArjldeQ1BQAymZKH?=
 =?us-ascii?Q?Q9GGIFcraoFJv2bKc5kDwfeEbJUB9HqJ/pqMFNLpaGWHyv3vVxPn14Y3RAd7?=
 =?us-ascii?Q?a54dsFZGzCTvE/vUBGnq+GJ6E6EMFAi1dcqeTHtgZfzgHoIBSK7nSovezcKe?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1380964c-d9f4-489d-2457-08dc367ce946
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 03:42:09.8803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBnUd9IIbnT1moqcgZa9v7RCLObtoGifeznk2p7TQOpINGLOXprjoU3H04Dg4BwDY4vtYho3CkAjb99tSpYsJULz4BabkT7WAgENH3ybtqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7333
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

On Sat, Feb 24, 2024 at 01:14:59PM +0100, Arnd Bergmann wrote:
>From: Arnd Bergmann <arnd@arndb.de>
>
>When the driver is built-in but the tests are in loadable modules,
>the helpers don't actually get put into the driver:
>
>ERROR: modpost: "xe_kunit_helper_alloc_xe_device" [drivers/gpu/drm/xe/tests/xe_test.ko] undefined!
>
>Change the Makefile to ensure they are always part of the driver
>even when the rest of the kunit tests are in loadable modules.
>
>The tests/xe_kunit_helpers.c file depends on DRM_KUNIT_TEST_HELPERS,
>so this has to always be selected by the main XE module now, rather
>than the actual tests. In turn, the "depends on (m || (y && KUNIT=y))"
>doesn't really do what it tried and can just be removed.

it actually did, which was to workaround issues prior to the commit you
are pointing out.  What it did  was to make sure xe.ko is m, or if it's
built-in, kunit is also built-in. Apparently the problem here is that
the xe_test.ko is missing the symbols.

See commit 08987a8b6820 ("drm/xe: Fix build with KUNIT=m").

I'm happy to remove it though if it's indeed not needed anymore.

Lucas De Marchi

>
>Fixes: 5095d13d758b ("drm/xe/kunit: Define helper functions to allocate fake xe device")
>Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>---
> drivers/gpu/drm/xe/Kconfig       | 3 ++-
> drivers/gpu/drm/xe/Kconfig.debug | 1 -
> drivers/gpu/drm/xe/Makefile      | 6 ++++--
> 3 files changed, 6 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>index 6d4428b19a4c..2948650680e1 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
>@@ -1,7 +1,7 @@
> # SPDX-License-Identifier: GPL-2.0-only
> config DRM_XE
> 	tristate "Intel Xe Graphics"
>-	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
>+	depends on DRM && PCI && MMU
> 	depends on ACPI_VIDEO || !ACPI
> 	select INTERVAL_TREE
> 	# we need shmfs for the swappable backing store, and in particular
>@@ -11,6 +11,7 @@ config DRM_XE
> 	select DRM_BUDDY
> 	select DRM_EXEC
> 	select DRM_KMS_HELPER
>+	select DRM_KUNIT_TEST_HELPERS if DRM_XE_KUNIT_TEST != n
> 	select DRM_PANEL
> 	select DRM_SUBALLOC_HELPER
> 	select DRM_DISPLAY_DP_HELPER
>diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>index 549065f57a78..df02e5d17d26 100644
>--- a/drivers/gpu/drm/xe/Kconfig.debug
>+++ b/drivers/gpu/drm/xe/Kconfig.debug
>@@ -76,7 +76,6 @@ config DRM_XE_KUNIT_TEST
> 	depends on DRM_XE && KUNIT && DEBUG_FS
> 	default KUNIT_ALL_TESTS
> 	select DRM_EXPORT_FOR_TESTS if m
>-	select DRM_KUNIT_TEST_HELPERS
> 	help
> 	  Choose this option to allow the driver to perform selftests under
> 	  the kunit framework
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 4c6ffe4b2172..b596e4482a9b 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -158,8 +158,10 @@ xe-$(CONFIG_PCI_IOV) += \
> 	xe_lmtt_2l.o \
> 	xe_lmtt_ml.o
>
>-xe-$(CONFIG_DRM_XE_KUNIT_TEST) += \
>-	tests/xe_kunit_helpers.o
>+# include helpers for tests even when XE is built-in
>+ifdef CONFIG_DRM_XE_KUNIT_TEST
>+xe-y += tests/xe_kunit_helpers.o
>+endif
>
> # i915 Display compat #defines and #includes
> subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>-- 
>2.39.2
>
