Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E39A3AB82
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 23:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036AB10E12B;
	Tue, 18 Feb 2025 22:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9RjslWH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3333610E12B;
 Tue, 18 Feb 2025 22:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739916999; x=1771452999;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kbwxs57FYI3v1qxKByDUMZbIdRCnaqji4Btlau4MIKY=;
 b=V9RjslWH7MlcXiqr6BZgMYO2Jfduw0WZ/ApD3meZ/ogDQQ589aXnDfCb
 6KFpSyQ5Sqr0B8MimecpB42LSaRkSxm4t6fyW5p4RQDeCezKN/u+yIOhh
 YyCBFPScEGAhYVBkFo5Bqw9t1f1dOsiwkr2CKO+QQ3Gw64AAP0lkGDsDG
 /tFBIUPeWmVbk4b3WzgMsu2GT0jGTy/0Nxte0sqCM5SZlQ6bgGCxkBfMN
 zWSPY+DnUMlXUefG/ncL9stgNSJXjp1dDzcqlLK4YfLnMVYXuNorToDO7
 /nX3kNetg0Um81Cxt2imkbhwHQDIUxHbXtOm9oecaMN7f3pmEtwrV/Iu7 A==;
X-CSE-ConnectionGUID: TTU/+nxBTKir28UwaTk4+g==
X-CSE-MsgGUID: 55m6fU9qQrGAQA+LRE11cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40559934"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="40559934"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 14:16:38 -0800
X-CSE-ConnectionGUID: D8g9zb78S4CVyxODm6JPrg==
X-CSE-MsgGUID: IyEcLUTwStOFPc+fwzW35A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="115051468"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 14:16:37 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 14:16:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 14:16:35 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 14:16:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soFfbqH6z+JRM6KJi1uynViNblgerM5Q8+dK8VCJ3cQyFm04DoO1cXC8DVN5KOWJJWBneq7j2IXaFcoK2FtZM+2cSsIM2t4FS3uPc4suqjBK9J7xXCTIqDV9MavC3lO57bsCrgWeeTIWL2eSOGMvoSBU8o0Znc2DDL2rWp2SA9/h9doHGzY0F6owK5Lwvjq6unKj3dHh7eBnOR6XyBHVqnfSYD+Kmay5voqOWitKvmb1/jEKxBPKtg8wvXIaoCchePlwq7ztFjZSpzQc2NWmq4CbeSppmmZly5F/pnFjpxE55R7+QTwzKyWsCRVpSEsBO7JgDuJwHKoGfUfjc9UoEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2/Pv39IikBry3g6aCgbIPW6h59xsrbFo1O4ThUc1Hw=;
 b=LAqpXRVCf5QQmsJ1Vtk5Z/F1QdJdtZO2inottIUQroVWqRCDTgmvAy6K1xMYQn1mApYlrPKNP/ewl1Nsh54mKrINT7CSoh7hDvLnJolquVOYiaptd21DCFGYPRWa0t47+325OdN5rzV55ZoY1hFdyGbGJeGEtbKkS+O7raZWWaNPot4z0FclJRE85yM0kYLwyzw+mLCgxK3UULP1F8FQt3IAkCJlTN4EVjgnknNHHanQ04ApRxIMbYH7Fh3e6nZo7UfsTHL6gqlVfqSLM5LKLbreieP4VncCbAmkYMhikGuFOI9uej3YGaXynKdHxu1nKysYDAT3dqW+G9BLlPweRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB8296.namprd11.prod.outlook.com (2603:10b6:a03:47a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 22:16:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 22:16:30 +0000
Date: Tue, 18 Feb 2025 14:17:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <phasta@kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v5 1/6] drm/sched: Add internal job peek/pop API
Message-ID: <Z7UG+8nWwOSyILFW@lstrano-desk.jf.intel.com>
References: <20250214101944.19390-1-tvrtko.ursulin@igalia.com>
 <20250214101944.19390-2-tvrtko.ursulin@igalia.com>
 <7244eaa81cfeb6ce959c591c11a97f52f25b5a5d.camel@mailbox.org>
 <0ecf7583-8e7a-45c7-bc4e-5935681effc3@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ecf7583-8e7a-45c7-bc4e-5935681effc3@igalia.com>
X-ClientProxiedBy: MW4PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:303:8f::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c0747d1-49c1-49d8-2387-08dd5069e4df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?hKkJXA9sbEB7QcCK+zSqbOLoe9WKKAFQoPgP9hO5iGCxDE/nIepTn+NDHp?=
 =?iso-8859-1?Q?oEszEyDXy6K2R6eu2RDwanTErcgPvjz4lbNrtPHvefm1fr0SO0IwU8Ymd2?=
 =?iso-8859-1?Q?ybIbZd4Fr15R5GEV4IBoOM+fW7HkdRvIn/e8dq/+F8+PBhiMScdI0mnU9W?=
 =?iso-8859-1?Q?vf/Gszn3Xe9r8TzCJD3jEHyVDy83gsTnPGwLsvLLedCS3+0XnCVNpGZzBR?=
 =?iso-8859-1?Q?fMJNThejvfouh0WCWHoFg6ykkOBNgc4yANhux+D+HqJdtxM2Hwe9aHB51l?=
 =?iso-8859-1?Q?74JbBVitoLq+zUqFKz5y8v/fosEzpXMgVchSeHpulSc0wBdr6gXXLqNwJr?=
 =?iso-8859-1?Q?aRIGfft1HyIwZEQQ961f2et7GtR5JMF8R8HrLe8YdpOGpw/abXRDrq8Shl?=
 =?iso-8859-1?Q?JxePVqALln8yZcZwzg+BYtsXSD0F4G4O0Q6kkCclqqSTprMOqqZguM3EJP?=
 =?iso-8859-1?Q?s58Ru6PNaNg/kkNNytd2V4TkPKYi2SUaIrtHfDHm7odB3T5BbfC4e6mdvd?=
 =?iso-8859-1?Q?FL5lTK5MJYeGL/R0kWMPf47jcdXphA85/DuhXTxFmczEypV1R0o6ZAcTUL?=
 =?iso-8859-1?Q?5B1FGXyD7XwnBKkZRwuZ2cfW9N2cLCb6HjRTaJn3C8/jMg4FY+7ROlF27G?=
 =?iso-8859-1?Q?dZcxzWOtEZ6ENkfgMul1mnTw5bS4Cxp09IMa5LVArNHLGNuKC2pT2rkIxr?=
 =?iso-8859-1?Q?QNWiLdFQy6AWQmUgxaHHo+4r3RZPAz2IfC4aGh0oZqBDRSdrQBizkFg+gY?=
 =?iso-8859-1?Q?8+npyRtSB4HV/PImEgGO6Gs1W5t51W4MT/o6ai6z1o1RGJnDKCqvRvtfMm?=
 =?iso-8859-1?Q?+qWmxzV7WpGEqh3rxErO1dUYJ+MgjqHaaMRmovArRi7h1fSijg/yqeWsHw?=
 =?iso-8859-1?Q?EVPUu/+fmfHTxFJ2v5UhCHDM4hiDxrXlsNhb3Wvruaa9qc/rWWtNXpxu4H?=
 =?iso-8859-1?Q?QjVCakYgYCLKqiQA1/OldwSb0RLirr4bCiW2uhWz9Iq+R6EOWac1Ek4v7U?=
 =?iso-8859-1?Q?I7jSXd9vFxXLSC7Z7hRQYBL5VlnkSIV8ARmzVp/MSi2x4NZrDnsVAmwCxs?=
 =?iso-8859-1?Q?ROtnArwTJPs6f/42fjVpM57ztrs1hbs9DY3L215jv0AwkQLEel1Mxy1Uj4?=
 =?iso-8859-1?Q?KylRfd11IPnBnA6VQXTnIR5RdBIU4IhP/6me78D4oMkoq41zox2iLOmJrJ?=
 =?iso-8859-1?Q?4O5h+hhy2ltUZTu4hnOVszVX1Z/JNdgJ9D8a6dYPWTJ9/rZCLHeD8Xzy17?=
 =?iso-8859-1?Q?799ApAfsyn2TybuE0XLjySFU5KOEhWgQO0LFNB+S0MeUWhXTvw/PU9Gt4k?=
 =?iso-8859-1?Q?ZolyWrl6Y6k6Ou1Ft+HY7E75P/9w8XwZ9toXMS7wplZBvDbpeGXZumIM3E?=
 =?iso-8859-1?Q?glCWZoMW9K8bX610s6Z1LV0OpMZ/O0Kw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?I71FTqtvv7TKbwuPkSf33BA/8LdM/NbL3CVe/bgSFM+vBq5TVo6Td2xddD?=
 =?iso-8859-1?Q?1Czu2CI39TczApKjf/kVxb9H9U9UPXD8mpIjtvGptE364/q+DxU1TtMapo?=
 =?iso-8859-1?Q?qz90C0eJtHOK3LA9W5xS6B2YwzbySADD0J4fXKSMv78ubGKdIRmFfBo/kW?=
 =?iso-8859-1?Q?4CUwfqDul1xprFndoJYJnB5FIxWB3D2TYoTtinSgtyRwUglKrvcpX0JxWg?=
 =?iso-8859-1?Q?oOte9XhiY4HaNHZS+o6SqaQyFUehMD/iy9jWVx+Z4vuhJzU/cfTs+reDtN?=
 =?iso-8859-1?Q?Lcqeuf+vhk6a/y9PAA9p6J2pIJPpdwZk6O2ZgrRJA83RunxGV3L1b76TEl?=
 =?iso-8859-1?Q?G5J29STmw0K0eXKvTp1hMngTXs8vdA3kZxn0NSQbxXtejoC+UnfJAxezdD?=
 =?iso-8859-1?Q?XdfYWFnUEdluoQlwf6Yxr6jFWbVxEGbcemYy5/c4v1BsH7/MFM4lnxAYb5?=
 =?iso-8859-1?Q?nSXleSW3vgEiXrqJv9kMMzXGnpTekpS9xT0F720ieQEhy9KZhMVfbqs8hw?=
 =?iso-8859-1?Q?73QLhonV/Yb28Z4EAou3xKb/ozWrxZBx+8/KEa+kVC5K9mKJq4QNUn0Msg?=
 =?iso-8859-1?Q?RVVo0FtWJriK1U3k3Z5cpXhdgc1ZHBHbRaS/B0DO6mLf6PHKA8CCYwMDgq?=
 =?iso-8859-1?Q?Z8g6Gi3jWJcu/s9Zndem5VWl5p0YXl3wCCmcLm5tq4PX5rd2CHcGjtY9zQ?=
 =?iso-8859-1?Q?og8pCOSSKUvi7TfnM59Zd19ZOUYf64JmwPnYUsLNt2AZonvTcRdbk7rNez?=
 =?iso-8859-1?Q?9maC1mUOv3OLdpn0DL7wbehafHNx7R7D8qbSOxpnqiVvbttGc8SUAnm9/X?=
 =?iso-8859-1?Q?r32rw7cLzoQFLJ3KxJq620RdpGkeQitZpVZzRrGMoq1nc/VwSGrZoJw38C?=
 =?iso-8859-1?Q?KtWYjzz2ebE8etpDMsdwDtOVSkBUwZjZpgqZ/jpXvzXnkD9gnHgVhsiCim?=
 =?iso-8859-1?Q?zHNxmiN881/VEEQQ3gZnvHnfvSAGtybS9GlwdtnR8HRdu5q+frqc8FXuna?=
 =?iso-8859-1?Q?wahVR8K8ElYnLvbwRqHWe6QTOneuGkl9FWjRywDlCIGzXxNEKckbs0nsq5?=
 =?iso-8859-1?Q?rOjGoANf3FoxxFSGn19xKFwZgOTTyQ2lZYg0pWic0t9L6rnTwewZnRItrW?=
 =?iso-8859-1?Q?hfbJyPMpGKeU04x+UCkegGJl1UZStINVTteAbd1vixcF+tcst123zp4NQQ?=
 =?iso-8859-1?Q?ZccAR0vyYZye7t82WEu1mkgj328k1WY0PVVwEDE3Ap8yJcowGkpN7otz3l?=
 =?iso-8859-1?Q?VOxyzaW1rxZ2gZbTwygPMmT36UYalxpFpoHzNJAMat28HxIwDz6QuJpg9Q?=
 =?iso-8859-1?Q?zLydH1l9E284jLz7AykC+zmpYbKzNEAhRY4HKzm1I7rMW90ERnXLwEdOSa?=
 =?iso-8859-1?Q?DJtVm/r1dTd//OjodnImrx8H2HzXdNArxjBCgjMzj9nCbjizJ2mo3qEwdH?=
 =?iso-8859-1?Q?dl7KLVERcYONOhLzyC41Bwif9DHgzH8BXDJb1pWzZC0zOCovHpou1J48fZ?=
 =?iso-8859-1?Q?mftWKzso/rYu3hQOPk9vHpDPxSUln95XK2hypfCscYwFUa+lkTvs79qSat?=
 =?iso-8859-1?Q?8urBa7VN0RTkb816fAP8hU2CR5nz0ZdLKKsSdhfTWIhYknF/McBMn8kxL0?=
 =?iso-8859-1?Q?e04aI2XFH9gslEXzsS7zTL6uewK2zONTaQfiCF3DpbGwRrqbpwU8SvrA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0747d1-49c1-49d8-2387-08dd5069e4df
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 22:16:30.0092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1TW1M17BNTT3Gm9KrZYrksxSKN8F+2vptbPoP3kxfAe+8VMqb4p13VtbsEsw3XKhQcm2XLtyHu0cqsriGlTgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8296
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

On Tue, Feb 18, 2025 at 06:26:15PM +0000, Tvrtko Ursulin wrote:
> 
> On 18/02/2025 12:26, Philipp Stanner wrote:
> > Thx for the updated version. Overlooked it, I was out on Friday. See
> > below
> > 
> > On Fri, 2025-02-14 at 10:19 +0000, Tvrtko Ursulin wrote:
> > > Idea is to add helpers for peeking and popping jobs from entities
> > > with
> > > the goal of decoupling the hidden assumption in the code that
> > > queue_node
> > > is the first element in struct drm_sched_job.
> > > 
> > > That assumption usually comes in the form of:
> > > 
> > >    while ((job = to_drm_sched_job(spsc_queue_pop(&entity-
> > > > job_queue))))
> > > 
> > > Which breaks if the queue_node is re-positioned due to_drm_sched_job
> > > being implemented with a container_of.
> > > 
> > > This also allows us to remove duplicate definitions of
> > > to_drm_sched_job.
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Philipp Stanner <phasta@kernel.org>
> > > ---
> > >   drivers/gpu/drm/scheduler/sched_entity.c   | 11 +++---
> > >   drivers/gpu/drm/scheduler/sched_internal.h | 46
> > > ++++++++++++++++++++++
> > >   drivers/gpu/drm/scheduler/sched_main.c     |  7 ++--
> > >   3 files changed, 54 insertions(+), 10 deletions(-)
> > >   create mode 100644 drivers/gpu/drm/scheduler/sched_internal.h
> > > 
> > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > index 69bcf0e99d57..a171f05ad761 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > @@ -28,11 +28,10 @@
> > >   #include <drm/drm_print.h>
> > >   #include <drm/gpu_scheduler.h>
> > > +#include "sched_internal.h"
> > > +
> > >   #include "gpu_scheduler_trace.h"
> > > -#define to_drm_sched_job(sched_job)		\
> > > -		container_of((sched_job), struct drm_sched_job,
> > > queue_node)
> > > -
> > >   /**
> > >    * drm_sched_entity_init - Init a context entity used by scheduler
> > > when
> > >    * submit to HW ring.
> > > @@ -255,7 +254,7 @@ static void drm_sched_entity_kill(struct
> > > drm_sched_entity *entity)
> > >   	/* The entity is guaranteed to not be used by the scheduler
> > > */
> > >   	prev = rcu_dereference_check(entity->last_scheduled, true);
> > >   	dma_fence_get(prev);
> > > -	while ((job = to_drm_sched_job(spsc_queue_pop(&entity-
> > > > job_queue)))) {
> > > +	while ((job = drm_sched_entity_queue_pop(entity))) {
> > >   		struct drm_sched_fence *s_fence = job->s_fence;
> > >   		dma_fence_get(&s_fence->finished);
> > > @@ -477,7 +476,7 @@ struct drm_sched_job
> > > *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> > >   {
> > >   	struct drm_sched_job *sched_job;
> > > -	sched_job = to_drm_sched_job(spsc_queue_peek(&entity-
> > > > job_queue));
> > > +	sched_job = drm_sched_entity_queue_peek(entity);
> > >   	if (!sched_job)
> > >   		return NULL;
> > > @@ -513,7 +512,7 @@ struct drm_sched_job
> > > *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> > >   	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
> > >   		struct drm_sched_job *next;
> > > -		next = to_drm_sched_job(spsc_queue_peek(&entity-
> > > > job_queue));
> > > +		next = drm_sched_entity_queue_peek(entity);
> > >   		if (next) {
> > >   			struct drm_sched_rq *rq;
> > > diff --git a/drivers/gpu/drm/scheduler/sched_internal.h
> > > b/drivers/gpu/drm/scheduler/sched_internal.h
> > > new file mode 100644
> > > index 000000000000..815d384845a3
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> > > @@ -0,0 +1,46 @@
> > > +#ifndef _DRM_GPU_SCHEDULER_INTERNAL_H_
> > > +#define _DRM_GPU_SCHEDULER_INTERNAL_H_
> > 
> > DRM maintainer tools complain about a potentially missing license
> > identifier:
> > 
> > -:80: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
> > #80: FILE: drivers/gpu/drm/scheduler/sched_internal.h:1:
> > 
> > The other scheduler files don't have one, either. Still, it might be
> > good to add one for new files. So, shall we make it GPL?
> 
> Ha, good question. And it is actually good I forgot to do this for this
> series (I was doing for unit tests last week, I mean adding SPDX lines)
> because, as sched_internal.h will take parts of gpu_scheduler.h which is not
> explicitly GPL, nor the other scheduler source files, apart from
> MODULE_LICENSE which is "GPL and additional rights", question indeed is what
> copyright blurb to put there. IANAL so not sure. Surely there is some
> established practice for cases like this one just I don't know what it is.
> 

I think GPL or MIT would be the preference given [1]. Also ofc IANAL.

Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3852

> Regards,
> 
> Tvrtko
> 
> > Rest of the series looks good.
> > 
> > P.
> > 
> > > +
> > > +/**
> > > + * drm_sched_entity_queue_pop - Low level helper for popping queued
> > > jobs
> > > + *
> > > + * @entity: scheduler entity
> > > + *
> > > + * Low level helper for popping queued jobs.
> > > + *
> > > + * Returns: The job dequeued or NULL.
> > > + */
> > > +static inline struct drm_sched_job *
> > > +drm_sched_entity_queue_pop(struct drm_sched_entity *entity)
> > > +{
> > > +	struct spsc_node *node;
> > > +
> > > +	node = spsc_queue_pop(&entity->job_queue);
> > > +	if (!node)
> > > +		return NULL;
> > > +
> > > +	return container_of(node, struct drm_sched_job, queue_node);
> > > +}
> > > +
> > > +/**
> > > + * drm_sched_entity_queue_peek - Low level helper for peeking at the
> > > job queue
> > > + *
> > > + * @entity: scheduler entity
> > > + *
> > > + * Low level helper for peeking at the job queue
> > > + *
> > > + * Returns: The job at the head of the queue or NULL.
> > > + */
> > > +static inline struct drm_sched_job *
> > > +drm_sched_entity_queue_peek(struct drm_sched_entity *entity)
> > > +{
> > > +	struct spsc_node *node;
> > > +
> > > +	node = spsc_queue_peek(&entity->job_queue);
> > > +	if (!node)
> > > +		return NULL;
> > > +
> > > +	return container_of(node, struct drm_sched_job, queue_node);
> > > +}
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 8c36a59afb72..c634993f1346 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -78,6 +78,8 @@
> > >   #include <drm/gpu_scheduler.h>
> > >   #include <drm/spsc_queue.h>
> > > +#include "sched_internal.h"
> > > +
> > >   #define CREATE_TRACE_POINTS
> > >   #include "gpu_scheduler_trace.h"
> > > @@ -87,9 +89,6 @@ static struct lockdep_map drm_sched_lockdep_map = {
> > >   };
> > >   #endif
> > > -#define to_drm_sched_job(sched_job)		\
> > > -		container_of((sched_job), struct drm_sched_job,
> > > queue_node)
> > > -
> > >   int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
> > >   /**
> > > @@ -123,7 +122,7 @@ static bool drm_sched_can_queue(struct
> > > drm_gpu_scheduler *sched,
> > >   {
> > >   	struct drm_sched_job *s_job;
> > > -	s_job = to_drm_sched_job(spsc_queue_peek(&entity-
> > > > job_queue));
> > > +	s_job = drm_sched_entity_queue_peek(entity);
> > >   	if (!s_job)
> > >   		return false;
> > 
> 
