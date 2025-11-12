Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158EFC54C45
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 23:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9480910E7B4;
	Wed, 12 Nov 2025 22:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="B4UM0T5L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0A910E7B4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 22:59:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmaebjxoPm1Y0hZFMoPDxJt20SHfCR+aiYCyhsZ1DBQxRDsO+fB1JyxlCn8dfvcGrsSkIJXy3vtjH0iP1nVFFiqzSJIkVECLJR1tahoWdd3c6UW3BmaHiDrOGWbLgPJBAdbXx0nqrUaRo0V+SVOWz2g9JCDTt9P5LDbfsE0LTU02lJ/BnhpJDSpolVtjKA5iBXWIRfTI4I1D5mr5OzqWV/kfroA/XWl8p1neKREQ8R6p+X/E7VqhI+lhuvvJzNa7nRtu7FFxLFo7ROc37oQETlVJfxX1A0bnGuNuMXkueP4CtKkNpnUtaL40c7KeVHJpmvptjOnZnqSpJtpc+ua1qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDp00RICCxOYrkk3dlwnpehFTbnOIeC7RUaBHqPOH5A=;
 b=uJHkiSw0HlFXbRIsBgBvUdBLVE16k2W/DosyPChICQvGGqCeQG3rksYX+Hl9p7fmFQ7IDuqSSs7GMGu0Xb1bAaO1AFbbFvlEwFkw3TUKI405aVEB7eIGClf/avGErrWJTB2++/9p20magZRwoqfwukLAr17L8E7e46bOS5ugptUi/NxYFXLVfINCAzpZVP5ouJ8yA5CDyAtuCBAw8SvLxU2/TQGghLz3O0NGK3mxkfKtPtmxc4cTuCDa7aF8Ho3Nd73/FxnZCGZ7cEncOAykChrLkx2f/rYAHy8ATnTWNxjrzs0t0YEevt7DMxob1e83ZxjOEa+i3q/Ua3bPUF7Kwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDp00RICCxOYrkk3dlwnpehFTbnOIeC7RUaBHqPOH5A=;
 b=B4UM0T5LLf2Ix0NMIImz25kDxHvefRGKYIsLIEaTxY38SnibCe76wv5OzVMvVSULMNVH1tcJliNNYSjVUofN6yXh5MNRY6qXpbEAZRabB54vzjUQkTQTl0DeYWz/W+rbsM8Dt1AygRTGFwkzIusAtNlSUSxwqNdmfqBBTiQ5dVE=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by OS7PR01MB13618.jpnprd01.prod.outlook.com (2603:1096:604:35a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 12 Nov
 2025 22:59:10 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 22:59:05 +0000
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
Subject: RE: [PATCH v4 2/2] drm: renesas: rz-du: Set DSI divider based on
 target MIPI device
Thread-Topic: [PATCH v4 2/2] drm: renesas: rz-du: Set DSI divider based on
 target MIPI device
Thread-Index: AQHcTqM5iVihN/LniUyIRrmismQez7TudoYAgAE53yA=
Date: Wed, 12 Nov 2025 22:59:05 +0000
Message-ID: <OS3PR01MB8319F2E339AE6534C09C2A828ACCA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
 <20251105222530.979537-3-chris.brandt@renesas.com>
 <20251111230746.55a2851b6d9b07cecfcd6645@hugovil.com>
In-Reply-To: <20251111230746.55a2851b6d9b07cecfcd6645@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|OS7PR01MB13618:EE_
x-ms-office365-filtering-correlation-id: 41c74dae-2c28-4ecf-b7dc-08de223f144d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?KQzeyzGEvRxHDNZMqNQ2C8ThiuV3CWzObDQfKKAOLe9CwwemifZ/sfv6Xt9J?=
 =?us-ascii?Q?Y2czZc/rNmZPZy96PS5JKi0WbuOEOT57EzSyjskugPjJ8i7EHmSNg9UI0nlS?=
 =?us-ascii?Q?nQHZWqVsh5bNnm5dUvSLFDNFY/56bWqXIqpW0GlzxVS0IP86BQFJeWDZ/Rk1?=
 =?us-ascii?Q?Row6/keJLXHTLAY4QUWSvoKE6/xRODCctEsjgHZzdTWLLZQhUPJDBRIw54X3?=
 =?us-ascii?Q?azrif3eHqRXPCe0QwtCCkUKpn4qw7HMRmnCuobFot/qHdorZOWH6Ivc9ENWz?=
 =?us-ascii?Q?arYOU9ra0RKsfg5PgF/Koh6Vbg3DyMerpPOYBl3iWYAw39Y805PQRA7O63KX?=
 =?us-ascii?Q?D/XS9aygAxQc1mzLetN8ebC9zgagoF85QM8tHN60ci9dEcv1+nNvqujHBclN?=
 =?us-ascii?Q?K9i+ZoUDU8gOYrEzrDhoIxancbMAGBsi4LXkclZL7e1tG4M1zXKv95r2d8Ke?=
 =?us-ascii?Q?dRS/ujqqEf5XOhCtUtB4z+a+53pgyXZmqvyEqgfkN6RORahp5HqMsx2K6tuH?=
 =?us-ascii?Q?jQriAgESZ9DHqIN/7fuSWhWtXxMrOOAm+8ctQQTIIDzdcqZhG+NlLfm66UvS?=
 =?us-ascii?Q?aons1JifBakexTxwiQGrmYpddRXvxAsNJZXKoBWZPQVGxD4GLI/Kie2/Qw+a?=
 =?us-ascii?Q?Mr7vOWWo0auGU8yl3NLV1Yj7kwR7lBTA42ssecJlxBT+HnnLKcj2PCk1d+z2?=
 =?us-ascii?Q?EHkkIB0vqfmjdxgSze6LQRIWPkVNTdhdCCv2VAcKuOTJ6bEfDl4b28V1+j5X?=
 =?us-ascii?Q?0JJzNjB0VVduj5hbtX734Z85tbwFsya3R3opPBlssvgrs81Z2MBEbyvesDPl?=
 =?us-ascii?Q?M4wl0VW1/9588NIMYWsdvUrh761fJzTlpf0xnKqAZb39MggFkZsLmPXyW517?=
 =?us-ascii?Q?vZIhhH6NC6yi/+OLD6/ZPzbA4tjZW9njs6M9yuzGrGYyVyPKlu4ymRlDo1MK?=
 =?us-ascii?Q?LG3g/xx/98H8zZq1xfj19378hr7PrJiqg9M36/OZCXdCkVmW288bzj+SLErl?=
 =?us-ascii?Q?MhZg/NoqOxAT0NlK1vjnhlzbFg/6H3hlDr1bDzD38oohtFGHIpPspEr+iLLy?=
 =?us-ascii?Q?Z1Tj6dB8vWSO7UFHwrIx3wFTUeyTrM1ZYoV9tzyQEAWh7PhefqDKX1Z7VQIZ?=
 =?us-ascii?Q?1IJ3MEoJlNxkBjc2Ucdnbcqp5oJR2OmTmjglV6aNZQETf5edDAGKzS2C9AVz?=
 =?us-ascii?Q?y1lefKRdBkxeVSQ0FKuatOMtaB6Fd3ASdPlyTHpSqgFdb+e6/OiCoQ5C7DHZ?=
 =?us-ascii?Q?argTrWmMHeXXvJbOHALkxUx3OZ1dxaWsmmeJFxW2CLfaypDza0Wix3nHMJsM?=
 =?us-ascii?Q?BZKe0hKQufaj8m0LQ109i7Z3YYEikQVjFBXw+dg2C0qUJmeo2V7DM6CwORLx?=
 =?us-ascii?Q?4REYSaNK5lImVJGKNHE+lwnsfbNkmv7VCybzPNtyxeM3siiyepdhB+2A00c2?=
 =?us-ascii?Q?HxEz6j6fq8xbcpUVAYNIY4BQEaWZc1LG7DzM9L+tZm/oBotcc/fpAUFI+ZMz?=
 =?us-ascii?Q?jRoJam+JscL23oba9OuP17WSHPkDByuh0GvK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A5cBdUUb3SQiMUk9KM9k8vfud53LfiI1hFwtk5zHzZHum6DiTO1D1PO0QMkQ?=
 =?us-ascii?Q?b5u21wTrPQ3uT6dswdcFyp2UMJZnCrizaq4DXateGwRK7o1rFR8c0XFjuaSS?=
 =?us-ascii?Q?xHJe4eMC4aul7hhr/tu4EeRsr6oXCvfuUBfaIVqeXuL8lahyOaIAJAjoCbr8?=
 =?us-ascii?Q?+LWf/dznWEAcCa1ff6HcjQGf6RDBHJr819RhCnac/HpSalMA1FlS2TkhYdfK?=
 =?us-ascii?Q?eIYsGOLUmIIEF7z6BvHthSk3htncrYSZ8hcd31CCTLf5RkUhA20C2CoTmwKW?=
 =?us-ascii?Q?T9fJXUlxrSLsh9P00TvWAoK2MgAhOvxNniRTZmyRYvRw36mXBL9xOu0t6i3P?=
 =?us-ascii?Q?mEFgOse0NWRVbB82zhO3UkvV6oCMILi4ufRrCetTEG43V38xSyaZZDFaW3Lw?=
 =?us-ascii?Q?AwRbURMCxER/267YKbBxPvQgI06zWooguXkBT+KWDgSwBC6KXaCtLucUuXKo?=
 =?us-ascii?Q?lri+9jA4DzXRVJM9mva3gCSLrxNao6EuJavxAPklSWfNtR5tMG9igiBJFPEm?=
 =?us-ascii?Q?mvQLCTBtTUcdK1hy1Onh2zyPKOAmSXHE5nHPiG1b+0sn87bFt9niFVutYVeF?=
 =?us-ascii?Q?5T5I3AS9HWwg1I9rvAnJNrmJ++xYGJi2ae/kxgi0PT7bY0khbt/D2ykpPN/7?=
 =?us-ascii?Q?ST0Fy0ov/EUuRGSs3x3geptYxYrpXauhnK+umApigMx15EDH5OYBAMoA39H7?=
 =?us-ascii?Q?dJ8AdHn9qldUSLWNAerRFRj9kbaOKQ33S/hxYGaEv/UGR0iJVWwcioRHeMGN?=
 =?us-ascii?Q?5BY3yqHjw68qdVoCl7kvHHSZdqtrW/1vVDRqY47Mjn8sJlyoQMGFsqhosDVJ?=
 =?us-ascii?Q?jpAMuXZ5RVuRl+YwHARhGvrRVuWRzAxlFDZBcThWipKzMyO2c/gBntnpNEph?=
 =?us-ascii?Q?Tnj+nx6yYLuZmJN+NIlykUOVin1oX7NpNszMPJcxUtA1mx7O4vVZi26Enl5F?=
 =?us-ascii?Q?cVmJWFoiil6MM/P9s43TRTnspDORdFeIXW7GMLuf05Lawe+l7sOR50bXqsxj?=
 =?us-ascii?Q?kOKlSW1KDa+nybDqjXsBdY3pHKuE3u+Hufck9peF0VKsbagFD1g5eGIQHON5?=
 =?us-ascii?Q?TI2RuNLpMUWj7r/bzFunr33HhQL1GN4Lsn50j5PrCuxMWkTl+4jGAgdbs24B?=
 =?us-ascii?Q?YGn04tko1VtowBYSZQ71fyfqhjdEX4rjlew07JJsBfQjrL0d8eQUkicoWW4O?=
 =?us-ascii?Q?RkD8Vtu5j+A1nM3GJBjXMHfPHC5NoOKIxg6FT1Iubn47LfSPckiSFbYGmyfy?=
 =?us-ascii?Q?RUdcPxgzUUar4ojniUlnkZjxac5ke7/rOTsF1ThFE/EBywS5HAXFyx/3vMxt?=
 =?us-ascii?Q?mqUpB14oJqWyN3Jg/n46Cfu4abrZiBHBu6vNmWh7ffgqi9G1zkha7TzwrBhJ?=
 =?us-ascii?Q?nm5J0vgslyisE3kJRvts99IKMNccomXE2spCdey0n1zmDVxCbYpmxbHTLHll?=
 =?us-ascii?Q?F7+eH4VfqsbAU/tGbBfXE1fLhdacXoWj2wOdGsp82osY/odIFzqPM7s6XC6b?=
 =?us-ascii?Q?CnPzS/ACR4G2hZ04jcRZRTgTQWk6+yUzzQEjoTihqT5CIsx2KHUWwhoBDuOd?=
 =?us-ascii?Q?apxFbZPdmQim6z3gN4S3ep7C3vYmoNvkAdsPKGEQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c74dae-2c28-4ecf-b7dc-08de223f144d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 22:59:05.1520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: umtKPATs02/Vigdmj2/+iVXOcxeuojIbi2ZDPA/4eXb0ubJXndU9e4vX7KkhkOX05wfaJuWF2r/BLooCpT2qf4HK5kOJLkwQAtgHrudG7Tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13618
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

Thank you for the review.

On Tue, Nov 11, 2025 11:08 PM, Hugo Villeneuve wrote:
> for consitency with other commits on this file, change your patch title:
>
>     drm: renesas: rz-du: Set DSI divider based on...
>
> to
>
>    drm: renesas: rz-du: mipi_dsi: Set DSI divider based on...

Done.


> By using an intermediate bpp variable, you can avoid a useless second cal=
l to mipi_dsi_pixel_format_to_bpp():

Done.


Cheers
Chris
