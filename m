Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0232496934
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 21:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978B76E873;
	Tue, 20 Aug 2019 19:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750040.outbound.protection.outlook.com [40.107.75.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EEF6E873;
 Tue, 20 Aug 2019 19:12:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQZxA7UK7noKihKXuYdQ8e78vRVvB/IgYETThp49lhrfA1rDRzh2nR+HbqkRmlQNe7MH8gwz/SuKcChuX8Phyn7O3Q41TRiE3i+blzWIbAAv4qbyc9TJ/3xTPZ0K0+lGh0/mPXJWJKk/pZtJj0OfD/V9QRgPggJO2qCBi5B8zxE9+b6++8iP4CaKT0piEoRa3frqWevyxbTJWtrhuYBAWOtzwP277U8KxxQiQkox8jaUZJSCvVTFUr/ZvV9Mluce3Nf1WuWkfkk1paL3CtzlIU+lvoK3Q2DbPOFJHZGmoKo+FpJHccdJSRVF8k7QjFnmHL4+U8lckBx8j+r2G/HmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQrBmvdVpL7x5gTc0IXWqcmB61E5qzh1r5PUSj9kOJs=;
 b=nlwAKUUYvN83yrN0wlHIdfpTWA49T9sjx2X2u8kvz4vw48v3UOHWhz5bNo7SvThY/u5eqfs5IeKVFbyADTJuFq3CkRySPXRva6nhUFsuUZiqupNfOXlnDUgDZ1XTqAGO2OCGOBG6xG6Z59HEDwChDjbAUR8ulRO5bDa0CCrxeLkx6ovh4GsVflBM1Gyytt+rwT3uT83g4Ov24toe90+ejcJ6qKujopnQ2bvORlzxTu6pHbRBrcGTdDaSqLsDCvVXECHjZphRI657ATshfRTtH2NDs7FonN98Tnaro9sHOxIj00It9TzozWO+8kDzOcvN41yVUBXF8fSxEGgEQw1IXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0010.namprd12.prod.outlook.com
 (2603:10b6:301:4a::20) by MWHPR12MB1533.namprd12.prod.outlook.com
 (2603:10b6:301:f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Tue, 20 Aug
 2019 19:12:31 +0000
Received: from BY2NAM03FT012.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by MWHPR1201CA0010.outlook.office365.com
 (2603:10b6:301:4a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 19:12:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT012.mail.protection.outlook.com (10.152.84.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 19:12:31 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 20 Aug 2019 14:12:28 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 12/14] drm/amd/display: Write DSC enable to MST DPCD
Date: Tue, 20 Aug 2019 15:12:01 -0400
Message-ID: <20190820191203.25807-13-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820191203.25807-1-David.Francis@amd.com>
References: <20190820191203.25807-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(428003)(189003)(199004)(6666004)(356004)(47776003)(8936002)(4326008)(50226002)(186003)(70206006)(14444005)(11346002)(49486002)(426003)(2616005)(446003)(486006)(86362001)(336012)(476003)(126002)(305945005)(36756003)(50466002)(2906002)(26005)(76176011)(16586007)(110136005)(70586007)(51416003)(54906003)(478600001)(450100002)(53936002)(5660300002)(81156014)(48376002)(1076003)(8676002)(316002)(81166006)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1533; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19072e1e-7d29-4c22-5e03-08d725a25986
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1533; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1533:
X-Microsoft-Antispam-PRVS: <MWHPR12MB153318CF30DC6E337218403BEFAB0@MWHPR12MB1533.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: LlgU+ERjuwFAhc/1eGvis0xJv+ztYMWrBqkzIG0lQ7rNkAbtDFA0j+i8ZOVm6/HcbCVbJ6aOJYfirLWZH+J3xxk8f6PnhOyyFX3M2p6C28pNyajtreHsW+9IhtrxAcQ77mTEVZoJ8LgFyytBVyvB7AFP52jV5zHnQARQ8ktCDKxGnzXq8btwsGJlFk9SjrC57M1SLSHChL2V9hYVUJBSkmn9sEia/Dm3SjtQ0Xxcn4Sdzmp48IK4cFRuHztFr7HJWL3RxieMLpziAY2nhAw/zmnfHrpJkZkCaABe+aOSW/O+oqxvj9YvVHI+0CsdIIfC8Ppsp0YlCXQMgndOKCd4CqsOsG79OARVcdXMmrebcTec7eBrnei37K2oLMFKhDgubPdhoe97eK2Z293yeW96XlRDr2BElHv0GIPyBBzXvsc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 19:12:31.1471 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19072e1e-7d29-4c22-5e03-08d725a25986
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1533
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQrBmvdVpL7x5gTc0IXWqcmB61E5qzh1r5PUSj9kOJs=;
 b=0SK7FapcfbmrDn1vtJ1kQ1pLnmKz31B2AtGh8XJIioVnF53FuBNyyJY0cdMcMXAJnmihU/cbLBwva4p8eNbKmGWN2gMkW7k826b50nao5dVvzU3hINDf+0PgSGQhbvPdtUx9Yzf3ZMQvJVUIRpHPU+SLgkArXl0gXMqVc3al3Xs=
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
Cc: David Francis <David.Francis@amd.com>, Wenjing Liu <Wenjing.Liu@amd.com>,
 Nikola Cornij <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV3b3JrIHRoZSBkbV9oZWxwZXJzX3dyaXRlX2RzY19lbmFibGUgY2FsbGJhY2sgdG8KaGFuZGxl
IHRoZSBNU1QgY2FzZQoKRGVwZW5kaW5nIG9uIGhvdyBEU0MgaXMgZG9uZSwgdGhlIERQX0RTQ19F
TkFCTEUgYml0Cm5lZWRzIHRvIGJlIHNldCBvbiBhIGRpZmZlcmVudCBwb2ludAoKRm9yIFNTVCwg
dXNlIHRoZSBsaW5rIGF1eAoKRm9yIGVuZHBvaW50IERTQyBvdmVyIERQLXRvLURQIHBlZXIgZGV2
aWNlcywKdXNlIHRoZSBvdXRwdXQgcG9ydAoKRm9yIHBlZXIgZGV2aWNlIERTQyBvdmVyIERQLXRv
LURQIHBlZXIgZGV2aWNlcywKdXNlIHRoZSB1cHN0cmVhbSAocGVlcikgZGV2aWNlCgpGb3IgRFAt
dG8tSERNSSBvciB2aXJ0dWFsIERQIHBlZXIgZGV2aWNlcywKdXNlIHRoZSBvdXRwdXQgcG9ydAoK
Rm9yIHRoZSBTeW5hcHRpeCB3b3JrYXJvdW5kLCB1c2UgdGhlIGxpbmsgYXV4CgpDYzogV2Vuamlu
ZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+CkNjOiBOaWtvbGEgQ29ybmlqIDxOaWtvbGEuQ29y
bmlqQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNA
YW1kLmNvbT4KLS0tCiAuLi4vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJz
LmMgfCAzMCArKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwppbmRleCBkZmE5OWUwZDZlNjQu
LjYyNzMxYzJiZjJiZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwpAQCAtMzgsNiArMzgsNyBAQAogI2lu
Y2x1ZGUgImRjLmgiCiAjaW5jbHVkZSAiYW1kZ3B1X2RtLmgiCiAjaW5jbHVkZSAiYW1kZ3B1X2Rt
X2lycS5oIgorI2luY2x1ZGUgImFtZGdwdV9kbV9tc3RfdHlwZXMuaCIKIAogI2luY2x1ZGUgImRt
X2hlbHBlcnMuaCIKIApAQCAtNTU2LDggKzU1NywzNSBAQCBib29sIGRtX2hlbHBlcnNfZHBfd3Jp
dGVfZHNjX2VuYWJsZSgKICkKIHsKIAl1aW50OF90IGVuYWJsZV9kc2MgPSBlbmFibGUgPyAxIDog
MDsKKwlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvcjsKKworCWlmICghc3Ry
ZWFtKQorCQlyZXR1cm4gZmFsc2U7CisKKwlpZiAoc3RyZWFtLT5zaWduYWwgPT0gU0lHTkFMX1RZ
UEVfRElTUExBWV9QT1JUX01TVCkgeworCQlhY29ubmVjdG9yID0gKHN0cnVjdCBhbWRncHVfZG1f
Y29ubmVjdG9yICopc3RyZWFtLT5kbV9zdHJlYW1fY29udGV4dDsKKworCQlpZiAoIWFjb25uZWN0
b3IgfHwgIWFjb25uZWN0b3ItPmRjX3NpbmspCisJCQlyZXR1cm4gZmFsc2U7CisKKwkJaWYgKCFh
Y29ubmVjdG9yLT5kY19zaW5rLT5zaW5rX2RzY19jYXBzLmlzX3ZpcnR1YWxfZHBjZF9kc2MpCisJ
CQlyZXR1cm4gZHJtX2RwX21zdF9kcGNkX3dyaXRlKCZhY29ubmVjdG9yLT5wb3J0LT5hdXgsCisJ
CQkJCQkgICAgRFBfRFNDX0VOQUJMRSwgJmVuYWJsZV9kc2MsIDEpID49IDA7CisJCWVsc2UgaWYg
KGlzX3ZpcnR1YWxfZHBjZChhY29ubmVjdG9yLT5wb3J0LT5wYXJlbnQtPnBvcnRfcGFyZW50KSkK
KwkJCXJldHVybiBkcm1fZHBfbXN0X2RwY2Rfd3JpdGUoJmFjb25uZWN0b3ItPnBvcnQtPnBhcmVu
dC0+cG9ydF9wYXJlbnQtPmF1eCwKKwkJCQkJCSAgICBEUF9EU0NfRU5BQkxFLCAmZW5hYmxlX2Rz
YywgMSkgPj0gMDsKKwkJZWxzZSBpZiAoaXNfdmlydHVhbF9kcGNkKGFjb25uZWN0b3ItPnBvcnQp
KQorCQkJcmV0dXJuIGRybV9kcF9tc3RfZHBjZF93cml0ZSgmYWNvbm5lY3Rvci0+cG9ydC0+YXV4
LAorCQkJCQkJICAgIERQX0RTQ19FTkFCTEUsICZlbmFibGVfZHNjLCAxKSA+PSAwOworCQllbHNl
IGlmIChzeW5hcHRpeF93b3JrYXJvdW5kKGFjb25uZWN0b3IpKQorCQkJcmV0dXJuIGRtX2hlbHBl
cnNfZHBfd3JpdGVfZHBjZChjdHgsIHN0cmVhbS0+bGluaywKKwkJCQkJCURQX0RTQ19FTkFCTEUs
ICZlbmFibGVfZHNjLCAxKTsKKwl9CisKKwlpZiAoc3RyZWFtLT5zaWduYWwgPT0gU0lHTkFMX1RZ
UEVfRElTUExBWV9QT1JUKQorCQlyZXR1cm4gZG1faGVscGVyc19kcF93cml0ZV9kcGNkKGN0eCwg
c3RyZWFtLT5saW5rLCBEUF9EU0NfRU5BQkxFLCAmZW5hYmxlX2RzYywgMSk7CiAKLQlyZXR1cm4g
ZG1faGVscGVyc19kcF93cml0ZV9kcGNkKGN0eCwgc3RyZWFtLT5zaW5rLT5saW5rLCBEUF9EU0Nf
RU5BQkxFLCAmZW5hYmxlX2RzYywgMSk7CisJcmV0dXJuIGZhbHNlOwogfQogI2VuZGlmCiAKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
