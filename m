Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 746DBF332F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B676F70A;
	Thu,  7 Nov 2019 15:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720076.outbound.protection.outlook.com [40.107.72.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF066F705;
 Thu,  7 Nov 2019 15:32:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3sUhOwkK2aBP7H524bUnBZDr6pRMBwSo3AHEwoA5oqJll0ijUF0lER/abRAKUJTuXqZB8PvIIp9XLnRzYIRzqPgGEF1T5px/P8Hy4FBUfldR3sQ13fqY7LTF/0z89pkMCoGUqgCtvYsn2UDHUO3NAEv8OjPDSrEXwO+Sv4TBlEea1UPeBQiB2jMz60cMUf+uQYKnFceveKVbhMHt3o0fCB249b3hevFRFF9Nj2TE4jJJxzncSQiAWTmER3lr/rEH92zR6xO4s/1ucl1JXloTrgiq0V6QV0WHfqpgbroXdUvQIv43uKVmCuyBypyqn3pOOqAPo/8maMUNBwbTjqYzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FFQGdxpYtvDLaxePo4O9o/GPtp4v66SFjBsgH2AV0k=;
 b=Zk1sVkhkBDdlE2mX3FaC0zUfwqxLS1jmNd17Lt5GeVN8IpxLw0Xhu1/VvTp47ulAeSkoJ6HidH5dHp9+9JKGW95BtIdtMRetPmxp8FauT08cdIuZZKpPbsEEnWmPTq+IqDV7lVohd19XTTtNwpzBqOzIuCsa8lmFhyZFiP+2O+imqi/YgYYToSD2c4M+rONU1b2uXIdXoqbA1UP11dTZio78Lo7ruMgk7U+RN2U1V9GhrNGGSOe7KvTYVsKSvNOi25OzOv9BIijCs7nIZ8q0kGqYZcXx8/CBR4SQaZ1yhCMzpZGpjzO30Hsjk5gqmv+RGXbXnDWvdIeV2eoNhi/NLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0016.namprd12.prod.outlook.com (2603:10b6:4:1::26) by
 DM5PR12MB1226.namprd12.prod.outlook.com (2603:10b6:3:75::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Thu, 7 Nov 2019 15:32:27 +0000
Received: from DM3NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by DM5PR12CA0016.outlook.office365.com
 (2603:10b6:4:1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22 via Frontend
 Transport; Thu, 7 Nov 2019 15:32:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM3NAM03FT049.mail.protection.outlook.com (10.152.83.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2430.20 via Frontend Transport; Thu, 7 Nov 2019 15:32:27 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 7 Nov 2019
 09:32:24 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 7 Nov 2019 09:32:24 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 07/13] drm/amd/display: Initialize DSC PPS variables to 0
Date: Thu, 7 Nov 2019 10:32:06 -0500
Message-ID: <20191107153212.1145-8-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107153212.1145-1-mikita.lipski@amd.com>
References: <20191107153212.1145-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(428003)(199004)(189003)(6916009)(70586007)(5660300002)(70206006)(50226002)(305945005)(7696005)(86362001)(356004)(76176011)(446003)(486006)(51416003)(11346002)(2616005)(81166006)(476003)(426003)(2351001)(1076003)(6666004)(126002)(53416004)(186003)(336012)(26005)(4326008)(50466002)(478600001)(48376002)(36756003)(81156014)(8676002)(54906003)(2876002)(2906002)(16586007)(8936002)(450100002)(316002)(47776003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1226; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fce546b9-9626-45d2-e464-08d76397b21d
X-MS-TrafficTypeDiagnostic: DM5PR12MB1226:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12269A2264597194FCEA8A63E4780@DM5PR12MB1226.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-Forefront-PRVS: 0214EB3F68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FYnZdVdlQLTxEdakDWQv6eqnKV3WGOgcFQw6tqa5k/WlmxW5v/BKqhq4Ig8CuGXIiT+ZSGJzB0cDW4egJsgeIyHiLHc0eRIT7HXDuRgz+9Wmjch0vupkoYEWS3cYT0ekY3YXvAYEMk16AQlahVaizXn22axu2tBpZzI6kTXjRdc+Bq6ZTtv1IBniNnk+DI5zZY26X1D0yR/iYaEAeiZJP+Jvy4/r5aZTC46cHZmOzp2WMgr3VKqnfjJTYc4JdjT/Q9GgtnyTNxHiX2fW61cDDdfJTsYywCDcVc72KGxTW+j9/GW4x/GbFPI9OHRkJOC4/G1hWDCAjrwA8Ffegze4JMEMYh/TY+FDzYZO2Mf5us/Uv4u0rIuOf9mfwAeaEP7pMIngaJ8jEGbJt3oar9ubfiqATucfUwfW3kQMgvNG0iwA/ZYZ1VNl1g5mXj1ba5Av
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 15:32:27.4748 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fce546b9-9626-45d2-e464-08d76397b21d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1226
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FFQGdxpYtvDLaxePo4O9o/GPtp4v66SFjBsgH2AV0k=;
 b=wC7aodohsJJYBRP/De9W75ahwT2+tWh5ZXfqAaKlw93oSZ4ke/MsHLi4qasrbVDeq1FEbjyUI2o2KwW1e3ohrpRBuJ2/W5MpOm42qhQcX6XwQvNnqKBSykDJrU/n2KcC4b2LsQ/JRCPH5w2mvz8B4JuPurAwU5yaLhn7gUwXTr8=
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
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfaHdzcy5jCmluZGV4IGJiMWU4ZTViNTI1
Mi4uYTdmM2E5ZWNjNjI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rX2h3c3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rX2h3c3MuYwpAQCAtNTI2LDYgKzUyNiw5IEBAIGJvb2wgZHBfc2V0X2Rz
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
ZXggMDExMTU0NWRhYzc1Li42YmRmZWUyMGI2YTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMKQEAgLTIwNiw2ICsyMDYsOSBAQCBzdGF0
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
