Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A16F115447
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 16:30:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2995C6FA47;
	Fri,  6 Dec 2019 15:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750049.outbound.protection.outlook.com [40.107.75.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628DD6FA47
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 15:30:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOye6/mvWyzoSQWxRsd39sUtr4Ia+oZZC5JivTS354rf3vGDA5mqynwZk8tcqBxnPrnGgn8etZ7WDYraOpkVnIxiRzQiTG0atusuKlBG4PWixDWXyrOZ1JLsAlsxM+ogycpylBOD8ZzhmrdxWGFjSerWwFNjODV95sXexMBmTvHR1LUKb5eiyNJig8hqtVfuUR/qiitoCOS1/ImtEkp6f3JzYlD8+bLJVw/QnUsC2D8HNWpkg86KbiNoysf/Ap/hLoAf+HYs95EBGnMiU+cCc0v8i4O3RRs6Iao3AdRkkjQaQIaiGn8RSJFrbk5Gk1YzF7DUG9En6FopuyMyndu+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GZnL0Dh/wR4b4F3NzNQG+VLY5WYMRy3yBKths2Zujs=;
 b=mN3x6ZuCVul76OCwM+CsRd+YOenjZ1D91k/305/QVIeu9Vz2+n4nBZwGRTdD7JN8fD73+aL+4snr0zwtPTo4cTRbWVAM0FSdRbHqG0GFwmC211+alU+smLLgRtt6OxKHH3Jiq07dES9V/5TxddphoMUe2CwdRpfTG+2W/qrz2Yz+w1iRVk2M1w2Y8ccj7ACaBSGrQV1vGQ6E7Ryl67hXOfWKDejJ+a0HELkOX3NQA+3YBCmbDgzAqtrwje85uuEdgjOWoMU4iErQlRhT1wW5ivEZDA/YQe6mkQ8ssdMLAF+HErSS705taDJcPFSxB0L3G84/4ZuZ/d+ZFFiV7nSMxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0246.namprd12.prod.outlook.com (10.174.53.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Fri, 6 Dec 2019 15:30:36 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d%11]) with mapi id 15.20.2516.017; Fri, 6 Dec 2019
 15:30:36 +0000
Subject: Re: [PATCH 1/2] drm: add dp helper to initialize remote aux channel.
To: "David (Dingchen) Zhang" <dingchen.zhang@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20191205165504.3682-1-dingchen.zhang@amd.com>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <e81506b9-233e-ca7b-eb91-989a17389614@amd.com>
Date: Fri, 6 Dec 2019 10:30:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
In-Reply-To: <20191205165504.3682-1-dingchen.zhang@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::20) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 58d2efb6-7851-4cbd-6ce2-08d77a613d7c
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0246:|CY4PR1201MB0246:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB024676F539090CE19B673FF18C5F0@CY4PR1201MB0246.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0243E5FD68
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(189003)(199004)(31696002)(2906002)(6512007)(5660300002)(36756003)(4326008)(66946007)(66476007)(66556008)(305945005)(6486002)(8936002)(50466002)(31686004)(99286004)(966005)(26005)(2616005)(186003)(53546011)(6506007)(81156014)(230700001)(58126008)(76176011)(52116002)(498600001)(229853002)(54906003)(81166006)(8676002)(65956001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0246;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V3CGw24xht7Iqy7Ec1mMqwzhBy1olbbrYyL6lQOAXrZusFDBwDexs58EnBaGxECFtXmFdgzixf9jJFmKxWQwlpKMxWL3VkmQ+QS+j/Lg2dAduzBTQcjCyBdwx3vYfddVRGq8SS9cb9qA2Vws5VsbOs02n3j/GBuyogXZT+hIZUui03RaU54vUZYb8PlVuOUKlYd92SqotdOlSuFvEJzTltxxIkEE9IzXeA4McCz0rWXQIzrD5+T42pOKXDtOvW6rL1d+tMhKdj+d+BhNPD+tju5pImG+q5FeBee/hpNaOsEjKDEI9Z17E5xmLyCKl1xXz8EddTRs6uMa8Ew6LttZI7m7clliCEkuwkR3Fa264bMXihXrjXArZmNmwsYt51mt+p2c+j5W6tbLNYLaRpeaeJpF9Vor6XfTbNPXfSh+UbcQ8+Dd3ahBOl5CGY5dzEvkMA3/mLxqjspC3b8huPeI7rAmLo5/2moZlV/qk7hnXpA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d2efb6-7851-4cbd-6ce2-08d77a613d7c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2019 15:30:36.1004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXK2/OXDe7lfJarqM/oDk2S1jmJ8ZV2jjRIU0pgGXrKwsLuUMkzmPxvYMIEXWxL4N4/Sg9J/YKcyIQ2+ABhLlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0246
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GZnL0Dh/wR4b4F3NzNQG+VLY5WYMRy3yBKths2Zujs=;
 b=sh9a9krC8BdSfwEXwqmrdUjAYYfTRlm6NMUpzHboRD6UmZgQamz1nZbZeJkmaNUOCXppTaPvu6Y1hrwIE/4J2FLpKZQpgbuL8a2lf6F0DzdYw0tAVl8hf6xla34pcNFcq9N22xFd6GAIGi6nqYMHhMZD8DfUN1Tp4wBYzL2ZXZ4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: Leo Li <sunpeng.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMi0wNSAxMTo1NSBhLm0uLCBEYXZpZCAoRGluZ2NoZW4pIFpoYW5nIHdyb3RlOgo+
IFt3aHldCj4gV2UgbmVlZCB0byBtaW5pbWFsbHkgaW5pdGlhbGl6ZSB0aGUgcmVtb3RlIGF1eCBj
aGFubmVsLCBlLmcuIHRoZQo+IGNyYyB3b3JrIHN0cnVjdCBvZiByZW1vdGUgYXV4IHRvIGR1bXAg
dGhlIHNpbmsncyBEUFJYIENSQ3MgaW4gTVNUCj4gc2V0dXAuCj4gCj4gW2hvd10KPiBBZGQgaGVs
cGVyIHRoYXQgb25seSBpbml0aWFsaXplcyB0aGUgY3JjIHdvcmsgc3RydWN0IG9mIHRoZSByZW1v
dGUKPiBhdXgsIGhvb2tlIGNyYyB3b3JrIHF1ZXVlIHRvICdkcm1fZHBfYXV4X2NyY193b3JrJy4g
VGhlbiBjYWxsIHRoaXMKPiBoZWxwZXIgaW4gRFAgTVNUIHBvcnQgaW5pdGlhbGl6YXRpb24uCj4g
Cj4gCj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IENjOiBIYXJyeSBXZW50bGFu
ZCA8SGFycnkuV2VudGxhbmRAYW1kLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCAoRGluZ2No
ZW4pIFpoYW5nIDxkaW5nY2hlbi56aGFuZ0BhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX2hlbHBlci5jICAgICAgIHwgMTMgKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgIDMgKysrCj4gIGluY2x1ZGUvZHJtL2RybV9k
cF9oZWxwZXIuaCAgICAgICAgICAgfCAgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwo+IGluZGV4IGZjMzkzMjNlN2Q1Mi4u
MzczMTI1OTNkZDBhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVy
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCj4gQEAgLTEwOTEsNiAr
MTA5MSwxOSBAQCBzdGF0aWMgdm9pZCBkcm1fZHBfYXV4X2NyY193b3JrKHN0cnVjdCB3b3JrX3N0
cnVjdCAqd29yaykKPiAgCX0KPiAgfQo+ICAKPiArLyoqCj4gKyAqIGRybV9kcF9yZW1vdGVfYXV4
X2luaXQoKSAtIG1pbmltYWxseSBpbml0aWFsaXNlIGEgcmVtb3RlIGF1eCBjaGFubmVsCj4gKyAq
IEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsCj4gKyAqCj4gKyAqIFVzZWQgZm9yIHJlbW90
ZSBhdXggY2hhbm5lbCBpbiBnZW5lcmFsLiBNZXJlbHkgaW5pdGlhbGl6ZSB0aGUgY3JjIHdvcmsK
PiArICogc3RydWN0Lgo+ICsgKi8KPiArdm9pZCBkcm1fZHBfcmVtb3RlX2F1eF9pbml0KHN0cnVj
dCBkcm1fZHBfYXV4ICphdXgpCj4gK3sKPiArCUlOSVRfV09SSygmYXV4LT5jcmNfd29yaywgZHJt
X2RwX2F1eF9jcmNfd29yayk7Cj4gK30KPiArRVhQT1JUX1NZTUJPTChkcm1fZHBfcmVtb3RlX2F1
eF9pbml0KTsKPiArCj4gIC8qKgo+ICAgKiBkcm1fZHBfYXV4X2luaXQoKSAtIG1pbmltYWxseSBp
bml0aWFsaXNlIGFuIGF1eCBjaGFubmVsCj4gICAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFu
bmVsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gaW5kZXggZDVkZjAyMzE1
ZTE0Li40MzA4MzE2ZmUyMTEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9t
c3RfdG9wb2xvZ3kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5
LmMKPiBAQCAtMTY0Miw2ICsxNjQyLDkgQEAgc3RhdGljIHZvaWQgZHJtX2RwX2FkZF9wb3J0KHN0
cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0YiwKClRoaXMgZnVuY3Rpb24gaXMgZ29uZSBpbiBh
bWQtc3RhZ2luZy1kcm0tbmV4dC4KClBsZWFzZSBzZW5kIGEgdjIgb2YgdGhpcyBwYXRjaCBiYXNl
ZCBvbiBhbWQtc3RhZ2luZy1kcm0tbmV4dCBvZiBhZ2Q1ZidzCnJlcG8gZnJvbSBodHRwczovL2Nn
aXQuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eC8/aD1hbWQtc3RhZ2luZy1kcm0tbmV4dAoK
SGFycnkKCj4gIAkJcG9ydC0+YXV4LmRldiA9IGRldi0+ZGV2Owo+ICAJCXBvcnQtPmF1eC5pc19y
ZW1vdGUgPSB0cnVlOwo+ICAKPiArCQkvKiBpbml0aWFsaXplIHRoZSBNU1QgZG93bnN0cmVhbSBw
b3J0J3MgQVVYIGNyYyB3b3JrIHF1ZXVlICovCj4gKwkJZHJtX2RwX3JlbW90ZV9hdXhfaW5pdCgm
cG9ydC0+YXV4KTsKPiArCj4gIAkJLyoKPiAgCQkgKiBNYWtlIHN1cmUgdGhlIG1lbW9yeSBhbGxv
Y2F0aW9uIGZvciBvdXIgcGFyZW50IGJyYW5jaCBzdGF5cwo+ICAJCSAqIGFyb3VuZCB1bnRpbCBv
dXIgb3duIG1lbW9yeSBhbGxvY2F0aW9uIGlzIHJlbGVhc2VkCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAo+IGlu
ZGV4IDYxZWYzNTFjNWZjYS4uZGEwYTY5ZjEwZTM4IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJt
L2RybV9kcF9oZWxwZXIuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAo+IEBA
IC0xNDAzLDYgKzE0MDMsNyBAQCBpbnQgZHJtX2RwX2Rvd25zdHJlYW1faWQoc3RydWN0IGRybV9k
cF9hdXggKmF1eCwgY2hhciBpZFs2XSk7Cj4gIHZvaWQgZHJtX2RwX2Rvd25zdHJlYW1fZGVidWco
c3RydWN0IHNlcV9maWxlICptLCBjb25zdCB1OCBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSwK
PiAgCQkJICAgICBjb25zdCB1OCBwb3J0X2NhcFs0XSwgc3RydWN0IGRybV9kcF9hdXggKmF1eCk7
Cj4gIAo+ICt2b2lkIGRybV9kcF9yZW1vdGVfYXV4X2luaXQoc3RydWN0IGRybV9kcF9hdXggKmF1
eCk7Cj4gIHZvaWQgZHJtX2RwX2F1eF9pbml0KHN0cnVjdCBkcm1fZHBfYXV4ICphdXgpOwo+ICBp
bnQgZHJtX2RwX2F1eF9yZWdpc3RlcihzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4KTsKPiAgdm9pZCBk
cm1fZHBfYXV4X3VucmVnaXN0ZXIoc3RydWN0IGRybV9kcF9hdXggKmF1eCk7Cj4gCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
