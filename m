Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0E89491C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 17:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361C16E1F6;
	Mon, 19 Aug 2019 15:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760053.outbound.protection.outlook.com [40.107.76.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4E36E1EE;
 Mon, 19 Aug 2019 15:50:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VupMfpFiRo8FIuV/0+6aQcyKhyhhe3YzEQj3X/9hBVyQ/gzB3izu/RXAR6HVfVxtsjwaRnWXhoCGCUSeZxI5fMgFr5dxo0mSMEPfQxhvpIXeUhTO9lYjuWNT4YscUCyWSGZkIvTT5S9iZXBGuzRhvP06+mKqVgENeCZa+6NwuZPdi/oY6Oeuwn15l1Va8ASIzB/aoIAZ1u0su6ackusjv9cUbywy736KJypSyjOnuXV3NauVSGdJbvH+Ds/7+L2mHxId1wgd6t7cJ2dRJDFDzUMKje90dSmdwL6dB1XZOKK39ISrnsuZe09a6o6yjvFT0tNfeSsupdx92M3nqOWBBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcyGGm5zqcdLCFl4kQFxnqqHLpbtqN4kMIvC+jmL5U8=;
 b=djOj3KtCe8HYOGVcUuJBg/Ph3X1/ahuLs1vTlMCIuQaWYmaI13t3VYU+cto7IUsUIslhgrbSZ8u/hhL2Xdyif135EfmSR7dsdI9RBV4+llhzzjwyoKhGkXQFKg+3WwRpXWV5hPKXInTZ4Q4SilgNRTecr1woCLAC3CZIJSpKLNjpssGJbPCpzFkWNu8ddmUBlAUEw4BqLhcCro526CcErCRd6FHwfN6B5dFeLfL+oYNrlUZPrjpUhgNso1I8HdWrA8G1WYLyvJtlEDO0dI9rKyanzcu+CW9PyBEWdC0r3qpYuqWtJb6mFTVk/EGt3fCap06NATg7Sn87hWVtqyHayA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0057.namprd12.prod.outlook.com (2603:10b6:0:56::25) by
 MWHPR12MB1279.namprd12.prod.outlook.com (2603:10b6:300:d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 15:50:52 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by DM3PR12CA0057.outlook.office365.com
 (2603:10b6:0:56::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 15:50:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 15:50:52 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 19 Aug 2019 10:50:48 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/14] drm/amd/display: Initialize DSC PPS variables to 0
Date: Mon, 19 Aug 2019 11:50:31 -0400
Message-ID: <20190819155038.1771-8-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819155038.1771-1-David.Francis@amd.com>
References: <20190819155038.1771-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(39860400002)(396003)(376002)(346002)(2980300002)(428003)(189003)(199004)(76176011)(336012)(6666004)(81166006)(81156014)(446003)(426003)(49486002)(305945005)(26005)(5660300002)(186003)(47776003)(51416003)(8676002)(2906002)(1076003)(36756003)(50226002)(50466002)(16586007)(8936002)(450100002)(110136005)(48376002)(478600001)(70586007)(486006)(86362001)(70206006)(316002)(53936002)(4326008)(356004)(476003)(126002)(11346002)(2616005)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1279; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ca5e53c-4ec6-4711-86bd-08d724bd03a1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1279; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1279:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1279D73605B8A663F7F6229BEFA80@MWHPR12MB1279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: T79Ueco84gmxzakbpu5us3A5u3+uzzf353UPouH/GuroxPUyX46Q6feXhvKtUzxQsniGSS2t9rCLDOR5pUU6vt/2Dz7SmXOagDAxfTDMNvKWdExMZYAHylyV+RUBXLA9/llBAu3zkDlCgJHkxMWB9UOA+5UScBugiIKP1FbIKBsNUkPV4HPfrBM7FDbaXl4eG8wAVwlaEyPsJw9CzTjnIW7+W7aLbMxiMrpN+0YE9PoTTJWJrrMz0SN7YcWwqL2FpFcl0nvrqSPBL4MAN8/uoSvStRnU99RFCeL8WG5EnkoDAicIJAR3hkHTGkRF5PcQzRbzztg+il2SYGGMVKFaBBvYbWBXt2h06uKsT1OOuq8a+7bEVDbIDZG9WRnrkKSenZ2c+jygUeMF0+honLKrK8wk1jrflfrpREFIh3FPsn8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 15:50:52.2949 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca5e53c-4ec6-4711-86bd-08d724bd03a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1279
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcyGGm5zqcdLCFl4kQFxnqqHLpbtqN4kMIvC+jmL5U8=;
 b=jshkTv47PMNjHyoEHdARgtLsThBAbKNAdv/CQ/8uCea42yNEoAdWTzjPirxOe0s0ahYHggYCREY0h5TtXBchRl/bCfWhgaSOg4AF85LpeJz54Aepd6GvMt5HpIcU5M1F5r7fyIYqtTrHq33bohnI7Y1Gz60ngRKNAxtnR3nHoa0=
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
CgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19od3NzLmMgfCAz
ICsrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jICAg
fCAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfaHdzcy5jCmluZGV4IDM1YzU0
NjdlNjBlOC4uNjE5YWM0OGVkZDA1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYwpAQCAtNDkxLDYgKzQ5MSw5IEBAIGJvb2wgZHBf
c2V0X2RzY19wcHNfc2RwKHN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgsIGJvb2wgZW5hYmxlKQog
CQlzdHJ1Y3QgZHNjX2NvbmZpZyBkc2NfY2ZnOwogCQl1aW50OF90IGRzY19wYWNrZWRfcHBzWzEy
OF07CiAKKwkJbWVtc2V0KCZkc2NfY2ZnLCAwLCBzaXplb2YoZHNjX2NmZykpOworCQltZW1zZXQo
ZHNjX3BhY2tlZF9wcHMsIDAsIDEyOCk7CisKIAkJLyogRW5hYmxlIERTQyBodyBibG9jayAqLwog
CQlkc2NfY2ZnLnBpY193aWR0aCA9IHN0cmVhbS0+dGltaW5nLmhfYWRkcmVzc2FibGUgKyBzdHJl
YW0tPnRpbWluZy5oX2JvcmRlcl9sZWZ0ICsgc3RyZWFtLT50aW1pbmcuaF9ib3JkZXJfcmlnaHQ7
CiAJCWRzY19jZmcucGljX2hlaWdodCA9IHN0cmVhbS0+dGltaW5nLnZfYWRkcmVzc2FibGUgKyBz
dHJlYW0tPnRpbWluZy52X2JvcmRlcl90b3AgKyBzdHJlYW0tPnRpbWluZy52X2JvcmRlcl9ib3R0
b207CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNu
MjBfZHNjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNj
LmMKaW5kZXggMzc5YzllNGFjNjNiLi4xNmRlYmU2ZDg5ZjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMKQEAgLTIwNyw2ICsyMDcsOSBA
QCBzdGF0aWMgYm9vbCBkc2MyX2dldF9wYWNrZWRfcHBzKHN0cnVjdCBkaXNwbGF5X3N0cmVhbV9j
b21wcmVzc29yICpkc2MsIGNvbnN0IHN0cgogCXN0cnVjdCBkc2NfcmVnX3ZhbHVlcyBkc2NfcmVn
X3ZhbHM7CiAJc3RydWN0IGRzY19vcHRjX2NvbmZpZyBkc2Nfb3B0Y19jZmc7CiAKKwltZW1zZXQo
JmRzY19yZWdfdmFscywgMCwgc2l6ZW9mKGRzY19yZWdfdmFscykpOworCW1lbXNldCgmZHNjX29w
dGNfY2ZnLCAwLCBzaXplb2YoZHNjX29wdGNfY2ZnKSk7CisKIAlEQ19MT0dfRFNDKCJHZXR0aW5n
IHBhY2tlZCBEU0MgUFBTIGZvciBEU0MgQ29uZmlnOiIpOwogCWRzY19jb25maWdfbG9nKGRzYywg
ZHNjX2NmZyk7CiAJRENfTE9HX0RTQygiRFNDIFBpY3R1cmUgUGFyYW1ldGVyIFNldCAoUFBTKToi
KTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
