Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9E652B32B
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 09:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A448C113E46;
	Wed, 18 May 2022 07:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2123.outbound.protection.outlook.com [40.107.215.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1856110F69C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 06:00:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HELRqeYMjw9QlW41auR8qcsAtbo5iyec5K9SD/sHTjPNtvAVe7TQtSCn+aZdWvQKkzbhuDkVgMyaM18qCk/QeCPjGOKGvOWS9e52Hk5KeFVo4rP/f/lqlhfycd0ZTFUIALSzlcgxUdPNqRVO7M44owEDM6cvkEA4L4pggCYCiYgAtrbcL5L225AZ+YUW4qrQBOndAYDzODl6AkfXmVPB5b7psHDC1sIFYEefzlDN2Fycg1YkWwxVCabvBQnmqEZFzhOc7fcB32yVtZdW5JQPEnbjGWEd3HyMd2LWJ/PVmFPPYcJABZ0515wqWVRtodQw1IwH2pvKcNLn8Y4VQlu1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKJ6uWWHj+eojVUiYZlE6YxOLwYpHbsCOCTSyfGWKjA=;
 b=IGuaWsiAubMXJLore4QahPtbBnLZSqMNiG01TgbJkPCM4ArepGF2IZQLHPbUm1lE38Y2Co05xW3Qr2smtSEm84P8H6e99JCQMmzGeznB4P55DR+4ITcpKJZtURrLN4W/auNl8Qma0aAeKjP3W3ssurPYWGP+U65Gzil140xtt5SjBBs14z+jIXgM/rOPKhsVo3djoDqR3MGc0cEnefotUkrmoUa/gXrl6aqGiS6+32qb7n9LuXaKJvxa1yA+E2RFCd8NbPq1fzZZx5JPnY65uaLQjUB4KFCQYYppp3Iq5kfs80sKKYMmd3Wl1jzkwnD7Tz/pxLdcTDXg5VKRCxV6wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKJ6uWWHj+eojVUiYZlE6YxOLwYpHbsCOCTSyfGWKjA=;
 b=D1tKcmTUxWNNY3LN0C6zbS5WFKuVtKwIM9Wcnu7wB0Ca6MJJYwC7Abddbw+233koCy/ihpj6EA8RnpFgvA4bk6z49nF+ioAumcMAEz05WQpEJuam8jhCicntDltDf0NOSzfD1bm4QukPICpT/8brqaydkcvbV69PFYCSHQBTCmpFBlFLzo/IkSZf+Q2YPbLNBzT+Fe+NNTvTMP335RPYfxE1DkNXVNKKSBhz+UZEr7jHWMYCLyhx681CSYlYl6tE7+vI6lfxWlVOM8jHUp5kGdYcoz3dJjNBBhnTLzTJWwW5bmvA36Lf4Cgmn7xI8y9wR/SjRvfVgSqa6xURxXCDoQ==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by TYAPR06MB2189.apcprd06.prod.outlook.com (2603:1096:404:1d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Mon, 16 May
 2022 06:00:28 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8%7]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 06:00:28 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Felipe Balbi <balbi@kernel.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Li
 Yang <leoyang.li@nxp.com>
Subject: RE: [PATCH 3/3] dt-bindings: usb: add documentation for aspeed udc
Thread-Topic: [PATCH 3/3] dt-bindings: usb: add documentation for aspeed udc
Thread-Index: AQHYZpbGEu2wf1faFk6PWys4YB7zt60chHIAgABrQWCAAeOiAIAB7Q9ggABFH4CAAAGjQA==
Date: Mon, 16 May 2022 06:00:28 +0000
Message-ID: <HK0PR06MB32029ED5503C616E0AF5899280CF9@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <20220513065728.857722-1-neal_liu@aspeedtech.com>
 <20220513065728.857722-4-neal_liu@aspeedtech.com>
 <da78aaf6-c9ae-d591-fdc4-723f097ace2c@linaro.org>
 <HK0PR06MB3202679A7FABAF7D0D045F0880CA9@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <567d135b-3d40-9958-e000-1357020b5650@linaro.org>
 <HK0PR06MB32020539063F8A7C5D56E0B980CF9@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <3499cca2-1d7b-12f5-adbe-0c9b279cc51a@linaro.org>
In-Reply-To: <3499cca2-1d7b-12f5-adbe-0c9b279cc51a@linaro.org>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9f249e5-ac0a-480b-0379-08da3701608f
x-ms-traffictypediagnostic: TYAPR06MB2189:EE_
x-microsoft-antispam-prvs: <TYAPR06MB218948AF246BCE7BCD94A36A80CF9@TYAPR06MB2189.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3biOTW0T3sR3hqbnSh7FDNF+cneKS0yAoBU2DscnMSAq5fB0E6fQfvJpYQNzZkrmHNzRkSN24se8cBQPT0aoN7jnEigzjSo/ZeaqKUHGXA3D54n+mo97vy6gSMW5MnICXS+4IcCnYJn/ulNK4qIEKG6I2n0X9LJxS/St5bH8zxZiy0aTa1oJ4f7K4js3LplfDTLNM7OH6nhM+VukVmq/MFZVUeE0Qx/k6h/RBfEyj60cOLCjcmxXd0dTPJvDVqQOug1XTfQVCuhbdLDXi23LAI41jE2EAcoCSoXh61AEuArZSM8kYr5NL0nB9KVQ/387V8tOd/kHFZQ0dInmhVPXJIKul5i995lM9mctYlk8ydY5mLd33p7iTrg74DGfAPDfBNEIGEGph5JulQVmFtB2cBS7p42z/s/YvY9Jewx+jbsHsHS2hWyZ62/IAxcPOyKmV4DMrEFzBQrnqsCCQsTKemT/mXJuMlekhAYSUT75cv02BnRzlaH3OyR8yloblv+6LdZiixj3zyvdhPAnNAd9Ztv7eRfs2mdl933+fgZZ2jGaZ2Cnhvf+J1Qfv/dOlmABt1+3k/PfjOrnEPvYVvqezanFpjP7gDpHl9CYxYPxk+0Ib1OHiFSKDiuAF5Jt85fKkpZCubVPG0pdmtnDrGKuZqWVx1v4NAVMgkvR6WMcqKPmyKXrtjDI7dQbaz98ZmsFxgPiQO0ytrWOlCLfnQklYHiwPrIjH50vND9WDVXWPFM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3202.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(396003)(136003)(39840400004)(376002)(346002)(316002)(38070700005)(66446008)(38100700002)(41300700001)(8676002)(4326008)(122000001)(508600001)(2906002)(76116006)(7696005)(66556008)(921005)(86362001)(53546011)(110136005)(6506007)(9686003)(71200400001)(52536014)(8936002)(83380400001)(54906003)(7416002)(5660300002)(55016003)(66476007)(186003)(33656002)(64756008)(66946007)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVVoVmlyTjEvT2lwNmh3RlVmMWdKUUZmUC9XK1pYcTIzY3BZeDdBSTVJU1FS?=
 =?utf-8?B?UGlLSkhZWk0raUdtSktMRGRZeWovdUkxNzhNZGd3bmNHYk1KVTNaZ09ESENX?=
 =?utf-8?B?dkRMS2pHWVhLL05EbnN0Zm1zN1U3QXZ1NSszMmVXRUl3M1pOTEVoNGZ2ZUY1?=
 =?utf-8?B?ckgwaGhDMlVtbTFCMHhYMEtvaXp2OGxJd2VjL016YlcvYVVYemZnZ3daTlVT?=
 =?utf-8?B?b0tEZUkyTG1VQlBRenBRaDdyNEhBWTF6OWZ4NXJLU3N1VHpwSlk4YWNYZ2t6?=
 =?utf-8?B?QWlpaXdLL2tpelByNUt2QW1HRXhpK0VFVjFicS9JT3ZNSWVabjdxUVZTY01Q?=
 =?utf-8?B?UnlXR2hkc2g3UlE4b2EwdUl6RTFvVm9rbk1MdmNRMkhGc0ttLzJlOHVzQUlQ?=
 =?utf-8?B?SnpRSDArbHlQMXc2Q3RyS0xOd09JVjNFT3l6UXBRcjc3SmlNZmNrdTRQN3Nu?=
 =?utf-8?B?TzkrY01NYnRFVjdKOTJreElpMkxMY0dYVW9zYXI2VWdNZkdJeHJVczNxaGhM?=
 =?utf-8?B?WGd0RGRWVmpBSmdDbEVFSHBSTHRKMDBrRnM2eWpZTVEzM2lGdE1aWXIyOHg3?=
 =?utf-8?B?VW5GQ1J3aTlBSERxa2I2U0NINlB5L0ZVdTkyK0JWSWdQbnViSWlVT0VidkpE?=
 =?utf-8?B?TnhqRy9UcmVaZG50alVlV3BrTzJJTnBPLzFwa0ZmVDJpeXNCYjZnVzVRczlL?=
 =?utf-8?B?aUZBcERNekxqRVVrcHFtZUVvMDllaE1JLzZjTndoVW8wOEttY1ljb1B5VGFu?=
 =?utf-8?B?c3c0Ly9tQTFJQkNiaVJiNVRkYnJIaWtEMDFrandZS1FqLzc1V29DWlBwODdo?=
 =?utf-8?B?ZmVqeEJsYzVBMGUxSjA3QTJ0SWxFRGhVQnJxb1VPa0FYbnZ0L2FsK3M4NTBP?=
 =?utf-8?B?M3FTamJjRitRd3VEWE0xbGZTQmZlSSs4MVVjSXRTcHJ0SlB6NGl6WVllRlJt?=
 =?utf-8?B?NlV5RExib0l4WWxpUmJVRU9qUmVzM0l4dGlobjVXOHg3SUs0V3VvMDhPeWlk?=
 =?utf-8?B?L0tpK0R0Um55L2dMS0JVL1psNWpPandoemNDYklXTG4vdWJEanFOV2tyamY2?=
 =?utf-8?B?K2l3TFBCV0Jnakp4TVJtYlVZQlQ4WldkOTBVOVBuRGRwb3dpVXU5UHFiYnVC?=
 =?utf-8?B?STJaQTdReVkzU0VmaWdYTGlhQkN2UUpieWpyVWVZZ09KbGFwMk9MRnAyZEs0?=
 =?utf-8?B?aWJYaVBMbnQ3Um56QzFNcGpvZXpzYWwxWDNZT0VyRUY1a1dBdktkUXIzL001?=
 =?utf-8?B?SDVzQkpMSmRLMkZodzV6SVZiLzVwQVRvajBpYWhXVHJienordWdFa0QzaWFq?=
 =?utf-8?B?RW1qeHB3bldrNEJ0anhnUll6SVpic0tFZ24ybEVkSjFHTWdZaVlZanRPc1Ji?=
 =?utf-8?B?eGFIMSs3ZlA2SWYrSm9TckpvWXhzLzUvbnNtUVVtcGVlWS8zbEZhY0FTSXpt?=
 =?utf-8?B?ci9iNUxXVEU4VytCYmJxazFURyt0MytkT0RHOFBHTDQwSWlQL3p1N0h1ZWFn?=
 =?utf-8?B?dStoZzFWSmZtUm43dHIzYVMwSG1wZDNGRjlyTjlleE9vT0l1N0JYdzQwM20v?=
 =?utf-8?B?blptcW5SUUFET0twYnROZXlQYnZ5cUNtenZ3NjV2UCtzVWFsSlRBNkxjeDNm?=
 =?utf-8?B?LzlXcThLdDRQbXBGVk5kMXBROGRJMGpobDh2cmM3aUw0a1RGeTdKa0wxWTJM?=
 =?utf-8?B?Mkw0YWZRZGVhbG15cTgrMktQVHVhNWM5NGk1VDZwblViMWYzSTNrN1E5RGlw?=
 =?utf-8?B?ZHNpTzdtVDhNSlVLYWJqNGgrZVlOVnF3c1FXUGdqNVpGUDdqUCtWeUs3UHdT?=
 =?utf-8?B?enRESVM1L2hsUitzenpJT3lTc0pWbEc2T0h0TnM0cUxGQ2ZxdHdaNjlTU3Fi?=
 =?utf-8?B?MitsMnZHZ1VPR2ZZbUNTWGZBbWRuSGhhZ0N2V2JiQTkzY0d6b1ppSmZzY2Jh?=
 =?utf-8?B?QWtmSGlaU1NGNUlRa2VWS1RjVnhTVldMcGsyRDZaaDQySlJjVDZobnJSRUpV?=
 =?utf-8?B?cy9aaTZkY3N1UkZJY0kvdDVyS0dJVzNqMEhiWDc1SmNVQS9ocTVlVkpoQXBO?=
 =?utf-8?B?NExnYlVlOUQzVVlvM3cvNitMMHVXbGFkM2YwZ21yQXMvQ1RSZjdHMnl4Mnh6?=
 =?utf-8?B?SFNrVURFU1JjYmtETk1HZXNwOGxNcVJNdW83MHFIa1h0a2hLREU3a2FDZmdH?=
 =?utf-8?B?R2ZWdlJ0VGs4UHpZaEpYNWhIcUZBUVV0Z1FWZUcwaU1RY201NmRVeFRpWC9j?=
 =?utf-8?B?b2kybGdnYXRIMTRscUQ4KzRqUlNObVBPNGFQV0Fna1Y1MFpqRU40RUsxbmU1?=
 =?utf-8?B?Qjc5cXhMWml6UEdwczZNKzJRTG1rQUphR1VFVnF0Y0tOTjlwejNFQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f249e5-ac0a-480b-0379-08da3701608f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 06:00:28.0670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VUFelECxuLiS4rbO+meEC2yk2X/0trfYa6bgFW1Ku8yn+cUPN8c5UvCZ/ksOwPjWOxTTDaqKtgjmpiGVYNL1Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR06MB2189
X-Mailman-Approved-At: Wed, 18 May 2022 07:13:30 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgTWF5IDE2
LCAyMDIyIDE6NTQgUE0NCj4gVG86IE5lYWwgTGl1IDxuZWFsX2xpdUBhc3BlZWR0ZWNoLmNvbT47
IEdyZWcgS3JvYWgtSGFydG1hbg0KPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBSb2Ig
SGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mDQo+IEtvemxvd3NraSA8a3J6
eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnPjsgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5p
ZC5hdT47DQo+IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+OyBGZWxpcGUgQmFsYmkg
PGJhbGJpQGtlcm5lbC5vcmc+OyBTdW1pdA0KPiBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8u
b3JnPjsgQ2hyaXN0aWFuIEvDtm5pZw0KPiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPjsgR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz47DQo+IExpIFlhbmcgPGxlb3lh
bmcubGlAbnhwLmNvbT4NCj4gQ2M6IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnOyBsaW51
eC11c2JAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDMvM10gZHQtYmluZGluZ3M6IHVzYjogYWRkIGRvY3VtZW50YXRpb24g
Zm9yIGFzcGVlZCB1ZGMNCj4gDQo+IE9uIDE2LzA1LzIwMjIgMDM6NTksIE5lYWwgTGl1IHdyb3Rl
Og0KPiA+Pj4gT2theSwgSSBjb3VsZCByZW5hbWUgaXQgZm9yIG5leHQgcGF0Y2ggaWYgeW91IHBy
ZWZlcnJlZC4NCj4gPj4+IEJ1dCB0aGVyZSBhcmUgbG90cyBvZiB5YW1sIGZpbGVzIHdoaWNoIGFy
ZSBub3QgbmFtZWQgYXMgZmlyc3QgY29tcGF0aWJsZS4NCj4gPj4NCj4gPj4gWWVzLCBJIGtub3cs
IEkgcXVpdGUgbGlrZWx5IEkgYWxzbyBwcm9kdWNlZCBzdWNoIGJpbmRpbmdzLCBidXQgYQ0KPiA+
PiBzcGVjaWZpYyBuYW1lIGlzIHJhdGhlciBwcmVmZXJyZWQuIE90aGVyd2lzZSB5b3Ugd2lsbCBo
YXZlIGENCj4gPj4gZGlmZmljdWx0IG5hbWluZyBjaG9pY2Ugd2hlbiB5b3VyIG5leHQgQXNwZWVk
IFVEQyByZXF1aXJlcyBuZXcNCj4gPj4gYmluZGluZ3MgZmlsZSBiZWNhdXNlIG9mIHNvbWUgZGlm
ZmVyZW5jZXMgKG5vdCB5ZXQga25vd24gbm93KS4NCj4gPj4NCj4gPiBXZSBjYW4gcmVuYW1lIHRo
ZSBiaW5kaW5ncyBpZiBuZXh0IEFzcGVlZCBVREMgbmVlZHMsIGRvbid0IHlvdSB0aGluaz8NCj4g
PiBDdXJyZW50bHksIEFzcGVlZCBoYXMgbm8gcmVxdWlyZW1lbnQuDQo+IA0KPiBTbyBqdXN0IHVz
ZSBwcm9wZXIgbmFtZSBmcm9tIHRoZSBiZWdpbm5pbmcuLi4uDQo+DQpPa2F5LCBJJ2xsIHJlbmFt
ZSBpdCBmb3IgbmV4dCBwYXRjaC4NClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiANCj4gQmVz
dCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==
