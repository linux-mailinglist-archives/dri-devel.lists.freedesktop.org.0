Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AAF94DD9F
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 18:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C0010E13B;
	Sat, 10 Aug 2024 16:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="fLgo5fNB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2088.outbound.protection.outlook.com [40.92.102.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74E610E13B
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 16:42:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jK9sZ0PbN6o0wKJodM+y8jhWMZWxgvjtnbHjXWcJTZeOjh0pD7bSbV9qqy6sd59Wdt06MZGtGZtdDi0nRRAKLBP+YnsqyZ4PXTlfQIhh+vLQG2dsS+t2vbOA6EUAUTKin3jbiLHi12NYNR3wbzj+VApOKGJY0kFTL3yrwDP53Rf4p0djmdi704EtqlcXFRmsNMKN9XgMAN+1MkWBXQ2X1PfuSUbpOSAnRAZ4GaUSzvt+GbhTf3+VZjZITP27ghSiQzVJGSyTxz0v+fQorl//cn2SrG9rhtyxvczcprtJUE3jpBF6A5qKzNS1aYJ5UbpQEmKxUFo9jYieZjDuLXHQYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zaxDcUwhj67U1gIusMCAS/KoaILV4JdkHAzN4Ep+VXw=;
 b=NkG+2OQbzP48nkFtiF4fTygP2l14MbRVa1FAOOg5sSJHwOZJFLHTCyOvWjJ5WbXmMB1uAtSB5vhAVG+0aVmcRMo1FMIxhHSehwrF66r/2d3l3xtf2tG6YD6K9YHkSEgk9iHnke2nVPicnYkrOYKPeO5oUhikIPUYUlDNfRIlDytq6Z97odgw8td7ihBOeEYIQ343RXY5uPxq0ObWqt4TFoQfEIbG3DqAX0lhBtcYTwWK94Mepr+M/jOvkSbeDiS6BHVTKGS0b99jWl9X6BC5S6tuBINNgmljbhvWEO2z0zs/RnPoeQ53s2/gBO3TW69ffU9Wlj24VLJqluMBWFnAOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaxDcUwhj67U1gIusMCAS/KoaILV4JdkHAzN4Ep+VXw=;
 b=fLgo5fNBjDRMHq5J0rultmS0QnMZAhsfkjzcB80IAT3YpL8xjwlSh95Yh0QTOQhLXwCGBY1u9zpYdCoNP0B7QOc8L+CuFiSlu8B5xFMXFgDEIjFkRRM2aI/hFZqbEzRoVEkh9yCr0tzPeHS/TchlzJ0QCJL9/xY34Gtec4i0CvQR89/vcAs2UsNAvq3IzPklg6kgEXLjy2aBRFSswLr2rzzQgsHS1tsiSlcQooS8uGLmsaQMHFT07OF2QXs5kborBi3JRvQZfo6NVBBa1XBa7T1MJbNE9maX9wDRAZSbClFZ7FCZul5RtCvD2xRVhPePYg/5oUZoY5x6UmM43hNXrQ==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB1165.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:154::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.17; Sat, 10 Aug 2024 16:42:08 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.015; Sat, 10 Aug 2024
 16:42:08 +0000
From: Aditya Garg <gargaditya08@live.com>
To: =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?= <thomas@t-8ch.de>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>, Orlando
 Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/9] HID: hid-appletb-bl: add driver for the backlight
 of Apple Touch Bars
Thread-Topic: [PATCH v3 1/9] HID: hid-appletb-bl: add driver for the backlight
 of Apple Touch Bars
Thread-Index: AQHa6ZnwyB5bPU44IEyDnWntQU6RLbIgavQAgAASw4CAABOOAIAAEBEAgAAPhACAAARdgA==
Date: Sat, 10 Aug 2024 16:42:07 +0000
Message-ID: <151AA17E-7354-4D61-9587-E755334CD6DA@live.com>
References: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
 <0DDD5C22-A42A-49F2-984C-F3595F71AB1C@live.com>
 <9e398f1b-05c2-4dd3-bc56-2b61c6784aef@t-8ch.de>
 <79DB1D9D-8D32-474F-972F-F82C818AF38F@live.com>
 <375d99a9-5516-4a39-a912-1961b3dd725d@t-8ch.de>
 <6340DD46-4537-434E-9E14-EEFE7E04AAD0@live.com>
 <1166bdaa-ea14-430a-be2e-9593cc08491a@t-8ch.de>
In-Reply-To: <1166bdaa-ea14-430a-be2e-9593cc08491a@t-8ch.de>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [dXUrjqcoZIwTlmvRfb+iUk48XvPd+oxRbbSjhE3zs/oJ+F770k8Sp9F3W2sesMnTPc8EZh70qg8=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB1165:EE_
x-ms-office365-filtering-correlation-id: ac017dd0-97d0-4425-35b8-08dcb95b5f4c
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|15080799003|19110799003|461199028|102099032|440099028|4302099013|3412199025|1602099012;
x-microsoft-antispam-message-info: 6Zx2XfzP3vdXvKmMz6eQl+gJeUfHji9mDhvXEAHhyDWYeGD6wx3xbAzREPQs0XU9Yw8/bZKCt9zaiTpXVr+ZDPn+FzfveTj5YThHL7dFTBR89d+OjZzIjeMFd0quL9IqKUM8qBWs+kE8GySzGew+9DYMydrkfz7pWLlge+Qe5WppMrgPQ1Vqve8CbI/RESoYpBjju4HJprzUSbStrd70m3/bLTwMHRCP00j6sAOobnCzFgzJQY2yYLTCtEWyeiC0cpAKqrm2B27pgFoTuBVHq07Ctu7lc89xXG+ntpOwObZQq0/mLQki94PW3VAEWU0GEgMy4lzA0N9CmtZuw66seAJV5KYe2dZTd377fx4B9+sIjJMF/im4Al+7UTUKOz7HwuFvhzyOg6NLUFPtY8dYLW/DoOpLL2g4qCKzCABNvcCZkZA18dhNsnabbqmg+mqc4JimXp7F2fEt2fkd3u6+Al/EKvE0TMdYAgGUbqWdP2SD6eblNH5bgyHCQERk25BmMtlSoXWXJLnrExBz40dvFGbuzjoaUO/UTVDyglF/6CYstW1yhkannGqrgbVPk/MuKeqS6jw2MP/V6m6BGb9qT5j+0WrgcN2pPrJkR3UcOvrC4dUf/Xf0o9686cB/ojwjOABmHkhRDj3ha8mj1OdWyTF9GQjAsMCt6ipGYVyH7XZiwOkbMOFj8bpHiaC/pc+LGsqSoj90na0XUN/0EjJnRgBjwpLaTYRF/WhbSamP0ELCaRdVhS7dLUd81kUvtd++nr9q4K2CZIq32Qqor4EWIt1AtbCJxfXVvqm4Kae+OGA=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bitLOHRMMmpCSkFTaFpFd3BMVGRKWE9jcUtkSzN0L2N3MjZQUDVRRTl5V3Ix?=
 =?utf-8?B?Z2FJemJyNk00RzBtV3c0VjVYNUpVY2dLa3FjZSt3U0hjVm1La0RhakRsTm1M?=
 =?utf-8?B?UEpsN05tTDlVZHBISGJvTFRaOC9UOUdXRm5hZkhVWTNUWFBSaG9Vc3lBM0M2?=
 =?utf-8?B?TlQ5Z2VpVURmTHZLaDNWOEp6bUtLOHgvenE2QnhYMlBYVkMzc24zWFZ2djlH?=
 =?utf-8?B?VHJUUWRkUndydWR0c1lXaXFjbzhBcDc5YU1RWFZ2cDFvdjBkdjZzRzQ2RUsv?=
 =?utf-8?B?VkUxYlVqcDBkZ1JVck0rVWVPaUVJZ3RHZHlTTlU3a0tLcnl1T0gxdzZGYVpY?=
 =?utf-8?B?VUVHeVFIT016bmIyM0wwYTNPTEtEVkhyL1JVLzlYYWRCdDluNU51cll1dW45?=
 =?utf-8?B?YVVadjBDLzV0alZyZGtrcGNZV1hxYi8yMGRhN0c4Mzl6Q1FQNVpieHA1dFhr?=
 =?utf-8?B?SVU0SENTU0JyZXl6QVZ2RWdxaFNmUUN3OEdza3JaT2dndmtFTFJKTHprMWg5?=
 =?utf-8?B?aUU5REdMOVRLWnR3Y2R1Ym5ObmRUSTkzTUQ2bGIwemgreGxVYVIrVmRHd3VL?=
 =?utf-8?B?Ym94QklLV1B1cEx2eDc0dEkzTmRPdW1zZ293bmQ5YUp1QkowVmZteXdmNmJJ?=
 =?utf-8?B?K2YvcGk5U2pwZFc2TFRpcXZBdElXMjMxR1pzcnB3a1NGbVQ0WG5TZElrY1dl?=
 =?utf-8?B?aDNpWHZFbnBIWlcxTmlSMGNCUXZWRWFxdVJUaDFXeVY4K0JhcnJMWENvWDdE?=
 =?utf-8?B?eE5jbzZzSWQ2Nng5Y0FqbU1CcVZMZ3BpNWN5SUl5WkxwbndLZjJNemkrTlZp?=
 =?utf-8?B?MjJzcTZ1d2VCZTZPcnByU0ZsQkhYRlJSMi95V3FHUFAvSnNHT1JyUzB1OFVq?=
 =?utf-8?B?VXArN3JvRmpxeE96dCs5WVIvcUc0WFFyb0VSbWdZTDJZRXpHU0Zxc3hWaVNR?=
 =?utf-8?B?VzhTNWhQQjNjdFFJbG42RkhIZCtCcTFrMEUzVzRWWmd2NnZaVnFoVElCaXph?=
 =?utf-8?B?QklRVnlpNDVVTGJrVjZ4THUwR0huVjVXRUJJNDNDdXJCbFFuQ2N0RnllTXlF?=
 =?utf-8?B?RGxtWEovbjAvb0d0VU15ZlNUcXQ4WjdvdUJzZGp0VGp1ZXJOTlYwejVqL0dJ?=
 =?utf-8?B?V3Z3N3MraHlnNlZxVDQ5UFI3WkxDdUNiMWRRcVZzN2cvSm00U3JPekV4YWFY?=
 =?utf-8?B?Uk9DRzVqTU94bm1VQ2ZOSkRLa3I5MUVacUZJMUFFVGxkdHFmMkY2NW5tcW95?=
 =?utf-8?B?eFpxVVdPQWFKNTBJcWwxNjkvN0lEZXoxT0lJYnpvbHdaVEt0RlhHQkhTaXhq?=
 =?utf-8?B?NnlxMkJkZTFTWFRBUW5wOFdoT0k4T2FGRVUxdytDL3BTSndSMkNVcWtzNGNC?=
 =?utf-8?B?YktTb2ZQa1NXcmFEbi9WbkJRZEZKYlBsVk5RR2xjVG9LVUh6OTlqbDhZeG1W?=
 =?utf-8?B?R3R4RGx1UDNsQ0VCVlBrTFdiTG5KMmZSbHZVT0NIZjNJMGhHa1Vxak9Telc0?=
 =?utf-8?B?bmlqczFhK1JVRFZNblBmZy8wWU5ZS1Z6UTJ5RHVtbkg2R2RWcG9McUNnenY3?=
 =?utf-8?B?RlJoTm9GaHN1YXpndElPaURGNy9vN1E5bWQ5VGZWdTlzUkc3TFQyRDF6Ukd5?=
 =?utf-8?B?WkdjVU80dTFxNk5TSWhPRUl1N2t2b3h6dHZzcDJTanlsS1hlcklQT1l0dWZz?=
 =?utf-8?B?a2RreWcrMnErVHpaamlrdThRTE94M25uam1Kdk44UUYxNmZMM0xRWVloSHBH?=
 =?utf-8?Q?RvQKnV0FjloiACHpAQ9dFb9dBe7g5zytiu6NHAU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C66AB5583D74049A260749762C0D449@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ac017dd0-97d0-4425-35b8-08dcb95b5f4c
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2024 16:42:07.1413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1165
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

DQo+IA0KPiBTb3VuZHMgZ29vZC4NCj4gDQo+IEZZSSBJJ2xsIGFsc28gcmV2aWV3IHRoZSBvdGhl
ciBwYXRjaGVzIHNvb25pc2guDQo+IFNvIHNlbmRpbmcgYSB2NSByaWdodCBhd2F5IGlzIG5vdCBu
ZWNlc3NhcnkuDQoNCkFscmlnaHQsIGZhaXIgZW5vdWdoLg0KWW914oCZZCB3YW50IHRvIHJldmll
dyB0aGUgdjQgb2YgdGhpcyBwYXRjaHNldCB0aGVuLCBhbHRob3VnaCB0aGUgb25seSBkaWZmZXJl
bmNlIGlzIHByZXNlbmNlIG9mIDEgZXh0cmEgcGF0Y2ggaW4gdjQuDQoNCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LWlucHV0LzIwMTkwQ0Q3LTQ2Q0UtNDAwRC05QzU4LTI5Nzk4NDc5NjYw
RUBsaXZlLmNvbS9ULyN0DQoNCg0KDQo=
