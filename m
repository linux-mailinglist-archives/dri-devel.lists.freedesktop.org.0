Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8438A855D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 15:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C94113556;
	Wed, 17 Apr 2024 13:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEpKmIJW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBEA113555;
 Wed, 17 Apr 2024 13:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713362164; x=1744898164;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8XMy/1mfh8YKwanOtuj2nixgXwXZ56lfWBX6h5FLcm0=;
 b=LEpKmIJWCG5SxqN67ayg8orL/rLVYMobXnlbUuhvDjzn7jw9eMuNxtMl
 oMzCKh2fJax3MGOVx4y9NzPQsSGYUqtJCrNRhwPfwqPN7YYDuP9vSOp2Y
 J+Z4wJkd2234rOn03Vz3HLUo+tZ0n7IVot+IDNRNzFgmbZ9YIFNBwkHvk
 1ebYBNmvd3ZQlozHwzhUfpqyq2Ffj6G8REReikHXMJ9BUH0EDfUsJxoWC
 6RdWyFdDjkRFXwHPbHeV1nHH3l8SD3kmhI91efLlgD7oJiG4ZLO6oqIbd
 atW88NQNBTr/JAlloWJWR8ejEs3ynV4Oar2UwosxagGlO9NVz7NLOel8N g==;
X-CSE-ConnectionGUID: 6JgFZNJESkW/PsThHxGMkA==
X-CSE-MsgGUID: vHYHrxfGRB6yOqnU/GIXog==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="26366023"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="26366023"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:56:04 -0700
X-CSE-ConnectionGUID: Mgv+JzyFTxidZzFb21pI6g==
X-CSE-MsgGUID: g98Aa3iWSbiFbpifbwXNBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="22705400"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 06:56:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 06:56:03 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 06:56:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 06:56:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 06:56:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwRnTjMBgOompcGnbI3D9gCO+FrIKj/0nnMjCQBFvlnwWPdz8ct5T4oMOimtR8aN2nYjfY302zwclldtnpMmSdBB8pWB8Fx/oM+ra/8FvcZIR/SZTO4xv+CK5dgOF2d4458FjB0a8aJ1J0bleK7A1AhCb+nnzZlitxzEscHPiL6kXBRbAU98qtvEdiQIWHC/vDLT9H4PYT8Q0Pbnka/exhKB/NJfnwHltzze/IxEejrzIKObymjcxWz1kJAq1KBmYy25K/mJ3c38rhOkFIa7wFZ5jO/XVjm9Qu921vh5VVX+1O68o6MnfUy9ImRot33IWFirBOYrTn36AUf/ahWjDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyVIu6ELb0KR0JXlL6hcwK9XnNCRunKn7HTpo2QRnHI=;
 b=c3qlkstYR7kQiarmBJ+J3RA/OXFr2kpH0L71DAjjs4Z2APDHCIF4BQGldh5Aqit2adGJKFcOqiYC+o2kTU+h8kH6+SdgdTyuOa1g+O/YVjQqBNUChrQRko6RPUSMu96qpO+obrZRu2P6UACXch5qBMLITWlFBoZw5C/QLtl9TV4lVy+rboP6pwgTA1HPgCM5UCkdRb1AytYUMaeHhCxOBCgydHW6vrA2hGZpg2VZU+gwH4L4ODB8ApH5stXxzJZQM9NZQfPZYqrM+IazO6lbe1rdSeh3nJldIJtG62W0jrXYMw1AVgyYQlgm6iNm3LJEoX0dB/XXdW+nnBCA9634Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN0PR11MB6159.namprd11.prod.outlook.com (2603:10b6:208:3c9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Wed, 17 Apr
 2024 13:56:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 13:56:00 +0000
Date: Wed, 17 Apr 2024 09:55:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <airlied@gmail.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <intel-xe@lists.freedesktop.org>, Thomas Hellstr_m
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 1/4] drm: add devm release action
Message-ID: <Zh_U6zwzyS2Zlf0K@intel.com>
References: <20240417084145.242480-1-aravind.iddamsetty@linux.intel.com>
 <20240417084145.242480-2-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240417084145.242480-2-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: BY5PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:180::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN0PR11MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: cf7966d9-6c6b-43b8-be61-08dc5ee61ca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xpujeODAAYpWCwriM05CmZDKtKUFgscBHEr2qNXxejCcyMrJrJNiNeUcwNo6umc9PdEX6N7CL0qVGYVqVUW3uTQHpMqwpvAZfj0eY2WAt4e2/CMtCKsZK20wLKfQq5jK3z67v6vv795s8JdOw8bGO5rN9xO5WWjx6k6q1bhJhwN5E40C/e1mZTx1JTUjwCo3br13k3uZK6uznBTSxcsdG3DziVKbjEz9tZvxMbCgXpdwnqG/fieJAzDHLjICU9O+pen40Ionpr2kZDBx8L8EniqZay3TMe0g+pTTfT/uazuC74sFAjUHCTml/6hgC41BXM5pjfoNoLECk/7kcsRRZHNE0ThmzKf1DUSkBOIqhjLcF+gh55rfct6CmQOsI6Z3WloecGrH40RRjCC4kxRgRsmRPeG41PRectKcDAzh2l845smRDbU+VcWq7IRrZabB52ufV9B2tNAEpflg8Z9MUqc1fhNb4TnBzK2Becygk7gkrm9Fd/hJnb2hZRudsAtp05fei80RabtPXOUAkMW7Rlxe3d4TGWzrFSEIlxTagHldaL3HVZyln8Lv9ACf5UCRcsZRWE274ZPVQ7qOZTyA3ANGzKpT9FpIYdRqZHFNc+mSCrlbzOL0l8EBvDyWXcn9aR7BNqVK+F9VP+nG/r7efGbbhP6NptGidghepSO3qHU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(7416005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RWV84yQgNiT20XGptpyorrI7DyBJUY6+M3WDmQaF57V6tR6rLiwsnbRxyqxW?=
 =?us-ascii?Q?WfQHu6GIcbNsXz6HtXyxppKaQgh3BGy/jgJhoD3WZ5fWFd3ZqPWi/PB3b6me?=
 =?us-ascii?Q?Mt3psTHbAHF0ki3joOKWrnqg1/sBUwpt48BQn/tOFbKfNYeAQsWCSNF32vzO?=
 =?us-ascii?Q?jJ4pd+RkIcdDFY92MGjF7yk+QtXVpnQ1gr+zNI5ihIdrUrWM7i6Zau4yEQE3?=
 =?us-ascii?Q?yPlSHOxlJt+A0Qa62n9sw1b7roASWu5HTFH5nFCgoudvFdLUwat7ZUNvQjD3?=
 =?us-ascii?Q?Aw10UPB8VvLqUKrZgLv/ozDrCizK1M0yKJjyQpoOy6WLDlxR0XPA9qvbfOdP?=
 =?us-ascii?Q?/UFApHwkQIe4l+V77gM2BtR8R5s/oyoawRQ43FZ62x7MrebwZDKVKeUWrCep?=
 =?us-ascii?Q?NqFZK7lgDZbMTUectl2a8gOuKJFIlk06HXzFQohs8nGdh8YpAwdbhfOvrRMv?=
 =?us-ascii?Q?fbXTadQNWS3Cmcs6REEVw1mBCb60O1GbAv0U48uRRB9GDQz8W9eRXYEjf4iT?=
 =?us-ascii?Q?lDKd9CfiuKfLVO4omXn5jCVnpSe6wEswngnDAJIksvNnoPp6fkCx6iIxzLvJ?=
 =?us-ascii?Q?FJtq8mHG4YrmgGVXVOlHpogyL/38D3JYbrxJdBV3CM2KRNRXuAFy5/OccdMc?=
 =?us-ascii?Q?nxDrt/TiWgES/HTzfdwQIfptXiIwAEvaIc9RI3ElefDxAuy3CZ1AOcxGhp6u?=
 =?us-ascii?Q?T7O46ZLa+35O8zeeCLxOx7cjX5h170EjgUkuuaRFe9aTVW/yUl3N3revJbQc?=
 =?us-ascii?Q?7e/xF+t3WbLnLxoFL4c4xir0iyP6zkTdNkmB1uy/6zk9FHq9orJOk4lNSoD3?=
 =?us-ascii?Q?1DiMWGQ3fNRGSJiU8TuIfSO9HVdpoqRy4zcYxKmdyeKNYL6K1YEclktz1CmH?=
 =?us-ascii?Q?ldxM43/BBdiLkwQ9rdPlNQRAKuzFbDRtdNwSjV5pD7guPkAVt6OhDze3cmIn?=
 =?us-ascii?Q?X38M8sruDSqesqozBKTF966kgzqENl4DXKpXL6hxFo2XqYZPY1iKZT0N06WZ?=
 =?us-ascii?Q?cRgJwxqjNJmXiBvQLj2wgB1SGnI4H151jewrHFkd4CaCr55qing3JdBsZTYE?=
 =?us-ascii?Q?tSCMYv/vugSWUduNXpHEXkaSDTr2NPNxhmkDTGCg9e1SRkwrrT/SzGKUTV+p?=
 =?us-ascii?Q?KOZR+mzqGFKN2FSKFHhLa5/AhcW2gGDPkBho42h4vIi4FBdJZu7iktUUi2C/?=
 =?us-ascii?Q?rDYnpcr5+MFQxbhBwlpOqgPP99+DNrIs3KfEakuCIwfw1ouY67k3zO1l8Xt4?=
 =?us-ascii?Q?GXDLhqfquQea3AP5wAlQGfpj7Gk9++J8Sja7ewhWeXkuxMC055p+q9hCwVqi?=
 =?us-ascii?Q?c/0FMxPME0NxKNm9gaEfgGh/ggEXWST43ib6MjolHsh6gI2rhekjggblq3sc?=
 =?us-ascii?Q?pvCVy39XEIaBn4c5y3vu/rfLRfLqAmkGbB0DqfpDmyMFuFOsp4KFpAhX+KJD?=
 =?us-ascii?Q?6ZszJQP7zn4brJ5UPZihMu9nAfvl8bRhKh88RECjBsoMZXsdGIWabJrkNVx+?=
 =?us-ascii?Q?I0ZNwd9cE/Os+MV3wqaAebK5ex2K0bB3fDX5XasLXkc2OeMRwqz1jyJZilXy?=
 =?us-ascii?Q?kuBUHZEsPYW7X22FACnH0WglcvpiEhGr/ehBSepTg/5jGc8+iOgCcOps70Jp?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7966d9-6c6b-43b8-be61-08dc5ee61ca3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 13:55:59.9257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKIcO4c0Hq37M2s+NVxLQY5b1u9W3ymd8LOxzGr5kzcUyNmxCzVrMaXI1BtX7VsZhHmJtn10HS31klkImpDDdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6159
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

On Wed, Apr 17, 2024 at 02:11:42PM +0530, Aravind Iddamsetty wrote:
> In scenarios where drm_dev_put is directly called by driver we want to
> release devm_drm_dev_init_release action associated with struct
> drm_device.
> 
> v2: Directly expose the original function, instead of introducing a
> helper (Rodrigo)
> 
> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Sima, Dave, or drm-misc, ack to get this through drm-xe-next?

> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 6 ++++++
>  include/drm/drm_drv.h     | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 243cacb3575c..ba60cbb0725f 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -714,6 +714,12 @@ static int devm_drm_dev_init(struct device *parent,
>  					devm_drm_dev_init_release, dev);
>  }
>  
> +void devm_drm_dev_release_action(struct drm_device *dev)
> +{
> +	devm_release_action(dev->dev, devm_drm_dev_init_release, dev);
> +}
> +EXPORT_SYMBOL(devm_drm_dev_release_action);
> +
>  void *__devm_drm_dev_alloc(struct device *parent,
>  			   const struct drm_driver *driver,
>  			   size_t size, size_t offset)
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 8878260d7529..fa9123684874 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -444,6 +444,8 @@ struct drm_driver {
>  	const struct file_operations *fops;
>  };
>  
> +void devm_drm_dev_release_action(struct drm_device *dev);
> +
>  void *__devm_drm_dev_alloc(struct device *parent,
>  			   const struct drm_driver *driver,
>  			   size_t size, size_t offset);
> -- 
> 2.25.1
> 
