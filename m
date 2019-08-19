Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8B194929
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 17:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01866E21D;
	Mon, 19 Aug 2019 15:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790041.outbound.protection.outlook.com [40.107.79.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8046E20F;
 Mon, 19 Aug 2019 15:51:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPq792GzmbRntsCzX4lmyyliJPUH/25w5qLZgnfIUaxpzNU1QEBY8M5WN2fJ4YdNsJ4GjyMVpM23PjectgjNHbgAyWllqzUTfNCLUIAARUo0o3MN5a+QQEDUPOxZg7SPQwuCuIAzBGxRBf/X1t4BXOXdKMaNuCZiKt1gRvIUUqIHVdpxnStdimqTRHKipw/bgvpVuMe0grX1zpwAEQeEQpiUD4hLHxGogEnZ/d8a4DKMTL1vYztraDt4zSBwUFRcwjroqbyo2XofF2mhKlY2NLP2V1PyDdEgPJ4DZbfj1G3JJUIxbUXtpqUzbcPYjr14RslWLwfGEjD4jEPSRDadXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6dxMd07Kg9Srz2xZLV7EqQ3IdYaNnuK01iNZQqi0iE=;
 b=GnL5Y9Rvf/emXe8BcbQIYESGm4pd6wkqvsqjaqR8cfNK8sUYaZTH3irKwuMqJ3gHF7KYI7klhaVhIp9wqT0gcrQMwe4oh7ZjIj25/ZoX5QpFVIn96DTdO43D4/Vd4/zOq8cZVRgGEhO3aZg9QaOszPgUSrzbuR9k2vjXHSROsbKGEKcnCiJGmPyRl7iJjIxM8gq8OkgRpHrN//Kd3H+pIepskYEohtNPKCH0JBaU6SRL/FT7ikex6zgm/n6F7HE5wLlDhaXSmmx44xmwEFacaHbk3gbF7uZ6PQBJUrC5eOs6OBfRp4lgGDjBk4NB7FrFxdPFuPK2GvhPjW2Ccm8J4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0046.namprd12.prod.outlook.com (2603:10b6:0:56::14) by
 BYAPR12MB2709.namprd12.prod.outlook.com (2603:10b6:a03:68::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 15:50:59 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by DM3PR12CA0046.outlook.office365.com
 (2603:10b6:0:56::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 15:50:59 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 15:50:59 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 19 Aug 2019 10:50:51 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 14/14] drm/amd/display: Trigger modesets on MST DSC connectors
Date: Mon, 19 Aug 2019 11:50:38 -0400
Message-ID: <20190819155038.1771-15-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819155038.1771-1-David.Francis@amd.com>
References: <20190819155038.1771-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(396003)(346002)(2980300002)(428003)(189003)(199004)(49486002)(1076003)(2906002)(186003)(51416003)(86362001)(446003)(50466002)(11346002)(48376002)(26005)(76176011)(486006)(36756003)(2616005)(476003)(126002)(356004)(6666004)(336012)(14444005)(426003)(5024004)(47776003)(50226002)(53936002)(450100002)(8676002)(110136005)(16586007)(4326008)(54906003)(316002)(70206006)(70586007)(478600001)(8936002)(81156014)(305945005)(5660300002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2709; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40671def-ad9d-434a-1739-08d724bd07b9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2709; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2709:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2709940A474B97107E77B41AEFA80@BYAPR12MB2709.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: sbniMzZwAO2sqAUvSga9sCNfuekQF/NTJrUF7XiVA1AfdIoWLcP2kk/zT0e+3LsbxRUrop4zl/f7PHUCr4UiTJgc0qyIoxA2lZs0Pm7iJSuO8XhDPfInSXkvkOYfgCTvZVqQsOrRTenKi9anJjQPn6AknV5EQf8OFAD2PioXCyJdjk3YPamSDwX67LA9l/e5HGaU4nRninjsDmMXsbYcTGsyTJTeceJVdcP7ks3V0WE0C8Q+FLQUECyiCc7rTIDisqeT1MqEmMPMneUAwCWkTV5nzEL6nEAZ6TVA4ohS0E7Rxwf9NLw1eOFfBvq+yVggu2HtDyNRkX4pcjxKpvB1LQnryrT+9DvCaRTLulzw8PNIeXjnhSG1B9t8wkv1fhXU2fXGkGtU0GgRiQZOCRgJ4Q1nuNdCSQV9C56El71XTCc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 15:50:59.1582 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40671def-ad9d-434a-1739-08d724bd07b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2709
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6dxMd07Kg9Srz2xZLV7EqQ3IdYaNnuK01iNZQqi0iE=;
 b=RKsOH0nBxsr+nialzNXqe/7AqYUSqyKVopuYIYu9bLRlfR8V6XYuil8i4CemhjYM3KiyY7eE0a+LjnqjLcDih66+YBNwdR7LMDsUspJsN3MXll0XGGP0FVFd1nDF5oHyverCXfuJtypf4BlZCvJJeja6Z991Zh5xLEooCF+i128=
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbmV2ZXIgYSBjb25uZWN0b3Igb24gYW4gTVNUIG5ldHdvcmsgaXMgYXR0YWNoZWQsIGRldGFj
aGVkLCBvcgp1bmRlcmdvZXMgYSBtb2Rlc2V0LCB0aGUgRFNDIGNvbmZpZ3MgZm9yIGVhY2ggc3Ry
ZWFtIG9uIHRoYXQKdG9wb2xvZ3kgd2lsbCBiZSByZWNhbGN1bGF0ZWQuIFRoaXMgY2FuIGNoYW5n
ZSB0aGVpciByZXF1aXJlZApiYW5kd2lkdGgsIHJlcXVpcmluZyBhIGZ1bGwgcmVwcm9ncmFtbWlu
ZywgYXMgdGhvdWdoIGEgbW9kZXNldAp3YXMgcGVyZm9ybWVkLCBldmVuIGlmIHRoYXQgc3RyZWFt
IGRpZCBub3QgY2hhbmdlIHRpbWluZy4KClRoZXJlZm9yZSwgd2hlbmV2ZXIgYSBjcnRjIGhhcyBk
cm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldCwKZm9yIGVhY2ggY3J0YyB0aGF0IHNoYXJlcyBh
IE1TVCB0b3BvbG9neSB3aXRoIHRoYXQgc3RyZWFtIGFuZApzdXBwb3J0cyBEU0MsIGFkZCB0aGF0
IGNydGMgKGFuZCBhbGwgYWZmZWN0ZWQgY29ubmVjdG9ycyBhbmQKcGxhbmVzKSB0byB0aGUgYXRv
bWljIHN0YXRlIGFuZCBzZXQgbW9kZV9jaGFuZ2VkIG9uIGl0cyBzdGF0ZQoKQ2M6IExlbyBMaSA8
c3VucGVuZy5saUBhbWQuY29tPgpDYzogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6
bGF1c2thc0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFu
Y2lzQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jIHwgODAgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDgwIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYwppbmRleCAxNDVmZDczMDI1ZGMuLjhkNTM1N2FlYzVlOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC02NDc1
LDcgKzY0NzUsNzggQEAgc3RhdGljIGludCBkb19hcXVpcmVfZ2xvYmFsX2xvY2soc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwKIAogCXJldHVybiByZXQgPCAwID8gcmV0IDogMDsKIH0KKyNpZmRlZiBD
T05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAorc3RhdGljIGludCBhZGRfYWZmZWN0ZWRfbXN0
X2RzY19jcnRjcyhzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsIHN0cnVjdCBkcm1fY3J0
YyAqY3J0YykKK3sKKwlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOworCXN0cnVjdCBk
cm1fY29ubmVjdG9yX3N0YXRlICpjb25uX3N0YXRlOworCXN0cnVjdCBkcm1fY29ubmVjdG9yX2xp
c3RfaXRlciBjb25uX2l0ZXI7CisJc3RydWN0IGRybV9jcnRjX3N0YXRlICpuZXdfY3J0Y19zdGF0
ZTsKKwlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvciA9IE5VTEwsICphY29u
bmVjdG9yX3RvX2FkZDsKKwlpbnQgaSwgaiwgcmV0OworCXN0cnVjdCBkcm1fY3J0YyAqY3J0Y3Nf
YWZmZWN0ZWRbTUFYX1BJUEVTXSA9IHsgMCB9OworCisJZm9yX2VhY2hfbmV3X2Nvbm5lY3Rvcl9p
bl9zdGF0ZShzdGF0ZSwgY29ubmVjdG9yLCBjb25uX3N0YXRlLCBpKSB7CisJCWlmIChjb25uX3N0
YXRlLT5jcnRjICE9IGNydGMpCisJCQljb250aW51ZTsKKworCQlhY29ubmVjdG9yID0gdG9fYW1k
Z3B1X2RtX2Nvbm5lY3Rvcihjb25uZWN0b3IpOworCQlpZiAoIWFjb25uZWN0b3ItPnBvcnQpCisJ
CQlhY29ubmVjdG9yID0gTlVMTDsKKwkJZWxzZQorCQkJYnJlYWs7CisJfQorCisJaWYgKCFhY29u
bmVjdG9yKQorCQlyZXR1cm4gMDsKKworCWkgPSAwOworCWRybV9jb25uZWN0b3JfbGlzdF9pdGVy
X2JlZ2luKHN0YXRlLT5kZXYsICZjb25uX2l0ZXIpOworCWRybV9mb3JfZWFjaF9jb25uZWN0b3Jf
aXRlcihjb25uZWN0b3IsICZjb25uX2l0ZXIpIHsKKwkJaWYgKCFjb25uZWN0b3ItPnN0YXRlIHx8
ICFjb25uZWN0b3ItPnN0YXRlLT5jcnRjKQorCQkJY29udGludWU7CisKKwkJYWNvbm5lY3Rvcl90
b19hZGQgPSB0b19hbWRncHVfZG1fY29ubmVjdG9yKGNvbm5lY3Rvcik7CisJCWlmICghYWNvbm5l
Y3Rvcl90b19hZGQtPnBvcnQpCisJCQljb250aW51ZTsKKworCQlpZiAoYWNvbm5lY3Rvcl90b19h
ZGQtPnBvcnQtPm1nciAhPSBhY29ubmVjdG9yLT5wb3J0LT5tZ3IpCisJCQljb250aW51ZTsKKwor
CQlpZiAoIWFjb25uZWN0b3JfdG9fYWRkLT5kY19zaW5rKQorCQkJY29udGludWU7CisKKwkJaWYg
KCFhY29ubmVjdG9yX3RvX2FkZC0+ZGNfc2luay0+c2lua19kc2NfY2Fwcy5kc2NfZGVjX2NhcHMu
aXNfZHNjX3N1cHBvcnRlZCkKKwkJCWNvbnRpbnVlOwogCisJCWlmIChpID49IE1BWF9QSVBFUykK
KwkJCWNvbnRpbnVlOworCisJCWNydGNzX2FmZmVjdGVkW2ldID0gY29ubmVjdG9yLT5zdGF0ZS0+
Y3J0YzsKKwkJaSsrOworCX0KKwlkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9lbmQoJmNvbm5faXRl
cik7CisKKwlmb3IgKGogPSAwOyBqIDwgaTsgaisrKSB7CisJCW5ld19jcnRjX3N0YXRlID0gZHJt
X2F0b21pY19nZXRfY3J0Y19zdGF0ZShzdGF0ZSwgY3J0Y3NfYWZmZWN0ZWRbal0pOworCQlpZiAo
SVNfRVJSKG5ld19jcnRjX3N0YXRlKSkKKwkJCXJldHVybiBQVFJfRVJSKG5ld19jcnRjX3N0YXRl
KTsKKworCQluZXdfY3J0Y19zdGF0ZS0+bW9kZV9jaGFuZ2VkID0gdHJ1ZTsKKworCQlyZXQgPSBk
cm1fYXRvbWljX2FkZF9hZmZlY3RlZF9jb25uZWN0b3JzKHN0YXRlLCBjcnRjc19hZmZlY3RlZFtq
XSk7CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OworCisJCXJldCA9IGRybV9hdG9taWNfYWRk
X2FmZmVjdGVkX3BsYW5lcyhzdGF0ZSwgY3J0Y3NfYWZmZWN0ZWRbal0pOworCQlpZiAocmV0KQor
CQkJcmV0dXJuIHJldDsKKwl9CisKKwlyZXR1cm4gMDsKKworfQorI2VuZGlmCiBzdGF0aWMgdm9p
ZCBnZXRfZnJlZXN5bmNfY29uZmlnX2Zvcl9jcnRjKAogCXN0cnVjdCBkbV9jcnRjX3N0YXRlICpu
ZXdfY3J0Y19zdGF0ZSwKIAlzdHJ1Y3QgZG1fY29ubmVjdG9yX3N0YXRlICpuZXdfY29uX3N0YXRl
KQpAQCAtNzE3OCw2ICs3MjQ5LDE1IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2F0b21pY19jaGVj
ayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQkJZ290byBmYWlsOwogCX0KIAorI2lmZGVmIENP
TkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCisJZm9yX2VhY2hfb2xkbmV3X2NydGNfaW5fc3Rh
dGUoc3RhdGUsIGNydGMsIG9sZF9jcnRjX3N0YXRlLCBuZXdfY3J0Y19zdGF0ZSwgaSkgeworCQlp
ZiAoZHJtX2F0b21pY19jcnRjX25lZWRzX21vZGVzZXQobmV3X2NydGNfc3RhdGUpKSB7CisJCQly
ZXQgPSBhZGRfYWZmZWN0ZWRfbXN0X2RzY19jcnRjcyhzdGF0ZSwgY3J0Yyk7CisJCQlpZiAocmV0
KQorCQkJCWdvdG8gZmFpbDsKKwkJfQorCX0KKyNlbmRpZgogCS8qCiAJICogQWRkIGFsbCBwcmlt
YXJ5IGFuZCBvdmVybGF5IHBsYW5lcyBvbiB0aGUgQ1JUQyB0byB0aGUgc3RhdGUKIAkgKiB3aGVu
ZXZlciBhIHBsYW5lIGlzIGVuYWJsZWQgdG8gbWFpbnRhaW4gY29ycmVjdCB6LW9yZGVyaW5nCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
