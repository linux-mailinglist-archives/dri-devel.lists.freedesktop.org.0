Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201449B2E3F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 12:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF80B10E473;
	Mon, 28 Oct 2024 11:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IxWhaMMu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B9410E473
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 11:12:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCqSnSaBszSqaIOIwABUKejG1gcRyT+jsXzKVEVfP/Z771KWxPqb50nFie7hBpylT+kBcGN6+28F9QZi92UJ79Lr72pcztJ3lc7GF8T+sW7sqnfxDvXkuMzKec7vmFjlkGwVFSJYKBZFaa13v03L0Kfz2HZDG5qzJI29tK6YFRqWYh9TAycUiuHWm5lmLMwKhLzTri+E/2TUE/zqi1//uegw2LInP4YkbmYb/viKUY5IhlYWdpJuvEqX5lfNUQo5ZynhyuIceOTJ+DCen+3p2AA7vgFne9cmGulWp0c845qaGMNzi5MvAMNPA3wJk1xYu6BRZ3xDVDEo9+2xT/RMHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Kgf/mngBIAj1+MlUp9w+BEa6Uz90fI9qhxQVVxq5+A=;
 b=I8V8gakeukmvzt/qGTLEgchO8NP29JEizzKQaOrqa/CEaCtGZd8xTEpC+Y1tgdH0sB1Dr1Wz2rtEhzgqx+aaSW1aN8E9DWP6jOyUcCifChEzqK1MV4ZxS+zqaXBTuXVzMhp+M6cOIz6zCBnqJESQqseTeSEfAqOeylM86nm7WbQsi6eBov+mjJdpAF36eJcxImBYFqWQte7OIRDD7JT0iSYqrjJz0rbu7KJ9McTqDvsgKUPdmz/iEs3LRyNjeIlbDFWAh6l37RWoXoEgKV1BoO3PgturtY0DfjKZC/WJpZHh7nvVvTFHDUgW0FT71XFRz9AhUTiSsx8j76fY32d4EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Kgf/mngBIAj1+MlUp9w+BEa6Uz90fI9qhxQVVxq5+A=;
 b=IxWhaMMu4lGkdCxbLzqsl2a9iWuwlSZyZ6fwMPFtQFamKrLCB4+A09XuagqmoT/V4dwB1n/9/qzqlJVQedMs3Uyxe3VgMA2GWOOFwtproDI5rXYCkQFRBTZ4U9tN4vOkIq+0gx9pkIU1VowEso9mBITUp4/f8Ube6AkCfoQVh0g=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB6707.jpnprd01.prod.outlook.com (2603:1096:604:101::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 11:12:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8093.025; Mon, 28 Oct 2024
 11:12:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Liu Ying
 <victor.liu@nxp.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se"
 <jonas@kwiboo.se>, "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "quic_jesszhan@quicinc.com"
 <quic_jesszhan@quicinc.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "tomi.valkeinen@ideasonboard.com"
 <tomi.valkeinen@ideasonboard.com>, "quic_bjorande@quicinc.com"
 <quic_bjorande@quicinc.com>, "geert+renesas@glider.be"
 <geert+renesas@glider.be>, "arnd@arndb.de" <arnd@arndb.de>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>
Subject: RE: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI converter support
Thread-Topic: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI converter support
Thread-Index: AQHbKOJkqY05AJR01UOImSMvFhFSS7Kb9BIAgAAMnhA=
Date: Mon, 28 Oct 2024 11:12:00 +0000
Message-ID: <TY3PR01MB11346F956733032EC10E997AF864A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <CAA8EJprFBbC_=kBHi86j-nE_K68QeG+c2OBzJCbUyNWs5zQK0Q@mail.gmail.com>
In-Reply-To: <CAA8EJprFBbC_=kBHi86j-nE_K68QeG+c2OBzJCbUyNWs5zQK0Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB6707:EE_
x-ms-office365-filtering-correlation-id: 319b7762-1b90-4a79-09bb-08dcf741582b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?V2pQc1lSQXFHd2VPRHJyT2dEcUZTdEp5aTNQZDJybVQ0bVpxUjZiMG1XcWJn?=
 =?utf-8?B?TTcxenQwd3lXSlFOb3VHaldOUmdsNG9QWThtQWJpYk9aQzg0eDk3ZEhmVzl3?=
 =?utf-8?B?a1U1bUJtOEtFUVp4eCs1d0o4cGYySmtEcVBhdEEreU5TNk5kRGRsNXZXOGgr?=
 =?utf-8?B?UmJzQmtyMngycVFubFMwNUQzS25VV3JXSXloY3BZTzVsa1czWjAySG00VzE0?=
 =?utf-8?B?cXcvVFBBNzhGVkxaVnVtdStmcnZKeENRbG90bUVhaGFPVERKUUV6VG9PYzFv?=
 =?utf-8?B?VVF3alpNbXo4cFNOa2RjeTRSS1V4YUZNVXZ1RE8xN21SMEZqb3BIRFBmU3lX?=
 =?utf-8?B?bFNMY0lLWmlLK0pBWGdEdGlabnN1NWlabktKb1dPamt4dC9ZTjF3Ky9pdng1?=
 =?utf-8?B?UTR2anYwbGNPRkhGdFpQRVFuMEtWSVUvV0xVOHgzNGRqdkQ0KzZrV1IrNDJi?=
 =?utf-8?B?ZEVJcnRsMXJRNXpHblVpU1U1UXh6UDRSYklwdUVtTERpc3UzRWtUMGVIVUtj?=
 =?utf-8?B?eE5EODh2L1JLd25qWWNCU0g4cllVOHdaL2kvLzJOSDIzNzlya3JyRktxYTJw?=
 =?utf-8?B?c0kvYzcxVWdGdUpheHJRRm1GT2ViWnlOMktmaVFnZEppVk5iZ2NqZGk5U1hq?=
 =?utf-8?B?bHJ4WEcxb1k2ZVJXTHhCbU1pdCsrY0hia1B5YlRobS9CV2hkbW1OZTNySTBV?=
 =?utf-8?B?ZXBYTUVEVDNyWFJCMnVEV3RLdytDMFgrK3ZQSTlHK3VuSVdGN3ovQmdBWk14?=
 =?utf-8?B?Qi8xaFlhRFp1WnJDMUM5Zkp1YjNkODM2OUVhbnZMbkpJb1ZsNUI5eVVuOUpm?=
 =?utf-8?B?TGJiWHRmUzNldjMzUHlpZHJidGVBdzNoQ0FSdlNXSmUxYXl4dWFYb0F2Ujcr?=
 =?utf-8?B?OWZaNS9xZDBWeXBtTTNobnEvZS9JaXhwR1JPeWdaR2FieVhUQWFQWGN4amNw?=
 =?utf-8?B?SUhlaXVMREk5Vm9aWGsyNTVGQ1BvbzhXZkJQWWdkN1RvNHRkcE5DM1pkTkUw?=
 =?utf-8?B?MDkrN0RyTnlLeG43eHVDYWdyaGpZb3B2WEN4TmgrbTBmNjdVOGNwcFdEQXNM?=
 =?utf-8?B?NGg3UGIwL0Q2cEpuMzN5QkpzNVAyblJLZDVHUC9QSG5hMUwvMFplUnUzaERp?=
 =?utf-8?B?MWM1YzNaSXhYZUp3bW5ILzBsa3ZXcjRRVEFlTFp1M2c5NjIrUG4rSzNkd1RO?=
 =?utf-8?B?S28zSDZvSCtFOTE1TmJ3OXR3TWhrN1N0cHVzOGVUL29JekhBem03YWlkc1Fz?=
 =?utf-8?B?T0F0WE1OOEhwQ1NoZ20rNWtWM1k1aDJVRWF4amptRTBsTjRERkpCbTYwU1Iw?=
 =?utf-8?B?bU1nTlRXYVdyZ2xLUnY3Q0JwTjJCa3IrdGE0WkJlMXVhanFpcU5KUGxLakhW?=
 =?utf-8?B?OStvSEJMckhhYkkyTjRSdXIxZ3RxTUw0T25ISW14dnRMNTdtQ2hPTU9TWWIz?=
 =?utf-8?B?VEcwVnRjb0t2clFIOThkcGYvVGJXNjNYZUd2ZFFyV09nby9GWUYrb24xbndm?=
 =?utf-8?B?aXU5TGNpa2N0NDdkUUNSWjVHbXd2RXJld1JDTHhJTmM4SVlEWkMvektYQTJB?=
 =?utf-8?B?aXJxeWUyZWw3MzNjZ2RpWHZEMWZ0NUVTcEg4K3FhOWo2KzY5Z0RRK1dZMkFC?=
 =?utf-8?B?QTRyMXJJT3RaemRnOVFYVEM3QWttRzlrTnJaZnFwVkZzem92NWc4RWRUdVBp?=
 =?utf-8?B?SHFnbXNoWDRoRU9GTTlGWnptUXNuLzBHRUNZMU1wMFFvNmUrNXZCTVBTbUhu?=
 =?utf-8?B?L0t6NXExRkdiNVpYOHR2dnFpM29SR1FLRklNUGRBeHVJUHFNVWpSZWdLSm1h?=
 =?utf-8?Q?5h8wrikd2AILzJViF61a0Ae0k097AoWdhGC3A=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGhpb1VIS3FSWkJWZmxjSzBkc3Z1eGozZkU5d01DeUg2MUdGazQ5T21uVmQ0?=
 =?utf-8?B?SG5lVU91NjExNzhRRUpHOE1PeStxa0g4a1UzRllhcTRuUDFQbE55Z2JyMG5V?=
 =?utf-8?B?dDZkNVFVbEhwd3FYYTBQazlUYytBM3hWbFBIeVZWRG15dElQUW5haHJsYWVX?=
 =?utf-8?B?MG9RSmNLNlVUbEdVcmVUR3U5VFZXdVZYaGVxYWxXRDJxdWVTZkVJdVdqZHo4?=
 =?utf-8?B?ejBLeExEQjM3U1h4cHFDVVZOMzh2bFR0MzE4SXBaSUJ4Mkl5WjJqWGNNT3ph?=
 =?utf-8?B?T2NFZWhMT2t4ZXZ5ejBESUJhZGF6MU0xeEJRRnV5dXZSOXdiZlZIMUw2OUxv?=
 =?utf-8?B?VmdxWXE1WjE5UXRLdG1WVncyRzRzNUJDQVBpcmdLWk16WXNnZHdXeGxlUDJx?=
 =?utf-8?B?cG9Lb2JTKzBQWjhaWXJ3bnd5TDlaaXg3L1QwMWRhMVJMV0dxU3JCeVovQjhU?=
 =?utf-8?B?UjJxZldyZXExMSszRDg4T0tNNzYrakNvV2RHd2FuK0VTY3M4cVVIWU9aVGJZ?=
 =?utf-8?B?aXk3VjJMUW5oRmU5UGducDhpVTJ6N0JzNnZuTnpPb0dGZnRaWVAzdEhmWnpn?=
 =?utf-8?B?c1Z3Q2Z2ODlZbkZXQmVIckhMc3dIaURQWGR6Q0dNLzc2Ty8zWDB0UE9jNjUw?=
 =?utf-8?B?NGtnazQwcTRlbnJSaGZVNENzVlMrZVpaSGZMckowNGRqUHVDNDVYa1poRWFV?=
 =?utf-8?B?TTE1eUFxNy9Hc0EwaXluVXRpaXJaVG81clgrczN3ejFnTTdjOTFGUXUyVndn?=
 =?utf-8?B?VlY1MERkMUxOekg0VzdrNFVRQWRtUHFRUnpUYjI4TWM3MW9CWmg3UTlkQm8z?=
 =?utf-8?B?bGx6cStJTk5wcnhDZ2VmeFJyRDZzQVVhNnc4ZjY1Y25zeTI1RHovOWdsNDBH?=
 =?utf-8?B?a3ZWMlFZMUFMOTJ6UURZTEJ2aWdCRThqL25oTmNXN3kxdTNOK2l4d3pOc3JH?=
 =?utf-8?B?aWh2TWppWTNMQlhkV2YxdU1xcWRONWtaT2JCaTFXL3hobXE4UkxqQjByL1Yy?=
 =?utf-8?B?eUlNVEpBYVJqbm0rQTNxOE8wRnJEaFFEZzlmdTBrWnVxVnV2QlU5RVZPRmFT?=
 =?utf-8?B?cC9LdHcyRGExbTNIRjRhcUs3dDlLOW5IajN4MmM1QXFQbUI3aHNHL2V0ZHNr?=
 =?utf-8?B?cDFYZmhYQjVRLzZOeEtQalR2L2lvUzNxUWVzcGl4QWg5cllVRnE5N0RFUUg4?=
 =?utf-8?B?a2ZhWVVQTEQ1OWVzV1Nhc2pzSFRldWVSRnJsQ2l2dkZHQmpaRjBrbVFTdG9Z?=
 =?utf-8?B?bnFmeU84YVptakRGWHhiT2NUbjF0VlRYYXF6aGpqcGZjMEpGeVNzakF3YTVL?=
 =?utf-8?B?dmgxS3pkWGRreXRra2dyVVJSc2NXWElwdm1FV29SRUhHdkxBNkIrbjlNM0xu?=
 =?utf-8?B?VTFmcFNQNUY5U1VaUDh3WG9CUXZLTi84aXovMXNHWjNYcnNNekZvMFh6akFz?=
 =?utf-8?B?RVRoNVg1dkFtQXErTXBaa0p6M0dOSGpDd056OXdjYXlJaXFHWlBsSWhVV1VP?=
 =?utf-8?B?TGRQdlJLZmVWYytRSERndnE5dU4xN3ZweVFFUWNwUS9Nby9kRVR0RGhvRk5p?=
 =?utf-8?B?bzFtS2dwNUZTcjdtQTJoMXFDRFlyeXkyRVRyWERhZ3g0L1k4SEVjTzhHc2Yv?=
 =?utf-8?B?NXdtN1FBaXRvczF1MG8vWlVBdWw0bFpwVjIvQ0xMd25GNi9IUjh3cXFaVDg1?=
 =?utf-8?B?c3lUNGZHMkZpa1NhVkxKcWlQZitvaTNuRmYwZDJuRER3SFlDSFBKQlJidkF6?=
 =?utf-8?B?dWpzVW9qUUh0MndQQk9IRVB4T3NmWEVzb1hTLzRFTCtLeGZWaElnNEkrbGo1?=
 =?utf-8?B?Wng0d2p0UmtYZ3U5SEpWdXgzbHZ3a25XMFZTK3l6UElHYVJQTHUzQ3Y4MURa?=
 =?utf-8?B?UFR6YnlnbkxJVnVGRGd5ZkYrYXZqaVZlVXRvN3R4QjkxVVU3Ym9iMUVVU2o0?=
 =?utf-8?B?SWJTWWFMVjcxTCsvb2NlMFd4MWdJQ3RRdEtVWnRVSDJTODlkcThEMHF3K1RO?=
 =?utf-8?B?NDMxZjBkc09WTnhrUmhnSFpRMGFhWXAvT0F6Q3pXbWtDdU44YjdzeU1BZml4?=
 =?utf-8?B?ckROcFIzV0ExTHhmTFF2OVY2SVNqUkRnZFRTbi94djVCU0loSy9UOGhaOENj?=
 =?utf-8?B?TTNYdDRSUnFvcDMxR2RMMzVuT0RGVGxMUXdsd0pkcjVKMHFOMldVVEJBOUs0?=
 =?utf-8?B?VHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 319b7762-1b90-4a79-09bb-08dcf741582b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 11:12:00.3737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MNDnMgMrDrAX7QVeaI5Avhgz+1em70TrnWlgslvI89BFfv6a2twN1K/+MhCaZZn4NTG2FthTEp/8hz7WDm3p6dsiT3SgfOqlYOLv9SYbBak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6707
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

SGkgRG1pdHJ5LCBMaXUsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
RG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiAy
OCBPY3RvYmVyIDIwMjQgMTA6MjANCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwMC8xM10gQWRk
IElURSBJVDYyNjMgTFZEUyB0byBIRE1JIGNvbnZlcnRlciBzdXBwb3J0DQo+IA0KPiBIaSwNCj4g
DQo+IE9uIE1vbiwgMjggT2N0IDIwMjQgYXQgMDQ6MzcsIExpdSBZaW5nIDx2aWN0b3IubGl1QG54
cC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGksDQo+ID4NCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBh
aW1zIHRvIGFkZCBJVEUgSVQ2MjYzIExWRFMgdG8gSERNSSBjb252ZXJ0ZXIgb24NCj4gPiBpLk1Y
OE1QIEVWSy4gIENvbWJpbmVkIHdpdGggTFZEUyByZWNlaXZlciBhbmQgSERNSSAxLjRhIHRyYW5z
bWl0dGVyLA0KPiA+IHRoZSBJVDYyNjMgc3VwcG9ydHMgTFZEUyBpbnB1dCBhbmQgSERNSSAxLjQg
b3V0cHV0IGJ5IGNvbnZlcnNpb24NCj4gPiBmdW5jdGlvbi4gIElUNjI2MyBwcm9kdWN0IGxpbmsg
Y2FuIGJlIGZvdW5kIGF0IFsxXS4NCj4gPg0KPiA+IFBhdGNoIDEgaXMgYSBwcmVwYXJhdGlvbiBw
YXRjaCB0byBhbGxvdyBkaXNwbGF5IG1vZGUgb2YgYW4gZXhpc3RpbmcNCj4gPiBwYW5lbCB0byBw
YXNzIHRoZSBhZGRlZCBtb2RlIHZhbGlkYXRpb24gbG9naWMgaW4gcGF0Y2ggMy4NCj4gPg0KPiA+
IFBhdGNoIDIgYWxsb3dzIGkuTVg4TVAgTFZEUyBEaXNwbGF5IEJyaWRnZShMREIpIGJyaWRnZSBk
cml2ZXIgdG8gZmluZA0KPiA+IHRoZSBuZXh0IG5vbi1wYW5lbCBicmlkZ2UsIHRoYXQgaXMgdGhl
IElUNjI2MyBpbiB0aGlzIGNhc2UuDQo+ID4NCj4gPiBQYXRjaCAzIGFkZHMgbW9kZSB2YWxpZGF0
aW9uIGxvZ2ljIHRvIGkuTVg4TVAgTERCIGJyaWRnZSBkcml2ZXINCj4gPiBhZ2FpbnN0ICJsZGIi
IGNsb2NrIHNvIHRoYXQgaXQgY2FuIGZpbHRlciBvdXQgdW5zdXBwb3J0ZWQgZGlzcGxheQ0KPiA+
IG1vZGVzIHJlYWQgZnJvbSBFRElELg0KPiA+DQo+ID4gUGF0Y2ggNCBhZGRzIE1FRElBX0JVU19G
TVRfUkdCMTAxMDEwXzFYN1g1X3tTUFdHLEpFSURBfSBzdXBwb3J0LCBhcw0KPiA+IHRoZXkgYXJl
IHN1cHBvcnRlZCBieSBJVDYyNjMod2l0aCBMVkRTIGRhdGEgYml0IHJldmVyc2VkIG9yZGVyKS4N
Cj4gPg0KPiA+IFBhdGNoIDUgbWFrZXMgZHJtX29mLmMgdXNlIE1FRElBX0JVU19GTVRfUkdCMTAx
MDEwXzFYN1g1X3tKRUlEQSxTUFdHfS4NCj4gPg0KPiA+IFBhdGNoIDYgc3VwcG9ydHMgZ2V0dGlu
ZyBkdWFsLWxpbmsgTFZEUyBwaXhlbCBvcmRlciBmb3IgdGhlIHNpbmsgc2lkZQ0KPiA+IGFzIG5l
ZWRlZCBieSBJVDYyNjMgZHJpdmVyLg0KPiA+DQo+ID4gUGF0Y2ggNyBkb2N1bWVudHMgamVpZGEt
MzAgYW5kIHZlc2EtMzAgZGF0YSBtYXBwaW5ncyBpbg0KPiA+IGx2ZHMtZGF0YS1tYXBwaW5nLnlh
bWwsIGFzIG5lZWRlZCBieSBJVDYyNjMgRFQgYmluZGluZy4NCj4gPg0KPiA+IFBhdGNoIDggZXh0
cmFjdHMgY29tbW9uIGR1YWwtbGluayBMVkRTIGRpc3BsYXkgcHJvcGVydGllcyBpbnRvIG5ldw0K
PiA+IGx2ZHMtZHVhbC1wb3J0cy55YW1sIHNvIHRoYXQgSVQ2MjYzIERUIGJpbmRpbmcgY2FuIHJl
ZmVyZW5jZSBpdC4NCj4gPg0KPiA+IFBhdGNoIDkgYWRkcyBEVCBiaW5kaW5nIGZvciBJVDYyNjMu
DQo+ID4NCj4gPiBQYXRjaCAxMCBhZGRzIElUNjI2MyBicmlkZ2UgZHJpdmVyLiAgT25seSB2aWRl
byBvdXRwdXQgaXMgc3VwcG9ydGVkLg0KPiA+DQo+ID4gUGF0Y2ggMTEgYWRkcyBEVCBvdmVybGF5
cyB0byBzdXBwb3J0IE5YUCBhZGFwdGVyIGNhcmRzWzJdWzNdIHdpdGgNCj4gPiBJVDYyNjMgcG9w
dWxhdGVkLg0KPiA+DQo+ID4gUGF0Y2ggMTIgZW5hYmxlcyB0aGUgSVQ2MjYzIGJyaWRnZSBkcml2
ZXIgaW4gZGVmY29uZmlnLg0KPiA+DQo+ID4gUGF0Y2ggMTMgdXBkYXRlcyBNQUlOVEFJTkVSUyB0
byBhZGQgbWFpbnRhaW5lciBmb3IgSVQ2MjYzIGRyaXZlci4NCj4gDQo+IFRoaXMgaGFzIHByZXR0
eSBjb21wbGljYXRlZCBzdHJ1Y3R1cmUgZnJvbSB0aGUgbWVyZ2luZyBwb2ludCBvZiB2aWV3Lg0K
PiANCj4gSSBwcm9wb3NlIHdlIHRha2UgcGF0Y2hlcyA2LCA4LCA5ICh3aXRob3V0IDMwLWJpdCBm
b3JtYXRzLCB0aGV5IGNhbiBiZSBkcm9wcGVkIHdoaWxlIGFwcGx5aW5nKSwgMTEsIDEyDQo+ICg/
KSBhbmQgMTMgdGhyb3VnaCBkcm0tbWlzYyBpbiBvbmUgYmF0Y2ggKG9uY2UgRFQgbWFpbnRhaW5l
cnMgcmV2aWV3IHRoZSBiaW5kaW5nIHBhcnRzKS4gVGhpcyBsb29rcw0KPiBsaWtlIGEgbWluaW1h
bCBzZXQsIGhhdmluZyBubyBleHRyYSBkZXBlbmRlbmNpZXMuDQoNCj4gDQo+IFRoZSBzZWNvbmQg
c2V0IG1pZ2h0IGJlIDQsIDUgKyBuZXcgcGF0Y2gsIHJlLWFkZGluZyAzMC1iaXQgZm9ybWF0cyB0
bw0KPiBJVDYyNjMgYmluZGluZyAobm8gZHJpdmVyIGNoYW5nZXMgYXJlIG5lY2Vzc2FyeSkuIFRo
aXMgY2FuIGdvIGluIHNlcGFyYXRlbHksIGFmdGVyIGFuIEFjayBmcm9tIG1lZGlhDQo+IG1haW50
YWluZXJzLg0KPiANCj4gT2YgY291cnNlIGJvdGggc2V0cyBjYW4gZ28gdG9nZXRoZXIgaWYgbGlu
dXgtbWVkaWEgbWFpbnRhaW5lcnMgcmVhY3RzIHF1aWNrbHkgYW5kIGFjayBtZXJnaW5nIG1lZGlh
LQ0KPiBmb3JtYXRzIHBhdGNoIHRocm91Z2ggZHJtLW1pc2MgdHJlZS4NCj4gDQo+IFRoZSByZXN0
IG9mIHRoZSBwYXRjaGVzIGRvbid0IGhhdmUgc3VjaCBzdHJvbmcgZGVwZW5kZW5jaWVzIGFuZCBn
byBpbiBvbmNlIHJlYWR5IC8gcmV2aWV3ZWQuDQo+IA0KPiBXRFlUPw0KDQpJIGd1ZXNzLCA2LDgs
OSh3aXRob3V0IDMwLWJpdCBmb3JtYXRzKSwgMTAsIDEyIGFuZCAxMy4NCg0KMTEgbWF5IGhhdmUg
ZGVwZW5kZW5jeSBvbiAxLCAyIGFuZCAzIGFzIGl0IGlzIFNvQyBzcGVjaWZpYy4NCg0KVGhlbiA0
LCA1ICsgbmV3IHBhdGNoLCByZS1hZGRpbmcgMzAtYml0IGZvcm1hdHMgdG8gSVQ2MjYzIGJpbmRp
bmcuDQoNCkNoZWVycywNCkJpanUgICAgICAgIA0K
