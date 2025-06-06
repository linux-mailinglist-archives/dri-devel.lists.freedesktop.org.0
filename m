Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B35AD0630
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 17:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C644A10EAED;
	Fri,  6 Jun 2025 15:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFq36mpQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D3410EAE1;
 Fri,  6 Jun 2025 15:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749225201; x=1780761201;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=4yIrZSg0mU5sbebKO2IuUQtck9saxD2awpFoIc7ZCrE=;
 b=nFq36mpQ4abJkMIb7Xp0l3C05mXzkyK5em8L1LnWSD8aeL6RcAsE9ksR
 Z1nhBhavB5nsRZDTVAXFbWSUUWJvGBlQ41mC3xZakLOktycTfQHWMyFxU
 fgxRHqqyWXE0bwWN4LbwZ9zaNufTx1FpCg1C03Bcr8NZtZYJPf4xsotV0
 vmnqHynDibJeKbkDldk2kPBsIqpY/6zuS6ER7P2prHMqc7XvWzLBISugA
 HeiNW6kO10+cyEBeVx8zRkjoGgY8BjZe5dfmr69BtZAmFIVk6SamI2egM
 oZI7BtdKZ+c9GAYcJq7EsrKo5ngu4uguKV3uqPJlVuikVynN6p6ATnbnx Q==;
X-CSE-ConnectionGUID: CIDokeRaQuewNo4/8Hp5rg==
X-CSE-MsgGUID: zCeTmfLbRiGWS48WoK8Upg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51457013"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51457013"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:53:18 -0700
X-CSE-ConnectionGUID: /UE0ZQcsR6eN7GswaZ0U6g==
X-CSE-MsgGUID: qVSP9gMpSSG9MJ6neZ18sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="169047725"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:53:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 08:53:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 08:53:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.59) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 08:53:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhMpBSJ/G1lqxpwrMaZk8AMLqvGIKNRTz5btqKTLZDqj7JgXWQat8QPifIQbfZlgc1bqjFNiIyS4ZXsqgjNrT2tgcdCp1/2xzSRJe/IAQlIh0ot81RKqIydlaiy4J0xvwHoCw7OIg1btmCGFb89JCmvq9udaJ90mMgxBoE/MMNJPmgGsMufsBRm0hguyoGJBd6qeP/Ot29THBarWLwkU12/5jlL9jPtSJAfRmyAI24mKIjdSUL4m5Ds9ocLhm4p2HkC0ndT3GHMFcoOMKxp0dym7IJw4dSi6qbCwBHlcbJ+ZCvzjtnAQ5H5tdQhQs92vlIeqt9WamSvBxvXazOFzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rmo+WJjKXAJPI9tn1AJHxIcKD//eVZNnsRvta0YZg9Y=;
 b=cwUBzb6Upa2Q4afpjOTkiYPWdEVIAFoaMnJdietNprTDLLjOUW99N5OdRckVDo1Lr9cyOMOt7iLhKfkm2obsMpX4cvBiZP0gobbBBoKI0n9mDWT4XUVZGLb5DVgchlIOcH0iU23S1AgIu6ytz5OR/q5V3i4dRR8topdHuFqpJj+UxDFWCM1YED2rF776a+mI7jQYNKgrQdFO5daGXNQHvxy9pm76QpRojJvAjE88Dy3MvTCmTe5u5zukqqnKJqsXr7x3fpOzpjJBfvcJIsN9FtkrS64qLz1h43SRq6K1s9siEdO8FLV4up4+ybn0rym+geRvIqBrCFetokwbppzAVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7578.namprd11.prod.outlook.com (2603:10b6:8:141::16)
 by IA1PR11MB8221.namprd11.prod.outlook.com (2603:10b6:208:451::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 15:52:35 +0000
Received: from DS0PR11MB7578.namprd11.prod.outlook.com
 ([fe80::ba7:2682:35a5:945c]) by DS0PR11MB7578.namprd11.prod.outlook.com
 ([fe80::ba7:2682:35a5:945c%4]) with mapi id 15.20.8769.037; Fri, 6 Jun 2025
 15:52:35 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>, "Wysocki, Rafael J"
 <rafael.j.wysocki@intel.com>, "Yang, Simon1" <simon1.yang@intel.com>, "Doug
 Anderson" <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH 4/4] drm/i915/panel: sync panel prepared state at register
Thread-Topic: [PATCH 4/4] drm/i915/panel: sync panel prepared state at register
Thread-Index: AQHb1sJUiQgzYOH3aEy6oORDGPWNQ7P2SA0A
Date: Fri, 6 Jun 2025 15:52:35 +0000
Message-ID: <DS0PR11MB7578F08D1B5AB2E57D879C11A36EA@DS0PR11MB7578.namprd11.prod.outlook.com>
References: <cover.1749199013.git.jani.nikula@intel.com>
 <a33e4fe5e9970aed9c4aef8c426c00a189149c32.1749199013.git.jani.nikula@intel.com>
In-Reply-To: <a33e4fe5e9970aed9c4aef8c426c00a189149c32.1749199013.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7578:EE_|IA1PR11MB8221:EE_
x-ms-office365-filtering-correlation-id: 6991fc66-d637-4d7a-62cd-08dda5122810
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?kP5YW4uy/KeCxO2PHOKnASCL/SLYNscjmax6+Hnusy2p9kgCbc8zm1zhF9ky?=
 =?us-ascii?Q?VB8iFVGGxOKxz8SGvFG87CuDuHNRFEcJOQgrSSPH76dx1pBZ7lcUatykl1j7?=
 =?us-ascii?Q?hYSChuqOaGCuTT8Dt1bsAshi/BvqFUiOObOOBh0hCeEVcvNInlZroKHPnXb4?=
 =?us-ascii?Q?VIpq25nrGX7tJfW6kmjXtKdU8+Avf75Zfp37nHyXMhQI0TiB3tJo1hfM6uQ5?=
 =?us-ascii?Q?InimvMqvAfwzpCxmBXR8qDoEC9/qvhaXTyP4lFA9wN4tlqY2y8B7EYF0+Wws?=
 =?us-ascii?Q?BXBr06/YBrMrtsHTCP/S5O20TKP04POxIJCFcKj4GqV4tDf3SnkDpwbgYdOg?=
 =?us-ascii?Q?WO1IYkmHoVvSNkEkCjptUdW7w1N9+OvazgTisicgahw8EQcV0fbzJdI2DUdV?=
 =?us-ascii?Q?Aupw0al8YziSDNjYL18RpD7Rd4IiHib3tOU6lbwT0kF3ZKg2edrGKh+XS2SF?=
 =?us-ascii?Q?YUyNxC+dTzTztLYCW6Jjj762ydudmjx6llFAHE3dyyNl9+FxMbISu3CadpQc?=
 =?us-ascii?Q?sebh9/qlHluyfWckXpcbDKu9VWa2lg4AdPTwBIaC3NB9FjcOoALJOMI/85zg?=
 =?us-ascii?Q?WZZ6DWgikZHF0vml2iHrIjw4p6bKAnd85EPjd9MAMw1XxHVMZeV8Wndzaecf?=
 =?us-ascii?Q?B+azK/TNudBZ4FhSW3tsai7MU6mQ2QmJfJmkT706TvcX7v91hGjzGpItvD+0?=
 =?us-ascii?Q?XytyDjvAvPoYKRwUoSeBlDyo/ztwkc15eBnJfAbyNIb27P3MsXpHFZA2NmLY?=
 =?us-ascii?Q?BUyGYbMdWlsUZyapsbfbxmwnIH0G/DDrhQeOxvQRGYW9vJVVkQ5MY73EsRJp?=
 =?us-ascii?Q?t5x3+uj5GzV8HNJIBlJR+4TAjCQVjB3viRnNFOTWi/Kx+OLA8Iv2wCW5JxMK?=
 =?us-ascii?Q?oFsr7LNjZdJ+xh7Ks+RD6kxLLhUvZxOkS5tyEqywXMJmJXV5SvphRDDC+vMQ?=
 =?us-ascii?Q?eG+Z5Af9vgdyhcJiYYOzGC+klq9tRrSEJ3JIE2/zsBMJzxAaFAN7/yLuZ2CX?=
 =?us-ascii?Q?ci7PpjYOtCGkYRb8EDSYY7TqKhhy2uNI0BSl3Opy8WgZa4vwnwN0Vg+vwxef?=
 =?us-ascii?Q?SjwaXacxCU6I+7jQZWz2GHhEmkb+GakzpQxdlnmy3U9eB74e6P6FHgFIphQd?=
 =?us-ascii?Q?BNUIsrx9WtlxhCY5HWyQcWtbZ6uTerHQXVDj5UgcgioI3VwZLSk1qKp4n8Ee?=
 =?us-ascii?Q?zKM0mec4dgJKQVfki+TPBPOgWPHMDTSHXlVHbEIO7ppdquehv4lHOSnjiETG?=
 =?us-ascii?Q?i5RDwAQbbtmMGQr2vjL9++FoQfqCTJz7g47w2Aj/zpwsK0790Id9aSYmPLFY?=
 =?us-ascii?Q?MUjDCrnJAVzKlaatWdjYXqWeo+0AzKxpx5Z7wxd7B43BCGyGb94T1BEKeu83?=
 =?us-ascii?Q?dM7HW1p8n0+7v+7g5oNGkvFhjbs4e144gHy2lnWrU2ZtPj9BjZ1ZQa7I9YgD?=
 =?us-ascii?Q?uuxXFiwfSh/SW3CzeuNQZF4tfHYXENeVTRm/zrdr4wt4+HBk6PsiQQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7578.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Tb41VxXvU4cZ68G+hi3lawjQiqyc3TbCOpp3PuqQDwAEuM3ZHhFmxi71fNrW?=
 =?us-ascii?Q?cz8FGw+tKX4UJnyOwR0yhKqgqSTi28c2fgn06B1Oixip/Je/aBI1px9vdbSP?=
 =?us-ascii?Q?a8kL/G2+wuB8xuobgbewUG91Vo3PWg3/X8l0aVAZpzqyDc6XjIJO0L5QRQ+q?=
 =?us-ascii?Q?FRaXL3zR+ohyY9SUSzLM7XC/6U9CIew+jRN8FgBva59qIyyb5sRCCkYQXwR0?=
 =?us-ascii?Q?PgBjXKDVQgfWOOYUgRlEcJBkxNL+hObwQWbWPK4kSSRjxmynw+55+9pdUQ/n?=
 =?us-ascii?Q?/4/oNZ1hSTzNTo8AB6TkxLhmq7EuNVFq+Nh+kjIV819hDcPH45wrHkaM+MAm?=
 =?us-ascii?Q?U/bovWNfpt74uOPHHcxVtnEOGGQkIurDfrzzD2Cs3hmc14cKdJ51UAYn8xY5?=
 =?us-ascii?Q?7Z86HajQJpIiH8e63nHzrYstWkpy8GHITLrNViU+fajRpmFH//cbDkNnIjys?=
 =?us-ascii?Q?ZU/nN7OLkrvHpU8bJGTmnj1iRCT+SqjVwouFszCCBgu5KvZ53pireS5z8f4n?=
 =?us-ascii?Q?h6xMPnue7zUuftbzjPvWT/Ae8yg/+7g+ZDpRwtljAHhQlGPCKBqRYrIjGEbe?=
 =?us-ascii?Q?a0nD2Mqj9WOZApBrQNKFZDpZawJylFrAF/irTPYBohZ7yTvveu0L+NZKhpw2?=
 =?us-ascii?Q?2rZe0Cm7RkeUKtAndxwpvcqqN7/hmroHj/ahkXoXmQg0R6ARwNGhRoaTuKh3?=
 =?us-ascii?Q?v1G6m0Gwpeu9SQr9YzorhNUCb1hCgY5n/upaGApgr4Fs90HDGYt/NSr4vzEu?=
 =?us-ascii?Q?GxdjCjeijqHItUZgNzJ15EX8TuxdlM0cR72ZhJK3RVuOuavihxu41lHL+rdf?=
 =?us-ascii?Q?FLnlGMYWTQQnBDdDsGCD6UyRft5AouX71O8F3nKDWceuFsJ3afrIVNbZSbdh?=
 =?us-ascii?Q?SVRo8UHOeUb3prhAUhTTYCY/KoTb4jQ1QyE7AbMt/VAIvc4Zquum95iPBRCt?=
 =?us-ascii?Q?QwahzudYCOzAPxuOELWox2ep4NcVGCQwaElRM2Tyhw3hQP/UFhW2ngb14+Bz?=
 =?us-ascii?Q?TNPgbj5NMo0mxNRDV1r6FNMAwkG6do8yErUzqYu0Y2iUP/ixDSi49i0CfbIu?=
 =?us-ascii?Q?eMvTW/260h+A+1JhOQql7Htxtng9ta+coKczfPja6ujvFqI0l4qERI6+beRg?=
 =?us-ascii?Q?fZma6JSNUbbLPzearVxOVdzj06h2nyVg+ySJ7xp0DNnyrs8mW08fLHIEoMTW?=
 =?us-ascii?Q?c4sR4o1ctgGp8vg8NVxvD9bP24uuvZ15reyfsrLx859jO8+I9N21+18BGvRK?=
 =?us-ascii?Q?MzTB3Rle0VvGaiBuw+Oejbjs0u1bk4Y8iaLRg6ttHfBr6EaYw9+fhgoTQu/D?=
 =?us-ascii?Q?4IBPFZ4C1tUWF4IkRsSjIYhjZldTM4wm+TR0L/BHTHsKUsC5oM1zYQG7yPBL?=
 =?us-ascii?Q?lU199zt6b98T9vAvvYXtn/C1R5ZHkoPTS60x1Z+u1BHgFcOgz4BSUXoRXbpQ?=
 =?us-ascii?Q?bKfTde5p6s17ywHQxrR3sc2/gTPTsVfIQvzqSXiwwCwOn+EJ11FKvAXi4Fam?=
 =?us-ascii?Q?bF6BFynGZxThnqcSfJ8vIy4Rvso0EhUZy04MOozB325j7LxSTU6+UaIh+4mO?=
 =?us-ascii?Q?Py+FSsCEuBsd1pR2SrkjrhtySzL5hKGJl4n5kVEv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7578.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6991fc66-d637-4d7a-62cd-08dda5122810
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 15:52:35.6613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjGikx6tlWoIB/TKQMNVZd728RAH1KMZc0PF1bxv7NIvHwB1wn3GbSr8fmau3l9BkwredCbBSsP/JxKmqPB70w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8221
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
Reply-To: "a33e4fe5e9970aed9c4aef8c426c00a189149c32.1749199013.git.jani.nikula@intel.com"
 <a33e4fe5e9970aed9c4aef8c426c00a189149c32.1749199013.git.jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On June 6, 2025, 9:05, Jani Nikula <jani.nikula@intel.com> wrote:
>If the panel is enabled at probe, and we take over the hardware state, the=
 drm_panel prepared state will be out of sync. We'll need to notify drm_pan=
el framework about the state at probe, so it can in turn notify the panel f=
ollowers.
>
>Cc: Lee Shawn C <shawn.c.lee@intel.com>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>

This patch series was tested on my local device. And panel follower works w=
ell on it.

Tested-by: Lee Shawn C <shawn.c.lee@intel.com>

>---
> drivers/gpu/drm/i915/display/intel_panel.c | 41 ++++++++++++++++++++++
> 1 file changed, 41 insertions(+)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/=
i915/display/intel_panel.c
>index b1d549e6cf53..f956919dc648 100644
>--- a/drivers/gpu/drm/i915/display/intel_panel.c
>+++ b/drivers/gpu/drm/i915/display/intel_panel.c
>@@ -463,6 +463,45 @@ void intel_panel_fini(struct intel_connector *connect=
or)
> 	}
> }
>=20
>+/*
>+ * If the panel was already enabled at probe, and we took over the=20
>+state, the
>+ * panel prepared state is out of sync, and the panel followers won't=20
>+be
>+ * notified. We need to call drm_panel_prepare() on enabled panels.
>+ *
>+ * It would be natural to handle this e.g. in the connector=20
>+->sync_state hook at
>+ * intel_modeset_readout_hw_state(), but that's unfortunately too=20
>+early. We
>+ * don't have drm_connector::kdev at that time. For now, figure out the=20
>+state at
>+ * ->late_register, and sync there.
>+ */
>+static void intel_panel_sync_state(struct intel_connector *connector) {
>+	struct intel_display *display =3D to_intel_display(connector);
>+	struct drm_connector_state *conn_state;
>+	struct intel_crtc *crtc;
>+	int ret;
>+
>+	ret =3D drm_modeset_lock(&display->drm->mode_config.connection_mutex, NU=
LL);
>+	if (ret)
>+		return;
>+
>+	conn_state =3D connector->base.state;
>+
>+	crtc =3D to_intel_crtc(conn_state->crtc);
>+	if (crtc) {
>+		struct intel_crtc_state *crtc_state;
>+
>+		crtc_state =3D to_intel_crtc_state(crtc->base.state);
>+
>+		if (crtc_state->hw.active) {
>+			drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] Panel prepare\n",
>+				    connector->base.base.id, connector->base.name);
>+			intel_panel_prepare(crtc_state, conn_state);
>+		}
>+	}
>+
>+	drm_modeset_unlock(&display->drm->mode_config.connection_mutex);
>+}
>+
> const struct drm_panel_funcs dummy_panel_funcs =3D {  };
>=20
>@@ -513,6 +552,8 @@ int intel_panel_register(struct intel_connector *conne=
ctor)
> 		drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] Registered panel device '%=
s', has fwnode: %s\n",
> 			    connector->base.base.id, connector->base.name,
> 			    dev_name(dev), str_yes_no(dev_fwnode(dev)));
>+
>+		intel_panel_sync_state(connector);
> 	}
>=20
> out:
>--
>2.39.5
>
>
