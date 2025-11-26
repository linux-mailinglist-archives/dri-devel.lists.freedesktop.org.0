Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD9CC87A10
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 01:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5141110E4C9;
	Wed, 26 Nov 2025 00:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PSob4i2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F7310E4C1;
 Wed, 26 Nov 2025 00:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764118547; x=1795654547;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qk2KzzzkHpYoc2AypIN8vRu2YigGXTfgXUpLXTvE5E4=;
 b=PSob4i2co4cuhyHE0r8Jz5r7c9ALqElKsDZxETSHmk8m/QwQDeia6JN4
 O0EZxgR9kP6kZkd/Y9KYVERILhNeTqaS11F3zG5ZO0hXcVyAWG3EIs2U4
 Z96OBngEayOv1ICp87JVW744hBS9ulfsvmK4SaXs/JeN7b1RogA+qV8/+
 TJyhghhCmFwUe7FvMctUKJO3Rplr0Y+DouycmrFWFeFU+8p3gyPN0kGQY
 4dfdhlZ2+4z3MGhDQINRluBscfzgzI8dCGaBBU4BDLtYXVAbQmCbP19j7
 AAw24laJZxB9ZeA0ZnrZwu3NYp87/oJ8XeUBYA3KQTon28k+j1ya6mcJY w==;
X-CSE-ConnectionGUID: NuJqIUHiQi2NYgI7sYO5EQ==
X-CSE-MsgGUID: p2xm1fK+T1qZJoxmHhXiRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66190256"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="66190256"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 16:55:06 -0800
X-CSE-ConnectionGUID: 9xmyogC7SS+vUPlzG+D+rw==
X-CSE-MsgGUID: CfWQXB4zT/ev/ea8fmj6xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="192808933"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 16:55:07 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 16:55:06 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 16:55:06 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 16:55:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2LtKmO/ee4+aaSuif+biu4s0e0eOLrpOgUN8Ep2iYBpqBD55YYL/NPEad1Uwl/4UcroeCqvk83dmBHebS7OjqZBRuAITuvJmalYL9m1X5WgvuePPznZ4Wijt+3ES93fxvS0TR7q+1Eje3NwMf7hExuVAInon4GpBxcbR8rzIueyS+V9yIhsGnlhuiMXTaH7/8V3Fq5FsmR5EHTPjS0HptcmOecYGVsNCLoyOBmYuil/zzSIIZRzqtUptZhzVrKNFUrKBSM7Bpzka8blomYPwfnnhZuOYiAdcgvxbxyCWfoq1jK8WVBbu3QxX7hA0fWkgP0hgMNKc1S3VvfXGmEPeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnd/hS6h8YuFqdVwiq2X0oAH7WcZ6p0mCguTcNOfQOo=;
 b=BlX+oSUMT5pSkMPeipqSzoiJSKT57fVhfhJ42khWl94tZSiLkuBRap5txl6h+F7DxTL37b1JnyF7oJVsx4kHZjVrL5Uznp8I0fQ2YsImaW61JY3HF1hjVqoWYydtF2krqAlLmmcEbIE3sIlqETiHYNeiCQz/Tcs9jmSeuFvqoESJNsyqyJP5jGcXTzpbrHHEyHdtOAyCZUd/bwhjHwWwofCpr9SyT5vkp/OQsaeeCmDERIhoXzKSXflpptUOlqwZ8YzQzl+xQNZqTW49nyIHBdlxHSoSmdQyq6ILyeXPBR9DeNbHx4l7mPPCDVohzZm5Wyce8WopfiLvgkHnAaB+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6502.namprd11.prod.outlook.com (2603:10b6:8:89::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Wed, 26 Nov 2025 00:55:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 00:55:03 +0000
Date: Tue, 25 Nov 2025 16:55:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 09/17] drm/xe: Use the drm_pagemap_util helper to get
 a svm pagemap owner
Message-ID: <aSZP5HK+i27nG7RH@lstrano-desk.jf.intel.com>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
 <20251111164408.113070-10-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111164408.113070-10-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0267.namprd04.prod.outlook.com
 (2603:10b6:303:88::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6502:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b04ce96-1ab8-40f5-0782-08de2c866f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?JjEW/EczGenn9R8NcWHDej+noNJmHo3ahFAhyUrlHtGzE6Bkmr+e0PgOwc?=
 =?iso-8859-1?Q?ZrdODfAQpyUaMf48Rz5EgI9WPYUtvAyVqgM6wMsIzb4q/5NIXYJb9QNlLw?=
 =?iso-8859-1?Q?FKeqmghxczqD5q7l52bE7hV+hoybUlnkLkDfXLEPPwYrxSwmxCblj1gNR3?=
 =?iso-8859-1?Q?PC/ORJ5BANou/22ijCVY4Ne572/5NXEralnk4rQ4wE4kOG5tdaR7od3TLK?=
 =?iso-8859-1?Q?9zloTkglWVupfUvlIPF3j7zh8rfQOKIZYqLJB+J7/99SpnDa0i1UFeg8Xi?=
 =?iso-8859-1?Q?PCrV1vjRrSRe580FLLWwPBxtaztoeensOPNblKNnatvZlcGjOUR5ejHRSu?=
 =?iso-8859-1?Q?SjWGPedoeR8kSeDO6UCClJz5Z5ljos5ukHgxH06S6JOVFRvJv9NRQ5Zqyn?=
 =?iso-8859-1?Q?rI0MlsIkA7zvyGzQLqd/LLQRrE1XUq67DgPkCyyDUT9Qaq74Abm+Mzq4bS?=
 =?iso-8859-1?Q?zGUWpoY+CE3CmuYK/8C2HZ8xoSrVXma9pOxH7zKPQWBtaPpuwDODCGwWzP?=
 =?iso-8859-1?Q?ZgoKUw1jXC8z2sd4DBYi7Eml0Y4lEQ627XdD3xiaTI+mZCwISHUwPZXv+5?=
 =?iso-8859-1?Q?Xaivp4U8qf0fm+38yPa8iKU5VWJLsj0tuz0fLEbtuED8Ed3utbb1RwTMzN?=
 =?iso-8859-1?Q?beV2q17Y0WuYAagjI8nmwFFtH63M0D4ITdLCBDoPnLkZXZEnZRcH3K+8Ui?=
 =?iso-8859-1?Q?Pjf3RO/ZHoVs0/0nxMSSHyx9R5GV/18l7zUafVu+/8UxrBLsjzh+EoyxbZ?=
 =?iso-8859-1?Q?ZeZl5+8HNxNX/pXOmlHkqzNoOJsSOBk/q8gVu+vpNfazehhIuGywwCW3xw?=
 =?iso-8859-1?Q?yyBDdcc0+Y/Ds//A6fhUjZqIM8yCj2Hrh/BuK8TgyzwSOZQQLnSd8Wgico?=
 =?iso-8859-1?Q?ZvZ5H8SSkHFEsteNCITXTqJOI6RLqEEIqePfIyU52oAtzjyM4qDoTSKAiU?=
 =?iso-8859-1?Q?XD5H22KMZKE/DUIy+F5exYtHKipMZ5lXQ5tEY+MaiJe+fK2laqPSru/46X?=
 =?iso-8859-1?Q?2H/QWIFl96J87eMOhadVhnthLx7Qn7iWE4pTPIG1ym5JT84hyy2l71trFD?=
 =?iso-8859-1?Q?u/XAa1cCjVdg1Y4b6w95JPvBaIGwED40pPQWAfTvgJ2C0J2ed+ywUCVLFN?=
 =?iso-8859-1?Q?2ooeGOSCnGEOunYNMdGk9ySKlhTBRppva/Mw7nHzGBqixOO7UHCTaj3juG?=
 =?iso-8859-1?Q?2u/IltqLOskiToZfdtVSCceWm4PSBCUTnpyRwCbFzYzpd4r99lJMJ0ErpM?=
 =?iso-8859-1?Q?AnlahpEJ/vSR8wIwxA6simd1VF3Qg+5LEuqG9LRWy3MhSuZTAAaVm1LZ4G?=
 =?iso-8859-1?Q?+jhvzxommYfP5ZIpzDecMOpbwqHqHR4CIdK18oafb+RKlRmE1kW+RQi/tG?=
 =?iso-8859-1?Q?NvRoCN4cBj11l/lDej6G4HomJkcFSjBgI5Yah/u3hO3xYDFpZ/1WMxchXt?=
 =?iso-8859-1?Q?eO+PM6qL18vpzCFGWZ6Ky5FyMtdxKSeWnF44qF9QLTwEVb4BJZjoHFj/Rf?=
 =?iso-8859-1?Q?qC8FjjepPKcQ5it+LKJyYt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+7ld34Vi1Ls7CJAvWBYYeyqnOO9pms7dhkcraklR0Qj0YubsSU64e60YOO?=
 =?iso-8859-1?Q?XEKEHXifjE10dGk7YVZiW0dmoIfHDj1wXbHFJyD76lasNRuA47g5rdOy+N?=
 =?iso-8859-1?Q?zf0B2O2BbJZQJZrFs1P6kGatbyR4Fb4BsULTNykKvddYL6LCpN9JMq0+y2?=
 =?iso-8859-1?Q?hAAF5EEM3NDBfI4TG+Cyrcsw4C46Fz/o3Zz5fDGGRXHDmM6uDDLVtYjlN7?=
 =?iso-8859-1?Q?W4SzkkLF2mYWZhzQtzj4ppasWesbVoEUjp2RAM3iR6veFGYJ8t/OkKXrcL?=
 =?iso-8859-1?Q?tjTJCgUj7LdKs4OxLlNonIN9/G0N7rcEB9l/qkheYrsa0lUMIyn+tNtXny?=
 =?iso-8859-1?Q?HHL8zW0l/TbVw9yEtKYt4JwDAeaF+FyMl4dE5GHL5k5q2o3UG5O2Ve4xh+?=
 =?iso-8859-1?Q?caUazNoec81RjN+YZAJUPtGDHbFzNd0CB4IlE8ujmNeHs9mxRx4a0Rj+SQ?=
 =?iso-8859-1?Q?kPjeJPVT95kosdl8bJcfCx5b0/lLQEJhy3JyGSYs1oHVbzJSaK15wP6Wsa?=
 =?iso-8859-1?Q?NTVGdP6wKnPFYRDx5sWDu0HkbN+1Hl2wLnj2axILaYLkX8AaEGQGPSPjca?=
 =?iso-8859-1?Q?kvd1MVl3jB0NIcr+cqAup4tmbJBACSW+mRa1Q8c1hzrsqMl1SLsxZKieXr?=
 =?iso-8859-1?Q?qHPNYmuU3WPZmNTcTRIajFg9pKE1HMhdIiRP7exapvdxizo6ewKD4aDQhW?=
 =?iso-8859-1?Q?5/rNpKH2p2z/ySopy9H1H33iaLNZtWDXHtLMaICG0XWXVlrc1hSTqD7BVr?=
 =?iso-8859-1?Q?W1FEkwHxO6pHq6oxmS27Y7hpA7GQaLdOtUj4VnCvZ+ATRw6Ef/5cg5FEPN?=
 =?iso-8859-1?Q?9t4yngDev+ooa00o331BfRZ4JVa9hT4KfLtWEZyanas0id54ZEyfKOFyEF?=
 =?iso-8859-1?Q?7NQB/s/M5qU3Ne7mzIJFooRXxtzYK9GcY28rUHgg5+eAAfj8Dym4J6Mcvw?=
 =?iso-8859-1?Q?QCxqnETMGMYgkouKMTzk5fewL1KPzREeQj/4aYO+heyz3Y5eCBsMKaXjrM?=
 =?iso-8859-1?Q?JDwM0zzLcAbS7B1tTimJuKPh4nJ8SRndAaByFrRwFOi2OrKXZLqPBfABFg?=
 =?iso-8859-1?Q?T3QMFgY5hgZpDBFxSpWkI2E/HSmP8zO/Z/kbXmEiDGyBm03uaEgQcu9OEa?=
 =?iso-8859-1?Q?uNdMMjr2juaHQu90pVd6YRXKDAZ4cLboEqLAfcoYaDVcKKVfGAPNnPux9E?=
 =?iso-8859-1?Q?TlyW8z5b6CEhh6c8WfYtOQ2hmuyoxW3xvHQ+hyhoroA7MNmqYog4YN1LQD?=
 =?iso-8859-1?Q?HAyIA3uhPzlS7eDYE+e6EzlGQJ4asc4kWNsP63ZdWQBpnQRvELFm7U4bF7?=
 =?iso-8859-1?Q?4PhQ6BFNMzqKb+x4kMs9nDD527VIwbn6Vz934By2BZbRyba+j8fddcOj0u?=
 =?iso-8859-1?Q?JGWDcbesZLPYrER7zULB99BQGaC8DhGU2GvaQ7T8EZ0jz/UYm6Tvz3oAEq?=
 =?iso-8859-1?Q?XUQ0tOEUbGv2QzFMQK0KCJqIX+rvSbc2V3qgCeYUoCiVYPpQRJE5neU6N2?=
 =?iso-8859-1?Q?AVO/h3Qz6xgkfaqMH7eIPNb/tXt8EiDZtGNYE9AfGzaM9YrqVQfaUc5YEY?=
 =?iso-8859-1?Q?d20EWihPEf+RDtnVTRLEu4kVMU9+eYvlQsw2R0BfwbSX1WJIS59MrKW0Dt?=
 =?iso-8859-1?Q?JOcJZNoojuTU2Z/MGCu5eNK+wYDrp9CuIuK69vC8iQsVuXiLsCvKu1rg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b04ce96-1ab8-40f5-0782-08de2c866f23
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 00:55:03.6215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqKj1Y/dDu56O9v1Q8GQx5GuOETwNBfjR8jlRRn1c6CR1LSuzFKo+irIySohZB46dfIpPXh0k2oMEAzkwlnxOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6502
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

On Tue, Nov 11, 2025 at 05:43:59PM +0100, Thomas Hellström wrote:
> Register a driver-wide owner list, provide a callback to identify
> fast interconnects and use the drm_pagemap_util helper to allocate
> or reuse a suitable owner struct. For now we consider pagemaps on
> different tiles on the same device as having fast interconnect and
> thus the same owner.
> 
> v2:
> - Fix up the error onion unwind in xe_pagemap_create(). (Matt Brost)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_svm.c      | 64 ++++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_svm.h      | 24 +++++-------
>  drivers/gpu/drm/xe/xe_userptr.c  |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c       |  2 +-
>  drivers/gpu/drm/xe/xe_vm_types.h |  3 ++
>  5 files changed, 71 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 025c0a3aed8b..7db9eafec66b 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -22,8 +22,17 @@
>  #include "xe_vm_types.h"
>  #include "xe_vram_types.h"
>  
> +/* Identifies subclasses of struct drm_pagemap_peer */
> +#define XE_PEER_PAGEMAP ((void *)0ul)
> +#define XE_PEER_VM ((void *)1ul)
> +
>  static int xe_svm_get_pagemaps(struct xe_vm *vm);
>  
> +void *xe_svm_private_page_owner(struct xe_vm *vm, bool force_smem)
> +{
> +	return force_smem ? NULL : vm->svm.peer.owner;
> +}
> +
>  static bool xe_svm_range_in_vram(struct xe_svm_range *range)
>  {
>  	/*
> @@ -769,6 +778,25 @@ static void xe_svm_put_pagemaps(struct xe_vm *vm)
>  	}
>  }
>  
> +static struct device *xe_peer_to_dev(struct drm_pagemap_peer *peer)
> +{
> +	if (peer->private == XE_PEER_PAGEMAP)
> +		return container_of(peer, struct xe_pagemap, peer)->dpagemap.drm->dev;
> +
> +	return container_of(peer, struct xe_vm, svm.peer)->xe->drm.dev;
> +}
> +
> +static bool xe_has_interconnect(struct drm_pagemap_peer *peer1,
> +				struct drm_pagemap_peer *peer2)
> +{
> +	struct device *dev1 = xe_peer_to_dev(peer1);
> +	struct device *dev2 = xe_peer_to_dev(peer2);
> +
> +	return dev1 == dev2;
> +}
> +
> +static DRM_PAGEMAP_OWNER_LIST_DEFINE(xe_owner_list);
> +
>  /**
>   * xe_svm_init() - SVM initialize
>   * @vm: The VM.
> @@ -787,10 +815,18 @@ int xe_svm_init(struct xe_vm *vm)
>  		INIT_WORK(&vm->svm.garbage_collector.work,
>  			  xe_svm_garbage_collector_work_func);
>  
> -		err = xe_svm_get_pagemaps(vm);
> +		vm->svm.peer.private = XE_PEER_VM;
> +		err = drm_pagemap_acquire_owner(&vm->svm.peer, &xe_owner_list,
> +						xe_has_interconnect);
>  		if (err)
>  			return err;
>  
> +		err = xe_svm_get_pagemaps(vm);
> +		if (err) {
> +			drm_pagemap_release_owner(&vm->svm.peer);
> +			return err;
> +		}
> +
>  		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
>  				      current->mm, 0, vm->size,
>  				      xe_modparam.svm_notifier_size * SZ_1M,
> @@ -800,6 +836,7 @@ int xe_svm_init(struct xe_vm *vm)
>  
>  		if (err) {
>  			xe_svm_put_pagemaps(vm);
> +			drm_pagemap_release_owner(&vm->svm.peer);
>  			return err;
>  		}
>  	} else {
> @@ -822,6 +859,7 @@ void xe_svm_close(struct xe_vm *vm)
>  	xe_assert(vm->xe, xe_vm_is_closed(vm));
>  	flush_work(&vm->svm.garbage_collector.work);
>  	xe_svm_put_pagemaps(vm);
> +	drm_pagemap_release_owner(&vm->svm.peer);
>  }
>  
>  /**
> @@ -956,7 +994,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  		xe_pm_runtime_get_noresume(xe);
>  		err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
>  						    start, end, timeslice_ms,
> -						    xe_svm_devm_owner(xe));
> +						    xpagemap->pagemap.owner);
>  		if (err)
>  			xe_svm_devmem_release(&bo->devmem_allocation);
>  		xe_bo_unlock(bo);
> @@ -1071,7 +1109,6 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  		.devmem_only = need_vram && devmem_possible,
>  		.timeslice_ms = need_vram && devmem_possible ?
>  			vm->xe->atomic_svm_timeslice_ms : 0,
> -		.device_private_page_owner = xe_svm_devm_owner(vm->xe),
>  	};
>  	struct xe_validation_ctx vctx;
>  	struct drm_exec exec;
> @@ -1095,8 +1132,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  		return err;
>  
>  	dpagemap = xe_vma_resolve_pagemap(vma, tile);
> -	if (!dpagemap && !ctx.devmem_only)
> -		ctx.device_private_page_owner = NULL;
> +	ctx.device_private_page_owner =
> +		xe_svm_private_page_owner(vm, !dpagemap && !ctx.devmem_only);
>  	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
>  
>  	if (IS_ERR(range))
> @@ -1520,6 +1557,8 @@ static void xe_pagemap_destroy_work(struct work_struct *work)
>  					pagemap->range.end - pagemap->range.start + 1);
>  		drm_dev_exit(idx);
>  	}
> +
> +	drm_pagemap_release_owner(&xpagemap->peer);
>  	kfree(xpagemap);
>  }
>  
> @@ -1570,6 +1609,7 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
>  	dpagemap = &xpagemap->dpagemap;
>  	INIT_WORK(&xpagemap->destroy_work, xe_pagemap_destroy_work);
>  	xpagemap->vr = vr;
> +	xpagemap->peer.private = XE_PEER_PAGEMAP;
>  
>  	err = drm_pagemap_init(dpagemap, pagemap, &xe->drm, &xe_drm_pagemap_ops);
>  	if (err)
> @@ -1582,21 +1622,29 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
>  		goto out_err;
>  	}
>  
> +	err = drm_pagemap_acquire_owner(&xpagemap->peer, &xe_owner_list,
> +					xe_has_interconnect);
> +	if (err)
> +		goto out_no_owner;
> +
>  	pagemap->type = MEMORY_DEVICE_PRIVATE;
>  	pagemap->range.start = res->start;
>  	pagemap->range.end = res->end;
>  	pagemap->nr_range = 1;
> -	pagemap->owner = xe_svm_devm_owner(xe);
> +	pagemap->owner = xpagemap->peer.owner;
>  	pagemap->ops = drm_pagemap_pagemap_ops_get();
>  	addr = devm_memremap_pages(dev, pagemap);
>  	if (IS_ERR(addr)) {
>  		err = PTR_ERR(addr);
> -		devm_release_mem_region(dev, res->start, res->end - res->start + 1);
> -		goto out_err;
> +		goto out_no_pages;
>  	}
>  	xpagemap->hpa_base = res->start;
>  	return xpagemap;
>  
> +out_no_pages:
> +	drm_pagemap_release_owner(&xpagemap->peer);
> +out_no_owner:
> +	devm_release_mem_region(dev, res->start, res->end - res->start + 1);
>  out_err:
>  	drm_pagemap_put(dpagemap);
>  	return ERR_PTR(err);
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 6166f5358d6d..e99d483e82c2 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -6,24 +6,11 @@
>  #ifndef _XE_SVM_H_
>  #define _XE_SVM_H_
>  
> -struct xe_device;
> -
> -/**
> - * xe_svm_devm_owner() - Return the owner of device private memory
> - * @xe: The xe device.
> - *
> - * Return: The owner of this device's device private memory to use in
> - * hmm_range_fault()-
> - */
> -static inline void *xe_svm_devm_owner(struct xe_device *xe)
> -{
> -	return xe;
> -}
> -
>  #if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>  
>  #include <drm/drm_pagemap.h>
>  #include <drm/drm_gpusvm.h>
> +#include <drm/drm_pagemap_util.h>
>  
>  #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
>  
> @@ -65,6 +52,7 @@ struct xe_svm_range {
>   * @pagemap: The struct dev_pagemap providing the struct pages.
>   * @dpagemap: The drm_pagemap managing allocation and migration.
>   * @destroy_work: Handles asnynchronous destruction and caching.
> + * @peer: Used for pagemap owner computation.
>   * @hpa_base: The host physical address base for the managemd memory.
>   * @vr: Backpointer to the xe_vram region.
>   */
> @@ -72,6 +60,7 @@ struct xe_pagemap {
>  	struct dev_pagemap pagemap;
>  	struct drm_pagemap dpagemap;
>  	struct work_struct destroy_work;
> +	struct drm_pagemap_peer peer;
>  	resource_size_t hpa_base;
>  	struct xe_vram_region *vr;
>  };
> @@ -131,6 +120,8 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
>  
>  struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile);
>  
> +void *xe_svm_private_page_owner(struct xe_vm *vm, bool force_smem);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -368,6 +359,11 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
>  	return NULL;
>  }
>  
> +static inline void *xe_svm_private_page_owner(struct xe_vm *vm, bool force_smem)
> +{
> +	return NULL;
> +}
> +
>  static inline void xe_svm_flush(struct xe_vm *vm)
>  {
>  }
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> index 0d9130b1958a..e120323c43bc 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -55,7 +55,7 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>  	struct xe_device *xe = vm->xe;
>  	struct drm_gpusvm_ctx ctx = {
>  		.read_only = xe_vma_read_only(vma),
> -		.device_private_page_owner = xe_svm_devm_owner(xe),
> +		.device_private_page_owner = xe_svm_private_page_owner(vm, false),
>  		.allow_mixed = true,
>  	};
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8fb5cc6a69ec..2321e7c8ae76 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2888,7 +2888,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  	ctx.read_only = xe_vma_read_only(vma);
>  	ctx.devmem_possible = devmem_possible;
>  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
> -	ctx.device_private_page_owner = xe_svm_devm_owner(vm->xe);
> +	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !tile);
>  
>  	/* TODO: Threading the migration */
>  	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index fd9308426ac4..0d09a322199d 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -8,6 +8,7 @@
>  
>  #include <drm/drm_gpusvm.h>
>  #include <drm/drm_gpuvm.h>
> +#include <drm/drm_pagemap_util.h>
>  
>  #include <linux/dma-resv.h>
>  #include <linux/kref.h>
> @@ -192,6 +193,8 @@ struct xe_vm {
>  			struct work_struct work;
>  		} garbage_collector;
>  		struct xe_pagemap *pagemaps[XE_MAX_TILES_PER_DEVICE];
> +		/** @svm.peer: Used for pagemap connectivity computations. */
> +		struct drm_pagemap_peer peer;
>  	} svm;
>  
>  	struct xe_device *xe;
> -- 
> 2.51.1
> 
