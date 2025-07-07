Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307E3AFAA74
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 05:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F079010E083;
	Mon,  7 Jul 2025 03:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fW5I0Gr9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1834210E083
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 03:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751860676; x=1783396676;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q5PvFdd4cgPPcbFLp3lhFsafmjiSwymkhXQtcf13YtM=;
 b=fW5I0Gr9ooQr+X5706cMq4aBj0oFmmCF9qPMKD2AKHEjUUWAzV/aH8Eo
 jOIufD6MMBGU5qD7IDBWmo8yL57wvxmdW0r2SDhnyLjpN7PrQpvdAXhEu
 vYaMgdTmuslykAelur1085pIrdhN8Qs0CxLDXnaT0+T/R5a3Z+5gMqDAi
 rYs0WlIPvBlaEhqAzWBGcZGCsbafwfnZHMyJuUS6J3593df8ny5kn4OLz
 6WlrdkCYNsUSD0exMbMbrX3elOyPsIUo4ucHHdWZgrOohtHt5d6N8aaAP
 PzsHkAejKMfodrGqnkZbTRMy+XzLRQ8dfZh5meq38qJHbizI2t695jJrd w==;
X-CSE-ConnectionGUID: /opDSqCyQ/e3uFEqq4tTsA==
X-CSE-MsgGUID: nnue+22rR4OTWD/di3my0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="54213709"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="54213709"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 20:57:55 -0700
X-CSE-ConnectionGUID: 80Vpz964RZKlh/44zqJ1Ag==
X-CSE-MsgGUID: bLXdzc1STt2S6CU13fZwKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="155590684"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 20:57:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 6 Jul 2025 20:57:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 6 Jul 2025 20:57:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 6 Jul 2025 20:57:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVBEjWugmnYhmGWuErBIokrnbELZ2T/iM/4F6LMgBCeZJgdW6Bw+sen4fDlFWsid3uSwQEEKKTapJtAQe3UYFlWs9MC9oIPC+UjpIkCu/meiFsnpuKYy1z2NKVwzQdLJycnwfbx+Hu37+9WvM5EG/AtAUtjTacNUT2ByD+y1VBvhXQOOHtUNoA4gjWdh3BsLIROVDquxiFKwXoGaBMF0SL60yRE3HlhdyAKh7LXSCPpqZWJMcKIb29uhggabpglsHvnevTBtLch9kxwuCAj/u/KhoIDF7CbClbI+8sYuwe7Zl2dwutf6wSIjC9S6Af9BDGh/yYHBog5Ka8Zs5WYygg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHlmDmX0pTlZuccFyKH65jX8avcxbCMTrfMLxa7Legw=;
 b=IGjvzv3TWBK73CnarG88KFI39tmVXMWwpbuv6l4Yi9FVTizzRovNTVuDleC+aqR4ATPSg0ABFQiW2ZgYbulxWX948Ax868Mtu31mmx+EmZKLJWdod5EpB7iP3jVDOZT/PbapHkkhyyJNiX2vJZdGN4VfZNWViSEthOPpf2O2S/CEPr9FsY6FyVchr3gDiWTubvqHDgyFoZdo0Ck8U0mkU0tLl8K6laXVLSig18jwdRzkmClyi4wjeYviIe/mcJvty0c15yrTAq+Zw2M0BCDI3ptjdvwp6B4dNO9b+//754iVOEQRwdAaaoFGDSUUDL2QkiRVXVEo50gsMhmyySgTzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA1PR11MB7725.namprd11.prod.outlook.com
 (2603:10b6:208:3fd::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 03:57:50 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%5]) with mapi id 15.20.8857.026; Mon, 7 Jul 2025
 03:57:50 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Val Packett <val@packett.cool>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "Murthy, Arun R" <arun.r.murthy@intel.com>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/dp: drm_edp_backlight_set_level: do not always send
 3-byte commands
Thread-Topic: [PATCH] drm/dp: drm_edp_backlight_set_level: do not always send
 3-byte commands
Thread-Index: AQHb7rbvSlej1b9TqE2U4eZSiZnK4LQmCOvg
Date: Mon, 7 Jul 2025 03:57:50 +0000
Message-ID: <DM3PPF208195D8DB3C82D4F9C23707B885CE34FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250706204446.8918-1-val@packett.cool>
In-Reply-To: <20250706204446.8918-1-val@packett.cool>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA1PR11MB7725:EE_
x-ms-office365-filtering-correlation-id: 1494d508-6caf-403a-6cd6-08ddbd0a715d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?8G+Hsf31eBjt8XpPWlm82yO9aWKiPdgd3G6zhYKmwacIljIoDH+qlRD9fndr?=
 =?us-ascii?Q?PXILZsATY2CTRCj3layP4TI0l89RKj/HGYFauxjOK7UHfA/BfJYuDNYJ6mY3?=
 =?us-ascii?Q?KwgSqCUeSzw1itCiEwN9GCMRZD51YRXZIj8WynmBqRKwDQrMtX+SMEtYpA0/?=
 =?us-ascii?Q?/ICuv4plYrtdLD0OfwtEtMJLXFiqcftZ2TFs8TfljqAiL2YoP2Vvo16ef5iA?=
 =?us-ascii?Q?jxDS1D1q8fHzpeJH8oZoObt5f940pl6FZKmFxaQdAjFX+7kedAX08iQGafJ8?=
 =?us-ascii?Q?RnWow1cUY9oQ7XFPLTMpm2J2o3nIc4349ABdUVCg7qdNfauD1bq+6MU0pJHw?=
 =?us-ascii?Q?leD5fJ8PfbN2M3Zu/oTANiFfj8vFL4uwEVgJGLdNbWDnfT+aqMZbRxOJGjrb?=
 =?us-ascii?Q?dAgVSojSZm+SCJ2Pn84vy1dv42HN0pswEfenueO71efAmnzHbwPn1p8nLZRj?=
 =?us-ascii?Q?UGg6dlZ/GfFmJrpYosxSfHFCFjzJn/d/wL4vgUrlUrfXMrKaIF3mwuJopF+f?=
 =?us-ascii?Q?3L6X0c3+iv7Akj+SvkgBGPpxzbM9minNs5ACzX1P9xSj+7NgXJ05Z/2UfG+f?=
 =?us-ascii?Q?DOGNkSK6PR48LD2qn7vD6j+pLhj0MMlWz5LWM1CR/mE4+d7ULc6XiLv7nTtw?=
 =?us-ascii?Q?TcyHR56c4psDU+jqX6GqtFcre8JzLgHV6FzpWpKbQkr4SL23SbP/AHV5EAy4?=
 =?us-ascii?Q?8MSPLtB2tHEcIOeHFKiYEIouDFvHSqn/np/C0TEYg2sHY5INL7If8T9Xiv+Q?=
 =?us-ascii?Q?6PHDoKb+x/7UuMIc2VTkWfjklpzuG9IrB/N/Y7/e79IOslMWTVTsOt608Wz/?=
 =?us-ascii?Q?ZNYt9st/uUwJWnSUPRSpKnPAScAX8AxvsYu/ky/UMD2F6il43TMi50LmreK5?=
 =?us-ascii?Q?dtJ1YkE86lBUpSfPh2OQBM5Wefuj5lzkVqSNcUN4sFyexFHe3hw+WL0roFJ5?=
 =?us-ascii?Q?y5OTvInr6BtquBL0l7kn99DZR+46VNXgMhK1dMLxE6KJhIFx5VhyoU4tEcwy?=
 =?us-ascii?Q?P3VTKX7vlB2xGKog/WkrNioY+EkfI+eA0F6g9MW8jNgdoXKSokCG1H+7HB8y?=
 =?us-ascii?Q?TDca2ypXFTyV9GE1YSQx0ViKKJv7Id3kercWzlu7ea3lIQZugswYMv5XMxYx?=
 =?us-ascii?Q?iMZx7kKpeZlgwfkdybYGwXQcG4oNqG3M2qz6MTM+rtXGtVNTym2ccPK2c4JS?=
 =?us-ascii?Q?I9L89r7bmqf8h+I8W1DlH5trH3oInI+wjTuPvtdFz2GqR0OrcmLWMmZscHom?=
 =?us-ascii?Q?iRu/CU+YylOfUe0NDzGc5YuphHCLAMHqKNH3kLU6ZGt1ONwm7Y9zRf8m44UV?=
 =?us-ascii?Q?MhEIpFS8Ney3gjQg5du3NYTnsQ6Xr7KoKG7vOPG7Fn0lFFn7k4Rr4miei/r3?=
 =?us-ascii?Q?2A/TdzU3vHG0eG/ReB6v5R7dxBtj6IDb1AP6Nb275PdjyDgo/XLwcrk4nhYr?=
 =?us-ascii?Q?vR0FYEFrvpc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wswMgmi60bC6NEVgcGuLjQN0keVW5pytkNisvC2/tQjpHEgb3vdc8hQGZMsY?=
 =?us-ascii?Q?1eFtqavUdr4qRkhc59DHib/3pXCwSAxpAjjV5DlHuEND+ujr0Lpv+ksP7nrM?=
 =?us-ascii?Q?bLMU4EiTLjL01y7QQ7/FXWmVBqEVmA8K0OlRoriyrWrJy95Tmj2tyTT7CHmz?=
 =?us-ascii?Q?TQixL5+JaSkLJEb5r9Qf7Hx7NinqPh3era/IPXACApA31AHeUyVRJjBNlZOU?=
 =?us-ascii?Q?bSfca4q6xqh4gsz0tDjaMKlx9N5H1LD9PavypNi5hQNPqZKgF43OkbEADYxk?=
 =?us-ascii?Q?KEzmrrTjzJvpk5zkcUz2sArgEIKEYniTm2NkZ6EgYbx/zZX+B8KF/VdcxPz6?=
 =?us-ascii?Q?+7kAwQF8AVa4wK1s0749GoRPj3MgkAjKiIdzMcZ7DIg7VS+8cekWzYKDuF/r?=
 =?us-ascii?Q?GltvqEk8cqCuOmwH1uxQrHtdk1hQVnbp1/NJUdTApXsZqKMQLoT4B5u4rzAd?=
 =?us-ascii?Q?J84k0vIVnYbdWMmWiNZzJvPpezD8SbOdNQNTmpx0qJckEUbta2T5N5i9jlxN?=
 =?us-ascii?Q?xq8vEcgzDuxTwbapCy4Plxvd6/rzD3Wd0mj2o7RFoIrlM/QhN2X/b8tOazwJ?=
 =?us-ascii?Q?hOd8R4+10G4FyFHsitCSfzho3u6NQGFRMEJqUjQDxhBrAKkFQsYnDU/pHElj?=
 =?us-ascii?Q?WanTIQ14tDJR3Pcpr2OJLMiZ4/agsf8kjWT3qMBXeM2nBcswpCYU3Banwr1R?=
 =?us-ascii?Q?1n04wh++ocAn+n9TgFeZTfIfrGU/dlD/sne/9jV6i3wFSkJ4r9j6+CAlSvmi?=
 =?us-ascii?Q?AXlIwOaZD2Rog0T+AMNVbiSHH91quia6kZkd6bAfoB1TcX9jDdkXIu5TV9ji?=
 =?us-ascii?Q?mkGmoPAX/J+BHHQTX61fsGk3zUdb8fNbSIMsnkVxXnT2L1NOolZ+QFzt97ZJ?=
 =?us-ascii?Q?k3c1J39aQiJZbzKw065iBqg3CyflZ55DCabV3C/9I7vBOEXf9Fni7/LhTvIZ?=
 =?us-ascii?Q?MoUahs7pATZ66Xb10tmn3/E6gsXKLVSH/CmBidqYbp9xAndCwPynpNPHy6II?=
 =?us-ascii?Q?yw4gPFaoh6qVdjA+uZVG6/urnM/wzM85nK9jei9R/zsNx6KMtWxLmdzLuBIv?=
 =?us-ascii?Q?vP5nOkIAAOZdiBpc0SR6QzNu+G8AUTKgeSiIlOXeWIdObccOHMgv+92/rQLk?=
 =?us-ascii?Q?ArI+vmkNc0XoDIhs6msZTMBVpicKgGAPbN3asD8kn4wvd/TUO8sJWYaYJM4u?=
 =?us-ascii?Q?yaVfRut4DJdiSbMLXVJq/C7BHBEJfbkOC7XM/aTZq1oDtrqFGShadWgpidRM?=
 =?us-ascii?Q?c7KNTyzoOaG5YHOBdqyn988dvpPlYvUn8lPUGFOJC8UWibASMQqnVGKaXWa9?=
 =?us-ascii?Q?7dleqs/gKsXKuS1Z3AjDSP80Bb3qwoelu29da/cRykEwO/+2frOsuMFhMjpO?=
 =?us-ascii?Q?HNtbFk7pV0Kmb/M9szOeYZgSo4y1QO9WjS5sFYzkdVSyTVDMATt8pYKp0XPn?=
 =?us-ascii?Q?VzAo2LPKL9zv214mazBKDWJPKnOnhTagZoc8xXDMivB7KoIMfH7ovvcIsEqQ?=
 =?us-ascii?Q?jkkbdCQIjLVkKDNWpGPdVOrX1YpYeR4UiRYvrGxwILjBhc84uTzHv3eTK86z?=
 =?us-ascii?Q?ja/ThPufi9FzJnKzPQQyAlE2QdMo+SdOoDGx70ZP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1494d508-6caf-403a-6cd6-08ddbd0a715d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 03:57:50.5155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /T4KKKqLObPskw12YskNI5djegjrldtuV/3UhFRxFzwGgVKTZbvIZrACUUuzHupFOPDeVUsRmjqXUt+fj7kIDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7725
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
> From: Val Packett <val@packett.cool>
> Sent: Monday, July 7, 2025 2:12 AM
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
> David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Kandpa=
l,
> Suraj <suraj.kandpal@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>
> Cc: Val Packett <val@packett.cool>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH] drm/dp: drm_edp_backlight_set_level: do not always send
> 3-byte commands
>=20
> At least some panels using the LSB register are not happy with the
> unconditional increase of the command buffer to 3 bytes.
>=20
> With the BOE NE14QDM in my Dell Latitude 7455, the recent patches for
> luminance based brightness have introduced a regression: the brightness
> range stopped being contiguous and became nonsensical (it probably was
> interpreting the last 2 bytes of the buffer and not the first 2).
>=20
> Change from using a fixed sizeof() to a length variable that's only set t=
o 3
> when luminance is used. Let's leave the default as 2 even for the single-=
byte
> version, since that's how it worked before.
>=20
> Fixes: f2db78e37fe7 ("drm/dp: Modify drm_edp_backlight_set_level")
> Signed-off-by: Val Packett <val@packett.cool>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>=20
> Video evidence (haha): https://files.catbox.moe/sp1g9v.mp4
>=20
> As this fix is tiny, if you prefer to fix it differently somehow, feel fr=
ee to just
> redo it yourselves without waiting for me to respin it :)
>=20
>  drivers/gpu/drm/display/drm_dp_helper.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index db7896c7edb8..7eaa118d78c3 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -3962,6 +3962,7 @@ int drm_edp_backlight_set_level(struct
> drm_dp_aux *aux, const struct drm_edp_bac
>  	int ret;
>  	unsigned int offset =3D DP_EDP_BACKLIGHT_BRIGHTNESS_MSB;
>  	u8 buf[3] =3D { 0 };
> +	size_t len =3D 2;
>=20
>  	/* The panel uses the PWM for controlling brightness levels */
>  	if (!(bl->aux_set || bl->luminance_set)) @@ -3974,6 +3975,7 @@ int
> drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct
> drm_edp_bac
>  		buf[1] =3D (level & 0x00ff00) >> 8;
>  		buf[2] =3D (level & 0xff0000) >> 16;
>  		offset =3D DP_EDP_PANEL_TARGET_LUMINANCE_VALUE;
> +		len =3D 3;
>  	} else if (bl->lsb_reg_used) {
>  		buf[0] =3D (level & 0xff00) >> 8;
>  		buf[1] =3D (level & 0x00ff);
> @@ -3981,7 +3983,7 @@ int drm_edp_backlight_set_level(struct
> drm_dp_aux *aux, const struct drm_edp_bac
>  		buf[0] =3D level;
>  	}
>=20
> -	ret =3D drm_dp_dpcd_write_data(aux, offset, buf, sizeof(buf));
> +	ret =3D drm_dp_dpcd_write_data(aux, offset, buf, len);
>  	if (ret < 0) {
>  		drm_err(aux->drm_dev,
>  			"%s: Failed to write aux backlight level: %d\n",
> --
> 2.49.0

