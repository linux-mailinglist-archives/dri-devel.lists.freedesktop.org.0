Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A96801940E
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 23:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7867889D02;
	Thu,  9 May 2019 21:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780045.outbound.protection.outlook.com [40.107.78.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB3B89CDE;
 Thu,  9 May 2019 21:04:56 +0000 (UTC)
Received: from MWHPR12CA0042.namprd12.prod.outlook.com (2603:10b6:301:2::28)
 by MWHPR1201MB0061.namprd12.prod.outlook.com (2603:10b6:301:54::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.11; Thu, 9 May
 2019 21:04:53 +0000
Received: from CO1NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by MWHPR12CA0042.outlook.office365.com
 (2603:10b6:301:2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.20 via Frontend
 Transport; Thu, 9 May 2019 21:04:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT005.mail.protection.outlook.com (10.152.80.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Thu, 9 May 2019 21:04:53 +0000
Received: from kho-5039A.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 9 May 2019
 16:04:45 -0500
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <Kenny.Ho@amd.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <sunnanyong@huawei.com>, <alexander.deucher@amd.com>,
 <brian.welty@intel.com>
Subject: [RFC PATCH v2 5/5] drm, cgroup: Add peak GEM buffer allocation limit
Date: Thu, 9 May 2019 17:04:10 -0400
Message-ID: <20190509210410.5471-6-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509210410.5471-1-Kenny.Ho@amd.com>
References: <20181120185814.13362-1-Kenny.Ho@amd.com>
 <20190509210410.5471-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(346002)(396003)(376002)(2980300002)(428003)(199004)(189003)(81156014)(81166006)(8936002)(68736007)(36756003)(72206003)(50466002)(1076003)(50226002)(8676002)(476003)(478600001)(53936002)(53416004)(48376002)(14444005)(5660300002)(2870700001)(446003)(305945005)(2906002)(11346002)(426003)(2616005)(126002)(6666004)(356004)(336012)(47776003)(7696005)(51416003)(486006)(2201001)(76176011)(77096007)(86362001)(26005)(70206006)(316002)(186003)(70586007)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0061; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e055f11-83d4-4e02-854b-08d6d4c1fb93
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:MWHPR1201MB0061; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0061:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0061CDFC7D079C2C432087AB83330@MWHPR1201MB0061.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 003245E729
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Ps+ODp0IwguOyY+6VgoeC6NjqACH/9+Iy5YkyFC3G/Z4ugfx18vukJobaCQuSvrk6poMA9Xgs1lUk3k6Y1m0hdzuZ2KknrYAlrLT0xhUq3+d0//gRSyG/7NE/el0tzFW4D4z+sK4KeYQo0n175Q0C6yAIg5NRoyBvcZFUAlmZ4/bRWGY7sQkiulrQOlwrY4lbhWE57oIoOjWK3011AgpmPkTkF8FPmsJOFY0AnbVqBp4hgga88L84hZ2SaRuNQhSW5o90NPw3lSh17oGeo3+0Hp+Su2FLk4Aoam33blsxzVpuXYZjBN+BJ4HM1IVLiHKKpVH6crSLZCa35uWfBsDRe54TbNNaPC5A9gAp4vPW+mfslruZALM5eUAGk+hjoSfxOhSEgm6vVsaaz9d5WzXA4SDtfDezCU+fbNBrK4bpuA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2019 21:04:53.1137 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e055f11-83d4-4e02-854b-08d6d4c1fb93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0061
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxfB8umjujUKa550IKO39yIy4Zl3LfD2QKKjPG+Msgg=;
 b=HrrTuh25eUqPy979GWkxIFXJfHBliSGPxA5Znv5LY26uJbRRjiJnHwBo8TrRrQJ7dQdJkWyODzSTCh6JZmKkft8d7h4C3gmAYtykObX/labk6S+VzRSWaYzWewNkUz3S1FncpDZc3MLMGhLpzJgmjSXcA9ASA+TPhVY0lpqBFUk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=permerror action=none header.from=amd.com;
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBuZXcgZHJtY2dycCByZXNvdXJjZSBsaW1pdHMgdGhlIGxhcmdlc3QgR0VNIGJ1ZmZlciB0
aGF0IGNhbiBiZQphbGxvY2F0ZWQgaW4gYSBjZ3JvdXAuCgpDaGFuZ2UtSWQ6IEkwODMwZDU2Nzc1
NTY4ZTFjZjIxNWI1NmNjODkyZDVlNzk0NWU5ZjI1ClNpZ25lZC1vZmYtYnk6IEtlbm55IEhvIDxL
ZW5ueS5Ib0BhbWQuY29tPgotLS0KIGluY2x1ZGUvbGludXgvY2dyb3VwX2RybS5oIHwgIDIgKysK
IGtlcm5lbC9jZ3JvdXAvZHJtLmMgICAgICAgIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvY2dyb3VwX2RybS5oIGIvaW5jbHVkZS9saW51eC9jZ3JvdXBf
ZHJtLmgKaW5kZXggZmUxNGJhN2JiMWNmLi41N2MwN2ExNDg5NzUgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvbGludXgvY2dyb3VwX2RybS5oCisrKyBiL2luY2x1ZGUvbGludXgvY2dyb3VwX2RybS5oCkBA
IC0xNiw4ICsxNiwxMCBAQAogc3RydWN0IGRybWNncnBfZGV2aWNlX3Jlc291cmNlIHsKIAkvKiBm
b3IgcGVyIGRldmljZSBzdGF0cyAqLwogCXM2NAkJCWJvX3N0YXRzX3RvdGFsX2FsbG9jYXRlZDsK
KwlzaXplX3QJCQlib19zdGF0c19wZWFrX2FsbG9jYXRlZDsKIAogCXM2NAkJCWJvX2xpbWl0c190
b3RhbF9hbGxvY2F0ZWQ7CisJc2l6ZV90CQkJYm9fbGltaXRzX3BlYWtfYWxsb2NhdGVkOwogfTsK
IAogc3RydWN0IGRybWNncnAgewpkaWZmIC0tZ2l0IGEva2VybmVsL2Nncm91cC9kcm0uYyBiL2tl
cm5lbC9jZ3JvdXAvZHJtLmMKaW5kZXggYmMzYWJmZjA5MTEzLi41YzdlMWI4MDU5Y2UgMTAwNjQ0
Ci0tLSBhL2tlcm5lbC9jZ3JvdXAvZHJtLmMKKysrIGIva2VybmVsL2Nncm91cC9kcm0uYwpAQCAt
MTcsNiArMTcsNyBAQCBzdHJ1Y3QgZHJtY2dycF9kZXZpY2UgewogCXN0cnVjdCBtdXRleAkJbXV0
ZXg7CiAKIAlzNjQJCQlib19saW1pdHNfdG90YWxfYWxsb2NhdGVkX2RlZmF1bHQ7CisJc2l6ZV90
CQkJYm9fbGltaXRzX3BlYWtfYWxsb2NhdGVkX2RlZmF1bHQ7CiB9OwogCiAjZGVmaW5lIERSTUNH
X0NURl9QUklWX1NJWkUgMwpAQCAtMjQsNiArMjUsNyBAQCBzdHJ1Y3QgZHJtY2dycF9kZXZpY2Ug
ewogCiBlbnVtIGRybWNncnBfcmVzX3R5cGUgewogCURSTUNHUlBfVFlQRV9CT19UT1RBTCwKKwlE
Uk1DR1JQX1RZUEVfQk9fUEVBSywKIH07CiAKIGVudW0gZHJtY2dycF9maWxlX3R5cGUgewpAQCAt
NzIsNiArNzQsOSBAQCBzdGF0aWMgaW5saW5lIGludCBpbml0X2RybWNncnBfc2luZ2xlKHN0cnVj
dCBkcm1jZ3JwICpkcm1jZ3JwLCBpbnQgaSkKIAlpZiAoa25vd25fZHJtY2dycF9kZXZzW2ldICE9
IE5VTEwpIHsKIAkJZGRyLT5ib19saW1pdHNfdG90YWxfYWxsb2NhdGVkID0KIAkJICBrbm93bl9k
cm1jZ3JwX2RldnNbaV0tPmJvX2xpbWl0c190b3RhbF9hbGxvY2F0ZWRfZGVmYXVsdDsKKworCQlk
ZHItPmJvX2xpbWl0c19wZWFrX2FsbG9jYXRlZCA9CisJCSAga25vd25fZHJtY2dycF9kZXZzW2ld
LT5ib19saW1pdHNfcGVha19hbGxvY2F0ZWRfZGVmYXVsdDsKIAl9CiAKIAlyZXR1cm4gMDsKQEAg
LTEzMSw2ICsxMzYsOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZHJtY2dycF9wcmludF9zdGF0cyhz
dHJ1Y3QgZHJtY2dycF9kZXZpY2VfcmVzb3VyY2UgKmRkciwKIAljYXNlIERSTUNHUlBfVFlQRV9C
T19UT1RBTDoKIAkJc2VxX3ByaW50ZihzZiwgIiVsbGRcbiIsIGRkci0+Ym9fc3RhdHNfdG90YWxf
YWxsb2NhdGVkKTsKIAkJYnJlYWs7CisJY2FzZSBEUk1DR1JQX1RZUEVfQk9fUEVBSzoKKwkJc2Vx
X3ByaW50ZihzZiwgIiV6dVxuIiwgZGRyLT5ib19zdGF0c19wZWFrX2FsbG9jYXRlZCk7CisJCWJy
ZWFrOwogCWRlZmF1bHQ6CiAJCXNlcV9wdXRzKHNmLCAiXG4iKTsKIAkJYnJlYWs7CkBAIC0xNDks
NiArMTU3LDkgQEAgc3RhdGljIGlubGluZSB2b2lkIGRybWNncnBfcHJpbnRfbGltaXRzKHN0cnVj
dCBkcm1jZ3JwX2RldmljZV9yZXNvdXJjZSAqZGRyLAogCWNhc2UgRFJNQ0dSUF9UWVBFX0JPX1RP
VEFMOgogCQlzZXFfcHJpbnRmKHNmLCAiJWxsZFxuIiwgZGRyLT5ib19saW1pdHNfdG90YWxfYWxs
b2NhdGVkKTsKIAkJYnJlYWs7CisJY2FzZSBEUk1DR1JQX1RZUEVfQk9fUEVBSzoKKwkJc2VxX3By
aW50ZihzZiwgIiV6dVxuIiwgZGRyLT5ib19saW1pdHNfcGVha19hbGxvY2F0ZWQpOworCQlicmVh
azsKIAlkZWZhdWx0OgogCQlzZXFfcHV0cyhzZiwgIlxuIik7CiAJCWJyZWFrOwpAQCAtMTY3LDYg
KzE3OCw5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBkcm1jZ3JwX3ByaW50X2RlZmF1bHQoc3RydWN0
IGRybWNncnBfZGV2aWNlICpkZGV2LAogCWNhc2UgRFJNQ0dSUF9UWVBFX0JPX1RPVEFMOgogCQlz
ZXFfcHJpbnRmKHNmLCAiJWxsZFxuIiwgZGRldi0+Ym9fbGltaXRzX3RvdGFsX2FsbG9jYXRlZF9k
ZWZhdWx0KTsKIAkJYnJlYWs7CisJY2FzZSBEUk1DR1JQX1RZUEVfQk9fUEVBSzoKKwkJc2VxX3By
aW50ZihzZiwgIiV6dVxuIiwgZGRldi0+Ym9fbGltaXRzX3BlYWtfYWxsb2NhdGVkX2RlZmF1bHQp
OworCQlicmVhazsKIAlkZWZhdWx0OgogCQlzZXFfcHV0cyhzZiwgIlxuIik7CiAJCWJyZWFrOwpA
QCAtMTgyLDYgKzE5NiwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZHJtY2dycF9wcmludF9oZWxw
KGludCBjYXJkTnVtLCBzdHJ1Y3Qgc2VxX2ZpbGUgKnNmLAogCQkiVG90YWwgYW1vdW50IG9mIGJ1
ZmZlciBhbGxvY2F0aW9uIGluIGJ5dGVzIGZvciBjYXJkJWRcbiIsCiAJCWNhcmROdW0pOwogCQli
cmVhazsKKwljYXNlIERSTUNHUlBfVFlQRV9CT19QRUFLOgorCQlzZXFfcHJpbnRmKHNmLAorCQki
TGFyZ2VzdCBidWZmZXIgYWxsb2NhdGlvbiBpbiBieXRlcyBmb3IgY2FyZCVkXG4iLAorCQljYXJk
TnVtKTsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJc2VxX3B1dHMoc2YsICJcbiIpOwogCQlicmVh
azsKQEAgLTI1NCw2ICsyNzMsMTAgQEAgc3NpemVfdCBkcm1jZ3JwX2JvX2xpbWl0X3dyaXRlKHN0
cnVjdCBrZXJuZnNfb3Blbl9maWxlICpvZiwgY2hhciAqYnVmLAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpZiAodmFsIDwgMCkgY29udGludWU7CiAJCQkJZGRyLT5ib19saW1pdHNf
dG90YWxfYWxsb2NhdGVkID0gdmFsOwogCQkJCWJyZWFrOworCQkJY2FzZSBEUk1DR1JQX1RZUEVf
Qk9fUEVBSzoKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHZhbCA8IDApIGNv
bnRpbnVlOworCQkJCWRkci0+Ym9fbGltaXRzX3BlYWtfYWxsb2NhdGVkID0gdmFsOworCQkJCWJy
ZWFrOwogCQkJZGVmYXVsdDoKIAkJCQlicmVhazsKIAkJCX0KQEAgLTMwMCw2ICszMjMsMzMgQEAg
c3RydWN0IGNmdHlwZSBmaWxlc1tdID0gewogCQkucHJpdmF0ZSA9IChEUk1DR1JQX1RZUEVfQk9f
VE9UQUwgPDwgRFJNQ0dfQ1RGX1BSSVZfU0laRSkgfAogCQkJRFJNQ0dSUF9GVFlQRV9NQVgsCiAJ
fSwKKwl7CisJCS5uYW1lID0gImJ1ZmZlci5wZWFrLnN0YXRzIiwKKwkJLnNlcV9zaG93ID0gZHJt
Y2dycF9ib19zaG93LAorCQkucHJpdmF0ZSA9IChEUk1DR1JQX1RZUEVfQk9fUEVBSyA8PCBEUk1D
R19DVEZfUFJJVl9TSVpFKSB8CisJCQlEUk1DR1JQX0ZUWVBFX1NUQVRTLAorCX0sCisJeworCQku
bmFtZSA9ICJidWZmZXIucGVhay5kZWZhdWx0IiwKKwkJLnNlcV9zaG93ID0gZHJtY2dycF9ib19z
aG93LAorCQkuZmxhZ3MgPSBDRlRZUEVfT05MWV9PTl9ST09ULAorCQkucHJpdmF0ZSA9IChEUk1D
R1JQX1RZUEVfQk9fUEVBSyA8PCBEUk1DR19DVEZfUFJJVl9TSVpFKSB8CisJCQlEUk1DR1JQX0ZU
WVBFX0RFRkFVTFQsCisJfSwKKwl7CisJCS5uYW1lID0gImJ1ZmZlci5wZWFrLmhlbHAiLAorCQku
c2VxX3Nob3cgPSBkcm1jZ3JwX2JvX3Nob3csCisJCS5mbGFncyA9IENGVFlQRV9PTkxZX09OX1JP
T1QsCisJCS5wcml2YXRlID0gKERSTUNHUlBfVFlQRV9CT19QRUFLIDw8IERSTUNHX0NURl9QUklW
X1NJWkUpIHwKKwkJCURSTUNHUlBfRlRZUEVfSEVMUCwKKwl9LAorCXsKKwkJLm5hbWUgPSAiYnVm
ZmVyLnBlYWsubWF4IiwKKwkJLndyaXRlID0gZHJtY2dycF9ib19saW1pdF93cml0ZSwKKwkJLnNl
cV9zaG93ID0gZHJtY2dycF9ib19zaG93LAorCQkucHJpdmF0ZSA9IChEUk1DR1JQX1RZUEVfQk9f
UEVBSyA8PCBEUk1DR19DVEZfUFJJVl9TSVpFKSB8CisJCQlEUk1DR1JQX0ZUWVBFX01BWCwKKwl9
LAogCXsgfQkvKiB0ZXJtaW5hdGUgKi8KIH07CiAKQEAgLTMyMyw2ICszNzMsNyBAQCBpbnQgZHJt
Y2dycF9yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAogCWRkZXYtPmRl
diA9IGRldjsKIAlkZGV2LT5ib19saW1pdHNfdG90YWxfYWxsb2NhdGVkX2RlZmF1bHQgPSBTNjRf
TUFYOworCWRkZXYtPmJvX2xpbWl0c19wZWFrX2FsbG9jYXRlZF9kZWZhdWx0ID0gU0laRV9NQVg7
CiAKIAltdXRleF9pbml0KCZkZGV2LT5tdXRleCk7CiAKQEAgLTM5Myw2ICs0NDQsMTEgQEAgYm9v
bCBkcm1jZ3JwX2JvX2Nhbl9hbGxvY2F0ZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsCiAJCQlyZXN1bHQgPSBmYWxzZTsKIAkJCWJyZWFrOwogCQl9CisK
KwkJaWYgKGQtPmJvX2xpbWl0c19wZWFrX2FsbG9jYXRlZCA8IHNpemUpIHsKKwkJCXJlc3VsdCA9
IGZhbHNlOworCQkJYnJlYWs7CisJCX0KIAl9CiAJbXV0ZXhfdW5sb2NrKCZrbm93bl9kcm1jZ3Jw
X2RldnNbZGV2SWR4XS0+bXV0ZXgpOwogCkBAIC00MTQsNiArNDcwLDkgQEAgdm9pZCBkcm1jZ3Jw
X2NoZ19ib19hbGxvYyhzdHJ1Y3QgZHJtY2dycCAqZHJtY2dycCwgc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwKIAkJZGRyID0gZHJtY2dycC0+ZGV2X3Jlc291cmNlc1tkZXZJZHhdOwogCiAJCWRkci0+
Ym9fc3RhdHNfdG90YWxfYWxsb2NhdGVkICs9IChzNjQpc2l6ZTsKKworCQlpZiAoZGRyLT5ib19z
dGF0c19wZWFrX2FsbG9jYXRlZCA8IChzaXplX3Qpc2l6ZSkKKwkJCWRkci0+Ym9fc3RhdHNfcGVh
a19hbGxvY2F0ZWQgPSAoc2l6ZV90KXNpemU7CiAJfQogCW11dGV4X3VubG9jaygma25vd25fZHJt
Y2dycF9kZXZzW2RldklkeF0tPm11dGV4KTsKIH0KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
