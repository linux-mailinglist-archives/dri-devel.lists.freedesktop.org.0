Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D41E3CA0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 21:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D5C6E784;
	Thu, 24 Oct 2019 19:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810048.outbound.protection.outlook.com [40.107.81.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA076E784;
 Thu, 24 Oct 2019 19:57:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfdFKTayFRnbv2TiAv26Iw6Uw4lNwJPJ6a4y60wf/r4DnCt5z6jHlwvBj5jaGbIBqByDwT5miXIAK36H9JshiHJLeQ7MmjMFTQeK2S4M4qFEiKaBocVd4ZH86LqVIlHI2h3+ozKQ0rIgWw2+iobEvNNVYY0ulxrj6RdhX5EC9IaSmNRokskbcHlv6geO7HZNj7RNJqP0CVO0xtnRj3SkNvtX7pzaGuqGfMT/sc1ArHokVR0Cp7Q0iUiXmA1ndv9AEiS93ZrJPDeWTmrjW1p+2qW62TlKJwfY92JFduTL+72VefHDUEii7MWfi5SX5fQ13OeSB+idEvULBFf6dKgJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFNaNjE/tStoe8fOKoLYHB68C3bdfg7hp/zjaW5jLdY=;
 b=TAP9POVtDiPuoiZkCkqhvV4qQG0UbvIWbwBnY59vsF7bBoGnnM8doZKaFbG4LD641pLzEEHEkvMRSfRcox5ylEJZqUOYUWr2Lpu5gmql4ctJllv+aBK3eAPI1SmrpdDB791hzU/sRZiF8h60dJuv6IRersJUN/aJytXcVxjEbedfqJNDe5+tWaDUg9PGQ4zzbMXL1vS6RWj/UmxTa4/lFpt8QAuYIfI62SFt7t4OujIK/urTiKhIGO1Mhw04xIUuH8gmyghrhPF077EcHumKeW+nyG3AAdgu0xtQiOkxLbCPIsHmjHjFhfQA+UdPjr/S/jOi20Nn2/edWhYfIFRAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0091.namprd12.prod.outlook.com (2603:10b6:802:21::26)
 by BN6PR12MB1153.namprd12.prod.outlook.com (2603:10b6:404:19::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.24; Thu, 24 Oct
 2019 19:57:34 +0000
Received: from DM3NAM03FT020.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by SN1PR12CA0091.outlook.office365.com
 (2603:10b6:802:21::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.20 via Frontend
 Transport; Thu, 24 Oct 2019 19:57:34 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM3NAM03FT020.mail.protection.outlook.com (10.152.82.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Thu, 24 Oct 2019 19:57:34 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 24 Oct
 2019 14:57:33 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 24 Oct 2019 14:57:33 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/sched: Set error to s_fence if HW job submission
 failed.
Date: Thu, 24 Oct 2019 15:57:29 -0400
Message-ID: <1571947050-26276-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(428003)(189003)(199004)(48376002)(8676002)(186003)(50466002)(70206006)(70586007)(26005)(2906002)(8936002)(50226002)(47776003)(53416004)(81156014)(4326008)(336012)(81166006)(6666004)(110136005)(44832011)(426003)(36756003)(54906003)(16586007)(2616005)(476003)(126002)(486006)(305945005)(5660300002)(86362001)(478600001)(7696005)(51416003)(316002)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1153; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e214cbfd-3135-442b-fc40-08d758bc695e
X-MS-TrafficTypeDiagnostic: BN6PR12MB1153:
X-Microsoft-Antispam-PRVS: <BN6PR12MB11536581C57832CCFA80FB52EA6A0@BN6PR12MB1153.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-Forefront-PRVS: 0200DDA8BE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n4udein9ngI4ON4FnQXbwJFgUXZOXECYDggCh2uEjS0MYbd1kZ5ZB8HcdwtJ51yOEbOP3bwoX4YB5dIV6So3nosbaEFco+6QjvVZ7vtENvckV2OVveO+6PGBmFHdX2r81BHJ2WYgrF8PqAqAlR2I4poCor1IFLCSz7/O++aCGvIbnktMoZecir5FUVvI5boXV7mnMXKW7ZpYCFg9QledwAUZmW7Nba8gLxTL9uoKdr6Kq4znBMKFe/jcWzVwoRlT8Bv+5NhS483sYeii+4Si/9xY5M9JkFrnyyXLudbURf0GOF4Kt5EzsS1ntgjz4L/bCGf6rfAGocLEjj9cItPI+E8wxel1UMPMvB8QPNLDcmoxfR7ld/I8aUKZNaQ7U51k3BDqpY96nIuN80BJ8IQCn8eQxNWqIv8BS71lslp+nKtyUEj1xW/P/7FRdv4urrOk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2019 19:57:34.0292 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e214cbfd-3135-442b-fc40-08d758bc695e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1153
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFNaNjE/tStoe8fOKoLYHB68C3bdfg7hp/zjaW5jLdY=;
 b=A4DnhLq1ZF97C2krEh1Z0xXzP0PerQIh4p994Z+yftm2krAYRi+89ggDHwwZKjQeHPPrkJ0TTLwRI1XotzO/Dw6mCaY5w5MPp2gu5ui8OXQ1uazMtsLcRWvJMEIb3hgzYaqoOS2lJcpIYBMUauHPweJpoW4e74Md2u7JErf5f/I=
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
Cc: ckoenig.leichtzumerken@gmail.com, Shirish.S@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJvYmxlbToKV2hlbiBydW5fam9iIGZhaWxzIGFuZCBIVyBmZW5jZSByZXR1cm5lZCBpcyBOVUxM
IHdlIHN0aWxsIHNpZ25hbAp0aGUgc19mZW5jZSB0byBhdm9pZCBoYW5ncyBidXQgdGhlIHVzZXIg
aGFzIG5vIHdheSBvZiBrbm93aW5nIGlmCnRoZSBhY3R1YWwgSFcgam9iIHdhcyByYW4gYW5kIGZp
bmlzaGVkLgoKRml4OgpBbGxvdyAucnVuX2pvYiBpbXBsZW1lbnRhdGlvbnMgdG8gcmV0dXJuIEVS
Ul9QVFIgaW4gdGhlIGZlbmNlIHBvaW50ZXIKcmV0dXJuZWQgYW5kIHRoZW4gc2V0IHRoaXMgZXJy
b3IgZm9yIHNfZmVuY2UtPmZpbmlzaGVkIGZlbmNlIHNvIHdob2V2ZXIKd2FpdCBvbiB0aGlzIGZl
bmNlIGNhbiBpbnNwZWN0IHRoZSBzaWduYWxlZCBmZW5jZSBmb3IgYW4gZXJyb3IuCgpTaWduZWQt
b2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyB8IDE5ICsrKysrKysrKysr
KysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIGIv
ZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKaW5kZXggOWEwZWU3NC4uZjM5
Yjk3ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKQEAgLTQ3OSw2ICs0
NzksNyBAQCB2b2lkIGRybV9zY2hlZF9yZXN1Ym1pdF9qb2JzKHN0cnVjdCBkcm1fZ3B1X3NjaGVk
dWxlciAqc2NoZWQpCiAJc3RydWN0IGRybV9zY2hlZF9qb2IgKnNfam9iLCAqdG1wOwogCXVpbnQ2
NF90IGd1aWx0eV9jb250ZXh0OwogCWJvb2wgZm91bmRfZ3VpbHR5ID0gZmFsc2U7CisJc3RydWN0
IGRtYV9mZW5jZSAqZmVuY2U7CiAKIAlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoc19qb2IsIHRt
cCwgJnNjaGVkLT5yaW5nX21pcnJvcl9saXN0LCBub2RlKSB7CiAJCXN0cnVjdCBkcm1fc2NoZWRf
ZmVuY2UgKnNfZmVuY2UgPSBzX2pvYi0+c19mZW5jZTsKQEAgLTQ5Miw3ICs0OTMsMTYgQEAgdm9p
ZCBkcm1fc2NoZWRfcmVzdWJtaXRfam9icyhzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVk
KQogCQkJZG1hX2ZlbmNlX3NldF9lcnJvcigmc19mZW5jZS0+ZmluaXNoZWQsIC1FQ0FOQ0VMRUQp
OwogCiAJCWRtYV9mZW5jZV9wdXQoc19qb2ItPnNfZmVuY2UtPnBhcmVudCk7Ci0JCXNfam9iLT5z
X2ZlbmNlLT5wYXJlbnQgPSBzY2hlZC0+b3BzLT5ydW5fam9iKHNfam9iKTsKKwkJZmVuY2UgPSBz
Y2hlZC0+b3BzLT5ydW5fam9iKHNfam9iKTsKKworCQlpZiAoSVNfRVJSX09SX05VTEwoZmVuY2Up
KSB7CisJCQlzX2pvYi0+c19mZW5jZS0+cGFyZW50ID0gTlVMTDsKKwkJCWRtYV9mZW5jZV9zZXRf
ZXJyb3IoJnNfZmVuY2UtPmZpbmlzaGVkLCBQVFJfRVJSKGZlbmNlKSk7CisJCX0gZWxzZSB7CisJ
CQlzX2pvYi0+c19mZW5jZS0+cGFyZW50ID0gZmVuY2U7CisJCX0KKworCiAJfQogfQogRVhQT1JU
X1NZTUJPTChkcm1fc2NoZWRfcmVzdWJtaXRfam9icyk7CkBAIC03MjAsNyArNzMwLDcgQEAgc3Rh
dGljIGludCBkcm1fc2NoZWRfbWFpbih2b2lkICpwYXJhbSkKIAkJZmVuY2UgPSBzY2hlZC0+b3Bz
LT5ydW5fam9iKHNjaGVkX2pvYik7CiAJCWRybV9zY2hlZF9mZW5jZV9zY2hlZHVsZWQoc19mZW5j
ZSk7CiAKLQkJaWYgKGZlbmNlKSB7CisJCWlmICghSVNfRVJSX09SX05VTEwoZmVuY2UpKSB7CiAJ
CQlzX2ZlbmNlLT5wYXJlbnQgPSBkbWFfZmVuY2VfZ2V0KGZlbmNlKTsKIAkJCXIgPSBkbWFfZmVu
Y2VfYWRkX2NhbGxiYWNrKGZlbmNlLCAmc2NoZWRfam9iLT5jYiwKIAkJCQkJCSAgIGRybV9zY2hl
ZF9wcm9jZXNzX2pvYik7CkBAIC03MzAsOCArNzQwLDExIEBAIHN0YXRpYyBpbnQgZHJtX3NjaGVk
X21haW4odm9pZCAqcGFyYW0pCiAJCQkJRFJNX0VSUk9SKCJmZW5jZSBhZGQgY2FsbGJhY2sgZmFp
bGVkICglZClcbiIsCiAJCQkJCSAgcik7CiAJCQlkbWFfZmVuY2VfcHV0KGZlbmNlKTsKLQkJfSBl
bHNlCisJCX0gZWxzZSB7CisKKwkJCWRtYV9mZW5jZV9zZXRfZXJyb3IoJnNfZmVuY2UtPmZpbmlz
aGVkLCBQVFJfRVJSKGZlbmNlKSk7CiAJCQlkcm1fc2NoZWRfcHJvY2Vzc19qb2IoTlVMTCwgJnNj
aGVkX2pvYi0+Y2IpOworCQl9CiAKIAkJd2FrZV91cCgmc2NoZWQtPmpvYl9zY2hlZHVsZWQpOwog
CX0KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
