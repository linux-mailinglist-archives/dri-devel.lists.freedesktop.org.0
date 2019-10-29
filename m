Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF7BE8A0F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 14:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C626E3C4;
	Tue, 29 Oct 2019 13:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680056.outbound.protection.outlook.com [40.107.68.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF0C6E3A8;
 Tue, 29 Oct 2019 13:52:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTpqTK6IiEO93xVBRnlveAOx3mZSM/f0lDsRB7jQ5oO0NWs8MzKGj4UtQsTElg5F95OMtsBEtS3svJp9Q1X5Y+BzfRAOri3U22o6vjl1nCnthezQYo8Lj/bQHzkOxaVU0rZ/DCQ5mrsPsWK1GVWvufUM3w3n3VFaIh9eYJQcmOzsWMsmDvbCxug5dCSq2SLzQdsy2pK76JwScFvcchgVly+p2VdAPoyqUL07KVCTIPABUKOfFQeuzit8XJEwF2b9P3PXw8OVQSRsOoK+o5WAhhGWIMPq0OhMKvf4RCtu8RLJkhJQGcpULZl9qFkwEi4oPSyJr7CKJK38YH9e9nLfVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwqvFUkrOJvpByqdYnm2zl3GdfUXOFTh/JeJzwsgGrg=;
 b=hZDUeYntMyKg9C7MDUnwzPmCdwPmRTW35SeKej7RQoz40Ywm5fRImhFRM5a6Yv/5xkgNxvABPHdjf02KmDEZ6N0s1joYZizRUdi1AHtitiEMoKVjsdnFjK3yTwHkmESe2glW7+XVfUqRVrnHq+Z2tSUTdWL+XqPejtcYATWK1PtXYJ5qJ6Itt9U+7l0wPusoSBSgBOwQuNXbulO7A6LSKzqHZ6UbidbReuMO6oxmP2O5y1OriPWOk2NhSBJyi+CZvo8LgCqKuMHTDc/sAlbF7cLZHVFU3D8YHMm8p/oplWrcXwqP6D9bHtKzrW00NYl7jYTBmLWmojFYilRK+0bkOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0002.namprd12.prod.outlook.com (2603:10b6:408:60::15)
 by MN2PR12MB4240.namprd12.prod.outlook.com (2603:10b6:208:1d3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.18; Tue, 29 Oct
 2019 13:52:56 +0000
Received: from CO1NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by BN8PR12CA0002.outlook.office365.com
 (2603:10b6:408:60::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.17 via Frontend
 Transport; Tue, 29 Oct 2019 13:52:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT040.mail.protection.outlook.com (10.152.81.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 13:52:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 08:52:54 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 08:52:54 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 29 Oct 2019 08:52:54 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/13] drm/dp_mst: Fill branch->num_ports
Date: Tue, 29 Oct 2019 09:52:37 -0400
Message-ID: <20191029135245.31152-6-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029135245.31152-1-mikita.lipski@amd.com>
References: <20191029135245.31152-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(136003)(428003)(189003)(199004)(36756003)(2906002)(54906003)(50226002)(50466002)(8936002)(53416004)(16586007)(2876002)(316002)(8676002)(81166006)(81156014)(48376002)(356004)(6666004)(14444005)(70586007)(70206006)(2351001)(4326008)(478600001)(486006)(1076003)(11346002)(7696005)(126002)(476003)(2616005)(186003)(47776003)(76176011)(26005)(305945005)(6916009)(426003)(5660300002)(86362001)(336012)(446003)(51416003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4240; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e21644a-9d58-4993-a2e1-08d75c774d38
X-MS-TrafficTypeDiagnostic: MN2PR12MB4240:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4240D423EF67279A85787C92E4610@MN2PR12MB4240.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 0205EDCD76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 82Zurl28RiHiZTksqOkIsnhl0befV9ePsMGyNmnIeWro+ERbLiDfWg3UAbJGRWWNCWdIz6Mr3dxBf4Usbl7ID2T/FARQWWbKdiabfYofIveul0cs7ABaMTNEtAz2LpZvYcEo6Q2Hy9JAuAwAdlkPjvQv6QntAq8s+zuZYcMYK8hkHRmoU8wv1FkWh9w68RMCF2B3uyG5c1VkOOVGhe83a5382q2CtGKgX2rrwHA380H3Hk6k+/qlbUmL/fNkjJfpcz4a2lY7wgPKnq4ZZeJDashrgN22ymmY9AIxiJfXkeM2EJokU929sA0hKGx6aDo6he5fJ1E3ohuqw7ZxszDiPNqIRlyW8zH5hQMK0C1VsOKvpV//u3fZzvpo+bOcUdXqhPRnGEIPdfgK6IGMLDC5YlHszyYEPrk3qe96VZlMdQnFOWFGgRkXM1kwbmFbkJ1l
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2019 13:52:56.0984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e21644a-9d58-4993-a2e1-08d75c774d38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4240
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwqvFUkrOJvpByqdYnm2zl3GdfUXOFTh/JeJzwsgGrg=;
 b=y6sKtNQySkWROGDxRt76vJ6IAIM0KSUla8Tp7gxbbfRkA5PeQTcxIQv04pfgTs53euLpjijGoKvHGmrQUDpoZ77yzOra7Z+fcf9qFroKHJL8gfemjOowhQL+y9D0H7w6Q3K65DbQSeyv20dPR537b6ewQgyUhQhmEaTOXtjgh+E=
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
ClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTog
SGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERh
dmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDlmMzYwNDM1NTcw
NS4uNTAyOTIzYzI0NDUwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAg
LTE2NjksNiArMTY2OSw3IEBAIHN0YXRpYyB2b2lkIGRybV9kcF9hZGRfcG9ydChzdHJ1Y3QgZHJt
X2RwX21zdF9icmFuY2ggKm1zdGIsCiAJCW11dGV4X2xvY2soJm1zdGItPm1nci0+bG9jayk7CiAJ
CWRybV9kcF9tc3RfdG9wb2xvZ3lfZ2V0X3BvcnQocG9ydCk7CiAJCWxpc3RfYWRkKCZwb3J0LT5u
ZXh0LCAmbXN0Yi0+cG9ydHMpOworCQltc3RiLT5udW1fcG9ydHMrKzsKIAkJbXV0ZXhfdW5sb2Nr
KCZtc3RiLT5tZ3ItPmxvY2spOwogCX0KIApAQCAtMTcwMyw2ICsxNzA0LDcgQEAgc3RhdGljIHZv
aWQgZHJtX2RwX2FkZF9wb3J0KHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0YiwKIAkJCS8q
IHJlbW92ZSBpdCBmcm9tIHRoZSBwb3J0IGxpc3QgKi8KIAkJCW11dGV4X2xvY2soJm1zdGItPm1n
ci0+bG9jayk7CiAJCQlsaXN0X2RlbCgmcG9ydC0+bmV4dCk7CisJCQltc3RiLT5udW1fcG9ydHMt
LTsKIAkJCW11dGV4X3VubG9jaygmbXN0Yi0+bWdyLT5sb2NrKTsKIAkJCS8qIGRyb3AgcG9ydCBs
aXN0IHJlZmVyZW5jZSAqLwogCQkJZHJtX2RwX21zdF90b3BvbG9neV9wdXRfcG9ydChwb3J0KTsK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
