Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E23486B32F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 16:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C739E10E5DA;
	Wed, 28 Feb 2024 15:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8IxhFTE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957A310E563;
 Wed, 28 Feb 2024 15:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709134402; x=1740670402;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pl3eBVgjj4BkV56v9nqCFbyT3cYJzMnm4TdUVBFrDnU=;
 b=m8IxhFTExrRwQXNOPcLSLhzSwyluZi73S1ziNezvIybk6OkXDQtyngqZ
 z+FhrBA0SDRsexFKJja33og6CYWjApU/0LjRddRJtlOxizrGmxoPiQf/t
 QQBjSQP3I1cAiJAcGPBJL7igQQaELnqAO2pvQBQzLPDUxD6HxV6dfD3Gu
 IishIlKS8AR+M1MPYjiN5DZoDR8Qr1kgJf/N1/3uXIPT9X3E688KtrJNh
 TxHZCjr60pF/r9+0x8UCV+sw7Ot8hX+ZfWUZnx/PQT/vzBfZjmW4Vk1K+
 VS9zgot9FPHOAeOAYB7W3dqLMQ3ZbimxhWOj+tJTgM1Tj1M2p3tHA+KgQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="20993141"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="20993141"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 07:33:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="12186789"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 07:33:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 07:33:15 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 07:33:15 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 07:33:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muNb1sEHWIJHvrHbyMMWTGf9aZ4OCGFVB7+b8YWvfJkBW77H5lRCXIz5l9hpd0i8Pu1l/VmmqzHSoJJ2rCR6dmOcOB0PmBeg+hFAydycHPAEEvfwDaIWb1tF6KPTM0j1xkUDD9VrMmlvvXoxl3ITnrhTUhbSPerhBVAX+3+m2WqMhkEXAcSxsY6XGc32IUvaquwArXIHIi7Z1JeM50cxijrjhZXa9SUA0t0nkYZ6n2bwcWE4tKdSaAtTqWq3zbLSv8OGUVB8Iyon22fAAxLfwf29r2cuUgnqg0hhVnhOP5HP/I32el35pbnupJUVLT+q5b/046g49p5+y6B9tQI/JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6OEk8ODhyMjYhY+xxPu6W2z8SEw+pcljv27pqW6ajg=;
 b=B3Xid9AIRVN2yNLMj7RqRUrux1zv57eSpCi1bduPQn5f57c7KX/m1NyBOohphPFofb74wg1FI9RTNy4sas+ECxu0w4RWBfG3fbemsCraekgsDAEb0fYEK486KATIiSbJeYmtnZyr6GmdblrokjuwFDe4zm/w7piJ1wY6ZHVGrKiVT73eJ3Oj+mLvLpKatgPE9WZK4LW/Oc1+bLJXoYZHDOXgcqmg75nd/tJtFEYOjxa4TOkyKoTD/mmpn6ASDpcxVmhJrXAdzOXrAGaMl+yuKpNLGsqvZLTIdPg2+EJt7U6+AgtaVgmxCNfdUXCXlFvBhm/6jy6k13wT46wl1t5krw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5951.namprd11.prod.outlook.com (2603:10b6:510:145::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.24; Wed, 28 Feb
 2024 15:33:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 15:33:13 +0000
Date: Wed, 28 Feb 2024 09:33:01 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Oded Gabbay <ogabbay@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Jani
 Nikula" <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] [v2] drm/xe/kunit: fix link failure with built-in xe
Message-ID: <evkoih7ms43gg73jmtjwpyntsm77vs4tm27iblm5fcet27kekf@e675w5ccnpo2>
References: <20240226124736.1272949-1-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240226124736.1272949-1-arnd@kernel.org>
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: 9407e3b5-9cec-4d84-6cc4-08dc3872937c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 61nrZdOegrUHWhPkBtyCk6eX7HnZmKwtTYOYGn5gh2xnRTv9wXMmRqDBPHlXnU5wr2P0y88vTA7JxkSKMTd12+PRXAoaNDEs+JkCnzQv54IQmNxC69xdWKYthz9B1pblB+iNbSkKXJEeSsoh+AArphtVHys/JakbdcJKt52PZNedy1XTU2K1PW+tyCz6DmS206z5XwRoH1TdqP5ijDsyrBfzUQOLkwfK9M1N0H8GOpE74FS/nkD///lzTyiWIfjjJOq+dxWGmYBO0WSuh0AJyWsktrQB4PuUEcp6Uji7ftQTsCnl4SbqLPfxU4AsP68jsQpkPGQYrq32GDO9r03BZjYf8op7Lp0gYCY0yWjyU5/layi1lMPU4DnlmfdN0z8AkLbtD/XJyo+ai83S51aNLVML/xU2BA7bdQoleHKEcL/1O+rxBxso4mx7SWQJTIXJry6dRoP1+u9Dc+cI1uoxR5eLYtK0J3mFUzgFWBkO0n3BGtvCDGkYapYQEFjBrAubsR/jBDfQBUbabOFqTqzgdIZ4UC09/+W4RiDVKuJvHrOtoIlfqb9APR+3I/BZCpygq8uPJU7dbPymI8ZH60PqGPPixh9nlZcRUXaRpOkqoJWlv+LTJIiJPaiR8kF1EOiG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7sQabO7rEqhvt2Tb4/HKF5t9nKLH7Q0Bs7/PTUftKicYuP0IhcagQNVLEFJl?=
 =?us-ascii?Q?SnWD/EuhbaR0qb1sB6W5lgJQBCIUQruA9YbTPfKZSqPpWJxD3t18OjXbDUFl?=
 =?us-ascii?Q?DCis+6A3as40AbsmZFbL0yqzV49RD5m/aVYUVqiTsK8Qeu29T6wtjYZ/WZOk?=
 =?us-ascii?Q?5USj3CApkdZInTceI2OJcQuer0OsQ3GZ+FRiDL4BXYZh+BBDruhM4RE/jCHx?=
 =?us-ascii?Q?AUDsrrAmehznAseJNpB3ujlfmo3hHcpAJ+ivHny8qAelPzA977KalMi8qay3?=
 =?us-ascii?Q?kYnyYP0+5kxv6koaQXSK5IyjCPxpt8Ux2gGVnmaRGryb1VIYNFlaFCXgVxpg?=
 =?us-ascii?Q?k+9xZqtbjnayr/LvPuR8YVPshAVQ5UneH9U4FSlmKEQGb5gL/zXh6EyemEHL?=
 =?us-ascii?Q?clraP3766ojCUO9i/44itjbESbgSX0F/X7QlOHg60wGitNjDU7eTHwQvMM81?=
 =?us-ascii?Q?LXPkSEf8rUbllS+Q4WkPbEQw3HGW9OG9YWL9driuz3ej8jlbyYqAZ9zVodyh?=
 =?us-ascii?Q?a/PHXg1hB8ztXZOnZts+txecmha6aqbhiJMpKZEriqN1YCCvwOW8oneLVb//?=
 =?us-ascii?Q?y2tEJohC3a0MhhX0zOKa0G74IVk1fv9Vwk/8X3IVvBFpSPVKIxdmvraThcI1?=
 =?us-ascii?Q?SNsaypnH1bDKXmI/wWSl45J1VmgAhtNnHiKv+881S+oD6MfKq//I3Kd8pkp9?=
 =?us-ascii?Q?k/JgXsLCb+d6PB85pR1Udb3ZTGNyRmDilhmjl9XyqnsliG9kfB2dLyZeMwvF?=
 =?us-ascii?Q?7Xn5++2cKrAsdX7jhYuBFXz1/8W6Aq4hTnHxNju/ZuVVzxkiCvxFwSUB77HL?=
 =?us-ascii?Q?1aJBXPHNx6skjSFFbOmNS4rXDoVGiPcNYgJubDJcouuoFRD70EUhNnhuleDq?=
 =?us-ascii?Q?Yv0CRHGVkLFpcN1lzqGY6cCLm/P7Ola3Vy575RjifnCgGE+PMiNlck382mWc?=
 =?us-ascii?Q?lKhVstiDPWZbFIT2yv4HtgLPkaWPvVMUX+5rbHPb10HqjbGm9xTY38kD6M/j?=
 =?us-ascii?Q?9tyaE6juHUyZBnAciaPAZQq23pH1m7uoJNUKOqcbnw8Y+XeuBvq0M5cYMmcM?=
 =?us-ascii?Q?ipz8Tvt+MEu/8c2Fh28A8gVtsVVV7JVrVGkrLXOdzfLWfu4Sd1wv0/Prf4l5?=
 =?us-ascii?Q?6KA0zx1FTCo9q0PZkqyYoYUz6c59iJ9KFYOU4tYP+P8GNogKn8JFtihXuONq?=
 =?us-ascii?Q?YFlcKLhROHJ42IszSsufLvi3NB1NWJssPe7LCtbmFzSY2PkSeiAUz+L4Rsl8?=
 =?us-ascii?Q?7GiFqr/KK/cCZt4Zz62YkSnEvPpb9F8cOaLxCFWGHU5tqRLIgTGjkI06vfgq?=
 =?us-ascii?Q?p5pUahUZjSToqZqg/55IoGA3t5KSnlWM0pK2attoinbvzJoMXgpP2rzknZ5n?=
 =?us-ascii?Q?fCo/lrLuNfoinGfYOhp15bfQkb1yJn/z6piX1fwQ0p5cnK/qKlCQppHZiluL?=
 =?us-ascii?Q?UpYXbXSjixnLwROHf7eTZ0T0xpwrqy6MeN+aEf0kVOWw1Q1Az7kVhGISYIOP?=
 =?us-ascii?Q?JNSFzSjTr4KBk4BMId8XG2x+MatiIBit364diQIfjkHDgKMBRoYR9sjg7K2m?=
 =?us-ascii?Q?glrt6L8TcOurHHxvSqqNIcENizkFeV2cClqVXaOXT4imv5o5rfrHr+KATpLV?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9407e3b5-9cec-4d84-6cc4-08dc3872937c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 15:33:13.3015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJRoMM3vygbHs85FJ9qfPxlOYJWj/xgZlwTr6ngwyqbsLGEiU/x1q4e8TykSRvsz9onQ5c2opCw7VPk+Ja9bQGgfDJ7MRn1SuHgAI3O8A2I=
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

On Mon, Feb 26, 2024 at 01:46:36PM +0100, Arnd Bergmann wrote:
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
>Fixes: 5095d13d758b ("drm/xe/kunit: Define helper functions to allocate fake xe device")
>Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
>v2: don't remove KUNIT dependency
>---
> drivers/gpu/drm/xe/Kconfig       | 1 +
> drivers/gpu/drm/xe/Kconfig.debug | 1 -
> drivers/gpu/drm/xe/Makefile      | 6 ++++--
> 3 files changed, 5 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>index 6d4428b19a4c..c3a3b204ae5b 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
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
