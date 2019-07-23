Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B7B722FD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 01:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D0C6E3D0;
	Tue, 23 Jul 2019 23:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790082.outbound.protection.outlook.com [40.107.79.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E036E3CB;
 Tue, 23 Jul 2019 23:29:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V58QpalNS5gIOsSZugdBGXF2URBlUdbOXR7SfJqk+VZsP1deukluvjy/WIGY6AkRXsysdzRO9UGmQ8DjjNtv6lmVKQQw/Hvb4wf5F1QJ5E9xjY0L2olpilLbaOHAuFd9L4CP1NmZ4TM4z/5lqaB48iHEHihkqjJuZFZuHbBDFQJKCX/Y3rypXHauv/IzI5sFmgXoxAYzzWAvVQMUR31ZAuIFzEYHWaz42+LMaqNekJ5iv4G+/we7Q3wzqEQwMAv1uuDXzDFJRyne8vV0waMavrrFDhJ01ZBpFopbHg95wWtgFZ0Z8mCZ9LF5mkfviEXX9Q1shyKsrutKxU9pul1jOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcOTIf1WkUWAphJpw2lNi7ztg9ovrY4DeQuZcH+CWwk=;
 b=N136g4V2+GzEeihmfuj0Rquv98OJX/a2u9WLUBxSg7tePWRCDoh1v4XomYj089rTLzTzlVwTgFmKunyQDceXRJXS3V6gxPvq1JI/RTJ/oWg6AemRjhPXi76WzmBCae5IcBys+Q75KwB7bky7tRxp5IwYyRez1VAcAVsQVnLHUyalT8LGa1AgmyrEhfGgennAwZtY1skKr6zaEySs7GtQ2vBbdiXBMJErX2CtJLcQm6uM3Lve69VLu6/QAglB6kH6O/U0WIfCViCT7pEOh4RvNh0JDzQsrYph2jWxoFevaHsD9fCV3uUwHdfte2Riyjd8gcz8/QnsQ/qfb1tEFZbcAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0019.namprd12.prod.outlook.com
 (2603:10b6:910:16::29) by CY4PR12MB1301.namprd12.prod.outlook.com
 (2603:10b6:903:3e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Tue, 23 Jul
 2019 23:29:04 +0000
Received: from DM3NAM03FT038.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by CY4PR1201CA0019.outlook.office365.com
 (2603:10b6:910:16::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.14 via Frontend
 Transport; Tue, 23 Jul 2019 23:29:04 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT038.mail.protection.outlook.com (10.152.83.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 23:29:03 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 23 Jul 2019 18:29:02 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/9] drm/dp: Use non-cyclic idr
Date: Tue, 23 Jul 2019 19:28:00 -0400
Message-ID: <20190723232808.28128-2-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190723232808.28128-1-sunpeng.li@amd.com>
References: <20190723232808.28128-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(396003)(346002)(2980300002)(428003)(199004)(189003)(4326008)(2870700001)(49486002)(81156014)(14444005)(68736007)(305945005)(54906003)(316002)(86362001)(110136005)(5820100001)(47776003)(5660300002)(53936002)(8676002)(81166006)(126002)(446003)(23676004)(476003)(11346002)(2616005)(1076003)(186003)(426003)(26005)(2906002)(76176011)(336012)(66574012)(2876002)(8936002)(70586007)(36756003)(356004)(50226002)(486006)(70206006)(478600001)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1301; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e437cd97-48bb-4ef9-9a51-08d70fc58cbd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1301; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1301:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1301DF30DC844DCFB3AED10882C70@CY4PR12MB1301.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: meQTDDF7a5Kp0WubQMM+Xz3To5Tk66EVP7z3G91cvG+ryC8zjpjEUkCLKJ2f624Ryn6kTmvd9peErMVG/jXghDoBqY2Q4zNXLGuL0Y9E4q8Eti+MbglhOnKuFnpCsv3Iam5UBL9EWTcHzkchTVc1/MIcEbageIkJV/+v9It92rpAPMm4ezgafe9XsikwYPN1RFgY2cqWSFp46FJGq4NRda0eLnSIeqP5I5P78BWqFCZenBqiKLAKb+dCuf1yLoiKHi0TFS8I4KYFdv00W5NR/u1oLHsrzifqp7jr7nnXlauFdiMFJ1nOHEuyvCN+jJn+3SNwyWXMbzafVHsTD57FnPCoLTUgu2n1Y6juXsawijVD1p6YNgP1dH+lBlLo0eJMO+fx38qqOngZHsiFg8nc1O0ZGmBayBkfx4K6OCRW7G4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 23:29:03.8252 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e437cd97-48bb-4ef9-9a51-08d70fc58cbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1301
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcOTIf1WkUWAphJpw2lNi7ztg9ovrY4DeQuZcH+CWwk=;
 b=l/Ma2iadUHiom6URMMhtPwmGfbRc/PI3hD4VUPF5y6I02+9elmWmmUnBfRMrp8TGHBA8vyPVmuwM9V/64EpdZNkP7qJnVGF/CnmZohklQhIBSayJiiMDsvMvCVrNMDlJzts62AYNrj08fPZVh30NnUfLHm+oh819YTEHGtytJvY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Leo Li <sunpeng.li@amd.com>, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpJbiBwcmVwYXJhdGlvbiBmb3IgYWRk
aW5nIGF1eCBkZXZpY2VzIGZvciBEUCBNU1QsIG1ha2UgdGhlIElEUgpub24tY3ljbGljLiBUaGF0
IHdheSwgaG90cGx1ZyBjeWNsaW5nIE1TVCBkZXZpY2VzIHdvbid0IG5lZWRsZXNzbHkKaW5jcmVt
ZW50IHRoZSBtaW5vciB2ZXJzaW9uIGluZGV4LgoKU2lnbmVkLW9mZi1ieTogTGVvIExpIDxzdW5w
ZW5nLmxpQGFtZC5jb20+ClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29t
PgpSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYyB8IDMgKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9hdXhfZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X2F1eF9kZXYuYwppbmRleCA1YmUyOGUzMjk1ZjMuLjI2ZTM4ZGFjZjY1NCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9hdXhfZGV2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9hdXhfZGV2LmMKQEAgLTgyLDggKzgyLDcgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHBfYXV4
X2RldiAqYWxsb2NfZHJtX2RwX2F1eF9kZXYoc3RydWN0IGRybV9kcF9hdXggKmF1eCkKIAlrcmVm
X2luaXQoJmF1eF9kZXYtPnJlZmNvdW50KTsKIAogCW11dGV4X2xvY2soJmF1eF9pZHJfbXV0ZXgp
OwotCWluZGV4ID0gaWRyX2FsbG9jX2N5Y2xpYygmYXV4X2lkciwgYXV4X2RldiwgMCwgRFJNX0FV
WF9NSU5PUlMsCi0JCQkJIEdGUF9LRVJORUwpOworCWluZGV4ID0gaWRyX2FsbG9jKCZhdXhfaWRy
LCBhdXhfZGV2LCAwLCBEUk1fQVVYX01JTk9SUywgR0ZQX0tFUk5FTCk7CiAJbXV0ZXhfdW5sb2Nr
KCZhdXhfaWRyX211dGV4KTsKIAlpZiAoaW5kZXggPCAwKSB7CiAJCWtmcmVlKGF1eF9kZXYpOwot
LSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
