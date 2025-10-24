Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE586C044B2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 05:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3EE10E9C5;
	Fri, 24 Oct 2025 03:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Myf1gmVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF7A10E0E2;
 Fri, 24 Oct 2025 03:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761278357; x=1792814357;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=e84Us+5+5SHBwhyreKEs4WeTlF86s66nlz52H1uGv+4=;
 b=Myf1gmVxJPMylAY/ad0h6UdVWpIwyyzD5nMNwF3Lixdi7bIQWrxmJIQ9
 LesWzdJGRZyOt1fFuer8d5Ke6dXcJ99sFpZSqqVIhfs+/oymB25L8+rOs
 cLgfEuEdQMh2oCAr/woAi57ZBTAS3y3G5fzUdNkczNrisfzzhNyNO7qof
 Zs1NINC1RqowCrqJPaWLNkkUqhmkKOfXmRkn30v8DclfJPe3A38ZcKoiO
 i8PBPjpydLKUgxT+nB4APgb8MJt7THQ9vzR5FbHxKw6KgawA90gQs4E2a
 5bdbc3lMdjFxIxkzaP1HntR3fUUc/5j2Ys0dwOPbVF0iEmCHY0r48P6U/ Q==;
X-CSE-ConnectionGUID: k5qaoWYjSPyAV0IQGg8sEA==
X-CSE-MsgGUID: fKbSrW7OTqqSpDp0ExUqzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66074156"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="66074156"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 20:59:17 -0700
X-CSE-ConnectionGUID: HBX+LP+7RTe4GdkoVOeB7w==
X-CSE-MsgGUID: XCz7UME3Svim2iyxbLQUKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="185102164"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 20:59:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 20:59:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 20:59:15 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 20:59:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DH1kl/eEt4uoEuh+t7sn2ufbPwf46LxydS/OxlQeDdtf2hdEyTy/cYp0VCUOLOITUaMjdceiZnZqy5J0K76N/IlWG7PhqSI8/eWEVfCF3Bpb/58rW9TzjpSKzTOZZklcqpvd4U8mNyVeQ1u3YboNAWnf13mMQxY+kIC+fOS4AHqszwM2QD2c0gNSstRs/5wNu6ffNaUdk0qjEqX54PcbSUrmBYNdaJGs2x0lSfVEvLdyzDLyhg5Q/VbJ/KsrK3v6o0XyoXIe+Df046PIYvXdIyTghNTXDvsyPK6Sr4HcS5BLG5/rd91pvMJsV2sI+qKjWH8lT0y6AVFP7ajWaLGuYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUFtV712qKR0SX7/iomV2I8HjOQzCRnmJPjdccrLlbI=;
 b=n2V8Hg3hnrFZd67lzPlln+Qd7x7twKt3Niev0+g4UQemJHw/lnASztthuAU+To3IhHKhzTVThC7uf3ckTPNnhHtrj8xiEP3JKQBR6qv8aLbYCILXs3K77D/WYRmrRS49i83GRNB14QI6JBw2dBozCXYls2Osu8IZm2RtOvAkkVKhDHNIQdlwESe3jDz4kM/hg9q5H36uz3RxYnVMqJdNyBn9aePylwvp5BWa630IwEa/5vOk9Km8MrDSY1yh+RwLacmG2v0mwAwMiqnlO2aLhmZ323b736Q4ughQVgtgttsauA1MjUk4GucaGrQvbtuE+z5PQrgrEcHrDdikBe+ZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8518.namprd11.prod.outlook.com (2603:10b6:610:1b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 03:59:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 03:59:09 +0000
Date: Thu, 23 Oct 2025 22:59:05 -0500
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
Message-ID: <4p2glnvgifc6osjlvzv23xhsyqhw4diqlfxz54lmg7robv44bi@nwd37zpqfa2l>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0058.namprd08.prod.outlook.com
 (2603:10b6:a03:117::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8518:EE_
X-MS-Office365-Filtering-Correlation-Id: d1bf4037-db27-43ce-dd47-08de12b1af2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?KVgJvQmoNSc0w86Z/Z3NREPZau07T1rBIh3iImt1EOqOIUOFXoaIHkb1tz?=
 =?iso-8859-1?Q?THuxJ5lZChnBVR6rwGc3v/6XCGHuI2LMvZESUvcxafkAVBAPdr1LjjB40c?=
 =?iso-8859-1?Q?zBVmxAwPa9gJxm1uX+NtxIxNHKcBY/c0j7C4LAdhKVLwvTr4FxvabtjSEE?=
 =?iso-8859-1?Q?fnQ3crrkq83BKm14Qx5YmWLttdcR5nWj21t+xjorNFxXqXEy23i9Fh+evt?=
 =?iso-8859-1?Q?aRBIcm8xtM+l0uyL8/2ch75a7vNbJIZE5pn9doAUUrqLRvRcbzH/kPWrsI?=
 =?iso-8859-1?Q?/CbQrFe5Tu8rkkpY0EU7cLXLKA2DqpDQo6e1MIB6Kb5ikL0/0KUCLZku9u?=
 =?iso-8859-1?Q?EGkslIS1uV5SQsFGIOAFGdoKDxxuMa8xZocNn619ZA1fR+BpvsJ4d2Hcd4?=
 =?iso-8859-1?Q?ZVrqWis/A5KJm/XnjmtPEAO8bCrxEroDstQlYcJmpEO7dAz48aHIZ2YClU?=
 =?iso-8859-1?Q?PiQ2Lc6yHQ4BDMjofOghwXizMh+4tRkfIuYRej+hXMdFIB7UpmR5j+vnZP?=
 =?iso-8859-1?Q?IVo7Xv48/f/3IXzCrGZ6II470d+lSAfH1f7ogEk+Vbk7H69kIAnDZn9LU+?=
 =?iso-8859-1?Q?Cd6cDh1Ian2yt3Yqcb5eARGuY17JOCN/mZx/ecaKgZntVPxNdBX+mxL4eP?=
 =?iso-8859-1?Q?QRpQfFRC0aKDDMGnOlpYJ0pLvhcn7i7hAJciHVy6tdW57W7vb+GVLTT8wW?=
 =?iso-8859-1?Q?n49n2Kg4ffhNtwU3/nWswnT8+8l8d1vL3e2O8+DtHIaLSRuEHPmWRLlHyY?=
 =?iso-8859-1?Q?05A5iaYV2UDHs3HzaK3cED2mii5BRl3t10Z4BP0Z9txw/hIRZTOcaxUGeV?=
 =?iso-8859-1?Q?xK8dVuGms3wbCXpH2xoJkm8EN/nDcQRw2cYvkjOLhqh4meYy40quFl8Qze?=
 =?iso-8859-1?Q?vUAz/WiV3PXXnxIwP2MbMxDDQS7Z9LYqjewjv5DN97ralfhHTxpFntx6IM?=
 =?iso-8859-1?Q?Dbz0S2XRjBjlPXDrcB3nys5gfmQIWJp/8PaL2eNKIfCvHbjP44Jbq9Fi+T?=
 =?iso-8859-1?Q?SC23RXSWgy+vZOmnhWwctKKhhLTIqgvdeHkcbTaf/1QqFCdlH/g086o5dk?=
 =?iso-8859-1?Q?xSJgP4oMvWMRInkUymxF0XTGR0tR8+og/W3pdqNWz7AhNRlX/cMzQ3L8MJ?=
 =?iso-8859-1?Q?gk268i2qRn9NR1AB8KfbYTKx43y+R3LfcSgVomL5Y9h45faS+SIpLwTpyt?=
 =?iso-8859-1?Q?4f26WrCrud6W5j4oRW6Cd+YHC7EQTkugXSOZkrihNt8vn/GCgF3D/aELCY?=
 =?iso-8859-1?Q?4rwJ4YucHkfZ7Xsz1Q+qQ5qDRWE6Bo/F2KQnpoMASXjc/i95RLAr21EXJX?=
 =?iso-8859-1?Q?HguDI0mhk8qhOJM3dieW70g+92ptBKhFLuXdXu89QVgnbp/HePCwIGa9f1?=
 =?iso-8859-1?Q?732+/TsGngFQLLRUpfhnZojVlVA8KglpDwtEqwkeLwMuVm9bzsStGLtVdL?=
 =?iso-8859-1?Q?84xZ0xmUcxVADHwFDrj8H4AxOizzVEP03usg4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?L/2vkXCG/mDF7OaXDmsgYuFzMk3O0QM7uKTay/MZQbrycnRsHT46eAyuD3?=
 =?iso-8859-1?Q?2YJ13jhK9D7UX8cjbQdEEG9kEvUeUklz3Ib/pqEWubQNQ/jNlUIU7XAPfk?=
 =?iso-8859-1?Q?2LRTFl4LFxaUZxSbNZnj00AlsfqUs/IevogT07QYjR4rDdfOLLFbuKpp8+?=
 =?iso-8859-1?Q?C+hGvKQ7r+i6c1t8m72Op9l0vJVPjARFznIktFI1lYZ9it9UDB9heZgort?=
 =?iso-8859-1?Q?N4+VzR8Evd7wDsU8L1o9Itob0lBsWBw4PhLtKD/bP+DoUEBCHwicP0vbL/?=
 =?iso-8859-1?Q?Rdx0zMBIREtdXystpoKtOPzqSVDssOlen36t4lP28mthuJZOpnznMW0P4s?=
 =?iso-8859-1?Q?k9IruVp4+F2dYHLhIZRn5F7J65SlN0CruK6DwjozvbGI7zTuFV5CRT2V+X?=
 =?iso-8859-1?Q?gype1LIhJvdjoYtLW3DWur5kALZbQ5V9KZYadRTATq5cHwMpBbKLq/lBX6?=
 =?iso-8859-1?Q?gi19RROxUA7i0sbFt3h5zGDGJgWYNeP7t6OEP4Hq1fo9vkXJDQH1HUo8xG?=
 =?iso-8859-1?Q?GJSjVHkMBzuangUN6jQ20Ky2ItH5yXmhDtQB6rs3LyYK4cHWFdULcHy+xm?=
 =?iso-8859-1?Q?t43TmIiwPObfjK9Hihxze6d7q7wuayG2r7AVIibXYKxDlrRQN0eF7JmMWP?=
 =?iso-8859-1?Q?q6Y+8vqMRR7fteNu5tHuXutV2BVX8sn9PQZfWUOq2+2zvq+xq6YJNdaDeX?=
 =?iso-8859-1?Q?a7zgwp8QhEjipGqmpFVOkiNCkBadsQV8nXDCoiblGpA5kORwuvnQK1Fkco?=
 =?iso-8859-1?Q?hfRAepn0CDTFG4pT182MKdFX3dBnEym1MFcHEik3zKwz6wqSDzZbjzwwt/?=
 =?iso-8859-1?Q?n6QZhqJWzT9lFAZ2WITz+1XAINKEfeE0s/Lo6EdHrkMkZViSB0b+dGhryW?=
 =?iso-8859-1?Q?O6PFda1NczAoGw84GVtthjaPgvtXb6DA4qsE6pX1PzU0FTSFD8oNy3aocb?=
 =?iso-8859-1?Q?rU2FBkKbBPzCud6eHMgUM5Azg9wstbmuobdyZ6gJA3Y33r2fJ0qpfMKPUt?=
 =?iso-8859-1?Q?dou+ceX67bHb9TYJYJgD9TAtoiFW3QYdlce/oFgRm+7Ye0FhQEB0BDlkEQ?=
 =?iso-8859-1?Q?zF7DezG4j6x2JmTOCfcWktbDGhX5yaLzETI+WMKuLOIjLZVjRqeVkNWIUl?=
 =?iso-8859-1?Q?tgqZ8VJ3ibUFiY9YDVPK4xqMrvH8kWcMKkmHwVhXG6Tq0pCBO0riTFNG1U?=
 =?iso-8859-1?Q?n75mSHhfO1z+kavW7dbsgXnzxuA1peyXHaWm/Nv5NvzElnjPVD986gxjcW?=
 =?iso-8859-1?Q?GtxgRs3oK2sjxC//inIQJSViD6Je+C/H6pWF6PcQ2drZI2waMJ2yhgbYdv?=
 =?iso-8859-1?Q?HsUJ8l8sIkpg8qxy2LhGAryizJF5C7CtH/3FJduszknqIxL6eCg5Z2bjw9?=
 =?iso-8859-1?Q?M71G5w4jYv7sjGcfbrUz12jaNnUI0O239f6Z4xsYcCSaa/pIBWvkHgqOPt?=
 =?iso-8859-1?Q?Fmt4bEGaYciqIPgvMlJV0M+PmzQh1uJrijkiVflGk/TUqYZAuooYEGxYbR?=
 =?iso-8859-1?Q?ugi+BAWMimumC0f37d8EEggEZhlGNsFqyLFNtgW6fsNYSd/5Nv38kSLphm?=
 =?iso-8859-1?Q?Z/3I86O2CsNuQp2P7bYT+vc1zBQMfLr22/SLkfB2YCoNhgnSzp3h3tZZGP?=
 =?iso-8859-1?Q?93aSvuoBce2AMl7kb+CEuJkFPE7bD5BoZY/JaS+g6fidMV85NtDdRlcA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bf4037-db27-43ce-dd47-08de12b1af2e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 03:59:09.2921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xij7nZwbonW7VZ8lFgb0YSrbq2RbakwIaYFL/ETNqVVESWSMlp6sKUF9nrb1epSIzGyGhBNEDsHMu1wdjNawT4PsBRDis6RmmbxLuNeCF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8518
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

Here are the fixes towards 6.18-rc3.

drm-xe-fixes-2025-10-23:
UAPI Changes:
  - Make madvise autoreset an explicit behavior requested by userspace
    (Thomas Hellström)

Driver Changes:
  - Drop XE_VMA flag conversion and ensure GPUVA flags are passed around
    (homas Hellström)
  - Fix missing wq allocation error checking (Matthew Brost)

Thanks,
Lucas De Marchi

The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:

   Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-10-23

for you to fetch changes up to ce29214ada6d08dbde1eeb5a69c3b09ddf3da146:

   drm/xe: Check return value of GGTT workqueue allocation (2025-10-23 20:09:30 -0700)

----------------------------------------------------------------
UAPI Changes:
  - Make madvise autoreset an explicit behavior requested by userspace
    (Thomas Hellström)

Driver Changes:
  - Drop XE_VMA flag conversion and ensure GPUVA flags are passed around
    (homas Hellström)
  - Fix missing wq allocation error checking (Matthew Brost)

----------------------------------------------------------------
Matthew Brost (1):
       drm/xe: Check return value of GGTT workqueue allocation

Thomas Hellström (2):
       drm/xe: Retain vma flags when recreating and splitting vmas for madvise
       drm/xe/uapi: Hide the madvise autoreset behind a VM_BIND flag

  drivers/gpu/drm/xe/xe_ggtt.c     |  3 ++
  drivers/gpu/drm/xe/xe_pt.c       |  4 +-
  drivers/gpu/drm/xe/xe_svm.c      |  5 +++
  drivers/gpu/drm/xe/xe_vm.c       | 96 ++++++++++++++++------------------------
  drivers/gpu/drm/xe/xe_vm_types.h | 10 +----
  include/uapi/drm/xe_drm.h        | 15 +++++++
  6 files changed, 64 insertions(+), 69 deletions(-)
