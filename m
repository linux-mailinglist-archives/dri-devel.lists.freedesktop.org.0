Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA7CFF601
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 23:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0636E243;
	Sat, 16 Nov 2019 22:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820075.outbound.protection.outlook.com [40.107.82.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEA06E054;
 Sat, 16 Nov 2019 22:01:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPnfzhjIKq0nGgDhvRU7rvaBxV7tC3QzYbN6o6RRsppFbV0Pmm+cse8A00124Xt9a7sKix6ibdb7I+agMqzjg17k8KBE9zG9p7ix4Jg1XQOlNZEHt4cQ7zOaOw8Cibu/3++e623Bc71Qr1LHvhN0NRGdmijsAkF/tvIWS72qjm44eE19R4SI4zGh3zytqI5TcBhymgaNVzwJO01TJz9booCwTuFN/idhK9+L1aKtSKEzy6c0nb2HYd5zjYCpyxgBZHLoGMmV4OY1vFmishgOzX4NyhZ/Ea8c2HYS1TEeZt0HF8YTB+0hRMeKBXSxO7+MIc/2VEOZrYgyB/CYwNyU0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92XcHgcBCZHYmmGQ7bNK4TAWpclLn+1qX91J9OSj9Bw=;
 b=RVP2bM06lqJy+W9Cq2rfZ86R0YuF4SA0I5H3365nqqbTicrBxvROhPdcxE4qNGDQd/G9TOxy2rC5GFm3/34iJZ5ud8WZ+j9SiY5jrlYtI/Q6D1IBgngkcz2/B4PT6B1WSJziidBEOwFuFnSgJevNEKEw/qCZxImruQhddVvIWjm1vPE1Lu0ok6QDSHUzxVGgbdAKBA11kBiWuAYonktLekyYkBLU29PivmwD/SefkbnJlo+2dJjBx+ANLibNE/dVfzx2qbHnbx0Xn2DmV4cE4Fz7Lx2Ie+yOf6E47NtAQb87fotGlE0d+MDCL71tWFMI87PvqkFjwljZUzL1wrqO3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0017.namprd12.prod.outlook.com
 (2603:10b6:910:16::27) by BN6PR12MB1443.namprd12.prod.outlook.com
 (2603:10b6:405:e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.27; Sat, 16 Nov
 2019 22:01:44 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::200) by CY4PR1201CA0017.outlook.office365.com
 (2603:10b6:910:16::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Sat, 16 Nov 2019 22:01:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Sat, 16 Nov 2019 22:01:43 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:40 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sat, 16 Nov 2019 16:01:39 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v7 16/17] drm/amd/display: Recalculate VCPI slots for new DSC
 connectors
Date: Sat, 16 Nov 2019 17:01:27 -0500
Message-ID: <20191116220128.16598-17-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191116220128.16598-1-mikita.lipski@amd.com>
References: <20191116220128.16598-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(428003)(189003)(199004)(4326008)(6916009)(426003)(14444005)(47776003)(2351001)(50226002)(8936002)(1076003)(53416004)(81156014)(51416003)(7696005)(76176011)(81166006)(8676002)(86362001)(5660300002)(26005)(476003)(126002)(356004)(186003)(2876002)(316002)(336012)(446003)(11346002)(54906003)(50466002)(70586007)(70206006)(478600001)(48376002)(16586007)(2616005)(2906002)(36756003)(486006)(305945005)(6666004)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1443; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75598559-d6d8-4e7e-fd67-08d76ae09164
X-MS-TrafficTypeDiagnostic: BN6PR12MB1443:
X-Microsoft-Antispam-PRVS: <BN6PR12MB14432199F4C304EA2608BA9AE4730@BN6PR12MB1443.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 02234DBFF6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WYNfAimuWKGFuR9EbVNkX8u/bi72UttFB/KModJtMyldvUvVwDmYL78JrAXciLx+MOy+Fa0MsLidey1G5B+o7NTbvbRqNvRcebj7+bPANO2BiTLc3AuSOeTp2kGMFmaJ7U+GiaW+CByNCGsbE8KkeljyHs5SD9RDV6tka3cAQSMVz4aSM6gIHkfY7r/JY/yS18hZmgA8ZDAMSsN/sgM6Q68MLJaqHxAfeZi1IqLc9oYfudR6ud0mqeA3ZwGtQhJr9O+nJdnqSqqx7gwzEcuEewXsyS1zloqx3Z1+7qdpjNROtEiCVbi+bT2GJTol80JVZiFh8jzDAPEkMHyqNFn60jVV0CJFsHCBHoFKEqYpA+NBghabIGlXXZi2KqUq9MaeEiQBl+jGSnP9aQczAgRS2VzTUDFL44iQiAhpbARJEqGLD4QBP04k5t+CmuXGlM5V
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2019 22:01:43.9156 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75598559-d6d8-4e7e-fd67-08d76ae09164
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1443
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92XcHgcBCZHYmmGQ7bNK4TAWpclLn+1qX91J9OSj9Bw=;
 b=eaf0RCgoV1rREbc8BIMgxY55zLnmJZGWuXI/Hs3f1Km8YQmmUowLDlThDPOiDs/UgmX6bbXFs1ysdazr5roXgUIBFzkTj9BoNtRfzHKFt7P6Q88UCRTI7YTnAnv9MgFvRrHLBm8/xhZUst+g52zFkcBTxZ7oVazhhIY0108qx1I=
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

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKW3doeV0KU2luY2Ug
Zm9yIERTQyBNU1QgY29ubmVjdG9yJ3MgUEJOIGlzIGNsYWN1bGF0ZWQgZGlmZmVyZW50bHkKZHVl
IHRvIGNvbXByZXNzaW9uLCB3ZSBoYXZlIHRvIHJlY2FsY3VsYXRlIGJvdGggUEJOIGFuZApWQ1BJ
IHNsb3RzIGZvciB0aGF0IGNvbm5lY3Rvci4KCltob3ddClRoZSBmdW5jdGlvbiBpdGVyYXRlcyB0
aHJvdWdoIGFsbCB0aGUgYWN0aXZlIHN0cmVhbXMgdG8KZmluZCwgd2hpY2ggaGF2ZSBEU0MgZW5h
YmxlZCwgdGhlbiByZWNhbGN1bGF0ZXMgUEJOIGZvcgppdCBhbmQgY2FsbHMgZHJtX2RwX2hlbHBl
cl91cGRhdGVfdmNwaV9zbG90c19mb3JfZHNjIHRvCnVwZGF0ZSBjb25uZWN0b3IncyBWQ1BJIHNs
b3RzLgoKdjI6IC0gdXNlIGRybV9kcF9tc3RfYXRvbWljX2VuYWJsZV9kc2MgcGVyIHBvcnQgdG8K
ZW5hYmxlL2Rpc2FibGUgRFNDCgp2MzogLSBJdGVyYXRlIHRocm91Z2ggY29ubmVjdG9yIHN0YXRl
cyBmcm9tIHRoZSBzdGF0ZSBwYXNzZWQKICAgIC0gT24gZWFjaCBjb25uZWN0b3Igc3RhdGUgZ2V0
IHN0cmVhbSBmcm9tIGRjX3N0YXRlLAppbnN0ZWFkIENSVEMgc3RhdGUKCkNjOiBKZXJyeSBadW8g
PEplcnJ5Llp1b0BhbWQuY29tPgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFt
ZC5jb20+CkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBN
aWtpdGEgTGlwc2tpIDxtaWtpdGEubGlwc2tpQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgNzYgKysrKysrKysrKysrKysrKystLQog
MSBmaWxlIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXgg
N2Q4ZTI0NGU1MjEwLi40YmU2NjIxMDg4ZDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtNDk4Niw2ICs0OTg2LDY5IEBAIGNv
bnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9oZWxwZXJfZnVuY3MgYW1kZ3B1X2RtX2VuY29kZXJfaGVs
cGVyX2Z1bmNzID0gewogCS5hdG9taWNfY2hlY2sgPSBkbV9lbmNvZGVyX2hlbHBlcl9hdG9taWNf
Y2hlY2sKIH07CiAKK3N0YXRpYyBpbnQgZG1fdXBkYXRlX21zdF92Y3BpX3Nsb3RzX2Zvcl9kc2Mo
c3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAorCQkJCQkgICAgc3RydWN0IGRjX3N0YXRl
ICpkY19zdGF0ZSkKK3sKKwlzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpzdHJlYW0gPSBOVUxMOwor
CXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3I7CisJc3RydWN0IGRybV9jb25uZWN0b3Jf
c3RhdGUgKm5ld19jb25fc3RhdGUsICpvbGRfY29uX3N0YXRlOworCXN0cnVjdCBhbWRncHVfZG1f
Y29ubmVjdG9yICphY29ubmVjdG9yOworCXN0cnVjdCBkbV9jb25uZWN0b3Jfc3RhdGUgKmRtX2Nv
bm5fc3RhdGU7CisJaW50IGksIGosIGNsb2NrLCBicHA7CisJaW50IHZjcGksIHBibl9kaXYsIHBi
biA9IDA7CisKKwlmb3JfZWFjaF9vbGRuZXdfY29ubmVjdG9yX2luX3N0YXRlKHN0YXRlLCBjb25u
ZWN0b3IsIG9sZF9jb25fc3RhdGUsIG5ld19jb25fc3RhdGUsIGkpIHsKKworCQlhY29ubmVjdG9y
ID0gdG9fYW1kZ3B1X2RtX2Nvbm5lY3Rvcihjb25uZWN0b3IpOworCisJCWlmICghYWNvbm5lY3Rv
ci0+cG9ydCkKKwkJCWNvbnRpbnVlOworCisJCWlmICghbmV3X2Nvbl9zdGF0ZSB8fCAhbmV3X2Nv
bl9zdGF0ZS0+Y3J0YykKKwkJCWNvbnRpbnVlOworCisJCWRtX2Nvbm5fc3RhdGUgPSB0b19kbV9j
b25uZWN0b3Jfc3RhdGUobmV3X2Nvbl9zdGF0ZSk7CisKKwkJZm9yIChqID0gMDsgaiA8IGRjX3N0
YXRlLT5zdHJlYW1fY291bnQ7IGorKykgeworCQkJc3RyZWFtID0gZGNfc3RhdGUtPnN0cmVhbXNb
al07CisJCQlpZiAoIXN0cmVhbSkKKwkJCQljb250aW51ZTsKKworCQkJaWYgKChzdHJ1Y3QgYW1k
Z3B1X2RtX2Nvbm5lY3Rvciopc3RyZWFtLT5kbV9zdHJlYW1fY29udGV4dCA9PSBhY29ubmVjdG9y
KQorCQkJCWJyZWFrOworCisJCQlzdHJlYW0gPSBOVUxMOworCQl9CisKKwkJaWYgKCFzdHJlYW0p
CisJCQljb250aW51ZTsKKworCQlpZiAoc3RyZWFtLT50aW1pbmcuZmxhZ3MuRFNDICE9IDEpIHsK
KwkJCWRybV9kcF9tc3RfYXRvbWljX2VuYWJsZV9kc2Moc3RhdGUsCisJCQkJCQkgICAgIGFjb25u
ZWN0b3ItPnBvcnQsCisJCQkJCQkgICAgIGRtX2Nvbm5fc3RhdGUtPnBibiwKKwkJCQkJCSAgICAg
MCwKKwkJCQkJCSAgICAgZmFsc2UpOworCQkJY29udGludWU7CisJCX0KKworCQlwYm5fZGl2ID0g
ZG1fbXN0X2dldF9wYm5fZGl2aWRlcihzdHJlYW0tPmxpbmspOworCQlicHAgPSBzdHJlYW0tPnRp
bWluZy5kc2NfY2ZnLmJpdHNfcGVyX3BpeGVsOworCQljbG9jayA9IHN0cmVhbS0+dGltaW5nLnBp
eF9jbGtfMTAwaHogLyAxMDsKKwkJcGJuID0gZHJtX2RwX2NhbGNfcGJuX21vZGUoY2xvY2ssIGJw
cCwgdHJ1ZSk7CisJCXZjcGkgPSBkcm1fZHBfbXN0X2F0b21pY19lbmFibGVfZHNjKHN0YXRlLAor
CQkJCQkJICAgIGFjb25uZWN0b3ItPnBvcnQsCisJCQkJCQkgICAgcGJuLCBwYm5fZGl2LAorCQkJ
CQkJICAgIHRydWUpOworCQlpZiAodmNwaSA8IDApCisJCQlyZXR1cm4gdmNwaTsKKworCQlkbV9j
b25uX3N0YXRlLT5wYm4gPSBwYm47CisJCWRtX2Nvbm5fc3RhdGUtPnZjcGlfc2xvdHMgPSB2Y3Bp
OworCX0KKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIHZvaWQgZG1fZHJtX3BsYW5lX3Jlc2V0KHN0
cnVjdCBkcm1fcGxhbmUgKnBsYW5lKQogewogCXN0cnVjdCBkbV9wbGFuZV9zdGF0ZSAqYW1kZ3B1
X3N0YXRlID0gTlVMTDsKQEAgLTgwMTcsMTEgKzgwODAsNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9k
bV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlpZiAocmV0KQogCQlnb3Rv
IGZhaWw7CiAKLQkvKiBQZXJmb3JtIHZhbGlkYXRpb24gb2YgTVNUIHRvcG9sb2d5IGluIHRoZSBz
dGF0ZSovCi0JcmV0ID0gZHJtX2RwX21zdF9hdG9taWNfY2hlY2soc3RhdGUpOwotCWlmIChyZXQp
Ci0JCWdvdG8gZmFpbDsKLQogCWlmIChzdGF0ZS0+bGVnYWN5X2N1cnNvcl91cGRhdGUpIHsKIAkJ
LyoKIAkJICogVGhpcyBpcyBhIGZhc3QgY3Vyc29yIHVwZGF0ZSBjb21pbmcgZnJvbSB0aGUgcGxh
bmUgdXBkYXRlCkBAIC04MDkzLDYgKzgxNTEsMTAgQEAgc3RhdGljIGludCBhbWRncHVfZG1fYXRv
bWljX2NoZWNrKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCWlmICghY29tcHV0ZV9tc3RfZHNj
X2NvbmZpZ3NfZm9yX3N0YXRlKHN0YXRlLCBkbV9zdGF0ZS0+Y29udGV4dCkpCiAJCQlnb3RvIGZh
aWw7CiAKKwkJcmV0ID0gZG1fdXBkYXRlX21zdF92Y3BpX3Nsb3RzX2Zvcl9kc2Moc3RhdGUsIGRt
X3N0YXRlLT5jb250ZXh0KTsKKwkJaWYgKHJldCkKKwkJCWdvdG8gZmFpbDsKKwogCQlpZiAoZGNf
dmFsaWRhdGVfZ2xvYmFsX3N0YXRlKGRjLCBkbV9zdGF0ZS0+Y29udGV4dCwgZmFsc2UpICE9IERD
X09LKSB7CiAJCQlyZXQgPSAtRUlOVkFMOwogCQkJZ290byBmYWlsOwpAQCAtODEyMSw2ICs4MTgz
LDEwIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LAogCQkJCWRjX3JldGFpbl9zdGF0ZShvbGRfZG1fc3RhdGUtPmNvbnRleHQpOwogCQl9
CiAJfQorCS8qIFBlcmZvcm0gdmFsaWRhdGlvbiBvZiBNU1QgdG9wb2xvZ3kgaW4gdGhlIHN0YXRl
Ki8KKwlyZXQgPSBkcm1fZHBfbXN0X2F0b21pY19jaGVjayhzdGF0ZSk7CisJaWYgKHJldCkKKwkJ
Z290byBmYWlsOwogCiAJLyogU3RvcmUgdGhlIG92ZXJhbGwgdXBkYXRlIHR5cGUgZm9yIHVzZSBs
YXRlciBpbiBhdG9taWMgY2hlY2suICovCiAJZm9yX2VhY2hfbmV3X2NydGNfaW5fc3RhdGUgKHN0
YXRlLCBjcnRjLCBuZXdfY3J0Y19zdGF0ZSwgaSkgewotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
