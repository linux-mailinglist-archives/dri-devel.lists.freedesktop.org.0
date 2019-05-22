Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 704E926549
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 15:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9A589A98;
	Wed, 22 May 2019 13:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820045.outbound.protection.outlook.com [40.107.82.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2496689A72;
 Wed, 22 May 2019 13:57:34 +0000 (UTC)
Received: from SN1PR12CA0067.namprd12.prod.outlook.com (2603:10b6:802:20::38)
 by BYASPR01MB3.namprd12.prod.outlook.com (2603:10b6:a02:ce::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.15; Wed, 22 May
 2019 13:57:32 +0000
Received: from CO1NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by SN1PR12CA0067.outlook.office365.com
 (2603:10b6:802:20::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Wed, 22 May 2019 13:57:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT003.mail.protection.outlook.com (10.152.80.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Wed, 22 May 2019 13:57:31 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 22 May 2019 08:57:29 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <dan.carpenter@oracle.com>, <ckoenig.leichtzumerken@gmail.com>
Subject: [PATCH] drm/sched: Fix static checker warning for potential NULL ptr
Date: Wed, 22 May 2019 09:57:23 -0400
Message-ID: <1558533443-7795-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(136003)(376002)(346002)(2980300002)(428003)(189003)(199004)(14444005)(356004)(51416003)(86362001)(44832011)(4326008)(7696005)(6666004)(2201001)(47776003)(48376002)(16586007)(110136005)(50466002)(476003)(426003)(186003)(2906002)(70206006)(2616005)(36756003)(50226002)(68736007)(8936002)(478600001)(305945005)(81156014)(53416004)(53936002)(77096007)(72206003)(316002)(81166006)(8676002)(5660300002)(70586007)(126002)(26005)(486006)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYASPR01MB3; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d658a8b4-faa4-4677-78d0-08d6debd6f2a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BYASPR01MB3; 
X-MS-TrafficTypeDiagnostic: BYASPR01MB3:
X-Microsoft-Antispam-PRVS: <BYASPR01MB3AAB9E54391DA0FEA97E2EA000@BYASPR01MB3.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:457;
X-Forefront-PRVS: 0045236D47
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 0WDx77GW0CP8TFMZLq6ATXbXgE6aI4f/JmoE1XG5BnwsRA4uI06LrmkPvnO5/xRWa+Z2y98U24pYqVGtDCV2sU0LldtE87TnzjAmlVE5qwZFGyXze+ydPrsE9y5Aarm36SWU5D28KR7L0OtuM5R+6491lxJG0wIpD9vNUM9Ju2JSFAaNjjZZP/nMrnQBfHY9TqVs5oHQbiCUzhec63icyi7kGuwOxOMW8yOOyhZruqRntpoLQWU82Y3JO2QtmyG3UFoq15C6eDfBzrQXOh8lSxnmlaP+Nd+ZT0+jZRZY/VKBg9QNNCkUZoC+KYWYOCKmVU61j3tOgSQJvo5QIAFf9bCg7AWEedm2JjUBkF2c7/M/BIfAc2mrYKuIHMlw+nL5/ZDcQQXlcdq5IeJ3kKOCTieHEy2lH9kVrhxT5yjhsmY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2019 13:57:31.2771 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d658a8b4-faa4-4677-78d0-08d6debd6f2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYASPR01MB3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sX4eUBBUYW5j6biUbpEOrWJ1FpWSVkU6jZRMlxTflaM=;
 b=Q2urI7fraYm/9ygArCLsPH9y7gb36FM/MamfEmDbgX/t4FLfZ7tO5zbQWNhOtQVDXphmuJOpIaYcJhDikgP8Klyt1Nn8daCw+N6V81zmyduzPeMZDITugNzxHeifUc5wnLylXjakSCqKJgsZ4frgAxzahCOLIXHeuLSN9RfkpeU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=permerror action=none header.from=amd.com;
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

U2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCAxNyArKysr
KysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4u
YyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCmluZGV4IDkwZDdhODIu
LmVjN2ZhY2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFp
bi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCkBAIC0yODYs
MTYgKzI4NiwxNyBAQCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRfam9iX3RpbWVkb3V0KHN0cnVjdCB3
b3JrX3N0cnVjdCAqd29yaykKIAlqb2IgPSBsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwoJnNjaGVk
LT5yaW5nX21pcnJvcl9saXN0LAogCQkJCSAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiwgbm9k
ZSk7CiAKLQlpZiAoam9iKQorCWlmIChqb2IpIHsKIAkJam9iLT5zY2hlZC0+b3BzLT50aW1lZG91
dF9qb2Ioam9iKTsKIAotCS8qCi0JICogR3VpbHR5IGpvYiBkaWQgY29tcGxldGUgYW5kIGhlbmNl
IG5lZWRzIHRvIGJlIG1hbnVhbGx5IHJlbW92ZWQKLQkgKiBTZWUgZHJtX3NjaGVkX3N0b3AgZG9j
LgotCSAqLwotCWlmIChzY2hlZC0+ZnJlZV9ndWlsdHkpIHsKLQkJam9iLT5zY2hlZC0+b3BzLT5m
cmVlX2pvYihqb2IpOwotCQlzY2hlZC0+ZnJlZV9ndWlsdHkgPSBmYWxzZTsKKwkJLyoKKwkJICog
R3VpbHR5IGpvYiBkaWQgY29tcGxldGUgYW5kIGhlbmNlIG5lZWRzIHRvIGJlIG1hbnVhbGx5IHJl
bW92ZWQKKwkJICogU2VlIGRybV9zY2hlZF9zdG9wIGRvYy4KKwkJICovCisJCWlmIChzY2hlZC0+
ZnJlZV9ndWlsdHkpIHsKKwkJCWpvYi0+c2NoZWQtPm9wcy0+ZnJlZV9qb2Ioam9iKTsKKwkJCXNj
aGVkLT5mcmVlX2d1aWx0eSA9IGZhbHNlOworCQl9CiAJfQogCiAJc3Bpbl9sb2NrX2lycXNhdmUo
JnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
