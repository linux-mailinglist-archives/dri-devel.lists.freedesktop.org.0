Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A674294D55D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 19:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4E110E9AE;
	Fri,  9 Aug 2024 17:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kg6CAGHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAAB10E9AE;
 Fri,  9 Aug 2024 17:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723224275; x=1754760275;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IEglh16636q69IjzjKSd9rhbWQ4dgJiZmo2Jz7/6pAU=;
 b=kg6CAGHxelVJXf8nRfma9dGBjZs9S8VJIcPgU+NN+GMLWt0GUF74WioE
 9tQ7aS8nGBr77cL4CPVweXJZsOoBOLyYhfE6E6j11VyGGdet9DWgVLVYg
 ekLbbjCrtN1LugXsHIm9kPFABMvizn4+IBCAZTdbHBJJEi5HSjW71FdNc
 ntYTlUbX7k66TQhIETf2uJuIdXW2EqVvoS1co35uFk5Gb9yixY3hyUw5t
 SFt4T2jvDfXgpLjYQF9ZGy4B0pCyKu6ThnU287Un5dnwR8yzpJ0DvRnDX
 /hcNRLsnylNHZUK4igiKcCk/oahtkLgtdxeiH65DkFZO13R9+xsr/xbF6 Q==;
X-CSE-ConnectionGUID: 1AZ8nVwiQgaryZbmCwAbmQ==
X-CSE-MsgGUID: Ptfd+GPgRTO0kgXgtcPR7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21382156"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21382156"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 10:24:34 -0700
X-CSE-ConnectionGUID: Psl/H1ftQvGSKJFzQx4vfw==
X-CSE-MsgGUID: qLLMVpvsT7qzomXojMel+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57284079"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 10:24:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 10:24:32 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 10:24:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 10:24:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 10:24:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jaEX+wSwrjFJ6KCLWTTVR0Yw5ityIqeunjXkftUx5uj5MQbQ0g0h8aNZOc/owYoF1Zhhka3EJz4Sfw7MTLUI/ThhU7kl8BIM1cTAjsO36ve22AXdzN4waNvlF/H+MPyYlqyzOCVgU5ahlE7ML7S9UBdKliICG4SdgASXQp8CqGW4bxjtDqu5gqSFDu09BrPdctT0JwsNKsAZErN2IZvQcFybXRLnkSmO10i8TmFZfT/qjJbCiqvEqc/YCtAy0wuqMUbSvM/8zO8Djq9kJ9hN3yDOaZ6/1bqhdrtMXyKge3QJUpRwgNu5rH5SFxxmse0Krdqw2M0o4Ve2mL8mousJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjdTRro9YAZ58Yr4rpNzjT1fdClaH30Ry01QXxI/XgM=;
 b=d1sSYRLnY/mOe/c10xzFPOXcKCWmQXzv1dzBbZRRLAOrQgeuvg/6kEVK9s1TcryP0kKptJDICnoGBnHUylhM3jdJxNFumcxWr3064UfsxPG3m+3sQKl6hLnBRPli5LRjPNk5UdP9GOxaG+cq39JQnXem7YLkhrEosYUW/UmDI0hJ1Vjhn/xMwW6gFba8HKrsW8AE5stqQ7cX5TnSg0Z+EkhIs68OsGnIKTQsRL6rauupEsJTRXvyI2TZfV68+g7aLKUQrFroKeSf5FtJgtZNvzlVPaxcfqrM/0Fo2r/w3fFOl3gjnmSBGxVzAQ7PyPF4c7THomgXvCrHWvsIH9Zybw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB8293.namprd11.prod.outlook.com (2603:10b6:a03:44f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Fri, 9 Aug
 2024 17:24:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Fri, 9 Aug 2024
 17:24:23 +0000
Date: Fri, 9 Aug 2024 17:22:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 11/12] drm/ttm, drm/xe: Add a shrinker for xe bos
Message-ID: <ZrZQcpR26Pqj/dzp@DUT025-TGLU.fm.intel.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-12-thomas.hellstrom@linux.intel.com>
 <ZrQhVsgq1cF76v2b@DUT025-TGLU.fm.intel.com>
 <2c5974c448195455c6a46102554bb87c045a19cc.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c5974c448195455c6a46102554bb87c045a19cc.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR04CA0036.namprd04.prod.outlook.com
 (2603:10b6:a03:40::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: e5fc0612-55e8-41b1-767f-08dcb8981c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?95M6O76qti4Yh+yXF9kWE+v4IYJ5GT2WLXlzo59EPemKAVXViyWATYmOGJ?=
 =?iso-8859-1?Q?PyreWxYIIr5kXzXvQCeSZURRuw7Sm65jZF8EtV2QLJ+qZnF1GF7jIQFACv?=
 =?iso-8859-1?Q?L+qA9wkkSP4VmIqbeq/tYZAL4vYNuX/u1Q07d6CgIZXErDLOreHycCvXfy?=
 =?iso-8859-1?Q?Oxp7FUvScMbBxKeDCuin8L6nra3Sav3BhsyFFl/tsjGlcd3rXP4fomLL/n?=
 =?iso-8859-1?Q?v1LmnMgz+chN6weEORXbQkmD0Xhht2SF25cM11lhCxmTCQLEZ9J/gY1vGo?=
 =?iso-8859-1?Q?RTZn+BdfaOgYKZBU30vTLLIiA+atgZJ/BLWUYh+SXMcpewixoG8O8TdsJn?=
 =?iso-8859-1?Q?ezXLOvCs7/WIFETMrxzKTyrRWr6wlbIA6J24aCFqEEZmw3Al3rpZ4d079N?=
 =?iso-8859-1?Q?w3FL+jGAMXMsOcD1WaRhbAwvMaS2S/D8CDYJvo94VEJpDzaOYMaMQUiR5A?=
 =?iso-8859-1?Q?2Qc8/LwCjZelPNYhWHEFmFHs4VtzKrOIFqGd0wt8i4wuvPdGR/xtu8bHFI?=
 =?iso-8859-1?Q?cVdkQRkSLpx/4yYYm9Nr9ws2kKDScpICT+6Slw9dqHkGMtzAGtW435YpB+?=
 =?iso-8859-1?Q?5lqOS07x4t3SCYLE8ib4ReamQ4RcqF6Hdms43TJiuQYRRF6wt8sEJ62+jo?=
 =?iso-8859-1?Q?04DPpYlEHph9ZgO1v+hf3vtD5UYO4kuFsGhEnm2PZyJOaJessuxg8VnSUE?=
 =?iso-8859-1?Q?Ex8q9PYhRXH01D7eDyNfL0cZAnS8qnZghFPim1rwZ6OTdTDfnIVu9i3Inn?=
 =?iso-8859-1?Q?9AeqAWeM3Yx1wzmLHnRNAnYHRCCZKNLZ52Y3i69UT7h+mvf5DdseMO5s97?=
 =?iso-8859-1?Q?o3YNry7vVORBfmZS92tMTOaOYLlpXV6wIEw3PVbaW61JquWA/r9THfNjIz?=
 =?iso-8859-1?Q?wi3U4qm6P/LSLzcpHzqvOStc/WyK8U++jHMIGZMYNWqyFjh1H8U8VDZDdk?=
 =?iso-8859-1?Q?6dbQNmvjPNN5TfBozhBCe1eMrbrxJ4skQw5qDH5WGf/02FdYtCTKeN1935?=
 =?iso-8859-1?Q?VoD+KR0AsolsJ6KPtlFxJDLmpVJYy4fqglmH8TaLBhxeffw3zanCSKBRoO?=
 =?iso-8859-1?Q?mdNalrO7SMmczvIDttYTY/nMQiQqd7T2NeDxN+UypK2JHQQ0K4DeVyuHTW?=
 =?iso-8859-1?Q?8Vhjf9rwUo4BCZ7UCJrGJJ2JIMOwOYlj2tNh1yUWFZRiTWvVem5M2xfDqR?=
 =?iso-8859-1?Q?YsS4y6k7gI6FunhG9DA16jCCRv3gJl5euQrtIPVR/ACalxQeNYru2hOQhj?=
 =?iso-8859-1?Q?oQU6u7OkPRIt9vvLsX3kKZl1TBl5Pobe4MIa0Xb91xxllG7bNXVEFKng0/?=
 =?iso-8859-1?Q?IN1v1p/o7Pkk4QaA/Q07mhfSTIVC0RX6ji+xBI3TkvnnLqq9gnw2BppS8A?=
 =?iso-8859-1?Q?442INgBuCHaz65V2oE3DXwG14vSB3s3Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NwMMf7pv2PZhUamz4FhSfqn2UP+f91RKXqXFjBSYmd432rJUUhm/Dj1P/2?=
 =?iso-8859-1?Q?yHOVblyvuEe7vVhm20LIHJqynbKZBs6v7fBUocp8hnSJXCn02RL6z2M4YX?=
 =?iso-8859-1?Q?5vpCqgxTc7NEi3kl0GhIt2ag1fXWL5juNyxwwtmd/OjTI/X+TSX+zUEoIg?=
 =?iso-8859-1?Q?JnD3Y96503shGZWyu5/PTGEW3kyuB4LyiPLIC6XcmN/R+eqGTzmI0xJzcA?=
 =?iso-8859-1?Q?3D8SuMB0dR/GVZz7OM1QyjlPDn+k5QDjNzHDPw8V9kUVlbn9uAfko8eAJv?=
 =?iso-8859-1?Q?LAj+2T73p29LXd7UoFIiHQLfBGkpxetzpKtR02pBoiNqe6oNkr4ZKsfC/f?=
 =?iso-8859-1?Q?lUEAutu+fDh8nT3+GUWBEiaC6OFwJikhkiy9mglcog84VLzZZefRBpxe2R?=
 =?iso-8859-1?Q?L0LrYvYvGjTpB0MtyC/U/JdKHG/iim5dzSZ13F62GoZCgKL2VE44PJQJbJ?=
 =?iso-8859-1?Q?KUBlCVH0RU6v3GUKmAdUtgPGn0CPoAxm3hVa51lzjGd4zy7Onq5U69Cxlk?=
 =?iso-8859-1?Q?igHr/1BdMm2pM7T++ZmR0J5cE+VvT8aXwVrvOffOkTsZ9GEX/H6IM4UNy4?=
 =?iso-8859-1?Q?Q131EI+PT9P5VsPziQoSjpNxybPthPVugvi9PP+7ImyVOQ/wIjbMsKZY2n?=
 =?iso-8859-1?Q?FOTBYEAKEKR1K6NN9PUfSybyG6BtHZnP6Jdzvid6FQuB7Wzy+CuSFrDa4O?=
 =?iso-8859-1?Q?jlgjs6e8CqAvlPdr0151KofklFdKgl4gjsBYt936wISym6bOytTn1NF0Ry?=
 =?iso-8859-1?Q?JbLr7/He7nBXWhlnli3lVa8rDbyYPWXG1Sd3QuomDZXIUWMfjYtiNX0x8a?=
 =?iso-8859-1?Q?Ez25Zm17vWQRrbOO+Uf4v2V9gFP1L7FVGkaEJ/fMAaweIeCgFkpJrmAe3F?=
 =?iso-8859-1?Q?18u2frL2jDx/8QVGLdevbB9u0lOaI3jTQ/fh3PiFvjNL/fwAz3JN6YOPeb?=
 =?iso-8859-1?Q?xGFO5UJramtHHjVgCQ8RCfuEzm2eLneBYgYip1kgz2TBIRiZY9JeZakNNI?=
 =?iso-8859-1?Q?BBD78EMeGsbs2dVjrahADR3mR1EevvE7CtgzusC0of9NEUAyWacuu9w4Hc?=
 =?iso-8859-1?Q?vnzi5Cocn7qeJdaT7tzoxOKUPEnFTC4KOioPQcRwCFEAsEeA6fslSYZ5Rb?=
 =?iso-8859-1?Q?NR36X8dwo4cnFQyvMtroej5oYUYDRfips8Hnv/cfgVVlPCTsyUTHI9l+kz?=
 =?iso-8859-1?Q?OCX7s4gPTdupR5ppV6jnuVkv0idbwJfsuaA/pN7UdMsoIsr52JJm52wCUn?=
 =?iso-8859-1?Q?Gs4EGuEgNp9LdbcGKrQq2mUTJQjkBaHq7650HJ1sL3VBr9n+qUxd3smqHY?=
 =?iso-8859-1?Q?AfQ0J3JlVT6M/SD6cCjDhBrsAottu8RbsRSPaSKdkPSxA9fZD7/Zi3Luns?=
 =?iso-8859-1?Q?3Utav/m/1qwl+1Xm1B3ovi3JiSdnUIfgluBkzdHUSS44m269SUT16csTRd?=
 =?iso-8859-1?Q?1ukbMlxH2CihH4inoH5nsPcZFm4dHrGXb/VyjVmMsTsjaeirAPo7y4U4uz?=
 =?iso-8859-1?Q?/MRlx76k4zakQog9FcEWuXFUFZEjEN12H4m62SIaoh0e4ONHWCqoEdvMT8?=
 =?iso-8859-1?Q?rMT6x4qfdGxGETCeC4i7PpriLqQ3c00gzeS1RL67pQ4M2ibDGiQT9En/Bq?=
 =?iso-8859-1?Q?SUf4fPeijl/xqZE5IJBoZDUWLvixU6lbRk7FM8O36wpSffSggtbA7mGQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5fc0612-55e8-41b1-767f-08dcb8981c8f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 17:24:23.5110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLCbBtztaK4oT3WfCA8KOADueqL+oXL9oOplg0Zjt2LoI7hXmyN7fyHmv6YD8+JqRpJ0S1zYshExvbscI+lZfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8293
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

On Fri, Aug 09, 2024 at 04:31:27PM +0200, Thomas Hellström wrote:
> On Thu, 2024-08-08 at 01:37 +0000, Matthew Brost wrote:
> > On Wed, Jul 03, 2024 at 05:38:12PM +0200, Thomas Hellström wrote:
> > > Rather than relying on the TTM watermark accounting add a shrinker
> > > for xe_bos in TT or system memory.
> > > 
> > > Leverage the newly added TTM per-page shrinking and shmem backup
> > > support.
> > > 
> > > Although xe doesn't fully support WONTNEED (purgeable) bos yet,
> > > introduce and add shrinker support for purgeable ttm_tts.
> > > 
> > > v2:
> > > - Cleanups bugfixes and a KUNIT shrinker test.
> > > - Add writeback support, and activate if kswapd.
> > > v3:
> > > - Move the try_shrink() helper to core TTM.
> > > - Minor cleanups.
> > > v4:
> > > - Add runtime pm for the shrinker. Shrinking may require an active
> > >   device for CCS metadata copying.
> > > v5:
> > > - Separately purge ghost- and zombie objects in the shrinker.
> > > - Fix a format specifier - type inconsistency. (Kernel test robot).
> > > 
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: <dri-devel@lists.freedesktop.org>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/ttm/ttm_bo_util.c     |  67 ++++++
> > >  drivers/gpu/drm/xe/Makefile           |   1 +
> > >  drivers/gpu/drm/xe/tests/xe_bo.c      | 118 +++++++++++
> > >  drivers/gpu/drm/xe/tests/xe_bo_test.c |   1 +
> > >  drivers/gpu/drm/xe/tests/xe_bo_test.h |   1 +
> > >  drivers/gpu/drm/xe/xe_bo.c            | 155 ++++++++++++--
> > >  drivers/gpu/drm/xe/xe_bo.h            |  26 +++
> > >  drivers/gpu/drm/xe/xe_device.c        |   8 +
> > >  drivers/gpu/drm/xe/xe_device_types.h  |   2 +
> > >  drivers/gpu/drm/xe/xe_shrinker.c      | 287
> > > ++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_shrinker.h      |  18 ++
> > >  include/drm/ttm/ttm_bo.h              |   3 +
> > >  12 files changed, 671 insertions(+), 16 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
> > >  create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
> > > 
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > index c4f678f30fc2..563e96a4cf06 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > @@ -924,3 +924,70 @@ long ttm_lru_walk_for_evict(struct
> > > ttm_lru_walk *walk, struct ttm_device *bdev,
> > >  
> > >  	return progress;
> > >  }
> > > +EXPORT_SYMBOL(ttm_lru_walk_for_evict);
> > > +
> > > +/**
> > > + * ttm_bo_try_shrink - LRU walk helper to shrink a ttm buffer
> > > object.
> > > + * @walk: The struct xe_ttm_lru_walk that describes the walk.
> > > + * @bo: The buffer object.
> > > + * @purge: Whether to attempt to purge the bo content since it's
> > > no
> > > + * longer needed.
> > > + * @writeback: If !@purge, attempt to write out to persistent
> > > storage.
> > > + *
> > > + * The function uses the ttm_tt_back_up functionality to back up
> > > or
> > > + * purge a struct ttm_tt. If the bo is not in system, it's first
> > > + * moved there.
> > > + *
> > > + * Return: The number of pages shrunken or purged, or
> > > + * negative error code on failure.
> > > + */
> > > +long ttm_bo_try_shrink(struct ttm_lru_walk *walk, struct
> > > ttm_buffer_object *bo,
> > > +		       bool purge, bool writeback)
> > > +{
> > > +	static const struct ttm_place sys_placement_flags = {
> > > +		.fpfn = 0,
> > > +		.lpfn = 0,
> > > +		.mem_type = TTM_PL_SYSTEM,
> > > +		.flags = 0,
> > > +	};
> > > +	static struct ttm_placement sys_placement = {
> > > +		.num_placement = 1,
> > > +		.placement = &sys_placement_flags,
> > > +	};
> > > +	struct ttm_operation_ctx *ctx = walk->ctx;
> > > +	struct ttm_tt *tt = bo->ttm;
> > > +	long lret;
> > > +
> > > +	dma_resv_assert_held(bo->base.resv);
> > > +
> > > +	if (!tt || !ttm_tt_is_populated(tt))
> > > +		return 0;
> > > +
> > > +	if (bo->resource->mem_type != TTM_PL_SYSTEM) {
> > > +		int ret = ttm_bo_validate(bo, &sys_placement,
> > > ctx);
> > > +
> > > +		if (ret) {
> > > +			if (ret == -EINTR || ret == -EDEADLK ||
> > > +			    ret == -ERESTARTSYS)
> > > +				return ret;
> > 
> > Can you explain the various error code returns / supression in this
> > function?
> 
> Want me to add a comment in the code or inline here? Anyway, the error
> codes are codes for which the caller wants to restart. (Signal delivery
> or deadlock). For other errors just move on to the next bo on the LRU
> list.
> 

Yes, that would help make this clear and help ensure correctness.

> > 
> > > +			return 0;
> > > +		}
> > > +	}
> > > +
> > > +	lret = ttm_bo_wait_ctx(bo, ctx);
> > > +	if (lret < 0) {
> > > +		if (lret == -ERESTARTSYS)
> > > +			return lret;
> > > +		return 0;
> > > +	}
> > > +
> > > +	if (bo->deleted)
> > > +		lret = ttm_tt_backup(bo->bdev, tt, true,
> > > writeback);
> > > +	else
> > > +		lret = ttm_tt_backup(bo->bdev, tt, purge,
> > > writeback);
> > 
> > Hmm, missed this in my previous review. It is frowned upon having
> > multiple bools as arguments. Could this be reworked with flags? Same
> > goes for all functions in the series with multiple bool arguments.
> 
> I agree. Ill see if I can make this look betteer.
>

+1
 
> > 
> > > +	if (lret < 0 && lret != -EINTR)
> > > +		return 0;
> > > +
> > > +	return lret;
> > > +}
> > > +EXPORT_SYMBOL(ttm_bo_try_shrink);
> > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > b/drivers/gpu/drm/xe/Makefile
> > > index b1e03bfe4a68..1eba51bdd172 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -112,6 +112,7 @@ xe-y += xe_bb.o \
> > >  	xe_ring_ops.o \
> > >  	xe_sa.o \
> > >  	xe_sched_job.o \
> > > +	xe_shrinker.o \
> > >  	xe_step.o \
> > >  	xe_sync.o \
> > >  	xe_tile.o \
> > > diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c
> > > b/drivers/gpu/drm/xe/tests/xe_bo.c
> > > index 9f3c02826464..49617f16dc76 100644
> > > --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> > > @@ -6,6 +6,8 @@
> > >  #include <kunit/test.h>
> > >  #include <kunit/visibility.h>
> > >  
> > > +#include <uapi/linux/sysinfo.h>
> > > +
> > >  #include "tests/xe_bo_test.h"
> > >  #include "tests/xe_pci_test.h"
> > >  #include "tests/xe_test.h"
> > > @@ -350,3 +352,119 @@ void xe_bo_evict_kunit(struct kunit *test)
> > >  	xe_call_for_each_device(evict_test_run_device);
> > >  }
> > >  EXPORT_SYMBOL_IF_KUNIT(xe_bo_evict_kunit);
> > > +
> > > +struct xe_bo_link {
> > > +	struct list_head link;
> > > +	struct xe_bo *bo;
> > > +};
> > > +
> > > +#define XE_BO_SHRINK_SIZE ((unsigned long)SZ_64M)
> > > +
> > > +/*
> > > + * Try to create system bos corresponding to twice the amount
> > > + * of available system memory to test shrinker functionality.
> > > + * If no swap space is available to accommodate the
> > > + * memory overcommit, mark bos purgeable.
> > > + */
> > > +static int shrink_test_run_device(struct xe_device *xe)
> > > +{
> > > +	struct kunit *test = xe_cur_kunit();
> > > +	LIST_HEAD(bos);
> > > +	struct xe_bo_link *link, *next;
> > > +	struct sysinfo si;
> > > +	size_t total, alloced;
> > > +	unsigned int interrupted = 0, successful = 0;
> > > +
> > > +	si_meminfo(&si);
> > > +	total = si.freeram * si.mem_unit;
> > > +
> > > +	kunit_info(test, "Free ram is %lu bytes. Will allocate
> > > twice of that.\n",
> > > +		   (unsigned long) total);
> > > +
> > > +	total <<= 1;
> > > +	for (alloced = 0; alloced < total ; alloced +=
> > > XE_BO_SHRINK_SIZE) {
> > > +		struct xe_bo *bo;
> > > +		unsigned int mem_type;
> > > +
> > > +		link = kzalloc(sizeof(*link), GFP_KERNEL);
> > > +		if (!link) {
> > > +			KUNIT_FAIL(test, "Unexpeced link
> > > allocation failure\n");
> > > +			break;
> > > +		}
> > > +
> > > +		INIT_LIST_HEAD(&link->link);
> > > +
> > > +		/* We can create bos using WC caching here. But it
> > > is slower. */
> > > +		bo = xe_bo_create_user(xe, NULL, NULL,
> > > XE_BO_SHRINK_SIZE,
> > > +				       DRM_XE_GEM_CPU_CACHING_WB,
> > > +				       ttm_bo_type_device,
> > > +				       XE_BO_FLAG_SYSTEM);
> > > +		if (IS_ERR(bo)) {
> > > +			if (bo != ERR_PTR(-ENOMEM) && bo !=
> > > ERR_PTR(-ENOSPC) &&
> > > +			    bo != ERR_PTR(-EINTR) && bo !=
> > > ERR_PTR(-ERESTARTSYS))
> > > +				KUNIT_FAIL(test, "Error creating
> > > bo: %pe\n", bo);
> > > +			kfree(link);
> > > +			break;
> > > +		}
> > > +		link->bo = bo;
> > > +		list_add_tail(&link->link, &bos);
> > > +		xe_bo_lock(bo, false);
> > > +
> > > +		/*
> > > +		 * If we're low on swap entries, we can't shrink
> > > unless the bo
> > > +		 * is marked purgeable.
> > > +		 */
> > > +		if (get_nr_swap_pages() < (XE_BO_SHRINK_SIZE >>
> > > PAGE_SHIFT) * 128) {
> > > +			struct xe_ttm_tt *xe_tt =
> > > +				container_of(bo->ttm.ttm,
> > > typeof(*xe_tt), ttm);
> > > +			long num_pages = xe_tt->ttm.num_pages;
> > > +
> > > +			xe_tt->purgeable = true;
> > > +			xe_shrinker_mod_pages(xe->mem.shrinker, -
> > > num_pages,
> > > +					      num_pages);
> > > +		}
> > > +
> > > +		mem_type = bo->ttm.resource->mem_type;
> > > +		xe_bo_unlock(bo);
> > > +		if (mem_type != XE_PL_TT)
> > > +			KUNIT_FAIL(test, "Bo in incorrect memory
> > > type: %u\n",
> > > +				   bo->ttm.resource->mem_type);
> > > +		cond_resched();
> > > +		if (signal_pending(current))
> > > +			break;
> > > +	}
> > > +
> > > +	/* Read back and destroy bos */
> > > +	list_for_each_entry_safe_reverse(link, next, &bos, link) {
> > > +		static struct ttm_operation_ctx ctx =
> > > {.interruptible = true};
> > > +		struct xe_bo *bo = link->bo;
> > > +		int ret;
> > > +
> > > +		if (!signal_pending(current)) {
> > > +			xe_bo_lock(bo, NULL);
> > > +			ret = ttm_bo_validate(&bo->ttm,
> > > &tt_placement, &ctx);
> > > +			xe_bo_unlock(bo);
> > > +			if (ret && ret != -EINTR)
> > > +				KUNIT_FAIL(test, "Validation
> > > failed: %pe\n",
> > > +					   ERR_PTR(ret));
> > > +			else if (ret)
> > > +				interrupted++;
> > > +			else
> > > +				successful++;
> > > +		}
> > > +		xe_bo_put(link->bo);
> > > +		list_del(&link->link);
> > > +		kfree(link);
> > > +		cond_resched();
> > > +	}
> > > +	kunit_info(test, "Readbacks interrupted: %u successful:
> > > %u\n",
> > > +		   interrupted, successful);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +void xe_bo_shrink_kunit(struct kunit *test)
> > > +{
> > > +	xe_call_for_each_device(shrink_test_run_device);
> > > +}
> > > +EXPORT_SYMBOL_IF_KUNIT(xe_bo_shrink_kunit);
> > > diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.c
> > > b/drivers/gpu/drm/xe/tests/xe_bo_test.c
> > > index a324cde77db8..317fa923e287 100644
> > > --- a/drivers/gpu/drm/xe/tests/xe_bo_test.c
> > > +++ b/drivers/gpu/drm/xe/tests/xe_bo_test.c
> > > @@ -10,6 +10,7 @@
> > >  static struct kunit_case xe_bo_tests[] = {
> > >  	KUNIT_CASE(xe_ccs_migrate_kunit),
> > >  	KUNIT_CASE(xe_bo_evict_kunit),
> > > +	KUNIT_CASE_SLOW(xe_bo_shrink_kunit),
> > >  	{}
> > >  };
> > >  
> > > diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.h
> > > b/drivers/gpu/drm/xe/tests/xe_bo_test.h
> > > index 0113ab45066a..7f44d14a45c5 100644
> > > --- a/drivers/gpu/drm/xe/tests/xe_bo_test.h
> > > +++ b/drivers/gpu/drm/xe/tests/xe_bo_test.h
> > > @@ -10,5 +10,6 @@ struct kunit;
> > >  
> > >  void xe_ccs_migrate_kunit(struct kunit *test);
> > >  void xe_bo_evict_kunit(struct kunit *test);
> > > +void xe_bo_shrink_kunit(struct kunit *test);
> > >  
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index 65c696966e96..6ab63d1642ae 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -10,6 +10,7 @@
> > >  #include <drm/drm_drv.h>
> > >  #include <drm/drm_gem_ttm_helper.h>
> > >  #include <drm/drm_managed.h>
> > > +#include <drm/ttm/ttm_backup.h>
> > >  #include <drm/ttm/ttm_device.h>
> > >  #include <drm/ttm/ttm_placement.h>
> > >  #include <drm/ttm/ttm_tt.h>
> > > @@ -25,6 +26,7 @@
> > >  #include "xe_pm.h"
> > >  #include "xe_preempt_fence.h"
> > >  #include "xe_res_cursor.h"
> > > +#include "xe_shrinker.h"
> > >  #include "xe_trace_bo.h"
> > >  #include "xe_ttm_stolen_mgr.h"
> > >  #include "xe_vm.h"
> > > @@ -278,11 +280,15 @@ static void xe_evict_flags(struct
> > > ttm_buffer_object *tbo,
> > >  	}
> > >  }
> > >  
> > > +/* struct xe_ttm_tt - Subclassed ttm_tt for xe */
> > >  struct xe_ttm_tt {
> > >  	struct ttm_tt ttm;
> > > -	struct device *dev;
> > > +	/** @xe - The xe device */
> > > +	struct xe_device *xe;
> > >  	struct sg_table sgt;
> > >  	struct sg_table *sg;
> > > +	/** @purgeable - Whether the bo is purgeable (WONTNEED) */
> > 
> > So we need to add WONTNEED to our uAPI, right?
> 
> Not strictly, but we have work ongoing to implement this. Bos that UMD
> pool are typically WONTNEED and unless we mark them as such, shrinking
> of these will not work unless we have swap-space available, and then
> only with a completely unnecessary copy...
> 

Makes sense.

> > 
> > > +	bool purgeable;
> > >  };
> > >  
> > >  static int xe_tt_map_sg(struct ttm_tt *tt)
> > > @@ -291,7 +297,8 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
> > >  	unsigned long num_pages = tt->num_pages;
> > >  	int ret;
> > >  
> > > -	XE_WARN_ON(tt->page_flags & TTM_TT_FLAG_EXTERNAL);
> > > +	XE_WARN_ON((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
> > > +		   !(tt->page_flags &
> > > TTM_TT_FLAG_EXTERNAL_MAPPABLE));
> > >  
> > >  	if (xe_tt->sg)
> > >  		return 0;
> > > @@ -299,13 +306,13 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
> > >  	ret = sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt-
> > > >pages,
> > >  						num_pages, 0,
> > >  						(u64)num_pages <<
> > > PAGE_SHIFT,
> > > -
> > > 						xe_sg_segment_size(xe_tt->dev),
> > > +						xe_sg_segment_size
> > > (xe_tt->xe->drm.dev),
> > >  						GFP_KERNEL);
> > >  	if (ret)
> > >  		return ret;
> > >  
> > >  	xe_tt->sg = &xe_tt->sgt;
> > > -	ret = dma_map_sgtable(xe_tt->dev, xe_tt->sg,
> > > DMA_BIDIRECTIONAL,
> > > +	ret = dma_map_sgtable(xe_tt->xe->drm.dev, xe_tt->sg,
> > > DMA_BIDIRECTIONAL,
> > >  			      DMA_ATTR_SKIP_CPU_SYNC);
> > >  	if (ret) {
> > >  		sg_free_table(xe_tt->sg);
> > > @@ -321,7 +328,7 @@ static void xe_tt_unmap_sg(struct ttm_tt *tt)
> > >  	struct xe_ttm_tt *xe_tt = container_of(tt, struct
> > > xe_ttm_tt, ttm);
> > >  
> > >  	if (xe_tt->sg) {
> > > -		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
> > > +		dma_unmap_sgtable(xe_tt->xe->drm.dev, xe_tt->sg,
> > >  				  DMA_BIDIRECTIONAL, 0);
> > >  		sg_free_table(xe_tt->sg);
> > >  		xe_tt->sg = NULL;
> > > @@ -336,21 +343,41 @@ struct sg_table *xe_bo_sg(struct xe_bo *bo)
> > >  	return xe_tt->sg;
> > >  }
> > >  
> > > +/*
> > > + * Account ttm pages against the device shrinker's shrinkable and
> > > + * purgeable counts.
> > > + */
> > > +static void xe_ttm_tt_account(struct ttm_tt *tt, bool add)
> > > +{
> > 
> > Again I think bools are frowned upon as arguments. Maybe just two
> > functions - add / sub?
> 
> OK,
> 
> > 
> > > +	struct xe_ttm_tt *xe_tt = container_of(tt, struct
> > > xe_ttm_tt, ttm);
> > > +	long num_pages = tt->num_pages;
> > > +
> > > +	if (!add)
> > > +		num_pages = -num_pages;
> > > +
> > > +	if (xe_tt->purgeable)
> > > +		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0,
> > > num_pages);
> > > +	else
> > > +		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker,
> > > num_pages, 0);
> > > +}
> > > +
> > >  static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object
> > > *ttm_bo,
> > >  				       u32 page_flags)
> > >  {
> > >  	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> > >  	struct xe_device *xe = xe_bo_device(bo);
> > > -	struct xe_ttm_tt *tt;
> > > +	struct xe_ttm_tt *xe_tt;
> > > +	struct ttm_tt *tt;
> > >  	unsigned long extra_pages;
> > >  	enum ttm_caching caching;
> > >  	int err;
> > >  
> > > -	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
> > > -	if (!tt)
> > > +	xe_tt = kzalloc(sizeof(*xe_tt), GFP_KERNEL);
> > > +	if (!xe_tt)
> > >  		return NULL;
> > >  
> > > -	tt->dev = xe->drm.dev;
> > > +	tt = &xe_tt->ttm;
> > > +	xe_tt->xe = xe;
> > >  
> > >  	extra_pages = 0;
> > >  	if (xe_bo_needs_ccs_pages(bo))
> > > @@ -387,42 +414,128 @@ static struct ttm_tt
> > > *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
> > >  		caching = ttm_uncached;
> > >  	}
> > >  
> > > -	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching,
> > > extra_pages);
> > > +	if (ttm_bo->type != ttm_bo_type_sg)
> > > +		page_flags |= TTM_TT_FLAG_EXTERNAL |
> > > TTM_TT_FLAG_EXTERNAL_MAPPABLE;
> > > +
> > > +	err = ttm_tt_init(tt, &bo->ttm, page_flags, caching,
> > > extra_pages);
> > >  	if (err) {
> > > -		kfree(tt);
> > > +		kfree(xe_tt);
> > >  		return NULL;
> > >  	}
> > >  
> > > -	return &tt->ttm;
> > > +	tt->backup = ttm_backup_shmem_create(tt->num_pages <<
> > > PAGE_SHIFT);
> > > +	if (IS_ERR(tt->backup)) {
> > > +		ttm_tt_fini(tt);
> > 
> > Mentioned this the previous review I think you need set tt->backup to
> > NULL here or update ttm_tt_fini to understand IS_ERR(tt->backup).
> > 
> > Also maybe dump question but could we just have a global backup for
> > all
> > BOs? Would that be better than each BO creating its own backup?
> 
> I initially made the code like that, when we had a global backend
> directly into the swap cache. But I figure shmem wants one file per bo,
> otherwise we'd need one gigantic shmem object... Not sure if that
> works...
>

If one backup per shmem sense, then let's do that.

I do think we should remove the restriction of only supporting 1 backup
per BO so if a driver wants to use a global backup it can.

e.g. Don't fini / free the backup in ttm_tt_fini rather have the driver
completely own the backup field. Kinda goofy for the driver to setup the
field but TTM to fini / free it.

> > 
> > > +		kfree(xe_tt);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	return tt;
> > >  }
> > >  
> > >  static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct
> > > ttm_tt *tt,
> > >  			      struct ttm_operation_ctx *ctx)
> > >  {
> > > +	struct xe_ttm_tt *xe_tt = container_of(tt, struct
> > > xe_ttm_tt, ttm);
> > >  	int err;
> > >  
> > >  	/*
> > >  	 * dma-bufs are not populated with pages, and the dma-
> > >  	 * addresses are set up when moved to XE_PL_TT.
> > >  	 */
> > > -	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
> > > +	if ((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
> > > +	    !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
> > >  		return 0;
> > >  
> > >  	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
> > >  	if (err)
> > >  		return err;
> > >  
> > > -	return err;
> > > +	xe_tt->purgeable = false;
> > > +	xe_ttm_tt_account(tt, true);
> > > +
> > > +	return 0;
> > >  }
> > >  
> > >  static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev,
> > > struct ttm_tt *tt)
> > >  {
> > > -	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
> > > +	if ((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
> > > +	    !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
> > >  		return;
> > >  
> > >  	xe_tt_unmap_sg(tt);
> > >  
> > > -	return ttm_pool_free(&ttm_dev->pool, tt);
> > > +	ttm_pool_free(&ttm_dev->pool, tt);
> > > +	xe_ttm_tt_account(tt, false);
> > > +}
> > > +
> > > +/**
> > > + * xe_bo_shrink() - Try to shrink an xe bo.
> > > + * @walk:  - The walk parameters
> > > + * @bo: The TTM buffer object
> > > + * @purge: Only consider purgeable bos.
> > > + * @writeback: Try to write back to persistent storage.
> > > + *
> > > + * Try to shrink- or purge a bo, and if it succeeds, unmap dma.
> > > + * Note that we need to be able to handle also non xe bos
> > > + * (ghost bos), but only if the struct ttm_tt is embedded in
> > > + * a struct xe_ttm_tt.
> > > + *
> > > + * Return: The number of pages shrunken or purged, or negative
> > > error
> > > + * code on failure.
> > > + */
> > > +long xe_bo_shrink(struct ttm_lru_walk *walk, struct
> > > ttm_buffer_object *bo,
> > > +		  bool purge, bool writeback)
> > > +{
> > > +	struct ttm_tt *tt = bo->ttm;
> > > +	struct xe_ttm_tt *xe_tt = container_of(tt, struct
> > > xe_ttm_tt, ttm);
> > > +	struct ttm_place place = {.mem_type = bo->resource-
> > > >mem_type};
> > > +	struct xe_bo *xe_bo = ttm_to_xe_bo(bo);
> > > +	struct xe_device *xe = xe_tt->xe;
> > > +	bool needs_rpm;
> > > +	long lret = 0L;
> > > +
> > > +	if (!tt || !ttm_tt_is_populated(tt) ||
> > > +	    !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE) ||
> > > +	    (purge && !xe_tt->purgeable))
> > > +		return 0L;
> > > +
> > > +	if (!ttm_bo_eviction_valuable(bo, &place))
> > > +		return 0L;
> > > +
> > > +	/* Beware of zombies (GEM object refcount == 0) and
> > > ghosts. */
> > > +	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
> > > {
> > > +		struct ttm_placement null_placement = {
> > > .num_placement = 0 };
> > > +
> > > +		lret = ttm_bo_wait_ctx(bo, walk->ctx);
> > > +		if (lret)
> > > +			return lret;
> > > +
> > > +		/* Purge the bo content! */
> > > +		ttm_bo_validate(bo, &null_placement, walk->ctx);
> > > +		return tt->num_pages;
> > > +	}
> > > +
> > > +	/* System CCS needs gpu copy when moving PL_TT ->
> > > PL_SYSTEM */
> > > +	needs_rpm = (!IS_DGFX(xe) && bo->resource->mem_type !=
> > > XE_PL_SYSTEM &&
> > > +		     xe_bo && xe_bo_needs_ccs_pages(xe_bo) &&
> > > !xe_tt->purgeable);
> > 
> > Is xe_bo check really needed here?
> 
> Yes, I think otherwise xe_bo_needs_ccs_pages will be called with NULL
> for ghost objects that aren't xe_bo.
> 

Got it.

> > 
> > > +	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
> > > +		goto out_unref;
> > > +
> > > +	lret = ttm_bo_try_shrink(walk, bo, xe_tt->purgeable,
> > > writeback);
> > > +	if (needs_rpm)
> > > +		xe_pm_runtime_put(xe);
> > > +
> > > +	if (lret > 0) {
> > > +		xe_assert(xe, !ttm_tt_is_populated(tt));
> > > +
> > > +		xe_ttm_tt_account(tt, false);
> > > +	}
> > > +
> > > +out_unref:
> > > +	xe_bo_put(xe_bo);
> > > +
> > > +	return lret;
> > >  }
> > >  
> > >  static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct
> > > ttm_tt *tt)
> > > @@ -1238,6 +1351,7 @@ struct xe_bo *___xe_bo_create_locked(struct
> > > xe_device *xe, struct xe_bo *bo,
> > >  	struct ttm_operation_ctx ctx = {
> > >  		.interruptible = true,
> > >  		.no_wait_gpu = false,
> > > +		.gfp_retry_mayfail = true,
> > 
> > Can you explain why you are setting this?
> 
> Hm. We might want this in a separate patch. Without this, bo memory
> allocation will typically never fail, but instead start the OOM killer.
> I don't think that's the behaviour we want, but yeah deserves its own
> patch and review.
> 

Sounds good.

> > 
> > >  	};
> > >  	struct ttm_placement *placement;
> > >  	uint32_t alignment;
> > > @@ -1681,6 +1795,8 @@ int xe_bo_pin_external(struct xe_bo *bo)
> > >  	}
> > >  
> > >  	ttm_bo_pin(&bo->ttm);
> > > +	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> > > +		xe_ttm_tt_account(bo->ttm.ttm, false);
> > >  
> > >  	/*
> > >  	 * FIXME: If we always use the reserve / unreserve
> > > functions for locking
> > > @@ -1739,6 +1855,8 @@ int xe_bo_pin(struct xe_bo *bo)
> > >  	}
> > >  
> > >  	ttm_bo_pin(&bo->ttm);
> > > +	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> > > +		xe_ttm_tt_account(bo->ttm.ttm, false);
> > >  
> > >  	/*
> > >  	 * FIXME: If we always use the reserve / unreserve
> > > functions for locking
> > > @@ -1773,6 +1891,9 @@ void xe_bo_unpin_external(struct xe_bo *bo)
> > >  	spin_unlock(&xe->pinned.lock);
> > >  
> > >  	ttm_bo_unpin(&bo->ttm);
> > > +	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> > > +		xe_ttm_tt_account(bo->ttm.ttm, true);
> > > +
> > 
> > Nit: Extra newline.
> Will fix.
> > 
> > >  
> > >  	/*
> > >  	 * FIXME: If we always use the reserve / unreserve
> > > functions for locking
> > > @@ -1801,6 +1922,8 @@ void xe_bo_unpin(struct xe_bo *bo)
> > >  	}
> > >  
> > >  	ttm_bo_unpin(&bo->ttm);
> > > +	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> > > +		xe_ttm_tt_account(bo->ttm.ttm, true);
> > >  }
> > >  
> > >  /**
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.h
> > > b/drivers/gpu/drm/xe/xe_bo.h
> > > index 6de894c728f5..8463e3f3f6f1 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > @@ -63,6 +63,7 @@
> > >  #define XE_BO_PROPS_INVALID	(-1)
> > >  
> > >  struct sg_table;
> > > +struct xe_ttm_lru_walk;
> > >  
> > >  struct xe_bo *xe_bo_alloc(void);
> > >  void xe_bo_free(struct xe_bo *bo);
> > > @@ -126,6 +127,28 @@ static inline struct xe_bo *xe_bo_get(struct
> > > xe_bo *bo)
> > >  	return bo;
> > >  }
> > >  
> > > +/*
> > > + * xe_bo_get_unless_zero() - Conditionally obtain a GEM object
> > > refcount on an
> > > + * xe bo
> > > + * @bo: The bo for which we want to obtain a refcount.
> > > + *
> > > + * There is a short window between where the bo's GEM object
> > > refcount reaches
> > > + * zero and where we put the final ttm_bo reference. Code in the
> > > eviction- and
> > > + * shrinking path should therefore attempt to grab a gem object
> > > reference before
> > > + * trying to use members outside of the base class ttm object.
> > > This function is
> > > + * intended for that purpose. On successful return, this function
> > > must be paired
> > > + * with an xe_bo_put().
> > > + *
> > > + * Return: @bo on success, NULL on failure.
> > > + */
> > > +static inline __must_check struct xe_bo
> > > *xe_bo_get_unless_zero(struct xe_bo *bo)
> > > +{
> > > +	if (!bo || !kref_get_unless_zero(&bo->ttm.base.refcount))
> > > +		return NULL;
> > > +
> > > +	return bo;
> > > +}
> > > +
> > >  static inline void xe_bo_put(struct xe_bo *bo)
> > >  {
> > >  	if (bo)
> > > @@ -315,6 +338,9 @@ static inline unsigned int
> > > xe_sg_segment_size(struct device *dev)
> > >  
> > >  #define
> > > i915_gem_object_flush_if_display(obj)		((void)(obj))
> > >  
> > > +long xe_bo_shrink(struct ttm_lru_walk *walk, struct
> > > ttm_buffer_object *bo,
> > > +		  bool purge, bool writeback);
> > > +
> > >  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> > >  /**
> > >   * xe_bo_is_mem_type - Whether the bo currently resides in the
> > > given
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > b/drivers/gpu/drm/xe/xe_device.c
> > > index cfda7cb5df2c..58fecc4b0a18 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -47,6 +47,7 @@
> > >  #include "xe_perf.h"
> > >  #include "xe_pm.h"
> > >  #include "xe_query.h"
> > > +#include "xe_shrinker.h"
> > >  #include "xe_sriov.h"
> > >  #include "xe_tile.h"
> > >  #include "xe_ttm_stolen_mgr.h"
> > > @@ -241,6 +242,9 @@ static void xe_device_destroy(struct drm_device
> > > *dev, void *dummy)
> > >  	if (xe->unordered_wq)
> > >  		destroy_workqueue(xe->unordered_wq);
> > >  
> > > +	if (!IS_ERR_OR_NULL(xe->mem.shrinker))
> > > +		xe_shrinker_destroy(xe->mem.shrinker);
> > > +
> > >  	ttm_device_fini(&xe->ttm);
> > >  }
> > >  
> > > @@ -270,6 +274,10 @@ struct xe_device *xe_device_create(struct
> > > pci_dev *pdev,
> > >  	if (err)
> > >  		goto err;
> > >  
> > > +	xe->mem.shrinker = xe_shrinker_create(xe);
> > > +	if (IS_ERR(xe->mem.shrinker))
> > > +		return ERR_CAST(xe->mem.shrinker);
> > > +
> > >  	xe->info.devid = pdev->device;
> > >  	xe->info.revid = pdev->revision;
> > >  	xe->info.force_execlist = xe_modparam.force_execlist;
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > index c37be471d11c..3d5440aba52e 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -325,6 +325,8 @@ struct xe_device {
> > >  		struct xe_mem_region vram;
> > >  		/** @mem.sys_mgr: system TTM manager */
> > >  		struct ttm_resource_manager sys_mgr;
> > > +		/** @mem.sys_mgr: system memory shrinker. */
> > > +		struct xe_shrinker *shrinker;
> > >  	} mem;
> > >  
> > >  	/** @sriov: device level virtualization data */
> > > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > > b/drivers/gpu/drm/xe/xe_shrinker.c
> > > new file mode 100644
> > > index 000000000000..3f9554bdc06b
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > > @@ -0,0 +1,287 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2024 Intel Corporation
> > > + */
> > > +
> > > +#include <linux/shrinker.h>
> > > +#include <linux/swap.h>
> > > +
> > > +#include <drm/ttm/ttm_bo.h>
> > > +#include <drm/ttm/ttm_tt.h>
> > > +
> > > +#include "xe_bo.h"
> > > +#include "xe_pm.h"
> > > +#include "xe_shrinker.h"
> > > +
> > > +/**
> > > + * struct xe_shrinker - per-device shrinker
> > > + * @xe: Back pointer to the device.
> > > + * @lock: Lock protecting accounting.
> > > + * @shrinkable_pages: Number of pages that are currently
> > > shrinkable.
> > > + * @purgeable_pages: Number of pages that are currently purgeable.
> > > + * @shrink: Pointer to the mm shrinker.
> > > + * @pm_worker: Worker to wake up the device if required.
> > > + */
> > > +struct xe_shrinker {
> > > +	struct xe_device *xe;
> > > +	rwlock_t lock;
> > > +	long shrinkable_pages;
> > > +	long purgeable_pages;
> > > +	struct shrinker *shrink;
> > > +	struct work_struct pm_worker;
> > > +};
> > > +
> > > +/**
> > > + * struct xe_shrink_lru_walk - lru_walk subclass for shrinker
> > > + * @walk: The embedded base class.
> > > + * @xe: Pointer to the xe device.
> > > + * @purge: Purgeable only request from the srinker.
> > > + * @writeback: Try to write back to persistent storage.
> > > + */
> > > +struct xe_shrink_lru_walk {
> > > +	struct ttm_lru_walk walk;
> > > +	struct xe_device *xe;
> > > +	bool purge;
> > > +	bool writeback;
> > > +};
> > > +
> > > +static struct xe_shrinker *to_xe_shrinker(struct shrinker *shrink)
> > > +{
> > > +	return shrink->private_data;
> > > +}
> > > +
> > > +static struct xe_shrink_lru_walk *
> > > +to_xe_shrink_lru_walk(struct ttm_lru_walk *walk)
> > > +{
> > > +	return container_of(walk, struct xe_shrink_lru_walk,
> > > walk);
> > > +}
> > > +
> > > +/**
> > > + * xe_shrinker_mod_pages() - Modify shrinker page accounting
> > > + * @shrinker: Pointer to the struct xe_shrinker.
> > > + * @shrinkable: Shrinkable pages delta. May be negative.
> > > + * @purgeable: Purgeable page delta. May be negative.
> > > + *
> > > + * Modifies the shrinkable and purgeable pages accounting.
> > > + */
> > > +void
> > > +xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long
> > > shrinkable, long purgeable)
> > > +{
> > > +	write_lock(&shrinker->lock);
> > > +	shrinker->shrinkable_pages += shrinkable;
> > > +	shrinker->purgeable_pages += purgeable;
> > > +	write_unlock(&shrinker->lock);
> > > +}
> > > +
> > > +static long xe_shrinker_process_bo(struct ttm_lru_walk *walk,
> > > struct ttm_buffer_object *bo)
> > > +{
> > > +	struct xe_shrink_lru_walk *shrink_walk =
> > > to_xe_shrink_lru_walk(walk);
> > > +
> > > +	return xe_bo_shrink(walk, bo, shrink_walk->purge,
> > > shrink_walk->writeback);
> > > +}
> > > +
> > > +static long xe_shrinker_walk(struct xe_shrink_lru_walk
> > > *shrink_walk, long target)
> > > +{
> > > +	struct xe_device *xe = shrink_walk->xe;
> > > +	struct ttm_resource_manager *man;
> > > +	unsigned int mem_type;
> > > +	long sofar = 0;
> > > +	long lret;
> > > +
> > > +	for (mem_type = XE_PL_SYSTEM; mem_type <= XE_PL_TT;
> > > ++mem_type) {
> > > +		man = ttm_manager_type(&xe->ttm, mem_type);
> > > +		if (!man || !man->use_tt)
> > > +			continue;
> > > +
> > > +		lret = ttm_lru_walk_for_evict(&shrink_walk->walk,
> > > &xe->ttm, man, target);
> > > +		if (lret < 0)
> > > +			return lret;
> > > +
> > > +		sofar += lret;
> > > +		if (sofar >= target)
> > > +			break;
> > > +	}
> > > +
> > > +	return sofar;
> > > +}
> > > +
> > > +static unsigned long
> > > +xe_shrinker_count(struct shrinker *shrink, struct shrink_control
> > > *sc)
> > > +{
> > > +	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
> > > +	unsigned long num_pages;
> > > +
> > > +	num_pages = get_nr_swap_pages();
> > > +	read_lock(&shrinker->lock);
> > > +	num_pages = min_t(unsigned long, num_pages, shrinker-
> > > >shrinkable_pages);
> > > +	num_pages += shrinker->purgeable_pages;
> > > +	read_unlock(&shrinker->lock);
> > > +
> > > +	return num_pages ? num_pages : SHRINK_EMPTY;
> > > +}
> > > +
> > > +static const struct ttm_lru_walk_ops xe_shrink_ops = {
> > > +	.process_bo = xe_shrinker_process_bo,
> > > +};
> > > +
> > > +/*
> > > + * Check if we need runtime pm, and if so try to grab a reference
> > > if
> > > + * already active. If grabbing a reference fails, queue a worker
> > > that
> > > + * does it for us outside of reclaim, but don't wait for it to
> > > complete.
> > > + * If bo shrinking needs an rpm reference and we don't have it
> > > (yet),
> > > + * that bo will be skipped anyway.
> > > + */
> > > +static bool xe_shrinker_runtime_pm_get(struct xe_shrinker
> > > *shrinker, bool force,
> > > +				       unsigned long nr_to_scan)
> > > +{
> > > +	struct xe_device *xe = shrinker->xe;
> > > +
> > > +	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe) ||
> > > +	    !get_nr_swap_pages())
> > > +		return false;
> > > +
> > > +	if (!force) {
> > > +		read_lock(&shrinker->lock);
> > > +		force = (nr_to_scan > shrinker->purgeable_pages);
> > > +		read_unlock(&shrinker->lock);
> > > +		if (!force)
> > > +			return false;
> > > +	}
> > > +
> > > +	if (!xe_pm_runtime_get_if_active(xe)) {
> > > +		queue_work(xe->unordered_wq, &shrinker-
> > > >pm_worker);
> > > +		return false;
> > > +	}
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +static void xe_shrinker_runtime_pm_put(struct xe_shrinker
> > > *shrinker, bool runtime_pm)
> > > +{
> > > +	if (runtime_pm)
> > > +		xe_pm_runtime_put(shrinker->xe);
> > > +}
> > > +
> > > +static unsigned long xe_shrinker_scan(struct shrinker *shrink,
> > > struct shrink_control *sc)
> > > +{
> > > +	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
> > > +	bool is_kswapd = current_is_kswapd();
> > > +	struct ttm_operation_ctx ctx = {
> > > +		.interruptible = false,
> > > +		.no_wait_gpu = !is_kswapd,
> > > +	};
> > > +	unsigned long nr_to_scan, freed = 0;
> > > +	struct xe_shrink_lru_walk shrink_walk = {
> > > +		.walk = {
> > > +			.ops = &xe_shrink_ops,
> > > +			.ctx = &ctx,
> > > +			.trylock_only = true,
> > > +		},
> > > +		.xe = shrinker->xe,
> > > +		.purge = true,
> > > +		.writeback = is_kswapd,
> > > +	};
> > > +	bool runtime_pm;
> > > +	bool purgeable;
> > > +	long ret;
> > > +
> > > +	sc->nr_scanned = 0;
> > > +	nr_to_scan = sc->nr_to_scan;
> > > +
> > > +	read_lock(&shrinker->lock);
> > > +	purgeable = !!shrinker->purgeable_pages;
> > > +	read_unlock(&shrinker->lock);
> > > +
> > > +	/* Might need runtime PM. Try to wake early if it looks
> > > like it. */
> > > +	runtime_pm = xe_shrinker_runtime_pm_get(shrinker, false,
> > > nr_to_scan);
> > > +
> > > +	while (purgeable && freed < nr_to_scan) {
> > > +		ret = xe_shrinker_walk(&shrink_walk, nr_to_scan);
> > > +		if (ret <= 0)
> > > +			break;
> > > +
> > > +		freed += ret;
> > > +	}
> > > +
> > > +	sc->nr_scanned = freed;
> > > +	if (freed < nr_to_scan)
> > > +		nr_to_scan -= freed;
> > > +	else
> > > +		nr_to_scan = 0;
> > > +	if (!nr_to_scan)
> > > +		goto out;
> > > +
> > > +	/* If we didn't wake before, try to do it now if needed.
> > > */
> > > +	if (!runtime_pm)
> > > +		runtime_pm = xe_shrinker_runtime_pm_get(shrinker,
> > > true, 0);
> > > +
> > > +	shrink_walk.purge = false;
> > > +	nr_to_scan = sc->nr_to_scan;
> > > +	while (freed < nr_to_scan) {
> > > +		ret = xe_shrinker_walk(&shrink_walk, nr_to_scan);
> > > +		if (ret <= 0)
> > > +			break;
> > > +
> > > +		freed += ret;
> > > +	}
> > > +
> > > +	sc->nr_scanned = freed;
> > > +
> > > +out:
> > > +	xe_shrinker_runtime_pm_put(shrinker, runtime_pm);
> > > +	return freed ? freed : SHRINK_STOP;
> > > +}
> > > +
> > > +/* Wake up the device for shrinking. */
> > > +static void xe_shrinker_pm(struct work_struct *work)
> > > +{
> > > +	struct xe_shrinker *shrinker =
> > > +		container_of(work, typeof(*shrinker), pm_worker);
> > > +
> > > +	xe_pm_runtime_get(shrinker->xe);
> > > +	xe_pm_runtime_put(shrinker->xe);
> > 
> > So I don't really get this. How does this help the shrinker get a PM
> > ref? The small window between xe_pm_runtime_get / put the shrinker
> > grabs
> > one via xe_pm_runtime_get_if_active? Seems fragile.
> 
> The pm has a delay after the last put (Typically 1s?), and if the
> shrinker fails obtaining a reference it will be retried. Typically it
> will then succeed and when it does start a new delay.
> 

Ah, forgot that their is a delay on the final put. This make sense now.
Can't really think of a better solution that this at the moment. Maybe
add a comment indicating this?

Matt

> This doesn't strictly guarantee shrinking progress, but there's no way
> we can synchronously delay shrinking until we have the pm reference.
> 
> What we could perhaps do is to report back that we actually made
> progress but postpone the actual shrinking to the worker with writeback
> set to on; hoping that the shrinking core doesn't give up before it
> sees the released memory...
> 
> But I'd prefer to leave that out until we see that that's actually a
> real problem.
> 
> Best would be if we could have access the LNL CCS memory using the
> CPU...
> 
> /Thomas
> 
> 
> > 
> > Matt
> > 
> > > +}
> > > +
> > > +/**
> > > + * xe_shrinker_create() - Create an xe per-device shrinker
> > > + * @xe: Pointer to the xe device.
> > > + *
> > > + * Returns: A pointer to the created shrinker on success,
> > > + * Negative error code on failure.
> > > + */
> > > +struct xe_shrinker *xe_shrinker_create(struct xe_device *xe)
> > > +{
> > > +	struct xe_shrinker *shrinker = kzalloc(sizeof(*shrinker),
> > > GFP_KERNEL);
> > > +
> > > +	if (!shrinker)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	shrinker->shrink = shrinker_alloc(0, "xe system
> > > shrinker");
> > > +	if (!shrinker->shrink) {
> > > +		kfree(shrinker);
> > > +		return ERR_PTR(-ENOMEM);
> > > +	}
> > > +
> > > +	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
> > > +	shrinker->xe = xe;
> > > +	rwlock_init(&shrinker->lock);
> > > +	shrinker->shrink->count_objects = xe_shrinker_count;
> > > +	shrinker->shrink->scan_objects = xe_shrinker_scan;
> > > +	shrinker->shrink->private_data = shrinker;
> > > +	shrinker_register(shrinker->shrink);
> > > +
> > > +	return shrinker;
> > > +}
> > > +
> > > +/**
> > > + * xe_shrinker_destroy() - Destroy an xe per-device shrinker
> > > + * @shrinker: Pointer to the shrinker to destroy.
> > > + */
> > > +void xe_shrinker_destroy(struct xe_shrinker *shrinker)
> > > +{
> > > +	xe_assert(shrinker->xe, !shrinker->shrinkable_pages);
> > > +	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
> > > +	shrinker_free(shrinker->shrink);
> > > +	flush_work(&shrinker->pm_worker);
> > > +	kfree(shrinker);
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_shrinker.h
> > > b/drivers/gpu/drm/xe/xe_shrinker.h
> > > new file mode 100644
> > > index 000000000000..28a038f4fcbf
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_shrinker.h
> > > @@ -0,0 +1,18 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2024 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_SHRINKER_H_
> > > +#define _XE_SHRINKER_H_
> > > +
> > > +struct xe_shrinker;
> > > +struct xe_device;
> > > +
> > > +void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long
> > > shrinkable, long purgeable);
> > > +
> > > +struct xe_shrinker *xe_shrinker_create(struct xe_device *xe);
> > > +
> > > +void xe_shrinker_destroy(struct xe_shrinker *shrinker);
> > > +
> > > +#endif
> > > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > > index e577528f5dfc..c7e81ae025d9 100644
> > > --- a/include/drm/ttm/ttm_bo.h
> > > +++ b/include/drm/ttm/ttm_bo.h
> > > @@ -229,6 +229,9 @@ struct ttm_lru_walk {
> > >  long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct
> > > ttm_device *bdev,
> > >  			    struct ttm_resource_manager *man, long
> > > target);
> > >  
> > > +long ttm_bo_try_shrink(struct ttm_lru_walk *walk, struct
> > > ttm_buffer_object *bo,
> > > +		       bool purge, bool writeback);
> > > +
> > >  /**
> > >   * ttm_bo_get - reference a struct ttm_buffer_object
> > >   *
> > > -- 
> > > 2.44.0
> > > 
> 
