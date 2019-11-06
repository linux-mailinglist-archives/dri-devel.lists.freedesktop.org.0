Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1237F1CCA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 18:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F3E6EE20;
	Wed,  6 Nov 2019 17:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740050.outbound.protection.outlook.com [40.107.74.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B176E6EE1D;
 Wed,  6 Nov 2019 17:51:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFKzbDXvrbol1ENv6mT1+Zg/ij4Vkf+8oZ2dTEXSkv8hFt6i/m7+qJiQJBpRh1tqvb81UBktNaTLw6j/9bfpSuUWm9U8YMUWi5X6/rVWNvUOPlIIr/e+e0jJ5rr9/n/U1z0sm/WlhQBYomtekH+y9uNWhMkz3vHgXJk2mExSaxDxQK+qzmJrH4qyfVbueR3r09+EMXc21OSimF7wExoXJNuVyN2z1lVwGJH8eQa4VDtsng5HlG2yKXGtTwJ9LMN1CWoCPIklplN3fnfujD7XGwQ0ZxH+ltm3nhh7vWVXpUxv9O1xqh/C58VZWVDQge/ArJypnl13qv7s/rpXFBFalg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXsS7olscigu00RrXleAvpAEkQeW5Z7RIeWrzLszzrE=;
 b=Xi1PAKw8rT3p2JxSuuC6f/4DZINJ4gwg2nmxrV6CQWMU5Ae3sK0PegSRAp7n9dV7sVngpzBaVF0yKkhu9LVYEfBytequYaAuvVkjzQfRcgf42VoWZnfZuhD6GMU8rfWCUpUIMkY0wDRLktNeTRtsoN6haWZUh0bsFTLh8kxKb451vP/O4COt8inSFT+d0pp3pYfCDxQaYy4bRkGGlIga4bXPcdnzO/zbTNTRG50dmCx9con8FGnl46rOJEjxiiUTsjLTbo78b/W2FD18vIpHrSXmjnjILdWO81AtflXlbHBda1ZLI49PxUwR4iq0n3tePGcFECiZGBdRCuE1eqZPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0055.namprd12.prod.outlook.com (2603:10b6:3:103::17)
 by DM5PR1201MB0202.namprd12.prod.outlook.com (2603:10b6:4:4d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24; Wed, 6 Nov
 2019 17:51:19 +0000
Received: from CO1NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by DM5PR12CA0055.outlook.office365.com
 (2603:10b6:3:103::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.22 via Frontend
 Transport; Wed, 6 Nov 2019 17:51:18 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM03FT061.mail.protection.outlook.com (10.152.81.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2430.20 via Frontend Transport; Wed, 6 Nov 2019 17:51:18 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 6 Nov 2019
 11:51:17 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 6 Nov 2019
 11:51:17 -0600
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 6 Nov 2019 11:51:17 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: 
Subject: [PATCH 1/4] Revert "drm/amdgpu: dont schedule jobs while in reset"
Date: Wed, 6 Nov 2019 12:51:09 -0500
Message-ID: <1573062672-23698-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(428003)(189003)(199004)(48376002)(305945005)(8936002)(4326008)(478600001)(186003)(336012)(44832011)(2616005)(86362001)(476003)(126002)(51416003)(7696005)(26005)(54906003)(50226002)(14444005)(109986005)(70586007)(70206006)(47776003)(8676002)(53416004)(81156014)(81166006)(36756003)(16586007)(426003)(316002)(486006)(5660300002)(356004)(1671002)(50466002)(450100002)(4744005)(6666004)(2906002)(266003)(192303002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0202; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1073ee82-3fae-4acb-a67d-08d762e1ed7a
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0202:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0202B0FCD7B70AA1688ED873EA790@DM5PR1201MB0202.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:125;
X-Forefront-PRVS: 02135EB356
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z6NPD7MvtzVl5ZNI/CTEKf/2Wj9/DR93CCtk4diyf+rQ3hHZIMpFg0SmsIxHA5SW4cYH3pJku0R4oojK+tJLcSo+JHET6d2OxLH3buVsHD7+e5Lu0uMCcyO/sJpQyMjDczqtXvQujXrHuHwLxVQSmAPDYg56piWE3am/3ieDD1KBz5EyASqsTnZLf5IJZ6gJxtUvEQLIY6qfZ6hekMHn9+I7nkvWr/gs8E6VRloC2da0zZTRTDb2j/o19hH6yidrPczWSINzRZ31BJTic9FFMaqZk+ImhMFR8pZhuKea3z7LSW+ly14HYzbrLBoU6B0mmKsQRN2hskfGQn38y85nKmOnd7auvgopIkhlRy/s+q4qd5hKpzeOXyVcMofZmggFzhtFFmOeovcq/9ez38iVMe2TdpiEX1eRsWIOHVhqHe8XCnZkOF8lf7+7iGp5MoAY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2019 17:51:18.6005 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1073ee82-3fae-4acb-a67d-08d762e1ed7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0202
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXsS7olscigu00RrXleAvpAEkQeW5Z7RIeWrzLszzrE=;
 b=0dWesmXupckDwg/061Vivmtbe2NSs+roJa9B3UDUk2VWhikAXfsFqgfPj1HDB2OXbRXOE7Q8ZIvg9pzMgoaZ86mRyg6wk+evE3sZ+CqsA9hv9Pp1kIJR2IMSGhnZrIRTswv2ZhshuPppB0vLAdgvxEULsOD+BR4EIrKh7EflRa0=
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
Cc: Shirish.S@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCAzY2RmOWJkMDA4OTcyM2M0NjhkNWY2MjQwZTU0ZDFhZmE1MmU5
YTA0LgoKV2Ugd2lsbCBkbyBhIHByb3BlciBmaXggaW4gbmV4dCBwYXRjaC4KClNpZ25lZC1vZmYt
Ynk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYyB8IDUgKy0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfY3R4LmMKaW5kZXggMmNkYWYzYi4uNjYxNGQ4YSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYwpAQCAtNjA0LDExICs2MDQsOCBAQCB2b2lkIGFt
ZGdwdV9jdHhfbWdyX2VudGl0eV9maW5pKHN0cnVjdCBhbWRncHVfY3R4X21nciAqbWdyKQogCQkJ
Y29udGludWU7CiAJCX0KIAotCQlmb3IgKGkgPSAwOyBpIDwgbnVtX2VudGl0aWVzOyBpKyspIHsK
LQkJCW11dGV4X2xvY2soJmN0eC0+YWRldi0+bG9ja19yZXNldCk7CisJCWZvciAoaSA9IDA7IGkg
PCBudW1fZW50aXRpZXM7IGkrKykKIAkJCWRybV9zY2hlZF9lbnRpdHlfZmluaSgmY3R4LT5lbnRp
dGllc1swXVtpXS5lbnRpdHkpOwotCQkJbXV0ZXhfdW5sb2NrKCZjdHgtPmFkZXYtPmxvY2tfcmVz
ZXQpOwotCQl9CiAJfQogfQogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
