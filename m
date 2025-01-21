Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B06BA18701
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 22:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE1410E2D5;
	Tue, 21 Jan 2025 21:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dn/aJW+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB9910E28C;
 Tue, 21 Jan 2025 21:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737494006; x=1769030006;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vfbbndp9LS/KPinVlEeQdNNhE6pUGKp0Ne7Y2R+3NOM=;
 b=dn/aJW+PzeRvyQjoqSFdSHrSMmM4PZ71nyi1OCuEsWuQIG2q0bXmU/l1
 zBjMi4+28PVPBvms/y0v3MZfz0DbaP+HdQnVsiRdLeV4urZLoiY6Ze3BU
 VlHQlp+L+0h8dCNRGMPByhNiuAZwospW1FegBeDpKTxjMG5qUuQF4uNEH
 pHn4yVey6Lsnc+zdTbWBYzjijgA9NGZAk3AVl1q21+D9m5aA+HvhLFQ9f
 FXgDxXDKzCevodUol9w0JRx3cqPGNEE+DPcVV3coX1ZYudPg47b07ExVZ
 +jb5MUTi4Vm9GRnRk89PL0dUJfNUj4TMhFDeStfTAcUXhxemhJMZWstre w==;
X-CSE-ConnectionGUID: N0cz4YniT/WVZvL+DPn7Fg==
X-CSE-MsgGUID: s87tLgC/SmOeVjuCpEtt7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="41686872"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="41686872"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 13:13:25 -0800
X-CSE-ConnectionGUID: Lgf2FPFoRtCM9rCiEC59sA==
X-CSE-MsgGUID: GMe88h98T1G0g1cc5gFuSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="106838443"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 13:13:25 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 13:13:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 13:13:24 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 13:13:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQSHXwxPjVtuHlNKAUeJY8lOY30LpHRvHVejDQ6qLAQLs3udxss1ZgCweisIUBTxgxh4Wv5CEMWs+/+LIuUvTIedSAKBaJq9twILFY7cQ4w6F2FvqdSXsnK3BR99HhFNEEh22B5KYOP61w6Sd0Uhy9Op6gMY8Dd3JBdvEmo095rQ9bfCsAHrG+JR8Dfcf4Rso1zHTJUtqKidCyJ0kwyEr9bsua006b7j1LaBoY8KFnOg6m7tuULqkdWq3DBpz1o0fIk/rY3vHykv+ytyYYcVE3QjQXN5Hih2F+WFuwmM+q4t8wmGOY/MucwSkCp+oEVXan3aQsuBhRJeWXIcTP1HlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njYlkVRqPpRHT6cmgRGFKdRCjkMPrh97lqcUT+LQixE=;
 b=Gr1Ua3yqK/mVC+7lb69NY8PQKut+0Ea7NVkS/ylt0TXrJmlfyjiyRxbDzVVuRD6Vl6MEtYl1JbCE+iRSpjBZMQ2wXqNIGz+9ffkRGtbCrm9KVk6EUyJHAYpIxJuFnNI2/zJnKUmaUs2+s66Q5EUSEEzzm84pAbA4Il/0Shi9Q4K20Bm5ko5cp2hjE8rR3kf2I72EiZ2LYjJHG4R3aIZ29V1dSmehEHlANlDtu7cIem4i21Q2LxMQw1jEgNvWyJafE7iWQ5qZQEc3ATc1LwcfH7ulH10b2uv+VYKo4YG0e+44yXTkna9F/2O6QhaVKcJY0NngL5ae6BwaW8Wm+mq5FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6841.namprd11.prod.outlook.com (2603:10b6:930:62::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 21:13:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 21:13:22 +0000
Date: Tue, 21 Jan 2025 13:14:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 00/30] Introduce GPU SVM and Xe SVM implementation
Message-ID: <Z5AOKP8MqUr38UTd@lstrano-desk.jf.intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
 <1c737521-70d9-4779-a044-90a6fb223a5e@intel.com>
 <1e2dc3b7-4c49-4372-b8ae-80829d502d88@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e2dc3b7-4c49-4372-b8ae-80829d502d88@intel.com>
X-ClientProxiedBy: MW4P223CA0006.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a5deff2-1b48-4fb7-17db-08dd3a606fbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XIniuZCzPeOOFTrY3FuoYRaf1n3WMJ+0PKJQuO1uuU0y8LO7m9psCbcFFv?=
 =?iso-8859-1?Q?TbQQDix4cVetEViQeTH4I7Y2tdXCeRvIQ2IkHXZJMn84kPBhhkHsjqD+N+?=
 =?iso-8859-1?Q?HvVIUXmVNyVFx2QnQfBZLTNnrWXZ8tKSP9zn47F8wA5msW+mABpnPy43rQ?=
 =?iso-8859-1?Q?G+8uNG2j0COo9YLHF89S5t7JrIrz4TlVTPCswVS3d1mItHLL4rqNGqyGVX?=
 =?iso-8859-1?Q?mJVQYwu5GQURRhq+iiNM3qqbkotFv3UjLacg43nOlU9h5EchFWXsofyd2F?=
 =?iso-8859-1?Q?yyewNs+HDkVt3rNV9DEFKmuOPMRywwOjb4fQIGRqmLWWqHkCe56M7xJGl4?=
 =?iso-8859-1?Q?qgc8Z+wJKWvrwQnHtzkUUk0yLdmef1OMRJh9RhuVhmlVYGhcm0QswFSMAB?=
 =?iso-8859-1?Q?qdxiA/BVjICMVYhWRBZT2I1/HJgParbvQe7YU64k+8NGhi0Gl1LYYHFnQg?=
 =?iso-8859-1?Q?Hc1k6r6qcAzPIny+BFoJuiU5La/34K49K6DUaGg8u1wPsIjTcmIJBqtx5Q?=
 =?iso-8859-1?Q?9AfEYGevn2t8igcoU/s/iaBrmJrMqXUVKhTJmq/mURQLcRoMKOu3D7PYoB?=
 =?iso-8859-1?Q?7MqpYzugElhRo9SKBaSVR23hsLNhj2cOcCHw4N1iCV0kPuJOqbknpJ8Ioi?=
 =?iso-8859-1?Q?hc/oNx9jejG/ndUXYAs4EJfiyWFCH9jSTmw9xue4U8lyCsWewUabwwMX/s?=
 =?iso-8859-1?Q?tvAJy2YeLZtVq2EvRC1EkP8fpKatDx2uZoGbSzLBxgvE5VxTKj+9lKR1Gb?=
 =?iso-8859-1?Q?hUrFXI/14LvL1ziegyiVKvFXMu3oVQCVOMZ3Cf4LVGmjqvoYPf4dmSnzLX?=
 =?iso-8859-1?Q?znRJiYJdBuAMAACrHWHzKT+NoT5OGv2XC2jDJW/Iz4OVRzE/8N53+sStl8?=
 =?iso-8859-1?Q?bj5jiEAKT2/knuD2WXnvk92CvI42kqE6rTGngvXSzzYlN14y4Em10qXwLP?=
 =?iso-8859-1?Q?Fvk3OU8+gecSYoUPcEsVkiP7hesWlSs6v6tROWquU9KvHggs0PUDBZzkcj?=
 =?iso-8859-1?Q?Irt5Uz8iOw6ezVqWpcXwJY8pytswTvNJD4Sepd/64wNv5IlnccZEWnT534?=
 =?iso-8859-1?Q?hPG3eITuVVi9+Q566rA7o/VCMSXxY+i6fD37+lyW+xD4IdneYqJgslCFq0?=
 =?iso-8859-1?Q?UV7VjYXVCSWmn62oqHuCvaiRQvHIK2BRaLdO70QcjqITIt284EbH+vLj0R?=
 =?iso-8859-1?Q?eJXgz0ZRfWaXhWFBVBJVzs3a+xesSagcsJsCqXfDJH5SwkOKfUHbUpckbl?=
 =?iso-8859-1?Q?rhZugzQEPCjb/fDZpA0Zo7o7o4SW4MsqukmjdjBzEc25wNW/X9FZ1Fuc08?=
 =?iso-8859-1?Q?6yCpf3w1VVF9EXWlDKf9LnkSxgY/pT2wQnHi+1zqwd7eu8a/cN6tkT1Nvt?=
 =?iso-8859-1?Q?5l7F7sDw5/+YaPBLsC82TOjWz5D6lpWw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ByhZ+17gtwNTWJTDUF8nZP2Qg/izNvQFhVupbXeNU5IsWsmHqSsVP/offf?=
 =?iso-8859-1?Q?jG5pUzWosgzFP4a0IUj/j3GKd5+T5Ot8+hfY2IpCXAGErR0OqX9NILwOyF?=
 =?iso-8859-1?Q?7bOHKsofxcQqIZ3rD8SACo/szCEWXbMUHpXNsZpworeUDC/ehX5YxNkMv2?=
 =?iso-8859-1?Q?6T+HdZACmtHPQEQfVKn1ijYCdEiyFKWMIYwXAcwrtJkL/GshLkBfdPOGnH?=
 =?iso-8859-1?Q?sZTLtawbWYVmZHROAO62SMn0NwI95uNgYvJtXoQUMiQD01MTy5ecrUAKZ9?=
 =?iso-8859-1?Q?mHM4E5wfW1gxEkcesZaYNuJccVT6fLf8xNzjJY7FxUOkJms6CGECGzcpGX?=
 =?iso-8859-1?Q?i8oSZqT1xylZRUPx83aCRJm84+xdCGzwYLgKJIGli5XGDOSaOqcLSGSWg3?=
 =?iso-8859-1?Q?TAk41tPD8LnZNuvbypt/srp3mgrmPUJzbA5x7ZV3YTUE2Vt4jXShRrQC/W?=
 =?iso-8859-1?Q?3N8CZeGJyLTU3Hbz7Yna9DwAi0MnizzS4CoAI9H55a7TDkjk21VS5lRcqk?=
 =?iso-8859-1?Q?9vM9iENtfwtHR4W/VFD5MamieIG0DlESQpL1BM4xRMutUIcDosjelSarFK?=
 =?iso-8859-1?Q?rKfaFyeM4+YdKjYHLAGX8nguXiiXcrlJnZcA2ApV1v0Q+PNH2a5PSC/E0B?=
 =?iso-8859-1?Q?YEBmdMVB6Yiutth65DHmH5uABZqG5eRbjMDPWq7g6U+mrlFNK9nJAlpXAO?=
 =?iso-8859-1?Q?EEvv3HeCPEy3agw9WmYZatYewz2DS+xYseIngT3B2ilqtRI9sBB8mYVZmu?=
 =?iso-8859-1?Q?5nFAUfDDoEGGRnaduCUtYXw0RrzfAzzkiAJzzJSeO9BIaxoXRR4R5+lH+z?=
 =?iso-8859-1?Q?dv29Zy+Y8N4/8uBjPEE6hOnF5uTbrzHuKvAfM4xMxdVZ1Yh2i3kWsfcZ+Q?=
 =?iso-8859-1?Q?j9560X97qXluf+gEzJyU93kPl7LQYASZG/4XSAeWQwdpb5w0A5fERTgqLu?=
 =?iso-8859-1?Q?p/bMM6tV1paGGxhMqT0eltj7N7B7JBXx6Qho5HYB1wIJfBf87FJYaG7lUv?=
 =?iso-8859-1?Q?QLNiQpuLwyv6rn9xnh2dbeaHseLJf7e0opt/9Tll+q7umMG6YTW7vBJ0GG?=
 =?iso-8859-1?Q?xIjiyRnop18PD2VGWP8EfK5p+5LDfh/T2pQ1or4Q9+kDJPe9nWeN/pli6x?=
 =?iso-8859-1?Q?R29YN3m4lqpXIcO/AsKiwElfuNptxR6EiSgSq9FLjGUAI5c4RoCJlnr5Af?=
 =?iso-8859-1?Q?dbRrQudpkiBkutBLcqwi+cnsV4PScS62gqQYQfFEKKyfgf7Rjy3hP9T7p0?=
 =?iso-8859-1?Q?HW0qN7vOt99bNpolZW0Pk5WR9i9OXKgiBo8vwIhHNFfHuz2NzLGjuMPrXJ?=
 =?iso-8859-1?Q?CA8MATjtaHB71tnK+GD9bu2TLBiAwDAdageJW8YCY8KHIKLWDgXWBo3Myl?=
 =?iso-8859-1?Q?lmedlcs0Ld/2c7N8nvnu4E/fAuw1ejZjFsuWDdfI6empqUkw26c7IJuZTW?=
 =?iso-8859-1?Q?FSIb+cDrgYDbOn7x0jw4oY7bL3AVm0Lt2XMJ3mtP/AuHPKJC6YXVYF/maf?=
 =?iso-8859-1?Q?yWikahPXmALd9MNSwix900posN1aT8dfa0NebmUl+R+iqejrSW8c0tafFE?=
 =?iso-8859-1?Q?CZA9KCK6W4tX3Kip1VWtdT2gcfc+I1K4PhNg+Db+pdDC3+HTdCFvyCcWct?=
 =?iso-8859-1?Q?VFSkplmIiOIjThLKPdHcRycpWkjWY6XBOyq/5VjNji9jA0xI/HY/9URw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5deff2-1b48-4fb7-17db-08dd3a606fbc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 21:13:22.4134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lh32r5JAd9aIc73n1jHBTorU610JQyyMSdEy6sXQVDOKAOwFv37WRERXhffygXl8bsRnUauFOgGR8vStN5MeHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6841
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

On Fri, Jan 17, 2025 at 11:47:41AM +0200, Gwan-gyeong Mun wrote:
> Hi,
> This kernel oops, which I reported before, was caused by my incorrect
> modification (incorrect applying of review comments) of this patch
> "[v3,19/30] drm/xe: Add SVM device memory mirroring"
> ( the kernel oops occurred because the xe_drm_pagemap_map_dma() and
> xe_devm_add() functions were built in the form of empty functions. )
> 
> This issue disappeared after proper patch modifications were applied.
> So please ignore the previously reported this kernel oops.
> 

My post unfortunately had some bugs masked by Kconfig issue Himal
pointed out. If you want to test of this code I suggest you pull this
branch [1] - it should be stable with all fixes I mention on this rev.

Matt

[1] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svm-stable-1-13-25/-/tree/stable-1.13.25?ref_type=heads

> Br,
> 
> G.G.
> 
> On 1/7/25 2:19 PM, Gwan-gyeong Mun wrote:
> > Hi Matthew Brost,
> > 
> > After applying this patch series and the following to the latest drm-
> > tip, while testing[1] with the mentioned IGT, I faced a kernel oops[3].
> > It makes prevent progressing of the mentioned igt tests.
> > Could you please check the following oops log?
> > 
> > (1) apply comments of "[v3,05/30] drm/gpusvm: Add support for GPU Shared
> > Virtual Memory"
> > (2) apply comments of "[v3,15/30] drm/xe: Add unbind to SVM garbage
> > collector"
> > (3) drop "[v3,27/30] drm/xe: Basic SVM BO eviction" patch
> > 
> > The kernel config used, the entire dmesg, and detailed information can
> > be found in [2].
> > 
> > br,
> > 
> > G.G.
> > 
> > [1] used igt command: xe_exec_system_allocator --run-subtest once-malloc
> > [2] https://gitlab.freedesktop.org/elongbug/drm-tip/-/snippets/7823
> > 
> > [3] kernel oops dmesg
> > [   51.365230] Console: switching to colour VGA+ 80x25
> > [   51.367772] [IGT] xe_exec_system_allocator: executing
> > [   51.383611] [IGT] xe_exec_system_allocator: starting subtest once-malloc
> > [   51.386066] xe 0000:00:04.0: [drm:vm_bind_ioctl_ops_create [xe]]
> > op=0, addr=0x0000000000000000, range=0x0001000000000000,
> > bo_offset_or_userptr=0x0000000000000000
> > [   51.386171] xe 0000:00:04.0: [drm:vm_bind_ioctl_ops_create [xe]] MAP:
> > addr=0x0000000000000000, range=0x0001000000000000
> > [   51.389429] xe 0000:00:04.0: [drm:xe_svm_handle_pagefault [xe]] PAGE
> > FAULT: asid=1, gpusvm=0xffff8881775e9188, vram=0,0,
> > seqno=9223372036854775807, start=0x005584e8400000, end=0x005584e8410000,
> > size=65536
> > [   51.389529] xe 0000:00:04.0: [drm:xe_svm_handle_pagefault [xe]]
> > ALLOCATE VRAM: asid=1, gpusvm=0xffff8881775e9188, vram=0,0,
> > seqno=9223372036854775807, start=0x005584e8400000, end=0x005584e8410000,
> > size=65536
> > [   51.389935] xe 0000:00:04.0: [drm:xe_svm_handle_pagefault [xe]] ALLOC
> > VRAM: asid=1, gpusvm=0xffff8881775e9188, pfn=3126960, npages=16
> > [   51.390048] xe 0000:00:04.0: [drm:xe_svm_invalidate [xe]] INVALIDATE:
> > asid=1, gpusvm=0xffff8881775e9188, seqno=3, start=0x00005584e8400000,
> > end=0x00005584e8410000, event=6
> > [   51.390440] xe 0000:00:04.0: [drm:xe_svm_invalidate [xe]] NOTIFIER:
> > asid=1, gpusvm=0xffff8881775e9188, vram=0,0, seqno=9223372036854775807,
> > start=0x005584e8400000, end=0x005584e8410000, size=65536
> > [   51.390948] Oops: general protection fault, probably for non-
> > canonical address 0x3fff88842fc80000: 0000 [#1] PREEMPT SMP NOPTI
> > [   51.391624] CPU: 1 UID: 0 PID: 76 Comm: kworker/u17:0 Not tainted
> > 6.13.0-rc4-drm-tip-test+ #48
> > [   51.392088] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> > BIOS 1.15.0-1 04/01/2014
> > [   51.392527] Workqueue: xe_gt_page_fault_work_queue pf_queue_work_func
> > [xe]
> > [   51.392947] RIP: 0010:zone_device_page_init+0x5d/0x240
> > [   51.393228] Code: 04 dd ff e8 d5 d2 a1 00 5a 85 c0 0f 85 ba 00 00 00
> > e8 d7 bb df ff 85 c0 0f 84 9d 01 00 00 48 8b 45 38 a8 03 0f 85 ec 00 00
> > 00 <65> 48 ff 00 e8 aa d2 a1 00 85 c0 0f 85 0d 01 00 00 48 c7 c7 20 cb
> > [   51.394247] RSP: 0018:ffffc9000039fb48 EFLAGS: 00010246
> > [   51.394570] RAX: 4000000000000000 RBX: ffffea000bedac00 RCX:
> > 0000000000000000
> > [   51.394950] RDX: 0000000000000046 RSI: ffffffff824c67b4 RDI:
> > ffffffff824e58f5
> > [   51.395328] RBP: ffffea000bedac08 R08: 0000000000000015 R09:
> > 0000000000000004
> > [   51.395709] R10: 0000000000000001 R11: 0000000000000004 R12:
> > 0000000000000001
> > [   51.396093] R13: ffff888170fd8d40 R14: ffff88817f922640 R15:
> > ffffea000bedac00
> > [   51.396472] FS:  0000000000000000(0000) GS:ffff88842fc80000(0000)
> > knlGS:0000000000000000
> > [   51.396925] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   51.397237] CR2: 0000563d1f7ecbe4 CR3: 000000017c212000 CR4:
> > 0000000000750ef0
> > [   51.397618] PKRU: 55555554
> > [   51.397768] Call Trace:
> > [   51.397904]  <TASK>
> > [   51.398024]  ? __die_body.cold+0x19/0x26
> > [   51.398238]  ? die_addr+0x38/0x60
> > [   51.398420]  ? exc_general_protection+0x19e/0x450
> > [   51.398678]  ? asm_exc_general_protection+0x22/0x30
> > [   51.398942]  ? zone_device_page_init+0x5d/0x240
> > [   51.399188]  ? zone_device_page_init+0x49/0x240
> > [   51.399433]  drm_gpusvm_migrate_to_devmem+0x379/0x9e0 [drm_gpusvm]
> > [   51.399768]  xe_svm_handle_pagefault+0x62c/0xa60 [xe]
> > [   51.400110]  ? xe_vm_find_overlapping_vma+0xa4/0x1d0 [xe]
> > [   51.400475]  pf_queue_work_func+0x1ba/0x450 [xe]
> > [   51.400777]  process_one_work+0x1fe/0x580
> > [   51.400996]  worker_thread+0x1d1/0x3b0
> > [   51.401201]  ? __pfx_worker_thread+0x10/0x10
> > [   51.401433]  kthread+0xeb/0x120
> > [   51.401609]  ? __pfx_kthread+0x10/0x10
> > [   51.401813]  ret_from_fork+0x2d/0x50
> > [   51.402008]  ? __pfx_kthread+0x10/0x10
> > [   51.402211]  ret_from_fork_asm+0x1a/0x30
> > [   51.402427]  </TASK>
> > [   51.402551] Modules linked in: xe drm_ttm_helper gpu_sched
> > drm_suballoc_helper drm_gpuvm drm_exec drm_gpusvm i2c_algo_bit drm_buddy
> > video wmi ttm drm_display_helper drm_kms_helper crct10dif_pclmul
> > crc32_pclmul e1000 ghash_clmulni_intel i2c_piix4 i2c_smbus fuse
> > [   51.403779] ---[ end trace 0000000000000000 ]---
> > [   51.404106] RIP: 0010:zone_device_page_init+0x5d/0x240
> > [   51.404393] Code: 04 dd ff e8 d5 d2 a1 00 5a 85 c0 0f 85 ba 00 00 00
> > e8 d7 bb df ff 85 c0 0f 84 9d 01 00 00 48 8b 45 38 a8 03 0f 85 ec 00 00
> > 00 <65> 48 ff 00 e8 aa d2 a1 00 85 c0 0f 85 0d 01 00 00 48 c7 c7 20 cb
> > [   51.405408] RSP: 0018:ffffc9000039fb48 EFLAGS: 00010246
> > [   51.405725] RAX: 4000000000000000 RBX: ffffea000bedac00 RCX:
> > 0000000000000000
> > [   51.406110] RDX: 0000000000000046 RSI: ffffffff824c67b4 RDI:
> > ffffffff824e58f5
> > [   51.406518] RBP: ffffea000bedac08 R08: 0000000000000015 R09:
> > 0000000000000004
> > [   51.406905] R10: 0000000000000001 R11: 0000000000000004 R12:
> > 0000000000000001
> > [   51.407312] R13: ffff888170fd8d40 R14: ffff88817f922640 R15:
> > ffffea000bedac00
> > [   51.407691] FS:  0000000000000000(0000) GS:ffff88842fc80000(0000)
> > knlGS:0000000000000000
> > [   51.408135] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   51.408484] CR2: 0000563d1f7ecbe4 CR3: 000000017c212000 CR4:
> > 0000000000750ef0
> > [   51.408877] PKRU: 55555554
> > [   51.409047] BUG: sleeping function called from invalid context at ./
> > include/linux/percpu-rwsem.h:49
> > [   51.409528] in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid:
> > 76, name: kworker/u17:0
> > [   51.409976] preempt_count: 0, expected: 0
> > [   51.410212] RCU nest depth: 1, expected: 0
> > [   51.410435] INFO: lockdep is turned off.
> > [   51.410648] CPU: 1 UID: 0 PID: 76 Comm: kworker/u17:0 Tainted: G
> > D            6.13.0-rc4-drm-tip-test+ #48
> > [   51.411180] Tainted: [D]=DIE
> > [   51.411338] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> > BIOS 1.15.0-1 04/01/2014
> > [   51.411859] Workqueue: xe_gt_page_fault_work_queue pf_queue_work_func
> > [xe]
> > [   51.412269] Call Trace:
> > [   51.412404]  <TASK>
> > [   51.412525]  dump_stack_lvl+0x69/0xa0
> > [   51.412724]  __might_resched.cold+0xe5/0x120
> > [   51.412956]  exit_signals+0x1a/0x360
> > [   51.413150]  do_exit+0x122/0xbd0
> > [   51.413328]  ? __pfx_worker_thread+0x10/0x10
> > [   51.413562]  make_task_dead+0x88/0x90
> > [   51.413783]  rewind_stack_and_make_dead+0x16/0x20
> > [   51.414045] RIP: 0000:0x0
> > [   51.414191] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
> > [   51.414595] RSP: 0000:0000000000000000 EFLAGS: 00000000 ORIG_RAX:
> > 0000000000000000
> > [   51.414993] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
> > 0000000000000000
> > [   51.415369] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
> > 0000000000000000
> > [   51.415746] RBP: 0000000000000000 R08: 0000000000000000 R09:
> > 0000000000000000
> > [   51.416123] R10: 0000000000000000 R11: 0000000000000000 R12:
> > 0000000000000000
> > [   51.416501] R13: 0000000000000000 R14: 0000000000000000 R15:
> > 0000000000000000
> > [   51.416899]  </TASK>
> > 
> > 
> > On 12/18/24 1:33 AM, Matthew Brost wrote:
> > > Version 3 of GPU SVM has been promoted to the proper series from an RFC.
> > > Thanks to everyone (especially Sima and Thomas) for their numerous
> > > reviews on revision 1, 2 and for helping to address many design issues.
> > > 
> > > This version has been tested with IGT [1] on PVC, BMG, and LNL. Also
> > > tested with level0 (UMD) PR [2].
> > > 
> > > Major changes in v2:
> > > - Dropped mmap write abuse
> > > - core MM locking and retry loops instead of driver locking to avoid
> > > races
> > > - Removed physical to virtual references
> > > - Embedded structure/ops for drm_gpusvm_devmem
> > > - Fixed mremap and fork issues
> > > - Added DRM pagemap
> > > - Included RFC documentation in the kernel doc
> > > 
> > > Major changes in v3:
> > > - Move GPU SVM and DRM pagemap to DRM level
> > > - Mostly addresses Thomas's feedback, lots of small changes documented
> > >    in each individual patch change log
> > > 
> > > Known issues in v3:
> > > - Check pages still exists, changed to threshold in this version which
> > >    is better but still need to root cause cross process page finding on
> > >    small user allocations.
> > > - Dropped documentation patch, fairly large rewrite and will send out
> > >    independently once finished.
> > > 
> > > Matt
> > > 
> > > [1] https://patchwork.freedesktop.org/series/137545/#rev3
> > > [2] https://github.com/intel/compute-runtime/pull/782
> > > 
> > > Matthew Brost (27):
> > >    drm/xe: Retry BO allocation
> > >    mm/migrate: Add migrate_device_pfns
> > >    mm/migrate: Trylock device page in do_swap_page
> > >    drm/gpusvm: Add support for GPU Shared Virtual Memory
> > >    drm/xe: Select DRM_GPUSVM Kconfig
> > >    drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR flag
> > >    drm/xe: Add SVM init / close / fini to faulting VMs
> > >    drm/xe: Nuke VM's mapping upon close
> > >    drm/xe: Add SVM range invalidation and page fault handler
> > >    drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
> > >    drm/xe: Add (re)bind to SVM page fault handler
> > >    drm/xe: Add SVM garbage collector
> > >    drm/xe: Add unbind to SVM garbage collector
> > >    drm/xe: Do not allow CPU address mirror VMA unbind if the GPU has
> > >      bindings
> > >    drm/xe: Enable CPU address mirror uAPI
> > >    drm/xe: Add migrate layer functions for SVM support
> > >    drm/xe: Add SVM device memory mirroring
> > >    drm/xe: Add drm_gpusvm_devmem to xe_bo
> > >    drm/xe: Add GPUSVM device memory copy vfunc functions
> > >    drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
> > >    drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
> > >    drm/xe: Add BO flags required for SVM
> > >    drm/xe: Add SVM VRAM migration
> > >    drm/xe: Basic SVM BO eviction
> > >    drm/xe: Add SVM debug
> > >    drm/xe: Add modparam for SVM notifier size
> > >    drm/xe: Add always_migrate_to_vram modparam
> > > 
> > > Thomas Hellström (3):
> > >    drm/pagemap: Add DRM pagemap
> > >    drm/xe: Add dma_addr res cursor
> > >    drm/xe: Add drm_pagemap ops to SVM
> > > 
> > >   drivers/gpu/drm/Kconfig                     |    8 +
> > >   drivers/gpu/drm/Makefile                    |    1 +
> > >   drivers/gpu/drm/drm_gpusvm.c                | 2220 +++++++++++++++++++
> > >   drivers/gpu/drm/xe/Kconfig                  |   10 +
> > >   drivers/gpu/drm/xe/Makefile                 |    1 +
> > >   drivers/gpu/drm/xe/xe_bo.c                  |   20 +-
> > >   drivers/gpu/drm/xe/xe_bo.h                  |    1 +
> > >   drivers/gpu/drm/xe/xe_bo_types.h            |    4 +
> > >   drivers/gpu/drm/xe/xe_device_types.h        |   15 +
> > >   drivers/gpu/drm/xe/xe_gt_pagefault.c        |   17 +-
> > >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   24 +
> > >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |    2 +
> > >   drivers/gpu/drm/xe/xe_migrate.c             |  175 ++
> > >   drivers/gpu/drm/xe/xe_migrate.h             |   10 +
> > >   drivers/gpu/drm/xe/xe_module.c              |    7 +
> > >   drivers/gpu/drm/xe/xe_module.h              |    2 +
> > >   drivers/gpu/drm/xe/xe_pt.c                  |  393 +++-
> > >   drivers/gpu/drm/xe/xe_pt.h                  |    5 +
> > >   drivers/gpu/drm/xe/xe_pt_types.h            |    2 +
> > >   drivers/gpu/drm/xe/xe_res_cursor.h          |  116 +-
> > >   drivers/gpu/drm/xe/xe_svm.c                 |  948 ++++++++
> > >   drivers/gpu/drm/xe/xe_svm.h                 |   83 +
> > >   drivers/gpu/drm/xe/xe_tile.c                |    5 +
> > >   drivers/gpu/drm/xe/xe_vm.c                  |  375 +++-
> > >   drivers/gpu/drm/xe/xe_vm.h                  |   15 +-
> > >   drivers/gpu/drm/xe/xe_vm_types.h            |   57 +
> > >   include/drm/drm_gpusvm.h                    |  445 ++++
> > >   include/drm/drm_gpuvm.h                     |    5 +
> > >   include/drm/drm_pagemap.h                   |  103 +
> > >   include/linux/migrate.h                     |    1 +
> > >   include/uapi/drm/xe_drm.h                   |   19 +-
> > >   mm/memory.c                                 |   13 +-
> > >   mm/migrate_device.c                         |  116 +-
> > >   33 files changed, 5061 insertions(+), 157 deletions(-)
> > >   create mode 100644 drivers/gpu/drm/drm_gpusvm.c
> > >   create mode 100644 drivers/gpu/drm/xe/xe_svm.c
> > >   create mode 100644 drivers/gpu/drm/xe/xe_svm.h
> > >   create mode 100644 include/drm/drm_gpusvm.h
> > >   create mode 100644 include/drm/drm_pagemap.h
> > > 
> > 
> 
