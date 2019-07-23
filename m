Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 009647230A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 01:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5726E3E9;
	Tue, 23 Jul 2019 23:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D966B6E3D8;
 Tue, 23 Jul 2019 23:29:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGb5d3tvZ9Ipi6MrUWGJMWDeRoGlbRzUVKcpi7Vlb/ZNDEuTep+Di4fpfq9IAzbnI+DUHXnckgh0hN+o8VCOyqk+BePw7o3GxpkR/RiaEsqgPnMsZHPXJY3g1JU8VGJeTsprtd+nBYJlBF8XRVyrUtMUkemMk9+QGXxDcD7yvyOLnfjoUyBRJZshe61MEvSLBwImyV2SbnlH4x6HXbSnOZHX0QZKJha7tS0O2GuY21HJuIlqILb4+xdypQsypbCC7m9SBp1JcdmNhwdVAuKLwECaKc1LqL4OIRe2wsl9qWJq+yEaIyU7YlD5nH2wx1DeuFYfYlxRBzVYwl/2TjjTXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8HT84lrA98Qr66U7laEA/QzrlMKz2ZklaCO1p3N+xs=;
 b=HNAkjSbY3YgvyzJv3zNaiLdWFf4eCo3BhuhOEvKqK0Jq9SD4jxzw3teBm5g8GvGFbRD69MVHMZOil6ySXgugvb0J5fasV8ZdcUA9244YokStYypFsK/jklB7ifg0R9siGzF/O4WMUqYGLIP4/OM2myohaADD6ZjlgvKi9TnTTxiCpQJR5rCQrkdwkoN/pwtX2rKBPUAIHDEgBgfKlwdjBCXeiZ6WJV6hf7ECMF3DXRiIo+0Bl2qKCtACFBTrvLhsWUVBPO6uZYs1Hz2o6buyJEpiv1CsAkhUgk5b/h3MB0HWowoOooVP0YFUAz6AVbGxdTY6c9/tgWkN7HwyBv6Leg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0018.namprd12.prod.outlook.com
 (2603:10b6:910:16::28) by MWHPR1201MB2493.namprd12.prod.outlook.com
 (2603:10b6:300:ec::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.17; Tue, 23 Jul
 2019 23:29:06 +0000
Received: from DM3NAM03FT038.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by CY4PR1201CA0018.outlook.office365.com
 (2603:10b6:910:16::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12 via Frontend
 Transport; Tue, 23 Jul 2019 23:29:05 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT038.mail.protection.outlook.com (10.152.83.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 23:29:05 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 23 Jul 2019 18:29:03 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/9] drm/nouveau: Use connector kdev as aux device parent
Date: Tue, 23 Jul 2019 19:28:02 -0400
Message-ID: <20190723232808.28128-4-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190723232808.28128-1-sunpeng.li@amd.com>
References: <20190723232808.28128-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(2980300002)(428003)(189003)(199004)(2870700001)(68736007)(2906002)(26005)(70586007)(70206006)(47776003)(446003)(50466002)(486006)(48376002)(86362001)(11346002)(49486002)(2876002)(186003)(5660300002)(426003)(336012)(476003)(2616005)(126002)(36756003)(4326008)(1076003)(305945005)(81166006)(14444005)(8676002)(54906003)(81156014)(110136005)(316002)(50226002)(478600001)(8936002)(356004)(53936002)(76176011)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB2493; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4069bd2-3ad4-43b7-1e6a-08d70fc58d8f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR1201MB2493; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2493:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB249344EA4293EBD6581536A182C70@MWHPR1201MB2493.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: mHDu4IPZXktO5waZd466jUpAdY6PqwcXqPAOMq18PoM/x4aLoMGOeq3UAiEgvddFKvdmnoHKSsoSYRpgt2I4Y0rHb8RDf82vVbm089Grw3eHKWGToSp5F+fLy7R+Ilqp6jRTIu7HMcFcF8uAC1M3lqrgrC49LAEtbrZac4NjpzcWX1Jc9zThOoR5KP0Jfnp0H4dr995nAdss7ip9kLGb24AXnaqfd6BzyN2ja+uU9VZAi2VsGukI5uO6Jd2VG8ifHdGUzYZA17ONatieH3ppvPXmwAgffeLto3vUcPh5vfounOg5po9ilFLE+8glkGnXzZKSLnieK/zj4sOVo9i02TYIlcFuIglvtlmjMUiTP0Lt1gW++HymLtgb+qYfK+h2CGWGSmuimbXf0UbVBKehxXwQVtnSVH4ltNKSt8JU0KU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 23:29:05.2023 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4069bd2-3ad4-43b7-1e6a-08d70fc58d8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2493
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8HT84lrA98Qr66U7laEA/QzrlMKz2ZklaCO1p3N+xs=;
 b=FGyfBBsXPhkgRm5jsfLJVnaJ7MwZmEBpOpLqYwbDWQByiQBzQAY/A5+jKDYnuywbcI7sM5/XcAZ547+VSLe9kTP6TNWXdCP/DD/mF/q1jJ64JB3PfLMkfrVq5FxCDAq/GnEPYzqaY0c6uIZTmiyqU52GnwKaEB9JaAGKUR+qUkQ=
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

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpTZXQgdGhlIGNvbm5lY3RvcidzIGtl
cm5lbCBkZXZpY2UgYXMgdGhlIHBhcmVudCBmb3IgdGhlIGF1eCBrZXJuZWwKZGV2aWNlLiBUaGlz
IGFsbG93cyB1ZGV2IHJ1bGVzIHRvIGFjY2VzcyBjb25uZWN0b3IgYXR0cmlidXRlcyB3aGVuCmNy
ZWF0aW5nIHN5bWxpbmtzIHRvIGF1eCBkZXZpY2VzLgoKQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NA
cmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9jb25uZWN0b3IuYwppbmRleCA4ZjE1MjgxZmFhNzkuLjMzMGQ3ZDI5YTZlMyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jCkBAIC0xMzQ5LDcg
KzEzNDksNyBAQCBub3V2ZWF1X2Nvbm5lY3Rvcl9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwKIAkJYnJlYWs7CiAJY2FzZSBEUk1fTU9ERV9DT05ORUNUT1JfRGlzcGxheVBvcnQ6CiAJY2Fz
ZSBEUk1fTU9ERV9DT05ORUNUT1JfZURQOgotCQludl9jb25uZWN0b3ItPmF1eC5kZXYgPSBkZXYt
PmRldjsKKwkJbnZfY29ubmVjdG9yLT5hdXguZGV2ID0gY29ubmVjdG9yLT5rZGV2OwogCQludl9j
b25uZWN0b3ItPmF1eC50cmFuc2ZlciA9IG5vdXZlYXVfY29ubmVjdG9yX2F1eF94ZmVyOwogCQlz
bnByaW50ZihhdXhfbmFtZSwgc2l6ZW9mKGF1eF9uYW1lKSwgInNvci0lMDR4LSUwNHgiLAogCQkJ
IGRjYmUtPmhhc2h0LCBkY2JlLT5oYXNobSk7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
