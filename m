Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D162A449D4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 19:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2D510E78E;
	Tue, 25 Feb 2025 18:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xn1TH4cI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38D910E78E;
 Tue, 25 Feb 2025 18:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740507202; x=1772043202;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Pp7Qymasclm6H7g0bbG6118a4YpYxUzOWe25nKAyBeA=;
 b=Xn1TH4cIoF01h4vhYvAVkZwC9uRz0BOpLeyED+5k52TBjFjHslwPNLXP
 Src0BnmMLWaxzb9fX0iDG1zetDDun+T9lzyaG3qJulc0VoQISwyT3zvyJ
 JjgMHISuyRodnjsOAJHRZpQFeK2V7YXQWFjErnXO/ifwXiQKttGjuMBdh
 FYCTnRddcJ/vRJodCrqxl+5EKN1qis+t+Xs1AhwSc1d0cXpLzGVzE538w
 M7n9eYaE3hAbYy3YLM//ddlgVFuh8JcER0J6WU8jC29VdZdH0XL1KKAKn
 2JACi/ZDtR0LEoykcIxiYm9jqFdkZZkSONpwayRCYX5JM3IXStTcTsAYy A==;
X-CSE-ConnectionGUID: dI8Xr1f6Tmmr9fUDrGo0BA==
X-CSE-MsgGUID: fI0pHmzeRGG3srnuyrPD6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41244648"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41244648"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 10:13:22 -0800
X-CSE-ConnectionGUID: OxIaQgpYQS+4LU6ahFKZmQ==
X-CSE-MsgGUID: wsESd8+LQnCoYR0e4qgIQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="116666357"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 10:13:20 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 10:13:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 10:13:20 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 10:13:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQdXdIxj9WWzw1eFv3KX2CfF8pZJGd+gWaRVwNKhSgptnkx/MpPb0eRgkMQCwGvAI2Dluf4GU2hN9LuqRAlnASQZl1d9OpX4Qhy0vcy1d7/1uDzB3rqDrvSFMRv1VYibj60bXgOp3dzifSg3IvlklVjhYT3v07gw+QVzGq3lRh/magztUNKHh6rWqIvuQOjHAfAbT81wwY7f1U6+unoBmaGI7IAoHe8cFaf1Shj6XvClWgChArhTv57gFtHHOpCpBlnHTlGNmnyNMGlCUr2MQpGrF9qGGcC6HJjtn76259Dl+oJVdceNLTF6lNBtkpiyhcSQIKsd02vhKQCV6OYtFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujRB/hKh4PlwBiAXMhCyRLFcEK+9jwZiOOOPfBReer8=;
 b=MC3MKsE8CehrSY+Klvo6O9zSuJxggcCSBE4TZtF/RDEnrn6xynv4xAhETI5yiRgNB2xnDlYbI0Lxx9n93X7QxAr48So3wgP1tssyD8PYeukkmZfuMDJRWbVer1039ZqXiToJBc4iZRWungg8PD6p9cjN7azCG2l0m7KUzEBF5K7EKAzWdi68lyN7KwtUMD3dfzbmPNhevXqtKmQc1KhQ9ZK3Gj7HAA9zGiEDwVOvTXA01jHLsfgFEVw5W9gQruN59NNEzZbxEVy2h99QoyuqN1uIOPcoMaLAlcFq0GUChaltcR9ZHZkriTqgGnx/+N0WGjAbVH/nrXjFAW+YS5ChuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6787.namprd11.prod.outlook.com (2603:10b6:303:209::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 18:13:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 18:13:02 +0000
Date: Tue, 25 Feb 2025 10:14:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v6 11/32] drm/xe: Nuke VM's mapping upon close
Message-ID: <Z74Ibtxgmew7A4e7@lstrano-desk.jf.intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
 <20250225044311.3178695-12-matthew.brost@intel.com>
 <bf1b2e41-1380-45de-8772-59ebbcb5cf56@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf1b2e41-1380-45de-8772-59ebbcb5cf56@intel.com>
X-ClientProxiedBy: MW4PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:303:b9::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 9edf4c28-2bd4-4347-e27b-08dd55c80b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?74fsCoXYn2IXyXRP3I6KGSG9wkXuA++PxcjcFGL6r+efHTmc+9vjiAe7eE?=
 =?iso-8859-1?Q?stmhSYJP/Cpg9IkOxM3GsQ68DGmfn3BgVdWTraBTBTdcuSbWc94q0hr21x?=
 =?iso-8859-1?Q?fUMo6xlp6G6WhZE8EqJSjhlyCU+M6vZDGHtN935S9TN63m405FYjDCvqJR?=
 =?iso-8859-1?Q?d5n9QLpDUtlPTiAyh7sbvVeNGbQi/r5w7NTwjngUeUO7ktZzH6xdVAGbyL?=
 =?iso-8859-1?Q?cBhsQo+RpdblWFwsJFRcNJsNy5NUXRlaRdoj8EDj9B1Qg0hQno6nYXFl7y?=
 =?iso-8859-1?Q?z8SlLebg6FzYS2R+1zdQo/wkcv3F0f/v8GGZmchB5dlOG6pQYWWkl7k+61?=
 =?iso-8859-1?Q?dQ5n4o37BI1d1mVyrLzzD07xbg+3ZtPVu+EwT2b3eqzZkegFRRmqWMS7kb?=
 =?iso-8859-1?Q?oO53ceMAaE0RkiQ2311hv73/e7XPYEPfblncNLYFnRXLll1uDZyrN99I4J?=
 =?iso-8859-1?Q?Z6pO1Gg7AV/37/lVGYAhI3krA1frWOqQjnJQLA5ppJ1I5vMC2l8OSoiQUX?=
 =?iso-8859-1?Q?LsdjbRJa+IPDMwYFuKElmic4p5Mtv7flnuTD/evnx9ytWzlS9D8S6+yw5F?=
 =?iso-8859-1?Q?xUMIy2B6gTzdeDW5d6YirUvaxDxt9Rr+9glQE7uT9gurAjFt7laSncAhNW?=
 =?iso-8859-1?Q?hCgF+ywBiOTwmIGSmupI1HpEc8+pvouqsNXxNeoMntS7U/LpHEkI9a1RYr?=
 =?iso-8859-1?Q?mt7EPn2r9lpB350YiMjjLbX2yaxm1sUKYEe5yVnTQvAuwR9FuWXBZm2IeN?=
 =?iso-8859-1?Q?OzWbewS1sKEuw15cWorhBXZitCol3QVmgShJ67A/2HwFl/G074vGZd4vRQ?=
 =?iso-8859-1?Q?e9My3JLIbfNAcOP51vfnzdiU/79W/IY+OpQXtM5VhAufEp+lI9rg1A9uLF?=
 =?iso-8859-1?Q?1P3jRvO6T1ywmiegaZ243+X3NEe/JXvl9/j0ZihGEd4n9NoMTO2hytU+WQ?=
 =?iso-8859-1?Q?3gNL/pPJ07sazU+1CHQT3nUK7QipBkdEjtDbh2S47GQWsJYZIpNOucwbgZ?=
 =?iso-8859-1?Q?qVk6EHgpUaCpmi8pnIMtDJremlW3GASUXdKc+9XXMuQXmWzPunB5A1IHtD?=
 =?iso-8859-1?Q?nDFbW6oTpB16vNwIlaBxsAyoAt5SZlyDSL+gZoZUscKe2seojeDJR+sXmN?=
 =?iso-8859-1?Q?F5cLuRwf6XaXbpfT69VaYFffbUDhMM6Zi83752oRy4nDmcYOT3lnJtlbFP?=
 =?iso-8859-1?Q?gZCVtp/g/1YVBW4tkIJ9NTwr/ukoq6uUMyODl7OkCrYUQT02x44QxLWr5z?=
 =?iso-8859-1?Q?ORKqgyjR8utXvM+fj4U6LmlD3dJh0En3+78l7Hrdl2REV57qTVu+HH8e7E?=
 =?iso-8859-1?Q?PEQ8/1ZGqE+6ZP9E6rxO4Vcwb/5OhWeK2+BnUsuMjxdrpGNPy98MePKTDn?=
 =?iso-8859-1?Q?hUMu9SmQ8w9//GzBVeSFqp1ZdV6PcmDg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QXi0XTjh37dmlADc9y6QS1o5qIGKnhbdTCDdMm8f1QfL1W4W9V5c7mxB+I?=
 =?iso-8859-1?Q?h9biRRQU/khoOuZ6oHcBQHB2WBGsDFBFMB6URPM3NX+tZQUQRVJLxAOz/Z?=
 =?iso-8859-1?Q?Z5q26hqBzEIwilrpd8HKknBbQY+6TxuE16fIYvM8s6MTZADJG46ZNA/TR5?=
 =?iso-8859-1?Q?oEf2eV88XaPhHwwil+0Sptw3Y0eSvRQSKHXO5vPviuazeJH4ZtVDimUfF4?=
 =?iso-8859-1?Q?alN2VjcLaiaNoJlLHxnv90Z1t7YPkmQz58M86lBqfsUBnQpImTjscDp0xg?=
 =?iso-8859-1?Q?URvAXBhGgzOrVE1w9guJORGEadiBWXK2iQtx9eu99j8JXwxHFbKEFiBOz3?=
 =?iso-8859-1?Q?WUb7ysCn/wEmUu/c8HiHSBQe48NVXfzFB8tioNDajEhaHdLHjwemk+0a1i?=
 =?iso-8859-1?Q?AKryjKvqkFsqGjuzayMDuKM6+u2pGgKDcy+ZstFP2RweSTLbxtIUIBEaGW?=
 =?iso-8859-1?Q?Tk9icGG2jzJCsw14R207fK2+eFZH33hZe+O417Cl0rHPd+B2iVnr2IXH68?=
 =?iso-8859-1?Q?zrFpqE+7HVFeump1if6SkfhxqoBNDbxj0GuWVjikzK46DHIzT8ZdBEUWke?=
 =?iso-8859-1?Q?uMHl7zh/htajgclbE73i6UAmjBwF5pR9haiP5GPuEYCw1HEgvi2s/FK7ru?=
 =?iso-8859-1?Q?Ke3ZkHqZ0YxdR55l9v9KDQVCwPQGnwlWazr24tPAMsm7aIpPvXRFl+jYh4?=
 =?iso-8859-1?Q?mrOH5pG8ExB4xed7er2peiZoeomREWZCLASy/5CtdsgNGOHBzL0BSorRD6?=
 =?iso-8859-1?Q?n2i6XJLXZE99lUoMKGME0zSBx7FlcdOH7fbUKiIrT5WN2HIkYCl6IseoSn?=
 =?iso-8859-1?Q?pXss18JCfqNJxxdLJ48j9YN6R/mhbSd1q9cjwViBUbo3tfesQWB/t3a+HY?=
 =?iso-8859-1?Q?wAJquaP/SG60vR3qgDAUD0yRVrQxnyVQ1mlfxpwRwdXQRFAqdluojPBc4o?=
 =?iso-8859-1?Q?wSgn6YjdgWmHGNTTOj+5qufjiHsCvOtcmk4izNE5aEAGmUZ2xZ/pg/XDoY?=
 =?iso-8859-1?Q?U761W19NG4ZrBn35CbEjAteUM4wmFu9VurDYxRXVW0ZWPDYRflzNYWNhOD?=
 =?iso-8859-1?Q?21+2TMp3Dkl60zmYLwpjoBxQRSCXJ3LJS7cKd3i8Mh1tMAhHJR4n1VG1aw?=
 =?iso-8859-1?Q?jxK1HP+hV14B9UA57n8f5NC8XSZP9MO8nMdNe1EBkT2B2UPL3aBmMYZ9AF?=
 =?iso-8859-1?Q?7UK0u1OjX0eY8IJA6ryJ/1kNBEpoembDlXiBG10LOovx2VOtuqnf8eHMFv?=
 =?iso-8859-1?Q?eGAq4Wziky4EQyqeqJp7Lx45FY9a8bHASw4fFevlK5iWhorwyLdKrx2vey?=
 =?iso-8859-1?Q?hiLfWAoI/8/MxAQURwc1SJULqD4XZjB5NKwxvNbyK52ZQ7Il8044vEKrex?=
 =?iso-8859-1?Q?zwe2eN8+82/ZUWOowRdjOVDdQIOkRVJQvgBZXSjjsOZK0eJ1xok025BZv8?=
 =?iso-8859-1?Q?n/KmTJYIWEmnqh266w7QeFgdbZv7M4XCUUu5TcHkXX+K8cA4Xw+zKFTyjN?=
 =?iso-8859-1?Q?pJOHo+mSMDt6pG1J1cuMPhTPGj/deuTzaJ9NDtKcPeJ+D0/xwugcvHqACc?=
 =?iso-8859-1?Q?cYa6GpJGde2a+enG2lPTcTD2InvZUp/r1Qc6Yld7C1vPg84rEM+kstrAoK?=
 =?iso-8859-1?Q?KK7WWyhK0AkJqREIcDk/0TRAbZlULAQImMuItdxbB/vHwKT7OMRiyfgw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9edf4c28-2bd4-4347-e27b-08dd55c80b09
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 18:13:02.4519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDNrJ16q44/lJ8yNQRhDDPeWg6RE00o0TWliBmHVIOsLZ9v5CUiR5diP0VKDkpvhGzK412jfwDrPZjWOo/+iPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6787
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

On Tue, Feb 25, 2025 at 06:05:13PM +0000, Matthew Auld wrote:
> On 25/02/2025 04:42, Matthew Brost wrote:
> > Clear root PT entry and invalidate entire VM's address space when
> > closing the VM. Will prevent the GPU from accessing any of the VM's
> > memory after closing.
> > 
> > v2:
> >   - s/vma/vm in kernel doc (CI)
> >   - Don't nuke migration VM as this occur at driver unload (CI)
> > v3:
> >   - Rebase and pull into SVM series (Thomas)
> >   - Wait for pending binds (Thomas)
> > v5:
> >   - Remove xe_gt_tlb_invalidation_fence_fini in error case (Matt Auld)
> >   - Drop local migration bool (Thomas)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 22 +++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  2 ++
> >   drivers/gpu/drm/xe/xe_pt.c                  | 14 +++++++++++++
> >   drivers/gpu/drm/xe/xe_pt.h                  |  3 +++
> >   drivers/gpu/drm/xe/xe_vm.c                  | 20 +++++++++++++++++++
> >   5 files changed, 61 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index 0a93831c0a02..03072e094991 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -410,6 +410,28 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> >   	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
> >   }
> > +/**
> > + * xe_gt_tlb_invalidation_vm - Issue a TLB invalidation on this GT for a VM
> > + * @gt: graphics tile
> > + * @vm: VM to invalidate
> > + *
> > + * Invalidate entire VM's address space
> > + */
> > +void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm)
> > +{
> > +	struct xe_gt_tlb_invalidation_fence fence;
> > +	u64 range = 1ull << vm->xe->info.va_bits;
> > +	int ret;
> > +
> > +	xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
> > +
> > +	ret = xe_gt_tlb_invalidation_range(gt, &fence, 0, range, vm->usm.asid);
> > +	if (ret < 0)
> > +		return;
> > +
> > +	xe_gt_tlb_invalidation_fence_wait(&fence);
> > +}
> > +
> >   /**
> >    * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
> >    * @gt: GT structure
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > index 672acfcdf0d7..abe9b03d543e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > @@ -12,6 +12,7 @@
> >   struct xe_gt;
> >   struct xe_guc;
> > +struct xe_vm;
> >   struct xe_vma;
> >   int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
> > @@ -21,6 +22,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
> >   int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> >   			       struct xe_gt_tlb_invalidation_fence *fence,
> >   			       struct xe_vma *vma);
> > +void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm);
> >   int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> >   				 struct xe_gt_tlb_invalidation_fence *fence,
> >   				 u64 start, u64 end, u32 asid);
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 99b97bf37c05..c5060011ad43 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -214,6 +214,20 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
> >   	xe_pt_free(pt);
> >   }
> > +/**
> > + * xe_pt_clear() - Clear a page-table.
> > + * @xe: xe device.
> > + * @pt: The page-table.
> > + *
> > + * Clears page-table by setting to zero.
> > + */
> > +void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
> > +{
> > +	struct iosys_map *map = &pt->bo->vmap;
> > +
> > +	xe_map_memset(xe, map, 0, 0, SZ_4K);
> > +}
> > +
> >   /**
> >    * DOC: Pagetable building
> >    *
> > diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> > index 9ab386431cad..8e43912ae8e9 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.h
> > +++ b/drivers/gpu/drm/xe/xe_pt.h
> > @@ -13,6 +13,7 @@ struct dma_fence;
> >   struct xe_bo;
> >   struct xe_device;
> >   struct xe_exec_queue;
> > +struct xe_svm_range;
> >   struct xe_sync_entry;
> >   struct xe_tile;
> >   struct xe_vm;
> > @@ -35,6 +36,8 @@ void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
> >   void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred);
> > +void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt);
> > +
> >   int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops);
> >   struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
> >   				       struct xe_vma_ops *vops);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 1454f98e0cf6..f06b77a757bd 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1584,7 +1584,27 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> >   static void xe_vm_close(struct xe_vm *vm)
> >   {
> >   	down_write(&vm->lock);
> > +
> >   	vm->size = 0;
> > +
> > +	if (!((vm->flags & XE_VM_FLAG_MIGRATION))) {
> > +		struct xe_tile *tile;
> > +		struct xe_gt *gt;
> > +		u8 id;
> > +
> > +		/* Wait for pending binds */
> > +		dma_resv_wait_timeout(xe_vm_resv(vm),
> > +				      DMA_RESV_USAGE_BOOKKEEP,
> > +				      false, MAX_SCHEDULE_TIMEOUT);
> > +
> > +		for_each_tile(tile, vm->xe, id)
> > +			if (vm->pt_root[id])
> > +				xe_pt_clear(vm->xe, vm->pt_root[id]);
> 
> CI looks to be crashing here with various flavours of:
> 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v6/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
> 
> 1> [310.004839] BUG: unable to handle page fault for address:
> ffffc901bc66e000
> <1> [310.004854] #PF: supervisor write access in kernel mode
> <1> [310.004861] #PF: error_code(0x0002) - not-present page
> <6> [310.004867] PGD 100000067 P4D 100000067 PUD 0
> <4> [310.005041]  <TASK>
> <4> [310.005047]  ? show_regs+0x6c/0x80
> <4> [310.005058]  ? __die+0x24/0x80
> <4> [310.005068]  ? page_fault_oops+0x175/0x5d0
> <4> [310.005079]  ? memset+0xb/0x20
> <4> [310.005089]  ? kernelmode_fixup_or_oops.isra.0+0x69/0x90
> <4> [310.005101]  ? __bad_area_nosemaphore+0x1bd/0x2f0
> <4> [310.005112]  ? bad_area_nosemaphore+0x16/0x30
> <4> [310.005122]  ? do_kern_addr_fault.part.0+0x62/0x80
> <4> [310.005133]  ? exc_page_fault+0x2c8/0x300
> <4> [310.005142]  ? asm_exc_page_fault+0x27/0x30
> <4> [310.005155]  ? memset+0xb/0x20
> <4> [310.005164]  ? memset_io+0x62/0x80
> <4> [310.005174]  xe_pt_clear+0x81/0xa0 [xe]
> 
> I took a look and I think the root cause is that the error injection IGTs
> are unbinding the device (like hotunplug) with the vm still being left open
> (closed when driver instance is closed) so here the top level vram mapping
> has already been unmapped from the kernel address space during the unbind,
> and this here is then trying to write through that mapping. I think we need
> to sprinkle some drm_dev_enter() here, and maybe also for the inval below.
> If the device is already gone then we should be able to skip it.
> 

Thanks for looking here, this would've confused me for me bit. Will add
drm_dev_enter/exit.

Matt

> > +
> > +		for_each_gt(gt, vm->xe, id)
> > +			xe_gt_tlb_invalidation_vm(gt, vm);
> > +	}
> > +
> >   	up_write(&vm->lock);
> >   }
> 
