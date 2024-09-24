Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D672E984BB4
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 21:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D414210E738;
	Tue, 24 Sep 2024 19:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K2QpNHkI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C5D10E737;
 Tue, 24 Sep 2024 19:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727206712; x=1758742712;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QcBuifv35zGL8iGiKAzhTJGWYG9Wpeu2XuAKuucHpY4=;
 b=K2QpNHkIj55ShzCqYSEiMCj2bx8XwpruhT+KVLVHmwqTPHA70UEKsHQY
 AyQnOIf4RM3Kr9YBa2ocWTSBj7hxJd42GxGaDWIcF+vqKvGV1B4YJuC/E
 4eS4PFlWvAkctFIxsD7fAK7uxV4jh2PZ5vYob22xK4DmYc9awiSLfsc6s
 npDHXlYUkOeSWnwg6FzBn+DgrYxIgIiCvjMIRNKEAgBnh7NOEwZFcNzmT
 nGpQEbrTJhmZxTpSXrBZLk/zH2g0t2MeuxF76s2F/uZsCgjsgYlirbxCD
 vqLT9++tJyIGrsqfzvd+vFbHJ4ECJg0hZFjEyaPF2pnjuwLAXKkDaEE/E w==;
X-CSE-ConnectionGUID: siKVKO9zTQm2wRAeVdllxA==
X-CSE-MsgGUID: MHbrfXA6QtuPg1XFYLwaUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="43700383"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="43700383"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 12:38:27 -0700
X-CSE-ConnectionGUID: soMB29E8RsSQAfA7838tCA==
X-CSE-MsgGUID: e3L/UUBVRxagyN63F0JvMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="76282359"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Sep 2024 12:38:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 12:38:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 12:38:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 24 Sep 2024 12:38:26 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Sep 2024 12:38:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbGOZ0iqHN3Bh6PBTqDqoGeMiBuGlIBUWcE408LOsM3kobesvNJrzmXFsbSGkC2GYEIxzbm0Xkeb6dxxwX06QdW0D8isA/SF+aGJDCZ+x8k5tvtk+yHbf1wVPI57+cPB0rlsl/B4IzfEWoYM6luWm5cwWHFMk6cSFobi4fEfE/A+jt9P2uV5gosqYP1U9D4IiHylttV/XEBQrhW3pUKrYV8HOz11YW/K3yEltSL+HEZ2LYq42ZB1aq0Z5BsV0GCpR/nG3FTO3V1izWWqwS+RTszhxKDIgjKtDgf5yyBx07PaUEYZHCqlaZCIhHH6yMvaRpm/CZm+KR1DIZocD73clQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2t39FWJbKGeYLMsywtyqJlzxEfaYMKqFkDQOPhxC7/Q=;
 b=GJUTDuUBgO4HOUAJnKqMpAOEqkFEqwiBjRJU/Afp/pYIUm74BDEDeXnpTvagnzxO6AbJcT3tnKeqEgJe3zGtK3AauEGx9E7TTvrSxWzKzz+X0eg07WidjTEAo5jb0RbN3u2JIapB5jdmlaDeXImQ6hCdZZThz518MmH2JJlZIZAr5qfdi8zplIPJNd0MzZitrk/M/Hx1jZf6XtTgDgpNeiY0MvHqfZnjHnWGGXnItbcgWqSsYRc8cu/woTJimQjrD4Wy0XAliG9uP+L9apeqYDofVjbvFCVULPrB5/KzFIdliUG5BDXjX0Lhk4ydbPWeUR6+4fdgXHsxIDAbv5vA9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7563.namprd11.prod.outlook.com (2603:10b6:510:286::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 19:38:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 19:38:22 +0000
Date: Tue, 24 Sep 2024 19:36:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <matthew.auld@intel.com>,
 <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 00/28] Introduce GPU SVM and Xe SVM implementation
Message-ID: <ZvMUtdUcsJEDBsbu@DUT025-TGLU.fm.intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <ZvKDUR3mSMEnQYeM@phenom.ffwll.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZvKDUR3mSMEnQYeM@phenom.ffwll.local>
X-ClientProxiedBy: SJ0PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: 480c0bee-c832-417c-7001-08dcdcd072f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?58ql94FqaAsr+GnkEcSs3QJRyqJsCCKljDwmK3sQjAT1k+09ImGMEYmFdm8e?=
 =?us-ascii?Q?BMBBrhbMmaqDqVWQSWLmYt7crs3nkCvH3VEKiXAsHuSGWMHXCosIpLeL/8ne?=
 =?us-ascii?Q?ZvUgesg4QGErjr4BBVkRhG9Gh6M7XK98QprFkOsCw/hJzpQwGFY+a/zxFSqW?=
 =?us-ascii?Q?22AoJv1QWcvWolphhWzf1lEdU1Lf3m2F5Xp2cQza1UcF97LB9eA1/yghrflb?=
 =?us-ascii?Q?AnRHZfvmnimdQw9jBaDfB3SnG6pphv5/mxwj8Vg2fOiBqQwj2zx3vNxtcj9J?=
 =?us-ascii?Q?tEycz4Qe5fQRL7deNM1CR1Ej8Zny2obfmyIWF0yXZq7Z30SIu09gNE/M32oe?=
 =?us-ascii?Q?Ryc6IQw0yZx+MYCdxAW6Uj4OtpZjn42G0aECPx3rKcFgmViQeau0O8Eb6PYA?=
 =?us-ascii?Q?f4C5yxwBXWKekUo0Ua18USCcOs0gkk8PK8njuc5jXFI+JfF9VVFHj61YqYIU?=
 =?us-ascii?Q?0zUeLNRTMq0Sn3uHgxr00Vxwt+IGpCoHBGPojZuJBeUwK/HUcRO5ESZY5712?=
 =?us-ascii?Q?uPanmsNP496xQ4qJ4UD+wXf+7wybznd0kNn0ZlNUu1qLU0CqQmFL58/6GDQF?=
 =?us-ascii?Q?nIqUgqfGeNz1nGfK8U+gmZ/Uv/3jpOLTIeEWQjqj0T/EVrLZwq/J8R09GkmS?=
 =?us-ascii?Q?VDTRozCMCzA0NLCj7KxOq+DcxENDM0/uWFoessIlpndhWFC51/bwr686UcD/?=
 =?us-ascii?Q?/tQMyki0z26CVZxdjCtncoDPPxbLRzMre8mUoDdmb0BfhlQ+aPz+hpfs9sM6?=
 =?us-ascii?Q?V2r4vE+YwCFRsSc5bPHKnGjv2fFIVh6J9CDdpzShw1CtcIDX5WQqk/uGysX2?=
 =?us-ascii?Q?67qXkjSf0gTd5aByqvlRmyaJOjdkyz3FqjD0f66ZTAqlBWD39NR2wAX+vU07?=
 =?us-ascii?Q?oGYYI8714LsEBhOpnH+kwkvsziKgNQG9x9IABBMpGGtbHboys/fmbJwE88aZ?=
 =?us-ascii?Q?mDUv2sQWa1ypHMfRVb97ryLn6M/AMwmzqdLqDfRSLcKEJoKRRMUSeoPyusj1?=
 =?us-ascii?Q?LaMthgnVH13k32tl8yU5a2340aVj64qTFMh6x0E0mobglX3q/jYkIbjdJDgO?=
 =?us-ascii?Q?+FK2kk+2oy3UB2gcfpaE3lUSl31wLr/z+51qG6en1npvk+JUqEAumhC7ahpy?=
 =?us-ascii?Q?MnQCP5/CqETLJeuuju0be+rPMaOfzn6qfeR+jJxVyHZ4HHFckhRZssib/XLV?=
 =?us-ascii?Q?QRGg2CsL9ht4Ly0hcD6g2jU7B3SKYK4w5BlgnQa4ExuQ1Q/qjdjEMH5izgMY?=
 =?us-ascii?Q?E0Zsmd4lZFhgLNxg+XzIeO6eKh9GbBiaNiUpDV05u1+jjkPEQ6PV0B8fy8O3?=
 =?us-ascii?Q?4jg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vjp0zjUucaxDK6GtO2yo3v1s4bbgN0WsHD+Ai0/uTcdzEr41X/oIX0HT60bY?=
 =?us-ascii?Q?wkZ10DS8MBNnBfSjzOTTHQsScii6VbMdWPzcY3ypQ+OWeAE9C2kq77of+Mv/?=
 =?us-ascii?Q?PaFjAYgyklEX3pykMvEdPqF47kLvavseFbXmtAgh3Mf3ZyQTMdVIguee2RBP?=
 =?us-ascii?Q?f9kJhSiTrDXVX+hF+/WtcVtR0tjV/2ZdVWeF4pWpcvT3K3Nr+sao8mnFPX8d?=
 =?us-ascii?Q?7pZ33Ju9gl5NfWlxqr55sZ94OxIEBYdeH8ugfh8nxbxkiT7UBWQ/xJ5zNWdN?=
 =?us-ascii?Q?0QG2ArKwEaI+pJLiW/PqOu3dLvlbvPutTgIw4xZXIJbBF8uWXxGKzt3R7Vib?=
 =?us-ascii?Q?/SEpnaiOIg+cW6mh3RMO4GP+tLl7xEsme2x1JGF7W4KRCFEPA3ISdQ/RX8A2?=
 =?us-ascii?Q?+HlXMEodfrCVGrtlrsiZuTy0zjGmDXclXzcuYYEyTaJv2/wrgMb5zZj6B9uV?=
 =?us-ascii?Q?3pBj4gpDQisl9uYnBHMBhU1JnVifZguO6iyH9R1wZC8y9rGKbtUykdPtXhHC?=
 =?us-ascii?Q?fkqFfgFgUz21JWvjZUGGFLDdOgm0hd1yymPKehs1a5szQ2bhfaqC1k2aDmuA?=
 =?us-ascii?Q?+y6pKF0s/v4IcLs/TG3QbAQjecavZ9RcJPEhU7BfG0tp6P4UbS+5/QTmWFqa?=
 =?us-ascii?Q?rpJBkmw8fvCHwgW1DBffuF7nv6C9I4Vb+G6YwbSdjs9+hTlsnyZ09cDv0ibt?=
 =?us-ascii?Q?Qz6xnldQm0V1RxHSIbP/cY7kWKTZX/Mn4LDQXf5O5LV9GhW9qXpKFH3KQtPy?=
 =?us-ascii?Q?1soCQulAhmcg8IJqzg4gsJ1lXZqldjYlKFa9omCQqJSm/zpRCwmAwThLtGQo?=
 =?us-ascii?Q?isTPNVrijoWD4bTGcqNuRUTNVGDYnNIaXGF0ifmGFP2krffwJCmHwzKwlgWw?=
 =?us-ascii?Q?QM/YxQljurOBBEJf3RQUFpl2ZJ2yyztYVWu2eYDq/llA1Bz6dF9gV4heYo8i?=
 =?us-ascii?Q?iuCSp1oSFGuimLxF4OLSBTfbHsran+ufyDnRFNUxuHerKI8zBFiLnfRedNMn?=
 =?us-ascii?Q?dozxMQd8ZvHkgfRkVSS8/QVHP3Q17WJWEfH4UWMKLgDa1y3b+gM/wadwjeKm?=
 =?us-ascii?Q?MnTOMF0U+vArQGlryi1rCiUovWeDNn33NwDvFMEjkkbcwkNuTzl9jjf1+PlN?=
 =?us-ascii?Q?o63dH3yG2SO445rtJYUcuovcAI9AKh1YyFy/6Kv5v5kiDFbb85C6QuC4Q7ze?=
 =?us-ascii?Q?VWkmWXzTS4zBpgvPvaQb/AzI/DNEdoplRFpo2YBcVdtFVugi/jjcqA7moTtp?=
 =?us-ascii?Q?SRRrLjSMC56dXwdxLhUYIX0sF4Vzm3A4cDNue9UtL/43h6j32Km8H6HS8Xc/?=
 =?us-ascii?Q?PAcpktWGRpU+z5/9l8WFw2Ku0OsmiWx1MNfGxFaITn4U+AfLDzH91a4uqKhr?=
 =?us-ascii?Q?fU7HM5QtVvnviuNv5hLjnachfa3rYY1dwWFjzuJjClCpTKvjGLDsg8MgKGf5?=
 =?us-ascii?Q?ydB9dcaRWazOEF5HpjLjYC1p3n+RKLZRjBD0Z8eD+fH3iHCTzTw+WD0AmFzy?=
 =?us-ascii?Q?PZki3fl30D3DRZ2z/RniXAI1ZNARaRy7zG80+OBcVKLnU/gotu/946YargtC?=
 =?us-ascii?Q?e7dqxE4yyH+P1PvOK7uLRCrr5BsdYHqd6LcSYaW1znGaW6MCPfYMheEaT73r?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 480c0bee-c832-417c-7001-08dcdcd072f9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 19:38:22.2051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MnMAYr7OLbroo7qwcgZgR4yTvfU4V86rz4cbLs2RqNj50GE3Tn+K41ts0MK7N1/A2RSVATnuTSP1lijVL0mgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7563
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

On Tue, Sep 24, 2024 at 11:16:01AM +0200, Simona Vetter wrote:
> On Tue, Aug 27, 2024 at 07:48:33PM -0700, Matthew Brost wrote:
> > Continuation of SVM work by Oak Zeng [1][2] based on community feedback.
> > Introduces GPU SVM layer and new Xe uAPI. Supports GPU page faults for
> > system allocations (e.g., malloc), runtime allocations (e.g., binding a
> > BO), migration to and from VRAM, and unified eviction (BO and SVM VRAM
> > allocations can evict each other). Fully tested; more on this below.
> > 
> > The patch breakdown is as follows:
> > 
> > 1. Preparation patches already on the list [3].
> > 	- Patches 1-3.
> > 	- Please refrain from reviewing these here.	
> > 2. New migrate layer functionality
> > 	- Patch 4.
> > 	- Required for eviction to avoid locking inversion between
> > 	  dma-resv and mmap lock.
> > 3. GPU SVM.
> > 	- Patch 5.
> > 	- This is what needs community review.
> > 	- Inspired by GPUVM.
> > 	- Kernel doc should explain design principles.
> > 	- There is certainly room for optimization of the implementation
> > 	  and improvements with existing core MM interaction. Pulling in
> > 	  pending DMA mapping work [4] and additional core MM support
> > 	  for SVM is also likely desired. However, this serves as a good
> > 	  starting point for any SVM discussions and could be used as a
> > 	  stepping stone to future core MM work.
> > 3. Basic SVM support in Xe (i.e., SRAM backing only).
> > 	- Patches 6-15.
> > 	- The uAPI in the patch could benefit from community input.
> > 4. SVM VRAM migration support in Xe.
> > 	- Patches 16-23.
> > 	- Using TMM BOs for SVM VRAM allocations could use community
> > 	  input. Patch 23 has a detailed explaination of this design
> > 	  choice in the commit message.
> > 5. SVM eviction support in Xe.
> > 	- Patch 24.
> > 	- Should work with exhaustive eviction [5] when it merges.
> > 6. Xe SVM debug / tuning.
> > 	- Patch 25-28.
> > 
> > Kernel documentation and commit messages are relatively light, aside
> > from GPU SVM and uAPI patches as this is an RFC.
> > 
> > Testing has been conducted quite thoroughly with new IGT [6]. Various
> > system allocation types (malloc, mmap, mmap flags, huge pages, different
> > sizes, different alignments), mixing runtime allocations, unmapping
> > corners, invalid faults, and eviction have been tested. Testing scales
> > from single thread to multiple threads and multiple processes. Tests
> > pass on LNL, BMG, PVC 1 tile, and PVC 2 tile.
> > 
> > 1. Multiple GPU support.
> > 	- This is likely to follow or occur in parallel to this work.
> > 2. Userptr unification with GPU SVM.
> > 	- This is essentially designed in my head (likely involving a
> > 	  few new GPU SVM layer functions) but would require some fairly
> > 	  invasive changes to Xe KMD to test out. Therefore, I would
> > 	  like GPU SVM to be reviewed first before proceeding with these
> > 	  changes.
> > 3. Madvise and prefetch IOCTLs
> > 	- This is likely to follow or occur in parallel to this work.
> > 
> > Given the size of the series, I have pushed a GitLab branch for
> > reference [7].
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/128910/
> > [2] https://patchwork.freedesktop.org/series/132229/
> > [3] https://patchwork.freedesktop.org/series/137805/
> > [4] https://lore.kernel.org/linux-rdma/cover.1709635535.git.leon@kernel.org/
> > [5] https://patchwork.freedesktop.org/series/133643/
> > [6] https://patchwork.freedesktop.org/patch/610942/?series=137545&rev=2
> > [7] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svm-post-8-27-24/-/tree/post?ref_type=heads
> 
> Ok rather late, I wanted to type this up 2 weeks ago or so, but alas here
> it is finally. I think with all the experiments and discussions I have

Thanks for putting this together and all the initial reviews.

> fairly clear understanding of the really tricky parts of svm (thanks a lot
> to Matt for all the work done). From my side the key points, sorted
> roughly in how important I think they are:
> 

I've read this through and pretty much agree with everything here 
so won't have a detailed response to everything as there isn't much to
say aside from I agree. A few minor comments below.

> 1. migrate_to_ram path
> 
> I think this is the absolute center piece of making sure we're aligned
> with core mm and don't suffer from deadlocks or livelocks fundamental to
> the gpusvm library design. So this part imo needs to be solid for the
> first version we merge. But of course any core mm changes Matt prototyped
> shouldn't gate merging the drm side since they're nicely decoupled, we
> only need those to validate the design in testing.
> 
> I think the key points are:
> 
> - we rely on the migration pte, temporary page references and page lock
>   only, which with the core mm changes Matt worked on gives us guaranteed
>   reliable migration back to system memory. And we need that, or svm
>   essentially becomes unusable as a concept.
> 
> - we need to support partial migration, including the worst case fallback
>   of only migrating that single page core mm managed to trylock for us
>   while holding the pagetable lock.
> 
>   Since we have guaranteed migration back to system memory we can make the
>   assumption on the gpu fault handling side that we will only ever handle
>   ranges that are entirely in vram (by throwing any partial migrations
>   out). Needs a retry loop for that in the gpu fault side, but I no logner
>   see an issue with that assumption on the gpu fault side otherwise, so
>   not needed for merging or even later until we have a driver that
>   requires partial vram support.
> 

I think pretty quickly we will add partial vram support / mixed mappings
but likely will not be in initial merge.

> - no other driver locks related to that memory range in any way are
>   allowed, and ideally we also test with the forced fallback to mmap_read
>   lock in do_swap_page removed, i.e. calling migrate_to_ram with only
>   holding the read vma lock. Of course driver locks for blitting are
>   allowed, it's only locks related to managing physical memory which are
>   problematic and could result in deadlocks.
> 
> - the drm side must uphold the guarantee of not having elevated page
>   references whithout holding the page lock. Otherwise there's a race and
>   we cannot guarantee migratione to sram.
> 
> - also through the try_to_migrate maze we'll hit our own gpu pte
>   invalidate paths, so there's some requirements there too. But I've put
>   the discussion for that at the very bottom, since most of the gpu pte
>   locking questions are imo not that important, and definitely not
>   important for the first version we merge.
> 
> Everything else below I think we can sort out post merge and just need
> rough alignment on the design.
> 
> 2. eviction
> 
> Requirements much like migrate_to_ram, because otherwise we break the
> migration gurantee:
> 
> - Only looking at physical memory datastructures and locks, no looking at
>   mm/vma structs or relying on those being locked. We rely entirely on
>   reverse maps from try_to_migrate to find all the mappings on both cpu
>   and gpu side (cpu only zone device swap or migration pte entries ofc).
> 
> - Partial migration needs to work to make sure we can get out of any
>   low memory bind.
> 
> 3. gpu fault side
> 
> - We can only rely on mmap_read for hmm_range_fault. And ideally should
>   assume that's not held anywhere else since with per-vma locking I'd
>   expect the mm/vma locking will move into hmm_range_fault. This also
>   means no looking at vma beyond just passing it around as currently
>   needed by core mm functions.
> 
> - Big retry loop to handle all races with the mmu notifier under the gpu
>   pagetable locks/mmu notifier range lock/whatever we end up calling
>   those. Races (especially against concurrent eviction/migrate_to_ram)
>   should _not_ be handled on the fault side by trying to hold locks
>   instead.
> 
> - Long term I think we need to be able to handle concurrent faults, even
>   on hw where there's only one gpu fault handling queue. For performance
>   we absolutely want to prefault aggressively, and that likely happens
>   through cpu ioctls that are entirely independent from the gpu fault
>   handling.
> 

I agree the long term goal is handle concurrent GPU faults and with a
bit of finer grained locking in Xe I have already made this work. The
biggest part which needs to be parallel is migration code which is
taking up roughly 98% of time in the GPU fault handler for a 2M fault
with a split of 90% in migrate_vma_* function and 8% in the copy job.
I've seen tests which mirrors multiple EUs from the same process taking
concurrent GPU faults have large gains in perf. Also the CPU fault
handler is concurrent so it makes a bit of sense that GPU faults are
concurrent too.

GPU faults being concurrent should also enable concurrent prefetches
from CPU IOCTLs which also is likely desired.

I'm not going to include this or any of the other optimizations I have
worked on in what I try to merge initially though as I want to keep this
as simple as possible and also don't want to throw more code at the list
until a working baseline is in.

>   Short term enough (driver-side) locking to make sure this doesn't go
>   boom is enough, I think just some design goal documentation here on how
>   to achieve that is all we need.
> 
> 4. physical memory to virtual backpointer
> 
> No. Doesn't work :-) Also it's only used in in the eviction/migrate_to_ram
> path and I think Matt already fixed this all anyway.
> 
> 5. gpu pagetable locking
> 
> Or mmu notifier range locking or whatever you want to call it. Like on the
> cpu side this should _only_ protect the pagetable entries and additional
> for us mmu notifier seqno tracking, nothing else.
> 
> Any races due to concurrent eviction/migrate_to_ram/gpu fault/prefault
> need to be handled by retrying outside of holding the pagetable locks. If
> we try to impose additional consistency guarantees we'll fall over and
> have a livelock/deadlock fight with core mm in migrate_to_ram. This part
> is required I think for the first version, but we already need that anyway
> to make migrate_to_ram work properly.
> 
> For the actual data structure/locking design I think anything on the
> design line between a single global lock and the radix tree over-the-top
> scalable per-pagetable (spin)lock design of the core mm is fine.
> 

I've seen the bind step in servicing GPU faults take barely any amount
of time so having the GPU page tables protected by the VM's dma-resv
lock seems fine in Xe. This really is up to each driver how it wants to
handle this too.

> The design here with 3 levels (mmu notifer, range, struct page) wouldn't
> be my first choice, but clearly fits on that line so imo is fine for
> initial merging. We might want to make sure that the range locking (I
> guess mostly relevant for the invalidate side, drivers don't see much
> else) is somewhat abstracted so we can easily change that post-merge, but
> not required imo at all.
> 
> For consensus documentation I'd recommend a todo or design documentation
> patch, where we put down both the current design and why it's like that,
> and some of the longer term goals. Then get that acked (imo needs at least
> one other driver that's seriously interested in this, plus I think an ack
> from Danilo for gpuvm interactions), then merge that. SVM is tricky enough
> that I think this would be really useful to make sure we're not
> unecessarily stuck in limbo.
>

I'll include a TODO or design documentation in the next rev.
 
> From my side again I think the only part we really have to get right from
> the start is migrate_to_ram. And I'm confident we've got that now really
> solid.
> 

I think most of all 5 points will be addressed in my next rev. Anything
that isn't falls into an 'optimization we can do later' category which
the design should be coded in a way these optimizations can easily be
added.

Matt

> Oh also you need userspace ofc :-)
> 
> Cheers, Sima
> 
> > Matthew Brost (28):
> >   dma-buf: Split out dma fence array create into alloc and arm functions
> >   drm/xe: Invalidate media_gt TLBs in PT code
> >   drm/xe: Retry BO allocation
> >   mm/migrate: Add migrate_device_vma_range
> >   drm/gpusvm: Add support for GPU Shared Virtual Memory
> >   drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATON flag
> >   drm/xe: Add SVM init / fini to faulting VMs
> >   drm/xe: Add dma_addr res cursor
> >   drm/xe: Add SVM range invalidation
> >   drm/gpuvm: Add DRM_GPUVA_OP_USER
> >   drm/xe: Add (re)bind to SVM page fault handler
> >   drm/xe: Add SVM garbage collector
> >   drm/xe: Add unbind to SVM garbage collector
> >   drm/xe: Do not allow system allocator VMA unbind if the GPU has
> >     bindings
> >   drm/xe: Enable system allocator uAPI
> >   drm/xe: Add migrate layer functions for SVM support
> >   drm/xe: Add SVM device memory mirroring
> >   drm/xe: Add GPUSVM copy SRAM / VRAM vfunc functions
> >   drm/xe: Update PT layer to understand ranges in VRAM
> >   drm/xe: Add Xe SVM populate_vram_pfn vfunc
> >   drm/xe: Add Xe SVM vram_release vfunc
> >   drm/xe: Add BO flags required for SVM
> >   drm/xe: Add SVM VRAM migration
> >   drm/xe: Basic SVM BO eviction
> >   drm/xe: Add SVM debug
> >   drm/xe: Add modparam for SVM notifier size
> >   drm/xe: Add modparam for SVM prefault
> >   drm/gpusvm: Ensure all pages migrated upon eviction
> > 
> >  drivers/dma-buf/dma-fence-array.c    |   78 +-
> >  drivers/gpu/drm/xe/Makefile          |    4 +-
> >  drivers/gpu/drm/xe/drm_gpusvm.c      | 2213 ++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/drm_gpusvm.h      |  415 +++++
> >  drivers/gpu/drm/xe/xe_bo.c           |   54 +-
> >  drivers/gpu/drm/xe/xe_bo.h           |    2 +
> >  drivers/gpu/drm/xe/xe_bo_types.h     |    3 +
> >  drivers/gpu/drm/xe/xe_device_types.h |    8 +
> >  drivers/gpu/drm/xe/xe_gt_pagefault.c |   17 +-
> >  drivers/gpu/drm/xe/xe_migrate.c      |  150 ++
> >  drivers/gpu/drm/xe/xe_migrate.h      |   10 +
> >  drivers/gpu/drm/xe/xe_module.c       |    7 +
> >  drivers/gpu/drm/xe/xe_module.h       |    2 +
> >  drivers/gpu/drm/xe/xe_pt.c           |  456 +++++-
> >  drivers/gpu/drm/xe/xe_pt.h           |    3 +
> >  drivers/gpu/drm/xe/xe_pt_types.h     |    2 +
> >  drivers/gpu/drm/xe/xe_res_cursor.h   |   50 +-
> >  drivers/gpu/drm/xe/xe_svm.c          |  775 +++++++++
> >  drivers/gpu/drm/xe/xe_svm.h          |   70 +
> >  drivers/gpu/drm/xe/xe_tile.c         |    5 +
> >  drivers/gpu/drm/xe/xe_vm.c           |  286 +++-
> >  drivers/gpu/drm/xe/xe_vm.h           |   15 +-
> >  drivers/gpu/drm/xe/xe_vm_types.h     |   44 +
> >  include/drm/drm_gpuvm.h              |    5 +
> >  include/linux/dma-fence-array.h      |    6 +
> >  include/linux/migrate.h              |    3 +
> >  include/uapi/drm/xe_drm.h            |   19 +-
> >  mm/migrate_device.c                  |   53 +
> >  28 files changed, 4615 insertions(+), 140 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.c
> >  create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_svm.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_svm.h
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
