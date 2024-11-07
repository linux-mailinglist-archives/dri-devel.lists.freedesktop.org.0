Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C8B9C1121
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 22:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BA410E8F7;
	Thu,  7 Nov 2024 21:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oxql1+Ci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9B710E8F7;
 Thu,  7 Nov 2024 21:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731015621; x=1762551621;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e0nSYyEVpnGowVvBmfvl8qD1rX9aTR3SpptCfTHHZHg=;
 b=Oxql1+Cili4DeDylIcjJIWDUmI0u1/Hkd0v9eQ2n0Ud7GlPb/hjARWQP
 ZOhswwyHEorxVeTU47kKXZKz6EzMnVH+5edoFUiuvoI+bLOjvdEmrq17s
 UVZtYtWv773vnBXbqRZGSifhcfwW1aBsR/G18X7CM9xwSWXLvME56hkV3
 nl7VPJllzEaVjposHRxlxoF+nF+SiKENqG7d3FywxuyZgr3B+ij7Fm0Yh
 +bKCKGhVQgEN26hBaChG8dcZ5jzTo30QXBUU26mgZaU6m56L7ZGPGhj2C
 vBwadObr7Nr/U/SDzbIqWzsfD0KbrOjzKB4DkAIiU+7hUBhLNFZDO4QgB Q==;
X-CSE-ConnectionGUID: T1wf46/kQ0yeJvvNH8etwg==
X-CSE-MsgGUID: X5FqeCP4QPW6KLQGUCnIXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30285574"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="30285574"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 13:40:20 -0800
X-CSE-ConnectionGUID: WgGiMXgSTPS4Ui7/xQFkzA==
X-CSE-MsgGUID: e582cXlbTlad3m5zxeRQUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="84864136"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 13:40:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 13:40:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 13:40:21 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 13:40:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/zLH0tXEx9+1PgvrczvTwVl1KL7TXpB8ptvdDNUn9ab2VvWZnbzHI6xGWQuM0V1GOJ+pgrvsotexQJskc66gy/fDZ3+xdvJ+ySZiLwg6h9JSjlYOkfPY1A15iTQGaGN6+7imibnOCZTtxVZR4/5OvE71aRPOFHjQx+yiJyXEjY9CoNKPX2Pa/qjOowO9zy8lEfjd2o/2S4tiPzVc6inoKQCyPJ9FKNnzr4OJEoDLmRHPBME8DPVanJAjHybC+b64w1qVXkGQ0u1PiFzJuHyJvAiUQohj/FqcYCQyE/Sbl/qCbNx4P7jEDw27QkM2L+koE1IWlsZfPXaZa7j6AhYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYSLn2yyrgr9w2HYdwJHfL/wMydvUPQzhftWy8SpbqA=;
 b=W3ukuD2LFUz67H3q2LKPKcjPipBo/h90G74jNuDTPuFMmf+9ngwEEt36bS/TniFhxkZB4Te/WcS4o0/2eXlbJ6PAsEa/gIoxMFaEpXRgiu1N2ZVDZZCRCJ7xL9GbXawBcV7qoe0Olp8ByIvaJV7N4gMWKmV1J15pjVutD+r0IOFOrgDMaLWUNF2+lvm2PL2vwUuhAsfp6Ou9aXBloWoD1fwiyRWKq1WgMNYlu1cojT92VC9Ut+5apGihImzyLMNolIyP5B/CLYBZjJr4lxSmHleRKuKmmHwQcIXCNYbWh1fh24xPZV5gIwGBW6AF8rCUx4tbkiISkHHFgM+8kJ+7Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB4799.namprd11.prod.outlook.com (2603:10b6:a03:2ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Thu, 7 Nov
 2024 21:40:18 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Thu, 7 Nov 2024
 21:40:16 +0000
Date: Thu, 7 Nov 2024 16:40:09 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Oren Weil <oren.jer.weil@intel.com>,
 <linux-mtd@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Tomas
 Winkler" <tomasw@gmail.com>
Subject: Re: [PATCH v2 07/10] drm/i915/nvm: add nvm device for discrete
 graphics
Message-ID: <Zy0zuXKAbwgN_3aP@intel.com>
References: <20241107131356.2796969-1-alexander.usyskin@intel.com>
 <20241107131356.2796969-8-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241107131356.2796969-8-alexander.usyskin@intel.com>
X-ClientProxiedBy: MW4PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:303:8c::35) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB4799:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d30aaa-6eec-4c26-33f9-08dcff74c477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KcE0XRvn/4jp0nkh+z31WVGsmnW93X3YkawZDDIZcUYnol6i4VRqW/D6BTjN?=
 =?us-ascii?Q?ta7EXHnUXr66vlPtzn1+QbaBxMRE+p1HVrMrObpR2mj+gYBmpzyFt2bbt/0n?=
 =?us-ascii?Q?Yy/OdI63vqDKqAXOn8lmju//4aORVnrLP+/nbupEIP+Ly6GHx9nbUFZJ9+96?=
 =?us-ascii?Q?VUtpmiL2QgoQ7NVcpwGCZVQ4EiF3gHjjfzx0JY3IAoJ5/0bJNMzMmQyZ4ubw?=
 =?us-ascii?Q?YMV/Q9o4pnru6pZE1OkJe5wrzrjLaD4mLmku5n9WB8lxUfd0bnmzrOaMJWVQ?=
 =?us-ascii?Q?KKKJDfS/VYVXpqe9y62WlKjl6A7PqAfDxJcPqVknR7ucWMX5kHIXrYYOQZDN?=
 =?us-ascii?Q?3WhPstj8SbW7SL6ssCKekt5JpRTQzSQ9QeNP4TB12Cg7fmWhm3Hd8apGDk10?=
 =?us-ascii?Q?nRfqIpZabLjdRK43nypPTDuQPCLOC62jjzp6N6tKPIZOGP026s53M50rljcg?=
 =?us-ascii?Q?euf8WfotwiduRFwJbnBzUoBC07e8V2Ekrnr2ZTqI9nmc8ETn9QOClDk2wQnG?=
 =?us-ascii?Q?4IxQz5fQ9BOnzoul/q+gHSCkTiNrk8QrFt92jJES4B35eDsqQU/549xF7DwZ?=
 =?us-ascii?Q?SWfdFipZjIlIxOjoecGHyJ2I3VEsnVNwZ3MvjriSuzDTxUiyZNfsg9gTc8s8?=
 =?us-ascii?Q?q96ZzA7aaclLgCeaWlrZBDNPpm3Yf2jksTmsXJrxzOZa2E+lk8EPFd0D4L36?=
 =?us-ascii?Q?knkogoZL4HNrIj2nf6jAy1/3RnUs016sXlFKiCNAaFti3nNrxGiLoM2CHFgz?=
 =?us-ascii?Q?BH3IOTHd+bKwUpmeEvh+Jyo4y1zbYafzQ9AvtzDdUP9LM/zy3tsf/T2GNfi4?=
 =?us-ascii?Q?OIvdPfajFp1gMTpOT1fxu0O7L1FrVRso7aNA6+KPM66b2dQkQxAD2zrJiilD?=
 =?us-ascii?Q?skUNE3G+uSaLGs5aV6XAcRHoBAWIqJcW4bHThuMi2hP4YPIOAJpypXGLQTOp?=
 =?us-ascii?Q?ZZf2kS5edNk+cVKzwHBRErRh2NmIiBoBNAIIPoFHN3Pa0LTq1/w2/do0Ecb0?=
 =?us-ascii?Q?e8woZysX9XyiU659xshXip9AxyYFztoHY6s1HHbAclcAe9UsOrAikGgVa4dB?=
 =?us-ascii?Q?l4OsqEUpgNa29/lCdgh8XZo53wijq1dBpQBfpBOPgz2C4bVa4/u+ETjtjlNI?=
 =?us-ascii?Q?V0DAfBpSvi7fXgp1jgwhUj0Y0AT41AucSKZ2CBRKtfbd0ecJT9fK3AtoW81O?=
 =?us-ascii?Q?KDzq6LLZ8QQKWBZVNGQDYgJIYWqnMtpxs60QABluMPKsbqt4Ko7VWCoZHlhR?=
 =?us-ascii?Q?e7inECebHUn2MNmU10NAjjGLqp64DFp5xhFJ7XEqu569H8g2m32sf0/6hPhJ?=
 =?us-ascii?Q?iUKwNHSewqDrOUkAOChpPZlr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VLNWRANEoxC8uzhCDbOuZXvmwy4IN6fQO1XNerawdzQ1UkqBEktxG/PrhA0R?=
 =?us-ascii?Q?85U4L32PPXZSf5ZvE8/B23oVLh+ikDe5gFqK07usrCdGs1B21x3pBmwQxtpa?=
 =?us-ascii?Q?J0CDSM9oxecdEWnp50Weq7Z90lq5jDgIY3Auq7jM9CLYSODPu6+j13mczjPr?=
 =?us-ascii?Q?Fd+B+os6DVCQHkQgOlmmfTuaA+BCtEgabJEAFclAEX0ZPIhu5LlkRKfJWMk0?=
 =?us-ascii?Q?AJyrv9irwLp4rXcEUym9b0OgY/JNb1GvYpeBAgGlPd/zV51SYAp3n6RBw5Ai?=
 =?us-ascii?Q?idWGWv9N7P7pvOr4N2KkSqQsQZDHmUJg5DX8dpqcXfagSvZe0kkc3uv0ki3S?=
 =?us-ascii?Q?dCegRmt1IPR6RAYBXJysc1k/ZhAxMohIU4zbmX4e+bLLYnq6igG+BbRJJQ2+?=
 =?us-ascii?Q?RP2gSWonsJe40rBi4ptKR2XDelM+qQRZqzl1FVgo6lX197mR7NSxIgwzWzqU?=
 =?us-ascii?Q?/Bo7FZZrb2z4TNCwWDJjXxazwQiwtIi2ShfmGoiYP1XMK9tzGKXnlS20rQ26?=
 =?us-ascii?Q?+t2PoRueIbzAZwda7VrJZEJLxks2bOKHr3+cDQr7J9uiMGg/kjbHOHsg1jnF?=
 =?us-ascii?Q?v4n2qB+piHOuiqAd5GBYaZ48eDzj9cTyyg7h2jgH4wgyA266g/Q3iPJkKl5w?=
 =?us-ascii?Q?BZRZnxyOA7no8C+9WKBFbZVlX+zaqzibf9z4+ac6B/I3MtJcOqRNKlRKzD3O?=
 =?us-ascii?Q?J7zHuVi/T60qNKN80W+XkyZWgxZos7KHpKIq0NdYxzzx1y/O3nz8LZJBCgDk?=
 =?us-ascii?Q?vlgoFLLGD7bCzT/bhCZzkz6WwJAH7Hqh7m0mzAQiH9lsIhwejYBLhWKwIGbw?=
 =?us-ascii?Q?kfcH/N92GDr9+35aObCkkAtXsb/XbXQDM/uGTwbw1INkCVoyJqri4GM1Vx2M?=
 =?us-ascii?Q?OUYdKUo6OoE8zMo8iN4GuG8LebIhlbJWFztY9Pjh+abHw665Q5fCilSJC67H?=
 =?us-ascii?Q?wf1EjgWJdyKi/RVGEPNqOqmPQsW2GMlImZ7pq9iNb6BxGd96z4phTmmIKlmE?=
 =?us-ascii?Q?5ae2D688ZJ85xOpfYDDk5TZ2g6wnFD27XhdEtiTV+HcQuItRqWK5lfFYCPPj?=
 =?us-ascii?Q?jrHZXwQkrlITe6JT9F1qdMF9/e7WzytND38wzywjODLepQa3mjrqaTzPeAg1?=
 =?us-ascii?Q?WrhPriLYtFgfShVy1ukkUHAKS6FLlGSvjP532d0ZpsnzoCriBmU1pF6Df261?=
 =?us-ascii?Q?AdY8FJaGjKAYMSY/7SScE4w5sJoV0xZv0xnUMFRIWmKJ9hnMn7ojdn6VdIrk?=
 =?us-ascii?Q?bTNe5yjr6vRlshzkVyo0/+4at4vKEtl5oRZzVZvwMxKOeETMMYMgGxgBXswC?=
 =?us-ascii?Q?vGSW9Qu7L664FCZEKKbRrNfmuw0kI3nmclJt0fzHpwAHY6dzYZVULklHHQ46?=
 =?us-ascii?Q?E3OXJago+AHP6hUSvBeanxGFLa/cwtAFZsImS4uNGlwPz5A0wBggTbpMtZ6X?=
 =?us-ascii?Q?WUq9c5HMRoi3G9Ot9FqWGlrZfPr8vem3mKaF5oTktzf+TBtPeYbxp52Z/TKz?=
 =?us-ascii?Q?ItN74l6r5yT5MdRouy1r4X33Qwb89WKwUHRQO7AC7SknutJ08umlnu0A53bt?=
 =?us-ascii?Q?zPQ19haZUsyL6qlV0IUuJYEpQ4o+LTzjlXo605Ksy4N46jnGRL9TAyM4nHz2?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d30aaa-6eec-4c26-33f9-08dcff74c477
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 21:40:16.0752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDRavW4m6gRBS+ZGduMY3AoIkv+VEmaQkIf21rFjwAHcOzKP9hlHMiViKjYp2WVIAB1sbrPEUafZXtJ2BBBVhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4799
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

On Thu, Nov 07, 2024 at 03:13:53PM +0200, Alexander Usyskin wrote:
> Enable access to internal non-volatile memory on
> DGFX devices via a child device.
> The nvm child device is exposed via auxiliary bus.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> Co-developed-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile      |  4 ++
>  drivers/gpu/drm/i915/i915_driver.c |  6 ++
>  drivers/gpu/drm/i915/i915_drv.h    |  3 +
>  drivers/gpu/drm/i915/i915_reg.h    |  1 +
>  drivers/gpu/drm/i915/intel_nvm.c   | 94 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/intel_nvm.h   | 15 +++++
>  6 files changed, 123 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/intel_nvm.c
>  create mode 100644 drivers/gpu/drm/i915/intel_nvm.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index e033bcaef4f3..09f509843b4e 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -212,6 +212,10 @@ i915-y += \
>  i915-y += \
>  	gt/intel_gsc.o
>  
> +# graphics nvm device (DGFX) support
> +i915-y += \
> +	intel_nvm.o
> +
>  # graphics hardware monitoring (HWMON) support
>  i915-$(CONFIG_HWMON) += \
>  	i915_hwmon.o
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 365329ff8a07..7f7dffdc8852 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -80,6 +80,8 @@
>  #include "soc/intel_dram.h"
>  #include "soc/intel_gmch.h"
>  
> +#include "intel_nvm.h"
> +
>  #include "i915_debugfs.h"
>  #include "i915_driver.h"
>  #include "i915_drm_client.h"
> @@ -620,6 +622,8 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
>  	/* Depends on sysfs having been initialized */
>  	i915_perf_register(dev_priv);
>  
> +	intel_nvm_init(dev_priv);
> +
>  	for_each_gt(gt, dev_priv, i)
>  		intel_gt_driver_register(gt);
>  
> @@ -663,6 +667,8 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
>  
>  	i915_hwmon_unregister(dev_priv);
>  
> +	intel_nvm_fini(dev_priv);
> +
>  	i915_perf_unregister(dev_priv);
>  	i915_pmu_unregister(dev_priv);
>  
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index a66e5bb078cf..faaad8b16ab9 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -67,6 +67,7 @@
>  struct drm_i915_clock_gating_funcs;
>  struct vlv_s0ix_state;
>  struct intel_pxp;
> +struct intel_dg_nvm_dev;
>  
>  #define GEM_QUIRK_PIN_SWIZZLED_PAGES	BIT(0)
>  
> @@ -316,6 +317,8 @@ struct drm_i915_private {
>  
>  	struct i915_perf perf;
>  
> +	struct intel_dg_nvm_dev *nvm;
> +
>  	struct i915_hwmon *hwmon;
>  
>  	struct intel_gt *gt[I915_MAX_GT];
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 818142f5a10c..eddafd5d7628 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -323,6 +323,7 @@
>  #define DG2_GSC_HECI2_BASE	0x00374000
>  #define MTL_GSC_HECI1_BASE	0x00116000
>  #define MTL_GSC_HECI2_BASE	0x00117000
> +#define GEN12_GUNIT_NVM_BASE	0x00102040
>  
>  #define HECI_H_CSR(base)	_MMIO((base) + 0x4)
>  #define   HECI_H_CSR_IE		REG_BIT(0)
> diff --git a/drivers/gpu/drm/i915/intel_nvm.c b/drivers/gpu/drm/i915/intel_nvm.c
> new file mode 100644
> index 000000000000..214c4d47a9cd
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/intel_nvm.c
> @@ -0,0 +1,94 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
> + */
> +
> +#include <linux/intel_dg_nvm_aux.h>
> +#include <linux/irq.h>
> +#include "i915_reg.h"
> +#include "i915_drv.h"
> +#include "intel_nvm.h"
> +
> +#define GEN12_GUNIT_NVM_SIZE 0x80
> +
> +static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
> +	[0] = { .name = "DESCRIPTOR", },
> +	[2] = { .name = "GSC", },
> +	[11] = { .name = "OptionROM", },
> +	[12] = { .name = "DAM", },
> +};
> +
> +static void i915_nvm_release_dev(struct device *dev)
> +{
> +}
> +
> +void intel_nvm_init(struct drm_i915_private *i915)
> +{
> +	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> +	struct intel_dg_nvm_dev *nvm;
> +	struct auxiliary_device *aux_dev;
> +	int ret;
> +
> +	/* Only the DGFX devices have internal NVM */
> +	if (!IS_DGFX(i915))
> +		return;
> +
> +	/* Nvm pointer should be NULL here */
> +	if (WARN_ON(i915->nvm))
> +		return;
> +
> +	i915->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
> +	if (!i915->nvm)
> +		return;
> +
> +	nvm = i915->nvm;
> +
> +	nvm->writeable_override = true;
> +	nvm->bar.parent = &pdev->resource[0];
> +	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
> +	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
> +	nvm->bar.flags = IORESOURCE_MEM;
> +	nvm->bar.desc = IORES_DESC_NONE;
> +	nvm->regions = regions;
> +
> +	aux_dev = &nvm->aux_dev;
> +
> +	aux_dev->name = "nvm";
> +	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
> +		       PCI_DEVID(pdev->bus->number, pdev->devfn);
> +	aux_dev->dev.parent = &pdev->dev;
> +	aux_dev->dev.release = i915_nvm_release_dev;
> +
> +	ret = auxiliary_device_init(aux_dev);
> +	if (ret) {
> +		drm_err(&i915->drm, "i915-nvm aux init failed %d\n", ret);
> +		return;
> +	}
> +
> +	ret = auxiliary_device_add(aux_dev);
> +	if (ret) {
> +		drm_err(&i915->drm, "i915-nvm aux add failed %d\n", ret);
> +		auxiliary_device_uninit(aux_dev);
> +		return;
> +	}
> +}
> +
> +void intel_nvm_fini(struct drm_i915_private *i915)
> +{
> +	struct intel_dg_nvm_dev *nvm = i915->nvm;
> +
> +	/* Only the DGFX devices have internal NVM */
> +	if (!IS_DGFX(i915))
> +		return;
> +
> +	/* Nvm pointer should not be NULL here */
> +	if (WARN_ON(!nvm))
> +		return;
> +
> +	drm_err(&i915->drm, "removing i915-nvm cell\n");
> +
> +	auxiliary_device_delete(&nvm->aux_dev);
> +	auxiliary_device_uninit(&nvm->aux_dev);
> +	kfree(nvm);
> +	i915->nvm = NULL;
> +}
> diff --git a/drivers/gpu/drm/i915/intel_nvm.h b/drivers/gpu/drm/i915/intel_nvm.h
> new file mode 100644
> index 000000000000..7bc3d1114a3f
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/intel_nvm.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2019-2024 Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __INTEL_NVM_H__
> +#define __INTEL_NVM_H__
> +
> +struct drm_i915_private;
> +
> +void intel_nvm_init(struct drm_i915_private *i915);
> +
> +void intel_nvm_fini(struct drm_i915_private *i915);
> +
> +#endif /* __INTEL_NVM_H__ */
> -- 
> 2.43.0
> 
