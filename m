Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AEC11004E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 15:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A046E79E;
	Tue,  3 Dec 2019 14:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690079.outbound.protection.outlook.com [40.107.69.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66276E7A3;
 Tue,  3 Dec 2019 14:35:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyc9fefcgWTLZgKnrvTKJwbY8bIlFkLUAKE7jzmDkYgexjeyVaAA3VcHJ9MDbl8c06ooL/MUOsOREnoXh+itp43cnxNdrZ57pTsNXrS4HBvPSQL8k5iFCc3RMSBNxasdIESSQrQh2LED8kxxMeemsPbyH40ERQ6/EFW+QBvdYeHEbyDl4M0aGiT6Bzs13Ia1T3v2POFMF8PoBrB8NYB3asSdqlEQbHkiI4deS5sYldWlAw3Cn3ApW9FVXK5Y/Jr0I9Tep++XT5sHEPPubkwyXSQV6qeLyTeT28CzSWPamOEQIH7bprACSNk1wtR+/efVoVYiUlUnQV/e+3gtvdu1Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UrE4Ew41tPsdhTMVp07HCIU5E5wsypTL/QnWHiCPHk=;
 b=Ms1J0LGNhtLQbzhOORl0BXQXwN5KatOUTjLlvI7mCfH05/Q0/feyZUY3S3TdMWUNUiAS0W+whzqPsZR1xEpwfW8JJGCOzFP/tMmjjP7BuBl0f4eYVucDI9lnguJhanhbo9R17jW3jD+MYRwjjW706F2IsfdMW/HnRpej8Eb4bEMTFGaxPKjy5Ug+TlyfxVYq8Tef4ZKZvzKh6sSEbgy243USBhSXTtLEK3VXVKgpU43yUblwKg5dZLz1baE0KoQes4oAPoe3wRO36AnngSDB5VdsX6bI7LCjuvWLXe0xBD5LkecmTgcekrsvR/yCv3xg0iW2DX8Xh4lHHI5Eq+nEeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0022.namprd12.prod.outlook.com (2603:10b6:5:1c0::35)
 by CY4PR12MB1479.namprd12.prod.outlook.com (2603:10b6:910:d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.21; Tue, 3 Dec
 2019 14:35:48 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::205) by DM6PR12CA0022.outlook.office365.com
 (2603:10b6:5:1c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 14:35:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Tue, 3 Dec 2019 14:35:48 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 08:35:45 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 08:35:45 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8 11/17] drm/dp_mst: Add DSC enablement helpers to DRM
Date: Tue, 3 Dec 2019 09:35:24 -0500
Message-ID: <20191203143530.27262-12-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203143530.27262-1-mikita.lipski@amd.com>
References: <20191203143530.27262-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(428003)(199004)(189003)(51416003)(7696005)(81156014)(81166006)(8676002)(50226002)(8936002)(86362001)(356004)(2616005)(478600001)(1076003)(16586007)(5660300002)(446003)(316002)(336012)(11346002)(426003)(54906003)(53416004)(2876002)(2906002)(70586007)(186003)(36756003)(6666004)(6916009)(26005)(70206006)(76176011)(50466002)(305945005)(4326008)(2351001)(14444005)(48376002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1479; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5d5cf5f-9441-4400-cb6b-08d777fe16a8
X-MS-TrafficTypeDiagnostic: CY4PR12MB1479:
X-Microsoft-Antispam-PRVS: <CY4PR12MB14797C17E6879143E2DA684EE4420@CY4PR12MB1479.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4qJIyZjFAXI596WPqygfxY7+EiHHFlVgOirTyONS7UboUYHz578/KP1mgEDePjSPclwAJGT+k6aTbEsDHKoaGqSUSaNB0AGOeDYaQoRqdPYgDJsxZODqFMX+oQb9t/piCcZaQJzGO8qgTt33yQ/Q4eUOBJhekNNKHKnmAmtNul0cidbI0cWhH3tp5qZznbkm8vWcp9G0AqSpMLsAm72wnBy8S4f668j8S/TrjT2ZY5/ak6wwQWocf6aGjIuGUIqdOMGrZknBVzhVRedJqDqOFhrH1rM8QG8Tx+T2GUxzr0qT/GALTyr/yvgBBleE9GKebKWBoNuZzyP8l45i9RaJKuq6NOc/jZK4nRR3ilM0Bl+jQXHe7yWc9tmLBQBJ9OwUbrmuZSG0pglZLjI3LqwcTQZpbFbTwdW+3aDlK675XnQAtHnlU7cdZb7eQ8cpdxT6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 14:35:48.0913 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d5cf5f-9441-4400-cb6b-08d777fe16a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1479
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UrE4Ew41tPsdhTMVp07HCIU5E5wsypTL/QnWHiCPHk=;
 b=PE7v/YYFNqfS314BajUwaBe8/PA/lkIHl4/a1Vuvfh9X5VvUl4HS8WPGewQ4pxS4Xc9P8WBsTc9SmpNGR8ZkMy2F92Y0K5+zpMdCVvWJCOVzHxKPZprpb/pYO8kSZSRQgfUvvZzcUnUJZNAx0K7vsSZ2lm3W3X4AqfHY0c7/aww=
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
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCA2MSArKysrKysrKysr
KysrKysrKysrKysrKysrKysKIGluY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggICAgICAg
fCAgNSArKysKIDIgZmlsZXMgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IGYxZDg4Mzk2MDgzMS4uNWU1NDlmNDhmZmI4IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTQ3NDIsNiArNDc0Miw2NyBA
QCBkcm1fZHBfbXN0X2F0b21pY19jaGVja190b3BvbG9neV9zdGF0ZShzdHJ1Y3QgZHJtX2RwX21z
dF90b3BvbG9neV9tZ3IgKm1nciwKIAlyZXR1cm4gMDsKIH0KIAorLyoqCisgKiBkcm1fZHBfbXN0
X2F0b21pY19lbmFibGVfZHNjIC0gU2V0IERTQyBFbmFibGUgRmxhZyB0byBPbi9PZmYKKyAqIEBz
dGF0ZTogUG9pbnRlciB0byB0aGUgbmV3IGRybV9hdG9taWNfc3RhdGUKKyAqIEBwb2ludGVyOiBQ
b2ludGVyIHRvIHRoZSBhZmZlY3RlZCBNU1QgUG9ydAorICogQHBibjogTmV3bHkgcmVjYWxjdWxh
dGVkIGJ3IHJlcXVpcmVkIGZvciBsaW5rIHdpdGggRFNDIGVuYWJsZWQKKyAqIEBwYm5fZGl2OiBE
aXZpZGVyIHRvIGNhbGN1bGF0ZSBjb3JyZWN0IG51bWJlciBvZiBwYm4gcGVyIHNsb3QKKyAqIEBl
bmFibGU6IEJvb2xlYW4gZmxhZyBlbmFibGluZyBvciBkaXNhYmxpbmcgRFNDIG9uIHRoZSBwb3J0
CisgKgorICogVGhpcyBmdW5jdGlvbiBlbmFibGVzIERTQyBvbiB0aGUgZ2l2ZW4gUG9ydAorICog
YnkgcmVjYWxjdWxhdGluZyBpdHMgdmNwaSBmcm9tIHBibiBwcm92aWRlZAorICogYW5kIHNldHMg
ZHNjX2VuYWJsZSBmbGFnIHRvIGtlZXAgdHJhY2sgb2Ygd2hpY2gKKyAqIHBvcnRzIGhhdmUgRFND
IGVuYWJsZWQKKyAqCisgKi8KK2ludCBkcm1fZHBfbXN0X2F0b21pY19lbmFibGVfZHNjKHN0cnVj
dCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKKwkJCQkgc3RydWN0IGRybV9kcF9tc3RfcG9ydCAq
cG9ydCwKKwkJCQkgaW50IHBibiwgaW50IHBibl9kaXYsCisJCQkJIGJvb2wgZW5hYmxlKQorewor
CXN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X3N0YXRlICptc3Rfc3RhdGU7CisJc3RydWN0IGRy
bV9kcF92Y3BpX2FsbG9jYXRpb24gKnBvczsKKwlib29sIGZvdW5kID0gZmFsc2U7CisJaW50IHZj
cGkgPSAwOworCisJbXN0X3N0YXRlID0gZHJtX2F0b21pY19nZXRfbXN0X3RvcG9sb2d5X3N0YXRl
KHN0YXRlLCBwb3J0LT5tZ3IpOworCisJaWYgKElTX0VSUihtc3Rfc3RhdGUpKQorCQlyZXR1cm4g
UFRSX0VSUihtc3Rfc3RhdGUpOworCisJbGlzdF9mb3JfZWFjaF9lbnRyeShwb3MsICZtc3Rfc3Rh
dGUtPnZjcGlzLCBuZXh0KSB7CisJCWlmIChwb3MtPnBvcnQgPT0gcG9ydCkgeworCQkJZm91bmQg
PSB0cnVlOworCQkJYnJlYWs7CisJCX0KKwl9CisKKwlpZiAoIWZvdW5kKSB7CisJCURSTV9ERUJV
R19BVE9NSUMoIltNU1QgUE9SVDolcF0gQ291bGRuJ3QgZmluZCBWQ1BJIGFsbG9jYXRpb24gaW4g
bXN0IHN0YXRlICVwXG4iLAorCQkJCSBwb3J0LCBtc3Rfc3RhdGUpOworCQlyZXR1cm4gLUVJTlZB
TDsKKwl9CisKKwlpZiAocG9zLT5kc2NfZW5hYmxlZCA9PSBlbmFibGUpIHsKKwkJRFJNX0RFQlVH
X0FUT01JQygiW01TVCBQT1JUOiVwXSBEU0MgZmxhZyBpcyBhbHJlYWR5IHNldCB0byAlZCwgcmV0
dXJuaW5nICVkIFZDUEkgc2xvdHNcbiIsCisJCQkJIHBvcnQsIGVuYWJsZSwgcG9zLT52Y3BpKTsK
KwkJdmNwaSA9IHBvcy0+dmNwaTsKKwl9CisKKwlpZiAoZW5hYmxlKSB7CisJCXZjcGkgPSBkcm1f
ZHBfYXRvbWljX2ZpbmRfdmNwaV9zbG90cyhzdGF0ZSwgcG9ydC0+bWdyLCBwb3J0LCBwYm4sIHBi
bl9kaXYpOworCQlEUk1fREVCVUdfQVRPTUlDKCJbTVNUIFBPUlQ6JXBdIEVuYWJsaW5nIERTQyBm
bGFnLCByZWFsbG9jYXRpbmcgJWQgVkNQSSBzbG90cyBvbiB0aGUgcG9ydFxuIiwKKwkJCQkgcG9y
dCwgdmNwaSk7CisJCWlmICh2Y3BpIDwgMCkKKwkJCXJldHVybiAtRUlOVkFMOworCX0KKworCXBv
cy0+ZHNjX2VuYWJsZWQgPSBlbmFibGU7CisKKwlyZXR1cm4gdmNwaTsKK30KK0VYUE9SVF9TWU1C
T0woZHJtX2RwX21zdF9hdG9taWNfZW5hYmxlX2RzYyk7CiAvKioKICAqIGRybV9kcF9tc3RfYXRv
bWljX2NoZWNrIC0gQ2hlY2sgdGhhdCB0aGUgbmV3IHN0YXRlIG9mIGFuIE1TVCB0b3BvbG9neSBp
biBhbgogICogYXRvbWljIHVwZGF0ZSBpcyB2YWxpZApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
ZHJtX2RwX21zdF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKaW5k
ZXggMGY4MTNkNjM0NmFhLi44MzBjOTRiN2Y0NWQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9kcF9tc3RfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaApA
QCAtNTAyLDYgKzUwMiw3IEBAIHN0cnVjdCBkcm1fZHBfcGF5bG9hZCB7CiBzdHJ1Y3QgZHJtX2Rw
X3ZjcGlfYWxsb2NhdGlvbiB7CiAJc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydDsKIAlpbnQg
dmNwaTsKKwlib29sIGRzY19lbmFibGVkOwogCXN0cnVjdCBsaXN0X2hlYWQgbmV4dDsKIH07CiAK
QEAgLTc3Myw2ICs3NzQsMTAgQEAgZHJtX2RwX2F0b21pY19maW5kX3ZjcGlfc2xvdHMoc3RydWN0
IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAogCQkJICAgICAgc3RydWN0IGRybV9kcF9tc3RfdG9w
b2xvZ3lfbWdyICptZ3IsCiAJCQkgICAgICBzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0LCBp
bnQgcGJuLAogCQkJICAgICAgaW50IHBibl9kaXYpOworaW50IGRybV9kcF9tc3RfYXRvbWljX2Vu
YWJsZV9kc2Moc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAorCQkJCSBzdHJ1Y3QgZHJt
X2RwX21zdF9wb3J0ICpwb3J0LAorCQkJCSBpbnQgcGJuLCBpbnQgcGJuX2RpdiwKKwkJCQkgYm9v
bCBlbmFibGUpOwogaW50IF9fbXVzdF9jaGVjawogZHJtX2RwX2F0b21pY19yZWxlYXNlX3ZjcGlf
c2xvdHMoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAogCQkJCSBzdHJ1Y3QgZHJtX2Rw
X21zdF90b3BvbG9neV9tZ3IgKm1nciwKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
