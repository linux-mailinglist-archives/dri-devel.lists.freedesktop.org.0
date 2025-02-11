Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F50A313D7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 19:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F17010E260;
	Tue, 11 Feb 2025 18:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1uv6hB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED2910E260;
 Tue, 11 Feb 2025 18:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739297793; x=1770833793;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AFJo3/LFV+CkjaghljbBO1YdM84gCBgLrSr/Zc3LtTo=;
 b=h1uv6hB15HjsKJvy4SpxnRZz49O9blhUJMAwp9Zj3LVzECJwTZY8ZL1Y
 Jme8OgoyYwJko/GnMt0VzP/T/mJ9yNTVbQ5SNQ7RvEJb2rWTGVjladFgr
 vd6Oo2JoOzkTpJ+445tpJ8+h5deJNUBSUShl3ufXbiBWduQXY8vI2PYQL
 jcqTfL5wSPvq+6SG/wYhOoUwCmyQV3ZFdfvlBkZ8XdXl4FdxWgQUQxEpL
 fQItCJW+cpV3M1a2c+dZIgp5WPwQMd4iC0GANtbbUZ3m2gQuoT+vi8LRI
 yEBCwMbCxuXZGE9Qppfr562k7XQ8js3XTDW/sFZ/dtGQ2NcAsgxBidY+R A==;
X-CSE-ConnectionGUID: yx16LEqGSzyaAJr9DcrGZQ==
X-CSE-MsgGUID: nj6hJ2xhTQGlWOiMwwk48g==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="42775848"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="42775848"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 10:16:32 -0800
X-CSE-ConnectionGUID: L770+/J7QTuvhCHcR6V0ng==
X-CSE-MsgGUID: fxkM8uftScOqh4w1RNpu9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="113227869"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 10:16:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 10:16:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 10:16:27 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 10:16:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1pVn0XFJeEWcA4QRSy2nzwQ73IvW3N4cD6dRKF6S4v6q6Bo2oHXxJsXmYxgRRg/NdseZgNMWO7KOS87z7FhRKNBRC2rO0iqdF7BN5AgZVEx8fBifhz8IvvDL+1IuaxHVM3JHVMnaG+oUuy5dB5f0PYWyZzJMwmLCCtz4beYkWldSGaH9Rnr24V9nEm5goHx6WacbwbQwd/BaHD5iBozdt2mcZh0HcxPYBXvCN6j3NIrQ+eygjbarxxiym9kifxHPU0yj3dk/CaIFdtlEDqeac+8cLSkBWwZFabR6R+7FCvjMOYcVm338083tsa30hLrXdsthPUPL2PVxxFPAH93vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2n3HCEnS0MsZCUpzlCQcYSSOPuXpTkntA6oFjadc6+M=;
 b=YxGTxe6ZNNAMqdylxTaWa5z9dz4atwh6PI3KBjcpIhYb1STy3UEsR/kwRWykhKWcFxOicOaiFrdypJWQXCY5yCBEtQ40bmh9eAHXQybd2mTWZgnga8qtBBWylzFKgGqwnJ9qChCr+9hBWT8JSd98cbvV4poHNFAJhLYa1JeDrI37Gzwow8jlVisZSm0a0hB4k78F2omAcJhGp66bypjJdIbwhjUkFqCnc9py4OE/vYggc0QXDMpm5c68vLc7haHxSJRANdfg9U2buqoJQ3cjHAppSWHXJ4NJmnAf6a0s5OyYjNUID9A04w+e/udgYCwy58Spqz8QAD2e5nOXOxYgGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6665.namprd11.prod.outlook.com (2603:10b6:303:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 18:16:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 18:16:17 +0000
Date: Tue, 11 Feb 2025 10:17:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 04/33] drm/pagemap: Add DRM pagemap
Message-ID: <Z6uULdTti4HoKU80@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-5-matthew.brost@intel.com>
 <1c642a05ec279837394864e1e99226ea3e22421e.camel@linux.intel.com>
 <Z6pIY16rfPNDS0Xr@lstrano-desk.jf.intel.com>
 <7842182aeb75205fccde42ca4e0700a7c52bbebf.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7842182aeb75205fccde42ca4e0700a7c52bbebf.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0121.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b6ac2aa-fe12-422a-250f-08dd4ac82d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?1nxH0qlpjvZIlrCz214How4b5pLBZk+5zEL6cV2wPfkY6YPZ45y9MId/nZ?=
 =?iso-8859-1?Q?6MY2EK/H0zH1jMG5kfPrer0dcaB1rKza+9/dF7jBeOtwjUVuUVYBLNgGBF?=
 =?iso-8859-1?Q?We64HZ1MdybaiW+fykcTsDbhDPGg92gNJscBIIm62j8AlVEkOd8Iz+JkOJ?=
 =?iso-8859-1?Q?aGGnVvfZDD9Ugrjo1giJxkiGSeo3/xXV4jv1+grA3Qcp3wen/W7xGJy4Gw?=
 =?iso-8859-1?Q?0TUSGpNAxdMxanc1sRt3+EiaGeOvUUeRJO4eB2lgg7px8k3uwQaDnKuyix?=
 =?iso-8859-1?Q?fOYZueae1EuYT3fvYkAVnZ3/7yJzuW1G0RepY73tKfGgcFkfZ3eqCnxrzG?=
 =?iso-8859-1?Q?eqi51nWTNeWbpTuld0JtlVqp+bePjnvZMloXePKV8hPq0TkhEV0MPppzbc?=
 =?iso-8859-1?Q?6Mq0uHtbm5PmmNmbqIPB930AyhJ0JWPOJ1OL2CBWBN6+qKlHBaOGpP+K0/?=
 =?iso-8859-1?Q?+OiN9LijmnDsBL43hjfGHCbackbELPAWvYwF52yhVNV4gUMJyghsuPJQXc?=
 =?iso-8859-1?Q?09U32lNiqHqCAPMRENVrB9BhHyROb1uevqYUIwmSMRWDY2JtVDk1gfxBN2?=
 =?iso-8859-1?Q?mohQvnJCt1xoqcva4vvEbDNhzS8EU7FE8cyG2m45nh11K0G0MjqCyJTXQW?=
 =?iso-8859-1?Q?RJVqT8YEzi6erZCSByLYUMAp3eYqt9fvfShsUg6HJhCpbcaePtUUBgZcU/?=
 =?iso-8859-1?Q?NG4rx1+Q3hz1BjK1L2E/tql9yle2uWhByo6Mc9oBh1UH2XC8fKMZfGJ3gK?=
 =?iso-8859-1?Q?90G/W+mWzmargE3pCfLVn9EukSwxYrCzUrFQvvbH4a1yT0MpPAGZri8V0C?=
 =?iso-8859-1?Q?LCsrvZJb6iSX8sBd5z209cIto/Bq/egTYLKPs/sbPM6KiYDyuSRCLY8xn6?=
 =?iso-8859-1?Q?7TIpgFsHZydqJf06K5DPuPwVLR170RW0Kz+qyyCS0QlRifOFXmeHNPcUl+?=
 =?iso-8859-1?Q?d0+nNG23xU+7nxlUBO5ldpcJBzedfmhmZv6xYNLI+3ksoExfAZH/kKN1+P?=
 =?iso-8859-1?Q?cAr9Ypb0K9OTPmFzoVFuzu380oIFHChbCBWRNmMoJYXWuHUt5RrXKppuC4?=
 =?iso-8859-1?Q?QuprU4r0kFchjqqLvlmzvPzUdN1+I4Qy2UYi16+R4nsnnOtr+DK3Uo2+gN?=
 =?iso-8859-1?Q?wMIzZBVuihm1TEX9gkhIzUwNJvJ5NRsEV6L5NWrOmnUx+KBdgUv3hPnndN?=
 =?iso-8859-1?Q?f0aJu0vHLe7eqSGtnXfyJGznK1lFXMmaQ+NH4hXhvRrxVmlGWnbnM6zgFJ?=
 =?iso-8859-1?Q?3ywVkEDqej8/9aoPfy9JBpxrq5B1ExlgqJaBsaeS5RWKzlnYLVmOEc14m7?=
 =?iso-8859-1?Q?mvpuBArAwX4/HvHtp54YM6/wIgNqgX2efLj8MW+qVmwMbM7SpobzGcANlQ?=
 =?iso-8859-1?Q?334rAHy5qpio1YusfdnhTOvYQPd/P5YJ9/mqdwx0sRMSw+VeWBY7hCxbVX?=
 =?iso-8859-1?Q?h9NZSDksC2HTrQ9j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OyReTI2I3RoeUhmyPDKIDKGsNXiaZqEPQY+CslLue9RG/kFXI/MymHFFNC?=
 =?iso-8859-1?Q?jOtWXFF/0EcbpExwQKxUgRWQNnN8fkZ7vmUnxN7oJdvNG/+ZzIkmmh+Tqf?=
 =?iso-8859-1?Q?qAXjSSlOTUOZGn4moFpLpWQfUAEdyf7PxWCHB62ahgdnXcWWUBE0tZZbSu?=
 =?iso-8859-1?Q?N8D3NxO8YYmfC9kqvvo50czTcy+mwbSbig9BiI7IFB4QdGivRBrml4Mj4b?=
 =?iso-8859-1?Q?aiMVOpa0Sf6odIj+Esw8/lVzvuBkqR3gdNWUnhcIqupKJve8CZkK5LdumK?=
 =?iso-8859-1?Q?NjPQaDrCka8X7P+LvsWQ31wV/G9i9BPCXlJ/5x/Ln9+lGcL7cjJk50t4Sg?=
 =?iso-8859-1?Q?QMgXJZCqhJOepkcod4RentIPzYqJpzEC7GC/a828Vfmn5WLoUlxjJVwYDi?=
 =?iso-8859-1?Q?5dif5W8ULZpqXav1JDOmBVX74el17++gNyZjvH9ceNA5PRdeAaxYeifnpU?=
 =?iso-8859-1?Q?KsV/nyIjIF2HzRK8tCFjkWgUlhjF2QhE8Rvim3yUIga0StXTC/ourLbnth?=
 =?iso-8859-1?Q?ZjJmjv5rw5dZoKalongeXzJxKwtN2pKAIvlQHncbhq3xy4RyeBtgnOh75y?=
 =?iso-8859-1?Q?DIjnv/fmoVu+wI5DQMwDruaw2GOjqMYZQEVZf64jYxXmsxEsHgcwY/dLKp?=
 =?iso-8859-1?Q?2viTdMXEvPYWCjmzPMM4IfAYkYkcpSjXFpggIE1flX0srsYjaVc19rBULl?=
 =?iso-8859-1?Q?aT7TQ3d2ZmYx0B7eOH0cBDkT0wz3/Zbs2hm8ZvI5sW5JDiGyNHV6kReOh9?=
 =?iso-8859-1?Q?oE/fRCs0TwzDupHeIKAEboOxuU4FYzBKlHHyJZl09brvoMfmHuN8yTKrid?=
 =?iso-8859-1?Q?Go9sfX0UkslVZYYR+9Qjtd5KvN+e99pajhl9X3UsVLPJP5chshQx4Cmb0O?=
 =?iso-8859-1?Q?yz6+RCFBkzu5hdSA1CEGZdtWdQxquc1uV0K7NSOIuS3gK/gAfgKoeJOeIy?=
 =?iso-8859-1?Q?Vy0Jhz5SYJnQir1XnEEy54FahOt1ZHGsGiwGP2qf8p/gErTUMAXilkjQPq?=
 =?iso-8859-1?Q?GLt6goiup/dNIENPlEXqj1ZobeijK7varqmtYFljuCDfIE0tsiBV63MH3o?=
 =?iso-8859-1?Q?3zj+OKoWd3rGKRFfV3B1HDXhXWoxFOP0QPl5/SPnLLAZfRHQOSrGruM8qv?=
 =?iso-8859-1?Q?J89eK388vN3OlthsjdGVSTlb626CQsYsYOngV/+itYBRJbr2lTO0HHYztV?=
 =?iso-8859-1?Q?jP2zTiiROGycAQ3ipTjy51r6gyGa4KjTjVmZSMSbYT0VQqot+6UQ9e4h76?=
 =?iso-8859-1?Q?L0sH/d1Hx99mFAQl2MNVrHBAZeBZApV+gc2K29pdRPnqY1KpK8kU/sVWBx?=
 =?iso-8859-1?Q?n7r1XzMS74njPvqluzU8COPwAsZwZ2Q7J0o1CVq93+V5wwCh3x6wfgUqOx?=
 =?iso-8859-1?Q?7GL2o9SiYdHFMk48HuY35UDUBdowHO4QVXbOflGDnMK6vPHU4WCFQDk9Zm?=
 =?iso-8859-1?Q?k0eqi5JWU9mOuyCaq3LHuiNtZoEzKLMwOWjy8zSXMLgs9FYWrmy6Eu9GGk?=
 =?iso-8859-1?Q?zqab0JrHLlpuxa4+Mpk673CKfoodfM1wzkmc6iLwyyrfcC5vyXBH4iLAUF?=
 =?iso-8859-1?Q?r1H9uGdC6GMblS0SmBYGZBeEb+j/Nxu+4jLuBskRBRgTCETd6HFkQoFhUP?=
 =?iso-8859-1?Q?lQucaGzZsEPVbfUr5tchdtAVkVxHTlJYYa2cHMOg8Q+Q5Iv31zJMp4Jg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6ac2aa-fe12-422a-250f-08dd4ac82d50
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 18:16:17.2350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLahjOuAIjssndvsWfhEZdWpkRxY/1puXkJ16VMK4IGhkAoMd1+WRx5gGTbGZLZWM/VuukJYp1u4Ad1pHDvhPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6665
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

On Tue, Feb 11, 2025 at 05:03:10PM +0100, Thomas Hellström wrote:
> On Mon, 2025-02-10 at 10:41 -0800, Matthew Brost wrote:
> > On Fri, Feb 07, 2025 at 09:34:00AM +0100, Thomas Hellström wrote:
> > > On Wed, 2025-01-29 at 11:51 -0800, Matthew Brost wrote:
> > > > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > 
> > > > Introduce drm_pagemap ops to map and unmap dma to VRAM resources.
> > > > In
> > > > the
> > > > local memory case it's a matter of merely providing an offset
> > > > into
> > > > the
> > > > device's physical address. For future p2p the map and unmap
> > > > functions
> > > > may
> > > > encode as needed.
> > > > 
> > > > Similar to how dma-buf works, let the memory provider
> > > > (drm_pagemap)
> > > > provide
> > > > the mapping functionality.
> > > 
> > 
> > Trying to parse all of this. 
> > 
> > > It should be noted that the long term idea for dma mapping is to
> > > have
> > > that done by the client instead of by the memory provider, which
> > > Jason
> > 
> > - Client here is the device mapping the memory.
> > - Memory provider is the device where the memory is located?
> > 
> > Did I get this correct?
> > 
> > > reminded me of in a discussion on dri-devel. The dma-mapping here
> > > is
> > > modeled after how it's done for dma-buf, where the exporter maps
> > > dma.
> > > 
> > > So following that, it might be that we should move these dma-
> > > mapping
> > > ops to the drm_gpusvm().
> > > 
> > 
> > So we move ops to the local client (gpusvm) rather than remote
> > device,
> > right?
> > 
> > > The situation I can think of, where this might be a problem is that
> > > if
> > > the device-private struct page to dma address mapping is not known
> > > to
> > > the client.
> > > 
> > 
> > I'm not following this but I agree if dma mapping at the client we
> > need
> > the remote device structure given how the dma mapping API works.
> > 
> > So to wrap it up - what, if anything, do you think we need to do to
> > this
> > individual patch as part of this series?
> 
> I've been thinking a bit more about this, and I think a change we can
> do is to rename these methods to something along device_map() and
> device_unmap(). The purpose would be to emphasize that the resulting
> addresses are typically not meaningful outside of the driver, and not
> to be confused with standard dma-mapping.
> 

Sure. I can rename this.

Matt

> /Thomas
> 
> 
> > 
> > Matt
> > 
> > > /Thomas
> > > 
> > > 
> > > 
> > > 
> > > 
> > > > 
> > > > v3:
> > > >  - Move to drm level include
> > > > v4:
> > > >  - Fix kernel doc (G.G.)
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Signed-off-by: Thomas Hellström
> > > > <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > >  include/drm/drm_pagemap.h | 105
> > > > ++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 105 insertions(+)
> > > >  create mode 100644 include/drm/drm_pagemap.h
> > > > 
> > > > diff --git a/include/drm/drm_pagemap.h
> > > > b/include/drm/drm_pagemap.h
> > > > new file mode 100644
> > > > index 000000000000..2b610ccf7e30
> > > > --- /dev/null
> > > > +++ b/include/drm/drm_pagemap.h
> > > > @@ -0,0 +1,105 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +#ifndef _DRM_PAGEMAP_H_
> > > > +#define _DRM_PAGEMAP_H_
> > > > +
> > > > +#include <linux/dma-direction.h>
> > > > +#include <linux/hmm.h>
> > > > +#include <linux/types.h>
> > > > +
> > > > +struct drm_pagemap;
> > > > +struct device;
> > > > +
> > > > +/**
> > > > + * enum drm_interconnect_protocol - Used to identify an
> > > > interconnect
> > > > protocol.
> > > > + */
> > > > +enum drm_interconnect_protocol {
> > > > +	DRM_INTERCONNECT_SYSTEM,    /* DMA map is system pages.
> > > > */
> > > > +	DRM_INTERCONNECT_PCIE_P2P,  /* DMA map is PCIE P2P */
> > > > +	DRM_INTERCONNECT_DRIVER,    /* DMA map is driver defined
> > > > */
> > > > +	/* A driver can add private values beyond
> > > > DRM_INTERCONNECT_DRIVER */
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct drm_pagemap_dma_addr - DMA address representation.
> > > > + * @addr: The dma address or driver-defined address for driver
> > > > private interconnects.
> > > > + * @proto: The interconnect protocol.
> > > > + * @order: The page order of the dma mapping. (Size is PAGE_SIZE
> > > > <<
> > > > order).
> > > > + * @dir: The DMA direction.
> > > > + *
> > > > + * Note: There is room for improvement here. We should be able
> > > > to
> > > > pack into
> > > > + * 64 bits.
> > > > + */
> > > > +struct drm_pagemap_dma_addr {
> > > > +	dma_addr_t addr;
> > > > +	u64 proto : 54;
> > > > +	u64 order : 8;
> > > > +	u64 dir : 2;
> > > > +};
> > > > +
> > > > +/**
> > > > + * drm_pagemap_dma_addr_encode() - Encode a dma address with
> > > > metadata
> > > > + * @addr: The dma address or driver-defined address for driver
> > > > private interconnects.
> > > > + * @proto: The interconnect protocol.
> > > > + * @order: The page order of the dma mapping. (Size is PAGE_SIZE
> > > > <<
> > > > order).
> > > > + * @dir: The DMA direction.
> > > > + *
> > > > + * Return: A struct drm_pagemap_dma_addr encoding the above
> > > > information.
> > > > + */
> > > > +static inline struct drm_pagemap_dma_addr
> > > > +drm_pagemap_dma_addr_encode(dma_addr_t addr,
> > > > +			    enum drm_interconnect_protocol
> > > > proto,
> > > > +			    unsigned int order,
> > > > +			    enum dma_data_direction dir)
> > > > +{
> > > > +	return (struct drm_pagemap_dma_addr) {
> > > > +		.addr = addr,
> > > > +		.proto = proto,
> > > > +		.order = order,
> > > > +		.dir = dir,
> > > > +	};
> > > > +}
> > > > +
> > > > +/**
> > > > + * struct drm_pagemap_ops: Ops for a drm-pagemap.
> > > > + */
> > > > +struct drm_pagemap_ops {
> > > > +	/**
> > > > +	 * @map_dma: Map for dma access or provide a virtual
> > > > address
> > > > suitable for
> > > > +	 *
> > > > +	 * @dpagemap: The struct drm_pagemap for the page.
> > > > +	 * @dev: The dma mapper.
> > > > +	 * @page: The page to map.
> > > > +	 * @order: The page order of the dma mapping. (Size is
> > > > PAGE_SIZE << order).
> > > > +	 * @dir: The transfer direction.
> > > > +	 */
> > > > +	struct drm_pagemap_dma_addr (*map_dma)(struct
> > > > drm_pagemap
> > > > *dpagemap,
> > > > +					       struct device
> > > > *dev,
> > > > +					       struct page
> > > > *page,
> > > > +					       unsigned int
> > > > order,
> > > > +					       enum
> > > > dma_data_direction dir);
> > > > +
> > > > +	/**
> > > > +	 * @unmap_dma: Unmap a dma address previously obtained
> > > > using
> > > > @map_dma.
> > > > +	 *
> > > > +	 * @dpagemap: The struct drm_pagemap for the mapping.
> > > > +	 * @dev: The dma unmapper.
> > > > +	 * @addr: The dma address obtained when mapping.
> > > > +	 */
> > > > +	void (*unmap_dma)(struct drm_pagemap *dpagemap,
> > > > +			  struct device *dev,
> > > > +			  struct drm_pagemap_dma_addr addr);
> > > > +
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct drm_pagemap: Additional information for a struct
> > > > dev_pagemap
> > > > + * used for device p2p handshaking.
> > > > + * @ops: The struct drm_pagemap_ops.
> > > > + * @dev: The struct drevice owning the device-private memory.
> > > > + */
> > > > +struct drm_pagemap {
> > > > +	const struct drm_pagemap_ops *ops;
> > > > +	struct device *dev;
> > > > +};
> > > > +
> > > > +#endif
> > > 
> 
