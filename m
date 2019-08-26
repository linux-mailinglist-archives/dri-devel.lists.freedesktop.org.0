Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8E99D27D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 17:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625D46E15F;
	Mon, 26 Aug 2019 15:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740082.outbound.protection.outlook.com [40.107.74.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF1A6E15F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:17:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqCXwH+roZ3BxZqEf7huSFX5a1Kk3U+Rc3vpMakl9Go8FXwE0SjvX9eVrwrscB24iZb7m1yP83C58BwUwC7qoWmLKUH0cmmqUgbd9F4XByCVoS6cy4CWHu0HDQR6CD5ucLDHAKWeyFG7HWLXjucfRXJ5bB9nDm4T3q/5Ey9RB1AW3Q+rs11UNOM6964ARxPBnmaE5a+V8H7eQzgiYFLZPzg1ZUgf/gYFqcgNeUfcUIxoq0dCtX/oMWKHToybvv55gyawttJ//5gcyxgliLt5eMs22JPQbxFs3V4WrNA3Eooaj0oHrjHjVzeYCzce2KfFOL1dgV0OAeV2/lPq/G4x9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipZkMogiVTtH6unVUU46wQQJlQTxfLxLr28XtWrgkv4=;
 b=Eek8BSwkmgtx8gHzxHXmD1VkjAAiqEa9ELSMphz7zesAExU2zYxUIMP/wXlvDOdwupJhEotru9OZ2ZI+SIE/qJa+JmCmXADmCIREQr5ySZOO5UPWn8/RBvi0dG199FUiPSJFzQXH21TTKDH1Da7mq5alCY/xrPjfB3ZcSY/hStR2daFgss2JDQ2Cit21AG7TMOkru82USVfqjE4rrd3gBDG12RsMg1+bGuCYtrvMx/qm15Ypj8XsJWveH1kaxwAEiAs/EpgHue16QL1NZT5pqSTjZEYAhmqLK2jm2IoSqyPgdBvyQhyxEB2sffwl0KhNld6vgmqZ4ygNtGPdgzTTEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0034.namprd12.prod.outlook.com (2603:10b6:208:a8::47)
 by BN6PR12MB1265.namprd12.prod.outlook.com (2603:10b6:404:1d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.19; Mon, 26 Aug
 2019 15:17:34 +0000
Received: from DM3NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by MN2PR12CA0034.outlook.office365.com
 (2603:10b6:208:a8::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Mon, 26 Aug 2019 15:17:34 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT045.mail.protection.outlook.com (10.152.82.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 15:17:34 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 26 Aug 2019 10:17:31 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 4/6] drm/dp_mst: Fill branch->num_ports
Date: Mon, 26 Aug 2019 11:17:26 -0400
Message-ID: <20190826151728.19567-5-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826151728.19567-1-David.Francis@amd.com>
References: <20190826151728.19567-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(8676002)(316002)(53936002)(426003)(5660300002)(16586007)(50466002)(2616005)(14444005)(48376002)(49486002)(47776003)(36756003)(2351001)(11346002)(446003)(126002)(70586007)(51416003)(76176011)(478600001)(26005)(1076003)(476003)(305945005)(6916009)(486006)(336012)(4326008)(70206006)(8936002)(186003)(6666004)(356004)(86362001)(2906002)(81156014)(81166006)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1265; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70d97e0a-9ed1-4e7b-707f-08d72a3885bf
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR12MB1265; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1265:
X-Microsoft-Antispam-PRVS: <BN6PR12MB126564E6347D689F061606B2EFA10@BN6PR12MB1265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: DBqNVY6uv2f/bpp4voG86WcWxDMtV0wccFVxmIN15fLLpYqcUx2uLkmUcEkdg6GFkD5C7+XxaqizqryuRNlETKqnSoUCm5H0+hsfoiQL8p1w3LImsIMfibU4FSVqMI7a1uBCq3Z3DX390PzeLCTkTI9o0AQIyvC8n+Zo/VahZ4nPOML1Ve0RP1cD0vRBVCL6XgBx1Hd7uy5+9fb43OTr8HEPlT+6dulhiijBGSYSVmUAG8LuMq+VQEJKsA99laavIaR3BDxGwPAN0nCNs2HE37yuXyL5s+NmyzFdrmbmip7efqUzl9DvMYym5z3GZqIzY54lGBnDSv7tIoxe+3VlirVALHJXin0r1LHLuiIQu+cEDptj9OykCbbmhAy7uHJA1OyPHUjkFRqBbXP3YI22aW5CnwvmOmOoKC/A17eKbp0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 15:17:34.5534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d97e0a-9ed1-4e7b-707f-08d72a3885bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1265
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipZkMogiVTtH6unVUU46wQQJlQTxfLxLr28XtWrgkv4=;
 b=dhMEhGAdvenMHKIEzdaePLDXMdAEN63BCr+3eED3Yae0tLyI74LZUeCiH1ySiWTYEwq6ukv9tiJfG29cFyQlhWVQvu2u82CMAvlpB9qkpLqXM6DzOJRGR3i9Z7xOJgs2I+7Miey6JGX+imJvVUbEWmHVXTg5ZiZ6c5Cfvj/jODg=
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
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDIgKysKIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwpp
bmRleCA5ZjM2MDQzNTU3MDUuLjUwMjkyM2MyNDQ1MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jCkBAIC0xNjY5LDYgKzE2NjksNyBAQCBzdGF0aWMgdm9pZCBkcm1fZHBfYWRk
X3BvcnQoc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiLAogCQltdXRleF9sb2NrKCZtc3Ri
LT5tZ3ItPmxvY2spOwogCQlkcm1fZHBfbXN0X3RvcG9sb2d5X2dldF9wb3J0KHBvcnQpOwogCQls
aXN0X2FkZCgmcG9ydC0+bmV4dCwgJm1zdGItPnBvcnRzKTsKKwkJbXN0Yi0+bnVtX3BvcnRzKys7
CiAJCW11dGV4X3VubG9jaygmbXN0Yi0+bWdyLT5sb2NrKTsKIAl9CiAKQEAgLTE3MDMsNiArMTcw
NCw3IEBAIHN0YXRpYyB2b2lkIGRybV9kcF9hZGRfcG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9icmFu
Y2ggKm1zdGIsCiAJCQkvKiByZW1vdmUgaXQgZnJvbSB0aGUgcG9ydCBsaXN0ICovCiAJCQltdXRl
eF9sb2NrKCZtc3RiLT5tZ3ItPmxvY2spOwogCQkJbGlzdF9kZWwoJnBvcnQtPm5leHQpOworCQkJ
bXN0Yi0+bnVtX3BvcnRzLS07CiAJCQltdXRleF91bmxvY2soJm1zdGItPm1nci0+bG9jayk7CiAJ
CQkvKiBkcm9wIHBvcnQgbGlzdCByZWZlcmVuY2UgKi8KIAkJCWRybV9kcF9tc3RfdG9wb2xvZ3lf
cHV0X3BvcnQocG9ydCk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
