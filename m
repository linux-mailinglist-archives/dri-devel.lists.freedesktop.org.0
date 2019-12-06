Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA38911597C
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 00:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1326E102;
	Fri,  6 Dec 2019 23:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34246E102
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 23:04:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkcuDawwpj164Bx7W32vw8LK+axZUOFUlcqiuGZ8fHGeYiKFa4N7/JTgH+6fnCTmpK2LHO8DGysW25LFessjDIdHYiU8614Z8H3lmBWY299REkhPOIMBPUq0esmE5TtnZAHMNyoQLpcsd/EfGCg6qQjWWGfoJ9lI61PYyYo+pfddhbK0ve82W9PN7Zho5cA+0+cHxqEkSloHnXg5/dgk4/oIaOjo6z7GaQici+tXv31fjxn079jIlQRgI+PzogIE6OAO8hVgi1vGe0nlURAuBjLw3SdS2OxX9AJVFoRa+OXJajG7FPChz8I8IidR5uv5NInhEKalpkHn4btsVDfnFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SISAzG5pWzKNruOhLY5Js+5errYWNNPStldytO77+28=;
 b=bxriqBmesGbWajU17BSuq5JO5kpnlpUBhYY1bjp2La8M4tijwLRD4Ol3ftH48bKhCGHSXveDGN/cFBH+deact/M/HtMklLTEBYqpO7vpXiQfr3O8UlGMX6sB8v/9M2VwTfc2vH1ktCT+Uz49IpNfA2PlG6Tvcg3+ZCLV9xkkm5OJLIw41awS2UeA/+QNuaImSyFrrkCaEp2MF6y/Pjk2lcwM6WYMtxsWSIjpVllipQz73GJ7opt/GUSpE4lY0hoQlAWJDHhcMuEIpKfOpjJgmBo8GzrjU2rYwWjJn1U/rLVsVi58I4g1rT0Y1tIlSVVe8BZXxBzNG5nPKVa5AGd1VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0017.namprd12.prod.outlook.com (2603:10b6:403:2::27)
 by BN7PR12MB2756.namprd12.prod.outlook.com (2603:10b6:408:29::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Fri, 6 Dec
 2019 23:04:44 +0000
Received: from CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::200) by BN4PR12CA0017.outlook.office365.com
 (2603:10b6:403:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2516.13 via Frontend
 Transport; Fri, 6 Dec 2019 23:04:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT021.mail.protection.outlook.com (10.13.175.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Fri, 6 Dec 2019 23:04:44 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 6 Dec 2019
 17:04:43 -0600
Received: from Jiraiya.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 6 Dec 2019 17:04:42 -0600
From: "David (Dingchen) Zhang" <dingchen.zhang@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm: add dp helper to initialize remote aux channel.
Date: Fri, 6 Dec 2019 17:56:37 -0500
Message-ID: <20191206225638.609-1-dingchen.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(428003)(199004)(189003)(50466002)(36756003)(48376002)(1076003)(305945005)(2906002)(356004)(4326008)(70586007)(70206006)(6916009)(8936002)(498600001)(336012)(51416003)(7696005)(81166006)(5660300002)(8676002)(81156014)(966005)(50226002)(426003)(6666004)(186003)(26005)(53416004)(2616005)(86362001)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2756; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e86e2231-3608-492c-173d-08d77aa0aee6
X-MS-TrafficTypeDiagnostic: BN7PR12MB2756:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2756DEF18DA1549D0BD65BBF8D5F0@BN7PR12MB2756.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0243E5FD68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g2jWzO5HWDXiCefLQQ1mG04v7cTv+R9nDnmsuFS/z8iSBJxX0n6H5M3xwkm9z3/tWWKMI5n2SeKvcKNH7jo/lfsRAqT7dDN3dymgAJNm0qbqc47EDfmUQox7LSnMu0XTI02UIXuXDtq1CEqq9xSU8nfz/1DEMvJRzixcB5IzngS9qYuKvG/ZpVrv8QCybCs+I6StkMG3VELDUfKgpPVqnUdI5qiEz3bDAgd/DPbsUMSai03TYV2riApUVjTVU5Z2iZoJ/wG0bT7OISHBWY5fQjBRelNkti8r7k3S9n0hfrxTk2KxkvrHxHUDlzURti6HHxSw5Z92miY1LuAyTmJk1YqgExiqf4zJ2obhMz3iQ14eCGuvEYLfn4qGDW0fg95670K2yhAPxA1idT/ScyaRetJo/bOAEO9c2B3AJUre3hKzwVo7g/eLaTCUEXWRroIOZrTKyJ6lnvjWcfhlSrfB4pbDxtBdKc2SqvLnMpcM9T0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2019 23:04:44.2264 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e86e2231-3608-492c-173d-08d77aa0aee6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2756
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SISAzG5pWzKNruOhLY5Js+5errYWNNPStldytO77+28=;
 b=rIRbYAH9UJNXfc01ABQs+aXmKPNSqC03s210fHkj99LeULWBVX/XANCKh6iRlne/59gOJAiQnxodIP50XONkJ4z+j4yw/p8O5Z+hPyRmf4TLkZLjjh9TsifrFQeC1xKTCCRgoF0fmHHhcd8jJ2Q0Yq1f1ytB4VN/tBAO7MTdFLk=
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
aGVscGVyIGluIERQIE1TVCBwb3J0IGluaXRpYWxpemF0aW9uLgpUaGlzLCBwbHVzIERhdmlkIEZy
YW5jaXMnIHBhdGNoIFsxXSwgZml4IHRoZSBpc3N1ZSBvZiBNU1QgcmVtb3RlCmF1eCBEUENEIENS
Q3MgcmVhZC4KClsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMjE3OTQx
LwoKQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogSGFycnkgV2VudGxhbmQgPEhh
cnJ5LldlbnRsYW5kQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIChEaW5nY2hlbikgWmhh
bmcgPGRpbmdjaGVuLnpoYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9o
ZWxwZXIuYyAgICAgICB8IDEzICsrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMgfCAgMyArKysKIGluY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCAgICAg
ICAgICAgfCAgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9oZWxwZXIuYwppbmRleCAyYzc4NzBhZWY0NjkuLmNjNDg0NWQwZmNiOCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2hlbHBlci5jCkBAIC05NjgsNiArOTY4LDE5IEBAIHN0YXRpYyB2b2lkIGRybV9kcF9h
dXhfY3JjX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogCX0KIH0KIAorLyoqCisgKiBk
cm1fZHBfcmVtb3RlX2F1eF9pbml0KCkgLSBtaW5pbWFsbHkgaW5pdGlhbGlzZSBhIHJlbW90ZSBh
dXggY2hhbm5lbAorICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwKKyAqCisgKiBVc2Vk
IGZvciByZW1vdGUgYXV4IGNoYW5uZWwgaW4gZ2VuZXJhbC4gTWVyZWx5IGluaXRpYWxpemUgdGhl
IGNyYyB3b3JrCisgKiBzdHJ1Y3QuCisgKi8KK3ZvaWQgZHJtX2RwX3JlbW90ZV9hdXhfaW5pdChz
dHJ1Y3QgZHJtX2RwX2F1eCAqYXV4KQoreworCUlOSVRfV09SSygmYXV4LT5jcmNfd29yaywgZHJt
X2RwX2F1eF9jcmNfd29yayk7Cit9CitFWFBPUlRfU1lNQk9MKGRybV9kcF9yZW1vdGVfYXV4X2lu
aXQpOworCiAvKioKICAqIGRybV9kcF9hdXhfaW5pdCgpIC0gbWluaW1hbGx5IGluaXRpYWxpc2Ug
YW4gYXV4IGNoYW5uZWwKICAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwppbmRleCA4N2ZjNDQ4OTVkODMuLmVkYWZhMTgyMjY0
YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCkBAIC0xOTQ1LDYgKzE5NDUs
OSBAQCBkcm1fZHBfbXN0X2hhbmRsZV9saW5rX2FkZHJlc3NfcG9ydChzdHJ1Y3QgZHJtX2RwX21z
dF9icmFuY2ggKm1zdGIsCiAJCXBvcnQtPmF1eC5kZXYgPSBkZXYtPmRldjsKIAkJcG9ydC0+YXV4
LmlzX3JlbW90ZSA9IHRydWU7CiAKKwkJLyogaW5pdGlhbGl6ZSB0aGUgTVNUIGRvd25zdHJlYW0g
cG9ydCdzIEFVWCBjcmMgd29yayBxdWV1ZSAqLworCQlkcm1fZHBfcmVtb3RlX2F1eF9pbml0KCZw
b3J0LT5hdXgpOworCiAJCS8qCiAJCSAqIE1ha2Ugc3VyZSB0aGUgbWVtb3J5IGFsbG9jYXRpb24g
Zm9yIG91ciBwYXJlbnQgYnJhbmNoIHN0YXlzCiAJCSAqIGFyb3VuZCB1bnRpbCBvdXIgb3duIG1l
bW9yeSBhbGxvY2F0aW9uIGlzIHJlbGVhc2VkCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
ZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKaW5kZXggOGY4ZjM2MzJl
Njk3Li5iMmU2OTIzZDU5MjkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIu
aAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKQEAgLTE0NjUsNiArMTQ2NSw3IEBA
IGludCBkcm1fZHBfZG93bnN0cmVhbV9pZChzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCBjaGFyIGlk
WzZdKTsKIHZvaWQgZHJtX2RwX2Rvd25zdHJlYW1fZGVidWcoc3RydWN0IHNlcV9maWxlICptLCBj
b25zdCB1OCBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSwKIAkJCSAgICAgY29uc3QgdTggcG9y
dF9jYXBbNF0sIHN0cnVjdCBkcm1fZHBfYXV4ICphdXgpOwogCit2b2lkIGRybV9kcF9yZW1vdGVf
YXV4X2luaXQoc3RydWN0IGRybV9kcF9hdXggKmF1eCk7CiB2b2lkIGRybV9kcF9hdXhfaW5pdChz
dHJ1Y3QgZHJtX2RwX2F1eCAqYXV4KTsKIGludCBkcm1fZHBfYXV4X3JlZ2lzdGVyKHN0cnVjdCBk
cm1fZHBfYXV4ICphdXgpOwogdm9pZCBkcm1fZHBfYXV4X3VucmVnaXN0ZXIoc3RydWN0IGRybV9k
cF9hdXggKmF1eCk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
