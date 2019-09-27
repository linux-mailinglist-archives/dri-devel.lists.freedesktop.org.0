Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2CFC050B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 14:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89DD6E095;
	Fri, 27 Sep 2019 12:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700075.outbound.protection.outlook.com [40.107.70.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53016E02E;
 Fri, 27 Sep 2019 12:20:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiknVTH4fFURapxR9eZPixE1AZaLb4f8rd5iNMQNG3IKCcDDmU7/fegPUz/iXG4rghzfIJKWNHZ4+k5KtpzcejXsoYKgzVE5IMDKlv7zNkXKD/Dq1cYRWtQVV3IlfFuzhJEarAQJfX+dIOqRczWfiLGoPpvQHM9MgIFnfmzQRbxq03+T8FHxbf2u9BqtRj0O1P3yEM0/UhD7GJ1qLZfjBtcy4p93GcjWmai5RyUHS90ZBfbekUqA8e0DiQg+XncG2XLWMqM7CuhnOmfi4xcheqjTdZfea295RSTVwMbKzdWjI8X352meZ2XqzPsyshh6zDXZytqThIDHYTaN4b9D6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxiFzPUIeoTmjCHYKVkXlyPkWylymNE+CROTwbFd3lo=;
 b=mr8tI8qzozOCThu0rqCQWe3KO3d/Im1B8APmWxYNgsAT9XHe92vc+yLMPWJrA+hBV2/RnAT/DRnLYq/goms/Jwl/pXq2sOGUgapmSAJnFWkax7Cc3EUET9qAp1tJcGdpTcbOI4f5OReOe02OYZt9G27mCKhdwZsSgWZLH6e3njX7GYbp0OD6UiwW66Iqjds5fk1gR0EgfkuttWw419ykzFC51GRaV7oJiS0lsqsAu6fBFUFMoKgZeGpDou0I5+9/Zvu8HcFwbj/JVKi/QaKaEV3wSZy6Ml88oFIQDBAa/ShVn0rAhUH6OApI/JDagg8W8ehbrHyx70uTWCw6mKqvcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1387.namprd12.prod.outlook.com (10.168.233.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 27 Sep 2019 12:19:57 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2284.028; Fri, 27 Sep 2019
 12:19:56 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] Is Nouveau really using the io_reserve_lru?
Thread-Topic: [Nouveau] Is Nouveau really using the io_reserve_lru?
Thread-Index: AQHVdLOVmzxUVHyeokCP/kHvcrRS0qc/clGA
Date: Fri, 27 Sep 2019 12:19:56 +0000
Message-ID: <5a7cdfa3-7c0c-c84e-6811-4ab6e9e69f57@amd.com>
References: <ec6739a5-af3a-0aeb-fdae-dd11d6b2ec1f@gmail.com>
 <CACAvsv7jwLeY04SyaGjPcRN-ZPaGdVUUY6tC5q33kSsdwJumdg@mail.gmail.com>
In-Reply-To: <CACAvsv7jwLeY04SyaGjPcRN-ZPaGdVUUY6tC5q33kSsdwJumdg@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR10CA0050.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::30) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e8840db-2cb7-4677-ceb8-08d743450225
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1387:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1387D1EC091099431BDE9BC783810@DM5PR12MB1387.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(199004)(189003)(7736002)(14454004)(305945005)(66446008)(66556008)(66476007)(66946007)(64756008)(6436002)(58126008)(8936002)(2906002)(6486002)(229853002)(6512007)(6306002)(6916009)(6116002)(36756003)(8676002)(316002)(256004)(54906003)(478600001)(81166006)(81156014)(71190400001)(71200400001)(4326008)(966005)(2616005)(186003)(25786009)(102836004)(31696002)(6506007)(386003)(6246003)(5660300002)(31686004)(11346002)(86362001)(99286004)(446003)(486006)(65956001)(65806001)(476003)(1411001)(66574012)(46003)(52116002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1387;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C7rrAXWzfLRYV6Wm5WdYbTu7oO0sqD3yqNVoY+Rd2bx0h+gtNKCJ9eUVHJF2Yd4kzF/SneuK1ry8GDKrSGoeTJxX1RRdOimPC9ET6sl/vK3Hj8K0YaetN3y+h/N8EO5uKV9rSwTBk93p5H8AZXjVZDHLOVohEB87H06cN24QJA5fz9WeGmpPiioQqDbt76oFUvzVLLtvt845H7HF8vMVDl+JP87eHR4C8CCslUWupnXg7mk/MjLL7FSIJMQwjkrkOra5FBSccOOE84SLmZb8MPVgkEWkcJopGXwI38v4e9ok9A3wL2MVfdaldpF13mBUU4ZtqCuv0wk5S3fyasocaMY9BFEv980h+wVarO5TSmkRrOl3hQkEtHj0jsbGc1vD3f79iAv3J04bun91Ec0Z8KmC9RMG/iq9h1TTCCZp6N7Q03Llj0Do7endYkkL3qrJpXmAei5AWXdUhjmDpeJN6g==
x-ms-exchange-transport-forked: True
Content-ID: <4AA03121F6426A4A9EB2E29CFF3B7526@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8840db-2cb7-4677-ceb8-08d743450225
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 12:19:56.7009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +lejxFvNzqPKVCdLFOSfwWhKvNNhkRPguYJ7H9mDigFdTkc8w6RpSkizManpHPRB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1387
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxiFzPUIeoTmjCHYKVkXlyPkWylymNE+CROTwbFd3lo=;
 b=ViVUe8bG7rrjvROsEnaFRGvAvIX+CA399gAn463uHPFBzuAa6QILCggVJjUw3NhgSkbx5rPWYR538lq5cxROYJS9cT3vJs21TO//YjfSkZwrg9EalKEH1xrMuMEwS2B87L5yT5JZb5AFuwYUFlBJtDeVlUIXZMuAqBxuXY6lz/E=
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
Cc: Dave Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjYuMDkuMTkgdW0gMjM6NDQgc2NocmllYiBCZW4gU2tlZ2dzOg0KPiBPbiBUdWUsIDI0IFNl
cCAyMDE5IGF0IDIyOjE5LCBDaHJpc3RpYW4gS8O2bmlnDQo+IDxja29lbmlnLmxlaWNodHp1bWVy
a2VuQGdtYWlsLmNvbT4gd3JvdGU6DQo+PiBIaSBndXlzLA0KPj4NCj4+IHdoaWxlIHdvcmtpbmcg
dGhyb3VnaCBtb3JlIG9sZCBUVE0gZnVuY3Rpb25hbGl0eSBJIHN0dW1ibGVkIG92ZXIgdGhlDQo+
PiBpb19yZXNlcnZlX2xydS4NCj4+DQo+PiBCYXNpYyBpZGVhIGlzIHRoYXQgd2hlbiB0aGlzIGZs
YWcgaXMgc2V0IHRoZSBkcml2ZXItPmlvX21lbV9yZXNlcnZlKCkNCj4+IGNhbGxiYWNrIGNhbiBy
ZXR1cm4gLUVBR0FJTiByZXN1bHRpbmcgaW4gdW5tYXBwaW5nIG9mIG90aGVyIEJPcy4NCj4+DQo+
PiBCdXQgTm91dmVhdSBkb2Vzbid0IHNlZW0gdG8gcmV0dXJuIC1FQUdBSU4gaW4gdGhlIGNhbGwg
cGF0aCBvZg0KPj4gaW9fbWVtX3Jlc2VydmUgYW55d2hlcmUuDQo+IEkgYmVsaWV2ZSB0aGlzIGlz
IGEgYnVnIGluIE5vdXZlYXUuICBXZSAqc2hvdWxkKiBiZSByZXR1cm5pbmcgLUVBR0FJTg0KPiBp
ZiB3ZSBmYWlsIHRvIGZpbmQgc3BhY2UgaW4gQkFSMSB0byBtYXAgdGhlIEJPIGludG8uDQoNClll
YWgsIHRob3VnaHQgdGhhdCB0aGlzIGlzIHJhdGhlciBvZGQuIEJ1dCBJIGNhbid0IGZpeCBpdCBz
aW5jZSBJIGRvbid0IA0KcmVhbGx5IGtub3cgdGhlIGNvZGUuDQoNCk9uIHRoZSBvdGhlciBoYW5k
IGRvIHlvdSBoYXZlIGFueSBvYmplY3Rpb25zIHRoYXQgSSBtb3ZlIHRoZSByZW1haW5pbmcgDQpp
b19yZXNlcnZlX2xydSBmdW5jdGlvbmFsaXR5IGludG8gTm91dmVhdSB0aGVuPw0KDQpJdCdzIG9u
bHkgdXNlZCBieSB0aGlzIGRyaXZlciBhbmQgc2luY2UgVGhvbWFzIGNsZWFuZWQgdXAgdGhlIFZN
IA0KaGFuZGxpbmcgdGhhdCBzaG91bGRuJ3QgYmUgYSBwcm9ibGVtIGFueSBtb3JlLg0KDQpUaGFu
a3MsDQpDaHJpc3RpYW4uDQoNCj4NCj4gQmVuLg0KPj4gU28gaXMgdGhpcyB1bnVzZWQgb3IgYW0g
SSBtaXNzaW5nIHNvbWV0aGluZz8NCj4+DQo+PiBSZWdhcmRzLA0KPj4gQ2hyaXN0aWFuLg0KPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IE5vdXZl
YXUgbWFpbGluZyBsaXN0DQo+PiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1DQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
