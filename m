Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C03F894925
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 17:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0866E1F7;
	Mon, 19 Aug 2019 15:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700049.outbound.protection.outlook.com [40.107.70.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4936E1EC;
 Mon, 19 Aug 2019 15:50:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gb2Qo0ZKj/Jmyj0OpIR3b64w8CAOYXXWpX3z2GZMtF/CY8BoC9wDVGwmBc5HKIyv1eGb/WAhG7FGMszrSILB1FdU+n93wz520n+EsZwJJIRJ1ZcMPr7GKPJqviLy1XTwUKrkzsWlAWQ8bOhOTnAsZDcEyf0NPTfjt7oe5VH95cR4EDE5pZW385WIlm6o43y2AkktDLrYpJ5HcZy3EfIG3UZPdxksRoYjINDwwp9aRy1czaaIhokXsB3KjxYFx27aXBZoJtmZiRBdx20/QuHA5C13GitCVISFM/iSxZEOrHO2iiF3ek/1cG5O0JDxFXdYM9tKA2Q5c0eou15IAMjj5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7rWlPJKmME+xIBu09fDr07QraHuSxMrBbXx3oQFQlc=;
 b=cHoY3iU3V9c3xBfDEumkd99AR6oOk/rz80Cl/yyUvG1bL5fjq6sBMn4XkS1BE6cDNG1TvDuOVwYiOUqRvpdqhOuftvFdqGyWgQtO2K7l8KYb5NFrJOMkp6putJcE9/1CtP2kCtf5c6MyXIHCnT3DJpMuiLNRsqXLVRHtjtnU/jVUIb7xGyh6vgCyIlFZW4X6LwcdDZ4YtAKPwop3/HsNVIpsQhVvKtEIQciaIRB11U27hR6EMgyIRd+a3c3rTr+HgS3qjm9pkqU0/4r1SBffbKHbKqEClp1QpJjEZXyLquvQPsm4sdLgReacbQ72Rg6uY/5JPjWTcKE/Z6pWhZbsww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0066.namprd12.prod.outlook.com (2603:10b6:0:56::34) by
 BN6PR12MB1521.namprd12.prod.outlook.com (2603:10b6:405:f::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 15:50:55 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM3PR12CA0066.outlook.office365.com
 (2603:10b6:0:56::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 15:50:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 15:50:54 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 19 Aug 2019 10:50:49 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/14] drm/dp-mst: Fill branch->num_ports
Date: Mon, 19 Aug 2019 11:50:34 -0400
Message-ID: <20190819155038.1771-11-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819155038.1771-1-David.Francis@amd.com>
References: <20190819155038.1771-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(428003)(189003)(199004)(6666004)(356004)(70586007)(305945005)(47776003)(76176011)(51416003)(86362001)(186003)(14444005)(26005)(50466002)(426003)(486006)(11346002)(446003)(2616005)(476003)(126002)(48376002)(110136005)(478600001)(16586007)(316002)(1076003)(336012)(49486002)(53936002)(36756003)(2906002)(450100002)(5660300002)(8936002)(4744005)(81166006)(4326008)(50226002)(81156014)(70206006)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1521; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43a46a84-2103-4d9b-7191-08d724bd0536
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1521; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1521:
X-Microsoft-Antispam-PRVS: <BN6PR12MB152147A903562337D55C1E75EFA80@BN6PR12MB1521.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 24QyEsOL0MEl0uKRwZy68yqT1fv+7HietAYrkHXLuLwJvHw033UgZ59ot8SLzpmMbjvzGKY7UmBeh8pWM7AoxGOeYRI7gzO6z23+WiluIPursxCLQ8D6tIB0KAshyzTUgQKIxjSzi/w+Z2SkHzCZfVHWDe6L0Bc2AgZmDfxPcoN7Is9+f/oETEn6pX4RiajOSAjmwSMpMv2jKCQtnsvIOg59WSrK9G+tjDEE88l6BhTwMZSFrnEqFQ+xwPxe7lhreCSQKMc0BvnrN51GSaY4VjNgB+tEuUdFjad/WnnAnxf2OwqCcL8LMJ2CDa5JvwVM/NAcEFwVefsNuzSmS9H/LhCk0/GyGAc2Uo9tEkR+wajfIM+b7srPmU1maAJFPBorrlSigqBqv7kwUwbWRph+nn2kwqJ5MDr0LYIBNkUeZkY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 15:50:54.9426 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a46a84-2103-4d9b-7191-08d724bd0536
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1521
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7rWlPJKmME+xIBu09fDr07QraHuSxMrBbXx3oQFQlc=;
 b=irPqOvMrc9NWCoBO1RA2DBYyTQse/qQ/2z659hCHPboHnF714rXJjGrF8oXLFAvS4xt76LHAd/VV84TZy7uV/MKGpu9f9+PpIf/RjOJmnhs7gHwvOe39hLyUok3h64t1TN8YkridCpqxjbIzGe+hbUD6RCuOsaBUv7cwDB0WvRE=
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
cG9ydCBpcyBhZGRlZCB0byB0aGUgbGlzdCwgaW5jcmVtZW50IG51bV9wb3J0cwoKU2lnbmVkLW9m
Zi1ieTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5kZXggNWEw
NzI1NzFjYjQ0Li4zMWI3MjEzYjYwMzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYwpAQCAtOTE4LDYgKzkxOCw3IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2gg
KmRybV9kcF9hZGRfbXN0X2JyYW5jaF9kZXZpY2UodTggbGN0LCB1OCAqcmFkKQogCUlOSVRfTElT
VF9IRUFEKCZtc3RiLT5wb3J0cyk7CiAJa3JlZl9pbml0KCZtc3RiLT50b3BvbG9neV9rcmVmKTsK
IAlrcmVmX2luaXQoJm1zdGItPm1hbGxvY19rcmVmKTsKKwltc3RiLT5udW1fcG9ydHMgPSAwOwog
CXJldHVybiBtc3RiOwogfQogCkBAIC0xNjcyLDYgKzE2NzMsNyBAQCBzdGF0aWMgdm9pZCBkcm1f
ZHBfYWRkX3BvcnQoc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiLAogCQltdXRleF9sb2Nr
KCZtc3RiLT5tZ3ItPmxvY2spOwogCQlkcm1fZHBfbXN0X3RvcG9sb2d5X2dldF9wb3J0KHBvcnQp
OwogCQlsaXN0X2FkZCgmcG9ydC0+bmV4dCwgJm1zdGItPnBvcnRzKTsKKwkJbXN0Yi0+bnVtX3Bv
cnRzKys7CiAJCW11dGV4X3VubG9jaygmbXN0Yi0+bWdyLT5sb2NrKTsKIAl9CiAKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
