Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB0B71A27
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 16:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B196E2CE;
	Tue, 23 Jul 2019 14:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710068.outbound.protection.outlook.com [40.107.71.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FB56E2CD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 14:21:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q16WbEqO6TsOPBjYJRwuUXXJuF7DftmlLaJ0MMmjv/WtLa+mqKxLGC6TypPVSXm1P3IQYFKclrDnPE6XP7Mf8YQxShmuS50i2JbCP1SujkjzAxry3P+/xOpICNu9NuhiH2+TBylvAQfFvUOlCLY6pmS6wFhXhiHhHxFcyYQ/34I8GmSKfJMgoZp1Ygybt6d+FHfmKDyUpzaMEH0uYCWDUJp/VusR9+B3nVFpoSD9wYvuXLnf9mQJl0LcdOjnQOqBLnsxrYta2oWcUgBQgRxwvDdYiAg/WSEjx3HW2cwE9eePmv/moulJ6qxjrcxNZ5N/0Is2AtIc0ZGIqDnZzXowQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyuZghyspznZMgndpg5zE/QPFH76jvYL//D2oihAbJg=;
 b=hZyfMb2egIT8BDDVGn0qk7HnlfN8Dc8tOCcfYfT84V38X5sZG5yPcYjKReJbMOn//K4oJjFxE1EYqorZKlGxTxlIog5eHoM/A4YypfunaSifhJVEKHsmU/rWPbPglXmEJ27uGRYni4I96ZRoksWXpYsEOwk9KyfEvF1udE25HFwDnTdOYIebcyfTVN8oTvMeg3kLwjaSTsXlSkakVN5WdolgwKZg74KRvNh6Z2QZE3kuaZV1I+t5pE38HN+dfo0X0kIJjw5otZzFXE5oSlyUw78ksi+aUBU3fs7lQo0nccoc45ZJdTvpmp43j10OA6p3NcDoroFFoQOwsD16DMfmdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN8PR12CA0012.namprd12.prod.outlook.com (2603:10b6:408:60::25)
 by MWHPR12MB1310.namprd12.prod.outlook.com (2603:10b6:300:a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.17; Tue, 23 Jul
 2019 14:21:34 +0000
Received: from BY2NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by BN8PR12CA0012.outlook.office365.com
 (2603:10b6:408:60::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.16 via Frontend
 Transport; Tue, 23 Jul 2019 14:21:33 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT003.mail.protection.outlook.com (10.152.84.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 14:21:33 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 23 Jul 2019
 09:21:21 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/syncobj: extend syncobj query ability v2
Date: Tue, 23 Jul 2019 22:21:14 +0800
Message-ID: <20190723142114.24688-1-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(376002)(136003)(2980300002)(428003)(199004)(189003)(305945005)(50466002)(36756003)(426003)(54906003)(8936002)(126002)(47776003)(81156014)(81166006)(86362001)(336012)(476003)(50226002)(2616005)(478600001)(68736007)(26005)(8676002)(316002)(53416004)(5820100001)(186003)(2906002)(6666004)(356004)(5660300002)(1076003)(70206006)(4326008)(6916009)(70586007)(2870700001)(7696005)(486006)(53936002)(2351001)(23676004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1310; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5dc614a-3b72-487a-fc28-08d70f79103d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1310; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1310:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1310A655600F778BB7F57BFDB4C70@MWHPR12MB1310.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: MTSqgwdQMOje6xHwmnDSNUHMZrp2FRY91r8uydBVvZzClxy8Oxjm2Tk+DU4WhvcLFOmkYyAEq8WlDL17kq9dxtMexlW2lF+Pj6Oao7qdvNz8SELxfAlqGTTXAWKVtfZxCWpgPrkgWi9viMJo872ysP53X0Emt/o5ntMr+YJ3XAgboRsR+tV96b+Q+xjL8iu0TYkQ8Tlye1vdpLiZDVTOTbnwa2/Qwgsaf/h8872U7Nb7ccffDvL1w3iBAS1zgK5AqmHfpEREg6UHjClAEfaW2wd41zZ0r2dRobaOSTx4SeJhcCmkSmszSyiSH9/kxVnLyDRul2iayzNZ+LJptLNy+VK5hEw00lSajljCaRZ1QSV6WOopipHYLWh8jMJAjXQx5Y9UD1pvFzA+cOdtyLM7noZCtWYtQ/ylotU9Hy162C4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 14:21:33.2740 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5dc614a-3b72-487a-fc28-08d70f79103d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1310
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyuZghyspznZMgndpg5zE/QPFH76jvYL//D2oihAbJg=;
 b=WQjAe3uDHOKBtrSiWRX7LsWsOlZ9h3Ot/gaEGua/N2RTJPAmbC48MJfXhIkX+895fkZYdOxvu8JKxVMgeBJDJ3+jlKNGBi96sE9t/7cX/u6br0i01406FwqzuYuuoO8XIoOsArTYORqxDcdfgoBhqGt0XTfyFaXzGNc8luqYR2k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dXNlciBzcGFjZSBuZWVkcyBhIGZsZXhpYWJsZSBxdWVyeSBhYmlsaXR5LgpTbyB0aGF0IHVtZCBj
YW4gZ2V0IGxhc3Qgc2lnbmFsZWQgb3Igc3VibWl0dGVkIHBvaW50Lgp2MjoKYWRkIHNhbml0aXpl
ciBjaGVja2luZy4KCkNoYW5nZS1JZDogSTY1MTJiNDMwNTI0ZWJhYmU3MTVlNjAyYTJiZjVhYmIw
YTdlNzgwZWEKU2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNv
bT4KQ2M6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4K
Q2M6IENocmlzdGlhbiBLw7ZuaWcgPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyB8IDM0ICsrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0KIGluY2x1ZGUvdWFwaS9kcm0vZHJtLmggICAgICAgIHwgIDMgKystCiAyIGZpbGVz
IGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5j
b2JqLmMKaW5kZXggM2Q0MDA5MDUxMDBiLi4zZmM4ZjY2YWRhNjggMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fc3luY29iai5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29i
ai5jCkBAIC0xMTk3LDcgKzExOTcsNyBAQCBkcm1fc3luY29ial90aW1lbGluZV9zaWduYWxfaW9j
dGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAlpZiAoIWRybV9jb3JlX2No
ZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfU1lOQ09CSl9USU1FTElORSkpCiAJCXJldHVybiAtRU9Q
Tk9UU1VQUDsKIAotCWlmIChhcmdzLT5wYWQgIT0gMCkKKwlpZiAoYXJncy0+ZmxhZ3MgIT0gMCkK
IAkJcmV0dXJuIC1FSU5WQUw7CiAKIAlpZiAoYXJncy0+Y291bnRfaGFuZGxlcyA9PSAwKQpAQCAt
MTI2OCw3ICsxMjY4LDcgQEAgaW50IGRybV9zeW5jb2JqX3F1ZXJ5X2lvY3RsKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJaWYgKCFkcm1fY29yZV9jaGVja19mZWF0dXJlKGRl
diwgRFJJVkVSX1NZTkNPQkpfVElNRUxJTkUpKQogCQlyZXR1cm4gLUVPUE5PVFNVUFA7CiAKLQlp
ZiAoYXJncy0+cGFkICE9IDApCisJaWYgKGFyZ3MtPmZsYWdzICYgfkRSTV9TWU5DT0JKX1FVRVJZ
X0ZMQUdTX0xBU1RfU1VCTUlUVEVEKQogCQlyZXR1cm4gLUVJTlZBTDsKIAogCWlmIChhcmdzLT5j
b3VudF9oYW5kbGVzID09IDApCkBAIC0xMjkxLDIzICsxMjkxLDI5IEBAIGludCBkcm1fc3luY29i
al9xdWVyeV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCQlpZiAo
Y2hhaW4pIHsKIAkJCXN0cnVjdCBkbWFfZmVuY2UgKml0ZXIsICpsYXN0X3NpZ25hbGVkID0gTlVM
TDsKIAotCQkJZG1hX2ZlbmNlX2NoYWluX2Zvcl9lYWNoKGl0ZXIsIGZlbmNlKSB7Ci0JCQkJaWYg
KCFpdGVyKQotCQkJCQlicmVhazsKLQkJCQlkbWFfZmVuY2VfcHV0KGxhc3Rfc2lnbmFsZWQpOwot
CQkJCWxhc3Rfc2lnbmFsZWQgPSBkbWFfZmVuY2VfZ2V0KGl0ZXIpOwotCQkJCWlmICghdG9fZG1h
X2ZlbmNlX2NoYWluKGxhc3Rfc2lnbmFsZWQpLT5wcmV2X3NlcW5vKQotCQkJCQkvKiBJdCBpcyBt
b3N0IGxpa2VseSB0aGF0IHRpbWVsaW5lIGhhcwotCQkJCQkgKiB1bm9yZGVyIHBvaW50cy4gKi8K
LQkJCQkJYnJlYWs7CisJCQlpZiAoYXJncy0+ZmxhZ3MgJgorCQkJICAgIERSTV9TWU5DT0JKX1FV
RVJZX0ZMQUdTX0xBU1RfU1VCTUlUVEVEKSB7CisJCQkJcG9pbnQgPSBmZW5jZS0+c2Vxbm87CisJ
CQl9IGVsc2UgeworCQkJCWRtYV9mZW5jZV9jaGFpbl9mb3JfZWFjaChpdGVyLCBmZW5jZSkgewor
CQkJCQlpZiAoIWl0ZXIpCisJCQkJCQlicmVhazsKKwkJCQkJZG1hX2ZlbmNlX3B1dChsYXN0X3Np
Z25hbGVkKTsKKwkJCQkJbGFzdF9zaWduYWxlZCA9IGRtYV9mZW5jZV9nZXQoaXRlcik7CisJCQkJ
CWlmICghdG9fZG1hX2ZlbmNlX2NoYWluKGxhc3Rfc2lnbmFsZWQpLT5wcmV2X3NlcW5vKQorCQkJ
CQkJLyogSXQgaXMgbW9zdCBsaWtlbHkgdGhhdCB0aW1lbGluZSBoYXMKKwkJCQkJCSogdW5vcmRl
ciBwb2ludHMuICovCisJCQkJCQlicmVhazsKKwkJCQl9CisJCQkJcG9pbnQgPSBkbWFfZmVuY2Vf
aXNfc2lnbmFsZWQobGFzdF9zaWduYWxlZCkgPworCQkJCQlsYXN0X3NpZ25hbGVkLT5zZXFubyA6
CisJCQkJCXRvX2RtYV9mZW5jZV9jaGFpbihsYXN0X3NpZ25hbGVkKS0+cHJldl9zZXFubzsKIAkJ
CX0KLQkJCXBvaW50ID0gZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKGxhc3Rfc2lnbmFsZWQpID8KLQkJ
CQlsYXN0X3NpZ25hbGVkLT5zZXFubyA6Ci0JCQkJdG9fZG1hX2ZlbmNlX2NoYWluKGxhc3Rfc2ln
bmFsZWQpLT5wcmV2X3NlcW5vOwogCQkJZG1hX2ZlbmNlX3B1dChsYXN0X3NpZ25hbGVkKTsKIAkJ
fSBlbHNlIHsKIAkJCXBvaW50ID0gMDsKIAkJfQorCQlkbWFfZmVuY2VfcHV0KGZlbmNlKTsKIAkJ
cmV0ID0gY29weV90b191c2VyKCZwb2ludHNbaV0sICZwb2ludCwgc2l6ZW9mKHVpbnQ2NF90KSk7
CiAJCXJldCA9IHJldCA/IC1FRkFVTFQgOiAwOwogCQlpZiAocmV0KQpkaWZmIC0tZ2l0IGEvaW5j
bHVkZS91YXBpL2RybS9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmgKaW5kZXggNjYxZDcz
ZjlhOTE5Li5mZDk4N2NlMjRkOWYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmgK
KysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm0uaApAQCAtNzc3LDExICs3NzcsMTIgQEAgc3RydWN0
IGRybV9zeW5jb2JqX2FycmF5IHsKIAlfX3UzMiBwYWQ7CiB9OwogCisjZGVmaW5lIERSTV9TWU5D
T0JKX1FVRVJZX0ZMQUdTX0xBU1RfU1VCTUlUVEVEICgxIDw8IDApIC8qIGxhc3QgYXZhaWxhYmxl
IHBvaW50IG9uIHRpbWVsaW5lIHN5bmNvYmogKi8KIHN0cnVjdCBkcm1fc3luY29ial90aW1lbGlu
ZV9hcnJheSB7CiAJX191NjQgaGFuZGxlczsKIAlfX3U2NCBwb2ludHM7CiAJX191MzIgY291bnRf
aGFuZGxlczsKLQlfX3UzMiBwYWQ7CisJX191MzIgZmxhZ3M7CiB9OwogCiAKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
