Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A96ADFCD8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 07:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0491F10E99B;
	Thu, 19 Jun 2025 05:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BRa6KCys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010026.outbound.protection.outlook.com [52.101.228.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A8C10E99B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 05:21:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhnwzGi8Vsh+oA0BIsJHlYa7msGW9qxDnX8OTc0VfYSlrKsQwGxysykpRF561aCA42lSkTo53DkG9CwcBS2kRkBkmTMuY/hgYzmJhPdYYRe3GBAxDJuli/tU9d8I+EWz8jTfCA8zqaMw2kC9DSw1mbsISZv395pQ8ViQEw4cJykFKog8n/oyesEtbauyLV5cLSk13xVUfN6Fa7tslfHV8PJfPj/BdjjckQQu4Y7Gbk3V6zSI/4+ztTcNmr3DyjzTT557RyviS3PsdIl1l4Y7uSacrFScYFLMZJ3kDoI7kQKBNxW65nVQzr1b/kVQyQK3sx23zcHLlptnJoiocNpGXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfpGcDmSwTcwmUz+iybfMtqqXLsKy2JfzXJmH6U2iR0=;
 b=qmKBrl6rGkDKevRDTlVkB050H1S4k3houtnIJzfhnu4tWzrZR9yLXsHP5EZGt71XcF6cpT/7ZksKCBOHsMBzCier3CuWGDXppEGBipuMo6uh02wcuP817tWHF+X8fFw3/Eprv4cASIhAr3EfEDGL3W1l4yw3k6iWyE9x6g6oZaabTzq3DzSq2AIJJZcXUV11Q2Vq3Verm8IBnXjfI596xCnhdmcfr4I+fiXcW26meGR13/ZoKrLyKYrR7eSp7jxNvZLyJ0NOt6i+JbpMMjp1w2ODMFqr3eFqRZeOdVnq8qUONDggnc5Yx58KSdXYJ+8pTqy9nR+LQycClmXV3Jzoeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfpGcDmSwTcwmUz+iybfMtqqXLsKy2JfzXJmH6U2iR0=;
 b=BRa6KCys7i6LciLlQTxNLJqJvtaa0j9CHTm6oel0bYkOPt7sWx0dLDr/YAku39daxILjzji5/Xp7U0CB2TVLOFgSJ1vGxYcNPOjOK5rtgfX1xhcoomi3aUC5BCulkB/UBZo0NMii8g0Zl8r5UHo9IYen7YSSTSezUObkHtP/Qkw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9359.jpnprd01.prod.outlook.com (2603:1096:400:1a2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 19 Jun
 2025 05:05:30 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 05:05:30 +0000
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
Subject: RE: [PATCH v6 1/4] clk: renesas: rzv2h-cpg: Add support for DSI clocks
Thread-Topic: [PATCH v6 1/4] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
Thread-Index: AQHb0YbvZKdKpGoLPEeGBmVqxN0ROrQAp8mggAUMkQCAA1B+sIABAwnQ
Date: Thu, 19 Jun 2025 05:05:30 +0000
Message-ID: <TY3PR01MB1134657A6D7A36FC387938AF7867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530171841.423274-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB1134654039BA3BAB5DA8C0BB08677A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tSMt9SaHAdeEd4vj=QmaDz5bMd4hwJUCx_mBF8-mw2kw@mail.gmail.com>
 <TY3PR01MB1134671558883AAE2C3E0A2C78672A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134671558883AAE2C3E0A2C78672A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9359:EE_
x-ms-office365-filtering-correlation-id: d540be00-1f59-49e4-a16d-08ddaeeee9df
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ejZWVmxZSVFlTEEvY2RjNDREaExRZ1NWWlFJQXFxdStpVmFEOHdNNGpnY0JT?=
 =?utf-8?B?SXpKRktqZlVKNGdxMjFhZWE4em5MOWlkVVZrT3NESHZzQm5VUDZrUnhXMUpu?=
 =?utf-8?B?NGFKc2IzYitZQXcwc3ZGTjE3ZHd0Nktac3JVME5YVVg1Z2JyYkJZVFMrWEI1?=
 =?utf-8?B?dW5FdHFYK0pEQXNkZmMzb2NIWGU3WDB4RmtEL0JCK0VDSEljaHBJcDZneWdY?=
 =?utf-8?B?a1Q1bkFkZ3FYZFJqMFpxWGJ1L0krUCtmQWo3cmFkdWFHTHg4UGh3cnRFakxQ?=
 =?utf-8?B?V1BPdUVBV3RoSGdKaHRBU2dyVFAzY3V0NVpaRC9OVklCb3A2RWZidURVV3p0?=
 =?utf-8?B?bTVpVjZvR3NBTTBzTGsvbjMrVDJoNHY2UkJ2TzI1RDdoRWMyYy9pcVVRZ2Ny?=
 =?utf-8?B?NXUrYVV4aThmVHAyS1FrMUUyb243cFhIVEEwY3A1U0JJRFlwRU9KS1BZZm1a?=
 =?utf-8?B?Y1g4emdheFo5OFdNQlppMHVReXBQY3IyVTBOczNKazZCcVEyTzhpZGRJZzJs?=
 =?utf-8?B?aDNjb0k1YlczTkpHREoyYW9jcStON292MmtQbW1EbVg4RUg1dWgxZkJYdkt1?=
 =?utf-8?B?QkJLMnFEQnIxVnNOM0xoUDVXbEhNZkE2THNmQTdZNlBUMHo1WXI1bjNPTjhJ?=
 =?utf-8?B?NGpwMUpBOUpUejB2NnRUVDJMemZYbk5Vd3R6eW45SGx5K2NTK3lVVmZHRU4r?=
 =?utf-8?B?dUlCUElhYk9FcW12NnZLWlJWUXNFOWFWMjFnTWdjRENubllmMitRMW53cHF6?=
 =?utf-8?B?a01LdHozM09MWTJCekp1bTVqTVBRNWxCZXRXanhpelhjQzZDcW5EQlhpQ1lP?=
 =?utf-8?B?NXdxVkdPYzhIYTVPRkFpdkp3RHhGZlRRUWg2ai9mblVaeWljUG1MVFBBRFRx?=
 =?utf-8?B?cXJ4aTFZR3kzWHdJV3pSc0dUQ0wxU3Nabnc3ZjhXZmY4U3JNMjBibDV2V0lo?=
 =?utf-8?B?SHhRVTFYUTZwSnhUUmoyc2M0YjVVSmJqb0xLTzhzS3cxM0x1NDhBemU0WWxt?=
 =?utf-8?B?b3N2Q1A0M2Q5aEFCU3NDSk5vOGZmMWQ2cnV5d3crMlNpZENvSCtkandqenZ6?=
 =?utf-8?B?Mm1Pay9GSXVjWWs5SkhXZWx4YVJLalRrYkI0OTZ5L0xJQWtiZnkrdFZveU5u?=
 =?utf-8?B?RUlmWUR5MnFwVktoSyszME4zTVQ1d2hNZHp4L3NFZmZOMzVUa2prVEg4VlYw?=
 =?utf-8?B?QXlYWVFaYzY4dXBDU3V0RG5xdzk5SHZHRW04NHEvZi9ZVk4ybFFGc1dhYnVH?=
 =?utf-8?B?K2NycXVqTkNiN0xDMVE5cjJjVURjQXdoMEVMN1lhS2tCYVN6WjVvM1NBaGdm?=
 =?utf-8?B?bGxtSUtDZW5WODZUM2l1RG9NeHo2b0lwekdwVHZIRzU2RzVyMVlLN2c2Z0g1?=
 =?utf-8?B?KysvZGJ6S3VHY1lzL1QySCtJaHhyNEV1SU5FMXRjR005RzlvQmgxK1ZIWnFa?=
 =?utf-8?B?dEd5ZnBrMWc1UU1STnA4NnRmU0tpZk5VeU40MjBTbVBCWHlWV1FidExEU05U?=
 =?utf-8?B?dkxsbHNjSjRYM09XaGpDUUEvU0pNVVo4bnBVZkNZSmllbHFjajZzaXJ4MmpJ?=
 =?utf-8?B?a2dmdkZGZmpVVkZVRTczcTl3c21IMmpnekJXNFVBaTNlSlVLLzE2MFdzZTFo?=
 =?utf-8?B?S3Npd1pWTzlqbUMzeWFmbTRadjlQVVdQVTVBbWROUmg3S0lIbS9CbUxDMlhY?=
 =?utf-8?B?UFBiZzhjbXRJaklLSjFKMWk5RWs0MTI3Tng4a1VBVWhiSGdWRkd6akVkV1k4?=
 =?utf-8?B?TjM3T3JrcGtOL2laZ3dLb1pRNEd6RG5zZjNpRjlmbUxYSHNON2pIaW1HN0gy?=
 =?utf-8?B?bzZUVjJHUUZ1U2NzQUtjanR5VGkxQTk5N0V5WUlQSXBCaXBqYlV5K3BTQy9Y?=
 =?utf-8?B?NzJGZDltWmFnVTBDUlV4ckhWSVEwMU1MMmd1dXV2S1NZRGRJNDEwSFVLOXEy?=
 =?utf-8?B?djNNZHBXOWVXTmYyaFdVZTU2UnpQTnM4OUFiOVlyWVpvRmJsdTlBM0dpVWZR?=
 =?utf-8?Q?Twcm1XX6uG3mmuuDXDVqrgzmhoeGoo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGgrUVV2NU9KMmNROWZ6Mi9XdDJMaXM1c2xuMGdYZkpXV1dPdzh3SGo2N2Vs?=
 =?utf-8?B?NWg2WStld0ErelgwdkUrQm4yTjJtcjBwbjhuajFVQkVhQXhOQmxIUU5FbHlQ?=
 =?utf-8?B?K25uZ3FwSkt5VDc5VFJvSjNadkFORzlEQnhidnVoTythbFlEQUE2SmdMbEJ0?=
 =?utf-8?B?YjR5YXpjV3dkblVvVytRR29ZaExFTGpScUFDRVBhMjZDSFYzS05wTG9mRW9U?=
 =?utf-8?B?UVc4OXRqWlEzYllUZXZFd3B0bVM5d09GTGF2NHpCOXpvbDRSYlhYdkFIejlF?=
 =?utf-8?B?YllxZE1Cb1grZ2ZGSXlzemkvZ2thaUVISHY4REtyc1h2UWd2d1BlQTJjU0pT?=
 =?utf-8?B?TmFuZjhNR1ZVYmtRc0hYejdWVENzcHFrVGFRWUlSTEl3RXRpUEhodEcvZXRy?=
 =?utf-8?B?UTF4dWxHRHdhQjZnbEYrWXUwQmtFMk5PYWxZVGRGRlYrN0NmQkR4MUcxajlV?=
 =?utf-8?B?Z3VvYStYejJCQVVicEJ1TlFHVzh0Tk5zQTJwUDZmSnJ0RDZQbXJaM0VkRzJI?=
 =?utf-8?B?aG8zS1RNOGQzcnBhZEV4cit5VWZrR0h5My82Z25zNnp4eHB5TDNqQkluZzZw?=
 =?utf-8?B?ZmhobnZGR3BERER4NisxTTAzWlFFcGtiR3lDSDkwSHhxNUY2bFVqVlhzbitB?=
 =?utf-8?B?YTFoSE00UkdaNitwK2Y5aStXbUpWTVJ5ZHlmUklzUGxvd0pDbVNza1c3b0Yz?=
 =?utf-8?B?MjdzVXFUK2wwUkRkZVphaG5Ja1hQbENvb3E4eWorWDhNL0YvSjk0K3BQbFcy?=
 =?utf-8?B?L05uZmQ2NHArUnJROTFXdStUNmVuM2hPSnpBYi9PT2NxZEpTcjUvTDJkWlFU?=
 =?utf-8?B?UVFQeENFWUxZVDZGWUhEUmU2eGozV3duZHA1RmltakZCZCt1ZG9OZDRHOC83?=
 =?utf-8?B?MU5RcXFpV2ZzN1MvNmw3NmlyUmxCeENaSjllSmRRWEhORUdwY0FnOGw4bGhu?=
 =?utf-8?B?MEVDTzU2YzdPUEZNSXNId1Y3QVRCZjljSVo0WFdoYi84MFM2aDNuMUdoN056?=
 =?utf-8?B?Tm9Pb2hxM215OU00aFZabGdZdmkvbUg1U3FaMVlyTEl4amU3c3lLV284WVli?=
 =?utf-8?B?VEgzVzQyenVyLzlTNU9JUW1PZE5mV2Q1b0d6NGZGV0U2aEVCOTdlMDkyU3U3?=
 =?utf-8?B?ckFURDlqUUJYM2NDMlVZUmxIc1hMSGpIQUJjMFFuTHVnMkw2V2ZoSnRiYmNi?=
 =?utf-8?B?RXgzUFR2RTkvbS8wbUlpTzMyaUxqbnNHMnpoRVZzVE4xa2sxcngvd2dubGZD?=
 =?utf-8?B?WTk3Wmc0QkkwK0t3TEFPcFZFdTlTYkF5bmZRbi85SXJ1eVJXWXJ5RlFrdTNj?=
 =?utf-8?B?ZlZVNDl2M1FKRnlTbzZGeU9FRzlxb1YxVHlwREF0bllpajJWZklyZFJYRzgw?=
 =?utf-8?B?czRDNmNJQkxxdUxDakxBdmw2d2FmS29VVGRabkRXeFIydjA4dkRhd25Nc1Rx?=
 =?utf-8?B?bFJ6aHlRclhobSsvR0RvR2tiQ1ZNWkV6MUpwSU92ZVgyTjhNWjlyMXk5eFpC?=
 =?utf-8?B?ZyswQkZMd0dpcTZIZTZpNlY0dkhrTmxJZHFQTzlYVm5oZ0FTeTZIRFpKRXln?=
 =?utf-8?B?cENjR3JZMG1OQkFOVlJqQXRzdXpiVkNQU2hJYWFrVGZtaC9PWGdSekRORFhq?=
 =?utf-8?B?b3RDcTdyK24wSUpuMVBvcWZ6UXhQRnBSakhobjhXWnlNd2Q4KzBRRVdWUllT?=
 =?utf-8?B?aVNodTZjQUNiNnd0MnIvczlUbEs2WCtoeWN6UlBnc1pFK3BuTC9oZGRvS2NM?=
 =?utf-8?B?L3RQN1pDN2FmMVUxK3NNdEJNRGhqeS93R2VyUm9hVXVsbGtkZ0VTNE1zaEN2?=
 =?utf-8?B?ZFRWSC92UU1qQ2dBL1VVMlh5T0sxZlp1U0MzcDJtL0dLOGRlZ290bGhORkR1?=
 =?utf-8?B?cEI5TlZtUXVRMnk4aENHRDd1eUJ6bGhieHYxNlJHc1pNeVRsRGIwU0ZxOVZE?=
 =?utf-8?B?Q0hhOXJGUWdIeGxNVTRNcmk1b2llbFZ4QW41T3kzajF4QzVVTWRkWUtmU3FB?=
 =?utf-8?B?bXMvWTdNTmxLNGxDUUt0emNkdHFLNDhSSlpUUU1haFdJc1cyMkx5S2dna0lq?=
 =?utf-8?B?SktvcWt6N2IvbjR0SzJhOGpkb0ZyMnRRTVNpTlNiMFVoTzhwcWd1L1NQak1S?=
 =?utf-8?Q?Lue6stCk+wKpEz2JF139YeIrO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d540be00-1f59-49e4-a16d-08ddaeeee9df
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 05:05:30.5640 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: APx2kG3Qw/QFRhCAraHmZimlKcaoXRL54bBQQulSUklvf75VfZvLBpRvoqp5agVPXInkIDWYsyOw1LTMt55mqU+O3R6ef43fqS5BSeQyQ+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9359
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

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJp
anUgRGFzDQo+IFNlbnQ6IDE4IEp1bmUgMjAyNSAxNDoyNg0KPiBTdWJqZWN0OiBSRTogW1BBVENI
IHY2IDEvNF0gY2xrOiByZW5lc2FzOiByenYyaC1jcGc6IEFkZCBzdXBwb3J0IGZvciBEU0kgY2xv
Y2tzDQo+IA0KPiBIaSBQcmFiaGFrYXIsDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4gRnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVz
a3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiA+IExhZCwgUHJhYmhha2FyDQo+ID4gU2VudDogMTYg
SnVuZSAyMDI1IDExOjQ1DQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAxLzRdIGNsazogcmVu
ZXNhczogcnp2MmgtY3BnOiBBZGQgc3VwcG9ydCBmb3INCj4gPiBEU0kgY2xvY2tzDQo+ID4NCj4g
PiBIaSBCaWp1LA0KPiA+DQo+ID4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0KPiA+DQo+ID4g
T24gRnJpLCBKdW4gMTMsIDIwMjUgYXQgNjo1N+KAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gSGkgUHJhYmhha2FyLA0KPiA+ID4N
Cj4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gRnJvbTogUHJhYmhh
a2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gPiA+ID4gU2VudDogMzAgTWF5IDIw
MjUgMTg6MTkNCj4gPiA+IC5jYXN0cm8uanpAcmVuZXNhcy5jb20+OyBQcmFiaGFrYXIgTWFoYWRl
diBMYWQgPHByYWJoYWthci5tYWhhZGV2LQ0KPiA+ID4gPiBsYWQucmpAYnAucmVuZXNhcy5jb20+
DQo+ID4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2NiAxLzRdIGNsazogcmVuZXNhczogcnp2MmgtY3Bn
OiBBZGQgc3VwcG9ydCBmb3INCj4gPiA+ID4gRFNJIGNsb2Nrcw0KPiA+ID4gPg0KPiA+ID4gPiBG
cm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5j
b20+DQo+ID4gPiA+DQo+ID4gPiA+IEFkZCBzdXBwb3J0IGZvciBQTExEU0kgYW5kIFBMTERTSSBk
aXZpZGVyIGNsb2Nrcy4NCj4gPiA+ID4NCj4gPiA+ID4gSW50cm9kdWNlIHRoZSBgcmVuZXNhcy1y
enYyaC1kc2kuaGAgaGVhZGVyIHRvIGNlbnRyYWxpemUgYW5kIHNoYXJlDQo+ID4gPiA+IFBMTERT
SS1yZWxhdGVkIGRhdGEgc3RydWN0dXJlcywgbGltaXRzLCBhbmQgYWxnb3JpdGhtcyBiZXR3ZWVu
IHRoZSBSWi9WMkggQ1BHIGFuZCBEU0kgZHJpdmVycy4NCj4gPiA+ID4NCj4gPiA+ID4gVGhlIERT
SSBQTEwgaXMgZnVuY3Rpb25hbGx5IHNpbWlsYXIgdG8gdGhlIENQRydzIFBMTERTSSwgYnV0IGhh
cw0KPiA+ID4gPiBzbGlnaHRseSBkaWZmZXJlbnQgcGFyYW1ldGVyIGxpbWl0cyBhbmQgb21pdHMg
dGhlIHByb2dyYW1tYWJsZQ0KPiA+ID4gPiBkaXZpZGVyIHByZXNlbnQgaW4gQ1BHLiBUbyBlbnN1
cmUgcHJlY2lzZSBmcmVxdWVuY3kNCj4gPiA+ID4gY2FsY3VsYXRpb25zLWVzcGVjaWFsbHkgZm9y
IG1pbGxpSHotbGV2ZWwgYWNjdXJhY3kgbmVlZGVkIGJ5IHRoZQ0KPiA+ID4gPiBEU0kgZHJpdmVy
LXRoZSBzaGFyZWQgYWxnb3JpdGhtDQo+ID4gYWxsb3dzIGJvdGggZHJpdmVycyB0byBjb21wdXRl
IFBMTCBwYXJhbWV0ZXJzIGNvbnNpc3RlbnRseSB1c2luZyB0aGUgc2FtZSBsb2dpYyBhbmQgaW5w
dXQgY2xvY2suDQo+ID4gPiA+DQo+ID4gPiA+IENvLWRldmVsb3BlZC1ieTogRmFicml6aW8gQ2Fz
dHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+DQo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29tPg0KPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyDQo+ID4gPiA+IDxwcmFiaGFrYXIubWFo
YWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiB2NS0+djY6
DQo+ID4gPiA+IC0gUmVuYW1lZCBDUEdfUExMX1NUQllfU1NDR0VOX1dFTiB0byBDUEdfUExMX1NU
QllfU1NDX0VOX1dFTg0KPiA+ID4gPiAtIFVwZGF0ZWQgQ1BHX1BMTF9DTEsxX0RJVl9LLCBDUEdf
UExMX0NMSzFfRElWX00sIGFuZA0KPiA+ID4gPiAgIENQR19QTExfQ0xLMV9ESVZfUCBtYWNyb3Mg
dG8gdXNlIEdFTk1BU0sNCj4gPiA+ID4gLSBVcGRhdGVkIHJlcS0+cmF0ZSBpbiByenYyaF9jcGdf
cGxsZHNpX2Rpdl9kZXRlcm1pbmVfcmF0ZSgpDQo+ID4gPiA+IC0gRHJvcHBlZCB0aGUgY2FzdCBp
biByenYyaF9jcGdfcGxsZHNpX2Rpdl9zZXRfcmF0ZSgpDQo+ID4gPiA+IC0gRHJvcHBlZCByenYy
aF9jcGdfcGxsZHNpX3JvdW5kX3JhdGUoKSBhbmQgaW1wbGVtZW50ZWQNCj4gPiA+ID4gICByenYy
aF9jcGdfcGxsZHNpX2RldGVybWluZV9yYXRlKCkgaW5zdGVhZA0KPiA+ID4gPiAtIE1hZGUgdXNl
IG9mIEZJRUxEX1BSRVAoKQ0KPiA+ID4gPiAtIE1vdmVkIENQR19DU0RJVjEgbWFjcm8gaW4gcGF0
Y2ggMi80DQo+ID4gPiA+IC0gRHJvcHBlZCB0d29fcG93X3MgaW4gcnp2MmhfZHNpX2dldF9wbGxf
cGFyYW1ldGVyc192YWx1ZXMoKQ0KPiA+ID4gPiAtIFVzZWQgbXVsX3UzMl91MzIoKSB3aGlsZSBj
YWxjdWxhdGluZyBvdXRwdXRfbSBhbmQgb3V0cHV0X2tfcmFuZ2UNCj4gPiA+ID4gLSBVc2VkIGRp
dl9zNjQoKSBpbnN0ZWFkIG9mIGRpdjY0X3M2NCgpIHdoaWxlIGNhbGN1bGF0aW5nDQo+ID4gPiA+
ICAgcGxsX2sNCj4gPiA+ID4gLSBVc2VkIG11bF91MzJfdTMyKCkgd2hpbGUgY2FsY3VsYXRpbmcg
ZnZjbyBhbmQgZnZjbyBjaGVja3MNCj4gPiA+ID4gLSBSb3VuZGVkIHRoZSBmaW5hbCBvdXRwdXQg
dXNpbmcgRElWX1U2NF9ST1VORF9DTE9TRVNUKCkNCj4gPiA+ID4NCj4gPiA+ID4gdjQtPnY1Og0K
PiA+ID4gPiAtIE5vIGNoYW5nZXMNCj4gPiA+ID4NCj4gPiA+ID4gdjMtPnY0Og0KPiA+ID4gPiAt
IENvcnJlY3RlZCBwYXJhbWV0ZXIgbmFtZSBpbiByenYyaF9kc2lfZ2V0X3BsbF9wYXJhbWV0ZXJz
X3ZhbHVlcygpDQo+ID4gPiA+ICAgZGVzY3JpcHRpb24gZnJlcV9taWxsaWh6DQo+ID4gPiA+DQo+
ID4gPiA+IHYyLT52MzoNCj4gPiA+ID4gLSBVcGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIGNs
YXJpZnkgdGhlIHB1cnBvc2Ugb2YgYHJlbmVzYXMtcnp2MmgtZHNpLmhgDQo+ID4gPiA+ICAgaGVh
ZGVyDQo+ID4gPiA+IC0gVXNlZCBtdWxfdTMyX3UzMigpIGluIHJ6djJoX2NwZ19wbGxkc2lfZGl2
X2RldGVybWluZV9yYXRlKCkNCj4gPiA+ID4gLSBSZXBsYWNlZCAqX21oeiB0byAqX21pbGxpaHog
Zm9yIGNsYXJpdHkNCj4gPiA+ID4gLSBVcGRhdGVkIHU2NC0+dTMyIGZvciBmdmNvIGxpbWl0cw0K
PiA+ID4gPiAtIEluaXRpYWxpemVkIHRoZSBtZW1iZXJzIGluIGRlY2xhcmF0aW9uIG9yZGVyIGZv
cg0KPiA+ID4gPiAgIFJaVjJIX0NQR19QTExfRFNJX0xJTUlUUygpIG1hY3JvDQo+ID4gPiA+IC0g
VXNlZCBjbGtfZGl2X21hc2soKSBpbiByenYyaF9jcGdfcGxsZHNpX2Rpdl9yZWNhbGNfcmF0ZSgp
DQo+ID4gPiA+IC0gUmVwbGFjZWQgYHVuc2lnbmVkIGxvbmcgbG9uZ2Agd2l0aCB1NjQNCj4gPiA+
ID4gLSBEcm9wcGVkIHJ6djJoX2NwZ19wbGxkc2lfY2xrX3JlY2FsY19yYXRlKCkgYW5kIHJldXNl
ZA0KPiA+ID4gPiAgIHJ6djJoX2NwZ19wbGxfY2xrX3JlY2FsY19yYXRlKCkgaW5zdGVhZA0KPiA+
ID4gPiAtIEluIHJ6djJoX2NwZ19wbGxkc2lfZGl2X3NldF9yYXRlKCkgZm9sbG93ZWQgdGhlIHNh
bWUgc3R5bGUNCj4gPiA+ID4gICBvZiBSTVctb3BlcmF0aW9uIGFzIGRvbmUgaW4gdGhlIG90aGVy
IGZ1bmN0aW9ucw0KPiA+ID4gPiAtIFJlbmFtZWQgcnp2MmhfY3BnX3BsbGRzaV9zZXRfcmF0ZSgp
IHRvIHJ6djJoX2NwZ19wbGxfc2V0X3JhdGUoKQ0KPiA+ID4gPiAtIERyb3BwZWQgcnp2MmhfY3Bn
X3BsbGRzaV9jbGtfcmVnaXN0ZXIoKSBhbmQgcmV1c2VkDQo+ID4gPiA+ICAgcnp2MmhfY3BnX3Bs
bF9jbGtfcmVnaXN0ZXIoKSBpbnN0ZWFkDQo+ID4gPiA+IC0gQWRkZWQgYSBnYXVyZCBpbiByZW5l
c2FzLXJ6djJoLWRzaS5oIGhlYWRlcg0KPiA+ID4gPg0KPiA+ID4gPiB2MS0+djI6DQo+ID4gPiA+
IC0gTm8gY2hhbmdlcw0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIGRyaXZlcnMvY2xrL3JlbmVzYXMv
cnp2MmgtY3BnLmMgICAgICAgfCAyNzggKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gPiA+
ID4gIGRyaXZlcnMvY2xrL3JlbmVzYXMvcnp2MmgtY3BnLmggICAgICAgfCAgMTMgKysNCj4gPiA+
ID4gIGluY2x1ZGUvbGludXgvY2xrL3JlbmVzYXMtcnp2MmgtZHNpLmggfCAyMTAgKysrKysrKysr
KysrKysrKysrKw0KPiA+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA0OTIgaW5zZXJ0aW9ucygrKSwg
OSBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlDQo+ID4gPiA+IDEwMDY0NCBpbmNsdWRlL2xpbnV4
L2Nsay9yZW5lc2FzLSByenYyaC1kc2kuaA0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9jbGsvcmVuZXNhcy9yenYyaC1jcGcuYw0KPiA+ID4gPiBiL2RyaXZlcnMvY2xrL3Jl
bmVzYXMvcnp2MmgtY3BnLmMgaW5kZXgNCj4gPiA+ID4gNzYxZGEzYmY3N2NlLi5kNTkwZjlmNDcz
NzEgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnp2MmgtY3BnLmMN
Cj4gPiA+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yenYyaC1jcGcuYw0KPiA+ID4gPiBA
QCAtMTQsOSArMTQsMTMgQEANCj4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPg0K
PiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4
L2Nsay1wcm92aWRlci5oPg0KPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2Nsay9yZW5lc2FzLXJ6
djJoLWRzaS5oPg0KPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+DQo+ID4gPiA+ICAj
aW5jbHVkZSA8bGludXgvaW5pdC5oPg0KPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5o
Pg0KPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L21hdGguaD4NCj4gPiA+DQo+ID4gPg0KPiA+ID4N
Cj4gPiA+ID4gKyAgICAgcmVxLT5yYXRlID0NCj4gPiA+ID4gKyBESVZfUk9VTkRfQ0xPU0VTVF9V
TEwoZHNpX2RpdmlkZXJzLT5mcmVxX21pbGxpaHosDQo+ID4gPiA+ICsgTUlMTEkpOw0KPiA+ID4g
PiArDQo+ID4gPiA+ICsgICAgIHJldHVybiAwOw0KPiA+ID4gPiArfTsNCj4gPiA+ID4gKw0KPiA+
ID4gPiArc3RhdGljIGludCByenYyaF9jcGdfcGxsZHNpX2Rpdl9zZXRfcmF0ZShzdHJ1Y3QgY2xr
X2h3ICpodywNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyByYXRlLA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBsb25nIHBhcmVudF9yYXRlKSB7DQo+ID4gPiA+ICsgICAgIHN0
cnVjdCByenYyaF9wbGxkc2lfZGl2X2NsayAqZHNpX2RpdiA9IHRvX3BsbGRzaV9kaXZfY2xrKGh3
KTsNCj4gPiA+ID4gKyAgICAgc3RydWN0IHJ6djJoX2NwZ19wcml2ICpwcml2ID0gZHNpX2Rpdi0+
cHJpdjsNCj4gPiA+ID4gKyAgICAgc3RydWN0IHJ6djJoX3BsbGRzaV9wYXJhbWV0ZXJzICpkc2lf
ZGl2aWRlcnMgPSAmcHJpdi0+cGxsZHNpX2Rpdl9wYXJhbWV0ZXJzOw0KPiA+ID4gPiArICAgICBz
dHJ1Y3QgZGRpdiBkZGl2ID0gZHNpX2Rpdi0+ZGRpdjsNCj4gPiA+ID4gKyAgICAgY29uc3Qgc3Ry
dWN0IGNsa19kaXZfdGFibGUgKmNsa3Q7DQo+ID4gPiA+ICsgICAgIGJvb2wgZGl2X2ZvdW5kID0g
ZmFsc2U7DQo+ID4gPiA+ICsgICAgIHUzMiB2YWwsIHNoaWZ0LCBkaXY7DQo+ID4gPiA+ICsNCj4g
PiA+ID4gKyAgICAgZGl2ID0gZHNpX2RpdmlkZXJzLT5jc2RpdjsNCj4gPiA+ID4gKyAgICAgZm9y
IChjbGt0ID0gZHNpX2Rpdi0+ZHRhYmxlOyBjbGt0LT5kaXY7IGNsa3QrKykgew0KPiA+ID4gPiAr
ICAgICAgICAgICAgIGlmIChjbGt0LT5kaXYgPT0gZGl2KSB7DQo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBkaXZfZm91bmQgPSB0cnVlOw0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgYnJlYWs7DQo+ID4gPiA+ICsgICAgICAgICAgICAgfQ0KPiA+ID4gPiArICAgICB9DQo+ID4g
PiA+ICsNCj4gPiA+ID4gKyAgICAgaWYgKCFkaXZfZm91bmQpDQo+ID4gPiA+ICsgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gPg0KPiA+ID4gVGhpcyBjaGVjayBjYW4gYmUgZG9uZSBp
biBkZXRlcm1pbmUgcmF0ZSBhbmQgY2FjaGUgdGhlIGRpdmlkZXI/Pw0KPiA+ID4NCj4gPiBPaywg
SSdsbCBkcm9wIHRoaXMgY2hlY2sgYXMgdGhlIGRpdmlkZXIgaXMgYWxyZWFkeSBjYWNoZWQuIFRo
ZSBmb3INCj4gPiBsb29wIGFib3ZlIGlzIHRvIGRldGVybWluZSB0aGUgdmFsIHdoaWNoIGlzIHVz
ZWQgYmVsb3cgdG8gcHJvZ3JhbSB0aGUgcmVnaXN0ZXJzLg0KPiANCj4gSWYgeW91IGFyZSBjYWNo
aW5nIGFjdHVhbCBkaXZpZGVyIHZhbHVlLCB0aGVuIHRoZSBjaGVjayBpcyBub3QgcmVxdWlyZWQg
aGVyZS4NCj4gT3RoZXJ3aXNlIHRoZSBhYm92ZSBjb2RlIGlzIGZpbmUuDQo+IA0KPiBBc3N1bWUg
dGhlIGNzZGl2IHlvdSBmb3VuZCwgaGF2ZSBubyBjb3JyZXNwb25kaW5nIG1hdGNoIGluIHRoZSB0
YWJsZS4NCg0KDQoxKSBCeSBsb29raW5nIGF0IFJaL0czRSwgY2FuIHdlIG1ha2UgdGhpcyBjb2Rl
IG1vcmUgc2NhbGFibGU/DQoNClJaL0czRSBoYXMgMiBQTEwtRFNJJ3MNClBMTC1EU0kxIHN1cHBv
cnRzIERVQUwgTFZEUywgU2luZ2xlIExWRFMgYW5kIERTSQ0KUExMLURTSTIgc3VwcG9ydHMgc2lu
Z2xlIExWRFMsICBEUEkgYW5kIERTSQ0KDQpJbiB0b3RhbCB0aGVyZSB3aWxsIGJlIDQgbGltaXQg
dGFibGVzIChEU0ksIHNpbmdsZSBMVkRTLCBEdWFsIExWRFMgYW5kIERQSSkNCg0KQmFzZWQgb24g
dGhlIGRpc3BsYXkgb3V0cHV0LCBlYWNoIFBMTCBuZWVkcyB0byBwaWNrIHRoZSBhcHByb3ByaWF0
ZSBsaW1pdCB0YWJsZQ0KdG8gY29tcHV0ZSBQTEwgcGFyYW1ldGVycy4NCg0KMikgQ2FuIHdlIGRy
b3AgRFNJIGRpdmlkZXIgbGltaXRzIGZyb20gdGhlIGxpbWl0IHRhYmxlIGFuZCB1c2UgdGhlIHZh
bHVlcyBmcm9tIGRzaSBkaXZpZGVyIHRhYmxlDQogICBpdHNlbGYgd2hpY2ggaXMgcGFzc2VkIGlu
IERFRl9QTExEU0lfRElWPw0KDQpOb3RlOg0KDQpMVkRTIGRvZXMgbm90IHVzZSBEU0kgZGl2aWRl
cnMgYXMgaXQgaXMgY29ubmVjdGVkIHRvIGEgTXV4IGFuZCBhbHdheXMgaGFzIGZpeGVkIERpdmlk
ZXIgNy4NCg0KRFBJIHVzZXMgdGhlIERTSSBkaXZpZGVyIHdpdGhvdXQgYW55IGNvbnN0cmFpbnRz
IGxpa2UgRFNJDQoNClZpZGVvIGNsb2NrIGFuZCBEU0kgSFMgQnl0ZSBjbG9jayBtdXN0IGZvbGxv
dyB0aGUgcmVsYXRpb25zaGlwLg0KVmlkZW8gY2xvY2sgRnJlcXVlbmN5IFtIel0gw5cgVmlkZW8g
UGl4ZWwgQml0IERlcHRoIFtiaXRdDQo8PSBEU0kgSFMgQnl0ZSBjbG9jayBGcmVxdWVuY3kgW0h6
XSDDlyA4IFtiaXRdIMOXIE51bWJlciBvZiBEU0kgSFMgRGF0YSBMYW5lDQoNCg0KQ2hlZXJzLA0K
QmlqdQ0KDQoNCg0K
