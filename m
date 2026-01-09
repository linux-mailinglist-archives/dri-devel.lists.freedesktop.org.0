Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F014D0BF73
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACCD10E920;
	Fri,  9 Jan 2026 18:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJbBdKE5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93ECC10E920;
 Fri,  9 Jan 2026 18:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767984876; x=1799520876;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yfXRbG4zJOYA+XxJTauUu5sjk1KXfQfHftXFs6gO42s=;
 b=XJbBdKE5p8HOPGIMWdXaOYjluEOkJoS4O4yEqc9yw97s/mXwjqn6Wrw3
 Bor4l5QfBzCgXWVMcEoDv1Eb4fKadqKy+zdCi9p4SRUFCVMVKyd+inoBz
 AyUZMy06t2MfN3+isztwqSTt68tioSmeHmSuaorMgO3NI/ok9knAXC6Se
 z42TsuniOSsxFWg60ppxGzeV+I0x8K8LT2ZhbBc8Gx/WvxayZafY7KanC
 9vz2pNkWqeWHZKE2PCwYQErra1dfghfJlHHWskUX/kSCJ123DhKc54WAk
 8K3yh7WiFs94EDWMGdzWESyam7mFx2p66VKgEHqMQ27MR0qqhwlxQ76Ru Q==;
X-CSE-ConnectionGUID: ldXPHrCvQDOPBMIuCAmafA==
X-CSE-MsgGUID: wVD6Oes6S5mMgL/z9kvDGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69270412"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="69270412"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 10:54:36 -0800
X-CSE-ConnectionGUID: MVejV3Q/SGKZmC4mOZtzcw==
X-CSE-MsgGUID: eCtZY5xaSZWeD4MU39uBtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="203158054"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 10:54:36 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 10:54:35 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 10:54:35 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 10:54:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5Pf407DDtT7K7zcfTwBmczPtWzoEUn+fNQdk/Gr5UOOKwwcW0RgBBoWleHGsU+dCpBXIrXYe8v1s/wmQnlwCEHq6RAgd9J0+QujBXzwgOg0ntxzoMluSpWWI/M0R50q6B58mjZvtGa2T2ZxbQlzLBJgtO75zOkaeuKI82D3CyKgxGTfN4OxvazQZftXgwSAcvGwk8Hbh4+5GQywVB+PVynV4CapJlS+9LrkVg+0Sp/zPGJCDOkzAP2h7PMvwcLpHlW8ircqYUqTWKmoVR/BaVcHr5gi9do7sF2IoeY17KAk1jEqzkWMt1gPpj/WNS2aBZs0l7MA3uoeaxB98NZsIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsWMMxg3/yZhj6S0/l7YaRr3LpLbbwiSFW4INNdiWOg=;
 b=lJj5Uf1RzUvLMhhYtYSIwSMwfTpMOhHcW0M1FqwJG16rRD5D0fP+S16mfAF829Of2nu/5DnffIPaZtgDvhzeRq7xZj/mM+YSwhyalEssEGWBqjo/WEzRGAd2tVncwAdi4SSWehO/13FEhVsZdVP/qWEGu9qNDCFGpxDQiHk84s0I9RW380aqFRda2eLwqCvRoWQMl9JGReNkkAy1pfKXgKCto9iZakldOkSXS/hirSQq99G681ZWo9subHy4SV4dMzTwtyYYzdWc49a/FiecHXmyYKloTFlzjnUQFtIfi1oKbtKsoUPzkhtxWU7NpzZICIiK2Iheuyqo+w5dMOMtrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7782.namprd11.prod.outlook.com (2603:10b6:8:e0::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.5; Fri, 9 Jan 2026 18:54:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 9 Jan 2026
 18:54:32 +0000
Date: Fri, 9 Jan 2026 10:54:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
CC: <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko
 <mhocko@suse.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2] drm/xe: Replace use of system_wq with
 tlb_inval->fence_signal_wq
Message-ID: <aWFO5bWNIy+N5/AS@lstrano-desk.jf.intel.com>
References: <20260109155717.269221-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260109155717.269221-1-marco.crivellari@suse.com>
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c65093e-ab6d-438f-01d0-08de4fb0864f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vj4kKo+kU3vxDDB7isax07YGwS+mkCTJ6Rqf1wBD78VFIoabTw1UbAw3/H7E?=
 =?us-ascii?Q?DU/VljtBv6JfK+ThmewHE1sXPb66nVTYTgtFpQSMQpOanJaZRLocf8elA4UO?=
 =?us-ascii?Q?ADMJ5v2IM/XBk7L3nK3UeB1ahXdIYatif62unBVt1imaMDzLlFepAkGuK19N?=
 =?us-ascii?Q?HYKpYaDCqlyVsIUwadzgFKd9+yMZofxpUK51YGZPn+wWFMHoFsTi6zPC0b7K?=
 =?us-ascii?Q?BBwmwP0YBNO1WPoYuS22ebwRE5v/J8/XsIYd8ObnTnMlIHKhN4BmhH9vy86y?=
 =?us-ascii?Q?Dm6f+9zbE1K0iqZiZKkOIP+WHKwZmNZlVsxOpwK8L0jGeMOwwgJJ/HIaCXAm?=
 =?us-ascii?Q?O1OXKIxfbk8+FkK6v/xWqT7KQXJ51BoO7Pd+dH2Krba3wyu6yhjBT0rKbgtK?=
 =?us-ascii?Q?tuieAqXyaAgExInec22fvVXPQmkJrAaek6z/DrCgDJwCRy4vXGWDumDZ7qfT?=
 =?us-ascii?Q?5bmMZsxwp/4KIWDchOEdvOQI/58KWhHhDMEKhrIQcbMxWKiyEn2JFubu2Vc+?=
 =?us-ascii?Q?ypdWKHG7eNDBABVJ/9cVr9ljud/DJs7QUnFphEqSWhaziKb9i454dY2QsOgd?=
 =?us-ascii?Q?YUYLgKjYPzmcvsWpk0TFzIKsuCatS0OLScQfnP4/DALaUgb/cblJeyqmgS+h?=
 =?us-ascii?Q?jE5Kz0NDRRTyUUHHgAflk7YWcdSMmzeaEu8mQbrcXphheqoOu5cof2LoxN9/?=
 =?us-ascii?Q?frIfvTmacKlo8dvuTpsV1KG7AQ2j8LXzI2zEAlqA4QBho+cDkwUyYpuIIIK2?=
 =?us-ascii?Q?4BQIPjTtZbDnKMAlZfAGAcavHY7sX3Un+xG9urB3koEvf23iSg5TNNms6gTM?=
 =?us-ascii?Q?iNvuU7s4XZH/fhmLIuBUKar/r7rTMzUYlKnbf+l+fyQJANFt1eIA7WqtS9bY?=
 =?us-ascii?Q?4qQB2hqUQD69OhaA+PkQsqrlLuGp+9yRKFav1Iz1G8Q/kYhk0ac3rF1AxeoB?=
 =?us-ascii?Q?OCSNQA8ifmVyQ8jmdScvW91zPqQhAgy9qOlZJBKcfPCVjdb8d6nK8D0FZV7Z?=
 =?us-ascii?Q?Smm/u8QCWHxWnbiLSFLoK6NQeHh5zlz0I2ZMTwhfZHHz+BZQqLMtCFDyQ7z6?=
 =?us-ascii?Q?NmEzO3qrCUu89r6Wn6WgDYJwf0Rh0MJQM+jH/Z+GOrd/FlX61LDQRhpp4M1G?=
 =?us-ascii?Q?FuYcbcJpYCDSm+PgNSvTxIiQ2uhPfWP/pKaoUj0HSpYEyrWNtvnCC2DutKja?=
 =?us-ascii?Q?gk8fV95DPGzQdbwq/WpAoHKUzQs7SKiEaDzWHvcVY7sKzWrgIShsu0Zhwc8q?=
 =?us-ascii?Q?pw3SwmNZDUjv5ENHg82d2AqDbvAzSS9S7APOc7VZxPxWf6KykEWAk4ZETpAw?=
 =?us-ascii?Q?1ClWKriYJ1+BurgZBYcjr9187tBQy7deeoIi4sJiCpPGizVF6Zn2PYgSGBcV?=
 =?us-ascii?Q?3zqQD3j9nsTCDWtro8gKjFQhFKeUAHQiOhw+dSWKvMF7cFJiZWIptfH7Rkgu?=
 =?us-ascii?Q?HNdeItzbFskdr/xl7V3Ec7sj74mx9NWyqhqxibqKwfnUY2wFztu9Ow=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jjvwoaDeYm1UmU07aJvhVGhUocslCe1ehY2AWxcQLdRf5FRq7/iE2mhHZEkB?=
 =?us-ascii?Q?7D51dkwuzBNtMfrZthW/t0aObtAtTom3XCmUQqdvRHW4C3ZN94ANLJeUhj/p?=
 =?us-ascii?Q?gE3oId9md/fqj5yslKpsg2vIBV3qrabcHX1Sfh3fL3jPTypAcoaU2pbcV74m?=
 =?us-ascii?Q?5W9whO1yD8KxbUslunPropoMTnr6XWsItUD0ppGjFV1J+1pwO8iqBdcxSzUe?=
 =?us-ascii?Q?UF4GRlErLM/k2XtcZ7VK3eym6ZGsw1/1+MA8GwHat7nR+30n9cR0NmsoGpo5?=
 =?us-ascii?Q?ezqh4i+fb+fpsKp4V4UTbr+8uKWRADPNxRUKbbMXnMoBopA5rBsdqYVX+gti?=
 =?us-ascii?Q?J5coDQKJr2ToO85xsUYS/mLWrah5i7OlRKzQDYGG4m2dhNoGqRMqDY5V2fWa?=
 =?us-ascii?Q?g7NqfhqLBTCMLmAFUYi2XWn8R8rszKyMtATouflZGHHPKF49JsCEP05+e671?=
 =?us-ascii?Q?KHzZmtgAIowgne955U+W8fJkv0UOSTty7lmOrbGR8jvBT2vjpQAwv5uIkzxM?=
 =?us-ascii?Q?sZ+MgFNMxnB0KTKN40/YmYnCDaQ1khexY+sqCmpcwmJOIWaK+jkdPoGr4ZKD?=
 =?us-ascii?Q?6nWBM4uDxEO0SFeHif9xA6vG3MzJM7cp4O93ufKysXDIBbiRFmWd82mwgxZR?=
 =?us-ascii?Q?U7I+dFkzGF+duZU18Dng9NZYOyn9wFvPV7zc/jOYPHiCz8d0i3ao4scZvzKI?=
 =?us-ascii?Q?/yNea3uEzr6tiEmp0wR7xlZjUjKeN6bc82Z/gmA7uUMnTKfxAU/DWzC188zq?=
 =?us-ascii?Q?go+AOCaAm1XbVL5+0jXvy6IRhmIOHUTKhKfEJD904a3KpQKlpMWIL3/eQhG4?=
 =?us-ascii?Q?g7U/yeJVpqizZNfC7n6IqPzvG5ktueXImLBgmaQdv53glAvhAzGOEIZ1/538?=
 =?us-ascii?Q?xT7+QbG/SjW/qeyZkQPx23GXr697tV9J/Kmuq9FlsE8OGNUY+mpxtimaM5vS?=
 =?us-ascii?Q?58HwPz2ZIwJmMRS7hRkEB5G72qSIZKmQsfAQuNrZMiYmi/Ye2MN5j9vnNUAx?=
 =?us-ascii?Q?ZZ5XxFkc6DRncurh9tz27HWkDYmHA5HG8Zibu+g9ulH08jaAVYLgouvkH4Gj?=
 =?us-ascii?Q?bD7IAo6crqWewo9RWawG0VD8oI1J6NPSHd/Pm0Of20/9EpvBqm86PPTeoR9H?=
 =?us-ascii?Q?8bmS/8vcyverrRJyWkKNQSNI+pk0+BRxR+x76lL1Oph5i5j781gdPOawiB8i?=
 =?us-ascii?Q?z3Vhi7P7yVuNI1Nw6jxkv3yyLtcF129v7IIXyDAk993dvKw8Hvua9p66b3b+?=
 =?us-ascii?Q?Qz+3elojYjGRQdlkbUyEI6+YNoghu8uZhAqBm/DuSK91k96ry4svteJuIL6G?=
 =?us-ascii?Q?3hXJkV78CYeK3TjihX4BZZ1YJRIfwgoPdi8aX/6/jVo/guGiodv3iOs0Yck0?=
 =?us-ascii?Q?ku93DxdvW8YMq5EMU/OjHQURhAMsgPx8Zc6GQFlOtgBcv7wbNml2zy7ikHZe?=
 =?us-ascii?Q?oRRIiRZXhRvtZHm0B8qzrxC4MRD3VKfdwTuPV5As2ymeXWX/4oPCUnz1PE7b?=
 =?us-ascii?Q?q+MZutgUWy+fZ48OwPtiNikreYv6USxKk3oqY2TNqRlMg5mr2mVyb3n7vkGc?=
 =?us-ascii?Q?9sDQrSdZUY71sjHbqiKUvYqLCQm8koNO0ok4FCdkooC0NdF8F2l0wgEIlq/C?=
 =?us-ascii?Q?vpwjMJjumWu3Ysa+RnOXYGWHglkBfDEiChb3tTgmiHtC8f1oyHrYfCtcdy68?=
 =?us-ascii?Q?6hweq2nGh2ZR6jBjBmkUzXJI7O8DwEG29kuXR7irhWy1KLewpgi7K86Vxikd?=
 =?us-ascii?Q?CqK5qYpoD/yfnSPv+wc2bDMdYpy1EgE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c65093e-ab6d-438f-01d0-08de4fb0864f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:54:32.0458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4g6icmhmcF5LEwqch2OiJeT4/gPaeLaIb+cujozyWw3UMNpsgdTuZyn5g/c0fETcjSB8HGJQW4cuwbx5TU/PDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7782
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

On Fri, Jan 09, 2026 at 04:57:17PM +0100, Marco Crivellari wrote:
> This patch continues the effort to refactor workqueue APIs, which has begun
> with the changes introducing new workqueues and a new alloc_workqueue flag:
> 
>    commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
>    commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> The point of the refactoring is to eventually alter the default behavior of
> workqueues to become unbound by default so that their workload placement is
> optimized by the scheduler.
> 
> Before that to happen, workqueue users must be converted to the better named
> new workqueues with no intended behaviour changes:
> 
>    system_wq -> system_percpu_wq
>    system_unbound_wq -> system_dfl_wq
> 
> This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
> removed in the future.
> 
> After a carefully evaluation, because this is the fence signaling path, we
> changed the code in order to use one of the Xe's workqueue.
> 
> So, a new workqueue named 'fence_signal_wq' has been added to
> 'struct xe_tlb_inval' and has been initialized with 'gt->ordered_wq'
> changing the system_wq uses with tlb_inval->fence_signal_wq.
> 
> Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
> Changes in v2:
> - added 'fence_signal_wq', initialized with 'gt->ordered_wq' in order to use
>   it in the fence signaling path, instead of system_wq.
> 
> - rebased on v6.19-rc4
> 
> 
>  drivers/gpu/drm/xe/xe_tlb_inval.c       | 10 +++++++---
>  drivers/gpu/drm/xe/xe_tlb_inval_types.h |  2 ++
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index 918a59e686ea..2e98f407c59d 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -94,7 +94,7 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
>  		xe_tlb_inval_fence_signal(fence);
>  	}
>  	if (!list_empty(&tlb_inval->pending_fences))
> -		queue_delayed_work(system_wq, &tlb_inval->fence_tdr,
> +		queue_delayed_work(tlb_inval->fence_signal_wq, &tlb_inval->fence_tdr,
>  				   timeout_delay);
>  	spin_unlock_irq(&tlb_inval->pending_lock);
>  }
> @@ -146,6 +146,10 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
>  	if (IS_ERR(tlb_inval->job_wq))
>  		return PTR_ERR(tlb_inval->job_wq);
>  
> +	tlb_inval->fence_signal_wq = gt->ordered_wq;
> +	if (IS_ERR(tlb_inval->fence_signal_wq))
> +		return PTR_ERR(tlb_inval->fence_signal_wq);
> +
>  	/* XXX: Blindly setting up backend to GuC */
>  	xe_guc_tlb_inval_init_early(&gt->uc.guc, tlb_inval);
>  
> @@ -226,7 +230,7 @@ static void xe_tlb_inval_fence_prep(struct xe_tlb_inval_fence *fence)
>  	list_add_tail(&fence->link, &tlb_inval->pending_fences);
>  
>  	if (list_is_singular(&tlb_inval->pending_fences))
> -		queue_delayed_work(system_wq, &tlb_inval->fence_tdr,
> +		queue_delayed_work(tlb_inval->fence_signal_wq, &tlb_inval->fence_tdr,
>  				   tlb_inval->ops->timeout_delay(tlb_inval));
>  	spin_unlock_irq(&tlb_inval->pending_lock);
>  
> @@ -378,7 +382,7 @@ void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno)
>  	}
>  
>  	if (!list_empty(&tlb_inval->pending_fences))
> -		mod_delayed_work(system_wq,
> +		mod_delayed_work(tlb_inval->fence_signal_wq,
>  				 &tlb_inval->fence_tdr,
>  				 tlb_inval->ops->timeout_delay(tlb_inval));
>  	else
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> index 8f8b060e9005..1a3e239ea3a7 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> @@ -106,6 +106,8 @@ struct xe_tlb_inval {
>  	struct workqueue_struct *job_wq;
>  	/** @tlb_inval.lock: protects TLB invalidation fences */
>  	spinlock_t lock;
> +	/** @fence_signal_wq: schedule fence signaling path jobs  */
> +	struct workqueue_struct *fence_signal_wq;

I hate to be nitpicky but this name / kernel doc isn't great.

How about:

/** @timeout_wq: schedules TLB invalidation fence timeouts */
struct workqueue_struct *timeout_wq;

Functionality everything in this patch looks correct.

Matt

>  };
>  
>  /**
> -- 
> 2.52.0
> 
