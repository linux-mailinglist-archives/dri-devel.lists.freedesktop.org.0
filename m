Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D63A102E24
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 22:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1AA6E997;
	Tue, 19 Nov 2019 21:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750074.outbound.protection.outlook.com [40.107.75.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C890A6E94B;
 Tue, 19 Nov 2019 21:18:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHmiUtxAi0G2i4JERbVoJ2e4qg5r3ysQLul+Zut0IKrZfsalQg2GJGAR3MkYJBe04+6KccjYm0pcppJ8gRmiED6FLK+JtY/Tvz3bvpXj+MwR7FgW/KlNYXsynr+TKo0dBJFfvF+1xAizbw6EUzIAk2C3Wkf/cfhR2pOlKRPpYDJUAWRJgDziqMEElbyKWKVdtYUx2GX7P59UnZsh8BjEIyU3lyp5OIrYu/YbJEGj8Vp/zm9bt4xYeIfoAKrZIMFUBfXkgtTHjxfp3UGRZ90gcnPX+F+aFqBiM3EaxXLE7VvP8XNUYqaSs7l212MiMy4pB64JnbI1OoJxJciHuX1WPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtHyCVuJX24KHm9Bias0rCSxxh9zzw5ZA9BO8KQs2c4=;
 b=jMXTvN+kcQxF1fVQ8p5Ptnqo48f+LMkOvuCdn1MaLbxJJBN/ye5Tal4I7Y72RLyqsoGDcfx2bNfx58IiwilwpK2juS9KHgTytxB+u1NoMP3/Yt3ENaFXSJBD6aA7eD1TRKnlhmAJ8Vqx6lIwTOMjmuD/0p9A4tcaUxdXElXw2GqwH4UKjZeqYCFfpfMl8JLY7HstbvFJ+iByfA4T2KxERSHYAag6LcF55AASEJhr1soWDuSsUvJV2Z51uYvOVoaDBUcKxfeq0/H+KAEra8lmsIYuG/i5TNqz9Liiq4G/n9b4P7Mk9TBFm9v8t2qHeVk4LED3b/8Vh6PAWQp6BoJKOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3013.namprd12.prod.outlook.com (20.178.55.219) by
 BYAPR12MB2999.namprd12.prod.outlook.com (20.178.55.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.29; Tue, 19 Nov 2019 21:12:25 +0000
Received: from BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::1174:3feb:de01:4fb9]) by BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::1174:3feb:de01:4fb9%6]) with mapi id 15.20.2451.031; Tue, 19 Nov 2019
 21:11:45 +0000
Subject: Re: [PATCH] drm/dsc: Return unsigned long on compute offset
From: Mikita Lipski <mlipski@amd.com>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 "Cornij, Nikola" <Nikola.Cornij@amd.com>
References: <20191119144526.31797-1-mikita.lipski@amd.com>
 <20191119145649.GZ1208@intel.com>
 <f7b705a8-9d6a-1db3-e261-a80aca57454a@amd.com>
 <BL0PR12MB24039F7D8CC95CCCC10C3103EE4C0@BL0PR12MB2403.namprd12.prod.outlook.com>
 <20191119171132.GB1208@intel.com>
 <2a61d60c-98f9-a5a2-6e7b-dc94df3fc510@amd.com>
Organization: AMD
Message-ID: <362986e6-e5d4-f2d5-12bd-feb0acc06546@amd.com>
Date: Tue, 19 Nov 2019 16:11:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <2a61d60c-98f9-a5a2-6e7b-dc94df3fc510@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::24) To BYAPR12MB3013.namprd12.prod.outlook.com
 (2603:10b6:a03:a9::27)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dc2e92c7-c4e1-4f9e-d62e-08d76d35153f
X-MS-TrafficTypeDiagnostic: BYAPR12MB2999:
X-MS-Exchange-PUrlCount: 1
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB299987DB9B88448281E4BC52E44C0@BYAPR12MB2999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 022649CC2C
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(13464003)(189003)(199004)(476003)(6246003)(11346002)(446003)(186003)(14444005)(6636002)(3846002)(2616005)(6486002)(386003)(6506007)(53546011)(81156014)(6512007)(52116002)(81166006)(36756003)(76176011)(26005)(65956001)(66066001)(99286004)(8936002)(65806001)(14454004)(478600001)(966005)(2486003)(23676004)(36916002)(31686004)(6306002)(8676002)(4326008)(229853002)(66574012)(316002)(110136005)(50466002)(47776003)(31696002)(6116002)(54906003)(305945005)(66946007)(2906002)(58126008)(486006)(25786009)(5660300002)(66556008)(66476007)(7736002)(2870700001)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2999;
 H:BYAPR12MB3013.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rzvlwL6wIg/CoacYJfi2QaFqjCa5a60NDfad+76yi/wwlbr0HEQy+6Z8GoUDVQvPVXlTcN3LPSinjQNQc7jyTCkKBIS6a8TcpQVHOosfBq8S4ziKKXDNmvNBXVtQeD3BNyiNuf+0I3+Oj6tRyMIzCGo/p0eVdySKa4ZJa7YXjaF0670u2OzAU4pxbu1EP2VaGsrVWd3jPWmrLapZpPeAcZ+s5NGYOo+YDGjrdkIEznppy/hpPswKlrPHc8RDgCLGG6u1gctlYaiy+MYa3zRFktOlXeJEGsEmw5ydInxAl6h7F81IUWQm+KivAgaWl4HLRmuWZHgXsEcvm4XCbq/pQa5hbV7nNAgMXEYBqelNDzxKeu8sFVnK9PWnQ9PDxZWQi+8Hq05gEN7eCi9CMbtFy0R9slCBUSNLmmM5GaROkBz9Gl2I6FGp74sI9FXI7BNDKW4ca6AjVJU39tI4hqONhuPuWA53WFvY2u6/DNKj7A4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2e92c7-c4e1-4f9e-d62e-08d76d35153f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2019 21:11:45.5952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZasPiDptzLhER9D12pHWGoqsibotyGh+ShOWuyEzGUZSyhvZNDw5v4/TANJ53Cvf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2999
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtHyCVuJX24KHm9Bias0rCSxxh9zzw5ZA9BO8KQs2c4=;
 b=qMsQgW7jEfnR7f4CHmwZ3lazm5LOJrOhdHmdfT5rS/UXP7CU4mQ5EiZbjFF3VC0Lp2fzvHzKfHHtiZYE2AV9yiVJlo/h276vM5CNijIe/aZSBBRiYUaqzQFFy2z3YFv3G5o3OYHlQRblBJO+2Y2duXaCV1rTJFjOIcHBvTJ5/6g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikita.Lipski@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Lipski, Mikita" <Mikita.Lipski@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAxOS8xMS8yMDE5IDE2OjA5LCBNaWtpdGEgTGlwc2tpIHdyb3RlOgo+IAo+IAo+IE9uIDE5
LzExLzIwMTkgMTI6MTEsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPj4gT24gVHVlLCBOb3YgMTks
IDIwMTkgYXQgMDQ6NTk6NDBQTSArMDAwMCwgQ29ybmlqLCBOaWtvbGEgd3JvdGU6Cj4+PiBJZiB5
b3UncmUgZ29pbmcgdG8gbWFrZSBhbGwgb2YgdGhlbSB0aGUgc2FtZSwgdGhlbiB1NjQsIHBsZWFz
ZS4KPj4+Cj4+PiBUaGlzIGlzIGJlY2F1c2UgSSdtIG5vdCBzdXJlIGlmIGNhbGN1bGF0aW9ucyBy
ZXF1aXJlIDY0LWJpdCBhdCBzb21lIAo+Pj4gc3RhZ2UuCj4+Cj4+IElmIGl0IGRvZXMgdGhlbiBp
dCdzIGFscmVhZHkgYnJva2VuLiBTb21lb25lIHNob3VsZCBwcm9iYWJseSBmaWd1cmUgb3V0Cj4+
IHdoYXQncyBhY3RhbGx5IG5lZWRlZCBpbnN0ZWFkIG9mIHNob290aW5nIGR1Y2tzIHdpdGggYW4g
aWNibS4KPj4KCgpTb3JyeSBtYWRlIGEgdHlwZSBiZWxvdy4gU3VwcG9zZWQgdG8gYmUgIkkgZG9u
J3QgdGhpbmsgaXQgaXMgYnJva2VuIgoKPiBJIGRvbid0IHRoaW5rIGl0IGlzIG5vdCBicm9rZW4s
IGNhdXNlIEknbSBjdXJyZW50bHkgdGVzdGluZyBEU0MuCj4gVGhlIHBhdGNoIEkgc2VudCBlYXJs
eSBzaW1wbHkgZml4ZXMgdGhlIGVycm9yIG9mIGNvbXBhcmluZ8KgIHNpZ25lZCBhbmQgCj4gdW5z
aWduZWQgdmFyaWFibGVzLgo+IAo+IFdlIGNhbiB0aGVuIHN1Ym1pdCBhIHNlY29uZCBwYXRjaCBh
ZGRyZXNzaW5nIHRoZSBpc3N1ZSBvZiB1c2luZyB1bnNpZ25lZCAKPiBsb25nIGludCBpbnN0ZWFk
IG9mIHUzMi4gQWxzbywgc2luY2UgdGhlIHZhcmlhYmxlcyBpbiBkcm1fZHNjX2NvbmZpZyAKPiBz
dHJ1Y3R1cmUgYXJlIGFsbCBvZiB0eXBlIHU4IGFuZCB1MTYsIHRoZSBjYWxjdWxhdGlvbiB2YWx1
ZXMgc2hvdWxkbid0IAo+IGV4Y2VlZCB0aGUgc2l6ZSBvZiB1MzIuCj4gCj4gVGhhbmtzCj4gCj4+
Pgo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+IEZyb206IExpcHNraSwgTWlraXRh
IDxNaWtpdGEuTGlwc2tpQGFtZC5jb20+Cj4+PiBTZW50OiBOb3ZlbWJlciAxOSwgMjAxOSAxMDow
OCBBTQo+Pj4gVG86IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+OyBMaXBza2ksIE1pa2l0YSAKPj4+IDxNaWtpdGEuTGlwc2tpQGFtZC5jb20+Cj4+PiBDYzog
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IAo+Pj4gQ29ybmlqLCBOaWtvbGEgPE5pa29sYS5Db3JuaWpAYW1kLmNvbT4KPj4+IFN1
YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9kc2M6IFJldHVybiB1bnNpZ25lZCBsb25nIG9uIGNvbXB1
dGUgb2Zmc2V0Cj4+Pgo+Pj4KPj4+Cj4+PiBPbiAxOS8xMS8yMDE5IDA5OjU2LCBWaWxsZSBTeXJq
w6Rsw6Qgd3JvdGU6Cj4+Pj4gT24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMDk6NDU6MjZBTSAtMDUw
MCwgbWlraXRhLmxpcHNraUBhbWQuY29tIHdyb3RlOgo+Pj4+PiBGcm9tOiBNaWtpdGEgTGlwc2tp
IDxtaWtpdGEubGlwc2tpQGFtZC5jb20+Cj4+Pj4+Cj4+Pj4+IFdlIHNob3VsZG4ndCBjb21wYXJl
IGludCB3aXRoIHVuc2lnbmVkIGxvbmcgdG8gZmluZCB0aGUgbWF4IHZhbHVlIGFuZAo+Pj4+PiBz
aW5jZSB3ZSBhcmUgbm90IGV4cGVjdGluZyBuZWdhdGl2ZSB2YWx1ZSByZXR1cm5lZCBmcm9tCj4+
Pj4+IGNvbXB1dGVfb2Zmc2V0IHdlIHNob3VsZCBtYWtlIHRoaXMgZnVuY3Rpb24gcmV0dXJuIHVu
c2lnbmVkIGxvbmcgc28KPj4+Pj4gd2UgY2FuIGNvbXBhcmUgdGhlIHZhbHVlcyB3aGVuIGNvbXB1
dGluZyByYyBwYXJhbWV0ZXJzLgo+Pj4+Cj4+Pj4gV2h5IGFyZSB0aGVyZSBvdGhlciB1bnNpZ25l
ZCBsb25ncyBpbiBkc2MgcGFyYW1ldGVyIGNvbXB1dGF0aW9uIGluIHRoZQo+Pj4+IGZpcnN0IHBs
YWNlPwo+Pj4KPj4+IEkgYmVsaWV2ZSBpdCB3YXMgaW5pdGlhbGx5IHNldCB0byBiZSB1bnNpZ25l
ZCBsb25nIGZvciB2YXJpYWJsZSAKPj4+IGNvbnNpc3RlbmN5LCB3aGVuIHdlIHBvcnRlZCBpbnRl
bF9jb21wdXRlX3JjX3BhcmFtZXRlcnMgaW50byAKPj4+IGRybV9kc2NfY29tcHV0ZV9yY19wYXJh
bWV0ZXJzLiBCdXQgbm93IHRoYXQgSSBsb29rIGF0IGl0LCB3ZSBjYW4gCj4+PiBhY3R1YWxseSBq
dXN0IHNldCB0aGVtIHRvIHUzMiBvciB1NjQsIGFzIG5vdGhpbmcgc2hvdWxkIGV4Y2VlZCB0aGF0
Lgo+Pj4+Cj4+Pj4+Cj4+Pj4+IENjOiBOaWtvbGEgQ29ybmlqIDxuaWtvbGEuY29ybmlqQGFtZC5j
b20+Cj4+Pj4+IENjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPj4+
Pj4gU2lnbmVkLW9mZi1ieTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgo+
Pj4+PiAtLS0KPj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vZHJtX2RzYy5jIHwgNiArKystLS0K
Pj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kc2MuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMKPj4+Pj4gaW5kZXggNzRmMzUyN2Y1NjdkLi5lYzQwNjA0
YWI2YTIgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMKPj4+Pj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kc2MuYwo+Pj4+PiBAQCAtMjQ1LDExICsyNDUsMTEg
QEAgdm9pZCBkcm1fZHNjX3Bwc19wYXlsb2FkX3BhY2soc3RydWN0IAo+Pj4+PiBkcm1fZHNjX3Bp
Y3R1cmVfcGFyYW1ldGVyX3NldCAqcHBzX3BheWxvYWQsCj4+Pj4+IMKgwqAgfQo+Pj4+PiDCoMKg
IEVYUE9SVF9TWU1CT0woZHJtX2RzY19wcHNfcGF5bG9hZF9wYWNrKTsKPj4+Pj4gLXN0YXRpYyBp
bnQgY29tcHV0ZV9vZmZzZXQoc3RydWN0IGRybV9kc2NfY29uZmlnICp2ZHNjX2NmZywgaW50IAo+
Pj4+PiBwaXhlbHNfcGVyX2dyb3VwLAo+Pj4+PiArc3RhdGljIHVuc2lnbmVkIGxvbmcgY29tcHV0
ZV9vZmZzZXQoc3RydWN0IGRybV9kc2NfY29uZmlnIAo+Pj4+PiAqdmRzY19jZmcsIGludCBwaXhl
bHNfcGVyX2dyb3VwLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aW50IGdyb3Vwc19wZXJfbGluZSwgaW50IGdycGNudCkKPj4+Pj4gwqDCoCB7Cj4+Pj4+IC3CoMKg
wqAgaW50IG9mZnNldCA9IDA7Cj4+Pj4+IC3CoMKgwqAgaW50IGdycGNudF9pZCA9IERJVl9ST1VO
RF9VUCh2ZHNjX2NmZy0+aW5pdGlhbF94bWl0X2RlbGF5LCAKPj4+Pj4gcGl4ZWxzX3Blcl9ncm91
cCk7Cj4+Pj4+ICvCoMKgwqAgdW5zaWduZWQgbG9uZyBvZmZzZXQgPSAwOwo+Pj4+PiArwqDCoMKg
IHVuc2lnbmVkIGxvbmcgZ3JwY250X2lkID0gCj4+Pj4+IERJVl9ST1VORF9VUCh2ZHNjX2NmZy0+
aW5pdGlhbF94bWl0X2RlbGF5LCBwaXhlbHNfcGVyX2dyb3VwKTsKPj4+Pj4gwqDCoMKgwqDCoMKg
IGlmIChncnBjbnQgPD0gZ3JwY250X2lkKQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZmZz
ZXQgPSBESVZfUk9VTkRfVVAoZ3JwY250ICogcGl4ZWxzX3Blcl9ncm91cCAqIAo+Pj4+PiB2ZHNj
X2NmZy0+Yml0c19wZXJfcGl4ZWwsIDE2KTsKPj4+Pj4gLS0gCj4+Pj4+IDIuMTcuMQo+Pj4+Pgo+
Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPj4+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKPj4+Pgo+Pj4KPj4+IC0tIAo+Pj4gVGhhbmtzLAo+Pj4gTWlraXRhIExpcHNr
aQo+Pj4gU29mdHdhcmUgRW5naW5lZXIgMiwgQU1ECj4+PiBtaWtpdGEubGlwc2tpQGFtZC5jb20K
Pj4KPiAKCi0tIApUaGFua3MsCk1pa2l0YSBMaXBza2kKU29mdHdhcmUgRW5naW5lZXIgMiwgQU1E
Cm1pa2l0YS5saXBza2lAYW1kLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
