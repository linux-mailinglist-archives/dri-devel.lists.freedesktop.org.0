Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5001BE16
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 21:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A515F891AA;
	Mon, 13 May 2019 19:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740052.outbound.protection.outlook.com [40.107.74.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7317C891AA;
 Mon, 13 May 2019 19:36:46 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3147.namprd12.prod.outlook.com (20.178.31.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Mon, 13 May 2019 19:36:44 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::588b:cfef:3486:b4e8]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::588b:cfef:3486:b4e8%3]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 19:36:44 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH 2/2] mm/hmm: Only set FAULT_FLAG_ALLOW_RETRY for
 non-blocking
Thread-Topic: [PATCH 2/2] mm/hmm: Only set FAULT_FLAG_ALLOW_RETRY for
 non-blocking
Thread-Index: AQHVB2oH3gumKK8uVkW/G1cJvzIbZqZkyv6AgASsjwA=
Date: Mon, 13 May 2019 19:36:44 +0000
Message-ID: <65328381-aa0d-353d-68dc-81060e7cebdf@amd.com>
References: <20190510195258.9930-1-Felix.Kuehling@amd.com>
 <20190510195258.9930-3-Felix.Kuehling@amd.com>
 <20190510201403.GG4507@redhat.com>
In-Reply-To: <20190510201403.GG4507@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTOPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::18) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54db876f-28f8-447f-9813-08d6d7da54a0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3147; 
x-ms-traffictypediagnostic: DM6PR12MB3147:
x-microsoft-antispam-prvs: <DM6PR12MB3147ED9719C9D099D3356EA7920F0@DM6PR12MB3147.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39860400002)(396003)(136003)(366004)(199004)(189003)(316002)(186003)(386003)(6506007)(99286004)(53546011)(486006)(54906003)(36756003)(476003)(2616005)(31686004)(4326008)(65826007)(26005)(446003)(81166006)(81156014)(8936002)(68736007)(305945005)(64126003)(102836004)(52116002)(11346002)(76176011)(66946007)(66446008)(7736002)(64756008)(8676002)(66556008)(66476007)(73956011)(58126008)(3846002)(31696002)(72206003)(66066001)(65956001)(65806001)(25786009)(14444005)(256004)(6916009)(2906002)(66574012)(53936002)(86362001)(478600001)(6512007)(14454004)(6116002)(5660300002)(6246003)(6486002)(6436002)(71200400001)(229853002)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3147;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xtCmRtRX8qvezYD0C/2KBsrrFqaEcen/9ducUxh5FKbClTQLZrhqok4DuVYPSgDweH3Cza3datDZbuzxJb0HuAlrZLUIhrdUaie9pZICviF1VeNWoi1mMZrMePRWCUAM+mBz7+H8uDE8y0wQlrJb15YSjZ/l0PnxxPXPzObsy19Cad7OqAGtIx7pZRaMfKbEQrt8c5VHf7Kz0foD9tafAQ+qh/iGTUUUS3SXLn8XhMgGidTo1qzepmDI4hfYpW5S9YpEPEycXQPcjRc9jIrBBoRHeM9/budQv34AUnDt9shkOI1mc5VGAo/5mlr+A3183afbO83ijaXIoy9bjqLiSMpjXkn8+AWuvtD3RmWfpAOtvVvx80ojDMNox+lWC9IxOd3TRePaLLMnhEBQ/u8DhyHaN3ZLQhAMQor60u7u/+Q=
Content-ID: <F23F16F4B7922A47828A8106EEABCBED@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54db876f-28f8-447f-9813-08d6d7da54a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 19:36:44.6069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3147
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HABMcRelqMS5oBSAN5KyvNh36xqRR1P2RUklZ7s8lVQ=;
 b=kK7wIRhmkTZ53DvHPuSxa61ylKDxfYsvznye6cJqIXxfxdz8piiNKua8vFP9TXPqD8wNTB9JGZkFrYuVowCj8xFUsotFlF/uAwmwYw9FTEoDtzAXyT5lvuquzYhH2w1LPoyFii5jUEMN2Wlses07Md4T2KUkS1dIMPnSCGzaUiU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alex.deucher@amd.com" <alex.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmVyb21lLA0KDQpEbyB5b3Ugd2FudCBtZSB0byBwdXNoIHRoZSBwYXRjaGVzIHRvIHlvdXIg
YnJhbmNoPyBPciBhcmUgeW91IGdvaW5nIHRvIA0KYXBwbHkgdGhlbSB5b3Vyc2VsZj8NCg0KSXMg
eW91ciBobW0tNS4yLXYzIGJyYW5jaCBnb2luZyB0byBtYWtlIGl0IGludG8gTGludXggNS4yPyBJ
ZiBzbywgZG8geW91IA0Ka25vdyB3aGVuPyBJJ2QgbGlrZSB0byBjb29yZGluYXRlIHdpdGggRGF2
ZSBBaXJsaWUgc28gdGhhdCB3ZSBjYW4gYWxzbyANCmdldCB0aGF0IHVwZGF0ZSBpbnRvIGEgZHJt
LW5leHQgYnJhbmNoIHNvb24uDQoNCkkgc2VlIHRoYXQgTGludXMgbWVyZ2VkIERhdmUncyBwdWxs
IHJlcXVlc3QgZm9yIExpbnV4IDUuMiwgd2hpY2ggDQppbmNsdWRlcyB0aGUgZmlyc3QgY2hhbmdl
cyBpbiBhbWRncHUgdXNpbmcgSE1NLiBUaGV5J3JlIGN1cnJlbnRseSBicm9rZW4gDQp3aXRob3V0
IHRoZXNlIHR3byBwYXRjaGVzLg0KDQpUaGFua3MsDQogwqAgRmVsaXgNCg0KT24gMjAxOS0wNS0x
MCA0OjE0IHAubS4sIEplcm9tZSBHbGlzc2Ugd3JvdGU6DQo+IFtDQVVUSU9OOiBFeHRlcm5hbCBF
bWFpbF0NCj4NCj4gT24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDc6NTM6MjRQTSArMDAwMCwgS3Vl
aGxpbmcsIEZlbGl4IHdyb3RlOg0KPj4gRG9uJ3Qgc2V0IHRoaXMgZmxhZyBieSBkZWZhdWx0IGlu
IGhtbV92bWFfZG9fZmF1bHQuIEl0IGlzIHNldA0KPj4gY29uZGl0aW9uYWxseSBqdXN0IGEgZmV3
IGxpbmVzIGJlbG93LiBTZXR0aW5nIGl0IHVuY29uZGl0aW9uYWxseQ0KPj4gY2FuIGxlYWQgdG8g
aGFuZGxlX21tX2ZhdWx0IGRvaW5nIGEgbm9uLWJsb2NraW5nIGZhdWx0LCByZXR1cm5pbmcNCj4+
IC1FQlVTWSBhbmQgdW5sb2NraW5nIG1tYXBfc2VtIHVuZXhwZWN0ZWRseS4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4gUmV2
aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPg0KPg0KPj4gLS0t
DQo+PiAgIG1tL2htbS5jIHwgMiArLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0u
Yw0KPj4gaW5kZXggYjY1YzI3ZDVjMTE5Li4zYzRmMWQ2MjIwMmYgMTAwNjQ0DQo+PiAtLS0gYS9t
bS9obW0uYw0KPj4gKysrIGIvbW0vaG1tLmMNCj4+IEBAIC0zMzksNyArMzM5LDcgQEAgc3RydWN0
IGhtbV92bWFfd2FsayB7DQo+PiAgIHN0YXRpYyBpbnQgaG1tX3ZtYV9kb19mYXVsdChzdHJ1Y3Qg
bW1fd2FsayAqd2FsaywgdW5zaWduZWQgbG9uZyBhZGRyLA0KPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYm9vbCB3cml0ZV9mYXVsdCwgdWludDY0X3QgKnBmbikNCj4+ICAgew0KPj4gLSAg
ICAgdW5zaWduZWQgaW50IGZsYWdzID0gRkFVTFRfRkxBR19BTExPV19SRVRSWSB8IEZBVUxUX0ZM
QUdfUkVNT1RFOw0KPj4gKyAgICAgdW5zaWduZWQgaW50IGZsYWdzID0gRkFVTFRfRkxBR19SRU1P
VEU7DQo+PiAgICAgICAgc3RydWN0IGhtbV92bWFfd2FsayAqaG1tX3ZtYV93YWxrID0gd2Fsay0+
cHJpdmF0ZTsNCj4+ICAgICAgICBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSA9IGhtbV92bWFfd2Fs
ay0+cmFuZ2U7DQo+PiAgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEgPSB3YWxrLT52
bWE7DQo+PiAtLQ0KPj4gMi4xNy4xDQo+Pg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
