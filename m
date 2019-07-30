Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 567927A920
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 15:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34C76E4EA;
	Tue, 30 Jul 2019 13:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780059.outbound.protection.outlook.com [40.107.78.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424066E4EA
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 13:02:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BN2u16R2K9XLUKXnBtR32zvcvzBHeN4QleLKFcTM2ejNz+d5pIsl+5Ht0WkUqpLbcF55nxXrNHObnX9vhlQFG7x/frEerebFiO3C1u2VO2P5mKeWCIoB83I4YGCmLk91EOV24ExlpHkLpEghvfrqm90bqe5sg+Unp6zP77Q7uA7Ruki12v12DbBwzgxqut2DiT9bNY69+LA5xeC+dA9Do0T1EsF6xPtWr8e8HGxaXEfo0JY6lr7bUaJsqEx+0u0RGX21vfsylKS+vylbJ2024OXnWc1RDhlkV+oDQ0yHoZ3/WyIE/zF2un6oH8FrWfxPQphCN29lOFsOff/KqjBbKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpywGKowgivwb6ETA5xOSFCM/0J4jChtjexrdb5gBHo=;
 b=UA17gvz1OAxFW4O9FaiMOuUfIYuNGNO8bKh8pU3iss8rET86Zow3qhoFDJT5367n5W8D109QcTrci+obM5/Rp0p6+U8F0ITGcO+0VjkeqT3trTWgjCVvehBtzCD1FDsOXx/sf3QffCXDMYzhHbDDQhJ2Gl+ZtGdpCxwUdADxOUi5BcX3kOEhjkvucqOQGdHwn3T4IpBD1wskTuP8RVQJkxlSQ89cQJ1BFTdZ912oAX+nBH1jIfG01YZuIzrqyWlZ1vAQfTbe3tSpy3zJmSuLJnuXFP9FiOvBWL6VAg4n4gWfHgx065AFIWecGq7iLWkki3t88rUhQGCn/CIpEg+Cow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM6PR12CA0032.namprd12.prod.outlook.com (2603:10b6:5:1c0::45)
 by MW2PR12MB2538.namprd12.prod.outlook.com (2603:10b6:907:9::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Tue, 30 Jul
 2019 13:02:21 +0000
Received: from CO1NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM6PR12CA0032.outlook.office365.com
 (2603:10b6:5:1c0::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15 via Frontend
 Transport; Tue, 30 Jul 2019 13:02:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT006.mail.protection.outlook.com (10.152.80.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Tue, 30 Jul 2019 13:02:21 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Jul 2019
 08:02:14 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/syncobj: extend syncobj query ability v3
Date: Tue, 30 Jul 2019 21:02:08 +0800
Message-ID: <20190730130208.30977-1-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(346002)(396003)(2980300002)(428003)(189003)(199004)(186003)(54906003)(86362001)(5660300002)(426003)(2351001)(50466002)(1076003)(6666004)(356004)(23676004)(2906002)(53936002)(336012)(26005)(2870700001)(316002)(7696005)(305945005)(50226002)(8936002)(81166006)(8676002)(81156014)(70206006)(70586007)(68736007)(47776003)(6916009)(486006)(2616005)(126002)(476003)(36756003)(5820100001)(53416004)(478600001)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2538; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32af8f98-3803-444b-2cf0-08d714ee28cb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MW2PR12MB2538; 
X-MS-TrafficTypeDiagnostic: MW2PR12MB2538:
X-Microsoft-Antispam-PRVS: <MW2PR12MB25389D5D46006CA83B2C3B2BB4DC0@MW2PR12MB2538.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 0114FF88F6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /iDrcj7PFRBpRIxsfdq1rkDaA9tVE9u0gapgvue1xY2R61lE89HGr/HsMsoOCKathYqtCU6lADmVpFBGCkYHibCR1x2XEIcrjUWM7gAp/zFz+FoR5eDblgQA4dUjWI7ey2m5oXjEH/98YNXQzlQeCeA4PIynq63P4f8btDViRXMb2BWlAWoa7UmM93z5EJfszqob2a1gjUMvLYdbVzX1TOEi5gSXvNacQChm2kfSuu9ZcZiM+xdmz9uOjZ36APov7L5vMsXJ5GdKrQCBDSxkgOyROcIE3yoYdNljzoGlFif9nLF1XLEHsHzsGhjrioipjyKuvIFTy1OAcodv67vI0U3jWu6HcypxXL+1UjTYyYgP4qSkr79Z5yjgzEZp9VzOzBtFA+e+ZRdLodb1RC4Yn9APH4BH7q12BRfLMPHq3OI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2019 13:02:21.2498 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32af8f98-3803-444b-2cf0-08d714ee28cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2538
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpywGKowgivwb6ETA5xOSFCM/0J4jChtjexrdb5gBHo=;
 b=mKD1/hDkAC7vqRDO/gNbETluyavO8IGASd8LI4WMrHMl5n9nwqQaeDvuUCrc8/zpnYXY4hTd1OXo1gKSMiB62KumDUsjelGNQR7R6uihMiTOSs9tGyMTgL+ye5fJZjossRN28qowCxv4RE1Tx5ZKlTTFg76Gf3tZ1S0Mx+CM3gE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dXNlciBzcGFjZSBuZWVkcyBhIGZsZXhpYWJsZSBxdWVyeSBhYmlsaXR5LgpTbyB0aGF0IHVtZCBj
YW4gZ2V0IGxhc3Qgc2lnbmFsZWQgb3Igc3VibWl0dGVkIHBvaW50Lgp2MjoKYWRkIHNhbml0aXpl
ciBjaGVja2luZy4KdjM6CnJlYmFzZQoKQ2hhbmdlLUlkOiBJNjUxMmI0MzA1MjRlYmFiZTcxNWU2
MDJhMmJmNWFiYjBhN2U3ODBlYQpTaWduZWQtb2ZmLWJ5OiBDaHVubWluZyBaaG91IDxkYXZpZDEu
emhvdUBhbWQuY29tPgpDYzogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5A
aW50ZWwuY29tPgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29t
PgpSZXZpZXdlZC1ieTogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50
ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIHwgMzcgKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvdWFwaS9kcm0vZHJtLmggICAgICAg
IHwgIDMgKystCiAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKaW5kZXggY2VjZmYyZTQ0N2IxLi5kNDQzMmYxNTEzYWMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fc3luY29iai5jCkBAIC0xMTk3LDcgKzExOTcsNyBAQCBkcm1fc3luY29ial90
aW1lbGluZV9zaWduYWxfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwK
IAlpZiAoIWRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfU1lOQ09CSl9USU1FTElO
RSkpCiAJCXJldHVybiAtRU9QTk9UU1VQUDsKIAotCWlmIChhcmdzLT5wYWQgIT0gMCkKKwlpZiAo
YXJncy0+ZmxhZ3MgIT0gMCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKIAlpZiAoYXJncy0+Y291bnRf
aGFuZGxlcyA9PSAwKQpAQCAtMTI2OCw3ICsxMjY4LDcgQEAgaW50IGRybV9zeW5jb2JqX3F1ZXJ5
X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJaWYgKCFkcm1fY29y
ZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX1NZTkNPQkpfVElNRUxJTkUpKQogCQlyZXR1cm4g
LUVPUE5PVFNVUFA7CiAKLQlpZiAoYXJncy0+cGFkICE9IDApCisJaWYgKGFyZ3MtPmZsYWdzICYg
fkRSTV9TWU5DT0JKX1FVRVJZX0ZMQUdTX0xBU1RfU1VCTUlUVEVEKQogCQlyZXR1cm4gLUVJTlZB
TDsKIAogCWlmIChhcmdzLT5jb3VudF9oYW5kbGVzID09IDApCkBAIC0xMjg5LDI1ICsxMjg5LDMy
IEBAIGludCBkcm1fc3luY29ial9xdWVyeV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2
b2lkICpkYXRhLAogCQlmZW5jZSA9IGRybV9zeW5jb2JqX2ZlbmNlX2dldChzeW5jb2Jqc1tpXSk7
CiAJCWNoYWluID0gdG9fZG1hX2ZlbmNlX2NoYWluKGZlbmNlKTsKIAkJaWYgKGNoYWluKSB7Ci0J
CQlzdHJ1Y3QgZG1hX2ZlbmNlICppdGVyLCAqbGFzdF9zaWduYWxlZCA9IE5VTEw7Ci0KLQkJCWRt
YV9mZW5jZV9jaGFpbl9mb3JfZWFjaChpdGVyLCBmZW5jZSkgewotCQkJCWlmIChpdGVyLT5jb250
ZXh0ICE9IGZlbmNlLT5jb250ZXh0KSB7Ci0JCQkJCWRtYV9mZW5jZV9wdXQoaXRlcik7Ci0JCQkJ
CS8qIEl0IGlzIG1vc3QgbGlrZWx5IHRoYXQgdGltZWxpbmUgaGFzCi0JCQkJCSAqIHVub3JkZXIg
cG9pbnRzLiAqLwotCQkJCQlicmVhazsKKwkJCXN0cnVjdCBkbWFfZmVuY2UgKml0ZXIsICpsYXN0
X3NpZ25hbGVkID0KKwkJCQlkbWFfZmVuY2VfZ2V0KGZlbmNlKTsKKworCQkJaWYgKGFyZ3MtPmZs
YWdzICYKKwkJCSAgICBEUk1fU1lOQ09CSl9RVUVSWV9GTEFHU19MQVNUX1NVQk1JVFRFRCkgewor
CQkJCXBvaW50ID0gZmVuY2UtPnNlcW5vOworCQkJfSBlbHNlIHsKKwkJCQlkbWFfZmVuY2VfY2hh
aW5fZm9yX2VhY2goaXRlciwgZmVuY2UpIHsKKwkJCQkJaWYgKGl0ZXItPmNvbnRleHQgIT0gZmVu
Y2UtPmNvbnRleHQpIHsKKwkJCQkJCWRtYV9mZW5jZV9wdXQoaXRlcik7CisJCQkJCQkvKiBJdCBp
cyBtb3N0IGxpa2VseSB0aGF0IHRpbWVsaW5lIGhhcworCQkJCQkJKiB1bm9yZGVyIHBvaW50cy4g
Ki8KKwkJCQkJCWJyZWFrOworCQkJCQl9CisJCQkJCWRtYV9mZW5jZV9wdXQobGFzdF9zaWduYWxl
ZCk7CisJCQkJCWxhc3Rfc2lnbmFsZWQgPSBkbWFfZmVuY2VfZ2V0KGl0ZXIpOwogCQkJCX0KLQkJ
CQlkbWFfZmVuY2VfcHV0KGxhc3Rfc2lnbmFsZWQpOwotCQkJCWxhc3Rfc2lnbmFsZWQgPSBkbWFf
ZmVuY2VfZ2V0KGl0ZXIpOworCQkJCXBvaW50ID0gZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKGxhc3Rf
c2lnbmFsZWQpID8KKwkJCQkJbGFzdF9zaWduYWxlZC0+c2Vxbm8gOgorCQkJCQl0b19kbWFfZmVu
Y2VfY2hhaW4obGFzdF9zaWduYWxlZCktPnByZXZfc2Vxbm87CiAJCQl9Ci0JCQlwb2ludCA9IGRt
YV9mZW5jZV9pc19zaWduYWxlZChsYXN0X3NpZ25hbGVkKSA/Ci0JCQkJbGFzdF9zaWduYWxlZC0+
c2Vxbm8gOgotCQkJCXRvX2RtYV9mZW5jZV9jaGFpbihsYXN0X3NpZ25hbGVkKS0+cHJldl9zZXFu
bzsKIAkJCWRtYV9mZW5jZV9wdXQobGFzdF9zaWduYWxlZCk7CiAJCX0gZWxzZSB7CiAJCQlwb2lu
dCA9IDA7CiAJCX0KKwkJZG1hX2ZlbmNlX3B1dChmZW5jZSk7CiAJCXJldCA9IGNvcHlfdG9fdXNl
cigmcG9pbnRzW2ldLCAmcG9pbnQsIHNpemVvZih1aW50NjRfdCkpOwogCQlyZXQgPSByZXQgPyAt
RUZBVUxUIDogMDsKIAkJaWYgKHJldCkKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJt
LmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybS5oCmluZGV4IDY2MWQ3M2Y5YTkxOS4uZmQ5ODdjZTI0
ZDlmIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybS5oCisrKyBiL2luY2x1ZGUvdWFw
aS9kcm0vZHJtLmgKQEAgLTc3NywxMSArNzc3LDEyIEBAIHN0cnVjdCBkcm1fc3luY29ial9hcnJh
eSB7CiAJX191MzIgcGFkOwogfTsKIAorI2RlZmluZSBEUk1fU1lOQ09CSl9RVUVSWV9GTEFHU19M
QVNUX1NVQk1JVFRFRCAoMSA8PCAwKSAvKiBsYXN0IGF2YWlsYWJsZSBwb2ludCBvbiB0aW1lbGlu
ZSBzeW5jb2JqICovCiBzdHJ1Y3QgZHJtX3N5bmNvYmpfdGltZWxpbmVfYXJyYXkgewogCV9fdTY0
IGhhbmRsZXM7CiAJX191NjQgcG9pbnRzOwogCV9fdTMyIGNvdW50X2hhbmRsZXM7Ci0JX191MzIg
cGFkOworCV9fdTMyIGZsYWdzOwogfTsKIAogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
