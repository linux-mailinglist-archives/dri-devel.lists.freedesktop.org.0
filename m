Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFDDAD2F62
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 10:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DC610E4A3;
	Tue, 10 Jun 2025 08:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzBJ7sQo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D0310E4A4;
 Tue, 10 Jun 2025 08:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749542501; x=1781078501;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vNBquzoEMeZDjE2N5Koi6ugZCs/CbTJod/vgZL8hpS8=;
 b=TzBJ7sQowaec63JhxoVrDOwcb5k2Oz4rVn79tpEurHdKLpIyn+/GE814
 UBFVJ6ukev7hcspI4qNd8uvO6LCqzPFvJhoiG8uOmu/sNLq2ibm9q2N+Z
 xqZcZVe5JwCXFOyOaTFH1zxxAmKoJoayTFS9x6EBF7kAOP0u89JDsLhQu
 PEAcnqLpGq/oDCYfr2oGj2lg3y1tHyRTYjfWnvpriq0GkupVg5lbAwPAF
 217ksA20Ka53hFVGD78aPd8TCKXKvZTRY/bseGNHr79MrCNbtRpn+WvCS
 DOBwd7wOC8+fefEWKFoC/UKurV3GJMuAkC6uhxykeTnfsEYj40dPqHeCT w==;
X-CSE-ConnectionGUID: /H4yVRV4QXGtuiAJqmJopg==
X-CSE-MsgGUID: ZGy+R29BT+WBTN0FGPDM8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51517366"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="51517366"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 01:01:40 -0700
X-CSE-ConnectionGUID: TMRbI3KDQleCTOHXsryRJQ==
X-CSE-MsgGUID: 9Uo3s5Y1TrqHQlejxbA7LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="147725649"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 01:01:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 01:01:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 01:01:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 01:01:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLYFCk/KcElWM4ooK7Ep7b3lDCNNQyWakfRjL7p7FDmuLAr/icaIJq4vLrGqJxxgLQ/dzUI1OPOH/4rwZ9/h0rJi4UgLBtRohBWJop3tRGfvQogOI9KuFyesXQpt2BMHYdgdCg7ghnChYeChFZt69HHSOobb3t5lwygspfCcv57WNRVFhJwzQ5qm6Plpf4ufm+Pu6cu2aknZJkp6JOtcTz+5hG85w6NdDrdc+QrywJeIbgQxoWRtw2zzA+3LCj25gv56L4F1FYMYOyiBc/S1XeFY+geRJrAjCON7Q/bHuM0Y4DX1vqs6Wh6Lm+VIg8uphvVh6dpJFuRm7kWbBkvvLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Of9vXqBxlZ3/p5qHeJqK7AXa1iDb3ZXzf2qMU7u/2es=;
 b=VLAHa4cWbJeh0R7arckRilSBQlxCStZmyUxD8zXoVCLfP7xIJzVfVqH2S1BM+71qzC4PbKVV7T3ECqCmOjDAwHbvPZu0ia49vfA0obBu0LKotJnzyI+4ShhUOSEUO59SuoBetedLgBSZDLjDnPfdlrhs586cGMbYVeuWjF5n9z9ycU5v/8KRZx6/v4iKEs/mAfZpuhq5DWDqFVqp21U/wnWwauLmTk7X40J6UXGoDzMqGSSDvVQy/9fMOT1onJKZST1waDZ4Wh8/8cQs2bkrR1LhJqFE2ucLEJxPv5k2yif/rtCSksJTwSSM2jlhNcu1GlnEao+98IX8rpXx8EY5hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21)
 by SA1PR11MB5947.namprd11.prod.outlook.com (2603:10b6:806:23b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 10 Jun
 2025 08:01:34 +0000
Received: from CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::cfdc:6323:1353:350d]) by CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::cfdc:6323:1353:350d%4]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 08:01:34 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>, "Wysocki, Rafael J"
 <rafael.j.wysocki@intel.com>, "Lee, Shawn C" <shawn.c.lee@intel.com>, "Yang,
 Simon1" <simon1.yang@intel.com>, Doug Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, "Nikula, Jani" <jani.nikula@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>
Subject: RE: [PATCH 1/4] drm/panel: use fwnode based lookups for panel
 followers
Thread-Topic: [PATCH 1/4] drm/panel: use fwnode based lookups for panel
 followers
Thread-Index: AQHb1sJU/S7T9nARb0qdNYfP5LuD2bP8AIWQ
Date: Tue, 10 Jun 2025 08:01:34 +0000
Message-ID: <CH3PR11MB73001B260E318B05D35EF6ECBA6AA@CH3PR11MB7300.namprd11.prod.outlook.com>
References: <cover.1749199013.git.jani.nikula@intel.com>
 <1ed7cfca02f8cf14347dadfe027197dc15791383.1749199013.git.jani.nikula@intel.com>
In-Reply-To: <1ed7cfca02f8cf14347dadfe027197dc15791383.1749199013.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7300:EE_|SA1PR11MB5947:EE_
x-ms-office365-filtering-correlation-id: 64ad0111-9f82-41bf-8a9d-08dda7f5049c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?cDDRIk1vJzlSbzOdQH38cAOTzWSMpL5Ja7fSoBu22G7bCu6ygnSHCaYSNmvN?=
 =?us-ascii?Q?rEdXByih0c81OBv3by04Wy/Jj3TxohleUzHzgoMQeML+A75BSiw9yv+63MTS?=
 =?us-ascii?Q?T4IOak8yQO4Rl22vZI+HQMEU5xwj/aYDXgLFRCI4vK0bJIwAJcUU0p37EqXE?=
 =?us-ascii?Q?B9UxsHGwDddMSkaPlWmq2IpOS0l9iw5tt7AjsRVHW9kfgKJ+rh3tYR+LZ9yl?=
 =?us-ascii?Q?vp3D0MQ4G+a8megavUT46wAdO5izuKAbgSXtKUUnFzUBHSqXhrjVl8UAVQa0?=
 =?us-ascii?Q?FdLup9+Ydhnp1zm/GMT8vdeiMEjhpzwBi3s5s4LblTz7qTX367A1ztZkyZ6w?=
 =?us-ascii?Q?AKwa6UExKPV+C7EQ7Helt9+O/9Y6UX9383nZslUD/9p3hqs1BzgoJarpG2h3?=
 =?us-ascii?Q?3+W/XI7BfTLavvf/fqtP2E2U3Sz1djbYqao4vD55OAZPsKvglb7Z0FsnDSdw?=
 =?us-ascii?Q?BM/tsUxpc0PiBBNR5iJZqGiV41CpezQXpBVhl4vMn5HezBOAFuTY/K+z2xzM?=
 =?us-ascii?Q?X21006G9yheER737Qt4i2qlDhyskmyAWKizt1p9a/EFjXQITYn6n+soV4a2B?=
 =?us-ascii?Q?SWHPCfq89bIrluOy8In16ebS6zwHwL5xs5dvxhnv7KFJQA7Tw3OoIpRHvlIR?=
 =?us-ascii?Q?BeDSkjeIWUzHDw17K5/KaYzkaGlQdKHNMAa32KRdT4Jp87oBfVV8pIVqa8U3?=
 =?us-ascii?Q?dsBV/uhYdnxJaZNC1fMOlDoawFTYJqtY8mxv3C1i/V3qcolNNMkBvRVH8Db6?=
 =?us-ascii?Q?Rw9jwA9bXn7o21CcMAtCXLNSH/ldiM2sI8mEFYGXjeWEewRbLHx5EyQEC5Cd?=
 =?us-ascii?Q?QWu8F0FfkHwTcyYbw7UkaypHHWg+r5tcpWipifixcnWc0f0/25wHTR+vhBUc?=
 =?us-ascii?Q?tZYNqO7iURfl8dHQEN/F76xsH7PBQqJfCOZ6j9xf31poUxr64ZFKJWQOmjRB?=
 =?us-ascii?Q?zKBKJwfP7pLQZpuI6MIY4z+ty0Zb5mzYK818XlCQ2kPpyYF27h6G+mX6yDC/?=
 =?us-ascii?Q?SICpRJ/2HUYbq7kYCvlN0e4+UYtTdBs6vTimv8xoBJRpVm65LDL68/KzjCKl?=
 =?us-ascii?Q?pqUaXtAYbOSkwn3oXxQQD2vW2yeVdpnfCsJSjcSeZzpq/bAsSs5cHMGWs34/?=
 =?us-ascii?Q?cqrmc3lw144qs8Z+VpjEKKoJVE5E6tFkl4lh+UHVE2s9Sd9KaKOcUccsYEfT?=
 =?us-ascii?Q?q+JsWdOwZi5K4BUPRwUSIADWqMfORn9LzQT/vs4ncuRc3DScQAFPI15JRaVj?=
 =?us-ascii?Q?FUoVzAVXmztWTaDEMdhxLgroYhVIbb0vnhJ5WOaFfRomfC55MF1OCgAOLKq2?=
 =?us-ascii?Q?ekYeM5vPPLhUJjzMHqn7Q+VmZcFwi4kBADPNvgGP9VwBJxA8O8/n+iHjuUAL?=
 =?us-ascii?Q?0J0RdtxVpOVJVfnKemGWRJteSwoln9FoxpBZ17wWakttmEL4Qm9v6FygHtiL?=
 =?us-ascii?Q?ND4x1qVX3m0RQtz9AYiyfsla6mZFPJPNQt848C2dAl5FRlmXQIYl2ANB6JVV?=
 =?us-ascii?Q?TygeU6q5gqoc6RE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7300.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IZqPhVV4oMcCqgakdr93AGmYlBbBP3qZ2HN5ivbyLMqdagrpStjlBUSoDgOX?=
 =?us-ascii?Q?2t6Jq04Z3B9svLq76pmRlCyFMfysUKZT4D77dhkt6lxBpKnVGTgJ1FbChkSu?=
 =?us-ascii?Q?s2EWiBq7ti2Ec8WQwh0IDfPKGWoMhpaJoOkQPaRruCrdqiSzzLLnR5lHoats?=
 =?us-ascii?Q?6uc2Edb9OF0B+6i2MAg1+8tcPcA2Y6eYLjmSiasW82Pwu+uy98QmjpN5Z++1?=
 =?us-ascii?Q?PhEsrDvMm1JsixZxoA2iWhM/+5Xl2HXIOzDEuH3XkL7uZe1/9L/cyUw8C/P5?=
 =?us-ascii?Q?wodN51M5YNlwrllD/k0sM54a2YolVOty4j6R1OM0Vuy/bnjpP1s2SFcGGC/c?=
 =?us-ascii?Q?ptHgXw+pwP5ZFNBirHduKY2YY4WYh3wBZ8gfiN4CvIzK8HgGqOEvDbdApgjy?=
 =?us-ascii?Q?0VX99OZrO9gwSgGUhW5B2dvaXwjTfMSZ37HjPeSE3g9Zus869pKh3uoQKpfw?=
 =?us-ascii?Q?jen+jjcuVJVKCIO4+MOHIYczlAG7SypXTbXeuv4rEi0ZDGRDBM2pv+QnOUrQ?=
 =?us-ascii?Q?1/+idNvJMwhHXVn8nPLVLjxUIW5IYiK8vgj9HDuearJMsjXvzCljk3qtBs3f?=
 =?us-ascii?Q?9Uk8/4RrJzoAzs0J2Faegc+LuPvu6UBKTAaj+v3NOZVLeN+MecBXiu1BoFWH?=
 =?us-ascii?Q?cdVjrgMtLa44fTB/xBV22wGMLQtuSxsUm7FhKwDcogf0fG8TMd5Np/OQXpag?=
 =?us-ascii?Q?gppkdg4xvIpMiXJ466BwH8WQajpxECwWzKdb4z1aipiV4FECLlSUz2o5ctnf?=
 =?us-ascii?Q?LLBmxZfVqjEfYqCHqoVxTGn2AB5YUW79QOR942oZIYHUrDysYETubNkRqdkO?=
 =?us-ascii?Q?eLsK27gB/sipouhrgPUBja7l6RM7K+q1j4ysgp/i/vIcSAkn0/wzdpNlY4Gu?=
 =?us-ascii?Q?cruL+nnEntRPJ00b7uteaENcom3p01mY2hmqeDHo3WQe5+SNVBhR7RRF2W5W?=
 =?us-ascii?Q?UP0lA6QLwX28Pw/X1xVQwF4p2bAMGyVirreXhKgsWWAGwqAiIwepNJxxpjKb?=
 =?us-ascii?Q?8UYv+5hjK1ytUnmZ4/huMxmADUIdfLD59EfzjeuqRujggiTw6Hra8MReTgon?=
 =?us-ascii?Q?hPZ4TYdSuH/EPB/yjlAtzFidJKyePHjkT39u2z6Tw7OzBOKhzucNfj6TXg99?=
 =?us-ascii?Q?jFdQ/KHsSi/YmR7DPaT4OvDfUQyTZJLiBiiHuUjKLxt/POCu5iu/cQTZwY5E?=
 =?us-ascii?Q?o1sattJRUinT61DZpxB4a13Rf5bzn4PFOKd9ew+O0iXlKRZDRvsd6VVeDU2t?=
 =?us-ascii?Q?wTw8qKLLRQyFvS8i5M8F3a2Nz5rWBAjlRubm9F4TvhRl6CC6vdcuRQXgiOyt?=
 =?us-ascii?Q?aVKSyhUrn4uCGzlutMT3WxFpIXG+7bEu6t31cZ30pUV23+dGlUAHvzpSrL/q?=
 =?us-ascii?Q?MLALKdn8+66KFkgTWQ/3FyYHRpzFsgPKq/p85UXbitfeJYq7F5D2mS5aT/sA?=
 =?us-ascii?Q?YxOfsmOhtgBq4IQt6yL03P6K0ImpC4J4sV39906mKPhLohU1d1ckW38aHbZ4?=
 =?us-ascii?Q?dOYlbfdE0lQZjGDjMuUGcpfh0UeTEJnZfkVPsNDZ4kXIogUnpqqOXbZSHpHM?=
 =?us-ascii?Q?W5JFtuaolPaawCp3g9+tMo2cdkc5y7K21EKbXqhx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7300.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ad0111-9f82-41bf-8a9d-08dda7f5049c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 08:01:34.2450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LLKtMr8DGMY3PDX5MiLzDl4E58Z3wfdsRYMrXJEjwPsY9tqWsuPjW6jTkpMK2tghIn9n/UpKvnAWHuMoBsRYug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5947
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

> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ja=
ni
> Nikula
> Sent: Friday, June 6, 2025 2:35 PM
> To: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Heik=
ki
> Krogerus <heikki.krogerus@linux.intel.com>; Wysocki, Rafael J
> <rafael.j.wysocki@intel.com>; Lee, Shawn C <shawn.c.lee@intel.com>; Yang,
> Simon1 <simon1.yang@intel.com>; Doug Anderson <dianders@chromium.org>;
> Maxime Ripard <mripard@kernel.org>; Nikula, Jani <jani.nikula@intel.com>;
> Neil Armstrong <neil.armstrong@linaro.org>; Jessica Zhang
> <jessica.zhang@oss.qualcomm.com>
> Subject: [PATCH 1/4] drm/panel: use fwnode based lookups for panel follow=
ers
>=20
> Use firmware node based lookups for panel followers, to make the code
> independent of OF and device tree, and make it work also for ACPI with an
> appropriate _DSD.
>=20
> ASL example:
>=20
> 	Package (0x02)
> 	{
> 		"panel", \_SB.PCI0.GFX0.LCD0
> 	}
>=20
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Lee Shawn C <shawn.c.lee@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_panel.c | 39 +++++++++++++++++++++++++++++--------
>  1 file changed, 31 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c in=
dex
> fee65dc65979..3eb0a615f7a9 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -473,17 +473,40 @@ int of_drm_get_panel_orientation(const struct
> device_node *np,  EXPORT_SYMBOL(of_drm_get_panel_orientation);
>  #endif
>=20
> -static struct drm_panel *of_find_panel(struct device *follower_dev)
> +/* Find panel by fwnode */
> +static struct drm_panel *find_panel_by_fwnode(const struct
> +fwnode_handle *fwnode)
>  {
> -	struct device_node *panel_np;
>  	struct drm_panel *panel;
>=20
> -	panel_np =3D of_parse_phandle(follower_dev->of_node, "panel", 0);
> -	if (!panel_np)
> +	if (!fwnode_device_is_available(fwnode))
>  		return ERR_PTR(-ENODEV);
>=20
> -	panel =3D of_drm_find_panel(panel_np);
> -	of_node_put(panel_np);
> +	mutex_lock(&panel_lock);
> +
> +	list_for_each_entry(panel, &panel_list, list) {
> +		if (dev_fwnode(panel->dev) =3D=3D fwnode) {
> +			mutex_unlock(&panel_lock);
> +			return panel;
> +		}
> +	}
> +
> +	mutex_unlock(&panel_lock);
> +
> +	return ERR_PTR(-EPROBE_DEFER);
> +}
> +
> +/* Find panel by follower device */
> +static struct drm_panel *find_panel_by_dev(struct device *follower_dev)
> +{
> +	struct fwnode_handle *fwnode;
> +	struct drm_panel *panel;
> +
> +	fwnode =3D fwnode_find_reference(dev_fwnode(follower_dev), "panel",
> 0);
> +	if (IS_ERR_OR_NULL(fwnode))
> +		return ERR_PTR(-ENODEV);
> +
> +	panel =3D find_panel_by_fwnode(fwnode);
> +	fwnode_handle_put(fwnode);
>=20
>  	return panel;
>  }
> @@ -506,7 +529,7 @@ bool drm_is_panel_follower(struct device *dev)

Does the kdoc for this function need updates?
The doc says its supported on only device tree supported systems.

Apart from the above mentioned update,  from ACPI perspective looks good to=
 me.

Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>  	 * don't bother trying to parse it here. We just need to know if the
>  	 * property is there.
>  	 */
> -	return of_property_present(dev->of_node, "panel");
> +	return device_property_present(dev, "panel");
>  }
>  EXPORT_SYMBOL(drm_is_panel_follower);
>=20
> @@ -536,7 +559,7 @@ int drm_panel_add_follower(struct device
> *follower_dev,
>  	struct drm_panel *panel;
>  	int ret;
>=20
> -	panel =3D of_find_panel(follower_dev);
> +	panel =3D find_panel_by_dev(follower_dev);
>  	if (IS_ERR(panel))
>  		return PTR_ERR(panel);
>=20
> --
> 2.39.5

