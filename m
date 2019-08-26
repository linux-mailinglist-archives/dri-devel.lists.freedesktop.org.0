Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E139D169
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 16:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A209D89612;
	Mon, 26 Aug 2019 14:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740073.outbound.protection.outlook.com [40.107.74.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56D88957B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 14:09:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOIXGCcpo6d72w0CTb/aAtBQ36/lju5bnI/V8H1JZnQjNv7/dVkxAxjpCPxfYh5Q1SgT8roUO5gP2Cgc26cvfJOix/adgwFLY74PjmA5ZAhOeVOyLjaOTq0wQ3t1PPUx0jD2es7M2pYHu7m/awjUVvci85yWfR9B29xmy6LmLCvuPofKkzxl9aP52SHPCEr4SZ7Zq5ri4tVN9jzOLr0+AFA89jb/T8c+tJZcQCX3SqUoGd0E019p0EcmRZ/hNnxQDf5zYpcc5IHU726ckSXZx6wP7JRWfd0rQjY4m9DX2SFVRWeLT68i252VJgdq9KLg7k4+juRLAhtHQWVul9YFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUBvAxFlcUBiZYgRnSJN4f+nSnhezLKuJg2FyGpNozc=;
 b=X3k14iSxK9mMuJv9xKSruTcyWG1RCG7kn3mdUGRksjZmejOkNYYHTgIdu5Yy5XVz8k00M8ZIZHxgJ4NkaanFzp0kAd1kDb0R8bPB4BB49HHyqaVRG58fYevsCyyv+IJZdBJkUZKkQDRyiTQs4tfZZU7J43cqBFnjAYpPCs96OoKoJQxfCOUSVJZWXilf1VEPkvVMCfT2XMdhRtYJKhN++JAKeQY72FIYDlbpOsj/z0GmPilbiMtTB38tV/XUpg3bQ1EicNt7kW+Nz8u11xDjmy2X0DrT5THwUMtL9SDlBNDJylZo+R+AbvtnfnXJ2FKCgzVAEj2PXYTZo2E/yt8OfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0005.namprd12.prod.outlook.com
 (2603:10b6:301:4a::15) by BN6PR12MB1524.namprd12.prod.outlook.com
 (2603:10b6:405:4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Mon, 26 Aug
 2019 14:09:35 +0000
Received: from BY2NAM03FT064.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by MWHPR1201CA0005.outlook.office365.com
 (2603:10b6:301:4a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Mon, 26 Aug 2019 14:09:35 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT064.mail.protection.outlook.com (10.152.85.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 14:09:35 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 26 Aug 2019 09:09:08 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 5/6] drm/dp_mst: Add new quirk for Synaptics MST hubs
Date: Mon, 26 Aug 2019 10:09:02 -0400
Message-ID: <20190826140903.12580-6-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826140903.12580-1-David.Francis@amd.com>
References: <20190826140903.12580-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(2980300002)(428003)(199004)(189003)(2616005)(26005)(476003)(126002)(336012)(446003)(76176011)(2906002)(50466002)(486006)(49486002)(478600001)(53936002)(48376002)(316002)(1076003)(16586007)(6916009)(11346002)(4326008)(426003)(54906003)(14444005)(305945005)(8936002)(36756003)(6666004)(356004)(50226002)(8676002)(5660300002)(81166006)(81156014)(86362001)(186003)(2351001)(51416003)(47776003)(70586007)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1524; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be514136-f0a2-4b6a-2c64-08d72a2f063d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR12MB1524; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1524:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1524A6AB12A05021C9EFE12EEFA10@BN6PR12MB1524.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ZTsqvZshwwDuT3LHa6gFjZ/hwzqIatJRPrPreNaHG/4tUJKA5QIVOeOexr9sbBtU9WgzhJsZsN89biNoyCqZmnWnVpqsUPnfGbYjAV9NQrdoSJypq+iF3pO5aWWuhV6FKGQQRQT9QyVfA9nw75/2Vp3bBK+ROeW/8bHqE2LOOozRuF9GItEeVzso9KNiWa8kFIfbm4MX+vFUcjUBsLkbnl5u1ZnlxX4AmGwfFBnrpk6fg0OKFh0dBWXRuG5D0sa2hZVbo/GI4hzv6UCkmWxyP00yanTfpqxd0vJst3JFW07a8NpdlgWtg7UXDuW1VZsJjCb5ahuZZNbgSXKxOcebcBsV/dSUQ4S+gdMqOMF4f0Xh3d/U+4YaVf0HYDYVbyYn1AXf7+M6rbH0p9X0Umwv8lESegIBN0/fc5yCIedvStc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 14:09:35.1199 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be514136-f0a2-4b6a-2c64-08d72a2f063d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1524
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUBvAxFlcUBiZYgRnSJN4f+nSnhezLKuJg2FyGpNozc=;
 b=yn5bLYBvhzmCeRqK5NzWae+u7xhUrwlEIw6YWx00lTw6qbexkzIUE/WtB2ZKIjBTngbXdc+J3RMrosl0oCfjVXuNkf4kbrCjXl+yjlYdqS7Lttj/Zk+3TdNbY8hPhXHWpeBDpoEOhK3JOFbZSVYf54hHQOcUYv1syH3qgdSJEEU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=permerror action=none
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

U3luYXB0aWNzIERQMS40IGh1YnMgKEJSQU5DSF9JRCAweDkwQ0MyNCkgZG8gbm90CnN1cHBvcnQg
dmlydHVhbCBEUENEIHJlZ2lzdGVycywgYnV0IGRvIHN1cHBvcnQgRFNDLgpUaGUgRFNDIGNhcHMg
Y2FuIGJlIHJlYWQgZnJvbSB0aGUgcGh5c2ljYWwgYXV4LApsaWtlIGluIFNTVCBEU0MuIFRoZXNl
IGh1YnMgaGF2ZSBtYW55IGRpZmZlcmVudApERVZJQ0VfSURzLiAgQWRkIGEgbmV3IHF1aXJrIHRv
IGRldGVjdCB0aGlzIGNhc2UuCgpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KQ2M6
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6
IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX2hlbHBlci5jIHwgMiArKwogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAg
ICB8IDcgKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9oZWxwZXIuYwppbmRleCAyY2MyMWVmZjRjZjMuLmZjMzkzMjNlN2Q1MiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2hlbHBlci5jCkBAIC0xMjcwLDYgKzEyNzAsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGRwY2RfcXVpcmsgZHBjZF9xdWlya19saXN0W10gPSB7CiAJeyBPVUkoMHgwMCwgMHgxMCwgMHhm
YSksIERFVklDRV9JRF9BTlksIGZhbHNlLCBCSVQoRFBfRFBDRF9RVUlSS19OT19QU1IpIH0sCiAJ
LyogQ0g3NTExIHNlZW1zIHRvIGxlYXZlIFNJTktfQ09VTlQgemVyb2VkICovCiAJeyBPVUkoMHgw
MCwgMHgwMCwgMHgwMCksIERFVklDRV9JRCgnQycsICdIJywgJzcnLCAnNScsICcxJywgJzEnKSwg
ZmFsc2UsIEJJVChEUF9EUENEX1FVSVJLX05PX1NJTktfQ09VTlQpIH0sCisJLyogU3luYXB0aWNz
IERQMS40IE1TVCBodWJzIGNhbiBzdXBwb3J0IERTQyB3aXRob3V0IHZpcnR1YWwgRFBDRCAqLwor
CXsgT1VJKDB4OTAsIDB4Q0MsIDB4MjQpLCBERVZJQ0VfSURfQU5ZLCB0cnVlLCBCSVQoRFBfRFBD
RF9RVUlSS19EU0NfV0lUSE9VVF9WSVJUVUFMX0RQQ0QpIH0sCiB9OwogCiAjdW5kZWYgT1VJCmRp
ZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1f
ZHBfaGVscGVyLmgKaW5kZXggODM2NDUwMmY5MmNmLi5hMTMzMWIwODcwNWYgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVs
cGVyLmgKQEAgLTE0MzQsNiArMTQzNCwxMyBAQCBlbnVtIGRybV9kcF9xdWlyayB7CiAJICogVGhl
IGRyaXZlciBzaG91bGQgaWdub3JlIFNJTktfQ09VTlQgZHVyaW5nIGRldGVjdGlvbi4KIAkgKi8K
IAlEUF9EUENEX1FVSVJLX05PX1NJTktfQ09VTlQsCisJLyoqCisJICogQERQX0RQQ0RfUVVJUktf
RFNDX1dJVEhPVVRfVklSVFVBTF9EUENEOgorCSAqCisJICogVGhlIGRldmljZSBzdXBwb3J0cyBN
U1QgRFNDIGRlc3BpdGUgbm90IHN1cHBvcnRpbmcgVmlydHVhbCBEUENELgorCSAqIFRoZSBEU0Mg
Y2FwcyBjYW4gYmUgcmVhZCBmcm9tIHRoZSBwaHlzaWNhbCBhdXggaW5zdGVhZC4KKwkgKi8KKwlE
UF9EUENEX1FVSVJLX0RTQ19XSVRIT1VUX1ZJUlRVQUxfRFBDRCwKIH07CiAKIC8qKgotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
