Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE41A27647
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A143210E6A2;
	Tue,  4 Feb 2025 15:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ibn2zp6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5195B10E69D;
 Tue,  4 Feb 2025 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738683643; x=1770219643;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rOxfqR4ldZdTvF+wXcc7KUMqD/bRwPf0rjxd3SJQmVE=;
 b=Ibn2zp6yH8JZD3obAEYN4hfc7YlVZoP5jncGrWPZa78AzN+az8iHpsbG
 f/8YsKXlGUNNeuKK3axgQ/4yDdORBVKpFzmcijSOh0/f8IiGuTTmeOi5U
 NbRZMcnDgCCX4dPXpfUYvVDWdteLfF6mjUuTNngIr0BKKkJ7UXCt1qmCu
 QZ1Lj6kWWxxC1TXyg0Jz85zCnd3SwMhQHPcdczWOloFGo12RDOJfOLb8v
 UO5aDNgOaM21EdpRwz89c3Gt9fSGZJkUYTP4Hr1uYVh0rRXmsQUGyTUZc
 AM3jLlVuHYgkbbWGFXWxCj9K5nCEi6G03UDNbKnECraIYcCwrw25tTf3N A==;
X-CSE-ConnectionGUID: FLfQHxpNT9qCgsdSLWiH8A==
X-CSE-MsgGUID: 1iF9xQi7RICuXMOfmxhWzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56754863"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="56754863"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 07:40:42 -0800
X-CSE-ConnectionGUID: 1A/n5e7cQ6Gr6yuNz49HLg==
X-CSE-MsgGUID: Y5jF9k1DQ2OzoVlrgJOsqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="141495862"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 07:40:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 07:40:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 07:40:40 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 07:40:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMniQ2d1YKRDCCvJUnG6ezCzHJ5l+AaJ3M/ogKzAgx6o3E6fr0w3bUWzYllCRpsbH2gOxEEoLmwIokVIjMqyw3SUTQNd2ieVfXXJT0fhPsRVYaOGeQ5NBKQwGZEtNn6ZPdXxIgR+BbKF/DVJdSbXoGqaTabNbYkJ1a64BoRCOtm7tOeW6IFqU+BHfmXA2kUAbAmL2floqztfZ7K+nFKgu8q/frcqwvXIXtpMRPY10BViUHlMGkWgqgwrrCWYiHTrFpwUvGjXyU64Wf1CKXAiwoMWjvoXa2Ss7zxsB5o8uoZ4s05+vAQyMaikQxPjIeDGXwGBs3M+Y6sWH/g0THq4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAiJJll3/JC+xmPo/N1EFBtQloYK5DgrWDkdLU7CrxA=;
 b=gMEdrxZG0wpOGaxy3gxQ+nX8sDsf3WDqmialcXBOQahK+t9aSQOP6qVJbA7pGKkuBurVe7qujVH8iV18h7ws1EcxRY5SRBo5BtenVbu98FgCdF0g3sN0EeRWgrqeP8HtgrxX07ezjmRU9fB0TuCA+g7ziKE6KKDrgu2wMF5e7O+SaLKdfz0YDFDUOyQDMHmTdUwfn3rdWWtKB7T1Ogka+gdbWe2dxx4hw/ud93H+jRGcmPEtJTEtolS8WLeNfjegklzweYo6F7nF0FtUjfZy1Q3a3gHDVBcL3x+e6kEJEDQT8c7auWKQqgNGGSm40r7G0Ukkzjs+vAt4cRi7Q+Or1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 15:40:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 15:40:36 +0000
Date: Tue, 4 Feb 2025 09:40:32 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Peter Zijlstra <peterz@infradead.org>, Will Deacon
 <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng
 <boqun.feng@gmail.com>
Subject: Re: [PATCH-resent-to-correct-ml 5/8] drm/xe/coredump: Use guard
 helpers for xe_force_wake.
Message-ID: <x5ziofhtmnqt22b5nlmnsomyc7qp4bvrhjrlnif6r3mw4xp3xm@ke75kmsh3i3w>
References: <20250204132238.162608-1-dev@lankhorst.se>
 <20250204132238.162608-6-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250204132238.162608-6-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR04CA0083.namprd04.prod.outlook.com
 (2603:10b6:303:6b::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6135:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c29899-04e8-4292-44ad-08dd453244f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wWlPEhc/HDTbT5gg667aWc7UQJBiFsMIGri24ZP2ojVXvdcO0Vu7PESfkaTr?=
 =?us-ascii?Q?UpQpNNrPRTvjTt4wf0dTqLRIhCv0LatR4qB+gIWSn3yufKgLrtpEK3nEbObk?=
 =?us-ascii?Q?rRRJtGeMWOZl/IxEWj+LNSmkBHFn/9Lj83TQG/QhRLjA/um93ZArw3mVFIUo?=
 =?us-ascii?Q?n1ZwdJ1zicms4adHWsp+30q90rXVDO+9gjIxoSbowsoaZ10kKK7F46HYEY6w?=
 =?us-ascii?Q?O4e0KdSUdr5l8I9VqepGsj2k6QInj4JlgR9gCgaOVuXgHJrRcME8O20KlnyF?=
 =?us-ascii?Q?yFarvikQSN8NXdfwfP3WaPAe4Q/kcRvdMEjZA9H3mRKYqHu/AUxMeq8jSUf/?=
 =?us-ascii?Q?IDcZeQU6p9xRnu4pcFaOaHtIx16S7Ksrx43hhwje3y2pLAE+oO00tdCMKOmm?=
 =?us-ascii?Q?dZOAO4hNmXB1PAC6LmJF5uNFDGmrEH7mdw1IML08xSomWrkHySJ8+5lGEiEL?=
 =?us-ascii?Q?wcPno8Rd8hDhmyz22rqWcmV/Mtf1g0ql4LB3H2DFoNuEPmT3RcII1fRspA/p?=
 =?us-ascii?Q?rnb32b/uSNqM4jxC+IYKgNWxT933LtoplMjpaSOximQGzROhIYHMsRmusQS4?=
 =?us-ascii?Q?/NadZ8F6hLjp4VM+T3x6uuwce+ofRlmbP45VjQOgDLTXz3b+6lCBTJSkgBkk?=
 =?us-ascii?Q?ci6Kz9qlw9Y3NpuJ6fSmCMHet7441Rcp4bDPeUmwbcYdTCLgz9WoXg0tIotf?=
 =?us-ascii?Q?eQNMkXxcTQVImb2r8U1PUqdEluloIR6noPeJOIEQWNqEhfjQQhSgYYxo74OY?=
 =?us-ascii?Q?jKjSy7SBldRrLgyYink/4L89v31gPem41gz/mnSw/qrbIzgzrptiaWpX9Cnd?=
 =?us-ascii?Q?QXvmkXGLiFhm5prb1mXtc6VV5G0ZCuslSFbvQ4atAuhBrEEkmFFqiqiX2Pmt?=
 =?us-ascii?Q?CaLWVPFwjg5dNYk6M1DaHXQbKF9WEOCPYWW0Jnxr7ofUlhTJhefSGFy/L6IQ?=
 =?us-ascii?Q?alNemNhY+9XAqI5C8qYvjbWHTkSa7SP/Ao8YRG6L706Jn4l+z7z4AcCU9igT?=
 =?us-ascii?Q?MHOeovmpVvD7lhPy0gNjKnKW/Aw/v7xxherRr31sEi4CHA2hVboSeSfW5o6s?=
 =?us-ascii?Q?nxv/K7tzYdCP6COjcYcPxjS7cRumd/xx19AhwLN1CCfZQhT5fWUsKr5XFPn+?=
 =?us-ascii?Q?oIUVB3AAZkXXp6eYSfh7l1gqaRsABmyrWJAl8U7a7jWtC5Yf7Hp07Hq95qNV?=
 =?us-ascii?Q?kDmD5aD11wpZkjj1xtIoUdF7D/tginCYgf6rIaNCsnx5xuxP3dFbat8c5wgc?=
 =?us-ascii?Q?m69LdzFDS6seOu6KQ/hPyFmfHe/PggpeYIz0j2NLUXN6zxUfibLQVkl/GdVy?=
 =?us-ascii?Q?pPEcysu81X2qds/Kt4thtKOT+i13WQRMQCkjkaqxWhVUImv66HZ6GVxpKUiv?=
 =?us-ascii?Q?TJIxNyJPpOpLVKg3ockIvbW+VrcH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yHyoO8+yNFStfj14O1ZQr9n1lFclq+1FH/wtxAX7LzEXeLpHi1mb14vgia2h?=
 =?us-ascii?Q?NiomdR1KPE91nySjdE4hfM1BIiEU0xvGxIm6AOjtI7Vjth+ZdTWTNexEd/IW?=
 =?us-ascii?Q?GD2eKoa3DwDzNVRePMRpkOkU353C/pFSyk0P6sjqNPXXipcFtCRiggFZdwxm?=
 =?us-ascii?Q?hC7j9RhNPTM6jHI79ygfYbO+uyVSCynfUenIolEINg5ie0gqkQAXwDao4MTa?=
 =?us-ascii?Q?0wYX29m39dLFkDoq/TL1BcN5kfv4whslfNsWtwpqHRSad5Op9KGMnmiCWqIB?=
 =?us-ascii?Q?eB0y4b2bR1BfzMdPOZllqyeQvX/4UpWUa979qAdQbDL5/fGhBfkApRFEOitk?=
 =?us-ascii?Q?xWenB6qO8D7dfpnyIzBEIL3c6TSSwBVrtWhFSKRvkH8fFBj/fbCveqZgvXSo?=
 =?us-ascii?Q?Z+sU60HVtrhU6grg0kwALQdq4uKh2nMB/oS0NnCFOSuoGAD94G7AoNI8TLWs?=
 =?us-ascii?Q?rxfzr1+d0ZF+uOra6OMM1lYuns2yVXS/fCXn2S5P9rlSEP0QUkVdEFxbWR6+?=
 =?us-ascii?Q?HtMK5JE7e8dJ4JpGVCqKRFCo4kcT5EXcod6EjkZXMZYYW8FBPM9bBL24bii9?=
 =?us-ascii?Q?5F9lK5GT0JP/IO7CLAHvYpCqq4v+ozbM74ZHE5fV4YuPXk1NyvSgQFj6ThvZ?=
 =?us-ascii?Q?MAFe4hxba794TjlftDTntPZMAOTV6OcfM+GjYzZw7wnlonzlOYFFWgqr/kpX?=
 =?us-ascii?Q?sbEtoIBF4CwArm7zJlLHd1GexKKhNhdNbnd13gYhifPMoRUc1XDy8cZPF/1U?=
 =?us-ascii?Q?q38Z8yro7gR9+woChPfPGlN4VRIjQANWqy/w+DTzOdGSUq5SdQ8FOWInYNnu?=
 =?us-ascii?Q?cM0PbOMYjDg8RuPVQBtT0TaXFVOwbIEOXudh1Qaqgme9QkOT6sYY97prwGPP?=
 =?us-ascii?Q?af23EYwzJlTHHYrXtspTr0AqoJUfRGcm2dXnWMmyeW20jBVrJDPB8WDGsPrD?=
 =?us-ascii?Q?g4/xGY0CC3WNxaDszvrCLrNRy8/1Zi2o9omnOh5y/tvGEiWKJOV7UEKOyPT8?=
 =?us-ascii?Q?XNQsf9Z8MUFY5VQ8ry7u+k7hIgWUmsbKRLb5ubJxZRREzTTOR37CF6ekZdhh?=
 =?us-ascii?Q?gKTcrRXFp+dfItMAfdcxx6Yr7boA/l4SaD25Ykiv4+cUNtJFAdM87ovm4Yvo?=
 =?us-ascii?Q?Fyko25prLEM7DcUWEx5WyZNsqdCwlONH4kDnGdsPPr3sRh/hcCW3FWFoob2m?=
 =?us-ascii?Q?eTKQNE2kh9HqZkDQ9ooe+mUo/YLw7iVuo9WofbN/bQS9EHfBwJbkvdoEcw8J?=
 =?us-ascii?Q?7pKC8/XDXUsoLS0uokEo9EsLBgw93nC5imV3nHj7+uuzVZe3XzjNyGz9nEJg?=
 =?us-ascii?Q?eDh+2MQge6rAE9lv5OkOC8meevKlX7BCaEz5CyzaXysA6nkDwMp0PRQrit8s?=
 =?us-ascii?Q?s8EiT5o7KbC8mG9sES8qr15muPytBzHwhdB1kX3Eh5jp8bKF4oNZMBeyYBHB?=
 =?us-ascii?Q?wi9xv05+t+OsahyfWnMpjwRU4tOShYbh9pVUyvMnSbkkppbaWLQefsxXWV7V?=
 =?us-ascii?Q?ko4N5MOcmzXDR4dFgnC5IhN967cKn7L17GHwE1JugEIaZPafHKzBdBXsBhlN?=
 =?us-ascii?Q?84LyQ1qcQa3O2Z2CJ8Cis2H11eFrSDMfD5DN0+MbgkoDypxsCnaPUXXnKIrF?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c29899-04e8-4292-44ad-08dd453244f1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 15:40:36.5665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NKWR45CVWH5H/Tcu2ezTyBPNQpyHJ6o0LbeFz1RlapteqKHHOZIlwODFd1TaBqER1etLvZIcFDVoy2Txf8zF2kBcRsFs28cdaYsIVg6d/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6135
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

On Tue, Feb 04, 2025 at 02:22:34PM +0100, Maarten Lankhorst wrote:
>---
> drivers/gpu/drm/xe/xe_devcoredump.c | 36 ++++++++++++++---------------
> 1 file changed, 17 insertions(+), 19 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>index 39fe485d20858..afe229fba8a9c 100644
>--- a/drivers/gpu/drm/xe/xe_devcoredump.c
>+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>@@ -233,7 +233,6 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
> 	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
> 	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
> 	struct xe_device *xe = coredump_to_xe(coredump);
>-	unsigned int fw_ref;
>
> 	/*
> 	 * NB: Despite passing a GFP_ flags parameter here, more allocations are done
>@@ -247,12 +246,13 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
> 	xe_pm_runtime_get(xe);
>
> 	/* keep going if fw fails as we still want to save the memory and SW data */
>-	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
>-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>-		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
>-	xe_vm_snapshot_capture_delayed(ss->vm);
>-	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>-	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
>+	scoped_guard(xe_force_wake, gt_to_fw(ss->gt), XE_FORCEWXE_FORCEWAKE_ALLAKE_ALL) {
>+		if (!xe_force_wake_scope_has_domain(XE_FORCEWAKE_ALL))
>+			xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");

not sure why we are emitting a xe_gt_info() to the kernel log and just
letting the 2 calls above add garbage to the devcoredump - whoever is
processing the devcoredump later may have no clue about that log
message.. but I'm also not seeing why we need XE_FORCEWAKE_ALL in those
calls. Aren't they just reading the memory?

Lucas De Marchi

>+
>+		xe_vm_snapshot_capture_delayed(ss->vm);
>+		xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>+	}
>
> 	xe_pm_runtime_put(xe);
>
>@@ -277,7 +277,6 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> 	u32 width_mask = (0x1 << q->width) - 1;
> 	const char *process_name = "no process";
>
>-	unsigned int fw_ref;
> 	bool cookie;
> 	int i;
>
>@@ -305,20 +304,19 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> 	}
>
> 	/* keep going if fw fails as we still want to save the memory and SW data */
>-	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>-
>-	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
>-	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
>-	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
>-	if (job)
>-		ss->job = xe_sched_job_snapshot_capture(job);
>-	ss->vm = xe_vm_snapshot_capture(q->vm);
>-
>-	xe_engine_snapshot_capture_for_queue(q);
>+	scoped_guard(xe_force_wake, gt_to_fw(ss->gt), XE_FORCEWAKE_ALL) {
>+		ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
>+		ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
>+		ss->ge = xe_guc_exec_queue_snapshot_capture(q);
>+		if (job)
>+			ss->job = xe_sched_job_snapshot_capture(job);
>+		ss->vm = xe_vm_snapshot_capture(q->vm);
>+
>+		xe_engine_snapshot_capture_for_queue(q);
>+	}
>
> 	queue_work(system_unbound_wq, &ss->work);
>
>-	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
> 	dma_fence_end_signalling(cookie);
> }
>
>-- 
>2.47.1
>
