Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA43B6D8A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 22:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0456D72AD9;
	Wed, 18 Sep 2019 20:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700087.outbound.protection.outlook.com [40.107.70.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45AC72AD8;
 Wed, 18 Sep 2019 20:27:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iis4t/lFpW2uNhTrSUrwd+ZSkdW8s71+ovga5IOx6xRz3D0j8UMEFltOfCV+1VxnHmeZrtTmqZmj53qslN1KlUCto4ChkmREPqB+HqKbhzo6MWew5dZKcfGdPr/yuTfdgbF9h0OOAqg4bkZaxT2hVsKU84T6wkkBrcF633P31oT4DEYULfH6GiWS17X9EPvAu1mJY3QgcwH0osx66irZW7y1yEjkwkFizo4Kq1y9K9PueCSbM4+dExF5yf4Hk07gp6nd3aNYnWzZ8dda2xoQ8O3uRbzIPeP7f4BHbFvwwZjotF954wsq3BQK5lUAaHTo4dLznbYCclGS/NvuaKvjcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZdqcAUzw02Sogo2GbGi0PC6rZvF7x16Gg4gmfYW5n8=;
 b=ksjbNfotFPlh1CW4L53pW/ccXVIPHvVSWRla3nl4fJSU/i/JZPM/6lLNoWcfRSWp3V5KSQ1qPIAapud9aqzpEWqLyWakyUhdvrktpfEB9q103wjTjdrvm+tEo67n7XCh7ZT9w4poDozF00uXu99LWk0jP1rL9daszqadgqzVo2NEJKvYGRzWBGDgTok2mV6YpkGALzCuIjsLoR0ffZw5RgpWDZusDf0JQSL6vd/0auaKkKE91FKxFVFOMcK/abQGIoeMJYcQh+g7c2/GI7gix+xkvF52ulchqhXcmdTdVvJGAG+/C+p0d9eLuyIgbIgW0rY9NVwyXtG/xAJOXb0cFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0100.namprd12.prod.outlook.com (2603:10b6:0:55::20) by
 MN2PR12MB3423.namprd12.prod.outlook.com (2603:10b6:208:cb::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 18 Sep 2019 20:27:10 +0000
Received: from DM3NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by DM3PR12CA0100.outlook.office365.com
 (2603:10b6:0:55::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.19 via Frontend
 Transport; Wed, 18 Sep 2019 20:27:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT006.mail.protection.outlook.com (10.152.82.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Wed, 18 Sep 2019 20:27:10 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 18 Sep 2019
 15:27:09 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/15] drm/amdgpu: Add encoder atomic check
Date: Wed, 18 Sep 2019 16:26:38 -0400
Message-ID: <0dba0e8b72c146cc1d27c8895b1c732e719fc371.1568833906.git.mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568833906.git.mikita.lipski@amd.com>
References: <cover.1568833906.git.mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(428003)(189003)(199004)(70586007)(316002)(336012)(16586007)(48376002)(76176011)(14444005)(7696005)(118296001)(50466002)(70206006)(356004)(8936002)(6666004)(6916009)(2906002)(8676002)(81166006)(81156014)(2876002)(47776003)(186003)(36756003)(2351001)(305945005)(53416004)(50226002)(126002)(51416003)(486006)(478600001)(5660300002)(2616005)(426003)(26005)(54906003)(446003)(476003)(11346002)(86362001)(4326008)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3423; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f250942f-281b-474e-59a8-08d73c769532
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MN2PR12MB3423; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3423:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3423A3F3563F65AACD3E306CE48E0@MN2PR12MB3423.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 01644DCF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: JHmjFItlL0Bauv6VUy9huBNIRpfBSj3CQrNO5UaD0xBleRFNLWpEiKAIjA6QW+mHQFT/pkqazkPIn+ZqHO0Ei9bdFvGMwQu0v+RrbrNCNOQfCXi/jfcJ0Se7rfAN+iKgGoYGkLwIHvW647hvF7VEIpS94TkBxdqrWEd1nOsLNiIuBNRds0CftqRh9Ums1dgBh0c4gxHWq3bsn2fAxs6Rk7kVj5WswAW7Qh2w650V4zG0Tl0rkkTZfxzrBU1PlTo0b5yIEHmb7YiONFxecDeXAaTyhEpimzo6M1H2d6VMrLm8fIa/KXJ+xJ/3f6ZoLoXfI3pzDYeAcrav6F/jxy/Mu9ZheS5zZLmt/lx5Khtse8XcQ3cXB0MMRCSSA+oxRGkIF4sXRMi5yW3BE6qhUtdtukCJqep9Aus5nXRYU8Jjb1A=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 20:27:10.2056 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f250942f-281b-474e-59a8-08d73c769532
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3423
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZdqcAUzw02Sogo2GbGi0PC6rZvF7x16Gg4gmfYW5n8=;
 b=DqkEZtETHdo6D1ZhrzlwCUgvjnwfHX75Fuaj39hJHcpz/rmiFiDN/cvQaIJXzWxq4QxmdEcOn4AuOb5n4ItFEHKSuZyUrkA3mBgrSD398jokHR0V+GkOseGRDEjxSoDo8H8ETAyqmwW5RNKw1uwW9tdN9vlDbV3/CN9v2X6VUIA=
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKW3doeV0KSW4gb3Jk
ZXIgdG8gY29tcGx5IHdpdGggbmV3IE1TVCBhdG9taWMgY2hlY2sKd2UgaGF2ZSB0byBmaW5kIGFu
ZCBhZGQgVkNQSSBzbG90cyB0byB0aGUgc3RhdGUKZHVyaW5nIGF0b21pYyBjaGVjayB3aGVuZXZl
ciB0aGVpciBpcyBhIGNoYW5nZSBvbgptb2RlIG9yIGNvbm5lY3Rvci4KW2hvd10KLSBWZXJpZnkg
dGhhdCBpdCBpcyBhIE1TVCBjb25uZWN0aW9uCi0gQ29udmVydCBuZXcgc3RyZWFtJ3MgY2xvY2sg
YW5kIGJwcAotIENhbGN1bGF0ZSBQQk4gYmFzZWQgb24gc3RyZWFtIHBhcmFtZXRlcnMKLSBGaW5k
IGFuZCBhZGQgVkNQSSBzbG90cyB0byB0aGUgc3RhdGUKCkNjOiBMeXVkZSBQYXVsIDxseXVkZUBy
ZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBNaWtpdGEgTGlwc2tpIDxtaWtpdGEubGlwc2tpQGFt
ZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
IHwgNTkgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDU5IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYwppbmRleCA3YjBjYTJlMWVkOGIuLmQ3MDBiOTYyZDMzOCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC00NDMyLDYgKzQ0
MzIsNjUgQEAgc3RhdGljIGludCBkbV9lbmNvZGVyX2hlbHBlcl9hdG9taWNfY2hlY2soc3RydWN0
IGRybV9lbmNvZGVyICplbmNvZGVyLAogCQkJCQkgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0
Y19zdGF0ZSwKIAkJCQkJICBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZSkK
IHsKKwlzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUgPSBjcnRjX3N0YXRlLT5zdGF0ZTsK
KwlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yID0gY29ubl9zdGF0ZS0+Y29ubmVjdG9y
OworCXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yID0gdG9fYW1kZ3B1X2Rt
X2Nvbm5lY3Rvcihjb25uZWN0b3IpOworCXN0cnVjdCBkbV9jcnRjX3N0YXRlICpkbV9uZXdfY3J0
Y19zdGF0ZSA9IHRvX2RtX2NydGNfc3RhdGUoY3J0Y19zdGF0ZSk7CisJY29uc3Qgc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgKmFkanVzdGVkX21vZGUgPSAmY3J0Y19zdGF0ZS0+YWRqdXN0ZWRfbW9k
ZTsKKwlzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1zdF9tZ3I7CisJc3RydWN0IGRy
bV9kcF9tc3RfcG9ydCAqbXN0X3BvcnQ7CisJaW50IHBibiwgc2xvdHMsY2xvY2ssIGJwcCA9IDA7
CisKKwlpZiAoIWRtX25ld19jcnRjX3N0YXRlKQorCQlyZXR1cm4gMDsKKworCWlmICghYWNvbm5l
Y3RvciB8fCAhYWNvbm5lY3Rvci0+cG9ydCkKKwkJcmV0dXJuIDA7CisKKwltc3RfcG9ydCA9IGFj
b25uZWN0b3ItPnBvcnQ7CisJbXN0X21nciA9ICZhY29ubmVjdG9yLT5tc3RfcG9ydC0+bXN0X21n
cjsKKworCWlmICghbXN0X21nci0+bXN0X3N0YXRlKQorCQlyZXR1cm4gMDsKKworCWlmICghY3J0
Y19zdGF0ZS0+Y29ubmVjdG9yc19jaGFuZ2VkICYmICFjcnRjX3N0YXRlLT5tb2RlX2NoYW5nZWQp
CisJCXJldHVybiAwOworCisJc3dpdGNoIChjb252ZXJ0X2NvbG9yX2RlcHRoX2Zyb21fZGlzcGxh
eV9pbmZvKGNvbm5lY3RvciwgY29ubl9zdGF0ZSkpIHsKKwljYXNlIENPTE9SX0RFUFRIXzY2NjoK
KwkJYnBwID0gNjsKKwkJYnJlYWs7CisJY2FzZSBDT0xPUl9ERVBUSF84ODg6CisJCWJwcCA9IDg7
CisJCWJyZWFrOworCWNhc2UgQ09MT1JfREVQVEhfMTAxMDEwOgorCQlicHAgPSAxMDsKKwkJYnJl
YWs7CisJY2FzZSBDT0xPUl9ERVBUSF8xMjEyMTI6CisJCWJwcCA9IDEyOworCQlicmVhazsKKwlj
YXNlIENPTE9SX0RFUFRIXzE0MTQxNDoKKwkJYnBwID0gMTQ7CisJCWJyZWFrOworCWNhc2UgQ09M
T1JfREVQVEhfMTYxNjE2OgorCQlicHAgPSAxNjsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJQVNT
RVJUKGJwcCAhPSAwKTsKKwkJYnJlYWs7CisJfQorCisJYnBwICo9IDM7CisJY2xvY2sgPSBhZGp1
c3RlZF9tb2RlLT5jbG9jazsKKwlwYm4gPSBkcm1fZHBfY2FsY19wYm5fbW9kZShjbG9jaywgYnBw
KTsKKwlzbG90cyA9IGRybV9kcF9hdG9taWNfZmluZF92Y3BpX3Nsb3RzKHN0YXRlLAorCQkJCQkJ
bXN0X21nciwKKwkJCQkJCW1zdF9wb3J0LAorCQkJCQkJcGJuKTsKKwlpZiAoc2xvdHMgPCAwKSB7
CisJCURSTV9ERUJVR19LTVMoImZhaWxlZCBmaW5kaW5nIHZjcGkgc2xvdHM6JWRcbiIsIHNsb3Rz
KTsKKwkJcmV0dXJuIHNsb3RzOworCX0KIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
