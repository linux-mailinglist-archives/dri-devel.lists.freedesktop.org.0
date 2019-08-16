Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A5C90809
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 21:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4E06E985;
	Fri, 16 Aug 2019 19:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820053.outbound.protection.outlook.com [40.107.82.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF47C6E985
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 19:02:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOqM6+D1C0g9UuKNiz9zb2dD8BDThT8FEBUKw4o68rhGsR7u9DjLyqqLHKaOZTfz4Oos9sPgmDCQdqtz1C5ZCQxS/yUSvC0rQgfJRTgHEcoEKHQucd/NOWthcVyRGCCNdguef9y9PJwoHnE/zsmnrh7aQfC2W5moS6VO65RLi8Gq5bg1hTo68I55wKbMj4BC+1jlc9uTGZJ9sHPHWnZD+79wT3sToGjazFZ6WcQDyvij//qJ8G0ghUqTe1PRjrANNtsgRTifQTihzuB4XCyWf6pHLECbWpAzBmHwHIvyTOQyKjR+mJJwJy/tVUGpRJEQ/nYROYjM4yEgz0ZFnDHIDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwWi34ILakTibxMYgcuF9QcWuXvWlxXXFqzKdDoazy0=;
 b=U6JcrHOPsphwfs0S0GdJngUOid4e7h765n3tKjR6T3truuYdQv9FYfbwZH87OEG+Le4DYoiXTG9I7R7gZisyADdT9oECB8b+Ds/WNY4xqFlZKWgkeJQVTjk8ZOeJH5XgMTZvWEAOSn/4JaD+1Jd9lYPeHaBV2aEX4lTIqR/P8Hs+3Cw1Y4vNB8h/EXVDQO2lCj7y96Fd3bQNl5fuNCIz1+waV4cOcpWHTf+wblVrX7wV3imjU4OqUWjL8BJoiQEkdFLWnynDUAkZrCGyVhmlQAnCUpkLiv0KxM4qPdr4M4bFCSEbcLzH6dz3JGFBupb1axtqN+WVG1upf9Qh2gs5UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1499.namprd12.prod.outlook.com (10.172.36.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Fri, 16 Aug 2019 19:02:49 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 19:02:49 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] dma-fence: Simply wrap dma_fence_signal_locked with
 dma_fence_signal
Thread-Topic: [PATCH 2/2] dma-fence: Simply wrap dma_fence_signal_locked with
 dma_fence_signal
Thread-Index: AQHVVEZbdPaJMBcVC0ydDiO7g937Wab+Ic8A
Date: Fri, 16 Aug 2019 19:02:49 +0000
Message-ID: <77eab42b-2404-0ba4-b323-948c040c3759@amd.com>
References: <20190816152152.27550-1-chris@chris-wilson.co.uk>
 <20190816152152.27550-2-chris@chris-wilson.co.uk>
In-Reply-To: <20190816152152.27550-2-chris@chris-wilson.co.uk>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: MR2P264CA0106.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::22) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bccca186-cf1f-4062-afaf-08d7227c54e1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1499; 
x-ms-traffictypediagnostic: DM5PR12MB1499:
x-microsoft-antispam-prvs: <DM5PR12MB14997CDA5564F02B444C6C5183AF0@DM5PR12MB1499.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(199004)(189003)(486006)(71190400001)(8936002)(14454004)(81156014)(229853002)(446003)(2616005)(64126003)(476003)(11346002)(6512007)(186003)(25786009)(6116002)(53936002)(46003)(478600001)(65956001)(2906002)(66446008)(81166006)(256004)(64756008)(4326008)(66476007)(65806001)(6506007)(66556008)(66946007)(102836004)(386003)(76176011)(6246003)(52116002)(14444005)(8676002)(305945005)(7736002)(2501003)(86362001)(65826007)(5660300002)(31696002)(31686004)(58126008)(110136005)(316002)(6486002)(66574012)(6436002)(36756003)(99286004)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1499;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: w1IRPURz71sRkwBsbndXNBDhVqa3HuM8sIE+4lI+B95C+NntzTIPtENAr2jZj1NfkWTmsgAWaSJPJHg4sBNVzEz4jM7lRbnrSaXf+1T3uq6y0oMDJOvyCO+ck+V/hJnyLK7ggTd7Q/ifYsaRtqCtO0oksPe4EyVJYz30V0sIT3YVOCUn/9oBFzvrdjF0eqNd9kiJU+j8mU2HZm/UVFDfcY8qzFpA/01HUJ9JAGJcqX1ymnXHZKlfcZnHcNxM+U9Hi9YHrkfSOVW8Nycxmd0vAXm/dr/gxd8lpi+g/QMuW/lv6SelO5MFzNWMUkYBxPHSdP6nh7hT+THajj3WsyNj1mUVjTfGoAuVkc8PsK73YcXuntMyZeJNo5jyBTGnurTeA4S12GRhbtyirct+J8oxBVdhTHMSA9RcTiWBbN4WJ28=
x-ms-exchange-transport-forked: True
Content-ID: <AED9FFA794C2404FB7281330374C7D76@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bccca186-cf1f-4062-afaf-08d7227c54e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 19:02:49.9016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YJDxRXLjJKSuWA0RbKSmmbZWc01vGoOEEfCozs2zBt+wyigCRaEcLLVt27qOv1v6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1499
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwWi34ILakTibxMYgcuF9QcWuXvWlxXXFqzKdDoazy0=;
 b=XvY3aGhGfrvi8POiQeidpOouIp9wM+wXHLWmkVmZJGPudFDy4CCVExBh06/7GPLDU/8SHM8Angs+TxJZ0em6lSCiAatQfUM9gVOFLLeDgl5Woa/oTlVc1ki4QPFRpDjlmfhbJ/+PbKhQw9ZLK2s7P+NeHh1lFM4mofYQaQu8RY8=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMDguMTkgdW0gMTc6MjEgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IEN1cnJlbnRseSBk
bWFfZmVuY2Vfc2lnbmFsKCkgdHJpZXMgdG8gYXZvaWQgdGhlIHNwaW5sb2NrIGFuZCBvbmx5IHRh
a2VzDQo+IGl0IGlmIGFic29sdXRlbHkgcmVxdWlyZWQgdG8gd2FsayB0aGUgY2FsbGJhY2sgbGlz
dC4gSG93ZXZlciwgdG8gYWxsb3cNCj4gZm9yIHNvbWUgdXNlcnMgdG8gc3VycmVwdGl0aW91c2x5
IGluc2VydCBsYXp5IHNpZ25hbCBjYWxsYmFja3MgdGhhdA0KPiBkbyBub3QgZGVwZW5kIG9uIGVu
YWJsaW5nIHRoZSBzaWduYWxpbmcgbWVjaGFuaXNtIGFyb3VuZCBldmVyeSBmZW5jZSwNCj4gd2Ug
YWx3YXlzIG5lZWQgdG8gbm90aWZ5IHRoZSBjYWxsYmFja3Mgb24gc2lnbmFsaW5nLiBBcyBzdWNo
LCB3ZSB3aWxsDQo+IGFsd2F5cyBuZWVkIHRvIHRha2UgdGhlIHNwaW5sb2NrIGFuZCBkbWFfZmVu
Y2Vfc2lnbmFsKCkgZWZmZWN0aXZlbHkNCj4gYmVjb21lcyBhIGNsb25lIG9mIGRtYV9mZW5jZV9z
aWduYWxfbG9ja2VkKCkuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPg0KPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPg0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4NCj4gLS0tDQo+ICAgZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jIHwgMTkgKysrKystLS0t
LS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDE0IGRlbGV0
aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jIGIv
ZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jDQo+IGluZGV4IGZmMGNkNmVhZTc2Ni4uZjIzZWI5
ZjE5YjRlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMNCj4gKysr
IGIvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jDQo+IEBAIC0xNzYsNiArMTc2LDcgQEAgRVhQ
T1JUX1NZTUJPTChkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZCk7DQo+ICAgaW50IGRtYV9mZW5jZV9z
aWduYWwoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpDQo+ICAgew0KPiAgIAl1bnNpZ25lZCBsb25n
IGZsYWdzOw0KPiArCWludCByZXQ7DQo+ICAgDQo+ICAgCWlmICghZmVuY2UpDQo+ICAgCQlyZXR1
cm4gLUVJTlZBTDsNCj4gQEAgLTE4MywyMSArMTg0LDExIEBAIGludCBkbWFfZmVuY2Vfc2lnbmFs
KHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKQ0KPiAgIAlpZiAodGVzdF9hbmRfc2V0X2JpdChETUFf
RkVOQ0VfRkxBR19TSUdOQUxFRF9CSVQsICZmZW5jZS0+ZmxhZ3MpKQ0KPiAgIAkJcmV0dXJuIC1F
SU5WQUw7DQoNCkkgbmVlZCB0byB0YWtlIG15IHJldmlldyBiYWNrLiBZb3UgYWxzbyBuZWVkIHRv
IGRyb3AgdGhpcyANCnRlc3RfYW5kX3NldF9iaXQgaGVyZSBvciB5b3VyIGNvbXBsZXRlbHkgYnJl
YWsgZHJpdmVycyB1c2luZyB0aGlzLg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQo+ICAgDQo+
IC0JZmVuY2UtPnRpbWVzdGFtcCA9IGt0aW1lX2dldCgpOw0KPiAtCXNldF9iaXQoRE1BX0ZFTkNF
X0ZMQUdfVElNRVNUQU1QX0JJVCwgJmZlbmNlLT5mbGFncyk7DQo+IC0JdHJhY2VfZG1hX2ZlbmNl
X3NpZ25hbGVkKGZlbmNlKTsNCj4gLQ0KPiAtCWlmICh0ZXN0X2JpdChETUFfRkVOQ0VfRkxBR19F
TkFCTEVfU0lHTkFMX0JJVCwgJmZlbmNlLT5mbGFncykpIHsNCj4gLQkJc3RydWN0IGRtYV9mZW5j
ZV9jYiAqY3VyLCAqdG1wOw0KPiArCXNwaW5fbG9ja19pcnFzYXZlKGZlbmNlLT5sb2NrLCBmbGFn
cyk7DQo+ICsJcmV0ID0gZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQoZmVuY2UpOw0KPiArCXNwaW5f
dW5sb2NrX2lycXJlc3RvcmUoZmVuY2UtPmxvY2ssIGZsYWdzKTsNCj4gICANCj4gLQkJc3Bpbl9s
b2NrX2lycXNhdmUoZmVuY2UtPmxvY2ssIGZsYWdzKTsNCj4gLQkJbGlzdF9mb3JfZWFjaF9lbnRy
eV9zYWZlKGN1ciwgdG1wLCAmZmVuY2UtPmNiX2xpc3QsIG5vZGUpIHsNCj4gLQkJCWxpc3RfZGVs
X2luaXQoJmN1ci0+bm9kZSk7DQo+IC0JCQljdXItPmZ1bmMoZmVuY2UsIGN1cik7DQo+IC0JCX0N
Cj4gLQkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZShmZW5jZS0+bG9jaywgZmxhZ3MpOw0KPiAtCX0N
Cj4gLQlyZXR1cm4gMDsNCj4gKwlyZXR1cm4gcmV0Ow0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9M
KGRtYV9mZW5jZV9zaWduYWwpOw0KPiAgIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
