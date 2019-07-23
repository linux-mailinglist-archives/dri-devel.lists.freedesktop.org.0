Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1122A7230F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 01:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A059C6E3F7;
	Tue, 23 Jul 2019 23:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820085.outbound.protection.outlook.com [40.107.82.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8926E3E3;
 Tue, 23 Jul 2019 23:29:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcyKJyTwJfC+KlsB1SQCVIuKBpakccjio5mpTK6Uunup8HPGO89SStoToIPZzJmaZoB0tmGCAswMmB7E8SKID+sFgUT07BVnmmLZG4DYVKx7/jcPhJVUXpmozGsgpDyFp7YX5/9dxKrHqtQmVZoL6rymU5eP0aY0CQL/fgYEWAk0zGoXm5iFJ3Mq7wrsxliIFvmVQiDWk7OMC1/oYkPq8LDCiDiY44PVpTf3yrJ4794tfp/d0fWFltDcM50Pm+Rom3tAH0MU3ZQxg1V8CocWcRTcwOXno92FdHlYFv7IP8XyHGxvD5qBvCBrTTwraBT+1SdFtv4cHbAuoyAgs305fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hl2yLcIgazvjzdeTvxWcxAwsUFugSPa+9nidH+VzVGU=;
 b=ZC7RufMIjUIOsbqlT/3FK2t5oZCV80GMtdHwS+/lFg2q3OAhVTAxESlZgQe8E9+Ke0qNLSl8h8Lpgm4vMvBvoOExw7gf+Uq16s4qJHTMuYdOR4biMRceKdhgdJTxww4/pJn7aGFUTq17dPv4U8FxzETWFV+qbB+ZnbeKrzGI+NVwauGvrpWeWFhwK31JeafLpjwFdKge+W575isTkBCfIN3jJfvZjn35sCJrlU9fkRdBfeqygClVBPwpdrGDGIhc4UGBpQMt9T/SfUzxqE1Mkqtnw2eK5syOu2lxeti3rjVroaMdchGvqNLYGfsvbZMG+6VH4O08AxrGbnF99CK/4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0018.namprd12.prod.outlook.com
 (2603:10b6:910:16::28) by DM5PR12MB1579.namprd12.prod.outlook.com
 (2603:10b6:4:c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.15; Tue, 23 Jul
 2019 23:29:10 +0000
Received: from DM3NAM03FT038.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by CY4PR1201CA0018.outlook.office365.com
 (2603:10b6:910:16::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12 via Frontend
 Transport; Tue, 23 Jul 2019 23:29:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT038.mail.protection.outlook.com (10.152.83.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 23:29:10 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 23 Jul 2019 18:29:06 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 7/9] drm/nouveau/kms/nv50: Implement MST Aux device
 registration
Date: Tue, 23 Jul 2019 19:28:06 -0400
Message-ID: <20190723232808.28128-8-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190723232808.28128-1-sunpeng.li@amd.com>
References: <20190723232808.28128-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(396003)(346002)(2980300002)(428003)(199004)(189003)(68736007)(8936002)(50226002)(478600001)(110136005)(81166006)(81156014)(54906003)(47776003)(356004)(48376002)(2906002)(50466002)(1076003)(2870700001)(316002)(305945005)(70586007)(476003)(53936002)(76176011)(86362001)(5660300002)(51416003)(8676002)(336012)(2876002)(486006)(26005)(186003)(36756003)(49486002)(126002)(446003)(2616005)(4326008)(70206006)(426003)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1579; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ebe039d-03a2-4ced-61a3-08d70fc5909e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1579; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1579:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1579E717246A0F33B744C65682C70@DM5PR12MB1579.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 2vTP26h2TM5C4S8eKBM+lO7Cru0vb1t4w92pLamvKqAZD2pmlP1mtmHX7wmnX8pTqsDvqko9PI7Fvu+E8MI0HMX/rZ1Xh/D0jNfhMGlYrq7WbAWXDcqixojftAEfv87ESu9Fk2n+RWvf5TJRMOxBv1oBlVts7nEt+x5jVvd4sSRtg7oMkHojDDeKU7zHaNVx0vdrYTxSFcSu1P7v9FR1qNa+QrzCY4OkaDhaly+gcFZD0zP6D28xAVt8bQWDPHu9fY68EOYdY5vq6Hh1dfudatsOwcNwzziCKI4lvXWfbdlsyYBxpkzi/NcnuU2tkRT76Bt1WEuI9xuaYssmOpDSMUtHc9qtORv11bxfoQ/ZWUJb+peBBOYwefL9uQO08VRiKbSXXdCB62gTq5NIemOtKtEud4614F8HpnOUgZx+exk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 23:29:10.3235 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebe039d-03a2-4ced-61a3-08d70fc5909e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1579
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hl2yLcIgazvjzdeTvxWcxAwsUFugSPa+9nidH+VzVGU=;
 b=K9yL+W0aNOu1obwnIlpiDbGFG5RufvIYNLwZIjZlY2x22bmLOZarEa8UXtO1g5i+pC7sdRtcSrmG3Yw1hTUaMf1BguevjCmrRwSW7c/7F68qleVVqmmX4cBnK9MbKNGaqQPryD86LjkUKMOL0v5Qk2GwZZcGGGAumpgg/FDHxoQ=
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
Cc: Leo Li <sunpeng.li@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpJbXBsZW1lbnQgbGF0ZV9yZWdpc3Rl
ciBhbmQgZWFybHlfdW5yZWdpc3RlciBob29rcyBmb3IgTVNUIGNvbm5lY3RvcnMuCkNhbGwgZHJt
IGhlbHBlcnMgZm9yIE1TVCBjb25uZWN0b3IgcmVnaXN0cmF0aW9uLCB3aGljaCByZWdpc3RlcnMg
dGhlCkFVWCBkZXZpY2VzLgoKQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KU2ln
bmVkLW9mZi1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIHwgMjAgKysrKysrKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlz
cG52NTAvZGlzcC5jCmluZGV4IDg0OTc3NjhmMWI0MS4uMGQ2ZTkzNTBiYTQ0IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCkBAIC0xMDI0LDYgKzEwMjQsMjQgQEAgbnY1
MF9tc3RjX2Rlc3Ryb3koc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAlrZnJlZSht
c3RjKTsKIH0KIAorc3RhdGljIGludAorbnY1MF9tc3RjX2xhdGVfcmVnaXN0ZXIoc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvcikKK3sKKwlzdHJ1Y3QgbnY1MF9tc3RjICptc3RjID0gbnY1
MF9tc3RjKGNvbm5lY3Rvcik7CisJc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCA9IG1zdGMt
PnBvcnQ7CisKKwlyZXR1cm4gZHJtX2RwX21zdF9jb25uZWN0b3JfbGF0ZV9yZWdpc3Rlcihjb25u
ZWN0b3IsIHBvcnQpOworfQorCitzdGF0aWMgdm9pZAorbnY1MF9tc3RjX2Vhcmx5X3VucmVnaXN0
ZXIoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKK3sKKwlzdHJ1Y3QgbnY1MF9tc3Rj
ICptc3RjID0gbnY1MF9tc3RjKGNvbm5lY3Rvcik7CisJc3RydWN0IGRybV9kcF9tc3RfcG9ydCAq
cG9ydCA9IG1zdGMtPnBvcnQ7CisKKwlkcm1fZHBfbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lz
dGVyKGNvbm5lY3RvciwgcG9ydCk7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5l
Y3Rvcl9mdW5jcwogbnY1MF9tc3RjID0gewogCS5yZXNldCA9IG5vdXZlYXVfY29ubl9yZXNldCwK
QEAgLTEwMzQsNiArMTA1Miw4IEBAIG52NTBfbXN0YyA9IHsKIAkuYXRvbWljX2Rlc3Ryb3lfc3Rh
dGUgPSBub3V2ZWF1X2Nvbm5fYXRvbWljX2Rlc3Ryb3lfc3RhdGUsCiAJLmF0b21pY19zZXRfcHJv
cGVydHkgPSBub3V2ZWF1X2Nvbm5fYXRvbWljX3NldF9wcm9wZXJ0eSwKIAkuYXRvbWljX2dldF9w
cm9wZXJ0eSA9IG5vdXZlYXVfY29ubl9hdG9taWNfZ2V0X3Byb3BlcnR5LAorCS5sYXRlX3JlZ2lz
dGVyID0gbnY1MF9tc3RjX2xhdGVfcmVnaXN0ZXIsCisJLmVhcmx5X3VucmVnaXN0ZXIgPSBudjUw
X21zdGNfZWFybHlfdW5yZWdpc3RlciwKIH07CiAKIHN0YXRpYyBpbnQKLS0gCjIuMjIuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
