Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EB59D2E99
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 20:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABCE10E368;
	Tue, 19 Nov 2024 19:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QdguLODE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011014.outbound.protection.outlook.com [40.107.74.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB82F10E368
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 19:12:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhStyFAeBb4p4louMnJGS3PAi09H/4zyLA6M7h87wwM1F2CvfQXluvmvBvfBqZ+7+uLU9fOgZirUPYsNC8HNmnQ13V4iOtm+ThcWgGR4ywDRfBZLu7ngPaRVMulW+emufOXZX+5xx7s3e1l6hNmqQbmsfJ8rYc9D10jMFi9impA+fD/QSAyRK7Ry84Bi5g/P+gD4vOM3W01lBfVxFiam+6KYqmhdEW7Wxb7F9EsVpn08z+gfv+fipXenNsx/JBfw769+I0zYWaAj2KLdVElaSLGtLvYk0aiFG2p21Pr+BJ1sXju4LlbWTMpIn/l72n8Ec73JerAQjjBfFje7Z3oDRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuV30SFtjSNc3X/3nGrtNOK9DuTcXBfaf7xxhp4zNdA=;
 b=ECIMhPHAoULszc5MnnRiFt7ZeXLWsPlX6uv2rzImQafrKjjbrlh1GX0Uo1n2/CGh+QIYx1zyZO64v761GA41bVM35M98oo67I4oe7QV9flS9AiwJqO+M3WRdux6gqkufeT2yDPfYZj5HBrxdwLD4urKXQA1LdbZ9n49ItPRJT1phFTOhBqfzYR7Xbx6oJdY13s30Ys9xZ0cuVxPA+OqwYyQnbzmAJpJKYidoutY6oxuT0qvECZXqXaiw+QuWgbJAE6FJTCQTwWiw1Oef2lEe1hj+/G3dkOoiIK8U1+9x+4dqe3IMNWOLgwCRC5kPteP41iXL2RVfbKGX7TXuYvX9Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuV30SFtjSNc3X/3nGrtNOK9DuTcXBfaf7xxhp4zNdA=;
 b=QdguLODEGuSsDbD7uw7BQtjfyzazWdegioTLZFchXIj6NRVpVY0RMwgktD/YXLvX0VweuX97OrfWx17O2twfT6fO5phezWra4z4VXRTJmlxyyOsVsJStKkE7rhkom0abbzEPkh7b1K2QoeqeBYTk6xnZ0WZM+t06Se99giaPwxI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYBPR01MB5424.jpnprd01.prod.outlook.com (2603:1096:404:8029::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Tue, 19 Nov
 2024 19:12:16 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8182.014; Tue, 19 Nov 2024
 19:12:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH v6 1/3] drm: adv7511: Fix use-after-free in
 adv7533_attach_dsi()
Thread-Topic: [PATCH v6 1/3] drm: adv7511: Fix use-after-free in
 adv7533_attach_dsi()
Thread-Index: AQHbOrMcexoC9SD+R0iFMelBpBkd2rK+9fuAgAACLHA=
Date: Tue, 19 Nov 2024 19:12:10 +0000
Message-ID: <TY3PR01MB11346DB674FABBC3F3B2A2B0A86202@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241119184420.138785-1-biju.das.jz@bp.renesas.com>
 <20241119184420.138785-2-biju.das.jz@bp.renesas.com>
 <20241119190317.GT31681@pendragon.ideasonboard.com>
In-Reply-To: <20241119190317.GT31681@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYBPR01MB5424:EE_
x-ms-office365-filtering-correlation-id: 2bb6787f-6273-47ae-03fe-08dd08ce11bc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?WGFGRWo2MUowUjNDYVVwSzhiRGpueExkanZOK2NsSmZrQTYrTnFaWkt1QlRT?=
 =?utf-8?B?REN6dGRPWXI1dmlVZGtzaTdPbzErSVQ1bWlsZFU1Wk9IbHNMZ09zNkJhRmJE?=
 =?utf-8?B?QUZxVkpGbk42OFVlZkdJNEVBNG0ybkJMRXJrQ2hsOGxGd05pTXI1cmlmZThK?=
 =?utf-8?B?dUh5R2NKS0lOSWNqcFhHMVN6ZHZ4U2J2MTVyRVlTRHZPZ0VsVFVlL1ZLWWFy?=
 =?utf-8?B?Q1RqZDVzU09BbEtLTi92dVpjMmpIaFpabUk0ZXlOT0R1VmNKTkphQjJaTFVT?=
 =?utf-8?B?NVlHMXUrT1BGOWpUazhTV2NQZ3d6N256NndxN3pTMWdVS3NZTnBvcTQ1S29D?=
 =?utf-8?B?ZTE3K2ExVkdzb3pvMmFmQTZDamxVUng3L2NaRm80NWZDU1NWWnhka1NIZG9X?=
 =?utf-8?B?dTI4M0JpUDFMVXF1L0U3RjNiRUllUDFTcXl6VFM5eS82UmJNaWI5OXU1THJB?=
 =?utf-8?B?RkdtbVRKMmExdHQvNUp4bmkyTC9qWnQ3ZkU0MUFFZDBWYzQ4YzVXNGxEL28y?=
 =?utf-8?B?czB6V3hLaWMrUy9xVGFoZUlTVWl6N1NaLysyaWM5RSt1K2ZNT2FGa0wzYWdU?=
 =?utf-8?B?S1RkNDIvRnkxcExaVU03dXp6K0pXM2x5dERjMVB1RDJyamxOak9IWlI3TGVP?=
 =?utf-8?B?NVF3d1RhSU0yZEpxZkJVajRJUm1pTnlabEllZTZrT0ZGa0JJakN3MS9FVjkw?=
 =?utf-8?B?dEdQdEMvdXV4cWRpTm1wUTNYU0lqZk43UW9BUktGU3pmTTdHUGZpRWJCUG9C?=
 =?utf-8?B?ZVlPNlNibUo0Nkt0cmNMcndpeEl3YWZNQk5Ib0lTQzVNUHNCSUpGWWlzM0d0?=
 =?utf-8?B?WTF5T3MwdVdKTnJJbDNvUUd0UTUxTEQ2S2QxNEtFK05TUGIrbEhSUmRkSnVr?=
 =?utf-8?B?b2ozRG04cWJoa0FGVGwvNkc5RGovMVdSK1owa2ZjRE5UYUR6dmEwaTVUWTcv?=
 =?utf-8?B?SHdMQ2RpMkJNZVpQMUE5bEEzYUFhN3dHSzZDcjY5NWxiTmtmeG5MZmQ2bnUv?=
 =?utf-8?B?YWgzMUlnT1loWmVoTXA1TENKUTJKTHl4cit4ZENUaVBwVTQvYWZUN1d5QldJ?=
 =?utf-8?B?dVRQOExVeUprTS9VY0pIN3RpM0I5bTg3MXJWY1hBOGFEWmxSY1dhamRsQ0lQ?=
 =?utf-8?B?eVd2THI1V2M5ZldmdHhibEFNSHZLQzFpREhRVzdWT2phWTlKZmxLYlp2SVhN?=
 =?utf-8?B?Y0pDQ09sQXRtWHdtUjZzTnl3bmdpRm9aYTVhTG5hOFEraWZrcjN2ZXF2cGJP?=
 =?utf-8?B?ZTZuWllYb2pvTlBHWmEzeCt6VU5HajdpRENMUEl3ekIxNXRnWmFEL1o2NUhQ?=
 =?utf-8?B?UzI5SXlXYldlck4rZHl3SGVnK0RGaHM2cDRHWWhBbEJ5c2ZoZUpwU3RpUG5Z?=
 =?utf-8?B?VFQ5TkVTdkQ1U3U1bFcyVGFuSll3MnArQmVCMWtmTG1uMzZKTXBFVmVhL255?=
 =?utf-8?B?OEFIa0ZlcXJuZjZQRDRBVlBQTjNRQzJIR213bXk4TWJqTDMvL3NKbjV4YkZB?=
 =?utf-8?B?bG9SZnc5YUhxa2lUTkQ0S2thYldVblo4d1VxcUl5OW9EZ0tPTG5zSG9sQkJG?=
 =?utf-8?B?eHRoTWRKOXR4L0YyMmhybHkxZzJLR1c2WTRHdlA2TXFISlRkeEJHNDgwVnha?=
 =?utf-8?B?NUZIZlZidkxQeXY5V204Sm1JdEZtQzROWGJzOXFwU3llUHJvVk1mMjMvZlFt?=
 =?utf-8?B?OEhreUhMUmQ2SS9mc0dGWlU0bVRQL2RWNEZ3ems3cmVXbmhrQjdaNVFqSnRQ?=
 =?utf-8?B?aUZCVlJ3d2IxNFhoRG5Day96bnhKK2JjSjBOREFBbm0weEN5Um9vbnZQS0NR?=
 =?utf-8?Q?NSggyTD3ap0BEx8O0wfTs7b0KmBtQd2WDzNIU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEJTYlc0YWp1U2IwS1RzTWw3MDk4TWJwTTFIY0ZkQkhsWkNubW1yUzlvcTVN?=
 =?utf-8?B?U2w0WE5KK3F6M3RvYnVONW5HSmJXNStkSDdJTm1nNTB3WitUcUw5ZkNBSXl3?=
 =?utf-8?B?MWtHUWdBQWhCMFRoZGtqUzlFOUo5bzlFUmRDVVpGZG1QWlEzaDV6MnVlZ0c3?=
 =?utf-8?B?aFJpSVkvMFQ5NHFFNXFQYmEzSmNJYTd6ZERXaDV2eDViMGJJY1cxZWc1OTNx?=
 =?utf-8?B?WGlrVGlmUGJrcVJscXlCdFFmY3BJL1hRcEF6QmJqMUhObDhLZjFCcS9FQ1pZ?=
 =?utf-8?B?VW83cm1NRkNRT1JlU3VtVFRVMTlxZEtCRUNXd0p6dTY2L1NqTVZqZU0yR1VC?=
 =?utf-8?B?bVgyaVVyOGhQNkk2dFU3SzdlWWpzOUtka1JDWlJzZkxVV25YTjBmVUVMRWRJ?=
 =?utf-8?B?cGlOMm9TZ3h1Z1l0NEtHaTM0REpYWG9wRFN6RjVGM09nQi9uZEtIbUFGQS9a?=
 =?utf-8?B?ZzZ5Szczb3d3K2pNSUo3WGUvS05RdjhhQndSR0x6bzN4U0YyR3lOMGd1ckov?=
 =?utf-8?B?K2hQMDE2MWhiMkhkMnNoc3NRZTZWZFlIcTFIYWZvNHJDbHN0Yys3QU9Zbmx4?=
 =?utf-8?B?cnF0VFZBZ0hyeUJsQW1mUW1tYlIrVXRQQmtKbGNzeWhVVGkvQnAyNFd1ei9z?=
 =?utf-8?B?VmVFdWt3cHpiRDBVK24rN0tlcGJ6d3hhTXo5MTdvOHdaWFp0ald6Wm04RXN4?=
 =?utf-8?B?UnVoL3ZNSjl2WmhYR3FIbmpmZmdqczVUWXh2Mk5mVXk2RnpLdzJQSjZuaHNO?=
 =?utf-8?B?MXlsTDE3eGpINGJDK1lnOTBTUUV5ekJ0bzgyOXJta2JQQ1VTMGZpVzlkc3RB?=
 =?utf-8?B?RG0wYVBpNnpDWW1BNXBDWHhpbWd1RXVpallSalp1NStRekdzQ0IwUDJaZWd1?=
 =?utf-8?B?TTFsQitESmhERFAyWkdCYmxsZHpyUytndVF4YlZNaWlYdHNUTlR1UXF5d292?=
 =?utf-8?B?THhPV09MR1A0MmxUYVNFWmdXb0crbm9FeUMvWTZWSXFEOTJsR3FwSGlYZ3NK?=
 =?utf-8?B?aVhsWWZoZE9TcVhsMjNWb09JWkdrLzhJRUZwYzlDMHpGRHlOZENHVys2enVF?=
 =?utf-8?B?TmdTYXllcVNCSml0NGx0UHBOU2RUT01aYTR3SVNWVmRHMUNWZ1h3bVMwTmw2?=
 =?utf-8?B?WnhDZUpEZEUrV2IyR2l1QlllMVNPVFJxbVkyUnEvSlhBS1FERktnNW9yelZB?=
 =?utf-8?B?cEljT1Q0bWhPSW1uWWtyMGw4YUJBOGFQYjBPOUxsNVdYaWtpeTF0VFJzYUtL?=
 =?utf-8?B?TDZOYmZySFptb25oc0pmWTFxL0JjOVdUVUFNZWV0aUc0Rk1IUkN6Z09Ba0E0?=
 =?utf-8?B?SWV2WmdlTDRvcGhHTW5YOFNBV0lZcEl5L3hFUHltVlJPRWgybGZzOGZ2d01r?=
 =?utf-8?B?OGRVV0Z5KzFvYXJiQ1diajhma0dndHF4WXVOb0lZeWpqclFSQnpxbWdFTDIw?=
 =?utf-8?B?NGsxajA3aFc4R2tLNGwra3RKYTZNVzdUcDYyaDlnbDNPVzRiT3B2UzVVcE1t?=
 =?utf-8?B?VVVWU2dONkdwWndCVDRJbG9CZ3pUQVNRL3loQktMRTdGbzRDSFp5ekhiNDk2?=
 =?utf-8?B?SWxTTUJ5Yit5UXZDUGxBMUYycHJaL0hSbVlMcWhjOTJaYnl5LyszZFdYNG5J?=
 =?utf-8?B?bythWUdLUEtkdUJLNGNvU3JoY05zSnppbEFFY3BSamlrTGpmZXRiaXNGWm1v?=
 =?utf-8?B?RFlMdXpLUzNtNUdjK1FwUUNFSWxtRzRCaGQwNjM3RFEvaXpwV1pUVlVUc0l0?=
 =?utf-8?B?a1RPRXdLcXpCMVJPVVB0ZTNjdDB4NlBBQUE3L0ZJZytLODFOdE9XbHgwUFll?=
 =?utf-8?B?Q2FDUU5QY1ZtejNSODcvalRyRWZYT3hIdFBOTXhRdEhSQ243MWdVa0dXWlc2?=
 =?utf-8?B?cWc1YXFRZW9OMDRDTEh4ckp2Wm43OWZwdjBtSkJMR1drc0JvSTk1Lzh4UzF2?=
 =?utf-8?B?VXlZcGxuakhGUzlWTkZ5ckd0R0Z2c2VDZkNMNU9MekR5QmcrTnc4d2d2SklM?=
 =?utf-8?B?UVlpeXZ0UmVEOXpyQjNqM01ieWZIM3c1R2M2QmFIUkpOUWFVaDUycnE2Y1ZZ?=
 =?utf-8?B?QlVkT1FHNitFOGFCajBEMk5lOHpkMS9JRTFTQndlYWF6QWpiYWpudkM5aTVO?=
 =?utf-8?B?SGN5bFJMd28wN1N4cDlRY0dmTUpwbTJyT1dUMjRpZDlDWWN6MmY0RzR2MXlR?=
 =?utf-8?B?bUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb6787f-6273-47ae-03fe-08dd08ce11bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 19:12:11.0120 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AiBmb+MXvvlx4Uk3hMAMOhFIS9k6U0oYNyOyHgOTspiUtXwsWUvhkIBJMvHj8fkx2ZTBedwHvnf1ITIukPzfO7V/R7IgwktGnOLLEX8CaMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5424
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

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiAxOSBOb3ZlbWJlciAyMDI0IDE5OjAzDQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMS8zXSBkcm06IGFkdjc1MTE6IEZpeCB1c2UtYWZ0ZXIt
ZnJlZSBpbiBhZHY3NTMzX2F0dGFjaF9kc2koKQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5r
IHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gVHVlLCBOb3YgMTksIDIwMjQgYXQgMDY6NDQ6
MTRQTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gVGhlIGhvc3Rfbm9kZSBwb2ludGVyIHdh
cyBhc3NpZ25lZCBhbmQgZnJlZWQgaW4gYWR2NzUzM19wYXJzZV9kdCgpLA0KPiA+IGFuZCBsYXRl
ciwgYWR2NzUzM19hdHRhY2hfZHNpKCkgdXNlcyB0aGUgc2FtZS4gRml4IHRoaXMgdXNlLWFmdGVy
LWZyZWUNCj4gPiBpc3N1ZSBiecKgZHJvcHBpbmcgb2Zfbm9kZV9wdXQoKSBpbiBhZHY3NTMzX3Bh
cnNlX2R0KCkgYW5kIGNhbGxpbmcNCj4gPiBvZl9ub2RlX3B1dCgpIGluIGVycm9yIHBhdGggb2Yg
cHJvYmUoKSBhbmQgYWxzbyBpbiB0aGUgcmVtb3ZlKCkuDQo+ID4NCj4gPiBGaXhlczogMWU0ZDU4
Y2Q3Zjg4ICgiZHJtL2JyaWRnZTogYWR2NzUzMzogQ3JlYXRlIGEgTUlQSSBEU0kgZGV2aWNlIikN
Cj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiBDaGFuZ2VzIGlu
IHY2Og0KPiA+ICAtIEZpeGVkIG1lbW9yeSBsZWFrIGJ5IGFkZGluZyBnb3RvIHN0YXR0ZW1lbnQg
aW4gZXJyb3IgcGF0aCBvZg0KPiA+ICAgIGFkdjc1MTFfaW5pdF9yZWd1bGF0b3JzKCkuDQo+ID4g
Q2hhbmdlcyBpbiB2NToNCj4gPiAgLSBVcGRhdGVkIGNvbW1pdCBkZXNjcmlwdGlvbi4NCj4gPiAg
LSByZXN0b3JlZCBob3N0X25vZGUgaW4gc3RydWN0IGFkdjc1MTEuDQo+ID4gIC0gRHJvcHBlZCBv
Zl9ub2RlX3B1dCgpIGluIGFkdjc1MzNfcGFyc2VfZHQoKSBhbmQgY2FsbGluZyBvZl9ub2RlX3B1
dCgpDQo+ID4gICAgaW4gZXJyb3IgcGF0aCBvZiBwcm9iZSgpIGFuZCBhbHNvIGluIHRoZSByZW1v
dmUoKS4NCj4gPiBDaGFuZ2VzIGluIHY0Og0KPiA+ICAtIFVwZGF0ZWQgY29tbWl0IGRlc2NyaXB0
aW9uLg0KPiA+ICAtIERyb3BwZWQgaG9zdF9ub2RlIGZyb20gc3RydWN0IGFkdjc1MTEgYW5kIGlu
c3RlYWQgdXNlZCBhIGxvY2FsIHBvaW50ZXINCj4gPiAgICBpbiBwcm9iZSgpLiBBbHNvIGZyZWVp
bmcgb2YgaG9zdF9ub2RlIHBvaW50ZXIgYWZ0ZXIgdXNlIGlzIGRvbmUgaW4NCj4gPiAgICBwcm9i
ZSgpLg0KPiA+IENoYW5nZXMgaW4gdjM6DQo+ID4gIC0gUmVwbGFjZSBfX2ZyZWUgY29uc3RydWN0
IHdpdGggcmVhZGFibGUgb2Zfbm9kZV9wdXQoKS4NCj4gPiBDaGFuZ2VzIGluIHYyOg0KPiA+ICAt
IEFkZGVkIHRoZSB0YWcgIkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnIiBpbiB0aGUgc2lnbi1v
ZmYgYXJlYS4NCj4gPiAgLSBEcm9wcGVkIEFyY2hpdCBUYW5lamEgaW52YWxpZCBNYWlsIGFkZHJl
c3MNCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFf
ZHJ2LmMgfCAxMiArKysrKysrKysrLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3
NTExL2Fkdjc1MzMuYyAgICAgfCAgMiAtLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jDQo+ID4gaW5kZXggZWI1OTE5YjM4MjYzLi5m
NTUyNWMxMmYwY2QgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3
NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1
MTEvYWR2NzUxMV9kcnYuYw0KPiA+IEBAIC0xMjQxLDggKzEyNDEsMTAgQEAgc3RhdGljIGludCBh
ZHY3NTExX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICppMmMpDQo+ID4gIAkJcmV0dXJuIHJldDsN
Cj4gPg0KPiA+ICAJcmV0ID0gYWR2NzUxMV9pbml0X3JlZ3VsYXRvcnMoYWR2NzUxMSk7DQo+ID4g
LQlpZiAocmV0KQ0KPiA+IC0JCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVk
IHRvIGluaXQgcmVndWxhdG9yc1xuIik7DQo+ID4gKwlpZiAocmV0KSB7DQo+ID4gKwkJZGV2X2Vy
cl9wcm9iZShkZXYsIHJldCwgImZhaWxlZCB0byBpbml0IHJlZ3VsYXRvcnNcbiIpOw0KPiA+ICsJ
CWdvdG8gZXJyX29mX25vZGVfcHV0Ow0KPiA+ICsJfQ0KPiA+DQo+ID4gIAkvKg0KPiA+ICAJICog
VGhlIHBvd2VyIGRvd24gR1BJTyBpcyBvcHRpb25hbC4gSWYgcHJlc2VudCwgdG9nZ2xlIGl0IGZy
b20NCj4gPiBhY3RpdmUgdG8gQEAgLTEzNjMsNiArMTM2NSw5IEBAIHN0YXRpYyBpbnQgYWR2NzUx
MV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjKQ0KPiA+ICAJaTJjX3VucmVnaXN0ZXJfZGV2
aWNlKGFkdjc1MTEtPmkyY19lZGlkKTsNCj4gPiAgdW5pbml0X3JlZ3VsYXRvcnM6DQo+ID4gIAlh
ZHY3NTExX3VuaW5pdF9yZWd1bGF0b3JzKGFkdjc1MTEpOw0KPiA+ICtlcnJfb2Zfbm9kZV9wdXQ6
DQo+ID4gKwlpZiAoYWR2NzUxMS0+aG9zdF9ub2RlKQ0KPiANCj4gSSBmb3Jnb3QgdG8gbWVudGlv
biB0aGF0IHlvdSBjYW4gZHJvcCB0aGUgY2hlY2sgaGVyZSwgYXMgb2Zfbm9kZV9wdXQoKSBpcyBh
IG5vLW9wIHdoZW4gY2FsbGVkIHdpdGggYQ0KPiBOVUxMIHBvaW50ZXIuIFNvcnJ5IGFib3V0IHRo
YXQuDQoNCkkgYWxzbyBtaXNzZWQgaXQuIFdpbGwgZml4IGl0IGluIG5leHQgdmVyc2lvbi4NCg0K
Q2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ICsJCW9mX25vZGVfcHV0KGFkdjc1MTEtPmhvc3Rfbm9k
ZSk7DQo+ID4NCj4gPiAgCXJldHVybiByZXQ7DQo+ID4gIH0NCj4gPiBAQCAtMTM3MSw2ICsxMzc2
LDkgQEAgc3RhdGljIHZvaWQgYWR2NzUxMV9yZW1vdmUoc3RydWN0IGkyY19jbGllbnQNCj4gPiAq
aTJjKSAgew0KPiA+ICAJc3RydWN0IGFkdjc1MTEgKmFkdjc1MTEgPSBpMmNfZ2V0X2NsaWVudGRh
dGEoaTJjKTsNCj4gPg0KPiA+ICsJaWYgKGFkdjc1MTEtPmhvc3Rfbm9kZSkNCj4gDQo+IFNhbWUg
aGVyZS4NCj4gDQo+IFdpdGggdGhpcyBhZGRyZXNzZWQsDQo+IA0KPiBSZXZpZXdlZC1ieTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+
DQo+IA0KPiA+ICsJCW9mX25vZGVfcHV0KGFkdjc1MTEtPmhvc3Rfbm9kZSk7DQo+ID4gKw0KPiA+
ICAJYWR2NzUxMV91bmluaXRfcmVndWxhdG9ycyhhZHY3NTExKTsNCj4gPg0KPiA+ICAJZHJtX2Jy
aWRnZV9yZW1vdmUoJmFkdjc1MTEtPmJyaWRnZSk7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTMzLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvYWR2NzUxMS9hZHY3NTMzLmMNCj4gPiBpbmRleCA0NDgxNDg5YWFmNWUuLjVmMTk1ZTkx
YjNlNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2
NzUzMy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MzMu
Yw0KPiA+IEBAIC0xODEsOCArMTgxLDYgQEAgaW50IGFkdjc1MzNfcGFyc2VfZHQoc3RydWN0IGRl
dmljZV9ub2RlICpucCwgc3RydWN0IGFkdjc1MTEgKmFkdikNCj4gPiAgCWlmICghYWR2LT5ob3N0
X25vZGUpDQo+ID4gIAkJcmV0dXJuIC1FTk9ERVY7DQo+ID4NCj4gPiAtCW9mX25vZGVfcHV0KGFk
di0+aG9zdF9ub2RlKTsNCj4gPiAtDQo+ID4gIAlhZHYtPnVzZV90aW1pbmdfZ2VuID0gIW9mX3By
b3BlcnR5X3JlYWRfYm9vbChucCwNCj4gPiAgCQkJCQkJImFkaSxkaXNhYmxlLXRpbWluZy1nZW5l
cmF0b3IiKTsNCj4gPg0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hh
cnQNCg==
