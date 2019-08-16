Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6B99058D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 18:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996C889590;
	Fri, 16 Aug 2019 16:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720045.outbound.protection.outlook.com [40.107.72.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DA6894FE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 16:14:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYg2ZjMGUUqfj+Q3iHyi45Nvr6BTEsAWWAaW3TBEehD+0cx0kTyOfktJq9PHpmBJ0ng+VkhLECjRdCM6OlyRPufFMILktoEe7jDsB6GVs8BJRMBBaqoHIZ6aQexeY46CKbRzaPwM2XWo49iwFTUaZt3rTR4piSpqaLW+W61OOHO2z+Nox4zcDN4NcW5s8bRibcyJbZ+yRfLMTRzSfNqh6kkGyg8ryWWux/McK82Hzj6IBgrByPxazrlWLEteKWYGKHKwial+3fdSRN94gNFQByAZg/1ko3U9AXc8Ykxz7Wrsl4rMvelcJ6we1Jqdz8gFqR2Vt7IM+85ZD2fkMtmo8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jd1lTRiqCktO28Y7N0poonnFLi/wfnOnN3j+HAvkn4Y=;
 b=RnKXTDoebHoYh5fwpGnHdseXkJ5DTPp5uLtZQf6Wj3TSGg2UmCIJL53siuY/VIb+P6Yr028LS091T1aDT693/LoEKm7MHGlW/Pw/u36ydyQatzpNYWWAiVQrJjsbd84ZEutyNnbN+hxAfSSl/lNAnu6p6vjS1nlOz8TJEKitr99JL6NBxptzIyB98nLYTZNeQ2EEvyAYn2+2duWjkBNujfCWQgH4Gp1hEf2dJi/gCVmzpPeNwm08oKRzWFayotscf9IfgpiumEzA6CsqAKzl/wLTAqVCCShl2tmy/qrBs5y3Db5KQO+G0vjqI8YdiGlGfpR9PAvRMZ1OTBFwgWiirQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1900.namprd12.prod.outlook.com (10.175.89.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Fri, 16 Aug 2019 16:14:31 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 16:14:31 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] dma-buf: Avoid list_del during fence->cb_list
 iteration
Thread-Topic: [PATCH 1/2] dma-buf: Avoid list_del during fence->cb_list
 iteration
Thread-Index: AQHVVEZZZchAkb4pH0Soq0wsDuCrTKb98suA
Date: Fri, 16 Aug 2019 16:14:31 +0000
Message-ID: <16dc28b0-996d-f81c-f09c-82a0215b7c65@amd.com>
References: <20190816152152.27550-1-chris@chris-wilson.co.uk>
In-Reply-To: <20190816152152.27550-1-chris@chris-wilson.co.uk>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR1PR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::37) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e25011b0-f83a-4025-6b58-08d72264d1ef
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1900; 
x-ms-traffictypediagnostic: DM5PR12MB1900:
x-microsoft-antispam-prvs: <DM5PR12MB190099F79AA2E6BDC891953283AF0@DM5PR12MB1900.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(189003)(199004)(71190400001)(6486002)(229853002)(305945005)(4326008)(478600001)(65826007)(14444005)(256004)(58126008)(64126003)(65956001)(53936002)(6246003)(186003)(2906002)(46003)(316002)(476003)(8936002)(31696002)(71200400001)(25786009)(486006)(5660300002)(6506007)(386003)(11346002)(102836004)(66574012)(2616005)(6116002)(14454004)(2501003)(52116002)(6512007)(8676002)(76176011)(99286004)(81156014)(31686004)(6436002)(86362001)(110136005)(64756008)(81166006)(66446008)(66946007)(65806001)(66556008)(7736002)(66476007)(446003)(36756003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1900;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tzJkoNVrwATpc31Qah6tiU0ETdW+6LhRG+h9Rf208VgmeENseFeigBbN4vWVvSSYOLs98HjENBQD2QdDhmKVOiE7vU5C1l54n28S3MzQuqbZADTQSF60jlkOuw1gR7k+zMU+1mMj6gceHRG8rBWHGrObSIQ9YgVacyOoNEAPeNP8DrPfC+evuJsxDNWVJUweYEFD8ebChvcIKMQ1V41EeVY0aIhhEt0tUp9+bhQrnMwGngg1YOWhC32aA6TDmpdlb3qQAdX8mYbCgZ6MQlJVnMmBlMUe5EOccqcXrZqV/jA5uZCrVZfe0aq2L9UcM/QDutwMnTS4MoiUE7hwcuewmR4KtgU/UVXt2B6IDCTDbvGsfUueboQ/YFMaV0Zy8Yvs3mK9i7GkW1NC9XnAvFSy3o9FYQRbW7NEq6NGqW/Tu48=
x-ms-exchange-transport-forked: True
Content-ID: <A6E227E63E4FFE439E5A323E0BC20511@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e25011b0-f83a-4025-6b58-08d72264d1ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 16:14:31.5874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xYWKiqV12fDfpbRaHLgczuFdevSU245xg1YycgqewNOA56Sq1/tJbTcRbikBJWU7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1900
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jd1lTRiqCktO28Y7N0poonnFLi/wfnOnN3j+HAvkn4Y=;
 b=C3sfQBO0OF7tHP/YBHCypLBJFJGQU9H+kPof2HNl5dTXjXg4B/73X1fZ1S6yqLj12YKB72yEke19pXifH/wyNwzmreu1fInnSb5hor+TvnvUMpOCyKq0/0K66hBgawp8XP2TtChiQjzd2Q0/bFu7PEqTsqi7uQbJ14ZGKMNG5wo=
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

QW0gMTYuMDguMTkgdW0gMTc6MjEgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IEJlZm9yZSB3ZSBu
b3RpZnkgdGhlIGZlbmNlIHNpZ25hbCBjYWxsYmFjaywgd2UgcmVtb3ZlIHRoZSBjYiBmcm9tIHRo
ZQ0KPiBsaXN0LiBIb3dldmVyLCBzaW5jZSB3ZSBhcmUgcHJvY2Vzc2luZyB0aGUgZW50aXJlIGxp
c3QgZnJvbSB1bmRlcm5lYXRoDQo+IHRoZSBzcGlubG9jaywgd2UgZG8gbm90IG5lZWQgdG8gaW5k
aXZpZHVhbCBkZWxldGUgZWFjaCBlbGVtZW50LCBidXQgY2FuDQo+IHNpbXBseSByZXNldCB0aGUg
bGluayBhbmQgdGhlIGVudGlyZSBsaXN0Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxz
b24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4NCj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+DQo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+IGZvciB0aGUgc2VyaWVzLg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZG1h
LWJ1Zi9kbWEtZmVuY2UuYyB8IDkgKysrKysrLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1h
LWJ1Zi9kbWEtZmVuY2UuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYw0KPiBpbmRleCA4
MDI1YTg5MWQzZTkuLmZmMGNkNmVhZTc2NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9kbWEtYnVm
L2RtYS1mZW5jZS5jDQo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYw0KPiBAQCAt
MTQ5LDkgKzE0OSwxMiBAQCBpbnQgZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQoc3RydWN0IGRtYV9m
ZW5jZSAqZmVuY2UpDQo+ICAgCQl0cmFjZV9kbWFfZmVuY2Vfc2lnbmFsZWQoZmVuY2UpOw0KPiAg
IAl9DQo+ICAgDQo+IC0JbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGN1ciwgdG1wLCAmZmVuY2Ut
PmNiX2xpc3QsIG5vZGUpIHsNCj4gLQkJbGlzdF9kZWxfaW5pdCgmY3VyLT5ub2RlKTsNCj4gLQkJ
Y3VyLT5mdW5jKGZlbmNlLCBjdXIpOw0KPiArCWlmICghbGlzdF9lbXB0eSgmZmVuY2UtPmNiX2xp
c3QpKSB7DQo+ICsJCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShjdXIsIHRtcCwgJmZlbmNlLT5j
Yl9saXN0LCBub2RlKSB7DQo+ICsJCQlJTklUX0xJU1RfSEVBRCgmY3VyLT5ub2RlKTsNCj4gKwkJ
CWN1ci0+ZnVuYyhmZW5jZSwgY3VyKTsNCj4gKwkJfQ0KPiArCQlJTklUX0xJU1RfSEVBRCgmZmVu
Y2UtPmNiX2xpc3QpOw0KPiAgIAl9DQo+ICAgCXJldHVybiByZXQ7DQo+ICAgfQ0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
