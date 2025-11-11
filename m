Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E5DC4F4EB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 18:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D24B10E630;
	Tue, 11 Nov 2025 17:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="oUsfT4Af";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010055.outbound.protection.outlook.com [52.101.228.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E4410E630
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 17:48:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvB64nKhZunyj5T4TYw1q1KcGORqkmR2Q5s6YuXgeGbUN9cC6MlmLxmcdAwbAozHLokpab7p/tE+LGWYnwYEIFJt3pzOrbENkYSN/0puilhdJY2U4N4HgZZPv1rqN1gx/P1JDluxl8g+YWOeUIAQAPIFeFFByL9UltgAXGMltwoYTAEs1t1+zC1E6Q05xaTKJdk7dgGr5sFzzDfNo25kSsBTc68U/CaaVuuXbm4/GWWk9/BNFDXSn/QMqQsrea59C59iNBZR0ubLl4vpWSiFF99SHC7EkyEKxCevipUlQrnNqKFJc3EKF0XttTJYL1H285ugWAidXDQfnKSghzCtQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJ93Zc882msbIgJOr1JIIOpg7Kh5nWIgRSocTSiCMUw=;
 b=LzqgZ7HLJ+dejUNsgXZrL8tcJIjbUSLzfVKDrkFqCXP2YBK9s7tNC7rNE5RDYbVwZOv75n4p09PPV3u52Sg9BAHabC+LqWDtpc+qId5YJ1aLAtEHlDtxFpvk89uGJPIM9jYwUBqRwrI8bAJGRWXvpDh4gDicVTAbtXXYq4JkNikaevpDkVNtRsSInyjZPip3iFOCapdojTtm1GNEMUwCbHRPDFhdbYsvB7tEUgomlR5WD4yHNfE95z/3//yiUEj2oBcRAaq90Yw46QfNYhc9t56+1w7BGnVSOwCjxU1q8zmk70BbCsKJMaXcC9johA491R9vCOsD2jJchtPZIY5MHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJ93Zc882msbIgJOr1JIIOpg7Kh5nWIgRSocTSiCMUw=;
 b=oUsfT4Af746Y/SPM72gPJr70FMy1qgx81ET0hD0nPJ88IcbvPP67xhl2KbI3sVZ9secIhH+fmGQ3YMOESej2EqU94uieDU2K+/HIFdHqz88kxmy+5T3SylcQ2fa0nThKt9LcPN3kA6jBIVx1NHBjLsOIOdeqrmZNbVjr0iE3nCc=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TY7PR01MB14553.jpnprd01.prod.outlook.com (2603:1096:405:23f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 17:48:54 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 17:48:53 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4 0/2] Remove hard coded values for MIPI-DSI
Thread-Topic: [PATCH v4 0/2] Remove hard coded values for MIPI-DSI
Thread-Index: AQHcTqMq7HmTg5AWsEKO+ner0HLbLrTtvHUAgAAMAXA=
Date: Tue, 11 Nov 2025 17:48:53 +0000
Message-ID: <OS3PR01MB8319C8A2BD72FC7787ACFEFA8ACFA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
 <20251111120148.943a0e193a65469a53a0cbc8@hugovil.com>
In-Reply-To: <20251111120148.943a0e193a65469a53a0cbc8@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TY7PR01MB14553:EE_
x-ms-office365-filtering-correlation-id: 331dd724-d8e3-49ea-3c13-08de214a94b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?//WYPVfBEDnVS9y3y6Ly8YHCC3IGrfpegDBXO56kv/z7Yf9ADrA6rbiiVYU9?=
 =?us-ascii?Q?+WM9y2F6xAAfbfmcM5QDdo6kRpwSYFjwU83t2BlNdMDta9mNvics2s1IpMrY?=
 =?us-ascii?Q?G96fZabGSygHwkHwumnOutWfzy93670kIFSVSqS7ME1ghxJayxh9e6b23jfo?=
 =?us-ascii?Q?TeEiHReYm/koSFfMecvq9QlIOJMK+6AVxZQtroCUAkj3ogRyA346n2nnrpdY?=
 =?us-ascii?Q?CpnLW6O+kzCdg6davQnyn2oajjHrt5TY2nHMdF7NE6kn5ZJS5OxERGrIzIc2?=
 =?us-ascii?Q?+5XWBWBQRA1nQ25EvdftbzbWIvXtsaH5j6CI6Z7ijpRMjtY41P09nlCckiRu?=
 =?us-ascii?Q?XlFiSo4T4mJtxpQqF12txvMfdMBzjBtHztB77Sb/wOhOhCDThKw3m4I2rCdB?=
 =?us-ascii?Q?Tx72mC9EkOSKSxLrVxFH7dbPVqh4iOKzGjAwcDnPtCdMKNaE+aC+zDVH1Bga?=
 =?us-ascii?Q?LcTHHNqMEUZNBV2edIAK1ogiUR3JTAOIcjFVfxpSI7zNK751MUHYirQASztO?=
 =?us-ascii?Q?rpIeCvvgyRR7aSlcigMdHsNGgtlpkVnDcY0cgxrWfH/mzNCUqG1fJWD29vWK?=
 =?us-ascii?Q?o5wp/OEmfwjiiRUz+E6EnRBW99QAx4oUQJFPi/jhokXLk/vXeZP6/5C44vaG?=
 =?us-ascii?Q?c0DtWgDnisC8oJxVNib2cBd+UlwgmU8kojG2NBMfxhVTSEnnh2e0enx7DODN?=
 =?us-ascii?Q?u1Z9G0g29utxLpPCQB6KNQrIorwFqY01BpeRxD9PvcM3cO/3VjZzdLKnsr1u?=
 =?us-ascii?Q?G4VmKh9jfMKTFLv2xdQkUymfHZF8t1UNGxFZz5G0T1QJ43/kZ43nZ8xUfS5X?=
 =?us-ascii?Q?GeTdd9mV4owuq6PF+wYphYBslkIY3Eod6hHG3dIWtn7MCgpn0HGhQkqTLFG3?=
 =?us-ascii?Q?uqsE9ZuCRqKo5OVrRB289/uwTn56bKPkFLHJbsUHX+0O4wNgAxvW+ymw0cWT?=
 =?us-ascii?Q?yjqfsZbAVVbqC7woWSyyI/1ByYnxrWX5D9ut998hLj1tXig3kxxnUM86wOOU?=
 =?us-ascii?Q?bCl6IzBrQJnjwnGjgk/3YoLSay0BzDcl/oVCtEfCGWVWFtESKnOs5Gt1I/PZ?=
 =?us-ascii?Q?a7nr2bcTR2Y1gqPGeU/GKIIekTMWN3avr/i7bm1NbWmZfz+bD4ACzdtMUEbI?=
 =?us-ascii?Q?x5wDFOU7mDHkTanWH29Ec/nLA0RBKTDRMvk+EPNvhvsZusPWKFeqXRWiPcnJ?=
 =?us-ascii?Q?DsFH33Vu+pzKG3F/7Qw3cDneqyfgEhD+bzs5e/3epebKNAMfOdTDz6ksOuXj?=
 =?us-ascii?Q?R1hnhk4MSpJPpoMRjy+uXSx1adPYFL+y/vZO4ZqoJX3JAdhEe5szNC7V6k2+?=
 =?us-ascii?Q?z3z6Ys2tlbmspPFcYR391WUhUTARCnUfNJ1NtExoM0HMi0HFzHNoZ12EnHP0?=
 =?us-ascii?Q?Oog9SzOf1kyGz+MfPix8aMnDBAaoDiKbbZ9MMcjCPbSJIl1O2KJju8/5SxQO?=
 =?us-ascii?Q?CS2+5dhkkeBAcjPCCAUkRNrQgKGggoZ3Qrag6mzKyoQVRZh32LMxxlIbmhFb?=
 =?us-ascii?Q?NwEWyDNn126T+Ux+69TmJB+RERa+G/PlJ8kT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rR8bwJTHGswBwSDYqUjfuBPjzp07XOZd4W//mDZljnp3XNXjkEBNhUJ+cg/P?=
 =?us-ascii?Q?LG5MnMsGwiFPcKiqfTQQ2ijMWumrQERQW+udHu7K/ea6lX6CvDmbxEobGZcq?=
 =?us-ascii?Q?+hc/I7FtWChM9Th1fvLOHdDTwYMkHmppY2uuHmAAYddZJbXwEOHWR84v2gkC?=
 =?us-ascii?Q?Dery17/KRvouU/XVUdRSYd0SO7CU9Pi1HHoEgedOy2gIRoTx7C86RYUhG7m2?=
 =?us-ascii?Q?F4+7rxyrJYVkh2cUoQX6cX6h3iENtNGRkJJwSvLhr+Dzj6HTvtA4iMbAwL4v?=
 =?us-ascii?Q?yP1q4CXrOVLqM4wstOvx8R9LeugefnesoIQVgvKsr1ZOu3mjmvZNkWkFWN0T?=
 =?us-ascii?Q?mjQR2C7HALWGyJvf7W9ynhi3bvn0tN/KT0oJd7g7Ri8HVtMe0wJRQ5zAXSZ1?=
 =?us-ascii?Q?yPpOl8xlToA/K6dJF6UbO8goRK38K/IMxKqr69Kzf/1nXSpBM11XATdWmotS?=
 =?us-ascii?Q?6ryYvk6yxkYY0rzwpcpdYEmxwnK/8GuAAHPyBptY4feivJBSuhaOkMLY9BXG?=
 =?us-ascii?Q?V9GPGrdf5OH88GwMfjQWy3fgOmgc6v9yBXIqEyglBaTV92h8UTuTrJZgWJs7?=
 =?us-ascii?Q?8v9YlDUpRLBFzPU5wREh8/f045bWBEPhOH7GK62GIjOq9Hmv095/Q/EVDB31?=
 =?us-ascii?Q?PfO5jw6ZYe86ZJnlWHmDwdBhiaOged5fxN3ClICfSHooN/fUrS80Fe4am7vZ?=
 =?us-ascii?Q?+Rm/VNy7uZR+ABUgAQUtLhXsPvQKJnf+fApXstCrw9eqG0kq2PeAeqjVmkgW?=
 =?us-ascii?Q?htvAQoAjo+wx1xSpX9QPX0HyAnU6SncnCsQwgFJeQs6ejmTvYwZII0imfCQZ?=
 =?us-ascii?Q?KOPbdQ+s8KSsHUGH5FkCQMSXh0hX0UKzbgBJ07gWExXyoWgqTu9Wx929Qsbr?=
 =?us-ascii?Q?V+xKVD9qvCHhaH/iljjytJIuAl/8R2z3UujA/dce9Q8SxZDMtwXWcGmpwX/6?=
 =?us-ascii?Q?gf1juCRd8Cg91ksrpov+GvSoT3Cg1Hi0yosUmpum5P8gM/8b7ouHnlaFUXWQ?=
 =?us-ascii?Q?bgoLroOMmldgB4W9L06vv8M1p6vjduJZqQ3TgCujBiqsePx+4qlNRz1Cetc5?=
 =?us-ascii?Q?megZcdqfUiNMS2aOefYQN7N3olTrPNsMtPi5v9hxmY54yNwua2fplcZdvMot?=
 =?us-ascii?Q?sha4ewOhEwCmJAyM4wyPVm6Y4THnVfzLNTEf/gs4d+Ux7nfY3rhdEf+RIXRa?=
 =?us-ascii?Q?LMtOUOS0/wVLSwXUHSzQU7QEpDVOuVKp5ewYHM0OeiwahRYiBjABdZxdlaHg?=
 =?us-ascii?Q?JCKb9558mtLXmBHikCA7qenpviOGNnwgQ0P9dberX1TkVAuuSUne+UrUaakh?=
 =?us-ascii?Q?V4/UrkLfUiEh0oIXRTkBIZMYvlbNOuyCThjmGBgWRgSOOCf6tawl0gyK2E7b?=
 =?us-ascii?Q?M5vmOiZm802CQwR8COYv2DTdegknZrDJdKCDLxmJKR4WoaTulNdzsgRDFCZK?=
 =?us-ascii?Q?YjHvN6B3OA7gWKI2VUsVsCJSv5OmbP9CSbJavDYZio8ePOvFWNQpPXseIW2N?=
 =?us-ascii?Q?erfj+u72X5IbF+dF2D2kNy0xmrtwYrYKHpH9YmC4M5k08s93dNDeXVf3fGaG?=
 =?us-ascii?Q?l//keCyMQ2QkqrJkcc1ZMkW/O+h/L0GAAfgRz+1z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331dd724-d8e3-49ea-3c13-08de214a94b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 17:48:53.9271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S2P27++2qUGb/xjREmnuaLaLdSXUC9qoMXA5JsjQMehCCMFAKxhskv2K3yDny1XpciXrfnv29nSy+deVO4/T77o2oUZxVf3YZkc149tGy6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14553
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

Hi Hugo,

Thank you for testing.

On Tue, Nov 11, 2025 12:02 PM, Hugo Villeneuve wrote:
> I just tested your patchset on kernel 6.17.7, and my display no longer wo=
rks.
>
> Also tested on torvalds/master tree commit 4427259cc7f7, with similar
> results:
>
>     rzg2l-cpg 11010000.clock-controller: hsclk out of range

I'm pretty sure you are using 4 lanes, and a 24-bit panel, but what is the =
vclk of your display?

I want to check out the math.

Thank you,
Chris

