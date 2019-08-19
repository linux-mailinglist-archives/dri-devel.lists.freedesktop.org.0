Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 658E194920
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 17:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E5A6E20B;
	Mon, 19 Aug 2019 15:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680065.outbound.protection.outlook.com [40.107.68.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817076E1EC;
 Mon, 19 Aug 2019 15:50:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLmyn9eKMmfX7sV7hrXKRWZ5eKCa98iW/0lPPdz4CwqPkqWsZbDrj6g+6BmICgkGq5qU7hq0PSDRdQ1BFiraTlkuDSlWW2XZzY34YkRzHcAy/KWlHHNgdizjXCv9KqSmXxGEAlfWMaSqTgmopUjEYmt+2QJbL+LTIvTOOKyQZO4YmWKf0y7qidGtWjNxvGlYf0oUub3HKWGhA7D9eORsoOQ3YZggq2N2Vokh/1dz82Gzq+1oVOJ75Z4NiFmC8yPfoHfhWrHfm6UP5PV2Zg20oLLEfbXRuUzdpk/muSJ3KVRKPf8+scHRCkZplzi7gGq115SL5yQVgRcJV3QCEc8hKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R99eM9i44x48BvPrmFoVQu/263NNhXDXLKUQYOWpbSg=;
 b=KwVa1AaxWw9WpyAKL2d6Bi/r+2Dm5dd0CrTrQ4PfS5lqYy09wHUlIAonCHb/f/wCIWn6/TShrQ9ziyXJMpXMiSQT8Jzs4R65W4mXdSeanNfQ8/sH2hXHkjwNePfaZwcdTpmyS2DOHtnaC7mWmtqNtF662JZ6XxwYxd3h7bKdrxH5dL1RsQpz3wEkVScllIw3EPhilMx6F2rH97Tjes1Wth0wXfO1hNqQiM7+8NrEP+d06IkdfocL9u72hueoUxoLddqPyvyIFWSLlZcGwL7MmzrHi3YIJOqh4pXTW7Y1Nk2wI6lnu6RsnE7IlTuBHEJtQLSCEu9A0arehypeVjDEGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0046.namprd12.prod.outlook.com (2603:10b6:0:56::14) by
 CY4PR12MB1527.namprd12.prod.outlook.com (2603:10b6:910:5::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 15:50:53 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by DM3PR12CA0046.outlook.office365.com
 (2603:10b6:0:56::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 15:50:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 15:50:53 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 19 Aug 2019 10:50:48 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/14] drm/dp-mst: Parse FEC capability on MST ports
Date: Mon, 19 Aug 2019 11:50:32 -0400
Message-ID: <20190819155038.1771-9-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819155038.1771-1-David.Francis@amd.com>
References: <20190819155038.1771-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(478600001)(4326008)(53936002)(70206006)(70586007)(8676002)(81166006)(2906002)(81156014)(6666004)(356004)(76176011)(51416003)(36756003)(110136005)(450100002)(16586007)(316002)(49486002)(476003)(8936002)(26005)(186003)(11346002)(50226002)(486006)(2616005)(126002)(336012)(426003)(86362001)(446003)(305945005)(5660300002)(50466002)(47776003)(48376002)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1527; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 591f1324-5c65-4f26-aac7-08d724bd043e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1527; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1527:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1527D7E4EE475B9BE840E83CEFA80@CY4PR12MB1527.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: sHDMJzrGJJ4ZYrhFi2QLgZyiKTvpkcRONukEVJYo8w6gelxemnjO1OyDBJOyb4dVUDPmdIsURohDrhvjJVf6fdHpNfWlQCFEjmupjsLBtEUiX1+0DRL1aZ3KtWh0XsLrbZtJY62ajXJO8svlk/pQWZN10r5fE1clTK81PUIlVr0bDLAPzyRT9uVV5WpU3U4gW75op5X6WiTp2DutJwHq0qJ6TTgt3f0j2NBNUw7q48DzK37Kv0Rue/z2gnqSHMW7p5JON93UlBZCOkIj1hWYzeZcodOXOSrFo5jv8KDP/9rzqcaPvjUr8tlMjx+ygzWYyJUkDkFzRBlpg4Z1BSZVckWd99O7JgsawtDtgotOIabX6GsOGP3lkMh7rjhQEE5hyuFL3NFak6H3d+bfYVY6HClG1pobN2OXRW3mRoIaIKw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 15:50:53.3177 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 591f1324-5c65-4f26-aac7-08d724bd043e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1527
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R99eM9i44x48BvPrmFoVQu/263NNhXDXLKUQYOWpbSg=;
 b=UjDWoq5ZdZ1id9dAnGS5HuRDJVX4GLrw4jXJQatlml/4/Mw9shYxcGNdVpPuvwtFwjDSMEUEPWI8RwwcAzmZUiTefDzu9ym3rEZUb8CvWg5Jkmq+lo7RnJ/ETJ/okPd7uIe5KskOeiQ/MKCBCv4WO24NKArm41j1ym7sDMp/MVw=
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

QXMgb2YgRFAxLjQsIEVOVU1fUEFUSF9SRVNPVVJDRVMgcmV0dXJucyBhIGJpdCBpbmRpY2F0aW5n
CmlmIEZFQyBjYW4gYmUgc3VwcG9ydGVkIHVwIHRvIHRoYXQgcG9pbnQgaW4gdGhlIE1TVCBuZXR3
b3JrLgoKVGhlIGJpdCBpcyB0aGUgZmlyc3QgYnl0ZSBvZiB0aGUgRU5VTV9QQVRIX1JFU09VUkNF
UyBhY2sgcmVwbHksCmJvdHRvbS1tb3N0IGJpdCAocmVmZXIgdG8gc2VjdGlvbiAyLjExLjkuNCBv
ZiBEUCBzdGFuZGFyZCwKdjEuNCkKClRoYXQgdmFsdWUgaXMgbmVlZGVkIGZvciBGRUMgYW5kIERT
QyBzdXBwb3J0CgpTdG9yZSBpdCBvbiBkcm1fZHBfbXN0X3BvcnQKClNpZ25lZC1vZmYtYnk6IERh
dmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMiArKwogaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxw
ZXIuaCAgICAgICB8IDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDM5OGU3MzE0ZWE4Yi4uNTNhMGFk
MTZlMzdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTU1Miw2ICs1
NTIsNyBAQCBzdGF0aWMgYm9vbCBkcm1fZHBfc2lkZWJhbmRfcGFyc2VfZW51bV9wYXRoX3Jlc291
cmNlc19hY2soc3RydWN0IGRybV9kcF9zaWRlYmFuZAogewogCWludCBpZHggPSAxOwogCXJlcG1z
Zy0+dS5wYXRoX3Jlc291cmNlcy5wb3J0X251bWJlciA9IChyYXctPm1zZ1tpZHhdID4+IDQpICYg
MHhmOworCXJlcG1zZy0+dS5wYXRoX3Jlc291cmNlcy5mZWNfY2FwYWJsZSA9IHJhdy0+bXNnW2lk
eF0gJiAweDE7CiAJaWR4Kys7CiAJaWYgKGlkeCA+IHJhdy0+Y3VybGVuKQogCQlnb3RvIGZhaWxf
bGVuOwpAQCAtMjE4MCw2ICsyMTgxLDcgQEAgc3RhdGljIGludCBkcm1fZHBfc2VuZF9lbnVtX3Bh
dGhfcmVzb3VyY2VzKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAogCQkJRFJN
X0RFQlVHX0tNUygiZW51bSBwYXRoIHJlc291cmNlcyAlZDogJWQgJWRcbiIsIHR4bXNnLT5yZXBs
eS51LnBhdGhfcmVzb3VyY2VzLnBvcnRfbnVtYmVyLCB0eG1zZy0+cmVwbHkudS5wYXRoX3Jlc291
cmNlcy5mdWxsX3BheWxvYWRfYndfbnVtYmVyLAogCQkJICAgICAgIHR4bXNnLT5yZXBseS51LnBh
dGhfcmVzb3VyY2VzLmF2YWlsX3BheWxvYWRfYndfbnVtYmVyKTsKIAkJCXBvcnQtPmF2YWlsYWJs
ZV9wYm4gPSB0eG1zZy0+cmVwbHkudS5wYXRoX3Jlc291cmNlcy5hdmFpbF9wYXlsb2FkX2J3X251
bWJlcjsKKwkJCXBvcnQtPmZlY19jYXBhYmxlID0gdHhtc2ctPnJlcGx5LnUucGF0aF9yZXNvdXJj
ZXMuZmVjX2NhcGFibGU7CiAJCX0KIAl9CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9k
cF9tc3RfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCmluZGV4IDJi
YTYyNTNlYTZkMy4uZTE4MDE3ODFmZmY1IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBf
bXN0X2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKQEAgLTEw
OCw2ICsxMDgsOCBAQCBzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0IHsKIAkgKiBhdWRpby1jYXBhYmxl
LgogCSAqLwogCWJvb2wgaGFzX2F1ZGlvOworCisJYm9vbCBmZWNfY2FwYWJsZTsKIH07CiAKIC8q
KgpAQCAtMzEyLDYgKzMxNCw3IEBAIHN0cnVjdCBkcm1fZHBfcG9ydF9udW1iZXJfcmVxIHsKIAog
c3RydWN0IGRybV9kcF9lbnVtX3BhdGhfcmVzb3VyY2VzX2Fja19yZXBseSB7CiAJdTggcG9ydF9u
dW1iZXI7CisJYm9vbCBmZWNfY2FwYWJsZTsKIAl1MTYgZnVsbF9wYXlsb2FkX2J3X251bWJlcjsK
IAl1MTYgYXZhaWxfcGF5bG9hZF9id19udW1iZXI7CiB9OwotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
