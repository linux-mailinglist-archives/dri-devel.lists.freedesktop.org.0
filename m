Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FC6B3634
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 10:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27606E87C;
	Mon, 16 Sep 2019 08:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790088.outbound.protection.outlook.com [40.107.79.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8316E878
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 08:11:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqCvF5HdwRhVYu5JO147E30v9ufae+oikHkXaWlcivNIvZg9a3X49yp0Wngdxrl4Qy8lFTFbEuMvwewIv2I5+AEqheB1YbznDQVK/ugxYe4GhqBMDufOyE/VtEVnN8JHcxxAtdL77BytwOWwPZS7EkOJ5/6DYgMCs164/DYtQ/3wU1w55d0YphGMD7mFyu3qummqywa9lhDu3IgGyP0/llKHibLrBQYRtHUMFtLiivJ4/y4edo6p+DV4QQ0QbtDGDveIG1Rxj/3h2TTAR1eFMSBWa1cD+DT5bLd0PoogCFbkmOtu9S2TUTW7yYISlAJZPU5S778soqKZEwb0AOaYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gnb6HUZKTwu7Q21gitaPJSyhpYR90NHjdfryFaeE24=;
 b=AsEgrfG0RdoZSQfn/1GfaeimyjZT+Kpl7f+FAZCqUJtvlEA7rTguPPHi+2vtWSTUhQgSTVUjMxDnFqB/IedyhRVf1NA32VJgp7YySFsE40AwfxkSDmHOosWX9Oh3H6+R/MVUJmywmUnA03WO4jeR20OOJVK46+T7i14xUnRchSenp5MCzJiNRy5NT6nJMETK++A7IVKWruaS36xeCKpAnHCRSS0d44pkWRjI9yywKQB45JSr4eltjKJNuu6U59+F3XMvNrb5LJTBhmpYvoA+cDLNg+RRsiFgjxxJnQTlhP4XpD8gKv1sarWG9yqQrLXJ1x5dKJISOhVshoIJkuCB7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1257.namprd12.prod.outlook.com (10.168.237.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.24; Mon, 16 Sep 2019 08:11:03 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 08:11:03 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Steven Price <steven.price@arm.com>, dri-devel
 <dri-devel@lists.freedesktop.org>
Subject: Re: blocking ops in drm_sched_cleanup_jobs()
Thread-Topic: blocking ops in drm_sched_cleanup_jobs()
Thread-Index: AQHVakKoOYdMRdOTwkS7yPyqGSTa5Kct+AQA
Date: Mon, 16 Sep 2019 08:11:03 +0000
Message-ID: <6e845237-cd30-e3c3-9eb4-db75dc1fdf84@amd.com>
References: <6ed945cb-619a-b26d-21b0-9bdaeaa69582@arm.com>
In-Reply-To: <6ed945cb-619a-b26d-21b0-9bdaeaa69582@arm.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0099.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::15) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b6d8410-9d18-4554-73f3-08d73a7d6ad6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1257; 
x-ms-traffictypediagnostic: DM5PR12MB1257:
x-microsoft-antispam-prvs: <DM5PR12MB1257F78D42378B21DE9903E3838C0@DM5PR12MB1257.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(189003)(199004)(45080400002)(478600001)(58126008)(6436002)(99286004)(229853002)(486006)(316002)(6506007)(6246003)(36756003)(102836004)(6486002)(5660300002)(256004)(14444005)(476003)(11346002)(446003)(64756008)(66446008)(66476007)(66946007)(66556008)(2616005)(46003)(110136005)(71200400001)(71190400001)(25786009)(81156014)(86362001)(2906002)(31696002)(8676002)(8936002)(76176011)(386003)(81166006)(186003)(14454004)(6116002)(52116002)(31686004)(6512007)(53936002)(7736002)(305945005)(65806001)(65956001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1257;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PkU+oPFCrxslaFUXU7wShwuy3D5dbGhkDTXd+Bm3aHNqcfEByNfBfCu4Hywmz+f0YNZiYx9+E08f2Hmo+DX/c0yb61M4I3HR6etQ6PCMcUEiNGQcZ2hN5/ECHQbBrwLBh8m6jYw/hLsXPeeM1MHBIZUrV6BFxuhIH491zSUH5EsAHVCVFBsDtUdUGLiO4W1nxiDnA4GRqhep/wrNiQuE59g16ujnG4Q7bDTdd39MHcEqFw1MuXK8ogVOxOFGErNXYNtCDYaGteAZUJl+4HXIpzW41/dh9Mirnta+zg4dB/SfWJEIknUDsaGJrdp81yf9/4Lu+6/HATZh6K+gvzUtdkjbLbOtMFghbjlZFkzDZHZyat6Y+AvAPwofyN+p19+8aIOF5PoJ6mYvndK4lREn87sqoYCWcU72pfCe1bN040c=
x-ms-exchange-transport-forked: True
Content-ID: <FCCBED9A7043F6419F87263FF6073182@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6d8410-9d18-4554-73f3-08d73a7d6ad6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 08:11:03.6545 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k7QCL2x6Ca6c90QrX/wTtjklH8YxHBk3jPSQkW2AIVKh5XflHHQ/XNiq2vQUQIfx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1257
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gnb6HUZKTwu7Q21gitaPJSyhpYR90NHjdfryFaeE24=;
 b=tRC0/5Rtc1m1gx34boBa/1i8EEU0Wt3XMN+O8LGu9CgjRtY3I4ZHyRWkaa9gdd/7I38ZVU7HW0vVkY0eqxZd9cgwvcQHxQQ0iX/rici6mcZRZQSOgCer41idmDvs5xM527jjELLeGuiYIOiD6m9+eoTcUG5MS+62MrwNJVFFzP0=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3RldmVuLA0KDQp0aGUgcHJvYmxlbSBzZWVtcyB0byBiZSB0aGFuIHBhbmZyb3N0IGlzIHRy
eWluZyB0byBzbGVlcCB3aGlsZSBmcmVlaW5nIGEgDQpqb2IuIEUuZy4gaXQgdHJpZXMgdG8gdGFr
ZSBhIG11dGV4Lg0KDQpUaGF0IGlzIG5vdCBhbGxvd2VkIGFueSBtb3JlIHNpbmNlIHdlIG5lZWQg
dG8gZnJlZSB0aGUgam9icyBmcm9tIGF0b21pYyANCmFuZCBldmVuIGludGVycnVwdCBjb250ZXh0
Lg0KDQpZb3VyIHN1Z2dlc3Rpb24gd291bGRuJ3Qgd29yayBiZWNhdXNlIHRoaXMgd2F5IGpvYnMg
YXJlIG5vdCBmcmVlZCB3aGVuIA0KdGhlcmUgaXNuJ3QgYSBuZXcgb25lIHRvIGJlIHNjaGVkdWxl
ZC4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KQW0gMTMuMDkuMTkgdW0gMTY6NTAgc2Nocmll
YiBTdGV2ZW4gUHJpY2U6DQo+IEhpLA0KPg0KPiBJIGhpdCB0aGUgYmVsb3cgc3BsYXQgcmFuZG9t
bHkgd2l0aCBwYW5mcm9zdC4gRnJvbSB3aGF0IEkgY2FuIHRlbGwgdGhpcw0KPiBpcyBhIG1vcmUg
Z2VuZXJhbCBpc3N1ZSB3aGljaCB3b3VsZCBhZmZlY3Qgb3RoZXIgZHJpdmVycy4NCj4NCj4gLS0t
LTg8LS0tLS0NCj4gWzU4NjA0LjkxMzEzMF0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0t
LS0tLS0tDQo+IFs1ODYwNC45MTg1OTBdIFdBUk5JTkc6IENQVTogMSBQSUQ6IDE3NTggYXQga2Vy
bmVsL3NjaGVkL2NvcmUuYzo2NTU2IF9fbWlnaHRfc2xlZXArMHg3NC8weDk4DQo+IFs1ODYwNC45
Mjc5NjVdIGRvIG5vdCBjYWxsIGJsb2NraW5nIG9wcyB3aGVuICFUQVNLX1JVTk5JTkc7IHN0YXRl
PTEgc2V0IGF0IFs8MGM1OTA0OTQ+XSBwcmVwYXJlX3RvX3dhaXRfZXZlbnQrMHgxMDQvMHgxNjQN
Cj4gWzU4NjA0Ljk0MDA0N10gTW9kdWxlcyBsaW5rZWQgaW46IHBhbmZyb3N0IGdwdV9zY2hlZA0K
PiBbNTg2MDQuOTQ1MzcwXSBDUFU6IDEgUElEOiAxNzU4IENvbW06IHBhbl9qcyBOb3QgdGFpbnRl
ZCA1LjMuMC1yYzErICMxMw0KPiBbNTg2MDQuOTUyNTAwXSBIYXJkd2FyZSBuYW1lOiBSb2NrY2hp
cCAoRGV2aWNlIFRyZWUpDQo+IFs1ODYwNC45NTc4MTVdIFs8YzAxMTExNTA+XSAodW53aW5kX2Jh
Y2t0cmFjZSkgZnJvbSBbPGMwMTBjOTljPl0gKHNob3dfc3RhY2srMHgxMC8weDE0KQ0KPiBbNTg2
MDQuOTY2NTIxXSBbPGMwMTBjOTljPl0gKHNob3dfc3RhY2spIGZyb20gWzxjMDdhZGJiND5dIChk
dW1wX3N0YWNrKzB4OWMvMHhkNCkNCj4gWzU4NjA0Ljk3NDYzOV0gWzxjMDdhZGJiND5dIChkdW1w
X3N0YWNrKSBmcm9tIFs8YzAxMjFkYTg+XSAoX193YXJuKzB4ZTgvMHgxMDQpDQo+IFs1ODYwNC45
ODI0NjJdIFs8YzAxMjFkYTg+XSAoX193YXJuKSBmcm9tIFs8YzAxMjFlMDg+XSAod2Fybl9zbG93
cGF0aF9mbXQrMHg0NC8weDZjKQ0KPiBbNTg2MDQuOTkwODY3XSBbPGMwMTIxZTA4Pl0gKHdhcm5f
c2xvd3BhdGhfZm10KSBmcm9tIFs8YzAxNGVjY2M+XSAoX19taWdodF9zbGVlcCsweDc0LzB4OTgp
DQo+IFs1ODYwNC45OTk5NzNdIFs8YzAxNGVjY2M+XSAoX19taWdodF9zbGVlcCkgZnJvbSBbPGMw
N2M3M2Q4Pl0gKF9fbXV0ZXhfbG9jaysweDM4LzB4OTQ4KQ0KPiBbNTg2MDUuMDA4NjkwXSBbPGMw
N2M3M2Q4Pl0gKF9fbXV0ZXhfbG9jaykgZnJvbSBbPGMwN2M3ZDAwPl0gKG11dGV4X2xvY2tfbmVz
dGVkKzB4MTgvMHgyMCkNCj4gWzU4NjA1LjAxNzg0MV0gWzxjMDdjN2QwMD5dIChtdXRleF9sb2Nr
X25lc3RlZCkgZnJvbSBbPGJmMDBiNTRjPl0gKHBhbmZyb3N0X2dlbV9mcmVlX29iamVjdCsweDYw
LzB4MTBjIFtwYW5mcm9zdF0pDQo+IFs1ODYwNS4wMjk0MzBdIFs8YmYwMGI1NGM+XSAocGFuZnJv
c3RfZ2VtX2ZyZWVfb2JqZWN0IFtwYW5mcm9zdF0pIGZyb20gWzxiZjAwY2VjYz5dIChwYW5mcm9z
dF9qb2JfcHV0KzB4MTM4LzB4MTUwIFtwYW5mcm9zdF0pDQo+IFs1ODYwNS4wNDIwNzZdIFs8YmYw
MGNlY2M+XSAocGFuZnJvc3Rfam9iX3B1dCBbcGFuZnJvc3RdKSBmcm9tIFs8YmYwMDEyMWM+XSAo
ZHJtX3NjaGVkX2NsZWFudXBfam9icysweGM4LzB4ZTAgW2dwdV9zY2hlZF0pDQo+IFs1ODYwNS4w
NTQ0MTddIFs8YmYwMDEyMWM+XSAoZHJtX3NjaGVkX2NsZWFudXBfam9icyBbZ3B1X3NjaGVkXSkg
ZnJvbSBbPGJmMDAxMzAwPl0gKGRybV9zY2hlZF9tYWluKzB4Y2MvMHgyNmMgW2dwdV9zY2hlZF0p
DQo+IFs1ODYwNS4wNjY2MjBdIFs8YmYwMDEzMDA+XSAoZHJtX3NjaGVkX21haW4gW2dwdV9zY2hl
ZF0pIGZyb20gWzxjMDE0NmNmYz5dIChrdGhyZWFkKzB4MTNjLzB4MTU0KQ0KPiBbNTg2MDUuMDc2
MjI2XSBbPGMwMTQ2Y2ZjPl0gKGt0aHJlYWQpIGZyb20gWzxjMDEwMTBiND5dIChyZXRfZnJvbV9m
b3JrKzB4MTQvMHgyMCkNCj4gWzU4NjA1LjA4NDM0Nl0gRXhjZXB0aW9uIHN0YWNrKDB4ZTk1OWJm
YjAgdG8gMHhlOTU5YmZmOCkNCj4gWzU4NjA1LjA5MDA0Nl0gYmZhMDogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAN
Cj4gWzU4NjA1LjA5OTI1MF0gYmZjMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAw
MDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDANCj4gWzU4NjA1LjEwODQ4MF0g
YmZlMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMTMgMDAwMDAw
MDANCj4gWzU4NjA1LjExNjIxMF0gaXJxIGV2ZW50IHN0YW1wOiAxNzkNCj4gWzU4NjA1LjExOTk1
NV0gaGFyZGlycXMgbGFzdCAgZW5hYmxlZCBhdCAoMTg3KTogWzxjMDE3ZjdlND5dIGNvbnNvbGVf
dW5sb2NrKzB4NTY0LzB4NWM0DQo+IFs1ODYwNS4xMjg5MzVdIGhhcmRpcnFzIGxhc3QgZGlzYWJs
ZWQgYXQgKDIwMik6IFs8YzAxN2YzMDg+XSBjb25zb2xlX3VubG9jaysweDg4LzB4NWM0DQo+IFs1
ODYwNS4xMzc3ODhdIHNvZnRpcnFzIGxhc3QgIGVuYWJsZWQgYXQgKDIxNik6IFs8YzAxMDIzMzQ+
XSBfX2RvX3NvZnRpcnErMHgxOGMvMHg1NDgNCj4gWzU4NjA1LjE0NjU0M10gc29mdGlycXMgbGFz
dCBkaXNhYmxlZCBhdCAoMjI3KTogWzxjMDEyOTUyOD5dIGlycV9leGl0KzB4YzQvMHgxMGMNCj4g
WzU4NjA1LjE1NDYxOF0gLS0tWyBlbmQgdHJhY2UgZjY1YmRiZDllYTlhZGZjMCBdLS0tDQo+IC0t
LS04PC0tLS0tDQo+DQo+IFRoZSBwcm9ibGVtIGlzIHRoYXQgZHJtX3NjaGVkX21haW4oKSBjYWxs
cyBkcm1fc2NoZWRfY2xlYW51cF9qb2JzKCkgYXMNCj4gcGFydCBvZiB0aGUgY29uZGl0aW9uIG9m
IHdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZToNCj4NCj4+IAkJd2FpdF9ldmVudF9pbnRlcnJ1cHRp
YmxlKHNjaGVkLT53YWtlX3VwX3dvcmtlciwNCj4+IAkJCQkJIChkcm1fc2NoZWRfY2xlYW51cF9q
b2JzKHNjaGVkKSwNCj4+IAkJCQkJICghZHJtX3NjaGVkX2Jsb2NrZWQoc2NoZWQpICYmDQo+PiAJ
CQkJCSAgKGVudGl0eSA9IGRybV9zY2hlZF9zZWxlY3RfZW50aXR5KHNjaGVkKSkpIHx8DQo+PiAJ
CQkJCSBrdGhyZWFkX3Nob3VsZF9zdG9wKCkpKTsNCj4gV2hlbiBkcm1fc2NoZWRfY2xlYW51cF9q
b2JzKCkgaXMgY2FsbGVkICphZnRlciogYSB3YWl0IChpLmUuIGFmdGVyDQo+IHByZXBhcmVfdG9f
d2FpdF9ldmVudCgpIGhhcyBiZWVuIGNhbGxlZCksIHRoZW4gYW55IG1pZ2h0X3NsZWVwKCkgd2ls
bA0KPiBtb2FuIGxvdWRseSBhYm91dCBpdC4gVGhpcyBkb2Vzbid0IHNlZW0gdG8gaGFwcGVuIG9m
dGVuIChJJ3ZlIG9ubHkNCj4gdHJpZ2dlcmVkIGl0IG9uY2UpIGJlY2F1c2UgdXN1YWxseSBkcm1f
c2NoZWRfY2xlYW51cF9qb2JzKCkgZWl0aGVyDQo+IGRvZXNuJ3Qgc2xlZXAgb3IgZG9lcyB0aGUg
c2xlZXBpbmcgZHVyaW5nIHRoZSBmaXJzdCBjYWxsIHRoYXQNCj4gd2FpdF9ldmVudF9pbnRlcnJ1
cHRpYmxlKCkgbWFrZXMgKHdoaWNoIGlzIGJlZm9yZSB0aGUgdGFzayBzdGF0ZSBpcyBzZXQpLg0K
Pg0KPiBJIGRvbid0IHJlYWxseSB1bmRlcnN0YW5kIHdoeSBkcm1fc2NoZWRfY2xlYW51cF9qb2Jz
KCkgbmVlZHMgdG8gYmUNCj4gY2FsbGVkIGhlcmUsIGEgc2ltcGxlIGNoYW5nZSBsaWtlIGJlbG93
ICdmaXhlcycgaXQuIEJ1dCBJIHByZXN1bWUNCj4gdGhlcmUncyBzb21lIHJlYXNvbiBmb3IgdGhl
IGNhbGwgYmVpbmcgcGFydCBvZiB0aGUNCj4gd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlIGNvbmRp
dGlvbi4gQ2FuIGFueW9uZSBzaGVkIGxpZ2h0IG9uIHRoaXM/DQo+DQo+IFRoZSBjb2RlIHdhcyBp
bnRyb2R1Y2VkIGluIGNvbW1pdCA1OTE4MDQ1YzRlZDQgKCJkcm0vc2NoZWR1bGVyOiByZXdvcmsg
am9iIGRlc3RydWN0aW9uIikNCj4NCj4gU3RldmUNCj4NCj4gLS0tLTg8LS0tLS0NCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIGIvZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4gaW5kZXggOWEwZWU3NGQ4MmRjLi41Mjhm
Mjk1ZTNhMzEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
bWFpbi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+
IEBAIC02OTksMTEgKzY5OSwxMiBAQCBzdGF0aWMgaW50IGRybV9zY2hlZF9tYWluKHZvaWQgKnBh
cmFtKQ0KPiAgIAkJc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYjsNCj4gICAJCXN0cnVj
dCBkbWFfZmVuY2UgKmZlbmNlOw0KPiAgIA0KPiArCQlkcm1fc2NoZWRfY2xlYW51cF9qb2JzKHNj
aGVkKTsNCj4gKw0KPiAgIAkJd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKHNjaGVkLT53YWtlX3Vw
X3dvcmtlciwNCj4gLQkJCQkJIChkcm1fc2NoZWRfY2xlYW51cF9qb2JzKHNjaGVkKSwNCj4gICAJ
CQkJCSAoIWRybV9zY2hlZF9ibG9ja2VkKHNjaGVkKSAmJg0KPiAgIAkJCQkJICAoZW50aXR5ID0g
ZHJtX3NjaGVkX3NlbGVjdF9lbnRpdHkoc2NoZWQpKSkgfHwNCj4gLQkJCQkJIGt0aHJlYWRfc2hv
dWxkX3N0b3AoKSkpOw0KPiArCQkJCQkga3RocmVhZF9zaG91bGRfc3RvcCgpKTsNCj4gICANCj4g
ICAJCWlmICghZW50aXR5KQ0KPiAgIAkJCWNvbnRpbnVlOw0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
