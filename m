Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA0B7AA995
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 08:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADD110E06A;
	Fri, 22 Sep 2023 06:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D6110E06A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 06:57:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECizSkhTiH7fv2FbSG1uEgLNShXHtAt5IYAjaNK6fmT0utFqayFIguGCrOFRC4qYIsGkxX0yR8SLAihkXBPtB9qFmuS5qiPARPB7d9DJklKrKsl0FOkaO7qmc1ipvsRLf/O7La7FMXpzBTAKPW3ps1Vxs/lZ/jQdGJ8lKMaZN/ZwLbBhb1BbmDxC92G9GibJbKsh93zPKMHcNjzamCBkm1Yx33AoS/PuOAarRFuuncRJ+RVBbaXzUUJwC5fBLj0+o6Ajz7TTmb4VZsAQG4J8HDxsJV4BuUFsj3Z4YoCv4DEb2ay99A4H6jEdbWmI0gG1A/5zESVZ9ttHiS87ZJ5XTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifzVt1kZupKdj3HXd0yU2wZcegNIfP+pYR0kKlotkmU=;
 b=SVc4TENUdLudeyHBHU5Y3BLroA1qqH2zjJHgjY8LX32yI9H/QlCoMyvc18fleRKtDZFI90CUQnNpWyRA6Etrwf3c47x/pKizzhqF94zwHRAGPyTy8Ht9KEs4262rblFPhpXHFXIzPhTiGEiCBGKAbm2Yco95PX7M29cY4uGK8XllO0O1gXDIubM4m9mHH56nTa2UmC+IgG3UTZOa4LMFRPqYhm3jI/H7UskbLIOCblmHsZu5EFlQPMTZPyfdaXn/YN65ackpwm8kN8mudN9ErrSxaiyYXJ3Gx16uA5l9VsWJUQubAHHHr3wzpvFQmZLg092UOQBs4DrWLbOPm+qeeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifzVt1kZupKdj3HXd0yU2wZcegNIfP+pYR0kKlotkmU=;
 b=wCViIWYYz80HUgTtSZ1A668lmyqEIlpzYxZDy1xtj+mc8dL9XuLM7i9MN626euTmlk4QbyKmmlV/yzdpoYoOV7xqB8bmNlLlcTUHRXG5jh9hyGf/EuaG06wCxDOFK8RWS0uSQN7KW4aVcLS+ZSoN5lT5qy7w3EcMjA3+acFAVOo=
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SN7PR04MB8643.namprd04.prod.outlook.com (2603:10b6:806:2ee::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.11; Fri, 22 Sep
 2023 06:57:12 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::cd38:f20f:5778:a25]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::cd38:f20f:5778:a25%7]) with mapi id 15.20.6838.010; Fri, 22 Sep 2023
 06:57:12 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jani Nikula
 <jani.nikula@linux.intel.com>
Subject: RE: [PATCH] drm/bridge: Add 200ms delay to wait FW HPD status stable
Thread-Topic: [PATCH] drm/bridge: Add 200ms delay to wait FW HPD status stable
Thread-Index: AQHZ7GweslUWm+ZGJE2PFhwGz0oHObAlMAIAgAABGICAATklMA==
Date: Fri, 22 Sep 2023 06:57:12 +0000
Message-ID: <BY5PR04MB673924424F7E3CDB1A37D9C3C7FFA@BY5PR04MB6739.namprd04.prod.outlook.com>
References: <20230921091435.3524869-1-xji@analogixsemi.com>
 <87leczpw2h.fsf@intel.com>
 <20230921121305.GA19112@pendragon.ideasonboard.com>
In-Reply-To: <20230921121305.GA19112@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR04MB6739:EE_|SN7PR04MB8643:EE_
x-ms-office365-filtering-correlation-id: 8e303458-4440-44b5-f665-08dbbb3925a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qGxDm6c+LfCCTviewh2Czxez/3+e+XAaWWlqSzmWKdN2v7l9CeAvicsnlOpmrtLvCuB2H5syvZLkcYaZrwqflAlE604ABEp8zPW7BN5Won3TMTM9x3e3F8ER/KkKnUopdAGO4IMd57eqAPGmsZOP4syruD2ZbfbOFnVP20bjBBwvnQcD5NRvvaF5x57SMVFyPSf2ReOcWkZRfHI+cyZQfuZzM5TeOSdfjFEzjN3MXj5P4w7BzlpmIGALrRkYyt78Y2jbjraC0UbLZg+Jpat4j4fMt4sWjk/OVcN7cSZdIPFBu3tDlKPP0ygjlZS9tMPWLUomBxn21HQPimzWTRwpoCSe1f98nheV6L9CCbdKlji8JVl3oK7jS87Hreue/BsggNqpgnavhwk3nLVqmElLKQi+jRRxzBI7W/I7KmnlMKR2zHbNVIMhMAtv7sIbR3oAsQE9/t3np206104aVKHamYr1GGVn+d/ANrN3D9hPe8MSYow7ja6FM3o7ZI1RafEvDmxWLABcP9QJtY0RyK4/W0RplJlyNGDgoEUKGByFbK+GL7frNeAMojwyDdeAZ4NCzZF/adp3QpY51gx8WOoJfJob3/t0iZmqb+FA1iOMyX0AiF6KHBzNH3ISoSSWR7Nx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39850400004)(366004)(346002)(376002)(451199024)(1800799009)(186009)(2906002)(33656002)(83380400001)(7416002)(8936002)(4326008)(52536014)(8676002)(5660300002)(86362001)(26005)(316002)(38100700002)(38070700005)(66946007)(110136005)(9686003)(55016003)(478600001)(122000001)(53546011)(6506007)(7696005)(66446008)(107886003)(66556008)(54906003)(66476007)(64756008)(76116006)(71200400001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFVZZ3VSNkx4MUNOUEU3em1YTisvd3J1Q3RuYUhYZnBLUzZ5SFpVLy9hR1Rp?=
 =?utf-8?B?N21Oc1lRNDdxdzhRNzc4R2pTbWpMcENDMCtMMEZtQnk1Vnh4cEFZcm9lVDdS?=
 =?utf-8?B?YkYxeEo5UjFwR2ltVlRDL3JQN2p4eWlDRkJaVmlTeUpVczBIdktURVpSS2Y2?=
 =?utf-8?B?NUw1UzJOb091b0k1MTdPdlM2NWN1cmZXNmRyS1R6S1Zta0QvblA2RTJkajR1?=
 =?utf-8?B?WWdjdmJtc21yZ3FRREhBaVZ5RU9uMnBKc2RHRnNHdVI4T2ZRbGwxLzBncitO?=
 =?utf-8?B?VVJ0a0ROdGk1akthcy9jSm9xbnRiVmprSElKTTBRYjhKN1piWGpndEt2aHg1?=
 =?utf-8?B?SllkZFpMOTE2c2pCLzNrclZ0ZVpGSXl3NkxpU2NGNEN6MEhhT3pVZEZEcm9Y?=
 =?utf-8?B?dWxTQmQ5RnJJUjZIOExlMUdTSkpVQVlZdTdabC9qSDIrTnlhQ2l3aHZnK2R4?=
 =?utf-8?B?QzdFbzFDZkxLZHFKdnhwUmpVK2p2c1pyL3F5NFNYWmRXdm8xZm1EYjh1SjEr?=
 =?utf-8?B?a2tUNlVpd1ZYeDFPWjNtajlLZS8zMlI3cThvZDE3bmJrSGdqcVN6SEU0S1ow?=
 =?utf-8?B?ZlYzZk13L29BeUJNc1owNTNaNVFydU5GVEEyRURhQlVtcldITzZVTkRlUnBt?=
 =?utf-8?B?V1hWNWI2SExuK2xTMFB4a01RY0tIN212cmUrckVEcFNhaStNWHNoMzRyOUJY?=
 =?utf-8?B?UXNqbjg5MFgzTWRWdUFZQ204NEpUa2c2TDE0OUVTei9pMlVidHV2YXdoOXlG?=
 =?utf-8?B?YmJaQ0ZtV2hqd0RYblRrMkhiVzlrVjF4eTM1dTFHcjhOK2lMZ0ZZbXl5MTZM?=
 =?utf-8?B?bzlyZ2cwRHdXVGNFQktncWhDeThCRlFRZ0JXc1lnaFZSdm5YczVoNlF4Y1Bn?=
 =?utf-8?B?NU1ET3o3TDR3QXRNdGoralJTR3piVkN4YVY2TVp1NkVxc3RkY1ozUUFhVENC?=
 =?utf-8?B?VzE3WVFwckZrQm1xay9xbHJlU2hpTjZOTnQveTVhY3VUQ0RxRGllU2dlV2ZU?=
 =?utf-8?B?b3BGWHUrWm5Ob0FJSWVRVHovL1RIcEFmNkJjWUd6WEN1cVVVTHBzT29PMGEv?=
 =?utf-8?B?S3dtZndKVVZmcGxOM0l2N2s0V3hqQ1VBenp5aTlnOWF4Ukx4Y0M5VmQ3eVNX?=
 =?utf-8?B?U1N0dUNDdkFGVVQySVFjcTVGbHZIMmdxdVBqY1dSTTY0MW5YRnIwMTNoZHpk?=
 =?utf-8?B?L2NiZVZrMzlkTVZFZkZqYzc5eERKMGFLcDVzT2FHb2JSenZLSTVpTEJGVmQ1?=
 =?utf-8?B?bzZqY2JxVVpzTTRtd3VqUmprWUNOTUI4cEJLQ2pZV1ZLbkVTWEM2dGtpQmtx?=
 =?utf-8?B?Qy9BdENHaGNmeHRwY0VISW52WjZDUm9uMDl3dFBwbUFCNzY1M3c1bFFFWnF3?=
 =?utf-8?B?dWRwSWRZdW0vL1JpY2VNVVppU0U5b0ljT0lrbEdCNmdXY3MwTEJ6emgrQmFG?=
 =?utf-8?B?ZUdIVDliWUc3R0JrMnYvWEh1cnV6RnhxRUhVcmc2VzVUY1Q2bDlIQm0wbWk1?=
 =?utf-8?B?Q3RDNGhTZUI3akIwb0NkMFc2eUVXK2ZiSHBQM3NHaTJrQTlQUWptVXBuM1Jz?=
 =?utf-8?B?M09NNms2STByeDB3TGVqWWhwM2habzJtemdNVmhkdkZzMm5OejczWEpvZWJC?=
 =?utf-8?B?VjFDSVZsaFRsM0ZIWWRLS01sK01GM0psci9PVTIwRENEdXM2Q3B6cStmNCtX?=
 =?utf-8?B?MTdqekhTYy9Yb2FIUkM1T0dYMmxTSHVyYjNkcy9kZGx2MlF2QVJmYkZqSGNY?=
 =?utf-8?B?ZjM5NTRmYmpqeWJJL3ErcDcrRk9sVGtkSHNXaHUyOW9kT2RjK1h4bWVWL2wz?=
 =?utf-8?B?V1EyTXhJUCttdW8wVEF5NUVjazk3MEQrTjdJQ3Y2ekhXUGVrWHJCYTF6SEY2?=
 =?utf-8?B?WGZTODJGWE5kUmg1ODg0L2VRQXk2VTBJbTM3cnIzNjJQSHdSMk95NmkrRUlo?=
 =?utf-8?B?VElTK0MzanE5YkhWZlE3QUNMT2ZBVy9WdmgydXA3dVhiOVIyUXA4aUFhbTRi?=
 =?utf-8?B?U0VTSUpZZlFWSEhLLy8wejhJM3FWeDRTdGFQcWpqbkJ3a2JVR3BieVF1Rytu?=
 =?utf-8?B?Umc1TWxyRmtuUWFFMllsNHBlL2hvK1QrN0Qvc1JkazJFMVhuQjJoSmsxWXpU?=
 =?utf-8?Q?PpTBrITc9flTE2+k8CLjJo1uJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e303458-4440-44b5-f665-08dbbb3925a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 06:57:12.2033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T2eqbSEkB9X79JrGM9bJT4BrdEiIDlEZpQfoMBUhWmJPT1TnTkH78Z9EAzaNt4LhHYo+oLZSxnjRBvpky53e9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR04MB8643
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Bernie Liang <bliang@analogixsemi.com>,
 Qilin Wen <qwen@analogixsemi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCBQaW5jaGFydCwgdGhhbmtzIGZvciByZXZpZXdpbmcsIEknbGwgdXBkYXRlIHRo
ZSBuZXcgcGF0Y2gsIHRoYW5rcyENClhpbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJk
LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAyMSwgMjAyMyA4OjEzIFBNDQo+IFRv
OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPg0KPiBDYzogWGluIEpp
IDx4amlAYW5hbG9naXhzZW1pLmNvbT47IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50
ZWwuY29tPjsNCj4gTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+OyBS
b2JlcnQgRm9zcyA8cmZvc3NAa2VybmVsLm9yZz47DQo+IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3
aWJvby5zZT47IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+Ow0KPiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPjsgUWlsaW4gV2VuDQo+IDxxd2VuQGFuYWxvZ2l4c2VtaS5jb20+OyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
aHNpbnlpQGNocm9taXVtLm9yZzsgQmVybmllIExpYW5nDQo+IDxibGlhbmdAYW5hbG9naXhzZW1p
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2JyaWRnZTogQWRkIDIwMG1zIGRlbGF5
IHRvIHdhaXQgRlcgSFBEIHN0YXR1cyBzdGFibGUNCj4gDQo+IENBVVRJT046IFRoaXMgZW1haWwg
b3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gUGxlYXNlIGRvIG5v
dA0KPiBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXpl
IHRoZSBzZW5kZXIsIGFuZCBrbm93IHRoZQ0KPiBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiANCj4g
VGhlIHN1YmplY3QgbGluZSBpcyBtaXNzaW5nIHRoZSBkcml2ZXIgbmFtZS4NCj4gDQo+IE9uIFRo
dSwgU2VwIDIxLCAyMDIzIGF0IDAzOjA5OjEwUE0gKzAzMDAsIEphbmkgTmlrdWxhIHdyb3RlOg0K
PiA+IE9uIFRodSwgMjEgU2VwIDIwMjMsIFhpbiBKaSA8eGppQGFuYWxvZ2l4c2VtaS5jb20+IHdy
b3RlOg0KPiA+ID4gRm9yIHRoZSBub25lLWludGVycnVwdCBkZXNpZ24oc2luayBkZXZpY2UgaXMg
cGFuZWwsIHBvbGxpbmcgSFBEDQo+IA0KPiBzL25vbmUtaW50ZXJydXB0L25vLWludGVycnVwdC8g
Pw0KT0sNCj4gDQo+IHMvZGVzaWduL2Rlc2lnbiAvDQpPSw0KPiANCj4gPiA+IHN0YXR1cyB3aGVu
IGNoaXAgcG93ZXIgb24pLCBhbng3NjI1IEZXIGhhcyBtb3JlIHRoYW4gMjAwbXMgSFBEDQo+ID4g
PiBkZS1ib3VuY2UgdGltZSBpbiBGVywgZm9yIHRoZSBzYWZldHkgdG8gZ2V0IEhQRCBzdGF0dXMs
IGRyaXZlcg0KPiA+ID4gYmV0dGVyIHRvIHdhaXQgMjAwbXMgYmVmb3JlIEhQRCBkZXRlY3Rpb24g
YWZ0ZXIgT1MgcmVzdW1lIGJhY2suDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogWGluIEpp
IDx4amlAYW5hbG9naXhzZW1pLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5jIHwgMyArKysNCj4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvYW5hbG9naXgvYW54NzYyNS5jDQo+ID4gPiBpbmRleCA1MWFiZTQyYzYzOWUuLjgzM2Q2
ZDUwYTAzZCAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9n
aXgvYW54NzYyNS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4
L2FueDc2MjUuYw0KPiA+ID4gQEAgLTE0NjQsNiArMTQ2NCw5IEBAIHN0YXRpYyBpbnQgX2FueDc2
MjVfaHBkX3BvbGxpbmcoc3RydWN0DQo+IGFueDc2MjVfZGF0YSAqY3R4LA0KPiA+ID4gICAgIGlm
IChjdHgtPnBkYXRhLmludHBfaXJxKQ0KPiA+ID4gICAgICAgICAgICAgcmV0dXJuIDA7DQo+ID4g
Pg0KPiA+ID4gKyAgIC8qIERlbGF5IDIwMG1zIGZvciBGVyBIUEQgZGUtYm91bmNlICovDQo+ID4g
PiArICAgdXNsZWVwX3JhbmdlKDIwMDAwMCwgMjAxMDAwKTsNCj4gPg0KPiA+IElmIHlvdSBuZWVk
IHRvIHNsZWVwIGZvciAyMDAgbXMsIG1heWJlIHVzZSBtc2xlZXAgaW5zdGVhZD8NCj4gDQo+IGZz
bGVlcCgpIGNvdWxkIGJlIGEgbmljZSByZXBsYWNlbWVudC4NCk9LDQo+IA0KPiA+ID4gKw0KPiA+
ID4gICAgIHJldCA9IHJlYWR4X3BvbGxfdGltZW91dChhbng3NjI1X3JlYWRfaHBkX3N0YXR1c19w
MCwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3R4LCB2YWwsDQo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICgodmFsICYgSFBEX1NUQVRVUykgfHwgKHZhbCA8
IDApKSwNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=
