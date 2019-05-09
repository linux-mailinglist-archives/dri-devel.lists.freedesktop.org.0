Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EF21940A
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 23:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1924389CDB;
	Thu,  9 May 2019 21:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700063.outbound.protection.outlook.com [40.107.70.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5077389CCE;
 Thu,  9 May 2019 21:04:51 +0000 (UTC)
Received: from MWHPR12CA0034.namprd12.prod.outlook.com (2603:10b6:301:2::20)
 by SN6PR12MB2671.namprd12.prod.outlook.com (2603:10b6:805:6f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.21; Thu, 9 May
 2019 21:04:49 +0000
Received: from CO1NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by MWHPR12CA0034.outlook.office365.com
 (2603:10b6:301:2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Thu, 9 May 2019 21:04:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT005.mail.protection.outlook.com (10.152.80.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Thu, 9 May 2019 21:04:48 +0000
Received: from kho-5039A.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 9 May 2019
 16:04:43 -0500
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <Kenny.Ho@amd.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <sunnanyong@huawei.com>, <alexander.deucher@amd.com>,
 <brian.welty@intel.com>
Subject: [RFC PATCH v2 3/5] drm/amdgpu: Register AMD devices for DRM cgroup
Date: Thu, 9 May 2019 17:04:08 -0400
Message-ID: <20190509210410.5471-4-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509210410.5471-1-Kenny.Ho@amd.com>
References: <20181120185814.13362-1-Kenny.Ho@amd.com>
 <20190509210410.5471-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(476003)(2616005)(126002)(72206003)(336012)(81156014)(305945005)(81166006)(486006)(53416004)(7696005)(36756003)(426003)(446003)(51416003)(11346002)(2870700001)(2906002)(6666004)(478600001)(76176011)(8936002)(47776003)(316002)(1076003)(77096007)(26005)(70586007)(70206006)(48376002)(2201001)(356004)(86362001)(50226002)(50466002)(8676002)(110136005)(53936002)(68736007)(5660300002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2671; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b43026b-8ffb-4019-38bb-08d6d4c1f8f4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:SN6PR12MB2671; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2671:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2671C4577A431013A94BA4A183330@SN6PR12MB2671.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 003245E729
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: MPYqT7IjpALzQyud7sj3ZC1neMDLVqQ9PTQBmy9eRsk4/7/VdC3dk0fEJTW5qvaFReyND1socHkpealQbUON3b20/uB0WzHf2ePVgqoi+GUsOkA9vYsT83gjwbhtGMtG4F1iCU2MZWWI0VnhDF+8gQEcmo07Yf6U7QfJYsqF8Bp6gggxh21YiCXSwI2wv5t5551PCiHOzhQoMlTSNNgcKaAzlBLYlmU5zjRNnPCc/OjFjTQXhLYQ23sW1PW5Eq2ai++6Z06xqmMSwKrafjPPRKHs2v9Ttf75yawGqceZCDMOZdd8MVM2VKJPZfjYAqhuYRpWuVD+UtO3kwalx9QSrgL8sbhdBiEVyLcK9/Wifjm1v5lSQnoFy7tkKf/waXxFjzSJ+3yx0IrUEKMR1MMxr9J4MyRIBeNcO2wxs6B3pY0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2019 21:04:48.7103 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b43026b-8ffb-4019-38bb-08d6d4c1f8f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2671
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0p3P4yVdgVx46kHS0E6T83+GWZwfheVmXlIy09vAgIk=;
 b=WsBq3K/Tc7Gn9tdmTGQntaQcOuhQf14sKmWxNLajbdZVhoJAUHPCCwQKGPhYz1wXcirVbzxLtseGix1riQXLybhsqbHbeEy8gE+EcOIKKmBM4iw6pWuhMSXYC6A/yMiYHCVxIRpmdjh34yAGZZPWI+X9CmwtEWgAKAcU1Du10TQ=
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
