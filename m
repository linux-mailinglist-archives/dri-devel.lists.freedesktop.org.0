Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C45104D0F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81D16EB84;
	Thu, 21 Nov 2019 08:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20085.outbound.protection.outlook.com [40.107.2.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAE06E5F3;
 Wed, 20 Nov 2019 13:49:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSK5yZHr5EIaQjMpdffEcoJiR4RYzZVlIF4jPzeDcEZK8xtNGXmXU3VKsWr8Ve5wJBNUHTyojds6Rm3CTSS6HbOolkgdKLiRP1u+FrZoR0VQgQdpH+wZfPR0HlW0KuP6T1z86ujd4fM1HDunJv1GfTXXVaK7X3AwR4qhIYIc7bM0qLpIQ9jE2xv9BlHZqNZGVCdCSY+DX4AD0RPo5xjZKw3+1uBHvpNCTd6flka1Vw8kmguvfU1781TmlfFdiTQaW25YGElkcebTO4hdla5HCM569szzptxtJE/GL5NR7C6rk4PdpXfJ3ugR5ytlG6TfvL9i77Hh/V4ZnTIpgAEYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFlGht2RAY0NzLB5U91MJYDcThgi38uEJuWYcDFl0cM=;
 b=KCvcoOD2JA2CAf62sdS40UCwWwmlYXlBgWzpVzMOoUuNwf7L6BYc3cK+olSELlX7Dn/ZKfd8SOoUpnxNeyBoohO8xotMyHZTAobvREzlsAZV02puJKt9J9IccN9N7x6ZCzxk4buwcoKxWOmGjkMFjlrTRCIBaoRCauDyMqDfmgGKLaVMZsxUYg0ov6Q6mT6t1b3NdEPGx98ONZYNsl+UQhMUUHLwRSWbzTidcPZZxNSxhdi4xeJu6opxc93h/oNAepy7ltDhn45OOCwAqb5tUgJY2RdM4iFSrmVTJxVrn+o8Zo4IpW8GrN/iCKFHYnpfPT0eplmSJe3FT79DqcHAHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4974.eurprd05.prod.outlook.com (20.177.49.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Wed, 20 Nov 2019 13:49:51 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2474.015; Wed, 20 Nov 2019
 13:49:50 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V13 4/6] mdev: introduce mediated virtio bus
Thread-Topic: [PATCH V13 4/6] mdev: introduce mediated virtio bus
Thread-Index: AQHVnf+nErtejYVqgk+5ox/jEh/QtKeQ75wAgABxg4CAAABsgIAAaCiAgACmrICAABd+AIAAA3OAgADJJwCAAMJGAA==
Date: Wed, 20 Nov 2019 13:49:50 +0000
Message-ID: <20191120134946.GD22466@mellanox.com>
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-5-jasowang@redhat.com>
 <20191118134056.GJ3873@mellanox.com>
 <20191118152642-mutt-send-email-mst@kernel.org>
 <20191118202843.GN3873@mellanox.com>
 <a09f528f-cfca-69cf-4728-91ff33c5caa7@redhat.com>
 <20191119123803.GA26739@mellanox.com>
 <d38abc98-b828-64cd-50cd-cb0d239e1696@redhat.com>
 <20191119141429.GF26739@mellanox.com>
 <3c3f8e30-bb75-3304-46b0-10a066ce1f42@redhat.com>
In-Reply-To: <3c3f8e30-bb75-3304-46b0-10a066ce1f42@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN8PR15CA0030.namprd15.prod.outlook.com
 (2603:10b6:408:c0::43) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c96ba6c4-77e6-465d-bc1e-08d76dc08361
x-ms-traffictypediagnostic: VI1PR05MB4974:|VI1PR05MB4974:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR05MB497401156E61F7893F427987CF4F0@VI1PR05MB4974.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(189003)(199004)(71190400001)(71200400001)(2906002)(1076003)(229853002)(6436002)(66066001)(4326008)(86362001)(6246003)(64756008)(66946007)(99286004)(66556008)(8676002)(66446008)(66476007)(81156014)(6116002)(3846002)(36756003)(5660300002)(478600001)(476003)(2616005)(7406005)(305945005)(7736002)(446003)(11346002)(486006)(26005)(6486002)(6916009)(8936002)(102836004)(6506007)(386003)(256004)(81166006)(6512007)(14454004)(54906003)(33656002)(52116002)(76176011)(25786009)(186003)(7416002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4974;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hfKYFZkDxXNinmPtV6SSHq6nwqaBWMIzmJxYbW8oFq+7xJsx0xrCO1k6orI3WiB2Kx1E2TrqoTTQivjqiTn1hVTrwFnYrnYM7VSv5jgpbY8zUAVDb/4IhpLPpGN0mgEvyoIISDcUgDsagbdmfCWLCKZP8D0W5Ysymd2oWM7Kr+XwOdK0979G/uUMlrznc+A56p6asxiY+V9EdV5ANJT42GW0CfqrVeV4oH/7fEvs0SA03a9jSXN6extQnuiSp8WJh/GfLj4kmXQ3Z4S/5T5CgNLbgbMnR/6RIG8tnK7tyX/Iy6OcCfSWAdQtp9fGp6jclnumvJQv9Dxh9ffT/zeRvACWYuru3zvsTC34UTFYu85LHwAd8yVg2PMGEND7VgVoVnR+yXvRcZpPoFR064/PPW4RwfJmoHOuv3nHjjYJiCVjelWKOrY4BKlX+UEiwXTi
Content-ID: <B473A60680438546969B0C6E361F6A9D@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c96ba6c4-77e6-465d-bc1e-08d76dc08361
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 13:49:50.6140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YeIi0N0SHee7qpMM6FoBYVuLJOFtgGqgSBd853rmUeK2j5bmcoggVjk8/Lx4OLgZH05fvxXhtaOXv6OQHMJyOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4974
X-Mailman-Approved-At: Thu, 21 Nov 2019 07:59:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFlGht2RAY0NzLB5U91MJYDcThgi38uEJuWYcDFl0cM=;
 b=lj6YDjGjp61jYO5EzxVOma2N9Uw+Sv+FBtMaqXYhVlso1a7PDUfL6YGghmyNoSF2DSiYz2JwyFsQh1UM/c252ZH0MTQeAOd4A2JGwJnfKjoS7anBKnMQYQRcUIGu7thqqnJciGG9B56Kik+JGm9M+l7idqiLhJYfz+XEfA3DlKE=
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
Cc: "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 Parav Pandit <parav@mellanox.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "aadam@redhat.com" <aadam@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTA6MTQ6MjZBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToNCg0KPiA+ID4gSSBkb24ndCBxdWl0ZSBnZXQgdGhlIHF1ZXN0aW9uIGhlcmUuDQo+ID4gSW4g
dGhlIGRyaXZlciBtb2RlbCB0aGUgYnVzX3R5cGUgYW5kIGZvb19kZXZpY2UgYXJlIGNsb3NlbHkN
Cj4gPiBsaW5rZWQuDQo+IA0KPiBJIGRvbid0IGdldCB0aGUgZGVmaW5pdGlvbiBvZiAiY2xvc2Vs
eSBsaW5rZWQiIGhlcmUuIERvIHlvdSB0aGluayB0aGUgYnVzDQo+IGFuZCBkZXZpY2UgaW1wbGVt
ZW50IHZpcnR1YWwgYnVzIHNlcmllcyBhcmUgY2xvc2VseSBsaW5rZWQ/IElmIHllcywgaG93IGRp
ZA0KPiB0aGV5IGFjaGlldmUgdGhhdD8NCg0KSSBtZWFuIGlmIHlvdSBoYXZlIGEgJ2Zvb19kZXZp
Y2UnIHRoZW4gaXQgc2hvdWxkIGJlIG9uIGEgJ2Zvb19idXMnIGFuZA0Kbm90IG9uIHNvbWUgJ2Jh
cl9idXMnLCBhcyB0aGF0IGlzIGhvdyB0aGUgZHJpdmVyIGNvcmUgZ2VuZXJhbGx5IHdvcmtzLg0K
IA0KPiA+ICAgQ3JlYXRpbmcgJ21kZXZfZGV2aWNlJyBpbnN0YW5jZXMgYW5kIG92ZXJyaWRpbmcg
dGhlIGJ1c190eXBlDQo+ID4gaXMgYSB2ZXJ5IGFidXNpdmUgdGhpbmcgdG8gZG8uDQo+IA0KPiBP
aywgbWRldl9kZXZpY2UgKHdpdGhvdXQgdGhpcyBzZXJpZXMpIGhhZDoNCj4gDQo+IHN0cnVjdCBt
ZGV2X2RldmljZSB7DQo+IMKgwqDCoCBzdHJ1Y3QgZGV2aWNlIGRldjsNCj4gwqDCoMKgIHN0cnVj
dCBtZGV2X3BhcmVudCAqcGFyZW50Ow0KPiDCoMKgwqAgZ3VpZF90IHV1aWQ7DQo+IMKgwqDCoCB2
b2lkICpkcml2ZXJfZGF0YTsNCj4gwqDCoMKgIHN0cnVjdCBsaXN0X2hlYWQgbmV4dDsNCj4gwqDC
oMKgIHN0cnVjdCBrb2JqZWN0ICp0eXBlX2tvYmo7DQo+IMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpp
b21tdV9kZXZpY2U7DQo+IMKgwqDCoCBib29sIGFjdGl2ZTsNCj4gfTsNCj4gDQo+IFNvIGl0J3Mg
bm90aGluZyBidXMgb3IgVkZJTyBzcGVjaWZpYy4gQW5kIHdoYXQgdmlydHVhbCBidXMgaGFkIGlz
Og0KDQpXaGF0IGRvIG1lYW4/ICdzdHJ1Y3QgbWRldl9wYXJlbnQgKnBhcmVudCcgaXMgdGhlIFZG
SU8gc3BlY2lmaWMNCnN0dWZmLiBJIGhhdmVuJ3QgZmlndXJlZCBvdXQgd2hhdCB0aGUgY29uZnVz
aW5nIG1kZXZfcGFyZW50IGlzDQpzdXBwb3NlZCB0byBiZSwgb3Igd2hoeSB0aGUgVkZJTyBvcHMg
YXJlIGxpbmtlZCB0byB0aGUgcGFyZW50IG9yIG5vdA0KdGhlIGRldmljZS4uIEhvbmVzdGx5IHRo
ZSB3aG9sZSBtZGV2IHRoaW5nIGhhcyBhIHZlcnkgc3RyYW5nZSB0YWtlIG9uDQpob3cgdG8gdXNl
IHRoZSBkcml2ZXIgY29yZS4NCg0KPiA+IEFidXNpbmcgaXQgZm9yIG90aGVyIHRoaW5ncyBpcyBu
b3QgYXBwcm9wcmlhdGUuIGllIGNyZWF0aW5nIGFuDQo+ID4gaW5zdGFuY2UgYW5kIG5vdCBmaWxs
aW5nIGluIG1vc3Qgb2YgdGhlIHZmaW8gZm9jdXNlZCBvcHMgaXMgYW4gYWJ1c2l2ZQ0KPiA+IHRo
aW5nIHRvIGRvLg0KPiANCj4gV2VsbCwgaXQncyBvbmx5IGhhbGYgb2YgdGhlIG1kZXZfcGFyZW50
X29wcyBpbiBtZGV2X3BhcmVudCwgdmFyaW91cyBtZXRob2RzDQo+IGNvdWxkIGJlIGRvbmUgZG8g
YmUgbW9yZSBnZW5lcmljIHRvIGF2b2lkIGR1cGxpY2F0aW9uIG9mIGNvZGVzLiBObz8NCg0KVGhl
cmUgYXJlIG1hbnkgd2F5cyB0byBhdm9pZCBkdXBsaWNhdGluZyBjb2RlLg0KDQpUYWtpbmcgc29t
ZXRoaW5nIHdlbGwgZGVmaW5lZCwgYW5kIGJvbHRpbmcgb24gc29tZXRoaW5nIHVucmVsYXRlZCBq
dXN0DQp0byBzaGFyZSBhIGJpdCBvZiBjb2RlIGlzIGEgdmVyeSBwb29yIHdheSB0byBhdm9pZCBj
b2RlIGR1cGxpY2F0aW9uLg0KDQo+IEknbSBzdXJlIHlvdSB3aWxsIG5lZWQgdG8gaGFuZGxlIG90
aGVyIGlzc3VlcyBiZXNpZGVzIEdVSUQgd2hpY2ggaGFkIGJlZW4NCj4gc2V0dGxlZCBieSBtZGV2
IGUuZyBJT01NVSBhbmQgdHlwZXMgd2hlbiBzdGFydGluZyB0byB3cml0ZSBhIHJlYWwgaGFyZHdh
cmUNCj4gZHJpdmVyLg0KDQpUaGUgaW9tbXUgZnJhbWV3b3JrIGFscmVhZHkgaGFuZGxlcyB0aGF0
LCB0aGUgbWRldiBzdHVmZiBjb250cmlidXRlcw0KdmVyeSBsaXR0bGUgZnJvbSB3aGF0IEkgY2Fu
IHNlZS4NCg0KPiA+IE1vc3QgbGlrZWx5LCBhdCBsZWFzdCBmb3IgdmlydGlvLW5ldCwgZXZlcnlv
bmUgZWxzZSB3aWxsIGJlIGFibGUgdG8NCj4gPiB1c2UgZGV2bGluayBhcyB3ZWxsLCBtYWtpbmcg
aXQgbXVjaCBsZXNzIGNsZWFyIGlmIHRoYXQgR1VJRCBsaWZlY3ljbGUNCj4gPiBzdHVmZiBpcyBh
IGdvb2QgaWRlYSBvciBub3QuDQo+IA0KPiBUaGlzIGFzc3VtcHRpb24gaXMgd3JvbmcsIHdlIGhh
cmQgYWxyZWFkeSBoYWQgYXQgbGVhc3QgdHdvIGNvbmNyZXRlIGV4YW1wbGVzDQo+IG9mIHZEUEEg
ZGV2aWNlIHRoYXQgZG9lc24ndCB1c2UgZGV2bGluazoNCj4gDQo+IC0gSW50ZWwgSUZDIHdoZXJl
IHZpcnRpbyBpcyBkb25lIGF0IFZGIGxldmVsDQo+IC0gQWxpIENsb3VkIEVDUyBpbnN0YW5jZSB3
aGVyZSB2aXJ0aW8gaXMgZG9uZSBhdCBQRiBsZXZlbA0KDQpBZ2FpbiwgeW91IGRvbid0IGV4cGxh
aW4gd2h5IHRoZXkgY291bGRuJ3QgdXNlIGRldmxpbmsuDQoNCk9yLCB3aHkgZG8gd2UgbmVlZCBH
VUlEIGxpZmVjeWNsZSBzdHVmZiB3aGVuIHRoZXNlIFBDSSBkZXZpY2VzIGNhbg0Kb25seSBjcmVh
dGUgYSBzaW5nbGUgdmlydGlvIGFuZCBjYW4ganVzdCBnbyBhaGVhZCBhbmQgZG8gdGhhdCBhcyBz
b29uDQphcyB0aGV5IGFyZSBwcm9iZWQuDQoNClRoZSBHVUlEIHN0dWZmIHdhcyBpbnZlbnRlZCBm
b3Igc2xpY2luZywgd2hpY2ggeW91IHNheSBpcyBub3QNCmhhcHBlbmluZyBpbiB0aGVzZSBjYXNl
cy4NCg0KSmFzb24NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
