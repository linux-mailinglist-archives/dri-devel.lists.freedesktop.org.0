Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 574F1ADEF0D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B08C10E2A0;
	Wed, 18 Jun 2025 14:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kqAAtn/a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C8410E2A0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 14:19:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjBwcyyVjemdZNEJBqngsGIbeExoMwSX7hnwxjhxDVhIayJgmFo+zU67XWvBaMEw/7lOf/WXEYTWER/wVlFERHxhOd60Cenq5/c6t+Z5IkUyk58B9+CQixRaCSRXa5kG33oR4KWLJ6FUWJe10hwU3/ibBbALc7Sm3a8IpcNNsRf4+oTxYBNRrmGVbLC5H6LdH/67B5U7oSRI/YGatEwz9yhz7fOwXPfQmO1nUIg+CEY0xO0KcBUwZECr9ryY8Q/1J8KXm9XLMT+KlSHJg42moUTohCSFcZmCnb0SCqnCwfNKPJRipB6TxypNHHSkNjFZ45nJBnCiQTgi7Buh1nBWog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZUVnGfy1+yUdu/fPweXtVQDY3MI87eoPxUSRxfGejo=;
 b=l0kdDmRgsAc/npvqg7mi4SvxgoXMlti/eW8G6OvdIDhzUkHvlYACQx4pbAcSqXwBmVTksE9aIB7kusfzHeBwn6NNwzT0mZieklPvOKFXZ2Fj+XOTu15048QWtQ9Nl8GAq+9u0QNGywkW4UlrCKR6/XCqEtHyWKn5UFogX0qvVCKqzrGHEIxTVNNK3Y7Zg2XqNEgxknm3JvmholoOKKTFBeFcuZzl3LBpcqHufeSyQx7Och93JgRluW3xyHjbyyCVkdhr/Wo6cUucwhZYV0WvBE3CossQUMc0hufJvgGR7Uux6DKdZfbHFG5Iu0D16JCDHME1yCihK4nHj+wiDaYYwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZUVnGfy1+yUdu/fPweXtVQDY3MI87eoPxUSRxfGejo=;
 b=kqAAtn/aWshU7cKrUDHtOE1QUoVaNzw5NxIEBLAXv+uphDN+2RHXPhDb4zLAhJ7xdBN3nWLX0DvskaOgMO3hudOBgZJ6MB63Dy7Z0qpNasqbgrUCDuHPekdJW+CVFvjD96Kraoi6SLPPRTtqNvQL9TtXfohX0qPtwQdsya0Xm7Y=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB15007.jpnprd01.prod.outlook.com (2603:1096:604:39a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 14:19:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 14:19:04 +0000
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
Thread-Index: AQHb0YbxoLXThBVJyEq0KQgkc6A6OrQAr/1QgAUFOYCAAABy8IAACLuAgANUVpA=
Date: Wed, 18 Jun 2025 14:19:04 +0000
Message-ID: <TY3PR01MB11346C8A09D89D59ED10B8A708672A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530171841.423274-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346A62FDF84C5F2C1240BBF8677A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sZfTgOENXfR2NnykgjGHd+2-vS9Jk-dNLWTVQyAGbQTw@mail.gmail.com>
 <TYCPR01MB11332F40696148C7216866D3B8670A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CA+V-a8tKm4yjEG_ZbajXcgTdOB=GxqA=kt63svJ4ZF609tXHDA@mail.gmail.com>
In-Reply-To: <CA+V-a8tKm4yjEG_ZbajXcgTdOB=GxqA=kt63svJ4ZF609tXHDA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB15007:EE_
x-ms-office365-filtering-correlation-id: 72ebae67-b4ca-4802-589d-08ddae73145a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Q2xRcDFXWlUvaWdoZGJaT1F6NVJCTXFpVTNNakZvYUR4VzNrUFRiQWNMZFVL?=
 =?utf-8?B?dUt0YldKYVMrRmFUaFloMFIwVFB3ZGtlWnBLZDRVU055Szd2RU8xcFppQXRK?=
 =?utf-8?B?VmlWd1c4UVUza1gxVWRJS3R2WExraDVsa3BnRnBlMUxFRkhZVHYxS2FWY0c1?=
 =?utf-8?B?K1pyaDNCSGRUNFUzYjRMUXF6bEZCQ2gxNTFyTlZUeVhXNzRSK0lUeVF5eEN6?=
 =?utf-8?B?SWs2Mzk2L2x2SmZvL3FjYWluZDlZdFI2Ymp1bWxzdW1TellDcEhFWm9qUi9t?=
 =?utf-8?B?OGhsZkc5TlRna0ZKUXk0SnhnSFZlV205dVdPdmZWR01rNmJ6UXpHR245M1Fv?=
 =?utf-8?B?ZGc0SnVoemNiaS8zb1FHR2RYOFpaOVV1N3ROZWJ6Q2ZaclJTdVV1RjMvYlJR?=
 =?utf-8?B?RkQxVERUaVZMQmlqcU1DQ1FQdXZOWjhWaU0zcFJRVGpxNzkxZVg2bHJrZm02?=
 =?utf-8?B?T040N0VjTkZVRDloN3R6Q1FjeXU1R0lkeVJvak1CeG0wMVU0T1ZNRDUybWdX?=
 =?utf-8?B?QlJHaVlOUnNocnBQS1ltamJEWE8xbXdPYmdKRSsweDkyNkRQa3RoMlVEWXRL?=
 =?utf-8?B?dTFQMWRYbTVwQWkzTm9xZGVFWkkrZGUvVW5GcEZFYnFybTIyTHU1R1RuUEFj?=
 =?utf-8?B?ODU5NHFsMVZ1ckY2VXFlNHVqU1RzQUJza2o4VElpWmdEVFZZQzNXcVNvUjJ2?=
 =?utf-8?B?SGVTaWRVMDR1cnNHYUhLWi9yVXFuR2hWSUpTM3pMTXp2L3VVZWdlMThhbkZT?=
 =?utf-8?B?QTFUMFRScTJQMXkvaUkxM01GVHgwUUJlUFZBamJ5eFNyOHJybENaYWc1blhS?=
 =?utf-8?B?Sm1UenhDZEQ3V1c4dWZwYktIZWhad2RDZXE3YzlmeXlkenY5cWhucnVsUHNP?=
 =?utf-8?B?TmVQbmMwSm5CRUh2aks5dEc1QitaZmplcWQzRm0wMmh1cCsvRmt5VjN5UEVI?=
 =?utf-8?B?bkxIR1BPVnZGOG43OTB4dEMwdGF4dXlia1FVSWhueUNBc1pzRDFicmJKc3Jj?=
 =?utf-8?B?dkdxQWZ3amZEZ1FQbEhsRGo0SnhEZnpYclhzYllmM0ZtaFRHd283b1ZqaWh2?=
 =?utf-8?B?US96NzZuMVhPcUlLd0pHV3M5aW5zTHA3ZG5HNmxuU3hzSGxhZExDUnZncnFK?=
 =?utf-8?B?U3Z5SnhjSUxsTEwzRWlLZkt4TEt2ZGQ4Sy9STWRaZkJFcFgvMHVzckYyRUc5?=
 =?utf-8?B?N3QxNVRyamUxK3NaNDA2bzFNNWhSZkEzUVZ3bkhpVFU3OGNuV3NnUEgwWFFO?=
 =?utf-8?B?UGxpOHpuME1MTE01M0VNM2dmOVMzNEYrZnUrRmFwb0JHNDdRZmtrVDhBdmlU?=
 =?utf-8?B?bXBwRUpIOVpnMWJWdmFXUW83Z25nVW50S1ZFUUpZcXFjUEFtUFRuSWlnS2VG?=
 =?utf-8?B?TXA4ZTVySTBKZTVVSmZqb0Z1T0VaNVJTbWZZYUVOZG0xQ2UrNHJ3ZG5LVGtw?=
 =?utf-8?B?UDRKSFovYkNVNFpTQk5JQVk2WUhkNWQ0WlJDaGc1Ykkyc3VIaERBOUMzSEQv?=
 =?utf-8?B?VmkxOC9CczBDYldSTitxTlNRZWxpTk9XNzU5VitWbGQ0cGlkUXliWXpxUERH?=
 =?utf-8?B?WC9oTVVtL2h6UGhhYVhOUXUwaHZCcjh3VHNLdVhWVXNrWUJkTWp4RktiZXpv?=
 =?utf-8?B?aGhnOVcxNHVPNzRZcm5mK3h3MkwrK2hjR1BzY1JHSHlpRkFQTVo1eW5ubS9K?=
 =?utf-8?B?QU84YUFFS3FyektoRVlHN1F6OTU5Y1pFS0haVkZoVDhDQXpsdGQ4blE4VWxz?=
 =?utf-8?B?VmZIeDVxRURpWk05TDVONTN2VENzZGZTaVZEWmFaV2p5S3ZNdlpkQ3A2M0o1?=
 =?utf-8?B?ZW1UQWJTSFBzTjFLVnlIVyswYXZxODN4YXJkSENvRGkyZnk5c1k0cGlVaFlr?=
 =?utf-8?B?eUFBR2ttRmlpYzlrRVRYRnBOS0RlSUVFQjUzVjdMTWczamhKUUNGRyt4NG9u?=
 =?utf-8?B?SVlod04wNVM4ZFVRaUp3SndBYlpqSkZHZUdsTlIyZ0c1N3NoWFBidHBPK25D?=
 =?utf-8?B?UjYvNVFPUHRBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVpYMlplcWdxb1pIOTY4d0pYL3BoMUNvNmFJOFRqUERiQWRQWG9IUDd4T3dQ?=
 =?utf-8?B?TGRaNDh1YndFMlpLcHBwMjJ1QTNpZXNCdWljWXJSYnhKRDIvMGpocGY0Tmwy?=
 =?utf-8?B?Y2lVaDZkS213R0llYmVFZG1JZEU2ZDJucG12ajNlZUdwc25acmZQYTBaUXJn?=
 =?utf-8?B?emZkYWtDSHo4SkllejRLVWZmcENVbXhFVEtkSytoK1VONS8wL2RiSkI1ZGMv?=
 =?utf-8?B?UVZmYUEzMXdBWGNuRnlTeG9FbU42Zm5ib3ZGOUpkYU9VRnpwbXlqbCtCNGt3?=
 =?utf-8?B?NFBmM0xrbnhEZGpzVXFxRzBkcnc4cnR6c2owNzROZlFYQjFMYVhtbEc0RXpL?=
 =?utf-8?B?K3hjWXA0MmR1VERKTGM4R0I3Wk5tUERPb3JOQUpyMFNxR2Zhb0lJTEsxTWZF?=
 =?utf-8?B?OGxkdGpoODVwbGJON0dEUjdvR1QvN0tYZ1Bua3hwaG5nOUYzVy9NVm04RGg1?=
 =?utf-8?B?aXI0dFUzVDd3Ny9JcVRoSlIrTWo5UVJEdGJHK1BhUHB3M25OdHM1ZyswTTJS?=
 =?utf-8?B?clRXY3k2MlY0TmdkL1hXUWo3MlY1aGx0TitUb0M5eisyQllsZnp3M1FsbE5q?=
 =?utf-8?B?am0wayt2eUxZRVVlTWJjdjQ3YUhtejdNN0hFTWJ2L243QlRFL1ZxaWFTdDIx?=
 =?utf-8?B?QWo5VHpsTGJMQXV6ZHFKbzNxaDR6Vk1meTdEclRneWhnNDZjbWI3WFh2R1BM?=
 =?utf-8?B?TkV0SHE2eTFFdWQwOW5hbkxXbzQvN0lmaEw1L0RtSWVtWmhIeWRXamVqS3Fo?=
 =?utf-8?B?Ny8rY3Z2U2pkRlk3bWdKVjROenhyODV2NXhQcVUwcHYrcGpmWlROVVcxNzBq?=
 =?utf-8?B?ZFlMZWp1TmRZYjVjbUdybURCcUlDN2xnTWVMeXJsc0VsMERtVjBSMlpkenha?=
 =?utf-8?B?WjB1TS9WT3BCWEVmWEloTnBxRDdEQlNVd0NXL0dpQ0I3SjRPUlE4UlExVE5k?=
 =?utf-8?B?SXp1bERRcTA3YzEzeFkzUy9uZFdwQ0E0ZS9VYkdIWDFyZGtKUEk1VTJCazVz?=
 =?utf-8?B?TlZldDcvdFNNbklFMGFRenVlQ2V2L2pSeGUwLzlFalh3bmRQZC9lN2pNNFM5?=
 =?utf-8?B?N0xuQm40L2JUWDFQaVlCOXpTR0JQOVFReTNQR3pmclp5SVRVcUFGY01oSFE3?=
 =?utf-8?B?NW1nakcrZWNBVUNsWEx5K3RuYU9GK1dJTGgzR2hSUHRKYTVGOXJOcFM2Rysv?=
 =?utf-8?B?bWxjWnFuYUlReW5MclcwWktScmlUUHJLNGRiL1NkR3dBRmpNL0ZRVmxxaXd6?=
 =?utf-8?B?SHdIeVpxTlNHaDdwTmVzS1M3WDRQekFxY2tKS2VmQkgwVnY1MTlLU1pGYy9E?=
 =?utf-8?B?MEFwcEtZcS9vdUswOUFLdk9BK0x6U0dOV09sOXdqUm54UzhQY00xK2ZWVW1u?=
 =?utf-8?B?a3RFZVRUcTB0cGRSNlpsQTJ1MGFPZG5KQmJDOEFVdURqSC80b0R0K3hody9s?=
 =?utf-8?B?MjJpZnlNcXg4bHVXUFZ0MXlRZ1lpRm0wd3g2RDF5aHU1ME93UU14L2pPbXBr?=
 =?utf-8?B?YnpTREV3TStXN2FrT3p6by83NHVPRW9QQ3k2a2ovaiszMGhnRjhaK2QrMUNw?=
 =?utf-8?B?Um4rZ1UreldBVXZ3V25uQmJPWVlKMXN2eWlvb0Y5TlB0amVHbGMrNkhLRDNa?=
 =?utf-8?B?RkNWck5LUEg3dDcrcU8wdzQ1QUhKd0pNZGJ2bTdKQmdNVm1hRWdCb1ZsZGEw?=
 =?utf-8?B?cis4SFBFd29VTXFERTJ0NFp3a1JiWU5VYmJJMmorazZEa0dvQWxrNFZWZkJC?=
 =?utf-8?B?Qk05MVF0ZGZLVysrVFFNbENHRXcwVG5nS3hxR2pGM01qb2JUNVhuQjNBZjd2?=
 =?utf-8?B?Z2V5WjZHemxHN3M0bzdMZzFiWEtYTzJhck5OTGlEelA0eWFYY3ZySDBKeEh1?=
 =?utf-8?B?c282U0dsTEFUN2NiWkVIc3lZcXJZSXhHdEJqMURrUndVR3V3cEpnL1B0RmR6?=
 =?utf-8?B?eGVVSEZkT3BvSXRIb2xYRGFDdysvN3ZyUlU1cW5HSTRvYzNDa29yUUNVVUxP?=
 =?utf-8?B?WWlGR01heXZUNklVM2hIYlQxUkE2ZVdMWTRIbS81K2VrTkgxRG1PcG5MVklm?=
 =?utf-8?B?eDdHZThhSzIySmFLZVJZSERlQXZoNGxOOE5kS1pzM3hZay9kZDdpbjh2aWJW?=
 =?utf-8?Q?M8ajOTdberGWFEUHKJCtSZcwk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ebae67-b4ca-4802-589d-08ddae73145a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 14:19:04.1864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qhB47gR99dREb/q28r7Zt83sHpRZ2cfB82WRDGhR2JmxCrMnTOhj/W78CBpWNs2/KCUgGmGz3QsqffmiXMnS6nHEqOulwhJzJPeEzW5cKLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15007
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

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGRy
aS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhh
bGYgT2YgTGFkLCBQcmFiaGFrYXINCj4gU2VudDogMTYgSnVuZSAyMDI1IDEyOjIxDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjYgNC80XSBkcm06IHJlbmVzYXM6IHJ6LWR1OiBtaXBpX2RzaTogQWRk
IHN1cHBvcnQgZm9yIFJaL1YySChQKSBTb0MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24s
IEp1biAxNiwgMjAyNSBhdCAxMTo1NOKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gRnJvbTogTGFkLCBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21h
aWwuY29tPg0KPiA+ID4gU2VudDogTW9uZGF5LCBKdW5lIDE2LCAyMDI1IDExOjQ4IEFNDQo+ID4g
PiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gQ2M6IEdl
ZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBBbmRyemVqIEhhamRh
DQo+ID4gPiA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+OyBOZWlsIEFybXN0cm9uZw0KPiA+ID4g
PG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+OyBSb2JlcnQgRm9zcyA8cmZvc3NAa2VybmVsLm9y
Zz47DQo+ID4gPiBsYXVyZW50LnBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+OyBKb25hcyBLYXJsbWFuDQo+ID4gPiA8am9uYXNAa3dpYm9vLnNlPjsgSmVybmVqIFNr
cmFiZWMgPGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT47DQo+ID4gPiBNYWFydGVuIExhbmtob3Jz
dCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZA0KPiA+
ID4gPG1yaXBhcmRAa2VybmVsLm9yZz47IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPjsgRGF2aWQNCj4gPiA+IEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+OyBTaW1vbmEg
VmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+OyBSb2INCj4gPiA+IEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz47IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47DQo+ID4gPiBD
b25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBNaWNoYWVsIFR1cnF1ZXR0ZQ0KPiA+
ID4gPG10dXJxdWV0dGVAYmF5bGlicmUuY29tPjsgU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwu
b3JnPjsgTWFnbnVzDQo+ID4gPiBEYW1tIDxtYWdudXMuZGFtbUBnbWFpbC5jb20+OyBkcmktIGRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gPiA+IGRldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnOyBsaW51eC0ga2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gPiA+IGxpbnV4LXJlbmVzYXMt
c29jQHZnZXIua2VybmVsLm9yZzsgbGludXgtIGNsa0B2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBG
YWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT47IFByYWJoYWth
ciBNYWhhZGV2DQo+ID4gPiBMYWQgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2Fz
LmNvbT4NCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgNC80XSBkcm06IHJlbmVzYXM6IHJ6
LWR1OiBtaXBpX2RzaTogQWRkDQo+ID4gPiBzdXBwb3J0IGZvcg0KPiA+ID4gUlovVjJIKFApIFNv
Qw0KPiA+ID4NCj4gPiA+IEhpIEJpanUsDQo+ID4gPg0KPiA+ID4gVGhhbmsgeW91IGZvciB0aGUg
cmV2aWV3Lg0KPiA+ID4NCj4gPiA+IE9uIEZyaSwgSnVuIDEzLCAyMDI1IGF0IDc6MTfigK9BTSBC
aWp1IERhcw0KPiA+ID4gPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gd3JvdGU6
DQo+ID4gPiA+DQo+ID4gPiA+IEhpIFByYWJoYWthciwNCj4gPiA+ID4NCj4gPiA+ID4gPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+IEZyb206IFByYWJoYWthciA8cHJhYmhh
a2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+ID4gPiA+ID4gU2VudDogMzAgTWF5IDIwMjUgMTg6MTkN
Cj4gPiA+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggdjYgNC80XSBkcm06IHJlbmVzYXM6IHJ6LWR1OiBt
aXBpX2RzaTogQWRkDQo+ID4gPiA+ID4gc3VwcG9ydCBmb3IgUlovVjJIKFApIFNvQw0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFk
LnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gQWRkIERTSSBzdXBwb3J0
IGZvciBSZW5lc2FzIFJaL1YySChQKSBTb0MuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBDby1kZXZl
bG9wZWQtYnk6IEZhYnJpemlvIENhc3Rybw0KPiA+ID4gPiA+IDxmYWJyaXppby5jYXN0cm8uanpA
cmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxm
YWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
TGFkIFByYWJoYWthcg0KPiA+ID4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gdjUtPnY2Og0KPiA+ID4gPiA+IC0g
TWFkZSB1c2Ugb2YgR0VOTUFTSygpIG1hY3JvIGZvciBQTExDTEtTRVQwUl9QTExfKiwNCj4gPiA+
ID4gPiAgIFBIWVRDTEtTRVRSXyogYW5kIFBIWVRIU1NFVFJfKiBtYWNyb3MuDQo+ID4gPiA+ID4g
LSBSZXBsYWNlZCAxMDAwMDAwMFVMIHdpdGggMTAgKiBNRUdBDQo+ID4gPiA+ID4gLSBSZW5hbWVk
IG1vZGVfZnJlcV9oeiB0byBtb2RlX2ZyZXFfa2h6IGluIHJ6djJoX2RzaV9tb2RlX2NhbGMNCj4g
PiA+ID4gPiAtIFJlcGxhY2VkIGBpIC09IDE7YCB3aXRoIGBpLS07YA0KPiA+ID4gPiA+IC0gUmVu
YW1lZCBSWlYySF9NSVBJX0RQSFlfRk9VVF9NSU5fSU5fTUVHQSB0bw0KPiA+ID4gPiA+ICAgUlpW
MkhfTUlQSV9EUEhZX0ZPVVRfTUlOX0lOX01IWiBhbmQNCj4gPiA+ID4gPiAgIFJaVjJIX01JUElf
RFBIWV9GT1VUX01BWF9JTl9NRUdBIHRvDQo+ID4gPiA+ID4gICBSWlYySF9NSVBJX0RQSFlfRk9V
VF9NQVhfSU5fTUhaLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gdjQtPnY1Og0KPiA+ID4gPiA+IC0g
Tm8gY2hhbmdlcw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gdjMtPnY0DQo+ID4gPiA+ID4gLSBJbiBy
enYyaF9kcGh5X2ZpbmRfdWxwc2V4aXQoKSBtYWRlIHRoZSBhcnJheSBzdGF0aWMgY29uc3QuDQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiB2Mi0+djM6DQo+ID4gPiA+ID4gLSBTaW1wbGlmZWQgVjJIIERT
SSB0aW1pbmdzIGFycmF5IHRvIHNhdmUgc3BhY2UNCj4gPiA+ID4gPiAtIFN3aXRjaGVkIHRvIHVz
ZSBmc2xlZXAoKSBpbnN0ZWFkIG9mIHVkZWxheSgpDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiB2MS0+
djI6DQo+ID4gPiA+ID4gLSBEcm9wcGVkIHVudXNlZCBtYWNyb3MNCj4gPiA+ID4gPiAtIEFkZGVk
IG1pc3NpbmcgTFBDTEsgZmxhZyB0byByenYyaCBpbmZvDQo+ID4gPiA+ID4gLS0tDQo+ID4gPiA+
ID4gIC4uLi9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfbWlwaV9kc2kuYyAgICB8IDM0NQ0K
PiA+ID4gKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ID4gIC4uLi9kcm0vcmVuZXNhcy9yei1k
dS9yemcybF9taXBpX2RzaV9yZWdzLmggICB8ICAzNCArKw0KPiA+ID4gPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDM3OSBpbnNlcnRpb25zKCspDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfbWlwaV9kc2kuYw0KPiA+ID4g
PiA+IGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotIGR1L3J6ZzJsX21pcGlfZHNpLmMgaW5k
ZXgNCj4gPiA+ID4gPiBhMzFmOWI2YWE5MjAuLmVhNTU0Y2VkNjcxMyAxMDA2NDQNCj4gPiA+ID4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9taXBpX2RzaS5jDQo+
ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfbWlwaV9k
c2kuYw0KPiA+ID4gPiA+IEBAIC01LDYgKzUsNyBAQA0KPiA+ID4gPiA+ICAgKiBDb3B5cmlnaHQg
KEMpIDIwMjIgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3Jwb3JhdGlvbg0KPiA+ID4gPiA+ICAgKi8N
Cj4gPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiA+ID4gPiA+ICsjaW5jbHVkZSA8
bGludXgvY2xrL3JlbmVzYXMtcnp2MmgtZHNpLmg+DQo+ID4gPiA+ID4gICNpbmNsdWRlIDxsaW51
eC9kZWxheS5oPg0KPiA+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvaW8uaD4NCj4gPiA+ID4gPiAg
I2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPg0KPiA+ID4gPHNuaXA+DQo+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ICtzdGF0aWMgaW50IHJ6djJoX2RwaHlfY29uZl9jbGtzKHN0cnVjdCByemcybF9taXBp
X2RzaSAqZHNpLA0KPiA+ID4gPiA+ICt1bnNpZ25lZA0KPiA+ID4gbG9uZyBtb2RlX2ZyZXEsDQo+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTY0ICpoc2ZyZXFfbWlsbGlo
eikgew0KPiA+ID4gPiA+ICsgICAgIHN0cnVjdCByenYyaF9wbGxkc2lfcGFyYW1ldGVycyAqZHNp
X3BhcmFtZXRlcnMgPSAmZHNpLQ0KPiA+ID4gPmRzaV9wYXJhbWV0ZXJzOw0KPiA+ID4gPiA+ICsg
ICAgIHVuc2lnbmVkIGxvbmcgc3RhdHVzOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArICAgICBp
ZiAoZHNpLT5tb2RlX2NhbGMubW9kZV9mcmVxX2toeiAhPSBtb2RlX2ZyZXEpIHsNCj4gPiA+ID4g
PiArICAgICAgICAgICAgIHN0YXR1cyA9IHJ6djJoX2RwaHlfbW9kZV9jbGtfY2hlY2soZHNpLCBt
b2RlX2ZyZXEpOw0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgaWYgKHN0YXR1cyAhPSBNT0RFX09L
KSB7DQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZHNpLT5kZXYsICJO
byBQTEwgcGFyYW1ldGVycyBmb3VuZA0KPiA+ID4gPiA+ICsgZm9yDQo+ID4gPiBtb2RlIGNsayAl
bHVcbiIsDQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbW9kZV9mcmVx
KTsNCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4g
PiA+ID4gKyAgICAgICAgICAgICB9DQo+ID4gPiA+ID4gKyAgICAgfQ0KPiA+ID4gPiA+ICsNCj4g
PiA+ID4gPiArICAgICBjbGtfc2V0X3JhdGUoZHNpLT52Y2xrLCBkc2ktPm1vZGVfY2FsYy5tb2Rl
X2ZyZXFfaHopOw0KPiA+ID4gPg0KPiA+ID4gPiBOb3Qgc3VyZSwgQ2FuIHdlIHVzZSB0aGUgRFNJ
IGRpdmlkZXIgcmVxdWlyZWQgYmFzZWQgb24gdGhlIGRhdGENCj4gPiA+ID4gcmF0ZSAodmNsaywg
YnBwIGFuZCBudW1sYW5lcykgaGVyZQ0KPiA+ID4gPg0KPiA+ID4gPiBhbmQgdGhlbiB0aGUgc2V0
IHBhcmVudCBjbGsgb2YgUExMRFNJIGFzIHdlbGwgaGVyZSAoZHNpLT52Y2xrICoNCj4gPiA+ID4g
dGhlDQo+ID4gPiBkaXZpZGVyIHZhbHVlKSA/Pw0KPiA+ID4gPg0KPiA+ID4gPiAyNE1IWi0+UExM
IERTSS0+RFNJIERJVklERVItPlZDTE9DSw0KPiA+ID4gPg0KPiA+ID4gPiBNYXliZSB0aGVuIHRo
ZSBjbG9jayBmcmFtZXdvcmsgaGFzIGFsbCB0aGUgaW5mb3JtYXRpb24gZm9yIHNldHRpbmcNCj4g
PiA+IFBMTF9EU0kgYW5kIERTSV9ESVZJREVSIGNsa3M/Pw0KPiA+ID4gPg0KPiA+ID4gQ2FuIHlv
dSBwbGVhc2UgZWxhYm9yYXRlIGhlcmUgd2l0aCBhIGRldGFpbGVkIGV4YW1wbGUuDQo+ID4NCj4g
PiBUaGVyZSB3aWxsIGJlIGRldGVybWluZV9jbGsgZm9sbG93ZWQgYnkgc2V0X2Nsb2NrIGZvciBz
ZXR0aW5nIG5ldyByYXRlDQo+ID4gZm9yIFBMTCBEU0koZHNpLT52Y2xrICogdGhlIGRpdmlkZXIg
dmFsdWUpIEZvciBlZzogIHZjbGtfbWF4ID0gMTg3LjUNCj4gPiBNSHosIERTSSBEaXZpZGVyIHJl
cXVpcmVkID0gMTYgVGhlbiBzZXQgUExMX0RTSSA9IDE4Ny41ICogMTYgTUh6IHVzaW5nIGNsa19z
ZXQuDQo+ID4NCj4gWW91IG1lYW4gdG8gdXNlIGBjbGtfc2V0X3JhdGUoZHNpLT52Y2xrLCAoY2xr
X2dldF9yYXRlKGRzaS0+dmNsaykgKiBkc2lfZGl2aWRlcikpO2AgPw0KDQpXaGF0IEkgbWVhbnQg
aXMNCmRzaV9kaXZfY2xrID0gY2xrX2dldF9wYXJlbnQoZHNpLT52Y2xrKTsNCnBsbF9kc2lfY2xr
ID0gY2xrX2dldF9wYXJlbnQoZHNpX2Rpdl9jbGspOw0KDQpjbGtfc2V0X3JhdGUocGxsX2RzaV9j
bGssIGRzaS0+bW9kZV9jYWxjLm1vZGVfZnJlcV9oeiAqIGRzaV9kaXZpZGVyKSk7YA0KY2xrX3Nl
dF9yYXRlKGRzaS0+dmNsaywgZHNpLT5tb2RlX2NhbGMubW9kZV9mcmVxX2h6KTsNCg0KV2l0aCB0
aGlzIHlvdSB3aWxsIGdldCwgZGl2aWRlci9wbGwgIHJlcXVpcmVkIGluIGRzaV9kaXZpZGVyX2Ns
ayBhbmQgcGxsX2RzaV9jbGs/Pw0KDQpDaGVlcnMsDQpCaWp1DQo=
