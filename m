Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7271611B
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 11:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BE289FA9;
	Tue,  7 May 2019 09:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690084.outbound.protection.outlook.com [40.107.69.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6CF89F9F;
 Tue,  7 May 2019 09:36:54 +0000 (UTC)
Received: from DM5PR12CA0067.namprd12.prod.outlook.com (2603:10b6:3:103::29)
 by MWHPR12MB1151.namprd12.prod.outlook.com (2603:10b6:300:e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.10; Tue, 7 May
 2019 09:36:52 +0000
Received: from BY2NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by DM5PR12CA0067.outlook.office365.com
 (2603:10b6:3:103::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.11 via Frontend
 Transport; Tue, 7 May 2019 09:36:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT014.mail.protection.outlook.com (10.152.84.239) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 7 May 2019 09:36:51 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 7 May 2019
 04:36:50 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <Christian.Koenig@amd.com>, <Prike.Liang@amd.com>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/display: use ttm_eu_reserve_buffers instead of
 amdgpu_bo_reserve
Date: Tue, 7 May 2019 17:36:42 +0800
Message-ID: <20190507093642.7859-2-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507093642.7859-1-david1.zhou@amd.com>
References: <20190507093642.7859-1-david1.zhou@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(346002)(136003)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(1076003)(356004)(48376002)(50226002)(50466002)(4326008)(450100002)(53936002)(7696005)(51416003)(70206006)(316002)(72206003)(6666004)(478600001)(36756003)(76176011)(14444005)(16586007)(110136005)(53416004)(8676002)(8936002)(81166006)(81156014)(2906002)(70586007)(446003)(426003)(486006)(476003)(11346002)(126002)(305945005)(86362001)(68736007)(2201001)(2616005)(26005)(47776003)(5660300002)(336012)(186003)(77096007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1151; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c458a4e2-99b3-4501-7346-08d6d2cf8926
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:MWHPR12MB1151; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1151:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1151A5EC421BA263A51EF4A4B4310@MWHPR12MB1151.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-Forefront-PRVS: 0030839EEE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ZjnWALxOFJsXglNW6tsQmkZTy5GjSsi+8F5m5R0Gxqj9rArSY4+2sr4MgSL7MrxfaW3NXIhxaZUVwnUVb04dF9fWY00ZEr0ubV9QYxLIRn2rH9kXLTBVQ1M8VULWajprE8zn24wSWVHo8ZVBYVFn97xUWjLeEr1NLLbUfa4aA5H2zXtnsArHW++4b/eTKbpHI+utDiDv36CbiIyaUqI1egE8bkKQjFsS4BJoUl8tIeuKJC67znO8RkIkAh0yODTqWrG59TGPRnIRONIUdn/1XkJl6xN4jJvFi2u30OjSUvXPEhZJ27LUWWFHWXyuPt0lQmq9BBp46Drb74rMB5QtthvHPpTSsPKXcvjL23S7rMCYefjIGnZFLqj8Qng6ib4H0blbxdYc0d8bP2n6y/vyjhnrOOYJs5EA3z7dLn34qbs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2019 09:36:51.8594 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c458a4e2-99b3-4501-7346-08d6d2cf8926
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1151
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VpKGti5paKw92iz7sa7PLncYr4Be9H6RTlDFHqpEcs=;
 b=1KJD/hqOXZ8bnTimPO3HRoOdjICYu9IWXxJ5LBbm/TNwtPTG6fGFGxuC0dnsXYwM+h27ExBpcusBKDbAq0X04oR/gK0eoKigbcqIFTEbpMQ2MrLHPFfdoNKT9g4jtC2g3A+7tKEiDPOJqnLSy4vhFE+kf5OjfjWLy83QuH5h22k=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YWRkIHRpY2tldCBmb3IgZGlzcGxheSBibywgc28gdGhhdCBpdCBjYW4gcHJlZW1wdCBidXN5IGJv
LgoKQ2hhbmdlLUlkOiBJOWYwMzFjZGNjODI2N2RlMDBlODE5YWUzMDNiYWEwYTUyZGY4ZWJiOQpT
aWduZWQtb2ZmLWJ5OiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhvdUBhbWQuY29tPgotLS0KIC4u
Li9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDIyICsrKysrKysr
KysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jCmluZGV4IGFjMjJmNzM1MWE0Mi4uODYzM2Q1MmUzZmJlIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTQxNzYsNiAr
NDE3Niw5IEBAIHN0YXRpYyBpbnQgZG1fcGxhbmVfaGVscGVyX3ByZXBhcmVfZmIoc3RydWN0IGRy
bV9wbGFuZSAqcGxhbmUsCiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXY7CiAJc3RydWN0IGFt
ZGdwdV9ibyAqcmJvOwogCXN0cnVjdCBkbV9wbGFuZV9zdGF0ZSAqZG1fcGxhbmVfc3RhdGVfbmV3
LCAqZG1fcGxhbmVfc3RhdGVfb2xkOworCXN0cnVjdCBsaXN0X2hlYWQgbGlzdCwgZHVwbGljYXRl
czsKKwlzdHJ1Y3QgdHRtX3ZhbGlkYXRlX2J1ZmZlciB0djsKKwlzdHJ1Y3Qgd3dfYWNxdWlyZV9j
dHggdGlja2V0OwogCXVpbnQ2NF90IHRpbGluZ19mbGFnczsKIAl1aW50MzJfdCBkb21haW47CiAJ
aW50IHI7CkBAIC00MTkyLDkgKzQxOTUsMTggQEAgc3RhdGljIGludCBkbV9wbGFuZV9oZWxwZXJf
cHJlcGFyZV9mYihzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAlvYmogPSBuZXdfc3RhdGUtPmZi
LT5vYmpbMF07CiAJcmJvID0gZ2VtX3RvX2FtZGdwdV9ibyhvYmopOwogCWFkZXYgPSBhbWRncHVf
dHRtX2FkZXYocmJvLT50Ym8uYmRldik7Ci0JciA9IGFtZGdwdV9ib19yZXNlcnZlKHJibywgZmFs
c2UpOwotCWlmICh1bmxpa2VseShyICE9IDApKQorCUlOSVRfTElTVF9IRUFEKCZsaXN0KTsKKwlJ
TklUX0xJU1RfSEVBRCgmZHVwbGljYXRlcyk7CisKKwl0di5ibyA9ICZyYm8tPnRibzsKKwl0di5u
dW1fc2hhcmVkID0gMTsKKwlsaXN0X2FkZCgmdHYuaGVhZCwgJmxpc3QpOworCisJciA9IHR0bV9l
dV9yZXNlcnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3QsIGZhbHNlLCAmZHVwbGljYXRlcyk7CisJ
aWYgKHIpIHsKKwkJZGV2X2VycihhZGV2LT5kZXYsICJmYWlsIHRvIHJlc2VydmUgYm8gKCVkKVxu
Iiwgcik7CiAJCXJldHVybiByOworCX0KIAogCWlmIChwbGFuZS0+dHlwZSAhPSBEUk1fUExBTkVf
VFlQRV9DVVJTT1IpCiAJCWRvbWFpbiA9IGFtZGdwdV9kaXNwbGF5X3N1cHBvcnRlZF9kb21haW5z
KGFkZXYpOwpAQCAtNDIwNSwyMSArNDIxNywyMSBAQCBzdGF0aWMgaW50IGRtX3BsYW5lX2hlbHBl
cl9wcmVwYXJlX2ZiKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogCWlmICh1bmxpa2VseShyICE9
IDApKSB7CiAJCWlmIChyICE9IC1FUkVTVEFSVFNZUykKIAkJCURSTV9FUlJPUigiRmFpbGVkIHRv
IHBpbiBmcmFtZWJ1ZmZlciB3aXRoIGVycm9yICVkXG4iLCByKTsKLQkJYW1kZ3B1X2JvX3VucmVz
ZXJ2ZShyYm8pOworCQl0dG1fZXVfYmFja29mZl9yZXNlcnZhdGlvbigmdGlja2V0LCAmbGlzdCk7
CiAJCXJldHVybiByOwogCX0KIAogCXIgPSBhbWRncHVfdHRtX2FsbG9jX2dhcnQoJnJiby0+dGJv
KTsKIAlpZiAodW5saWtlbHkociAhPSAwKSkgewogCQlhbWRncHVfYm9fdW5waW4ocmJvKTsKLQkJ
YW1kZ3B1X2JvX3VucmVzZXJ2ZShyYm8pOworCQl0dG1fZXVfYmFja29mZl9yZXNlcnZhdGlvbigm
dGlja2V0LCAmbGlzdCk7CiAJCURSTV9FUlJPUigiJXAgYmluZCBmYWlsZWRcbiIsIHJibyk7CiAJ
CXJldHVybiByOwogCX0KIAogCWFtZGdwdV9ib19nZXRfdGlsaW5nX2ZsYWdzKHJibywgJnRpbGlu
Z19mbGFncyk7CiAKLQlhbWRncHVfYm9fdW5yZXNlcnZlKHJibyk7CisJdHRtX2V1X2JhY2tvZmZf
cmVzZXJ2YXRpb24oJnRpY2tldCwgJmxpc3QpOwogCiAJYWZiLT5hZGRyZXNzID0gYW1kZ3B1X2Jv
X2dwdV9vZmZzZXQocmJvKTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
