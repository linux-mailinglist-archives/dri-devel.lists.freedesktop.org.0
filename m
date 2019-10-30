Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4901DEA52A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 22:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985776EB8E;
	Wed, 30 Oct 2019 21:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800045.outbound.protection.outlook.com [40.107.80.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDEA6EB89;
 Wed, 30 Oct 2019 21:09:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMgc8UMnet7AcpQXDbfMV2qSbobQT42oNT3vEioU7n66KNAWn3yaGUvbOdQA+pQ8MZF/OiorLbejACo0X8dICKGsRd8fasgXnzzg1aO9bez5tS3AmO79DoaFSuOpc+xLN3Ss10KMw4EBbTPsVlJBaZ525QsSi/Q+GOe9ooUbghVMjRGu0BtOnFoz9dwSYAFzwf4IRsp8Czgw6/iAjh5cU7xa0yQgNL1cnqL0M+TdzT3/RDOjsKoxiJu5Mcc5PEmyJMLLmyXdZyEDqzwpLC6vk2pFdNl3Y2pGAnO4v5fwB+DtndjBA0F8iwM3i+3Ep7T1120mdZAuzuuRRgLtQ8MPYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuQQMeKn2RUSx0KxWL852P5/QUkHc6cjq2GT90VUpKQ=;
 b=jQ8oKahR+hOlsPElCtHBzOtmPCw/BFsWKx8UeGlTBprvbdviIY2QqZIaZDMjOIoydUyIh+jmSVccdteNXfQv/n36e7KwZKB00KeXcMNpi3R6eOPm6Oa+e9n9sdAe7iu6XR6DBZKa72AxczsR5dREWQKpR9C4kbtBCThUDaUNIQ/o1eFEW3wMolPb8gszdSZXUzPZTBq798mDLBby1KgdoU1/bbK+xc31WOVUNFpS8hgCPB192GxIeRNPd30OJ9tFfOYEATEWlWPsXytDEK73cBQvPuUTc06RWe61M7n3cG0YEraHelVqiBUaUMM9RapgAVMVf4jog/BeSvliF7UkDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0029.namprd12.prod.outlook.com (2603:10b6:208:a8::42)
 by MWHPR12MB1166.namprd12.prod.outlook.com (2603:10b6:300:7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.23; Wed, 30 Oct
 2019 21:09:31 +0000
Received: from CO1NAM03FT043.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by MN2PR12CA0029.outlook.office365.com
 (2603:10b6:208:a8::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.25 via Frontend
 Transport; Wed, 30 Oct 2019 21:09:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT043.mail.protection.outlook.com (10.152.81.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Wed, 30 Oct 2019 21:09:29 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 16:09:28 -0500
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 30 Oct 2019 16:09:28 -0500
From: "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/display: Hook up drm interface for DP 1.4 edid
 corruption test
Date: Wed, 30 Oct 2019 17:08:44 -0400
Message-ID: <20191030210844.19803-3-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20191030210844.19803-1-Jerry.Zuo@amd.com>
References: <20191030210844.19803-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(428003)(199004)(189003)(51416003)(426003)(76176011)(2906002)(26005)(8936002)(186003)(446003)(486006)(356004)(6666004)(336012)(50226002)(14444005)(5660300002)(7696005)(4326008)(70586007)(70206006)(316002)(50466002)(54906003)(48376002)(16586007)(110136005)(47776003)(81156014)(8676002)(1076003)(53416004)(478600001)(2616005)(126002)(476003)(305945005)(36756003)(86362001)(11346002)(81166006)(52103002)(158003001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1166; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 735d11ca-dfc8-475c-2e4f-08d75d7d742f
X-MS-TrafficTypeDiagnostic: MWHPR12MB1166:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1166B628670CA622B47BAE44E5600@MWHPR12MB1166.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:389;
X-Forefront-PRVS: 02065A9E77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JUICprthAQiohG18FAnpNCRMNTRrep2evEIDdGz6wfpRip1mLsNdJCgWi8RPHpAi933YZs/NE27En/0070OmLjwAs5fitgxrvLNS8vjUj9d9elZ5ueb8pwR7O5TMcX+YCgCXQUj8MPLaW7V88+ZPcJzaBPUYqqRtfa/AtdeNX0/VMcdebKAQHwmdhNajErYBeOUL45YwX/ySugg45l/WUatQUr/B8F4zqPmRJmEJu6tA98hxUnGVDFwjnpi6JCGamdUGAv28cqHOpR8qffIIjdoOKy+uBoDgKJ7/Np4/iokSWP1uQmwLbaU2N9p1j0KXWHcgTLbOd80P3l2vLwYTF3UKRIhpeviThLCoQ1S/ji5UtASCQL6iRr6gizT52D/i2J8pomH8u0mFvLTV709XgSrDCg1rshlxaIDZJOsNmvsW1o/N27am6PAAV6WeUx5D
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2019 21:09:29.6157 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 735d11ca-dfc8-475c-2e4f-08d75d7d742f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1166
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuQQMeKn2RUSx0KxWL852P5/QUkHc6cjq2GT90VUpKQ=;
 b=pBcZmIPb4iqK3AjoOviP1g/7fykCOa9dz6ByeTfCGZIlcARx7DoQh+GtIlnzIeIR/kbIvfkQQ0y8wDrGirTsgYTd/QibCFCN1PKCai/pi1qTzyFGORwRosCrwpXIE0X9z5F8KJ7QtuNjLgiwFToChjkIRvuKHXHQOljRg1G774o=
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
Cc: manasi.d.navare@intel.com, Jerry.Zuo@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogSmVycnkgKEZhbmd6aGkpIFp1byA8SmVycnkuWnVvQGFtZC5jb20+Ci0t
LQogLi4uL2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyAgfCAz
NSArKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAyOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKaW5kZXggMTFlNTc4NGFhNjJhLi5j
NDMwODkwMDg1ZjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKQEAgLTU3NSw2ICs1NzUsNyBAQCBlbnVt
IGRjX2VkaWRfc3RhdHVzIGRtX2hlbHBlcnNfcmVhZF9sb2NhbF9lZGlkKAogCQlzdHJ1Y3QgZGNf
c2luayAqc2luaykKIHsKIAlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvciA9
IGxpbmstPnByaXY7CisJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciA9ICZhY29ubmVj
dG9yLT5iYXNlOwogCXN0cnVjdCBpMmNfYWRhcHRlciAqZGRjOwogCWludCByZXRyeSA9IDM7CiAJ
ZW51bSBkY19lZGlkX3N0YXR1cyBlZGlkX3N0YXR1czsKQEAgLTU5Miw2ICs1OTMsMTIgQEAgZW51
bSBkY19lZGlkX3N0YXR1cyBkbV9oZWxwZXJzX3JlYWRfbG9jYWxfZWRpZCgKIAogCQllZGlkID0g
ZHJtX2dldF9lZGlkKCZhY29ubmVjdG9yLT5iYXNlLCBkZGMpOwogCisJCWlmIChsaW5rLT5hdXhf
bW9kZSAmJiBjb25uZWN0b3ItPmVkaWRfY29ycnVwdCkKKwkJCWRybV9kcF9zZW5kX2JhZF9lZGlk
X2NoZWNrc3VtKCZhY29ubmVjdG9yLT5kbV9kcF9hdXguYXV4LCBjb25uZWN0b3ItPmJhZF9lZGlk
X2NoZWNrc3VtKTsKKworCQlpZiAoIWVkaWQgJiYgY29ubmVjdG9yLT5lZGlkX2NvcnJ1cHQpCisJ
CQlyZXR1cm4gRURJRF9CQURfQ0hFQ0tTVU07CisKIAkJaWYgKCFlZGlkKQogCQkJcmV0dXJuIEVE
SURfTk9fUkVTUE9OU0U7CiAKQEAgLTYxMiwzNCArNjE5LDYgQEAgZW51bSBkY19lZGlkX3N0YXR1
cyBkbV9oZWxwZXJzX3JlYWRfbG9jYWxfZWRpZCgKIAkJRFJNX0VSUk9SKCJFRElEIGVycjogJWQs
IG9uIGNvbm5lY3RvcjogJXMiLAogCQkJCWVkaWRfc3RhdHVzLAogCQkJCWFjb25uZWN0b3ItPmJh
c2UubmFtZSk7Ci0JaWYgKGxpbmstPmF1eF9tb2RlKSB7Ci0JCXVuaW9uIHRlc3RfcmVxdWVzdCB0
ZXN0X3JlcXVlc3QgPSB7IHswfSB9OwotCQl1bmlvbiB0ZXN0X3Jlc3BvbnNlIHRlc3RfcmVzcG9u
c2UgPSB7IHswfSB9OwotCi0JCWRtX2hlbHBlcnNfZHBfcmVhZF9kcGNkKGN0eCwKLQkJCQkJbGlu
aywKLQkJCQkJRFBfVEVTVF9SRVFVRVNULAotCQkJCQkmdGVzdF9yZXF1ZXN0LnJhdywKLQkJCQkJ
c2l6ZW9mKHVuaW9uIHRlc3RfcmVxdWVzdCkpOwotCi0JCWlmICghdGVzdF9yZXF1ZXN0LmJpdHMu
RURJRF9SRUFEKQotCQkJcmV0dXJuIGVkaWRfc3RhdHVzOwotCi0JCXRlc3RfcmVzcG9uc2UuYml0
cy5FRElEX0NIRUNLU1VNX1dSSVRFID0gMTsKLQotCQlkbV9oZWxwZXJzX2RwX3dyaXRlX2RwY2Qo
Y3R4LAotCQkJCQlsaW5rLAotCQkJCQlEUF9URVNUX0VESURfQ0hFQ0tTVU0sCi0JCQkJCSZzaW5r
LT5kY19lZGlkLnJhd19lZGlkW3NpbmstPmRjX2VkaWQubGVuZ3RoLTFdLAotCQkJCQkxKTsKLQot
CQlkbV9oZWxwZXJzX2RwX3dyaXRlX2RwY2QoY3R4LAotCQkJCQlsaW5rLAotCQkJCQlEUF9URVNU
X1JFU1BPTlNFLAotCQkJCQkmdGVzdF9yZXNwb25zZS5yYXcsCi0JCQkJCXNpemVvZih0ZXN0X3Jl
c3BvbnNlKSk7Ci0KLQl9CiAKIAlyZXR1cm4gZWRpZF9zdGF0dXM7CiB9Ci0tIAoyLjE0LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
