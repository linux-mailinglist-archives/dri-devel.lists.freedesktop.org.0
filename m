Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF3590545
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 18:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA136E95F;
	Fri, 16 Aug 2019 16:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820045.outbound.protection.outlook.com [40.107.82.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DE16E95E;
 Fri, 16 Aug 2019 16:02:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqGSnTwfRrPZlL6OA1F7hnhfQ8oFQN+tDy44M8Dhlau1Dglkx/iWJzmofbI2nc4UJZliJUrX4ou2VNFwn3OuxL5AMEe8Q1keYFt7nKvI1puG8ZYbCFHCh8hsMgHBQOg9pD4PBClQcQ0R2N0s4yPbquHY8OFSR/5yJsgIUF7RY5pygFSlOm3v0oyKS+8Ba1OSGojXUzwli3o5QGkx5fF49wLgK4Pqvo8Udv+HdCZDnxj9fhjqFeMNaQdUifimCh09u8x/PLl6SBSfI+PYPQphyCEWJzppAseMurRIyn7pgrnNQExgNEF+bfg1lM4HGcEe8hx5rUianKoz2D/va7cy3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeAfGuAXMvMoCxxkoVWSMnPJckMy19P9o4uz6COFgIU=;
 b=jBNe7xeQWm3jdhuziPNTV+sUsnUIXrHpdEPIPicJG2FgCQuTkGL03E0Uy2S4Wq0p4E+h80i0geKnmO1bM/EbpPjBMMprKz6O6N44+8L2n+zo5vXt8qZqWeyTHDKhOK+5Wcctdls7m4M6ckNvAeAMQaazg/6XoQrTIhfXhMtky09JI2kvhMWdfrx818EWk7Dh4yAU2UKU12VHZBByCqgIM64BKe7PrFztAobbMpum7/2jx4mDeB15TxkTCgnbVz31OdJFcxaLJv2qd5WcWH35ScrpmMInCCcL2TZhHyEZ7Q5wuWWY/aDH+4QJ7rapXr38gTDw4tgic/TRhaUlr823Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1374.namprd12.prod.outlook.com (10.169.206.9) by
 MWHPR12MB1293.namprd12.prod.outlook.com (10.169.201.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Fri, 16 Aug 2019 16:02:30 +0000
Received: from MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::9c57:4338:ff8f:2cb8]) by MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::9c57:4338:ff8f:2cb8%12]) with mapi id 15.20.2157.022; Fri, 16 Aug
 2019 16:02:30 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: Jason Gunthorpe <jgg@mellanox.com>, Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH] mm/hmm: hmm_range_fault handle pages swapped out
Thread-Topic: [PATCH] mm/hmm: hmm_range_fault handle pages swapped out
Thread-Index: AQHVU6tqPJgEXxIoEkOKYOi6xfC1Fab88vqAgAD9roA=
Date: Fri, 16 Aug 2019 16:02:30 +0000
Message-ID: <6a694960-51c8-532c-6dfd-f3479d680510@amd.com>
References: <20190815205227.7949-1-Philip.Yang@amd.com>
 <20190816005429.GD9929@mellanox.com>
In-Reply-To: <20190816005429.GD9929@mellanox.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::33) To MWHPR12MB1374.namprd12.prod.outlook.com
 (2603:10b6:300:12::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 129d701d-7fff-4faf-ca41-08d722632421
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1293; 
x-ms-traffictypediagnostic: MWHPR12MB1293:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB12930C4EB6AE7C565E33050CE6AF0@MWHPR12MB1293.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(189003)(199004)(229853002)(25786009)(54906003)(110136005)(256004)(66556008)(6306002)(8676002)(486006)(6512007)(446003)(14444005)(11346002)(2616005)(86362001)(316002)(6436002)(6486002)(36756003)(71190400001)(8936002)(476003)(478600001)(71200400001)(4326008)(66066001)(31696002)(2906002)(6116002)(3846002)(53936002)(6246003)(186003)(53546011)(305945005)(26005)(99286004)(66446008)(6506007)(102836004)(52116002)(81156014)(386003)(31686004)(7736002)(66476007)(5660300002)(81166006)(966005)(64756008)(14454004)(76176011)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1293;
 H:MWHPR12MB1374.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MxoO7usSQ+eNEBcV2d6ZZodWvyqqykD2t1aH+I7Kmul5yG0pcfF05xbJZNz1/Nq7GgXJTc88cmlmQq3ydg6Ud9gg5yP5IKsYPSdj+xxUVI+5aaijrF26JTXM1ivAxTpqKimxefz09rcHIk5BvoJ7QbpsyZOVzLj4srBQf+OMCQwiNjViAeyfc0cI3qFRA9GG/xAeNB3UEj2vo4PrkHDOlR2u2aDcRE6U6Q1Nud8tw+wnlbH6pOpf5RBoFiBsqNbdxwitkkFFEX8Gqamcf8xIffJBq7z65d26F3avxyjDs2ev20s9YvPzHM/L41M4nGbP77v7p8rGHbO6U7S0sqFq09LbT5JpAMcmsrqSudR638dTl+N9WhQHgn7KYjLGElB5eT36Z8GhDc/C7Po8Yr0tqU0T6gPoNG4+2UpBNT1Cet4=
Content-ID: <E92A600FBFA46949A579DE30B5045F72@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 129d701d-7fff-4faf-ca41-08d722632421
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 16:02:30.3073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oi3p0nsmnQWREWXMu5QoqmJGh6HEQtoqHgRghZn0PGc2+0iNN2Yi0G5/Md3xYTfv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1293
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeAfGuAXMvMoCxxkoVWSMnPJckMy19P9o4uz6COFgIU=;
 b=NeFh7Vhma1vJH+C+Em9KPphoTw7tUuSsLnth78aHydq3nAiqa7GFleaTZDRjXTihCt5HFcGu/LJsts0+V3DHoVAteGPwlNefYLqr49Ql1JJUeQ8yawAygE2xz8lQeRhDE8F4gYPSo3NmnDGhHVApkqER2JaBInbQQevLV8VVTws=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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
Cc: "alex.deucher@amd.com" <alex.deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMDgtMTUgODo1NCBwLm0uLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6DQo+IE9u
IFRodSwgQXVnIDE1LCAyMDE5IGF0IDA4OjUyOjU2UE0gKzAwMDAsIFlhbmcsIFBoaWxpcCB3cm90
ZToNCj4+IGhtbV9yYW5nZV9mYXVsdCBtYXkgcmV0dXJuIE5VTEwgcGFnZXMgYmVjYXVzZSBzb21l
IG9mIHBmbnMgYXJlIGVxdWFsIHRvDQo+PiBITU1fUEZOX05PTkUuIFRoaXMgaGFwcGVucyByYW5k
b21seSB1bmRlciBtZW1vcnkgcHJlc3N1cmUuIFRoZSByZWFzb24gaXMNCj4+IGZvciBzd2FwcGVk
IG91dCBwYWdlIHB0ZSBwYXRoLCBobW1fdm1hX2hhbmRsZV9wdGUgZG9lc24ndCB1cGRhdGUgZmF1
bHQNCj4+IHZhcmlhYmxlIGZyb20gY3B1X2ZsYWdzLCBzbyBpdCBmYWlsZWQgdG8gY2FsbCBobW1f
dmFtX2RvX2ZhdWx0IHRvIHN3YXANCj4+IHRoZSBwYWdlIGluLg0KPj4NCj4+IFRoZSBmaXggaXMg
dG8gY2FsbCBobW1fcHRlX25lZWRfZmF1bHQgdG8gdXBkYXRlIGZhdWx0IHZhcmlhYmxlLg0KPiAN
Cj4+IENoYW5nZS1JZDogSTJlODYxMTQ4NTU2M2QxMWQ5Mzg4ODFjMThiNzkzNWZhMWU3YzkxZWUN
Cj4gDQo+IEknbGwgZml4IGl0IGZvciB5b3UgYnV0IHBsZWFzZSBiZSBjYXJlZnVsIG5vdCB0byBz
ZW5kIENoYW5nZS1pZCdzIHRvDQo+IHRoZSBwdWJsaWMgbGlzdHMuDQo+IA0KVGhhbmtzLCB0aGUg
Y2hhbmdlLWlkIHdhcyBhZGRlZCBieSBvdXIgR2Vycml0IGhvb2ssIEkgbmVlZCBnZW5lcmF0ZSAN
CnBhdGNoIGZpbGVzLCByZW1vdmUgY2hhbmdlLWlkIGxpbmUgYW5kIHRoZW4gc2VuZCBvdXQgbW9k
aWZpZWQgcGF0Y2ggDQpmaWxlcyBpbiBmdXR1cmUuDQoNCj4gQWxzbyB3aGF0IGlzIHRoZSBGaXhl
cyBsaW5lIGZvciB0aGlzPw0KPiANClRoaXMgZml4ZXMgdGhlIGlzc3VlIGZvdW5kIGJ5IHRoZSBp
bnRlcm5hbCByb2NydHN0LCB0aGUgDQpyb2NydHN0RnVuYy5NZW1vcnlfTWF4X01lbSBldmljdGVk
IHNvbWUgdXNlciBidWZmZXJzLCBhbmQgdGhlbiBmb2xsb3dpbmcgDQp0ZXN0IHJlc3RvcmUgdGhv
c2UgdXNlciBidWZmZXJzIGZhaWxlZCBiZWNhdXNlIHRoZSBidWZmZXJzIGFyZSBzd2FwcGVkIA0K
b3V0IGFuZCBhcHBsaWNhdGlvbiBkb2Vzbid0IHRvdWNoIHRoZSBidWZmZXJzIHRvIHN3YXAgaXQg
aW4uDQoNCj4+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29t
Pg0KPj4gICBtbS9obW0uYyB8IDMgKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykNCj4gDQo+IFJhbHBoIGhhcyBhbHNvIGJlZW4gbG9va2luZyBhdCB0aGlzIGFyZWEgYWxz
byBzbyBJJ2xsIGdpdmUgaGltIGEgYml0DQo+IHRvIGNoaW1lIGluLCBvdGhlcndpc2Ugd2l0aCBK
ZXJvbWUncyByZXZpZXcgdGhpcyBsb29rcyBPSyB0byBnbyB0bw0KPiBsaW51eC1uZXh0DQo+DQpP
aywgdGhhbmtzIGZvciBoZWxwaW5nIHB1c2ggdGhpcyB0byBobW0gYnJhbmNoIGF0IA0KaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmRtYS9yZG1hLmdpdA0K
DQo+IFRoYW5rcywNCj4gSmFzb24NCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
