Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729088A7190
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 18:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F40112D60;
	Tue, 16 Apr 2024 16:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWWJCCLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EA0112D61;
 Tue, 16 Apr 2024 16:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713285628; x=1744821628;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/Pw7QMFR0cN7+zNIewyHpMAeOwf03Otjmfzl6mF1Kik=;
 b=NWWJCCLhBmzZlwGk/X4kUKri3Ox5dk4X8fvs42qysZfElpidEZajHJ+s
 Y9J3uDZ/4rwzAdKIuoVdvaHAYBYbsVLT+xqPktnkduP9qnbu6wc1AeNL4
 bPQXcJp9kSBFI6ATV9jqt6VaBmk3sIVgJLrycnqVBvgeLjfGW/RUox7np
 tFpnEYGcxZgZPoS9qHR2gNwtAlM1iAr1KymZ77PZtIvi87DwvZaWWl85n
 SHtFovKC6fokhSt+nmZ9hgTahjTySDFGxmh9xFfAGKqQkPN++8xWHQJAU
 4RDM7tRnCS+8Ytg10kXjmwuHTdBFTwr8doOXkgZ18w/52iJjPELOkKUsX g==;
X-CSE-ConnectionGUID: eS23Y2luSXa7lkgFhHHqKQ==
X-CSE-MsgGUID: z777kVYHQDGdxbArF0GQmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12515824"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="12515824"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 09:40:27 -0700
X-CSE-ConnectionGUID: cyLBWdypQNuygcXGUI6XBg==
X-CSE-MsgGUID: D8Wa8P0aSxG7q12hIz+qJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="22381124"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 09:40:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 09:40:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 09:40:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 09:40:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 09:40:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i64/s0ykGgrYf2YuSm6HCrB0n+H1MDrxfx3BkvZSAGpNC/3gIfLiVRpCB+i+4Bxu51lEBWLVaZFakvfRInm0ak99PMfdL6YCqva2Y+OWv3FEFIrbBalx5Gm9fqO07dAIfRgfIKjM4ELS3zoMfar/+ukE/+3pVb5XnOSEu6VAXIDUA0snYNHx+1QuCOQkfxy8yu8T4LD6XReBwqMQ7lvArSiZ9pmIQT5G+EhklTATiLz7T0laLxPxLhTkXnhiWVQhz7FJl1Eh14PCAZpXDTxw17fBY2LYkawB95R+LCSX3z+CGHj+2P48VG8UQJnU3hxrb6Ksdq6TUR4+26vVZr4R4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1Mt6m8rm1gaCx0hVDka0VKcNI+PXxx9zeiQXsZY4Bk=;
 b=dnrjyWlV1zlqwOuMy3qynfP7wVNFgawTjeCuXQ359hRkOwggPNNtn8oaRPOOu5iWehFgwYUWlcihoLOKhSMpdf75f5iWv51leLZv8RUGMyyE0uSiLj/X25EOz78UhbdULzJiK8z+iy4dNzqUQ+kcyVMt5UH5nPfwqMfsFUzfWEAhJTjVbJ9GeMlO3Mh1IFsTb8mvjs5b/L8GOfEGtprYuTEYnlm4UMZ3nRGUbvjd9N9GvrdNQRDTtxpijb8B9AnZsRQGawCcGWvbdPI7E9CJ8k+xbwP+17oGaB+9wyIKaHAS2PBX+u/SeuOGQYJO90GeXnxNEVfZiI+0ZWa8oPejmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MW5PR11MB5811.namprd11.prod.outlook.com (2603:10b6:303:198::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.28; Tue, 16 Apr
 2024 16:40:22 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 16:40:22 +0000
Date: Tue, 16 Apr 2024 12:40:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 <thomas.hellstrom@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH v3] drm/i915/vma: Fix UAF on reopen vs destroy race
Message-ID: <Zh6p7M9QoMTowh2F@intel.com>
References: <20240415195310.165934-2-janusz.krzysztofik@linux.intel.com>
 <Zh3Rb15jVJeg1nex@intel.com>
 <13491837.dW097sEU6C@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <13491837.dW097sEU6C@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::19) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|MW5PR11MB5811:EE_
X-MS-Office365-Filtering-Correlation-Id: 483f7a8a-57dd-48cb-51fd-08dc5e33e86c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v0DTxZSy0xTprPSaHjh/CZmuDRj56/dsCv7N/4C/jBh7ID7swf/4/7mD68WIedSwfgnL0yPp8E70ZYHVug9d8HZz6js8s2DqhaaXbkYTfAkBjKTnzef+muE09nMU2NnANzYFy1P8pnl2hzoATHijFTMt23ygKQ4u80YxeSnCxj5b/seTUaJnikpRftyHhbw5ov8Z2oODrWj91bRrl9s4yRivvX7td6D2tZt5hGtTitytpvIdTnI/9wcusK0SYAVkKGt7GvUyih36rSLkk1hrVKaDGXICYWBmofFTwq0/jaGtEyoJ7S8e5fDzJWTBkwL6ehdaaK5oegzY3qsSkjsuLa7x/1yHs6ZLYajkkvlckKM0nG2AWf6tjhi/icG4wdZEsllocuBaKWL0YITHkndvlLCmwaBKIFluazgPVZ6PGjf4KuMZgUYNuR4uGj8A/we4lQmJvO9Mh1r2LkN98VgLfMIyA0AmNWMRXo1ogH7/32KCxqSAgvWSfaUKhqbHYc+zfHLCOW0LLQYTZu0ZCZQ8wmqqTzepqitRFelvGtW9dnZC31gFSLhY/JQJ1yi/FcboCqcFbpqu+oCwAz13IF+eGUlfQrFnFqjf3gOtbDuXXjI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uAYjk0fZ74GOI8oIUWjk8XT8O7uKL6NCY9qA5S4NFwQlVJiGf6qUj/69ciTn?=
 =?us-ascii?Q?GOTzKMlQrn1OUpqJfQsTyYoD+VAiO3vJ5Nf7YywKgxQvidNRMysaodnAgLmN?=
 =?us-ascii?Q?R8LoFyNujzbajIbAi8FabbEJbrxib8Zn6BpWmZwbFKA86PWjpc8zj+WaHAg9?=
 =?us-ascii?Q?dD5T7vXqGbfU9aJYey4BEusDxt9v/Fqa/WBgu7gWj75e//ooi9e+QDZes49f?=
 =?us-ascii?Q?fnzZbzwkudKuST8u+YEpj+Un3A2o0DcY1PGUOh3kObCs4Q/KkiFE5UpgVR3o?=
 =?us-ascii?Q?I81RiGCZCwoEXw+yRedumT5LSLpyCUnuXlZlZtB1TrRqF5N5abvBtLBBROsF?=
 =?us-ascii?Q?pjufdvVkWwh6f294+l0jr0I3kpeauv/I3SBiLRtkNQvLkrtWxcRhQKtggZmb?=
 =?us-ascii?Q?/K/dPTFR7B6e9aqQlBKAg4WiRV2hkylyZbOKmv2jvH93mcZwPgBw1WUgVqtS?=
 =?us-ascii?Q?VX1DaXqdUbq3D/KVRQ8EcSfVnrb4CPwxZUpEstH7b8K1mjTv8blkBtkGZVw4?=
 =?us-ascii?Q?IMAHy1e5B3IKtRDoJVe+3VYIhcnQQHIS0ZFy9xDX/oJFDY3z8ytjcK6Ak8uX?=
 =?us-ascii?Q?qdi8ZsqrPrZGeYWc0KZWAgbIqpEmvoD7MS1gSy/TOgv+/m9XfYYqo++Cexit?=
 =?us-ascii?Q?aQqCJFRMP4F6/nr4+E2iblDBT//6GRQziun+mNGFu9EVC0LFpdE1715t05b0?=
 =?us-ascii?Q?kY4tuw+Ry1Z1vO2RUzh78/Aejqgldpm2ryOPWCz47YSQXNDVGGA2GMS3c70D?=
 =?us-ascii?Q?1lNa9vzKEQlNybDw2f50n4QxY5YVYbHlgnwoMm0ux/Jk9hvsKWBCyQZBJrZJ?=
 =?us-ascii?Q?Tapcx1Kctf4lVHGc79X19gmL9XIJ/vkXikqslTlxg28Tv+iw2Bf+Lcc49jeq?=
 =?us-ascii?Q?qvBJz3mzkmWlsG+SpORB8s/26faIEqi68QQn3s0Tdkc5LWlLpHvO5W/lMbkk?=
 =?us-ascii?Q?MUO0ggM7iPGZpcRZnkwB9bVsJdTXrc6mXLtYHEzypvroUFhTDUdLeedrJJZ+?=
 =?us-ascii?Q?9lvdXz3CFl6YYz5vKGyT5B039jLjQSy+Ov6kOJ9jhXlacZhqkMdyuF8paCya?=
 =?us-ascii?Q?YY5e7FN3P/10/JKayEQEpwU0rJp1x6naXzJKUtw47ItQbSpZaTUs0x/fgbVJ?=
 =?us-ascii?Q?IcEkjNanLZ/1ffGxdtEyj0gBIMEOYBbsPGfugxyaBUaLrdo09KENsYgmiPY7?=
 =?us-ascii?Q?2qYVenB7SqSUn8QbTlIrhADKV4Mt6PxmsZzzvenSE4uQ1vT7S9dnbtEpWXOv?=
 =?us-ascii?Q?vP7F5yLsEjQgltR22gDwSbaGPfsielldWVwikRm5TJuPxM2z4zn98Tqf2R3U?=
 =?us-ascii?Q?ppDml7vc5VLv5gkL3vlh4gdT6DTD7GTZubvaJnroQvW8o0CMO7HwmI//J5+d?=
 =?us-ascii?Q?LZpUvhmJbOMFddhnmHDy5fC2QYVJovRQJfOtZQJdAevj5bLFUWaO+lQt7ksO?=
 =?us-ascii?Q?WL5I6nNpHId+HePC+NlQ96QobN7C4ZlHY54YvdTZox8fafzzJudXDShi2XLN?=
 =?us-ascii?Q?kbVC7VXBxYtv02AbRPBqPkuEg/DGIxgd4tdA6jgVfTFBhIalTSVI401t6lsU?=
 =?us-ascii?Q?rHVmhTbDKH+lNWX66eIkfUXM4/nwD1ZoxkTy2cfnLvkKCCqydzStBX6kTlzx?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 483f7a8a-57dd-48cb-51fd-08dc5e33e86c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 16:40:22.1306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBwcnXZzYxAgFavYDrM6WKVWvfFN3Mt3OBYkzCsSoakWGJo7e4oJ+8hNxwLlngZo4NlAxRJw0D3dtW7QSVT/6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5811
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

On Tue, Apr 16, 2024 at 10:09:46AM +0200, Janusz Krzysztofik wrote:
> Hi Rodrigo,
> 
> On Tuesday, 16 April 2024 03:16:31 CEST Rodrigo Vivi wrote:
> > On Mon, Apr 15, 2024 at 09:53:09PM +0200, Janusz Krzysztofik wrote:
> > > We defer actually closing, unbinding and destroying a VMA until next idle
> > > point, or until the object is freed in the meantime.  By postponing the
> > > unbind, we allow for the VMA to be reopened by the client, avoiding the
> > > work required to rebind the VMA.
> > > 
> > > It was assumed that as long as a GT is held idle, no VMA would be reopened
> > > while we destroy them.  That assumption is no longer true in multi-GT
> > > configurations, where a VMA we reopen may be handled by a GT different
> > > from the one that we already keep active via its engine while we set up
> > > an execbuf request.
> > > 
> > > <4> [260.290809] ------------[ cut here ]------------
> > > <4> [260.290988] list_del corruption. prev->next should be ffff888118c5d990, but was ffff888118c5a510. (prev=ffff888118c5a510)
> > > <4> [260.291004] WARNING: CPU: 2 PID: 1143 at lib/list_debug.c:62 __list_del_entry_valid_or_report+0xb7/0xe0
> > > ..
> > > <4> [260.291055] CPU: 2 PID: 1143 Comm: kms_plane Not tainted 6.9.0-rc2-CI_DRM_14524-ga25d180c6853+ #1
> > > <4> [260.291058] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-P LP5x T3 RVP, BIOS MTLPFWI1.R00.3471.D91.2401310918 01/31/2024
> > > <4> [260.291060] RIP: 0010:__list_del_entry_valid_or_report+0xb7/0xe0
> > > ...
> > > <4> [260.291087] Call Trace:
> > > <4> [260.291089]  <TASK>
> > > <4> [260.291124]  i915_vma_reopen+0x43/0x80 [i915]
> > > <4> [260.291298]  eb_lookup_vmas+0x9cb/0xcc0 [i915]
> > > <4> [260.291579]  i915_gem_do_execbuffer+0xc9a/0x26d0 [i915]
> > > <4> [260.291883]  i915_gem_execbuffer2_ioctl+0x123/0x2a0 [i915]
> > > ...
> > > <4> [260.292301]  </TASK>
> > > ...
> > > <4> [260.292506] ---[ end trace 0000000000000000 ]---
> > > <4> [260.292782] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6ca3: 0000 [#1] PREEMPT SMP NOPTI
> > > <4> [260.303575] CPU: 2 PID: 1143 Comm: kms_plane Tainted: G        W          6.9.0-rc2-CI_DRM_14524-ga25d180c6853+ #1
> > > <4> [260.313851] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-P LP5x T3 RVP, BIOS MTLPFWI1.R00.3471.D91.2401310918 01/31/2024
> > > <4> [260.326359] RIP: 0010:eb_validate_vmas+0x114/0xd80 [i915]
> > > ...
> > > <4> [260.428756] Call Trace:
> > > <4> [260.431192]  <TASK>
> > > <4> [639.283393]  i915_gem_do_execbuffer+0xd05/0x26d0 [i915]
> > > <4> [639.305245]  i915_gem_execbuffer2_ioctl+0x123/0x2a0 [i915]
> > > ...
> > > <4> [639.411134]  </TASK>
> > > ...
> > > <4> [639.449979] ---[ end trace 0000000000000000 ]---
> > > 
> > > As soon as we start unbinding and destroying a VMA, marked it as parked,
> > > and also keep it marked as closed for the rest of its life.  When a VMA
> > > to be opened occurs closed, reopen it only if not yet parked.
> > > 
> > > v3: Fix misplaced brackets.
> > > v2: Since we no longer re-init the VMA closed list link on VMA park so it
> > >     looks like still on a list, don't try to delete it from the list again
> > >     after the VMA has been marked as parked.
> > > 
> > > Fixes: b0647a5e79b1 ("drm/i915: Avoid live-lock with i915_vma_parked()")
> > 
> > what about reverting that?
> 
> I didn't think of that.  Why you think that might be a better approach?

well, I thought of that mainly because...

> 
> Anyway, that's a 4 years old patch and a few things have changed since then, 
> so simple revert won't work.  Moreover, I've just checked that patch was 
> supposed to fix another patch, 77853186e547 ("drm/i915: Claim vma while under 
> closed_lock in i915_vma_parked()"), which in turn was supposed to fix 
> aa5e4453dc05 ("drm/i915/gem: Try to flush pending unbind events"), and that 
> one also referenced still another, cb6c3d45f948 ("drm/i915/gem: Avoid parking 
> the vma as we unbind") from December 2019, which finally wasn't a fix but an 
> improvement.

... because of histories like that ^ and I was afraid of this patch here now
just put us into a different corner case.

I have a feeling that without locks there we might just hit another
race soon with the the park and only using the atomic checks.

> Then, we would have to consider new fixes alternative to at least 
> some of those three, I guess. 

Indeed.. I didn't think that deep on that...

> I'd rather not dig that deep, unless we invest 
> in a completely new solution (e.g. backport VMA handling from xe if more 
> effective while compatible to some extent?).  Even then, we need a fix for 
> now.

yeap, not sure if that would help. was also not designed to
the park unpark.

> 
> Alternatively, we can try to revert my 1f33dc0c1189 ("drm/i915: Remove extra 
> multi-gt pm-references") which was a manual revert of f56fe3e91787 ("drm/i915: 
> Fix a VMA UAF for multi-gt platform") -- a workaround that was supposed to 
> address some multi-GT related VMA issues.  While it didn't really resolve 
> those issues it was addressing, I think it may help with this one, which 
> started appearing after I reverted that workaround.  However, its 
> effectiveness is limited to MTL topology.

perhaps the safer path for this case indeed. something that could be really
limited to a single platform would be better.

But I confess that I don't have other better suggestions.
If we need to go with this patch as a quick solution, it is apparently
better than leaving the bug there as is.

+Thomas. any good thoughts there or advices?

Thanks,
Rodrigo.

> 
> Thanks,
> Janusz
> 
> > 
> > > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10608
> > > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > Cc: stable@vger.kernel.org # v6.0+
> > > ---
> > >  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 10 ++++--
> > >  drivers/gpu/drm/i915/i915_vma.c               | 32 +++++++++++++++----
> > >  drivers/gpu/drm/i915/i915_vma.h               |  2 +-
> > >  drivers/gpu/drm/i915/i915_vma_types.h         |  3 ++
> > >  4 files changed, 37 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > index 42619fc05de48..97e014f94002e 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > @@ -847,9 +847,12 @@ static int __eb_add_lut(struct i915_execbuffer *eb,
> > >  	if (unlikely(!lut))
> > >  		return -ENOMEM;
> > >  
> > > +	if (!i915_vma_open(vma)) {
> > > +		err = -EEXIST;	/* let eb_vma_lookup() retry */
> > > +		goto err_lut_free;
> > > +	}
> > > +
> > >  	i915_vma_get(vma);
> > > -	if (!atomic_fetch_inc(&vma->open_count))
> > > -		i915_vma_reopen(vma);
> > >  	lut->handle = handle;
> > >  	lut->ctx = ctx;
> > >  
> > > @@ -880,8 +883,9 @@ static int __eb_add_lut(struct i915_execbuffer *eb,
> > >  	return 0;
> > >  
> > >  err:
> > > -	i915_vma_close(vma);
> > >  	i915_vma_put(vma);
> > > +	i915_vma_close(vma);
> > > +err_lut_free:
> > >  	i915_lut_handle_free(lut);
> > >  	return err;
> > >  }
> > > diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> > > index d2f064d2525cc..4435c76f28c8c 100644
> > > --- a/drivers/gpu/drm/i915/i915_vma.c
> > > +++ b/drivers/gpu/drm/i915/i915_vma.c
> > > @@ -1735,14 +1735,33 @@ static void __i915_vma_remove_closed(struct i915_vma *vma)
> > >  	list_del_init(&vma->closed_link);
> > >  }
> > >  
> > > -void i915_vma_reopen(struct i915_vma *vma)
> > > +static struct i915_vma *i915_vma_reopen(struct i915_vma *vma)
> > > +{
> > > +	if (atomic_read(&vma->flags) & I915_VMA_PARKED)
> > > +		return NULL;
> > > +
> > > +	__i915_vma_remove_closed(vma);
> > > +	return vma;
> > > +}
> > > +
> > > +struct i915_vma *i915_vma_open(struct i915_vma *vma)
> > >  {
> > >  	struct intel_gt *gt = vma->vm->gt;
> > >  
> > > +	if (atomic_inc_not_zero(&vma->open_count))
> > > +		return vma;
> > > +
> > >  	spin_lock_irq(&gt->closed_lock);
> > > -	if (i915_vma_is_closed(vma))
> > > -		__i915_vma_remove_closed(vma);
> > > +	if (!atomic_inc_not_zero(&vma->open_count)) {
> > > +		if (i915_vma_is_closed(vma))
> > > +			vma = i915_vma_reopen(vma);
> > > +
> > > +		if (vma)
> > > +			atomic_inc(&vma->open_count);
> > > +	}
> > >  	spin_unlock_irq(&gt->closed_lock);
> > > +
> > > +	return vma;
> > >  }
> > >  
> > >  static void force_unbind(struct i915_vma *vma)
> > > @@ -1770,7 +1789,8 @@ static void release_references(struct i915_vma *vma, struct intel_gt *gt,
> > >  	spin_unlock(&obj->vma.lock);
> > >  
> > >  	spin_lock_irq(&gt->closed_lock);
> > > -	__i915_vma_remove_closed(vma);
> > > +	if (!(atomic_read(&vma->flags) & I915_VMA_PARKED))
> > > +		__i915_vma_remove_closed(vma);
> > >  	spin_unlock_irq(&gt->closed_lock);
> > >  
> > >  	if (vm_ddestroy)
> > > @@ -1854,22 +1874,22 @@ void i915_vma_parked(struct intel_gt *gt)
> > >  		}
> > >  
> > >  		list_move(&vma->closed_link, &closed);
> > > +		atomic_or(I915_VMA_PARKED, &vma->flags);
> > >  	}
> > >  	spin_unlock_irq(&gt->closed_lock);
> > >  
> > > -	/* As the GT is held idle, no vma can be reopened as we destroy them */
> > >  	list_for_each_entry_safe(vma, next, &closed, closed_link) {
> > >  		struct drm_i915_gem_object *obj = vma->obj;
> > >  		struct i915_address_space *vm = vma->vm;
> > >  
> > >  		if (i915_gem_object_trylock(obj, NULL)) {
> > > -			INIT_LIST_HEAD(&vma->closed_link);
> > >  			i915_vma_destroy(vma);
> > >  			i915_gem_object_unlock(obj);
> > >  		} else {
> > >  			/* back you go.. */
> > >  			spin_lock_irq(&gt->closed_lock);
> > >  			list_add(&vma->closed_link, &gt->closed_vma);
> > > +			atomic_andnot(I915_VMA_PARKED, &vma->flags);
> > >  			spin_unlock_irq(&gt->closed_lock);
> > >  		}
> > >  
> > > diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> > > index e356dfb883d34..331d19672c764 100644
> > > --- a/drivers/gpu/drm/i915/i915_vma.h
> > > +++ b/drivers/gpu/drm/i915/i915_vma.h
> > > @@ -268,7 +268,7 @@ int __must_check i915_vma_unbind_async(struct i915_vma *vma, bool trylock_vm);
> > >  int __must_check i915_vma_unbind_unlocked(struct i915_vma *vma);
> > >  void i915_vma_unlink_ctx(struct i915_vma *vma);
> > >  void i915_vma_close(struct i915_vma *vma);
> > > -void i915_vma_reopen(struct i915_vma *vma);
> > > +struct i915_vma *i915_vma_open(struct i915_vma *vma);
> > >  
> > >  void i915_vma_destroy_locked(struct i915_vma *vma);
> > >  void i915_vma_destroy(struct i915_vma *vma);
> > > diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
> > > index 559de74d0b114..41784c3025349 100644
> > > --- a/drivers/gpu/drm/i915/i915_vma_types.h
> > > +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> > > @@ -263,6 +263,9 @@ struct i915_vma {
> > >  #define I915_VMA_SCANOUT_BIT	17
> > >  #define I915_VMA_SCANOUT	((int)BIT(I915_VMA_SCANOUT_BIT))
> > >  
> > > +#define I915_VMA_PARKED_BIT	18
> > > +#define I915_VMA_PARKED		((int)BIT(I915_VMA_PARKED_BIT))
> > > +
> > >  	struct i915_active active;
> > >  
> > >  #define I915_VMA_PAGES_BIAS 24
> > 
> 
> 
> 
> 
