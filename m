Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0219D168
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 16:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7436C8957B;
	Mon, 26 Aug 2019 14:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780057.outbound.protection.outlook.com [40.107.78.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65A889322
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 14:09:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHG8cVrC8EJWVKDDBpOVQGop0ItK7uEm4+e5bE1svDxNFGeGVF2StGSnICjYkL5X/ppwvHgF29N4r1RWvlnw6pGFUfDd6rdSrUvmcVAsPYhf/HMAUenOXXTU0CYgEc9DjBri75WpNlQki/NMBkWBCJeqCCtuzIseIhkmEJnCWEIcpdVtGGJGJbteP8xzlepGcInoRNK2MJALkPBXHwie8glnFYxeR9961e0g4IJM4QNYyRdwwo2hGXjas32tFyhsSRS5rilsFYTyZhfhVQr/xkVfZor6Pjr5Ogf/ARymc+m9+0XTEO1cQY8cRSL07rOv1YTyKg3z9m5JRCIfrVWnrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipZkMogiVTtH6unVUU46wQQJlQTxfLxLr28XtWrgkv4=;
 b=lThgftws/CsMszTFoi0TyzQuOPwVOBkDtpQ5FdJNdhFeY2Uercim4tDpNHxkL4oEOpz2RsRThLeJGZ5YyihmJb6eZomKmDeSZmxLGTC5vWGeR3YQT7cEDmZvD661+VD8iG8BynAtUgyRZz/cdhpSIyZcQIB3jsz0R4xl2/uDSx4fXnQsGt2DnJxwKG4C576AaubGH+OPQjC1EDDDa+/a0Hm3BZ5APHR6lLiHUBU3jkkSTjBrUb+xUxGVXdeAwHXK4nJuk0wZzPpT+2v7+6mT69SoM2JDRd5q358lOk3LxNejSFpRKGj3nRy0v6mzEkteqSm81P7oqNEPzJbyrb4N+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0071.namprd12.prod.outlook.com (2603:10b6:3:103::33)
 by SN6PR12MB2719.namprd12.prod.outlook.com (2603:10b6:805:70::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.19; Mon, 26 Aug
 2019 14:09:32 +0000
Received: from BY2NAM03FT058.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by DM5PR12CA0071.outlook.office365.com
 (2603:10b6:3:103::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.15 via Frontend
 Transport; Mon, 26 Aug 2019 14:09:32 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT058.mail.protection.outlook.com (10.152.85.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 14:09:31 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 26 Aug 2019 09:09:07 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 4/6] drm/dp_mst: Fill branch->num_ports
Date: Mon, 26 Aug 2019 10:09:01 -0400
Message-ID: <20190826140903.12580-5-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826140903.12580-1-David.Francis@amd.com>
References: <20190826140903.12580-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(346002)(136003)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(76176011)(478600001)(4326008)(1076003)(8936002)(47776003)(14444005)(186003)(446003)(2906002)(476003)(86362001)(426003)(305945005)(53936002)(70586007)(70206006)(8676002)(16586007)(26005)(6666004)(356004)(316002)(48376002)(51416003)(81166006)(36756003)(486006)(50466002)(50226002)(2616005)(11346002)(2351001)(5660300002)(126002)(6916009)(49486002)(81156014)(336012)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2719; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93a0df9b-ec65-4a34-6f6b-08d72a2f0437
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:SN6PR12MB2719; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2719:
X-Microsoft-Antispam-PRVS: <SN6PR12MB27198E9CCCE1B5EFDF92A840EFA10@SN6PR12MB2719.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: YECmtEgI0TZJpW+J4g912MZaBa2vnXqq16vmb/yQijEvhxSIWs+1cL5GGa6UOIMm6RjwdECiGMHC+gFKXPtEHG36/EEen+RgUGcnbkG/KwYfSUl2qlrgrdcrO9Mm/TeYuWSZ/bGgwzdKBtReuInEUy1qKEyVDHK09/hcPa3dqrvHdWD5T5OdHs32Z9Bw8N4ko6evfdxPG4LFQlzs+fwQcWr3gO+x9/VZxSxNy2YEGc2//V3ba7cRsJgaVNcayE5RGpHx3MUMqIWaDh5UBZ0hCumiRVvc2UrQNvvn1ZtyEWMBXIluCnyqCm+ruCO+ByJm7+FFQXHwEBj94r2aGBCeCe74DoZpXD8cCE9IPf+SXMo0BiZ8EL6fPGnVzC1wXXsbtF9pDY5J7SM6QKv0SrUOZyy0ESicUdkvfNHPdxhEG5E=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 14:09:31.7214 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a0df9b-ec65-4a34-6f6b-08d72a2f0437
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2719
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipZkMogiVTtH6unVUU46wQQJlQTxfLxLr28XtWrgkv4=;
 b=uZEds9Q86PNh6K9te2v0aSQU1WF86jE4R1c/m4loe4TEHdZCLuDPZpTBNS0LqMiOln7w60gqcmnsIlpY3kygNkIeV+xA8PIK1gvLKBCnTBdFUEsO+8Bb3BGvO2E8xNG9dB8MlpUHt89O0iaUS/ri2/5dkgOqujhzcnmFEqqx2hs=
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
