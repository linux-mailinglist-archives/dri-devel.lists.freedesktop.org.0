Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189C5964764
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 15:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DDC10E6B5;
	Thu, 29 Aug 2024 13:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFU7LzqH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E403A10E1B1;
 Thu, 29 Aug 2024 13:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724939972; x=1756475972;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=LfqKUQxy8BDPA9URN2z1ViW1Qs8fCWjGc8gMgLxS6KU=;
 b=JFU7LzqHaE1E8IDqnh2M3qLobtKDU3F5WXGU8I4rTSk69CK+oRPAAcz4
 9r80TosjWzu/PlB+ns2Qc0Gvb7gS+PcJzpw9IfxzGKoTCgLepqUPD0vBg
 cdFBFaP9HiIjAlJSN9tq5nTMWhDSYhTP7As+dED6/SKZDNeo8HdXhnw7x
 v32Grrhr7tW3TyrO3LimuanF3+s3j3iEbbuYigSBYatjM1eD5kPw0DTft
 MaeiBPBAVG+I3/RdoQLXAqZyRWqQsqTfhD6d8Azl6FrbBGBRr0rx6Ru6W
 TcbjEFXxyL9vixeHmL/MMsYOKOzj9OAs5HbjdEiMYl+7gvqrqcKDY4Cql A==;
X-CSE-ConnectionGUID: SyteXLBqQFSIEC+rcuFmeQ==
X-CSE-MsgGUID: g9tL7vH5ScyNwKilpKOWiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="41009277"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="41009277"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 06:59:31 -0700
X-CSE-ConnectionGUID: p1wXQCE4TRGCaIby9IX/Xg==
X-CSE-MsgGUID: nSkrp01SRpaHPgCa5aKCFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="63777185"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 06:59:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 06:59:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 06:59:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 06:59:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 06:59:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Al1wFELsp7hyyhscX/uRYKPeYvYRZfthCt1jDigoasfi1LWP2ZTwqg7jrnTVN3HSMbCn9RFR1AiLQkWA1l1Vx9wDTreBUFt7mCPJX+WOP4ptmwOHxbeN6JOE/gR/sXWr214jU0ofP/GWN+/XHFa6MRk3RVuEEiN47/kPb5oKA/YksVN/iQBtZgI4IBbNPoBwCYua5MJSp7Y4K0tOKL1pGPJTk7X0m92tl0AYzQ0pESQ93VHX8rdGSjGcmcs/sQyRoln8D/7jc4gzX3tv4yoGQsCbmXGqUvJ0NkCgpW0ujM9ZG84O5Ix3+DS6wowe+nl2AaaUB07af5ObCrYYiljiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCv99Pop214aaBBUj8l8GSQUhd8feeEnDrOMv+DUo5Y=;
 b=TqYkipExbycs8UCAHU5B58aRxXuFqjzNPNFsDv0n+I6MY2Tak1eqzxO9Ga9U1azDy38GeUK+SKl2eiurdZvT6yhWXsvPDBsgsZWGV9DPFSJ1umz0FlHrd9D19JXb5wi1cw3PLIOlzltvDbBbnrsDG7nFFJl8UimAmMWSQ52E94+Zoqo3CQuKkF/wFoE/7rr5HQP8ShM8pOQDwIfkHgCS7vrW46hY7wwuHTcG2s6rI2XqxVdTUmR+fRaNLbOSKlvXZA6vPqx4K5oq2rc5SGjAhjJLxurtCExd5ou/4SOvw094mgAeHkA0osSQlajNbTHpip4wKwp6Fgb79Bp3lnXbzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH8PR11MB7968.namprd11.prod.outlook.com (2603:10b6:510:25f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Thu, 29 Aug
 2024 13:59:25 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7897.014; Thu, 29 Aug 2024
 13:59:25 +0000
Date: Thu, 29 Aug 2024 09:59:19 -0400
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
Subject: [PULL] drm-xe-fixes
Message-ID: <ZtB-t5f4uXMrKgnV@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW2PR16CA0012.namprd16.prod.outlook.com (2603:10b6:907::25)
 To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH8PR11MB7968:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b361f9-f0d7-4191-a42d-08dcc832ca6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iBBjfuG56SU5q8sb9UrBr9q1ceTePJeOmFZ93y7pIfCTwndl1UGv8/Y3EfNF?=
 =?us-ascii?Q?Aobv6zJXlopqskUK7VVOFae0Sj+vPV5qKVaG1+JSwjHwK4+w+cio5+S0DPQP?=
 =?us-ascii?Q?nzEUplPDrvcexfEETdZQxEqbyia16hdtfQzgrqAzgJdD7+bf5c/mxL7C7kbp?=
 =?us-ascii?Q?wTevpOQ9DovzhPglNocoXY/Wydw9GfmATwCXWz6efs1y6fT8PL1OYxQufcPU?=
 =?us-ascii?Q?jCMmgq3tqeX1e44tZkOIb22r4qltATkk/sBkdy+fnuSQafYbhWpgQA7asXa3?=
 =?us-ascii?Q?PPQBhkU/6J8jOPv4vAt9js88Bma6fGfDjROsoxBikl5iZu63IhzX5oNOZkvD?=
 =?us-ascii?Q?WrSz94t5meinRdgjJUVApAEwU9uD7j+WSvd0TkdJ7qN2nIxvlmoQFBJNmi/f?=
 =?us-ascii?Q?Ja/Fy7+x2Kzs+GD2j+FaqI9Nu2gyIECrSjRJSoZVekwCSXwReCKRhtmsZpYl?=
 =?us-ascii?Q?cJp/GINeXbJQayG97TnlP8JxwiM/PjylGZSIROWkoXDAKUnKAy5cFrJxtyiZ?=
 =?us-ascii?Q?AFTLYzB2QUL7D2FmyrFchAd1V7vJLLRjfkEr1AREeW5guQAb3jRegVzJNj8L?=
 =?us-ascii?Q?RJU0bmMGM3Ds0608VAiuAWfSqfKSaQbg8sHwxe+/hId3DBYTjwRBBe2qroNx?=
 =?us-ascii?Q?CIaIH8lDJD75FP47yUA5Ph0PHxLjCa2yY4kohOz7cdoa0awT28iX+WWg1L+T?=
 =?us-ascii?Q?6V+gbz3Mpb45GpP/o8bhiCvC19fB50e1VgU7y2d2JnfTHCam8ThrvY56hPKF?=
 =?us-ascii?Q?LDAgvC1mihPVq6FcuveI0KVhKui652Vq3el/MgLqRna5a2tpL6jiYGV7WAM9?=
 =?us-ascii?Q?2hRjD05NVVpogzIpg2Ibhcrsp5uqPVktjh4InOVj+cMyo29HvB7kKf9OV6CX?=
 =?us-ascii?Q?3ZplihsLcuXRKmyTeshUOR8Wl74nOM2g5uC23SURrLO4/8GHE/0dF2fa0flB?=
 =?us-ascii?Q?ZmazIimQ4oCXDWZ9uuACm0wIY1SKV7fWw13YBPl7cdKjGNZ5qJ8dXavfPS7C?=
 =?us-ascii?Q?7phYZAfgM2ilncdKDUjvgEKrDI52PHZX2zPFic/wrhkaV24SqGDBp7KB3YD6?=
 =?us-ascii?Q?Kuyvll9WP+WDjqWKvhoo8lMAZ9ch2eTH0jvY2BTpBSRckgTsFukwRU9AKlOH?=
 =?us-ascii?Q?y0Pzl5VIeYUdy1EFq8cVU4jEhvHtv8djRobfy8mXEVP5jIcmFRT3TuXPrB+5?=
 =?us-ascii?Q?p+SXH49UrXjFn1fvzrZP09YiSdQJ3ceTJbG0AF385E/V6hetbbS/R1L3UxRn?=
 =?us-ascii?Q?aeHwHD8SwDYE91X9hbkY8QVBa15SZE8U3CfpnfWn+J7bb/ioYmcHf3mm/mNd?=
 =?us-ascii?Q?aVc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sKmv3Tkmn9TbLZSxjSjotlveuaPpTnmVbRMhtnL6yxjo3GmF+2rdAMCmnCxy?=
 =?us-ascii?Q?Uy38NdnSR+Q/AgqQQkTcB/0uasGYFFxsGQ1RaEVIPD1SceFTnWOnUcJlVxgO?=
 =?us-ascii?Q?wPxfvVc3yqUUcxWZQCOaFUPHjSZj0l2H9HE7+0jYw04loaDj3CGOFtXaWeCC?=
 =?us-ascii?Q?cT2vB5ytlvVMgXA2hV07fj9sWA8KOAMFeIUuhBG3465ZJqJN/zcjxQEQqo7z?=
 =?us-ascii?Q?EkTvBIwWZ8HTGrVNDXUKY+vyRrMld4wBWwJ4DG5U6ftSJ2/ln+CVCHrHf4KC?=
 =?us-ascii?Q?/Wpaca0v7nf7qx3yMbEMFcNW2FS6NnWcf6Ou34yh2eSCkniOpt/y3v/ENJmJ?=
 =?us-ascii?Q?9UH3+5b0FgHtrhEL1MZMaHQ2XyZnofnUYr7uww40gGHGVWMHHgqJO+JnBjOI?=
 =?us-ascii?Q?DziIwoFTbRSLnBt2DIyCA85LSc8Nz2gWO92zt7POQm2kNN1OVpMbevmuJQ4E?=
 =?us-ascii?Q?nUi2J7Xj8+hKptdWG833CI0i+6thwcjkRohlkEcpJVgzfK/DOZ23TiFMD7NG?=
 =?us-ascii?Q?fxjSk/NH6aSOzXW/kG9OdInNoNDcWP7P6Z0UA0Ndsrc5yoN5T9E+/m4aGnU8?=
 =?us-ascii?Q?7IRui487ylIRKOdWh38Kx+I2FvzuO4CO+SIrOsJzK+FiEQfnBMc14X8LL3fu?=
 =?us-ascii?Q?qGFCDl4cps3vnpjSbj5Wsc5/REDIl+aunPa/Qu8wjMeCkSE7lDaYBIZCMHWT?=
 =?us-ascii?Q?tvUlOWT/UzaWzQhjmx7icxS8sb9q219LRYwlHVG2RPy4GeWG0VkZVxaYBeqO?=
 =?us-ascii?Q?NE/2SRHHUQn9PKAUegTMQm5BIQsNDlQZQEO3fxwh2rCAmFb/+fy/e+A7AFyl?=
 =?us-ascii?Q?fB9YdXpCKwas6pDKCM9FUZbwMrTRB4Adn2FQ0dXqZLau5hCNr8j3KPz3DKfY?=
 =?us-ascii?Q?FRYooPl0IBpQA992viNJNvD5FaghjiJbIrFNMm6hfc+jHCgFA2KVebCioOTl?=
 =?us-ascii?Q?bLYRMlOKLlvRTICu+30hmAqiQOHlwgnILpzKuYgWvK8illE0Wjpa+2lttjF8?=
 =?us-ascii?Q?wa+1h0ap3laM2DVpbexAwPm19yP5t6woUjyBl31qHNVuZ2oI7S+QM0e8Ri63?=
 =?us-ascii?Q?xugdwb/Mg3nnC9upD6+qrpanVly/3vLNY76AafrybUs0SSSVf1cup9ISg8hp?=
 =?us-ascii?Q?m2QTyPsWJyb+/8jObgiuFcIWqyZFHVuELGkENSJUdvjmyIODyBtNTeU+rPAv?=
 =?us-ascii?Q?wqoNdAyu+x94qj1iX06SjXgDPadBR63VjS59NEFctX84efNyTVk0xBMiBLLM?=
 =?us-ascii?Q?atUdYpM/l7Su1izc0dvd9Fw5rYY2Tlo0KS+VAvDbO7Klh+yNZCva+COaeJQq?=
 =?us-ascii?Q?/rb1o7Vlm5a/aWXB/RGYk2eLFvJcNrqtWut73ofKSlzCang4sJ2Y4TUON32F?=
 =?us-ascii?Q?jlNX5s/pYGwD3mgOg6alN8rvLM9QKf5Ed/O4oS1bYOHidkklUvwG8ItfwbuQ?=
 =?us-ascii?Q?7mz70VcqVSAzvAvfsRoG+UrGXhASaqBaS4uXN5azVq8s/qikoTsSYPITkwGn?=
 =?us-ascii?Q?mlhwltk+9hIVoxzkn87BGdt0KKOfijUNUcf7sEAorJJkV+zzEF4H+Zz43/ae?=
 =?us-ascii?Q?WlrgBkldREml+9xU1eG7b8RwoTHZxdIN1wCOeb95fv26/J4hfj1//416ztXx?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b361f9-f0d7-4191-a42d-08dcc832ca6d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 13:59:25.2517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2Vcoke8kwn1HPWPBF5F3Sc7Z8oGwQHbDzEaplG92wjNmNSOoZluQXs9QYZCmK4sVSJiUeEpdEMSd7gjU9Rdvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7968
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

A quiet week this time.

Thanks,
Rodrigo.

drm-xe-fixes-2024-08-29:
- Invalidate media_gt TLBs (Brost)
- Fix HWMON i1 power setup write command (Karthik)

The following changes since commit 5be63fc19fcaa4c236b307420483578a56986a37:

  Linux 6.11-rc5 (2024-08-25 19:07:11 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-08-29

for you to fetch changes up to 59d237c8a241168c7ae34c48244059b7bafaff38:

  drm/xe/hwmon: Fix WRITE_I1 param from u32 to u16 (2024-08-29 09:44:00 -0400)

----------------------------------------------------------------
- Invalidate media_gt TLBs (Brost)
- Fix HWMON i1 power setup write command (Karthik)

----------------------------------------------------------------
Karthik Poosa (1):
      drm/xe/hwmon: Fix WRITE_I1 param from u32 to u16

Matthew Brost (1):
      drm/xe: Invalidate media_gt TLBs

 drivers/gpu/drm/xe/xe_hwmon.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c    | 37 ++++++++++++++++++++++++-------------
 2 files changed, 25 insertions(+), 14 deletions(-)
