Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAC6CF8064
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2018310E205;
	Tue,  6 Jan 2026 11:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OdmdizrY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9FF10E205;
 Tue,  6 Jan 2026 11:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767698631; x=1799234631;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CopCU8xBevh+8tMCr/z+aa3dBmWOtn1OcQLvO3bWjWc=;
 b=OdmdizrY/iawZ9Xb6osjK5VdR6g6QhzLxNq3aWiUKhzSfgZ90+WlyB28
 UewHIwlx01mwZhfosYZ6n7eUDb25fOt1BaDeYGYf1furXfr4v0hz8vPf6
 NoYMT107gG1oJ1ybO2er5NqN8NhGLjOIjWSMp2lfZ7RltpVpaX0E56pLO
 84ZqGRYKxW0E5AeXn+I/aOW3qfhly44jInxRyt3Jb7vTB5qwyVGswhOAv
 5YmGDGMakUCWD/V6BPPL9M9iEKdFw7NUT2gBkR3SHoEpVtlI15eOvWZOO
 ObS2FTOrJnkTsO3BZ2jkpVaocBxYU9LJ/xYBkM/SvKCgF7ge0VYXR0WmY g==;
X-CSE-ConnectionGUID: NTv8Z/j5QdKTlF/tta6M/A==
X-CSE-MsgGUID: +w+yTjUlSdOdbp5bia0Fgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="91718689"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="91718689"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:23:51 -0800
X-CSE-ConnectionGUID: 8DmHzRc1SNe+1L8Pa6/LVA==
X-CSE-MsgGUID: //jEQdf8TkmmZ1z2LZlQsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="201858265"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:23:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:23:50 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 03:23:50 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:23:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgDouUgSX3XldDUGgxeXpQq2kVMa2hP1tTQIWoXmTp1iYhtjNHbultA+zmSUEKvpp/llpQJz3MYTMcycJmNJ75rEhcv9LFtQcTldvGOQMZ6M+myIe7MvGARWuYg5BL2DQwjC5WKKUuA0Kx3chQQUmAqcri7UePlQBvqTid/+C99pRbnCipf7YpPzgpqqTUZ+cvTwZ6G0bjneSq8sglrBDXo2B8Cr/BCimFxZTFAvJDCefJ9Ro7MKj8DUltmc3NblnhqJbByllzdXBqsOjdB9T9pB2qfL5tVJpU6zUHgmgM5VPdnT+6jdg0O+SeqZyeFwp0Ryl0IRvri59Qg7x9myig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5k6oObzW/x/SyxQQJaXeMa5mjsZh1sPV1Dxjw0MiZ0=;
 b=c+FTeHNyvXaxfK1t6pscCBNCW375aFMUvZrvee97TgJQ9zL535063ZtArG8AQQwuwLsGIX3Qj9baFp/uzTX8zlCCwUCUbQLregT/U+AuF/426bvtW9Ms6sNufB1QEzPojcD74sLmNTAybvmIlQrCJvjWbOx5DFHZXCvekXA/0ckbA/Y7XC+zaOjsdS10N8/sN2P2QsYOTU2Fj/AZW+jWmjvxSTXO9BjwzB1A+MjzcaWVaur4zWCAzqB7zQNcGDjndOifFXWQyDv9eswP56HOqD4/pNr5Fss5JZ6csR+gGX8asGO2Q6RlVqhOXyfmAedfH247V8EEL35c5yV4PoT4hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 LV3PR11MB8676.namprd11.prod.outlook.com (2603:10b6:408:20f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:23:48 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%4]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 11:23:48 +0000
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
Subject: RE: [PATCH 12/13] drm/colorop: Use destroy callback for color
 pipeline teardown
Thread-Topic: [PATCH 12/13] drm/colorop: Use destroy callback for color
 pipeline teardown
Thread-Index: AQHccLcMOoVNuEfNVEyswHWVNFCmarVFHDSg
Date: Tue, 6 Jan 2026 11:23:48 +0000
Message-ID: <DM4PR11MB63602E43247EE89880961BE8F487A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-13-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-13-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|LV3PR11MB8676:EE_
x-ms-office365-filtering-correlation-id: 898b1e6e-52a8-473c-c0a2-08de4d161026
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?4slAdCSrH29KngflXBBVEDPQdSkWwlNcgN9IfTt+AssiFGn9GI3V2bo96btr?=
 =?us-ascii?Q?fS0pnqgI6R0TKjLb6vEME+BmP0chkS1e75C8uvseKR3MABnzrfbK92XvOMjw?=
 =?us-ascii?Q?lTTfrJ961vKHlD64Q0ra7TNXOnHvej7X6wbWQQy3MXTGZla/KEGmlDtwY0Gd?=
 =?us-ascii?Q?7SyjSjn5yUkdpvvEd639/kyWiRslJGk3QQ6tf7gtCpJHI69v+aWlf/NJgYvz?=
 =?us-ascii?Q?f3yCA/yNkasd5EUl7iDfLhqAd5pxIp6nP7c61vd0WickVjSWixPsoiA+9BHB?=
 =?us-ascii?Q?DGAjgnqWZ2agr9GV2FvrGm9Qu3bn3OlWvxp/xXdWXs3cVHjLIPyq/3bPgTWh?=
 =?us-ascii?Q?cqKuc8thS2E1t8A2Hqp6xafJkW6bD9M8BYM3I/0MrIq/uJmYID0yYRNIXpF8?=
 =?us-ascii?Q?aI/EHsE4EoY4qrpqavni5LqnI4BW5fcQYTBCFEmMGuLEGpYo54JT0Hof+lZJ?=
 =?us-ascii?Q?MCzezaRM838kAS/3ADcHUty3boMWc3ZC7vbjpWRZEOULCm0cVYVwrD3remad?=
 =?us-ascii?Q?+5M9nISZkv4Arzws5jT9KW/2MNLQIo595Q1bDDYHgDLsq1K9+yUxLeda1Y0c?=
 =?us-ascii?Q?iuZm3x+TMhowx1U8ZmYK89N13QPgqkX9ehiHNtwrVUGjoB8BLZpzM8DlsQAF?=
 =?us-ascii?Q?7vCjRVG+gYFJePctwujs2ZjQTt16Uaw3vxYGZxkBbvg5Xj2SOV+htdZFd8a9?=
 =?us-ascii?Q?iNEw4tf7aX42oAVpLC4I08pxY4M1zoLgvTw2eV9NgZJrRcp81difgBeaKyij?=
 =?us-ascii?Q?YRm0b3k/1AYCxH4wDAUnc5Uzxu/ksRS+nLFCL9LSGFvV04K97+jWAIdJ14DK?=
 =?us-ascii?Q?GPNr6g4uI4VByGzbNiG1hvXHqNnGSBbeAl6vcGdzlJyltorr1Pzydbme7HHS?=
 =?us-ascii?Q?Ddu3I0ZuUw8wR9IoadGoqDZ96i9YvG8tgyKdeP9aywAADGPREPMeZhvFluUb?=
 =?us-ascii?Q?G7G4P7uVCEGIl9a2iPKdHAqMCz9y3SPdo+bk/RCamW5Har7WVcecJz8cqpbK?=
 =?us-ascii?Q?H8rXTVcaR337flAvOyy4taApDvuIyUPkAF3YGlyDvTO3KITW3TZbUJzv22qx?=
 =?us-ascii?Q?zpRzH1nrmg42l6GWMe01r1b4Yi5ZXNJrVFaeUpADM+hIuqIZ58UkkedWDGki?=
 =?us-ascii?Q?R/4x2CRmhq33ZWyw3A3hWCmy/VwbHPGb7IzJxCUWpcFMgbPtg6CQhL9MnCtK?=
 =?us-ascii?Q?Nb3sQs1vajrAs/DnPYv7WeLDW2vJwgF1Uk7FxhE7dgXVxebCOUl+LXNsVobj?=
 =?us-ascii?Q?O3b/99zGBaSfytpFEuxNvpX/k8du6/OjVN+JKqQ3nYLDNY5+eT9MDXZvghTx?=
 =?us-ascii?Q?SMCyTSBDasSWGfInlToXNhOufS147HLfwemgPZFRywg7Why2uqQ7MT+MgLn6?=
 =?us-ascii?Q?v5sEYQWJtPks8aCOFKXX33eAjbqLthzintNcEDL9BwrKcnJIghWmHlEUTfLQ?=
 =?us-ascii?Q?E8taeGZkMTsc2lvMR+8b8HwOjax/01qrxGz+l/XNFAALTx4I5Z5Nao3hceAQ?=
 =?us-ascii?Q?7UfSEB3b6xCQp98CmxIip/5h7i0xVIw5iK3S?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UWU9hJUGTzb/RZ0fJPOYIMBztlFFGNtaprPVvQfYcgPtowuE5zDgE2VGC+4W?=
 =?us-ascii?Q?cku9g/XUi2BVVrnExDUtG9h3tjG5hEpV9MOSSD/7+Y4DBJXptYEqdFeah44u?=
 =?us-ascii?Q?31WwRt4ep/Y30okrsn1cv+sgAz+vJmyELrrGJny9A2twJFCkaevCcAY6N1ZZ?=
 =?us-ascii?Q?fjCGHpIYRrl2+uBjpvmYmVEetjlW81rs+Wst15SFUDrXJmQ68Bqco00i1LFN?=
 =?us-ascii?Q?OyG9+eutkc2ZZAu7haHMfS2emU1/RSXR7Oas6LdvibczuHFS67/UX6fjyzjn?=
 =?us-ascii?Q?iujSddE1L3DiY0MW17e1pYM94bQYjyczZwnaGYfUWRvkvPJJaT4bqtuLayvz?=
 =?us-ascii?Q?3RU9a0UyGQnEeG/IjcHDyUBRIEuZUTFJTj7MO8CE0f2JQODUYSR8BPtk6ttq?=
 =?us-ascii?Q?sK7K/ixmdV3vTgXrJMENxw/Ngw5Klt6AdbI1Q1auNb8rRabh3LCHgQMHLeMh?=
 =?us-ascii?Q?6k78vqSl1K5EBWtMNV4SsBLLaFUuSaH1MfRlj+dLo0IWrrDPl5ShXaS2wrsN?=
 =?us-ascii?Q?Uk4YZgR4+h75HFSyOdD6m5ja27cGQt3QD+VpvLKJUnRU/KAfe640YGTJyZgd?=
 =?us-ascii?Q?m1IJu451g87f5j4eOvRCNhuWDLPxmGWA+d+AOW43sDmG3n+pn+wDCh8mPUpf?=
 =?us-ascii?Q?pAH0O5l+slU5qQAk3uZA+/z0YLS/5EhhvUtCFVBqx10KDdS6QtE0xj5305hj?=
 =?us-ascii?Q?+9m0Cp7IxV6QSPelLFipZ+oHY99WLX+Nmgpi9HUVfVUdB3GFIOYfuXvyHHFN?=
 =?us-ascii?Q?rzRL3bCqYwJfkLylB70fuPWeYlFA/4sd+Rq5v+Pt7ec6zVdWP0cIhk+3cSJ0?=
 =?us-ascii?Q?gfZYUIPVDTjar7c9e1EXTKfj7ZumX4mXLKIyK7dYaF5k7sBz+UeOpE3KZVMN?=
 =?us-ascii?Q?wZeUOGEJLzPYUmJqu9iSNkx0HBH2X+99uGTbgB701XGPl4RbwZbYIfz4v1BL?=
 =?us-ascii?Q?3dSwjcLqvyuEEijs3ge9Ch9e5y6/PMP12j8U6trrt5dBRg0v31PWZvGY2tSp?=
 =?us-ascii?Q?EacPcn7PEWH8nZYLlEnQ+msI4sqoeOb6XkCYD+TlhV4EbgSJWYG0D19AGPkw?=
 =?us-ascii?Q?jCiD+A4PSnwqqnxgLUb0Zy0ypL1hloXJMCYm5U+168g1CSQ9C4sjXpwxdcgT?=
 =?us-ascii?Q?XsYWTJni5FWtShtVDlV2cixkpi+FxWTtfBvTaGmyOK9kkBkHEQCZkkZ/Og/D?=
 =?us-ascii?Q?pvdAYq0LqHfIAZOstrB7yV4TSsfJf+WW6cEq7CNbn6ejFkivb/zJSFRSpv3p?=
 =?us-ascii?Q?kG4fka5xbAjZsCxJz9gUwbu//Pgxb7fQp9GabYeRo1ljM2pE+WcK2qFEjAtY?=
 =?us-ascii?Q?w8FoBr3AfGFwwFGn01C6Lx2Og17t4aB8OYtOqN8JXpSor3qIBEn9Nq9uO1to?=
 =?us-ascii?Q?sSQefrflbx/FQlz+OYWa7buLytMThVHFZY0rZv4hjR/y9r4KBTQsolQuLARG?=
 =?us-ascii?Q?Eofw2lfyPv/OkHfig5wFj6pkgMYErKbVpNfdI22JOCvoluwEmknOTy8Yci56?=
 =?us-ascii?Q?8L/YDFsaALKO0XShykk01sooy3MnJiAwe713OjVGlPdml3I3mb/MA3Pw3eGG?=
 =?us-ascii?Q?oC1cz86JG6MaDpK0YDxLsneWSdYeD1ukrxJ8RVV+8IsTQ3gJ0Mt6XpFPkK1T?=
 =?us-ascii?Q?GKDYAoeZh11dDtj+dNQ1VuMTXWQbZq6WzJ91vxVzBwPkB5QIwlyhqPyJFmjD?=
 =?us-ascii?Q?N4gGEMBsO2AHBZtH84o3hIhnFP8m+AuCLBfUVQFikxqcPjtAGLj5Y/VHwBHn?=
 =?us-ascii?Q?UfsbKJ9ZLQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 898b1e6e-52a8-473c-c0a2-08de4d161026
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 11:23:48.8423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YteKPx7MoLFaD1jV/v7FvKfxr8bTxTMKvBMn7lkK85TE+sSw2oTlODa/Z11BPSae2xCEWuoD/8wP5U6nZUhqzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8676
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
> Subject: [PATCH 12/13] drm/colorop: Use destroy callback for color pipeli=
ne
> teardown
>=20
> Switch drm_colorop_pipeline_destroy() to use the driver-provided destroy =
callback
> instead of directly calling drm_colorop_cleanup() and freeing the object.
>=20
> This allows drivers that embed struct drm_colorop in driver-specific obje=
cts to
> perform correct teardown.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/drm_colorop.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.=
c index
> 4b27804bb0bd..fafe45b93ff8 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -205,8 +205,7 @@ void drm_colorop_pipeline_destroy(struct drm_device
> *dev)
>  	struct drm_colorop *colorop, *next;
>=20
>  	list_for_each_entry_safe(colorop, next, &config->colorop_list, head) {
> -		drm_colorop_cleanup(colorop);
> -		kfree(colorop);
> +		colorop->funcs->destroy(colorop);
>  	}
>  }
>  EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
> --
> 2.25.1

