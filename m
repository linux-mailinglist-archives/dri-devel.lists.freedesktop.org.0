Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE1E2207F0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 10:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C256EA58;
	Wed, 15 Jul 2020 08:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D2C6EA58;
 Wed, 15 Jul 2020 08:57:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAaPX1gwKxLPYN2vPkBhUO6L1MuUBsST7AsjnaIhmjvnPjOv66eOaA0zt45vV5XoW/fvOXaPLOYJnlddMNgTVHcsnDK2XiHYw0lHtrQ+Gb6wZQ6PjXdMfz36xNcW3ekEhFyy84J0Hmf01SXlNIMZrYfWckt5leKjF15fTV+q6hfSTRuzIciKdk8ruEH6nasdDuNj+SA7Q2eC1z0h8D0ZlTukzMsGRX5lxb0kuYqbJOX6QrkU47NiqSuj13o9Z4h/XE1YFxsKHc6qIPp6LQqSLLSkRECYb+IPjpdsX0EHXUusS8oex08zXf5slNjIirD+HW9MWMhb/yyplXPnogE6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3AX29zBuUkR5HGzKOk4k5e0hbL5m7eQtx4REtZbhrc=;
 b=M/xeSdOLs0qhZRevp7oxL2xR7ul5LDuuoAfeW/OFwbj/TI53GAyQ3GP9xIM5MD1DY12cVS8TAih3+VG5FGhalA6jLoPltczzHtZNYjamUokJt9YyzKAHktejKPeFp3lMFB52N5pkQHcCF9Z4I2jrfZvBKn8Cf8je88+Z8oPRZogW/ruiKld8c//7zyJL2hO6BZ1tfZhrPOaNFS1E/f3rS/1mP1CB33l+yj2qrw1oRcwSECWbrPj7nSdAVla1uVTIC1D8SZijxO+Lx/ijh+AyDCBbbkvTXqp+MTL6vWHLH4auOVPB8Pze/prZkyp4Byu/Hym+nCYUKRmZzIPcSWS6Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3AX29zBuUkR5HGzKOk4k5e0hbL5m7eQtx4REtZbhrc=;
 b=m9/DgbMmqr2GysmtKBrVnTFkF4gG8+Z+CUoC2iza8xqDnYtT2YY1T35gaU0lHT9eSucExQ2V7mJGmoQMvDa5srMS1yrR4INYfylpyoaARBrW4lL00Tr9v5ARaH50KvEGujUbW7my1LapnKQe8xFeHcsHnXgasO/8HHY1c6owr+A=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Wed, 15 Jul
 2020 08:57:43 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3195.018; Wed, 15 Jul 2020
 08:57:43 +0000
Subject: Re: [PATCH 1/3] dma-buf/sw_sync: Avoid recursive lock during fence
 signal.
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
References: <20200714200646.14041-1-chris@chris-wilson.co.uk>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a523ff11-beba-6fa5-743c-ff2336d06cfb@amd.com>
Date: Wed, 15 Jul 2020 10:57:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200714200646.14041-1-chris@chris-wilson.co.uk>
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0073.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR06CA0073.eurprd06.prod.outlook.com (2603:10a6:208:fa::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.17 via Frontend Transport; Wed, 15 Jul 2020 08:57:42 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c7589e92-3757-4aee-6055-08d8289d2304
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4125ED8B1E0DC67208F3FD63837E0@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8BcWbY4/hDxziPax/FdGiEnn7y8YkI5+sx3ia5bW2Q+kYQObieH9vAB7X8RYhFVobs+WwwQXA0m7lqw6S2J5VDYGcsftNwgMCyX+1G1mGAq8Fk4pQLgqSjSqBP0zXq9qJsaFLiwHYkMgDJdI7xxVNqiLjri0z4juh4yiVqOvXOtqg0zeEfaACgWK9RjG2YtyfjXwgrVxEUhbj7l1W7Z/zQ3uf+57PhOJ0bgzWAFrLfzECRl0PVg5fQ3ez1CuH54wRxb8Vjl71uJrVT4eks/8ponvcwMaeEuk730MxxFOG8wK+68vYMNp+AWi5Gux+ydogkfbEdhiqvsKn4XB8gTl0Ru6ZX0uoNQW2neXcMxVb66o8xytog2GwUHrkxLrETa2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(136003)(39850400004)(346002)(376002)(396003)(16526019)(2616005)(6666004)(36756003)(186003)(66556008)(6486002)(31686004)(4326008)(52116002)(54906003)(316002)(66946007)(5660300002)(66476007)(86362001)(66574015)(8676002)(83380400001)(31696002)(478600001)(8936002)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 3QLPEfRsn/ZDgEGdbvXa/W4lSih+2clqRLPA49ToLbi4itW26EuutMDGwTqpXvDhJ6ITzp4ttbXmS55J4o2tA8ItIdKzqNwYQJbneKa7YYs9bldNEymHlUHjziUU8dzYpQt8xql0AyPKGVkB45p6/s5f1byQZdXsxvuctWn3ViWdKKK2had7ZO9ZtuEeoQKobNZ7joCjfKK0hKBBIiDqkjf9dYEX8xQfamPZvlqTZ7qwRRM8Cu4wlBgwMTqsezK1BHloOUMUM84Nf8ofvpYjKQ+rFlB3C3iScUbJuiJehdPLINGx4zdK0y619F/Iw8/bbXrM95317mnVN2Wq9ujBgyOOIfiMLleduzbCR0YTwyyRGBLbYtmOfK6hsQkR2lO1p1fQUIVVTryB0EGWaml/QOnlqigobMOxf3j8MHrbkrXYQwIzqxUQuWHvNuseiGPny4Cx6oCC1F2j9fwZJUv8QaKSRfNODhgQubFpLS4dw0166MZVVMDN1mS9kvFoe5KBShAg0i4IWyFP9UO5FkMlkf44CTM1x8/lf9LhU4Qjc7XwV9YY9N53WloxcwF7CHdk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7589e92-3757-4aee-6055-08d8289d2304
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2020 08:57:43.8899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wEdk5LYA/9N6lD7LSZuhGoek0Bp5PWsuF2V4DT1yjdpAjZoUDzTBM1fF75/D6Tvd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
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
Cc: Gustavo Padovan <gustavo@padovan.org>, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMDcuMjAgdW0gMjI6MDYgc2NocmllYiBDaHJpcyBXaWxzb246Cj4gRnJvbTogQmFzIE5p
ZXV3ZW5odWl6ZW4gPGJhc0BiYXNuaWV1d2VuaHVpemVuLm5sPgo+Cj4gQ2FsbHRyZWU6Cj4gICAg
dGltZWxpbmVfZmVuY2VfcmVsZWFzZQo+ICAgIGRybV9zY2hlZF9lbnRpdHlfd2FrZXVwCj4gICAg
ZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQKPiAgICBzeW5jX3RpbWVsaW5lX3NpZ25hbAo+ICAgIHN3
X3N5bmNfaW9jdGwKPgo+IFJlbGVhc2luZyB0aGUgcmVmZXJlbmNlIHRvIHRoZSBmZW5jZSBpbiB0
aGUgZmVuY2Ugc2lnbmFsIGNhbGxiYWNrCj4gc2VlbXMgcmVhc29uYWJsZSB0byBtZSwgc28gdGhp
cyBwYXRjaCBhdm9pZHMgdGhlIGxvY2tpbmcgaXNzdWUgaW4KPiBzd19zeW5jLgo+Cj4gZDM4NjJl
NDRkYWE3ICgiZG1hLWJ1Zi9zdy1zeW5jOiBGaXggbG9ja2luZyBhcm91bmQgc3luY190aW1lbGlu
ZSBsaXN0cyIpCj4gZml4ZWQgdGhlIHJlY3Vyc2l2ZSBsb2NraW5nIGlzc3VlIGJ1dCBjYXVzZWQg
YW4gdXNlLWFmdGVyLWZyZWUuIExhdGVyCj4gZDNjNmRkMWZiMzBkICgiZG1hLWJ1Zi9zd19zeW5j
OiBTeW5jaHJvbml6ZSBzaWduYWwgdnMgc3luY3B0IGZyZWUiKQo+IGZpeGVkIHRoZSB1c2UtYWZ0
ZXItZnJlZSBidXQgcmVpbnRyb2R1Y2VkIHRoZSByZWN1cnNpdmUgbG9ja2luZyBpc3N1ZS4KPgo+
IEluIHRoaXMgYXR0ZW1wdCB3ZSBhdm9pZCB0aGUgdXNlLWFmdGVyLWZyZWUgc3RpbGwgYmVjYXVz
ZSB0aGUgcmVsZWFzZQo+IGZ1bmN0aW9uIHN0aWxsIGFsd2F5cyBsb2NrcywgYW5kIG91dHNpZGUg
b2YgdGhlIGxvY2tpbmcgcmVnaW9uIGluIHRoZQo+IHNpZ25hbCBmdW5jdGlvbiB3ZSBoYXZlIHBy
b3Blcmx5IHJlZmNvdW50ZWQgcmVmZXJlbmNlcy4KPgo+IFdlIGZ1cnRoZXJtb3JlIGFsc28gYXZv
aWQgdGhlIHJlY3VyaXZlIGxvY2sgYnkgbWFraW5nIHN1cmUgdGhhdCBlaXRoZXI6Cj4KPiAxKSBX
ZSBoYXZlIGEgcHJvcGVybHkgcmVmY291bnRlZCByZWZlcmVuY2UsIHByZXZlbnRpbmcgdGhlIHNp
Z25hbCBmcm9tCj4gICAgIHRyaWdnZXJpbmcgdGhlIHJlbGVhc2UgZnVuY3Rpb24gaW5zaWRlIHRo
ZSBsb2NrZWQgcmVnaW9uLgo+IDIpIFRoZSByZWZjb3VudCB3YXMgYWxyZWFkeSB6ZXJvLCBhbmQg
aGVuY2Ugbm9ib2R5IHdpbGwgYmUgYWJsZSB0byB0cmlnZ2VyCj4gICAgIHRoZSByZWxlYXNlIGZ1
bmN0aW9uIGZyb20gdGhlIHNpZ25hbCBmdW5jdGlvbi4KPgo+IHYyOiBNb3ZlIGRtYV9mZW5jZV9z
aWduYWwoKSBpbnRvIHNlY29uZCBsb29wIGluIHByZXBhcmF0aW9uIHRvIG1vdmluZwo+IHRoZSBj
YWxsYmFjayBvdXQgb2YgdGhlIHRpbWVsaW5lIG9iai0+bG9jay4KPgo+IEZpeGVzOiBkM2M2ZGQx
ZmIzMGQgKCJkbWEtYnVmL3N3X3N5bmM6IFN5bmNocm9uaXplIHNpZ25hbCB2cyBzeW5jcHQgZnJl
ZSIpCj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IENjOiBHdXN0YXZvIFBhZG92
YW4gPGd1c3Rhdm9AcGFkb3Zhbi5vcmc+Cj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4gU2lnbmVk
LW9mZi1ieTogQmFzIE5pZXV3ZW5odWl6ZW4gPGJhc0BiYXNuaWV1d2VuaHVpemVuLm5sPgo+IFNp
Z25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgoKTG9v
a3MgcmVhc29uYWJsZSB0byBtZSwgYnV0IEknbSBub3QgYW4gZXhwZXJ0IG9uIHRoaXMgY29udGFp
bmVyLgoKU28gcGF0Y2ggaXMgQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4gLS0tCj4gICBkcml2ZXJzL2Rt
YS1idWYvc3dfc3luYy5jIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvc3dfc3luYy5jIGIvZHJpdmVycy9kbWEtYnVmL3N3
X3N5bmMuYwo+IGluZGV4IDM0OGIzYTkxNzBmYS4uODA3YzgyMTQ4MDYyIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZG1hLWJ1Zi9zd19zeW5jLmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvc3dfc3lu
Yy5jCj4gQEAgLTE5Miw2ICsxOTIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtYV9mZW5jZV9v
cHMgdGltZWxpbmVfZmVuY2Vfb3BzID0gewo+ICAgc3RhdGljIHZvaWQgc3luY190aW1lbGluZV9z
aWduYWwoc3RydWN0IHN5bmNfdGltZWxpbmUgKm9iaiwgdW5zaWduZWQgaW50IGluYykKPiAgIHsK
PiAgIAlzdHJ1Y3Qgc3luY19wdCAqcHQsICpuZXh0Owo+ICsJTElTVF9IRUFEKHNpZ25hbCk7Cj4g
ICAKPiAgIAl0cmFjZV9zeW5jX3RpbWVsaW5lKG9iaik7Cj4gICAKPiBAQCAtMjAzLDIxICsyMDQs
MzIgQEAgc3RhdGljIHZvaWQgc3luY190aW1lbGluZV9zaWduYWwoc3RydWN0IHN5bmNfdGltZWxp
bmUgKm9iaiwgdW5zaWduZWQgaW50IGluYykKPiAgIAkJaWYgKCF0aW1lbGluZV9mZW5jZV9zaWdu
YWxlZCgmcHQtPmJhc2UpKQo+ICAgCQkJYnJlYWs7Cj4gICAKPiAtCQlsaXN0X2RlbF9pbml0KCZw
dC0+bGluayk7Cj4gLQkJcmJfZXJhc2UoJnB0LT5ub2RlLCAmb2JqLT5wdF90cmVlKTsKPiAtCj4g
ICAJCS8qCj4gLQkJICogQSBzaWduYWwgY2FsbGJhY2sgbWF5IHJlbGVhc2UgdGhlIGxhc3QgcmVm
ZXJlbmNlIHRvIHRoaXMKPiAtCQkgKiBmZW5jZSwgY2F1c2luZyBpdCB0byBiZSBmcmVlZC4gVGhh
dCBvcGVyYXRpb24gaGFzIHRvIGJlCj4gLQkJICogbGFzdCB0byBhdm9pZCBhIHVzZSBhZnRlciBm
cmVlIGluc2lkZSB0aGlzIGxvb3AsIGFuZCBtdXN0Cj4gLQkJICogYmUgYWZ0ZXIgd2UgcmVtb3Zl
IHRoZSBmZW5jZSBmcm9tIHRoZSB0aW1lbGluZSBpbiBvcmRlciB0bwo+IC0JCSAqIHByZXZlbnQg
ZGVhZGxvY2tpbmcgb24gdGltZWxpbmUtPmxvY2sgaW5zaWRlCj4gLQkJICogdGltZWxpbmVfZmVu
Y2VfcmVsZWFzZSgpLgo+ICsJCSAqIFdlIG5lZWQgdG8gdGFrZSBhIHJlZmVyZW5jZSB0byBhdm9p
ZCBhIHJlbGVhc2UgZHVyaW5nCj4gKwkJICogc2lnbmFsbGluZyAod2hpY2ggY2FuIGNhdXNlIGEg
cmVjdXJzaXZlIGxvY2sgb2Ygb2JqLT5sb2NrKS4KPiArCQkgKiBJZiByZWZjb3VudCB3YXMgYWxy
ZWFkeSB6ZXJvLCBhbm90aGVyIHRocmVhZCBpcyBhbHJlYWR5Cj4gKwkJICogdGFraW5nIGNhcmUg
b2YgZGVzdHJveWluZyB0aGUgZmVuY2UuCj4gICAJCSAqLwo+IC0JCWRtYV9mZW5jZV9zaWduYWxf
bG9ja2VkKCZwdC0+YmFzZSk7Cj4gKwkJaWYgKCFkbWFfZmVuY2VfZ2V0X3JjdSgmcHQtPmJhc2Up
KQo+ICsJCQljb250aW51ZTsKPiArCj4gKwkJbGlzdF9tb3ZlX3RhaWwoJnB0LT5saW5rLCAmc2ln
bmFsKTsKPiArCQlyYl9lcmFzZSgmcHQtPm5vZGUsICZvYmotPnB0X3RyZWUpOwo+ICAgCX0KPiAg
IAo+ICAgCXNwaW5fdW5sb2NrX2lycSgmb2JqLT5sb2NrKTsKPiArCj4gKwlsaXN0X2Zvcl9lYWNo
X2VudHJ5X3NhZmUocHQsIG5leHQsICZzaWduYWwsIGxpbmspIHsKPiArCQkvKgo+ICsJCSAqIFRo
aXMgbmVlZHMgdG8gYmUgY2xlYXJlZCBiZWZvcmUgcmVsZWFzZSwgb3RoZXJ3aXNlIHRoZQo+ICsJ
CSAqIHRpbWVsaW5lX2ZlbmNlX3JlbGVhc2UgZnVuY3Rpb24gZ2V0cyBjb25mdXNlZCBhYm91dCBh
bHNvCj4gKwkJICogcmVtb3ZpbmcgdGhlIGZlbmNlIGZyb20gdGhlIHB0X3RyZWUuCj4gKwkJICov
Cj4gKwkJbGlzdF9kZWxfaW5pdCgmcHQtPmxpbmspOwo+ICsKPiArCQlkbWFfZmVuY2Vfc2lnbmFs
KCZwdC0+YmFzZSk7Cj4gKwkJZG1hX2ZlbmNlX3B1dCgmcHQtPmJhc2UpOwo+ICsJfQo+ICAgfQo+
ICAgCj4gICAvKioKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
