Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A488BF4FA
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 05:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0B010E501;
	Wed,  8 May 2024 03:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bS/9oIL2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633F810E501;
 Wed,  8 May 2024 03:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715139004; x=1746675004;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mP6rhucPfOwgzHAes5stoYzXp5pv4scnz4RLT+LZyvA=;
 b=bS/9oIL2+fjBzn6exG2pMOPP5aW6lxIAnK3PgGccYTQz0QRxONSNDKtY
 TVese6PDZyMigCzQUX1YClcxKzCHhOXzH/Y+dkqJTcEvZFsA3FOSxhHlQ
 piWLjBkUdaZumZKBH4iVfW32Geu/5mP71erMA4aYfVHdkM89sLmVCYsHw
 779QlolJ5qQw+Os/lDthAdku5pDdo+LIeoaB9I50MmpzNXMla3bzAeoNp
 iJlE034+rpJ9QPzGcj2nPCQOKPcDWMrfUlwl2JeteuPHIQ58fsm0G0aUG
 gvAnrqdDy0xxgJs2MUDwE/L5rqCo9YSZ0AUimatS5FsB9Jqi7mfdMMRNr g==;
X-CSE-ConnectionGUID: 5Rint3CvQ1SH7DvxE07Zvw==
X-CSE-MsgGUID: YJbouPsfQeiesOEvZaef2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10829315"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="10829315"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 20:30:03 -0700
X-CSE-ConnectionGUID: yKshYDcoSuiEbZP/KITHyg==
X-CSE-MsgGUID: I8BCULqGRhahBIsBDBsCfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="33217576"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 20:30:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 20:30:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 20:30:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 20:30:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 20:30:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjudxPcAlfSvxZwRxQ6MZ+zMVFoDcvFGNGlmyzrUZTugbaLTKilX6WuxeDB+7x0R7QzshHk+yYbXAYQsbemDWzCu1+9+p44U4sJZ4D7wnBI01YYCSJTN7Mtu/2/3a+Kl5A55IUd1kAINOCLjXO15tjDK93yE+Wa3JtjB49S3D8l1zTFZerRyJtPtLkHsPBSow7hnqCNyeMvbLIEbDYYXBMgpZbCpcpuu2IAT4JwqJba1SxpRGh/lgqbR/y7E77L+WXwz14rkymeGdFPu0RCFC8adD2J+Jm/XfghP2VPDGbPdwFI5gaQVNWDjemGxuo4jtb5W41+nz/7BlCftk2aIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kQ168DffHVFlVhs8LSRciBbQDuNnK0eKdHtH2dtoeU=;
 b=S5J9S8Mydc+PBkg90CITXwbKITAf1Wcug9de1kC2A9hIG3T892gO2CLiv57MgL6ZKUuvj7YTjFQjxAiDF1gE0NBmJYSdl2ceII5wIrCvc3/lvCn4Hb77WRcGN3V+u4fN8NfeFfMT/DLVCbpHwK4NySaOgmU0I9YX3FdZ5zNmNNPUpAPpcvv1fjDeXVqc08SABaVBgqg9RK7dSTEEHjwQCck9AWh4dSoMeCIi9/EmLNHSDlj7c2xwYr8x1eaEhwqpaFGfJdlfj/TCD9jZ1eDA77luZHowb/OLhlTKHYq1GxTUO90kemnt0UkUn10ZQI5PlQV1qtjdrOwVEtIdQk1d0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5246.namprd11.prod.outlook.com (2603:10b6:5:389::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Wed, 8 May
 2024 03:29:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 03:29:54 +0000
Date: Tue, 7 May 2024 22:29:51 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/6] drm/xe: Add helper to accumulate exec queue runtime
Message-ID: <3hv2jx24p56a4eod7iec7hm6agfe3siyn5pkyz7ilvmqkkgsa6@gvddndu5l6y5>
References: <20240507224510.442971-1-lucas.demarchi@intel.com>
 <20240507224510.442971-6-lucas.demarchi@intel.com>
 <Zjq9IDk2xKtuOUYT@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zjq9IDk2xKtuOUYT@orsosgc001>
X-ClientProxiedBy: MW2PR16CA0067.namprd16.prod.outlook.com
 (2603:10b6:907:1::44) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5246:EE_
X-MS-Office365-Filtering-Correlation-Id: 79fe8aac-7502-41ab-9a03-08dc6f0f209d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lBZCnzowJjZb6KvwdbrQ8re/SPkcbyTRB9qYBUVVeCVGLe3L11/YbrejN9Bi?=
 =?us-ascii?Q?mpIMmRTeoCFnNknngMZ7mKRwzvRPESIsJsSE4Tx7SAHBjvmc/cQxnFaMHPFw?=
 =?us-ascii?Q?dJXmjVw4971tOKi2G2UHtoxwmG1dxwVma+RaYzhXAD9eRKJWg6vNCdICCyNF?=
 =?us-ascii?Q?1Dom6f8V40+GIM/KnrzikhbEPrkADcONNGqXTHYyX24evA75jyTqO78lFr4c?=
 =?us-ascii?Q?kGmrhjEihQ/Wytz0wShD8QACzBufHlduiAuQ6GMruVpdrsYVi+t4w8htu8Os?=
 =?us-ascii?Q?GnGkjovjjPOrZ00g42JHelM+c4bk6EbBmv+wRnD6YSi9QZHebo1F6h8z875a?=
 =?us-ascii?Q?4+j1JOY5apnJQOv8yRlcheuHkm9MUf9unGASUR2NjDq0kZqCsTTAzUeQl3mq?=
 =?us-ascii?Q?5iAZVCxyatb7iq6WWz5pRPrZW0+0LKA/UACBocUd9YdTnsdRvUdeEx89lN3V?=
 =?us-ascii?Q?PQfUoBGZ5xWM5MWitXe6g1EWWYoILIAJFLcKbT2Z+fF8FrSuJIXjtkmoWZh1?=
 =?us-ascii?Q?e14etNDpBOitQMK3JIcBkEfJfD7mXOao4QJZFF9W04tJ2/xP0iuRIlLse1sh?=
 =?us-ascii?Q?O9c56oW0uQWD59W/kU0nV2k8jKUJWX2GXOHTasQjxBesKvqX0ciMoTVnhj+Q?=
 =?us-ascii?Q?cec6GR/i7aiTG809zzdEq024Di8juvDXSrJcQ9W4rMTRHg9FvMpJXv+Sivmg?=
 =?us-ascii?Q?VrHbGJBFgGpyX+n3ZCrEKg4+mVO7f2QVpNcAAYSzjCGYxKOze6u3GBqFByCO?=
 =?us-ascii?Q?JgTVguKkSnFCSI3hzsYN4r9Sky4Q9adYfK9kp8IfBeGbig21B87WsDOeaiHK?=
 =?us-ascii?Q?U16YkDWObd4SHL1M7TrAIG1stL9ptvwpaS3rhFA/hckqm83bZdhnn7rZRlYD?=
 =?us-ascii?Q?mAqgCRr842zV4sFNepLjmBnZAaSUxYedastMguCyctvEZyl8+5zL2TtLxNYU?=
 =?us-ascii?Q?22aM4+aFPP91gAKLoLJQf7QiLA1smrjfdHL0uVV8HFM4Fnkv4AV51PQFb9sl?=
 =?us-ascii?Q?xQDxjDl9msl5ktY8lW+s7+sr+NGjr8TwnTvywm+2QIsG5Ccf4uXS+SuUAjkW?=
 =?us-ascii?Q?nvggVJolExWVXOG5ocDt6O2zUPkUJcjHjg1wMo/5o1K6B4BXT2jFHGmo1qAt?=
 =?us-ascii?Q?Qniy6UkYgCkHNuyPksA20gTzbkAV4riqhV8xVKNmSmLPZ2rvBz2OvC5PWVBR?=
 =?us-ascii?Q?322E2Feqlyy51ONemNIAFRNANCdOI11YC02dhqeY9y4vGOoFvD8Paispbj19?=
 =?us-ascii?Q?YN8ik7oIAi2C0HDPDVjEv7+RqH08IA4driYt3YTvrw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tkgmirzeLJQSzhvowiCDALeTAFlUIONsQ6GSTLiKQ5yU1cqM9mflP9aKc1G+?=
 =?us-ascii?Q?XTB3xH3kyJ4n15vFflktELYJfgc7zDZI+pQbHCbsqTkX3TlBBs2j7VfKM+q9?=
 =?us-ascii?Q?HG8I6SRIPU3wMLisYjWAQsXTgSMudu+95TaL5posVX2DlG8sHMq2Uv42p5nF?=
 =?us-ascii?Q?pANKu1DOy/vMLYOPmM8u9dc3VuwPSbR+SjhpN+40l6X9gmZDohSsAeIldiSF?=
 =?us-ascii?Q?UHSBKD3mRPyTjK/I4T94PeFl/hzYNTTyYx05CvN91LufkXx+1K8nQuaLZwPq?=
 =?us-ascii?Q?Br7zM3BJIK8rdfXgTUuj+o3mxdPBpST3YPNhutZT21MRhlHTYeP48rGpTucT?=
 =?us-ascii?Q?opiix1OTBJqh81sK35kkKw8HSbDJDzAqgG67rz30eQPMm/F1QrOhXyxqJxGW?=
 =?us-ascii?Q?Z1I6Uk8lIMW54p9qZ1X3YLxIgce3gqG4n5DuzNDj4002G4x9sdhRx4WoMogf?=
 =?us-ascii?Q?d/Usw/5o6IRbpf3+xwGv2DySNaqbzD0PzuOCL7sx7eMLuYCth35KEVy/Usit?=
 =?us-ascii?Q?64XEgXmSmhImxppEAfByh7kTdgkxs/dJRro9D7NdlK9pYENx7Rhy9JqP1CKS?=
 =?us-ascii?Q?90z+C0NVUe4Pmc7r2/iKUJ+qCrfM1Ob7duQ1hnADm+g7pGd1ALCJFr70W1IT?=
 =?us-ascii?Q?2JOfTeHe6FvdE1ygsDURuc5AOqoc8LGZybxBGt1sx3QOSyGQFobOp3W90k7+?=
 =?us-ascii?Q?5WMoD9p+lE0Fj9flw0rDt8iBnKxtNsUybhUZ0ZbCJM6D94tmQvD/rfCkK1Dx?=
 =?us-ascii?Q?EPLdk50DKo78gUjeFgjCvGX6mU5kxx5gFNN44DExq0vVdHWZEStqbXjXFcBg?=
 =?us-ascii?Q?ZrZjROrtl+35ntt95noyrPQQmna1HdK/NyYlO0f93hccbJMM2IDNOisFH437?=
 =?us-ascii?Q?TXhTCoF5Ah/P5Vqjlc/oCzngxMzdhMJazyBItReVrjnR2OOs1sKiO24FOdV0?=
 =?us-ascii?Q?F4wAvXrBDmtgvOTGdQJThoAXOrfocG2TjDvHgxsqwjhDsj+utYn05fpuRy7n?=
 =?us-ascii?Q?em4AyFkFX9cnVwJdCC0kQlNgP5m1HkFVMilFlnr5eqavnb6rTN5x+Tvy/B+6?=
 =?us-ascii?Q?vmR1NHbGi4VSvN9njkuJUa3E5Jw/z3zZMnD/IfNW9Fpr/ZqAmuTcQaBNP+MD?=
 =?us-ascii?Q?G+AiN0bW6bxPF6u3W1vla2XWcOzj1G4afIXEdKQiQjj7jgh7xjNHH/k0oJQ7?=
 =?us-ascii?Q?I4HXJqbKvDfgxnLYARnuAax1trjgQrw1PU0y4G81I/xdLHoXxVP6gShjvoAr?=
 =?us-ascii?Q?gPtxvCfXu83E6+lIekoljABjwXe6YcCNyWKNHW0SUJ0n3NsKp7HyU/MxT+WU?=
 =?us-ascii?Q?HDb8DbY5Edg4wzIFK6LpRz9gXAMa5WgXKjwKkkfkYya1urP1/fY+fWukmQyq?=
 =?us-ascii?Q?TVZDruJ1QAUu8TMmlUmapJzr1V60+6eh06HUDukOVDGQhXV/GY/sz/2RrX7H?=
 =?us-ascii?Q?zerJife2BVBLnIMR46wjL1izKlyuYfhf/QiYQUUv4npDuOad4wrakeMZ9rla?=
 =?us-ascii?Q?GxtsTIecFRVfEERSX7blqEz1zJNJSILFEEb7E3mLOo4UrJfLESJS771JtBJc?=
 =?us-ascii?Q?JL2x4uogunqHH6vWSlC1v869oD1cFWsZOmd4z16yAn7lKfRWldxKh8XWUGQz?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79fe8aac-7502-41ab-9a03-08dc6f0f209d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 03:29:54.4107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JrQtPIK0a3Uu6XldgntlkMw1/ESu0f4ZQG1H3DHDNuIm5M/lhlkENhKcj2z9++OU8yt/xYPzZ/Nz5EUzeuCCKPOZIaBUx5XebOzpu70LtQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5246
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

On Tue, May 07, 2024 at 04:45:36PM GMT, Umesh Nerlige Ramappa wrote:
>On Tue, May 07, 2024 at 03:45:09PM -0700, Lucas De Marchi wrote:
>>From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>
>>Add a helper to accumulate per-client runtime of all its
>>exec queues. This is called every time a sched job is finished.
>>
>>v2:
>> - Use guc_exec_queue_free_job() and execlist_job_free() to accumulate
>>   runtime when job is finished since xe_sched_job_completed() is not a
>>   notification that job finished.
>> - Stop trying to update runtime from xe_exec_queue_fini() - that is
>>   redundant and may happen after xef is closed, leading to a
>>   use-after-free
>> - Do not special case the first timestamp read: the default LRC sets
>>   CTX_TIMESTAMP to zero, so even the first sample should be a valid
>>   one.
>> - Handle the parallel submission case by multiplying the runtime by
>>   width.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++
>>drivers/gpu/drm/xe/xe_exec_queue.c   | 35 ++++++++++++++++++++++++++++
>>drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
>>drivers/gpu/drm/xe/xe_execlist.c     |  1 +
>>drivers/gpu/drm/xe/xe_guc_submit.c   |  2 ++
>>5 files changed, 48 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>index 906b98fb973b..de078bdf0ab9 100644
>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>@@ -560,6 +560,15 @@ struct xe_file {
>>		struct mutex lock;
>>	} exec_queue;
>>
>>+	/**
>>+	 * @runtime: hw engine class runtime in ticks for this drm client
>>+	 *
>>+	 * Only stats from xe_exec_queue->lrc[0] are accumulated. For multi-lrc
>>+	 * case, since all jobs run in parallel on the engines, only the stats
>>+	 * from lrc[0] are sufficient.
>
>Maybe we can drop the above comment altogether after the multi-lrc 
>update.

right... I removed it from the middle of the function and this was a
leftover. I will remove it on next version.

thanks
Lucas De Marchi


>
>Umesh
