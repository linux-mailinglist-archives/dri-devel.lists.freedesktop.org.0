Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED048E8A22
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 14:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702806E406;
	Tue, 29 Oct 2019 13:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730074.outbound.protection.outlook.com [40.107.73.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A266E3C6;
 Tue, 29 Oct 2019 13:53:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRx7dDXYD7qygGoeCaNXTyhjUIEMEwVJJav3tzUZ0SCMQ2F/EjrVYW3qae4XhsMNlJ/HihwCbgaUkR8AfUtYBKFvEsXQyRFdF0ldBcfLvls4j10yG0473SDmwq1yjKKsUR0B2FP1qUE2XDrsf8i3wKxrniOZMG3s2GbJe5bsILvkgEAn/aQFNJz2/KW5g04QWcv80iamhIGxB+kgpoc+H6nCYH/9vziVr7yvvJ2zcLuKVLa1cn0JvHCzEyjYhPgd7n4B7FBpEuRmcreVv1l1JM2ho3IKAdfysbSpomyaSZ9zXmsmyYleui35tAbhdLctnKrklvOZt5ecDkYS/JjmdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtUHwiSB+5ThPSMYYFafCbyqjBOcl+keepUKwIkBAYA=;
 b=d1ty3TA0pINd4w+UmGOCoM1VtDoktevITPorO603EB5Rwy3mTRx1Jo7FTCaKuIPuFY4KxkaDgl4uer4i55xlSD8g2s/LpMTlYtOqlqTnULEGRdNak3G5OyHAR8bhie2xlhgxQfPjtq4G5/26QY+YoaDP45a5kbqgcV+f0/Eq7R63JGOY+Vr3Nx8NqSyFg5QXQUf0ntl15aLukT4rCEdzzyuW2KNnlb2l83QT8Nb/qte8LFI789mOxOCZ7ouWhJEIPsCvjXaOxFVcSTXlYsFOnFVs+lHb1l0ZJRFEXFwe+NIzXnY+yseDX2yRuOImiURuShyDEs0ptsQMkSLE2HSSmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0017.namprd12.prod.outlook.com (2603:10b6:408:60::30)
 by MN2PR12MB3408.namprd12.prod.outlook.com (2603:10b6:208:cd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.24; Tue, 29 Oct
 2019 13:52:58 +0000
Received: from CO1NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by BN8PR12CA0017.outlook.office365.com
 (2603:10b6:408:60::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.23 via Frontend
 Transport; Tue, 29 Oct 2019 13:52:58 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT040.mail.protection.outlook.com (10.152.81.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 13:52:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 08:52:57 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 08:52:56 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 29 Oct 2019 08:52:56 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/13] drm/amd/display: Initialize DSC PPS variables to 0
Date: Tue, 29 Oct 2019 09:52:40 -0400
Message-ID: <20191029135245.31152-9-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029135245.31152-1-mikita.lipski@amd.com>
References: <20191029135245.31152-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(376002)(136003)(428003)(199004)(189003)(76176011)(86362001)(6666004)(8936002)(356004)(51416003)(81166006)(2616005)(446003)(486006)(336012)(186003)(1076003)(7696005)(11346002)(126002)(36756003)(426003)(47776003)(476003)(305945005)(26005)(5660300002)(81156014)(8676002)(50226002)(4326008)(316002)(54906003)(16586007)(2351001)(6916009)(48376002)(2906002)(478600001)(70586007)(53416004)(50466002)(70206006)(2876002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3408; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d48cfce-24ae-43bf-7974-08d75c774e65
X-MS-TrafficTypeDiagnostic: MN2PR12MB3408:
X-Microsoft-Antispam-PRVS: <MN2PR12MB34080A731C42E1CFAD0DCD5BE4610@MN2PR12MB3408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-Forefront-PRVS: 0205EDCD76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EVONEadECK8YbBv+NsNECl1LM5AMstEmdbd4bbm+V7jtvqFki4k1Qp9T1o7Y4ZkmXHfFJTN52pzGzipzw5DcJu48i1H7WR5pRplJT/SvX7uoiKryCsB5dPnzmgBDR9rEFJZfQcppQyu/yQgctBZyaJpSSz2swhuQ29SMSOf7C3QEMbAqMSUh8rYup7cGwWLrRccjAP1ZhZsdQnJZ72Eyg6k/x5gQ26R1xHPtw68EDuuk0R+TbqygR0WCY070KzyBIlZztv0lvHWc99A5fvxLcEmBSF/7VgPv/q9NtcaoGEQtEq6hRKzc43PHNELUP0Y7OHNXIvX3lIn/clfduNIzbhWGjQImpFfmPOI084C6jrogJVf5BklVGNt6R5b04WZ5/Y89xjQ+ot63zt07WT1gt7BMkFyTaHuuXrfszoXLAClEUDC/ZJmRNEo5qoL8VyHs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2019 13:52:57.9168 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d48cfce-24ae-43bf-7974-08d75c774e65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3408
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtUHwiSB+5ThPSMYYFafCbyqjBOcl+keepUKwIkBAYA=;
 b=YCNZSai4SMplhzuA+NncOyM8r9+U8yFddlKBUBOMlWPIJoeMMrrd9FN2hzC+WFuviGKnaGRAEBJCU08QOmrmhVYsvdHDJrG1y/ddQ9v8DSmcrwt6wo8vmuBLyLo9Nj80vErHKbRtZT8DiCJMoSS0iHgLfYH3OgzevafvDjivbvo=
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
