Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C06A926781
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 19:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8133F10E9A0;
	Wed,  3 Jul 2024 17:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hv+ShXte";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F28210E99E;
 Wed,  3 Jul 2024 17:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720029489; x=1751565489;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wRpkbrhLkG8g3nZqtc0k5j0VlfA32MmVIAP/MUctOoU=;
 b=Hv+ShXteFDQowUNUSuG//geKoTTGg6o7wt2FU/ITQgqP5hgFMemmGTfG
 VZ1PsTRMhzKs8IAxN6kGyi7mn/EXVruGrfv33w/GiMtuuXfPY1lh+GHqa
 lPvATD4/EyWDynjbmrG3Nu/B4Hy4qkxuRN2tUm34rs3U9brP5bMdgWpgv
 s6efiYzDjmRc2zGBi8W49ydZAmztpQPPGtylTouUzqiOv8JJA54aiOUsc
 iWmqPXrc46axlsjYsiUK0MO/kxplzgTo+PFlsDAL2CeBOSM7PznemoJwT
 IykVxz+qGFZEnVY8Sl0dbaklPXlEblHhtDVCPxlLZlc+HMMHEnmEjzBS+ Q==;
X-CSE-ConnectionGUID: wIsV3ubbRuC6drYFoaDfkA==
X-CSE-MsgGUID: ind5mhjUTEiHba5S1Z6O1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="39794038"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="39794038"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 10:54:22 -0700
X-CSE-ConnectionGUID: AedqJtQXSYOHrVHqHr8Qeg==
X-CSE-MsgGUID: i9Kz49u6SXWXxGkd+1j9/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46277064"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 10:54:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 10:54:21 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 10:54:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 10:54:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 10:54:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBXVgyl3kH1LcWihv0VQZ0SVi+WePF1SySlSnul7fVolSUZEnUF0bc2QoU6YR9ED+IWfA1zIr54BSanLkcEiOikWmA6vnUZqA8fJS8bl3C+w5x90cq7+Nkp+KGNxj5bhyiXYP/ROiuSe2NDD3U6Qf8TD1nQ6spbB29FUVCEmNPwVnr+UdBZCota8JJy70P5AEkgxjniSwiNx+79lrAp0UOjWEzXjBy03jKbblyvswadzYRtYDovUM0rz8lM4RtcDIihYkF7du2I92FRaI9vDoJrvT04ZgO45+VWue9Pbj/Vr2RGhPC7AFqYJDUSg9ZxmoFtR5Z9NbQulHCB2Uqs//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpgBLLSYRHkeE7YdnN4azeg6SZBm//hg1FQs3UWVki0=;
 b=Xrkb1OiMtHzhI2zwpTQ/CMjqILq6AWhz+J5pdtu8u7gcscyfGFAoiQ/ODgwIkztD4sBkTMWbqwrsicMT88hfhVYWCOQWtVvJtkiEFzX/aaA9IlFW1KW11CoGSYPW61kOik9tYkaVl4xSLi8CrWw+ooDdBaZ+VnrINlMFbRcG86g564GPav4lIQVEFt0rI4/nHzV63Vx5PB/ScDLnuREg8Iu0XxzF8FozAwYaunbr5qshDDe0mCC7TS/zqQEYfMHyMbpshfRJIG1fBiOcuJ9uUsSgrGjRrS1eOVU5vL2QoRyNsbM0uCzBOsGAjK0OCWBu8wf3PvuYQ5EmDA23jemLgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SN7PR11MB7139.namprd11.prod.outlook.com (2603:10b6:806:2a2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Wed, 3 Jul
 2024 17:54:16 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 17:54:16 +0000
Date: Wed, 3 Jul 2024 17:53:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 04/12] drm/ttm, drm/amdgpu, drm/xe: Consider hitch
 moves within bulk sublist moves
Message-ID: <ZoWQHW9i9p9pTR7w@DUT025-TGLU.fm.intel.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240703153813.182001-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::23) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SN7PR11MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a3440a-2f93-417e-7426-08dc9b8927c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?gjkweD3fYbhpHQhj8xEVwycITlD+XBTYZZHxt3/5z7Lm1tVinGpKB+YSkV?=
 =?iso-8859-1?Q?TVr8XVWw5fikP6jAdtnpk2hl/vCx54dgNG5f1DfgDoggQ7joYDJmGNWyU9?=
 =?iso-8859-1?Q?phqLf0j5gBsxjxCXozyEaR+jyLxWrVADKd9yHEoBKj4j1xywmdqltKF7OO?=
 =?iso-8859-1?Q?ntigGA6G+J5VQ6CgsP1qqNzf6UpRsKXCmJ1EiDwLXkef/SQ+ZruUEXeX/0?=
 =?iso-8859-1?Q?98k3/MjN5tkIST+Bb3tJM76fmkBfYtWuJuOW8NnEsvByBZh0LAw0FamsGR?=
 =?iso-8859-1?Q?GPMdBwC+goe/ZSgs4DcSyBOc6jBsDPNLb57MG5lSpz4NLC25QQZy+Mh9bb?=
 =?iso-8859-1?Q?eS+kf5VlDrh85D3qaYaCkhYa5OEMdVuTLUWoJnRscjbDZB+O2ZhQ2cm4dn?=
 =?iso-8859-1?Q?m4bH09ALSnENG2XSAozZXeLzxfMe5FLcTREuK7Oss1wBwyK4CchlXjoFC2?=
 =?iso-8859-1?Q?zxNt1hN3bZi2iHW4Ap5sORAnczsThqwMaMc4FOreeO9yj55KvVFshM9apC?=
 =?iso-8859-1?Q?v4jSfVLJHLxXxw3eIyJYGTSvnq7ZktNHATTDsah4Q+5sB9bufS6ilzU6HH?=
 =?iso-8859-1?Q?g737NUZKyBIkITep12wUk0urhWlJ0bt8hyT4BKeHSvXhQFtPB4/sZ9SFmu?=
 =?iso-8859-1?Q?P4nBtN+ddgx50Lm4u7p6rWQTcp3R2X6eEvhxeTZRyAPOJOQDWyJqz5xHG9?=
 =?iso-8859-1?Q?B0I1rBB3RoPEXwVxUsZvzrQOHBme8OiqY9p1UUoyyZh1hfC3QsNHdxRTAG?=
 =?iso-8859-1?Q?UmOKTqxCull08CNJXEmBpK3aUsXbRvgJWMJzRQtjBsOO31ourkolSHPfD/?=
 =?iso-8859-1?Q?mCrbKG5NRdyTZtVHZm7kXf3BzV6rCu1qXLEgbcLDwWKg4vmMgSozbXOVFc?=
 =?iso-8859-1?Q?FDE1hlwKRkGd2+nhXQkdyBmQsNgW0MHKvppx6q4DV/7F4DwadXA8jFjnQK?=
 =?iso-8859-1?Q?RG4Pw/ZWueZQHDI/Pr0PG1S8hJp5YOrGgkBD1G0wAx+lvUvlvqIGmQEJda?=
 =?iso-8859-1?Q?7QuCAI3rAmbhoaqsFeD2zI4ydw9zkIHH4Laz0Eb7DaO+IaKRzz9iaVxkSR?=
 =?iso-8859-1?Q?6UAVtb33lgTIoeAdBr1D4oVlBtcWNF8MvzAtLmqRj3LatHO21vlFcOiewV?=
 =?iso-8859-1?Q?eRr7BzHR6yy4wW0rPSLHFxevBBgNnM4vjzhJfQNsGebZ0549zsafFD3pqZ?=
 =?iso-8859-1?Q?81ZtN50Gtrz/NsaCaIk3N0e1YguFn51pNwXlgAT6X4IXS0sdGxKL60iYMz?=
 =?iso-8859-1?Q?Os8LAaUMy3fNlEHPXWHhSHXug78xD7tQ1plhTl8EpP9TRWniKWQrTZKgmD?=
 =?iso-8859-1?Q?nKbzefi/JStetiKPqlSKhG1CO6CfkG/WjPssv0I4GgE9w6eXtyH+V1670Q?=
 =?iso-8859-1?Q?oYAIckBAlSuCNACMoR2eMEODzbGH4xzQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RNo8U5Rfn2q1OSToMONsWt33kj4Azd5fM910/4o2YkT0+wfNsI61ra/94c?=
 =?iso-8859-1?Q?nHLASvVApqjc7wZoJ+xPtOkn95Q0kW5CHbeD9w4FzmYekzy8AyQeYb6vCd?=
 =?iso-8859-1?Q?ZFmLgM067Z9HXOt7kLZ+oeJmSxgfweXdBmfCw7YwOhcki8Wt9YjS2f5hoR?=
 =?iso-8859-1?Q?NPJ+SlOucT5uqBMwh1fxxirqKs6XPGtPRex8HXRZgumOnUEmngr3uO5RPu?=
 =?iso-8859-1?Q?XKyrxbuMRznisqvEGSX52hUhRV2x8o8wptUdy16P1tdeP18/Gk26VINtTw?=
 =?iso-8859-1?Q?AzXFQVFt30y2f8y9lVeHnoN8lNIb5/Yik/KYy9EdlPGU/Y+Mv4X6Lxsl6q?=
 =?iso-8859-1?Q?ZNHHaBl7hDEjISzmuwdoETs/E7xMaQcvf21PGI4qNYYWiEQXw9T+HbMO5x?=
 =?iso-8859-1?Q?YMVwIWdHUMGGAYSnkXYWHMb/BD+8latFepohrL8n8/9UqZW5+kcl4PHkzQ?=
 =?iso-8859-1?Q?O6lKMCAVpaJ6cEde9FrptwsGslzmvnor3HppovaaFQSdfXxjM1HwPLegdE?=
 =?iso-8859-1?Q?yvuvlB1RtsKwzf12hUN+8E7NjK+oyqKsy9ReVMTqkJMRuMsbxWnXPVZ3Ek?=
 =?iso-8859-1?Q?USA00dXD4XNN3b2t7znxTO6Xt/K6mn1SmBW1P3MYdCE1C+HuevJKGAC4e8?=
 =?iso-8859-1?Q?iIjWv2SNVCVS7Gjy03OuycAbSeUvEIb3LE627iQaLgfopTUnHBtRIV60bB?=
 =?iso-8859-1?Q?k0jqdB9JRltAdQeLdxeNkny42xMFfM+mMo/xLVI2mw0S1Agh7w4aE0TBu3?=
 =?iso-8859-1?Q?84VGAoa3kOIQ2YhVXqyMhdPsV1OnLOD5hp1z0FmWPdYskKJO0S0pP/mJd/?=
 =?iso-8859-1?Q?aOQXivi71+pBjndE2EvU4VsozLEO3w5DhaomEMj/eQwZjP/uRxExyhNQLw?=
 =?iso-8859-1?Q?QwN2tiyPX1Slpc1srImaNHxLJ1skDa9v+ikP4GmEZeHxiXuv6JQGCUoiBI?=
 =?iso-8859-1?Q?sIlZM+PmHkLO/t/OaJjnk53X5DOPQhTamd3Av3SrcUhF+3yWiYLMSJrCAi?=
 =?iso-8859-1?Q?90y12wxiaE4D4FyX6Iiha6FAbPnz8kg9kt9MYXHVRNEHHtip+PiNpiZi8p?=
 =?iso-8859-1?Q?IVETlaHGWs9Gp5Vx0Pad97Lc/q1GgpUbGycgGBqi8p9hGKH98XO9XOpBWZ?=
 =?iso-8859-1?Q?lFKHL2+simLqxWa6jh8zkJrrFLehlfF8ql614xYX2BQebJL8n8v7XsAlT9?=
 =?iso-8859-1?Q?+/WpFqRbRdiSk8C6wbPZLrD69yMbCoaYbB2dV9P14sMonMHVWKZOWaRklm?=
 =?iso-8859-1?Q?nDBgkLE4uCllhPkD0KlxLIJnKsAETUJgeNizy0mKtaFX5Y57eTm4eR+1aI?=
 =?iso-8859-1?Q?a7yqjs8eCQ/EuhXwZKKoFoaeW8WEC9vHTcK9jq2Y9YiHBpihqlSopz+sud?=
 =?iso-8859-1?Q?Yoey0StiwyX8IUw+nbRcX89x9GURA1ctaMFgWwUXpbFqQC2OKxu9Omb/uA?=
 =?iso-8859-1?Q?bBcn3yj4CXW45SdlIgjkQCE0TfguaE7jJ/BEuRvpt5uU4z2sM9qM04HnX0?=
 =?iso-8859-1?Q?KpO/liNeS9DxhO/UMho44Ygzm4WCKs4qnb7vK7ZqgPLsT4L0QJyQnLQ4Ko?=
 =?iso-8859-1?Q?j/i2EP2fQJ+U624ZQnNoyh4PdJ2YNGE/RRkO0RGcC7Kmq1PHM3Gz5pRPQf?=
 =?iso-8859-1?Q?DewvknGtsqKYug4R3CmRjU42apqkgddyM1vFeOI59uG+Gy6jxz50wR9g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a3440a-2f93-417e-7426-08dc9b8927c5
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 17:54:16.1930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: du+3F+al4+uj+liYEiJB6b5IO5Ps21aaryAXocnmZVlFjfBHZ99RMonB30GqkPqo8LZyyjxg60kO6LNVcYwMfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7139
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

On Wed, Jul 03, 2024 at 05:38:05PM +0200, Thomas Hellström wrote:
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
> v3:
> - Remove leftover mem_type member from change in v2.
> v6:
> - Add some lockdep asserts (Matthew Brost)
> - Avoid NULL pointer dereference (Matthew Brost)
> - No need to check bo->resource before dereferencing
>   bo->bulk_move (Matthew Brost)
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  4 ++
>  drivers/gpu/drm/ttm/ttm_resource.c     | 92 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.c             |  4 ++
>  include/drm/ttm/ttm_resource.h         | 56 ++++++++++------
>  4 files changed, 135 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 3abfa66d72a2..97743993d711 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2420,6 +2420,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  	if (r)
>  		return r;
>  
> +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> +
>  	vm->is_compute_context = false;
>  
>  	vm->use_cpu_for_update = !!(adev->vm_manager.vm_update_mode &
> @@ -2484,6 +2486,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  error_free_delayed:
>  	dma_fence_put(vm->last_tlb_flush);
>  	dma_fence_put(vm->last_unlocked);
> +	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm->lru_bulk_move);
>  	amdgpu_vm_fini_entities(vm);
>  
>  	return r;
> @@ -2640,6 +2643,7 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>  		}
>  	}
>  
> +	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm->lru_bulk_move);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 9c8b6499edfb..b6a2daac5518 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -33,6 +33,53 @@
>  
>  #include <drm/drm_util.h>
>  
> +/* Detach the cursor from the bulk move list*/
> +static void
> +ttm_resource_cursor_clear_bulk(struct ttm_resource_cursor *cursor)
> +{
> +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> +
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
> +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> +
> +	if (WARN_ON_ONCE(bulk != cursor->bulk)) {
> +		list_del_init(&cursor->bulk_link);
> +		return;
> +	}
> +
> +	pos = &bulk->pos[cursor->mem_type][cursor->priority];
> +	if (pos->last)
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
> +}
> +
>  /**
>   * ttm_resource_cursor_fini_locked() - Finalize the LRU list cursor usage
>   * @cursor: The struct ttm_resource_cursor to finalize.
> @@ -45,6 +92,7 @@ void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor)
>  {
>  	lockdep_assert_held(&cursor->man->bdev->lru_lock);
>  	list_del_init(&cursor->hitch.link);
> +	ttm_resource_cursor_clear_bulk(cursor);
>  }
>  
>  /**
> @@ -73,9 +121,27 @@ void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
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
> @@ -88,6 +154,7 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
>  {
>  	unsigned i, j;
>  
> +	ttm_bulk_move_adjust_cursors(bulk);
>  	for (i = 0; i < TTM_NUM_MEM_TYPES; ++i) {
>  		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
>  			struct ttm_lru_bulk_move_pos *pos = &bulk->pos[i][j];
> @@ -515,6 +582,28 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
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
> +	bulk = bo->bulk_move;
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
> @@ -535,6 +624,7 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
>  	cursor->priority = 0;
>  	cursor->man = man;
>  	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> +	INIT_LIST_HEAD(&cursor->bulk_link);
>  	list_add(&cursor->hitch.link, &man->lru[cursor->priority]);
>  
>  	return ttm_resource_manager_next(cursor);
> @@ -559,6 +649,7 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>  		lru = &cursor->hitch;
>  		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
>  			if (ttm_lru_item_is_res(lru)) {
> +				ttm_resource_cursor_check_bulk(cursor, lru);
>  				list_move(&cursor->hitch.link, &lru->link);
>  				return ttm_lru_item_to_res(lru);
>  			}
> @@ -568,6 +659,7 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>  			break;
>  
>  		list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
> +		ttm_resource_cursor_clear_bulk(cursor);
>  	}
>  
>  	ttm_resource_cursor_fini_locked(cursor);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5b166fa03684..0c7e327bc9a2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1335,6 +1335,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  
>  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
>  
> +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> +
>  	INIT_LIST_HEAD(&vm->preempt.exec_queues);
>  	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
>  
> @@ -1458,6 +1460,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	mutex_destroy(&vm->snap_mutex);
>  	for_each_tile(tile, xe, id)
>  		xe_range_fence_tree_fini(&vm->rftree[id]);
> +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
>  	kfree(vm);
>  	if (flags & XE_VM_FLAG_LR_MODE)
>  		xe_pm_runtime_put(xe);
> @@ -1601,6 +1604,7 @@ static void vm_destroy_work_func(struct work_struct *w)
>  		XE_WARN_ON(vm->pt_root[id]);
>  
>  	trace_xe_vm_free(vm);
> +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
>  	kfree(vm);
>  }
>  
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 8fac781f641e..571abb4861a6 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -269,26 +269,6 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
>  	return container_of(item, struct ttm_resource, lru);
>  }
>  
> -/**
> - * struct ttm_resource_cursor
> - *
> - * @man: The resource manager currently being iterated over.
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
> @@ -304,8 +284,9 @@ struct ttm_lru_bulk_move_pos {
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
> @@ -315,8 +296,39 @@ struct ttm_lru_bulk_move_pos {
>   */
>  struct ttm_lru_bulk_move {
>  	struct ttm_lru_bulk_move_pos pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];
> +	struct list_head cursor_list;
>  };
>  
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
> +};
> +
> +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
> +
> +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
> +
>  /**
>   * struct ttm_kmap_iter_iomap - Specialization for a struct io_mapping +
>   * struct sg_table backed struct ttm_resource.
> @@ -405,6 +417,8 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
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
