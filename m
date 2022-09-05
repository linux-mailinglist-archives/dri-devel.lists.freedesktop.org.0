Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFCF5AD8F4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 20:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D374F10E415;
	Mon,  5 Sep 2022 18:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2094.outbound.protection.outlook.com [40.107.113.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0E710E415
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 18:17:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7g7a3uFmBoVhlpojaNPc8XXtTb1YbhDWe5UDJ63MCaeUqdp92L1dHwqUuT3uPu6ii+5Ur2iOJB04gQWzFkyGaMEi6HaSQgESI8xp5t4OO4k81ZAWxQHf0EA/89kgAK5I1L21SHA/iWCaxiQad1sWWWL4rAI6aeKbZ+4BeuWvntySRFcVCvFOJk3qrGJP6bIjZXVy2EJRRj23f/MZGeOysNghzvbjPIf2cTnin/M7ht3hGOu1gne0hJmZgoz6ASoBAAfWhcGsj1NyyAGRzOyc9DBJ71zGKIgzJ1oIBQCBkFn11QdVDs3GaXuqc9UGCFgATSe5vTJzlY76DkHaCRXYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fWxpR45aWq/3P5zyBvCrtUZrzuf7wu6YCM37YxtrUQ=;
 b=bk176oFgcvc3p38Bde0bLcwnZJzh3tKLcsm5hogirVaTUtLG53LOAFjwQpJp2OIFCi1AizVu1yAED6sTX1hDnCRfYxa27a16VOBGiuCbuMeuGKSNaHfdc8iJSB9jYaRo/5bNBpAZFxlDrkX1o23EQwDbgtGOF7dQTxRYXGxX5XvC7dGqJnpu7OOYac6Ygp3nEgiXjRtcpPFrvEbXJlnM91Qt2inQbqA8if0UHVJxhyYwVSPf7iaL8F/jsfmI1gk1wGiy9HkIhKhqTVSuzYVmUTaLAgbbyXd+Vv9xKoPjY9CcjZwDjFeHg2O/1t3BbefOXqf16oYJTjHwqV0UQV6vtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fWxpR45aWq/3P5zyBvCrtUZrzuf7wu6YCM37YxtrUQ=;
 b=B8raKjUmErd6SQnbm0IZQ6upylhvxEDRMws0MLvhCCY/ohtN6vqzpLiCLsJ9EgYNEEZNEHMd5MR7+hgeytJ+Os67hqIjyJe/2g1Nq8vgF16mqX8UW64pS4K7RFgqsT77o2XvOv6JbY6jcoB7rg0DTnQduEaYw1fkcHQP/Gaj9nA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB10354.jpnprd01.prod.outlook.com (2603:1096:400:252::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 18:17:09 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%4]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 18:17:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price
 <steven.price@arm.com>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Bjorn
 Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, Marcel
 Ziswiler <marcel.ziswiler@toradex.com>, Vinod Koul <vkoul@kernel.org>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the recommended
 one to configure and enable regulator
Thread-Topic: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the recommended
 one to configure and enable regulator
Thread-Index: AQHYwUs0AungGCQLKE+37Dc5lKmkg63RIy3A
Date: Mon, 5 Sep 2022 18:17:09 +0000
Message-ID: <OS0PR01MB5922142861E78A1DD81AD1C9867F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220905171601.79284-1-peron.clem@gmail.com>
 <20220905171601.79284-5-peron.clem@gmail.com>
In-Reply-To: <20220905171601.79284-5-peron.clem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffe0f1ac-0885-444d-d165-08da8f6ad903
x-ms-traffictypediagnostic: TY3PR01MB10354:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sLXz8fBEIZ+XSNZSp1u2QMfsdp1yhuZHdGCqeCs27jIsDh9zpNMzjGLYuxJyZ0c87+eWN8aYxUzkZsfBVr+DNuJghslhlFWIm0m4WDSG+EVS3hwzMch5rno7oXBaiJzt5auyXwXr7WSNZEo7gPh8+S/3rFZ6JNzKyqbLf476Lz9fzugx+d9N0OZCuC1IWJ/ZS2I597doC1N2ADgdH0U0jFWVzo2ZUdzXTjVNAthoYmdeAPOk2TRduQXS4YBfJ3wDQhczDY2T9j7OQfn6Em8CPVVdlNSR10yAr28RgNq7Nu0SCMYJCvcccRDnlbbQcTK4uF5t4aMRIAD61W3xwZPCVOQ8z3a0VR0CpfM6ENq/3ABQE8/8oi7bbB8p3I9PyYZQHkxbL7VqSRopl3Ukq/L6XK5EdvzEC0FSbROxIPUl/G71XRGZ5UdXeLRVNNh4VFMVqxXf8r5sqLw4JfmN+F+4WZ76HCUkuFjLPRRpOjbSbhNF9RAs4YNtfjFMmc6m1c98q3Biq0h0quR1axvGdylxkFiHfGSu9WiOosRNZBKV0yr0Z9RVtQogxrBsnMUPUAgQunaEMhGQOf0sJchsQimlaU7wTuzwguwKs54QCjGKAsP0AHc9WJlrNN4q9HQzmq6FFbWuQo47/AcvCLRMhlx0QbnSTE7bd3eGzDjXasn8ZzhFmR51hi5YNEqNuOzhhNUaOLY5471b9EReM/zdvEg2UAkkDEyVkt8YgmyEJxZrA6aJhiolOvl+0Gtkzh0ESGQiB6s59GT1qA8sGsA06w3N1BOSaft5xp9BJ5BxaSkNpHg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(64756008)(66476007)(76116006)(8676002)(66946007)(4326008)(41300700001)(316002)(66446008)(110136005)(54906003)(66556008)(33656002)(186003)(26005)(9686003)(86362001)(52536014)(8936002)(2906002)(55016003)(5660300002)(921005)(38070700005)(7696005)(7416002)(38100700002)(478600001)(6506007)(71200400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGk5cUw1TUNyckxhU0xSNndIbU5QRzNxQlI4Y2plUGFVQVE1Y0RGSk1PRlhy?=
 =?utf-8?B?d0FzbEdYS1lIWE1FV1RmTGpsNkp4KzVZSWRVRTlaNHFUdFFIajNSL3oyRTVH?=
 =?utf-8?B?TjBHVzlSTjNkajZSTDVUQXkyVXA0Y2ZYMWNuTkZCTmg1Rnc4WjNIUE9uMVZZ?=
 =?utf-8?B?N3IvVVdKK0p3bXBKcitOcWNiQ3hHVmFVNWRBWEw2R0Q4SkhLMnFKNVY5MmdJ?=
 =?utf-8?B?K2lrL08weEpIYjBjSXh1L2Q1bmNiNEt6cGlRZ2hSdmk0RFlSak5PcVlwbU9k?=
 =?utf-8?B?T05oTDczUjJ3dGxWVmF2MjRvWkhXSHVFeXdLdGJNc2ZtZFBSUVltcHVJRm5s?=
 =?utf-8?B?NEtJTGxKa1RoQlduTHdKNVhBaTM4dkpucjI5M1ZxU2s1a2xjVUZyaitQRytW?=
 =?utf-8?B?VWs4Q1RmZS9PVkozWUE3a29MYzhqQnZ1R3hybXIwdnlYQXpqbVMwcEc5cHNp?=
 =?utf-8?B?ZG9BaEwxcDgvOThmMVhaUGtyWkFlTzZINDl6cUZBTE5tWHZLYkVxcFo2THB2?=
 =?utf-8?B?S0lTb1F1TlVmeUlhV21qWGc4ME1rYXFVNkhCY0NXcDJlNXlvTDlITFd3V0hZ?=
 =?utf-8?B?a2E1Q3E5bEc4aGdGMlU5RjNQZkFWZG5HMm1yVG13MmRjeDVHdWZ2eWdvK1JZ?=
 =?utf-8?B?S211OWM5ZXBHdDNsSllUcmVFZGo2RElWNTFHQ1pva3lxY0Zqd01NRHFYWFFJ?=
 =?utf-8?B?WW1TMmdQN2Nlb3JGUDREUkF4a0pWZGNOMkZGTG92UkVjSUxUMkhTalJhcXBv?=
 =?utf-8?B?ZTlpcjBaMkR2bXF1Mm5CRjNRYmZVeTVRaHkxUkNWV2dqUWoyOUVOK0NCc1hq?=
 =?utf-8?B?dUdzZzVaWHRGQkhIcElKQTVQZlBWWkNsMm1VUHJMYTBzajNsdytmVGVXRktx?=
 =?utf-8?B?elcwQWFzaEFiV3pZR3lPV1dNMUw3K1U3WHM1eUVPRGVDLzNYTXRsMHJnc2lI?=
 =?utf-8?B?UGYrbzFkdmE1Q1dDS3JoMm9UMUxYV0I3aDN3R09uU1ZybEh1K2dEVkRuTGdj?=
 =?utf-8?B?Wno3YTBuRENsa3JuMEJIVjhZQ0lEbnhSN3hDeEtpdlpGUkduMDNPKzhZaFFz?=
 =?utf-8?B?Z056UktrcHNVYXF4Umx1NDRUb3BteXpScGVZaC9FeGRCT05VcWx0cEhCcjZB?=
 =?utf-8?B?UUNTWFNnY2xybXU3UE5abDVyVkluRTRUc1NiWG02WGhtN3RqTWQxVitna08z?=
 =?utf-8?B?b0QyOUlZaDkrR3hoSkM5MHVYWXM3RWg1ektuUjl1ODlkSkJuMDZRQUoxeFhv?=
 =?utf-8?B?QWs4YmdxRFc2M3BjZE13MDA5UEhFdDA4QThtRXdTVmNoYjd3cjV3dXNVdVRt?=
 =?utf-8?B?Ly9rOFhmUTlXeU1XY2ZFbSswZmI5U0duSEx1UjJ6WXBjWitveHZpaTZWbFB5?=
 =?utf-8?B?eEhkeWJKT1cyRUJRalJqT1hmS3B3NlgySGRrN3E4c21wc2cxWCtSVFMxNEd2?=
 =?utf-8?B?eC9SRE9OL2diMkRCV1ZQaVVhODZJcnRYSUpGMURudkZ5RjlnN1g4OHZmTzc5?=
 =?utf-8?B?ckpoQ3E5QllibHlWNTZyK0FjbnBEL0pSRkF4TVVPcTdacE1xblpZYjFZblNS?=
 =?utf-8?B?QlMvNnBDeStkZDRxeEJ2aE0zTVYvWkl0cTJkNHQxK2hibEF1WWwvWmtyTWw4?=
 =?utf-8?B?Y3pld3ZrN2dOdU5DNENxYy9FWUtiT09TT3JOcGZtNXpoTDBpZjlXaGtKUm5r?=
 =?utf-8?B?QkxFaXVicldLUmFpOU9oWWNrNUo1T3pKYTE5eVBzdnRURzNCVWJyRmhZNFJF?=
 =?utf-8?B?QkpWd2drN0lmejQ2ZklNRkZKblEydzJ4ZEE2VUFVa21Hem13UFFPazN4bVh1?=
 =?utf-8?B?UU1WMU1aWEZNb3FUbHVRcmxXTzcxRmtzYjYybUwyOExEN2ZsSmUxZk1yTTdF?=
 =?utf-8?B?RVNTYzViVDFOd3JIL21aYkYyZlhJZG5jQ1c4czJlblU5OTIrNFR0WkJKZTFx?=
 =?utf-8?B?UmVtd1RxQkpYNzgrVVFPaDdZUmJkQlR6TFVkYmwweVQ5RjVieXd4MEdySnRT?=
 =?utf-8?B?aUZGaVI2NVNJUXd5NXFxYzAzUHdIZWNsUUV3YWJGSVM2RHY1RGFVRnYwRVY3?=
 =?utf-8?B?SlRzTUN3RUFpcUR6aTF0UGNyMC9hVWFoZXp0MWt6c1IyNTB6TE0rREJHNTZR?=
 =?utf-8?Q?hFxgUzl4HkfIRoHUeiSi7eR7M?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe0f1ac-0885-444d-d165-08da8f6ad903
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 18:17:09.5932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ObKorE7T5iXoZmiNAcdy4qxJ1CONyI5H9nfAct1VDl7qQczKkKQjUKUDYMq9hhwZllQqnqtWZJFHP7SLDVvlmXtDJF/uWutXJb48s0fqo2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10354
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
 Viresh Kumar <viresh.kumar@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KDQo+IFN1YmplY3Q6IFtQQVRDSCB2MyA0LzVd
IGRybS9wYW5mcm9zdDogZGV2ZnJlcTogc2V0IG9wcCB0byB0aGUgcmVjb21tZW5kZWQNCj4gb25l
IHRvIGNvbmZpZ3VyZSBhbmQgZW5hYmxlIHJlZ3VsYXRvcg0KPiANCj4gZGV2bV9wbV9vcHBfc2V0
X3JlZ3VsYXRvcnMoKSBkb2Vzbid0IGVuYWJsZSByZWd1bGF0b3IsIHdoaWNoIG1ha2UNCj4gcmVn
dWxhdG9yIGZyYW1ld29yayBzd2l0Y2hpbmcgaXQgb2ZmIGR1cmluZyByZWd1bGF0b3JfbGF0ZV9j
bGVhbnVwKCkuDQoNCkluIHRoYXQgY2FzZSwgd2h5IG5vdCByZWd1bGF0b3JfZ2V0KClmb3IgDQpE
eW5hbWljIHJlZ3VsYXRvcihub24gZml4ZWQgcmVndWxhdG9yKT8/DQoNCj4gDQo+IENhbGwgZGV2
X3BtX29wcF9zZXRfb3BwKCkgd2l0aCB0aGUgcmVjb21tZW5kIE9QUCBpbg0KPiBwYW5mcm9zdF9k
ZXZmcmVxX2luaXQoKSB0byBlbmFibGUgdGhlIHJlZ3VsYXRvciBhbmQgYXZvaWQgYW55IHN3aXRj
aCBvZmYNCj4gYnkgcmVndWxhdG9yX2xhdGVfY2xlYW51cCgpLg0KPiANCj4gU3VnZ2VzdGVkLWJ5
OiBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPg0KPiBTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgfCA4ICsrKysrKysrDQo+ICAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYw0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMNCj4gaW5kZXggNTExMGNkOWIyNDI1Li42N2Iy
NDI0MDcxNTYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kZXZmcmVxLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rl
dmZyZXEuYw0KPiBAQCAtMTMxLDYgKzEzMSwxNCBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9pbml0
KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UNCj4gKnBmZGV2KQ0KPiAgCQlyZXR1cm4gUFRSX0VSUihv
cHApOw0KPiANCj4gIAlwYW5mcm9zdF9kZXZmcmVxX3Byb2ZpbGUuaW5pdGlhbF9mcmVxID0gY3Vy
X2ZyZXE7DQo+ICsNCj4gKwkvKiBTZXR1cCBhbmQgZW5hYmxlIHJlZ3VsYXRvciAqLw0KPiArCXJl
dCA9IGRldl9wbV9vcHBfc2V0X29wcChkZXYsIG9wcCk7DQo+ICsJaWYgKHJldCkgew0KPiArCQlE
Uk1fREVWX0VSUk9SKGRldiwgIkNvdWxkbid0IHNldCByZWNvbW1lbmRlZCBPUFBcbiIpOw0KPiAr
CQlyZXR1cm4gcmV0Ow0KPiArCX0NCg0KDQpGWUksDQpPbiBSWi9HMkwgbWFsaSBncHUsIHdlIGhh
dmUgZml4ZWQgcmVndWxhdG9yIGFuZA0KSSB3YXMgYWJsZSB0byBkbyBHUFUgT1BQIHRyYW5zaXRp
b24gd2l0aG91dCBhbnkgaXNzdWVzIHByZXZpb3VzbHkuDQoNCnJvb3RAc21hcmMtcnpnMmw6fiMg
Y2F0IC9zeXMvY2xhc3MvZGV2ZnJlcS8xMTg0MDAwMC5ncHUvdHJhbnNfc3RhdA0KICAgICBGcm9t
ICA6ICAgVG8NCiAgICAgICAgICAgOiAgNTAwMDAwMDAgIDYyNTAwMDAwIDEwMDAwMDAwMCAxMjUw
MDAwMDAgMjAwMDAwMDAwIDI1MDAwMDAwMCA0MDAwMDAwMDAgNTAwMDAwMDAwICAgdGltZShtcykN
CiogIDUwMDAwMDAwOiAgICAgICAgIDAgICAgICAgICAwICAgICAgICAgMCAgICAgICAgIDAgICAg
ICAgICAwICAgICAgICAgMCAgICAgICAgIDAgICAgICAgICAxICAgICAgIDE0NA0KICAgNjI1MDAw
MDA6ICAgICAgICAgMCAgICAgICAgIDAgICAgICAgICAwICAgICAgICAgMCAgICAgICAgIDAgICAg
ICAgICAwICAgICAgICAgMCAgICAgICAgIDAgICAgICAgICAwDQogIDEwMDAwMDAwMDogICAgICAg
ICAwICAgICAgICAgMCAgICAgICAgIDAgICAgICAgICAwICAgICAgICAgMCAgICAgICAgIDAgICAg
ICAgICAwICAgICAgICAgOSAgICAgICA1MjQNCiAgMTI1MDAwMDAwOiAgICAgICAgIDAgICAgICAg
ICAwICAgICAgICAgOSAgICAgICAgIDAgICAgICAgICAwICAgICAgICAgMCAgICAgICAgIDAgICAg
ICAgICAzICAgICAgMjU0NA0KICAyMDAwMDAwMDA6ICAgICAgICAgMCAgICAgICAgIDAgICAgICAg
ICAwICAgICAgICAxMSAgICAgICAgIDAgICAgICAgICAwICAgICAgICAgMCAgICAgICAgNDYgICAg
ICAzMzA0DQogIDI1MDAwMDAwMDogICAgICAgICAxICAgICAgICAgMCAgICAgICAgIDAgICAgICAg
ICAwICAgICAgICAzMyAgICAgICAgIDAgICAgICAgICAwICAgICAgICAgMCAgICAgIDc0OTYNCiAg
NDAwMDAwMDAwOiAgICAgICAgIDAgICAgICAgICAwICAgICAgICAgMCAgICAgICAgIDAgICAgICAg
IDE2ICAgICAgICAxOSAgICAgICAgIDAgICAgICAgICAwICAgICAgMjAyNA0KICA1MDAwMDAwMDA6
ICAgICAgICAgMSAgICAgICAgIDAgICAgICAgICAwICAgICAgICAgMSAgICAgICAgIDggICAgICAg
IDE1ICAgICAgICAzNSAgICAgICAgIDAgICAgICA0MDMyDQpUb3RhbCB0cmFuc2l0aW9uIDogMjA4
DQoNCkNoZWVycywNCkJpanUNCg0K
