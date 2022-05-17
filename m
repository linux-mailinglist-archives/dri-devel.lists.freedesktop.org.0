Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814FB52A9DC
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 20:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214DA113538;
	Tue, 17 May 2022 18:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2116.outbound.protection.outlook.com [40.107.114.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1E010E75B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 18:03:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dz+o+ue/XPnBf+eMF1ZRngF55QeaWyzqqIwcuQDEg/VIDx8goF0utk0Gz/8SDWa4rRseWsDsxZI6KG7wH+cr2skivkMyqP/NKMT06jbQ579uoeD4DPI75f+kWLStduda1RiVKj2WWBnZvPrJM4AKZCSGqmSzjXTUtiHPEX5Acikhzq/ydKjWyr1N2RUTtXuwdRYJH995cPlz43fqhX2t7dYBxwGDVheIeMEjjBnKwrcJ1ypjCHc2bfIOwKbZ71HahWvZaP9OL391jv+PvscsSb2n/3zdRUG6agaoaRane3302QABIy2jzkLTmxcffqBolLVQKc5VumpkxE4ZXD8xvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8H9vCs79HAu1D7aSSik1Pq3xMau0Q+txwldeBTUtL9Y=;
 b=fJA5GOoIuMMWJQNlaRrHsiv9pT3qX3nN86lSGiGRfI4ZEjWKPRNqlcxoiOj+2jonOLYgpnO5A9fguYJLe1PrHOvLxxHjcHS6vClvRsJ6W0xKUA3J/11Og2qcbs7OnsvifiGdsYpPieqEEFrvbfcB7fJGUvrO1fWIMiuPI8lGzR8YIJ6zMQtCMJXhYHsei+aHtxjn6WCoFK79TWkcuhNICrUI5TmxWT06NkEntUmghsG494E8ai/ydkGtz/aIvOOWMedvZKYpuTrg6YQmlot1x2bemy31H19V/iVtmgqDCvdOiSv9ewU7GYLnSJrxJhTS7M4vixN5l2rJS7dIW0jGow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8H9vCs79HAu1D7aSSik1Pq3xMau0Q+txwldeBTUtL9Y=;
 b=MFbxhm9U4Q4kEPd807NNOkQ4WXlBPyGV3tQBudHCjnAHEklFagyAKL16ZXnGfFpVm3Dq+nnzIcMQUa3yt3p+ccWiQATldR3Y3/RFbkoRma43JyQr87K7PZJWke0uUvX5jvfLrdLLRuy0Ye08YMLIMbqgB+4QJZdU4X1Was1aUpM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY1PR01MB1675.jpnprd01.prod.outlook.com (2603:1096:403:6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 18:03:33 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%9]) with mapi id 15.20.5273.014; Tue, 17 May 2022
 18:03:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: RE: [PATCH v2] drm: rcar-du: Fix Alpha blending issue on Gen3
Thread-Topic: [PATCH v2] drm: rcar-du: Fix Alpha blending issue on Gen3
Thread-Index: AQHYWUmCZ4K4PfWv4U+O9uppgMBUe60cshYAgAbLr7A=
Date: Tue, 17 May 2022 18:03:32 +0000
Message-ID: <OS0PR01MB5922E7CBF5806C833F3874AE86CE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220426084157.10979-1-biju.das.jz@bp.renesas.com>
 <165243691268.2416244.4640685679737534741@Monstersaurus>
In-Reply-To: <165243691268.2416244.4640685679737534741@Monstersaurus>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ca3502f-83c9-45ed-a805-08da382f8e50
x-ms-traffictypediagnostic: TY1PR01MB1675:EE_
x-microsoft-antispam-prvs: <TY1PR01MB167545D0356821825AE0CDC986CE9@TY1PR01MB1675.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TFFrkvR1Jmo2rSxJQplylSp/yjQjtwTN3YsuSVF6zLaHbarxp8Cqv56Dy7dqbSTmQX8GlzJKP/exQTzLXB9ODXTMrWOYL221s6ixAXbxKQRoOw0xmY7djC0O0C4xP1iyLLfcksekKGwiGFn4qyMdutt9duQMdCK9HId7ebVdNzdH3TftWQ/fytvIg4cbycxa57IhSaqJaIQEszFO3S2B6LDZ2Xm1xuDbOCOZ50MKUXX9vhZz0jnmtuA9Xx4G/V2qKmJHpl0n7eFPEyd7UxFGihWiNK0bCny6Z4oHBA0g44MqsxSNsQPsKUn4hsTGAQRykv2KLRwl2fEzPfVmp/bSbuP4QYbzJAEB40810zahyGFXb9uJmpxpR8U4qkTZGxvWLyrbk4BVzJcPPYonuq8GX19jZo+AuEsW3LhOTTuFdJtLXgmhgL3iyolQnreRRiJURZohT4tZMjhncEIelE8ITC7uNrWf59p2jYWXHw6hZDgIlRrPCDww4kDScAXntQZg1fwZIwxhzOsAl1zNHcNLf7oCQk475zfAHnwoSD14fTB29OIJwBHP1rMYB4zUR7Q9xd49/ZUdLuzZQaqLKZTZywMuaOlv3loYnjJBs1oddal29AqQfb6AHDM6K5i2Ef8fFCeaM6+8iVV/uU71mq0G/5NUwiu0iBUB8Pvq59L0UPvI4mW+DoCi+gciN1PE8IjpzmNk8DpHPHW5mHdyp5Qkvg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(55016003)(33656002)(2906002)(122000001)(4326008)(110136005)(54906003)(76116006)(64756008)(66446008)(66946007)(66476007)(66556008)(7696005)(52536014)(508600001)(71200400001)(9686003)(8676002)(26005)(86362001)(186003)(6506007)(316002)(83380400001)(8936002)(38070700005)(5660300002)(38100700002)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3FWSTNjSG1GWHBlNC9yNkFhbndRTDNiVVcvTlBoOElJVkc3OEFUWG10Nit4?=
 =?utf-8?B?QW15c0NvZVVzb3lXd29JLzNKMHhYZ2g5Mm1Uek8vNlJMVXV6alk0MDlLRzVE?=
 =?utf-8?B?RHZhYnAzYmZURzM1YU9kYXFZUWVKZkIvYVdTam1ObkVMWDFwTUhPVGx2RXpu?=
 =?utf-8?B?S3hxTC8zMDluVFF0ZFVxRDVkY3ZHUGVPbmcxYTY3TjhiZytWbGtCSnliNjhz?=
 =?utf-8?B?bE1UWEgzT0c5WGNnd0JxZDZhVzU1YVdaMGUzTnVLdHVYZS9SZWl5Mjc2RnE4?=
 =?utf-8?B?UkI3MklqNDh0L0kxVEdkeDl1Nk1vSWhvK0MxUEpUYkNxTHMvcEg5REg1OW4w?=
 =?utf-8?B?UDFoVnVHZGhrWGlmRFhQc3ltRmtobXM2K3dSbWdVVVJBRTJjZmNNOVBma3Jw?=
 =?utf-8?B?cXNvMnpTcDY1STRzOXdZRndXZUJhMXFnZlI4Z0dHaFBlQy9iRmZBaTRNZFlM?=
 =?utf-8?B?cFhxcmxSMWZVRVZJQWMwa0dFeURnYytPN0JadE1QZ0JVQjBwYllUdFlBWG5Q?=
 =?utf-8?B?YWw5RzJUeHZwc2hPZXBqTVZUWjlldG0xeFhWcVRSUURSejFkeW9FbXViVEdB?=
 =?utf-8?B?VjMxbUsyeFBaaUt2WGt4V2xFOTZoYWh2dmJsSUNMV05vVUN2M29VVmJpLy9a?=
 =?utf-8?B?aEtPaWc3WXl2UXlJL2pYSFVPNVdQVVlUR0MvRStYNkZ0enlFb0xod2dhS1Y0?=
 =?utf-8?B?OFA5QWZWNWhpcGE0SE5IUEhPNm1HeFZxZkJkSFFRWHJvSXBjdE1IaTg4S0V6?=
 =?utf-8?B?MW03RXB3Y3o1YUlGam8zRnpmTmtPQWlCVWdUZ2FlV09UZ0lTNjVXamExbDZ5?=
 =?utf-8?B?L1FmTUc4eGx6YlpUSmp3SVRSNzZvc1ZCL3F1OWtXZFM5ZzFoRGxqRmNGL2VN?=
 =?utf-8?B?THBLaVlJRDBERk5ob2czV2tKOU5wcjVDUkNJMU9PaHJzSmc1V0JUU3o5eU1n?=
 =?utf-8?B?cnllOXRaK3E3Q05wSEttK0FEaUdwZTI0MnR1bm05RHUyaVUrTmtWaENJcHgx?=
 =?utf-8?B?c0VpNHNrVURYMlNBQTBCK0dLZ0hFdllTemN0bHE3R0dIN3pjb0s5aVNUVEo0?=
 =?utf-8?B?ci9KdThJTm5nODRzM0FhNkxweER6bXdpcjBsMVU1dGgyMW9qWW9lc2FTSWp1?=
 =?utf-8?B?azd0RHJOcDFQSWhJWmlWNlZjdFFYQndBQnhRRVZ0ZXk1eXFXOUljZkcxbTdH?=
 =?utf-8?B?TW9NcHJjZmpWMWJiR1Fqb1AxdTI1R0ZoWWJ4Wm9tT09aR1hNcHh1eVo1UW9i?=
 =?utf-8?B?T21ZQ3FTb01qTUZ5ajhZVDlGc3hmNTZGZXpyYzBxNE1JYlJ0R3pzWWlhYzV3?=
 =?utf-8?B?SjF4OVpoOFR4dFA2azh4a09IbXVGMXhaNHU0T0I3YjlmYzIrZ0dRa2pyUkpT?=
 =?utf-8?B?VkNEQkhwT0c2WHQwcFV1SkNjeE50RURub3BCUFFYTEFaV0FFUmkxdWhWaE9X?=
 =?utf-8?B?N29nV3BvdHVlTmRGWU9VbmhSbFBSZzVodzU1VUx3a1E1cWV3RkxZeXB2cWZO?=
 =?utf-8?B?S0R4Tml6S3ppQXgvL3BKK3orclNhNkovNE5GV3hCNUoxUHFYU0s0ZnRsN1Nr?=
 =?utf-8?B?VFIxWkN2b3BsTG9KdjZsU0p6UmFNd1NrT29RbHFiWXh6dUFWTWF3U0JkZUVj?=
 =?utf-8?B?U0p4SU9QaUtNd29JYTU3NHZmME8xOUkxWTRHL2VDVzhtcThZeWRaZkg0d2Qy?=
 =?utf-8?B?cGlzUGgwSkdSZktmL3YwdE94ZWxVOTB1RU4vbGRUY2d5amxqMTZNQXA5L3dm?=
 =?utf-8?B?dGxpem1id08zZ2Y3cU1DVVZsL1hGaEh0QjR6YTB6bHNqalQrSEJpOE0rS0pD?=
 =?utf-8?B?SU5aUFFxc3B0anl0eXVoUXpSUkl2cVdGTXBlcHFTdldlRk80R2g0V0tYcEhY?=
 =?utf-8?B?ZEwrZitnRStqRWFIalhnRisycUczdjBXak1CaEFxN0RIVERQU1c3SEZCbVNk?=
 =?utf-8?B?RU5oZEVLQlFBVDVmaWFoTjg4dzZHVThqM3dNV1E3WVFyVURBdnZIUERDK2dY?=
 =?utf-8?B?VXpDZ01YeEUyekFLbVFZZHVsaXRvTkpONWZ4Mkh1eURvM3RiUldNTno2bTZo?=
 =?utf-8?B?VC9FT0pzUDVpNDYyZ2JTU1hmY1Y4RzkxK3dKN2tMaVd1T0FOd09oS3hmNnNj?=
 =?utf-8?B?YUplN3dLUlhnLzgyRWcyQWFZZVBQUWpTUnlhcHZzUURYZWZ3UFNybFJFZEh3?=
 =?utf-8?B?RU10RWMvVzV3dDlWaUJnUG8zeG5sRGlNSWtPdWNjYld1WjVab0NIUVUrUXJF?=
 =?utf-8?B?N2k4UEtZZjNaOTBrb0lZcDBKOHduemkrSTJhQVBRY3VCTmNmQzRqTUVpU3R5?=
 =?utf-8?B?QWZ6QkgzT3U5Ky82N3ZQRXlpdStSWEFZc1pDNU5ETldMN05aUnNValBISnEw?=
 =?utf-8?Q?/d37NTHXjVBpFhN4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca3502f-83c9-45ed-a805-08da382f8e50
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 18:03:32.8459 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6nuaH1YR/hBZGptuKA11+epHXqd3b3yM7ZcOERTBWPAyPJPl/twyYy6fs7198AkfXGF9lXPVx/KlpOHs6BzdGMa1sogd9PpoIlDaBfFCvhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1675
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hoai Luu <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS2llcmFuLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIGRybTogcmNhci1kdTogRml4
IEFscGhhIGJsZW5kaW5nIGlzc3VlIG9uIEdlbjMNCj4gDQo+IFF1b3RpbmcgQmlqdSBEYXMgKDIw
MjItMDQtMjYgMDk6NDE6NTcpDQo+ID4gRnJvbTogTFVVIEhPQUkgPGhvYWkubHV1LnViQHJlbmVz
YXMuY29tPg0KPiA+DQo+ID4gQXMgcGVyIFItQ2FyLUdlbjNfQ29tbW9uX09QQ19DdXN0b21lcl9O
b3RpZmljYXRpb25zX1YzMC4xLnBkZiwNCj4gPiB1bmV4cGVjdGVkIGltYWdlIG91dHB1dChzdWNo
IGFzIGluY29ycmVjdCBjb2xvcnMgb3IgcGxhbmVzIGJlaW5nDQo+ID4gaW52aXNpYmxlKSBjYW4g
aGFwcGVuIG9uIHRoZSBiZWxvdyBjb25kaXRpb25zLCBhcyBQbkFMUEhBUiByZWdpc3RlciBpcw0K
PiA+IG5vdCBpbml0aWFsaXplZCBieSByZXNldC4NCj4gPg0KPiA+IFdoZW4gYWxwaGEgYmxlbmRp
bmcgKFBwTVJtLlBwU1BJTT0wYjEwMSkgaXMgcGVyZm9ybWVkIGFuZDoNCj4gPiAgICAgICAgIOKA
onR3byBQbGFuZXMgYXJlIGVuYWJsZWQgb24gYW55IERVbiAobj0wLDEsMiwzKQ0KPiA+ICAgICAg
ICAgICAgICAgICBvRFNQUm49IDB4MDAwMCAwMDMxIG9yIDB4MDAwMCAwMDEzDQo+ID4gICAgICAg
ICDigKJvciBEVTAgYW5kIERVMSBpcyB1c2VkIGZvciBkaXNwbGF5IGF0IHRoZSBzYW1lIHRpbWUN
Cj4gPiAgICAgICAgICAgICAgICAgb0RTUFIwPSAweDAwMDAgMDAwMSBhbmQgRFNQUjE9IDB4MDAw
MCAwMDAzDQo+ID4gICAgICAgICAgICAgICAgIG9EU1BSMD0gMHgwMDAwIDAwMDMgYW5kIERTUFIx
PSAweDAwMDAgMDAwMQ0KPiA+ICAgICAgICAg4oCib3IgRFUyIGFuZCBEVTMoSDMgT25seSkgaXMg
dXNlZCBmb3IgZGlzcGxheSBhdCB0aGUgc2FtZSB0aW1lDQo+ID4gICAgICAgICAgICAgICAgIG9E
U1BSMj0gMHgwMDAwIDAwMDEgYW5kIERTUFIzPSAweDAwMDAgMDAwMw0KPiA+ICAgICAgICAgICAg
ICAgICBvRFNQUjI9IDB4MDAwMCAwMDAzIGFuZCBEU1BSMz0gMHgwMDAwIDAwMDENCj4gPg0KPiA+
IFRoaXMgcGF0Y2ggc2V0IFBuQUxQSEFSIHJlZ2lzdGVyIHRvIDAgdG8gYXZvaWQgdGhpcyBpc3N1
ZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IExVVSBIT0FJIDxob2FpLmx1dS51YkByZW5lc2Fz
LmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+ID4gLS0tDQo+ID4gdjEtPnYyOg0KPiA+ICAqIFVwZGF0ZWQgY29tbWl0IGRlc2Ny
aXB0aW9uDQo+ID4gICogVXBkYXRlZCB0aGUgY29kZSBjb21tZW50cw0KPiA+IC0tLQ0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X3BsYW5lLmMgfCAxMiArKysrKysrKysrKysN
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X3BsYW5lLmMNCj4gPiBiL2RyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfcGxhbmUuYw0KPiA+IGluZGV4IGYyMTRhOGI2Y2Zk
My4uYWE4MGM0NGRkOGQ3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfZHVfcGxhbmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfcGxhbmUuYw0KPiA+IEBAIC01MTAsNiArNTEwLDE4IEBAIHN0YXRpYyB2b2lkDQo+ID4gcmNh
cl9kdV9wbGFuZV9zZXR1cF9mb3JtYXRfZ2VuMyhzdHJ1Y3QgcmNhcl9kdV9ncm91cCAqcmdycCwN
Cj4gPg0KPiA+ICAgICAgICAgcmNhcl9kdV9wbGFuZV93cml0ZShyZ3JwLCBpbmRleCwgUG5ERENS
NCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhdGUtPmZvcm1hdC0+ZWRmIHwg
UG5ERENSNF9DT0RFKTsNCj4gPiArDQo+ID4gKyAgICAgICAvKg0KPiA+ICsgICAgICAgICogT24g
R2VuMywgc29tZSBEVSBjaGFubmVscyBoYXZlIHR3byBwbGFuZXMsIGVhY2ggYmVpbmcgd2lyZWQg
dG8NCj4gYQ0KPiA+ICsgICAgICAgICogc2VwYXJhdGUgVlNQRCBpbnN0YW5jZS4gVGhlIERVIGNh
biB0aGVuIGJsZW5kIHR3byBwbGFuZXMuDQo+IFdoaWxlDQo+ID4gKyAgICAgICAgKiB0aGlzIGZl
YXR1cmUgaXNuJ3QgdXNlZCBieSB0aGUgZHJpdmVyLCBpc3N1ZXMgcmVsYXRlZCB0byBhbHBoYQ0K
PiA+ICsgICAgICAgICogYmxlbmRpbmcgKHN1Y2ggYXMgaW5jb3JyZWN0IGNvbG9ycyBvciBwbGFu
ZXMgYmVpbmcgaW52aXNpYmxlKQ0KPiBtYXkNCj4gPiArICAgICAgICAqIHN0aWxsIG9jY3VyIGlm
IHRoZSBQbkFMUEhBUiByZWdpc3RlciBoYXMgYSBzdGFsZSB2YWx1ZS4gU2V0DQo+IHRoZQ0KPiA+
ICsgICAgICAgICogcmVnaXN0ZXIgdG8gMCB0byBhdm9pZCB0aGlzLg0KPiA+ICsgICAgICAgICov
DQo+ID4gKw0KPiANCj4gU291bmRzIHJlYXNvbmFibGUuDQo+IA0KPiA+ICsgICAgICAgLyogVE9E
TzogQ2hlY2sgaWYgYWxwaGEtYmxlbmRpbmcgc2hvdWxkIGJlIGRpc2FibGVkIGluIFBuTVIuDQo+
ID4gKyAqLw0KPiANCj4gSG93IHdpbGwgdGhpcyBiZSBkb25lPyBEbyB5b3UgaGF2ZSBhIHNwZWNp
ZmljIHRlc3QgaW4gbWluZCB0byBkZXRlcm1pbmUgaWYNCj4gaXQgY2F1c2VzIGlzc3Vlcz8gT3Ig
ZG9lcyBpdCBuZWVkIHZhbGlkYXRpbmcgdGhyb3VnaCB0aGUgaGFyZHdhcmUgdGVhbXM/DQoNCkl0
IGlzIFRPIERPIGFjdGl2aXR5IGFuZCB3aWxsIGJlIGludmVzdGlnYXRlZCBsYXRlci4gQWZ0ZXIg
aW52ZXN0aWdhdGlvbiwgaWYgaXQgaXMgbm8gbW9yZSByZXF1aXJlZA0KVGhlbiB3aWxsIHJlbW92
ZSB0aGUgYWJvdmUgY29tbWVudCBvciBpZiBpdCBpcyByZXF1aXJlZCB3aWxsIHNlbmQgYSBwYXRj
aC4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiANCj4gDQo+ID4gKyAgICAgICByY2FyX2R1X3Bs
YW5lX3dyaXRlKHJncnAsIGluZGV4LCBQbkFMUEhBUiwgMCk7DQo+IA0KPiANCj4gUmV2aWV3ZWQt
Ynk6IEtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5j
b20+DQo+IA0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIHZvaWQgcmNhcl9kdV9wbGFuZV9zZXR1
cF9mb3JtYXQoc3RydWN0IHJjYXJfZHVfZ3JvdXAgKnJncnAsDQo+ID4gLS0NCj4gPiAyLjI1LjEN
Cj4gPg0K
