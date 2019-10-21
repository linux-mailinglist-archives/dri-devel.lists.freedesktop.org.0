Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BB0DF620
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 21:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101B26E23B;
	Mon, 21 Oct 2019 19:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700064.outbound.protection.outlook.com [40.107.70.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81A26E239;
 Mon, 21 Oct 2019 19:37:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQfzaFQFWHmF9MgYipzkfjS6NlV1QNTXp6G66sM6nm6dNBGH8sSGejLIf9v24+2PyzhXX7Guyb9ewCj1hNpgqNSaF5ISEDqzOrj03CL0ZRlj0VbrcE2ZQ7vYQGPL9daFcu/gc1H3nCIqiVVH1QzmtgQst2r/0r49kT/05PvZ3eDTWMhPDZGPsYro/b2tiN3U+BPKlGlmCVTHzLApyRdsoim93b9aZ9zt1LF4YISkMVPWqYm0yPhnuXemCosZ3FNoIxvma2iyfdXF5+UikxW2YplrtpIEiH+ZCFlCEHjy7WRV5LEKbOLc640wnQGN1QKm8rGp+SOZE86g70PtkJb2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9lPBR6Sn47BJ1wowmuG5z9FJHUwGWIONTCTszPjvlE=;
 b=VMCrPev3g6NUqHoaB4YZHQivv43DK7eojNvreszbr6PsTTCO9dQxW4KjkP98ni2tLz9AEfreudaq72FjZxmlnXQWVYlmiF/osvCUqM2nnWpX8ig/qt258n9B96g5hrf1iA+H6eDlFslTuXqEoQeTu8mTuZQu9Kdn6tWiSNqTKmYCVCPSLwft5E1I0JUqpf8uTyuUeEWmndZhwHbOzqyCJJ4dKpB4tC6UEnYyo+Rr1WsDIQ945iQ0YLkAjj5eW9DzAQfa8Rj43otUW7vg5g9Fxv8TcBdLKHVe3mpev/oFv+yE1bcr9oiQUe0QCcJvfWvh7hoIudF4SjCHzn914STE5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0044.namprd12.prod.outlook.com (2603:10b6:802:20::15)
 by MN2PR12MB4256.namprd12.prod.outlook.com (2603:10b6:208:1d2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.24; Mon, 21 Oct
 2019 19:37:52 +0000
Received: from CO1NAM03FT039.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by SN1PR12CA0044.outlook.office365.com
 (2603:10b6:802:20::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2367.20 via Frontend
 Transport; Mon, 21 Oct 2019 19:37:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT039.mail.protection.outlook.com (10.152.81.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2367.14 via Frontend Transport; Mon, 21 Oct 2019 19:37:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 21 Oct
 2019 14:37:49 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 21 Oct
 2019 14:37:49 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 21 Oct 2019 14:37:47 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <lskrejci@gmail.com>
Subject: [PATCH] drm/amdgpu: Add DC feature mask to disable fractional pwm
Date: Mon, 21 Oct 2019 15:37:43 -0400
Message-ID: <20191021193743.24339-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(396003)(428003)(199004)(189003)(316002)(36756003)(1076003)(48376002)(86362001)(14444005)(110136005)(54906003)(50466002)(2201001)(70206006)(70586007)(2876002)(2870700001)(5660300002)(2906002)(478600001)(47776003)(305945005)(50226002)(8676002)(81166006)(2616005)(81156014)(426003)(486006)(4326008)(476003)(126002)(26005)(6666004)(8936002)(356004)(51416003)(186003)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4256; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d59713f-1473-4874-5923-08d7565e295c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4256:
X-Microsoft-Antispam-PRVS: <MN2PR12MB425657230B7CA2B5EFE68EC882690@MN2PR12MB4256.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0197AFBD92
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1T18lLzvYeNT0xFPCHJOaJQcHTIpX8QQIUVzLZRrGflshzMy9N8dRjHLy/3Dr2wZlOvUUtQWcXqKZM9iBV4lnXRmqSe5YPhmOkvMRZsHcAZ1mYpBm2fUtC+OO0V4uDQa6SbFYTFafxMQkc0atPQ2CBaUQOwynesQYazdUvLmG/k93BCGRB+gUNMpgC4NIVlEkUViOhMFyjM4kSpiRgHgJELLBTT0TuRl3St+plpTxBXBRe+7ZKRmhlmDNvbFipUpyyx9X/wc3YUh5AbJAxgBlTMZouhONjZdmwrIhSnbV0CfurH5j3dlipFlo+dJ5yLE06WQq/J8EykBJr5lNlbEJdAI2gSfsDatDFcq520F+GRPm4BcKSkgWkKtL1ZtjHMCoePlI7afBE50A/h/KuQsnR7hnCqFCQqueTmKRU36OojPEShNsgqI67ouF/IePXbE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 19:37:51.5399 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d59713f-1473-4874-5923-08d7565e295c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4256
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9lPBR6Sn47BJ1wowmuG5z9FJHUwGWIONTCTszPjvlE=;
 b=wMGyO7ZKe5cybfj59PxYNwEwru2x0lC3CPjFcvzbsDxAVb1ab1vynyqcI7aeMXHLQTZiEJvQ80ZJKsB4J0tNNdsTC/C+I9Y1bobn/Ts9cikxBMwOpMb8+pffqvR2FsE8bb11e52lp3fRpqnbLNjeZQ+utzUL2zyIzlRaz9JRLSc=
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
Cc: Leo Li <sunpeng.li@amd.com>, Anthony.Koo@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpbV2h5XQoKU29tZSBMRUQgcGFuZWwg
ZHJpdmVycyBtaWdodCBub3QgbGlrZSBmcmFjdGlvbmFsIFBXTS4gSW4gc3VjaCBjYXNlcywKYmFj
a2xpZ2h0IGZsaWNrZXJpbmcgbWF5IGJlIG9ic2VydmVkLgoKW0hvd10KCkFkZCBhIERDIGZlYXR1
cmUgbWFzayB0byBkaXNhYmxlIGZyYWN0aW9uYWwgUFdNLCBhbmQgYXNzb2NpYXRlIGl0IHdpdGgK
dGhlIHByZWV4aXN0aW5nIGRjX2NvbmZpZyBmbGFnLgoKVGhlIGZsYWcgaXMgb25seSBwbHVtYmVk
IHRocm91Z2ggdGhlIGRtY3UgZmlybXdhcmUsIHNvIHBsdW1iIGl0IHRocm91Z2gKdGhlIGRyaXZl
ciBwYXRoIGFzIHdlbGwuCgpUbyBkaXNhYmxlLCBhZGQgdGhlIGZvbGxvd2luZyB0byB0aGUgbGlu
dXggY21kbGluZToKYW1kZ3B1LmRjZmVhdHVyZW1hc2s9MHg0CgpTaWduZWQtb2ZmLWJ5OiBMZW8g
TGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMyArKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY2UvZGNlX2FibS5jICAgICAgfCA0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5j
bHVkZS9hbWRfc2hhcmVkLmggICAgICAgICAgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMKaW5kZXggMWNmNGJlYjc2ODM1Li43M2Y5MTdkNGQxZTEgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtNzI4
LDYgKzcyOCw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCiAJaWYgKGFtZGdwdV9kY19mZWF0dXJlX21hc2sgJiBEQ19NVUxUSV9NT05fUFBf
TUNMS19TV0lUQ0hfTUFTSykKIAkJaW5pdF9kYXRhLmZsYWdzLm11bHRpX21vbl9wcF9tY2xrX3N3
aXRjaCA9IHRydWU7CiAKKwlpZiAoYW1kZ3B1X2RjX2ZlYXR1cmVfbWFzayAmIERDX0RJU0FCTEVf
RlJBQ1RJT05BTF9QV01fTUFTSykKKwkJaW5pdF9kYXRhLmZsYWdzLmRpc2FibGVfZnJhY3Rpb25h
bF9wd20gPSB0cnVlOworCiAJaW5pdF9kYXRhLmZsYWdzLnBvd2VyX2Rvd25fZGlzcGxheV9vbl9i
b290ID0gdHJ1ZTsKIAogI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMApkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYWJtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hYm0uYwppbmRleCBkNzU5ZmRjYTdmZGIu
LmI4YTNmYzUwNWM5YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjZS9kY2VfYWJtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9k
Y2VfYWJtLmMKQEAgLTQwNCw2ICs0MDQsMTAgQEAgc3RhdGljIGJvb2wgZGNlX2FibV9pbml0X2Jh
Y2tsaWdodChzdHJ1Y3QgYWJtICphYm0pCiAJLyogRW5hYmxlIHRoZSBiYWNrbGlnaHQgb3V0cHV0
ICovCiAJUkVHX1VQREFURShCTF9QV01fQ05UTCwgQkxfUFdNX0VOLCAxKTsKIAorCS8qIERpc2Fi
bGUgZnJhY3Rpb25hbCBwd20gaWYgY29uZmlndXJlZCAqLworCVJFR19VUERBVEUoQkxfUFdNX0NO
VEwsIEJMX1BXTV9GUkFDVElPTkFMX0VOLAorCQkgICBhYm0tPmN0eC0+ZGMtPmNvbmZpZy5kaXNh
YmxlX2ZyYWN0aW9uYWxfcHdtID8gMCA6IDEpOworCiAJLyogVW5sb2NrIGdyb3VwIDIgYmFja2xp
Z2h0IHJlZ2lzdGVycyAqLwogCVJFR19VUERBVEUoQkxfUFdNX0dSUDFfUkVHX0xPQ0ssCiAJCQlC
TF9QV01fR1JQMV9SRUdfTE9DSywgMCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2luY2x1ZGUvYW1kX3NoYXJlZC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9z
aGFyZWQuaAppbmRleCA4ODg5YWFjZWVjNjAuLjU0NTBlZDc2MmI3YSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oCkBAIC0xNDMsNiArMTQzLDcgQEAgZW51bSBQUF9G
RUFUVVJFX01BU0sgewogZW51bSBEQ19GRUFUVVJFX01BU0sgewogCURDX0ZCQ19NQVNLID0gMHgx
LAogCURDX01VTFRJX01PTl9QUF9NQ0xLX1NXSVRDSF9NQVNLID0gMHgyLAorCURDX0RJU0FCTEVf
RlJBQ1RJT05BTF9QV01fTUFTSyA9IDB4NCwKIH07CiAKIGVudW0gYW1kX2RwbV9mb3JjZWRfbGV2
ZWw7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
