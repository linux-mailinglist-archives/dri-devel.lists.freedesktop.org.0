Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0C48BEA1D
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 19:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC0B10FCD6;
	Tue,  7 May 2024 17:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0TLrQGo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F69710F6B0;
 Tue,  7 May 2024 17:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715101841; x=1746637841;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WD5es+1eTiKYGDwI9HbrWPbP8qFCjKaevBaFLfpKoNw=;
 b=h0TLrQGoKsjHYj3DJAI2SMbShOy57I9k7NMW/ejyZeSRICyv3u6FL9LC
 UGl9LS74v1Fd8p1/lko/2FVZDR/LS4qyzdbDONmI8VhYD9y27R06X6Ypw
 Jqf6FN9UNQs5yaful4XQUAmSvdwkR3OSp1SWYhNzPeNFjgdxDZGavfCOE
 013IUF7xsU3xO2GhFazLgANHeXc6raqa6xFUqIfh6IwXI7/X1Kp0z0fvl
 1I/ekPr48UGkDKenLe8eW0zJI9VUjTuNd9yURQpFhq//+g8ya1GtAIZun
 4XEJEa0ckwZHLypYj3EKkuDAyqA2hlcwDuiv60GHqfs0WuWG7jXa/CxRi Q==;
X-CSE-ConnectionGUID: QHNrwbA3SK+erN4d8ho6pA==
X-CSE-MsgGUID: +wCy9P9UQnOxC7I1z5X98w==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10783051"
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; d="scan'208";a="10783051"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 10:10:41 -0700
X-CSE-ConnectionGUID: E7fXGglMSlqacDpnXDTFrw==
X-CSE-MsgGUID: NgLmnRZdRV+vx34FhScKGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; d="scan'208";a="33399366"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 10:10:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 10:10:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 10:10:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 10:10:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 10:10:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJXYkcnBftaISQHa3dz6OhYqsH7+sbco9j/SKlvCuev0PiB/ZVdW2hEdnQX9VSz6nDWnUIPp2QU4NsPSq7ugT8EZ1rMBQRloeBEJ5Onyg6eIjluTJnlCqasGhsRWtq2dSnfhVT2qNp652m/cgeN/YgRVcAtGTiGPz2JPIQ1c6Kud/+Lra4Ot3NXWH7axAo7at86fZEQ1OodoU/5hY6QCpV5sOv/TSSvxodEvWlRcnOK94bvJenDDITpMk7qMB0FNm6CryzJ+9+70DoJR7hAH9K/mAnUN3eQEycZwznJJPSQgUeXLYQCG3Zfp0f5yrVuRmJYODEjvAkkojTYKuEklcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMG8JpUQYc5hqkd4+6W9O/TR7mNnQfFObgoDuURbwnY=;
 b=OZzM7eD728nzrjK/oUHTTqo3SuAOLlwtZAvryWUHUXIbHtMqGHSSWxVK/iSilZCSMV105ju31/8oBX0iV8m8JcMddou/tL45n3tJIzJoc7F83d6sZeSM2TZIMBO8TSLbqFYkbEm/xQPxl6tDhbkavSaE43KfML5rbJQeW1MKoMyVtCkmppRMmyVqySTm5oVxjpTEncvUKC3V4gYcp8OTniVxa841b4D96f/DfmjZqt/g8jV385CgUoLxd1IM6p/9SqiGnVLWw1rNb98yUwgjkQhszMkVzjAGt6ziLDtVF66XParIy120bIgM9xmhRGO1siVQKqzc2MxaaxrzOtzcYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 17:10:37 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 17:10:35 +0000
Date: Tue, 7 May 2024 13:10:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, Nirmoy Das
 <nirmoy.das@linux.intel.com>, <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH] Revert "drm/i915: Remove extra multi-gt pm-references"
Message-ID: <Zjpgga6ODnpmzeB9@intel.com>
References: <20240506180253.96858-2-janusz.krzysztofik@linux.intel.com>
 <91bf1eae-a9c5-408c-8ed7-affb83517d10@linux.intel.com>
 <2180809.irdbgypaU6@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2180809.irdbgypaU6@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0079.namprd04.prod.outlook.com
 (2603:10b6:303:6b::24) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|PH0PR11MB4902:EE_
X-MS-Office365-Filtering-Correlation-Id: 0238a028-ab8c-44ab-c57c-08dc6eb898db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qxp7EwjVGXQKcGONS0pAJmuO40g9qmVj8DRVsZlWhoT8F6wXvhu+rW3gQUvA?=
 =?us-ascii?Q?tAcy+30K/9Fpu4d5SXJByqqNTgw31we/+3doZaei/hqxtvRrU8NofeSMk3b+?=
 =?us-ascii?Q?/tk7IrOqSFJ71hXsKMm9l3VRuw98OWKsEp77S9V5nrPC9uw0xveL+KSU88II?=
 =?us-ascii?Q?RTc8pkNwIlVHzhO6OzBF1r51pWAkEeWB6fgFrTcEOdM3ITv8CZY8ffI6q8Eb?=
 =?us-ascii?Q?pmQUpmF3IVVmlApsMsJbEtIUzdi7+XlHHMt6rJcT3Lq9pOSrFAgIm4ErrnvE?=
 =?us-ascii?Q?Klk4MmqpiqaW+X/Rkz37cQ/H3yrHpvL+Xpmp6ZpLfL5syf0Fx2v51gAlrqHB?=
 =?us-ascii?Q?rmIlZgeXnW3bW6HuFN2wr6DMC3zyUND3IS4TagKjVua7ARMabR3/LjafoaDC?=
 =?us-ascii?Q?R20Z2am4x2tuq/IpZqEVVaF5oWrfie7pYKR6aZ2CWlZKsipFQ3VU0rmPzxZJ?=
 =?us-ascii?Q?oGbjT+57JeruMxFP9e/iUf9gDMEOieSBf16Ll5NV68GR3nMQPYPcqYnkpjMq?=
 =?us-ascii?Q?XQgWh0CxNG+PTVZvIZqjZMeEno68DWfhKMHOMq+YcP3/3A/3yPxHqhIZ17Kx?=
 =?us-ascii?Q?1n8tQSdzFjY1jXHEfYV9t4PjDxMjeFWtVpHW0C9MzBOQ19cNTg8Zd4z8SA2V?=
 =?us-ascii?Q?1wEo3fzSebMmnVOG2H8J7cE93CWvMYR4vPZ3yZRme4LP/mEVJuMnraDTZWOG?=
 =?us-ascii?Q?XG+MtLawhPwY23M8GzEV3/hg8B9/WQ7g279G5yJCf3yEjGg2l0O0Pf3zM4Gr?=
 =?us-ascii?Q?QnxkkiCy8Uuu7OrPjU7mzyVqjWIQepDTBNyCqJOVjUL1+546PYy5RhYDHzEm?=
 =?us-ascii?Q?HFxCAlbk8/JxDOzRAk20KZ5K/TtANPKzdnuTJ6vO32uA91cZAJMB7T5I1i77?=
 =?us-ascii?Q?WSYPsDjP65qSlUU+k8hdG1M9+7efisITTL6zAnD4eecDIZy5TJYSzLDvb6Dj?=
 =?us-ascii?Q?KSdRnxCEMx3O5skVXWtM93/bAVmOJeLxta5BHvyqsrl6LQMybkePngMLH7sA?=
 =?us-ascii?Q?TzivH0LGdIOLX/1rj8vIYGGFYdERcQ0wQ9H5/KOXGXoWXE/ZwX5smxTAQJ+R?=
 =?us-ascii?Q?+iVXAqOVg8QwkHCmDWBKM0jYQIk4JuBlUEjztdaL4eba8kj7uXv/k6NhNxnq?=
 =?us-ascii?Q?AV+Y9mzGI8ZRG8Dqa/9TT+qFWvys8Et75JLUh1WIV8PGpoeqYFmpJl64W8co?=
 =?us-ascii?Q?ipfQV43lJxfjLQt2x9VM0PdkuKn10EZgSIZKQLB9zV8wU8lUtoYpfTnHVGM?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U6pXigmJo2mkWAJ4GWCjUg9UXCPMzeHTY/nUsUD3k8RqleZd9kaThmw+MBYp?=
 =?us-ascii?Q?6TSu12esKa0FI3FNifq4/sh2q7wYoNbUkOMUuMHogL+zJEX7cWT1U3ly5gmh?=
 =?us-ascii?Q?0HgcyKxG/3U2h6JfGzoeLSDKmAeXGMXoS8eHFKAssjfL3b95iHl6Bw0dUNCK?=
 =?us-ascii?Q?s/D0rqh1fze4MleTIleiMttw1+8zt9JxTOuD8xUv2onn11DOhfB+vbcpQzQT?=
 =?us-ascii?Q?IWE++ra2IZ9Ubaopu828qfqFBMPHxigTk5XEHTg79Zz/ZcnO1LDSnytW1HLX?=
 =?us-ascii?Q?svpbcTcoYGBSiGZ8mSUBLfn7Mv6CdZ1uilzzinlqcvQGABofphu/NC+T8RTu?=
 =?us-ascii?Q?oU6cGJy8MO9qrn4EJkILF3+dfL9WxXh/PX/xbvrQIVTqzAiuV35G/rJGsFjM?=
 =?us-ascii?Q?44uUT+Uug/MYJbwSz35ZD5WmJs4C1rFdIdr8vc9HxLhr5XobauwtTiH/FXpl?=
 =?us-ascii?Q?OXQsJLJLlpZm4mCWLelvcii8C2f9Nt7nBf4sh1wRhSGqhV7hIx3vGwaFziTI?=
 =?us-ascii?Q?No3L4iA/ZZidVJoEVQIrbyWpwsMITfFOgrJDlKfKIqTx/plCpfTfc+CFwYOt?=
 =?us-ascii?Q?60NnCZzkgi7R6pK6c4BABiJKNZ/FkHFesTyCKDe1/kHUdsUfJdz/tTUqdunQ?=
 =?us-ascii?Q?uPCbHlChtb60sTvCAzw6BLOM93bvu2rRsu3duJ/SN0d/voMUw+7PgUdaDwFp?=
 =?us-ascii?Q?X+j/VodUI7VWZ8KnMNHKx0/IxeVFu+OSlqmTDvwU3e4G2ZfasCIS2t/22tTh?=
 =?us-ascii?Q?/RnQ6PnZ3IiEG0Tuq/5zH7gQfe/bLZc1NGJN9//uPKeN2LjHqheeJQ09Y54S?=
 =?us-ascii?Q?whplZzEnrqGsXvKHpwTFi4/CzWLbYh7I0qNEp5Rw2oJk28UUopXjARAPbhlE?=
 =?us-ascii?Q?L1p8ybat63s7kBqrKz0Bx/z2CNgZ4KxToor2Grpi5Y7ZjvHFeI8J02YUDYVa?=
 =?us-ascii?Q?+bXjGb8trXYwMbGR5/SdJn/XFFJ9ssIAwrz/uaxSV9kLzCleFURXxf+0J0nR?=
 =?us-ascii?Q?NHgI1BS0n8Bw1/6m0S7fHqCpp1MKWX72N23GT9Yx16pT+iJqTdH2pQJzivhk?=
 =?us-ascii?Q?i99RH+oTmYhT6HTJY2/HbNXIZHfaE0HBlv8UyuRzmlPpUapfH1CaC3MON/dG?=
 =?us-ascii?Q?lxOeyxKGbpwxkKBD2r9s2hXrrKj6BHvJh+M7CfKZ2gyQSoQJrOBwn263vvf/?=
 =?us-ascii?Q?ttp9JHdQR0WB5atdUBBMz2wNFOeGMgor9khfzGkmYJw5zZrP78lL3yqaNSdk?=
 =?us-ascii?Q?hlXRA5rUAbgodx70CSMyt3u+Lb6EtQG08aVetBrOf4ka+Jnt+P6hg3eAKQgx?=
 =?us-ascii?Q?w28m758d6BusTSnpH8qtChlGmzorY4G4274TESLE0mwjQOvSKndxYRaRwOcr?=
 =?us-ascii?Q?E/EZdn7KYFQusWL6+2QqtellDDq33f7+x5+a7oMv+g0iYvJKyjaDlcCz1Tqu?=
 =?us-ascii?Q?WAxwJnj9oAVqAohbx2Bx0TSAt+k8HYETSUi168Mu0c5bUq9jIL9FFOqLeu1i?=
 =?us-ascii?Q?OxO/k/oZqoJV/ikyhoOLvQc0H3ULp/LX2+q0K1Y5CEwuEAObvH5O+HZXeOSw?=
 =?us-ascii?Q?HGoFaVhT8Y33Av+HUS5/AKZqyYE0X1JO3EHK+byI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0238a028-ab8c-44ab-c57c-08dc6eb898db
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 17:10:33.7983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+KtBpikE3n07GZmDVEZA2wij+JI8m5dZn2Gej3R2UXJxEtcwD4lIw7d3AUNk4HjjU+CwZXrwd1uHyTnsM3f+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4902
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

On Tue, May 07, 2024 at 10:54:11AM +0200, Janusz Krzysztofik wrote:
> On Tuesday, 7 May 2024 09:30:15 GMT+2 Nirmoy Das wrote:
> > Hi Janusz,
> > 
> > 
> > Just realized we need Fixes tag for this.
> > 
> > Fixes: 1f33dc0c1189 ("drm/i915: Remove extra multi-gt pm-references")
> 
> Whoever is going to push this patch, please feel free to add this tag.

dim b4-shazam gets that automagically, now it was sent in reply ;)

I just pushed the patch. thanks for the patch and reviews.

> 
> Thanks,
> Janusz
> 
> > 
> > 
> > Regards,
> > 
> > Nirmoy
> > 
> > On 5/6/2024 8:02 PM, Janusz Krzysztofik wrote:
> > > This reverts commit 1f33dc0c1189efb9ae19c6fc22b64dd3e26261fb.
> > >
> > > There was a patch supposed to fix an issue of illegal attempts to free a
> > > still active i915 VMA object when parking a GT believed to be idle,
> > > reported by CI on 2-GT Meteor Lake.  As a solution, an extra wakeref for
> > > a Primary GT was acquired from i915_gem_do_execbuffer() -- see commit
> > > f56fe3e91787 ("drm/i915: Fix a VMA UAF for multi-gt platform").
> > >
> > > However, that fix occurred insufficient -- the issue was still reported by
> > > CI.  That wakeref was released on exit from i915_gem_do_execbuffer(), then
> > > potentially before completion of the request and deactivation of its
> > > associated VMAs.  Moreover, CI reports indicated that single-GT platforms
> > > also suffered sporadically from the same race.
> > >
> > > Since that issue was fixed by another commit f3c71b2ded5c ("drm/i915/vma:
> > > Fix UAF on destroy against retire race"), the changes introduced by that
> > > insufficient fix were dropped as no longer useful.  However, that series
> > > resulted in another VMA UAF scenario now being triggered in CI.
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
> > > We defer actually closing, unbinding and destroying a VMA until next idle
> > > point, or until the object is freed in the meantime.  By postponing the
> > > unbind, we allow for the VMA to be reopened by the client, avoiding the
> > > work required to rebind the VMA.
> > >
> > > Starting from commit b0647a5e79b1 ("drm/i915: Avoid live-lock with
> > > i915_vma_parked()"), we assume that as long as a GT is held idle, no VMA
> > > would be reopened while we destroy them.  That assumption is no longer
> > > true in multi-GT configurations, where a VMA we reopen may be handled by a
> > > GT different from the one that we already keep active via its engine while
> > > we set up an execbuf request.
> > >
> > > Restoring the extra GT0 PM wakeref removed from i915_gem_do_execbuffer()
> > > processing path seems to fix this issue.
> > >
> > > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10608
> > > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 18 ++++++++++++++++++
> > >   1 file changed, 18 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > index 42619fc05de48..090724fa766c9 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > @@ -255,6 +255,7 @@ struct i915_execbuffer {
> > >   	struct intel_context *context; /* logical state for the request */
> > >   	struct i915_gem_context *gem_context; /** caller's context */
> > >   	intel_wakeref_t wakeref;
> > > +	intel_wakeref_t wakeref_gt0;
> > >   
> > >   	/** our requests to build */
> > >   	struct i915_request *requests[MAX_ENGINE_INSTANCE + 1];
> > > @@ -2685,6 +2686,7 @@ static int
> > >   eb_select_engine(struct i915_execbuffer *eb)
> > >   {
> > >   	struct intel_context *ce, *child;
> > > +	struct intel_gt *gt;
> > >   	unsigned int idx;
> > >   	int err;
> > >   
> > > @@ -2708,10 +2710,17 @@ eb_select_engine(struct i915_execbuffer *eb)
> > >   		}
> > >   	}
> > >   	eb->num_batches = ce->parallel.number_children + 1;
> > > +	gt = ce->engine->gt;
> > >   
> > >   	for_each_child(ce, child)
> > >   		intel_context_get(child);
> > >   	eb->wakeref = intel_gt_pm_get(ce->engine->gt);
> > > +	/*
> > > +	 * Keep GT0 active on MTL so that i915_vma_parked() doesn't
> > > +	 * free VMAs while execbuf ioctl is validating VMAs.
> > > +	 */
> > > +	if (gt->info.id)
> > > +		eb->wakeref_gt0 = intel_gt_pm_get(to_gt(gt->i915));
> > >   
> > >   	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
> > >   		err = intel_context_alloc_state(ce);
> > > @@ -2750,6 +2759,9 @@ eb_select_engine(struct i915_execbuffer *eb)
> > >   	return err;
> > >   
> > >   err:
> > > +	if (gt->info.id)
> > > +		intel_gt_pm_put(to_gt(gt->i915), eb->wakeref_gt0);
> > > +
> > >   	intel_gt_pm_put(ce->engine->gt, eb->wakeref);
> > >   	for_each_child(ce, child)
> > >   		intel_context_put(child);
> > > @@ -2763,6 +2775,12 @@ eb_put_engine(struct i915_execbuffer *eb)
> > >   	struct intel_context *child;
> > >   
> > >   	i915_vm_put(eb->context->vm);
> > > +	/*
> > > +	 * This works in conjunction with eb_select_engine() to prevent
> > > +	 * i915_vma_parked() from interfering while execbuf validates vmas.
> > > +	 */
> > > +	if (eb->gt->info.id)
> > > +		intel_gt_pm_put(to_gt(eb->gt->i915), eb->wakeref_gt0);
> > >   	intel_gt_pm_put(eb->context->engine->gt, eb->wakeref);
> > >   	for_each_child(eb->context, child)
> > >   		intel_context_put(child);
> > 
> 
> 
> 
> 
