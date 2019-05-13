Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CD41B341
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 11:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BBB89B51;
	Mon, 13 May 2019 09:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780051.outbound.protection.outlook.com [40.107.78.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545DE89B30;
 Mon, 13 May 2019 09:53:23 +0000 (UTC)
Received: from MWHPR12CA0068.namprd12.prod.outlook.com (2603:10b6:300:103::30)
 by BYASPR01MB3.namprd12.prod.outlook.com (2603:10b6:a02:ce::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.21; Mon, 13 May
 2019 09:53:21 +0000
Received: from CO1NAM03FT047.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MWHPR12CA0068.outlook.office365.com
 (2603:10b6:300:103::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Mon, 13 May 2019 09:53:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT047.mail.protection.outlook.com (10.152.81.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Mon, 13 May 2019 09:53:20 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 13 May 2019
 04:53:19 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH libdrm 4/7] add timeline signal/transfer ioctls v2
Date: Mon, 13 May 2019 17:53:02 +0800
Message-ID: <20190513095305.14110-4-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513095305.14110-1-david1.zhou@amd.com>
References: <20190513095305.14110-1-david1.zhou@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(376002)(346002)(2980300002)(428003)(189003)(199004)(86362001)(2906002)(126002)(486006)(4326008)(356004)(6666004)(446003)(1076003)(2616005)(54906003)(47776003)(110136005)(11346002)(476003)(426003)(50226002)(16586007)(81166006)(5660300002)(53416004)(186003)(72206003)(36756003)(50466002)(53936002)(26005)(70586007)(77096007)(316002)(70206006)(8936002)(48376002)(8676002)(81156014)(51416003)(7696005)(336012)(76176011)(305945005)(68736007)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYASPR01MB3; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5311a6b-4d9d-46c6-84d8-08d6d788d529
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BYASPR01MB3; 
X-MS-TrafficTypeDiagnostic: BYASPR01MB3:
X-Microsoft-Antispam-PRVS: <BYASPR01MB332B3004E4D0BE31A8593B40F0@BYASPR01MB3.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 0036736630
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: b4L4opwV+MKJcR38qqHR8whEJKJORqSWKrGw3TbjaktGDDVzXOgwZd0bJSU/nJfuJJb5HotAKTB2J18ypEBqvddMEkkR1nia7iFN7CFJeEcmhuE06MXN2Noi5BMKMStrVTNXz/ohljwpG/XqdpElZdeynRxunKtmxR36V2mY06ToL4yuCUP+kgKdPOEajueGxCimzmFv6FC6Dy545VIU2FmPQtXHnjSej0G2JgRdgTsXjURSCMbA9uivPwqgGREJP91VHvpzW+6tyS4lLN1FrvHB9nJ8OiuNysnjH11zs330GNbZVvBEa5hYqUOR7r4ufOSOgrJBmwA4HsvjLxNzyhvJn4PZH8S2QlQC678g5a22Tb2WcMyA83A4h5DL6gLdN7X9ZuBjlVQK8Cg4MyYvyFXIs2GHESOwd8HAB3JJ6sc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2019 09:53:20.9164 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5311a6b-4d9d-46c6-84d8-08d6d788d529
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYASPR01MB3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RsOixOCzPr5A4DJGs3D3CYVvYeTmfzvGMtEis2UUgq0=;
 b=PkZlc3WCvrjySLykTGBi+vYAKUcBkxe2lth5j4610XF6ArYe62XegZH8CRR7LfVAZQ9Q/hCtXr1cLqF0t+DSFKMYMGbwXKTHXoOFjtd+osb+QkHjQdnxpnaKzFNKkBGG17lbeQsbPf5KzSI6tJ95EoKTL6MvTVLINHc0BhcVyNI=
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
