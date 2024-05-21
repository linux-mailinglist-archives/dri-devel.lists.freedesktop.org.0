Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0108CA688
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 04:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5685E10E5D0;
	Tue, 21 May 2024 02:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQtFGxAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC28110E465;
 Tue, 21 May 2024 02:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716260327; x=1747796327;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/pJQ0ZAmkOF0f8Vcop8PqwOgeHUvhA3KtozNl9trgGo=;
 b=LQtFGxAO93YjFwq9BCmyTDmi3wb/0aS/WheqSVjsJqYUpWVThBjG9K9J
 ytoN0TZSikA7uTEfr8HMj30ycCSxhQZv80ZeFwkyVxPXkmNGncPClKzOb
 u3kCdATIqrY1dly7jo2RT4EN3pmtKPq90b/juhR2boFsg+ubuKRW5qvbq
 wpBRSux6xnjqk+d8+RJSumi+52ryWZI88uHdZLp9RnEncgokeeWifFx8P
 Na0GHqk2Qru/AIkU1Dj7kY3LDVK23CNigKu27WSUQ7wcd1lslZwO/hT+s
 xQtUe9Fhq3Co6IFLQxQhAKdybQcgf+qLZttX2HGLQwbuvlieVSiswrpDi A==;
X-CSE-ConnectionGUID: zodIPsHKTT+lh5PuEcuGzg==
X-CSE-MsgGUID: dJY8tAHKQA2xR49pDvRHtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23832281"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="23832281"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 19:58:46 -0700
X-CSE-ConnectionGUID: AKi2+uPHSQ+NpbU73EPnNA==
X-CSE-MsgGUID: RklMr3ybQYSJ5+LyZxM/1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="33185348"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 19:58:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 19:58:45 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 19:58:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 19:58:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 19:58:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hv9I9Uy84059OFcx0ZDtB6nZ+aGVVB6AQ81DZ8glxEqkOGB7UaLXW7N0GeaWzxLAbk+SDCRgO3G9wg3GTPqHddA+mTjqtEYuHC+VnuXPSi8Gfzy/Y7mYt+6tGpfIJza9EcPEcvKlo+xXBIF6cLCxHINwI45p6Rc1wj+zzJQVTZFMsCkeNP3tpcC4g97RopYvVgG8me2PcLbjsvbwPEDUIrG4HidiBQqZr9xoe6tyLuvQE7JQqvcf+vjiUAm7t7e69SZf5iPFIW1es+qa+cVHI2+B6K5FyZK60BwAUAeHB+tsZcLuBLgXfFBAt089YMIFksbJ1Aq870t9ERjCUctXxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUSanm8JaOID1gcH11mg6sbCaJHHLjlABHt5FlmHsQk=;
 b=Z53mwsJxQ6Y2V81wZh7DqCF3dSlPZ/LNM+v+sYCSzEIskeXwfuoZ8yBikxTxQhLTxvTkVGaszD8KtTUBAKDfMsKcw79Y4xe6f1336fHS5lP+FR33DX9G62HFVMY4ecuRcgTuvdVjyH1Y4r7wNYq4aMGO4/PlJpuMwKWtX4RZFhiM3h5jY0DvMuv/EZi+vroKqJvcfkua9muo08fW1dPD64lh4w6wSzmYMn7JQgIowMkn21zTOWXD+kmH4ZDXZFINEAHj0fxrkJ8nRMQ/O3ZoVPl3bs1Xs/1l9HCUkh+vp0rcfoeXaAVFMzy+jEmEQ0Wo53V7SNy7WFyDQKP1lTDjRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6839.namprd11.prod.outlook.com (2603:10b6:303:220::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 02:58:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 02:58:43 +0000
Date: Mon, 20 May 2024 21:58:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 5/8] drm/xe: Add helper to accumulate exec queue runtime
Message-ID: <y7te4sm2pw3fsmzx64ax3edpq7xypfngxh6azt67dogatfvl4n@2udawvzoxr5z>
References: <20240517204310.88854-1-lucas.demarchi@intel.com>
 <20240517204310.88854-6-lucas.demarchi@intel.com>
 <20240517224022.GC2343622@mdroper-desk1.amr.corp.intel.com>
 <fuzcf5ntgkfnsgxovqj67sknsowk74gikec6wtdq45dj3zbnab@m7suetcohnfa>
 <ZkwMxNNWK7qNhzbR@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZkwMxNNWK7qNhzbR@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR04CA0108.namprd04.prod.outlook.com
 (2603:10b6:303:83::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: 5385cd1f-852a-4196-a0a9-08dc7941eccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+zFhclbHMkQPVHe1CgQQYuzMPo8HduqsTw6+HbmP7HGpWhRfcyfX0vf+yQEG?=
 =?us-ascii?Q?6cjpJNnvw3xrwSMaHUOmpxHp6F9eZ02yqigYX7bUhMB6KYC8YFK3mm4XS7Op?=
 =?us-ascii?Q?M24sTv7m9iV1X/UYuEKfom9726O6UZ3Ngg79rr+ExV6Bi/WowfPpuCOjff8A?=
 =?us-ascii?Q?0RGpbrAegJixdd2duS4WctrXJBmak2L/72zd7KuBshu8I3dGi9X8PeJlQXLt?=
 =?us-ascii?Q?dFrsawLLU4uNHI4KwCF4q4NfzU1F8Vs3Vf4CKCpNYapkBmTpYc+i4SVO3mfJ?=
 =?us-ascii?Q?I4uELNQs5n38kn49PoUc5mbcLqLkux52i/8x5JqV7OS373EyZcc9gMez0dRm?=
 =?us-ascii?Q?NUjjEepY4TcRr7rFyN1D0+aXokMNcpBVDUREZ4hzVbKvLZVTRHg4sQqNZn3m?=
 =?us-ascii?Q?zFOstcWI1qzembwxDfx31c0pQMaHOa5wPS5svgbIQmenbeN0Fx7L7zLC7Uyn?=
 =?us-ascii?Q?XbKT2wYbUf2FAnLat5bhiTr4bcH+lY0hrgYzoSjrZGQw/bW0JGyGF8MiyCGJ?=
 =?us-ascii?Q?QVbZHqcQldSoFUzi6CFziMkZoVVjfxrqYQDLDSDgJOhj4Q9NwgXWbVNvBPen?=
 =?us-ascii?Q?xpFNNX1QjCNKh+GGrBQ3zXeqwACfx1jDZxOEC9+5CXfts6sDVED7H9ovVMvn?=
 =?us-ascii?Q?jQqgPUqu7JDbR2qjLyoAODX1S0abVzyG4Zi/8ZXwpKNQ+psCgFkdaQiOhnV2?=
 =?us-ascii?Q?/tNy+pQ0H4rxV+L6P8936Z/DhImKtH3DXRlcuCgscizAmrB73tdnB15iKiER?=
 =?us-ascii?Q?XfgCYyLiRzp2JE3CKz/McGETHlnrKbPYuSJEyD3d5iMTpqmElIccNsFSUQky?=
 =?us-ascii?Q?6t5UMIROF16s5hSIEwVauEx1EJcH+BXEhwtEHbImC7cmJoQ8l+a6UuvEhhUo?=
 =?us-ascii?Q?n7oEGPNouyPEaIcm2TAMWXt6LVMNAI6artmz3D2JGFsYI5/GpzLMaSxrSyyv?=
 =?us-ascii?Q?hWim/5CKocmmmj13ZB6CJIeJsWBz1831tlajuAbdGRxvfNyxZqzd3laJ2MaU?=
 =?us-ascii?Q?wRt4eSmHpvY00aowWPoUznCqT5siCAPWQ9r1zTm6ZXcmeNb5KKaAkB2ZHnHY?=
 =?us-ascii?Q?X3ancec4D00RtaGVZ9m6uu6fhcPWUGwoiTKQv5+UeyqitF2WzMIxnguFpsYd?=
 =?us-ascii?Q?19WQHN3g8YGFCEdKBdWTur+4isQNeSiWtHTHtQwI4awC7XvWdwkBDJsZaeQ0?=
 =?us-ascii?Q?8X+PpP/QXIgRKPVkv9xRd+brUiV03J+fYjafKS2OC01rY/5ttGQE+xhE51om?=
 =?us-ascii?Q?nJkV67cEhPvW4pV4ZFl8gJjLRp1j+kzD9g3fLclJWg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uGaQCCFBbSR9QV+c8QG0/acORsNkzVBiC95P6SXHH59JjhS8t+8dLq+82OoL?=
 =?us-ascii?Q?L7BgPq6ExVjFqmBsq2iaxX+a3JmV3dPuZrH0TCorrmjxC9m5akNicJOO88lv?=
 =?us-ascii?Q?8Nj7k8k8AoZX/hjK8LBSSMguS23v5rZ4IEDuZ1rso6s9zyWt4G5lrDe9GySn?=
 =?us-ascii?Q?t9T0eQi9GP1bEwkq39ftU6Ziq7qbpXcsAaYakY7uGt705YnJ+PtJ77Gn9GSi?=
 =?us-ascii?Q?eSiQxqi+nAh2/Es9h6FZ0fV/Fl7lhHEE5rvoW2IoI705q5s2mQw+klKbrlcV?=
 =?us-ascii?Q?ephJE7RjVSaF6YwDbCCKe4US1rtB6Aln2a+MKD5KeZ7VKSZXCoK3qtKsy90t?=
 =?us-ascii?Q?ZinQz6n+TpkUbx7dRc3WuNH3qO5LeHK5azV3Tba9EijS47ua5r0+JUegaI+I?=
 =?us-ascii?Q?32zDgaDy0aGzQdnCTc3/6MC37l1IHOBSwOt7oQCNMFl8PMJyuMDho8RyNxQS?=
 =?us-ascii?Q?ow5hvGH0ZIVHN6WFw69Eqa+FHoOwtIT7ctvBJHloJYXMTICU3+QTZXGCWFjE?=
 =?us-ascii?Q?TMLkFcFHyPxGXUNJBtaKM88J4NytKU0WDMdbA0wGvsWX/lhU/6oUWoLFAd12?=
 =?us-ascii?Q?hG4Vgrv/aqLRGVfajQCqSEbpAAIbIUld/YpcWXXDuNO5uDpM2kqEKvNUViw6?=
 =?us-ascii?Q?sFjUfy9ra0Bwevc0z7JUnzi5GPpe1oiv02zRLHuApZQtzo7rj4WIgPRfN0iK?=
 =?us-ascii?Q?8E4ylJUeudOCSl2szd/7BhM4c0D/Q1ays/b84VsU2HuCksfAbfzY1kN10N1P?=
 =?us-ascii?Q?Y3Zoj6vwVAqNIUq2y90tZKGXEB8Z1Iaw61PHdMeKHkj5eUt5+nT4HO8mNrp3?=
 =?us-ascii?Q?zJc4Xewjewg8IpkkQB+UGvg2s20+DHN8vYPVg1lHLWARDOXZFelWBz9wUa68?=
 =?us-ascii?Q?Wim5D3l5LW6Ni7JbFwarQg7jLfoetYzY4XFkDBRJOIXYvDhjGwaHz2RjXoNh?=
 =?us-ascii?Q?URDFivbutUmktkmzNcl6l6pCFVr9pYYt95bnOOj0qf2dZtUiAygYEB1ercg0?=
 =?us-ascii?Q?b3K/i+axR5w+BBLCN6VYi28WIuKBgNrpGVZdYkpRCzXZqBnuNZOhKZOuEzzH?=
 =?us-ascii?Q?tjjKK0T1pWdXLk4ah7a+8ptcM3MU2HVd4gGoVzDvUusKynmtTf//jzoobt3x?=
 =?us-ascii?Q?3Qt53VMnVgJ8vKwkfnrVF3iH24xGGhuhlREPSJVdI37p3uLbe2qme9brc3Wu?=
 =?us-ascii?Q?Bpgd0nomea7XoS9eClH7tAZQ+zbaDUtBhBYEe46vDnY0eGvUToHHUAxvGtJj?=
 =?us-ascii?Q?/Lo1ofQbntAdj8B+g7t51HRY9IX2W2Z2V7sCbHRGU0UOcdrmZFO18RsQxKwq?=
 =?us-ascii?Q?AA7xMBla0PRGq8wPgfKwD7VNtS7hHWbv/2OP7Be5ho+zHRaxUT9kKoTZFxOe?=
 =?us-ascii?Q?gtBAJhAc+gvftmK5Kteu7m/uqgvOZHYdYid3lVWvhcwI3HnyOv5pWysOjJIm?=
 =?us-ascii?Q?m/+ZitmMq9Aq2WWV/iEWoqK4EiNxx44F6EAUmF/KnhlZv9FtYxbZcAXDzcy/?=
 =?us-ascii?Q?98mn851fmM5vPXjcymuS+NE153TJfnJrbQvzGzrA17+vZvubRXJPjFrPmjYa?=
 =?us-ascii?Q?OBzo7t4HmXxCJJ/XHcQ4HmXFA9dA/XFgUH9xqrTLuvZ0CiUB4q5vX+kjMO1b?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5385cd1f-852a-4196-a0a9-08dc7941eccc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 02:58:43.4626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hcap7CtyizwrsGdF3Ow2YPg3mW/luuVeReI5k5SLtLp1viHFZspbOe0S1l6TngtC4+EhOjRLii5rJVqfr75W7Ji90bZGqdVRiV4dtmb2pzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6839
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

On Tue, May 21, 2024 at 02:53:56AM GMT, Matthew Brost wrote:
>On Sat, May 18, 2024 at 09:37:20AM -0500, Lucas De Marchi wrote:
>> On Fri, May 17, 2024 at 03:40:22PM GMT, Matt Roper wrote:
>> > On Fri, May 17, 2024 at 01:43:07PM -0700, Lucas De Marchi wrote:
>> > > From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > >
>> > > Add a helper to accumulate per-client runtime of all its
>> > > exec queues. This is called every time a sched job is finished.
>> > >
>> > > v2:
>> > >   - Use guc_exec_queue_free_job() and execlist_job_free() to accumulate
>> > >     runtime when job is finished since xe_sched_job_completed() is not a
>> > >     notification that job finished.
>> > >   - Stop trying to update runtime from xe_exec_queue_fini() - that is
>> > >     redundant and may happen after xef is closed, leading to a
>> > >     use-after-free
>> > >   - Do not special case the first timestamp read: the default LRC sets
>> > >     CTX_TIMESTAMP to zero, so even the first sample should be a valid
>> > >     one.
>> > >   - Handle the parallel submission case by multiplying the runtime by
>> > >     width.
>> > > v3: Update comments
>> > >
>> > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>> > >  drivers/gpu/drm/xe/xe_exec_queue.c   | 37 ++++++++++++++++++++++++++++
>> > >  drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
>> > >  drivers/gpu/drm/xe/xe_execlist.c     |  1 +
>> > >  drivers/gpu/drm/xe/xe_guc_submit.c   |  2 ++
>> > >  5 files changed, 44 insertions(+)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> > > index 5c5e36de452a..bc97990fd032 100644
>> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
>> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> > > @@ -555,6 +555,9 @@ struct xe_file {
>> > >  		struct mutex lock;
>> > >  	} exec_queue;
>> > >
>> > > +	/** @runtime: hw engine class runtime in ticks for this drm client */
>> > > +	u64 runtime[XE_ENGINE_CLASS_MAX];
>> > > +
>> > >  	/** @client: drm client */
>> > >  	struct xe_drm_client *client;
>> > >  };
>> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > index 395de93579fa..fa6dc996eca8 100644
>> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > @@ -769,6 +769,43 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>> > >  		q->lrc[0].fence_ctx.next_seqno - 1;
>> > >  }
>> > >
>> > > +/**
>> > > + * xe_exec_queue_update_runtime() - Update runtime for this exec queue from hw
>> > > + * @q: The exec queue
>> > > + *
>> > > + * Update the timestamp saved by HW for this exec queue and save runtime
>> > > + * calculated by using the delta from last update. On multi-lrc case, only the
>> > > + * first is considered.
>> > > + */
>> > > +void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
>> > > +{
>> > > +	struct xe_file *xef;
>> > > +	struct xe_lrc *lrc;
>> > > +	u32 old_ts, new_ts;
>> > > +
>> > > +	/*
>> > > +	 * Jobs that are run during driver load may use an exec_queue, but are
>> > > +	 * not associated with a user xe file, so avoid accumulating busyness
>> > > +	 * for kernel specific work.
>> > > +	 */
>> > > +	if (!q->vm || !q->vm->xef)
>> > > +		return;
>> > > +
>> > > +	xef = q->vm->xef;
>> > > +
>> > > +	/*
>> > > +	 * Only sample the first LRC. For parallel submission, all of them are
>> > > +	 * scheduled together and we compensate that below by multiplying by
>> > > +	 * width - this may introduce errors if that premise is not true and
>> > > +	 * they don't exit 100% aligned. On the other hand, looping through
>> > > +	 * the LRCs and reading them in different time could also introduce
>> > > +	 * errors.
>> >
>> > At the time we're executing this function, those LRCs aren't executing
>> > on the hardware anymore and their timestamps aren't continuing to move,
>>
>> not necessarily. Besides calling this function when execution ends, see
>> last patch. This is called when userspace reads the fdinfo file, which
>> portentially reads this for running LRCs.
>>
>> > right?  I don't see where error could creep in from just looping over
>> > each of them?
>> >
>> > I guess parallel submission is mostly just used by media these days,
>> > where the batches submitted in parallel are nearly identical and
>> > expected to run the same amount of time, right?  Do we have any
>>
>> what I got from Matt Brost is that they are always scheduled together
>> and will run together on the different instances of that engine class,
>> regardless if they are different. As you said, I'm not sure there's
>> even a use case for running different batches.  +Matt Brost to confirm
>
>I believe the current usage involves running the same batch program, but
>it operates on a different set of data. Even if widely different batches
>were submitted across multiple engines, the GuC schedules all engines
>simultaneously and does not schedule anything else on the engine set
>until all engines are idle. So, I think the logic as it stands is fine.

that's sufficient for me :)

>If everyone is paranoid, feel free to sample every Logical Ring Context
>(LRC) in the exec queue.

nah, I don't think so. We could do this in future if we find a need for
it. Thanks for checking

Lucas De Marchi
