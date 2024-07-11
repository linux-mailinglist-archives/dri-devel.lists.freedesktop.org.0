Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC6492EC34
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 18:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB4B10E955;
	Thu, 11 Jul 2024 16:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ohjj471u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4647410E2C6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 16:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720713670; x=1752249670;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7eEh2WNkKMDqDt5bb4p2Rv7YK9G0UHRNaNWmuOa7quQ=;
 b=Ohjj471uAkrDzlhrfNjWDNIKpgRKIjzNLhVpPC/iDs7Wpn4L8KK4ZuTD
 +jFMFruqPkV9k1NMG4wMnDSHykCoJXdWzITSEKf4nyKVyLuh71YLTso2k
 5iiDKDzGqVHGDSYbH7iHr7t1vCNFxvyVp0VvtFHDXxGcAxQjaH2bKJFq0
 /nLQ0BassQz1iMWKj9d0jVRar3yUXovGUd3MKtx3c1BURC4ECOEnGQ8Nv
 SbsLTpRUa6ICrfzo5t/IS/66vh7ycbRa9sHI62/W1qurtPKJA1de4n88Y
 u86wg27bfcYv0U2Xi/2kUXfc6tugeUN9lLDsENqjHD+IVrk3Rw2R+L349 g==;
X-CSE-ConnectionGUID: rdBg2NiMQDCHmfUnz6hgLA==
X-CSE-MsgGUID: jlS8HdgmQxqFqHZmKiuKOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18249288"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="18249288"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 09:01:10 -0700
X-CSE-ConnectionGUID: 3F/GFqK6TYmn7v7HLNPofg==
X-CSE-MsgGUID: bFmT5x7ORvmzkJuGG7XucQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="49037144"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 09:01:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 09:01:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 09:01:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 09:01:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQmZ7ofWgAIU+hDC/PxdG0HwRuJALB4vQybCVAO1PcNg4lBKnofa7HDdzeCIUH4Sc/fDYwp9o/ygjdFHLm/aoWGLFxsEjGroUit+j3OJP8nJQL2//F1Uxw5NoQmVNMfJGjhXRqVADVZL6lGNCFJlU31S12CcDjJLZDgO930KhcIXVTY1WdkA1r72M2giOR6C0ysbrMLsm3yxzNfCxp0RDvL9gLo9zxZFVO2VzgULHFPWkheCGCVTwNPGxCodmQj4MTV0d5EyHWjGvzCfGckTWN9ZxjLKCabPHBSsdNoV63dmWBUcjhFSOh9HTk+Mh5MZgoKtPZGwZcQQYnuwaDjEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkZf9pbN6cOOWWue3wLJBDc5IIwMSTgHEvuwyetFJb0=;
 b=q9yMgWSOJAxS3EExMAFoNkY81MY9USwuRLvdEF+VhyMYM/Cp2vudPfCQ0SssinragDgVv0C+KsMbh7ArTMbmu0KD+UMttrVv89XldA3eI3sdaNSYUI4HbalmSVAzFMdb8j9rQjNfmwNl7UBLn8lXbDQeniyyX/66uAvndePitaKWcFhqaqZaQ6abl9+KRyh/BgeSBOfhmHjaJcApP81ziDpSUvA+1/fFdWmeT0dTvyJPKTQlDG6/tuNINVE/0dK0lIJ2+uX0yPgFEc4dSTzw3/F9vo67/HtDAQLOe1DloYaXV/A6I2V+6BdU8WjVH+2iqeywVaNt/D8FpxOUCLesbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7788.namprd11.prod.outlook.com (2603:10b6:8:f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 16:01:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 16:00:58 +0000
Date: Thu, 11 Jul 2024 16:00:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <thomas.hellstrom@linux.intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
Message-ID: <ZpABhdnzqIgzWot1@DUT025-TGLU.fm.intel.com>
References: <20240710124301.1628-1-christian.koenig@amd.com>
 <20240710124301.1628-5-christian.koenig@amd.com>
 <Zo7QpJKtVNw4RvUd@DUT025-TGLU.fm.intel.com>
 <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
X-ClientProxiedBy: BY3PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b96db5-fccc-4ea3-e576-08dca1c2a784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9e4FWjz9/AyoyYl1Z/LXfNfVIsMY6kMhHwtsEI2immkHiWvNiMn2l2Bn3w?=
 =?iso-8859-1?Q?6ODGOUolZgSp36hYjk3RbipxcSZPNV09Keh2xqG3GsXVfUafZhRP0tUuzA?=
 =?iso-8859-1?Q?EZjiARqHagwA1QFeuwcuIM2FEOY9a2XP67vTUGvll8CjooPSQ6SQQS16QB?=
 =?iso-8859-1?Q?d/cK5jBtLX5lyLwkw0UGYLXm/iC8r6CIkJy6TIg5y2yt9afQkfDpccDIup?=
 =?iso-8859-1?Q?CD86o36YC5YwKMOS66yEsRkTN1hp8fI7xPf74OzXdVToCGvs5DJbaYAHdQ?=
 =?iso-8859-1?Q?P+75DfDm+SgTBrXXCPggaX5Sxsb7masNTA80/X3otAa5fkLyTORjq/iOql?=
 =?iso-8859-1?Q?lhQ8ARbloLTeipTng+YFh0Geq1SvDhcLd0hJ8h6jZouGpLhsRmvQ4OE9Q3?=
 =?iso-8859-1?Q?a+yvFNm1MZpnYtsvu05zq4uigY/xGZBp4BLuHTdnL5o8sjQN5a5T1xhjV6?=
 =?iso-8859-1?Q?gIJGU1ooOLcfOTrsLy+vmPo1R96GC228GjqmoqLg5CXhLpgUg8sb1QG0Zi?=
 =?iso-8859-1?Q?0vxXB042Djjh6+634VzCNkjTW7yD3a1gM0P2rLav2ipsnbhQCNeSEg0iww?=
 =?iso-8859-1?Q?TFRHUrt6oUu4BYbhJhSE/S/DcnzMpYYtlYBgTbaoRUNO7B8cOjsLEAhX4A?=
 =?iso-8859-1?Q?oebOKrh/4xWcuLOoP0iwu2sXDCkVhieUYnP7q/JyqoFf600TBuRkfFNTfS?=
 =?iso-8859-1?Q?SGXVn2VlyktJ1wYPwtxfAlqTvreyatxqVnR8+YbJuxTOCgLLM03wXz4OZx?=
 =?iso-8859-1?Q?r2cuZwJp4wYL6Cf4O367s6ZKDLpk9bfJgAipaIbNSYR6qczgjiTE8tjTcf?=
 =?iso-8859-1?Q?/SdB3fRrUzFhyNWg2yfedHGkUROstWO0/q/dydOLpC3tb38InLknTRQtHT?=
 =?iso-8859-1?Q?ddcdSwDdgJQaHIO9jJKkiBJH14KovnGIzF1cY91m1mEVakbb0KycD/RnpJ?=
 =?iso-8859-1?Q?znUKfwr3Ne6+wDjIz6MH02ys5bz/k248Zkcw/Im7tXmZ3u+BvKJyXxfGZS?=
 =?iso-8859-1?Q?uOGfEV/hIwpvs5dGKhsDl4jD3OyC9ak4f87m6zemE5mxom21H6udGTvbRu?=
 =?iso-8859-1?Q?SU0fPXkzlbGW3/JeAgzQDp/8mhi9Ji/fcgpVUDwCVO3HDSPd8B5uP4y6Fq?=
 =?iso-8859-1?Q?4IyCKerBWarhD3h5fK3PB7K7sckbENJFk78i03LciZ+S32YA7P5gqe9in6?=
 =?iso-8859-1?Q?g/TyuDWARJDumlxsa04rkplNS2aMqiSo+4eJV4qJUj6zJaiJhc8gt+5L9T?=
 =?iso-8859-1?Q?g8+uWVb8LPfPduJtIKgdfE+8rn2pRd7ihQfUOMOPBGPfp5qby/6F2l1rxo?=
 =?iso-8859-1?Q?7FCe6DubAZeUuvsh/E/T+V/0D+gHTm3lWTgpviU91Qcaaro=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MJmHNKQ/B/zd67wfAHsO21Cv3f4J5Aa7t5E0rzUl4O9W8LYfLXKVTXPrEs?=
 =?iso-8859-1?Q?2DzExbyAZ2p/N1NZvfhgHazZmy3IiCCg53EOCuyu/AogTRS6TmpnKRTuZh?=
 =?iso-8859-1?Q?Ar3Egh/GgGsfCBaW3gkt9TxMKpmNWumUsKsX3D9QduGK0+xrQn53eWFreC?=
 =?iso-8859-1?Q?lIXJLRMyqYCFYTkJn6tBV7vfiAsKsRlEwWsA1dogdb9dZm9RUVQu6NHL2A?=
 =?iso-8859-1?Q?Ln5TGoxWgmue8JQUQ0eDS8EglaOIdxVFXd2kiuzfcZfGEf/F9n3eFMRouJ?=
 =?iso-8859-1?Q?aybqqIiG7HZN2eUZJXWys5khzyw6yYK3r9JQ7Rw7iO1wZMsFsSzUJN4jGh?=
 =?iso-8859-1?Q?w+QcpL6SvvjpU8l98sj20LXF3TMU79kRcO9lSG1u85H4SjHFnXkQAw/S6J?=
 =?iso-8859-1?Q?ay7SNR4p39rm2CQW6l2R1/jaJiPpCE1hHwN9vE22TBCRB2ebquxEcbEMc2?=
 =?iso-8859-1?Q?C7x8KoN+7lKSxrvCkDeA/cUzF2of+s8/kmCL4FwWfQSp9WIBl2EEFiyb3/?=
 =?iso-8859-1?Q?ukjlH7goHSV0geYgTJaP8wWiQ7ttu8UEJ49NtU5RspQmY+JEGiWH2s59Tg?=
 =?iso-8859-1?Q?94hjbopp9Ro+Idnfef5latPyxBbqG+WknKSLXxLpxWKShDHuaamOh1oDd7?=
 =?iso-8859-1?Q?RgNrFbwu7J1NA2LQVJqkCJGMyVyT1YTyDSPYLotoU10PYzoRjFyT9+4nIk?=
 =?iso-8859-1?Q?egQLWu5LFTZsVNfjagI9yvFLEuZwR91iG5FFonGWIGPiVMdv0Tq8gSzFNI?=
 =?iso-8859-1?Q?xXoJuSwPaT1t5VNJMCslqj+W0albo/7VSD4pCdmef9ySMlxSFIlBPVnI3E?=
 =?iso-8859-1?Q?ec7IJVpWmRIta8N6RyZRJfYl6RgkeyyH7EfiySikTzKmOMwnclDreiPZBd?=
 =?iso-8859-1?Q?PUCFamOqc+iIR3rWthYBZLDFhkjOaEXyHo8BEsrmnKQGRdkopZVrWmMlg8?=
 =?iso-8859-1?Q?EVzXSzDSStAMv8qsFlx8SGpCHBq6fAQD9FORQs+THGr8UapMU3Boo5qBOH?=
 =?iso-8859-1?Q?UoA43tXFuxO439YAJWW9NdlI4+5Nx/k4LfPs/dPl6KlqgkJ69uho0ZKBAi?=
 =?iso-8859-1?Q?qcbvQa1vWw+B/5DvF/Cr+GaleorEF90LI2AgdPJ/N3O2OR6YX9HBAWrEJl?=
 =?iso-8859-1?Q?CywEioJ5050nMzJnRamFpwBYhjlayNBHrSweZleXlryqKnT3kmQlNENxYj?=
 =?iso-8859-1?Q?wZ0qETmQKwtZfUUfy2OSHRTHLAu+njB+zXd4zj2l/cm84kTyHPAswkBmh8?=
 =?iso-8859-1?Q?TCYJDB6YSiKM3ji/n+8HsC1ujtQjzxq0qrXm2mEpVeT0OxgLQOQjTtp1jn?=
 =?iso-8859-1?Q?3+V1d0FNLRfRxnV5hJjmPIMrmoavq2NwSundgs/F/Xqciu5m927Wi084Yb?=
 =?iso-8859-1?Q?+vYMNIwgsCt69E0a1X8sXjvb2TRvlbmXYZRyswwh9Wmny5y80fbof6CK04?=
 =?iso-8859-1?Q?9rnxe4W0tO7MRXIRVE6B+sxI/d/X2vGxvIa/OwNbjd1lfPl3jIvpHRxh9o?=
 =?iso-8859-1?Q?VlmS0Oh4Q3G2x+WEDkSC4l/lFyrLCkXF9kl5DuTiN0/VP0hZXJCLO13Fd7?=
 =?iso-8859-1?Q?5GDdah3cMJBAJLM8QJOJ9obpzaZtRRMgGwks3hYrR+RwIoParzgXKTN7AL?=
 =?iso-8859-1?Q?/l1EaxJLev4MqMDbIOOEkTOs7vM2ZbV2c1hVGujngBMnRlD3zaqTJYPw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b96db5-fccc-4ea3-e576-08dca1c2a784
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 16:00:58.7804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWJmjkJiaU+ak1cJ5QBT/UBDhSARDowP98CwpdOzGNuFzWVYGgz+qsLSGmuZ4GT0H01Wo4DTaxSsb82CHoof5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7788
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

On Thu, Jul 11, 2024 at 02:01:00PM +0200, Christian König wrote:
> Am 10.07.24 um 20:19 schrieb Matthew Brost:
> > On Wed, Jul 10, 2024 at 02:42:58PM +0200, Christian König wrote:
> > > That is something drivers really shouldn't mess with.
> > > 
> > Thomas uses this in Xe to implement a shrinker [1]. Seems to need to
> > remain available for drivers.
> 
> No, that is exactly what I try to prevent with that.
> 
> This is an internally thing of TTM and drivers should never use it directly.
> 

Admittedly having fully gotten through Thomas's shrinker patches so I
can't reasonably defend how Thomas is using the LRU walker in the Xe
driver but I will say Thomas is generally correct wrt layering code.

I'd say since he for the next month, table this patch until he returns
and we can all discuss options.

Matt

> Regards,
> Christian.
> 
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/patch/602165/?series=131815&rev=6
> > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >   drivers/gpu/drm/ttm/ttm_bo.c      |  1 +
> > >   drivers/gpu/drm/ttm/ttm_bo_util.c |  2 +
> > >   drivers/gpu/drm/ttm/ttm_bo_util.h | 67 +++++++++++++++++++++++++++++++
> > >   include/drm/ttm/ttm_bo.h          | 35 ----------------
> > >   4 files changed, 70 insertions(+), 35 deletions(-)
> > >   create mode 100644 drivers/gpu/drm/ttm/ttm_bo_util.h
> > > 
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > > index 0131ec802066..41bee8696e69 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > @@ -45,6 +45,7 @@
> > >   #include <linux/dma-resv.h>
> > >   #include "ttm_module.h"
> > > +#include "ttm_bo_util.h"
> > >   static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
> > >   					struct ttm_placement *placement)
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > index 3c07f4712d5c..03e28e3d0d03 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > @@ -37,6 +37,8 @@
> > >   #include <drm/drm_cache.h>
> > > +#include "ttm_bo_util.h"
> > > +
> > >   struct ttm_transfer_obj {
> > >   	struct ttm_buffer_object base;
> > >   	struct ttm_buffer_object *bo;
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.h b/drivers/gpu/drm/ttm/ttm_bo_util.h
> > > new file mode 100644
> > > index 000000000000..c19b50809208
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.h
> > > @@ -0,0 +1,67 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> > > +/**************************************************************************
> > > + * Copyright 2024 Advanced Micro Devices, Inc.
> > > + *
> > > + * Permission is hereby granted, free of charge, to any person obtaining a
> > > + * copy of this software and associated documentation files (the "Software"),
> > > + * to deal in the Software without restriction, including without limitation
> > > + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > > + * and/or sell copies of the Software, and to permit persons to whom the
> > > + * Software is furnished to do so, subject to the following conditions:
> > > + *
> > > + * The above copyright notice and this permission notice shall be included in
> > > + * all copies or substantial portions of the Software.
> > > + *
> > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> > > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > > + * OTHER DEALINGS IN THE SOFTWARE.
> > > + *
> > > + **************************************************************************/
> > > +#ifndef _TTM_BO_UTIL_H_
> > > +#define _TTM_BO_UTIL_H_
> > > +
> > > +struct ww_acquire_ctx;
> > > +
> > > +struct ttm_buffer_object;
> > > +struct ttm_operation_ctx;
> > > +struct ttm_lru_walk;
> > > +
> > > +/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
> > > +struct ttm_lru_walk_ops {
> > > +	/**
> > > +	 * process_bo - Process this bo.
> > > +	 * @walk: struct ttm_lru_walk describing the walk.
> > > +	 * @bo: A locked and referenced buffer object.
> > > +	 *
> > > +	 * Return: Negative error code on error, User-defined positive value
> > > +	 * (typically, but not always, size of the processed bo) on success.
> > > +	 * On success, the returned values are summed by the walk and the
> > > +	 * walk exits when its target is met.
> > > +	 * 0 also indicates success, -EBUSY means this bo was skipped.
> > > +	 */
> > > +	s64 (*process_bo)(struct ttm_lru_walk *walk,
> > > +			  struct ttm_buffer_object *bo);
> > > +};
> > > +
> > > +/**
> > > + * struct ttm_lru_walk - Structure describing a LRU walk.
> > > + */
> > > +struct ttm_lru_walk {
> > > +	/** @ops: Pointer to the ops structure. */
> > > +	const struct ttm_lru_walk_ops *ops;
> > > +	/** @ctx: Pointer to the struct ttm_operation_ctx. */
> > > +	struct ttm_operation_ctx *ctx;
> > > +	/** @ticket: The struct ww_acquire_ctx if any. */
> > > +	struct ww_acquire_ctx *ticket;
> > > +	/** @tryock_only: Only use trylock for locking. */
> > > +	bool trylock_only;
> > > +};
> > > +
> > > +s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
> > > +			   struct ttm_resource_manager *man, s64 target);
> > > +
> > > +#endif
> > > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > > index d1a732d56259..5f7c967222a2 100644
> > > --- a/include/drm/ttm/ttm_bo.h
> > > +++ b/include/drm/ttm/ttm_bo.h
> > > @@ -194,41 +194,6 @@ struct ttm_operation_ctx {
> > >   	uint64_t bytes_moved;
> > >   };
> > > -struct ttm_lru_walk;
> > > -
> > > -/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
> > > -struct ttm_lru_walk_ops {
> > > -	/**
> > > -	 * process_bo - Process this bo.
> > > -	 * @walk: struct ttm_lru_walk describing the walk.
> > > -	 * @bo: A locked and referenced buffer object.
> > > -	 *
> > > -	 * Return: Negative error code on error, User-defined positive value
> > > -	 * (typically, but not always, size of the processed bo) on success.
> > > -	 * On success, the returned values are summed by the walk and the
> > > -	 * walk exits when its target is met.
> > > -	 * 0 also indicates success, -EBUSY means this bo was skipped.
> > > -	 */
> > > -	s64 (*process_bo)(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo);
> > > -};
> > > -
> > > -/**
> > > - * struct ttm_lru_walk - Structure describing a LRU walk.
> > > - */
> > > -struct ttm_lru_walk {
> > > -	/** @ops: Pointer to the ops structure. */
> > > -	const struct ttm_lru_walk_ops *ops;
> > > -	/** @ctx: Pointer to the struct ttm_operation_ctx. */
> > > -	struct ttm_operation_ctx *ctx;
> > > -	/** @ticket: The struct ww_acquire_ctx if any. */
> > > -	struct ww_acquire_ctx *ticket;
> > > -	/** @tryock_only: Only use trylock for locking. */
> > > -	bool trylock_only;
> > > -};
> > > -
> > > -s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
> > > -			   struct ttm_resource_manager *man, s64 target);
> > > -
> > >   /**
> > >    * ttm_bo_get - reference a struct ttm_buffer_object
> > >    *
> > > -- 
> > > 2.34.1
> > > 
> 
