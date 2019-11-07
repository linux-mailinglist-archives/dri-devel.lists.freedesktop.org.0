Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF95F333C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D2C6F716;
	Thu,  7 Nov 2019 15:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820089.outbound.protection.outlook.com [40.107.82.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E48F6F705;
 Thu,  7 Nov 2019 15:32:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVhYQdtDpiGTLxSQxO9mrfgXFM/9ibyyVXP310gnHHB43ni/NP3YHrgXrszVZLxZ+G3Zq8rlD5F5Steb3+gFG5CVtN0PEOZnt3WPeaGGjBF4MKWd5fi6VWFYSGb4T17asHnbFpC/p+aDjyN3hG4Z4u/1eMp5iwiQhS5Aeu40JG/7jfnxQZagvhWw/RDLD2Pgm6lN8tGPOWmPK9veVHxGHPruB0XVgji9KhybiM8GiknV6wk4CCZtWPvJWqQie/aO/umPpV4vVK1d2yzKvE+wdFOT41f+q3qMPr7rgQxSZZTfaT+tVMHyATmlj9W8cVb4FUAMWiiTbMdWoYTtxjySng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LB+7Yu/a/hqjAX3Pdl9lX4Hkq8VwR17k62KPaquM8zk=;
 b=mAlc+JuQbzzIEt4JTTmGCUUn8YbSaU+/vla5jy36nw9F3m59lNKXt6gKoYD0UPIv2vVN9BH5GbJI1Ylgqn8U50XdN1FvKPZUuYJEiZikjB8ODpKKSoCW37mxQCw8gnlMs1bmMucxAByTb72uuGR5Egup6djlUxFZb9SxbQfK2KwBvKRWIpIyW5xvmmtyfXcc+RqHKrfHQzHc+6sjqU02una4VwmIpobhiZfBYDXz1I2LQrnm0DikeycyTTLoDtVcXs6qwjAfJsFksY+4GiR1nm+omx0Wb8PrmSsvZRYWC7X2oXEbH3HZf6dsQRYteVtrpDPDWL16xoxyng3bWo0+gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0016.namprd12.prod.outlook.com (2603:10b6:4:1::26) by
 BYAPR12MB3512.namprd12.prod.outlook.com (2603:10b6:a03:134::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.24; Thu, 7 Nov
 2019 15:32:28 +0000
Received: from DM3NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by DM5PR12CA0016.outlook.office365.com
 (2603:10b6:4:1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22 via Frontend
 Transport; Thu, 7 Nov 2019 15:32:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM3NAM03FT049.mail.protection.outlook.com (10.152.83.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2430.20 via Frontend Transport; Thu, 7 Nov 2019 15:32:28 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 7 Nov 2019
 09:32:26 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 7 Nov 2019 09:32:26 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 10/13] drm/dp_mst: Add DSC enablement helpers to DRM
Date: Thu, 7 Nov 2019 10:32:09 -0500
Message-ID: <20191107153212.1145-11-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107153212.1145-1-mikita.lipski@amd.com>
References: <20191107153212.1145-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(428003)(189003)(199004)(446003)(2906002)(51416003)(81156014)(1076003)(81166006)(86362001)(478600001)(426003)(16586007)(7696005)(76176011)(50226002)(5660300002)(70586007)(70206006)(53416004)(4326008)(6916009)(26005)(36756003)(47776003)(2876002)(186003)(2351001)(8676002)(336012)(48376002)(50466002)(8936002)(6666004)(356004)(305945005)(54906003)(316002)(2616005)(476003)(126002)(11346002)(14444005)(486006)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3512; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 425f2adf-0957-44ed-8844-08d76397b2d4
X-MS-TrafficTypeDiagnostic: BYAPR12MB3512:
X-Microsoft-Antispam-PRVS: <BYAPR12MB351221658220755D082C122CE4780@BYAPR12MB3512.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 0214EB3F68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jjxnQQhOYeIsv2AfJIP/3AO9IqVj/j7mlDnUnHy7rXr2QW1kts7h238b+WTxr/3lchJShDx496nn1zopa/bYBd8LoTkl/UbZwXLz+8SG8A53Bie90hfBHSAfQtvF2Vd465R9SAsmMz5ZAMmCtrJkaQe6VQ9MFiPlBWwV7KsmyRW3EbmMRmHtUbRcnnQ/p1fnE2+lctshg+z48RSl//K+Clvi7rwtIrJN443+Fdabf+COAxd0k9l/emO0fh1z/TgOO0QYBKLknDP+Ii9FoI4GDndB0EtQb7C0WdQWuMaMgpe8LgeHY0W2lQaV/AGuZ5Tftv4b1DwrsV0ETQozI8JnM1j5uBNf+L7SJemKLkw2VDGyTk5eX6HFpHBqQKX9yy34ziD9cj2vO4Vmxs305CFsWVMRY3DQPUzqNnGsCvLWjp37e56Ljulh48/1QsepndKD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 15:32:28.6758 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 425f2adf-0957-44ed-8844-08d76397b2d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3512
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LB+7Yu/a/hqjAX3Pdl9lX4Hkq8VwR17k62KPaquM8zk=;
 b=ybXVBFjzYe6CQ0BZxIL9c/wDEDGHF0TR3i9ZUFRHBoYbA6ezcgDy3V2JsgVOKCS+KrgsrCK9Wfwg+VPA4k7oz87INiXKyAkMmGz6u68CIuEJBTqRRsEK7eqlze78dU7hf7QtWStTLbUhyVImvPz8A9Ku0iUrgu0c6T2Dmpk5vYg=
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKQWRkaW5nIGEgaGVs
cGVyIGZ1bmN0aW9uIHRvIGJlIGNhbGxlZCBieQpkcml2ZXJzIG91dHNpZGUgb2YgRFJNIHRvIGVu
YWJsZSBEU0Mgb24KdGhlIE1TVCBwb3J0cy4KCkZ1bmN0aW9uIGlzIGNhbGxlZCB0byByZWNhbGN1
bGF0ZSBWQ1BJIGFsbG9jYXRpb24KaWYgRFNDIGlzIGVuYWJsZWQgYW5kIHJhaXNlIHRoZSBEU0Mg
ZmxhZyB0byBlbmFibGUuCkluIGNhc2Ugb2YgZGlzYWJsaW5nIERTQyB0aGUgZmxhZyBpcyBzZXQg
dG8gZmFsc2UKYW5kIHJlY2FsY3VsYXRpb24gb2YgVkNQSSBzbG90cyBpcyBleHBlY3RlZCB0byBi
ZSBkb25lCmluIGVuY29kZXIncyBhdG9taWNfY2hlY2suCgp2Mjogc3F1YXNoIHNlcGFyYXRlIGZ1
bmN0aW9ucyBpbnRvIG9uZSBhbmQgY2FsbCBpdCBwZXIKcG9ydAoKQ2M6IEhhcnJ5IFdlbnRsYW5k
IDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNv
bT4KU2lnbmVkLW9mZi1ieTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCA3NiArKysrKysrKysr
KysrKysrKysrKysrKysrKysKIGluY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggICAgICAg
fCAgNSArKwogMiBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5kZXggZDVkZjAyMzE1ZTE0Li44NmUyMGRiZjNjY2UgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwpAQCAtMzg3MSw2ICszODcxLDgyIEBA
IGRybV9kcF9tc3RfYXRvbWljX2NoZWNrX3RvcG9sb2d5X3N0YXRlKHN0cnVjdCBkcm1fZHBfbXN0
X3RvcG9sb2d5X21nciAqbWdyLAogCXJldHVybiAwOwogfQogCisvKioKKyAqIGRybV9kcF9tc3Rf
YXRvbWljX2VuYWJsZV9kc2MgLSBTZXQgRFNDIEVuYWJsZSBGbGFnIHRvIE9uL09mZgorICogQHN0
YXRlOiBQb2ludGVyIHRvIHRoZSBuZXcgJnN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X3N0YXRl
CisgKiBAcG9pbnRlcjogUG9pbnRlciB0byB0aGUgYWZmZWN0ZWQgTVNUIFBvcnQKKyAqIEBwYm46
IE5ld2x5IHJlY2FsY3VsYXRlZCBidyByZXF1aXJlZCBmb3IgbGluayB3aXRoIERTQyBlbmFibGVk
CisgKiBAZW5hYmxlOiBCb29sZWFuIGZsYWcgZW5hYmxpbmcgb3IgZGlzYWJsaW5nIERTQyBvbiB0
aGUgcG9ydAorICoKKyAqIFRoaXMgZnVuY3Rpb24gZW5hYmxlcyBEU0Mgb24gdGhlIGdpdmVuIFBv
cnQKKyAqIGJ5IHJlY2FsY3VsYXRpbmcgaXRzIHZjcGkgZnJvbSBwYm4gcHJvdmlkZWQKKyAqIGFu
ZCBzZXRzIGRzY19lbmFibGUgZmxhZyB0byBrZWVwIHRyYWNrIG9mIHdoaWNoCisgKiBwb3J0cyBo
YXZlIERTQyBlbmFibGVkCisgKgorICogU2VlIGFsc286CisgKiBkcm1fZHBfaGVscGVyX3VwZGF0
ZV92Y3BpX3Nsb3RzX2Zvcl9kc2MoKQorICovCitpbnQgZHJtX2RwX21zdF9hdG9taWNfZW5hYmxl
X2RzYyhzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsCisJCQkJIHN0cnVjdCBkcm1fZHBf
bXN0X3BvcnQgKnBvcnQsCisJCQkJIGludCBwYm4sCisJCQkJIGJvb2wgZW5hYmxlKQoreworCXN0
cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X3N0YXRlICptc3Rfc3RhdGU7CisJc3RydWN0IGRybV9k
cF92Y3BpX2FsbG9jYXRpb24gKnBvczsKKwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29u
bl9zdGF0ZTsKKwlzdHJ1Y3QgZHJtX2NydGMgKmNydGM7CisJc3RydWN0IGRybV9jcnRjX3N0YXRl
ICpjcnRjX3N0YXRlOworCWJvb2wgZm91bmQgPSBmYWxzZTsKKwlpbnQgdmNwaSA9IDA7CisKKwlt
c3Rfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9tc3RfdG9wb2xvZ3lfc3RhdGUoc3RhdGUsIHBvcnQt
Pm1ncik7CisKKwlpZiAoSVNfRVJSKG1zdF9zdGF0ZSkpCisJCXJldHVybiBQVFJfRVJSKG1zdF9z
dGF0ZSk7CisKKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KHBvcywgJm1zdF9zdGF0ZS0+dmNwaXMsIG5l
eHQpIHsKKwkJaWYgKHBvcy0+cG9ydCA9PSBwb3J0KSB7CisJCQlmb3VuZCA9IHRydWU7CisJCQli
cmVhazsKKwkJfQorCX0KKworCWlmICghZm91bmQpCisJCXJldHVybiAtRUlOVkFMOworCisJaWYg
KHBvcy0+ZHNjX2VuYWJsZWQgPT0gZW5hYmxlKQorCQlyZXR1cm4gMDsKKworCWlmIChlbmFibGUp
IHsKKwkJdmNwaSA9IGRybV9kcF9hdG9taWNfZmluZF92Y3BpX3Nsb3RzKHN0YXRlLCBwb3J0LT5t
Z3IsIHBvcnQsIHBibik7CisKKwkJaWYgKHZjcGkgPCAwKQorCQkJcmV0dXJuIC1FSU5WQUw7CisJ
fQorCisJcG9zLT5kc2NfZW5hYmxlZCA9IGVuYWJsZTsKKworCWNvbm5fc3RhdGUgPSBkcm1fYXRv
bWljX2dldF9jb25uZWN0b3Jfc3RhdGUobXN0X3N0YXRlLT5iYXNlLnN0YXRlLAorCQkJCQkJICAg
IHBvcnQtPmNvbm5lY3Rvcik7CisKKwlpZiAoSVNfRVJSKGNvbm5fc3RhdGUpKQorCQlyZXR1cm4g
UFRSX0VSUihjb25uX3N0YXRlKTsKKworCWNydGMgPSBjb25uX3N0YXRlLT5jcnRjOworCisJaWYg
KCFjcnRjKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCWNydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dl
dF9jcnRjX3N0YXRlKG1zdF9zdGF0ZS0+YmFzZS5zdGF0ZSwgY3J0Yyk7CisKKwlpZiAoSVNfRVJS
KGNydGNfc3RhdGUpKQorCQlyZXR1cm4gUFRSX0VSUihjcnRjX3N0YXRlKTsKKworCWNydGNfc3Rh
dGUtPm1vZGVfY2hhbmdlZCA9IHRydWU7CisKKwlyZXR1cm4gdmNwaTsKK30KK0VYUE9SVF9TWU1C
T0woZHJtX2RwX21zdF9hdG9taWNfZW5hYmxlX2RzYyk7CiAvKioKICAqIGRybV9kcF9tc3RfYXRv
bWljX2NoZWNrIC0gQ2hlY2sgdGhhdCB0aGUgbmV3IHN0YXRlIG9mIGFuIE1TVCB0b3BvbG9neSBp
biBhbgogICogYXRvbWljIHVwZGF0ZSBpcyB2YWxpZApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
ZHJtX2RwX21zdF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKaW5k
ZXggNGNmNzM4NTQ1ZGZiLi4wYTlhZWQxYzAwZmYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9kcF9tc3RfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaApA
QCAtNDMxLDYgKzQzMSw3IEBAIHN0cnVjdCBkcm1fZHBfcGF5bG9hZCB7CiBzdHJ1Y3QgZHJtX2Rw
X3ZjcGlfYWxsb2NhdGlvbiB7CiAJc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydDsKIAlpbnQg
dmNwaTsKKwlib29sIGRzY19lbmFibGVkOwogCXN0cnVjdCBsaXN0X2hlYWQgbmV4dDsKIH07CiAK
QEAgLTY2Miw2ICs2NjMsMTAgQEAgaW50IF9fbXVzdF9jaGVjawogZHJtX2RwX2F0b21pY19maW5k
X3ZjcGlfc2xvdHMoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAogCQkJICAgICAgc3Ry
dWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCiAJCQkgICAgICBzdHJ1Y3QgZHJtX2Rw
X21zdF9wb3J0ICpwb3J0LCBpbnQgcGJuKTsKK2ludCBkcm1fZHBfbXN0X2F0b21pY19lbmFibGVf
ZHNjKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKKwkJCQkgc3RydWN0IGRybV9kcF9t
c3RfcG9ydCAqcG9ydCwKKwkJCQkgaW50IHBibiwKKwkJCQkgYm9vbCBlbmFibGUpOwogaW50IF9f
bXVzdF9jaGVjawogZHJtX2RwX2F0b21pY19yZWxlYXNlX3ZjcGlfc2xvdHMoc3RydWN0IGRybV9h
dG9taWNfc3RhdGUgKnN0YXRlLAogCQkJCSBzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3Ig
Km1nciwKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
