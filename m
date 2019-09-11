Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B0AB092D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5002A6EB96;
	Thu, 12 Sep 2019 07:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780119.outbound.protection.outlook.com [40.107.78.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FB36E0E2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 23:34:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxRvxv4iilQcIEmDBY5ORSBkTu4wgfWwFzmhswY3S+MhzDgOWVEaKcOyp0kfHLXmJ0cMon17ERMilPhz8yd49bfk76LIH646ifFSr5YxcF4x2vaf6Q1v3RzFvy5/MCdLq+hFG1MVHpZmtMABWw69SoZUl3RN8DwJhjri1lc6HnBHwXYHd7eWbxQFiiItTjbpMnl4HVtzpWEalirdcjkiB9OYb4cPP6yLlT6M/r8rsBLe/vXmPMK9LmCfSpnx/48Web5/Z8S3+cPi/fQbe8caY91w/oOBOmu4ZTNLZzaMJgvAH8hr+sgfSeuPnjpO1g6O315KVYsL19nFoqVrWbBwWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2i0TtoMANsDUuR3gA1tMLi1H40lAHbI+cepHWyW1JFY=;
 b=EBykw5Tgjicp/X85eAa8lESrxgdYLFJHGOsHTYBT0SOJ2E2B8Mu2XhxmPYHI2Z4WouJVth/TNh2Pt7QlwP6wp/DeWoojzdLUklFmytuVZioDortPRGTKrU9QtihV3ZUK1q0HgyeRUiUy2uKORxO2qAG69CtyhZ4BeVtI8RhwURW02X8WWCCEVuNE0sjETIyCB8ZVRgNDcWeAKVq9jY3RKIaccdfMj7Si3QEEZIJYRtXhRMYmkVzUdGhh/yOjqnY6uvw88hkqZPQtGNGXvmhhmIwK+Y5zoDSfMEeQ3o58pBWDYxgBNx2lPlqbMoFAsYorDNvhUU9uuS0LEEf2O12fug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from SN6PR2101MB0942.namprd21.prod.outlook.com (52.132.114.19) by
 SN6PR2101MB0928.namprd21.prod.outlook.com (52.132.117.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.5; Wed, 11 Sep 2019 23:34:12 +0000
Received: from SN6PR2101MB0942.namprd21.prod.outlook.com
 ([fe80::dd56:aa4f:204f:86a4]) by SN6PR2101MB0942.namprd21.prod.outlook.com
 ([fe80::dd56:aa4f:204f:86a4%3]) with mapi id 15.20.2263.005; Wed, 11 Sep 2019
 23:34:12 +0000
From: Dexuan Cui <decui@microsoft.com>
To: KY Srinivasan <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
 Stephen Hemminger <sthemmin@microsoft.com>, "sashal@kernel.org"
 <sashal@kernel.org>, "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Kelley
 <mikelley@microsoft.com>
Subject: [PATCH] video: hyperv_fb: Add the support of hibernation
Thread-Topic: [PATCH] video: hyperv_fb: Add the support of hibernation
Thread-Index: AQHVaPlpoGmoU9RhmUGZUZsMyZEthw==
Date: Wed, 11 Sep 2019 23:34:10 +0000
Message-ID: <1568244833-66476-1-git-send-email-decui@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR02CA0057.namprd02.prod.outlook.com
 (2603:10b6:301:60::46) To SN6PR2101MB0942.namprd21.prod.outlook.com
 (2603:10b6:805:4::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.8.3.1
x-originating-ip: [13.77.154.182]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f1bbde1-400d-466f-b660-08d737108c2a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR2101MB0928; 
x-ms-traffictypediagnostic: SN6PR2101MB0928:|SN6PR2101MB0928:
x-ms-exchange-transport-forked: True
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <SN6PR2101MB09283DFA890F3B80771C916ABFB10@SN6PR2101MB0928.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:576;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(39860400002)(396003)(376002)(366004)(199004)(189003)(256004)(14444005)(476003)(2616005)(71200400001)(71190400001)(486006)(66556008)(1511001)(14454004)(66446008)(64756008)(66476007)(36756003)(66946007)(52116002)(110136005)(81156014)(50226002)(2501003)(8936002)(6506007)(386003)(81166006)(186003)(8676002)(66066001)(305945005)(316002)(10090500001)(7736002)(10290500003)(102836004)(26005)(5660300002)(22452003)(6512007)(6306002)(53936002)(2201001)(3450700001)(6486002)(6436002)(478600001)(43066004)(99286004)(966005)(6636002)(107886003)(4720700003)(6116002)(4326008)(86362001)(25786009)(3846002)(2906002)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR2101MB0928;
 H:SN6PR2101MB0942.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /a1DryAih0s377TX92sTzxaz3V6wlH165CXfVXjo1B7bKS0lXc2jmSvlpeIYs1MoOcZTNrQJIsjwEF447pkI4fv6PmZ9+zU6tri/8IEFmEUFWqTCedqmGbDbJ216LhkULbp/P5l7tgSYGSqTocF4EWvU6TbvqyrjdvPC0fgVh37G/a1b3cBBBwpFAsUq4KLsvDVi3buMFhexikfGKq0lCTZUgOt1A7GJxbDEq8fuI7AjSxwByG0OlL3HRPsYm98Am/XnJvP3vy7BKODQ+PlNPgN3wTnbtoGN5ZW7ePr3VrvE6VWWULWwzXk/ieu1TtkPEINDfcMXFQVQABHFD2mfUg/380mWyr/+jj72YX0b4YT7LMgbwHFsKY73Xb74KVQ89U4ylxnafa7N0CxMHWJoLCuTZBF8JZDFW24SxFtCiNU=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1bbde1-400d-466f-b660-08d737108c2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 23:34:12.0520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PzU1sJ8FNNZJAUpRS52fHkIUd9UTxq/1/oG/7ZO6u/P1axiWoFIE72OUIoV3BKE+V8X3rLX5KRJP5v7cn6XOHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR2101MB0928
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2i0TtoMANsDUuR3gA1tMLi1H40lAHbI+cepHWyW1JFY=;
 b=RpJbnd3o1DAkH5qeX+QTwQJyLEgH/4WuSX7cW9tC2j/p+Sz0iwK9sZv+0glAE4v08iin/ottFUPDpyxxLZ4Lu0cKHFvbZr4p/ohuJp5R23Ay26eUpRuP6UtEuHkH8PrlmRsUv7q34w2DpKab29Z+O1ji/qQxuPY5TG6wZY8bXZY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=decui@microsoft.com; 
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
Reply-To: Dexuan Cui <decui@microsoft.com>
Cc: Dexuan Cui <decui@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBkZXBlbmRzIG9uIHRoZSB2bWJ1cyBzaWRlIGNoYW5nZSBvZiB0aGUgZGVmaW5p
dGlvbiBvZgpzdHJ1Y3QgaHZfZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogRGV4dWFuIEN1aSA8ZGVj
dWlAbWljcm9zb2Z0LmNvbT4KLS0tCgpUaGlzIHBhdGNoIGlzIGJhc2ljYWxseSBhIHB1cmUgSHlw
ZXItViBzcGVjaWZpYyBjaGFuZ2UgYW5kIGl0IGhhcyBhCmJ1aWxkIGRlcGVuZGVuY3kgb24gdGhl
IGNvbW1pdCAyNzFiMjIyNGQ0MmYgKCJEcml2ZXJzOiBodjogdm1idXM6IEltcGxlbWVudApzdXNw
ZW5kL3Jlc3VtZSBmb3IgVlNDIGRyaXZlcnMgZm9yIGhpYmVybmF0aW9uIiksIHdoaWNoIGlzIG9u
IFNhc2hhIExldmluJ3MKSHlwZXItViB0cmVlJ3MgaHlwZXJ2LW5leHQgYnJhbmNoOgpodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9oeXBlcnYvbGludXguZ2l0
L2xvZy8/aD1oeXBlcnYtbmV4dAoKSSByZXF1ZXN0IHRoaXMgcGF0Y2ggc2hvdWxkIGdvIHRocm91
Z2ggU2FzaGEncyB0cmVlIHJhdGhlciB0aGFuIHRoZQpmYmRldiB0cmVlLgoKIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvaHlwZXJ2X2ZiLmMgfCA1OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9mYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9o
eXBlcnZfZmIuYwppbmRleCAyZGNiN2M1Li5mZTQ3MzFmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2h5cGVydl9mYi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvaHlwZXJ2X2Zi
LmMKQEAgLTM0LDYgKzM0LDcgQEAKICNpbmNsdWRlIDxsaW51eC9mYi5oPgogI2luY2x1ZGUgPGxp
bnV4L3BjaS5oPgogI2luY2x1ZGUgPGxpbnV4L2VmaS5oPgorI2luY2x1ZGUgPGxpbnV4L2NvbnNv
bGUuaD4KIAogI2luY2x1ZGUgPGxpbnV4L2h5cGVydi5oPgogCkBAIC0yMTEsNiArMjEyLDcgQEAg
c3RydWN0IGh2ZmJfcGFyIHsKIAogCXN0cnVjdCBkZWxheWVkX3dvcmsgZHdvcms7CiAJYm9vbCB1
cGRhdGU7CisJYm9vbCB1cGRhdGVfc2F2ZWQ7IC8qIFRoZSB2YWx1ZSBvZiAndXBkYXRlJyBiZWZv
cmUgaGliZXJuYXRpb24gKi8KIAogCXUzMiBwc2V1ZG9fcGFsZXR0ZVsxNl07CiAJdTggaW5pdF9i
dWZbTUFYX1ZNQlVTX1BLVF9TSVpFXTsKQEAgLTg3OCw2ICs4ODAsNjEgQEAgc3RhdGljIGludCBo
dmZiX3JlbW92ZShzdHJ1Y3QgaHZfZGV2aWNlICpoZGV2KQogCXJldHVybiAwOwogfQogCitzdGF0
aWMgaW50IGh2ZmJfc3VzcGVuZChzdHJ1Y3QgaHZfZGV2aWNlICpoZGV2KQoreworCXN0cnVjdCBm
Yl9pbmZvICppbmZvID0gaHZfZ2V0X2RydmRhdGEoaGRldik7CisJc3RydWN0IGh2ZmJfcGFyICpw
YXIgPSBpbmZvLT5wYXI7CisKKwljb25zb2xlX2xvY2soKTsKKworCS8qIDEgbWVhbnMgZG8gc3Vz
cGVuZCAqLworCWZiX3NldF9zdXNwZW5kKGluZm8sIDEpOworCisJY2FuY2VsX2RlbGF5ZWRfd29y
a19zeW5jKCZwYXItPmR3b3JrKTsKKworCXBhci0+dXBkYXRlX3NhdmVkID0gcGFyLT51cGRhdGU7
CisJcGFyLT51cGRhdGUgPSBmYWxzZTsKKwlwYXItPmZiX3JlYWR5ID0gZmFsc2U7CisKKwl2bWJ1
c19jbG9zZShoZGV2LT5jaGFubmVsKTsKKworCWNvbnNvbGVfdW5sb2NrKCk7CisKKwlyZXR1cm4g
MDsKK30KKworc3RhdGljIGludCBodmZiX3Jlc3VtZShzdHJ1Y3QgaHZfZGV2aWNlICpoZGV2KQor
eworCXN0cnVjdCBmYl9pbmZvICppbmZvID0gaHZfZ2V0X2RydmRhdGEoaGRldik7CisJc3RydWN0
IGh2ZmJfcGFyICpwYXIgPSBpbmZvLT5wYXI7CisJaW50IHJldDsKKworCWNvbnNvbGVfbG9jaygp
OworCisJcmV0ID0gc3ludGh2aWRfY29ubmVjdF92c3AoaGRldik7CisJaWYgKHJldCAhPSAwKQor
CQlnb3RvIG91dDsKKworCXJldCA9IHN5bnRodmlkX3NlbmRfY29uZmlnKGhkZXYpOworCWlmIChy
ZXQgIT0gMCkgeworCQl2bWJ1c19jbG9zZShoZGV2LT5jaGFubmVsKTsKKwkJZ290byBvdXQ7CisJ
fQorCisJcGFyLT5mYl9yZWFkeSA9IHRydWU7CisJcGFyLT51cGRhdGUgPSBwYXItPnVwZGF0ZV9z
YXZlZDsKKworCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmcGFyLT5kd29yaywgSFZGQl9VUERBVEVf
REVMQVkpOworCisJLyogMCBtZWFucyBkbyByZXN1bWUgKi8KKwlmYl9zZXRfc3VzcGVuZChpbmZv
LCAwKTsKKworb3V0OgorCWNvbnNvbGVfdW5sb2NrKCk7CisKKwlyZXR1cm4gcmV0OworfQorCiAK
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lfc3R1Yl9pZF90YWJsZVtdID0g
ewogCXsKQEAgLTkwMSw2ICs5NTgsOCBAQCBzdGF0aWMgaW50IGh2ZmJfcmVtb3ZlKHN0cnVjdCBo
dl9kZXZpY2UgKmhkZXYpCiAJLmlkX3RhYmxlID0gaWRfdGFibGUsCiAJLnByb2JlID0gaHZmYl9w
cm9iZSwKIAkucmVtb3ZlID0gaHZmYl9yZW1vdmUsCisJLnN1c3BlbmQgPSBodmZiX3N1c3BlbmQs
CisJLnJlc3VtZSA9IGh2ZmJfcmVzdW1lLAogCS5kcml2ZXIgPSB7CiAJCS5wcm9iZV90eXBlID0g
UFJPQkVfUFJFRkVSX0FTWU5DSFJPTk9VUywKIAl9LAotLSAKMS44LjMuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
