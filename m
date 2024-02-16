Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18078577E8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 09:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAEF10E494;
	Fri, 16 Feb 2024 08:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="e2KNJemg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2087.outbound.protection.outlook.com [40.107.114.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE16510E4B8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 08:47:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7Ogl5kBYzckY1AhYbhpVIlyUeBcpGBksD6lg3jSbBsP2SSfIl0O3LlfQCneRo69KHe+rYB1DUHqAe9RMo3gJ2kQuPwwkocYAbE+BP76DZopPqHM6DE1mGZSYnIpg99nY6xAh0oEcUxfN8xf6YW4aM3Q4GZCIQ2fhk5fnhmgQbXF7erK1YKhm5fEzDLym83gY8SnkYyT+fZ61ULTeo6dnHWPxc1iXbHfWtU6a0MQhDThkHXBNMdrD1ixBnwCZ9DeXtW6um2I97pduzBJp1C72oXvuOkHqMoLusf+YMBYyIJTnt4B+zVl1Hl766Y9NbkxTv/lgDPDXDoAnVhmux48GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R49nGneq1o4WUp25dB3C6fNi/oynDh4lP0TTyDHLP0k=;
 b=IhiATZgdyMG1BR8FNlWoNWR8poQDpHaOWtt1k4Zm6kPIc9Qt08Yd7x+KAmtHmCjYvkLaVbzZKK12m3wnRuAaymkxwIozcrD2dDx12IxUX53+sMov/efBT5kL6SnfUNYkVZLuiAVbiWWqUesb3HlelWb8nyzeQb35PrwaJOQjfRPIKzQcCjvqjILLBdanJHu3tquRMg4OQJ030a/nCI+N52qn4wsTvXWMWywxrnCc04+OHcnR0sHp6jB4tpKOaxqzn+se/Kg8FBBbvxmN4UpTgrpnLtD+aNpa2AmkMT/Bjh6iTJrjP+MzFxu9QQvLZgJIdW22WM1OgkM3KItbFTmyQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R49nGneq1o4WUp25dB3C6fNi/oynDh4lP0TTyDHLP0k=;
 b=e2KNJemg2JBXNRga4qeJxp+2A/d6DBMS91Qh78wIGyz0AL8fUhb3ZMt5svC48wRyKnV/f2XQ1zeRk20oa8VzeXlKNbMNegz0DNy6VeCQeVb+oxNUXrWCsQ6+k4B9WIPHDe0/PcMh85jZuXIYcw+wtpOcQMLzWVLAJY1EGAFXMTk=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB10664.jpnprd01.prod.outlook.com
 (2603:1096:400:291::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Fri, 16 Feb
 2024 08:47:46 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7292.026; Fri, 16 Feb 2024
 08:47:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Adam Ford <aford173@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>
CC: Maxime Ripard <mripard@kernel.org>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Sarah
 Walker <sarah.walker@imgtec.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Javier Martinez Canillas
 <javierm@redhat.com>, Nishanth Menon <nm@ti.com>, Marek Vasut
 <marek.vasut@mailbox.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
Thread-Topic: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
Thread-Index: AQHaYDAOR2pL22/lvECLyWXYf8dUVbELo4AAgAADRQCAAGhqgIAAl7DA
Date: Fri, 16 Feb 2024 08:47:46 +0000
Message-ID: <TYCPR01MB11269CBE8429A31DE5002A5A5864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
 <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
 <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
 <CAHCN7xJ65RP8TO7cS0p5DwE6zru5NEF0_JA+8siT_OpSeLD7pA@mail.gmail.com>
 <CAHCN7x+EnSU8qk5dBFco=0vkeknGq18qEN7vFmZs0_q83T_3+w@mail.gmail.com>
 <CAHCN7xKffJ29zyjoJVAcy3b_d=-zkFzbL=URj4yWJWzYvRdB_Q@mail.gmail.com>
In-Reply-To: <CAHCN7xKffJ29zyjoJVAcy3b_d=-zkFzbL=URj4yWJWzYvRdB_Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB10664:EE_
x-ms-office365-filtering-correlation-id: c6754959-1108-4c8a-8dd4-08dc2ecbf276
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dZRIwvsWfQymHSU0LMjrcOk+qWDvEyxKRi9YpZ6e4XxEneBLncQqHWjOUXpMfD7tNgSVpeVm+ZnKuv9H+njC+BiCYQaK/kfsfDXGWqRDBmQISzCRhnIMrmeUhq2wEJ+dC7vKAcQ+/PJdWV23q76ABOqgITvfW6vsQYnFti5KSBsoyFccN81OVyaY7AUja7GyNaOFWI3ibJU5tW5LCl7l649EnNMNSmoLPZ/3zgP4EEEDM2PLUHLEblRRcjXA4akPrHsv1IBtCGkXg2gMoJEvFRl4WU0/VvlhCfu+RWTDddBGTpjydg/KsbFypxQNbaM+UONlhnqYqluM00MCxS92dBJJJm6pwD4l64xztuvXZbQGn+nEkPHSZ7UcYJyP4EUI7yby4biKRWsiaiS/0WI34VKsaVkrp4ZJgB17oRkKGrIkuwvaJNxt3DLQyrWb84Y+wFGfaH4MveTqmvXQkzUVs82nZVPU+LF8skpDvOnRxDJioGzaYJ5WMejaxlR6AIagcs2/TFbx8GEIzjIh5536+jB0BiYMghjWPumFp4an85Lsqd47XfyYesXOSyTjytUCX5zBb6DLmlKWuVTRUmxwLehduwa0s/0JSIJEELM9qko=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(38070700009)(41300700001)(83380400001)(9686003)(55236004)(4326008)(8936002)(8676002)(52536014)(66556008)(53546011)(7696005)(66946007)(66446008)(66476007)(76116006)(64756008)(316002)(966005)(110136005)(478600001)(54906003)(6506007)(33656002)(122000001)(38100700002)(86362001)(71200400001)(26005)(55016003)(7416002)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VURxaUJoT21Pd3FRVDFISFhMa1B3MGQzSktPdkxTSkpiTVhVVXo2T1E2bWYz?=
 =?utf-8?B?MmZBODZZTnEvSDJPTkZkN0hjS1NCU0hKcDd0Q3h0cjNGdnFMaGJFbWxHUVov?=
 =?utf-8?B?TG10RjM0bFR3aWVpd0ZoakE0c3ZlSnRjbk00VDFsYWlIY2FrZG9TcEtMWjdH?=
 =?utf-8?B?MjRoWUliSDJGUXorSitjOU5WL0FndUlRckZ2NzU5Rk5GUGkyWEJRcVY5dm9Z?=
 =?utf-8?B?YjZuMThQVEdVWjRYQ3pMSHdpTXVheE9DakxyV1FRRm5GY1J1emRZaW4xOE9S?=
 =?utf-8?B?aGVHeFpLN0xVYU8zTHFwNGFZWTZzdjBzcTA4dk5OdzhrRjN5MjBhbnNjUlBD?=
 =?utf-8?B?QnJrL2hhdmhkMWM0cWNYS25PK0xkNlpZQjF1dHZyeUwxcmN2WUJXenVSMmYx?=
 =?utf-8?B?KzIvWDJwdDVOUURCYkVVSUxNdXNpcUhTdkZTaUxuTkNuQ0dPYlpKbUQ1Ynhr?=
 =?utf-8?B?Z0dpSmZ3Y0V0Ty9ZbXU3MEd6RndUZ3VyKzBiMWdiZHVmWG5xeXpvYm1RTFB5?=
 =?utf-8?B?cENVaFQ2aUlMSGdXMjZLM1hrb254Y090UjFCZWdzNTN3TlltNWZtUTZKMExz?=
 =?utf-8?B?RVI4WnlWNCtLMkREOWZGL3lwdHMyRWdscWNOZER6Qi9IVTNCbHFjajVnOTlh?=
 =?utf-8?B?U3EvaFUreG4xajRSd080TTJYZHVLaE1uM1B1c2NuQmdzaFlES0d1a0pUMjd1?=
 =?utf-8?B?VW9JSG8zUXBJM2g3SGJ4WjZyUWZZRUdEb0ZzYlpSL0NWN1l1TGIwb1gzNXQr?=
 =?utf-8?B?TFdBU3Ezb3k3aUY4VFJZNkoxQWl5RXd5ZnhScWlnSytmTVJ1eHc4cllTWGt5?=
 =?utf-8?B?aGJwRTBNMXRwOU5EeFVNYmo3bFRBZjh1aE13YldDZzNhcHFVTkROaHFiMytk?=
 =?utf-8?B?WlZDNlpwUFZpQXoyRWhYOTR6KzhCcEdEV3IzLzBEN2ZvTXA5Y3c5ZFpacUpQ?=
 =?utf-8?B?QmxwMkNNdU0yb2tpQzBDSXVYeHRMc0Z6L2RBUjV0WE1va0ZoM3ZXOFFZYkJQ?=
 =?utf-8?B?enJDQVVSeEtZdzQ3TWpBc0RpSU0wME41TnE1Y2tvck1LNjQ0cFZkb3k2N1F2?=
 =?utf-8?B?cE5EQy90dmdlSFFzRVRNdmpwdVJ3RWsxdXdmRE0zb3B1UTdtVnFBa0pOdG9F?=
 =?utf-8?B?RWVwTGkyOTErd0ZaLy85NEE5NldhNzUzYWpMNU44YWQ3MFl5amliZkZZdWRw?=
 =?utf-8?B?Y09iN1R6eVhRaVE5QWV3MnY3Tmlnblo1anU2SWtuWHQ4enkrSGk0UnFSUCs0?=
 =?utf-8?B?bWx2V05HQmRYcjM2NjJPZVFlWnV1K1VHZGl3L1dRdndCZ3dZODJnUGhncUhk?=
 =?utf-8?B?WjJDZmdaS2k2L0dCYlVabXdTNndOMGlBVTExdEE4NHpqaUphbEJHaWhlR00x?=
 =?utf-8?B?SVFweHhNNjZVakV4WkZZcFJlK0xVRXJJQ0hQeFZsc1NhTTdkRTdVZWFMN090?=
 =?utf-8?B?V1RMQmpxcXhod0IwMExxK1krV21IMm5wUzNZdDNCNnRDMkdFMjhNSTJRaDhs?=
 =?utf-8?B?V25zZmxCa0FSMWdnZndMaEhYcVhha0IyNnBPRmRTN2pBTWdweHd2ZjdDUzBS?=
 =?utf-8?B?SmQxRWJOOVRrbVd1ek1mQ05QYzZLMlBhM1Bwb0E0emhDVXI5R3pYSnhRMFJF?=
 =?utf-8?B?UFdVM25vaUhBRzU0TnprN2FsMmp4TjJBNWFydy9UR3BQaFdMOGtTNVp4UnVo?=
 =?utf-8?B?dFIyaHlvS3BNNHdhbnMwWWZ4SjFLRXdOQWc4bHJMNE5WYXlVQ1NBY29ueXZk?=
 =?utf-8?B?dG01UUJWYkxzdnAzMElGaVRqbVF2bS9xWkRFZW5ISmYzcTlZeE4zQngwSWZ3?=
 =?utf-8?B?bkx4WlFjelpRMTVUbFlVbmxtMkMwazJ0OGNHa3Y4ajdEd25hQytKTElUTzVx?=
 =?utf-8?B?MTlYems1bGxmeUVDb05YbDdqMk5FVzFiWFRXYVN3Wk1lUGlNR2UxU2FKWWNH?=
 =?utf-8?B?Y3dqRDVxalNJYnp2ZkEyNW1ZQkVxK0pLTllseVFPL21ycDdSRWF5cm9mSDJZ?=
 =?utf-8?B?cUhzMlVodUVMSDFtUHZLYk5mZWg5ZTd5NzQ1UkJuM1BjUzNndWF5dUpTTW1t?=
 =?utf-8?B?ZnprUHFqd2VwMWRHUU14QUs2dG9EdS9QNkU5bGNETTg5WUJyb252eEtyaDEx?=
 =?utf-8?B?cWo1UDlNVE03bTNEV1oyMjJGb1FoOUtTbEN6MVo4SmdNTnIxOFJwZXMybnVH?=
 =?utf-8?B?b2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6754959-1108-4c8a-8dd4-08dc2ecbf276
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2024 08:47:46.0648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2R375KvrM3Y6pa5TCXQV/90aLTUDzBCioq/aGm02GOqqOOWN7qr2eWnTY9rxSAvWBe/wnUHlabHBmQGxDFdDERgraefm56O1ODA6wzbNcL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10664
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

SGkgQWRhbSBGb3JkLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFk
YW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgRmVicnVhcnkg
MTUsIDIwMjQgMTE6MzYgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gZHJtL2ltYWdpbmF0
aW9uOiBEUk1fUE9XRVJWUiBzaG91bGQgZGVwZW5kIG9uDQo+IEFSQ0hfSzMNCj4gDQo+IE9uIFRo
dSwgRmViIDE1LCAyMDI0IGF0IDExOjIy4oCvQU0gQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5j
b20+IHdyb3RlOg0KPiA+DQo+ID4gT24gVGh1LCBGZWIgMTUsIDIwMjQgYXQgMTE6MTDigK9BTSBB
ZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gT24gVGh1
LCBGZWIgMTUsIDIwMjQgYXQgMTA6NTTigK9BTSBHZWVydCBVeXR0ZXJob2V2ZW4NCj4gPiA+IDxn
ZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IEhpIE1heGltZSwN
Cj4gPiA+ID4NCj4gPiA+ID4gT24gVGh1LCBGZWIgMTUsIDIwMjQgYXQgNToxOOKAr1BNIE1heGlt
ZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4NCj4gd3JvdGU6DQo+ID4gPiA+ID4gT24gVGh1
LCBGZWIgMTUsIDIwMjQgYXQgMDE6NTA6MDlQTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9ldmVuDQo+
IHdyb3RlOg0KPiA+ID4gPiA+ID4gVXNpbmcgdGhlIEltYWdpbmF0aW9uIFRlY2hub2xvZ2llcyBQ
b3dlclZSIFNlcmllcyA2IEdQVQ0KPiA+ID4gPiA+ID4gcmVxdWlyZXMgYSBwcm9wcmlldGFyeSBm
aXJtd2FyZSBpbWFnZSwgd2hpY2ggaXMgY3VycmVudGx5IG9ubHkNCj4gPiA+ID4gPiA+IGF2YWls
YWJsZSBmb3IgVGV4YXMgSW5zdHJ1bWVudHMgSzMgQU02MnggU29Dcy4gIEhlbmNlIGFkZCBhDQo+
ID4gPiA+ID4gPiBkZXBlbmRlbmN5IG9uIEFSQ0hfSzMsIHRvIHByZXZlbnQgYXNraW5nIHRoZSB1
c2VyIGFib3V0IHRoaXMNCj4gPiA+ID4gPiA+IGRyaXZlciB3aGVuIGNvbmZpZ3VyaW5nIGEga2Vy
bmVsIHdpdGhvdXQgVGV4YXMgSW5zdHJ1bWVudHMgSzMNCj4gTXVsdGljb3JlIFNvQyBzdXBwb3J0
Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVGhpcyB3YXNuJ3QgbWFraW5nIHNlbnNlIHRoZSBmaXJz
dCB0aW1lIHlvdSBzZW50IGl0LCBhbmQgbm93DQo+ID4gPiA+ID4gdGhhdCBjb21taXQgbG9nIGlz
IGp1c3QgcGxhaW4gd3JvbmcuIFdlIGhhdmUgZmlybXdhcmVzIGZvciB0aGUNCj4gPiA+ID4gPiBH
NjExMCwgR1g2MjUwLCBHWDY2NTAsIEJYRS00LTMyLCBhbmQgQlhTLTQtNjQgbW9kZWxzLCB3aGlj
aCBjYW4NCj4gPiA+ID4gPiBiZSBmb3VuZCBvbiAoYXQgbGVhc3QpIFJlbmVzYXMsIE1lZGlhdGVr
LCBSb2NrY2hpcCwgVEkgYW5kDQo+ID4gPiA+ID4gU3RhckZpdmUsIHNvIGFjcm9zcyB0aHJlZQ0K
PiA+ID4gPg0KPiA+ID4gPiBJIGFtIHNvIGhhcHB5IHRvIGJlIHByb3ZlbiB3cm9uZyENCj4gPiA+
ID4gWWVhaCwgR1g2NjUwIGlzIGZvdW5kIG9uIGUuZy4gUi1DYXIgSDMsIGFuZCBHWDYyNTAgb24g
ZS5nLiBSLUNhciBNMy0NCj4gVy4NCj4gPiA+ID4NCj4gPiA+ID4gPiBhcmNoaXRlY3R1cmVzIGFu
ZCA1IHBsYXRmb3Jtcy4gSW4gdHdvIG1vbnRocy4NCj4gPiA+ID4NCj4gPiA+ID4gVGhhdCBzb3Vu
ZHMgbGlrZSBncmVhdCBwcm9ncmVzcywgdGhhbmtzIGEgbG90IQ0KPiA+ID4gPg0KPiA+ID4gR2Vl
cnQsDQo+ID4gPg0KPiA+ID4gPiBXaGVyZSBjYW4gSSBmaW5kIHRoZXNlIGZpcm13YXJlcz8gTGlu
dXgtZmlybXdhcmVbMV0gc2VlbXMgdG8gbGFjaw0KPiA+ID4gPiBhbGwgYnV0IHRoZSBvcmlnaW5h
bCBLMyBBTTYyeCBvbmUuDQo+ID4gPg0KPiA+ID4gSSB0aGluayBQb3dlclZSIGhhcyBhIHJlcG8g
WzFdLCBidXQgdGhlIGxhc3QgdGltZSBJIGNoZWNrZWQgaXQsIHRoZQ0KPiA+ID4gQlZOQyBmb3Ig
dGhlIGZpcm13YXJlIGRpZG4ndCBtYXRjaCB3aGF0IHdhcyBuZWNlc3NhcnkgZm9yIHRoZSBHWDYy
NTANCj4gPiA+IG9uIHRoZSBSWi9HMk0uICBJIGNhbid0IHJlbWVtYmVyIHdoYXQgdGhlIGNvcnJl
c3BvbmRpbmcgUi1DYXIzIG1vZGVsDQo+ID4gPiBpcy4gIEkgaGF2ZW4ndCB0cmllZCByZWNlbnRs
eSBiZWNhdXNlIEkgd2FzIHRvbGQgbW9yZSBkb2N1bWVudGF0aW9uDQo+ID4gPiBmb3IgZmlybXdh
cmUgcG9ydGluZyB3b3VsZCBiZSBkZWxheWVkIHVudGlsIGV2ZXJ5dGhpbmcgd2FzIHB1c2hlZA0K
PiA+ID4gaW50byB0aGUga2VybmVsIGFuZCBNZXNhLiAgTWF5YmUgdGhlcmUgaXMgYSBiZXR0ZXIg
cmVwbyBhbmQvb3IgbmV3ZXINCj4gPiA+IGZpcm13YXJlIHNvbWV3aGVyZSBlbHNlLg0KPiA+ID4N
Cj4gPiBJIHNob3VsZCBoYXZlIGRvdWJsZWQgY2hlY2tlZCB0aGUgcmVwbyBjb250ZW50cyBiZWZv
cmUgSSBzZW50IG15IGxhc3QNCj4gPiBlLW1haWwgLCBidXQgaXQgYXBwZWFycyB0aGUgZmlybXdh
cmUgIFsyXSBmb3IgdGhlIFJaL0cyTSwgbWlnaHQgYmUNCj4gPiBwcmVzZW50IG5vdy4gSSBkb24n
dCBrbm93IGlmIHRoZXJlIGFyZSBkcml2ZXIgdXBkYXRlcyBuZWNlc3NhcnkuIEkNCj4gPiBjaGVj
a2VkIG15IGUtbWFpbHMsIGJ1dCBJIGRpZG4ndCBzZWUgYW55IG5vdGlmaWNhdGlvbiwgb3IgSSB3
b3VsZCBoYXZlDQo+ID4gdHJpZWQgaXQgZWFybGllci4gIEVpdGhlciB3YXksIHRoYW5rIHlvdSBG
cmFuayBmb3IgYWRkaW5nIGl0LiAgSSdsbA0KPiA+IHRyeSB0byB0ZXN0IHdoZW4gSSBoYXZlIHNv
bWUgdGltZS4NCj4gPg0KPiANCj4gSSBkb24ndCBoYXZlIHRoZSBwcm9wZXIgdmVyc2lvbiBvZiBN
ZXNhIHNldHVwIHlldCwgYnV0IGZvciB3aGF0IGl0J3MNCj4gd29ydGgsIHRoZSBmaXJtd2FyZSBs
b2FkcyB3aXRob3V0IGVycm9yLCBhbmQgaXQgZG9lc24ndCBoYW5nLg0KDQpCYXNlZCBvbiBbMV0g
YW5kIFsyXSwNCg0Ka21zY3ViZSBzaG91bGQgd29yayBvbiBSLUNhciBhcyBpdCB3b3JrcyBvbiBS
Wi9HMkwgd2l0aCBwYW5mcm9zdCBhcyBlYXJsaWVyIHZlcnNpb24gb2YgUlovRzJMDQp3aGljaCB1
c2VzIGRybSBiYXNlZCBvbiBSQ2FyLUR1LCBsYXRlciBjaGFuZ2VkIHRvIHJ6ZzJsLWR1Lg0KDQpb
MV0NCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL21lc2EvbWVzYS0yNC4wLjEvc291cmNlL3Ny
Yy9nYWxsaXVtL3RhcmdldHMvZHJpL21lc29uLmJ1aWxkI0w5NQ0KDQphbmQgDQoNClsyXQ0KaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbWVzYS9tZXNhLTI0LjAuMS9zb3VyY2Uvc3JjL2dhbGxp
dW0vdGFyZ2V0cy9kcmkvdGFyZ2V0LmMjTDEyMw0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+IFsg
ICAgOS43ODc4MzZdIHBvd2VydnIgZmQwMDAwMDAuZ3B1OiBbZHJtXSBsb2FkZWQgZmlybXdhcmUN
Cj4gcG93ZXJ2ci9yb2d1ZV80LjQ1LjIuNThfdjEuZncNCj4gWyAgICA5Ljc4Nzg2MV0gcG93ZXJ2
ciBmZDAwMDAwMC5ncHU6IFtkcm1dIEZXIHZlcnNpb24gdjEuMCAoYnVpbGQgNjUxMzMzNg0KPiBP
UykNCj4gDQo+IA0K
