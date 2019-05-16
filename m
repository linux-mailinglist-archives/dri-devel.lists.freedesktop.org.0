Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFA220B2C
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 17:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4A2897E3;
	Thu, 16 May 2019 15:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800085.outbound.protection.outlook.com [40.107.80.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E439D89780;
 Thu, 16 May 2019 15:26:57 +0000 (UTC)
Received: from SN1PR12CA0084.namprd12.prod.outlook.com (2603:10b6:802:21::19)
 by CY4PR1201MB0056.namprd12.prod.outlook.com (2603:10b6:910:1c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.22; Thu, 16 May
 2019 15:26:55 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by SN1PR12CA0084.outlook.office365.com
 (2603:10b6:802:21::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Thu, 16 May 2019 15:26:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Thu, 16 May 2019 15:26:55 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 16 May 2019
 10:26:52 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/7] drm/dp-mst: Use connector kdev as aux device parent
Date: Thu, 16 May 2019 11:17:59 -0400
Message-ID: <1558019883-12397-4-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
References: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(136003)(396003)(2980300002)(428003)(189003)(199004)(53936002)(126002)(54906003)(11346002)(70206006)(486006)(446003)(110136005)(86152003)(476003)(8676002)(23676004)(2616005)(70586007)(53416004)(336012)(2870700001)(86362001)(5660300002)(426003)(50466002)(2876002)(4744005)(356004)(2906002)(66574012)(26005)(5820100001)(50226002)(14444005)(7696005)(76176011)(8936002)(36756003)(77096007)(81166006)(186003)(316002)(68736007)(4326008)(478600001)(47776003)(72206003)(305945005)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0056; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d82b5d32-b408-4b2a-4558-08d6da12edc5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:CY4PR1201MB0056; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0056:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0056C3C8E14361F63C50AD48820A0@CY4PR1201MB0056.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 0039C6E5C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 86Z2W8vGk5LGD2KHmO6lNOWWBOIRRx7aDasmPOgpvcityMZmestcRC59gAYxuRO+CodbjaLbhXJTSJjhVEdCMrOC5bCg1XE3cw7HZM2BdnezNHafVATvPvA/3OgFM29lzrcqxqHS8rPgcgVUU+nUSW1Ybw7A5O0mJvlG/opSMuNKTOLwVr/VDgf3NMft1RRza/Ws/sl053XeUa3/0Yb0bBw+JOoZJGX1gR3Cu6Zy2RymwsgjUnHQYUl/JH5xFMGTtqEVvUHXlj8d/7+gsnoyGTavne/8327rVCjj20ZS6llJS+bcWnu4hSw6SpyRnaePPwNnD67zaGks62iUvTr0l0rUm6PTSGBnwuv8acoujDyvHv7M0VDBmbhSLZq1BQnZzUzB65phWzKXNUnrrk1BTqizHEefiVo2VNiqktBMTYI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2019 15:26:55.1307 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d82b5d32-b408-4b2a-4558-08d6da12edc5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0056
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9MR5RSYJIr6CJOXxa55kZvaM4/p/Jhbt1LH7bU+z4k=;
 b=c8+MSrblisWNFGx5hgX+S21te3PbUhsCLifLVBG38o9IbxSj9ems+TtlLH8deU5wTeuXRVlzN1sVVaVXrk8Vyckst+XNhZGhNCfrOaPm5hTI1TYMw/uyOrfuWOA1q2I5EJ/U11lfixI6IAKfAkpLF01l721DQF9T4k5WCR9lro8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=permerror action=none
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

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpQbGFjaW5nIHRoZSBNU1QgYXV4IGRl
dmljZSBhcyBhIGNoaWxkIG9mIHRoZSBjb25uZWN0b3IgZ2l2ZXMgdWRldiB0aGUKYWJpbGl0eSB0
byBhY2Nlc3MgdGhlIGNvbm5lY3RvciBkZXZpY2UncyBhdHRyaWJ1dGVzLiBUaGlzIHdpbGwgY29t
ZSBpbgpoYW5keSB3aGVuIHdyaXRpbmcgdWRldiBydWxlcyB0byBjcmVhdGUgbW9yZSBkZXNjcmlw
dGl2ZSBzeW1saW5rcyB0byB0aGUKTVNUIGF1eCBkZXZpY2VzLgoKQ2M6IFZpbGxlIFN5cmrDpGzD
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBMeXVkZSBQYXVsIDxseXVkZUBy
ZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMyArKysKIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3ku
YwppbmRleCA1NGRhNjhlLi5jZDJmM2M0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMKQEAgLTEyNjksNiArMTI2OSw5IEBAIHN0YXRpYyB2b2lkIGRybV9kcF9hZGRfcG9ydChz
dHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1zdGIsCiAJCX0KIAkJKCptc3RiLT5tZ3ItPmNicy0+
cmVnaXN0ZXJfY29ubmVjdG9yKShwb3J0LT5jb25uZWN0b3IpOwogCisJCWlmIChwb3J0LT5jb25u
ZWN0b3ItPnJlZ2lzdHJhdGlvbl9zdGF0ZSA9PSBEUk1fQ09OTkVDVE9SX1JFR0lTVEVSRUQpCisJ
CQlwb3J0LT5hdXguZGV2ID0gcG9ydC0+Y29ubmVjdG9yLT5rZGV2OworCiAJCWRybV9kcF9hdXhf
cmVnaXN0ZXJfZGV2bm9kZSgmcG9ydC0+YXV4KTsKIAl9CiAKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
