Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D1BA79A23
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 04:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A603A10E155;
	Thu,  3 Apr 2025 02:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GI/GzRJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E4D10E155
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 02:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743648554; x=1775184554;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6RqBxQmSsdmDFALqZbSRW5iUeFiHMYddzc47ilPC2Qc=;
 b=GI/GzRJJhGI2dXB3v94WOo2c5jImhvqB/kq8xny0Gxz96ZrX2IHmiOh5
 qMMwIofmyM42QsFtZIE06TlYG/fbez1EM3VacE0j6WrtIaGTVGqA3rx74
 YSZxydTaENzwpaoXc7koby8MjyEqbElfJzLvBi3ByydrkUKUrNPinFnUA
 DSeSnCw7o2WsC5v3hgxHp0wZrjH4gog2CZCPxJaGL4GisEnQRiF4Of1VI
 R/WuftlUGJvijFYjEIxzOIazeaWVheNldn6dO8eZ34KjbjEddJmtQTNlw
 K+zwCH8K3ZGuDNHNTz054PC2lmo6g8w00k1uW7vjtZ0pVPFt7lTT7sNFK Q==;
X-CSE-ConnectionGUID: 2Ku75+mrQ3ukcoxcoZF8/w==
X-CSE-MsgGUID: aKVIWSOEQZqjZA5Wx2kW1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56412615"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="56412615"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 19:48:18 -0700
X-CSE-ConnectionGUID: D4VUoNepQdKIvk1bOg3rfw==
X-CSE-MsgGUID: fL3/rdUZTQiMUkcZZQiN0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="150080475"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 19:48:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 2 Apr 2025 19:48:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 19:48:13 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 19:47:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmDnbZH4yMmSGl9PV0Ca4O2WOeX1Kg6IBm5jV8XXHAC1L9OSjZE1RoIbXLCWrissTFWOIBb4KaeDlP+ADQu8nRC3HoS1PjH3vU7bFF3XxCFZfy9sQCfSWXPQxv3Z4R02gGjzVqe6GYRNfBeLPB2cSx56cs4XrG5TfV2TKS2OqrB9IpjH4TffFOAaL2qpGaqlfy6fWWs8RCtPh/R1eiivkHNsRWRMBybVI3MLaNqrpOk0mHUrnmQKjQF75wh94Cn4Gb6Y5+2rGJudcPTH1zz87B/UoBiBO/sccFeBwGjNzP4DhMXb7wAQOjTTFrTvorEnIzNpwdJRMy91GpQpSNMpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRPxj92DWq50pyag7EJUZYNOuIJ+Wzvv92qa104+fvg=;
 b=PgM4+rMg5OxniLiFlX2BBOlWFgJcMN5W6iDmlcLk7oDvWUNPvuWSMVSi/biS0VlepOwk4mO/KHMI5nkDHdQgVDMIXKK7RzkBYxjAf4LgzAn09hF4aLJoLbxqb5IMTvEWMj2ypiXOGqzbNNw0yZcn6FOjqsqF3OYhxLpYROWufeHJXFwqj20t6XFnLIiMZIO4y90LKyFCES/6373L8j4nHRD/CWPvytG101DjPF5IVM0EpRwuk+mg+sPSY7ducuEUMTfrub0lan0g0LWG7Btr6K/8cKG5eclQu2AZ850YCP71mpTbTi2b36+BzOBmFz0ZKc7t2aiaGOcMmgMcOSVEVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8752.namprd11.prod.outlook.com (2603:10b6:610:1c2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Thu, 3 Apr
 2025 00:37:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8583.043; Thu, 3 Apr 2025
 00:37:58 +0000
Date: Wed, 2 Apr 2025 19:37:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Christian
 =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>, Steven Price
 <steven.price@arm.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel@collabora.com>, <chaitanya.kumar.borah@intel.com>
Subject: Re: [PATCH v20 00/10] Add generic DRM-shmem memory shrinker (part 1)
Message-ID: <yt2vhw5pkhivn27johxyskpmcobika6ze3undthzdxfcy6yaac@t5u72u4auisi>
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
X-ClientProxiedBy: MW4PR03CA0230.namprd03.prod.outlook.com
 (2603:10b6:303:b9::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8752:EE_
X-MS-Office365-Filtering-Correlation-Id: ff338a4c-42a0-4d35-47cc-08dd7247c810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wofcwPKUxyg/h9DvSs7ax5oJNA3tlSQsJfZyx94iTxO1fc9ES1k0qvuvcDGE?=
 =?us-ascii?Q?CRq58hX06us15A6V15Lrc06WDxrYPF4HVyCGL0XF9DHaYMqsdfcB/kRnmQ27?=
 =?us-ascii?Q?zhlImcZ25jpe/LrWzPVXS890ezHddXTA4BptPvraio3f54X4+lcbBajOJyvs?=
 =?us-ascii?Q?OXAER2ELfD+gVM8yYtzLNpx87mFdjBeeRBEISiow2nD2Gxyu4qrmS2SIcKxS?=
 =?us-ascii?Q?WHa0Y5FJXWy+dd+LmwO+tR/8PC9vMv1ARMcTilxPvz74jEg2vu0oIKXxMIN/?=
 =?us-ascii?Q?2ZQzw8sLHpk7Kyu72l2YvWm6PyoH6BtyKVQJMVp2G67PKpAaGlhjuNZWdQNF?=
 =?us-ascii?Q?oTcZZ/qYZFnV0YFxy/IpvmBwhQZAZPjpTKXuJa2He4VmO8W02QVQ6TkLvbxg?=
 =?us-ascii?Q?t22SLt6I+nRBy++woTMhsp8rM0oEuzzu8PSG+5mq0tAZS9MSIrZeEIlpPy64?=
 =?us-ascii?Q?9LmjciZw2LBzqqqc+2+zC1NHs6VcIUHtYhETuVurdyOtdTNfZr377gz3KOcA?=
 =?us-ascii?Q?GWiF6BxC+J+975AUGMIMbRVHLoWlLU5SwBq16cd2r83n9eS0qCveEaPZ/L2R?=
 =?us-ascii?Q?GP3b3EVDNPo9pPSkd/ewlBjM3uZMi0DRHWZK2zuotY4KUoI9bMSyqGhvS+Bj?=
 =?us-ascii?Q?iDUqAGYNN0diSKQLWAUxutGFW/6adDg+umX2N6CXswXt2CHjK9kWe7H39Agj?=
 =?us-ascii?Q?tyFBasHxYHWpBEgsIeWMC62nZ88NxdZxdrDEj0oX3Y8qWF8PwE9NRKX85cV0?=
 =?us-ascii?Q?eODeXgkXsFWJcOuq8+HV5Qh3UcDfD+juncd4B6Vcem1f3bkJN7P7OhYY0AbV?=
 =?us-ascii?Q?U+GuaFuCl0lveS+XAiiG6m4tblrpbeBeKCcfJ4iJUFZ4vudXxyAwijOpg3aw?=
 =?us-ascii?Q?RI9RkM+BfN13sBHxBHI84dPtQyWkhUM5btZIFddb5sKo371H0a9w2Ox1o8aV?=
 =?us-ascii?Q?5hIqESOqoIca0J6efQDMTfTByT5hSXQOiZbaQJrXPGC9xaP2+iOPkQ+zYj+q?=
 =?us-ascii?Q?raiudgqBnEuGWL9f+lMP5UYdzcdClCr64XKagU+kinNkwZitxcQ5rymZXz1R?=
 =?us-ascii?Q?BAMfU0ccaMOpnhinOs7C7Wr5tE612ZmQeXEoHwq5KwJSCPvK5xWodIndiDlD?=
 =?us-ascii?Q?PbpEywPpCKtHQhLS8Sh1FK7TKbJSifbkIX5PwjtC7aaDeT5M3xDLChcKgSuB?=
 =?us-ascii?Q?Vcvg+ZJ21YPZt5kRm0ExF84lLcm04ix9Pjt2C/OS4CfV6DoyDR2rMd22AqCN?=
 =?us-ascii?Q?FVbRlzUr7XFo4nhCCJx6hnyh/Xbv5eutInUj8lFL+CjNzElr0dTy5O2waHpZ?=
 =?us-ascii?Q?Qp6JfC5nS+CLe8y6mgdqx+m2YHUdG/eV3MwwesQYTqsNPd2D2E5Q7uQT0AIL?=
 =?us-ascii?Q?cmYjj6yih62a1I7OkXZXqtZ3HGLI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4ekEfljNhTRGEsSJHh70f8My1YfD7ZmqcjJJ/xRvtuyR2dk62Sceq3s7OStc?=
 =?us-ascii?Q?7hZKGx68cQ30szeS/XyAA0mAg5JcZa88D+b+vKrdrZyLJKXlbPikxInEOQun?=
 =?us-ascii?Q?C9A7oqsh9w3e+oNvYcT4aECEhTchid7xDD+0NwUb08nXdTS7VMiYG1MWuvO/?=
 =?us-ascii?Q?wbkqgvCVd+RJmj9eeQS+sfFf2xoZk2BTQl2yVzhwvZe0OMKzXQtkTJBX9qv1?=
 =?us-ascii?Q?J4cPsCZka1yXudUWxvSjCOvF5P+D/2Gg6u3V1vjN3UzeJPhz0aJ6pAicrKRv?=
 =?us-ascii?Q?5PWd4Qd241tIdLvPqATw2AS24kt1uhOhgFXACi8ujR1KJYJjXKgEA0AT6CXh?=
 =?us-ascii?Q?JPbNogzcKOcZ8m1ProfQK2LiWmcv7lERal2a3XoQS+SLefXUr83CyA1Q4ItL?=
 =?us-ascii?Q?d+1iE37r6kpBRPTlAkfVthMymwLOeZFNcDZaJqu9EkfFwhA1/dhg4KMJjWHI?=
 =?us-ascii?Q?hjAzx3uWvxebaZZM0GrAQqvvuSGHeoU4SLziCb3RwQ5ShKlVDuwP2IW/QyE2?=
 =?us-ascii?Q?3QyunakNq4Wxc1NRIMZHToB3d9sd/EbNN85sqVDLJjpsVe2m255nVKaDHa73?=
 =?us-ascii?Q?wOXuYCuKOnwZw/Rhu0f1CI5qYkg12bbzxG3+Php/HowJHtDFPCjAq6WN5bnn?=
 =?us-ascii?Q?cJ2zxUfkYIXjDtAwPX1FS5/syTp0QSBILLbFfrviPG06BB9wbWipZf7yXsLy?=
 =?us-ascii?Q?90EUO0DBLoqWZqKLhyn4RabdgZfBjZffmHsG6hmElmxxfBu3sPegV5ZrD7Hb?=
 =?us-ascii?Q?qmfCNAjs3maPuTs4FkCYNAszHANAMAKdiwuveHhy1+a8Lh1RXBLWN4YxcvoI?=
 =?us-ascii?Q?yHEjV4XR7Ko2Ba23edLO2AlMf7ROuxo8Dpz3Sd91cN4nU2wx66CTt25hLgO+?=
 =?us-ascii?Q?0k9LDFIBwELG4Xa0Hh27QK9vKxBonfBF/TyEVMmqjIagyuQXlBX8ahy2ONul?=
 =?us-ascii?Q?pYyD95zq4vycoIRLlsMAViMqqzvt6U+tUKKFDZjOc0FHIPeVoqKnKtvZdsLD?=
 =?us-ascii?Q?RZMtS/bIvmbiWD3oC1o8QFHql4IjkAovYuRj2C49p2x3Rk0xEquJF1HdCwQN?=
 =?us-ascii?Q?q0sa+8Bg6myIhaxlRtiY4343YSm3McHhKYvpheut54Z5XD5D5A3cyAvrVVXM?=
 =?us-ascii?Q?SIKtKGsR57ilEviaaKNq+cu52BwsWMXWKDdhxaCg9j3m62nTnWhCizH0O8ta?=
 =?us-ascii?Q?VqIkCcJuRqDS5PLJg0fZr7HxN+ufde+pcrboaJzHbCl0S+upNhGR4f3Z1Zk4?=
 =?us-ascii?Q?iHkLcFR+NS42RRAgcYzritYLH1NaL4DxF4AYnSaTJWFSG3gaL7SGPnnztv2Q?=
 =?us-ascii?Q?HlqA4agFf177LdPcRTNHUUykQxvd+mX4tBw5ysf0AxuIaGUfO3w0CnB7X73W?=
 =?us-ascii?Q?uAfaatq/omviMvE6qeKa+EGKH4msNK5qmZ1wVDVojNGKhvqwPBJluWOGDxpM?=
 =?us-ascii?Q?ubqnWEx9RyjjbSOXXzczxsbMGy4kCDEHtocsEqmcJQLXJH/6fUSWD0quQfit?=
 =?us-ascii?Q?8mNLGYfFm+ynVFgoVJPVFJUbMLshNMf+abJ2z8s1kInYZiG9My6NgWmwGet9?=
 =?us-ascii?Q?Tm+SVdJhkDfN9DmrKSUUZpuqk9LhbUhkXKeAs5BVT0puPNnUKPgAh29DoXjt?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff338a4c-42a0-4d35-47cc-08dd7247c810
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 00:37:58.5221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phdPJ7lr+5UyD8RZPvp644OCcnZmmeLYiB7cuZPMtYStGimDkLJ7T9m9CuFei7SgSanNW2hXrCnD/o3wnJwQmJMFbHCBJtf67ymEKyrI45Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8752
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

On Sun, Mar 23, 2025 at 12:25:58AM +0300, Dmitry Osipenko wrote:
>Hi,
>
>This a continuation of a year-old series that adds generic DRM-shmem
>shrinker [1]. The old series became too big with too many patches, more
>reasonable to split it up into multiple smaller patchsets. Here is
>the firtst part that makes preparatory DRM changes.
>
>[1] https://lore.kernel.org/dri-devel/20240105184624.508603-1-dmitry.osipenko@collabora.com/

After these patches got merged I started seeing this on ast driver
and a similar one qemu-cirrus:

[   88.731560] fbcon: astdrmfb (fb0) is primary device
[   88.767100] Console: switching to colour frame buffer device 128x48
[   88.768982] ------------[ cut here ]------------
[   88.768989] ast 0000:02:00.0: [drm] Dirty helper failed: ret=-12
[   88.769016] WARNING: CPU: 0 PID: 10 at drivers/gpu/drm/drm_fbdev_shmem.c:118 drm_fbdev_shmem_helper_fb_dirty+0xcc/0xd0 [drm_shmem_helper]
...
[   88.769092] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.14.0-xe+ #2
...
[   88.769095] Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
[   88.769109] RIP: 0010:drm_fbdev_shmem_helper_fb_dirty+0xcc/0xd0 [drm_shmem_helper]
[   88.769112] Code: 4d 8b 6c 24 50 4d 85 ed 75 04 4d 8b 2c 24 4c 89 e7 e8 98 36 a9 e0 89 d9 4c 89 ea 48 c7 c7 d8 65 54 a1 48 89 c6 e8 64 f4 ee df <0f> 0b eb 8b 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f
[   88.769113] RSP: 0018:ffa00000003e7da0 EFLAGS: 00010246
[   88.769115] RAX: 0000000000000000 RBX: 00000000fffffff4 RCX: 0000000000000000
[   88.769117] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[   88.769117] RBP: ffa00000003e7db8 R08: 0000000000000000 R09: 0000000000000000
[   88.769118] R10: 0000000000000000 R11: 0000000000000000 R12: ff11000122c190c8
[   88.769119] R13: ff11000118588a10 R14: ff1100010f4a04c0 R15: ff1100019750b588
[   88.769120] FS:  0000000000000000(0000) GS:ff11007e7d000000(0000) knlGS:0000000000000000
[   88.769121] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   88.769122] CR2: 00007e43af4056f0 CR3: 00000080c89f0003 CR4: 0000000000f73ef0
[   88.769123] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   88.769124] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
[   88.769125] PKRU: 55555554
[   88.769126] Call Trace:
[   88.769127]  <TASK>
[   88.769129]  ? show_regs.cold+0x19/0x20
[   88.769132]  ? drm_fbdev_shmem_helper_fb_dirty+0xcc/0xd0 [drm_shmem_helper]
[   88.769134]  ? __warn.cold+0xd2/0x17f
[   88.769136]  ? drm_fbdev_shmem_helper_fb_dirty+0xcc/0xd0 [drm_shmem_helper]
[   88.769139]  ? report_bug+0x114/0x160
[   88.769143]  ? handle_bug+0x6e/0xb0
[   88.769146]  ? exc_invalid_op+0x18/0x80
[   88.769147]  ? asm_exc_invalid_op+0x1b/0x20
[   88.769153]  ? drm_fbdev_shmem_helper_fb_dirty+0xcc/0xd0 [drm_shmem_helper]
[   88.769156]  drm_fb_helper_damage_work+0x8a/0x190 [drm_kms_helper]
[   88.769164]  process_one_work+0x224/0x5f0
[   88.769170]  worker_thread+0x1d4/0x3e0
[   88.769173]  ? __pfx_worker_thread+0x10/0x10
[   88.769175]  kthread+0x10b/0x260
[   88.769178]  ? __pfx_kthread+0x10/0x10
[   88.769181]  ret_from_fork+0x44/0x70
[   88.769184]  ? __pfx_kthread+0x10/0x10
[   88.769186]  ret_from_fork_asm+0x1a/0x30
[   88.769193]  </TASK>
[   88.769194] irq event stamp: 430275
[   88.769195] hardirqs last  enabled at (430281): [<ffffffff81505836>] vprintk_emit+0x416/0x470
[   88.769198] hardirqs last disabled at (430286): [<ffffffff81505868>] vprintk_emit+0x448/0x470
[   88.769200] softirqs last  enabled at (428924): [<ffffffff8143977d>] __irq_exit_rcu+0x12d/0x150
[   88.769203] softirqs last disabled at (428861): [<ffffffff8143977d>] __irq_exit_rcu+0x12d/0x150
[   88.769205] ---[ end trace 0000000000000000 ]---
[   88.769375] ast 0000:02:00.0: [drm] fb0: astdrmfb frame buffer device
[   88.802554] ast 0000:02:00.0: [drm:drm_fb_helper_hotplug_event [drm_kms_helper]] 

I confirmed that reverting the series (together with 2 patches for accel/ivpu on top)
makes the warning go away. Any idea what's going on?


Lucas De Marchi
