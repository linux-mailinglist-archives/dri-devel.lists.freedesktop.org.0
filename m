Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E79C0B1EA79
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 16:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A47910E94B;
	Fri,  8 Aug 2025 14:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7R6znmz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E349110E94B;
 Fri,  8 Aug 2025 14:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754663944; x=1786199944;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wc4wTKjZ1eUtCrvqKlKEc6t5w/dqaIn6N/HAvonm2JI=;
 b=W7R6znmz2ml7oQGpLYmKRA/z1qr/2A8sJcyiNGAjBWaNdHfkMwTQ+2kK
 PJZzckDfgVDT0pNl+amQGOnK8iA1/vnNcDD1Z8XoKLnYY6xoeZoqzGsjp
 afGgbSG6JE8ojeUraL0lTD/lMKJq9FHDsSlxYCIWYG6NHO8UzKgV+EJnh
 FheY8zUE0DTGO9kj7xmGlv5o41iGlNXy1M8qEiyxZyqzxi/m87slghnpC
 wgjYfpGEVaSAD//X/87a53IkDYsZ8hK+7spNzBTMYWIvfrLGcdnIq12cr
 /Xyy5PC8j3P4GwcgiNz+rJLWCUQR27qW3E5+xQo92WZKW1JoaBAZFWAvN w==;
X-CSE-ConnectionGUID: l0w/QZGOQautIf2sXTU9Sg==
X-CSE-MsgGUID: /Ptq91fCQXKjlZa+rq8jBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="79571495"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="79571495"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:38:55 -0700
X-CSE-ConnectionGUID: JWHwdzl3SeCJMEg+gukeHA==
X-CSE-MsgGUID: YTfFdCvhR8+sq1FDAYbC5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="196164062"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:38:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:38:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 07:38:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.86) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:38:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WP+dyChPhQWdJpDR98OMapJUaRsqhWdpjfKYEHbH6voebsCVdS51uynX7rxSzQHZ57pecoSf4Ad7z3IKW/9eI8Yf2b0Y8TjVSnd6FtCBecz1t0zjYa4IkXR7OXPVJ11dP/mVB+i1oagUx5GDXEavNNtKoJBBjvsbvE2enisbjz/UTtEupTPeoe8zyKDW/QV7K2kDXfwM/+6YJ35LQxd1Xz8t46K/cAGmGPiS8aU9HFM9W3QixtoAziLfmzebYc0oneHVyCIVPUwkobusrjNu0n2sW9X1mwvPiqQEE0y7r0KYKGFXvwDWcE++mUjBrD/AHI+E6lqE4UVoQXnH1iKDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3NBTs4DQgyGzoPpYPG5WoHuaHrRgS81odVkuQnczjE=;
 b=jRSIagKJ/+7SFSsD9ymGYFW+WnGC58ISWVbE3M5fBvnZDisAf5KC9GzDsOF1iTmfYBcjX+KQog5ODBc71AUmtjZcyKhbpktfQmIg7lQFCxsvSdZYUIlxtcyecpYR4CvHadnVJq1mUkROtUXxMlAFty+vjtHgvhMIaI/Ng1py4dEatGB+KaJVoYLzQaTn5W5lEfLT+A/6vR8gx5NAswoMtZD9ZSn4m+LOLKP2ttNaXRlABvOTLGgCOSq0e5XMfGSyvqt//ZHkIpzJ7OZ3GEieRSGH3nOZo85hZe+pvI9b2iWGekSxKWCF33KScu22qLy63/GaP1cVTiU9vVjkkY9W2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB8204.namprd11.prod.outlook.com (2603:10b6:8:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.17; Fri, 8 Aug
 2025 14:38:52 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Fri, 8 Aug 2025
 14:38:51 +0000
Date: Fri, 8 Aug 2025 10:38:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
CC: <joonas.lahtinen@linux.intel.com>, <tursulin@ursulin.net>,
 <jani.nikula@linux.intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <mairacanal@riseup.net>
Subject: Re: [PATCH 5/9 v2] drm/i915/gem: Clean-up outdated struct_mutex
 comments
Message-ID: <aJYL92WDRSixoPMk@intel.com>
References: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
 <20250807170212.285385-6-luiz.mello@estudante.ufscar.br>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250807170212.285385-6-luiz.mello@estudante.ufscar.br>
X-ClientProxiedBy: PH8PR02CA0050.namprd02.prod.outlook.com
 (2603:10b6:510:2da::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB8204:EE_
X-MS-Office365-Filtering-Correlation-Id: 802694a5-11ba-4f3c-574d-08ddd6894b26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?de7/eFgQ4ZFczxtCbFSZbdhMp8PNMMfsJB78gd6D4tgbQcQeFV9Nw4g6o2mU?=
 =?us-ascii?Q?EjuWmnldgQOZCC0v7RBM60NblIjqNysQcvorVjEJwjF4pfBgVYJqqM7TZUGO?=
 =?us-ascii?Q?TVMyccvk54TgdpaGr12WrUJwfE30OMozjknH8kg55hqk7B3qTJWadZuzwTUy?=
 =?us-ascii?Q?ZkjtB8g9yrfGurG6PrlgX+RW/HGmKZy0fHKM3wsBg1o+gp8AAySYWiZi/KxV?=
 =?us-ascii?Q?sdW9w2Gkyqe6D4pMAuRqxu+gp4t7DqIfA+ef56C+gVS1LTC+WcSmoy9xKr5d?=
 =?us-ascii?Q?kscBDHvlKIlm7bAdZ6LC8pMvwqbuiynSOBcp6mBkOHoLqqNYR37ZmDcSVmYV?=
 =?us-ascii?Q?nhsJ1Ic5CQMDtbZ8LqpTcnasWgEvaQTKMH+u5ichMaGFMmanwQr27fzdDyAK?=
 =?us-ascii?Q?AY9NxyxaOr9nBm/dilmfNolq2I+AboQONMl4Ij0p6ftWt9/dSGb7uJESYGbg?=
 =?us-ascii?Q?QnVkDIqPx4X0PJs89TSZsldOZG6Ik7CbehlIsRiv3Z5Oykuwmeomlu9HUJNW?=
 =?us-ascii?Q?Ywc0WGOXABfpKPMIjfRl1B8g67DLgf/DhVYuX34asAHFdYMANWrItJ/nc5I8?=
 =?us-ascii?Q?RB6X8Ph5rXXLIselcIb7dDij70F9JPgthYoWi8xE59OeAVJmbdq4oZ3MdtXg?=
 =?us-ascii?Q?EnETNV/bib0MZnINuYTaP3FTYZH/5PFH7pAb9EOvzhKh2oDDzLJQ0Oac7k5n?=
 =?us-ascii?Q?x8k+JTTsws1FEs5ZDNQ4zk1qkoJXPmFHI3yhuAPGll5EX0TakHRPhURYky87?=
 =?us-ascii?Q?lTUx0YM9bBOovABhetf6ZoUZfA8PqgWJ6lKkRpMJwqBfJv44kYdgzAESmAXs?=
 =?us-ascii?Q?CSVyZ9Tu7JZi0syiJuw4dfHyThl1NJJyX0vsJX3wt5LYxz0Gve63OWHoc2M7?=
 =?us-ascii?Q?tDHXRDd+MOktjkuvrxd1oV7hzyFXldtxBupbVw7ppf2MVV5SBQkpQ6eBYpwU?=
 =?us-ascii?Q?usaSZ9vuiLrb1xj32/NsrqND5QsUOGW+rNla1Xdr+53Hk2Aqmt/8XE2IzPl1?=
 =?us-ascii?Q?RBOLbA8VcSGP4IdINCvNr/iiZtoEkjJDYA5uqGzmvQ+frWNcg0oWmmDPOkWB?=
 =?us-ascii?Q?8S1Pr0LMbrEk7UfgjfGUNdp04SUEXG7fLyUSGcffsBw43ZqCKlOR8u+op5M2?=
 =?us-ascii?Q?rxv5PXjH0trZGs4F89lGltzFQ7IddlFr/Lw6unU0eoB8di9EioLDhoAfVPYr?=
 =?us-ascii?Q?GW1gOGvrY6aSAMaUMxLB3ebyQMO/XP5pBmN42HmFr8h6+VSmEpXyjwTl3XfQ?=
 =?us-ascii?Q?8fOAjlYQapAizxt9gPCSLj9lL7clHnxeHu4J67bv5RfGKZDpR8oK/ttmD570?=
 =?us-ascii?Q?XfrIIT5cIKP4O3nDLlyZNpL7zFT6C0GMSYU9mA97Nh1eNXUzT30tcGfAG+7R?=
 =?us-ascii?Q?vZFCy0sffEOGrCOI6YDgJCl4On3bUhskdv4VDNhaI+Rj9ABKX1cnnQuVerOf?=
 =?us-ascii?Q?El2QPrNIw6A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0b3cncM2wFbnkBGjgBOwGofNool8vMKa4tO9XAwT5PSb1qnWwaG1bZ4N/uXj?=
 =?us-ascii?Q?Llyjos1iiDCxOe3qxxWEurhSAL4lTYaAQfXzTszLU0mHGNReAK3bO5tUrCmP?=
 =?us-ascii?Q?Tny22fXfUQJQlQCC6+lgjKrDu9rP7bdsmSTLlkBWWO73ys2Qg7VlMU+B/ww+?=
 =?us-ascii?Q?5ZK1A9TtJQZZabEP/ZdaVxiPvswqFBL7/Q4ksaH2S8e9ZxyHQ1sssoRCpQTP?=
 =?us-ascii?Q?pF+MQu3LxO9Z0lOLLs8/D62Tob2Edms9Stvje/vKLDG0WUGu7Y9aOuk3J5lh?=
 =?us-ascii?Q?NJmnlZeH7SGHN4z5PdLIow3iq4hupqBJ8u5y7r0jpW1YtTv2xArr7KuuuLu3?=
 =?us-ascii?Q?dt7afqikzpSGGR52HuCbT/9RN6uAaL42qlgJXG+LAP1d+DOhS3qnNWP0+eX9?=
 =?us-ascii?Q?1rxJJanwkODNFUKi3K9lu1jqMec6Rjn6lVek6fyG3hho2WcthO+gIy6+v7VL?=
 =?us-ascii?Q?6Kz553fcQ4B9Ns9P+KRCrXF45QF5ywtTuLG3cqG/4ybkBAAx+pdxMzA9TKo0?=
 =?us-ascii?Q?f3avzTZTKv6e52jRpJHE6a7GJow97mXKJEmWV9HgopJiv91jWQs6Bil/3dx1?=
 =?us-ascii?Q?TKGXdO7ePARSWLUTRNYgIsPeoG7Xqb9pYP/j7POdu1VAlhjC64Cj+czDEwy7?=
 =?us-ascii?Q?yq9BVifk4ISvlhvN6rNXPzOX8YcSplgFQBAVZyb3nK4SSHt/lNrqWPrfneyU?=
 =?us-ascii?Q?lq7qlz71Fn8vUWDgLleGcz6y2dFh1zZcp0z9jFF/47Pamg2lmc707Xcq4Qx/?=
 =?us-ascii?Q?FHyzUXhWx+2JlmCk7vr9tVJlfzUYbhGQveLeUwOOxdei/12QTgwQIj8dIklI?=
 =?us-ascii?Q?KY+O0kIIkUjRWVxCJ1gRUWkibGpw+HbLud/64lUIktL5kOzqMOdgfn2PKwAk?=
 =?us-ascii?Q?hKryGS4qUptaD4+dYQk4vmQhF2MIKpM/fN+ieg5pxbggnILOhxG6U22bJzI4?=
 =?us-ascii?Q?3XO0e9lGwSWmNw3ZIvxbDcFWstgM8A5sSaagsxHb+OaKeF0oFg1cCw1HdW6b?=
 =?us-ascii?Q?w/CviXELm5/M46yNz31rQocAsrvgvRTvhetnOnKCDjzDJXyOr+KgKAxaqUml?=
 =?us-ascii?Q?5vzxkW+WellApA/U4O3He0fhLQHPZ33LCKNmAOe0GIiCkv3gG5W5KtVokV24?=
 =?us-ascii?Q?vhkiQH8llMbVyfTL8Q/uZkNQPV3d8R9raGcCfsJyEeJPrX8AoVbF4bUdfTES?=
 =?us-ascii?Q?lX2OFcJ/da+5JiSuMfTuS78xjuvH69+j5++Pq6wNAEae138rXug+Ul9ei5i0?=
 =?us-ascii?Q?eZa4+g/8uN0JURC0UYMwoM5wekdJFSf2dElJSC69zvaLBkJVG90C8FW18vJj?=
 =?us-ascii?Q?iWbA7eYEJSW89qvta/kTTpNCEry31kXNzo2gqS42jJLL5dKmgJiFL0Syk1Kc?=
 =?us-ascii?Q?RH9H5M0Jz4unyYRWGStEZx+UmgTgTKyuSp0lRfWAYF42y+2u+XTrmpUHtJzx?=
 =?us-ascii?Q?Q+5bZol2F4YIlvgwb7NFdpmW63u0J2qepz0DPAcIguLG96UJLzPtCKh1Kk2k?=
 =?us-ascii?Q?LdSHzUXAsbOaobl89axA1qViOGUrNWAhUCuRj6sbvUsmjhz0gK0drsaoJWBD?=
 =?us-ascii?Q?xjlWAED+eLEmT6VP7JpmAxUKmITMiDhpFOV/PeJc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 802694a5-11ba-4f3c-574d-08ddd6894b26
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 14:38:51.8407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnPctLMFnYCQVRIXf4G4chdwRwyXX7uWL/UYM0pDFbvDiElJ5C8L5aGh5e4qoXIQ8Y0gWdUzSZW+T9TV4YVscg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8204
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

On Thu, Aug 07, 2025 at 02:02:04PM -0300, Luiz Otavio Mello wrote:
> The struct_mutex will be removed from the DRM subsystem, as it was a
> legacy BKL that was only used by i915 driver. After review, it was
> concluded that its usage was no longer necessary
> 
> This patch updates various comments in the i915/gem and i915/gt
> codebase to either remove or clarify references to struct_mutex, in
> order to prevent future misunderstandings.
> 
> * i915_gem_execbuffer.c: Replace reference to struct_mutex with
>   vm->mutex, as noted in the eb_reserve() function, which states that
>   vm->mutex handles deadlocks.
> * i915_gem_object.c: Change struct_mutex by
>   drm_i915_gem_object->vma.lock. i915_gem_object_unbind() in i915_gem.c
>   states that this lock is who actually protects the unbind.
> * i915_gem_shrinker.c: The correct lock is actually i915->mm.obj, as
>   already documented in its declaration.
> * i915_gem_wait.c: The existing comment already mentioned that
>   struct_mutex was no longer necessary. Updated to refer to a generic
>   global lock instead.
> * intel_reset_types.h: Cleaned up the comment text. Updated to refer to
>   a generic global lock instead.
> 
> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_object.c     | 4 ++--
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c   | 4 ++--
>  drivers/gpu/drm/i915/gem/i915_gem_wait.c       | 8 ++++----
>  drivers/gpu/drm/i915/gt/intel_reset_types.h    | 2 +-
>  5 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index f243f8a5215d..39c7c32e1e74 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -182,7 +182,7 @@ enum {
>   * the object. Simple! ... The relocation entries are stored in user memory
>   * and so to access them we have to copy them into a local buffer. That copy
>   * has to avoid taking any pagefaults as they may lead back to a GEM object
> - * requiring the struct_mutex (i.e. recursive deadlock). So once again we split
> + * requiring the vm->mutex (i.e. recursive deadlock). So once again we split
>   * the relocation into multiple passes. First we try to do everything within an
>   * atomic context (avoid the pagefaults) which requires that we never wait. If
>   * we detect that we may wait, or if we need to fault, then we have to fallback
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 1f38e367c60b..478011e5ecb3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -459,8 +459,8 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
>  	atomic_inc(&i915->mm.free_count);
>  
>  	/*
> -	 * Since we require blocking on struct_mutex to unbind the freed
> -	 * object from the GPU before releasing resources back to the
> +	 * Since we require blocking on drm_i915_gem_object->vma.lock to unbind
> +	 * the freed object from the GPU before releasing resources back to the
>  	 * system, we can not do that directly from the RCU callback (which may
>  	 * be a softirq context), but must instead then defer that work onto a
>  	 * kthread. We use the RCU callback rather than move the freed object
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> index b81e67504bbe..7a3e74a6676e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> @@ -170,7 +170,7 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
>  	 * Also note that although these lists do not hold a reference to
>  	 * the object we can safely grab one here: The final object
>  	 * unreferencing and the bound_list are both protected by the
> -	 * dev->struct_mutex and so we won't ever be able to observe an
> +	 * i915->mm.obj_lock and so we won't ever be able to observe an
>  	 * object on the bound_list with a reference count equals 0.
>  	 */
>  	for (phase = phases; phase->list; phase++) {
> @@ -185,7 +185,7 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
>  
>  		/*
>  		 * We serialize our access to unreferenced objects through
> -		 * the use of the struct_mutex. While the objects are not
> +		 * the use of the obj_lock. While the objects are not
>  		 * yet freed (due to RCU then a workqueue) we still want
>  		 * to be able to shrink their pages, so they remain on
>  		 * the unbound/bound list until actually freed.
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> index 991666fd9f85..54829801d3f7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> @@ -217,10 +217,10 @@ static unsigned long to_wait_timeout(s64 timeout_ns)
>   *
>   * The wait ioctl with a timeout of 0 reimplements the busy ioctl. With any
>   * non-zero timeout parameter the wait ioctl will wait for the given number of
> - * nanoseconds on an object becoming unbusy. Since the wait itself does so
> - * without holding struct_mutex the object may become re-busied before this
> - * function completes. A similar but shorter * race condition exists in the busy
> - * ioctl
> + * nanoseconds on an object becoming unbusy. Since the wait occurs without
> + * holding a global or exclusive lock the object may become re-busied before
> + * this function completes. A similar but shorter * race condition exists
> + * in the busy ioctl
>   */
>  int
>  i915_gem_wait_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset_types.h b/drivers/gpu/drm/i915/gt/intel_reset_types.h
> index 4f5fd393af6f..ee4eb574a219 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_reset_types.h
> @@ -20,7 +20,7 @@ struct intel_reset {
>  	 * FENCE registers).
>  	 *
>  	 * #I915_RESET_ENGINE[num_engines] - Since the driver doesn't need to
> -	 * acquire the struct_mutex to reset an engine, we need an explicit
> +	 * acquire a global lock to reset an engine, we need an explicit
>  	 * flag to prevent two concurrent reset attempts in the same engine.
>  	 * As the number of engines continues to grow, allocate the flags from
>  	 * the most significant bits.
> -- 
> 2.50.1
> 
