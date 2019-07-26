Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FB677069
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 19:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178DB6EDA5;
	Fri, 26 Jul 2019 17:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680073.outbound.protection.outlook.com [40.107.68.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4186E87B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 17:41:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ee8im2QzOMsHP9CSqyKhJz0uLob9fdmkRmz9yHt5IPHih3JehVF3RN5oOQM6lC2/Nlhjsm80BNZV8WAt6xcwr8BUlCnr2Yq8ZKElfFTRPbHiQKhR1UkqYzqWItrUfDvL3pefuCsBdLv8GsitkMbJmbUyQc88ac7T3EbyLrUbZb8mjcezJXiwDHnyw0x38DVAs5g0w9njU53KZywDIZt5/IRo+rKp/vvTy0sczRS7KfNCLOUoRcN0zR/wEC34sr8F+Stx+VMDKZKeZUo4EWpb6Qk3aYGSfVbuVISz7nfrGTsrAXLl5DC4t7uU3TGSwrjwu53mmXFDi3d35n4g2pPtsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpXMnOkWjTUr5XcxGHdczayWfRoZgWJfsppEdWJJtJ4=;
 b=ScomLSShTuJ2jkJGrcCz99OFV56CsBfPHY1n73jykNEJRRdxiiNVrrwMDtUvZIH5NMlWtP2ydWOIBomX8RVh7+ZZhnF7snJxYbGn7L2wS8d++hYKj8ybJL/izWml3Ag+JGejalmlGEGR0aG01Y07R0A7ehq2/muNwGOPW3piAB/SHfiNY2NLsGvqv1VNbKo8L17wWf+O6tTjly+BTDyXQuEh5nFBb16QDrRDDHiw3K3cxBl5HdP9CNvxYJ1w35KJz41Q/AYhy4CYjyzOHRA9XaoP8c4FortdT5EkEwDj+ZjDkZrpQM8/lDC5V9GrUTp1Xf8ZINMVbB0+WjNLWO5chQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0044.namprd12.prod.outlook.com (2603:10b6:301:2::30)
 by MWHPR1201MB2494.namprd12.prod.outlook.com (2603:10b6:300:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Fri, 26 Jul
 2019 17:41:16 +0000
Received: from CO1NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by MWHPR12CA0044.outlook.office365.com
 (2603:10b6:301:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.15 via Frontend
 Transport; Fri, 26 Jul 2019 17:41:16 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT011.mail.protection.outlook.com (10.152.80.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Fri, 26 Jul 2019 17:41:16 +0000
Received: from Jiraiya.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 26 Jul 2019
 12:41:14 -0500
From: "David (Dingchen) Zhang" <dingchen.zhang@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3] drm: Set crc->opened to false before setting crc source to
 NULL.
Date: Fri, 26 Jul 2019 13:37:43 -0400
Message-ID: <20190726173743.11641-1-dingchen.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(136003)(346002)(2980300002)(428003)(189003)(199004)(2616005)(53936002)(486006)(51416003)(70206006)(70586007)(336012)(7696005)(356004)(6666004)(53416004)(6916009)(86362001)(68736007)(26005)(48376002)(8936002)(16586007)(316002)(2351001)(305945005)(476003)(2906002)(81156014)(4326008)(50466002)(81166006)(54906003)(14444005)(478600001)(8676002)(126002)(5660300002)(186003)(1076003)(36756003)(50226002)(47776003)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB2494; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10e05270-5f05-4cf7-c2ba-08d711f075d6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR1201MB2494; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2494:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2494B92314E1C366928DF1E58DC00@MWHPR1201MB2494.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 01106E96F6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: kkNkJLTXIN0ZwEBS//RbFgkYvMa7J5vgEP2Ai9R6MyrOEVQvsY7mhG0l86ihNjLfjSHkTpKsadH1eQpFeYf8OkhI+Rp6DV8ZRnxMqLnjW4eazhAN27Xnib8hQul5WCSsMTAhFggOxCvbfIr6/d9BKfNzsumeOeLmiWUgr9eocaIXF4I1yTztNRJABOFr1NOoxmRB1EVkrvMG7GpvadZef7n4j2dgarc9LoLAPPnUXklOWS0vsyfHrsST0lmiCKfWprhYRtLZncBggM5poJbGukOhG+3MZewkMmfyHa/DJSdd/lHsNaWeYZLw4AQ/40+BW/r1qSpQ+dWnQ52PUraYlkTU8gW8gZFkWMJ0bhC6jDkjhKoKFmwb5RD8TdgBEz3ZT4gRFZkjx3VtKH/7/U8euXFiDs3pKivPoTB/SrabnmQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2019 17:41:16.0534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e05270-5f05-4cf7-c2ba-08d711f075d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2494
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpXMnOkWjTUr5XcxGHdczayWfRoZgWJfsppEdWJJtJ4=;
 b=hx8kytDBTrRVeUShqYE8K/R69uRBogv3KMRG1NOKWL8CLVgNwJSZDiP8hLOetaJnP7ZdYeONYi7EzQaJsSSDi+EuhbOSzumQcGVdUidGj4TJigdTwjPubsY5FMhdXFkQOMFdJj7jcGG/NuOno098IDi4Y6lSMrGv918UG0PR50A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=permerror action=none header.from=amd.com;
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
Cc: Dingchen Zhang <dingchen.zhang@amd.com>,
 Nick Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGluZ2NoZW4gWmhhbmcgPGRpbmdjaGVuLnpoYW5nQGFtZC5jb20+Cgp0byB0ZXJtaW5h
dGUgdGhlIHdoaWxlLWxvb3AgaW4gZHJtX2RwX2F1eF9jcmNfd29yayB3aGVuCmRybV9kcF9zdGFy
dC9zdG9wX2NyYyBhcmUgY2FsbGVkIGluIHRoZSBob29rIHRvIHNldCBjcmMgc291cmNlLgoKdjM6
IHNldCBjcmMtPm9wZW5lZCB0byBmYWxzZSB3aXRob3V0IGNoZWNraW5nIChOaWNrKQp2MjogTW92
ZSBzcGluX2xvY2sgYXJvdW5kIGVudGlyZSBjcmMtPm9wZW5lZCB1c2UgKERhbmllbCkKCkNjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBIYXJyeSBXZW50bGFuZCA8SGFycnku
V2VudGxhbmRAYW1kLmNvbT4KQ2M6IE5pY2sgS2F6bGF1c2thcyA8TmljaG9sYXMuS2F6bGF1c2th
c0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEaW5nY2hlbiBaaGFuZyA8ZGluZ2NoZW4uemhhbmdA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMgfCA1ICsrKysr
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2Ny
Yy5jCmluZGV4IGRhYzI2N2U4NDBhZi4uZDJkMjM4OWQ4ODkyIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1
Z2ZzX2NyYy5jCkBAIC0yNDksNiArMjQ5LDExIEBAIHN0YXRpYyBpbnQgY3J0Y19jcmNfcmVsZWFz
ZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlsZXApCiAJc3RydWN0IGRybV9j
cnRjICpjcnRjID0gZmlsZXAtPmZfaW5vZGUtPmlfcHJpdmF0ZTsKIAlzdHJ1Y3QgZHJtX2NydGNf
Y3JjICpjcmMgPSAmY3J0Yy0+Y3JjOwogCisJLyogdGVybWluYXRlIHRoZSBpbmZpbml0ZSB3aGls
ZSBsb29wIGlmICdkcm1fZHBfYXV4X2NyY193b3JrJyBydW5uaW5nICovCisJc3Bpbl9sb2NrX2ly
cSgmY3JjLT5sb2NrKTsKKwljcmMtPm9wZW5lZCA9IGZhbHNlOworCXNwaW5fdW5sb2NrX2lycSgm
Y3JjLT5sb2NrKTsKKwogCWNydGMtPmZ1bmNzLT5zZXRfY3JjX3NvdXJjZShjcnRjLCBOVUxMKTsK
IAogCXNwaW5fbG9ja19pcnEoJmNyYy0+bG9jayk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
