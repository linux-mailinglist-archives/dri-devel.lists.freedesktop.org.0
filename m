Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C788091099C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E3210EA5E;
	Thu, 20 Jun 2024 15:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtT127U/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DD210E0DA;
 Thu, 20 Jun 2024 15:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718896665; x=1750432665;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kBvOYu8GdTYd9G8fHyWFfNLM1HbvAKwWDx8HnmQzxIk=;
 b=gtT127U/IIh+59rOw487K4r2ug+B8v3DqZ7K/DGx7YBMlYsWbI7HL89W
 MRrIviwis0bij5gkJiUIk/n6RW1zHtadmcdi5/584bDJJ7qvL92XXpyiW
 Urmr8G4aO5nlDqYwgsgfbaThUkdYLJq6wf9BBvYVPhhfUcukn/LMi0ViS
 ji+7TflJEErTyIx4y3EhaFcAO1+K7xcFkUPUtdiOddzfjbWKS9iV6hwHV
 qH1q8OptGLSbuWStCfpW+AVU19nZTj5S71pyI5tEvucjke4W663S+QPSR
 PueqLRDfax+dvo21hwoKvmSSOiw3AxLBFqQo6Uw9X7olGfGm04BLJeZFH w==;
X-CSE-ConnectionGUID: fY3lgic1SlyXJzfZGHeDMQ==
X-CSE-MsgGUID: Z9Lby3uFRJamoDt79igNUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="27010467"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="27010467"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 08:17:45 -0700
X-CSE-ConnectionGUID: eexNw03BT4uI3zB0R0gNgA==
X-CSE-MsgGUID: Ct3oyvugTzSU5LPTnCVDbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42387999"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 08:17:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 08:17:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 08:17:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 08:17:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 08:17:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZxDftczS70QiYaS4JYTi7tkH08HG0YB0rvImeO/SqQ3YtxbJQTStDKqqUHFCEHx51GZMutjWq1c/cFIuttiH+xHUfcaKWRLQkdKwXPj5Htq9vYLkLXMHZ/fxuQYG6NluEOSXt5Hda4HS5LzLJCs3DXZFGLHaw2mVyNuMl2dD2gSd1J256bVPckdy3Pg/lvEVlAZwdCGBbRZb1b5WdtBSD+oFq7meKJkrfLG+xaHuWLw9oDFU64tMkoI7vgI0Ik6CZCQlrJqj5ficKLFjsFlgZOqGVvAx1F2SBd282O7GdH3PHqYr5x0oLbrHJo+xirQfmak4Hzcupv+jGhN6tgDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vv4FZV95YAAEn9EqiqBm1W9ZjcUbFrpZ9HUMElKzDD4=;
 b=P40Adl1/TeBUjY1WwsWDDArJoXZJgT7WQvA8zg5cgHN3L2+86xj6RqPuY4vuTmS++bMABPjexZeYW6gdA+LAjEVu0nb1bvyZ/VGP9+puGdC9jYzq7o8+zYf8KqcmwQWAqVo1/qmKvqkNc5IzJDtt5ikU86FrDaqtpdzktitpFJOdXUEEN6GDv9yv3BGIjpSP4OZDfHy9t7zKH61RVXYsD+P3LmMTIAsGB+Sm+/pP+ltv1JEHiTbQ+f4x01ifnK4qnjtvj5J7RZb0Sfb5NsowI/fLeNMUdF7RRimE6oyiKR2YduyP/BkcAYCqEssU/LAcQYaNVCGUZGzVOKiqGy4Qnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4981.namprd11.prod.outlook.com (2603:10b6:510:39::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 15:17:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.033; Thu, 20 Jun 2024
 15:17:40 +0000
Date: Thu, 20 Jun 2024 15:17:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 08/12] drm/ttm: Add a virtual base class for graphics
 memory backup
Message-ID: <ZnRH73TPv4v3yg4/@DUT025-TGLU.fm.intel.com>
References: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
 <20240618071820.130917-9-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240618071820.130917-9-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4981:EE_
X-MS-Office365-Filtering-Correlation-Id: 39bfc1d5-ccb4-4bb9-b68d-08dc913c1fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PEmj5ZZI3CeGpB5mxBSZOtBfEWQhgLvaH4OLQ+YESL7n7D6Acqitxakjaj?=
 =?iso-8859-1?Q?+tD2iV7UIpk/JiHNWWB+MmD/s4G61fV/16/kfD9lttPnXLa3vOoRZr8SWH?=
 =?iso-8859-1?Q?QzZrQ5DE95eg8BfJP2WdmXDKNhi13NIPL1XpJFOMpQ2quL6nPigVFqIwCg?=
 =?iso-8859-1?Q?uakrAePzuZd1JmQDxY5Xvw1199g+2D5emaN/JyuoWiBe3DPyQbySoxgzjR?=
 =?iso-8859-1?Q?A+Nc69J2t7iyf9FiBi2oSij6xHjdDIHeSenpDRG6J0pHoVhEyIYbGBdNXa?=
 =?iso-8859-1?Q?pBVqf4UAf/zbEMC36WKwqfjPggVUjwReHdtbzG22K/3164PhTx5XWhohAd?=
 =?iso-8859-1?Q?aMfyABd+7GCcjaG6IS3MXIIMyTwPXhkR6GGVP2wBVAu1lEVeBW5O1ycH9O?=
 =?iso-8859-1?Q?l7hdom3Tmdup1hNXti8o23+hIERXsEeCDbO9JxJXoR18pZcIMAjpIEA1de?=
 =?iso-8859-1?Q?G+lE0vCo/zRpm7IOWhw52Thm/fF6t3bBAurlYddzn2eTNCoK7/Xv5FIR+A?=
 =?iso-8859-1?Q?mTYc6oAfX7wXi2SxXUj5eSU/Wvo3FTCj72MABQV/8Hxi4oK0gY9kSuyjb/?=
 =?iso-8859-1?Q?aVwL/k+a8EdwTrPbCkrIt1y6d8ezII9AO2hjqhRjbGhurAYW6EkSHICl4I?=
 =?iso-8859-1?Q?036ZyPD1qJzqoBrkP6nBtbCDLdh4UWMIPOYNFNcnrE+xozZlBltcxUMtwx?=
 =?iso-8859-1?Q?62WmlzOUYPALr8ypL+sDZ7wfxEl0B3JT7H7GCK2m9huDhE74K8uI/Gt6yU?=
 =?iso-8859-1?Q?Y3WQJ/+LyWPEfPGTJcCgvSmFrmHxSSEGXEh2QPzny4fvrOJWKcGLJK7fGr?=
 =?iso-8859-1?Q?XWw18tfbxDO10NZM0G72kISiZe+Shd9lyo0l8pI22d1ksQQyAphcwfelPy?=
 =?iso-8859-1?Q?tOfU0d9XHIQXzmhw941vv6wl5wmLMkmfQI+F2tuamxWJdqE0TlVSd4cFmg?=
 =?iso-8859-1?Q?mBpgVRYGiMjEiiUePZkYoi5p7FjsOQ3dBvJnEzFLo+GegFgzq1HoMKNToe?=
 =?iso-8859-1?Q?Sa/ofNNXFRyGU+TUV2rW2OXowLR9GXRt+XuA+EJfZRlY58814Cort0hhEL?=
 =?iso-8859-1?Q?HCsRP9q0Dma45uCA0XMCHCNcd1dUYk59EcKueZEydbRmLRz4mcwpz9gsHN?=
 =?iso-8859-1?Q?WQK+fn8XPugwrpYjMykYi+VScebN6QN7SZz1r29vgAKJSb7p/SHtMfwQNb?=
 =?iso-8859-1?Q?b3LpD0xUOKp83zM8//desg95V8quRTjCjLc2YsHS0nBPpTV4ER6eH3LOOo?=
 =?iso-8859-1?Q?g3DNsuijnYqAK0L/531sssiJe+WbfCsqy+nRrs1HOtybs9KxR7g5ApIe8y?=
 =?iso-8859-1?Q?MhPVgPJ8qauwx5IhZgRJ4vITdeYwYOD0h181N67+aWFVYGLJ3XUbPVm6qW?=
 =?iso-8859-1?Q?fN6vSEcI7p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?f7G6AycEoBjkMhOMPA4x4+9bsbjGcIdacorE1fQgTFsiajXueIXSZQjC8S?=
 =?iso-8859-1?Q?ZE7oYB7ZlFRF6RnS/J/Yq7AADatp6A5KKWIGOGKQh0wg+3f7kl91ECpRvj?=
 =?iso-8859-1?Q?+x9g1ZSVZ1ozvJld3HjtsudkgSTJf8aTf54Hu9a8Tw1nU/y1TxpPNZUjHv?=
 =?iso-8859-1?Q?6JhNQ7Jt83EQeRMLT8YUIAPdQhM3p1UvqQoM7fA27pkOCbLz2QaLBvEoNV?=
 =?iso-8859-1?Q?szrZpGvbz+NaJ0Fm6gs8B7JSBdbqbm3PUpyx+YMlq9ns0u9q9zlPDmkLU8?=
 =?iso-8859-1?Q?yUB3UoGJe+Jhyogjii5NyWX1y/B4J+ojgQ/CZpzJZbKvQgLic1pUtMBDll?=
 =?iso-8859-1?Q?6beocunQMWqlACbRq8N/kggtY61YKeGwHSy68sYvRSXSoeMSLBQMyBnds/?=
 =?iso-8859-1?Q?UHZPTXL13x9a1O423uhVV8N9xAZ//3+fFyAYUc6z2Bhp7pq7NBfHypRuMz?=
 =?iso-8859-1?Q?SKXsyCxdYkVq7WxTWavmX43OLPAfXrdaZQk+g0/b1O6ew7QFEgxWnsmNR7?=
 =?iso-8859-1?Q?F1tuidm9wxmroeY2Kc6/3lttNNrAvM1h/JkZ0mh557Z9KtZbWX0gssMABm?=
 =?iso-8859-1?Q?33GgF9H/SjAh7WAFaqxsH8Vc3qOuGshxJLsMidTWzMFEh5u7neMWHAt3NW?=
 =?iso-8859-1?Q?vLQPwpyejHPtScbZdY+FZ849ftBfQLvD8nKzxp6QmfAxUGuMkb51EtMPp+?=
 =?iso-8859-1?Q?LsxNi9tq84Bcjt52o3QwEMmxiKWmxGADVDSHdHZSRNSa0AN32OIhc3k0LZ?=
 =?iso-8859-1?Q?5LLXm5sKuDjzpn7QCzALLKsYVskOfmLOwQvhgfnIpa+ohx4MFXu8zG4VyQ?=
 =?iso-8859-1?Q?8ttmwq5AuNGUAawzoiYmtfIuBb8H3+U6Nv9HCD56rANT49qxNHG7XJrqQO?=
 =?iso-8859-1?Q?Q8gvfQP3w7xBW7QLelJu7/apNKQx6QwJacfwuRdQTQr7UEGsF/oUpEVp1i?=
 =?iso-8859-1?Q?wHc2Hqd9y4lEkthiojtzQi8CX23fDc2Jdw7SQ/WVDB5vqf8vyEjLK0b6ty?=
 =?iso-8859-1?Q?P5FPXtjFUex9kUXNT6XOY1rwPqxhqBupjd1m+YyjzL+5CGLVfZfJpokts5?=
 =?iso-8859-1?Q?ATZBG1t6PCb8qyaCu3/In4s3gbw41FN4M4/U4ZW+uL+vEIOEPcYvnpA277?=
 =?iso-8859-1?Q?UKdm05yI1zQBq+RY6j9auPUY8i99DpMK5px+HdqpXJFYDo9PA0qkvlOhek?=
 =?iso-8859-1?Q?rDGvi1vNKubDqZW8kZR7gpKRdIYZ/eYQw4rh0PC9C+yaKo8j0NxlhpH2eS?=
 =?iso-8859-1?Q?spr0Ad7FMkykVqE95ldpCJqFhSdld5t7tsYkTrLeOtUkiMeFlTg9JiLMpH?=
 =?iso-8859-1?Q?LgPfUt8wGgLFPrOZnIvVH+voULJV4u+G0BqseZjCkCRmtQA/EEDrToDNxq?=
 =?iso-8859-1?Q?9EfhN03mLGYSxSHSq0Dd4U6r3FFhP6HgQMdaH4bBILo+Qic4CFvcrpljDt?=
 =?iso-8859-1?Q?mWb/1cs4YSXrogja6dSEX3yGvCv1rFPynPhg833AtP5BzEhlPrq7MAWtl0?=
 =?iso-8859-1?Q?GKy90RmoJ6vwu8JnujQ67QUKR1Q2mgXvxmPQeViEj8kNSOlyf4zI8/E4Yb?=
 =?iso-8859-1?Q?g/MMx+FTWVBrZfUL5BCL/rgdS/DacTzCeeQllrAawfwxCR0DyFZO/YesFz?=
 =?iso-8859-1?Q?hdq5REv8tuBqJWltx20bXxx2k4rnCeJ88xZBGEBxBDuEAkLpuywZ+LzQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39bfc1d5-ccb4-4bb9-b68d-08dc913c1fc6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 15:17:39.8442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qd7geOepskJW9hS7c1+HSPCDq67oW8Mo4IMiMULBpfEx5YeKAdY33XErJX56Zau8ajDwEuGKvgg8X486gy/fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4981
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

On Tue, Jun 18, 2024 at 09:18:16AM +0200, Thomas Hellström wrote:
> Initially intended for experimenting with different backup
> solutions (shmem vs direct swap cache insertion), abstract
> the backup destination using a virtual base class.
> 
> Also provide a sample implementation for shmem.
> 
> While when settling on a preferred backup solution, one could
> perhaps skip the abstraction, this functionality may actually
> come in handy for configurable dedicated graphics memory
> backup to fast nvme files or similar, whithout affecting
> swap-space. Could indeed be useful for VRAM backup on S4 and
> other cases.
> 

Implementation seemly makes sense and matches other similar usages of shmem /
folio functions I could find in the kernel.

A few questions / nits below.

> v5:
> - Fix a UAF. (kernel test robot, Dan Carptenter)
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/Makefile           |   2 +-
>  drivers/gpu/drm/ttm/ttm_backup_shmem.c | 139 +++++++++++++++++++++++++
>  include/drm/ttm/ttm_backup.h           | 136 ++++++++++++++++++++++++
>  3 files changed, 276 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
>  create mode 100644 include/drm/ttm/ttm_backup.h
> 
> diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
> index dad298127226..5e980dd90e41 100644
> --- a/drivers/gpu/drm/ttm/Makefile
> +++ b/drivers/gpu/drm/ttm/Makefile
> @@ -4,7 +4,7 @@
>  
>  ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
>  	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
> -	ttm_device.o ttm_sys_manager.o
> +	ttm_device.o ttm_sys_manager.o ttm_backup_shmem.o
>  ttm-$(CONFIG_AGP) += ttm_agp_backend.o
>  
>  obj-$(CONFIG_DRM_TTM) += ttm.o
> diff --git a/drivers/gpu/drm/ttm/ttm_backup_shmem.c b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
> new file mode 100644
> index 000000000000..f5bc47734d71
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <drm/ttm/ttm_backup.h>
> +#include <linux/page-flags.h>
> +
> +/**
> + * struct ttm_backup_shmem - A shmem based ttm_backup subclass.
> + * @backup: The base struct ttm_backup
> + * @filp: The associated shmem object
> + */
> +struct ttm_backup_shmem {
> +	struct ttm_backup backup;
> +	struct file *filp;
> +};
> +
> +static struct ttm_backup_shmem *to_backup_shmem(struct ttm_backup *backup)
> +{
> +	return container_of(backup, struct ttm_backup_shmem, backup);
> +}
> +
> +static void ttm_backup_shmem_drop(struct ttm_backup *backup, unsigned long handle)
> +{
> +	handle -= 1;

Can you explain the -1 / +1 usage to handle in this code? Is it to test
that 'pgoff_t i' is indeed just a hint and return a different handle?

> +	shmem_truncate_range(file_inode(to_backup_shmem(backup)->filp), handle,
> +			     handle + 1);
> +}
> +
> +static int ttm_backup_shmem_copy_page(struct ttm_backup *backup, struct page *dst,
> +				      unsigned long handle, bool killable)

In the vfunc definition 'killable' is named 'intr'. I'd keep the naming
consistent.

> +{
> +	struct file *filp = to_backup_shmem(backup)->filp;
> +	struct address_space *mapping = filp->f_mapping;
> +	struct folio *from_folio;
> +
> +	handle -= 1;
> +	from_folio = shmem_read_folio(mapping, handle);
> +	if (IS_ERR(from_folio))
> +		return PTR_ERR(from_folio);
> +
> +	/* Note: Use drm_memcpy_from_wc? */
> +	copy_highpage(dst, folio_file_page(from_folio, handle));
> +	folio_put(from_folio);
> +
> +	return 0;
> +}
> +
> +static unsigned long
> +ttm_backup_shmem_backup_page(struct ttm_backup *backup, struct page *page,
> +			     bool writeback, pgoff_t i, gfp_t page_gfp,
> +			     gfp_t alloc_gfp)
> +{
> +	struct file *filp = to_backup_shmem(backup)->filp;
> +	struct address_space *mapping = filp->f_mapping;
> +	unsigned long handle = 0;
> +	struct folio *to_folio;
> +	int ret;
> +
> +	to_folio = shmem_read_folio_gfp(mapping, i, alloc_gfp);
> +	if (IS_ERR(to_folio))
> +		return handle;
> +
> +	folio_mark_accessed(to_folio);

Does this not need to be after 'folio_lock'?

> +	folio_lock(to_folio);
> +	folio_mark_dirty(to_folio);
> +	copy_highpage(folio_file_page(to_folio, i), page);
> +	handle = i + 1;
> +
> +	if (writeback && !folio_mapped(to_folio) && folio_clear_dirty_for_io(to_folio)) {
> +		struct writeback_control wbc = {
> +			.sync_mode = WB_SYNC_NONE,
> +			.nr_to_write = SWAP_CLUSTER_MAX,
> +			.range_start = 0,
> +			.range_end = LLONG_MAX,
> +			.for_reclaim = 1,
> +		};
> +		folio_set_reclaim(to_folio);
> +		ret = mapping->a_ops->writepage(folio_page(to_folio, 0), &wbc);
> +		if (!folio_test_writeback(to_folio))
> +			folio_clear_reclaim(to_folio);
> +		/* If writepage succeeds, it unlocks the folio */
> +		if (ret)
> +			folio_unlock(to_folio);
> +	} else {
> +		folio_unlock(to_folio);
> +	}
> +
> +	folio_put(to_folio);
> +
> +	return handle;
> +}
> +
> +static void ttm_backup_shmem_fini(struct ttm_backup *backup)
> +{
> +	struct ttm_backup_shmem *sbackup = to_backup_shmem(backup);
> +
> +	fput(sbackup->filp);
> +	kfree(sbackup);
> +}
> +
> +static const struct ttm_backup_ops ttm_backup_shmem_ops = {
> +	.drop = ttm_backup_shmem_drop,
> +	.copy_backed_up_page = ttm_backup_shmem_copy_page,
> +	.backup_page = ttm_backup_shmem_backup_page,
> +	.fini = ttm_backup_shmem_fini,
> +};
> +
> +/**
> + * ttm_backup_shmem_create() - Create a shmem-based struct backup.
> + * @size: The maximum size (in bytes) to back up.
> + *
> + * Create a backup utilizing shmem objects.
> + *
> + * Return: A pointer to a struct ttm_backup on success,
> + * an error pointer on error.
> + */
> +struct ttm_backup *ttm_backup_shmem_create(loff_t size)
> +{
> +	struct ttm_backup_shmem *sbackup =
> +		kzalloc(sizeof(*sbackup), GFP_KERNEL | __GFP_ACCOUNT);
> +	struct file *filp;
> +
> +	if (!sbackup)
> +		return ERR_PTR(-ENOMEM);
> +
> +	filp = shmem_file_setup("ttm shmem backup", size, 0);
> +	if (IS_ERR(filp)) {
> +		kfree(sbackup);
> +		return ERR_CAST(filp);
> +	}
> +
> +	sbackup->filp = filp;
> +	sbackup->backup.ops = &ttm_backup_shmem_ops;
> +
> +	return &sbackup->backup;
> +}
> +EXPORT_SYMBOL_GPL(ttm_backup_shmem_create);
> diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
> new file mode 100644
> index 000000000000..88e8b97a6fdc
> --- /dev/null
> +++ b/include/drm/ttm/ttm_backup.h
> @@ -0,0 +1,136 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _TTM_BACKUP_H_
> +#define _TTM_BACKUP_H_
> +
> +#include <linux/mm_types.h>
> +#include <linux/shmem_fs.h>
> +
> +struct ttm_backup;
> +
> +/**
> + * ttm_backup_handle_to_page_ptr() - Convert handle to struct page pointer
> + * @handle: The handle to convert.
> + *
> + * Converts an opaque handle received from the
> + * struct ttm_backoup_ops::backup_page() function to an (invalid)
> + * struct page pointer suitable for a struct page array.
> + *
> + * Return: An (invalid) struct page pointer.
> + */
> +static inline struct page *
> +ttm_backup_handle_to_page_ptr(unsigned long handle)
> +{
> +	return (struct page *)(handle << 1 | 1);
> +}
> +
> +/**
> + * ttm_backup_page_ptr_is_handle() - Whether a struct page pointer is a handle
> + * @page: The struct page pointer to check.
> + *
> + * Return: true if the struct page pointer is a handld returned from
> + * ttm_backup_handle_to_page_ptr(). False otherwise.
> + */
> +static inline bool ttm_backup_page_ptr_is_handle(const struct page *page)
> +{
> +	return (unsigned long)page & 1;
> +}
> +
> +/**
> + * ttm_backup_page_ptr_to_handle() - Convert a struct page pointer to a handle
> + * @page: The struct page pointer to convert
> + *
> + * Return: The handle that was previously used in
> + * ttm_backup_handle_to_page_ptr() to obtain a struct page pointer, suitable
> + * for use as argument in the struct ttm_backup_ops drop() or
> + * copy_backed_up_page() functions.
> + */
> +static inline unsigned long
> +ttm_backup_page_ptr_to_handle(const struct page *page)
> +{
> +	WARN_ON(!ttm_backup_page_ptr_is_handle(page));
> +	return (unsigned long)page >> 1;
> +}
> +
> +/** struct ttm_backup_ops - A struct ttm_backup backend operations */
> +struct ttm_backup_ops {
> +	/**
> +	 * drop - release memory associated with a handle
> +	 * @backup: The struct backup pointer used to obtain the handle
> +	 * @handle: The handle obtained from the @backup_page function.
> +	 */
> +	void (*drop)(struct ttm_backup *backup, unsigned long handle);
> +
> +	/**
> +	 * copy_backed_up_page - Copy the contents of a previously backed
> +	 * up page
> +	 * @backup: The struct backup pointer used to back up the page.
> +	 * @dst: The struct page to copy into.
> +	 * @handle: The handle returned when the page was backed up.

The above two are arguments flipped in order compared to function
definition.

Matt

> +	 * @intr: Try to perform waits interruptable or at least killable.
> +	 *
> +	 * Return: 0 on success, Negative error code on failure, notably
> +	 * -EINTR if @intr was set to true and a signal is pending.
> +	 */
> +	int (*copy_backed_up_page)(struct ttm_backup *backup, struct page *dst,
> +				   unsigned long handle, bool intr);
> +
> +	/**
> +	 * backup_page - Backup a page
> +	 * @backup: The struct backup pointer to use.
> +	 * @page: The page to back up.
> +	 * @writeback: Whether to perform immediate writeback of the page.
> +	 * This may have performance implications.
> +	 * @i: A unique integer for each page and each struct backup.
> +	 * This is a hint allowing the backup backend to avoid managing
> +	 * its address space separately.
> +	 * @page_gfp: The gfp value used when the page was allocated.
> +	 * This is used for accounting purposes.
> +	 * @alloc_gfp: The gpf to be used when the backend needs to allocaete
> +	 * memory.
> +	 *
> +	 * Return: A handle on success. 0 on failure.
> +	 * (This is following the swp_entry_t convention).
> +	 *
> +	 * Note: This function could be extended to back up a folio and
> +	 * backends would then split the folio internally if needed.
> +	 * Drawback is that the caller would then have to keep track of
> +	 */
> +	unsigned long (*backup_page)(struct ttm_backup *backup, struct page *page,
> +				     bool writeback, pgoff_t i, gfp_t page_gfp,
> +				     gfp_t alloc_gfp);
> +	/**
> +	 * fini - Free the struct backup resources after last use.
> +	 * @backup: Pointer to the struct backup whose resources to free.
> +	 *
> +	 * After a call to @fini, it's illegal to use the @backup pointer.
> +	 */
> +	void (*fini)(struct ttm_backup *backup);
> +};
> +
> +/**
> + * struct ttm_backup - Abstract a backup backend.
> + * @ops: The operations as described above.
> + *
> + * The struct ttm_backup is intended to be subclassed by the
> + * backend implementation.
> + */
> +struct ttm_backup {
> +	const struct ttm_backup_ops *ops;
> +};
> +
> +/**
> + * ttm_backup_shmem_create() - Create a shmem-based struct backup.
> + * @size: The maximum size (in bytes) to back up.
> + *
> + * Create a backup utilizing shmem objects.
> + *
> + * Return: A pointer to a struct ttm_backup on success,
> + * an error pointer on error.
> + */
> +struct ttm_backup *ttm_backup_shmem_create(loff_t size);
> +
> +#endif
> -- 
> 2.44.0
> 
