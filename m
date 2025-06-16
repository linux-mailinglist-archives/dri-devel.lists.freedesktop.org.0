Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6768ADADD1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 12:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C50810E32C;
	Mon, 16 Jun 2025 10:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oh3qk3B9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1102510E32C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 10:54:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3zQnzMYzH2a8JsQbNeO/VdC0wWVxeMOfNRhLIEKsj5SxehJarUbTy+jDCQ77pbQ4mEH3UxQBnrRMGC9qYNdYAE9j4le4A/jHXBPO4/ojWuSST65/F+v/QRnVoaPZSYdN5cOWZNtFXNgcNCoCs9brp8jE6t+L40bRz8+RwYmPZfcNmd6SWs7G2vYmnttL2abTndt7MXg4awfLYWWS31l6L10XKK70rDa62JAKMqx+s8wx/H0brSDKQcFA/098uFQlKzC4ZSTnj5uRiFVk7xMr/uKlt7xNwQzmm0zEx9Y2pU5OmittJ80ANv2fZDxCU389566Rz/3KPHPFmYapuDmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EirEHA9ZE5htjCeNpYzh11AjMPf9eji4WoeuTA/zzW4=;
 b=U5V01ayBOduHQO3zaX/p2I+bN44Z4Vz2vPaBPGjNB44/8m+yUbeIVPsuQhB6YrULYTb4SPcJmljU4TG0C8VMDjx1Yml4jTAAqgxE6eEgIu452jaRHVEs6K9drpH1R8QEAWrNMpTojkz43hMH0cN33DHU96I9PsgQrs90mYJMl58HMT1Ods+GNCfMqaqEQii6arYg0hFq7ujBTIBZlq1rBWcRrlx+J/uv/FLLuMYY/aK0whtEWzLpbLsm8jRftrUPQrGFmKHsSP1w641lLhb/a7eXRqfSKlEsD8FMvbGgL3Ypf7w/vFdy+Nv4Vi8p+kxh9m/SuYHo4LO5ZRXvfm2R/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EirEHA9ZE5htjCeNpYzh11AjMPf9eji4WoeuTA/zzW4=;
 b=oh3qk3B9ERbmgd1FfQ0oy+Q826k3pASd/D08LvjOAovEzjkgzG63f5rYKElI4Xq0/gywNcZXIlvks9zJGhP8uaLP6AHFU1aTq3uoWkHQ2cPJjNq8lUgONkPrppOfDlsQid+vZKImd8bcj8c7yaSaF90gK07ui00ziaH+8SkAYdQ=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TY4PR01MB12700.jpnprd01.prod.outlook.com (2603:1096:405:1e2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 10:54:45 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 10:54:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Magnus
 Damm <magnus.damm@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v6 4/4] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
Thread-Topic: [PATCH v6 4/4] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
Thread-Index: AQHb0YbxoLXThBVJyEq0KQgkc6A6OrQAr/1QgAUFOYCAAABy8A==
Date: Mon, 16 Jun 2025 10:54:45 +0000
Message-ID: <TYCPR01MB11332F40696148C7216866D3B8670A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530171841.423274-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346A62FDF84C5F2C1240BBF8677A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sZfTgOENXfR2NnykgjGHd+2-vS9Jk-dNLWTVQyAGbQTw@mail.gmail.com>
In-Reply-To: <CA+V-a8sZfTgOENXfR2NnykgjGHd+2-vS9Jk-dNLWTVQyAGbQTw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TY4PR01MB12700:EE_
x-ms-office365-filtering-correlation-id: b1a02ebe-148e-463f-ad54-08ddacc4347a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?N25iVHBPMGJVUnFrdGhoczRjT3F1KzZwK3pUM0FhVzFXNSs0K0lKQWs1d3FW?=
 =?utf-8?B?RHdzWnRtUmkvSlhjSzM5ZXVQRHhndE9YQTBSa251NnZtSHZEZ3RzTytqSmM3?=
 =?utf-8?B?YVA4Y1R5N2hEMkZYZUJnOFRJYVhxUDZaNlMxd2xjTnVBWm5sQmU4Q1dvamZ1?=
 =?utf-8?B?N1FvN3dBcmpxa0FNeENNeG5NQm9sZDMySU40Z3czRStMU1ZOdk44UGRFRVJG?=
 =?utf-8?B?UVp4NEtMc0pDNlF0MnI4OTBaaCtzbzBhOXZURXJQdkVaMFZ4NFZCeHB0QTdV?=
 =?utf-8?B?eStkOURMTW1aMHo0YTI4Ulp6d2NtOWF5VW02TmhwUDhUUzBaeDFENmN5T3do?=
 =?utf-8?B?c0djQnF0aDdrbnNQOURZTDBpdU03OUtEYWYzV3lOdzJJeHd0M1o1eXFPZUw2?=
 =?utf-8?B?eGdjbGg3dFdDR3AzTGdUQmUzOVVJdnZiSklha2p6ZWhpMjJ3NmxwMkdKODBs?=
 =?utf-8?B?cThVUlBSZFUraDZBWm0zbFpFZFdVUXdmYVRFUGNiSzlXL3dSMzdKQkxqSGxn?=
 =?utf-8?B?Zk9sWjdOa0RWWUQ5cVBmVXVCMGkwZ3BDbm9qQjJ4d2hIVFJJMnJjYXpSd1J0?=
 =?utf-8?B?QnVGOFZHZ0hhUWVXakF2UkNGVkV0Rlk1T0d0TUJYTFhBMy9CZzlBdWxqTXFK?=
 =?utf-8?B?WmpvMlNsSmpiYyt3bW5PVEdDdmZWaU85WU9qVkt3aSsrbkNoRGorSCttLytv?=
 =?utf-8?B?Z1hTU2xKTkMvS1FGZ0RMTjNLMUFmOGVYNUxOaWs0M0t2V2lEalFLR3VEMWFF?=
 =?utf-8?B?SkpRYzV6Vm5zMGorcHZXbUtxeEw2WmNaRmpMd09paFVkWlNLNHZEVGRCeGh2?=
 =?utf-8?B?Tk8vcXlzQ0VRNzI0UlhObDlCWTQ0eXN0K3ZiSFNQYmR2alJucFExanRxNyty?=
 =?utf-8?B?MTUxWVpRR05YOVdUeGRCb0hxMmM5Z25mZlBFVG1LeTVSNjRCWFZndkV6eWJI?=
 =?utf-8?B?eWVHMUxMakxzdmV2QWV0QkN3WmM2SGgwTWNsUGozbmRnREN5Y1JaMEJ2QzM5?=
 =?utf-8?B?UG1YOXpRbEtqcWg3SGJwK1hIcHN2aVE0dXFWd21yc3NQZnpiSVdhR0NZZTdr?=
 =?utf-8?B?dHVybjB2TnUyMHc0bUNhbElSZUJWbS8ySWp0dzF2L0xUSDlLNE5PQVpmV0Rr?=
 =?utf-8?B?dU0yRHJMZHEvZzh5YnQxQTdqYlpWencvMmJzWGVXQ0habGNJV3ZsaXZOeDdL?=
 =?utf-8?B?QUNsRVFiaE13eTEzWVVIQ3FxNjRPdmI1UkVJaXpxQlpkNzlJZWs4cmhPVTll?=
 =?utf-8?B?bFRzaUlFd3oza2dDWUxjQWNVTWRRamY3R0huK0Z6d2tLYjU0ZUMwNDh5aTZ6?=
 =?utf-8?B?ZjhoZGxOSGpnL2RIdXhFTC9ZL0lXclkrRDVDVXZQaUNFME00dHMxOVYyNzNz?=
 =?utf-8?B?K1c2U1hCaXlHWDBtQ2QzZUdrajVMM3poMkt5ZGtkeGMyd0JMRzBrUitZdnUy?=
 =?utf-8?B?dHJhclJ2SmhhemRMRzZQckVwUzlLWUJqSWtWOEJ4ZUV0TGRBZk42QjRMVzV2?=
 =?utf-8?B?RXgvTTN0Tk91UVRsSkhZbWx2SHRhTUluTVQ5YU1CQ3J0V0l1dlZNeHR5RXNx?=
 =?utf-8?B?QXpKMDdETjE3K1FWcXllZDRUWkE5bXF2VWVkWVhTbkNidE5uYzBkVXp2R2R5?=
 =?utf-8?B?Z3BtMk9jZGNRczhaZkpDQjJRWUQ5ZTlORE1WUnJGUE0zeUo1RkZVTENXYndp?=
 =?utf-8?B?cm9zWGY5QkVzeXU5VG9TTzA3UHgyZll1Z1lMRG1QRnRtK0I0ejN2S3l6ems2?=
 =?utf-8?B?dnJ4dmxPa3hUUzJVYjRDZUxUdmswNWFlTXE4Z2Q2dE94SGV1UlZ3SG9reUFR?=
 =?utf-8?B?dll3dlFoTFJ2SGVMSHExZUpMb3JKVENVUitldis3T1FXemdleXpWMmpTeFhu?=
 =?utf-8?B?RXF6dnlJN3MyQ2tYR2JqS0F2SkFOMGNDaWx5V2tsUXdYeWgzNE1xMlM0MjN1?=
 =?utf-8?B?NjBNTFpFdU9naWw0TWMzQ1ZFdzE3cGhvRS90ZEVSZTFyUGN5dXRTVmJsVjRW?=
 =?utf-8?B?YlI1K2RaRm1nPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11332.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUREUG5xdkRrbEpaUnRGVHpheHY3MEFtczRiVG04WUlQNjVFUTZNR2pNcWpX?=
 =?utf-8?B?WXlvOGs1U3J3YmN0cm0weU90dXJPdE1RS0Vya0NLVjFSK2YyOVJ6RTlmZU9x?=
 =?utf-8?B?QUo5VXpqY3pkOG15K0kweW5PaGZjK1ZnUitPaldXZC92dmQybi9hYmxFSVkz?=
 =?utf-8?B?NTU0Qk14VG51ZEdPeXhXUDJ2aU1xVWxkbG5EcCtIZjV2ejdQTVFGN2piK0lO?=
 =?utf-8?B?ZU1QRVlubEpLZ0tyRjFPTCs3Q1dhRU0xS1Q2cUhjU1NwWEhXdkp5bTk5NzY1?=
 =?utf-8?B?ck9WdEZjcEpoTFN2UWJvUGlsZjZFVWNTdVhjZU0wTGc0UnBXcGhwa2ZUTkFX?=
 =?utf-8?B?T1VwVjRMVjFST1hIR1VFWmdqNldsNElsWTJtbFhRdVUxL2hUV1JvQ1U2aURE?=
 =?utf-8?B?Q1YrWWVPdDgvRW5NekhwOHI2Sm0rSG1LYVd1U3ZIakdBRXdobDhKVFFYOEFB?=
 =?utf-8?B?cW9tUFI5NEU5aDEyWnV5dE01akZTRk9NVnZCQlZnVnFIMU1NM0JmcFhaQ09k?=
 =?utf-8?B?T1FZWDI1MkxxVlFqZVRGbU1qa3dvcjd3NG9Hd1YwSXN1Y3A3ZFd6THdzYjdZ?=
 =?utf-8?B?YUMreDZRTTN3R1Bkc2oxMytzTnFUQ25icmlGTE5ESCt6MWpuSE5aMVpZUE1x?=
 =?utf-8?B?V2puajRoNHRxUEc3ZjVoRXo0ZGo0L3FNSXBMbUswSjRUTWk4dUYwK2xrTEl1?=
 =?utf-8?B?WHJ5bWgvVWtGbkhkUERWaFpDRHgweElLcGRVbXd1c0czcU1lMU9zV2JscWc1?=
 =?utf-8?B?L2tqSTNLckE3QUx2Wm5YWjE1MWVmNnEyYUJLMklFVkRhTVpBWC9jWEZFelpx?=
 =?utf-8?B?SVZ2VnlpQ3ZlQ1lYZFJOTzJEYlZSb1ROYjk5ZGVmMXhlWlRXSVVOWmRwdERp?=
 =?utf-8?B?bmh6Vko3ZFkrcm5hYVAraGhLZ0JRRlRYMDh6TzFIZmVNdzhZbE52d0dKMzVP?=
 =?utf-8?B?dmtJMEhSUllVOFhNRUpQOU9DZFVjUzhIT1VQcktiZ1lkeUhvcHZObjZaZzFa?=
 =?utf-8?B?SmtEZnZUSlorRThFZkxiZllHclZwNnk5SlhkVWRqdmhxdGxNUm9VdUc5UHNL?=
 =?utf-8?B?M05UOU5RSllCWGFYU3JldG95MDZrd0FEdnEwaDlFbzV2aVVSUkhMNWU4VEN5?=
 =?utf-8?B?V2tneTI4VTRNaHZhYXN6VFowN0hMYlYzdUV2YjJqQzNoYkRUaURmYllLNXNl?=
 =?utf-8?B?MWF0bUo1c1NNYy9LZlhGRWVDbS85VERVT3lQelhJUnZNZys5K1dLRS91WmFY?=
 =?utf-8?B?TTRyUVNUWXAvejdjR3NUR1VTbXpOZXcyNHl3UUVXK0YvdWJFT29YRWNzU2Jk?=
 =?utf-8?B?VzBNd2Z6U1cxMkIzcWRzNHFlL3ZDRE1lMzdmbmlGSUJmMi93RzFCRzVidC9H?=
 =?utf-8?B?TkNHNUtVbXNlcFdrRkxJVnRqcDhVNWhKaDdVaktXa01weVN0dUZlZVpieU1m?=
 =?utf-8?B?NXFrcXRiVExxZVArQ0U0OEZrUWxSeWJlbTVtcy9sa2hlQmNqWkRlb1k3b3Zu?=
 =?utf-8?B?VG1OSklaTW5xOUd1Ri9IRDYxRUhGcExIcTJ6T1pDaDI2V0lnNHI1eUI5R3M4?=
 =?utf-8?B?ZTJvU0FTL2FlQjY2emRTK09mMVVNOTV0dmZoaVoxL1kyMzVPVHhTUUNVVzFq?=
 =?utf-8?B?RCtLeFFMdXdQMTV3RWUzd0hTa1BuazZjSyt4UHBFUTluSmVzbFdTL1NGd3VV?=
 =?utf-8?B?dFVHdU4rUkZsY3dCbFkwdVhFTFNIeFI3NGdiWWphMHprZ2xNdDVnK3R0d0x6?=
 =?utf-8?B?VUlaaHRWMkdQYjdzTzhRa1p1TmhmbmpPSXJVRXgzaUJ4aWhPTnYyS1U2bEs0?=
 =?utf-8?B?RkN5SG9icy9hVHU0c1lheEFMTUVXM01JK2NqczdrMVJId3RVNUhVUU5SblNh?=
 =?utf-8?B?Zno2WXQ4NG52MlJFczBzS3F3RzFtODQxaFhiRll5TjdjZXBVMmdpdlIxNzhR?=
 =?utf-8?B?ZUJrMVJGeVF1ekhSMUQ2eVRTZUdxSjJyOGhJZXBMSEFGY1U2YTREbmpSYWNS?=
 =?utf-8?B?SmIrZkhRek1wMG9jWkk4Q2JPYldnSmNsZTYvSjJ4ejl6eFlFdTNuOFVMSzJ0?=
 =?utf-8?B?ODdXN2R6REJXdHBsTi8xRUZRbGNRUC9RT082akVLZ0N2TnlMT2FHT2NWODhI?=
 =?utf-8?Q?gSkzA2W4qAIVyDvopz2GGIYFy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a02ebe-148e-463f-ad54-08ddacc4347a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 10:54:45.0440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gpG3xs8/CJYWEikm3wZyyW/cu5+74Jk1n8zrLNz4iUJ9/+qaaN68whf6sVVdgs3sJZ0edF9WvYq9RdiZEj+LgNOogWLLdjCc9+oxnR8ohuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12700
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGFkLCBQcmFiaGFrYXIg
PHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bmUgMTYsIDIw
MjUgMTE6NDggQU0NCj4gVG86IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4N
Cj4gQ2M6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBBbmRy
emVqIEhhamRhDQo+IDxhbmRyemVqLmhhamRhQGludGVsLmNvbT47IE5laWwgQXJtc3Ryb25nIDxu
ZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsNCj4gUm9iZXJ0IEZvc3MgPHJmb3NzQGtlcm5lbC5v
cmc+OyBsYXVyZW50LnBpbmNoYXJ0DQo+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5j
b20+OyBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+Ow0KPiBKZXJuZWogU2tyYWJlYyA8
amVybmVqLnNrcmFiZWNAZ21haWwuY29tPjsgTWFhcnRlbiBMYW5raG9yc3QNCj4gPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT47IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVs
Lm9yZz47DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPjsgRGF2aWQg
QWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47DQo+IFNpbW9uYSBWZXR0ZXIgPHNpbW9uYUBmZnds
bC5jaD47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YNCj4gS296bG93
c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5v
cmc+Ow0KPiBNaWNoYWVsIFR1cnF1ZXR0ZSA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+OyBTdGVw
aGVuIEJveWQNCj4gPHNib3lkQGtlcm5lbC5vcmc+OyBNYWdudXMgRGFtbSA8bWFnbnVzLmRhbW1A
Z21haWwuY29tPjsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gY2xrQHZnZXIua2VybmVs
Lm9yZzsgRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+Ow0K
PiBQcmFiaGFrYXIgTWFoYWRldiBMYWQgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5l
c2FzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiA0LzRdIGRybTogcmVuZXNhczogcnot
ZHU6IG1pcGlfZHNpOiBBZGQgc3VwcG9ydCBmb3INCj4gUlovVjJIKFApIFNvQw0KPiANCj4gSGkg
QmlqdSwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4NCj4gDQo+IE9uIEZyaSwgSnVu
IDEzLCAyMDI1IGF0IDc6MTfigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gSGkgUHJhYmhha2FyLA0KPiA+DQo+ID4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogUHJhYmhha2FyIDxwcmFiaGFrYXIuY3Nl
bmdnQGdtYWlsLmNvbT4NCj4gPiA+IFNlbnQ6IDMwIE1heSAyMDI1IDE4OjE5DQo+ID4gPiBTdWJq
ZWN0OiBbUEFUQ0ggdjYgNC80XSBkcm06IHJlbmVzYXM6IHJ6LWR1OiBtaXBpX2RzaTogQWRkIHN1
cHBvcnQNCj4gPiA+IGZvciBSWi9WMkgoUCkgU29DDQo+ID4gPg0KPiA+ID4gRnJvbTogTGFkIFBy
YWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4N
Cj4gPiA+IEFkZCBEU0kgc3VwcG9ydCBmb3IgUmVuZXNhcyBSWi9WMkgoUCkgU29DLg0KPiA+ID4N
Cj4gPiA+IENvLWRldmVsb3BlZC1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8u
anpAcmVuZXNhcy5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZh
YnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQ
cmFiaGFrYXINCj4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+
DQo+ID4gPiAtLS0NCj4gPiA+IHY1LT52NjoNCj4gPiA+IC0gTWFkZSB1c2Ugb2YgR0VOTUFTSygp
IG1hY3JvIGZvciBQTExDTEtTRVQwUl9QTExfKiwNCj4gPiA+ICAgUEhZVENMS1NFVFJfKiBhbmQg
UEhZVEhTU0VUUl8qIG1hY3Jvcy4NCj4gPiA+IC0gUmVwbGFjZWQgMTAwMDAwMDBVTCB3aXRoIDEw
ICogTUVHQQ0KPiA+ID4gLSBSZW5hbWVkIG1vZGVfZnJlcV9oeiB0byBtb2RlX2ZyZXFfa2h6IGlu
IHJ6djJoX2RzaV9tb2RlX2NhbGMNCj4gPiA+IC0gUmVwbGFjZWQgYGkgLT0gMTtgIHdpdGggYGkt
LTtgDQo+ID4gPiAtIFJlbmFtZWQgUlpWMkhfTUlQSV9EUEhZX0ZPVVRfTUlOX0lOX01FR0EgdG8N
Cj4gPiA+ICAgUlpWMkhfTUlQSV9EUEhZX0ZPVVRfTUlOX0lOX01IWiBhbmQNCj4gPiA+ICAgUlpW
MkhfTUlQSV9EUEhZX0ZPVVRfTUFYX0lOX01FR0EgdG8NCj4gPiA+ICAgUlpWMkhfTUlQSV9EUEhZ
X0ZPVVRfTUFYX0lOX01IWi4NCj4gPiA+DQo+ID4gPiB2NC0+djU6DQo+ID4gPiAtIE5vIGNoYW5n
ZXMNCj4gPiA+DQo+ID4gPiB2My0+djQNCj4gPiA+IC0gSW4gcnp2MmhfZHBoeV9maW5kX3VscHNl
eGl0KCkgbWFkZSB0aGUgYXJyYXkgc3RhdGljIGNvbnN0Lg0KPiA+ID4NCj4gPiA+IHYyLT52MzoN
Cj4gPiA+IC0gU2ltcGxpZmVkIFYySCBEU0kgdGltaW5ncyBhcnJheSB0byBzYXZlIHNwYWNlDQo+
ID4gPiAtIFN3aXRjaGVkIHRvIHVzZSBmc2xlZXAoKSBpbnN0ZWFkIG9mIHVkZWxheSgpDQo+ID4g
Pg0KPiA+ID4gdjEtPnYyOg0KPiA+ID4gLSBEcm9wcGVkIHVudXNlZCBtYWNyb3MNCj4gPiA+IC0g
QWRkZWQgbWlzc2luZyBMUENMSyBmbGFnIHRvIHJ6djJoIGluZm8NCj4gPiA+IC0tLQ0KPiA+ID4g
IC4uLi9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfbWlwaV9kc2kuYyAgICB8IDM0NQ0KPiAr
KysrKysrKysrKysrKysrKysNCj4gPiA+ICAuLi4vZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfbWlw
aV9kc2lfcmVncy5oICAgfCAgMzQgKysNCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDM3OSBpbnNl
cnRpb25zKCspDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yZW5l
c2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpLmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3JlbmVz
YXMvcnotIGR1L3J6ZzJsX21pcGlfZHNpLmMgaW5kZXgNCj4gPiA+IGEzMWY5YjZhYTkyMC4uZWE1
NTRjZWQ2NzEzIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnot
ZHUvcnpnMmxfbWlwaV9kc2kuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMv
cnotZHUvcnpnMmxfbWlwaV9kc2kuYw0KPiA+ID4gQEAgLTUsNiArNSw3IEBADQo+ID4gPiAgICog
Q29weXJpZ2h0IChDKSAyMDIyIFJlbmVzYXMgRWxlY3Ryb25pY3MgQ29ycG9yYXRpb24NCj4gPiA+
ICAgKi8NCj4gPiA+ICAjaW5jbHVkZSA8bGludXgvY2xrLmg+DQo+ID4gPiArI2luY2x1ZGUgPGxp
bnV4L2Nsay9yZW5lc2FzLXJ6djJoLWRzaS5oPg0KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9kZWxh
eS5oPg0KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9pby5oPg0KPiA+ID4gICNpbmNsdWRlIDxsaW51
eC9pb3BvbGwuaD4NCj4gPHNuaXA+DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIGludCByenYyaF9k
cGh5X2NvbmZfY2xrcyhzdHJ1Y3QgcnpnMmxfbWlwaV9kc2kgKmRzaSwgdW5zaWduZWQNCj4gbG9u
ZyBtb2RlX2ZyZXEsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1NjQgKmhz
ZnJlcV9taWxsaWh6KSB7DQo+ID4gPiArICAgICBzdHJ1Y3Qgcnp2MmhfcGxsZHNpX3BhcmFtZXRl
cnMgKmRzaV9wYXJhbWV0ZXJzID0gJmRzaS0NCj4gPmRzaV9wYXJhbWV0ZXJzOw0KPiA+ID4gKyAg
ICAgdW5zaWduZWQgbG9uZyBzdGF0dXM7DQo+ID4gPiArDQo+ID4gPiArICAgICBpZiAoZHNpLT5t
b2RlX2NhbGMubW9kZV9mcmVxX2toeiAhPSBtb2RlX2ZyZXEpIHsNCj4gPiA+ICsgICAgICAgICAg
ICAgc3RhdHVzID0gcnp2MmhfZHBoeV9tb2RlX2Nsa19jaGVjayhkc2ksIG1vZGVfZnJlcSk7DQo+
ID4gPiArICAgICAgICAgICAgIGlmIChzdGF0dXMgIT0gTU9ERV9PSykgew0KPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGRldl9lcnIoZHNpLT5kZXYsICJObyBQTEwgcGFyYW1ldGVycyBmb3Vu
ZCBmb3INCj4gbW9kZSBjbGsgJWx1XG4iLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbW9kZV9mcmVxKTsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4gPiA+ICsgICAgICAgICAgICAgfQ0KPiA+ID4gKyAgICAgfQ0KPiA+ID4gKw0KPiA+
ID4gKyAgICAgY2xrX3NldF9yYXRlKGRzaS0+dmNsaywgZHNpLT5tb2RlX2NhbGMubW9kZV9mcmVx
X2h6KTsNCj4gPg0KPiA+IE5vdCBzdXJlLCBDYW4gd2UgdXNlIHRoZSBEU0kgZGl2aWRlciByZXF1
aXJlZCBiYXNlZCBvbiB0aGUgZGF0YSByYXRlDQo+ID4gKHZjbGssIGJwcCBhbmQgbnVtbGFuZXMp
IGhlcmUNCj4gPg0KPiA+IGFuZCB0aGVuIHRoZSBzZXQgcGFyZW50IGNsayBvZiBQTExEU0kgYXMg
d2VsbCBoZXJlIChkc2ktPnZjbGsgKiB0aGUNCj4gZGl2aWRlciB2YWx1ZSkgPz8NCj4gPg0KPiA+
IDI0TUhaLT5QTEwgRFNJLT5EU0kgRElWSURFUi0+VkNMT0NLDQo+ID4NCj4gPiBNYXliZSB0aGVu
IHRoZSBjbG9jayBmcmFtZXdvcmsgaGFzIGFsbCB0aGUgaW5mb3JtYXRpb24gZm9yIHNldHRpbmcN
Cj4gUExMX0RTSSBhbmQgRFNJX0RJVklERVIgY2xrcz8/DQo+ID4NCj4gQ2FuIHlvdSBwbGVhc2Ug
ZWxhYm9yYXRlIGhlcmUgd2l0aCBhIGRldGFpbGVkIGV4YW1wbGUuDQoNClRoZXJlIHdpbGwgYmUg
ZGV0ZXJtaW5lX2NsayBmb2xsb3dlZCBieSBzZXRfY2xvY2sgZm9yIHNldHRpbmcgbmV3IHJhdGUg
Zm9yIFBMTCBEU0koZHNpLT52Y2xrICogdGhlIGRpdmlkZXIgdmFsdWUpDQpGb3IgZWc6ICB2Y2xr
X21heCA9IDE4Ny41IE1IeiwgRFNJIERpdmlkZXIgcmVxdWlyZWQgPSAxNg0KVGhlbiBzZXQgUExM
X0RTSSA9IDE4Ny41ICogMTYgTUh6IHVzaW5nIGNsa19zZXQuDQoNCkNoZWVycywNCkJpanUNCg0K
DQo+IA0KPiBDaGVlcnMsDQo+IFByYWJoYWthcg0K
