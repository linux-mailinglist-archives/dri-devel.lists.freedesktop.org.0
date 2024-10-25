Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2B89AFD4F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 10:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1976110E2AF;
	Fri, 25 Oct 2024 08:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="R7zcgT6k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011044.outbound.protection.outlook.com [40.107.74.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD4E10E2AF
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 08:57:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ia1b6ZgjtreqcLy6OWe9rscu7/HFcAPCt/02s+dpac2Ege69KA/qNo91TQDsvZfmQeg17W029Q+J13iKmzMrrMKZV5Qg02sShZCf6TmvBI5fHN4/yVrao+n3j9KNLeoqInkbMBZxOe0JYvgDacHbDxHgw0CAn+5mAu8VePPXnbzJx3geB7uE2EUciDJhfziIubjnAq3jDzXHs2z20UnPEDuXnOG33737WXUOfvAQXd3Jlk3uvzCfmND05WCMhkguPhtnbA2DE+8ym0CXF+t7geFhqhBFPApvm5kCgA2np0RZCvKmBUTtWc5Xfkl0NIeiruPotwvZ1jX20Wzg4LldaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08b+1iVvGOAxkRUpnAds8VXRnNfbCx9Q/yA5Zye/Gg4=;
 b=mh2mqsb5hSmD7T3RVayMiJkUKdmAIwNWLa3D8jEBG9m/uJwICw8bsLlb9vepVE/XNp2bcb7RnbItQzAZQmkeiFDtD6o9HY/Eg8mQehp7gksNcZCadbe9w+OGd3vBTDQaPJaJ/bfIFs/GC3mwNessTyLLmPu4pH9ky+cyupD/kDZ7FRSnFmuVn9kmaYTxy5meTXLeC3lNNHp7nVv81OVRnqhpJtOvQV/1kjmMLnwh5XLwW8qvlrlpVdOjfIGmRo0Yg4zfoLE7GfSmdF11/vEQXl31pxUYsi7BeVKqcYLOCMe60dzI0XLA8FJSgfx09cIlrBUSas9IwazP8c2Y0SNlmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08b+1iVvGOAxkRUpnAds8VXRnNfbCx9Q/yA5Zye/Gg4=;
 b=R7zcgT6kzDLamrRe1/YRvcyKJJ77br7mFTwD+F2z166Hj+3XCY8nx6H/50biQDrcU9AK4pvUrhJcU2Kfl8T5zZF/HRIcOMnxOfjGlX6h9x6xpUzMpGpXnxGgGhXBmSHcSs7zV2y25TSASGG1E02zereGGftw5T+P1ztbZZv/aTw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12981.jpnprd01.prod.outlook.com (2603:1096:405:1c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Fri, 25 Oct
 2024 08:57:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 08:57:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, laurent.pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
 <will@kernel.org>, "sakari.ailus@linux.intel.com"
 <sakari.ailus@linux.intel.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 12/15] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Thread-Topic: [PATCH v3 12/15] drm/bridge: Add ITE IT6263 LVDS to HDMI
 converter
Thread-Index: AQHbI4Ue6dBHAatu9E2qi1QByFRdurKWBGhwgAEjQwCAAAhtMA==
Date: Fri, 25 Oct 2024 08:57:13 +0000
Message-ID: <TY3PR01MB11346F128681E8D83D9C2FE35864F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-13-victor.liu@nxp.com>
 <TY3PR01MB113465BBC5FD4EAAE89D9EA57864E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <4e78781a-bce6-4582-b6aa-417f57c4725f@nxp.com>
In-Reply-To: <4e78781a-bce6-4582-b6aa-417f57c4725f@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12981:EE_
x-ms-office365-filtering-correlation-id: ec4c7214-5f21-44a4-5b5e-08dcf4d304d8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UnJkMzlXZUNJbGZqaWphb1pTTEJ5anBjQkNXc2ZoRGFYdUNwRXNkTk40Tjlk?=
 =?utf-8?B?bW8xcGwvdWpYQk0xU2owRXRySVQ4cVJ0RDByVU9hc01GdHR6TWtaajJtY250?=
 =?utf-8?B?N2E2a0lsdnRDbjlydUdwdEtQbFVOdXZYakhuZ3hUMXpjU0U4ZzBsSTNzVUJp?=
 =?utf-8?B?dmFoeFdWYVAyOTQ4S2FwR0JXaE5sUGFDNmdiSXJDVmQ2d0ZrOWF0TUFvUXpT?=
 =?utf-8?B?TjAwY2xVK2hkNFZhZGZMUG5aQXMvem5BSTB3NHgvaGxsdXRaNmNhZDRwa3B0?=
 =?utf-8?B?TGpqMkxDd1ZYb1FYSHVYMU5ZV3lzRDdOSUVIWFV5SlA3b2RHMEFIaWRiYVo1?=
 =?utf-8?B?ZlM3L3F3UnVqS2RRRGF2VnV0T2EvTmdST1BEWEIvSzZMSmJGZEJSOHMvM09Q?=
 =?utf-8?B?S2k0OE1ReWlpSE5oSXZNY1hLVmlJSlhXa0RvM1BMd0lRckxBU1AzekRURW8w?=
 =?utf-8?B?ZklRdDNTczJyWGxpTEp0SjBxOXZrcis1d2NXNzVCdHU4RzkxcUZUWXF4TmlX?=
 =?utf-8?B?d2lvdlBYQXhDSzBkSXVEME5XbXZhT1UxMEVCclVpTUNyblQyTkdaMTVFaXpG?=
 =?utf-8?B?Q0N0T3cvSGpoVkc3d0c0M0xuVk8zQW9aMWdNanBLamtFazVYYXlpam9PY29I?=
 =?utf-8?B?MVFRVzd4VG9ZKzUyTThxNVphcUlEQS9pdjBqSUdURXJIVWEvSlJxR0tHMUFm?=
 =?utf-8?B?L3k4WGJHQVFKMjkrUjdEUWZOT2VJVU1PVEREMmo1RjRBdDl3cnM2VHNzU0Rk?=
 =?utf-8?B?ZFZrMmlPaVFOZk11RzB5a0taa3BJeUEwNFBkTzV6VmYrTGdoY3NMTVI3Vkkr?=
 =?utf-8?B?Qkc2Rm9pTWNQR0IzN3dTVVpmdWR4c3ZYK0pMS2QzbFp4WVBGNGwrbE5oQmRy?=
 =?utf-8?B?dmZ6SmJhNTlFRWxvdHVQY21TaGdEOFNoanlIdE50NkZQM3Nqb3NPVnpHQitx?=
 =?utf-8?B?RU9helUydUVkc3FmTFJLa0h4c2ZmbkRhWmtBSThERUZ0NmQzUTNXMlFSampo?=
 =?utf-8?B?VXhuVWd0NjNyUUd3WGxici9rQ3JBMlBnanRnd25mL1Rjam1oUnU5Vzk1ZEo0?=
 =?utf-8?B?ME9HdzFaWXpFQ0QrMmFDMTI1WjBiSVA2Rk9LZVdNTjlOTWpJdmRDTk54eXdz?=
 =?utf-8?B?R3hSQjFNcnY2MHRya1lZT0Y1dlErb0V6VnJ6YmpIeTE1NExvd2VYQmVnYUpz?=
 =?utf-8?B?UGNiSWcyTzREcXhJUlhIWnpSMzcvSVBYLzAvTlJ6d2RNblhCYmltUlF0WVRN?=
 =?utf-8?B?WCtocWNvM1lwQXNFNFBCd080M1dGUzJkTCs5QUUxNERLVUV0SUsweU85SEtn?=
 =?utf-8?B?TjJGUTNFSkZqRUJENFViazFMT0V5NmhVTkVTQmU1ODBvSHZRNnl2cHROWUxU?=
 =?utf-8?B?cGV4NDRUS1M2NE8rY29jUEtDTTJHcVRidGN4c0J6R1dGekZJUGUrMVpQSlBz?=
 =?utf-8?B?NW1EOUdUdDRyUWdCUzljTDdtc29ReFVPenB3c0NXUU0ySGFzS2tlYmFuWXgw?=
 =?utf-8?B?TytualZhZVpodjlhSE9POGh1d3dITEF0bldnNkhKb2txQ3A0ZmF1RkZaRFFQ?=
 =?utf-8?B?ODEreUN3WldWSWowZURub2ppRVdNZmhGZC90WnNjNTNIYXhxUUpiRXU3c3li?=
 =?utf-8?B?eURLL2NUUmw5S3lCVVFjanVKbFI3Mk9iRU9hYXJwd3pad24zSm5oenZWRHM5?=
 =?utf-8?B?S3Fka2JtWEhjcStKWmpydkhpM3F1bzl2UlMyRnphZTYvWmpKYzk3T2k1L0Q3?=
 =?utf-8?B?cm56WUNWazJLQ0sySGpVRFZMcUhzcDFFYkxDYkRrZVp4Ym9rT3hVZkNBMDdP?=
 =?utf-8?Q?vlyw+6xpdFGXIwmp9dUZ/tN8tjuo0gShowaI4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHIwNUhrTHlvZXFSbzNrdlIxL1o2SVRMd0xCM3NxQjlkYXp1Nmo0UFNNeUV1?=
 =?utf-8?B?UUhlRTZoWG8vb0V3bllneTl3WlYyYjNyZ3FUZ1RaQmd5TlplZkYvKzh2bFdi?=
 =?utf-8?B?SjE1TFUyaHlsZDdPR0tETUQ5aDE2WnoxMUxrMC9VVWpsRGJLNzhPaGVLNTB2?=
 =?utf-8?B?STlDMlBydFFlVGRGZlZSMkxuM3RKK29wN1hsbUhvWVBVWldCaVMzUmJsQ0tK?=
 =?utf-8?B?VFhYRXMvaUplQ0lqZmRudmFNOUZ0WjY0RitnSklmQW1ZcVE5TW9mUEFjalI1?=
 =?utf-8?B?ZXBKVFMrT0M0K280N0diR2VlWjBXaHVFc09kWk1ORUhaYmdmckhnS0JON1Zz?=
 =?utf-8?B?NTFXaXFTdjdMeHJGcVBlS0ZoQ3FtTXA4bmJlZm5NVGFjYTJDVWJVMHdvTVc4?=
 =?utf-8?B?YWZLOXlZaVhYK05FYURnYVpGZGUrVHYxdFE1TGtTaEVtRmdCTEJqZ2JDQ2xC?=
 =?utf-8?B?NEZaWUtFNlBxOGNwZFRFTm84Vnc0enhTSUQ0dVdEMWM2NlEzRXdVeU54Q0Rh?=
 =?utf-8?B?eTBjamkwNG52VUFoS2pnNWxnYUpYbHAwcFZ1WDRNU0pRNlpZeVVVc3AzZ1Jp?=
 =?utf-8?B?aW5zdDZXNnEzRzJnYjIxZXoxYTMzdzk5dnh0anNkOXhqdkFXNWRnV05zdUFT?=
 =?utf-8?B?OE1PU2pEZlg2NWhNbUY4cG5Pb252WUp2bzRqaFFwMFdIell2UjJFaUQvaE96?=
 =?utf-8?B?M1JjZFd1NFZhUWthWkVYYXNpV2cvUlJocW9oMXRMUTR4TlZPYm42cmhncEdv?=
 =?utf-8?B?U1NadElsSWFTeXU1cmVEOHRRU1BJSUtGZ2pCQmhzVUV3TFFmWG1HMnFpc1l0?=
 =?utf-8?B?d2htajVqTVdqTTVsVWtPeEx0V2xxRytnbjJqOFBCbFlFY0ZaSWVnc2RkOTdh?=
 =?utf-8?B?cC8rQmR6ajdPMzFaQ09WMVpOTVN2YlRoV2k4a1MwSThwWUpNR3RrQS92Y1FJ?=
 =?utf-8?B?MEt3MTB1QkVCQ3BRLytDalJKS1YwejAxdEpxVWhtaElRcHVubkVsWXZDVFRn?=
 =?utf-8?B?dnZqZmdRSHdEcDdDUWJzbVRRTTlsK3JPbHhQa0lOZnBnSzQ0aWpSQ0lydDNM?=
 =?utf-8?B?NlZ5V3FUd0kwZEtEdkcvWFQ2Y0x4STZzekd0aWNzR3A1THc3bi9BYnhPN3hy?=
 =?utf-8?B?TnVYdzA3eVdtWW9HM0tiM3F6SnRMa1ZpNXpvYjZoRGhWOWc1U3BFbXdXVXNu?=
 =?utf-8?B?MHdHWDQ2azZsZU5lTXNGakthcURlQ0NzRkhDYW9JOEs0UUdGNVBaRDhJcStW?=
 =?utf-8?B?NFhsSkd3RjQ0aVpVM3dvSE1lWFF0S1B5N2d2bFlWdVl5SXU5aXQ1ajFuRUNn?=
 =?utf-8?B?TFZ2b0dMSzVlUFN5blIxRDUyNnFYd2pqWUNlZHQ4N0pudk5hODYxT3ArbHpq?=
 =?utf-8?B?WWtlU25RYXBJY1orV2xRMDdWWmNsN1dtQW8xd05aQmJVWUdva3d0QjZWaDhG?=
 =?utf-8?B?RFZVVlovd25WbnJiOTNjVjV1SllYZHhjTjZIbmFVc21NaVdlL0UvRlJ2SVlo?=
 =?utf-8?B?d1AyZjdSR2RlVko4K202dnpENnhhbEZnS0Jza0JQUi9SSW5rUHlzSU9vTnR6?=
 =?utf-8?B?Wkd3YzNxNitaMURxb09vZnNrSytMcUNjMDlKV0ZzUEdLaEhXTjNNZFo3Q2lW?=
 =?utf-8?B?czJ0L2l5UTJVNW5NZkZxTmo2N3B0VnVHSVQyRUxNbEx3T0FGbnN6UmJMZEtu?=
 =?utf-8?B?NStYdnpnRXJXNEtjQTVuU2xza1dGb3k3QUIzWWowNXJvd0U2SE9oSzM1VWVY?=
 =?utf-8?B?OVlzRDZVL0c3ck56cFZiTGpaMkdJUUU3YVllTXhwaFRjYmU0WTBIbmxTdUhl?=
 =?utf-8?B?MlRTY3BOYlp2TjJTeDFzUmJucGhjVXlSZ0Q0SDRTYTduWXlpeVdTbG9YTU9E?=
 =?utf-8?B?K1NvM2dGSEMxVTFFNlZJY1hETlJzSThpMVRtQ3luaEVQeVIwaFUrSUVqbGtJ?=
 =?utf-8?B?ZUpDbGpmREJwdGx1UmR1Ny9Ea3NqdlkyTTVOdkliSkhHcTlLdi9sYmd4VzAr?=
 =?utf-8?B?MElPdVdaTnEzZFkrYVMvUkJTUEdFWkhHb1VQai9XWFZDZ2tsdW5QeE1jQ1g3?=
 =?utf-8?B?NzgxUS90dkhmbE96NHQrSlduY2M2eVNBSVBiMXBycUo2S1RzU24xRkgzNy9s?=
 =?utf-8?B?TGdPaDR0OWdTdUIxY0JGanVzOHNUZEkyTGtxd0lHTlc3VEpRZDZHbEgwR0pQ?=
 =?utf-8?B?RUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4c7214-5f21-44a4-5b5e-08dcf4d304d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 08:57:13.6093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZAC41RubuEEmWq09ip3qfwGAON/lIeHk2bbpsvBmFNkM84gjAc/utUhkw3VQviQxtvjJZmiuwB1y9ZLu2yOGDo42ktW328mPO2n6xo7XyIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12981
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

SGkgTGl1IFlpbmcsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJp
LWRldmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFs
ZiBPZiBMaXUgWWluZw0KPiBTZW50OiAyNSBPY3RvYmVyIDIwMjQgMDk6MjUNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MyAxMi8xNV0gZHJtL2JyaWRnZTogQWRkIElURSBJVDYyNjMgTFZEUyB0byBI
RE1JIGNvbnZlcnRlcg0KPiANCj4gT24gMTAvMjQvMjAyNCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4g
SGkgTGl1IFlpbmcsDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBMaXUgWWluZyA8dmljdG9yLmxpdUBueHAuY29tPg0K
PiA+PiBTZW50OiBNb25kYXksIE9jdG9iZXIgMjEsIDIwMjQgNzo0NSBBTQ0KPiA+PiBTdWJqZWN0
OiBbUEFUQ0ggdjMgMTIvMTVdIGRybS9icmlkZ2U6IEFkZCBJVEUgSVQ2MjYzIExWRFMgdG8gSERN
SQ0KPiA+PiBjb252ZXJ0ZXINCj4gPj4NCj4gPj4gQWRkIGJhc2ljIEhETUkgdmlkZW8gb3V0cHV0
IHN1cHBvcnQuIEN1cnJlbnRseSwgb25seSBSR0I4ODggb3V0cHV0DQo+ID4+IHBpeGVsIGZvcm1h
dCBpcyBzdXBwb3J0ZWQuICBBdCB0aGUgTFZEUyBpbnB1dCBzaWRlLCB0aGUgZHJpdmVyDQo+ID4+
IHN1cHBvcnRzIHNpbmdsZSBMVkRTIGxpbmsgYW5kIGR1YWwgTFZEUyBsaW5rcyB3aXRoICJqZWlk
YS0yNCIgTFZEUyBtYXBwaW5nLg0KPiA+Pg0KPiA+PiBQcm9kdWN0IGxpbms6DQo+ID4+IGh0dHBz
Oi8vd3d3Lml0ZS5jb20udHcvZW4vcHJvZHVjdC9jYXRlMS9JVDYyNjMNCj4gPg0KPiA+IEp1c3Qg
YSBxdWVzdGlvbiwNCj4gPg0KPiA+IFdoYXQgaXMgdGhlIG1heGltdW0gc2luZ2xlIGxpbmsgYW5k
IGR1YWwgbGluayBtb2RlcyB5b3UgaGF2ZSB0ZXN0ZWQ/DQo+IA0KPiBXaXRoIHNpbmdsZSBMVkRT
IGxpbmsgb24gaS5NWDhNUCBFVkssIHRoZSBoaWdoZXN0IHBpeGVsIGNsb2NrIHJhdGUgSSB0ZXN0
ZWQgaXMgNzQuMjVNSHooMTI4MHg3MjBANjApLg0KPiBpLk1YOE1QIExWRFMgRGlzcGxheSBCcmlk
Z2UoTERCKSBzdXBwb3J0cyB0aGUgaGlnaGVzdCA4ME1IeiBwaXhlbCBjbG9jayByYXRlIHdpdGgg
c2luZ2xlIExWRFMgbGluay4NCj4gDQo+IFdpdGggc2luZ2xlIExWRFMgbGluayBvbiBpLk1YOHF4
cCBNRUssIHRoZSBoaWdoZXN0IHBpeGVsIGNsb2NrIHJhdGUgSSB0ZXN0ZWQgaXMNCj4gMTQ4LjVN
SHooMTkyMHgxMDgwQDYwKS4gIGkuTVg4cXhwIExEQiBzdXBwb3J0cyB0aGUgaGlnaGVzdCAxNTBN
SHogcGl4ZWwgY2xvY2sgcmF0ZSB3aXRoIHNpbmdsZSBMVkRTDQo+IGxpbmsuDQo+IA0KPiBXaXRo
IGR1YWwgTFZEUyBsaW5rcyBvbiBib3RoIGkuTVg4TVAgRVZLIGFuZCBpLk1YOHF4cCBNRUssIHRo
ZSBoaWdoZXN0IHBpeGVsIGNsb2NrIHJhdGUgSSB0ZXN0ZWQgaXMNCj4gMTQ4LjVNSHooMTkyMHgx
MDgwQDYwKS4NCg0KDQpUaGFua3MgZm9yIHRoZSBpbmZvLg0KDQo+IA0KPiA+DQo+ID4gT24gUmVu
ZXNhcyBTTUFSQyBSWi9HM0UgcGxhdGZvcm0gSSBoYXZlIHRlc3RlZCB3aXRoIHRoaXMgcGF0Y2gg
c2V0LA0KPiA+DQo+ID4gRHVhbCBsaW5rIDoxMDgwcEA2MA0KPiA+DQo+ID4gYW5kDQo+ID4NCj4g
PiBTaW5nbGUgbGluazo3MjBwQDYwDQo+ID4NCj4gPiBGb3Igc2luZ2xlIGxpbmsgPiA3MjBwQDYw
LCBzb21ldGltZXMgSSBnZXQgbWVzc2FnZQ0KPiA+ICJpdDYyNjMgNy0wMDRjOiBmYWlsZWQgdG8g
d2FpdCBmb3IgdmlkZW8gc3RhYmxlIg0KPiANCj4gSSBkb24ndCBzZWUgdGhpcyB3aXRoIGkuTVg4
TVAgRVZLIGFuZCBpLk1YOHF4cCBNRUsuDQoNCk9LLiBNYXliZSBNRUsgc3VwcG9ydHMgdXB0byAx
NTBNSHogcGl4ZWwgY2xvY2sgcmF0ZSBvbiB0aGUgU29DIHNpZGUuDQoNCg0KPiANCj4gPg0KPiA+
IEZyb20gU29DIHNpZGUsIGl0IGNhbiBzdXBwb3J0IG1heCBkb3QgY2xvY2sgb2YgODdNSHogZm9y
IHNpbmdsZSBsaW5rLg0KPiA+DQo+ID4gU28ganVzdCB3b25kZXJpbmcgb3RoZXIgdGhhbiByZWpl
Y3QgbW9kZXMgZ3JlYXRlciB0aGFuIDg3TUh6IGZyb20gU09DDQo+ID4gc2lkZSwgZG8gd2UgbmVl
ZCB0byBsaW1pdCBhbnkgdGhpbmcgb24gYnJpZGdlIGRldmljZSBmb3Igc2luZ2xlIGxpbmsgQ2Fz
ZT8NCj4gDQo+IFNpbmNlIElUNjI2MyB3b3JrcyB3aXRoIDE5MjB4MTA4MEA2MCgxNDguNU1IeiBw
aXhlbCBjbG9jayByYXRlKSBvbiBpLk1YOHF4cCBNRUsgYnkgdXNpbmcgc2luZ2xlIExWRFMNCj4g
bGluaywgSSdtIGN1cnJlbnRseSBmaW5lIHdpdGggdGhlIGV4aXN0aW5nIGNsb2NrIHJhdGUgdmFs
aWRhdGlvbiBhZ2FpbnN0IHRoZSBtYXhpbWFsIDE1ME1IeiBwaXhlbA0KPiBjbG9jayByYXRlLg0K
DQpJIGFncmVlLg0KDQpDaGVlcnMsDQpCaWp1DQo=
