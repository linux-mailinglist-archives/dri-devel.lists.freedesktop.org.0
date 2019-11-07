Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FFAF333E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44B16F720;
	Thu,  7 Nov 2019 15:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680070.outbound.protection.outlook.com [40.107.68.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506F889CF9;
 Thu,  7 Nov 2019 15:32:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRz1u8Xn+1UbiZocoJCVX64cpaZkYhVGwfLGAB4UD0CVZMISV9rEljqbXm0OltvMr8HAYkcgIHJqg6zJknhnXlmpB39Ew7ONukjD6Yqgd8b4jCGlfvi2LZDtD8GAZRTTQOfsQzBwJllqmZA5Cau39kgNH9hwi8J34sPXrDxgE+FJZPoOvIQEtc+Wg3jG4RTkfoqDScp65ulhhm7hsLxLRI5I0SHq3eeJI0G5WdideJ2BPhDudlBF6YYcLR0nXkTLkkiywPRoBaB7J+0dfssaNh940xMOHjhSFwgzo3N639QfmpG3e84oBIVB1eagKGtBHTFMxcSqjKqncA7eYXRP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwqvFUkrOJvpByqdYnm2zl3GdfUXOFTh/JeJzwsgGrg=;
 b=UPfsCIlNRCM+ZM/7tXtYlIogBaIlV8vS9DPs3zSZM3T7Ecxo7xSvw8I99c+PT55BMTKR+NOY7NQWKKh4vw7hbIZzxZByTV0qM6WL4vNEEZ+c4/0MAghGH+KuUoINX3PRYIFnvPReRkf+hdLSrMZJY43jSbFY2d9i60qG3gUE0niqc6Y2VYDgUrEKuXJJe4+0ESOH00flaBAuR6iegDv5S0gn5upjhn/DCdEj6SZHjAz+iErbM9N9HLBVTd7r7W4SdiQCTvmdxqRvMVEsSe+erVrk0nf0zTuV9LN97PkjN4eilZJkegP2GaFCRdmS+G4P4AfVUcRQvQ7sG5HD8fskGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0038.namprd12.prod.outlook.com (2603:10b6:301:2::24)
 by MN2PR12MB4191.namprd12.prod.outlook.com (2603:10b6:208:1d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.24; Thu, 7 Nov
 2019 15:32:28 +0000
Received: from DM3NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by MWHPR12CA0038.outlook.office365.com
 (2603:10b6:301:2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20 via Frontend
 Transport; Thu, 7 Nov 2019 15:32:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT041.mail.protection.outlook.com (10.152.83.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2430.20 via Frontend Transport; Thu, 7 Nov 2019 15:32:28 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 7 Nov 2019
 09:32:21 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 7 Nov 2019 09:32:21 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 04/13] drm/dp_mst: Fill branch->num_ports
Date: Thu, 7 Nov 2019 10:32:03 -0500
Message-ID: <20191107153212.1145-5-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107153212.1145-1-mikita.lipski@amd.com>
References: <20191107153212.1145-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(428003)(199004)(189003)(450100002)(305945005)(356004)(6666004)(126002)(476003)(2616005)(14444005)(11346002)(316002)(486006)(54906003)(426003)(478600001)(76176011)(7696005)(16586007)(5660300002)(70206006)(70586007)(50226002)(86362001)(51416003)(2906002)(446003)(1076003)(81156014)(81166006)(336012)(8676002)(2351001)(50466002)(48376002)(8936002)(4326008)(53416004)(2876002)(186003)(6916009)(47776003)(36756003)(26005)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4191; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c9db646-c18d-49bf-e8f0-08d76397b2ae
X-MS-TrafficTypeDiagnostic: MN2PR12MB4191:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4191800A712C60FBCC74195EE4780@MN2PR12MB4191.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 0214EB3F68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Azgutp47TgvCqHY6e2i9ijeffd76RyjZQBhCaFfGqU5XzW5gk61vp4+4PdVO2Y1M1l6r7RVDCEUAcIaPxOZ8srLTpJHZrtfDaz8a2Jr79E18L8Plxz66+Xnaae/xh6PoBh0hV8n6mOclT7J81CNcpxK0/gl0w5MWS+c2fzkoQiXX9FFz+qjc9zDfj63FSBiIWzt2PYnWPj54LCjt63U7sKySmshgJY0tLu8ZuB4oIsIiAVvTiIV5tdhNestOUkX9gjxARsH8nR34+KBaqyXWH5PCDEKVCLksy+AmM11q7/gj+vKL5dul03jVicFVQ7/sHiAf5Rmc0Tl96qF8P5tgRwdS0IxaToQXf+GjTZzBM26/GIMStswCTgVhKM3/ceDGfB1yArNAIR37L8xUN8EV8ei8Odaw7og36BLawULsmG+xPNL5FXkrJ2yJDpJAOBGU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 15:32:28.4360 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9db646-c18d-49bf-e8f0-08d76397b2ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4191
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwqvFUkrOJvpByqdYnm2zl3GdfUXOFTh/JeJzwsgGrg=;
 b=NocxKlSxv/aHhg4Z+yIs9NzF3H0oaZH7HUn95j5SNy99qC+ZSdKW7l5z5x1ROOCNHhi/2Rv5Aw0VPoz8WNxyDW/p9061oB0CXoImZoQPgeRhmJ16LJx9r8UuCFsaWFkeR5qglR+CQfMfUzLuKTS8SHivH1xkYJvgbrRoI6tt47A=
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
