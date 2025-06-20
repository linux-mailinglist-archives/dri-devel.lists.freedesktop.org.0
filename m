Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B0AAE12F7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 07:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90FC10EAD6;
	Fri, 20 Jun 2025 05:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lGjl8LKu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24CD10EAC4;
 Fri, 20 Jun 2025 05:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750397515; x=1781933515;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1Vqdzr5hdnkZkjG96vv4yGIZV9wAxpUnmc1UBFyX1Bw=;
 b=lGjl8LKuHNCZqa8W6VvgmXfa/siuoWoyak26EXCkr2B19OM57smHcPJH
 oXT29/81kECHrbE9/MhlWlNtNN0/RQWJhq9rLfE2bt+nxS8njYtpc+lUv
 TcLB2DmL+TWUJ/LquDdKanGg37q6tiXNubYgyy1GrjLGGliLT1efkVXzX
 at9/XOYn6RXZ41Jqy8Kc0cSloNv6EGHNbDebGpvhvNzRGRnmh7Cj2vH/0
 lZFEMW2wbsClpIuaFCDuYE2p0+/EOVs36jOvNNyTbEzOYc/P55s1evmHA
 +cKoNs05pYr5Myj5b0g1/dG5W896LUsOstsorDCcOkjBsFWCKqFW2o68Y A==;
X-CSE-ConnectionGUID: qL2K8O/sQ+WioHBoP36JqA==
X-CSE-MsgGUID: azJaSoRNQtuOOyp/wzRcug==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63698021"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="63698021"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 22:31:55 -0700
X-CSE-ConnectionGUID: TLxhb4TIQJyZCnbJWABe7A==
X-CSE-MsgGUID: K+XwRJoFRBOrPxNgwD0Ifg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="155193379"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 22:31:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 22:31:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 22:31:54 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 22:31:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUz4CL0jfJDLGHJjhp78DRm4f4Igu3RT9K8ILFnop94v6zreWQ6S2l2k6cu9h2pH8k+LtY50rLeOiZImfD4L8tldSj1Gf3G6FUHVe8OwmsXfjqnW3LMtJ5nktyKDGc88y85HglYGSTJsj8ffKRVCvk2neHshZz7lyhP20yhjfDJJ11nz+RjQ1+ScUoEZx6+GXSYTzZfMvHhtcEPsQ3+EG/DWU4uXMhQw7ct4tpvEmTHo6QVnVTq58orQN6CT58jnIYwss0s6A3Rf0xuJd6ZoVYq39Icp15kdNiP5frBcItXOQbuL+XK9rmUF4lc9bn9hjS9ebhbHQqEUwJoRC8fp8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsWVQaPXMHkyZ8ceuHgbWqBZTCW2y1gOSQdfMl96ihA=;
 b=r2B0NMODabKlAuY6RPjBkj6MQuKfTEpAy/gpSkYxtx9bxB8T5ml2typP1Xj8TBqtUCEw/+fhsoSjTHn9jKfJ61806mER6JPqKNCI01sKeW+s1774k7ZQMzYkhL81FGZNRVXeYavaAQouhUH5nkMRskB2qq6FEgXrbRc3UUUOTEHAwLpwWyN7/8pM8RycPUHUwSiDegp+WxzxiJ5as8V7mwuy03b9fTSRNFOu2XATZpOpTK4KxS85iJ3BeqV6/f+9+LNjcmHL+ypCfMpqE33NH+68vaQZWKnct7goVGs4/l6/0gK8f6juG4blfo/w7pSSKDonaxbJZ+eMBbWHKBFU7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MN2PR11MB4646.namprd11.prod.outlook.com (2603:10b6:208:264::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Fri, 20 Jun
 2025 05:31:47 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 05:31:47 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 13/13] drm/i915/backlight: Use drm_edp_backlight_enable
Thread-Topic: [PATCH 13/13] drm/i915/backlight: Use drm_edp_backlight_enable
Thread-Index: AQHbrPQxt0eu6hnV30CVSWE/yu4JurQL7xCA
Date: Fri, 20 Jun 2025 05:31:46 +0000
Message-ID: <IA0PR11MB7307489F39FEA1E2AD5E3CC6BA7CA@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-14-suraj.kandpal@intel.com>
In-Reply-To: <20250414041637.128039-14-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MN2PR11MB4646:EE_
x-ms-office365-filtering-correlation-id: e1966bc4-e6dd-423a-62a6-08ddafbbbfec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?soAnVqsn07v5ra3bkvAYNRhp3WP5XXHPum5bLAozI9Cm7WrGDoQikjNmF2jx?=
 =?us-ascii?Q?nFrn1O2j8ruFhMDZr0K8aMEG2posJXF32zlQDJA5xGpf/nGjtbgG6TCa48dK?=
 =?us-ascii?Q?dcohXp/63nn6fdUD/zZaSDqGAZFRiRCxGdrXrkFhRGQKNeOAqC5v5l2f2kh5?=
 =?us-ascii?Q?yBV1V0EGCT6JxS0mm5fnHhu9Yr7nzt53cndcYKXajNFHalGPJGmgPgWn/aSr?=
 =?us-ascii?Q?efjYuyEAoj/fCnhoe5ik0GAR5yWWVpX0oQzXqsIWliex8CqrZCPYOV4JBoQ0?=
 =?us-ascii?Q?rHsZRve8KloNeCvhGg54ZLTzTjqUIS3g0f/nAPg5gQyHzHkmByQtafwEnEqW?=
 =?us-ascii?Q?RNHwRvOH7NxspYeILE7T/aGDfRcUS2bTuQn0Jp+2KaYRJvfQ1Cmg7ujJK+rU?=
 =?us-ascii?Q?Wb4WAtB4hze8ie1C4iZCuFtGKbiPlR0euujvxd7Y52miQddaHDYju3v4DItO?=
 =?us-ascii?Q?r26i39hBbVZKemoAnx8z96LRCZQuBzTg84VI6bVB5eFi65xWRKgZMcReg5ms?=
 =?us-ascii?Q?lsGrmC+mZEiOIs6Vyc/0tx/W0mmI1Rg8DngXg3o4yenyoYhQRtpzQEYASLfY?=
 =?us-ascii?Q?thxkXlh/TqA7SpP1jVqyNiMD9UlszYtlXwTr7WpmFIFioZh/Qo1QjnXJpPn+?=
 =?us-ascii?Q?fC69xkyWIdRmMqnYXdAqvdk2v4HFMnLTZN9Il6hGVAbDmhQHeibLRw2TZDVJ?=
 =?us-ascii?Q?NWhCwavbn3iLsJdrQ6OdPs3O5zs1A3TARPe/fYEgScllDul+Hi1/PTC88D5S?=
 =?us-ascii?Q?7Gkoo4ILVnDz8zmloHm08qsJ3SuTm0ztzYkydVmTqLWewSTq806hFSX0hjZf?=
 =?us-ascii?Q?w15uqH3qKecBn/b+oLFlA4Sq6etj6q0LX2FpUSbogqQBNSZMHyUaS1MSDvZz?=
 =?us-ascii?Q?MpKdQtJhnvN20IF+Bc3ZVpIDH0k+DrteKd8o2kgzmeeq+RWqXKeVMrJA4FSB?=
 =?us-ascii?Q?xDbLakXSzC+Lm6SQuK7Q0nDywqqF3FhzyA13oACLA3+N7+MPAVKxlpnC/Y0k?=
 =?us-ascii?Q?jg2gOXIYbyiBFri3/2vyHkw5PpBmxFDboKduq5cjR/52O1dCx9Ug43t98P5h?=
 =?us-ascii?Q?YKXpcGdXpUQvpSK5xuoHbBqsRiuuHG+UuX0+eeNzieqpfULCbJ+I4gvTB5GF?=
 =?us-ascii?Q?XnF0A6IG65WZ4w6TB7D+ndfeaZewWA3wU3Q+oNFnKTeHWmtA/sLLLvWhtifT?=
 =?us-ascii?Q?osBWhY4VGlO6Kre2B0YugHcjq0eim2IXoxrpFSw91u8adebPaJT0cMDJo2Ia?=
 =?us-ascii?Q?ILYKHHCqlO7ASlMSrWmxj020GgKIT4UaGgjRJgJuj7mepjFCdl7tRIt5PbxP?=
 =?us-ascii?Q?VV3hpAkgSVtXY3XiJa240zZaZLavuKK9bEK4l62chTd0RcFYIU+YpmYoMZ5j?=
 =?us-ascii?Q?Y1GTkBvNPWELdSX0kELlhQGBBdn4iXZ0O7Z0xqH8ZNeM7wmGRrbajHCj+WhO?=
 =?us-ascii?Q?g9LWskwILVqCD9ipYfN8Qj7fdDHc7gIRc2XgyJnyCDQnDyBEyzFOGA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WbkA5GjhpQkRo9NAskhznUh8xyieQgBpxSq2sa4wbwsCDiFB7ZNDFGZ1Vb8o?=
 =?us-ascii?Q?qKngAV6oQMp3e1p2DyJjv1al98SPnHd57PR+dFSub8X0sq27H3wcF4seHnkc?=
 =?us-ascii?Q?h+iB057O69Jc3I+wRXhM3YbvokRKdp691h2YomOn84FkuOQ+f/gNU380q5bV?=
 =?us-ascii?Q?dPSEVzRX8ITrPCLLNYK78E3Arsw4etgtXGJ5vnvCGjn6kgxgrOvd6gi19G/I?=
 =?us-ascii?Q?/0yiUL/3kWF6vtYHk1N/1Z5OTIMPmge98MQoj8xfm+zQRPmQmkRJniBrTN6q?=
 =?us-ascii?Q?5iAPohnR/HJRECjkgsydpPlwmQuTgIdR54uHW4N8zysC7l4Ii7ewgfwoElXP?=
 =?us-ascii?Q?fdB0cbQ5yRWZUE1KVeNAd91fERcRN0Moj7T+Ce5wrxImKgtruT+iTmAfbGzo?=
 =?us-ascii?Q?mO+W0pVs9H+vObLpejZ4aGoyXC2JrvIqdby3ipk24X//KAuDXdzIrF6AtV/Y?=
 =?us-ascii?Q?JZlAH9PAuJRDX+M668yBvTZhqLvPrUxIpigh3ce0VHAcba26DEJQIQSlYu4f?=
 =?us-ascii?Q?wvE8YxnkHfFpQX4c1feLL5ZwXwXwcgRrGOhJGtSzskhLM2FYfWAQ9je8rbxX?=
 =?us-ascii?Q?Oa+W8SAl1npjCcQdlBEDAYHbFgsAx16EtOsTFXvwrk2j8KuTzqhTgIJnxdNu?=
 =?us-ascii?Q?YK5Qsp656zVjpZRdozYIwtLA4xDG8/4igPzZo6NMBtQswz3AjviLa5Jf/g0k?=
 =?us-ascii?Q?prl2lLfrHd1aGX+nPZfbMkBJSu2ZIsUuCMzEQ8D1ySMyJjmWXmUyUtdEfE5Z?=
 =?us-ascii?Q?L+W9AqmeKrreKcsWnG1JbNOGM3mWNKhCKt13b7l1oM2pdPVZpCfrSwVKyVPy?=
 =?us-ascii?Q?NNOCF68efc/c5hVbxUDO/SliVOq60TeekurrSviEx1Lr3nDR/HRfHrHFdSS2?=
 =?us-ascii?Q?fQA/nwXF3aVYK9VPRXCdvg4TEXI1mfGgxALkrhoeSlENCSlc1FvaDCpD9Ljd?=
 =?us-ascii?Q?c/Xl6mBE5U+9oGa4q6tUjdpFXReilV7fm0TjESA222ogyMJg4jPe3Op3VvLR?=
 =?us-ascii?Q?NawmC2pctZMG26qSQ1taM1WkmAKW3bCJK8J9IXcARU3RWO3chsbWdutS9lEV?=
 =?us-ascii?Q?ASjlmKVusURV5FUoZyQlKo6MwSsIpdO/QyeYWXxtz0Fm+KnW4S9v2DNyBr1i?=
 =?us-ascii?Q?Ei8gJmSPoqA+ZxnNBnEbxxByyVLLSN1TvtUQ4o2oKEt5u2AACfR4OyDu7GX1?=
 =?us-ascii?Q?qLsTAAVK4sWKN/I2qcL67iUPZRUdtK2gqsY728CQcQnMUg548n67JSGcNzaW?=
 =?us-ascii?Q?4gSpL8bfL9ZK7dXD9QwHBVjQtO6NwJlmSuweYNDz7mVIcvqsxeGg05ZzgPBe?=
 =?us-ascii?Q?5QUuiQU1QOaq96Lh3WA6sw5O5ZsUW1ovjFpYcXDh5Jma88JTa1Cy2/OiBi5A?=
 =?us-ascii?Q?ckx4Ziy6UeRjfGaRiObxUdp1pRNFg6/VD4D6ZbtDNHVDu+9disC+3Q7Br5GS?=
 =?us-ascii?Q?2LHwH6tm8CCR6yhO4Pe9DTipD3WrIMaxR9u+pBV9/wIt1EIjD1nNSMc+ezVK?=
 =?us-ascii?Q?RgwV0hu9IKJWaj96tdANRF/TXDUoeen8vnEVgRZdZHDsC0R9l/bKvuzIJ9jG?=
 =?us-ascii?Q?Gi2Ub1Mpbx6qWGsRCbxcELtkjE68cTcJMw7Jz3qIMCsPdZ4MCPLOAL9Cj+IZ?=
 =?us-ascii?Q?G+jyeZd4mCxv8/f6s4EvL8kR4x+erKDo3Fh66QLFAC8e?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1966bc4-e6dd-423a-62a6-08ddafbbbfec
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 05:31:46.9878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nZroqWRlbYJphGEN/S5dLfrem9Jneg1j/VHSgMGQjmOyuCW585MG3nChuK2Z1MUK6lOSkyK3NgnBj42d7+jXIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4646
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Monday, April 14, 2025 9:47 AM
> To: nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel=
-
> xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH 13/13] drm/i915/backlight: Use drm_edp_backlight_enable
>=20
> Use drm dp helper to enable backlight now that it has been modified to se=
t
> PANEL_LUMINANCE_CONTROL_ENABLE bit based on if capability supports it
> and the driver wants it. Remove the dead code.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>  .../gpu/drm/i915/display/intel_dp_aux_backlight.c  | 14 --------------
>  1 file changed, 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 95b29d9af335..b8b0ace9e6fd 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -499,20 +499,6 @@ intel_dp_aux_vesa_enable_backlight(const struct
> intel_crtc_state *crtc_state,
>  	struct intel_connector *connector =3D to_intel_connector(conn_state-
> >connector);
>  	struct intel_panel *panel =3D &connector->panel;
>  	struct intel_dp *intel_dp =3D enc_to_intel_dp(connector->encoder);
> -	int ret;
> -
> -	if (panel->backlight.edp.vesa.luminance_control_support) {
> -		ret =3D drm_dp_dpcd_writeb(&intel_dp->aux,
> DP_EDP_BACKLIGHT_MODE_SET_REGISTER,
> -
> DP_EDP_PANEL_LUMINANCE_CONTROL_ENABLE);
> -
> -		if (ret =3D=3D 1)
> -			return;
> -
> -		if (!drm_edp_backlight_set_level(&intel_dp->aux,
> -						 &panel-
> >backlight.edp.vesa.info,
> -						 level))
> -			return;
> -	}
>=20
>  	if (!panel->backlight.edp.vesa.info.aux_enable) {
>  		u32 pwm_level;
> --
> 2.34.1

