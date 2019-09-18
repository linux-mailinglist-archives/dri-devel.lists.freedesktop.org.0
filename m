Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C26B6D94
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 22:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6340372AF7;
	Wed, 18 Sep 2019 20:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770042.outbound.protection.outlook.com [40.107.77.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D732D72AEE;
 Wed, 18 Sep 2019 20:27:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbfadiBKojBuCF+Gx2rhGaI3N1jaO1N/HAC+SvEPaBz+fCanESnsFdwuc7nAK/cYQKyEoXy7Yc04dOiQt8255QEX7vaLJeeT2DPmAeca8lC6Jn1unEDwx14ETo2HFWodgKaHGXMyIiDN7uUoqg2flUmd2DROC6ZjanD1aK7KEbt11+EhVmsy8GLnVcG1XE/XZnHiEpSlsJQ1/UcKOYL5K3nJ24Te7KV6V9onvywh3K43MQiy0P1mBgs1K/htxwJ2Qs2HfTbpK7PcYS3pn56oMyivl3erMk6Js3+bvv78ORgu373QT9rV6ZbnqxRPdLxPII9pt3WEr3aarlshSkcM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lrh29AEkJ/mggpT9P2l7JbxweS7c+As3RT5m+hQBVo4=;
 b=l1cZN+PwcJiaK/5tW9wJY1rP6kUHpadi1TpLBK4COqGHQOHXhRvHrP5hO86xNPqznLMZLjzKBPB9fRrkNZU3bJl0lb78XOJlvcKXW1eDU3fTD8oBKgDbAT3NqHfETytzttOd1+J5uraCC1oHTVU2xtNk/ud1oi5YOQg7s473Ql4vWlXg+CTTZJlJAFeMlh8cSupZrwfkGuNggH3GM28RKLWworhAskX+F3tp7YbU924J7//d7AOhTXa7wk91xGMeZN9vdP+bZAwxxKhYKQHvLGhAGzIYicdZjRak2CZEzdvZgCMksdqX4wXObcUoWGIk9hKRsDbw+3uFZVx+MWvg5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0006.namprd12.prod.outlook.com (2603:10b6:610:57::16)
 by BYAPR12MB2888.namprd12.prod.outlook.com (2603:10b6:a03:12e::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.13; Wed, 18 Sep
 2019 20:27:25 +0000
Received: from DM3NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by CH2PR12CA0006.outlook.office365.com
 (2603:10b6:610:57::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Wed, 18 Sep 2019 20:27:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT014.mail.protection.outlook.com (10.152.82.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Wed, 18 Sep 2019 20:27:25 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 18 Sep 2019
 15:27:23 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/15] drm/dp_mst: Parse FEC capability on MST ports
Date: Wed, 18 Sep 2019 16:26:42 -0400
Message-ID: <071f8700dd6cf2ba21c36bcd7a50f407153b6929.1568833906.git.mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568833906.git.mikita.lipski@amd.com>
References: <cover.1568833906.git.mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(428003)(199004)(189003)(53416004)(476003)(86362001)(8676002)(50466002)(16586007)(47776003)(76176011)(36756003)(118296001)(51416003)(48376002)(2876002)(7696005)(316002)(305945005)(54906003)(5660300002)(478600001)(2351001)(6666004)(356004)(70586007)(2906002)(6916009)(186003)(126002)(50226002)(11346002)(486006)(81166006)(426003)(81156014)(26005)(336012)(2616005)(8936002)(450100002)(4326008)(70206006)(446003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2888; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff66a73a-8f12-4095-f6f9-08d73c769e0e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BYAPR12MB2888; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2888:
X-Microsoft-Antispam-PRVS: <BYAPR12MB28889707DDCF9BCB891CFECCE48E0@BYAPR12MB2888.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 01644DCF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: TEDzc3FYxc0pgaLxPj7vY85knF+SPhxjsLT+CAPYsLrIHYae4650kw1nGvvjG9OlFxDFYGz8WQnwAR73C59w9oaReacpRVu9ZjU8OVzU72CTFuGdeOhHTtc5e/Aii6IZkvRav7b8PpVhBQYc8aL91RiHba72a1lEjnzhydnZA/KQ7K6gWu88bzjRoH6Uzxi87xTf1p+8fjaDNiDqcBo8FuyjyQyu+2kBBd4aGrUFKXcImEvw6D7eEOeyju1v4YyrLfP5yKCjMZxanhVdGGo80eXZYjOukdZSTYFaNyPVwPb3imyMWmOOeDpxfZkVwzT7Cw/Exn0JYsgpriDKkvmbfHRwxa9LQO2iPOw72HSPRpOvLhRT9f0asgqJSkFOlfo/hhDB8J7vwdGe7wioa1XjRT6oQWBGss6eiOcF//3q4hU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 20:27:25.0792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff66a73a-8f12-4095-f6f9-08d73c769e0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2888
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lrh29AEkJ/mggpT9P2l7JbxweS7c+As3RT5m+hQBVo4=;
 b=eo9AjbjRu2LPLed3BxiJJwMtLFIfI0OS1CKl/K+fjTVLM9VkRORH2OP1xUX8bgET3t+qt0JouzpFs+xP2oG7ZMxfZcqbSdXuVP1jo2yyu3+g2xNVnN0NPTPeVKrW5lEz8fpFEDR6YdLXGu8vRnGsW8I6f5SYEye/viuso4IKAAM=
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
Cc: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKQXMgb2YgRFAxLjQs
IEVOVU1fUEFUSF9SRVNPVVJDRVMgcmV0dXJucyBhIGJpdCBpbmRpY2F0aW5nCmlmIEZFQyBjYW4g
YmUgc3VwcG9ydGVkIHVwIHRvIHRoYXQgcG9pbnQgaW4gdGhlIE1TVCBuZXR3b3JrLgoKVGhlIGJp
dCBpcyB0aGUgZmlyc3QgYnl0ZSBvZiB0aGUgRU5VTV9QQVRIX1JFU09VUkNFUyBhY2sgcmVwbHks
CmJvdHRvbS1tb3N0IGJpdCAocmVmZXIgdG8gc2VjdGlvbiAyLjExLjkuNCBvZiBEUCBzdGFuZGFy
ZCwKdjEuNCkKClRoYXQgdmFsdWUgaXMgbmVlZGVkIGZvciBGRUMgYW5kIERTQyBzdXBwb3J0CgpT
dG9yZSBpdCBvbiBkcm1fZHBfbXN0X3BvcnQKClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMg
PERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJl
ZGhhdC5jb20+ClJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMiArKwog
aW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICB8IDMgKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
CmluZGV4IDY1OTA5OTM2NmY4Yi4uYzFhN2RkZmRjNGJkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMKQEAgLTU1Miw2ICs1NTIsNyBAQCBzdGF0aWMgYm9vbCBkcm1fZHBfc2lk
ZWJhbmRfcGFyc2VfZW51bV9wYXRoX3Jlc291cmNlc19hY2soc3RydWN0IGRybV9kcF9zaWRlYmFu
ZAogewogCWludCBpZHggPSAxOwogCXJlcG1zZy0+dS5wYXRoX3Jlc291cmNlcy5wb3J0X251bWJl
ciA9IChyYXctPm1zZ1tpZHhdID4+IDQpICYgMHhmOworCXJlcG1zZy0+dS5wYXRoX3Jlc291cmNl
cy5mZWNfY2FwYWJsZSA9IHJhdy0+bXNnW2lkeF0gJiAweDE7CiAJaWR4Kys7CiAJaWYgKGlkeCA+
IHJhdy0+Y3VybGVuKQogCQlnb3RvIGZhaWxfbGVuOwpAQCAtMjE4MCw2ICsyMTgxLDcgQEAgc3Rh
dGljIGludCBkcm1fZHBfc2VuZF9lbnVtX3BhdGhfcmVzb3VyY2VzKHN0cnVjdCBkcm1fZHBfbXN0
X3RvcG9sb2d5X21nciAqbWdyLAogCQkJRFJNX0RFQlVHX0tNUygiZW51bSBwYXRoIHJlc291cmNl
cyAlZDogJWQgJWRcbiIsIHR4bXNnLT5yZXBseS51LnBhdGhfcmVzb3VyY2VzLnBvcnRfbnVtYmVy
LCB0eG1zZy0+cmVwbHkudS5wYXRoX3Jlc291cmNlcy5mdWxsX3BheWxvYWRfYndfbnVtYmVyLAog
CQkJICAgICAgIHR4bXNnLT5yZXBseS51LnBhdGhfcmVzb3VyY2VzLmF2YWlsX3BheWxvYWRfYndf
bnVtYmVyKTsKIAkJCXBvcnQtPmF2YWlsYWJsZV9wYm4gPSB0eG1zZy0+cmVwbHkudS5wYXRoX3Jl
c291cmNlcy5hdmFpbF9wYXlsb2FkX2J3X251bWJlcjsKKwkJCXBvcnQtPmZlY19jYXBhYmxlID0g
dHhtc2ctPnJlcGx5LnUucGF0aF9yZXNvdXJjZXMuZmVjX2NhcGFibGU7CiAJCX0KIAl9CiAKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggYi9pbmNsdWRlL2RybS9k
cm1fZHBfbXN0X2hlbHBlci5oCmluZGV4IDkxMTZiMmM5NTIzOS4uZjExM2FlMDRmYTg4IDEwMDY0
NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJt
L2RybV9kcF9tc3RfaGVscGVyLmgKQEAgLTEwOCw2ICsxMDgsOCBAQCBzdHJ1Y3QgZHJtX2RwX21z
dF9wb3J0IHsKIAkgKiBhdWRpby1jYXBhYmxlLgogCSAqLwogCWJvb2wgaGFzX2F1ZGlvOworCisJ
Ym9vbCBmZWNfY2FwYWJsZTsKIH07CiAKIC8qKgpAQCAtMzEyLDYgKzMxNCw3IEBAIHN0cnVjdCBk
cm1fZHBfcG9ydF9udW1iZXJfcmVxIHsKIAogc3RydWN0IGRybV9kcF9lbnVtX3BhdGhfcmVzb3Vy
Y2VzX2Fja19yZXBseSB7CiAJdTggcG9ydF9udW1iZXI7CisJYm9vbCBmZWNfY2FwYWJsZTsKIAl1
MTYgZnVsbF9wYXlsb2FkX2J3X251bWJlcjsKIAl1MTYgYXZhaWxfcGF5bG9hZF9id19udW1iZXI7
CiB9OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
