Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF56D98789E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 19:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401E510E0AB;
	Thu, 26 Sep 2024 17:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="ZWmWlTHI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2050.outbound.protection.outlook.com [40.92.103.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3DB10E0AB
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 17:50:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pd7Vhvu0Ugqm1gL+TLjL7S8GizZcM030ZHY/uoSrHfx3qhHxPmtBvWOclG5oCvrS25DU8p8z6XNWnlUi4GgeRLKiztdVnyRVMh79dCumlzvvrm2Dh1PMke/mTV1vCKQ1TdJ7bG13Qv3r/xxbZ4mplU28TpvCP4UxIxfL83FDJhK+0D0wMgyHRz5ol7rMiR5MUTuDEa4eyGDa/CnXGlTqpA58tM1LcFxiZNaq1ONY0StVQmEBwe5VKjqLJQeVz+OEg6OIFY3E5cKiR/Sy0rl9oNtcjrauj7W9HNnL/HNy6I1uOvSU4e5aRXBLNdwERU6Pzg/qDVY1L4AYMY8N6zYZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTg52H2ZDVLAD86iB0qqCGixhuT37hPi0E7dCVdS8Kw=;
 b=SYW0C0I/khP8e/sFT1Hl6/XMBbHE2G5Ps6NNhiW7ImvcOJOId1BspA27yWr3uu97K5j05ivASeQ7gfN/Neo958fSkqV3tb+Drd+RMrxdml7UxxRCMRZTv792E5Xw6zSNcz5NHB5yGaRdADXZJVYzp4rDyWWY4JgCzSkG5ID8FtDc0xT8uTkS3qLskKi0oKEBq6b6vMMcS8+Z78WlDTz2QIOQjLecYpMyrz5/c76bY6SUf0OG4bP4FxyJ/MW7+eyky0L8MhyGCxqmX3CGiiJUwTJjVyI8toH98ynFidvQS5ZbH7U1PjzNbnM6bpQj+gOMY7bRy8Qp4w9JcA9OwXSLPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTg52H2ZDVLAD86iB0qqCGixhuT37hPi0E7dCVdS8Kw=;
 b=ZWmWlTHI82IefMXLtVxNiyS9387MadZ2y0lTcXIFP/WTOrJN4SHi/Di9DhHGLXA/aOdN0lKRyKtCP8avUNksNPJDGWPeECnPzF8v2QYvviIpq2pBdy57C6un4KVOBRzdSOV++tmjGn2ESdsagwXSsoy4FFx2jVlH7q4tRR8qHUX5Grsps0l3C915aVIfm1I2rNksDNSkPTK5o2KrjF5Bj/FKHY890RFebDfU34NCkcl5ufTbMawQu4MzvlVaxcl8EDfQisHyAGBtUxjthwEBrunYA01R1h+AFq4VRwP6fRrW/ctL6n/rPzgEINtT7OQ+cv5MQFXV0MicRJtU5iOWMw==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MA0P287MB1355.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f6::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.27; Thu, 26 Sep 2024 17:50:19 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%6]) with mapi id 15.20.7982.030; Thu, 26 Sep 2024
 17:50:19 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "bentiss@kernel.org" <bentiss@kernel.org>,
 =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?= <thomas@t-8ch.de>, Orlando Chamberlain
 <orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "torvalds@linux-foundation.org"
 <torvalds@linux-foundation.org>
Subject: [WHY SUCH DELAY!] Touch Bar support for T2 Macs
Thread-Topic: [WHY SUCH DELAY!] Touch Bar support for T2 Macs
Thread-Index: AQHbEDyNWJwOefTsdUu7ETvaVQc9og==
Date: Thu, 26 Sep 2024 17:50:19 +0000
Message-ID: <MA0P287MB0217A06CA89D6A7D0631466EB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <MA0P287MB02176175318B96135BE3E320B8902@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
 <nycvar.YFH.7.76.2409111420040.31206@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2409111420040.31206@cbobk.fhfr.pm>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MA0P287MB1355:EE_
x-ms-office365-filtering-correlation-id: 0f2d5be0-b308-49c3-a081-08dcde53afd6
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|8060799006|6072599003|8062599003|7092599003|15080799006|19110799003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: nPJa5rsR3i3FluOKiPuRwyRFNcrqEjALYp1PLybh5+Ixd4RRUN+Anfz7a+XAHX8Z/bKv2jkQr9oQidz08m8rtCTxxSbsldXOS8ASdJgOVtePHqQCT33vYLeno8v4CFuzaSG/CpZA0BIcqKLhSuta3Fmg+Z+BgRA+IGL/6+fkL5xoElsgLN/PQDW8vzhpCmOunrbrBEiSOeXXr/EQnBfe/c0EJxNN+cMpEqx6ve6gpp3WPyUHIuMy5bTuGaPCvc4P+LBbJm4KUdSU4HI8vw9PRaSdDGfXG62pV0VBnohKdo0pU4AZYOzfloBP+SjSrwg1e7Hd4phigGVYf300/zzp/2uhWS4o0rMHy0n5dVAz5g3quRbiOlvhU0MS69fARvBD3WRC9BaLZnbLDwCu3bdtzrUYx0VBnZUphMEvfc60CiEmyB7XrRwBJlvtDo1IXGFBIvRK5io5soI88NBmZqhmyio2tEskVqHzjrjKVUBeWuqJ4/3U05gwI143xWdTr2O11r6uKvvtFFTUyUw96CFDTuM5P2qEWxp2EOyQiUimrPOuweVeAO/gv/oL4tu34DmGDue0wctB2tBWVzQW5efbe434/XrfdJdAL0i2ii+GuH1YIPM3baks623cWb1atM8A6CqOO6c1MqNIuNEhIAvHlP9CwM7EZVwvY7e/9qsJ8vgWHK1o2DyLb75E1kQym9Amq/YbQUx6V3HlQfhvSDlEPuGlgpk2znAcN/EolM+feIpvErKsgaIa4nPUZEDL3Uim1oF5HPlvJx9SU9Pcllz4Xw==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEJsU1JDZkhzN2VlRmhqZmQ2TTZZWkZpOUJiVllaa1RQZE13R29CbkNlaWpx?=
 =?utf-8?B?V0dxSEhMRWo4UlpTaUg2OEcxcWxCTGlkTTVWdFhZVWx1TDFaNmtRV3lzWDB0?=
 =?utf-8?B?ajNlVlkwZ2VZU3plRCtybHd0L3M3enhoRlU0WlZDc0pGcjRNQkw1RjZ3REd6?=
 =?utf-8?B?ZE5HeWcvajdma1loSTFHd2tYbC93L09HQXdvWnVpSGNrenV2RGt6bzF2cHEz?=
 =?utf-8?B?N1FaQ3p1bjlEVWxoRnJ4aFBWekJTVmxhVkF6SnRubCtTS3ZQeFM3V09ocHZv?=
 =?utf-8?B?NmFtN1BISmVCNjM1cnFEajJ2S1Z4bXVNVFFqRUUyZDRkeTYyREpHYXRTRE1M?=
 =?utf-8?B?RkZyaFRWdWNyS2NpVVg4Wno2UjZUWGJQeVRxNkdENDBLTnJ0UXdqQldjSlBO?=
 =?utf-8?B?LzRhbE9ld2kyU2xWaWg3RnpTODA4bWpKL1pXbWkzdTVFWWlYSzJPRjVzUlp6?=
 =?utf-8?B?YlN5THk2NFpqWEJvZjdwYWEzQ2FMczhqU2FwWWVRdEp6djlwS3g2SFE1aWxQ?=
 =?utf-8?B?dHBmVmxrcHNNQ1ordHAwZjU5OGh5OEwzMmZRdWhHN2RwMWRLMWphYTBYMFBK?=
 =?utf-8?B?LzlYTDRpZVBTbmNSdWdaL2tTaFhFSzRwRCtXakxhTU1HZGphYTh6U1gyMWV4?=
 =?utf-8?B?a29mam4rSG5TL0lsRjFmdzVGdEt0TlplMGxZSFlDaDBPNm5HWDBuRHJsbDVp?=
 =?utf-8?B?c2ttUEdWcUd5cm1RTGZyUmNLcTcxYlBzRVJqOHcxdGhOOWgxcm02OWJ1TDd3?=
 =?utf-8?B?Yyt4UndJZVgrWVdZdW1wNENLNnlPRjRDVzBIZDhIVUk5NkRYVWc5Qy9HUFRx?=
 =?utf-8?B?MUdudVRPZWtoc3FoSGE0bmhOQy9nNXdUY09kUVlwN1ViTmVkTEYrRG1sKzZ6?=
 =?utf-8?B?aHBwVlM4TVBRaEJ6REZDNDN2Q3VNanFmNHJqYlFZWVlJcmxpVGRJeGhRajNY?=
 =?utf-8?B?SHlod1Z6NEVhNk9FSUNBS3ZiaU8wZmF0c3I2SHFSQmpkNWRMMmozcDVubHdl?=
 =?utf-8?B?aUQxbHFnTlVWQ3F5K1R6N2hBRWFqM2NScjgzOXhlUVJwUE9wZVFVYmNaaTdH?=
 =?utf-8?B?UzkvMjF2Q0RrWGtBNGVMSDljSFQ2ZndGL09XdFZnOVQvb3lhVHVxSDYwbkpS?=
 =?utf-8?B?eDlhdTBLS3ltZU5qcG5DUndtTDlLZGpMNEpZbWc3dmg1Y2Nsak9DM2lvNDRV?=
 =?utf-8?B?dENXWmFndWFyeEVjSVgwTEtqckhZeW9JcDhidFZqTDk3K3hLN3hsbnVlTGxk?=
 =?utf-8?B?T2hBbTZiYTFoOHBnOVRDclBkTGhkV25xS0pUci9WcnlBR3BLSjRiVmlEdTQy?=
 =?utf-8?B?emc0WW44emxwa2JlWVg3UWZVSUdSQnhyS3hFUWFtaERJZU50YUJiT1hYQ29v?=
 =?utf-8?B?Ujdnb2JvMFFRakpRa0FOdlV6ZEdKSWxjcmlYdGNwbmlmTktsaUVUUVFqTWRk?=
 =?utf-8?B?bHMyMlplanV0SE1hbk9uSjZrNTQ2UkxOa0R1amw3THlTclpFTG00WjJpWGJn?=
 =?utf-8?B?eXpydlN1YTdSTmNGWit5dW9Pam5JZ0RFWHUxNitGVW9zWUJncUJIQlEwbzEy?=
 =?utf-8?B?OVlZbXhVSmZXeUY5aFNCTzdqV2lXSXkxNytqZ1pMWEo4WWVsZ1VSMmJySUdp?=
 =?utf-8?B?aUlKNGNXdWNwNUhMVHNNVTQxcHJweFpIc0RHQzRrSTRIbDh6dkd2SmRocWEz?=
 =?utf-8?B?QmdlNWhiWTBPMkkzdk9oYnhHN0VMMW9MellxcHFKcDJuRG5Mbk9zQTVxeDFn?=
 =?utf-8?Q?Pj7PmJ0kg6R01uzqKU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2d5be0-b308-49c3-a081-08dcde53afd6
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 17:50:19.3319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1355
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

SXQgaGFzIGJlZW4gbW9yZSB0aGFuIGEgbW9udGggc2luY2UgSSd2ZSBzZW50IHRoaXMgcGF0Y2gg
c2V0IGFuZCBJIGhhdmVuJ3QgZ290IGEgY2xlYXIgeWVzIG9yIG5vdCBmb3IgdGhlIHNhbWUuIEkg
dW5kZXJzdGFuZCBtYWludGFpbmVycyBhcmUgYnVzeSBwZW9wbGUsIGJ1dCBJJ2QgcmVhbGx5IGFw
cHJlY2lhdGUgaWYgSSBnZXQgc29tZSByZXNwb25zZSBmb3IgdGhpcyBzZXJpZXMgb2YgcGF0Y2hl
cyBmcm9tIHRoZSBISUQgYW5kIERSTSBtYWludGFpbmVycy4NCg0KVGhhbmtzDQpBZGl0eWENCg0K
PiBPbiAxMSBTZXAgMjAyNCwgYXQgNTo1MeKAr1BNLCBKaXJpIEtvc2luYSA8amlrb3NAa2VybmVs
Lm9yZz4gd3JvdGU6DQo+IA0KPiDvu79PbiBTYXQsIDMxIEF1ZyAyMDI0LCBBZGl0eWEgR2FyZyB3
cm90ZToNCj4gDQo+PiBIaSBNYWludGFpbmVycw0KPj4gDQo+PiBJdCBoYXMgYmVlbiAyIHdlZWtz
IGJ1dCBJIHN0aWxsIGhhdmVuJ3QgcmVjZWl2ZWQgYSBzaW5nbGUgcmVwbHkgb24gdGhpcw0KPj4g
dmVyc2lvbiBvZiB0aGUgcGF0Y2ggc2VyaWVzLiBDb25zaWRlciB0aGlzIGVtYWlsIGFzIGEgZnJp
ZW5kbHkgcmVtaW5kZXIuDQo+IA0KPiBJIHRoaW5rIGl0IG1ha2VzIG1vc3Qgc2Vuc2UgdG8gdGFr
ZSB0aGlzIHdob2xlIHNldCB0aHJvdWdoIGhpZC5naXQsIGJ1dA0KPiBmb3IgdGhhdCwgSSdkIGxp
a2UgdG8gZ2V0IEFja2VkLWJ5L1Jldmlld2VkLWJ5IGZvciBwYXRjaGVzIDkgYW5kIDEwIChkcm0N
Cj4gYml0cykuDQo+IA0KPiBEYXZlLCBEYW5pZWwsIC4uID8NCj4gDQo+IFRoYW5rcywNCj4gDQo+
IC0tDQo+IEppcmkgS29zaW5hDQo+IFNVU0UgTGFicw0KPiANCg==
