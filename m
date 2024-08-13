Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69783950D04
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 21:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D34410E04F;
	Tue, 13 Aug 2024 19:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kWRPSg6g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC1110E04F;
 Tue, 13 Aug 2024 19:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723576712; x=1755112712;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Rql/HNnTf52eOm53fQtjvif2uu57gvdSu2o6ifhSzL4=;
 b=kWRPSg6g7tjjMMZtH5mGqqEpuYnxIDDfnX4tTFrIWwGrY+7JZ55FtMKJ
 9ej1vWWwBNX7stx+wO0tIouWU/XCEXAQ/m95XTLLZDGzzpTOEOm/u/jUo
 GKGMIL7lZdE3VXQEZ6iiQDT2naZ3beOHT96KgFXTDLGnz7cfilJ22PBER
 fXd4r87WNRu20rddSBQ8GjrAEgh6bGartW1Ry/T5IYoN6IP7oUBM/pT72
 BSqwWTnEEmdp8ZlDeqPrjQz+4g4Iq7CBqeG7464JH4w9WCtfPUDZLmzdD
 E/1rzJnJri8CXI97yAyAOZi7N5Uij+KU01a6PTtxnmdJgyoC1yxX/CyJW w==;
X-CSE-ConnectionGUID: 5W0IRhEZQxuUlBkqc39sHQ==
X-CSE-MsgGUID: 6mSorj5uScekAor+dK+yKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="25630533"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="25630533"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 12:17:51 -0700
X-CSE-ConnectionGUID: OjTb70EfTJuYQAzSd21B0g==
X-CSE-MsgGUID: 7X+uwW7yStmi7xGGiB+tfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="58651047"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 12:17:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 12:17:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 12:17:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 12:17:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSMR9Sh/CuGHb7iAXVaxeu0YI16PRJqbM6NXNNYqFa3YehASCT4aoSW4pNoaGJ/i/U2ixwBSMB/bXgPwbFW5lZDMHAiEg8caIQLJZqNHCSGC92exJO4GBjP1xAK7CM4CCez4NJYAxeuCIWGCcH64IohAtaA74tdAnnCNkAVpI9pFOFyEWGGOmEpEsL7goQjQREgtG/k0app/uy5ITega2SO1q1+ZA8VO0fXhRTii8GCReqTxq0rMOaGuI/PbtfTIaiITCcKOct4EIHeds8CuHADS2ncujsF/WByVbuy5bN3Ti01JHhWpTnfRDL6IeEtUFxQ8mCaw2L1wDdU7XSbuEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yML5q8p8sGD0r9/kBBY7y5PgbDF6T0zr/i7n0LupJz8=;
 b=VeJQm94z/TU1hl/3DwTb9ZsD7g3AcvGMZAQ/tIQAdeCoAIOmvjlmc+ZeQMDLGsvebODVYyWABqCaVeKIPSPOasJpigshGDGypW5wnne3CiSmsAYtexleeXFfkeIOyZdEDEZcOujr1f6DiDF+NwAecYsoFGD5EQW+pXynISnmQUNJC5OjXSm9GHRuAAVBx3lP+/uN2/MdP9bmTTfw9w8AubXwCFlD5aq8vcQY8cIqvu35OEfWAiek079qN81rJU27lJgdnP3rDwsRnbduwl4avV1AjtINxeB+v589Hs4QKKm5HaoR1fX6Z/l8520Y4Bda23Qx0xuwBuV3SRBiDCPkoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6437.namprd11.prod.outlook.com (2603:10b6:930:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Tue, 13 Aug
 2024 19:17:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Tue, 13 Aug 2024
 19:17:47 +0000
Date: Tue, 13 Aug 2024 19:16:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <tj@kernel.org>, <jiangshanlai@gmail.com>,
 <christian.koenig@amd.com>, <ltuikov89@gmail.com>, <daniel@ffwll.ch>
Subject: Re: [PATCH v3 4/5] drm/sched: Use drm sched lockdep map for submit_wq
Message-ID: <ZruxG8YaHqV1CAgS@DUT025-TGLU.fm.intel.com>
References: <20240809222827.3211998-1-matthew.brost@intel.com>
 <20240809222827.3211998-5-matthew.brost@intel.com>
 <8b9928cc-dce9-4cfd-b1a9-0112266d60df@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b9928cc-dce9-4cfd-b1a9-0112266d60df@intel.com>
X-ClientProxiedBy: BYAPR01CA0034.prod.exchangelabs.com (2603:10b6:a02:80::47)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc4b9f6-7648-4de6-ef5b-08dcbbcc9dd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?x2OqjhVLfQisebX8NzkZh8w+UxI3i1pHui3BsRpElFoLQdlCRbsrNVxGTC?=
 =?iso-8859-1?Q?4GX6XmNLUBAl/lPcofi4fBgFLcjZ6Nc27f3uFcJUyzrA9xDFPm16SMxHUz?=
 =?iso-8859-1?Q?Tvv2i9OjKPfBiN5P+nsj+u33nnGWdP63cXnURG7e17gln1tSNoC24/MHst?=
 =?iso-8859-1?Q?9ipyGeeMuWet4Dz2Pb40c8xki5mAUqxOAtznO5xvmV1v+P1pHblE+JgC86?=
 =?iso-8859-1?Q?i72I7QMaunbACUK7KsYu01qevcH94wPdvu8GMWxc98CQexDSn7YBALRZ5c?=
 =?iso-8859-1?Q?857j8xdJbsdjF9duMu2ImmL33N0d220C5+csWhdZFsF8bShL207bb6sTZG?=
 =?iso-8859-1?Q?5UxMVhDpb1KoDYy/DRIaFFbuqgyyTmSa+CSMpZvzUttNmNNHOqT58/GtDG?=
 =?iso-8859-1?Q?BBJP/+XvBKHnLPXXVJ/oJOim3SPsXY8uzzIgkESKYeiMTGKNd3YtygLkvb?=
 =?iso-8859-1?Q?bVv7f9UDbCsgEBR1oUXjACYxrZcBtgJTlEL/3ey7URRmmi3c1iTjxrdduX?=
 =?iso-8859-1?Q?MlwG609Kp3cALOEi5mCwcohQ4mEuL8z+WF/R/xemTFDSxj1yShA1w5gsP0?=
 =?iso-8859-1?Q?B3vwPH9Y2LPcg8sPaAA3nlo3XPFDcVy8tu9VL1MPQYEfUhak+2hIEQx4yV?=
 =?iso-8859-1?Q?qKFk2HWesTREBcZz6cBIbjZhBMY+EOlCeU3A1sC4T4X9oUSOIKxr/RBz48?=
 =?iso-8859-1?Q?6Kaqs86CZxF8egyJn/lz+W4LBmHIHfweMy3baXk1PiGCCL96DcEH+vm6dV?=
 =?iso-8859-1?Q?gExrHqLV8zkYq1cwR/aogfRPlCYyzYaGsMtP2POT02C59gX8dvBoFucbkP?=
 =?iso-8859-1?Q?r0uc0URkOKhV2+/N5gSUS4S+utd6gsyV7AIgwz2of3L4u/D0NBSGV6X5ak?=
 =?iso-8859-1?Q?TiM4bHt/O7cEnllIiFVP2P75JZDvl4WQcaFj5xqkaoDwCHYC20fbAmSqFv?=
 =?iso-8859-1?Q?rZoL4Uy05cSNN2Q48IoVYt4ZsvMRyzexd7IcClVZX9ca2SJebp2TlMUf/K?=
 =?iso-8859-1?Q?6POHbQQRKEwPFMjn0xiGdK3775/7HaaRqURL5G83HyMdKrMeQHyJNVAyM3?=
 =?iso-8859-1?Q?wGVelhjy/rOk24NsJzSx6/7xMz4aqlCJB2OAuC9HtZOXrJkEaAb0iyr+21?=
 =?iso-8859-1?Q?2/vqaTEJGLrTx48qGiq7dkOXtMIZ8bTWvilmcwQtp1r5voVZxxrnt00Kds?=
 =?iso-8859-1?Q?mXNRMPtNfjKSARJTDdd2U+b2myMlN8+7cOJ/rSt8299svJylhK4EsjKdG8?=
 =?iso-8859-1?Q?Fi4f6/TSVBHfaauIQkrnJvbx5wRGLY2fN5CgUwFkb8iszNP+rQRWZ12Ypx?=
 =?iso-8859-1?Q?FS3pzpCyxYX1K6rMfYLYqj+eZ2IdN4XKdUauTC6HDnGED83SCMswK7tsbA?=
 =?iso-8859-1?Q?eEJ2MzP5PC1Fs0PuZ74E4ZuzgJSLAdnA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vn0fH/R/uArYEQKDTu2GscNNNBvrPYwiKMXmCL1h9cogZR65iDXxzwPMAH?=
 =?iso-8859-1?Q?i1Buzetyqn0A3rKVosulEw9IePTnl0nkBjnABnft8EHPgU86wGz3OKFFaj?=
 =?iso-8859-1?Q?ZCPOYljxv945GbPTOnf0s5KEZUHsjqHBt0aU2kBbgZ/efxXGoHEIPXFH7a?=
 =?iso-8859-1?Q?sZfkRTVj2xZFLyXYuEYBVxxOapNYotWXsGhZnrL6ckmDKB9mrFIstgBIv6?=
 =?iso-8859-1?Q?ldPGcx3V/7b9ygm3tYEBSK90HkX1CXhJnAv+txwTGWzt+/9kz5EGeBxEIN?=
 =?iso-8859-1?Q?8mRoV0clPkB73gMnNpXr4TXpoiAteZgqEhesxa6tJv3TYT7wtbJeBNvrGS?=
 =?iso-8859-1?Q?ugEMg5v7P8u1cg+mR1BUj/hIiOVTSYhna3GmIoext0jbBJV3ssTIyBpzdt?=
 =?iso-8859-1?Q?rKV7mW/V/MVUxZVbDccnCVpv0Q6Ht0yXgAMmYt80gMokUaY6boka+3brFa?=
 =?iso-8859-1?Q?BYCro+mcJwGsqAWAqc6Q9iOP5BR0LgAfH5bILANREmo89D034xznESkPQJ?=
 =?iso-8859-1?Q?/SL09PhDB3mx2mv47yUVCTrvfMby5SGy39IyC9Th10aRWeZyWwiVm7M9Dx?=
 =?iso-8859-1?Q?+va9SMmDVfr1E3T2U+YnLTpn8PRfJbjeU8NkpCVzKt10emVkCZTd6ZDWtf?=
 =?iso-8859-1?Q?1TAjOX9gUA2VHapxI7DwfY1hEjObaQWa6OReAbZcYtdbHrtXyHPsVvdarE?=
 =?iso-8859-1?Q?H5ErgMB63aN4BLyKQ5ClNbHJJk9lqee4lDB2eaO+PFj1FgsB92zyMCWZHL?=
 =?iso-8859-1?Q?Q2OgxwN3sru3GOxKQQbHkGOWLl6AvK8QiXzwodWZ4QrPZRv/PRa8snw7sw?=
 =?iso-8859-1?Q?z3giGmskbVmwIqFxQ2CM7/hFtZ/LhSBzuQVEgsY95t4ZLn8CbceoEF6Vfl?=
 =?iso-8859-1?Q?2r860TCwpvsQTOvOHAXPPpXxBrjY5YU8z/shNTDxjAsJPgL0pmNsj6UGk9?=
 =?iso-8859-1?Q?9spa2JXpqXdvcj8tSA9a/VqJJdBrPPYa9XeZog+pz8RRvAgbLWwdG0Ndku?=
 =?iso-8859-1?Q?EJp/qvKECHx6Nm9gbq5eN0avIDCUulVOf6+YEXjFdXjg/iZpDUOQJIIwEV?=
 =?iso-8859-1?Q?KiUH1dvSxB+w1Og91H7P7gYZBsrLve2iZhbPLd7VdL8Db7c/QLuxOVnAqT?=
 =?iso-8859-1?Q?EpTQhtlLbpSDQorYv+RYX/U0g0qw+0PXH60j/utXDRlC+z4jf0j1+qIwBv?=
 =?iso-8859-1?Q?Pp/pu5Is2BDrPWhhiPlgRRtmwEh3qy4GCn12oRKrm4sEfDureCktjobe6D?=
 =?iso-8859-1?Q?2xAyrqMy3/uS2RwxJr9kLzoBB0LFGt7Qbe3VeD678tjJRTynvVgAeQ5z2U?=
 =?iso-8859-1?Q?vgti4ogAQqBEOkDYzoTiZo4QuaFosTC3nFzENbjl/2OvPtAfxosVVSyaZw?=
 =?iso-8859-1?Q?zBwCnZTXkLByuu0P9YXhaXV+2NghzeJuXZFizQ+8CHTv7y7VwZKk0iBR11?=
 =?iso-8859-1?Q?ojIR6Qav6tBdDGg4yhBKIZkNeHSKURFIzW277QEAjM5/gOUiiQ8GFvtVWx?=
 =?iso-8859-1?Q?ejTW7QludtIR6g/uO21X6K8UDVD2eS14ioT0Vp0hvbm2WKmm82z8IipCfE?=
 =?iso-8859-1?Q?+/vMn8q3EsnOahMgpL5cnsQJTZEoaoNXvbgZISZBzaUuX+IjnG+ZpmgfNY?=
 =?iso-8859-1?Q?vePcfjn6Zh8xjGKUABVg7WEOIS3BIugfuBEnn7OYCnp8yCL34njSH9dg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc4b9f6-7648-4de6-ef5b-08dcbbcc9dd4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 19:17:47.6520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7HvcAegX3cDV6C3sdgXmp58C1cQ+tDunH8ZVFghX9o55k2pWZVJs1n0fO8xP3+/Ev0AcxgS8aqqZgH2lyojog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6437
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

On Mon, Aug 12, 2024 at 11:05:31AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 10-08-2024 03:58, Matthew Brost wrote:
> > Avoid leaking a lockdep map on each drm sched creation and destruction
> > by using a single lockdep map for all drm sched allocated submit_wq.
> > 
> > v2:
> >   - Use alloc_ordered_workqueue_lockdep_map (Tejun)
> > 
> > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/scheduler/sched_main.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index ab53ab486fe6..cf79d348cb32 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -87,6 +87,12 @@
> >   #define CREATE_TRACE_POINTS
> >   #include "gpu_scheduler_trace.h"
> > +#ifdef CONFIG_LOCKDEP
> > +static struct lockdep_map drm_sched_lockdep_map = {
> > +	.name = "drm_sched_lockdep_map"
> > +};
> 
> 
> will it be better to use STATIC_LOCKDEP_MAP_INIT ? Initializing key here
> instead of while registering the class ?
> 

Most existing design patterns in the kernel define static lockdep class
this way so I think this is fine. But honestly don't really have an
opinion here.

Matt

> 
> > +#endif
> > +
> >   #define to_drm_sched_job(sched_job)		\
> >   		container_of((sched_job), struct drm_sched_job, queue_node)
> > @@ -1272,7 +1278,12 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   		sched->submit_wq = submit_wq;
> >   		sched->own_submit_wq = false;
> >   	} else {
> > +#ifdef CONFIG_LOCKDEP
> > +		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name, 0,
> > +								       &drm_sched_lockdep_map);
> > +#else
> >   		sched->submit_wq = alloc_ordered_workqueue(name, 0);
> > +#endif
> >   		if (!sched->submit_wq)
> >   			return -ENOMEM;
