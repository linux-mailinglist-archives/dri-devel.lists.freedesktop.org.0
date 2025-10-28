Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD7AC138B6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 09:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E6810E5B9;
	Tue, 28 Oct 2025 08:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DETK+wwH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA83610E0A7;
 Tue, 28 Oct 2025 08:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761640174; x=1793176174;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FcQ0/qvWdrbz32Ph2JNPh15tuCWeYtEV0sc4ksBBeys=;
 b=DETK+wwHrRilFGCi+uHlOO/8JXSpp+I6n+76s9mlkFLQYMyxdaN6FQnH
 trpDWU0p8KRticoiyCYM7ECG0oq+dUe/2IOSfC2WAcdOo/dyOsADncNVB
 UPh7EWMy6Ath5XhAxN3scBx0Hdpoiwoblw4gKlk4KXYP0j1zjA8LbsWlg
 Rhmj4lfRUcFjYAjvYXCQtILO1qHX/eesaiIgP40/HH3bgNQKGvuGVMGxq
 +mOZ2RtPzPu+Dw2FTzGf5yTi4hFbk+d2NCii4SxrI5gpL8Dhd0V20nvrZ
 A0wCBbvzsgaT9lid4/ROBUds4aI80UTDOldmlqMnft6C0RfcG0FNsED56 Q==;
X-CSE-ConnectionGUID: zXzQYGPGQgKIBU6ow1P8FQ==
X-CSE-MsgGUID: ULZSP/ahSruHTi4zsSwCKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63633934"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63633934"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:29:34 -0700
X-CSE-ConnectionGUID: Oaj3IindR1KTd/MpQunqMg==
X-CSE-MsgGUID: fmZiu+NVTYyzcj9w4sZ70g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189340408"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:29:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 01:29:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 01:29:32 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 01:29:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyl2lg/l5WIw9mq+AT9ywkwA5QIvlMvvQ5fbpKh8W8ZKyok+YLqfbtXJ1IHcxSWunBXNricGy/mW5VoXRiG52daIb1v+AGisb+jUrjDE43hzaJNxsMLE/fPPc1Skn/pmJqZ+QEtws+lkLX7AwOYrq/5jtsJz2Rlr7n1ECEQgtfF00DcEI9bhtdIuxnS/5D+jAmTCHKkNolXfAUwHAocQ6udjWm594aXUFzGW1i8Bje4KU0vPNzPm26cNZeR8/0XLNFvyppG9VW92/bqVaet+HyOcpv84Xvd3dg+UUj+bbWRBC+gPW1JP2/sd6f3A5AQWpLVKXFO6oou9A8fFXhBYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z50G0VkZ7GDJvk/qouiP86aJkd8jnSXhvX8tqzD0vlU=;
 b=JyQqOwZpsaWhOD5lmj0jL6rnD1I5B3Es36ix8xCW4gNDosm0Qgyfd73k4quQdfRnyT7yD7NyZW7IqOQe05dC4XSBJgaMXyMvpg8pQv6cpLqUjPyFi8JpI5tmsxYZlLbh7H7sj+4ngcGmfWf3e9R6aa+/bDYI5mGj7eFI1+eUdsFz7TAUCLahnvZg436ccVwormZpMh9EVbHpTwHyGXbJtGE8L723Xg/QjcXsF3Rv5pf7URHCWlb6dVQQaa4bIr9awmMSiNd97Mp6R5o/0M2Om+/B+vwukdqzmoQ4q20Gtz1fBPHkpPXnDOg6lNUNp7kcP1ARh7TgywS7mBP0GhstoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by LV3PR11MB8505.namprd11.prod.outlook.com
 (2603:10b6:408:1b7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 08:29:30 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 08:29:30 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Subject: RE: [v5 21/24] drm/i915/xelpd: Program Plane Post CSC Registers
Thread-Topic: [v5 21/24] drm/i915/xelpd: Program Plane Post CSC Registers
Thread-Index: AQHb6zD+v1e2iZ5J0U6tgVl8dEo7lbTX8rQg
Date: Tue, 28 Oct 2025 08:29:30 +0000
Message-ID: <DM3PPF208195D8D47AB719CD10C0353B5B5E3FDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-22-uma.shankar@intel.com>
In-Reply-To: <20250702091936.3004854-22-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|LV3PR11MB8505:EE_
x-ms-office365-filtering-correlation-id: d19617e9-0c05-4c6e-8017-08de15fc1d86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?tWXA2eUs6yfdjtZRLz9S++TNDCNhPiGqpMNsoZlCT3iBNL2uHcY4Iyvudiuy?=
 =?us-ascii?Q?YmliFPMLMi2MpjBot23yHWlFs30/hMykvQkI//05GAYkw4MAzGkpfvPCAz9O?=
 =?us-ascii?Q?tYKVX1ibLBBH23OoVSPhqYEkLJDR8gG4Q0sVMkPte0+6XHC5zP5bB5fjvB7U?=
 =?us-ascii?Q?kb/WLwDGVwoMeRUirT6vXL6AxxmsTYNhQPfjTksPPciQgH7Ff5/JXU+1uFJt?=
 =?us-ascii?Q?W2JBfViAGrl32/1HyCrwWFOyyOMnQfwuWyhV0zpzr/hDYoABWhpvOH4qslUW?=
 =?us-ascii?Q?E5NCJcHAhOK+WKbjsXqOwXQIifVX25nIXShNSdig96hp36yMqAbOxENksg2l?=
 =?us-ascii?Q?fpdPs3ION8qtBSBrI3tBol23CtEe5teYw/8wTl45A3lZcwXpTU3sIYGHTKSZ?=
 =?us-ascii?Q?KMXRMlw1k5WoGJTZuu/fmSb66C9eON0ViaqxjttfMU7Z3Om4nLUQLwhzSGKy?=
 =?us-ascii?Q?v1BYebfxzdz9fAGg9edP1d33fzX7SeGDRl6tpjbQ+vKvO2r8QGDskMl2r+EU?=
 =?us-ascii?Q?68kxCxP+FYF/8N9ipjWMO2i2pZrMPynCqKCrM3uCiyWScL4we6DxsoHo+GNT?=
 =?us-ascii?Q?tFgxQrJ6InQQbjSj2A0R7Xz1TW1oHgrB8bVLBba6l2tN8KzIQnCD+HXmaq8U?=
 =?us-ascii?Q?2wwXJVGomwLTg2dNw/idkYGSAsRnbiHPYTTR8+It0TLWGlm7V+J98yKcqsNP?=
 =?us-ascii?Q?XP1IbaA2/PRikAl9FtvxSebR5d8TtYjFerKK8GUCuLwHJN4qbe4bohisC8UA?=
 =?us-ascii?Q?RF9e+AA+7/a44QqytlftBb83VdDFvedvcnkKST68mrN8FLoWQtodUsC7skkK?=
 =?us-ascii?Q?v5gK90VrO/puejle7zTyilEQbe0u07iha+QmMKA1WZdRB2iL2SG12sY//3Zz?=
 =?us-ascii?Q?a8Hjd5xAdIWjc8N6DQ3G3h9qRGiQmi09Qz0tPEs7TI/p/V7pg0DErw7EVQDM?=
 =?us-ascii?Q?lOlNA8hN1pYwU60OCC0iL51i50vd4D39OxPCnF4FtjQwP+3gEy7zICms4/fM?=
 =?us-ascii?Q?Sz84v9t1ypkbgy2gdVh47z7bnshqTN3fLxGFlREXCNUNyJm32nwJZw9xKe2P?=
 =?us-ascii?Q?YUnsc9e40rivsMDOQ0NThLX/5fWJ/MCtbWXGZYcvHqP6woe8+G7mEWTukmqS?=
 =?us-ascii?Q?pzqp7YRP8nUD73WLpwL2/ZUIw4izOB1CwgmxmN6zfhwR84AlK9jTa113xBsO?=
 =?us-ascii?Q?VR0Y9D/RI3s+Zp0xAmHtzzjXMx+S6NcRWtOshyoiP0MqA7PzeGDN9O7Zxrps?=
 =?us-ascii?Q?LCOFqy5aL3q5KfSsR9K53TsnCaPfcTHURlL1TUa6CItfH9vclepeBsNHdlz1?=
 =?us-ascii?Q?2nNn7bPRj+lEYQJYBNuloazgifqt4KPTcDJgt9As4RkqgHROdZpbktKLZcGf?=
 =?us-ascii?Q?tzfwrKINXQDSRvzL6ISwumAUzG4pg7y68JPIFT02kN4BsGD7sg/UrIfrwEQM?=
 =?us-ascii?Q?ISAFOGCeadjm1pwj0C9qQvA7R9wJLlQoGxA+BPfYhcm7Z1mCuUfNbLOEa+2h?=
 =?us-ascii?Q?uNhy5LPVqSARyz5S9ssPZEi8S4Lk8/1NqbS5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?enG0G1AvuiRl6uAajP7Yg0RUGQbTts6ULz3ntg4qd1N4fWFCq4/fQkVIu7Wu?=
 =?us-ascii?Q?5KLYln09HdtJyjixRQnnNbC+AJ0bD9xq/HYOL+XuLCuFvbaGRTCHBC/cDd9h?=
 =?us-ascii?Q?i61zLHfwvKTaF1VhBFj9/0DmOELmTFR/bBl/S0ZV45DnxU2Sibf/gCmKwMJk?=
 =?us-ascii?Q?ZsyBcV6KKmnu8ioXMo9f4U+A9autXzhEw06wY8AiVoarymAPh0npDmaXz47M?=
 =?us-ascii?Q?Mdkpgz8z20/lQHpGlFvNg6VShaSCaY3zyO5pxcXKFoleenTlvuwwHdO6RW43?=
 =?us-ascii?Q?9ZVWlJ0pLCXYltN4sppEN6b3SooPyhsQHIHoepYnIACxJkfwvq2sUBdIE3Fi?=
 =?us-ascii?Q?DhSK+0dDOgJQrmfN3pmYrYJEtynCfpto73miG4bP1+nOVBdw9Cz7i/ojk92L?=
 =?us-ascii?Q?DBQgnU5X/r7wNgLkXjiq9BUNzXop9eoYnwNi0RDw5vrzGbCqpCpgRnja0l6M?=
 =?us-ascii?Q?bhSNbuWkpWyZtBZ41jxVG6e6IQSP38y6IJQaHQOJQMqQ25CnzI70GQqoryY+?=
 =?us-ascii?Q?YW3owmdjVUEQ2tbzSAaTcuAMroAqKBfUwbeDx/N79TBzXxJ2bcp7Vj56LaTV?=
 =?us-ascii?Q?SW/gAw5MxrtQ2LiroCBMTfgeqOpcBDYownz3oImIbVfEIR712Mx8qm1QP9Ls?=
 =?us-ascii?Q?zA9THhOqIKTCiUiLb0sI3DjF3XysMrmMQ3Aj6lT967xzPknaH6szU3ei0nRt?=
 =?us-ascii?Q?rEWQNMPBlBbpZdQ6zepK6wabep1AWNEMajjtI2gnZxcgZXACvMJIj0VoulPH?=
 =?us-ascii?Q?i9+vUAeGGP0kgiItbLHLUihJcfEGRyscr0lDyCHiibDNa1ieGCZc40R/QnMZ?=
 =?us-ascii?Q?NqsecZvhejRkHdvCocgY2ftAmUJQBfj5Rb5usUR6z2mkyzC0eoLIUvL382Xr?=
 =?us-ascii?Q?fFCetAGhCTKon0fbug9duYlkqo1Z3J437Vb/yQmn01lRbzHODJPMbIpN/olz?=
 =?us-ascii?Q?zAnPg8jvAGlJQCpPvZ4N15uqVxOQBvwUJtnBpmVmN85bb64c+Gfy/NoNbcWY?=
 =?us-ascii?Q?URiacqwaV3i/5Ue66REBkqAlHiQ60mRRgcFU0kVEa1/UNUji1PoGPhDVEEq0?=
 =?us-ascii?Q?gnEMxhSv72xyqUPcfwzVBHevltpb5A3DQhzS3OUN42iRBPonGCxjf1B8VSP+?=
 =?us-ascii?Q?S4imNUlj8bYVMFvE0xvrOHHA9GbGivm1EQMGIHi0fBjALb65ytJ4fWgxGlCY?=
 =?us-ascii?Q?RjrTP6BDGqxe3PL6hptd3fRcd2EBkxf3ylw/e9kyzcYVo7ScVPSo4/snP/AM?=
 =?us-ascii?Q?P596mQzXbWZSiI/ZM6o5crzVeisnOeFSMlVvIn5zIGtHYh7IuIMDvXlMqkna?=
 =?us-ascii?Q?c3PDpkOTXzCbEwRJSdHXEPCn0cujj+fj8or/rOxaQSemq1vkQbuLp7+goIs3?=
 =?us-ascii?Q?30fupXKyRNpi9k9KxQIvAGgjZZ2/0TR1hn17jaczfic5J0rDS2LnvEhbIugb?=
 =?us-ascii?Q?HM1l63osNRWlFucq60UQl/k58uKA9jn3+dQxVWLWJENgHjKpvhB02ByWEDKI?=
 =?us-ascii?Q?RhnhuhwrF6/NcA0bS18Yzw4VZIBCjjPhiAwcme7BlRWxVMeFN6BklxVtTcjU?=
 =?us-ascii?Q?b22UqraYLwAwANu7FuRFqV/nPmi3lR9qDw5AIYDY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d19617e9-0c05-4c6e-8017-08de15fc1d86
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 08:29:30.3672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: POIxojWtibDAOGi+7Eg88dv+yjUlaLNwAugTWa7UbBGcTHFY7B5Jb5Tg6WSDeVLBDbufYUv4ZSR3LTB3aKp5jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8505
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

> Subject: [v5 21/24] drm/i915/xelpd: Program Plane Post CSC Registers
>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Extract the LUT and program plane post csc registers.
>=20
> v2: Add DSB support
> v3: Add support for single segment 1D LUT
>=20

Add Bspec link here
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 123 +++++++++++++++++++++
>  1 file changed, 123 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index 75981fe232bf..689bc4f4ce25 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -4041,11 +4041,134 @@ xelpd_program_plane_pre_csc_lut(struct
> intel_dsb *dsb,
>  	}
>  }
>=20
> +static void
> +xelpd_program_plane_post_csc_lut(struct intel_dsb *dsb,
> +				 const struct intel_plane_state *plane_state) {
> +	struct intel_display *display =3D to_intel_display(plane_state);
> +	const struct drm_plane_state *state =3D &plane_state->uapi;
> +	enum pipe pipe =3D to_intel_plane(state->plane)->pipe;
> +	enum plane_id plane =3D to_intel_plane(state->plane)->id;
> +	const struct drm_color_lut_32 *post_csc_lut =3D plane_state-
> >hw.gamma_lut->data;
> +	u32 i, lut_size, j;
> +	bool is_single_seg =3D drm_color_lut_32_size(plane_state-
> >hw.gamma_lut) =3D=3D 32 ?
> +			     true : false;
> +
> +	if (icl_is_hdr_plane(display, plane)) {
> +		intel_de_write_dsb(display, dsb,
> PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
> +				   PLANE_PAL_PREC_AUTO_INCREMENT);
> +		/* TODO: Add macro */
> +		intel_de_write_dsb(display, dsb,
> PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0),
> +				   PLANE_PAL_PREC_AUTO_INCREMENT);
> +		if (post_csc_lut) {
> +			/* Segment 0 */
> +			for (i =3D 0, j =3D 0; i < 9; i++, j++) {
> +				if (is_single_seg)
> +					break;
> +
> +				u32 lut_val =3D (post_csc_lut[j].green &
> 0xffffff);

We do not do a declaration like this in the middle.
Also I would suggest having it declared higher and zero is when reassignmen=
t is needed
since it seems to be used in almost every code block.

Regards,
Suraj Kandpal

> +
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_POST_CSC_GAMC_SEG0_DATA_ENH(pipe,
> +
> 	     plane, 0),
> +						   lut_val);
> +			}
> +
> +			/* Segment 1 */
> +			lut_size =3D 32;
> +			for (i =3D 0; i < lut_size; i++) {
> +				u32 lut_val;
> +
> +				if (i =3D=3D 0 && !is_single_seg)
> +					lut_val =3D post_csc_lut[0].green &
> 0xffffff;
> +				else if (i =3D=3D 1 && !is_single_seg)
> +					lut_val =3D (post_csc_lut[8].green &
> 0xffffff);
> +				else
> +					lut_val =3D is_single_seg ?
> +
> drm_color_lut_32_extract(post_csc_lut[j++].green,
> +									   24)
> +						  : (post_csc_lut[j++].green &
> 0xffffff);
> +
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> +						   lut_val);
> +			}
> +
> +			/* Segment 2 */
> +			do {
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> +						   is_single_seg ? (1 << 24) :
> +						   post_csc_lut[j].green);
> +			} while (++j < (is_single_seg ? 34 : 42));
> +		} else {
> +			/*TODO: Add for segment 0 */
> +			lut_size =3D 32;
> +			for (i =3D 0; i < lut_size; i++) {
> +				u32 v =3D (i * ((1 << 24) - 1)) / (lut_size - 1);
> +
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
> +			}
> +
> +			do {
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> +						   1 << 24);
> +			} while (i++ < 34);
> +		}
> +
> +		intel_de_write_dsb(display, dsb,
> PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
> +		intel_de_write_dsb(display, dsb,
> +
> PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0), 0);
> +	} else {
> +		lut_size =3D 32;
> +		/*
> +		 * First 3 planes are HDR, so reduce by 3 to get to the right
> +		 * SDR plane offset
> +		 */
> +		plane =3D plane - 3;
> +
> +		intel_de_write_dsb(display, dsb,
> PLANE_POST_CSC_GAMC_INDEX(pipe, plane, 0),
> +				   PLANE_PAL_PREC_AUTO_INCREMENT);
> +
> +		if (post_csc_lut) {
> +			for (i =3D 0; i < lut_size; i++)
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0),
> +						   post_csc_lut[i].green &
> 0xffff);
> +			/* Program the max register to clamp values > 1.0. */
> +			while (i < 35)
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0),
> +						   post_csc_lut[i++].green &
> 0x3ffff);
> +		} else {
> +			for (i =3D 0; i < lut_size; i++) {
> +				u32 v =3D (i * ((1 << 16) - 1)) / (lut_size - 1);
> +
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0), v);
> +			}
> +
> +			do {
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0),
> +						   (1 << 16));
> +			} while (i++ < 34);
> +		}
> +
> +		intel_de_write_dsb(display, dsb,
> PLANE_POST_CSC_GAMC_INDEX(pipe, plane, 0), 0);
> +	}
> +}
> +
>  static void
>  xelpd_plane_load_luts(struct intel_dsb *dsb, const struct intel_plane_st=
ate
> *plane_state)  {
>  	if (plane_state->hw.degamma_lut)
>  		xelpd_program_plane_pre_csc_lut(dsb, plane_state);
> +
> +	if (plane_state->hw.gamma_lut)
> +		xelpd_program_plane_post_csc_lut(dsb, plane_state);
>  }
>=20
>  static const struct intel_color_funcs chv_color_funcs =3D {
> --
> 2.42.0

