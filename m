Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B55B53553
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 16:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F8A10EB47;
	Thu, 11 Sep 2025 14:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZYgtspXS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2085.outbound.protection.outlook.com [40.107.114.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C8410EB47
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:30:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fm41EJdKAI7Mo4/kdyteYk75BCB/P7888k2m7/FCtOK1WraH7cWKvpzsXkSjrihMn0K/tbisAejlo4pRUvJMYF2mPBqM/Cnh5oahB5jM5+gw/e3cAg6m7pVCe1dAiooKyWe+wEdJ8dzDD4HMUjPyaMhII/xExWt1Jq/sC9XKbPPY1MKbAX/uPetCv+qYJa76he5mMgPZRJ2RYhYts0k1wbGFxgDh2MVQ3NpPQ4F3YJSScaUIgdXV09QG4HNIvnslHssjKaKwhUvkAJcr/WrWT5R6+tTfBE3o+RpNz4Dn5guE74kQNom/r9Tqvrx75RWnmYoXohgV3TB4gWVGrjVuDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NrdeUmrLAz0Y4ZonA377ATag/YNJRFHuubcu40vw9Y=;
 b=XYi+loQ436sX2jmA4dZpU+41yDTtO3yoqbdSw3w9IRfABaLX/8OwqTsCDBGy8CB+wKcTsrqEAosD8iUGQ4mSRLPlrgBHA8cNGwQgPjwlAqPjPb2qqqui2VEeSsmPZBMzi/xe6fGO4ODlqYI17JeRNmuQW4fZKIpZr+UYA0qMUUWewsFLKn+ezU5LkSObTo9lwMVcynZQHAoXZrEpNsxkNkl6e/zqnkNxaDibe78qM2qhd6vudDnn9nVWWHMC1wQPfXZcKmTt+npUP2evxj6fJLWC6y6M4rvIDL13S2XWBRHHe4AsrH7eOYaR9tsw+gSz63I17iaduOwGKu8KKCY1jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NrdeUmrLAz0Y4ZonA377ATag/YNJRFHuubcu40vw9Y=;
 b=ZYgtspXSeupMXcsho1qvGPnH8pq2tgNKDQWhCRQDodGCCOtUx48nJR6s1jQPXXrA00ZaH2FDkGHvWytiMj7PqAyu6rcIcXO70dtfRQCmkq9aupMpcp3fGpRYPlQhKPs73ghosrGfM/CXCGJ3HT+FxG/psGH24Hu3BWrmuD/Udv4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB7706.jpnprd01.prod.outlook.com (2603:1096:604:17b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 14:30:42 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 14:30:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, "Lad, Prabhakar"
 <prabhakar.csengg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Tommaso Merciai
 <tommaso.merciai.xr@bp.renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, magnus.damm
 <magnus.damm@gmail.com>
Subject: RE: [PATCH v8 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
Thread-Topic: [PATCH v8 2/6] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
Thread-Index: AQHcHO5DkziJYuZpG0uP0S9PdlSgdLSMY2uAgAFLCQCAAGfOAIAAANyA
Date: Thu, 11 Sep 2025 14:30:42 +0000
Message-ID: <TY3PR01MB113460EF10FB5D9067D61358F8609A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250903161718.180488-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <db2fc907-218c-4688-aebf-4a929f21b074@ideasonboard.com>
 <CA+V-a8vghwkHKWoqU8NQ3O9ZdHxB+cEvMv7Z9LQOMsZcx9vjPA@mail.gmail.com>
 <f1e671a3-77af-4ae2-aa6e-bde93aaa54b7@ideasonboard.com>
In-Reply-To: <f1e671a3-77af-4ae2-aa6e-bde93aaa54b7@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB7706:EE_
x-ms-office365-filtering-correlation-id: 181c0ee4-f367-4156-27e6-08ddf13fc9ce
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?SEU4dXdKa3hTUHh4RE5SeS93bUlmRXpqU0pRcGdkVHV5UkpFK1d4NDVKTDNB?=
 =?utf-8?B?MU9tOXhwc0lubHUrMTlkSGF5OXg0RGdIT2FvVjhyUFdVRkZaSzlaUytHR0c2?=
 =?utf-8?B?aVFqeTdHSDNVVmpUTFpkRFFua3BYTE1La2ZYWjRnc3JGQkxTNGh2SUtxRTRu?=
 =?utf-8?B?QmJLL1MzT1ZYems0WVE3OHNVV1RZNE4vUG9oVW5HYzFPdlhSNmtqTTdtYkRC?=
 =?utf-8?B?ZGF6WXIvaDdjUW5HakZucFVpdEd3Uzc3M3lvODJpUWQveitlODNvSmM1L0d5?=
 =?utf-8?B?MnhnWVUweVhzYnpUKzVDL3RIbTVEd3p0T2xWUHNjKzk3MzNxYXQzWHV6T0Nk?=
 =?utf-8?B?Wm8vMVhuQUNpMXRUT1FXRVVKRmFtYXhaU1plb0ZIeFhlQzE1VjZydGVERlA4?=
 =?utf-8?B?ZUUvcWVmbnpBZ2RtQm0wZXpJSHNwR084TUN6S1dJQ3JSWjRBVDdSQWUxSC9H?=
 =?utf-8?B?UDhUc0UvNEVuclB3S3lOUjk3U2U4UTdZd1lBRXBuQ2dQMXNvMEpKam5qQVJu?=
 =?utf-8?B?bzZlSGdaMzl4NE5FTEFHVC9KMDQzMXU1UXpqY2E0amp0bitrV01wZFJwYUZH?=
 =?utf-8?B?OGVEak5UMlNCTlJBWFB0bnAwS2pnbjRZSyt6aGpHbStveklwaWpXS0YxM2U5?=
 =?utf-8?B?dmxTWWViQmxzTGhacjFmVXdRQldlMVRaR0xwQVdwSExKSEFRdVk1b3BkTjFv?=
 =?utf-8?B?dzZoWkIzRUFVR0VXekpJcnp5VXBMTUNYYUhQQmEvRkJCMGxDbXlpc1dGMmw3?=
 =?utf-8?B?d29LSzhXdFpWdWRoUlc5UG1QSmlwdXQrelBBMVMybnZYTkFWTVZVWEVwallH?=
 =?utf-8?B?YlhZT2VJdHRoQjVvallsRmZNWjkrdW5YcFNqSkFBSjJpSm80TGhOMjA3bG9h?=
 =?utf-8?B?bWNVN0YvSm0yQkZHdEQwYWxtMUlSelN1NjFLTGVaUmNLWmJNU2x5cnloU0dE?=
 =?utf-8?B?YjMrbjAvdGNGSVZNbG5EeEplZ0Z4YmNxYnAvS04vUUxhQU9tOUloaUlFdmtZ?=
 =?utf-8?B?aDlZRU05RmlsenRNTVlvaVo2amJPRVp3NWV0Ny90SVhldzZYL011dC9SQTVR?=
 =?utf-8?B?ZXk2WkxqNVN0RWdEajhlNlQrQ1hmbk4zRFpvVXBGc1BqMklqcEsrcFYwbFlU?=
 =?utf-8?B?eG5oWWt5V2VPOG4vc3J4bUxNZndYa3NPdDE0Y2YzZGs2THhqaEFnZmc3aDN0?=
 =?utf-8?B?eEV5bnArVSsyT1NXSzAySVJuNytlNmtzYUtJNUozd2VxTExmTC9iU3Y3N3dv?=
 =?utf-8?B?YkRyeDZIUnI1WExkbmZUSThOaXA3b2pZdlRTOUl1cWQwL2x4WEIreURFWnR0?=
 =?utf-8?B?S09kOTRBTFZVbXpNMUN2OTJNaEdCMDNibzl3ZnAreThpWStUZzhFS3ZxWHBj?=
 =?utf-8?B?WjQ5QitYL1RBK0JjZ1FVRGdpVU5mMjIyRmt3QkpFeXh1anhLS3crWFBibzhl?=
 =?utf-8?B?L0RpRFMrdThsK20raFl2enliQmFQV0xWYWZxRkJoTWUrdmNvNWVWVEVGeDAw?=
 =?utf-8?B?ZGR1QVFLMTVFc1JsaDlHamVZVTdTOU9uVTNTd3kzMy9waVEwb29CNzM4UzJi?=
 =?utf-8?B?MUprT3J0MEZ5ZW9IaVdMVmRXVU1aVUFXOGk4OWkxZTE1aXRKVnpPVHRoVHlW?=
 =?utf-8?B?cHY0MVhRdmpQN2FONXhiUFFZaDc0RHBWQVVLaTBBZnFYRW1CZU01QVVZS2Jn?=
 =?utf-8?B?NzFFNXg2SVBHU0hURnQ0MHFnTnk5SHpEUmRJUWhKTkdvRXMvNHFsZnVZRTEw?=
 =?utf-8?B?M24vbG5mbnB4TU1VaUwyRHBMbWZCWG4yUzNhREtiS3NDQ2ZLUUhkaTRNL2Vq?=
 =?utf-8?B?eFd1UzcxZWxTM3kwdFF4REM4NlhvMjVSRGhwZVIrbFZiZ3IvVmJpenBqNTI3?=
 =?utf-8?B?emYrZkNJNVBuY0hodVN1MjQ5enE1QUtkZWp3MUFMUWdmb2JWUUpRNFQ1cW9H?=
 =?utf-8?B?T0IvK3EzejRaYVh4dnYrM25aL3RSdUc3WFRjRUx1a2x0aTRpbXlCWkxjTm05?=
 =?utf-8?Q?CMAdJRRy4M5vqwx6k5LipAl6/hpLzc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RU9LUUtYb1psMlVpeTFiZmhXbm5TY2lUV0Fqd0JJNnc4a3pnRVBhczY0aGcv?=
 =?utf-8?B?aEprdi81TGpyYUJMc3RoUHhxUnhhaCt6a2dBRzZudko3QVpRUVhwYmIxZDdS?=
 =?utf-8?B?cmhtUUEwV2NLZ2Y0UHAzYTU5Q0xSSnNsY28vMmFrdDVEU0V0VXl2QStreFht?=
 =?utf-8?B?SDN0LytBSVlsNUZZOEU2TkZNcVJDT2x6QVNLRGZuNTNnVHQ0ZUNCa3ppUFZD?=
 =?utf-8?B?dlZja2I2MUc1ZWkycklYdHJyK21JNHg1L3JHT1BRR0RFendJdjRGZUlUMU1L?=
 =?utf-8?B?RUwvSkVWUVFWQTF5MTgyYkNmbGRtalMrdDZXK0Njc3FaOFBPbk91SGFTek0w?=
 =?utf-8?B?Q2s3T25ieFlHRzVPVWJ6Q0FReGhndVhCQmFIVngwMzFzUXphRU1GUTBmQ2Ry?=
 =?utf-8?B?S0dUc2k5em5hM2hvNVZwUkVEaVhkb2ZnbVQ2NzVZNVFpWjh6Sy8vbWhndTVn?=
 =?utf-8?B?NWM1c1VVeFNiQUF4KzdodEpiMWhlUkprTEozblVSc1VtNHM0Nkh6NkROVlZE?=
 =?utf-8?B?anhHWHZDM3BDb2JhakpWQkNIK0VSQmRKUXZMSlM5VUhBS1ZMN015cWwyNGNW?=
 =?utf-8?B?bVpBb0tUcjFLZFFBaFpuUU42U2hOTGdER0F6T1JXalFTU1dEb3U4Ly8rcm1N?=
 =?utf-8?B?cnhjOFZWS0p5Snk3Zk5pUWxEOWpLb3R6U1FNUlBVS3JwQ3hhckFyeXI4S1Rx?=
 =?utf-8?B?Rk5naVdSVHBVWmQva0R6dkVSczh0citocEd6by9PT1pEZThDSmtBdmtmeFZD?=
 =?utf-8?B?bXRYalVEQmo3QzdhUVZZeEJBL3ZLOHNOOFczcHFERDNxTWlNejRSWlhMbVh3?=
 =?utf-8?B?bnV4YUZFa1NSa0VvOENJUDk3QTRSYllhQldVdDNXc2hEbnk1VkF2TTdpeEZ2?=
 =?utf-8?B?UnM4SER2ejRWbVpEZHZDY1Q2UXVhaUpsSTZ2UGhrNTZ3VHV6bUZ6N3I4ck1o?=
 =?utf-8?B?RWZ5d3g2TFRUZW1BM3lvRml1U2Q5ZFZJNE9Hdk1POEV2cDlPL2xTZlo4NVlX?=
 =?utf-8?B?NjJMMi9kdTNDN2c2RlRZMnNKekNpelQvWWx4MGQ4dnVOZ3RNLytHdWc1NG8y?=
 =?utf-8?B?TXhsNkZ2dER6ZFVTZ21KS25MNkFkMEthcXhEeHFJM1JSSkdNeG5yVm1lOE90?=
 =?utf-8?B?N0xkTld1Q1c2SUdHSmdBNm5uM01jRGZPVkVld0N6UU9zNitkTU44OHBFcGRm?=
 =?utf-8?B?UTdXR1RTVjNEV1NWVTYvQTZobURKejVnRE1jTWdnbWVPak9ZdXdhanlpL2lh?=
 =?utf-8?B?RVFlVEc2MDNTclR4TkdySEZyVkpQWVZzRHZ3Q0NRQ1ZxZkQrQ1JMK1N3bTF2?=
 =?utf-8?B?RnZWYUJEbi9tRWdJZ1c5b0cwSjYwTm5LaTNWMEdrZWoxenV4ZGhCYjlkcmVk?=
 =?utf-8?B?YlpRMTBGdzAwUytnNnFJdld1RWJWTWdKV20xVkRaaW5rZ0NLdGhWYkhrTVV2?=
 =?utf-8?B?QktyazBXRE1Nc1ZFMnppWkt4QkdzRFY1UHJLazA5S1NPWE1JcWlxOGxDOE1y?=
 =?utf-8?B?NzdnUk1WWTd1NGlYS2xKQ0wxSmVuRHM5SlUzR2lqNUR0T09MazdRYTZWSXRx?=
 =?utf-8?B?d3VtTDZ5TzEyMzBIZzErSzRaTkliS0lMMkF0cHJyekJpOHRwWGUyajROeEQw?=
 =?utf-8?B?bnR6RGsxOXRBanF1ay94eGVLRENLMy9XMmhHaDhxL3RKTncwSW91aHVNaFJD?=
 =?utf-8?B?M1BuWTExNFdoekVQOEpYakJMbzl6ajFoY2ttbUlNNlNBWVM3Q2pQOFNpOEN0?=
 =?utf-8?B?ZjlZY2dYc1lpN1JwUzV3Tk5aVzFLcnBGRlVHOFYvbkhzYTN0dWNaYmRFRUth?=
 =?utf-8?B?MmJRWnFhWmVpVzFZMzM4WWlVSEM3aVNDMUt0RjdtMjJUL1hvQ1IrUy9Tdzhh?=
 =?utf-8?B?aVZwMGdKK3dEOHZpd2NhR3krOWdoSGhIWUc0ZXlrRTNtVVh2Z1pnVnUvNHlj?=
 =?utf-8?B?R2lKNDhZa1RJbmJ6TmM2TXgyR0NvRlJrSHduZGNDV0JNeVBBb29TcHNUWnRS?=
 =?utf-8?B?K3YzUUhianFYaTBPR0RIZTNJMDRldWpNQ2tuOVBFZFpLblllTVo4YWJFRStF?=
 =?utf-8?B?N3pUekFKbkNQUTNieURIOGcxTmlpeFJqYXlmdStaWHJKamdmaW91WW9GbWg1?=
 =?utf-8?B?YXgvZ0x4ci9DSEI1QjVWQzRqOUtLZTk5c0tjV1BTMmwxNk1kdUd4clhjN3dl?=
 =?utf-8?B?U2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 181c0ee4-f367-4156-27e6-08ddf13fc9ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 14:30:42.7391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qxygiHLi/4U1VjGOGERdPfMuBB656rsKzkkh93HLfztbuBcJwAnx3nM/XKykyFABOlfigg2mn1Oz2jBDGD32hWRPsIJQHnTvb6a8+eKcoyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7706
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

SGkgVG9taSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUb21pIFZh
bGtlaW5lbiA8dG9taS52YWxrZWluZW4rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50
OiAxMSBTZXB0ZW1iZXIgMjAyNSAxNToyNg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDIvNl0g
Y2xrOiByZW5lc2FzOiByenYyaC1jcGc6IEFkZCBzdXBwb3J0IGZvciBEU0kgY2xvY2tzDQo+IA0K
PiBIaSwNCj4gDQo+IA0KPiBJbiBmYWN0LCBpZiB0aGUgRFNJIGlzIHNvIHBpY2t5IGFib3V0IHRo
ZSByYXRlLCBJIGZpbmQgdGhlIEhXIGRlc2lnbg0KPiBvZGQ6IGluIGcybCB0aGUgcGl4ZWwgY2xv
Y2sgYW5kIHRoZSBEU0kgY2xvY2sgY29tZSBmcm9tIGEgc2luZ2xlIHNvdXJjZSwgd2hpY2gga2Vl
cHMgdGhlbSBuZWF0bHkgaW4NCj4gc3luYy4gSWYgdGhhdCBpcyByZXF1aXJlZCwgd2h5IGNoYW5n
ZSB0aGUgZGVzaWduIGhlcmUgc28gdGhhdCB0aGUgRFNJIFBMTCBpcyBpbmRlcGVuZGVudCBvZiB0
aGUgcGl4ZWwNCj4gY2xvY2ssIHlldCBzdGlsbCB0aGUgRFNJIFBMTCBtdXN0IGJlIHByb2dyYW1t
ZWQgdG8gYmUgZXhhY3RseSBtYXRjaGVkIHRvIHRoZSBwaXhlbCBjbG9jay4NCg0KRzJMIERTSSBp
cyBmcm9tIFJlbmVzYXMgd2hlcmUgYXMgVjJIIGZyb20gZGlmZmVyZW50IHZlbmRvci4gSGVuY2Ug
dGhlIGRpZmZlcmVuY2UuDQoNCkNoZWVycywNCkJpanUNCg==
