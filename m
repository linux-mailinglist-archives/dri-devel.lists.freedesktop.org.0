Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA3999585
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 15:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16396EB36;
	Thu, 22 Aug 2019 13:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810081.outbound.protection.outlook.com [40.107.81.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55C36EB36
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 13:53:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oW5of8pMrv0YKiEkhdejci1JR9gsvj6TYEPtEYXMO7IP64rplz9RTqdHTQEf4ajpEobmtemxu06p//++F16r1+G/SlI4Oxtf4oj7KXsDZnAu0OT782P3Zg8RP3+STwc1GD/tSbhTaK6HBmQNXA4YNJ/vITvryGFgrFhfdc1EtSwsuUt93ocDeF33MWvIVMQ2tSxnIVuXHvs1W14x2FWycJLuqUOliAl08QmIbnMhyI1z1n+JxUHF1gCPPLhg7/4WhcBowDzRYYtFxA4u8EXRcmWmFiRE/yl53mFh+9qKQJid6Y4TqoMsczOumowAaYOpUxfxMBiA85exnh+vDeus/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBhenMMRKDdN4yqfS+nOyyP8YygNMDkgSt/Fg1vdA80=;
 b=QQi2gu1YTEY1w33jDRbNgqJGxNx6ao7NK6tMv4kA/VVoFpKewdaHBi+poQj3slLd+3ndLn7PEJMB5u04zxWtR7pTV4uNpuVY2YzHIQu1PeWNABRB1ZFKN1c7HzAEVLg1udPpKU7nSl734vvIcmlvMMxocXUOCgPVl5nx48c3y6gsYG2twzEtl60V+x7F6GwGWvyuTipf+wme1P5esZwu5EiOBIfpnl2OIuJcS5BT/uipytnFMYFPtBKyQPAs7iD7NUMp+zIgzn9jxEEpUkRtQYFiPn3+dZq/DfiJN63GeiAfQjcJgck3KxbaMlcAm0uKooWUoqS14D8OBScXezudGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1849.namprd12.prod.outlook.com (10.175.85.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 13:53:56 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 13:53:56 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 07/10] dma-buf/resv: add new fences container
 implementation
Thread-Topic: [PATCH 07/10] dma-buf/resv: add new fences container
 implementation
Thread-Index: AQHVWOnsnK9vb7rQEEyLLTQVrv3By6cHMDiA
Date: Thu, 22 Aug 2019 13:53:56 +0000
Message-ID: <63a0f99f-f90c-4697-dc7f-be7d596b73e7@amd.com>
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-8-christian.koenig@amd.com>
 <20190821160454.GN11147@phenom.ffwll.local>
 <c1ff88ef-0e49-fd7a-6317-de432a04ddf2@gmail.com>
 <20190822130251.GT11147@phenom.ffwll.local>
In-Reply-To: <20190822130251.GT11147@phenom.ffwll.local>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0101.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::17) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7d765a3-f7b0-491c-3fc5-08d727082ca5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1849; 
x-ms-traffictypediagnostic: DM5PR12MB1849:
x-microsoft-antispam-prvs: <DM5PR12MB1849B9835F93800D5D24BFD383A50@DM5PR12MB1849.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(189003)(199004)(8936002)(316002)(4326008)(8676002)(52116002)(81156014)(81166006)(2616005)(186003)(66574012)(7736002)(14454004)(386003)(6506007)(305945005)(446003)(102836004)(11346002)(476003)(86362001)(25786009)(2906002)(478600001)(99286004)(36756003)(65956001)(5660300002)(31696002)(31686004)(65806001)(53936002)(256004)(6116002)(6246003)(46003)(486006)(6512007)(64756008)(66556008)(6486002)(6436002)(229853002)(6916009)(76176011)(66446008)(66946007)(66476007)(54906003)(58126008)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1849;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oNASpIz4uTU5cQpebnhYekyj6Rl9EBDL5t75nskDWkkJA6JiA81Y0yynZW3yt2QzCv38NOvzdJhIT5YdnW/aoN9nnEsfsmwuAH6ixsdqph40Koy7d2O2OBhQKw8BCMteCQFInP7l2dLrXOolbHAee/T9oKn9bAZ3YLhb8SMdmh1E7hDBzuGY9+933WkLxeMUmfgHDF+hpDizJiRRS0vLhEbztWbs9BLs47HHF4VUxn/BP3gOVR/NdciDVmHOXKdmTBpxgAw4FCcldFdf5JqGfODxswo6a2OFlJ1OlPO9xblEd/BJa1kaJgg7jXGpTOpct5q00LLy/8LZZCxgh8pp4guaLQNJvLqWFjednGTWSeI7YUlGFwg2wsH5sFHYENh7nU4Qv2sYKYr8y4LMIwQimVyXl4GySozLuPSbh/LbBgE=
x-ms-exchange-transport-forked: True
Content-ID: <FF507413CA0754459994DA6C9D03564E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d765a3-f7b0-491c-3fc5-08d727082ca5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 13:53:56.1472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LGKFeKRXV/gzP4u5HTn0OOK0Acub/geZxX+WSjiU1sGpCGcTcV35imLxThtocG5/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1849
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBhenMMRKDdN4yqfS+nOyyP8YygNMDkgSt/Fg1vdA80=;
 b=zqsOJlQENNpsEVeP3ORKb1CndMWUViOXUnbYpAqJ7c4MYZ6m4Dpx+8gxcm/it3MZb+ywvDSlcaiKKeDRmvcZVGl/YSJKSYfwPjoGLaJUqDA80pbboMz+Qwj+k9zKYtcxCHyJcdBuk8osNHHEpp2aiNXvgsWpSgi3vNR2F56PgDY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDguMTkgdW0gMTU6MDIgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBUaHUsIEF1
ZyAyMiwgMjAxOSBhdCAxMDoyMzoyOUFNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0K
Pj4gQW0gMjEuMDguMTkgdW0gMTg6MDQgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPj4+IE9uIFdl
ZCwgQXVnIDIxLCAyMDE5IGF0IDAyOjMxOjQ0UE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3Jv
dGU6DQo+Pj4+IFtTTklQXQ0KPj4+PiArCS8qIFRyeSB0byBkcm9wIHRoZSBsYXN0IHJlZmVyZW5j
ZSAqLw0KPj4+PiArCWlmICghZG1hX2ZlbmNlX2FycmF5X3JlY3ljbGUoc3RhZ2VkKSkNCj4+PiBX
aXRob3V0IGFuIHJjdSBiYXJyaWVyIGhlcmUgeW91J3JlIG5vdCBzeW5jaW5nIHRvIG5ldyBjbGll
bnRzIGF0IGFsbC4NCj4+PiBJIGRvbid0IHRoaW5rIHRoaXMgd29ya3MsIGFuZCBJIGV4cGVjdCB0
aGF0IG9uY2UgeW91J3ZlIHJlYWRkZWQgYWxsIHRoZQ0KPj4+IGJhcnJpZXJzIGFuZCByZXRyeSBs
b29wcyB3ZSdyZSBiYWNrIHRvIHNlcWxvY2tzLg0KPj4gVGhlIGtleSBkaWZmZXJlbmNlIGlzIHRo
YXQgUkNVIHVzZXJzIG5vdyB1c2UgZG1hX2ZlbmNlX2dldF9yY3Vfc2FmZSgpIHRvDQo+PiBncmFi
IGEgcmVmZXJlbmNlIHRvIHRoZSBjdXJyZW50IHNldCBvZiBmZW5jZXMuDQo+Pg0KPj4gSW4gb3Ro
ZXIgd29yZHMgdGhlIHdob2xlIGFycmF5IGlzIHJlZmVyZW5jZSBjb3VudGVkIGFuZCBSQ1UgcHJv
dGVjdGVkDQo+PiBpbnN0ZWFkIG9mIGVhY2ggaW5kaXZpZHVhbCBlbnRyeSBpbiB0aGUgYXJyYXku
DQo+Pg0KPj4gVGhpcyB3YXkgeW91IGRvbid0IG5lZWQgdGhlIHNlcXVlbmNlIGNvdW50IGFueSBt
b3JlIGJlY2F1c2UgeW91IGdyYWIgYQ0KPj4gcmVmZXJlbmNlIHRvIGFsbCBvZiB0aGVtIGF0IG9u
Y2UgYW5kIHRoZW4gY2FuIGJlIHN1cmUgdGhhdCB0aGV5IGRvbid0DQo+PiBjaGFuZ2UuDQo+IEht
IHllYWggLi4uIEkgdGhpbmsgdGhlcmUncyBzdGlsbCBzb21lIHVzZXJzIGxlZnQgdGhhdCBoYXZl
IGFuIG9wZW4tY29kZWQNCj4gcmN1IHNlY3Rpb24gdGhvdWdoLiBCdXQgeWVhaCBpZiB5b3UgY2Fu
IGNvbmNpbmNlIENocmlzIHRoYXQgdGhpcyBpcyBvayBJDQo+IHRoaW5rIGl0IG1ha2VzIHNlbnNl
IGFzIGFuIG92ZXJhbGwgY2xlYW51cCBvZiB0aGUgaGFuZC1yb2xsZWQgZmVuY2VzIGFycmF5DQo+
IHdlIGhhdmUgZm9yIHNoYXJlZCBmZW5jZXMuIEJ1dCBJJ2QgcmVhbGx5IGxpa2UgdG8gdW50YW5n
bGUgaXQgZnJvbSB0aGUNCj4gZW50aXJlIHNlbWFudGljcyBkaXNjdXNzaW9uLCBzaW5jZSB0aGF0
IHNlZW1zIGVudGlyZWx5IHVucmVsYXRlZC4NCg0KWWVhaCwgYWdyZWUuIFRvIHVudGFuZ2xlIHRo
YXQgaXMgYSByZWFsbHkgZ29vZCBpZGVhLg0KDQpHb2luZyB0byBzZW5kIG91dCB0aGUgZG1hX2Zl
bmNlX2FycmF5IGFzIGEgcmVwbGFjZW1lbnQgZm9yIHNoYXJlZCBmZW5jZXMgDQpzZXBhcmF0ZWx5
IGZpcnN0Lg0KDQpDaHJpc3RpYW4uDQoNCj4gLURhbmllbA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
