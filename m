Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA93DF634
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 21:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6486E245;
	Mon, 21 Oct 2019 19:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730067.outbound.protection.outlook.com [40.107.73.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4976E245;
 Mon, 21 Oct 2019 19:44:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2b6TLOlyMcFAwfGcGTGeto5BAmcfkHYrehLs77Z46xZAHyasNCeiYoKFya9Vnq5WgEUFjVbCtQSYtkm6rQw/qPGJo8qGfhOYU/QgMbgwdkcM09TPbKCJP1UKbx+HdLF4YuOOafKWFwaS/431qOY1CMs5CanR7fHmmNDmc4bfVGJDHPMNRUpVUaV7OEpzaXLS0UAXUdAlOniRkRz/63h5O9J9I+WI07nW//mItY6INec6UEEJJ+B7+8nAYPoku4kR8C6y0tnkE68iO/FkvZUXCC5fTZPg/bdUYz7SkDlZDRbeCCC7OwnG9nsXmSqU2gRgWkB4aGfKMD72cIyg0EaNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEXstSdHSmcNnHoPHmCI1srE/0MNjX2hmmyD4v9MmFk=;
 b=KfieRMLnXJQfN+m2v0Kgc3Ew7zujrCHTR7CwnHDVXLfx98rhOSVFkuBH7EUi6I4nAtHwidk2qQjHZtddrb89hVl7bzvnqMWKoo7Az0QK/GfqTv3doOt+cTIbAA5663kFbw4VHdr6DkAijEQfLlgkthhVVRsAHFBtxEbOBDa8iYJtcfiHRubY/MwY+ONyCT9O1F3Ul9heO0I4k8vUoUjCwt5aZWPwW+Hr0yoLjryKOXIJkhceQ/dmRGBvf0K4j4KqVtVO7KCxS0scu/1kQupWbbzbH6kdb+Lq78PvyaA0QLRkuVW6JFNlQ6mTC+05QZDEMDdQE4fcheNLKoZmmFLhIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0078.namprd12.prod.outlook.com (2603:10b6:802:20::49)
 by BN8PR12MB3140.namprd12.prod.outlook.com (2603:10b6:408:67::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.24; Mon, 21 Oct
 2019 19:44:36 +0000
Received: from DM3NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by SN1PR12CA0078.outlook.office365.com
 (2603:10b6:802:20::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21 via Frontend
 Transport; Mon, 21 Oct 2019 19:44:35 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT027.mail.protection.outlook.com (10.152.82.190) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Mon, 21 Oct 2019 19:44:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 21 Oct
 2019 14:44:35 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 21 Oct
 2019 14:44:34 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 21 Oct 2019 14:44:34 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <lskrejci@gmail.com>
Subject: [PATCH v2] drm/amdgpu: Add DC feature mask to disable fractional pwm
Date: Mon, 21 Oct 2019 15:44:14 -0400
Message-ID: <20191021194414.24627-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021193743.24339-1-sunpeng.li@amd.com>
References: <20191021193743.24339-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(428003)(189003)(199004)(2201001)(76176011)(86362001)(305945005)(51416003)(70586007)(2906002)(2870700001)(48376002)(47776003)(186003)(70206006)(316002)(2876002)(26005)(486006)(6306002)(1076003)(81156014)(81166006)(14444005)(8676002)(50226002)(356004)(5660300002)(478600001)(6666004)(446003)(54906003)(2616005)(110136005)(426003)(4326008)(11346002)(336012)(126002)(8936002)(50466002)(966005)(476003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3140; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82157376-84a0-4252-7d4b-08d7565f1a36
X-MS-TrafficTypeDiagnostic: BN8PR12MB3140:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <BN8PR12MB314060EED3029724E1BE049E82690@BN8PR12MB3140.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0197AFBD92
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 032XUq6kIJntAQ4WfjMg4wIQkoffF6qgINxE5+DwtGbWKlAg2ZFYJ9g0P++DMDBuYCu1pNthwGMatn0GTVrt6/65AZRpdUPKB5GbcOrM1Qs54c6BiN1xWoHSXdbEg1Mp3o59ahhfoxN74jxz3qLXhYI0+BLP53c+ZfObYIJYx0cS6ftuhtHBLWex1SBzkhefYfD7hiLUn/WIGV449EKRqcs1g/frUkaNiR089w/es/PBxWYQbQgwZy5dq+f5skRkM4a+FmnFJq4NDtJUfjIAB3NJvm9j5QxeBx7+hWw8nm+9rjNHAwKCCnzuWnHYPRCoz3jw5eRAxzRteCqQYXi246Ua79Oo7YBKeXrmfWEZbhx4id34MxG9a8g4oYCn9LgBC7B4ihLK0SHYCC9bEnxktoUzPaeJbM5z46hEXTSgkJLDbzKyEFxxZXyBPWhouNki+aAfKEZImvsRU7RiYCn0IN/+/0l7h4wwjcMPtHMyN9k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 19:44:35.6814 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82157376-84a0-4252-7d4b-08d7565f1a36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3140
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEXstSdHSmcNnHoPHmCI1srE/0MNjX2hmmyD4v9MmFk=;
 b=J2RPk+foc7KHckhVKHBawDa+BFLckbTtjf64URr09xVTXYxbROgqNhsNM2VB0LI+inTBF6tg5lTbTQYLIavsCP7M0aNGoRJjtLgVPoCkjiK9HbZcwOinE+2el3Y1Km0LNbyhaarJ4XlaD8ZJliZze3r2OlSlACAqBudkHp1bxXo=
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
dXggY21kbGluZToKYW1kZ3B1LmRjZmVhdHVyZW1hc2s9MHg0CgpCdWd6aWxsYTogaHR0cHM6Ly9i
dWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ5NTcKU2lnbmVkLW9mZi1ieTog
TGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQoKdjI6IEFkZCBidWd6aWxsYSBsaW5rCgog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDMgKysr
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hYm0uYyAgICAgIHwgNCAr
KysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oICAgICAgICAgIHwg
MSArCiAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDFjZjRiZWI3Njgz
NS4uNzNmOTE3ZDRkMWUxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTcyOCw2ICs3MjgsOSBAQCBzdGF0aWMgaW50IGFtZGdw
dV9kbV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWlmIChhbWRncHVfZGNfZmVh
dHVyZV9tYXNrICYgRENfTVVMVElfTU9OX1BQX01DTEtfU1dJVENIX01BU0spCiAJCWluaXRfZGF0
YS5mbGFncy5tdWx0aV9tb25fcHBfbWNsa19zd2l0Y2ggPSB0cnVlOwogCisJaWYgKGFtZGdwdV9k
Y19mZWF0dXJlX21hc2sgJiBEQ19ESVNBQkxFX0ZSQUNUSU9OQUxfUFdNX01BU0spCisJCWluaXRf
ZGF0YS5mbGFncy5kaXNhYmxlX2ZyYWN0aW9uYWxfcHdtID0gdHJ1ZTsKKwogCWluaXRfZGF0YS5m
bGFncy5wb3dlcl9kb3duX2Rpc3BsYXlfb25fYm9vdCA9IHRydWU7CiAKICNpZmRlZiBDT05GSUdf
RFJNX0FNRF9EQ19EQ04yXzAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY2UvZGNlX2FibS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9k
Y2VfYWJtLmMKaW5kZXggZDc1OWZkY2E3ZmRiLi5iOGEzZmM1MDVjOWIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2FibS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2FibS5jCkBAIC00MDQsNiArNDA0LDEwIEBA
IHN0YXRpYyBib29sIGRjZV9hYm1faW5pdF9iYWNrbGlnaHQoc3RydWN0IGFibSAqYWJtKQogCS8q
IEVuYWJsZSB0aGUgYmFja2xpZ2h0IG91dHB1dCAqLwogCVJFR19VUERBVEUoQkxfUFdNX0NOVEws
IEJMX1BXTV9FTiwgMSk7CiAKKwkvKiBEaXNhYmxlIGZyYWN0aW9uYWwgcHdtIGlmIGNvbmZpZ3Vy
ZWQgKi8KKwlSRUdfVVBEQVRFKEJMX1BXTV9DTlRMLCBCTF9QV01fRlJBQ1RJT05BTF9FTiwKKwkJ
ICAgYWJtLT5jdHgtPmRjLT5jb25maWcuZGlzYWJsZV9mcmFjdGlvbmFsX3B3bSA/IDAgOiAxKTsK
KwogCS8qIFVubG9jayBncm91cCAyIGJhY2tsaWdodCByZWdpc3RlcnMgKi8KIAlSRUdfVVBEQVRF
KEJMX1BXTV9HUlAxX1JFR19MT0NLLAogCQkJQkxfUFdNX0dSUDFfUkVHX0xPQ0ssIDApOwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmgKaW5kZXggODg4OWFhY2VlYzYwLi41
NDUwZWQ3NjJiN2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRf
c2hhcmVkLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaApA
QCAtMTQzLDYgKzE0Myw3IEBAIGVudW0gUFBfRkVBVFVSRV9NQVNLIHsKIGVudW0gRENfRkVBVFVS
RV9NQVNLIHsKIAlEQ19GQkNfTUFTSyA9IDB4MSwKIAlEQ19NVUxUSV9NT05fUFBfTUNMS19TV0lU
Q0hfTUFTSyA9IDB4MiwKKwlEQ19ESVNBQkxFX0ZSQUNUSU9OQUxfUFdNX01BU0sgPSAweDQsCiB9
OwogCiBlbnVtIGFtZF9kcG1fZm9yY2VkX2xldmVsOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
