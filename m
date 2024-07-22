Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B47D938A6D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 09:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81B410E3C3;
	Mon, 22 Jul 2024 07:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/OQkPb4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C3E10E3C0;
 Mon, 22 Jul 2024 07:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721634690; x=1753170690;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=n6ysGSVXxoxkkukx5XUkPJdq0VBSlKphAf9w8LKZUNE=;
 b=O/OQkPb42NveA13wXen0rA6gaQYPGmoVhbZGK/ni/fhnjEDw63nGuWaw
 adJW9pwb0JZcDAAHGXDWPlBxoSz8ul2iatECvbC/rATLTyHVacG4cM8gJ
 PjJjk/9BHYdZyBuy7EN6b3LJ4Bt26LJhTrbLKDsyRMLWFO/Yh41rcnXbM
 DMb8Mq8SkjJ/6r3oDCFopOsmAB6KCF/J8tKxOvxWlf/ewgYGMr6azAtOj
 WIyqpdR+rccu7jKpHPi4nuoZThLuJCEEmMq3i9giA1fqxyXf3FsMIZ46v
 lkrnwhMnecWQt6DXNTxTbCqWMkgIJqAtpAsbJypoiA9TdplppCi/1VWTO A==;
X-CSE-ConnectionGUID: 79bb6Rj2ShqXYI3IgSSb/w==
X-CSE-MsgGUID: u1uxjjFyTp+Frxz9ROly9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="36629397"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="36629397"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 00:51:30 -0700
X-CSE-ConnectionGUID: AnDcs6GsRXilaL3yt082Dg==
X-CSE-MsgGUID: pqfiS5WmSuGFmEMfvfBLMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="56362438"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 00:51:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 00:51:29 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 00:51:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 00:51:28 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 00:51:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2vLzF+I+1oKs/tlLdEklDYmDdknPPdRzh3XuAVSshYJjM6BKyGyguo1Hxxem1vIdiBUGaX7bcYKIDyOQSW8j7nctDPJygDy/BqBYRCS5wkgA0EwDYKFRsaX312XI4UCD4c2dhcNyO9HWnj0Dcmk86glnkhr8qvCw8LbXcuWmwuBKc3luoc8csxOsNklAN/3uHyhmgTKuHh/ph9WDoG/SkFuJflohNCPF5DmVSlrE3Irwt4Ke0iwKdPsUsSJRxpVO0eW0n+NQUFr3EgN1zZzjWLhGHjSzdadNe6w4+aVnPov51MKQMXDyCnQ2n2UbrgA0bLYs0WAcenEGMSiYW4NrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGH5fg6nCIjsp4DntgemasPKbS01UzRueYtTtzsWAQk=;
 b=jjrwfEqgbnsLcTLRh2mcyOKQrCxcQMNo95VGx3uRrYsSTYz+qL8NILqdCkuo2+uWeYU7hqBUrqZ8uvMUbYVVKi/b7frteH/Lbn6JTZ2SDMBp9ekXbMWO7GwUgy/TaGtFifwo8uhqfHTb8FOgfBwUUxJRBr+c3p7E2oxcJeRFttUSelm9mpFlqLNJvBciCk8TLJCe2AhfUiBE5T+8BwREdBBOM4ohXupriy9k9RHJxUEeh6lw3xcI9o5vy7srDdoLDZtXtq0Uj72pqxxrsPLqmzEvpp5aDBvBTvkujz0D0PUNLxuXFYaKCsN9GEONSBn4gQZ96s1OKfkeD953mVN0Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Mon, 22 Jul
 2024 07:51:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Mon, 22 Jul 2024
 07:51:24 +0000
Date: Mon, 22 Jul 2024 07:50:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, Himal
 Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v6 3/3] drm/xe/lnl: Offload system clear page activity to
 GPU
Message-ID: <Zp4PRK1mlL9Kmdmj@DUT025-TGLU.fm.intel.com>
References: <20240719095506.4068-1-nirmoy.das@intel.com>
 <20240719095506.4068-3-nirmoy.das@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240719095506.4068-3-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec84d51-0927-417a-1e72-08dcaa2315a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?pE+SMRgrZO6fhnPB3rBDcvlWw6gJb+qU7Ddm4yTJjauLaar5gUTNX6I9d2?=
 =?iso-8859-1?Q?xI0HXast+wTW7e12+v4zAZk/rjUasX09gq97MBR01ptA6kDqBR+Iq85uYN?=
 =?iso-8859-1?Q?VsUt7spnLmrmNyEunm4OGouGwbjtZ3Wh4nSoy4fHxlTmldeuREU+45KS7h?=
 =?iso-8859-1?Q?EZDecq8JFKhSmGErCC6XKxgz3/HkkKFDng713pg92pJRbmqe8L3mdXyDX5?=
 =?iso-8859-1?Q?1qFwafTda+qXqdekDCdEG7s0jmNT+OZjusscpx1X15VjfJ/ehfE3aRS65Q?=
 =?iso-8859-1?Q?ohyhTnuPKjccrh9Qd30yYW0U2KRSeVzRl4vWo5H+/AK1FbE5UTdIJOeQg5?=
 =?iso-8859-1?Q?BLWzXffnPY3n5XKpn0gJblzcLtfKqLYTztWqAQvsvcr5wL8b5klefkzciU?=
 =?iso-8859-1?Q?ngblLXnSbUgta5bGopRPVG9bfEbxvkTE3rTl3KydTyMXvNEYBAEsx617+A?=
 =?iso-8859-1?Q?Yhy3kffy1TK6J0kdC3LDcsSGM9tZV7qDW1nPC8clb0LUDAEoo9sf7yE2Gi?=
 =?iso-8859-1?Q?UD9GvkATmrLIM0SfERy9IYRwprP5YavfWIXFnNzPkOJfu0e0H7KR7sUDDE?=
 =?iso-8859-1?Q?PUxCnrx3J+zGWWIWQ2rKsQW7jYAqHzGrVlqPSXBCkOy/YonrUj24zjFQHj?=
 =?iso-8859-1?Q?AiRdblyQDSHIPF1vATZe2Vn6GpSQvAhMaezY3nKSlhO6EXGMN3vfdsRHkK?=
 =?iso-8859-1?Q?35SGE1FAmYqfk9YjDkQPWQqNbzBytdEHM4xjQG2TMqYqTrWTXLiWNfhC55?=
 =?iso-8859-1?Q?6lYgfXKr2yUCfrEswGtXdb4X4pfSzvq+Hpq6OCsi6zEPTV1HCR+U+RFpR9?=
 =?iso-8859-1?Q?Cldi1Vbl5pcgeKPG0IOVczk+5yGe/KBxFHB42zwN4VDp8BNeqi1djiXQw2?=
 =?iso-8859-1?Q?ZdZnojohaQtUyrKRYyN4RPCN/zI+Xa6llRXQaW7f0UZOoLZg+hhldZJB0C?=
 =?iso-8859-1?Q?YHg8vwt4K/B8ZZinnvN+CQH1a+qitqWdXVzpP5ADg0sIRGuE6FcHCiXawx?=
 =?iso-8859-1?Q?KQLwpUf3ycEF25kv2mXpg3+IQpbG6AETRInFYWinMHuunGy9W3sHNfw2EV?=
 =?iso-8859-1?Q?Sx0n8KTtfelLyCmR3fdAxSwE40UI56BvfUXke8aEpZTXgYVtYNByRI0Qxe?=
 =?iso-8859-1?Q?2xhAkPbhY2nkGgpANO1KgFdyKSKUb2Pl/WwsmeVs8f3x/1MaWP2RHRfeK6?=
 =?iso-8859-1?Q?/tNU1EIfRzKp678HPh6CDb32fTfKmHRXwI45vrsNtVWSB7ul20zuo/zqUp?=
 =?iso-8859-1?Q?Gz6hkBzVP0vmkMvXtVeByOD2WJqeY0+97a1/sbxsCYVYuvwbiQTj82kprS?=
 =?iso-8859-1?Q?Z0gVloKvj1v52OSMPtRd7FOjRXNvoADwztTFFgobCvBVgzLClFnwEjneoz?=
 =?iso-8859-1?Q?IK5QUGL9K+etUxI6c7XZAH1GQDYhTqIg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1BmCoRakIlOxq55HZGT43LQkB0g78YcpVDgqNcV1vH8qs0N9mVfqU/kpil?=
 =?iso-8859-1?Q?fLYre9llXvSHdyKsDLyLcRhkRTaP+R2xg+f6BQtxYORGkoJX9hLYPoP6rS?=
 =?iso-8859-1?Q?7x+jPKLbpueMrsQ1S1pc96n7UWIRNPhetdOKCBFZ4LjwafZjVzVF3zMDzJ?=
 =?iso-8859-1?Q?IsR97dO2mBbC5OX0szC2q9ExD6LCXlfzZUN8S9fnIz3KwFroib4JvVFJwJ?=
 =?iso-8859-1?Q?dghjs2F91JVL0qkEQ2dS0owowAblHviv86dar6w/sOMQVSG0HAlog83mna?=
 =?iso-8859-1?Q?nhxv/9dXp0VdDdbX5bMMYurTZS84JkG8amNTkRFSZ5baCmaT//hh5sem9a?=
 =?iso-8859-1?Q?9WKZ88ANggud4T8FHyI+2hzYm1qIU/7gwWOm9TjW3phCc3pvo/nxJLaKD1?=
 =?iso-8859-1?Q?QyH8m2t1pFAzu5NvtWivneE5Mmt8Ef1OpfkyTCvE1Ooxc19VsGTRcBOJ1z?=
 =?iso-8859-1?Q?Xc+oSPB15Mf6Zy10+plC0T4mOpErnaDpbsKPfvNxsLUntn2u9RBwmGaNle?=
 =?iso-8859-1?Q?xpdzqIm5fgij+C8jiXGGBHseDEManwIU0WBKO3PQeCWCnk7xEALGizwtRs?=
 =?iso-8859-1?Q?lG3cjiyLI1lXCAYfpmMNX8k7xYbX/sq45OY36P+ZS/V2HkzZJI0Gbhks3B?=
 =?iso-8859-1?Q?Yv3viLdz4pWGJw6Y+wi3KW/x0r5SJD+GrPv9i/1kgyX59nwVlukBdadlEm?=
 =?iso-8859-1?Q?xSFOrNvWdYTJkmMvAOI3nJGQgHEelzTgy4RHPAzGENxSompqmXkwirZH7i?=
 =?iso-8859-1?Q?V8bfD+RxOw6dp9rqD06WuQyX+DlS2TpF3HUPsxpuv9Gqjrqz0zWhr9A+ks?=
 =?iso-8859-1?Q?DHWe35rTV9VEPnznv4mBFcmXFQKhHrfUfXjVMuCsONfsfH3UoVrjkMOrCN?=
 =?iso-8859-1?Q?NwMA38jYXqnf5A++VbmdqkZ3hoFSsrQOwqwkPBjSt0D8UPy6iG/qpRZWhW?=
 =?iso-8859-1?Q?bxUuTjazFqHxe6tsEAW9x1aylk9rMhHedmsWIYkJlSsHvh/rJ0rhG44A5i?=
 =?iso-8859-1?Q?peF9HD89fguUnPXfawq6ruC/jCC4IMcZemB0I/dOrYc/+yNbtG8+2gKfjy?=
 =?iso-8859-1?Q?EEyDrCOwoQa/3XfEiGV4yV2BRFiSb3EHytoRfS/1qBv5E+qDRO7orggi+F?=
 =?iso-8859-1?Q?Ky8EPLIJ/PtoD+TaqE7esCAhcVW+jUvMsHhFcjDz1oVX2UYBoO82izk7/G?=
 =?iso-8859-1?Q?PD8dOmXDtQKJqUJhygF/588QuPY3Ar8PoCWRYzoj/btf59SzYYu5umqzIC?=
 =?iso-8859-1?Q?pplY3/EoHDNdQ9EWqxKJ9dO+y2gBrrPe+C/289NLcs7LrVExIklV+5Rr2J?=
 =?iso-8859-1?Q?BeJ5Z5aAujC+Ad6HYQ+kJURsmpAs98hVasp8LUpWI/iKkvgZoI7WZYMAPB?=
 =?iso-8859-1?Q?qc6YsbupuFjzg9EmapwFz9YK6Vyl/xvjZkkIY9CWYQyshcQQp6zmF/qPJf?=
 =?iso-8859-1?Q?SONawZUdyaPtdptrKKfst+rxq+H5AFJ4ywVl9It2VcEY5zws00mT0OTw8i?=
 =?iso-8859-1?Q?dLLVvtwKnAC/ClY01o03nmDGoiTxfl0chA1+TJJCRBS0oqVFts6qbjMEuD?=
 =?iso-8859-1?Q?egijOgTP70koGgPHalOKw36SkC2MRjo2Pm/IVK3UZuMJVVHKzVsCvrcGPb?=
 =?iso-8859-1?Q?QCW+7S3hYGSxKxICM1Y0GjaASUFJNANMik4gQkqFhUrH2mGTVGXJ8t+w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec84d51-0927-417a-1e72-08dcaa2315a7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 07:51:24.8445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2/k6QMQNYo31Fjq2/N/rDgSf6fXRYXZsGkBUyBsBOTrEbjAmAEC5dcRSxoR/gToMGSZ/XwituPPIDIO2aO+Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8443
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

On Fri, Jul 19, 2024 at 11:55:06AM +0200, Nirmoy Das wrote:

Not a complete review, just a few comments.

> On LNL because of flat CCS, driver creates a migrate job to clear
> CCS meta data. Extend that to also clear system pages using GPU.
> Inform TTM to allocate pages without __GFP_ZERO to avoid double page
> clearing by clearing out TTM_TT_FLAG_ZERO_ALLOC flag and set
> TTM_TT_FLAG_CLEARED_ON_FREE while freeing to skip ttm pool's
> clearn-on-free as XE now takes care of clearing pages. If a bo
> is in system placement and there is a cpu map then for such BO gpu
> clear will be avoided as there is no dma mapping for such BO at
> that moment.
> 
> To test the patch, created a small test that tries to submit a job
> after binding various sizes of buffer which shows good gains for larger
> buffer. For lower buffer sizes, the result is not very reliable as the
> results vary a lot for both CPU and GPU page clearing.
> 

I could see at smaller BO sizes the CPU being faster and results varying
a bit, certainly once BOs are larger I'd expect to see reliable perf
improvements. See my comment below on with / without as that info might
be helpful.

> With the patch
> sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run
> basic-store-benchmark
> IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
> Using IGT_SRANDOM=1719237905 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: basic-store-benchmark
> Starting dynamic subtest: WC
> Dynamic subtest WC: SUCCESS (0.000s)
> Time taken for size SZ_4K: 9493 us
> Time taken for size SZ_2M: 5503 us
> Time taken for size SZ_64M: 13016 us
> Time taken for size SZ_128M: 29464 us
> Time taken for size SZ_256M: 38408 us
> Time taken for size SZ_1G: 148758 us
> Starting dynamic subtest: WB
> Dynamic subtest WB: SUCCESS (0.000s)
> Time taken for size SZ_4K: 3889 us
> Time taken for size SZ_2M: 6091 us
> Time taken for size SZ_64M: 20920 us
> Time taken for size SZ_128M: 32394 us
> Time taken for size SZ_256M: 61710 us
> Time taken for size SZ_1G: 215437 us
> Subtest basic-store-benchmark: SUCCESS (0.589s)
> 
> With the patch:

Both results 'with the patch'? What does it look like without?

> sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run
> basic-store-benchmark
> IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
> Using IGT_SRANDOM=1719238062 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: basic-store-benchmark
> Starting dynamic subtest: WC
> Dynamic subtest WC: SUCCESS (0.000s)
> Time taken for size SZ_4K: 11803 us
> Time taken for size SZ_2M: 4237 us
> Time taken for size SZ_64M: 8649 us
> Time taken for size SZ_128M: 14682 us
> Time taken for size SZ_256M: 22156 us
> Time taken for size SZ_1G: 74457 us
> Starting dynamic subtest: WB
> Dynamic subtest WB: SUCCESS (0.000s)
> Time taken for size SZ_4K: 5129 us
> Time taken for size SZ_2M: 12563 us
> Time taken for size SZ_64M: 14860 us
> Time taken for size SZ_128M: 26064 us
> Time taken for size SZ_256M: 47167 us
> Time taken for size SZ_1G: 170304 us
> Subtest basic-store-benchmark: SUCCESS (0.417s)
> 
> With the patch and init_on_alloc=0

Can you explain what init_on_alloc means in this context? A GPU clear is
skipped?

> sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run
> basic-store-benchmark
> IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
> Using IGT_SRANDOM=1719238219 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: basic-store-benchmark
> Starting dynamic subtest: WC
> Dynamic subtest WC: SUCCESS (0.000s)
> Time taken for size SZ_4K: 4803 us
> Time taken for size SZ_2M: 9212 us
> Time taken for size SZ_64M: 9643 us
> Time taken for size SZ_128M: 13479 us
> Time taken for size SZ_256M: 22429 us
> Time taken for size SZ_1G: 83110 us
> Starting dynamic subtest: WB
> Dynamic subtest WB: SUCCESS (0.000s)
> Time taken for size SZ_4K: 4003 us
> Time taken for size SZ_2M: 4443 us
> Time taken for size SZ_64M: 12960 us
> Time taken for size SZ_128M: 13741 us
> Time taken for size SZ_256M: 26841 us
> Time taken for size SZ_1G: 84746 us
> Subtest basic-store-benchmark: SUCCESS (0.290s)
> 
> v2: Handle regression on dgfx(Himal)
>     Update commit message as no ttm API changes needed.
> v3: Fix Kunit test.
> v4: handle data leak on cpu mmap(Thomas)
> v5: s/gpu_page_clear/gpu_page_clear_sys and move setting
>     it to xe_ttm_sys_mgr_init() and other nits (Matt Auld)
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c           | 26 ++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c  |  8 ++++++++
>  3 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 0b7202dd4c9e..668c4c0f5ff0 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -396,6 +396,14 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>  		caching = ttm_uncached;
>  	}
>  
> +	/*
> +	 * If the device can support gpu clear system pages then set proper ttm
> +	 * flag. Zeroed pages are only required for ttm_bo_type_device so
> +	 * unwanted data is not leaked to userspace.
> +	 */
> +	if (ttm_bo->type == ttm_bo_type_device && xe->mem.gpu_page_clear_sys)
> +		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
> +
>  	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
>  	if (err) {
>  		kfree(tt);
> @@ -417,6 +425,10 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
>  	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
>  		return 0;
>  
> +	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear system pages */
> +	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
> +		tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
> +
>  	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
>  	if (err)
>  		return err;
> @@ -659,8 +671,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	bool needs_clear;
>  	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
>  				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
> +	bool clear_system_pages;
>  	int ret = 0;
>  
> +	/*
> +	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path when
> +	 * moving to system as the bo doesn't have dma_mapping.
> +	 */
> +	if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
> +		ttm->page_flags &= ~TTM_TT_FLAG_CLEARED_ON_FREE;
> +
>  	/* Bo creation path, moving to system or TT. */
>  	if ((!old_mem && ttm) && !handle_system_ccs) {
>  		if (new_mem->mem_type == XE_PL_TT)
> @@ -683,8 +703,10 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
>  						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
>  
> +	clear_system_pages = ttm && (ttm->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE);
>  	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
> -		(!ttm && ttm_bo->type == ttm_bo_type_device);
> +		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
> +		clear_system_pages;
>  
>  	if (new_mem->mem_type == XE_PL_TT) {
>  		ret = xe_tt_map_sg(ttm);
> @@ -796,7 +818,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		if (move_lacks_source) {
>  			u32 flags = 0;
>  
> -			if (mem_type_is_vram(new_mem->mem_type))
> +			if (mem_type_is_vram(new_mem->mem_type) || clear_system_pages)
>  				flags |= XE_MIGRATE_CLEAR_FLAG_FULL;
>  			else if (handle_system_ccs)
>  				flags |= XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 36252d5b1663..203ad50c894e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -332,6 +332,8 @@ struct xe_device {
>  		struct xe_mem_region vram;
>  		/** @mem.sys_mgr: system TTM manager */
>  		struct ttm_resource_manager sys_mgr;
> +		/** @mem.gpu_page_clear_sys: clear system pages offloaded to GPU */
> +		bool gpu_page_clear_sys;
>  	} mem;
>  
>  	/** @sriov: device level virtualization data */
> diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> index 9844a8edbfe1..fde0512a838a 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> @@ -117,5 +117,13 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
>  	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
>  	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, man);
>  	ttm_resource_manager_set_used(man, true);
> +
> +	/*
> +	 * On iGFX device with flat CCS, we clear CCS metadata, let's extend that
> +	 * and use GPU to clear pages as well.
> +	 */
> +	if (xe_device_has_flat_ccs(xe) && !IS_DGFX(xe))
> +		xe->mem.gpu_page_clear_sys = true;

Seems like a xe->info might be better place with this being a platform
thing setup in xe_pci.c.

Matt

> +
>  	return drmm_add_action_or_reset(&xe->drm, ttm_sys_mgr_fini, xe);
>  }
> -- 
> 2.42.0
> 
