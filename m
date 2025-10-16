Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB3BBE490E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 18:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D473110EA49;
	Thu, 16 Oct 2025 16:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DnXhngAc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F9810EA45;
 Thu, 16 Oct 2025 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760632012; x=1792168012;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=r6i0RumNLV098nUb45Nt10zrH/X/yrcrGcZgyLOrbio=;
 b=DnXhngAcU4yzWhdU4UVdIBTYeXVFD2kFziPCKrRW5xJtmpGU1Fkw0ZvT
 aD6R0IrA0bSKvfN+zrnphgaHrxxtpR4OjJN4xcTi9FcELdkGsmCE6w0xe
 bsoVR3+dv7UQN0HupxBu56JKg/7hZQu0IeDsJFIN4Z6YzDkF/lUiGyaNB
 UH+LHB/Np9OfJZkFwnnBFU/39u43vzyYYXKF8Pd1OSOPNQu6seyNU1nEO
 wzgffpN0tvPjPpN2XQEC1tiQSQjTcapGmuXO0fzRFaIfrG1AtL/uu1MJx
 /5gd73gSwY0vMi0HlXeHXRsaH6vvR0kMcHN1HyXZNkOjfusyYeS9B5Cdx w==;
X-CSE-ConnectionGUID: wEGqQsPUSoObUY09UR+M+w==
X-CSE-MsgGUID: 2Pl76KT9SROaiecvSbo42w==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62879812"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62879812"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:26:52 -0700
X-CSE-ConnectionGUID: sTxCnuIdTLCkeQ6ug3cIhA==
X-CSE-MsgGUID: yfVlXxJNS1aYWuAhhXotmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="213089302"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:26:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 09:26:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 09:26:50 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 09:26:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAW9CSc6jzHtVJrRr/jqX3Ik6jbYba0F2uDRDKUwMwXGI8PJxig3oH2bMHwMGN1Bz/oKHvIKvalZ9C0GxIi9GYMr9l18rtgYlABF7rnES54foFlQ1PKF7OnqBbPf4L60Xnp0sSpmhobsxqej/8+PEHmy1gBujUXoWxrhN+glfivcwjS5mWonCTbHFyzBhnG2we2JrAh9b9DRxUZDjYDIewUXRQYOSt0IPFKzFCeIJRMCbjKD9fHi5K1PQVWx/8yWaeBUzRJkkVYQTCwYCGDA/bH3OxHWN01dA3+PlT6X5vVp3iNgCGnCs8RBY8j413LwZc/i+WyB+4x/Mi2gApPXtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ofolr7bDZRZJBJBpjF59+WLF2XCZ366O7BTx7LGzngA=;
 b=nHHwPOQ4U0ueBDPoZ+xRpg5/O8osmcI0oXRG2Fs+b/xw7mLERgXaY6yQMKHFtyd2G5Wd/cjoQoEsnzvayBFGLQIp+FqeWHVoAsNQ/JQBmmVelBJ0F1pxr6brdzN3+9J1UFYZwKXv6ZXgLbBWfN2WQvbxLtfH6nKA6N4Z3lzHUZk6/CIYxEjBuN+dl7Zz0dNziJ9/tj5ktpESiScBObpWU4TX07os5+Wz+7Bfz/SDtdSLqja8656o70rAQzZlYix2Tb7yTT7GCupuFa7u9HxM8W1Zb3tdpcRqAD7eIW7CP+thViZv/vHAu9OarwCbcb1ZJcB7LpxxGk2QYkk8F8EtJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8210.namprd11.prod.outlook.com (2603:10b6:610:163::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 16:26:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 16:26:42 +0000
Date: Thu, 16 Oct 2025 11:26:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <rch735eqkmprfyutk3ux2fsqa3e5ve4p77w7a5j66qdpgyquxr@ao3wzcqtpn6s>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0135.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: a970e8f0-4136-4553-33f3-08de0cd0caa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?nilqc7C26va4V9LTBvInOF+HskhBZo1jcqjSWqcA63LgSH4GTwufqh/86y?=
 =?iso-8859-1?Q?bHhVohvh1wY9CPB188ABIE0b1Dgz1o3TbcvtAYOgm0AxoUggDhuG4BCSBY?=
 =?iso-8859-1?Q?vanATVh4ScSBdXimbem1d8W10+DQi77mafWrDnpQ/y8iTjORTjcsNuPhjl?=
 =?iso-8859-1?Q?t8CeWY7jKEMkAkwVI0fEzG8hg94HCIx6SzFcVcS2y6oEF7ZfvJoBlAH5PN?=
 =?iso-8859-1?Q?NG/6IisfLWMh4Mlf/s/t/Khm1Cwrx6+oJg7T3WPDnv0YXXCF80bHUwJwpm?=
 =?iso-8859-1?Q?yHVWcNnwUevLsr7uwaoM2JVtSMsQ27j5tX9h5cFE1wVIVzt5SHmnEV36Ml?=
 =?iso-8859-1?Q?lywBerFakifDqsDnFk2NAyxaPb7LzgmYgjkNmCie6JsoC9FFAV7D4k7l7O?=
 =?iso-8859-1?Q?xHE4Lsdw75G1swXLVu6Ia8S3E+9aTT6mFxmANr2DCcJYBa9hU9y/G0BWDe?=
 =?iso-8859-1?Q?+qFsHyQJRSud1ZL/mxOtnVInyvWin6M1t+EoUWAKKZ+PPvcXfUIp8wsj5g?=
 =?iso-8859-1?Q?YvcfY0pEomm/IchN2lmUn2nMte6m4FDy8gujoP9DXP3Pg3VisNhKIeMlXg?=
 =?iso-8859-1?Q?4g+HvQHwjcjeqDJx1VCbgOoRmDbxCrZe7p9+borQl2uY9XX9Bl5xL8vc6g?=
 =?iso-8859-1?Q?OoYH60sn7nxOZjIbViANyrUTai7qkaMMhf7Ne13aLj+oIF4V4hKWDd2czT?=
 =?iso-8859-1?Q?z7+7MM0PlcYw3N0YK1POpRb9hOmyMu2KACvQFNtwNwleMmFN2NmrUUYu/H?=
 =?iso-8859-1?Q?1WLI924hG9wMzNQsZxROWjGFkxYSS9zDRQzYTuCiUKriHH/ExJdi4j3qBD?=
 =?iso-8859-1?Q?LJABkze0rPbddhHalu787FGJ4jWWSHWUanAjzmsvifZnG2Ly8o4LrNlBIi?=
 =?iso-8859-1?Q?baEeVIWY4eW+fAG0dbBLKz+rXdFJAPGznbgLGp97bRfQxh2YD4aKw69LK5?=
 =?iso-8859-1?Q?sSXUw5XjaZNNkg8pQgdHV3r/bDvi/jQahkz3Evb+HkDGr4I+dE+/OrMztX?=
 =?iso-8859-1?Q?G37cilviPqz7drY8r6Y4GPFgOuOhn5EEjRFEhZJpw378LjUM3ehaftuiod?=
 =?iso-8859-1?Q?rSQgNRtw3D99XP0wWrwBgzqev64iP82AD0lww0nJrsokslVm30DV1GAdKc?=
 =?iso-8859-1?Q?+teiYpk3l9G0+bNBl+HBS+uowEmGHP2VRbiABppaVYwa1MaLa5S61BNmsk?=
 =?iso-8859-1?Q?fiDwqCkrS4o+Y+aT4egRM9tzSxlIBAZpZoacL+nyISHodjiB9nPTzlUhIq?=
 =?iso-8859-1?Q?bgDpZIz2iziwtDjrk/a6HQPHRFMCU8ckxkcGISpvaau3L+2te9hHLU83K8?=
 =?iso-8859-1?Q?kIAWoFxXfCk4YdNtACvGu40dphTREdHQbcv9JkOieIYkHlukFwqAoraH1A?=
 =?iso-8859-1?Q?tb4XfyXFDAIMYfOozh00Wm735HgvwhwZ57cKYXkxemCFujeK8iq+uTAfJt?=
 =?iso-8859-1?Q?RRWe6gX2qjZMNsidHbzrUFIFzC0BG+9DqCAZDA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kX4atDDwGEinPLlQlyPO0TBDKrLZESPXsomfNQUvrt2rUZauz33R2K5Jxf?=
 =?iso-8859-1?Q?tNfPuTgxPA8XgrrXmxk2Z3vJs4hxxQZ/eOgm7B0j1Xx+n21pxX/Pdjj+8W?=
 =?iso-8859-1?Q?+tvkLna+1fETxfD3KyDC58mpYHXR6Pm9YgXj7E3jrdNBTaQdXYG6QxLdL2?=
 =?iso-8859-1?Q?WnCjKXZ+rhkqYgd2pZA2hxn77DJUh92akSvUJqVNtd60Ne79mlh5Alt3Ne?=
 =?iso-8859-1?Q?MRyvQGeGu5LJdMV76vCQbPXeIHstGdK/2L/5mdl5OHyJYRNk7uLmZKKYay?=
 =?iso-8859-1?Q?tFmR6f2DUmZpvu2A5DXYr0oyUx6tjqux/rqy/4FHZ5yBY+njtWeR3aAAUz?=
 =?iso-8859-1?Q?69GseCd8dwMy1jRERvVNgWh97/qMXO+uDuUG/BiXJwsMvr1bLPvyTZqJ5g?=
 =?iso-8859-1?Q?M28grwRp2m72W8JWXNb+vdC5/umzKZdTJ25OxyIl2eTDvPtI/hSbhO1a96?=
 =?iso-8859-1?Q?woQWyz0fG6JYVmz56cfogVKTxhvNOG6LT98xykJsrAcKyA/L4eDg9t26Mt?=
 =?iso-8859-1?Q?0NKVPmpNSUBzbB84CrAHpEp0lxNKGpC//JYGOLkaxcVp2Iq49AhyNPiC/a?=
 =?iso-8859-1?Q?F0dtNAywIL5OSz0ubFDaJm5t2P7PVlNGQG2M7ljrHn0CVEA+L3WN2S0sSJ?=
 =?iso-8859-1?Q?SpeSmuYp3Di7dYT9n5cPlY+zMGREw/8dCT5QiU+sV9Jxu6CPdaCIo3W8kI?=
 =?iso-8859-1?Q?9Tx7rPDWFXVVBfZUTlY+uKPKiKTL2r03s/FfgqoBOQXJdE/kYfAJoZ9kfF?=
 =?iso-8859-1?Q?pp1LcB+RUeE0kw7Nh0/gKrWhfHGk6nolEHIvdxMJh+GtphwO5/dkK9l1Rf?=
 =?iso-8859-1?Q?TVoNZqSfpZqE5JLRuw7uT+gXG945CyyHYAUB1K/A41g5TIrBPqxgDQ7R7J?=
 =?iso-8859-1?Q?NY7MUNY8uXQYO3hFkeSvbcw/yUtu2L2/cHpJzpPJ3Okrm1oAqUoyWrJtnl?=
 =?iso-8859-1?Q?O2l6SuK2MC5htjxwLnJ9h7fcMbG2OMauJ6n9GPrRy+z+/Z9CUxY5H0zEG4?=
 =?iso-8859-1?Q?NaOLxI7/AgGviM8zODHI8bGW3paZQXxiZb94KSMGVk1+cZv/FmVf6k/NIa?=
 =?iso-8859-1?Q?oL6lrXFUONjCS+SS24hnvjcPt2RkCXNkqxeblkgDDkOqmDssBFHgXgFEAR?=
 =?iso-8859-1?Q?KqKobN6wKDtpcflAvsm6EqI8yT7PrLN8oFwIVG0/SFmyeiwwoKCB65ejiI?=
 =?iso-8859-1?Q?1ZEBCJt5jgjlyprojaVzBIhBoPPn7MpiBR4tnRbPtSQR56vZJOwNstvHLE?=
 =?iso-8859-1?Q?KblAMiw+8yiNGSc++Wg4QgZJQjUsl14tS3q4uzAEx00ZYyy32xLRN9bfs2?=
 =?iso-8859-1?Q?xnlFoakBfAE/F08xyuonQyyKuVof+gDthL1sBCfgFnvOzV1bzmSn1NzVsF?=
 =?iso-8859-1?Q?Xp46rjBzY6CRN0txrbRwOlpB84IK3ZmwqEevxNbAQ2C5scQ/1o4ezGiKvA?=
 =?iso-8859-1?Q?CjdvZ9olSF1JvjYMGuJwR8BhTil7UmYUsXAbHBPl3LCE7Qn237+kPDE2By?=
 =?iso-8859-1?Q?DMo/bw6rG2sRdTNPhw/pLZBO8SfVIrYgtrsvHmGHmJQMesq7GM3U00HTSG?=
 =?iso-8859-1?Q?XOk73uVmf2nPzZGM/haC532diqlPmN7XJ/YEs7VYWkUxIvpJyUCNn4Wlvm?=
 =?iso-8859-1?Q?4ywdAdmmIIzzrZ5njUjyDS6ss0wwnTSOlQeXy0YKckj8sI3I5wG/pXTg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a970e8f0-4136-4553-33f3-08de0cd0caa2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 16:26:42.7406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgcXZxzRWAb0ONEUVaG4twRRdwlEAZTZprXQYwfrqPW2A3Bzb9gxPNZeqdhruAuZPh5JhkfskvkSbNMKYE0LZG8STLocwPyQWnN9f/0ajXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8210
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

Here are the fixes to 6.18-rc2. Fixes are spread all over the driver.

drm-xe-fixes-2025-10-16:
Driver Changes:
  - Increase global invalidation timeout to handle some workloads
    (Kenneth Graunke)
  - Fix NPD while evicting BOs in an array of VM binds (Matthew Brost)
  - Fix resizable BAR to account for possibly needing to move BARs other
    than the LMEMBAR (Lucas De Marchi)
  - Fix error handling in xe_migrate_init() (Thomas Hellström)
  - Fix atomic fault handling with mixed mappings or if the page is
    already in VRAM (Matthew Brost)
  - Enable media samplers power gating for platforms before Xe2 (Vinay
    Belgaumkar)
  - Fix de-registering exec queue from GuC when unbinding (Matthew Brost)
  - Ensure data migration to system if indicated by madvise with SVM
    (Thomas Hellström)
  - Fix kerneldoc for kunit change (Matt Roper)
  - Always account for cacheline alignment on migration (Matthew Auld)
  - Drop bogus assertion on eviction (Matthew Auld)

thanks,
Lucas De Marchi

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-10-16

for you to fetch changes up to 225bc03d85427e7e3821d6f99f4f2d4a09350dda:

   drm/xe/evict: drop bogus assert (2025-10-15 22:48:54 -0700)

----------------------------------------------------------------
Driver Changes:
  - Increase global invalidation timeout to handle some workloads
    (Kenneth Graunke)
  - Fix NPD while evicting BOs in an array of VM binds (Matthew Brost)
  - Fix resizable BAR to account for possibly needing to move BARs other
    than the LMEMBAR (Lucas De Marchi)
  - Fix error handling in xe_migrate_init() (Thomas Hellström)
  - Fix atomic fault handling with mixed mappings or if the page is
    already in VRAM (Matthew Brost)
  - Enable media samplers power gating for platforms before Xe2 (Vinay
    Belgaumkar)
  - Fix de-registering exec queue from GuC when unbinding (Matthew Brost)
  - Ensure data migration to system if indicated by madvise with SVM
    (Thomas Hellström)
  - Fix kerneldoc for kunit change (Matt Roper)
  - Always account for cacheline alignment on migration (Matthew Auld)
  - Drop bogus assertion on eviction (Matthew Auld)

----------------------------------------------------------------
Kenneth Graunke (1):
       drm/xe: Increase global invalidation timeout to 1000us

Lucas De Marchi (1):
       drm/xe: Move rebar to be done earlier

Matt Roper (1):
       drm/xe/kunit: Fix kerneldoc for parameterized tests

Matthew Auld (2):
       drm/xe/migrate: don't misalign current bytes
       drm/xe/evict: drop bogus assert

Matthew Brost (2):
       drm/xe: Don't allow evicting of BOs in same VM in array of VM binds
       drm/xe: Handle mixed mappings and existing VRAM on atomic faults

Shuicheng Lin (1):
       drm/xe/guc: Check GuC running state before deregistering exec queue

Thomas Hellström (2):
       drm/xe/migrate: Fix an error path
       drm/xe/svm: Ensure data will be migrated to system if indicated by madvise.

Vinay Belgaumkar (1):
       drm/xe: Enable media sampler power gating

  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
  drivers/gpu/drm/xe/tests/xe_pci.c    |  5 +++++
  drivers/gpu/drm/xe/xe_bo_evict.c     |  8 --------
  drivers/gpu/drm/xe/xe_device.c       |  2 +-
  drivers/gpu/drm/xe/xe_gt_idle.c      |  8 ++++++++
  drivers/gpu/drm/xe/xe_guc_submit.c   | 13 ++++++++++++-
  drivers/gpu/drm/xe/xe_migrate.c      |  6 ++++--
  drivers/gpu/drm/xe/xe_pci.c          |  2 ++
  drivers/gpu/drm/xe/xe_svm.c          | 17 +++++++++++++++--
  drivers/gpu/drm/xe/xe_vm.c           | 32 +++++++++++++++++++++++---------
  drivers/gpu/drm/xe/xe_vm_types.h     |  1 +
  drivers/gpu/drm/xe/xe_vram.c         | 34 ++++++++++++++++++++++++++--------
  drivers/gpu/drm/xe/xe_vram.h         |  1 +
  13 files changed, 99 insertions(+), 31 deletions(-)
