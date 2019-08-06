Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED1783E03
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 01:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97BE6E580;
	Tue,  6 Aug 2019 23:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780051.outbound.protection.outlook.com [40.107.78.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87766E57A;
 Tue,  6 Aug 2019 23:47:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCXjRe643R7Zgf1czXYGDn2TvRcGXBn4fb/QK4SO/FkB09FCCQoXVrrRKZZZXzdsqMJ32OADLIDjx8Oqj54uHf3KSIroXIJy2bVEIYFmjPbKei3VNPJvB3hulL9Fu/HNdguCyfiL3X5ott3lqC3cgienAuWPWXqI+rnV5abK27uMSBOLcfVyFeJTKeP4AUKNE96Uyz7OpxyAJfmJwzv2T85LvHADWKK6EZpSUOaXCsJ1nln00gB584UCpGd1BtHsHvWvqdfAcOFeo6Zc+GPKovE70kgSfmXdQKEIAfpCZml/qoZnMwKzCBaViVF8XmdXvoDWdrVhKulHcOfZxqRf/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uYXs8TLn9yp6zgpySJyd2NtzBnPT/uQMkDb83lZ4/g=;
 b=ndjHN3eXVleLgSM8SfPeaWzHESwW7D6KehO0pl0kncZL0AxPkEWb295m7vzXyYObj9pC/dYMDvt1Va+MwqF91nhRaDZ95Bklh+HWp3QorLp7Ne7+QvAPaifDzfF+iF0EyDowEPlsImlQFpnVMUQ05y656pNlEZko6JG042CuVvBUWuf2utf9feUFSWae9f6nvvZRSf419ObiznzfaVMXyRwopguySyev/MLHezpzjMCbHZ7zgu2RyCEO0sfVvA2RBb2mJuY/tEsDG0wonrRv6g1oGf+JgU4ei+2pc+PodaylSpJOgbj13soOpkqcOkaUAucUGF07QDWIOywAZDxlYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3034.namprd12.prod.outlook.com (20.178.30.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Tue, 6 Aug 2019 23:47:45 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c%5]) with mapi id 15.20.2157.011; Tue, 6 Aug 2019
 23:47:45 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH v3 hmm 10/11] drm/amdkfd: use mmu_notifier_put
Thread-Topic: [PATCH v3 hmm 10/11] drm/amdkfd: use mmu_notifier_put
Thread-Index: AQHVTKz1DOmv7threke3/c3LGGrUwabuyVIA
Date: Tue, 6 Aug 2019 23:47:44 +0000
Message-ID: <d58a1a8f-f80c-edfe-4b57-6fde9c0ca180@amd.com>
References: <20190806231548.25242-1-jgg@ziepe.ca>
 <20190806231548.25242-11-jgg@ziepe.ca>
In-Reply-To: <20190806231548.25242-11-jgg@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTBPR01CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::47) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26db0519-254a-49cf-877c-08d71ac87a84
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3034; 
x-ms-traffictypediagnostic: DM6PR12MB3034:
x-microsoft-antispam-prvs: <DM6PR12MB303409776EC953633553292892D50@DM6PR12MB3034.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(189003)(199004)(26005)(53546011)(14444005)(256004)(66946007)(66476007)(66556008)(64756008)(6506007)(386003)(102836004)(25786009)(14454004)(6246003)(54906003)(6512007)(186003)(64126003)(65826007)(65956001)(99286004)(68736007)(110136005)(6436002)(305945005)(65806001)(66066001)(66446008)(478600001)(6486002)(7736002)(5660300002)(36756003)(316002)(58126008)(7416002)(52116002)(53936002)(81166006)(3846002)(6116002)(8936002)(31686004)(31696002)(4326008)(2616005)(86362001)(71190400001)(8676002)(11346002)(229853002)(486006)(2906002)(446003)(76176011)(476003)(71200400001)(2501003)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3034;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: v2blSuD7K48EtfDiHnDhA5Z7bGNZG2u+PM8wAuasCzIWgI7LUavNujnsB30Db9XpvzrCpGhubEEXaMTxMQz4ziBKpQmmyJdROx5a3Wo5hEgfVUX0znfq0UXXC8yaAB/c/WLstG+d4eB3afA21frj4dXjkKn3vTvHAEJMPfSBlourYE9Sf4w9JPcKHJgvP2bWO7HJZh77B6zbga3XrvACBWFgwWCaCUjIjM1hjUqjplVKPFau+OYz/nTDlrwYQVT4oyPm3ga75hmdMIglrCewCT5QrvI0AB61gZ6rmSWzHU23yEu9arjvez2KJTwET1elX4CkpRHlXy1ZYMRFwuOnE5AEw9R4uSVgdrdU6M1X3JphhbYWBtjg9tfumnobwWqgw/EgY+B5erxdnYyecBj9CXhnH+Ol3ZLJ9SZMYtVFJmE=
Content-ID: <08AA45544D5F4047B8BE6878E1D59AF9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26db0519-254a-49cf-877c-08d71ac87a84
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 23:47:44.9450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fHlZiATcYSQj0+WSGSvy8ZAicH/M7tNXVlQryTfouYsJ287scDy/Lph82E+Jx7fCO7Tic+2WuNmcLFjUTVkvvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3034
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uYXs8TLn9yp6zgpySJyd2NtzBnPT/uQMkDb83lZ4/g=;
 b=NtZD+CrnutT7QoX/NN+5+MBdbO/1Cgvo6copl7F3OStBi5QjeCtpM5G+bzCzyBkqtI9oltan5WgCLRAoSsQxceTeNpqG3h0iFEq4LXvnYyuohSubVxdlADZezIrGu6T4ds9Qpkofd5uTrJJQOYPJAPpX1Kf4Tp9VE/RB4+K82Gk=
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Dimitri Sivanich <sivanich@sgi.com>,
 Gavin Shan <shangw@linux.vnet.ibm.com>, Andrea Righi <andrea@betterlinux.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@mellanox.com>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0wNiAxOToxNSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOg0KPiBGcm9tOiBKYXNv
biBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+DQo+DQo+IFRoZSBzZXF1ZW5jZSBvZiBtbXVf
bm90aWZpZXJfdW5yZWdpc3Rlcl9ub19yZWxlYXNlKCksDQo+IG1tdV9ub3RpZmllcl9jYWxsX3Ny
Y3UoKSBpcyBpZGVudGljYWwgdG8gbW11X25vdGlmaWVyX3B1dCgpIHdpdGggdGhlDQo+IGZyZWVf
bm90aWZpZXIgY2FsbGJhY2suDQo+DQo+IEFzIHRoaXMgaXMgdGhlIGxhc3QgdXNlciBvZiB0aG9z
ZSBBUElzLCBjb252ZXJ0aW5nIGl0IG1lYW5zIHdlIGNhbiBkcm9wDQo+IHRoZW0uDQo+DQo+IFNp
Z25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4NCg0KUmV2aWV3
ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KDQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggICAgfCAgMyAtLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jIHwgMTAgKysrKy0tLS0t
LQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0K
Pg0KPiBJJ20gcmVhbGx5IG5vdCBzdXJlIHdoYXQgdGhpcyBpcyBkb2luZywgYnV0IGl0IGlzIHZl
cnkgc3RyYW5nZSB0byBoYXZlIGENCj4gcmVsZWFzZSB3aXRoIG5vIG90aGVyIGNhbGxiYWNrLiBJ
dCB3b3VsZCBiZSBnb29kIGlmIHRoaXMgd291bGQgY2hhbmdlIHRvIHVzZQ0KPiBnZXQgYXMgd2Vs
bC4NCktGRCB1c2VzIHRoZSBNTVUgbm90aWZpZXIgdG8gZGV0ZWN0IHByb2Nlc3MgdGVybWluYXRp
b24gYW5kIGZyZWUgYWxsIHRoZSANCnJlc291cmNlcyBhc3NvY2lhdGVkIHdpdGggdGhlIHByb2Nl
c3MuIFRoaXMgd2FzIGZpcnN0IGFkZGVkIGZvciBBUFVzIA0Kd2hlcmUgdGhlIElPTU1VdjIgaXMg
c2V0IHVwIHRvIHBlcmZvcm0gYWRkcmVzcyB0cmFuc2xhdGlvbnMgdXNpbmcgdGhlIA0KQ1BVIHBh
Z2UgdGFibGUgZm9yIGRldmljZSBtZW1vcnkgYWNjZXNzLiBUaGF0J3Mgd2hlcmUgdGhlIGFzc29j
aWF0aW9uIG9mIA0KS0ZEIHByb2Nlc3MgcmVzb3VyY2VzIHdpdGggdGhlIGxpZmV0aW1lIG9mIHRo
ZSBtbV9zdHJ1Y3QgY29tZXMgZnJvbS4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQoNCj4NCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQo+IGluZGV4IDM5MzNmYjZhMzcxZWZi
Li45NDUwZTIwZDE3MDkzYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX3ByaXYuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJp
di5oDQo+IEBAIC02ODYsOSArNjg2LDYgQEAgc3RydWN0IGtmZF9wcm9jZXNzIHsNCj4gICAJLyog
V2Ugd2FudCB0byByZWNlaXZlIGEgbm90aWZpY2F0aW9uIHdoZW4gdGhlIG1tX3N0cnVjdCBpcyBk
ZXN0cm95ZWQgKi8NCj4gICAJc3RydWN0IG1tdV9ub3RpZmllciBtbXVfbm90aWZpZXI7DQo+ICAg
DQo+IC0JLyogVXNlIGZvciBkZWxheWVkIGZyZWVpbmcgb2Yga2ZkX3Byb2Nlc3Mgc3RydWN0dXJl
ICovDQo+IC0Jc3RydWN0IHJjdV9oZWFkCXJjdTsNCj4gLQ0KPiAgIAl1bnNpZ25lZCBpbnQgcGFz
aWQ7DQo+ICAgCXVuc2lnbmVkIGludCBkb29yYmVsbF9pbmRleDsNCj4gICANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jDQo+IGluZGV4IGMwNmU2MTkwZjIxZmZhLi5l
NWUzMjZmMmYyNjc1ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX3Byb2Nlc3MuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJv
Y2Vzcy5jDQo+IEBAIC00ODYsMTEgKzQ4Niw5IEBAIHN0YXRpYyB2b2lkIGtmZF9wcm9jZXNzX3Jl
Zl9yZWxlYXNlKHN0cnVjdCBrcmVmICpyZWYpDQo+ICAgCXF1ZXVlX3dvcmsoa2ZkX3Byb2Nlc3Nf
d3EsICZwLT5yZWxlYXNlX3dvcmspOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyB2b2lkIGtmZF9w
cm9jZXNzX2Rlc3Ryb3lfZGVsYXllZChzdHJ1Y3QgcmN1X2hlYWQgKnJjdSkNCj4gK3N0YXRpYyB2
b2lkIGtmZF9wcm9jZXNzX2ZyZWVfbm90aWZpZXIoc3RydWN0IG1tdV9ub3RpZmllciAqbW4pDQo+
ICAgew0KPiAtCXN0cnVjdCBrZmRfcHJvY2VzcyAqcCA9IGNvbnRhaW5lcl9vZihyY3UsIHN0cnVj
dCBrZmRfcHJvY2VzcywgcmN1KTsNCj4gLQ0KPiAtCWtmZF91bnJlZl9wcm9jZXNzKHApOw0KPiAr
CWtmZF91bnJlZl9wcm9jZXNzKGNvbnRhaW5lcl9vZihtbiwgc3RydWN0IGtmZF9wcm9jZXNzLCBt
bXVfbm90aWZpZXIpKTsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIHZvaWQga2ZkX3Byb2Nlc3Nf
bm90aWZpZXJfcmVsZWFzZShzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwNCj4gQEAgLTU0MiwxMiAr
NTQwLDEyIEBAIHN0YXRpYyB2b2lkIGtmZF9wcm9jZXNzX25vdGlmaWVyX3JlbGVhc2Uoc3RydWN0
IG1tdV9ub3RpZmllciAqbW4sDQo+ICAgDQo+ICAgCW11dGV4X3VubG9jaygmcC0+bXV0ZXgpOw0K
PiAgIA0KPiAtCW1tdV9ub3RpZmllcl91bnJlZ2lzdGVyX25vX3JlbGVhc2UoJnAtPm1tdV9ub3Rp
ZmllciwgbW0pOw0KPiAtCW1tdV9ub3RpZmllcl9jYWxsX3NyY3UoJnAtPnJjdSwgJmtmZF9wcm9j
ZXNzX2Rlc3Ryb3lfZGVsYXllZCk7DQo+ICsJbW11X25vdGlmaWVyX3B1dCgmcC0+bW11X25vdGlm
aWVyKTsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBtbXVfbm90aWZpZXJf
b3BzIGtmZF9wcm9jZXNzX21tdV9ub3RpZmllcl9vcHMgPSB7DQo+ICAgCS5yZWxlYXNlID0ga2Zk
X3Byb2Nlc3Nfbm90aWZpZXJfcmVsZWFzZSwNCj4gKwkuZnJlZV9ub3RpZmllciA9IGtmZF9wcm9j
ZXNzX2ZyZWVfbm90aWZpZXIsDQo+ICAgfTsNCj4gICANCj4gICBzdGF0aWMgaW50IGtmZF9wcm9j
ZXNzX2luaXRfY3dzcl9hcHUoc3RydWN0IGtmZF9wcm9jZXNzICpwLCBzdHJ1Y3QgZmlsZSAqZmls
ZXApDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
