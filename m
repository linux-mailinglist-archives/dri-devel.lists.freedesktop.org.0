Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF835200E8
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 10:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6845689257;
	Thu, 16 May 2019 08:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750059.outbound.protection.outlook.com [40.107.75.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D846E89257
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 08:07:23 +0000 (UTC)
Received: from DM5PR12CA0021.namprd12.prod.outlook.com (2603:10b6:4:1::31) by
 BYAPR12MB2663.namprd12.prod.outlook.com (2603:10b6:a03:69::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Thu, 16 May 2019 08:07:21 +0000
Received: from DM3NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by DM5PR12CA0021.outlook.office365.com
 (2603:10b6:4:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Thu, 16 May 2019 08:07:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT007.mail.protection.outlook.com (10.152.82.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Thu, 16 May 2019 08:07:20 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 16 May 2019
 03:07:19 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <Christian.Koenig@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm 1/7] add cs chunk for syncobj timeline
Date: Thu, 16 May 2019 16:07:08 +0800
Message-ID: <20190516080714.14980-1-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(396003)(376002)(346002)(39860400002)(2980300002)(428003)(199004)(189003)(53936002)(68736007)(16586007)(36756003)(1076003)(50226002)(126002)(4744005)(48376002)(4326008)(81166006)(81156014)(316002)(8936002)(50466002)(7696005)(86362001)(51416003)(8676002)(336012)(2906002)(186003)(70586007)(486006)(70206006)(26005)(53416004)(47776003)(426003)(110136005)(305945005)(72206003)(478600001)(2616005)(6666004)(356004)(77096007)(5660300002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2663; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c180a905-c2b8-4c68-4a57-08d6d9d5856e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BYAPR12MB2663; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2663:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2663F2A1F9ADD5625B13DD9AB40A0@BYAPR12MB2663.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:276;
X-Forefront-PRVS: 0039C6E5C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 1XKU8wIDRWDMzXVwlwtdhLf7GwFGUB2GsfF5lISxyM3tIPezXVNLgftXagECyACHHP+X61ZTBBvXumkImvPaGsXsXqGSGXesUzmApmJARt/1dTCyADvIh0ne3pcnTo6GZ/I7rdenMtyjy1RVWUALfU03bXu/kSlm8t/CXgrxgjd342YO3uQOGz8KIO931YNmn1zU6bvYW9iJXKCfl3QRTj5RI2WndiE1ZZTdtpvqLx6lj+SYy20WGDqnjfVJncEKpBgn5C3MwBzRrKs5N6DwJom4cZlPTwpduinlEJy6Shig3BQUZ3wlwAwsr7kLWn7YRjV//Au6f+6zTb4OEBxbSLqDAEMy3LB6Ih7RlC0CnGIuLwcr2cZJYScuXzQwU7YXrtYC34tibNRkihcNexuOHxzMkzRPsQxeKjfIPKqqbXo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2019 08:07:20.8272 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c180a905-c2b8-4c68-4a57-08d6d9d5856e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2663
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFR4mfv1rWJmctpJleX9AIAXagTnL4OOFqFERyv5I1Q=;
 b=yn8l7hwUpyiFPaEuw4G1j4t2RsO0LKdK6YMq38nOeoh/AgnWU8AI4yGZaG4C6RtwqzY4WS+53HMyRYGp/8S9LsHo9NRNtvORLrgC0/AMgfKQmZGD9s4Sj1ThyqlkKtljYowWwZEnpBlyUWjj41i0vKFxRLdBDhKBGZlCNiyzPmI=
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

U2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4KQWNrZWQt
Ynk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4KLS0t
CiBpbmNsdWRlL2RybS9hbWRncHVfZHJtLmggfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2FtZGdwdV9kcm0uaCBi
L2luY2x1ZGUvZHJtL2FtZGdwdV9kcm0uaAppbmRleCBkMDcwMWZmYy4uM2QwMzE4ZTYgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvZHJtL2FtZGdwdV9kcm0uaAorKysgYi9pbmNsdWRlL2RybS9hbWRncHVf
ZHJtLmgKQEAgLTUyOCw2ICs1MjgsOCBAQCBzdHJ1Y3QgZHJtX2FtZGdwdV9nZW1fdmEgewogI2Rl
ZmluZSBBTURHUFVfQ0hVTktfSURfU1lOQ09CSl9PVVQgICAgIDB4MDUKICNkZWZpbmUgQU1ER1BV
X0NIVU5LX0lEX0JPX0hBTkRMRVMgICAgICAweDA2CiAjZGVmaW5lIEFNREdQVV9DSFVOS19JRF9T
Q0hFRFVMRURfREVQRU5ERU5DSUVTCTB4MDcKKyNkZWZpbmUgQU1ER1BVX0NIVU5LX0lEX1NZTkNP
QkpfVElNRUxJTkVfV0FJVCAgICAweDA4CisjZGVmaW5lIEFNREdQVV9DSFVOS19JRF9TWU5DT0JK
X1RJTUVMSU5FX1NJR05BTCAgMHgwOQogCiBzdHJ1Y3QgZHJtX2FtZGdwdV9jc19jaHVuayB7CiAJ
X191MzIJCWNodW5rX2lkOwpAQCAtNjA4LDYgKzYxMCwxMyBAQCBzdHJ1Y3QgZHJtX2FtZGdwdV9j
c19jaHVua19zZW0gewogCV9fdTMyIGhhbmRsZTsKIH07CiAKK3N0cnVjdCBkcm1fYW1kZ3B1X2Nz
X2NodW5rX3N5bmNvYmogeworCV9fdTMyIGhhbmRsZTsKKwlfX3UzMiBmbGFnczsKKwlfX3U2NCBw
b2ludDsKK307CisKKwogI2RlZmluZSBBTURHUFVfRkVOQ0VfVE9fSEFORExFX0dFVF9TWU5DT0JK
CTAKICNkZWZpbmUgQU1ER1BVX0ZFTkNFX1RPX0hBTkRMRV9HRVRfU1lOQ09CSl9GRAkxCiAjZGVm
aW5lIEFNREdQVV9GRU5DRV9UT19IQU5ETEVfR0VUX1NZTkNfRklMRV9GRAkyCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
