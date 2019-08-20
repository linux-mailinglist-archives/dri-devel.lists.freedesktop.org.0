Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4370696933
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 21:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A3D6E877;
	Tue, 20 Aug 2019 19:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790070.outbound.protection.outlook.com [40.107.79.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E4E6E869;
 Tue, 20 Aug 2019 19:12:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SL1IUcC0F4MUJZljaFIdxUY1QE4Fup/ADgMNYlkIoDqpEkOgUDcpwj3xrc9DtI7AVmAjnU1X0ji0gHR2WEhewKdN98xk6hZsNvM/laJC2rPFPBvo5gu9doU3p0KHdAExaIsgsZzfD1mpC5GHNZCENiFlzcZAfHZlFfUAeiZsFtVfP+OVOfIfXS2ZpOq7mZKtW0bbOKMFJf+DnrFRSahgU6f3kj4/+Eosttj/DBopS+1HjD50IwBwTQ5acxP4jYo/Oyi2hksJbVwiuOQKvWbdjEwGGfgQSXjm/p6cP1nEXJNaXWElpQHrN8NivdJecavDo9nWblxOD1CcfNP4xElscQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNjshlRcUanOJLgfR8aBbtgXRdOIki4lcUKdbU+enwI=;
 b=gR83tDWZy36nUG+S9AN6f3tICkUaK5XWK9xBLG1K8iHvWalnx3b8LPRLmWD+/8LN82uvT2Ke4cjfiR+b3WQSdPJYXMnTZt+0/FzmdQ+BOJ56oQ7EEl7zI0ZVuAKoYvUzg+TRxUWTA1yPdqtQh0bxSLGoBaTZ5cKDaadu3lAv3+DZQ6W4KbuUG9AfKWDpQMjUDRaSfDwMrfnad9MIjrhZ9LwnxhNaHbnd7Q6v2BLYQ4Jjy/lfWpqBGVasnZY+egK7LBLovfZobrNgS26EwO1ACkBE8kc5PQzxWscSyHQAWUiHnseULMLoKnVwZhZbl5LlrI+17RoR+WdzhFQkfyV2Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0010.namprd12.prod.outlook.com
 (2603:10b6:301:4a::20) by MWHPR12MB1278.namprd12.prod.outlook.com
 (2603:10b6:300:10::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Tue, 20 Aug
 2019 19:12:29 +0000
Received: from BY2NAM03FT012.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by MWHPR1201CA0010.outlook.office365.com
 (2603:10b6:301:4a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 19:12:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT012.mail.protection.outlook.com (10.152.84.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 19:12:29 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 20 Aug 2019 14:12:25 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 10/14] drm/dp-mst: Fill branch->num_ports
Date: Tue, 20 Aug 2019 15:11:59 -0400
Message-ID: <20190820191203.25807-11-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820191203.25807-1-David.Francis@amd.com>
References: <20190820191203.25807-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(428003)(199004)(189003)(476003)(11346002)(51416003)(446003)(76176011)(2616005)(1076003)(426003)(2906002)(86362001)(16586007)(49486002)(48376002)(336012)(70206006)(70586007)(486006)(316002)(110136005)(126002)(50466002)(478600001)(81156014)(4326008)(305945005)(36756003)(6666004)(356004)(5660300002)(81166006)(450100002)(8936002)(26005)(8676002)(186003)(50226002)(14444005)(47776003)(4744005)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1278; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75259ea2-8bdf-4f17-cd9a-08d725a25868
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MWHPR12MB1278; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1278:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12781DF1BE45BFC9267B5F8CEFAB0@MWHPR12MB1278.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Hv3o1UA8QVNdAIr7w2N+oJAAUSRdvsEs91yV4BNLd9wiW4cxetbgoKkHIfhWbB8ge6S2e4JYpUCSVDJDNNOYomSAD7pJaPi2LOpfR6gBwBWebxJ4huyCERmCz0zgkJlKTBevbGLlzarGABxCjt8ASv9vz1Bthv//0KBfbyRunxgkt5m3zN7giAIaO36LHox2o62wNPjXsTH7ptP4+naC3WG1iSBjFsmmOmjOWLZ4W+cq0LcFDTzVrn2d9ghOCqBRAdEiQD+bsF7uVcshNzOp/muqr8FGbwJcI0rJ8PxMbDppsYov9EDS/Lrv6SyVpHGXJxw9ZTo8OYON7jaXpZzyipn8Po55YJAMrYdaG6Rz6uD+OOzsa6FKIg99uOZrcJNBJnVJ5qp0jgj5BUmeNK3O4U3wt2cOWCVMAGLICMleVFs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 19:12:29.2756 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75259ea2-8bdf-4f17-cd9a-08d725a25868
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1278
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNjshlRcUanOJLgfR8aBbtgXRdOIki4lcUKdbU+enwI=;
 b=4gn2NP+bWf7BIQkvzNwu2cQ4cAexyVCmfCf4SX52is3s+soxTR+WpNXp2EcmHYZVTlqDymyIAYc/qNiv9nqDZF1rZem6hCqKTMFhQUz7H87SnnxZHQJa1AGwIBQDLBVqzCQsTBVt994H3nV30Hg9HYQdkwkwcOjI24O+WN0yb00=
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
Cc: David Francis <David.Francis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmaWVsZCBvbiBkcm1fZHBfbXN0X2JyYW5jaCB3YXMgbmV2ZXIgZmlsbGVkCgpJbml0aWFs
aXplIGl0IHRvIHplcm8gd2hlbiB0aGUgbGlzdCBvZiBwb3J0cyBpcyBjcmVhdGVkLgpXaGVuIGEg
cG9ydCBpcyBhZGRlZCB0byB0aGUgbGlzdCwgaW5jcmVtZW50IG51bV9wb3J0cwoKU2lnbmVkLW9m
Zi1ieTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5kZXggNWQ1
YmQ0MmRhMTdjLi4wYzU4MGQ1Mjc5YzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYwpAQCAtOTE4LDYgKzkxOCw3IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2gg
KmRybV9kcF9hZGRfbXN0X2JyYW5jaF9kZXZpY2UodTggbGN0LCB1OCAqcmFkKQogCUlOSVRfTElT
VF9IRUFEKCZtc3RiLT5wb3J0cyk7CiAJa3JlZl9pbml0KCZtc3RiLT50b3BvbG9neV9rcmVmKTsK
IAlrcmVmX2luaXQoJm1zdGItPm1hbGxvY19rcmVmKTsKKwltc3RiLT5udW1fcG9ydHMgPSAwOwog
CXJldHVybiBtc3RiOwogfQogCkBAIC0xNjcyLDYgKzE2NzMsNyBAQCBzdGF0aWMgdm9pZCBkcm1f
ZHBfYWRkX3BvcnQoc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiLAogCQltdXRleF9sb2Nr
KCZtc3RiLT5tZ3ItPmxvY2spOwogCQlkcm1fZHBfbXN0X3RvcG9sb2d5X2dldF9wb3J0KHBvcnQp
OwogCQlsaXN0X2FkZCgmcG9ydC0+bmV4dCwgJm1zdGItPnBvcnRzKTsKKwkJbXN0Yi0+bnVtX3Bv
cnRzKys7CiAJCW11dGV4X3VubG9jaygmbXN0Yi0+bWdyLT5sb2NrKTsKIAl9CiAKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
