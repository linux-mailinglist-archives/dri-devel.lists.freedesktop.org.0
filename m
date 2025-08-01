Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5E8B17B8C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 06:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98E410E39E;
	Fri,  1 Aug 2025 04:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bS7m0n8H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3B510E2ED;
 Fri,  1 Aug 2025 04:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754021009; x=1785557009;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jn41o/qaiiQwjnOsczSKGZvzG3xhZJVyBZHZOSjC/qk=;
 b=bS7m0n8HfKC6u5TgqpdtX9jt2SET8+x7hcWPpSjwDlvpOMppKJY/RlIj
 O6ehaJc9L5pmwQkUauBAepuxYatVR+tEh4LUmUNADCB8JhQwk7aQQV9T/
 zmd9TnZXUuzsC+KVlmAU2jrqXyG/l7Pz45MsrmiY0BoBLTkZoZXfV69eT
 siXI+dI66L0fWuROrRar07R4rjMSqGFIqyPMsUBQ9g243Z2cGBje4gFmr
 CJPlw7HEMSrArXBTqRsZUQTRb7DVjEZ9+BOD51ssQvutJNUF8m7kAbRlH
 TV++ghB89aNihqfloEfJZlkKIDTNh8x+mEJvt36qW7EAcvcPCqQq7cdaZ g==;
X-CSE-ConnectionGUID: ooi370jzTMqqRIvPJ66NXg==
X-CSE-MsgGUID: RNrBvpjMTl+N5H4tf8fYTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="81809696"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="81809696"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 21:03:28 -0700
X-CSE-ConnectionGUID: D19U8wyvRra9f7fZtvnieg==
X-CSE-MsgGUID: 2V4GDyUSTcaY0zRbv2PWoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163149613"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 21:03:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 21:03:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 21:03:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 21:03:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHiVBRH01Cmd6TfuMUvj7NdEnt5LezKdHCHOkuenDRH/+q+hebLbnOOJdaveUD9mPfxad5AhjHT0xthOhus0scG22GVC9Im8y8fp22gU+AHOqvi2aiFVQqR2vihWTdAm0rMGb3A+xOYBPB+tZubWwmo5+oHzqpBrg9qE16auD0CErxSCZM6fpGe7FTw5E/ifsfgFKx8rvvr9jmMPaUqJN1vXY0RsJ+aTaq9I9ZN6OykwSMB+C0YWvQku8HLoDbYoYgtTif4pdlWvCiZfZcnwYCPJhXMwwsx7QL52DPMVljrczYJvXBLIHeogdKxEEZA/Q43ImP5M7ffiPrh5d8k+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VH0BjPPSXxZH/Hr1Z/UZHWnqGHonEl+k825bSoo1EH4=;
 b=Q2SxwsD1WQvskhAqzAQFOzQUVZrtc6YHh408nTqpfbzuGobuNspKABwQGeBG618NfixwTWgIubiclWHkzqdJI19kZerUSMx5X5MPrgG7m96pv493vldRHSuhoerYpnepEL1vPkr6g/r1aRMm76HP5zcKHFExrCxZhSYFeQrlU6969ACusJM0o1BEqIrNyEPq2MiLmg60maWObG+qX1JIp7P/TI0mn3cYuea43NKKgFoDFCmM0970mSRKo8LEqSifH15xeModOT2M0rBt6dnY5xXrXXtHDNo9nlZn2VngiJRg4ml/3Vz52CDxqhikKX8w8zfDV7xBZaI+v2FUsK8nzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CH3PR11MB8209.namprd11.prod.outlook.com
 (2603:10b6:610:15d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 04:03:11 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 04:03:11 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH 01/28] drm/writeback: Add function that takes preallocated
 connector
Thread-Topic: [PATCH 01/28] drm/writeback: Add function that takes
 preallocated connector
Thread-Index: AQHb/SGYtL728s1ZVUOjuiaVyaINHbREU84AgABI7dCAAYCKAIAHGnxg
Date: Fri, 1 Aug 2025 04:03:11 +0000
Message-ID: <DM3PPF208195D8DC58260AE103E0627B123E326A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-2-suraj.kandpal@intel.com>
 <tglzdolw5nxc7tbscpfjcvx5jiydbghvouws7fl7xqryh7q5c4@klo5yncolqah>
 <DM3PPF208195D8DB4B4B18D41EAB4FC3CBAE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <5qawf2olp7m2opwnotrzrvx7563dyqw6i3pkqzrzsqtn4l3vyf@4q5tisgxqpxf>
In-Reply-To: <5qawf2olp7m2opwnotrzrvx7563dyqw6i3pkqzrzsqtn4l3vyf@4q5tisgxqpxf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CH3PR11MB8209:EE_
x-ms-office365-filtering-correlation-id: 5d4b3ad3-92dc-406f-ad9f-08ddd0b054f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?36NN5ERpsZzoAW5ZkNBJ7cE/qeYbiYL5ork6OXYg61cQRR+wj1uNQj4WFIPk?=
 =?us-ascii?Q?sbgBql7UBIe1VlDGaTlgVoszDtk9Vzb9RjK9WCmvvPQP4F9uPh+va8TkRQ/A?=
 =?us-ascii?Q?nm0jByxajV01FXnG8bRXN9MmgbKl5QoAjjQP1GsqXjmukGoeTHLVOyGNB4LC?=
 =?us-ascii?Q?yjkT9k57gYZN2SeLXosTArJfHWPmxt6f1OERM5Q0g775hRbeTNaDbhP1ZKDH?=
 =?us-ascii?Q?9Wn/fAG+FGdBGtHReXr8oCMBAy9HcGLOr/0fuzfpWPxol363l8Zjb43hjh7y?=
 =?us-ascii?Q?Usq+IfIQtfzOSglGxg6BPv/CpMDpPSsUiYF5RjwzzgFiXj0AiLwJQUvT3GER?=
 =?us-ascii?Q?TDyM5y12PIRoQnOmyNkLBgj/03LMldhLB4nq8Zt5+uk0APeLQIEnRQ64GGnY?=
 =?us-ascii?Q?tN+bXSWl27eLx4sMarN5DOhHX6jYLEKFDI/UleM8pcqaj9NZS4vpGMgX7S3U?=
 =?us-ascii?Q?rYexYrrOnLm7AIHLJ2UzVx+yrBSa025JP3/SlRQUa9DuxPUeW2Rc9C1BvhiG?=
 =?us-ascii?Q?sWKyUF5Zi0VUAHPKn8WP0rcHxOJNnzrfWzpZU6tnwbHvF25kHLy88m3uwY6T?=
 =?us-ascii?Q?UmvO/m/K89bJJtW9zPXPJv2WmK6ZYCJoMrwyQOTc5UYFItbmJ6qc/tgXSlVJ?=
 =?us-ascii?Q?EoAjX+eh9igTrKM0UdVkLqu4BMqr7XS5OqW5z5H+P0kBNJDyafyFTP5ilnN+?=
 =?us-ascii?Q?jhQVKnwWq4pAaByk7UTnJAfyP4ksl5a1ja2DzYySO5sTNz2Kdtm7OLKnxK3u?=
 =?us-ascii?Q?G1px7vLu+LP9GzHin5WWIFVGHiea5n/KezdM1Ccs88aTGgCGXGIxv1gRXYKZ?=
 =?us-ascii?Q?u2r2TM7tO+Z+1Dr2zLHiq8Q5T3rkeuUcBHc5ryDVaBEImvwjX2A2r+ASnLxM?=
 =?us-ascii?Q?4ON7ltLZ5+IFVP7WoIk8u3sw9d8vBOfcru0p2iU/+tEyv6f2DDf5SaR4kqzF?=
 =?us-ascii?Q?FHXiOJPO9vtchxXErWE9paV/C8JXziOven34T9gb4e0BWfqMStZ2MNBSXw5c?=
 =?us-ascii?Q?SwRxuPArgVSqKs4YkNDejKKehHncCX3nqv+vd3Fy+pJY8Saw9F40y40Kmg0p?=
 =?us-ascii?Q?DoraaXflPdVbSSYGjIEpij63WwKfYcXr3v4VVbny6pSORwO9atqwbfv0amwc?=
 =?us-ascii?Q?1N+gv+/MgoDEndZkGUDqYuTMmhcVHQ63B56OyEIIPqdP45oouE1mROIAvbKa?=
 =?us-ascii?Q?KHlkMG9d6OKdoR9N4/Y7iLnNu7p1+H0mAGec8VqbRgxqk6NE9lncM6zs/4kU?=
 =?us-ascii?Q?baoxxEiYJwf3YgxOdwgWV4w6VjWlENQFiQvkYJz4goFOzFEjsrkwRkM7prO+?=
 =?us-ascii?Q?I11SXPfFYMfPr1VBgLI0o5Gs0c+OfKmJ4ndBDK6r/+hajbeemor9gq4JLf3q?=
 =?us-ascii?Q?B5rrpYYlRBJriHlKgjfCLR2rAMfXIl2Cu7iWgZMmtck48jL0/v7fsTmQ8Odn?=
 =?us-ascii?Q?QGUUoLzFDHyQSpqMdxooyWq6AJuudTPAFJDcqFkZF8z16mNVhtWC8Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+oroyYpCRFrFAe6GL5g0Xczgr/5+T2YmsUkiMBPE8+TGBqlWm6Xiric8M8Ds?=
 =?us-ascii?Q?VpNPAFr9tnYRYDusOqwaCz9tNV8nsrjcAHnf6QmP93pX8nZqBpJi6hWZwYea?=
 =?us-ascii?Q?6IHYnNH3sgef9Vl8vLpAkEWXC5Jw9/Bmt1JMvIhImUMd+Q4vPBjAYbHUmZ7Q?=
 =?us-ascii?Q?Bh2o6Sdm/e948qig4vq5VgwcTD92xh78CI9n9OgBSeAUCaZwAVekX9Q/1FJo?=
 =?us-ascii?Q?AZnjBMHhrQWF50YtIQ4u3v8t1Lf9LtEEttV0Lt0j75JUs800YwAr+SK8gABl?=
 =?us-ascii?Q?2ucairPQZQbv0DpLFuBZTrrtj5CYw6WsqZwavJNKqoOtpYBALyEwUfnvGtOh?=
 =?us-ascii?Q?wD+T5bRirGHikEnHy6VpKNX4WL8cVRvsrf62zpm7Om1MCJ4vXjld9ui/fanB?=
 =?us-ascii?Q?aDHel/ofwWbYFfkwPQThOkpvwepUDknm05Kl9btVIwtwC6l8s3HuazgFgmbu?=
 =?us-ascii?Q?gGp7qhVYqL8c7TB+0CTzM/deCUjYU6JxkVynJqy71GgQjRgSDxil9e1jCqnk?=
 =?us-ascii?Q?HO89nMKgHWghEgOhP6LiPJk+F6t9PPdYdozlqPhOTFhdAL4W02FFtf1sFuqC?=
 =?us-ascii?Q?UQiT/u5sg5fswUO40Ee/20yF6NQmGT+9toMBiTYEmPI8fnpLk0+nOg6IULhw?=
 =?us-ascii?Q?YZdHL9ZJ0VKMhr1bhk2/O3cbNh5Sy3WHeD1V++ZXzGYy5JHmC8v6wLyhdxR2?=
 =?us-ascii?Q?tUHfFbs39XA5so8wyelXjZiAfj2QB07IHUE54uX7NRocAhU5nJGbgN8XsXDF?=
 =?us-ascii?Q?++vpbueRBDeHGjMkIaa74XNwbdLWWW6JTaM/7koZ5GUFEs58IGrq/FaCMniE?=
 =?us-ascii?Q?k1uyla96clXAiL1KrY+kp5JtqgagEAYKlIaEVsiCwXGbTlzP0Wb7IFmvXTUs?=
 =?us-ascii?Q?lNHmyLF4qmgxeWXtPA0q9WL75bbaS2h5gsoIhDu07o7EbQQiZuNwejgiFtFJ?=
 =?us-ascii?Q?pqQLWuQl+itZOPeEvRqK3WmINtTHyjuyHD6AokCPh0KRFwI5ZigMIi2vaPlY?=
 =?us-ascii?Q?0M85MCzqkZQieRF8mUmzGuS2Npgq+kvePSukUgnfQ3SLYDLVBmBpgug5AMdX?=
 =?us-ascii?Q?7vQiKKE9xNFZb39JzasnZ7aGBlXp8aa1o0D0A1gJdg98Ok+lxE4s1mWgLsrX?=
 =?us-ascii?Q?+hHS5dmgoLzatq2ZnwHHAAxXhzp7tpfZLL/7SDwkiZjOolpaK7uGIqSYyDWx?=
 =?us-ascii?Q?43s5KYe6SD5kzEP7TLFJfXBfYYSE21+WhWGbX/hxNtR20ofNDpl7vd8h1rRc?=
 =?us-ascii?Q?/e01vTyyzIf/Dp2msLQDScDPj98H06tItNDvQ8h35aAbsvz/p6ZksBNjPh+q?=
 =?us-ascii?Q?+w4k2VYUb/ET6HlfJMUoGLkqQl1l4iapcxjTZShEJZQz/0d0k0VOay7p1/B6?=
 =?us-ascii?Q?2bkUxOYzoIeuCTKhKy9swgM0sliVyUeS9a4d527vhYyle5ddvj19w2hv2enA?=
 =?us-ascii?Q?n9K7RJQvdmqil5Kjc3DE+Vb1pd8nejkCgfpiuu9I0iIUBIW2eNH9rv/15dTZ?=
 =?us-ascii?Q?X61jMD7nfb0OEy2AlZicmyGuAU5kP69s6THfYV7+YtTEmCc6QWzMrOkLsbDy?=
 =?us-ascii?Q?lR1CohnhlK5Pvl/byqsJ9EDVu5LT/jBoRP1Hwvjb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4b3ad3-92dc-406f-ad9f-08ddd0b054f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 04:03:11.3958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v9hzcASmqwWes1WifeTt2KJsk0A/3kKMduCrTZb8fnmEfdyJf64nrhmHRk0l3Rbo90Y5u0C5AFP1HWGUB7JWTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
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
> Sent: Sunday, July 27, 2025 9:03 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; inte=
l-
> gfx@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>=
;
> Murthy, Arun R <arun.r.murthy@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>
> Subject: Re: [PATCH 01/28] drm/writeback: Add function that takes preallo=
cated
> connector
>=20
> On Sat, Jul 26, 2025 at 04:41:29PM +0000, Kandpal, Suraj wrote:
> >
> >
> > > -----Original Message-----
> > > From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Sent: Saturday, July 26, 2025 5:46 PM
> > > To: Kandpal, Suraj <suraj.kandpal@intel.com>
> > > Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org;
> > > intel- gfx@lists.freedesktop.org; Nautiyal, Ankit K
> > > <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > > <arun.r.murthy@intel.com>; Shankar, Uma <uma.shankar@intel.com>
> > > Subject: Re: [PATCH 01/28] drm/writeback: Add function that takes
> > > preallocated connector
> > >
> > > On Fri, Jul 25, 2025 at 10:33:42AM +0530, Suraj Kandpal wrote:
> > > > Write a function that takes a preallocated drm_connector instead
> > > > of using the one allocated inside the drm writeback connector init
> > > > function.
> > >
> > > Please start your commit message with describing the problem.
> > >
> > > >
> > > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_writeback.c | 76
> > > +++++++++++++++++++++++++++++++++
> > > >  include/drm/drm_writeback.h     |  7 +++
> > > >  2 files changed, 83 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_writeback.c
> > > > b/drivers/gpu/drm/drm_writeback.c index 95b8a2e4bda6..fa58eb0dc7bf
> > > > 100644
> > > > --- a/drivers/gpu/drm/drm_writeback.c
> > > > +++ b/drivers/gpu/drm/drm_writeback.c
> > > > @@ -416,6 +416,82 @@ int drmm_writeback_connector_init(struct
> > > > drm_device *dev,  }  EXPORT_SYMBOL(drmm_writeback_connector_init);
> > > >
> > > > +/*
> > > > + * drm_writeback_connector_init_with_conn - Initialize a
> > > > +writeback connector with
> > > > + * custom encoder and connector
> > > > + *
> > > > + * @enc: handle to the already initialized drm encoder
> > > > + * @con_funcs: Connector funcs vtable
> > > > + * @formats: Array of supported pixel formats for the writeback
> > > > +engine
> > > > + * @n_formats: Length of the formats array
> > > > + *
> > > > + * This function assumes that the drm_writeback_connector's
> > > > +encoder has already been
> > > > + * created and initialized before invoking this function.
> > > > + *
> > > > + * In addition, this function also assumes that callers of this
> > > > +API will manage
> > > > + * assigning the encoder helper functions, possible_crtcs and any
> > > > +other encoder
> > > > + * specific operation.
> > >
> > > Why?
> >
> > The problem would that not every want can have a drm_connector
> > embedded inside the drm_writeback_connector We have a restraint where
> > all connectors need to be a intel connector and since the we are not al=
lowed
> to make connector Inside the drm_connector into a pointer this gives a go=
od
> alternative.
>=20
> All of this needs to go to the commit message.

Sure will get it there in the next revision.

>=20
> >
> > >
> > > > + *
> > > > + * Drivers should always use this function instead of
> > > > +drm_connector_init() to
> > > > + * set up writeback connectors if they want to manage themselves
> > > > +the lifetime of the
> > > > + * associated encoder.
> > > > + *
> > > > + * Returns: 0 on success, or a negative error code  */ int
> > > > +drm_writeback_connector_init_with_conn(struct drm_device *dev,
> > > > +struct
> > > drm_connector *connector,
> > > > +				       struct drm_writeback_connector
> > > *wb_connector,
> > > > +				       struct drm_encoder *enc,
> > > > +				       const struct drm_connector_funcs
> > > *con_funcs,
> > > > +				       const u32 *formats, int n_formats) {
> > > > +	struct drm_property_blob *blob;
> > > > +	struct drm_mode_config *config =3D &dev->mode_config;
> > > > +	int ret =3D create_writeback_properties(dev);
> > > > +
> > > > +	if (ret !=3D 0)
> > > > +		return ret;
> > > > +
> > > > +	blob =3D drm_property_create_blob(dev, n_formats * sizeof(*format=
s),
> > > > +					formats);
> > > > +	if (IS_ERR(blob))
> > > > +		return PTR_ERR(blob);
> > > > +
> > > > +	connector->interlace_allowed =3D 0;
> > >
> > > This function contans a lot of copy-paste from
> > > __drm_writeback_connector_init(), which is obviously a no-go.
> >
> > The whole point is the minore difference inbetween then and how it
> > derives a lot of things from the drm_writeback_connector because of whi=
ch
> this looks like a similar function but is essentially different.
>=20
> It surely is. This means that you need to extract common code rather than
> duplicate it.

Sure will find a more efficient way to do this in the next revision.

Regards,
Suraj Kandpal

>=20
>=20
> --
> With best wishes
> Dmitry
