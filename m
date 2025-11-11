Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E14EC4F9FB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 20:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9D710E15C;
	Tue, 11 Nov 2025 19:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="ZsptZrvr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010022.outbound.protection.outlook.com [52.101.228.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11D710E15C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 19:39:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpfTVontF3e8gqK052l2NU5obkVw0mK55HLo6faadO2Jd5q4JSCumzN8aHq24qf6XZTNhh+EJdeKevVefK0G30iWyLtqbztbkM4UuxpJQeh+jjSV97oUpfPqlkhOeocyyiZ3UpFMDFqm5amcZ0WfM6suk6oiw9miBE/b3JGX8rWlcuaGxebfokuHilfMO+6aqBMxXNXqV+PmSoJV/8JPs3LrRJCZGpID6q/npg/PJDBOpDqXNt9XmeLRB68SxXaRHafH4965VQ9GjaCTMXyTDnDba0qpFVsequ7zCdBqUKpdImwaxqAimNP8XqhnSDGQonfgBTpYYMARkYgwlzoleA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZ1g6dqsPMUtc8o0iucbJMu24o4R+ABmM2Fp6HSBy/E=;
 b=LotE780tNM9MHkMWhI1fskbtBHwUHON6aWQDwMfREILztt5FpjNWRH0aRJb58qvNguflxDlIn1LyZQeFFyiBS7ENF/l6yv+OFiwSDnM9nrFJtP2QrmhZlAeuXCh/bzFi1quZux323HAmfgd+snTIEgijqJpA1UMwQB799cCpkgUFiR+sRFQUefcugacEFOj5uwD6OLaXpYHGX79TFX/mLd+ln9tI8kKMOcPDPIL0DTalp60eIc0h/xR/Hcm3O3EMhSj8VpYumO43d6Gf961ayGfNG+eMcUrU59FaXKn8TjftYiiQnDZv706eHr/afb2xKFtU19aB0BGu3kdqxgf4bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZ1g6dqsPMUtc8o0iucbJMu24o4R+ABmM2Fp6HSBy/E=;
 b=ZsptZrvrGAZtbUwRIwxvjlIjtMYyCAHNb4/CDoIbGoReKBCFIbI+dnfKTxKvAZbDGhZ840hO1+LnVpMHC4Qy8F4PeTxoWjs2AHE//+8qjDRDI8XR8kxST513hbLnLmmi0mccOY51JHK+xDPK+cwa1OlvUkxpS/ALzU6tYVxkF48=
Received: from TYCPR01MB8327.jpnprd01.prod.outlook.com (2603:1096:400:15c::5)
 by OS9PR01MB14168.jpnprd01.prod.outlook.com (2603:1096:604:361::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Tue, 11 Nov
 2025 19:39:30 +0000
Received: from TYCPR01MB8327.jpnprd01.prod.outlook.com
 ([fe80::483a:c2dc:6c8a:420a]) by TYCPR01MB8327.jpnprd01.prod.outlook.com
 ([fe80::483a:c2dc:6c8a:420a%5]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 19:39:26 +0000
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
Thread-Index: AQHcTqMq7HmTg5AWsEKO+ner0HLbLrTtvHUAgAAMAXCAAAqeAIAAFFSg
Date: Tue, 11 Nov 2025 19:39:25 +0000
Message-ID: <TYCPR01MB83273CEE6D5B665179456A2A8ACFA@TYCPR01MB8327.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
 <20251111120148.943a0e193a65469a53a0cbc8@hugovil.com>
 <OS3PR01MB8319C8A2BD72FC7787ACFEFA8ACFA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <20251111132246.eef0faf1177691a07a1df47e@hugovil.com>
In-Reply-To: <20251111132246.eef0faf1177691a07a1df47e@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB8327:EE_|OS9PR01MB14168:EE_
x-ms-office365-filtering-correlation-id: da1e0d1e-9bfe-4a2a-fd67-08de215a05b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?hNx6u6lSFpR3U/wjtrYDe5tkrA7fWn23c2EL+sEKSEt4DLYc06t1ytmh/Z+0?=
 =?us-ascii?Q?rZbaRxI1tXBAr24nyfYAwTemNMyf6zUwLaHHX44c4ODS9ia2FXhAv1OItbVF?=
 =?us-ascii?Q?N220jzgeTbBSEbqa0d8n2h4CIQSCls7foGsSM9f1WX2XdMSu4fZdoXB9qt/X?=
 =?us-ascii?Q?/ilkeqXM76N9nv7Q1zrK1TnQiIcuI9aTnYmzAr40plzJPL338AtD+pXmWawy?=
 =?us-ascii?Q?+8i1wnhO+47wSmGjdzVbmzF/slZpYZvDZWiwkqDSDwY5BJtmZ9vYPeP+DCcU?=
 =?us-ascii?Q?xvzHfWxqzAIDpjILywDNAv3J40ceqK2olb4vUWfqyIaqh4q+OAjIXv8dsTve?=
 =?us-ascii?Q?Ak0wuE92Og6hBVsdhbVnZXou28uEZ5ubjmpO7gr816LBfejdeVFsvJvT7HoU?=
 =?us-ascii?Q?x1KS4K8dH9yp8KryYrnSNmggf8fUeFgAumsp4/9rPGYtz/lsE//hIIpTpdEL?=
 =?us-ascii?Q?EoFnIlYdC108SHrAezjFdVJz3JPmmEtEeHG1xnUrQoBpHo73WP9VXa97pI0q?=
 =?us-ascii?Q?TF47+KD6K/u65SbV5tBgHoURUeKZcd26jhLi8qIdzORwQKfeqSvSBG2k58IF?=
 =?us-ascii?Q?ve8agnLf+wvHNjT4vNCBLzO83v6lqk4v0/hv/JGV4Mwlbk2b6o+h4gnQU9lW?=
 =?us-ascii?Q?/9hjD/3kmgzQmUoTpoR6W5VCIfYKfxHLj87u9WmaI7i74iDgGubZUyyZv+Rd?=
 =?us-ascii?Q?s4QYEUUZanycwKtoCrjWGyTU2gVaX4IKeTUY3OWJ3TsfkkmASrueETTPuWmk?=
 =?us-ascii?Q?DxbnQ7Y0sF19KlIB+Lj3AVCJjcO2GL6RxRihaswCvonjzd31dF4JyPtbgCpc?=
 =?us-ascii?Q?e3u+Ez0WAcO/TSkfl0A6+4PUDHCO4CFqKNtDbWwMVGbd8S3gxK3kW4iNNnZ9?=
 =?us-ascii?Q?VCeHsICP5UpO3oI5wDujAAyiee6vTsLn9iDjGR79JCC2SIbpD6bhSftGklSp?=
 =?us-ascii?Q?zyqoR+V9cdsKlS4wRzfG54kQReQ14PNzlHeyGztuIluq26ulZtVoKSqQ5/K6?=
 =?us-ascii?Q?lceyL95FtbUIVIb5CLG/cdMS4NulVzJFXE8NYhPfTlHXAcWW34GKt/XPcMk8?=
 =?us-ascii?Q?xBiSP+jZ0WkpUisTBryASl0QwmBKvZiy+8WouS7g72O3sUoOg1D7Ao/EwCbL?=
 =?us-ascii?Q?QyDMAuH2E+lVvbnHBX19lZfyoj1ktrbul29of+02ora7kOoR9SSa6HDMpv1e?=
 =?us-ascii?Q?8pQ4zo48VBdm4ZDrBZV0INt4SuEzGP3mWutSTI5/9IIMn8F/0EFUWDBC2dD3?=
 =?us-ascii?Q?ZPlkR4JoNdwBzhh+5Fc4Rlt/7LUoF6sOh8fiOREie+bJzss5OPcBNOMyZ5aM?=
 =?us-ascii?Q?M/XCyTALE7JlYCtBm3zE/yCkJWOMvO6PqqVFs8kjbxZDr6d9WS7ydkngG6BG?=
 =?us-ascii?Q?SmIJYj/mtI8j5TvPWqjF5LgrftY1vyNIOh1Vm6jYn0WSbTtg+bQDnmsXdrgW?=
 =?us-ascii?Q?RgjFOCT5oNoNMLw37Vmk9idit4t3DnNBgTrOIpbL6RZ4OKx1/taepUzYnGDj?=
 =?us-ascii?Q?zKMagXusewyTp+YUnz7mO5DxbLSe+u/uAukB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB8327.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LdIpPHzMzSJ9GXN9FQ5o2pznQqIVSM4qPUBs1ltp05sOugzGhNGTiQWuu7od?=
 =?us-ascii?Q?FIYS4UQLMLlBpRex0smFJpbgfKqVsFpiOhZ2+Ul92r/IvrLbwd1qWGqu0NBw?=
 =?us-ascii?Q?BEo/9tD+ny5lMY4gzsJpcAARz+BgNVN+cxyqUygPw/aT5pqURVzFXvFRSNBw?=
 =?us-ascii?Q?bPb3CDPIy2vS8JzC+NAU4Nb8Q9eqdj2DpBjh9fTLwFlEjmAggTjWf9sWEu2D?=
 =?us-ascii?Q?nfGXoLxaxVtOe9W3G6TnrGFIxsItWtMLFLJVbOniXS84c2GZYHTnlojjKLvT?=
 =?us-ascii?Q?HZkTnww3kK+tzRkj60wzTSNyA2r0Z/N19GjgVJ2U3eiz5UjMmMqW3xQzCM3p?=
 =?us-ascii?Q?rsjXgQN+YIfAlbfOghDzncpGjkpmoye8+P95J+K4AGMipWZeTKW/VQhlXzNf?=
 =?us-ascii?Q?eKQ5H/9Xw8XvHH3Z9j3nkM1z0rcT1d4SdcjJqlHDiLrS05m/oWsT+gQxrNR6?=
 =?us-ascii?Q?McLoFJCyDRsQ1zTSp5JtWo2s6RDufT4w3lgQfrJMWp/ZbQrgzZTPV9hI1KY7?=
 =?us-ascii?Q?9qvwvL1Rr2MQKwSK3Ljym+9zUqGMkLiRKdGNy5BpeqgzIRSx+yGzscYhl2sX?=
 =?us-ascii?Q?CI0rY7prlpP9LYctMvjoOCGrUFVLsqUzf36moUQ86+BfqB+iyoZGEHF2pHe/?=
 =?us-ascii?Q?jLVxCD5vxY/QGglh4xVKWbDvJMtdLbuoPyFu5dR6MxMK5N50gQNLpaRRlup6?=
 =?us-ascii?Q?9yUs5wwvvxFNgYlespPItMgz9e6KpV5XACMIUd2YWo62fLEzeMKMZnMeIjqD?=
 =?us-ascii?Q?o8A3pFUQ64VAKZt5BIY2QlomVvnWOaIYY+0A5YfzKTTQkXOjCOpq3YJzQRzX?=
 =?us-ascii?Q?N3wrUWqtMmQ1TguiuIlhBfXEvWtEubCotUFEEdZrvtfPHkttwK1cKnROcMyr?=
 =?us-ascii?Q?svyuP8GgPSoMv7UUpDi4Gydi3yQI6NWBhHrVz2gDB69+iQd6B35lLLWx96NB?=
 =?us-ascii?Q?XjrlmumV7qvKzztJeIWEVKuenLd2aSw/S1Szzo0Hx9116mTKtaVfY9wbK7hr?=
 =?us-ascii?Q?pT1ns2JkjFGwc76mdDtjrMaBpFJOD0ETEcKyr8m7jzVzwPyJfWeicIYy0zai?=
 =?us-ascii?Q?jjPv9wwSPZWP+wqVvhCvOL3PjsNrqETS67QV45da2gOic4mt2ZYsx1wYcTOQ?=
 =?us-ascii?Q?WHmSvulBR8z29Jbf5ZrenxsWACJEcfSSuDLunwKWMmFZNbyDPOEnXiidcC1K?=
 =?us-ascii?Q?tzOSkDumqyQKh2nE40+l7BrkCnSqk86FpMMxAcrvzNA4pJnF1CI+JaARja6d?=
 =?us-ascii?Q?4ifWHSZGlNjYsfLsVzS3fed5Pb3Bafwedb0a0Oy/pVjQGsKsYVEkr96U4QK1?=
 =?us-ascii?Q?zDulZpaSMKGsoCK7B9Eo1cFKyjRaRyESYCEhEk1WioUOOybZ9Fd/G6wNjSkb?=
 =?us-ascii?Q?TpRHf8aZJgLm36qO5/MW7Q3SlTFOYABi4ZSmWpIoKvwK61cLw4c895hhOEn4?=
 =?us-ascii?Q?gLXwF1xaW/YvvWBlwhaqiN9citnYQSwWIIp3hOB8FsB4gVjGNp6lk1CDmpOh?=
 =?us-ascii?Q?kyx5YBfrrfDn3hahLWjWL2zDsgKoM2nl251hd9J5NOl6J6s5sOx0whmmzMvA?=
 =?us-ascii?Q?rqrIVHZwUdOUFERK81CZ4NQFEtmd0WjmKxeDFevF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8327.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da1e0d1e-9bfe-4a2a-fd67-08de215a05b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 19:39:25.9509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bZlF/y7J2IItPJ2NO5+7iOFEFCm3Qw+EwC5ZbDFrFlvpdkxk0S2FHzmm3Kf1UZ0i0m2Mbn9Ja4uhv/01rx1K9nC+zLc8wVQvWwXikoG9fM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14168
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

On Tue, Nov 11, 2025 1:23 PM, Hugo Villeneuve wrote:
> I still don't know on which tree you based your patchset, just to be sure=
 that I am not missing anything.
>
> Should it work on 6.17.7 stable tree or torvalds/master tree?

I am using=20
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git

I have been testing with v6-18-rc2   (I have not pulled in the latest yet)

Chris

