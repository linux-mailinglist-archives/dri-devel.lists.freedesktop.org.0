Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B860E76264
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960536ECF5;
	Fri, 26 Jul 2019 09:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50056.outbound.protection.outlook.com [40.107.5.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB6E6E83B;
 Fri, 26 Jul 2019 00:16:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNI2rM7p45vkpfKHgM+MRU49tgMgLjLIWqj4QUhIhH6Z3LMtLujcoXsbuPRKLbMLD6QCtpoBO1IgCPzxBdXrUayAWR8/6zaNDzu+xLPBqWvPQLEKnUKv+P2HDBNCWDkJ+Rq4cAHYNBQ6h9y1UVMK+aotqbtKvnLL1g8RjAr5U34xj8IXdc4HuI/uHBZofQ3+iuprLiFRRBGMFSmHJVdJdedO79yPk9J+6tFuSEhbwdj9KsMf6J2xPCPoex9gN72HQpriVDtHiT6lMJHAl8qXNty2bLEvjEH44eIjwFVe/moRnz6QIhJHC34TF4H/80SYq74ukVAFkMyJ5uqFRIMQww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0q7KETf8VOgdRydYjPeN0MMEKPYfp/4tpTOPqZtr/E0=;
 b=X2mBSecRCDOHx0jXX9K2PzJ6cHWsQLff8SfDR/vTxdOcGUsnR+L7hYoXbXsWLKfN7RssmG8nL9yHsJEIGADEojF05D/XpYfT+ZjMEK7tK9gtjpotteN96dbLiKslfvaP3j2B8s5C4me1bFA/+LIM/lDfzvo9JpG1CtCrU/8POTb6UrBZOt0HRoEWGyGjWcOjpxwQ7I5rQt6dbKk0O9znrkOl6yJ7Ts/GNrh1FIhf9NRlnD+n3/FnSrCI+2MJcWtQV01/pdzgBpu/4hyOouRiUy6XiR5/j4APO3CIlbfjE2k5K4BA1y73DIKIM8AkZlk8sYPUcKrvYwu6XMVAT6vdPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5389.eurprd05.prod.outlook.com (20.177.63.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Fri, 26 Jul 2019 00:16:30 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 00:16:30 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: hmm_range_fault related fixes and legacy API removal v3
Thread-Topic: hmm_range_fault related fixes and legacy API removal v3
Thread-Index: AQHVQexyfCYT3znpM0Ow5t5NZiu9m6bcCtwA
Date: Fri, 26 Jul 2019 00:16:30 +0000
Message-ID: <20190726001622.GL7450@mellanox.com>
References: <20190724065258.16603-1-hch@lst.de>
In-Reply-To: <20190724065258.16603-1-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::48) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca69ca56-6347-48a7-0ff0-08d7115e81d4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5389; 
x-ms-traffictypediagnostic: VI1PR05MB5389:
x-microsoft-antispam-prvs: <VI1PR05MB53890B869C202998ED9D6689CFC00@VI1PR05MB5389.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(199004)(189003)(66556008)(66446008)(4744005)(66946007)(66476007)(6486002)(1076003)(64756008)(71200400001)(476003)(66066001)(6246003)(71190400001)(99286004)(6436002)(229853002)(53936002)(25786009)(81166006)(86362001)(478600001)(6916009)(6506007)(256004)(7736002)(3846002)(386003)(81156014)(486006)(76176011)(305945005)(8676002)(36756003)(102836004)(14454004)(4326008)(186003)(11346002)(54906003)(2906002)(316002)(26005)(68736007)(33656002)(8936002)(2616005)(5660300002)(6116002)(52116002)(6512007)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5389;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NrmVLum9v2YBluzrp/mm1lBfpYaq+Gu1hv0gn7ggZrHzR9yH6MA/0XO7rOE6W6HwiyZvO4QLdhW8urne5fF2yANtHGsYbvMay2mb7f11AE/NLxBSXUhMjAGl0gz3Ts1of3+ERmpQ7ADZe0ediRyTXIUIWFHJRJHdSudZmqFKRN2aH5xjvJbX6BfG30bIDwJ9rbSsXbYryOxrKMg+R2770JxORJZDEC7PYBfM96CoPZuPV+hx+VtIcohphA+EfjVLewRC2wrzf4Jr2HoHpEavGaCP+36436Lv55A2lNph9+/Ixw4uiIfTPOmZZ8FQiod/hewpFI2LJak9KuNHPhsbr85hkpyxGBqefxmjU/fH1e0eVej8i6lf96Ti29mi3os7pmvIDxG2R+VWvVp4iq0dlX4zeJKx5D90mhOueIuMAXM=
Content-ID: <86BBF3FDDFDEC14E88EE4CCBA4717F7E@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca69ca56-6347-48a7-0ff0-08d7115e81d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 00:16:30.0910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5389
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0q7KETf8VOgdRydYjPeN0MMEKPYfp/4tpTOPqZtr/E0=;
 b=BPvqDOZ83VGD2ZpojFsykMRzKPQNfABicQx4MWQwP/vZjYzrhD6lAZZz01N145wBImU2sR6lHZ9Bx9O5kfbTTqeJBNrJ/oOkUXdgFQYhv+7NfxZazu+dfGmFc58W6r670I3ya2c5N/3ZjV8HndcgBumjduwXU30hOiMtL/aZyhY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDg6NTI6NTFBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6DQo+IEhpIErDqXLDtG1lLCBCZW4gYW5kIEphc29uLA0KPiANCj4gYmVsb3cgaXMg
YSBzZXJpZXMgYWdhaW5zdCB0aGUgaG1tIHRyZWUgd2hpY2ggZml4ZXMgdXAgdGhlIG1tYXBfc2Vt
DQo+IGxvY2tpbmcgaW4gbm91dmVhdSBhbmQgd2hpbGUgYXQgaXQgYWxzbyByZW1vdmVzIGxlZnRv
dmVyIGxlZ2FjeSBITU0gQVBJcw0KPiBvbmx5IHVzZWQgYnkgbm91dmVhdS4NCj4gDQo+IFRoZSBm
aXJzdCA0IHBhdGNoZXMgYXJlIGEgYnVnIGZpeCBmb3Igbm91dmVhdSwgd2hpY2ggSSBzdXNwZWN0
IHNob3VsZA0KPiBnbyBpbnRvIHRoaXMgbWVyZ2Ugd2luZG93IGV2ZW4gaWYgdGhlIGNvZGUgaXMg
bWFya2VkIGFzIHN0YWdpbmcsIGp1c3QNCj4gdG8gYXZvaWQgcGVvcGxlIGNvcHlpbmcgdGhlIGJy
ZWFrYWdlLg0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2MjoNCj4gIC0gbmV3IHBhdGNoIGZyb20gSmFz
b24gdG8gZG9jdW1lbnQgRkFVTFRfRkxBR19BTExPV19SRVRSWSBzZW1hbnRpY3MNCj4gICAgYmV0
dGVyDQo+ICAtIHJlbW92ZSAtRUFHQUlOIGhhbmRsaW5nIGluIG5vdXZlYXUgZWFybGllcg0KDQpJ
IGRvbid0IHNlZSBSYWxwaCdzIHRlc3RlZCBieSwgZG8geW91IHRoaW5rIGl0IGNoYW5nZWQgZW5v
dWdoIHRvDQpyZXF1aXJlIHRlc3RpbmcgYWdhaW4/IElmIHNvLCBSYWxwaCB3b3VsZCB5b3UgYmUg
c28ga2luZD8NCg0KSW4gYW55IGV2ZW50LCBJJ20gc2VuZGluZyB0aGlzIGludG8gbGludXgtbmV4
dCBhbmQgaW50ZW5kIHRvIGZvcndhcmQNCnRoZSBmaXJzdCBmb3VyIG5leHQgd2Vlay4NCg0KVGhh
bmtzLA0KSmFzb24NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
