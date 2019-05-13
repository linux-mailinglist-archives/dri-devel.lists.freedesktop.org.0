Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A66441B33F
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 11:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0813D89B20;
	Mon, 13 May 2019 09:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760044.outbound.protection.outlook.com [40.107.76.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9462989B30;
 Mon, 13 May 2019 09:53:20 +0000 (UTC)
Received: from DM6PR12CA0019.namprd12.prod.outlook.com (2603:10b6:5:1c0::32)
 by CY4PR1201MB0053.namprd12.prod.outlook.com (2603:10b6:910:23::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.24; Mon, 13 May
 2019 09:53:18 +0000
Received: from CO1NAM03FT057.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by DM6PR12CA0019.outlook.office365.com
 (2603:10b6:5:1c0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.22 via Frontend
 Transport; Mon, 13 May 2019 09:53:18 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT057.mail.protection.outlook.com (10.152.81.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Mon, 13 May 2019 09:53:18 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 13 May 2019
 04:53:16 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH libdrm 3/7] wrap syncobj timeline query/wait APIs for amdgpu v3
Date: Mon, 13 May 2019 17:53:01 +0800
Message-ID: <20190513095305.14110-3-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513095305.14110-1-david1.zhou@amd.com>
References: <20190513095305.14110-1-david1.zhou@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(396003)(136003)(376002)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(5660300002)(47776003)(1076003)(8936002)(36756003)(81156014)(81166006)(8676002)(478600001)(305945005)(72206003)(70586007)(5820100001)(26005)(86362001)(77096007)(70206006)(186003)(14444005)(53936002)(6666004)(356004)(336012)(68736007)(4326008)(53416004)(54906003)(486006)(110136005)(2616005)(11346002)(446003)(126002)(476003)(50226002)(76176011)(7696005)(23676004)(50466002)(66574012)(2870700001)(316002)(426003)(2906002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0053; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e53438e-cccf-4279-988d-08d6d788d387
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:CY4PR1201MB0053; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0053:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0053DBD32A8B74728921976CB40F0@CY4PR1201MB0053.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 0036736630
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: U+4YEkxVO66EYU5yxan4vkCN3tOQMcTkzWW0fZeGYsxMZKO/Ui1XNpQMV+TMuiINNXqB+rmpiXtlN+PqLjvS0Nf3B/NVHQ5ivur4E1nZYgbhsqBiGq6SX64STKEcUgdpSlAvZa4HsdHzm7znhc3pOJ+hGjmfZffTx6zuHGIwzEFC2dUDWBo4cwHDRLVLiZJEvpoOoaQ4gg+umxGCslnRsuVqFKTOXJfuhAsKpN7SLmbz9Rw5U8N7Ffk+7bY5THjPrT+XPg87Su5i4sUCkm7jc9/xum1aucTLZ4LCucbAmyYaQJwWwvQQK0xiqDC/8pBScQB5/i3z9FbtmSm0m3qFRh/U2VogpO3G/v9otl/+ZpXi3T3BSLR5mvpuJ4hd3bHfthGECOlLgKfGg9ACHtQWj9YoK4ls7qhnM/CBJXDTtjQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2019 09:53:18.0269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e53438e-cccf-4279-988d-08d6d788d387
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0053
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FluJvZ3kGORO6RRpkXItwCsezPBTTTfj9xyXGoXTf+s=;
 b=yHpdB2d12SQi6sYc+kLsX2Atyydx2EOMrj0b73W/w9IUNhbFoWIz1sYZ5V+tPNS0PKIEKh1xkmgkjV7FCsmuIEXPj1RU28GWoFJY37dFjtdis3iPeV3T1BdzG8FWrHsVRFh74paGE25KgU8dIfAKqPo1kvx5OVxQujuNSd0+AgE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

djI6IHN5bWJvcyBhcmUgc3RvcmVkIGluIGxleGljYWwgb3JkZXIuCnYzOiBkcm9wIGV4cG9ydC9p
bXBvcnQgYW5kIGV4dHJhIHF1ZXJ5IGluZGlyZWN0aW9uCgpTaWduZWQtb2ZmLWJ5OiBDaHVubWlu
ZyBaaG91IDxkYXZpZDEuemhvdUBhbWQuY29tPgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGFtZGdwdS9hbWRncHUtc3ltYm9sLWNoZWNr
IHwgIDIgKysKIGFtZGdwdS9hbWRncHUuaCAgICAgICAgICAgIHwgMzkgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIGFtZGdwdS9hbWRncHVfY3MuYyAgICAgICAgIHwgMjMg
KysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvYW1kZ3B1L2FtZGdwdS1zeW1ib2wtY2hlY2sgYi9hbWRncHUvYW1kZ3B1
LXN5bWJvbC1jaGVjawppbmRleCA0ZDgwNjkyMi4uZDNjNWJiODkgMTAwNzU1Ci0tLSBhL2FtZGdw
dS9hbWRncHUtc3ltYm9sLWNoZWNrCisrKyBiL2FtZGdwdS9hbWRncHUtc3ltYm9sLWNoZWNrCkBA
IC01Myw4ICs1MywxMCBAQCBhbWRncHVfY3Nfc3VibWl0X3JhdwogYW1kZ3B1X2NzX3N1Ym1pdF9y
YXcyCiBhbWRncHVfY3Nfc3luY29ial9leHBvcnRfc3luY19maWxlCiBhbWRncHVfY3Nfc3luY29i
al9pbXBvcnRfc3luY19maWxlCithbWRncHVfY3Nfc3luY29ial9xdWVyeQogYW1kZ3B1X2NzX3N5
bmNvYmpfcmVzZXQKIGFtZGdwdV9jc19zeW5jb2JqX3NpZ25hbAorYW1kZ3B1X2NzX3N5bmNvYmpf
dGltZWxpbmVfd2FpdAogYW1kZ3B1X2NzX3N5bmNvYmpfd2FpdAogYW1kZ3B1X2NzX3dhaXRfZmVu
Y2VzCiBhbWRncHVfY3Nfd2FpdF9zZW1hcGhvcmUKZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRncHUu
aCBiL2FtZGdwdS9hbWRncHUuaAppbmRleCBjNDRhNDk1YS4uNWViZmUxZTMgMTAwNjQ0Ci0tLSBh
L2FtZGdwdS9hbWRncHUuaAorKysgYi9hbWRncHUvYW1kZ3B1LmgKQEAgLTE1MzYsNiArMTUzNiw0
NSBAQCBpbnQgYW1kZ3B1X2NzX3N5bmNvYmpfd2FpdChhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYs
CiAJCQkgICBpbnQ2NF90IHRpbWVvdXRfbnNlYywgdW5zaWduZWQgZmxhZ3MsCiAJCQkgICB1aW50
MzJfdCAqZmlyc3Rfc2lnbmFsZWQpOwogCisvKioKKyAqICBXYWl0IGZvciBvbmUgb3IgYWxsIHN5
bmMgb2JqZWN0cyBvbiB0aGVpciBwb2ludHMgdG8gc2lnbmFsLgorICoKKyAqIFxwYXJhbSAgIGRl
dgkgICAgLSBcYyBbaW5dIHNlbGYtZXhwbGFuYXRvcnkKKyAqIFxwYXJhbSAgIGhhbmRsZXMgLSBc
YyBbaW5dIGFycmF5IG9mIHN5bmMgb2JqZWN0IGhhbmRsZXMKKyAqIFxwYXJhbSAgIHBvaW50cyAt
IFxjIFtpbl0gYXJyYXkgb2Ygc3luYyBwb2ludHMgdG8gd2FpdAorICogXHBhcmFtICAgbnVtX2hh
bmRsZXMgLSBcYyBbaW5dIHNlbGYtZXhwbGFuYXRvcnkKKyAqIFxwYXJhbSAgIHRpbWVvdXRfbnNl
YyAtIFxjIFtpbl0gc2VsZi1leHBsYW5hdG9yeQorICogXHBhcmFtICAgZmxhZ3MgICAtIFxjIFtp
bl0gYSBiaXRtYXNrIG9mIERSTV9TWU5DT0JKX1dBSVRfRkxBR1NfKgorICogXHBhcmFtICAgZmly
c3Rfc2lnbmFsZWQgLSBcYyBbaW5dIHNlbGYtZXhwbGFuYXRvcnkKKyAqCisgKiBccmV0dXJuICAg
MCBvbiBzdWNjZXNzXG4KKyAqICAgICAgICAgIC1FVElNRSAtIFRpbWVvdXQKKyAqICAgICAgICAg
IDwwIC0gTmVnYXRpdmUgUE9TSVggRXJyb3IgY29kZQorICoKKyAqLworaW50IGFtZGdwdV9jc19z
eW5jb2JqX3RpbWVsaW5lX3dhaXQoYW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2LAorCQkJCSAgICB1
aW50MzJfdCAqaGFuZGxlcywgdWludDY0X3QgKnBvaW50cywKKwkJCQkgICAgdW5zaWduZWQgbnVt
X2hhbmRsZXMsCisJCQkJICAgIGludDY0X3QgdGltZW91dF9uc2VjLCB1bnNpZ25lZCBmbGFncywK
KwkJCQkgICAgdWludDMyX3QgKmZpcnN0X3NpZ25hbGVkKTsKKy8qKgorICogIFF1ZXJ5IHN5bmMg
b2JqZWN0cyBwYXlsb2Fkcy4KKyAqCisgKiBccGFyYW0gICBkZXYJICAgIC0gXGMgW2luXSBzZWxm
LWV4cGxhbmF0b3J5CisgKiBccGFyYW0gICBoYW5kbGVzIC0gXGMgW2luXSBhcnJheSBvZiBzeW5j
IG9iamVjdCBoYW5kbGVzCisgKiBccGFyYW0gICBwb2ludHMgLSBcYyBbb3V0XSBhcnJheSBvZiBz
eW5jIHBvaW50cyByZXR1cm5lZCwgd2hpY2ggcHJlc2VudHMKKyAqIHN5bmNvYmogcGF5bG9hZC4K
KyAqIFxwYXJhbSAgIG51bV9oYW5kbGVzIC0gXGMgW2luXSBzZWxmLWV4cGxhbmF0b3J5CisgKgor
ICogXHJldHVybiAgIDAgb24gc3VjY2Vzc1xuCisgKiAgICAgICAgICAtRVRJTUUgLSBUaW1lb3V0
CisgKiAgICAgICAgICA8MCAtIE5lZ2F0aXZlIFBPU0lYIEVycm9yIGNvZGUKKyAqCisgKi8KK2lu
dCBhbWRncHVfY3Nfc3luY29ial9xdWVyeShhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsCisJCQkg
ICAgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMsCisJCQkgICAgdW5zaWduZWQg
bnVtX2hhbmRsZXMpOworCiAvKioKICAqICBFeHBvcnQga2VybmVsIHN5bmMgb2JqZWN0IHRvIHNo
YXJlYWJsZSBmZC4KICAqCmRpZmYgLS1naXQgYS9hbWRncHUvYW1kZ3B1X2NzLmMgYi9hbWRncHUv
YW1kZ3B1X2NzLmMKaW5kZXggN2M1YjlkMTMuLjlmY2FmMmM0IDEwMDY0NAotLS0gYS9hbWRncHUv
YW1kZ3B1X2NzLmMKKysrIGIvYW1kZ3B1L2FtZGdwdV9jcy5jCkBAIC02ODYsNiArNjg2LDI5IEBA
IGRybV9wdWJsaWMgaW50IGFtZGdwdV9jc19zeW5jb2JqX3dhaXQoYW1kZ3B1X2RldmljZV9oYW5k
bGUgZGV2LAogCQkJICAgICAgZmxhZ3MsIGZpcnN0X3NpZ25hbGVkKTsKIH0KIAorZHJtX3B1Ymxp
YyBpbnQgYW1kZ3B1X2NzX3N5bmNvYmpfdGltZWxpbmVfd2FpdChhbWRncHVfZGV2aWNlX2hhbmRs
ZSBkZXYsCisJCQkJCSAgICAgICB1aW50MzJfdCAqaGFuZGxlcywgdWludDY0X3QgKnBvaW50cywK
KwkJCQkJICAgICAgIHVuc2lnbmVkIG51bV9oYW5kbGVzLAorCQkJCQkgICAgICAgaW50NjRfdCB0
aW1lb3V0X25zZWMsIHVuc2lnbmVkIGZsYWdzLAorCQkJCQkgICAgICAgdWludDMyX3QgKmZpcnN0
X3NpZ25hbGVkKQoreworCWlmIChOVUxMID09IGRldikKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwly
ZXR1cm4gZHJtU3luY29ialRpbWVsaW5lV2FpdChkZXYtPmZkLCBoYW5kbGVzLCBwb2ludHMsIG51
bV9oYW5kbGVzLAorCQkJCSAgICAgIHRpbWVvdXRfbnNlYywgZmxhZ3MsIGZpcnN0X3NpZ25hbGVk
KTsKK30KKworZHJtX3B1YmxpYyBpbnQgYW1kZ3B1X2NzX3N5bmNvYmpfcXVlcnkoYW1kZ3B1X2Rl
dmljZV9oYW5kbGUgZGV2LAorCQkJCSAgICAgICB1aW50MzJfdCAqaGFuZGxlcywgdWludDY0X3Qg
KnBvaW50cywKKwkJCQkgICAgICAgdW5zaWduZWQgbnVtX2hhbmRsZXMpCit7CisJaWYgKE5VTEwg
PT0gZGV2KQorCQlyZXR1cm4gLUVJTlZBTDsKKworCXJldHVybiBkcm1TeW5jb2JqUXVlcnkoZGV2
LT5mZCwgaGFuZGxlcywgcG9pbnRzLCBudW1faGFuZGxlcyk7Cit9CisKIGRybV9wdWJsaWMgaW50
IGFtZGdwdV9jc19leHBvcnRfc3luY29iaihhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsCiAJCQkJ
CXVpbnQzMl90IGhhbmRsZSwKIAkJCQkJaW50ICpzaGFyZWRfZmQpCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
