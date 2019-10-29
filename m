Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A51DE8B6B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 16:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A876E420;
	Tue, 29 Oct 2019 15:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720058.outbound.protection.outlook.com [40.107.72.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F27889CD9;
 Tue, 29 Oct 2019 15:05:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPqdNcTfrf6P7YzKOoQLnyH0S2se8GAavlRLMcpVn3AQiDe7DzZw+MTbXZfIUipU3HDCfwblGs7gc0iApHuwefsoTcNY4P0MvISg/e+O26/hMG4KzB2182V9U/pbudXotCOh346EnLHz7YJ111USeep4Ll6wWpo6T2iLU1svuYdT7k/ddLMBvubZnLuX6WvZs4v+7Lgs8YUaCPyTcCK0vLlGQ/KyNapB3CADV/NZ8EUEnQVMHXuI5L6Q6P4cZ/bK6vl7ih4n7zD6adtzWCnR/qBIBke5F+sQ/mF8agP5OKxBo2fjjfzrJFqepw6NE6gmfdXcmK8VP4wDXhRJe68f5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDpf5nU25c4fgSfUf6ULjV7mexzIn7VC1g7lWsrZMO4=;
 b=VpM8ahhOgXEFS+ct20r6RdnCljwi1+OlbSyCHYbhSNf2b11xPlnBKSrD2VK7RCAMXivJ5aoaDWgNs7VuU9EtIuAeoVqKoGFXWFCzb1AVILFCIjUPSkEPjtuaPmShNeOoOrLJJvaM4VTq/D4Vb8thi43/uGc+iAO8Jhwc2+t3wXFmlI9OfCbffpSYzBYZWenW+ZbOWL1NsuxtbjavIusGbDxPLiRznz0N1uG3yyVFoKSd7VTcWatWjNrvtsNCQrKmHwwy15/R8jkXwXDTDNA3f3qCe9Y7RzepXpbItMp/jeFUJT5av65iPT6nXgYCMbyH1so5UOX337EzDErQvMBR2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=oracle.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0064.namprd12.prod.outlook.com (2603:10b6:300:103::26)
 by BYAPR12MB3573.namprd12.prod.outlook.com (2603:10b6:a03:df::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.24; Tue, 29 Oct
 2019 15:04:58 +0000
Received: from DM3NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by MWHPR12CA0064.outlook.office365.com
 (2603:10b6:300:103::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.22 via Frontend
 Transport; Tue, 29 Oct 2019 15:04:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT003.mail.protection.outlook.com (10.152.82.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 15:04:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 10:04:45 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 10:04:45 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Tue, 29 Oct 2019 10:04:45 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dan.carpenter@oracle.com>
Subject: [PATCH] drm/sched:  Fix passing zero to 'PTR_ERR' warning
Date: Tue, 29 Oct 2019 11:04:44 -0400
Message-ID: <1572361484-9828-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(396003)(376002)(428003)(199004)(189003)(50226002)(70206006)(7696005)(26005)(50466002)(48376002)(16586007)(54906003)(356004)(478600001)(316002)(5660300002)(2906002)(426003)(70586007)(4744005)(2616005)(4326008)(476003)(86362001)(53416004)(14444005)(44832011)(6916009)(36756003)(186003)(486006)(305945005)(336012)(8936002)(81166006)(81156014)(2351001)(47776003)(8676002)(126002)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3573; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 609c9dc6-e5b6-434b-97a0-08d75c815ca2
X-MS-TrafficTypeDiagnostic: BYAPR12MB3573:
X-Microsoft-Antispam-PRVS: <BYAPR12MB357373188B15191AC89DAD9FEA610@BYAPR12MB3573.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:29;
X-Forefront-PRVS: 0205EDCD76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hEnw/3FUuM81chLxMa0E5t9weW1pmfDN4UlM9vUgZJ5qLgIxPrwAPWwVYdTQRFL3/Bcvs2Mz1vg8qBX140jBA/AJpnShut3QFUg2tCXBcSelvtSbV8AztRlmmcg6zRsJWV0deKmocMHluebCE1t4CB+TMlZn3NMtEeTexOENpJb5A3Z0aprsStSNky8fS0jcsXw8U46EtdQm/RLJYaB+3mDMQSdzRSDq6W7+qqfJ92xKWzmJrTnObmgM9u1Nud9SqHh/inGjM2k394EFsK/5lxzO0UK40Kxe0QzOsS9KqX3w6lYtnX65wTrbQ7/0n7OB1KfFh5M9xqnGoLGBwc9cbC/mOYBNpPwYjALKHf7XATG+W6+nXmN7KcZbWc80HFgk03nly/sv4lQLfWdm524ZcIFClnx0jA9IWbTQXWPE58e+0X41kKTNY0oK3WpIiBSO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2019 15:04:57.0029 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 609c9dc6-e5b6-434b-97a0-08d75c815ca2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3573
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDpf5nU25c4fgSfUf6ULjV7mexzIn7VC1g7lWsrZMO4=;
 b=kneIZlnhvSdb/vxISZDkqblMFmz7/TJmj7slhmqkqFUEG3xXh9ci8gIgHRL3ohccpKUf03XVQSsQLNsJTdcqeHZnQfeiJBB8NII54rI6oCmaTRfNITpLWbdNl+Usz+0UTPLMLmzFpB2Cjlrn/Pwn1yyom66P/WQoVvKlhnloG4Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IGEgc3RhdGljIGNvZGUgY2hlY2tlciB3YXJuaW5nLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5
IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVk
X21haW4uYwppbmRleCBmMzliOTdlLi44OThiMGM5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVy
L3NjaGVkX21haW4uYwpAQCAtNDk3LDcgKzQ5Nyw3IEBAIHZvaWQgZHJtX3NjaGVkX3Jlc3VibWl0
X2pvYnMoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkKIAogCQlpZiAoSVNfRVJSX09S
X05VTEwoZmVuY2UpKSB7CiAJCQlzX2pvYi0+c19mZW5jZS0+cGFyZW50ID0gTlVMTDsKLQkJCWRt
YV9mZW5jZV9zZXRfZXJyb3IoJnNfZmVuY2UtPmZpbmlzaGVkLCBQVFJfRVJSKGZlbmNlKSk7CisJ
CQlkbWFfZmVuY2Vfc2V0X2Vycm9yKCZzX2ZlbmNlLT5maW5pc2hlZCwgUFRSX0VSUl9PUl9aRVJP
KGZlbmNlKSk7CiAJCX0gZWxzZSB7CiAJCQlzX2pvYi0+c19mZW5jZS0+cGFyZW50ID0gZmVuY2U7
CiAJCX0KQEAgLTc0Miw3ICs3NDIsNyBAQCBzdGF0aWMgaW50IGRybV9zY2hlZF9tYWluKHZvaWQg
KnBhcmFtKQogCQkJZG1hX2ZlbmNlX3B1dChmZW5jZSk7CiAJCX0gZWxzZSB7CiAKLQkJCWRtYV9m
ZW5jZV9zZXRfZXJyb3IoJnNfZmVuY2UtPmZpbmlzaGVkLCBQVFJfRVJSKGZlbmNlKSk7CisJCQlk
bWFfZmVuY2Vfc2V0X2Vycm9yKCZzX2ZlbmNlLT5maW5pc2hlZCwgUFRSX0VSUl9PUl9aRVJPKGZl
bmNlKSk7CiAJCQlkcm1fc2NoZWRfcHJvY2Vzc19qb2IoTlVMTCwgJnNjaGVkX2pvYi0+Y2IpOwog
CQl9CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
