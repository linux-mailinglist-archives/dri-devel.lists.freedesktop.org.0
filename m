Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46232FF5F4
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 23:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6D66E223;
	Sat, 16 Nov 2019 22:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760080.outbound.protection.outlook.com [40.107.76.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF506E1DE;
 Sat, 16 Nov 2019 22:01:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRNqrSUjJhkOPc2dwgaHCICglocxl9T8bOnkujVg4GbcBTnkLGYHUisNypALbFj9T2ysfB5D5NBJYKLklI0c78cNz8OU2bBLndmVw4CSLV5Fp5uSup2HP/GAWfnULklwZpkZWk6U/ubQ4QUHC8IpDT+KtdrCyJE+iuVfkKOZNb54B1wVXtcOFWXEdPL/tLCZPq9kkGFyevwTvyEKfbZ5XnxdJS3f4xQjbrEMVS4K4/xQFHqq7XbQFXygVBUc1ZrrWuaU/F3UHhUYzQ8qBJOXhvFEEeGQW9CI0xWcr3qGsUoZn/u4FDkanod5V0VVmgsT805Q7X93anVUActfU05M1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqHHNxYBCvTm9oD7XSfDOGDFfZiXSZsCrFU0G9c5Q9E=;
 b=OkPI8Mk9pfcKM6+hxfhSdkEBpQKxJt/kwZzO/NWqqqL3HyHp5g1w/LyhtJoWCuCmuAYZX8MlTyFd9aoqjcwk/QsHw5CDtMZBJn04Ziqf73a7D9440DlLWQViNxffLcI/FXMXmgg9kT6Lse2uatsorKZpdL5EFsmiHLjJarBiASzpY3/mwg7VPrVLJLvU+LQIHfW37OjEwjMWwgN3WeIlkq7VDfbBJUr9gbxfM1cFxLaNwMc6e4IkQ9Mzl9gX0nXguhOdr1JFQo4E26oZzAZlTTiTD26REwCNsDH0yHZjHLPDDMxpBEwodgtATIjBTAw8b7NbXTo9sY8Xs+bJDO+QkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0017.namprd12.prod.outlook.com
 (2603:10b6:910:16::27) by CY4PR12MB1784.namprd12.prod.outlook.com
 (2603:10b6:903:11e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.29; Sat, 16 Nov
 2019 22:01:42 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::200) by CY4PR1201CA0017.outlook.office365.com
 (2603:10b6:910:16::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Sat, 16 Nov 2019 22:01:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Sat, 16 Nov 2019 22:01:42 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:39 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sat, 16 Nov 2019 16:01:38 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v7 14/17] drm/amd/display: Add PBN per slot calculation for DSC
Date: Sat, 16 Nov 2019 17:01:25 -0500
Message-ID: <20191116220128.16598-15-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191116220128.16598-1-mikita.lipski@amd.com>
References: <20191116220128.16598-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(39860400002)(136003)(428003)(199004)(189003)(356004)(6666004)(446003)(476003)(2616005)(81156014)(81166006)(486006)(11346002)(478600001)(50466002)(336012)(1076003)(7696005)(8936002)(305945005)(48376002)(8676002)(2876002)(126002)(426003)(50226002)(36756003)(2906002)(51416003)(70586007)(70206006)(47776003)(316002)(76176011)(2351001)(4326008)(5660300002)(53416004)(186003)(6916009)(86362001)(26005)(14444005)(54906003)(16586007)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1784; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f076295-c4d6-40a8-d1fe-08d76ae09067
X-MS-TrafficTypeDiagnostic: CY4PR12MB1784:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1784043BEF26535A5A9A9D2DE4730@CY4PR12MB1784.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 02234DBFF6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wb+tOdEARw0LpIbYNrvCpmEz865jX2WOkcqe78B9jCz0xiSmfK9NL1Kj3P/cbJUzMmOYibl9ZEFZ6eGYs7yyr5LEDF9ELM44fXzlcEwQLy8wKInVwKnPkzuSn3huMAwGd6zZzqUYMXvilYK44sH/Wfpt3FOYqhMTUIdDUM0otnBmlybwNPv941uaGdRp9dkGzAJitadkRulMHmFX6A7rEwoeXiqgY2FALakfeQGbPhTGPsaoEJPyUDEBwGgUuN3QkKKeTwyeTIX9X9OUznc4+x4/zg2lk1C7D4s3GNSd8kcTtpwWTS2B5gJqk6riR9+YTcZwA6E5G1sPKL0P7Pi7zMkJPhYkgTy57b2IUhtwrXBVWLC90J+djq3hl5TaKw3EWJ9gw1lQPNzkioCgJgN4oL8366l+vCRf1zOc2Ui16mWvvF1L5up50WyiDilrYHGZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2019 22:01:42.2565 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f076295-c4d6-40a8-d1fe-08d76ae09067
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1784
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqHHNxYBCvTm9oD7XSfDOGDFfZiXSZsCrFU0G9c5Q9E=;
 b=TwH12fHoSxue2J9/H86Da6QTyKOaMhtY/CBUHQFAejPOoFPgx9vvKJ7NFgWdx4aS4ymNtvYnUCqt4paCJpxcxH1Rsx1ZZHaMM8LXuP0a8nFPhkQQEDHK4eP+0akxnleCeu0uad2m9XPjgqxO11nO8Bix3gSR7+YtqQFdHM82sQU=
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

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKW3doeV0KTmVlZCB0
byBjYWxjdWxhdGUgVkNQSSBzbG90cyBkaWZmZXJlbnRseSBmb3IgRFNDCnRvIHRha2UgaW4gYWNj
b3VudCBjdXJyZW50IGxpbmsgcmF0ZSwgbGluayBjb3VudAphbmQgRkVDLgpbaG93XQpBZGQgaGVs
cGVyIHRvIGdldCBwYm5fZGl2IGZyb20gZGNfbGluawoKU2lnbmVkLW9mZi1ieTogTWlraXRhIExp
cHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMgICB8IDggKysrKysrKysKIC4uLi9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmggICB8IDIgKysK
IDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMK
aW5kZXggMDJmMzA3NDJkMWVlLi5lOGEwZWY4ODM0MzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5j
CkBAIC00OTcsMyArNDk3LDExIEBAIHZvaWQgYW1kZ3B1X2RtX2luaXRpYWxpemVfZHBfY29ubmVj
dG9yKHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2VyICpkbSwKIAkJYWNvbm5lY3Rvci0+Y29u
bmVjdG9yX2lkKTsKIH0KIAoraW50IGRtX21zdF9nZXRfcGJuX2RpdmlkZXIoc3RydWN0IGRjX2xp
bmsgKmxpbmspCit7CisJaWYgKCFsaW5rKQorCQlyZXR1cm4gMDsKKworCXJldHVybiBkY19saW5r
X2JhbmR3aWR0aF9rYnBzKGxpbmssCisJCQlkY19saW5rX2dldF9saW5rX2NhcChsaW5rKSkgLyAo
OCAqIDEwMDAgKiA1NCk7Cit9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5oCmluZGV4IDJkYTg1MWI0MDA0
Mi4uYTU1M2VhMDQ2MTg1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuaApAQCAtMjksNiArMjksOCBA
QAogc3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXI7CiBzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5l
Y3RvcjsKIAoraW50IGRtX21zdF9nZXRfcGJuX2RpdmlkZXIoc3RydWN0IGRjX2xpbmsgKmxpbmsp
OworCiB2b2lkIGFtZGdwdV9kbV9pbml0aWFsaXplX2RwX2Nvbm5lY3RvcihzdHJ1Y3QgYW1kZ3B1
X2Rpc3BsYXlfbWFuYWdlciAqZG0sCiAJCQkJICAgICAgIHN0cnVjdCBhbWRncHVfZG1fY29ubmVj
dG9yICphY29ubmVjdG9yKTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
