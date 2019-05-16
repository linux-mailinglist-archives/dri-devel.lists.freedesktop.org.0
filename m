Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 284DE20B26
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 17:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A2689781;
	Thu, 16 May 2019 15:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730062.outbound.protection.outlook.com [40.107.73.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4940389781;
 Thu, 16 May 2019 15:27:00 +0000 (UTC)
Received: from SN1PR12CA0079.namprd12.prod.outlook.com (2603:10b6:802:21::14)
 by BYAPR12MB2663.namprd12.prod.outlook.com (2603:10b6:a03:69::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.17; Thu, 16 May
 2019 15:26:58 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by SN1PR12CA0079.outlook.office365.com
 (2603:10b6:802:21::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Thu, 16 May 2019 15:26:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Thu, 16 May 2019 15:26:57 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 16 May 2019
 10:26:53 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/7] drm/amd/display: Use connector kdev as aux device parent
Date: Thu, 16 May 2019 11:18:01 -0400
Message-ID: <1558019883-12397-6-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
References: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(346002)(136003)(396003)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(53936002)(68736007)(36756003)(4326008)(50226002)(126002)(66574012)(8936002)(81166006)(316002)(81156014)(2870700001)(50466002)(7696005)(86362001)(8676002)(76176011)(23676004)(54906003)(2906002)(186003)(2876002)(336012)(14444005)(70206006)(53416004)(486006)(26005)(11346002)(70586007)(110136005)(5820100001)(446003)(47776003)(426003)(72206003)(305945005)(478600001)(2616005)(356004)(6666004)(77096007)(5660300002)(86152003)(476003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2663; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2609001-d12b-4ba4-49c2-08d6da12ef04
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BYAPR12MB2663; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2663:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2663B7E019AE5BCDDB03B79D820A0@BYAPR12MB2663.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0039C6E5C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: O4Pzwcl+rVc+5d8me+hHl1jllhwW8LiFSqPVMK1wM8uVGfwLg3Vxgi5lpjXsBLFieCWiZteHQ8hjAKjM4a775nKByfHjjLGuA29i9XKMZkSW1SFEOOIQxCpry8wfgCCsorN6nw3WtRyDBnf3jQNvXav1pxeW9f5RS131V3mHcxKZJMFLRAFiM+vg/3B7bMGb8ZBDgM24bZqsm3b1re4xMTHoi/oljyLazxHszzq7AyxM7T7+XIraYG944YutCvfweotDrRWrcGikdA5GRO3mufZoh2vGh88pWGjq80QB4HEpb3NlEnExmJ4GuTv7lGlwKrhDYWx60njsHRAv3pCa5hNj87FkhvqXd0LSZ37u0SkUqnOXPDTB5lTOjjdye6durYDVaS4gx86HXyq5UBivsUT1um4AHGjuPJGrOnJFQGI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2019 15:26:57.2214 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2609001-d12b-4ba4-49c2-08d6da12ef04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2663
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAvLEC0kEP1JhZwfxaP1bB7DkAssLjIj/BvNz+ri/EY=;
 b=0Tlk2mxv3ezd1QQmwcJ3YigYp5/QoWvT0r43z8iXbrqZm5xkibVRUE3F5ohEC+EJn8A+hri1viNuDcmt1kMUb0t5VuXmJzJYSVV33qKMMW7ToXzcE/KKUBkxpNldpDOORsiHJUYorWD/Nbi2K65NC7cKWfjmlPYtak1zJl5titE=
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
Cc: Leo Li <sunpeng.li@amd.com>, Jerry Zuo <Jerry.Zuo@amd.com>, Nicholas
 Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpTZXQgdGhlIGNvbm5lY3RvcidzIGtl
cm5lbCBkZXZpY2UgYXMgdGhlIHBhcmVudCBmb3IgdGhlIGF1eCBrZXJuZWwKZGV2aWNlLiBUaGlz
IGFsbG93cyB1ZGV2IHJ1bGVzIHRvIGFjY2VzcyBjb25uZWN0b3IgYXR0cmlidXRlcyB3aGVuCmNy
ZWF0aW5nIHN5bWxpbmtzIHRvIGF1eCBkZXZpY2VzLgoKRm9yIGV4YW1wbGUsIHRoZSBmb2xsb3dp
bmcgdWRldiBydWxlOgoKU1VCU1lTVEVNPT0iZHJtX2RwX2F1eF9kZXYiLCBTVUJTWVNURU1TPT0i
ZHJtIiwgQVRUUlN7ZWRpZH09PSIqIiwKCVNZTUxJTksrPSJkcm1fZHBfYXV4L2J5LW5hbWUvJGlk
IgoKV2lsbCBjcmVhdGUgdGhlIGZvbGxvd2luZyBzeW1saW5rcyB1c2luZyB0aGUgY29ubmVjdG9y
J3MgbmFtZToKCiQgbHMgL2Rldi9kcm1fZHBfYXV4L2J5LW5hbWUvCmNhcmQwLURQLTEgIGNhcmQw
LURQLTIgIGNhcmQwLURQLTMKCkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPgpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KQ2M6IE5pY2hv
bGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4KQ2M6IEhhcnJ5IFdl
bnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogSmVycnkgKEZhbmd6aGkpIFp1byA8
SmVycnkuWnVvQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
X21zdF90eXBlcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYwppbmRleCBhNmY0NGE0Li4wODNmYjk3IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bV9tc3RfdHlwZXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbV9tc3RfdHlwZXMuYwpAQCAtMzg1LDcgKzM4NSw3IEBAIHZvaWQgYW1kZ3B1X2Rt
X2luaXRpYWxpemVfZHBfY29ubmVjdG9yKHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2VyICpk
bSwKIAkJCQkgICAgICAgc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IpCiB7
CiAJYWNvbm5lY3Rvci0+ZG1fZHBfYXV4LmF1eC5uYW1lID0gImRtZGMiOwotCWFjb25uZWN0b3It
PmRtX2RwX2F1eC5hdXguZGV2ID0gZG0tPmFkZXYtPmRldjsKKwlhY29ubmVjdG9yLT5kbV9kcF9h
dXguYXV4LmRldiA9IGFjb25uZWN0b3ItPmJhc2Uua2RldjsKIAlhY29ubmVjdG9yLT5kbV9kcF9h
dXguYXV4LnRyYW5zZmVyID0gZG1fZHBfYXV4X3RyYW5zZmVyOwogCWFjb25uZWN0b3ItPmRtX2Rw
X2F1eC5kZGNfc2VydmljZSA9IGFjb25uZWN0b3ItPmRjX2xpbmstPmRkYzsKIAotLSAKMi43LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
