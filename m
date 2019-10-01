Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB33C3A46
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 18:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484036E85D;
	Tue,  1 Oct 2019 16:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810087.outbound.protection.outlook.com [40.107.81.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9016E85D;
 Tue,  1 Oct 2019 16:17:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a22KC4EjSBruv+7qLH4L49k9V+3vGm2VHuWdbtz0fyQ1wwSFJOBWT9/va7vvNZ098mBwAFMjN9rSLXP5+u5ZbQujjOe8MDCaGKlkEi7uIPHlgo+G4v3r0dGH3um+G7H48ENAChEAPBU19GUQaMqa8toAvhQNXRcP2UYi0O3XAsnRh36VrH+gB6K4I/FHVfY66koMe+ILTqFPmkARjwRRnI7RdZEe0BS27n20FKMaL6lRJTlm/bZXLUPrO9IUzTtSm8moIF4C28Pf3BrPsAA2MNnRHIPuxTXqIzi9EVKF7TNNJBUSGQ99jH/OGainGOssDrJfXdx1qhPxwENQX2CNGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFI8dwOAXIyxzqrG2zQrictp2X9M0Vha2J2j662sJJs=;
 b=WBhZgPZSyMbWzQ8nA1UKYugc3jPc2iCp38uTa4VJUD5vqhrqGHY23znNEKVop/NNbj7bttcnkGBpPcqRIZfGvWJwvbGuZJqy6gHQuW3D7sqRGezCJrio/0l4BrNWwtMUys3FuhVLDsavVEwOz2w5habf0uCM415T5J79hN/Cu46b8Fouo+hPxHVeeEQ5weupuReiNpYz39OJkFTpmNt8iQs8aLVgeZLO4qAP8dIhfOaNE/OQpvhm/rYiaMnAVN8sKFLys1xebHmoSBTOF2JxfCX5uaXUb+Z4SF36HaC7xDAY74lW2GKzqcHkLsnHTcUP8kEL8OOw8NijkW5jIHSSsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0030.namprd12.prod.outlook.com (2603:10b6:408:60::43)
 by MN2PR12MB3582.namprd12.prod.outlook.com (2603:10b6:208:cd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Tue, 1 Oct
 2019 16:17:47 +0000
Received: from CO1NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by BN8PR12CA0030.outlook.office365.com
 (2603:10b6:408:60::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2263.20 via Frontend
 Transport; Tue, 1 Oct 2019 16:17:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT027.mail.protection.outlook.com (10.152.80.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 16:17:44 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 1 Oct 2019
 11:17:37 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 11/14] drm/amd/display: Write DSC enable to MST DPCD
Date: Tue, 1 Oct 2019 12:17:18 -0400
Message-ID: <20191001161721.13793-12-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001161721.13793-11-mikita.lipski@amd.com>
References: <20191001161721.13793-1-mikita.lipski@amd.com>
 <20191001161721.13793-2-mikita.lipski@amd.com>
 <20191001161721.13793-3-mikita.lipski@amd.com>
 <20191001161721.13793-4-mikita.lipski@amd.com>
 <20191001161721.13793-5-mikita.lipski@amd.com>
 <20191001161721.13793-6-mikita.lipski@amd.com>
 <20191001161721.13793-7-mikita.lipski@amd.com>
 <20191001161721.13793-8-mikita.lipski@amd.com>
 <20191001161721.13793-9-mikita.lipski@amd.com>
 <20191001161721.13793-10-mikita.lipski@amd.com>
 <20191001161721.13793-11-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(428003)(199004)(189003)(76176011)(36756003)(336012)(450100002)(53416004)(7696005)(14444005)(5660300002)(51416003)(26005)(1076003)(47776003)(186003)(2351001)(50226002)(86362001)(305945005)(356004)(2906002)(81166006)(81156014)(4326008)(48376002)(70206006)(50466002)(70586007)(54906003)(8676002)(446003)(11346002)(476003)(2616005)(6916009)(478600001)(426003)(316002)(2876002)(126002)(486006)(16586007)(6666004)(8936002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3582; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4033ff19-3a12-4046-3575-08d7468ae4e5
X-MS-TrafficTypeDiagnostic: MN2PR12MB3582:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3582B50A4344EC6A5B5DBEA2E49D0@MN2PR12MB3582.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 0177904E6B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A1xm3H9uLZ/ERBh8TZnFs8k5FydsmdKDfQRD3gGAnbneCyoz02jk6awu+GO32DLuoAcpOPP0byzFtdCUQq4SbMSwHPd4Gp5M6aV+L0Ki7iITCir31LuKQjK0M5EpB9Z2LVTYYRG+BKwhzJl3no/ohGjsl+84/kce3nFB76y9taBK9h16ddlBCh+uRZaF+xESntD5JWPIg5VddjY9Ez0kMYSrZRXwUODHoDeWTUkoE/VbRXZTxo35UoMHdymzfiC53kA7TWerKekpFmWEX96lPovnpu1vWPs9w4FpjqL+eeeYDw51Pl985qBEvfB6hBtWgRQrkEiQeQzKuIsFa0Bd/1N5ng/CgrYH4pWBastFocWXy9rrWuh2i2WVdB6MTNfOpMRHVN+ZXAR3NZdpxKyEmIM2HOsGQuT7Sza/nBOOBkg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 16:17:44.1560 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4033ff19-3a12-4046-3575-08d7468ae4e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3582
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFI8dwOAXIyxzqrG2zQrictp2X9M0Vha2J2j662sJJs=;
 b=XykyIERh9xI4u4rcewYqpMMD0z0RrXXBdz0aWoAycUeO9P1+pyTPllberUv+wT3Z6O92DkspUVpXyeO+2wdNY31Hm46cCtP9u1cF2wyj73941ku8l6ZFGt+A0GPCbH7xOizz0HUTPczoB2JXtYA9y2jpTjNCoEb0yUjJatjwRDc=
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

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKUmV3b3JrIHRoZSBk
bV9oZWxwZXJzX3dyaXRlX2RzY19lbmFibGUgY2FsbGJhY2sgdG8KaGFuZGxlIHRoZSBNU1QgY2Fz
ZS4KClVzZSB0aGUgY2FjaGVkIGRzY19hdXggZmllbGQuCgpSZXZpZXdlZC1ieTogV2VuamluZyBM
aXUgPFdlbmppbmcuTGl1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERh
dmlkLkZyYW5jaXNAYW1kLmNvbT4KLS0tCiAuLi4vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbV9oZWxwZXJzLmMgfCAxOSArKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
MTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwppbmRleCBm
YzUzN2FlMjVlZWIuLmJkNjk0NDk5ZTNkZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwpAQCAtMzcsNiAr
MzcsNyBAQAogI2luY2x1ZGUgImRjLmgiCiAjaW5jbHVkZSAiYW1kZ3B1X2RtLmgiCiAjaW5jbHVk
ZSAiYW1kZ3B1X2RtX2lycS5oIgorI2luY2x1ZGUgImFtZGdwdV9kbV9tc3RfdHlwZXMuaCIKIAog
I2luY2x1ZGUgImRtX2hlbHBlcnMuaCIKIApAQCAtNTE4LDggKzUxOSwyNCBAQCBib29sIGRtX2hl
bHBlcnNfZHBfd3JpdGVfZHNjX2VuYWJsZSgKICkKIHsKIAl1aW50OF90IGVuYWJsZV9kc2MgPSBl
bmFibGUgPyAxIDogMDsKKwlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvcjsK
KworCWlmICghc3RyZWFtKQorCQlyZXR1cm4gZmFsc2U7CisKKwlpZiAoc3RyZWFtLT5zaWduYWwg
PT0gU0lHTkFMX1RZUEVfRElTUExBWV9QT1JUX01TVCkgeworCQlhY29ubmVjdG9yID0gKHN0cnVj
dCBhbWRncHVfZG1fY29ubmVjdG9yICopc3RyZWFtLT5kbV9zdHJlYW1fY29udGV4dDsKKworCQlp
ZiAoIWFjb25uZWN0b3ItPmRzY19hdXgpCisJCQlyZXR1cm4gZmFsc2U7CisKKwkJcmV0dXJuIChk
cm1fZHBfZHBjZF93cml0ZShhY29ubmVjdG9yLT5kc2NfYXV4LCBEUF9EU0NfRU5BQkxFLCAmZW5h
YmxlX2RzYywgMSkgPj0gMCk7CisJfQorCisJaWYgKHN0cmVhbS0+c2lnbmFsID09IFNJR05BTF9U
WVBFX0RJU1BMQVlfUE9SVCkKKwkJcmV0dXJuIGRtX2hlbHBlcnNfZHBfd3JpdGVfZHBjZChjdHgs
IHN0cmVhbS0+bGluaywgRFBfRFNDX0VOQUJMRSwgJmVuYWJsZV9kc2MsIDEpOwogCi0JcmV0dXJu
IGRtX2hlbHBlcnNfZHBfd3JpdGVfZHBjZChjdHgsIHN0cmVhbS0+c2luay0+bGluaywgRFBfRFND
X0VOQUJMRSwgJmVuYWJsZV9kc2MsIDEpOworCXJldHVybiBmYWxzZTsKIH0KICNlbmRpZgogCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
