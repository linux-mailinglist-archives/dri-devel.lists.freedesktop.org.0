Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FD6AD3064
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 10:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBA010E4B9;
	Tue, 10 Jun 2025 08:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfTEyy1Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAB310E4B7;
 Tue, 10 Jun 2025 08:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749544263; x=1781080263;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vAMDEsJDBUlu/Y1HiH+WZTERa7OvDJL7W0kM85XQhPA=;
 b=cfTEyy1Y9u1NxN4zqKQKJMkpiSClYwvzAUYoBdvtlNspuLZ1YypSbHR5
 s+x4ehsqCL0UE96NnCkVE8bNK66mW6b5H0kScB2G6nkL/DA0okATLvzBk
 sMDj0sTF/MXZcooM7ZSBO8WuP87xRDFsqVey5idA6z5yWY71QF8R9YmdY
 uS0KAGP7UobU6/UXYFbKBidNKxD+l6r36gEqUWEaHjl+Arn8uUnmQYW8+
 jfwe4E7Vc+xUWMO+biqS/y2AOekr8MEPxy7FYLhEAkhVWecnQj/9Nf7n2
 MArsCaH0vrybo5nDuDetrEBU5lAu3y1SYN9DUWZsF53M6w6AxeVSu78tr Q==;
X-CSE-ConnectionGUID: oa5xsvh8SS6Bqqa2eddfqA==
X-CSE-MsgGUID: vteVGmpWQaOfVzlzdUKtIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="54275539"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="54275539"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 01:31:02 -0700
X-CSE-ConnectionGUID: g9etMA3+T5mfTYibQM5n0g==
X-CSE-MsgGUID: YtVJ0+UgSDGLGUqL0tYj8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="147280028"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 01:31:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 01:31:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 01:31:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.88) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 01:31:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVS3fRaYdletNba/sOOztTvkd5FSLp/Vv/PdGB2CZPD45p/XRRQb286mCJf5Y5pd3AoqvQIzkcDrV8+7dOfbIdYByK8vNxZB6jJGfC2vT6Ml5I9avNH9Sk3VpChV0KhEDzCyWCdl26iwwsbbKL5MWtNdbCs7ZRtZMje/dKWakVDHNR8tqOKDttj2W1EWuN3F2a8JzmEGCXuzUlxnwteYzn6Y+xjvAd+WoFyHpet4Iz4UtqZ2N6C+SxjbJzB6qwu/k9lclAtv7QRp1LMtBvXWYtfkCTtk6bHL2Xw1UoL0PwjdU2UNQK2E6Mc5b5KE8OSRq0PtFrXIb03wCkYDzR6J5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QC7E8AlznUFY07P8hZ11UXWESUfc2A5Gqme2+6ZPjE=;
 b=aozyDZm2oSySXutq8sOPymWMtHczlPzkWH1zqp0nAxHQf0TR710rGHm8tDcaQu1a3dH4pXidksggk5Ge8C/IXrMEvR7ZMW4RqoGeqzfDw/0iA0B2CiCpXb+R7V82ZicOIVp1XZ9KY+7cD9us0lMncHwixkru0QfOIY55chhXlZIEzehS0vtG+jCdGPweKeMlueuioZ+Sb3AFwQU93QqgWnHAcCVKuDvkdkTNL4fqzYL1mcsDV7bewTCCoUDkq+sdwbLquMqRPkEalxH//7HN5+/nDXgtziGNdLgc9T17OUiW7OphSwgygMqk8wn/qT0RIPnfalnMc21pAN1piLpVxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21)
 by CY8PR11MB7339.namprd11.prod.outlook.com (2603:10b6:930:9f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Tue, 10 Jun
 2025 08:30:46 +0000
Received: from CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::cfdc:6323:1353:350d]) by CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::cfdc:6323:1353:350d%4]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 08:30:46 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>, "Wysocki, Rafael J"
 <rafael.j.wysocki@intel.com>, "Lee, Shawn C" <shawn.c.lee@intel.com>, "Yang,
 Simon1" <simon1.yang@intel.com>, Doug Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 4/4] drm/i915/panel: sync panel prepared state at register
Thread-Topic: [PATCH 4/4] drm/i915/panel: sync panel prepared state at register
Thread-Index: AQHb1sJd5Eix/lI9iEGUT+iNQ9RfeLP8E7xQ
Date: Tue, 10 Jun 2025 08:30:46 +0000
Message-ID: <CH3PR11MB7300D61B12074DC922A2DC0CBA6AA@CH3PR11MB7300.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: CH3PR11MB7300:EE_|CY8PR11MB7339:EE_
x-ms-office365-filtering-correlation-id: 1391ad41-997a-4a4e-e3cb-08dda7f918f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?TB0/+BNGo5Vgrmr4hB5m2nn13RiqPooz1nq3t+TSa5Re8N6M1DooSZRhYow7?=
 =?us-ascii?Q?nzMO4tjSNIsEHK6bszT2srw3T/qg1oIaJLEfdTWTCF2lggTz0nmaLznRNXPQ?=
 =?us-ascii?Q?LhNjMmuB9uGJJDrbu50Yk+JmuYmPA5MMW0S0Iq/1MgPPkeVkqV48yPvzAdqe?=
 =?us-ascii?Q?rmY/T6B8cBZEglSV6Brnpa9eKBs9qysnXrNSpVKkXRmYKhxblIv+Rvugqiks?=
 =?us-ascii?Q?33Iako9r65yGTgP7vMaFH3wxYxr760ZiK0fqh9gtxrlgwoZMn8BlP9Uc5on2?=
 =?us-ascii?Q?kA5N2j8ohsiuLAozoLKPSzjJHTwPCinccD7/+MVNRSs8BYC+Oc2Rpp0a6ano?=
 =?us-ascii?Q?HQp9Y5NNsvsc0In2RrTCh0mjRDTCWq6/y7prnHmMytUOs0TK+yUV1cCH5Q2S?=
 =?us-ascii?Q?9QOwiCSRrclymwTe3th8ul15hOi4MT5LDigzLoCuQfky0FQkH3BtPLZJkxvi?=
 =?us-ascii?Q?y1TuMohl39adMZ/2GEJxirZkcj4LmSuGL5Dm4rydbJdEiqRSXZ63s3QO/8r9?=
 =?us-ascii?Q?lcC/pygoUTzaHfqUs8inRd9MhAIrGCtOHiv2pQpdC8N9KCS/+P+W0XqqyrzI?=
 =?us-ascii?Q?jUTUQbTxH7artAJr7TJOLgghSf/ZXR1ZhU8FL37b2YM4XjRIgiDpxONyFO18?=
 =?us-ascii?Q?1aY5xLO9FxGkt8IPKRfyZaNGlfqTSbK9zaiJpJXrdRuk8ypDzOtDce14OXDP?=
 =?us-ascii?Q?MutzhN0J0lSVFT3EY7AuZtbg3i9tHMUqveWGmftdFCz7zJvEThNu84GioNvD?=
 =?us-ascii?Q?8PZ2JpsE0REZnTuzLm40j06C3eXdws6s/7bqg0BzpOoooX0iVVjOqGl4G50r?=
 =?us-ascii?Q?9lSaSxnore4Uu9eGn0Ci5bKwkT3Yl4SAZXPjFOUP5mTe5gLr2JyyUw+HNsab?=
 =?us-ascii?Q?bpdqy/TBBr+2dOZwv15exAcNedXlAh2sCBMQY8HC/fXl6Otf8IfkkcraVYeh?=
 =?us-ascii?Q?0zHWpsYy33Kho/BtkWUdIzH+cPhIyhlsBXiFNwJJFdJ3mwT2cm5qgNB0saT0?=
 =?us-ascii?Q?X9u3BThx9XsAKpfGv8/brhi7h+xDcU+2vdUZHh4LZewnyutYh0fKHD6UlDEX?=
 =?us-ascii?Q?b09mJ9ZL2K6HLwYx2oP9K6R0ZGGcxvhWRIZnz411VXFCATbyANCHLYZAqv1m?=
 =?us-ascii?Q?ua3RLY1agCJoRwoHL2urZjLkjsFE81vD0jsdG8qlJwTbWQaSIUwTldCl0G1U?=
 =?us-ascii?Q?qEQvWHG+CV4ayPJl2a8b1uhJP+CkvqkrwJDeRHKO2Ja+eL1kPlx+Ws5UQ/Ce?=
 =?us-ascii?Q?OY/ekjfrN5PMDyxPUY3/i5EhxGS3iOCdU5KFYJcyui4u8ifbCuA4oyPC2jeS?=
 =?us-ascii?Q?muCE8EYVBTLp80ROgQ9illdDAf//qbC4qndkcfzH3bvzmaqcQJKIdc8kAOWF?=
 =?us-ascii?Q?VqfdPt2DRBDotAoq8BE8vBsuxFT3czwM5I1kBHYEiIrj/QfVvZ8HrXB00xuz?=
 =?us-ascii?Q?CJmBStsjCcdldtIm22K8rDQMPM6JxKwtvo2DFy1yg0l2oJDaSto+Ng=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7300.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sP//CqSDV4YU5Do3r+H5wRCVhmZ5Obn6fLMSWEvLFABeO/Yx3q95g6AwzKWt?=
 =?us-ascii?Q?1OV4hNcSlSMhe/OQONj+3lvJTKqeJW0DyucAGhg1ZVspaoqssOC43SuKONFw?=
 =?us-ascii?Q?C97lMMTR8/Ub+QTKQz9tAlv+8dJhGcsOAmM3+UtSpVPMXbgHYPac0qK+Cce2?=
 =?us-ascii?Q?DMAWWdm9XEcxgTXDzgGxOuIooQtns5dA0iP2FKkM2PkdiUAHbb7FGmv0Uhmp?=
 =?us-ascii?Q?QzXhaIMq6++u/2MEGb3v2vDF+qaWFshul+73J53AGCBA/Jv6hAma3rAfYfKD?=
 =?us-ascii?Q?Dw16dtdB0w428wIya40O0T6fwXuRfK40xJyatQ+8LxD+eQNCgH0/ALBLgh/b?=
 =?us-ascii?Q?yIZJrxFviwkIAhQ4yGZlNyfe/TvxyNkoFaDxnHpNxhO0wVwMZJq0s+04UwJJ?=
 =?us-ascii?Q?3u0YgInr5she6Zpq/1+nJIwNn5qrHZ3ZcbJDSEb184F94Gij+J0lU8pUD5ca?=
 =?us-ascii?Q?YihPMd6OAC+hVOFp6Ag4IvLRfTezw0kxSQ1VJmjQ3Lxg+9uO+2GivdXvf7zR?=
 =?us-ascii?Q?zy7AazDtnI1XYHk5SN0pe9XJ/Fn4bn9wyluczTEiPgFqPXe34HAjly4uR4Dh?=
 =?us-ascii?Q?x6vZdBbJDv31l2wGPnG3AMXfiPZzQ8EmCep3udWyNi6JvWjppN6WbpGkroA6?=
 =?us-ascii?Q?vPzaCx3XVoNAXxyF4r1eLxdfDptTJIH2PiAcz8qZUOw5IexTmHKkE0kSbouw?=
 =?us-ascii?Q?jqhMdZYW919+yjFvNE3pJ8K/y08u9NQZSKX7qypzx56rHYP5ghuzlOXGBFyG?=
 =?us-ascii?Q?bUKz18LCvozvw59ibq/tObOaQe05Qdo2Orooi5pA6VujoXnd+HueySujo+8z?=
 =?us-ascii?Q?Gb8avAoYif0MIHcU5epU8/ENWGyW7CxRZwtUNM7iOCn5AVA5o0ebhBJyvlqS?=
 =?us-ascii?Q?5FyC4hNrLrPopgFs9fjxEK7qljNj898+rQMem3gyf7usRSIKrz/5C556KytQ?=
 =?us-ascii?Q?nud4ZAqxDW5X0bIQ00g9hsyHftYrMOxSB673KE2S0dBcsmTov4GTxB6AXz3o?=
 =?us-ascii?Q?80pX9ZrIhQasmjKV7YKyUuFVwobhgwJxAliRW7JFi1eOm0s2Z8aP0GPbutKG?=
 =?us-ascii?Q?bInMJcsQqvIpKIY/S4QlfhL5I1XZJ1IrkszJSk7nsZVNo4MYdcTITYBvVYIt?=
 =?us-ascii?Q?hWNY3IxX5Qx0te+HzshIqHNihmGSrBhq6bg1QwLNf5HHx1HKqocJF+QsW2dE?=
 =?us-ascii?Q?TjBFzcftwuxoWm65gCNgBB3Q2jef7Sb/gtG+LdymHeMLrysNHLX1bgJ7MNRF?=
 =?us-ascii?Q?ZUz4HqV+bL4wWlJJzjVRhGImfCQWVGB9UHdLg2ahoUZOAhpk3wnuOysIiNCL?=
 =?us-ascii?Q?TueEBtggc+hvTfbkac8Vi2G/lrD7QsghiBFLUZ9ekMXIOYFhnZv0u3pZS5vd?=
 =?us-ascii?Q?zRrBgofll0UUrD4/B8Y8ieRbySTEhA+jwisKcAtTP7ogzOagDFjB/HYm59C0?=
 =?us-ascii?Q?sqRB7UxzXhP0EFh1WJFPV7QPAX+wbWwPQctJPgkh6YJBM9MiKRmvhKYuiWPq?=
 =?us-ascii?Q?L06PGAqTJC8VCeoEyLvkitOYQFTBFt/lrZ46OGfuW8K/cfLUvtso14U7KGud?=
 =?us-ascii?Q?h+Cx9iyfXwLj172K7oWR6vSoK7OasEv/4vSIc6bP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7300.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1391ad41-997a-4a4e-e3cb-08dda7f918f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 08:30:46.3073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TDXFINVfuLJO9KYz1UmA3GQx1zQlrizL3c+gIHbu6v/6u0GjmeML3sl2axQLwz/Eao5ymJBY8OdDHzxHEP0SkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7339
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
> Maxime Ripard <mripard@kernel.org>; Nikula, Jani <jani.nikula@intel.com>
> Subject: [PATCH 4/4] drm/i915/panel: sync panel prepared state at registe=
r
>=20
> If the panel is enabled at probe, and we take over the hardware state, th=
e
> drm_panel prepared state will be out of sync. We'll need to notify drm_pa=
nel
> framework about the state at probe, so it can in turn notify the panel fo=
llowers.
>=20
> Cc: Lee Shawn C <shawn.c.lee@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
-------------------

>  drivers/gpu/drm/i915/display/intel_panel.c | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_panel.c
> b/drivers/gpu/drm/i915/display/intel_panel.c
> index b1d549e6cf53..f956919dc648 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.c
> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
> @@ -463,6 +463,45 @@ void intel_panel_fini(struct intel_connector
> *connector)
>  	}
>  }
>=20
> +/*
> + * If the panel was already enabled at probe, and we took over the
> +state, the
> + * panel prepared state is out of sync, and the panel followers won't
> +be
> + * notified. We need to call drm_panel_prepare() on enabled panels.
> + *
> + * It would be natural to handle this e.g. in the connector
> +->sync_state hook at
> + * intel_modeset_readout_hw_state(), but that's unfortunately too
> +early. We
> + * don't have drm_connector::kdev at that time. For now, figure out the
> +state at
> + * ->late_register, and sync there.
> + */
> +static void intel_panel_sync_state(struct intel_connector *connector) {
> +	struct intel_display *display =3D to_intel_display(connector);
> +	struct drm_connector_state *conn_state;
> +	struct intel_crtc *crtc;
> +	int ret;
> +
> +	ret =3D drm_modeset_lock(&display->drm-
> >mode_config.connection_mutex, NULL);
> +	if (ret)
> +		return;
> +
> +	conn_state =3D connector->base.state;
> +
> +	crtc =3D to_intel_crtc(conn_state->crtc);
> +	if (crtc) {
> +		struct intel_crtc_state *crtc_state;
> +
> +		crtc_state =3D to_intel_crtc_state(crtc->base.state);
> +
> +		if (crtc_state->hw.active) {
> +			drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s]
> Panel prepare\n",
> +				    connector->base.base.id, connector-
> >base.name);
> +			intel_panel_prepare(crtc_state, conn_state);
> +		}
> +	}
> +
> +	drm_modeset_unlock(&display->drm-
> >mode_config.connection_mutex);
> +}
> +
>  const struct drm_panel_funcs dummy_panel_funcs =3D {  };
>=20
> @@ -513,6 +552,8 @@ int intel_panel_register(struct intel_connector
> *connector)
>  		drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] Registered
> panel device '%s', has fwnode: %s\n",
>  			    connector->base.base.id, connector->base.name,
>  			    dev_name(dev), str_yes_no(dev_fwnode(dev)));
> +
> +		intel_panel_sync_state(connector);
>  	}
>=20
>  out:
> --
> 2.39.5

