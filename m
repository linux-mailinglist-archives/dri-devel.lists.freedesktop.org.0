Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 191CCAE136C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 07:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389A710EAE1;
	Fri, 20 Jun 2025 05:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYX60WMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5882810E1F4;
 Fri, 20 Jun 2025 05:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750398840; x=1781934840;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tG9dnaTHhhh8DjCFiJj4XZ1UUms634q6qLAX/NRrRgU=;
 b=bYX60WMNkrQLkpexOIUuLOnDzI43rQ2fYK2mKBiZ+SEvETjWe5B6USeF
 AcuSEF44j6hgRO4v/CRwO45mIzqPzIbBvgjpuPGGGEn9fGAdpuWI9pQ+r
 Yt4yIb9etcwCozH497ePIBE88bci71C7MC3vbUsWNgwB1eM8NSU/hxlLm
 sA/7o2N0C4OHaI/sY/Ts3/lVQttAUFzN//DhS6y/OUmpr0V2tUYlX6wjK
 omDfNrze7TA3TbC5D4b+6fFg9Xz4r1EvKmEfTet165rHVPJp39dcLyjdd
 btKMbNNqnbIhoroJqjijP+9ZFeleEhCXrsQZddMZCXC1Q+gG3+hxZkibk w==;
X-CSE-ConnectionGUID: EVRN8c7lRY2MAaBVMzD38g==
X-CSE-MsgGUID: jJiPQkFfRfKA2dG14O8hpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="56327449"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="56327449"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 22:53:58 -0700
X-CSE-ConnectionGUID: vvgG3zAZQuCoB9yjfXnk4A==
X-CSE-MsgGUID: XNtqsC15Rr2NpzyORlbANQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="151027850"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 22:53:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 22:53:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 22:53:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.71)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 22:53:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABlDEHENAs4BQsTKJXgjqVvF5/RXPwYiVhPOGYLwIlEMW8dnY3OxzYEX0xCCbbbrtWkPcdJdAxkTTTcXIptVV1rdh6NuIVgDy8+2u+jiim32G9PEOP9I7CyH0wsnmUHuGlJnZNCo/AM2JJ0Of2wwP3CwJxy5ssK/NjMX53VH9LzVPFPLaKf+txDZFaGmBOfVwm3yLI8NNl5cDzEwEWSLeR7arQzzkuthA7VlBNEDmfc4bTiNhDQi4CDUqu5iSihga3Y6dfIQMFI3psZV0ldJXXblt3NgG6ZjWqGRGe37xnxoOnuKoooeryPJwfa0RuJhprR6XsRuhUcoQ31+Cc1Yrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xr1q4xyRKJ0XmTYEy7zBmvmu+EaErnBKIBiYBW6Q7js=;
 b=n0yuV4aMnFXymy8UG5jq6D/5OYcWMceSGPApv1YZwJdTpKsTZ5lxgsfqAj/c1Mi5rsX5vQL7XPewRQT/zi7OZlct7icZRJ711o52mIdJ5x37ACwSkKkSsPtBhizVg7z8muBDPGFm0iPQf6qH6yFRIpZ5HBr5fy2MWIjLOH86D6umMWneKsSutI0wzvjrfuBkxiKOrp0UfmRnI3cF69rkS5fu1x8cxnXOFF0kNB20xqBj8/mq475yJA3IVJDq3nFWzmcEKSKZcVwxmM2ISKmbUsT2ZO6LoZIUkoh4en7f0yx6oU0iDVs1sU6G8xuX8ylYTORR0fhqqTBrkgXHLp2A2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA1PR11MB7320.namprd11.prod.outlook.com
 (2603:10b6:208:424::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.38; Fri, 20 Jun
 2025 05:53:55 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%5]) with mapi id 15.20.8857.020; Fri, 20 Jun 2025
 05:53:55 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 11/13] drm/i915/backlight: Use drm helper to initialize
 edp backlight
Thread-Topic: [PATCH 11/13] drm/i915/backlight: Use drm helper to initialize
 edp backlight
Thread-Index: AQHbrPQv+m1Zz+oGQUuXTVZ2p7c+3LQL7rgAgAAFWBA=
Date: Fri, 20 Jun 2025 05:53:55 +0000
Message-ID: <DM3PPF208195D8DAF038B8245CB366755D5E37CA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-12-suraj.kandpal@intel.com>
 <IA0PR11MB73071E1E8218FCF2EC03B2EDBA7CA@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB73071E1E8218FCF2EC03B2EDBA7CA@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA1PR11MB7320:EE_
x-ms-office365-filtering-correlation-id: 8c25697d-8324-471f-8e7e-08ddafbed7ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ajQf17EMESGNTmyOWP1BDRW7xnWqzTvmnNFWKIZ/t51UQ8kS/v3o4BNiLLnv?=
 =?us-ascii?Q?QskmO1x1Lx626SLaEQNSIn8CvYHKIqYgIN2EkIIgmFeuq80ovp+uksJvZq++?=
 =?us-ascii?Q?SRsTPFrWsc71QbCnaXVots1704qUhFfVuUTdvNqNvUVL/bj4+WzxqgTnAnBc?=
 =?us-ascii?Q?GSNmY6i88hMJN6b3238UKnv+krvlFWAAa6O9UGLqwj9PeiyIlEFsJDbi7KxU?=
 =?us-ascii?Q?yCcVv3fDs9+gk6UK0F7ZKH6aXsNWE/HXd+hKCiBJAGr4Svj7NqO0jWJAAtLn?=
 =?us-ascii?Q?EFmtLCOVO83ks10fRWkQReCMcjmDQ5BPKQVpjvyF4PEKrwyZwJ8nRdoaipf2?=
 =?us-ascii?Q?ksbqHWy/cYt76t0cCb543FHkXNLLpd1eMPxane/IqQYhc6iYsXRd831OYEij?=
 =?us-ascii?Q?UGNbEZpgl2fQ/ltZuOYFD4OXWQ7nbEPBQuRnuNf9xAZrY1pGgJuwce3dbpqi?=
 =?us-ascii?Q?kiYsoZPOV1XM6mIkO6JAV+9xyLLUFAeY1aRHLdpB0Te5TvBt6UN6X2+cBnvX?=
 =?us-ascii?Q?2BE7mQYw7dAdQiaPHOWwI8o1vjJpTaRLdoMaIOir8Ke/SClI4GYl/VcVKNTU?=
 =?us-ascii?Q?Zu4WNU/2iOMqRpNrI208eQDbF/S/tla8LxBTQ4uFGqIynVk5OMxGVf2UPuj4?=
 =?us-ascii?Q?Lr/yQenidILflDScCh1uJG4oL7leTlqNQvYn/8f0yPTwVPO9REN06x2w9xeC?=
 =?us-ascii?Q?FoEydN24VOhsO8eEoVp1nNpN9X/m/V2wMeQ5TO+YbgXCsV767EGzffS6DPKW?=
 =?us-ascii?Q?VOM3cebW8nWvlwWH7BFeN8gcQlGR9VDs03dHBNxEk/IgscyPRuKsVpjq+4nh?=
 =?us-ascii?Q?hKBe0/KPNUJ3fKNgW1SESzoLVLV1ntaxMsWfEFEj36Q1QCxYvM3NlPiT53KM?=
 =?us-ascii?Q?jiwiTpBfNSkFVJeK8mP6INugdBlTvmlctILPjTdGz9QYeESlKC4VdfIfKB1Q?=
 =?us-ascii?Q?5FDnVMwxTGzbu8eahQzVR3VWnGkMzhwVsw4vRRwFU2Y37qmYyRgpvpj32TuD?=
 =?us-ascii?Q?X12b5/gECJGZ7UhGzelMJONyoiI3EVXJ5isEmqvXyhB9fN8AOg7h28my3QIY?=
 =?us-ascii?Q?n5zkQhDN7Q+h7OZP1g/jbGK/Pr7zS9Kc7gI35+ArhxOOTu1zTi/HLuGi10Fy?=
 =?us-ascii?Q?yMaM6+mbbRxQ6d9m8gZ3SAzbj1Kno9OOYxGNGpyalHrfogTt3FO35L3i5m5t?=
 =?us-ascii?Q?piGG/rZASdobQoczeBVg29wbmiw64iCOSG+EPHjxt7iRqYHtxP24Q1niXIec?=
 =?us-ascii?Q?U+Xcl81dtJNC/bb7+JN9rG/S+5UYNU/0IoIT/KCfcXiW5U8WbSxaXXAgKzXS?=
 =?us-ascii?Q?dS7vB9EIh1NISvYYOBxETphugKYXIqeZpuRhqba8aTKVTr2hHMHQ0jueoCPH?=
 =?us-ascii?Q?P/UFNvTh5RymYehoDGst9iVaKnutri/aC+lSqtSl+VxC0AXHsQL1hZ6ElU7W?=
 =?us-ascii?Q?VJDMzeCf3ijy2Sf67OpQuJE/LYTBTSFwisOMZF4X9/zUuPAY1FAhhtkMABjF?=
 =?us-ascii?Q?XA7sCmZ9uxmY/0Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?58IdnVxn4ayZV4PLQ9191vC5ishPCGtXlnpRR3gMAMwmuMYFlcNW1h4mlBKD?=
 =?us-ascii?Q?5hHXzNa3HtzceRIJEQWl31RBcQ1hItx0xj6jb7rFR1eSvZSIP9FMxZvCTq8L?=
 =?us-ascii?Q?MhCFeLqIElwRIRpiwnVO48+9DNuwSdQAQSZLhJktrFhM5D9grBnCzqeTfpZv?=
 =?us-ascii?Q?CO53Y8MrJqiEmhGg4J9022DPeSXaEy85C09WDan5VhmQ4ys2Q1rCd4KBp38j?=
 =?us-ascii?Q?Ery7SBwqz9bBkOcISAYi7YNgzpm2WY+yWCSDCvJ3V3jqrfM2SPyDP/WHRKsG?=
 =?us-ascii?Q?40JXbnh13s2JRQkyYbbi8vHSotq5330YAMUAOoQQ4vfFiu9t3YkK5SLMDPYr?=
 =?us-ascii?Q?ISNVZghHs6yHbI/Q/IAAjiNFqk4LXs8YGjYIhzBcOP39mq8EOsw7X4SMgeAB?=
 =?us-ascii?Q?jBb/avPhSegCbwc2i9/+5/QgwDAobJJVPApBkielalfaZ7rSl2BO3Er5TA2y?=
 =?us-ascii?Q?xCfZimnyeVNfZfrW7h2o9QRS4AX9LGSX3ploQHXKnP8JAw6Y817pAI7e9e05?=
 =?us-ascii?Q?s5FZN4Xpe9drOulFDdXYYkKio80kEY3+WO3KVun8MhHiYN2h7oLisOotOzD0?=
 =?us-ascii?Q?ACOqkBp6e3Pc/qlTNO37eaQgQATUoHg3iNLbf7R17uMW2lQ0uoSjBcOP/+Bi?=
 =?us-ascii?Q?uE69mtY27mOMmSU/HhfxA7jMzI1+OL9ohR3XNQWQxXrScbzRIpHA2dQ93Waz?=
 =?us-ascii?Q?Mco6z1UtzX+3dJqvyQtESS2itaXowmTc55bNaL+pDBHqFF3xgIspiQ9FVdj7?=
 =?us-ascii?Q?Bq3MQcaon+xWicDs6Hrk3kgM4bJ071B3zt7+7UKBWWqhsoYsGncceGkgZTc0?=
 =?us-ascii?Q?O3GUKA0EhXPqz16sGlaRJwXwqS3Am4HmdXyhaZk1+8/uD3UOG/I71ENKBNtN?=
 =?us-ascii?Q?Dua1tdyG2k/5fzXfY1gBEiGns7RNaLSzVROX9XQJm+QJeUfur9uowlhUzhWg?=
 =?us-ascii?Q?zYSZj+CXmAogkQPK8GCXurOnOdoGyUo7sU0TZGbLDtixnoIcd4R3KbWbLay6?=
 =?us-ascii?Q?IIB+c8XfrFrCLXkg+gqz+XhnBVfSjf1NXZNY9MdEzvYZg/dWkAJo5nLnEGgF?=
 =?us-ascii?Q?UmWTteQ87FV6ULTadhmtq8BJMAshDco4MtPCnGLAD4BQ/KobE1Ok+QpDMsQb?=
 =?us-ascii?Q?AtfmJmtbgiV79vlTcHyIlAgMM8DRuUSI+xpaEVCz+Rop3NeK5nN+gGET81o3?=
 =?us-ascii?Q?3H6wJk6rM/QFHjXkljqKtA4Vld2ySzHB1LV2tGJvRsi7wjE99yMUKMYDpz3L?=
 =?us-ascii?Q?S13Aveq8qpl6OgmRKjObKyPPOJBIOXQJpDoEiwxsGL0mxnOFHbJjvs57v8PR?=
 =?us-ascii?Q?lwzz7aIEwJwN0vWmxv6bxIjKL+apScUjQq6WRH+m65g+XQ8ppX2h1YvENXyu?=
 =?us-ascii?Q?r5OCg7C6tKQ0+AMjgKuTMMQXBxCemzLIsYXWBnHamp1wdA3k6rdszvQ0PjIf?=
 =?us-ascii?Q?P/f0W4M22RjsSdZZYkystgtMDQ6RTrArHW3wXXm2+v9ZAro0lXIR4Kh8E/IN?=
 =?us-ascii?Q?3vZNKxq1N6CbKFq1lGuEJ+e7bc+pQsHelBGrf9+YMoRc72RwzG7oYXJwzgNg?=
 =?us-ascii?Q?kkYOL1rC9WyjR5cb7/GCUZgyklmP+myqfAWL49qu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c25697d-8324-471f-8e7e-08ddafbed7ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 05:53:55.3040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qhc9IhHMngrb25GlbHt3QaNNMgkvhRuYg38NPQsJ+QGMS363gMezNMbTEiXQgbKQ6JTEczz8Lyr4eRRErQoNCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7320
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
> Sent: Friday, June 20, 2025 11:00 AM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>;
> nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel-
> xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Subject: RE: [PATCH 11/13] drm/i915/backlight: Use drm helper to initiali=
ze
> edp backlight
>=20
> > -----Original Message-----
> > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Sent: Monday, April 14, 2025 9:47 AM
> > To: nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> > intel- xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> > Subject: [PATCH 11/13] drm/i915/backlight: Use drm helper to
> > initialize edp backlight
> >
> > Now that drm_edp_backlight init has been to be able to setup
> > brightness
> Can you reframe this?

Sure will reframe this.

>=20
> > manipulation via luminance we can just use that.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  .../drm/i915/display/intel_dp_aux_backlight.c | 100
> > +++++++++---------
> >  1 file changed, 49 insertions(+), 51 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > index be740fb72ebc..2eff9b545390 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > @@ -585,9 +585,36 @@ static int
> > intel_dp_aux_vesa_setup_backlight(struct
> > intel_connector *connector,
> >  	u8 current_mode;
> >  	int ret;
> >
> > -	if (panel->backlight.edp.vesa.luminance_control_support) {
> > +	ret =3D drm_edp_backlight_init(&intel_dp->aux, &panel-
> > >backlight.edp.vesa.info,
> > +				     luminance_range, panel-
> > >vbt.backlight.pwm_freq_hz,
> > +				     intel_dp->edp_dpcd, &current_level,
> > &current_mode, true);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	drm_dbg_kms(display->drm,
> > +		    "[CONNECTOR:%d:%s] AUX VESA backlight enable is
> > controlled through %s\n",
> > +		    connector->base.base.id, connector->base.name,
> > +		    dpcd_vs_pwm_str(panel-
> > >backlight.edp.vesa.info.aux_enable));
> > +	drm_dbg_kms(display->drm,
> > +		    "[CONNECTOR:%d:%s] AUX VESA backlight level is
> controlled
> > through %s\n",
> > +		    connector->base.base.id, connector->base.name,
> > +		    dpcd_vs_pwm_str(panel-
> >backlight.edp.vesa.info.aux_set));
> > +
> Is two separate debug prints required to convey that backlight is enabled=
 and
> the level is set with he same parameters?

Something which existed in legacy code can make a separate patch in case th=
is is not needed
But a patch unrelated to this series after this is done.
Would that be okay.

>=20
> > +	if (!panel->backlight.edp.vesa.info.luminance_set ||
> > +	    !panel->backlight.edp.vesa.info.aux_set ||
> > +	    !panel->backlight.edp.vesa.info.aux_enable) {
> > +		ret =3D panel->backlight.pwm_funcs->setup(connector, pipe);
> If pwm is used then none of the above conditions will be true so instead =
can
> check for the assignment of the function pointer if (pwm_funcs->setup) In
> backlight struct enabled and pwm_enabled doesn't make much sense, maybe
> one element to convey the mode make it easier. This can be taken out of t=
his
> series.

Sure will look into this and prepare a separate patch from this series .

>=20
> > +		if (ret < 0) {
> > +			drm_err(display->drm,
> > +				"[CONNECTOR:%d:%s] Failed to setup PWM
> > backlight controls for eDP backlight: %d\n",
> > +				connector->base.base.id, connector-
> > >base.name, ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	if (panel->backlight.edp.vesa.info.luminance_set) {
> >  		if (luminance_range->max_luminance) {
> > -			panel->backlight.max =3D luminance_range-
> > >max_luminance;
> > +			panel->backlight.max =3D panel-
> > >backlight.edp.vesa.info.max;
> >  			panel->backlight.min =3D luminance_range-
> > >min_luminance;
> >  		} else {
> >  			panel->backlight.max =3D 512;
> > @@ -596,57 +623,28 @@ static int
> > intel_dp_aux_vesa_setup_backlight(struct
> > intel_connector *connector,
> >  		panel->backlight.level =3D
> > intel_dp_aux_vesa_get_backlight(connector, 0);
> >  		panel->backlight.enabled =3D panel->backlight.level !=3D 0;
> >  		drm_dbg_kms(display->drm,
> > -			    "[CONNECTOR:%d:%s] AUX VESA Nits backlight
> level
> > is controlled through DPCD\n",
> > -			    connector->base.base.id, connector->base.name);
> > -	} else {
> > -		ret =3D drm_edp_backlight_init(&intel_dp->aux, &panel-
> > >backlight.edp.vesa.info,
> > -					     luminance_range, panel-
> > >vbt.backlight.pwm_freq_hz,
> > -					     intel_dp->edp_dpcd,
> > &current_level, &current_mode,
> > -					     false);
> > -		if (ret < 0)
> > -			return ret;
> > -
> > -		drm_dbg_kms(display->drm,
> > -			    "[CONNECTOR:%d:%s] AUX VESA backlight enable is
> > controlled through %s\n",
> > -			    connector->base.base.id, connector->base.name,
> > -			    dpcd_vs_pwm_str(panel-
> > >backlight.edp.vesa.info.aux_enable));
> > -		drm_dbg_kms(display->drm,
> > -			    "[CONNECTOR:%d:%s] AUX VESA backlight level is
> > controlled through %s\n",
> > -			    connector->base.base.id, connector->base.name,
> > -			    dpcd_vs_pwm_str(panel-
> > >backlight.edp.vesa.info.aux_set));
> > -
> > -		if (!panel->backlight.edp.vesa.info.aux_set ||
> > -		    !panel->backlight.edp.vesa.info.aux_enable) {
> > -			ret =3D panel->backlight.pwm_funcs->setup(connector,
> > pipe);
> > -			if (ret < 0) {
> > -				drm_err(display->drm,
> > -					"[CONNECTOR:%d:%s] Failed to setup
> > PWM backlight controls for eDP backlight: %d\n",
> > -					connector->base.base.id, connector-
> > >base.name, ret);
> > -				return ret;
> > -			}
> > +		    "[CONNECTOR:%d:%s] AUX VESA Nits backlight level is
> > controlled through DPCD\n",
> > +		    connector->base.base.id, connector->base.name);
> > +	} else if (panel->backlight.edp.vesa.info.aux_set) {
> > +		panel->backlight.max =3D panel->backlight.edp.vesa.info.max;
> > +		panel->backlight.min =3D 0;
> > +		if (current_mode =3D=3D
> > DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
> > +			panel->backlight.level =3D current_level;
> > +			panel->backlight.enabled =3D panel->backlight.level !=3D 0;
> > +		} else {
> > +			panel->backlight.level =3D panel->backlight.max;
> > +			panel->backlight.enabled =3D false;
> >  		}
> > -
> > -		if (panel->backlight.edp.vesa.info.aux_set) {
> > -			panel->backlight.max =3D panel-
> > >backlight.edp.vesa.info.max;
> > -			panel->backlight.min =3D 0;
> > -			if (current_mode =3D=3D
> > DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
> > -				panel->backlight.level =3D current_level;
> > -				panel->backlight.enabled =3D panel-
> > >backlight.level !=3D 0;
> > -			} else {
> > -				panel->backlight.level =3D panel->backlight.max;
> > -				panel->backlight.enabled =3D false;
> > -			}
> > +	} else {
> > +		panel->backlight.max =3D panel->backlight.pwm_level_max;
> > +		panel->backlight.min =3D panel->backlight.pwm_level_min;
> > +		if (current_mode =3D=3D
> > DP_EDP_BACKLIGHT_CONTROL_MODE_PWM) {
> > +			panel->backlight.level =3D
> > +				panel->backlight.pwm_funcs->get(connector,
> > pipe);
> > +			panel->backlight.enabled =3D panel-
> > >backlight.pwm_enabled;
> >  		} else {
> > -			panel->backlight.max =3D panel-
> > >backlight.pwm_level_max;
> > -			panel->backlight.min =3D panel-
> > >backlight.pwm_level_min;
> > -			if (current_mode =3D=3D
> > DP_EDP_BACKLIGHT_CONTROL_MODE_PWM) {
> > -				panel->backlight.level =3D
> > -					panel->backlight.pwm_funcs-
> > >get(connector, pipe);
> > -				panel->backlight.enabled =3D panel-
> > >backlight.pwm_enabled;
> > -			} else {
> > -				panel->backlight.level =3D panel->backlight.max;
> > -				panel->backlight.enabled =3D false;
> > -			}
> > +			panel->backlight.level =3D panel->backlight.max;
> > +			panel->backlight.enabled =3D false;
> Change is simple, adding a new condition for luminance and moving
> edp_backlight_init out of the if condition so that it will be initialized=
 for all the
> modes and then initializing backlight level and max based on the mode. Bu=
t
> the change looks complex.

Yes that's true not sure why git ends up making it look like this tried to =
make it look simpler but always end up with same result

Regards,
Suraj Kandpal

>=20
> Thanks and Regards,
> Arun R Murthy
> -------------------
> >  		}
> >  	}
> >
> > --
> > 2.34.1

