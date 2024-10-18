Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C1D9A43D0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 18:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A3710E1E6;
	Fri, 18 Oct 2024 16:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XT5yd/58";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F87210E1E6;
 Fri, 18 Oct 2024 16:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729268789; x=1760804789;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=M3ieAi1oMQ2w4J4e5TcSeUxPio+iCJX9Pui7NkRZaqQ=;
 b=XT5yd/586hoRbmwmql0Jrh1skZz81EnZ1wCuv8/3GSigcEg0J1bGAk5K
 jr+Dpky9q6X3YnFMTNsAfnNkuPyLrc2k4Y/StfuJ+nxyKrprWG9Dy0swX
 ZbS9ib3ocMtP4vmBW3Hb4v/4dEx/owXP6wBLNRk0uvDzr44/5DKEOMcY3
 vFbZc7CZtFN02+A6Xqs7G4w+zFnyPw+kIt4cqtjd4iSe4od/OVuI44gyJ
 KvTkpBwwL9m73OY6XaxESw0i6jOAI7xlZu1h+RH6OcXyt3dL0p3gPK0Li
 ro1kYuoQ57mYbPyBxCnKYBqZO0pXd8wRTjOod2p3ZjJznTTCxVjojQyb0 A==;
X-CSE-ConnectionGUID: rOvewwReTKSu7JM3CLWGNQ==
X-CSE-MsgGUID: eG1PH5rlTkCU7wAvAkpKmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28598059"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28598059"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 09:26:29 -0700
X-CSE-ConnectionGUID: awCVssDsQwWET+UbuKKOMw==
X-CSE-MsgGUID: L2E9JG5HQlKYkKniA1U9gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="83978550"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 09:26:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 09:26:28 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 09:26:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 09:26:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 09:26:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dg3mJ71Q0rsy5nbQftg9Ug9kHzjiezVwsOgwp+/vaWBv64EixZ0gpdRv/UHS7+AeXshoNjNzfQYm3+aiG9fLnXxYGh43V2ojpFVdi2WCORcsQ+jwdmZnz+hvwjKNg6KUPFhXRhYetrTQVRggvVc1Vija7X0AMvjS8NzyLQotp18FN1sYcte5YRRUG6Yzh1dP06Qv11zQrSWNL7bZqHUJyXwhvMkqD7oa03/7snz/5tvrCSCFiNrSsHAEyeTCJstFn02jlp/koAHNK14AsddbFUbidzWeCXfk55ANYK/i5hc1UTP5GMytKsKLnEo8dujBWBHU1DmRnTYU+PjvLvxwaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmQ76Yuq6/G6HyxsKk165ru8m//dLjEKCjjpr2ZafCA=;
 b=obNL/kTq9G7G8fENNesEVUnO8D3+d6d2HvzZljLAZrlP39UXI++lI02Gamog7WNTr1ZKVhLvMZdJi1T/MhZcQdlkBpXezuyrIpRdszhUtG77FF2ohO+S+tWg5vStk8FN9vTAkq5IbR8Tk8SCzd/C6+4boxmQwN/WKRCyPo+0rpvJxS7twkuBt95WSi9Hh70OhPPvA3telb3DrOnOVNgs1GjoV7wmGuSrnTkN/DGljQnAIAM3+PLUjA++JK78jAClaqYlObiJyRGsh9Dn3DTNcAfH9N/IO/5VL/HiO+iZenUAKHsgxReA11bYGQyZaLc+7N+EcNwLNfefl7UMvLYWJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8737.namprd11.prod.outlook.com (2603:10b6:8:1a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 16:26:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 16:26:25 +0000
Date: Fri, 18 Oct 2024 16:25:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC PATCH 1/1] drm/ttm, drm/xe: Add ttm_bo_access
Message-ID: <ZxKL/RbKwq8iJ/gm@DUT025-TGLU.fm.intel.com>
References: <20241017233941.1047522-1-matthew.brost@intel.com>
 <20241017233941.1047522-2-matthew.brost@intel.com>
 <ebc06f32-6ed2-41a3-bc84-820bda1e7116@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebc06f32-6ed2-41a3-bc84-820bda1e7116@intel.com>
X-ClientProxiedBy: BYAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: e45005fe-d712-4b4c-ee49-08dcef919bd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bblVLptTgasaPg1/JH4En+1nQbCKYGgikG2ixVGT5d25nLPiSP7n/AMRFs?=
 =?iso-8859-1?Q?WJGkS3v/tLX/sNqhivtdeC96Aq9GtaDsqA+wdRg7zwEO+102EmY+3SCV/T?=
 =?iso-8859-1?Q?HoK8N4vfVBbZwB9Df02E+zezikbba0uzbvRASIsJ/cr1WER0QHDaLGzq/8?=
 =?iso-8859-1?Q?Sg5UnPtKKvhz0EtmSRA7VvzBaQ5nXmr+u91GQMeZOdvLrlzNbtGAL04Pjr?=
 =?iso-8859-1?Q?aQA2jcw1XO/7oKdmQ2qWAEBcFRHnkki+NWufnnZiATCUOwd7jI3AkA2gZv?=
 =?iso-8859-1?Q?Czk/dzmxDe459Q1vNEWjVHQdSNsVKyWlzD0Csd6q3rs76zPtfua3yut7LT?=
 =?iso-8859-1?Q?9sYTnQgjZj2aotbOFIeIJ7JOy5rBQOzcBywK0akGAe2xoTelbBO3ZlyzRC?=
 =?iso-8859-1?Q?+PkbqN6WlicOp+r8+94pnUZm68LfUpACXn8HEi8fmhQGR1SnRKdCINaqq8?=
 =?iso-8859-1?Q?YT1eQ0oHrmlbwuCyov8SYlf/aZCbWbqS5j/txqEmEHLptOJnR9ksBqyKbD?=
 =?iso-8859-1?Q?oiRPGF6QGwr/WAVZteZreWli1UT2HXmX8csUiwWHpK2LZ8Cm+B427YQ5th?=
 =?iso-8859-1?Q?QuH1lRBcScikbcnr8dmTUcoOQLnNpVTpFCc2UpcybJCsASisWQhvY9bPs2?=
 =?iso-8859-1?Q?4mN72Qt1wnb599Iy2WeyZ0M35Go1I2vF8TBIkI+ymmMDzKcbLAiZltx/hz?=
 =?iso-8859-1?Q?sldV5Z94i0qKCXMHR8fitLhgtyOzfLKVf8JLSylwIlZ0iE0a6b+YavREOl?=
 =?iso-8859-1?Q?3UV5FeF4HgxgWE4de8u1GDAxd1ZPhR9t/75dBKl5RVsQ/kydcOb1aFTYYc?=
 =?iso-8859-1?Q?XqllBa/qBNiO1LTy1KgbReyJMj2W2t6iYlDfyRZTpadQCeWvisQvUShBC/?=
 =?iso-8859-1?Q?VoUYXUULIsyD76z0a3GvZr1nP6NsFaDrKS0NipYFFaJbguosGfFMRYXa21?=
 =?iso-8859-1?Q?6lHxobOyZe8rEF1fbAJKK5w86+ylyuXSzyKC2Fhbwn8fmYXdivoXakP77v?=
 =?iso-8859-1?Q?fCkDkO4pax55mMNdVRqQI2X0ZRIC6y4nn/D4h76r4qjI/p/V6DL16Ate6H?=
 =?iso-8859-1?Q?64cw4lmdgDVxuRyGuMeZe5WqIdCa9nNG+yLqdg52ZNHzPXGTC/RC0Vqe9f?=
 =?iso-8859-1?Q?+wncGpvtWLrmXrDYFnT6d4XxznEQtLiO9yMpkAAvW1I2pwXoQz+GI0HPZ+?=
 =?iso-8859-1?Q?Zp9t9rt0DZPHC+G9roHKNDC6HaQDZ1kRFw1vz8FYYj/71K4s4Y+YzimTAK?=
 =?iso-8859-1?Q?TyILKb1lkMei6PRX4dxBXKFxtw18i1IMQfafTt63Hb6x3X6zQbJreVHKyE?=
 =?iso-8859-1?Q?VkDSoVfIKnhxq6buVCJSsUofZqsnhAr36/n6fasJvyxynZFfCXrdOI7FVP?=
 =?iso-8859-1?Q?I7g/CHkGbI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oL2ANjQpmIM3GPRBWPIH9YhsG4fvgo/NJKPdKFnLN4I5D8qBf31uQFYvg9?=
 =?iso-8859-1?Q?/YGOAzRogpGK//O1NbQcnw2X0vmgXLPbKXaHXKnS4aZYnXDfPTC143+Wf6?=
 =?iso-8859-1?Q?Q+OdSFSEGhMxsGcxQbfwaHj1P/2XW2TAw6MzWiBKC+rANLhXHLAqKWK5lT?=
 =?iso-8859-1?Q?kV4sgBsKlBzsm3eAq/IJfVOMlFAW0xEyXKx0kzXVvQ6PllNPHi0PCrTBSc?=
 =?iso-8859-1?Q?tzGhMMjdgAXPGcUfOmZbJ0MH/CuTM76eT2SVoCVcLdGlyMjw/iqthZsGRR?=
 =?iso-8859-1?Q?dghbcth5WujJUtT588m/p/VuGFKr9YmxtI6PnnUBE/IAzqYGz2IOD4UPU0?=
 =?iso-8859-1?Q?YUKq2iTLDlG9E79fN+t9DtuydTnQrN40bHjwRRXS4tOYP0Jpo+5Y85govE?=
 =?iso-8859-1?Q?oaLnqk37q0EvOukfoHbKmcE0Z/XzclW2mIXkdeTcMdcpk9Mk04PjiRPiKr?=
 =?iso-8859-1?Q?EpYVKsfCLbV43t16Oqc+j3sjK+LofeXvVhk3FeD7nN/t9YjwVJPUWPn17/?=
 =?iso-8859-1?Q?GRC/FB8hJwbr49VxJLzbEXwR6CkTI9UC9o4L8+z3meRvKeYTjVA8CWvs70?=
 =?iso-8859-1?Q?rhwJTsxnLF4Veyp4wu1e2BEI3TaQHm49d6Dh/UXhtFVBgDDLkl6g2tUdwo?=
 =?iso-8859-1?Q?XHmm5/hQYVYV0fnX58kYWkjoWgBiCqEkjmIDewHD9EJDgo5BNv1oIWgPQ6?=
 =?iso-8859-1?Q?l+43CoxHYc2lYu0zmImOivL/KCQgFmQCr2X793+LJYPmJt+Rj786/wlkZj?=
 =?iso-8859-1?Q?yJp3FuTIVSjeZ8v/iXMSBs0KVxOluBjID3wlm1L0MCdPXhvG1xUtse0jr5?=
 =?iso-8859-1?Q?pvHioU4sOxFgF0JOx21WKEWXfcusfLD9KoYv89hn1UAHgB6G4A8EGXPm6k?=
 =?iso-8859-1?Q?EXMWoGP5maETH1N79EwaDqci++n84agtmaPfkwJEVflpKvQwKjtqxxJF5P?=
 =?iso-8859-1?Q?AmOLfHwEE0VkqXWtaxPIX5CqZE8o+qgNipmWx9NgwTblCGJvgkW2neVOAh?=
 =?iso-8859-1?Q?KXF5aIlHBr/sYmFF6e2ncBM+94BhkLB0+UxkjpS0bXX2QMsru/fuwNq6ns?=
 =?iso-8859-1?Q?yWqG2bMRzGAi+Y9IDD/e3Jg4KmshYMByUAWoH477XSsWpNTgKABvSU2vv9?=
 =?iso-8859-1?Q?Pltm4WkYXsxNkA/haXpBCkuHs3KHE0ZytujC0we3tg5LRgeIt0NNQc6XKe?=
 =?iso-8859-1?Q?i3JLMhIk6v4DLZyD1WNvLybZvbw60LjU2SjlOe2CTK4UZV7PukiStO6/vt?=
 =?iso-8859-1?Q?vXVMpRiS+SiKNzmI63kSw0rU2UIm+j31YS3z3n2hMAtr/mBo3y1GYDOcvS?=
 =?iso-8859-1?Q?f/gZaFG9CeVPODBMOMO/hNj9BnR24qKuwGvegFX/6vl4DWaHTEX+uNUWqi?=
 =?iso-8859-1?Q?PBjTbQDh6Y2+YpdFRqfqH0axMsSL/DGtWs4+IpDCfY05OKcJPiTs+ABF29?=
 =?iso-8859-1?Q?l4l2oDC0Y5frqJ7YxoFlXDq00raZ2NAzN8aCKY0Gh1glQrfXID2jnSFhFQ?=
 =?iso-8859-1?Q?1yO3Cs1mpKgBznd3l/vPslnDt9jhjCiw91ujrrqnMtwrNJP6FWaD6VOoI3?=
 =?iso-8859-1?Q?v9HjAMLu33jJ8tVs7xHkGOus1xzdjj/w65purlcaY75fRjFvIpNFiLPUP6?=
 =?iso-8859-1?Q?FH/tbIjMZiXlhzs1wnTsqQf4pj+rNGtA6ilpj74wdJi3p/HwnFTn9Rww?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e45005fe-d712-4b4c-ee49-08dcef919bd6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 16:26:25.3012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfvfRdlF9PwgJZFQ+za6o0c3BksA84eMFKHOHnZSwfrqILWsC5s2X8JiuGQtnNAFmKYhCLX0B9R0bpkEAbygEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8737
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

On Fri, Oct 18, 2024 at 10:08:06AM +0100, Matthew Auld wrote:
> On 18/10/2024 00:39, Matthew Brost wrote:
> > Non-contiguous VRAM cannot be mapped in Xe nor can non-visible VRAM
> > easily be accessed. Add ttm_bo_access, which is similar to
> > ttm_bo_vm_access, to access such memory.
> 
> Is the plan to roll this out also to object error capture and clear color
> access? Those places seem to be using ttm vmap/kmap which only seems to work
> with contiguous VRAM, but in those cases we are mapping userspace objects
> which are potentially not contiguous so I assume that stuff is also quite
> broken atm?
> 

I quickly sent this out without checking the error capture code, but
that seems to be broken but no one is complaining? Seems odd. 

Let me look into this a bit more before posting a proper series. Will
also update the error capture if needed.

> > 
> > Visible VRAM access is only supported at the momement but a follow up
> > can add GPU access to non-visible VRAM.
> > 
> > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/ttm/ttm_bo_vm.c | 20 +++++++++-----
> >   drivers/gpu/drm/xe/xe_bo.c      | 48 +++++++++++++++++++++++++++++++++
> >   include/drm/ttm/ttm_bo.h        |  2 ++
> >   3 files changed, 64 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > index 2c699ed1963a..b53cc064da44 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > @@ -405,13 +405,9 @@ static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
> >   	return len;
> >   }
> > -int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > -		     void *buf, int len, int write)
> > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > +		  void *buf, int len, int write)
> >   {
> > -	struct ttm_buffer_object *bo = vma->vm_private_data;
> > -	unsigned long offset = (addr) - vma->vm_start +
> > -		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
> > -		 << PAGE_SHIFT);
> >   	int ret;
> >   	if (len < 1 || (offset + len) > bo->base.size)
> > @@ -439,6 +435,18 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> >   	return ret;
> >   }
> > +EXPORT_SYMBOL(ttm_bo_access);
> > +
> > +int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > +		     void *buf, int len, int write)
> > +{
> > +	struct ttm_buffer_object *bo = vma->vm_private_data;
> > +	unsigned long offset = (addr) - vma->vm_start +
> > +		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
> > +		 << PAGE_SHIFT);
> > +
> > +	return ttm_bo_access(bo, offset, buf, len, write);
> > +}
> >   EXPORT_SYMBOL(ttm_bo_vm_access);
> >   static const struct vm_operations_struct ttm_bo_vm_ops = {
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 5b232f2951b1..267f3b03a6d0 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1111,6 +1111,53 @@ static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
> >   	}
> >   }
> > +static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
> > +				unsigned long offset, void *buf, int len,
> > +				int write)
> > +{
> > +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> > +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> > +	struct iosys_map vmap;
> > +	struct xe_res_cursor cursor;
> > +	struct xe_mem_region *vram;
> > +	void __iomem *virtual;
> > +	int bytes_left = len;
> > +
> > +	xe_bo_assert_held(bo);
> 
> I think we need rpm somewhere? Although bo lock might make this tricky.
> 

Do we? OFC if we interact with hardware we should but also if hardware
is powered off a BO shouldn't be in VRAM.

Maybe do a get_if_awake and bail otherwise?

Matt

> > +
> > +	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
> > +		return -EIO;
> > +
> > +	/* FIXME: Use GPU for non-visible VRAM */
> > +	if (!(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS))
> > +		return -EINVAL;
> > +
> > +	vram = res_to_mem_region(ttm_bo->resource);
> > +	xe_res_first(ttm_bo->resource, offset & ~PAGE_MASK, 0, &cursor);
> > +
> > +	do {
> > +		int wcount = PAGE_SIZE - (offset & PAGE_MASK) > bytes_left ?
> > +			bytes_left : PAGE_SIZE - (offset & PAGE_MASK);
> > +
> > +		virtual = (u8 __force *)vram->mapping + cursor.start;
> > +
> > +		iosys_map_set_vaddr_iomem(&vmap, (void __iomem *)virtual);
> > +		if (write)
> > +			xe_map_memcpy_to(xe, &vmap, offset & PAGE_MASK, buf,
> > +					 wcount);
> > +		else
> > +			xe_map_memcpy_from(xe, buf, &vmap, offset & PAGE_MASK,
> > +					   wcount);
> > +
> > +		offset += wcount;
> > +		buf += wcount;
> > +		bytes_left -= wcount;
> > +		xe_res_next(&cursor, PAGE_SIZE);
> > +	} while (bytes_left);
> > +
> > +	return len;
> > +}
> > +
> >   const struct ttm_device_funcs xe_ttm_funcs = {
> >   	.ttm_tt_create = xe_ttm_tt_create,
> >   	.ttm_tt_populate = xe_ttm_tt_populate,
> > @@ -1120,6 +1167,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
> >   	.move = xe_bo_move,
> >   	.io_mem_reserve = xe_ttm_io_mem_reserve,
> >   	.io_mem_pfn = xe_ttm_io_mem_pfn,
> > +	.access_memory = xe_ttm_access_memory,
> >   	.release_notify = xe_ttm_bo_release_notify,
> >   	.eviction_valuable = ttm_bo_eviction_valuable,
> >   	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
> > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > index 5804408815be..8ea11cd8df39 100644
> > --- a/include/drm/ttm/ttm_bo.h
> > +++ b/include/drm/ttm/ttm_bo.h
> > @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
> >   int ttm_bo_evict_first(struct ttm_device *bdev,
> >   		       struct ttm_resource_manager *man,
> >   		       struct ttm_operation_ctx *ctx);
> > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > +		  void *buf, int len, int write);
> >   vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
> >   			     struct vm_fault *vmf);
> >   vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
