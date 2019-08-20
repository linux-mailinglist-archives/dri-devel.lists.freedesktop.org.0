Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F18E9692C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 21:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FD26E872;
	Tue, 20 Aug 2019 19:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720075.outbound.protection.outlook.com [40.107.72.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6476E86C;
 Tue, 20 Aug 2019 19:12:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkuQy59GUj3DytRl/eToJPOh8WaOVP6mMy9r2QAdbtCtosIHdz3/MxdpmOnGxInTTUkAotau9iQ99+MYPOHwIhgj0Vlr8xsrqxW7+2U9nCH2J3XyzXNlAbPw5w+6AgSFIoMu2qetQ/KJHOuaPM2T00xM8iZeAfR9fPqRIqCjy/v0z9U5Ml4mqGwTMc/24XdiyFgI31jyRrGu2GGs2o529r0E0/rcXeqaN18oB0eYOb1cNohErhwjwuMmFvhzkn69Z+0f+l9d3yitaBXeddh/Y9mpJjO4XEqX9klAwwxhl+Wj2+0xwm/DNcYDCQ6tivYjVo5TwDyz2vtKSRfA8rfV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtCR6fWKI+boeE4sxEqRXhuPFOL/DaxNEvcfqpsdLf8=;
 b=AwRqCHOwrkeb39XKaBv/bCC9sIrkEiXGbFQBKdM9LYzITggehMUSZKdulnuPxOcoFmmcHbQkTzio04a4zhHqy6xR5N+FYgLcJO63G8ExreI4zuDwQvmFp7RrXMSn2Gj/pyFIqBHjDCPL0eTiIoO8LcqErNxs0TN+fIiA7M+n/oeyo8D0U6Vnuh/B06WAOWInBCtLuSmeirgVCbRxXYS4qs6ril2FxtgZeV2K1CyBg88tdBsb5SavpTTMsz3nWvO9N1r4JWlYmslo8C0yw1n5/YPcwbJM0QSs1+oRDXgjX1IUg8atuhaqzuJ3QW98vSaNJ25EswIr+Y0+a6LAZnfMVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0010.namprd12.prod.outlook.com
 (2603:10b6:301:4a::20) by DM5PR12MB1276.namprd12.prod.outlook.com
 (2603:10b6:3:79::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Tue, 20 Aug
 2019 19:12:27 +0000
Received: from BY2NAM03FT012.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by MWHPR1201CA0010.outlook.office365.com
 (2603:10b6:301:4a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 19:12:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT012.mail.protection.outlook.com (10.152.84.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 19:12:26 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 20 Aug 2019 14:12:23 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 08/14] drm/dp-mst: Parse FEC capability on MST ports
Date: Tue, 20 Aug 2019 15:11:57 -0400
Message-ID: <20190820191203.25807-9-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820191203.25807-1-David.Francis@amd.com>
References: <20190820191203.25807-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(2980300002)(428003)(189003)(199004)(450100002)(76176011)(4326008)(16586007)(316002)(426003)(486006)(11346002)(446003)(126002)(476003)(53936002)(81156014)(8676002)(5660300002)(110136005)(2616005)(49486002)(81166006)(50226002)(36756003)(8936002)(478600001)(186003)(26005)(1076003)(47776003)(2906002)(86362001)(336012)(50466002)(51416003)(70586007)(6666004)(305945005)(48376002)(356004)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1276; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e2858e3-f1ff-4a9b-8172-08d725a256e9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1276; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1276:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12762405CF44E63A0F31532BEFAB0@DM5PR12MB1276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +OSbyFJ46oUiZA4GtcgamQ+dd8cVIeLs3eK3ZTOuknqOBbD+JVta5BH7E+QMDLUp64SK/QSgyiOeYY/ZsR2d+SFj2hb3R+YZZ7ABepdxumsTd8sAk8LBPkW9bLZGi+QPBKBBDe2vzii7nE3qrUW8CJuE9PZQ3uxCaK0C5PUqOdSAtOYaSZVju9ISIIQhKGHjxYAmYKdJsc/yZVCk8wjrFU7AMy9oWmxsgRx6qzy7RdQc20aIUdUwBV6WPZGIx/OjVC3ePpZA5/IHS+l1HRnwEB9QD6kBo/ZrvGWsmyy5HgYQL4bIygL3eONtaVbCDjmhrmsO78ra8hP/L0iS9/JPurUQnsUjcckvYXJ0azYjOBxTnfbdGiPNnPVGcchA2RJyd2NFryrtQVhclCizwI5r7/S6pxHrNOkhpORZm/cDq00=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 19:12:26.7656 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2858e3-f1ff-4a9b-8172-08d725a256e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtCR6fWKI+boeE4sxEqRXhuPFOL/DaxNEvcfqpsdLf8=;
 b=TDAuzcuqff6DDl7w20Vc9Zs5mbaH9ijOs/eSKdy7zoVffFkmyiOVkOjAMy69cPgQfOX5vubhVFfKHBJUVBVnLsPgUGH7KN5H6InaxEgOTfvi/Q+/DCatxjqKnr+Hy7BNdg45P8oTMhMsRkORO5YwykLfLo7U4KRBJ7NBILg/QrM=
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
Cc: David Francis <David.Francis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXMgb2YgRFAxLjQsIEVOVU1fUEFUSF9SRVNPVVJDRVMgcmV0dXJucyBhIGJpdCBpbmRpY2F0aW5n
CmlmIEZFQyBjYW4gYmUgc3VwcG9ydGVkIHVwIHRvIHRoYXQgcG9pbnQgaW4gdGhlIE1TVCBuZXR3
b3JrLgoKVGhlIGJpdCBpcyB0aGUgZmlyc3QgYnl0ZSBvZiB0aGUgRU5VTV9QQVRIX1JFU09VUkNF
UyBhY2sgcmVwbHksCmJvdHRvbS1tb3N0IGJpdCAocmVmZXIgdG8gc2VjdGlvbiAyLjExLjkuNCBv
ZiBEUCBzdGFuZGFyZCwKdjEuNCkKClRoYXQgdmFsdWUgaXMgbmVlZGVkIGZvciBGRUMgYW5kIERT
QyBzdXBwb3J0CgpTdG9yZSBpdCBvbiBkcm1fZHBfbXN0X3BvcnQKClNpZ25lZC1vZmYtYnk6IERh
dmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMiArKwogaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxw
ZXIuaCAgICAgICB8IDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IGQ3ODliN2FmN2RiZi4uYjQwZDk3
NWFlYzc2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTU1Miw2ICs1
NTIsNyBAQCBzdGF0aWMgYm9vbCBkcm1fZHBfc2lkZWJhbmRfcGFyc2VfZW51bV9wYXRoX3Jlc291
cmNlc19hY2soc3RydWN0IGRybV9kcF9zaWRlYmFuZAogewogCWludCBpZHggPSAxOwogCXJlcG1z
Zy0+dS5wYXRoX3Jlc291cmNlcy5wb3J0X251bWJlciA9IChyYXctPm1zZ1tpZHhdID4+IDQpICYg
MHhmOworCXJlcG1zZy0+dS5wYXRoX3Jlc291cmNlcy5mZWNfY2FwYWJsZSA9IHJhdy0+bXNnW2lk
eF0gJiAweDE7CiAJaWR4Kys7CiAJaWYgKGlkeCA+IHJhdy0+Y3VybGVuKQogCQlnb3RvIGZhaWxf
bGVuOwpAQCAtMjE4MCw2ICsyMTgxLDcgQEAgc3RhdGljIGludCBkcm1fZHBfc2VuZF9lbnVtX3Bh
dGhfcmVzb3VyY2VzKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAogCQkJRFJN
X0RFQlVHX0tNUygiZW51bSBwYXRoIHJlc291cmNlcyAlZDogJWQgJWRcbiIsIHR4bXNnLT5yZXBs
eS51LnBhdGhfcmVzb3VyY2VzLnBvcnRfbnVtYmVyLCB0eG1zZy0+cmVwbHkudS5wYXRoX3Jlc291
cmNlcy5mdWxsX3BheWxvYWRfYndfbnVtYmVyLAogCQkJICAgICAgIHR4bXNnLT5yZXBseS51LnBh
dGhfcmVzb3VyY2VzLmF2YWlsX3BheWxvYWRfYndfbnVtYmVyKTsKIAkJCXBvcnQtPmF2YWlsYWJs
ZV9wYm4gPSB0eG1zZy0+cmVwbHkudS5wYXRoX3Jlc291cmNlcy5hdmFpbF9wYXlsb2FkX2J3X251
bWJlcjsKKwkJCXBvcnQtPmZlY19jYXBhYmxlID0gdHhtc2ctPnJlcGx5LnUucGF0aF9yZXNvdXJj
ZXMuZmVjX2NhcGFibGU7CiAJCX0KIAl9CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9k
cF9tc3RfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCmluZGV4IGRk
YjUxOGYyMTU3YS4uZmE5NzM3NzNhNGE3IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBf
bXN0X2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKQEAgLTEw
OCw2ICsxMDgsOCBAQCBzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0IHsKIAkgKiBhdWRpby1jYXBhYmxl
LgogCSAqLwogCWJvb2wgaGFzX2F1ZGlvOworCisJYm9vbCBmZWNfY2FwYWJsZTsKIH07CiAKIC8q
KgpAQCAtMzEyLDYgKzMxNCw3IEBAIHN0cnVjdCBkcm1fZHBfcG9ydF9udW1iZXJfcmVxIHsKIAog
c3RydWN0IGRybV9kcF9lbnVtX3BhdGhfcmVzb3VyY2VzX2Fja19yZXBseSB7CiAJdTggcG9ydF9u
dW1iZXI7CisJYm9vbCBmZWNfY2FwYWJsZTsKIAl1MTYgZnVsbF9wYXlsb2FkX2J3X251bWJlcjsK
IAl1MTYgYXZhaWxfcGF5bG9hZF9id19udW1iZXI7CiB9OwotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
