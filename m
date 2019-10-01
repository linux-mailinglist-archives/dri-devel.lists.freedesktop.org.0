Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE3FC3A34
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 18:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660E26E84E;
	Tue,  1 Oct 2019 16:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810051.outbound.protection.outlook.com [40.107.81.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8476E84B;
 Tue,  1 Oct 2019 16:17:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9T06qHVm1I0fU4vLn24JIQIsa696ILdgA7JEOag7j63q45uARy6QGO2/uUrPYSRWo8g/bSSTLaUBA/Jv1iy8+NO4pHQsamyDt0+KUpHMRBpUJJjfiv7staBt8E4sjMU5GRl4SAYuMcCFiGcuEp5sXoMVzNEogmPOwR9QIroYmRUGVTkaROsrdc3OrrzQZO1hdWpSynwZxntqYbQDxTmz/YAJIaLz/F2xePLjGfJMrFxDPjrCqFXxyZAWmSk92nPb7XgJYZbGWuJHzIJFmT6c3jVORv2xVethPBvPMLYL8atABaJNwlFoBI/2OnpCUKMogVCrpKimWkQz7YHRXwlsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwqvFUkrOJvpByqdYnm2zl3GdfUXOFTh/JeJzwsgGrg=;
 b=HJWxToK+CRnIjf0nHd03jAD6msy2cVfmPowdi/fkobvZLkw9/j7RneUHyIBrNXnetkCyKR4M8gioTzTrGf9yamdM2iIxL8PsX5GBwV4hsmFPfhVRKzpACL9ixDYsmxsy53pjQW25zsYij28kHCqJ5QrhIXNqFhyzS5DRTYTJkz3oHXdZpQj7W3oYSUPN4tMctHFbzYaY/k0cn+fEiTc8XupboT7d3LvgBCwW4VLRpG63FyRheKy4uJilamBQRDbNCu3z8EX4B9kSk3ww/8nObd7p1xKEvPTkdRZ6+wAw1V2RhuG0uLXV7RpbflbkSFo7a7M2uJosUXrtyo15+i/LQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0023.namprd12.prod.outlook.com (2603:10b6:208:a8::36)
 by MWHPR12MB1743.namprd12.prod.outlook.com (2603:10b6:300:113::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Tue, 1 Oct
 2019 16:17:33 +0000
Received: from CO1NAM03FT013.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by MN2PR12CA0023.outlook.office365.com
 (2603:10b6:208:a8::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.17 via Frontend
 Transport; Tue, 1 Oct 2019 16:17:33 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT013.mail.protection.outlook.com (10.152.80.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 16:17:32 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 1 Oct 2019
 11:17:30 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/14] drm/dp_mst: Fill branch->num_ports
Date: Tue, 1 Oct 2019 12:17:12 -0400
Message-ID: <20191001161721.13793-6-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001161721.13793-5-mikita.lipski@amd.com>
References: <20191001161721.13793-1-mikita.lipski@amd.com>
 <20191001161721.13793-2-mikita.lipski@amd.com>
 <20191001161721.13793-3-mikita.lipski@amd.com>
 <20191001161721.13793-4-mikita.lipski@amd.com>
 <20191001161721.13793-5-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(396003)(39860400002)(428003)(199004)(189003)(336012)(7696005)(446003)(11346002)(2351001)(6916009)(126002)(478600001)(2616005)(426003)(86362001)(51416003)(5660300002)(48376002)(476003)(50466002)(70206006)(70586007)(76176011)(26005)(6666004)(186003)(47776003)(356004)(14444005)(8676002)(1076003)(450100002)(316002)(54906003)(16586007)(36756003)(4326008)(486006)(8936002)(305945005)(81156014)(81166006)(2876002)(2906002)(50226002)(53416004)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1743; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5e0d6a4-7afd-43eb-f418-08d7468add49
X-MS-TrafficTypeDiagnostic: MWHPR12MB1743:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1743695B20E56CEF4A28D174E49D0@MWHPR12MB1743.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 0177904E6B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FEUa8y9WGoN2o6EbAv+ZtUd4+3ovkIxrMSypKLNvcU6TrTPlobVaSO8kUjllGyQKJjswRuV/ccmoHYTaRb4b1j0Hz/yAICFblXNwEFuAWzKMNoDGcriTPUpua+FckFcGmYAMDNCw10pXIYuH1LziJhpkPkSIp88fW2gCdyn0DtWqWzqV+zajOSt9xFWinRcN9QaxqPAE7BXTARo3nU0eU3m5c6uWiO8fHOB2Dnk1Du27nklAOH4pUNQ4lxMY0pf5Src3Dbl0pzzobrMi7OEiSJPoIlU1z4k1QVbrguzoOEq+QBGwoTK1HEqNCggBPC+PBwBFxx4SUQZ7Ekkc8ikitbKKuYspJCgXoL8hP7PQESd3o72fxe3VMWNBZA/qOQ5Khqm7Yhhsg7gk4rSxA1mVjC+aIufFQbq/6AMYdCV3aes=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 16:17:32.6195 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e0d6a4-7afd-43eb-f418-08d7468add49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1743
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwqvFUkrOJvpByqdYnm2zl3GdfUXOFTh/JeJzwsgGrg=;
 b=uAgADQ6PSLN+pcLi165mePsEA2TMF3hbQ2GNuCHIPbWz33dcZmVIBsTFNWVXDrFu9vKREK2vK3pIOFwl/ikt6P+bo67CVgy8FQsik6drvT4p+zhQzXLMOF5fIMd4ImyHsAPwSfxbechju/N81QQSHWZTq6nTlk8WBueDLVAfv4o=
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
