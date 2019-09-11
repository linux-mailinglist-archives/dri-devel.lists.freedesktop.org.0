Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A84FAFBCB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 13:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878666E24E;
	Wed, 11 Sep 2019 11:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750078.outbound.protection.outlook.com [40.107.75.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1186E24E;
 Wed, 11 Sep 2019 11:50:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsrbuFdVwVKEp0JyEcE1rkNJ4XMuzZKGUxggUpQXanjjLh8BDBkTD4JI5QeCdpJg/eqeB37Uof9Ypb/Cw/IXu0WMYfAzegSnvgfohUa6ZSu0u8lPS04nz8duVf0JapRBoMRbbfyC7T3pi90l5oI0aU5Lcl34sTWApLCEklVmF0aQBqrO5EuzSvUWOuRqxb20hELQ4cTiokASH++oIe/2Hy08TZaTh9cEUoLytVyBVjCCD9yWaOLAoBa6eD88u22wVjp/i71ho1S0yFKD2cZKWZjVDbyfknRNmDEjhlu23WkrTtYdKfNrEYxkLBxwYQW7pvwO47rGaxODZdBDGf/OWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLNspTKWflSNGy947WcvD6Zbelfa9wNPW5Fy13J3nAE=;
 b=EWtZPES8cvwUfyNTvRjKbhWdReSF/vhk0dbcauELEnY/jk7JR2mngyQQu3yC8DbHBbuEHgEZh200yKnIaQuI0DbaG/QrnIQxIHhRMTc6cmbdCz5G6VbzZty7XFMzxuSi1eyto4pt6KZIEER7vKRGa0MUfBwoWbQmPmsqJyJMg5h0fgtjX7QaHFSrY/U/R4uXawwm6IH2+9cfWr0K/vQ261z2YT6Hr/xBfme+OLkeqBN9hGoTgTlupnnhwWm+21ZWy+RaluKcSoFZmJRQTGfFrPa2lx88NocqqA4F13olI2KN0qmAz1PRJMfbn9GRh881vJsI4NADQA82ULyZVzqpqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3421.namprd12.prod.outlook.com (20.178.243.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 11 Sep 2019 11:50:02 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2241.022; Wed, 11 Sep 2019
 11:50:02 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 00/14] drm/amdgpu: introduce secure buffer object support
 (trusted memory zone)
Thread-Topic: [PATCH 00/14] drm/amdgpu: introduce secure buffer object support
 (trusted memory zone)
Thread-Index: AQHVaJcL6qF1r2/r6EufMx2zmHu1dQ==
Date: Wed, 11 Sep 2019 11:50:02 +0000
Message-ID: <1568202584-14471-1-git-send-email-ray.huang@amd.com>
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
x-ms-office365-filtering-correlation-id: f74a8a59-d18f-4c1e-d640-08d736ae2df6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3421; 
x-ms-traffictypediagnostic: MN2PR12MB3421:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB34211E856C36C9825B881795ECB10@MN2PR12MB3421.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(53754006)(199004)(189003)(6436002)(4326008)(25786009)(450100002)(6486002)(486006)(2616005)(305945005)(7736002)(50226002)(8936002)(316002)(110136005)(54906003)(8676002)(6116002)(3846002)(2906002)(81166006)(81156014)(36756003)(14454004)(71190400001)(71200400001)(86362001)(66446008)(478600001)(66476007)(64756008)(66556008)(66946007)(14444005)(256004)(99286004)(53936002)(5660300002)(52116002)(6512007)(6636002)(386003)(6506007)(66066001)(102836004)(26005)(186003)(476003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3421;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jtVbn5MW0p3Y9gtAN36FUs4esnxydTscSLDRhDgp14L6GaxScEUHU+PxDwWKs0aI0ImDsBT3JlCoPNdkbXdp5hBTQtcnSsde1VBM0ZOcjYd8VndQ5llXeQWF6eoZNJlbZNFmgTy6WMpVrkiSI8vdJl+cvXSfCIYjTTAcvXV+z9mdiqL01I4MiWR5HOqGhGeC7TNNrqQ5oVkNDVxXmRaP4wiwCryRIUN2NK1zZyqu9jcg7s7OM86nhltR6/264vQLrXyeKRJ9ugRs7C4ZeIH+XnIsXnvfx9akH6+951pSLHHjOlKpaEd/fdktULvak/KwQKtqFp2K9fjsvOWm0703lZ6SvNgmPj41nI98RPwp7OrzQo6kAN9V6wRIS3V/ErTnbfnVngFTCTngd7kZ18Oo732q8x5Yqu+3JR+fokaedqI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f74a8a59-d18f-4c1e-d640-08d736ae2df6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 11:50:02.2073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IbBvz/kZ1iN3AmNy/DrKslT4s8Pi2NmH5w18Ouv09SGJ/jq9Rrn+8ExcFMg9IXn3a4qG6K2WROC95HiqhYeh4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLNspTKWflSNGy947WcvD6Zbelfa9wNPW5Fy13J3nAE=;
 b=BhQWUlq9CjF9Sk4k/YUFjPLrhY8fNRSuea0PBPXGyPotIVVzxN/0k4KOTpmblXtAZitkbZLIq9fkDOdKBNwJqNdOmxJgFLEHmJHQ067xRcwFs+iOr8qyHVrxXlDePd9G6UMWI8frcqZ3/C8bPl5zKvm5KNiIQu+NC9+hU27s8fU=
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

SGkgYWxsLAoKVGhlc2Ugc2VyaWVzIG9mIHBhdGNoZXMgaW50cm9kdWNlIGEgZmVhdHVyZSB0byBz
dXBwb3J0IHNlY3VyZSBidWZmZXIgb2JqZWN0LgpUaGUgVHJ1c3RlZCBNZW1vcnkgWm9uZSAoVE1a
KSBpcyBhIG1ldGhvZCB0byBwcm90ZWN0IHRoZSBjb250ZW50cyBiZWluZyB3cml0dGVuCnRvIGFu
ZCByZWFkIGZyb20gbWVtb3J5LiBXZSB1c2UgVE1aIGhhcmR3YXJlIG1lbW9yeSBwcm90ZWN0aW9u
IHNjaGVtZSB0bwppbXBsZW1lbnQgdGhlIHNlY3VyZSBidWZmZXIgb2JqZWN0IHN1cHBvcnQuCgpU
TVogaXMgdGhlIHBhZ2UtbGV2ZWwgcHJvdGVjdGlvbiB0aGF0IGhhcmR3YXJlIHdpbGwgZGV0ZWN0
IHRoZSBUTVogYml0IGluIHRoZQpwYWdlIHRhYmxlIGVudHJ5IHRvIHNldCB0aGUgY3VycmVudCBw
YWdlIGlzIGVuY3J5cHRlZC4gV2l0aCB0aGlzIGhhcmR3YXJlCmZlYXR1cmUsIHdlIGRlc2lnbiBh
IEJPLWxldmVsIHByb3RlY3Rpb24gaW4ga2VybmVsIGRyaXZlciB0byBwcm92aWRlIGEgbmV3IGZs
YWcKQU1ER1BVX0dFTV9DUkVBVEVfRU5DUllQVEVEIHRvIGdlbSBjcmVhdGUgaW9jdGwgdG8gbGli
ZHJtIGZvciB0aGUgc2VjdXJlIGJ1ZmZlcgphbGxvY2F0aW9uLiBBbmQgYWxzbyBwcm92aWRlIHRo
ZSBBTURHUFVfQ1RYX0FMTE9DX0ZMQUdTX1NFQ1VSRSB0byBpbmRpY2F0ZSB0aGUKY29udGV4dCBp
cyB0cnVzdGVkIG9yIG5vdC4gSWYgdGhlIEJPIGlzIHNlY3VyZSwgdGhlbiB0aGUgZGF0YSBpcyBl
bmNyeXB0ZWQsIG9ubHkKdGhlIHRydXN0ZWQgSVAgYmxvY2tzIHN1Y2ggYXMgZ2Z4LCBzZG1hLCB2
Y24gYXJlIGFibGUgdG8gZGVjcnlwdC4gQ1BVIGFzIHRoZQp1bi10cnVzdGVkIElQIGFyZSB1bmFi
bGUgdG8gcmVhZCB0aGUgc2VjdXJlIGJ1ZmZlci4KCldlIHdpbGwgc3VibWl0IHRoZSBuZXcgc2Vj
dXJlIGNvbnRleHQgaW50ZXJmYWNlIGxhdGVyIGZvciBsaWJkcm0sIGFuZCBjcmVhdGUgYQpuZXcg
dGVzdCBzdWl0ZSB0byB2ZXJpZnkgdGhlIHNlY3VyaXR5IGZlYXR1cmUgaW4gdGhlIGxpYmRybSB1
bml0IHRlc3RzLgoKU3VpdGUgaWQgPSAxMTogTmFtZSAnU2VjdXJpdHkgVGVzdHMgc3RhdHVzOiBF
TkFCTEVEJwpUZXN0IGlkIDE6IE5hbWU6ICdhbGxvY2F0ZSBzZWN1cmUgYnVmZmVyIHRlc3Qgc3Rh
dHVzOiBFTkFCTEVEJwpUZXN0IGlkIDI6IE5hbWU6ICdncmFwaGljcyBjb21tYW5kIHN1Ym1pc3Np
b24gdW5kZXIgc2VjdXJlIGNvbnRleHQgc3RhdHVzOiBFTkFCTEVEJwoKVGhhbmtzLApSYXkKCkFs
ZXggRGV1Y2hlciAoNCk6CiAgZHJtL2FtZGdwdTogYWRkIFVBUEkgZm9yIGNyZWF0aW5nIGVuY3J5
cHRlZCBidWZmZXJzCiAgZHJtL2FtZGdwdTogYWRkIFVBUEkgZm9yIGNyZWF0aW5nIHNlY3VyZSBj
b250ZXh0cyAodjIpCiAgZHJtL2FtZGdwdTogZGVmaW5lIHRoZSBUTVogYml0IGZvciB0aGUgUFRF
CiAgZHJtL2FtZGdwdTogc2V0IFRNWiBiaXRzIGluIFBURXMgZm9yIHNlY3VyZSBibyAodjIpCgpI
dWFuZyBSdWkgKDEwKToKICBkcm0vYW1kZ3B1OiBhZGQgdG16IGZlYXR1cmUgcGFyYW1ldGVyICh2
MikKICBkcm0vYW1kZ3B1OiBhZGQgYW1kZ3B1X3RteiBkYXRhIHN0cnVjdHVyZQogIGRybS9hbWRn
cHU6IGFkZCBmdW5jdGlvbiB0byBjaGVjayB0bXogY2FwYWJpbGl0eSAodjQpCiAgZHJtL3R0bTog
YWRkIGhlbHBlciB0byBnZXQgYnVmZmVyIG9iamVjdCB3aXRoIHR0bV9tZW1fcmVnCiAgZHJtL2Ft
ZGdwdTogcmV2aXNlIHRoZSBmdW5jdGlvbiB0byBhbGxvY2F0ZSBzZWN1cmUgY29udGV4dCAodjIp
CiAgZHJtL2FtZGdwdTogYWRkIHRteiBiaXQgaW4gZnJhbWUgY29udHJvbCBwYWNrZXQKICBkcm0v
YW1kZ3B1OiBleHBhbmQgdGhlIGVtaXQgdG16IGludGVyZmFjZSB3aXRoIHRydXN0ZWQgZmxhZwog
IGRybS9hbWRncHU6IGV4cGFuZCB0aGUgY29udGV4dCBjb250cm9sIGludGVyZmFjZSB3aXRoIHRy
dXN0IGZsYWcKICBkcm0vYW1kZ3B1OiBzZXQgdHJ1c3RlZCBtb2RlIHdoaWxlIHRoZSBqb2IgaXMg
dW5kZXIgc2VjdXJlIGNvbnRleHQKICAgICh2MikKICBkcm0vYW1kZ3B1OiBtb2RpZnkgdGhlIG1l
dGhvZCB0byB1c2UgbWVtIHVuZGVyIGJ1ZmZlciBvYmplY3QgZm9yCiAgICBhbWRncHVfdHRtX3R0
X3B0ZV9mbGFncwoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlICAgICAgICB8
ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCAgICAgICAgfCAgNyAr
KysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgICAgIHwgIDEgKwog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jICAgIHwgMTkgKysrKysrKysr
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmggICAgfCAgMSArCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAgMyArKwogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jICAgIHwgMTEgKysrKysrKwogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jICAgIHwgMTIgKysrKysrKy0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jICAgICB8ICA0ICstLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5oICAgIHwgIDIgKysKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaCB8IDEwICsrKysrKwogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaCAgIHwgIDkgKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdG16LmMgICAgfCA0OSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90bXouaCAgICB8IDM5ICsr
KysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3R0bS5jICAgIHwgMjMgKysrKysrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92bS5oICAgICB8ICAzICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djEwXzAuYyAgICAgfCAyMCArKysrKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92Nl8wLmMgICAgICB8ICAzICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djdfMC5jICAgICAgfCAgMyArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAu
YyAgICAgIHwgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgICAg
ICB8IDE2ICsrKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252ZC5oICAgICAg
ICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1ZC5oICAgICAgICB8
ICAxICsKIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggICAgICAgICAgICB8IDEzICsr
KysrKysrCiBpbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCAgICAgICAgICAgICAgfCAgOSAr
KysrKy0KIDI1IGZpbGVzIGNoYW5nZWQsIDIzMCBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMo
LSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dG16LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdG16LmgKCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
