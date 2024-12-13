Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 051E29F0722
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C5910EF6B;
	Fri, 13 Dec 2024 09:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X7CqxDti";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B16810EF69;
 Fri, 13 Dec 2024 09:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734080551; x=1765616551;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W2LgskbEJs+sHwCHMO3+mLAhiCNWB5J0PgXrbS0trVc=;
 b=X7CqxDtiNTKk2txbmKkWGg6ExpE7MFsjX3s20YVilHZC6a7pW1YxXcCj
 l+rOKcHvo+zM24IB2CWn4Fciv1trdXzlRVBmxap3l1/8RxXV34tp+wEBZ
 PlQRONvddC2nknsFxd/2Q67JULg5sOQdK0GmQisbOJPj1EvfUCcyRJqN4
 Yw5gAienOc9MrMfP6u9H8pD2hjm0NfgwH1YC9rqPxZAA6liTPIePZsuxD
 aftzU837SP3OMahu/dr7Ab0GllhHnuncfFKSTP3oFMZEzJlmUYPt9hkHm
 Nq137jXh065pLArS6XOWw/8aVuYFMqj1Pcpo/mq8yyNRQ/2A0RMWLQDzz g==;
X-CSE-ConnectionGUID: qnA920hYQkarPqV21GXfZA==
X-CSE-MsgGUID: aUWOVokUR1mQ/C5EUMME4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34662872"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="34662872"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 01:02:31 -0800
X-CSE-ConnectionGUID: PsmvlkM3Smq8JXg9C2VGAg==
X-CSE-MsgGUID: IS/WJDIbTjiLeMhMJrI6iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="96553824"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 01:02:30 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 01:02:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 01:02:29 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 01:02:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GquKQpBLIQdxlesOAZA+eNjyS0sNhGNoMYT/8hhpRzpo7ggO5EJGpoCI+2ZruauWdo+PymZO2cKfk6iQ6A/nAAAKuewJV/iMuklKZ48c+zi9+VxSCJgoOlF2n6YnWYf9DQmnNEhiE7orTuzTnxY3SDjSqcC2pDMwh3gnP5NsfwqP1jjYLjjGnT8r2/4HzPWluC2IHJKnUI3tAjQIn4xj/2KMcunMUE9EhYBh7tEd+N9Mlq6V3PJ/ZeNItx5Lza0ITUp63HaJ+7FY8QbpNZdgm6Mbcyca/+tWFJtW68uYGN4TfSlKrGEiSOlz96kis6MzmgREcFfLl9LQOCXNXRHxWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQDbQXfuPRixF1Mi4i/CZFSsytM5XP9+Ui85K0cV7tQ=;
 b=qNT9v5s3b9VSzvoC1g7Hb1Jp1QPNx4JBbC6WhGq3cRhXKkpnmeZsCzacmoQ43j5pO43hWWzEmaJ8KGglEPcY+JbCoxh64qaNjo8AZvgmT+DiBZYH4W2kP7iDYnD48+14ufgwZ9iYkHwSk1mi5YTdqaMswT7r0kjoyiJaHJekAKZTbKK6Lem5Jb8rsgDzIghUVQtDII2iMBm1iyMPRan3ZkFiCXpbwrhAmXi+nrRuUdg7td2Dr6JyoSDoQtnAE94yDMA1xH7QvaiwOOx9idGY6LQ2OvIaX3qy9IXjKgad3EulcoBzzSkob/2MmWED5r9GfP4jZTvb3rybI37xTOrinw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 09:02:28 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Fri, 13 Dec 2024
 09:02:28 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv2 2/3] drm/plane: Expose function to create
 format/modifier blob
Thread-Topic: [PATCHv2 2/3] drm/plane: Expose function to create
 format/modifier blob
Thread-Index: AQHbOZBYgsjyDCMLvEGqPvWiVvX5P7LDwNWAgAPu10CAHFbSYA==
Date: Fri, 13 Dec 2024 09:02:28 +0000
Message-ID: <IA0PR11MB73076594BFD86D8AACFF64FDBA382@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241118075315.466009-1-arun.r.murthy@intel.com>
 <20241118075315.466009-3-arun.r.murthy@intel.com>
 <Z0DkNcS-qLgoArml@intel.com>
 <IA0PR11MB7307E97C627599FB153BFE84BA2E2@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7307E97C627599FB153BFE84BA2E2@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MW4PR11MB7056:EE_
x-ms-office365-filtering-correlation-id: 1791a12e-28be-4ff9-6752-08dd1b54de98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?keFUAaRlQvgSQlgDeJO1DwsK2uUgWr2wmg+JabuBEm2ipnVaNNYP94T0Av?=
 =?iso-8859-1?Q?0hAYXE3izGLVEMYJJLGSo8Blbq4zsKXcD4Q/gcWlKCOc9vU2QuBv3Kxh6C?=
 =?iso-8859-1?Q?DTWe5hRvu/3TCuCYeQB2wJwR2XGHbpXhglYB9mWhEeLvMMLsaWiBYy0euf?=
 =?iso-8859-1?Q?IsgH5Smepb2THuhJbz6Ivdo0ce+m+alueYo7PPgT99eBW5192DGDKOhq+u?=
 =?iso-8859-1?Q?uK5CDcFn7tN0Ax/FrT+NeGVqBiiUUnpMRjXKXUC9K6S93Dql9WwMcAKPd2?=
 =?iso-8859-1?Q?VAAsr+ow2saHUuQQsF1EOFad7Vrq8P0XRcB/laIiEb8w/ZEa8V5FEauNjD?=
 =?iso-8859-1?Q?ONUr9GZ6QehFDSKT8o2zbTZ9qK+Fqr5s2OkRPi+Otf7bEIOhwcqePwVnc4?=
 =?iso-8859-1?Q?ZQ8N24a0+s92/uolFbZ0V1H38l5PNXGIe1UcvBZRjVAw3njpYWV2Y/QbqH?=
 =?iso-8859-1?Q?QWcdEv2gQJmv0w2jMXIRvk4hmzZ7P/MK9sohHUflwEg36ALaoFR4P1kz/q?=
 =?iso-8859-1?Q?CQs5SXpc0iE8R/1Sv2XwyXrES8KcU0E1uIG+scwCijS6eOgYzBRsVwpPiJ?=
 =?iso-8859-1?Q?SEyzbZPEL7sZDzhGAN59KOPtb/qeJlMpTW56on16EbDumlxMpBBNgYl/Z/?=
 =?iso-8859-1?Q?1GtkEV9n9OqHUTW/8eDDNWWV2iGXknjAE4HCGOZOXlaEZI0QQIzZkPkxhw?=
 =?iso-8859-1?Q?OzTYQezc+MfM0ejpW9sO1ZHYqDNJkpxTk32tpb+djij14/MfYx8yKLjQDK?=
 =?iso-8859-1?Q?5YLVXJPheXqtrlRqfMNcVXSlkSnsEn5RldtNG1szvYYLsZwSEY3bD1Lm08?=
 =?iso-8859-1?Q?7oIxzTnusNrKPpJRY3ZmLzD48Wmc1jOLUJw+NwwBB1bj5r8EPITffRrAUe?=
 =?iso-8859-1?Q?49Q+zGZhkR6wO9rhBNk2XcMNwtJ+OR8U9l8e+7VxLuu5qI+aQzpi3tF7ia?=
 =?iso-8859-1?Q?NTp5yL89UanTsYHUbMzjlN4ZNmrjH7vYLQGP0EVIhcQPZ0At8HsFvi4D0G?=
 =?iso-8859-1?Q?B83Of6QKGJ+gIL/WMC5Xu9wkOTU1Y4eINDhd6GJXA47l2tVeLkH562Skw1?=
 =?iso-8859-1?Q?7y8ATT8JQ9uaimtMzmItHxbyUh0mxik8Zw5uH4F1B9nrozEjtWshTnZk7n?=
 =?iso-8859-1?Q?2sz3xAOahbTDx1jxcUA3JdBus6L12IA8n7AG9+71QA05+QOzzj4BlG9veo?=
 =?iso-8859-1?Q?INb7cVtVedbOVy0TsmV8YjYeZgAihLU5VNSxsW8Ln78Ge8mlEZfoBNgBrE?=
 =?iso-8859-1?Q?l1C6htdOgFYU5CSLuNmX7Ncdtb8MddUag6mSBTDw8n2w8TH8Wm9bfseTLu?=
 =?iso-8859-1?Q?gNYOMWB5tG6DsNCSdLrsu+VftC6YBv0nEOA685NJl9NCShqpFn/qxpDBNN?=
 =?iso-8859-1?Q?8iHGn/BHA7Gn33/IpUXQ4me9pr+K7EMA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2dWsWc8T/TW7+CEYwk4fx/sMYATS3IRr2T3PjRtunqZqIahgsD+ZxAnj8N?=
 =?iso-8859-1?Q?DqIL4lLEEolnJ3WTPNhN30hLXWXeT/1dNqix+emhgpadpN9kMMlfqQE0lO?=
 =?iso-8859-1?Q?kFfbYhKOIm9upp8G0CKcDe572dtd7ZJSAfUOwJwphBsfU6FpTufnGg3Jhp?=
 =?iso-8859-1?Q?W4oem65JrWWwGWEACvZGPnWMu1Bd5LKz1HurtHbHoe2t6pov2UVf1awsWS?=
 =?iso-8859-1?Q?0uWnsvdBGncrGvxkpPXf8+luGECmk7M6dduvj3ZeQoNHDvlny+7ca/Ta+/?=
 =?iso-8859-1?Q?9Ha5WyZuoSDaZBuDcnov+FK0RUoW4m65GXYNvLf4gesSJJGbtT99t0mg7K?=
 =?iso-8859-1?Q?7fT1654/TYG4rMejF9Xaqt67yMzsWwQm6UR1orKZ3RB/z1BoFOIhYIZlwj?=
 =?iso-8859-1?Q?tPVJokWgnrr3Y0MsI92CqszT7DAj74KFnLbk/lAgJOxJpyVDsfbNREfGFc?=
 =?iso-8859-1?Q?GqFpkInEXQZxTWkBM+W8a6NgflPxVhBT0rD/e1nsd4+YiJ0ChMnSD6pM/3?=
 =?iso-8859-1?Q?jiBxwB8+2ALwP+Hw0suQa2Hw3j8v4sSUczlrpKcLYbqtEuL39yOES1SSCA?=
 =?iso-8859-1?Q?1f5DD1TN6Nhv+SAVprmI9Fz4I8RAOYkbFkdXrjDpevcvKR59q36nnTG2O4?=
 =?iso-8859-1?Q?D3FOT+VSio51AsupbgVXJTlryLhBIviwdM+3Kuh8naizv5PaGiS7l9ceIQ?=
 =?iso-8859-1?Q?MYULLfo1bpROI8XB0NdROwyq4XEy+S7CcpwsWdZttMIjb0p3x58FRLQ/GS?=
 =?iso-8859-1?Q?cTGh72++aKEK+rv2LA1m+01Pe6teLXFlg5xNMff15chi/SIIwGksPY+au1?=
 =?iso-8859-1?Q?tlpU2mOnazHD/5YcHQMGTewKh0S4EOpMhh19SD0T1LyblN81NOP15Ur3QZ?=
 =?iso-8859-1?Q?DI2cbaDg8zJLtVpm0dPfNsDNbCouNTz9kUxni5yMXnzH0cCTL/OdGtY+R5?=
 =?iso-8859-1?Q?gVLbha/OQORy3u5H2zNrBfmpNMQr4bu/bossII0RrK0kdkO/6ZEsDKZA2h?=
 =?iso-8859-1?Q?EgkWr+44bPNTaLMWMugZnbGRd3aS2zeLE5y5/kDxyXYjaYFgH5Fsn6lBaR?=
 =?iso-8859-1?Q?i1PqIGCgZXQmLqa0pGC4OSZgf/OVYpI3Sgoz7hsDPCYuY0ThrxNB4F0FcE?=
 =?iso-8859-1?Q?mrqrLevH2rNoxdUelOEYafH9vE8ree3aG+NyMIj2N30tmzn68KWBG7y4iv?=
 =?iso-8859-1?Q?KDCotS2gZNArlt9mPphD2GHlLqHv+zpMh+17Xg1i+arkD3Hluy8+U2CqTS?=
 =?iso-8859-1?Q?TT2gw+5OO2Vxk5TWZOpuMSdC/AgHwueRxsArAmFP8jInJzBMe0Ot+RU78o?=
 =?iso-8859-1?Q?CVuvx7jbn/sIPcFPe6FglYZJs2w3AfgRMzxmlD5A90Ibfb3cxzW+FxZUFQ?=
 =?iso-8859-1?Q?DXfZ23QbrKLevF765aqPMwFKN7G1uG115icW+w/0SRfHZ/cME4Ttm83Knx?=
 =?iso-8859-1?Q?VNhJDLzjppn3adxtvSsc669GaVCIEPLiSe9+lVjgNr0kOeLTwZwrs2SAt4?=
 =?iso-8859-1?Q?YG8Z067rHTR/LM0vsZdVSP2LtI4WuJGYXlJNFcQSOr5heTGcznw3wgXsXB?=
 =?iso-8859-1?Q?H6knH9genwqQQeMbpacRYWPULJLg19q3Y7V9BXEl7OJfptvePVn3/8Klca?=
 =?iso-8859-1?Q?A1a1ZXb7orcgcSn4Wu6/JvaRKwfhgX3x5cyYCi0SJjWi1NDZaffn25sPaZ?=
 =?iso-8859-1?Q?U/vlsjbJqvdFP4YzeJB02omK16TTs/3wG/Gt5oHI?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1791a12e-28be-4ff9-6752-08dd1b54de98
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 09:02:28.1661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 926Lk29Ex2OAkOz5xb/MHcq2Atz8EmLlb4LcZZNtYtwEP1dvv+M96TLL5k7Yrk645z3xQZ7vjIhEjQQI49I3UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7056
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

> > On Mon, Nov 18, 2024 at 01:23:14PM +0530, Arun R Murthy wrote:
> > > Expose drm plane function to create formats/modifiers blob. This
> > > function can be used to expose list of supported formats/modifiers
> > > for sync/async flips.
> > >
> > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_plane.c | 44 ++++++++++++++++++++++++-----------=
--
> > >  include/drm/drm_plane.h     |  4 ++++
> > >  2 files changed, 33 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_plane.c
> > > b/drivers/gpu/drm/drm_plane.c index 416818e54ccf..4f35eec2b777
> > > 100644
> > > --- a/drivers/gpu/drm/drm_plane.c
> > > +++ b/drivers/gpu/drm/drm_plane.c
> > > @@ -191,7 +191,10 @@ modifiers_ptr(struct drm_format_modifier_blob
> > *blob)
> > >  	return (struct drm_format_modifier *)(((char *)blob) +
> > > blob->modifiers_offset);  }
> > >
> > > -static int create_in_format_blob(struct drm_device *dev, struct
> > > drm_plane *plane)
> > > +int drm_plane_create_format_blob(struct drm_device *dev,
> > > +				 struct drm_plane *plane, u64 *modifiers,
> > > +				 unsigned int modifier_count, u32 *formats,
> > > +				 unsigned int format_count, bool is_async)
> > >  {
> > >  	const struct drm_mode_config *config =3D &dev->mode_config;
> > >  	struct drm_property_blob *blob;
> > > @@ -200,14 +203,14 @@ static int create_in_format_blob(struct
> > > drm_device
> > *dev, struct drm_plane *plane
> > >  	struct drm_format_modifier_blob *blob_data;
> > >  	unsigned int i, j;
> > >
> > > -	formats_size =3D sizeof(__u32) * plane->format_count;
> > > +	formats_size =3D sizeof(__u32) * format_count;
> > >  	if (WARN_ON(!formats_size)) {
> > >  		/* 0 formats are never expected */
> > >  		return 0;
> > >  	}
> > >
> > >  	modifiers_size =3D
> > > -		sizeof(struct drm_format_modifier) * plane->modifier_count;
> > > +		sizeof(struct drm_format_modifier) * modifier_count;
> > >
> > >  	blob_size =3D sizeof(struct drm_format_modifier_blob);
> > >  	/* Modifiers offset is a pointer to a struct with a 64 bit field
> > > so it @@ -223,37 +226,45 @@ static int create_in_format_blob(struct
> > > drm_device *dev, struct drm_plane *plane
> > >
> > >  	blob_data =3D blob->data;
> > >  	blob_data->version =3D FORMAT_BLOB_CURRENT;
> > > -	blob_data->count_formats =3D plane->format_count;
> > > +	blob_data->count_formats =3D format_count;
> > >  	blob_data->formats_offset =3D sizeof(struct drm_format_modifier_blo=
b);
> > > -	blob_data->count_modifiers =3D plane->modifier_count;
> > > +	blob_data->count_modifiers =3D modifier_count;
> > >
> > >  	blob_data->modifiers_offset =3D
> > >  		ALIGN(blob_data->formats_offset + formats_size, 8);
> > >
> > > -	memcpy(formats_ptr(blob_data), plane->format_types, formats_size);
> > > +	memcpy(formats_ptr(blob_data), formats, formats_size);
> > >
> > >  	mod =3D modifiers_ptr(blob_data);
> > > -	for (i =3D 0; i < plane->modifier_count; i++) {
> > > -		for (j =3D 0; j < plane->format_count; j++) {
> > > -			if (!plane->funcs->format_mod_supported ||
> > > +	for (i =3D 0; i < modifier_count; i++) {
> > > +		for (j =3D 0; j < format_count; j++) {
> > > +			if (is_async ||
> >
> > I asked for a format_mod_supported_async(). This is not that.
> >
format_mod_supported() is the existing function pointer and while calling t=
his in universal_plane_init() we don't have any flag to differentiate betwe=
en sync and async for differentiating the calls. Also this maynot be requir=
ed at universal_plane_init as only RGB formats are supported under async_fl=
ip. Only plane we need is to check if the modifier is supported or not and =
that can be handled in the present format_mod_supported().
This can be achieved by
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2479,6 +2479,10 @@ static bool tgl_plane_format_mod_supported(struct dr=
m_plane *_plane,
 {
        struct intel_plane *plane =3D to_intel_plane(_plane);

+       /* handle check for async flips */
+       if (plane->crtc->state->async_flip)
+               return plane->can_async_flip(modifier);
+
        if (!intel_fb_plane_supports_modifier(plane, modifier))
                return false;
Dependency: https://patchwork.freedesktop.org/patch/626849/?series=3D139807=
&rev=3D4

This part can be taken out of this series as this series is focused on expo=
sing the supported formats/modifiers to user by the property IN_FORMATS_ASY=
NC.

Thanks and Regards,
Arun R Murthy
--------------------
