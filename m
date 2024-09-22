Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B4897E2C2
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 19:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C46A10E275;
	Sun, 22 Sep 2024 17:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KW6siudo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDF710E275
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 17:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727026187; x=1758562187;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dj3/7H56kJZxV25dc9Aj1gfR8l1YxfMT5PnbeUPFckc=;
 b=KW6siudocFo+FxxbuO22i3cvzo1SvTbix+Cm++O4/DkiPW6jh/sC18hc
 bcKJFVEyvq9SgE22oIQ5i3ONvQ/BZCYHBWPfUAUVJ/NZPBXll1pL/zDxa
 3uMNcFBIqsOCzXpb2xX0+CdtpY19jfssjYoDx/xx5fo8814YnLw2N+kHs
 JF46Pg+sVyqeJ9rvQWe3tH0CEHWIhRiaNq5yC+yt7DyQ/zXeSmw3VuJEA
 ykIbjG8gmjdPPJQRIfKw8M1kpkB1wxkfnmM2XVkyTtS4JQxCKM0hh0Obb
 08eQuMw6r/kHKkOgWBObCz0ybwk7QkjS5jTfinGbuu/V/9dKOSRrkjVnt A==;
X-CSE-ConnectionGUID: Wl9p1IweTkeiWVVp37aE7A==
X-CSE-MsgGUID: qhu1or4vT22TL1tdhl5oiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36635807"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; d="scan'208";a="36635807"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 10:29:46 -0700
X-CSE-ConnectionGUID: BOULCwrwTMyihQCSUpgi9Q==
X-CSE-MsgGUID: IHwDApWkT42RMri2JXA2Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; d="scan'208";a="94175249"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2024 10:29:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 22 Sep 2024 10:29:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 22 Sep 2024 10:29:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 22 Sep 2024 10:29:45 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 22 Sep 2024 10:29:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZQfM6nAIhlMbq6L5gjIuthzMwvHreIC0Idpg+wHR3v6QF9aDY0DC1L9vGsrjrh0q+r5MhSotsyQZLs6D0ekMZVnuI08BiSR4QpB1L72QV7uM42c2V5sl1SeBhcnNrOqqWOf3lD2Lh7K8ELwXoT3qOEdIPS/pkDi/4QRPOEPBSU+MASIuzrk69dQWzuCK9Q2Z26O+pCtw9HHus0kTYDMcSIQXyqHLOERopHnA950IwKPAaDhob0koAEay6zsc9Pg1GoLv950n8Xn8fYG8VMkZbWVGyJh84uFpYxV9LQk2y+z8B64SMVspocNMT7EyGv+EEXrnH5bH4AJIqBQ5mhKOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B73/BjGwh2D4/O+cxYhgWUNKXcLip1IJKZLscv/ZbKM=;
 b=apo/DBRVMHQEXvQWIlkIKcoT19QXMuhhRkpu+n/KLCWkIlAkNlyP8nnM0BkS+1MdqwHXhmTAVuodfRjQZxvBlWZ8G/BWsfTnY3ttJrnM3eWjBIxYJbscEIOtxYeTeqwhxu+tnR2t1dsETxPr/lXKGTXeFTGKlaLTuYTOFSGKVrUV5dPTZzEDuYS8D5yyzUP5rt45PzSY2e0hBGYZOTbYxtqdLHsdOj1Awypcliuph7J6qT2/M+Ro/44YOV4q/+vyqc+c6fewlZ1hUhv6n40pQLJudUc8RNAyJRDGajuGDjl/KoTG3/tW/7s1gUHG1YvwoWQDj2yDg7R8INw1s12MJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS0PR11MB7831.namprd11.prod.outlook.com (2603:10b6:8:de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Sun, 22 Sep
 2024 17:29:38 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%4]) with mapi id 15.20.7982.022; Sun, 22 Sep 2024
 17:29:36 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Philipp Stanner <pstanner@redhat.com>
Subject: RE: [PATCH v3] drm/scheduler: Improve documentation
Thread-Topic: [PATCH v3] drm/scheduler: Improve documentation
Thread-Index: AQHbCRUeFwUYNlB3oUqq15wcSo22Y7JkFt8w
Date: Sun, 22 Sep 2024 17:29:36 +0000
Message-ID: <DM4PR11MB54568532CCCCE21AA2833334EA6E2@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20240917144732.2758572-1-shuicheng.lin@intel.com>
In-Reply-To: <20240917144732.2758572-1-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS0PR11MB7831:EE_
x-ms-office365-filtering-correlation-id: 8595179b-43aa-49d8-2bda-08dcdb2c2160
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?oruvQEUhJF4QInH1+JUJ8A9vJLDck0ZuC2Z32AOpKDsoZ9Ko2Nx0wtsPT/Iv?=
 =?us-ascii?Q?mgI3x2RjwiRhCU3lya7D9ceH6MNioc6ThhCCdAx+APZmvFaMKcWJyetHZc4H?=
 =?us-ascii?Q?OpuSLHDbPOUG4GVhPegT31akMlPCKmeDOGreFNNoHuwTyi1D0BVVw+Jsehc4?=
 =?us-ascii?Q?xPjlkPAYQ+AjVqDWxwP0eQwq4H0JAaP9NLOsFHwi4VfMuH2qlDB/NcgaGmO0?=
 =?us-ascii?Q?PzNPLBhMPcG+Jq4G01L4dqOZaHiciKHgGY3SGdZINyP1O2KyGam9Cr93G5lL?=
 =?us-ascii?Q?3Ztn2T1pHyZMCURkNPkxXDwV67VVWt+Jk0oVwN3uA/hcYXKWBhAP3IuUk5G7?=
 =?us-ascii?Q?5Mv60pQtvUaWvV5Ibi8sMdIwBfV6flOYRl1YvHKWI325RUjbjT/6Uv1MBzAX?=
 =?us-ascii?Q?eXTTX8huy8CCCT5RCuxDMJbFDXwYISX3P7KnZorB65a1iXEZHMr2hnvuIEkS?=
 =?us-ascii?Q?G5tMaesziFTZmGLcOojBKvytclS0hwRomz990EbFkMKDHP3JUlS0aWy06uTO?=
 =?us-ascii?Q?nqj7JygXKe9RIgw9WMol83m+De2ACJETP6HARbVh60UYsNJmZ/cA4PgsY3XY?=
 =?us-ascii?Q?U5kdW7wwYpLoxt0rMabHAHA/WSFD9LjlWMSBADXUrtSP9iGcduzofLqSpNCk?=
 =?us-ascii?Q?jht8eK+BcFBXZZ1WRulyNTaRvltOUW6oNWWgq2oc4MgkNU90mhAj+xoqEEfF?=
 =?us-ascii?Q?zd0Yk3wwaocXPJjGEeqWswYnnVzZZKylddpR6rhLCHF+v1vM3uq4/mMca/Sn?=
 =?us-ascii?Q?iTkMAQKwSBYivp4S27MVaENjvAT96uvZxD560rGtoFmx4nAFxcF/x6WSZJap?=
 =?us-ascii?Q?TRrjb9Imq8dxnEWlKTXFSF/cW7X2frj1ke0mrKy4xV6rLNJo7WstY/7JTX4c?=
 =?us-ascii?Q?QfOdZxy599r4kGU4nLquiQNtjcW4c83+82M1aGTChsq/uBdj7xqTJma7ZpjM?=
 =?us-ascii?Q?UwuW5Ay8KTHBBRtklZFFqm3fIT80x0e/5TCwoACV86jxechs9LWyc/sTj47O?=
 =?us-ascii?Q?uHJm3wB5yX74Tsw7OYIWBU8tfjhuZRrw1Aw3e0TKpzsTR0iTb8L/LwlmNZYP?=
 =?us-ascii?Q?6hFdEZxv+wszQtrt4kOAB6ZU9P8D2eQ4WCsh+5jOGuMp0N8o95ULb5lsPeU1?=
 =?us-ascii?Q?veHY2IzEkfF8Xf+0miyBKwdvSqCybofbJIq5sV8Ev5FKbfaem18i2B41xkn5?=
 =?us-ascii?Q?NffVA/pbi7t1U0q0Ii2O9Lwi/0g8U5f0ni6Efnosf55o9OjqlBfdcwSgEr4Y?=
 =?us-ascii?Q?gvJ83tHpPGMKc3kO4jiWpuzc0UPr5CzC83OeIp+aSDhfmkrkAIERYolf849g?=
 =?us-ascii?Q?6JtaJqHkURvJ6YpQMkGl3LNIpsIlpsJg26YVGzO/GBLDkJ1ray28MRONupPY?=
 =?us-ascii?Q?jqTVC4g9K7UVSWdftQsiMOvv48Gi81CDjpRG78X6/1t0JnvrPA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xOa1iX+A/MJjXAu50OZqCDgJkiEfqXK4PXWF8vxFkuariJNqdgmLclK88lkc?=
 =?us-ascii?Q?VCVGKHjiVuO4c8Ml+LlS3Y4dOy7q8bYlPGuKcVdmaLjXYGlhJ2Qx9avHJqPc?=
 =?us-ascii?Q?1OZfgS20hP9z/gCTXYFTi8h+S38Ix411jgC12vHTGEEgv1j44XtdleZxs+Fi?=
 =?us-ascii?Q?XX+bDhBuzi8iHuO3Xhsdb5xRalbhxbJz7l7zP7AQe8324X3UUwFzwjV1azGz?=
 =?us-ascii?Q?MeYRK/2ceTXf5akEhdgA64AZTUObeiFyg/V1rXpYOCHAbER/3hUrfiGIhrwZ?=
 =?us-ascii?Q?8MItsKRdTrhw+pflueYtp4xJVGQh+l6l1SGdRDmVs0ll32HBcvL0RwhU2zfz?=
 =?us-ascii?Q?iqGHNzFOTDv41l/AKuQrnkNa7r9LKBntthW4V5m+MQ0dT9sCfZXvV3JgYHwy?=
 =?us-ascii?Q?w3AR2enEoIvRUQhGo/O/A3B/lRsKv7aYl5L+D+dK6DFTjkxXIP2o1zw/hQKm?=
 =?us-ascii?Q?20O/K+WcxclsoCy1q2bOP1zL5fGHmSAN0doXkSCo8ZEYnzYtYor0YKh8LAEY?=
 =?us-ascii?Q?7ytdggPuvofBjHxrP6Pf94zg8CW/9w+1lbxJsaavLgDIkB56ro+9QC6Ath5u?=
 =?us-ascii?Q?e7C6gqAFlPLHJzkSEu+EnqEVMwBh29QZnMkCfv3MdgHG4wJWD0hjNobeu3hY?=
 =?us-ascii?Q?AHDlErBZcLd2vTTLl8rbNwkuExPOfUgwUyO7AS9OxIn8ewNguFCQFV+dgP/l?=
 =?us-ascii?Q?YQOu2ebWQVnSyVTInT2fcMPGEZEtmJlzAc05+chf9OBw00xOTWm21UlaonBG?=
 =?us-ascii?Q?ymK9rc/lFVN2nQ2U9wkHin9JubL2lwmy+D4YQ/p4nVkzf+QFxnyf9pncYQxm?=
 =?us-ascii?Q?l/EDijNOg84jL8CrI9w+4VeW1OGqQMZE5LCL0N21i5cVbmY6PlWkJgSmJYw+?=
 =?us-ascii?Q?w0umIXoUVhk6oD+18CYMdUo6GtnIQJw8Hv70fgUZLPyJGpWxGD10akZAFK37?=
 =?us-ascii?Q?FdwLwliRDo5VaUUEeVlaxYtqXGwOf7+gCAoXapBZtocz5S8NffEOOioB4zWy?=
 =?us-ascii?Q?QVfc74oOqcHozQV3tsodNusiOlLyTmDfr8wY4ULza6UlLGKnfnd/cp7zNlIu?=
 =?us-ascii?Q?WUz3FhC0wf0CGFATid0gftx3UNXX3LdD+8dsGLpnHvWyqdF44LIG1invVG4B?=
 =?us-ascii?Q?9tItF6vkQm/gQMA2KNc1SRnjSxyjURBOVv6O21WDROItbTAbkVUpXNm7cgB7?=
 =?us-ascii?Q?GXZRT4Dy76zumqkXxzhsWRl/7869b+HY8EQsQaxE+sCFmKfPW/wYmnvr01mU?=
 =?us-ascii?Q?qblzGwhIgoC8+qNzeWiaEp6Ecjd3Uz1CKkfs7HhfJYw6TUlwV/uqXKpuDguf?=
 =?us-ascii?Q?wFYPnQKG5J8g68NmU7EFK3HzItkXU9zzB06outvKmHLZw7p1ozyNfrozRVld?=
 =?us-ascii?Q?/oObkTEFl3htOgEDL8SszI49Gs75uw0g0ByCsPk9cksY8TwrkHbrMH26wS8K?=
 =?us-ascii?Q?Nsvo4oufXeFTFEywI4IcJHxoV9XZo5Uf8IPz7IWo0v8p3r2XlvyG5PaPHAP0?=
 =?us-ascii?Q?njDWX+sS+upFdFUAt1sdngJgY2hWKuCqJQDr7IvJt9iB+aEhvf0UzG5DMbt8?=
 =?us-ascii?Q?R1rqLRh0GWtcrajGd69a+FKJEHRk3Wd7GSLtvtTM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8595179b-43aa-49d8-2bda-08dcdb2c2160
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2024 17:29:36.4211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WJUZrPmBzJrM7wSf/9WIuNEE8WKsYcDa2O1Jgwy+6j4rl/DsIYxKiwS2BQhoKR4mSOYbaffGHtXV/tR1DTTSRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7831
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

Hi all,
I am not familiar with the process yet. To get it merged, should I add more=
 mail-list or how to notify the maintainers?
Thanks in advance for your guide.

Best Regards
Shuicheng

> -----Original Message-----
> From: Lin, Shuicheng <shuicheng.lin@intel.com>
> Sent: Tuesday, September 17, 2024 7:48 AM
> To: dri-devel@lists.freedesktop.org
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Philipp Stanner
> <pstanner@redhat.com>
> Subject: [PATCH v3] drm/scheduler: Improve documentation
>=20
> Function drm_sched_entity_push_job() doesn't have a return value, remove =
the
> return value description for it.
> Correct several other typo errors.
>=20
> v2 (Philipp):
> - more correction with related comments.
>=20
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Reviewed-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 10 ++++------
>  drivers/gpu/drm/scheduler/sched_main.c   |  4 ++--
>  include/drm/gpu_scheduler.h              | 12 ++++++------
>  include/linux/dma-resv.h                 |  6 +++---
>  4 files changed, 15 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index 58c8161289fe..ffa3e765f5db 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -51,7 +51,7 @@
>   * drm_sched_entity_set_priority(). For changing the set of schedulers
>   * @sched_list at runtime see drm_sched_entity_modify_sched().
>   *
> - * An entity is cleaned up by callind drm_sched_entity_fini(). See also
> + * An entity is cleaned up by calling drm_sched_entity_fini(). See also
>   * drm_sched_entity_destroy().
>   *
>   * Returns 0 on success or a negative error code on failure.
> @@ -370,8 +370,8 @@ static void drm_sched_entity_clear_dep(struct
> dma_fence *f,  }
>=20
>  /*
> - * drm_sched_entity_clear_dep - callback to clear the entities dependenc=
y and
> - * wake up scheduler
> + * drm_sched_entity_wakeup - callback to clear the entity's dependency
> + and
> + * wake up the scheduler
>   */
>  static void drm_sched_entity_wakeup(struct dma_fence *f,
>  				    struct dma_fence_cb *cb)
> @@ -389,7 +389,7 @@ static void drm_sched_entity_wakeup(struct dma_fence
> *f,
>   * @entity: scheduler entity
>   * @priority: scheduler priority
>   *
> - * Update the priority of runqueus used for the entity.
> + * Update the priority of runqueues used for the entity.
>   */
>  void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>  				   enum drm_sched_priority priority) @@ -574,8
> +574,6 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity=
)
>   * fence sequence number this function should be called with
> drm_sched_job_arm()
>   * under common lock for the struct drm_sched_entity that was set up for
>   * @sched_job in drm_sched_job_init().
> - *
> - * Returns 0 for success, negative error code otherwise.
>   */
>  void drm_sched_entity_push_job(struct drm_sched_job *sched_job)  { diff =
--git
> a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index ab53ab486fe6..cadf1662bc01 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -41,7 +41,7 @@
>   * 4. Entities themselves maintain a queue of jobs that will be schedule=
d on
>   *    the hardware.
>   *
> - * The jobs in a entity are always scheduled in the order that they were=
 pushed.
> + * The jobs in an entity are always scheduled in the order in which they=
 were
> pushed.
>   *
>   * Note that once a job was taken from the entities queue and pushed to =
the
>   * hardware, i.e. the pending queue, the entity must not be referenced a=
nymore
> @@ -1339,7 +1339,7 @@ void drm_sched_fini(struct drm_gpu_scheduler
> *sched)
>  		list_for_each_entry(s_entity, &rq->entities, list)
>  			/*
>  			 * Prevents reinsertion and marks job_queue as idle,
> -			 * it will removed from rq in drm_sched_entity_fini
> +			 * it will be removed from the rq in
> drm_sched_entity_fini()
>  			 * eventually
>  			 */
>  			s_entity->stopped =3D true;
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h in=
dex
> fe8edb917360..ef23113451e4 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -33,11 +33,11 @@
>  #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
>=20
>  /**
> - * DRM_SCHED_FENCE_DONT_PIPELINE - Prefent dependency pipelining
> + * DRM_SCHED_FENCE_DONT_PIPELINE - Prevent dependency pipelining
>   *
>   * Setting this flag on a scheduler fence prevents pipelining of jobs de=
pending
>   * on this fence. In other words we always insert a full CPU round trip =
before
> - * dependen jobs are pushed to the hw queue.
> + * dependent jobs are pushed to the hw queue.
>   */
>  #define DRM_SCHED_FENCE_DONT_PIPELINE	DMA_FENCE_FLAG_USER_BITS
>=20
> @@ -71,7 +71,7 @@ enum drm_sched_priority {
>  	DRM_SCHED_PRIORITY_COUNT
>  };
>=20
> -/* Used to chose between FIFO and RR jobs scheduling */
> +/* Used to choose between FIFO and RR job-scheduling */
>  extern int drm_sched_policy;
>=20
>  #define DRM_SCHED_POLICY_RR    0
> @@ -198,7 +198,7 @@ struct drm_sched_entity {
>  	 *
>  	 * Points to the finished fence of the last scheduled job. Only written
>  	 * by the scheduler thread, can be accessed locklessly from
> -	 * drm_sched_job_arm() iff the queue is empty.
> +	 * drm_sched_job_arm() if the queue is empty.
>  	 */
>  	struct dma_fence __rcu		*last_scheduled;
>=20
> @@ -247,7 +247,7 @@ struct drm_sched_entity {
>   * @sched: the scheduler to which this rq belongs to.
>   * @entities: list of the entities to be scheduled.
>   * @current_entity: the entity which is to be scheduled.
> - * @rb_tree_root: root of time based priory queue of entities for FIFO s=
cheduling
> + * @rb_tree_root: root of time based priority queue of entities for
> + FIFO scheduling
>   *
>   * Run queue is a set of entities scheduling command submissions for
>   * one specific ring. It implements the scheduling policy that selects @=
@ -321,7
> +321,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence
> *f);
>   * @s_fence: contains the fences for the scheduling of job.
>   * @finish_cb: the callback for the finished fence.
>   * @credits: the number of credits this job contributes to the scheduler
> - * @work: Helper to reschdeule job kill to different context.
> + * @work: Helper to reschedule job kill to different context.
>   * @id: a unique id assigned to each job scheduled on the scheduler.
>   * @karma: increment on every hang caused by this job. If this exceeds t=
he hang
>   *         limit of the scheduler then the job is marked guilty and will=
 not
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h index
> 8d0e34dad446..c5ab6fd9ebe8 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -105,10 +105,10 @@ enum dma_resv_usage {
>  	 * This should be used by submissions which don't want to participate i=
n
>  	 * any implicit synchronization.
>  	 *
> -	 * The most common case are preemption fences, page table updates,
> TLB
> -	 * flushes as well as explicit synced user submissions.
> +	 * The most common cases are preemption fences, page table updates,
> TLB
> +	 * flushes as well as explicitly synced user submissions.
>  	 *
> -	 * Explicit synced user user submissions can be promoted to
> +	 * Explicitly synced user submissions can be promoted to
>  	 * DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE as needed
> using
>  	 * dma_buf_import_sync_file() when implicit synchronization should
>  	 * become necessary after initial adding of the fence.
> --
> 2.25.1

