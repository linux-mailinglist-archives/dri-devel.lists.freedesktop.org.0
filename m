Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EE9988941
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 18:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E34810E21B;
	Fri, 27 Sep 2024 16:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="nPdq4eot";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2077.outbound.protection.outlook.com [40.92.102.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F267410E21B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 16:42:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5cmOMHJ73gVbKEB7gJgzbN01Zw8HgyjWiiswTRfWLgaOaDeO5OofpPmibXzfKpiEkZ2zPDh8pl25JmhOZwJxZfMF5AFg2c+AiqRQuXAkOrC17qQS8whJAEoT5woMPArkcrFPH8vQkhR4k6JiHpH2OWWsfCdf9LDK95oahWD5l3vCAsudT7osi9aKDweJBxQ8PV8nIVokZOJa08OIO6siUKRkLxhVSnxpcXfTUIp/fBStioz9qxjwV1kVB1xB4e08t4J9P8k6oGAZAcNLQX13VS47JN6aUnNtWXapEsMOI6PYylIr3w/X/dRDg6dg9jAbPcS8r7V3BwHwhwuwAFf9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28apeU+TSJpEAGyA8QUQI4to8miA0OD9fnuYFJv02RY=;
 b=MzcNgz7G1IEw/ThXFPZhCYMBroCNtqOBSXCLPfweRr476Lm2ICiHelqfK5tti5D+inUypwoyuMe5beW2DL3GKYR9/SDZsKJRjkuzcWhC8+4U1Mk3njD4wTPRYmqtOT4lu8CI6YRXUaoKbhHzWPGicapWz3rqFC//nXK23Rysk4rL32n3ONYA3txBm6jtbxfo4/JVkGhYD6lSIKI4if/abWVGmUCcixqai8yu8CT5wjzElBTqZS2dMoNCD4eNc913TIGgfCM+lR/MYZuyvyEbS2aKnhkalk2TdXc5zxU1YEdHvFfCcc6pp5JY11EUk7BqcwsDvVGS1svoLpbm8Iudzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28apeU+TSJpEAGyA8QUQI4to8miA0OD9fnuYFJv02RY=;
 b=nPdq4eotwbSzvh0kLzwKJVULIFHSI4QEnlvPnDzpKQlMpiWwnqb29LJLBsIJ/d+59z+mG6cOTG0s4vF4uW6Ukb3uaJSbFY7s4m22xPAO/ae0DqaEe1eoxLLz2jlwQGnGP/k/YAfiy3XIvxoP0hMz6E72+UhKCuAw5VEIAEUmkoQ+E2UVE9ukUxxCHvDZLm0vEDjNUGem7XcRUPk7RQdcc/jI23NVT0E71ZIlYwFtPUMpZ9CLifRPrDo3ZpqXSQJhoYd8gDhYcqkDpRt6Nk42IP7ol2b0WCwb/A8qSkO19YGofYVacinfSWjMJbGzw/QFxH8Y83TQ9rgu4tUtJzGOHQ==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN3P287MB0386.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d7::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.22; Fri, 27 Sep 2024 16:42:47 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%6]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 16:42:47 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Benjamin Tissoires <bentiss@kernel.org>
CC: Jiri Kosina <jikos@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?=
 <thomas@t-8ch.de>, Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem
 Karabay <kekrby@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "torvalds@linux-foundation.org"
 <torvalds@linux-foundation.org>
Subject: Re: [WHY SUCH DELAY!] Touch Bar support for T2 Macs
Thread-Topic: [WHY SUCH DELAY!] Touch Bar support for T2 Macs
Thread-Index: AQHbEDyNWJwOefTsdUu7ETvaVQc9orJrwcUAgAAWOQA=
Date: Fri, 27 Sep 2024 16:42:47 +0000
Message-ID: <C240DF45-04E3-4E5B-A03F-890027A8EA21@live.com>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <MA0P287MB02176175318B96135BE3E320B8902@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
 <nycvar.YFH.7.76.2409111420040.31206@cbobk.fhfr.pm>
 <MA0P287MB0217A06CA89D6A7D0631466EB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
 <dsby3ndmnqpxnqh5eykhdcodrlabdtry4j37ywaz2xv4ghtyao@m42xdqx2iujj>
In-Reply-To: <dsby3ndmnqpxnqh5eykhdcodrlabdtry4j37ywaz2xv4ghtyao@m42xdqx2iujj>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN3P287MB0386:EE_
x-ms-office365-filtering-correlation-id: db44a8d2-6a63-402a-e356-08dcdf136af6
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|7092599003|8060799006|8062599003|461199028|19110799003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info: MrzJhbGtzSYQB4SypLZHVLRuqOhRlT7/DiBokpysFZ+GzAJSTtkep7jNkVDW8xHjYMvuG0GZKtXKKHmw+71dDW9T7U1JA8SZhdM7xItd13pVmBGxNo4BwdqU+civKGxGtYsiYpV94woDljBQwwPoUgD9IBJjAhyqyf/svHlnLNj+Z674c4XEfvDS3+lHp+5SvHbcS3m2ggkG2MBizWOvPTE60yUFTuK9GbvH15NL0SYHFDpeWEaGJf19d7yXZlgjj9rbEIFOzsGfRm4xD+8CF10ldIvCcnWpSYU/n+G5bElGdIFGmz5RR4v4Nnd5Ax93A5blCU3AJHY06cdettGFPJM4V9R/ZemVuyYjQJA5pUjQGvYPgEvRMd9NIkGuekrXdf05aXGQhQp2wvoivMBmtd329ZPpVEEPnmIh73MdDWTHog/AoxyyGPGekblYEqVH7glk/7tLmKSqTRDK83cnLk3DWV554xs2Kc8WyQeUlk6HpqN8DHCqV5UUNZqjlhpecdbjdbtDeFCB37YQBP9pB0eCSokM29iNoYz3g5izDqtw95iebXE40Q/352688IxhLnDeWjW8JlFOL0DtocVFVzoch0UWxMsO4QbLgiTf33KYm7s7Eid9aLXWkA2dY3cH3W6L6zY/eTilRreq5emExfUU4WHxEgaqmgwElEIlEDikdwaekcQCd0MhKsZrRRExhK8JJZTS3lE4cvoSH5SGHUVup/2FR1ar1BMKV+W3P6E=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFFtVkZnNVJzNXRzRjZpRHQ2RWJ5cXo3UktiWk5ndkhyazBQYlVoU0JvWFhm?=
 =?utf-8?B?KzdFSDVITUR6UUxITHUyL2ZxZE8zYVR6ZUkraEQrcDgvcjk3S1Vxa0Q5UlN2?=
 =?utf-8?B?QXJvaDNIWTBsT0lqdlBaanR0a250c3lBL0NLaUlxdUZHM0NFditrSnFJNm5n?=
 =?utf-8?B?WmtINVE2bFVHalRzeUdWckJjTVlaeDVDbkRMTzBRM3AyN2k2WkJBeDZhNElt?=
 =?utf-8?B?UFBFQjdMMVdzUUQydmh2SE5LeUQ0T3JnQUFrZ2NsM0k0c1RXdmthYnhHYW0r?=
 =?utf-8?B?bE0ya3EvbzBmd1d6R01NL2pBK3I0VDlRU3NJMGNycGRVUGNqekVMOEdDVVdK?=
 =?utf-8?B?VzZpdFZNK1VQVGJIZ3RjejdiTjRLSElaK3F1TzNRYkh0cFp2dlErS0tYb0N2?=
 =?utf-8?B?M21ua01HS1MzazZDT3FiNWxYTW9aTXpvdmcxMEpJY25QaHo1NDNDZWhqRldj?=
 =?utf-8?B?eUc2UFZGUzJKWjVDdnYyOGRLVzBGZnJIOGkzY3pqYnhRSWpwNTdHdTRrVit0?=
 =?utf-8?B?cUNrZmlQSWZ1cGFqaGN4YVhZdWFmeWlMemRLMldDTFJyVE1lZUxZNXBVWkFV?=
 =?utf-8?B?ODh2Tzh4TjYxYXRSdmRHWVh2eWFCRGpEenE0eFgvWHFQZElpWmh2UU1aZUFP?=
 =?utf-8?B?V1VWMkdIcDdYajh5SjB5K0F6eWNkRFhoeXNPREVGTHpVZGt2WkhKSUhOdDdE?=
 =?utf-8?B?M3pzM1JxQW0vRkxKbzlNbGVnQlNiak1Mc0lEOGZMN3h1ZFBubzdCTENrSTE4?=
 =?utf-8?B?LzlYQWJ0SDMyWW1JTmdCQTkzeHViWjYvQ3EwdElVRDdCOENaWWVoQWVhYnZr?=
 =?utf-8?B?L281bWoxVnJZRm1qSDJHZXhvQUU4c01lbnplbXMxY0c0WndaN3d6U2p0Sm5i?=
 =?utf-8?B?N3FNMVEzRTk1dXdTdStvTUYvbm5YM09ZenlTNnNZTHRDZWRHRk43NDQ2bGpI?=
 =?utf-8?B?Zk1LcUtGZURzRTJFeVhFb25tRW9FL2JxaFJEVmU0R1Ivdm9GZFg1bERNRHE5?=
 =?utf-8?B?ZDNsdi9SWXB0d1NYSThsWGRWVHV2Q1NVbytMaWZSMXFwTC9nRlZLWndRVjhV?=
 =?utf-8?B?U0FXZThtRm1PTDc1RXJ2M0tIZFN0Yk1XTEc5U1F2c0xkdWIxUG9SNkhLVmVi?=
 =?utf-8?B?S1dpOWRsR0lkdjFFNkF6Umt6aDVURmhPZ1NSZVVlblQ1cjhCZ2JHVnhiVmUv?=
 =?utf-8?B?NlJ2OVI1RDR3VEsxaEhCV2JubjNMUnJDUEJJeDQ3K1FRK21OSWhEcUhKOGJz?=
 =?utf-8?B?Nko3NlorVkQ5UzVBcC9GZnFwa252RGQ4N28yTlBzakFFMWlrenRzSWVkNVh0?=
 =?utf-8?B?bUwzODBtM0ZEWEt1RWUrNmFEbEdWbDRvNUJSY2llcXdqSzNlZEZqUW9yMlVy?=
 =?utf-8?B?ME1ISE1QNnllakMvc2tuUEVhMk8wdDBoTlpJNlN6VEhpQzREV0FpOGo0Ti9J?=
 =?utf-8?B?ZU5xL1ZoMStjN2ZoUjRhTHVyY3B5dnErRURkNkdpRjJ1SWVXVk5hTWxUenNU?=
 =?utf-8?B?OVRxa2V0clA2Y1h2d0lRZ1VTaEhtZVVDaXBoZmFNQ0hhYkFCWWgzZFRPVW1G?=
 =?utf-8?B?bm5pZXl6VVVwMUcvT2VYNWt1YklFVVRsTldrRk9aL2JaVkczRVhNVXhXa0Fo?=
 =?utf-8?B?ZmN3aUxrV1Z6VmkzV3VWVVBNUWs0RkZtRTdLRHNSMGIzaVQycmxOZjB4algw?=
 =?utf-8?B?VVpBMUpDUitnYll6TFlmOVJvZ0g5bzBZRjBWT1h1aGpublY4S1E1aFlTdjhy?=
 =?utf-8?Q?UOglL/YdnRTttEHzynjhM5gerMY31k1QL0q3+TV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5EF680DC4DFF3B428E351375106C6CF0@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: db44a8d2-6a63-402a-e356-08dcdf136af6
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 16:42:47.1169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0386
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

SGkgQmVuamFtaW4NCg0KSeKAmXZlIG5vdGljZWQgdGhlIERSTSBmb2xrcyBhbHNvIGhhdmUgcmVx
dWVzdGVkIGEgbG90IG9mIGNoYW5nZXMgaW4gdGhlIGRybSBiaXQuDQoNCkkgcmVhbGx5IGFwcHJl
Y2lhdGUgdGhhdCBmaW5hbGx5IHdlIGdvdCBzb21lIHJldmlldyBvbiB0aGUgcGF0Y2hlcywgaXJy
ZXNwZWN0aXZlIG9mIHdoZXRoZXIgaXQgd2FzIGFjY2VwdGFuY2UvcmVqZWN0aW9uL2NoYW5nZS4N
Cg0KQW55d2F5cywgc2luY2UgdGhlIGhpZC1tdWx0aXRvdWNoIGNoYW5nZXMgYXJlIG5lZWRlZCBv
bmx5IGZvciB0aGUgRFJNIGRyaXZlciwgSeKAmWxsIGZvciB0aGUgdGltZSBiZWluZyBmaXggdXAg
dGhlIGJhc2ljIFRvdWNoIEJhciBtb2RlIGRyaXZlciBmb3IgdXBzdHJlYW0uIExldOKAmXMgZ2V0
IGl0IGRvbmUgZmlyc3QsIGFuZCBhdCBsZWFzdCBtYWtlIHRoZSB1cHN0cmVhbSBrZXJuZWxzIGJl
IGFibGUgdG8gYXQgbGVhc3QgdXNlIHRoZSBUb3VjaCBCYXIsIGV2ZW4gaWYgaXQgaXMgaW4gYmFz
aWMgbW9kZS4gSeKAmWxsIGZpZ3VyZSBvdXQgdGhlIG90aGVyIG1hY09TIG1vZGUgZHJpdmVyIGxh
dGVyLCBhbmQgd2lsbCBzZW5kIGl0IHNvbWUgdGltZSBsYXRlciB0aGVuLg0KDQo+IE9uIDI3IFNl
cCAyMDI0LCBhdCA4OjUy4oCvUE0sIEJlbmphbWluIFRpc3NvaXJlcyA8YmVudGlzc0BrZXJuZWwu
b3JnPiB3cm90ZToNCj4gDQo+IE9uIFNlcCAyNiAyMDI0LCBBZGl0eWEgR2FyZyB3cm90ZToNCj4+
IEl0IGhhcyBiZWVuIG1vcmUgdGhhbiBhIG1vbnRoIHNpbmNlIEkndmUgc2VudCB0aGlzIHBhdGNo
IHNldCBhbmQgSSBoYXZlbid0IGdvdCBhIGNsZWFyIHllcyBvciBub3QgZm9yIHRoZSBzYW1lLiBJ
IHVuZGVyc3RhbmQgbWFpbnRhaW5lcnMgYXJlIGJ1c3kgcGVvcGxlLCBidXQgSSdkIHJlYWxseSBh
cHByZWNpYXRlIGlmIEkgZ2V0IHNvbWUgcmVzcG9uc2UgZm9yIHRoaXMgc2VyaWVzIG9mIHBhdGNo
ZXMgZnJvbSB0aGUgSElEIGFuZCBEUk0gbWFpbnRhaW5lcnMuDQo+IA0KPiBQbGVhc2UgbG9vayBh
dCB0aGUgdGltZS4gWW91IHNlbnQgdGhpcyBhIG1vbnRoIGFnbywgd2hpbGUgdjYuMTEtcmM0IHdh
cw0KPiBvdXQgdGhlIG5leHQgZGF5Lg0KPiANCj4gSSB3YXMgcGVyc29uYWxseSB0YWtpbmcgdGlt
ZSBvZmYgYW5kIGNhbWUgYmFjayBhdCB0aGUgZW5kIG9mIEF1Z3VzdA0KPiAocm91Z2hseSBhdCBy
YzYpLg0KPiBUaGlzIGlzIHRoZW4gYSBwcm9ibGVtYXRpYyB0aW1lIHRvIG1lcmdlIG5ldyBkcml2
ZXJzIGJlY2F1c2UgdGhleSB3b24ndA0KPiBoYXZlIGVub3VnaCB0aW1lIHRvIGJlIGluIGxpbnV4
LW5leHQgYmVmb3JlIHRoZXkgYXJlIHNlbnQgdG8gTGludXMuDQo+IA0KPiBBbHNvIHNvbWUgc3Vi
c3lzdGVtIGFyZSBtb3JlIHN0cmljdCBpbiB0ZXJtIG9mIHdoYXQgY2FuIGdvIGluIGFuZCB3aGVu
LA0KPiBhbmQgSUlSQyBkcm0gaGFkIGJlZW4gc3RyaWN0IHJlZ2FyZGluZyB0aGF0IGJlY2F1c2Ug
aXQgaXMgaGVhdmlseSBtYWtpbmcNCj4gdXNlIG9mIHN1Yi1zdWJzeXN0ZW1zLCBhbmQgdGhleSBu
ZWVkIHRpbWUgdG8gcHV0IGJhY2sgZXZlcnl0aGluZw0KPiB0b2dldGhlciBmb3Igc2VuZGluZyBp
dCB0byBMaW51cy4NCj4gDQo+IFRoZW4sIHdoZW4gLXJjNyBpcyBvdXQsIEkgYmV0IG5vIG1haW50
YWluZXJzIHdpbGwgdGFrZSBuZXcgZHJpdmVycyBmb3INCj4gdGhlIG5leHQgMyB3ZWVrczoNCj4g
LSB0aGUgZmluYWwgdmVyc2lvbiB3aWxsIGJlIG91dCB0aGUgbmV4dCB3ZWVrLCBtZWFuaW5nIG5v
dCBlbm91Z2ggdGltZQ0KPiB0byB0ZXN0IGluIGxpbnV4LW5leHQNCj4gLSB3aGlsZSB0aGUgbWVy
Z2Ugd2luZG93IGlzIG9wZW5lZCwgd2UgYXJlIG5vdCBhbGxvd2VkIHRvIHRha2UgYW55IE4rMQ0K
PiBtYXRlcmlhbCwgb3IgdGhpcyB3aWxsIGJyZWFrIGV2ZXJ5Ym9keSB0ZXN0aW5nIHN5c3RlbS4N
Cj4gDQo+IE1lcmdlIHdpbmRvdyBpcyBjbG9zaW5nIHRoaXMgU3VuZGF5LCBidXQgSSByZWFsaXpl
ZCB0aGF0IHRoZXJlIHdhcyBhDQo+IHJlZ3Jlc3Npb24gaW4gSElELUJQRiB3aGljaCBicmVha3Mg
dGhlIENJLCBzbyBhdCB0aGUgZWFybGllc3QgeW91ciBuZXcNCj4gZHJpdmVycyB3aWxsIGJlIHRh
a2VuIGF0IHRoZSBlbmQgb2YgbmV4dCB3ZWVrLg0KPiANCj4gU28geWVhaCwgSSB1bmRlcnN0YW5k
IGl0IGNhbiBiZSBmcnVzdHJhdGluZyBzb21laG93LCBidXQgcGxlYXNlIGF2b2lkDQo+IGFsbCBj
YXBzIGluIHlvdXIgc3ViamVjdCBwcmVmaXgsIHRoaXMgcmVhbGx5IHB1dCBvdGhlciBwZW9wbGUg
b24gdGhlaXINCj4gbmVydmVzIGZvciBub3RoaW5nLg0KDQpGb3IgdGhlIGFib3ZlLCBJIHVuZGVy
c3RhbmQgYW5kIHdhcyB3ZWxsIGF3YXJlIG9mIHRoZSByYzYvNyBtZXJnZSB3aW5kb3dzIGR1cmlu
ZyB0aG9zZSBkYXlzLCBhbmQgdGhhdCB3YXMgdGhlIHJlYXNvbiBJIHdhcyB3YWl0aW5nIHF1aXRl
IHBhdGllbnRseS4NCg0KVGFsa2luZyBhYm91dCBjYXBzIGluIHRoZSBzdWJqZWN0LCBJIGFwb2xv
Z2lzZSBmb3IgdGhhdCwgbXkgaW50ZW50aW9uIHdhcyBkZWZpbml0ZWx5IG5vdCB0byAicHV0IG90
aGVyIHBlb3BsZSBvbiB0aGVpciBuZXJ2ZXMgZm9yIG5vdGhpbmcu4oCdDQoNCkNoZWVycw0KDQpB
ZGl0eWENCg0K
