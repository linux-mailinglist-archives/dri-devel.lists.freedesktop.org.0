Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D51539482EC
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 22:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81D410E2A4;
	Mon,  5 Aug 2024 20:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fC518jsS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99E510E29B;
 Mon,  5 Aug 2024 20:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722888605; x=1754424605;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bKmghZSmn38MHO7mHpE9nomdb4lS/kDgt1qmMGlgrac=;
 b=fC518jsS3blkEnRm9riDSDHTPWEy0rFysVukUO8d9cKNANo2T0ZfGako
 eSwtfZNWiPsIdPAWUzsLotjSu+3F33R36sKUZykVSVbKDBBYG1+xaImhX
 KMcH9K2QyHoi5H3Iiyl3y09y5edqVE2sSDTKnjBoCwjcqeF50LnY3eZvA
 mYdcSYgG9KJsREJ+gchTz5ljG3qeRLxeiy8Ski4WlnxDorhUOudG/CaYv
 XoUdMAQlYHxyKoTCCJCQPkR7rPSzEIsAC5ss1INuUyrL4xvywfrIahzfC
 WBck4ANUl7yspcNduWzJPFeSt5niyEFzYAnYilcj5kZJDjrC27D3qRFnM Q==;
X-CSE-ConnectionGUID: KzrozNUiT9yJKq4LPanW/w==
X-CSE-MsgGUID: jq1Ibm6JSoeYhjhKWlwmag==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21038804"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="21038804"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 13:10:04 -0700
X-CSE-ConnectionGUID: CLmOtGCSTXOxakEbLdu5mg==
X-CSE-MsgGUID: WhgGFnrMSgG0X+Wc6vxqWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="56990048"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 13:10:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 13:10:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 13:10:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 13:10:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 13:10:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8prEGU+IdVBXgtG9DGEdlzbSCtO+vuhoJDSEexYb6FdmILlKOYT563V/8NwIqPqGXCpXS+4X2hvXAWkArAeizwwLLXmTUInbUG4QITuL6REAkY8W1335uciQvIjjoi8TorJU4HQMSaM35+t2FWRiKCbUY7pP4vSe2dRKyq7GILfKSzOl7xUhMDLJFoAx51KUwkqiw/sXeKMeSQjaqOSAdt5UIXRBPEHBuua94NqihPFGwr7RAyfh1kszlLYdWrIpl5ONVn7LcNNcFNIzjCh5JFDOweYGHHnRn9R4MQY04KGPhqZNir5myg+0/xwdURtyKiNPZRHlsbTyYSg/+IkqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o18pl3PAAxIEP8Ox930OUDtEaPJoUc46zmQCAuFsJ0Y=;
 b=OtPIHbNUpdLIzY51rrYZIZpDoPeE7Gh2wG+fNwQM7m6V5uaH5UJzVjSFQASADwWkYIglnbEApU+hJx6SkasLdxBjwcWVBIm1ajh9WVAHZlv2/Wd8Bit9ckxxbNUmyAcaGTZYSdfCiJhTnfkntqPF01lXYR/q4Kfh7WIdnFn1kwy32nEcQcmFL67IG0OJPyp1bIu7Cv+VZkSBJJTxbPdRTH2r/bOMofYIJHt+GDG99eLNN6LEbqkostFEb1Lu227Tx+3vtv7YF7xRNFBRs5Kmj3DYUOjmubISLxf0tCKqYrwB7HRpw4D95/dHwjO0Q0BVhc047IiWzvsSnhA5UMUO8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6146.namprd11.prod.outlook.com (2603:10b6:208:3ee::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 20:09:59 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 20:09:59 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: David Gow <david@davidgow.net>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, =?iso-8859-1?Q?Ville_Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/2] drm/i915: Allow evicting to use the requested
 placement
Thread-Topic: [PATCH 1/2] drm/i915: Allow evicting to use the requested
 placement
Thread-Index: AQHa504TgOim8MJLJUypjQ1HsYJDfrIZF3iQ
Date: Mon, 5 Aug 2024 20:09:59 +0000
Message-ID: <CH0PR11MB5444F85A91294D2C9680CB07E5BE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240804091851.122186-1-david@davidgow.net>
 <20240804091851.122186-2-david@davidgow.net>
In-Reply-To: <20240804091851.122186-2-david@davidgow.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6146:EE_
x-ms-office365-filtering-correlation-id: 0bb1942c-e66e-4f12-30bf-08dcb58a9521
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?YMtL26+I0rTnWEKR94rchYvAixtriagPK2zXUqCH31oUAYuLqwz/gt7F/5?=
 =?iso-8859-1?Q?oGkMenF83XCu12qbEHR8F15OtwWPs3NjPW9u3Ch4PcHBr5MOr+rrqrTb+W?=
 =?iso-8859-1?Q?c8haa7g0GjVSPhz7cCZTUv8h+JnI6Gz2LWvQPKBSgoYDmYfeCbPYo6vtO0?=
 =?iso-8859-1?Q?yOmDAAWVuAeAQ0AI8S6s/Et8geGpmsyJqx/2BpwuuEbZTpjNKhe5QpOyvj?=
 =?iso-8859-1?Q?+UYQnqVsJWZxLqm6ZPk3SBl4jJIseYYkwaiKsOuQwE7++gWVOVj2M3Zqgv?=
 =?iso-8859-1?Q?RZTd+Lh66bdbduqw5RWjuweT9Wxc5Z3HreGxJZrm+3ZVusg5ZDpJWDuLgR?=
 =?iso-8859-1?Q?yJ9MHQAeZOUu7bg15L3Qicp/MMFZZSkAMY/qSDAWuXYYZzQ7aJrOBfMgnP?=
 =?iso-8859-1?Q?3KMuLMYt+Q8+/FIy4SpajmYiaK1FhekgB3srUSynWwX5w56Jksyyex1gE4?=
 =?iso-8859-1?Q?GBi81Jk/wngsIEMT8k4CAUu9arFzrKS6hbEIVBfZUXbueKLGDUJCgVKYFM?=
 =?iso-8859-1?Q?lvyFJG2CB5gbGBEtAY09TpMEnbgLXwlPessTOhZXsa3Moazxv8J+CfyAgz?=
 =?iso-8859-1?Q?CNBO23X+y7FwTG4SNDzsH3cdShfFG1oGxnNkJfNbA7Lk+XVQVHrfYLs/j1?=
 =?iso-8859-1?Q?GzXvMywYjvyr7D4BED4gw3ZBMKzgY4uGUMwj/RVX6y1tI3tlOq9nYf9BtU?=
 =?iso-8859-1?Q?q4suEVRLxcG+c7rgD9TSPfkOknuV+8VkvrRpv0u0Ip5RbM5gVyJq/OrwwY?=
 =?iso-8859-1?Q?XAvZ6Uigl9mflaM4yaXZVnkLv9KknW5kvgmKIv4YknFtMgwFvttP+Yduhm?=
 =?iso-8859-1?Q?4JfyhkfEEaIX6OAC9tMa7QkVHKllysAPOGyCCvZf3hsf7jW0JDPnhsQofu?=
 =?iso-8859-1?Q?SKf2fRPNRDJUnhGVBsX/fiyb9zLCA4KwwE6IAq6q0Ijt7CZ8sXu5VQGx83?=
 =?iso-8859-1?Q?yCIeupKDQQSC/2GwX/TPW/k1wa22HYAnxJL+gOHvt6AoHtpYSBqqujBtTz?=
 =?iso-8859-1?Q?tE72Gms/iJyln/mAclj6THDwy04+jEcqhHNtZF8TypPacGuxMRyiXmiZZ5?=
 =?iso-8859-1?Q?YL0IXW6n4XFZjvq01BCAj4kOhGFmZauMyIrORn7jR43yQs6Cuv1hD4xrsH?=
 =?iso-8859-1?Q?pux/Lu2UajAOdi9bz13TC+AhHLi7ECA93SjDt0PaHhs0w3QfSXPtwfumEk?=
 =?iso-8859-1?Q?Wx2hf39plDqZVZMkNTnZqwyVGjRas3bxaUvIap/u6zauTLCr0OnbIxMfQU?=
 =?iso-8859-1?Q?nLW4XTuN0Ty/YnSVJstV0y7OtRtwGicXiGLqbA1uhCH21bQrVTc7+loRhy?=
 =?iso-8859-1?Q?qaA4dYSGJJHNElRYjc3BfVVMJ8XwUzIil3rdkniPUGh2ElJ3HwYm4hvE4h?=
 =?iso-8859-1?Q?qE1IQq73ix4NmM9MhzH0V830nThcHyBpq6mt9A7mALEc8Zoldv8jg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2LPsFV3mzf8yo+PJ63p8wa0pSGhepQiXLV7cXUZOCT7cjUub57Z9yLKHbW?=
 =?iso-8859-1?Q?sp6NTleGGIsIh0l6keaTmxdKzRSF+fXB1iME245bGNALLIxvi6sd6a+0h3?=
 =?iso-8859-1?Q?WnbK0jG8jUHu8k2yCVaymu/1xPGCC8l4Ubk5Q5knFnW/oXGa48Qwrjoshk?=
 =?iso-8859-1?Q?AcvymsWumKYOWo9KyqF9JtYGEV7TXI2i4Up88e7NKEybi1RejgIIrdJ/88?=
 =?iso-8859-1?Q?y5S2CkpBbQ9pixCLgoQHiGeFADlmUTvhWZgbbrujdH7HVIk9rCKMi/B+V2?=
 =?iso-8859-1?Q?AJ8FsKM4lR2cnAftqSAIFoA1weD/8fKQ+gWD+mjWs3r1TSBfSpSipODjyi?=
 =?iso-8859-1?Q?5t6hQHFecvSSJ+prH8Ox/4NLM0tz+B1H0Pjv+TBHGSTNZjq53ZyZ+jtkzx?=
 =?iso-8859-1?Q?NvMU4Sb4YWJrd7jsUGvA7rBEyl9VhecEUf009tmgfArKkhuNAXxSi5hsav?=
 =?iso-8859-1?Q?jcW6Gg3prgO/0Y5juMRPpgfTbuizoyawnp9McAjq+/0F+e8GrEtKibtMkR?=
 =?iso-8859-1?Q?uDjkLHYe/ii/e6pzP9AHMvA+BtqqZ5pePBlDQNoLu9cD/7p9neAiiVRX2U?=
 =?iso-8859-1?Q?ISEGnv0KIhB0gaZQvEeBKbh343Att5ZTYaiXHQ44igAEAJppGWJ6dHtvsQ?=
 =?iso-8859-1?Q?hZ4b3e0BKHSLitDDEDiX3soHCFatSbn75ovYnWsr033WgaGrdmYMTlklW3?=
 =?iso-8859-1?Q?9UTVvMHu40cFitarmH/eYUCO2mk0ZVr/y6PiBBKZSBUZBY9UuUBS4a/ngw?=
 =?iso-8859-1?Q?n1V2ssMqN5ilfXSFpiR23oJ5VWvV6YyIJigyEaMWVuHFwf+gW6SU4Piw/C?=
 =?iso-8859-1?Q?r/nSfygwGdWkup2domd1dJAmKfk8bE6jr5QIzSSirH/XN3k2HNIBlTIsZU?=
 =?iso-8859-1?Q?eKOYER+ftdlQDAdP9jqADNTomPAU5UdnO7FdzOa9fxXw8JpvpT8H+zYrOK?=
 =?iso-8859-1?Q?qFpRLv3vH840C/ZXpc1vtyr63bQQ0gcaR0IgAVafwlvkttasPoVf1WrHoR?=
 =?iso-8859-1?Q?BZE8PKO/rDvYxV4UFNB6/rorMb3U27s1mBZmzQzUxcqdBhM5ga6YFLyANH?=
 =?iso-8859-1?Q?p1eKFidRCubRXukd7H7i/9kcrc+RvQt+182mkSRN739+VsACZ8PdD6MVT8?=
 =?iso-8859-1?Q?rwYzwMEEygVtzDoP8nk84Q3DNUTe/6p01sYhMP17s9suzPUfEUfG2+vJ/n?=
 =?iso-8859-1?Q?bs21SeLA/eKzQInEh0JcK1zwoxwk5Q6eIq+11p03BxSZnse1ZgrKj4i8Us?=
 =?iso-8859-1?Q?QOSmkPXuc+fu3fpXwUGvPqZr/0FS+Jjmy7kgmA/TlAl4qSL5ceR1SuOQhi?=
 =?iso-8859-1?Q?MtD+BUA+5a7RpP6wtn49m1v7+FvPUuateGsUaobDnVBSQa0Chs+WFOJZr+?=
 =?iso-8859-1?Q?BjtkjrOj0wWB99aIzJFG7BLRPJkD6XK8756o4XFRF8gt+NkohBLChus+NE?=
 =?iso-8859-1?Q?OTq7NoctByM2dV2t4YgnHzz3mNPrHtggVhbrPfqZbEvLGTprl+HTYcWQ55?=
 =?iso-8859-1?Q?Xg/lQgODD8aPdSfcox9v8lrWBOEm2bWH3nCEA7RC+e6EJsDx+C0gk7eBxi?=
 =?iso-8859-1?Q?CyoXgYURcNi1gDnJlBJ/gNgbbzEM4fBha8XzxnGcg4V2RzxKD/7W696tD5?=
 =?iso-8859-1?Q?86B/GvRhp/KlQ5m+ivyCMH7tEcuoHgNbV6?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb1942c-e66e-4f12-30bf-08dcb58a9521
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 20:09:59.1740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fe1KqesmTevPdQ/5Y+HZ4MxfJN+VfU9jonrDuKmvGzL0JR+N2HQRKLbHnzoOkaDnMbKCg+G3M/6YQ3ElF3ewY45HUjSHOp8WsPYkMSTnidE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6146
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

-----Original Message-----
From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Davi=
d Gow
Sent: Sunday, August 4, 2024 2:19 AM
To: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>; Somalapuram Amara=
nath <Amaranath.Somalapuram@amd.com>; Thomas Hellstr=F6m <thomas.hellstrom@=
linux.intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Andi Shyti <=
andi.shyti@linux.intel.com>; Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Gow <david@davidgow.net>; Jani Nikula <jani.nikula@linux.intel.co=
m>; Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodri=
go.vivi@intel.com>; Tvrtko Ursulin <tursulin@ursulin.net>; Ville Syrj=E4l=
=E4 <ville.syrjala@linux.intel.com>; intel-gfx@lists.freedesktop.org; dri-d=
evel@lists.freedesktop.org; linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/i915: Allow evicting to use the requested placemen=
t
>=20
> In commit a78a8da51b36 ("drm/ttm: replace busy placement with flags v6"),
> the old system of having a separate placement list (for placements
> which should be used without eviction) and a 'busy' placement list (for
> placements which should be attempted if eviction is required) was
> replaced with a new one where placements could be marked 'FALLBACK' (to
> be attempted if eviction is required) or 'DESIRED' (to be attempted
> first, but not if eviction is required).
>=20
> i915 had always included the requested placement in the list of
> 'busy' placements: i.e., the placement could be used either if eviction
> is required or not. But when the new system was put in place, the
> requested (first) placement was marked 'DESIRED', so would never be used
> if eviction became necessary. While a bug in the original commit
> prevented this flag from working, when this was fixed in
> 4a0e7b3c ("drm/i915: fix applying placement flag"), it caused long hangs
> on DG2 systems with small BAR.
>=20
> Don't mark the requested placement DESIRED (or FALLBACK), allowing it to
> be used in both situations. This matches the old behaviour, and resolves
> the hangs.
>=20
> Thanks to Justin Brewer for bisecting the issue.
>=20
> Fixes: a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")
> Fixes: 4a0e7b3c3753 ("drm/i915: fix applying placement flag")
> Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11255
> Signed-off-by: David Gow <david@davidgow.net>

Thank you for the thorough write-up of this issue.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt
=20
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index e6f177183c0f..fb848fd8ba15 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -165,7 +165,6 @@ i915_ttm_placement_from_obj(const struct drm_i915_gem=
_object *obj,
>  	i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0] :
>  				   obj->mm.region, &places[0], obj->bo_offset,
>  				   obj->base.size, flags);
> -	places[0].flags |=3D TTM_PL_FLAG_DESIRED;
> =20
>  	/* Cache this on object? */
>  	for (i =3D 0; i < num_allowed; ++i) {
> --=20
> 2.46.0
>=20
>=20
