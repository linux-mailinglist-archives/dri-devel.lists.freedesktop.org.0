Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BBAE8A10
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 14:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAFE6E3BC;
	Tue, 29 Oct 2019 13:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750052.outbound.protection.outlook.com [40.107.75.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB8F6E3A8;
 Tue, 29 Oct 2019 13:52:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqB0WyunBLn3Vfv6mczOhpBfZM3fT3/J0Pu+TXRo6iP4zIbyfcUfvAbHyxW3CSKqtAZT6ISErq49Ps71PRUPVuLOx06VlZnFCQjPNCn2+Kh0jvkB/zNVKKJywZsEScYsRLKR+/Egv/CDRXK0mzlxJOredZY4ylGUu0TIaX5xn0a5sdmy0fJQI2epN2BTQp4f0jWfXEwCNsD5cHLBh8LZUMPelIkLo8BTifv/k8oDLPb3GftVXv/HlIKje3CCDY+c89Oa02VBi1qF9llDpGuIlrpKtMw4j4g5qAvhCRT9/FsvL376B1V9zeqduGHJm/FzykO68oOuBGuyTZUi2RVRXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtzNhoT5WrJIF43FzY54g/YC8FN7tJzave3qPSMHVEs=;
 b=mGlt1JQvZtqLu43nJ3g0Z1QFgBIwMUMBAKDsLPu+NuOqkGrsAI++AQ2FIp/ao9n8fRlKneij2tX0GjQCo3DiPLoPHLlZIxzmPe0N4xqXNT2Ffb3P9tOG/xX7FAn1oZIprqm60zGeszjfCUvnqkvSXHpATuAYm7luSFowWIjxFWxosrHGuXnue5UrY6576Pp3cNQD+PI3jIxjf/XRpTDpUJbkWGOw72i1OOYfiJvNluypP9s1tbyE8TwYW962hQFc56HOtvyrFxOURiQIQSU4hfSi4ZE5nSRVg4vKA5EOpfwf6MiQsYhCdxt+CrUQ8Qqgnkp4WOjJnFKiTFei3uDWDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0016.namprd12.prod.outlook.com (2603:10b6:610:57::26)
 by BN7PR12MB2833.namprd12.prod.outlook.com (2603:10b6:408:27::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.23; Tue, 29 Oct
 2019 13:52:55 +0000
Received: from CO1NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by CH2PR12CA0016.outlook.office365.com
 (2603:10b6:610:57::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.23 via Frontend
 Transport; Tue, 29 Oct 2019 13:52:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM03FT011.mail.protection.outlook.com (10.152.80.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 13:52:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 08:52:53 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 08:52:52 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 29 Oct 2019 08:52:52 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/13] drm/dp_mst: Parse FEC capability on MST ports
Date: Tue, 29 Oct 2019 09:52:35 -0400
Message-ID: <20191029135245.31152-4-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029135245.31152-1-mikita.lipski@amd.com>
References: <20191029135245.31152-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(428003)(189003)(199004)(6666004)(86362001)(316002)(356004)(2351001)(126002)(2616005)(446003)(36756003)(48376002)(1076003)(50466002)(11346002)(478600001)(486006)(476003)(70206006)(70586007)(4326008)(50226002)(305945005)(81166006)(51416003)(76176011)(6916009)(7696005)(81156014)(5660300002)(26005)(8676002)(53416004)(186003)(47776003)(426003)(336012)(2876002)(54906003)(16586007)(2906002)(8936002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2833; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:3; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dadb6eb6-0377-4ee0-a229-08d75c774bf5
X-MS-TrafficTypeDiagnostic: BN7PR12MB2833:
X-Microsoft-Antispam-PRVS: <BN7PR12MB283360F8419F55797C02168EE4610@BN7PR12MB2833.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0205EDCD76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KlksXGu8P9GI46y5SxT9Iiz0jmDm1TrthXcZukzSyVJfbm7dhv0mQ43k+rCLWGTR0MSuBd4F65OIecBHOUSmf+h7NQqEhqdRDlMbXlZYW8Mtp6t3ubb94HG6+gedqMc57C4LJ6b42OTpD+IyQPRAZg7PfIQOtkhfTg3XHQVU/mk5DjrJnWJ5ltAGFZQXsKPlNvfAZunQ+1e1vs/0hD3A2NkkA3oxXRrGB2Zbw8UCpBDpXbsjsGB6SYhl1CEjHrXyRZ1iwFbe5aj1kGv6OJKd87oGt1w6WSkqfKhWeTWUqmVYqexU4Ow5Q9kXUN8EPTAIDXD1UIuiQ+xH4KaxWsJ3E0HqB6dTrfBIBHFDE5qWBJDP2tkD40c5ZvRfpz1dR6DNbk4v4vZow6PBSumK2x3o6hS2s+givJukpAa5KFAy39xXhh7ng7VPkrka7o5v6D9H
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2019 13:52:53.9545 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dadb6eb6-0377-4ee0-a229-08d75c774bf5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2833
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtzNhoT5WrJIF43FzY54g/YC8FN7tJzave3qPSMHVEs=;
 b=RnRATHl41sB5X9/3icvtIRM2Jf8vVwrEhp9757Z0ZiPnulcwN+YuIvCieN9VJoKKEk57JCxbKpPn2y2I7a51j/rAVcH7NIJC3rzXCQZQ7QK/8OPpndDLo9VmjthzS4BupWvqpT2dd8FpfGhx7C0/+fioDRHQWcW2K5a3HxKNky8=
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
