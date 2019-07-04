Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8845FD3A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 21:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08C46E3B5;
	Thu,  4 Jul 2019 19:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780058.outbound.protection.outlook.com [40.107.78.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D626E3B5;
 Thu,  4 Jul 2019 19:06:24 +0000 (UTC)
Received: from BN8PR12CA0009.namprd12.prod.outlook.com (2603:10b6:408:60::22)
 by DM5PR12MB1852.namprd12.prod.outlook.com (2603:10b6:3:10a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2032.20; Thu, 4 Jul
 2019 19:06:22 +0000
Received: from DM3NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by BN8PR12CA0009.outlook.office365.com
 (2603:10b6:408:60::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2032.17 via Frontend
 Transport; Thu, 4 Jul 2019 19:06:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT017.mail.protection.outlook.com (10.152.82.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 19:06:21 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 4 Jul 2019 14:06:20 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/10] drm/dp: Use non-cyclic idr
Date: Thu, 4 Jul 2019 15:05:10 -0400
Message-ID: <20190704190519.29525-2-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704190519.29525-1-sunpeng.li@amd.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(2980300002)(428003)(199004)(189003)(68736007)(446003)(36756003)(476003)(26005)(6666004)(5660300002)(76176011)(8936002)(77096007)(486006)(478600001)(50466002)(316002)(2616005)(86362001)(23676004)(110136005)(426003)(126002)(49486002)(72206003)(5820100001)(8676002)(356004)(2906002)(186003)(70586007)(336012)(11346002)(14444005)(50226002)(47776003)(1076003)(2876002)(4326008)(54906003)(81156014)(81166006)(2870700001)(70206006)(66574012)(53936002)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1852; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6892a305-7729-4292-1894-08d700b2b3bf
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1852; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1852:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1852CE0BB6C8D5D92415B4AF82FA0@DM5PR12MB1852.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: UmjOEadb8s0L+6OwmO6YXszMwGid9XNxXmKrNl/SOQFC3IR9GkKY50X6CMiim9SbFoBD0XGD4qkk7TraG+AOzfu15Z2c1Z+yjuK0CEjANZPGOmcRmYqDRS9fqB8lHqqJ5OVrVh8T41Ae7RZk9Y1HqZ8G8uMFJxuOFGeflt2mq+FrUx9/0/bWCdCEEobeg1VBNqC/1vuBwNiRELzu7AKj79GIqltNyB6y2XCwflXFOK5PeeaiqgIZgDAy2/3AvCzXgkWBLng3t0YsCJC+877PSCCglXmuax7wTTSrbvit05CQrvMogYnrZo0B8HJvASvHCijdg/1AUC3V/FYQ+cvoRRvK0+oEGRK6Zf+/VeFw6t4DGbNm+a9MtUnCGtViq31oact+IH8KPBg0719ep7Nzpwg8f1Itlq1gSZIovYFpJKc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 19:06:21.3553 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6892a305-7729-4292-1894-08d700b2b3bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1852
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcOTIf1WkUWAphJpw2lNi7ztg9ovrY4DeQuZcH+CWwk=;
 b=lktTXA/ix6eMeEXnMDtNs5pUmXUNr849SG+Shcc+LxjNVm7q57mfEER9G5Wi9kTa3OyQClwOZErT2VhmfWh7WEb5wdFDX6oPshhxEQJ/DSnQlwOlGzE/SwyD5IHF995wBBLoMvzITnphMDQ3QAEvahkheTQgJD9CV+yTDP+KGY8=
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
Cc: Leo Li <sunpeng.li@amd.com>
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
