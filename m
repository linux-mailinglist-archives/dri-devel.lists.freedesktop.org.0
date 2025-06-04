Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BE6ACE260
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 18:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C4210E762;
	Wed,  4 Jun 2025 16:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b0Yvpkl0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB9D10E762
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 16:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749055438; x=1780591438;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cA7KT+Ue7OBxEMDCxj2q02T7iPkdHm/j5m9Sbyq+7q4=;
 b=b0Yvpkl02bVc/Gl0OFkluqsStJF/5KpeBvEGaQ7iKdt0XN7yzD4IpTAv
 v2xYIsm12z4jTSCWkNb7fx0N8rpE2xetSZmLHkEief8btSpxVTuNneDSM
 kCaOY2PqoQEpodeNPx8P1Z/6Lizf8Eg3G8zXssKN34mRUO8JaELn3QXFe
 fyCF0ZJrS7dSDD2Yz40Bn4ernJGjIBZ2c4Z0EbfO/KAPuZUKwWkqFpagC
 c69qTaLHKZu3WDSzjdZAPf8hjRSPaFNAvMfoudbMo2VzZqiSlOJ45/8D+
 9hTSnJgzT2imTztaXgsPVoLU8YVXvegNjgjqIM8Qh5ZUuDCg79cAT53t8 Q==;
X-CSE-ConnectionGUID: hbT4SXFDSfiOn7ixFrNnYg==
X-CSE-MsgGUID: w+FwYJvPS22MF4H7HcGdLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="61769221"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="61769221"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 09:43:51 -0700
X-CSE-ConnectionGUID: cdSPxojrQMOoZ0r4FZmiWg==
X-CSE-MsgGUID: LyC7H82RTU2Ju/m7fX4K8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="176205759"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 09:43:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 09:43:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 09:43:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 09:43:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwCA9eXCRM9qhTPJ16zr9P/IvycnCWn8tb//+JoyH7w00fPH8Kep4IRWxF8g5iuLGfbJfdpxNigiCwhjMj5k9BbhtxQFonxTRSrWr/l3fzqh+5HnoHAfYD7MrZpRGtgdIiaedYB3WFXzll/1oht8moE7dZD1s1EmEbxdaxsznGw8uW9t66uQUFu87UjxfUFCvwdPf6DbRTXIkKpB1nYdJMt45iOaas3cM4jw7hJDYNQ1hnU2Wd2WiHidUtoZ0EfMQqoXKumiQFpyyHKl/bfgxOC4x7pRyzjbaB905OnxGCq63j6pHB8JNoKXfrpyzSAkTHyRHaBqFdNVR/tW+JKZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCLfVeNDCWU4jdng1w6nMkiPfAYyzkg/2DRxpnhQOc4=;
 b=pSffTo9a0+yT0ZpEL9aR8U3Ut03MHlZw7/L2x7BO+/YHFGCMc6cpLrGDUsxkAtrzk1/ZyeRNFGWltisMFNgk7m7V1jW0oqQa290xA9Q8rStMdJMC7BYeleB1mQBcfFfQwLVkgNhcmTmVn2JPfUgV5dHxnQ4S2iUlfvkHv4N/e9Q1H7zQEV0EKyNUWSpdP0gvZ+zpzEgawlimrbwhHDCLI3p/s1DVePHCMGzKAUXe32CLO45T+ocMg5ZBm4LT0eEbHfomJpKRsAz/d/vybv/erNJ8a7BsJdUwiPJVIYcHXQ4rZ+SYskXJ+EB9IKHN89Gz3eMm713xD85qyQwikBaxlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8326.namprd11.prod.outlook.com (2603:10b6:806:379::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 16:43:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Wed, 4 Jun 2025
 16:43:28 +0000
Date: Wed, 4 Jun 2025 09:45:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Philipp
 Stanner" <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/sched: Discourage usage of separate workqueues
Message-ID: <aEB4DFFE2C7gElRL@lstrano-desk.jf.intel.com>
References: <20250604081657.124453-2-phasta@kernel.org>
 <7a09c357-2d28-4dd6-b637-4387cc430938@amd.com>
 <aEBhIzccXBPyt_58@phenom.ffwll.local>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEBhIzccXBPyt_58@phenom.ffwll.local>
X-ClientProxiedBy: BYAPR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::44) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 34b9202d-44a4-4a04-be40-08dda386ee87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?aXByBqqyISLcGrGetO2QKjf+Bs0zv7YkBBQgADxDiqDj34FsINCuhGe1R1?=
 =?iso-8859-1?Q?Yi/coLanqtvvFMsI1wpYNvZ1YXlrnKBxI8onmnFrpZAR1FGTqlW9gauUlX?=
 =?iso-8859-1?Q?zIFT+LfRzIdRTiEGdrg4tWR7br98KylW5fozuEgSaD1/vQKwsXo7MG1b35?=
 =?iso-8859-1?Q?WSFNt0zviotVmL0aUjU6790ZQ1U+Gb9T4Iw7KNjTvkR7D0e9FAhP3xSIKZ?=
 =?iso-8859-1?Q?Kec95tWq1yGtsa9fsDkPbzmwEVsVTiltOC2zNKucgLPUbrZWJk8qsUZ0K2?=
 =?iso-8859-1?Q?7zeZvma1i3uYUlqCVqovLPeuFvnmccwdF5Z5Y+2tnzLOR8D8VpjWuSF7tu?=
 =?iso-8859-1?Q?P6/5JIlSwQVEpPRXCJfN8zfqKPX6bL5n7AS2o+IKd4zqGZd0/ANt96kt52?=
 =?iso-8859-1?Q?/hbJNWfjNCjyocM5kpXeYRAtS+xdKebS2p+taTowINLU8AFSWq4doY3LLA?=
 =?iso-8859-1?Q?vJb/nPEsKGe1D/VSx8rzUAIFrEXDAaFnp10W/AVmXOtRtxEglJrHft46lC?=
 =?iso-8859-1?Q?cYxgSJDYvVmAANsZAmkPVmlC+btUINmF9XrL6xQs5OOQKMfHlhIv5HLPye?=
 =?iso-8859-1?Q?KsRUN+7gSHTwAeB8x9Ua6ijt1BvCBdSgzIZr+IlmiHOlL20R5l8keJD4hX?=
 =?iso-8859-1?Q?+X1i+sx51Ot6Y71VoKWgtUCHGDlWhGATVp/8rkdSdaeYs1/52Thk+n7yjP?=
 =?iso-8859-1?Q?xUPjLTSbQIlQYVB9AldLtGcyDbeIoUXVIx+VlabAm9bxWeqpynpauC6LXt?=
 =?iso-8859-1?Q?/MEXrVXCEyLpcCVotLvPxx83i658+RB1peO41tJuSF8Ku+hjP8G+RdqZZQ?=
 =?iso-8859-1?Q?BqLLMYYA0lIpwZOlSEpsqUM85R0Vc3+hd/g7ekGZuiAdz6iLxECe5MBIwj?=
 =?iso-8859-1?Q?jjWo8mZ3HY+ynwrzEIIDVdE/J24UM9+IilZTi2k38zWhZmuPi1ww7K1q9A?=
 =?iso-8859-1?Q?5GrB0UxVxTzXGuigV+3Rf1d6YKNpObw7L1Q+g22WX1kv2odJzCqJ3qAdC7?=
 =?iso-8859-1?Q?CryC2I5cEhrHJMx5YiH46QXpnEKYX2xEZIBXlZoy9xJ43/Oj/4QOFBf+Zp?=
 =?iso-8859-1?Q?PiYGjL3xaT2RpsAj2RfBoNd2vpUVrSHdsCftsuPbjslDsV4sgxWDueFz3t?=
 =?iso-8859-1?Q?3fizZcwTS2Hws5dBJxfyjVGyM4kXpjd7mkYL/Q9fhp9Hhg3X2UindeR5ix?=
 =?iso-8859-1?Q?PvDRH60zZvwPipqTLwL3Atm9rSqFoK87BRgJFo7niwPMkBQYgRjzo21RBr?=
 =?iso-8859-1?Q?I+PMnRTP8Yr9zoL+dJmvknSTrinTu3cP9OFAt72khQKng4gEuaL5Q9Mc7z?=
 =?iso-8859-1?Q?FTgs7fkYbwFwiZczJjJtQgipyBjTt2y3/2X+JF1FvNmQt2vVT7IqvB59cM?=
 =?iso-8859-1?Q?3On/1fVTx0gXbv6EZhk4a7Qra7/9d+wm9lrhWIgVHHx8UI6f+191E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bGQFW+0RfVyLnrVmI9nwvlcFL3MJYp7zzrNkkQRHj4JqX42+qtWQi8L52F?=
 =?iso-8859-1?Q?dRjXE5Tsmitd8c7JT1YVnsW9jOrBMHQdDfB64zx/7UcrdGGrBpY2wclmQM?=
 =?iso-8859-1?Q?QTiMThUL/M06cH0SsD7cmTnMzAIco8qao6+dawPPEiYrlc8nV4mcYtNnJI?=
 =?iso-8859-1?Q?KG7d/JtDfaGpmMqQdOPryZ7peFK/S7vYHvt2x9lHR8iTvVNGM92hH8NKo7?=
 =?iso-8859-1?Q?8oVutpxr3f1N6us0VJ0TIziDUY7gizZqCcf574ahfILq4atOSw9dZyq+v/?=
 =?iso-8859-1?Q?kyrT36SdTARXTJY8qLanQsTbtLYMIzVoR6NyT01qdupBumDM/s8MOsPtbI?=
 =?iso-8859-1?Q?0DF6t+44+V2g+hgYTqFnO9+ZrAsTnPqo+MqfCaSm7EcDzLYEFUdPN/+192?=
 =?iso-8859-1?Q?FZntkZlP5/T65yVU9u77rAIwgsz41zG/ktgTlEedK5jNfhvfMv+xN5kH2W?=
 =?iso-8859-1?Q?9E4qe5Fi5Y26Zk1OM61sCvgUDzIgXEvvERTKTF3JmREyiRdGcTlF8WIFnf?=
 =?iso-8859-1?Q?vzMc/ybxyS0V/ecNZlpSvSesN630ieV/wzli/Xdt+EkHYCpH1+t6eZIQq2?=
 =?iso-8859-1?Q?SyaOtuDkLRSqPWCr4l3KylVPCauYfxG5og7IQ8opKikRpoIEsvY7xBlh8O?=
 =?iso-8859-1?Q?8umjWVf2iKD79q44OChC2A4ht5w6CVKwpaj3V/IrenpfbaUj2KDCbybd3s?=
 =?iso-8859-1?Q?35PQzJTgbInMLGR+BmpZHXwB8OL/enzL3MHq3TLvaE8hK7Lct3zU+j5tm3?=
 =?iso-8859-1?Q?E8VkKiBMCbK6fu0t3P9v2+nG0WiUAZeuG35zfHoJ/ZKkxMJH9CdrpHQoU+?=
 =?iso-8859-1?Q?lLvAxTU4ly723w5nBAEL/UrQQ+U21WRW9bDtz11AaanHbcproeo+xDnWIF?=
 =?iso-8859-1?Q?3kzBjY57wQI4fjOzDoiwiL5ApnlY73g1Ce0cgRnPAGFnvGaqVKQbJhS3N3?=
 =?iso-8859-1?Q?Ta2zkqkhCJWLVm5DJecybwFM0YkdwgBaxUcxXvXTFC68KIpNKvwaUA3k2a?=
 =?iso-8859-1?Q?8EHIj/61VWDcB/glN9vrpVJ6KDcUgZH52L895FXYY4YykNj6liPWPbsRdt?=
 =?iso-8859-1?Q?CJA2iKF7MZYtsRzHuUkBv9Xyko5+SyVpPXIYmv+ePnSkL8uY08BLPFcETc?=
 =?iso-8859-1?Q?JbmtnYHwHutmVDqdMzaWgQoULVPng+czTcB5TE8iUrpULyRtk591xz0DHC?=
 =?iso-8859-1?Q?vhJyUC90LLMSJGUdOa6n9enEnvni+iORQo49eWyXtk1MJEYKgwRVyQcEfO?=
 =?iso-8859-1?Q?XRGMCAgspEgnlBPRcOt7Y3y9IwxYdIndDoUEhmap2aClpHcUtxyNw9siu3?=
 =?iso-8859-1?Q?Dm3D3gbaBJGpNEXIQDo/WdUlvPiDdd4XBv/7iL1x9+PktkVzOE/uCMw7XI?=
 =?iso-8859-1?Q?0JqY4djI5TPGovG+CO/qI13g6Q0RFwoBTD4M8lncl7YWLDCXw5DxtN1CIx?=
 =?iso-8859-1?Q?V3y7z8FpwSXDBjY1IYnKl+B7ns+g5HYFi+SvYRvXzt/mxL3ND6lUgAkoiu?=
 =?iso-8859-1?Q?EFR+Oxvx82tfJOvVyb/B/43zOPTGXykz7xa39dPdYmKhjE1kKpSiYZwcPh?=
 =?iso-8859-1?Q?cglzFXr/KyzOoV573pPC9eNoIexR7W1vkv0JAldVOaIDePtg8GZ9BEjWWO?=
 =?iso-8859-1?Q?ayRGbLDHssTqKJ3+PvrVo/cv6Jvbrsx5s0CwXypqyz8wnN7QBJoMBhRA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b9202d-44a4-4a04-be40-08dda386ee87
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 16:43:28.2380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q829CvP3XxxgW1a5ZwvIEkbpgwziS67nt81AHFR7QkxuPV5gwnLpRVdxE3AHAR6NzBzKrS0vNkhn29jMQFCOZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8326
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

On Wed, Jun 04, 2025 at 05:07:15PM +0200, Simona Vetter wrote:
> On Wed, Jun 04, 2025 at 11:41:25AM +0200, Christian König wrote:
> > On 6/4/25 10:16, Philipp Stanner wrote:
> > > struct drm_sched_init_args provides the possibility of letting the
> > > scheduler use user-controlled workqueues, instead of the scheduler
> > > creating its own workqueues. It's currently not documented who would
> > > want to use that.
> > > 
> > > Not sharing the submit_wq between driver and scheduler has the advantage
> > > of no negative intereference between them being able to occur (e.g.,
> > > MMU notifier callbacks waiting for fences to get signaled). A separate
> > > timeout_wq should rarely be necessary, since using the system_wq could,
> > > in the worst case, delay a timeout.
> > > 
> > > Discourage the usage of own workqueues in the documentation.
> > > 
> > > Suggested-by: Danilo Krummrich <dakr@kernel.org>
> > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > ---
> > >  include/drm/gpu_scheduler.h | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > index 81dcbfc8c223..11740d745223 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -590,14 +590,17 @@ struct drm_gpu_scheduler {
> > >   *
> > >   * @ops: backend operations provided by the driver
> > >   * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
> > > - *	       allocated and used.
> > > + *	       allocated and used. It is recommended to pass NULL unless there
> > > + *	       is a good reason not to.
> > 
> > Yeah, that's probably a good idea. I'm not sure why xe and nouveau actually wanted that.

At one point before workqueues could share a lockdep map we had to pass
in a workqueue to not run out of lockdep keys. That restriction is now
gone, so Xe passes in NULL.

Part of reasoning also was there was an interface to pass in the TDR
workqueue, so added one for the submit workqueue.

Xe does have an upcoming use for this though. We have a mode where
multiple queues share FW resources so interaction with the FW between
multiple queues needs to exclusive so we use a single submit workqueue
for queues sharing FW resources to avoid using locks in scheduler ops.

queues == GPU scheduler / entry in this context.

> 
> The idea of this trick is that you have a fw scheduler which only has one
> queue, and a bunch of other things in your driver that also need to be
> stuffed into this fw queue (or handled by talking with the fw through
> these ringbuffers).
> 
> If you use one single-threaded wq for everything then you don't need
> additional locking anymore, and a lot of things become easier.
> 

Yes, this how Xe avoid locks in all scheduler ops. Same in upcoming use
case above - multiple queues uses the same single-threaded wq.

> We should definitely document this trick better though, I didn't find any
> place where that was documented.
> 

This is a good idea.

> Maybe a new overview section about "how to concurrency with drm/sched"?
> That's also a good place to better highlight the existing documentation
> for the 2nd part here.
> 
> > >   * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORITY_COUNT,
> > >   *	     as there's usually one run-queue per priority, but may be less.
> > >   * @credit_limit: the number of credits this scheduler can hold from all jobs
> > >   * @hang_limit: number of times to allow a job to hang before dropping it.
> > >   *		This mechanism is DEPRECATED. Set it to 0.
> > >   * @timeout: timeout value in jiffies for submitted jobs.
> > > - * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is used.
> > > + * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
> > > + *		used. It is recommended to pass NULL unless there is a good
> > > + *		reason not to.
> > 
> > Well, that's a rather bad idea.
> >

Yea, I've found using system workqueues in driver code usually creates
problems. In Xe, we pass in a single ordered workqueue shared among all
queues for the TDR. GT (device) resets are also run on this ordered
workqueue too to avoid jobs timing out in parallel. I think most drivers
would benefit from this type of design.

Matt
 
> > Using a the same single threaded work queue for the timeout of multiple
> > schedulers instances has the major advantage of being able to handle
> > their occurrence sequentially.
> > 
> > In other words multiple schedulers post their timeout work items on the
> > same queue, the first one to run resets the specific HW block in
> > question and cancels all timeouts and work items from other schedulers
> > which use the same HW block.
> > 
> > It was Sima, I and a few other people who came up with this approach
> > because both amdgpu and IIRC panthor implemented that in their own
> > specific way, and as usual got it wrong.
> > 
> > If I'm not completely mistaken this approach is now used by amdgpu,
> > panthor, xe and imagination and has proven to be rather flexible and
> > reliable. It just looks like we never documented that you should do it
> > this way.
> 
> It is documented, just not here. See the note in
> drm_sched_backend_ops.timedout_job at the very bottom.
> 
> We should definitely have a lot more cross-links between the various
> pieces of this puzzle though, that's for sure :-)
> 
> Cheers, Sima
> 
> > 
> > Regards,
> > Christian.
> > 
> > >   * @score: score atomic shared with other schedulers. May be NULL.
> > >   * @name: name (typically the driver's name). Used for debugging
> > >   * @dev: associated device. Used for debugging
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
