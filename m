Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3552CC3A40
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 18:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BB56E854;
	Tue,  1 Oct 2019 16:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700083.outbound.protection.outlook.com [40.107.70.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5D26E854;
 Tue,  1 Oct 2019 16:17:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWeYOiY5EwlJHSJ9a52VaxH2q00gU95XYlY2le2B1r9Fe2A0nQ680/gOeYPwPblQXy7P2khbmcmt7liIwrISmHEasRBsZv4oSR+Wqc6HNuOibIhv0FSJD3StATrvhZ9bRVgTMoPvYkicnKzhEwUMDW3m8BoFxuPqdmfrJmC3psZAiyVQs1W6dq4nrc07Czqe0/tqkj5kMO1+z1Sklun40lA/BuewDLiBp85F5noH3FcyTeENTVN1z58DxV3xsOzoT16t22hDX3ZcJJUqjuUdRTMJtfxKyutHAZtZfRu1Zc7ZClQgcEdqZ5vZ2nOgdFqPaqilgyIJV2qRZ8X9yr+lbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtUHwiSB+5ThPSMYYFafCbyqjBOcl+keepUKwIkBAYA=;
 b=SVaMFDOQSBxKpQTKMme+U0AE0D/gdZKtujd6CZT8a90BRD96UMNv32OH47nKGp7mFe/cigCfTgmU1T3qfDDanqxs8Eu4XxFjkigkDiPVeJiDWVAN5de29I5zCP5TnfbQHzAyFZwU6IWD/8698a+lfJpvUMtcivbMX7dVvbfAVkMiq8MPMXIFuh6Q9gCszI6VUvtCOKNSOhPni5ldRIQSv6KbYQmLvT8JSiXu47fR7+mHfKXqMYc+/BHGksj4V8VQclboyJRwI2gxXL3KOufqaFAnxx3x1D2KPUp3XGSjxW9o5lDegZhu9rAIOtRg5/s8bbnFJl9WBsFaH6R+YVynpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0101.namprd12.prod.outlook.com (2603:10b6:0:55::21) by
 DM5PR12MB2358.namprd12.prod.outlook.com (2603:10b6:4:b3::34) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Tue, 1 Oct 2019 16:17:44 +0000
Received: from CO1NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by DM3PR12CA0101.outlook.office365.com
 (2603:10b6:0:55::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Tue, 1 Oct 2019 16:17:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT051.mail.protection.outlook.com (10.152.80.242) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 16:17:43 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 1 Oct 2019
 11:17:35 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/14] drm/amd/display: Initialize DSC PPS variables to 0
Date: Tue, 1 Oct 2019 12:17:16 -0400
Message-ID: <20191001161721.13793-10-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001161721.13793-9-mikita.lipski@amd.com>
References: <20191001161721.13793-1-mikita.lipski@amd.com>
 <20191001161721.13793-2-mikita.lipski@amd.com>
 <20191001161721.13793-3-mikita.lipski@amd.com>
 <20191001161721.13793-4-mikita.lipski@amd.com>
 <20191001161721.13793-5-mikita.lipski@amd.com>
 <20191001161721.13793-6-mikita.lipski@amd.com>
 <20191001161721.13793-7-mikita.lipski@amd.com>
 <20191001161721.13793-8-mikita.lipski@amd.com>
 <20191001161721.13793-9-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(428003)(199004)(189003)(336012)(186003)(11346002)(1076003)(450100002)(426003)(5660300002)(86362001)(305945005)(446003)(2616005)(53416004)(2351001)(50466002)(26005)(4326008)(6666004)(356004)(6916009)(48376002)(54906003)(51416003)(50226002)(486006)(8676002)(8936002)(2876002)(2906002)(126002)(81166006)(81156014)(76176011)(70206006)(47776003)(36756003)(16586007)(316002)(70586007)(478600001)(476003)(7696005)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2358; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90de3c1c-9076-472c-ad96-08d7468ae41e
X-MS-TrafficTypeDiagnostic: DM5PR12MB2358:
X-Microsoft-Antispam-PRVS: <DM5PR12MB23585873CF26DE81C47DCAD1E49D0@DM5PR12MB2358.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-Forefront-PRVS: 0177904E6B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Wt2lCMHbN2Q+S6tTLL4KV/uiIqHAKwIOiKDuVDavdCEzOqyooLIW6j+4b6mVkwdoVw0+1HiqtDIGN+eL7TUL9YKsmhXIBV0fm/ynO7wsn8nyw2XSCXf4r/gcg3aPzFehEMB8rN2ofv5K2CTiOqX/P+q6dQDIyxiTrVk5J47g8pnoUaQnBOv9h7yfw+uU4ulZlfD0rVmnDsdjcTzXwxXfYs7GBjkt6iVIKXctvpF5FuFBiVTj4BvRcUad8qYFy1cKZ6houAXSOOwJU2/JnoARo3PdipdXdy8lgCdN01cCtk2mBHSOecxRHNvtwjoy7R2cU0bCu2bKP9PdrFNX8dQR2G0iD5nZxYKjvXnb0vyzI4vwvCrybTLqL6PGKfVBI7pSCuePLITAkO1VVr1prSNu1sEWyMRtRLLvTKaaz5I+cE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 16:17:43.2173 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90de3c1c-9076-472c-ad96-08d7468ae41e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2358
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtUHwiSB+5ThPSMYYFafCbyqjBOcl+keepUKwIkBAYA=;
 b=ETsvTXo/clTKTvllM9irsbOttEoKOSeZLUtIpojZcyzl+xA5JoooHMAjkHpuouQSD0E2k/dKU7a1Iaw8bV0l238R7gcO0w0KhmaNS0NsT8/SHqXHiQzVZ8b2JWQve4Lhcvy2ftJTT+L4GFaRrPcx54t9NqmSo2DAwWyb+hmLWYA=
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

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKRm9yIERTQyBNU1Qs
IHNvbWV0aW1lcyBtb25pdG9ycyB3b3VsZCBicmVhayBvdXQKaW4gZnVsbC1zY3JlZW4gc3RhdGlj
LiBUaGUgaXNzdWUgdHJhY2VkIGJhY2sgdG8gdGhlClBQUyBnZW5lcmF0aW9uIGNvZGUsIHdoZXJl
IHRoZXNlIHZhcmlhYmxlcyB3ZXJlIGJlaW5nIHVzZWQKdW5pbml0aWFsaXplZCBhbmQgd2VyZSBw
aWNraW5nIHVwIGdhcmJhZ2UuCgptZW1zZXQgdG8gMCB0byBhdm9pZCB0aGlzCgpSZXZpZXdlZC1i
eTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19od3NzLmMgfCAzICsrKwog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jICAgfCAzICsr
KwogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfaHdzcy5jCmluZGV4IGE1MTlkYmM1ZWNi
Ni4uNWQ2Y2JhZWJlYmMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rX2h3c3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rX2h3c3MuYwpAQCAtNDk2LDYgKzQ5Niw5IEBAIGJvb2wgZHBfc2V0X2Rz
Y19wcHNfc2RwKHN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgsIGJvb2wgZW5hYmxlKQogCQlzdHJ1
Y3QgZHNjX2NvbmZpZyBkc2NfY2ZnOwogCQl1aW50OF90IGRzY19wYWNrZWRfcHBzWzEyOF07CiAK
KwkJbWVtc2V0KCZkc2NfY2ZnLCAwLCBzaXplb2YoZHNjX2NmZykpOworCQltZW1zZXQoZHNjX3Bh
Y2tlZF9wcHMsIDAsIDEyOCk7CisKIAkJLyogRW5hYmxlIERTQyBodyBibG9jayAqLwogCQlkc2Nf
Y2ZnLnBpY193aWR0aCA9IHN0cmVhbS0+dGltaW5nLmhfYWRkcmVzc2FibGUgKyBzdHJlYW0tPnRp
bWluZy5oX2JvcmRlcl9sZWZ0ICsgc3RyZWFtLT50aW1pbmcuaF9ib3JkZXJfcmlnaHQ7CiAJCWRz
Y19jZmcucGljX2hlaWdodCA9IHN0cmVhbS0+dGltaW5nLnZfYWRkcmVzc2FibGUgKyBzdHJlYW0t
PnRpbWluZy52X2JvcmRlcl90b3AgKyBzdHJlYW0tPnRpbWluZy52X2JvcmRlcl9ib3R0b207CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNj
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMKaW5k
ZXggNjNlYjM3N2VkOWMwLi4yOTZlZWZmMDAyOTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMKQEAgLTIwNyw2ICsyMDcsOSBAQCBzdGF0
aWMgYm9vbCBkc2MyX2dldF9wYWNrZWRfcHBzKHN0cnVjdCBkaXNwbGF5X3N0cmVhbV9jb21wcmVz
c29yICpkc2MsIGNvbnN0IHN0cgogCXN0cnVjdCBkc2NfcmVnX3ZhbHVlcyBkc2NfcmVnX3ZhbHM7
CiAJc3RydWN0IGRzY19vcHRjX2NvbmZpZyBkc2Nfb3B0Y19jZmc7CiAKKwltZW1zZXQoJmRzY19y
ZWdfdmFscywgMCwgc2l6ZW9mKGRzY19yZWdfdmFscykpOworCW1lbXNldCgmZHNjX29wdGNfY2Zn
LCAwLCBzaXplb2YoZHNjX29wdGNfY2ZnKSk7CisKIAlEQ19MT0dfRFNDKCJHZXR0aW5nIHBhY2tl
ZCBEU0MgUFBTIGZvciBEU0MgQ29uZmlnOiIpOwogCWRzY19jb25maWdfbG9nKGRzYywgZHNjX2Nm
Zyk7CiAJRENfTE9HX0RTQygiRFNDIFBpY3R1cmUgUGFyYW1ldGVyIFNldCAoUFBTKToiKTsKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
