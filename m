Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 954E319409
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 23:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE2289CCE;
	Thu,  9 May 2019 21:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810085.outbound.protection.outlook.com [40.107.81.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2187A89BF8;
 Thu,  9 May 2019 21:04:49 +0000 (UTC)
Received: from MWHPR12CA0032.namprd12.prod.outlook.com (2603:10b6:301:2::18)
 by BN7PR12MB2658.namprd12.prod.outlook.com (2603:10b6:408:29::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.12; Thu, 9 May
 2019 21:04:46 +0000
Received: from CO1NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by MWHPR12CA0032.outlook.office365.com
 (2603:10b6:301:2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Thu, 9 May 2019 21:04:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT005.mail.protection.outlook.com (10.152.80.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Thu, 9 May 2019 21:04:46 +0000
Received: from kho-5039A.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 9 May 2019
 16:04:43 -0500
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <Kenny.Ho@amd.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <sunnanyong@huawei.com>, <alexander.deucher@amd.com>,
 <brian.welty@intel.com>
Subject: [RFC PATCH v2 2/5] cgroup: Add mechanism to register DRM devices
Date: Thu, 9 May 2019 17:04:07 -0400
Message-ID: <20190509210410.5471-3-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509210410.5471-1-Kenny.Ho@amd.com>
References: <20181120185814.13362-1-Kenny.Ho@amd.com>
 <20190509210410.5471-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(376002)(136003)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(72206003)(47776003)(305945005)(48376002)(50466002)(478600001)(5660300002)(11346002)(316002)(70586007)(70206006)(50226002)(51416003)(7696005)(76176011)(2870700001)(110136005)(2906002)(53936002)(6666004)(356004)(1076003)(14444005)(446003)(36756003)(186003)(77096007)(476003)(2616005)(2201001)(336012)(426003)(86362001)(53416004)(486006)(8936002)(81166006)(81156014)(8676002)(126002)(26005)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2658; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31415bab-964f-444d-e0da-08d6d4c1f766
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN7PR12MB2658; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2658:
X-Microsoft-Antispam-PRVS: <BN7PR12MB26588BC89ECAD8FF7929722083330@BN7PR12MB2658.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-Forefront-PRVS: 003245E729
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: g2PtkT3bEYSwvzNjkNT2oNOitOeg67m36U7LBlLd3Oo0Uv5gmzv+L47TWBVCe+4n77/YYQ/BzdVW4fgcidp+WglDlv8d7mQ3QXNi6rmMlLvKUTDp6Cht5+TDpCSKMMI6iW3VIYDLITGC8/N0GPEvrbfuBj1q9aeIKSCeYvpQBbS5YlYXEphbLzsaWc91yPibNoPaEtXvCHKYtmFSdb9gU2shBgSGZY6Cb9rxmbLuAvdzOAznaU+nbBSK/2XGvOpwtwKYfKLdSVNr4pfswQxh8P8XzKZLgfplacHLqobmg96K38EUmY/eEOkEODDpVXJDYKY29/6vWpoBeLJedDhQthmQcHE6UUAkTZFVLVhVt+c4pL34AuxMBWH2hU2zOYJrUqhv3dDVkTLEoK7jYomM/NUbXLpfDFgHHmsxpOgMWCU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2019 21:04:46.0952 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31415bab-964f-444d-e0da-08d6d4c1f766
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2658
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQLJJ8Yh38Q57nt87ttc/UN4TMRcEVVhzIf4fqMum0I=;
 b=HP7Cc6OIKyuVxgHGDZp6Jj4eWORS/dMXpecLkpRWjUBrAIva+/w7why5AJkg36/opzT5OCyMZNwd50sn6Usu/IoZGNupl3BjtFrdKzD2RSxwU1bNoYggPc2WZQdEOOlGPZoorEOsEGcVews9a855OSMelUHwiabDVko519oT2/A=
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

Q2hhbmdlLUlkOiBJOTA4ZWU2OTc1ZWEwNTg1ZTRjMzBlYWZkZTQ1OTlmODcwOTRkOGM2NQpTaWdu
ZWQtb2ZmLWJ5OiBLZW5ueSBIbyA8S2VubnkuSG9AYW1kLmNvbT4KLS0tCiBpbmNsdWRlL2RybS9k
cm1fY2dyb3VwLmggICB8ICAyNCArKysrKysrKwogaW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmgg
fCAgMTAgKysrKwoga2VybmVsL2Nncm91cC9kcm0uYyAgICAgICAgfCAxMTggKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLQogMyBmaWxlcyBjaGFuZ2VkLCAxNTEgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHJtL2RybV9j
Z3JvdXAuaAoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jZ3JvdXAuaCBiL2luY2x1ZGUv
ZHJtL2RybV9jZ3JvdXAuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAu
LmRkYjllYWI2NDM2MAotLS0gL2Rldi9udWxsCisrKyBiL2luY2x1ZGUvZHJtL2RybV9jZ3JvdXAu
aApAQCAtMCwwICsxLDI0IEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUCisgKiBD
b3B5cmlnaHQgMjAxOSBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuCisgKi8KKyNpZm5kZWYg
X19EUk1fQ0dST1VQX0hfXworI2RlZmluZSBfX0RSTV9DR1JPVVBfSF9fCisKKyNpZmRlZiBDT05G
SUdfQ0dST1VQX0RSTQorCitpbnQgZHJtY2dycF9yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IGRybV9k
ZXZpY2UgKmRldmljZSk7CisKK2ludCBkcm1jZ3JwX3VucmVnaXN0ZXJfZGV2aWNlKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXZpY2UpOworCisjZWxzZQorc3RhdGljIGlubGluZSBpbnQgZHJtY2dycF9y
ZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldmljZSkKK3sKKwlyZXR1cm4gMDsK
K30KKworc3RhdGljIGlubGluZSBpbnQgZHJtY2dycF91bnJlZ2lzdGVyX2RldmljZShzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2aWNlKQoreworCXJldHVybiAwOworfQorI2VuZGlmIC8qIENPTkZJR19D
R1JPVVBfRFJNICovCisjZW5kaWYgLyogX19EUk1fQ0dST1VQX0hfXyAqLwpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmggYi9pbmNsdWRlL2xpbnV4L2Nncm91cF9kcm0uaApp
bmRleCAxMjEwMDFiZTEyMzAuLmQ3Y2NmNDM0Y2E2YiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51
eC9jZ3JvdXBfZHJtLmgKKysrIGIvaW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmgKQEAgLTYsMTAg
KzYsMjAgQEAKIAogI2lmZGVmIENPTkZJR19DR1JPVVBfRFJNCiAKKyNpbmNsdWRlIDxsaW51eC9t
dXRleC5oPgogI2luY2x1ZGUgPGxpbnV4L2Nncm91cC5oPgorI2luY2x1ZGUgPGRybS9kcm1fZmls
ZS5oPgorCisvKiBsaW1pdCBkZWZpbmVkIHBlciB0aGUgd2F5IGRybV9taW5vcl9hbGxvYyBvcGVy
YXRlcyAqLworI2RlZmluZSBNQVhfRFJNX0RFViAoNjQgKiBEUk1fTUlOT1JfUkVOREVSKQorCitz
dHJ1Y3QgZHJtY2dycF9kZXZpY2VfcmVzb3VyY2UgeworCS8qIGZvciBwZXIgZGV2aWNlIHN0YXRz
ICovCit9OwogCiBzdHJ1Y3QgZHJtY2dycCB7CiAJc3RydWN0IGNncm91cF9zdWJzeXNfc3RhdGUJ
Y3NzOworCXN0cnVjdCBkcm1jZ3JwX2RldmljZV9yZXNvdXJjZQkqZGV2X3Jlc291cmNlc1tNQVhf
RFJNX0RFVl07CiB9OwogCiBzdGF0aWMgaW5saW5lIHN0cnVjdCBkcm1jZ3JwICpjc3NfZHJtY2dy
cChzdHJ1Y3QgY2dyb3VwX3N1YnN5c19zdGF0ZSAqY3NzKQpkaWZmIC0tZ2l0IGEva2VybmVsL2Nn
cm91cC9kcm0uYyBiL2tlcm5lbC9jZ3JvdXAvZHJtLmMKaW5kZXggNjIwYzg4N2Q2ZDI0Li5mOWVm
NGJmMDQyZDggMTAwNjQ0Ci0tLSBhL2tlcm5lbC9jZ3JvdXAvZHJtLmMKKysrIGIva2VybmVsL2Nn
cm91cC9kcm0uYwpAQCAtMSwxNiArMSw3OSBAQAogLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IE1JVAogLy8gQ29weXJpZ2h0IDIwMTkgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgorI2lu
Y2x1ZGUgPGxpbnV4L2V4cG9ydC5oPgogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KICNpbmNsdWRl
IDxsaW51eC9jZ3JvdXAuaD4KKyNpbmNsdWRlIDxsaW51eC9mcy5oPgorI2luY2x1ZGUgPGxpbnV4
L3NlcV9maWxlLmg+CisjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4KICNpbmNsdWRlIDxsaW51eC9j
Z3JvdXBfZHJtLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9kZXZpY2UuaD4KKyNpbmNsdWRlIDxkcm0v
ZHJtX2Nncm91cC5oPgorCitzdGF0aWMgREVGSU5FX01VVEVYKGRybWNncnBfbXV0ZXgpOworCitz
dHJ1Y3QgZHJtY2dycF9kZXZpY2UgeworCXN0cnVjdCBkcm1fZGV2aWNlCSpkZXY7CisJc3RydWN0
IG11dGV4CQltdXRleDsKK307CisKKy8qIGluZGV4ZWQgYnkgZHJtX21pbm9yIGZvciBhY2Nlc3Mg
c3BlZWQgKi8KK3N0YXRpYyBzdHJ1Y3QgZHJtY2dycF9kZXZpY2UJKmtub3duX2RybWNncnBfZGV2
c1tNQVhfRFJNX0RFVl07CisKK3N0YXRpYyBpbnQgbWF4X21pbm9yOworCiAKIHN0YXRpYyBzdHJ1
Y3QgZHJtY2dycCAqcm9vdF9kcm1jZ3JwIF9fcmVhZF9tb3N0bHk7CiAKIHN0YXRpYyB2b2lkIGRy
bWNncnBfY3NzX2ZyZWUoc3RydWN0IGNncm91cF9zdWJzeXNfc3RhdGUgKmNzcykKIHsKIAlzdHJ1
Y3QgZHJtY2dycCAqZHJtY2dycCA9IGNzc19kcm1jZ3JwKGNzcyk7CisJaW50IGk7CisKKwlmb3Ig
KGkgPSAwOyBpIDw9IG1heF9taW5vcjsgaSsrKSB7CisJCWlmIChkcm1jZ3JwLT5kZXZfcmVzb3Vy
Y2VzW2ldICE9IE5VTEwpCisJCQlrZnJlZShkcm1jZ3JwLT5kZXZfcmVzb3VyY2VzW2ldKTsKKwl9
CisKKwlrZnJlZShkcm1jZ3JwKTsKK30KKworc3RhdGljIGlubGluZSBpbnQgaW5pdF9kcm1jZ3Jw
X3NpbmdsZShzdHJ1Y3QgZHJtY2dycCAqZHJtY2dycCwgaW50IGkpCit7CisJc3RydWN0IGRybWNn
cnBfZGV2aWNlX3Jlc291cmNlICpkZHIgPSBkcm1jZ3JwLT5kZXZfcmVzb3VyY2VzW2ldOworCisJ
aWYgKGRkciA9PSBOVUxMKSB7CisJCWRkciA9IGt6YWxsb2Moc2l6ZW9mKHN0cnVjdCBkcm1jZ3Jw
X2RldmljZV9yZXNvdXJjZSksCisJCQlHRlBfS0VSTkVMKTsKKworCQlpZiAoIWRkcikKKwkJCXJl
dHVybiAtRU5PTUVNOworCisJCWRybWNncnAtPmRldl9yZXNvdXJjZXNbaV0gPSBkZHI7CisJfQor
CisJLyogc2V0IGRlZmF1bHRzIGhlcmUgKi8KKworCXJldHVybiAwOworfQorCitzdGF0aWMgaW5s
aW5lIGludCBpbml0X2RybWNncnAoc3RydWN0IGRybWNncnAgKmRybWNncnAsIHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYpCit7CisJaW50IHJjID0gMDsKKwlpbnQgaTsKKworCWlmIChkZXYgIT0gTlVM
TCkgeworCQlyYyA9IGluaXRfZHJtY2dycF9zaW5nbGUoZHJtY2dycCwgZGV2LT5wcmltYXJ5LT5p
bmRleCk7CisJCXJldHVybiByYzsKKwl9CisKKwlmb3IgKGkgPSAwOyBpIDw9IG1heF9taW5vcjsg
aSsrKSB7CisJCXJjID0gaW5pdF9kcm1jZ3JwX3NpbmdsZShkcm1jZ3JwLCBpKTsKKwkJaWYgKHJj
KQorCQkJcmV0dXJuIHJjOworCX0KIAotCWtmcmVlKGNzc19kcm1jZ3JwKGNzcykpOworCXJldHVy
biAwOwogfQogCiBzdGF0aWMgc3RydWN0IGNncm91cF9zdWJzeXNfc3RhdGUgKgpAQCAtMTgsMTEg
KzgxLDE4IEBAIGRybWNncnBfY3NzX2FsbG9jKHN0cnVjdCBjZ3JvdXBfc3Vic3lzX3N0YXRlICpw
YXJlbnRfY3NzKQogewogCXN0cnVjdCBkcm1jZ3JwICpwYXJlbnQgPSBjc3NfZHJtY2dycChwYXJl
bnRfY3NzKTsKIAlzdHJ1Y3QgZHJtY2dycCAqZHJtY2dycDsKKwlpbnQgcmM7CiAKIAlkcm1jZ3Jw
ID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IGRybWNncnApLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWRy
bWNncnApCiAJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwogCisJcmMgPSBpbml0X2RybWNncnAo
ZHJtY2dycCwgTlVMTCk7CisJaWYgKHJjKSB7CisJCWRybWNncnBfY3NzX2ZyZWUoJmRybWNncnAt
PmNzcyk7CisJCXJldHVybiBFUlJfUFRSKHJjKTsKKwl9CisKIAlpZiAoIXBhcmVudCkKIAkJcm9v
dF9kcm1jZ3JwID0gZHJtY2dycDsKIApAQCAtNDAsMyArMTEwLDQ5IEBAIHN0cnVjdCBjZ3JvdXBf
c3Vic3lzIGRybV9jZ3JwX3N1YnN5cyA9IHsKIAkubGVnYWN5X2NmdHlwZXMJPSBmaWxlcywKIAku
ZGZsX2NmdHlwZXMJPSBmaWxlcywKIH07CisKK2ludCBkcm1jZ3JwX3JlZ2lzdGVyX2RldmljZShz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2KQoreworCXN0cnVjdCBkcm1jZ3JwX2RldmljZSAqZGRldjsK
KwlzdHJ1Y3QgY2dyb3VwX3N1YnN5c19zdGF0ZSAqcG9zOworCXN0cnVjdCBkcm1jZ3JwICpjaGls
ZDsKKworCWRkZXYgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgZHJtY2dycF9kZXZpY2UpLCBHRlBf
S0VSTkVMKTsKKwlpZiAoIWRkZXYpCisJCXJldHVybiAtRU5PTUVNOworCisJZGRldi0+ZGV2ID0g
ZGV2OworCW11dGV4X2luaXQoJmRkZXYtPm11dGV4KTsKKworCW11dGV4X2xvY2soJmRybWNncnBf
bXV0ZXgpOworCWtub3duX2RybWNncnBfZGV2c1tkZXYtPnByaW1hcnktPmluZGV4XSA9IGRkZXY7
CisJbWF4X21pbm9yID0gbWF4KG1heF9taW5vciwgZGV2LT5wcmltYXJ5LT5pbmRleCk7CisJbXV0
ZXhfdW5sb2NrKCZkcm1jZ3JwX211dGV4KTsKKworCS8qIGluaXQgY2dyb3VwcyBjcmVhdGVkIGJl
Zm9yZSByZWdpc3RyYXRpb24gKGkuZS4gcm9vdCBjZ3JvdXApICovCisJaWYgKHJvb3RfZHJtY2dy
cCAhPSBOVUxMKSB7CisJCWluaXRfZHJtY2dycChyb290X2RybWNncnAsIGRldik7CisKKwkJcmN1
X3JlYWRfbG9jaygpOworCQljc3NfZm9yX2VhY2hfY2hpbGQocG9zLCAmcm9vdF9kcm1jZ3JwLT5j
c3MpIHsKKwkJCWNoaWxkID0gY3NzX2RybWNncnAocG9zKTsKKwkJCWluaXRfZHJtY2dycChjaGls
ZCwgZGV2KTsKKwkJfQorCQlyY3VfcmVhZF91bmxvY2soKTsKKwl9CisKKwlyZXR1cm4gMDsKK30K
K0VYUE9SVF9TWU1CT0woZHJtY2dycF9yZWdpc3Rlcl9kZXZpY2UpOworCitpbnQgZHJtY2dycF91
bnJlZ2lzdGVyX2RldmljZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQoreworCW11dGV4X2xvY2so
JmRybWNncnBfbXV0ZXgpOworCisJa2ZyZWUoa25vd25fZHJtY2dycF9kZXZzW2Rldi0+cHJpbWFy
eS0+aW5kZXhdKTsKKwlrbm93bl9kcm1jZ3JwX2RldnNbZGV2LT5wcmltYXJ5LT5pbmRleF0gPSBO
VUxMOworCisJbXV0ZXhfdW5sb2NrKCZkcm1jZ3JwX211dGV4KTsKKwlyZXR1cm4gMDsKK30KK0VY
UE9SVF9TWU1CT0woZHJtY2dycF91bnJlZ2lzdGVyX2RldmljZSk7Ci0tIAoyLjIxLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
