Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3806DAFBDF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 13:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626C66EAAF;
	Wed, 11 Sep 2019 11:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780088.outbound.protection.outlook.com [40.107.78.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F796EAAB;
 Wed, 11 Sep 2019 11:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KON4eOXwQSw3+vR9VCexT5WMACdk+XvnN90um2wh9slQWqWBg+twSE7CWPDibR0B4WBu+hFzkgQTAZ/IKrYI8YQLZn1uTRkPah7cuHEpZ7veEfCIXmq9vev14nh9OkKdRjlgVmgbZ1ciLkd6JqXIGgNz32b5tUjXkEq3B+/bDtreQD58jdapBkGMOKYU8jFfV6G8M6CU0h33yv4Mnv4LxUs0nQbVbkcCLZCOW9IZw+fGM068TKX2RQwxgqfFnH25RlxjCKv7bUly7hhLL+e0IUfGuqke25P/nJEuUcSX7OIvu6aGcklIuR585L+7s/htSoY0himuhjSLBF17eDHqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axCUwyo5M35ch2cEQY9g2G+2NmvVRhUUuJbPV8fc6Xg=;
 b=ZfjTcLW+FBmoNQVPE62OZ30XoNFPZRdPFEsxWjsU/MN9wlvTP/SsHBOLGd8gzdunPWUXOxP32RviBE7uqb7cE+tgieDlzmI785j2iIokBmBzz1Il6/QO3XoPlWYWJrSf5fKNVyStOXJvoOTvmBkcUEDMF0POkSGR3CQ/RISlV81bWiYHd087FpXzwXMb3q4j+GZa/UHCx2/X6lEIdG7WT6Ua6sJcwzniNXK3g89V14hDpQ8l5c9MMHbPLH0tG+cb3opZrRl/2y4QHdngdME/kRDORMEhA+Tqh7vtYvrv/W1aXdGcPMxoh+LHdj4DQMbIfDVF9do2unmVUNiFY4/nfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3421.namprd12.prod.outlook.com (20.178.243.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 11 Sep 2019 11:50:32 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2241.022; Wed, 11 Sep 2019
 11:50:32 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 09/14] drm/amdgpu: add tmz bit in frame control packet
Thread-Topic: [PATCH 09/14] drm/amdgpu: add tmz bit in frame control packet
Thread-Index: AQHVaJcdMUMDLK23ZE66ZgtUt5hOOw==
Date: Wed, 11 Sep 2019 11:50:32 +0000
Message-ID: <1568202584-14471-10-git-send-email-ray.huang@amd.com>
References: <1568202584-14471-1-git-send-email-ray.huang@amd.com>
In-Reply-To: <1568202584-14471-1-git-send-email-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR04CA0046.apcprd04.prod.outlook.com
 (2603:1096:202:14::14) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46b90cd6-8805-4aad-0405-08d736ae3fe0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3421; 
x-ms-traffictypediagnostic: MN2PR12MB3421:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB34217A9B4E8F7DDD5B960052ECB10@MN2PR12MB3421.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(199004)(189003)(6436002)(4326008)(25786009)(450100002)(6486002)(486006)(11346002)(446003)(2616005)(305945005)(7736002)(50226002)(8936002)(316002)(110136005)(54906003)(8676002)(6116002)(3846002)(2906002)(81166006)(81156014)(36756003)(14454004)(71190400001)(71200400001)(86362001)(66446008)(478600001)(66476007)(64756008)(66556008)(66946007)(256004)(99286004)(53936002)(5660300002)(19627235002)(76176011)(52116002)(6512007)(6636002)(386003)(6506007)(66066001)(102836004)(26005)(186003)(476003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3421;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3OwipqDuGNbzTAkEKE0Ell+9c2wiTrIiRR5ATAIcuMxoDj6TiWxgIuEr/wwYQePXoAcvtLyAKvmXCL0MFiMdXyjYbWAp5XtdRrlNE3wIH10kdCsZ7otq80JdupBDYQuLQd+FbN5n6h3iq07x24N/GJuV/U0Red1RhrAJGSCV9cbIj+ZGcvXEyqPxL0D+TLtcdshYq5x1yRxrAzAXnoWAuTnn0AlIb2RckU9YxvgWr9JndLABtVA3tw/P4lOMxVgWpdP0pvKRvRcvhtaIcc8eZO9y0/2/ppqk0bhdwCk+RvPpilojH5JNRcu3brsEtCAr9RTwQ3hyc3QUMH/p5tcL1qziuwacCQB7FXEUuVWjDMHnnRz7WRSmDlsuBSXhqpS+en2XtWbNBLAffXFIXzsjdwNFN8ZtoVG6Cfz+B6RD3ek=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b90cd6-8805-4aad-0405-08d736ae3fe0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 11:50:32.5076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 15ZZJJxyWN8uR4JcEYPY3QZjc5sHoAfr9Owfzn9EotOaRA0kRU9w0Rk69bUJ17D8QTqUeVEBn2ftOQbjTEJ+YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axCUwyo5M35ch2cEQY9g2G+2NmvVRhUUuJbPV8fc6Xg=;
 b=MSbeDC2EvgW0N5VisIV4IoKb/OgUhTa395T5Z8wxjREw5E6Yi+LEs983MEMivPoFUzkXBCRINkvIGzNcrYvP4AUVhEKae1TZkJpJecTS0nLnEa4gKs6m6LUFa6/8fqMHzlG/NpH/bTh4qry/Db6Bwae8uuCdALRgp82zNnRFRG0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu,
 Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIHRteiBiaXQgaW4gZnJhbWUgY29udHJvbCBwbTQgcGFja2V0LCBhbmQg
aXQgd2lsbCB1c2VkIGluIGZ1dHVyZS4KClNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1
YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnZkLmggICAgfCAxICsK
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1ZC5oIHwgMSArCiAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L252ZC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnZkLmgKaW5kZXggMWRlOTg0
Ni4uZjNkODc3MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnZkLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnZkLmgKQEAgLTMwNiw2ICszMDYsNyBA
QAogI2RlZmluZQlQQUNLRVQzX0dFVF9MT0RfU1RBVFMJCQkJMHg4RQogI2RlZmluZQlQQUNLRVQz
X0RSQVdfTVVMVElfUFJFQU1CTEUJCQkweDhGCiAjZGVmaW5lCVBBQ0tFVDNfRlJBTUVfQ09OVFJP
TAkJCQkweDkwCisjCQkJZGVmaW5lIEZSQU1FX1RNWgkoMSA8PCAwKQogIwkJCWRlZmluZSBGUkFN
RV9DTUQoeCkgKCh4KSA8PCAyOCkKIAkJCS8qCiAJCQkgKiB4PTA6IHRtel9iZWdpbgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTVkLmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zb2MxNWQuaAppbmRleCBlZGZlNTA4Li4yOTVkNjhjIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNWQuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zb2MxNWQuaApAQCAtMjg2LDYgKzI4Niw3IEBACiAjZGVmaW5lCVBBQ0tF
VDNfV0FJVF9PTl9ERV9DT1VOVEVSX0RJRkYJCQkweDg4CiAjZGVmaW5lCVBBQ0tFVDNfU1dJVENI
X0JVRkZFUgkJCQkweDhCCiAjZGVmaW5lIFBBQ0tFVDNfRlJBTUVfQ09OVFJPTAkJCQkweDkwCisj
CQkJZGVmaW5lIEZSQU1FX1RNWgkoMSA8PCAwKQogIwkJCWRlZmluZSBGUkFNRV9DTUQoeCkgKCh4
KSA8PCAyOCkKIAkJCS8qCiAJCQkgKiB4PTA6IHRtel9iZWdpbgotLSAKMi43LjQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
