Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE27734A77
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 05:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D3E10E167;
	Mon, 19 Jun 2023 03:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8534510E167
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 03:10:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGenko9GwP1yfjbb7FvIGd8OHTw0JADIz8+b5cBtQsqytxb6vrHAQxCwI0Vh717u5DFxaXHLCeaJhQ3hzEZBGFwoYjOTvt9VqRQmocywupszMj5A6/eMJA8Wt/eii7x1Sbp8/HCx9XMFoeSX6YXd75oCXe6dEnVjxv5ZDp/q/QWRMvpl2VMu6MS164TdhDUrHVrWTMPPd+yjLBHP3pRTRTJdzFVIh5GB/lO3YyK+LJ8bBZvnrXyYc7D6Bv6Ixdt+IVnrjAGgsC5kp2JPoyNpzYCDINrZW0BmZjx/PmY6Wm4gd4wxN6FgaoeE48cVynDDb1R5jycrGdvKjKU/nR3LNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcU7E/HbwQceSgbXhs70CfSAw8OP7PUoj6alze02joc=;
 b=JVDSWjw6mjctIFyUCEeMZpFdKNO+L8Qa8GJdta2dG/ODqNQtP/U6yFkXvZFUQfCqNt/y7L1MRCy/R9qUqDIArhQy7KYEnlq20m6Nd+ZbhFvPf1VZjEnYwDIYfSJvi/DHLjFU9qKRew9jlzvcOD72PTJvO+/8BT0rEdxuJ0ZfhOon4zImxZEhlnSXHssh8OYHsoY7ZFG1LDk8gfCwi9GBctHqOJw6612u/a7h27TTgLn3UJb3tMvFGycmtnysWZdhYTk4ckOOlrOQ2VMdw6p9vD7xqNsdU6XyCu3+zM+uiQkJ5R7WG3BjZ/+mTJRqugDZErz6A2JciuOKb0LqghKvAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcU7E/HbwQceSgbXhs70CfSAw8OP7PUoj6alze02joc=;
 b=miYQELsLfFhU6zEexvNofFMeFMrNYu3v4G/3ZHoEbOBqBm4Pxh9pJfwPWUXrGaWMCMbqiDqVfC7hXcEXClcK3qHmDu7Q3V/5r3k1aIWpOcRBz4cEByFrf82KKgyoqr37WBHANDT9wSqjQ/7yXg8KmIYeDXmFaHnMfYDgelFCWIk=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB8689.eurprd04.prod.outlook.com (2603:10a6:20b:428::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 03:10:54 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 03:10:54 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
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
 "festevam@gmail.com" <festevam@gmail.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v6 2/8] dt-bindings: display: bridge: Add
 Cadence MHDP8501 HDMI and DP
Thread-Topic: [EXT] Re: [PATCH v6 2/8] dt-bindings: display: bridge: Add
 Cadence MHDP8501 HDMI and DP
Thread-Index: AQHZnyaUSqWcaXcpFUGfi3kfofmdrK+NLGuAgARHK1A=
Date: Mon, 19 Jun 2023 03:10:54 +0000
Message-ID: <PAXPR04MB9448EEE464E997C41EEB7D7EF45FA@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <8687f2221299b120e12f29fdccf264e120227bd7.1686729444.git.Sandor.yu@nxp.com>
 <3439354.PYKUYFuaPT@steina-w>
In-Reply-To: <3439354.PYKUYFuaPT@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AS8PR04MB8689:EE_
x-ms-office365-filtering-correlation-id: 28c23497-979e-440f-a76a-08db7072cb36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uL5uopkOBdfJSwSNKnCG8cX60CIxIW9i6PTHPoaKeUgq/HWr92oMx+zkRCqDdLFef/o/CHP8l51szmfy6lE659+Z6Qu0cBayarBe9PbEIwGdoG3RD0Ik0Mh0GARFpG8nNyDHgksun70S0DQSnoqfqZ3nc6ENLl4HW1ZxllbcuKe+QRfz8OUiMkSw/7KjK+vbnwUSzZiDUkF+wNts390lOhjShzwVsUYViow344uXj5COsMNpwbOkBVMyJIk5iwrqR8o/MoQNpgqzhxNI57lf0Jhzislt7MdJiDid+qG8ol6g9LRh9fdRXmInRLRWRjMi31Qhtp2bhbFWnwT5Ac7dC4Aovi195Am00Q2OZWi3zhgwws8CbSCibHroNmBPylohCXFofq2mwrA8DG7ZRt9Tp29od5C+awMYTVZtBXNY04xrYzcfmIwA48Vn8/e9SBEU7ANX2/94SYhzpQKj0whouLnOexMf754GsHfsdHjC7mdJ6KOgUoxuyAY0kTbOhp/fhl3dOrjUHikWYGYzzIlEaUVVzyuY+L9+Wdj7yBZ9uAl/CwpqRge2OAhi1YbnvgasLg7K6FWFJEuVEVZNWz5eq/F5nx0JIYiVwumuJlNArHxnPVOPY1kFp8Sj2LqTcMcD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199021)(2906002)(41300700001)(44832011)(7416002)(52536014)(5660300002)(38070700005)(8676002)(8936002)(33656002)(55016003)(86362001)(966005)(478600001)(45080400002)(71200400001)(7696005)(83380400001)(66574015)(186003)(26005)(6506007)(53546011)(9686003)(54906003)(110136005)(316002)(38100700002)(122000001)(921005)(64756008)(66446008)(66476007)(66556008)(4326008)(76116006)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFkwaW9yaWhubFMrdkNjK0RSRytMUGlYcFRGUFYwVG5zWlZVbjcxOS9kRE1n?=
 =?utf-8?B?U1lmempzWVE3YUcvcDhzc1Z6YlFkRjltUkJqR1FZYWF6bDRoL0twVGIwcWJ1?=
 =?utf-8?B?c1dnU3lmL3dQYUZ6RFlyQS9HZ052RitBdWVsaTVwbGtaQ3NoVXNtSWZPQ0FJ?=
 =?utf-8?B?TU85QlJ6M2RtSU9XcmVUSjNlTGdrMmJTN1AzSkc1RFgvT3JEZTJnK0ZUdk5t?=
 =?utf-8?B?eHJ0eC9MSDBqc1lSU0VCakxTWDFwRnAwVms3c0FEZmVHYkZaQWNmb0hKSmtv?=
 =?utf-8?B?WHM5T3NmOWRnOHBTMVdlUjBJQUk2UXRRZ0M1R3VibkdBajh2aUVpQXFYOHp1?=
 =?utf-8?B?NCtXSkt3T1FOQXFsbm1ranNYL08xRXQ0TTZZd280c2xyTndWOVUwWHJFMm91?=
 =?utf-8?B?TS8wdFZiUHViVG9ncDcxSkh3SW9LOTgyS3dnb2d6WkFOcGhKeGJNeUYvUDlG?=
 =?utf-8?B?RUQwVzJreXJidXhpK1BISklKRDNKUmxhcVNKQnV1MDZWYjFIdlZDV3pGa0N5?=
 =?utf-8?B?R0ppdUt0WkswNnpna1ZKQ0ZEeFZxTm9OeHJGWmh2dUgrcnpiVWRnOHhVTDBn?=
 =?utf-8?B?R2dnbnZ6a3pEaWJsUk5MN05MaVZsbHU3VGxsWDRKTWtVS3hsb2NVZFRpc0hw?=
 =?utf-8?B?YkovVkZpMDg5bnNDa2JEbk5MR0hwYUg2aU5ZbWVmcjdUYlVSQ3c4eDk2ZWpm?=
 =?utf-8?B?SnpFQm1BYUNBOG9qRkJJUEtUcS9EcjZnQmZ0Z1Fsdkkramx1VnVUckFFLzBV?=
 =?utf-8?B?LzRJQ2U4NWxPRDdLNmxOWjhXTklHcjRucEtDNEdtL1FMQWk1c0Myby9PYlE1?=
 =?utf-8?B?WnNXc1BCWmNvZy9sejBrb3VINjRSZmJEN0Q0SVpyZnpvUlRBdjVJZnZBanJB?=
 =?utf-8?B?MDBSNVVaRCtrRkJJVHFIeDBjWlZDSlBTdytvM2xsVGVPYThQckJDUDdya3ZE?=
 =?utf-8?B?OEo2S1p4MmM5V28waFdmSnRCVi9qS2kvWVZpYW0yU2JUWU1IbEk1OEFTaXNM?=
 =?utf-8?B?dFltR0hlTFgxbzhJRHZFcnpSZzJyRHRwcmJHMW1tbUpVV1dOTjJMai9kajhh?=
 =?utf-8?B?WlNZZmt3bEFZcGRmc3dLNlFoRk9DTjBvSHpLZ25xV3pKOHFhd1lJdnhmK0hB?=
 =?utf-8?B?ODVuTVBiZ2F0dEQ0cTFFOE84a3VQWXhCVE00RVo3K3VLSmtmSlk2VkxQWnEr?=
 =?utf-8?B?anFDbFM2RFVyTWduWFQ0SjBxQ3BKL0p6eDZKQTh6Yno0dFk1UGpRZGZzbUlr?=
 =?utf-8?B?OHpSMWNLRmUrVnNhWWpkeTVDR3FXanB2RDdDTGxqbkNObHJvNmxvYklVZklG?=
 =?utf-8?B?ZmJPN1l5YWE2cmErRnRsOS9XVWtKR3BOWkl2Qm1FODRHRVl4dUwvMTBrODcv?=
 =?utf-8?B?dGtXK1J6Sjg0c0hoTlhhVUtpMkxCS0R4ZGJCSW5XaFpZUmFHYzNJZFNpZklx?=
 =?utf-8?B?amRtMUszbDhnQzRQT3NKdllnUER5akxEVDBvcGhrSDRtbHUwcnB4MDkrd2RD?=
 =?utf-8?B?S1l0YjdFOWNXbDB5c1JTUnI4KzF3WGRkbThRL2QzY01WQXRtUTY3YlRldDg2?=
 =?utf-8?B?NzlVT2NHcDlzQnZmT2xScG9CbW5QQXZjMTVKbTduQWJ1bzBnb1orcm16dVJ4?=
 =?utf-8?B?UGg0elRrNmdtZnJEL09vZXJxdE1SbEV2b29sYmQ2SEpmaGhmRzEzajVBR0tD?=
 =?utf-8?B?U0d5Q3l5Z210RXphSGh0QTNhL2FBc0pyWDJ6UlFONVl4N1M0Q2lsZlppQXlB?=
 =?utf-8?B?eG05bEFWUThTZXRySFJyQjZpb1dBbklnU1poWmdmOFpoNEtEYVVTd2JYRlk1?=
 =?utf-8?B?VTNDcnNib0IxdW0rYmdsdDJxNFFsa05oODAybmR1T0UrRmh5OWJvcmVjeTdK?=
 =?utf-8?B?di9uaHY0Ymc2bFlkaW55a1E4RFdtRXBXUnQzSm15YUF5YzFsdUNIK3E0enRn?=
 =?utf-8?B?cFQ0SnJTVk5FZGw2M00vSnpsMllYVUIrS29hUm9rZHBvaEhyY3JYQTlqQ3Ji?=
 =?utf-8?B?cWtTNmR3RmR6OWIwNHJhY0V5YlpURDN0a1d2OE1CNjdRK05wdTdsRXRMRDlN?=
 =?utf-8?B?UnZXS0d1czFZME5VVUFDWmNCTThvQi8zL1dTUzdGOGtEV09vTEZZM2NqZG1k?=
 =?utf-8?Q?nlpk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c23497-979e-440f-a76a-08db7072cb36
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2023 03:10:54.0454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /I2VkO7j6LdYQuWGGYPCpUPuK8pXFEIe2Rj4oyHSYjFZ1zgHfKJTw/b7qdJIkeR+ySdoMrcXmI8PcXt4uWkIjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8689
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

SGkgQWxleGFuZGVyLA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMsDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIFN0ZWluIDxhbGV4YW5kZXIuc3Rl
aW5AZXcudHEtZ3JvdXAuY29tPg0KPiBTZW50OiAyMDIz5bm0NuaciDE25pelIDE3OjMyDQo+IFRv
OiBhbmRyemVqLmhhamRhQGludGVsLmNvbTsgbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZzsNCj4g
cm9iZXJ0LmZvc3NAbGluYXJvLm9yZzsgTGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29t
Ow0KPiBqb25hc0Brd2lib28uc2U7IGplcm5lai5za3JhYmVjQGdtYWlsLmNvbTsgYWlybGllZEBn
bWFpbC5jb207DQo+IGRhbmllbEBmZndsbC5jaDsgcm9iaCtkdEBrZXJuZWwub3JnOyBrcnp5c3p0
b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc7DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1
ZXJAcGVuZ3V0cm9uaXguZGU7IGZlc3RldmFtQGdtYWlsLmNvbTsNCj4gdmtvdWxAa2VybmVsLm9y
ZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtcGh5QGxpc3RzLmluZnJhZGVhZC5vcmcNCj4g
Q2M6IE9saXZlciBCcm93biA8b2xpdmVyLmJyb3duQG54cC5jb20+OyBTYW5kb3IgWXUgPHNhbmRv
ci55dUBueHAuY29tPjsNCj4gZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IGtlcm5l
bEBwZW5ndXRyb25peC5kZTsgU2FuZG9yIFl1DQo+IDxzYW5kb3IueXVAbnhwLmNvbT4NCj4gU3Vi
amVjdDogW0VYVF0gUmU6IFtQQVRDSCB2NiAyLzhdIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBicmlk
Z2U6IEFkZCBDYWRlbmNlDQo+IE1IRFA4NTAxIEhETUkgYW5kIERQDQo+DQo+IENhdXRpb246IFRo
aXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hlbiBjbGlja2luZyBs
aW5rcyBvcg0KPiBvcGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhl
IG1lc3NhZ2UgdXNpbmcgdGhlICdSZXBvcnQNCj4gdGhpcyBlbWFpbCcgYnV0dG9uDQo+DQo+DQo+
IEhpIFNhbmRvciwNCj4NCj4gQW0gRG9ubmVyc3RhZywgMTUuIEp1bmkgMjAyMywgMDM6Mzg6MTIg
Q0VTVCBzY2hyaWViIFNhbmRvciBZdToNCj4gPiBBZGQgYmluZGluZ3MgZm9yIENhZGVuY2UgTUhE
UDg1MDEgRGlzcGxheVBvcnQgYW5kIEhETUkgZHJpdmVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogU2FuZG9yIFl1IDxTYW5kb3IueXVAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2Rpc3Bs
YXkvYnJpZGdlL2NkbnMsbWhkcDg1MDEueWFtbCAgICAgICAgIHwgMTA1DQo+ICsrKysrKysrKysr
KysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTA1IGluc2VydGlvbnMoKykNCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2NkbnMsbWhkcDg1MDEueWFtbA0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2NkbnMs
bWhkcDg1MDEueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2NkbnMsbWhkcDg1MDEueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
IGluZGV4IDAwMDAwMDAwMDAwMC4uYTU0NzU2ODE1ZTZmDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+
ICsrKw0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRn
ZS9jZG5zLG1oZHA4NTAxLnkNCj4gPiArKysgYW1sDQo+ID4gQEAgLTAsMCArMSwxMDUgQEANCj4g
PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKSAl
WUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDoNCj4gPiAraHR0cDovL2RldmkvDQo+ID4NCj4g
K2NldHJlZS5vcmclMkZzY2hlbWFzJTJGZGlzcGxheSUyRmJyaWRnZSUyRmNkbnMlMkNtaGRwODUw
MS55YW1sJQ0KPiAyMyZkYXQNCj4gPg0KPiArYT0wNSU3QzAxJTdDU2FuZG9yLnl1JTQwbnhwLmNv
bSU3QzZlZjJjNzMyYjM2NzRjYjI4OTZjMDhkYjZlNA0KPiBjODI3YiU3Qw0KPiA+DQo+ICs2ODZl
YTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0MwJTdDNjM4MjI1MDQ3MTA1NjEyMjUN
Cj4gOCU3Q1Vua25vDQo+ID4NCj4gK3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01E
QWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazENCj4gaGFXd2kNCj4gPg0KPiArTENKWFZDSTZN
bjAlM0QlN0MzMDAwJTdDJTdDJTdDJnNkYXRhPURHWVl0MkxRJTJGaGxOQlZkMm0wcw0KPiBhWFRt
OUlvS0t3bg0KPiA+ICtYN0NUVHBsaGJMeGNJJTNEJnJlc2VydmVkPTANCj4gPiArJHNjaGVtYToN
Cj4gPiAraHR0cDovL2RldmkvDQo+ID4NCj4gK2NldHJlZS5vcmclMkZtZXRhLXNjaGVtYXMlMkZj
b3JlLnlhbWwlMjMmZGF0YT0wNSU3QzAxJTdDU2FuZG9yLg0KPiB5dSU0MG4NCj4gPg0KPiAreHAu
Y29tJTdDNmVmMmM3MzJiMzY3NGNiMjg5NmMwOGRiNmU0YzgyN2IlN0M2ODZlYTFkM2JjMmI0YzZm
YTkNCj4gMmNkOTljNQ0KPiA+DQo+ICtjMzAxNjM1JTdDMCU3QzAlN0M2MzgyMjUwNDcxMDU2MTIy
NTglN0NVbmtub3duJTdDVFdGcGJHWnMNCj4gYjNkOGV5SldJam9pDQo+ID4NCj4gK01DNHdMakF3
TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzDQo+
IDAwMCU3QyUNCj4gPg0KPiArN0MlN0Mmc2RhdGE9U2tURllNN0hIZ0ptRlVreW8zRnRmJTJCOEZk
R3FsbnR5MENoNmdnd1NQZUxZJTNEDQo+ICZyZXNlcnZlZA0KPiA+ICs9MA0KPiA+ICsNCj4gPiAr
dGl0bGU6IENhZGVuY2UgTUhEUDg1MDEgRGlzcGxheXBvcnQgYnJpZGdlDQo+ID4gKw0KPiA+ICtt
YWludGFpbmVyczoNCj4gPiArICAtIFNhbmRvciBZdSA8U2FuZG9yLnl1QG54cC5jb20+DQo+ID4g
Kw0KPiA+ICtkZXNjcmlwdGlvbjoNCj4gPiArICBUaGUgQ2FkZW5jZSBNSERQODUwMSBEaXNwbGF5
cG9ydC9IRE1JIFRYIGludGVyZmFjZS4NCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAg
Y29tcGF0aWJsZToNCj4gPiArICAgIGVudW06DQo+ID4gKyAgICAgIC0gY2RucyxtaGRwODUwMS1k
cA0KPiA+ICsgICAgICAtIGNkbnMsbWhkcDg1MDEtaGRtaQ0KPiA+ICsgICAgICAtIGZzbCxpbXg4
bXEtbWhkcDg1MDEtZHANCj4gPiArICAgICAgLSBmc2wsaW14OG1xLW1oZHA4NTAxLWhkbWkNCj4g
PiArDQo+ID4gKyAgcmVnOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgY2xv
Y2tzOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArICAgIGRlc2NyaXB0aW9uOiBNSERQODUw
MSBEUC9IRE1JIEFQQiBjbG9jay4NCj4gPiArDQo+ID4gKyAgcGh5czoNCj4gPiArICAgIG1heEl0
ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGludGVycnVwdHM6DQo+ID4gKyAgICBpdGVtczoNCj4gPiAr
ICAgICAgLSBkZXNjcmlwdGlvbjogSG90cGx1ZyBjYWJsZSBwbHVnaW4uDQo+ID4gKyAgICAgIC0g
ZGVzY3JpcHRpb246IEhvdHBsdWcgY2FibGUgcGx1Z291dC4NCj4gPiArDQo+ID4gKyAgaW50ZXJy
dXB0LW5hbWVzOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gY29uc3Q6IHBsdWdfaW4N
Cj4gPiArICAgICAgLSBjb25zdDogcGx1Z19vdXQNCj4gPiArDQo+ID4gKyAgcG9ydHM6DQo+ID4g
KyAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnRzDQo+ID4gKw0K
PiA+ICsgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgcG9ydEAwOg0KPiA+ICsgICAgICAgICRy
ZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydA0KPiA+ICsgICAgICAgIGRl
c2NyaXB0aW9uOg0KPiA+ICsgICAgICAgICAgSW5wdXQgcG9ydCBmcm9tIGRpc3BsYXkgY29udHJv
bGxlciBvdXRwdXQuDQo+ID4gKyAgICAgIHBvcnRAMToNCj4gPiArICAgICAgICAkcmVmOiAvc2No
ZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQNCj4gPiArICAgICAgICBkZXNjcmlwdGlv
bjoNCj4gPiArICAgICAgICAgIE91dHB1dCBwb3J0IHRvIERQL0hETUkgY29ubmVjdG9yLg0KPiA+
ICsNCj4gPiArICAgIHJlcXVpcmVkOg0KPiA+ICsgICAgICAtIHBvcnRAMA0KPiA+ICsgICAgICAt
IHBvcnRAMQ0KPg0KPiBZb3UgbWFyayB0aGVzZSBwb3J0cyBhcyByZXF1aXJlZCwgYnV0IGFwcGFy
ZW50bHkgdGhlIGRyaXZlcnMgZG8gbm90IHVzZSB0aGVtLA0KPiBBRkFJQ1QuIEUuZy4gbWlzc2lu
ZyBwb3J0QDEgaXMgbm90IHJlc3VsdGluZyBpbiBhbiBlcnJvciwgYXQgbGVhc2UgZm9yIEhETUkg
b25lLg0KPg0KWWVzLCBwb3J0QDEgaXMgbm90IHJlYWxseSBuZWVkZWQsIEkgYWRkIGl0IGp1c3Qg
dG8gZm9sbG93IEhETUkvRFAgZnJhbWV3b3JrIHRoYXQgc2FtZSBhcyBvdGhlciBwbGF0Zm9ybXMg
aW4gY29tbXVuaXR5IGNvZGUuDQoNCkIuUg0KU2FuZG9yDQo+IEJlc3QgcmVnYXJkcywNCj4gQWxl
eGFuZGVyDQo+DQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4g
PiArICAtIHJlZw0KPiA+ICsgIC0gY2xvY2tzDQo+ID4gKyAgLSBpbnRlcnJ1cHRzDQo+ID4gKyAg
LSBpbnRlcnJ1cHQtbmFtZXMNCj4gPiArICAtIHBoeXMNCj4gPiArICAtIHBvcnRzDQo+ID4gKw0K
PiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1wbGVzOg0K
PiA+ICsgIC0gfA0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2lteDhtcS1j
bG9jay5oPg0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9s
bGVyL2FybS1naWMuaD4NCj4gPiArDQo+ID4gKyAgICBtaGRwX2RwOiBkcC1icmlkZ2VAMzJjMDAw
MDAgew0KPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLGlteDhtcS1taGRwODUwMS1kcCI7
DQo+ID4gKyAgICAgICAgcmVnID0gPDB4MzJjMDAwMDAgMHgxMDAwMDA+Ow0KPiA+ICsgICAgICAg
IGludGVycnVwdHMgPSA8R0lDX1NQSSAxNiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgMjUgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4g
KyAgICAgICAgaW50ZXJydXB0LW5hbWVzID0gInBsdWdfaW4iLCAicGx1Z19vdXQiOw0KPiA+ICsg
ICAgICAgIGNsb2NrcyA9IDwmY2xrIElNWDhNUV9DTEtfRElTUF9BUEJfUk9PVD47DQo+ID4gKyAg
ICAgICAgcGh5cyA9IDwmZHBfcGh5PjsNCj4gPiArDQo+ID4gKyAgICAgICAgcG9ydHMgew0KPiA+
ICsgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgI3Np
emUtY2VsbHMgPSA8MD47DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICBwb3J0QDAgew0KPiA+ICsg
ICAgICAgICAgICAgICAgcmVnID0gPDA+Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgIG1o
ZHBfaW46IGVuZHBvaW50IHsNCj4gPiArICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9p
bnQgPSA8JmRjc3Nfb3V0PjsNCj4gPiArICAgICAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICAg
ICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICBwb3J0QDEgew0KPiA+ICsgICAgICAgICAg
ICAgICAgcmVnID0gPDE+Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgIG1oZHBfb3V0OiBl
bmRwb2ludCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZk
cF9jb24+Ow0KPiA+ICsgICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgICAgICAgfTsNCj4g
PiArICAgICAgICB9Ow0KPiA+ICsgICAgfTsNCj4NCj4NCj4gLS0NCj4gVFEtU3lzdGVtcyBHbWJI
IHwgTcO8aGxzdHJhw59lIDIsIEd1dCBEZWxsaW5nIHwgODIyMjkgU2VlZmVsZCwgR2VybWFueQ0K
PiBBbXRzZ2VyaWNodCBNw7xuY2hlbiwgSFJCIDEwNTAxOA0KPiBHZXNjaMOkZnRzZsO8aHJlcjog
RGV0bGVmIFNjaG5laWRlciwgUsO8ZGlnZXIgU3RhaGwsIFN0ZWZhbiBTY2huZWlkZXINCj4gaHR0
cDovL3d3dy50cS8NCj4gLWdyb3VwLmNvbSUyRiZkYXRhPTA1JTdDMDElN0NTYW5kb3IueXUlNDBu
eHAuY29tJTdDNmVmMmM3MzJiMzY3DQo+IDRjYjI4OTZjMDhkYjZlNGM4MjdiJTdDNjg2ZWExZDNi
YzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDDQo+IDAlN0M2MzgyMjUwNDcxMDU2MTIyNTgl
N0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3DQo+IExqQXdNREFpTENKUUlqb2lW
Mmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0MNCj4gJTdDJTdD
JnNkYXRhPXhKZExpMkhKNzJTaEJ3VCUyRmZVZFozdUx4JTJGSUpFUG1UUUpIR1ZYZTBKVmlrJTMN
Cj4gRCZyZXNlcnZlZD0wDQo+DQoNCg==
