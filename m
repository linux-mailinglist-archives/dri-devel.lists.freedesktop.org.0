Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDC38B2E41
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 03:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335D2112100;
	Fri, 26 Apr 2024 01:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SIgdXEAu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DC6112100;
 Fri, 26 Apr 2024 01:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714094423; x=1745630423;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iTdtOlXBOYtDibEWput9QWh4/nb5YYpa4fHHsCOpwWw=;
 b=SIgdXEAuNSEuBxBMjkt6Y0s7zZMPxQZVjvyyYl5ihLnqYg09os5zaRHR
 Ya2VbYAJYRd3plTIZBTqDc49OFBjfzCzgJW3Rr/j5VNh5Rz6XyID4FRJs
 +2CvvNevUTu+Dy+w0bnhJtoNpPcBK0+7L4cuul6D9evM1sZgVkcnAPwe3
 kgt9h77Cg/TLVXSFI5v6DpEhqA4ZUkTf4Hrk0AFbVAu1xcN20AOCqSU1V
 HjHUa5cyVEEsmlv8NwJGb/4QIrmexYHZYJKyqH6s/YstJlhbs+4GoJLkm
 uTIdVeS9UoQz8lu3MEi2MRMzM14IjuznugrjUnuSJmD5kNY09XH3hwg31 g==;
X-CSE-ConnectionGUID: w5N8TztPRVSLRe/1vdGunA==
X-CSE-MsgGUID: zsbEnhn6S0i2I8OUa0j4kA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9672490"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="9672490"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 18:20:22 -0700
X-CSE-ConnectionGUID: UIBLk2qsRT2+VyykvtsN2Q==
X-CSE-MsgGUID: Yh3aWhcJQ7u9/UuPbmy3Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="56439867"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 18:20:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 18:20:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 18:20:21 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 18:20:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+cPsYkscodnkPdKxsrJcoxdvLbUqXdNGBMlGZty8CGWOyoq3X7A60GyvsaYhVHZ2ttqv+UBBEJ/BHuAiyQlyo6fjb8jXrv3WyZrddBb1z+p9uF2NbXFSKLS87K0ttrKX5PUmuD7MuV+Rnf0cnv2jovFLz5HT+6e8I9bb8VSrZxNOvOWk/MHpTZLBt40Pu4ERduCl4Q2+ae4EhUyWjJ3aBsZpTkyfN/x/rokJxyARvvSqrXSD5uxXYMFSGZNKsb06qZaSBgG0mEcyLTs2ivwbTTINXymIvv5UBjJxPxS497RieNbwBpJy4oCUflnHyVnp7d6TpGrjFr7t2zSn2a2RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqFRY+fOGgqe5tq+9BkbRfTipgAAbG7Ce8iKKc5je8o=;
 b=hwh7wEJAqtQ92mT8yAbJD4GnaMnEE9zEG8Cyz/YIgH56eGiZzZnJ3Vx1D9v/SmC1BxY8IFgykBLygNT3p1f47URpitLlASO8lO+6ima/V4WNpXBJxDKcjHuXPsxmJpTjiAWL59clLb21oeSiAiTUiBDCBQOucjhl25N/yZyMIphFNJCSYbzHhuggUU5RCqGxD7TOboxMO3Yw02jCDW/UNdM1fVvAUJnsA+unvmkdALxYzDq2F6ES2xtdWhyVMAV1QEKOw0IOb0SvidzphciOeatl44ajRdfCEvfFB9MvoDucSukkU2B4OFt9jL6D5sjluVuGT27DVjGJpAw0iO08qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6510.namprd11.prod.outlook.com (2603:10b6:930:42::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Fri, 26 Apr
 2024 01:20:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Fri, 26 Apr 2024
 01:20:19 +0000
Date: Fri, 26 Apr 2024 01:20:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/9] drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves
 within bulk sublist moves
Message-ID: <ZisBTUvd6VY2msm4@DUT025-TGLU.fm.intel.com>
References: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
 <20240416100730.6666-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240416100730.6666-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0131.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6510:EE_
X-MS-Office365-Filtering-Correlation-Id: e706243f-90ab-4b7a-001d-08dc658f095b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Qv2AxNwE42x+qXBpN+wC8cb1KVnN+GnDq/Wpx3sAzzbzzUsYLRxy/OylkO?=
 =?iso-8859-1?Q?KYQzTgFIKghJ6u4qzEHy7xjRkqhOOS4wgMLdqFXtj4yN9wjYVC8jm5K8Sf?=
 =?iso-8859-1?Q?59kBQRpFVNpwBdMhppy+D882N9idnRfApI7QDAMX4rkfriD48RTbQExVDo?=
 =?iso-8859-1?Q?bvGLrtqkZ3ERlcFCvr8V1BC04wj426aGSaN4OKS38xMA9Fx7fECDgGEF69?=
 =?iso-8859-1?Q?H+l0aCyyDqYtAnxpGgyYsB7sEW1Ue0j+YgfRbPC5uhQpLsZLSBEGyaZaks?=
 =?iso-8859-1?Q?bpq1n6rEtnWL4yfg6sEW8tsXiE8NXYnuR8AM7WvKxgS1RBVlD7Nm/SWLEY?=
 =?iso-8859-1?Q?XWqQcjnpMDrCkmVLoOOiEwNclSn2nO56I1un7B5FC62pKLUdGcm4qZidWe?=
 =?iso-8859-1?Q?OUuBvRahuPO+ReN/k6G1t7Q47e61gdGxQXr5F0jBtxrZ2YT2EXa0P8XcX1?=
 =?iso-8859-1?Q?M11Ca4xF9Lfp44jLHJXxpbHQFsbrtJzLs7kSTuCE9QMTTLD7jnwuN7Oz49?=
 =?iso-8859-1?Q?RvUz1K4kj51lSBO0l/SWKjuQvIeVIEHjgiXmnfd4dMTovfOTyI1UVxnGpw?=
 =?iso-8859-1?Q?dOA4y99m6tvC+sbkqFSBMEq0xaCHDenSyFon5nBIim/icMQqz1ie2jiwKZ?=
 =?iso-8859-1?Q?+TpHsGPcDTNPxC7d2LhhpGy9iD2uj3fmi16HNjlw9TZVMhYYjc+9hegeAB?=
 =?iso-8859-1?Q?3w0DRt5ALbYt3pj3TBQnMIOdEqJjPUTvQNvnubPlCDXFMJOVxYjhhWzhgX?=
 =?iso-8859-1?Q?sjfd6lMKjeGRLXVMoPo/SNLteBRGalCVDbuK7VUp0obsDRO6ZioMC9LOso?=
 =?iso-8859-1?Q?ZWjo3MHqgkrvd2h2oftatFOu5lqiUBSnPDF/syKIfgi/j7+nXghSVN7H1J?=
 =?iso-8859-1?Q?wFpEJLJnJoVhIjVHMOj4/wpEKJTgrMtj1k5VGZUJfTIrNn3O9ftCd4yWW6?=
 =?iso-8859-1?Q?yGQnoevjL0FWhkjtz+Jrc5UY+VUr47IcdKwM5XVobiTPW48nFSkwXfqJkl?=
 =?iso-8859-1?Q?GwCaPV8arZpvDzMESKrD/S/L02ShXdKn/ten9vtppPiMqLWVu/fexg+Uks?=
 =?iso-8859-1?Q?NY+ADnO/cSGmNwURroo1JQwKL6W9Oy/2f4ojd12B/AuEp15SxsQrc2ekXU?=
 =?iso-8859-1?Q?xj+UEGNjGkzOxb9UfEobbeJmpid9XfRr9AJEwvohaPWg8qUzG+xdlPL5wq?=
 =?iso-8859-1?Q?B3g9X7V6XU1HIKvRyXK6vsEXOnSTxG0du7dDrUyhKOH170b8f7cWkvElbJ?=
 =?iso-8859-1?Q?S0sLCRHCHuqhHb17+59lhIhCql6oWPWB3SKJi5e/VR579n6vU6HzIsWoe+?=
 =?iso-8859-1?Q?EUgVbeCdgSmWPGo9xlObavUiYg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WXKZ0MlmoVEoD6fLP7ae9C9PGiOq6ZeU3OAGmMPqpJ7fHacDSQ5Itvef4w?=
 =?iso-8859-1?Q?LTHq3i9Wimb/R4nFrkQjhjfQ0vbOjDOtop4C6e4a6NKrqSXPaED72QWyJ0?=
 =?iso-8859-1?Q?HMLxMHZJ+zoeVsDUTRIIz1g50sPVMxsFBZm/GeDkZvKGRf50ovw9/HbJQJ?=
 =?iso-8859-1?Q?ZZzGmlsVK588NbxRhcHJCf+hyd5WKMyniJ6AVqEkxHTp2O+8NwqcFx97Cw?=
 =?iso-8859-1?Q?CXDuy/bZ05ucmmfx/Cos16HdT3TDHiAEVTcp1JhacU5EUarQK6vUSR67Gu?=
 =?iso-8859-1?Q?Y9m9RvVC200v9P0nUjcT516yupLur2WheH07VAxv+ckOcjgXgAA+X7jphs?=
 =?iso-8859-1?Q?aiaZDHZTAJBRx19N/irjgBHoMWoXI5223sNo2g0ALmt7aUpyQZBakdSGm1?=
 =?iso-8859-1?Q?VASrW3Cg/oyPWEbhhoxXhVFU7s5JDBDyHOFM60670r94cqGX+jJuPBGnBT?=
 =?iso-8859-1?Q?QYK+BPEmTz4a3HY1YoyFOZinDi1RjhjCy9orkbIkzBxtAUIvgB0sHxylBH?=
 =?iso-8859-1?Q?tuO0yODmy6+mnTQ+sKdBCFB+I/qKGXCSvCm13LKGLtGoQwf3gArkUmlROb?=
 =?iso-8859-1?Q?t7glp9HQywrWPTsY8SqM7vsjrqS+/SBvCyacNzsbo1+0mmRW1u6smWcbDb?=
 =?iso-8859-1?Q?8YluSzA7ONAGyJP9cuaDSJ1pWAbQe/1ThSJ8YjxJqC034zDZrMFD2FYn1g?=
 =?iso-8859-1?Q?bV4PDqvolQ3MhVEw27LzT14n3uEAdBcQpmxpPPmtrBgYggAIIdjEUgvtBh?=
 =?iso-8859-1?Q?v4XuLxR4aTxJD3nZMS+Ue8GC1M7m0GLOls6XEJu5sYYnLKaGhQb1rAi5LP?=
 =?iso-8859-1?Q?Ytwv/tylFrklR/PxOxokiRRcoiu1tgy9/OsZXgi8eo5IbsCQoljybfujAE?=
 =?iso-8859-1?Q?nlerpIDL4VNFV+qDYMSezz7QWLXQ2zpMnZd03qD9bVXFJVe1cAFtqiUnRX?=
 =?iso-8859-1?Q?+8RPEbMU22qTXUHb2h7xyH2b8LNvfyr+xAAiQUPg8LHJROtsvEe0y/lGj2?=
 =?iso-8859-1?Q?gysICGTKjl/xOE2PWK4L3UczLkxwjSUVxS8lUdxPON+hghO0rPG6OEYeGX?=
 =?iso-8859-1?Q?eijQAXFxW3LeI1JCV3qrX/howzIlTLTgRrvBdNIvFw2iB2O9MAlt4DIgqB?=
 =?iso-8859-1?Q?QHtmoA2TGBxKaDvExcGvdpbjukHZUXUV+naZ24ula4bIZTsYcmd4YOQitp?=
 =?iso-8859-1?Q?J5drpPh9+5UJTuJQzI+sdp5Z5iJNnNmN4DHnLhOoVqNkTRiKBcv0LzztPZ?=
 =?iso-8859-1?Q?EKXiRs2pEG1M8ipH2N5FqwN4OUs3WjUWLo3R0cbLeoeUokfOuX4bIqjfPs?=
 =?iso-8859-1?Q?vyJUTqDby9jzox4yey+OQCTJ5gnqI8+EuioGxUlQXFW3u9D5dXB2dlrU5N?=
 =?iso-8859-1?Q?vQVr3g8hosvLxaogduGGXWkwGfNVQnMLwBLRaap0JaEQWM+pOODJi//0h0?=
 =?iso-8859-1?Q?M70ccJRldQR6nODQQztYBBtXPLUpcTbmbUtaXpYWNzaRZEM/gSrZXxnvz9?=
 =?iso-8859-1?Q?jcEUTT5boTwD402tKriMSMJTRDb5xsrXCbXsOvfiNqzq+KfohsSRu5wUPf?=
 =?iso-8859-1?Q?F5Jejw7wFL9shMnMeQzyk1LoHYrDvB+mc8Py5jTO8RPI3W8Rr/hQ+mjyxn?=
 =?iso-8859-1?Q?Bhh3SGJLEqJ4ZkQ7MDYreW/yHjPWczuSQtMrfwFDzjX/l5QDWoLPFHSw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e706243f-90ab-4b7a-001d-08dc658f095b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 01:20:19.3775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3R6BUriW8r3xLG3ZxhGrj2xLBXDPhHKtGfB+9ZSOY8j4bkVv1CWW9IVLIoOOvpnFZYHDCT3RBZ3kuCBzcPnMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6510
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

On Tue, Apr 16, 2024 at 12:07:24PM +0200, Thomas Hellström wrote:
> To address the problem with hitches moving when bulk move
> sublists are lru-bumped, register the list cursors with the
> ttm_lru_bulk_move structure when traversing its list, and
> when lru-bumping the list, move the cursor hitch to the tail.
> This also means it's mandatory for drivers to call
> ttm_lru_bulk_move_init() and ttm_lru_bulk_move_fini() when
> initializing and finalizing the bulk move structure, so add
> those calls to the amdgpu- and xe driver.
> 
> Compared to v1 this is slightly more code but less fragile
> and hopefully easier to understand.
> 
> Changes in previous series:
> - Completely rework the functionality
> - Avoid a NULL pointer dereference assigning manager->mem_type
> - Remove some leftover code causing build problems
> v2:
> - For hitch bulk tail moves, store the mem_type in the cursor
>   instead of with the manager.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  4 ++
>  drivers/gpu/drm/ttm/ttm_resource.c     | 92 +++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_vm.c             |  4 ++
>  include/drm/ttm/ttm_resource.h         | 58 ++++++++++------
>  4 files changed, 137 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 4299ce386322..18bf174c8d47 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2368,6 +2368,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  	if (r)
>  		return r;
>  
> +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> +
>  	vm->is_compute_context = false;
>  
>  	vm->use_cpu_for_update = !!(adev->vm_manager.vm_update_mode &
> @@ -2431,6 +2433,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  error_free_delayed:
>  	dma_fence_put(vm->last_tlb_flush);
>  	dma_fence_put(vm->last_unlocked);
> +	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm->lru_bulk_move);
>  	amdgpu_vm_fini_entities(vm);
>  
>  	return r;
> @@ -2587,6 +2590,7 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>  		}
>  	}
>  
> +	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm->lru_bulk_move);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 22f8ae4ff4c0..2b93727c78e5 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -32,6 +32,49 @@
>  
>  #include <drm/drm_util.h>
>  
> +/* Detach the cursor from the bulk move list*/
> +static void
> +ttm_resource_cursor_clear_bulk(struct ttm_resource_cursor *cursor)
> +{
> +	cursor->bulk = NULL;
> +	list_del_init(&cursor->bulk_link);
> +}
> +
> +/* Move the cursor to the end of the bulk move list it's in */
> +static void ttm_resource_cursor_move_bulk_tail(struct ttm_lru_bulk_move *bulk,
> +					       struct ttm_resource_cursor *cursor)
> +{
> +	struct ttm_lru_bulk_move_pos *pos;
> +
> +	if (WARN_ON_ONCE(bulk != cursor->bulk)) {
> +		list_del_init(&cursor->bulk_link);
> +		return;
> +	}
> +
> +	pos = &bulk->pos[cursor->mem_type][cursor->priority];
> +	if (pos)
> +		list_move(&cursor->hitch.link, &pos->last->lru.link);
> +	ttm_resource_cursor_clear_bulk(cursor);
> +}
> +
> +/* Move all cursors attached to a bulk move to its end */
> +static void ttm_bulk_move_adjust_cursors(struct ttm_lru_bulk_move *bulk)
> +{
> +	struct ttm_resource_cursor *cursor, *next;
> +
> +	list_for_each_entry_safe(cursor, next, &bulk->cursor_list, bulk_link)
> +		ttm_resource_cursor_move_bulk_tail(bulk, cursor);
> +}
> +
> +/* Remove a cursor from an empty bulk move list */
> +static void ttm_bulk_move_drop_cursors(struct ttm_lru_bulk_move *bulk)
> +{
> +	struct ttm_resource_cursor *cursor, *next;
> +
> +	list_for_each_entry_safe(cursor, next, &bulk->cursor_list, bulk_link)
> +		ttm_resource_cursor_clear_bulk(cursor);
>
 +}
> +
>  /**
>   * ttm_resource_cursor_fini_locked() - Finalize the LRU list cursor usage
>   * @cursor: The struct ttm_resource_cursor to finalize.
> @@ -44,6 +87,7 @@ void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor)
>  {
>  	lockdep_assert_held(&cursor->man->bdev->lru_lock);
>  	list_del_init(&cursor->hitch.link);
> +	ttm_resource_cursor_clear_bulk(cursor);
>  }
>  
>  /**
> @@ -72,9 +116,27 @@ void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
>  void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk)
>  {
>  	memset(bulk, 0, sizeof(*bulk));
> +	INIT_LIST_HEAD(&bulk->cursor_list);
>  }
>  EXPORT_SYMBOL(ttm_lru_bulk_move_init);
>  
> +/**
> + * ttm_lru_bulk_move_fini - finalize a bulk move structure
> + * @bdev: The struct ttm_device
> + * @bulk: the structure to finalize
> + *
> + * Sanity checks that bulk moves don't have any
> + * resources left and hence no cursors attached.

I don't really see a sanity check here.

Wouldn't the sanity check be list_empty(&bulk->cursor_list)? Also pos == 0?

> + */
> +void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
> +			    struct ttm_lru_bulk_move *bulk)
> +{
> +	spin_lock(&bdev->lru_lock);
> +	ttm_bulk_move_drop_cursors(bulk);
> +	spin_unlock(&bdev->lru_lock);
> +}
> +EXPORT_SYMBOL(ttm_lru_bulk_move_fini);
> +
>  /**
>   * ttm_lru_bulk_move_tail - bulk move range of resources to the LRU tail.
>   *
> @@ -87,6 +149,7 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
>  {
>  	unsigned i, j;
>  
> +	ttm_bulk_move_adjust_cursors(bulk);
>  	for (i = 0; i < TTM_NUM_MEM_TYPES; ++i) {
>  		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
>  			struct ttm_lru_bulk_move_pos *pos = &bulk->pos[i][j];
> @@ -418,6 +481,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>  	man->bdev = bdev;
>  	man->size = size;
>  	man->usage = 0;
> +	man->mem_type = TTM_NUM_MEM_TYPES;
>  
>  	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>  		INIT_LIST_HEAD(&man->lru[i]);
> @@ -514,6 +578,29 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>  }
>  EXPORT_SYMBOL(ttm_resource_manager_debug);
>  
> +static void
> +ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
> +			       struct ttm_lru_item *next_lru)
> +{
> +	struct ttm_resource *next = ttm_lru_item_to_res(next_lru);
> +	struct ttm_lru_bulk_move *bulk = NULL;
> +	struct ttm_buffer_object *bo = next->bo;
> +
> +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> +	if (bo && bo->resource == next)
> +		bulk = bo->bulk_move;
> +
> +	if (cursor->bulk != bulk) {
> +		if (bulk) {
> +			list_move_tail(&cursor->bulk_link, &bulk->cursor_list);
> +			cursor->mem_type = next->mem_type;
> +		} else {
> +			list_del_init(&cursor->bulk_link);
> +		}
> +		cursor->bulk = bulk;
> +	}
> +}
> +
>  /**
>   * ttm_resource_manager_first() - Start iterating over the resources
>   * of a resource manager
> @@ -534,6 +621,7 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
>  	cursor->priority = 0;
>  	cursor->man = man;
>  	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> +	INIT_LIST_HEAD(&cursor->bulk_link);
>  	list_add(&cursor->hitch.link, &man->lru[cursor->priority]);
>  
>  	return ttm_resource_manager_next(cursor);
> @@ -558,6 +646,7 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>  		lru = &cursor->hitch;
>  		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
>  			if (ttm_lru_item_is_res(lru)) {
> +				ttm_resource_cursor_check_bulk(cursor, lru);
>  				list_move(&cursor->hitch.link, &lru->link);
>  				return ttm_lru_item_to_res(lru);
>  			}
> @@ -567,9 +656,10 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>  			break;
>  
>  		list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
> +		ttm_resource_cursor_clear_bulk(cursor);
>  	} while (true);
>  
> -	list_del_init(&cursor->hitch.link);
> +	ttm_resource_cursor_fini_locked(cursor);

Nit: A patch eariler in the series which introduces this code should
probably just ttm_resource_cursor_fini_locked.

Matt

>  
>  	return NULL;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2dbba55e7785..45e1975eed26 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1262,6 +1262,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  
>  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
>  
> +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> +
>  	INIT_LIST_HEAD(&vm->preempt.exec_queues);
>  	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
>  
> @@ -1379,6 +1381,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	mutex_destroy(&vm->snap_mutex);
>  	for_each_tile(tile, xe, id)
>  		xe_range_fence_tree_fini(&vm->rftree[id]);
> +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
>  	kfree(vm);
>  	if (!(flags & XE_VM_FLAG_MIGRATION))
>  		xe_device_mem_access_put(xe);
> @@ -1518,6 +1521,7 @@ static void vm_destroy_work_func(struct work_struct *w)
>  		XE_WARN_ON(vm->pt_root[id]);
>  
>  	trace_xe_vm_free(vm);
> +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
>  	kfree(vm);
>  }
>  
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index dfc01258c981..ed09b49a001e 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -211,6 +211,9 @@ struct ttm_resource_manager {
>  	 * bdev->lru_lock.
>  	 */
>  	uint64_t usage;
> +
> +	/** @mem_type: The memory type used for this manager. */
> +	unsigned int mem_type;
>  };
>  
>  /**
> @@ -269,25 +272,6 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
>  	return container_of(item, struct ttm_resource, lru);
>  }
>  
> -/**
> - * struct ttm_resource_cursor
> - * @man: The resource manager currently being iterated over
> - * @hitch: A hitch list node inserted before the next resource
> - * to iterate over.
> - * @priority: the current priority
> - *
> - * Cursor to iterate over the resources in a manager.
> - */
> -struct ttm_resource_cursor {
> -	struct ttm_resource_manager *man;
> -	struct ttm_lru_item hitch;
> -	unsigned int priority;
> -};
> -
> -void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
> -
> -void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
> -
>  /**
>   * struct ttm_lru_bulk_move_pos
>   *
> @@ -303,8 +287,9 @@ struct ttm_lru_bulk_move_pos {
>  
>  /**
>   * struct ttm_lru_bulk_move
> - *
>   * @pos: first/last lru entry for resources in the each domain/priority
> + * @cursor_list: The list of cursors currently traversing any of
> + * the sublists of @pos. Protected by the ttm device's lru_lock.
>   *
>   * Container for the current bulk move state. Should be used with
>   * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_move().
> @@ -314,8 +299,39 @@ struct ttm_lru_bulk_move_pos {
>   */
>  struct ttm_lru_bulk_move {
>  	struct ttm_lru_bulk_move_pos pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];
> +	struct list_head cursor_list;
> +};
> +
> +/**
> + * struct ttm_resource_cursor
> + * @man: The resource manager currently being iterated over
> + * @hitch: A hitch list node inserted before the next resource
> + * to iterate over.
> + * @bulk_link: A list link for the list of cursors traversing the
> + * bulk sublist of @bulk. Protected by the ttm device's lru_lock.
> + * @bulk: Pointer to struct ttm_lru_bulk_move whose subrange @hitch is
> + * inserted to. NULL if none. Never dereference this pointer since
> + * the struct ttm_lru_bulk_move object pointed to might have been
> + * freed. The pointer is only for comparison.
> + * @mem_type: The memory type of the LRU list being traversed.
> + * This field is valid iff @bulk != NULL.
> + * @priority: the current priority
> + *
> + * Cursor to iterate over the resources in a manager.
> + */
> +struct ttm_resource_cursor {
> +	struct ttm_resource_manager *man;
> +	struct ttm_lru_item hitch;
> +	struct list_head bulk_link;
> +	struct ttm_lru_bulk_move *bulk;
> +	unsigned int mem_type;
> +	unsigned int priority;
>  };
>  
> +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
> +
> +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
> +
>  /**
>   * struct ttm_kmap_iter_iomap - Specialization for a struct io_mapping +
>   * struct sg_table backed struct ttm_resource.
> @@ -404,6 +420,8 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
>  
>  void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
>  void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
> +void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
> +			    struct ttm_lru_bulk_move *bulk);
>  
>  void ttm_resource_add_bulk_move(struct ttm_resource *res,
>  				struct ttm_buffer_object *bo);
> -- 
> 2.44.0
> 
