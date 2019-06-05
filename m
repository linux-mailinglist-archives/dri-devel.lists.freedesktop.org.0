Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C48FB3621A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 19:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2100F89220;
	Wed,  5 Jun 2019 17:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680080.outbound.protection.outlook.com [40.107.68.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF2F89220
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 17:11:32 +0000 (UTC)
Received: from SN1PR12CA0046.namprd12.prod.outlook.com (2603:10b6:802:20::17)
 by DM5PR1201MB0060.namprd12.prod.outlook.com (2603:10b6:4:51::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.17; Wed, 5 Jun
 2019 17:11:30 +0000
Received: from BY2NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by SN1PR12CA0046.outlook.office365.com
 (2603:10b6:802:20::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.13 via Frontend
 Transport; Wed, 5 Jun 2019 17:11:30 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT025.mail.protection.outlook.com (10.152.84.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Wed, 5 Jun 2019 17:11:30 +0000
Received: from Jiraiya.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 5 Jun 2019
 12:11:28 -0500
From: Dingchen Zhang <dingchen.zhang@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm: not to read outside the boundary for CRC source name.
Date: Wed, 5 Jun 2019 13:06:38 -0400
Message-ID: <20190605170639.8368-1-dingchen.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(346002)(376002)(396003)(2980300002)(428003)(199004)(189003)(6666004)(305945005)(6916009)(53936002)(356004)(36756003)(2906002)(476003)(8676002)(426003)(53416004)(486006)(126002)(336012)(50466002)(86362001)(51416003)(72206003)(44832011)(2616005)(478600001)(16586007)(26005)(14444005)(77096007)(81156014)(47776003)(70586007)(8936002)(50226002)(81166006)(2351001)(1076003)(316002)(48376002)(186003)(4744005)(68736007)(5660300002)(7696005)(70206006)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0060; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdd12422-215c-4951-fecd-08d6e9d8da3e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB0060; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0060:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0060D32461B00ECB9D0DAE958D160@DM5PR1201MB0060.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-Forefront-PRVS: 00594E8DBA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rl9jxcSYovdfiq5/Zkypnd8jSJnRLSBleweTFEsyLhMvWswcrRxHTpZL0zrZpuroERG2l1XmZ/fwtoD2llgwdZWk7aF9Ny6+SEI+zQwltHja4KhkwEMpoL2NxZnjO4/xHTA0SBUPuNn/Qobe/WLkErLjnCetLmht2L6RUJxhnMAqhtGAmQgbLxuSg/DAfm/K/0Ng73fyN85nhonu4LDQB7Dym0EM4wX33w34jleaZdniWwyxkkixB4yRyUdBTn3Jmt4iYkRADJffH9s6oD+EaAVWUFWPkG8GGeuNk1Qveegfyp8sCywsZPzzXWkpvQ8XeRULwepysAkC6MfWqjCu0dbN6Wn+yWEpHW+yVAPVpw7suhr2UjBtxZ/MTvzFewcuNIAOfcvfUKKULDyyL0y6y+KgeO27tTZWZzrwaWqb5aI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2019 17:11:30.1721 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd12422-215c-4951-fecd-08d6e9d8da3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0060
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8h9fAHwlwpsVoSRZdygc2zwn7BwHcoaFEl5C6WmeBM=;
 b=HD2a3TJO3Nja2cZMbK8bUX5wUhnpub6nm0RZcGkhv+RfvoR5pKKYB2ejikBmueVGWxWw8iLDmGqYn++ddeeMGmQDb2Hvo04Zx3RXQV+6hqOTG0iEGSyKJt7IBnWUXesVGBWO0IzU448DwP8kGJ7ynR9mGwQxI4rWR93/Aily/UI=
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
Cc: Dingchen Zhang <dingchen.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

J24tMScgaXMgdGhlIGluZGV4IHRvIGFjY2VzcyB0aGUgbGFzdCBjaGFyYWN0ZXIgb2YgQ1JDIHNv
dXJjZSBuYW1lLgoKQ2M6TGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+LCBIYXJyeSBXZW50bGFu
ZDxIYXJyeS5XZW50bGFuZEBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEaW5nY2hlbiBaaGFuZyA8
ZGluZ2NoZW4uemhhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNf
Y3JjLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jCmluZGV4IDU4NTE2OWYwZGNjNS4uZTIw
YWRlZjlkNjIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jCkBAIC0xMzEsOCArMTMxLDgg
QEAgc3RhdGljIHNzaXplX3QgY3JjX2NvbnRyb2xfd3JpdGUoc3RydWN0IGZpbGUgKmZpbGUsIGNv
bnN0IGNoYXIgX191c2VyICp1YnVmLAogCWlmIChJU19FUlIoc291cmNlKSkKIAkJcmV0dXJuIFBU
Ul9FUlIoc291cmNlKTsKIAotCWlmIChzb3VyY2VbbGVuXSA9PSAnXG4nKQotCQlzb3VyY2VbbGVu
XSA9ICdcMCc7CisJaWYgKHNvdXJjZVtsZW4tMV0gPT0gJ1xuJykKKwkJc291cmNlW2xlbi0xXSA9
ICdcMCc7CiAKIAlyZXQgPSBjcnRjLT5mdW5jcy0+dmVyaWZ5X2NyY19zb3VyY2UoY3J0Yywgc291
cmNlLCAmdmFsdWVzX2NudCk7CiAJaWYgKHJldCkKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
