Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E660390F977
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 00:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C85610E2A2;
	Wed, 19 Jun 2024 22:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2bG15sp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A83D10E296;
 Wed, 19 Jun 2024 22:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718837588; x=1750373588;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VtGwwNYqkqm6hNoe8wXA9GuMkKmL9m2h90/77esDu8Q=;
 b=Y2bG15spgB1gxbZ4d5K7arMMHv9FklhNG5VLTvDomgtoBC0wh/xiYm0s
 0JJ9mobE6LhiET6hh73cGRKZbcrAjBgpaujwhc4qWVWbGLWne9zLwEcEY
 usaapvcki7iWLY14U5CbmhoPrT3g0UaxIsrlBky5S8vne6ZSwrVSbA7dB
 B+gHWZoUzYm+xfpMJ7Y6wVp7OREc7jRNEl62D9vECPCL8jkPl/L044aVv
 aa/gMzfB5FlawO2DR7Ie4def5WDi3sE4Gu5czdS/m+SyKuXy7eCUQ+MUD
 +/jSoGQztWA/4TnM3P78hRjn1QZ3Ka74KenSbt5Mh+Hvl2R7agfikqjTd w==;
X-CSE-ConnectionGUID: Iu6w5ZZARXur/ZcwI2QH+g==
X-CSE-MsgGUID: 5EW2zjxVTIiyXJEIjZd0Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26428923"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="26428923"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 15:53:07 -0700
X-CSE-ConnectionGUID: Nz1gh1F+TrOAaVRjA5G/Lw==
X-CSE-MsgGUID: m7LzCQMAREKO4slwT9R3Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="47002126"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 15:53:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 15:53:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 15:53:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 15:53:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 15:53:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOZhlKwsfpLKYsh/GWXccAX4o3alThtnuJF7Lu2768h25WbmncjDfp7anEBggteJT7/ZAsA6/NIhP56WvZoxuG6lSqeSZX2VjvqodsxTeg/aU5D3/UXhsiN4ck5gj52Ob4+omcgLYzRr7/+MtZtVhWWs1wMJ4GRlkJ5lG+dGh4+AxL71WhIDc96OBlR/S4HnemhXBWHGy9RX1nDteYqFfatPUMvCyGgaimjefm95ON/9OWTwQZHRgkgpkDW09wZ1eFnaptEIoirVjFzs27SOF70w2lwgIcJw2t3f4dNLnFWlgSB+VO7N1okGzeAUAvsmeGpVg6cJqgErhq9G4tJS+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jljkc+0CIL5zdspWw0SPAkts5T6fdZaJO+ZFq1QkJJU=;
 b=DrPXAMpcp5l8I0KGICblZ1As+uI0SfVoXP9R7s0RjbjoJQ9ELTP9ONU8ojcaLJz5Vr4g1huGMUq4vzmpCsh8KCxqWIwQNSePzwiHgy1/xDZCXt2unAvG64ZPdQOMr8xYNn6XIIikJeXEZ03kg8MqcMUwa111whlVHP5+QINHdDSDSpkKBXvXzH2uv+fi+v9rr6uRaEbJQmGok4sqdaSGW7QLltfGBHKTafhbEDMxREPPKjRx2/1jKp5/FALKdR5D74bmn+6tr1RPihaRsg0isRP6JayqZT5tr/lpvXVy+HXS7FOxmOI1xKkTOBZaIwqIwKu9sllN6PTDW5BVIAH74w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4557.namprd11.prod.outlook.com (2603:10b6:806:96::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 22:52:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.027; Wed, 19 Jun 2024
 22:52:59 +0000
Date: Wed, 19 Jun 2024 22:52:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 07/12] drm/ttm: Use the LRU walker for eviction
Message-ID: <ZnNhIE6IhRuls2uA@DUT025-TGLU.fm.intel.com>
References: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
 <20240618071820.130917-8-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240618071820.130917-8-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR08CA0010.namprd08.prod.outlook.com
 (2603:10b6:a03:100::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4557:EE_
X-MS-Office365-Filtering-Correlation-Id: cccdde19-63b0-4f79-8c64-08dc90b290ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?RhBGxTgbF+gD5fOkO1q8Zr61hn8N1KfauVirK38yHawWPrccX0RVtn93Um?=
 =?iso-8859-1?Q?mwuZinYcQ4h+b/AJN+ozC9L2Ka9VY5EAkwHgCVJXC4ZUKU4xiJYuDvCJg5?=
 =?iso-8859-1?Q?oPuNv/wzof9SsDR8n0dLSb7CDCA/6a8EQmrCpScUKFiqaXgsfWg6mkV/5V?=
 =?iso-8859-1?Q?+3I5WxjBZkrJPBzRiYyb4nkYKy9+sobgn10vA59d/tkm1Mp5fxNaJ8yCsE?=
 =?iso-8859-1?Q?I7nc4+Hg+9oUhs2bE1vgItGU5JCH1Ty0PQRlwwKtPwEgiVG/kv8NE6tobx?=
 =?iso-8859-1?Q?B+lSyudL4RK8YZ4kxPJwdxoGSfKc2qhBjuHRcwvbpyPKVtF/wWmw2WYoPW?=
 =?iso-8859-1?Q?CPP8gYHM0SoarL/8GiUNaghZB7YAPr1J536315rKnIcwRYRkZ0PX7r04FS?=
 =?iso-8859-1?Q?1mFIskSg9PoidAXFtdzWaZ7G5sxVz/YT1oKpfT5cuupZLy8xASSCv+KKST?=
 =?iso-8859-1?Q?yLBOHgifq+UT85OSbBfYmH1xLnmcqdW+tzQkcjbr3rUir6avUyesIqq2F/?=
 =?iso-8859-1?Q?3zxumswDbVJmdXU/EAkW+hU9IbVnbCA3cDWX5qJ1A8v3jPGuj+VHvtsqqP?=
 =?iso-8859-1?Q?8JGWY2iirkZ33hvpN216ykDbNWTo2FGq8RsbxYgg6DKdhYjWnF7Xa2Ayc6?=
 =?iso-8859-1?Q?3HuJs35ZIVNJOqCiW0vtBLr9kWUA9rKJwKkDU4f8qB2LFbjs/836oYh72T?=
 =?iso-8859-1?Q?o2/tIH3x9JbK4QO4SRD3werHfHIUpxows0pv64yHiAm2fdipXpSFbfFQoc?=
 =?iso-8859-1?Q?/8GO9lkR+4eRi2z77+Bltq+zNFUXwgjS5gIzQ1qsenj52MTjPAWQ9zME5W?=
 =?iso-8859-1?Q?rzu2Kn8AOfXwlZxia64PoWXueKCuy7NGmei/xIk3lznMzyH9CJA6zZ9iDA?=
 =?iso-8859-1?Q?TuqzoQoCaOIDQxVF6newnpJdLOGFPsCMItXK15SjiY8lwcxCBPD4Jvvlyd?=
 =?iso-8859-1?Q?UEu+mSw3RRAGRSayyGFo0TY8ecWknpNTvX5OEjrNXe14eaeGda8Q16ypPX?=
 =?iso-8859-1?Q?xoLlZkX7c8aAlmzqqjeeWOkMbjIEVdaXMeV7/4NgYiJ0g01je4WiDpJ4Is?=
 =?iso-8859-1?Q?4kclr0xFVKZxkCNKA+WykSgABU9LOp0hPkvVzyxoBQ3g/5jKf5/PULRr2M?=
 =?iso-8859-1?Q?2o6zp8MGvTMwR8GxPuacYFFFAS4ZxH9O25SIWmo6Mfjs5mx5je0HGdg8q4?=
 =?iso-8859-1?Q?4wFxPfoPTGyTVlXuSV75pRNoP7fKKMpVmLPqqt9QzFOVJJj+D92mVQpb3d?=
 =?iso-8859-1?Q?GFQ/WOeX/dVd1mQI0kuSpLKgj96HoEqBY4SWWkGD/c0/xzh0hARfT2BbDY?=
 =?iso-8859-1?Q?z6XqxxYqXJzSG1MIXzmwxrNMUv8iq+GbXNEgR7lGihvUNU1gzv/Mahcny9?=
 =?iso-8859-1?Q?UoIHmT+zMZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JB4EiA/Z6AkYUoB/HI3RhP3nCols9Z8lmaAcM5YRSaaIEOH9S0mtt9grH9?=
 =?iso-8859-1?Q?V1+JfnuuBZE34oN8DRnsLgOOPtbOEWL3S96a5DfPbw3mcVuz3195/1iIvM?=
 =?iso-8859-1?Q?p3MiwXswsAsoTvUR+ZDtoYu5rOzFdKMeG9RZRq7P3HdQfaoS7J5zAfykYA?=
 =?iso-8859-1?Q?RZXWrtHuwN31u2RYnpJDNEnKR/U/rb5+020pqhouLXF/Ds4IKZf1c7Y/VV?=
 =?iso-8859-1?Q?pVd+vdDZp/wu5Bla3aSaln21q7/lXf4h0E4dFY3mMCigWX0ilFoPc2oZ7C?=
 =?iso-8859-1?Q?Rl46Q9kjUcsIWyyHEmbiXjEUyxIa3op80Jw+SAAsm/ak6tsrIStSXUPbL5?=
 =?iso-8859-1?Q?cmMajlUyxVwjc8FM7iDbeJi8upLg2gk/iENJoD8zdcTJ2PARmXvSQjW88w?=
 =?iso-8859-1?Q?mLizg8de1HZFBsZhZEL7MOMs0bVntJY7XNS7fYW9KItHJ8w3WlscILsFR8?=
 =?iso-8859-1?Q?LTUhyeHULTzZIyXx4wvSHMCRKTDnewfXbNOks5vQseIn8YLoe46vaLWdQk?=
 =?iso-8859-1?Q?PeOCvRu6JQOhsHWuqOav+VemCvBTyn/JL1GvNFeY9x63il/Ku/CDPk1Ygn?=
 =?iso-8859-1?Q?HmrVtmar9+gr3L5rPY5OzFdACwn8FCxpEKpo5VFYjespV8dgCm7ObrKybJ?=
 =?iso-8859-1?Q?TqMmG/kXgvMBfYvC9ReedZWbmcQ/FBR1B03plEDajTUT3eo3tFw993GyLd?=
 =?iso-8859-1?Q?rtCoZ1eDma6rURKlSCCdCNDsOdo6CfhybMg1vEvjODZqOvzcJgmiyrzpu3?=
 =?iso-8859-1?Q?v5FZF8cT9I5+lT6WuQu1eZW1T+wUL0nZyXIX3v4Wzru3N18Zeg2LxaPTGp?=
 =?iso-8859-1?Q?XbCmS+sLzmGaKwau/gZ+mLnwX8qgHUcOlyGKEp+NovxdB7wPhwJUxcO35T?=
 =?iso-8859-1?Q?hp1WTwIVgmn06qe0WCLeX3Fj23cXW+nWVIFyLmNgJohWr8MVz90NofD0BH?=
 =?iso-8859-1?Q?S10n9KwRhdkzQBznnaBtvco20fzrm2zJ0XIoxC/U5MrZKJG7tkTVoi+4TE?=
 =?iso-8859-1?Q?kdoiTvjPHwfFMPOwJ85AYknJSbrJc4NmgBVKjMqhQWu88ksyabCZRd4lFh?=
 =?iso-8859-1?Q?kwbOvozn3UwJid8Y+oFUgc4im1JqJXbjqRLeRsbG8WakNLLgSoJLyYSCLq?=
 =?iso-8859-1?Q?NzbvEMEUtX7PayIapgzYPBHU2UGvo6tsERqXbwk4mdp60g2/O/+Hqf2gv5?=
 =?iso-8859-1?Q?cBGGHzUoQfoNaYXfbzcVZx+sOF/e84vx1ax3FD1Vn3C7DMraK7RYaGw4QW?=
 =?iso-8859-1?Q?lRgqX1DjjElqgK4vyTtOMjeOE2uiUDLunGRqHJVzXe9P0rDA9VV10Iw6Os?=
 =?iso-8859-1?Q?MsA2XE/gvUIUtGfS4LNwSdCU+e8sB08NcD6TeEk1P7SnYK5VZZx4V6D/+R?=
 =?iso-8859-1?Q?8FFNwJqcmp4Tgb0g8O14r+4/ZzlhiSbpq4HWYgSPv4B28FwGyqSAs9cMtx?=
 =?iso-8859-1?Q?TbvldqvIP7Ll7GefcyniNA1gYjB/T9YYBqBA5+D4GDYaKscO4tbRZGzbIR?=
 =?iso-8859-1?Q?JRGW/j2sp5hcXgTByPXPtrgCXSiU+QTLXmy47U2tbBm4friVvqBng6EO/E?=
 =?iso-8859-1?Q?qfDC4nXwq0MVHlTxua8PGIL93MUcHZIAw+9+fVP5/0MsGlKlLO1/Y2DOV+?=
 =?iso-8859-1?Q?JbtynqBHD4f2GfZNzKydHcnf/ATxRzf1gi18oMy4aWjQSLTd/IHFGw1g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cccdde19-63b0-4f79-8c64-08dc90b290ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 22:52:59.1777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HX4pJhbdA8fAnkCbABFph15C6ALfLoZb4LzZ+QSvMsp7qFTtRmEO9m60AjPOmPVEC5BGz7m5IdERBI5OWyZwRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4557
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

On Tue, Jun 18, 2024 at 09:18:15AM +0200, Thomas Hellström wrote:
> Use the LRU walker for eviction. This helps
> removing a lot of code with weird locking
> semantics.
> 
> The functionality is slightly changed so that
> when trylocked buffer objects are exhausted, we
> continue to interleave walks with ticket-locks while
> there is still progress made. The list walks are
> not restarted in-between evictions.
> 
> Also provide a separate ttm_bo_evict_first()
> function for its single user. The context of that
> user allows sleeping dma_resv locks.
> 
I'm inclined to RB this as I think I've made sense of it all but just
have a few questions / nits first + one small bug.

> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c       | 350 ++++++++++++-----------------
>  drivers/gpu/drm/ttm/ttm_resource.c |  20 +-
>  include/drm/ttm/ttm_bo.h           |   8 +-
>  3 files changed, 145 insertions(+), 233 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 63a91b77f7da..316afe19a325 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -224,80 +224,6 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
>  	dma_resv_iter_end(&cursor);
>  }
>  
> -/**
> - * ttm_bo_cleanup_refs
> - * If bo idle, remove from lru lists, and unref.
> - * If not idle, block if possible.
> - *
> - * Must be called with lru_lock and reservation held, this function
> - * will drop the lru lock and optionally the reservation lock before returning.
> - *
> - * @bo:                    The buffer object to clean-up
> - * @interruptible:         Any sleeps should occur interruptibly.
> - * @no_wait_gpu:           Never wait for gpu. Return -EBUSY instead.
> - * @unlock_resv:           Unlock the reservation lock as well.
> - */
> -
> -static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
> -			       bool interruptible, bool no_wait_gpu,
> -			       bool unlock_resv)
> -{
> -	struct dma_resv *resv = &bo->base._resv;
> -	int ret;
> -
> -	if (dma_resv_test_signaled(resv, DMA_RESV_USAGE_BOOKKEEP))
> -		ret = 0;
> -	else
> -		ret = -EBUSY;
> -
> -	if (ret && !no_wait_gpu) {
> -		long lret;
> -
> -		if (unlock_resv)
> -			dma_resv_unlock(bo->base.resv);
> -		spin_unlock(&bo->bdev->lru_lock);
> -
> -		lret = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_BOOKKEEP,
> -					     interruptible,
> -					     30 * HZ);
> -
> -		if (lret < 0)
> -			return lret;
> -		else if (lret == 0)
> -			return -EBUSY;
> -
> -		spin_lock(&bo->bdev->lru_lock);
> -		if (unlock_resv && !dma_resv_trylock(bo->base.resv)) {
> -			/*
> -			 * We raced, and lost, someone else holds the reservation now,
> -			 * and is probably busy in ttm_bo_cleanup_memtype_use.
> -			 *
> -			 * Even if it's not the case, because we finished waiting any
> -			 * delayed destruction would succeed, so just return success
> -			 * here.
> -			 */
> -			spin_unlock(&bo->bdev->lru_lock);
> -			return 0;
> -		}
> -		ret = 0;
> -	}
> -
> -	if (ret) {
> -		if (unlock_resv)
> -			dma_resv_unlock(bo->base.resv);
> -		spin_unlock(&bo->bdev->lru_lock);
> -		return ret;
> -	}
> -
> -	spin_unlock(&bo->bdev->lru_lock);
> -	ttm_bo_cleanup_memtype_use(bo);
> -
> -	if (unlock_resv)
> -		dma_resv_unlock(bo->base.resv);
> -
> -	return 0;
> -}
> -
>  /*
>   * Block for the dma_resv object to become idle, lock the buffer and clean up
>   * the resource and tt object.
> @@ -505,151 +431,154 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>  }
>  EXPORT_SYMBOL(ttm_bo_eviction_valuable);
>  
> -/*
> - * Check the target bo is allowable to be evicted or swapout, including cases:
> - *
> - * a. if share same reservation object with ctx->resv, have assumption
> - * reservation objects should already be locked, so not lock again and
> - * return true directly when either the opreation allow_reserved_eviction
> - * or the target bo already is in delayed free list;
> +/**
> + * ttm_bo_evict_first() - Evict the first bo on the manager's LRU list.
> + * @bdev: The ttm device.
> + * @man: The manager whose bo to evict.
> + * @ctx: The TTM operation ctx governing the eviction.
>   *
> - * b. Otherwise, trylock it.
> + * Return: 0 if successful or the resource disappeared. Negative error code on error.
>   */
> -static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
> -					   struct ttm_operation_ctx *ctx,
> -					   const struct ttm_place *place,
> -					   bool *locked, bool *busy)
> +int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man,
> +		       struct ttm_operation_ctx *ctx)
>  {
> -	bool ret = false;
> +	struct ttm_resource_cursor cursor;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_resource *res;
> +	unsigned int mem_type;
> +	int ret = 0;
>  
> -	if (bo->pin_count) {
> -		*locked = false;
> -		if (busy)
> -			*busy = false;
> -		return false;
> +	spin_lock(&bdev->lru_lock);
> +	res = ttm_resource_manager_first(man, &cursor);
> +	if (!res) {
> +		ret = -ENOENT;

Nit, this assignment is not needed a out_no_ref just returns -ENOENT.

> +		goto out_no_ref;
>  	}
> +	bo = res->bo;
> +	if (!ttm_bo_get_unless_zero(bo))
> +		goto out_no_ref;
> +	mem_type = res->mem_type;
> +	spin_unlock(&bdev->lru_lock);
> +	ret = ttm_bo_reserve(bo, ctx->interruptible, ctx->no_wait_gpu, NULL);
> +	if (ret)
> +		goto out_no_lock;
> +	if (bo->resource != res || res->mem_type != mem_type)

So 'bo->resource != res' is checking between dropping of the LRU lock
and grabbing the dma-resv lock in ttm_bo_reserve, the BO's backing
resource has changed (i.e. someone else could've evicted to BO). Is
that correct? Also in this case 'res' could be stale memory and not safe
to dereference, right?

I'm confused about 'res->mem_type != mem_type' though. Looking through
the code is res->mem_type not immutable? I think I only see
res->mem_type assigned in ttm_resource_init.

> +		goto out_bad_res;

s/out_bad_res/out_bo_moved

Would that be more accurate?

>  
> -	if (bo->base.resv == ctx->resv) {
> -		dma_resv_assert_held(bo->base.resv);
> -		if (ctx->allow_res_evict)
> -			ret = true;
> -		*locked = false;
> -		if (busy)
> -			*busy = false;
> +	if (bo->deleted) {
> +		ret = ttm_bo_wait_ctx(bo, ctx);
> +		if (ret)

This should be 'if (!ret)', right? We should cleanup once the BO is
idle.

> +			ttm_bo_cleanup_memtype_use(bo);
>  	} else {
> -		ret = dma_resv_trylock(bo->base.resv);
> -		*locked = ret;
> -		if (busy)
> -			*busy = !ret;
> -	}
> -
> -	if (ret && place && (bo->resource->mem_type != place->mem_type ||
> -		!bo->bdev->funcs->eviction_valuable(bo, place))) {
> -		ret = false;
> -		if (*locked) {
> -			dma_resv_unlock(bo->base.resv);
> -			*locked = false;
> -		}
> +		ret = ttm_bo_evict(bo, ctx);
>  	}
> -
> +out_bad_res:
> +	dma_resv_unlock(bo->base.resv);
> +out_no_lock:
> +	ttm_bo_put(bo);
> +	ttm_resource_cursor_fini(&cursor);
>  	return ret;
> +
> +out_no_ref:
> +	ttm_resource_cursor_fini_locked(&cursor);
> +	spin_unlock(&bdev->lru_lock);
> +	return -ENOENT;
>  }
>  
>  /**
> - * ttm_mem_evict_wait_busy - wait for a busy BO to become available
> - *
> - * @busy_bo: BO which couldn't be locked with trylock
> - * @ctx: operation context
> - * @ticket: acquire ticket
> - *
> - * Try to lock a busy buffer object to avoid failing eviction.
> + * struct ttm_bo_evict_walk - Parameters for the evict walk.
>   */
> -static int ttm_mem_evict_wait_busy(struct ttm_buffer_object *busy_bo,
> -				   struct ttm_operation_ctx *ctx,
> -				   struct ww_acquire_ctx *ticket)
> -{
> -	int r;
> -
> -	if (!busy_bo || !ticket)
> -		return -EBUSY;
> -
> -	if (ctx->interruptible)
> -		r = dma_resv_lock_interruptible(busy_bo->base.resv,
> -							  ticket);
> -	else
> -		r = dma_resv_lock(busy_bo->base.resv, ticket);
> -
> -	/*
> -	 * TODO: It would be better to keep the BO locked until allocation is at
> -	 * least tried one more time, but that would mean a much larger rework
> -	 * of TTM.
> -	 */
> -	if (!r)
> -		dma_resv_unlock(busy_bo->base.resv);
> -
> -	return r == -EDEADLK ? -EBUSY : r;
> -}
> +struct ttm_bo_evict_walk {
> +	/** @walk: The walk base parameters. */
> +	struct ttm_lru_walk walk;
> +	/** @place: The place passed to the resource allocation. */
> +	const struct ttm_place *place;
> +	/** @evictor: The buffer object we're trying to make room for. */
> +	struct ttm_buffer_object *evictor;
> +	/** @res: The allocated resource if any. */
> +	struct ttm_resource **res;
> +	/** @evicted: The number of evicted pages. */

s/pages/BOs or resources

Another option would be 'forward_progess' or something like that given
the usage in this patch.

> +	unsigned long evicted;
> +};
>  
> -int ttm_mem_evict_first(struct ttm_device *bdev,
> -			struct ttm_resource_manager *man,
> -			const struct ttm_place *place,
> -			struct ttm_operation_ctx *ctx,
> -			struct ww_acquire_ctx *ticket)
> +static long ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
>  {
> -	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
> -	struct ttm_resource_cursor cursor;
> -	struct ttm_resource *res;
> -	bool locked = false;
> -	int ret;
> +	struct ttm_bo_evict_walk *evict_walk =
> +		container_of(walk, typeof(*evict_walk), walk);
> +	long lret;
>  
> -	spin_lock(&bdev->lru_lock);
> -	ttm_resource_manager_for_each_res(man, &cursor, res) {
> -		bool busy;
> -
> -		if (!ttm_bo_evict_swapout_allowable(res->bo, ctx, place,
> -						    &locked, &busy)) {
> -			if (busy && !busy_bo && ticket !=
> -			    dma_resv_locking_ctx(res->bo->base.resv))
> -				busy_bo = res->bo;
> -			continue;
> -		}
> +	if (!bo->bdev->funcs->eviction_valuable(bo, evict_walk->place))
> +		return 0;
>  
> -		if (ttm_bo_get_unless_zero(res->bo)) {
> -			bo = res->bo;
> -			break;
> -		}
> -		if (locked)
> -			dma_resv_unlock(res->bo->base.resv);
> +	if (bo->deleted) {
> +		lret = ttm_bo_wait_ctx(bo, walk->ctx);
> +		if (!lret)
> +			ttm_bo_cleanup_memtype_use(bo);
> +	} else {
> +		lret = ttm_bo_evict(bo, walk->ctx);
>  	}
> -	ttm_resource_cursor_fini_locked(&cursor);
>  
> -	if (!bo) {
> -		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
> -			busy_bo = NULL;
> -		spin_unlock(&bdev->lru_lock);
> -		ret = ttm_mem_evict_wait_busy(busy_bo, ctx, ticket);
> -		if (busy_bo)
> -			ttm_bo_put(busy_bo);
> -		return ret;
> -	}
> +	if (lret)
> +		goto out;
>  
> -	if (bo->deleted) {
> -		ret = ttm_bo_cleanup_refs(bo, ctx->interruptible,
> -					  ctx->no_wait_gpu, locked);
> -		ttm_bo_put(bo);
> -		return ret;
> -	}
> +	evict_walk->evicted++;
> +	if (evict_walk->res)
> +		lret = ttm_resource_alloc(evict_walk->evictor, evict_walk->place,
> +					  evict_walk->res);
> +	if (lret == 0)
> +		return 1;
> +out:
> +	/* Errors that should terminate the walk. */
> +	if (lret == -ENOMEM || lret == -EINTR || lret == -ERESTARTSYS ||
> +	    lret == -EAGAIN)
> +		return lret;

Same comment as the previous patch, the inverse of this might be more
clear. Also if the condition is the same, a helper may make sense.

>  
> -	spin_unlock(&bdev->lru_lock);
> +	return 0;
> +}
>  
> -	ret = ttm_bo_evict(bo, ctx);
> -	if (locked)
> -		ttm_bo_unreserve(bo);
> -	else
> -		ttm_bo_move_to_lru_tail_unlocked(bo);
> +static const struct ttm_lru_walk_ops ttm_evict_walk_ops = {
> +	.process_bo = ttm_bo_evict_cb,
> +};
>  
> -	ttm_bo_put(bo);
> -	return ret;
> +static int ttm_bo_evict_alloc(struct ttm_device *bdev,
> +			      struct ttm_resource_manager *man,
> +			      const struct ttm_place *place,
> +			      struct ttm_buffer_object *evictor,
> +			      struct ttm_operation_ctx *ctx,
> +			      struct ww_acquire_ctx *ticket,
> +			      struct ttm_resource **res)
> +{
> +	struct ttm_bo_evict_walk evict_walk = {
> +		.walk = {
> +			.ops = &ttm_evict_walk_ops,
> +			.ctx = ctx,
> +			.ticket = ticket,
> +		},
> +		.place = place,
> +		.evictor = evictor,
> +		.res = res,
> +	};
> +	long lret;
> +
> +	evict_walk.walk.trylock_only = true;
> +	lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
> +	if (lret || !ticket)
> +		goto out;
> +
> +	/* If ticket-locking, repeat while making progress. */
> +	evict_walk.walk.trylock_only = false;
> +	do {
> +		/* The walk may clear the evict_walk.walk.ticket field */
> +		evict_walk.walk.ticket = ticket;
> +		evict_walk.evicted = 0;
> +		lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
> +	} while (!lret && evict_walk.evicted);
> +out:
> +	if (lret < 0)
> +		return lret;
> +	if (lret == 0)
> +		return -EBUSY;
> +	return 0;
>  }
>  
>  /**
> @@ -760,6 +689,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>  	for (i = 0; i < placement->num_placement; ++i) {
>  		const struct ttm_place *place = &placement->placement[i];
>  		struct ttm_resource_manager *man;
> +		bool may_evict;
>  
>  		man = ttm_manager_type(bdev, place->mem_type);
>  		if (!man || !ttm_resource_manager_used(man))
> @@ -769,22 +699,21 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>  				    TTM_PL_FLAG_FALLBACK))
>  			continue;
>  
> -		do {
> -			ret = ttm_resource_alloc(bo, place, res);
> -			if (unlikely(ret && ret != -ENOSPC))
> +		may_evict = (force_space && place->mem_type != TTM_PL_SYSTEM);
> +		ret = ttm_resource_alloc(bo, place, res);
> +		if (ret) {
> +			if (ret != -ENOSPC)
>  				return ret;
> -			if (likely(!ret) || !force_space)
> -				break;
> -
> -			ret = ttm_mem_evict_first(bdev, man, place, ctx,
> -						  ticket);
> -			if (unlikely(ret == -EBUSY))
> -				break;
> -			if (unlikely(ret))
> +			if (!may_evict)
> +				continue;
> +
> +			ret = ttm_bo_evict_alloc(bdev, man, place, bo, ctx,
> +						 ticket, res);
> +			if (ret == -EBUSY)
> +				continue;
> +			if (ret)
>  				return ret;
> -		} while (1);
> -		if (ret)
> -			continue;
> +		}
>  
>  		ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
>  		if (unlikely(ret)) {
> @@ -796,7 +725,6 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>  		}
>  		return 0;
>  	}
> -

Nit, seems unrelated.

Matt

>  	return -ENOSPC;
>  }
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index a03090683e79..6d0c66fc36e3 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -508,24 +508,10 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>  	};
>  	struct dma_fence *fence;
>  	int ret;
> -	unsigned i;
> -
> -	/*
> -	 * Can't use standard list traversal since we're unlocking.
> -	 */
>  
> -	spin_lock(&bdev->lru_lock);
> -	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> -		while (!list_empty(&man->lru[i])) {
> -			spin_unlock(&bdev->lru_lock);
> -			ret = ttm_mem_evict_first(bdev, man, NULL, &ctx,
> -						  NULL);
> -			if (ret)
> -				return ret;
> -			spin_lock(&bdev->lru_lock);
> -		}
> -	}
> -	spin_unlock(&bdev->lru_lock);
> +	do {
> +		ret = ttm_bo_evict_first(bdev, man, &ctx);
> +	} while (!ret);
>  
>  	spin_lock(&man->move_lock);
>  	fence = dma_fence_get(man->move);
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 472a55b69afb..148f49f625e4 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -415,11 +415,9 @@ long ttm_bo_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>  		    pgoff_t target);
>  void ttm_bo_pin(struct ttm_buffer_object *bo);
>  void ttm_bo_unpin(struct ttm_buffer_object *bo);
> -int ttm_mem_evict_firevictedst(struct ttm_device *bdev,
> -			struct ttm_resource_manager *man,
> -			const struct ttm_place *place,
> -			struct ttm_operation_ctx *ctx,
> -			struct ww_acquire_ctx *ticket);
> +int ttm_bo_evict_first(struct ttm_device *bdev,
> +		       struct ttm_resource_manager *man,
> +		       struct ttm_operation_ctx *ctx);
>  vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>  			     struct vm_fault *vmf);
>  vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> -- 
> 2.44.0
> 
