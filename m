Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0915A6AF87
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 22:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B060910E6CF;
	Thu, 20 Mar 2025 21:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DxsLan0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11B910E6C0;
 Thu, 20 Mar 2025 21:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742504595; x=1774040595;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Hk/84NqOMLpuHcvKpzMJiQRn+vqeO/wz+NWNFkM1ijY=;
 b=DxsLan0PZLyG8ufXZXuri8dx32dKJkFBhD4kbyi7ABdnF9rWVAEnN2Ty
 WTwQfbXJzHkIM/ud3JQ33593y+VVEH+VdBqEPRqMISie5VepSV6pDLaKS
 lVUvxxnYOzK7wcFsyQ9FGYmGPxcCKKOSxoLryG8jQfY0dJRcvql48Q9Tc
 MxWopMv1jo1WdhYXZL+PCSC9SqCBpQjESWgjI6qx9DvkDomJsSnIKrswV
 BOHTYXiRzm5KVL+pGKzPJ2wg2Oseztaxrfz8UJyqi41V5KP0nsu89nhsD
 qmnxkzKlmSSCl3Wr+3CymxVYL1P44415Mm+LxHXHR9GkwV0ooUCE0eYT6 w==;
X-CSE-ConnectionGUID: XL5Yw7V5RuqMRAfIVrQHsg==
X-CSE-MsgGUID: RomfGgKSQOCCwHEMc2sH4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="47535558"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="47535558"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 14:03:15 -0700
X-CSE-ConnectionGUID: GtVdiAf0TougVxhS75Wbgw==
X-CSE-MsgGUID: LKzCe1yCTH6tB6VbcoKcbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="160442185"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 14:03:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 14:03:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 14:03:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 14:03:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vii88bd4sKHgPf4e2ee8iU6s7injDMGr+dduUZRwTng8OqNPDWVQEhBFxHBLq3kGT+2aBBNRUn965+rxSClXiy+m3hMipST+7LKd6CocRolYVKc1V14BjU/zIomkAAOcGb/ThbdYAtX27cDHetJKluqGEgqBZWfKPwzJvPGa8x3IviuHy5rjBiqdikUbCc/Dd8CrQhUwyW64C2aFf5QafPMtq16vP9Sc3q4nHCTFL4W08DILW7kjpRCovOaRsJEopojPcipsgxI46drGa8lp1hsQJzEFU8LcYk0PgfK3cXjXOZw6XPq0/DCsrYm15MMjzD995QcwQwgXvPagtn0MJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipa6dId3az3WBVzZ3GCJkNUpbf/6YZOc5T6Ind8xgbY=;
 b=VUjqY9j3/YgXzNjbLUlNytQoebFJbpK0JkkUZJ3siDUi1bGyfpKB0AZZKBLLNUqymP69u27llD6zPKPO9Wqj7udhEDGt/LGkx5LD/FD7BJgDn1F2jbE9yn6bxthVUuUYchGIvyPihBQijWdT5LdnObhLV3RzHLfyoWVTG7D/ucMODhAGqkA3pcBc9dYZBCAnwgfWdQCziemEjHSWJAXz7j/m0A5vCF66W1X18kDy160n9U4NU+1TJw8b4zhPdwWSNWYoLL1UQGm8o2dqbgtQhS6janDkPDtcpxCmBiy2Pd6gvOPNxMy6WPKk4432sGJxJzlm8yEFxan7q0UtM6HRgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB7678.namprd11.prod.outlook.com (2603:10b6:208:3f4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Thu, 20 Mar
 2025 21:03:10 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 21:03:10 +0000
Date: Thu, 20 Mar 2025 14:04:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 6/7] drm/gpusvm: support basic_range
Message-ID: <Z9yC1FXIjnoIXIe7@lstrano-desk.jf.intel.com>
References: <20250320172956.168358-9-matthew.auld@intel.com>
 <20250320172956.168358-15-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250320172956.168358-15-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0337.namprd04.prod.outlook.com
 (2603:10b6:303:8a::12) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: 6471c8e1-007b-4c66-c79a-08dd67f29ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?mMcpg8F+1crReLitUKdjxUhdulcXQQiZGsx8jhTNEzU36Wnl+Sfjit0dzN?=
 =?iso-8859-1?Q?gVyTcGT1Yv6FMXC0bcM2m3OrCzCk2H+a1asM3sWJfv8yCFVjYbk1FXwwtC?=
 =?iso-8859-1?Q?nH4Vu8k4U5G8IsCqKYmZt4XM0Xs/zXHEpzwOVUwlw7xhRLX/DdPApW8BpT?=
 =?iso-8859-1?Q?ZgVoe6I9Z+b00KEv02zY8mc9m6lVPGnuWXDjIWfW8SQba6ADTZR6LAuW0Z?=
 =?iso-8859-1?Q?iZ2oFDYs0R0bh0vv7U4RgYjosSIcMWp1AgkgJHi2g09NswTguESUJY7MnE?=
 =?iso-8859-1?Q?qVyiFfo3dG6fWz2PB5IjTDPtBJKMqe1H3ALlwNHAlxeBKG5HvJ5uH0XiS+?=
 =?iso-8859-1?Q?CjV54yNAOnMRqJRnJiqXASrz6izmY6TfPN2OygkfvtZX/gxNKoRs5Uh+/E?=
 =?iso-8859-1?Q?A6NynFKDgL/dmMhF7c7d+2F0P9zXMY/rhHpDo9BXX6kmeXgC/kEF4Yn97a?=
 =?iso-8859-1?Q?rDNYwqb3F0IV1TN6RDoq+yxsdkK2KIJlwll+Ph1gdWF+SYpyP+u0unpJwo?=
 =?iso-8859-1?Q?Lo/pZLG0ayYSDayLlJvhR6Y58mEcfu/MX0UICiCuXmsdRRwHyKpeb5nFnq?=
 =?iso-8859-1?Q?CGr1gLKR2RwdPhAs83tj1O2qIaPU2L33p4VdAOGy2NQutecee1RJLbqFzh?=
 =?iso-8859-1?Q?e5K2QYG7+NoAeT5pkkD5AMlU1N91Qw8ZGBVeyMwvxGPncR1W4A6E3CmXjN?=
 =?iso-8859-1?Q?E6MCZjb4/gAp40Rd+kurBN/a82bUPy6ASAONG3shrncDCr32QD4fcyXJGp?=
 =?iso-8859-1?Q?JJEARnyPtnbl0l0zN2HbshHWNPJycnXrrB/15imxBg+G7Yc83qypP9W3lg?=
 =?iso-8859-1?Q?f8nWOhrPejIaazZ2AdUGRWE+H5Ov+YQ4Yb3aOhfTRl4VTs6F6cbWQMdeiF?=
 =?iso-8859-1?Q?wYrQL9yIpyW867ZDFTi84dZUHpE+c84nGOeFwzAOOAjePoTckDXEqHAc+S?=
 =?iso-8859-1?Q?ZHaocnMzjhg6f7RFuKnJfplkclyrObhkyqptlHp12Oj+LUjYS9EsJH1V4Z?=
 =?iso-8859-1?Q?OIkLU9mx2WgaTbUuekKNi1FZbWT52SOOJ4kqtMAesO3QBPPKEsvlAD2WgG?=
 =?iso-8859-1?Q?aR3Wl0z8YmENMNppzv0Et6WjDTkgdyvs+MWtf1qtkQ0L41vBX2mTQYgbfh?=
 =?iso-8859-1?Q?kwM1SOu46uqzWup/Yvw1gCwYwj5wzDCbpBTLqf+mmD419m3nkLwOJOf93G?=
 =?iso-8859-1?Q?S5mGm/eFnVPf4kwTQFTQP9W1kLvzDleQCmMELt7irqqwNi7AQ4QFnUL9Tu?=
 =?iso-8859-1?Q?HrhIMmvp6hf22BK0phHsjEtk7Wa865BModj1TiwB+Tay106pLAb1sSf/73?=
 =?iso-8859-1?Q?M+7zdtV9iT86FwyVb7ygIlbl9GN701a+ub5z4JKXGLYKMrCgSaUjHyUCCP?=
 =?iso-8859-1?Q?JaDBWoeY0mpbfjyzM3RT8LnL/k2q0ACg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FPkYgAv2nbEYMEXWEq9LNZlA2ygMLRwnvEflJaMVkmBQsDHnSTLD3ANI8j?=
 =?iso-8859-1?Q?o8nYm4U92oL5pbrSAQ6nguaB7gBUNXBD+we3k0O72PMTj9LxV1OsUjojBK?=
 =?iso-8859-1?Q?jtv9kPa97qJcTxWjBCHkKRMf2CKJy662qgbzcWfjonCuiZKLiA8WKsY/gK?=
 =?iso-8859-1?Q?kO2NWOlOoZS1iykS3ili2rP+ctkELMh5v0pG24z5zI1DxeN9EnNIYFXMC6?=
 =?iso-8859-1?Q?+2jHbNaE36QEDKCW+9FBM2rnwklxdAp5/EueepCJy40N3GQUjejqYkZ302?=
 =?iso-8859-1?Q?TcYfaKW4ij7Ntt+FwKJ2pWMR3yBpWwetVrtZHGTFSQFSR6rtp5zTTsg0cw?=
 =?iso-8859-1?Q?WS2lQR5dsbHs5ae1VX0lDCvBOVX7Y5+0D38FEF9lt4k/hQf/dIcMFGtb7c?=
 =?iso-8859-1?Q?Ic8tEXkOMQ/rOXecpql3fjsxB540FrmBmZQYvzgoJyhttSerK9jstM0njs?=
 =?iso-8859-1?Q?5EFb8xSOnOrPNx9ES/CqUC4NdYUER3NfONXEmJafI0H36xQ98bZ3cZw5vm?=
 =?iso-8859-1?Q?MsjUFaAYYvWLXRRU3qIVgWs+X8XVzOHVOsJ05xld/R3qKjNogua2SmzTh+?=
 =?iso-8859-1?Q?s6vOjtBdYGzQDNrY6ZDF5Yd5w5u6zVtO+IWNYCfbpKCZxt/O39wBFZru63?=
 =?iso-8859-1?Q?qsJ8iDMKoBdDxM3rAVAFziG+vSviMRZQosSokc0aZrSPiLm+mpMPqYPt9L?=
 =?iso-8859-1?Q?m82mW4zBedKvXPOFKd77f0qAo2yTDiudcfnmHTBZnZTLTuypM3tQ5yYc5k?=
 =?iso-8859-1?Q?wcT4MKRilmjGwgovT/h74M08X3KiXdZCqFj/Ls0K78dj4tzrbQp9rs3Plu?=
 =?iso-8859-1?Q?+fhVSlZU8Asns1Rl5nceMfZjUjFZdgWu+Ka2HqOFi6NJgDsFTr6bdA826V?=
 =?iso-8859-1?Q?wDy92OzICMHiRlLf+68KUMkPFVJwx0p0ci77h/pWcBi4vqpfEWo5ZEVXyM?=
 =?iso-8859-1?Q?cYdgUkstUx4lKqWbvi/4UJMPThUA/O5q5r3Fy61RZT9fXvpSzzNXp10qPP?=
 =?iso-8859-1?Q?CspUURUx0zxJ9FpoYvkpdLTFI+8WjsEudduBpbpSlE0xPU52kZJ0m4H1vm?=
 =?iso-8859-1?Q?jGzA17jU+LDB7jkEHL1T4De5F2qUb1Gk8tOjIr+TKXQf4PoFDaCH0INdKh?=
 =?iso-8859-1?Q?6tJaW5dTcAEvTcQCp6g3uwf5YD/w4WTB3UUm7vJP1nFuEcvNqLyIwSAz8R?=
 =?iso-8859-1?Q?rtxd05exkt/Q/ZgPxoH/23MMOUbkngB9vPzJimf9FRMPzXUhei3BcxNsJY?=
 =?iso-8859-1?Q?BtGkgJbFxeCVwKYfqWWnRz5PMITrFy5jVH3IwPEuLjZlynuN5fP9xYoC3V?=
 =?iso-8859-1?Q?OG0xACTvjOUj67w+2Q7MvkEG43DOw7N0GknNEFMXLIXRroYWO5fTMv6t82?=
 =?iso-8859-1?Q?QLvJxkIxmVREH0MLuE5b9UGtLbR9c+0fmRTGBlnI2qQlVz2Aw31CmYvCdZ?=
 =?iso-8859-1?Q?M65h0EtLRwfVoax0Y671D9sh+z0VqWJwqrHNkPSPIUIWRVzkhI71XT4MrU?=
 =?iso-8859-1?Q?hFcxV+stGBXfwwZo+L7FYYMssIiHAl2Vwl+Du6pNXrNNdoGzWqbQrJj6BZ?=
 =?iso-8859-1?Q?cFgbJUziquJvxolAx3lYQo4tuGTI5PJgzg8/SV3kCJ+pAnSzMtGG3TnYDq?=
 =?iso-8859-1?Q?+oUzkrjeFzgMea6jwMWo2C2vVWuI2TdTtjky/z8tIGrwIY2CVG64kW6Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6471c8e1-007b-4c66-c79a-08dd67f29ed2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 21:03:10.1863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bBJ63Po7xS1hP7zTZ1qDBWZpoNkY1cztT6aGwzosvu9+4weWq+U2jsEoSwPPVz01u0mS5rOtQU//eSohPMvPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7678
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

On Thu, Mar 20, 2025 at 05:30:03PM +0000, Matthew Auld wrote:
> Idea is to use this for userptr, where we mostly just need
> get/unmap/free pages, plus some kind of common notifier lock at the svm
> level (provided by gpusvm). The range itself also maps to a single
> notifier, covering the entire range (provided by the user).
> 

So, same comment as in patch #7 [1]: could we drop the idea of a basic
GPUSVM and unify SVM and userptr GPUSVM to share the locking?

Following that, rather than having wrappers in GPU SVM for
drm_gpusvm_basic_range, can we expose the lower-level GPU SVM functions
that operate on pages and have wrappers call these in the Xe layer?

Again, adding +Himal and Thomas for their opinions.

Matt

[1] https://patchwork.freedesktop.org/patch/643976/?series=146553&rev=1#comment_1177820

> TODO: needs proper kernel-doc, assuming this change makes sense.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 138 +++++++++++++++++++++++++++++------
>  include/drm/drm_gpusvm.h     |  23 ++++++
>  2 files changed, 137 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 2beca5a6dc0a..ca571610214c 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -521,6 +521,41 @@ static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
>  	.invalidate = drm_gpusvm_notifier_invalidate,
>  };
>  
> +static void __drm_gpusvm_init(struct drm_gpusvm *gpusvm, const char *name,
> +			      struct drm_device *drm, struct mm_struct *mm,
> +			      void *device_private_page_owner,
> +			      unsigned long mm_start, unsigned long mm_range,
> +			      unsigned long notifier_size,
> +			      const struct drm_gpusvm_ops *ops,
> +			      const unsigned long *chunk_sizes, int num_chunks)
> +{
> +	gpusvm->name = name;
> +	gpusvm->drm = drm;
> +	gpusvm->mm = mm;
> +	gpusvm->device_private_page_owner = device_private_page_owner;
> +	gpusvm->mm_start = mm_start;
> +	gpusvm->mm_range = mm_range;
> +	gpusvm->notifier_size = notifier_size;
> +	gpusvm->ops = ops;
> +	gpusvm->chunk_sizes = chunk_sizes;
> +	gpusvm->num_chunks = num_chunks;
> +
> +	if (mm)
> +		mmgrab(mm);
> +	gpusvm->root = RB_ROOT_CACHED;
> +	INIT_LIST_HEAD(&gpusvm->notifier_list);
> +
> +	init_rwsem(&gpusvm->notifier_lock);
> +
> +	fs_reclaim_acquire(GFP_KERNEL);
> +	might_lock(&gpusvm->notifier_lock);
> +	fs_reclaim_release(GFP_KERNEL);
> +
> +#ifdef CONFIG_LOCKDEP
> +	gpusvm->lock_dep_map = NULL;
> +#endif
> +}
> +
>  /**
>   * drm_gpusvm_init() - Initialize the GPU SVM.
>   * @gpusvm: Pointer to the GPU SVM structure.
> @@ -552,35 +587,32 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
>  	if (!ops->invalidate || !num_chunks)
>  		return -EINVAL;
>  
> -	gpusvm->name = name;
> -	gpusvm->drm = drm;
> -	gpusvm->mm = mm;
> -	gpusvm->device_private_page_owner = device_private_page_owner;
> -	gpusvm->mm_start = mm_start;
> -	gpusvm->mm_range = mm_range;
> -	gpusvm->notifier_size = notifier_size;
> -	gpusvm->ops = ops;
> -	gpusvm->chunk_sizes = chunk_sizes;
> -	gpusvm->num_chunks = num_chunks;
> -
> -	mmgrab(mm);
> -	gpusvm->root = RB_ROOT_CACHED;
> -	INIT_LIST_HEAD(&gpusvm->notifier_list);
> -
> -	init_rwsem(&gpusvm->notifier_lock);
> -
> -	fs_reclaim_acquire(GFP_KERNEL);
> -	might_lock(&gpusvm->notifier_lock);
> -	fs_reclaim_release(GFP_KERNEL);
> -
> -#ifdef CONFIG_LOCKDEP
> -	gpusvm->lock_dep_map = NULL;
> -#endif
> +	__drm_gpusvm_init(gpusvm, name, drm, mm, device_private_page_owner,
> +			  mm_start, mm_range, notifier_size, ops, chunk_sizes,
> +			  num_chunks);
>  
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_init);
>  
> +static bool drm_gpusvm_is_basic(struct drm_gpusvm *svm)
> +{
> +	return !svm->mm;
> +}
> +
> +void drm_gpusvm_basic_init(struct drm_gpusvm *gpusvm, const char *name,
> +			   struct drm_device *drm)
> +{
> +	__drm_gpusvm_init(gpusvm, name, drm, NULL, NULL, 0, 0, 0, NULL, NULL,
> +			  0);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_basic_init);
> +
> +void drm_gpusvm_basic_fini(struct drm_gpusvm *gpusvm)
> +{
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_basic_fini);
> +
>  /**
>   * drm_gpusvm_notifier_find() - Find GPU SVM notifier
>   * @gpusvm: Pointer to the GPU SVM structure
> @@ -1001,6 +1033,27 @@ static void drm_gpusvm_driver_lock_held(struct drm_gpusvm *gpusvm)
>  }
>  #endif
>  
> +void drm_gpusvm_basic_range_init(struct drm_gpusvm *svm,
> +				 struct drm_gpusvm_basic_range *range,
> +				 struct mmu_interval_notifier *notifier,
> +				 unsigned long *notifier_seq)
> +{
> +	WARN_ON(!drm_gpusvm_is_basic(svm));
> +
> +	range->gpusvm = svm;
> +	range->notifier = notifier;
> +	range->notifier_seq = notifier_seq;
> +	*notifier_seq = LONG_MAX;
> +	memset(&range->pages, 0, sizeof(range->pages));
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_basic_range_init);
> +
> +void drm_gpusvm_basic_range_fini(struct drm_gpusvm_basic_range *range)
> +{
> +	WARN_ON(range->pages.flags.has_dma_mapping);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_basic_range_fini);
> +
>  /**
>   * drm_gpusvm_range_find_or_insert() - Find or insert GPU SVM range
>   * @gpusvm: Pointer to the GPU SVM structure
> @@ -1176,6 +1229,19 @@ static void drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
>  	}
>  }
>  
> +void drm_gpusvm_basic_range_free_pages(struct drm_gpusvm_basic_range *range)
> +{
> +	unsigned long npages =
> +		npages_in_range(range->notifier->interval_tree.start,
> +				range->notifier->interval_tree.last + 1);
> +
> +	drm_gpusvm_notifier_lock(range->gpusvm);
> +	__drm_gpusvm_unmap_pages(range->gpusvm, &range->pages, npages);
> +	drm_gpusvm_free_pages(range->gpusvm, &range->pages);
> +	drm_gpusvm_notifier_unlock(range->gpusvm);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_basic_range_free_pages);
> +
>  /**
>   * drm_gpusvm_range_remove() - Remove GPU SVM range
>   * @gpusvm: Pointer to the GPU SVM structure
> @@ -1545,6 +1611,20 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
>  
> +int drm_gpusvm_basic_range_get_pages(struct drm_gpusvm_basic_range *range,
> +				     const struct drm_gpusvm_ctx *ctx)
> +{
> +	drm_gpusvm_driver_lock_held(range->gpusvm);
> +
> +	return drm_gpusvm_get_pages(range->gpusvm, &range->pages,
> +				    range->notifier->mm, range->notifier,
> +				    range->notifier_seq,
> +				    range->notifier->interval_tree.start,
> +				    range->notifier->interval_tree.last + 1,
> +				    ctx);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_basic_range_get_pages);
> +
>  static void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
>  				   unsigned long mm_start, unsigned long mm_end,
>  				   struct drm_gpusvm_pages *svm_pages,
> @@ -1585,6 +1665,16 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_unmap_pages);
>  
> +void drm_gpusvm_basic_range_unmap_pages(struct drm_gpusvm_basic_range *range,
> +					const struct drm_gpusvm_ctx *ctx)
> +{
> +	drm_gpusvm_unmap_pages(range->gpusvm,
> +			       range->notifier->interval_tree.start,
> +			       range->notifier->interval_tree.last + 1,
> +			       &range->pages, ctx);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_basic_range_unmap_pages);
> +
>  /**
>   * drm_gpusvm_migration_unlock_put_page() - Put a migration page
>   * @page: Pointer to the page to put
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index c15c733ef0ad..82c4e58fa84c 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -305,6 +305,29 @@ struct drm_gpusvm_ctx {
>  	unsigned int devmem_possible :1;
>  };
>  
> +struct drm_gpusvm_basic_range {
> +	struct drm_gpusvm *gpusvm;
> +	struct drm_gpusvm_pages pages;
> +	struct mmu_interval_notifier *notifier;
> +	unsigned long *notifier_seq;
> +};
> +
> +void drm_gpusvm_basic_init(struct drm_gpusvm *gpusvm, const char *name,
> +			   struct drm_device *drm);
> +void drm_gpusvm_basic_fini(struct drm_gpusvm *gpusvm);
> +
> +void drm_gpusvm_basic_range_init(struct drm_gpusvm *svm,
> +				 struct drm_gpusvm_basic_range *range,
> +				 struct mmu_interval_notifier *notifier,
> +				 unsigned long *notifier_seq);
> +void drm_gpusvm_basic_range_fini(struct drm_gpusvm_basic_range *range);
> +
> +int drm_gpusvm_basic_range_get_pages(struct drm_gpusvm_basic_range *range,
> +				     const struct drm_gpusvm_ctx *ctx);
> +void drm_gpusvm_basic_range_unmap_pages(struct drm_gpusvm_basic_range *range,
> +					const struct drm_gpusvm_ctx *ctx);
> +void drm_gpusvm_basic_range_free_pages(struct drm_gpusvm_basic_range *range);
> +
>  int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
>  		    const char *name, struct drm_device *drm,
>  		    struct mm_struct *mm, void *device_private_page_owner,
> -- 
> 2.48.1
> 
