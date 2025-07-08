Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD949AFD862
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 22:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EB410E1CA;
	Tue,  8 Jul 2025 20:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mfnudIMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDEB10E1CC;
 Tue,  8 Jul 2025 20:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752006632; x=1783542632;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/BvQW3nYAnriURWhwJHoGCYu5pIy12bH8yv10ZYIkmQ=;
 b=mfnudIMN9BIzKZfwK6jDFZ2zCsxK/1KLj0YlntGun2qHAmypzDrHQR1Z
 j7EQN5IBYOd5+mBtiKnvJw2+jyVZifu/Ro4ZmLZO21fKpltnOV/CozTvF
 leyWQO4x1K7a7NSryzCbiW292N01Nq1X6aTSmNPO8XZBToqU9CFWUwXDX
 QaUAlzAoMiQREW5jJ10cjPnvR4osjYaM72By7/EYutyrsh0BDbfSnTcjm
 xCAp5DIr0oEO6WMtLrDfSNTHZCdq34/62YcnDa5lCQCfOfdlrT+Rh9DiX
 8zv9cHzXCQ6FCEuAYmzkNt47MNrnpQ3XUcwVz6D0+mcPUwt2kvONwqXTT g==;
X-CSE-ConnectionGUID: 8TbC3D+rTOqnlLZwOCzo3g==
X-CSE-MsgGUID: zEV50K/OQOChu0o8vdphtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54352314"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54352314"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 13:30:31 -0700
X-CSE-ConnectionGUID: JOAcq4x1QPGY3rh/N0hdqg==
X-CSE-MsgGUID: omYhhbsXQzCZPgkdYNrIzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="156168925"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 13:30:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 13:30:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 13:30:29 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.78) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 13:30:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f55AaUrf6R58quLzGv3iCORSdnbA2KtswoCkPwRpYKlDyPTICHWlEo+xU/iWN5QytX3jaKSgVnv3SBVKnEV+Rj64xfSZel1D04/6H5ixPd2fe6v6SHr0E3871/BafBzWAL/rQCDOHHbhZUrKxDsm4utmJk2h61Cy9mIKpCvOez4XLpFPTHqs10C7PyVZu6uJVi7aNE1T1HI19MqaK4P7MaSLeXNbvwwVILHp52QqVJxKyKGcvAuXke1n+g8T9zfIyiFomDyblcw4Ed4WWaxKUrNIGJoNe2ydj4cER7ed14duXHUSJZX/kxvsx8zrDcnFDihSiCLVyKQkYrbZh6CRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIbd9+EdNIGe0AUHhPVGgWXgmvdEQOcnWrbfEVjCa5c=;
 b=xcZPr10bF9AvF1UBaAwSlch8/jkUN83/g0qMiwWgVW24zLZz5JRnl1uZE/e4R3+6ggkHyZbHlLCBOV7a+S6amSrqlj/BXBim9MPjIgjBL26O9mfcJuKH/m9HHZtPvQJIoygvB33E2eKy72uSC4iqVsPWBmLg16gS7FJ3AHoC+0LhdjYAQdHpoX6QEmEzeH0PzF5S1Bkm6SAX5OBoEdMm6olEGw9Z6ntPKGkAW2cZzydiThXmw6aC0ur7dZuRlR7Sv6123Om+86S48dgJGMwu/nahVR9zZKelXK8rOB2+0b1bQUX0qm5v0eV/lWm4rzpnOAPzB+mqqQE6KPDSVTf0DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB8808.namprd11.prod.outlook.com (2603:10b6:8:257::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 20:29:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 8 Jul 2025
 20:29:46 +0000
Date: Tue, 8 Jul 2025 15:29:43 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Juston Li <justonli@chromium.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Yiwei Zhang <zzyiwei@google.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe/bo: add GPU memory trace points
Message-ID: <dqatebbwn3ek7nfguu2l2b4awc7a4pqlizuh5cvaa5jfqmiakv@z3voepobjgul>
References: <20250707203849.545312-1-justonli@chromium.org>
 <20250707203849.545312-2-justonli@chromium.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250707203849.545312-2-justonli@chromium.org>
X-ClientProxiedBy: BYAPR07CA0085.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB8808:EE_
X-MS-Office365-Filtering-Correlation-Id: 5be10be8-7d02-4822-7b13-08ddbe5e2dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ufADCyAiP3iKK/zMmnrMMH3HKqGB3Sxww29ZouO9EcgqJrExGybCd5xE/Jx3?=
 =?us-ascii?Q?UH8Hn9jescTlT2RSw0NhHuE404m1/LE/FYMs52Kx6T0CH/neqfICBJH6KesH?=
 =?us-ascii?Q?GHA+dVbtpiHD8Is+CKqUAkcHqEt17SOkywTcTbSN6QdYzrx9wc2+qwwpSwpa?=
 =?us-ascii?Q?hATLRjShUlBRRXJpl4Rz6P0aoYosIgio5wcgeyv3DrRQZs/zxyMKbhQBJ5Yx?=
 =?us-ascii?Q?CEunVqSK69RNEiLOpcwoF3NqX48G9Wii+hRwCwPebSJHQsy1GlzXH1ROVt0D?=
 =?us-ascii?Q?F7AcnZZoWKxA1S4brwhdED4oT2vsV7DyRovz5mSH5+LOfBZhMGh2zxp/9j/o?=
 =?us-ascii?Q?vBBOIhFzY96QJ9zAmcdaeIzRgUA+9lj+nVXWbeHkQkyXfy6PQItWyEyb4ohx?=
 =?us-ascii?Q?1ZISGyNPvoFIGpN9pT/F7H+aKlCG21KpQZlXS9Xwo4dzm2bOiMhRn+1g1FHt?=
 =?us-ascii?Q?BVn08Jo6kEjLtdUfoVm/e0J7Y0HTKKJbO9r0onrfhMWQcios16xT5k0y6tDs?=
 =?us-ascii?Q?2hWeoyq+7AYQCGGv68HDkkeGVPTwMGCgv5W1O9Gmmh2Mv0ao8TjEWsO2ZCYq?=
 =?us-ascii?Q?95j2M1Iwt2gxVuWHmDzYkciMOcDGpN/LMLGbBRB5oWsYOlT3h+Tlr4J5l0Ph?=
 =?us-ascii?Q?3gtHNROC29Y4WCsb+LpR/A1f3zbMD0+MkvAgYGWQN/VGSte1+y+uh5xxFJ/j?=
 =?us-ascii?Q?LcDJ1HGc9QRXB22BRmRH7UsOKEpFi9mm8ddQca5HFypCge2f+4HGq4cA0faw?=
 =?us-ascii?Q?RbdrBS6iKDraNNBmag/uyrThqJPPI+/rEtsW1BPdq4biaLuyWcYGTk7UqRE6?=
 =?us-ascii?Q?Etrg51BaU1sYrzCOdi3o3N1u6Pp21YvHYeP8JTu1wCeLTpPRbhPzMfAHUv/B?=
 =?us-ascii?Q?X4VPhLK5qdooPSUKUVazvuUfJAL3OHWDiNP/NHUP+VaR/N5K0CA7ylzVP9Fi?=
 =?us-ascii?Q?iaOkgXF9yURPyyEaVzR4BXIVww3MSPYS3QsMqXJII7+hIIAcS1R4RkQMboxW?=
 =?us-ascii?Q?/1TCHkt0fOPI5TmMcIqe0k21t0apnW4hmIRWpyfUgOw+UtYuI3G/1QIXvnYm?=
 =?us-ascii?Q?ZvCcRmpv55aGGtfG0jGa2BPZbJ6UFCgbzDdEzf1h/SHnLciyrTnai9gU4Q+E?=
 =?us-ascii?Q?bNjzcnoDW1/OYLsXL3PgL0PY40qeC+36z2sU6Bdxu2Y8LnCQcqcFKhX1vMeM?=
 =?us-ascii?Q?hGDdhfaX11VwCs+Ef0dOw543ZbWN2Y0lYSv3JTJjx0fnPP6Fn0iuKxTkpxP6?=
 =?us-ascii?Q?+KCGcdOd+FHgxYLYgWGqnKBNTfNR9A+zjuitoh42d6Lc/Z3Q8tVWix2Od5Re?=
 =?us-ascii?Q?730FomYGDZiCT8WfW3NiNB+TyxItj7cy7KGoRa33bkDsJOh+4Vqf5xYlndnh?=
 =?us-ascii?Q?nvq3jQYbmB7M4Ge+HI3h8UuzSW+asWzCGeFywG0YX6g67bI8nctM/wR/xlzG?=
 =?us-ascii?Q?OkTzkVwFmeU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SkN3XWiZw+S37rpJp6RQwMKkKQJB/xaSILYgDChYtT8Y230kvf25eMPfgiCX?=
 =?us-ascii?Q?OuD8eWWGzhcmu9lRbeFKMPpFfsGd56OjFIF5j3x6aDem75MPGVUjorU4OLme?=
 =?us-ascii?Q?kRLS5fjsmraSFM54PH5hi3m1wKRbRsLpwJmMhxrqRCalTB6U5LxhEfqfpU9w?=
 =?us-ascii?Q?lkXSCAzMzie12MsD8IacKZLVd/iJpZz+SsGimtjhgq1wpbuMLAGj3OeHv3YI?=
 =?us-ascii?Q?dEFRuC2d0zL6bBDWkz5hbCMlvVT2btU7Qjg/11l8uwLUWiyMU24EsC5Mj35m?=
 =?us-ascii?Q?IQnRUzrqxyQZY0tMNb+Wxm2iwM5QtB4zCzs6N+Ymk4znmHW8qMd53tKEeQB2?=
 =?us-ascii?Q?6dTVr0+PZs1KGRgQ38TY1MEubLnroBG1KJM0uy3hFXkjbvNmXQYzGTAHx6lC?=
 =?us-ascii?Q?Pj/VzpqAwdRBPLY2gFGwMHnuO4i2W4uWKc70HSUo15C8e8pE1WN6gbVROVXa?=
 =?us-ascii?Q?UiQaudBvm7yCsTAIQRew4MUvx6woMJZXOpvYECNJj5oWLv8LMIOG35A9FaY2?=
 =?us-ascii?Q?8S8x3T+JYEkKbD9nj6a6GIa66cpTN3lBIF6Ek4eSsiJXSKTZeoJiBQuMVc3Q?=
 =?us-ascii?Q?VM+iGhTTP8B1LxRSX5EPepU7o72d5QOn51cznvfLD0SEvaDPTf2/prYOmEiH?=
 =?us-ascii?Q?f4UxHEP6Q+tDKEHrW00XYHym2h1/aGBk1oD6pG2wQ2UuZxKtxMO464mykP66?=
 =?us-ascii?Q?uj3ZVPP5N/cIZsQnlIvGdaBYBU1neXKRgCMtzFSCHm78IG/pa/OkIJBi2eGO?=
 =?us-ascii?Q?iYvfX0OaQoulajzNPC3tgNnaerMbEyiMLP7UaCsC/1y9KZl7ELhwkJNNvuNM?=
 =?us-ascii?Q?6rLBahVLGKpyJC/kKR6Uh399qWjGoeOcUiBumEV03j+bzl7YEbIV1Q8LfGhS?=
 =?us-ascii?Q?lyv4FdVt4a4+BFBOB7TphfgwNxLeChH+LFuajp6qJjJ16IMzN7jqCDbY3cuq?=
 =?us-ascii?Q?diiVlHJkz1lVpWcXeSBsNqnD9JJwvesviYYzTtOaQWzvraCB+K0lrNat4ea2?=
 =?us-ascii?Q?B3+VMac3q+xHrXuMEslWg2JQUC4N8OxsQiXUSCHO4iIHN1PUkYJ3esxxIVvo?=
 =?us-ascii?Q?PTlPVYIJ+sMdN0Y3Fj9UMyISP51G4SbiRWD7G8AcCYc7lA41p0PB0gVSiDhB?=
 =?us-ascii?Q?QqeEdy0IvJlycy3C5Lx0+/pRs4zRf0dVSo1Ig3Gfkv/ZWa+r7Y7HpOSIj4b4?=
 =?us-ascii?Q?utq11h7hcZT0xm2kjRep7jH/xO/Ni+8ZPqk7ScLG7pkrFM+u4X12mYOViLih?=
 =?us-ascii?Q?Tto1/rQroovusrFj+x8bF5fcXDu7UgKhro4lK5RSGuUHv27VNuH4wF6z3IHO?=
 =?us-ascii?Q?/qeepTgxQ63ewVrfxtcZnZ2sl3bZcfpU3PEHkIJ5v/2+uVSfMy2T9Jcju95x?=
 =?us-ascii?Q?aPS+YA6WV4fbqMedBVExRL5GmV7kkINsAbvRSlaj0QAp4uqXjSIMn9k7jQ/J?=
 =?us-ascii?Q?nwLgb3PzEBZWaBfYjcNypNcI3U7NenGb6zwIYOh9uJE22eQtANFiaW6LEtjM?=
 =?us-ascii?Q?M7YWjgPyY8BzMFdUEjXDpXvG7Mx31xWD0v3rKHgcClT4icBQ438Dl9mBVaAj?=
 =?us-ascii?Q?q5VSg1zY9FdzJU/a8KbgJo16f1hT6fj/j4kqgez5tm0zu6eDUBbFW5Q56Y/E?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be10be8-7d02-4822-7b13-08ddbe5e2dbe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 20:29:46.2026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COUUd7dYM4Rlc0OKu3Cb9hZI5ShTtiBu8WJPItEupqdML39C9y6prAYV4BWdVY7p/jZa+0cMoFgCt6X0x2NC0ujXHuDDHdqv906wK9kvgUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8808
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

On Mon, Jul 07, 2025 at 01:38:23PM -0700, Juston Li wrote:
>Add TRACE_GPU_MEM tracepoints for tracking global GPU memory usage.
>
>These are required by VSR on Android 12+ for reporting GPU driver memory
>allocations.
>
>v5:
> - Drop process_mem tracking
> - Set the gpu_id field to dev->primary->index (Lucas, Tvrtko)
> - Formatting cleanup under 80 columns
>
>v3:
> - Use now configurable CONFIG_TRACE_GPU_MEM instead of adding a
>   per-driver Kconfig (Lucas)
>
>v2:
> - Use u64 as preferred by checkpatch (Tvrtko)
> - Fix errors in comments/Kconfig description (Tvrtko)
> - drop redundant "CONFIG" in Kconfig
>
>Signed-off-by: Juston Li <justonli@chromium.org>
>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>---
> drivers/gpu/drm/xe/xe_bo.c           | 22 ++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
> 2 files changed, 30 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 4e39188a021ab..950eef514c11c 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -19,6 +19,8 @@
>
> #include <kunit/static_stub.h>
>
>+#include <trace/events/gpu_mem.h>
>+
> #include "xe_device.h"
> #include "xe_dma_buf.h"
> #include "xe_drm_client.h"
>@@ -418,6 +420,24 @@ static void xe_ttm_tt_account_subtract(struct xe_device *xe, struct ttm_tt *tt)
> 		xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0);
> }
>
>+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
>+static void update_global_total_pages(struct ttm_device *ttm_dev,
>+				      long num_pages)
>+{

wouldn't it be better to move the ifdef inside the function?
Any compiler would remove the empty call regardless of the inline
annotation, so I think this would make it less error prone if we change
function signature.

No need to send a new version, I can move that while applying
if agreed.

Lucas De Marchi
