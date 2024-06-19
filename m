Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE04A90F1BD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 17:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82FD10E089;
	Wed, 19 Jun 2024 15:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jzFi+4f7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC8310E0DD;
 Wed, 19 Jun 2024 15:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718809843; x=1750345843;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OSseJFhzFjt/+FgVc9KjUJXvSzODu7nDUj6M3WxJ6dY=;
 b=jzFi+4f72pNa956bfsqb0orNIZWu35BWC5adirpbxDjWJJz/kTsV6Ga+
 T/2hfxrhF4EMKIE7kdKLunN96H/nPcvjZuYBclzNL1sWNVVFMbwOLNRyv
 8cqmnbBeGgPD26VEGAYwCz+pBAxo8/2V4GuJM/dVzTd6ASVKCCqT/pHvv
 b2UWaAo9jZlk5Rk3Ucw5q2/1x9xsvL99wmKV0ms41zDIanZPQot7ThwGJ
 JvPDhtfc0Eq3rP4fdrCs9GyjTGuiyeNoFy9vNPyIssm2I0ElfnZzZS9AD
 9kUcIrTkhOdfn60AGyuwZqFjQKFlo9HqvrB59RQhuTxfTm4cIlvYlnWn0 g==;
X-CSE-ConnectionGUID: aNeUu9lKSQO49wUOS2uzyQ==
X-CSE-MsgGUID: DiMIOMpOR8W1b1Qh26VdQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="38267352"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="38267352"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 08:10:42 -0700
X-CSE-ConnectionGUID: u2iNOOO1QP+caJIdDhjYZw==
X-CSE-MsgGUID: wCJq+O4LQNS9HDoZWUk2FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="42064782"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 08:10:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 08:10:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 08:10:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 08:10:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 08:10:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwNTkvys1HeQKNSJwnkVPG06F7lfyJjuIXniz3pZf4KMFZFSYLVW4ErnLu5X9PyzsD3JI4LGE2AG1A8haOEeGaj9Tasq8qY2zdxIbdJjsq7YAA69F/YFY8DqWhFbmFdDFdIyp3h3767+H+B8MSQhyrUhCcGcRri1AD8IOMuoGxSrMMn3jxwIQA0Z/BVdI2aJbAtK6Cq5soadvmX7/2O6GC2vojiKB4TzMQ5l4S/oSdKYQQmievVn9/VL7VBPVuW6PEo5c7A4UIg0ODFaAgbfCxfiKzJya6MV5w5JWLQO7v7XwZDXLzJ3+PEkG2czRbHkcKBAX8ZU9Me3tOcDIN6rvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+E3enDajtTHtRyUjkZVdTb3832Qyb/sjqFS5DoOP3sg=;
 b=FdyYcgnnI1J1EHf1qwfh1lP2Vz8ssL2ZqH8+RZjwls/FiJ1IAF7SOZ5NsgMLPuZxUMvgm+PQe9t87BPsD6nNhD1/rbh/2J375u5w/YpYB+le9tupW5VyNrB0GTP80IvTo1hA0bDX49ijdyMkRAE8dWApsAv/MtTet0C9s6Zvk3E2nKVzZRAoGV7wGybUO4dP5bxaGjiH1fM0d3RdrL5RCE8JMe8e6D0hqi69b/ejUjL9RZPde/r9+14unD9c7EemvqlARuHNUwKmxuxKI1Smk3xgXt6YoMraGeO8OJetK56398tXz/AnVCa7CX0t3BPszcoEsGiDS7stJeEEyM2wSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6724.namprd11.prod.outlook.com (2603:10b6:510:1b4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 15:10:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.027; Wed, 19 Jun 2024
 15:10:28 +0000
Date: Wed, 19 Jun 2024 15:09:52 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 05/12] drm/ttm: Provide a generic LRU walker helper
Message-ID: <ZnL0wKcnTLXw5FsY@DUT025-TGLU.fm.intel.com>
References: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
 <20240618071820.130917-6-thomas.hellstrom@linux.intel.com>
 <ZnIGBea3S5fquc32@DUT025-TGLU.fm.intel.com>
 <ea9a30622e4d2e773eede7afe9d60891eea0c7c1.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea9a30622e4d2e773eede7afe9d60891eea0c7c1.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: 3159cb4b-6911-4267-a96f-08dc9071f410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?R0C5BeqMq2TRt+8gEP6SvB21EYksytfpgU1JVFntsK/KQRWL3KvA2TBIpt?=
 =?iso-8859-1?Q?NpXzPgxEOJdvc4IQ9Jl6ZF+JGr49oieI4Z9o3wowVDZR7WilWBCfkIRKUC?=
 =?iso-8859-1?Q?LNC1wi/uzAVuEwdPGUfarzHo/Avwsk7NT2Kr9ZMEahMKVsfPvFl7iWil+u?=
 =?iso-8859-1?Q?oMPrMevvyXR8BtuEDGD0TTLyvi8hCS1FnXmjPDp4PnvdqpfVxGZzi2rOnK?=
 =?iso-8859-1?Q?b0pP+BWrpUso8t3/Z2jju1Dwo5TyHjqfWMAdwqp6Nnkd2kzlWP8TbD9UAE?=
 =?iso-8859-1?Q?YoI/g84RQhkSjG8plXjTgDD26CTRAQGKpmaYfa0L3x6W1UC7dXL5qGO8hN?=
 =?iso-8859-1?Q?hxZgRNjfaMq1Ncitbm2vjz/aiotBWAwsHe+Hb0to2Au1TyqjPNa1r1Ci8p?=
 =?iso-8859-1?Q?YLfv6ZOYbOLqIhB+8lYLVPBuE97h8BcHwjYxlYRvgINhrvEcp2+A+QbCEp?=
 =?iso-8859-1?Q?Q16U5lzPiGCrqcUrEELih1scEXHFgtfhlVqzzmUAmPOKOv2biYYliROISt?=
 =?iso-8859-1?Q?cYaAOdZ1rLJnQLnNGCkw4ju9ZYMqZS/g97HtlelI4oNPxPFVo9l1NdsRTJ?=
 =?iso-8859-1?Q?KwGJMgLJZMGrq0vBmWuD2GkNLZWP1OPxCV+pxffU9PrpXlfPX6ZZQFvlBa?=
 =?iso-8859-1?Q?/MZDSUvEu198sY1U0rQcXZGNo31XhB+/4r0YavecqpQZskU+1VAPzKKw4q?=
 =?iso-8859-1?Q?+4BGtCGDPoREmd/BiK3+qJr/p02zadvW6oUogJ95HQZ79R/4s4QlbHxTqm?=
 =?iso-8859-1?Q?/2Wol9zRS0+tb0v+8vXZhM4yf/xfaBGbRI7DZaQOoU72VSL2dCGlaIZeXt?=
 =?iso-8859-1?Q?TH+MynhGQs9roKHco4MItb2EbCDqq1M9hSxh8ztqu08NLiA07RQSapXgPK?=
 =?iso-8859-1?Q?/uMBdg17J6Hr/xAct4wZDsuitqPpFsTuXezrNQWU2/5poNds7N+qWbp+VS?=
 =?iso-8859-1?Q?G9oPX9L2FcWuQRjrpp62YeY5qzCGc1Zeiqm/CpA/nnrWHnbFNHHjsxKR6z?=
 =?iso-8859-1?Q?SqJ8fRi7u0SLrBBzuAy71/z3N24QYh0o/A3+eWAS43l88u3a07vsqFBXH+?=
 =?iso-8859-1?Q?vHhpDGGvIwbrKIgD5kiGg4HcHz3CbSrKZZ1mbRwOD0HzF9isc1+2lIEUgq?=
 =?iso-8859-1?Q?/XkXKmrrjOChwHZsaX4LOp+IazeQTMVfltXBdCsF8+Z2mtgouonP1WPd40?=
 =?iso-8859-1?Q?pPSeNgJ87KLIRmOYegfMCY6JBtQEncCpwngYMC0w6pQCU7u9z5dHRmrmK4?=
 =?iso-8859-1?Q?m1ZRIY9zY/YdzxtRiKGuCAsytCIarqurIJS3SIm+C41gg441SQhAaUE5qg?=
 =?iso-8859-1?Q?N2AxlIXlb7UKquZ1XZp+L4hN8659T4pXi7iN/IxYv4yxXUAlu+fYZjiWDi?=
 =?iso-8859-1?Q?aEZMm6GjOw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KH3SMK6c5elV3P9iGrHR4mTN9MxlU5KrhnaO3fRuvQzTfFIlhlLgPSyZ3H?=
 =?iso-8859-1?Q?Wy4UJt5TRXm6V9jjefJHelDI+bwP57TlTuooAx4gq168PXA95F3hoDjCSR?=
 =?iso-8859-1?Q?o07AYLCe+I3p+dyGpISxfTsPtSL6/okFuIjDcsYUQx4ul+dt2yoMQqGeSI?=
 =?iso-8859-1?Q?Voznha054po5hjk/nGM2ou3t7wnf/T1yR4ev7WZGo03DGJPkry1lHJ/OBE?=
 =?iso-8859-1?Q?VbsI8t84m06Tf74sAPT6fQRJMUOK+1s9Q8MtA+8LFbPv6JSwiSrSuK7wmQ?=
 =?iso-8859-1?Q?3kTKxopRp+Y45V88v0norFcYL6+1Xa4cJxJPlSP9ysyqYuRz51dxFdOKPT?=
 =?iso-8859-1?Q?bua3vfUwsTZTr7Q5NxHP+jl8+L/N3SYA3Ki+8uAdG6OAFdBckOt5cbjFhK?=
 =?iso-8859-1?Q?iEoFM0dKAw2hk3GSxZONR4sUH4J4TSrhVYusX0rIwcVOTZhdSwcJeKtWQ1?=
 =?iso-8859-1?Q?HIqe2jH//XFILGkCEppvTedMB6Qtzzq6PBGdraazPx6AhUnYcFLcVTCkiy?=
 =?iso-8859-1?Q?s2sA1FuwT6Q3Q9O/4MHY+ENjGO4MAS2DI0vVZBD+eu7fpAG2hzym0i2RYy?=
 =?iso-8859-1?Q?ss+Tp9sYYdWD+NPij6XJAVBQwNXN/WVF3oktc/1rXL3MBh2vWIb478k0Nv?=
 =?iso-8859-1?Q?rNpUolrClAbls35kE9n7DaKUICNQp/D2LI8VPIA4apIl1hSOr67gSkHx+m?=
 =?iso-8859-1?Q?WgWDQ3lH8x6bKII70SlnkbnKwnTlQjN2rnK5bWISd+uFYBPaGp2FjZpkAS?=
 =?iso-8859-1?Q?BKz1KMLYD4ywWh0E360JVAK49zG711slIxlDfwUZ3+EZ7+pU2gdWayRf+8?=
 =?iso-8859-1?Q?H/mTpCpbJk9DMZkp9en4jtkKpEHIOFas5SLgesSgpIBp0c+UbMBqjVpXxr?=
 =?iso-8859-1?Q?GTM/aUd0hLvZD3S/ssIH7+kuxuElbUNbCU8uZ5fNgj+QV0zr2lYyalnui6?=
 =?iso-8859-1?Q?L+MBQaUKJk5U+b4YY9GsjiHwjeQ9jJbQkWjXfS4I99+pfNU0KSQ5E5VvUY?=
 =?iso-8859-1?Q?6Q6pF6cFXaLuyruYxBaueXwRH/7SFddFr6xLJZ/QScIUB5yIKw/CKTjzk7?=
 =?iso-8859-1?Q?09AKAek1L1yuFecYtSsOnvL/KvdDd/CeNI/O36EplwJBX2RyphyuP3A04I?=
 =?iso-8859-1?Q?CutlDCUadbTmZIr7b+Xxry8ABhZybi822QI0TyNxnTjYvv02cHASlVrQKj?=
 =?iso-8859-1?Q?vBd8YhMmzt8ywQ1jciuBCj7aVH5wKM46Dpd7pfPANkqbCV7XBINETDzG1D?=
 =?iso-8859-1?Q?Qe7z9yVmhlwS5VDd645dyn6+mgEKg7ohe/r6DhT1nk0BO6gugN8R9Zh/NW?=
 =?iso-8859-1?Q?+YnxAtYuEIHzs+sDmqXKJ3CFv556KU/jyr8gUUsiuCB+1pginuOYaynA+J?=
 =?iso-8859-1?Q?xu8CUwEY8tXSky0yJxwur+Z/T32YvdTuBX9Ynj4qEL9uGiepYc5OiXhX6S?=
 =?iso-8859-1?Q?2vxLCiTp9qV5VMeiejlrgjYVKkZFKii+S4KkhnYHxwsdZmwULIecVxh0xP?=
 =?iso-8859-1?Q?+syuvr/sWJYeUU0024HEyll9b2JDvXXlQtD84b+3G0YddU9KZzOihxwGXv?=
 =?iso-8859-1?Q?uYuzO8jqPBB6xbGNcSYmD4VFNNeyX/mKsay9zJgSdqX1XI5ta4ZTW+B2ZQ?=
 =?iso-8859-1?Q?JMFzQ9pCQV6pF2m4o+uK7pjqf9BRvSQlVPb2sA6d5yFMUaaASSeX5pVw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3159cb4b-6911-4267-a96f-08dc9071f410
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 15:10:28.1515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uiWL5hbmr3e0F7YEASo3irAEeEa4pIIV5ITnqJGi2kp3OhGRbkDqw8G0TAy6yRNaF9F+ZrLyOaJJknXeKRoZ8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6724
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

On Wed, Jun 19, 2024 at 09:31:33AM +0200, Thomas Hellström wrote:
> Hi, Matthew. 
> 
> Thanks for reviewing.
> 
> On Tue, 2024-06-18 at 22:11 +0000, Matthew Brost wrote:
> > On Tue, Jun 18, 2024 at 09:18:13AM +0200, Thomas Hellström wrote:
> > 
> > Replying to correct version...
> > 
> > > Provide a generic LRU walker in TTM, in the spirit of
> > > drm_gem_lru_scan()
> > > but building on the restartable TTM LRU functionality.
> > > 
> > > The LRU walker optionally supports locking objects as part of
> > > a ww mutex locking transaction, to mimic to some extent the
> > > current functionality in ttm. However any -EDEADLK return
> > > is converted to -ENOMEM, so that the driver will need to back
> > > off and possibly retry without being able to keep the
> > > ticket.
> > > 
> > 
> > Wouldn't the backoff be unlock everything but keep the ticket?
> 
> We can't do that (yet) since we don't have the drm_exec or similar
> functionality. The missing part is that if keep the ticket, it's in
> contended state which means we need to slow-lock the contending lock as
> the first lock. And the caller doesn't know which lock is the
> contending one....
> 
> That is all addressed in the RFC part of the series that I left out for
> now. This is only trying to mimic current functionality.
> 

Got it.

> > 
> > > v3:
> > > - Move the helper to core ttm.
> > > - Remove the drm_exec usage from it for now, it will be
> > >   reintroduced later in the series.
> > > v4:
> > > - Handle the -EALREADY case if ticketlocking.
> > > 
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: <dri-devel@lists.freedesktop.org>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/ttm/ttm_bo_util.c | 145
> > > ++++++++++++++++++++++++++++++
> > >  include/drm/ttm/ttm_bo.h          |  32 +++++++
> > >  2 files changed, 177 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > index 0b3f4267130c..45fcaf6f8644 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > @@ -768,3 +768,148 @@ int ttm_bo_pipeline_gutting(struct
> > > ttm_buffer_object *bo)
> > >  	ttm_tt_destroy(bo->bdev, ttm);
> > >  	return ret;
> > >  }
> > > +
> > > +static bool ttm_lru_walk_trylock(struct ttm_lru_walk *walk,
> > > +				 struct ttm_buffer_object *bo,
> > > +				 bool *needs_unlock)
> > > +{
> > > +	struct ttm_operation_ctx *ctx = walk->ctx;
> > > +
> > > +	*needs_unlock = false;
> > > +
> > > +	if (dma_resv_trylock(bo->base.resv)) {
> > > +		*needs_unlock = true;
> > > +		return true;
> > > +	}
> > > +
> > > +	if (bo->base.resv == ctx->resv && ctx->allow_res_evict) {
> > > +		dma_resv_assert_held(bo->base.resv);
> > > +		return true;
> > > +	}
> > > +i
> > 
> > Any reason this is done after the try lock? Just kinda goofy as if
> > this
> > statement is true the dma_resv_trylock will always fail.
> 
> It should work either way. I guess I had viewed it as "trylock first,
> if that fails, attempt any exception". I guess if we want to optimize
> performance for shared lock implementations, moving it first might
> avoid the atomic trylock operation, but I wouldn't expect a noticeable
> difference.
>

Agree it works either way.
 
> > 
> > > +	return false;
> > > +}
> > > +
> > > +static int ttm_lru_walk_ticketlock(struct ttm_lru_walk *walk,
> > > +				   struct ttm_buffer_object *bo,
> > > +				   bool *needs_unlock)
> > > +{
> > > +	struct dma_resv *resv = bo->base.resv;
> > > +	int ret;
> > > +
> > 
> > I suppose we don't have asserts here like in Xe but if we did,
> > assert(walk->ticket)?
> 
> I agree. I think we'd really want a TTM assert or warning that could be
> compiled away. In any case, I only expect a single caller of this
> function.
> 
> > 
> > > +	if (walk->ctx->interruptible)
> > > +		ret = dma_resv_lock_interruptible(resv, walk-
> > > >ticket);
> > > +	else
> > > +		ret = dma_resv_lock(resv, walk->ticket);
> > > +
> > > +	if (!ret) {
> > > +		*needs_unlock = true;
> > > +		/* Only a single ticketlock per loop. */
> > > +		walk->ticket = NULL;
> > 
> > Can you explain this a bit more? I see that once the walk->ticket is
> > set
> > to NULL this function will not be called again (i.e. only try locking
> > will be used). I want to understand the reasoning for this.
> > 
> > It might be helpful for a more lengthly explaination in the comments
> > of
> > the code too.
> 
> I can add a more thorough explanation, Again, this is trying to mimic
> the current code, that does a walk of trylocking, then a single ticket
> lock more as a sort of "wait a while to be able to make progress" and
> then resorts to trylock again.
> 
> The real reason to avoid multiple ticketlocks here is that each have a
> chance of failing with -EDEADLK, (in particular with the -EDEADLK
> injection enabled) which would translate to an -ENOMEM in the caller.
> 

Makes sense.

> > 
> > > +	} else if (ret == -EDEADLK) {
> > > +		/* Caller needs to exit the ww transaction. */
> > > +		ret = -ENOSPC;
> > 
> > The commit message says -ENOMEM.
> 
> The -ENOSPC is converted to -ENOMEM for the driver in
> ttm_bo_validate(). I could explain a bit more in the commit message.
>

Forgot about that.

> > 
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void ttm_lru_walk_unlock(struct ttm_buffer_object *bo, bool
> > > locked)
> > > +{
> > > +	if (locked)
> > > +		dma_resv_unlock(bo->base.resv);
> > > +}
> > > +
> > > +/**
> > > + * ttm_lru_walk_for_evict() - Perform a LRU list walk, with
> > > actions taken on
> > > + * valid items.
> > > + * @walk: describe the walks and actions taken
> > > + * @bdev: The TTM device.
> > > + * @man: The struct ttm_resource manager whose LRU lists we're
> > > walking.
> > > + * @target: The end condition for the walk.
> > > + *
> > > + * The LRU lists of @man are walk, and for each struct
> > > ttm_resource encountered,
> > > + * the corresponding ttm_buffer_object is locked and taken a
> > > reference on, and
> > > + * the LRU lock is dropped. the LRU lock may be dropped before
> > > locking and, in
> > > + * that case, it's verified that the item actually remains on the
> > > LRU list after
> > > + * the lock, and that the buffer object didn't switch resource in
> > > between.
> > > + *
> > > + * With a locked object, the actions indicated by @walk-
> > > >process_bo are
> > > + * performed, and after that, the bo is unlocked, the refcount
> > > dropped and the
> > > + * next struct ttm_resource is processed. Here, the walker relies
> > > on
> > > + * TTM's restartable LRU list implementation.
> > > + *
> > > + * Typically @walk->process_bo() would return the number of pages
> > > evicted,
> > > + * swapped or shrunken, so that when the total exceeds @target, or
> > > when the
> > > + * LRU list has been walked in full, iteration is terminated. It's
> > > also terminated
> > > + * on error. Note that the definition of @target is done by the
> > > caller, it
> > > + * could have a different meaning than the number of pages.
> > > + *
> > > + * Note that the way dma_resv individualization is done, locking
> > > needs to be done
> > > + * either with the LRU lock held (trylocking only) or with a
> > > reference on the
> > > + * object.
> > > + *
> > > + * Return: The progress made towards target or negative error code
> > > on error.
> > > + */
> > > +long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct
> > > ttm_device *bdev,
> > > +			    struct ttm_resource_manager *man, long
> > > target)
> > > +{
> > > +	struct ttm_resource_cursor cursor;
> > > +	struct ttm_resource *res;
> > > +	long sofar = 0;
> > 
> > s/sofar/evicted?
> 
> That's not always the case. When used for eviction it is actually 0 if
> the new allocation failed, 1 on success. It should be interpreted as
> "progress towards target", so perhaps progress?
> 

progress sounds good.

> > 
> > > +	long lret;
> > > +
> > > +	spin_lock(&bdev->lru_lock);
> > > +	ttm_resource_manager_for_each_res(man, &cursor, res) {
> > > +		struct ttm_buffer_object *bo = res->bo;
> > > +		bool bo_needs_unlock = false;
> > > +		bool bo_locked = false;
> > > +		int mem_type;
> > > +
> > > +		if (!bo || bo->resource != res)
> > > +			continue;
> > > +
> > > +		if (ttm_lru_walk_trylock(walk, bo,
> > > &bo_needs_unlock))
> > > +			bo_locked = true;
> > > +		else if ((!walk->ticket) || walk->ctx->no_wait_gpu
> > > ||
> > 
> > Nit - (!walk->ticket) could just be !walk->ticket.
> 
> Will fix.
> 
> > 
> > > +			 walk->trylock_only)
> > > +			continue;
> > > +
> > > +		if (!ttm_bo_get_unless_zero(bo)) {
> > > +			ttm_lru_walk_unlock(bo, bo_needs_unlock);
> > > +			continue;
> > > +		}
> > > +
> > 
> > This kinda goofy pattern too, typically in code a get_unless_zero is
> > done before trying to lock the object not after. Even odder here, the
> > could or could not be locked depending on the outcome of
> > ttm_lru_walk_trylock. This is covering individualization case? Would
> > it
> > make more sense to move ttm_bo_get_unless_zero before the try lock or
> > is
> > that to avoid a put on try lock failure + continue?
> 
> I guess this is still a remnant from the old code: ttm_bos can't be put
> in atomic context, so we'd had to unlock the lru_lock to put ( which we
> still do). However, without the restartable lists that we have with
> this series, list traversal would have to be reset.
> 
> If we were to change the order of trylock and get_unless_zero now, we
> could do that, but that would mean unnecessary refcounting and dropping
> the lru_lock in the case of trylock failure.
> 

Missed the putting in atomic context not allowed. Seems fine as is.

> 
> > 
> > > +		mem_type = res->mem_type;
> > > +		spin_unlock(&bdev->lru_lock);
> > > +
> > > +		lret = 0;
> > > +		if (!bo_locked && walk->ticket)
> > 
> > As above could you explain the ticket usage a bit more?
> > 
> > Also you shouldn't need to check the ticket here there is !walk-
> > >ticket
> > above which triggers a continue.
> 
> I hope I explained sufficiently above. Please get back otherwise, I'll
> remove the walk->ticket check.
> 

You did explain sufficiently.

> > 
> > > +			lret = ttm_lru_walk_ticketlock(walk, bo,
> > > &bo_needs_unlock);
> > > +
> > > +		/*
> > > +		 * Note that in between the release of the lru
> > > lock and the
> > > +		 * ticketlock, the bo may have switched resource,
> > > +		 * and also memory type, since the resource may
> > > have been
> > > +		 * freed and allocated again with a different
> > > memory type.
> > > +		 * In that case, just skip it.
> > > +		 */
> > > +		if (!lret && bo->resource == res && res->mem_type
> > > == mem_type)
> > > +			lret = walk->ops->process_bo(walk, bo);
> > > +
> > > +		ttm_lru_walk_unlock(bo, bo_needs_unlock);
> > > +		ttm_bo_put(bo);
> > > +		if (lret == -EBUSY || lret == -EALREADY)
> > > +			lret = 0;
> > 
> > What is usage of these error codes?
> > 
> > -EALREADY means the resv is locked with the current ticket, right?
> > Wouldn't we want to call process_bo in this case too?
> 
> No, then we might evict our own working set. Processing of shared bos
> is handled as before with ctx->allow_res_evict.
>

Ah, yes. Makes sense.
 
> > 
> > -EBUSY I need some help figuring out.
> 
> -EBUSY is the return of ttm_bo_wait_ctx() in case we're in no-wait-gpu
> context. Like direct reclaim. If the bo is then busy, we simply skip to
> the next bo. If process_bo() waits for gpu idle using the above
> function, this is to catch that error code.
> Should probably add that to the process_bo() docs.
>
> > 
> > > +		sofar = (lret < 0) ? lret : sofar + lret;
> > > +		if (sofar < 0 || sofar >= target)
> > > +			goto out;
> > > +
> > 
> > Here we have dropped the BO unlock. What prevents the BO from being
> > moved back to the resource we just evicted it from resulting in sofar
> > not being accurate?
> 
> For eviction, the byte-count is not used, but rather the success of
> allocating the new resource.
> 
> For shrinking, any process could allocate what we just shrunk, and even
> so shrinking does not always mean that the memory is immediately
> available so the byte-count will always be a rough estimate.
> 
> A related question is "what prevents anyone else from stealing memory
> that we just evicted", and the answer to that is "Nothing... yet". The
> exhaustive eviction part handles that with drm_exec keeping the bo
> locks of evicted objects until we make progress. Eventually we'd hold
> enough locks to block all other competitors.
> 
> Unrelated to this patch, me and Christian had a discussion on whether
> to unlock those when we made progress in the sense of
> 
> a) A validation succeeded,
> b) An exec submission succeeded.
> 

Thanks all of the explainations, makes more sense.

Patch LGTM aside from a couple of nits, with that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> /Thomas
> 
> > 
> > Matt
> > 
> > > +		cond_resched();
> > > +		spin_lock(&bdev->lru_lock);
> > > +	}
> > > +	spin_unlock(&bdev->lru_lock);
> > > +out:
> > > +	ttm_resource_cursor_fini(&cursor);
> > > +	return sofar;
> > > +}
> > > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > > index 6ccf96c91f3a..8b032298d66e 100644
> > > --- a/include/drm/ttm/ttm_bo.h
> > > +++ b/include/drm/ttm/ttm_bo.h
> > > @@ -190,6 +190,38 @@ struct ttm_operation_ctx {
> > >  	uint64_t bytes_moved;
> > >  };
> > >  
> > > +struct ttm_lru_walk;
> > > +
> > > +/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
> > > +struct ttm_lru_walk_ops {
> > > +	/**
> > > +	 * process_bo - Process this bo.
> > > +	 * @walk: struct ttm_lru_walk describing the walk.
> > > +	 * @bo: A locked and referenced buffer object.
> > > +	 *
> > > +	 * Return: Negative error code on error, Number of
> > > processed pages on
> > > +	 * success. 0 also indicates success.
> > > +	 */
> > > +	long (*process_bo)(struct ttm_lru_walk *walk, struct
> > > ttm_buffer_object *bo);
> > > +};
> > > +
> > > +/**
> > > + * struct ttm_lru_walk - Structure describing a LRU walk.
> > > + */
> > > +struct ttm_lru_walk {
> > > +	/** @ops: Pointer to the ops structure. */
> > > +	const struct ttm_lru_walk_ops *ops;
> > > +	/** @ctx: Pointer to the struct ttm_operation_ctx. */
> > > +	struct ttm_operation_ctx *ctx;
> > > +	/** @ticket: The struct ww_acquire_ctx if any. */
> > > +	struct ww_acquire_ctx *ticket;
> > > +	/** @tryock_only: Only use trylock for locking. */
> > > +	bool trylock_only;
> > > +};
> > > +
> > > +long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct
> > > ttm_device *bdev,
> > > +			    struct ttm_resource_manager *man, long
> > > target);
> > > +
> > >  /**
> > >   * ttm_bo_get - reference a struct ttm_buffer_object
> > >   *
> > > -- 
> > > 2.44.0
> > > 
> 
