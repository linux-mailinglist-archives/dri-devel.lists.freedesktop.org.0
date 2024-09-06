Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E9996E7BA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 04:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4565B10E16C;
	Fri,  6 Sep 2024 02:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b/SHXAgj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB1310E118;
 Fri,  6 Sep 2024 02:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725589762; x=1757125762;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=f0Yt+NJDKx+ZiIZ/se5QU0t7W2xIDEEW3n0xtlBc91k=;
 b=b/SHXAgjkAH+h0Y/o1WU5/ZTmq7xV8GUrIU1eVct9S2wY1orPwJi0Z/F
 OSEF+5d5khJaMycPA+pn8k4u9xKJCVb9YXc2RKt9XPO+GxbR7pqxtK8+k
 BbK+KVrZQdx3AbawfHUwr+Z2u7v+s+xe3OMcjOTRc8CAUUlYRyxrginE9
 96fjEdNo19Wb+q1j6uMvioiR22XK0yvvHcjRsaPjvP9NKnRiOS4jkZt43
 KGTIRLYAvd4Fyb+RwewTvtCUWqyjjVdMSkrdi7+LofZGM5HTpdum2asM/
 gmaZ5KAO5G/rj/RggLfUPsf/DY7R9f0A4dkT1Jt8RNpruH35Bp8NwQBo5 w==;
X-CSE-ConnectionGUID: mI/705E/Sgur51d7rVwwww==
X-CSE-MsgGUID: 2mc3Nkv6STqWgXEOkULe1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35486750"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="35486750"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 19:29:21 -0700
X-CSE-ConnectionGUID: og20dPLNTe21aWwpSYanDQ==
X-CSE-MsgGUID: MACAD+yNS12vZiqPpPPX2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="65861275"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 19:29:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 19:29:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 19:29:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 19:29:19 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 19:29:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQiLRORJNqxlhtYE61rMPY7d9TMwKuPNAE5bOCXlzDjBj5PGl+rF5Hrdqc0RWLF/qG2vdYPeDqCeARlafQ63loWYPF7vcVqXrnhYQotXmagfOj/+RNi8jI6RccEaTc+07ZmJZYeh4B+YEmHMNQejDemjsEo2orftmihQSW7FlDS79jzoGaI+rOtweOpEF2na9ChGJ1vUlhhjFEFYTI9XbI+bctDZaQIujKpY2nU4nraUQ2CevFW5BnnTkwfqWWjF+SGl9a68OjIfl2j2+1b7WCjKwpQbI8YvUpgjhoYJddizO8qAaJJnS+1NkNb5OKpiTOV/70Ymq4PO+XcaOFpomQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biNqMWGpQEjlKdhwsRpADQPo0Dw/WXLvOZKKlCoV0r0=;
 b=CkE3XOi6LKjLt8RA/6h2CbMptNbGsPq4x76MqBtCNV8cs84eYuO5d60Qv97EQIkZDCwdkqjsDEopE+C5DCC6ctk4hoJf7Js4bI9q6/qf691gUIwe6eJ/A85XP4G19MRMX6+8eO9pfrvMMqligkTvyI8OxcvoFuMWkF7KWl2rtwBYPC8p3CbSbwDbsCmIWPdMJoFwX5BwOeOFnTQ8zmQlKECHDZu9FBIA8gX0GpuphynAPIehZ6q0xgesFqwFb6Bo3hJ5bVVb31ravy+sjWZX2lUFSWGUmwIc1TiGWmy7g+vUz/pUneZC42TPshypMpprjgyTboE6bLvwGB0HG+6oSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 02:29:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 02:29:17 +0000
Date: Thu, 5 Sep 2024 21:29:12 -0500
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
Subject: [PULL] drm-xe-next
Message-ID: <eirx5vdvoflbbqlrzi5cip6bpu3zjojm2pxseufu3rlq4pp6xv@eytjvhizfyu6>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR16CA0008.namprd16.prod.outlook.com (2603:10b6:907::21)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: f6983c45-7744-4d35-c02d-08dcce1bb498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?VfSohInjoX94BRHQ3tcW8hJoxsDedRXsXvMuD56Qftk/PxTZG/utoNfwJf?=
 =?iso-8859-1?Q?SJeGiMew4sJMrYsX7Kvg5lodDqHlAzyMRxk+CUQ6bJ3e9qewLOd/Jmn6RC?=
 =?iso-8859-1?Q?ETcdrM0DwD5YDq5SRqjSTYiSIOW0mX1bEak22TcAL8gVH7yRoD8kS7WdJ+?=
 =?iso-8859-1?Q?3OpW1MkgN9XuEfPeGbdkOGU4d/9J4NwFPIofWXk7yRm+hn5Tl1/4eMofI3?=
 =?iso-8859-1?Q?AmKRQfSd5Goi6gixtsyrg1VhEJ7YeJoxT/LWWS5u5As+PUY4+bU3Bn4Rqp?=
 =?iso-8859-1?Q?d5Vo2nnyeX6ys1OeFuO9TK6z6psz4ex32ljDvL3BWQpO2K3py5K9iJZ4LA?=
 =?iso-8859-1?Q?Ovxg3xQN/pcF3a+MO0lnsM6xe2/sWHoKpu/92H22sX99cpfctX0zYfYk5Z?=
 =?iso-8859-1?Q?LcYKk5SENMWhuBUJXsWR9HNkdbo4sopEJvZy1Yzx4PkmgruAdX4KNrxiyR?=
 =?iso-8859-1?Q?xms1f6XqdtSrlIq1WeXr4TCoi6gqOJQVG5MM6DZ3t0Qak10S/bFFE9g4ij?=
 =?iso-8859-1?Q?+w/FCX1Ras5zsgLlTEREMRRnMMdXUI0wxlUXvDwgv8YKtsqfSTCgbQr6Sm?=
 =?iso-8859-1?Q?N30nKEDGIPZo29qMiCW7p8BDr4zqWu6bR6jO1XsYmPBPSgpzmxAEc0p2kw?=
 =?iso-8859-1?Q?vxtQRcvsTDz8pNsmp2yCPX02LZN+34xsNOdpXXIJoSuU5zER5uMpmL9K6l?=
 =?iso-8859-1?Q?/AOfqZ5nC0MIkEEDQsVdQ2yP+lSDAvJ5ZN86QxegRQzG+bUSBmUBwt+MDX?=
 =?iso-8859-1?Q?7THJ4VL3pYi4ty5ZmNlsHCM6vLAbPfmreTki0VNlqoz6IZjWVohDWQKnUY?=
 =?iso-8859-1?Q?F+GzL5p8s/mamn3NbRTEodOltDhf9PfTiE20gYmCY20nitJXViHQvnXeIL?=
 =?iso-8859-1?Q?aDDfF+5BOFgx4BQWjE74T6BT3NR44EuNzhwdss0+Kzz2tWUdObE/9ikzAL?=
 =?iso-8859-1?Q?y7JdfzvXXjlumRSK9uGILQ8aMWvxZ8Jxx8JfsftgWt6VWpRL3wXvlosrKC?=
 =?iso-8859-1?Q?F5Ncg5QwkN7durm5TJaN2ffmjuVr3K5ZZQOgNcXxBeaApkJskI4EbCINN7?=
 =?iso-8859-1?Q?rJAYtf+iAJC4wsRhezziV40aF30UkiS1Ukb4RRPJ/eUpYV8vDT453wpcQ7?=
 =?iso-8859-1?Q?qAqCIKNQdPOi4oupHjtMGq8Ggw2jqoYFChOzwNwzh9mXRmkRd6v6of8TRA?=
 =?iso-8859-1?Q?1rxmiX5YMahIg8op1huGOOK7xusPh0x9YwLbn6C5LAaNLP2TaPsiDgK3p3?=
 =?iso-8859-1?Q?3fUwDfeJZH6qRPu2Epg5yw/gIZ/D+GTY5QCr97shatQfxqQlw3BpXaw8Hf?=
 =?iso-8859-1?Q?tUEt10bL5doW7Z3qFai2mDoY1lzRqYEgQBhSbrbGFZI1O3U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?u8Hhb0l9QwuHoO4fllFyeo9Gbb/qdDSQYxOj0aWd6jSnpr3skz091g20M/?=
 =?iso-8859-1?Q?VjPJpdvs+WhfNNxMsiFjlou27DRM9HbvcTRrJjfW4ldil8MhaM+XEXRg9T?=
 =?iso-8859-1?Q?PcajRWKcIwF9ukKODUBO83z4AcKqgpMNJjv2d0pyCpY0W6HwMMIPGVe3Yh?=
 =?iso-8859-1?Q?6tGHPqSUhcK2jZowF1T6W7LGekEz5gsN8LjTrahXge5MGJQGovVqUFFDWV?=
 =?iso-8859-1?Q?xWQxW+Hvd+i8hzkQlgVu5mnhHxBCzxbns+mmeZwLGkMNgN8UdQe3OXXf0Z?=
 =?iso-8859-1?Q?ZKqjaOWmCP6wwjxBf1kBSXT1rtGXi+h7I+t0vxyqEQ06oIeihoKJJROSS+?=
 =?iso-8859-1?Q?SjRy9XhhmSwVK4vpLVoVFh6J6QNqFvTHxWwhLCTQpgG25mdfW4JzaNAvDG?=
 =?iso-8859-1?Q?F6QzVI+nB0S/iXA2ZS45pUXf6gitN3gH0DZNSW58snppLbtgLndmU/mm8h?=
 =?iso-8859-1?Q?Q4wJgSvWJxSnCHFxx+pjPiU2Vq11pFVPnHklBu/rJRBV+Rb9I0kOtgjCqc?=
 =?iso-8859-1?Q?EwPRsC38YajuKCT3dMUXfo/RctGCQpdDZnmitWC/Wcv44iYBBn+L8DbDno?=
 =?iso-8859-1?Q?wog968CCWwDbWZPjV8mOK9uZ/opMfE3aizurx6cZ7VzwEpq6awJKmhU8/8?=
 =?iso-8859-1?Q?NRdrFxKJ5xTEuFqzSTtJZ4xFeBmmUmnnfCggebdMksfbQWPegZ+tN1Iz47?=
 =?iso-8859-1?Q?PlRwOaiQPkbiPD22zYfJG+5v+3gQI10UKIr25lsEA51TDQyUVlORbMCl7c?=
 =?iso-8859-1?Q?AIlBybH4lGFeoGAnyFGdOFdvWW312n811Rv4o65J/7Itw/XS9i0F9JEHgs?=
 =?iso-8859-1?Q?4NtPV7ZBuXjdtQxKE8uH4gf6O0kFElwrcsmHsXimf+4BeSt16R/OPq08tv?=
 =?iso-8859-1?Q?IaZM8j3WCFuEV9H1lCCBupmLda3otQjSh8V5fTN+KxUkbycTA1PW6O082X?=
 =?iso-8859-1?Q?ufgTDR2uDZ9xS1kc5WHp5VSDcScZ6Dt6Lmw30q8QLsiQrbfpnzyutSS/Zk?=
 =?iso-8859-1?Q?jTFLIvuxIhZrNLbIxoODsFr73jaVALEJ8bOjFlVafwEQnmZI/eC5ZUbyBV?=
 =?iso-8859-1?Q?JzBPfjo6GhK3IqgbxNqtMHW2ma9Npq5BF/ebeOwWPqQXUv83E3ALKkCisH?=
 =?iso-8859-1?Q?MQhgJzz+jikck1H/eUcQk5B584RR3/cLXS9tvEmzHbmpcOl4L2UggKSd2Y?=
 =?iso-8859-1?Q?BRLv9MZ1VCzrOK5mUaE6sgmyfSfzDxxRyzLgveRtxFM84ItJANCRRqeG//?=
 =?iso-8859-1?Q?MA4vEAGZ5ZCouCP5ruQYe/1zyCubReEbyCTwhTczy9pUaFz0A86xTJWRXt?=
 =?iso-8859-1?Q?wGTt4v8OU2PB46Ty9ihKfB39qjo/Esyf+yKzUTK3LGAvnR8K61ytQB31Ec?=
 =?iso-8859-1?Q?/g8D3s2654Zdpbz4Wq22uA9qgNg03YGu3Eb0IjSo0VVl7adwSR6kaUvSCS?=
 =?iso-8859-1?Q?lhyr7frZEh+GP3+kOVRUTJkn1TrFwAYcZcBQvaa1rhPUTfSAA0y5iZkSII?=
 =?iso-8859-1?Q?GT3u825ss8B0O1kwEA5aAUnBXIB82i22VJHQeuyFs+4hvbH8saOLVm7UTC?=
 =?iso-8859-1?Q?KD5oAEr3l0As6oL9xoHQkjUZoWksbTktwuAbc6tazRUqC/dgI1oaIna8Gv?=
 =?iso-8859-1?Q?9PvHzs239gddf4albvQAiUkszlvGhVrkpFEi9sZD3Mjj7YbAjXHfc5Lg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6983c45-7744-4d35-c02d-08dcce1bb498
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 02:29:17.0553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gDbZSwd5Qo3NvoAWDetIq31DfyrB2+8SFagMsUjmN0kcy6GqDc1bUpLCTtA9ELDxhGEGWqvOJq+pHArR8FhHYjcdJNuVZTUpkHyn5bcbiTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7104
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

Hi Dave and Simona,

Last drm-xe-next pull for 6.12. I was going to bring only the fixes, but
that would be basically most of the changes available. And what's not a
fix it's pretty trivial stuff. So I'm including everything.

The one outstanding thing is a prep patch to dma-buf that was needed to
properly replace a fix we reverted last week. That's being tested for
more than a week and proved better than the previous one.

thanks
Lucas De Marchi

drm-xe-next-2024-09-05:
Cross-subsystem Changes:
- Split dma fence array creation into alloc and arm (Matthew Brost)

Driver Changes:
- Move kernel_lrc to execlist backend (Ilia)
- Fix type width for pcode coommand (Karthik)
- Make xe_drm.h include unambiguous (Jani)
- Fixes and debug improvements for GSC load (Daniele)
- Track resources and VF state by PF (Michal Wajdeczko)
- Fix memory leak on error path (Nirmoy)
- Cleanup header includes (Matt Roper)
- Move pcode logic to tile scope (Matt Roper)
- Move hwmon logic to device scope (Matt Roper)
- Fix media TLB invalidation (Matthew Brost)
- Threshold config fixes for PF (Michal Wajdeczko)
- Remove extra "[drm]" from logs (Michal Wajdeczko)
- Add missing runtime ref (Rodrigo Vivi)
- Fix circular locking on runtime suspend (Rodrigo Vivi)
- Fix rpm in TTM swapout path (Thomas)
The following changes since commit 3adcf970dc7ec0469ec3116a5a8be9161d17a335:

   drm/xe/bmg: Drop force_probe requirement (2024-08-28 10:47:03 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2024-09-05

for you to fetch changes up to 34bb7b813ab398106f700b0a6b218509bb0b904c:

   drm/xe: Use xe_pm_runtime_get in xe_bo_move() if reclaim-safe. (2024-09-04 09:28:09 +0200)

----------------------------------------------------------------
Cross-subsystem Changes:
- Split dma fence array creation into alloc and arm (Matthew Brost)

Driver Changes:
- Move kernel_lrc to execlist backend (Ilia)
- Fix type width for pcode coommand (Karthik)
- Make xe_drm.h include unambiguous (Jani)
- Fixes and debug improvements for GSC load (Daniele)
- Track resources and VF state by PF (Michal Wajdeczko)
- Fix memory leak on error path (Nirmoy)
- Cleanup header includes (Matt Roper)
- Move pcode logic to tile scope (Matt Roper)
- Move hwmon logic to device scope (Matt Roper)
- Fix media TLB invalidation (Matthew Brost)
- Threshold config fixes for PF (Michal Wajdeczko)
- Remove extra "[drm]" from logs (Michal Wajdeczko)
- Add missing runtime ref (Rodrigo Vivi)
- Fix circular locking on runtime suspend (Rodrigo Vivi)
- Fix rpm in TTM swapout path (Thomas)

----------------------------------------------------------------
Daniele Ceraolo Spurio (5):
       drm/xe/gsc: Do not attempt to load the GSC multiple times
       drm/xe/gsc: Fix FW status if the firmware is already loaded
       drm/xe/gsc: Track the platform in the compatibility version
       drm/xe/gsc: Add debugfs to print GSC info
       drm/xe/gsc: Wedge the device if the GSCCS reset fails

Ilia Levi (1):
       drm/xe: move the kernel lrc from hwe to execlist port

Jani Nikula (1):
       drm/xe: replace #include <drm/xe_drm.h> with <uapi/drm/xe_drm.h>

Karthik Poosa (1):
       drm/xe/hwmon: Fix WRITE_I1 param from u32 to u16

Matt Roper (3):
       drm/xe/display: Drop unnecessary xe_gt.h includes
       drm/xe/pcode: Treat pcode as per-tile rather than per-GT
       drm/xe/hwmon: Treat hwmon as a per-device concept

Matthew Brost (2):
       dma-buf: Split out dma fence array create into alloc and arm functions
       drm/xe: Invalidate media_gt TLBs in PT code

Michal Wajdeczko (7):
       drm/xe/pf: Add function to sanitize VF resources
       drm/xe/pf: Fix documentation formatting
       drm/xe/pf: Drop GuC notifications for non-existing VF
       drm/xe/pf: Improve VF control
       drm/xe/pf: Add thresholds to the VF KLV config
       drm/xe/pf: Reset thresholds when releasing a VF config
       drm/xe: Remove redundant [drm] tag from xe_assert() message

Nirmoy Das (1):
       drm/xe: Fix memory leak on xe_alloc_pf_queue failure

Rodrigo Vivi (2):
       drm/xe: Add missing runtime reference to wedged upon gt_reset
       drm/xe/display: Avoid encoder_suspend at runtime suspend

Thomas Hellström (1):
       drm/xe: Use xe_pm_runtime_get in xe_bo_move() if reclaim-safe.

  drivers/dma-buf/dma-fence-array.c                  |   78 +-
  drivers/gpu/drm/xe/Makefile                        |    1 +
  .../gpu/drm/xe/compat-i915-headers/intel_pcode.h   |    8 +-
  .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |    7 +
  drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |    1 -
  drivers/gpu/drm/xe/display/xe_display.c            |    8 +-
  drivers/gpu/drm/xe/display/xe_dsb_buffer.c         |    1 -
  drivers/gpu/drm/xe/display/xe_fb_pin.c             |    1 -
  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |    1 -
  drivers/gpu/drm/xe/regs/xe_gsc_regs.h              |    4 +
  drivers/gpu/drm/xe/tests/xe_dma_buf.c              |    2 +-
  drivers/gpu/drm/xe/xe_assert.h                     |    2 +-
  drivers/gpu/drm/xe/xe_bo.c                         |   13 +-
  drivers/gpu/drm/xe/xe_device.c                     |    2 +-
  drivers/gpu/drm/xe/xe_device_types.h               |    6 +
  drivers/gpu/drm/xe/xe_drm_client.c                 |    2 +-
  drivers/gpu/drm/xe/xe_exec.c                       |    2 +-
  drivers/gpu/drm/xe/xe_exec_queue.c                 |    2 +-
  drivers/gpu/drm/xe/xe_execlist.c                   |   23 +-
  drivers/gpu/drm/xe/xe_execlist_types.h             |    2 +
  drivers/gpu/drm/xe/xe_gsc.c                        |   61 +-
  drivers/gpu/drm/xe/xe_gsc.h                        |    3 +
  drivers/gpu/drm/xe/xe_gsc_debugfs.c                |   71 ++
  drivers/gpu/drm/xe/xe_gsc_debugfs.h                |   14 +
  drivers/gpu/drm/xe/xe_gt.c                         |    9 +-
  drivers/gpu/drm/xe/xe_gt_pagefault.c               |    8 +-
  drivers/gpu/drm/xe/xe_gt_sriov_pf.c                |    6 +
  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |  103 ++
  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h         |    1 +
  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c        | 1258 +++++++++++++++++++-
  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h        |    3 +
  drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h  |  107 ++
  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h          |    6 +
  drivers/gpu/drm/xe/xe_gt_types.h                   |    6 -
  drivers/gpu/drm/xe/xe_guc_pc.c                     |    2 +-
  drivers/gpu/drm/xe/xe_hw_engine.c                  |   17 +-
  drivers/gpu/drm/xe/xe_hw_engine_types.h            |    2 -
  drivers/gpu/drm/xe/xe_hwmon.c                      |   97 +-
  drivers/gpu/drm/xe/xe_migrate.c                    |    2 +-
  drivers/gpu/drm/xe/xe_oa.c                         |    2 +-
  drivers/gpu/drm/xe/xe_oa_types.h                   |    2 +-
  drivers/gpu/drm/xe/xe_observation.c                |    2 +-
  drivers/gpu/drm/xe/xe_pat.c                        |    2 +-
  drivers/gpu/drm/xe/xe_pcode.c                      |  104 +-
  drivers/gpu/drm/xe/xe_pcode.h                      |   16 +-
  drivers/gpu/drm/xe/xe_pm.c                         |    9 +-
  drivers/gpu/drm/xe/xe_pm.h                         |    1 +
  drivers/gpu/drm/xe/xe_pt.c                         |  117 +-
  drivers/gpu/drm/xe/xe_query.c                      |    2 +-
  drivers/gpu/drm/xe/xe_rtp.c                        |    2 +-
  drivers/gpu/drm/xe/xe_sched_job.c                  |    2 +-
  drivers/gpu/drm/xe/xe_sync.c                       |    2 +-
  drivers/gpu/drm/xe/xe_tile.c                       |    3 +
  drivers/gpu/drm/xe/xe_uc_debugfs.c                 |    2 +
  drivers/gpu/drm/xe/xe_uc_fw.c                      |   13 +-
  drivers/gpu/drm/xe/xe_uc_fw.h                      |    9 +-
  drivers/gpu/drm/xe/xe_vm.c                         |    2 +-
  drivers/gpu/drm/xe/xe_vram_freq.c                  |    6 +-
  drivers/gpu/drm/xe/xe_wait_user_fence.c            |    2 +-
  include/linux/dma-fence-array.h                    |    6 +
  60 files changed, 1977 insertions(+), 271 deletions(-)
  create mode 100644 drivers/gpu/drm/xe/xe_gsc_debugfs.c
  create mode 100644 drivers/gpu/drm/xe/xe_gsc_debugfs.h
  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
