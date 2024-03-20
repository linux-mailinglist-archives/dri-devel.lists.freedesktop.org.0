Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A35881A0B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 00:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6725910E937;
	Wed, 20 Mar 2024 23:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hj2l7nAl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF51010E09D;
 Wed, 20 Mar 2024 23:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710975693; x=1742511693;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Qo2Y4gVf7Za7PL+oyGA4JtsXyElyHQjMRhPRQRRef5o=;
 b=Hj2l7nAlhI9+IysFjVYVDusOtxe/hdSiG1aYwA+5oIxLhdyCjOBsg7w7
 9J8aJ7KZ4FvXe6F9newp6OONMChkQgzGRIsvFuScGyeFbVSlL8Y9O/Vzm
 jsNucMs2oQ1VKlZC0uoIv9DmrlGRDVPvS2DDkLX+belm3/Mvzb88WPBa+
 G4klLNY1calm6UYpiS7AoQ8eaGG6x5b/mLXltPuvBcs99/6qAuzUaIkUx
 t2nVpsKZ1VEZB8cdtNaD47aJWZHixwrd/D4RT2G34LnzVFjQHEZDR1vav
 bk63RbNuAkrDq6mpzeydwUjmkKsyCaTFZ96lq7jn0WodSJzDpTsrgUaD4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="16671170"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="16671170"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 16:01:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="18948647"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 16:01:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 16:01:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 16:01:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 16:01:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIErM4hNEbead5lT+iFJ//mOl5LZfbnzmOXPkKIJx/a8Tj/r+G/1aUYvCBjet3ZTg7FOOQMnROY00wXNUrUOhJntIln3+4FBsmQIT04eR27YSizssk1TNhbbHF283wyNRHqMSs7/kXVnApWbx0ClocNgyG/ROYYhHY8oLUBzGbnU0HPPZfjjjeqtF/dT2gaM8w0HwCTosJK6+Mr2TBlXYNq2qw7DrtuHAgyUNbZ0J8o244IYdEW2Szukhg0pLlFL//EBzhd4rS7vsCkyopsCKT+sGkxHHw74ewnJ53coXgRQjkGt5P989U56FVNGQFt+ydgQ0jgGqDfQ3kiK7OGJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gMQqQg7q6ZLAMVhW8YYyLuZo9Ygfq6gx5HNrdsdZ/c=;
 b=j87h9CzreqgGe6cOlrHSrGVotiP3+miJQZUg3ma1Ol+FrDJ7h5wNHSd68/nh9QM72ce4EZlhybCRnfadDkfK65/JxkqviIIBAZlBIs9EmLSnEooBHogRyHM5J13VfslZmH6o4fTKX/XEzK0p1lFL+H6c2ko/ZIU28rq0W851kIMP/HwRzftEUeyrAJ0jJKVLQZ9N0SN9C6rOJqzksYOASC4zQeQT5uxZ+yXzMP7ySSkJqlF6C4vs5+ZK2g6lYZ0H5Q8TPYFuab4jYcsydFD90Jq+iE6KrTVOzyvQ/sH8pWUoU+LR3QJZNGMj4cZU+Z+DOIzNe1KSBTW4NlI5VPeGnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6801.namprd11.prod.outlook.com (2603:10b6:510:1c9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13; Wed, 20 Mar
 2024 23:01:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 23:01:24 +0000
Date: Wed, 20 Mar 2024 18:01:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC 2/2] drm/xe/FLR: Support PCIe FLR
Message-ID: <yijkvevwkkbvknfsavams7oihpe7inhht3ezcz5ylo3um27miu@tzrycoc6gsyu>
References: <20240320104426.1592959-1-aravind.iddamsetty@linux.intel.com>
 <20240320104426.1592959-3-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240320104426.1592959-3-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0151.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: bbb17d27-fafd-4fc5-9208-08dc4931aa91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yyPw2s8Td8AgtLWPKe2KuId8YS+pPwc2WQqHPGSuyXhnDEzgINpvMBb5PFHE1Kwv9l5MNECUPoqUqc6NA4zKENZvxLGKYE+tAsXEBGIhjUsdbh15xFwuNFs6bPs644saE/TMSU9As7T29HRMM+YNvQ3z0sFsuu+zNf6mBtsJO6XY2mfwoE/g4NH804IeYU1F1WNWMg7DgtYSrhZfgSeHHLKOrqWAzrl6/UBuF8ZWqgoE/B7Kaoe/n3oNuc9xxUlfcdHKsL9Nt/h47HXg6bPIQCn7vjtsdIw4PTE6IaaVXwbFxevhTSADfuQxt5AlyFHFdXqDJ361+H8sPfnZFXP7Wr4KjIM4VOUpfOp8K8YPITyCiewNdf9jQvrGJhxikNHylMcK9H89hfRX1+88PppuWNYoodrIP6Lu26FIvon/3kkXawtQSx9F1i/yguAv1Rz41Bva3tvqt+Jf2JUu5wvaXMartTMQNqi90/VvSEyj2unm/lIMjr0/aWUSVh5ZJpXlrZWUruPrZhXLTY3v8ZXO1L5SZKY4U4wbhkfC1wSrezQUUb7FWs3bD/PhqJKTnu2YU11KWPy0UUbJ5R6IVuXwz4IGroQeCJbCs884OPljyfYmnjL8NOgSAWxhAFfZBSd3x7apuMvzHskMIQILoUf2OScckllzYtsbHIO3VOGz+no=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zOy446cOmRbOZ5zQ2Bp5ZQPrzWDi14g/2fRy0IKHAdP7/qprPMgdmmNy+v?=
 =?iso-8859-1?Q?Q0WlHY7t4451TBTXWf5cMPbL10gAkQ4kwuyylXhiuD0a9bMjqu3Q879eOr?=
 =?iso-8859-1?Q?ujCY6sALE4dyQk7mrzUE/a/SGfITa169IuZMTKJqPv3dVwcoMRCWTEj3gM?=
 =?iso-8859-1?Q?gq7YIYLApwbagdT6Co595Gz+yk+4Mn064/ez3r9wwQFcLSbrKRq89MsY2j?=
 =?iso-8859-1?Q?QG1V7DFpi2LK1ZS/UkCVC/9BCU/d6f8E391Zn/EkiQBi/v2+iwKE1c7wFY?=
 =?iso-8859-1?Q?jhtVD1nfaA4mwo5us1BrpUk2gAwAWFgknCp+gHl7ZMQ3bzmtIIe6pB7CPo?=
 =?iso-8859-1?Q?zs3Nim4ImbwRYXUZvZpyPvaEtSfRK4PIdeLHo8/Kth0Jbs/U+XK8ZGvZbT?=
 =?iso-8859-1?Q?BvKrujbfU5pvVqBcVarKHiymTq7SjO70sN/ntNb0Z1j9qDtwhWBlRUa9r8?=
 =?iso-8859-1?Q?Eld2St3BCB8K+3DPegVYCLoVlECYOL+I2kc/YxF8+aeEnA7rEAfyeavG6V?=
 =?iso-8859-1?Q?GotOCDVN6fxffuo9byg/p0E4jUp2al0GT2fsaMcSlODAwMmV+OhT3iPsJo?=
 =?iso-8859-1?Q?al98h7UPLgXEUORdnH6x0fpbYb9yh/nvacGxUftPoy4UM3TEPmdGCIQo0T?=
 =?iso-8859-1?Q?zSUH/zkTR29rWIQ78cPPY8YjbGjRareYmzhJGC5JTJUB5lz+x7ieXCgL+l?=
 =?iso-8859-1?Q?Fy/JjoWFJGqIlDofoOkKL1A01w34QgMx5uPTIaXQiT2XQmMLBIyzHgzPue?=
 =?iso-8859-1?Q?46uY05IJwf9GwkiiU0HKiEICSxmxT6vqk+RokxmtS2OrYxfNhBdsTiGhwy?=
 =?iso-8859-1?Q?M11P3tRD+XY3X4GMEC1DdFcZX5mGG2l+2mDzfTVQmpDnecPiMu5CbsgLG+?=
 =?iso-8859-1?Q?Hlszc2AjiViqeZn/i4l3C5k0SuTlMOJtZw+zEumIiu7BAyyWAzQ/oOeEpR?=
 =?iso-8859-1?Q?lC6hp5KDn5GCrrx4XKZOXHF9lM60ooQeGBS8tQj7Qci29uBpcUz8QwC5CC?=
 =?iso-8859-1?Q?B9fxKGh34EaaAFHCm52Iw6VboNXn8ZdjzJMZlSy6wdUdX+S7VN6d8caaPl?=
 =?iso-8859-1?Q?vi45URkL6Xu+JU8EON5xKSW3xIJO8dh5AoOykm4wl40/2IAUkGxLWUpyoQ?=
 =?iso-8859-1?Q?E1NE6NxFUGbkejlb8j1vz1jwq1wj07tWlsYg1LPD3yLrEIQpQGoI4ip4Xb?=
 =?iso-8859-1?Q?2uCTVYjVOo3mlZ/am8gIeTXXIOgzvY38AeracMWTAMZOyTBh1TamwPQDW6?=
 =?iso-8859-1?Q?+XJNTuPvYHp8ehXh95mN8LXObas+zw0sy/XU8bbyozzqd43nc5y6RG+ohK?=
 =?iso-8859-1?Q?Sm/GDsSw0aOJoirDL59rMLtcwt3I+c8rNKr8evz6KTFt8tHT4UiroeBdZd?=
 =?iso-8859-1?Q?v6dhDpWIbK9Y2tD891Vkw/W9oG5L8n7+0VELUCjlNcC6VeECiXBlEq6K7C?=
 =?iso-8859-1?Q?E6BfaMsZh/cBjmWc1Q3+rtrwP8AvcyKrKAfOCLLtznYnNq+mWJAIezsG5G?=
 =?iso-8859-1?Q?fn6+2EQHVDxoPF8vqNeDTP0qF4SVQlp9bEPuFlPkT/uJni4WGrC68k4eEm?=
 =?iso-8859-1?Q?CgDvIMSFZEgTUQe/YR3O2X2Yg4VMvN9mAB8XYB5IKJIfDDTp87al2xOjfL?=
 =?iso-8859-1?Q?c/KrNG94jkdXhGw2RX7NCg+a5Pa4m9Zgo5i2wgT0Hj3gm0CYhUaSutjw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb17d27-fafd-4fc5-9208-08dc4931aa91
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 23:01:24.5968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZzIP1B9tJ+Tddp33KGkMwwpkRX8fy3ouXkP5itF7QWYwY1+dvI+PzT4n0rDMjRw4roqJQbJnG/NFWNJC6FFA6AMONlwG2Cat6U4n62Q9bE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6801
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

On Wed, Mar 20, 2024 at 04:14:26PM +0530, Aravind Iddamsetty wrote:
>PCI subsystem provides callbacks to inform the driver about a request to
>do function level reset by user, initiated by writing to sysfs entry
>/sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
>without the need to do unbind and rebind as the driver needs to
>reinitialize the device afresh post FLR.
>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>---
> drivers/gpu/drm/xe/Makefile          |  1 +
> drivers/gpu/drm/xe/xe_device_types.h |  3 +
> drivers/gpu/drm/xe/xe_gt.c           | 31 ++++++---
> drivers/gpu/drm/xe/xe_gt.h           |  1 +
> drivers/gpu/drm/xe/xe_pci.c          | 53 ++++++++++++++--
> drivers/gpu/drm/xe/xe_pci.h          |  6 +-
> drivers/gpu/drm/xe/xe_pci_err.c      | 94 ++++++++++++++++++++++++++++
> 7 files changed, 174 insertions(+), 15 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 3c3e67885559..1447712fec65 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -114,6 +114,7 @@ xe-y += xe_bb.o \
> 	xe_module.o \
> 	xe_pat.o \
> 	xe_pci.o \
>+	xe_pci_err.o \
> 	xe_pcode.o \
> 	xe_pm.o \
> 	xe_preempt_fence.o \
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 9785eef2e5a4..e9b8c7cbb428 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -455,6 +455,9 @@ struct xe_device {
> 	/** @needs_flr_on_fini: requests function-reset on fini */
> 	bool needs_flr_on_fini;
>
>+	/** @pci_state: PCI state of device */
>+	struct pci_saved_state *pci_state;
>+
> 	/* private: */
>
> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 85408e7a932b..437874a9a5a0 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -629,6 +629,26 @@ static int do_gt_restart(struct xe_gt *gt)
> 	return 0;
> }
>
>+/* Idle the GT */
>+int xe_idle_gt(struct xe_gt *gt)

any non-static function should use xe_gt_ prefix.

>+{
>+	int err;
>+
>+	xe_gt_sanitize(gt);
>+
>+	xe_uc_gucrc_disable(&gt->uc);
>+	xe_uc_stop_prepare(&gt->uc);
>+	xe_gt_pagefault_reset(gt);
>+
>+	err = xe_uc_stop(&gt->uc);
>+	if (err)
>+		return err;
>+
>+	xe_gt_tlb_invalidation_reset(gt);
>+
>+	return err;
>+}
>+
> static int gt_reset(struct xe_gt *gt)
> {
> 	int err;
>@@ -645,21 +665,12 @@ static int gt_reset(struct xe_gt *gt)
> 	}
>
> 	xe_pm_runtime_get(gt_to_xe(gt));
>-	xe_gt_sanitize(gt);
>
> 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> 	if (err)
> 		goto err_msg;
>
>-	xe_uc_gucrc_disable(&gt->uc);
>-	xe_uc_stop_prepare(&gt->uc);
>-	xe_gt_pagefault_reset(gt);
>-
>-	err = xe_uc_stop(&gt->uc);
>-	if (err)
>-		goto err_out;
>-
>-	xe_gt_tlb_invalidation_reset(gt);
>+	xe_idle_gt(gt);

this and the above should be in a commit alone
"drm/xe: Extract xe_gt_idle() helper" with explanation it will be used
in other places outside of gt_reset path.

but I'm a little bit confused here... why do you need to remove
xe_gt_sanitize() inside the function to make gt idle?

Lucas De Marchi

>
> 	err = do_gt_reset(gt);
> 	if (err)
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index ed6ea8057e35..77df919199cc 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -43,6 +43,7 @@ int xe_gt_resume(struct xe_gt *gt);
> void xe_gt_reset_async(struct xe_gt *gt);
> void xe_gt_sanitize(struct xe_gt *gt);
> void xe_gt_remove(struct xe_gt *gt);
>+int xe_idle_gt(struct xe_gt *gt);
>
> /**
>  * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index c401d4890386..fcd2a7f66f7b 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -383,6 +383,41 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
>
> #undef INTEL_VGA_DEVICE
>
>+static bool xe_save_pci_state(struct pci_dev *pdev)
>+{
>+	struct xe_device *xe = pci_get_drvdata(pdev);
>+
>+	if (pci_save_state(pdev))
>+		return false;
>+
>+	kfree(xe->pci_state);
>+
>+	xe->pci_state = pci_store_saved_state(pdev);
>+
>+	if (!xe->pci_state) {
>+		drm_err(&xe->drm, "Failed to store PCI saved state\n");
>+		return false;
>+	}
>+
>+	return true;
>+}
>+
>+void xe_load_pci_state(struct pci_dev *pdev)
>+{
>+	struct xe_device *xe = pci_get_drvdata(pdev);
>+	int ret;
>+
>+	if (!xe->pci_state)
>+		return;
>+
>+	ret = pci_load_saved_state(pdev, xe->pci_state);
>+	if (!ret) {
>+		pci_restore_state(pdev);
>+	} else {
>+		drm_warn(&xe->drm, "Failed to load PCI state err:%d\n", ret);
>+	}

please check coding style here and invert condition so you keep the
return-early pattern you started in the xe->pci_state check.


ret = pci_load_saved_state(pdev, xe->pci_state);
if (ret) {
	drm_warn(&xe->drm, "Failed to load PCI state err:%d\n", ret);
	return;
}

>+}
>+
> /* is device_id present in comma separated list of ids */
> static bool device_id_in_list(u16 device_id, const char *devices, bool negative)
> {
>@@ -688,10 +723,12 @@ static void xe_pci_remove(struct pci_dev *pdev)
>
> 	xe_device_remove(xe);
> 	xe_pm_runtime_fini(xe);
>+
>+	kfree(xe->pci_state);
> 	pci_set_drvdata(pdev, NULL);
> }
>
>-static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>+int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> {
> 	const struct xe_device_desc *desc = (const void *)ent->driver_data;
> 	const struct xe_subplatform_desc *subplatform_desc;
>@@ -786,6 +823,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
> 		str_yes_no(xe->d3cold.capable));
>
>+	if (xe_save_pci_state(pdev))
>+		pci_restore_state(pdev);

why do we save and restore in sequence when probing? If we only have to
have a saved stated for possible errors later, why do we restore on
success? /me confused

>+
> 	return 0;
> }
>
>@@ -833,7 +873,7 @@ static int xe_pci_suspend(struct device *dev)
> 	 */
> 	d3cold_toggle(pdev, D3COLD_ENABLE);
>
>-	pci_save_state(pdev);
>+	xe_save_pci_state(pdev);

all these no change in behavior with xe_ functions wrapping the the pci
ones could be delegated to a prep patch so it's easier to separate the
noise from the actual changes.

> 	pci_disable_device(pdev);
>
> 	return 0;
>@@ -857,6 +897,8 @@ static int xe_pci_resume(struct device *dev)
>
> 	pci_set_master(pdev);
>
>+	xe_load_pci_state(pdev);
>+
> 	err = xe_pm_resume(pdev_to_xe_device(pdev));
> 	if (err)
> 		return err;
>@@ -874,7 +916,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
> 	if (err)
> 		return err;
>
>-	pci_save_state(pdev);
>+	xe_save_pci_state(pdev);
>
> 	if (xe->d3cold.allowed) {
> 		d3cold_toggle(pdev, D3COLD_ENABLE);
>@@ -899,7 +941,7 @@ static int xe_pci_runtime_resume(struct device *dev)
> 	if (err)
> 		return err;
>
>-	pci_restore_state(pdev);
>+	xe_load_pci_state(pdev);
>
> 	if (xe->d3cold.allowed) {
> 		err = pci_enable_device(pdev);
>@@ -928,6 +970,8 @@ static const struct dev_pm_ops xe_pm_ops = {
> };
> #endif
>
>+extern const struct pci_error_handlers xe_pci_err_handlers;

not sure this really belongs into a separate compilation unit. Just
leave it in xe_pci.c? Adding the extern here doesn't make it pretty.

if we are adding a separate .c, then the struct definition should
probably be here, and you do it like

	static const struct pci_error_handlers xe_pci_err_handlers = {
		.reset_prepare = xe_pci_err_reset_prepare,
		.reset_done = xe_pci_err_reset_done,
	};


See xe_pm_ops, that was left here rather than in xe_pm.c.

Lucas De Marchi

>+
> static struct pci_driver xe_pci_driver = {
> 	.name = DRIVER_NAME,
> 	.id_table = pciidlist,
>@@ -937,6 +981,7 @@ static struct pci_driver xe_pci_driver = {
> #ifdef CONFIG_PM_SLEEP
> 	.driver.pm = &xe_pm_ops,
> #endif
>+	.err_handler = &xe_pci_err_handlers,
> };
>
> int xe_register_pci_driver(void)
>diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
>index 611c1209b14c..9faf5380a09e 100644
>--- a/drivers/gpu/drm/xe/xe_pci.h
>+++ b/drivers/gpu/drm/xe/xe_pci.h
>@@ -6,7 +6,11 @@
> #ifndef _XE_PCI_H_
> #define _XE_PCI_H_
>
>+struct pci_dev;
>+struct pci_device_id;
>+
> int xe_register_pci_driver(void);
> void xe_unregister_pci_driver(void);
>-
>+void xe_load_pci_state(struct pci_dev *pdev);
>+int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
>new file mode 100644
>index 000000000000..ecc467a9c3af
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_pci_err.c
>@@ -0,0 +1,94 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#include <linux/pci.h>
>+#include <drm/drm_drv.h>
>+
>+#include "xe_device.h"
>+#include "xe_gt.h"
>+#include "xe_gt_printk.h"
>+#include "xe_pci.h"
>+#include "xe_pm.h"
>+
>+/**
>+ * xe_pci_reset_prepare - Called when user issued a function level reset
>+ * via /sys/bus/pci/devices/.../reset.
>+ * @pdev: PCI device struct
>+ */
>+static void xe_pci_reset_prepare(struct pci_dev *pdev)
>+{
>+	struct xe_device *xe = pci_get_drvdata(pdev);
>+	struct xe_gt *gt;
>+	int id, err;
>+
>+	pci_warn(pdev, "preparing for PCIe FLR reset\n");
>+
>+	drm_warn(&xe->drm, "removing device access to userspace\n");
>+	drm_dev_unplug(&xe->drm);
>+
>+	xe_pm_runtime_get(xe);
>+	/* idle the GTs */
>+	for_each_gt(gt, xe, id) {
>+		err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>+		if (err)
>+			goto reset;
>+		err = xe_idle_gt(gt);
>+		if (err) {
>+			xe_gt_err(gt, "failed to idle gt (%pe)\n", ERR_PTR(err));
>+			goto reset;
>+		}
>+
>+		err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>+		XE_WARN_ON(err);
>+	}
>+	xe_pm_runtime_put(xe);
>+
>+reset:
>+	pci_disable_device(pdev);
>+}
>+
>+/**
>+ * xe_pci_reset_done - Called when function level reset is done.
>+ * @pdev: PCI device struct
>+ */
>+static void xe_pci_reset_done(struct pci_dev *pdev)
>+{
>+	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
>+	struct xe_device *xe = pci_get_drvdata(pdev);
>+
>+	dev_info(&pdev->dev,
>+		 "PCI device went through FLR, reenabling the device\n");
>+
>+	if (pci_enable_device(pdev)) {
>+		dev_err(&pdev->dev,
>+			"Cannot re-enable PCI device after reset\n");
>+		return;
>+	}
>+	pci_set_master(pdev);
>+	xe_load_pci_state(pdev);
>+
>+	/*
>+	 * We want to completely clean the driver and even destroy
>+	 * the xe private data and reinitialize afresh similar to
>+	 * probe
>+	 */
>+	pdev->driver->remove(pdev);
>+	if (pci_dev_msi_enabled(pdev))
>+		pci_free_irq_vectors(pdev);
>+
>+	devm_drm_release_action(&xe->drm);
>+	pci_disable_device(pdev);
>+
>+	/*
>+	 * if this fails the driver might be in a stale state, only option is
>+	 * to unbind and rebind
>+	 */
>+	xe_pci_probe(pdev, ent);
>+}
>+
>+const struct pci_error_handlers xe_pci_err_handlers = {
>+	.reset_prepare = xe_pci_reset_prepare,
>+	.reset_done = xe_pci_reset_done,
>+};
>-- 
>2.25.1
>
