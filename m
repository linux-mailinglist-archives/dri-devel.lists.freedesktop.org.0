Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BCF5AE007
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 08:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FAA310E571;
	Tue,  6 Sep 2022 06:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2108.outbound.protection.outlook.com [40.107.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63C310E571
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 06:42:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9chhALKzXidBoB47INl8pnLGo4wkw3lw/pXPDHZ+hH/O+sIdasdJT/LbmKx1apWVqM56YNmGanUgiyyc4Ff+lBphshRW8xGBNWcGXnLfTbxzcaZ4R2lnuxqNJqt4ZWO+rAMzDxfb5w12KioE/SEPXYHKwl8HOdSN2pIGKIl7wN3PVQbU4lGum0by4mrMzKROhmVm6XuS0rf9LMkc5wUEdAAl4qC1Vnhivd+Bhh+iBK2u2WCKYsnmHt/XhbH/s0/Jahxlq80sFWAOAyjlUT1158Jc/4GsaZYMc6yMIJqWeGegzuP2GmLzfuEmt3zrBITQy17c4NsNajeL1WbgJR3/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zm2TD1uAMbnenwUU540vrvz4zTxIpndh3mzh5BH0BwE=;
 b=fKiFkrWECz+49byhoxXNRd2KRsvO0z4U9p0TRnPnf4R+yR0wVuevvVMF7q8IPo3GfcTZuB0aU6vdzT6kEs6wHH0gfJEvb0yloyPGeuTVSSFgk8qLpfBxCx9d/ZwjPlvLYafiuszXlNhRtrO6USFzNg+Kn1z8liymQNF9aO+lJg9HrNedCY+KnubLrL6C5qZLHbttMPVeUDLT0cZIGKYpBJr2AtT1y33nHLO9hngbtTdyoJbWp+/AYBz08JrIvdJV7k3+Lu+29bZNnx512dXeWf9N4JnWr9AvM2YdVMClaW/MfWqm0Be2sqBRbDpS0oXM1zLsmk7Eo8h83U887pi8IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zm2TD1uAMbnenwUU540vrvz4zTxIpndh3mzh5BH0BwE=;
 b=XPWvTZOyBSoTM0hWQ5w5tOkb03Dhos8sCnwluhkx9f2BjkWKXNNgbdLM7xRiXffzssOoOVo1KIxXNhh69qy3kKNnLBO270LAMgXAOhU1jRDQOECABKpVIbVfr/+UzMUnMGuIge1vJGLWj3qkqLLTTJbxvWEc94maJPsKTlNx9Pw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10257.jpnprd01.prod.outlook.com (2603:1096:400:1e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 06:42:43 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 06:42:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: RE: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the recommended
 one to configure and enable regulator
Thread-Topic: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the recommended
 one to configure and enable regulator
Thread-Index: AQHYwUs0AungGCQLKE+37Dc5lKmkg63RIy3AgAAYqYCAALEdsA==
Date: Tue, 6 Sep 2022 06:42:43 +0000
Message-ID: <OS0PR01MB5922EE3F6CDD827919A7763E867E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220905171601.79284-1-peron.clem@gmail.com>
 <20220905171601.79284-5-peron.clem@gmail.com>
 <OS0PR01MB5922142861E78A1DD81AD1C9867F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAJiuCceGZJr24hVjpP0ptOkG8bMFKr=QLj0LcyDX4fUy7Rr2xA@mail.gmail.com>
In-Reply-To: <CAJiuCceGZJr24hVjpP0ptOkG8bMFKr=QLj0LcyDX4fUy7Rr2xA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 175f748f-607d-4141-e1df-08da8fd3006e
x-ms-traffictypediagnostic: TYWPR01MB10257:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nWBq6NmBkFz7oCLmMXWQyknFOUkJHj1g2oDDO9ol62leoCX2a0hbDsl+a6eotiDj2tpKX2c1PwihfGpLF66BKrYmMJsH7bV3EpEJK9SzOI4pV0Ti2nE6yodQ22udfiRldo9haCbnojQxmq4Vos5895lAFZSeKIY2bbSRroOOXkIF+A6kr/Kloe3ToFw7OzivRL0hPHPfayNw9zkJx1bjHvyVKdrjfOBEKaLmS+J4yzLNN2ekMvPG/aLByUPCnJEaQqPXoAffqcctP9IQFJDK5MFbGfk9IUgITANo2eox5tPzpCvMZYWMtF7O+SsxD2XUWzeWCniSM9pWC5QDlNUssWqM7aEwO/Lp437Rhz0UX+UPJS5O9YvIgqFCWXAO/l1vLJuVvX6YPZzoTKVV9Em+PKlrGA2Fey35qwduwr5qHFyzdvgAWn4ZMvmmlGkmCiLnaOlWEbJei6gy+UdIgLAfJ9vMSCPbxA/g0FdYCOdGceODuFEHvZn0Q3ImbgVycD16j84x2KVYtt4h9qJsMbn+QlnMvFxOrRuU7HVtU+T0fFqcSyL+VJnnebJbjLHMcEeaZsExPVFSDX11tQ0HTm3jbxsA6mvKyA2Z0xQc114COOOzJeBlMGxeSkSrmUM/cnTMPgn0aTxAjRwRF8Bl1wNY9fFc/QezDxOAyVFt8om1YVhgmWmT5qc621MXK+5HyjQk59lqlEZpdVPSh0iJdfkmoyjeuwONBe+cyiXrDg+lTC40RV+S1VPYBg+8h0uKFp/sJdZh4w/0Q3UpPd/Hvd0gvQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(66946007)(66556008)(7416002)(8676002)(64756008)(33656002)(76116006)(478600001)(4326008)(66446008)(66476007)(2906002)(186003)(5660300002)(7696005)(26005)(83380400001)(9686003)(41300700001)(52536014)(86362001)(8936002)(6506007)(38100700002)(54906003)(71200400001)(122000001)(6916009)(316002)(38070700005)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHYwclRkSlA3TkdZZFhwNytQcnJFV2MrdU9ydjA2OGtLSlBVTnp0SkJaMFZr?=
 =?utf-8?B?d3ZjKzlNNllrM01iTlI0cmo2d1dDSVVxak9uZGJKS0NZQkRtV2lPYmdRcEpo?=
 =?utf-8?B?OGp4RS9leWd2dS9QejRib1Rkeit2cTZpYUFwS2FGcXlmb2ZEcnJBR1BQVTZL?=
 =?utf-8?B?cmRvMmgrQTF1MHZrZ0Y1QWpXcE5jbk9NL2dOS08rTWFXS3JsS25BYVdKTmJz?=
 =?utf-8?B?VVJIRElaZktudWV3M1hxWWYvc011aVNZZmVnNVVKOGFOaDBMWnUrQkJQS2Qw?=
 =?utf-8?B?SmhjTkpncktkajFZWi9aUjdwaFJUaWE0bzdYejZObjRsOHZYUEphNWJ0UnlR?=
 =?utf-8?B?Z2NmdVZwU2NDNHIrc3lNUTVkSGJ2WUlzWGdFUDVYbGYraEpPa25PSVhueWhC?=
 =?utf-8?B?VGZVRVkweEMwRXVpdVNLeHZhRFhQdVpEb1FiLzhRL3NXNFNVa3F3OWNoYVJT?=
 =?utf-8?B?UTg3c0JnRWxGcmhYaElLYmJKWkdYSnBsL3MzSEd2MlhWaGxaY29aM0Q4SENn?=
 =?utf-8?B?ZGRVcFJsem9abGoycUlvQ0JOL1NRWmpKZVR1MW55NFdFNzBTclkzQ2ZmdFk0?=
 =?utf-8?B?eG5nbTFMYVpaLzhkZG13TVlUSmJBY3dGTUhvVmR1OFZzeWVOdWtVTUV6elkr?=
 =?utf-8?B?YVRyUjlDZ1VSdVVuUkNSSTRJR1VMRHBsQTA2U2cxa2EwWTQwNjgvV2hNZzF0?=
 =?utf-8?B?dXdaZEY0STdmQWtnV1FpTG5zYlpBRE1hcllnUFNkbEZaZzFuMk9HTkdXNEZ3?=
 =?utf-8?B?QWlHZC9RRGVDRzBJai9DM2liVjBhSHJnNFFTMU9ua1R3cHlLdHZRV1FRMWgz?=
 =?utf-8?B?eHBRTHJJdjdGaU1td1hEVWpad2Z4RTVUeFhCNEhCRlF5YllNQ1dBZUNITThS?=
 =?utf-8?B?SXhVTUFaMXFzZzdDTDlwekxiVnVhTlpBRzNxaEUzeGlUa3M2N3lkVU85Tm82?=
 =?utf-8?B?cUpsY1d1QmVLa0dZSFE3eFZEdCt4Ky85N3dHTWtEd0ppeUJyMmpoeUJXTm9l?=
 =?utf-8?B?N1lPMGlZaFJSN3poUmpiYzJFZHVRcThoRis1UEZETFppR0tDOFdOSlZDVzIr?=
 =?utf-8?B?NnMzUCs1VDlsQVNRTHJJYkl5T05sWE9wVmhTMEdnaEVaYndsYk1JaXdpNWZ0?=
 =?utf-8?B?VEFBM1pUTXdJdmt1NkQxcEIyRk9CSTlDSkRXM0ZIbFlxUzNieTZFN250Nmc2?=
 =?utf-8?B?aHg0SWJoMmdtODFRVzZOeXI4a0N6YWhqQVIyMzhaQUROMWpCZUNpSlVTMnV6?=
 =?utf-8?B?U09NQjNnRHBxRE1mZmlyVEhJengwSnZhK0RFLytPMUJWVFlWcEYzcDBMTkcy?=
 =?utf-8?B?a2ZERkJBQnVUMHpNcXd1NzJjeTBnTGlqeDdkSmErcmpyK2dYTHRURUJtYUtx?=
 =?utf-8?B?cVdjamhieVFsalpsNjNQbmZFdFJMeDZYTVBtR00rS3JTWEd3TVZrVnk2b1hq?=
 =?utf-8?B?ZFVMV29WenhtRmJ2WWFOVXl4M29BaUh4ZVFCNVU5UUlZNU13VEdCKzlTSlZJ?=
 =?utf-8?B?ZElHOFRHcDVQVWdLeWZoK2JQR0JaQ3NvMnI5TU1LOTdvZ1h6bEttYkE3RHJk?=
 =?utf-8?B?MTZTL2xaZ2FYMjltN2Z4UytmNzBUeDBjVjdDSHhOZXlSRHJJUUhoeXo4ZTRW?=
 =?utf-8?B?eXdZNXJoWVZ5cWwvTUJRYmttLzdNZUJIVHJ3OU5tT2I3bUF1T0RnYWhYSFRx?=
 =?utf-8?B?cEFyN0MzWWIvVFVyWUgyYnVjSFNQN2QzTDRUNk4vN21LTWVINklQeC9nSytM?=
 =?utf-8?B?aXkvaFk0Y0V3NHhUbjBtODZPSUJqcHY0V05XVmRxYkJwVUJjR0JOOGZNUEgz?=
 =?utf-8?B?Tm1DZnVGd1draGtoVVY2WklMc2JOMzRWRWViQXEwY3lqcWVSUERKQzBuejNT?=
 =?utf-8?B?MlloZ1l2c0ZtbmJzVk5zd3RnZTR6MDlwQVhJdFV0SWxDb1c0MGhTMHQ2S3RE?=
 =?utf-8?B?N3dFSVVKdWZNeW9YdVFlOXBlZnVWUkRwK2hMQjhLN2c1WlVhNVpxdWttL3hy?=
 =?utf-8?B?L1poWmszcEoyTmZ4cEV4MDRBaEpnRys1NWJlckp1NzA2TEdiMEEyd1o3U3VQ?=
 =?utf-8?B?WnBIc3p0VCt5YTJMOFJSbVVKWnEyT01hYU41Ymt6S2ZiNE9SYmpWWHlHZEVh?=
 =?utf-8?Q?x4PWTmll6E07PWJGtkInPyryE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 175f748f-607d-4141-e1df-08da8fd3006e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 06:42:43.3859 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZVbRROUdy4w5H8sIEzpjBiaq/YIpXguPYnuFMx442wWfEa9wwEgqq0d1kW5EuWjkL/c4dFvY2psqMYyrFcHzNI8e6jSRaoFRcSId4dZxVNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10257
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Steven Price <steven.price@arm.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2xlbWVudCwNCg0KPiANCj4gSGksDQo+IA0KPiBPbiBNb24sIDUgU2VwdCAyMDIyIGF0IDIw
OjE3LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+
DQo+ID4gSGksDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4NCj4gPg0KPiA+ID4gU3Vi
amVjdDogW1BBVENIIHYzIDQvNV0gZHJtL3BhbmZyb3N0OiBkZXZmcmVxOiBzZXQgb3BwIHRvIHRo
ZQ0KPiA+ID4gcmVjb21tZW5kZWQgb25lIHRvIGNvbmZpZ3VyZSBhbmQgZW5hYmxlIHJlZ3VsYXRv
cg0KPiA+ID4NCj4gPiA+IGRldm1fcG1fb3BwX3NldF9yZWd1bGF0b3JzKCkgZG9lc24ndCBlbmFi
bGUgcmVndWxhdG9yLCB3aGljaCBtYWtlDQo+ID4gPiByZWd1bGF0b3IgZnJhbWV3b3JrIHN3aXRj
aGluZyBpdCBvZmYgZHVyaW5nIHJlZ3VsYXRvcl9sYXRlX2NsZWFudXAoKS4NCj4gPg0KPiA+IElu
IHRoYXQgY2FzZSwgd2h5IG5vdCByZWd1bGF0b3JfZ2V0KClmb3IgRHluYW1pYyByZWd1bGF0b3Io
bm9uIGZpeGVkDQo+ID4gcmVndWxhdG9yKT8/DQo+IA0KPiBTb3JyeSBJIGRvbid0IHVuZGVyc3Rh
bmQsIHdoYXQgZG8geW91IG1lYW4/DQoNCk5vcm1hbGx5IHdlIG5lZWQgdG8gdHVybiBvbiByZWd1
bGF0b3IgYW5kIGNsb2NrIG9ubHkgd2hlbiBuZWVkZWQuDQpJIGFtIG5vdCBzdXJlIHdpdGggeW91
ciBuZXcgY29kZSwgd2lsbCBtYWtlIGl0IGFsd2F5cyBvbiBhbmQNCmRyYWlucyB0aGUgcG93ZXIg
dW5uZWNlc3NhcmlseSBhbmQgZG9lcyBpdCBzZXQgbG93ZXIgb3BwIG9yIGhpZ2hlcg0Kb3BwIGF0
IHRoZSBzdGFydD8/DQoNCkNvbXBhcmVkIHRvIHRoZSBmaXhlZCByZWd1bGF0b3IsIHlvdSBoYXZl
IHZvbHRhZ2UgcmVndWxhdG9yIHRvDQpjb250cm9sIHRoYXQgaXMgdGhlIGRpZmZlcmVuY2UgYmV0
d2VlbiBteSBlbnZpcm9ubWVudCBhbmQNCllvdXIgZW52aXJvbm1lbnQuDQoNCkkgYW0gbm90IHN1
cmUgYW55IG90aGVyIFNvQyBpcyB1c2luZyB2b2x0YWdlIHJlZ3VsYXRvcj8/DQpJZiB5ZXMsIHRo
ZW50aGVyZSBzaG91bGQgYmUgc29tZSBidWcgb3Igc29tZSBkaWZmZXJlbmNlIGluIEhXDQp3aGlj
aCBpcyBnaXZpbmcgZGlmZmVyZW50IGJlaGF2aW91cj8/DQoNCklmIHlvdSBhcmUgdGhlIGZpcnN0
IG9uZSB1c2luZyB2b2x0YWdlIHJlZ3VsYXRvciB3aXRoIG1hbGkgZ3B1LA0KVGhlbiBZb3VyIGlt
cGxlbWVudGF0aW9uIG1heSBiZSBjb3JyZWN0LCBhcyB5b3UgaGF2ZSBwcm9wZXINCkhXIHRvIGNo
ZWNrLg0KDQo+IA0KPiA+DQo+ID4gPg0KPiA+ID4gQ2FsbCBkZXZfcG1fb3BwX3NldF9vcHAoKSB3
aXRoIHRoZSByZWNvbW1lbmQgT1BQIGluDQo+ID4gPiBwYW5mcm9zdF9kZXZmcmVxX2luaXQoKSB0
byBlbmFibGUgdGhlIHJlZ3VsYXRvciBhbmQgYXZvaWQgYW55IHN3aXRjaA0KPiA+ID4gb2ZmIGJ5
IHJlZ3VsYXRvcl9sYXRlX2NsZWFudXAoKS4NCj4gPiA+DQo+ID4gPiBTdWdnZXN0ZWQtYnk6IFZp
cmVzaCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPg0KPiA+ID4gLS0tDQo+ID4g
PiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyB8IDggKysrKysr
KysNCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+ID4gPg0KPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMN
Cj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYw0KPiA+
ID4gaW5kZXggNTExMGNkOWIyNDI1Li42N2IyNDI0MDcxNTYgMTAwNjQ0DQo+ID4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jDQo+ID4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jDQo+ID4gPiBAQCAtMTMx
LDYgKzEzMSwxNCBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9pbml0KHN0cnVjdA0KPiA+ID4gcGFu
ZnJvc3RfZGV2aWNlDQo+ID4gPiAqcGZkZXYpDQo+ID4gPiAgICAgICAgICAgICAgIHJldHVybiBQ
VFJfRVJSKG9wcCk7DQo+ID4gPg0KPiA+ID4gICAgICAgcGFuZnJvc3RfZGV2ZnJlcV9wcm9maWxl
LmluaXRpYWxfZnJlcSA9IGN1cl9mcmVxOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgLyogU2V0dXAg
YW5kIGVuYWJsZSByZWd1bGF0b3IgKi8NCj4gPiA+ICsgICAgIHJldCA9IGRldl9wbV9vcHBfc2V0
X29wcChkZXYsIG9wcCk7DQo+ID4gPiArICAgICBpZiAocmV0KSB7DQo+ID4gPiArICAgICAgICAg
ICAgIERSTV9ERVZfRVJST1IoZGV2LCAiQ291bGRuJ3Qgc2V0IHJlY29tbWVuZGVkIE9QUFxuIik7
DQo+ID4gPiArICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gPiArICAgICB9DQo+ID4NCj4g
Pg0KPiA+IEZZSSwNCj4gPiBPbiBSWi9HMkwgbWFsaSBncHUsIHdlIGhhdmUgZml4ZWQgcmVndWxh
dG9yIGFuZCBJIHdhcyBhYmxlIHRvIGRvIEdQVQ0KPiA+IE9QUCB0cmFuc2l0aW9uIHdpdGhvdXQg
YW55IGlzc3VlcyBwcmV2aW91c2x5Lg0KPiANCj4gcnpnMmwtc21hcmMtc29tLmR0c2kgdXNlcyBy
ZWd1bGF0b3IgcmVnXzFwMXY7IHdoaWNoIGlzIG1hcmtlZCBhcw0KPiByZWd1bGF0b3ItYWx3YXlz
LW9uOyB0aGF0J3Mgd2h5DQo+IHJlZ3VsYXRvcl9sYXRlX2NsZWFudXAoKSBkb2Vzbid0IHN3aXRj
aCBpdCBvZmYuDQoNClllcyB0aGF0IGlzIGNvcnJlY3QuIEl0IGlzIGZpeGVkIHJlZ3VsYXRvciBh
bmQgYWx3YXlzIG9uLg0KV2UgY29udHJvbCBvbmx5IGZyZXF1ZW5jeS4NCg0KQ2hlZXJzLA0KQmlq
dQ0KDQo+IA0KPiA+DQo+ID4gcm9vdEBzbWFyYy1yemcybDp+IyBjYXQgL3N5cy9jbGFzcy9kZXZm
cmVxLzExODQwMDAwLmdwdS90cmFuc19zdGF0DQo+ID4gICAgICBGcm9tICA6ICAgVG8NCj4gPiAg
ICAgICAgICAgIDogIDUwMDAwMDAwICA2MjUwMDAwMCAxMDAwMDAwMDAgMTI1MDAwMDAwIDIwMDAw
MDAwMA0KPiAyNTAwMDAwMDAgNDAwMDAwMDAwIDUwMDAwMDAwMCAgIHRpbWUobXMpDQo+ID4gKiAg
NTAwMDAwMDA6ICAgICAgICAgMCAgICAgICAgIDAgICAgICAgICAwICAgICAgICAgMCAgICAgICAg
IDANCj4gMCAgICAgICAgIDAgICAgICAgICAxICAgICAgIDE0NA0KPiA+ICAgIDYyNTAwMDAwOiAg
ICAgICAgIDAgICAgICAgICAwICAgICAgICAgMCAgICAgICAgIDAgICAgICAgICAwDQo+IDAgICAg
ICAgICAwICAgICAgICAgMCAgICAgICAgIDANCj4gPiAgIDEwMDAwMDAwMDogICAgICAgICAwICAg
ICAgICAgMCAgICAgICAgIDAgICAgICAgICAwICAgICAgICAgMA0KPiAwICAgICAgICAgMCAgICAg
ICAgIDkgICAgICAgNTI0DQo+ID4gICAxMjUwMDAwMDA6ICAgICAgICAgMCAgICAgICAgIDAgICAg
ICAgICA5ICAgICAgICAgMCAgICAgICAgIDANCj4gMCAgICAgICAgIDAgICAgICAgICAzICAgICAg
MjU0NA0KPiA+ICAgMjAwMDAwMDAwOiAgICAgICAgIDAgICAgICAgICAwICAgICAgICAgMCAgICAg
ICAgMTEgICAgICAgICAwDQo+IDAgICAgICAgICAwICAgICAgICA0NiAgICAgIDMzMDQNCj4gPiAg
IDI1MDAwMDAwMDogICAgICAgICAxICAgICAgICAgMCAgICAgICAgIDAgICAgICAgICAwICAgICAg
ICAzMw0KPiAwICAgICAgICAgMCAgICAgICAgIDAgICAgICA3NDk2DQo+ID4gICA0MDAwMDAwMDA6
ICAgICAgICAgMCAgICAgICAgIDAgICAgICAgICAwICAgICAgICAgMCAgICAgICAgMTYNCj4gMTkg
ICAgICAgICAwICAgICAgICAgMCAgICAgIDIwMjQNCj4gPiAgIDUwMDAwMDAwMDogICAgICAgICAx
ICAgICAgICAgMCAgICAgICAgIDAgICAgICAgICAxICAgICAgICAgOA0KPiAxNSAgICAgICAgMzUg
ICAgICAgICAwICAgICAgNDAzMg0KPiA+IFRvdGFsIHRyYW5zaXRpb24gOiAyMDgNCj4gPg0KPiA+
IENoZWVycywNCj4gPiBCaWp1DQo+ID4NCg==
