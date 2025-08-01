Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB1DB17C52
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 07:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2567410E3AF;
	Fri,  1 Aug 2025 05:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DScBIjQ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF2B10E3AC;
 Fri,  1 Aug 2025 05:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754025561; x=1785561561;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VuD6u7fV9Qjzv76K1DbU2izt1Ra381ss39n/Ly4u0kM=;
 b=DScBIjQ0ODY9a02ir+rdJYy0QwESa/qdx8wYWEbmnrGhJB7htEp2zvME
 dQs21wTd6efcpkHDpUPY4eeMko5M/BPc8xu9v0Qc5q5Xx9yzaSxxiI4mw
 pfa5Kd8ZEQn54xcNDw61cLjHmYLgqBf6UZrUdEF7TRhlU0eZFdYYYUGa3
 yDuqol4Ni7dOWg13PKA1kGmjN2hcFZQHHbblf0TU8cnDYh6xwMAL7V0N4
 bOOU9z0YBVgemIA8W8s4HPl3U/uLSNaR/MZSSlEC1OV3lleG2OwCj7PgD
 nspMRptaS1PMHEXe4sULIt3I1EaCjhDEEW0Pbuh6xIWPJ+j6P0CRzDmVr w==;
X-CSE-ConnectionGUID: +I0bfPwvTNiv9zHh+kFXSA==
X-CSE-MsgGUID: F4DiQdk0RdGNTTWhzU1lzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67729366"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="67729366"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 22:19:21 -0700
X-CSE-ConnectionGUID: JraXbMJ0QZmymJXFov9DMA==
X-CSE-MsgGUID: L/qr92w1TWy/rzJk0QG0Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="200617731"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 22:19:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 22:19:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 22:19:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 22:19:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrpBIvkfMnZi74CVnvFn7BTtqyn+uV+AP+o61Er2VWaX1DChaDbLx187fm1aU6PQ6icdhMcQOYzYtx/1DBdib1K85oqaNEFf1DoGHc9CYeyM92fvG6V5Jr1ZbCDjOwc+Yegl5gOv63e8dSFu5HFA8jkVY9764MnxpANwZ8iP8YLeCrD6RJ3GJTvy9RgBJxfDJzKwzVc0aJiLjMuT+W7/a700P2VJZnqO351tRbXSCTwfIKfRwD+EICBzVDVbeY58tbioKG+JUHtmaHvVzNa/gitQN8EQDSjBJeeINAN+cjlqPmI6qN+uYm/gMTQg9YHhmb/tt2FO12LXGZ7rXf+f4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwOBACz5qydS+RmojANfBMPfAki5FciGYeMyMhLStsQ=;
 b=yyQqnkOI/jBWZp4EQr3ybq9/uxHRpgB9H/EhYJINb/HHkYAhKIroGVzd0OmjGwtydh2GkQhUY5FL6Jj1CspsUUarlwmOmPPQwzLTMAHjjcT9kK+FB9IDu6lGsnzSGxE3IP+kcPaZ7fG4LAFcoyIv8J+Ag8dUIm67Q6fAG/Jv9PfQdITj5GaL4a5icpfMq+qTym/RjLMoPsmRFe2VuRFcFP773W+sV8X++kHcXnQUM7M6EnmYW+gOlbKtCpgVMcpSoQPU91XynY9cU81PycFJ/slOLBuDz/GN4jXLpS/sgGbY0hYMKEqaLUyT6Vyede5xJJx4niTy0gPa6W9w772sLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA4PR11MB8989.namprd11.prod.outlook.com
 (2603:10b6:208:56c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 1 Aug
 2025 05:18:48 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 05:18:47 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH 03/28] drm/writeback: Define function to get drm_connector
 from writeback
Thread-Topic: [PATCH 03/28] drm/writeback: Define function to get
 drm_connector from writeback
Thread-Index: AQHb/SGaZSHpeNVOa06DzLV6J9usq7REWNGAgABFs8CAAYSngIAHFUdQ
Date: Fri, 1 Aug 2025 05:18:47 +0000
Message-ID: <DM3PPF208195D8D9147AC80569982DE55EBE326A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-4-suraj.kandpal@intel.com>
 <ng2ps7k5h74w6zo62oqazzetunjc2psooobmh3zcrrmxesi2ua@va6z7eqjst2u>
 <DM3PPF208195D8D2676D013483985D2C3FFE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <t5fmzuwiy2otubqftwdghakwmbeltavhbsvrfhgi4tc52uigys@sg2jgz6yjjk7>
In-Reply-To: <t5fmzuwiy2otubqftwdghakwmbeltavhbsvrfhgi4tc52uigys@sg2jgz6yjjk7>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA4PR11MB8989:EE_
x-ms-office365-filtering-correlation-id: 5d11112e-1d9e-46e6-d79c-08ddd0bae4e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?5Qef229NF60ZhPWGjw6GZWhSwhYJkO8NiqvLHicQz+5ocrkUvTUKvEB9b5Xe?=
 =?us-ascii?Q?XJB9rH/J2Yhz3n6Wwpgyw2Gv7UI9jbGSWyqSAT6fpWfrddUyjKktj4uFzBY6?=
 =?us-ascii?Q?fVikDt+WWWJEOeKE4czrBR2MeuUkktUEFL3Kg0n3ZYUSaSzbLpEPW5Glih18?=
 =?us-ascii?Q?9tU9o38M7C+MpPoidKrd0jhwFrrRFcuf9uM9qeq4DP1nyzfsJ6fdf952oO0b?=
 =?us-ascii?Q?go/qYRBJiIwrHskm5xJFOGH9FXv5NAPR93TjO5WzVwwF80YahNzpQE+sESTv?=
 =?us-ascii?Q?gRHy/pFHlGu7jg7Q+gn9ptxXFozHT0FC58C10bIRKO1ap982H0wwtd2itU9R?=
 =?us-ascii?Q?plYNyyTzCV6ZIPEb3Lxe+YrPo3xetiUAVY6+JeiZzahoUgKOKgBdr4SsOGP+?=
 =?us-ascii?Q?+AywIn+FCrTEI2J8YD9n4dHQ04ogZtzgG6/xFE3D/zKMW0IZ/+b78zXrfu6a?=
 =?us-ascii?Q?txgOWdr6I5TO3TWPZ8tqT9MmGarV9FLFb7ZESPcIAxR9HQUwXrxHVGF9kaSc?=
 =?us-ascii?Q?yCpADFprzM+tSEwdCWqZmqP5aGZhRGhuUU4pA0IyQOIvDL6kz/AxVqgXmrgF?=
 =?us-ascii?Q?pN/O+5TS3u05T76An5C29AvYr2JQPlTcghjAwNngt9zMNSA012FqvliKcKuX?=
 =?us-ascii?Q?7f8Z1d7f60H7X7OZ9Ki2ksHkk72On+VVF1WeGYNeqzV6hEqTMuZSR1cHbsIJ?=
 =?us-ascii?Q?/rEe04vXinWvPa6zGo6W3vbZNbMLWRxhsylzB5Y0tPnUMBgNjc3nIqwaCy6H?=
 =?us-ascii?Q?96jwLynBB2dhHZXQemJCl9zGyviuT06cwfYabeEMgScpGe5Hq9zSf4kWqDus?=
 =?us-ascii?Q?tyy6f9BTD41tLIJaUbzCMLs+vip8KJZNW2elH7QJgcyuUMcSlcCkRLpgZATg?=
 =?us-ascii?Q?Kiykkul3bqhL3wwFjAaC9erHgEJ2JPpeZuIjo3O/T1fQSa4e+1szmTiwfWI+?=
 =?us-ascii?Q?MTRAq0C1SyrE40+WmVwZZ5+uv3+irIjBQcBusBMxnG7/ykohDacipLluFv4s?=
 =?us-ascii?Q?heIfF43Amo3vcDKBrmPVyZSOczGqZWZls/kCE8qFmQfEPm+jiWFbKbOC8sww?=
 =?us-ascii?Q?pOndvxKDZMoRqe4msGrOxEEXjX6s88yCZUcH/FoMpYIeNyRKdnZuerFcXimq?=
 =?us-ascii?Q?TwfFfW1YJd78puCRN12xm/RY/pQNM2LtWSvLVGMF+iDEPV9lQAKEtpR436zR?=
 =?us-ascii?Q?H5zsw785AuhjeY2rZ6yZH1E50C1dQalYOWLBDlM54lrjgijDJfLOPStZfXUV?=
 =?us-ascii?Q?Mp4D5jec9GL8GLirJAJMaxrQ8rIWAlERleCYB3RiiS5cQQ1e8GNdgFPbI0Ck?=
 =?us-ascii?Q?leXV++8igdN5ph4G9SYwj/GGoeIONPYomcXTzLrBfCGROHcYrSMC5mNUfeKV?=
 =?us-ascii?Q?qeoLpgsNkrASa2wfkrHj79SmnT3oC+nuRPA+TQJoXgJxdwfLwSFFgjPMZlPV?=
 =?us-ascii?Q?gP2vNPzkAheD8ZGMjXJZ4IToD7Pewo44rlH9w2FlsSd5Eoufq1rt9Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T8y6L4Bz7Vp06h7xGZkOG05eKJPm8/mYQFITqxMg6U+pOOq8zMqdU89uVXcQ?=
 =?us-ascii?Q?HcSjyIupZ0UwX4saZ8B3t0awIBgXjnPVDa19WuyhF9mnmeipiq9bytgc8ukF?=
 =?us-ascii?Q?3PJmfEtTF8hqyjiQMptfSaEPcItLQgAfbqhbVu8PKJBo2zKDp/SranI6SolV?=
 =?us-ascii?Q?tjRr/p49IwOmgiDcyKTvkayvWLjWZ8y2/Y8z6Cb5tBB9g7TSSvxrcq6rJd5W?=
 =?us-ascii?Q?BAsZzKM0g6UDu+Tz2aa9jHo3lAXNxre7RFWSqNiF1B/VW5reC8xOlgThk+ED?=
 =?us-ascii?Q?N3aKWUK8l8JUjZDHD0jM3BEt9cZHd9jT3MRWNxSGkcHswXp+vxcJKgLPBP0W?=
 =?us-ascii?Q?64NrTQzRBbNGZOqBbvEWfRSbVy94ukpePArZEQUygk9nMasNAdgikYklhLqA?=
 =?us-ascii?Q?v6sBjsivI7xPI33RbcZ2GgckmN00QgUtAF6VUNUottCL1jW3pPc4xK0/8I4Q?=
 =?us-ascii?Q?qHSn11Z0jnFa/M3BiOUyy5AVDkKsw1vRtj36s5FFWVo+8/AefV/8mtdGLw7M?=
 =?us-ascii?Q?CGUHDpjb9n+XRg4GXpExY+EpWyPX5kfaEEDbA3a6wx3rkHz6n0I4hx3chdR1?=
 =?us-ascii?Q?aD8F0xpjYMwcVv23z8QIv9uSlNUZzTO7adTCdeR/h239Owoow+514Ti3BoOm?=
 =?us-ascii?Q?k574xrvn9uI82qaX4bZoVcqV0mxJoeYWu6Fb53Jvd7O9YIfMn2U6V7nApodh?=
 =?us-ascii?Q?bIqNwGt9HZDtcZ3V4qpMMEdDHiBNNgAUNthiCRBM3qvwy9eOh+MQlhwp5uSC?=
 =?us-ascii?Q?wicR/Z8SOiPw7G1DnnKeY5ZdprSJtcmBdu0jxBnLGh5VVc6cnr3+5qDGVu+H?=
 =?us-ascii?Q?uFxeaUg6HC96ijArudH+W97gXUf5L/2P/UOSp0iGfAYnSSTDfTvJmfmSN9AB?=
 =?us-ascii?Q?uvHzhoL8DifmMI/h+6j5z+ObZFAMlpLfDqcFV/SGbtxyo8LDPD5J4pIyB/Ub?=
 =?us-ascii?Q?3hY8g7QuZIOjbYPdzk7DqSSCo5pY9wNL+uVEhbt1OShorGuN/DmLuN3hSLBo?=
 =?us-ascii?Q?gthTOaKbTexn82buY2s1WTtRGkHcRY9J+ztCOnX84xbOk5uBXUzHvwxhXcL8?=
 =?us-ascii?Q?UJ+E2MfSFvy0hD7IHw+UQuleGzmsWcnv872k2D4qge7kbdiWaN8diW/JBJqJ?=
 =?us-ascii?Q?krEnJBBZGcBwhanIV60Xfb671pB/4u8+98iOmKl3pA2E3cim3NGwjkhzZcsl?=
 =?us-ascii?Q?w260XB1f2FKUlNvBz2DI82ePXwHOfHRnDs6tnbEpPjFmZa/otU6eIILRhcNi?=
 =?us-ascii?Q?yvsIPpsgl9DM753adkX/KkplLeYOeBrtPHxzH8RU7DzVQ+5zIVvAj8YinL99?=
 =?us-ascii?Q?3HYfzvWSj66AajMd1SjVrr9gGxk3/XrX0S9D15/qnaW5LhfbaNS/jfmspfe5?=
 =?us-ascii?Q?z0alkTJ5lyEPN/zIAdn9oRZm1x0tT99v6JU14er0W0BZNtjvV+FhmW91Zl2J?=
 =?us-ascii?Q?11M12mYNvjOYYuVbc7C8z2/1ZgmS+hcneqtjnjijbiqZo2527XMs7woRdA/M?=
 =?us-ascii?Q?UOLs1064xMhzeMFwuDanf69jMEiFD3pg//rCyWILJILqCqACN63/EumGIq+5?=
 =?us-ascii?Q?ojwWAnHJDdunMm3VoE0mdaOPDhWm+Bqm8PRlCMu8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d11112e-1d9e-46e6-d79c-08ddd0bae4e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 05:18:47.8360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uNNeGXG8HpTRfsr2FXP9PFFnv/OJk1ZLpTv56UxkwU0oVqQEJqWJ7TmRrawuAhzBP2TQNACtCqfC2U/z97ps4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8989
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

> Please tune your mail client to insert smaller quotation headers. This is=
 just
> useless.
>=20
> > >
> > > > Now that drm_connector may not always be embedded within
> > > > drm_writeback_connector, let's define a function which either uses
> > > > the writeback helper hook that returns the drm_connector
> > > > associated with the drm_writeback_connector or just return the
> > > > drm_connector embedded inside drm_writeback_connector if the
> > > > helper hook is not present. Lets use this function and call it
> > > > whenever drm_connector is required mostly when connector helper
> private funcs need to be fetched.
> > > >
> > > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_writeback.c | 33
> > > > ++++++++++++++++++++++++++-------
> > > >  1 file changed, 26 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_writeback.c
> > > > b/drivers/gpu/drm/drm_writeback.c index e9f7123270d6..d610cb827975
> > > > 100644
> > > > --- a/drivers/gpu/drm/drm_writeback.c
> > > > +++ b/drivers/gpu/drm/drm_writeback.c
> > > > @@ -120,6 +120,18 @@ drm_connector_to_writeback(struct
> > > drm_connector
> > > > *connector)  }  EXPORT_SYMBOL(drm_connector_to_writeback);
> > > >
> > > > +static struct drm_connector *
> > > > +drm_connector_from_writeback(struct drm_writeback_connector
> > > > +*wb_connector) {
> > > > +	const struct drm_writeback_connector_helper_funcs *funcs =3D
> > > > +		wb_connector->helper_private;
> > > > +
> > > > +	if (funcs && funcs->get_connector_from_writeback)
> > > > +		return funcs-
> > > >get_connector_from_writeback(wb_connector);
> > >
> > > The get_connector_from_writeback() and
> > > drm_writeback_connector_helper_funcs should be moved to this patch.
> >
> > Want to keep them separate since they themselves introduce a lot of
> > changes on of them has use introducing a new writeback_helper_function
> structure.
>=20
> Let's see how the series will take shape.
>=20
> >
> >
> > >
> > > However it feels really awkward to make drm_writeback_connector,
> > > which is a wrapper around the drm_connector, to use some external DRM
> connector.
> > > A quick grepping reveals API (which you missed) that expects
> > > drm_writeback_connector.base to be a valid connector. And it would
> > > be very hard to catch sunch an API later on.
> >
> > Also seems like I did miss the fence_get_driver_name one which is an
> > easy fix or did you see anything else.
> > Really don't see any other problematic areas
>=20
> Yes, it was that function. However it is a nice example of how easy it is=
 to miss a
> call. Likewise anybody else changing the code might easily not notice tha=
t Intel
> driver uses drm_writeback_connector in a strange way.
> >
> > >
> > > If you want to use DRM framwework, while retaining intel_connector
> > > for writeback connectors, I'd suggest following slightly different
> > > path: extract common parts of drm_writeback_connector into a common
> > > structure, and use it within the DRM core. Then provide functions to
> > > fetch drm_connector from that struct or fetch it from drm_connector.
> >
> > Causes a lot of changes in the drm_writeback_connector structure
> > causing every other driver Using this to change how they essentially
> > call upon drm_writeback_connector. This API was to provide more non
> invasive way to give everyone another alternative.
>=20
> Currently drm_writeback_connector is documented and implemented as being
> a wrapper around drm_connector. You are changing that contract in a non-
> intuitive way. I think there are several options on how to proceed:
>=20
> - Clearly and loudly document that drm_writeback_connector is no longer
>   a wrapper around drm_connector. Clearly document how to distinguish
>   those two cases. In my opinion this is the worst option as it is
>   significantly error-prone
>=20

I think this is already done when drm_writeback_connector_init_with_conn is
Defined

> - Make sure that the DRM framework can use writeback without
>   drm_writeback_connector and them implement all necessary plumbing in
>   the Intel driver. This can result in singnificant amount of code
>   duplication, so I'd skip this option.

Hmm Agreed.

>=20
> - Separate writeback parts of drm_writeback_connector into a struct,
>   make drm_writeback_connector include drm_connector, new struct and
>   most likely drm_encoder. Implement conversion callbacks (like you did
>   in your patchset).

Again a lot of changes to other drivers which everyone will resist.
Something like this was tried previously with both encoder and connector
which was not accepted leading the patch series towards creation=20
of the drm_writeback_connector_init_with_encoder.

>=20
> - Rework drm_writeback_connector and drm_connector in a similar way, but
>   use writeback structure as a field inside drm_connector (similar to
>   how we got the HDMI data). This saves you from having all conversion
>   callbacks and makes it extensible for other drivers too. In fact you
>   can use an anonymous union, making sure that HDMI and writeback
>   structures take the same space in memory.

The idea of not having it inside drm_connector was that it's not a "real co=
nnector"
and we should not be treating it like one which makes me a little doubtful =
on if the
community will go for this.

>=20
> My preference is shifted towards the last option, it follows current HDMI
> subclassing design and it doesn't add unnecessary complexity.
>=20
> Yes, this requires reworking of all writeback drivers. Yes, it's a price =
of having
> your own subclass of drm_connector. No, in my optionion, leaving a semi-
> broken abstraction is not an option. Whatever path gets implemented, it s=
hould
> be internally coherent.

Well to be honest this has already been done with drm_encoder which is plac=
ed
Inside drm_writeback_connector with drm_writeback_connector_init_encoder
so this is not something very unintuitive. Also I feel messing with all oth=
er drivers by changing
writeback structure is the more error prone way to go about it. Also it wil=
l be understood that
drm_writeback_connector does not contain drm_connector to those using this =
API as it
will be documented. So its not really the semi-broken abstraction.

Regards,
Suraj Kandpal

> With best wishes
> Dmitry
