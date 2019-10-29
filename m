Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9E3E8A23
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 14:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59786E408;
	Tue, 29 Oct 2019 13:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750082.outbound.protection.outlook.com [40.107.75.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCF86E3D8;
 Tue, 29 Oct 2019 13:53:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bz6Cen2VUUiw0uJYDE2FZNnf1jDgVI7Wt+H8KYDCQI0M5IGTwe+iUGQBbzoCbGDfhfYGgN34219cnq5qKe65QdWKtUxz+L1IWbr5R1SLr4nZIV0kLv1FF1TDy4ZdFfLnrmQ3FBtgDEQEfM5mxGfQ7Wks8MMY7dkLiwvuI80ZuqgX1QRbNzLJL6aQ+uxWbXa9GLqyzKV61rC1Ux1T/atZnfGPOfOd0F8G1jbWj21u8hAxBCJR93Gt1WhLOPJkg8nmz7KvyP+2H1BKgSmY1Iz7k4XxAK9RckoXpzEU8wDIkUhkKPfq2XdE72w1VmXxAg0Ln9jhhzeQp5EG+Z6Z/dCO0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icV3H2JyaFwOXyzqYMv6r0eGNW8TaXttRevfZbt/zC4=;
 b=FYyW9t0Ti5nh1FY/G4DswLTRNewy+X3ssIAy5ITDMhxKIT5cOM9dG7cN1fBLIQAcVy6NHUULaiSid8ygiBOACqDS0ExkpU4ZhE7WrKJDBLvZ9fvRAxCfYqjhNeUiZWjSuaJR4GcGZZ0zFp7AyNL6leCJ+yJI4GtkMkZuycVBKB5jzKj1pIEEBpLc8EjBtE7gLL4ZWowfSOOZTGnA7kyQEzph3TRhTRBnPN3HBcef8tnnmS7y6NbVVxerUPMUHRdRDkAX3TO5/B47nTgMJ1jMfa2MXi6HtqkfbfvzOrJR+HWWVDLUwKIHRkTp4AfXSM0WSxv/WnlYC+EYz9pO+5KWMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0002.namprd12.prod.outlook.com (2603:10b6:408:60::15)
 by CH2PR12MB3751.namprd12.prod.outlook.com (2603:10b6:610:25::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.24; Tue, 29 Oct
 2019 13:52:59 +0000
Received: from CO1NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by BN8PR12CA0002.outlook.office365.com
 (2603:10b6:408:60::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.17 via Frontend
 Transport; Tue, 29 Oct 2019 13:52:59 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT040.mail.protection.outlook.com (10.152.81.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 13:52:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 08:52:58 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 08:52:58 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 29 Oct 2019 08:52:58 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/13] drm/amd/display: Write DSC enable to MST DPCD
Date: Tue, 29 Oct 2019 09:52:42 -0400
Message-ID: <20191029135245.31152-11-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029135245.31152-1-mikita.lipski@amd.com>
References: <20191029135245.31152-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(428003)(189003)(199004)(336012)(6916009)(48376002)(14444005)(426003)(70586007)(478600001)(486006)(50466002)(47776003)(305945005)(1076003)(86362001)(70206006)(2876002)(53416004)(2351001)(26005)(81166006)(11346002)(2906002)(81156014)(76176011)(5660300002)(316002)(186003)(16586007)(54906003)(50226002)(356004)(6666004)(8936002)(126002)(36756003)(476003)(51416003)(2616005)(8676002)(4326008)(7696005)(446003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3751; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15f242f3-5bed-473f-0fa4-08d75c774efa
X-MS-TrafficTypeDiagnostic: CH2PR12MB3751:
X-Microsoft-Antispam-PRVS: <CH2PR12MB375157ED121EC8274A969E2FE4610@CH2PR12MB3751.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 0205EDCD76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HioDxaxmwp5ohSC2xRVdHFJCvrI15LzehljZ/pLMgnBFqMDlGJZmcOED2BJ/B2zgyTtFdlEExyadvdu5doa9WWr1NHnBWb2VhcZS4ReM9qr3VkqqvOpLCblOuXgNFfHDj5M0jGVryDEkGLisakYNR5RJhCl7+X8+cxCnN6cQoGaL047YzYrlFCg0PO8Z0qU3wOPPKbgflqFPM7MJLle3yMVw5kvArxQ5LKNW68t3eyX9p00nnfKd6SXiOL+mgVU42e4za7FMtQ4rAeUVSNUS0eekMSJMWN1K2+x8KoQ6QRDHUa5SJEvWRcwrBBVGPCRIQzgOeci+sU4i9ALXBpktHIXvTDcB0c93eNbW0FeWw5dW0HUNiUh43NZh6SeJVT+kgnNt8qNQQjBG8TFvEqifpDAhzbkmB/Tx46jnzGhZDt0YTCk7CrIkYxgg4GF1oQSZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2019 13:52:59.0447 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f242f3-5bed-473f-0fa4-08d75c774efa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3751
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icV3H2JyaFwOXyzqYMv6r0eGNW8TaXttRevfZbt/zC4=;
 b=FvOS+A6BMOb5cXs0nJG9QuoJbGWRdKmjMo21eTYt2wqcBUgXOoWzVT3sCPsRlkoxTcwy8+FuYGrBDKprpxiiope8BwOF7JyD5aXsI2V0SWdt82tGq/noVq5U8mNNf0R7X7zEaoYhYUUdknnKjUL+ax05LoOrMZEx1NQZaUNU0Z8=
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
Cc: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKUmV3b3JrIHRoZSBk
bV9oZWxwZXJzX3dyaXRlX2RzY19lbmFibGUgY2FsbGJhY2sgdG8KaGFuZGxlIHRoZSBNU1QgY2Fz
ZS4KClVzZSB0aGUgY2FjaGVkIGRzY19hdXggZmllbGQuCgpSZXZpZXdlZC1ieTogV2VuamluZyBM
aXUgPFdlbmppbmcuTGl1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERh
dmlkLkZyYW5jaXNAYW1kLmNvbT4KLS0tCiAuLi4vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbV9oZWxwZXJzLmMgfCAxOSArKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
MTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwppbmRleCAx
YjJjYzg1YjQ4MTUuLjIxNDRiNjVmNDgwNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwpAQCAtMzcsNiAr
MzcsNyBAQAogI2luY2x1ZGUgImRjLmgiCiAjaW5jbHVkZSAiYW1kZ3B1X2RtLmgiCiAjaW5jbHVk
ZSAiYW1kZ3B1X2RtX2lycS5oIgorI2luY2x1ZGUgImFtZGdwdV9kbV9tc3RfdHlwZXMuaCIKIAog
I2luY2x1ZGUgImRtX2hlbHBlcnMuaCIKIApAQCAtNTIxLDggKzUyMiwyNCBAQCBib29sIGRtX2hl
bHBlcnNfZHBfd3JpdGVfZHNjX2VuYWJsZSgKICkKIHsKIAl1aW50OF90IGVuYWJsZV9kc2MgPSBl
bmFibGUgPyAxIDogMDsKKwlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvcjsK
KworCWlmICghc3RyZWFtKQorCQlyZXR1cm4gZmFsc2U7CisKKwlpZiAoc3RyZWFtLT5zaWduYWwg
PT0gU0lHTkFMX1RZUEVfRElTUExBWV9QT1JUX01TVCkgeworCQlhY29ubmVjdG9yID0gKHN0cnVj
dCBhbWRncHVfZG1fY29ubmVjdG9yICopc3RyZWFtLT5kbV9zdHJlYW1fY29udGV4dDsKKworCQlp
ZiAoIWFjb25uZWN0b3ItPmRzY19hdXgpCisJCQlyZXR1cm4gZmFsc2U7CisKKwkJcmV0dXJuIChk
cm1fZHBfZHBjZF93cml0ZShhY29ubmVjdG9yLT5kc2NfYXV4LCBEUF9EU0NfRU5BQkxFLCAmZW5h
YmxlX2RzYywgMSkgPj0gMCk7CisJfQorCisJaWYgKHN0cmVhbS0+c2lnbmFsID09IFNJR05BTF9U
WVBFX0RJU1BMQVlfUE9SVCkKKwkJcmV0dXJuIGRtX2hlbHBlcnNfZHBfd3JpdGVfZHBjZChjdHgs
IHN0cmVhbS0+bGluaywgRFBfRFNDX0VOQUJMRSwgJmVuYWJsZV9kc2MsIDEpOwogCi0JcmV0dXJu
IGRtX2hlbHBlcnNfZHBfd3JpdGVfZHBjZChjdHgsIHN0cmVhbS0+c2luay0+bGluaywgRFBfRFND
X0VOQUJMRSwgJmVuYWJsZV9kc2MsIDEpOworCXJldHVybiBmYWxzZTsKIH0KICNlbmRpZgogCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
