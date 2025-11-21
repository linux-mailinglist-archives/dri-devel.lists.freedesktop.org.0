Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B2EC7BD26
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 23:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2781510E90D;
	Fri, 21 Nov 2025 22:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eYgpUy9y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA9F10E90D;
 Fri, 21 Nov 2025 22:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763762809; x=1795298809;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r84mQOLjPqQ39yJd/CFf/+couCVat766ascKKsKFa6s=;
 b=eYgpUy9yfPab0EeYvQVfxVRSZz3cIIi0/V5ZEW0f8cyrqduk7Lskf2lk
 /kJaeAXIbvRawhKfV/oHlGQOm4uILsg5Lha4YCyiSaflqaGVg3+MuGWh5
 jQ0WzBHyrInSJsul7hQn2n/TkG5iYGx8giN+bxJjLX1qq4wjAAGXOLjzt
 2D8GSPMda+cIiTyBEk/qo//Bc1ajrBvlfCj2+6fmFnt04kWrVRc0QV4MV
 GXqV/TR/oPpLWuODi5RdGC59g6jzK4NwUQKhHuRksxP3yRWui1db9YTuC
 iPfzQYaIDmPEnxcBIHnU0NssQHm/OBl8ZGqKPZKM6vUwnZbLb/UVgJx6m A==;
X-CSE-ConnectionGUID: xEpOPaOOSi+K60CCygjU6Q==
X-CSE-MsgGUID: 60mCIcR9TxCF/ahZIM7u+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="64867081"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="64867081"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 14:06:48 -0800
X-CSE-ConnectionGUID: uKhwAs22QRuMebDCp68afA==
X-CSE-MsgGUID: S/7MfIhWQEGP2/DCVvDt+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="215153596"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 14:06:48 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 14:06:47 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 14:06:47 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 14:06:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMaUkwlDdrtk/rAQ2VF2pZf0xehEJu48x1neb5bvrXg4g9AQmkrRQICGn7IN7soIyuZ3/XHZl/6J8sYFB4vAS4P3w23if/1sazZOyoKQ6/Izh3yz9pYZxpENybf9nt50lzo7QW+1n8hfx4tabImjDor8zY9tt+CrFcj6S7ppUt4C0BPXZC+iWaJiRnkv7cGn4Zty7EWp32JgPJPYeKJckS8PCYgvBlYIVYGcNVWMKBt8J+geRKlIkTijyd3190JIThWlAI2mDCbysBc6WQV6nf15ktpOpXKji/Rc93qZNcmYNxkn/MZfB5VpvVPcuDPhH93oLCmqZpoWQEYxukbKAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOm7ITgBrHTRCUylWaCnKXMRM7c2lspNyY6U5z522U8=;
 b=ZSXwEIXjrGLqgDXD/PCAw2Q1HzfEGgLJYhW94rv6cdtogrkR/CGdJmKDylpDCUfpZcohuyOVcaDlbS54aOByvf4NliUzOxDA2gbXNhKWHxXfgJrXU4UvWBfLTxKRqTNNvrxE1bHAMdFjx27VeNhxK1b5aB9yyScnbft2dTksBJ2MFEldvVJJhJwZ8GjGbBcvQsu8ixNef65Dop6gBjIvCO+EqxGmZejdTbaeXiERR/ObAlKDCpooAhCxDUTrjU768YtQ5gXEYzJEZRVreJe2A6H4mpdKsOoNlEtqBMiS9t0oQ2MmHEFC9tt+fgZHa6PejyohcMHMVGyBOjl3j4jk6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6501.namprd11.prod.outlook.com (2603:10b6:8:88::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.12; Fri, 21 Nov 2025 22:06:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 22:06:44 +0000
Date: Fri, 21 Nov 2025 14:06:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <umesh.nerlige.ramappa@intel.com>, <christian.koenig@amd.com>,
 <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 5/8] drm/xe: Only toggle scheduling in TDR if GuC is
 running
Message-ID: <aSDicfL+Lxktv2sA@lstrano-desk.jf.intel.com>
References: <20251119224106.3733883-1-matthew.brost@intel.com>
 <20251119224106.3733883-6-matthew.brost@intel.com>
 <aR9wfT5Fo1cXJOMp@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aR9wfT5Fo1cXJOMp@nvishwa1-desk>
X-ClientProxiedBy: MW4P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f0fbb1-9641-4265-ae91-08de294a41c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?afx9HA//X6nqdsQq4XSR+KSH/VQNxKCbDv36mqntUhGnk/1cITmjurCu+try?=
 =?us-ascii?Q?hHjkrtcjiT4yRz9fTuMu0jETSm4JJu4JPepwPIw+OMbLsF6tGRJ/ohxhjecu?=
 =?us-ascii?Q?oBKcthyWzY5FEctyLYQ1MCDVO699z7xDOuBkG1qXaFEfE3MGO4YQNC71bG+E?=
 =?us-ascii?Q?6NOA2rxHR/gfipB44TaP3vyFwyCDoUo0Xc8s236newFHY3AaDF0BSNgybjRN?=
 =?us-ascii?Q?iwGuzd8TNawrHcJEdGzHpjotqpV1qT72TCuhD0f/oi2dxXcWg4OlylFXeZxu?=
 =?us-ascii?Q?WphxJytNeiibYPT4kSel59vdU242sRt6F/RM6cKh+Yv1n7yZAXdRBkCMPmC9?=
 =?us-ascii?Q?8wgtnvCDzFnw3S7TNeksPkX5ZjAGe6j6K0MZlJyp8ddACjL0uhNY5j6YnQhP?=
 =?us-ascii?Q?pT0cYykgAgWBH3fTxh7ciX41BTwSCG00aBRBfL07nSOUFhtPSOsRV6qM5ZNf?=
 =?us-ascii?Q?KyhR/kVf5+9QJaNdYZ1E79IPvxTy3xFzF19D0160gGu67FXb/lIUgcagm/2z?=
 =?us-ascii?Q?HPavOAxnVAc5iZVMR6Da7hrsOghK6PkLHI/vqnt8SLf8XQmCWK5iHfS+jrlK?=
 =?us-ascii?Q?voElme6o9Zs5S4iJoP5zCP+zD3Bnvrd0mQL3Rx7A1ru/k0FVUdqqcaxKMf55?=
 =?us-ascii?Q?O7Vw5JMZmEUwNfMUHkwEjgWja87P09axWGtGwA7bXbS4gnQzfJPis88ucvZ2?=
 =?us-ascii?Q?9ZHEvdX5Lf6yLoynWi7RkTgTuwrVrIW1yfO7r8v7tt4F21qQV8FVHzI0zVTW?=
 =?us-ascii?Q?/ACznZi8CpNE/gsjB/k9lbaw2FZ5t5ZxkcCleSNHRK+pX//N6OgXyOe3UY5O?=
 =?us-ascii?Q?aHdTe5LyatjyZ8obO047K6p7tlYBm9c4fnWMaDnGgb7Za5gaS6nr1Bj6gRcl?=
 =?us-ascii?Q?hotf7rfIQwqM0SIR8PLjVjiv6nYo8FSYcsmmPrEYLsbrqvPXs6uI3mOWjGk+?=
 =?us-ascii?Q?3oybPpk2gImatt0myqK+FuY3cCzd2mBUbfWpaIcRqdiBLf1uvMIYCF3gzvut?=
 =?us-ascii?Q?2LA+jcQfW71FdXpMmXH2iH5n7L7KTVEeEJQBDANQy0NV3seSSRqVPJI5yimT?=
 =?us-ascii?Q?a8T56rNu+wQAeTeO62WotKoBQI0xz4cP2eVrCUfcfRHwsW3fICoaTExBHMin?=
 =?us-ascii?Q?NQbLCu/vza/XlgNj5JkEaWysE2sd94CGztQQhUZghGGAC+G1fKZY1jnvxFl6?=
 =?us-ascii?Q?U5S/wqQh0T2XsIJ8UCaPx7Dublh2MNTh5hZGWhpCxUNvDJ8GfzSwAxhGKHNZ?=
 =?us-ascii?Q?NUlMLjFIQKu9hIwzjT1yudp83P8JpTe7qle+QtpEPbLrH5Pmo3IfapQJbcyX?=
 =?us-ascii?Q?GAwEZpQgVNX0BVyKP4w02Xz7CfNLRCC71XgChumv/yPKjeZRHbC/y4h/46gq?=
 =?us-ascii?Q?zJrSEKn++y89hVR4UPEw8trMCpf5EI0RuR2zkeNbJx11nPHq/plxqOypoYq4?=
 =?us-ascii?Q?0pkkPaT7HHPXf5cvwcxfo2gFRQFryJVP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CM0X+0GCtd4N6DjdgHixHF2CDSgql6hYFpOuyBFx57C+cTvAYnUc9lNmSooV?=
 =?us-ascii?Q?6/Q+6hwscNIU8HKQzXh1K1SKNhmZpFo1jU/P4j5P3uAPzgWRrWVz8SGQfh1N?=
 =?us-ascii?Q?xmdYcC1zAv6F65LOqtfae/FPY/3pxaiAFKKaXX+/J1vOQhgIF66Tv9+1ycMd?=
 =?us-ascii?Q?krcBZ9TDPaEHsGdbx/1COxITXdOZynvw+TkHvsuWZMMrb/5msItGLfwa6NUq?=
 =?us-ascii?Q?Lbyq7eSpHh6mpY5ES01DHjiwdh/rd85yHZrrsy9Sc1pvFABOHgGd7awVWr1m?=
 =?us-ascii?Q?/AfEEJYczxzX5juSSY4jj8jXnm/dfHby51PiNL6e56Dx93E4Y724OWJtlC4c?=
 =?us-ascii?Q?7K4kdoDY6mBGiL7A9oRilt5W7cdYl6XZOE2lTYWnEr5eUBWS915aLVOoSeWR?=
 =?us-ascii?Q?jjDITvhnOORfXy9ojzDkrPwElBIBPr2mIr3sU4aUDUGl/GH3ye5LNu//iRak?=
 =?us-ascii?Q?RYm4uSiW0l9uFatz19A3b9Az7rIxrJkDAhdDdmmos5R5eKxLBYKsexZLukt8?=
 =?us-ascii?Q?9fB6W7st6fj5oCKqt8UxdVkJFtaM1dqzxXvfjUAImDVfZb6k5zYe7TwwgeSs?=
 =?us-ascii?Q?nwaxXqjzLVKlfXUHnWDonpb7vGFLX8hFb325RXGYiUaZ0+qWkobe5LvzGKrw?=
 =?us-ascii?Q?S6vzk0xzx/neUzQOgBAvBlBU821w9ch6CPC+v7cNP1FiLfFhQ0cswtKpm69f?=
 =?us-ascii?Q?jNYN2dM8201EsRs9rj7Fn8BQXypoGEvjXgeTSolLF3LJtUVUYD+o2WAurNFs?=
 =?us-ascii?Q?bd0R6z0AwZVtHBNhfHGlRuGswLXD1FsFol4jZDtR62NNi8HsQn8cOG/u4EOW?=
 =?us-ascii?Q?5Bqwe2Bwv+WuFbh0Jlv345Kned6q85Gy0AlDRlu6OF4RwoRjKSKCRfJbt0vI?=
 =?us-ascii?Q?bl/i2uJNUgAw5uHKIPrGEuiPFvVy4kWvBKJ0nZp2/QETPcuzOmnE1MhWY72K?=
 =?us-ascii?Q?3bn9wN+QSeNThu+UyYUzajsTzBwErFcDIfTSCv9TihDln9/GtiViYyoX3d7g?=
 =?us-ascii?Q?g585En2xQZOPhIu2K5of7K6WgNu5+uihrmSbPJKYa4zt701gT8E1WFREsGyT?=
 =?us-ascii?Q?oy2OUUKYJW6LHIyowwVq+syOUb0/L+pELRssc35Msi3rIPVkvfQnKnd2+hsM?=
 =?us-ascii?Q?lfqi8DcwwfxHmt9K8VaY4IRq8LAqbxBitpA9AlZMyMDVtWrhnkBN35BAB+hR?=
 =?us-ascii?Q?uUOCeVQDo4XZqlJ8hypkk8nWpmtyASdn8NkR++h9LOgktxlL2RGfefsbcIOH?=
 =?us-ascii?Q?FckCu8B35kEba+Bs0zHceTjV1PUHzUyGsaHKW5ZFQ4wKq6hLS+yZBCbeMRnf?=
 =?us-ascii?Q?Xsd0Dlku6mDMDoaduIL4FzW1BWFERTha3JJ6OEbdUYaRg4Sr0Wd8nPfbanK7?=
 =?us-ascii?Q?AdyQ4jSv/NDoGN3n8XqbmBuf19uwmE9U2cgSE6yJrhfmPK3rhuYaY7+2hWHE?=
 =?us-ascii?Q?d/8vdF6X4BS5lYb7LpXPK1zsl8xpxCpUTI9Xu8AasQTcw/UyNuPxoRxtm9Rg?=
 =?us-ascii?Q?QfeTqRLmoKNBiMvgKOUSjuG72SaXCxsfFcRlipsDesF389ouyQSCDGbhutQN?=
 =?us-ascii?Q?R6e/k4d7A+lFA8UCQXix3gPLII6cmg/XewMlSzXSU9nlqNo3keRvM/x4Nft5?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f0fbb1-9641-4265-ae91-08de294a41c0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 22:06:44.2190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uODT4/lAL4lwN5n1UUneMaWC/YfvmAHhPWkb6FPmARKRm+pYBns63yTKrSLg7zSTHfPiFAJcztwGpY31VOTB8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6501
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

On Thu, Nov 20, 2025 at 11:48:13AM -0800, Niranjana Vishwanathapura wrote:
> On Wed, Nov 19, 2025 at 02:41:03PM -0800, Matthew Brost wrote:
> > If the firmware is not running during TDR (e.g., when the driver is
> > unloading), there's no need to toggle scheduling in the GuC. In such
> > cases, skip this step.
> > 
> > v4:
> > - Bail on wait UC not running (Niranjana)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_guc_submit.c | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 3ee35d4873bc..648c9ea06749 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1277,7 +1277,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 		if (exec_queue_reset(q))
> > 			err = -EIO;
> > 
> > -		if (!exec_queue_destroyed(q)) {
> > +		if (!exec_queue_destroyed(q) && xe_uc_fw_is_running(&guc->fw)) {
> > 			/*
> > 			 * Wait for any pending G2H to flush out before
> > 			 * modifying state
> > @@ -1312,6 +1312,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 		 */
> > 		smp_rmb();
> > 		ret = wait_event_timeout(guc->ct.wq,
> > +					 !xe_uc_fw_is_running(&guc->fw) ||
> > 					 !exec_queue_pending_disable(q) ||
> > 					 xe_guc_read_stopped(guc) ||
> > 					 vf_recovery(guc), HZ * 5);
> 
> What if the wait exits because of '!xe_uc_fw_is_running(&guc->fw)'?
> It is not clear where the control goes in that case based on all the
> 'if' checks that follows this wait. Should there be a specific check
> for '!!xe_uc_fw_is_running(&guc->fw)' following the wait here?
> 

Return will be zero and we should tear down the queue. Also I believe
this is covering case where the driver is unbinding and schedule disable
CT blew up a warning. I think the logic works as is or at least I don't
see a problem.

Matt

> Niranjana
> 
> > -- 
> > 2.34.1
> > 
