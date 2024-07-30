Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F2B94232B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 00:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA34810E346;
	Tue, 30 Jul 2024 22:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T5PeZuwm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A0210E346;
 Tue, 30 Jul 2024 22:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722380268; x=1753916268;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NrLyx3DeuKu46JXp1OE+/SxpOOyPryy2rVLSqbgzQgM=;
 b=T5PeZuwmcGnxe5vsbcCah3qmiy00O4ygD4LFwWb5i4N75XZydFKue3nK
 OTc0V52LiJW246Et62gCjwtiZrA8BobO8vOgXZ7wo/QxYi5g4Kr/1GbTE
 UuFADHw8/XDE23hQE6hJVrYf/p8WVsP1iM5ZQ1R1DsuJZAH6+axLVrz2l
 YguMfDSsJ9lNOLKGX8wUdtoWPAiQA3/dzLuwABvYdR3bTVGa0/GJG1njw
 izhRjHmYwKDvQT0fFCJw89OTeecQUxSd+BkVZHcEhyppzUkcjXLnSGxJN
 6VJo/Jz1XAtpZoqwPBafb9JfRLKkdy4q6Lxr7G3fo3frh0kbBnAh+v/el A==;
X-CSE-ConnectionGUID: Bt2AxTjuQmCcOQnSYSGeWg==
X-CSE-MsgGUID: V1sFEVtsQG+RRnYheaPj2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="24023971"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="24023971"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 15:57:48 -0700
X-CSE-ConnectionGUID: 7Vfvph+SStKghoOGccbRcQ==
X-CSE-MsgGUID: rQY3mDl0T5+5gg+yGtkGOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="55295218"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 15:57:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 15:57:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 15:57:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 15:57:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 15:57:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZLjuh4aitBgVLV0lFZ6vYDXNT8psBum1Rl5Wp1FVvYR4OuCcSG0s7zAVCvV1kvbgNAjSFLireSe9gZCc70pFXCrCuNK2x/dzpp7mjRhrv0/HpjXayK+oEwTSM/UJHBTBQyyPcDP2dHndvF6TuRTLiytUEj2iLu468xNg74XAz+mQil1efsHr4L0HK78gL9v7BmJn7kYbwD8v+ouQL6ULD1RFGq1P781hcXEoZmAiQN/Y8W0BSdHx1p4yygNJvcSFWcSRmaFXALC/l6CWmp3l6imEoEFPAKqOTnPClNSnAqa2wSCmHhLqoGJ0Yia6vqKntONHOib24czonKn0lX3pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VO6PmPJLwagNeBoeazLE6OZk6AisJrG7etZ87IAZWHA=;
 b=QjL5+wNgCizFYJeeaQxlylofnFbPmYVKR3/327CYwVdHQjiQoUmhTts29vafp2AIDNg3CM9lsBkchlxsMN73g3oQNnimz+8RUO6zWHfMWOAC7qK1pAUJByfWDse2a1pi/djqL6mZVH47zm+KS94jL20o8cKhA61CDIkusxgqK6hyn0E0wcuhXB7XlGS89RAxrtLMMF04x4hnWouhAzC1R2Mp5PnY7ZQK0qNNTPIzfQ4PNbhnRoS/ngEZEfonUaKTXnwtWc67bYGQ1GEq2HsD8F/Dor1NTTNvvxZVCs3/+UwQAG7GWH94m5siWjt0PZ0zctV+BPm9VsCMcdEbLLbsHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6277.namprd11.prod.outlook.com (2603:10b6:208:3c3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 22:57:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 22:57:43 +0000
Date: Tue, 30 Jul 2024 22:56:52 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejun Heo <tj@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <jiangshanlai@gmail.com>,
 <christian.koenig@amd.com>, <ltuikov89@gmail.com>, <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 1/3] workqueue: Add interface for user-defined
 workqueue lockdep map
Message-ID: <ZqlvtJs6lmEwqgzv@DUT025-TGLU.fm.intel.com>
References: <20240730221742.2248527-1-matthew.brost@intel.com>
 <20240730221742.2248527-2-matthew.brost@intel.com>
 <ZqlqYLZWCiLKhVJf@slm.duckdns.org>
 <Zqlu8gq2d8mtn7rC@DUT025-TGLU.fm.intel.com>
 <ZqlvkdIoZAkVrvvx@slm.duckdns.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZqlvkdIoZAkVrvvx@slm.duckdns.org>
X-ClientProxiedBy: SJ0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6277:EE_
X-MS-Office365-Filtering-Correlation-Id: 4756a05b-b387-4561-1e4e-08dcb0eb055f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4LQ9CFcuFgFvEDG4UsdR4Z3oT5e9+og/NwW9Qi1RciUBm9HxgLl9moZUTTU6?=
 =?us-ascii?Q?qZ/qS5ciNLFa4w3Vas8cHxoYIplHpbK3XrhuONJ9/xcW73T/ji9MVkfbEcmJ?=
 =?us-ascii?Q?KVwO763RSsCiLYVRXjuLSqNAo4hNaxvuanfsog+qN8HyPdJKzK/iVaVs1ueB?=
 =?us-ascii?Q?cDuxOr84Y3zaJVJt9pjxn7Q8E64kLCz23rLv/G6g4pM1Lb4g4u9nKhPCiND9?=
 =?us-ascii?Q?7Sb1dJYDOWmFFiiuW5JxwFH+RTXNiFX/SiwmbHNyFWg8W0vRR6AC7gtNOlVx?=
 =?us-ascii?Q?Zv5sRcxmwYy9rRcSOBQMrzbVrV+mO1f6Pt6aHTCnIfvqlYcWsImB1T1i3fDr?=
 =?us-ascii?Q?KasF7wttJk5srGnVOtpRRsCbPXGqLxWEBzyYO1k66HiYnAUJ+a9CA1sQxxtV?=
 =?us-ascii?Q?lVBItjHI6ukCA6XLTewtLifJpWNqBz2mXu6MWGFFxUYt535v10yKd4/XZkzU?=
 =?us-ascii?Q?pE5G6RytpbQhupQPAPYUOcO4Bm4z68973ZUz1eVaPCWPTd9cXWsfM76Iz/dM?=
 =?us-ascii?Q?jl6L7NVFwrdBRgKkDvw761wptct5YoD07DzaUQRIzyEG+FoxtBPu1ejwqlg6?=
 =?us-ascii?Q?8+N93qYU4707oR4v1NQHpwjOO5gV7hh0z2CXJIy/lT1SsUNIUNL5mIisn9s9?=
 =?us-ascii?Q?Rnva74qFPsQTOjwxP63fIuIROAWMB4BtIHnATMsia5KnOkl5JoveCUl4h5gv?=
 =?us-ascii?Q?1zF9Sh3cBgTXxvBhuSe02EUejapzD+r3rtMhfY72Qa+u+YljLHi9R43pHCHR?=
 =?us-ascii?Q?p0wDyfY7eV+yx/gjDIR/X3C2zOoXL/yRrUp0Zt5JyRwZYBJZVdlm0eHkG+L3?=
 =?us-ascii?Q?69rVfWiy8l9lrMJG/2YGWLRZCZh6WBVYcIv3sM5G0LxQzoUOD9vDwSGuS6yH?=
 =?us-ascii?Q?44buJQh2Tksp9zB+pWtnRSxQHGzZZ28Im2lY4HLiWaGakRf0vCO8bh6rcGBn?=
 =?us-ascii?Q?eF+U1l+KABJ85hQ1bRLkS2vbLRcvClUK92JLAyslVjn8CNPnTIpvPYBucKO/?=
 =?us-ascii?Q?V4ZdYc8VeC/ZjFj66Wof4XuroM5Niese3fcJEBZEtAnqSY5HPdigxUe4ozKT?=
 =?us-ascii?Q?LS2/e3CmDx5b4DyWX0b/A6Y7zneFsrj7EkmohL+tauQBI/sSwS0I2ALISbSN?=
 =?us-ascii?Q?TrjFSVQ4nlVdNhkbU374NGwGbZI6puAxzdoWEmaDBBg2FbzJk+Vai3slnqOl?=
 =?us-ascii?Q?9vE03SEa56H4aoGMBiEEFAZ1XWgzJYodZ46RySdOS4xKVeYKXjU6YvDQHVpN?=
 =?us-ascii?Q?GhOPluYbxZrfQbkgjIPlKHLGF5qoNzftITH2uy1GFNHP0kqnIIpUD3Bk1yi9?=
 =?us-ascii?Q?oXwHGx70x71LX5g0e5emUry39enEnnl+Gh/0VtAFA/5M7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7ZUEw7/3ifsoVkGDSGeR5fqEy7fxuD+yt3761QxYh2tOln7QtpSqXobiGN3C?=
 =?us-ascii?Q?RnO8GO7pvdiSOB5yDM0x4I1HypBWGS3/Sl3hJ1EuZozbS+Le+WaEvVIMnRoR?=
 =?us-ascii?Q?xq3WD5AD4x92+DB82xe5OpdF683zau6R4+Yvjz7O0KuZVA0Gy3cjXye/3zV1?=
 =?us-ascii?Q?nlapedZ37PV5Wi6wjoDjuSXRTTR9foAZeJbsSctZohsu64bEkqIke9gVlpLE?=
 =?us-ascii?Q?SBPA216IK7F+NBUCzOjWu4NUIBok8ShhBE+QaZtDEZGO6syh6P7esSgHNGZr?=
 =?us-ascii?Q?Xr1mU1U+K8ejwU7HyhPU/kcsxEFrX8bOm98F/a8CvJjuk9inQbbL0rQ/+R8k?=
 =?us-ascii?Q?OAjmDs6qw8WGf6DAmpNWOAamM0uYmntDQc9v44o1cKPPtOrXW8CsoA22r2x9?=
 =?us-ascii?Q?9suGG0jyXqn0alcEjcpuNjQKzLXDQFKrkTjKVXJBttZv78xEQ+zPFNgMmaQJ?=
 =?us-ascii?Q?s5T+akSkX7Zu8h+LZRVFT5wLPmAU54yW2aJEUMTovz44Tp1R/zfq/oO2If2G?=
 =?us-ascii?Q?1fCckIO8jyjNDzsTpTuBESS08GSYYpu9vs7m3GsgkhZxhJO8KiRz2CXps68E?=
 =?us-ascii?Q?vDAsO6HkfL+rCGg8t0/FBdmGHDL7Y/sBh2KgvoqUELcr+Gav/qogRFUFeiAq?=
 =?us-ascii?Q?MMvAVdiXCmomNLkERZcf59cGUk+TgtcvbB3UxayJ2aXZGsWsEgG1COSHDNlR?=
 =?us-ascii?Q?M7H6TIrz42PpJirObt+QRxiWc6YVtw3dcsck0+18s4NUfmC+d6cCccpd0IC1?=
 =?us-ascii?Q?4aKdz+aNF/J/tIvHcw6h8RDGoA+eVbnLJNLCaI32QXzwW78LgZ5uivxKPLf8?=
 =?us-ascii?Q?atx9uXBqeINkzsNvTJ8ksmy+0LQGEE8JFHD2KaLXKdYOck1ckKz9gWl52bxh?=
 =?us-ascii?Q?U/SxiUUQWNghxt1cbWTlR2DvlMNuH8X7fG9pH2BB7OrtKUbgv+307E0Bcf87?=
 =?us-ascii?Q?XvQQfeOiw2wj0lJpbfMHswmxQHQ90p4Rx6tIHH+atZuHYdSDWceWQUKUuvoH?=
 =?us-ascii?Q?XecG0QQ2Bc4c1jGsVqnLTklCDvzMu0eyEyyMpZCp4EiSjRycG4GhAVDCeAvc?=
 =?us-ascii?Q?+UczYblKnbTDjkG+8x5hN/5PvUFEpgI1IrT8WTAlbMH/QLejAf9kzG6irAFS?=
 =?us-ascii?Q?UwkWhcx52YLAxO3Knz4c7AfF+bWOz0OqqThPVbsimmZy86rDtVk4Et7l5W5v?=
 =?us-ascii?Q?7RKFW8w4a2afjwByEOSGhNHZiOo7AGVVhlDDRjjivFxIiCTF8bOuvkcfFXiy?=
 =?us-ascii?Q?DONcXozbqke3Xh8yJ+hBpQb8wiLzQ+gzQz3vsZ0DGTcYOhkABorTZk8UqGG1?=
 =?us-ascii?Q?kmy/nwo5GoLUaR8KjLpId/TZW9j0JpOR/gCxu2U8aMCf/QgOPqz48/PcVfEA?=
 =?us-ascii?Q?L5sahcfexQQrd9t53GgA6pnfV8Cxc5fcMeDDIEmDhXtaWEQXS9VjhVbPgYZ3?=
 =?us-ascii?Q?2ZNxJqT2rah+vSU1lA6IUCGlWQM3/m2bQ07jIrsa3YwKYs86fCVgM+Io2J1y?=
 =?us-ascii?Q?IzYqNGkfkTTxY0OP0lyKypclEbLFlzvPADUP2AuwWYiXetptk8qVEyjFxKbb?=
 =?us-ascii?Q?BD6PBvF9/eMexRI24MKilU3JU3tPrmJeH9sSmXAkibvrDnSG/oYH+s4dle0h?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4756a05b-b387-4561-1e4e-08dcb0eb055f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 22:57:43.4438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFtHM4DxdbpDbXAH/LQfgZz65X823s1NJ/ZVsAFplvzHPzt51j3E1snF5iE1AcI2TLFGJAErouedijhqvTRkOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6277
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

On Tue, Jul 30, 2024 at 12:56:17PM -1000, Tejun Heo wrote:
> On Tue, Jul 30, 2024 at 10:53:38PM +0000, Matthew Brost wrote:
> > I didn't want to change the export alloc_workqueue() arguments so I went
> > with this approach. Are you suggesting export a new function
> > alloc_workqueue_lockdep_map() which will share an internal
> > implementation with the existing alloc_workqueue() but passes in a
> > lockdep map? That could work.
> 
> Yeah, add a new exported function which takes lockdep_map and make
> alloc_workqueue() to call that with the embedded map. No need to make the
> latter inline either.
> 

Sure, let me do that.

Matt

> Thanks.
> 
> -- 
> tejun
