Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A49A3347E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 02:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AFE10E128;
	Thu, 13 Feb 2025 01:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GxlpIsNH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8EE10E128
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 01:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739409438; x=1770945438;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aSZCFnlXcIiMfqvYN0YRSc1YJ3gsvnUC6gRr/HgQ2vA=;
 b=GxlpIsNHl16lmg4vwYQsqX/fWGegNXKAKlkWJtcjq2KPiLrUxzQIzNVO
 Krl0aVlVGlgDokSUHJAsFUCuwTtf+B2XM6FGg3qcoIwHqSshqTmDZJJ6u
 +4jjDfXT5rMiw0KHB64fm+V/vOJt6mnytEuSsla40tVplMx3FqG2v+VBg
 PGr/aG2cRi3+AFAr/CaMg2nkTKhMEclM1rBBDgALCcKWls7KtMGjEcHy7
 DSn/A8glEidQRlP5zkkMlbYfeo9Vw5080DXpTFhc9DoDsUGYryHgpY7ol
 dee98omnvXqF1tmAYzRXTAKsB7fTP01hntciYVbgY4+XQCBUbkugJeFoC g==;
X-CSE-ConnectionGUID: QH1DlXr6R1G1o/Uw1xeu5Q==
X-CSE-MsgGUID: lcOnyzVfTtGIKH+euuGkng==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39278954"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="39278954"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 17:17:17 -0800
X-CSE-ConnectionGUID: m/FVbfFbQvaXzZB0GLha9g==
X-CSE-MsgGUID: 8TX1VqROSgic/geC7hba5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="150158498"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 17:17:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 12 Feb 2025 17:17:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Feb 2025 17:17:05 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 17:17:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOizElYtrDlK2KcL1CRy/zego8IM14xhG9sR5qgLjLANVqVEqiEKYpX9ZMJ6eNmoD6vw+F8ulXUYA6s269UadpOmp/XtCsavZj/5XGKpn9GWJQIdm9jcvOxOnEhlLg35QUwzxvxu7TELjhK/Tuhux4F6Q98wd/XRMAevqQk8kIclJ3XF0AGLZR7j4Hdm+H3nrTlzr6DvHtn9BcrwOpzNhhv56kYetp+B2kBRVmvOONIIYGboZ5fK47hCCxtUwyfArHee0UmeS5EFte9R625f/XOcMgjS873zvBLu2Gi1WKa6umIkG8kl151FhFlYT1enCde5/D5wf5A42jNo4rbmFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDMf+oZCKauNFdczl5ZlwPmmPjr27DBBGmtz4NEkXpc=;
 b=jeFCxQzdqyhpajnRtUVMbVqcxDMqmC+kjIM9AVNShLBaNQkZhaskYqn9bct4oNLxckB/h/6UsT30OZG0r7/9kKjucJ6kNaeYMVlRq+xVwSR7c0bJruC9KJdQOePi+Y6aSoaVsNjzMy9ynDP/nrhAqTvr8kBb2BagETil/2ss4vi46TGTUykFObVFA2r9JRVWUI+pUBY7hmiqiaUWGs1zbL5PqgvJ3LqBfAv4o8vLIdJUvGFHRPj+jmjKc54cbOuTrDpd2iWv/TWeWiyKNw29QitBlxwBSer9SQ5ko6THIuHfCZZ4ZSBtSB2Uqn07T7u4tt8zT6gCUTaGJgtoRskVJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB8030.namprd11.prod.outlook.com (2603:10b6:a03:522::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Thu, 13 Feb
 2025 01:17:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 01:17:02 +0000
Date: Wed, 12 Feb 2025 17:18:03 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Neil Armstrong
 <neil.armstrong@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Liviu Dudau <liviu.dudau@arm.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Stephen
 Rothwell" <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm: drop i2c subdir from Makefile
Message-ID: <Z61IS+WVVi049Dp5@lstrano-desk.jf.intel.com>
References: <20250213-fix-tda-v1-1-d3d34b2dc907@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250213-fix-tda-v1-1-d3d34b2dc907@linaro.org>
X-ClientProxiedBy: BYAPR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:74::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB8030:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c41cc7-5c72-496b-5e4b-08dd4bcc1f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7bQTY/bvgfDvL0MbTuNPp7565MOxe8Lw3iL/jFLPl3183wq8D0zud7lF5m2G?=
 =?us-ascii?Q?8qWBoxIFuqYrLzSn1EtKEjE01e0mC7x7Q3XVGPOKRIjvkJXcqPeli7j2s5/V?=
 =?us-ascii?Q?KR47Ns1snINGGMwZPIoHeDTcqsdbMCYTf9pUIpJynhTz22sk7TdhfjgzVo5h?=
 =?us-ascii?Q?my/i6KONryU/tceFb5px74RBHDn5teXrKJ8QHjEu1CMKlL0K4k7xzBrJ8n7g?=
 =?us-ascii?Q?Llhlhhqtv7UT83YTb1ZMIeLY+jq7Mp4rLwAowE864kGBkl/RtUkeP5XlPXXW?=
 =?us-ascii?Q?MKToEhnVL3hb/XY3kaRcqU1+2AOcTJ1b0a6XaMX42WIdWedUzZQMnhu5uSFY?=
 =?us-ascii?Q?fHO6KTl7V946fihueTIiQcY3Y0OVWq64ptb4oAo0u16v/gziL1ihRJROFe8A?=
 =?us-ascii?Q?YrvQ6k6e8nJgFzWpEQuqQArxkwpoY/exuJ4CDn4H2RZuvgaaCJYn77ogAWLY?=
 =?us-ascii?Q?4juSyY2AHyXSnDRS7BRDnpgEtcqVV3ldJFVqLNFvMO/JiplrLnAYLqlKNbur?=
 =?us-ascii?Q?3WUfpEST7S+SaOhdofgV+CXoQxhtf21KWXVOyUvkFdoCL+ZtmgLQqjGddk/k?=
 =?us-ascii?Q?UnILlJ2Iv0UDd+vqBXI95KqEe85/rtQ0MHoWyKUlW1k0mpYcAtkQD02QCKYb?=
 =?us-ascii?Q?lBf49vC3NENn6r4JC4PSHznwhCRBEQEdSPp8xW+62N2rxXWjFG1VOOQsbBku?=
 =?us-ascii?Q?mN0xsvIxReRJSRqUtlICn0DrqQO6ugmiDd1NJOUwpS2LzMbGZNWv0FryNthK?=
 =?us-ascii?Q?lLxF1E21oYf3D8apIWUETW6vzWecXZj8Iemh7D+ae0uLDN4LQmo/sttfmWfm?=
 =?us-ascii?Q?ltZHTIap5EbfICXrLCeEfYC+fzQDVqHYOcf4DK7SJUTB9kgVQjmQIjT63z39?=
 =?us-ascii?Q?vuk5aRzNKSSME2cT3nvNWSll4oho3CCWBQF4IyhoOzKdfNd0akGLbDkQ+DmM?=
 =?us-ascii?Q?rb09iyjiLqPEdV+ZK32zMayqQlGpQ5Z5EqTBEA5K+frdRrWfh2BxAe4+Si/3?=
 =?us-ascii?Q?3QOFvDtV3t0e1JlRwhjunTyGFU4OU5dsgcS9SM/ga3VTmRhkCQqVsCpNtCm0?=
 =?us-ascii?Q?FEgkAYBKJErNF0Ab/xGBnFFUdjBxLm5VDD6qL5Buop3otEtnEsvS7HGhQSSw?=
 =?us-ascii?Q?bfP/st4yGT2K5muqTZrvC5bx+RmOA6gVtBezxayLPFansyc456TylClHfI3/?=
 =?us-ascii?Q?gAg7aCjfzbXDsZWaVxDhykUFG/lCpaSdgLnVABjALjeFmx9xRyQYJRSgai6f?=
 =?us-ascii?Q?YjVpHTFuYb4/GYrLLE5OYbltwq5ACTbop3Vyvzqtlcl5fFN1FzX98xrGpQhr?=
 =?us-ascii?Q?PIoJPWhsotb3yx0K3WrDMnR0z+z90sgqudBIiHtmkn50MjCM0nNlwuWERMzL?=
 =?us-ascii?Q?3ogQpvLYTfVvnB2vhDi7Ag4gKoQ1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+M7O/qBXP5x7QcwsPJI+cLOVOVQmKQtJbE34akl/WeimYR2YJmm1+nUkY730?=
 =?us-ascii?Q?wr1gIdHsnuXY6mLHvebplIoFuSV3Zsjt6cHQkXh8AJwekU10KgvW5ZR2pzQo?=
 =?us-ascii?Q?OMd+4uDN9DJ4T4u88hzcgvw2wGEN9Rd8vASp94oe7AlaHh8gw/SfFI1XjY5Z?=
 =?us-ascii?Q?lBOr9XURFYm8x4K5C6MgKZffBygpijGqdJPO31G2gyoJCM5UNtFmEjIW/HvS?=
 =?us-ascii?Q?vwyv+DAQL4aLgmowBN+63PUpnJmVN3BuD5IsVaCM0c4gxX4xKwAXck8wv8GW?=
 =?us-ascii?Q?PjD1rVplESQVHBIwBPkLPzoqFHXtF8xaMhLWHmAWMaK8aHKTKOwVFqiD73s9?=
 =?us-ascii?Q?y0uR1HZsJY1FZ+FB+n936oMKWxpdjTtuLFO9kS3sMKSTR/W4ha9oTgiJmp5S?=
 =?us-ascii?Q?RsROxWVH4fanoWumWQuGjl0EqbigrGqOFes6KptygF+lIvbasOQjsmZNx1rq?=
 =?us-ascii?Q?JjJEKIZVx0nD9uAZSKDHxhLoTPcJQVfdbobXnBscXx5awQ1PHqVI6dIM0Mcv?=
 =?us-ascii?Q?/2oNCI0jJPLgsLdZgSg6x/U9yA4Q7voq5gA+r3727T8qz3Fmw/U4hHxdKwbn?=
 =?us-ascii?Q?yJabW9uMAvxVzSlnxm1Nnzgv9XMrse/8qI1rBXRFYD9OA5gevchWivH14/dJ?=
 =?us-ascii?Q?kTfYN5LPmtfLF1WTD6QekAG1mluSgki/FV/9fZYN56yTpJipIrgIyyTU1SRn?=
 =?us-ascii?Q?/AUvoDAIv3qvt6IFcDy6TZZHjlROoL/EFXBILDrXWGQ7639JxXn96gyKxKQ2?=
 =?us-ascii?Q?ne3NgyPGzIpq85IxVyryrbB6LLE+OJZh3DgGgLWgz/P+8JE9mklnjRAhc31S?=
 =?us-ascii?Q?Fitvc/1Jxb5n0zp4cMAumFOu9mgM2oxPv8puAWZ6l1+AQaazLFL22q3Msko5?=
 =?us-ascii?Q?DX89O8eS7ABXSnQtootw7a1wDUhn4aW0s7VkAUHUrkJKCS3F7mhqzq7Hb6Hp?=
 =?us-ascii?Q?tp5BN0fgWGkPUax4w8vYTLLzJirLoRXM721Z7iNowZGadB3sI9ysfJE2pRQw?=
 =?us-ascii?Q?gaWIAzj/e52k/8gN8z28Ked4QucZN6exUbeMFHVRsDxBRL+5IL4JAxOxwtKk?=
 =?us-ascii?Q?qZrAkHDXOR4s84Nzz9fDIF3LChnlqQvtiTKJBd/LKXk4q+ygSL7YxydDoPhv?=
 =?us-ascii?Q?M+uDQtD6mOd7qoPwMbyacF1FOBO73jLBWEUX8GAVVJQPEmgLWVJxopb2dTmZ?=
 =?us-ascii?Q?e2jXC/TJu8GRuaYaTTQpzOHTkvSpVL2ziR2xQewleeqpp493OCVjVoobW5v5?=
 =?us-ascii?Q?kNurZGe170+paA5ayikNFuXmEMII6YOiUMX91rx7dvyJ+rRNqANZfY07ezmW?=
 =?us-ascii?Q?7AwBGAPhgQ7wmce4hZYltxaXNadlwAjB8RtTVQYnc/WdQ9tbvBe/OvLlqlKv?=
 =?us-ascii?Q?lMWUxzo8O++ZLTFuVPTVN9RMgay1Ox+0k6wQlLDdsMjJBDuabr3U0x9y4vI7?=
 =?us-ascii?Q?bZcazDhxrK9UWsJ7XYgPuoGztEpPiNl6yDwlKMiJo7qPyATbjKpKbRDtI2HD?=
 =?us-ascii?Q?B1ZOG1J9JinverTmfgOowKCYfC1c2FmCcap38u8+srQBdiXl8uv+ZD17O1Aj?=
 =?us-ascii?Q?C2mHJQjt9BZzBvwElWzo48ndam4bmOj3uBDhfoyfeBsr+yT+j40VYb3uYu65?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c41cc7-5c72-496b-5e4b-08dd4bcc1f02
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 01:17:02.3658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZn/Z753bDgp/hZwii/qw5zQdfBz/hV8abFNTpV6l/i1/EKUCyS6TN5xyiFjaEMxG1V+Bs4Imrb3kw+72uGLuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8030
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

On Thu, Feb 13, 2025 at 02:49:41AM +0200, Dmitry Baryshkov wrote:
> The commit 325ba852d148 ("drm/i2c: move TDA998x driver under
> drivers/gpu/drm/bridge") deleted the drivers/gpu/drm/i2c/ subdir, but
> didn't update upper level Makefile. Drop corresponding line to fix build
> issues.
> 
> Fixes: 325ba852d148 ("drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/dri-devel/20250213113841.7645b74c@canb.auug.org.au
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Our CI caught this too. Thanks for the quick fix.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/Makefile | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 42901f877bf256765829b5fe25bf7844202338cb..50604b49d1ac4edd439ea73361118fd1e6a81d53 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -197,7 +197,6 @@ obj-$(CONFIG_DRM_INGENIC) += ingenic/
>  obj-$(CONFIG_DRM_LOGICVC) += logicvc/
>  obj-$(CONFIG_DRM_MEDIATEK) += mediatek/
>  obj-$(CONFIG_DRM_MESON)	+= meson/
> -obj-y			+= i2c/
>  obj-y			+= panel/
>  obj-y			+= bridge/
>  obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
> 
> ---
> base-commit: 325ba852d148434c5bcb06d513af1933a7f77b70
> change-id: 20250213-fix-tda-74b6916aaa00
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
