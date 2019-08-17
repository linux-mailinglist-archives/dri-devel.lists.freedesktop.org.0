Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 833E1911A9
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32756EA26;
	Sat, 17 Aug 2019 15:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740040.outbound.protection.outlook.com [40.107.74.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECE36EA26;
 Sat, 17 Aug 2019 15:32:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fn5FRwKyIcdx5u2BRAGKzTh2HsquOQ8s/jcLyTC3mioVdeIEQrGCbtMTU/DW+5iNANyFLWk5PUjYWCQMFKMLsnEsrQgifT0kT9coUyMRApVcsKHxT3io1jS1yUo0mZkDNeeXWPVU02+iDcJW2UkU49GqGmMcIKBvQFaCKZN6vZJ8KMJirNOUKgNKk8HQG2RuisxHJSR7iJiNUOWMoeIjHX9ql6mjlX/ppFzZtIwjEQSDBib1ILC2VUhc+VJqGwf15RIYfiDREP+5dzUPCz8bFEgGsgkUmfiT0DYD14eoUDPlndU7mwKNwdCl1ZS1qk6Hij1PkeDtRQHmFzC7FuDPwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1tr2qEfh2xWIPDoct7mab69KgPlvplraC+K+sNeiro=;
 b=mRa69AMrrljt4cJhRtWC0cL9fnq3VXl4ZoMYIU8MWynLS1osyIbu0vPVIATICm+Rf2lrwR6+2rIVhFq6rVhfdqAYDc2SIc7oQyIJOBDLcZ2qS6zS6w1g+P/39LJVnXoKwkl0VeMZA7VU85u6R7pWdVQnXG+T4uC/h2qpRFeqyb8yK7nLePpEa+aFGtBWRvDpbb5UB8bX48ACoLtvZnQZyP2Q2TMZpIfRyuBR1tlqJFx6MbTmi+WtjVJfQ1Z1q8cgdolqObP8Z+5sKcmPTZCTLxe5PMkiY1zc+UHwL5FlSKmVV2MiDqUTpzlKyKcBqYiPgvYR3zy/zsB5X7qmxBBzdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1899.namprd12.prod.outlook.com (10.175.91.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Sat, 17 Aug 2019 15:31:59 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Sat, 17 Aug 2019
 15:31:59 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 6/6] dma-fence: Store the timestamp in the same union as
 the cb_list
Thread-Topic: [PATCH 6/6] dma-fence: Store the timestamp in the same union as
 the cb_list
Thread-Index: AQHVVQq9e1egaYOfOkyaosmCbgIvkab/dGuAgAAB/ICAAAFPAA==
Date: Sat, 17 Aug 2019 15:31:59 +0000
Message-ID: <4c5af0cf-4c93-77ea-74e2-4b478109c1f8@amd.com>
References: <20190817144736.7826-1-chris@chris-wilson.co.uk>
 <20190817144736.7826-6-chris@chris-wilson.co.uk>
 <00872790-f514-6524-1876-d9461cb3fd8c@amd.com>
 <156605563372.25088.10824119829158086438@skylake-alporthouse-com>
In-Reply-To: <156605563372.25088.10824119829158086438@skylake-alporthouse-com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR1PR01CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::18) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7309c146-3f79-470d-d5c5-08d723280b8f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1899; 
x-ms-traffictypediagnostic: DM5PR12MB1899:
x-microsoft-antispam-prvs: <DM5PR12MB18999D45A6AE5049396A21A783AE0@DM5PR12MB1899.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0132C558ED
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(199004)(189003)(31686004)(476003)(11346002)(110136005)(76176011)(31696002)(4326008)(2501003)(6512007)(86362001)(478600001)(36756003)(66446008)(2906002)(66476007)(14444005)(5660300002)(66946007)(2616005)(386003)(65956001)(65806001)(66556008)(64756008)(102836004)(486006)(7736002)(186003)(8936002)(25786009)(81156014)(256004)(6116002)(305945005)(6246003)(71200400001)(71190400001)(64126003)(446003)(6506007)(46003)(81166006)(229853002)(14454004)(316002)(52116002)(53936002)(58126008)(65826007)(6486002)(6436002)(99286004)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1899;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LFp/C17IDZ5XgNR35oVRJ1Rg/gg16IuSufZ85SdhHnRADe86EAzXs/Bwx4vTjy4U6FHnmU3K2tMKKDoRo06J97a1j5YUMoO9PRUG9jWSQ0DC7iPTitzmOqgxAgX+Rq5OgHEnPEr0fuyHmf0ZiNJiu415aaD7L3uENthP2+Hz3eu7SMIUJm2/3VnUiW2TcEx018XGsPGhI+VXcKkfAsZYm7VVKE/7t9lMbyTWT/AAP2dpTp06vPi+ENhAzJCvQTPmdVfx6b7QOUwUEWdK8vbMrpN7ByynDpc8ojInRQ0BnrPxq5umxa8P1bUmCgtaTKpz5EGj23YnK09HvHlZKo2cERtu0TVWIH9HQeqOGdfkVDAIJZxDKqP5ngUmE7qBg0+bmlmNbWV+WpeHIW3asxVIayRoAWF+FCaK6sno1kZLOTc=
x-ms-exchange-transport-forked: True
Content-ID: <0F757F3908DECC43BE3ED435A88652E3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7309c146-3f79-470d-d5c5-08d723280b8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2019 15:31:59.7213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j828YuWvK+l2dylto8iNZPtuQgRoHpvwRmnEOXzS9ecxaBPPzHxO41ZvoL2vZcXo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1899
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1tr2qEfh2xWIPDoct7mab69KgPlvplraC+K+sNeiro=;
 b=z84dCpm1h1mKigI0zdy/pnAaEmKPCZKVByAxUEPXfTVATGw/I2fd+ae7pfOsH5MDR7Y/1vTJQlGTcgpj7/fgumV5nPZq2A0I4V+jksa2sQcM0WZZ1peGHrQ5x8AF5UwI3qeqXJ0C1rX74frvB6hVahlZUDe9d38/5Y9+/DatbF0=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDguMTkgdW0gMTc6Mjcgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IFF1b3RpbmcgS29l
bmlnLCBDaHJpc3RpYW4gKDIwMTktMDgtMTcgMTY6MjA6MTIpDQo+PiBBbSAxNy4wOC4xOSB1bSAx
Njo0NyBzY2hyaWViIENocmlzIFdpbHNvbjoNCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEt
YnVmL2RtYS1mZW5jZS5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jDQo+Pj4gaW5kZXgg
ODlkOTZlM2U2ZGY2Li4yYzIxMTE1YjFhMzcgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9kbWEt
YnVmL2RtYS1mZW5jZS5jDQo+Pj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jDQo+
Pj4gQEAgLTEyOSw2ICsxMjksNyBAQCBFWFBPUlRfU1lNQk9MKGRtYV9mZW5jZV9jb250ZXh0X2Fs
bG9jKTsNCj4+PiAgICBpbnQgZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQoc3RydWN0IGRtYV9mZW5j
ZSAqZmVuY2UpDQo+Pj4gICAgew0KPj4+ICAgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlX2NiICpjdXIs
ICp0bXA7DQo+Pj4gKyAgICAgc3RydWN0IGxpc3RfaGVhZCBjYl9saXN0Ow0KPj4+ICAgIA0KPj4+
ICAgICAgICBsb2NrZGVwX2Fzc2VydF9oZWxkKGZlbmNlLT5sb2NrKTsNCj4+PiAgICANCj4+PiBA
QCAtMTM2LDE2ICsxMzcsMTYgQEAgaW50IGRtYV9mZW5jZV9zaWduYWxfbG9ja2VkKHN0cnVjdCBk
bWFfZmVuY2UgKmZlbmNlKQ0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmZmVuY2UtPmZsYWdzKSkpDQo+Pj4gICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+
Pj4gICAgDQo+Pj4gKyAgICAgLyogU3Rhc2ggdGhlIGNiX2xpc3QgYmVmb3JlIHJlcGxhY2luZyBp
dCB3aXRoIHRoZSB0aW1lc3RhbXAgKi8NCj4+PiArICAgICBsaXN0X3JlcGxhY2UoJmZlbmNlLT5j
Yl9saXN0LCAmY2JfbGlzdCk7DQo+PiBTdGFzaGluZyB0aGUgdGltZXN0YW1wIGluc3RlYWQgaXMg
cHJvYmFibHkgbGVzcyBieXRlcyB0byBtb2RpZnkuDQo+IE15IHRoaW5raW5nIHdhcyB0byBwYXNz
IHRoZSB0aW1lc3RhbXAgdG8gdGhlIG5vdGlmeSBjYWxsYmFja3MsIHdlIG5lZWQNCj4gdG8gc3Rh
c2ggdGhlIGxpc3QgYW5kIHNldCB0aGUgdGltZXN0YW1wIGZpcnN0Lg0KDQpJIGRvbid0IHNlZSBt
dWNoIG9mIGEgcmVhc29uIGZvciBjYWxsYmFja3MgdG8gdXNlIHRoZSB0aW1lc3RhbXAsIHRoZXkg
DQpjb3VsZCBqdXN0IGNhbGwga3RpbWVfZ2V0KCkgYW5kIHdvdWxkIG1vc3QgbGlrZWx5IGdldCB0
aGUgc2FtZSBvciBhdCANCmxlYXN0IGEgdmVyeSBjbG9zZSBieSB2YWx1ZS4NCg0KPiBOb3RoaW5n
IHRoYXQgSSdtIGF3YXJlIG9mIHVzZXMgdGhlIHRpbWVzdGFtcCAoanVzdCB0aGUgc3luYyBmaWxl
IGRlYnVnDQo+IHdoaWNoIHdlc3RvbiB3YXMgY29uc2lkZXJpbmcgdXNpbmcgYXQgb25lIHBvaW50
KS4uLiBTbyBJIGd1ZXNzIHdlIGRvbid0DQo+IGNhcmU/IEJ1dCBJIHdvdWxkIHNheSB3ZSBzaG91
bGQgZG8gdGhhdCBhcyBhIHNlcGFyYXRlIHN0ZXAgaW4gY2FzZQ0KPiBzb21lb25lIGRvZXMuDQoN
ClllYWgsIGFncmVlLg0KDQpDaHJpc3RpYW4uDQoNCj4gLUNocmlzDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
