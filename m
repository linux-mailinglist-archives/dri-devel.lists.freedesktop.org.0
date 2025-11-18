Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDE2C6BB12
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 22:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5520610E1F9;
	Tue, 18 Nov 2025 21:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HcnRYPpx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A293610E1F7;
 Tue, 18 Nov 2025 21:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763500337; x=1795036337;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nvfzwtQSZvDl1+avShUdBFVPn+89LPjzk+7qhKKNB6U=;
 b=HcnRYPpxqJSJFKmFe8wx5bYHpSfH+i7YknCafsqLPSD2gEr7Rm9qwMTi
 jhwALEF+qXYN96YjT23nKQPY8ZiMdmQWtMmJhiagGYaRW9hU4wFzkT2KI
 DAaR500fLHS5Rqa8d9eQlPme+V7opZ2vX28ljyeILU9R+4UE3ZyQ8mDxc
 k8J8VlMi1e8jjPFisImMWbrFe4d6qoAnI5xiCh1unIFkASBFIOUh0pTKX
 M/FjfYRhDCVlJr5UorBd8YEyZcRos9cg6ZfYAEqN7SqCPevC8ebJ+iKvZ
 uOsVLLACl9knPp7yUxFep5xH1B4P3jMkOs6vhLbs8rleL3g3rq+ViQRLi g==;
X-CSE-ConnectionGUID: s1pk3z3AQnGiXZq3RA3Kqg==
X-CSE-MsgGUID: HJ9xZwC6SNKUsN+beUV+0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76145516"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="76145516"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 13:12:16 -0800
X-CSE-ConnectionGUID: f8Pg4QfQSNa5G8WGpXMQRg==
X-CSE-MsgGUID: TkY/eV54So68cCgxKzTvQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="191300337"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 13:12:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 13:12:15 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 13:12:15 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 13:12:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsUBzbHR3Ecr7ja4YWsVNpf8yagyN/CheWMyUTtkCvLcPIWexft5ED9wKS+dav052v9XyDiiDHhYDK9jmZ8sVOSy8gkQzJhahF/Pac6zSfmNd7hM0LbqW0zx5p1LR+rxQBil7QuLbOsM3gRVdnvw5UtDR+ND80W1eCKNCJ0wJDGijq5GNYhxuM3PFDrd3b90y4W5jZR5iHO8mFtocJHKoZspDCmIjPtV0/L6gNn73LaqbXKxbIqxX3cjXGuaZjAgYG16IhAw2Hb16ARL+yhG9CJNTg5XVphfti/w1Pwop818AJkqBZwso/7K05Nw57WSUtRMwM9hnIp6vvYhOIH37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDfhwBnqnr+nzjsRhKGkgwqJzqlntplqwKxVMS7cn2I=;
 b=UnpfF3a5g0Wqk/DKKDQuQlJ+9lKjlRlikqwT4WXrfGXgi5z0+lwzZk//1ovYIjLsp3EboLzSjdLneP6O+y9M0zgDPXL7HUisCVybaGU8r2T4T/L+IsWge3e8kzF/6SmjHWynKBy9gaf8JzTI4EsjQQQsNQe35SA/ZJiVDAKXRpRjo2uvJXzn274gIWAqY3eIxtuIXfYckuQnnmtwwOWwWA2AWc76P4oadIauNAtM2dURol/HtWXTP8QlnPww1eLSMAA7ueMg+GDOs10jRE1W2xcnU2t8qMFUQoaLr3pyF8PuCM/smlQUEUinyBJ8FASsVEjvOmpp/15AI9jl617FGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH3PPFF8B8D6872.namprd11.prod.outlook.com (2603:10b6:518:1::d61)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 21:12:08 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 21:12:08 +0000
Date: Tue, 18 Nov 2025 13:12:05 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 1/7] drm/sched: Add pending job list iterator
Message-ID: <aRzhJVSNISsoYeUb@nvishwa1-desk>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-2-matthew.brost@intel.com>
 <aRfWm7zRm3UodJKX@nvishwa1-desk>
 <aRyyaDdnDa5Ow3cI@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aRyyaDdnDa5Ow3cI@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0056.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::31) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH3PPFF8B8D6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f878400-fa47-4e19-f8b8-08de26e721df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oXIfM32BgvokzxPFyaudrhKdTmtyt2ki67GNHeeU2YtuSswsAXqoCUzJB6H6?=
 =?us-ascii?Q?vSNmdB3zOxYIUZBpo3CwedspNrQ4pQRJVBxSmJI8FFQgRzhT5ohViDUZ/a6R?=
 =?us-ascii?Q?49CNyg43gT+hNN3/AWmDQLtuEpbF/6tweRezTxxWQmy9OPGfCvf5iUM3T9fr?=
 =?us-ascii?Q?snRowLu+5uO8XDp8aW1WSDcjdBkCZGXLvSfPILI0u3vlh96PkDGh+386m8le?=
 =?us-ascii?Q?w9RJNV7JFF9QgJMrkiNCtNl7Oh7UPkldh20yZ8nKZOnL7vqR/gy8B6EloJ4p?=
 =?us-ascii?Q?gtZ0FSYhr26FPJ0C9nIARx1RScAFqCr+RQXP26ch6SuRgJHquumpZ/AE7dcs?=
 =?us-ascii?Q?7lUqyIayns/kFEo7pJxnLLQNRnXmPD434exUxV7xut8romi71pnwFoFFdPNR?=
 =?us-ascii?Q?m0DTTQA3sFJQ9jxd9+Olpv3o8j+xy8JVHBprM8tIM3xtPQr0SgM0IBFYNHov?=
 =?us-ascii?Q?PvumiBJ0Zj6GKwmy84jZ9sVAJzAE5FbcJkECIy1JNyJbq8e4YU0qdny7890H?=
 =?us-ascii?Q?lXGjabeD9X4u0587DGkRA1UXYmCuYlEPKRqqm+lXWdChYeBg8mYgMlbnjfpk?=
 =?us-ascii?Q?MzfhVZi4EGG0/lfeZmUsxUNBd/U1T6+kTIIR1ZV9A4j8NBE+44Ml3S104g7o?=
 =?us-ascii?Q?tM1ESc3Zrvh3tGM8KCBGLOm6iNHg2YT/jtbzYZQ9DBWVbLG+Ojzquo5oPa46?=
 =?us-ascii?Q?UJnAJpa1ZLek//5kceUwZ5g/sIBa7LzlnXHo9zC44zd/TfGuffYpEc1/ZWgf?=
 =?us-ascii?Q?P0AodR4VeHBaN5ANAOZpl9FIyS1PiDzNnmvM6/dZwQQ1yGiKEQ+haqVX9Hj0?=
 =?us-ascii?Q?lFsdqt+QufrbZXHr/0y9NrIL/KZSt512eP57BKXJbfovKlHrbJtmPPgWh8i6?=
 =?us-ascii?Q?VCGhX8zp061R5CQ4qS12r3PIAD3yb778de78yylMpePoJuCa0UNDaKuOUHZU?=
 =?us-ascii?Q?VtqUOIM9hJed9+R6TwCyZAajSdEXryAXzmXv0L9GKaRF2x+LOw7cR+NBZ2Z0?=
 =?us-ascii?Q?CtwqaWkUpkg/QALDF5XAVQ1X7LIJTfAe/Bc+r5fueOV+FaE+fZP6SJah6IGF?=
 =?us-ascii?Q?IQS4v2wt6+GOGBz38AV8sGiyK7y4O3aUBK4kD+zEHrAwg0nd0aAWIHQkj+J5?=
 =?us-ascii?Q?RBfGvEohm1gNcS64urUyK3GYLGibqpHlcmpKRGr//RQmQPhPuygZ6p3umuoQ?=
 =?us-ascii?Q?h9zB8m2VZTDi5+DIdLH0SN5YNJhdqQtmc8LXF41oKJkRBkCrVMe9cIMat5TT?=
 =?us-ascii?Q?Ee89QeTjmKcs8/M8GyHcvNTbtF36Hq181w1QhMOAIyqkFfX10iGdqPHjxEG2?=
 =?us-ascii?Q?mvomL8g7S8KMbsAGB86JSaBteJC/860+Xt29ogvqZfkc/KS/aqbG9L/tP1Uf?=
 =?us-ascii?Q?GccZsw52ClBT+FuYKwneCQkrjdHm690a0paZFHpdOawqYYX1mA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FFAXjdEJEXFPmOqBSWSVHDIfFsfS59CDC16rmZx3LIUP8FuKB+yYnL1t1u8C?=
 =?us-ascii?Q?3RI56ZJmMybq/16Mp5Mh234d/zTzqzLsmvVqmHwpH7x9NAGQamIHHItCIFMb?=
 =?us-ascii?Q?gcoekteTx4RY4zQEilYul7/DSrHa0sOZ7XKfUIyX81CSJ37oKVTq1eF6C4nb?=
 =?us-ascii?Q?2wi4TcK0ALh7LIat4hA+YH0dmnghjJGXlaUoiPbPw6TpJE6Y1kKHQ44WQ4p4?=
 =?us-ascii?Q?/yIvx3QLuyfTmqByVSKenb4YOaahYHf01Ea0jSq5uqkfsPFTDfxQtF7s44uX?=
 =?us-ascii?Q?3V+cJ06No1rdSERG/cJRukd1wcjKJrVueAdKGiTBYQF7zZllZgfbwk0STP2J?=
 =?us-ascii?Q?vhQdvoX0CMGjMjcp0ScpExRJIlnelIoyPgH+kuG7HyZ91/ZjmtvziNnA1vrj?=
 =?us-ascii?Q?q1+YjSBqJUixP71BoaD0jgcsUx+7fCAle9BjeqD2DE0vxhAU4OYfxYyLaGL1?=
 =?us-ascii?Q?eoITEgw6Zh5w3GE5fVXaQay6NiP7MMXOn22GhRKUWzEddxQb61G6MGhgOjAu?=
 =?us-ascii?Q?m6xn+11N1m6XefnBNOcWciOSoG5d2JwVSQ1fVOwI8y03nsohS4o0peqN61zt?=
 =?us-ascii?Q?46nIWdtDQ7zJJm6IkyafVnX6UxhZqbZwvYDMDMmklgrp4jFieiuGRBFvutdC?=
 =?us-ascii?Q?P2uza05YSz56Yx/038wwvdITmHOLzkeqgUhPfCEuWXfvNFCkWUt+0ugILdi5?=
 =?us-ascii?Q?q2/EDTB5OWXIR0+5MFbmxsKhcM6FUJNwhNSCDmqjD7HZLWwuGnHrWETMVYGz?=
 =?us-ascii?Q?IXgiCup/QqFZN4Ov/HIzWZBAj0OLayw91yB0ha6Dy5sGv5uf/kK6Tt9Zu8yG?=
 =?us-ascii?Q?TEg0Vrol4p+13Fx4I9uoFwy4ByAvMa01iXVaW18kquQvk30Y9fW9sDAwcmcE?=
 =?us-ascii?Q?DQK4jRpeIOndCYCmSUaU7hpgoMYKZxKgnx7QFUwRsnyLGNa68xqHRX6dmVWl?=
 =?us-ascii?Q?jlVgLvXx2kTL+2eoadM5HKq7uEKA3vqM34eD6HLMi3/mZrbOCcknJTVToAlF?=
 =?us-ascii?Q?YJPWDdNPWCJhI0bQDz6H+/GdeQ9v0jS/ytKyEVxXTAe5MEbqTDytEh/u4f+H?=
 =?us-ascii?Q?6apZC8TP8usw9BrmyrWeRBgISru4Fi/yRVQhI0frGtlT34MbDI5APJpgDcsq?=
 =?us-ascii?Q?BlL6q/pF47nU9+auPF5OmUSmCPNEBOwvsrbQmYrzJeOt6PbHO7c1PxSlhFau?=
 =?us-ascii?Q?rAkhDu2YxRpB790V7Fj4Pee5M/QKMHGH2ZFWG814XICYntPVPlkofKrYSJAy?=
 =?us-ascii?Q?Ay0+3camVMkXgu+GKH90ukCHV/N4uiMHfRce2ioeQmmnTEuOgx3HX/9Yupj8?=
 =?us-ascii?Q?zZo0/gsG7/cfw4HbjuMKm03FgYpNRQCqmn6dwdguMZJXpcXaxBDahzsWGNfo?=
 =?us-ascii?Q?ZfI5zVvhDHRqyQHoFU20Ae690ovm4mpo5yCaTuNV7LLBwEqBQWGOtDpuryNk?=
 =?us-ascii?Q?nxgRgWKoWcWQz/Llj5egcT5arYKokOB4SYEijGtLRAarlSfO/UMNqfr4COBv?=
 =?us-ascii?Q?LAVRT9+SiifbM2n4QiIg97NtyKOYMekIKRcBynQGTwLF360OmFVCl8rj8LVS?=
 =?us-ascii?Q?/OMMVXTVthGJ7L8A3ISU+kCEyWomG5/XkmdrM9Jc00BwYKLviIBx+hFwmMxN?=
 =?us-ascii?Q?3/0mKiErzJMJcS8WYK2B/IQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f878400-fa47-4e19-f8b8-08de26e721df
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 21:12:08.2832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNsd4VEO/XHVJBl/WAf40Q/BrS/uRvLUYRdBG0GnBLRbJGaUjw6LmwgdfaJklTeVoTCxPqG6yEQKQ1GnsIDBlJ0t/2TqfiGzHkcsVwF4zq/N2Bd5K2DH/KczDtteRi5R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF8B8D6872
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

On Tue, Nov 18, 2025 at 09:52:40AM -0800, Matthew Brost wrote:
>On Fri, Nov 14, 2025 at 05:25:47PM -0800, Niranjana Vishwanathapura wrote:
>> On Thu, Oct 16, 2025 at 01:48:20PM -0700, Matthew Brost wrote:
>> > Stop open coding pending job list in drivers. Add pending job list
>> > iterator which safely walks DRM scheduler list asserting DRM scheduler
>> > is stopped.
>> >
>> > v2:
>> > - Fix checkpatch (CI)
>> > v3:
>> > - Drop locked version (Christian)
>> >
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> > include/drm/gpu_scheduler.h | 52 +++++++++++++++++++++++++++++++++++++
>> > 1 file changed, 52 insertions(+)
>> >
>> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> > index fb88301b3c45..7f31eba3bd61 100644
>> > --- a/include/drm/gpu_scheduler.h
>> > +++ b/include/drm/gpu_scheduler.h
>> > @@ -698,4 +698,56 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>> > 				   struct drm_gpu_scheduler **sched_list,
>> > 				   unsigned int num_sched_list);
>> >
>> > +/* Inlines */
>> > +
>> > +/**
>> > + * struct drm_sched_pending_job_iter - DRM scheduler pending job iterator state
>> > + * @sched: DRM scheduler associated with pending job iterator
>> > + */
>> > +struct drm_sched_pending_job_iter {
>> > +	struct drm_gpu_scheduler *sched;
>> > +};
>> > +
>> > +/* Drivers should never call this directly */
>> > +static inline struct drm_sched_pending_job_iter
>> > +__drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched)
>> > +{
>> > +	struct drm_sched_pending_job_iter iter = {
>> > +		.sched = sched,
>> > +	};
>> > +
>> > +	WARN_ON(!READ_ONCE(sched->pause_submit));
>> > +	return iter;
>> > +}
>> > +
>> > +/* Drivers should never call this directly */
>> > +static inline void
>> > +__drm_sched_pending_job_iter_end(const struct drm_sched_pending_job_iter iter)
>> > +{
>> > +	WARN_ON(!READ_ONCE(iter.sched->pause_submit));
>> > +}
>>
>> May be instead of these inline functions, we can add the code in a '({' block
>> in the below DEFINE_CLASS itself to avoid drivers from calling these inline
>> funcions? Though I agree these inline functions makes it cleaner to read.
>>
>
>I'm not sure we can just call code inline from DEFINE_CLASS, rather only
>functions.

I do see some examples of it.
https://elixir.bootlin.com/linux/v6.18-rc6/source/drivers/gpu/drm/xe/xe_validation.h#L167
https://elixir.bootlin.com/linux/v6.18-rc6/source/drivers/gpio/gpiolib.h#L229

But DEFINE_CLASS also inserts static inline functions here. So, not super critical.

>
>> > +
>> > +DEFINE_CLASS(drm_sched_pending_job_iter, struct drm_sched_pending_job_iter,
>> > +	     __drm_sched_pending_job_iter_end(_T),
>> > +	     __drm_sched_pending_job_iter_begin(__sched),
>> > +	     struct drm_gpu_scheduler *__sched);
>> > +static inline void *
>> > +class_drm_sched_pending_job_iter_lock_ptr(class_drm_sched_pending_job_iter_t *_T)
>> > +{ return _T; }
>> > +#define class_drm_sched_pending_job_iter_is_conditional false
>> > +
>> > +/**
>> > + * drm_sched_for_each_pending_job() - Iterator for each pending job in scheduler
>> > + * @__job: Current pending job being iterated over
>> > + * @__sched: DRM scheduler to iterate over pending jobs
>> > + * @__entity: DRM scheduler entity to filter jobs, NULL indicates no filter
>> > + *
>> > + * Iterator for each pending job in scheduler, filtering on an entity, and
>> > + * enforcing scheduler is fully stopped
>> > + */
>> > +#define drm_sched_for_each_pending_job(__job, __sched, __entity)		\
>> > +	scoped_guard(drm_sched_pending_job_iter, (__sched))			\
>> > +		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
>> > +			for_each_if(!(__entity) || (__job)->entity == (__entity))
>> > +
>>
>> I am comparing it with DEFINE_CLASS usage in ttm driver here.
>> It looks like the body of this macro (where we call list_for_each_entry()),
>> doesn't use the drm_sched_pending_job_iter at all. So, looks like the only
>> reason we are using a DEFINE_CLASS with scoped_guard here is for those
>> WARN_ON() messages at the beginning and end of loop iteration, which is not
>> fully fool proof. Right?
>
>The drm_sched_pending_job_iter is for futuring proofing (e.g., if we
>need more information than drm_gpu_scheduler, we have iterator
>structure).
>
>The define class is purpose is to ensure at the start of iterator and
>end of the iterator the scheduler is paused which is only time we (DRM
>scheduler maintainers) have agreed it is safe for driver to look at the
>pending list. FWIW, this caught some bugs in Xe VF restore
>implementation.
>
>> I wonder if we really need DEFINE_CLASS here for that, though I am not
>> against using it.
>>
>
>So yes, I think a DEFINE_CLASS is apporiate here to implement the
>iterator.
>

Ok, thanks.

Nianjana

>Matt
>
>> Niranjana
>>
>> > #endif
>> > --
>> > 2.34.1
>> >
