Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4419EA94
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 16:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4482C89BA3;
	Tue, 27 Aug 2019 14:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790051.outbound.protection.outlook.com [40.107.79.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7AC89B69
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 14:13:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1q96z/L0Phx6Jh211EF/VWAenc2B1eapvnp5qcfeZo1n6JwjlPzmjbMS4VDQxR03EuCPB3W4yHAVtabfci+CWaNc83nwXoYRTqx/fS+2EMZ9AGM+7HUCFV6IHk2C5jPW2hzKAH2cZOS39WJerKeQaUPqEfDYnwcC9w+Vme/SoMUPAFWopPnOF2XQ234Cgfx94pSNxOQ8Fm1zGbzyiUtvF2XZWGy08Kw8q6Ytl9sIJreibtPTafChC8Th0iTIZSgrDbK2qa2n5T3+r8JMxThpXXuAj001xEAhhP7XKWxP9QTWVI+Wk2CehEX9JA4zo1v2npjFv9cWKsPHSJN6HC9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdEOb4F8pJJqc9hIPEG8CuY8FtGQpO9MDI9LqSEU+Io=;
 b=ZcrwDmcyOrNHxjEK5YTRkMjSb9hEni93FKOiPRf64Jf2LIGOodKdmzvS3VHEGwHNrCBRrBBpU5G8Npk6OlknwUL62839PXEFc6xqzyCX1RLfJ/floU2PVwcHCFyL/arABpacFgkQnNNJXPjd91P9lnFQU9XbJXQ8s1qQPHh5n6cbeKsZ0hT9ONWcEvVr2hfscy7oJZL5L2Wa7BxX/IhgOp+S3Lk+uZOCliN2bIZY1T+7d2nHJG+IU41DpNaAyn06tXA1Tu3dLpkLqGt3tRfKUJsDy2FDQgAXsJF1JBpYVYMPuMBrFNf0aHbYg5WWWX4GHQHST2KkSnq46GDoVgdTRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0016.namprd12.prod.outlook.com
 (2603:10b6:405:4c::26) by BN6PR12MB1265.namprd12.prod.outlook.com
 (2603:10b6:404:1d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.19; Tue, 27 Aug
 2019 14:13:37 +0000
Received: from DM3NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by BN6PR1201CA0016.outlook.office365.com
 (2603:10b6:405:4c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Tue, 27 Aug 2019 14:13:37 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT045.mail.protection.outlook.com (10.152.82.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 27 Aug 2019 14:13:37 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 27 Aug 2019 09:13:32 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 4/6] drm/dp_mst: Fill branch->num_ports
Date: Tue, 27 Aug 2019 10:13:27 -0400
Message-ID: <20190827141329.30767-5-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190827141329.30767-1-David.Francis@amd.com>
References: <20190827141329.30767-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(376002)(136003)(2980300002)(428003)(189003)(199004)(1076003)(305945005)(86362001)(186003)(70586007)(476003)(51416003)(26005)(478600001)(76176011)(8936002)(2906002)(70206006)(356004)(6666004)(486006)(4326008)(6916009)(336012)(316002)(50466002)(16586007)(81166006)(81156014)(50226002)(126002)(446003)(47776003)(2351001)(49486002)(11346002)(36756003)(48376002)(426003)(5660300002)(53936002)(8676002)(14444005)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1265; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfb770fd-86b4-4c92-534e-08d72af8c0f6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR12MB1265; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1265:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1265CE43A26A1311D1E76E04EFA00@BN6PR12MB1265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 0142F22657
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: J98CGxe8oTQ6UXRUn/2+oCRJu34z77qu/sTjzKTKY+z7oaGz177mcmy8a1o8kruRCuNFsRVJQvocyLbJzHM6EVE6Djg9gDCZS/aSaCTrgaYO7/EgQ7lE0gTzfAERs9BZB2DpU3xemiXmThAL0DaXjv9RARvPQdyhtsq4y9F38NZQcVjKTxE7K5hwtMR1E5rlI1eeRjkrXFpLfpv/w6CWvJ8RgkvmUIHNMmAnzxW/KNpWUM2KHVHH6HzYYNLUSeM22fpHjQbU07B5E1xmES36oP8eTcykmgvCtOE6dJ95AjuIn+zpyzLM6SRpM4amrwp1C16Eq0IVRN8kvlClx1eyzv9hkH3ygZFfSHY7XnD7hsPWjLxCtxX39D8GrY3ZxQWyt6Q2T2xHBRnxE6R3Jbs3aXUIjOEJDwcGLoekRSj7nP8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2019 14:13:37.2628 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb770fd-86b4-4c92-534e-08d72af8c0f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1265
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdEOb4F8pJJqc9hIPEG8CuY8FtGQpO9MDI9LqSEU+Io=;
 b=a2HKIfMaRDcQBEs0wNjMFAiHwDRsKvIpcUSPVmPm3T8SHVmszQavnvbVx3ztBB/sOTC3tsc/Q7IHxbpGPEWII5d/73lDdEtRM1fMu544VfWpXMcRGOYz+fgHoAvqbsVJuMqn0cA9ga5SseYYusEzpQeYvdK3wHFc7bWLJlfFqG0=
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

VGhpcyBmaWVsZCBvbiBkcm1fZHBfbXN0X2JyYW5jaCB3YXMgbmV2ZXIgZmlsbGVkCgpJdCBpcyBp
bml0aWFsaXplZCB0byB6ZXJvIHdoZW4gdGhlIHBvcnQgaXMga3phbGxvY2NlZC4KV2hlbiBhIHBv
cnQgaXMgYWRkZWQgdG8gdGhlIGxpc3QsIGluY3JlbWVudCBudW1fcG9ydHMsCmFuZCB3aGVuIGEg
cG9ydCBpcyByZW1vdmVkIGZyb20gdGhlIGxpc3QsIGRlY3JlbWVudCBudW1fcG9ydHMuCgp2Mjog
cmVtZW1iZXIgdG8gZGVjcmVtZW50IG9uIHBvcnQgcmVtb3ZhbAp2MzogZG9uJ3QgZXhwbGljaXRs
eSBpbml0IHRvIDAKClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+ClJldmll
d2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4
IDlmMzYwNDM1NTcwNS4uNTAyOTIzYzI0NDUwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3Rv
cG9sb2d5LmMKQEAgLTE2NjksNiArMTY2OSw3IEBAIHN0YXRpYyB2b2lkIGRybV9kcF9hZGRfcG9y
dChzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1zdGIsCiAJCW11dGV4X2xvY2soJm1zdGItPm1n
ci0+bG9jayk7CiAJCWRybV9kcF9tc3RfdG9wb2xvZ3lfZ2V0X3BvcnQocG9ydCk7CiAJCWxpc3Rf
YWRkKCZwb3J0LT5uZXh0LCAmbXN0Yi0+cG9ydHMpOworCQltc3RiLT5udW1fcG9ydHMrKzsKIAkJ
bXV0ZXhfdW5sb2NrKCZtc3RiLT5tZ3ItPmxvY2spOwogCX0KIApAQCAtMTcwMyw2ICsxNzA0LDcg
QEAgc3RhdGljIHZvaWQgZHJtX2RwX2FkZF9wb3J0KHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAq
bXN0YiwKIAkJCS8qIHJlbW92ZSBpdCBmcm9tIHRoZSBwb3J0IGxpc3QgKi8KIAkJCW11dGV4X2xv
Y2soJm1zdGItPm1nci0+bG9jayk7CiAJCQlsaXN0X2RlbCgmcG9ydC0+bmV4dCk7CisJCQltc3Ri
LT5udW1fcG9ydHMtLTsKIAkJCW11dGV4X3VubG9jaygmbXN0Yi0+bWdyLT5sb2NrKTsKIAkJCS8q
IGRyb3AgcG9ydCBsaXN0IHJlZmVyZW5jZSAqLwogCQkJZHJtX2RwX21zdF90b3BvbG9neV9wdXRf
cG9ydChwb3J0KTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
