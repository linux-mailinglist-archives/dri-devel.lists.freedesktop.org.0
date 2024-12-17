Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C9A9F3FA7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 02:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B902510E81A;
	Tue, 17 Dec 2024 01:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3uyg97P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D30510E62D;
 Tue, 17 Dec 2024 01:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734397482; x=1765933482;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1KJba5mrcLt22fJVYncSArk7Jnu+WtlrSh2bqNWLLpE=;
 b=R3uyg97PsuXw+38EuN2zNPM5ysze8LMJIRRcKU29KOAL09uS6SkGnkt2
 KZVSJq9uPoHJYiMaQLG6d5U0mip9aCrRe+p5jXn0bkOB7+wlgLoYpMrtL
 L19EE+z3+vPGcTKrivDkf/xp6dyrCCW7S2ds2Ayy9i5XVpjK1VC7ulwhQ
 WFJqEJ47m5PaLTLaldFAkEmv9HvEZpjJMW5o4H6yZWsgemozG3fAQsE2x
 XUxnnEMZWMO3gwp26kMve6lPPh8yoN/ed3hcZ3P90pFjWlW3Xwn/Y1y94
 whrTBoN+ux5OtjpE+0U9l6RLQuyor8cjgUEk2BMpapdTVr6lB//s9ITpc Q==;
X-CSE-ConnectionGUID: cg8PVmdQTWevCBVgSHnTIw==
X-CSE-MsgGUID: gGe+nlN3QHaL/XrLZcYNEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="57287484"
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; d="scan'208";a="57287484"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 17:04:41 -0800
X-CSE-ConnectionGUID: CKKlNyE3RcyK0Tp8kNmHTA==
X-CSE-MsgGUID: pSyjuHoSTjqfged3w3Ov9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; d="scan'208";a="102229533"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 17:04:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 17:04:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 17:04:40 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 17:04:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qD0MXrCK3m75TIruQs2yTQRd7vbehHvLy/04S4ihe5c0yvFaEcbd8OgYQnxMm+yM7JfVpCjIvfg0dvlcWSVGJImCLN9vAGniAkGkPjoHygYLeaRhLsdqz0lAOjrwJXdblaYUUNdl71AR4wgCtGypV4r6pbXhBD96SHuuI/OEjXERLLaaE8py0O8GQCKmNPmT3y4M5Zc1cC4co5vHR+U/6xnTUv4x67jxNAW7PDFfp8sHkyyLHR4DZzgP5jbe20G9Nm5QdcIP3nQaXOJrTERoNH58XHjt+QuUHjomi3TcQHDWDaOq5n6onWRWXbq4fWHDNysI1MkuYSybFkeCDTYIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyzi+Dgg1kVmKTh+Zr8Faoe9Ueilg3PhbruaxHDG8nA=;
 b=pvvdEaYbJzLplBibnf4RSciXKddaCVBqfqlmssHlL87AWlPhG02dhRx1stUWsZOjoYe3CI59YdGzd3ttmH4w8QpCyYfdWBdww/qJTKz7Hcv7bXYOEgSgAxXs2GA3gK2KDjAB21o6khy2KHUiTeIoNpP1/+0wBqSBUk103IWAPN3iNQHuSn6X3/l25SDzIyyPNl4edN5VDu96ZF0hQKWPevJfyIzo4EEVvgq0e1tB+17AH2GRApUenhSH2i9iV+eD7KaH1QNfAU8xV9/bzwwGbJPWQnhkT3PT4x1NpV6VxLyXogf0TFtzRNXXm225GOht0eEg+C5R5tzDhcuuF7lP0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7664.namprd11.prod.outlook.com (2603:10b6:510:26a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 01:04:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 01:04:37 +0000
Date: Mon, 16 Dec 2024 17:05:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 26/29] drm/xe: Add SVM debug
Message-ID: <Z2DOUDyzRJp0ICni@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-27-matthew.brost@intel.com>
 <db162f5ef89b9d48c9fe300918120a4537b7b0d1.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db162f5ef89b9d48c9fe300918120a4537b7b0d1.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0249.namprd03.prod.outlook.com
 (2603:10b6:303:b4::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d32238-9c5e-4f2d-f4c5-08dd1e36c735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PaAi6MZgXqngu7HkngLjTvd93Qi9VgWzv/LtMQd5iRyZm02HvhNqBrxKpr?=
 =?iso-8859-1?Q?xDStlpVtLCmkkjQ0Pi4nEx/VpjFllUxJukRLoiCGyJ+T7Tyy34vnApRv1g?=
 =?iso-8859-1?Q?OyNGvF3Qt1EzlnyUcvLCyUSUD6dly8e/XYJ1RDUVvcrbMhk67bx/v3JGoy?=
 =?iso-8859-1?Q?So0/oIiclIaCrWsCUncVMLL1zTQ6QkuLT89MY29pIhqFQPVDfhINVtRH/k?=
 =?iso-8859-1?Q?3i7ZnDW3Bz2L9sxZxOhPYeAGhZAnr55qBhgfIPNgL4pcGqthRhwn6djIZx?=
 =?iso-8859-1?Q?IP6eabxSgLuV703N/recCTWyCRliuQ8jCdWNlqB0bN1O3wuVlrS6IL5/PA?=
 =?iso-8859-1?Q?p30n1UXl/BuOd0FnjvyIh7PqUmlLl6CNREMx0zhPhspLb8O/UPyMlN1Y+j?=
 =?iso-8859-1?Q?LoiLdv+pCqsE5VnrRt/crL05zxlOOwKWyTV+ktAcPYUGhiemP0vczsYLD9?=
 =?iso-8859-1?Q?8l2OLIP7J7yGNT+HnmbOKkr/iavvX1RQ2p2kYXLPvurfyn/ctHrAB6aziw?=
 =?iso-8859-1?Q?+nG3efru6i3ViYDOW3T6j2hmM4AOMyP0vMlJ6GmHDZdywx9aQ/4vr6Dx1F?=
 =?iso-8859-1?Q?/V8a+o0eZNAoOqaf2XfwM46RlCpj6pyG7PYqfKA8ImUHoJIxmxUpqpFTA5?=
 =?iso-8859-1?Q?/Zg608DwZqOnAmAubQB7pHIuD9VHtNU95dWwrwOgbz6JTgPURTn0XTvx3X?=
 =?iso-8859-1?Q?2Jqi4xj/YUZkyFLAM6ZHxleV5oCv3IDIIdTjPQDvatfan8SCUADLrXclsy?=
 =?iso-8859-1?Q?sB8n1J2/BrZhU2qInXk3fXsTvkU6CG3wicY9DAaziktxFdRYZP7I5BLybX?=
 =?iso-8859-1?Q?zgFUhmIACagzzBssWl0RGuapCL6HV1jSD7hi4sgBvB3eg5W6cMbSa10SQp?=
 =?iso-8859-1?Q?a1/TTxIWxPjaEysD+dOoQx1BXcfHOg180K0sSoLeht6w8jVuKS94MYh0SP?=
 =?iso-8859-1?Q?dKP9kJ2neCThvQ8lng2kMQr42SHokejC7yXqP/jx8XXD++UcPIUbeICY4h?=
 =?iso-8859-1?Q?uMZEbGdccDNzPsc+e0Z/c6SZ72S+cfsdJvZa/D8IM1pdypSFWVol+Yn9Lx?=
 =?iso-8859-1?Q?ub/WE1QSQKo2Qrk1p6tmp2sC/ISPn8VI1HbTcnjhkAHkJ/k42sIZXvL0Gc?=
 =?iso-8859-1?Q?KK1gAIRo1Ntpga4SrrqgF50mN2tzVCW1ev2NaIr2lYJIYapBzgL/p2/QWS?=
 =?iso-8859-1?Q?MNCCIo95sPgncmUuPIBcT7sCRhgWYOFLVqjobBXiFtj3JCymUnfAHdpMnD?=
 =?iso-8859-1?Q?cIpIRl1MkDWbIHmHtebdzny31GgGEXJoGzr/BxHFO/lC5JQn4P2g/o0GbG?=
 =?iso-8859-1?Q?QOLZDiCznkW+gmt1rsdJyh+nbn5rtaj4A1NkU1ZMpLlq6Rbuak3C22YEGF?=
 =?iso-8859-1?Q?p45Fp54G5jDpvfOv8Xjbm610xyERooWhf9F97uVSBZYXmq5sHyNMZYemSI?=
 =?iso-8859-1?Q?QDRoRk7ETSZTCsc5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KK5ZOvibgi/gTb/oT1Vshas9/C9MdxFkdMz9Ongfre0+5i0g/Dpcrmfjpm?=
 =?iso-8859-1?Q?xWL3pDbgUfQwcjhvaMUrq+Wn8LXwn7dnFEX+AdYLIjJqwyl1WSznVggkYS?=
 =?iso-8859-1?Q?7Nl4T54+WpKYcoBMf1pHp5L/VZEQX6cdldvnOxX7l2392c7Gl8DUfrn2mx?=
 =?iso-8859-1?Q?JB2EV51MAJL/Po1sS6rxIZf/8pAmFoI2Ia0WXdM/S5ZSO1mIHoC0mCFUQd?=
 =?iso-8859-1?Q?Bc//Ef8W33W+8IbkSWAygdEeCxBx2EQx4JFd2iO9PFPd0VTjWtFgPIPkQ/?=
 =?iso-8859-1?Q?s8BWaULRRb2bqmJZEIDmL8rJI5NktSsmkiV+nNztAYfHDgDSZCAqQc7NAa?=
 =?iso-8859-1?Q?LuKo8nrCPhFP2fVpgqNR6VyGM+3KI7vwCvRZRSlhG6V1jh4Bn2OPHasgB5?=
 =?iso-8859-1?Q?JmAfTvx9PZJrUmN3o8Le5L7CJzx5e6ooWBKNw60dtzImLiOafpZ/+rRjwc?=
 =?iso-8859-1?Q?qjxAGgkZUe+R9DpUV6Rzi+/j4u+j5mECZ0LbvQc9yEHaJX62mOj4tEOHMQ?=
 =?iso-8859-1?Q?nzr5XfFkaPkSsA9A0hTNZHvQTRVJpJM7kGo3J/Em+Hp76rCtuWNLkP8MAX?=
 =?iso-8859-1?Q?UAhj7nhe4ePsVBtfXSXmggmgPkBR6c4eg785R3sh0CKd1tPSXmV6w1w4pP?=
 =?iso-8859-1?Q?R8PD2c4EtHfQYRywwh4mjduc9p82vwWyG+YhXfSYYmR//TKRr1Aox74C0C?=
 =?iso-8859-1?Q?EctvzUa4l+ggI5//c7bZggFLLyDALuq5Umo23eXPxwoNWe8hehRskQEdHt?=
 =?iso-8859-1?Q?GucGudWFRjpap0ML4q0LRcpfhVDvtqfjctJDSY0vzFXfHdv11I6a+2b+y2?=
 =?iso-8859-1?Q?PrVj/Z3mVPh0Zj6WSm5TUyCX326kxPjUG1qSO5Fm3mkKIUpSE2Ew6qwLqF?=
 =?iso-8859-1?Q?Rygi7vka1jDjOfpSsalvwYeHww9wjRHMB+A5kZ+wL+p7clylk1YZ4GiQ5E?=
 =?iso-8859-1?Q?fBRB5CyVuAsNrrnlvxSVhCGOqLAlCpMOP/JLOelDqWoGOkMWcf1rZh7kSk?=
 =?iso-8859-1?Q?Mh2LgkJRyeJLlds5l2BeWnhKY2knCgMPRaFXcUu3MwEMeFLsnxT2Hz5/vk?=
 =?iso-8859-1?Q?oJheYT4SBrlxaxgtRV8rt+BzcHwzJ+kFs7eOo8CSb00ymUcpMD4uS6MFHt?=
 =?iso-8859-1?Q?tWSfoeiMVzSgSWSgkflCdVvSlctfb7/dFBE6O+j746aVHdxNCGCiDwyE8Z?=
 =?iso-8859-1?Q?OQTM6bCrRKS4zZy/tBU3axsCbpuofkJqANDLQ1WwIG1mTsavuv1Y0vBFhR?=
 =?iso-8859-1?Q?uTDL7Yzx5PcjmHSa1Mnj+xs0jLBnmIXmdttLr9P5ewFdnP1da1WRPLUDun?=
 =?iso-8859-1?Q?6BVybYxW0b/Nq69UTBMp0NTGbWHvTH7rpzBWD71C3papZw5kSed/j0ihf0?=
 =?iso-8859-1?Q?DUg859tzsKF+8t79quZHcjt04euWRFuRSMUBk1fRv4XWVqtk448KyqEMdq?=
 =?iso-8859-1?Q?7SjlNuSpaeEoLXzb5cSxR51P3Ti6GP5hxdzdJVcDcKmoWhZg13hpZjvBmP?=
 =?iso-8859-1?Q?pCdhcSbxK6TbhhtV3IgZp6YitZ6JBX4kuzhKJFsp7sRwP093AparaFgs7f?=
 =?iso-8859-1?Q?Cd0h205jpLa+gZ1wtkXxFJbxCVO07Ylm6AFPQ4TQF5M5VJHTZS+Mm56Y2y?=
 =?iso-8859-1?Q?Enydf0VRael8zWQmTmwa+BRTWYzJdstc26OD8YNE3rUkMTdikBXXjJhQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d32238-9c5e-4f2d-f4c5-08dd1e36c735
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 01:04:37.7086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6OfS+ulFeWgZ8E0qIsHE6OJIdrNXsNtWiPGnVOozXeqoca68Nj/8mpB7EZNiUSpfAfU/iVfMv31km8s5PYFYqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7664
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

On Mon, Dec 02, 2024 at 01:33:29PM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> > Add some useful SVM debug logging.
> > 
> > v2:
> >  - Upadte logging with latest structure layout
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c  |   8 +++
> >  drivers/gpu/drm/xe/xe_svm.c | 101 +++++++++++++++++++++++++++++++---
> > --
> >  drivers/gpu/drm/xe/xe_svm.h |   2 +
> >  3 files changed, 99 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 687abd1a5e74..75f548ebe2b3 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -632,6 +632,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> > xe_vma *vma,
> >  		/* Move this entire thing to xe_svm.c? */
> >  		xe_svm_notifier_lock(xe_vma_vm(vma));
> >  		if (!xe_svm_range_pages_valid(range)) {
> > +			xe_svm_range_debug(range, "BIND PREPARE -
> > RETRY");
> >  			xe_svm_notifier_unlock(xe_vma_vm(vma));
> >  			return -EAGAIN;
> >  		}
> > @@ -640,6 +641,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> > xe_vma *vma,
> >  					 range->base.va.end - range-
> > >base.va.start,
> >  					 &curs);
> >  			is_devmem = xe_res_is_vram(&curs);
> > +			if (is_devmem)
> > +				xe_svm_range_debug(range, "BIND
> > PREPARE - DMA VRAM");
> > +			else
> > +				xe_svm_range_debug(range, "BIND
> > PREPARE - DMA");
> >  		} else {
> >  			xe_assert(xe, false);
> >  		}
> > @@ -1397,10 +1402,13 @@ static int xe_pt_svm_pre_commit(struct
> > xe_migrate_pt_update *pt_update)
> >  		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
> >  			continue;
> >  
> > +		xe_svm_range_debug(range, "PRE-COMMIT");
> > +
> >  		xe_assert(vm->xe, xe_vma_is_system_allocator(op-
> > >map_range.vma));
> >  		xe_assert(vm->xe, op->subop ==
> > XE_VMA_SUBOP_MAP_RANGE);
> >  
> >  		if (!xe_svm_range_pages_valid(range)) {
> > +			xe_svm_range_debug(range, "PRE-COMMIT -
> > RETRY");
> >  			xe_svm_notifier_unlock(vm);
> >  			return -EAGAIN;
> >  		}
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 555bc71ae523..acf2a3750f38 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -14,6 +14,18 @@
> >  #include "xe_vm.h"
> >  #include "xe_vm_types.h"
> >  
> > +static bool xe_svm_range_in_vram(struct xe_svm_range *range)
> > +{
> > +	/* Not reliable without notifier lock */
> 
> lockdep assert?
> 

Ah, no. We call this from the debug code which doesn't have this lock so
it is best effort there. This comment is saying don't call this and
expect it to be reliable without this lock.

> > +	return range->base.flags.has_devmem_pages;
> > +}
> > +
> > +static bool xe_svm_range_has_vram_binding(struct xe_svm_range
> > *range)
> > +{
> > +	/* Not reliable without notifier lock */
> 
> lockdep assert?
> 

Same here.

> > +	return xe_svm_range_in_vram(range) && range->tile_present;
> > +}
> > +
> >  static struct xe_vm *gpusvm_to_vm(struct drm_gpusvm *gpusvm)
> >  {
> >  	return container_of(gpusvm, struct xe_vm, svm.gpusvm);
> > @@ -24,6 +36,23 @@ static struct xe_vm *range_to_vm(struct
> > drm_gpusvm_range *r)
> >  	return gpusvm_to_vm(r->gpusvm);
> >  }
> >  
> > +#define range_debug(r__,
> > operaton__)					\
> > +	vm_dbg(&range_to_vm(&(r__)->base)->xe-
> > >drm,			\
> > +	       "%s: asid=%u, gpusvm=0x%016llx, vram=%d,%d,
> > seqno=%lu, " \
> > +	       "start=0x%014llx, end=0x%014llx,
> > size=%llu",		\
> > +	       (operaton__), range_to_vm(&(r__)->base)-
> > >usm.asid,	\
> > +	       (u64)(r__)-
> > >base.gpusvm,					\
> > +	       xe_svm_range_in_vram((r__)) ? 1 :
> > 0,			\
> > +	       xe_svm_range_has_vram_binding((r__)) ? 1 :
> > 0,		\
> > +	       (r__)-
> > >base.notifier_seq,				\
> > +	       (r__)->base.va.start, (r__)-
> > >base.va.end,		\
> > +	       (r__)->base.va.end - (r__)->base.va.start)
> > +
> > +void xe_svm_range_debug(struct xe_svm_range *range, const char
> > *operation)
> > +{
> > +	range_debug(range, operation);
> > +}
> > +
> >  static void *xe_svm_devm_owner(struct xe_device *xe)
> >  {
> >  	return xe;
> > @@ -61,6 +90,8 @@ xe_svm_garbage_collector_add_range(struct xe_vm
> > *vm, struct xe_svm_range *range,
> >  {
> >  	struct xe_device *xe = vm->xe;
> >  
> > +	range_debug(range, "GARBAGE COLLECTOR ADD");
> > +
> >  	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
> >  
> >  	spin_lock(&vm->svm.garbage_collector.lock);
> > @@ -84,10 +115,14 @@ xe_svm_range_notifier_event_begin(struct xe_vm
> > *vm, struct drm_gpusvm_range *r,
> >  	u8 tile_mask = 0;
> >  	u8 id;
> >  
> > +	range_debug(range, "NOTIFIER");
> > +
> >  	/* Skip if already unmapped or if no binding exist */
> >  	if (range->base.flags.unmapped || !range->tile_present)
> >  		return 0;
> >  
> > +	range_debug(range, "NOTIFIER - EXECUTE");
> > +
> >  	/* Adjust invalidation to range boundaries */
> >  	if (range->base.va.start < mmu_range->start)
> >  		*adj_start = range->base.va.start;
> > @@ -139,6 +174,11 @@ static void xe_svm_invalidate(struct drm_gpusvm
> > *gpusvm,
> >  	if (xe_vm_is_closed(vm))
> >  		return;
> >  
> > +	vm_dbg(&gpusvm_to_vm(gpusvm)->xe->drm,
> > +	       "INVALIDATE: asid=%u, gpusvm=0x%016llx, seqno=%lu,
> > start=0x%016lx, end=0x%016lx, event=%d",
> > +	       vm->usm.asid, (u64)gpusvm, notifier-
> > >notifier.invalidate_seq,
> > +	       mmu_range->start, mmu_range->end, mmu_range->event);
> > +
> >  	/* Adjust invalidation to notifier boundaries */
> >  	if (adj_start < notifier->interval.start)
> >  		adj_start = notifier->interval.start;
> > @@ -218,8 +258,12 @@ static int __xe_svm_garbage_collector(struct
> > xe_vm *vm,
> >  {
> >  	struct dma_fence *fence;
> >  
> > -	if (IS_DGFX(vm->xe) && range->base.flags.partial_unmap)
> > +	range_debug(range, "GARBAGE COLLECTOR");
> > +
> > +	if (IS_DGFX(vm->xe) && range->base.flags.partial_unmap) {
> > +		range_debug(range, "GARBAGE COLLECTOT - EVICT");
> Typo COLLECTOT
> 

Will fix.

Matt

> With those fixed,
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> 
> 
> 
> >  		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range-
> > >base);
> > +	}
> >  
> >  	xe_vm_lock(vm, false);
> >  	fence = xe_vm_range_unbind(vm, range);
> > @@ -350,16 +394,23 @@ static int xe_svm_copy(struct page **pages,
> > dma_addr_t *dma_addr,
> >  			int incr = (match && last) ? 1 : 0;
> >  
> >  			if (vram_addr != VRAM_ADDR_INVALID) {
> > -				if (sram)
> > +				if (sram) {
> > +					vm_dbg(&tile->xe->drm,
> > +					       "COPY TO SRAM -
> > 0x%016llx -> 0x%016llx, NPAGES=%ld",
> > +					       vram_addr,
> > dma_addr[pos], i - pos + incr);
> >  					__fence =
> > xe_migrate_from_vram(tile->migrate,
> >  								    
> >    i - pos + incr,
> >  								    
> >    vram_addr,
> >  								    
> >    dma_addr + pos);
> > -				else
> > +				} else {
> > +					vm_dbg(&tile->xe->drm,
> > +					       "COPY TO VRAM -
> > 0x%016llx -> 0x%016llx, NPAGES=%ld",
> > +					       dma_addr[pos],
> > vram_addr, i - pos + incr);
> >  					__fence =
> > xe_migrate_to_vram(tile->migrate,
> >  								    
> > i - pos + incr,
> >  								    
> > dma_addr + pos,
> >  								    
> > vram_addr);
> > +				}
> >  				if (IS_ERR(__fence)) {
> >  					err = PTR_ERR(__fence);
> >  					goto err_out;
> > @@ -377,14 +428,21 @@ static int xe_svm_copy(struct page **pages,
> > dma_addr_t *dma_addr,
> >  			}
> >  
> >  			if (!match && last && dma_addr[i] && spage)
> > {
> > -				if (sram)
> > +				if (sram) {
> > +					vm_dbg(&tile->xe->drm,
> > +					       "COPY TO SRAM -
> > 0x%016llx -> 0x%016llx, NPAGES=%d",
> > +					       vram_addr,
> > dma_addr[pos], 1);
> >  					__fence =
> > xe_migrate_from_vram(tile->migrate, 1,
> >  								    
> >    vram_addr,
> >  								    
> >    dma_addr + pos);
> > -				else
> > +				} else {
> > +					vm_dbg(&tile->xe->drm,
> > +					       "COPY TO VRAM -
> > 0x%016llx -> 0x%016llx, NPAGES=%d",
> > +					       dma_addr[pos],
> > vram_addr, 1);
> >  					__fence =
> > xe_migrate_to_vram(tile->migrate, 1,
> >  								    
> > dma_addr + pos,
> >  								    
> > vram_addr);
> > +				}
> >  				if (IS_ERR(__fence)) {
> >  					err = PTR_ERR(__fence);
> >  					goto err_out;
> > @@ -554,12 +612,14 @@ static struct xe_bo *xe_svm_alloc_vram(struct
> > xe_vm *vm, struct xe_tile *tile,
> >  				       const struct drm_gpusvm_ctx
> > *ctx)
> >  {
> >  	struct xe_mem_region *mr = tile_to_mr(tile);
> > +	struct drm_buddy *buddy = tile_to_buddy(tile);
> >  	struct drm_buddy_block *block;
> >  	struct list_head *blocks;
> >  	struct xe_bo *bo;
> >  	ktime_t end = 0;
> >  	int err;
> >  
> > +	range_debug(range, "ALLOCATE VRAM");
> >  retry:
> >  	xe_vm_lock(vm, false);
> >  	bo = xe_bo_create(tile_to_xe(tile), tile, vm, range-
> > >base.va.end -
> > @@ -582,8 +642,13 @@ static struct xe_bo *xe_svm_alloc_vram(struct
> > xe_vm *vm, struct xe_tile *tile,
> >  			       range->base.va.start);
> >  
> >  	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
> > >blocks;
> > -	list_for_each_entry(block, blocks, link)
> > +	list_for_each_entry(block, blocks, link) {
> > +		vm_dbg(&vm->xe->drm, "ALLOC VRAM: asid=%u,
> > gpusvm=0x%016llx, pfn=%llu, npages=%llu",
> > +		       vm->usm.asid, (u64)&vm->svm.gpusvm,
> > +		       block_offset_to_pfn(mr,
> > drm_buddy_block_offset(block)),
> > +		       drm_buddy_block_size(buddy, block) >>
> > PAGE_SHIFT);
> >  		block->private = mr;
> > +	}
> >  
> >  	/*
> >  	 * Take ref because as soon as drm_gpusvm_migrate_to_devmem
> > succeeds the
> > @@ -637,6 +702,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	if (xe_svm_range_is_valid(range, tile))
> >  		return 0;
> >  
> > +	range_debug(range, "PAGE FAULT");
> > +
> >  	/* XXX: Add migration policy, for now migrate range once */
> >  	if (IS_DGFX(vm->xe) && !range->migrated &&
> >  	    range->base.flags.migrate_devmem &&
> > @@ -646,25 +713,33 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
> >  		if (IS_ERR(bo)) {
> >  			drm_info(&vm->xe->drm,
> > -				 "VRAM allocation failed, falling
> > back to retrying, asid=%u, errno %ld\n",
> > -				 vm->usm.asid, PTR_ERR(bo));
> > +				 "VRAM allocation failed, falling
> > back to retrying, asid=%u, gpusvm=0x%016llx, errno %ld\n",
> > +				 vm->usm.asid, (u64)&vm->svm.gpusvm,
> > +				 PTR_ERR(bo));
> >  			bo = NULL;
> >  			goto retry;
> >  		}
> >  	}
> >  
> > +	range_debug(range, "GET PAGES");
> >  	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> > -	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU
> > mappings have change */
> >  	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> > {	/* Corner where CPU mappings have change */
> > -		if (err == -EOPNOTSUPP)
> > +		if (err == -EOPNOTSUPP) {
> > +			range_debug(range, "PAGE FAULT - EVICT
> > PAGES");
> >  			drm_gpusvm_range_evict(&vm->svm.gpusvm,
> > &range->base);
> > +		}
> >  		drm_info(&vm->xe->drm,
> >  			 "Get pages failed, falling back to
> > retrying, asid=%u, gpusvm=0x%016llx, errno %d\n",
> >  			 vm->usm.asid, (u64)&vm->svm.gpusvm, err);
> > +		range_debug(range, "PAGE FAULT - RETRY PAGES");
> >  		goto retry;
> >  	}
> > -	if (err)
> > +	if (err) {
> > +		range_debug(range, "PAGE FAULT - FAIL PAGE
> > COLLECT");
> >  		goto err_out;
> > +	}
> > +
> > +	range_debug(range, "PAGE FAULT - BIND");
> >  
> >  retry_bind:
> >  	drm_exec_init(&exec, 0, 0);
> > @@ -680,8 +755,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  		if (IS_ERR(fence)) {
> >  			drm_exec_fini(&exec);
> >  			err = PTR_ERR(fence);
> > -			if (err == -EAGAIN)
> > +			if (err == -EAGAIN) {
> > +				range_debug(range, "PAGE FAULT -
> > RETRY BIND");
> >  				goto retry;
> > +			}
> >  			if (xe_vm_validate_should_retry(&exec, err,
> > &end))
> >  				goto retry_bind;
> >  			goto err_out;
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > b/drivers/gpu/drm/xe/xe_svm.h
> > index 5b9d5ac9ef72..139acee41b42 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -36,6 +36,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  			    bool atomic);
> >  bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
> >  
> > +void xe_svm_range_debug(struct xe_svm_range *range, const char
> > *operation);
> > +
> >  int xe_svm_bo_evict(struct xe_bo *bo);
> >  
> >  static inline bool xe_svm_range_pages_valid(struct xe_svm_range
> > *range)
> 
