Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AE2A71F0F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 20:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E7610E76F;
	Wed, 26 Mar 2025 19:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NlK6rPjj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D8010E08D;
 Wed, 26 Mar 2025 19:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743017009; x=1774553009;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nNmb1LTcQOZ2ZhENk4o6cdnSOK0+OhXkkDNLft4pZlQ=;
 b=NlK6rPjjzuoCagpiiYKCJjUI/Kh54Nu5byEe3XnVSxs6G24Xj5Yzy16O
 zzHt8YtNsnmOjNAVLe++TaMjg9mPmH6YdXB+KC9rYFl3w/W8Xe0IZpfeA
 bioUpI89/f2ERlsH/BC0sn4kxcymDwDiYAlsx2kg9WIawsqatMXz1Gfr+
 APL9p0dDYatTZFhTiFP8etlmwXWHTHFT+yatRNNYSmzOE6AjUhOKi5sGt
 yZnTzTghWNZW9PavXRwiKjcKtrGtH6fuwdYoISo1WOrIzmGlUzah4uCup
 jN3UTwlZdOI7kbT0yE3oQWf2DeXJM465OkCZWTfMgx5GhQ5747Hx860JZ g==;
X-CSE-ConnectionGUID: CKuc7fWcQfyV3f86qzGQSA==
X-CSE-MsgGUID: lSP8pTsZQ3WMZVX8Q4lXJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="69690563"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="69690563"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 12:23:29 -0700
X-CSE-ConnectionGUID: ht41HiuUTnWntNx3JRu1eg==
X-CSE-MsgGUID: osnlNbebRk2jlV4/pHMWxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="125095218"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 12:23:28 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 26 Mar 2025 12:23:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 12:23:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 12:23:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q04b8FqzWczRWsVJaDqWPrwa/o6p34QcA7nMvoChjsp8PCdKlVb1q9nt8Sz4qIANWb5X2VT44qLeQJF2ay5Gzg3fhgTWkIO+VjqySZ4QmWlj8CsXZu3WlaGYnQrFX0rW2/fJDhjOx2rLAvOqwyfBUQBzjXa6vXLEqCmQg7eBYhg+VXD5AgCZ5YrvjTKJInZ8th85/rW2pyTOiluWlihqVhOaB5ABsJPo+NrQ0baQa2AJc3DtJq4JVSd8rzOHld58qjQSRYZ5G7P+kDVmYnatK90oAaOpkV8T5jPFYl4oX6ApT/M7xqrUXvpdFYSJxdCGtRm0oWyQgkyhqQzcJ8V7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lU6RnGoiUD27mmrtV9zA+Oe9e493R/Hqsou66q7Q3r8=;
 b=MKeODorj8DodK/L3kuiu2Dqh1/0Ph/xARRq7ympaasQ8QyLVC2G3LgElborNHXmNFmUGJiwygJJ5WLZhccKXT9OysV3xwBTP03a5YzBtibot9topM7DAvk83b1pjz4NBoYulLPZNa4KLY7xYsnZYOJqNrCJGQ+712kIhkIV7PE5PpZpKGMXdEpSPM9ZrIa415Jp2bhtusV9llINHQq/A0ST2nf5ul/sNPh6NPPHEalGjsEzvFluXpOK3b4qqhgSRIykOQx1e8dBsjNiqEi03k4UVV8ybLw9aYMaSGFd8mnbWhUB13C/G52qWEiQd7GG+VV3xXRK3idtLkD64dImn1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB7660.namprd11.prod.outlook.com (2603:10b6:510:26f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 19:23:07 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 19:23:06 +0000
Date: Wed, 26 Mar 2025 15:22:57 -0400
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
 <tursulin@ursulin.net>, Karthik Poosa <karthik.poosa@intel.com>, "Reuven
 Abliyev" <reuven.abliyev@intel.com>, Oren Weil <oren.jer.weil@intel.com>,
 <linux-mtd@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 00/12] mtd: add driver for Intel discrete graphics
Message-ID: <Z-RUEVrst6WWzDUa@intel.com>
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250326152623.3897204-1-alexander.usyskin@intel.com>
X-ClientProxiedBy: MW4PR04CA0333.namprd04.prod.outlook.com
 (2603:10b6:303:8a::8) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 57dfc2d4-b0bb-489e-0878-08dd6c9ba2e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TdR+uRZNrqB5UZSRzRZKcFK32z/1VOhZI3e17u9N8oWwscP+xmkYCFrZgyN8?=
 =?us-ascii?Q?twLS2AsL+doGP2JF7YZMrHifTe1Ry7camVxhDMhQq7d6mY32bZETCgYsfqbX?=
 =?us-ascii?Q?vSTG666D4J+4V9KlOfrkW0gCvyFP7fF3SYGbBZwjm8g9E+coFtGo7nYlDu8Z?=
 =?us-ascii?Q?7JMmWRcw89nQ2Cj8k16SBy3bVAGr9vfyJ5vYHqyCFPPJrYNPIUSTtEcPK9ty?=
 =?us-ascii?Q?XJXnrEgdM5kNVdET0zb58dwJ+Z9r/Hjz1Kun6Cs24UsBsgizKw1+oIYjjVkA?=
 =?us-ascii?Q?ckNY3/Ps19hP77w3n0tB9BnmZxQtyX5/w7t3DswzOz7eHRXFbjK6Z09qDdDb?=
 =?us-ascii?Q?Uhg83Uflqlr9q1RoolTGjMvtz5eanBf+9v/V03dxmPjExh1t3fouJoWLbvPm?=
 =?us-ascii?Q?/knNqwfW/PjAi6lc2JgdNxoZQ8L5H60V+f39A+5T/b7Kn68M3V0yvaKoWm6/?=
 =?us-ascii?Q?h2uen84lZk+bInM/a6nmcqd+gPXFkaG/NJY1Z4xoMtu9Eq9xq54KOAtz2GUn?=
 =?us-ascii?Q?dX8GfZWRslCQPLqZciaaj5JhZHKvGqT0WraBot4xKVM9/l1O4zI//ogKCL8/?=
 =?us-ascii?Q?9hUHYgfWidROHCD4OVb9aLgMiUP7q4wwlHJudyS/ICgAT7psQnUKUBL90xcy?=
 =?us-ascii?Q?I/Jle0SfyiOoIXCGOCIArna+anxl3uM3tLgNaS9jXZqUhkdoDuH9FERhkHr4?=
 =?us-ascii?Q?/PmHpbL2GI5x088HnqsEy8wfQYEds8oe1qbbhEUPb4fWAD+v7ENMKp27lCFI?=
 =?us-ascii?Q?98eVEmPN1+dCom5Y+TkSioMpGk0RGauXsfP5uzqmt3PUA94F/F/EqvUODa4M?=
 =?us-ascii?Q?yM5I/FOv5zRGMffx6KKo8gYOccGtfF3FkSKn17cyllCQDhFPzLB38zOGPUTR?=
 =?us-ascii?Q?s4CgIKmwKogXK//97VcSN3XgJaEUiPrhkw6xKhjFjcCXTddQ37vTS4S1KHY0?=
 =?us-ascii?Q?mFQ8KPoIMCk5JnjJHaafkrGYwA7pW/G0WWMi7XZrKFu24rkDNmrBNpTwyRlY?=
 =?us-ascii?Q?8HwVRCdbkDO0fI5O33scGxD9HxIB4ciY9WFSiGBl0kY2J0JcffmWq6eaZxy2?=
 =?us-ascii?Q?bhgeMFIlDFcbEQv2iNNzK4MpJPShwUZTeP4QmBCKEpvCfCMIjKZqosoABmz2?=
 =?us-ascii?Q?LYuoc5bVhIU4wMessl9aq9V6JewFaU4Z8QvfjOhiqhRRmGw7ZPynyim0K21I?=
 =?us-ascii?Q?5CZmdhJ7eR5y2Bh8V5pZWCgTM/kZUG1Qf+wtShYrzxzdE8r1Wbie+gL/M/QC?=
 =?us-ascii?Q?abAJWfDhwjxGAreMyIhvORknUrwgKAX/taBZNtLwA/FV9zRRoEdK7c3wYAlW?=
 =?us-ascii?Q?399iA3KihbEr1vc92zqnLKjKHF+5WmuAOOfNNMx1gARt7Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zzmvk8jA4knJYSIGwn3+oRzBB98x6tbYVCrFro2mI/gcXbBahZPJIKBIm7Hk?=
 =?us-ascii?Q?s1uzA0PIVJQXuQ0lpRiL7Ay6PsNxMwm5jo+bDaQfH3SkF4DMawBhfKeQIHTM?=
 =?us-ascii?Q?/ONob8ZCLviUEqNGA+Bp0PuMiTy6Ws2OMiEHVgp+aNn+trqHHIDsxOIuFz0S?=
 =?us-ascii?Q?NpHFnAbavAvM5yEPOIB5rxy4/Pjgur4ZriN1XBh7ZqgdBlWq3ctbpc01SCBg?=
 =?us-ascii?Q?7k7Nrq/MKQ5cEJlGT4dzdBm6HxdYkZH2O+H7UucDkoXpE6x1+H8BqJwEDj/9?=
 =?us-ascii?Q?R8Gigel41ggGsQtIP9B98v2OR2NsMYlCqTA0AWQz8+ccJWKwCNyNvLfaI0BP?=
 =?us-ascii?Q?AHIeODv43PoVgmsbguvAL44TKvBKjPvR1Bp9l0Ai8iUI0K1ilJ9cWLuRJHH7?=
 =?us-ascii?Q?mfTbDG1DmmaAXjyuaJPWxR8Lptxk7NHlfIhn5RaCE/NMs1Zb1EycHWRaQ3kr?=
 =?us-ascii?Q?za2VZUePSpT1UID3Vum/RoTMu8jGqV+q4cyYFhdbU2lv4j8pBv95z4Ficu95?=
 =?us-ascii?Q?lEu3BE0+uPYtkkgCAeDS0t9a9I1+HUSu8ZUNs2e2qJfU4u5KIHsXXs0O5+3k?=
 =?us-ascii?Q?Ye0QWmCp5SYyChgpn8YjCQqD+5JoEtaOSxa03KIftbG0JCCBJV97tsoJetFj?=
 =?us-ascii?Q?PJtWdbGfX4/oi6AyO8Nae9n0NOhEN2Wb9v4evFxrhldUjjX9e1W4yxb+A1Cd?=
 =?us-ascii?Q?652evElyZf7fWpV1CQBZefuPGfO5wNMBykBLjxKVZWuDjiIzGdbmFXTwDnhu?=
 =?us-ascii?Q?rTsdpXTG2jATMkOIp2XB4JpbwwnTY8M4DPdJAH1laHLLOhbM8GTqdE+3X67h?=
 =?us-ascii?Q?GoWxhaG333U3u/OYq0JBfXX8tQJmw9nbqcMOrQGl9kDbMAE5zNVp9Ui4rTKn?=
 =?us-ascii?Q?/1SHlj70AjbxpLWN2twrIdZYStxRrqkN/wsM68ODuqK3NDnNTLmVQLl6XPx5?=
 =?us-ascii?Q?IJSG8KnwsQbWjvmi4x6Jp+BnO8ICOn+2i3G3uPW2aXS4U4bT9+tBrLOMwYCH?=
 =?us-ascii?Q?MAMQQbLLac8Bp2appsc0TfAkSFuJM0vEOCWA17+/izzDnbt4jZIBPuM/qOMb?=
 =?us-ascii?Q?iAjes+Y2qhwLM9msd/F/pVZ4iPJUeCOZ8GMoSAoxoA9jW4QrE2wJ3CLmNm5X?=
 =?us-ascii?Q?vaaZXoQAyDqTYeL67bPZ1yoqHwiYhm+0Rbt1k+AKU8dlePuitnNKokgumQri?=
 =?us-ascii?Q?LmabBDNf4QTPo2egmGLJJfkrHLVmpDfF6tWd1r8V1o948Cjda7cKdbJyuSMJ?=
 =?us-ascii?Q?f3YLqDSpo7Ja1kCXfAKdY2Pwnk5Csg1CsWe8vUr0IFMTzvNC1Ya+71swRbQf?=
 =?us-ascii?Q?KvmeHylvYWm3N/uf2I8eGNzLSgcxYB1kAvOwNNqBknn3TrzCdkW7rDOzbQ84?=
 =?us-ascii?Q?rE8+7Kv9pdhtJ8F/0i5ZIgtAEV54eOeerocqvWWuGXrStiGCNYcKj4OIl46a?=
 =?us-ascii?Q?kSS8qMHT7VAj+HUAW+ao6O5ObfJShDBgOLr9Y4aT4y9rQXVKUhZ8AQSDF7NN?=
 =?us-ascii?Q?yOCaw4LCe00Y+vNGb9FZet91MDUmlQqk2IFqPWQVdysRTTQmsNKDDOtwcrO+?=
 =?us-ascii?Q?lTxQNsT4wYFCF6qqzwCVEhrNP98easb4spk1NNuH0a9ukCXJsuT2ScoxVEDz?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57dfc2d4-b0bb-489e-0878-08dd6c9ba2e3
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 19:23:06.8802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: geratsmdGNuQ9KjblhlLoEQnD4t1hH4RSLtAom0z8u51LTI7M5moaurW6k9bTnkZhiOI49AhBL3SW5qObh1rBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7660
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

On Wed, Mar 26, 2025 at 05:26:11PM +0200, Alexander Usyskin wrote:
> Add driver for access to Intel discrete graphics card
> internal NVM device.
> Expose device on auxiliary bus by i915 and Xe drivers and
> provide mtd driver to register this device with MTD framework.
> 
> This is a rewrite of "drm/i915/spi: spi access for discrete graphics"
> and "spi: add driver for Intel discrete graphics"
> series with connection to the Xe driver and splitting
> the spi driver part to separate module in mtd subsystem.
> 
> This series intended to be pushed through drm-xe-next.
> 
> V2: Replace dev_* prints with drm_* prints in drm (xe and i915) patches.
>     Enable NVM device on Battlemage HW (xe driver patch)
>     Fix overwrite register address (xe driver patch)
>     Add Rodrigo's r-b
> 
> V3: Use devm_pm_runtime_enable to simplify flow.
>     Drop print in i915 unload that was accidentally set as error.
>     Drop HAS_GSC_NVM macro in line with latest Xe changes.
>     Add more Rodrigo's r-b and Miquel's ack.
> 
> V4: Add patch that always creates mtd master device
>     and adjust mtd-intel-dg power management to use this device.
> 
> V5: Fix master device creation to accomodate for devices without
>     partitions (create partitoned master in this case)
>     Rebase over latest drm-xe-next
>     Add ack's
> V6: Fix master device release (use rigth idr in release)
>     Rebase over latest drm-xe-next
>     Grammar and style fixes
> 
> V7: Add patch with non-posted erase support (fix hang on BMG)
>     Rebase over latest drm-xe-next

There are 2 things that I should had noticed earlier and mentioned to you.
I'm sorry for forgetting that.

1. Rebase on drm-tip branch of this repo: https://gitlab.freedesktop.org/drm/tip
We merge to drm-xe-next, but development and CI happens on drm-tip.

2. Please also send to intel-xe@lists.freedesktop.org Xe CI only runs on that
mailing list. intel-gfx is for i915.

No need to rebase or resend right now. Let's wait for a few reviews,
then we rebase and resend.

Thanks,
Rodrigo.

> 
> Abliyev, Reuven (1):
>   drm/xe/nvm: add support for non-posted erase
> 
> Alexander Usyskin (11):
>   mtd: core: always create master device
>   mtd: add driver for intel graphics non-volatile memory device
>   mtd: intel-dg: implement region enumeration
>   mtd: intel-dg: implement access functions
>   mtd: intel-dg: register with mtd
>   mtd: intel-dg: align 64bit read and write
>   mtd: intel-dg: wake card on operations
>   drm/i915/nvm: add nvm device for discrete graphics
>   drm/i915/nvm: add support for access mode
>   drm/xe/nvm: add on-die non-volatile memory device
>   drm/xe/nvm: add support for access mode
> 
>  MAINTAINERS                           |   7 +
>  drivers/gpu/drm/i915/Makefile         |   4 +
>  drivers/gpu/drm/i915/i915_driver.c    |   6 +
>  drivers/gpu/drm/i915/i915_drv.h       |   3 +
>  drivers/gpu/drm/i915/i915_reg.h       |   1 +
>  drivers/gpu/drm/i915/intel_nvm.c      | 115 ++++
>  drivers/gpu/drm/i915/intel_nvm.h      |  15 +
>  drivers/gpu/drm/xe/Makefile           |   1 +
>  drivers/gpu/drm/xe/regs/xe_gsc_regs.h |   4 +
>  drivers/gpu/drm/xe/xe_device.c        |   5 +
>  drivers/gpu/drm/xe/xe_device_types.h  |   6 +
>  drivers/gpu/drm/xe/xe_heci_gsc.c      |   5 +-
>  drivers/gpu/drm/xe/xe_nvm.c           | 161 +++++
>  drivers/gpu/drm/xe/xe_nvm.h           |  15 +
>  drivers/gpu/drm/xe/xe_pci.c           |   6 +
>  drivers/mtd/devices/Kconfig           |  11 +
>  drivers/mtd/devices/Makefile          |   1 +
>  drivers/mtd/devices/mtd_intel_dg.c    | 884 ++++++++++++++++++++++++++
>  drivers/mtd/mtdcore.c                 | 141 ++--
>  drivers/mtd/mtdcore.h                 |   2 +-
>  drivers/mtd/mtdpart.c                 |  17 +-
>  include/linux/intel_dg_nvm_aux.h      |  29 +
>  22 files changed, 1385 insertions(+), 54 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/intel_nvm.c
>  create mode 100644 drivers/gpu/drm/i915/intel_nvm.h
>  create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_nvm.h
>  create mode 100644 drivers/mtd/devices/mtd_intel_dg.c
>  create mode 100644 include/linux/intel_dg_nvm_aux.h
> 
> -- 
> 2.43.0
> 
