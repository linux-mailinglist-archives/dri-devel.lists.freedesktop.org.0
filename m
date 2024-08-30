Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D961096635B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 15:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B893B10E7F4;
	Fri, 30 Aug 2024 13:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CjKoHBJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C64410E7B7;
 Fri, 30 Aug 2024 13:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725025719; x=1756561719;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4aJtdua7VD+7ifwW3Oc5XrpOg6nnr3urBiygCHxfJf8=;
 b=CjKoHBJJ03/SRHjXe2nh6LQrumK6YOt3cIP7BpK5dW5ys6zWkkCeOENc
 MhpVYRzH2NO7+5goVqJGOm3HKe1KgFfj/MF9cpjIk4TSDj9lIrW30OrHm
 K6WZ/VPLqgjEBhSfwhfjhz07w5fBY5iF5LU43rhop7/0j0QoirHyJXDTR
 voUisZPisz9U8BNHn2TF40rZbkd581JHtFnmyrZZfje5LVTMPHtbH8MkJ
 yx/HIVaUMjqT8SAkoIh6P9HOBl7YD9SxXgQlqz2iDqfF8E1NbIbFKkEGb
 3Z65Bakr2NJE0FeVi8Ie1RxujUMPOu+GtMp6ju/pOBkwV0w3zX3UOVgJn w==;
X-CSE-ConnectionGUID: a4IEy/CBQI6vRS8HZgJUyw==
X-CSE-MsgGUID: 6Aq/87OITS2bkAtx3yvZdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="26562966"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="26562966"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 06:48:39 -0700
X-CSE-ConnectionGUID: FVKGT/M5QGanRFt6NASGQg==
X-CSE-MsgGUID: F1L6hxTdRCKzHe4gOorrrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="87140364"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 06:48:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 06:48:38 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 06:48:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 06:48:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 06:48:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HeHCeDk9FCN/CIBUZcFFpufxnw/gbYVLF4eZBqR9p1JIGm2JP9aJ3yh9lND1g4P7WB1FVOAzL4fGX1/5DrR92Tf+/uch5i1N1UuV01JP490eTtQOSFrf3wm7HSiRmEIhSe75jjZTEfanIK7f6n7LMUeACTNiD/eXl/8uf9ugjdfU/xko/sRobfN5vZ0318oyM5UrHaGSDmM5LAspgVIGqqHyUdZW/RvZRj6rseZXj3exlgHMuf6W47FpmaB8EAhTIjspucrP95f5LuxlP04tHaTIo0gdI2BnCOQEj17eZ79LFtxn99LzgMP3w5rXPOYB4CzLW2mxEYI5XDdQ/yamXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHL71sxytmoirxY4vpsYjRvToVsulJL15UdKgxTPh0Y=;
 b=WL2gDnRssRXD9sK3NcdDLlA0jRPUE9JkmOjFmlJyPkoC05QZxt28fFDtUBuET7LMZNyNvYfo3cICyN/WHjy9kx62EqcDMCjwMR5La0mwzLJVrKe8gZZibEvRwt5hwYPxl4UhGGUNNIfmaoEZ1RPzCchgxh9hSu7TrCLHAk2PSZl0jP/pLmiGmas1irUNp3FxS0wvAyYYYkpD6wH+qW/wzNEtCIjfCz9h8NdOOPq4d09CsxXjdGnJFuNh+OTSNb9ycFEhLyNBpo7IPlT3WxPAjbrSQf+dmDA2FCpc5A2XQk1WujO/xUDxdhWrKA6w1M7eZIV7m8hZmEuHoPp1UrzhWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7520.namprd11.prod.outlook.com (2603:10b6:a03:4c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 13:48:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 30 Aug 2024
 13:48:34 +0000
Date: Fri, 30 Aug 2024 13:47:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <ZtHNV6z8B7g4nbPp@DUT025-TGLU.fm.intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <d66e492df25e8ec3533575245c10eb7dcca709ca.camel@linux.intel.com>
 <ZtCzo11oKXBeKmWp@DUT025-TGLU.fm.intel.com>
 <b657ceec08091a666bdd907f9171727ef395c093.camel@linux.intel.com>
 <ZtDgd7bd6RCs2Orl@DUT025-TGLU.fm.intel.com>
 <666768946f0d7dbf9373ab6369a4b0c7eefd8e2d.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <666768946f0d7dbf9373ab6369a4b0c7eefd8e2d.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 754227c6-26b3-494b-90c5-08dcc8fa70e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/u0WZTTUPhrVCGn5P8ZyUAf/zBMegOwXzVXgi3n6j+XimPiS3g4P+jYRPS?=
 =?iso-8859-1?Q?PEH5SuLK8Lkhe7ykvdwEsJr7GlUQi8QvoBQlVmAhJyk4HJ7urqqmKl4kNA?=
 =?iso-8859-1?Q?e92Jf9uXhpjn163BviAVS2XG8TGG6pAAIOM0MUyM8iDteJBqXq4diYdNaM?=
 =?iso-8859-1?Q?xIe7nusel4zu1di5OtQBLMyulUaVudiFaRXkwxD9XI7ISBkNtZWWrsBgj7?=
 =?iso-8859-1?Q?mrhlZEv80Z4n8XeiHlcjlZIAXCq5K/0toHwfrdKZv9Wz0DLlHs7cb5IV2R?=
 =?iso-8859-1?Q?71dijkgkKfOs38WdB+reQoijnF5IpKfSZO2Z/+SBUfvPmMOiEv9P8ezEFu?=
 =?iso-8859-1?Q?6LZidyK50iWJjyKwGz/rpWs/qPCMUUOydiW2bA5/0S/LrUHbd/c5ngkxoC?=
 =?iso-8859-1?Q?zAql+9nG6Rbm11ssKw3q8kgTggI03xM6KT2ZvyI0IvyApraUw0AGh4CGOE?=
 =?iso-8859-1?Q?uvuR85x7ogKIxPsiVy7BF/XyHkvo6ZKnMfap2ONQ61O8wdPUaWwPV7AI+p?=
 =?iso-8859-1?Q?vq66r9uA+FN2vWKVuaMzOSugiKev7uC2JHjpnVSYUYSyV1pg+Lr4Ss+vWA?=
 =?iso-8859-1?Q?QI0cmo5uhQ7WZAqiYAMx6tVfkpoNWEuVo49TuEv5FTn80o2wtH6HibAO2Y?=
 =?iso-8859-1?Q?5MmEL11+pZ4EQ/mbF4DyZ2OIj6+uD7qcUXZKojf6Ar38HjdZycQzNrpbFG?=
 =?iso-8859-1?Q?d+eCyBArEPnd5303vdIF9h1ISSZeEXNWA493627rH7h3yGEBZA1UH80XiR?=
 =?iso-8859-1?Q?FRtteTdIRQKdGqBDydcuUQaMDYutvsjd8ZMcwuTc87pDCzXLHfJz5K5hvp?=
 =?iso-8859-1?Q?teOrx+zxL5jq2lOs4oWqJGSP3hIudcVD4lOZBSprQUzZ6bqo/YpjeZQI1B?=
 =?iso-8859-1?Q?VWS+g5M8HpkbdV1BUfSGRXXRkozMSkU6gmPnuRYOF9nGu37B70znW7ZAUR?=
 =?iso-8859-1?Q?dwNdgB83mYArhhhnOKNGpm4lytrMe7p5SljHdub0xn44hz2Xm+9+uC50D8?=
 =?iso-8859-1?Q?WcP2NfBIJMLMSKhEVw1VVQVoUH5WEbDm6me+dv+hSTfURFpbLVl7lapzs3?=
 =?iso-8859-1?Q?gv9Qtn0KUSngajHHsftn4b6YLHP/NBidClmgiz6JExFhsINPwbc0zCgEnw?=
 =?iso-8859-1?Q?PSWOX3Gp8RLda/d6DLp4Zlbv6A8vB4CzenjZmL0FcRwp71UlLjjZ4owwjz?=
 =?iso-8859-1?Q?XFm+BHPrT/flWPO8JZMSJfmOaUpn3SHiKU/MqcOmSxP5r9rnQr+CzNmtxt?=
 =?iso-8859-1?Q?hamepLelIKrmE0DLUYQGNt0iFB8wkrW4aPewASzP2apQ+uHmzNQWETzTL7?=
 =?iso-8859-1?Q?rOH+5zPi0oVm+N1KwrKgRNB/F0wNpUr/I/OaNRRKj/EqdcwiLAGKdANJk9?=
 =?iso-8859-1?Q?8qp6n+YS0PCqmUOG87A7ykG1kOz5CEmw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0o4EE/Og/wbvmBnT6D4bc116BqjHP4MguLEJ3EyRUZP/PNDZ5oE9ocrPlv?=
 =?iso-8859-1?Q?AI9c83xE1/U+BxkZdkDNpqi8zkw7G/RuAZUkAWdOSJmGrA/jWKjKzf9HOM?=
 =?iso-8859-1?Q?3z1WnfRTJyPevaWJEHu93t8B2V+ykqo6XwP9uoDzOn5Q8NdJfTNDYNlSlX?=
 =?iso-8859-1?Q?NOximqJ+CWjdplOiEzcrvmscu39zDU7LzDRSIltbyfbszlAnARfDDfY/x4?=
 =?iso-8859-1?Q?d6Zza7g/XksgnzuAW/QSmcbx8/3lqVGHUsgtO6EwM/Pk452hWaqBS8tCu/?=
 =?iso-8859-1?Q?WyFcoqfBBXGhNtZ5jxwp6ruSM8LYudusqGh0rO/DieQ8VyZKYB+bo09T3G?=
 =?iso-8859-1?Q?gzizIo9VjoG+vP/cO52LLPXNMXdS7MIM1+ambEfRKXfL4J+Pj9NWlBBVUc?=
 =?iso-8859-1?Q?vYOoo36luHwnolBtOqleP8RVg1f1MxC9erKWYolsh5cYY5N/S+juV3miA/?=
 =?iso-8859-1?Q?S0qpPdfqobY8sMMeYr7JUQcPvC+jV/Sul3x+mTiYpOhTKLFIpiVvJY2+iW?=
 =?iso-8859-1?Q?6Z2gbu5SFXevgKtDqpIaZtfrmEN+yw9QMmLywx0Cic3BjGHc+a64mDcDGR?=
 =?iso-8859-1?Q?m1MTau31RqOW/3PahT9qORevYaDlavqNDpfI4LPtwYyZtKtukMvgMJ8OdA?=
 =?iso-8859-1?Q?3znxKWJynjsxzYVS+6O22orJAXi9cBnVQkkqLWJazA6jztR883530iPRTJ?=
 =?iso-8859-1?Q?bhaQ8/WdQormOkdwP1BJVa+JzsqUZafn40yHfsmWCAiUZRXi4FrEBAHFZ8?=
 =?iso-8859-1?Q?Kdy1r2smWsvUUKSDA4YHw6zef5CA6IXMWmYmA9q2d44hnQghFNTvecaWwO?=
 =?iso-8859-1?Q?/TYxDmYjr7dWpIAFeCjiGQesjllntCy9tzlNSNZej5NmKLx9d6YYh3k6Hv?=
 =?iso-8859-1?Q?jO/DS9nLnMHYMiVDbPbsAZdC0vdIrLa9UaZ/x/nHKqAM0UPWH2bRCo4UBd?=
 =?iso-8859-1?Q?Hcv1dM3m2tHrJnEZ+5OGw1VSqjD35j+K54GjrbJ6B0+A1BudmiB77QmhBn?=
 =?iso-8859-1?Q?8l7tyO4JHM3Ai+KlmFJxiVQ5awF8RSMKQTy31WUVMfF5926EeZ7T782Sfx?=
 =?iso-8859-1?Q?sJh8F4+Ru0srLYHm75cEnVqi8wqenWFqArqOWSJdfBBmJXV+356LU1apt9?=
 =?iso-8859-1?Q?GZupSkZQ8gT9kvWxCVerzGiBA6lHaanRnINgacGKimftqmuUB8hGSqcuJ0?=
 =?iso-8859-1?Q?AHqWBaN9E35HJB5gAEmoDmcK4MQ6JaWACPVs4j8ZuIdCUlu2SLqAUcJAOD?=
 =?iso-8859-1?Q?B+7O0vK3+AzDWDQk5h9ur7/cZOzyrt2eheiSo/NBaIP26hTVLiI4YwhNFl?=
 =?iso-8859-1?Q?VDDLL5ljjKEj4gNWEy9GSWag3pjTvgY/lIvl6shvyhKQ4qmF5ihNWigW3D?=
 =?iso-8859-1?Q?YrOT9tus9xIys07B/sv0BhHKpeWuhCvwjpsQhhvnmiahCZ2O5+R4UnzMNb?=
 =?iso-8859-1?Q?vOVJLNvdTKyLlxteVoCenC6CExDbY3V1eRwYUzXP22Zr3BjOqcLhswq34k?=
 =?iso-8859-1?Q?3/hpxdPEoTniww02i8APRWF//cEKB1Lhul0hMZJF64DNRxPvlDdGp3bDrV?=
 =?iso-8859-1?Q?8yJ40mAROXqtEeOEHE9FUKpFYgmuT9yW2pOIQRfYmh+yTnA5E/0TFO+djP?=
 =?iso-8859-1?Q?zM/cSRNsy6wXuYwE14Ouv1Az1yUOX7bnpMcTObZbPNyD5zK8mew+iufw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 754227c6-26b3-494b-90c5-08dcc8fa70e7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 13:48:34.2538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GUrMKZ2ZZuUtY8eEEojHaqRJv7IQvY2G0Z/Q3rEABS60QNJnhkuthDzTJXbyXROsNLXzM2lfPJOPXjGFM3vdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7520
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

On Fri, Aug 30, 2024 at 11:57:33AM +0200, Thomas Hellström wrote:
> Hi, Matthew,
> 
> Agreed the below might not be important just now, but some ideas:
> 
> On Thu, 2024-08-29 at 20:56 +0000, Matthew Brost wrote:
> > Issues with removing a SVM range:
> > 
> > - Xe bind code stores invalidation / present state in VMA, this would
> >   need to be moved to the radix tree. I have Jira open for that work
> >   which I believe other developers are going to own.
> 
> Yeah, although we shouldn't *design* around xe bind-code and page-table
> code shortcomings.
> 

I'm thinking this one certainly should be fixed sooner rather than
later which would be helpful.

But let's also consider the case where we get a bunch of individual page
invalidates serially for an entire range (I can't remember when this
happens but I have seen it in my testing, will look into this more to
figure exactly when). If we invalidate 1 page at a time in radix tree,
each invalidation could potentially results in TLB invalidation
interaction with the hardware in cases where a larger GPU pages are not
being used. The TLB invalidation is going to vastly slower than any CPU
operation (e.g. RB search, radix tree walk). If we key on a range
invalidate the entire once on the first invalidation this may end up
being significantly faster.

Above is pure speculation though, a lot of what both of us is saying
is... So another reason I'd like to get apps running to do profiling. It
would be nice to make design decisions based on data not speculation.

> 
> > - Where would the dma mapping / device pages be stored?
> > 	- In the radix tree? What if ATS is enabled? We don't have a
> > 	  driver owned radix tree. How do we reasonably connect a
> > driver
> > 	  owned radix to a common GPUSVM layer?
> 
> With ATS you mean IOMMU SVA, right? I think we could assume that any
> user of this code also has a gpu page-table since otherwise they
> couldn't be using VRAM and a simpler solution would be in place. 
>

Fair point.

> But to that specific question, drm_gpusvm state would live in a
> drm_gpusvm radix tree and driver-specific stuff in the driver tree. A
> helper based approach would then call drm_gpusvm_unmap_dma(range),
> whereas a middle layer would just traverse the tree and unmap.
> 

Let me consider this. Open to all options.

> > 	- In the notifier? What is the notifier is sparsely
> > populated?
> > 	  We would be wasting huge amounts of memory. What is the
> > 	  notifier is configured to span the entire virtual address
> > 	  space?
> 
> Let's assume you use a fake page-table like in xe_pt_walk.c as your
> "radix tree", adapted to relevant page-sizes, sparsity is not a
> problem.
>

Ok, makes sense I think.

> > - How does the garbage collector work? We can't allocate memory in
> > the
> >   notifier so we don't anything to add to the garbage collector. We
> >   can't directly modify page tables given you need lock in the path
> > of
> >   reclaim.
> 
> The garbage collector would operate on the whole invalidated range. In
> the case of xe, upon zapping under reclaim you mark individual page-
> table bos that are to be removed as "invalid", the garbage collector
> walks the range removing the "invalid" entries. Subsequent (re-binding)
> avoids the "invalid" entries, (perhaps even helps removing them) and
> can thus race with the garbage collector. Hence, any ranges implied by
> the page-table code are elimitated.
> 

This is pretty much with what I came up with too if we didn't have a SVM
range.

> > - How do we deal with fault storms (e.g. tons of faults hitting the
> > same
> >   SVM range in a row)? Without a SVM range no every to know if
> > mapping
> >   is valid and GPU page handler can be short circuited.
> 
> Perhaps look at page-table tree and check whether the gpu_pte causing
> the fault is valid.
> 

Came up with the same thing.

> > - Do we have notifier seqno for every PTE?
> 
> I'd say no. With this approach it makes sense to have a wide notifier.
> The seqno now only affects binding of new gpu_ptes, so the problem with
> a wide notifier becomes that if invalidation occurs to *any* part of
> the notifier while we're in the read section during binding, we need to

I have avoided this by the drm_gpusvm_range_pages_valid. This isn't just
an optimization is actually required for the 2 tile case to be able to
safely know when dma pages can be unmapped (i.e. you can't dma unmap
pages if either tile has a valid mapping).

Matt

> rerun the binding. Adding more notifiers to mitigate that would be to
> optimize faulting performance over core invalidation performance which
> Jason asked us to avoid.
> 
> /Thomas
> 
> 
> 
