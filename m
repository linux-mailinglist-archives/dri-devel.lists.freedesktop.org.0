Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5475D84DDD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 15:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CC86E6E8;
	Wed,  7 Aug 2019 13:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760087.outbound.protection.outlook.com [40.107.76.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2409F6E6E8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 13:50:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEVOqM56DUJqRUwuYStcDcptvVig1zNkrT6+cKoNyZX/vOO3oR0iP8eLHfpIZwkliXhTntMXDQswnQl3O2TEeRrDhScZxk4d4OlcNPDxoc+MMMc966TL63IOB6xOFPxSJ79byW9uR/WoulBpnzMP4wDZqV4OyS1WRrLMXyo5mgqkfRDySMjnJOXzwJ2VMfy/Cm0jkS+eRf6Evq5mh6NnPpzUMi8RzS13b789DrINHsNA6yEnph8UR/XLKm5BGzu269DrK95kYjjJsnAjSv4+Vfgo9dsEtlMUA3hHHsxZiUu95YcPNPyyVFoMnBRmi8CcCn9mJvlJrT5oczYsLiZ8sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pYmBqXpgcYlqibYuUxeowwJfUGT3eiRjJ3kEKsoJF0=;
 b=bsIoifiXaGGfSnpmadngpQ1eZPObaAaKkuhmZhJ4nKcHX88oNnORGP7Q9mk07SW0eBaJFJeRy9UONetTTRgKi+lBucffjR5vD5WH3sbFSydIOVX2WnEChHTKmVZe2idBW+WlJIBdE8m1deZQry0r3aPg2ZGywv5wNaW4GkfwC2mV8xALS98uire6ZL2/RTVzJqlsyI9/GUBcrAb60e6ba9ZZ9qhWurPuBKK2T7OD5xb+NB/9kIegi59aNcWgj107LCPpjek10Usdbo6es7POJoPZoU9C0LOxm9U530xQv5ZBDpLF2xSx2hvzCHgTdP+NjgdbtAD8ObUz2aBpNrcWhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1673.namprd12.prod.outlook.com (10.172.39.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Wed, 7 Aug 2019 13:49:58 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 13:49:58 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 0/2] drm/syncobj: add syncobj sideband payload for
 threaded submission
Thread-Topic: [PATCH 0/2] drm/syncobj: add syncobj sideband payload for
 threaded submission
Thread-Index: AQHVTSVQUPB9zewcUU2zWx/k2EXLaqbvs7EA
Date: Wed, 7 Aug 2019 13:49:58 +0000
Message-ID: <f007b126-cb87-b8b4-9c28-83ffb3fcfba9@amd.com>
References: <20190807133745.4110-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20190807133745.4110-1-lionel.g.landwerlin@intel.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0098.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::14) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac95789b-85bb-426a-f5f3-08d71b3e22e6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1673; 
x-ms-traffictypediagnostic: DM5PR12MB1673:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1673343E1B20BE5159DD46AD83D40@DM5PR12MB1673.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(199004)(189003)(64756008)(66476007)(36756003)(65806001)(65956001)(229853002)(54906003)(58126008)(52116002)(110136005)(71190400001)(6436002)(68736007)(386003)(31696002)(64126003)(6506007)(256004)(6116002)(102836004)(76176011)(6306002)(5660300002)(86362001)(2906002)(316002)(66946007)(14454004)(99286004)(966005)(65826007)(66446008)(446003)(8936002)(6512007)(46003)(66556008)(7736002)(53936002)(486006)(11346002)(8676002)(305945005)(81166006)(2501003)(478600001)(4326008)(476003)(186003)(25786009)(71200400001)(6486002)(31686004)(81156014)(2616005)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1673;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WVgKhh4RDrnFJf6EUPY3B2jKCHuiwFIwjccyTrkF6+Qix1N602mIQzVE13uwdD+PqBBd6StvLuQjFcKHPYYlXgWm4fbitNwsLVMGqiLNEKlgTRczJl8qLrD/cdsyEz346U+2qYZvUfkoYnYbliB4ltEoRHDoDsVmpjjm+xXWNhsSZwzExYJhJm/g30Ccie0/ONaceqQ5MTve1drP6FkmVsKZlOtOY3HlEoigijq11eUPBgFOC2rQTZ4D/L1K0+2lqJaTK7sk//s0jO3aiX/Sq16flr2LqxxSEM5TmshjAk76bdzW5LxllvK5gpVyY6HbLvOm7k5+SouQzOzmhJosPdJFx03fhTkO/cK08/N8LoeF26ae2lBueMYKP7vgdcmwpJzH7d/G+utIEgI1RtC/Uu9A2EqB8SsGmVp7EEevhEI=
Content-ID: <CC8E092E6996644E8DA43129E2357253@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac95789b-85bb-426a-f5f3-08d71b3e22e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 13:49:58.5707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1673
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pYmBqXpgcYlqibYuUxeowwJfUGT3eiRjJ3kEKsoJF0=;
 b=NenURWohpyN3ZI2BZ/oMYgmNjjbJJRriAXNzZDXK9E9dNJoMuBOkJkNQ9cMrNCm9hkumRyeMSQOpWo/27JHsvSZq1xKNDb5JpbQP9udk+WyfgdjZXD/3A3P3/eMXBYTs3DVzFOvsswqtf5XeNLD/MxTLkjA+T/vUBwbXSjtmZ5s=
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
Cc: "jason@jlekstrand.net" <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2VsbCBmaXJzdCBvZiBhbGwgSSBzdHJvbmdseSBzdWdnZXN0IHRvIG1ha2UgdGhlIHNpZGViYW5k
IGluZm9ybWF0aW9uIGEgDQpzZXBhcmF0ZSBJT0NUTCBhbmQgbm90IHVzZSB0aGUgZXhpc3Rpbmcg
c2lnbmFsL3F1ZXJ5IElPQ1RMcyBmb3IgaXQuDQoNClRoZW4gYXMgZmFyIGFzIEkgc2VlIHRoaXMg
YmFzaWNhbGx5IHNldHMgYSBzZXF1ZW5jZSBudW1iZXIgdG8gdXNlIGZvciANCmJpbmFyeSBzZW1h
cGhvcmVzLCBpcyB0aGF0IGNvcnJlY3Q/IElmIHllcyB0aGVuIHRoYXQgd291bGQgYmUgYSByYXRo
ZXIgDQplbGVnYW50IGlkZWEuDQoNCkNocmlzdGlhbi4NCg0KQW0gMDcuMDguMTkgdW0gMTU6Mzcg
c2NocmllYiBMaW9uZWwgTGFuZHdlcmxpbjoNCj4gSGksDQo+DQo+IFRoZSBnb2FsIG9mIHRoaXMg
ZmVhdHVyZSBpcyB0byBzb2x2ZSBhbiBpc3N1ZSB0aGF0IHdhcyBzZWVuIGluIG91cg0KPiB0ZXN0
aW5nLiBBZnRlciBkaXNjdXNzaW5nIG9uIFsxXSBJIHRob3VnaHQgd2UgY291bGQgc29sdmUgdGhp
cyBwcm9ibGVtDQo+IHdpdGggc3RhbGxpbmcgdGhlIGFwcGxpY2F0aW9uIHRocmVhZCBhZnRlciBl
YWNoIHZrUXVldWVTdWJtaXQoKSBjYWxsDQo+IHdoZXJlIGEgYmluYXJ5IHNlbWFwaG9yZSBpcyBz
aWduYWxlZCBidXQgSSBkb24ndCB0aGluayBpdCdzIGEgZ29vZA0KPiBvcHRpb24gYmVjYXVzZSBv
ZiBwZXJmb3JtYW5jZSBpbXBhY3RzIG9uIHRoZSBhcHBsaWNhdGlvbi4NCj4NCj4gVW5mb3J0dW5h
dGVseSB0aGVyZSBpc24ndCBhIGdvb2Qgd2F5IHRvIHJlcHJvZHVjZSB0aGlzIHByb2JsZW0gMTAw
JQ0KPiBiZWNhdXNlIGl0IGVzc2VudGlhbGx5IGV4cG9zZXMgYSByYWNlIGJldHdlZW4gdGhlIGFw
cGxpY2F0aW9uIHRocmVhZA0KPiBhbmQgdGhlIHN1Ym1pc3Npb24gdGhyZWFkLg0KPg0KPiBJJ3Zl
IHVwbG9hZGVkIHRlc3RzIGluIHRoZSBLaHJvbm9zIHJlcG9zaXRvcnkgdG8gdHJ5IHRvIGV4cG9z
ZSB0aGUNCj4gaXNzdWUuDQo+DQo+IFRoYW5rcywNCj4NCj4gWzFdIDogaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktQXVndXN0LzIyOTE4OC5odG1s
DQo+DQo+IExpb25lbCBMYW5kd2VybGluICgyKToNCj4gICAgZHJtL3N5bmNvYmo6IGFkZCBzaWRl
YmFuZCBwYXlsb2FkDQo+ICAgIGRybS9zeW5jb2JqOiBhZGQgc3VibWl0IHBvaW50IHF1ZXJ5IGNh
cGFiaWxpdHkNCj4NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyB8IDEzMiArKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+ICAgaW5jbHVkZS9kcm0vZHJtX3N5bmNv
YmouaCAgICAgfCAgIDkgKysrDQo+ICAgaW5jbHVkZS91YXBpL2RybS9kcm0uaCAgICAgICAgfCAg
IDUgKy0NCj4gICAzIGZpbGVzIGNoYW5nZWQsIDEwMCBpbnNlcnRpb25zKCspLCA0NiBkZWxldGlv
bnMoLSkNCj4NCj4gLS0NCj4gMi4yMy4wLnJjMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
