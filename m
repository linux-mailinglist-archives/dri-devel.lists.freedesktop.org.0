Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD9BF3327
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568376E0FD;
	Thu,  7 Nov 2019 15:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790082.outbound.protection.outlook.com [40.107.79.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0F36F700;
 Thu,  7 Nov 2019 15:32:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xuz3Uq2WHWAoP42W8k7UdGzoX/UxLpCCybjvwokuJcgk3eZpeQljdEOwlDS3B10BEbPq6YZ6Dxh1cTF79bIEz7XRCRO3GhccJW9BQ6ZSUgur3eUIynISlWD2mTLcCOFKzkmWRn1wFllNDex16h8QFbWrAUnLc5kSenNJ7PLe/FfuHKYyZGjJqaxEtXXI1GCaN2hrMMcM9GYjr4HotwhakrUcZ/vqfeUL5s2BoAG0Ime4gMR7FQ23F/pVZI3XcEalgAwkvdywNcSZc00cbtl3BPNpzYzcp37B7hsIXhKqgVOp3vXv8u0dhFoGULJfhjcqm6dVVuU8YZLQ1LLui9biYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtzNhoT5WrJIF43FzY54g/YC8FN7tJzave3qPSMHVEs=;
 b=AZAwIXkgbGc0Ng4LmDPo02z7aUrmBNhcXKVW3+qyd2CYJuT9tHxsqUT8WSBrbhRyOtxhElur8cs9Jfr+bZ60LAER7zqhxYnOzOJHIG2EkDoFus5tYPnjzMHP23VN8roG/tm/q8etHFEahEN5b0mmYm+yCXIzf7qTpx2G93y3ZHpiFkHaxi3sQlTPRJUmboUoQW1S6HdcH63UrQv6b0EOu+MOIp8RDNYvXW3ywuvpEr6gSivLYnZAlSFUKiHE8yECZM3Iyp2MH2YUC2nLSm5D2Wc4Gx2YnOfMeEXjPpjqcNn8ZvmVkmN8k6Z5641vLdpD5vwUCF3eTljxa79Vm+O+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0038.namprd12.prod.outlook.com (2603:10b6:301:2::24)
 by CH2PR12MB4103.namprd12.prod.outlook.com (2603:10b6:610:7e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Thu, 7 Nov
 2019 15:32:27 +0000
Received: from DM3NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by MWHPR12CA0038.outlook.office365.com
 (2603:10b6:301:2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20 via Frontend
 Transport; Thu, 7 Nov 2019 15:32:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT041.mail.protection.outlook.com (10.152.83.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2430.20 via Frontend Transport; Thu, 7 Nov 2019 15:32:26 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 7 Nov 2019
 09:32:20 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 7 Nov 2019 09:32:19 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 02/13] drm/dp_mst: Parse FEC capability on MST ports
Date: Thu, 7 Nov 2019 10:32:01 -0500
Message-ID: <20191107153212.1145-3-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107153212.1145-1-mikita.lipski@amd.com>
References: <20191107153212.1145-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(136003)(346002)(376002)(39860400002)(428003)(199004)(189003)(70206006)(54906003)(50466002)(6666004)(86362001)(316002)(51416003)(70586007)(11346002)(8936002)(7696005)(76176011)(47776003)(2876002)(2616005)(50226002)(16586007)(48376002)(486006)(305945005)(5660300002)(4326008)(476003)(126002)(6916009)(1076003)(8676002)(426003)(81166006)(186003)(81156014)(2906002)(53416004)(2351001)(26005)(36756003)(336012)(446003)(450100002)(478600001)(356004)(16060500001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4103; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 719ae963-7522-4ba1-b1fa-08d76397b1af
X-MS-TrafficTypeDiagnostic: CH2PR12MB4103:
X-Microsoft-Antispam-PRVS: <CH2PR12MB41031903D8BF058E091F2F32E4780@CH2PR12MB4103.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0214EB3F68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BIrgLKiO9PDgadwq247Dn3RGPnjkjtC7be9DkgINzLRSf5M7ie5Yothux9KQXx51EhUzwGOuAjeyj0x7x3+FjwjjqjgChCNWczWAzrBo8FWtZxGfrerPYp/9zgrlRc9DfTYc18+utu0hYhfbl6d1vvrEYOKc4zanSPB8n8NN4PZIuaqYPdKqrTfYeITgG11zGE/EedCNFXlnvr0d5h7wnt5Ca0r6Eqz6EzibCELuBNp9MWyfqWKmDWxGEh4HLMtTMeMY+oz+lglGtAz2jnRgheMJE5YH3g/tLQ73q8A46ohRElLLyhp/R7Y74kuIPedL4mrmmWWAGT9gUEkAp66I+WSLLQO2vs2RzOAphkg/8fFqVEC1fuKsRrXMQ5PhWMHlVVahQo0P5m0wwvX84lu68MePRMMmuVASSlW9OqiSSRBuDYMr1k1c5Y3cwj3gCU2Y
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 15:32:26.7646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 719ae963-7522-4ba1-b1fa-08d76397b1af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4103
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtzNhoT5WrJIF43FzY54g/YC8FN7tJzave3qPSMHVEs=;
 b=SowS2RKy2FVKp3qA3DB0el1QXYkTVNVtSCLVduPv08ZeiLoyjZZFHKiMgA1giGcvT8bHZvN2TAJ+V0uuBfj0ZfqMkvWfisyuBODYoy4dysBhfuvDHzasK4uBmsTD+wDv1FyaHTl/q9GCfzauxqyyQLkcuQqpDjfB9uXtxkOIIP8=
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

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKQXMgb2YgRFAxLjQs
IEVOVU1fUEFUSF9SRVNPVVJDRVMgcmV0dXJucyBhIGJpdCBpbmRpY2F0aW5nCmlmIEZFQyBjYW4g
YmUgc3VwcG9ydGVkIHVwIHRvIHRoYXQgcG9pbnQgaW4gdGhlIE1TVCBuZXR3b3JrLgoKVGhlIGJp
dCBpcyB0aGUgZmlyc3QgYnl0ZSBvZiB0aGUgRU5VTV9QQVRIX1JFU09VUkNFUyBhY2sgcmVwbHks
CmJvdHRvbS1tb3N0IGJpdCAocmVmZXIgdG8gc2VjdGlvbiAyLjExLjkuNCBvZiBEUCBzdGFuZGFy
ZCwKdjEuNCkKClRoYXQgdmFsdWUgaXMgbmVlZGVkIGZvciBGRUMgYW5kIERTQyBzdXBwb3J0CgpT
dG9yZSBpdCBvbiBkcm1fZHBfbXN0X3BvcnQKClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVk
ZUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5k
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMiArKwog
aW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICB8IDMgKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
CmluZGV4IDNlN2I3NTUzY2Y0ZC4uOWYzNjA0MzU1NzA1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMKQEAgLTU1Myw2ICs1NTMsNyBAQCBzdGF0aWMgYm9vbCBkcm1fZHBfc2lk
ZWJhbmRfcGFyc2VfZW51bV9wYXRoX3Jlc291cmNlc19hY2soc3RydWN0IGRybV9kcF9zaWRlYmFu
ZAogewogCWludCBpZHggPSAxOwogCXJlcG1zZy0+dS5wYXRoX3Jlc291cmNlcy5wb3J0X251bWJl
ciA9IChyYXctPm1zZ1tpZHhdID4+IDQpICYgMHhmOworCXJlcG1zZy0+dS5wYXRoX3Jlc291cmNl
cy5mZWNfY2FwYWJsZSA9IHJhdy0+bXNnW2lkeF0gJiAweDE7CiAJaWR4Kys7CiAJaWYgKGlkeCA+
IHJhdy0+Y3VybGVuKQogCQlnb3RvIGZhaWxfbGVuOwpAQCAtMjE4Myw2ICsyMTg0LDcgQEAgc3Rh
dGljIGludCBkcm1fZHBfc2VuZF9lbnVtX3BhdGhfcmVzb3VyY2VzKHN0cnVjdCBkcm1fZHBfbXN0
X3RvcG9sb2d5X21nciAqbWdyLAogCQkJRFJNX0RFQlVHX0tNUygiZW51bSBwYXRoIHJlc291cmNl
cyAlZDogJWQgJWRcbiIsIHR4bXNnLT5yZXBseS51LnBhdGhfcmVzb3VyY2VzLnBvcnRfbnVtYmVy
LCB0eG1zZy0+cmVwbHkudS5wYXRoX3Jlc291cmNlcy5mdWxsX3BheWxvYWRfYndfbnVtYmVyLAog
CQkJICAgICAgIHR4bXNnLT5yZXBseS51LnBhdGhfcmVzb3VyY2VzLmF2YWlsX3BheWxvYWRfYndf
bnVtYmVyKTsKIAkJCXBvcnQtPmF2YWlsYWJsZV9wYm4gPSB0eG1zZy0+cmVwbHkudS5wYXRoX3Jl
c291cmNlcy5hdmFpbF9wYXlsb2FkX2J3X251bWJlcjsKKwkJCXBvcnQtPmZlY19jYXBhYmxlID0g
dHhtc2ctPnJlcGx5LnUucGF0aF9yZXNvdXJjZXMuZmVjX2NhcGFibGU7CiAJCX0KIAl9CiAKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggYi9pbmNsdWRlL2RybS9k
cm1fZHBfbXN0X2hlbHBlci5oCmluZGV4IDkxMTZiMmM5NTIzOS4uZjExM2FlMDRmYTg4IDEwMDY0
NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJt
L2RybV9kcF9tc3RfaGVscGVyLmgKQEAgLTEwOCw2ICsxMDgsOCBAQCBzdHJ1Y3QgZHJtX2RwX21z
dF9wb3J0IHsKIAkgKiBhdWRpby1jYXBhYmxlLgogCSAqLwogCWJvb2wgaGFzX2F1ZGlvOworCisJ
Ym9vbCBmZWNfY2FwYWJsZTsKIH07CiAKIC8qKgpAQCAtMzEyLDYgKzMxNCw3IEBAIHN0cnVjdCBk
cm1fZHBfcG9ydF9udW1iZXJfcmVxIHsKIAogc3RydWN0IGRybV9kcF9lbnVtX3BhdGhfcmVzb3Vy
Y2VzX2Fja19yZXBseSB7CiAJdTggcG9ydF9udW1iZXI7CisJYm9vbCBmZWNfY2FwYWJsZTsKIAl1
MTYgZnVsbF9wYXlsb2FkX2J3X251bWJlcjsKIAl1MTYgYXZhaWxfcGF5bG9hZF9id19udW1iZXI7
CiB9OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
