Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4ABAD6DC7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 12:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD28010E782;
	Thu, 12 Jun 2025 10:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBwwrADF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C0310E768;
 Thu, 12 Jun 2025 10:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749724321; x=1781260321;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iN1M4ISRw2JWzufMFkTlq4Gk2f/FmmsNOW5Lr9ykINI=;
 b=BBwwrADFQ+IS4wc9+iLEfBv+sVF/sw04SIVJrQ298V8Cela6HKtiz9Ty
 y1swK8J7yxs4ZeTOKZiIQMh5ZNQWiFSzyGfMBEImyp7FETkKxgS8GdQCM
 /dIsKGPjuuc2Fi2TZ907yQDAbXMD7sZmzBrh4fzmRMlgdvULpJYwmdSif
 jH+zDyPMNVI+URqzvVkG2hc8pA+FOwHhPd+9wpXIlqG9dC9eZecI2UGVd
 LSmjONBrBS7BFiJWCE3RZ6j3NGZKG7g1I1gYFuxZZkr/0pY+QwqHuTZBm
 tdG3dqCNh2kfaocLtVoiV/plcpaDvYNIUlBdgP00nwMjuS8p9oqsjoCoB Q==;
X-CSE-ConnectionGUID: HRUe37pvS6OKubEDtG5Xkw==
X-CSE-MsgGUID: 2SojId3YQruIAc4PJ9cY9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="52042856"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="52042856"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:31:59 -0700
X-CSE-ConnectionGUID: FvUUvUgPQICt6tjZ479MLA==
X-CSE-MsgGUID: Dr5chT7uQHO7/dYxSLyNEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147348394"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:31:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 03:31:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 03:31:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.54)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 03:31:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMllmXRlf6V6tTObbZT2jYtERbPelRm+dc3bvRRcNzDlcQMjVo99NsA+to8dQgmhoaHuSahIe81Q/hu4o4SpoqPP2w/jNAp4h8Mkh0A4FHz/XPNs5pz39EWRO2vIy+LxhIiJwN57SqEcwSAQoO02ihr+TeNLgGPTVXbXC+/rKx1inlhUIky+S1oej2VoUrVm2D47O40GmRBNVLQfnYL2hEyjD50Vi7WYiteY8NE0Kk1GQPb+EUP5Mn/LQx75zD79/iAOmzDvNJqTvrFY3sPqgIrDW/XvOZeZ1JNbkNIoWHeFXhyYJmwhdGFduaedJf1sY5zQ716UV8ggAcNb6tfR8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adQK1O99QbmjEPMFKPVvqehxtLqO8FF8Ln5BkRxypRE=;
 b=gN3CysOyNSrIEzEk6bVaMc31dMqA8XC3nBRlj/81xhlEMvcQlL9MLj/roXa4LSTwQ/4q0Bonq220tLgL/K2nycRB+ctaYtyFvvLkhY1cqVP0X9hOO3/eqRikjXznl6YK2A8ayJsrVNZOdnWjTkOizrSOnq4ron8mwPYPIkM5iLzsi+DO82n081i8pnp2tzxx5jjxEyP9oOVEoapGWmK2lhW/fCS6TD1HdjrEQ0YrH+cBpJKkv58g8anz0WpoMvK+iRyA017oeUCNglX899Y/OrzrFudXJs77yipwm1SM2qvWJkYDnlI1PMt0yo7VoFVhQZvj/lUXK+ne2cxmT0TmRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MW4PR11MB7162.namprd11.prod.outlook.com
 (2603:10b6:303:212::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 10:31:26 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%4]) with mapi id 15.20.8813.020; Thu, 12 Jun 2025
 10:31:26 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 03/13] drm/dp: Add argument for luminance range info in
 drm_edp_backlight_init
Thread-Topic: [PATCH 03/13] drm/dp: Add argument for luminance range info in
 drm_edp_backlight_init
Thread-Index: AQHbrPQjjHgX94DrmU+/a+D20aPY7rP/aJsAgABHZZA=
Date: Thu, 12 Jun 2025 10:31:26 +0000
Message-ID: <DM3PPF208195D8D82C92D58A8780E866EE6E374A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-4-suraj.kandpal@intel.com>
 <IA0PR11MB73072A82012F059738260626BA74A@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB73072A82012F059738260626BA74A@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MW4PR11MB7162:EE_
x-ms-office365-filtering-correlation-id: ebd1dcd9-a06a-4516-80b5-08dda99c494d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?eLBavVEhoEBERVJbiZ0r9a/hnubsnEkZNpixfeW1irFJbWSkB+LRa+KIbaf8?=
 =?us-ascii?Q?iezqIJ040mmrix7GDs/xiHexpTnMm2cBHToqJpJv9XHsGb11U/ai5yLIUoCK?=
 =?us-ascii?Q?Ktf1Kb9xMKmw9YO5qIZQt9G5izETw0YJ1kv6kI9cYp+Ko/oYvRFfC3MKCYaL?=
 =?us-ascii?Q?cFQQvYyN9e4l58nrHuQW0PahXsAfvo0wapXdaYdLSiG2KO4ajCIX9/hNCf1o?=
 =?us-ascii?Q?lvDPyE+aTrnaze56+ApjsGSloL+YWPzgNelSfLCeHdfwlPIMJgkO3DDKGzdb?=
 =?us-ascii?Q?EekFs7qeJYuG0/oeDt0gdpKWQArKTuWP+nBJzIyxyJW1XkKMWzWLWJR8aD50?=
 =?us-ascii?Q?3jvsyfbUXO9TRF09WzFDxVWAEuZDDZDWwknfTSWbvV1VR0YQ3cHxRD1NvMWw?=
 =?us-ascii?Q?e2b3u1UX7IxS6XzVIc0Wzc0S7vZHhVjfQ3trWjOpc9PJbpytIdSmXTpg43EO?=
 =?us-ascii?Q?VSOTXfrUeVYtDqlrswbHclV0uRT9dVn4qalrCPh7WAC7fsvzk9ZJBppryXmf?=
 =?us-ascii?Q?sOLAc3YhAh8tmH13ZEqUD6Q7se3kZPVRn9flzm1UQhrDgUpXn91TmAw8Pedt?=
 =?us-ascii?Q?PGDItgZ/WIxR/L6DsqF5rTzhPPvACSX3BvbdMGRo5VyXAiLn6f887dhuxp8n?=
 =?us-ascii?Q?eYE4vNCk4I2/mgPl3koJNhFBOqDklDxmaEbdEfhALKIEvbn1+n1vgDoeDvzb?=
 =?us-ascii?Q?Xdxf0OlaOAAtiR76SmN3kzVgxStuc/6iceDel8QM1wjFEOB485jbTandKkBT?=
 =?us-ascii?Q?9C5TOFVk+0yUZpG75k/Zo3f5vdpl1n7YPre9eqn1A50ZTi99dRlJj4Wz0zM8?=
 =?us-ascii?Q?RZEjDYcInLyNvSloQHDNBvYIM7cR79jeVFacPjJ4SAcZdBQp9bTpu8YyP52Y?=
 =?us-ascii?Q?2jAiHEz02A5AB9rn6gVNYxFDavWzZ8mL2Uy+RjdX7/j1HgzU9On9Q+QV/oRZ?=
 =?us-ascii?Q?VVSiHCoR4+g3yhPRomJkV9fqMrLikEhRFTObiG3dtD+/iB+xygveCuUPPnWe?=
 =?us-ascii?Q?3zLq5OZPpfdc+7kKFVdixKrIp0MJyF5wb/ycudqHfljDAJd00lbbA11gfePi?=
 =?us-ascii?Q?ehWM4lukC0zJRIbPgXpV6vs7PcVouBp8YRzx/FEr5vY7vqA0n1teEyU9c9vs?=
 =?us-ascii?Q?b2RmXv3y4mHi1eT3z4R97D8pmtdnBM8x5gXrR7wi7yYDYQxacPVH1GXXMaTl?=
 =?us-ascii?Q?yM3xtRxnNn+5w06NyKJ4jx7y8w7huD5Fzz8676V6A0ovR049Zi2KIyDC8+hE?=
 =?us-ascii?Q?Et5i+dzZWAVPXbQ2nhH4ruPy0/3vlmgLXoAnAorbuqYZJ17H4+ETleU8QTLN?=
 =?us-ascii?Q?A6TnCuCS/zq6lTQbwbE9Zjn5mDsrjYkC6ph6LL50x7ebVy1PNJi+39n0DVin?=
 =?us-ascii?Q?8J3+OTsReZnaGv68OuLQDsr3+/OrrW/9diw7EglIQUrCTmvkfbdDtYP5mdBE?=
 =?us-ascii?Q?pCXNsdbKhfaUN90ZX2zifPXDrJVxNxR54Q8j4hPUkXWnlEWRUJSX8GZWgBvM?=
 =?us-ascii?Q?SM8hFmyt3aukXoI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2pJvK8OPE3Jh6zJtcl9E5P3rraCBhK5p2M/uKG7GxnSKdxovs1uW6Fbz3jqc?=
 =?us-ascii?Q?n/HF/mNLy99rVzRusOA9dNK0EwnWbjhaxxkKyia1hXnbp/sEIoA+P6zoaY3v?=
 =?us-ascii?Q?BZtU51prXHTW/RGATwzpcXd2kdS/V380bMtyj7NgGuhCRcP+0vGwDZr+zbOS?=
 =?us-ascii?Q?J8R8sLABC8ct1Y8ReXgLSc6TPm0NhiwroD7BZ+gLyum+38GIgfauCUZraQZI?=
 =?us-ascii?Q?0ay1psMCjc0MbGyzEMenWyF1H1NHypI07PP5ZA5yb4qkCFR7vnVSm29/72Az?=
 =?us-ascii?Q?urj2ZS4GXw/4IA+jYIs/mOQNH/WFAuN7vT4dkCkBgrjS0QMf0VkF+Si4SpvU?=
 =?us-ascii?Q?i4QWSa3QGmaOezhVEcj3l+MBqT0qKG+sQIi9NmFKTs9DDrOKNzzaO/rP01lL?=
 =?us-ascii?Q?mwdjqhYbNNhTurEHZyx8zUNB/UYL+AQGpgFuIBf9/mhLt8ZLM2N8mMe39xEg?=
 =?us-ascii?Q?WYYRwobCnIMCqBGwg5prJL4Q803arluO6yGot/a7bMz/XDd37+HB+wQv4E6B?=
 =?us-ascii?Q?Xg5slS4xNwirB150lwIr/2zg4LGeZqgBBDjVKcnesy+2i66DskQBZe0tgmlU?=
 =?us-ascii?Q?2wzj30Xu6NrAepNLiq4YBVlZ1LYG4e7y5rML0m9m6Y74tsNMBpLdnsWftxg6?=
 =?us-ascii?Q?9/Rgs3TbWR1+t49g6xYZtvtJK8uE9j6pwJCsvI6rn41mdG8HPzEyUCKjTIxg?=
 =?us-ascii?Q?RSvVpbdJeEkxiFiaEqI7/D/9HdTf/NoyAoIvvrHL2wb96U9kKkQcvxExnY4c?=
 =?us-ascii?Q?WfEet0+IqWCXep3/rRCtVTvnWzNgHqwjRqSPO1BVtZ9VLexaJX7ERjLHjk0K?=
 =?us-ascii?Q?GNZMc2C3ZIVj7V3luMLDdY1Rr+cH4OrGf206AVgO+K7CMI0TcLDOmqd86LoE?=
 =?us-ascii?Q?iYVjIoLvZqehoB1JisdhGl+9Xpy1fi8mEChwQV9G9/aH2QenEGfl2EuNSs7n?=
 =?us-ascii?Q?R9WrHnS3TuWlAkESf16gCMkaXQPFFf1Ilkn9F+sxP8RiAMjq7XoW/z2Hmkfk?=
 =?us-ascii?Q?iVNgT0if0QZRPPjffqTN1oGpRRT8vjR8d9LO+4JjD5s4e0XEV8qb/G9OG3aY?=
 =?us-ascii?Q?TBSX0iIZWFDVDFddVfJUzCVMFzyQx2pPsEUpLuejrKvgIHAPiAPdVxHAF8WH?=
 =?us-ascii?Q?N+rxZmNTyhHZtbGMvGW5CGtE9ZEq2AmyyHPLlZ6Uoubi8UNpfeXKeXq9nQ2m?=
 =?us-ascii?Q?N9tpjJ8PRI0Pu+tgzvVs5VRerCBf8rFZAJ6OvcsujHUQ3+zhnFEriPxLaYq5?=
 =?us-ascii?Q?VROJ3QRLCWSwfDYHmVWyW1imUMZX1czJ2XwFxB8yvrkXS+bma279iHVRShvY?=
 =?us-ascii?Q?qLhCNAjOZpaQLu9SVQp8PpPlbrTVBI6LIbhpWkrP7EWwkuh+aem49J1ZsUcO?=
 =?us-ascii?Q?OdXgBCyWR3k7DNkQcfZuGCBPK0AttMhFd3M9cRPotPG9zVdsvxLwdrB8253O?=
 =?us-ascii?Q?iWN6ofJ5HE65YbGJdEg4OaZmkhrL5weNOZmgA95kj1sX4FwqIqQ1Zt9wFVCy?=
 =?us-ascii?Q?LfYkqCuVD3kRWd54O6WQwCO/Pek3sGcd8K1vwFZVBPCgQJxYcOkdR4LQHppU?=
 =?us-ascii?Q?rNDmWdy9E/bhZOT4liEqufkCtjkpNjjf+mANcOCs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd1dcd9-a06a-4516-80b5-08dda99c494d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 10:31:26.5553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9wtjl4Ptel8w7PNwpqvZ8UKG8KO9VkczgRtWJTynmDBXa3nUZeqrbUjoQ8+dw68vdQoMjFDkI1fwukVyyCvH3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7162
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
> From: Murthy, Arun R <arun.r.murthy@intel.com>
> Sent: Thursday, June 12, 2025 11:45 AM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>;
> nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel-
> xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Subject: RE: [PATCH 03/13] drm/dp: Add argument for luminance range info =
in
> drm_edp_backlight_init
>=20
> > -----Original Message-----
> > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Sent: Monday, April 14, 2025 9:46 AM
> > To: nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> > intel- xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> > Subject: [PATCH 03/13] drm/dp: Add argument for luminance range info
> > in drm_edp_backlight_init
> >
> > Add new argument to drm_edp_backlight_init which gives the
> > drm_luminance_range_info struct which will be needed to set the min
> > and max values for backlight.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c               | 5 ++++-
> >  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 5 +++--
> >  drivers/gpu/drm/nouveau/nouveau_backlight.c           | 5 ++++-
> >  include/drm/display/drm_dp_helper.h                   | 1 +
> >  4 files changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> > b/drivers/gpu/drm/display/drm_dp_helper.c
> > index 99b27e5e3365..3b309ac5190b 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -4227,6 +4227,8 @@ drm_edp_backlight_probe_state(struct
> drm_dp_aux
> > *aux, struct drm_edp_backlight_i
> >   * interface.
> >   * @aux: The DP aux device to use for probing
> >   * @bl: The &drm_edp_backlight_info struct to fill out with
> > information on the backlight
> > + * @lr: The &drm_luminance_range_info struct which is used to get the
> > + min max when using *luminance override
> >   * @driver_pwm_freq_hz: Optional PWM frequency from the driver in hz
> >   * @edp_dpcd: A cached copy of the eDP DPCD
> >   * @current_level: Where to store the probed brightness level, if any
> > @@ -
> > 4243,6 +4245,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux
> > *aux, struct drm_edp_backlight_i
> >   */
> >  int
> >  drm_edp_backlight_init(struct drm_dp_aux *aux, struct
> > drm_edp_backlight_info *bl,
> > +		       struct drm_luminance_range_info *lr,
> Would it be better to have this drm_luminance_range_info inside the
> drm_edp_backlight_info?

The thing is we fill drm_edp_backlight_info struct in drm_edp_backlight_ini=
t
Which means we would have to pass it anyways. So having a reference of this=
 in
drm_edp_backlight_info didn't make sense.

Regards,
Suraj Kandpal

>=20
> Thanks and Regards,
> Arun R Murthy
> --------------------
>=20
> >  		       u16 driver_pwm_freq_hz, const u8
> > edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
> >  		       u16 *current_level, u8 *current_mode, bool
> > need_luminance)  { @@ -4372,7 +4375,7 @@ int
> > drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux
> > *aux)
> >
> >  	bl->aux =3D aux;
> >
> > -	ret =3D drm_edp_backlight_init(aux, &bl->info, 0, edp_dpcd,
> > +	ret =3D drm_edp_backlight_init(aux, &bl->info, NULL, 0, edp_dpcd,
> >  				     &current_level, &current_mode, false);
> >  	if (ret < 0)
> >  		return ret;
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > index d658e77b43d8..abb5ad4eef5f 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > @@ -600,8 +600,9 @@ static int
> > intel_dp_aux_vesa_setup_backlight(struct
> > intel_connector *connector,
> >  			    connector->base.base.id, connector->base.name);
> >  	} else {
> >  		ret =3D drm_edp_backlight_init(&intel_dp->aux, &panel-
> > >backlight.edp.vesa.info,
> > -					     panel->vbt.backlight.pwm_freq_hz,
> > intel_dp->edp_dpcd,
> > -					     &current_level, &current_mode,
> > false);
> > +					     luminance_range, panel-
> > >vbt.backlight.pwm_freq_hz,
> > +					     intel_dp->edp_dpcd,
> > &current_level, &current_mode,
> > +					     false);
> >  		if (ret < 0)
> >  			return ret;
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> > b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> > index b938684a9422..a3681e101d56 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> > @@ -234,6 +234,8 @@ nv50_backlight_init(struct nouveau_backlight *bl,
> >  		    const struct backlight_ops **ops)  {
> >  	struct nouveau_drm *drm =3D nouveau_drm(nv_encoder-
> > >base.base.dev);
> > +	struct drm_luminance_range_info *luminance_range =3D
> > +		&nv_conn->base.display_info.luminance_range;
> >
> >  	/*
> >  	 * Note when this runs the connectors have not been probed yet,
> @@ -
> > 261,7 +263,8 @@ nv50_backlight_init(struct nouveau_backlight *bl,
> >  			NV_DEBUG(drm, "DPCD backlight controls supported
> on %s\n",
> >  				 nv_conn->base.name);
> >
> > -			ret =3D drm_edp_backlight_init(&nv_conn->aux, &bl-
> > >edp_info, 0, edp_dpcd,
> > +			ret =3D drm_edp_backlight_init(&nv_conn->aux, &bl-
> > >edp_info,
> > +						     luminance_range, 0,
> > edp_dpcd,
> >  						     &current_level,
> > &current_mode, false);
> >  			if (ret < 0)
> >  				return ret;
> > diff --git a/include/drm/display/drm_dp_helper.h
> > b/include/drm/display/drm_dp_helper.h
> > index ef0786a0af4a..6f53921f5dce 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -849,6 +849,7 @@ struct drm_edp_backlight_info {
> >
> >  int
> >  drm_edp_backlight_init(struct drm_dp_aux *aux, struct
> > drm_edp_backlight_info *bl,
> > +		       struct drm_luminance_range_info *lr,
> >  		       u16 driver_pwm_freq_hz, const u8
> > edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
> >  		       u16 *current_level, u8 *current_mode, bool
> need_luminance);
> > int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct
> > drm_edp_backlight_info *bl,
> > --
> > 2.34.1

