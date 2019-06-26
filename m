Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE0856D2D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 17:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2706E45C;
	Wed, 26 Jun 2019 15:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680065.outbound.protection.outlook.com [40.107.68.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACE06E45C;
 Wed, 26 Jun 2019 15:05:34 +0000 (UTC)
Received: from MWHPR12CA0063.namprd12.prod.outlook.com (10.175.47.153) by
 DM5PR1201MB0028.namprd12.prod.outlook.com (10.174.109.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 15:05:33 +0000
Received: from DM3NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by MWHPR12CA0063.outlook.office365.com
 (2603:10b6:300:103::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.16 via Frontend
 Transport; Wed, 26 Jun 2019 15:05:32 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT041.mail.protection.outlook.com (10.152.83.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2032.15 via Frontend Transport; Wed, 26 Jun 2019 15:05:31 +0000
Received: from kho-5039A.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 26 Jun 2019
 10:05:28 -0500
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <joseph.greathouse@amd.com>, <jsparks@cray.com>, <lkaplan@cray.com>
Subject: [RFC PATCH v3 03/11] drm/amdgpu: Register AMD devices for DRM cgroup
Date: Wed, 26 Jun 2019 11:05:14 -0400
Message-ID: <20190626150522.11618-4-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626150522.11618-1-Kenny.Ho@amd.com>
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(136003)(376002)(2980300002)(428003)(189003)(199004)(6666004)(76176011)(110136005)(72206003)(5660300002)(53936002)(51416003)(4326008)(70206006)(26005)(77096007)(1076003)(86362001)(186003)(70586007)(7696005)(316002)(336012)(356004)(2201001)(81166006)(8936002)(446003)(11346002)(8676002)(53416004)(426003)(2870700001)(2906002)(68736007)(81156014)(36756003)(478600001)(48376002)(50466002)(47776003)(305945005)(486006)(50226002)(476003)(126002)(2616005)(921003)(83996005)(1121003)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0028; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7b2eeb1-c104-40a8-0e6b-08d6fa47bc0a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB0028; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0028:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0028E78E3ACD336A8F9CF7A683E20@DM5PR1201MB0028.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 00808B16F3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: TuCmM08DqKMLJyKydIc52jYl4x3WFKzX6X6mgvW8UH/27BrK31SNwH9UTXV3F+aCfiJ03cco0iVqFEmLxwgzuAROZ0KoxhfVigED+HJuBLC4a4/qKnMg8t/a+3ZjHmOeKlHrWJaS87sRobQnAEi4CmZ201fHn+xVv2i+tMKxnM12pjktVH/jsg5qm7cdk4k0DpTRL4Xn/1LiqN+qNZ+80X6Nhp9o8AdGbP2KMx6k8vsBYzZTWv1KvB8G8Y9OaKywVeIvSBuIKbuZGQPltd67cZYTTeHYVj7O28lOJ3U4WAk5vzCD087skZXAlEyyV5XZ6xGAm3M2kzjTiOExcRBjTW/mc3EykVJt81lZETv+aUi+tB/mGfkvbSpHsS+auJ5kWP7I9ixFI4gai8Wd+WxWuPrx7TPHFig6Yma4BOwUYbI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2019 15:05:31.8847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b2eeb1-c104-40a8-0e6b-08d6fa47bc0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0028
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0p3P4yVdgVx46kHS0E6T83+GWZwfheVmXlIy09vAgIk=;
 b=BJvEOfUZzCWXKzkhai4oFHWv2Yhu22FMzt3u6I+s1v1YWSx6ycTjGv44xtk2cUHWlH2Bc7rql0aUQsU/WNzp/W+g5oflAHZ15ibobYjwas1KCpVNEQtW2ADHKDiHEfzVPbTTm5T+vG+2OP5EUMBAl2BFLHnQVdsdg2bPtbb6rSE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=permerror action=none header.from=amd.com;
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
Cc: Kenny Ho <Kenny.Ho@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hhbmdlLUlkOiBJMzc1MGZjNjU3Yjk1NmI1Mjc1MGEzNmNiMzAzYzU0ZmE2YTI2NWI0NApTaWdu
ZWQtb2ZmLWJ5OiBLZW5ueSBIbyA8S2VubnkuSG9AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMKaW5kZXgg
ZGE3YjRmZThhZGUzLi4yNTY4ZmQ3MzAxNjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfa21zLmMKQEAgLTI4LDYgKzI4LDcgQEAKICNpbmNsdWRlIDxkcm0vZHJtUC5oPgogI2lu
Y2x1ZGUgImFtZGdwdS5oIgogI2luY2x1ZGUgPGRybS9hbWRncHVfZHJtLmg+CisjaW5jbHVkZSA8
ZHJtL2RybV9jZ3JvdXAuaD4KICNpbmNsdWRlICJhbWRncHVfc2NoZWQuaCIKICNpbmNsdWRlICJh
bWRncHVfdXZkLmgiCiAjaW5jbHVkZSAiYW1kZ3B1X3ZjZS5oIgpAQCAtOTcsNiArOTgsNyBAQCB2
b2lkIGFtZGdwdV9kcml2ZXJfdW5sb2FkX2ttcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCiAJ
YW1kZ3B1X2RldmljZV9maW5pKGFkZXYpOwogCisJZHJtY2dycF91bnJlZ2lzdGVyX2RldmljZShk
ZXYpOwogZG9uZV9mcmVlOgogCWtmcmVlKGFkZXYpOwogCWRldi0+ZGV2X3ByaXZhdGUgPSBOVUxM
OwpAQCAtMTQxLDYgKzE0Myw4IEBAIGludCBhbWRncHVfZHJpdmVyX2xvYWRfa21zKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCiAJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXY7CiAJaW50IHIsIGFjcGlfc3RhdHVzOwogCisJZHJtY2dycF9yZWdpc3Rlcl9kZXZp
Y2UoZGV2KTsKKwogI2lmZGVmIENPTkZJR19EUk1fQU1ER1BVX1NJCiAJaWYgKCFhbWRncHVfc2lf
c3VwcG9ydCkgewogCQlzd2l0Y2ggKGZsYWdzICYgQU1EX0FTSUNfTUFTSykgewotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
