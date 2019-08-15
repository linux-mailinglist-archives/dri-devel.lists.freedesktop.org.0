Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA838E66B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309526E8CE;
	Thu, 15 Aug 2019 08:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0F86E8C8;
 Thu, 15 Aug 2019 08:34:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFVVFxemVRhlMj5C5tf5ZXbeNfQCCVbnh2G32cQ0i5ufsx5VD6JyTs8PybCJnLTvqUUOXW+/S8lnkDC69/kV3jokTQXI/L9nF2YDuh15FImqiiXAzrIsbHC0GPN7GU5tAyj8vdRpy7UGPXQSTVeRS3nlceB4/3Btte97A1QTvSuF9v58jFH+6ds3UjrHxg+i//OjL/j2t1g5JN/6sFR5GR9aOvaNk56cQR5qxvHz0ou+7sPF6nLI+IqEYqU0wttARCZxJEKC3GvRzf99M114n0Ifpi5hUzAQaqnwz/9D3ickhTU+jSmSjU3BkOCw+c/SqjO6QgTKhKHil1+z0PNj3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+jMcgkceG21/PTP2hDN+UKEGX58IUO+CrLAe+VKyg0=;
 b=HVLj1Pc4YrNphz8Q2Y/al+jjJIYsCNnoVIynr3Se2cSBxMGWycR24K8D3H9v7x4xzXYKZuk95O8+BOdlT4rDKb3uv+RFJ5bZPflU42FFENBhD7DdXctgFAXaj3dwf01KbcEokrxPUKASRARLk6FEDuq6Plc/+BcJrwEeuyATkayWy6ORPXN1dK8uU+dLg7BIwm41ha3CboqfwhyWkBY8KoHwofpMBWTDp0diR38uF4fbUkpqj0k1rGnOkZBq7+M9h2Z1dLO2HNmlIha7xn23TKlNf6LU+2l0R9Odb6V09rNusNQcggiHJ9BWGmmCA6V9xjgKMLkMw6PMiyFnxFhG6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2519.namprd12.prod.outlook.com (52.132.141.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Thu, 15 Aug 2019 08:34:10 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 08:34:10 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Christoph Hellwig <hch@lst.de>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
Subject: Re: [PATCH 1/4] drm/radeon: handle PCIe root ports with addressing
 limitations
Thread-Topic: [PATCH 1/4] drm/radeon: handle PCIe root ports with addressing
 limitations
Thread-Index: AQHVUzra1CBLTgdm802owDhMdzV6Fab74e4A
Date: Thu, 15 Aug 2019 08:34:10 +0000
Message-ID: <d1cf1435-92e3-edb5-c239-18c71f2d27c7@amd.com>
References: <20190815072703.7010-1-hch@lst.de>
 <20190815072703.7010-2-hch@lst.de>
In-Reply-To: <20190815072703.7010-2-hch@lst.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0017.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::29)
 To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1217b21c-5ca3-4f9a-eb5e-08d7215b5878
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB2519; 
x-ms-traffictypediagnostic: DM5PR12MB2519:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2519C46824AB67F4273A491283AC0@DM5PR12MB2519.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(189003)(199004)(102836004)(46003)(6486002)(186003)(6512007)(229853002)(99286004)(6436002)(6116002)(6506007)(65806001)(2906002)(52116002)(76176011)(65956001)(71200400001)(71190400001)(64126003)(66574012)(65826007)(478600001)(14454004)(6636002)(386003)(54906003)(110136005)(58126008)(476003)(11346002)(446003)(6246003)(486006)(2616005)(36756003)(31686004)(31696002)(4326008)(25786009)(316002)(66446008)(66476007)(64756008)(53936002)(305945005)(66946007)(7736002)(66556008)(81166006)(81156014)(256004)(14444005)(5660300002)(86362001)(8676002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2519;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: beYgDIFSzy8baMteMH2fY7BIznOdbFhroqI02PJTugVnFfvZl9avgU1OTowMIoFDozL3kwCYODAgl0JfNeCuguqSKkgni1sNpjGu5IvWden5VMLAmUmqmMYKf+toJTsyYHZ34ZwPtZpncMNZXJ/wgeCIRMtOT8Kz2DFy/ZE6XtQ5mC37+w6aLLUJrtO0VDQNhbs9L2O66yNJS+cwGJVCf3yEsN7FTEZU0zso2zH27HVFrsYf+N8bb7R3YifRcei04RV3DbblhsJ3m2rYTiwQTa4luwVtkvyXvFJOvqUSyYntsaMV4AK/q6hllPQeibw3sZiC86st/XZBG/ksFDbceDVdg5NUD+pgY3XEroFcqa1uPXLZmxIwMZeudccBsoyxyb60KulUjqsaC2wXdwdjfUoTdWSQx6XN6mmkwBH80/8=
Content-ID: <E1443B3ADE342045812F793BF636AB49@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1217b21c-5ca3-4f9a-eb5e-08d7215b5878
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 08:34:10.8003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Onh8Yq90uflaWF+DHIJOdwJUwpa63iHcg0Zd6z/XSK/Xpz6iING7edtbBOLhV+ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2519
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+jMcgkceG21/PTP2hDN+UKEGX58IUO+CrLAe+VKyg0=;
 b=C+LKlXlA6hncotYAAZzP2DsUpoz5+1i72WUcB90UJVpU6oypkBsb8r043DR3dO9wJaxSZX+KvZ9mV1s9dfnKfBpIYqfj485xcDvpwnGI2Mk3nBHtlB3VLiBc0XibdkZKHQanNvPg9TeR1mz9biP1bqrrNsbrmAPnX9j0IEWpRAo=
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
Cc: Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMDguMTkgdW0gMDk6Mjcgc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoNCj4gcmFkZW9u
IHVzZXMgYSBuZWVkX2RtYTMyIGZsYWcgdG8gaW5kaWNhdGUgdG8gdGhlIGRybSBjb3JlIHRoYXQg
c29tZQ0KPiBhbGxvY2F0aW9ucyBuZWVkIHRvIGJlIGRvbmUgdXNpbmcgR0ZQX0RNQTMyLCBidXQg
aXQgb25seSBjaGVja3MgdGhlDQo+IGRldmljZSBhZGRyZXNzaW5nIGNhcGFiaWxpdGllcyB0byBt
YWtlIHRoYXQgZGVjaXNpb24uICBVbmZvcnR1bmF0ZWx5DQo+IFBDSWUgcm9vdCBwb3J0cyB0aGF0
IGhhdmUgbGltaXRlZCBhZGRyZXNzaW5nIGV4aXN0IGFzIHdlbGwuICBVc2UgdGhlDQo+IGRtYV9h
ZGRyZXNzaW5nX2xpbWl0ZWQgaW5zdGVhZCB0byBhbHNvIHRha2UgdGhvc2UgaW50byBhY2NvdW50
Lg0KPg0KPiBSZXBvcnRlZC1ieTogQXRpc2ggUGF0cmEgPEF0aXNoLlBhdHJhQHdkYy5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPg0KDQpMb29rcyBz
YW5lIHRvIG1lLiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPi4NCg0KU2hvdWxkIHdlIG1lcmdlIHRoaXMgdGhyb3VnaCBvdXIgbm9ybWFsIGFt
ZGdwdS9yYWRlb24gYnJhbmNoZXMgb3IgZG8geW91IA0Kd2FudCB0byBzZW5kIHRoaXMgdXBzdHJl
YW0gc29tZWhvdyBlbHNlPw0KDQpUaGFua3MsDQpDaHJpc3RpYW4uDQoNCj4gLS0tDQo+ICAgZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaCAgICAgICAgfCAgMSAtDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNlLmMgfCAxMiArKysrKy0tLS0tLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyAgICB8ICAyICstDQo+ICAgMyBmaWxlcyBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb24uaA0KPiBpbmRleCAzMjgwOGU1MGJlMTIuLjFhMGIyMjUyNmE3NSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaA0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbi5oDQo+IEBAIC0yMzg3LDcgKzIzODcsNiBAQCBzdHJ1Y3QgcmFk
ZW9uX2RldmljZSB7DQo+ICAgCXN0cnVjdCByYWRlb25fd2IJCXdiOw0KPiAgIAlzdHJ1Y3QgcmFk
ZW9uX2R1bW15X3BhZ2UJZHVtbXlfcGFnZTsNCj4gICAJYm9vbAkJCQlzaHV0ZG93bjsNCj4gLQli
b29sCQkJCW5lZWRfZG1hMzI7DQo+ICAgCWJvb2wJCQkJbmVlZF9zd2lvdGxiOw0KPiAgIAlib29s
CQkJCWFjY2VsX3dvcmtpbmc7DQo+ICAgCWJvb2wJCQkJZmFzdGZiX3dvcmtpbmc7IC8qIElHUCBm
ZWF0dXJlKi8NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rl
dmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNlLmMNCj4gaW5kZXgg
ZGNlYjU1NGU1Njc0Li5iOGNjMDU4MjY2NjcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX2RldmljZS5jDQo+IEBAIC0xMzY1LDI3ICsxMzY1LDI1IEBAIGludCByYWRlb25fZGV2
aWNlX2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsDQo+ICAgCWVsc2UNCj4gICAJCXJk
ZXYtPm1jLm1jX21hc2sgPSAweGZmZmZmZmZmVUxMOyAvKiAzMiBiaXQgTUMgKi8NCj4gICANCj4g
LQkvKiBzZXQgRE1BIG1hc2sgKyBuZWVkX2RtYTMyIGZsYWdzLg0KPiArCS8qIHNldCBETUEgbWFz
ay4NCj4gICAJICogUENJRSAtIGNhbiBoYW5kbGUgNDAtYml0cy4NCj4gICAJICogSUdQIC0gY2Fu
IGhhbmRsZSA0MC1iaXRzDQo+ICAgCSAqIEFHUCAtIGdlbmVyYWxseSBkbWEzMiBpcyBzYWZlc3QN
Cj4gICAJICogUENJIC0gZG1hMzIgZm9yIGxlZ2FjeSBwY2kgZ2FydCwgNDAgYml0cyBvbiBuZXdl
ciBhc2ljcw0KPiAgIAkgKi8NCj4gLQlyZGV2LT5uZWVkX2RtYTMyID0gZmFsc2U7DQo+ICsJZG1h
X2JpdHMgPSA0MDsNCj4gICAJaWYgKHJkZXYtPmZsYWdzICYgUkFERU9OX0lTX0FHUCkNCj4gLQkJ
cmRldi0+bmVlZF9kbWEzMiA9IHRydWU7DQo+ICsJCWRtYV9iaXRzID0gMzI7DQo+ICAgCWlmICgo
cmRldi0+ZmxhZ3MgJiBSQURFT05fSVNfUENJKSAmJg0KPiAgIAkgICAgKHJkZXYtPmZhbWlseSA8
PSBDSElQX1JTNzQwKSkNCj4gLQkJcmRldi0+bmVlZF9kbWEzMiA9IHRydWU7DQo+ICsJCWRtYV9i
aXRzID0gMzI7DQo+ICAgI2lmZGVmIENPTkZJR19QUEM2NA0KPiAgIAlpZiAocmRldi0+ZmFtaWx5
ID09IENISVBfQ0VEQVIpDQo+IC0JCXJkZXYtPm5lZWRfZG1hMzIgPSB0cnVlOw0KPiArCQlkbWFf
Yml0cyA9IDMyOw0KPiAgICNlbmRpZg0KPiAgIA0KPiAtCWRtYV9iaXRzID0gcmRldi0+bmVlZF9k
bWEzMiA/IDMyIDogNDA7DQo+ICAgCXIgPSBwY2lfc2V0X2RtYV9tYXNrKHJkZXYtPnBkZXYsIERN
QV9CSVRfTUFTSyhkbWFfYml0cykpOw0KPiAgIAlpZiAocikgew0KPiAtCQlyZGV2LT5uZWVkX2Rt
YTMyID0gdHJ1ZTsNCj4gICAJCWRtYV9iaXRzID0gMzI7DQo+ICAgCQlwcl93YXJuKCJyYWRlb246
IE5vIHN1aXRhYmxlIERNQSBhdmFpbGFibGVcbiIpOw0KPiAgIAl9DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX3R0bS5jDQo+IGluZGV4IGZiMzY5NmJjNjE2ZC4uMTE2YTI3YjI1ZGM0IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYw0KPiBAQCAtNzk0LDcgKzc5NCw3IEBA
IGludCByYWRlb25fdHRtX2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpDQo+ICAgCXIg
PSB0dG1fYm9fZGV2aWNlX2luaXQoJnJkZXYtPm1tYW4uYmRldiwNCj4gICAJCQkgICAgICAgJnJh
ZGVvbl9ib19kcml2ZXIsDQo+ICAgCQkJICAgICAgIHJkZXYtPmRkZXYtPmFub25faW5vZGUtPmlf
bWFwcGluZywNCj4gLQkJCSAgICAgICByZGV2LT5uZWVkX2RtYTMyKTsNCj4gKwkJCSAgICAgICBk
bWFfYWRkcmVzc2luZ19saW1pdGVkKCZyZGV2LT5wZGV2LT5kZXYpKTsNCj4gICAJaWYgKHIpIHsN
Cj4gICAJCURSTV9FUlJPUigiZmFpbGVkIGluaXRpYWxpemluZyBidWZmZXIgb2JqZWN0IGRyaXZl
ciglZCkuXG4iLCByKTsNCj4gICAJCXJldHVybiByOw0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
