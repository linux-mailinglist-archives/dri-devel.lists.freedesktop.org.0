Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE8A110052
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 15:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD95E6E7AC;
	Tue,  3 Dec 2019 14:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690070.outbound.protection.outlook.com [40.107.69.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD44A6E799;
 Tue,  3 Dec 2019 14:35:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+vt881Q80bC/QuefAlu0cwUJ3MltGvp3iq3eGJDUUDSJrGBCjYV+DJ/F59tRMykrbNnaMHhBFqvNpo5kE4Fz4Dd9Z2VF7T0N+rU/h12Og7Z1uf0erR5DP/WGrq6L5rUh0J//45rKbTa+zlfTojIBA4tkDQXQp5lXU5BY0XZcZ6chTS8FKgigNPFv/3ndEUAUsIish9exZO1nCZrN4wTr5htRAelfCp9dZKQqofddVcQMP9060zrOgRwQ9o3CFEIaaAzK1rcIBJFGoxxbAer/6N+Qhe5/Od2h/m7EPxyXlIEs1xZ+7Pkwv3sEOUwmGj4ztA68pFpaeBJu91naocVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGffw++GcIoVH9cDtEblgrFCmSbULbwOTaXVlSsslHA=;
 b=Z+f8m0uh705q7QZfT2qSRJKtZTwW6LnEwSwMKYGKG7+vXeidBjhIbDL02V2xdwXxcdxhyEu3X4kC5bXo9VSQCvzK9uiVGyIs8dsrYzlL1FxDJDaqVkrBrZBr6DIqJ4jnT6eqe2kW3a4DGQvguCHzWYL8nHHmR/JBltoIEDmm5iGkCmuCJx0DKVdMzBBuJuxbd3H+6QNup7sgHqjys5MiJyNyM3APY2jD2xfR3YV13blD/h9HoFCdH6p31mjP1RjQKHSJy0ET+2Q9Nhd5vimimaCBdnJuwjDMHKHobq/X/rTYjGBdC8Yhszc0l9LkdKZefAALJ5t7Nc/GrLIMNu9geQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0022.namprd12.prod.outlook.com (2603:10b6:5:1c0::35)
 by BY5PR12MB4097.namprd12.prod.outlook.com (2603:10b6:a03:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17; Tue, 3 Dec
 2019 14:35:46 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::205) by DM6PR12CA0022.outlook.office365.com
 (2603:10b6:5:1c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 14:35:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Tue, 3 Dec 2019 14:35:45 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 08:35:43 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 08:35:43 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8 07/17] drm/amd/display: Initialize DSC PPS variables to 0
Date: Tue, 3 Dec 2019 09:35:20 -0500
Message-ID: <20191203143530.27262-8-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203143530.27262-1-mikita.lipski@amd.com>
References: <20191203143530.27262-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(136003)(428003)(199004)(189003)(336012)(2876002)(426003)(446003)(2906002)(11346002)(2616005)(50226002)(76176011)(8936002)(51416003)(8676002)(81156014)(6666004)(7696005)(26005)(36756003)(86362001)(48376002)(478600001)(50466002)(450100002)(186003)(6916009)(4326008)(53416004)(81166006)(356004)(305945005)(2351001)(316002)(5660300002)(16586007)(54906003)(70206006)(1076003)(70586007)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4097; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 963132a6-88b8-42ea-b99b-08d777fe155a
X-MS-TrafficTypeDiagnostic: BY5PR12MB4097:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4097E520CB51D09D083D0630E4420@BY5PR12MB4097.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AuIGmi/ZeWE3yxU/qKpJ4qqPjtGXnq0dTJNQSjOGMH/uMmH7Q29pBKiAU+WMuWPQEArpREenGhR8QOgemg+DW6Yn5FunQLZNF4z1Y2vUJ8XiMvwExW6r2dnSyXRAVvdKhLsR24Me/oGe2Oh+RjAocRqMucJAi0cIY5PWoRvSjNEDkNJdRmCDW0OcgQDhrJlvBJr//fbLnkCmjwf3BPHRbNA75GUnq3KBE89YbAZwdHe+CAC8FeAiK71Fw9MIsy0CDdGQzNprvF41yBqkQGqfwgCiXAfAbMlFItFAmy/GGUiGKmV1ZYdgaNNGlpRZX2zVhnitdGMvbaZ0mpo79Bt6wSbcdWyKZ59MPiwH0COa9WkWl96xNS/ppZuElrj/lV80OYuILxqfyg+Bp6CLLmhNtKNzWoe7AfTNytGYGhBv1boDzez2Nxk+j04vMIrTxMXH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 14:35:45.9049 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 963132a6-88b8-42ea-b99b-08d777fe155a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4097
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGffw++GcIoVH9cDtEblgrFCmSbULbwOTaXVlSsslHA=;
 b=OSurU5ZAPESr6u18Pkf2pSqpvHcEB6yFZZm9L5MKO7LnvEeGrXk5t58k1Sbaeje8+H6BVMYIVstn7OMrKtG/kWboRNxwfpaaiQQEPBnhD2QgL/9D8mhx9ss4FUJQK/9WM5LLJqxgwG12NkfZgLarX65KbDaXUEEF+bdwx/AU9z4=
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
Cc: David Francis <David.Francis@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
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
ZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IE1pa2l0YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYyB8IDMgKysrCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMgICB8IDMgKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfaHdzcy5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19od3NzLmMKaW5kZXggYmIxZThlNWI1MjUyLi5h
N2YzYTllY2M2MjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjX2xpbmtfaHdzcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjX2xpbmtfaHdzcy5jCkBAIC01MjYsNiArNTI2LDkgQEAgYm9vbCBkcF9zZXRfZHNjX3Bw
c19zZHAoc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCwgYm9vbCBlbmFibGUpCiAJCXN0cnVjdCBk
c2NfY29uZmlnIGRzY19jZmc7CiAJCXVpbnQ4X3QgZHNjX3BhY2tlZF9wcHNbMTI4XTsKIAorCQlt
ZW1zZXQoJmRzY19jZmcsIDAsIHNpemVvZihkc2NfY2ZnKSk7CisJCW1lbXNldChkc2NfcGFja2Vk
X3BwcywgMCwgMTI4KTsKKwogCQkvKiBFbmFibGUgRFNDIGh3IGJsb2NrICovCiAJCWRzY19jZmcu
cGljX3dpZHRoID0gc3RyZWFtLT50aW1pbmcuaF9hZGRyZXNzYWJsZSArIHN0cmVhbS0+dGltaW5n
LmhfYm9yZGVyX2xlZnQgKyBzdHJlYW0tPnRpbWluZy5oX2JvcmRlcl9yaWdodDsKIAkJZHNjX2Nm
Zy5waWNfaGVpZ2h0ID0gc3RyZWFtLT50aW1pbmcudl9hZGRyZXNzYWJsZSArIHN0cmVhbS0+dGlt
aW5nLnZfYm9yZGVyX3RvcCArIHN0cmVhbS0+dGltaW5nLnZfYm9yZGVyX2JvdHRvbTsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYwppbmRleCAw
MTExNTQ1ZGFjNzUuLjZiZGZlZTIwYjZhNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYwpAQCAtMjA2LDYgKzIwNiw5IEBAIHN0YXRpYyBi
b29sIGRzYzJfZ2V0X3BhY2tlZF9wcHMoc3RydWN0IGRpc3BsYXlfc3RyZWFtX2NvbXByZXNzb3Ig
KmRzYywgY29uc3Qgc3RyCiAJc3RydWN0IGRzY19yZWdfdmFsdWVzIGRzY19yZWdfdmFsczsKIAlz
dHJ1Y3QgZHNjX29wdGNfY29uZmlnIGRzY19vcHRjX2NmZzsKIAorCW1lbXNldCgmZHNjX3JlZ192
YWxzLCAwLCBzaXplb2YoZHNjX3JlZ192YWxzKSk7CisJbWVtc2V0KCZkc2Nfb3B0Y19jZmcsIDAs
IHNpemVvZihkc2Nfb3B0Y19jZmcpKTsKKwogCURDX0xPR19EU0MoIkdldHRpbmcgcGFja2VkIERT
QyBQUFMgZm9yIERTQyBDb25maWc6Iik7CiAJZHNjX2NvbmZpZ19sb2coZHNjLCBkc2NfY2ZnKTsK
IAlEQ19MT0dfRFNDKCJEU0MgUGljdHVyZSBQYXJhbWV0ZXIgU2V0IChQUFMpOiIpOwotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
