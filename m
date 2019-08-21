Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E48CC984F7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF796E9E6;
	Wed, 21 Aug 2019 20:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790077.outbound.protection.outlook.com [40.107.79.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517F86E9ED;
 Wed, 21 Aug 2019 20:01:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9aiWjrBGQAsvLCtI8qFKVtNR8L57D0EhlT9L07dFjI/lnY4bU1YIA4V7Mbj5gKVh5WMvhgPgsjzcD/NtsIW+VIvRsLCIAAB638K2siGL+PsMQKw/Hvj1j5POYu9LH45xRKMnkR4UIRCHoA6Crdo0SXvSJLmoK2Y6781oehAXBG6qF+eZV3Iz76NplvNM9aRFrjN2xjfdSx/EhGdwH+GcT2/hKRiMDgeA0u/jLI1CrUu71qLViRECZHgyIOSjYBGy2Ut1YhYkYWOOdUVZOkkV/ehQF2a4ibwS5LEAayIwDKFAU/k1ZSMl/YUmtIIFHraXl2oXwY2muEhf8Khmu8eGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hg7fJjSOJUwUU2Hv3QG70YES6kZtea17elag+nMVXYg=;
 b=YCt0tsNgU0A4XnPH2Tl3kQCWQ4/23YZUADEKWtaEZyZLiJwlYW/xkF4SS1OqzMDvOfcXQWU3z+jBFj8B6E4BVuei/GareOjlZri2Lzl3A0fGd1q9n7KGLof4JCiDX2/DHjoPkF78mm+yAxlIQu4TecN4xeteZOvP9cDN/jx1KHfTmhd5e+44R/18UyARe6HRDiaSA+JWKYEd9egw0fUD2+hgtgFGb2JkdM9Y8fI2rcnSXAcmcBQT0MkT+ISSBO3+AN6JC/H+z2AoM5ZUb2l2UvM52Xv9qDT3uYMO2/W7gudxMxWSbW3Ss9edv2vC+F8o1/ZntZ3FfeXwkfShnchDAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0009.namprd12.prod.outlook.com (2603:10b6:403:2::19)
 by SN6PR12MB2720.namprd12.prod.outlook.com (2603:10b6:805:70::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Wed, 21 Aug
 2019 20:01:52 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by BN4PR12CA0009.outlook.office365.com
 (2603:10b6:403:2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Wed, 21 Aug 2019 20:01:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 20:01:51 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 21 Aug 2019 15:01:38 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 07/16] drm/amd/display: Use correct helpers to compute
 timeslots
Date: Wed, 21 Aug 2019 16:01:20 -0400
Message-ID: <20190821200129.11575-8-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821200129.11575-1-David.Francis@amd.com>
References: <20190821200129.11575-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(346002)(376002)(396003)(136003)(2980300002)(428003)(189003)(199004)(81156014)(8936002)(50226002)(426003)(26005)(81166006)(8676002)(51416003)(2906002)(50466002)(53936002)(110136005)(16586007)(54906003)(70206006)(186003)(336012)(446003)(11346002)(316002)(70586007)(2616005)(126002)(486006)(476003)(14444005)(36756003)(478600001)(86362001)(450100002)(1076003)(4326008)(5660300002)(305945005)(49486002)(48376002)(47776003)(6666004)(356004)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2720; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14fde275-d404-49f2-7caf-08d726726853
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:SN6PR12MB2720; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2720:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2720001D527F584D4DBA7814EFAA0@SN6PR12MB2720.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: XWtaoMivGPLW/XsdoMMNf/ewwxiNRRX5/WCdUh/9tkwprP5xQKe43e6WbZDEJPkxRGzfvcaWGFLWbXAsH/OWR4BsV6/gGiH8LZIYmHxhA8VmG7hQ+LnAKGd/pBuNiQDwH88x/9RtIb4olkbkXC/rkMAc0ZCUtU1xsfSdVVuHtRbskT1dhjD7+qClylw0bQBvRKniro6C+REUPtaXLgPxqUvlyWVhBsTw3+UIHLlMSQF4+LBmpQThlhvYf5/s66h6j9ZmDqD4I6EhUVicCvDmuMuwTJ4Cn8+SGypIDgpzjayTGCyTq3/t1jSIZSOqc6eSrM2yYsvzG56+L5bNCWs2AC16/ncrmAjhdfC0RV70WPdwhJ49fk4sgHGqLjE0oXfCV8VAwJytz8nq2duuYXIjME1AzQWYyI+bk3jX+Sf+gbw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 20:01:51.2642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fde275-d404-49f2-7caf-08d726726853
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2720
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hg7fJjSOJUwUU2Hv3QG70YES6kZtea17elag+nMVXYg=;
 b=wPBS4P47/hk70eyeQKOe5YTBKWC6lf5yyX+ACJWvUqRLyym5ub76DMomnnq0NlvWX9hnmXL4FDuM9e9atDE30HtVGMkwC0ChIno6U7Eo9NG+3+ukfybh11Vw1Uu0uN2qqiu8IjbEI6KqPPe+iULiR42xniBSndRkGDH2idWDIVw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: David Francis <David.Francis@amd.com>, Jerry Zuo <Jerry.Zuo@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugd2VyZSB1c2luZyBkcm0gaGVscGVycyB0byBjb252ZXJ0IGEgdGltaW5nIGludG8gaXRzCmJh
bmR3aWR0aCwgaXRzIGJhbmR3aWR0aCBpbnRvIHBibiwgYW5kIGl0cyBwYm4gaW50byB0aW1lc2xv
dHMKClRoZXNlIGhlbHBlcnMKLURpZCBub3QgdGFrZSBEU0MgdGltaW5ncyBpbnRvIGFjY291bnQK
LVVzZWQgdGhlIGxpbmsgcmF0ZSBhbmQgbGFuZSBjb3VudCBvZiB0aGUgbGluaydzIGF1eCBkZXZp
Y2UsCndoaWNoIGFyZSBub3QgdGhlIHNhbWUgYXMgdGhlIGxpbmsncyBjdXJyZW50IGNhcAotRGlk
IG5vdCB0YWtlIEZFQyBpbnRvIGFjY291bnQgKEZFQyByZWR1Y2VzIHRoZSBQQk4gcGVyIHRpbWVz
bG90KQoKRm9yIGNvbnZlcnRpbmcgdGltaW5nIGludG8gUEJOLCB1c2UgdGhlIG5ldyBmdW5jdGlv
bgpkcm1fZHBfY2FsY19wYm5fbW9kZV9kc2MgdGhhdCBoYW5kbGVzIHRoZSBEU0MgY2FzZQoKRm9y
IGNvbnZlcnRpbmcgUEJOIGludG8gdGltZSBzbG90cywgYW1kZ3B1IGRvZXNuJ3QgdXNlIHRoZQon
Y29ycmVjdCcgYXRvbWljIG1ldGhvZCAoZHJtX2RwX2F0b21pY19maW5kX3ZjcGlfc2xvdHMpLCBz
bwpkb24ndCBhZGQgYSBuZXcgaGVscGVyIHRvIGNvdmVyIG91ciBhcHByb2FjaC4gVXNlIHRoZSBz
YW1lCm1lYW5zIG9mIGNhbGN1bGF0aW5nIHBibiBwZXIgdGltZSBzbG90IGFzIHRoZSBEU0MgY29k
ZS4KCkNjOiBKZXJyeSBadW8gPEplcnJ5Llp1b0BhbWQuY29tPgpDYzogTmljaG9sYXMgS2F6bGF1
c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBG
cmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Ci0tLQogLi4uL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1faGVscGVycy5jICAgfCAxNyArKysrKysrKysrKystLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVy
cy5jCmluZGV4IDVmMmMzMTViMThiYS4uNzE2ZDY1NzdjZGJkIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5j
CkBAIC0xODksOCArMTg5LDggQEAgYm9vbCBkbV9oZWxwZXJzX2RwX21zdF93cml0ZV9wYXlsb2Fk
X2FsbG9jYXRpb25fdGFibGUoCiAJaW50IHNsb3RzID0gMDsKIAlib29sIHJldDsKIAlpbnQgY2xv
Y2s7Ci0JaW50IGJwcCA9IDA7CiAJaW50IHBibiA9IDA7CisJaW50IHBibl9wZXJfdGltZXNsb3Qs
IGJwcCA9IDA7CiAKIAlhY29ubmVjdG9yID0gKHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICop
c3RyZWFtLT5kbV9zdHJlYW1fY29udGV4dDsKIApAQCAtMjM0LDExICsyMzQsMTggQEAgYm9vbCBk
bV9oZWxwZXJzX2RwX21zdF93cml0ZV9wYXlsb2FkX2FsbG9jYXRpb25fdGFibGUoCiAKIAkJYnBw
ID0gYnBwICogMzsKIAotCQkvKiBUT0RPIG5lZWQgdG8ga25vdyBsaW5rIHJhdGUgKi8KLQotCQlw
Ym4gPSBkcm1fZHBfY2FsY19wYm5fbW9kZShjbG9jaywgYnBwKTsKKyNpZmRlZiBDT05GSUdfRFJN
X0FNRF9EQ19EU0NfU1VQUE9SVAorCQlpZiAoc3RyZWFtLT50aW1pbmcuZmxhZ3MuRFNDKQorCQkJ
cGJuID0gZHJtX2RwX2NhbGNfcGJuX21vZGVfZHNjKGNsb2NrLAorCQkJCQlzdHJlYW0tPnRpbWlu
Zy5kc2NfY2ZnLmJpdHNfcGVyX3BpeGVsKTsKKwkJZWxzZQorI2VuZGlmCisJCQlwYm4gPSBkcm1f
ZHBfY2FsY19wYm5fbW9kZShjbG9jaywgYnBwKTsKIAotCQlzbG90cyA9IGRybV9kcF9maW5kX3Zj
cGlfc2xvdHMobXN0X21nciwgcGJuKTsKKwkJLyogQ29udmVydCBraWxvYml0cyBwZXIgc2Vjb25k
IC8gNjQgKGZvciA2NCB0aW1lc2xvdHMpIHRvIHBibiAoNTQvNjQgbWVnYWJ5dGVzIHBlciBzZWNv
bmQpICovCisJCXBibl9wZXJfdGltZXNsb3QgPSBkY19saW5rX2JhbmR3aWR0aF9rYnBzKAorCQkJ
CXN0cmVhbS0+bGluaywgZGNfbGlua19nZXRfbGlua19jYXAoc3RyZWFtLT5saW5rKSkgLyAoOCAq
IDEwMDAgKiA1NCk7CisJCXNsb3RzID0gRElWX1JPVU5EX1VQKHBibiwgcGJuX3Blcl90aW1lc2xv
dCk7CiAJCXJldCA9IGRybV9kcF9tc3RfYWxsb2NhdGVfdmNwaShtc3RfbWdyLCBtc3RfcG9ydCwg
cGJuLCBzbG90cyk7CiAKIAkJaWYgKCFyZXQpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
