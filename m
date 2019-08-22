Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B170995A0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 15:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAB96EB44;
	Thu, 22 Aug 2019 13:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720059.outbound.protection.outlook.com [40.107.72.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C49B6EB3F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 13:57:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OX4w9s36U+mwU3zGho5d3qIUP3Eo+BSxu2b5atyGpvtzHj5dNo/pdWh1422sOCVxYOVZYcraO1WK8FSCieaeGcgvYNvTLwzwxOOcjERe3JzmpLxHq21wjo0H4UrJtAQjKAsMH39s8e9GDbpt05cYrKPY2jXTtdFIo3nhUfcYGcmkNW2X+TtQYhm9ExWaRKzYF7p6JlII69FdkXl5dNujrEkODEv/k6E9OtiDIdTxq00mLmsNTfYw2AMlqae3JZ4KMwRTeWPXPxfh9KILTeoBq8j8PHc/mgH/2pbxEvpPh3kFkRP5PvelHqlgyYSDXl6mv+XnQfbVMcB0J/jlsmx5DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrgy8YFf4sJPFZphNL00IXXWk5RtwebiY/2bwUEnFF0=;
 b=htdbxM10nhzxxLCNrr2vScWbDIZe/qB8E6lb0MIgQRB3NOKSvesDEqdsAq3LUsyKSfRDm9jtwSfV40u9BlfbHn4ALRwpMKedA1MCPPFWlt1r2CS5urUYMDUff+ODN6sI7N6GLgcGriE4dRY/Ytq2A3vMDh6egxCc6jBFHtg+p1WPx4R8TzckuB6CIGa+4icWMPH7TAEL4cNGASCJzQNn7N+yxk7LuUICVTtmWwVH3Og5mzT5VqQIrTeJljRNMgsiPG+WlZEaFlEG4H1MeJPIw6paCDFfNXrxt0G7p9p3RipjQW6g1xs/oOqJRf3InTmkicQBkNPCS7++gDr5HRGsrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0074.namprd12.prod.outlook.com (2603:10b6:0:57::18) by
 DM5PR12MB1529.namprd12.prod.outlook.com (2603:10b6:4:3::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 13:57:51 +0000
Received: from CO1NAM03FT023.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM3PR12CA0074.outlook.office365.com
 (2603:10b6:0:57::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Thu, 22 Aug 2019 13:57:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT023.mail.protection.outlook.com (10.152.80.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Thu, 22 Aug 2019 13:57:50 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 22 Aug 2019 08:57:45 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 4/5] drm/dp-mst: Fill branch->num_ports
Date: Thu, 22 Aug 2019 09:57:40 -0400
Message-ID: <20190822135741.12923-5-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822135741.12923-1-David.Francis@amd.com>
References: <20190822135741.12923-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(396003)(346002)(2980300002)(428003)(189003)(199004)(1076003)(36756003)(426003)(8676002)(6916009)(51416003)(336012)(186003)(26005)(49486002)(50466002)(48376002)(53936002)(4326008)(47776003)(14444005)(16586007)(305945005)(6666004)(356004)(2906002)(478600001)(2616005)(476003)(126002)(81156014)(81166006)(11346002)(50226002)(8936002)(5660300002)(70206006)(446003)(70586007)(486006)(76176011)(86362001)(316002)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1529; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97dddb2b-56d3-4c62-7713-08d72708b885
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:DM5PR12MB1529; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1529:
X-Microsoft-Antispam-PRVS: <DM5PR12MB15296236FC57D4981B6B7056EFA50@DM5PR12MB1529.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 01371B902F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Tkp7oUiMmKG/QgNDPSLC3P1I1HNMWGugPz44p0vpx8mTGOfOKRrYTUcInJovU/vCyy52+1oIPIKpMZJ+gYryTVlGF2BrHX5/pnSc8mMeVjl3rvWlxi1YEvQpot4E5nvd9cHvKD+XnNy1VjrBAT38DglZufu0Tj+Lk5auUsoH24Ja5fFMIItrouiQm+ECwk3NBqP4N0EdIWYpV1o1Y0mubIPPuMwSmlmXgHiCHCbQJGQFzgGLpjX2wt/GCFbbjUdu3/P+Zg6kNSpOqaaZuWmda3gdvkUc+HQEsCMN9POXy0fcDW/QAO0hafomnAdkMJbtjTHGIYe9AEeIvIaXx3+LZHEge/fEhhQtrG4nI90LBvye/1DZhAyth/6ftzFx8fvI+q2c4yAFdIpAkuCOiQ3ufuUtvdlOmMhxs8ncMrFSSLk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2019 13:57:50.3169 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97dddb2b-56d3-4c62-7713-08d72708b885
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1529
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrgy8YFf4sJPFZphNL00IXXWk5RtwebiY/2bwUEnFF0=;
 b=XCMNLBZfTKHIU3LfIrHIYSG9cyUlW+ulyZex+ZWYc6VXhkllHy0mCtR+wmqis8p8eiJhlmX5t1Z+jDxkzhibarMW2woNcS+6IpQa87f7VR8pS3Unz1qpAYmg6nypbZuR0abmkqexHGzXbivDhwNOGFpeTeQb87gJY0icCBmiVMo=
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

VGhpcyBmaWVsZCBvbiBkcm1fZHBfbXN0X2JyYW5jaCB3YXMgbmV2ZXIgZmlsbGVkCgpJbml0aWFs
aXplIGl0IHRvIHplcm8gd2hlbiB0aGUgbGlzdCBvZiBwb3J0cyBpcyBjcmVhdGVkLgpXaGVuIGEg
cG9ydCBpcyBhZGRlZCB0byB0aGUgbGlzdCwgaW5jcmVtZW50IG51bV9wb3J0cywKYW5kIHdoZW4g
YSBwb3J0IGlzIHJlbW92ZWQgZnJvbSB0aGUgbGlzdCwgZGVjcmVtZW50IG51bV9wb3J0cy4KCnYy
OiByZW1lbWJlciB0byBkZWNyZW1lbnQgb24gcG9ydCByZW1vdmFsCgpTaWduZWQtb2ZmLWJ5OiBE
YXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBMeXVkZSBQ
YXVsIDxseXVkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3Rv
cG9sb2d5LmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDUwYTA0NDcxODQzOS4uYWY0YjVjZWM3
Yzg0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTkxOSw2ICs5MTks
NyBAQCBzdGF0aWMgc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICpkcm1fZHBfYWRkX21zdF9icmFu
Y2hfZGV2aWNlKHU4IGxjdCwgdTggKnJhZCkKIAlJTklUX0xJU1RfSEVBRCgmbXN0Yi0+cG9ydHMp
OwogCWtyZWZfaW5pdCgmbXN0Yi0+dG9wb2xvZ3lfa3JlZik7CiAJa3JlZl9pbml0KCZtc3RiLT5t
YWxsb2Nfa3JlZik7CisJbXN0Yi0+bnVtX3BvcnRzID0gMDsKIAlyZXR1cm4gbXN0YjsKIH0KIApA
QCAtMTY2OSw2ICsxNjcwLDcgQEAgc3RhdGljIHZvaWQgZHJtX2RwX2FkZF9wb3J0KHN0cnVjdCBk
cm1fZHBfbXN0X2JyYW5jaCAqbXN0YiwKIAkJbXV0ZXhfbG9jaygmbXN0Yi0+bWdyLT5sb2NrKTsK
IAkJZHJtX2RwX21zdF90b3BvbG9neV9nZXRfcG9ydChwb3J0KTsKIAkJbGlzdF9hZGQoJnBvcnQt
Pm5leHQsICZtc3RiLT5wb3J0cyk7CisJCW1zdGItPm51bV9wb3J0cysrOwogCQltdXRleF91bmxv
Y2soJm1zdGItPm1nci0+bG9jayk7CiAJfQogCkBAIC0xNzAzLDYgKzE3MDUsNyBAQCBzdGF0aWMg
dm9pZCBkcm1fZHBfYWRkX3BvcnQoc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiLAogCQkJ
LyogcmVtb3ZlIGl0IGZyb20gdGhlIHBvcnQgbGlzdCAqLwogCQkJbXV0ZXhfbG9jaygmbXN0Yi0+
bWdyLT5sb2NrKTsKIAkJCWxpc3RfZGVsKCZwb3J0LT5uZXh0KTsKKwkJCW1zdGItPm51bV9wb3J0
cy0tOwogCQkJbXV0ZXhfdW5sb2NrKCZtc3RiLT5tZ3ItPmxvY2spOwogCQkJLyogZHJvcCBwb3J0
IGxpc3QgcmVmZXJlbmNlICovCiAJCQlkcm1fZHBfbXN0X3RvcG9sb2d5X3B1dF9wb3J0KHBvcnQp
OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
