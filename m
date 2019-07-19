Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 489E86EC58
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 00:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764416E872;
	Fri, 19 Jul 2019 22:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740045.outbound.protection.outlook.com [40.107.74.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEB66E86B;
 Fri, 19 Jul 2019 22:02:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKW6tr8wVKS2UiIuuCQpk/TiZyeFQwWqFeb1CkQlC5IJIbjkfeV6fz95TWFyDITPOzcymOgVP29NmgPSFFNMqRiZcRNEw2u9UG7zeThJ2k8VkoGYerwB83w+jijrGOARyVVNUoDrBptULdW2FO0hwIzkhjU9o3urfN3l5cyWIfECWnDt2PIFry151R7VyVMAPgS86OkDJ5vTCJK3/kD9iirnGSxsxMJkkWEECegcm08ZD70nMap19LBBqykWfWylUc95fmtfYTK+Worm0m4aZbdsRBkETl3xltNwhl9AQMlPfH0XIXCEMFXzuhiD+H4qkAXJQTZ7Z/F4bsJgH2LK5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FwOILOlrBvqJLknF7lig/bNDv35Zf2YXs3eje1W5fc=;
 b=dCao3Xa7TotXHP0tyxmZ9p8XnOdlyHiqwtBaMjyi9zvlXzZcbpXtba+Qcq/enF6NmBgFZD7TrVVEMhbO2w6/KxtMhvjoaf/djwJhHctPe/zMV7adcUciFmrnqWuMAVMicOhHeb3LVDrSS3Ma/d02kE6ghPvOwuPQ4rl/1VgaipeR/7M9jxFte5QfNxvpPz+LzNgePZVCfNiUF/2WCZ36IwvOhd2/R/NRX24Nxf+7o8irFCabK+n+u1v1HDn2s3tDNAhVUU1mIiVwV3RxyffHTQOBacmGeJqFaGTeJVDFvvY/zag4mL5f2DCRNkQ8sQgjUhp34CRxJi3aEsvgG1idPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3915.namprd12.prod.outlook.com (10.255.174.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.15; Fri, 19 Jul 2019 22:02:05 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 22:02:05 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/ttm: Add release_notify callback to ttm_bo_driver
Thread-Topic: [PATCH 3/4] drm/ttm: Add release_notify callback to ttm_bo_driver
Thread-Index: AQHVPn2Z90vw1Ah1BEWOH9I1DqRQVQ==
Date: Fri, 19 Jul 2019 22:02:05 +0000
Message-ID: <20190719220140.18968-3-Felix.Kuehling@amd.com>
References: <20190719220140.18968-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190719220140.18968-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::38) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06737b02-7cf8-4451-273a-08d70c94bc4a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3915; 
x-ms-traffictypediagnostic: DM6PR12MB3915:
x-microsoft-antispam-prvs: <DM6PR12MB391511755167371817D8555592CB0@DM6PR12MB3915.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(189003)(199004)(66446008)(66556008)(66476007)(66946007)(5660300002)(66066001)(64756008)(478600001)(53936002)(25786009)(7736002)(305945005)(256004)(14444005)(6436002)(486006)(86362001)(6486002)(52116002)(76176011)(450100002)(476003)(50226002)(68736007)(186003)(8676002)(2616005)(1076003)(14454004)(6506007)(102836004)(11346002)(446003)(2906002)(99286004)(2501003)(386003)(36756003)(71200400001)(71190400001)(6512007)(26005)(81156014)(6116002)(3846002)(8936002)(110136005)(81166006)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3915;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TxQEmr4pPrdkBxQzqoscF8yWC2WpHT3aiKmf86Ba/1oPslEZVDdr4rKG+1iXYIKTDnSzDxi/gR8LE3WG7lH+RBacJAnO7q12GuALp49czP9xcQvpb4L1aW8OpV2joYQYX0ZI1Wnum6uSziAFNbKcXo4cBemUlZ94OE16UYpPwD9cgUsIgsnzPNs7lAm+E05r57MV7TiarTuwoa2orTHTgiZRU4n1FDGIvJYGC86Q/4DfK8NKcs9ew2+ywZG6isoGuYgcVcRDN0blGco1v3MjQZuTBMnRAF2CCLa79JptbLra09WqddkUY2fHs3GXoJVlxc8vfRAfb7VlXcibbhnaTtemZe7+fkc31A1sHHxZv4o+IV80zTIsYapjtbVjJxAeRPRnh2c70+OHJuSbEuqeP7Okez2aiANLu0vxfqCB7UE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06737b02-7cf8-4451-273a-08d70c94bc4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 22:02:05.2012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3915
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FwOILOlrBvqJLknF7lig/bNDv35Zf2YXs3eje1W5fc=;
 b=uLcMt99bzD0Rb2jhoShMqd+GMzrvDkEBYfb4n6wShYQdLGwYN/WDu+iD21OQLcstZne9+rURqciSejwVyU6+0DrckvJuTcTk9shdAhjgaFhNfGokZ17STJ172QE/CdQn9TQbk+JptyhE4hjbZV72tLkjcjgoa2c3do8Djb3AEmU=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBub3RpZmllcyB0aGUgZHJpdmVyIHRoYXQgYSBCTyBpcyBhYm91dCB0byBiZSByZWxlYXNl
ZC4KClJlbGVhc2luZyBhIEJPIGFsc28gaW52b2tlcyB0aGUgbW92ZV9ub3RpZnkgY2FsbGJhY2sg
ZnJvbQp0dG1fYm9fY2xlYW51cF9tZW10eXBlX3VzZSwgYnV0IHRoYXQgaGFwcGVucyB0b28gbGF0
ZSBmb3IgYW55dGhpbmcKdGhhdCB3b3VsZCBhZGQgZmVuY2VzIHRvIHRoZSBCTyBhbmQgcmVxdWly
ZSBhIGRlbGF5ZWQgZGVsZXRlLgoKU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4
Lkt1ZWhsaW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAgICB8
ICAzICsrKwogaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCB8IDEwICsrKysrKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCmluZGV4
IDU4YzQwM2VkYTA0ZS4uMjA3MGU4YTU3ZWQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKQEAgLTY3MSw2
ICs2NzEsOSBAQCBzdGF0aWMgdm9pZCB0dG1fYm9fcmVsZWFzZShzdHJ1Y3Qga3JlZiAqa3JlZikK
IAlzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiA9IGJvLT5iZGV2OwogCXN0cnVjdCB0dG1fbWVt
X3R5cGVfbWFuYWdlciAqbWFuID0gJmJkZXYtPm1hbltiby0+bWVtLm1lbV90eXBlXTsKIAorCWlm
IChiby0+YmRldi0+ZHJpdmVyLT5yZWxlYXNlX25vdGlmeSkKKwkJYm8tPmJkZXYtPmRyaXZlci0+
cmVsZWFzZV9ub3RpZnkoYm8pOworCiAJZHJtX3ZtYV9vZmZzZXRfcmVtb3ZlKCZiZGV2LT52bWFf
bWFuYWdlciwgJmJvLT52bWFfbm9kZSk7CiAJdHRtX21lbV9pb19sb2NrKG1hbiwgZmFsc2UpOwog
CXR0bV9tZW1faW9fZnJlZV92bShibyk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRt
X2JvX2RyaXZlci5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAppbmRleCBjOWI4
YmE0OTJmMjQuLmQ2OTEyMWM0M2U1OCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9i
b19kcml2ZXIuaAorKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCkBAIC0zOTAs
NiArMzkwLDE2IEBAIHN0cnVjdCB0dG1fYm9fZHJpdmVyIHsKIAkgKiBub3RpZnkgZHJpdmVyIHRo
YXQgYSBCTyB3YXMgZGVsZXRlZCBmcm9tIExSVS4KIAkgKi8KIAl2b2lkICgqZGVsX2Zyb21fbHJ1
X25vdGlmeSkoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7CisKKwkvKioKKwkgKiBOb3Rp
ZnkgdGhlIGRyaXZlciB0aGF0IHdlJ3JlIGFib3V0IHRvIHJlbGVhc2UgYSBCTworCSAqCisJICog
QGJvOiBCTyB0aGF0IGlzIGFib3V0IHRvIGJlIHJlbGVhc2VkCisJICoKKwkgKiBHaXZlcyB0aGUg
ZHJpdmVyIGEgY2hhbmNlIHRvIGRvIGFueSBjbGVhbnVwLCBpbmNsdWRpbmcKKwkgKiBhZGRpbmcg
ZmVuY2VzIHRoYXQgbWF5IGZvcmNlIGEgZGVsYXllZCBkZWxldGUKKwkgKi8KKwl2b2lkICgqcmVs
ZWFzZV9ub3RpZnkpKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pOwogfTsKIAogLyoqCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
