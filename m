Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA88984F5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3445B6E9C9;
	Wed, 21 Aug 2019 20:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690064.outbound.protection.outlook.com [40.107.69.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685FC6E9DA;
 Wed, 21 Aug 2019 20:01:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWs3GoZHIiyIzYlZfQSbfpqdZ+38T2mVWU0Z7ZOv6qvBBSULcPDmfs+bEZE+E6wwel+hGO9kS8KDnnLE7tXOfDNfCoxrgDLa47AXccD1VGnaxsQAbibde5JAqMiU62i7WmwH819EUdsUZ0bPYHOWs2EZ7kS6luBofMBGJkGtT/9FmteiCHIqOnQYAHILK5dPr+oX9gYyfZf4r8vaI50S1dFYg/FH8HufjVybkLwMOc95lsc/LWKu20of824KrpWwa01mAAimYmBu4LtWNkcqrHUUG8RCb/jnkCPO+WVLtWRmt6GqbhFWevBst5BYumsj47XO0qhS/Wqt/1psIr5euA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0LMXzxScKwjzGq95mjumjrfTaWda23+YxaTvuVePq8=;
 b=hKuxaWTkwhPlhpOKFYwHD35utzsn0cgtN1RfGGPv0uuv+wOsxlo0a2aLX/lbGjpASh9Ya+Hooo78265MHGqLk7QTdPwId54/PzXYchsNCPNbMl93sHdP0ahnIjzLvWKHHrQk7p0CYpz+jUkdZ4sJ59bphKRSBBk5HDs7YMTecbf8P/ADw21zLvdp8sMroXcNoa2jhdwIXAqwuWStk/J/dcBM3217Ew3r7mKylpw3+X1kwGcH+3wz8uUvFuHfTPQOoWtCiwBRREkGF23YW938RDDCNJljYkzmg+YfQSPmQZwn2faMnHNOAIPrhV/WT2DVCDns3D/aPAtEOUJWiQE0DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0008.namprd12.prod.outlook.com (2603:10b6:403:2::18)
 by BN6PR12MB1267.namprd12.prod.outlook.com (2603:10b6:404:17::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Wed, 21 Aug
 2019 20:01:49 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by BN4PR12CA0008.outlook.office365.com
 (2603:10b6:403:2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 21 Aug 2019 20:01:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 20:01:48 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 21 Aug 2019 15:01:37 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 06/16] drm/dp-mst: Add PBN calculation for DSC modes
Date: Wed, 21 Aug 2019 16:01:19 -0400
Message-ID: <20190821200129.11575-7-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821200129.11575-1-David.Francis@amd.com>
References: <20190821200129.11575-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(2980300002)(428003)(189003)(199004)(81156014)(70206006)(50226002)(6666004)(356004)(54906003)(110136005)(476003)(14444005)(478600001)(36756003)(70586007)(5660300002)(486006)(86362001)(126002)(11346002)(446003)(316002)(53936002)(2616005)(16586007)(186003)(8936002)(51416003)(49486002)(50466002)(426003)(8676002)(305945005)(4326008)(2906002)(1076003)(48376002)(26005)(81166006)(76176011)(336012)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1267; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96663df4-e026-4a5a-8878-08d7267266e2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN6PR12MB1267; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1267:
X-Microsoft-Antispam-PRVS: <BN6PR12MB126777C84BDFB649BD27078BEFAA0@BN6PR12MB1267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: GOnCyJ1EpiY9bNWhPu8uHelY+1o5HrqjhNZU8rnTIj+byOJG43cNiMt6kBLDtzNX+a5M5KALh8hIdhXlddsFRY7w5bEGRekojkvdRmFvaEh8oZqYxVDZATJ0KqIg99RVsGlU6qgps9C1uysta+GJ2m+XHwHSqd3GR+fdtdKV742HR6jifaQF0w0iDphc47lG/a59N8hn6QuT02furKjmO0fQxaeYEQqburlMBeO/jpe9FB1+HDuMl4+3kcf5p2+SOfKSlb/6cpZVQntxmhg6APrYjzdk4tNioj90+BzAyfMmRqA6upLVEEdcK/QMXlEmkTH6m/gHD7QX4lQoDfPx5DwhlC9FQD9K0pDrLfdP53rSXe65xamRUl8wGE6tEtt2HCF+EXWJ5gU4YK+Sffv9n0ZlTPuBMRyvrIhIsmg5f1w=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 20:01:48.8372 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96663df4-e026-4a5a-8878-08d7267266e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1267
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0LMXzxScKwjzGq95mjumjrfTaWda23+YxaTvuVePq8=;
 b=BzR1ttzVywSHbwtJ9c27Bs4mfeOLohCtk6g0LgGc2bDk88BazOSYJdaYonhD5Q+mq5yPC4dQrux2LgfsUJ+taqEaFVak90ZgKUyuRQS1cu9LdYk+qgMnk136Wdhr6jO3Db6uyJFbHTye/hFYATJq/tBLeByF4uhfszorsE+1V80=
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
Cc: David Francis <David.Francis@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCBEU0MsIGJwcCBjYW4gYmUgYSBtdWx0aXBsZSBvZiAxLzE2LCBzbwpkcm1fZHBfY2FsY19w
Ym5fbW9kZSBpcyBpbnN1ZmZpY2llbnQuCgpBZGQgZHJtX2RwX2NhbGNfcGJuX21vZGVfZHNjLCBh
IGZ1bmN0aW9uIHdoaWNoIGlzCnRoZSBzYW1lIGFzIGRybV9kcF9jYWxjX3Bibl9tb2RlLCBidXQg
dGhlIGJwcCBpcwppbiB1bml0cyBvZiAxLzE2LgoKQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhh
dC5jb20+CkNjOiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5j
b20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgNDMgKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oICAgICAg
IHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDM5OGU3MzE0ZWE4Yi4u
MzRhNWJkZmM1OThiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3Bv
bG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTM1
ODgsNiArMzU4OCw0OSBAQCBzdGF0aWMgaW50IHRlc3RfY2FsY19wYm5fbW9kZSh2b2lkKQogCXJl
dHVybiAwOwogfQogCisvKioKKyAqIGRybV9kcF9jYWxjX3Bibl9tb2RlX2RzYygpIC0gQ2FsY3Vs
YXRlIHRoZSBQQk4gZm9yIGEgbW9kZSB3aXRoIERTQyBlbmFibGVkLgorICogQGNsb2NrOiBkb3Qg
Y2xvY2sgZm9yIHRoZSBtb2RlCisgKiBAZHNjX2JwcDogZHNjIGJpdHMgcGVyIHBpeGVsIHgxNiAo
ZS5nLiBkc2NfYnBwID0gMTM2IGlzIDguNSBicHApCisgKgorICogVGhpcyB1c2VzIHRoZSBmb3Jt
dWxhIGluIHRoZSBzcGVjIHRvIGNhbGN1bGF0ZSB0aGUgUEJOIHZhbHVlIGZvciBhIG1vZGUsCisg
KiBnaXZlbiB0aGF0IHRoZSBtb2RlIGlzIHVzaW5nIERTQworICogUmV0dXJuczoKKyAqIFBCTiBy
ZXF1aXJlZCBmb3IgdGhpcyBtb2RlCisgKi8KK2ludCBkcm1fZHBfY2FsY19wYm5fbW9kZV9kc2Mo
aW50IGNsb2NrLCBpbnQgZHNjX2JwcCkKK3sKKwl1NjQga2JwczsKKwlzNjQgcGVha19rYnBzOwor
CXUzMiBudW1lcmF0b3I7CisJdTMyIGRlbm9taW5hdG9yOworCisJa2JwcyA9IGNsb2NrICogZHNj
X2JwcDsKKworCS8qCisJICogbWFyZ2luIDUzMDBwcG0gKyAzMDBwcG0gfiAwLjYlIGFzIHBlciBz
cGVjLCBmYWN0b3IgaXMgMS4wMDYKKwkgKiBUaGUgdW5pdCBvZiA1NC82NE1ieXRlcy9zZWMgaXMg
YW4gYXJiaXRyYXJ5IHVuaXQgY2hvc2VuIGJhc2VkIG9uCisJICogY29tbW9uIG11bHRpcGxpZXIg
dG8gcmVuZGVyIGFuIGludGVnZXIgUEJOIGZvciBhbGwgbGluayByYXRlL2xhbmUKKwkgKiBjb3Vu
dHMgY29tYmluYXRpb25zCisJICogY2FsY3VsYXRlCisJICogcGVha19rYnBzICo9ICgxLzE2KSBi
cHB4MTYgdG8gYnBwCisJICogcGVha19rYnBzICo9ICgxMDA2LzEwMDApCisJICogcGVha19rYnBz
ICo9ICg2NC81NCkKKwkgKiBwZWFrX2ticHMgKj0gOCAgICBjb252ZXJ0IHRvIGJ5dGVzCisJICoK
KwkgKiBEaXZpZGUgbnVtZXJhdG9yIGFuZCBkZW5vbWluYXRvciBieSAxNiB0byBhdm9pZCBvdmVy
ZmxvdworCSAqLworCisJbnVtZXJhdG9yID0gNjQgKiAxMDA2IC8gMTY7CisJZGVub21pbmF0b3Ig
PSA1NCAqIDggKiAxMDAwICogMTAwMDsKKworCWticHMgKj0gbnVtZXJhdG9yOworCXBlYWtfa2Jw
cyA9IGRybV9maXhwX2Zyb21fZnJhY3Rpb24oa2JwcywgZGVub21pbmF0b3IpOworCisJcmV0dXJu
IGRybV9maXhwMmludF9jZWlsKHBlYWtfa2Jwcyk7Cit9CitFWFBPUlRfU1lNQk9MKGRybV9kcF9j
YWxjX3Bibl9tb2RlX2RzYyk7CisKIC8qIHdlIHdhbnQgdG8ga2ljayB0aGUgVFggYWZ0ZXIgd2Un
dmUgYWNrIHRoZSB1cC9kb3duIElSUXMuICovCiBzdGF0aWMgdm9pZCBkcm1fZHBfbXN0X2tpY2tf
dHgoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IpCiB7CmRpZmYgLS1naXQgYS9p
bmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9o
ZWxwZXIuaAppbmRleCAyYmE2MjUzZWE2ZDMuLmRkYjUxOGYyMTU3YSAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0
X2hlbHBlci5oCkBAIC02MTEsNyArNjExLDcgQEAgc3RydWN0IGVkaWQgKmRybV9kcF9tc3RfZ2V0
X2VkaWQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvciwgc3RydWN0IGRybV9kcF8KIAog
CiBpbnQgZHJtX2RwX2NhbGNfcGJuX21vZGUoaW50IGNsb2NrLCBpbnQgYnBwKTsKLQoraW50IGRy
bV9kcF9jYWxjX3Bibl9tb2RlX2RzYyhpbnQgY2xvY2ssIGludCBkc2NfYnBwKTsKIAogYm9vbCBk
cm1fZHBfbXN0X2FsbG9jYXRlX3ZjcGkoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICpt
Z3IsCiAJCQkgICAgICBzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0LCBpbnQgcGJuLCBpbnQg
c2xvdHMpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
