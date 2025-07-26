Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56D8B12B76
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 18:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D264F10E292;
	Sat, 26 Jul 2025 16:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AsvqsF6H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D4310E28C;
 Sat, 26 Jul 2025 16:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753547405; x=1785083405;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ku1TAgh1GgF6wDykO7p/vxxc53ahlWzey+88Ku53CDI=;
 b=AsvqsF6HenmbGsgPYf9nxOM2MHND4ajmtoAosC+ORNLclUh2Rz8HgRr0
 wTJ3Brrid20RLw57iBUHVwC4LuFRQLUd2sCufF+MZtWFn2+csJ94MAmyv
 D1bk54lKUc/N6Tpg2Qjj0GKlbq71LGd+GsjG5T3qIjAfpaapcDjK9l7Iq
 dhFqv1CGSPbN0HCJgIBOQWyo9LhpQOe2sZ7IzAAp97TuVBM+0n/QxFpJJ
 g3xwFSiSeEvWE6Icj/qjvnhYiM5Wv7Mfg/m1lWZ52XNnmiUN52JlCnzwV
 sVxGP5lwTghdFWddD4J09psFro6nmzp/9quYqdx5kpZ4bQaZzg4IiN3zh g==;
X-CSE-ConnectionGUID: J1RO5i3jRsaaq3kZjbCWJw==
X-CSE-MsgGUID: 9M7AwiSKS8OmA0oaT1itSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="66554834"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="66554834"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 09:30:04 -0700
X-CSE-ConnectionGUID: 3BkedAi+TLWIA+NGSqXg/A==
X-CSE-MsgGUID: Ci68GjhuSy6X3RdZt+UNFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162436844"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 09:30:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 26 Jul 2025 09:30:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sat, 26 Jul 2025 09:30:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 26 Jul 2025 09:30:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riOvNkOEZPeg+h9Qv4ZeBbeKcnO5Vp863D4Cn0UC9yE6YN2qIRCh20q0uy0HX4eMftVf/66aGJprMNBVKPIiGs85ROL0D1uw6BS/9544v6AjHeFxeoKAfMunnyoJ4vAzgRJeihynFGepXlBkFGDM6eny0IM5oMxWg9CIXD/dyyagXUc5fEKYFGsy+yYjhmikOAHcQyHqdJB4ONrkCsZRDpevfuBtoyitmgcqYhW+EwzZBNpLEnPkULBEzZYQEa/4gKwq31HkoawIWELOXAW6nDScki25B+6N/c2iYv00ulGicbGUlHlpdjbebaSwvQGyP8cqIylLOASmr32bXohCxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24+ZCX95NbzqJDxb2cL9vEUHQqpNQCBricfisAw2JZc=;
 b=VuVrMXmVGCc7vKGOMvFJZnz8v93c9EyWnIW6fLWNXxLx6xHkla9necnzfimn/+Kk+kXMvG6kOvKQCODSbko71AyH9ZxPyk2XqgheXKxl2+oUFufVQ0lIFZD+I1F/hhsyjarZaddo9N8RTxFZEw0V9ScQl1iVOSFEu0eleJypy3Y5wGb9skyktPFvFmdiMYhMP3th3Hjg0FujltUOOitIA5RaZ4+SZeXdOW9gGAfFmRyFEqfFDWWi4pWdAD9JVeiksFEZmWH9VZsi/mKgf+wkq9Yq4NTEyCU5K+2PQAz6/7Qqw+PRYaFeYA8HtY6Hhhd4RkK4Ur6uRw7CIhx+RHt4nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CO1PR11MB4769.namprd11.prod.outlook.com
 (2603:10b6:303:95::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Sat, 26 Jul
 2025 16:29:54 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.8964.023; Sat, 26 Jul 2025
 16:29:54 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH 17/28] drm/i915/writeback: Define function to destroy
 writeback connector
Thread-Topic: [PATCH 17/28] drm/i915/writeback: Define function to destroy
 writeback connector
Thread-Index: AQHb/SGt06NtngnDC02yoeYRyGnuNLREWtCAgAA/fcA=
Date: Sat, 26 Jul 2025 16:29:54 +0000
Message-ID: <DM3PPF208195D8D5AB9EBE34ED037888D2BE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-18-suraj.kandpal@intel.com>
 <3paeal7ew2pjo6h23rr4t7fqz33avbyxuync5cxnxlh7w4xxr6@ja77buhqtlva>
In-Reply-To: <3paeal7ew2pjo6h23rr4t7fqz33avbyxuync5cxnxlh7w4xxr6@ja77buhqtlva>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CO1PR11MB4769:EE_
x-ms-office365-filtering-correlation-id: 9ba32b88-9826-49cc-cf37-08ddcc61a733
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Bnwrk9z6sLhuHrEDornp91N3Qoh5iy4nkyhyO0N73HTAhXhIh7KYpoq3+NWS?=
 =?us-ascii?Q?uSM4aPwutISLYelmeSY2ZNoZeEIDTfriTDof432UZJIXQldRLiKT4oIapla6?=
 =?us-ascii?Q?9g0N6Ru/YSR9Cf5qrzUzWX6aaM5F2n8oA6iQyPcn129Jvj+NP4Olhw2RskTG?=
 =?us-ascii?Q?emMk45kTYqKto+f0JlMHhYSGE9nCa3MZ4adzI/P2kvGmZYQmLrvUOW2vlRHO?=
 =?us-ascii?Q?aho55Lpj1CeYmR26C57kccJPIbgXgthyT+PYUTQ4WhGAwjl3nryzBu/q1LMg?=
 =?us-ascii?Q?de+y6Qilrsik3x4dGagVsYC3qRFjnHrckMpkAugiCAy/5QlEp1ytCkuc5d/E?=
 =?us-ascii?Q?2iFh5NHZsGT5VEDb0fmAbOGFd19GfhW5bTYva9n75avm9VxAF43UEJNyaGua?=
 =?us-ascii?Q?Yu91uAAIRUb1m234+Ss1K1EdxoZvufeTq2wmx4ZFvaw37XYzQI8v0J9jfAPv?=
 =?us-ascii?Q?Hglzszhq0JyHcnKDYt+hD0CMNkmdSxhJjMTLxce1x3rUu1d+LTFm4nSoa4w5?=
 =?us-ascii?Q?tZMbAmknocLDzMY9CLvlwNoJdWssYTC4X88sSVgdmUqLNq+hn9gxFtsyQUrd?=
 =?us-ascii?Q?NTn/G6CsrV8JsbgKLNh/KrYj4RvybKKLH1CTXeaJUQY3VSyiVsDZcCqlks56?=
 =?us-ascii?Q?t+WX8Bq0kUMPnl+WbjvJ0f+JjRIASVimvMlqp4H3CC8ddKyEEDeasBnoOPYl?=
 =?us-ascii?Q?XuM3CId5+czuQwCPxtTvjGECQzsIHI7x77237sFT4cgv5/gOWPUe2DyqhsXw?=
 =?us-ascii?Q?NSpvHIF4QmpE5NZq4ri6mfu3gRbVw2tCnaSPSfnvqbyhq3BYeyOPHpDKbJzu?=
 =?us-ascii?Q?i86MRuv0QHBoum2Nde+sW7TaTZIS1y+IWiWCd56eycr6jbbKiFF3LWPvkEVq?=
 =?us-ascii?Q?ffOFjoa561fb7cC1B7s6g8swMpQSpd6QrQbNln4t4v9h8r9j667SGHoLTuH/?=
 =?us-ascii?Q?AJMpZ3orIQ/WyB7GKmytcxoiWgFc/6S4MFmjkKUcmTyGOhb/rmyldjmoWS/k?=
 =?us-ascii?Q?xc8IAG22StgzE8TbdJ+99i92egI9N5o4XiqsojqOdyoGZS+J+9sobtj6lEia?=
 =?us-ascii?Q?KdqTaRtyo8LAbgq6oIMYeDIAikLH+BQX2T6XRMC5jgmG3R7cL8X/8Vs7YWfm?=
 =?us-ascii?Q?Vd2ooxP8nEG+AvZfvoYEzOkMTXn5bxeW3ZC6ivMGGEbxuMWfYxWoaWF3qVsW?=
 =?us-ascii?Q?Gx7nfcfmfv2fEEVugrg0wjnId8Bjx5tCuoiBTcKlu9I9jHmKLeEDZNGT2Z2x?=
 =?us-ascii?Q?d3J6/Ko7UStzjXtTV45adWstU0X1KTUKRyT8yyn5QbB5ditpIXmr9rZ0X4Dn?=
 =?us-ascii?Q?5gyAE4WLi6sFJQyAHn5AGqERbyWDZCYXypQPZ2KiwOBvG+uWhx3rtFDlvn7u?=
 =?us-ascii?Q?NbEfEdMXW3K9COA/qX0GzVVz3fxHZV/W7pjOxvBQDVvGk3Is0VknS7C/BOG9?=
 =?us-ascii?Q?uccAT5eFF93iF/ASjT7716Hni1nT6Vauq1yTnJrWAeRsgNydQk/Dvw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gP23oaZvAveC/JZ1tr8Q9/I5WkGFmb+lRQtoKc7aF1WlHWecezQcoJS3JQoC?=
 =?us-ascii?Q?5yI92PeC5I10Ol27p16hDhgUgfbysM0f2ODP2gZ94OV6wzpFdwfOil9k8u0B?=
 =?us-ascii?Q?Bv5biZjCrB/p8ZLPpcM5hixziY0FkvrFZy7enCASX0y+05bytpsxITIUmPN0?=
 =?us-ascii?Q?BLO4F4QzEmYmmuQ1N/dm3XFcP30/TuuhikHvXw4NdRCT7H8myrC3Y/liEoTg?=
 =?us-ascii?Q?iqK4tBmcF53HD9tz3Ry2m/Op5VInfCmifUcDcpah6ogVb2rlDfWJwpkUoTuC?=
 =?us-ascii?Q?HMIyPb/tYhB9GycsuTHLBbqGn3BxTA0XoV1VirqXQs/etaggN+HXvCtQIXtf?=
 =?us-ascii?Q?hiQqoPd+PSKGw42s5jvIWg0N/eIPOZImdX3yBHw2gS7pX8LLaHsESwIlzYaR?=
 =?us-ascii?Q?qfAsXJAhJbvbEZEAXKF72RSPhfpvLoOO7Ru+V2R7ZrQ8gX5JkJ2xs5LYjp20?=
 =?us-ascii?Q?a3vqNBoC1eDa5fy6DP65/i1v6SN8ZLNLI/c8kSD18qhR75o2WXKKSeVi4R9A?=
 =?us-ascii?Q?+8HhCH3d/j3SHAN4+M/w71IpsDnrU8LhrU6ZHfOZEata/A6s4sVfGiBw1naC?=
 =?us-ascii?Q?EtGzRCUprPYa889dPmpys1h+VmCGeg891yFiRCdMZlHcnnvkeN+6ddssEO75?=
 =?us-ascii?Q?tMCHe8GeIgsZ3o9GXUby+9CxTuT/dstio1Q/O//VACWvIBJLnv5XGEpU3B2t?=
 =?us-ascii?Q?uRaXoap1V/lhfJsnuBxLZWpDoBokqqkKEqUTYrSTR2ADltVHUgDhRhmWYXbU?=
 =?us-ascii?Q?qfo/W2YG+ffS71OqyqXOLzYCSUD8TE44RQoIIeKc5qPwsISKxRWX4VOmM8On?=
 =?us-ascii?Q?ud9oR8dePzU0Vm2N3fM3fnhU+1PARh8qb14lc3huTmied1YuofM2S68OLwqZ?=
 =?us-ascii?Q?zW8rhV/a/Cs8hh9bBCpzRq3kSfR3qUFrE+veQ7VAJhkBmHbGc4B9zZEY71xT?=
 =?us-ascii?Q?EuGV+ltS0lkyUYB+65aQH4Z4CrO0oLdzAWpEhmfYp3acwBoIwfIrVyczN0gG?=
 =?us-ascii?Q?wly/8RN35/N0pdtJMuBAvSgQqyWas8VM86U3fUR+/NOnAj41e638itZAd/7k?=
 =?us-ascii?Q?jkulUQc66IkRi2C88K+XctPGHy7wt0q58LuoRlmW0Ly+AA/lCc7MArcKH1aF?=
 =?us-ascii?Q?loxyGSqZQ52lx63YXgISaN2qCXs4Z9q/JL2hPgKGd1h0SOOXj/b3GMQkcFKN?=
 =?us-ascii?Q?64/dhvopvmtMsabeUVhFGeibLmZu8Pgf247UP9l7k3CpzwO7jxKGTPKnndR3?=
 =?us-ascii?Q?FcdVw4h+I6w7S1t0p4tT8MOVhkohGqB941lG+aoDQcCp7fLkcPsigMRkl5T7?=
 =?us-ascii?Q?p28hmSpLQiIAYQp7npu3/UHaMNkLKqyPtC5wcMc3pcDFW1wqCJi9i8m6zIMo?=
 =?us-ascii?Q?xbOFwa/uRGu+otZyeQgafHV48jc64HvVn2wVQB7i+77e4Zw3q0LlsYImMEus?=
 =?us-ascii?Q?ma6g2t4sPQ51bTAe57sEu9C1HBkhvhJGYVqBAfHjcLNqHLf2u/23uzLPvw4x?=
 =?us-ascii?Q?f8omkC/O+5RpGJsqaVEe9AJsUn5GBynR5n2LDSZ3Kgv7msk9xv+uQNS9fjLD?=
 =?us-ascii?Q?TOVdEIbgFo/QWIuEpTyiS2gWfcO30Gvz7bFOb4O5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba32b88-9826-49cc-cf37-08ddcc61a733
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2025 16:29:54.5193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zRh3Sia+oOHkVAVx01+RJXepzINGI8Z3eFVf1zNYxrhYQlCllUUgauVA0oZwgiUpYyMqYT1/NtEabYA/1nS6xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4769
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
> Sent: Saturday, July 26, 2025 6:11 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; inte=
l-
> gfx@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>=
;
> Murthy, Arun R <arun.r.murthy@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>
> Subject: Re: [PATCH 17/28] drm/i915/writeback: Define function to destroy
> writeback connector
>=20
> On Fri, Jul 25, 2025 at 10:33:58AM +0530, Suraj Kandpal wrote:
> > Define function to destroy the drm_writbeack_connector and
> > drm_connector associated with it.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_writeback.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c
> > b/drivers/gpu/drm/i915/display/intel_writeback.c
> > index def33191a89e..9b2432d86d35 100644
> > --- a/drivers/gpu/drm/i915/display/intel_writeback.c
> > +++ b/drivers/gpu/drm/i915/display/intel_writeback.c
> > @@ -180,6 +180,12 @@ intel_writeback_detect(struct drm_connector
> *connector,
> >  	return connector_status_connected;
> >  }
> >
> > +static void intel_writeback_connector_destroy(struct drm_connector
> > +*connector) {
> > +	drm_connector_cleanup(connector);
> > +	kfree(connector);
> > +}
>=20
> Nice example of what I've written in my response to the cover letter:
> without this commit we have a memory leak here, don't we?

No we really don't none of this actually takes affect until the connector i=
nit is called which is way later=20
So to answer your question this won't really cause a crash and is very bise=
ctable

Regards,
Suraj Kandpal

>=20
> > +
> >  static struct drm_writeback_connector *
> > intel_get_writeback_connector(struct drm_connector *connector)  { @@
> > -208,6 +214,7 @@ const struct drm_connector_funcs conn_funcs =3D {
> >  	.fill_modes =3D drm_helper_probe_single_connector_modes,
> >  	.atomic_duplicate_state =3D intel_digital_connector_duplicate_state,
> >  	.atomic_destroy_state =3D
> drm_atomic_helper_connector_destroy_state,
> > +	.destroy =3D intel_writeback_connector_destroy,
> >  };
> >
> >  static const struct drm_connector_helper_funcs conn_helper_funcs =3D {
> > --
> > 2.34.1
> >
>=20
> --
> With best wishes
> Dmitry
