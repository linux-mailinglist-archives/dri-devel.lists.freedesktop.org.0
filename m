Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A01F89FC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 08:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A66D6EA5B;
	Tue, 12 Nov 2019 07:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730044.outbound.protection.outlook.com [40.107.73.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5696EA5B;
 Tue, 12 Nov 2019 07:53:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmTTgfMnFsHtXnpJQ6kMgjzh6MEtkgo9hNSFjMyqdSKI6KQFNTjdE/D5E6x35nhsKTS7CStBfA2BQcny0T7cBXDnE/94w7Vt0Je3xLDjcftD3WCpjaxcWu8I46JbnShgbUG/nJQ3xV8x+RVP0kIhqA/xaqYhAO751fEJm8KpKkjnbXIaHGlycwj+XM8MKLWlXu7qb8wpOh+DIaJ8Y/9+wIVlVWyScpo3AbD085ViUia31rodcRE0+uLEM2lFI9IrE7GrxgsrLhUmNNjZMRKunqWR+I4zv7p2cce9KoUYLVpeEUrUxReHhCvX5vWyRF5wj6zYL74M/GhUChTYHWXZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u81Sa04Nv3OsU91I799dEuFjky5nz8wfKX/gMLK08sw=;
 b=fcB0MBBIHOEloGhdhwYzRJaWe6LROhn7TOFmKJFdU4jP8bngWBfU8oWebOgbQsITXoujtNhTx3As5kSKmpFC4rEPrnJMhk223JSba5lEAkANQbWMz4w6UrEuqI6BkO89K2ZvoWg6UUIdRFM2nhE12QaJPgq1wu+DeRigrfpb5Kn2cmVxVblO9a9b6xfWrxpjjyusRhEmhw027C6mVpZwIIYYE+LMpVc2q8bAJCmSyxlnmDUUjSZ0J+dAduXoH3QVjTAxCKip606dd9MhVyE+D1BvoVeE01vwdghpEwMwGaRjzxUl3nmoyA+DiU/3dHPVllqW89IeQQqk/SYrYBwY4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0068.namprd12.prod.outlook.com (2603:10b6:3:103::30)
 by BYAPR12MB3318.namprd12.prod.outlook.com (2603:10b6:a03:df::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.24; Tue, 12 Nov
 2019 07:53:56 +0000
Received: from CO1NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM5PR12CA0068.outlook.office365.com
 (2603:10b6:3:103::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22 via Frontend
 Transport; Tue, 12 Nov 2019 07:53:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM03FT014.mail.protection.outlook.com (10.152.80.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2430.20 via Frontend Transport; Tue, 12 Nov 2019 07:53:55 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 12 Nov
 2019 01:53:54 -0600
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Tue, 12 Nov 2019 01:53:52 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/edid: Add alternate clock for SMPTE 4K
Date: Tue, 12 Nov 2019 15:53:07 +0800
Message-ID: <20191112075307.12574-2-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112075307.12574-1-Wayne.Lin@amd.com>
References: <20191112075307.12574-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(428003)(189003)(199004)(110136005)(26005)(54906003)(478600001)(356004)(6666004)(86362001)(53416004)(48376002)(36756003)(50466002)(186003)(316002)(2906002)(47776003)(305945005)(70206006)(126002)(70586007)(50226002)(486006)(2616005)(476003)(4744005)(8676002)(446003)(81156014)(336012)(8936002)(81166006)(4326008)(426003)(7696005)(76176011)(11346002)(16586007)(1076003)(51416003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3318; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c80ef3c-9ff2-4d50-6cba-08d76745780a
X-MS-TrafficTypeDiagnostic: BYAPR12MB3318:
X-Microsoft-Antispam-PRVS: <BYAPR12MB331800644952692E4E434962FC770@BYAPR12MB3318.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 021975AE46
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YdSBzdyROXbCobAFzxSI9W6pJDyPfOPW/j2xv/XJo/+8rWiq8x84mD9SFo6juEeKHncGDH9RwbVFyviUqi4etWyyYhDXpnDCey17gC1K8UFtqErrzWyDFsWPmVPQke1A8Tx2Vj+HRkPDSII2MUbwySUBUsycAWz2biRT1vwszAN2r6jOtxnOTElhV5U1FFV4awaOsOnw1ve3rs5wSR0FhXI7j6ZjlYpZehT9+08YveGeFzgIVu8gB9bUNxss3Gq/nwqc8Pl6ZcZswIfRpR+hkyFdRdbyOY84eLBOZVhSZE4cxjowUGG1zSE+3Fzq+azT/0jCf5KhlCYRO9bBG6cS+SIRGZ2rwjplTJtiCtFX96sS9Am/IiNlfo76ABCMTpH19yiWPxJMUyoHVH7sRCP3uOVET7VNI8c23cSPPYDFopZpKf0uJ9ZU4pMTmJlWqzDO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2019 07:53:55.8986 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c80ef3c-9ff2-4d50-6cba-08d76745780a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3318
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u81Sa04Nv3OsU91I799dEuFjky5nz8wfKX/gMLK08sw=;
 b=jlDEkXrbPLh0SZMQVW8loEU47WA+cDJsa/f/1IZ6JCIieeRIrY1wsB+k5qy7dqhhaW1VwNUTtCu+t/OewjqnabAez0kD8Y1alF6zViFZfAGPYa6yT0zsAEsSR4+hfQN6jqt2rG4AYYQoSAk4uixwcftclzDLAchz7vRqYTty3YU=
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
Cc: Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1doeV0KSW4gaGRtaV9tb2RlX2FsdGVybmF0ZV9jbG9jaygpLCBpdCBhZGRzIGFuIGV4Y2VwdGlv
biBmb3IgVklDIDQKbW9kZSAoNDA5NngyMTYwQDI0KSBkdWUgdG8gdGhlcmUgaXMgbm8gYWx0ZXJu
YXRlIGNsb2NrIGRlZmluZWQgZm9yCnRoYXQgbW9kZSBpbiBIRE1JMS40Yi4gQnV0IEhETUkyLjAg
YWRkcyAyMy45OEh6IGZvciB0aGF0IG1vZGUuCgpbSG93XQpSZW1vdmUgdGhlIGV4Y2VwdGlvbgoK
U2lnbmVkLW9mZi1ieTogV2F5bmUgTGluIDxXYXluZS5MaW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2VkaWQuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZWRpZC5jCmluZGV4IGZjZDdhZTI5MDQ5ZC4uZWQyNzgyYzUzYTkzIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2VkaWQuYwpAQCAtMzEyNiw5ICszMTI2LDYgQEAgc3RhdGljIGVudW0gaGRtaV9waWN0dXJlX2Fz
cGVjdCBkcm1fZ2V0X2hkbWlfYXNwZWN0X3JhdGlvKGNvbnN0IHU4IHZpZGVvX2NvZGUpCiBzdGF0
aWMgdW5zaWduZWQgaW50CiBoZG1pX21vZGVfYWx0ZXJuYXRlX2Nsb2NrKGNvbnN0IHN0cnVjdCBk
cm1fZGlzcGxheV9tb2RlICpoZG1pX21vZGUpCiB7Ci0JaWYgKGhkbWlfbW9kZS0+dmRpc3BsYXkg
PT0gNDA5NiAmJiBoZG1pX21vZGUtPmhkaXNwbGF5ID09IDIxNjApCi0JCXJldHVybiBoZG1pX21v
ZGUtPmNsb2NrOwotCiAJcmV0dXJuIGNlYV9tb2RlX2FsdGVybmF0ZV9jbG9jayhoZG1pX21vZGUp
OwogfQogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
