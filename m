Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C67C754A8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 17:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E03D10E786;
	Thu, 20 Nov 2025 16:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hv9LvdqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CA810E77E;
 Thu, 20 Nov 2025 16:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763655487; x=1795191487;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TbM9efMM+/5wKvRriWbxpJfesIVvPcfBfgUwoAIeqW8=;
 b=Hv9LvdqU/LD28+jIcNQ20Z63cjUBKcqvF185TbND4lgrLEoW5cCGQR82
 JTsy6HsAXNWlNmgBg8qWQdhDrcIeaNtw/xL9GUIe2UfUC+Gd4XftvhYdh
 KUGmRO7Hh2XiIgyyFz/W6hX+XWePky1KQjd95d7AsN8Dh4LFv/hGO/lUz
 Nc6q/23a5swyQTd6xVFgOxFrSJabLgfQKVlPVFb00wUEf67kLrimeGIIi
 udtvdc7g+h/aR98gjE9TJVan+RW+0RW7Vihz0FSa8weSB00w2GwUV4mEN
 ZCIZaq+yS900O2CyiRuDOpZCm8oasbSIZaS5DOBzMYi5yxHd4pmzHdJ1I w==;
X-CSE-ConnectionGUID: gegTCYPqS3iFvVEy/VRdVA==
X-CSE-MsgGUID: DC1hP1PBQAyGgIehA+x0Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76343742"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="76343742"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 08:18:07 -0800
X-CSE-ConnectionGUID: YF8/2imXQhaOggna8l7Snw==
X-CSE-MsgGUID: yy4gfUHITaSg1/3nuIbCwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="228719027"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 08:18:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 08:18:05 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 08:18:05 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 08:18:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RL3A1mVDPHeofO+cdhcOXy4em/08UJ1XT26zeEFbb0xHDsE1h1u49+W1BDh+UZFMRRQkeqwLVw8wix3PRIxn2SCDd7yYg6smV4+7kiDhSJGDsfaUWJGTt7WhxcMnqfwLFH0hW7UCCLIdY5QA8KUjE6ABfCQh2WO4VoZ30ui3o6croImCqTFxfixgeSrZNZPShc9Dy82egoLSgTGfFttw372kyhanI7wXxUQ7NBDyTq/AIS2eSJ8AyuOQwLECJISarx9BW0KQXLLrwcioBT2mLPBB2llFIn7nWRJCW5CrCccpIsQd0pHu+JKDRIvoSqRWpC/jvRnWbHihYyJUa0KLmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZQ6oH/ltwX3XGOh0+I5bYs4W6KVcliyBw5He1micE4=;
 b=KPNDffp1jbjgwww7wUS5WXxMFEfKym5qSeYRkI1ByCQdP9GdDCowJW+i8zBqYWGNQVjRhMkmmrL+hJzX6+ztwbfU/VEDNe8PsAAxFPOeksaKl1bizxb4oV14FUjhZ+XN3EKqoROZqGUD8UBvf8AXsuiTT5a2NdZLElWm+GzddoMe54FHSLRhKZT0kcwC2IomUmaKQjX8Ztd2Snmru2G0T+ydSHTr2Mh+AtEboUU0G9aCjR99nvQN5PGeCWnvQWAcGucPJ6ojrmgvh8HgCUZ8LLH3odDLp+U+RpxqH2L3JAzjAkiN9Eq3JoA4T0CwchcnOBf21l1Vgzpbmdz52dwiFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB8272.namprd11.prod.outlook.com (2603:10b6:a03:47d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 16:17:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 16:17:58 +0000
Date: Thu, 20 Nov 2025 08:17:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH] drm/xe: Fix memory leak when handling pagefault vma
Message-ID: <aR8/M3KgpPz9bwxD@lstrano-desk.jf.intel.com>
References: <20251120161435.3674556-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120161435.3674556-1-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cbae42f-4709-4e1e-54fe-08de28505e77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?jGt9Raz8onr6aUrALroBE+MAuk/Udc/TXnisU9RmzdYCgbZMKhVz6PMMhW?=
 =?iso-8859-1?Q?+4mlnADVeBPBmCXnLZpcBY70zLocCeY+HXnt2QVRxMzB5NpA5iS8tbGrJY?=
 =?iso-8859-1?Q?Xd3PH7apaVao7gAqmvYXGZOVcSQxxGSGOd2BDHSyDNgQU4zPk7cuAAlNC/?=
 =?iso-8859-1?Q?4l09M+EcBPSt4blRNiBw+jN+x8+7dTTT0yw66Qu60r0MEOzUtj5+b+CkMj?=
 =?iso-8859-1?Q?YWIfVBP3yLBuKqbu008YQt3DQA5Vr5GEaGRcSLXPUGKcQqDjkMTqy7kuBB?=
 =?iso-8859-1?Q?Q8swe50TgBva+Tuwo7oAAfUxvAmsU1EuN5fBdpsrNIBv5FUlJ27zNo1CF7?=
 =?iso-8859-1?Q?2MAHqp323GqIN2HUI4JdEE+PuvjPNlgNRL5PJ33mKnYnd4YRXjTOijamxA?=
 =?iso-8859-1?Q?RO9h2khW7jR5O63z7Kv7z1DglTOIIAF6FkstY2OxTNCGiFdg1ri87UB9GU?=
 =?iso-8859-1?Q?PtRRL+tIbCWqMOEBu3jIM3MANXbNQpcgnwb1YdgXnAW3r/8z3JGXTDR4mM?=
 =?iso-8859-1?Q?NoqZeIdh8tYB7Ogcsx7T+Bd/lb8TqQqo/tPrVGbeUQsECoYZLWrq15mjKW?=
 =?iso-8859-1?Q?j80g2lpYEX4R2VQdrDzVEIHVKuLzNx6BkLM6RcdBqe/DFh29Udcguv1ex2?=
 =?iso-8859-1?Q?X3ju6Rg2x7HI9sRhhalh4K5b5jF+Ri1sOTw4EXdzWyq2ALBlK4Vkw8h8fi?=
 =?iso-8859-1?Q?QEkZ6Z4dR+ok+ofynqSUPIwiWVRknTKwHNyElyRpM8oE7GJB2lh9MiWF2E?=
 =?iso-8859-1?Q?zqSNDR7ysW1xVvZHydWyRZQ71y/00+S2bhdbBvdmSUjMoqH7+QPVgrvtU4?=
 =?iso-8859-1?Q?3cAtiyIF8fHZW/Unm3NdM59I5VWzRDaYbqsyplKQSRznSU5NP9faemj4pg?=
 =?iso-8859-1?Q?Reu3AiTW8OFhoplXbFLvW5Oed/FD4/rLDS3hZjBdorSr4WT233bNMUvO0Y?=
 =?iso-8859-1?Q?sh1w7NjtKvXcUJNI8vaJwyW8oSy1oJn3qz2NvzNkeUhbtoVJXFLIuXe/Qg?=
 =?iso-8859-1?Q?MkckThkJAYcq0ZJGK8Tf19G3v8th8WiqUuUMIILBJXE5vUfc1AOy8xLePf?=
 =?iso-8859-1?Q?CY06XH/HqEtBbj4ZAyomW+23iPvt2ekle3d1FtuRiEmtpYc1qUF/+oTo1q?=
 =?iso-8859-1?Q?eqk7aEVHrxwJYQ/YbEqYz0650pLSuRXSKpFY7dij7LTheIQfXlsy062LL1?=
 =?iso-8859-1?Q?A2pF5lPrcoEvsLkXmmoBZZwJ6u49FjqbkEbL6ziZSAI873c2zbN3iV64fR?=
 =?iso-8859-1?Q?I7vDAl86eUlo0Hg7rLE1Raqb1t8KW8iRDndCep58RruMR6kKA0pgTLSPjI?=
 =?iso-8859-1?Q?iYvy8Bs/mPL8WFhskIjmbgfD+H9DA9iPokN186xjJNfP+8B8odmPmtk3aS?=
 =?iso-8859-1?Q?e99LHs87UT6lyytwfRLt/U6m1NapugMsojCOhYHf+qd7WGABcXIBdxOOzU?=
 =?iso-8859-1?Q?kfOqDUN57TsCPFWKHPUdm8TAd/5MdoctiT2iox2mE6ZI/JFqIZD4FZgWvr?=
 =?iso-8859-1?Q?/1D6WxQjofU9ufYvFGPu/l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3MyFkvr7G/GWVcwYtn/Fzo8uSTQYPg0ETcWj92JUaP1SRe29eWwuV5G+fK?=
 =?iso-8859-1?Q?EEWoDcZ4Y/d2HXIkc9Cm486C6y4RRRgolHzpqaiaoy3yvxnB5jK7Wvxq0X?=
 =?iso-8859-1?Q?T8aCj16NK6odS39/OKhbPUf0+AzLOcQ6LBPkxHrfpnZAvN1hApKrtDfl77?=
 =?iso-8859-1?Q?FngTF9R60/sYlP8ciUQigxhRXvyiJiURIvRXLG5BJdfLb7IwwUhgOAkEgk?=
 =?iso-8859-1?Q?NWPPEuN7HL4BjCXTOQoX4dXAyERI4Rk2XzJG7Bbzj62HbjhQWXwzwObjd1?=
 =?iso-8859-1?Q?dsrCtFsJOT0z+YzmV6ND2lh2DCp0Giit+2C/YY6VHQxLi3Muvy+MrqSJbB?=
 =?iso-8859-1?Q?cY2su1niIRlkHCQ34DLSNj5WtfSLUfmTla/YHIKKN/rsA5iGhaNNMCF27j?=
 =?iso-8859-1?Q?Sv9QsJZTyViv0z4UIewocVdF5irF4J99NbKd62DTz6XYDKgnB852pl4nJa?=
 =?iso-8859-1?Q?zgtXrIqRg06VgfFTjdvcNFDjLpTYldgILilpdVj+Q0kNxZ/F2N0jc0pAJh?=
 =?iso-8859-1?Q?7+hMA/ZLI8JT+Bo3Bhmf8lvIgEWAxIUkbsoEODvFZIMKZCp90zeMaS/b29?=
 =?iso-8859-1?Q?Qg34SGeGc/HyhIfU1LdaP/7XABOnMz/Tz5UUNhtosmJs76C8oNeYT4zlUr?=
 =?iso-8859-1?Q?A6MDHQh6oF9RoreIauJfe1/pa9tW+u1q+72fFcFObxytWJs+tOV7cU1Ydk?=
 =?iso-8859-1?Q?/LFS5xr94//U6qlC1gjdK183KVL3JjF0ltPRO0LleelJN44XcPiOecW7X0?=
 =?iso-8859-1?Q?Sy19kgL23lcQLFRkUGkgPGTajlAtjlBRC53SEkKblBZwTgczfLq4F2j+Jd?=
 =?iso-8859-1?Q?nKrIi5GGkqJCI0Un/KXduL3/vnkclcdgUJDfQRTEhiu0RxD2Z777arnF2L?=
 =?iso-8859-1?Q?dKQEh/88pIwk9cS3U2HGKP1t3A9wswtm7Qrd6l+4rNrbhbf8/pufWLR0Mg?=
 =?iso-8859-1?Q?Qjvnx+gs2ms1XvEIECLGT1II4ncmPZXXJjeeJU2YQDmJMrVxB0L9sYxAwn?=
 =?iso-8859-1?Q?pX0jX5YWT8MULvopcQ+yKjZzeQn/UU+FkjA77SUQbXSqH5tnR07IcUBfL0?=
 =?iso-8859-1?Q?+ClAJVFiDkzukIkf62gjA+Ia5WW6N9Uo9iqME2qCwojoZNhvwh44rA1z47?=
 =?iso-8859-1?Q?3rWDVqL0eFadR5eENChR5GC4wguHGuZS5hwI3iMdmJX0KBOf0i6PpqINR9?=
 =?iso-8859-1?Q?0FcwDPn2IoUToFM05AL8zEUz06wLDXVbedG5mz5ZiejSHivGbWSuLHnxyJ?=
 =?iso-8859-1?Q?rSz3+vSxZ3NzhJz792ITMz+XjMbdCics6FNB/KOt8/H8iwc1v+dCbgP9dO?=
 =?iso-8859-1?Q?JA7ZXl4CvCgYWzmO50r47dwhh7fdm3X2mHTK16EEJUdpd2xXlarUPb2lnE?=
 =?iso-8859-1?Q?rZzYj44LrvH/rn2D7RJ4E7Kk5xYBSn6DsKeAihh6JSdaZi8VTieF40VIin?=
 =?iso-8859-1?Q?C31EEuU80LwWpU3TtLd/J5XTVV8oPvYHIeFSxsCR0ryvbFPwaMDcqSA60U?=
 =?iso-8859-1?Q?uZzxFPb+4O9xNjbWzJl/2k2risW29AfbodutMthQsHPbGChEFS92Cq+sjM?=
 =?iso-8859-1?Q?IwDmwV+IgML1T1LySDOfnCqZgKQNZhfQKLgJstWXvfMt8H+5K3FFiFV8Ut?=
 =?iso-8859-1?Q?9Mp9YnspbB5nrOtXILVnUYpqGe49aSvL5kC+meZpG/188EzlNVD85jNA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cbae42f-4709-4e1e-54fe-08de28505e77
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 16:17:58.2592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwER4D50AgG2hbE3htlZmv7SrbrXmQ2CZU41cqLs1/8sGKT1MZq5DZcqQiZ8AQu2r/3R+BgECZaG0ddGkmPO5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8272
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

On Thu, Nov 20, 2025 at 06:14:35PM +0200, Mika Kuoppala wrote:
> When the pagefault handling code was moved to a new file, an extra
> drm_exec_init() was added to the VMA path. This call is unnecessary because
> xe_validation_ctx_init() already performs a drm_exec_init(), resulting in a
> memory leak reported by kmemleak.
> 
> Remove the redundant drm_exec_init() from the VMA pagefault handling code.
> 
> Fixes: fb544b844508 ("drm/xe: Implement xe_pagefault_queue_work")
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks for the fix, will merge once CI comes back.

> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: intel-xe@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index fe3e40145012..afb06598b6e1 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -102,7 +102,6 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
>  
>  	/* Lock VM and BOs dma-resv */
>  	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
> -	drm_exec_init(&exec, 0, 0);
>  	drm_exec_until_all_locked(&exec) {
>  		err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
>  					 needs_vram == 1);
> -- 
> 2.43.0
> 
