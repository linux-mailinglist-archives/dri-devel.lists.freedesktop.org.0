Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39D59EA93
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 16:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBD389B69;
	Tue, 27 Aug 2019 14:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740083.outbound.protection.outlook.com [40.107.74.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEE189BA3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 14:13:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/F4MoJjQdOlES8sbQXv5UP9KnJhuiT/aT7LjBkdwuh1kxnXhfjvitogYUsKB1EYwYiFlCyoVNPy1EJqdEfhWvFPpvKCRrTYiRPMevkXPf2UPFHv6DGcfxf8vRDUmwIscjerRu7moEvNbDzZskkIj5Hj/dohPk6Xuxegh56zRVrzKKqeRDqwxEnWNYHUM4rsjeb/HkSLMUV1kpOqK3bldvx3QpExehAlVtk1WEk4/qSlTb8+nvZvmdOvbZT53gTEmHkNrMHEjODPWCXpgxDwYVTe8SfJrIKvwgEIWDJB6ViABcnr8cmZBfFmTVM2nLvS6BeRJeIDBJIxA+YnK7Vuuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWkHcf2DlS6Cs1izW//E3WOO2f0KGvhdlt2ffJIsWn0=;
 b=SSXd+xKv9qGSA5x9zVqTePwKn7hSvoGDmm9KrXXVU0ep8TYDJ6AdWyxSvdwk25QaiWH3GqT83tq79yh2vc2rrFNx9oPfrNAFyC24Ph42cVYPB8Jrfi6EyneiFgoKLpVi7CT4astAXFRwM/H1MwVJsLJqhiG1l6w/GnyV3kOqICCHafX1mSZQV+JIZlBklR/v1KKxi+ZvK48MTd1zFaUV2gtGqdwQ9JiXeSHPPV4wngHNuIBHklm64JZtMKGthYFXDIGYAKOd+z88It+QTHwr28E0tiue0xXBK7UyT044fXsQDVAd/3KvfIyOeQFYG0LPBhqoaq4NEViKAKdxXkTGHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0010.namprd12.prod.outlook.com
 (2603:10b6:405:4c::20) by SN6PR12MB2720.namprd12.prod.outlook.com
 (2603:10b6:805:70::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Tue, 27 Aug
 2019 14:13:35 +0000
Received: from DM3NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by BN6PR1201CA0010.outlook.office365.com
 (2603:10b6:405:4c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Tue, 27 Aug 2019 14:13:33 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT045.mail.protection.outlook.com (10.152.82.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 27 Aug 2019 14:13:33 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 27 Aug 2019 09:13:31 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 2/6] drm/dp_mst: Parse FEC capability on MST ports
Date: Tue, 27 Aug 2019 10:13:25 -0400
Message-ID: <20190827141329.30767-3-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190827141329.30767-1-David.Francis@amd.com>
References: <20190827141329.30767-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(2980300002)(428003)(199004)(189003)(1076003)(478600001)(2351001)(36756003)(316002)(16586007)(5660300002)(53936002)(48376002)(6916009)(70206006)(70586007)(50226002)(8936002)(81166006)(81156014)(356004)(6666004)(4326008)(50466002)(49486002)(446003)(47776003)(11346002)(86362001)(305945005)(2616005)(26005)(336012)(426003)(476003)(126002)(486006)(51416003)(8676002)(76176011)(2906002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2720; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c5c411f-c8b9-4b72-459d-08d72af8bed0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:SN6PR12MB2720; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2720:
X-Microsoft-Antispam-PRVS: <SN6PR12MB272093402F458D931B4172A3EFA00@SN6PR12MB2720.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0142F22657
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: L0YenEAnAg2J73fUASpltCDio3ye6hF0MIf7gSjD7o31A0jKl20Dk6uG6dQ/IlDha4dhofi+oRpCWTNB06SZUUmLkWBYQZ0/7lCTrzvEsZH2SQPG554m9KQcybnaYogsWLaU4OpR1n2EzKds6k3HpL6Q4vZiRu/aCCmZlDHit2f5M+LhhQzI+TajZ06ndjeGwt39VPrQ5q+qfN0ykSpfUqEaliroJLc3O4uLL/3GdNyT2Gpyh7nG6aKiTcAQSJGEEotIe4pfyOMp52YeBPN3fwX3hnfo3uK0O+ILZvPhdDphMPzoZMH3RW9E5oxy4vYENSSEdIzmE4f4V6pWMCDXJlBEV2NPQunDUi2kobdcQi3wYdJw46Z55hQb8BuK6OcboGKlpp83ohGJd3w5ojVHZ4hqoiZrUFciM/SsLibVn/o=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2019 14:13:33.6479 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5c411f-c8b9-4b72-459d-08d72af8bed0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2720
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWkHcf2DlS6Cs1izW//E3WOO2f0KGvhdlt2ffJIsWn0=;
 b=2jIRAXOafRb/QqMmxfQBrh/N+VdnEFQmSKvQ2IG/xbEwPmSAW2uxR+EPWA7EWfcFAPJt2z5bj2+BMtq4zYOMSqFrhgaZNcU/ILPo6JQ9NivmLnhirxk9ZcVCqk7WEXmpVYAT5taYb7Q605RgjFWXRWWHqyT/vbYPq+2ZRYk24rU=
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
dmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEx5dWRlIFBh
dWwgPGx5dWRlQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnku
d2VudGxhbmRAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9n
eS5jIHwgMiArKwogaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICB8IDMgKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jCmluZGV4IDNlN2I3NTUzY2Y0ZC4uOWYzNjA0MzU1NzA1IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTU1Myw2ICs1NTMsNyBAQCBzdGF0aWMgYm9v
bCBkcm1fZHBfc2lkZWJhbmRfcGFyc2VfZW51bV9wYXRoX3Jlc291cmNlc19hY2soc3RydWN0IGRy
bV9kcF9zaWRlYmFuZAogewogCWludCBpZHggPSAxOwogCXJlcG1zZy0+dS5wYXRoX3Jlc291cmNl
cy5wb3J0X251bWJlciA9IChyYXctPm1zZ1tpZHhdID4+IDQpICYgMHhmOworCXJlcG1zZy0+dS5w
YXRoX3Jlc291cmNlcy5mZWNfY2FwYWJsZSA9IHJhdy0+bXNnW2lkeF0gJiAweDE7CiAJaWR4Kys7
CiAJaWYgKGlkeCA+IHJhdy0+Y3VybGVuKQogCQlnb3RvIGZhaWxfbGVuOwpAQCAtMjE4Myw2ICsy
MTg0LDcgQEAgc3RhdGljIGludCBkcm1fZHBfc2VuZF9lbnVtX3BhdGhfcmVzb3VyY2VzKHN0cnVj
dCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAogCQkJRFJNX0RFQlVHX0tNUygiZW51bSBw
YXRoIHJlc291cmNlcyAlZDogJWQgJWRcbiIsIHR4bXNnLT5yZXBseS51LnBhdGhfcmVzb3VyY2Vz
LnBvcnRfbnVtYmVyLCB0eG1zZy0+cmVwbHkudS5wYXRoX3Jlc291cmNlcy5mdWxsX3BheWxvYWRf
YndfbnVtYmVyLAogCQkJICAgICAgIHR4bXNnLT5yZXBseS51LnBhdGhfcmVzb3VyY2VzLmF2YWls
X3BheWxvYWRfYndfbnVtYmVyKTsKIAkJCXBvcnQtPmF2YWlsYWJsZV9wYm4gPSB0eG1zZy0+cmVw
bHkudS5wYXRoX3Jlc291cmNlcy5hdmFpbF9wYXlsb2FkX2J3X251bWJlcjsKKwkJCXBvcnQtPmZl
Y19jYXBhYmxlID0gdHhtc2ctPnJlcGx5LnUucGF0aF9yZXNvdXJjZXMuZmVjX2NhcGFibGU7CiAJ
CX0KIAl9CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggYi9p
bmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCmluZGV4IDkxMTZiMmM5NTIzOS4uZjExM2Fl
MDRmYTg4IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCisrKyBi
L2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKQEAgLTEwOCw2ICsxMDgsOCBAQCBzdHJ1
Y3QgZHJtX2RwX21zdF9wb3J0IHsKIAkgKiBhdWRpby1jYXBhYmxlLgogCSAqLwogCWJvb2wgaGFz
X2F1ZGlvOworCisJYm9vbCBmZWNfY2FwYWJsZTsKIH07CiAKIC8qKgpAQCAtMzEyLDYgKzMxNCw3
IEBAIHN0cnVjdCBkcm1fZHBfcG9ydF9udW1iZXJfcmVxIHsKIAogc3RydWN0IGRybV9kcF9lbnVt
X3BhdGhfcmVzb3VyY2VzX2Fja19yZXBseSB7CiAJdTggcG9ydF9udW1iZXI7CisJYm9vbCBmZWNf
Y2FwYWJsZTsKIAl1MTYgZnVsbF9wYXlsb2FkX2J3X251bWJlcjsKIAl1MTYgYXZhaWxfcGF5bG9h
ZF9id19udW1iZXI7CiB9OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
