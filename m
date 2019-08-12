Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BED0D8A189
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 16:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FA86E546;
	Mon, 12 Aug 2019 14:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730073.outbound.protection.outlook.com [40.107.73.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8A36E546;
 Mon, 12 Aug 2019 14:51:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qeypb/MH05D9Pt2jDNOGc1Q0xk1vveGOyC4eGKmbbiIcWDP52EMzSmbViVdwFyBJNm4Vclnfvk1DknA95+POMEsTEHEFjTuUSefhv437ZtzutktnyGInt3kt1BIO4+DWK7p2CHMpfmmy7IHDl9YCMMGc68MUMjpiFgtrazwh+ZzVZAsaNKpa7Rv5pA5Ii/iwWgzbVryIbZCfcRw7rzpjG+D72lIN7BqDGAh1CbaPAEUWPVgEIbwcJR3ndUBtPrO5WtHD10GGEYgePQoZrvP6hUomNqueKIU2qqG/PCznyg4CPK58cHoF/GUtVyS4TASxKYJeJDI1H7Qg+uQ6mXstjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjihylY6xV7XV3AGdOazdsRcN2r9s5P1We1CgWcqWDw=;
 b=HrF92/X3HSEyR9zgYdd8aVEhcUUhIHx7yFSBHE0JPIHsvRQVCwBlCd6XGEicxpuc2rWd6V5oWkQiPTlxLtcp5sk+/c9Zk9x3tivWzyAgnsaUDNzNmcod8rWBvb1cZ8aJURNlXEDm7IXZ0iR0gnioCJgqmd/eu+lKbiObzWv4J6ofqE72g+40ts99mWKaeHqJWe9Gbs0wltVuo5T56LpjdlyrSt7Wdh3/xbVE9hvqUabx84PU/Qz2f5UWUhieQty44mcFA83g37KwistjebLN02k5KmFJGt4p107AC4b5zd5FVQhOVfXlAkwmGJPShaUTspnw/YBldzxQBEtx3mNaSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1420.namprd12.prod.outlook.com (10.168.239.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Mon, 12 Aug 2019 14:50:59 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 14:50:59 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] dma-fence: Refactor signaling for manual invocation
Thread-Topic: [PATCH 3/4] dma-fence: Refactor signaling for manual invocation
Thread-Index: AQHVT5FcoLDXFG6zukyZzm7Lcg/sg6b3lvQAgAACdICAAAIkAA==
Date: Mon, 12 Aug 2019 14:50:59 +0000
Message-ID: <40961588-a377-9c92-379f-e24e3b711ce7@amd.com>
References: <20190810153430.30636-1-chris@chris-wilson.co.uk>
 <20190810153430.30636-3-chris@chris-wilson.co.uk>
 <886f647b-24a6-ee24-4f50-68153fec6c53@amd.com>
 <156562099543.2301.5895998761855095437@skylake-alporthouse-com>
In-Reply-To: <156562099543.2301.5895998761855095437@skylake-alporthouse-com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0043.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::31) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd021bf0-d2d0-49e0-0dcb-08d71f347cf9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1420; 
x-ms-traffictypediagnostic: DM5PR12MB1420:
x-microsoft-antispam-prvs: <DM5PR12MB1420FEF99B436C4D9906853483D30@DM5PR12MB1420.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(189003)(199004)(64126003)(316002)(256004)(54906003)(71190400001)(58126008)(8936002)(6512007)(110136005)(64756008)(5660300002)(53936002)(66946007)(66476007)(66556008)(66446008)(229853002)(65956001)(65806001)(6116002)(6246003)(6486002)(186003)(4326008)(8676002)(14454004)(36756003)(7736002)(102836004)(86362001)(6436002)(305945005)(76176011)(52116002)(386003)(46003)(99286004)(25786009)(486006)(6506007)(71200400001)(2906002)(31686004)(31696002)(65826007)(446003)(476003)(2501003)(2616005)(478600001)(11346002)(81166006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1420;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rC+ODTCax52M4hxkt9RN0ddaqP04m3VsghpENgia0Mr4w9c+2vMnuSmZz+DqGypHD6qBPUpWOLYV32FWlMZwvJ++W5kAZc1IwAHzyvC//RsqyoDJwll3RvzLrm4Y8UwUNp/U1dR8nh6K2ZKCqH9js5N9Dn7MuxsAWuT1w/vrlI7o63II01VJ8LcF5tnD5ViI1/xLUQ9aCt+fMY9IXuAkW5Ni+f7amU3W1zt4KGfCYlF9X0cPJ+RImNsEC34DRIkHyTpOEVommJIyttqA3ND4IynWWWh1kn2CPyMTIfvda/eoU3OTAUcmmW+HD/iHoqEYN9WaoV14gY8mNdUppF0lpepgFHYp/duH6CN9sHUHSl9Mn3iEVdR07IBWGKtF/KwghswGcswxLeJsEYizs8ReC6j2l4ynZc+EryNFFAcgcCU=
x-ms-exchange-transport-forked: True
Content-ID: <0B732A522B905F42A3439152FE6E0535@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd021bf0-d2d0-49e0-0dcb-08d71f347cf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 14:50:59.3321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4SDerBwbUhjEb9HiNlHfRueNc8jYbGz5xfCMVo87wSOi0mcjJTrZ2PWA+9lWwGDo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1420
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjihylY6xV7XV3AGdOazdsRcN2r9s5P1We1CgWcqWDw=;
 b=qtX7EwcKRos5H66X6oPPxmZg8b197xbdCADMFnIWKbntlbhHw9zBpMpHK/0nDqXVHx4Z7PhrwHJiCuczDsORVBgtWpuY7y1zvnhMTz+Q/+uBBPCjE08Rb1NsKkFsv+7dLG4jP8bPgRp4XuyxUmAG2ALvxLk8ULXj1QbNGzF+pt4=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDguMTkgdW0gMTY6NDMgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IFF1b3RpbmcgS29l
bmlnLCBDaHJpc3RpYW4gKDIwMTktMDgtMTIgMTU6MzQ6MzIpDQo+PiBBbSAxMC4wOC4xOSB1bSAx
NzozNCBzY2hyaWViIENocmlzIFdpbHNvbjoNCj4+PiBNb3ZlIHRoZSBkdXBsaWNhdGVkIGNvZGUg
d2l0aGluIGRtYS1mZW5jZS5jIGludG8gdGhlIGhlYWRlciBmb3Igd2lkZXINCj4+PiByZXVzZS4g
SW4gdGhlIHByb2Nlc3MgYXBwbHkgYSBzbWFsbCBtaWNyby1vcHRpbWlzYXRpb24gdG8gb25seSBw
cnVuZSB0aGUNCj4+PiBmZW5jZS0+Y2JfbGlzdCBvbmNlIHJhdGhlciB0aGFuIHVzZSBsaXN0X2Rl
bCBvbiBldmVyeSBlbnRyeS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8
Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPg0KPj4+IENjOiBUdnJ0a28gVXJzdWxpbiA8dHZydGtv
LnVyc3VsaW5AaW50ZWwuY29tPg0KPj4+IC0tLQ0KPj4+ICAgIGRyaXZlcnMvZG1hLWJ1Zi9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgMTAgKy0NCj4+PiAgICBkcml2ZXJzL2RtYS1idWYv
ZG1hLWZlbmNlLXRyYWNlLmMgICAgICAgICAgIHwgIDI4ICsrKw0KPj4+ICAgIGRyaXZlcnMvZG1h
LWJ1Zi9kbWEtZmVuY2UuYyAgICAgICAgICAgICAgICAgfCAgMzMgKy0tDQo+Pj4gICAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfYnJlYWRjcnVtYnMuYyB8ICAzMiArLS0NCj4+PiAgICBp
bmNsdWRlL2xpbnV4L2RtYS1mZW5jZS1pbXBsLmggICAgICAgICAgICAgIHwgIDgzICsrKysrKysN
Cj4+PiAgICBpbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS10eXBlcy5oICAgICAgICAgICAgIHwgMjU4
ICsrKysrKysrKysrKysrKysrKysrDQo+Pj4gICAgaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaCAg
ICAgICAgICAgICAgICAgICB8IDIyOCArLS0tLS0tLS0tLS0tLS0tLQ0KPj4gTWhtLCBJIGRvbid0
IHJlYWxseSBzZWUgdGhlIHZhbHVlIGluIGNyZWF0aW5nIG1vcmUgaGVhZGVyIGZpbGVzLg0KPj4N
Cj4+IEVzcGVjaWFsbHkgSSdtIHByZXR0eSBzdXJlIHRoYXQgdGhlIHR5cGVzIHNob3VsZCBzdGF5
IGluIGRtYS1mZW5jZS5oDQo+IGlpcmMsIHdoZW4gSSBpbmNsdWRlZCB0aGUgdHJhY2UuaCBmcm9t
IGRtYS1mZW5jZS5oIG9yIGRtYS1mZW5jZS1pbXBsLmgNCj4gd2l0aG91dCBzZXBhcmF0aW5nIHRo
ZSB0eXBlcywgYW1kZ3B1IGZhaWxlZCB0byBjb21waWxlICh3aGljaCBpcyBtb3JlDQo+IHRoYW4g
bGlrZWx5IHRvIGJlIHNpbXBseSBkdWUgdG8gYmUgZmlyc3QgZHJtIGluIHRoZSBsaXN0IHRvIGNv
bXBpbGUpLg0KDQpBaCwgYnV0IHdoeSBkbyB5b3Ugd2FudCB0byBpbmNsdWRlIHRyYWNlLmggaW4g
YSBoZWFkZXIgaW4gdGhlIGZpcnN0IHBsYWNlPw0KDQpUaGF0J3MgdXN1YWxseSBub3Qgc29tZXRo
aW5nIEkgd291bGQgcmVjb21tZW5kIGVpdGhlci4NCg0KQ2hyaXN0aWFuLg0KDQo+DQo+IERvaW5n
IG1vcmUgd29yayB3YXNuJ3QgdGhyb3VnaCBjaG9pY2UuDQo+IC1DaHJpcw0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
