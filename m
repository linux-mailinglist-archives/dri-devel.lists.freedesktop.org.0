Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B513356D30
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 17:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9456E45D;
	Wed, 26 Jun 2019 15:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820073.outbound.protection.outlook.com [40.107.82.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3353B6E456;
 Wed, 26 Jun 2019 15:05:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=HUXXqqu0kxTvH5uUzySLJGGpSb1mELi57Xgi7WiJlicZ+4hQqPGI7hwCfGS8eq1vajFkO2HjOn7l/k+Opfpb7Odkow+JFCLC8+rDGKP+R0VB03piR0Su30ZJ5M/4EZuV2drxW3g/Q8225FVuqnjRWXl0nf4Gh0uyoXiDn4J2nYE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SU1hgST+JyNKTp1qUXKZfbLnqt+3iOdlQlRhiWUMa8A=;
 b=kk6EhZ36rYx/uhElp1NqMo6WjTbZG3RLt9WEHXwXtgMOn8UUX2JxuqGm83MRhLdEDUqG36/usn7vezXS24Ac57iSb6zJtd9Enw+Gf1qTRe2g7hnQYMAJjc/ht2YfeDMtDi/ysnTCjMQXtUhQaEhIpEhdIMOJ2ia6/qw3/0B43b4=
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0065.namprd12.prod.outlook.com (2603:10b6:300:103::27)
 by CY4PR1201MB0022.namprd12.prod.outlook.com (2603:10b6:910:1e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16; Wed, 26 Jun
 2019 15:05:31 +0000
Received: from DM3NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by MWHPR12CA0065.outlook.office365.com
 (2603:10b6:300:103::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.16 via Frontend
 Transport; Wed, 26 Jun 2019 15:05:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT041.mail.protection.outlook.com (10.152.83.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2032.15 via Frontend Transport; Wed, 26 Jun 2019 15:05:30 +0000
Received: from kho-5039A.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 26 Jun 2019
 10:05:27 -0500
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <joseph.greathouse@amd.com>, <jsparks@cray.com>, <lkaplan@cray.com>
Subject: [RFC PATCH v3 02/11] cgroup: Add mechanism to register DRM devices
Date: Wed, 26 Jun 2019 11:05:13 -0400
Message-ID: <20190626150522.11618-3-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626150522.11618-1-Kenny.Ho@amd.com>
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(396003)(136003)(346002)(2980300002)(428003)(189003)(199004)(2616005)(70206006)(2906002)(476003)(126002)(2870700001)(70586007)(426003)(48376002)(50466002)(81156014)(81166006)(8676002)(5660300002)(186003)(446003)(11346002)(1076003)(8936002)(14444005)(7696005)(53936002)(51416003)(76176011)(36756003)(4326008)(86362001)(336012)(2201001)(316002)(72206003)(77096007)(486006)(68736007)(50226002)(478600001)(110136005)(26005)(6666004)(305945005)(356004)(47776003)(53416004)(921003)(1121003)(83996005)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0022; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f08f7153-441d-475c-41ca-08d6fa47bb4a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR1201MB0022; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0022:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB002277E9A7B5902473A76D6183E20@CY4PR1201MB0022.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-Forefront-PRVS: 00808B16F3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: KGbLAE0tBLpuLQNwJ6iLFYVhQh+kYpaRWptQsCzct5wrmi/NGU2OVisfY/8wMqjKB7BYkQruSNVB1F+g5OF288CZSP/hFK5TGrr6fYXH2DNjGe46QtbkM4Xwt866EH+YV6d2vi7T5vt3RMKk8m2WbDufvMJkCKK/VodkKrYrhv34ubQEtWP19A4ksa12B1w2aY6hxXibRdpUfJksT3TJGwHJJdRb5Yq8qy0MV3RGJLi1m1vs/6hUSRBif+3AdYt2m4ydz9Av4zQeWMB2bzG7l3J3vSU8kzjOYjYvNG4/DFYq2/hOEzxC70SIfP0f+U2RtTLIBUzqEkdmo9KUQ2b/efZtXaOJzYYLzGpl4UFswdmYbzf1wrTxp4XEtUfFSkp93S3D1Sf3buaNUpCy2lHYEU/S24QIUBuy/r5N8ZGME4s=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2019 15:05:30.5677 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f08f7153-441d-475c-41ca-08d6fa47bb4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0022
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SU1hgST+JyNKTp1qUXKZfbLnqt+3iOdlQlRhiWUMa8A=;
 b=PC9IPDIPiGWL4fv2rTuWQhtkyOuc6u/SbEi/trh6n9Ty3Cv0m4xTboC81oNrr8t7PBOOpjEgO5pXgF/72m53o/qYxRTn6OMEtS/8niSZ36PBJ8wQVOQHosskEaB3wmgIBBETRWJxwdRFtmf4eZEQM8n7eOyomQQhqaHmUGyHvOI=
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
Cc: Kenny Ho <Kenny.Ho@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hhbmdlLUlkOiBJOTA4ZWU2OTc1ZWEwNTg1ZTRjMzBlYWZkZTQ1OTlmODcwOTRkOGM2NQpTaWdu
ZWQtb2ZmLWJ5OiBLZW5ueSBIbyA8S2VubnkuSG9AYW1kLmNvbT4KLS0tCiBpbmNsdWRlL2RybS9k
cm1fY2dyb3VwLmggICB8ICAyNCArKysrKysrKwogaW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmgg
fCAgMTAgKysrKwoga2VybmVsL2Nncm91cC9kcm0uYyAgICAgICAgfCAxMTYgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxNTAgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHJtL2RybV9jZ3JvdXAuaAoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jZ3JvdXAuaCBiL2luY2x1ZGUvZHJtL2RybV9jZ3JvdXAu
aApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmRkYjllYWI2NDM2MAot
LS0gL2Rldi9udWxsCisrKyBiL2luY2x1ZGUvZHJtL2RybV9jZ3JvdXAuaApAQCAtMCwwICsxLDI0
IEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUCisgKiBDb3B5cmlnaHQgMjAxOSBB
ZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuCisgKi8KKyNpZm5kZWYgX19EUk1fQ0dST1VQX0hf
XworI2RlZmluZSBfX0RSTV9DR1JPVVBfSF9fCisKKyNpZmRlZiBDT05GSUdfQ0dST1VQX0RSTQor
CitpbnQgZHJtY2dycF9yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldmljZSk7
CisKK2ludCBkcm1jZ3JwX3VucmVnaXN0ZXJfZGV2aWNlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXZp
Y2UpOworCisjZWxzZQorc3RhdGljIGlubGluZSBpbnQgZHJtY2dycF9yZWdpc3Rlcl9kZXZpY2Uo
c3RydWN0IGRybV9kZXZpY2UgKmRldmljZSkKK3sKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIGlu
bGluZSBpbnQgZHJtY2dycF91bnJlZ2lzdGVyX2RldmljZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
aWNlKQoreworCXJldHVybiAwOworfQorI2VuZGlmIC8qIENPTkZJR19DR1JPVVBfRFJNICovCisj
ZW5kaWYgLyogX19EUk1fQ0dST1VQX0hfXyAqLwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9j
Z3JvdXBfZHJtLmggYi9pbmNsdWRlL2xpbnV4L2Nncm91cF9kcm0uaAppbmRleCA5OTI4ZTYwMDM3
YTUuLjI3NDk3Zjc4NmM5MyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmgK
KysrIGIvaW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmgKQEAgLTYsMTAgKzYsMjAgQEAKIAogI2lm
ZGVmIENPTkZJR19DR1JPVVBfRFJNCiAKKyNpbmNsdWRlIDxsaW51eC9tdXRleC5oPgogI2luY2x1
ZGUgPGxpbnV4L2Nncm91cC5oPgorI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPgorCisvKiBsaW1p
dCBkZWZpbmVkIHBlciB0aGUgd2F5IGRybV9taW5vcl9hbGxvYyBvcGVyYXRlcyAqLworI2RlZmlu
ZSBNQVhfRFJNX0RFViAoNjQgKiBEUk1fTUlOT1JfUkVOREVSKQorCitzdHJ1Y3QgZHJtY2dycF9k
ZXZpY2VfcmVzb3VyY2UgeworCS8qIGZvciBwZXIgZGV2aWNlIHN0YXRzICovCit9OwogCiBzdHJ1
Y3QgZHJtY2dycCB7CiAJc3RydWN0IGNncm91cF9zdWJzeXNfc3RhdGUJY3NzOworCXN0cnVjdCBk
cm1jZ3JwX2RldmljZV9yZXNvdXJjZQkqZGV2X3Jlc291cmNlc1tNQVhfRFJNX0RFVl07CiB9Owog
CiBzdGF0aWMgaW5saW5lIHN0cnVjdCBkcm1jZ3JwICpjc3NfZHJtY2dycChzdHJ1Y3QgY2dyb3Vw
X3N1YnN5c19zdGF0ZSAqY3NzKQpkaWZmIC0tZ2l0IGEva2VybmVsL2Nncm91cC9kcm0uYyBiL2tl
cm5lbC9jZ3JvdXAvZHJtLmMKaW5kZXggNjZjYjFkZGEwMjNkLi43ZGE2ZTBkOTM5OTEgMTAwNjQ0
Ci0tLSBhL2tlcm5lbC9jZ3JvdXAvZHJtLmMKKysrIGIva2VybmVsL2Nncm91cC9kcm0uYwpAQCAt
MSwyOCArMSw5OSBAQAogLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVAogLy8gQ29weXJp
Z2h0IDIwMTkgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgorI2luY2x1ZGUgPGxpbnV4L2V4
cG9ydC5oPgogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KICNpbmNsdWRlIDxsaW51eC9jZ3JvdXAu
aD4KKyNpbmNsdWRlIDxsaW51eC9mcy5oPgorI2luY2x1ZGUgPGxpbnV4L3NlcV9maWxlLmg+Cisj
aW5jbHVkZSA8bGludXgvbXV0ZXguaD4KICNpbmNsdWRlIDxsaW51eC9jZ3JvdXBfZHJtLmg+Cisj
aW5jbHVkZSA8bGludXgva2VybmVsLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9kZXZpY2UuaD4KKyNp
bmNsdWRlIDxkcm0vZHJtX2Nncm91cC5oPgorCitzdGF0aWMgREVGSU5FX01VVEVYKGRybWNncnBf
bXV0ZXgpOworCitzdHJ1Y3QgZHJtY2dycF9kZXZpY2UgeworCXN0cnVjdCBkcm1fZGV2aWNlCSpk
ZXY7CisJc3RydWN0IG11dGV4CQltdXRleDsKK307CisKKy8qIGluZGV4ZWQgYnkgZHJtX21pbm9y
IGZvciBhY2Nlc3Mgc3BlZWQgKi8KK3N0YXRpYyBzdHJ1Y3QgZHJtY2dycF9kZXZpY2UJKmtub3du
X2RybWNncnBfZGV2c1tNQVhfRFJNX0RFVl07CisKK3N0YXRpYyBpbnQgbWF4X21pbm9yOworCiAK
IHN0YXRpYyBzdHJ1Y3QgZHJtY2dycCAqcm9vdF9kcm1jZ3JwIF9fcmVhZF9tb3N0bHk7CiAKIHN0
YXRpYyB2b2lkIGRybWNncnBfY3NzX2ZyZWUoc3RydWN0IGNncm91cF9zdWJzeXNfc3RhdGUgKmNz
cykKIHsKIAlzdHJ1Y3QgZHJtY2dycCAqZHJtY2dycCA9IGNzc19kcm1jZ3JwKGNzcyk7CisJaW50
IGk7CisKKwlmb3IgKGkgPSAwOyBpIDw9IG1heF9taW5vcjsgaSsrKSB7CisJCWlmIChkcm1jZ3Jw
LT5kZXZfcmVzb3VyY2VzW2ldICE9IE5VTEwpCisJCQlrZnJlZShkcm1jZ3JwLT5kZXZfcmVzb3Vy
Y2VzW2ldKTsKKwl9CiAKIAlrZnJlZShkcm1jZ3JwKTsKIH0KIAorc3RhdGljIGlubGluZSBpbnQg
aW5pdF9kcm1jZ3JwX3NpbmdsZShzdHJ1Y3QgZHJtY2dycCAqZHJtY2dycCwgaW50IG1pbm9yKQor
eworCXN0cnVjdCBkcm1jZ3JwX2RldmljZV9yZXNvdXJjZSAqZGRyID0gZHJtY2dycC0+ZGV2X3Jl
c291cmNlc1ttaW5vcl07CisKKwlpZiAoZGRyID09IE5VTEwpIHsKKwkJZGRyID0ga3phbGxvYyhz
aXplb2Yoc3RydWN0IGRybWNncnBfZGV2aWNlX3Jlc291cmNlKSwKKwkJCUdGUF9LRVJORUwpOwor
CisJCWlmICghZGRyKQorCQkJcmV0dXJuIC1FTk9NRU07CisKKwkJZHJtY2dycC0+ZGV2X3Jlc291
cmNlc1ttaW5vcl0gPSBkZHI7CisJfQorCisJLyogc2V0IGRlZmF1bHRzIGhlcmUgKi8KKworCXJl
dHVybiAwOworfQorCitzdGF0aWMgaW5saW5lIGludCBpbml0X2RybWNncnAoc3RydWN0IGRybWNn
cnAgKmRybWNncnAsIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCit7CisJaW50IHJjID0gMDsKKwlp
bnQgaTsKKworCWlmIChkZXYgIT0gTlVMTCkgeworCQlyYyA9IGluaXRfZHJtY2dycF9zaW5nbGUo
ZHJtY2dycCwgZGV2LT5wcmltYXJ5LT5pbmRleCk7CisJCXJldHVybiByYzsKKwl9CisKKwlmb3Ig
KGkgPSAwOyBpIDw9IG1heF9taW5vcjsgaSsrKSB7CisJCXJjID0gaW5pdF9kcm1jZ3JwX3Npbmds
ZShkcm1jZ3JwLCBpKTsKKwkJaWYgKHJjKQorCQkJcmV0dXJuIHJjOworCX0KKworCXJldHVybiAw
OworfQorCiBzdGF0aWMgc3RydWN0IGNncm91cF9zdWJzeXNfc3RhdGUgKgogZHJtY2dycF9jc3Nf
YWxsb2Moc3RydWN0IGNncm91cF9zdWJzeXNfc3RhdGUgKnBhcmVudF9jc3MpCiB7CiAJc3RydWN0
IGRybWNncnAgKnBhcmVudCA9IGNzc19kcm1jZ3JwKHBhcmVudF9jc3MpOwogCXN0cnVjdCBkcm1j
Z3JwICpkcm1jZ3JwOworCWludCByYzsKIAogCWRybWNncnAgPSBremFsbG9jKHNpemVvZihzdHJ1
Y3QgZHJtY2dycCksIEdGUF9LRVJORUwpOwogCWlmICghZHJtY2dycCkKIAkJcmV0dXJuIEVSUl9Q
VFIoLUVOT01FTSk7CiAKKwlyYyA9IGluaXRfZHJtY2dycChkcm1jZ3JwLCBOVUxMKTsKKwlpZiAo
cmMpIHsKKwkJZHJtY2dycF9jc3NfZnJlZSgmZHJtY2dycC0+Y3NzKTsKKwkJcmV0dXJuIEVSUl9Q
VFIocmMpOworCX0KKwogCWlmICghcGFyZW50KQogCQlyb290X2RybWNncnAgPSBkcm1jZ3JwOwog
CkBAIC00MCwzICsxMTEsNDggQEAgc3RydWN0IGNncm91cF9zdWJzeXMgZHJtX2NncnBfc3Vic3lz
ID0gewogCS5sZWdhY3lfY2Z0eXBlcwk9IGZpbGVzLAogCS5kZmxfY2Z0eXBlcwk9IGZpbGVzLAog
fTsKKworaW50IGRybWNncnBfcmVnaXN0ZXJfZGV2aWNlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYp
Cit7CisJc3RydWN0IGRybWNncnBfZGV2aWNlICpkZGV2OworCisJZGRldiA9IGt6YWxsb2Moc2l6
ZW9mKHN0cnVjdCBkcm1jZ3JwX2RldmljZSksIEdGUF9LRVJORUwpOworCWlmICghZGRldikKKwkJ
cmV0dXJuIC1FTk9NRU07CisKKwlkZGV2LT5kZXYgPSBkZXY7CisJbXV0ZXhfaW5pdCgmZGRldi0+
bXV0ZXgpOworCisJbXV0ZXhfbG9jaygmZHJtY2dycF9tdXRleCk7CisJa25vd25fZHJtY2dycF9k
ZXZzW2Rldi0+cHJpbWFyeS0+aW5kZXhdID0gZGRldjsKKwltYXhfbWlub3IgPSBtYXgobWF4X21p
bm9yLCBkZXYtPnByaW1hcnktPmluZGV4KTsKKwltdXRleF91bmxvY2soJmRybWNncnBfbXV0ZXgp
OworCisJLyogaW5pdCBjZ3JvdXBzIGNyZWF0ZWQgYmVmb3JlIHJlZ2lzdHJhdGlvbiAoaS5lLiBy
b290IGNncm91cCkgKi8KKwlpZiAocm9vdF9kcm1jZ3JwICE9IE5VTEwpIHsKKwkJc3RydWN0IGNn
cm91cF9zdWJzeXNfc3RhdGUgKnBvczsKKwkJc3RydWN0IGRybWNncnAgKmNoaWxkOworCisJCXJj
dV9yZWFkX2xvY2soKTsKKwkJY3NzX2Zvcl9lYWNoX2Rlc2NlbmRhbnRfcHJlKHBvcywgJnJvb3Rf
ZHJtY2dycC0+Y3NzKSB7CisJCQljaGlsZCA9IGNzc19kcm1jZ3JwKHBvcyk7CisJCQlpbml0X2Ry
bWNncnAoY2hpbGQsIGRldik7CisJCX0KKwkJcmN1X3JlYWRfdW5sb2NrKCk7CisJfQorCisJcmV0
dXJuIDA7Cit9CitFWFBPUlRfU1lNQk9MKGRybWNncnBfcmVnaXN0ZXJfZGV2aWNlKTsKKworaW50
IGRybWNncnBfdW5yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldikKK3sKKwlt
dXRleF9sb2NrKCZkcm1jZ3JwX211dGV4KTsKKworCWtmcmVlKGtub3duX2RybWNncnBfZGV2c1tk
ZXYtPnByaW1hcnktPmluZGV4XSk7CisJa25vd25fZHJtY2dycF9kZXZzW2Rldi0+cHJpbWFyeS0+
aW5kZXhdID0gTlVMTDsKKworCW11dGV4X3VubG9jaygmZHJtY2dycF9tdXRleCk7CisJcmV0dXJu
IDA7Cit9CitFWFBPUlRfU1lNQk9MKGRybWNncnBfdW5yZWdpc3Rlcl9kZXZpY2UpOwotLSAKMi4y
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
