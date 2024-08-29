Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800B59652D5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 00:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA51A10E759;
	Thu, 29 Aug 2024 22:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ULD56S5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB9610E717;
 Thu, 29 Aug 2024 22:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724970307; x=1756506307;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5c76SXNiIZDyiaKqY91sPAhlePX0M2tmCdVN0hkJwGY=;
 b=ULD56S5AWhQAq9P5wmyLCTz+3MgG98z2bS4E0HoA/UhenvzNP9X+uOVR
 Y9n1AWUqYrWLNyNg0xJ79V0UDxnvcz/Hq5Ac5nADfd0yQ2H9wgDEnbqul
 mJJbsRTDr4VMtSK7qUn7uFHRCgtLOAu/bDc041nUXa9riqyAVQn/KVPaA
 bdZsDZSyge0+bA2wNRw43/YizB++O3z+VmM9LNswSMPJ+Nwpf9PwVNogp
 OmHtk9/wIyukYYo72fWPEm1qgmus+3zqsUg7YfF7SgUggPyI7rwuEPoK8
 cxlN5OmNnjiSVK3p2Sxj1NN+qHXSzh3mQy5zMrdfiCJCr8KhkBZXAeWuS g==;
X-CSE-ConnectionGUID: FloJkkYfSQCvYZYUJJwP5A==
X-CSE-MsgGUID: b2Hmu5rrQnu7N44aSPUkSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34216066"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="34216066"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 15:25:06 -0700
X-CSE-ConnectionGUID: uxuq8M8zRNaG3CDqz5iU4Q==
X-CSE-MsgGUID: SYsWjWxUSJewodtmW5C7CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="94456351"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 15:25:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 15:25:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 15:25:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 15:25:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 15:25:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzMoEwtoed4lOL/zoecrrYwR4TZ03pKlAeQIVG2z1ytB2HzmcQJ0MJcGsgWHT1tSTUsrTY6WfAkhgwopOY1jUoMt326xz/Q7JvMfWNZsYSzevorWs3VIfgrT8pIqBhqOcEdeJrRBOC4lmTyRtX2OGfWB6j/WXRFfkpGW8azNmyE4EjOSC3HQ4s2f1DdtXbrnq9XVdad071CZuQ5GTGMH+trH12q7Ht5xTCYDyWi9CB7eaNqjq5L8bSYQn5/nVrsgRnO4P4BMPoyYO6gRZ2pb8EgHiJS8HeZpg6XzbfAGJjdcE31ZEN8oVLS+Y1bP80l58AWQ4aZXr9ZRaAcy4BJ54Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yV5bcaGVDLcNz4FG/nlsD6BoqAV9X3WtqtAq+OqoxY8=;
 b=Yd//4s+DGOe4AMDpIW7JY0PSyDnbOJgRKOpLqbWM01YDkrZ7zSsX1uNb6T1iZc1brDCvc0lcz7pqLWFZ7Ei5quzby5WqepVu3CRGXb95ZMxqDGtMGTo6VMxMb0eAFlb6gMY9PfOX3XlLkhxrFev8ayB5dRjksfu09VNMnvucmmCl3sjwMfxCHzdKrsKxA4QyyxcYwdNsOgbfIBYBt0IXZQq0+h4K7Rt9R6ISLEy7c4vBBlKLsXFDWdJe2+y1XoQp8OxG/JJnN4UcADrruJ7oA6bewzCpn8uykKOvOyxKoGsMT8Q4VAikFkWXqI3YVM0MA0RfWTllgY9F34IFIU1Dtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 22:25:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Thu, 29 Aug 2024
 22:25:01 +0000
Date: Thu, 29 Aug 2024 22:23:34 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <matthew.auld@intel.com>, <daniel@ffwll.ch>, "Paneer
 Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
Subject: Re: [RFC PATCH 23/28] drm/xe: Add SVM VRAM migration
Message-ID: <ZtD05qp31PBlEwg/@DUT025-TGLU.fm.intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-24-matthew.brost@intel.com>
 <Zs9LF-jnNrd9ZlxW@phenom.ffwll.local>
 <cbe8aebe-fcad-4ff0-8f56-146628183fd3@amd.com>
 <368ee71bd5e39d4e26947de9cc417f4abe8d1f3b.camel@linux.intel.com>
 <ZtBVXjNf1xAQOHHR@phenom.ffwll.local>
 <ZtDyZceN6asCzSHT@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtDyZceN6asCzSHT@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR08CA0071.namprd08.prod.outlook.com
 (2603:10b6:a03:117::48) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: 924d961e-ecad-451e-a6aa-08dcc8796c7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?EsX221rhk1eLdD3I3UYnh5SYMpmaqwBMswnrmuHchT+0r2x/dZw1yTZ/1d?=
 =?iso-8859-1?Q?1mkMAbLT+bjr/oDTUno1BWUPgYm5X7n8mgPnfTO2OwepYykKcfHCNSTAck?=
 =?iso-8859-1?Q?NOYL6dNGfL0IoakQRw4o3EVtDPoiSGBO42YJ+K5dkjuoXaNA/P7ENnilzE?=
 =?iso-8859-1?Q?tkmf5Pz6jlLghT+hGdmymHQJgsyEQHQ5IbmPiR+4I7ac2xXXqXXwlvO2kY?=
 =?iso-8859-1?Q?WV0a3mIYoCrdyQ0/E6htZWwmDw+ZUxfMA4PFJus+GaFg0xOvoPItuM+l1M?=
 =?iso-8859-1?Q?r4n1AwS9BgRqwVKhuIa0vxlAIgYPMgMk789+Qy+XcspWXP0RPBbHzZ8eLw?=
 =?iso-8859-1?Q?r/W1ex9auReKK4ST8UxYFVyqMdJ4ysZe14hL171gHAjoJszedd4SUU9Fz6?=
 =?iso-8859-1?Q?Z7RFLmDuZRJgxwFfFP9ZhIQ0M4yH9I12+O9Ip45dVErw9h0AF9hEJ8fVyq?=
 =?iso-8859-1?Q?3/1W3p+h1/ROICSiFfu3/WL71C5g2/tpRpQ3iXcrujl6Y1MFToWjPO5bfw?=
 =?iso-8859-1?Q?JK5f17CAoVSCosGB1He9382z6cFTFTfeFkrM93b8fKyDYJ8vhzwYAlVDX9?=
 =?iso-8859-1?Q?uni1wDZJQpz4u1vG6vpZRdd9/G3t+xhK8LZW1sYSE8lH9Fgmyu4mw83WQV?=
 =?iso-8859-1?Q?IEdtqP38qHWz6f6X8RcyWCq8rodvLh4h/O0KGdt5OvAgRM3KdiGPEP6MKY?=
 =?iso-8859-1?Q?TMIhGOQ2tbkDMCSYWcwdX6Mecwy8ATIBBnYrBCtQ1h22I6Qf5iydYbc4sr?=
 =?iso-8859-1?Q?7z1j1FRlWAQJ+V2KTZp8kb8IJ4Km6cBlmDyQu9eyoLv6vxR9mabQZlhJQ/?=
 =?iso-8859-1?Q?W5Nzd9RVTstGCPAqOJj5jrhXxbq35bjTgtgEM6ObtBbEpmsvCbut9v/BED?=
 =?iso-8859-1?Q?pq7f+WO8XT7ko0m4Sxu0HG3I9UuELqWdEdH8wS0t4bWyB32cra5eCWn+Lf?=
 =?iso-8859-1?Q?4g2yxJguHL8mymS0MrcNiSyCgJlAss6yyba4+Fd2CCDDQmD1fYocOZu43f?=
 =?iso-8859-1?Q?dnCjBW5sr1wzEdA9LJJlhZ2IQ0SWoA3w4nW6Er4LQp8fdoxPZF/D+GBkqm?=
 =?iso-8859-1?Q?BVQkIHHMegU0CBmjfIifw3eE4XJWk2tPFhg/jX1b8I5BFBryILuQxhLudm?=
 =?iso-8859-1?Q?O1Pbzb34UARqGCVIN8b6UIdYVhRCrKoF9FLpu/Siynr1nWUD+uH2Yn+rO9?=
 =?iso-8859-1?Q?BcY27TnVed6PTEEOLSPUETfQwwnYnHxYQruq2ooQSM4qRO5kgBKpSi0mvh?=
 =?iso-8859-1?Q?wN+xh9zv/rSvdeUZWH2cOD+FyYlRP37wxEXzrhLGv8O1hyM+yOBK1tCwrg?=
 =?iso-8859-1?Q?DOAixKa9T3XREnJZl4yc2gYmgQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IlgIsLAabL2SliZhH33jMevbb1DmVT3b56R2XfMmj/wc0GSreBa57hGpSn?=
 =?iso-8859-1?Q?VqzcLL6qYKDtioZT9PM8aoyVHRKWU7ryRO9ZIE6wqO9ZvpFfe4Wp2D8C9e?=
 =?iso-8859-1?Q?GQWvXEETvRvSA2w1I1cwsFOP3OhMdZyAq1FiO8Wdgy7xtF4W+tAFOgo0/8?=
 =?iso-8859-1?Q?wNtN7aYayV0fCmkXWX+rSy8ebqB1ivtM4ajRPJrxzscWFhWl/YGka5Ygqn?=
 =?iso-8859-1?Q?Ii7VgNE4nEwWHkTePVC3ShyEUPjxk+tcSbcBRa5XqcM8R/c+9pP2Ts1P5R?=
 =?iso-8859-1?Q?u4oPO1RmRrE/JQonSZl2R1kzZSN/1Edw36v7lItUWbd+5k93Cj4QgcfYbA?=
 =?iso-8859-1?Q?yOBP9rR1izfkmTtZWJS4dIvJQLpHb0IALUFqGVSJqfzkb3kMCKLmHDOGQB?=
 =?iso-8859-1?Q?9+waRUVZvinLMPEhrqjr5ENUDkjgXTsaD0Md44T7N+q+YuBQgdS0Kxqa6w?=
 =?iso-8859-1?Q?qrWkj4X+ggCPAASWqsY0lhhh0PL3UgETYhqDEpr9vTXIJ3Py+RVKr9fkKO?=
 =?iso-8859-1?Q?auev/H1UMusH9OoBZ+2Fld4Xfip2ke96+sFwwXmL1KhoYDakGbL4h2UOdO?=
 =?iso-8859-1?Q?p2WtjzBIz8IM7jzCCo/e98b3IWWKX35staBe3hz0Pqp/MsOkDVC2bWNi87?=
 =?iso-8859-1?Q?4hsqj6m3LxUXNC4WH3fO9DuSawXKWkXALzQrX4PYmM4z5zcPYfhpMHIaUs?=
 =?iso-8859-1?Q?SoOutUTgD5Ske1lMHN0TIZlLZh4P2Rr3d0NSaju95zSN5G58kf5Kf5W5aR?=
 =?iso-8859-1?Q?S38KCh5qGyslyzEyn4jlBO6Mi6e1VjqbsGB1D6oVuyiQasxDKUcDs0xlG1?=
 =?iso-8859-1?Q?CzEMFL5ykaoypVHiUE9SVZtmTxKNBr8OqT+1EP9XGKADjpm/LG8bT52vA9?=
 =?iso-8859-1?Q?YdqAqlJVfXvIEYE/SbsSEg3Lnm+qnBz7pw3N7a1BAhO2uwuc98IyJFrcCn?=
 =?iso-8859-1?Q?hrAhpqfTrCZJj7K8qZjs7QVHCYmuVFZxDOzBDAGkxooWjtbZ+YXRUzPtBL?=
 =?iso-8859-1?Q?DWceFVVpUPncEUrmjJ+bi9eTegk35eQLAvIkSsmnNVb5sZHf58W0i5ft+w?=
 =?iso-8859-1?Q?H4u9K3kCcRTNN3UT24H8sf4iwxowOgT5abqfcx0pMGDjOws757FhO/0LaH?=
 =?iso-8859-1?Q?Kzjaj5Vh5PnXD3/eBfTJsA7wc1rt902MvnfcI12U1fIXfBcVVKN+z0+RBA?=
 =?iso-8859-1?Q?Uf7nJ5r0Q4y/XmYM7JHxW8yFyZlpxFEYgxHpRg/QPkx6cbQ8u2iBD3p8N2?=
 =?iso-8859-1?Q?kefRsIH2wcTgfJMII6pnmcMfXHftGj0zaFrXAOfYDNv8wG8C/avojXO5R6?=
 =?iso-8859-1?Q?Oohkyt37f9sSC5gzYJ54nU/F4JqlXOMDINHfQRDIiBjfiE8oLz3r9fWyfg?=
 =?iso-8859-1?Q?uwx4WFvzftrN9u/+Vx3YgjIax5Bg/wQuJZTlpqY+jtOBF8zFOuHuzAKwse?=
 =?iso-8859-1?Q?btFBJmwsJR0gJwmXE2BfGPfavpVIIkGOYjlV+BXtBITDQrXtHKLqeJpeCH?=
 =?iso-8859-1?Q?+dd6G0fCBrqo3OdWfqqMtP81QTi3L12ac57/q3WR9poyiQ0U42MCeNxKn/?=
 =?iso-8859-1?Q?ZN/Hn9Z3PM8mRXO7GhOvmj9V0ufd6rwNhqq+YPCtLonUTIl1vwYIF9SJ31?=
 =?iso-8859-1?Q?TLNGcE//ikxCDsJaLcGFIVeKEjIMDBASPb/Q0zHO9wFE6Mzjiip9bHmg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 924d961e-ecad-451e-a6aa-08dcc8796c7e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 22:25:01.7484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmmhZPWPu4b8hL4jX88KEb6fJcTipkdCgBcv+Ksgpx15qQ8gDuJWbfqQfJVbiuDor2wCal3ZnM9HUDbEs131aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
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

On Thu, Aug 29, 2024 at 10:12:53PM +0000, Matthew Brost wrote:
> On Thu, Aug 29, 2024 at 01:02:54PM +0200, Daniel Vetter wrote:
> > On Thu, Aug 29, 2024 at 11:53:58AM +0200, Thomas Hellström wrote:
> > > But as Sima pointed out in private communication, exhaustive eviction
> > > is not really needed for faulting to make (crawling) progress.
> > > Watermarks and VRAM trylock shrinking should suffice, since we're
> > > strictly only required to service a single gpu page granule at a time.
> > > 
> > > However, ordinary bo-based jobs would still like to be able to
> > > completely evict SVM vram. Whether that is important enough to strive
> > > for is ofc up for discussion.
> > 
> > My take is that you don't win anything for exhaustive eviction by having
> > the dma_resv somewhere in there for svm allocations. Roughly for split lru
> > world, where svm ignores bo/dma_resv:
> > 
> > When evicting vram from the ttm side we'll fairly switch between selecting
> > bo and throwing out svm pages. With drm_exec/ww_acquire_ctx selecting bo
> > will eventually succeed in vacuuming up everything (with a few retries
> > perhaps, if we're not yet at the head of the ww ticket queue).
> > 
> > svm pages we need to try to evict anyway - there's no guarantee, becaue
> > the core mm might be holding temporary page references (which block
> 
> Yea, but think you can could kill the app then - not suggesting we
> should but could. To me this is akin to a CPU fault and not being able
> to migrate the device pages - the migration layer doc says when this
> happens kick this to user space and segfault the app.
> 
> My last patch in the series adds some asserts to see if this ever
> happens, thus far never. If it occurs we could gracefully handle it by
> aborting the migration I guess... I think the user really needs to
> something a bit crazy to trigger this condition - I don't think the core
> randomly grabs refs to device pages but could be wrong.
> 
> > migration) or have the page locked (which also block the migration). But
> > as long as those two steps succeed, we'll win and get the pages. There
> > might be some thrashing against concurrent svm faults stealing them again,
> > but they have a disadvantage since they can't steal dma_resv_locked bo.
> > And if it's still too much we can stall them in the page allocator.
> > 
> > So it's not entirely reliable, but should be close enough.
> > 
> > Now for bo based svm the picture isn't any different, because holding
> > dma_resv is not actually enough to migrate svm mappings. We still need to
> > hope there's no temporary page references around, and we still need to
> > succeed at locking the page. And the migration code only does trylocks,
> > because that's it's deadlock prevent algorithm if different migrations
> > needing the same set of pages, but acquiring them in a different order. So
> > we win nothing.
> 
> Ok, maybe my statement above is false...
> 
> Wouldn't be the only time this falls is if another migration is in
> flight (e.g. CPU fault) and they race? Then the eviction will naturally
> happen via refcount being dropped from the other migration. I guess I
> likely need to update my eviction code to not free the TTM resource if
> all pages are not migrated.
> 

Also if we add something like AMD's range->migration_mutex pretty sure
this race goes away and we left with 'the user has done something not smart,
and could convinciblely kill the app'.

Matt

> > 
> > Worse, if dma_resv does actually hold up svm migration and reclaim, then
> > we potentially deadlock because that lock is for a bigger range than
> > individual pages (or folios). And the core mm assumes that it can get out
> > of a deadlock bind by (at least stochastically) eventually succeeding in
> > acquiring/locking down a single page.
> > 
> > This means we cannot use dma_resv tricks to give the ttm world an
> > advantage in exhaustive eviction against concurrent svm faults. Or at
> > least not more than we can do without by just stalling svm faults that
> > need to allocate gpu memory (but that must happen without holding locks or
> > we're busted).
> > 
> 
> I'm a little lost here on the deadlock case. Do you mean when we try to
> evict SVM BO we trigger reclaim by allocating system pages and can
> deadlock? Doesn't TTM already have this dependency when evicting non-SVM
> BOs?
> 
> > So the only benefit I'm seeing is the unified lru, which I'm not sure is
> > worth it. There's also a bit a lru design tension here, because for the bo
> 
> Well also not rewriting the world...
> 
> Matt
> 
> > world we want objects that are locked to stay on the lru, so that the
> > competing processes can figure out who has the winning ww ticket. The core
> > mm design otoh does isolate pages and remove them from the lru when
> > they're acquired, so that they don't gunk up other processes from trying
> > to make forward progress and are better hidden. Which reduces temporary
> > page references (from lru walk) preventing migration and stuff like that.
> > 
> > Cheers, Sima
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
