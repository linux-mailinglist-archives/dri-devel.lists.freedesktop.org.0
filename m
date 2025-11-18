Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E1EC67C0F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 07:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96D110E415;
	Tue, 18 Nov 2025 06:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZHkD1enK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883D710E414;
 Tue, 18 Nov 2025 06:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763447990; x=1794983990;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PHcSjZCHpU+ojUvlIcUQZh5O/OQ1NxW9bByaf5iQ6A4=;
 b=ZHkD1enKGy6LgFyqT7uVh9HrRGD1A4InV6/fFpEYaTWFo+mtwHS6llPv
 q79aaK6ElvrqHnfh4rZUy/GBxFZ/1Q5sYzh2V4lkm3sEYde93myhLWuIC
 /q1APYMrpgfymQgq6E82F1bF9De7IWJ4L4nD59HB7H9lBsoxvcVA878m+
 iKBbjnS0XaYqCHZL7s6jMYIQYsLg8v2QJJ+d9AHoB2BCPZOY0bBn7zjg2
 SgEsnkwAJMs1VJhiAlXzSU1A5L6CJaFw1PVd2Es+8QSdrr/yq9tcHD5PA
 39HGrU3I7GJXyfH0fkRcqK9UpmY0uHCRDsl2YZQQk+hATItH8StkopG0Q A==;
X-CSE-ConnectionGUID: lNqUj7yiQoeAtzjTBYGkLg==
X-CSE-MsgGUID: +aPBmOYuS4e4+OK5eQbotQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="82851413"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="82851413"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 22:39:50 -0800
X-CSE-ConnectionGUID: XaC+7plgQS6K/793F3LKfA==
X-CSE-MsgGUID: OhsMq9aeTMOOeTHoRxehuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="189963761"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 22:39:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 22:39:48 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 22:39:48 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 22:39:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mXy58jFkdnBPXCD+rkM1SoYGV7+iJFSLxBE6iqLBk5uKykt4sQrbQ5JGiZhPVrWRK0yaQ5hPua/mJxwnTmeF9Kg2eGvhT1FpGd7ciOeZSSog/P2sseC12HmJhzmz4Qk5w1kTFj9jMvTMKvrXcgyKgy+mYrlIQgEawrEt2SdaSSZ6Q8IWpVNm4U4EwZWicTi1R2t3c3pSUz4ObV3zrShTmLUnMkqYpo7lI/6eRNpkgxD10yXDC9FGJMUXvrmjLwbMRBeU8uMznvOQh+uIqo5dXPf8NEpWo+36J5wu3IkQCe8k79K8URzJnB8GeNCGf/ChJU8mRxwiBYgnkTEgcuC9EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ExAGwd7xWz7wt22Dz5lB80jPULgKYzyqQPEn/8cz1k=;
 b=Faunx1qit1nms/XUvSEhp5qs3t8/ZMkmafpIGlbGWyFHBRxWaec2Wa31xZJi1CRdMQ+5StjYdfC9/kzbW6ne4abcB1iF4fzuIS9bYYKfY750Da9hNvyQ0IHK/7A7OIsoYgeGWjZPIKFX6dFns45iku1WQ+laqv/cgHwQWc90QAx6gI09p0ACmaRTWX43StwjLJ0Wf26VXIBsL10mMdRStMu4b2RZ2eEK9JKcGF8v2j3nvH+F7oHjByRssKDhF+KQ/To0pWGxHP2RfCLlLPAiEiaV6vpJOixfpqqakuwXBfAaKonRfgCWU9vyf/amEfdcjS0fKse8OsoTOr7UUgv5dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by IA1PR11MB7920.namprd11.prod.outlook.com (2603:10b6:208:3fc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 06:39:46 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 06:39:45 +0000
Date: Mon, 17 Nov 2025 22:39:42 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 4/7] drm/xe: Stop abusing DRM scheduler internals
Message-ID: <aRwUrtpXAHi547AS@nvishwa1-desk>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251016204826.284077-5-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:a03:338::15) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|IA1PR11MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: eafb0fc2-6c51-4ba1-c0b4-08de266d4345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?13AZ5FcbCbMzdCQoz3WfRnlJzBfVioOf/GesaBw/EH1ctCMOSOOLdQKukzuG?=
 =?us-ascii?Q?3JDavRzarBcoFRF7B3j+hOwWv20YoF3LSj7CK1iIxbCUWnfJcgvYKlHamge3?=
 =?us-ascii?Q?3dkZraLdmdf/1Bdj31b7HFQpgSvdf/eN8RSKarRQoo3Pao/271/tbhtuakeb?=
 =?us-ascii?Q?YKoOq+peCK4h9pzBWsWLLAeVM5/sHDOQ8NaoSkdolFiPe6c8nquFyFG0VlH1?=
 =?us-ascii?Q?TtbhLVa/XgnlnyHCFP8cLqWliHd13wBb9xD2WnccpW1gbzWU+54T6nfOB9lS?=
 =?us-ascii?Q?5NB6oMai9MBo84bdziFsF+c2uZmyfEDQii8997+QruCcGEVZoAHNXjFRbRvy?=
 =?us-ascii?Q?R6HGo+2lAtDILgHY02Cfue2x06SBLBLKy2kWbYV6p1ygr9KIXpU5KSN4s59W?=
 =?us-ascii?Q?5S1u8mlDd6w2X/hyAYnY+DJhLN3jt4LSMHc8HSgvhn/ej+8apuNedS7HX6a5?=
 =?us-ascii?Q?kzpN15fx4d7fLjzXA3H00trsJ2CnTvJVdaZokX57U3Jfa3VeQYZ3ynNcUWW4?=
 =?us-ascii?Q?q3Yye6PjbsEqdgu5u3BhjF8XJwAq5Dyw9BXcqyBMpVjBCL5aJNHO9aJZRvkQ?=
 =?us-ascii?Q?aV5MYdqWrsErGwkXGcsigLpUbHMKLwqCGEVpo59Wpa8EyxNoReaFvoIruAyX?=
 =?us-ascii?Q?jE+Lij3GNQBmF06GvgmfwR5dKPgoAa2NxDz+Bi6XrssCN6BBTT17PqxitZPt?=
 =?us-ascii?Q?nsWiICdJY4iaGLT2WZfrUO00U7OKmODi1NRBIyuQG2dVVtTRsmDRGiZRDv0e?=
 =?us-ascii?Q?MaJAgH0NDe2/n9O1r5t3VsmIZpdphDmkh7GvDsuy7tS1N5SzwDzaqlmc6jee?=
 =?us-ascii?Q?ByoYfSbrJJPDDr3x5n2XJvHszrCa+y6ic/IosGjbUEbeRuKs17wlMIKXf738?=
 =?us-ascii?Q?O2jwCb113AL2PnDJEYa9NRkhCQgj4CozeP1uGZmMVSdNKaKe2AQGzrcIm1GI?=
 =?us-ascii?Q?AjcGcEY0F2619il7ZjXK55JmAX72+MwU7ltM9LPdAO3LklQyMNN96mPC6D6D?=
 =?us-ascii?Q?BsBy98EL5DnKktkEBEy4vPR+I1uIWg311eMT0kQZPOz/IAQjgT3I3mBhMDF8?=
 =?us-ascii?Q?mlrCrbCNbyqWDTlcSJbje6X1zTEEKZAidoHJNN/pBJooLsciOhmdcfY1bES8?=
 =?us-ascii?Q?oPuXgsUI4ZMeHOKvx3jq0Jyk+Cio1optqXpv/7leRb2qFDfsU7yZXeeYKX5s?=
 =?us-ascii?Q?1W+br1D/tuMXR4cticSdxC+TcjiNv3NEurjZApC7+Jc1LjWx8Chmt3Cz6j8Y?=
 =?us-ascii?Q?cF9qEhuWp/2V8sD5x0+MoycX5JPQCFSQwx9jK2ekkbtq1CGSuuR79k0ak+3Y?=
 =?us-ascii?Q?tDIcfVotVRS0kNW8DK8+xaGv4S7nDCg4wSPRrpegNfKeKh0rH19Lkr+uYA7T?=
 =?us-ascii?Q?SypglfN4EZwQxfChXMixOQfLTNqsKGde33GOXe1nmNIRXCHiKxRFvEeLynGN?=
 =?us-ascii?Q?cYIfXZWeY0JfdJXbNqg1u7btTrN8TkbZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zbJyuL7Vadps0VbIFTuebLMRivIQ7EWMj0OuqszBs3g5/462jdMV8HTljPOk?=
 =?us-ascii?Q?0T6S+xdGnneN3EmnSW++Z+coDIFN7XoeGvNqwvXtSFSp1a6YS5ziWXFwqAE5?=
 =?us-ascii?Q?3GjGF/TxMxZDT5oHR3Kejz/CnxylcqXpOM9HnXo8GfrRfFoFGemEsy2D1Mq0?=
 =?us-ascii?Q?pWlU3gJBE85YF0To/wBP0PYVij5lI9U8L8xJlivsJVnkfhvWA2bQ/11nBeUy?=
 =?us-ascii?Q?ESXG4MXEd0iL7OdLm2MRja5tBDIcCkpIG0CKlgI9vQg63Lfai0tKwTctYoY0?=
 =?us-ascii?Q?tvUBkCINRRwqT3Dk9AEYLaDePvpYue7SHc65qmzvh0CUBTlJHFFY73JnpM/8?=
 =?us-ascii?Q?ICVkzvj8ZDf38pOVJA3cstBD2d495dyQYR+J+snRuy56N1PHyb/mP85I2aXv?=
 =?us-ascii?Q?OqV/gGvJYGWEU5fSMi200Z0In7xucp6IM8B8owfP4CbokBVfLyvCXirpj6Lc?=
 =?us-ascii?Q?ZJeC9jZCK+Nubb7bufHLCdE92+YibVllhr97/ipqbnDT1F+aiAAB24q2t32F?=
 =?us-ascii?Q?g1RYEzJAK42VpLpMg983UT445riKNYYR+N8nz/H5iSFR9HFJfXCncVW5rXPY?=
 =?us-ascii?Q?0tcQt1AkWyI8F0fpHvCpvQQfB2YS0J2UbbaCWx8YHMKSSUhYNiqBioR0zSVg?=
 =?us-ascii?Q?jGXd1Y0qzNabnA30aUZs8iKhPX2Sc353316rJjq1iKXpKlJADi7NRexBDnS1?=
 =?us-ascii?Q?TRhZKa2kWXvBzaURfGrnEppx8QyeDI+zaxP64XkTmWmz3DYGKqLbe11e1Fh5?=
 =?us-ascii?Q?NnTEDnfvYcLAiyIlk0vKhvWe8g8kKRvJERmDCvXJkHzEoTY6N8/sZ0TER3P9?=
 =?us-ascii?Q?UDV1LPmKex1eMcHlmwzXit7qA1rlMeOPj+b9dJvIr3PaxNZLuRL78y65nMMt?=
 =?us-ascii?Q?yJXChMwH95yz1Yi6/mnfzEymdvbgIGoGH9BLIWy9s4HvEzpsBRShuSM3C2Ec?=
 =?us-ascii?Q?vODl3NFgiSz+hPerE647YMHXQTp04sQAzlayCuKFnFKdiLCYK8WWBWJBKILB?=
 =?us-ascii?Q?ZYDDbE3doer5WRw73R76KsZ3/4GSAvrOgtsZ/sCJAYrtmOBeQhpkBk48fzHT?=
 =?us-ascii?Q?Ek+uNSB+5p1jLFX6yOax8D+IIi9SDwQqTqciS20Qeurr7AqyCHgcXho3kGq7?=
 =?us-ascii?Q?Ltsu7vvUxZ6QxaL9zlJS1EzRECQF9D/Wu6byGu0buXdPiSHfU7CS9226xrlb?=
 =?us-ascii?Q?JGAwYg5wwtRft+FOtWBsY9KlWebcXMUTCUdUmcY3Pwy97wkzNjXG6RzPJhQQ?=
 =?us-ascii?Q?+9FI8C1hgkQdiDm9mibAViMvOgibucG88QN6YSBm2GL9j3fzZtpDkkHiP2Yo?=
 =?us-ascii?Q?6XiXD3k4nBFJenVV4rQ5kcvSJWtmgejNEN0Pc9FE6kwVXHGVT0W/3SoaP2LH?=
 =?us-ascii?Q?ZgitKR4qm8bDK2xqGJThF1uhkiOeXV4ruo07+SDkpR1tMS/PImJ/Pt3b+mIs?=
 =?us-ascii?Q?HUb5elaHVJ2f+1rXYjwUrVa6bbpQpTZy23sIBKBAWvSCG4wKPL39N+laj5H7?=
 =?us-ascii?Q?6gTWph2nFAM6rQm4SjkgJS8FOhNsp3NmOUY+BTPOw+1kjFo/2AiwYrq+DtQS?=
 =?us-ascii?Q?dpA6jFbZnLLIxQQJPAchvRFvniPfNp4uGjD2C0CZ4WgHetXF6TpTzpJ4pB0R?=
 =?us-ascii?Q?QbSwmWoSQRVYf8B+ApWVkfs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eafb0fc2-6c51-4ba1-c0b4-08de266d4345
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 06:39:45.8487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xV9uldyOzHBYsOG0iCAkuyO07lx3fk6MBeQOrBGvkDc6Ug/+TCk1TtxMX7frVgloTbFVlSnIsd2Nj5Zcvw8ygZbrJyuMa0aifEJym90/c9/wzoIluFJSPUvv6QpgnqCS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7920
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

On Thu, Oct 16, 2025 at 01:48:23PM -0700, Matthew Brost wrote:
>Use new pending job list iterator and new helper functions in Xe to
>avoid reaching into DRM scheduler internals.
>
>Part of this change involves removing pending jobs debug information
>from debugfs and devcoredump. As agreed, the pending job list should
>only be accessed when the scheduler is stopped. However, it's not
>straightforward to determine whether the scheduler is stopped from the
>shared debugfs/devcoredump code path. Additionally, the pending job list
>provides little useful information, as pending jobs can be inferred from
>seqnos and ring head/tail positions. Therefore, this debug information
>is being removed.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_gpu_scheduler.c    |  4 +-
> drivers/gpu/drm/xe/xe_gpu_scheduler.h    | 34 +++--------
> drivers/gpu/drm/xe/xe_guc_submit.c       | 74 ++++--------------------
> drivers/gpu/drm/xe/xe_guc_submit_types.h | 11 ----
> drivers/gpu/drm/xe/xe_hw_fence.c         | 16 -----
> drivers/gpu/drm/xe/xe_hw_fence.h         |  2 -
> 6 files changed, 20 insertions(+), 121 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>index f4f23317191f..9c8004d5dd91 100644
>--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>@@ -7,7 +7,7 @@
>
> static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
> {
>-	if (!READ_ONCE(sched->base.pause_submit))
>+	if (!drm_sched_is_stopped(&sched->base))
> 		queue_work(sched->base.submit_wq, &sched->work_process_msg);
> }
>
>@@ -43,7 +43,7 @@ static void xe_sched_process_msg_work(struct work_struct *w)
> 		container_of(w, struct xe_gpu_scheduler, work_process_msg);
> 	struct xe_sched_msg *msg;
>
>-	if (READ_ONCE(sched->base.pause_submit))
>+	if (drm_sched_is_stopped(&sched->base))
> 		return;
>
> 	msg = xe_sched_get_msg(sched);
>diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>index b971b6b69419..583372a78140 100644
>--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>@@ -55,14 +55,10 @@ static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
> {
> 	struct drm_sched_job *s_job;
>
>-	list_for_each_entry(s_job, &sched->base.pending_list, list) {
>-		struct drm_sched_fence *s_fence = s_job->s_fence;
>-		struct dma_fence *hw_fence = s_fence->parent;
>-
>+	drm_sched_for_each_pending_job(s_job, &sched->base, NULL)
> 		if (to_xe_sched_job(s_job)->skip_emit ||
>-		    (hw_fence && !dma_fence_is_signaled(hw_fence)))
>+		    !drm_sched_job_is_signaled(s_job))
> 			sched->base.ops->run_job(s_job);
>-	}
> }
>
> static inline bool
>@@ -71,14 +67,6 @@ xe_sched_invalidate_job(struct xe_sched_job *job, int threshold)
> 	return drm_sched_invalidate_job(&job->drm, threshold);
> }
>
>-static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
>-					    struct xe_sched_job *job)
>-{
>-	spin_lock(&sched->base.job_list_lock);
>-	list_add(&job->drm.list, &sched->base.pending_list);
>-	spin_unlock(&sched->base.job_list_lock);
>-}
>-
> /**
>  * xe_sched_first_pending_job() - Find first pending job which is unsignaled
>  * @sched: Xe GPU scheduler
>@@ -88,21 +76,13 @@ static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
> static inline
> struct xe_sched_job *xe_sched_first_pending_job(struct xe_gpu_scheduler *sched)
> {
>-	struct xe_sched_job *job, *r_job = NULL;
>-
>-	spin_lock(&sched->base.job_list_lock);
>-	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
>-		struct drm_sched_fence *s_fence = job->drm.s_fence;
>-		struct dma_fence *hw_fence = s_fence->parent;
>+	struct drm_sched_job *job;
>
>-		if (hw_fence && !dma_fence_is_signaled(hw_fence)) {
>-			r_job = job;
>-			break;
>-		}
>-	}
>-	spin_unlock(&sched->base.job_list_lock);
>+	drm_sched_for_each_pending_job(job, &sched->base, NULL)
>+		if (!drm_sched_job_is_signaled(job))
>+			return to_xe_sched_job(job);
>
>-	return r_job;
>+	return NULL;
> }
>
> static inline int
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 0ef67d3523a7..680696efc434 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1032,7 +1032,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> 	struct xe_exec_queue *q = ge->q;
> 	struct xe_guc *guc = exec_queue_to_guc(q);
> 	struct xe_gpu_scheduler *sched = &ge->sched;
>-	struct xe_sched_job *job;
>+	struct drm_sched_job *job;
> 	bool wedged = false;
>
> 	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
>@@ -1091,16 +1091,10 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> 	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
> 		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
>
>-	xe_hw_fence_irq_stop(q->fence_irq);
>+	drm_sched_for_each_pending_job(job, &sched->base, NULL)
>+		xe_sched_job_set_error(to_xe_sched_job(job), -ECANCELED);
>
> 	xe_sched_submission_start(sched);
>-
>-	spin_lock(&sched->base.job_list_lock);
>-	list_for_each_entry(job, &sched->base.pending_list, drm.list)
>-		xe_sched_job_set_error(job, -ECANCELED);
>-	spin_unlock(&sched->base.job_list_lock);
>-
>-	xe_hw_fence_irq_start(q->fence_irq);
> }
>
> #define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div(__t, 105, 100)
>@@ -1219,7 +1213,7 @@ static enum drm_gpu_sched_stat
> guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> {
> 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>-	struct xe_sched_job *tmp_job;
>+	struct drm_sched_job *tmp_job;
> 	struct xe_exec_queue *q = job->q;
> 	struct xe_gpu_scheduler *sched = &q->guc->sched;
> 	struct xe_guc *guc = exec_queue_to_guc(q);
>@@ -1228,7 +1222,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	unsigned int fw_ref;
> 	int err = -ETIME;
> 	pid_t pid = -1;
>-	int i = 0;
> 	bool wedged = false, skip_timeout_check;
>
> 	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
>@@ -1395,28 +1388,15 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 		__deregister_exec_queue(guc, q);
> 	}
>
>-	/* Stop fence signaling */
>-	xe_hw_fence_irq_stop(q->fence_irq);
>+	/* Mark all outstanding jobs as bad, thus completing them */
>+	xe_sched_job_set_error(job, err);

This setting error for this timed out job is newly added.
Why was it not there before and being added now?

>+	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
>+		xe_sched_job_set_error(to_xe_sched_job(tmp_job), -ECANCELED);
>
>-	/*
>-	 * Fence state now stable, stop / start scheduler which cleans up any
>-	 * fences that are complete
>-	 */
>-	xe_sched_add_pending_job(sched, job);

Why xe_sched_add_pending_job() was there before?

> 	xe_sched_submission_start(sched);
>-
> 	xe_guc_exec_queue_trigger_cleanup(q);

Why do we need to trigger cleanup again here?

>
>-	/* Mark all outstanding jobs as bad, thus completing them */
>-	spin_lock(&sched->base.job_list_lock);
>-	list_for_each_entry(tmp_job, &sched->base.pending_list, drm.list)
>-		xe_sched_job_set_error(tmp_job, !i++ ? err : -ECANCELED);
>-	spin_unlock(&sched->base.job_list_lock);
>-
>-	/* Start fence signaling */
>-	xe_hw_fence_irq_start(q->fence_irq);
>-
>-	return DRM_GPU_SCHED_STAT_RESET;
>+	return DRM_GPU_SCHED_STAT_NO_HANG;

This is error case. So, why return is changed to NO_HANG?

Niranjana

>
> sched_enable:
> 	set_exec_queue_pending_tdr_exit(q);
>@@ -2244,7 +2224,7 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
> 	struct drm_sched_job *s_job;
> 	struct xe_sched_job *job = NULL;
>
>-	list_for_each_entry(s_job, &sched->base.pending_list, list) {
>+	drm_sched_for_each_pending_job(s_job, &sched->base, NULL) {
> 		job = to_xe_sched_job(s_job);
>
> 		xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
>@@ -2349,7 +2329,7 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
> 		 * created after resfix done.
> 		 */
> 		if (q->guc->id != index ||
>-		    !READ_ONCE(q->guc->sched.base.pause_submit))
>+		    !drm_sched_is_stopped(&q->guc->sched.base))
> 			continue;
>
> 		guc_exec_queue_unpause(guc, q);
>@@ -2771,30 +2751,6 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
> 	if (snapshot->parallel_execution)
> 		guc_exec_queue_wq_snapshot_capture(q, snapshot);
>
>-	spin_lock(&sched->base.job_list_lock);
>-	snapshot->pending_list_size = list_count_nodes(&sched->base.pending_list);
>-	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
>-					       sizeof(struct pending_list_snapshot),
>-					       GFP_ATOMIC);
>-
>-	if (snapshot->pending_list) {
>-		struct xe_sched_job *job_iter;
>-
>-		i = 0;
>-		list_for_each_entry(job_iter, &sched->base.pending_list, drm.list) {
>-			snapshot->pending_list[i].seqno =
>-				xe_sched_job_seqno(job_iter);
>-			snapshot->pending_list[i].fence =
>-				dma_fence_is_signaled(job_iter->fence) ? 1 : 0;
>-			snapshot->pending_list[i].finished =
>-				dma_fence_is_signaled(&job_iter->drm.s_fence->finished)
>-				? 1 : 0;
>-			i++;
>-		}
>-	}
>-
>-	spin_unlock(&sched->base.job_list_lock);
>-
> 	return snapshot;
> }
>
>@@ -2852,13 +2808,6 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>
> 	if (snapshot->parallel_execution)
> 		guc_exec_queue_wq_snapshot_print(snapshot, p);
>-
>-	for (i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
>-	     i++)
>-		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
>-			   snapshot->pending_list[i].seqno,
>-			   snapshot->pending_list[i].fence,
>-			   snapshot->pending_list[i].finished);
> }
>
> /**
>@@ -2881,7 +2830,6 @@ void xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *s
> 			xe_lrc_snapshot_free(snapshot->lrc[i]);
> 		kfree(snapshot->lrc);
> 	}
>-	kfree(snapshot->pending_list);
> 	kfree(snapshot);
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
>index dc7456c34583..0b08c79cf3b9 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
>+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
>@@ -61,12 +61,6 @@ struct guc_submit_parallel_scratch {
> 	u32 wq[WQ_SIZE / sizeof(u32)];
> };
>
>-struct pending_list_snapshot {
>-	u32 seqno;
>-	bool fence;
>-	bool finished;
>-};
>-
> /**
>  * struct xe_guc_submit_exec_queue_snapshot - Snapshot for devcoredump
>  */
>@@ -134,11 +128,6 @@ struct xe_guc_submit_exec_queue_snapshot {
> 		/** @wq: Workqueue Items */
> 		u32 wq[WQ_SIZE / sizeof(u32)];
> 	} parallel;
>-
>-	/** @pending_list_size: Size of the pending list snapshot array */
>-	int pending_list_size;
>-	/** @pending_list: snapshot of the pending list info */
>-	struct pending_list_snapshot *pending_list;
> };
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
>index b2a0c46dfcd4..e65dfcdfdbc5 100644
>--- a/drivers/gpu/drm/xe/xe_hw_fence.c
>+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
>@@ -110,22 +110,6 @@ void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq)
> 	irq_work_queue(&irq->work);
> }
>
>-void xe_hw_fence_irq_stop(struct xe_hw_fence_irq *irq)
>-{
>-	spin_lock_irq(&irq->lock);
>-	irq->enabled = false;
>-	spin_unlock_irq(&irq->lock);
>-}
>-
>-void xe_hw_fence_irq_start(struct xe_hw_fence_irq *irq)
>-{
>-	spin_lock_irq(&irq->lock);
>-	irq->enabled = true;
>-	spin_unlock_irq(&irq->lock);
>-
>-	irq_work_queue(&irq->work);
>-}
>-
> void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
> 			  struct xe_hw_fence_irq *irq, const char *name)
> {
>diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
>index f13a1c4982c7..599492c13f80 100644
>--- a/drivers/gpu/drm/xe/xe_hw_fence.h
>+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
>@@ -17,8 +17,6 @@ void xe_hw_fence_module_exit(void);
> void xe_hw_fence_irq_init(struct xe_hw_fence_irq *irq);
> void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq);
> void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq);
>-void xe_hw_fence_irq_stop(struct xe_hw_fence_irq *irq);
>-void xe_hw_fence_irq_start(struct xe_hw_fence_irq *irq);
>
> void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
> 			  struct xe_hw_fence_irq *irq, const char *name);
>-- 
>2.34.1
>
