Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0927B5FD49
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 21:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A976E3DA;
	Thu,  4 Jul 2019 19:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780055.outbound.protection.outlook.com [40.107.78.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6276E3D0;
 Thu,  4 Jul 2019 19:06:35 +0000 (UTC)
Received: from BN8PR12CA0034.namprd12.prod.outlook.com (2603:10b6:408:60::47)
 by DM5PR12MB1195.namprd12.prod.outlook.com (2603:10b6:3:7a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2032.20; Thu, 4 Jul
 2019 19:06:33 +0000
Received: from DM3NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by BN8PR12CA0034.outlook.office365.com
 (2603:10b6:408:60::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16 via Frontend
 Transport; Thu, 4 Jul 2019 19:06:33 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT017.mail.protection.outlook.com (10.152.82.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 19:06:32 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 4 Jul 2019 14:06:23 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/10] drm/nouveau/kms/nv50: Implement MST Aux device
 registration
Date: Thu, 4 Jul 2019 15:05:17 -0400
Message-ID: <20190704190519.29525-9-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704190519.29525-1-sunpeng.li@amd.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(2876002)(478600001)(186003)(305945005)(8676002)(316002)(72206003)(48376002)(81166006)(50466002)(51416003)(8936002)(76176011)(49486002)(36756003)(53936002)(356004)(81156014)(86362001)(446003)(11346002)(126002)(50226002)(54906003)(70586007)(70206006)(4326008)(77096007)(6666004)(426003)(26005)(2870700001)(2906002)(486006)(5660300002)(1076003)(110136005)(47776003)(476003)(68736007)(2616005)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1195; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c02e92c0-9be5-44d2-0c23-08d700b2ba97
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1195; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1195:
X-Microsoft-Antispam-PRVS: <DM5PR12MB11950CC74A861F0E2140BB5482FA0@DM5PR12MB1195.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: DnBzH6BOqgdZm9HLKmg2/Qt49a9uapX6j3Ewr2n71gTbih8slQqkyHgpDbJWCO/UJJInwIpua/htwaJDLmKrv7g61YB4a0twYBOfFXR2i3aQ7ejZlUOnlXRHc+fpDOpwjaqQASn+HpcvFjuOexp7YCJJmsMYWRJ9XxTzOUD2dt3iFfidGVOdoDDtXMjgeVL4VAEWSnEo1e1cmk2aLkptr9TPZhaDMEtLTUjXLar7bBe9fHgmyq8bNwCoGGggMUbu3db5tuyGNq0nzPd5ln8+S1PlEQlcgE9HJVmPViPhUtjJHovq9mDr1nZ+ePATnFnyW8atOCJX3TD3+0sqndAht/+krylr6dqWu4gHdRgCqvdR53LE+sh1vEvS63+ismKzpLId875f0ZTSvs5wPJLmoB5g975AMEycs+cRYqJofgQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 19:06:32.7862 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c02e92c0-9be5-44d2-0c23-08d700b2ba97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1195
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPqw21VoUrk7TVAhyJioH1PoEhzXIQH98O7s5NHh5QI=;
 b=PWGcxIO76gXoNdNphW1qkL/wJfEI8NwfwjD9abblczU6+83Q+b4c6F6HcN7/LHQ9EPUZAS472jpXcGNQ/tobyKmxP+hVoV1v8z+4lOt4ICgWkjBJAbHogB9ah8NYdYBSutXwNnDlZ3yiEZNXnLJmuhLqPqH0S0NK5IVf9pr/TmE=
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
Cc: Leo Li <sunpeng.li@amd.com>, Ben Skeggs <bskeggs@redhat.com>
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
cG52NTAvZGlzcC5jCmluZGV4IDdiYTM3M2Y0OTNiMi4uNmQwZmJiNjAzNmNmIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCkBAIC0xMDE5LDYgKzEwMTksMjQgQEAgbnY1
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
QEAgLTEwMjksNiArMTA0Nyw4IEBAIG52NTBfbXN0YyA9IHsKIAkuYXRvbWljX2Rlc3Ryb3lfc3Rh
dGUgPSBub3V2ZWF1X2Nvbm5fYXRvbWljX2Rlc3Ryb3lfc3RhdGUsCiAJLmF0b21pY19zZXRfcHJv
cGVydHkgPSBub3V2ZWF1X2Nvbm5fYXRvbWljX3NldF9wcm9wZXJ0eSwKIAkuYXRvbWljX2dldF9w
cm9wZXJ0eSA9IG5vdXZlYXVfY29ubl9hdG9taWNfZ2V0X3Byb3BlcnR5LAorCS5sYXRlX3JlZ2lz
dGVyID0gbnY1MF9tc3RjX2xhdGVfcmVnaXN0ZXIsCisJLmVhcmx5X3VucmVnaXN0ZXIgPSBudjUw
X21zdGNfZWFybHlfdW5yZWdpc3RlciwKIH07CiAKIHN0YXRpYyBpbnQKLS0gCjIuMjIuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
