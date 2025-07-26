Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E2EB12B81
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 18:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C5E10E2BF;
	Sat, 26 Jul 2025 16:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVrJjfMi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C747E10E293;
 Sat, 26 Jul 2025 16:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753548604; x=1785084604;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yfMsZStCY+P5yf+YQq9N1t2jQvxml2imafabY/a6FJ8=;
 b=HVrJjfMiw3p9zyNdVMftNyjZ7QtVyxwV0cj8lvCXPPh8VIj2dSwlwovp
 cAgs2d8XD6Uaj2zcOajkRFWEI0ZbKBMZG7mRb3If2h5Oksq2474mpPb9O
 qhR9KB2oyyCBYuFvLp5zg5MR7ofma482sxFqBtcyQGZSSP1CHV9POIEt1
 0NTopUSETTjoU8I8tU79tF1JJC9w4iLIioXJpB/t+olLhS6Z3xt8xTuk7
 BD5tC0bN54y518AgpwXWuJWV4bP5A8Oy5jHn3oAHfW7p3HzqeGIZ4NFo3
 32/N57ZX88pWeCldwrJYdNouUVBbuDfz4RPv7IhVN5O6GC2h8+BAH4fJ0 w==;
X-CSE-ConnectionGUID: Q2tUuB+cSlC2fMoYTnObGw==
X-CSE-MsgGUID: o/rufsdiSliBl3CTDnSc3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="78408249"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="78408249"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 09:50:03 -0700
X-CSE-ConnectionGUID: CsiRUp46R+ewWM6irzCm7A==
X-CSE-MsgGUID: F+rg5lIcRy6BAUBnHkZvFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161283253"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 09:50:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 26 Jul 2025 09:50:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sat, 26 Jul 2025 09:50:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 26 Jul 2025 09:50:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJu6kwpwqkfgqxbjAXOqr0/2fpevVRYWb84KNrvpbzJyOOohPMb10r3GrKRbIJ3tvT7pYKPJzSR2beiKR1elDO6bNHXq2rfTfhKZ4HjVP78X1GGIHH4wb/LY0pWdwSX0TxRDhOnxwF/bm55mHYcTqflFWvBewjTWqJ6lVXiNmDD6jPmTQLe817FO4kBUjXUtx1WFdMDu8ZbIHDihhrKimElx4oywa8HRIXyPtATkEZxPUHHZTwBQJU8BHsPKby1ojecieBXEX/vIfojIOGI6lti5OwB+YPUT2YbLRShsxHTF1y48ZzYNyTbR/7yVIpucJe70scTnAHYgYUQY9RS7nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMD5JyrB2dr/AqrJSLxv/vf/S3Urpy+LxmSbcM7eGe4=;
 b=KNd7d1BR/OevesWfH1apCtoOZaNNZeewFfvj9UiRFxOo2Nrrm7DC51OWY6TEGIyTiUdqIWd/vnnrvK5l+47M2VrDw4KXTHHg5tUHYFJvlf1gFuWATb2CyvZAZi6f6Nb+xxdPek7/+AcTpAHz0+QstOwZBPSKNZq+KJ9bMHQGLGn7iq7m7UnSAC2lI/4fKU7Edn98/aJLcLgtB6PC9PUv8BiBoxntuGlCBKh6ltAQHMLMIopHPdodWDJehBihMDnmR77YdUpR3lkbtReuJk881VLKMveaGhAHMRc375vWT5M1bARgQCcYFEgKo1VamslLgWl5wJsH7WEJzwX1JAQv2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA0PR11MB8336.namprd11.prod.outlook.com
 (2603:10b6:208:490::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Sat, 26 Jul
 2025 16:49:45 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.8964.023; Sat, 26 Jul 2025
 16:49:44 +0000
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
Thread-Index: AQHb/SGaZSHpeNVOa06DzLV6J9usq7REWNGAgABFs8A=
Date: Sat, 26 Jul 2025 16:49:44 +0000
Message-ID: <DM3PPF208195D8D2676D013483985D2C3FFE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-4-suraj.kandpal@intel.com>
 <ng2ps7k5h74w6zo62oqazzetunjc2psooobmh3zcrrmxesi2ua@va6z7eqjst2u>
In-Reply-To: <ng2ps7k5h74w6zo62oqazzetunjc2psooobmh3zcrrmxesi2ua@va6z7eqjst2u>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA0PR11MB8336:EE_
x-ms-office365-filtering-correlation-id: 7ccff216-314e-4d37-acf6-08ddcc646cad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Lg8n5+EpzM2IWdW+zm5Ty62Vcg7dCYwj924dn8nqebZ6cPkU0oG5ljdmdguw?=
 =?us-ascii?Q?j6K1RkCX3zzg1SZHwrYI/0JIbkh7kW0dfQJrTBiXaKTqHtL0cXNTzD5G8+C6?=
 =?us-ascii?Q?+tZvaCdcClLNfiILjwhELzRa+0GWMlGiK6IyQDtqyEfb1uwjLznLrxalINvF?=
 =?us-ascii?Q?PDJg/B4FnQN/4mdqYwcm9m9srRLZzHWIONKBPzjfoc/xgvh/zCyW5R0gGUt7?=
 =?us-ascii?Q?n0hOE6dRsrjBSgH2CrYYlGjNXJS7c9dTe4jG3VkF0UnQabRVZiEiHnqbTDiA?=
 =?us-ascii?Q?1bVuK7883HPEIxOc5hH3y2FHhzBEp3EZv1vo1io66B0xGGVRtxiuD7mawUL1?=
 =?us-ascii?Q?ZOV5wmPkzWKEEChGwx7SsgrOil117Yhnj5sExHevlRoXnXFamAii/j3cWuPM?=
 =?us-ascii?Q?DZefbu8fXfaOiKm+A1PTHeua3dIz5X+nqzmofV47Erz+7ubKyxMXOjjqk7MF?=
 =?us-ascii?Q?Ub79PFUj0rowFGZxen9fN6FdDTQuO7IJGIQThfrWgRV9cpD/ricV1f8C5Zho?=
 =?us-ascii?Q?xHtbARTgY00kDkomMjuT4U39odg1KMx7oq0ZGxI8N+wRTOWl8NBlLhQ/Epxs?=
 =?us-ascii?Q?hVHhgHoUniJMLHkswqrgcJ9flRecUxwSiS9P9/hMvuERq9w1VRqtHkFP1Q4x?=
 =?us-ascii?Q?OtRdjiXEa7/33hlXQGpH3kxIl+mp/FAHyYzDm8UiRQZ4hhDgSgb4/jTEzaog?=
 =?us-ascii?Q?oG9YKlIOXzv84NMZzYwkSK9d9v8vOIHR1164BIrim1aU2um9bGS4qnq25XQE?=
 =?us-ascii?Q?dWm2uZNdPBWnwYsK1AedXpCBlWn6pEn6tv9NH9MD46a/xpjxtN4pZES+CHsQ?=
 =?us-ascii?Q?Q5MXkadvfEh3xSZE0wZYWD3fwiCGWpS15apVr5+d/lv4PDOyZvUSNDbgUni6?=
 =?us-ascii?Q?vnQnxyKh+MxhtgsH4nG0zVlv0YiO0ErXxsaTngrQbbC6Pd0+6U3Lkm1+Y2hr?=
 =?us-ascii?Q?mSkVJCXLrYUOFGbkRJZIPFGpkFI9I6V+AaW41dTQA1d8J1R3SJ/CDnex91Rc?=
 =?us-ascii?Q?IH7qbvRi3C96++m/tYIW+dOg5Ti0PKcPipjV7wTAvdeNOOm2pJKeboAqjM7V?=
 =?us-ascii?Q?kI21DRSvHTkSTnmQffuWypO6niGSkKA6UASahxXMdIRLZLexiE2et/suqMFG?=
 =?us-ascii?Q?2s2ua0wwnL/KYuiMF555DwOPnxydjg8o90wVCoL/EVNA0FTZS1jvZZL9Wuv3?=
 =?us-ascii?Q?ebB97Mg+lHKhx2QLptGXmqd/r/w0cjRtfIn8cnduYaAXe243sy1oZMwUjBrv?=
 =?us-ascii?Q?w1/PMjxSjfCRuYeODKVSwMYG0Gs08RLnkb+bODojo8mfdrNLqjSsCj5AYgqm?=
 =?us-ascii?Q?YLPmL9RCvk3vO/TisG7k8GkRsiCE2MV1hjoNnhVDIsUJVKGf+n5xOvwgbehH?=
 =?us-ascii?Q?QsOgmEKl7O/dze1zx+il5rUYOav9u8myikQ/p81AoKks6c/N/RtcZqrw0MJZ?=
 =?us-ascii?Q?nd0FqBOjBzq/cFPoieCPR8WodJsRlqhNNJmxIKgdEJC/JoWv7AjsTg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BlqRiKXWJgg7zZKFyRlj3+iDTkAExjHqlN729UvhcyFtCfXe/yEStxw8FfzP?=
 =?us-ascii?Q?pNhAkMX109RAIXc/LOQPRrwHmGmpn8IT4Si7bpjAvsGu5hadmPFq8egMzutX?=
 =?us-ascii?Q?529tz9WQE6z+jYzFlkOROYMu3vuYKgisVoQ4/JhQnyuRmdmS54TqwZCDeJ7R?=
 =?us-ascii?Q?62bVaomdZqw3ZqIHHrDdqnESs6b4Oj1j/L8hiJqAhRVu3XDxfo8bk78lrzzy?=
 =?us-ascii?Q?NTd+kFpBVievlKlLJHNDazGW6O4EZgycay3ADsbWUTwoekqHTN1vNPiIgIC8?=
 =?us-ascii?Q?GivH1768H8UrmC918+WyVMYLSLSNpgW7GJ36t9VMYPNfXgeeB+KsMdk0Oy4o?=
 =?us-ascii?Q?TiZqHUvyuOzxYqJG8YYtRFL9ojuxLWFTYQzpRxfcXFnIsKKhnDjBDWQKN7AY?=
 =?us-ascii?Q?JAZW3b3ZM816vPTlH+uVmKRr8BYYBLqJCakeP0/nTxwigKMdyfFXFaOpJc4P?=
 =?us-ascii?Q?zEfk8ylkLFNQlGNLt+d1COpvSCirF5CBhdhBAa/jIDakM9d4/4w/4xOPnYNl?=
 =?us-ascii?Q?dJPdFyUWUvQw+7BYNOllvOy85V6DitNSMpWquamK2+NHvJhi4BSAUCMcGHi9?=
 =?us-ascii?Q?6tYhxnC+itrbk3icD27uI0AdP9oSJ8YW5m0Dl+1CXeGN/ZnSR6WQ3hQISjOv?=
 =?us-ascii?Q?yJESrLjXFT9HfWM0S4LhatdgghuFxD4j98PYkk63nv1h1wwD8dM1clLNcxB3?=
 =?us-ascii?Q?wUYDCyG9gW5qEKVntmdLgAutCpH1OZiU21GKFhpA3D8/QRx+chX0sEBSyBFD?=
 =?us-ascii?Q?kF/xr6cdeTA9DuSlhnlMw+q2Jd42G9ldEEdoLsNoV6gfsmthyCdZsPQeEOTk?=
 =?us-ascii?Q?hWBbks9pRatCn0FWinhb23W0JWmp9QeczLAS0V+VAqBxxy//QtVKfYoRQoYE?=
 =?us-ascii?Q?BiWakNbQ1gL51H9NmTJThiKJob/cQdbeHHvYUT3HAfBZHVMT5jBVQsu7NAYn?=
 =?us-ascii?Q?iq+0j+MykCfccCeB2LK147Yme/Tu93J2eZ80HmgL7opKMb/0fCWyi9UnRE+w?=
 =?us-ascii?Q?lFPLA5LVoZSxXXIuZJxWzUXqGvJQO70NcylfJJtPDZ6/7Q4zlRoLyy7EQA4H?=
 =?us-ascii?Q?IXLz40NaJCLGTpwlrYRCozCFR9BwgLeO/REuM7i2ovK3/PoLSU/6ZMNWHYn7?=
 =?us-ascii?Q?YxCNt1wy9m7OmrVVYTpnOhaUwtfNAM7d68JURri7E+94hYCkxkHr5wNzj2pL?=
 =?us-ascii?Q?mO4ZXwU9987tskTc+/LSpU+fMtr+DdVJk28VUkJxje0T0Ak2iadCUrXzOl/a?=
 =?us-ascii?Q?bZ94VKJuJRkq57eFbk6X/P0zIwW/J6WXvdm8R/IUPXV7gTwI7Lk1N2IPJYxo?=
 =?us-ascii?Q?KsSVEJSZ2uatRo1O7WfhK4F1Yrv4Ql+WSmufUcX5831VybKcMUbNeE7W/Ud1?=
 =?us-ascii?Q?Y/4Tyd4emRgvmQozC7TanzFCTa03pHYF7uCyu0jV6r2ej/UtmOcR4DmcBe1P?=
 =?us-ascii?Q?e81khhsg6PVefkIqS1g5lQ8/6OhjQO77/4GS0btvrSeQ2yHgBjbskRz/Zz0T?=
 =?us-ascii?Q?jnX4f0jDquyxa5uzvfEoiTRCOd033NmAdnsWEUhMwXUlvVHc5X6k5xVn5nMU?=
 =?us-ascii?Q?rZ4xtQqwYIk27U2OeIP6Nzdhw6Xz3c3nHmQDzDFc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ccff216-314e-4d37-acf6-08ddcc646cad
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2025 16:49:44.8401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AicOFaj7V7g01Vrs1i8aHqN6uEOHJjlrO4UYS5yCDMHucWsNvOHQkn65gTye3Qn8k+EpY6g1X7R53OFhWAe3Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8336
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
> From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Sent: Saturday, July 26, 2025 6:04 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; inte=
l-
> gfx@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>=
;
> Murthy, Arun R <arun.r.murthy@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>
> Subject: Re: [PATCH 03/28] drm/writeback: Define function to get
> drm_connector from writeback
>=20
> On Fri, Jul 25, 2025 at 10:33:44AM +0530, Suraj Kandpal wrote:
> > Now that drm_connector may not always be embedded within
> > drm_writeback_connector, let's define a function which either uses the
> > writeback helper hook that returns the drm_connector associated with
> > the drm_writeback_connector or just return the drm_connector embedded
> > inside drm_writeback_connector if the helper hook is not present. Lets
> > use this function and call it whenever drm_connector is required
> > mostly when connector helper private funcs need to be fetched.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/drm_writeback.c | 33
> > ++++++++++++++++++++++++++-------
> >  1 file changed, 26 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_writeback.c
> > b/drivers/gpu/drm/drm_writeback.c index e9f7123270d6..d610cb827975
> > 100644
> > --- a/drivers/gpu/drm/drm_writeback.c
> > +++ b/drivers/gpu/drm/drm_writeback.c
> > @@ -120,6 +120,18 @@ drm_connector_to_writeback(struct
> drm_connector
> > *connector)  }  EXPORT_SYMBOL(drm_connector_to_writeback);
> >
> > +static struct drm_connector *
> > +drm_connector_from_writeback(struct drm_writeback_connector
> > +*wb_connector) {
> > +	const struct drm_writeback_connector_helper_funcs *funcs =3D
> > +		wb_connector->helper_private;
> > +
> > +	if (funcs && funcs->get_connector_from_writeback)
> > +		return funcs-
> >get_connector_from_writeback(wb_connector);
>=20
> The get_connector_from_writeback() and
> drm_writeback_connector_helper_funcs should be moved to this patch.

Want to keep them separate since they themselves introduce a lot of changes=
 on of them
has use introducing a new writeback_helper_function structure.


>=20
> However it feels really awkward to make drm_writeback_connector, which is
> a wrapper around the drm_connector, to use some external DRM connector.
> A quick grepping reveals API (which you missed) that expects
> drm_writeback_connector.base to be a valid connector. And it would be ver=
y
> hard to catch sunch an API later on.

Also seems like I did miss the fence_get_driver_name one which is an easy f=
ix or
did you see anything else.
Really don't see any other problematic areas

>=20
> If you want to use DRM framwework, while retaining intel_connector for
> writeback connectors, I'd suggest following slightly different path: extr=
act
> common parts of drm_writeback_connector into a common structure, and
> use it within the DRM core. Then provide functions to fetch drm_connector
> from that struct or fetch it from drm_connector.

Causes a lot of changes in the drm_writeback_connector structure causing ev=
ery other driver
Using this to change how they essentially call upon drm_writeback_connector=
. This API
was to provide more non invasive way to give everyone another alternative.

Regards,
Suraj Kandpal

>=20
>=20
> > +
> > +	return &wb_connector->base;
> > +}
> > +
> >  static int create_writeback_properties(struct drm_device *dev)  {
> >  	struct drm_property *prop;
> > @@ -478,6 +490,7 @@ drm_writeback_connector_init_with_conn(struct
> drm_device *dev, struct drm_connec
> >  	if (ret)
> >  		goto connector_fail;
> >
> > +	drm_writeback_connector_helper_add(wb_connector, wb_funcs);
> >  	INIT_LIST_HEAD(&wb_connector->job_queue);
> >  	spin_lock_init(&wb_connector->job_lock);
> >
> > @@ -527,13 +540,15 @@ int drm_writeback_set_fb(struct
> > drm_connector_state *conn_state,
> >
> >  int drm_writeback_prepare_job(struct drm_writeback_job *job)  {
> > -	struct drm_writeback_connector *connector =3D job->connector;
> > +	struct drm_writeback_connector *wb_connector =3D job->connector;
> > +	struct drm_connector *connector =3D
> > +		drm_connector_from_writeback(wb_connector);
> >  	const struct drm_connector_helper_funcs *funcs =3D
> > -		connector->base.helper_private;
> > +		connector->helper_private;
> >  	int ret;
> >
> >  	if (funcs->prepare_writeback_job) {
> > -		ret =3D funcs->prepare_writeback_job(connector, job);
> > +		ret =3D funcs->prepare_writeback_job(wb_connector, job);
> >  		if (ret < 0)
> >  			return ret;
> >  	}
> > @@ -579,12 +594,14 @@ EXPORT_SYMBOL(drm_writeback_queue_job);
> >
> >  void drm_writeback_cleanup_job(struct drm_writeback_job *job)  {
> > -	struct drm_writeback_connector *connector =3D job->connector;
> > +	struct drm_writeback_connector *wb_connector =3D job->connector;
> > +	struct drm_connector *connector =3D
> > +		drm_connector_from_writeback(wb_connector);
> >  	const struct drm_connector_helper_funcs *funcs =3D
> > -		connector->base.helper_private;
> > +		connector->helper_private;
> >
> >  	if (job->prepared && funcs->cleanup_writeback_job)
> > -		funcs->cleanup_writeback_job(connector, job);
> > +		funcs->cleanup_writeback_job(wb_connector, job);
> >
> >  	if (job->fb)
> >  		drm_framebuffer_put(job->fb);
> > @@ -665,9 +682,11 @@
> EXPORT_SYMBOL(drm_writeback_signal_completion);
> >  struct dma_fence *
> >  drm_writeback_get_out_fence(struct drm_writeback_connector
> > *wb_connector)  {
> > +	struct drm_connector *connector =3D
> > +		drm_connector_from_writeback(wb_connector);
> >  	struct dma_fence *fence;
> >
> > -	if (WARN_ON(wb_connector->base.connector_type !=3D
> > +	if (WARN_ON(connector->connector_type !=3D
> >  		    DRM_MODE_CONNECTOR_WRITEBACK))
> >  		return NULL;
> >
> > --
> > 2.34.1
> >
>=20
> --
> With best wishes
> Dmitry
