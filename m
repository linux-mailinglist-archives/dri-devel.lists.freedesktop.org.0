Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD49EFF5F9
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 23:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25C46E22D;
	Sat, 16 Nov 2019 22:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690050.outbound.protection.outlook.com [40.107.69.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3610C6E1F9;
 Sat, 16 Nov 2019 22:01:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYqzRsyiPutSIX8lasReWrC2B7QAcoXIUKWCfx/IeUNDDnxMotR/ej6Q/RM8BIPujMZzqqS/vX9G7EdwKNDf4YeFBMq38dHJJRLfmU7lyQnh7WVzhdp4LggqoxzUty9eGpYlxcYMRGX10Aq+GtmgzP4LnxLY3UOTezsF5txNNIvw/jqW324RuE4uPXvFIv6BIuvfQTTYArGiuKPPCg6rbPufGP/tVi4Y3iJThbSg/dX+AvUADtp1gqzoynSSrxCICxVEtLmmQ+i2U/x+tCj6khIRxDd1iV44Uip+A0rbNJw9wN5NueIkacqGsSU7+D+gqcQ8GjzidjQgB9QMuIOQ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UL5+RyBL1P0QGM4QJGMY+ZKg3MCltYh3r2o+uJdg4i8=;
 b=MdzRX91JnMWknAXpka50sCYapmR3XdBBamIwS9CZJzhgc3W71gLcmvEs0pqFoiZAE1yUxuijtEkjjIv1OSSUXFJM0cyh7bNyU7IPzXFzHkv8LAgd5fu1mKg6CQdD8z5hr9QWsPVGi7oYDXwhT3VNmk6weCH4no+LmBNNpPQmKULVsOxkLigQRhl7tYVK1HUprcdlzKU9iBpNZLAB4C2U7CBWVl6d3lnlDn2BCHWJDfNmgH9uOwiVsgNDSb8ndkdPoRZ9sOeaO1aG1JhERY3xRC1FKx4AVYLMj68Zwe0oux6QNEqQ4P9mmMk0U/vuKTslRfb8Nu7GoO3aVfM35iOjww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0017.namprd12.prod.outlook.com
 (2603:10b6:910:16::27) by CY4PR1201MB0054.namprd12.prod.outlook.com
 (2603:10b6:910:1a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Sat, 16 Nov
 2019 22:01:41 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::200) by CY4PR1201CA0017.outlook.office365.com
 (2603:10b6:910:16::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Sat, 16 Nov 2019 22:01:41 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Sat, 16 Nov 2019 22:01:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:38 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:38 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sat, 16 Nov 2019 16:01:37 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v7 12/17] drm/dp_mst: Add branch bandwidth validation to MST
 atomic check
Date: Sat, 16 Nov 2019 17:01:23 -0500
Message-ID: <20191116220128.16598-13-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191116220128.16598-1-mikita.lipski@amd.com>
References: <20191116220128.16598-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(428003)(189003)(199004)(36756003)(426003)(305945005)(6916009)(47776003)(48376002)(16586007)(356004)(316002)(6666004)(54906003)(86362001)(50466002)(2351001)(26005)(336012)(186003)(126002)(53416004)(478600001)(14444005)(486006)(4326008)(8936002)(81166006)(70586007)(70206006)(1076003)(50226002)(2616005)(2876002)(81156014)(7696005)(51416003)(476003)(5660300002)(8676002)(11346002)(446003)(2906002)(76176011)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0054; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2897b58d-b2bb-40d1-9c18-08d76ae08fe0
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0054:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00545B74D73563607AB98EFDE4730@CY4PR1201MB0054.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:116;
X-Forefront-PRVS: 02234DBFF6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gRhFLQiJQcJZEE19QGm4wkXKdJg3unP8VeR1gOJaxkImQfuieWCgVv5yz1rRcqRl5r9BbQ/kKpNtWnluDT62CHoAmAGL/nh8FtBDQ5NSmYrAtSROpHZ64u+s0+l19vdz4cQQxzRzxSmCyzODwJhAA4oMwYzkv3GrJ9aD9xRYkucox/I8RtBJ1S+kaIZX2lyIfN7AMnRkQQQGqFiUVx0KWEC9NvJgp55E7NcpNMBzka50CTpKwPL+2N5nUdrehJJBfbl52SGONjXS2bBjm+9k/J/RSdxXBqPKISvVKoyq2coHpYi3Fd1Bs9VJmNUKYiR592/ZMd/WIUkQLHw/JDyLf1JkwTzoVgNexcIHA9V7AIfyojVP+VQughg5ooI/DC54GLMutU12xjsF+GOkF5zjr3QFnvF3JbvHlM6L9s1ntVkoATrYYU/SZ2ntHT3hHk/d
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2019 22:01:41.3122 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2897b58d-b2bb-40d1-9c18-08d76ae08fe0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0054
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UL5+RyBL1P0QGM4QJGMY+ZKg3MCltYh3r2o+uJdg4i8=;
 b=wMciXDq4ZfJqthwZr71R3hfllfl+nugfCjuTJFBFO3ETYCmCclwich9DQfGaq2Mm21BDkV6CK2f6MTp0Mf+x7dZcqOZSNENwUPsB20qEz8TNznMjkA58oVAA8noO+jw8tEfRTxY9gCg0JJ6DNgeiwaw5CKsRSV2HKoeg2LrArYc=
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
Cc: Jerry Zuo <Jerry.Zuo@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKQWRkaW5nIFBCTiBh
dHRyaWJ1dGUgdG8gZHJtX2RwX3ZjcGlfYWxsb2NhdGlvbiBzdHJ1Y3R1cmUgdG8Ka2VlcCB0cmFj
ayBvZiBob3cgbXVjaCBiYW5kd2lkdGggZWFjaCBQb3J0IHJlcXVpcmVzLgpBZGRpbmcgZHJtX2Rw
X21zdF9hdG9taWNfY2hlY2tfYndfbGltaXQgdG8gdmVyaWZ5IHRoYXQKc3RhdGUncyBiYW5kd2lk
dGggbmVlZHMgZG9lc24ndCBleGNlZWQgYXZhaWxhYmxlIGJhbmR3aWR0aC4KVGhlIGZ1bnRpb24g
aXMgY2FsbGVkIGluIGRybV9kcF9tc3RfYXRvbWljX2NoZWNrIGFmdGVyCmRybV9kcF9tc3RfYXRv
bWljX2NoZWNrX3RvcG9sb2d5X3N0YXRlIHRvIGZ1bGx5IHZlcmlmeSB0aGF0CnRoZSBwcm9wb3Nl
ZCB0b3BvbG9neSBpcyBzdXBwb3J0ZWQuCgpDYzogSmVycnkgWnVvIDxKZXJyeS5adW9AYW1kLmNv
bT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogTHl1ZGUg
UGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogTWlraXRhIExpcHNraSA8bWlr
aXRhLmxpcHNraUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMgfCA2NyArKysrKysrKysrKysrKysrKysrKysrKysrKy0KIGluY2x1ZGUvZHJtL2RybV9k
cF9tc3RfaGVscGVyLmggICAgICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMK
aW5kZXggOThjYzkzZDVkZGQ3Li41MDcyYzFlM2RjZmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9t
c3RfdG9wb2xvZ3kuYwpAQCAtMzI0Myw3ICszMjQzLDcgQEAgaW50IGRybV9kcF9hdG9taWNfZmlu
ZF92Y3BpX3Nsb3RzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIHsKIAlzdHJ1Y3Qg
ZHJtX2RwX21zdF90b3BvbG9neV9zdGF0ZSAqdG9wb2xvZ3lfc3RhdGU7CiAJc3RydWN0IGRybV9k
cF92Y3BpX2FsbG9jYXRpb24gKnBvcywgKnZjcGkgPSBOVUxMOwotCWludCBwcmV2X3Nsb3RzLCBy
ZXFfc2xvdHMsIHJldDsKKwlpbnQgcHJldl9zbG90cywgcHJldl9idywgcmVxX3Nsb3RzLCByZXQ7
CiAKIAl0b3BvbG9neV9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X21zdF90b3BvbG9neV9zdGF0ZShz
dGF0ZSwgbWdyKTsKIAlpZiAoSVNfRVJSKHRvcG9sb2d5X3N0YXRlKSkKQEAgLTMyNTQsNiArMzI1
NCw3IEBAIGludCBkcm1fZHBfYXRvbWljX2ZpbmRfdmNwaV9zbG90cyhzdHJ1Y3QgZHJtX2F0b21p
Y19zdGF0ZSAqc3RhdGUsCiAJCWlmIChwb3MtPnBvcnQgPT0gcG9ydCkgewogCQkJdmNwaSA9IHBv
czsKIAkJCXByZXZfc2xvdHMgPSB2Y3BpLT52Y3BpOworCQkJcHJldl9idyA9IHZjcGktPnBibjsK
IAogCQkJLyoKIAkJCSAqIFRoaXMgc2hvdWxkIG5ldmVyIGhhcHBlbiwgdW5sZXNzIHRoZSBkcml2
ZXIgdHJpZXMKQEAgLTMyNjksOCArMzI3MCwxMCBAQCBpbnQgZHJtX2RwX2F0b21pY19maW5kX3Zj
cGlfc2xvdHMoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAogCQkJYnJlYWs7CiAJCX0K
IAl9Ci0JaWYgKCF2Y3BpKQorCWlmICghdmNwaSkgewogCQlwcmV2X3Nsb3RzID0gMDsKKwkJcHJl
dl9idyA9IDA7CisJfQogCiAJaWYgKHBibl9kaXYgPD0gMCkKIAkJcGJuX2RpdiA9IG1nci0+cGJu
X2RpdjsKQEAgLTMyODAsNiArMzI4Myw5IEBAIGludCBkcm1fZHBfYXRvbWljX2ZpbmRfdmNwaV9z
bG90cyhzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsCiAJRFJNX0RFQlVHX0FUT01JQygi
W0NPTk5FQ1RPUjolZDolc10gW01TVCBQT1JUOiVwXSBWQ1BJICVkIC0+ICVkXG4iLAogCQkJIHBv
cnQtPmNvbm5lY3Rvci0+YmFzZS5pZCwgcG9ydC0+Y29ubmVjdG9yLT5uYW1lLAogCQkJIHBvcnQs
IHByZXZfc2xvdHMsIHJlcV9zbG90cyk7CisJRFJNX0RFQlVHX0FUT01JQygiW0NPTk5FQ1RPUjol
ZDolc10gW01TVCBQT1JUOiVwXSBQQk4gJWQgLT4gJWRcbiIsCisJCQkgcG9ydC0+Y29ubmVjdG9y
LT5iYXNlLmlkLCBwb3J0LT5jb25uZWN0b3ItPm5hbWUsCisJCQkgcG9ydCwgcHJldl9idywgcGJu
KTsKIAogCS8qIEFkZCB0aGUgbmV3IGFsbG9jYXRpb24gdG8gdGhlIHN0YXRlICovCiAJaWYgKCF2
Y3BpKSB7CkBAIC0zMjkyLDYgKzMyOTgsNyBAQCBpbnQgZHJtX2RwX2F0b21pY19maW5kX3ZjcGlf
c2xvdHMoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAogCQlsaXN0X2FkZCgmdmNwaS0+
bmV4dCwgJnRvcG9sb2d5X3N0YXRlLT52Y3Bpcyk7CiAJfQogCXZjcGktPnZjcGkgPSByZXFfc2xv
dHM7CisJdmNwaS0+cGJuID0gcGJuOwogCiAJcmV0ID0gcmVxX3Nsb3RzOwogCXJldHVybiByZXQ7
CkBAIC0zODM3LDYgKzM4NDQsNTkgQEAgc3RhdGljIHZvaWQgZHJtX2RwX21zdF9kZXN0cm95X3N0
YXRlKHN0cnVjdCBkcm1fcHJpdmF0ZV9vYmogKm9iaiwKIAlrZnJlZShtc3Rfc3RhdGUpOwogfQog
CitzdGF0aWMgYm9vbCBkcm1fZHBfbXN0X3BvcnRfZG93bnN0cmVhbV9vZl9icmFuY2goc3RydWN0
IGRybV9kcF9tc3RfcG9ydCAqcG9ydCwKKwkJCQkJCSBzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2gg
KmJyYW5jaCkKK3sKKwl3aGlsZSAocG9ydC0+cGFyZW50KSB7CisJCWlmIChwb3J0LT5wYXJlbnQg
PT0gYnJhbmNoKQorCQkJcmV0dXJuIHRydWU7CisKKwkJaWYgKHBvcnQtPnBhcmVudC0+cG9ydF9w
YXJlbnQpCisJCQlwb3J0ID0gcG9ydC0+cGFyZW50LT5wb3J0X3BhcmVudDsKKwkJZWxzZQorCQkJ
YnJlYWs7CisJfQorCXJldHVybiBmYWxzZTsKK30KKworc3RhdGljIGlubGluZQoraW50IGRybV9k
cF9tc3RfYXRvbWljX2NoZWNrX2J3X2xpbWl0KHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqYnJh
bmNoLAorCQkJCSAgICAgc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfc3RhdGUgKm1zdF9zdGF0
ZSkKK3sKKwlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0OworCXN0cnVjdCBkcm1fZHBfdmNw
aV9hbGxvY2F0aW9uICp2Y3BpOworCWludCBwYm5fbGltaXQgPSAwLCBwYm5fdXNlZCA9IDA7CisK
KwlsaXN0X2Zvcl9lYWNoX2VudHJ5KHBvcnQsICZicmFuY2gtPnBvcnRzLCBuZXh0KSB7CisJCWlm
IChwb3J0LT5tc3RiKSB7CisJCQlpZiAoZHJtX2RwX21zdF9hdG9taWNfY2hlY2tfYndfbGltaXQo
cG9ydC0+bXN0YiwgbXN0X3N0YXRlKSkKKwkJCQlyZXR1cm4gLUVJTlZBTDsKKwkJfQorCQlpZiAo
cG9ydC0+YXZhaWxhYmxlX3BibiA+IDApCisJCQlwYm5fbGltaXQgPSBwb3J0LT5hdmFpbGFibGVf
cGJuOworCX0KKwlEUk1fREVCVUdfQVRPTUlDKCJbTVNUIEJSQU5DSDolcF0gYnJhbmNoIGhhcyAl
ZCBQQk4gYXZhaWxhYmxlXG4iLAorCQkJCQkgYnJhbmNoLAorCQkJCQkgcGJuX2xpbWl0KTsKKwor
CWxpc3RfZm9yX2VhY2hfZW50cnkodmNwaSwgJm1zdF9zdGF0ZS0+dmNwaXMsIG5leHQpIHsKKwkJ
aWYgKCF2Y3BpLT5wYm4pCisJCQljb250aW51ZTsKKworCQlpZiAoZHJtX2RwX21zdF9wb3J0X2Rv
d25zdHJlYW1fb2ZfYnJhbmNoKHZjcGktPnBvcnQsIGJyYW5jaCkpCisJCQlwYm5fdXNlZCArPSB2
Y3BpLT5wYm47CisJfQorCURSTV9ERUJVR19BVE9NSUMoIltNU1QgQlJBTkNIOiVwXSBicmFuY2gg
dXNlZCAlZCBQQk5cbiIsCisJCQkgYnJhbmNoLAorCQkJIHBibl91c2VkKTsKKwlpZiAocGJuX3Vz
ZWQgPiBwYm5fbGltaXQpIHsKKwkJRFJNX0RFQlVHX0FUT01JQygiW01TVCBCUkFOQ0g6JXBdIE5v
IGF2YWlsYWJsZSBiYW5kd2lkdGhcbiIsCisJCQkJIGJyYW5jaCk7CisJCXJldHVybiAtRUlOVkFM
OworCX0KKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGlubGluZSBpbnQKIGRybV9kcF9tc3RfYXRv
bWljX2NoZWNrX3RvcG9sb2d5X3N0YXRlKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAq
bWdyLAogCQkJCSAgICAgICBzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9zdGF0ZSAqbXN0X3N0
YXRlKQpAQCAtMzk2OCw2ICs0MDI4LDkgQEAgaW50IGRybV9kcF9tc3RfYXRvbWljX2NoZWNrKHN0
cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKIAkJcmV0ID0gZHJtX2RwX21zdF9hdG9taWNf
Y2hlY2tfdG9wb2xvZ3lfc3RhdGUobWdyLCBtc3Rfc3RhdGUpOwogCQlpZiAocmV0KQogCQkJYnJl
YWs7CisJCXJldCA9IGRybV9kcF9tc3RfYXRvbWljX2NoZWNrX2J3X2xpbWl0KG1nci0+bXN0X3By
aW1hcnksIG1zdF9zdGF0ZSk7CisJCWlmIChyZXQpCisJCQlicmVhazsKIAl9CiAKIAlyZXR1cm4g
cmV0OwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaCBiL2luY2x1
ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKaW5kZXggYjFiMDBkZTMwODNiLi41YTExOWE0MGVk
NWEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKKysrIGIvaW5j
bHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaApAQCAtNDMxLDYgKzQzMSw3IEBAIHN0cnVjdCBk
cm1fZHBfcGF5bG9hZCB7CiBzdHJ1Y3QgZHJtX2RwX3ZjcGlfYWxsb2NhdGlvbiB7CiAJc3RydWN0
IGRybV9kcF9tc3RfcG9ydCAqcG9ydDsKIAlpbnQgdmNwaTsKKwlpbnQgcGJuOwogCWJvb2wgZHNj
X2VuYWJsZWQ7CiAJc3RydWN0IGxpc3RfaGVhZCBuZXh0OwogfTsKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
