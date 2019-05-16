Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC7820B1E
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 17:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12BC789762;
	Thu, 16 May 2019 15:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720045.outbound.protection.outlook.com [40.107.72.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC2489745;
 Thu, 16 May 2019 15:26:54 +0000 (UTC)
Received: from SN1PR12CA0084.namprd12.prod.outlook.com (2603:10b6:802:21::19)
 by BYAPR12MB2662.namprd12.prod.outlook.com (2603:10b6:a03:69::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.16; Thu, 16 May
 2019 15:26:53 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by SN1PR12CA0084.outlook.office365.com
 (2603:10b6:802:21::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Thu, 16 May 2019 15:26:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Thu, 16 May 2019 15:26:52 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 16 May 2019
 10:26:51 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/7] drm/dp: Use non-cyclic idr
Date: Thu, 16 May 2019 11:17:57 -0400
Message-ID: <1558019883-12397-2-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
References: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(70206006)(70586007)(478600001)(5660300002)(2876002)(356004)(11346002)(50466002)(72206003)(53936002)(76176011)(2906002)(23676004)(36756003)(5820100001)(14444005)(2870700001)(4744005)(7696005)(66574012)(110136005)(450100002)(86362001)(4326008)(305945005)(53416004)(486006)(81166006)(81156014)(2616005)(476003)(8676002)(50226002)(8936002)(446003)(426003)(68736007)(86152003)(336012)(47776003)(126002)(316002)(77096007)(26005)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2662; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 706a1c21-af59-4c3e-c8e3-08d6da12ec5d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BYAPR12MB2662; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2662:
X-Microsoft-Antispam-PRVS: <BYAPR12MB26620789CB0793F6C3595CF8820A0@BYAPR12MB2662.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0039C6E5C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: hregTiQQ5S7o4QgNWah0gYeNqY6k6tOSL6RGPmB4xzjF+ZgIqNvnzk6cL0zpw2wWPnFi+SFUaq3r+55489CLKwxWjizGVIF6a5ud2lZJWE/gPvt0UpQK0nEVU2w3qNHktL9lDkoXbS2wOE640C+d67D/UhQuVQ0veByu5dPbSmmZHpyaFyd+VYVR621r2ebbwpPm05TIsIc7CSXF8wfaB1FOQBeeQe/EaGpUqqNjZoGhLt9a3ZDdlE4f0C1g34+TApAsYLFCSqF/KSJqE048dsvwBnc8/4c7Sy7JtWCP2CpS2TiPd1K5R3GAzE6j9IfG14qIS+JmBneJH4gsledKBQTklNZq5IqvPuXX0En++GGUnxDpWSPXBeQ8Gy5fN1k2hOFNDqi5G75+RMvB3WTh1m8NPMk8rbxBofoYCZ0EpyQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2019 15:26:52.7868 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 706a1c21-af59-4c3e-c8e3-08d6da12ec5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2662
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9qxSsTucJuLeS3qoHfCo4hXm/pAnJLpq41ImhUUq/0=;
 b=cTF/RhahGWSgWWKaJMiOaZ5x2TJd7cQq9YLUUb1b4cv7aDod+Q6ou3IcNWTOllDOoO8qx0e6fKJ1/FQJttc7/WOKYF8tVsjSxD1DqQ9s5gQh1fz/89dmdizcHWnav40Qclgces3x2TTHLaoxUjrB65z1Tbedk8KlDb1H/+Uv8VM=
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
Cc: Leo Li <sunpeng.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpJbiBwcmVwYXJhdGlvbiBmb3IgYWRk
aW5nIGF1eCBkZXZpY2VzIGZvciBEUCBNU1QsIG1ha2UgdGhlIElEUgpub24tY3ljbGljLiBUaGF0
IHdheSwgaG90cGx1ZyBjeWNsaW5nIE1TVCBkZXZpY2VzIHdvbid0IG5lZWRsZXNzbHkKaW5jcmVt
ZW50IHRoZSBtaW5vciB2ZXJzaW9uIGluZGV4LgoKU2lnbmVkLW9mZi1ieTogTGVvIExpIDxzdW5w
ZW5nLmxpQGFtZC5jb20+ClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29t
PgpSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYyB8IDMgKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9hdXhfZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X2F1eF9kZXYuYwppbmRleCAwZTRmMjVkLi42ZDg0NjExIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX2F1eF9kZXYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9k
ZXYuYwpAQCAtODAsOCArODAsNyBAQCBzdGF0aWMgc3RydWN0IGRybV9kcF9hdXhfZGV2ICphbGxv
Y19kcm1fZHBfYXV4X2RldihzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4KQogCWtyZWZfaW5pdCgmYXV4
X2Rldi0+cmVmY291bnQpOwogCiAJbXV0ZXhfbG9jaygmYXV4X2lkcl9tdXRleCk7Ci0JaW5kZXgg
PSBpZHJfYWxsb2NfY3ljbGljKCZhdXhfaWRyLCBhdXhfZGV2LCAwLCBEUk1fQVVYX01JTk9SUywK
LQkJCQkgR0ZQX0tFUk5FTCk7CisJaW5kZXggPSBpZHJfYWxsb2MoJmF1eF9pZHIsIGF1eF9kZXYs
IDAsIERSTV9BVVhfTUlOT1JTLCBHRlBfS0VSTkVMKTsKIAltdXRleF91bmxvY2soJmF1eF9pZHJf
bXV0ZXgpOwogCWlmIChpbmRleCA8IDApIHsKIAkJa2ZyZWUoYXV4X2Rldik7Ci0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
