Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EB4114553
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 18:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19026F8B2;
	Thu,  5 Dec 2019 17:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680047.outbound.protection.outlook.com [40.107.68.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE23C6F8B2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 17:04:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsD87TJFnW/Ig3DjIxo0aUKtymsOPb/w563vWwcywSimMCFP3tKX4UP3CJ/mFl7OMXgubNWXTVmPXbizkEuDr3xalHv1qitIv6MBPm+1SYudMJeWo3TRVOznPxY5mVQKiPAg9LKiuuHajS8WN3MBEb9MqoA2QcYEnladQReJk6AgT3sFGdawaXZMQ7lPoLEy7F+LxN4xI2fikfMB9z+4sj5eXNBCabyIaGGiaIxxQlL4Q2OBmPFJfyxdzqYyWbsP9VHFF4T0vt4Bw9G1RmhqlU2ax8BG2337h/VT/PCMauJfaasX6eBYS6r/7o4rQSV5o8KStpvJHAPMZDod8RedOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weltssFBQbPN60FHq+C12HZrCOO8tu1rUHB6JQbHNZ0=;
 b=alWs2hCN1UwoZ69Kkht4Bmn+t8YddGfY0KIzalMLBg+7VdvVW86CeUxt6Y1imcpJ6dzBZkU0NHfF95muKrg1xKVljaihKDoGFkq3kTW8TqmjVemf7Pxbv1e1BtU0zSvEewHP9zUU4cF2BBY4Ka3/oDnaVwp+9mktD0NRd2xGeg20q5F7MpS+F7MuxYGOpjOfup6Wkpju7V4pSRXK1rWQ3umhtws96UCAcDVgGLK4gJ3PVg68hlyZHXf+IPXZsytNEZd26ijgOOKpXpHyOLLb7FrRrLf23Qduj89OPfzFoCCOiwIfB7CR1rr+j1RBn6yMLvCyp2syezXrGY0wi/XZfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0006.namprd12.prod.outlook.com (2603:10b6:208:a8::19)
 by CH2PR12MB3783.namprd12.prod.outlook.com (2603:10b6:610:2f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Thu, 5 Dec
 2019 17:04:08 +0000
Received: from CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::208) by MN2PR12CA0006.outlook.office365.com
 (2603:10b6:208:a8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2516.14 via Frontend
 Transport; Thu, 5 Dec 2019 17:04:08 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT068.mail.protection.outlook.com (10.13.175.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Thu, 5 Dec 2019 17:04:07 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 5 Dec 2019
 11:04:06 -0600
Received: from Jiraiya.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 5 Dec 2019 11:04:05 -0600
From: "David (Dingchen) Zhang" <dingchen.zhang@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm: add dp helper to initialize remote aux channel.
Date: Thu, 5 Dec 2019 11:55:04 -0500
Message-ID: <20191205165504.3682-1-dingchen.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(428003)(199004)(189003)(356004)(1076003)(50466002)(4326008)(316002)(53416004)(48376002)(478600001)(16586007)(36756003)(26005)(5660300002)(186003)(7696005)(50226002)(2616005)(426003)(305945005)(6916009)(70586007)(81156014)(70206006)(54906003)(8936002)(81166006)(8676002)(2906002)(86362001)(336012)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3783; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c551c48-2fd4-4da9-fcac-08d779a523bf
X-MS-TrafficTypeDiagnostic: CH2PR12MB3783:
X-Microsoft-Antispam-PRVS: <CH2PR12MB378303B8BE7D28DFBADFF8E28D5C0@CH2PR12MB3783.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 02426D11FE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F7k3Vv/F+8k8BgOixVHuoPjMOeqj9zALFus4u9ltdRebCJVN2549xwj7fJHnbvOu38cCW5mqj3Whx5F8FkoNNKRi1bAvPCF0rX2v1uTOfYfJImAmWA/shwfGK/Vs2Z57NwalHYtl3JyrS7z/m27a3ZAZPabLAhbhMWK35Rde0mOi/wlrm3uhwXCuwp8iKAltFQsARMU0+NG/GJCvhzqM72gLfkhCb2rxKgRbMpGhhfbynmCNcJGb3zXqPyxYWeIwBcxEhTkqxfgdSONvH3IqplsLEBNuiydtV1ZpHT3VygIjyijyat+f8/cH74R7eYGROqEIOehH1ryi2i4zUpmKJGa3tvJOUKGOfGvq+g5VDffhJhoaI0TpfV6UQ8xmyxPr8qaHwooRHMD0nhAhnuzqlOgKOLjFlb3efo+k2vEg830kDiSJoFanujDNVn86mrCw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2019 17:04:07.0922 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c551c48-2fd4-4da9-fcac-08d779a523bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3783
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weltssFBQbPN60FHq+C12HZrCOO8tu1rUHB6JQbHNZ0=;
 b=P7CZ/apF5+aoTRP6VS18IPlPy1rJm4or3PtTjNlJTlSHC4wB2cAn/GIxZK2j5CO6veAzxFMPstEHzxfk3j8ezBjid8G0X3QLeMEOfTOu+x+1dBsoVImrSRBP2L/XOydHu5na6Ra7UYEjlRMWMUC8C/MESgObQYEIXyshvfM+4qQ=
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
Cc: Leo Li <sunpeng.li@amd.com>,
 "David \(Dingchen\) Zhang" <dingchen.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W3doeV0KV2UgbmVlZCB0byBtaW5pbWFsbHkgaW5pdGlhbGl6ZSB0aGUgcmVtb3RlIGF1eCBjaGFu
bmVsLCBlLmcuIHRoZQpjcmMgd29yayBzdHJ1Y3Qgb2YgcmVtb3RlIGF1eCB0byBkdW1wIHRoZSBz
aW5rJ3MgRFBSWCBDUkNzIGluIE1TVApzZXR1cC4KCltob3ddCkFkZCBoZWxwZXIgdGhhdCBvbmx5
IGluaXRpYWxpemVzIHRoZSBjcmMgd29yayBzdHJ1Y3Qgb2YgdGhlIHJlbW90ZQphdXgsIGhvb2tl
IGNyYyB3b3JrIHF1ZXVlIHRvICdkcm1fZHBfYXV4X2NyY193b3JrJy4gVGhlbiBjYWxsIHRoaXMK
aGVscGVyIGluIERQIE1TVCBwb3J0IGluaXRpYWxpemF0aW9uLgoKCkNjOiBMZW8gTGkgPHN1bnBl
bmcubGlAYW1kLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxIYXJyeS5XZW50bGFuZEBhbWQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCAoRGluZ2NoZW4pIFpoYW5nIDxkaW5nY2hlbi56aGFuZ0Bh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgICAgICAgfCAxMyAr
KysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgIDMg
KysrCiBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggICAgICAgICAgIHwgIDEgKwogMyBmaWxl
cyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKaW5kZXgg
ZmMzOTMyM2U3ZDUyLi4zNzMxMjU5M2RkMGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwpAQCAt
MTA5MSw2ICsxMDkxLDE5IEBAIHN0YXRpYyB2b2lkIGRybV9kcF9hdXhfY3JjX3dvcmsoc3RydWN0
IHdvcmtfc3RydWN0ICp3b3JrKQogCX0KIH0KIAorLyoqCisgKiBkcm1fZHBfcmVtb3RlX2F1eF9p
bml0KCkgLSBtaW5pbWFsbHkgaW5pdGlhbGlzZSBhIHJlbW90ZSBhdXggY2hhbm5lbAorICogQGF1
eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwKKyAqCisgKiBVc2VkIGZvciByZW1vdGUgYXV4IGNo
YW5uZWwgaW4gZ2VuZXJhbC4gTWVyZWx5IGluaXRpYWxpemUgdGhlIGNyYyB3b3JrCisgKiBzdHJ1
Y3QuCisgKi8KK3ZvaWQgZHJtX2RwX3JlbW90ZV9hdXhfaW5pdChzdHJ1Y3QgZHJtX2RwX2F1eCAq
YXV4KQoreworCUlOSVRfV09SSygmYXV4LT5jcmNfd29yaywgZHJtX2RwX2F1eF9jcmNfd29yayk7
Cit9CitFWFBPUlRfU1lNQk9MKGRybV9kcF9yZW1vdGVfYXV4X2luaXQpOworCiAvKioKICAqIGRy
bV9kcF9hdXhfaW5pdCgpIC0gbWluaW1hbGx5IGluaXRpYWxpc2UgYW4gYXV4IGNoYW5uZWwKICAq
IEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYwppbmRleCBkNWRmMDIzMTVlMTQuLjQzMDgzMTZmZTIxMSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCkBAIC0xNjQyLDYgKzE2NDIsOSBAQCBzdGF0aWMgdm9pZCBk
cm1fZHBfYWRkX3BvcnQoc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiLAogCQlwb3J0LT5h
dXguZGV2ID0gZGV2LT5kZXY7CiAJCXBvcnQtPmF1eC5pc19yZW1vdGUgPSB0cnVlOwogCisJCS8q
IGluaXRpYWxpemUgdGhlIE1TVCBkb3duc3RyZWFtIHBvcnQncyBBVVggY3JjIHdvcmsgcXVldWUg
Ki8KKwkJZHJtX2RwX3JlbW90ZV9hdXhfaW5pdCgmcG9ydC0+YXV4KTsKKwogCQkvKgogCQkgKiBN
YWtlIHN1cmUgdGhlIG1lbW9yeSBhbGxvY2F0aW9uIGZvciBvdXIgcGFyZW50IGJyYW5jaCBzdGF5
cwogCQkgKiBhcm91bmQgdW50aWwgb3VyIG93biBtZW1vcnkgYWxsb2NhdGlvbiBpcyByZWxlYXNl
ZApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0v
ZHJtX2RwX2hlbHBlci5oCmluZGV4IDYxZWYzNTFjNWZjYS4uZGEwYTY5ZjEwZTM4IDEwMDY0NAot
LS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Rw
X2hlbHBlci5oCkBAIC0xNDAzLDYgKzE0MDMsNyBAQCBpbnQgZHJtX2RwX2Rvd25zdHJlYW1faWQo
c3RydWN0IGRybV9kcF9hdXggKmF1eCwgY2hhciBpZFs2XSk7CiB2b2lkIGRybV9kcF9kb3duc3Ry
ZWFtX2RlYnVnKHN0cnVjdCBzZXFfZmlsZSAqbSwgY29uc3QgdTggZHBjZFtEUF9SRUNFSVZFUl9D
QVBfU0laRV0sCiAJCQkgICAgIGNvbnN0IHU4IHBvcnRfY2FwWzRdLCBzdHJ1Y3QgZHJtX2RwX2F1
eCAqYXV4KTsKIAordm9pZCBkcm1fZHBfcmVtb3RlX2F1eF9pbml0KHN0cnVjdCBkcm1fZHBfYXV4
ICphdXgpOwogdm9pZCBkcm1fZHBfYXV4X2luaXQoc3RydWN0IGRybV9kcF9hdXggKmF1eCk7CiBp
bnQgZHJtX2RwX2F1eF9yZWdpc3RlcihzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4KTsKIHZvaWQgZHJt
X2RwX2F1eF91bnJlZ2lzdGVyKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgpOwotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
