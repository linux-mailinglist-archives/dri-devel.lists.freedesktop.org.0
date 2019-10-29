Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F27D0E8EFD
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 19:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44806E505;
	Tue, 29 Oct 2019 18:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790072.outbound.protection.outlook.com [40.107.79.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1556E4D2;
 Tue, 29 Oct 2019 18:07:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqi97FLxVKLYpLb/VoGLDj2AM0Jmmlibw3EUHMfpLm+LoiPbEH407jZn9wFO9Kj1rsSCbpXutbMrdTva+bsSYawfAtUJ28+EQ1kwNLBmMq4iTzgkkZZ/2gWySTGEHG3BD6UZe5d9D/kSWbVoXNkX5PNvPKYWYrJBeCI6f4Vs7I2C78N8a7XhESp8TeiXBd1LzgYZ0S/2T/Ue6CHBCp9xATB7h02mi0T/FJ7eIVCT/8CHHuOxwROJghxQgMquoZkhJLMm0wyDb1qLoAcLnkSLWzuES/bimodB29ezQFaipA/IcAFQwn2rp+WllG28WKeucoj0XiNqntWvBtL5yqP9Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xbnUu28uLDcQpWGEduz2HqSceFNGbLiHUicJgdL3Fo=;
 b=i7+07ONLry3JzuZFRo3znZ/3CzGwTxRXLG1iTGPRV+dgX7h2252pDlEGlcyZJuv27LU6zOYWQkjInZG8G75WmgWtFN+e1pmyDmh6jj4N5x0KDN74ggV7kEVdowCWsCy/Fio903uymBJ9Q7Zo55nWNvNhkyTHn2Gn7QwZaQbirmqdenOz62w2I4pBKg9YDzBjHeJecix3M2pL7z8iSbj98TZVaDeq0/AulIIWSGh4PCCRmHbnbooFrrodJ3VTOgpysArNGtnmn7vlMt5Hkh1v8viTRHeag3VxnUX2cxR1qhsEyC450pNsKnhu/Ix+84NtH8vq3Xgr17Yp/94/Venvag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=oracle.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0065.namprd12.prod.outlook.com (2603:10b6:0:56::33) by
 CY4PR1201MB0072.namprd12.prod.outlook.com (2603:10b6:910:1b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.17; Tue, 29 Oct
 2019 18:07:52 +0000
Received: from CO1NAM03FT015.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by DM3PR12CA0065.outlook.office365.com
 (2603:10b6:0:56::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.17 via Frontend
 Transport; Tue, 29 Oct 2019 18:07:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT015.mail.protection.outlook.com (10.152.80.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 18:07:51 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 13:07:50 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Tue, 29 Oct 2019 13:07:50 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dan.carpenter@oracle.com>
Subject: [PATCH v2] drm/sched:  Fix passing zero to 'PTR_ERR' warning
Date: Tue, 29 Oct 2019 14:07:48 -0400
Message-ID: <1572372468-20569-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(428003)(189003)(199004)(70206006)(305945005)(2351001)(50466002)(8936002)(478600001)(8676002)(50226002)(81156014)(81166006)(426003)(356004)(336012)(47776003)(51416003)(5660300002)(7696005)(53416004)(476003)(16586007)(14444005)(6916009)(316002)(36756003)(86362001)(44832011)(54906003)(186003)(70586007)(4326008)(48376002)(126002)(2906002)(486006)(2616005)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0072; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4594ba2b-ff77-4e15-63dc-08d75c9aea41
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0072:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB007204D2A9E4CC104522EF68EA610@CY4PR1201MB0072.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:29;
X-Forefront-PRVS: 0205EDCD76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ujjagCQmjxRlS4E4sQazJls+PU1Rw/7KvAvd7pi/jJ0jZ7sjoM9Z0tZkPFOz34lfUA43JilH3GIamCPTo2B28oh6w5XpVhGyIwPQrmMd2usgKQqLEnR9I2dw38BxhzoABnIH+vbIAaCpHJwjFpMDknQJP70x37kpwD0UQj3UVEajcpx6K6m4D3Jw8WCnZXJFqhKbo54Gas7IG89YfnzdpS0fxZCaGlqsqkIzrJM/Z8a0TpKAX/PbS7VFyMGsGmCuTx1uvfQLB5Y8oPec6/1wNodrTYf3BH9af/IliSxZC01Ak+eJacvARtBxZxbGS5J0qllHldY4gFX+RvoKosSmmmcrll06ClZqWqga4wYNz5GUMLM8D4R7HTccZ/Bj/EpatLKAnjFaX8fVNuAnRVZriKNX7iacVG902JPdocGaO60ZbtTdmvisM9OhGUlGDhic
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2019 18:07:51.9436 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4594ba2b-ff77-4e15-63dc-08d75c9aea41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0072
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xbnUu28uLDcQpWGEduz2HqSceFNGbLiHUicJgdL3Fo=;
 b=j5DcGu57DOL24zDTtGxU49+KwUlMIp/kQI8Bl69KNbOwC8pb3mCz6wCM5yxX4f4YjX4cOofAl1HUBmetp0JrglalVcO2opx4BbAoVvu8kmPFSOXBKPEGQehwI1iB38FT1K5SN7EiHKLgKtYc2sOVJfEcBotGxEoCex6cxk4WmSc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IGEgc3RhdGljIGNvZGUgY2hlY2tlciB3YXJuaW5nLgoKdjI6IERyb3AgUFRSX0VSUl9PUl9a
RVJPLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCA3
ICsrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9k
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwppbmRleCBmMzliOTdlLi5kYmE0
MzkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwpAQCAtNDk2LDggKzQ5
NiwxMCBAQCB2b2lkIGRybV9zY2hlZF9yZXN1Ym1pdF9qb2JzKHN0cnVjdCBkcm1fZ3B1X3NjaGVk
dWxlciAqc2NoZWQpCiAJCWZlbmNlID0gc2NoZWQtPm9wcy0+cnVuX2pvYihzX2pvYik7CiAKIAkJ
aWYgKElTX0VSUl9PUl9OVUxMKGZlbmNlKSkgeworCQkJaWYgKElTX0VSUihmZW5jZSkpCisJCQkJ
ZG1hX2ZlbmNlX3NldF9lcnJvcigmc19mZW5jZS0+ZmluaXNoZWQsIFBUUl9FUlIoZmVuY2UpKTsK
KwogCQkJc19qb2ItPnNfZmVuY2UtPnBhcmVudCA9IE5VTEw7Ci0JCQlkbWFfZmVuY2Vfc2V0X2Vy
cm9yKCZzX2ZlbmNlLT5maW5pc2hlZCwgUFRSX0VSUihmZW5jZSkpOwogCQl9IGVsc2UgewogCQkJ
c19qb2ItPnNfZmVuY2UtPnBhcmVudCA9IGZlbmNlOwogCQl9CkBAIC03NDEsOCArNzQzLDkgQEAg
c3RhdGljIGludCBkcm1fc2NoZWRfbWFpbih2b2lkICpwYXJhbSkKIAkJCQkJICByKTsKIAkJCWRt
YV9mZW5jZV9wdXQoZmVuY2UpOwogCQl9IGVsc2UgeworCQkJaWYgKElTX0VSUihmZW5jZSkpCisJ
CQkJZG1hX2ZlbmNlX3NldF9lcnJvcigmc19mZW5jZS0+ZmluaXNoZWQsIFBUUl9FUlIoZmVuY2Up
KTsKIAotCQkJZG1hX2ZlbmNlX3NldF9lcnJvcigmc19mZW5jZS0+ZmluaXNoZWQsIFBUUl9FUlIo
ZmVuY2UpKTsKIAkJCWRybV9zY2hlZF9wcm9jZXNzX2pvYihOVUxMLCAmc2NoZWRfam9iLT5jYik7
CiAJCX0KIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
