Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 108C2B6DA8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 22:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1313672AF1;
	Wed, 18 Sep 2019 20:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820081.outbound.protection.outlook.com [40.107.82.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B3672B0E;
 Wed, 18 Sep 2019 20:27:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEJhsL+clqNdjFPnVrtbhLUTv7h0cRKoD4bMMmirqLoUO/ow9Fhoj/LV7UuxoY2sisrUqEmDzWqkMFk/HBFn3aza7hPECoDMjOP4vrhPteBTAFoXPGLRSb7qUgtxb5a1NLyRuU6st9j2wo5RP7PjhFWfID5Pe84t5tKH9KAKb/lC+pN4ON7rDSUVOlO+yHFDaek6Pw1qeMwhNZ0WMr/Do5WsVoE2/W9sw1xEj1zOt2rub7y99x9yA4k1A2nLtlImnEyyWW+Pm5/MsgxnJA2jTcOkKIglAIBg9YHxKSygISFjjPubyIoYWCi+iQukXFI1F+ZE+shtxtIHz/IbgGn1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRZ7Wi+Ch5JS1ObePu7LoYjgzE/+uwh3QveSb75u2aw=;
 b=OEs53uvSAMprfxIU69MKctcEOc0j5YJlMohsHHZFA2tQ05TWjv+0KQj+FWMv9KDG1sJOsNqptACnXJmXtTprWWNRS28kcaYXP5dzKaHeuViIRh48+dyWycy527YBzEAJs7o5X5PwfvwXq156KiY85JB6+B+zYHoI/tRI2LwWwvbLW6XacUh0nNjzfaizJQggpudAJl9Whc0KVhre9D5emhtzJ6Q6lQm/wimDB4+DZi8jOt6JMjQ0erQc2elPKUEJGHsEV17YBTWvQ4I3pVpUlQvPgLiI+aoqvHv7xUbduzZae1CcMkS/FNkI1mqZggXTcc1MycDKEILk0yax0CC/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0028.namprd12.prod.outlook.com (2603:10b6:610:57::38)
 by CY4PR12MB1125.namprd12.prod.outlook.com (2603:10b6:903:43::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18; Wed, 18 Sep
 2019 20:27:35 +0000
Received: from DM3NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by CH2PR12CA0028.outlook.office365.com
 (2603:10b6:610:57::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.19 via Frontend
 Transport; Wed, 18 Sep 2019 20:27:35 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT014.mail.protection.outlook.com (10.152.82.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Wed, 18 Sep 2019 20:27:34 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 18 Sep 2019
 15:27:32 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/15] drm/amd/display: Write DSC enable to MST DPCD
Date: Wed, 18 Sep 2019 16:26:50 -0400
Message-ID: <9850977c244276f1b8c2b0f68302664f953a9153.1568833906.git.mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568833906.git.mikita.lipski@amd.com>
References: <cover.1568833906.git.mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(39860400002)(346002)(428003)(189003)(199004)(7696005)(305945005)(186003)(76176011)(2351001)(51416003)(36756003)(6666004)(356004)(86362001)(70586007)(50466002)(53416004)(14444005)(336012)(486006)(70206006)(2906002)(26005)(426003)(476003)(446003)(11346002)(126002)(2616005)(6916009)(5660300002)(8676002)(478600001)(81166006)(81156014)(47776003)(8936002)(2876002)(316002)(4326008)(48376002)(450100002)(16586007)(50226002)(54906003)(118296001)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1125; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bd45dfc-e842-4811-39c6-08d73c76a3ed
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CY4PR12MB1125; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1125:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1125068E5094CEDE354027EDE48E0@CY4PR12MB1125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 01644DCF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 44gmbbTj0vBhsq0cEYb+JNTDmXtrZTZvAWRMygCv3h+7zyBCD6/KDyR01orLzsnJ9K4j7GNNQxIZ1awBlkuL8Rz/b9e7bO8Pem1xWon0jwLivTHPxN3jHfE9QYkCQ3fED6sVTeDHLqv8Jlt6d008cMqiEbt2RboofLvlfQGS0f1X4gjnLccf7wDf8AuwHyYEFgcPTwFVffGhSwNXnE5NnqqQEgyBkR9svg+j5+hgxoXYexdPtbL7NfwKTK6ekyY/7xAmjE8bYdInF3UkiWwonJMbNDQgVeLDczAeczMCxO6QdolSHK6VikPuAaGlKl01Mb0IaIX2xhFK0eaezW+MSm50JVPX5QZcRCSs9jqGzGZG4hRBGn60q6WGDTtY8q3DEkTtclR25TbPnEfE9GTdbOJpK1FAWXhFWyd0nQwE/ek=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 20:27:34.9204 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd45dfc-e842-4811-39c6-08d73c76a3ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1125
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRZ7Wi+Ch5JS1ObePu7LoYjgzE/+uwh3QveSb75u2aw=;
 b=rzGns62wF3dPnfVLwfOH8yLgokehPoVlQ5+y+EQn2qYnKg8t8ahGy6tBFFJ47sbTC0dqepN35oFBQlcp2VsM2RqE7bs0F2YkLVUJbOS8qhdEuYNULWrJtYHTa9KqgGlqN2kjd5S74rGBuZPHtgK7xzreAq7cdkNEU3WUoHeFcSI=
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
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwppbmRleCBh
YWYzMTU4NTM0YWIuLmE4M2Q3ZGEyNTlmZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwpAQCAtMzgsNiAr
MzgsNyBAQAogI2luY2x1ZGUgImRjLmgiCiAjaW5jbHVkZSAiYW1kZ3B1X2RtLmgiCiAjaW5jbHVk
ZSAiYW1kZ3B1X2RtX2lycS5oIgorI2luY2x1ZGUgImFtZGdwdV9kbV9tc3RfdHlwZXMuaCIKIAog
I2luY2x1ZGUgImRtX2hlbHBlcnMuaCIKIApAQCAtNTU3LDggKzU1OCwyNCBAQCBib29sIGRtX2hl
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
