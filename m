Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CF58A84EF
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 15:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA03F113526;
	Wed, 17 Apr 2024 13:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9QM9kMT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3438A113520;
 Wed, 17 Apr 2024 13:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713361146; x=1744897146;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=x+3RjJGfw7ZB5lwLI2Rs7bADKyFnEYNJa23VEt6Lxv8=;
 b=j9QM9kMTug4R4dJ0w/77dyxrqtgPPl8175qx6yInDc1+CXPxH7Y+sZJU
 JC8TMRtyngBtDYy6Ws44eOyu0q3fjFh8ZnLJI202op8tEm9MgTJs0fXlI
 B6UODGU4104mP+sjlHU78bKGl2qwBlOusgLZbuWfD6F6t6PBUaCYg5jt8
 5OEGXI1JaCva2/ws4lNIB8YyppR8iuvUUDkAK2gJevyZA9KwuDvoFrexG
 NL9TgnZkydIcRy+fby7KaF66I8MLFD77QU5C2Bkx9iT+hZ2ydUmrNaU16
 cagUo96Gk5EFAMJ2XOjwEhvDl6LvWmKILkH/Ie8eV/CwS/l4YFPmAevPM w==;
X-CSE-ConnectionGUID: HUU1PcxPRcWfU7KxxZ101A==
X-CSE-MsgGUID: hS7TBfD/R0WZiy/CJfHuMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19558920"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="19558920"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:39:05 -0700
X-CSE-ConnectionGUID: j6lEZmO2TSyr5RVPtPQ2ew==
X-CSE-MsgGUID: UQg8Arr1Q42t3gYg8G0SmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="23111588"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 06:39:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 06:39:04 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 06:39:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 06:39:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 06:39:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAKnwhK9yMoDLRShDh/7WTFAp5iH82BLKZlk3Ocs6iimUN8uZXZjtMNep8YqC/wcuF6TXK+J27FPtDjT8CpT21FXMosxDGonaEh6xCMYMRtgqCY3ocGa0zhi6SBK2yHOOpdHvNhRmTNWe0l9y2LMVympeNEq8rBt10Juldi3T0mVJJZUipoVqWQU4fPP6cTX3cevvMSF+8ZVVsX4W4N5dZW6RdJc7nazNhvI9B9ex8kJJMjllenhQ98rYck3C/uGF9vze0aA6BE6X/+/i8lXZ85A8yBs9nF5PcMv/ODmaParHfp2C4fzFjoU/FF/Fef5rGD4n7qdvn67RH4B58uEwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOEq9EyLvi2aqRiFi3GFJFyCB7L2dTedMEv9bKaTV7U=;
 b=OUYhXJrA8FYOA2qFe7r89snTDfAIDglq/kBDbL/y4fpb+J8aCypcHMywhreuvkcgS/6HgzLOAskJU9RMFf6g+7JI2oX11US4tplEB/CBDcVw+vwNKBlWh0Mt9ZGLWmkADyySg+s0FPmq745mfOD8QVFiT4OK7rxYokV+IWKtGt4SisrVkXSVYicZAVwdhP+1eX2ZHhF47ikvrVxuaBGeVtzkxGyt1Tg2gXxwQ12m/64T2OQV0OD/dbWHbEZJmGLwq0BZSWPaHMtpC++Lbltz4ZK8qxriVlm3XT664GtZwW0AndtS+ePHowtL0HRjY8CyLCvfFeaWZpaMPyucIJPlyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5135.namprd11.prod.outlook.com (2603:10b6:a03:2db::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Wed, 17 Apr
 2024 13:39:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 13:39:01 +0000
Date: Wed, 17 Apr 2024 09:38:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-next
Message-ID: <Zh_Q72gYKMMbge9A@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:a03:331::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5135:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f0cd6b3-67fd-49b4-994d-08dc5ee3bd97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jFnGSnN5JOa5skDDLvzTLKKkM28jzuP3OIPSNchpO2qhNGsK2HzYnRpQdDaZEAmlP61htBB8uKEzDGR4KuLmrsoKr7tud4vYiGg+yEmwsed+poTDzmn7rFZWNv9suNPDGq2vsHrwC4WsjZkHeqEz8+JdgDpsSAvp5ZHzG5zwjv1OYba77EVnwfV5YFFZXqP5ob5CnxavAh1bGuzCg7dUzfvOyAffGe0qyp0XkPlNlJ2gzxeRFEmfyMM3mnNGHALfX+ML8XjKYhe+MpsUA81gZwwGLITn2IVMSYqd1Ko2xE0EUF8mB/rDY1ewYcOr7ETKgg/W+xe8vkHtJl2rKonk3+3bCh20CtbmxvdQFvqXxOc50EGXvhr1823rQZo/ujC+KISgtnD8juKxlFEqYVnj3aIA10SQxclRWfIrhsEcWhwQOvrrThA1g1g5mDA8bozNP4zrZmigyKBnc5BtoGtLGR1CWSGSwsRPdglbuQjWyCoJY6xcig74p5g6UoMJUoxDqIjdD2FwPsm5Hp5wgWaQ79oU4S5/6dZrWO/zNytqp+7vzj5u6e362jLN25biOuYK9qgNsPmv0D7lG6alnclDndT6If3A4k5eYwEt4guqp/4e3zpPi05snlLpfeP9yaQ7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CVGtz75G0ZszKrszHvBOKXd3D+FcdQRtbXgFth4aNQwikRWcIpRpsI6kVu?=
 =?iso-8859-1?Q?D/ZPoCxRsEaDD2gdlNtcxy/SHXACc152P+3mmPFzvdyLrmRg98lpQXXiXw?=
 =?iso-8859-1?Q?EONYep5gswilSf3gr/vbfZOJTA+lf+Utn0kfhI1dGTzNCNBowr6qS33Rdx?=
 =?iso-8859-1?Q?NnH0/e57R3sFIfzOzFiYsXLtgBiuVDqqeL09mSHToVW5jaNlxJccsm135W?=
 =?iso-8859-1?Q?tvwSnr1IlycO16isE6eoZbpuvh4SM+GFie4BaD93/melCTKczGkhGVFV8B?=
 =?iso-8859-1?Q?uOo+tV44llG8F7hqtrc0cnUe4bn9GkIeZWNAgmwErsUNN9Cc9WWRzEGQbu?=
 =?iso-8859-1?Q?WXr2cIDzV08EUFWfQ9uqJhG0qDj2zwqOqFUihfPxFBGKN3ksi4dTFFKuR/?=
 =?iso-8859-1?Q?3pkkn6h1TGwLOAEXBq0Y3Q8W6oVKL1ALBMl/VFCujOrIEdcRslycVfkZ1c?=
 =?iso-8859-1?Q?pLmdK2/jftzoIwQT3UmZwRGdlDprLr7fpv5OuPLGCXTPC8HuYl0I/hOth/?=
 =?iso-8859-1?Q?hKa+ov1GBrq1Dai0dn1FYjPrXIv75u45uSvWjLc+3VeqbzkInSEEYC5N5y?=
 =?iso-8859-1?Q?YvaBiyvdUhJeCk6pUqfyzMaXRzbKcJIXV/I4AtNbVLAi/NivDzQaDvrSfn?=
 =?iso-8859-1?Q?eh6nZ+LZOpYXlZZVySXqgLTF874OocGpr5aJDhCi41hHFIzev4kdS6G1tL?=
 =?iso-8859-1?Q?4SkqB5FNIQfGsItl7z4hZS/WZaMxTN4z7ECREQ9WiDV6yXTCXd5jLwAVh7?=
 =?iso-8859-1?Q?nx7Mfk59QT0qvkJsNktPuvdy7bgTU9YSJd4V//0NrvNXhFcQVUI19Hp+5x?=
 =?iso-8859-1?Q?XDOk1qLOk3t0PYl1wy4ZfneaI7iKTGJA1tc1xBHqbZPefjIkGAxy09xSFk?=
 =?iso-8859-1?Q?O1OYLKu6QFsaXMw5v1flMB6anaAm0y9YfLvbT5U6Thitjc4bqkWi4w3F+w?=
 =?iso-8859-1?Q?JPcCtmxvbkFghFibU8rPzDaa6hSgufZuXeclg8mp//QCpFbDyAfM6qB7Tm?=
 =?iso-8859-1?Q?x6DEcf+tfPdo8EoSZDc3mYlO799MP80fLK4HkL6idLfnnLGsVe+KXks/gZ?=
 =?iso-8859-1?Q?0IjpqY4IZTuGMpZYIOwWlkBO7PhAKKjCdQZrxW9lqbplZY1e0c/AgQe6dV?=
 =?iso-8859-1?Q?G7tQMC9q8ps8UPrHeU/1B6LQkyorhnVz8FNln7esws/5xCc80jZJrwtmPV?=
 =?iso-8859-1?Q?CFbOIuN+Qvknl5O/HSthcSCWapVar6vuvBAYdmApla+RFv7IK/wQx4Megk?=
 =?iso-8859-1?Q?1pqGg23K+D/basHedgyTb6nbCeVXeVv4QLmpgPe4WydQUe9XF5cw/hgtlT?=
 =?iso-8859-1?Q?yTVAmP8aCZlcFd9pglN1sZsUrqCpHPAI4q9a8EWj7078mUK7S9m6Zo7TX5?=
 =?iso-8859-1?Q?mmvlji/eMpTexJrLDgtOoAVnK9tYCTj0vv89h9YY9TzmO2pcR2APklYM6I?=
 =?iso-8859-1?Q?GPQlO76qaf83tIOpvq65I7MEj7pDs3Mb/w/VbGVF0cOX4HEZkqdsouK+Or?=
 =?iso-8859-1?Q?Coht7pErPuZQ5SwOpBlGSLRogl1nEpBfL2UUWlIihNbireaXzNkwc0NTCu?=
 =?iso-8859-1?Q?BfLyBaiN2WCREYm98XRX0mTPr80mBPGtE4nspaYGpnIpl70Czn81Q3VkZo?=
 =?iso-8859-1?Q?4tlDRNspsUn7ybCAwUAAA4A3zf48/v3DVj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0cd6b3-67fd-49b4-994d-08dc5ee3bd97
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 13:39:01.4041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNETx4oOhh7cFefcwL1larBSx8+08magUg+6Z/r0qvKztA88bcNXaol85sOyWTb0ji/6bVg1QjnybSoXx67xyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5135
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

Hi Sima and Dave,

Here goes our biggest pull request of this round.
Likely a small pull request coming end of next week as well.

I had to bypass dim on missed link tag in a patch that was a urgent revert
and ended up without the patchwork link.
(Which btw I'm proposing an option to dim for making that easier for us:
https://gitlab.freedesktop.org/drm/maintainer-tools/-/merge_requests/52
)

Another thing that it is important to highlight is that we have 3 drm level
patches in this pull request where I didn't see any explicit recorded
ack from you (drm maintainers) nor from drm-misc maintainers.
The patches looks good to me and shouldn't cause conflict, so I hope it
is okay to continue with them here instead of a big removal at this
point.

Thanks,
Rodrigo.

drm-intel-next-2024-04-17-1:
Core Changes (DRM):

- Fix documentation of DP tunnel functions (Imre)
- DP MST read sideband messaging cap (Jani)
- Preparation patches for Adaptive Sync SDP Support for DP (Mitul)

Driver Changes:

i915 core (non-display):
- Documentation improvements (Nirmoy)
- Add includes for BUG_ON/BUILD_BUG_ON in i915_memcpy.c (Joonas)
- Do not print 'pxp init failed with 0' when it succeed (Jose)
- Clean-up, including removal of dead code for unsupported platforms (Lucas)
- Adding new DG2 PCI ID (Ravi)

{i915,xe} display:
- Spelling fix (Colin Ian)
- Document CDCLK components (Gustavo)
- Lunar Lake display enabling, including cdclk and other refactors (Gustavo, Bala)
- BIOS/VBT/opregion related refactor (Jani, Ville, RK)
- Save a few bytes of memory using {kstrdup,kfree}_const variant (Christophe)
- Digital port related refactor/clean-up (Ville)
- Fix 2s boot time regression on DP panel replay init (Animesh)
- Remove redundant drm_rect_visible() overlay use (Arthur)
- DSC HW state readout fixes (Imre)
- Remove duplication on audio enable/disable on SDVO and g4x+ DP (Ville)
- Disable AuxCCS framebuffers if built for Xe (Juha-Pekka)
- Fix DSI init order (Ville)
- DRRS related refactor and fixes (Bhanuprakash)
- Fix DSB vblank waits with VRR (Ville)
- General improvements on register name and use of REG_BIT (Ville)
- Some display power well related improvements (Ville)
- FBC changes for better w/a handling (Ville)
- Make crtc disable more atomic (Ville)
- Fix hwmon locking inversion in sysfs getter (Janusz)
- Increase DP idle pattern wait timeout to 2ms (Shekhar)
- PSR related fixes and improvents (Jouni)
- Start using container_of_const() for some extra const safety (Ville)
- Use drm_printer more on display code (Ville)
- Fix Jasper Lake boot freeze (Jonathon)
- Update Pipe src size check in skl_update_scaler (Ankit)
- Enable MST mode for 128b/132b single-stream sideband (Jani)
- Pass encoder around more for port/phy checks (Jani)
- Some initial work to make display code more independent from i915 (Jani)
- Pre-populate the cursor physical dma address (Ville)
- Do not bump min backlight brightness to max on enable (Gareth)
- Fix MTL supported DP rates - removal of UHBR13.5 (Arun)
- Fix the computation for compressed_bpp for DISPLAY < 1 (Ankit)
- Bigjoiner modeset sequence redesign and MST support (Ville)
- Enable Adaptive Sync SDP Support for DP (Mitul)
- Implemnt vblank sycnhronized mbus joining changes (Ville, Stanislav)
- HDCP related fixes (Suraj)
- Fix i915_display_info debugfs when connectors are not active (Ville)
- Clean up on Xe compat layer (Jani)
- Add jitter WAs for MST/FEC/DSC links (Imre)
- DMC wakelock implementation (Luca)
The following changes since commit 39cd87c4eb2b893354f3b850f916353f2658ae6f:

  Linux 6.9-rc2 (2024-03-31 14:32:39 -0700)

are available in the Git repository at:

  https://anongit.freedesktop.org/git/drm/drm-intel tags/drm-intel-next-2024-04-17-1

for you to fetch changes up to 700c34019555392a348f8c03237c1ebb5bf53eb4:

  drm/i915/display: tie DMC wakelock to DC5/6 state transitions (2024-04-17 11:41:23 +0300)

----------------------------------------------------------------
Core Changes (DRM):

- Fix documentation of DP tunnel functions (Imre)
- DP MST read sideband messaging cap (Jani)
- Preparation patches for Adaptive Sync SDP Support for DP (Mitul)

Driver Changes:

i915 core (non-display):
- Documentation improvements (Nirmoy)
- Add includes for BUG_ON/BUILD_BUG_ON in i915_memcpy.c (Joonas)
- Do not print 'pxp init failed with 0' when it succeed (Jose)
- Clean-up, including removal of dead code for unsupported platforms (Lucas)
- Adding new DG2 PCI ID (Ravi)

{i915,xe} display:
- Spelling fix (Colin Ian)
- Document CDCLK components (Gustavo)
- Lunar Lake display enabling, including cdclk and other refactors (Gustavo, Bala)
- BIOS/VBT/opregion related refactor (Jani, Ville, RK)
- Save a few bytes of memory using {kstrdup,kfree}_const variant (Christophe)
- Digital port related refactor/clean-up (Ville)
- Fix 2s boot time regression on DP panel replay init (Animesh)
- Remove redundant drm_rect_visible() overlay use (Arthur)
- DSC HW state readout fixes (Imre)
- Remove duplication on audio enable/disable on SDVO and g4x+ DP (Ville)
- Disable AuxCCS framebuffers if built for Xe (Juha-Pekka)
- Fix DSI init order (Ville)
- DRRS related refactor and fixes (Bhanuprakash)
- Fix DSB vblank waits with VRR (Ville)
- General improvements on register name and use of REG_BIT (Ville)
- Some display power well related improvements (Ville)
- FBC changes for better w/a handling (Ville)
- Make crtc disable more atomic (Ville)
- Fix hwmon locking inversion in sysfs getter (Janusz)
- Increase DP idle pattern wait timeout to 2ms (Shekhar)
- PSR related fixes and improvents (Jouni)
- Start using container_of_const() for some extra const safety (Ville)
- Use drm_printer more on display code (Ville)
- Fix Jasper Lake boot freeze (Jonathon)
- Update Pipe src size check in skl_update_scaler (Ankit)
- Enable MST mode for 128b/132b single-stream sideband (Jani)
- Pass encoder around more for port/phy checks (Jani)
- Some initial work to make display code more independent from i915 (Jani)
- Pre-populate the cursor physical dma address (Ville)
- Do not bump min backlight brightness to max on enable (Gareth)
- Fix MTL supported DP rates - removal of UHBR13.5 (Arun)
- Fix the computation for compressed_bpp for DISPLAY < 1 (Ankit)
- Bigjoiner modeset sequence redesign and MST support (Ville)
- Enable Adaptive Sync SDP Support for DP (Mitul)
- Implemnt vblank sycnhronized mbus joining changes (Ville, Stanislav)
- HDCP related fixes (Suraj)
- Fix i915_display_info debugfs when connectors are not active (Ville)
- Clean up on Xe compat layer (Jani)
- Add jitter WAs for MST/FEC/DSC links (Imre)
- DMC wakelock implementation (Luca)

----------------------------------------------------------------
Animesh Manna (1):
      drm/i915/panelreplay: Move out psr_init_dpcd() from init_connector()

Ankit Nautiyal (2):
      drm/i915/scaler: Update Pipe src size check in skl_update_scaler
      drm/i915/dp: Fix the computation for compressed_bpp for DISPLAY < 13

Arthur Grillo (1):
      drm/i915/overlay: Remove redundant drm_rect_visible() use

Arun R Murthy (1):
      drm/i915/dp: Remove support for UHBR13.5

Balasubramani Vivekanandan (2):
      drm/i915/xe2lpd: Load DMC
      drm/xe/lnl: Enable display support

Bhanuprakash Modem (2):
      drm/i915/drrs: Refactor CPU transcoder DRRS check
      drm/i915/display/debugfs: Fix duplicate checks in i915_drrs_status

Christophe JAILLET (1):
      drm/i915/display: Save a few bytes of memory in intel_backlight_device_register()

Colin Ian King (1):
      drm/i915/dp: Fix spelling mistake "redect" -> "reject"

Gareth Yu (1):
      drm/i915/backlight: Do not bump min brightness to max on enable

Gustavo Sousa (8):
      drm/i915/cdclk: Rename intel_cdclk_needs_modeset to intel_cdclk_clock_changed
      drm/i915/cdclk: Document CDCLK components
      drm/i915/cdclk: Rename lnl_cdclk_table to xe2lpd_cdclk_table
      drm/i915/cdclk: Add and use mdclk_source_is_cdclk_pll()
      drm/i915/cdclk: Only compute squash waveform when necessary
      drm/i915: Extract intel_dbuf_mdclk_cdclk_ratio_update()
      drm/i915: Add mdclk_cdclk_ratio to intel_dbuf_state
      drm/i915/xe2lpd: Support MDCLK:CDCLK ratio changes

Imre Deak (9):
      drm/dp: Fix documentation of DP tunnel functions
      drm/i915/dp: Fix connector DSC HW state readout
      drm/i915/dp: Fix DSC state HW readout for SST connectors
      drm/i915/adlp: Add MST FEC BS jitter WA (Wa_14013163432)
      drm/i915/adlp: Add MST short HBlank WA (Wa_14014143976)
      drm/i915/adlp: Add DP MST DPT/DPTP alignment WA (Wa_14014143976)
      drm/i915/adlp+: Add DSC early pixel count scaling WA (Wa_1409098942)
      drm/i915/mtl+: Disable DP/DSC SF insertion at EOL WA
      drm/i915/mtl: Add DP FEC BS jitter WA

Jani Nikula (38):
      Merge drm/drm-next into drm-intel-next
      drm/i915/bios: bump expected child device size
      drm/i915/bios: abstract child device size check
      drm/i915/bios: abstract child device expected size
      drm/i915/opregion: add intel_opregion_vbt_present() stub for ACPI=n
      drm/mst: read sideband messaging cap
      drm/i915/mst: improve debug logging of DP MST mode detect
      drm/i915/mst: abstract choosing the MST mode to use
      drm/i915/mst: use the MST mode detected previously
      drm/i915/mst: add intel_dp_mst_disconnect()
      drm/i915/mst: enable MST mode for 128b/132b single-stream sideband
      drm/i915/hdmi: convert *_port_to_ddc_pin() to *_encoder_to_ddc_pin()
      drm/i915/ddi: pass encoder to intel_wait_ddi_buf_active()
      drm/i915/snps: pass encoder to intel_snps_phy_update_psr_power_state()
      drm/i915/display: add intel_encoder_is_*() and _to_*() functions
      drm/i915/display: use intel_encoder_is/to_* functions
      drm/i915/cx0: remove the unused intel_is_c10phy()
      drm/i915/cx0: pass encoder instead of i915 and port around
      drm/i915/de: register wait function renames
      drm/i915/display: prefer intel_de_wait*() functions over uncore ones
      drm/i915: use fine grained -Woverride-init disable
      drm/i915/display: move dmc_firmware_path to display params
      Revert "drm/i915/display: move dmc_firmware_path to display params"
      drm/i915: use IS_JASPERLAKE()/IS_ELKHARTLAKE() instead of IS_PLATFORM()
      drm/i915/dmc: define firmware URL locally
      drm/i915: move i915_fixed.h to display/intel_fixed.h
      drm/xe/display: clean up a lot of cruft from compat i915_drv.h
      drm/xe/display: remove compat i915_gem.h
      drm/xe/display: clean up compat i915_vgpu.h
      drm/i915/gt: drop display clock info from gt debugfs
      drm/i915: move skl_preferred_vco_freq to display substruct
      drm/i915: move max_dotclk_freq to display substruct
      drm/i915: move vblank_enabled to display substruct
      drm/i915: move display_irqs_enabled to display substruct
      drm/i915: move de_irq_mask to display substruct
      drm/i915: move pipestat_irq_mask to display substruct
      drm/i915: use check_add_overflow() and drop local variants
      drm/i915/pps: move pps debugfs file to intel_pps.c

Janusz Krzysztofik (1):
      drm/i915/hwmon: Fix locking inversion in sysfs getter

Jonathon Hall (1):
      drm/i915: Do not match JSL in ehl_combo_pll_div_frac_wa_needed()

Joonas Lahtinen (1):
      drm/i915: Add includes for BUG_ON/BUILD_BUG_ON in i915_memcpy.c

José Roberto de Souza (1):
      drm/i915: Do not print 'pxp init failed with 0' when it succeed

Jouni Högander (23):
      drm/i915/display: Make intel_dp_aux_fw_sync_len available for PSR code
      drm/i915/psr: Improve fast and IO wake lines calculation
      drm/i915/psr: Calculate IO wake and fast wake lines for DISPLAY_VER < 12
      drm/i915/display: Increase number of fast wake precharge pulses
      drm/i915/psr: Calculate PIPE_SRCSZ_ERLY_TPT value
      drm/i915/psr: Move writing early transport pipe src
      drm/i915/psr: Fix intel_psr2_sel_fetch_et_alignment usage
      drm/i915/display: Add definition for MCURSOR_MODE_64_2B
      drm/i915/display: Implement Wa_16021440873
      drm/i915/psr: Add missing ALPM AUX-Less register definitions
      drm/i915/psr: Calculate aux less wake time
      drm/i915/psr: Silence period and lfps half cycle
      drm/i915/psr: Enable ALPM on source side for eDP Panel replay
      drm/i915/psr: Do not write ALPM configuration for PSR1 or DP2.0 Panel Replay
      drm/i915/psr: Add some documentation of variables used in psr code
      drm/i915/psr: Set intel_crtc_state->has_psr on panel replay as well
      drm/i915/psr: Intel_psr_pause/resume needs to support panel replay
      drm/i915/psr: Do not update phy power state in case of non-eDP panel replay
      drm/i915/psr: Check possible errors for panel replay as well
      drm/i915/psr: Do not write registers/bits not applicable for panel replay
      drm/i915/psr: Unify panel replay enable/disable sink
      drm/i915/psr: Panel replay has to be enabled before link training
      drm/i915/psr: Use crtc_state->port_clock instead of intel_dp->link_rate

Juha-Pekka Heikkila (1):
      drm/i915/display: Disable AuxCCS framebuffers if built for Xe

Luca Coelho (4):
      drm/i915/display: add support for DMC wakelocks
      drm/i915/display: don't allow DMC wakelock on older hardware
      drm/i915/display: add module parameter to enable DMC wakelock
      drm/i915/display: tie DMC wakelock to DC5/6 state transitions

Lucas De Marchi (7):
      drm/i915: Drop dead code for xehpsdv
      drm/i915: Remove XEHP_FWRANGES()
      drm/i915: Stop inheriting IP_VER(12, 50)
      drm/i915: Update IP_VER(12, 50)
      drm/i915: Drop dead code for pvc
      drm/i915: Remove special handling for !RCS_MASK()
      drm/i915: Delete stray .rej file

Mitul Golani (9):
      drm/dp: Add support to indicate if sink supports AS SDP
      drm/dp: Add Adaptive Sync SDP logging
      drm/i915/display: Add crtc state dump for Adaptive Sync SDP
      drm/i915/dp: Add Read/Write support for Adaptive Sync SDP
      drm/i915/dp: Add wrapper function to check AS SDP
      drm/i915/display: Compute AS SDP parameters
      drm/i915/display: Add state checker for Adaptive Sync SDP
      drm/i915/display: Compute vrr_vsync params
      drm/i915/display: Read/Write Adaptive Sync SDP

Nirmoy Das (1):
      drm/i915: Add missing doc for drm_i915_reset_stats

Radhakrishna Sripada (7):
      drm/i915: Pass size to oprom_get_vbt
      drm/i915: Pass size to spi_oprom_get_vbt
      drm/i915: Move vbt read from firmware to intel_bios.c
      drm/i915: Extract opregion vbt presence check
      drm/i915: Duplicate opregion vbt memory
      drm/i915: Show bios vbt when read from firmware/spi/oprom
      drm/i915: Reuse RPLU cdclk fns for MTL+

Ravi Kumar Vodapalli (1):
      drm/i915: Add new PCI IDs to DG2 platform in driver

Rodrigo Vivi (1):
      Merge drm/drm-next into drm-intel-next

Shekhar Chauhan (1):
      drm/i915/dp: Increase idle pattern wait timeout to 2ms

Stanislav Lisovskiy (4):
      drm/i915: Loop over all active pipes in intel_mbus_dbox_update
      drm/i915: Use old mbus_join value when increasing CDCLK
      drm/i915: Implement vblank synchronized MBUS join changes
      drm/i915: Handle joined pipes inside hsw_crtc_enable()

Suraj Kandpal (2):
      drm/i915/display: Initialize capability variables
      drm/i915/hdcp: Fix get remote hdcp capability function

Vidya Srinivas (1):
      drm/i915: Allow bigjoiner for MST

Ville Syrjälä (75):
      drm/i915: Don't explode when the dig port we don't have an AUX CH
      drm/i915: Simplify aux_ch_to_digital_port()
      drm/i915: Stop doing double audio enable/disable on SDVO and g4x+ DP
      drm/i915/dsi: Go back to the previous INIT_OTP/DISPLAY_ON order, mostly
      drm/i915/vrr: Generate VRR "safe window" for DSB
      drm/i915/dsb: Fix DSB vblank waits when using VRR
      drm/i915/dsb: Always set DSB_SKIP_WAITS_EN
      drm/i915: Rename ICL_AUX_ANAOVRD1 to ICL_PORT_TX_DW6_AUX
      drm/i915: Use REG_BIT() & co. in intel_combo_phy_regs.h
      drm/i915: Use pw_idx to derive PHY for ICL_LANE_ENABLE_AUX override
      drm/i915: Streamline eDP handling in icl_combo_phy_aux_power_well_enable()
      drm/i915/fbc: Don't use a fence for a plane if FBC is not possible
      drm/i915/fbc: Move DPFC_CHICKEN programming into intel_fbc_program_workarounds()
      drm/i915: Precompute disable_pipes bitmask in intel_commit_modeset_disables()
      drm/i915: Disable planes more atomically during modesets
      drm/i915: Simplify intel_old_crtc_state_disables() calling convention
      drm/i915/dsi: Use enc_to_intel_dsi()
      drm/i915: Don't cast away const
      drm/i915: Use container_of_const() for states
      drm/i915: Drop pointless (void*) cast
      drm/i915: Indicate which pipe failed the fastset check overall
      drm/i915: Include CRTC info in infoframe mismatch prints
      drm/i915: Include CRTC info in VSC SDP mismatch prints
      drm/i915: Convert pipe_config_infoframe_mismatch() to drm_printer
      drm/i915: Convert pipe_config_buffer_mismatch() to drm_printer
      drm/i915: Convert intel_dpll_dump_hw_state() to drm_printer
      drm/i915: Use drm_printer more extensively in intel_crtc_state_dump()
      drm/i915: Convert the remaining state dump to drm_printer
      drm/i915: Skip intel_crtc_state_dump() if debugs aren't enabled
      drm/i915: Relocate pipe_config_mismatch()
      drm/i915: Reuse pipe_config_mismatch() more
      drm/i915: Create the printer only once in intel_pipe_config_compare()
      drm/i915: Rename ICL_PORT_TX_DW6 bits
      drm/i915/bios: s/dpfs/dfps/
      drm/i915/bios: Update VBT driver feature block version numbers
      drm/i915/bios: Add the old DPST field into VBT LFP power block
      drm/i915/bios: Define the (obsolete) backlight i2c VBT stuff
      drm/i915/bios: Pimp the VBT backlight data BDB version comments
      drm/i915: Pre-populate the cursor physical dma address
      drm/i915/bios: Tolerate devdata==NULL in intel_bios_encoder_supports_dp_dual_mode()
      drm/i915/bios: Use the platform's port_mask when there is no VBT
      drm/i915: Remove DRM_MODE_FLAG_DBLSCAN checks from .mode_valid() hooks
      drm/i915: Shuffle DP .mode_valid() checks
      drm/i915: Clean up glk_pipe_scaler_clock_gating_wa()
      drm/i915: Extract glk_need_scaler_clock_gating_wa()
      drm/i915/mst: Limit MST+DSC to TGL+
      drm/i915/mst: Reject FEC+MST on ICL
      drm/i915: Use debugfs_create_bool() for "i915_bigjoiner_force_enable"
      drm/i915/cdclk: Fix CDCLK programming order when pipes are active
      drm/i915/cdclk: Fix voltage_level programming edge case
      drm/i915/cdclk: Drop tgl/dg2 cdclk bump hacks
      drm/i915/cdclk: Indicate whether CDCLK change happens during pre or post plane update
      drm/i915: Relocate intel_mbus_dbox_update()
      drm/i915: Extract intel_dbuf_mbus_join_update()
      drm/i915: Extract intel_dbuf_mdclk_min_tracker_update()
      drm/i915: Add debugs for mbus joining and dbuf ratio programming
      drm/i915: Use the correct mdclk/cdclk ratio in MBUS updates
      drm/i915: Use a plain old int for the cdclk/mdclk ratio
      drm/i915: Optimize out redundant dbuf slice updates
      drm/i915: Fix i915_display_info output when connectors are not active
      drm/i915/psr: Disable PSR when bigjoiner is used
      drm/i915: Disable port sync when bigjoiner is used
      drm/i915: Disable live M/N updates when using bigjoiner
      drm/i915/vrr: Disable VRR when using bigjoiner
      drm/i915: Fix intel_modeset_pipe_config_late() for bigjoiner
      drm/i915: Update pipes in reverse order for bigjoiner
      drm/i915: s/intel_dp_can_bigjoiner()/intel_dp_has_bigjoiner()/
      drm/i915: Extract intel_dp_joiner_needs_dsc()
      drm/i915/mst: Check intel_dp_joiner_needs_dsc()
      drm/i915: Pass connector to intel_dp_need_bigjoiner()
      drm/i915: Introduce intel_crtc_joined_pipe_mask()
      drm/i915: Extract intel_ddi_post_disable_hdmi_or_sst()
      drm/i915: Utilize intel_crtc_joined_pipe_mask() more
      drm/i915: Handle joined pipes inside hsw_crtc_disable()
      drm/i915/mst: Add bigjoiner handling to MST modeset sequence

 Documentation/gpu/i915.rst                         |   9 +
 Documentation/gpu/rfc/i915_vm_bind.h               |  11 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |  37 ++
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  20 +-
 drivers/gpu/drm/display/drm_dp_tunnel.c            |   7 +-
 drivers/gpu/drm/i915/Makefile                      |   6 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   3 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |   2 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |  10 +-
 drivers/gpu/drm/i915/display/intel_bios.c          | 198 ++++--
 drivers/gpu/drm/i915/display/intel_bw.h            |   3 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 242 +++++---
 drivers/gpu/drm/i915/display/intel_cdclk.h         |  15 +-
 .../gpu/drm/i915/display/intel_combo_phy_regs.h    | 117 ++--
 drivers/gpu/drm/i915/display/intel_crt.c           |   5 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   | 353 +++++------
 drivers/gpu/drm/i915/display/intel_cursor.c        |  24 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       | 369 +++++------
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |   3 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           | 224 ++++---
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |  18 +-
 drivers/gpu/drm/i915/display/intel_de.h            | 117 +++-
 drivers/gpu/drm/i915/display/intel_display.c       | 673 +++++++++++++--------
 drivers/gpu/drm/i915/display/intel_display.h       |  22 +
 drivers/gpu/drm/i915/display/intel_display_core.h  |  14 +
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  87 +--
 .../gpu/drm/i915/display/intel_display_device.c    |   5 +
 .../gpu/drm/i915/display/intel_display_device.h    |   2 +
 .../gpu/drm/i915/display/intel_display_driver.c    |   1 +
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  57 +-
 .../gpu/drm/i915/display/intel_display_params.c    |   5 +
 .../gpu/drm/i915/display/intel_display_params.h    |   1 +
 .../drm/i915/display/intel_display_power_well.c    |  73 +--
 drivers/gpu/drm/i915/display/intel_display_types.h |  21 +-
 drivers/gpu/drm/i915/display/intel_display_wa.c    |   8 -
 drivers/gpu/drm/i915/display/intel_dmc.c           |  17 +-
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |   6 +
 drivers/gpu/drm/i915/display/intel_dmc_wl.c        | 262 ++++++++
 drivers/gpu/drm/i915/display/intel_dmc_wl.h        |  31 +
 drivers/gpu/drm/i915/display/intel_dp.c            | 310 ++++++++--
 drivers/gpu/drm/i915/display/intel_dp.h            |   5 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |  15 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.h        |   1 +
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |  22 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        | 142 +++--
 drivers/gpu/drm/i915/display/intel_dp_tunnel.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |   7 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      | 127 ++--
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |   2 +
 drivers/gpu/drm/i915/display/intel_dsb.c           |   5 +-
 drivers/gpu/drm/i915/display/intel_dsi.c           |   5 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |   5 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |   6 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |  32 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   5 +
 .../i915/{i915_fixed.h => display/intel_fixed.h}   |   0
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   6 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  96 +--
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |   5 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |  58 +-
 drivers/gpu/drm/i915/display/intel_opregion.h      |   6 +
 drivers/gpu/drm/i915/display/intel_overlay.c       |   7 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |  14 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.h      |   5 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |  34 +-
 drivers/gpu/drm/i915/display/intel_pps.h           |   2 +
 drivers/gpu/drm/i915/display/intel_psr.c           | 533 ++++++++++++----
 drivers/gpu/drm/i915/display/intel_psr.h           |   5 +
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |  12 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   9 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |  16 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.h      |   4 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |  33 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |   8 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |  36 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |  40 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |   7 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       | 320 +++++++---
 drivers/gpu/drm/i915/display/skl_watermark.h       |  13 +-
 drivers/gpu/drm/i915/display/skl_watermark_regs.h  |  18 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |   2 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |   4 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |   8 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |   5 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  40 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  43 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  10 +-
 drivers/gpu/drm/i915/gt/intel_gsc.c                |  15 -
 drivers/gpu/drm/i915/gt/intel_gt.c                 |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |  52 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h             |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |   4 -
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |  59 --
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |  21 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c                |   2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  51 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            |  22 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c               |  52 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   6 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c               |  13 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 183 +-----
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |   4 -
 drivers/gpu/drm/i915/i915_debugfs.c                |  12 -
 drivers/gpu/drm/i915/i915_drv.h                    |  26 +-
 drivers/gpu/drm/i915/i915_getparam.c               |   4 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   5 +-
 drivers/gpu/drm/i915/i915_hwmon.c                  |   6 -
 drivers/gpu/drm/i915/i915_irq.c                    |   8 +-
 drivers/gpu/drm/i915/i915_pci.c                    |  66 +-
 drivers/gpu/drm/i915/i915_perf.c                   |  19 +-
 drivers/gpu/drm/i915/i915_query.c                  |   2 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  43 +-
 drivers/gpu/drm/i915/i915_utils.h                  |  14 -
 drivers/gpu/drm/i915/intel_clock_gating.c          |  59 +-
 drivers/gpu/drm/i915/intel_device_info.c           |   2 -
 drivers/gpu/drm/i915/intel_device_info.h           |   2 -
 drivers/gpu/drm/i915/intel_step.c                  |  80 +--
 drivers/gpu/drm/i915/intel_uncore.c                | 380 ++++--------
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |   3 -
 drivers/gpu/drm/nouveau/nouveau_dp.c               |   2 +-
 drivers/gpu/drm/xe/Makefile                        |   4 +-
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |  40 --
 .../gpu/drm/xe/compat-i915-headers/i915_fixed.h    |   6 -
 drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h  |   9 -
 drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h |  26 -
 .../gpu/drm/xe/compat-i915-headers/intel_uc_fw.h   |  11 -
 drivers/gpu/drm/xe/xe_device_types.h               |  16 +-
 drivers/gpu/drm/xe/xe_pci.c                        |   1 +
 include/drm/display/drm_dp.h                       |  11 +
 include/drm/display/drm_dp_helper.h                |  30 +
 include/drm/display/drm_dp_mst_helper.h            |  23 +-
 include/drm/i915_pciids.h                          |   4 +-
 include/uapi/drm/i915_drm.h                        |  16 +-
 140 files changed, 3622 insertions(+), 2989 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dmc_wl.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dmc_wl.h
 rename drivers/gpu/drm/i915/{i915_fixed.h => display/intel_fixed.h} (100%)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
