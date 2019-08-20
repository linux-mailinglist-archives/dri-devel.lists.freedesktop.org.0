Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F3196926
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 21:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABC96E863;
	Tue, 20 Aug 2019 19:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3257D6E864;
 Tue, 20 Aug 2019 19:12:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCdY+AOPcTz6yLBodknLWKITCTlVlT5gwarkFb37zlV3ak5DGdMUAXD4lqKTKjgoT0e2UEPnY5JJaYR/tZ/CWSJsjWc3Ttu7/7N36D7wWq7G4G3NNsJJ3hqQL2vHBuh2Cpj8+oXAZhoIlDZCtrGH9DTa7//ITFC+xXj44fNbRxUTE3zTvfOimfb+N/PmOcG5MQASpfAwU/69+f76kfgdZw/PYIWZ1Vp++t+t+cudrnlY/gZlWn+3Pp16cIsHCQjPw3OVN8BCzq1WV8ifwiceUKPGtubPnVtJdToJNq24fr0aWyUFKJW9OJazNpZkumLpcpIHiMjBAUteWTjgkO6iOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6lcmM8IbjEeihjHuyWQ0gbYWu4vsd2VOF/WuQZds0Y=;
 b=nLoujRfVhlt0aIFiCXH4gPhlKvJUWYLL6cRAMFe9IIBxYnskMxUqnhsRYywJUIhzSY35I+T1ufgAWPCwNXR0bbD+DDqDWLeqUhcF6WsJ5Drhwm0DPAAxF+AK55DfKimzwgU7Rrzh2+6dUEyOYWiMzV1+DZ9ZoVecp5DQ9kP2sFGtZxTNmCRuTLwb6RaTSo/PDlgKEtKw9Y/9zBpQ20HMWkLZxARzVrvweeQ7JPQfr1bn6/DrK/PpWFGV4txluKMaZtIfMu2chl8smHttaLIJW9rA1DpB71sV9iJJcHgqg8Td048ysCamxRRwo3COIwxMMRgEQgwmDDYIkzw+3f9Dpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0010.namprd12.prod.outlook.com
 (2603:10b6:301:4a::20) by DM6PR12MB2714.namprd12.prod.outlook.com
 (2603:10b6:5:49::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Tue, 20 Aug
 2019 19:12:26 +0000
Received: from BY2NAM03FT012.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by MWHPR1201CA0010.outlook.office365.com
 (2603:10b6:301:4a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 19:12:26 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT012.mail.protection.outlook.com (10.152.84.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 19:12:25 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 20 Aug 2019 14:12:22 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 07/14] drm/amd/display: Initialize DSC PPS variables to 0
Date: Tue, 20 Aug 2019 15:11:56 -0400
Message-ID: <20190820191203.25807-8-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820191203.25807-1-David.Francis@amd.com>
References: <20190820191203.25807-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(2980300002)(428003)(189003)(199004)(50226002)(450100002)(48376002)(8936002)(49486002)(81166006)(50466002)(16586007)(70206006)(4326008)(110136005)(70586007)(86362001)(8676002)(47776003)(316002)(6666004)(5660300002)(356004)(1076003)(53936002)(26005)(36756003)(486006)(11346002)(476003)(81156014)(2616005)(446003)(426003)(336012)(186003)(126002)(478600001)(51416003)(2906002)(76176011)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2714; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0784095-d6f6-4f94-cc2a-08d725a25650
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2714; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2714:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2714A400F5E2690503E75D6DEFAB0@DM6PR12MB2714.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 90Z1z+M81sWL/YZuWlVtt0OUBwSiY2PXBFSr9CM6QnJbAtlyd+DJZDJCKxmcW0LJOy7Gka23fimFy/lmYBj1rvRYZB5mga6jThGvsD5zpG+sUbWycUjeoS30fMRJbAqILTZmYHeVGlGMdzFVxf6GA7/RHeGMbTUUkHrkTS0UHYWofMbgZKbjRL2APzeknAw8GaiJzPL3qQwed5YG95/mUVB5AQOVgBSKuGrUY6iP75MqlmE5F/QPRdFQOLNB21fjlMu6YLS+SyjhxIawTcexnNZytp4cLr+RbSuiWpPT5BGQZ/dTSRHuvpV6mE5BUvnRHfSsRF9VjHKL0Im1GtwHjdvknktbggY+PV65q8XHP99UF9xO4tJRIbanaZaa5jwLP0EVnDmEq7VO6tE9RNKSswm5XXVgTgEt1aqoF5i0XYM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 19:12:25.7528 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0784095-d6f6-4f94-cc2a-08d725a25650
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2714
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6lcmM8IbjEeihjHuyWQ0gbYWu4vsd2VOF/WuQZds0Y=;
 b=qLKlrit7IfHh0wBNSZ7g+YjY/ptveYIQUjqlTjHZkUgeOWwVOy4nshQ4xtwWs7/ZaH0dpy7b4UXK69IIpigoI9YRcX0IC9l1bzASUCwapjXyi6xcr+k3muu4oDJI9Hqan7vnYFrkEYUXb4RF+ZF2X1uWL4XJ4IGuGOcLTwWV1lY=
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
Cc: David Francis <David.Francis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIERTQyBNU1QsIHNvbWV0aW1lcyBtb25pdG9ycyB3b3VsZCBicmVhayBvdXQKaW4gZnVsbC1z
Y3JlZW4gc3RhdGljLiBUaGUgaXNzdWUgdHJhY2VkIGJhY2sgdG8gdGhlClBQUyBnZW5lcmF0aW9u
IGNvZGUsIHdoZXJlIHRoZXNlIHZhcmlhYmxlcyB3ZXJlIGJlaW5nIHVzZWQKdW5pbml0aWFsaXpl
ZCBhbmQgd2VyZSBwaWNraW5nIHVwIGdhcmJhZ2UuCgptZW1zZXQgdG8gMCB0byBhdm9pZCB0aGlz
CgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19od3Nz
LmMgfCAzICsrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2Rz
Yy5jICAgfCAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfaHdzcy5jCmluZGV4
IDM1YzU0NjdlNjBlOC4uNjE5YWM0OGVkZDA1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYwpAQCAtNDkxLDYgKzQ5MSw5IEBAIGJv
b2wgZHBfc2V0X2RzY19wcHNfc2RwKHN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgsIGJvb2wgZW5h
YmxlKQogCQlzdHJ1Y3QgZHNjX2NvbmZpZyBkc2NfY2ZnOwogCQl1aW50OF90IGRzY19wYWNrZWRf
cHBzWzEyOF07CiAKKwkJbWVtc2V0KCZkc2NfY2ZnLCAwLCBzaXplb2YoZHNjX2NmZykpOworCQlt
ZW1zZXQoZHNjX3BhY2tlZF9wcHMsIDAsIDEyOCk7CisKIAkJLyogRW5hYmxlIERTQyBodyBibG9j
ayAqLwogCQlkc2NfY2ZnLnBpY193aWR0aCA9IHN0cmVhbS0+dGltaW5nLmhfYWRkcmVzc2FibGUg
KyBzdHJlYW0tPnRpbWluZy5oX2JvcmRlcl9sZWZ0ICsgc3RyZWFtLT50aW1pbmcuaF9ib3JkZXJf
cmlnaHQ7CiAJCWRzY19jZmcucGljX2hlaWdodCA9IHN0cmVhbS0+dGltaW5nLnZfYWRkcmVzc2Fi
bGUgKyBzdHJlYW0tPnRpbWluZy52X2JvcmRlcl90b3AgKyBzdHJlYW0tPnRpbWluZy52X2JvcmRl
cl9ib3R0b207CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfZHNjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNu
MjBfZHNjLmMKaW5kZXggMzc5YzllNGFjNjNiLi4xNmRlYmU2ZDg5ZjIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMKQEAgLTIwNyw2ICsy
MDcsOSBAQCBzdGF0aWMgYm9vbCBkc2MyX2dldF9wYWNrZWRfcHBzKHN0cnVjdCBkaXNwbGF5X3N0
cmVhbV9jb21wcmVzc29yICpkc2MsIGNvbnN0IHN0cgogCXN0cnVjdCBkc2NfcmVnX3ZhbHVlcyBk
c2NfcmVnX3ZhbHM7CiAJc3RydWN0IGRzY19vcHRjX2NvbmZpZyBkc2Nfb3B0Y19jZmc7CiAKKwlt
ZW1zZXQoJmRzY19yZWdfdmFscywgMCwgc2l6ZW9mKGRzY19yZWdfdmFscykpOworCW1lbXNldCgm
ZHNjX29wdGNfY2ZnLCAwLCBzaXplb2YoZHNjX29wdGNfY2ZnKSk7CisKIAlEQ19MT0dfRFNDKCJH
ZXR0aW5nIHBhY2tlZCBEU0MgUFBTIGZvciBEU0MgQ29uZmlnOiIpOwogCWRzY19jb25maWdfbG9n
KGRzYywgZHNjX2NmZyk7CiAJRENfTE9HX0RTQygiRFNDIFBpY3R1cmUgUGFyYW1ldGVyIFNldCAo
UFBTKToiKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
