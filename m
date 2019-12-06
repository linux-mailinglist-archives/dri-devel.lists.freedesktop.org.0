Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0D2114DB6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21C26EBF0;
	Fri,  6 Dec 2019 08:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78016EBA8;
 Fri,  6 Dec 2019 08:40:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WepbXKF9a4xtIPEVKc6UaFS9oqWnefbvwINUfT8c/h9CcAK1EKpXZccDO20yITjdwpdeBWD6fqdF6m3M2R4Pqf5aXDL9n4CfjapqTzAhyPFHA+x3QXn9UFhgNjafG9WPckDFizXS/kk/7WI4oGVgdXObzVctrDOiFCGs7OHspuZ6xeumCS2f4W4i+AntO7LWcSMVqbwizsFhxdp07g6dhN9nd4UIvCiCCWELecoTFfD2z5CuqH6l6Vr3t82Nc1+vLktzpmH28g6IwHPr4p2nq70dEFiL0JboWhIdpRNlwWv0PPN1gFU5xui80IBDS6UTLW2d+P7j+AcBV6gLjMAuzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0R3dwO+2QLbiZ9BuHUs+Nq2pQBuBJEMh0pkrHYFUtHQ=;
 b=QlCd/pQEZKTJzPnjTVWuMXAtwE2Yxx/5XN6ZA/nrZF5XlVbCRLBMmxTTtlQEysvIMxfLO02fBccOIwhX8SJdvN1grSS9cM2MlIgBwU8hKznqdXrRkO7wioiTPEJzdc+TvgfRAPKNJRaDzvH/W2u0sYiIGNAKRJ4yQPh4xARBMA/g1EBVQuaJcEtI+ZZ/j8JJf7UEYdlcLQHYBm/pdUEJvfvXL5sRxPIi54EkjEzw0t+5/TnOmBz08EvDy4E5WVlIyZM/zhfLPqlR+p2V4gieuXQlAtAUhFtsuA0zteoYkRnG9+vlrerLaZqYCiVpaTaTOLuHaN19oAJT/Ugd3f7FzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0017.namprd12.prod.outlook.com (2603:10b6:4:1::27) by
 MW2PR12MB2555.namprd12.prod.outlook.com (2603:10b6:907:b::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Fri, 6 Dec 2019 08:40:03 +0000
Received: from BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by DM5PR12CA0017.outlook.office365.com
 (2603:10b6:4:1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14 via Frontend
 Transport; Fri, 6 Dec 2019 08:40:03 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT061.mail.protection.outlook.com (10.13.177.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Fri, 6 Dec 2019 08:40:02 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 6 Dec 2019
 02:40:01 -0600
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 6 Dec 2019 02:39:59 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/dp_mst: clear time slots for ports invalid
Date: Fri, 6 Dec 2019 16:39:37 +0800
Message-ID: <20191206083937.9411-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(428003)(199004)(189003)(14444005)(7696005)(36756003)(51416003)(316002)(426003)(8676002)(336012)(16586007)(86362001)(110136005)(54906003)(2906002)(356004)(478600001)(2616005)(48376002)(70206006)(6666004)(70586007)(50466002)(8936002)(81156014)(81166006)(186003)(26005)(4326008)(1076003)(5660300002)(53416004)(305945005)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2555; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2eb6768-d564-4169-35eb-08d77a27e32b
X-MS-TrafficTypeDiagnostic: MW2PR12MB2555:
X-Microsoft-Antispam-PRVS: <MW2PR12MB2555070DAE4E8477A74E14D7FC5F0@MW2PR12MB2555.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0243E5FD68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FiEVtJ8tJp6edj/AHvcZX3sbn9OtUUsEFVtRIzDy+KCt4cwXZTiYORYSyyFgGdCKIMnktb59Ju7XrVX2i4ABmRFlR24sc9PVeqEcy5B0ABXJTsIj6tvYKsMSa9o6zfcsZ3LbXHTmrhCB/odgQuGT1I1ovDP+ad8gsGr3BpqU0nj5CUWDoS9ao25m3eYoom7qw3eCnKl4d15JSq78a46alYLj0vDXyn/CIRpkFjnPfope5mPy4FjFfkaqg1inBjuY5DyQFWKQdC7jYjWSc/4fsTJN49ZuW3vK2KuhH6WxVkntdeJCosw95OlajFJ2vXbMIxUucpfXtirrJQLa+4CLoCC1ufT9EWgjD+oF101z2F2l02ggdfs62+OvLbsd9j18exne67zYtFwbi5wFSV6ZkzecNVMoaD5SSNWvZyuK9RcWAlxn9kBUTlJEMB67wUsM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2019 08:40:02.9347 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2eb6768-d564-4169-35eb-08d77a27e32b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2555
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0R3dwO+2QLbiZ9BuHUs+Nq2pQBuBJEMh0pkrHYFUtHQ=;
 b=qqLDZBuU9o0/gDYBXM2SQ8/drNgFRuCR1F5wT+Yun2kn2N4yYY/xa4eae8JlR1ya0F3gFIsm4GmtHRxfTIJGLcP3PH/eCb86vPmf2ghPzKT8iZ+YLCP6DISCCtV+k+ZcQ6tKhND+GB0IFlZ5lmWS3/t1HUHIYcZ1C907ZTAPK9s=
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
Cc: stable@vger.kernel.org, jerry.zuo@amd.com, Wayne Lin <Wayne.Lin@amd.com>,
 Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1doeV0KV2hlbiBjaGFuZ2UgdGhlIGNvbm5lY3Rpb24gc3RhdHVzIGluIGEgTVNUIHRvcG9sb2d5
LCBtc3QgZGV2aWNlCndoaWNoIGRldGVjdCB0aGUgZXZlbnQgd2lsbCBzZW5kIG91dCBDT05ORUNU
SU9OX1NUQVRVU19OT1RJRlkgbWVzc2dhZS4KCmUuZy4gc3JjLW1zdC1tc3Qtc3N0ID0+IHNyYy1t
c3QgKHVucGx1ZykgbXN0LXNzdAoKQ3VycmVudGx5LCB1bmRlciB0aGUgYWJvdmUgY2FzZSBvZiB1
bnBsdWdnaW5nIGRldmljZSwgcG9ydHMgd2hpY2ggaGF2ZQpiZWVuIGFsbG9jYXRlZCBwYXlsb2Fk
cyBhbmQgYXJlIG5vIGxvbmdlciBpbiB0aGUgdG9wb2xvZ3kgc3RpbGwgb2NjdXB5CnRpbWUgc2xv
dHMgYW5kIHJlY29yZGVkIGluIHByb3Bvc2VkX3ZjcGlbXSBvZiB0b3BvbG9neSBtYW5hZ2VyLgoK
SWYgd2UgZG9uJ3QgY2xlYW4gdXAgdGhlIHByb3Bvc2VkX3ZjcGlbXSwgd2hlbiBjb2RlIGZsb3cg
Z29lcyB0byB0cnkgdG8KdXBkYXRlIHBheWxvYWQgdGFibGUgYnkgY2FsbGluZyBkcm1fZHBfdXBk
YXRlX3BheWxvYWRfcGFydDEoKSwgd2Ugd2lsbApmYWlsIGF0IGNoZWNraW5nIHBvcnQgdmFsaWRh
dGlvbiBkdWUgdG8gdGhlcmUgYXJlIHBvcnRzIHdpdGggcHJvcG9zZWQKdGltZSBzbG90cyBidXQg
bm8gbG9uZ2VyIGluIHRoZSBtc3QgdG9wb2xvZ3kuIEFzIHRoZSByZXN1bHQgb2YgdGhhdCwgd2UK
d2lsbCBhbHNvIHN0b3AgdXBkYXRpbmcgdGhlIERQQ0QgcGF5bG9hZCB0YWJsZSBvZiBkb3duIHN0
cmVhbSBwb3J0LgoKW0hvd10KV2hpbGUgaGFuZGxpbmcgdGhlIENPTk5FQ1RJT05fU1RBVFVTX05P
VElGWSBtZXNzYWdlLCBhZGQgYSBkZXRlY3Rpb24gdG8Kc2VlIGlmIHRoZSBldmVudCBpbmRpY2F0
ZXMgdGhhdCBhIGRldmljZSBpcyB1bnBsdWdnZWQgdG8gYW4gb3V0cHV0IHBvcnQuCklmIHRoZSBk
ZXRlY3Rpb24gaXMgdHJ1ZSwgdGhlbiBpdGVycmF0ZSBvdmVyIGFsbCBwcm9wb3NlZF92Y3BpW10g
dG8Kc2VlIHdoZXRoZXIgYSBwb3J0IG9mIHRoZSBwcm9wb3NlZF92Y3BpW10gaXMgc3RpbGwgaW4g
dGhlIHRvcG9sb2d5IG9yCm5vdC4gSWYgdGhlIHBvcnQgaXMgaW52YWxpZCwgc2V0IGl0cyBudW1f
c2xvdHMgdG8gMC4KClRoZXJlYWZ0ZXIsIHdoZW4gdHJ5IHRvIHVwZGF0ZSBwYXlsb2FkIHRhYmxl
IGJ5IGNhbGxpbmcKZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQxKCksIHdlIGNhbiBzdWNjZXNz
ZnVsbHkgdXBkYXRlIHRoZSBEUENECnBheWxvYWQgdGFibGUgb2YgZG93biBzdHJlYW0gcG9ydCBh
bmQgY2xlYXIgdGhlIHByb3Bvc2VkX3ZjcGlbXSB0byBOVUxMLgoKU2lnbmVkLW9mZi1ieTogV2F5
bmUgTGluIDxXYXluZS5MaW5AYW1kLmNvbT4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMjQgKysrKysrKysrKysr
KysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDUzMDZjNDdkYzgy
MC4uMmUyMzZiNjI3NWM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAg
LTIzMTgsNyArMjMxOCw3IEBAIGRybV9kcF9tc3RfaGFuZGxlX2Nvbm5fc3RhdChzdHJ1Y3QgZHJt
X2RwX21zdF9icmFuY2ggKm1zdGIsCiB7CiAJc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdy
ICptZ3IgPSBtc3RiLT5tZ3I7CiAJc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydDsKLQlpbnQg
b2xkX2RkcHMsIHJldDsKKwlpbnQgb2xkX2RkcHMsIG9sZF9pbnB1dCwgcmV0LCBpOwogCXU4IG5l
d19wZHQ7CiAJYm9vbCBkb3dvcmsgPSBmYWxzZSwgY3JlYXRlX2Nvbm5lY3RvciA9IGZhbHNlOwog
CkBAIC0yMzQ5LDYgKzIzNDksNyBAQCBkcm1fZHBfbXN0X2hhbmRsZV9jb25uX3N0YXQoc3RydWN0
IGRybV9kcF9tc3RfYnJhbmNoICptc3RiLAogCX0KIAogCW9sZF9kZHBzID0gcG9ydC0+ZGRwczsK
KwlvbGRfaW5wdXQgPSBwb3J0LT5pbnB1dDsKIAlwb3J0LT5pbnB1dCA9IGNvbm5fc3RhdC0+aW5w
dXRfcG9ydDsKIAlwb3J0LT5tY3MgPSBjb25uX3N0YXQtPm1lc3NhZ2VfY2FwYWJpbGl0eV9zdGF0
dXM7CiAJcG9ydC0+bGRwcyA9IGNvbm5fc3RhdC0+bGVnYWN5X2RldmljZV9wbHVnX3N0YXR1czsK
QEAgLTIzNzMsNiArMjM3NCwyNyBAQCBkcm1fZHBfbXN0X2hhbmRsZV9jb25uX3N0YXQoc3RydWN0
IGRybV9kcF9tc3RfYnJhbmNoICptc3RiLAogCQlkb3dvcmsgPSBmYWxzZTsKIAl9CiAKKwlpZiAo
IW9sZF9pbnB1dCAmJiBvbGRfZGRwcyAhPSBwb3J0LT5kZHBzICYmICFwb3J0LT5kZHBzKSB7CisJ
CWZvciAoaSA9IDA7IGkgPCBtZ3ItPm1heF9wYXlsb2FkczsgaSsrKSB7CisJCQlzdHJ1Y3QgZHJt
X2RwX3ZjcGkgKnZjcGkgPSBtZ3ItPnByb3Bvc2VkX3ZjcGlzW2ldOworCQkJc3RydWN0IGRybV9k
cF9tc3RfcG9ydCAqcG9ydF92YWxpZGF0ZWQ7CisKKwkJCWlmICh2Y3BpKSB7CisJCQkJcG9ydF92
YWxpZGF0ZWQgPQorCQkJCQljb250YWluZXJfb2YodmNwaSwgc3RydWN0IGRybV9kcF9tc3RfcG9y
dCwgdmNwaSk7CisJCQkJcG9ydF92YWxpZGF0ZWQgPQorCQkJCQlkcm1fZHBfbXN0X3RvcG9sb2d5
X2dldF9wb3J0X3ZhbGlkYXRlZChtZ3IsIHBvcnRfdmFsaWRhdGVkKTsKKwkJCQlpZiAoIXBvcnRf
dmFsaWRhdGVkKSB7CisJCQkJCW11dGV4X2xvY2soJm1nci0+cGF5bG9hZF9sb2NrKTsKKwkJCQkJ
dmNwaS0+bnVtX3Nsb3RzID0gMDsKKwkJCQkJbXV0ZXhfdW5sb2NrKCZtZ3ItPnBheWxvYWRfbG9j
ayk7CisJCQkJfSBlbHNlIHsKKwkJCQkJZHJtX2RwX21zdF90b3BvbG9neV9wdXRfcG9ydChwb3J0
X3ZhbGlkYXRlZCk7CisJCQkJfQorCQkJfQorCQl9CisJfQorCiAJaWYgKHBvcnQtPmNvbm5lY3Rv
cikKIAkJZHJtX21vZGVzZXRfdW5sb2NrKCZtZ3ItPmJhc2UubG9jayk7CiAJZWxzZSBpZiAoY3Jl
YXRlX2Nvbm5lY3RvcikKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
