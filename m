Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BAAA9BA68
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 00:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1061710E87D;
	Thu, 24 Apr 2025 22:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3OEVsac";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE33C10E876;
 Thu, 24 Apr 2025 22:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745532188; x=1777068188;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LGPgFX4yR90B/vmNv4JRmdGep7sKgPzZYIbCXoY3b8g=;
 b=H3OEVsac/2We7eRzXoTBhbeoO5wbRlhmcSmAZv9Tm4A+VKpySmRcBWns
 YixpgMHDHxwh3W1gwWslY4PBotqDvhuJu6dAsTl4PfK2Z1u0Yv/nlBf3f
 wTP30784aY1Xh62ZSuD6YB53xB5Nwhnf/riWTN+BSxTg8WLihR/U1pfdT
 ctXK/u03Ny45Z7k8iHljuwj/W7Bmjy7OjPGQHO1/Ti3/FmhPO+0qkq/fH
 dJ/2eM4twGkNSb3ZwpIonWJziDfdNpLwH03yGQaL+51gI9tUyz9NSSAKw
 HgMAD6y5CibS7E9xoqJp5X9LUwYPQ6xLwTjOn9696pdDp0eeE6F1QN3Vw w==;
X-CSE-ConnectionGUID: w21LJlTkR0aekX1RbFA2Pg==
X-CSE-MsgGUID: DG6/DuQtTPav8YW1oM6lrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58175939"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="58175939"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 15:03:07 -0700
X-CSE-ConnectionGUID: dMM2Kr0JT6mOmlTqhf/Vkw==
X-CSE-MsgGUID: itt6RH5JQom1+BkwpDpISQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="132720855"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 15:03:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 15:02:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 15:02:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 15:02:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcRBVEREf3MwGZnun2n2b/hciQIKkpeGjEjWreiILPMKY2sOLhfD/hOqnt5BcQNh+1guz9OhNV1w1yB0/9FV00u7XfoSKKEUwsE7VgkwwoIF0GXuzU7ZB169eNyn4+QUXGMUrseQraKfm5uCA+2ZqmcfOantYrmUflcRUbSNW1qmRfURs/MDF0j0XOWD8WiWgpZOqcOm7BMOn0Y3biCgP2XdkQ4zAYpPW0H0Tjh/jhn4HXX0bSvyg+2TN/9LOdnmNTZAiPoNrt4vkhzGNiHYuDJChC6f/jV9tiw0QgP5vFZuyCau+HVfzdjCabXm6gPzqJrZLYrwsbNAXErpvFNd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=403cxU9XNB6xFa+6H66S24eHSlOr9/NxTBGCh98rMEw=;
 b=IEP79QoQLUDm/8SrzYGN8EW3o3wbAfDWbQBpSCCP7tFYpPHybSw4PljhxIs/RVUBz0baFHIJQDQn+A9iNh3tW8nXZ4rW+pLhARis5M0QjVnThVruiwFibzW850Jjg80y4ws3S68IpS6ozbPyGErd4My2tU4PrQwg65MKEtERaDXivTZu14Z4GiCEYSZC2ABD+FV2DzbiwsKI7HdjWDHDNFMLjzfvTbfWUwVWbTTSrp3NRphsuEpJAGpbe5YJrNESlGiNXt6PMdmJGPpDFtcxHF/BFbKaQ8Y6amfWo+v8JpmJbI8YzFxg3bEExWHgKqdhJcxxv6pKpu2qE3FlA5f2AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7624.namprd11.prod.outlook.com (2603:10b6:8:141::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 22:02:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Thu, 24 Apr 2025
 22:02:50 +0000
Date: Thu, 24 Apr 2025 15:04:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 5/7] drm/gpusvm: export drm_gpusvm_pages API
Message-ID: <aAq1W65vGXJZuoZj@lstrano-desk.jf.intel.com>
References: <20250424121827.862729-9-matthew.auld@intel.com>
 <20250424121827.862729-14-matthew.auld@intel.com>
 <aAq0sYGG/nd/gZKm@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAq0sYGG/nd/gZKm@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0334.namprd04.prod.outlook.com
 (2603:10b6:303:8a::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e20e230-6ff2-49f8-8efa-08dd837bc0f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?x5Ps3NqOUY1FSpisK/1VhbwuL0JqbX9bUvlsrMDcfVWKmK5NUjBv7lPbf1?=
 =?iso-8859-1?Q?5oIiWtpnElZ9VY8oNKF/u/p7+7J8RTKzN271Ssmd8N7v/07UJyT7qDwFwd?=
 =?iso-8859-1?Q?1OVEQ+Rv1HVkKRZyCSWpvdjmYh7DA1nGbAaAy8XF9oGqJzCYXSfE3+qqWV?=
 =?iso-8859-1?Q?vyZX8P5gvljaB/ivX4PR5aEcbwVznWKWXryPxO8rKgKIecmsg18lB0tclV?=
 =?iso-8859-1?Q?+sqHYYExQ1KAn1UC+T08j3EX0dFkuHU53S1LKl0oMgCUpKyUDy+8uP8iJQ?=
 =?iso-8859-1?Q?EgPjXEbfeNrjGefNBsWYA/GmERjNNo5psLIHIvZ72HXdXn5dqqfZT1zCqJ?=
 =?iso-8859-1?Q?R2AEcpLij7l0d9TdIy3U0w+4FY1G2GFNPM4PPPuGP9I7vZL6IMNrdyLf/5?=
 =?iso-8859-1?Q?k3VGsrWZm9hRpbtE5C3H6xHussflpyh26+Jl14bwY/58lNW/Z6aU8LaqeK?=
 =?iso-8859-1?Q?/mrX2e0A3xyvLVaBJPtLvw+/v9Dh4+JYYpECo+8wTqSA9he13jPcL32+8N?=
 =?iso-8859-1?Q?hQbvfOocx9S3+EIyPE5yw7mdOhWQ/VJ18ze7oBKLlNRBqYWuiPA6SG0IOs?=
 =?iso-8859-1?Q?qNBnsabWW4u5/twCkf4WYtVwlpxl7d77inJN+SqXLX7aq2htesQ8iy2j7y?=
 =?iso-8859-1?Q?vMSdCIttx89XaBcT/CmDh6ZTmtK98kUxDlcPOeUs4n14t0PTUc/0yBj9MM?=
 =?iso-8859-1?Q?x5zPXnC7lFnpzAleHcUSqwKFO2EHa3vPHh3j1goaFF/1DRgRr+rUoEM2dz?=
 =?iso-8859-1?Q?GFi3JgC2itFbrIg2F9QNOOyeny+WkPMwG7qp8XVYUXZoOeecCv8ilmpdF3?=
 =?iso-8859-1?Q?kzvrxIPNsfxy7wYpAhDlO2BjAJBZ82nzTLvdSa4K0H9wQsYHG2vWgnvQkJ?=
 =?iso-8859-1?Q?GpYUn0YAsJy/IvE/2Qyh5ZBsuBlgiOEile1a6a3YdUFbez+ZmshW9HjSZa?=
 =?iso-8859-1?Q?QA1vVEC2CfzQKU867TZgx/VgsypkzHn2v1AoiJAZQFu5h1Y7gd+1+nUmyS?=
 =?iso-8859-1?Q?ZTrERL1/4yOPPaZw6ZRTvK7+eM2mj8IlMvPOK0HQb8Umr44qfRF6EoSsZR?=
 =?iso-8859-1?Q?/NZnd2kNznO07hrc84apDuCNQaqu+Iy/wrbJD+4lzSk0O01Cj0cu/4hA6+?=
 =?iso-8859-1?Q?PzhuXq/MN9g+BnJUu2outn4SsgVf4PFABAX7AVJC7CG4YCAAGKBmP4sA/R?=
 =?iso-8859-1?Q?vX7dPHSeqWMSssbK2YZkFKUk6/vQGDf9GWyQkl06ExPu6rZvAcIIsbtBxQ?=
 =?iso-8859-1?Q?AyLwpOxtxAYnvkqC7zvYc0NsoJoveY6Qs0ql00bVM0Te8EDHlsj35h+onX?=
 =?iso-8859-1?Q?MDd6j20YdQc+2e8LmiyPax1Hen/oqzl7mkWYlQ+w9VQLPWUAiHem3UmrY3?=
 =?iso-8859-1?Q?ss8cYK4F4Ibd44h5yJ1CW65mqoXq1xjZuyIDUbm/Crp4+mf3vVF09oxNwi?=
 =?iso-8859-1?Q?yH8+4hvsTcQv6EcRlcFNvnkP8urFeC/wQ1iDHFnAQXiqqfoD4A2og7BVnp?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qYetbKQTVeWQwqFjOK+xgEZW4wELdOBJoHkH5jwN3nLQgpLL1ACwHtXeY2?=
 =?iso-8859-1?Q?B4+kE0fY2sE9UgvruQtxnMH5Y05JH/g3R7hOPEDsYvH3IwZAIwzECiQAWo?=
 =?iso-8859-1?Q?MUANrfsZjuWJaKOJi//80buf4Ef6SpySLsj+1XUZvz1Jpp6AEoAMu2lmrr?=
 =?iso-8859-1?Q?kVizMFAcc6nh4zgiRpWr0Ig6//DDLj/xxwZVqwlFRgjb8a6KnC9gr6B3wg?=
 =?iso-8859-1?Q?w7LDEx8CfqeGI9ng9ObmN5QfxeGf8ufSmdmyYnNllxpLAZFOUqwYMV6RXy?=
 =?iso-8859-1?Q?xkfxLZig4S6Sb51YfLK/I7cCH6PkebQ/7hzCAO2L5QsSRiVP8zPe0DVpA5?=
 =?iso-8859-1?Q?GQPr74f6Zreoh48hVVrB1k+H45fLdIPCliNStjf11Svyhl5HyEG91Znn5v?=
 =?iso-8859-1?Q?W3A1g4hZMOSYrMfzbAs4l4GmpKemMh8k4s4oTEBgxfZMBNwDqm0j3euej6?=
 =?iso-8859-1?Q?4IFBTRPE76LcW19BaDSMBPq087SrV7s7MYhciLYgVetpdTcXV+ovVqtX9S?=
 =?iso-8859-1?Q?0FYrMqlmUh3FHWFppatuo3eCEJvwvjRiPFEabhkxNIxT1HjLre0o+BpsBC?=
 =?iso-8859-1?Q?v04SSZXknFD0fex0KUn553Zaw9/4JA6oaQef7ZEmVqRldTNFQBI3yWowav?=
 =?iso-8859-1?Q?rwS2m2bl2uWujfOFzxCPqWXHowFc4yHMGO5AB3TYrd2P+/xe02DlRyIVGC?=
 =?iso-8859-1?Q?A9GjJ1RCwcoiTchnSXEzp+u79zNo7RJ6T32z5ukDdtMXYk6VeXLGoIhaye?=
 =?iso-8859-1?Q?Mf55xaWU1OotBvKMEG0Cp5ia5LxDxhljjUy/fhNuYrwQAfcQda95CaAgsj?=
 =?iso-8859-1?Q?XH5Ohn10PWPMn5VfAve+pXYsVunQNyxYyY7O25TFxgl4jN7YBdGJoOUxgf?=
 =?iso-8859-1?Q?X1WHRkri7nsaTgBy3KCLwRHgfuZonivNVZNhxmihGb//4rtqBwZx2bP6lB?=
 =?iso-8859-1?Q?kvQCuvwX/dzFt+zmKrxG4+x4RJba6d7EtVwv9P9e4ZhIf0ohTb7WHFuDzC?=
 =?iso-8859-1?Q?D36/U0jr6kEhx+Gg1vDMi+UexN7Is2qA8OyZfzjnbgLSOvYNTUyBUUQw66?=
 =?iso-8859-1?Q?6Oa7KcxT2PlYOC5ZroiLpxntCMRwMr962GO/8NWyWk6VrftYsB1+tzRK6d?=
 =?iso-8859-1?Q?JExE8GvCHWyeuQdYmAGby9H7kpkDBTZyPOPLquQBrNnVsJav2G9z1YIn8G?=
 =?iso-8859-1?Q?8jf+W5+nxJhJCMVm1y1NfX05ufIwU2OByrL3ALolZDtqHvEhGHH9ujHyiG?=
 =?iso-8859-1?Q?pwDye/5pH4n+1UAZXeC9GLFX/pb0+OTApO0KPHj8Z7yziYfnZFXoFUWWzV?=
 =?iso-8859-1?Q?x5i/AcKkahog/6UFdiGXicWrZy6n7chtvNsmQz0WQpD7xdJ/9QAZgqbNLX?=
 =?iso-8859-1?Q?kiJKIQkGR+sRcbKPD07Dof/CDYyyIpOf9Jk6zrRAdMu8Bmjrk1IdZdBQk0?=
 =?iso-8859-1?Q?zKw6d+U9SsFyUPpKda42RPtDGmGbaXjeR8le/qhQXQQKXgF8WJ/cXvGQ1z?=
 =?iso-8859-1?Q?cm7DWnH0xZ97soLuFW1EKv2eL2Fe+NgP/VmB0/x2IubLzfg9f26qEvdT2t?=
 =?iso-8859-1?Q?Qdx8xm7QiS66urywJ6yCxxHT3q3d2pxv02kNDiFFFIuZrfEVAXRack3O4H?=
 =?iso-8859-1?Q?YELaQ8EGa8eEn1MHb2YK5pqu/9xrjJUL/ljYtioOr0/fhnCn6JrmNY5A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e20e230-6ff2-49f8-8efa-08dd837bc0f3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 22:02:49.9604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBE2QWed9xngJB2LakGZgpBMb+8bO+UouVW3eikZhsi0k8/2MyfXisV6WQJ7eHhrFmdhG/25AYoqMI9CkmO8Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7624
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

On Thu, Apr 24, 2025 at 03:01:21PM -0700, Matthew Brost wrote:
> On Thu, Apr 24, 2025 at 01:18:33PM +0100, Matthew Auld wrote:
> > Export get/unmap/free pages API. We also need to tweak the SVM init to
> > allow skipping much of the unneeded parts.
> > 
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/drm_gpusvm.c | 66 ++++++++++++++++++++++++++++--------
> >  include/drm/drm_gpusvm.h     | 16 +++++++++
> >  2 files changed, 67 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> > index fbe0d70ef163..0e0a3c995b4b 100644
> > --- a/drivers/gpu/drm/drm_gpusvm.c
> > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > @@ -539,6 +539,12 @@ static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
> >   *
> >   * This function initializes the GPU SVM.
> >   *
> > + * Note: If only using the simple drm_gpusvm_pages API (get/unmap/free),
> > + * then only @gpusvm, @name, and @drm are expected. However, the same base
> > + * @gpusvm can also be used with both modes together in which case the full
> > + * setup is needed, where the core drm_gpusvm_pages API will simply never use
> > + * the other fields.
> > + *
> >   * Return: 0 on success, a negative error code on failure.
> >   */
> >  int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> > @@ -549,8 +555,16 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> >  		    const struct drm_gpusvm_ops *ops,
> >  		    const unsigned long *chunk_sizes, int num_chunks)
> >  {
> > -	if (!ops->invalidate || !num_chunks)
> > -		return -EINVAL;
> > +	if (mm) {
> 
> Do you still need this if statement if GPU SVM is shared between userptr
> and SVM? Shouldn't we always pass in the MM?
> 
> Or is this for the mode where SVM is disabled in Xe and we just use the
> get_pages functionality?
> 

Nevermind, I see how this is used in the following patch. Make sense.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Matt
> 
> > +		if (!ops->invalidate || !num_chunks)
> > +			return -EINVAL;
> > +		mmgrab(mm);
> > +	} else {
> > +		/* No full SVM mode, only core drm_gpusvm_pages API. */
> > +		if (ops || num_chunks || mm_range || notifier_size ||
> > +		    device_private_page_owner)
> > +			return -EINVAL;
> > +	}
> >  
> >  	gpusvm->name = name;
> >  	gpusvm->drm = drm;
> > @@ -563,7 +577,6 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> >  	gpusvm->chunk_sizes = chunk_sizes;
> >  	gpusvm->num_chunks = num_chunks;
> >  
> > -	mmgrab(mm);
> >  	gpusvm->root = RB_ROOT_CACHED;
> >  	INIT_LIST_HEAD(&gpusvm->notifier_list);
> >  
> > @@ -671,7 +684,8 @@ void drm_gpusvm_fini(struct drm_gpusvm *gpusvm)
> >  			drm_gpusvm_range_remove(gpusvm, range);
> >  	}
> >  
> > -	mmdrop(gpusvm->mm);
> > +	if (gpusvm->mm)
> > +		mmdrop(gpusvm->mm);
> >  	WARN_ON(!RB_EMPTY_ROOT(&gpusvm->root.rb_root));
> >  }
> >  EXPORT_SYMBOL_GPL(drm_gpusvm_fini);
> > @@ -1185,6 +1199,27 @@ static void __drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
> >  	}
> >  }
> >  
> > +/**
> > + * drm_gpusvm_free_pages() - Free dma-mapping associated with GPU SVM pages
> > + * struct
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @svm_pages: Pointer to the GPU SVM pages structure
> > + * @npages: Number of mapped pages
> > + *
> > + * This function unmaps and frees the dma address array associated with a GPU
> > + * SVM pages struct.
> > + */
> > +void drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
> > +			   struct drm_gpusvm_pages *svm_pages,
> > +			   unsigned long npages)
> > +{
> > +	drm_gpusvm_notifier_lock(gpusvm);
> > +	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, npages);
> > +	__drm_gpusvm_free_pages(gpusvm, svm_pages);
> > +	drm_gpusvm_notifier_unlock(gpusvm);
> > +}
> > +EXPORT_SYMBOL_GPL(drm_gpusvm_free_pages);
> > +
> >  /**
> >   * drm_gpusvm_range_remove() - Remove GPU SVM range
> >   * @gpusvm: Pointer to the GPU SVM structure
> > @@ -1360,13 +1395,12 @@ static bool drm_gpusvm_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
> >   *
> >   * Return: 0 on success, negative error code on failure.
> >   */
> > -static int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
> > -				struct drm_gpusvm_pages *svm_pages,
> > -				struct mm_struct *mm,
> > -				struct mmu_interval_notifier *notifier,
> > -				unsigned long pages_start,
> > -				unsigned long pages_end,
> > -				const struct drm_gpusvm_ctx *ctx)
> > +int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
> > +			 struct drm_gpusvm_pages *svm_pages,
> > +			 struct mm_struct *mm,
> > +			 struct mmu_interval_notifier *notifier,
> > +			 unsigned long pages_start, unsigned long pages_end,
> > +			 const struct drm_gpusvm_ctx *ctx)
> >  {
> >  	struct hmm_range hmm_range = {
> >  		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
> > @@ -1548,6 +1582,7 @@ static int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
> >  		goto retry;
> >  	return err;
> >  }
> > +EXPORT_SYMBOL_GPL(drm_gpusvm_get_pages);
> >  
> >  /**
> >   * drm_gpusvm_range_get_pages() - Get pages for a GPU SVM range
> > @@ -1583,10 +1618,10 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
> >   * Must be called in the invalidate() callback of the corresponding notifier for
> >   * IOMMU security model.
> >   */
> > -static void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
> > -				   struct drm_gpusvm_pages *svm_pages,
> > -				   unsigned long npages,
> > -				   const struct drm_gpusvm_ctx *ctx)
> > +void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
> > +			    struct drm_gpusvm_pages *svm_pages,
> > +			    unsigned long npages,
> > +			    const struct drm_gpusvm_ctx *ctx)
> >  {
> >  	if (ctx->in_notifier)
> >  		lockdep_assert_held_write(&gpusvm->notifier_lock);
> > @@ -1598,6 +1633,7 @@ static void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
> >  	if (!ctx->in_notifier)
> >  		drm_gpusvm_notifier_unlock(gpusvm);
> >  }
> > +EXPORT_SYMBOL_GPL(drm_gpusvm_unmap_pages);
> >  
> >  /**
> >   * drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range
> > diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> > index 1b7ed4f4a8e2..611aaba1ac80 100644
> > --- a/include/drm/drm_gpusvm.h
> > +++ b/include/drm/drm_gpusvm.h
> > @@ -370,6 +370,22 @@ void drm_gpusvm_devmem_init(struct drm_gpusvm_devmem *devmem_allocation,
> >  			    const struct drm_gpusvm_devmem_ops *ops,
> >  			    struct drm_pagemap *dpagemap, size_t size);
> >  
> > +int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
> > +			 struct drm_gpusvm_pages *svm_pages,
> > +			 struct mm_struct *mm,
> > +			 struct mmu_interval_notifier *notifier,
> > +			 unsigned long pages_start, unsigned long pages_end,
> > +			 const struct drm_gpusvm_ctx *ctx);
> > +
> > +void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
> > +			    struct drm_gpusvm_pages *svm_pages,
> > +			    unsigned long npages,
> > +			    const struct drm_gpusvm_ctx *ctx);
> > +
> > +void drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
> > +			   struct drm_gpusvm_pages *svm_pages,
> > +			   unsigned long npages);
> > +
> >  #ifdef CONFIG_LOCKDEP
> >  /**
> >   * drm_gpusvm_driver_set_lock() - Set the lock protecting accesses to GPU SVM
> > -- 
> > 2.49.0
> > 
