Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B306B6D9A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 22:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2B772AFB;
	Wed, 18 Sep 2019 20:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790045.outbound.protection.outlook.com [40.107.79.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDB072AFF;
 Wed, 18 Sep 2019 20:27:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMPtsv+NvigWv7LwpyU4A+kKCnPbjiDKDkv5cNyK1sddXztxYKdxUFBlrHtHJkl/sQZ4TW1HBfUK3DEfvzaLuzfygG28U94HKwvxEckrFqML4sWy/PMOv117AGGY1jyX9EEO+Y1AL0hnOTTc7dXkNcdp3x9UOpmofZ4ZjnEXvjhAIQtETDGv2GbssT8L6FhiggJj0EC9X0glilUIXmwObb0xdZpTrDDxDIdxSxsYxWnSIqMM8npChM/b49j3YHkmVc2VSG0TAChz9uPEzGScfJvOPg3hsXZNmiJDpv6GZl/VrIdnnfh16uoafhnmmAdd/18oU4zfO/bUCVUXMeN7Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZ4epL9P7A0BVium/A4BRe26JyJWzDLcENSuoRczov8=;
 b=QPRBep/QmEk9MxGyKuwMojVQdzpC3D6Wa6tvkFnJncCqo0Yweb3NMvpJY5Nd/dJg+sZjmkYDOctMi1+cFFZ5Bp0PLsMTnnQqfduWNIxD8bEmoDcVTWYWX+Fsg8BsALwzDBCwFqUQDz/hulCd4tafwbHyScEiP86rGhl3HpnJqvhDDyiSbaXW8AgQZdkBGxmO/RAAlSafwclKPhzZ5XUzqrWdc5LdfJhqiGN4YpXe42Bdes7xKs9ZJwxEt91msAJXIBkerbssm+KJ7XYRjtFj8KoBuiK+t7BRUY6H+gnzPZgl+GVzOsHgsTwnwJRUYAYv6lnPhW49IBAxJ5f/ELOgdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0028.namprd12.prod.outlook.com (2603:10b6:610:57::38)
 by CY4PR12MB1128.namprd12.prod.outlook.com (2603:10b6:903:3e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.19; Wed, 18 Sep
 2019 20:27:28 +0000
Received: from DM3NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by CH2PR12CA0028.outlook.office365.com
 (2603:10b6:610:57::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.19 via Frontend
 Transport; Wed, 18 Sep 2019 20:27:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT014.mail.protection.outlook.com (10.152.82.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Wed, 18 Sep 2019 20:27:27 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 18 Sep 2019
 15:27:25 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/15] drm/dp_mst: Fill branch->num_ports
Date: Wed, 18 Sep 2019 16:26:44 -0400
Message-ID: <bf44b422ebb2c6c41e95d44764691719d5977e4c.1568833906.git.mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568833906.git.mikita.lipski@amd.com>
References: <cover.1568833906.git.mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(428003)(189003)(199004)(70586007)(186003)(26005)(50226002)(2876002)(8936002)(478600001)(47776003)(50466002)(48376002)(316002)(6916009)(86362001)(54906003)(16586007)(356004)(6666004)(2906002)(5660300002)(450100002)(8676002)(76176011)(7696005)(81156014)(81166006)(51416003)(36756003)(426003)(476003)(118296001)(2616005)(486006)(53416004)(2351001)(70206006)(14444005)(336012)(11346002)(126002)(446003)(4326008)(305945005)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1128; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4daae2a-5b63-4a96-5912-08d73c769fa1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CY4PR12MB1128; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1128:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1128C915981B2EC6749C88E8E48E0@CY4PR12MB1128.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 01644DCF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: tabX9aX/GqITKWjle5cH5ikpfnvnvDgTVq0HdV3bMT4NxZl/sBYR9FpEuJZ9KMngoZ3Lyg7lZiyM/9FXDFfq5dtcKztOGGq89xMxsQYE+82W/g/jcLp93bxbzbDIoNs3EqvSJ1NZh/AICoxfW5VmA/jy4DSwypoJLdnDmwh05ZkM/K0ku7ikh6bQ8vcAGMIfvvlpPCeJldd8Bq/+pRoNTrUm2RexNh/JJ9heBNgD9vpJgohY2vj1OC5Q+A3uS7OIB3mGE4wT8fUcqa4bVWHW7XTzI1GbGvup3BakF+7Rc2R1MPTXln+6+9AT0B/ueok3knLt9MBRsbR+QgzwFOmer2H7Q5orNVcL8qjHkaBRFz6ZC9QxT+eU2MYMFqm+PWHAysoecBp0o/348W6Xjg8Q3OxZ8xGdC8dTyd9S53xDWL8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 20:27:27.7272 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4daae2a-5b63-4a96-5912-08d73c769fa1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1128
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZ4epL9P7A0BVium/A4BRe26JyJWzDLcENSuoRczov8=;
 b=GB87SEMhC2GJf0/CQOh+QQoJ6xzmKFxf0Jp74GV+qV/P3YgDqgy0bFSgiFtdQ9pO1Vq28RL7R13GNIyGrUdjE2aGnOggOyfQeXdCc2UQncfWY1cpXUVgFnBDgwh4TKe5LbiqbYMBPTfyB3cNqfW1oRokMHjWFBSYYyIklt45oqM=
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

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKVGhpcyBmaWVsZCBv
biBkcm1fZHBfbXN0X2JyYW5jaCB3YXMgbmV2ZXIgZmlsbGVkCgpJdCBpcyBpbml0aWFsaXplZCB0
byB6ZXJvIHdoZW4gdGhlIHBvcnQgaXMga3phbGxvY2NlZC4KV2hlbiBhIHBvcnQgaXMgYWRkZWQg
dG8gdGhlIGxpc3QsIGluY3JlbWVudCBudW1fcG9ydHMsCmFuZCB3aGVuIGEgcG9ydCBpcyByZW1v
dmVkIGZyb20gdGhlIGxpc3QsIGRlY3JlbWVudCBudW1fcG9ydHMuCgp2MjogcmVtZW1iZXIgdG8g
ZGVjcmVtZW50IG9uIHBvcnQgcmVtb3ZhbAp2MzogZG9uJ3QgZXhwbGljaXRseSBpbml0IHRvIDAK
ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBIYXJy
eSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IGMxYTdkZGZkYzRi
ZC4uYWUyZjk4NmQ3NmEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAg
LTE2NzAsNiArMTY3MCw3IEBAIHN0YXRpYyB2b2lkIGRybV9kcF9hZGRfcG9ydChzdHJ1Y3QgZHJt
X2RwX21zdF9icmFuY2ggKm1zdGIsCiAJCW11dGV4X2xvY2soJm1zdGItPm1nci0+bG9jayk7CiAJ
CWRybV9kcF9tc3RfdG9wb2xvZ3lfZ2V0X3BvcnQocG9ydCk7CiAJCWxpc3RfYWRkKCZwb3J0LT5u
ZXh0LCAmbXN0Yi0+cG9ydHMpOworCQltc3RiLT5udW1fcG9ydHMrKzsKIAkJbXV0ZXhfdW5sb2Nr
KCZtc3RiLT5tZ3ItPmxvY2spOwogCX0KIApAQCAtMTcwNCw2ICsxNzA1LDcgQEAgc3RhdGljIHZv
aWQgZHJtX2RwX2FkZF9wb3J0KHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0YiwKIAkJCS8q
IHJlbW92ZSBpdCBmcm9tIHRoZSBwb3J0IGxpc3QgKi8KIAkJCW11dGV4X2xvY2soJm1zdGItPm1n
ci0+bG9jayk7CiAJCQlsaXN0X2RlbCgmcG9ydC0+bmV4dCk7CisJCQltc3RiLT5udW1fcG9ydHMt
LTsKIAkJCW11dGV4X3VubG9jaygmbXN0Yi0+bWdyLT5sb2NrKTsKIAkJCS8qIGRyb3AgcG9ydCBs
aXN0IHJlZmVyZW5jZSAqLwogCQkJZHJtX2RwX21zdF90b3BvbG9neV9wdXRfcG9ydChwb3J0KTsK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
