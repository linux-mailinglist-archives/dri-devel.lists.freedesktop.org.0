Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5410DC178F1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 01:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F0210E6C5;
	Wed, 29 Oct 2025 00:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K5KuNS/f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2255110E6C5;
 Wed, 29 Oct 2025 00:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761698050; x=1793234050;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tTbNUr04Xc6NUAReMT/NkgkVFlzxnybBTtJ8RH1qieY=;
 b=K5KuNS/fVrUFY6KNaaowqMbJf3Lpl7VTA27d/eT5Bdk8wwfGLi+vgrFk
 5rsYTrufhwXMok6RMSZKbfeSwWoq5XEO45RqkuTde1Gzqf9/yNfKjs63l
 TeNSA6SKN/QV1VkqxLmshCrOAYAXTz6ZdJEpl658lUfCtr8PQNx+vUqAk
 4z85O727QyEQ2GgrB2Ff4sUWY7Pi9D/qDEjAHOM9Zn0SE7x2v3f/9pr6s
 6z0Nklvlq0zxVGW+KK6XXZnF781tlNmXEHm6hShLujcAoPo1WTdJnwYQ4
 o9+rb7H17eF24c6DSVEQYu/TPDqjnllOJPedC2R8U63GGmWFGGx7KX+oY g==;
X-CSE-ConnectionGUID: 7wEWYUp4TW+X8Ky9mMvRlQ==
X-CSE-MsgGUID: FgPU0YWUTF6YivUbXz10Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81231957"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="81231957"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 17:34:09 -0700
X-CSE-ConnectionGUID: LghChD+nRx+vm2oMQiNoLQ==
X-CSE-MsgGUID: 19C8PvVzQPexDqAqfBEs/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="184744051"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 17:34:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 17:34:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 17:34:08 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 17:34:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+uxePnc8cPnclz29NForfAQkZeIwI8hZx0c1BQuZmIGxS8ye+dpIaArFYy5KTgVCLkdIyHx6EkW1QWVVcXflFrEO1kib3W+qejhCQEtfL6GrNkrDQRHp0pSfHBmKGMdoUU7CFmBHgBatygZ5LSGr4vZ5w/hClCXWy6ACTmjci94VKnkKiPSVc7AHWG7nbQ8tbpEmHbZQqdwW/ruxrecSyUFXpLyq5O4ePue5ULR3BX6L8viPr+F+bTiJGSuaUMvmxLZ45ILmBFes2sVOW7+u5hAIkFvHimLphXS+U3UgB0TmsA7SIo/BUgUCbRHPM84HnZL/rYQMwF6aIGBQKYUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrDj5Vcp/eItV413PNOQ5z9iT/KI8Rw98v/P88d9r7M=;
 b=sioRla1LviPLyzUfYITXC6V05nCHoXE/H7tj6ImJNVNw7K4rahw9ZhRSl8+Jyjz3hHvO2pgKKbNJ3k30X3AtLrJCkidK6nzKZl7TxzBkoXqW1QSCCNA6WtUpYndNsp1LmSoSbkrOLuFK8OKZX0nLT/W493FDsKNgi0fGlnIBD6p1dPe9/BuTUrir3YsbHD5Wx2yCSSjo0Bgnb+Gsb+3oNp0Qb0R6h1/IgoUfwf3NB2ENlTd6vjDxlDl4Ex2/qgTGcCmiUdbuzQY5LK/tVHMTPQCrFgGdjSujkBZsv0PTnX73sxhqZleInBDuG8bTwbp8gd6csQjHFhWFHIUarJg1Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF208195D8D.namprd11.prod.outlook.com (2603:10b6:f:fc00::f13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 00:34:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 00:34:00 +0000
Date: Tue, 28 Oct 2025 17:33:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 02/15] drm/pagemap: Add a refcounted drm_pagemap
 backpointer to struct drm_pagemap_zdd
Message-ID: <aQFg9TWLjPx892il@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR06CA0055.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF208195D8D:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6d0168-552d-4310-da77-08de1682daa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?M+i0Bjvff8hYIkxOOnc3z0F0lIRRFqcy/U33d6tXTqlvsbDi/ClzpjXxre?=
 =?iso-8859-1?Q?lhG2frG6gzIwMHOlFzMCO1hL3v8Y0+j4GcDzWfNlmuTwPK3N9mD7o89BI7?=
 =?iso-8859-1?Q?y3ltLkZ0GmUT6FvohS6qnwG/R6a2S5HdO7nXN59xrkkh1hylKgSJ2ZU6dp?=
 =?iso-8859-1?Q?CaWPw4b2abHAX+ZZOpGOQQLygfA4JWw7LX0NtjxuAkggaAZgIroRvYJNaK?=
 =?iso-8859-1?Q?GPZP+lJ6wTakFKIdnlUjzcPfFEJU/8b+0LMp/MvOwQIE4YZMRSXXhulOfx?=
 =?iso-8859-1?Q?q5WP/qVaZWMYbVD9TpNRuld/LbKva7jcZfDemez1Elzx0lZLuanZCoF5EI?=
 =?iso-8859-1?Q?1gMmdrtw3WINramDiwROMnHwow3uBkpYGKz2aLVU9O5hGi3niSsS9lTGeP?=
 =?iso-8859-1?Q?sZlhMtuVeni/5/fIIPQ4v/+NO18So0FZcfpoZApFZ5diKMw119tPXSI7wk?=
 =?iso-8859-1?Q?GzfNtpE4JxRX8tP4yAH8P59oy2UUoUYAq6MhcQ2Qw5OPYAdIUTS/28ys78?=
 =?iso-8859-1?Q?KMlWEkk3zTdYg/Cdy7cf/KNogmDg7SvIy1FUVaa5ILyyqnAIh4etkBlpCb?=
 =?iso-8859-1?Q?rz4Vn8ARAjPL3mH0XymvwTy3dk5eILDFVIA/KZXfmYanJkbTGtoaxwXiME?=
 =?iso-8859-1?Q?XAJRadvNdsLFj7nZ6FG4Czg/yz6D1NrJ6WclwXhf1KgxsDBApWKWcDwXfC?=
 =?iso-8859-1?Q?EMl7++bUK5XTdTlPu28YlZW17Ca/816uPv8GWTnB2IwmcXt0FLIPOh4KBR?=
 =?iso-8859-1?Q?Omj0bqVQjvZ9TddjFJPc9M+hl0LIsPEzJbH3YY6iOmMvQlQBmqH6Ud+pLX?=
 =?iso-8859-1?Q?vPPdZR9v42Gr2Y6AMFvSoYWWYzSYpAfds0UWYC5YtvyXdPiZJEFkX1JRM8?=
 =?iso-8859-1?Q?OzyLH+yYUNasMFEolO1jEje2cTgdUh4qlZUziFVLEL6T7VKDOv2aB+cdhi?=
 =?iso-8859-1?Q?btXOjuOFEf3sJU+MggRdm/84wkHc3orm6HU/YeDrGjDh3wqnwMLAUL2+qO?=
 =?iso-8859-1?Q?OhJBfBeFr0Mqc1XR38rhee7B38gqR7XIpfo8unfvcGE52IDvhhSufHADMw?=
 =?iso-8859-1?Q?Ap+MK3iEfogzFPNQFvd23R+22cV9Niq8h46FdXlj/D0f5HpGdLiDOFc0gf?=
 =?iso-8859-1?Q?39SJLCyJK83IzQBX23wDRnlWkrw7b3Jlmh5xuVF2FY0io9Q+uRdT1bW7+Z?=
 =?iso-8859-1?Q?Y0odoRH9rSaCIajQ9y7vlGV0vnkMTVD+A1GHFBHKDpCyjcid/6iyar1cSw?=
 =?iso-8859-1?Q?vnmiQZs/lHGzEUlQP6aVVNhl3e5QA54+/UCd5HaCz/IWv3aZ5/1MTFlSUG?=
 =?iso-8859-1?Q?Vy/kyd3xGAxNBNXHP3mOfQLSBsIe1V0uxy1trYVCGUbSjbAi756RCU24KG?=
 =?iso-8859-1?Q?NcilR5y2HBmIIP5+dkL34cSZtlX9bUDzuv8g+TslFieq/hSdO5+WkQYtCO?=
 =?iso-8859-1?Q?2c63tZz6BUfnYlnx/KS94i5h+BdBXplfKpemtfEf292Y5eNgJ1R+vxAgEm?=
 =?iso-8859-1?Q?y3a/bZlWQ6rlgoSeLfinbA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Qq0Rv0YuoPZhQQlbP4tTjQynknD038r2UBtbnAwbr9oMq1Pu93r2ZHWUDD?=
 =?iso-8859-1?Q?KmLKfsuEel8MW/A/2gLWqiVElkkgTiOUZbHBIU63fvb1BvUCvp3Hse6aPh?=
 =?iso-8859-1?Q?rwv1nweHAV+7zbGGT6hH4fasDxrVxlsGSP1Z8BJjWJEpVn6cyJCiYpwj9D?=
 =?iso-8859-1?Q?qyqhCKpmrju+aQxJAuoQZbZfl3sJw1rXm+m89U2JUGMUBAhANWzlNnSdIh?=
 =?iso-8859-1?Q?T90vOTzShPeN5ZQaxOaeVpE8AGA7if/w9Mz7LSajMAoNhLT2XgrHgZh51r?=
 =?iso-8859-1?Q?JGEoXNl6X0nVaePfZr39Snotr3d+RSCUlFQOZxTTNdCkfV8MPxsM1Uf/2u?=
 =?iso-8859-1?Q?a0B7bRMYsg/z4xxP/5e2+jpVRaYYDEoMQQ0aQPTIZCr951iqjUu1w8QA9x?=
 =?iso-8859-1?Q?48UpEx/LMSaFIODdyy8FaQosnUpSEWj8ET/h1bGcaYG+JpeJ1t1mDSPe9S?=
 =?iso-8859-1?Q?MCuuCvlH/3gCypyiKyztvHASqjVJlKUUVlRwDrQhVlZSnoUHYGI4+gdnI/?=
 =?iso-8859-1?Q?QhT92i8HNIcwOvk5GgquWFsdSEBCDITvmmUl6SFynKCFjHxu6lPZl2uxLA?=
 =?iso-8859-1?Q?A69o1oT4A0MBwdnrSGhR5+5XdtW/8vUN6F9AHfBJO1y6xHxgaUF8dY/g/w?=
 =?iso-8859-1?Q?5LsTajBwXRWPeGNrnYMuqdHVnx3QClvZ2ljN3zQEaXlJ/ibt73jBS1M98o?=
 =?iso-8859-1?Q?Dk/7+dkHuFO1p95TJPB25KGO8wwPODeEZNrJjPUcyO7aQJefGRVET0vBrq?=
 =?iso-8859-1?Q?g/bXS9GYYJjVadZM0NVbCHPSjlUyyGpPxYamS9ZqsqIprrsSy+nDxC+OE8?=
 =?iso-8859-1?Q?e6bevnB6rGwlWS4Jjb5IJH0dLQf/43a0O0qeKdamvilAJD6ykHBZaSke4A?=
 =?iso-8859-1?Q?UgxOT+gC+fmWaN7XseLZ6kTnvSj8UyaISmJQWMd7GJGauMkRYjlXnzwp/3?=
 =?iso-8859-1?Q?BGQbpZcltjTknvKOVGZMgTTzca0SDzwZJIj+FknTRVmoNCXnYhDZNg0uDd?=
 =?iso-8859-1?Q?VNgHJCnJ500muunJG19lg0ltD3oJnkva1yyGMI2mK3tyt/B4kVcLH9jyxZ?=
 =?iso-8859-1?Q?+4JWt6koVAE70xx6CQZ3O2MCig1TbYULhVisfKdLJSyZXOuFNaK798+No7?=
 =?iso-8859-1?Q?nsQKG6HsEy/qx+gm006epIlXjx+JtCoPi4DdRirqkgxBFBNyHT1gXjiCII?=
 =?iso-8859-1?Q?WPgoeUX3e/L6dYK67/dbAJbFPN1irNcix/IYD1vn2Rr97iF/1i0is2WqR9?=
 =?iso-8859-1?Q?2hZK0lDkIdBEFSO8SuJZUGU1tRDDzS3PSpSN/h4z0bKt/lTHAFCFIShgEt?=
 =?iso-8859-1?Q?vTNDe71Za3CBECJXT+xmTRE4MniQfVinX5WcazAmLiY6wemu3nPcJdDaAl?=
 =?iso-8859-1?Q?l8swE6Y9H98GIvD2GoLNHitCKvZJdNglARwQa6zqvIYbM1dPjMB9sS7/2J?=
 =?iso-8859-1?Q?nTxqMFTwUoShYo03uBOTWhGVZ8Iv8Ttietfy590v7UjzhQGn/qvVrUBXbg?=
 =?iso-8859-1?Q?ZJ01Vl6EuZeTRHOyy0W8tpXMlPt2jCqgQdm/TFFk3eVkvEx0YsxDqVn1W9?=
 =?iso-8859-1?Q?LJAQJTAkfivkmLrVCMDY8JNk3EC+EmB/UuncRZrWxZyWNOXCx/hx2tLd+Z?=
 =?iso-8859-1?Q?9PHnB0h5fihGdfp5lyEB/CUZreCAmgZkKAseT6pCLaqjJlJmgrE6eINw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6d0168-552d-4310-da77-08de1682daa5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 00:34:00.4709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XQsSQM2b99Fr5RO2JkXEp/TN4PjR/yVwAF1yGTHFhZHCu3n6/5vSnci0j0QLB9U3Mt0E/sFRbGxRu3NpLpnUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF208195D8D
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

On Sat, Oct 25, 2025 at 02:03:59PM +0200, Thomas Hellström wrote:
> To be able to keep track of drm_pagemap usage, add a refcounted
> backpointer to struct drm_pagemap_zdd. This will keep the drm_pagemap
> reference count from dropping to zero as long as there are drm_pagemap
> pages present in a CPU address space.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/drm_pagemap.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 4b8692f0b2a2..173b3ecb07d5 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -62,6 +62,7 @@
>   *
>   * @refcount: Reference count for the zdd
>   * @devmem_allocation: device memory allocation
> + * @dpagemap: Refcounted pointer to the underlying struct drm_pagemap.
>   * @device_private_page_owner: Device private pages owner
>   *
>   * This structure serves as a generic wrapper installed in
> @@ -74,11 +75,13 @@
>  struct drm_pagemap_zdd {
>  	struct kref refcount;
>  	struct drm_pagemap_devmem *devmem_allocation;
> +	struct drm_pagemap *dpagemap;
>  	void *device_private_page_owner;
>  };
>  
>  /**
>   * drm_pagemap_zdd_alloc() - Allocate a zdd structure.
> + * @dpagemap: Pointer to the underlying struct drm_pagemap.
>   * @device_private_page_owner: Device private pages owner
>   *
>   * This function allocates and initializes a new zdd structure. It sets up the
> @@ -87,7 +90,7 @@ struct drm_pagemap_zdd {
>   * Return: Pointer to the allocated zdd on success, ERR_PTR() on failure.
>   */
>  static struct drm_pagemap_zdd *
> -drm_pagemap_zdd_alloc(void *device_private_page_owner)
> +drm_pagemap_zdd_alloc(struct drm_pagemap *dpagemap, void *device_private_page_owner)
>  {
>  	struct drm_pagemap_zdd *zdd;
>  
> @@ -98,6 +101,7 @@ drm_pagemap_zdd_alloc(void *device_private_page_owner)
>  	kref_init(&zdd->refcount);
>  	zdd->devmem_allocation = NULL;
>  	zdd->device_private_page_owner = device_private_page_owner;
> +	zdd->dpagemap = drm_pagemap_get(dpagemap);
>  
>  	return zdd;
>  }
> @@ -127,6 +131,7 @@ static void drm_pagemap_zdd_destroy(struct kref *ref)
>  	struct drm_pagemap_zdd *zdd =
>  		container_of(ref, struct drm_pagemap_zdd, refcount);
>  	struct drm_pagemap_devmem *devmem = zdd->devmem_allocation;
> +	struct drm_pagemap *dpagemap = zdd->dpagemap;
>  
>  	if (devmem) {
>  		complete_all(&devmem->detached);
> @@ -134,6 +139,7 @@ static void drm_pagemap_zdd_destroy(struct kref *ref)
>  			devmem->ops->devmem_release(devmem);
>  	}
>  	kfree(zdd);
> +	drm_pagemap_put(dpagemap);
>  }
>  
>  /**
> @@ -366,7 +372,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  	pagemap_addr = buf + (2 * sizeof(*migrate.src) * npages);
>  	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*pagemap_addr)) * npages;
>  
> -	zdd = drm_pagemap_zdd_alloc(pgmap_owner);
> +	zdd = drm_pagemap_zdd_alloc(devmem_allocation->dpagemap, pgmap_owner);
>  	if (!zdd) {
>  		err = -ENOMEM;
>  		goto err_free;
> -- 
> 2.51.0
> 
