Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137F7B1EA75
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 16:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5481110E948;
	Fri,  8 Aug 2025 14:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AuExlcIb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB3E10E967;
 Fri,  8 Aug 2025 14:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754663896; x=1786199896;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ACsQP2VwoooJyMPyFSFmiRMmx8ydBYbL0uHQoeJiZkY=;
 b=AuExlcIbLKgjSY92tTHLdxBT7zmjgMC8wXxx6qYTDBL1e//QUpjghux1
 I3QyDNj6t5vXk2HHB0SLKzSirkFjfMjUH1tkEzWkxohtFEvo8P9l59nlx
 9cGQT0GJ3oglJMELSyGW0rHwm9nxLhc2PXrY4kdcyWxEi6Taclk9O6rmI
 qy6DUvATh/HsQWiv4AFR1/KwLZ5ZnF+8jmZN7vN3gnh96D9sPBg4DODUE
 AbogGUoIHjU1Wz9hHSs41bLFT2/Iuuxssj+pupjqFn0BnyV+qMONmVwAd
 sv0D2DewEyDTpBgsJy1FImiNqhCf6iVsaT60CsOSY24cN1uvrnLrXQ56g A==;
X-CSE-ConnectionGUID: Ar32Qd3GSTevXCTk7viw6w==
X-CSE-MsgGUID: rKxlOVjoSPyudx+Slzup1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="57092333"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="57092333"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:38:14 -0700
X-CSE-ConnectionGUID: hxsLkrk3TjKsggGc198g+w==
X-CSE-MsgGUID: QWeIB30rTT+do8UG6xkL7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="170593108"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:38:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:38:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 07:38:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.71)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:38:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTtBX7ZIxC4BpEgv52AU4Ddc3xsyMQiV7n3I1E0bfcz7O1Awj5yb8MCfEpWFYzBxSHKJ7o1DrKqiCYXlHuq2euDw1QSV03Np1R95AFZKamgw9hmHAPm1wwOVXdAzWJ0n40NW+Bs3fAqVf716MQHTwCbTUDw9qEL2kDaOxTFTOxNdjVaUns6TdQDr8tBrHs5s2D0ebByXPMkSZIb9t326hIr/9iv8mIJNhU8GC2e314Qe8uErgMU5n59QGJjEfy/Mn2SY3mD5Yd49wiudo3gbUdczYQgROoLD4q3tQ1p9SGgut8AjVevM0GafS2q6zd5kUKc0n/B0gitrOFHwuHNleg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDySSsnouwBvjQZ4z0O0sdrnv2eb31b+kl0OJiycuxY=;
 b=X3xeuYZRuceR6NEqEZngU4+dJrPupEHA7+JTRTtuGSCGF8yn8xJdkrhQdoyniZ9e7+Fmo9WRR+6aveXdJPaWNDMNjTnuawIwavZpPRrJElfyxLvU5W0PZfRlBUPo0xSZ6GhlKU7heRC80SJe2k5GXZZJKrjn7nT8UJZMDvcEDmIJd9RwZVtVYD9n/DjcZYaISbD+Hni5dw3HaFZtsMsu7ceRdIEAiomMO3yOwPN+U1DctHcQowIwqGLRsSqZlz156ho1euS4AabMbBzHdyt6hsqM4//e54Csy2FnvWqsDktDXrnK2w3EF5katxz6wSrjcnRBE+1Xptl6R/MOosqBpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN0PR11MB6036.namprd11.prod.outlook.com (2603:10b6:208:377::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 14:38:09 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Fri, 8 Aug 2025
 14:38:09 +0000
Date: Fri, 8 Aug 2025 10:38:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
CC: <joonas.lahtinen@linux.intel.com>, <tursulin@ursulin.net>,
 <jani.nikula@linux.intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <mairacanal@riseup.net>
Subject: Re: [PATCH 3/9 v2] drm/i915: Change mutex initialization in
 intel_guc_log
Message-ID: <aJYLzcsZrohQlW0O@intel.com>
References: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
 <20250807170212.285385-4-luiz.mello@estudante.ufscar.br>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250807170212.285385-4-luiz.mello@estudante.ufscar.br>
X-ClientProxiedBy: BYAPR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN0PR11MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: edb5b9b4-2a60-4c56-da60-08ddd68931f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UhI2hDgXpHQ2mf7IZ/zjRmd9KWt2cCje1Zdjp2JZcHo50Erm0iqGVlaz6O6X?=
 =?us-ascii?Q?Fx/DG0GkhZ8k2XqGs9H3PNytf2zRcyb9e/qdyDPJt9njXWyeQen3XCKDK/Rm?=
 =?us-ascii?Q?I09UD/11qZM4MmSyDNcgahnHvxVFHDXjceZzqwjcRxhjO2zwQE5cT9bFyg5u?=
 =?us-ascii?Q?NVy5cUS0iGIfCcsDmXGyYSQCJ4XcqTMrR1hmjYSLG+1UnRFobZID+QbQnXzt?=
 =?us-ascii?Q?0n3y5MMF+BjCLw3Lj+ZWwS8K2s2FtbGhdATrkvSeZu+tU7rt3PQiAC2X+JPi?=
 =?us-ascii?Q?qttfaj7wEjClq+p8XbGGpGcjD5lnWrWUXixoZ/ukv12Wn9IMqkI9NE9thJRe?=
 =?us-ascii?Q?0BGTza9oEfjClVmGR5XQVhSkMQ82pZZ103Y9bbuTbGVeafOtzmOx5HgNoXVB?=
 =?us-ascii?Q?6Nr3MBFdIutIj1wnkxI3cG0/wrbTKEu+5hqRPoKbwTfAcsK+E+f1rbAlHkrY?=
 =?us-ascii?Q?0cL5KkzjoNsB34NBn+k0qTqyfRFLoA20WmKyYJOHqqf4TcJCD/IXz8Ztqm5O?=
 =?us-ascii?Q?d09g445mDorRamapg6U0zHkUMY1sD+93wVaRu75qzdkw7B4uyw2sywGa0a5f?=
 =?us-ascii?Q?9pcuo3Thx9DImGC17z30TwYl+k/X9dQxhqkfP66KbzfzzQQoYRR5qtVkER7R?=
 =?us-ascii?Q?zlAjrjP7HIJpgLok8EGvsoSSugYv9sEs/4epo6t6wGJAtEEbQ+PZvaMhvm91?=
 =?us-ascii?Q?djBELL9J373/mVfzX+jwVCnyDO2FDYdIqkQBB0dt0h5mpKFuDd/VDq6KcMMQ?=
 =?us-ascii?Q?H0wOiXNiVi1g4WUEMgv/aq8mlK2Z9yXHt2KKx4qO9FXSk9kKVZtgkJZ/da0d?=
 =?us-ascii?Q?XpYpwSRayNSjJOgXM4nFL7ZXUPm3O0wu5S5QUXidXs0F0AcZHager5Rbgh1k?=
 =?us-ascii?Q?OyyaJ6kUppDuEEx1c6FRTupIR8l2lHKGOQ8WofhjTnUeyUrEDAV1BpL7Ys6H?=
 =?us-ascii?Q?+1V94dTKhFG86WeHf+0itw9if5lIVj/0bEjZ5pS+ayiaOBCVxL2/fJcrhm3l?=
 =?us-ascii?Q?wO2fOUmqxDgm6H5dU4A/6HL1U2sbA3em8yBOpdHqIM1g1PGc8NpUUNIiBE2v?=
 =?us-ascii?Q?05TE1vTlMv0/WLD0W3f4hUg0ZNsYijP/M7g2R0Xi4/VpLCNHQ5n979v3V6Xl?=
 =?us-ascii?Q?wsZ11hSzTcDNI52gpomz9TO7tDmeQBcbYHtOQTfjw/m5V2Lz7gNRz6F0OSP/?=
 =?us-ascii?Q?os/r/36r4xUDiXDoYa9aVrNwKn9G19/GNN7pkYr9552WeBJX61mun/XGalND?=
 =?us-ascii?Q?IGRvfEGq4SpliB+WSyA8ryH/b+7b6ZS4Sm3E9tTFefwxP7t4Dev1i1hvCFJe?=
 =?us-ascii?Q?QS0FdtY9iFpvBg65G4KahfkD8xISCqcYaE+rcUXx64GquHFGu35RbIIqF+0e?=
 =?us-ascii?Q?71BEtJqDPN2EPcWBa3RBiiAXvyfxx5yp6hfminvvvxHPiPCGOdvR+cUJGtCd?=
 =?us-ascii?Q?n5X8ZBSCp28=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hHuZ46QrKNdIM95S2M23FWabwzGv/amALhX5S7a5Q4kAvNSSnpEoKtuwSeHH?=
 =?us-ascii?Q?6HJ94W5A/mjBBQKnp7CvKHQDJVZSoY7trXKJNyI1xFyjZVUtbuMrPXTuIMfI?=
 =?us-ascii?Q?ZByDiLGBedekfcpmttrmKpBQK1I8hRyE/x9n30BIYzQVzMehDg+goTf+ZK2a?=
 =?us-ascii?Q?ig+qlmxVP6COK1N7She0Jb1YKmf7HtGTgo7ST/Xveok2gP/AuuoV67ygJbcG?=
 =?us-ascii?Q?YoBtdIaj6XfoCtfAVmQkphfyLeQpwT7tNe2yjOKT0eTPsGffED5kawf8VVPt?=
 =?us-ascii?Q?4FTHWgUGlCqFVPFFxUWSACjnHUepX7uRYjoJnL3P4hjrKmRyP6k5UpkGFsvS?=
 =?us-ascii?Q?K3kJCPWaaDXgelU8x1zpvZRUC2dv0JcPNlhuE+Q+NnTmWs36xGieHSUbNtv3?=
 =?us-ascii?Q?BQPgeIGS56Ubu9ovsyhhPEkOoG5d4IQWwiVA8QMG/l147QQ8vQARr9Pb5YZ5?=
 =?us-ascii?Q?h0jpDSsCDiGwHBbXLWoQ9HgAy+pG3gvhUrn2BP4AS2nrg8iZLvLRf8lnkwjU?=
 =?us-ascii?Q?VsbM76i0MY1W1ZZp3liZAOOtW66hTjVZlSa4Oy8I9ULbskcoXG4tf2KVzp9G?=
 =?us-ascii?Q?Vbgqff8iQdlcZoYc3bXI4a138tV9r3AwViTUVUJOZD//KtULWvo0j7C2zTr1?=
 =?us-ascii?Q?m0ISDh5DGImEW+MJrv2EuIeCgLIY4+FLr1HRmyH3ew2p8TiDOQYypX6qQHVU?=
 =?us-ascii?Q?mwuZygxZy3og7uuoscm1pujKJEEwONn77AfuOtlSJov0M84AARww9EC1j7h/?=
 =?us-ascii?Q?Ck1Ns5PO0fXlA20zLxgEq9xN+hYD8ThEvw116++zM2NYKDHrLk2GwRmjht2T?=
 =?us-ascii?Q?fZc/7rlg/UNoP7xjc9VvjEsywhGXc329Qm0QF5DXMD/fCE4CTCanKW+Ql28q?=
 =?us-ascii?Q?OX1vY9a6xPsmUhd4E3urMQnCKDeYYYB1DmH4Ucpd72ikfULgCphWcOo9yjFp?=
 =?us-ascii?Q?7t3bkK2yjs49l71FjEF/HNQESfURKOOSVdrtrwoRNrxsC50KilO2v7AySNvs?=
 =?us-ascii?Q?xdNSPMobq39d0J1sp9VmIATmcZpLG9pKat43J57rXX7vJpG624Y91rivzL8M?=
 =?us-ascii?Q?mUcncL734tOZXPYdfEqV3T+k2TUHs9WKR8ZTH3oHy0a7a02skDESvR0xBi6r?=
 =?us-ascii?Q?GgMz0TstT3GCgXcDg62F/d670nxHekMs+RXWbw4mRX2iGkXDfh02BProGqpk?=
 =?us-ascii?Q?Lw1ciMitL0z0GEugdHoS2bhz40t6tJ5ZrYcI5Ja7OHHXc8bCnp5gesBXgG2A?=
 =?us-ascii?Q?WrFlBOLIgTvSNwK8hO0gEEs0YW+W7hEXPtHM/Ao72ZQregKCajVM2ytnvK6V?=
 =?us-ascii?Q?oj1Ir9L0/3H5+lk/FPZoRZ2Il+MaKDje89YnYGXunZpqnxtN/fj7/aaEMJ/E?=
 =?us-ascii?Q?abjLPMWt9EPbRlw6au9eRFTKhjh4H4rL+QZtH+z+PBkMY6kIN7uHWcyEBVgP?=
 =?us-ascii?Q?pdYbYg12lf4htQGTs6eHNG+paT34YWcU8yT72ir0u/poP28NuOIBZWwNyfpB?=
 =?us-ascii?Q?QzToFQc6nLV1P+9jF8LOrLhR7ZO5H8Ol/xLOcz1EKxsNx60V69cGOBQyH6co?=
 =?us-ascii?Q?25pJd3SEDAuhxq7SlDDYMWA+iG5Wlw4wA72pLmhHRzcun8k7wa4kRNTok9uE?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edb5b9b4-2a60-4c56-da60-08ddd68931f8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 14:38:09.5499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBfTzWJNm+6ZphLtx6Fv839F2C6I6f10aM613QkDZby9W4p++5IDlA9BnCITtBPrLZWPiTY0VM55PADd7VxQOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6036
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

On Thu, Aug 07, 2025 at 02:02:02PM -0300, Luiz Otavio Mello wrote:
> The intel_guc_log->relay.lock is currently initialized in
> intel_guc_log_init_early(), but it lacks a corresponding destructor,
> which can lead to a memory leak.
> 
> This patch replaces the use of mutex_init() with drmm_mutex_init(),
> which ensures the lock is properly destroyed when the driver is
> unloaded.
> 
> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index 7135fdb0ebb4..469173791394 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -6,6 +6,8 @@
>  #include <linux/debugfs.h>
>  #include <linux/string_helpers.h>
>  
> +#include <drm/drm_managed.h>
> +
>  #include "gt/intel_gt.h"
>  #include "i915_drv.h"
>  #include "i915_irq.h"
> @@ -512,7 +514,10 @@ static void guc_log_relay_unmap(struct intel_guc_log *log)
>  
>  void intel_guc_log_init_early(struct intel_guc_log *log)
>  {
> -	mutex_init(&log->relay.lock);
> +	struct intel_guc *guc = log_to_guc(log);
> +	struct drm_i915_private *i915 = guc_to_i915(guc);
> +
> +	drmm_mutex_init(&i915->drm, &log->relay.lock);
>  	INIT_WORK(&log->relay.flush_work, copy_debug_logs_work);
>  	log->relay.started = false;
>  }
> -- 
> 2.50.1
> 
