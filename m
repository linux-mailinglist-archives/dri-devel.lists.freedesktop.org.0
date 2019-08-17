Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D7E911A0
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE2688F78;
	Sat, 17 Aug 2019 15:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820052.outbound.protection.outlook.com [40.107.82.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565126E9E9;
 Sat, 17 Aug 2019 15:25:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+I/alxkAS1RvZL67hrOOOjDyBcEFMWG0YoEXqii8cvLNSfiM5iBKZ4ZNIE2J633iMAdKvfyT/F7Z42Gk3aLBSoFvtFzR6+fWMuwrdn47pTMIcX4kfw1dSN96HGF36UfHgBqjCsfextB2L7aa0lnBSfQL5IylQ8GbQQlTCsE0iStWKmlWIWI+UmUGoFDhOlyCw14vIEf3zu2/FpWu02inI0lEi8oVGXBluZX+jKFdc+xu/A755tkHPX+kduI/v/6lTXq7A/ihHgfMJbNMRP3RYXR7Kg9KpXOag4SUlgz9PzrUuz8QmNm7/rVNif9ZQlEU3wwNS0tGflnSGIFk8dqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjwVx9BvVn8BalvIuYyeIQhD9w1A6iTcBNViRkJk/9I=;
 b=HGiD0gkKXzIDuPPRE4baknECL5aDCbWoIkh/gTpYam/1dg8CuQc7wdACOc8KXskb8SynArx4h2kRKNbidj1K/DLEXs4FFvhAViEUZi3ZAV4TbOkS5hl4L98XTJkFVxtrLM7WEv2T2OwGu7FUCcHv0ru+XvZ3bk/FCUnjO2+fppvkzVMVgzNmthhFJzUyZJ4KPobkzCq1pvYlfOPxTrObAEppKzdHlHLoBfASsm4a/19q+r/xj8mIJfSSWcyrZE33dfGBiz2efjVyyX8fmRYtWROve5bWkrYgJ3egOdCKCbMe8bDrqMYEZqBZDByEiZFRBmbZsoNB+hapHoyLyQ+Ekw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1899.namprd12.prod.outlook.com (10.175.91.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Sat, 17 Aug 2019 15:25:45 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Sat, 17 Aug 2019
 15:25:45 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3] dma-fence: Simply wrap dma_fence_signal_locked with
 dma_fence_signal
Thread-Topic: [PATCH v3] dma-fence: Simply wrap dma_fence_signal_locked with
 dma_fence_signal
Thread-Index: AQHVVQ+sJDtFT+AMSU6Mhsb0HdwQnab/de4A
Date: Sat, 17 Aug 2019 15:25:45 +0000
Message-ID: <bc7d1bda-2103-8ad2-a5cd-a77fd622b075@amd.com>
References: <20190817144736.7826-5-chris@chris-wilson.co.uk>
 <20190817152300.5370-1-chris@chris-wilson.co.uk>
In-Reply-To: <20190817152300.5370-1-chris@chris-wilson.co.uk>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::13) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc0c0f23-d572-4bbc-b70c-08d723272caf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1899; 
x-ms-traffictypediagnostic: DM5PR12MB1899:
x-microsoft-antispam-prvs: <DM5PR12MB18990C317BCB600894628BB983AE0@DM5PR12MB1899.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0132C558ED
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(199004)(189003)(6116002)(305945005)(256004)(64126003)(71190400001)(6246003)(71200400001)(81156014)(25786009)(8936002)(186003)(7736002)(53936002)(65826007)(58126008)(54906003)(6436002)(99286004)(8676002)(6486002)(81166006)(446003)(46003)(6506007)(316002)(52116002)(229853002)(14454004)(478600001)(36756003)(6512007)(86362001)(66574012)(76176011)(31686004)(11346002)(476003)(2501003)(110136005)(4326008)(31696002)(65806001)(65956001)(102836004)(486006)(66556008)(64756008)(14444005)(2906002)(66446008)(66476007)(5660300002)(386003)(66946007)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1899;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5T09AfvuOMvNm2BQEJGsqr/E1jYzaeaWco+7V6F04t8rBsR5La4smv1lTOdYWHsE3Vwd3D3fdpQB0Y3EGH7BIVkRWDPjW7KzupNUaWB+i5BHCmRyi8MR1foQDuugjk65eZVLgq9UmbeTIZgeSfAdSoff5s5GFKxyfESykCX0IB+g5cBl7M4UJRg6idtqgMf71uhNYWUdR+wYX6rQJqb7fqb+Q1MWMeRu52LI569g57F4iOjC94p6NEt9wGI4rRRob5dVb3MXbE72Oe1xcvOab5VboeUDTsEWz80jP0hJ1x2pFCX0VCvnZXSZsbLxzViEfG8Y/ofhbwZa8vXIjUAjA+nWhHLHEKukl9otu2f10vwEZQ9GX0JptJ58J2uZmDLD5SQUE+Cxs7GSJ6P8smcvuUvYZWBaA5wH71/7y66X/nY=
x-ms-exchange-transport-forked: True
Content-ID: <8B6F3954377EC140AD0DC9C7E3200B59@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0c0f23-d572-4bbc-b70c-08d723272caf
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2019 15:25:45.7973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d2tcDGeaXTdGG6uqfNRlD58yi+DEtGS3bSpq7IqLOwT2JMlmKGDpl5R8N7skbckJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1899
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjwVx9BvVn8BalvIuYyeIQhD9w1A6iTcBNViRkJk/9I=;
 b=X/kwDhrckG6scgHvJpQr8tT0jG9nT+L6/0IR+s+kmYk3ZwQDC9EZHn8E28jxU/1dnOs+RwgpverueBGYcTOGqcova0TL+1BEgPq0k3qdQagpUPaZtuMGWIYg04BRTymGV0lEDBzX5LC1cfpkARxVZEpxayi7HXWgX/HKUQcUFZM=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDguMTkgdW0gMTc6MjMgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IEN1cnJlbnRseSBk
bWFfZmVuY2Vfc2lnbmFsKCkgdHJpZXMgdG8gYXZvaWQgdGhlIHNwaW5sb2NrIGFuZCBvbmx5IHRh
a2VzDQo+IGl0IGlmIGFic29sdXRlbHkgcmVxdWlyZWQgdG8gd2FsayB0aGUgY2FsbGJhY2sgbGlz
dC4gSG93ZXZlciwgdG8gYWxsb3cNCj4gZm9yIHNvbWUgdXNlcnMgdG8gc3VycmVwdGl0aW91c2x5
IGluc2VydCBsYXp5IHNpZ25hbCBjYWxsYmFja3MgdGhhdA0KPiBkbyBub3QgZGVwZW5kIG9uIGVu
YWJsaW5nIHRoZSBzaWduYWxpbmcgbWVjaGFuaXNtIGFyb3VuZCBldmVyeSBmZW5jZSwNCj4gd2Ug
YWx3YXlzIG5lZWQgdG8gbm90aWZ5IHRoZSBjYWxsYmFja3Mgb24gc2lnbmFsaW5nLiBBcyBzdWNo
LCB3ZSB3aWxsDQo+IGFsd2F5cyBuZWVkIHRvIHRha2UgdGhlIHNwaW5sb2NrIGFuZCBkbWFfZmVu
Y2Vfc2lnbmFsKCkgZWZmZWN0aXZlbHkNCj4gYmVjb21lcyBhIGNsb25lIG9mIGRtYV9mZW5jZV9z
aWduYWxfbG9ja2VkKCkuDQo+DQo+IHYyOiBVcGRhdGUgdGhlIHRlc3RfYW5kX3NldF9iaXQoKSBi
ZWZvcmUgZW50ZXJpbmcgdGhlIHNwaW5sb2NrLg0KPiB2MzogRHJvcCB0aGUgdGVzdF9bYW5kX3Nl
dF1fYml0KCkgYmVmb3JlIHRoZSBzcGlubG9jaywgaXQncyBhIGNhbGxlcg0KPiBlcnJvciBzbyBl
eHBlY3RlZCB0byBiZSB2ZXJ5IHVubGlrZWx5Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBX
aWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4NCj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5j
ZS5jIHwgNDQgKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEt
ZmVuY2UuYw0KPiBpbmRleCBmZjBjZDZlYWU3NjYuLjhhNmQwMjUwMjg1ZCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jDQo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9k
bWEtZmVuY2UuYw0KPiBAQCAtMTI5LDI1ICsxMjksMTYgQEAgRVhQT1JUX1NZTUJPTChkbWFfZmVu
Y2VfY29udGV4dF9hbGxvYyk7DQo+ICAgaW50IGRtYV9mZW5jZV9zaWduYWxfbG9ja2VkKHN0cnVj
dCBkbWFfZmVuY2UgKmZlbmNlKQ0KPiAgIHsNCj4gICAJc3RydWN0IGRtYV9mZW5jZV9jYiAqY3Vy
LCAqdG1wOw0KPiAtCWludCByZXQgPSAwOw0KPiAgIA0KPiAgIAlsb2NrZGVwX2Fzc2VydF9oZWxk
KGZlbmNlLT5sb2NrKTsNCj4gICANCj4gLQlpZiAoV0FSTl9PTighZmVuY2UpKQ0KPiArCWlmICh1
bmxpa2VseSh0ZXN0X2FuZF9zZXRfYml0KERNQV9GRU5DRV9GTEFHX1NJR05BTEVEX0JJVCwNCj4g
KwkJCQkgICAgICAmZmVuY2UtPmZsYWdzKSkpDQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gICAN
Cj4gLQlpZiAodGVzdF9hbmRfc2V0X2JpdChETUFfRkVOQ0VfRkxBR19TSUdOQUxFRF9CSVQsICZm
ZW5jZS0+ZmxhZ3MpKSB7DQo+IC0JCXJldCA9IC1FSU5WQUw7DQo+IC0NCj4gLQkJLyoNCj4gLQkJ
ICogd2UgbWlnaHQgaGF2ZSByYWNlZCB3aXRoIHRoZSB1bmxvY2tlZCBkbWFfZmVuY2Vfc2lnbmFs
LA0KPiAtCQkgKiBzdGlsbCBydW4gdGhyb3VnaCBhbGwgY2FsbGJhY2tzDQo+IC0JCSAqLw0KPiAt
CX0gZWxzZSB7DQo+IC0JCWZlbmNlLT50aW1lc3RhbXAgPSBrdGltZV9nZXQoKTsNCj4gLQkJc2V0
X2JpdChETUFfRkVOQ0VfRkxBR19USU1FU1RBTVBfQklULCAmZmVuY2UtPmZsYWdzKTsNCj4gLQkJ
dHJhY2VfZG1hX2ZlbmNlX3NpZ25hbGVkKGZlbmNlKTsNCj4gLQl9DQo+ICsJZmVuY2UtPnRpbWVz
dGFtcCA9IGt0aW1lX2dldCgpOw0KPiArCXNldF9iaXQoRE1BX0ZFTkNFX0ZMQUdfVElNRVNUQU1Q
X0JJVCwgJmZlbmNlLT5mbGFncyk7DQo+ICsJdHJhY2VfZG1hX2ZlbmNlX3NpZ25hbGVkKGZlbmNl
KTsNCj4gICANCj4gICAJaWYgKCFsaXN0X2VtcHR5KCZmZW5jZS0+Y2JfbGlzdCkpIHsNCj4gICAJ
CWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShjdXIsIHRtcCwgJmZlbmNlLT5jYl9saXN0LCBub2Rl
KSB7DQo+IEBAIC0xNTYsNyArMTQ3LDggQEAgaW50IGRtYV9mZW5jZV9zaWduYWxfbG9ja2VkKHN0
cnVjdCBkbWFfZmVuY2UgKmZlbmNlKQ0KPiAgIAkJfQ0KPiAgIAkJSU5JVF9MSVNUX0hFQUQoJmZl
bmNlLT5jYl9saXN0KTsNCj4gICAJfQ0KPiAtCXJldHVybiByZXQ7DQo+ICsNCj4gKwlyZXR1cm4g
MDsNCj4gICB9DQo+ICAgRVhQT1JUX1NZTUJPTChkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZCk7DQo+
ICAgDQo+IEBAIC0xNzYsMjggKzE2OCwxNiBAQCBFWFBPUlRfU1lNQk9MKGRtYV9mZW5jZV9zaWdu
YWxfbG9ja2VkKTsNCj4gICBpbnQgZG1hX2ZlbmNlX3NpZ25hbChzdHJ1Y3QgZG1hX2ZlbmNlICpm
ZW5jZSkNCj4gICB7DQo+ICAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICsJaW50IHJldDsNCj4g
ICANCj4gICAJaWYgKCFmZW5jZSkNCj4gICAJCXJldHVybiAtRUlOVkFMOw0KPiAgIA0KPiAtCWlm
ICh0ZXN0X2FuZF9zZXRfYml0KERNQV9GRU5DRV9GTEFHX1NJR05BTEVEX0JJVCwgJmZlbmNlLT5m
bGFncykpDQo+IC0JCXJldHVybiAtRUlOVkFMOw0KPiAtDQo+IC0JZmVuY2UtPnRpbWVzdGFtcCA9
IGt0aW1lX2dldCgpOw0KPiAtCXNldF9iaXQoRE1BX0ZFTkNFX0ZMQUdfVElNRVNUQU1QX0JJVCwg
JmZlbmNlLT5mbGFncyk7DQo+IC0JdHJhY2VfZG1hX2ZlbmNlX3NpZ25hbGVkKGZlbmNlKTsNCj4g
LQ0KPiAtCWlmICh0ZXN0X2JpdChETUFfRkVOQ0VfRkxBR19FTkFCTEVfU0lHTkFMX0JJVCwgJmZl
bmNlLT5mbGFncykpIHsNCj4gLQkJc3RydWN0IGRtYV9mZW5jZV9jYiAqY3VyLCAqdG1wOw0KPiAr
CXNwaW5fbG9ja19pcnFzYXZlKGZlbmNlLT5sb2NrLCBmbGFncyk7DQo+ICsJcmV0ID0gZG1hX2Zl
bmNlX3NpZ25hbF9sb2NrZWQoZmVuY2UpOw0KPiArCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoZmVu
Y2UtPmxvY2ssIGZsYWdzKTsNCj4gICANCj4gLQkJc3Bpbl9sb2NrX2lycXNhdmUoZmVuY2UtPmxv
Y2ssIGZsYWdzKTsNCj4gLQkJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGN1ciwgdG1wLCAmZmVu
Y2UtPmNiX2xpc3QsIG5vZGUpIHsNCj4gLQkJCWxpc3RfZGVsX2luaXQoJmN1ci0+bm9kZSk7DQo+
IC0JCQljdXItPmZ1bmMoZmVuY2UsIGN1cik7DQo+IC0JCX0NCj4gLQkJc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZShmZW5jZS0+bG9jaywgZmxhZ3MpOw0KPiAtCX0NCj4gLQlyZXR1cm4gMDsNCj4gKwly
ZXR1cm4gcmV0Ow0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MKGRtYV9mZW5jZV9zaWduYWwpOw0K
PiAgIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
