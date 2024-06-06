Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D488FF6FC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 23:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B441F10EAC0;
	Thu,  6 Jun 2024 21:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFmGSC5F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3ECA10E23A;
 Thu,  6 Jun 2024 21:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717710247; x=1749246247;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=TpATRjM9PVhVwEz40z4+ICD+zqwN9s10tXN4MzIbvKk=;
 b=nFmGSC5FHjyWhDIoRtyDzNbFK3Z5KUUAbQWAzSzU86rRC2tHHLrocxY1
 xyNDXpdsRockpmzxK5tk1JfQBSvqtvs0q0udvgwxaKBvegVSw2AWBaCTx
 7vKrXbtKKlwCUcYGdfzJ2cFjKQABTdG08JmhGWCd1WDxtMScpWvCFW1Fy
 Cc9VWWsI/uSOmNNBBGiYgO/fIyPVAh+E1S5XNdqT+xldDmuSDfnO7sMKv
 3q71pfHUTT6tWiy+pgXldrggwzbR5YXkOhSjNs1Z0VktKcrQwieS6QFIz
 4zdJ/Gcug1hqAoO+uq92CbK/RHwxhSzhIl3xjAXmZcowA5oTRLcZHWn/S Q==;
X-CSE-ConnectionGUID: lNqiQGcbSxmC0COo5PobRw==
X-CSE-MsgGUID: 0Z+VrsvuQtat9GwCYgh4Ig==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14365634"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14365634"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 14:44:06 -0700
X-CSE-ConnectionGUID: 5Va18QvhRcu6+BSf4nn6fA==
X-CSE-MsgGUID: PbC2EYCwRC2mj3JgNbTsqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="61317812"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 14:44:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 14:44:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 14:44:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 14:44:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 14:44:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emyW4a2wKvmQEqZiv8IUi2qsNkhIwqnQFkgUZDj7NWibVY3EtEKg+09z3RRcAP3Bv6JYhTd3Rwu+g14/D7zgiNEueHMkf7/M7sYZZPOSYdM2ghKNsL0q8Y+WQ79Z6nGTn3SUapcbQo+ZqQ+3ogIOt80010nodreM1XOiVZ1AFU3R16VlfrsCas14t5StrwpDBTES+3Ds27VLKWfwp5MD5CR2tZcSMK7dzsPFRRYlZrTD74r6v+YjeXOh+zeRf1dUoIETB5TyUkYYho+XwEJyc+tGJV+vYv7QiKVOZ8ZWzVm33p2lzas4dCzZW91t8j65EFqpCxZ+cbY2sfAFALq1RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oskcWJVzsXwPDNqEfW8ZlpQznDZgpbSUYMRSuLPJGl0=;
 b=IQA3R3ya9Pj3B9oaUP9K9gGkJoi+VQoCsXACLXDoDAStv5rNFxeNM3jfSvs+o4QLiskKBiUHVqlbwSncK2+Ss7ZLVlqm1xsZbsqyiqJyAs3jnvESRdSqMfv4MguBa1AxsMdjsjNi4jjG/sJWSr0nW5hjtoI851HAwOTZW2go851ql7WZs3OeLsQ2XLoAJUY5dGuz5I4pXpD/FYohJe54Er7hMyRR1xlwXkd3xsM/x0XxI1Wvg3dId6xkMv7jh5GUCSTaXEr/NTFr16TszxKlxyEICLtt2tKe3X+jWUDiv0IclENk4c5G4zSPdVBB4/hieCFfudjhwT8lpHdbs9Nrig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Thu, 6 Jun
 2024 21:43:58 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 21:43:58 +0000
Date: Thu, 6 Jun 2024 17:43:54 -0400
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
Subject: [PULL] drm-xe-next
Message-ID: <ZmItmuf7vq_xvRjJ@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: 263fdc4f-bd9f-44a7-4ca3-08dc8671c579
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007|7416005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?a/qVo02vBN5SXxaXTwxw3PffE+4ZWOnwEtL/m6jPmFDeaYh31vveKL82o+?=
 =?iso-8859-1?Q?2nO45zGkT7Mm7Hq1qT2F8I07uFsOMdyI0t3txNT4uw+ldHftBU6c1HeXos?=
 =?iso-8859-1?Q?Ki+SnDsZBueHo8G05NhNb8JR4X0PVBQK3NhPmvvmuqzdw6+NhE53f9Wwvy?=
 =?iso-8859-1?Q?woqXygFr5IfLgVDDfy18o5V/YL0u5NSgR/f0TPcJTV365tlkr3Jiyp3ce8?=
 =?iso-8859-1?Q?ElA+YaK5D5ZmenESs0B2YP1g5Yu0/Mp19l7I3n7Ckkj2Xoes9KbO0zrmRj?=
 =?iso-8859-1?Q?GE6VtnvIFi89NbIhm8C41Wp3yhdGc0FUei3dMdvq7MSkRBC7LxhVIw5u2/?=
 =?iso-8859-1?Q?lilLd9O5lcJvtAxhki/yBxTV03pZi+SSGLQIjCcHfnOwNvDwJef7pbEaRG?=
 =?iso-8859-1?Q?mU6VWURIzuHn46n9+UDKYQGgjEYvhOlh/Eh4QhhCTaDDuX91hXxIi7SayI?=
 =?iso-8859-1?Q?pHh0FkK8fb4LZOaVbPrDELx1fzGFIUqiVvVohV1HPCMxmZXO+jT0/inR4D?=
 =?iso-8859-1?Q?aRVO16oA3iwqIODRGotw6J0eoqyBmGc7RdHGuVd2589c6d2n5plHfJx9DW?=
 =?iso-8859-1?Q?9viu7vu91xIJ+1dGyutCWm5CInsdsGPmuuKZDvwHcfA1gjfZy29Alu66HZ?=
 =?iso-8859-1?Q?wtk1UIbKC0+KfhDn/vnikyIlwXh1sxCt6QUsYe1znjjEX3WGBfh+N+AUh5?=
 =?iso-8859-1?Q?2U37peMqfPBTEf22/muU7vuqzFCAh+FLB5XzVZfuQ3nTIQrxaRMZXqwqU7?=
 =?iso-8859-1?Q?x9wszWT/PkzY7pdhA8VnGm7D2ETeviWYoPAMuSbgkiGECUJTNO180b4IcO?=
 =?iso-8859-1?Q?sw+hhE4STG8dX/NBjO7Ho0TIGbumtHIaNcjue7njZjtF/AoXmacuqIG0N/?=
 =?iso-8859-1?Q?NrMVLsJZ084ry6Vq79k2R8EEaQ9nusYFfWwC8wnulAOSAjefTvB5cERyvi?=
 =?iso-8859-1?Q?HyHkop0rqQGk6f5q2FgBOA+vKLmebtLyyS4Op8uAHRVhAgMS38vODKxd7V?=
 =?iso-8859-1?Q?si0PgP+mPmgMLdsne4WFMYpDTvu9VDL/0Bf4s2vCeh5Mp2Tc27S0Dxwejn?=
 =?iso-8859-1?Q?9SFrYY9E8PGmSWLPlfO9Jv0CE77xUkKZb4Vtu03rV0QYFNZj8ARj07bo3O?=
 =?iso-8859-1?Q?DtD8g6Rcn+CqnjNDalJEPpgFIeMUXonqy6VjsURejb8VqI1DLItd201tbQ?=
 =?iso-8859-1?Q?PTLM9Cv5fW9bqy7urjuR8HCJqCA6BfvJ0bSWEDIJPdK5BXwKB5GXJ33QCb?=
 =?iso-8859-1?Q?rjhV4pFP+c/ryGJF5IOlB1cq0rkI/xXjN5EIFm/xXySjeEe5ye5iSxzgGm?=
 =?iso-8859-1?Q?H5tT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(7416005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ug3+YxJJAxRta6p9LpZONrVBQkrVJx0G/kBdxy+WgDXjo7pLkcOYrjONOy?=
 =?iso-8859-1?Q?E4a/laAjuMuByV3Qz/A8ZGF3b8+MdH+Ky/2EuU+dgtjz+HDyCv03zmLmB7?=
 =?iso-8859-1?Q?EFkKOl6SafCI6dBg5h1aByKZ2D1XoxIyke/OehinfXQHP90JIN3+g892kA?=
 =?iso-8859-1?Q?W1Q6GRFcxPD/kbR44ATTFNh7Ho3ToHSPGuaO88v1w0uEVYKx4SRXrFPSx+?=
 =?iso-8859-1?Q?jk8Q2D1VXkL0/eC3M1e+q1k/jIm9lqpCGDTvjl9olTu9iScOh+xYZBCplR?=
 =?iso-8859-1?Q?kEySFGH51KxxrpwrGsxLSpXEi4JLBSrgGS13ndF0r2Jcu5ri6LEESJdSfT?=
 =?iso-8859-1?Q?tVNaPHDiMv81FaiHGgw/VOv3Fh83iKXTci5Ems2crWaftxLnfDuAeir9Zt?=
 =?iso-8859-1?Q?zPOVly7+w2uLWZvyKp/BRrV26LsYMIZQWNfQ9wsDODLzlQQK8SNm3KEyfd?=
 =?iso-8859-1?Q?aFdskSQ8FoxZ7/2nD4aaI2KAX/vSR9Pl9EVhSZfjo+7nb3Ddf0csQwS9ox?=
 =?iso-8859-1?Q?bNv99hLkmp46RZ91gdwIgeyXYGw/VJ+DiYNqwYDzd02HC8RE8O6n9MXAX1?=
 =?iso-8859-1?Q?OWSv/j9Yu6yD7Yz6h2HXRmbe03Y9o9978v7xTHJQtxK08vfLfiDaqvPtbI?=
 =?iso-8859-1?Q?bx871TdVGTwWUM4WD2rhOjJrpPqTM6Y5bVk9tS5llS48bvNo0mO3cVZfZ7?=
 =?iso-8859-1?Q?wZh07IivizaRCZCP7Qv8WygKVyRkFSlzuP3m0Bg316tr1I6bhUoMpeVh+y?=
 =?iso-8859-1?Q?eYCArJZWUP//oO7P1pNAgLIrySm+Gm27/C9lagxr6dni8iKbJ3GJ9Wvx53?=
 =?iso-8859-1?Q?Aw3OIQ3NVXKwqwrVKdrRGwokk55oqH/HSaU2dCJAcqRFUf8OZy4K4LA51s?=
 =?iso-8859-1?Q?J1NEsLu4rE10ILQWeROQqCgwDbuRe55/7Oy2eqLyYVsTrZ5VUgQ6woTeZy?=
 =?iso-8859-1?Q?bR0QyBgbf2izMgMDSUIAvqu02Q91OATOi93MvOdg5+mYEuZt/v3IrTAy0A?=
 =?iso-8859-1?Q?VjUUxmGvwes7NqdKXfylGiyrEpPcWIpYuONFROKdzHuUA0RblG8Wa97iDX?=
 =?iso-8859-1?Q?HeXAPffKclKykUkS7Lo0PCPM0cysAtVlHi6J8va0TTZjsIA0yIIVfmDESg?=
 =?iso-8859-1?Q?nMryDRw34kppnV/Sva/ft8lp8Q8gt38yNe5Ix8BLNoyAH1qozx+IxCUPCZ?=
 =?iso-8859-1?Q?qYoT2ntEXFlm/z0Rm8r03OqMwJOUrO/fq0A+o5Gz3l/rsMnSSaeYLFI1FW?=
 =?iso-8859-1?Q?gPG9oQtVRA+bbJWEN4kup9HQliIN7ZdhObBB90k/+1PQ4b/XyzTKmvQ28t?=
 =?iso-8859-1?Q?R6wtpU5PjQ+K2JHZUrJ5OLaHVCYICj5Y2ZGzwjDmOZZ3trVlHB9zjuzrkT?=
 =?iso-8859-1?Q?JNojmXK8tS6tIIAN1uD1cfjMB04iPbNKM3VLUvuEnG8PW7RGRO8EqAs6D/?=
 =?iso-8859-1?Q?I6WRkBY9gSDeOfvBwHbv0Hfn4NHy0JI1MQHbgnhtoS7dZVnN6PS1z2OJl8?=
 =?iso-8859-1?Q?JyNU1+IQwRgNldCX3JuFpCmF+9i+PAFLylggtKDYgjJx2y4Z2ynfwdpB5W?=
 =?iso-8859-1?Q?P/LHULyiVRJg3xJ6BNY2SbhGPpBBfwcBMgbAAVcgnm4XNEev0AEaB1OE8Y?=
 =?iso-8859-1?Q?1qGTT5UGA5zqUkXCzQ48/HtPMVwBXUfc4ZurXNXWV100ZsevKEr5iu7g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 263fdc4f-bd9f-44a7-4ca3-08dc8671c579
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 21:43:58.5864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IY064Mgxwex3To+GGnsQnyFw1NxVC+aiQqz6ZHXhvSUZErcEyGM4NZIFn7KRK5wTaTl4L1PzPb5dGAd+siuqzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6541
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

Here goes our first Xe pull request targeting 6.11.

A very active round, with highlight to many changes targeting
SR-IOV support and many different clean-ups.

Thanks,
Rodrigo.

drm-xe-next-2024-06-06:
UAPI Changes:
- Expose the L3 bank mask (Francois)

Cross-subsystem Changes:
- Update Xe driver maintainers (Oded)

Display (i915):
- Add missing include to intel_vga.c (Michal Wajdeczko)

Driver Changes:
- Fix Display (xe-only) detection for ADL-N (Lucas)
- Runtime PM fixes that enabled PC-10 and D3Cold (Francois, Rodrigo)
- Fix unexpected silent drm backmerge issues (Thomas)
- More (a lot more) preparation for SR-IOV support (Michal Wajdeczko)
- Devcoredump fixes and improvements (Jose, Tejas, Matt Brost)
- Introduce device 'wedged' state (Rodrigo)
- Improve debug and info messages (Michal Wajdeczko, Rodrigo, Nirmoy)
- Adding or fixing workarounds (Tejas, Shekhar, Lucas, Bommu)
- Check result of drmm_mutex_init (Michal Wajdeczko)
- Enlarge the critical dma fence area for preempt fences (Matt Auld)
- Prevent UAF in VM's rebind work (Matt Auld)
- GuC submit related clean-ups and fixes (Matt Brost, Himal, Jonathan, Niranjana)
- Prefer local helpers to perform dma reservation locking (Himal)
- Spelling and typo fixes (Colin, Francois)
- Prep patches for 1 job per VM bind IOCTL (no uapi change yet) (Matt Brost)
- Remove uninitialized end var from xe_gt_tlb_invalidation_range (Nirmoy)
- GSC related changes targeting LNL support (Daniele)
- Fix assert in L3 bank mask generation (Francois)
- Perform dma_map when moving system buffer objects to TT (Thomas)
- Add helpers for manipulating macro arguments (Michal Wajdeczko)
- Refactor default device atomic settings (Nirmoy)
- Add debugfs node to dump mocs (Janga)
- Use ordered WQ for G2H handler (Matt Brost)
- Clean up and fixes in header includes (Michal Wajdeczko)
- Prefer flexible-array over deprecated zero-lenght ones (Lucas)
- Add Indirect Ring State support (Niranjana)
- Fix UBSAN shift-out-of-bounds failure (Shuicheng)
- HWMon fixes and additions (Karthik)
- Clean-up refactor around probe init functions (Lucas, Michal Wajdeczko)
- Fix PCODE init function (Himal)
- Only use reserved BCS instances for usm migrate exec queue (Matt Brost)
- Only zap PTEs as needed (Matt Brost)
- Per client usage info (Lucas)
- Core hotunplug improvements converting stuff towards devm (Matt Auld)
- Don't emit false error if running in execlist mode (Michal Wajdeczko)
- Remove unused struct (Dr. David)
- Support/debug for slow GuC loads (John Harrison)
- Decouple job seqno and lrc seqno (Matt Brost)
- Allow migrate vm gpu submissions from reclaim context (Thomas)
- Rename drm-client running time to run_ticks and fix a UAF (Umesh)
- Check empty pinned BO list with lock held (Nirmoy)
- Drop undesired prefix from the platform name (Michal Wajdeczko)
- Remove unwanted mutex locking on xe file close (Niranjana)
- Replace format-less snprintf() with strscpy() (Arnd)
- Other general clean-ups on registers definitions and function names (Michal Wajdeczko)
- Add kernel-doc to some xe_lrc interfaces (Niranajana)
- Use missing lock in relay_needs_worker (Nirmoy)
- Drop redundant W=1 warnings from Makefile (Jani)
- Simplify if condition in preempt fences code (Thorsten)
- Flush engine buffers before signalling user fence on all engines (Andrzej)
- Don't overmap identity VRAM mapping (Matt Brost)
- Do not dereference NULL job->fence in trace points (Matt Brost)
- Add synchronous gt reset debugfs (Jonathan)
- Xe gt_idle fixes (Riana)

The following changes since commit 4a56c0ed5aa0bcbe1f5f7d755fb1fe1ebf48ae9c:

  Merge tag 'amd-drm-next-6.10-2024-04-26' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-04-30 14:43:00 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2024-06-06

for you to fetch changes up to 6800e63cf97bae62bca56d8e691544540d945f53:

  drm/xe: move disable_c6 call (2024-06-06 15:07:19 -0400)

----------------------------------------------------------------
UAPI Changes:
- Expose the L3 bank mask (Francois)

Cross-subsystem Changes:
- Update Xe driver maintainers (Oded)

Display (i915):
- Add missing include to intel_vga.c (Michal Wajdeczko)

Driver Changes:
- Fix Display (xe-only) detection for ADL-N (Lucas)
- Runtime PM fixes that enabled PC-10 and D3Cold (Francois, Rodrigo)
- Fix unexpected silent drm backmerge issues (Thomas)
- More (a lot more) preparation for SR-IOV support (Michal Wajdeczko)
- Devcoredump fixes and improvements (Jose, Tejas, Matt Brost)
- Introduce device 'wedged' state (Rodrigo)
- Improve debug and info messages (Michal Wajdeczko, Rodrigo, Nirmoy)
- Adding or fixing workarounds (Tejas, Shekhar, Lucas, Bommu)
- Check result of drmm_mutex_init (Michal Wajdeczko)
- Enlarge the critical dma fence area for preempt fences (Matt Auld)
- Prevent UAF in VM's rebind work (Matt Auld)
- GuC submit related clean-ups and fixes (Matt Brost, Himal, Jonathan, Niranjana)
- Prefer local helpers to perform dma reservation locking (Himal)
- Spelling and typo fixes (Colin, Francois)
- Prep patches for 1 job per VM bind IOCTL (no uapi change yet) (Matt Brost)
- Remove uninitialized end var from xe_gt_tlb_invalidation_range (Nirmoy)
- GSC related changes targeting LNL support (Daniele)
- Fix assert in L3 bank mask generation (Francois)
- Perform dma_map when moving system buffer objects to TT (Thomas)
- Add helpers for manipulating macro arguments (Michal Wajdeczko)
- Refactor default device atomic settings (Nirmoy)
- Add debugfs node to dump mocs (Janga)
- Use ordered WQ for G2H handler (Matt Brost)
- Clean up and fixes in header includes (Michal Wajdeczko)
- Prefer flexible-array over deprecated zero-lenght ones (Lucas)
- Add Indirect Ring State support (Niranjana)
- Fix UBSAN shift-out-of-bounds failure (Shuicheng)
- HWMon fixes and additions (Karthik)
- Clean-up refactor around probe init functions (Lucas, Michal Wajdeczko)
- Fix PCODE init function (Himal)
- Only use reserved BCS instances for usm migrate exec queue (Matt Brost)
- Only zap PTEs as needed (Matt Brost)
- Per client usage info (Lucas)
- Core hotunplug improvements converting stuff towards devm (Matt Auld)
- Don't emit false error if running in execlist mode (Michal Wajdeczko)
- Remove unused struct (Dr. David)
- Support/debug for slow GuC loads (John Harrison)
- Decouple job seqno and lrc seqno (Matt Brost)
- Allow migrate vm gpu submissions from reclaim context (Thomas)
- Rename drm-client running time to run_ticks and fix a UAF (Umesh)
- Check empty pinned BO list with lock held (Nirmoy)
- Drop undesired prefix from the platform name (Michal Wajdeczko)
- Remove unwanted mutex locking on xe file close (Niranjana)
- Replace format-less snprintf() with strscpy() (Arnd)
- Other general clean-ups on registers definitions and function names (Michal Wajdeczko)
- Add kernel-doc to some xe_lrc interfaces (Niranajana)
- Use missing lock in relay_needs_worker (Nirmoy)
- Drop redundant W=1 warnings from Makefile (Jani)
- Simplify if condition in preempt fences code (Thorsten)
- Flush engine buffers before signalling user fence on all engines (Andrzej)
- Don't overmap identity VRAM mapping (Matt Brost)
- Do not dereference NULL job->fence in trace points (Matt Brost)
- Add synchronous gt reset debugfs (Jonathan)
- Xe gt_idle fixes (Riana)

----------------------------------------------------------------
Andrzej Hajda (4):
      drm/xe: flush gtt before signalling user fence on all engines
      drm/xe: allow unaligned start and size xe_res_cursor parameters
      Revert "drm/xe: flush gtt before signalling user fence on all engines"
      drm/xe: flush engine buffers before signalling user fence on all engines

Arnd Bergmann (1):
      drm/xe: replace format-less snprintf() with strscpy()

Bommu Krishnaiah (1):
      drm/xe/xe2: Add workaround 14021402888

Colin Ian King (1):
      drm/xe: Fix spelling mistake "forcebly" -> "forcibly"

Daniele Ceraolo Spurio (3):
      drm/xe/gsc: Turn off GSCCS interrupts when disabling the engine
      drm/xe/gsc: define GSCCS for LNL
      Revert "drm/xe: make gt_remove use devm"

Dr. David Alan Gilbert (1):
      drm/xe: remove unused struct 'xe_gt_desc'

Francois Dugast (4):
      drm/xe/gt: Fix assert in L3 bank mask generation
      drm/xe/debugfs: Get a runtime_pm reference when setting wedged mode
      drm/xe/vm_doc: Fix some typos
      drm/xe/uapi: Expose the L3 bank mask

Himal Prasad Ghimiray (5):
      drm/xe/vm: Use xe_vm_lock()/xe_vm_unlock() helpers
      drm/xe: Use xe_bo_lock()/xe_bo_unlock() helpers
      drm/xe: Change xe_guc_submit_stop return to void
      drm/xe: Change pcode timeout to 50msec while polling again
      drm/xe: Fix the warning conditions

Janga Rahul Kumar (2):
      drm/xe: Relocate regs_are_mcr function
      drm/xe/mocs: Add debugfs node to dump mocs

Jani Nikula (1):
      drm/xe: drop redundant W=1 warnings from Makefile

John Harrison (3):
      drm/xe: Make read_perf_limit_reasons globally accessible
      drm/xe/guc: Port over the slow GuC loading support from i915
      drm/xe/guc: Fix uninitialised count in GuC load debug prints

Jonathan Cavitt (4):
      drm/xe/xe_guc_submit: Fix exec queue stop race condition
      drm/xe/xe_guc_submit: Allow lr exec queues to be banned
      drm/xe/xe_guc_submit: Declare reset if banned or killed or wedged
      drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs

José Roberto de Souza (6):
      drm/xe: Store xe_hw_engine in xe_hw_engine_snapshot
      drm/xe: Add helpers to loop over geometry and compute DSS
      drm/xe: Add INSTDONE registers to devcoredump
      drm/xe: Replace RING_START_UDW by u64 RING_START
      drm/xe: Add process name to devcoredump
      drm/xe: Nuke simple error capture

Karthik Poosa (3):
      drm/xe/hwmon: Remove unwanted write permission for currN_label
      drm/xe/hwmon: Add HWMON support for BMG
      drm/xe/hwmon: Expose card power and energy attributes of BMG

Lucas De Marchi (14):
      drm/xe/display: Fix ADL-N detection
      drm/xe: Merge 16021540221 and 18034896535 WAs
      drm/xe/ads: Use flexible-array
      drm/xe: Drop __engine_mask
      drm/xe: Drop useless forcewake get/put
      drm/xe: Move xe_gt_init_early() where it belongs
      drm/xe: Move xe_force_wake_init_gt() inside gt initialization
      drm/xe: Move sw-only pcode initialization
      drm/xe: Promote xe_hw_engine_class_to_str()
      drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
      drm/xe: Add helper to capture engine timestamp
      drm/xe: Cache data about user-visible engines
      drm/xe: Add helper to return any available hw engine
      drm/xe/client: Print runtime to fdinfo

Matt Roper (1):
      drm/xe: Don't refer to general LRC initialization as a "wa"

Matthew Auld (21):
      drm/xe/preempt_fence: enlarge the fence critical section
      Revert "drm/xe/vm: drop vm->destroy_work"
      drm/xe/vm: prevent UAF in rebind_work_func()
      drm/xe/pci: remove broken driver_release
      drm/xe: covert sysfs over to devm
      drm/xe/ggtt: use drm_dev_enter to mark device section
      drm/xe/guc: move guc_fini over to devm
      drm/xe/guc: s/guc_fini/guc_fini_hw/
      drm/xe/guc_pc: move pc_fini to devm
      drm/xe/guc_pc: s/pc_fini/pc_fini_hw/
      drm/xe/irq: move irq_uninstall over to devm
      drm/xe/device: move flr to devm
      drm/xe/device: move xe_device_sanitize over to devm
      drm/xe/coredump: move over to devm
      drm/xe/gt: break out gt_fini into sw vs hw state
      drm/xe: make gt_remove use devm
      drm/xe/mmio: move mmio_fini over to devm
      drm/xe: reset mmio mappings with devm
      drm/xe/display: move display fini stuff to devm
      drm/xe/display: stop calling domains_driver_remove twice
      drm/xe/display: move device_remove over to drmm

Matthew Brost (26):
      drm/xe: Delete unused GuC submission_state.suspend
      drm/xe: s/ENGINE_STATE_ENABLED/EXEC_QUEUE_STATE_ENABLED
      drm/xe: s/ENGINE_STATE_SUSPENDED/EXEC_QUEUE_STATE_SUSPENDED
      drm/xe: s/ENGINE_STATE_KILLED/EXEC_QUEUE_STATE_KILLED
      drm/xe: Fix alignment in GuC exec queue state defines
      drm/xe: Replace engine references with exec queue in xe_guc_submit.c
      drm/xe: Lock all gpuva ops during VM bind IOCTL
      drm/xe: Add ops_execute function which returns a fence
      drm/xe: Move migrate to prefetch to op_lock_and_prep function
      drm/xe: Add struct xe_vma_ops abstraction
      drm/xe: Use xe_vma_ops to implement xe_vm_rebind
      drm/xe: Simplify VM bind IOCTL error handling and cleanup
      drm/xe: Use xe_vma_ops to implement page fault rebinds
      drm/xe: Add some members to xe_vma_ops
      drm/xe: Add vm_bind_ioctl_ops_fini helper
      drm/xe: Move ufence check to op_lock_and_prep
      drm/xe: Move ufence add to vm_bind_ioctl_ops_fini
      drm/xe: Add xe_gt_tlb_invalidation_range and convert PT layer to use this
      drm/xe: Delete PT update selftest
      drm/xe: Use ordered WQ for G2H handler
      drm/xe: Only use reserved BCS instances for usm migrate exec queue
      drm/xe: Only zap PTEs as needed
      drm/xe: Decouple job seqno and lrc seqno
      drm/xe: Fix NULL ptr dereference in devcoredump
      drm/xe: Don't overmap identity VRAM mapping
      drm/xe: Do not dereference NULL job->fence in trace points

Michal Wajdeczko (79):
      drm/xe/guc: Add GuC Relay ABI version 1.0 definitions
      drm/xe: Add helper to calculate adjusted register offset
      drm/xe: Add few more GT register definitions
      drm/xe/pf: Add SR-IOV GuC Relay PF services
      drm/xe/kunit: Add PF service tests
      drm/xe/pf: Expose SR-IOV VFs configuration over debugfs
      drm/xe/pf: Expose SR-IOV VF control commands over debugfs
      drm/xe/pf: Expose SR-IOV policy settings over debugfs
      drm/xe/guc: Update VF configuration KLVs definitions
      drm/xe/pf: Clamp maximum execution quantum to 100s
      drm/xe/guc: Improve GuC doorbell/context ID manager intro message
      drm/xe: Check result of drmm_mutex_init()
      drm/xe/pf: Expose PF service details via debugfs
      drm/xe/guc: Fix typos in VF CFG KLVs descriptions
      drm/xe/pf: Re-initialize SR-IOV specific HW settings
      drm/xe/pf: Initialize and update PF services on driver init
      drm/xe: Add helpers for manipulating macro arguments
      drm/xe/kunit: Add simple tests for new xe_args macros
      drm/xe/rtp: Prefer helper macros from xe_args.h
      drm/xe: Fix xe_mocs.h
      drm/xe: Don't rely on xe_assert.h to be included elsewhere
      drm/xe: Don't rely on xe_force_wake.h to be included elsewhere
      drm/xe: Fix xe_device.h
      drm/xe: Move xe_gpu_commands.h file to instructions/
      drm/xe: Rename few xe_args.h macros
      drm/xe: Fix xe_gt_throttle_sysfs.h
      drm/xe: Fix xe_guc_ads.h
      drm/xe: Fix xe_lrc.h
      drm/xe: Fix xe_reg_sr.h
      drm/xe/uc: Reorder post hwconfig uC initialization step
      drm/xe/uc: Move GuC submission init to post hwconfig step
      drm/xe/pf: Don't advertise support to enable VFs if not ready
      drm/xe/pf: Implement pci_driver.sriov_configure callback
      drm/xe/guc: Add more KLV helper macros
      drm/xe/guc: Introduce GuC KLV thresholds set
      drm/xe/guc: Add support for threshold KLVs in to_string() helper
      drm/xe/pf: Introduce functions to configure VF thresholds
      drm/xe/pf: Allow configuration of VF thresholds over debugfs
      drm/xe/guc: Add GUC2PF_ADVERSE_EVENT to ABI
      drm/xe/pf: Track adverse events notifications from GuC
      drm/xe/pf: Expose PF monitor details via debugfs
      drm/xe/guc: Add VF2GUC_MATCH_VERSION to ABI
      drm/xe/guc: Add VF2GUC_VF_RESET to ABI
      drm/xe/guc: Add VF2GUC_QUERY_SINGLE_KLV to ABI
      drm/xe/vf: Add support for VF to query its configuration
      drm/xe/vf: Custom hardware config load step if VF
      drm/xe/vf: Expose SR-IOV VF attributes to GT debugfs
      drm/xe: Fix xe_uc.h
      drm/xe: Fix xe_gsc.h
      drm/xe: Fix xe_huc.h
      drm/xe: Fix xe_guc_pc.h
      drm/i915/display: Add missing include to intel_vga.c
      drm/xe: Don't rely on indirect includes from xe_mmio.h
      drm/xe: Cleanup xe_mmio.h
      drm/xe/guc: Allow to initialize submission with limited set of IDs
      drm/xe/vf: Custom GuC initialization if VF
      drm/xe/uc: Don't emit false error if running in execlist mode
      drm/xe/vf: Use register values obtained from the PF
      drm/xe/guc: Add GLOBAL_CFG_GMD_ID KLV definition
      drm/xe/vf: Obtain value of GMDID register from GuC
      drm/xe/vf: Provide early access to GMDID register
      drm/xe/vf: Cache value of the GMDID register
      drm/xe/vf: Treat GMDID as another runtime register
      drm/xe/vf: Read VF configuration prior to GGTT initialization
      drm/xe/vf: Use only assigned GGTT region
      drm/xe: Store platform name in xe_device.info
      drm/xe: Use platform name in xe_assert()
      drm/xe: Drop undesired prefix from the platform name
      drm/xe: Move XEHP_MTCFG_ADDR register definition to xe_regs.h
      drm/xe: Move BAR definitions to dedicated file
      drm/xe: Drop xe_ prefix from static functions in xe_mmio.c
      drm/xe: Promote VRAM initialization function to own file
      drm/xe/vf: Setup VRAM based on received config data
      drm/xe: Split MCR initialization
      drm/xe/pf: Update the LMTT when freeing VF GT config
      drm/xe/vf: Support only GuC/HuC firmwares
      drm/xe/vf: Custom uC initialization
      drm/xe/vf: Custom GuC reset
      drm/xe/vf: Custom GT restart

Niranjana Vishwanathapura (8):
      drm/xe: Minor cleanup in LRC handling
      drm/xe: Add Indirect Ring State support
      drm/xe: Dump Indirect Ring State registers
      drm/xe/xe2: Enable Indirect Ring State support for Xe2
      drm/xe: Properly handle alloc_guc_id() failure
      drm/xe: Remove unwanted mutex locking
      drm/xe: Decouple xe_exec_queue and xe_lrc
      drm/xe: Add kernel-doc to some xe_lrc interfaces

Nirmoy Das (11):
      drm/xe: Remove uninitialized end var from xe_gt_tlb_invalidation_range()
      drm/xe: Introduce has_atomic_enable_pte_bit device info
      drm/xe: Move vm bind bo validation to a helper function
      drm/xe: Introduce has_device_atomics_on_smem device info
      drm/xe: Add function to check if BO has single placement
      drm/xe: Refactor default device atomic settings
      drm/xe: Add warn when level can not be zero.
      drm/xe/tests: Use uninterruptible VM lock
      drm/xe: Check empty pinned BO list with lock held.
      drm/xe: Add engine name to the engine reset and cat-err log
      drm/xe: Use missing lock in relay_needs_worker

Oded Gabbay (1):
      MAINTAINERS: update Xe driver maintainers

Riana Tauro (4):
      drm/xe: Standardize power gate registers
      drm/xe: Enable Coarse Power Gating
      drm/xe/xe_gt_idle: use GT forcewake domain assertion
      drm/xe: move disable_c6 call

Rodrigo Vivi (13):
      drm/xe: make xe_pm_runtime_lockdep_map a static struct
      drm/xe: Introduce a simple wedged state
      drm/xe: declare wedged upon GuC load failure
      drm/xe: Force wedged state and block GT reset upon any GPU hang
      drm/xe: Introduce the wedged_mode debugfs
      drm/xe: Demote CCS_MODE info to debug only
      drm/xe: Fix xe_pm_runtime_get_if_active return
      drm/xe: Fix xe_pm_runtime_get_if_in_use documentation
      drm/xe: Relax runtime pm protection during execution
      drm/xe: Relax runtime pm protection around VM
      drm/xe: Prepare display for D3Cold
      drm/xe: Stop checking for power_lost on D3Cold
      drm/xe: Enable D3Cold on 'low' VRAM utilization

Shekhar Chauhan (1):
      drm/xe/xe2hpg: Add Wa_14021490052

Shuicheng Lin (1):
      drm/xe: Fix UBSAN shift-out-of-bounds failure

Tejas Upadhyay (4):
      drm/xe/xe2: Add workaround 14021567978
      drm/xe: skip error capture when exec queue is killed
      drm/xe/xe2lpm: Add permanent Wa_14020756599
      drm/xe/xe2lpg: Add permanent wa_14020756599

Thomas Hellström (7):
      drm/xe: Fix unexpected backmerge results
      Merge drm/drm-next into drm-xe-next
      drm/xe: Perform dma_map when moving system buffer objects to TT
      drm/xe: Split lrc seqno fence creation up
      drm/xe: Don't initialize fences at xe_sched_job_create()
      drm/xe: Remove xe_lrc_create_seqno_fence()
      drm/xe: Move job creation out of the struct xe_migrate::job_mutex

Thorsten Blum (1):
      drm/xe/vm: Simplify if condition

Umesh Nerlige Ramappa (4):
      drm/xe/lrc: Add helper to capture context timestamp
      drm/xe: Add helper to accumulate exec queue runtime
      drm/xe: Use run_ticks instead of runtime for client stats
      drm/xe: Do not access xe file when updating exec queue run_ticks

 Documentation/gpu/drm-usage-stats.rst              |  21 +-
 Documentation/gpu/xe/index.rst                     |   1 +
 Documentation/gpu/xe/xe-drm-usage-stats.rst        |  10 +
 MAINTAINERS                                        |   1 -
 drivers/gpu/drm/i915/display/intel_vga.c           |   1 +
 drivers/gpu/drm/xe/Kconfig.debug                   |  10 -
 drivers/gpu/drm/xe/Makefile                        |  34 +-
 drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h     | 190 ++++
 drivers/gpu/drm/xe/abi/guc_errors_abi.h            |  26 +-
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |  40 +-
 drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h     | 170 +++-
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |   3 +-
 drivers/gpu/drm/xe/display/xe_display.c            |  43 +-
 drivers/gpu/drm/xe/display/xe_display.h            |  12 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |   1 +
 .../xe/{regs => instructions}/xe_gpu_commands.h    |   0
 drivers/gpu/drm/xe/regs/xe_bars.h                  |  11 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |  10 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |  67 +-
 drivers/gpu/drm/xe/regs/xe_guc_regs.h              |   2 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h            |   8 +
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h            |   7 +
 drivers/gpu/drm/xe/regs/xe_regs.h                  |   3 +
 drivers/gpu/drm/xe/regs/xe_sriov_regs.h            |   3 +
 drivers/gpu/drm/xe/tests/Makefile                  |   1 +
 drivers/gpu/drm/xe/tests/xe_args_test.c            | 221 +++++
 .../gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c | 232 +++++
 drivers/gpu/drm/xe/tests/xe_migrate.c              |  88 +-
 drivers/gpu/drm/xe/xe_args.h                       | 143 +++
 drivers/gpu/drm/xe/xe_assert.h                     |   4 +-
 drivers/gpu/drm/xe/xe_bb.c                         |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                         |  71 +-
 drivers/gpu/drm/xe/xe_bo.h                         |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c                    |  58 ++
 drivers/gpu/drm/xe/xe_devcoredump.c                |  19 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h          |   2 +
 drivers/gpu/drm/xe/xe_device.c                     | 107 ++-
 drivers/gpu/drm/xe/xe_device.h                     |  13 +-
 drivers/gpu/drm/xe/xe_device_sysfs.c               |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h               |  23 +-
 drivers/gpu/drm/xe/xe_drm_client.c                 | 124 ++-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |  77 +-
 drivers/gpu/drm/xe/xe_exec_queue.h                 |  10 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |  16 +-
 drivers/gpu/drm/xe/xe_execlist.c                   |  12 +-
 drivers/gpu/drm/xe/xe_ggtt.c                       |  32 +-
 drivers/gpu/drm/xe/xe_gsc.c                        |   3 +
 drivers/gpu/drm/xe/xe_gsc.h                        |   3 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  |   1 +
 drivers/gpu/drm/xe/xe_gsc_submit.c                 |   1 +
 drivers/gpu/drm/xe/xe_gt.c                         | 142 ++-
 drivers/gpu/drm/xe/xe_gt.h                         |  27 +
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c                |  10 +-
 drivers/gpu/drm/xe/xe_gt_clock.c                   |   1 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  31 +
 drivers/gpu/drm/xe/xe_gt_freq.c                    |   8 +-
 drivers/gpu/drm/xe/xe_gt_idle.c                    |  66 +-
 drivers/gpu/drm/xe/xe_gt_idle.h                    |   4 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |  27 +-
 drivers/gpu/drm/xe/xe_gt_mcr.h                     |  25 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |  16 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c                |  32 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h                |   5 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         | 106 ++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h         |   6 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h   |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c        | 427 +++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h        |  18 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c        | 147 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h        |  27 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h  |  22 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c        | 550 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h        |  36 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service_types.h  |  52 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h          |  10 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c                | 979 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h                |  30 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c        |  72 ++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.h        |  14 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h          |  84 ++
 drivers/gpu/drm/xe/xe_gt_sysfs.c                   |   4 +-
 .../{xe_gt_throttle_sysfs.c => xe_gt_throttle.c}   |  30 +-
 drivers/gpu/drm/xe/xe_gt_throttle.h                |  17 +
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h          |  16 -
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |  64 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h        |   3 +
 drivers/gpu/drm/xe/xe_gt_topology.c                |  14 +-
 drivers/gpu/drm/xe/xe_gt_topology.h                |   3 +
 drivers/gpu/drm/xe/xe_gt_types.h                   |  34 +-
 drivers/gpu/drm/xe/xe_guc.c                        | 354 ++++++--
 drivers/gpu/drm/xe/xe_guc.h                        |   3 +-
 drivers/gpu/drm/xe/xe_guc_ads.c                    |  73 +-
 drivers/gpu/drm/xe/xe_guc_ads.h                    |   3 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                     |   9 +
 drivers/gpu/drm/xe/xe_guc_ct.h                     |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h               |   2 +
 drivers/gpu/drm/xe/xe_guc_db_mgr.c                 |   3 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c                 |   3 +-
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c            |  12 +
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h            |  15 +-
 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h     |  64 ++
 .../gpu/drm/xe/xe_guc_klv_thresholds_set_types.h   |  68 ++
 drivers/gpu/drm/xe/xe_guc_pc.c                     |  12 +-
 drivers/gpu/drm/xe/xe_guc_pc.h                     |   5 +-
 drivers/gpu/drm/xe/xe_guc_relay.c                  |  17 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 | 282 +++---
 drivers/gpu/drm/xe/xe_guc_submit.h                 |   4 +-
 drivers/gpu/drm/xe/xe_guc_types.h                  |   9 -
 drivers/gpu/drm/xe/xe_huc.c                        |   2 +
 drivers/gpu/drm/xe/xe_huc.h                        |   3 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                  | 193 +++-
 drivers/gpu/drm/xe/xe_hw_engine.h                  |   3 +
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c      |  30 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h            |  26 +-
 drivers/gpu/drm/xe/xe_hw_fence.c                   |  59 +-
 drivers/gpu/drm/xe/xe_hw_fence.h                   |   7 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |  37 +-
 drivers/gpu/drm/xe/xe_irq.c                        |   6 +-
 drivers/gpu/drm/xe/xe_lrc.c                        | 305 ++++++-
 drivers/gpu/drm/xe/xe_lrc.h                        |  58 +-
 drivers/gpu/drm/xe/xe_lrc_types.h                  |  12 +
 drivers/gpu/drm/xe/xe_migrate.c                    |  90 +-
 drivers/gpu/drm/xe/xe_mmio.c                       | 442 +++-------
 drivers/gpu/drm/xe/xe_mmio.h                       |  22 +-
 drivers/gpu/drm/xe/xe_mocs.c                       | 301 ++++++-
 drivers/gpu/drm/xe/xe_mocs.h                       |  11 +-
 drivers/gpu/drm/xe/xe_module.c                     |   5 +
 drivers/gpu/drm/xe/xe_module.h                     |   1 +
 drivers/gpu/drm/xe/xe_pat.c                        |   1 +
 drivers/gpu/drm/xe/xe_pci.c                        | 106 ++-
 drivers/gpu/drm/xe/xe_pci_sriov.c                  | 143 +++
 drivers/gpu/drm/xe/xe_pci_sriov.h                  |  13 +
 drivers/gpu/drm/xe/xe_pci_types.h                  |   4 +
 drivers/gpu/drm/xe/xe_pcode.c                      |   8 +-
 drivers/gpu/drm/xe/xe_pm.c                         |  42 +-
 drivers/gpu/drm/xe/xe_pm.h                         |   9 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c              |  14 +-
 drivers/gpu/drm/xe/xe_pt.c                         |  69 +-
 drivers/gpu/drm/xe/xe_query.c                      |  10 +-
 drivers/gpu/drm/xe/xe_reg_sr.h                     |   4 +-
 drivers/gpu/drm/xe/xe_res_cursor.h                 |   2 -
 drivers/gpu/drm/xe/xe_ring_ops.c                   |  52 +-
 drivers/gpu/drm/xe/xe_rtp.c                        |   6 +
 drivers/gpu/drm/xe/xe_rtp.h                        |  18 +-
 drivers/gpu/drm/xe/xe_rtp_helpers.h                |  26 +-
 drivers/gpu/drm/xe/xe_sched_job.c                  | 181 ++--
 drivers/gpu/drm/xe/xe_sched_job.h                  |   7 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h            |  20 +-
 drivers/gpu/drm/xe/xe_sriov.c                      |  11 +
 drivers/gpu/drm/xe/xe_sync.c                       |  15 +
 drivers/gpu/drm/xe/xe_sync.h                       |   1 +
 drivers/gpu/drm/xe/xe_tile_sysfs.c                 |   4 +-
 drivers/gpu/drm/xe/xe_trace.h                      |  11 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |   2 +
 drivers/gpu/drm/xe/xe_uc.c                         |  58 +-
 drivers/gpu/drm/xe/xe_uc.h                         |   4 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                      |   5 +
 drivers/gpu/drm/xe/xe_vm.c                         | 859 ++++++++++--------
 drivers/gpu/drm/xe/xe_vm.h                         |   5 +-
 drivers/gpu/drm/xe/xe_vm_doc.h                     |  24 +-
 drivers/gpu/drm/xe/xe_vm_types.h                   |  33 +-
 drivers/gpu/drm/xe/xe_vram.c                       | 368 ++++++++
 drivers/gpu/drm/xe/xe_vram.h                       |  13 +
 drivers/gpu/drm/xe/xe_vram_freq.c                  |   4 +-
 drivers/gpu/drm/xe/xe_wa.c                         |  46 +-
 include/uapi/drm/xe_drm.h                          |   2 +
 166 files changed, 8058 insertions(+), 1800 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe-drm-usage-stats.rst
 rename drivers/gpu/drm/xe/{regs => instructions}/xe_gpu_commands.h (100%)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_bars.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_args_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c
 create mode 100644 drivers/gpu/drm/xe/xe_args.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_service_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
 rename drivers/gpu/drm/xe/{xe_gt_throttle_sysfs.c => xe_gt_throttle.c} (83%)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.h
 create mode 100644 drivers/gpu/drm/xe/xe_vram.c
 create mode 100644 drivers/gpu/drm/xe/xe_vram.h
