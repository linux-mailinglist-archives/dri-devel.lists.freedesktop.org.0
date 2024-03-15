Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8A887C83D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 05:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8DF10E992;
	Fri, 15 Mar 2024 04:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0IRRgzr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE94710E3E2;
 Fri, 15 Mar 2024 04:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710476071; x=1742012071;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=t+nwY1lQ2EPdYQVr5CM9ZEF6LMahbeJMkg1zmHIiDTA=;
 b=c0IRRgzryuhJkUvb7ykg+dAAghJA2nvxDc+V6kHT4bs55hQnd7fRVPf4
 S+dpsnkbQCq/5hyPeo06HgUi6tYc1u5McVvJb+yn+IhiA5j2I3Ixs/WLM
 fLsSKrxYCVwO0a5WR/26yRGhd7DKTV7iMOZb7XjUaz5ckKwQJbW5yuHpn
 I2sgEqc56TzYdEu47jGy9TxtkZV44WDvFY71J99XsxM6YGCfexqeqDXms
 aFwDfA4HPKgAQIGXvWe1AN7Vj89Pv5LYwJMeR2t1Dlq8IPZk2D2pXCkAh
 brFnEyMJlPrVUhGtfLQoQBmiG/u9jJlV9xMUS4zoKepY9CT45azE0aqGL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22790600"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="22790600"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 21:14:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="43557805"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 21:14:27 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 21:14:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 21:14:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 21:14:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRdIRLfo4xg1o+2JZ8PjOii3uipU0laAZR6sAyKjnwcjiXQ34COdp1949Q8UB5sytrGzrzlISn5TG3NQ0aaM4OxCDW+oOg8qFxeVmqMVS41jZCDkxdKucrByuj4a4Z0HL88cnaIBLpJxo6F2KfFgEAVQ1Wua6fOAnjorr5NDWG4BqwszMc0IUgJMnm56fOVapE49InhHTnlPp+MSibbMqN4C/rRN6so2QO2l5c1ELd1S2h5a99B5j1KClzNR/wx4RVI6iXtlgsb2lQzr3h18smxq3UVnO+JKR3wC32jNjDvChuK2AsDdLg2FHV8MmI6UeqIzBSkYxmDNyoPL0hTFgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIdcQ1wxqikgvbBOdN508mxBnjTCprZUXLMERNTcHRQ=;
 b=gceCY4+F7dxsOgz41o2v9940FzyUj6cMnA5j6P6yjVWYsEI8cqrNkw/VxLl12FEBU1g7Si5kshsxHwy0xEpa+YGJ1I1ypCPgeOOfdRDU2RdmyaTKwNHPcoaRZsB0Io+HN1bzXLKiF3f21/h12yN9U9uuHq9Im22TUDvz9W5whILBwekHs00wSt/vz+3TXZyJC0z2H9XFslDYkeuYyXFVaOMAVz2ef7q3aCjE3kpyWkXfQrwMUYMwo0HAH4TKXSNK6/Qx/kNwAwaZouYgsq/h8TqRcMoIrhJcfa3fF/96rFLC0bIawAfc4DKEI3A/9PyEVQMHv+ZWvDvMF6frpWPG4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6778.namprd11.prod.outlook.com (2603:10b6:510:1c9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Fri, 15 Mar
 2024 04:14:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 04:14:23 +0000
Date: Thu, 14 Mar 2024 23:14:18 -0500
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
Message-ID: <c4epi2j6anpc77z73zbgibxg7bxsmmkb522aa7tyei6oa6uunn@3oad4cgomd5a>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0101.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: fafc0e90-0ec8-4484-6c1b-08dc44a66559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FXF14kUj+DWMrk/NmwTeR7MOoZVIWG+1PW9wUDrgH8U5RWMBSt70IQD3Paj8pYO31TppvflLxH/1DY1bAo+8gVRqmdUGWbZa/JMxYk1aKpAQxSorgIiwIeFY61v83Dlvz5Me+O2jn2Lylx1Rlwd6bjXkyimM2NQCXSlIL+RG/shMqPn95a0tDXG9IoqIhWqudhU3vv9pV+KkVOEcSGmkw4GtvLcJ7NEbK4uEAGKIPp0OIv4jeNXVSHU1tZQUPn6d8q952F2EOQljXmbRLfzNB2s1bvsFdedn76kKbNMbQWubNfngUnDADJ5MqJ7RDdZIWTk8mbeR1o9nJfgFURv2QMiZmkO3VA0nTMJ7QuCcYY0JsBWmcR72M24M/f6ojPxksV5PqiiQ7Y8UUralvWXU0ba6N7z5+yf7UUPu8PyhOnzOFoX1lcuFlrSjMDinPJkv7fDmB5lRBHS4zVW4qPG/l6xoBQsewsM7YvI23Jn/m6NnRxGGo9irwG0Bs3RsYQc4/5gGDjqE9smRWLza/WRKcjQTq7qE5Z6iGFs/5SIM1ea6shD7JY5oHIMRAaNJbZgl9D9PAtWg2VrPVvPbUVe+mIHEHjeiw2GlrPlkhVEG8Vw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(7416005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?p5Q9ITrwRE/qzRLAAaT45KkIJJJWPZN0lW/Irvx3WWuIdde26HvncFTIto?=
 =?iso-8859-1?Q?cmgZdmqfRxg/mO6H1FI/bBrUTtWCsuETx74J8RQ8/xoD4bnBdufQK9jz20?=
 =?iso-8859-1?Q?2kdLxNAo/UV2X+4BXz2Q7FXm0/19xI4vHoUtdGWpGui9Kxo7quno+4nRED?=
 =?iso-8859-1?Q?IX+vijuI6JW2VjUwcIpXLy+Se/rVei5GzMj82JYAzPcoPRxgrJDzxaVV7r?=
 =?iso-8859-1?Q?U6M7m7FnL5EYCq81omoAb7ZFiCeGvry904y7guEbjTFPQ9ObjEVIUoDF7Q?=
 =?iso-8859-1?Q?B2yXq5ekVjvrFPnlddEHf4WbfE48C7lRJS3wBIAJg9zLBbNoVwvm68A1Fj?=
 =?iso-8859-1?Q?jBaqDO877CcCAbHNq7gOPtsZYj5MU27iw3n6CA4gyfB1njWWs8bk+Kz7pR?=
 =?iso-8859-1?Q?ImAg49Mq0K5+3F7QJ/UJ+Sx4VeVaBHyIsqOJc5jhbbY7klLOTdirupmVmf?=
 =?iso-8859-1?Q?xed1PavB71OcuKFi5ydS4oM9LTr/pctF3rnthwyIcJWcdqP/Ub3aQHQk23?=
 =?iso-8859-1?Q?D3EK5M49k9Ma81DMpFkcbQGIDr7P5QFnmvVd8M6/nCoYtgj3bfMcspJmgZ?=
 =?iso-8859-1?Q?SFgCVNXR37dkNiQbeP2aYBqNjOMD+ncxaI6YW3gJ6Pv3qhN1wTmPkrvjnH?=
 =?iso-8859-1?Q?hj/SxDjKdWA4YB+d2+Pa7RjwB/rshtYqsLDppAffV11vnTKCGO7Q38h426?=
 =?iso-8859-1?Q?bRSp9EsHhPwDjCuKxzOqZbf0h4dNTGe/v9iQ1W5xJfln14nhfhtc6XPwnX?=
 =?iso-8859-1?Q?MreD99tD7Pal3odD3bDhPlGjwIwX3lO9zEhwgEBNoSFMpdYYdgK7MDAcrR?=
 =?iso-8859-1?Q?jXEGcEpfNVb0evjdMDGjd1OsPBAAi+DjuBqWOL2haYTtdYD9ndn8CV9OC7?=
 =?iso-8859-1?Q?wKXBSm6G7nppyBKGYLzKqDJxP4vZ5bzF7rb6unfRMnTGhokMf3ER7U/Z6c?=
 =?iso-8859-1?Q?kUIJ3dur/Ecvax8/Cj2yVv/c2QPeWF/7y+BjllCf8Z4wl2La1KbBGgxcJ7?=
 =?iso-8859-1?Q?fVg6AmPNFdVn/VhzMKHyGJMPfhzz1jYrhfcmIBTSUrhZlNRtpX2tKN55ez?=
 =?iso-8859-1?Q?NCIXEstc2f2DKs/ADIaPosoJJEs1aqrq46L1dSGd7RfxHLEcS0o7PICStw?=
 =?iso-8859-1?Q?x6Ev63O7JPQW5da4ynJcjdScNDflRgEjtxIM87fms+FPJdGUDZTIt3LUeC?=
 =?iso-8859-1?Q?ZeMb9sbstfcpKIyTKL+nqSACyThWfK0tB3QNAS8H/ctvlspZPwL25aSV5Z?=
 =?iso-8859-1?Q?EUDYixUYixyiNeKUzjKProxAQrqm8MtxePIBZxQezgxLAUEPxOtnns8KRj?=
 =?iso-8859-1?Q?XsO8r++wjLsCjs6U7r9ZRyxja3Bwjqdl7sU68pDxcL9x+gWJy9mc+DAbl9?=
 =?iso-8859-1?Q?X5wxrtXr8Ap6bykGsG3do/l8HE6mEzsFiTUVgIeXP1a64QU82v86ePoOeu?=
 =?iso-8859-1?Q?CD1Y1ZiHVJjtnXgNt6J9HfgyXCYIRX+EJlKdxPt5HQgsU+zivs+kr5LxEz?=
 =?iso-8859-1?Q?yPLU9b/hImeAL/f1VNt8hZpFF/LzbesGroFMY4c4VttOabUM5IPdq7mYGS?=
 =?iso-8859-1?Q?jymjXymUVcmHQqgqoZFB6bPiaIzrPG7s4s+hq17SmyLF64CdUFckE4DKIF?=
 =?iso-8859-1?Q?sUKtd3p4mOrrQmTlbOy084XD5wV2LR7Db2mZlrD0/UPMF6KcpLivpqFA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fafc0e90-0ec8-4484-6c1b-08dc44a66559
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 04:14:23.6923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2gnz3vXUO418Mf180+9MatlThn1fCoUIStsf4JypbZ/99xbZ9bPYDLLrj7PIEDBPIeImdf1WInWqcGNI8umqGXP5WVCjLDTrEHs0PMNddsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6778
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

Here are the drm-xe fixes for the 6.9 cycle. Just 3 fixes: one trivial
fix for error path handling, one to avoid pinning all VMAs in
drm_gpuvm_exec_lock() when num_batch_buffer passed to xe_exec is 0 and
the other to allow userspace to free userptr while still having
bindings.

Lucas De Marchi

drm-xe-next-fixes-2024-03-14:
Driver changes:

- Invalidate userptr VMA on page pin fault, allowing userspace
   to free userptr while still having bindings
- Fail early on sysfs file creation error
- Skip VMA pinning on xe_exec with num_batch_buffer == 0

The following changes since commit e62d2e00780b4a465c77d2229837495fcbc480d3:

   drm/xe: Replace 'grouped target' in Makefile with pattern rule (2024-03-04 08:41:28 -0600)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2024-03-14

for you to fetch changes up to dd8a07f06dfd946e0eea1a3323d52e7c28a6ed80:

   drm/xe: Skip VMAs pin when requesting signal to the last XE_EXEC (2024-03-14 14:29:42 -0500)

----------------------------------------------------------------
Driver changes:

- Invalidate userptr VMA on page pin fault, allowing userspace
   to free userptr while still having bindings
- Fail early on sysfs file creation error
- Skip VMA pinning on xe_exec with num_batch_buffer == 0

----------------------------------------------------------------
Himal Prasad Ghimiray (1):
       drm/xe: Return if kobj creation is failed

José Roberto de Souza (1):
       drm/xe: Skip VMAs pin when requesting signal to the last XE_EXEC

Matthew Brost (1):
       drm/xe: Invalidate userptr VMA on page pin fault

  drivers/gpu/drm/xe/xe_exec.c         | 41 ++++++++++++++++++++----------------
  drivers/gpu/drm/xe/xe_gt_pagefault.c |  4 ++--
  drivers/gpu/drm/xe/xe_trace.h        |  2 +-
  drivers/gpu/drm/xe/xe_vm.c           | 32 +++++++++++++++++++++-------
  drivers/gpu/drm/xe/xe_vm_types.h     |  7 ++----
  drivers/gpu/drm/xe/xe_vram_freq.c    |  4 +++-
  6 files changed, 55 insertions(+), 35 deletions(-)
