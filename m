Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0BA110066
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 15:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93556E819;
	Tue,  3 Dec 2019 14:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740088.outbound.protection.outlook.com [40.107.74.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2066E7A0;
 Tue,  3 Dec 2019 14:35:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+wE02OzXttIbY7ZOz1Xy2XXPQFlyiuiE9bwWRVWSlZzdmgoVquaRuQ1oOHSi/wD4g9F2aqR+4GVrB9SJOZ7P95ZYqfIqz7ZnSKHtNyEgVdhSDjf1psJdq4gnwyJfPTa1/aeBrNZj5bDgNuOxIi/Z5j3cDzpTnoUFSlEP8Bd20RgoLFrQziTH4q2H6F2xfHa2Z6HLxCnLrzupmmpr6w3bKC+kf+Ehu77ox01+42afNvn5jbJ+dtBVKoIvOGlQnLZVwEGlO7Hh4+2hnnhzgpKRmMikrmMOO0TSdXsW77jxZbmUDF43+8S5C1jZcCP1Texfj5UlbvjbsHWhkBkHs5x+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBHZI4ngQL7ZnoXHVu/gOOMk4xkpuzu7YtoJofm0Hek=;
 b=Mmrkn33cn0XOY9/LD2GfpDUD8KjbQ97v8SieHY1/GAW87ZhCesVcZUIJvchCaMFWBwZUKhCNWzEOnd5JTZtRGq4xdy8WglddVNBTbjf+VuaqxnJ3Y8eM9+Zhwdk2fWrnptZ2pEXPqNnzJ8SngBciN+rtS8L5GLj9m+WS8wtgHH+qNvntGeRTOw6mxRxd+dsyOh0IrK8/F4c1u+9W89I7zM5KVjlCz1bJHKFXe9Xe4Atqht2qdaFlZ62oqDumsGAQ6iMT0Qbu9YXoH7bC/pdBuzFCQgIVOGnPsRyCGdK4KzpU9NL1MyaqTgXMuW1k0EUMiCXlCcSAj9cm9KMsYRRT/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0022.namprd12.prod.outlook.com (2603:10b6:5:1c0::35)
 by BN6PR1201MB0082.namprd12.prod.outlook.com (2603:10b6:405:53::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.19; Tue, 3 Dec
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
 08:35:46 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 08:35:45 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8 12/17] drm/dp_mst: Add branch bandwidth validation to MST
 atomic check
Date: Tue, 3 Dec 2019 09:35:25 -0500
Message-ID: <20191203143530.27262-13-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203143530.27262-1-mikita.lipski@amd.com>
References: <20191203143530.27262-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(428003)(199004)(189003)(186003)(6916009)(336012)(54906003)(2876002)(2351001)(14444005)(8676002)(2906002)(16586007)(7696005)(5660300002)(53416004)(36756003)(81156014)(48376002)(356004)(6666004)(8936002)(81166006)(26005)(70206006)(70586007)(51416003)(50466002)(50226002)(305945005)(498600001)(4326008)(1076003)(446003)(76176011)(2616005)(86362001)(426003)(11346002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0082; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efd49ede-cf15-4649-81d3-08d777fe16ed
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0082:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB008211C4B6C597E285430AFFE4420@BN6PR1201MB0082.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:116;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sZBnmHxE+nu0g4jTJIFtX8YBqGMA5Fgj/+JvOjsBVkUJJBeHGWo9S1VHhAz08HGsNm9ymFPAJQpDui2g04FEvSXL4fChE0dpN4/625PhSk6abMxHMwmvuXdkB1fVzrUUtDwvJ9pIr/3dhw07sXIi+JoS/JCiNFhFXBSN5Ykr77/W08gmI62RpuCESfdYsyGwoIMSmP2Svoip3TjeRcHNZSNR3hyz+WdosoKs69xHJm9Cv7HoAUtYzBy7nVJI0LBgkeOeC++qNpYrEmJeLSASZdHpFLyAr4LNkK/MCIXbH+4kKtfEBtByJrkhMWj1wYhp66i67BuCQEPRy+oHgT/j7ITF6Vqu96Cjh+RUn7eB5661YlZwpEu5iBMIIGRUaO37wWqKqN/bRDu5L3J7hjaxtb0njLiErTb9wHhze2jBT19XNhkltw9cemzK+RoitxdX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 14:35:48.5436 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efd49ede-cf15-4649-81d3-08d777fe16ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0082
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBHZI4ngQL7ZnoXHVu/gOOMk4xkpuzu7YtoJofm0Hek=;
 b=Fvc1F77PIHCcHg2rJps4xfN0E13zMQNYjbiYJOeRDm8aJ1PKBhWrLX9pxOWv3YuzS2uSq2GSVS7KLIlTTgQRIfa+Dj00ZLoaOjSOipkKv+E+Bj9iKn2D++aTFi5rfGbwPyGOIcbz0oZHKCYSKKHNZSERaMFBiXArcBvtExZBqW8=
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
Cc: Jerry Zuo <Jerry.Zuo@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKQWRkaW5nIFBCTiBh
dHRyaWJ1dGUgdG8gZHJtX2RwX3ZjcGlfYWxsb2NhdGlvbiBzdHJ1Y3R1cmUgdG8Ka2VlcCB0cmFj
ayBvZiBob3cgbXVjaCBiYW5kd2lkdGggZWFjaCBQb3J0IHJlcXVpcmVzLgpBZGRpbmcgZHJtX2Rw
X21zdF9hdG9taWNfY2hlY2tfYndfbGltaXQgdG8gdmVyaWZ5IHRoYXQKc3RhdGUncyBiYW5kd2lk
dGggbmVlZHMgZG9lc24ndCBleGNlZWQgYXZhaWxhYmxlIGJhbmR3aWR0aC4KVGhlIGZ1bnRpb24g
aXMgY2FsbGVkIGluIGRybV9kcF9tc3RfYXRvbWljX2NoZWNrIGFmdGVyCmRybV9kcF9tc3RfYXRv
bWljX2NoZWNrX3RvcG9sb2d5X3N0YXRlIHRvIGZ1bGx5IHZlcmlmeSB0aGF0CnRoZSBwcm9wb3Nl
ZCB0b3BvbG9neSBpcyBzdXBwb3J0ZWQuCgpDYzogSmVycnkgWnVvIDxKZXJyeS5adW9AYW1kLmNv
bT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogTHl1ZGUg
UGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogTWlraXRhIExpcHNraSA8bWlr
aXRhLmxpcHNraUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMgfCA2NyArKysrKysrKysrKysrKysrKysrKysrKysrKy0KIGluY2x1ZGUvZHJtL2RybV9k
cF9tc3RfaGVscGVyLmggICAgICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMK
aW5kZXggNWU1NDlmNDhmZmI4Li43NmJjYmI0Y2Q4YjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9t
c3RfdG9wb2xvZ3kuYwpAQCAtNDA1Miw3ICs0MDUyLDcgQEAgaW50IGRybV9kcF9hdG9taWNfZmlu
ZF92Y3BpX3Nsb3RzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIHsKIAlzdHJ1Y3Qg
ZHJtX2RwX21zdF90b3BvbG9neV9zdGF0ZSAqdG9wb2xvZ3lfc3RhdGU7CiAJc3RydWN0IGRybV9k
cF92Y3BpX2FsbG9jYXRpb24gKnBvcywgKnZjcGkgPSBOVUxMOwotCWludCBwcmV2X3Nsb3RzLCBy
ZXFfc2xvdHM7CisJaW50IHByZXZfc2xvdHMsIHByZXZfYncsIHJlcV9zbG90cywgcmV0OwogCiAJ
dG9wb2xvZ3lfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9tc3RfdG9wb2xvZ3lfc3RhdGUoc3RhdGUs
IG1ncik7CiAJaWYgKElTX0VSUih0b3BvbG9neV9zdGF0ZSkpCkBAIC00MDYzLDYgKzQwNjMsNyBA
QCBpbnQgZHJtX2RwX2F0b21pY19maW5kX3ZjcGlfc2xvdHMoc3RydWN0IGRybV9hdG9taWNfc3Rh
dGUgKnN0YXRlLAogCQlpZiAocG9zLT5wb3J0ID09IHBvcnQpIHsKIAkJCXZjcGkgPSBwb3M7CiAJ
CQlwcmV2X3Nsb3RzID0gdmNwaS0+dmNwaTsKKwkJCXByZXZfYncgPSB2Y3BpLT5wYm47CiAKIAkJ
CS8qCiAJCQkgKiBUaGlzIHNob3VsZCBuZXZlciBoYXBwZW4sIHVubGVzcyB0aGUgZHJpdmVyIHRy
aWVzCkBAIC00MDc4LDggKzQwNzksMTAgQEAgaW50IGRybV9kcF9hdG9taWNfZmluZF92Y3BpX3Ns
b3RzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIAkJCWJyZWFrOwogCQl9CiAJfQot
CWlmICghdmNwaSkKKwlpZiAoIXZjcGkpIHsKIAkJcHJldl9zbG90cyA9IDA7CisJCXByZXZfYncg
PSAwOworCX0KIAogCWlmIChwYm5fZGl2IDw9IDApCiAJCXBibl9kaXYgPSBtZ3ItPnBibl9kaXY7
CkBAIC00MDg5LDYgKzQwOTIsOSBAQCBpbnQgZHJtX2RwX2F0b21pY19maW5kX3ZjcGlfc2xvdHMo
c3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAogCURSTV9ERUJVR19BVE9NSUMoIltDT05O
RUNUT1I6JWQ6JXNdIFtNU1QgUE9SVDolcF0gVkNQSSAlZCAtPiAlZFxuIiwKIAkJCSBwb3J0LT5j
b25uZWN0b3ItPmJhc2UuaWQsIHBvcnQtPmNvbm5lY3Rvci0+bmFtZSwKIAkJCSBwb3J0LCBwcmV2
X3Nsb3RzLCByZXFfc2xvdHMpOworCURSTV9ERUJVR19BVE9NSUMoIltDT05ORUNUT1I6JWQ6JXNd
IFtNU1QgUE9SVDolcF0gUEJOICVkIC0+ICVkXG4iLAorCQkJIHBvcnQtPmNvbm5lY3Rvci0+YmFz
ZS5pZCwgcG9ydC0+Y29ubmVjdG9yLT5uYW1lLAorCQkJIHBvcnQsIHByZXZfYncsIHBibik7CiAK
IAkvKiBBZGQgdGhlIG5ldyBhbGxvY2F0aW9uIHRvIHRoZSBzdGF0ZSAqLwogCWlmICghdmNwaSkg
ewpAQCAtNDEwMSw2ICs0MTA3LDcgQEAgaW50IGRybV9kcF9hdG9taWNfZmluZF92Y3BpX3Nsb3Rz
KHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIAkJbGlzdF9hZGQoJnZjcGktPm5leHQs
ICZ0b3BvbG9neV9zdGF0ZS0+dmNwaXMpOwogCX0KIAl2Y3BpLT52Y3BpID0gcmVxX3Nsb3RzOwor
CXZjcGktPnBibiA9IHBibjsKIAogCXJldHVybiByZXFfc2xvdHM7CiB9CkBAIC00NzAzLDYgKzQ3
MTAsNTkgQEAgc3RhdGljIHZvaWQgZHJtX2RwX21zdF9kZXN0cm95X3N0YXRlKHN0cnVjdCBkcm1f
cHJpdmF0ZV9vYmogKm9iaiwKIAlrZnJlZShtc3Rfc3RhdGUpOwogfQogCitzdGF0aWMgYm9vbCBk
cm1fZHBfbXN0X3BvcnRfZG93bnN0cmVhbV9vZl9icmFuY2goc3RydWN0IGRybV9kcF9tc3RfcG9y
dCAqcG9ydCwKKwkJCQkJCSBzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKmJyYW5jaCkKK3sKKwl3
aGlsZSAocG9ydC0+cGFyZW50KSB7CisJCWlmIChwb3J0LT5wYXJlbnQgPT0gYnJhbmNoKQorCQkJ
cmV0dXJuIHRydWU7CisKKwkJaWYgKHBvcnQtPnBhcmVudC0+cG9ydF9wYXJlbnQpCisJCQlwb3J0
ID0gcG9ydC0+cGFyZW50LT5wb3J0X3BhcmVudDsKKwkJZWxzZQorCQkJYnJlYWs7CisJfQorCXJl
dHVybiBmYWxzZTsKK30KKworc3RhdGljIGlubGluZQoraW50IGRybV9kcF9tc3RfYXRvbWljX2No
ZWNrX2J3X2xpbWl0KHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqYnJhbmNoLAorCQkJCSAgICAg
c3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfc3RhdGUgKm1zdF9zdGF0ZSkKK3sKKwlzdHJ1Y3Qg
ZHJtX2RwX21zdF9wb3J0ICpwb3J0OworCXN0cnVjdCBkcm1fZHBfdmNwaV9hbGxvY2F0aW9uICp2
Y3BpOworCWludCBwYm5fbGltaXQgPSAwLCBwYm5fdXNlZCA9IDA7CisKKwlsaXN0X2Zvcl9lYWNo
X2VudHJ5KHBvcnQsICZicmFuY2gtPnBvcnRzLCBuZXh0KSB7CisJCWlmIChwb3J0LT5tc3RiKSB7
CisJCQlpZiAoZHJtX2RwX21zdF9hdG9taWNfY2hlY2tfYndfbGltaXQocG9ydC0+bXN0YiwgbXN0
X3N0YXRlKSkKKwkJCQlyZXR1cm4gLUVJTlZBTDsKKwkJfQorCQlpZiAocG9ydC0+YXZhaWxhYmxl
X3BibiA+IDApCisJCQlwYm5fbGltaXQgPSBwb3J0LT5hdmFpbGFibGVfcGJuOworCX0KKwlEUk1f
REVCVUdfQVRPTUlDKCJbTVNUIEJSQU5DSDolcF0gYnJhbmNoIGhhcyAlZCBQQk4gYXZhaWxhYmxl
XG4iLAorCQkJCQkgYnJhbmNoLAorCQkJCQkgcGJuX2xpbWl0KTsKKworCWxpc3RfZm9yX2VhY2hf
ZW50cnkodmNwaSwgJm1zdF9zdGF0ZS0+dmNwaXMsIG5leHQpIHsKKwkJaWYgKCF2Y3BpLT5wYm4p
CisJCQljb250aW51ZTsKKworCQlpZiAoZHJtX2RwX21zdF9wb3J0X2Rvd25zdHJlYW1fb2ZfYnJh
bmNoKHZjcGktPnBvcnQsIGJyYW5jaCkpCisJCQlwYm5fdXNlZCArPSB2Y3BpLT5wYm47CisJfQor
CURSTV9ERUJVR19BVE9NSUMoIltNU1QgQlJBTkNIOiVwXSBicmFuY2ggdXNlZCAlZCBQQk5cbiIs
CisJCQkgYnJhbmNoLAorCQkJIHBibl91c2VkKTsKKwlpZiAocGJuX3VzZWQgPiBwYm5fbGltaXQp
IHsKKwkJRFJNX0RFQlVHX0FUT01JQygiW01TVCBCUkFOQ0g6JXBdIE5vIGF2YWlsYWJsZSBiYW5k
d2lkdGhcbiIsCisJCQkJIGJyYW5jaCk7CisJCXJldHVybiAtRUlOVkFMOworCX0KKwlyZXR1cm4g
MDsKK30KKwogc3RhdGljIGlubGluZSBpbnQKIGRybV9kcF9tc3RfYXRvbWljX2NoZWNrX3RvcG9s
b2d5X3N0YXRlKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAogCQkJCSAgICAg
ICBzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9zdGF0ZSAqbXN0X3N0YXRlKQpAQCAtNDgzNCw2
ICs0ODk0LDkgQEAgaW50IGRybV9kcF9tc3RfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fYXRvbWlj
X3N0YXRlICpzdGF0ZSkKIAkJcmV0ID0gZHJtX2RwX21zdF9hdG9taWNfY2hlY2tfdG9wb2xvZ3lf
c3RhdGUobWdyLCBtc3Rfc3RhdGUpOwogCQlpZiAocmV0KQogCQkJYnJlYWs7CisJCXJldCA9IGRy
bV9kcF9tc3RfYXRvbWljX2NoZWNrX2J3X2xpbWl0KG1nci0+bXN0X3ByaW1hcnksIG1zdF9zdGF0
ZSk7CisJCWlmIChyZXQpCisJCQlicmVhazsKIAl9CiAKIAlyZXR1cm4gcmV0OwpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9t
c3RfaGVscGVyLmgKaW5kZXggODMwYzk0YjdmNDVkLi4yOTE5ZDk3NzZhZjMgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Rw
X21zdF9oZWxwZXIuaApAQCAtNTAyLDYgKzUwMiw3IEBAIHN0cnVjdCBkcm1fZHBfcGF5bG9hZCB7
CiBzdHJ1Y3QgZHJtX2RwX3ZjcGlfYWxsb2NhdGlvbiB7CiAJc3RydWN0IGRybV9kcF9tc3RfcG9y
dCAqcG9ydDsKIAlpbnQgdmNwaTsKKwlpbnQgcGJuOwogCWJvb2wgZHNjX2VuYWJsZWQ7CiAJc3Ry
dWN0IGxpc3RfaGVhZCBuZXh0OwogfTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
