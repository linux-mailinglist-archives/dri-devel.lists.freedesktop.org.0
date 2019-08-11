Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D886890D4
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 11:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8F66E2FF;
	Sun, 11 Aug 2019 09:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760071.outbound.protection.outlook.com [40.107.76.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59276E2FF;
 Sun, 11 Aug 2019 09:01:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nP2VnWxfWUU/vQjK1lEhfk505QGMDwC8K6HuqwfwgnDdgFXXmvD91TPuiqCOI9ifKP9zZhxnNGnXV50V9ourSFc8bx8AhpAIe8xu7DbDNX4sTUBxW4xTnwETo/jgjgVXseWkUgRl9Yf9mowBETKjBsKDAQWdl5k/+qB4J3G8+1X+aXd9TqZ4Zsnh7CScLCXe4hCoLvMSNAbump+/UXCUq1y2ddSyT3DG6/tbTZp2aalze9dx2NRkYztP34NoFYIKdpNio3Xbink/MWjy9N4wGCS09ZguQ8AirUCQ6GskuqUbxRYXVF4YaHArHtkN9IOruxMfVOKhQjTrPKp89pfpWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=861cHBgaI2Hlpfqu/DXFfxQjv5tsrCVN/TlH8Tv0SRU=;
 b=lserNAsaKK5cAck1r9/hYm1XtOMphjudJVfwXm6BWiytFDnc5t7vX7QY+VYPxXfsn7G/xvx5+YKouJ15oknO+qM0Xfsbwpfq+Vh3ZIWYk/F95D75odX7l3nj/O5G9f3XyTAyLcHTUXP/kF+LNF6J4R0SMy/2+J6dVpSNfawzCi0KafnOLRHnXCzKLGR5KvnXxks/dov+c5I0AxpIoq+m2YCWVfwJYbYej1B2WjN7RCq/GucGzpT7BkCONhk/tBG/2qj0RRhTD14pQPuEr957wO/kAAGhxIZzNsB0ZBJOxnmhNZ/Uwj6HWhDoWQ1BJVtzY96OZqI/C8HOHEz27M4XSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1659.namprd12.prod.outlook.com (10.172.40.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Sun, 11 Aug 2019 09:01:46 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2157.022; Sun, 11 Aug
 2019 09:01:46 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] dma-fence: Always execute signal callbacks
Thread-Topic: [PATCH 4/4] dma-fence: Always execute signal callbacks
Thread-Index: AQHVT5FW/ZqVyX5zgEOTd3naGyX9BKb1p6WA
Date: Sun, 11 Aug 2019 09:01:46 +0000
Message-ID: <3b4da1e6-b5df-0f0e-cf4d-21dd6fd33e32@amd.com>
References: <20190810153430.30636-1-chris@chris-wilson.co.uk>
 <20190810153430.30636-4-chris@chris-wilson.co.uk>
In-Reply-To: <20190810153430.30636-4-chris@chris-wilson.co.uk>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0111.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::27) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 001b85ae-5d0a-4a3c-76ea-08d71e3a89a0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1659; 
x-ms-traffictypediagnostic: DM5PR12MB1659:
x-microsoft-antispam-prvs: <DM5PR12MB1659704BA211C20470C410FB83D00@DM5PR12MB1659.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0126A32F74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(199004)(189003)(64756008)(6512007)(256004)(86362001)(31696002)(305945005)(7736002)(14444005)(8936002)(66476007)(71200400001)(71190400001)(6116002)(65826007)(81166006)(81156014)(2906002)(5660300002)(8676002)(66446008)(66946007)(53936002)(66556008)(25786009)(4326008)(6246003)(229853002)(58126008)(52116002)(186003)(46003)(102836004)(76176011)(2501003)(446003)(476003)(31686004)(6506007)(478600001)(2616005)(11346002)(386003)(14454004)(486006)(65956001)(99286004)(65806001)(110136005)(36756003)(316002)(6436002)(6486002)(64126003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1659;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Bpmx81vkghlCQLW7oe7/9vz6Hfr7a0ZZ0b/SPt7ZbZDp+KPyHyhj2xX2IMXdluBpewU2wu4cDfTfgWbVCEaqZBrkHVJJq5Xl2gaaLkDiUeNlNqo9h3KF/EYC+j8Zc4q6oQJmHC9fbOBiLhsOyLLHAR7+hjXa+uUj8DsXv1LlzE6zo5l8QG3ajj1OrXd+uRGVkqNce+Ecg7Vl6z/AUHRVaI7pdPgre4qYsZgG0ZKULPhLw3S40GZcI6jxhXxErGfr7dgW2apprLmHNYykYttq5wV/mg9QAisLIgt6h9/uvE1cD9JAKXZpvYSZ7h5f81FJUze3ojEODjLs6gYRTrEnDdPP5tZrPd5n5R5JrCOrPXswLCzD5mnzW3pBtAuMsPKpAohYj0/z0HwVFddv4/LNOIqyhvrXl8cbYLPMUImzhcg=
x-ms-exchange-transport-forked: True
Content-ID: <29DF26538E727F47B61B8EDE36038DFE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 001b85ae-5d0a-4a3c-76ea-08d71e3a89a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2019 09:01:46.4014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AEH5/JkAsk1FNFEsSNFqRKWLQLbFOuGET+w+4Znp/mFO21dkhbFRill7a/lVRjgm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1659
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=861cHBgaI2Hlpfqu/DXFfxQjv5tsrCVN/TlH8Tv0SRU=;
 b=BCg/42TnNnq9H2tnqv0ecGChmBpNCtAQzMzWu6SNOTkbRguuAJ48TN0b1I8QxbGvzNhEtA4YD//f9LjBUhy64pTmiCQluAwYPAfgYs4g9ufGpb8xra2b7BnP5ME1jR1EMoclQWVbgMUwpsrAJT+me9xwXDeEUGyLVqjImaCTM5E=
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

QW0gMTAuMDguMTkgdW0gMTc6MzQgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IEFsbG93IGZvciBz
b21lIHVzZXJzIHRvIHN1cnJlcHRpdGlvdXNseSBpbnNlcnQgbGF6eSBzaWduYWwgY2FsbGJhY2tz
IHRoYXQNCj4gZG8gbm90IGRlcGVuZCBvbiBlbmFibGluZyB0aGUgc2lnbmFsaW5nIG1lY2hhbmlz
bSBhcm91bmQgZXZlcnkgZmVuY2UuDQo+IChUaGUgY29zdCBvZiBpbnRlcnJ1cHRzIGlzIHRvbyBk
YXJuIGhpZ2gsIHRvIHJldml2ZSBhbiBvbGQgbWVtZS4pDQo+IFRoaXMgbWVhbnMgdGhhdCB3ZSBt
YXkgaGF2ZSBhIGNiX2xpc3QgZXZlbiBpZiB0aGUgc2lnbmFsaW5nIGJpdCBpcyBub3QNCj4gZW5h
YmxlZCwgc28gYWx3YXlzIG5vdGlmeSB0aGUgY2FsbGJhY2tzLg0KPg0KPiBUaGUgY29zdCBpcyB0
aGF0IGRtYV9mZW5jZV9zaWduYWwoKSBtdXN0IGFsd2F5cyBhY3F1aXJlIHRoZSBzcGlubG9jayB0
bw0KPiBlbnN1cmUgdGhhdCB0aGUgY2JfbGlzdCBpcyBmbHVzaGVkLg0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4NCj4gLS0tDQo+ICAg
ZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jIHwgOCArKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMN
Cj4gaW5kZXggMDI3YTZhODk0YWJkLi5hYjRhNDU2YmJhMDQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYw0KPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNl
LmMNCj4gQEAgLTE3MCwxMSArMTcwLDkgQEAgaW50IGRtYV9mZW5jZV9zaWduYWwoc3RydWN0IGRt
YV9mZW5jZSAqZmVuY2UpDQo+ICAgDQo+ICAgCV9fZG1hX2ZlbmNlX3NpZ25hbF9fdGltZXN0YW1w
KGZlbmNlLCBrdGltZV9nZXQoKSk7DQo+ICAgDQo+IC0JaWYgKHRlc3RfYml0KERNQV9GRU5DRV9G
TEFHX0VOQUJMRV9TSUdOQUxfQklULCAmZmVuY2UtPmZsYWdzKSkgew0KPiAtCQlzcGluX2xvY2tf
aXJxc2F2ZShmZW5jZS0+bG9jaywgZmxhZ3MpOw0KPiAtCQlfX2RtYV9mZW5jZV9zaWduYWxfX25v
dGlmeShmZW5jZSk7DQo+IC0JCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoZmVuY2UtPmxvY2ssIGZs
YWdzKTsNCj4gLQl9DQo+ICsJc3Bpbl9sb2NrX2lycXNhdmUoZmVuY2UtPmxvY2ssIGZsYWdzKTsN
Cj4gKwlfX2RtYV9mZW5jZV9zaWduYWxfX25vdGlmeShmZW5jZSk7DQo+ICsJc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZShmZW5jZS0+bG9jaywgZmxhZ3MpOw0KDQpJZiB3ZSBub3cgYWx3YXlzIGdyYWIg
dGhlIHNwaW5sb2NrIGFueXdheSBJIHN1Z2dlc3QgdG8gcmF0aGVyIG1lcmdlIA0KZG1hX2ZlbmNl
X3NpZ25hbCBhbmQgZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQuDQoNCkNocmlzdGlhbi4NCg0KPiAg
IAlyZXR1cm4gMDsNCj4gICB9DQo+ICAgRVhQT1JUX1NZTUJPTChkbWFfZmVuY2Vfc2lnbmFsKTsN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
