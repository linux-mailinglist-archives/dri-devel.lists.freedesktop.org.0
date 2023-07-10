Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D310574CF57
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0461C10E20F;
	Mon, 10 Jul 2023 08:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2058.outbound.protection.outlook.com [40.107.104.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A943B10E20F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 08:01:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/TC/MKS7YWwN2xq6MgRnhX7j9OMoodLL3mAtZ68vwnW0NUglWrgIEAi1FMJTkufJtpSwVsb347UBatqB8IibsazeUkE/EDiOaezKw5vNanSov9Np7litaY+2fGH14DKvaG0j6WQPten2uB76tartpI5j9Y6QYi96CxRSoYEY5h9KckvdIY3UWUgNjx6hxs1DQ59yNpUozt1mfn+1j6uI6n8PN9dCeElJdyKnCgVvEKN7AwH3ur1wjPuLrn2uWg1ojnGJo6Xzyg8PYYzGammPpZtVk6EXAZ2mdrw1pE54IRSuQ88kuLT1R0nEEHooZ7tDkuJui0wkHRevdW4pj4usg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWs6LNZLJelos+nqI8z9ZoQFZvybCi8ah6y/9L82QvQ=;
 b=WSX1fJrnL8Ed8dtuw0dqTUPVJVj422gzMmVm5pxg27k11+qZ2h0/G3lH5dD7LEf7yG6hYJ2mjinQZeDfnltzpcS3LEGWoN4bBgL8aeYUJk32fFzfLJqZ4un9II1yj794hX8KMJXg5JLjSRasKFHXx1rOF2wtL6XKU7cZSLQRL95QlVkQ5jOtQ+uWRVkxOg/xYeByfzy3VIKQPg/uwC2COdx9BKyeesBCZ5YWHQq8OIXgjNSCx2pZOJA+WkflH2o0HL+JxFQKZe2Ub7ZEmIDiNvbdxZ7Stk33kaC9K1TNmmwKHoEXHMu72BSsvRSGtI5MTwwzHxFIcKCT/zeFIQZTxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWs6LNZLJelos+nqI8z9ZoQFZvybCi8ah6y/9L82QvQ=;
 b=X4odzShBBP/hEQzinmSANNUJwv5wsH4s2z2TKkG+A9GutcbQvgrFhW3H1hqAfKYNISMu/FrpmGgLJWe5G9HyVkcOPqkD8vQCfE3g62oZcoSFJv+49qGfAC5VoHXnznMNxejVyIxQgqWFajtTpJQTCV/e15l6vnkn+yGxfC1DQLQ=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU2PR04MB9131.eurprd04.prod.outlook.com (2603:10a6:10:2f6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Mon, 10 Jul
 2023 08:01:06 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 08:01:06 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "robert.foss@linaro.org"
 <robert.foss@linaro.org>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v6 4/8] phy: Add HDMI configuration options
Thread-Topic: [EXT] Re: [PATCH v6 4/8] phy: Add HDMI configuration options
Thread-Index: AQHZnyaWSldT+9YfOk2MiOGSER4/uq+aTasAgBhbjaCAAB0kAIAAAGFg
Date: Mon, 10 Jul 2023 08:01:06 +0000
Message-ID: <PAXPR04MB9448480F2A0E0542942A661AF430A@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <cec469206a166c4b070fd7d7bbf89a8df656ccc6.1686729444.git.Sandor.yu@nxp.com>
 <6f590bb6-7d17-3ae8-684d-2d4403d6ff55@linaro.org>
 <PAXPR04MB9448598256524162A74F0311F430A@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <8966feba-eef9-2ea3-dbec-13fc53232a6b@linaro.org>
In-Reply-To: <8966feba-eef9-2ea3-dbec-13fc53232a6b@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|DU2PR04MB9131:EE_
x-ms-office365-filtering-correlation-id: a61bd0b3-5073-43bd-fef8-08db811bd07f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GCShdOal2rAKcywIEJ37vkTp2yurBsV9B8eJB6JyeubOMvEJcZaOGobQAAps8vmWrxAIngk92nb1Q0k2Bvu/hxE7gNXyoGz/23Wa6cuGC8lbi6C0nv5+OicEMAPY9nDA93v4aQxOh07JWkr6/hWLcv0RyPum1jQsuNgGl8cOCtuyKYuSG80dkbLRlbqllQByArdoMZHBaza6T6CRbsytq4indFl7Pf2tsDnVFdgd8A2oxWAY06egGKBjv3agh5VnYXCVeNtOzQ8iP4q/Ui6JRPsmU40mDs1zcfOSJ6KMLH54AE9aWW7nn5wemUL3W5E7rSxqYbQvgBOXee+QILUD2YzgdHJcb880WK/1nio8k6cTgVYMXt9M1QLap2KdQfXrc2Cz3gHkyTC+cg/ry/slwHjZB5HqwiaW+UJ8yrpIV1wUtC9nFhzkTQQvYCPCTv6SNLbox5ssOlzDFebdSjI8owrj+8wxHIu37rRYwoChN9NNr5ItDMkbckE4LfZAq6mbREcZ/3LLoyJlSV+kT43Xa3GAMBeiUQYcd/8Mzx6l+VtQPgfuhlFOUL07jirdKjkVJz6xg42jzJKFKJ7v6LOp9Fm9hIxYar6NfojCaEUuJr7Z1whAs3D6CAFl92qsis/RMQm2Z+o+6EQkxRiAIigzug==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199021)(186003)(53546011)(6506007)(9686003)(83380400001)(41300700001)(4326008)(64756008)(66446008)(66556008)(316002)(2906002)(52536014)(44832011)(7416002)(8676002)(8936002)(66476007)(5660300002)(478600001)(66946007)(7696005)(76116006)(110136005)(71200400001)(54906003)(33656002)(55016003)(921005)(122000001)(86362001)(38100700002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aStvSi9NYzZYSTlsNmFWMmdCV0MvNzIzZkpHeHpWNW04TFJlTkRQbXpZajNL?=
 =?utf-8?B?eXRaVzRwL250WGFubHdPWHg4dGlaZC9sVUVrTWsvRkRNTEhkYVZQU1hUQlZ0?=
 =?utf-8?B?MWRhN0ZpRS9UMlk5YmFoUlozTGlvQTJLZElWaWthcTdLMHZCZXVac0dYS24v?=
 =?utf-8?B?ZS9qci9CZ2dnSk1xbVhKcHpwcHNMbDZMa0hWQTJsMy82Q2FDa2xvMXJlTExE?=
 =?utf-8?B?cHhaVGtxc0tuNkEva0xEWCt2MlIzbW9BSitMT0NTK1VnTjljUEdSRkNrUnJO?=
 =?utf-8?B?S0UxVWdsQXBKY01INGNUNlZUNnRvSDQ1TXRZb2IweUtobG94TENvblgyVUtO?=
 =?utf-8?B?NFROOEc5UjBtak82RlF4UTUyM0tLMlhJV2VQZVp1Y1Y2b2tDVFlYQVJubG51?=
 =?utf-8?B?UjBaYmt1SXZzUkhSM2ZadjA1VTJGZmVjYlE2a3FieGFtb24vbUxwTjRCN0t0?=
 =?utf-8?B?a052TDA1cnhFQmlvUTZpdElBSGFzRUd2UDlwT0wveTAxVnk0U3l1MkV4NkVl?=
 =?utf-8?B?R2Rablc0QWlWZDUxMkMrNVlaM216RnVxSy9MS2VFR3hEUStIdmh0MWFiUXFv?=
 =?utf-8?B?RmZOSDJnZVV0WWR2NUpBaS90Tk04bTZya2JQc1NVSnZLTjZyRWZlZHgrZWZo?=
 =?utf-8?B?UVBRbkE3K2RKd01sWFVLUkQ4Wkk0TzFtQ20wVklKdEtPTEUwQjRseFlLYmkz?=
 =?utf-8?B?SEdFY2RBc3FIa1JsWmp3cFpXNXVrRGh3SmFYN2ZzcXlMK0JYamRpL2VORjhM?=
 =?utf-8?B?V3d4c2p6dExtZ3JPZlN3UVYrWWloQVkxOUplcHEzY0dsOXZNOUplYUt5VmxS?=
 =?utf-8?B?blU1MlpEQ05DNWJQTWppMGNBSk9YT0l3ZS96VVBnOXFrUXdaTVlPREJIMEVM?=
 =?utf-8?B?MEZwT0NxT21YYlNxRHJIVjBPMWN1VVhJMFdYc1gwUG5NZHVHcFdvcTkybVh5?=
 =?utf-8?B?OWx1L2NjK2RVNkxaREpNVXcwVDBGM1FBRXQ5bkYxcy9hbnhKMkpHWXoxU0U4?=
 =?utf-8?B?N3k3eVllTXlQQTNsSGE1WFRjL1ZqT0lScU03ZVNkNnVpamxsNUpxSkVtUCtY?=
 =?utf-8?B?bUlHeXZlZ0QwNXJYNlRXYnRQSXMxVlQ2UE1NQ3RTSVEzenZLb3BqOXFZTzVX?=
 =?utf-8?B?blpmUk1yc3kvbUE1Rm9lZW1KTFpOOG1INzVURWlEWHVSUmtWcmVKT0U1MEI1?=
 =?utf-8?B?MmpiTDNpejlNQXlUcFBxMjJybkg2UG43aTJZQ2l5QTNCOTB0cGpnZHZDa2RH?=
 =?utf-8?B?em0xL0tlRWJ2STF4MUcraE9oditrUDIwL0dadk9weWh5ZXUyR09pUzZ6bklJ?=
 =?utf-8?B?bFR0UkhFZStOeE1sOTdTcnVlVUVxYmN1Q0x1SG12a1B4ZkRrLzlvNzNVdllC?=
 =?utf-8?B?bGZjaEFMdkdzcGVHRUdNdkxhMzhhVEZjVnZmRnYyclJMb3VLT2Q4OGdzMi9n?=
 =?utf-8?B?eFZ4RGthN2Q2cWN6SzJUODVuT3N5dVVsYzk4bXFyc0JaT21GcmVmNHJiR3o3?=
 =?utf-8?B?MGd3M3lSS2RpQXphNFVXT1hDLzhsME8welVEZ0dVYnAwT0ZZV2x3STNwWHdH?=
 =?utf-8?B?V2VJb2xZaUNXci9UR0NkTTBXU05GVGdRdkVYYW1XWXFSMXBsUWVscEpzRytW?=
 =?utf-8?B?d25Bcml3bEZBUVVJeTZTSnBDZGdmbFZwbXJ1R1dCUTdpZTZtcDRYdy9UWEVJ?=
 =?utf-8?B?Z1d6YVJ1a0RSUUg3RFoxQWhlNW5ETVpqQmtNdlNwYkpBTlk1YWlkMkJRcHM5?=
 =?utf-8?B?LzRZaEJEV3VubUc0R1ZpMXVheDhrZjIrMmc1Nnh4Y3FQTUNRazU4dU9kQjVz?=
 =?utf-8?B?OHdXRWdGOFJVT1RiU2FnNmhqWFJWK0NROEZBdGZodHFSVVlXWCt4VVFkbGVl?=
 =?utf-8?B?TEppbTNTNlh5MVFJOFBLTnpST0ZhU3loajZIa0JhN1BUK1NYN2prdHZML3Vp?=
 =?utf-8?B?WGVNZ08yb0JTOGU1bjAyWG10aEZvclhLaFpMQlZMU1lvbXBKclFsMGlXZ0Rr?=
 =?utf-8?B?VUJ4ZUZKOU5UOHF3eFI5dVVoZk55WUxvV0dJYVJLakIwU1krZXc1U2crYXRo?=
 =?utf-8?B?WDJLYS9pZjVCcW1NdGtCQXZVYzcrOTJsQStzdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a61bd0b3-5073-43bd-fef8-08db811bd07f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 08:01:06.4872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QKtS48QQbdm20ECdGFJbg2eSfQQfOHNp+YF5Ij8+B10TJwYcrCLkaSeYgdMxWR4kkqE1j3V4UVsI7tHumW3vcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9131
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiAyMDIz5bm0N+aciDEw5pel
IDE1OjQ0DQo+IFRvOiBTYW5kb3IgWXUgPHNhbmRvci55dUBueHAuY29tPjsgYW5kcnplai5oYWpk
YUBpbnRlbC5jb207DQo+IG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc7IHJvYmVydC5mb3NzQGxp
bmFyby5vcmc7DQo+IExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbTsgam9uYXNAa3dp
Ym9vLnNlOw0KPiBqZXJuZWouc2tyYWJlY0BnbWFpbC5jb207IGFpcmxpZWRAZ21haWwuY29tOyBk
YW5pZWxAZmZ3bGwuY2g7DQo+IHJvYmgrZHRAa2VybmVsLm9yZzsga3J6eXN6dG9mLmtvemxvd3Nr
aStkdEBsaW5hcm8ub3JnOw0KPiBzaGF3bmd1b0BrZXJuZWwub3JnOyBzLmhhdWVyQHBlbmd1dHJv
bml4LmRlOyBmZXN0ZXZhbUBnbWFpbC5jb207DQo+IHZrb3VsQGtlcm5lbC5vcmc7IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LXBoeUBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IENjOiBrZXJuZWxA
cGVuZ3V0cm9uaXguZGU7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBPbGl2ZXIg
QnJvd24NCj4gPG9saXZlci5icm93bkBueHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW0VYVF0gUmU6
IFtQQVRDSCB2NiA0LzhdIHBoeTogQWRkIEhETUkgY29uZmlndXJhdGlvbiBvcHRpb25zDQo+IA0K
PiANCj4gT24gMTAvMDcvMjAyMyAxMDoyOCwgU2FuZG9yIFl1IHdyb3RlOg0KPiA+IEhpIERtaXRy
eSwNCj4gPg0KPiA+IFRoYW5rcyBmb3IgeW91ciBjb21tZW50cywNCj4gPg0KPiA+PiBGcm9tOiBE
bWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+IE9uIDE1LzA2LzIw
MjMNCj4gPj4gMDQ6MzgsIFNhbmRvciBZdSB3cm90ZToNCj4gPj4+IEFsbG93IEhETUkgUEhZcyB0
byBiZSBjb25maWd1cmVkIHRocm91Z2ggdGhlIGdlbmVyaWMgZnVuY3Rpb25zDQo+ID4+PiB0aHJv
dWdoIGEgY3VzdG9tIHN0cnVjdHVyZSBhZGRlZCB0byB0aGUgZ2VuZXJpYyB1bmlvbi4NCj4gPj4+
DQo+ID4+PiBUaGUgcGFyYW1ldGVycyBhZGRlZCBoZXJlIGFyZSBiYXNlZCBvbiBIRE1JIFBIWSBp
bXBsZW1lbnRhdGlvbg0KPiA+Pj4gcHJhY3RpY2VzLiAgVGhlIGN1cnJlbnQgc2V0IG9mIHBhcmFt
ZXRlcnMgc2hvdWxkIGNvdmVyIHRoZSBwb3RlbnRpYWwNCj4gPj4+IHVzZXJzLg0KPiA+Pj4NCj4g
Pj4+IFNpZ25lZC1vZmYtYnk6IFNhbmRvciBZdSA8U2FuZG9yLnl1QG54cC5jb20+DQo+ID4+PiAt
LS0NCj4gPj4+ICAgIGluY2x1ZGUvbGludXgvcGh5L3BoeS1oZG1pLmggfCAzOA0KPiA+PiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPj4+ICAgIGluY2x1ZGUvbGludXgv
cGh5L3BoeS5oICAgICAgfCAgNyArKysrKystDQo+ID4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDQ0
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBpbmNsdWRlL2xpbnV4L3BoeS9waHktaGRtaS5oDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvcGh5L3BoeS1oZG1pLmgNCj4gPj4+IGIvaW5jbHVkZS9saW51eC9waHkv
cGh5LWhkbWkuaCBuZXcgZmlsZSBtb2RlIDEwMDY0NCBpbmRleA0KPiA+Pj4gMDAwMDAwMDAwMDAw
Li41NzY1YWE1YmMxNzUNCj4gPj4+IC0tLSAvZGV2L251bGwNCj4gPj4+ICsrKyBiL2luY2x1ZGUv
bGludXgvcGh5L3BoeS1oZG1pLmgNCj4gPj4+IEBAIC0wLDAgKzEsMzggQEANCj4gPj4+ICsvKiBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0KPiA+Pj4gKy8qDQo+ID4+PiArICog
Q29weXJpZ2h0IDIwMjIgTlhQDQo+ID4+PiArICovDQo+ID4+PiArDQo+ID4+PiArI2lmbmRlZiBf
X1BIWV9IRE1JX0hfDQo+ID4+PiArI2RlZmluZSBfX1BIWV9IRE1JX0hfDQo+ID4+PiArDQo+ID4+
PiArLyoqDQo+ID4+PiArICogUGl4ZWwgRW5jb2RpbmcgYXMgSERNSSBTcGVjaWZpY2F0aW9uDQo+
ID4+PiArICogUkdCLCBZVVY0MjIsIFlVVjQ0NDpIRE1JIFNwZWNpZmljYXRpb24gMS40YSBTZWN0
aW9uIDYuNQ0KPiA+Pj4gKyAqIFlVVjQyMDogSERNSSBTcGVjaWZpY2F0aW9uIDIuYSBTZWN0aW9u
IDcuMSAgKi8gZW51bQ0KPiA+Pj4gK2hkbWlfcGh5X2NvbG9yc3BhY2Ugew0KPiA+Pj4gKyAgICAg
SERNSV9QSFlfQ09MT1JTUEFDRV9SR0IsICAgICAgICAvKiBSR0IgNDo0OjQgKi8NCj4gPj4+ICsg
ICAgIEhETUlfUEhZX0NPTE9SU1BBQ0VfWVVWNDIyLCAgICAgLyogWUNiQ3IgNDoyOjIgKi8NCj4g
Pj4+ICsgICAgIEhETUlfUEhZX0NPTE9SU1BBQ0VfWVVWNDQ0LCAgICAgLyogWUNiQ3IgNDo0OjQg
Ki8NCj4gPj4+ICsgICAgIEhETUlfUEhZX0NPTE9SU1BBQ0VfWVVWNDIwLCAgICAgLyogWUNiQ3Ig
NDoyOjAgKi8NCj4gPj4+ICsgICAgIEhETUlfUEhZX0NPTE9SU1BBQ0VfUkVTRVJWRUQ0LA0KPiA+
Pj4gKyAgICAgSERNSV9QSFlfQ09MT1JTUEFDRV9SRVNFUlZFRDUsDQo+ID4+PiArICAgICBIRE1J
X1BIWV9DT0xPUlNQQUNFX1JFU0VSVkVENiwgfTsNCj4gPj4NCj4gPj4gVGhpcyBlbnVtIGR1cGxp
Y2F0ZXMgZW51bSBoZG1pX2NvbG9yc3BhY2UgZnJvbSA8bGludXgvaGRtaS5oPiBIRE1JDQo+ID4+
IDIuMCBkZWZpbmVzICc3JyB0byBiZSBJRE8tZGVmaW5lZC4NCj4gPj4NCj4gPj4gV291bGQgaXQg
YmUgYmV0dGVyIHRvIHVzZSB0aGF0IGVudW0gaW5zdGVhZD8NCj4gPiBBY2NlcHQuIEkgd2lsbCBj
cmVhdGUgaGVhZCBmaWxlIGhkbWlfY29sb3JzcGFjZS5oIHRvIHJldXNlIGVudW0NCj4gaGRtaV9j
b2xvcnNwYWNlIGluIDxsaW51eC9oZG1pLmg+Lg0KPiANCj4gRXhjdXNlIG1lLCBpdCB3YXMgc3Vw
cG9zZWQgdG8gYmUgYSBxdWVzdGlvbi4NCj4gDQo+IERvIHlvdSBuZWVkIGFub3RoZXIgaGVhZGVy
IGZpbGUgdG8gcmV1c2UgdGhpcyBlbnVtPw0KSSdtIG5vdCBzdXJlIGNvbW11bml0eSB3aGV0aGVy
IHdvdWxkIGFjY2VwdCB0aGUgcGF0Y2ggdGhhdCBzaW1wbHkgaW5jbHVkZSA8bGludXgvaGRtaS5o
PiBpbiBwaHktaGRtaS5oDQpiZWNhdXNlIHRoZXJlIGFyZSBsb3RzIG9mIG90aGVyIGRlZmluaXRp
b24gaW4gPGxpbnV4L2hkbWkuaD4gdGhhdCBub3QgbmVlZCBieSBwaHktaGRtaS5oLg0KSWYgdGhl
IGFuc3dlciBpcyB5ZXMsIEkgaGFwcHkgdG8gZm9sbG93Lg0KDQo+IA0KPiA+DQo+ID4gQi5SDQo+
ID4gU2FuZG9yDQo+ID4+DQo+ID4+PiArDQo+ID4+PiArLyoqDQo+ID4+PiArICogc3RydWN0IHBo
eV9jb25maWd1cmVfb3B0c19oZG1pIC0gSERNSSBjb25maWd1cmF0aW9uIHNldA0KPiA+Pj4gKyAq
IEBwaXhlbF9jbGtfcmF0ZTogIFBpeGVsIGNsb2NrIG9mIHZpZGVvIG1vZGVzIGluIEtIei4NCj4g
Pj4+ICsgKiBAYnBjOiBNYXhpbXVtIGJpdHMgcGVyIGNvbG9yIGNoYW5uZWwuDQo+ID4+PiArICog
QGNvbG9yX3NwYWNlOiBDb2xvcnNwYWNlIGluIGVudW0gaGRtaV9waHlfY29sb3JzcGFjZS4NCj4g
Pj4+ICsgKg0KPiA+Pj4gKyAqIFRoaXMgc3RydWN0dXJlIGlzIHVzZWQgdG8gcmVwcmVzZW50IHRo
ZSBjb25maWd1cmF0aW9uIHN0YXRlIG9mIGEgSERNSQ0KPiBwaHkuDQo+ID4+PiArICovDQo+ID4+
PiArc3RydWN0IHBoeV9jb25maWd1cmVfb3B0c19oZG1pIHsNCj4gPj4+ICsgICAgIHVuc2lnbmVk
IGludCBwaXhlbF9jbGtfcmF0ZTsNCj4gPj4+ICsgICAgIHVuc2lnbmVkIGludCBicGM7DQo+ID4+
PiArICAgICBlbnVtIGhkbWlfcGh5X2NvbG9yc3BhY2UgY29sb3Jfc3BhY2U7IH07DQo+ID4+PiAr
DQo+ID4+PiArI2VuZGlmIC8qIF9fUEhZX0hETUlfSF8gKi8NCj4gPj4NCj4gPj4gW3NraXBwZWQg
dGhlIHJlc3RdDQo+ID4+DQo+ID4+IC0tDQo+ID4+IFdpdGggYmVzdCB3aXNoZXMNCj4gPj4gRG1p
dHJ5DQo+ID4NCj4gDQo+IC0tDQo+IFdpdGggYmVzdCB3aXNoZXMNCj4gRG1pdHJ5DQoNCkIuUg0K
U2FuZG9yDQoNCg==
