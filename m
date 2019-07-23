Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E79571119
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 07:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6AC89E5A;
	Tue, 23 Jul 2019 05:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740080.outbound.protection.outlook.com [40.107.74.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3477789E5A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 05:23:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=We74DWcGuWYhUmaAdsXYZS0dOW3zzXbxFNZfSgE5d0awj1/b8AMVCcBhOKAiM/l3H1zxQPfsHwKHZan8PYVmQSpmha/fnub38WtI3TmCzTYkcFGCXinaUqp51CbwvcAAe0uUzF+VtqL1OWML/mC9qedGu9rzyt15GTuOEJ4v7dAYQqvfNktR1mOynyzJuXD+XARrV3+qqRSo1YUeMQOGEfWlynRL1i1s/FM5EmVVRrkM8g2RD5Ok29aYl3hBHbyxhURpaCEMcs+dFp8VVxcGfEGqEWt5jx9HnEMhK/v0ocMIFbo1dXD0Z323beYarwdzjNNVo+rENDAwJE+oVyah8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAnG0UTXwhrjER3HqeAn72FDG3O9jCzm77QuYtOxYhM=;
 b=PDpRIXYgVDnkgaDCq3aAWe7UvNa7zXseKWW8AkSn5j80hzIw9Is12wp5snH4rQtjcwTiwCq+b4BsgN7RVARASaa3cgp6Re6awZ21U4spNRoxQpCzmYDacArsr3DmyDh3JWV3DMeTLWFbSHObDtay4iK4taNTGCGCSlVhbZso80MPhYsxBQBl5eTcCtxL3yqqJFr54/WD/tqxtb46MOqP9ywKFLBj/dQdIXAG3OruJBJ4zQqnL0pbQTbt+948zk0MBaaN6EbduozHEQCaCbWS0C97zbA2r7eq1GGaMnxEoMw9NuYvag1YsxpoeSSh7H+kZeo301yf6moXZ+CoYi3NsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from SN1PR12CA0074.namprd12.prod.outlook.com (2603:10b6:802:20::45)
 by BN6PR12MB1570.namprd12.prod.outlook.com (2603:10b6:405:5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Tue, 23 Jul
 2019 05:23:10 +0000
Received: from BY2NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by SN1PR12CA0074.outlook.office365.com
 (2603:10b6:802:20::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Tue, 23 Jul 2019 05:23:09 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT041.mail.protection.outlook.com (10.152.85.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 05:23:09 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 23 Jul 2019
 00:23:08 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/syncobj: extend syncobj query ability
Date: Tue, 23 Jul 2019 13:22:57 +0800
Message-ID: <20190723052257.14436-1-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(2980300002)(428003)(189003)(199004)(53936002)(6916009)(2906002)(23676004)(476003)(7696005)(126002)(186003)(5660300002)(26005)(53416004)(2870700001)(305945005)(336012)(2616005)(426003)(68736007)(8676002)(50226002)(5820100001)(6666004)(356004)(36756003)(1076003)(8936002)(81166006)(70206006)(70586007)(47776003)(81156014)(316002)(54906003)(486006)(50466002)(86362001)(4326008)(478600001)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1570; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71b2fd73-0d6d-4d65-a47f-08d70f2dd9bd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1570; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1570:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1570454C939522E8C1FA6737B4C70@BN6PR12MB1570.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zK8qtC4at6QnumBTmso3+cVgntQN5M9wgyB9WS9OqsUEkcMNc+RtGVGld7AcBf8aBv6eRkppX2eoreYYzFz0CCgX/JChUDd89jFx0OmBXgBo54vox4YpRe8sSHlgAOkLdtaEYDjzONnSd1LywO72eAofTCU7n7x0gm2iD3xGXshQy947H+uEEY5UFPLzzehL8tMDhrqldCA3k4FeraLOeeZr133fNIBP5ecj/OkXvU33uglZxuixJPaZpoQ4R7yX8rXBErXTp84kHDOC1/alHZ/dy+9OT8XpA5YZHZeQTQxJPqJ7YddJZ2p1MWqhsOmiYyv+ZSW0Qd1xF+D5zN+zhpdbYnN5mC2uT7+yo4tJVlTB2LzTaMk/SOoMUG4BLH5QEaCoExs5M4OFRS17a11Chdej+cCB2XGDmaFOS3ZB7wo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 05:23:09.5672 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b2fd73-0d6d-4d65-a47f-08d70f2dd9bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1570
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAnG0UTXwhrjER3HqeAn72FDG3O9jCzm77QuYtOxYhM=;
 b=iRslmb0E+/KP3MumW7d4Y2iDvH3BsFpyfxj+2ucVbpTMQ3f7TUrp2VVZ3LsGXBON2NJwLG3Vi6FiXKEDUB53LTiO0qzM5TQKJ3nw7c0xhgaVaEo2a3KK1Z2bhFXfrqsequARxQU9HlL0mD3J3+O168Ayzlx5BUIV7BuCxWkKbDw=
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
YW4gZ2V0IGxhc3Qgc2lnbmFsZWQgb3Igc3VibWl0dGVkIHBvaW50LgoKQ2hhbmdlLUlkOiBJNjUx
MmI0MzA1MjRlYmFiZTcxNWU2MDJhMmJmNWFiYjBhN2U3ODBlYQpTaWduZWQtb2ZmLWJ5OiBDaHVu
bWluZyBaaG91IDxkYXZpZDEuemhvdUBhbWQuY29tPgpDYzogTGlvbmVsIExhbmR3ZXJsaW4gPGxp
b25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Q2hyaXN0
aWFuLktvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIHwg
MzYgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvdWFwaS9kcm0v
ZHJtLmggICAgICAgIHwgIDMgKystCiAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyks
IDE5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29i
ai5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKaW5kZXggM2Q0MDA5MDUxMDBiLi5m
NzBkZWRmM2VmNGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCkBAIC0xMTk3LDkgKzExOTcsNiBAQCBk
cm1fc3luY29ial90aW1lbGluZV9zaWduYWxfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
dm9pZCAqZGF0YSwKIAlpZiAoIWRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfU1lO
Q09CSl9USU1FTElORSkpCiAJCXJldHVybiAtRU9QTk9UU1VQUDsKIAotCWlmIChhcmdzLT5wYWQg
IT0gMCkKLQkJcmV0dXJuIC1FSU5WQUw7Ci0KIAlpZiAoYXJncy0+Y291bnRfaGFuZGxlcyA9PSAw
KQogCQlyZXR1cm4gLUVJTlZBTDsKIApAQCAtMTI2OCw5ICsxMjY1LDYgQEAgaW50IGRybV9zeW5j
b2JqX3F1ZXJ5X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJaWYg
KCFkcm1fY29yZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX1NZTkNPQkpfVElNRUxJTkUpKQog
CQlyZXR1cm4gLUVPUE5PVFNVUFA7CiAKLQlpZiAoYXJncy0+cGFkICE9IDApCi0JCXJldHVybiAt
RUlOVkFMOwotCiAJaWYgKGFyZ3MtPmNvdW50X2hhbmRsZXMgPT0gMCkKIAkJcmV0dXJuIC1FSU5W
QUw7CiAKQEAgLTEyOTEsMjMgKzEyODUsMjkgQEAgaW50IGRybV9zeW5jb2JqX3F1ZXJ5X2lvY3Rs
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJCWlmIChjaGFpbikgewogCQkJ
c3RydWN0IGRtYV9mZW5jZSAqaXRlciwgKmxhc3Rfc2lnbmFsZWQgPSBOVUxMOwogCi0JCQlkbWFf
ZmVuY2VfY2hhaW5fZm9yX2VhY2goaXRlciwgZmVuY2UpIHsKLQkJCQlpZiAoIWl0ZXIpCi0JCQkJ
CWJyZWFrOwotCQkJCWRtYV9mZW5jZV9wdXQobGFzdF9zaWduYWxlZCk7Ci0JCQkJbGFzdF9zaWdu
YWxlZCA9IGRtYV9mZW5jZV9nZXQoaXRlcik7Ci0JCQkJaWYgKCF0b19kbWFfZmVuY2VfY2hhaW4o
bGFzdF9zaWduYWxlZCktPnByZXZfc2Vxbm8pCi0JCQkJCS8qIEl0IGlzIG1vc3QgbGlrZWx5IHRo
YXQgdGltZWxpbmUgaGFzCi0JCQkJCSAqIHVub3JkZXIgcG9pbnRzLiAqLwotCQkJCQlicmVhazsK
KwkJCWlmIChhcmdzLT5mbGFncyAmCisJCQkgICAgRFJNX1NZTkNPQkpfUVVFUllfRkxBR1NfTEFT
VF9TVUJNSVRURUQpIHsKKwkJCQlwb2ludCA9IGZlbmNlLT5zZXFubzsKKwkJCX0gZWxzZSB7CisJ
CQkJZG1hX2ZlbmNlX2NoYWluX2Zvcl9lYWNoKGl0ZXIsIGZlbmNlKSB7CisJCQkJCWlmICghaXRl
cikKKwkJCQkJCWJyZWFrOworCQkJCQlkbWFfZmVuY2VfcHV0KGxhc3Rfc2lnbmFsZWQpOworCQkJ
CQlsYXN0X3NpZ25hbGVkID0gZG1hX2ZlbmNlX2dldChpdGVyKTsKKwkJCQkJaWYgKCF0b19kbWFf
ZmVuY2VfY2hhaW4obGFzdF9zaWduYWxlZCktPnByZXZfc2Vxbm8pCisJCQkJCQkvKiBJdCBpcyBt
b3N0IGxpa2VseSB0aGF0IHRpbWVsaW5lIGhhcworCQkJCQkJKiB1bm9yZGVyIHBvaW50cy4gKi8K
KwkJCQkJCWJyZWFrOworCQkJCX0KKwkJCQlwb2ludCA9IGRtYV9mZW5jZV9pc19zaWduYWxlZChs
YXN0X3NpZ25hbGVkKSA/CisJCQkJCWxhc3Rfc2lnbmFsZWQtPnNlcW5vIDoKKwkJCQkJdG9fZG1h
X2ZlbmNlX2NoYWluKGxhc3Rfc2lnbmFsZWQpLT5wcmV2X3NlcW5vOwogCQkJfQotCQkJcG9pbnQg
PSBkbWFfZmVuY2VfaXNfc2lnbmFsZWQobGFzdF9zaWduYWxlZCkgPwotCQkJCWxhc3Rfc2lnbmFs
ZWQtPnNlcW5vIDoKLQkJCQl0b19kbWFfZmVuY2VfY2hhaW4obGFzdF9zaWduYWxlZCktPnByZXZf
c2Vxbm87CiAJCQlkbWFfZmVuY2VfcHV0KGxhc3Rfc2lnbmFsZWQpOwogCQl9IGVsc2UgewogCQkJ
cG9pbnQgPSAwOwogCQl9CisJCWRtYV9mZW5jZV9wdXQoZmVuY2UpOwogCQlyZXQgPSBjb3B5X3Rv
X3VzZXIoJnBvaW50c1tpXSwgJnBvaW50LCBzaXplb2YodWludDY0X3QpKTsKIAkJcmV0ID0gcmV0
ID8gLUVGQVVMVCA6IDA7CiAJCWlmIChyZXQpCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJt
L2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm0uaAppbmRleCA2NjFkNzNmOWE5MTkuLmZkOTg3
Y2UyNGQ5ZiAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm0uaAorKysgYi9pbmNsdWRl
L3VhcGkvZHJtL2RybS5oCkBAIC03NzcsMTEgKzc3NywxMiBAQCBzdHJ1Y3QgZHJtX3N5bmNvYmpf
YXJyYXkgewogCV9fdTMyIHBhZDsKIH07CiAKKyNkZWZpbmUgRFJNX1NZTkNPQkpfUVVFUllfRkxB
R1NfTEFTVF9TVUJNSVRURUQgKDEgPDwgMCkgLyogbGFzdCBhdmFpbGFibGUgcG9pbnQgb24gdGlt
ZWxpbmUgc3luY29iaiAqLwogc3RydWN0IGRybV9zeW5jb2JqX3RpbWVsaW5lX2FycmF5IHsKIAlf
X3U2NCBoYW5kbGVzOwogCV9fdTY0IHBvaW50czsKIAlfX3UzMiBjb3VudF9oYW5kbGVzOwotCV9f
dTMyIHBhZDsKKwlfX3UzMiBmbGFnczsKIH07CiAKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
