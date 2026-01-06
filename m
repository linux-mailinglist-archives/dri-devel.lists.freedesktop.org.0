Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3B8CF7EA6
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 11:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C54510E4C2;
	Tue,  6 Jan 2026 10:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cb9NlGWU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AD010E3B5;
 Tue,  6 Jan 2026 10:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767697042; x=1799233042;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6lJWzm57w9wBgofU17rU/XWsz7ngMty60rOsXGdOkX4=;
 b=cb9NlGWUjWbm0uuV6SN62mai+nrMrAWIlcsTRQrsfG+RZNzw8np6u4Tk
 ubnPbMsgOyq5IKfvqY5qY46WEhP3QhlVQOzdtqhFUQDSpsQLUoHO0AUa3
 Fvf1ybex42cTpwxAZsjSnDETwChP0NcCpmvVTnNJrs2EJ+2NNqRpZj5oo
 BqbYKuUUjlHPA6ibRl1mc/xa/0tM4FtRajhMzO8t/vmOD4Evv8FBpRQcg
 bRlB5QJ55gijD4K7j/ktM6/JOMzmN4v5KrLa+fhe8hfwfCYWMw6NKSheW
 //wiZ1BzoLZTLtqU3lx1Zj3oyas0asJoBrxQyi+KgUYTstptQQuuAO3Cw w==;
X-CSE-ConnectionGUID: sbcOxxAiRn+eK+JTSvAtjw==
X-CSE-MsgGUID: 1jpDP201SCil2pFv1TIxvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68071887"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="68071887"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 02:57:21 -0800
X-CSE-ConnectionGUID: ja9BX8K5TZevR5mPh8w+vw==
X-CSE-MsgGUID: /1UTW2qwRaKg7i/gyuCY1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202401666"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 02:57:21 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 02:57:20 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 02:57:20 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 02:57:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lyk0+hXcBqpgff2wXoC6qGdweCuZ8whnkbrYzttJsE2Ec8x+2+EgX27bDN5LEvAWtL78NKcZ8KNY0qx5sUkGVyM8VupKqSPf29gHVXjTKduP9i9nECpQVOXhXFVB7EDjH/25mKqRvj0jDOWDKv6k8fivDc9EJ6x4/FaAxeI23kuMQ/bLBlBE80HpC7PkOkQfkwi6BKwd2gn/PAyB/bry2fZmwsXRQB3WBN7J8RtRK2kN3cUBMC4nElhccZDbaIh1+fpfgOHcweBb4e7oCdUXlu+jC2fEkfqCZpuXHHbQcbgfjdnwn/W8NvKXxVXrXo+NXXu1RoD9hDTo0BfFwCHc1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lVBZgGy75n0JTzO3OHLFhUe4TyMgbz+mL3BXlT8GGQ=;
 b=bDRGPp2VfARQMBUvFJ48G2Z9hLU3KWzESc9ibwcFtwys1Nni/bO4LBwQeKSYomBIAcumKJtPoSI55tRvx2bIrIOaGWtOhvBO0VupMGveXXXPm84p+45iUQlnK7ktmyvHYA/DgM2EsFbvpb6kHDOFB8mihxf7+CBuo9p8kQfa/mqNk5spKyeEgF+gWZ/9uJSYlSu7jAqNnFNTArpZyJsBd+ngkbG8huu/cWfuN6bW0xag9JlECWxj1np/n4EBdCq4ZnRGBMUzZmb2FCbGxcEaU0cjywP5udj7BGeiYoJ/8x10LIjxpsXle5MJ5hxa7qKwvvQSJ25kvXJzLW2vZX/RZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Tue, 6 Jan 2026 10:57:18 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%4]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 10:57:18 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "daniels@collabora.com"
 <daniels@collabora.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 03/13] drm/vkms: Fix color pipeline enum name leak
Thread-Topic: [PATCH 03/13] drm/vkms: Fix color pipeline enum name leak
Thread-Index: AQHccLbz8sBguwSOzUyBMxwBEV36+7VFFNkg
Date: Tue, 6 Jan 2026 10:57:18 +0000
Message-ID: <DM4PR11MB6360BB46C2DD4500C49EF174F487A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-4-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-4-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DM6PR11MB4595:EE_
x-ms-office365-filtering-correlation-id: 64d0098d-09ec-44f1-a42f-08de4d125c0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?r/IJcUqBOlOg19u9FqPQ508O9OX3BJsHoaoQ1u7zDflRXW3bNEClwWUdJEMK?=
 =?us-ascii?Q?RcCgJq/kaA0M9lZ7OT8wlP+YXS8Jwfl7aKhilVBBwtfKyugvPYErNy8KaTfx?=
 =?us-ascii?Q?p23J0ai/Hi71Hciy+Ko3DZEQcc61qFVW87trPBIcMKCashH06Gj/61J4GPSI?=
 =?us-ascii?Q?Sp7N8Q6phQgYW2LteXUjLeYFQAbwrzbqs/rg3FVWVRDJeXKngKsXANqaN52g?=
 =?us-ascii?Q?H5ww7Rn/EKKt8OzzqaIE4VplqXUS5VR0OW4hKa2+dWV3vBtERRH9Y2WU/gH7?=
 =?us-ascii?Q?sCL0av0M7bYdP17zNYU/8+3DYz/giU7dkuoq3NPEmKi28UWZ6+LoL2yUThu2?=
 =?us-ascii?Q?PbLIsHRDoHdpzYWtPvhyW8hTNcfoY56A1h0W+krw8V5B5h/H2wDP8QooYL0X?=
 =?us-ascii?Q?5uPqICZ3iXrbyJvfGqwif/ZDDqEoaHjqnB6EwWds0GOzYjHNM9NhwqrR+c61?=
 =?us-ascii?Q?162t68L4R2HtFXvFNVmtg2IPPVGmuaw2HbRsUObnt5l6HnUIhUyByVpe4Rpm?=
 =?us-ascii?Q?X85RFyyUHxZlhYywH1jxfTNmnABddBf7zW9G3EgeMpMel4LDYp86VQqjAeTb?=
 =?us-ascii?Q?yc3rntu2qG+nev/zs//4HNKX/XaPlJIX+IGeR826GdhlR2e6mvn7XOhvRzmt?=
 =?us-ascii?Q?US24dTOSeS6KlLPOh3IthRLaPiLkuIf7kDMqP1KQxgBKYhGQSIj8U9GFtWIf?=
 =?us-ascii?Q?pY7Yx0MxlVAdOcTNxJk9vKefIBEv2RdnotB81CePxzprHu2KFxast4cwOuCd?=
 =?us-ascii?Q?8ZyypC7JR7bTKCUL0IWrV2Hbyl3UDM4Yg0Yy5ZJvHNdNDBv8SwaiYYHLd866?=
 =?us-ascii?Q?26vu8VIs+bbALQhe9dTlA2dCkozqS92F1W74FRgX9Or6MNjsvLtU2MLkREV7?=
 =?us-ascii?Q?+cniKDIEQPiInkxsv8rijvgINKGwI19wrsk1n09rA5RMQDd6fw7pP0+qiuQW?=
 =?us-ascii?Q?6UK/5F1lj4UOrgNnoZar2hdD1LwTiO0mkGcVMx1nDZbS6cd/VV8eKAuLIy4a?=
 =?us-ascii?Q?FbDs6ALn3GCdcPmt63crsWGeUCGvARgkykY7SUihlzYCXqzbp5aL3NUh/iaA?=
 =?us-ascii?Q?qKylP+j1RaKG3jgN2Qt9UrXz00xPfhGzkvTBTg5XFFGiVFCVknqQrqc5UF57?=
 =?us-ascii?Q?e41tqaat+xMsf7iWbwl0llXZV7Krs+aHRKnjjfjksnCgdjXQ73o+Lm3HcFSS?=
 =?us-ascii?Q?N7hYNycbVWmxPdluNqjdyS0VUSU/6oYUUbfY2pcCcPToeCGKN+1lebjTukFH?=
 =?us-ascii?Q?nCi/pZhp7rrXEBI5jxwOeHNiFpAQ00toVaPoc1xeEKCa6qwnNTMNRBc6M20C?=
 =?us-ascii?Q?E6xUbYKh1vjK7dcUGneCNAFq9Mzqfo9swmGAIy6dTwzn7TPd0FBfDQDz7mjx?=
 =?us-ascii?Q?c10ixTC76/QOkR3W5tMG9o4os28U/gANoKLpwRsfuk5qW9GjHF8UqFUEWVSS?=
 =?us-ascii?Q?bG5K89Kws2QqGHRoaTaWKTUSX5OFvVcuKoGXaB71l0naP66sDeNvx43hw0tx?=
 =?us-ascii?Q?kWdfNY94LYE2MqvVLtbjRuGHUuDr01jQISxu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/TMo0Q9d+aY0LsyfkS+k5tECYyBE3CpyeDnjeVYC0LWu7nm5jL+Gvy+HA0ee?=
 =?us-ascii?Q?TU8Rejy+3z9hgsoFYYFGxaUcVebhi+nEAeJbD2W2CkIyQFOXNojbX0PS83bp?=
 =?us-ascii?Q?qmdu/7wVNe6Rp8YXJfPO+V8tC0/Jw7i0wh2mgbaVrsfznyDni2hvdwDq6Xba?=
 =?us-ascii?Q?vKbFX0Bgrmh1Kt1LRTciHnUb2a5YlnePfS9jdTbxt9EcqePH7+qUUi3fRJT7?=
 =?us-ascii?Q?JrnweA0r3LSsZf8KTxKRGiFmNE9DMFpIPYWOHAQPPi9ND7Bcx4eoNvCRQgL4?=
 =?us-ascii?Q?V72zIaGc6sIAf7MyEhDKUXzHOrKhdoC0bm41f5uhf62tx1vlbiAwgmmxI79b?=
 =?us-ascii?Q?oKlynPkmjVaZolUuFiZ8A+/S+XGDynvCklfgMo59ISqe1xXYhmIBGhrXmC5B?=
 =?us-ascii?Q?nA331V6u1n4E0q6rkjyV4UprEvrMkGUQyDmJBWjnpPBq9wvJXwIzUbWuMinn?=
 =?us-ascii?Q?pSgtXm144n89XVaAKFa9TB9mO2kShEKdMS0Dm1AfXM1HX1h8b+bv6I506cfe?=
 =?us-ascii?Q?Tuz58CkWzLnXM3p9zo4V6JbHXNO/0QQu9dkCtelzxooHJOlTzPXCJCL99X8x?=
 =?us-ascii?Q?6/6OarFGpDuj+asaoKSNHHcNp7W9QcHnmnnJgw638m+oFdH7AQ5Ssoi0Tagp?=
 =?us-ascii?Q?z26Os7gJN2ILO1YeCtPiJjCzukTqkZbuxcHYbnQHIUIOBIK6B2pG9S9uDzkK?=
 =?us-ascii?Q?mc5HubrJyaVXSgn1q4l7deBV/y11OAzHgzQUhdAoR0WLUoJV8i3iNXJ6k9SX?=
 =?us-ascii?Q?cL32hLea8UtpE3twrXsuu6yX98nxCWpuQ1HS602qFjoboG74aP2yayrEidcJ?=
 =?us-ascii?Q?+wrk34A6/npzbBIvBw6pKDZixpFviufdxWaCxChmSQxeuHacJo9sVLzO8XPJ?=
 =?us-ascii?Q?fb4JqNuqacLWhgq3yzn5HOhVnUTXMiLrsCpkf6atezPDawOe9GjYnaSuJu2f?=
 =?us-ascii?Q?M6thPiUfmlEeSr1fPyC7wsSTNaq0AoLudnVcU1DrfMgK+xfUNA8lcMcxexIC?=
 =?us-ascii?Q?53EivM55XCVM+NHitGVp+eKkEEsmP8LXXHlRvFtzmw/WTXvuB75kVPXYtAM5?=
 =?us-ascii?Q?iwqoC53ab1AgWOaffGMPTfwnfL4xJv5JDoaLpsLca/Qfe/WWwoOkyD+Vrf9d?=
 =?us-ascii?Q?Pr+jxbO3ETJxdVvVCPgTxNI4xdYTjZHU0Qgc2sb7oV7GFga2oTcDWLaCs5yr?=
 =?us-ascii?Q?PycdYDJSZwj65VlSGjP4dfZO3txQVhUgn5HDg30603//relSiZ9mBoab8+nj?=
 =?us-ascii?Q?KSU4DKyHLA9JlEP73XWTt2ZAHl8TKWdRAG25rZxBerFuZmdPuvKauLwnZQFe?=
 =?us-ascii?Q?JCQNQRq3VHPY33Q7vbznx7Kw5RwNmz9XPGLgPTJMZ3g48QxmKcyH291AxzEf?=
 =?us-ascii?Q?IEVnCywJSgoJAOwSl5CJz5WuynDc+atbLKeIkojbJCSe2cQNMMhG4OKpfWSM?=
 =?us-ascii?Q?+sl9tDcA9YhLYsP7fPyabc7YDmmSx9nZ8l7DREup/r/xclyVXckHcPj5qPjJ?=
 =?us-ascii?Q?vOTb/ibFHP9oWkpSvyNzVg+vsLA5AxUzjt303/I7uO5cOehEATcJIP1280+l?=
 =?us-ascii?Q?FtiXl5HnLJsED9e7KOJByGmZXEVaRyW97OwL7M42X1u8d6RcY9ajUcc7DOpR?=
 =?us-ascii?Q?OM5cZhSvSlWqgt+RkaKm0V4kP/BeBdShMsHT5CMf120VceSzIyvJZlf2GqTj?=
 =?us-ascii?Q?Lz6unWWn7yUnvjyblw14f5mK0hmBwWMRucxscajZbUc40C6Zuat8vgjMWUvo?=
 =?us-ascii?Q?VxRUd+81Og=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d0098d-09ec-44f1-a42f-08de4d125c0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 10:57:18.1685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8cX/npZOx9bFe3EogZQqBKCzWmY46QSUqcOdBt9WdVfe5CtjYMFTZUYb81XfM5SwMTJdhvrjAWiTMZqaMHb6HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
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
> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Sent: Friday, December 19, 2025 12:26 PM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; int=
el-
> xe@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: harry.wentland@amd.com; jani.nikula@linux.intel.com;
> louis.chauvet@bootlin.com; mwen@igalia.com; contact@emersion.fr;
> alex.hung@amd.com; daniels@collabora.com; Shankar, Uma
> <uma.shankar@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>;
> nfraprado@collabora.com; ville.syrjala@linux.intel.com; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH 03/13] drm/vkms: Fix color pipeline enum name leak
>=20
> vkms_initialize_colorops() allocates enum names for color pipelines, whic=
h are
> copied by drm_property_create_enum(). The temporary strings were not free=
d,
> resulting in a memory leak.
>=20
> Allocate enum names only after successful pipeline construction and free =
them on
> all exit paths

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Fixes: c1e578bd08da ("drm/vkms: Add enumerated 1D curve colorop")
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/vkms/vkms_colorop.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c
> b/drivers/gpu/drm/vkms/vkms_colorop.c
> index 5c3ffc78aea0..d03a1f2e9c41 100644
> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -37,7 +37,6 @@ static int vkms_initialize_color_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>=20
>  	list->type =3D ops[i]->base.id;
> -	list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]-
> >base.id);
>=20
>  	i++;
>=20
> @@ -88,6 +87,8 @@ static int vkms_initialize_color_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>=20
>  	drm_colorop_set_next_property(ops[i - 1], ops[i]);
>=20
> +	list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d",
> +ops[0]->base.id);
> +
>  	return 0;
>=20
>  cleanup:
> @@ -103,18 +104,18 @@ static int vkms_initialize_color_pipeline(struct
> drm_plane *plane, struct drm_pr
>=20
>  int vkms_initialize_colorops(struct drm_plane *plane)  {
> -	struct drm_prop_enum_list pipeline;
> -	int ret;
> +	struct drm_prop_enum_list pipeline =3D {};
> +	int ret =3D 0;
>=20
>  	/* Add color pipeline */
>  	ret =3D vkms_initialize_color_pipeline(plane, &pipeline);
>  	if (ret)
> -		return ret;
> +		goto out;
>=20
>  	/* Create COLOR_PIPELINE property and attach */
>  	ret =3D drm_plane_create_color_pipeline_property(plane, &pipeline, 1);
> -	if (ret)
> -		return ret;
>=20
> -	return 0;
> +	kfree(pipeline.name);
> +out:
> +	return ret;
>  }
> --
> 2.25.1

