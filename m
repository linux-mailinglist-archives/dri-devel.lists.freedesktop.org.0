Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBC48C156C
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 21:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9581010F151;
	Thu,  9 May 2024 19:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMZmlPkX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6F410F13B;
 Thu,  9 May 2024 19:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715282796; x=1746818796;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=bc0Fw3ct6kNWKBGT/bvBh2mYwPQ58qrffGOl5Wk7vlY=;
 b=IMZmlPkXRYQYmVhfHP8I2reeJVe7VUytLYzEmg6R8rhbHSqGZcWH8nc7
 prinEeJXuSsjzym4N6tWVem6NHXNH1KPFUS3xFZ6uVfdIxx8qdpdKprGl
 ImPe/JZqyCL/mk0yU+3gmIUrt4DF1eRJrm+7b7QfbZImo81G5MFZxVtjh
 Oh/3QeO3r0Vj6+4F3I/28sfMEywmsXDj+RPwdTdPqOvlaEzviYLt8v9nQ
 oaIRvAezvlcsXZ7ypAqxj0Sr6uFIkIdknoz51BlqdUkW/BTBE3sSu4oYj
 4sCPcGTT8oOW0DyaCAQ0y9jwNts5+CoXshv2YGKLZOpoESCjUr6CQBowS Q==;
X-CSE-ConnectionGUID: KvsZrMESSZiFKrrq0uk2dw==
X-CSE-MsgGUID: a0qywTz6S/mL/IWdHYv8Yg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22628218"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="22628218"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:26:36 -0700
X-CSE-ConnectionGUID: QmmZmqLvQgmP+icoykfx5Q==
X-CSE-MsgGUID: Nh+q0LztRhqeYv56pGB+3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="29299248"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 12:26:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:26:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:26:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 12:26:34 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 12:26:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbTEJthaE+EtFqGCBjmgi/cWMXFZaNr4pzMxHv68wxPupEgDLSF0boZXcFzJqCiuKzpZoCqGFS6QDK4MxOmlby8V+1pqwsErcAgm6T+u927KWi+f56NQUp8mf8Jnn4yGtDiNnpsDNwU9gughFF/ILqqKJ54ZkNNjovcfoMWIdFjxDpHWJVcqSq2QQK9WW0zkD+UAapwPTPyjic2E47W+VXwO6yS/JOHNqWOnwjAlspytaz6yyr9fxXPM8yrm80HhYck7Dj0NKKW+BO2SAeZNt9uG8P33KwPj5klmOJ/1NgS4i3ujvs/G7sDjUC0OeznJAqs9j9ivXRThHKNfpaQdzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fx2gbPPwt9caffj2X4+m0QQZ18DLtPimrA/oSsOR9ew=;
 b=jmuE1U5vY2mBzgkzXo+0V1b28HeGD33WV2/V8vN8kw6leu+ovt9Wwc4pVN+BFChgBx5T2lpXQencvqnl3wtXOjap3SzRokWgvozTmmz4kKpOHWVuWKreqQ18bWVWr7OyjFsfQf6S8n5z9pDcg7TQcxI/OWNhMll58SiXG0qOVZ61qcZ8acUh/mxsVoB3PwjWw8+vWusvzqb5Z3WGZy3RQJES8oCUfsLOcOmbPClZRvRtL4MJB5Ns9+kvDYJCHjgZ59ulUYkCgVR2HOurkjH+dA4BkpjOyZkgTVuB5IaNLTSxgHpBOsousUyU3cjeJ9vu3fPYemXtaAFx0uFI5PsLxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB6099.namprd11.prod.outlook.com (2603:10b6:208:3d5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Thu, 9 May
 2024 19:26:30 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 19:26:30 +0000
Date: Thu, 9 May 2024 14:26:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Message-ID: <c3rduifdp5wipkljdpuq4x6uowkc2uyzgdoft4txvp6mgvzjaj@7zw7c6uw4wrf>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: MW4PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:303:dc::27) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ab6832d-b7fd-40c1-ad9d-08dc705deda8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|7416005|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XAMEc6wNXHWeZbXftoRWSooAdN7p6SByuSFlBU+dRETYRrYKdpgCBxihtIEY?=
 =?us-ascii?Q?dkc+8cFBRPYbP4wKBH7wuaF7Cjb9G841DWPxt4AllukXrQM8D0z4DRImo7kI?=
 =?us-ascii?Q?hIqQjKAp7LvjyxY2L2LDiFixku6PUe01/xmztLZGL8IAp+ufpVHyoWh6r0py?=
 =?us-ascii?Q?ed/BevFc+9lf9akFuSaKt6VVc83rKxoFpsRyevAazQEuz4rzH9rOYqZFx+MD?=
 =?us-ascii?Q?QSaJGY+Y2OMqcYj6fft4q6rQGOCbgAx9RY9skVMmPuW21SzUBEPMxCI3x3HH?=
 =?us-ascii?Q?dukKRnKSh5TqDiJKlIZ7jdklBmhYWUiAj1ZeVXKhuUUVuVDXZrlJ+8ut/e15?=
 =?us-ascii?Q?USzlZjVPoPRDhuIGNGtH7twlPq6xVCOdukixy7htioInTTWXYK08WtVaKpnm?=
 =?us-ascii?Q?adEjER+GOXwHZlrI9ewTLOCzIq4U8NM5WgD4YOYUA9rFQ65Tf4Nc3Q+fCgAs?=
 =?us-ascii?Q?bJ1lDKSpGDNloz2muP59I6aIu+0lb73/Lxxq/HVMjMcuCQPEotlQjGo3/q3F?=
 =?us-ascii?Q?IYJO/m+GTMPC1k2BOFDqJKk9K1yIDTrpwNrFs7J7F2Ms8h2djHMeDs8JO2VA?=
 =?us-ascii?Q?nXU/6ZBeKOgCeXImKe/jHbdCIOZtTD/x7WYLvw+MLftuBdsCvDVAoYELHEgA?=
 =?us-ascii?Q?G1utb1W5y6u1LzwcBREF8CqX04tqr3VHe0wBe6QtbeBnuccQ6L6pHNhZj579?=
 =?us-ascii?Q?Oa6dggcBJfsJ8+MakYy1zlFlqYaG5+T5x8jeHEHwqs9QMrnhMdLA9SYB7vRf?=
 =?us-ascii?Q?y4LXxTaH0wBe4KnN6pkalMf52JAkM58kRWX1pD+pi2ApS0neavKxmAqvGuBZ?=
 =?us-ascii?Q?SoC/FDDWSkH0t8SGgyKUjRt00YCDlaHw/1u1zLP5L21yjZh5dXUFadL2N2bM?=
 =?us-ascii?Q?7csV8lr7HWGxQhfJ5k9c2PE7fVq1X1x5I4O2TQ6UbZgGOLj+xnT75TBjE6Hu?=
 =?us-ascii?Q?eiCxkb9q6K8Oh9SLPHOLyq2l4O2V71EmGB47c2nF2rhtCZ006IOuNk4XhzYc?=
 =?us-ascii?Q?JqdafG9QSzr29XwDj8Dv7cA2OdOP1S9G11bQWGFjTrKymI6zj+aSVP/uVXIL?=
 =?us-ascii?Q?NWm0cwlXJ0kPtyu+Yr9UrWae2Vd7dmOeHR9dP8u8ZnJTVDHr1kxiexJgnhJO?=
 =?us-ascii?Q?fBsj3zTHdu+VHm4MdNNRC+6sgBIFUSWh046NeH62pDKMu0wiXejGw4lRdP29?=
 =?us-ascii?Q?MPtpSrSA2/T7yQfYFeBV1LqttSNS0FFx4f0QeQeE1DM4pa1FiRTW1SAbRFg?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(7416005)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WMm/7a8/FYQZ3LlUYWaM8oTfjiX0bwYM3ZQNX8US5ep2LJIpzvR73LBHzNiz?=
 =?us-ascii?Q?DKepU6l9OsApbbepucXGp+/Oo3wZsN4qxavp15IDt5zaADg9QTx+yMYelqHD?=
 =?us-ascii?Q?57uJ1t2mJapCyym4Q1G+qknLwc8O3DPyWQUamd1x94Ir6DP0JooYk/VecjS5?=
 =?us-ascii?Q?WHjae3YRES+t3HNBXlzeKErPaNGHxAqA0ECU4rvIN2Y33IBIHFX6baS7VN/B?=
 =?us-ascii?Q?6qh8V8Nq+11X6u9vJp0EXB8c60use+FI2EQ7Gl/hHSOt4d+hRgXcSHyUPILy?=
 =?us-ascii?Q?ExvSArV+R9GNzlCnugLfRTOPC8vdPfKm+qgvL95pgpln8PoUlbiRNqzu5lNY?=
 =?us-ascii?Q?oi0HylSxLsoZGzRKiDPCRlJnX5W928UNbE2v/+APlY6IiIp6YcrhuV7FZNvb?=
 =?us-ascii?Q?7r3J6fRilwZi+prFVfcd5t8/YpjG3RRBp/7VU7yL22RNkND0D3Lx4AL1wVF2?=
 =?us-ascii?Q?VontexvqLBxw6qHTv0fVwYKKUsBwhqp9kYJ4rLineCHtgJsLqRGJ5Dhjozfb?=
 =?us-ascii?Q?FC7OMBrTVTNVSJk/0xrRPdQdIhM9jTM3gOrnIfPr8LcuUU/O7iYn1L0+xq/s?=
 =?us-ascii?Q?lJbNOzbMZ8tlUofhpEruZxfZf0mDMHC3mPZ4gtFpuHX/UXjH+GMW6RJ1v33P?=
 =?us-ascii?Q?WEr4Enu+8MwKx1juURiFmNlJ+P/tK/vIY5A5CrQ9sCEvD+WQGm3TvjIzU6Nw?=
 =?us-ascii?Q?1oLAxzCeS5H6M8YmcNxoHVpCC+4LbUByTlBGWOYdpiIPwYV9KBlXMm8R0yD8?=
 =?us-ascii?Q?l3tlxcXDxYlmXkE0wtzFerCp0+MAp3mNJebB34ri3I0zwMf/z0QZ6MryoEui?=
 =?us-ascii?Q?nZFp+7Zyg7tTswWMOfRdV1ugWriEATfGNWj+LiC2hf02U2f3JpdSbG0ijw9e?=
 =?us-ascii?Q?mGnBv9g2nbo42mIdw3/Gec12oYWSVXNrY3gRuZ2BHluOHktRk2wY/w6XYj0D?=
 =?us-ascii?Q?S8YrksmLzAduPFKTfeQkqzr59H5VwBe7J+MFIoz4Vlik1MahTUlzW1o8K2Oy?=
 =?us-ascii?Q?UCF+kqccOxyDj5QXEiBGBa7TQ/D6BHkUzjauga5uTn/e6qPVzFM0QwT88JnU?=
 =?us-ascii?Q?LCpOWDB2N9IhC0MuSNtjB84q2mvZp2CBOBncQSrgVJGTOtunQr+H/pXEFHFq?=
 =?us-ascii?Q?Xps4NaidAwAXDeK9s7exeiSiLuNeOC8rjYMWF8gDnnDtRHhZQK1dTqQt4vjq?=
 =?us-ascii?Q?+jn4haSSFQHGt2MKw0oYldiSp5pc6hKUNmmA0V6VfXPMfI58961G9PwahbCN?=
 =?us-ascii?Q?jcnmGKSuu7yDh6R69fzxbRezpQJmfou9e30pYsvFbcyT6Lt/DUQwWPbYKJ5e?=
 =?us-ascii?Q?c2ja56LMtsZSZh/q/PplCg2RGvQvCT8JvKpv9YqxLUtOD0qzZgaGMBt5XO2N?=
 =?us-ascii?Q?0CNwDfL+qXg0fsufwbMdwN8Rm71/4jCYQd43V1fkTMOnfWwEUPBw+fvWpF3z?=
 =?us-ascii?Q?7unfrdiTUSshCtvPn41uup3P3L337e0aC8wATpiPfVYo6+VZbc9jH+13bScR?=
 =?us-ascii?Q?Qv8JqPfJ3C97dxFJ6dHD0JXTmxsgGwfdGZNfsnTqTlcNRDyf+5oaMcpNs+cV?=
 =?us-ascii?Q?y14tVLjYxXT+p/I+k3oyUQEiqXtWsSRrNHQF7UWjE/dBifNLzZgYzZM8sDbd?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab6832d-b7fd-40c1-ad9d-08dc705deda8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 19:26:30.3206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99tiTGaVgYqZkaks18wyDPkWDGFneS03qMa+hukxlp9SmR8ir3H4KBZ4TSVTbp9C+8o6On2mEQxEw7esA9AlWEHP+UzZmUB6zA3h/cXWPig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6099
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

Please pull the drm-xe-fixes for this week targeting v6.9.

thanks
Lucas De Marchi

drm-xe-fixes-2024-05-09:
- Fix use zero-length element array
- Move more from system wq to ordered private wq
- Do not ignore return for drmm_mutex_init
The following changes since commit dd5a440a31fae6e459c0d6271dddd62825505361:

   Linux 6.9-rc7 (2024-05-05 14:06:01 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-05-09

for you to fetch changes up to c002bfe644a29ba600c571f2abba13a155a12dcd:

   drm/xe: Use ordered WQ for G2H handler (2024-05-09 09:41:27 -0500)

----------------------------------------------------------------
- Fix use zero-length element array
- Move more from system wq to ordered private wq
- Do not ignore return for drmm_mutex_init

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
       drm/xe/guc: Check error code when initializing the CT mutex

Lucas De Marchi (1):
       drm/xe/ads: Use flexible-array

Matthew Brost (1):
       drm/xe: Use ordered WQ for G2H handler

  drivers/gpu/drm/xe/xe_guc_ads.c      |  2 +-
  drivers/gpu/drm/xe/xe_guc_ct.c       | 10 +++++++++-
  drivers/gpu/drm/xe/xe_guc_ct.h       |  2 +-
  drivers/gpu/drm/xe/xe_guc_ct_types.h |  2 ++
  4 files changed, 13 insertions(+), 3 deletions(-)
