Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC3587066B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD6C1122CC;
	Mon,  4 Mar 2024 16:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jccVdyje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68331122BB;
 Mon,  4 Mar 2024 16:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709568071; x=1741104071;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=YVrvEdTo9SeadkoyElIHn7rGY2NBokZswLeqjkMLFM4=;
 b=jccVdyjeDc0v9NumwVUufG0tX74w1b5EXfdUNckmEMi6tzsQj+I7KGTm
 UUVfEArI1jJ7SFXCZ9hUkqkQvvOhfGogZ/WbqGmkOg9aEt8lYMqhnUKNA
 8zL0Gtcmb3eWvLbadoVoiy+JdktCByUNSLJYKzJlMLBoJagbd0W/vfBoN
 cslPM3ZzHrNugZrAtOGLMzSJJhED6+67I1sS7jUbs3BLH8OgRkqDa94/j
 vT4sYY98RBF4acVSYBRp8tFQTrlDEGmwVMtT+6Auy6uma6MlFiw7tWdMB
 b2tZBcToE+G/vDJ7PtgKjMnhliZ3I64C5KHnNIW1tlXekGngrkA8cxU4u w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="14711033"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="14711033"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 08:00:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13703111"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 08:00:42 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 08:00:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 08:00:41 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 08:00:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwmGsqrJQObAVPB5T07b4oIDTCu6Wn5LmDegerzjPurqp7Z0FI4SxBoeMfqFxChyIrP9nGYD2vjDPLhXXLUdndNNfPH//bRyIWV+zQxzYZT7C0/ZDmbamLWP8hHqlnEoB3tWKp3ZGQHvM7S9sveRzOBl0XN4U4rSbYJUOCl1wo41y0WY11GZcGDGph0O+u10s8fjnBcwg7gTDphaGcHB52c/5capxyzhURYnrHWV1hTBttGD1Gw72zk2JMyWmwj3wq+0xNT0mkKN7GLozOt2kQgb5mhCHEyJJ4B2UGrTcJiyHvebxkFkc/bWWM1Y3Ih1BXNVf1TRQxpmwpkSI1BNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OxPs7oExRp9n9gaFcSkp72RtQynrWvEVIgHvQ5Lv9k=;
 b=Zt1DlOa1YR+aYNQNHbbRROJbjCwpDUQJtbY8OJYErPl1V0juz7/DPFGHUo5YQx0Dmr1722RAHHemL4e0OXITwdYU3eehzAZ+mzzDNvR95ts2UO+PGQPs35s/lCHYj/BzS2SFJqkWHVVoF5Fs7JwTclHjL06tWiaGHYxdw793L4hhxzB2/pWeLzsxGiGkodUGs+DSDSo2Q/o1RKURqlnm6AjTpHl+FVpjJ128P5opF1zWY/0YE/yMqpPUCYquNnYRGNYELjegtWU+ajNrWshYXJ38zI9UVIN/cbFZp+d+OgKTKon06WT6GXcVFu00XhCVCgaDdb1FebhBxSjHjqwLhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6671.namprd11.prod.outlook.com (2603:10b6:a03:44b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 16:00:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 16:00:37 +0000
Date: Mon, 4 Mar 2024 10:00:34 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next-fixes
Message-ID: <kaypobelrl7u7rtnu6hg5czs3vptbhs4rp24vnwuo2ajoxysto@l5u7377hz4es>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:a03:338::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: cd1687a7-c00d-41fb-9729-08dc3c643bca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dSiHbk2pdxSPZzdnCo5r1ieLHw+TXiq1hvJkDK9s/hyZ6UiNrE0Oy0J0E0//aswUzEhLG2APN2FACbcC7yiOzS70uWE2+uTdA3NRwhuf2cRZfdObOcrIbp6b4N3r7FT8G7vV/ewd80FBn1uZ6wPersXBPBXSdneDjyozbqMa9yNvFvf/nb8Y8d9aZ8FpHQWidHt1PCRDZTBYvDvXlrYmxj1s/U65hyjlriZYh+i1QYb+D2KZRm9B3p1CIYmOZ82uiVebs3I2DDcJn55UhRf2ipfGlcuScrGLYx8MJigyAvqaCyzHYMdF8LcnSZnhTQDTwtSsJUQ2Wkynh6OLvvEXRNS34fKSahmzeEHGYr35nbJlqQt+oSQc7luTkhJ4YklGJBcAhywoByRvIupsQ+QYy+Tk6zLMchX+FiyJJqdY2ma+fYBmYRGAsatZg6OHZTz6G7q0KE6NobMqFtlWkVOAY1XmmngvByfrJ9Toz7WBgwzchg/JbIA93X6pcDTYLsdWUCls1xZt/3zZPGAoyuml9jVaRMGwwu/zPKD3VoYUKFdI5oAgMcZKxuhDvgAMdPPb4fBpv6vm7aJbubrJmwwOnA3SYTDicbjV5JOG796u2No=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pRhciRvMyP33DlQk3txLVH+s2FPbI84SbvExDZSpEacQ7SVMOYVA0L8QM2iD?=
 =?us-ascii?Q?kvgopa9ZyAYON2jhYHxbRgj7UIwsjyy+OIcA/2cbW3p80nWP04QSid2MEqT5?=
 =?us-ascii?Q?ev5BT7C2PF7VJK2z62VHFFkSLwb6+zuzWUEEokZICQ6G0nhAo9EzNT/qYpPA?=
 =?us-ascii?Q?K+YOffervynEev0POGi6V96wB+UDvFw6lGa9ZvRdWw4mpnr0ZeOdYfvBBWjr?=
 =?us-ascii?Q?5WTqzTuu/mlBC3VlcOq8WFv9W4aoaUEeN8Bc0IWFeEDfGsTT5F851GSkps0A?=
 =?us-ascii?Q?TF0cMokLkz781niqi1rwHi1Z1tw02sSvOvJ0EWqpDtbIchtlalYbQdtmTwHJ?=
 =?us-ascii?Q?aDWrCKu0iYHMgtk6C9jT7AgkRLNimPCNCGm+fGDFpkHI3ijq9f9mWCfng4iy?=
 =?us-ascii?Q?lZghDzgPYjLb18F3ILuV/Xfayg7GtNFhJTxPkGKwysc7a0uJ7DTMbp7UBB+D?=
 =?us-ascii?Q?XhDa26+kHfmzF7z6PerNRpLYFHmbLdV44mtdSHAhv/VTIHS8iJDD3awbq99X?=
 =?us-ascii?Q?SLtUrs2Cs17Q/pxs2/Tl5EQwNUHURycwHY7TFAgWz2wcytNnNutrNDaQfvBe?=
 =?us-ascii?Q?Pzf6tTKy6nqG4odEG5oWPvVQZcrsyVa3ItVAAchDUsmz4L20zYy4oMb4BQPt?=
 =?us-ascii?Q?/h981KZPLhJpkzy+muNE775phW8vOztfdmg1hTUKIn7iOXZg2xmJsYDLRABf?=
 =?us-ascii?Q?rNo3fE9IAVwxrRHW7eZA4drjoK0+fbaoQ91WXqyCaP2cZ1aivU+AXQoPmpaR?=
 =?us-ascii?Q?1+TleYSKMadaDARHbA3YmkZjspe0GuhNnxb08htvWiogmulVr+O8NY+yOwXC?=
 =?us-ascii?Q?bOCW63g0EWnUwUuQQ862CexUS0G3gXvnDXJV/t3K8EKOSTBOoM/1+2W+61ON?=
 =?us-ascii?Q?Ka0PuCEusQCpHdZNvnac5C0mkHiUFOh/CwpS9v/dsBI93x8p+4qdvuYGGNaJ?=
 =?us-ascii?Q?5FlWEvdXTq8tr1kp4gId6ZOnbEJDYyPBnMLEKNS6kbBE3uNVHRPaJcW80B8f?=
 =?us-ascii?Q?NWf+hbTy6Kea3qio9yr1ZW1yI64T39oUAHcUBR5mtV3l+Q4YNP7nlv0hfeZi?=
 =?us-ascii?Q?Pia2m+iIJyvR9PDaV+i97B+A6nyECbd3HTvpkx5B49UDLEbPHWGP9TNFJ4qA?=
 =?us-ascii?Q?bb4KvMMnlsMvdeCUgTKA4XEnAyVbL/Luk9WO45zQyNxyLnOFqFkRJ19K4B5D?=
 =?us-ascii?Q?u0qGVz9sVJsUKsl/SzDyTUAaPdf3UK4CnT8JpVP7O15Y457VajhkgFIA0id7?=
 =?us-ascii?Q?eG4UiBJO++kxCvS6ERxfzjNhYhuYgCbWCL+q8hrwPlFJLPC2sZ9uSuXDlhlz?=
 =?us-ascii?Q?A2rVnMEqj12IQJTsFZacovmF9MBE28Jvwfopek2OOrTihL7+ftFDhcsG7XYW?=
 =?us-ascii?Q?3bu7AIR7GPYwXdC0zq8KuZ/SDGJ9eX+IY7jG64K3aFEuswHCxb9v/Nz6ZfHk?=
 =?us-ascii?Q?AUiBAoaxbcd5hUpgljPfChrfIamPr7GIbMKfZ0loJWNiAHp2/MMHs5SykiRr?=
 =?us-ascii?Q?iX0Pz93uPJjzVdHKNIXHTYN9w3Vjf9RrXq2xymerE9XiqbDOoyJSbaWgjOnG?=
 =?us-ascii?Q?Jz/6uWl1orv2MZDXM20+xwyd18NpW71wy2Le0Z0+QPaD0OiySJIj7n99/N0x?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1687a7-c00d-41fb-9729-08dc3c643bca
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 16:00:37.9267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WT/uBIQnIy/ezOyGUG8kMulM9ORYK4PLWqLAA/TXjvqqnFtV0PBsOuUs1GlWKuLw7qcWPBqWK2ST9AR0V4Iun34jjpNP9sFYYXcty3Ycz60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6671
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

A few xe fixes for 6.9.

drm-xe-next-fixes-2024-03-04:
Driver Changes:

- Fix kunit link failure with built-in xe
- Fix one more 32-bit build failure with ARM compiler
- Fix initialization order of topology struct
- Cleanup unused fields in struct xe_vm
- Fix xe_vm leak when handling page fault on a VM not in fault mode
- Drop use of "grouped target" feature in Makefile since that's
   only available in make >= 4.3

thanks,
Lucas De Marchi

The following changes since commit c6d6a82d8a9f8f9326b760accaa532b839b80140:

   Merge tag 'drm-misc-next-fixes-2024-02-29' of https://anongit.freedesktop.org/git/drm/drm-misc into drm-next (2024-03-01 19:38:13 +1000)

are available in the Git repository at:

   ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2024-03-04

for you to fetch changes up to e62d2e00780b4a465c77d2229837495fcbc480d3:

   drm/xe: Replace 'grouped target' in Makefile with pattern rule (2024-03-04 08:41:28 -0600)

----------------------------------------------------------------
Driver Changes:

- Fix kunit link failure with built-in xe
- Fix one more 32-bit build failure with ARM compiler
- Fix initialization order of topology struct
- Cleanup unused fields in struct xe_vm
- Fix xe_vm leak when handling page fault on a VM not in fault mode
- Drop use of "grouped target" feature in Makefile since that's
   only available in make >= 4.3

----------------------------------------------------------------
Arnd Bergmann (2):
       drm/xe/kunit: fix link failure with built-in xe
       drm/xe/xe2: fix 64-bit division in pte_update_size

Dafna Hirschfeld (1):
       drm/xe: Replace 'grouped target' in Makefile with pattern rule

Matthew Brost (1):
       drm/xe: Fix ref counting leak on page fault

Mika Kuoppala (1):
       drm/xe: Remove obsolete async_ops from struct xe_vm

Zhanjun Dong (1):
       drm/xe/guc: Fix missing topology init

  drivers/gpu/drm/xe/Kconfig           |  1 +
  drivers/gpu/drm/xe/Kconfig.debug     |  1 -
  drivers/gpu/drm/xe/Makefile          |  9 ++++++---
  drivers/gpu/drm/xe/xe_gt.c           |  3 +--
  drivers/gpu/drm/xe/xe_gt_pagefault.c |  6 ++++--
  drivers/gpu/drm/xe/xe_migrate.c      |  2 +-
  drivers/gpu/drm/xe/xe_vm_types.h     | 24 ------------------------
  7 files changed, 13 insertions(+), 33 deletions(-)
