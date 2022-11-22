Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B35634033
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 16:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F7910E40B;
	Tue, 22 Nov 2022 15:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2056.outbound.protection.outlook.com [40.107.249.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F033189089
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 15:30:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFyzbOI/HidzAiO2NpwbAnvmG6OpmZjyPsumGizdMgmVO27GuzyOsINHzmm7YUtcVswctGF4EKRisK3ksE9sb4fsFeAqfT9M/oX45CPdS1l+HBtarXviNMfW+6o/GdyA1CKkrkHie4S7vC6jvFaC+ChlKNH+/IRUchaeAhqQd64ysMNZqj7v0IPTK+tgSnF2R9YdXsMWGcyTSvmMX9dPK/q2Om4ZnM98aP34iXNFEgl082/xHQM3TteGl1YKP9Z0JyH5N3s/h1nrPor2TfcNxwDxPxbBSO77yLSX4jsGonCRrSjny3pV+wUi/f3RRxCKfZT6ZcSpOyAeUgQrGRLPCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vRx086UVHCydWPueOBVgA5mPh4cKwZKA1OzTLyzkRs=;
 b=jqQe/4WAzVLO0TwYWE7dk3MJfWJ/1i+dcKn3WbmAJP73EDfVHnwn0PzAITnADIZcKlmmXE+BwmZaPdQZo5lXZL5rwQR00AYMG+ZTQyi/Pm+U9b87cJmmtJr+y+taii0Y/jKs46QDnMc0NNmkX8ycGDbitkntuvkJ+S4t6ZGWIcHTIcxDEKh2sencUYOZrnlGkEXcobW+CZEy/pp8dBQxOG2bTgZA6HBNCA3BfIemOi5c+yh2sKKb/qA5Wn1W2qU5ZCw0CdfIMuDOmTPpxeOM9pfKkr04TNsE92Xo+gLxMksqYqGMX1cO7jFED3noDanEjtkBV8xcuFoZAbN1X9qznw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vRx086UVHCydWPueOBVgA5mPh4cKwZKA1OzTLyzkRs=;
 b=cG+jpAD4YLwhcoTPVAyY1AWQ8gg7IGD3JfI0owGEESNXS9DIU3p6MFp9+H/FKhtdP3XuxWCTrMWZeEM3jOlbZaUkxL7b50/zY2CKhcY2/EUb/kKu8HEVSqQ9TICraAYGmF35qBPL5QeEkiHwDSlDnVz8Sdzw5/g8ZvZzN2BC0kA=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8654.eurprd04.prod.outlook.com (2603:10a6:102:21d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Tue, 22 Nov
 2022 15:30:18 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%5]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 15:30:18 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "kishon@ti.com" <kishon@ti.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>, "alexander.stein@ew.tq-group.com"
 <alexander.stein@ew.tq-group.com>
Subject: RE: [EXT] Re: [PATCH v4 02/10] dt-bindings: display: bridge: Add MHDP
 DP for i.MX8MQ
Thread-Topic: [EXT] Re: [PATCH v4 02/10] dt-bindings: display: bridge: Add
 MHDP DP for i.MX8MQ
Thread-Index: AQHY/XltzHTMxs95TkSAnbCksIj46K5KnaoAgABu5MA=
Date: Tue, 22 Nov 2022 15:30:18 +0000
Message-ID: <PAXPR04MB944858CC5C66BE543C8005DFF40D9@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1669013346.git.Sandor.yu@nxp.com>
 <f09833038399e4ed0ff845724fc99bcf8b2793c9.1669013346.git.Sandor.yu@nxp.com>
 <d2f90ade-70ff-b05e-9643-cda25a4fd6ff@linaro.org>
In-Reply-To: <d2f90ade-70ff-b05e-9643-cda25a4fd6ff@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|PAXPR04MB8654:EE_
x-ms-office365-filtering-correlation-id: fd868d2d-baaa-4fa8-c7be-08dacc9e75e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uVbTj+6Xiy/VgBa9n7DTWxEhJA7RESSCc2YNmBD8SLk4pAilueKYRm3mCTsb5jdF+S5c93Ybnw7KhUgwXaGoiEbAIEQjzwqj/+zUCM4dMInc4K11adsO74IvjR97+68MwCBl4/bBFTIMwM7S13hI77g3Fie+qde//j6/c/ai/G16xeUlpu6srfxe79PLtAPn/jpVhBUUNv/Ra/l4pUwOpr+vIfvZs/l++0ynMqViGlnbIqxvRQG9NFkGN+Ime/dcDmYnLh0kyqnTWSmXRLey+hRqLluXAD5nswa+HuJqHD1vp61koRalU/15bqHVjdlbsxoWO6Wlnut14TTPFZ1BEbROo3DP+b5FO8hbrrpzNCu7Dj/mSnn/8L9QaCOsXc3FGYjjsfP+w3+YqHBMc6HFb1ZoDAksjpSXBDoCABwvj6B26U3xlhWx2mOIXO+htWGbp9jqMwu1sgn0IU2C/693CqbVerefUk3W+e5WCyFSJ3L81s4eXuhtW7yjhKp+4xEEyWN35J4EG7st9rtMThlCOxoBC6LmgncYyuM2WMwvx+WJXARbqJtD2R6yVQV49r2h/3Lk57TfNtBCH1wency/XRYqw5e491Vg4ctyiiBISlDJN2CQ/SdgJnhxbOotNiNMzxidRBD5IOtV8y/CTyp1rjfFlOpd96qMMp4kO8wiTbIAH3/otSRPamhu3DcnEJhKooIHYIKlwMf89DjKu3pHenbo/ERxFzG5aNiiHP8T0OSR0GssJwdVIvWsSZOqE0UH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199015)(122000001)(83380400001)(86362001)(41300700001)(38100700002)(66476007)(38070700005)(921005)(44832011)(2906002)(52536014)(7416002)(478600001)(8936002)(5660300002)(53546011)(55016003)(7696005)(6506007)(4326008)(76116006)(66446008)(9686003)(66556008)(66946007)(8676002)(316002)(54906003)(45080400002)(186003)(26005)(71200400001)(64756008)(110136005)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?RUtHeDQvTkpnYWhGL0lmNndDcVF0bWNJQ2Joalhwc3F0aXgzYlY0R1NKUUxO?=
 =?gb2312?B?YlZZS1ZJRng0RW9teWtjMHdISXJ2Yi9yYmZPbnA2Vk1UMkFoK2NEZFFqdFdp?=
 =?gb2312?B?QTBKUlowSVVTZzlqQkJIQjJ5c0U0YUYvS2hiWTBxdnFvem1aMlRNN0JXV09n?=
 =?gb2312?B?T3IySjYwd0pOR0xBQ3g0NE54WlVhRWg2bkdYWXRVM0cyUEtSbjZhQTJBQlF0?=
 =?gb2312?B?NVR2NWpYSzNDak9oc3k2SlJDR2VwWGtzUU4vVHRZWUpLK080ZmNiaERhWjk0?=
 =?gb2312?B?a1l6dDR3VHdFVEduWUt4L3ZudjVuc3ZRNUNqZFBjYkxOcUl5dWRVTmViTm9a?=
 =?gb2312?B?VmtJR3JUNXFRa1lJSG1XNUZoUFN6TXZZeUxVVVJHOXBCaFBPQnEwczZ0VWk0?=
 =?gb2312?B?OHMyT2JjK3FFTXRCbmp3eHVJdE1yQ1BLbEZFcEE3UU05c1loR3Q3ZUUwTEx6?=
 =?gb2312?B?VlYvUUh5U2YyTVh6UldvOVZvcGxGTW9kZDBwajEvMG5vbUp6a0lxSi9jZEwx?=
 =?gb2312?B?aFJablZKWEdaK24xQmdLOTlTLy90clpETGtnR2dqMXg0Mmw4Q213aGFQQi9p?=
 =?gb2312?B?ZGM0SFg3RURqT0lJNHBaeVd5Z0ZqbUJML2duODcrWk1NdGhBeEdscVJ3b3NU?=
 =?gb2312?B?QWQvUnk3YW9NM1ZPSlZJOTJOMk5nQ1VnK2M0ckRsVFdKcTdkNnVNeXByMU9S?=
 =?gb2312?B?MUVUdXB4QVVNb0U5SCthWHBMZ0czZXpRcklFZVd1b2ZSZDhtWWJHSTA2cFR5?=
 =?gb2312?B?MGFRUlJiK1g3L2lsU0I2UHo3Z1ZrWEVLWlpNeDR3Zk9TVkM4a28wa3BHMVR0?=
 =?gb2312?B?VFpyc3VzMzdsaUppMS85ajU2OE9YR0RkYUNCM0ttbFpIcXhnZDdMelB4OVBr?=
 =?gb2312?B?OXA1RkIxUkRwWDBlUkdXWENpQjJYd3I4R1E1TGhTSXRTMjA5TUtJK201T2RP?=
 =?gb2312?B?dzhtRWNTTFpoUGxSWVlWakFzamJid2xqZFFPYUVlTlVMWEVIaDRDSGlIUHQy?=
 =?gb2312?B?WGZGNFBPb0JxYUg1UTRhc0xQdUMwdTFmVjhoWmFZUkhOaHlLRm5GTitkZ2dk?=
 =?gb2312?B?aUcvTFNSYkh4U1JoRjh5MU1DaDNYOFRmWkVxMUtpcEE3bFdNcUJyTnlnUXlS?=
 =?gb2312?B?RHR4ekZObklMSm9Tc0J6ZENLdmU0dUxpNnNVUnluQW82eDdZanBrenFDVFFV?=
 =?gb2312?B?T1UvUnJ2QzNsekRXQlA5MGFubSt4Q0lGLzZBTFZiNTBENW1TbUhuM3F1ckxu?=
 =?gb2312?B?QkttZ21OeS9OZmxEQnFYTGoxQ3B4RzUva29NQmZsRWUvRStZYVl1cVN0cm1B?=
 =?gb2312?B?V2NhYVhGeURYM1dDNzFIeUZjZ3d0RytJWXRJYU0zM2dHUSthelFmRDZCaGN6?=
 =?gb2312?B?ZzRPV0htRlhNUTU4ekU5WjUzMkkwRXFwZmdqbzBqcFFHM2U2TmtqRzJiUENM?=
 =?gb2312?B?LzJ0bU5zdGx5TlFQNFZnVjJrYlhQV09KR3ZaMWpTNlUvT2dTWHFVY2JlYjZi?=
 =?gb2312?B?cHpSY1FJTWRnNHBMY3ZZOENYdkhQcjk3c0ZaN1ZGVHlDb3FGSFpjeTNWWnRG?=
 =?gb2312?B?bFlEZkZjZnZwOU1qUGR5YzVBNGJNT3piTURMTDJuT2w0S3pWQWFTTlVqZjBW?=
 =?gb2312?B?TE8zaHdKZnRmZFQ3bVlYNWtKS2ZvcVJyZUhXMmFYb2tKSUhCd2xTTjdvVGli?=
 =?gb2312?B?YytwY3A2a0hWSVdXVGFOdW5uYkxXdEI0R2tmRjB1WFBld1F3TzMyeU14bTlR?=
 =?gb2312?B?cEp4YjV4dVdaVnRvbFovb1IrdGQ1MW4wUHpQY2t6UUVtN2JLOWpRcEFJOUVI?=
 =?gb2312?B?MGF0aTNrRzZYYjJWbVpXd0g4WGRBSTlzN1lnREtUTUIrR3A1Y0JMWThQOFg5?=
 =?gb2312?B?WGZPM20vQk1NZGtKR1JFRTJCMVowNi9Vdm1FS0k2TVY1aEx1Y1BHWm00V3oy?=
 =?gb2312?B?RnhLcTFiWnBWMmR3WXJRUU1lcXBUTUhYdjlkTk1PTFZUdTEzRGIwc1JwdVJ6?=
 =?gb2312?B?SVNuK3RxUnNJQXJPNUdyNGxodGJtSkNvTXF2NkEzdWNGMHNzZWlHZ3BUcnNj?=
 =?gb2312?B?VFA3Qmczb3JocGR1TE1Oa2RPZXBhVUhUaW9NVVZGRFZ1YVk4R3RTTnA4Mi9Y?=
 =?gb2312?Q?7VAE=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd868d2d-baaa-4fa8-c7be-08dacc9e75e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 15:30:18.0613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9v63aQxdOsd3B4KaObuVZ4GmXfUobUvBbQUB9GY8qIn51rnyJ3CPbsqjOJMokEMUTitkB55DJ8XO2/RSdmV/kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8654
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
Cc: Oliver Brown <oliver.brown@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgeW91ciBjb21tZW50cywNCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296
bG93c2tpQGxpbmFyby5vcmc+DQo+IFNlbnQ6IDIwMjLE6jEx1MIyMsjVIDE2OjI4DQo+IFRvOiBT
YW5kb3IgWXUgPHNhbmRvci55dUBueHAuY29tPjsgYW5kcnplai5oYWpkYUBpbnRlbC5jb207DQo+
IG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc7IHJvYmVydC5mb3NzQGxpbmFyby5vcmc7DQo+IExh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbTsgam9uYXNAa3dpYm9vLnNlOw0KPiBqZXJu
ZWouc2tyYWJlY0BnbWFpbC5jb207IGFpcmxpZWRAZ21haWwuY29tOyBkYW5pZWxAZmZ3bGwuY2g7
DQo+IHJvYmgrZHRAa2VybmVsLm9yZzsga3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3Jn
Ow0KPiBzaGF3bmd1b0BrZXJuZWwub3JnOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOyBmZXN0ZXZh
bUBnbWFpbC5jb207DQo+IGtpc2hvbkB0aS5jb207IHZrb3VsQGtlcm5lbC5vcmc7IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LXBoeUBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBhbGV4YW5kZXIu
c3RlaW5AZXcudHEtZ3JvdXAuY29tDQo+IENjOiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGRsLWxp
bnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBPbGl2ZXIgQnJvd24NCj4gPG9saXZlci5icm93
bkBueHAuY29tPg0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIHY0IDAyLzEwXSBkdC1iaW5k
aW5nczogZGlzcGxheTogYnJpZGdlOiBBZGQgTUhEUA0KPiBEUCBmb3IgaS5NWDhNUQ0KPiANCj4g
Q2F1dGlvbjogRVhUIEVtYWlsDQo+IA0KPiBPbiAyMS8xMS8yMDIyIDA4OjIzLCBTYW5kb3IgWXUg
d3JvdGU6DQo+ID4gQWRkIGJpbmRpbmdzIGZvciBpLk1YOE1RIE1IRFAgRGlzcGxheVBvcnQuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYW5kb3IgWXUgPFNhbmRvci55dUBueHAuY29tPg0KPiA+
IC0tLQ0KPiA+ICAuLi4vZGlzcGxheS9icmlkZ2UvY2RucyxtaGRwLWlteDhtcS1kcC55YW1sICAg
fCA5Mw0KPiArKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5MyBpbnNl
cnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+DQo+IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9jZG5zLG1oZHAtaW14OG1xLWRwLnkN
Cj4gPiBhbWwNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPg0KPiBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9jZG5zLG1oZHAtaW14OG1xLWRwDQo+ID4g
LnlhbWwNCj4gPg0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2JyaWRnZS9jZG5zLG1oZHAtaW14OG1xLWRwDQo+ID4gLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZDgyZjNjZWRkYWE4DQo+ID4gLS0tIC9k
ZXYvbnVsbA0KPiA+ICsrKw0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L2JyaWRnZS9jZG5zLG1oZHAtaW14OG0NCj4gPiArKysgcS1kcC55YW1sDQo+ID4gQEAg
LTAsMCArMSw5MyBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBP
UiBCU0QtMi1DbGF1c2UpICVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOg0KPiA+ICtodHRw
czovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUzQSUy
RiUyRmRldmkNCj4gPg0KPiArY2V0cmVlLm9yZyUyRnNjaGVtYXMlMkZkaXNwbGF5JTJGYnJpZGdl
JTJGY2RucyUyQ21oZHAtaW14OG1xLWRwLg0KPiB5YW1sJQ0KPiA+DQo+ICsyMyZhbXA7ZGF0YT0w
NSU3QzAxJTdDU2FuZG9yLnl1JTQwbnhwLmNvbSU3QzE2MzY5MGM4YThhYjRmN2E2DQo+IGM5MjA4
ZGFjDQo+ID4NCj4gK2M2MzczYzQlN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3
QzAlN0MwJTdDNjM4MDQ3MA0KPiAyNDc1NDI4NjkNCj4gPg0KPiArNDYlN0NVbmtub3duJTdDVFdG
cGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNDQo+IHpJaUxDSkJUaQ0K
PiA+DQo+ICtJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJTdDJTdDJTdDJmFtcDtzZGF0
YT1FZWk1TmtwMA0KPiBIbDhTSHBCTFpVDQo+ID4gKzFIc0pEbldRdWpIdm1QaDJYTXVDJTJCU1o1
OCUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+ICskc2NoZW1hOg0KPiA+ICtodHRwczovL2V1cjAxLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUzQSUyRiUyRmRldmkNCj4g
Pg0KPiArY2V0cmVlLm9yZyUyRm1ldGEtc2NoZW1hcyUyRmNvcmUueWFtbCUyMyZhbXA7ZGF0YT0w
NSU3QzAxJTdDU2ENCj4gbmRvci55dQ0KPiA+DQo+ICslNDBueHAuY29tJTdDMTYzNjkwYzhhOGFi
NGY3YTZjOTIwOGRhY2M2MzczYzQlN0M2ODZlYTFkM2JjMmI0DQo+IGM2ZmE5MmNkDQo+ID4NCj4g
Kzk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzgwNDcwMjQ3NTQyODY5NDYlN0NVbmtub3duJTdDVFdG
cA0KPiBiR1pzYjNkOGV5SlcNCj4gPg0KPiArSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16
SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlNw0KPiBDMzAwMA0KPiA+DQo+ICslN0Ml
N0MlN0MmYW1wO3NkYXRhPWVaVW5lcG5RSFM5ZXd5V2I5QUhNaHQlMkYlMkJldnV0bU90DQo+IG1U
YWpMJTJCNUV3d2JzDQo+ID4gKyUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+ICsNCj4gPiArdGl0bGU6
IENhZGVuY2UgTUhEUCBEaXNwbGF5cG9ydCBicmlkZ2UNCj4gPiArDQo+ID4gK21haW50YWluZXJz
Og0KPiA+ICsgIC0gU2FuZG9yIFl1IDxTYW5kb3IueXVAbnhwLmNvbT4NCj4gPiArDQo+ID4gK2Rl
c2NyaXB0aW9uOg0KPiA+ICsgIFRoZSBDYWRlbmNlIE1IRFAgRGlzcGxheXBvcnQgVFggaW50ZXJm
YWNlLg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsg
ICAgZW51bToNCj4gPiArICAgICAgLSBjZG5zLG1oZHAtaW14OG1xLWRwDQo+ID4gKw0KPiA+ICsg
IHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGNsb2NrczoNCj4gPiAr
ICAgIG1heEl0ZW1zOiAxDQo+ID4gKyAgICBkZXNjcmlwdGlvbjogTUhEUCBEUCBBUEIgY2xvY2su
DQo+ID4gKw0KPiA+ICsgIHBoeXM6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiAr
ICBpbnRlcnJ1cHRzOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246
IEhvdHBsdWcgY2FibGUgcGx1Z2luLg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBIb3RwbHVn
IGNhYmxlIHBsdWdvdXQuDQo+ID4gKw0KPiA+ICsgIGludGVycnVwdC1uYW1lczoNCj4gPiArICAg
IGl0ZW1zOg0KPiA+ICsgICAgICAtIGNvbnN0OiBwbHVnX2luDQo+ID4gKyAgICAgIC0gY29uc3Q6
IHBsdWdfb3V0DQo+ID4gKw0KPiA+ICsgIHBvcnRzOg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMv
Z3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0cw0KPiA+ICsNCj4gPiArICAgIHByb3BlcnRpZXM6
DQo+ID4gKyAgICAgIHBvcnRAMDoNCj4gPiArICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55
YW1sIy9wcm9wZXJ0aWVzL3BvcnQNCj4gPiArICAgICAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAg
ICAgICAgIElucHV0IHBvcnQgZnJvbSBkaXNwbGF5IGNvbnRyb2xsZXIgb3V0cHV0Lg0KPiA+ICsg
ICAgICBwb3J0QDE6DQo+ID4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJv
cGVydGllcy9wb3J0DQo+ID4gKyAgICAgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgICAgICBP
dXRwdXQgcG9ydCB0byBEUCBjb25uZWN0b3IuDQo+ID4gKw0KPiA+ICsgICAgcmVxdWlyZWQ6DQo+
ID4gKyAgICAgIC0gcG9ydEAwDQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBh
dGlibGUNCj4gPiArICAtIHJlZw0KPiA+ICsgIC0gY2xvY2tzDQo+ID4gKyAgLSBpbnRlcnJ1cHRz
DQo+ID4gKyAgLSBpbnRlcnJ1cHQtbmFtZXMNCj4gPiArICAtIHBoeXMNCj4gPiArICAtIHBvcnRz
DQo+ID4gKw0KPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4
YW1wbGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2Nr
L2lteDhtcS1jbG9jay5oPg0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVw
dC1jb250cm9sbGVyL2FybS1naWMuaD4NCj4gPiArDQo+ID4gKyAgICBtaGRwX2RwOiBkcC1icmlk
Z2VAMzJjMDAwMDAgew0KPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAiY2RucyxtaGRwLWlteDht
cS1kcCI7DQo+ID4gKyAgICAgICAgcmVnID0gPDB4MzJjMDAwMDAgMHgxMDAwMDA+Ow0KPiA+ICsg
ICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxNiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgMjUgSVJRX1RZUEVfTEVWRUxfSElHSD47
DQo+ID4gKyAgICAgICAgaW50ZXJydXB0LW5hbWVzID0gInBsdWdfaW4iLCAicGx1Z19vdXQiOw0K
PiA+ICsgICAgICAgIGNsb2NrcyA9IDwmY2xrIElNWDhNUV9DTEtfRElTUF9BUEJfUk9PVD47DQo+
ID4gKyAgICAgICAgcGh5cyA9IDwmZHBfcGh5PjsNCj4gPiArDQo+ID4gKyAgICAgICAgcG9ydHMg
ew0KPiA+ICsgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAg
ICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICBwb3J0QDAgew0K
PiA+ICsgICAgICAgICAgICAgICAgcmVnID0gPDA+Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAg
ICAgIG1oZHBfaW46IGVuZHBvaW50IHsNCj4gPiArICAgICAgICAgICAgICAgICAgICByZW1vdGUt
ZW5kcG9pbnQgPSA8JmRjc3Nfb3V0PjsNCj4gPiArICAgICAgICAgICAgICAgIH07DQo+IA0KPiBB
cyBSb2Igc3VnZ2VzdGVkLCB5b3UgYWxsb3dlZCBwcm9wZXJ0eSBmb3Igb3V0cHV0IHRvIERQIHBv
cnQuIEhvd2V2ZXIgaXQgaXMNCj4gbm90IGluIHRoZSBleGFtcGxlLiBJZiB0aGlzIGlzIGEgYnJp
ZGdlLCB3aGF0IGRvZXMgaXQgYnJpZGdlIGlmIHRoZXJlIGlzIG5vIG91dHB1dA0KPiBjb25uZWN0
b3I/DQo+IA0KT0ssIEkgZ290IGl0LiBPdXRwdXQgY29ubmVjdG9yIHdpbGwgYmUgYWRkZWQgdG8g
dGhlIGV4YW1wbGUgaW4gdGhlIG5leHQgdmVyc2lvbi4NClRoYW5rcywNClNhbmRvcg0KPiANCj4g
QmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K
