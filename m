Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57DEAA64BD
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 22:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F6E10E070;
	Thu,  1 May 2025 20:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mz3qZIBk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E551410E070
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 20:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746131256; x=1777667256;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7vOL0nHG5hEVo6op9vZyy0mKoJxPuDbqAbqT4dlYlDI=;
 b=mz3qZIBksHZeZlf3Q/9RWsHYnMXxdbQ5JxKT7sRr8NNxRgINwx9jqQ5g
 KsRrksTaL61wdgL+bdzcUdhj1G9jLdU759XcUnC0KCl5GFaOpr0DCe9k0
 /E4mn0R4yeDCM8moqa5CgZX5K4b24cW0t6r9MIHNOcx+MR/RSdFOT/DxW
 vvmT3vz2kH7lyYItqj22SWTMCzR0G5yWizsDr1DHVc+Md07iK6/0m6Pbl
 uLsZ7iydafyzbUWLytILL2m/X+AEo1i34CJJ9+sjr6MKbMdxjIFaMG9uS
 PFp2YtFLH5LkrZwFrzGLKXZWDr4RoJ5vVSslL0yjXl9K+k/lpmSMQA3rK g==;
X-CSE-ConnectionGUID: /ie3mHqiSyayWbSDBe/CxQ==
X-CSE-MsgGUID: KyMzrWd9RGeGJOvPwnCzNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="51626659"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="51626659"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 13:27:33 -0700
X-CSE-ConnectionGUID: iDPnfS++TCmjArcXaFVfwA==
X-CSE-MsgGUID: qv0qa1wPQW+OeWa/PNUGwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="139281719"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 13:27:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 13:27:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 13:27:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 13:27:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciAqwh1yA+SryvxYxLkYxtIiik+djY4sLxBd2d6aQvS4G0R/rgOgQZZ7JMcHAorQ+zLe8mbGAImaoPvrCg64OMDGFhg5pN4s43RdyNO7ymEVAHgipfCDw+PKyQbc9V5IKCHRI96SyKx6i/cc1eExThyIS9NUw/FDkc7Sug2NAamc6W/ENQD3GoM1d7n499aDpn3v/sGeQegxGnRAcQHlluUhH8f8wA1Jdd1YNqgd/CxP7uwW8JAAXNqOMMme770+W1sI2Ga552mfXPZr8VGuOgBi6wITJO8ZptcAas+87UL3b7NCVFaI+ZX+ibcdvdpgOkaZrx4KhRsnCC3RlLVMUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lU9FyN/mdkCZXePNm4UjdpwXsHF983tkXDOueD4EHh4=;
 b=bqYwxatmppCTpNkVnQdP4YE5YnNxyjBQ3mPRED90PBU1Uc000LuXFa7YObt1ianK+DSg6EF/LeUyPfrXVDaTd5uHT26Ka7udq/rza8sKM8nd40CF9lMdsuWUF1yQHCzdY20xlFSVHCkWjAiFAm4aIWQ3BHMfdnBs13focn6XwyTFmJianLOJL8PUwq5jV5EDm/QMTfUPzqTJxqpRijAuA+f/X5kW2y1nbVKJi0UcOChR9kTMySSl61LAxP8RPlt8ieTQWmQqdQyEo6gGLwRX9l9WRccHfy+tZZ1XVNb3ymPeXlLy2SOjOeCHlIJGc7j2AWdd6fA2KycdgP04GNlnTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7188.namprd11.prod.outlook.com (2603:10b6:208:440::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 20:27:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 20:27:29 +0000
Date: Thu, 1 May 2025 13:28:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Kees Cook <kees@kernel.org>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian Koenig <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, Huang Rui <ray.huang@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] drm/ttm: Silence randstruct warning about casting struct
 file
Message-ID: <aBPZhFho+Z3e1/+g@lstrano-desk.jf.intel.com>
References: <20250501195859.work.107-kees@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250501195859.work.107-kees@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c1de617-7456-448e-4132-08dd88ee97ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?RRYQkjRMamgCRXaxsTfB5nKMpJX/GZNREjpI9L/Gu0qAOS6eywUPaojWpb?=
 =?iso-8859-1?Q?SCbppO2pXSdSA+ObeRV4m2Uimgs0xI4rKFnedSHGQY+Qan2FXvKvcYQooq?=
 =?iso-8859-1?Q?ilz62csDlFNmfzBo6cP6noIqjBntGSNsgRkfLqSBYqg4Inz1uGe+3etJTX?=
 =?iso-8859-1?Q?BnRs8B5rCDjfDl5Y5ryJ0+Za82U+P4m5fEPciY1GL45ZA3KdivPMR6pfcF?=
 =?iso-8859-1?Q?VMeWUM6ENPMhgB2zLFDhAS5d5hV2WF8RF+PfYfc4nNUpqThP+hd/KmhLn6?=
 =?iso-8859-1?Q?vKUpHOhqaxih4eKvo6EkZUgIE4QvhIW1ympbs50ePPdl3uoTFq30hF8zHF?=
 =?iso-8859-1?Q?fC94iJvkgU8+dvsKQm+Ax/Dl+TYB9tKodhTLZC0rWAhQqqro/wt8xI0Aav?=
 =?iso-8859-1?Q?z4P42xuI5RerGRCeGOyFYrIRpi5CgnYe67sYNXjpXx0V971yVPrrbzq7dq?=
 =?iso-8859-1?Q?ODPCG3DLWN22cpm2d41Fhu4SjtK/x1BqpJGHoCjEDxrGY7T7lis+l4PDz8?=
 =?iso-8859-1?Q?SkU47eTtCudKDu684SLB+NR4aOv8ZXsJwfEsuRIMRooXdOrNGfSRh79L7z?=
 =?iso-8859-1?Q?bWsKb6EvoX7MzTfOZiwKqm3fnhUrDMmyW0kaxQ+2UXEfunySr7U0sm2Lqj?=
 =?iso-8859-1?Q?aLJfDoxz8XuArLktLYeyMr+sRJC2rWrU4g6Hgr9RRJKc1jo188P+eLogId?=
 =?iso-8859-1?Q?FZuVSZIMlcnqNUPtU6G1MuFzA8HlX2vJmZ7dPEt/XgQpXCWLLKE6myMD9Q?=
 =?iso-8859-1?Q?dvAXtQ0b4gnpBQcike6uk5Pwq5XhoLJUaoQ98lfSMI56gmR5X8UolSzkGW?=
 =?iso-8859-1?Q?th8NMlfQF6HW+sE8/MYFFy7HKOKt127mGtGzOhko3R4uBBGIdeh7VhDew7?=
 =?iso-8859-1?Q?2rJu+8NnhVIGNZDdvz/Al+84+0rPfhsy4kbu/6dC7zQGQWzcH6WWP3HiDY?=
 =?iso-8859-1?Q?3ci4SC9ERuIJTW0lLrBsdbQp7sQsnkAeTMQx5cpMCHgC2yEv6U6rOzliFU?=
 =?iso-8859-1?Q?0V5qzVBqo6/u5dmxqqtbtoKz6DfeSpPwZXDSCC40XpM8q8vD0WQI/FVvLb?=
 =?iso-8859-1?Q?lVeC2LRQshabEhxcW8KXBFnLjxCFzka3k/CrU+459N93yGPktl9kDT6jA8?=
 =?iso-8859-1?Q?xXgO20ZdWZTv3wmmtvKP4wJuIrrgOY9j0PxXtkxbA+07o76JlF5dX0DOhg?=
 =?iso-8859-1?Q?Jkm67uqQsh3DHtWsTwxqqi9FZrPTlUewvOnfEjuuOuEyU/qoh73fasIeFY?=
 =?iso-8859-1?Q?QPq9KNucr7t7B19xbyLm8GwdqavSOwlqsvOoSXdYSo0TdUb5860xdF/F0y?=
 =?iso-8859-1?Q?5I+4aHiEp0H359eimjfff9Pk/z8EVKQdgLGuq58kG9qLnueAmrL3hNtM3J?=
 =?iso-8859-1?Q?+SRn+O3WacMXfBDytaQ82AfYmcpn9lKQXtvWj2VSUz9xxEKV1Y00BHsqg7?=
 =?iso-8859-1?Q?exx+d8YA8H6OyEg5mFmaM4ajj9RcokD43tM3Brp6yD35Ej9YFjiezefJCo?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MBI4Vn2IHKLNpXpTf+mUx1LliXN5vUrsNFAmS/0/Yd4RG81B12Zj6Wsp9z?=
 =?iso-8859-1?Q?b8zwMJj6ttnN+QQYSW29hf8+mqCbRZnU3xxEnwOshmGqzvyTKzREsPU6QQ?=
 =?iso-8859-1?Q?plwje/RXM31HWb6srnY5dVTyXtDw26ttk4QHE3sc406fISJjPLngArXKzm?=
 =?iso-8859-1?Q?bckDUSHtKK5gWkTZncvPPJkCpJiDkk54g9Z3K09HQ2AbqHLxRKpfI4LK7v?=
 =?iso-8859-1?Q?Ly26XvFdOs16JJ+nf9DydbDfELRY9LAcOAq2yYvADFNIeRwT0d8c4wqJIm?=
 =?iso-8859-1?Q?Azr1zEN8Ugu/GwrfBYpY8OZuTFshqm8kbUNUf6FbBUID5BWNk04pFN4hfA?=
 =?iso-8859-1?Q?GPHpoAsu1aKI4nNVej4GxsU4wBoov203K13AF0zv1jvhWbRA6f5Z9d9Ejt?=
 =?iso-8859-1?Q?9kpLvvpZxxC74L3iqCUS9F4ghTw4eXKpCGqnBPcalsEpOuPQZGwd2x6DA2?=
 =?iso-8859-1?Q?v5HGfdZuDB8OlSjUCtdVw1QcOwkL+AxiclQZraanD9b+9Sp0R2GJwgBEJE?=
 =?iso-8859-1?Q?MbJn+OKoY110WKVy/zhwk5LOKmWiYgK59qhw+oL4po6hu8+x4C2MPWSEqQ?=
 =?iso-8859-1?Q?2tsp/zQpXY2Vjyhn/fCSoNUEtDlEPGJDnnGQPnC3IayQQfWfsXmzw5QpFz?=
 =?iso-8859-1?Q?H6wQk7DrwHS3CCnrgiRxZOfEqYYm9B/T/3IUXOdnmDqwMzcQHMzjfXsLgO?=
 =?iso-8859-1?Q?BunE+rxZuq9dFsAlWskVSy62ADWYvLPZzE+GXBNjM2DqKMK94cr8Psi46f?=
 =?iso-8859-1?Q?7DF8kme6Di8j1Ef2D3UB2J9I5kD/k7PMN16WYkF+R6ZJ7BBm+ZniVNLxDQ?=
 =?iso-8859-1?Q?5Vux4SDG7wAhrFOeKIJwYdTw3mTEDSfLNOkp0mVSPPO33QroLLZYyqDJrW?=
 =?iso-8859-1?Q?C0hd8CCtYISoHNXoGDBSjENupiApqLexjs+YSjQXlewq37PdQS9oS7CCMq?=
 =?iso-8859-1?Q?TC9+LN4EJw/oZHQQ/XJn5buqFXsC7Z0ofyx+q8nXLtEA4d3F40c2aUd4FM?=
 =?iso-8859-1?Q?Qq0LlbizUKpcEW8j1WJl3qN4rnJuX+N5Wgxs112V7fA//7FPDRV9JUdxB7?=
 =?iso-8859-1?Q?dkcNndjlDobs2gWId+umTeI0dd0hj1/4wXxjnsb6kUVqAuzdSCcgBRS1gH?=
 =?iso-8859-1?Q?Rg7VwD9erC8gA2r5P7ADiygriKZJ6XoEWgbTlqHb78+j/eZZXXMq4C7FHP?=
 =?iso-8859-1?Q?INTy3/h9Ur9mUmGVL2MUd2vwW+ZqAMWmcyjWzLU+jFhqaUKCkGjeqfQ9sZ?=
 =?iso-8859-1?Q?kOpDiRoGcSlgH4rR1ve7RRc333Qx077NDexzehuNv47hU1fCaJrJGH/5rY?=
 =?iso-8859-1?Q?lgA2z29y9kkADpvYOEXu23plVya1+8UgY5KPXwe7bHUHGunPgtCObhXWze?=
 =?iso-8859-1?Q?nxZrrL/6CG1ZGyRkHJSudZ4j6zDzvjtceRjVxrZ2wzLnH0d9iIELAA+Jdt?=
 =?iso-8859-1?Q?SX72x6Ond9xs5O6ADowPogYPKW/spdJfbUAwL9WJp/nk3bCcypePgyhm+X?=
 =?iso-8859-1?Q?UhonEyX/quBOdPnQpEyFNf07eln57mfIdVBhQ1m6KQwrwMtfQcwOYt7gR6?=
 =?iso-8859-1?Q?rn2gfdj/gioIFi/cSJEGyQZWA3MJLT8zT2uTjX5mkUkjMmk46LRsabznEg?=
 =?iso-8859-1?Q?n5tpbX3r83Jx7wzh6irC9Z3y7TwghAWoHlRNn86PcC2Ers70rFfIZ2SQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1de617-7456-448e-4132-08dd88ee97ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 20:27:29.0699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxBqVFFmiLTzWbiuZp8OrLK4OiDsJaxA7Tm4EDlvCbV+TTmjZTfbfvdHPaGjcQRPeP7BeU7vCLZbqWi2sVVMhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7188
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

On Thu, May 01, 2025 at 12:59:03PM -0700, Kees Cook wrote:
> Casting through a "void *" isn't sufficient to convince the randstruct
> GCC plugin that the result is intentional. Instead operate through an
> explicit union to silence the warning:
> 
> drivers/gpu/drm/ttm/ttm_backup.c: In function 'ttm_file_to_backup':
> drivers/gpu/drm/ttm/ttm_backup.c:21:16: note: randstruct: casting between randomized structure pointer types (ssa): 'struct ttm_backup' and 'struct file'
>    21 |         return (void *)file;
>       |                ^~~~~~~~~~~~
> 
> Fixes: e7b5d23e5d47 ("drm/ttm: Provide a shmem backup implementation")
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

What if we did something like this instead:

diff --git a/drivers/gpu/drm/ttm/ttm_backup.c b/drivers/gpu/drm/ttm/ttm_backup.c
index 93c007f18855..fe936a87c959 100644
--- a/drivers/gpu/drm/ttm/ttm_backup.c
+++ b/drivers/gpu/drm/ttm/ttm_backup.c
@@ -7,18 +7,22 @@
 #include <linux/page-flags.h>
 #include <linux/swap.h>

+struct ttm_backup {
+       struct file file;
+};
+
 /*
  * Casting from randomized struct file * to struct ttm_backup * is fine since
  * struct ttm_backup is never defined nor dereferenced.
  */
 static struct file *ttm_backup_to_file(struct ttm_backup *backup)
 {
-       return (void *)backup;
+       return &backup->file;
 }

 static struct ttm_backup *ttm_file_to_backup(struct file *file)
 {
-       return (void *)file;
+       return container_of(file, struct ttm_backup, file);
 }

Matt

> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: <dri-devel@lists.freedesktop.org>
> ---
>  drivers/gpu/drm/ttm/ttm_backup.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_backup.c b/drivers/gpu/drm/ttm/ttm_backup.c
> index 93c007f18855..626af1de562f 100644
> --- a/drivers/gpu/drm/ttm/ttm_backup.c
> +++ b/drivers/gpu/drm/ttm/ttm_backup.c
> @@ -18,7 +18,13 @@ static struct file *ttm_backup_to_file(struct ttm_backup *backup)
>  
>  static struct ttm_backup *ttm_file_to_backup(struct file *file)
>  {
> -	return (void *)file;
> +	/* Explicit union instead of a cast to make randstruct ignore us. */
> +	union {
> +		struct file *file;
> +		struct ttm_backup *backup;
> +	} u;
> +	u.file = file;
> +	return u.backup;
>  }
>  
>  /*
> -- 
> 2.34.1
> 
