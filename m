Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7242CB2072D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 13:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF99110E44A;
	Mon, 11 Aug 2025 11:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVOGH9jW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD7910E43F;
 Mon, 11 Aug 2025 11:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754910918; x=1786446918;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ngcPVAM3xWIKsuBS+9LdGulS1sVW2Ji9lTvNivfX8Ic=;
 b=mVOGH9jWr4/cxGnbg2kMTJvQQYX864mvlQ37bHHI3OyG3No9lq5/kqOx
 m31Ke6dJIJ5x3ARb4KR11QJ5d6BYwc8fJeYOCh5E1Ie5b7uasg6GOXRNs
 3ZH5XyHSS3mv8iCJLNjmK1CkNqHUkB+ELb0KnOOSOtjrZ4MN0tvmGuNu2
 F/hCRK/lB3Bo8Evh8DZr3pvBcw75xltURuWaacEFwa2I19EAfj6p2Ixxc
 5gMlKrxxNKdgcPHV81KV3exa2H1dL8n+sBcz8zvYbpehz/9ydZPBKIFCp
 kgQfLBCEsq47S5JqwxIYtsEkW/n9n6FRQopcTxoQ9MIoFqV7FewwifLSd w==;
X-CSE-ConnectionGUID: eyp4wmJuQLyoB4H5ymGUlA==
X-CSE-MsgGUID: KDyjPBwtRj+R3mcNNmZBJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="79731681"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="79731681"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 04:15:17 -0700
X-CSE-ConnectionGUID: ryq6IiljR7+AZBwsQTd2Lg==
X-CSE-MsgGUID: cdPMV4CVQmaQxHcGaGuKsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="166297140"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 04:15:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 04:15:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 04:15:15 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 04:15:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+Nsp71UrswGa8kUFtxNgGyZq+uFL8HJXcOH7R9ORQqY7oOBTgBKhVQHa3ss2W7zazcToeTjJYbV8lyEWsaKfRY8P5zqdbyAt+3PCZT5x/efu10ptnPlaaS8QaT+zAQOAJVzUNMsoc0Jqex4jvfIk0khC/gA0j9TjLosAxdpiAWxvowS/oZd3BDRqbfFbzk02Ndrn1VsPkBsED0lQMWIPKRiekl57LfQr+SF+ktx8mry1/GqiTbcdOeFALCggJcM/w0ULspqf4CsOOvQ6fc3ezYyTNw8Iw3VP8zKBI6dshCd0SiiJ5q6Xom5qpRsQdD5eWKKvoL1vi1nL+gXvDJdHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khvyeT6bFxrgLc+B5t3z47rLUwsIvPL3d5TvRayqM1U=;
 b=hhBeHy6bet0OdkfMejupKcYT5fLidELgQaHpXQ7dxVVCp5r9sVAcEHMyrjg0ytL948CiO2KGd6sO6ncX9ptGl/6l8VaCencAJ/bbf/3uUmJOruhN7j7IGEmJdGF0iUOVLP9+zR36McHtzbf7JXrZBCpv4gqrc9D9NOzAE2Y3ockw3fAyl2kdd2yt6vLCsKL/MiMYjl40h9lCkOZFGeCyR19yG2hXAkuOmdZ6nCuKCiqJ/JsFo5aboDXksb906dt5CRG0KPaWACdjVakVs/CBefaPjB7QihVi+3utbvJ7mJtvhaJLrJ5fF3D42TQ6lMgQARF9xiuJQZQv8fRb1EmPqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ5PPFBD6B1667A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::84f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Mon, 11 Aug
 2025 11:15:13 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01%5]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 11:15:13 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "siqueira@igalia.com" <siqueira@igalia.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "robin.clark@oss.qualcomm.com"
 <robin.clark@oss.qualcomm.com>, "abhinav.kumar@linux.dev"
 <abhinav.kumar@linux.dev>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>,
 "sean@poorly.run" <sean@poorly.run>, "marijn.suijten@somainline.org"
 <marijn.suijten@somainline.org>, "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>, "mcanal@igalia.com"
 <mcanal@igalia.com>, "dave.stevenson@raspberrypi.com"
 <dave.stevenson@raspberrypi.com>, "tomi.valkeinen+renesas@ideasonboard.com"
 <tomi.valkeinen+renesas@ideasonboard.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>
Subject: RE: [RFC PATCH 8/8] drm/msm/dpu: Adapt dpu writeback to new
 drm_writeback_connector
Thread-Topic: [RFC PATCH 8/8] drm/msm/dpu: Adapt dpu writeback to new
 drm_writeback_connector
Thread-Index: AQHcCqJfy10dgszH50eOGH0gjBNpeLRdP4gAgAANazA=
Date: Mon, 11 Aug 2025 11:15:13 +0000
Message-ID: <DM3PPF208195D8DF756A3EF155EFE02DFB2E328A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-9-suraj.kandpal@intel.com>
 <ag34es6qm4b22qti4hbsju6sk5ny7ixq5fiwtni22vf7tvx5ba@ficntlx6i2hs>
In-Reply-To: <ag34es6qm4b22qti4hbsju6sk5ny7ixq5fiwtni22vf7tvx5ba@ficntlx6i2hs>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ5PPFBD6B1667A:EE_
x-ms-office365-filtering-correlation-id: 12d3ffe9-5c34-4947-b9d8-08ddd8c85793
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rs2UPqHZRI8FagZ5Z3DXqrrntHv7WtXybvkyHcYnY490euEH2/FdXz/+sDeW?=
 =?us-ascii?Q?23ft1FKlOth6/qgONwwl+yy5K/vWZFiOPrfQfrN3lSTrGldJe7p/k6vXl7sQ?=
 =?us-ascii?Q?R/zVlYbyvjJb/YFe4clixA9hxTzL84U7Tjzams7UshGACFAabVp4kN5PhbXo?=
 =?us-ascii?Q?Im5FhMoFgeq2u97cpJeWQ/oTU+LBYH14B+QFQ6QtO7vuxUUWATSit1hRC+H0?=
 =?us-ascii?Q?PPyzWpdmvX6FrMP07cF6/aMPV0DXLCDC959a1lYwm4ouXBy23f6e1eYiyFIS?=
 =?us-ascii?Q?gHMz+OQh1pDdUVOGEy5BMuetHl5C2RiYHUlegyFS6vkaOyqYGWRnCHYe2crm?=
 =?us-ascii?Q?GPy+E/pqVUDLWXbWvTC2PvXVDDKWNPfpiAfCYLePqmZAfDLGQhZ7qUSDFA+2?=
 =?us-ascii?Q?lWAxm9QWWgef1PpHybkmU2TKtAGX/cW/A+YekTmf3xXyvSOl8hTnIRrgUSse?=
 =?us-ascii?Q?6zVnSeSvjyncy3oZjKdE8//QcTn45ji/fXkYciyIY3AM6cozanbOj9/ajjNG?=
 =?us-ascii?Q?tsbJmwhK+hQRu4dwcou83oneJc5TqIhLbsczC9UsTQA8yR5iICZSzqvO775x?=
 =?us-ascii?Q?zLx5eoDNXYNySCUn2eMkOvcce29vAIwxlGpKC8xfaVSdGCXIDJWEP2ccyG/h?=
 =?us-ascii?Q?AITCqT2SbTmA7NfiuhxGMQWNYM+8O8vSxkCxySa3cq7/4WHLo91Oc45j8KqE?=
 =?us-ascii?Q?lclGOoHIXvSgiDfbnZiJhkeTDmXk4aVpqcT36J0Bm3UMEa01NrBLD2o0zKdG?=
 =?us-ascii?Q?2GdSOgT1kwlRWfLDrU6EOK4u5oby5OXs5APApwPz5OIH+FRCLtmTmYwQ2UGI?=
 =?us-ascii?Q?NbUVbl/COu1Ua2FTQxN1iAN0AtPoFn7oT+fltyTSlqucowhIKHpFaqL518fi?=
 =?us-ascii?Q?w3kPWcdaaDteWECR/DGcSqomVIez1v8ghsOZIUabdN2mDVJ79UBd5OmFfK7f?=
 =?us-ascii?Q?kBYsGxS4F/wMI00XLb4UfnqvkhYdxMzjBfynNeAKABRP4Zgzx2sUZpmdgSm+?=
 =?us-ascii?Q?hv3rP3iFBxPnecIF6qkHqiiePf6ZUzCn19akbuy0LSoEqFMZges+XTMsoRwl?=
 =?us-ascii?Q?SxgvJk+ODw/wyUka3gRbrPp/HLt7RFV52d3cMD0WQKwU8cw0MnPjbMOho7Lx?=
 =?us-ascii?Q?S6UW1hlQqaPdHgNiTofNl+XvNBCeRYsaA6xfDTKsFIBlFod3HhRRyxy1+88C?=
 =?us-ascii?Q?8++0pXiTLOrq2zOUc/sr7jIoU8vn9y/tgdQh06dhu8nTTKonuAi5gfeWsT+m?=
 =?us-ascii?Q?aOVL0BwbJ7XepQTZUhaqMoT5qOxtDkKle2BCZunlsrPzIBJU8WHUAPW2Vb9S?=
 =?us-ascii?Q?WgXsDnY36vXJBQI9VCfNMa9SH5YB8rceqlHxxmSah60k/gZzisSNA1GQtI64?=
 =?us-ascii?Q?f+5yOkW0nvKROVtfVJECMju4gk5T+7Lsjg39/23EJO9ExNMciuUxhe6lYWSB?=
 =?us-ascii?Q?Woqi5DDp3nAjJYdeMZ2Y2e6JBJE0Y00tONifsziuoAwJKjLiyv7E9w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KCak31hD+mI71yJOdVr0chIDlB8RNYJhh986BhXJtINT6OtPy62+9W4ll217?=
 =?us-ascii?Q?cKfO3n5hiQDtddM1yv04829LB4uVlMzCZiVn8Ec38HcoUOgR/9miwMmm3rbb?=
 =?us-ascii?Q?0926bTQWSV0vQ3ZDMQsUlleBoUOn+vILFsSGBTYfEIvz7nnA8vyG5aFsonvo?=
 =?us-ascii?Q?QQd8EVKyFocc/QBKkMvNWkaMO3zvje7c79uoUP5iJqDrlVXgLn8wvPj6Dph9?=
 =?us-ascii?Q?RcQ66YnpGUtxLs1XPaHYA1KR38NGTnRhgf/v832hsagJPfuH4dQptK4gps09?=
 =?us-ascii?Q?PrhfyrGZ66BEErP4MxDTwIk2qklpqioaLX3U8Pqmj2B0b28/OkU0oX1fmyzS?=
 =?us-ascii?Q?rM/yaEFuA+gdMuhj6nkqublxICFzR77buvIpRpYGYcLjkuhUja/NusqyOi6M?=
 =?us-ascii?Q?wvdOaVnYed9ekyAMsRSxWgXqf4W58LI4YWhrHQ9THyc6cXpsGnHQVvFdN9+o?=
 =?us-ascii?Q?VDyvoYazcxkJihAt6wg8nDAoGnR3+iGYBr0waUrOnBM7KtZ5yXE6g3QMbzZn?=
 =?us-ascii?Q?FzjUN9H68tLXB+qH4BEnk8UpPUEvhnt7hCQYpZHizpIv3S7OyYA18aCpmSqn?=
 =?us-ascii?Q?O/ELfsoO9b17tPqmots6KA3P3wjbdiWWjcZ8Px0RHUja1rp2SCOpJ1SzqYMZ?=
 =?us-ascii?Q?o3W3JUZGssSnVMNsSeu72ULlccYMX7txTdjjked9AIo847Y1OsFfu/2TfUUl?=
 =?us-ascii?Q?cVdmX26YwMw5zNulwzzwQjv6r0DZtO9qdM3FBT9XPh/yhH+WH60rOzgDwYSb?=
 =?us-ascii?Q?4egk4eNhir46XqfCUsINy5m5v3vVT6BMKoL/Lw7Vv4srsRtmi9TzzRI7ol2b?=
 =?us-ascii?Q?LZr0hyH69K/c2hOurEdbF2WnwBN9DYAWj6Wi0tyDMJSY+lnCSL3gI1dVCXqy?=
 =?us-ascii?Q?Kbmp2ReLYePPJPaK1urhizKsieOj22KJFWQ1tc15ApjvBObo8EX+Zcex6OXH?=
 =?us-ascii?Q?iAl2yNXg/F5ZFVgO8QdyO6kNKEwOYNsdi6HyGesGg4Wy9lRYZjZWWA7CeIWE?=
 =?us-ascii?Q?BQknVXRHGoB2IXWTRl2uWmBjGL0MeziiU/7WYulVrdsAJXOmhNelsfDzca9I?=
 =?us-ascii?Q?t2+AZTtwTPBNR8Q0bv4dqB8BiwiStFbbM69nBRwRwQMCOSj4x+tUwIyqW7an?=
 =?us-ascii?Q?s6aQtsjFfJY8u6ndVzQYEt9IA9Pab5coQ6pz1tBvsBsv8zYJCo3odMuraiWb?=
 =?us-ascii?Q?J6chV6+ZVQvE0I4L0B4RVxaOtjZIH7yT2edJQYHqOE7geIBC6FeNva4yV94h?=
 =?us-ascii?Q?oVnq0fljmN7JZuOLYz1tJmS5cgvXi2/TzQmmX0yVSZFkWU4Rq8MKUBsD7/oF?=
 =?us-ascii?Q?4mx8/94szGmmcQbf5ENyDE9hEDXNRuQq+iJwtr924DU3OA/sJKzqrObLv0QV?=
 =?us-ascii?Q?FZoyO56sQt9fu+ZnbbbibFHarSZqL+q0KTLIUztBd4eFJYxs+blI1ZHq/3tx?=
 =?us-ascii?Q?15xnXBoNS/Pk6IDI+Rm+mbDCP+j2Cbuz68I5xiUWhH6sdO2BqHXG//1dEi37?=
 =?us-ascii?Q?inQHmkHYjVB3zj/QT9wnb6Z4mPeqONAH19aU/qc4CbMWeuAetzoecBxF5JK4?=
 =?us-ascii?Q?CnodLtc4eylaieFYwz1pm+MmsQ6fwT14X6aauvmr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d3ffe9-5c34-4947-b9d8-08ddd8c85793
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 11:15:13.0287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jFtjOX7EiRiXP0LbZSV8wDB34SEP3r4exZhBxa/lvQf6Qs675qYfIY6lsk0/JhsDQgpGeK5I3IX5uDW84Qyf9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBD6B1667A
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

> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  |  3 ++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c    | 16 +++++++++-------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h    |  4 ++--
> >  3 files changed, 13 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > index 56a5b596554d..0e60c1ac07c5 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > @@ -484,7 +484,8 @@ static void
> dpu_encoder_phys_wb_prepare_for_kickoff(
> >  		return;
> >  	}
> >
> > -	drm_conn =3D &wb_enc->wb_conn->base;
> > +	drm_conn =3D
> > +		container_of(wb_enc->wb_conn, struct drm_connector,
> writeback);
>=20
> Just store drm_connector in dpu_encoder_phys_wb instead of
> drm_writeback_connector.
>=20

Sure will keep that in mind in the next series

Regards,
Suraj Kandpal

> >  	state =3D drm_conn->state;
> >
> >  	if (wb_enc->wb_conn && wb_enc->wb_job)
>=20
> --
> With best wishes
> Dmitry
