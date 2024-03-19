Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A02487FA0D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59F510F7E5;
	Tue, 19 Mar 2024 08:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=armchina.partner.onmschina.cn header.i=@armchina.partner.onmschina.cn header.b="RE/f/0ip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 879 seconds by postgrey-1.36 at gabe;
 Tue, 19 Mar 2024 08:33:47 UTC
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2108.outbound.protection.partner.outlook.cn
 [139.219.146.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E6B10F215
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:33:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLUnakhjJvZaCdthmabAajbMMo75B6V/yrWlTenQy9dSH/7qFj7quM6zUNF7iP+FZC5iJVmeJ9X6nrT0qdhOjdYilKLOAeCoqsYRL2aSB8/sky4uvP2u3NXUYzzG5undUTo1KLYAZuuIIniOujh+HhfkTJ3f6kse1NUpqczrEl7H7lPU5qCjAYD90vSv+u+wdFtyTOV9O1Qh2ab3jC3lflZ7AVNOfPzZhHF6fJxcvfq7UOhNkXCPJl6+WY54GCmvJk7PIsgTWmWQvBTm/DdJJjlmXz70T/TpewJq0sOIkLSjDtOqNTj67RYlqyvQ15DN9WyIe8dca/f9zVcu/9/IpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrUBb9iAVqaTJqiikayvX2GoOjsQ9gtxPLApzZTU774=;
 b=B3Um/bR6YsMoC3uHhgE7TYdu59E3oS2/HLrUnqU6lL+QGazG8pUUzW1RNxzGY1xD+1jbs6XuaU4DqpQtoMJQK2ylr5ns97w9DqKQAvD+ehxpfWEeU1gWhzT9wDm7xZX8fSA3L6hZNyJs+TILOKmxjrXkol4q3gzO1lRYK1gNLoIbfTiWNJyCskXKANnOR+M7E5nON48jZPm9aHelIllcf06ScNKKkeZevtiyRr4qPNDSYSCbMnozZH4YXDHjHaWECHka2P1FFI2eiH7JTxD8Jo5pGodoRNiBCH3N01ij7TcdbbbTOg3MGE9y1EfEMRFm5DwvKqftF6dmhJvzbB6gpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=armchina.com; dmarc=pass action=none header.from=armchina.com;
 dkim=pass header.d=armchina.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armchina.partner.onmschina.cn; s=selector1-armchina-partner-onmschina-cn;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrUBb9iAVqaTJqiikayvX2GoOjsQ9gtxPLApzZTU774=;
 b=RE/f/0ip/gFveRkIhH14LVMLGaAtuPpIerUdV4ShKu4OW6nnTlEJC4O/5qY3KvyzaEnT4hqb4kE97f9jThkJbXW3PQJs7Ji+rie2azLgTMRth++hpbUkjqP6ie54U2r4usAgP7RdMn4VY3kbFOH1JbpskeKuiXuXWAkdun045aM=
Received: from SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:8::10) by SH0PR01MB0843.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:23::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Tue, 19 Mar
 2024 08:19:03 +0000
Received: from SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn
 ([fe80::1a44:1b7f:12fa:5e48]) by
 SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn ([fe80::1a44:1b7f:12fa:5e48%6])
 with mapi id 15.20.7386.025; Tue, 19 Mar 2024 08:19:03 +0000
From: Dejia Shang <Dejia.Shang@armchina.com>
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: about ArmChina NPU driver upstream
Thread-Topic: about ArmChina NPU driver upstream
Thread-Index: Adp5p57a2nqET1MrR1y+1BST6QcWEAAJ2T2AAAFAe5A=
Date: Tue, 19 Mar 2024 08:19:03 +0000
Message-ID: <SH0PR01MB063448F71236DE2A83BD982D982CA@SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn>
References: <SH0PR01MB0634AAAC389CC3947E8E9982982CA@SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn>
 <61815c66-2252-43ba-a7ac-7dfc63fe9ba0@app.fastmail.com>
In-Reply-To: <61815c66-2252-43ba-a7ac-7dfc63fe9ba0@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=armchina.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0634:EE_|SH0PR01MB0843:EE_
x-ms-office365-filtering-correlation-id: 950816f8-995c-47d4-0f96-08dc47ed3cec
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YXdH0BnYTtN4gsRzV9nvhwwcfM4Kg350nq4MZFDxYLiYohNwWLzkwJgSqOSMsCgxLfRwLHWlb2mp5IIurn/GHlbiijPyLXKj5ldliOeA5b8SFhljcDDgocXgHsO0Sk+LqUfFyr0l6s7w8uwy54TTO+erPTth7obVWAijSqN6mO4Y5KlQZcd46XuLbVx2FhJ1Xe9u8pv7gPfuVp2PPBEskeMFHuFQrA2oL9pMkpoPZum54qxfH+9NLTgNdTxd58HFO5XXj13HSIwNne8Pao+UxBJojjE950Qk6S8XOx1RCJAYxA39sTEi1Z1DaNZj/eolbxcumWqi+HZUWUAq7VVw677sp0Fjnc+yQwtGnbKcoefo0Bqax9uLB+AhGO9yH9E5W4jVHLqqhZqh1zYRkv1BbAsWK1Eu2Zm1SkcBikVlIU2g6mc/W64u3mkASF5iwNWkFJXZNdyYRbUK1K1ZB8fNMzgXeGEbu6iJi5D/aDCVTtavtRkemoURsDw3tgYIooz+K9icmMWNZcXQ3L0wnygk9zWNJv6+hRYFYmeVqOSCA27f+boiDQd5GCNkpTfCFjX67f+y3iuZ9D3kBtPggiR/D985BySbKq1PzVcESO2qI9uIz1xQXHbqT4qC5t/KtIG6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE; SFS:(13230031)(1800799015)(366007)(41320700004)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTBSMWdiNnpmVTN4ZGRhRVpHWWErcGo5UlZRWVZKdzRpRktDWTVxaDU0SnN6?=
 =?utf-8?B?c05mMmF4V1NZZ3JnaDc4NHBrSC9GWi9WR1NZRE02akl3WlphcTRYbWJxd29P?=
 =?utf-8?B?QnpCQXBWUGVPUUhjUUtzKzBoWVV3K1FYRU9xSzkwbTlTbklCcG1IZlZibi82?=
 =?utf-8?B?ZVdIYlZpbXgreFNyeUlQdmt1WUhQdkRESUNEUzE2cVNQMUVkYTJ5N3k4SDJt?=
 =?utf-8?B?VVhPZmRITVRIUFZ6MUVzL0JrMlpYSHZVRWZFV001UDJnTFREcGhZMWcvYnU0?=
 =?utf-8?B?VmEzdFJsbFpzc1VoZTlqa0d0U256TDFwdG1naE4zamM1VjNlakxPZU4wSjhZ?=
 =?utf-8?B?WXpnWG9ESjBKN0FIMHpSM3RkWnB6cHIwYldidjh5K216QVpCS2UycUd2dTlu?=
 =?utf-8?B?R1poRGh5VHhiQndaU2FnYjllMHcwVndCbFIyRUdOWFZqOERaVVlwVTI4NnVq?=
 =?utf-8?B?NEllUnpNSWlFZTRzcWZKN2VVc3ZlUzh0MWdrVUE5eU9oc3liNHc1aVBmVnc4?=
 =?utf-8?B?dW43YmRha3RWNW9ibUIrVCtRRUtNNEh2Slo5UjJCN1kvbFNOL0ptQzNMOWdF?=
 =?utf-8?B?Q3R1MW43T3BFb0xmSm0yaXNxQXFTalFsajI1ckdNRzJtWDNGb3d0bDlYWGFS?=
 =?utf-8?B?MEViSWZsamdWcmZET3J0c0pNMXpqTnkyVUZMbk1QSzRZclNlKzhBY2didTI2?=
 =?utf-8?B?RUlJY0k1bGVxWDdmeTV2b2dzR2NFZXNHM3JGbDRjWStsNkZkWVl1bTJPanpt?=
 =?utf-8?B?a25FNFVkTXBMdjZLK2ZDeGRQaE5yTzBvUjBLaUVTQmdMNWVFUkVxTWNSRHVw?=
 =?utf-8?B?aWczSmlPVlBJTjhlM2NmODBiaE5tSDVIV0tBNEFuZUdnOEV1US9LYTlHV3Jh?=
 =?utf-8?B?c2ZGdGc2c2xhSGhOVm5iSTV0Mm8rbElncmJOUVFMOVpaOEg3N3E4Zys0R1h3?=
 =?utf-8?B?amdsRHhCYVhPcGNLY0kxMksvL2VVZExVbHA3Tkh0ZnFoeXlTdi9ySWVBTEpG?=
 =?utf-8?B?Z0J4aXgrWmZoU0xTMW1JSWMxNjR3TTR2cFd1YUFMalNLYlJuNVB4S2ZEUWlH?=
 =?utf-8?B?YW82SjhKY2RseTJiMmFCMXIzYkcyUlp4KzMrcGFHS21BYmFQcnZPVWdVZjZD?=
 =?utf-8?B?cmVTYUN6R0pNQm5nbEM3MFg3K2V6bUZrMnR5WG5TS1pUTzB1ZVpVeHlFeXcv?=
 =?utf-8?B?YzVJM21GbFdEMktpOGlXSFVEV3h4L2VLOU9PRFl6YkorZzBoOVhHSzNIRThz?=
 =?utf-8?B?VmZSbGFObE5RYlpsb24wYmUxazBOcGd2aEU4M1VOTHZVOXRMNU82dkRkdCtw?=
 =?utf-8?B?NzNwQnpsbFZlMHRVNjlJSmRKelVIVEhqajh0SkxlWlBkRlNBV1BvM2U5amY1?=
 =?utf-8?B?TW0yQzFpTHd2ckNVc0lZVDRhS3Ivci91cWljampkL0lqdjZrN1VtVGxUQ1Az?=
 =?utf-8?B?bVFvdzFTSkFVRjhidlIvYlc5WHNveWVIM0UrZGdlNGtQTHdDNU9mQzBDc3JR?=
 =?utf-8?B?YmsvbWVyUHpOMGd5YmkreXA4MVFaNzZLWmhRRGNQVHFaYjNuOS9yMjBTNlUv?=
 =?utf-8?B?d1hMZGlOVVFZamtSc2R5Q0lVSmlMbnhXTGphN0tnNHF4UUVEZGRhdVhNdytM?=
 =?utf-8?B?T1ZCMlNXYWUwVTZHUUtneWxZb2ljcFRtL0syMHdYQWhsVk9vd0x6aEZaWThW?=
 =?utf-8?B?Yld4cmhPVDZrcHdLdytpRUI5K0lkSTNCaTMxZTVCZnJJUkxheXhZekE3cG4y?=
 =?utf-8?B?dC96K3pxQkdMaWltUWYzZWhNK2xTSjYwcUFsTHFTMk4zbEEvLzhBNldWVkZY?=
 =?utf-8?B?d3NzVDBSaTZkTXhqZy90aUlVdUFkQW1UZk5YSStMU1I2cHkzZTh6SHhST2xU?=
 =?utf-8?B?R0F3YVV5cU1kQzg5aERFbUhuZzdoZWc2LzN0RGx4U24rc0NBQmdLZkFzSDRB?=
 =?utf-8?B?TUwwRzN4TjMrUXQ5WXFnNUxvc1dvNFltRHRJVlJMRG5KYWxIQ2tQeVUzYnVB?=
 =?utf-8?B?RTlhRWxWOU91TTY5d3lxWTNPUnFORDFPSnhhK3N5ZDZmblliQmpvK1ZuOHRj?=
 =?utf-8?B?dUxueGZGSDhhblVkMDYrZWFRK0p2RERrKzNMMmZaS25waXc4SmxmQjVBMm9X?=
 =?utf-8?Q?rApuJep9dxvvh+WGer92TaFWZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: armchina.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 950816f8-995c-47d4-0f96-08dc47ed3cec
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 08:19:03.4131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 58b271af-432f-4dad-9dee-571f404bc6a0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DPJFXp7g7bC4IGq+nKU1ElIn0NPuNhR3EJ+799VtuSGWv8sChKyIop+grkLXJ9Y718pMuWJV6X5XOaG/lVCqfMIblVZpQUlHX8zdkaOWcs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0843
X-Mailman-Approved-At: Tue, 19 Mar 2024 08:39:13 +0000
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5k
QGFybmRiLmRlPg0KPiBTZW50OiAyMDI05bm0M+aciDE55pelIDE1OjI4DQo+IFRvOiBEZWppYSBT
aGFuZyA8RGVqaWEuU2hhbmdAYXJtY2hpbmEuY29tPjsgR3JlZyBLcm9haC1IYXJ0bWFuDQo+IDxn
cmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU3ViamVjdDogUmU6IGFib3V0IEFybUNoaW5h
IE5QVSBkcml2ZXIgdXBzdHJlYW0NCj4NCj4gT24gVHVlLCBNYXIgMTksIDIwMjQsIGF0IDA1OjA5
LCBEZWppYSBTaGFuZyB3cm90ZToNCj4gPiBEZWFyIEtlcm5lbCBNYWludGFpbmVycywNCj4gPg0K
PiA+IEkgYW0gYSBkcml2ZXIgZGV2ZWxvcGVyIGFuZCBwbGFuIHRvIHVwc3RyZWFtIHRoZSBBcm1D
aGluYSBOUFUgZHJpdmVyIHRvDQo+IGtlcm5lbC4NCj4NCj4gR3JlYXQhDQo+DQo+ID4gSSB0aGlu
ayBjaGFyLW1pc2MgaXMgc3VpdGFibGUgZm9yIHVwc3RyZWFtaW5nLiBIb3dldmVyLCBJIGFsc28g
ZmluZCBhbg0KPiA+IGFjY2VsZXJhdG9yIHN1YnN5c3RlbSBmb3IgQUkvTUwgY29tcHV0aW5nIGRl
dmljZXMgKGRyaXZlcnMvYWNjZWwvKS4NCj4gPiBTby4uLndoaWNoIG9uZSBzaG91bGQgSSBjaG9v
c2U/DQo+DQo+IE5ldyBkcml2ZXJzIHNob3VsZCBiZSBpbiBkcml2ZXJzL2FjY2VsLw0KDQpPSy4N
Cg0KPiA+IEluIGZhY3QsIDIgeWVhcnMgYWdvLCBJIHN1Ym1pdHRlZCBhIHBhdGNoIHNlcmllcyBv
ZiB0aGlzIGRyaXZlciB0bw0KPiA+IGNoYXItbWlzYw0KPiA+DQo+IChodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1hcm0ta2VybmVsL1libklZSnVmNklhMjk3SGVAa3JvYWguY29tL1QvIw0K
PiBtMzZjNjJmYTVhMThmMTIzNjhiMzNjYTVkNjFhMjEwZmQ4NGYwZTc2MikuDQo+ID4gTm93LCBp
biB0aGUgbmV3IHZlcnNpb24sIEkgZml4IHNvbWUgYnVncywgYWRkIHN1cHBvcnRzIHRvIG5ldyBO
UFUgaC93DQo+ID4gYXJjaGl0ZWN0dXJlcywgYW5kIGZpeCB0aGUgaXNzdWVzIFJvYiBIZXJyaW5n
IGNvbW1lbnRlZCBpbiBkdC1iaW5kaW5ncy4NCj4NCj4gU291bmRzIGdvb2QuIEFzIGFueSBuZXcg
ZHJpdmVyLCBpdCB3aWxsIGxpa2VseSBoYXZlIHRvIGdvIHRocm91Z2ggYXQgbGVhc3QgYQ0KPiBj
b3VwbGUgb2YgcmV2aXNpb25zLCBzbyBtYWtlIHN1cmUgdG8gcG9zdCBuZXcgcmV2aXNpb25zIGFm
dGVyIGFkZHJlc3NpbmcgdGhlDQo+IGNvbW1lbnRzIHlvdSBnZXQuIFBsZWFzZSBhbHNvIGtlZXAg
dGhlIHJlbGV2YW50IG1haWxpbmcgbGlzdHMgKGxpbnV4LWtlcm5lbCwNCj4gZHJpLWRldmVsLCBs
aW51eC1hcm0ta2VybmVsKSBvbiBDYyB3aGVuIGRpc2N1c3NpbmcgdGhpcyBpbiB0aGUgZnV0dXJl
Lg0KPg0KPiAgICAgQXJuZA0KDQpUaGFua3MgZm9yIHlvdXIga2luZCByZXBseSBhbmQgcmVtaW5k
ZXIhIEkgd2lsbCBDYyB0aG9zZSBsaXN0cyBpbiB0aGUgZnV0dXJlfg0KDQpEZWppYQ0KSU1QT1JU
QU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50
cyBtYXkgYmUgcHJpdmlsZWdlZCBhbmQgY29uZmlkZW50aWFsLiBJZiB5b3UgYXJlIG5vdCB0aGUg
aW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgZGVsZXRlIHRoZSBlbWFpbCBpbW1lZGlhdGVseS4g
SXQgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCB0byBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55
IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0
aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91LiDCqUFybSBUZWNobm9sb2d5
IChDaGluYSkgQ28uLCBMdGQgY29weXJpZ2h0IGFuZCByZXNlcnZlIGFsbCByaWdodHMuIOmHjeim
geaPkOekuu+8muacrOmCruS7tu+8iOWMheaLrOS7u+S9lemZhOS7tu+8ieWPr+iDveWQq+acieS4
k+S+m+aYjuehrueahOS4quS6uuaIluebrueahOS9v+eUqOeahOacuuWvhuS/oeaBr++8jOW5tuWP
l+azleW+i+S/neaKpOOAguWmguaenOaCqOW5tumdnuivpeaUtuS7tuS6uu+8jOivt+eri+WNs+WI
oOmZpOatpOmCruS7tuOAguS4peemgemAmui/h+S7u+S9lea4oOmBk++8jOS7peS7u+S9leebruea
hO+8jOWQkeS7u+S9leS6uuaKq+mcsuOAgeWCqOWtmOaIluWkjeWItumCruS7tuS/oeaBr+aIluiA
heaNruatpOmHh+WPluS7u+S9leihjOWKqOOAguaEn+iwouaCqOeahOmFjeWQiOOAgiDCqeWuieiw
i+enkeaKgO+8iOS4reWbve+8ieaciemZkOWFrOWPuCDniYjmnYPmiYDmnInlubbkv53nlZnkuIDl
iIfmnYPliKnjgIINCg==
