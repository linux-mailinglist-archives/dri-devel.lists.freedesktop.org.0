Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8A7964AC4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 17:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DE510E71E;
	Thu, 29 Aug 2024 15:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7Rtr6Vx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85D910E71A;
 Thu, 29 Aug 2024 15:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724947061; x=1756483061;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mCDP4fFtO7r3H0M3FGovmoxl0gWUYq/HZlEvpwAykjA=;
 b=e7Rtr6VxySCfpbZ2Xt6mt0HTtzmAy2tkOcXXxXHaOmMJsXqoZFgiiSO5
 7A9Wu76su+wJTBe4+O4bm3pm3GSlCM1sUuQRq51kf3v/vjWXmROYgMW9E
 sT+r2NnYdwbKty0D8TQianksE/IHsbEMAe3vSQySB8KKVVj9TaJK12sgd
 Dd34I4skpZtwipFcwSHgoWxZTFGz2xaUD7kFbFs4ZWVahc1QF0z/ZI20g
 FjPx1e40hmSLxcKK3pvX6jd7+Y5kiTFqJ3W5rgE6kEe4Izjsc29AduVmg
 rW5/o0hFpto0eYUWcKwFZvykedt8qO6jlayA+w+jNwjHOzy5KeHnUtY8R g==;
X-CSE-ConnectionGUID: KV0tUU6zTNa0lnOWozG9Zg==
X-CSE-MsgGUID: 8+YcGFyCTHSZs8j0cRqVlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23681479"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="23681479"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 08:57:32 -0700
X-CSE-ConnectionGUID: 4uMv/K1YQNC4IvAhMovaOw==
X-CSE-MsgGUID: mdWfd1cYT9GRx14DGiOAQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="94360385"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 08:57:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 08:57:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 08:57:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 08:57:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+e+9RCfaAJN6lK05bK6qorHiMvDb7Gm/e7UkusxkTkNDbMvFY4sqeoBMnkg0iKkL5FXkk3OcgACtOJBh2EQaF5+y2c7/sJig3ow55QmQJ5XqYLpJocFoBswkX/f6DGgdM6ts5an9Y9H8C4Aojdr9vg/kL6OFL36KVrmaVdewYe9nPA0Utf8EGQ0DvJqmVcJ1bLmJM12oc+CHR4kCNeACFWeNnDc200VN07YJufv9pNfXDedqV2QAzUHNi9dJxKrhJlwIHDYpKMNKwp/eVxnb3o2iiuOMWaDGgyGMj9KVFBBM13zQ3N/k8mE4SOFV2miNxh/+AaKnZuwW9mRqKrWhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEtJh6cIu6jE/QRg6vxKNyCKlzwBAqwmgAyGlHwS3NQ=;
 b=jr1WU6zt6PV9aIJuJP8Wm5K2K+gFmBdmJJ0/oGnhwUkDQF6WZpazEd+ps5BVg9M9pB88Jec+vFMMmcJ7QdOqGrFNHJx/rn9JAkEVqDCCl9NbJwPcBpJKQb05O4KZvcRUptqIynXEKMjO7VILtn9j4fV2mwQ5OO57AVO7qhn6CMScrKKN+SsM6OqqMrHZGrNZ2J0Un2Gn2bxYZftSaIt7Gp9aIz7kn2wuO0oAC4YEi0ME3Ir971WQO9JT0SMqngnCM2dVnMp5ay4e438bGPJKkUwy3osdKOca7oyDaUKD7sQIQpyUkpFEK6N/G9u/jaIaJ1we2eQMKd+pWKMB0dcEUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8364.namprd11.prod.outlook.com (2603:10b6:610:174::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 15:57:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Thu, 29 Aug 2024
 15:57:23 +0000
Date: Thu, 29 Aug 2024 15:55:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <matthew.auld@intel.com>,
 <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 24/28] drm/xe: Basic SVM BO eviction
Message-ID: <ZtCaDBtsInEif/E2@DUT025-TGLU.fm.intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-25-matthew.brost@intel.com>
 <ZtBKHT_vuNfE5Y5j@phenom.ffwll.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZtBKHT_vuNfE5Y5j@phenom.ffwll.local>
X-ClientProxiedBy: BY5PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: dcbc491f-bcb9-4913-6cf5-08dcc8434573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bz7RFMAUb9D3ioC/cz1REt4vCExJZx50DOF/TvVWpwuuHA9YPe/OHcFYBJWh?=
 =?us-ascii?Q?aEVXDI4f7l/duwSPjLnYqD9TfOgs2qqs7w22EtnbL3bZddMFf3jhR0ZvjvxE?=
 =?us-ascii?Q?ze/oQ34U/K9H4cGnXvaykY4zjhB/NfK4IERwnTYfjXxkE6MZoX5zAp7L4MiM?=
 =?us-ascii?Q?Rt22O+4qoP4hzyOYIMRAvbIwWsl1ncFaTkDW/ug+xvnkbhwBSgH18ekZIpdC?=
 =?us-ascii?Q?Kml+ikpmrCFoomgZuMMRI9HFkGlpwSGToJHlgW4yamdvU4FMLKB3qru8aoO1?=
 =?us-ascii?Q?PIzp9nS1c3LKT43QDOIjsc3g89VcfBwc61XqlSzgYofnvsjwcOROw9I+dpI7?=
 =?us-ascii?Q?d4xxYgBN9mRB1cO4Q6mAw3j1ycyx2jFc4WqIi6jOMpREeS1gB3ivNOS62sme?=
 =?us-ascii?Q?8OEPVW02kogVs4qOQjmgeeVCKnyRNP8H60mYzU8UXWAw4aRwfFOO0HJ6OxDD?=
 =?us-ascii?Q?OEq8si61K2AQG4ozkw5GEf464PJgUeUAu3B/Sy/z7FGyR/C11i4QGyftQn5i?=
 =?us-ascii?Q?ic3keFGlpLZ6eRYWEuF5z1H5HveG8qu3X2x2/FJ1Fu9jt8o/Ql9Tai3MfNRQ?=
 =?us-ascii?Q?FkSvskkJC87b1n/SkCyC4zrkt5FOpPi0ZwLt66uk5jblEw7mZMPjLhNEr+IZ?=
 =?us-ascii?Q?TQkQbU3eHtc67cWb0tphKlIdftYLRwhzBa/GIMcVI5EwDs+vPeSDMb9gVGQ/?=
 =?us-ascii?Q?MLEvZQQom6pCkJkdphccJ5Ti54Kzaq2oxfsLImivx+dXvVSXJ3B7RrOTexEC?=
 =?us-ascii?Q?OzTjE5pn7O00dzhMC7BL3fyx1JIjNmsTpoXSlq4v7eMbFkYilR0WnupS0/IG?=
 =?us-ascii?Q?Ysm/kvv8VWZbXjQi1+o/TWwvhrLmn1kMujIvBMX1TnwH4y0TpK1Eb2TS3PaO?=
 =?us-ascii?Q?8CY6fXPDevdu1bUQTiACj2KOWotacRp17Z1j0BPmuNyvyC/yDL/fc+ACoUE0?=
 =?us-ascii?Q?9asLEIObkIY9qejSpCEPBtY7rVWx2Da0DwtFIPuorW24VhVQm9O8zhICY9lk?=
 =?us-ascii?Q?peBTlGgLa2kJmSB8nYr3SRJtNyJcg8HjdXvOt1icFt6Jh6YhFYlNsESB019Y?=
 =?us-ascii?Q?QajvoVKn8nEn/0FVOVwXxu77UD3yvkMLcrXx3SYCA3PbVP8qPpFNJMy/91Bk?=
 =?us-ascii?Q?etAbd9T6QadYaBEWRDor+N2M1ubyVo+/Pn4sjox72kAoYe2LN/A9fsJ9EY7t?=
 =?us-ascii?Q?aNTrXBQV624Jo9f3RrAKzRIuHGZ7dssyWR8D+3iu4lqfJrhyq+TX8pFrApNO?=
 =?us-ascii?Q?bU1o7DocV8+Y1ALvxS6nwoBDzzDhlk6nGYZ6SNwgtYqVOQaxXSffwKf4lKU3?=
 =?us-ascii?Q?vWg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/nhXnecf33QoKL8xQO44kqwdt9mXJMZyt9NZY0FcwFWWo1Tv9Bg0mm89crhe?=
 =?us-ascii?Q?Y3f06QlgMBipzO/85xC+0kW94bjV/ljIyU/96TBzjJ9NBzUtoEMqFtAKCaDx?=
 =?us-ascii?Q?kBtRsy9nT687nPhvJ+w1pPhjKmDgOQAEJuL343FrBKaEFpWKRWXEZOMSCyPZ?=
 =?us-ascii?Q?PC7RxfdRowy/oHfTQUV4ucoClx/tFL9KLatkM/QBst8zDaQaZ6H9dZOzqrPW?=
 =?us-ascii?Q?TN8NZonE+yajUviYi6USFOhtFvkzS25rhthBt0fheKqkTHrlb22jOsSUVgj1?=
 =?us-ascii?Q?FVUy1OW7pNQybFdeZdbFQnY4uw07s4irBOoAeqWzFao8rZ0UHfa9y44Qpc5s?=
 =?us-ascii?Q?jH+fYCIu9S8a33L73CU+7e+dQ3+yrGnL5jvyP2s2yivucAd2Q4LT30nbVmO5?=
 =?us-ascii?Q?LU/XJ8+bNtnEAxegC4Sl3yCECsqD/qBbPdd9g5wzmAYm8ZfCyUbtMp0hqYAA?=
 =?us-ascii?Q?jrrs7sn7t6YUgIambnUO8acEULtDU7YnEEJPFSs4MLWBgY206vDUNgWGPhNQ?=
 =?us-ascii?Q?Y+jUfIjN+gjsfDNpWoLbY9JMehAYrLdgtk7uxdP4Fu7s4hVdLODAXB640Ujc?=
 =?us-ascii?Q?ARtG7620MibK069jEqEXjxLr8471iAgzpYdhwSAF5GcwjPFgkSE7FW4SkK9g?=
 =?us-ascii?Q?Ei/D4X3uhe/m7TgwUHCLEL2gx4v0NN8NZIQV2K/HDxDM1kE88XAWx1Zp8qxE?=
 =?us-ascii?Q?LWZD+dyEiPYxjDNqay9luXEFlYuh+0GLVpf8ScKV42OGge6Mbu7vDxJOqfsz?=
 =?us-ascii?Q?x1Xmsms4xCzpd8DZzBQv60z7zb7k1Beu5FK69lemcASiQDwlyXcUzNEcz4VR?=
 =?us-ascii?Q?nlCxdoV+noHkxwEdmMUyM7cxI/VKRHg2Em115+U1Yu8cypbs2GwNuKwST5BX?=
 =?us-ascii?Q?L05Sl8GeUz2w3lXG8Uwl3hzzTYpCe+Sisxindmn62C/8Vm6Ly/53UYG1GD4t?=
 =?us-ascii?Q?PyBpkQRpqv5l+tEneC8D1WQ9e0JK/rrxWqQrO3x8So3R9z/wADWqqsBh5qiH?=
 =?us-ascii?Q?UGKl81VFBg9yiSIn580uYEjtqeyfPiXaosXsE79KqYXk7GOpzDY1dmu8mVvz?=
 =?us-ascii?Q?DuXA80AP9ZwiM/sNaFkduIvY6JYtUGkGUH0t6L8Rh/BGI2kzDNLWzh902Gwd?=
 =?us-ascii?Q?trjBo17YU304SjeowYKN4dL7fr0pW6xOSjBaRFeNANqnrHNs15pY3Ae6JvTF?=
 =?us-ascii?Q?oxHCcsFf+tnGBIOpNsjE40YeFZYUl7CQFGl0ummDCF7lfTjQgdFPEpjQDghv?=
 =?us-ascii?Q?6VMF7gQb395jCJL6JmT/eR8WvwThOHcmfIqU7OHvi1KndtGStO5UHcEnyjXW?=
 =?us-ascii?Q?GEvBOer5ph+g0E9EHWtleWltwicmVuXNi7aTaKcLRJhUYSknJosG82+gBeOO?=
 =?us-ascii?Q?8hhPW60M24yUcyGzzm6/re5REGJp4tF4Ops2SkgPV33Xin8NvvnDt4RVbSp3?=
 =?us-ascii?Q?SsBs9/zfQiVA18LXSbxDUtbtXE0in1G5lXLubyoTTmKjmlCW35k3MRZKiybi?=
 =?us-ascii?Q?/kNVo+a+hRvvSaMh1y255gwpDDqMdCDvyCIlsyrI2NANMPaTDzE36VSxdG8X?=
 =?us-ascii?Q?TNW/uoyYkpP1FcukZta8UvBV6jJGqPxMcECvXg02k+8GWM819dNOj4wadm+a?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcbc491f-bcb9-4913-6cf5-08dcc8434573
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 15:57:23.4659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6DMUH4k54PWk6kzzhuNUrV5qc1ru1gNKnXIwqfSA3FYCJ1/1d+d2BywWBfzEHpjc6uHHax8ERgmG65FEpqNyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8364
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

On Thu, Aug 29, 2024 at 12:14:53PM +0200, Daniel Vetter wrote:
> On Tue, Aug 27, 2024 at 07:48:57PM -0700, Matthew Brost wrote:
> > Wire xe_bo_move to GPUSVM migration to SRAM with trylocking of mmap
> > lock.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c       | 35 +++++++++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_bo_types.h |  3 +++
> >  drivers/gpu/drm/xe/xe_svm.c      |  2 ++
> >  drivers/gpu/drm/xe/xe_svm.h      | 13 ++++++++++++
> >  4 files changed, 52 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index ad804b6f9e84..ae71fcbe5380 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -25,6 +25,7 @@
> >  #include "xe_pm.h"
> >  #include "xe_preempt_fence.h"
> >  #include "xe_res_cursor.h"
> > +#include "xe_svm.h"
> >  #include "xe_trace_bo.h"
> >  #include "xe_ttm_stolen_mgr.h"
> >  #include "xe_vm.h"
> > @@ -250,6 +251,8 @@ int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
> >  static void xe_evict_flags(struct ttm_buffer_object *tbo,
> >  			   struct ttm_placement *placement)
> >  {
> > +	struct xe_bo *bo;
> > +
> >  	if (!xe_bo_is_xe_bo(tbo)) {
> >  		/* Don't handle scatter gather BOs */
> >  		if (tbo->type == ttm_bo_type_sg) {
> > @@ -261,6 +264,12 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
> >  		return;
> >  	}
> >  
> > +	bo = ttm_to_xe_bo(tbo);
> > +	if (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC) {
> > +		*placement = sys_placement;
> > +		return;
> > +	}
> > +
> >  	/*
> >  	 * For xe, sg bos that are evicted to system just triggers a
> >  	 * rebind of the sg list upon subsequent validation to XE_PL_TT.
> > @@ -758,6 +767,17 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >  		}
> >  	}
> >  
> > +	if (!move_lacks_source && (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC) &&
> > +	    new_mem->mem_type == XE_PL_SYSTEM) {
> > +		ret = xe_svm_range_evict(bo->range);
> > +		if (!ret) {
> > +			drm_dbg(&xe->drm, "Evict system allocator BO success\n");
> > +			ttm_bo_move_null(ttm_bo, new_mem);
> > +		}
> > +
> > +		goto out;
> > +	}
> > +
> >  	if (!move_lacks_source &&
> >  	    ((old_mem_type == XE_PL_SYSTEM && resource_is_vram(new_mem)) ||
> >  	     (mem_type_is_vram(old_mem_type) &&
> > @@ -1096,6 +1116,19 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
> >  	}
> >  }
> >  
> > +static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
> > +				    const struct ttm_place *place)
> > +{
> > +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> > +
> > +	/* Do not evict SVMs before having a binding */
> > +	if (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC &&
> > +	    !xe_svm_range_has_vram_binding(bo->range))
> > +		return false;
> > +
> > +	return ttm_bo_eviction_valuable(ttm_bo, place);
> > +}
> > +
> >  const struct ttm_device_funcs xe_ttm_funcs = {
> >  	.ttm_tt_create = xe_ttm_tt_create,
> >  	.ttm_tt_populate = xe_ttm_tt_populate,
> > @@ -1106,7 +1139,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
> >  	.io_mem_reserve = xe_ttm_io_mem_reserve,
> >  	.io_mem_pfn = xe_ttm_io_mem_pfn,
> >  	.release_notify = xe_ttm_bo_release_notify,
> > -	.eviction_valuable = ttm_bo_eviction_valuable,
> > +	.eviction_valuable = xe_bo_eviction_valuable,
> >  	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
> >  };
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> > index 2ed558ac2264..4523b033417c 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -16,6 +16,7 @@
> >  #include "xe_ggtt_types.h"
> >  
> >  struct xe_device;
> > +struct xe_svm_range;
> >  struct xe_vm;
> >  
> >  #define XE_BO_MAX_PLACEMENTS	3
> > @@ -47,6 +48,8 @@ struct xe_bo {
> >  	struct ttm_bo_kmap_obj kmap;
> >  	/** @pinned_link: link to present / evicted list of pinned BO */
> >  	struct list_head pinned_link;
> > +	/** @range: SVM range for BO */
> > +	struct xe_svm_range *range;
> >  #ifdef CONFIG_PROC_FS
> >  	/**
> >  	 * @client: @xe_drm_client which created the bo
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index fd8987e0a506..dc9810828c0a 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -531,6 +531,8 @@ static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> >  			  range->base.va.start, ttm_bo_type_device,
> >  			  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> >  			  XE_BO_FLAG_SYSTEM_ALLOC | XE_BO_FLAG_SKIP_CLEAR);
> > +	if (!IS_ERR(bo))
> > +		bo->range = range;
> >  	xe_vm_unlock(vm);
> >  	if (IS_ERR(bo)) {
> >  		err = PTR_ERR(bo);
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > index 3f432483a230..b9cf0e2500da 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -46,6 +46,19 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
> >  	return range->base.flags.has_dma_mapping;
> >  }
> >  
> > +static inline bool xe_svm_range_has_vram_binding(struct xe_svm_range *range)
> > +{
> > +	return xe_svm_range_in_vram(range) && range->tile_present;
> > +}
> > +
> > +static inline int xe_svm_range_evict(struct xe_svm_range *range)
> > +{
> > +	struct drm_gpusvm_ctx ctx = { .trylock_mmap = true, };
> 
> So even trying to acquire an mmap lock for eviction is I think a design
> bug for svm memory ranges. It's a bunch of physical memory, you have no
> idea how many mm/vma map it and which one you pick as the special one is
> fairly arbitrary.
> 

Let me drop whole trylock this and just evict via
drm_gpusvm_evict_to_sram / migrate_device_vma_range which does not
require the mmap. I add this code very recently per Matt Auld suggestion
and agree it makes the try locking unnecessary.

> So dont, eviction should entirely ignore va/mm issues at the top level
> like the migrate_device_range function does (maybe we need a
> scatter-gather version of that instead of just a range.
> 

I needed to add migrate_device_vma_range (might be a bad name) as VRAM
may be non-continuous pfns when memory pressure exists where as
migrate_device_range only supports continuous pfns.

> That function internally makes sure you're in sync with any vma/vm by:
> - installing migration ptes everywhere, which does the mmu_notifer dance
> - locking the pages to prevent other concurrent migration or other fun
>   stuff from happening
> - then restore ptes to something sensisble when it's all done
> 
> And it does that by looping over _all_ possible mappings of a page with
> the rmap_walk infrastructure.
> 
> The only reason when we need the mmap lock (or vma lock or whatever) is if
> we need to be coherent with other concurrent mm updates of a specific mm.
> That should only be the case when migrating to vram, where the gpusvm->mm
> is the special one, and when migrating to sram due to cpu faults, where
> the vmf->vma->mm is special (and might at best have a tenous relationship
> to the gpusvm->mm). But that's the only cases where a specific mm and vma
> have any relevance to svm vram allocations.
> 

Thanks for the info.

Matt

> -Sima
> 
> > +
> > +	return drm_gpusvm_migrate_to_sram(range->base.gpusvm, &range->base,
> > +					  &ctx);
> > +}
> > +
> >  #define xe_svm_notifier_lock(vm__)	\
> >  	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
> >  
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
