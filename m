Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A7A9959E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 15:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32C36EB3F;
	Thu, 22 Aug 2019 13:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750089.outbound.protection.outlook.com [40.107.75.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD4E6EB40
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 13:57:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGnjEugw9Xcu2sPz7/b3ZT5Bcx+jrgeeRDg8pZ8DFUuIEbTDWnCfQee2snlGFMHw5rBXMdpkERN+pZS48+KxdrcA3L6HUziGlp8D3QypzXtaOZ1mBZB2wijof67eIs3Xc6bMtqxFOIM5O3HYogWkoJhJh1S5hPIm1JprFULP2H6ZZ1e187jaWRIpdkm8SQcsLab/8RPUZDFkSN/KDtKVY3JrKpQ3Rvkkr037VKEcvde6BZ8nxWRz2K94xeWM1hQHLbKEgTsatRNnu2GYeIuwLOdbi/J7jvkX2mbYGI9sLhBN46RUm2KT/+gjsF81Vj8BU7kraLLcYPJu68CF3MwG/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WD6PuSzOr8D1s3jt+KG3wrkteGxV5smKpWuuOkVbS7E=;
 b=S89zjrUkOrD7X1kFN2S2mePf46jTT0NJmn5846eBSIpHVYfCfz8SB+4GNAsO9To72GUoV82HQ/84jf3NXUn4qONhHgvsuE0Xhx77XaM9I5S1igWvBRpm39m5yUOsc6+AA5fuyL3EZgZL++MrBB3VLS2JFNhxWlhKHgv6JSX49OLYZYJlyesI4wkA82CfBmSly5Xjbr+bX+QFbUeDlcK5A9vGKdqpXwN+isiItKgAGOI2wTOtzPcFUONK9eGuaU4YvEHvOwbi+M2OPyOaP+feofCwjYSVmCSudnfVhtzqyTZUcZoJpaqrBTKDHpUVtCtdkIsf2AMUDGvRZPSP2bp5yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0085.namprd12.prod.outlook.com (2603:10b6:0:57::29) by
 CY4PR12MB1269.namprd12.prod.outlook.com (2603:10b6:903:40::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 13:57:47 +0000
Received: from CO1NAM03FT023.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by DM3PR12CA0085.outlook.office365.com
 (2603:10b6:0:57::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.15 via Frontend
 Transport; Thu, 22 Aug 2019 13:57:47 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT023.mail.protection.outlook.com (10.152.80.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Thu, 22 Aug 2019 13:57:46 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 22 Aug 2019 08:57:44 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 1/5] drm/dp-mst: Add PBN calculation for DSC modes
Date: Thu, 22 Aug 2019 09:57:37 -0400
Message-ID: <20190822135741.12923-2-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822135741.12923-1-David.Francis@amd.com>
References: <20190822135741.12923-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(2980300002)(428003)(189003)(199004)(47776003)(2906002)(6666004)(6916009)(5660300002)(1076003)(186003)(53936002)(356004)(426003)(81156014)(81166006)(4326008)(16586007)(316002)(305945005)(36756003)(26005)(76176011)(126002)(478600001)(2351001)(2616005)(14444005)(476003)(336012)(48376002)(70206006)(50466002)(86362001)(11346002)(50226002)(70586007)(446003)(8936002)(51416003)(486006)(49486002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1269; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ca30a03-619c-4046-0e67-08d72708b630
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:CY4PR12MB1269; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1269:
X-Microsoft-Antispam-PRVS: <CY4PR12MB126902F6331F72FA47A3F733EFA50@CY4PR12MB1269.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 01371B902F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Mo+1/ItXL+A2kEAZpnLcSMHY85QQpFM28w1jLjT6YeIFaVRqrs52xbf899yVFCTGf9JbnLlDV/HdWEXlDxk1yaNOVWp4yJon++NjH/2DzhMpXG9OkR8JhbJ0MUJY8kvK1TcgN5S+M1lMuRsLHOfpRo8C7k6bwQaTO1tbP+Aa+krS7zPqva8XqjjsuSo46Z8+D0guxpfUgbN2AxVcqX+oiAGE4mt+GoN6h/GyKEkg/J342FpJ4F/LvmwaIQfdgqLFFqXv7btkXuLjhRMcT3D/GBGzJGRT8m1Hgp5VK/deihXWnGlD/xbr4xABcNBwtpXFxnQh9AEY3bVBclsdIFOYXJXrgPfNm74N5MQog3vEa1NNjFC30Vu8Q5x5ghEqFnASomgxDdGxxQKxBdPI/uob+Z7wfrrwRRSeJfc4Pd6UD3c=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2019 13:57:46.4057 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca30a03-619c-4046-0e67-08d72708b630
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1269
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WD6PuSzOr8D1s3jt+KG3wrkteGxV5smKpWuuOkVbS7E=;
 b=r+ifApXrnthDt5JEdbs/rr49rhDMRw0ljiY6iEloUMEAc+IAlhgd8ktIFJeZ1YLBazWH4Jykp2sGdw49sTuz6NolQRDW7DGY2Y/QhKnonLmnB4YzP6CglZxTm+4aF0sXqOEX3cEVed0mHngNp00SJDW54dzx9RMAz+JGqkd1/1A=
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

V2l0aCBEU0MsIGJwcCBjYW4gYmUgYSBtdWx0aXBsZSBvZiAxLzE2LCBzbwpkcm1fZHBfY2FsY19w
Ym5fbW9kZSBpcyBpbnN1ZmZpY2llbnQuCgpBZGQgZHJtX2RwX2NhbGNfcGJuX21vZGVfZHNjLCBh
IGZ1bmN0aW9uIHdoaWNoIGlzCnRoZSBzYW1lIGFzIGRybV9kcF9jYWxjX3Bibl9tb2RlLCBidXQg
dGhlIGJwcCBpcwppbiB1bml0cyBvZiAxLzE2LgoKUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5
dWRlQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5j
aXNAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwg
NDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hl
bHBlci5oICAgICAgIHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3Rv
cG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDgy
YWRkNzM2ZTE3ZC4uOGUyZTczMWMzNWM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMKQEAgLTM1OTEsNiArMzU5MSw0OSBAQCBzdGF0aWMgaW50IHRlc3RfY2FsY19wYm5fbW9k
ZSh2b2lkKQogCXJldHVybiAwOwogfQogCisvKioKKyAqIGRybV9kcF9jYWxjX3Bibl9tb2RlX2Rz
YygpIC0gQ2FsY3VsYXRlIHRoZSBQQk4gZm9yIGEgbW9kZSB3aXRoIERTQyBlbmFibGVkLgorICog
QGNsb2NrOiBkb3QgY2xvY2sgZm9yIHRoZSBtb2RlCisgKiBAZHNjX2JwcDogZHNjIGJpdHMgcGVy
IHBpeGVsIHgxNiAoZS5nLiBkc2NfYnBwID0gMTM2IGlzIDguNSBicHApCisgKgorICogVGhpcyB1
c2VzIHRoZSBmb3JtdWxhIGluIHRoZSBzcGVjIHRvIGNhbGN1bGF0ZSB0aGUgUEJOIHZhbHVlIGZv
ciBhIG1vZGUsCisgKiBnaXZlbiB0aGF0IHRoZSBtb2RlIGlzIHVzaW5nIERTQworICogUmV0dXJu
czoKKyAqIFBCTiByZXF1aXJlZCBmb3IgdGhpcyBtb2RlCisgKi8KK2ludCBkcm1fZHBfY2FsY19w
Ym5fbW9kZV9kc2MoaW50IGNsb2NrLCBpbnQgZHNjX2JwcCkKK3sKKwl1NjQga2JwczsKKwlzNjQg
cGVha19rYnBzOworCXUzMiBudW1lcmF0b3I7CisJdTMyIGRlbm9taW5hdG9yOworCisJa2JwcyA9
IGNsb2NrICogZHNjX2JwcDsKKworCS8qCisJICogbWFyZ2luIDUzMDBwcG0gKyAzMDBwcG0gfiAw
LjYlIGFzIHBlciBzcGVjLCBmYWN0b3IgaXMgMS4wMDYKKwkgKiBUaGUgdW5pdCBvZiA1NC82NE1i
eXRlcy9zZWMgaXMgYW4gYXJiaXRyYXJ5IHVuaXQgY2hvc2VuIGJhc2VkIG9uCisJICogY29tbW9u
IG11bHRpcGxpZXIgdG8gcmVuZGVyIGFuIGludGVnZXIgUEJOIGZvciBhbGwgbGluayByYXRlL2xh
bmUKKwkgKiBjb3VudHMgY29tYmluYXRpb25zCisJICogY2FsY3VsYXRlCisJICogcGVha19rYnBz
ICo9ICgxLzE2KSBicHB4MTYgdG8gYnBwCisJICogcGVha19rYnBzICo9ICgxMDA2LzEwMDApCisJ
ICogcGVha19rYnBzICo9ICg2NC81NCkKKwkgKiBwZWFrX2ticHMgKj0gOCAgICBjb252ZXJ0IHRv
IGJ5dGVzCisJICoKKwkgKiBEaXZpZGUgbnVtZXJhdG9yIGFuZCBkZW5vbWluYXRvciBieSAxNiB0
byBhdm9pZCBvdmVyZmxvdworCSAqLworCisJbnVtZXJhdG9yID0gNjQgKiAxMDA2IC8gMTY7CisJ
ZGVub21pbmF0b3IgPSA1NCAqIDggKiAxMDAwICogMTAwMDsKKworCWticHMgKj0gbnVtZXJhdG9y
OworCXBlYWtfa2JwcyA9IGRybV9maXhwX2Zyb21fZnJhY3Rpb24oa2JwcywgZGVub21pbmF0b3Ip
OworCisJcmV0dXJuIGRybV9maXhwMmludF9jZWlsKHBlYWtfa2Jwcyk7Cit9CitFWFBPUlRfU1lN
Qk9MKGRybV9kcF9jYWxjX3Bibl9tb2RlX2RzYyk7CisKIC8qIHdlIHdhbnQgdG8ga2ljayB0aGUg
VFggYWZ0ZXIgd2UndmUgYWNrIHRoZSB1cC9kb3duIElSUXMuICovCiBzdGF0aWMgdm9pZCBkcm1f
ZHBfbXN0X2tpY2tfdHgoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IpCiB7CmRp
ZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oIGIvaW5jbHVkZS9kcm0v
ZHJtX2RwX21zdF9oZWxwZXIuaAppbmRleCAyYmE2MjUzZWE2ZDMuLmRkYjUxOGYyMTU3YSAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2Ry
bS9kcm1fZHBfbXN0X2hlbHBlci5oCkBAIC02MTEsNyArNjExLDcgQEAgc3RydWN0IGVkaWQgKmRy
bV9kcF9tc3RfZ2V0X2VkaWQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvciwgc3RydWN0
IGRybV9kcF8KIAogCiBpbnQgZHJtX2RwX2NhbGNfcGJuX21vZGUoaW50IGNsb2NrLCBpbnQgYnBw
KTsKLQoraW50IGRybV9kcF9jYWxjX3Bibl9tb2RlX2RzYyhpbnQgY2xvY2ssIGludCBkc2NfYnBw
KTsKIAogYm9vbCBkcm1fZHBfbXN0X2FsbG9jYXRlX3ZjcGkoc3RydWN0IGRybV9kcF9tc3RfdG9w
b2xvZ3lfbWdyICptZ3IsCiAJCQkgICAgICBzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0LCBp
bnQgcGJuLCBpbnQgc2xvdHMpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
