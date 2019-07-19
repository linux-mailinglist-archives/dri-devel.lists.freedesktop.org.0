Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9661A6EC55
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 00:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738596E86B;
	Fri, 19 Jul 2019 22:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740045.outbound.protection.outlook.com [40.107.74.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CB56E86B;
 Fri, 19 Jul 2019 22:02:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJ4oUdsZIi+RvYiyP0E7gZsMGgf8ZSsMqPZ0vi1ado0LzUOHc/1ILz3i3GDJTQekZ9rev42kr7VDtaVRV2k0I7Ta0zSus7N6fc8F0eNyeROQGjtelc90Phh8WNz+hIlmtmFS2eecX/0skxeqAH+oPeE8mWav+CKCtPf0LNjsD28wLEzm1VEl+VZYTubzOGqAoHUcWIdPlLBXa+keGjYUo+KUgM0spGj+Rq2CY4522iAYySVMFl2IftFGBuNEaTgijT1nBknX2nnkmbqvwOdCim+IcMorvh85nHMzXcwMqb4dmQ4m407DNdz06FCmBjmouOfFPVoDhP48La6joGl4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83MMwuE9+92blTxMIYf/+fn9NS9u89ZzE/gsK11hPmI=;
 b=BsdNjO0QuaClNZ9HHcuOi4bmvbfMbxrzaBmG9NGfd2/bcAQXvAEbQdNFozChfy9xuwP6ZvhdPHS0cqLjuxY0YdxXzjTrNZ/V8ikpphcFIj/jNmivAJ2iA7G+wN7euZVLIr2d/r8PLLSjekso9s12gQKyp/Tgi02pVy0hv5q0ri/SBhwuCiTuq30ROXgAjb7Q4eD6uLkHNbNTUpxq1pWlvKuXtGZucKLbs4OdZH15ghOZRLnWci+IKNE1awL7x4xywIqyqoiuYJRfH+/43pKujHfutNW6HM2piKcfNgwqyUjAJyf9qM5HcIDM+3K7I6MElMXZ4iW2UbmJ9gwS9MgDLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3915.namprd12.prod.outlook.com (10.255.174.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.15; Fri, 19 Jul 2019 22:02:04 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 22:02:04 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/amdgpu: Add flag to wipe VRAM on release
Thread-Topic: [PATCH 1/4] drm/amdgpu: Add flag to wipe VRAM on release
Thread-Index: AQHVPn2ZtZE9HUndj0OxbiHrj2Wtag==
Date: Fri, 19 Jul 2019 22:02:04 +0000
Message-ID: <20190719220140.18968-1-Felix.Kuehling@amd.com>
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
x-ms-office365-filtering-correlation-id: cf208565-9304-494f-8d99-08d70c94bbab
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3915; 
x-ms-traffictypediagnostic: DM6PR12MB3915:
x-microsoft-antispam-prvs: <DM6PR12MB39157E13BCE1AC9F2CBFF44092CB0@DM6PR12MB3915.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(189003)(199004)(66446008)(66556008)(66476007)(66946007)(5660300002)(66066001)(64756008)(478600001)(53936002)(25786009)(7736002)(305945005)(256004)(6436002)(486006)(86362001)(6486002)(52116002)(450100002)(476003)(50226002)(68736007)(186003)(8676002)(2616005)(1076003)(14454004)(6506007)(4744005)(102836004)(2906002)(99286004)(2501003)(386003)(36756003)(71200400001)(71190400001)(6512007)(26005)(81156014)(6116002)(3846002)(8936002)(110136005)(81166006)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3915;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: St3h5f3/yFkt9HD8dbLQ8LcgwKgwtyJkpqLAKhzWPf9S0U8egWmvhHhOrHmDZufkOBT//4fwGz3senqga73TQ+FoGrTfUJafGawiSrefXKtGcJ0O91jBZYZLt4Eln+pVneVW343ZC/2mezHRe3YtfwxXJ9ZfLwVileI7zYRxddRc+uk5VX0P5oxsIOFijSg2z2yZMgZr9r4JoswuyxTavWpEZpWFAeuPBnO6SeRFgx27BXRHgMf/d/Tx/vv0cWy0zS9kHcwZ7kUqAAkNOhTTUPCBe19tOIvHQOZXzgciLPm5ghyD0Cxjj6QPldTZ6aJOLCQFtng8sPgLF7A2xku0UbLFrbeXoyREm0JAxqh8hwmby50bsHrEm1peYkgGsXnXIcFUP31pdnsGcS8XO6J9GMe35rn7pOpgdhDLm7X8vpo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf208565-9304-494f-8d99-08d70c94bbab
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 22:02:04.1718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3915
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83MMwuE9+92blTxMIYf/+fn9NS9u89ZzE/gsK11hPmI=;
 b=EH1JVi2N64P9TZjv/PPVmjn0OR4Pa4Zg/PJ7Rg1jHuE0CEmrBCaf0X5Bn/axO8SOZCfq9GXWyaOrRPUQnY5O9fLixX/7kGkcJnWyUiRwafk9q7MDtTQzLp/VbZU4j7rL03FoArBhQiVz1hf0GLUXoacp2T8s6JtvQI5qig4dwkI=
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

VGhpcyBtZW1vcnkgYWxsb2NhdGlvbiBmbGFnIHdpbGwgYmUgdXNlZCB0byBpbmRpY2F0ZSBCT3Mg
Y29udGFpbmluZwpzZW5zaXRpdmUgZGF0YSB0aGF0IHNob3VsZCBub3QgYmUgbGVha2VkIHRvIG90
aGVyIHByb2Nlc3Nlcy4KClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVo
bGluZ0BhbWQuY29tPgotLS0KIGluY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oIHwgNCArKysr
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91
YXBpL2RybS9hbWRncHVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAppbmRl
eCBkNDk1NzFkYWIyYTEuLmNhOTdiNjgwMjI3NSAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2Ry
bS9hbWRncHVfZHJtLmgKKysrIGIvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgKQEAgLTEz
MSw2ICsxMzEsMTAgQEAgZXh0ZXJuICJDIiB7CiAgKiBmb3IgdGhlIHNlY29uZCBwYWdlIG9ud2Fy
ZCBzaG91bGQgYmUgc2V0IHRvIE5DLgogICovCiAjZGVmaW5lIEFNREdQVV9HRU1fQ1JFQVRFX01R
RF9HRlg5CQkoMSA8PCA4KQorLyogRmxhZyB0aGF0IEJPIG1heSBjb250YWluIHNlbnNpdGl2ZSBk
YXRhIHRoYXQgbXVzdCBiZSB3aXBlZCBiZWZvcmUKKyAqIHJlbGVhc2luZyB0aGUgbWVtb3J5Cisg
Ki8KKyNkZWZpbmUgQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9XSVBFX09OX1JFTEVBU0UJKDEgPDwg
OSkKIAogc3RydWN0IGRybV9hbWRncHVfZ2VtX2NyZWF0ZV9pbiAgewogCS8qKiB0aGUgcmVxdWVz
dGVkIG1lbW9yeSBzaXplICovCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
