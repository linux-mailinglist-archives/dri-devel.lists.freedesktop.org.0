Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F068162E0
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 13:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369FB6E7AB;
	Tue,  7 May 2019 11:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730073.outbound.protection.outlook.com [40.107.73.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CAC6E7AD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 11:34:19 +0000 (UTC)
Received: from CY4PR12CA0034.namprd12.prod.outlook.com (2603:10b6:903:129::20)
 by BN6PR12MB1218.namprd12.prod.outlook.com (2603:10b6:404:1b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.15; Tue, 7 May
 2019 11:34:13 +0000
Received: from DM3NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by CY4PR12CA0034.outlook.office365.com
 (2603:10b6:903:129::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 7 May 2019 11:34:13 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT051.mail.protection.outlook.com (10.152.83.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 7 May 2019 11:34:13 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 7 May 2019
 06:34:11 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm 4/7] add timeline signal/transfer ioctls v2
Date: Tue, 7 May 2019 19:33:56 +0800
Message-ID: <20190507113359.16387-4-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507113359.16387-1-david1.zhou@amd.com>
References: <20190507113359.16387-1-david1.zhou@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(39860400002)(396003)(2980300002)(428003)(199004)(189003)(186003)(1076003)(486006)(2906002)(11346002)(72206003)(336012)(77096007)(48376002)(356004)(6666004)(70586007)(476003)(2616005)(126002)(70206006)(446003)(5660300002)(36756003)(47776003)(53936002)(86362001)(50466002)(4326008)(7696005)(8936002)(426003)(305945005)(2351001)(54906003)(478600001)(68736007)(53416004)(8676002)(316002)(76176011)(6916009)(81166006)(51416003)(50226002)(16586007)(26005)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1218; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23ea1fa6-dcf9-4638-bffd-08d6d2dfee16
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN6PR12MB1218; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1218:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1218E1D52F05C8096751766CB4310@BN6PR12MB1218.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 0030839EEE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /8ubp4gfxajHorVL1sRUKyJ0lt33lnWh2WogI9BQg/Xqk2ON70KCyZ/79cjvHS6cokU8nfAR36fBYj4YHsfn7TTmomGfcPR0YOkO7VKtkBuGy+wDovO9HTNexMIm3TFMsXc8YdbsZMELy0tqp9P8AJSfOfRKd4/ZHD8oFEBm7AGZcUdXwo67L0FbyDid8yvHbIiAaj/MAMjrMFF0dVeVloSYsmXLf6toBTKjkfkexam6iRJnakpiguL6WrZWPpIAukkFY1nIJn1P+D55qEsi8croSyg+VJdxpE0GunyemQLaXNdjD518pTICZrXO+OwRqRLerYpfuRV/UvXpo/0spF4sljUN+WE1Jz3Y3cMCn1lib3WAIZFMt3fOK+LJDxlNoVcqiRXtOo5Y1suFUpZ9HosKvb4WhFoj9nwE1Fcf5Kw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2019 11:34:13.1820 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ea1fa6-dcf9-4638-bffd-08d6d2dfee16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1218
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RsOixOCzPr5A4DJGs3D3CYVvYeTmfzvGMtEis2UUgq0=;
 b=2Jm+NwC6ZmGLQULtVSVIuRqNvqwGZK3RIA5/vK+vmIiwC+VyfJD8tKcV2vbUy3PgJ9PrT0qVSAHdvkrOyRgOEj624QSrGdgxLnjE+Yrr8rccDn1cX60OM7MBK9Bpb90yZSidtp/CBkYIj/L/y84zyNZn57eNHdS8EC2dpm3gbH8=
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
Cc: Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

djI6IHVzZSBvbmUgdHJhbnNmZXIgaW9jdGwKClNpZ25lZC1vZmYtYnk6IENodW5taW5nIFpob3Ug
PGRhdmlkMS56aG91QGFtZC5jb20+Ci0tLQogeGY4NmRybS5jIHwgMzMgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiB4Zjg2ZHJtLmggfCAgNiArKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMzkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hmODZkcm0uYyBiL3hmODZkcm0uYwpp
bmRleCAxN2UzZDg4MC4uYWNkMTZmYWIgMTAwNjQ0Ci0tLSBhL3hmODZkcm0uYworKysgYi94Zjg2
ZHJtLmMKQEAgLTQyNTcsNiArNDI1NywyMSBAQCBkcm1fcHVibGljIGludCBkcm1TeW5jb2JqU2ln
bmFsKGludCBmZCwgY29uc3QgdWludDMyX3QgKmhhbmRsZXMsCiAgICAgcmV0dXJuIHJldDsKIH0K
IAorZHJtX3B1YmxpYyBpbnQgZHJtU3luY29ialRpbWVsaW5lU2lnbmFsKGludCBmZCwgY29uc3Qg
dWludDMyX3QgKmhhbmRsZXMsCisJCQkJCXVpbnQ2NF90ICpwb2ludHMsIHVpbnQzMl90IGhhbmRs
ZV9jb3VudCkKK3sKKyAgICBzdHJ1Y3QgZHJtX3N5bmNvYmpfdGltZWxpbmVfYXJyYXkgYXJnczsK
KyAgICBpbnQgcmV0OworCisgICAgbWVtY2xlYXIoYXJncyk7CisgICAgYXJncy5oYW5kbGVzID0g
KHVpbnRwdHJfdCloYW5kbGVzOworICAgIGFyZ3MucG9pbnRzID0gKHVpbnQ2NF90KSh1aW50cHRy
X3QpcG9pbnRzOworICAgIGFyZ3MuY291bnRfaGFuZGxlcyA9IGhhbmRsZV9jb3VudDsKKworICAg
IHJldCA9IGRybUlvY3RsKGZkLCBEUk1fSU9DVExfU1lOQ09CSl9USU1FTElORV9TSUdOQUwsICZh
cmdzKTsKKyAgICByZXR1cm4gcmV0OworfQorCiBkcm1fcHVibGljIGludCBkcm1TeW5jb2JqVGlt
ZWxpbmVXYWl0KGludCBmZCwgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMsCiAJ
CQkJICAgICAgdW5zaWduZWQgbnVtX2hhbmRsZXMsCiAJCQkJICAgICAgaW50NjRfdCB0aW1lb3V0
X25zZWMsIHVuc2lnbmVkIGZsYWdzLApAQCAtNDI5OSw0ICs0MzE0LDIyIEBAIGRybV9wdWJsaWMg
aW50IGRybVN5bmNvYmpRdWVyeShpbnQgZmQsIHVpbnQzMl90ICpoYW5kbGVzLCB1aW50NjRfdCAq
cG9pbnRzLAogICAgIHJldHVybiAwOwogfQogCitkcm1fcHVibGljIGludCBkcm1TeW5jb2JqVHJh
bnNmZXIoaW50IGZkLAorCQkJCSAgdWludDMyX3QgZHN0X2hhbmRsZSwgdWludDY0X3QgZHN0X3Bv
aW50LAorCQkJCSAgdWludDMyX3Qgc3JjX2hhbmRsZSwgdWludDY0X3Qgc3JjX3BvaW50LAorCQkJ
CSAgdWludDMyX3QgZmxhZ3MpCit7CisgICAgc3RydWN0IGRybV9zeW5jb2JqX3RyYW5zZmVyIGFy
Z3M7CisgICAgaW50IHJldDsKKworICAgIG1lbWNsZWFyKGFyZ3MpOworICAgIGFyZ3Muc3JjX2hh
bmRsZSA9IHNyY19oYW5kbGU7CisgICAgYXJncy5kc3RfaGFuZGxlID0gZHN0X2hhbmRsZTsKKyAg
ICBhcmdzLnNyY19wb2ludCA9IHNyY19wb2ludDsKKyAgICBhcmdzLmRzdF9wb2ludCA9IGRzdF9w
b2ludDsKKyAgICBhcmdzLmZsYWdzID0gZmxhZ3M7CisKKyAgICByZXQgPSBkcm1Jb2N0bChmZCwg
RFJNX0lPQ1RMX1NZTkNPQkpfVFJBTlNGRVIsICZhcmdzKTsKIAorICAgIHJldHVybiByZXQ7Cit9
CmRpZmYgLS1naXQgYS94Zjg2ZHJtLmggYi94Zjg2ZHJtLmgKaW5kZXggNjBjN2E4NGYuLjNmYjFk
MWNhIDEwMDY0NAotLS0gYS94Zjg2ZHJtLmgKKysrIGIveGY4NmRybS5oCkBAIC04NzYsMTIgKzg3
NiwxOCBAQCBleHRlcm4gaW50IGRybVN5bmNvYmpXYWl0KGludCBmZCwgdWludDMyX3QgKmhhbmRs
ZXMsIHVuc2lnbmVkIG51bV9oYW5kbGVzLAogCQkJICB1aW50MzJfdCAqZmlyc3Rfc2lnbmFsZWQp
OwogZXh0ZXJuIGludCBkcm1TeW5jb2JqUmVzZXQoaW50IGZkLCBjb25zdCB1aW50MzJfdCAqaGFu
ZGxlcywgdWludDMyX3QgaGFuZGxlX2NvdW50KTsKIGV4dGVybiBpbnQgZHJtU3luY29ialNpZ25h
bChpbnQgZmQsIGNvbnN0IHVpbnQzMl90ICpoYW5kbGVzLCB1aW50MzJfdCBoYW5kbGVfY291bnQp
OworZXh0ZXJuIGludCBkcm1TeW5jb2JqVGltZWxpbmVTaWduYWwoaW50IGZkLCBjb25zdCB1aW50
MzJfdCAqaGFuZGxlcywKKwkJCQkgICAgdWludDY0X3QgKnBvaW50cywgdWludDMyX3QgaGFuZGxl
X2NvdW50KTsKIGV4dGVybiBpbnQgZHJtU3luY29ialRpbWVsaW5lV2FpdChpbnQgZmQsIHVpbnQz
Ml90ICpoYW5kbGVzLCB1aW50NjRfdCAqcG9pbnRzLAogCQkJCSAgdW5zaWduZWQgbnVtX2hhbmRs
ZXMsCiAJCQkJICBpbnQ2NF90IHRpbWVvdXRfbnNlYywgdW5zaWduZWQgZmxhZ3MsCiAJCQkJICB1
aW50MzJfdCAqZmlyc3Rfc2lnbmFsZWQpOwogZXh0ZXJuIGludCBkcm1TeW5jb2JqUXVlcnkoaW50
IGZkLCB1aW50MzJfdCAqaGFuZGxlcywgdWludDY0X3QgKnBvaW50cywKIAkJCSAgIHVpbnQzMl90
IGhhbmRsZV9jb3VudCk7CitleHRlcm4gaW50IGRybVN5bmNvYmpUcmFuc2ZlcihpbnQgZmQsCisJ
CQkgICAgICB1aW50MzJfdCBkc3RfaGFuZGxlLCB1aW50NjRfdCBkc3RfcG9pbnQsCisJCQkgICAg
ICB1aW50MzJfdCBzcmNfaGFuZGxlLCB1aW50NjRfdCBzcmNfcG9pbnQsCisJCQkgICAgICB1aW50
MzJfdCBmbGFncyk7CiAKICNpZiBkZWZpbmVkKF9fY3BsdXNwbHVzKQogfQotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
