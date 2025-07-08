Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2578CAFD683
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 20:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB5410E069;
	Tue,  8 Jul 2025 18:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DmEVDmQn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221FD10E069;
 Tue,  8 Jul 2025 18:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751999641; x=1783535641;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/7s9s4Cn1gNWbeNaco5ECswsGe4EKRYcaZjmIxFofNs=;
 b=DmEVDmQn1/u+kY2y8HSohnitWsX2WBYus0UKNgSORFB+qZkxoWj8BSzu
 Ke2iJ2AhNr8/k2iIJDUnvspV5ubG8+WzNjZEwF9vCR/6TFhD+zS088SIj
 eR1F0Pl824FPfdULhwGl27/I8M6luUYz6riDyL7elNK3wqOdbZkcvQazb
 UYXLGwS5uonZJBRN8WhLUaFyvGXiSxBMK9SYe9zhP9UElnmI4hWvlvj15
 UOmrFQ/5YS7abSFmVs3JudHqm5sR1IlQwsW0hu4K2klD5M0r8P0A2A34D
 cSQgbDgUl0Hrq+htVd1rU2Hq2pbc6rwej3/Xcq/KIw8Wgrzfzg2oxF07I g==;
X-CSE-ConnectionGUID: pHZm5QYET8itRKSJd7q+Yw==
X-CSE-MsgGUID: aTEVEn0qSRmO2J4cF5mzXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65310537"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="65310537"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 11:33:58 -0700
X-CSE-ConnectionGUID: LMgD1TOVSieKXR7o9pP0oQ==
X-CSE-MsgGUID: pMu0Gv8LSHesL8MDH6ZuIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="161220387"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 11:33:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 11:33:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 11:33:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.51)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 11:33:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLF29TJPMpwC2IHxTYSpGoBWMn51f9eHe3kQCwiiLWH6LoiW4k9w7skr+YgIH+RfOzi/+g/vTgWTrAs9AAUjAR5yYtYeJJk8ngDXZgxssYIxU8u7JUWNzD40NZnfAEoJRxhsdf6uMZTapNEYj9AxjrZovEJTwhJMjFz+jIWvGrn15p0gfSgVmFBTk/4IVf2lbDYcqYJw5adthqaqloGgrzO1AonaL7In8flDM7CYkeIPJgLxpxjFldqgjemkcUR248XITriM5RJ/UZzPcH1tyFXPHCvxrEXJ0NxpqKwFc1RKx9meGe+BMmoFVYRL9kRw3zLg+Y4gNQFuTk9ko+HsdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dhz0ibnshc4XlzTMkqnhj0oZxTgOxjrIPdUmA3Ig0x8=;
 b=W/dfJW9X5GECGf8nmEAvfWKgY/ks5Aga8H54L1lvQXDpe0/3Je0XV2uSETnfYmKwSYm4ofUcGWKyJTi3P6rVhieZnCLbi+sPuhctlnO23uAbMKxQzOoLKrI2AtA0+EJFfY8/wfYx0rnIQ+/qjaEWOafWmEhVRFW0fiVEE6xzjch1VskgP6KKwHPsj6xM06GuluNvT0vkN43uQ5OKwgPvtUAHTKeW8N1hcJTtkXYd8vZ6hHmhMWZhXu/a4I6xXg8iNJ80rCRsQU+gO8sRQbzqikQH8dn02STKD9YI2Gd0Bu8zSrbE+WNW0SblM/G3f9xH/kZkXPivVtgTnvXbbUbCgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7043.namprd11.prod.outlook.com (2603:10b6:806:29a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 8 Jul
 2025 18:33:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Tue, 8 Jul 2025
 18:33:55 +0000
Date: Tue, 8 Jul 2025 11:35:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>, Simona Vetter
 <simona@ffwll.ch>, "David Airlie" <airlied@gmail.com>, Melissa Wen
 <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 <kernel-dev@igalia.com>, <dri-devel@lists.freedesktop.org>,
 <etnaviv@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 7/8] drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip
 the reset
Message-ID: <aG1k+dixKE+ZdQRz@lstrano-desk.jf.intel.com>
References: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
 <20250708-sched-skip-reset-v5-7-2612b601f01a@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250708-sched-skip-reset-v5-7-2612b601f01a@igalia.com>
X-ClientProxiedBy: MW4PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:303:16d::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7043:EE_
X-MS-Office365-Filtering-Correlation-Id: 03575bd6-b49e-4ff2-3a68-08ddbe4dfe8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9vFY2RSM0ILVaEeDN5K0oGp1z1SdGdCTWsFCYzAITq6tR/V1zDVsvRLYq6?=
 =?iso-8859-1?Q?OITFOsQ9F1N4aAqq3u50FAyFzH+K+3Sim0yICqWdrt/xYG3GzLwJ/IplQY?=
 =?iso-8859-1?Q?E6LiVSg/AtvDIFUzBKZGur66FXTn7uSUgRH7sy9vR77/LztCT3MvnOjdUS?=
 =?iso-8859-1?Q?O5rnneAt9dPdbMlfZKhXSUwM/CNsTUQzkpzp6HnuFEfn/27HrkS8WntwN6?=
 =?iso-8859-1?Q?3K6SLiWvaGm1+so0irstJC6AEekxLSZgt8/6p5U0oboesZe03AVpLXRyYx?=
 =?iso-8859-1?Q?LUqOSiqNHz9FCDh4GTUYsvjD5T+SzpXBs3s0L0Y04kJYYRiY7SGOf7GjD7?=
 =?iso-8859-1?Q?J7vIYQ1Zk6D2Ol9klZG/ABowvcuiY5uOgvKmm8VFmlWk4ILOKCwR9hGNYr?=
 =?iso-8859-1?Q?uhgwjlNkkb1JCSnYJYvyrOJggV1TChWaKkZWJICWszuLc2WWYm+7QmGBSj?=
 =?iso-8859-1?Q?JiNAikpS/QjqHzAZ1ePbRVR8nsVOpAFJRa3d5a6T1PsPtlpZe8roXgwz1W?=
 =?iso-8859-1?Q?YzBNjXpOidxHSgPn2U/FaNvPBjjhIb0ucCx+Qfa2LCrq9fgUh67S8AWWqb?=
 =?iso-8859-1?Q?FVooHNYiDp+7ApOx8dEeHgYrRXK4+5NRnwj6JKqa1hdQ5YBg2dNJ1EIMXd?=
 =?iso-8859-1?Q?GH7+C/A24X5kT4XO8iB8Mi7oMu9PtuHIkEK4Dxk+5W3xW07tuI/okNen7h?=
 =?iso-8859-1?Q?pdSBgt5XzBb1wKY5AoyyP/KxOPki2itYQu7Edh0FPqPQz2ZDKpSPfkPA7K?=
 =?iso-8859-1?Q?P0j+4ZVJjrvDeDNFEmKjx6pj8WC2RL7TXg1Gifbu3X7gaMUdM0INlfXuqg?=
 =?iso-8859-1?Q?MSj61HOdz6KNtLTJzA+uND2nfkjPFMzyBckUBnFi6+6+ocklCfvZ4pogUp?=
 =?iso-8859-1?Q?yMGg8whGWnYtH+mLUQVE78pNiqrTjmu+MxwL6qa7u0CrflFYqn5QBUrCvI?=
 =?iso-8859-1?Q?4OUjYNUA4+xEK9UoPkZj0DbUT43P0NIjf3ykXRZYQ3UKX6y8L0zFf1Sw8b?=
 =?iso-8859-1?Q?p/SX1G/hJJDWCVUBlRHozwNTrdIwMTvhAK6xK8MgXguoXueR2u7BPbLuXK?=
 =?iso-8859-1?Q?Hcc7PzhlxyOtZ6RI75GjtGHpyonQEVd1yvuifoGnjDIh13HcREz0XM2jO8?=
 =?iso-8859-1?Q?ftiKfB5W80sDmM+f+aHwyhnO/lrzi4siW77C8jHBNDyicPbGzes4scZV2F?=
 =?iso-8859-1?Q?JqXC6uJ8BZvvRCwBkENlD7iex+U+SGJZbxCD5xTQovi6y16tVtedTqRW34?=
 =?iso-8859-1?Q?xBVO3QM6gmJvtlrjMr4OUceDKjtlpKdloMVmxtvrAAsX+1mrfRtXQonrdB?=
 =?iso-8859-1?Q?7Dg9REdEEzukIsg2A77Jn3sqNQ+Gu9UMwod63a4y2B3cJtyGZiyOBFJKc1?=
 =?iso-8859-1?Q?pGEo00VWdEOhgcmNfioAs+h6CIaTrr8Wsmno0VbRivWm4VuwW3wURs0J9y?=
 =?iso-8859-1?Q?sQo+jOpon/XzkMLQMDD8Wpv36gD5lY8p3LHx+NDrNhg3JXuD1LgqEV47rA?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+N9kANulkOFThC28qYCCohc3l8YCoigEInSEeGyilnBc0zfpxLhHdW/gv5?=
 =?iso-8859-1?Q?huBQdH7XmGQIjSS5a3d0rEJeiKBEbGyD9S2viqTP+J3Kksg7i2XL8yP41x?=
 =?iso-8859-1?Q?iP72y8PlALQLQE6D5DXhUYRDooPN4m/a4oQj1wuHT+KzOgx0S4GLSOV2Km?=
 =?iso-8859-1?Q?XLXXW2mYsNvRfJ6tyb6LQ7HQvdaKioX9kAwEYN3Beb7AZGUjtr5CN9HXAT?=
 =?iso-8859-1?Q?wUhFnRiIt1/BVSYyfJpEo+1bgJNM9gbd1UjTS784G0rKRwbGG21iZ+tJqz?=
 =?iso-8859-1?Q?tYoNSgbWclefCgNbUZ+ZNoAzw+gbtXDsPSsS7FZMfy0eT0Gu6PFlJMJ2Za?=
 =?iso-8859-1?Q?/GT9cGGfbcRQ+hsTKG+aGWiao8U0WntVmUhQzR90JXzengaT7tr1rONs8v?=
 =?iso-8859-1?Q?LHn3APGwGt869GeKJycnY5qgeXkfWfpJ+TElJLH+UwZfp5xHGPlVX1xD/G?=
 =?iso-8859-1?Q?cSbfZfemtfsWZYbxeZ3BxalgIdqnJc7WH/tJku741lz7E6vWTOJL+eL+SQ?=
 =?iso-8859-1?Q?0MH+aSTyybTXtxW4sVwi9cWKa1s1kcbRCeCe52+VMxoyUyXyVUlwBEGTTa?=
 =?iso-8859-1?Q?ouzmcuf/Ij4oi6nBaRZ5eYfIPQYfyeVZN1hSta1LWhZqGHsRq+9KqSjIHi?=
 =?iso-8859-1?Q?LHHV5cZsFXdBGD0aeb3DA2xcSpc1akvRiw3bzoonkw1rMA9DPMHb/7DkNO?=
 =?iso-8859-1?Q?YCBbKuL6PRgZcIBJc+NietM/d49WoZQzXFCa5gyvthZm5xcwrrs+hG9D0T?=
 =?iso-8859-1?Q?gaFh4If7+NxsB1m879T7ODY17R5HLUWB3K/QwhnR22QmSDtYkXuhwNHFS2?=
 =?iso-8859-1?Q?nCYTT3LOH4d7+igYwRPT19BLa5dTFjA5PPRCpJZzDw0rzNWwP4Ccx2oszM?=
 =?iso-8859-1?Q?86Xl1xColGEMmCmLvesO1mrgDoD3tkn+33NcV7Gr85KiN1QtmKQtcfQ3M+?=
 =?iso-8859-1?Q?7+F6D+OgWcfskoMd7ELOuiJ64/Ro11eqNWZWyjoaBPKJfM1Cjq6nqrlZRL?=
 =?iso-8859-1?Q?YoMf34mWno09dGmf+KIO0hpPm/u/0GYSjscRYWd3PNzUyCLlXsvRqPZFZ/?=
 =?iso-8859-1?Q?eaaJEkAfjcGr07iv82y2XLQhKs3vmsiB3N9eyy5JLNC20nW/sw2t9oGIs5?=
 =?iso-8859-1?Q?Kmxr5wdLnBSyDMf0sNZ6LtqBxc1U+HUw+lunDt0jhSsWCD3iAHRWlBrzbc?=
 =?iso-8859-1?Q?kKghKuO5xT1Kyfzl5LcmCaehlF7vF6ylKEWi8dveuTNhGT3oGwRx6ns0Hn?=
 =?iso-8859-1?Q?jb4rKOAj9p6lGRdE+AXMLkgXz5Wtj4lZR1+YAz/0WaoGsgWJZ7q6z2GOPM?=
 =?iso-8859-1?Q?ib14rwqsfhgkirR5R0riOTO2H9XN9WDTwWCZFAoGrwIsgFPnDZq1NNj2Hy?=
 =?iso-8859-1?Q?AKzT63eFGCZ3maUrCmEOh19L3r4QI8YPjURUzeKqdRZIJL+2Os2Wv08Bkw?=
 =?iso-8859-1?Q?STYxCazeE3asMl7R2IC4FC4xk1l6ZWJOKcn6u9tB54Gi0zvakc6DPunGt3?=
 =?iso-8859-1?Q?JEvRE3IHrJU3GXjglNzn/H7dkRZLU1Zy2goBUN+PJ9r6ZM0Dl9h2eMfGJe?=
 =?iso-8859-1?Q?p9K94efm4125o7AifkLUX8wkEhYNQ3XJxIy5tJCCUw8h7MumUj3ukRYJg6?=
 =?iso-8859-1?Q?+GURMHing7OTRXWbGVlgychgphx62faB9H17Dw3kRTQOlZHc1Yp0XS6w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03575bd6-b49e-4ff2-3a68-08ddbe4dfe8b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:33:54.9912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rgkrk7SbY6g5Qyv7g22F9E0prRyCiidnxdBtrAOAiuPgMff3AfQSy2YTJpj1fNhH2pn8AcF8agfDYOXbwoeoxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7043
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

On Tue, Jul 08, 2025 at 10:25:47AM -0300, Maíra Canal wrote:
> Xe can skip the reset if TDR has fired before the free job worker and can
> also re-arm the timeout timer in some scenarios. Instead of manipulating
> scheduler's internals, inform the scheduler that the job did not actually
> timeout and no reset was performed through the new status code
> DRM_GPU_SCHED_STAT_NO_HANG.
> 
> Note that, in the first case, there is no need to restart submission if it
> hasn't been stopped.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 1430b58d096b03a78292e523e3ee7c5dddd7efdd..cafb47711e9b3fab3b4b4197965835197caabe9b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1093,12 +1093,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * list so job can be freed and kick scheduler ensuring free job is not
>  	 * lost.
>  	 */
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
> -		xe_sched_add_pending_job(sched, job);
> -		xe_sched_submission_start(sched);
> -
> -		return DRM_GPU_SCHED_STAT_RESET;
> -	}
> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
> +		return DRM_GPU_SCHED_STAT_NO_HANG;
>  
>  	/* Kill the run_job entry point */
>  	xe_sched_submission_stop(sched);
> @@ -1277,10 +1273,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * but there is not currently an easy way to do in DRM scheduler. With
>  	 * some thought, do this in a follow up.
>  	 */
> -	xe_sched_add_pending_job(sched, job);
>  	xe_sched_submission_start(sched);
> -
> -	return DRM_GPU_SCHED_STAT_RESET;
> +	return DRM_GPU_SCHED_STAT_NO_HANG;
>  }
>  
>  static void __guc_exec_queue_fini_async(struct work_struct *w)
> 
> -- 
> 2.50.0
> 
