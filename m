Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ABDC3A31
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 18:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD996E84C;
	Tue,  1 Oct 2019 16:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790053.outbound.protection.outlook.com [40.107.79.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2036E846;
 Tue,  1 Oct 2019 16:17:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h30lW0gBW3ylhKPXBqUI9pOAwVR6ns2YdbyvMKG3BTXNZPXIia1m5Fh1rXq9OJgQkA5TGbR8hAuwXFQgTI7dKF2sDIA7KVts3o4mfNtoJ4XssYU3ooxkeAT0vmW+2Mk+CC41WKYLL+hZI5/Um10ON28Dmu24XubokS5U0wvjqOiscM8nUshsg0cab3YyWxGzCmkY0LvKqBOIsK4ic9t8r6AdvLiff2wGa3ssIYVE8CqS9u6d4dhUUpItnWE/IfsAmRDcyynPnLdYolXjkgRHkhOzSB9/1gRcsei2ouc1+i4Q295gNykCsUNQK8AFv0P6ajjRwc8GE/WFi6MrcS2GAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtzNhoT5WrJIF43FzY54g/YC8FN7tJzave3qPSMHVEs=;
 b=fKqAIsxQN+yC1kTp9AJCCEdH3S9Uop0ZsEfCQCORbec71ALQn3JHZwjUol0XrReSiMzaLvfvyfEDhy/rraktDs6uAfwpxklmyyk2Fwe7rVRbfPLxbyxSORpQuSHVDxS9tPckUnvLEvDmlM48GuQe7OeJpt3ww0h6JxmtP8yu1sD6xeRWx3GAZnKBQ5txqI4160WnM1JXbqan3jiny/zp4IdFEfrMNCKvXT8hAelcP/8nml2EPfokzyjA3c2qT7hF/744qybN2DTS8w2tCC/96UAApuACZ1kSe924LNHxSvx0XoUYbLGSaoolWVQ+YD23ml1qlofbqbVkEIuUxeMfnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0021.namprd12.prod.outlook.com (2603:10b6:208:a8::34)
 by MWHPR12MB1758.namprd12.prod.outlook.com (2603:10b6:300:10f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Tue, 1 Oct
 2019 16:17:30 +0000
Received: from CO1NAM03FT013.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MN2PR12CA0021.outlook.office365.com
 (2603:10b6:208:a8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.23 via Frontend
 Transport; Tue, 1 Oct 2019 16:17:30 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT013.mail.protection.outlook.com (10.152.80.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 16:17:29 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 1 Oct 2019
 11:17:28 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/14] drm/dp_mst: Parse FEC capability on MST ports
Date: Tue, 1 Oct 2019 12:17:10 -0400
Message-ID: <20191001161721.13793-4-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001161721.13793-3-mikita.lipski@amd.com>
References: <20191001161721.13793-1-mikita.lipski@amd.com>
 <20191001161721.13793-2-mikita.lipski@amd.com>
 <20191001161721.13793-3-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(428003)(189003)(199004)(50466002)(7696005)(47776003)(2351001)(16586007)(316002)(446003)(76176011)(53416004)(51416003)(336012)(1076003)(4326008)(54906003)(486006)(48376002)(5660300002)(6666004)(426003)(2906002)(356004)(11346002)(186003)(126002)(6916009)(36756003)(50226002)(478600001)(26005)(450100002)(86362001)(305945005)(2616005)(81166006)(70206006)(70586007)(2876002)(8936002)(81156014)(8676002)(476003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1758; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c357375d-a50f-4f9f-73e6-08d7468adb9d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1758:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1758872E64641D5F40C9189DE49D0@MWHPR12MB1758.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0177904E6B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TINeW7ifyfCXjOThULXex51R6cM8j34J0WbkHfEe2XKBTaKmfxGOJnHmA0Il5MHAbaJxmzw+2LyQ69ZkuWfHVpqw7/ss21iCPJRML/0xxneWY6meMNK3RMxzkgIkW0ckl6B9kYZFaZNIbCFJLO66ek2ds2tXudC774X/F1dHxjdQ08PJdyEwwFCYy4vkMr2fWOmgMIkf0S0XVRbxLFzrLaZZBwHP1mcRA80VpKMV+JaRxlGQHnl2OMlfBu4w/AxlT1Be6wAMEDGJ6YMSAexT1v1wdcuOjyMETnWen49MqFCKt8gN/bz/UdIkQ/RvZRsCeLka30DAOJYbzi/VaTiudDQ27PMSyFEJMvmac4lFf1CXKgg0AVs+XBzGdyip/k5RtgUhuL9PnPUIzFFmPeqqsUER48/XfubIDDurjq6iSek=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 16:17:29.8243 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c357375d-a50f-4f9f-73e6-08d7468adb9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1758
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtzNhoT5WrJIF43FzY54g/YC8FN7tJzave3qPSMHVEs=;
 b=OzNU1d5k2lUuKeMBF9W7ee5s6VtyzKCzoixrzjMXpvDOfdj6a/mvyE9UcQfMmU5yY/hl6P+u/Db6TbCubZooIY4RUYkK6RW0y9NlPLeu7OJE7YMU1x5ce7qb7Q8pblh5lvAjfLQMh5NjQ9DlbQ58OfjLi3ekbXnZJHIUhv60/74=
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
dG9yZSBpdCBvbiBkcm1fZHBfbXN0X3BvcnQKClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVk
ZUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5k
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMiArKwog
aW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICB8IDMgKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
CmluZGV4IDNlN2I3NTUzY2Y0ZC4uOWYzNjA0MzU1NzA1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMKQEAgLTU1Myw2ICs1NTMsNyBAQCBzdGF0aWMgYm9vbCBkcm1fZHBfc2lk
ZWJhbmRfcGFyc2VfZW51bV9wYXRoX3Jlc291cmNlc19hY2soc3RydWN0IGRybV9kcF9zaWRlYmFu
ZAogewogCWludCBpZHggPSAxOwogCXJlcG1zZy0+dS5wYXRoX3Jlc291cmNlcy5wb3J0X251bWJl
ciA9IChyYXctPm1zZ1tpZHhdID4+IDQpICYgMHhmOworCXJlcG1zZy0+dS5wYXRoX3Jlc291cmNl
cy5mZWNfY2FwYWJsZSA9IHJhdy0+bXNnW2lkeF0gJiAweDE7CiAJaWR4Kys7CiAJaWYgKGlkeCA+
IHJhdy0+Y3VybGVuKQogCQlnb3RvIGZhaWxfbGVuOwpAQCAtMjE4Myw2ICsyMTg0LDcgQEAgc3Rh
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
