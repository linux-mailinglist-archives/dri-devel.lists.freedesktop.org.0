Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570AA1B33D
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 11:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E3589B0C;
	Mon, 13 May 2019 09:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680057.outbound.protection.outlook.com [40.107.68.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114DA899B5;
 Mon, 13 May 2019 09:53:18 +0000 (UTC)
Received: from BN8PR12CA0012.namprd12.prod.outlook.com (2603:10b6:408:60::25)
 by DM6PR12MB2666.namprd12.prod.outlook.com (2603:10b6:5:4a::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.24; Mon, 13 May
 2019 09:53:16 +0000
Received: from CO1NAM03FT022.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by BN8PR12CA0012.outlook.office365.com
 (2603:10b6:408:60::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.20 via Frontend
 Transport; Mon, 13 May 2019 09:53:15 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT022.mail.protection.outlook.com (10.152.80.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Mon, 13 May 2019 09:53:15 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 13 May 2019
 04:53:13 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH libdrm 2/7] add timeline wait/query ioctl v2
Date: Mon, 13 May 2019 17:53:00 +0800
Message-ID: <20190513095305.14110-2-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513095305.14110-1-david1.zhou@amd.com>
References: <20190513095305.14110-1-david1.zhou@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(396003)(39860400002)(376002)(136003)(2980300002)(428003)(189003)(199004)(68736007)(72206003)(2616005)(126002)(476003)(486006)(11346002)(336012)(426003)(70586007)(446003)(186003)(70206006)(478600001)(48376002)(76176011)(16586007)(54906003)(8676002)(8936002)(81156014)(51416003)(26005)(86362001)(77096007)(110136005)(81166006)(316002)(50466002)(7696005)(47776003)(4326008)(305945005)(53416004)(50226002)(5660300002)(1076003)(356004)(6666004)(53936002)(2906002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2666; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74259d86-8eb8-4f77-f925-08d6d788d1b0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM6PR12MB2666; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2666:
X-Microsoft-Antispam-PRVS: <DM6PR12MB26661C9336122AEC4CE1C147B40F0@DM6PR12MB2666.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 0036736630
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 7ENJNtP7djmycIl8Lx2XLvgmRY5ZdeqPe1pAz3yF5QNG27+Ut7+0fc821YfEkQltlPsABUfiCmiXFmCxr1b1KNc13RDGkzHjAyn4P/PPJZX+sjS2/y6Oq2eiPKYLplMXjB2vDYDCsodpXMqAapRNK2HxQo/Q796nnprFmjTMN+ASc7CS/WRR/jIUltwQ34NWG2nOgKRmf5RS1vmvBMcGNDWPOAX3nL+0rHu8VFkAk5W/K+UN76YDlGWlY6avgEfdvUtd10Q31Ug+vHrRFTn2k1bX0U8136FSSSSsDAuoT4GQL+tFP1bdO/TNuc7vRuYm6cblLDIGqphaC938LemuNv+V4UksRPVpCm7m62uHwGEw4WMyUtw+cqIE/dhls068vE65TltPbZg7H5hGbaByu9NJP1iBjrchylAOx8Syyh8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2019 09:53:15.0972 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74259d86-8eb8-4f77-f925-08d6d788d1b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2666
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5d8B3nMVB0v27E14kiUaB5Wt6/1rDeMUy/KwWwTfiIk=;
 b=PISt+zvnrv7q+VR7ITexnrYx/mwJZQ4wv/hk3cScsHEvRkOosT5UyLILbYr2CgqmOXaLfw98thxR+hHcQlCAGhWCciInR3JRDhrl4om88u60MBj+Ns+YlEyr39yFqQNwo6/+wRaW/d6XXITeK2Dmc+T4+hoX0DnNONVmdICHgm8=
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

djI6IGRyb3AgZXhwb3J0L2ltcG9ydAoKU2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2
aWQxLnpob3VAYW1kLmNvbT4KLS0tCiB4Zjg2ZHJtLmMgfCA0NCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogeGY4NmRybS5oIHwgIDYgKysrKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94Zjg2ZHJtLmMgYi94Zjg2
ZHJtLmMKaW5kZXggMmMxOTM3NmIuLjE3ZTNkODgwIDEwMDY0NAotLS0gYS94Zjg2ZHJtLmMKKysr
IGIveGY4NmRybS5jCkBAIC00MjU2LDMgKzQyNTYsNDcgQEAgZHJtX3B1YmxpYyBpbnQgZHJtU3lu
Y29ialNpZ25hbChpbnQgZmQsIGNvbnN0IHVpbnQzMl90ICpoYW5kbGVzLAogICAgIHJldCA9IGRy
bUlvY3RsKGZkLCBEUk1fSU9DVExfU1lOQ09CSl9TSUdOQUwsICZhcmdzKTsKICAgICByZXR1cm4g
cmV0OwogfQorCitkcm1fcHVibGljIGludCBkcm1TeW5jb2JqVGltZWxpbmVXYWl0KGludCBmZCwg
dWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMsCisJCQkJICAgICAgdW5zaWduZWQg
bnVtX2hhbmRsZXMsCisJCQkJICAgICAgaW50NjRfdCB0aW1lb3V0X25zZWMsIHVuc2lnbmVkIGZs
YWdzLAorCQkJCSAgICAgIHVpbnQzMl90ICpmaXJzdF9zaWduYWxlZCkKK3sKKyAgICBzdHJ1Y3Qg
ZHJtX3N5bmNvYmpfdGltZWxpbmVfd2FpdCBhcmdzOworICAgIGludCByZXQ7CisKKyAgICBtZW1j
bGVhcihhcmdzKTsKKyAgICBhcmdzLmhhbmRsZXMgPSAodWludHB0cl90KWhhbmRsZXM7CisgICAg
YXJncy5wb2ludHMgPSAodWludDY0X3QpKHVpbnRwdHJfdClwb2ludHM7CisgICAgYXJncy50aW1l
b3V0X25zZWMgPSB0aW1lb3V0X25zZWM7CisgICAgYXJncy5jb3VudF9oYW5kbGVzID0gbnVtX2hh
bmRsZXM7CisgICAgYXJncy5mbGFncyA9IGZsYWdzOworCisgICAgcmV0ID0gZHJtSW9jdGwoZmQs
IERSTV9JT0NUTF9TWU5DT0JKX1RJTUVMSU5FX1dBSVQsICZhcmdzKTsKKyAgICBpZiAocmV0IDwg
MCkKKyAgICAgICAgcmV0dXJuIC1lcnJubzsKKworICAgIGlmIChmaXJzdF9zaWduYWxlZCkKKyAg
ICAgICAgKmZpcnN0X3NpZ25hbGVkID0gYXJncy5maXJzdF9zaWduYWxlZDsKKyAgICByZXR1cm4g
cmV0OworfQorCisKK2RybV9wdWJsaWMgaW50IGRybVN5bmNvYmpRdWVyeShpbnQgZmQsIHVpbnQz
Ml90ICpoYW5kbGVzLCB1aW50NjRfdCAqcG9pbnRzLAorCQkJICAgICAgIHVpbnQzMl90IGhhbmRs
ZV9jb3VudCkKK3sKKyAgICBzdHJ1Y3QgZHJtX3N5bmNvYmpfdGltZWxpbmVfYXJyYXkgYXJnczsK
KyAgICBpbnQgcmV0OworCisgICAgbWVtY2xlYXIoYXJncyk7CisgICAgYXJncy5oYW5kbGVzID0g
KHVpbnRwdHJfdCloYW5kbGVzOworICAgIGFyZ3MucG9pbnRzID0gKHVpbnQ2NF90KSh1aW50cHRy
X3QpcG9pbnRzOworICAgIGFyZ3MuY291bnRfaGFuZGxlcyA9IGhhbmRsZV9jb3VudDsKKworICAg
IHJldCA9IGRybUlvY3RsKGZkLCBEUk1fSU9DVExfU1lOQ09CSl9RVUVSWSwgJmFyZ3MpOworICAg
IGlmIChyZXQpCisgICAgICAgIHJldHVybiByZXQ7CisgICAgcmV0dXJuIDA7Cit9CisKKwpkaWZm
IC0tZ2l0IGEveGY4NmRybS5oIGIveGY4NmRybS5oCmluZGV4IDg4N2VjYzc2Li42MGM3YTg0ZiAx
MDA2NDQKLS0tIGEveGY4NmRybS5oCisrKyBiL3hmODZkcm0uaApAQCAtODc2LDYgKzg3NiwxMiBA
QCBleHRlcm4gaW50IGRybVN5bmNvYmpXYWl0KGludCBmZCwgdWludDMyX3QgKmhhbmRsZXMsIHVu
c2lnbmVkIG51bV9oYW5kbGVzLAogCQkJICB1aW50MzJfdCAqZmlyc3Rfc2lnbmFsZWQpOwogZXh0
ZXJuIGludCBkcm1TeW5jb2JqUmVzZXQoaW50IGZkLCBjb25zdCB1aW50MzJfdCAqaGFuZGxlcywg
dWludDMyX3QgaGFuZGxlX2NvdW50KTsKIGV4dGVybiBpbnQgZHJtU3luY29ialNpZ25hbChpbnQg
ZmQsIGNvbnN0IHVpbnQzMl90ICpoYW5kbGVzLCB1aW50MzJfdCBoYW5kbGVfY291bnQpOworZXh0
ZXJuIGludCBkcm1TeW5jb2JqVGltZWxpbmVXYWl0KGludCBmZCwgdWludDMyX3QgKmhhbmRsZXMs
IHVpbnQ2NF90ICpwb2ludHMsCisJCQkJICB1bnNpZ25lZCBudW1faGFuZGxlcywKKwkJCQkgIGlu
dDY0X3QgdGltZW91dF9uc2VjLCB1bnNpZ25lZCBmbGFncywKKwkJCQkgIHVpbnQzMl90ICpmaXJz
dF9zaWduYWxlZCk7CitleHRlcm4gaW50IGRybVN5bmNvYmpRdWVyeShpbnQgZmQsIHVpbnQzMl90
ICpoYW5kbGVzLCB1aW50NjRfdCAqcG9pbnRzLAorCQkJICAgdWludDMyX3QgaGFuZGxlX2NvdW50
KTsKIAogI2lmIGRlZmluZWQoX19jcGx1c3BsdXMpCiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
