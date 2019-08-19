Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B88494916
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 17:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066956E1E5;
	Mon, 19 Aug 2019 15:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790089.outbound.protection.outlook.com [40.107.79.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9FC6E1F9;
 Mon, 19 Aug 2019 15:50:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJcCY9oHwFUAzxF0B3CS1LBopAPQDrPb2bXr2L3OtQYgChBVNqj0CZpYpbPXfWthCzBTzrui2QrDXhDettuhsZQUOaJR052VkpSY7gDIr/QUG1CruKRWfKmvgI6Jlgsyxe5HeWNdcMNKead99cF0vUGv1/yOO9Hbv9h3kug0p+lmVDhH2RqjSg9YlsCn4XkTLOF44m09VJi8u9iIX9T2m3f89cmbXSp8JIVUzklzOjdpgU/fSbCM8hLGdVhv9QowG5FgMU4ftGrLZLFGWT/vqbpEnP2DSk4Tww3mZ8cW6FaQGnn3Gmp8BVI5Hpcr/4VnslXh3S8uennnDcUpAQk3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9SqDzN0KHEnXFJLe24A3qNO7kc6IC+QNsHtsi/GD/k=;
 b=WQwwjVp3oKF+Ogw+Mo/4bfBv4aXUZBQZbDb7ZvKblR4EaZWb8XNKahEQsyOHW1NbJuQ6FpkzYK9eceui9W+wQ/TwNghEcfEe630TIFndQchl0E1ILzFtiCk1STe78NdEvB+wbKoXJYpgwM1BH0resYOiXrUEb1AxfdbMa8yFikRa8PbcDOP1HkdIvOrAz4GP0pNoCXDd8v0vQMJ92mm5a3YaPITNR1aGBtJfxXI4m1WWGI7eEr6TZ15wzndlFJ00ovW+WYZKkn1N42L2h1/C4/QvWgLqgafwhs+2b/s5SYVBYWP+VlMoBy4ydAkUYYXCmgvKeTtW6sLUKRpZMA4EQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0054.namprd12.prod.outlook.com (2603:10b6:0:56::22) by
 CY4PR12MB1528.namprd12.prod.outlook.com (2603:10b6:910:6::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 15:50:52 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM3PR12CA0054.outlook.office365.com
 (2603:10b6:0:56::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 15:50:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 15:50:51 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 19 Aug 2019 10:50:48 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/14] drm/amd/display: Use dc helpers to compute timeslot
 distribution
Date: Mon, 19 Aug 2019 11:50:30 -0400
Message-ID: <20190819155038.1771-7-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819155038.1771-1-David.Francis@amd.com>
References: <20190819155038.1771-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(70206006)(450100002)(50466002)(70586007)(305945005)(476003)(126002)(4326008)(6666004)(51416003)(49486002)(356004)(50226002)(8676002)(81166006)(1076003)(8936002)(2906002)(14444005)(48376002)(81156014)(5660300002)(76176011)(16586007)(53936002)(54906003)(110136005)(2616005)(11346002)(316002)(336012)(26005)(486006)(478600001)(446003)(426003)(47776003)(186003)(86362001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1528; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cef1a5e-017f-4369-62eb-08d724bd0323
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:CY4PR12MB1528; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1528:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1528C61558A96FA6A34416F2EFA80@CY4PR12MB1528.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: PNcFtFkMtW+HtVbf4y8WfAgcxL82r0Ictzng62XugFTl1I2rLGVyJgyhXDDE9BVWZZDW7539skKBsXHTcj0+CCH1Kj2VeUIzNK7VLY/F9Plf49pGRdZG2utt1jC2HnEuQywCb1m8Afx1pLY4KLjsCCwEP9t560HdBoKGLZ77Iwn7BdEf33PyfEw7s1TAJoJD8C3pep01B/TcTVQrazI/yiC7tW/m60WBNHme1UlMf0cRaAAOHngT88T6hIOsMaAcM8BijT8W0EoZV3ksc93AJZqAb4g5C22yLrSqcAuflJeaev0A08oH9bm/maRtrGC4FpIehRx6SZ9/02I6weuT8wi89mZhmmcb0szdseXIemyoWFsgeYZYhcjaurlmQ98vuyi7x9OQJt4k/P/bqLHGOA2zNkjuh1d/NVXoQAjHwpw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 15:50:51.4632 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cef1a5e-017f-4369-62eb-08d724bd0323
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1528
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9SqDzN0KHEnXFJLe24A3qNO7kc6IC+QNsHtsi/GD/k=;
 b=L3iPVJLaCRZ5F1/9vpaNouWjBbcgDiyBdE5kskF4KgENZW1OOP5J799FMcQIOXEkskSaoXClE4/r4/UR9mwHyYqdTKLk1KZcI4geqNlHqMBoMA42F9YiBMNsxnHwNU4wk8hxCxQqy9zCQ6FhLOLM9mfXDp2GRmpAxJk5lxYByYY=
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
Cc: David Francis <David.Francis@amd.com>, Jerry Zuo <Jerry.Zuo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugd2VyZSB1c2luZyBkcm0gaGVscGVycyB0byBjb252ZXJ0IGEgdGltaW5nIGludG8gaXRzCmJh
bmR3aWR0aCwgaXRzIGJhbmR3aWR0aCBpbnRvIHBibiwgYW5kIGl0cyBwYm4gaW50byB0aW1lc2xv
dHMKClRoZXNlIGhlbHBlcnMKLURpZCBub3QgdGFrZSBEU0MgdGltaW5ncyBpbnRvIGFjY291bnQK
LVVzZWQgdGhlIGxpbmsgcmF0ZSBhbmQgbGFuZSBjb3VudCBvZiB0aGUgbGluaydzIGF1eCBkZXZp
Y2UsCiB3aGljaCBhcmUgbm90IHRoZSBzYW1lIGFzIHRoZSBsaW5rJ3MgY3VycmVudCBjYXAKLURp
ZCBub3QgdGFrZSBGRUMgaW50byBhY2NvdW50IChGRUMgcmVkdWNlcyB0aGUgUEJOIHBlciB0aW1l
c2xvdCkKClVzZSB0aGUgREMgaGVscGVycyAoZGNfYmFuZHdpZHRoX2luX2ticHNfZnJvbV90aW1p
bmcsCmRjX2xpbmtfYmFuZHdpZHRoX2ticHMpIGluc3RlYWQKCkNjOiBKZXJyeSBadW8gPEplcnJ5
Llp1b0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lz
QGFtZC5jb20+Ci0tLQogLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVy
cy5jIHwgNDEgKysrKy0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgMzMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCmluZGV4IDVmMmMzMTViMThi
YS4uYjMyYzA3OTAzOTlhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCkBAIC0xODksOCArMTg5LDggQEAg
Ym9vbCBkbV9oZWxwZXJzX2RwX21zdF93cml0ZV9wYXlsb2FkX2FsbG9jYXRpb25fdGFibGUoCiAJ
aW50IHNsb3RzID0gMDsKIAlib29sIHJldDsKIAlpbnQgY2xvY2s7Ci0JaW50IGJwcCA9IDA7CiAJ
aW50IHBibiA9IDA7CisJaW50IHBibl9wZXJfdGltZXNsb3Q7CiAKIAlhY29ubmVjdG9yID0gKHN0
cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICopc3RyZWFtLT5kbV9zdHJlYW1fY29udGV4dDsKIApA
QCAtMjA1LDQwICsyMDUsMTUgQEAgYm9vbCBkbV9oZWxwZXJzX2RwX21zdF93cml0ZV9wYXlsb2Fk
X2FsbG9jYXRpb25fdGFibGUoCiAJbXN0X3BvcnQgPSBhY29ubmVjdG9yLT5wb3J0OwogCiAJaWYg
KGVuYWJsZSkgewotCQljbG9jayA9IHN0cmVhbS0+dGltaW5nLnBpeF9jbGtfMTAwaHogLyAxMDsK
LQotCQlzd2l0Y2ggKHN0cmVhbS0+dGltaW5nLmRpc3BsYXlfY29sb3JfZGVwdGgpIHsKLQotCQlj
YXNlIENPTE9SX0RFUFRIXzY2NjoKLQkJCWJwcCA9IDY7Ci0JCQlicmVhazsKLQkJY2FzZSBDT0xP
Ul9ERVBUSF84ODg6Ci0JCQlicHAgPSA4OwotCQkJYnJlYWs7Ci0JCWNhc2UgQ09MT1JfREVQVEhf
MTAxMDEwOgotCQkJYnBwID0gMTA7Ci0JCQlicmVhazsKLQkJY2FzZSBDT0xPUl9ERVBUSF8xMjEy
MTI6Ci0JCQlicHAgPSAxMjsKLQkJCWJyZWFrOwotCQljYXNlIENPTE9SX0RFUFRIXzE0MTQxNDoK
LQkJCWJwcCA9IDE0OwotCQkJYnJlYWs7Ci0JCWNhc2UgQ09MT1JfREVQVEhfMTYxNjE2OgotCQkJ
YnBwID0gMTY7Ci0JCQlicmVhazsKLQkJZGVmYXVsdDoKLQkJCUFTU0VSVChicHAgIT0gMCk7Ci0J
CQlicmVhazsKLQkJfQotCi0JCWJwcCA9IGJwcCAqIDM7Ci0KLQkJLyogVE9ETyBuZWVkIHRvIGtu
b3cgbGluayByYXRlICovCisJCWNsb2NrID0gZGNfYmFuZHdpZHRoX2luX2ticHNfZnJvbV90aW1p
bmcoJnN0cmVhbS0+dGltaW5nKTsKIAotCQlwYm4gPSBkcm1fZHBfY2FsY19wYm5fbW9kZShjbG9j
aywgYnBwKTsKKwkJLyogZGNfYmFuZHdpZHRoX2luX2ticHNfZnJvbV90aW1pbmcgYWxyZWFkeSB0
YWtlcyBicHAgaW50byBhY2NvdW50ICovCisJCXBibiA9IGRybV9kcF9jYWxjX3Bibl9tb2RlKGNs
b2NrLCAxKTsKIAotCQlzbG90cyA9IGRybV9kcF9maW5kX3ZjcGlfc2xvdHMobXN0X21nciwgcGJu
KTsKKwkJLyogQ29udmVydCBraWxvYml0cyBwZXIgc2Vjb25kIC8gNjQgKGZvciA2NCB0aW1lc2xv
dHMpIHRvIHBibiAoNTQvNjQgbWVnYWJ5dGVzIHBlciBzZWNvbmQpICovCisJCXBibl9wZXJfdGlt
ZXNsb3QgPSBkY19saW5rX2JhbmR3aWR0aF9rYnBzKAorCQkJCXN0cmVhbS0+bGluaywgZGNfbGlu
a19nZXRfbGlua19jYXAoc3RyZWFtLT5saW5rKSkgLyAoOCAqIDEwMDAgKiA1NCk7CisJCXNsb3Rz
ID0gRElWX1JPVU5EX1VQKHBibiwgcGJuX3Blcl90aW1lc2xvdCk7CiAJCXJldCA9IGRybV9kcF9t
c3RfYWxsb2NhdGVfdmNwaShtc3RfbWdyLCBtc3RfcG9ydCwgcGJuLCBzbG90cyk7CiAKIAkJaWYg
KCFyZXQpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
