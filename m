Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1198A9A55EB
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 20:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E2810E0D7;
	Sun, 20 Oct 2024 18:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azsEboMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C9D10E09B;
 Sun, 20 Oct 2024 18:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729450563; x=1760986563;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JE+l3QNkLWv/b2vdpRF6G3x53Xk5vrWdtiWRNufB6tk=;
 b=azsEboMUfxMd5X7OYsA6m1Th5TMSm2Z++x5Q6OaxEaAC6u9HPFap5u1H
 bizMaoN2Kn/EYppr+VuVLx/VitMUJ2QXp8BJ8QYKSvEWqrY1iFOilwsT2
 ZE1a6wX405nd0+kSs1+Ls9KMY6VDjVSlBqeZMfXiIhZ4un1NrAAkr2T/v
 6RLXwosSzhrNmljQYzINjb4FXyJe1Kh9n+W7Vd0vZOYFbEWDWLOmRb45M
 EkTyS6036ikt7pvNsSJ/GG2qJAjwDAeW+nzgbDyqvYQR25HXOxTxlTxRD
 4KOtAAy7vSzOgf7CtGCw2uBgKVrhu91C49LdLAccVnIpvPkmLlI9UBelc w==;
X-CSE-ConnectionGUID: qoMI2vFATsGKdrRJbTWFIA==
X-CSE-MsgGUID: 9dlrIIcITOm4dA9iijBrVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="28808033"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; d="scan'208";a="28808033"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 11:56:01 -0700
X-CSE-ConnectionGUID: qCw4oV6NQC6JovO+fhEFNw==
X-CSE-MsgGUID: POYMFT0UTMS0eN8mGS+IPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; d="scan'208";a="84117616"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2024 11:56:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 11:56:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 11:56:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 20 Oct 2024 11:56:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 20 Oct 2024 11:56:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCCVJyJdyBHCcJS5Kf91L/7j0xlhg5nQDH6cYRZOrMbJwA5ILg+HZdLmJY0LHm2rKPH3J9iQxfV9Zz8ncxBm8YM4b4H7H4b5U2X9B3GByUqeD6b7WdgU0BkDPEIMHIx/6yoNsRXTc68OIDUn9u46kymdqBA0Ta66Uztek2h6VHQVFFQFYOwqypjeFYnLnqeXS5KcjtOUOTD8gL+YFSopY1IG3tAKtM/QxF4O2bUgT85bkBw23zoW3IEraZdADRxqGaGu4hmwQnLl8qp46KC26LvyTnwD6l/hBsxiUF6t0bNe9NHoPrg4Ih0+z3lvTReP8aeaM0SDZSV14aUXrWPzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9tK6mM8EsW6+9uA1n1Qi44xGsWHXR7NMFgImPo4NIc=;
 b=qWJtGp3ev05zrdsZCATPPSDD6IjMRCOHGjoJuxE+JvZEYm4wwV8kHs4I59DixqKG6goZ0ljWc9x8jqE7/U4baGfFjtF5mlZBzKkV7R7xIgcgEMj7MJZmofK2I7BVX1eOSRd9Xs6ai8GulCd4As/ooryj4HNICun3xZ83dNwiEW9Lpb2KsfMcEXnvLCnEn68x4FiiPyci0E43+7iozBftEq0EevWSW2T89ZaV+7NN3QztwH9PFrkx2fw715BrQ4nVLSo4S+l0HmsO7Y8q9zNlV2jN4COwhNcnQdteOiB/GU7mJdB7d8I424j3pbvUJSp1Uq1FK3syQzAPfjt8iIeWpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7454.namprd11.prod.outlook.com (2603:10b6:a03:4cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Sun, 20 Oct
 2024 18:55:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.024; Sun, 20 Oct 2024
 18:55:57 +0000
Date: Sun, 20 Oct 2024 18:54:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v11 5/8] drm/ttm: Add a macro to perform LRU iteration
Message-ID: <ZxVSAdDUEvC34uCn@DUT025-TGLU.fm.intel.com>
References: <20241016085559.11840-1-thomas.hellstrom@linux.intel.com>
 <20241016085559.11840-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241016085559.11840-6-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0022.prod.exchangelabs.com (2603:10b6:a02:80::35)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc44087-6928-4d2d-f5e4-08dcf138d4fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bhd6xFORdHWVOWffpjFitkmKYVn6552T3hJgZZC1blQChoawVCUkyHR4Vb?=
 =?iso-8859-1?Q?+dpPtF825QeoKJGxoYqKpNzFobWHDGwUEZ9/YkHij5pSJINAHmBhdZxQAp?=
 =?iso-8859-1?Q?+Kqt7ir7zjqEWdPbuqTeIcaewi5MyVxs1LX3FpCGzRrg1MLFj7QW45YhWk?=
 =?iso-8859-1?Q?WjnFGpbx3caT1A3vr5QV8fBW/5Hg51QsU55X/fFQMcdKG04lmsP96IGx8L?=
 =?iso-8859-1?Q?A8zGvmyU8V6W3TtCaAUyo9SVykMW3M7Yu6C6v1oB8PjyB8327M6AIiX5rK?=
 =?iso-8859-1?Q?wWVhYRC+rs+5CaZv4pvS+OYrackxNAi8lWX8ar18ZPPZExoZShwsrpPTUU?=
 =?iso-8859-1?Q?3tyvxkDRH7derSZWAlO3ub2Db402V+4ofvrqEz/mlVlSd2RF/yMAsOxmdB?=
 =?iso-8859-1?Q?sDIOAeq+a94MgHyOnTyzFTNFgYM4EM9S1uz4YgMtu5p+ewQnt5qEwwQWzT?=
 =?iso-8859-1?Q?b0/vqeWCqPoIdSv+CmIKNTQ+/5nCWlMtgRZpLHGQJShZttBtEV/imCVIiv?=
 =?iso-8859-1?Q?rXiYKUFbR5ukSdwHaSfLPBAoMr+H6VfFze0M7FisV51yU6kQm0bChWes/p?=
 =?iso-8859-1?Q?KEBCoLDXOt1f+ht43lXxY08SpFTmCa6ZPky/V7HnBBhu+Z+as3k4KqX10H?=
 =?iso-8859-1?Q?Ull15KtAKSE41tblmBKcKQka92UWXM1aYKrzl/7hRPeIvoQ3RCyePHWXrF?=
 =?iso-8859-1?Q?lQWFeEp9DSOtRA0qaOjtwEdGgYfXZvaECepA82llU8Bd/wxE0DrD1rWHFB?=
 =?iso-8859-1?Q?hxFFFfSYMofPDraC7sxUAhAENwb6742mnEIJJjNuLhEx+miHJyPv/P16W2?=
 =?iso-8859-1?Q?8ilJtUTU1fVqKs4M86Hg3AId/ePe1l4efMWf4gfP63cDSj/V4eG3so6eoz?=
 =?iso-8859-1?Q?w1yI92Wj1sQrPXZcw2LSGt5/TfLqkNXkoyVsTGic1i2dFrOOL4G8QNFosk?=
 =?iso-8859-1?Q?b9AP3kYsWMcl/o3uEwDxNEbcTa1yOGyZRavDwfmnhW5OvjlucPZoBIreHh?=
 =?iso-8859-1?Q?Xrn7NR5MDlth31ihx8souqc/it+Xslc/vjgl/0QO7q48kYf2ex9esQNiqS?=
 =?iso-8859-1?Q?LsLoCMtS/w9HIBEtQOwVFvATMxsF0uZ3mBk6FJFw453IEPMXTUnUCh7JAh?=
 =?iso-8859-1?Q?6cUvFywN4kJSPsSoLP5xVXPLjlzeTWiW7H40QAItW2gdlInQJIsIiFpVvt?=
 =?iso-8859-1?Q?OFEGSZQZ26O009BpVXmhaO3f8+7D1JfhdPefGSVz2c7eWw5if+LMDgQGrZ?=
 =?iso-8859-1?Q?7bJ6EGsTdbvXAnHCkgsQhTA7oydXkMgnw1/sUDzazQoHTnpAn7GGifb3mf?=
 =?iso-8859-1?Q?uu0IxnMI8KM8/J3sAlq0MI3GgJsT1oR2uwbA4uPnAT+OnsYda9M0RI+NTh?=
 =?iso-8859-1?Q?moe8gxG5dS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?98cWqTHsQoB29uDJKcg8vK4E5SYYpWkcmcXvNORfYdQNyhK3yrPZZnJV7F?=
 =?iso-8859-1?Q?irit/8YwBOUykeENwB3kRghU2b+ywOrHgUQDEaWHyMxM8KZgY+w3u/UtkA?=
 =?iso-8859-1?Q?kcl0PiIE4YO3p9vMhjYyDVjkBBn0e3MDvQkX2WEd1QkV+vKwUYXISKPbLp?=
 =?iso-8859-1?Q?4MHct9raBDOO7yGX4XXaz9OTQB0FuLhykHQTULs6s7+TYQ4SKTNjh50PL8?=
 =?iso-8859-1?Q?NmYKMIwJvc83Bu+x7s5OIwcGe8MqWeCigvBFI8mdaL8BUDi4tKTCK+bWxv?=
 =?iso-8859-1?Q?F0AktNgts27+8qW1b/cYpx+RgY/J74mDZJm2eBhBadUv9YFS6zsdgf5uXR?=
 =?iso-8859-1?Q?rNqgWpQEMBj6JO7RhHm9R67EYo4tUloIM6kJ0s+xELKBJYVR2qFMjxZWas?=
 =?iso-8859-1?Q?nw5LLwqIFWP27jvErlYeAiQjUmY31Qqym2rXuBMz3evcemBmCHRtKpTLrV?=
 =?iso-8859-1?Q?LVFzaZFkZZw2QDleJH7vIsWrW8EQZYdcfs+Xckjp9/l54VmUim9i8UpR71?=
 =?iso-8859-1?Q?tmY5xlu900TRzpzCz/SMK7NGvwA0Uwz3QSmpt7o54HUtYXALATo5Dt0A/b?=
 =?iso-8859-1?Q?ybQEAqM6xWI/H8W/5Uxjw5BBzTBz8SqftNqt/Vi6Vg5xybDmuyEzbnyhHJ?=
 =?iso-8859-1?Q?CXBc1auRAX2FjA7ZEw/Gkexfg4eWf7vWO71wWq0T15MDRMdRZanzDzK4CT?=
 =?iso-8859-1?Q?/0+XVvD3P5gcZujXFgf87JVlNUXZ+sTKHOF2ew/b0XHSPIk/XvkMi5feu+?=
 =?iso-8859-1?Q?xrhvYvdPcW13leHESbOKCchg7zOIsZ2JFASSxj9lJqhCQC4s2bP4SLOY3T?=
 =?iso-8859-1?Q?3kYsviUS1lQIe+plBYIe2/IK9QqdJT+yR9/FgKalWlGzpe/kW7xCWmWFOT?=
 =?iso-8859-1?Q?jZnJL5YaTPbd5Hsjjlg4dqrmNHo8zjdk6iOP+MiCt67CqKYLZpzawwZLjK?=
 =?iso-8859-1?Q?FKAL3bqSd3AdiHYMC/2SuXSxwhuFRSMss25DF0MztKnGiuHZeyN+0L8O4P?=
 =?iso-8859-1?Q?dUFsuv13OsHZtJUAevOwa3f+7C7gu5mx95dA4D0jcuXFcX0VJPnZEC2FtO?=
 =?iso-8859-1?Q?6zL5tZ4X2hynGz78pAZ0EkBOdD1Nf4n/c6cO80lZyQ9TGreG4TlfZkYI7k?=
 =?iso-8859-1?Q?nBA/5tyCLUdlSQYShUnE2Y2oeMJgEeucM3wyLkBAdSr2wuC09NLP7qyPzl?=
 =?iso-8859-1?Q?7ZOBRMAdGkkkJH+15lJjhfhcNf0yaBHVu1M8rjHVIzq8V56eifd9BbSZGY?=
 =?iso-8859-1?Q?BsN3VrQ2MmdybAXcy6Bia6SJ2NbjAv6J+bJM+TqqwP9mhl8ZhJj7b/v9bm?=
 =?iso-8859-1?Q?n4d60mZcqA17/o4XbuP8CyvzPtEicAaLU+u8IAihKcJNoAK2X9nf/cj1YV?=
 =?iso-8859-1?Q?/ERazEOaRsZiNbpEbWhhAqC+gvlJ3VCUWkzCVoP+R+5mZ+8zgA5emRzsVK?=
 =?iso-8859-1?Q?uvwDY3eDARjXkWhuAZBo/qxRaED3LUJ2fux/DMWCXgWog1I0fPzO1apYOO?=
 =?iso-8859-1?Q?DZWipgPupjmqagyget5Zn9ljlapGEhjwYOgvb/f3JwLM7CvzQsI952IanZ?=
 =?iso-8859-1?Q?LFprI0nP43lGdnjwZINGZSYKTReImHSo9+sQkhsi1VbU5DnW6IhJYjHgOx?=
 =?iso-8859-1?Q?4JgVUfB8ExxhnEg0NNSgHilt55Fq0Dh8NTaaJ3gkKg2FrLFwS7O+b3MQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc44087-6928-4d2d-f5e4-08dcf138d4fc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 18:55:57.4898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Q+w5ZSnefhekjMxS+/uj4+2xM8Fe1nYww4MpuRugo7VY7hZikq6cpu1V7ccYI7rM87vw3sSO8W7mKLpRb9FCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7454
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

On Wed, Oct 16, 2024 at 10:55:56AM +0200, Thomas Hellström wrote:
> Following the design direction communicated here:
> 
> https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9
> 
> Export a LRU walker for driver shrinker use. The walker
> initially supports only trylocking, since that's the
> method used by shrinkes. The walker makes use of
> scoped_guard() to allow exiting from the LRU walk loop
> without performing any explicit unlocking or
> cleanup.
> 
> v8:
> - Split out from another patch.
> - Use a struct for bool arguments to increase readability (Matt Brost).
> - Unmap user-space cpu-mappings before shrinking pages.
> - Explain non-fatal error codes (Matt Brost)
> 
> v10:
> - Instead of using the existing helper, Wrap the interface inside out and
>   provide a loop to de-midlayer things the LRU iteration (Christian König).
> - Removing the R-B by Matt Brost since the patch was significantly changed.
> 
> v11:
> - Split the patch up to include just the LRU walk helper.
> 

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 140 +++++++++++++++++++++++++++++-
>  include/drm/ttm/ttm_bo.h          |  71 +++++++++++++++
>  2 files changed, 207 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 917096bd5f68..0cac02a9764c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -769,12 +769,10 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>  	return ret;
>  }
>  
> -static bool ttm_lru_walk_trylock(struct ttm_lru_walk *walk,
> +static bool ttm_lru_walk_trylock(struct ttm_operation_ctx *ctx,
>  				 struct ttm_buffer_object *bo,
>  				 bool *needs_unlock)
>  {
> -	struct ttm_operation_ctx *ctx = walk->ctx;
> -
>  	*needs_unlock = false;
>  
>  	if (dma_resv_trylock(bo->base.resv)) {
> @@ -877,7 +875,7 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>  		 * since if we do it the other way around, and the trylock fails,
>  		 * we need to drop the lru lock to put the bo.
>  		 */
> -		if (ttm_lru_walk_trylock(walk, bo, &bo_needs_unlock))
> +		if (ttm_lru_walk_trylock(walk->ctx, bo, &bo_needs_unlock))
>  			bo_locked = true;
>  		else if (!walk->ticket || walk->ctx->no_wait_gpu ||
>  			 walk->trylock_only)
> @@ -920,3 +918,137 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>  
>  	return progress;
>  }
> +EXPORT_SYMBOL(ttm_lru_walk_for_evict);
> +
> +static void ttm_bo_lru_cursor_cleanup_bo(struct ttm_bo_lru_cursor *curs)
> +{
> +	struct ttm_buffer_object *bo = curs->bo;
> +
> +	if (bo) {
> +		if (curs->needs_unlock)
> +			dma_resv_unlock(bo->base.resv);
> +		ttm_bo_put(bo);
> +		curs->bo = NULL;
> +	}
> +}
> +
> +/**
> + * ttm_bo_lru_cursor_fini() - Stop using a struct ttm_bo_lru_cursor
> + * and clean up any iteration it was used for.
> + * @curs: The cursor.
> + */
> +void ttm_bo_lru_cursor_fini(struct ttm_bo_lru_cursor *curs)
> +{
> +	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
> +
> +	ttm_bo_lru_cursor_cleanup_bo(curs);
> +	spin_lock(lru_lock);
> +	ttm_resource_cursor_fini(&curs->res_curs);
> +	spin_unlock(lru_lock);
> +}
> +EXPORT_SYMBOL(ttm_bo_lru_cursor_fini);
> +
> +/**
> + * ttm_bo_lru_cursor_init() - Initialize a struct ttm_bo_lru_cursor
> + * @curs: The ttm_bo_lru_cursor to initialize.
> + * @man: The ttm resource_manager whose LRU lists to iterate over.
> + * @ctx: The ttm_operation_ctx to govern the locking.
> + *
> + * Initialize a struct ttm_bo_lru_cursor. Currently only trylocking
> + * or prelocked buffer objects are available as detailed by
> + * @ctx::resv and @ctx::allow_res_evict. Ticketlocking is not
> + * supported.
> + *
> + * Return: Pointer to @curs. The function does not fail.
> + */
> +struct ttm_bo_lru_cursor *
> +ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
> +		       struct ttm_resource_manager *man,
> +		       struct ttm_operation_ctx *ctx)
> +{
> +	memset(curs, 0, sizeof(*curs));
> +	ttm_resource_cursor_init(&curs->res_curs, man);
> +	curs->ctx = ctx;
> +
> +	return curs;
> +}
> +EXPORT_SYMBOL(ttm_bo_lru_cursor_init);
> +
> +static struct ttm_buffer_object *
> +ttm_bo_from_res_reserved(struct ttm_resource *res, struct ttm_bo_lru_cursor *curs)
> +{
> +	struct ttm_buffer_object *bo = res->bo;
> +
> +	if (!ttm_lru_walk_trylock(curs->ctx, bo, &curs->needs_unlock))
> +		return NULL;
> +
> +	if (!ttm_bo_get_unless_zero(bo)) {
> +		if (curs->needs_unlock)
> +			dma_resv_unlock(bo->base.resv);
> +		return NULL;
> +	}
> +
> +	curs->bo = bo;
> +	return bo;
> +}
> +
> +/**
> + * ttm_bo_lru_cursor_next() - Continue iterating a manager's LRU lists
> + * to find and lock buffer object.
> + * @curs: The cursor initialized using ttm_bo_lru_cursor_init() and
> + * ttm_bo_lru_cursor_first().
> + *
> + * Return: A pointer to a locked and reference-counted buffer object,
> + * or NULL if none could be found and looping should be terminated.
> + */
> +struct ttm_buffer_object *ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs)
> +{
> +	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
> +	struct ttm_resource *res = NULL;
> +	struct ttm_buffer_object *bo;
> +
> +	ttm_bo_lru_cursor_cleanup_bo(curs);
> +
> +	spin_lock(lru_lock);
> +	for (;;) {
> +		res = ttm_resource_manager_next(&curs->res_curs);
> +		if (!res)
> +			break;
> +
> +		bo = ttm_bo_from_res_reserved(res, curs);
> +		if (bo)
> +			break;
> +	}
> +
> +	spin_unlock(lru_lock);
> +	return res ? bo : NULL;
> +}
> +EXPORT_SYMBOL(ttm_bo_lru_cursor_next);
> +
> +/**
> + * ttm_bo_lru_cursor_first() - Start iterating a manager's LRU lists
> + * to find and lock buffer object.
> + * @curs: The cursor initialized using ttm_bo_lru_cursor_init().
> + *
> + * Return: A pointer to a locked and reference-counted buffer object,
> + * or NULL if none could be found and looping should be terminated.
> + */
> +struct ttm_buffer_object *ttm_bo_lru_cursor_first(struct ttm_bo_lru_cursor *curs)
> +{
> +	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_resource *res;
> +
> +	spin_lock(lru_lock);
> +	res = ttm_resource_manager_first(&curs->res_curs);
> +	if (!res) {
> +		spin_unlock(lru_lock);
> +		return NULL;
> +	}
> +
> +	bo = ttm_bo_from_res_reserved(res, curs);
> +	spin_unlock(lru_lock);
> +
> +	return bo ? bo : ttm_bo_lru_cursor_next(curs);
> +}
> +EXPORT_SYMBOL(ttm_bo_lru_cursor_first);
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 5804408815be..91ecbb64f6c8 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -465,4 +465,75 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
>  int ttm_bo_populate(struct ttm_buffer_object *bo,
>  		    struct ttm_operation_ctx *ctx);
>  
> +/* Driver LRU walk helpers initially targeted for shrinking. */
> +
> +/**
> + * struct ttm_bo_lru_cursor - Iterator cursor for TTM LRU list looping
> + */
> +struct ttm_bo_lru_cursor {
> +	/** @res_curs: Embedded struct ttm_resource_cursor. */
> +	struct ttm_resource_cursor res_curs;
> +	/**
> +	 * @ctx: The struct ttm_operation_ctx used while looping.
> +	 * governs the locking mode.
> +	 */
> +	struct ttm_operation_ctx *ctx;
> +	/**
> +	 * @bo: Buffer object pointer if a buffer object is refcounted,
> +	 * NULL otherwise.
> +	 */
> +	struct ttm_buffer_object *bo;
> +	/**
> +	 * @needs_unlock: Valid iff @bo != NULL. The bo resv needs
> +	 * unlock before the next iteration or after loop exit.
> +	 */
> +	bool needs_unlock;
> +};
> +
> +void ttm_bo_lru_cursor_fini(struct ttm_bo_lru_cursor *curs);
> +
> +struct ttm_bo_lru_cursor *
> +ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
> +		       struct ttm_resource_manager *man,
> +		       struct ttm_operation_ctx *ctx);
> +
> +struct ttm_buffer_object *ttm_bo_lru_cursor_first(struct ttm_bo_lru_cursor *curs);
> +
> +struct ttm_buffer_object *ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs);
> +
> +/*
> + * Defines needed to use autocleanup (linux/cleanup.h) with struct ttm_bo_lru_cursor.
> + */
> +DEFINE_CLASS(ttm_bo_lru_cursor, struct ttm_bo_lru_cursor *,
> +	     if (_T) {ttm_bo_lru_cursor_fini(_T); },
> +	     ttm_bo_lru_cursor_init(curs, man, ctx),
> +	     struct ttm_bo_lru_cursor *curs, struct ttm_resource_manager *man,
> +	     struct ttm_operation_ctx *ctx);
> +static inline void *
> +class_ttm_bo_lru_cursor_lock_ptr(class_ttm_bo_lru_cursor_t *_T)
> +{ return *_T; }
> +
> +/**
> + * ttm_bo_lru_for_each_reserved_guarded() - Iterate over buffer objects owning
> + * resources on LRU lists.
> + * @_cursor: struct ttm_bo_lru_cursor to use for the iteration.
> + * @_man: The resource manager whose LRU lists to iterate over.
> + * @_ctx: The struct ttm_operation_context to govern the @_bo locking.
> + * @_bo: The struct ttm_buffer_object pointer pointing to the buffer object
> + * for the current iteration.
> + *
> + * Iterate over all resources of @_man and for each resource, attempt to
> + * reference and lock (using the locking mode detailed in @_ctx) the buffer
> + * object it points to. If successful, assign @_bo to the address of the
> + * buffer object and update @_cursor. The iteration is guarded in the
> + * sense that @_cursor will be initialized before looping start and cleaned
> + * up at looping termination, even if terminated prematurely by, for
> + * example a return or break statement. Exiting the loop will also unlock
> + * (if needed) and unreference @_bo.
> + */
> +#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _ctx, _bo)	\
> +	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _ctx)		\
> +	for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);		\
> +	     (_bo) = ttm_bo_lru_cursor_next(_cursor))
> +
>  #endif
> -- 
> 2.46.0
> 
