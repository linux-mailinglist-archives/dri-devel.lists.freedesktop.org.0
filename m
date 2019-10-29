Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E39E8A24
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 14:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981C96EB3E;
	Tue, 29 Oct 2019 13:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730080.outbound.protection.outlook.com [40.107.73.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64FE6E3F3;
 Tue, 29 Oct 2019 13:53:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTnzYOnPunHAYilR+jqbxyT3kJLLvCUKg89ZdInXNmoyIoE3H/Ng7phs7jnkRCWE5Wa2CuqDq0ehhxXR8CcfExW4E98sJLh5vrAm3iLA8MtMmtKQFUnp0Vn06JiLPZtMimXhfURRZn8w7Lear8D21fPrt1LV8Kex6bI8V1L2Ad97MPJZDivI8eA+yFPBjcI2gB8rgchhvoaafDoDRB6vd6qgUGN+iKRVPhMUFVwbAqtNk0XKS/BmfrGnmaQ+iwss3YWzCvqJWXt4LO+WLK2NpGYZbxYL37qSa8ydOsrg6LkycscDPD6w/e/0XIGbXXItF15FpeXHid4cSrla1LQ2hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nr+TAUDm/MnVgXhfKt6CMssAb+kS6ADjzD5TlN2ndBk=;
 b=g1j4s3TxoFJy+Fgh+L2Eek1gI02+b7LEMSWeChP1UfuihdOlLMq0pex0WkZKpD7VP8ylos6HgOycGRQT41hzRyVsChn1YCHvBUoVkuI3tQFc+eWm2fK2lOhK/pAEaU+8ePmcIv6fzwf0YAceUbw+Hvcc9vOnbry94rbWrtxdUAoJMgt7KiJLDsRBZjG8i45a/2mgIAxkEWLMe8rHo4O2hAgkmVJlVcTt5TAmUBRVkV+6q3IV6/DYWJ7Nd/d8iGY0E5vDfuSgSH5RnECiiM8jM3uK9+soxDP5lndvL5UICQFUm/dZn/jiBnuCsZqAC6GTMUd4RC55D89UYQqAsY6oNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0012.namprd12.prod.outlook.com (2603:10b6:408:60::25)
 by BN8PR12MB3027.namprd12.prod.outlook.com (2603:10b6:408:64::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.23; Tue, 29 Oct
 2019 13:53:04 +0000
Received: from CO1NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by BN8PR12CA0012.outlook.office365.com
 (2603:10b6:408:60::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.17 via Frontend
 Transport; Tue, 29 Oct 2019 13:53:04 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT040.mail.protection.outlook.com (10.152.81.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 13:53:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 08:53:01 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 29 Oct
 2019 08:53:01 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 29 Oct 2019 08:53:00 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/13] drm/amd/display: Recalculate VCPI slots for new DSC
 connectors
Date: Tue, 29 Oct 2019 09:52:45 -0400
Message-ID: <20191029135245.31152-14-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029135245.31152-1-mikita.lipski@amd.com>
References: <20191029135245.31152-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(428003)(199004)(189003)(48376002)(81156014)(16586007)(54906003)(8676002)(36756003)(1076003)(478600001)(50466002)(5660300002)(2876002)(186003)(81166006)(305945005)(70586007)(47776003)(2906002)(14444005)(8936002)(316002)(356004)(6666004)(70206006)(50226002)(86362001)(53416004)(7696005)(476003)(486006)(51416003)(336012)(6916009)(4326008)(26005)(426003)(76176011)(2351001)(11346002)(2616005)(126002)(446003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3027; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 082cf3a7-8326-42ee-9eb1-08d75c7751c7
X-MS-TrafficTypeDiagnostic: BN8PR12MB3027:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3027A85EBD19A00825D3FC19E4610@BN8PR12MB3027.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0205EDCD76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mvki77R8+i3Mfb4EF2IMbFrpG6SiY6z3uJ0hkA7eBSfr0AkoDrK11YA3QU6XyNpanRARq5AW6H3BI76lCnsCn/ow9vi3ekMhkroyp5qIP+DvGwxLkNtWOJc5fIwycatZt1W3IBpM+YJvfVZHDA9rkVY2MxFNU1k/V/fNBFgtm1hC7ho9wfl8HKpe/B7+W/2Hvci4VyAg7dFb/XVl0iIzCBj+CZIBdzL5jpD40Rnmszy3ZztuLV6Ix+8sn2O8aW72DbL/bARDV/sIfJAUs7SlxTpZnFuPvk4o2fQuPIgfa7XvD9ZQw2CbdpSlIU6XDwKBGOY3nhw9Wg46IsBQ9Or404FrOTbyOSPDCaSuMLi4SFQOp9+priFjgBZXU+etFVptQwL+uGoO4qG6IEfqnskuNKirZGNyFgaGRYDPVDkJ+Sknb4YnoRdLpgCr3Xtxk4BI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2019 13:53:03.7393 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 082cf3a7-8326-42ee-9eb1-08d75c7751c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3027
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nr+TAUDm/MnVgXhfKt6CMssAb+kS6ADjzD5TlN2ndBk=;
 b=DPcYHm4HIja/mHl8wSdGkaWEYOWJ5IYXfDALHCLO0l5NqxK6VZ73uzRYkJaGMT+BRca/WgCEoiSkBx3wedaGhGjJqwpz71MmooXRN5yI7RUziVD/j+5jIMFR2aKazBXlpK0NC/8arSnUOlJdhFHVdxEmJSNT/GtY547KyzBHYCQ=
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
Cc: Jerry Zuo <Jerry.Zuo@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKU2luY2UgZm9yIERT
QyBNU1QgY29ubmVjdG9yJ3MgUEJOIGlzIGNsYWN1bGF0ZWQgZGlmZmVyZW50bHkKZHVlIHRvIGNv
bXByZXNzaW9uLCB3ZSBoYXZlIHRvIHJlY2FsY3VsYXRlIGJvdGggUEJOIGFuZApWQ1BJIHNsb3Rz
IGZvciB0aGF0IGNvbm5lY3Rvci4KClRoZSBmdW5jdGlvbiBpdGVyYXRlcyB0aHJvdWdoIGFsbCB0
aGUgYWN0aXZlIHN0cmVhbXMgdG8KZmluZCwgd2hpY2ggaGF2ZSBEU0MgZW5hYmxlZCwgdGhlbiBy
ZWNhbGN1bGF0ZXMgUEJOIGZvcgppdCBhbmQgY2FsbHMgZHJtX2RwX2hlbHBlcl91cGRhdGVfdmNw
aV9zbG90c19mb3JfZHNjIHRvCnVwZGF0ZSBjb25uZWN0b3IncyBWQ1BJIHNsb3RzLgoKQ2M6IEpl
cnJ5IFp1byA8SmVycnkuWnVvQGFtZC5jb20+CkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2Vu
dGxhbmRAYW1kLmNvbT4KQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+ClNpZ25lZC1v
ZmYtYnk6IE1pa2l0YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCA3MSArKysrKysrKysrKysr
KysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YwppbmRleCBhZGJkMjhlMTc5NDcuLjY2NGRlZjRlNDY1MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC00NjA4LDYgKzQ2MDgs
MjcgQEAgc3RhdGljIHZvaWQgZG1fZW5jb2Rlcl9oZWxwZXJfZGlzYWJsZShzdHJ1Y3QgZHJtX2Vu
Y29kZXIgKmVuY29kZXIpCiAKIH0KIAorc3RhdGljIGludCBjb252ZXJ0X2RjX2NvbG9yX2RlcHRo
X2ludG9fYnBjIChlbnVtIGRjX2NvbG9yX2RlcHRoIGRpc3BsYXlfY29sb3JfZGVwdGgpCit7CisJ
c3dpdGNoIChkaXNwbGF5X2NvbG9yX2RlcHRoKSB7CisJCWNhc2UgQ09MT1JfREVQVEhfNjY2Ogor
CQkJcmV0dXJuIDY7CisJCWNhc2UgQ09MT1JfREVQVEhfODg4OgorCQkJcmV0dXJuIDg7CisJCWNh
c2UgQ09MT1JfREVQVEhfMTAxMDEwOgorCQkJcmV0dXJuIDEwOworCQljYXNlIENPTE9SX0RFUFRI
XzEyMTIxMjoKKwkJCXJldHVybiAxMjsKKwkJY2FzZSBDT0xPUl9ERVBUSF8xNDE0MTQ6CisJCQly
ZXR1cm4gMTQ7CisJCWNhc2UgQ09MT1JfREVQVEhfMTYxNjE2OgorCQkJcmV0dXJuIDE2OworCQlk
ZWZhdWx0OgorCQkJYnJlYWs7CisJCX0KKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGludCBkbV9l
bmNvZGVyX2hlbHBlcl9hdG9taWNfY2hlY2soc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAog
CQkJCQkgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwKIAkJCQkJICBzdHJ1Y3Qg
ZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZSkKQEAgLTQ2NTEsNiArNDY3Miw0MyBAQCBj
b25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfaGVscGVyX2Z1bmNzIGFtZGdwdV9kbV9lbmNvZGVyX2hl
bHBlcl9mdW5jcyA9IHsKIAkuYXRvbWljX2NoZWNrID0gZG1fZW5jb2Rlcl9oZWxwZXJfYXRvbWlj
X2NoZWNrCiB9OwogCitzdGF0aWMgaW50IGRtX3VwZGF0ZV9tc3RfdmNwaV9zbG90c19mb3JfZHNj
KHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKKwkJCQkJICAgIHN0cnVjdCBkY19zdGF0
ZSAqZGNfc3RhdGUpCit7CisJc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtOworCXN0cnVj
dCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yOworCXN0cnVjdCBkbV9jb25uZWN0b3Jf
c3RhdGUgKmRtX2Nvbm5fc3RhdGU7CisJaW50IGkgPSAwLCBjbG9jayA9IDAsIGJwcCA9IDA7CisK
Kwlmb3IgKGkgPSAwOyBpIDwgZGNfc3RhdGUtPnN0cmVhbV9jb3VudDsgaSsrKSB7CisKKwkJc3Ry
ZWFtID0gZGNfc3RhdGUtPnN0cmVhbXNbaV07CisKKwkJaWYgKCFzdHJlYW0pCisJCQljb250aW51
ZTsKKworCQlhY29ubmVjdG9yID0gKHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICopc3RyZWFt
LT5kbV9zdHJlYW1fY29udGV4dDsKKwkJZG1fY29ubl9zdGF0ZSA9IHRvX2RtX2Nvbm5lY3Rvcl9z
dGF0ZShhY29ubmVjdG9yLT5iYXNlLnN0YXRlKTsKKworCQlpZiAoIWFjb25uZWN0b3ItPnBvcnQp
CisJCQljb250aW51ZTsKKworCQlpZiAoc3RyZWFtLT50aW1pbmcuZmxhZ3MuRFNDICE9IDEpCisJ
CQljb250aW51ZTsKKworCQlicHAgPSBjb252ZXJ0X2RjX2NvbG9yX2RlcHRoX2ludG9fYnBjKHN0
cmVhbS0+dGltaW5nLmRpc3BsYXlfY29sb3JfZGVwdGgpKiAzOworCQljbG9jayA9IHN0cmVhbS0+
dGltaW5nLnBpeF9jbGtfMTAwaHogLyAxMDsKKworCQlkbV9jb25uX3N0YXRlLT5wYm4gPSAgZHJt
X2RwX2NhbGNfcGJuX21vZGUoY2xvY2ssIGJwcCwgdHJ1ZSk7CisKKwkJZG1fY29ubl9zdGF0ZS0+
dmNwaV9zbG90cyA9IGRybV9kcF9oZWxwZXJfdXBkYXRlX3ZjcGlfc2xvdHNfZm9yX2RzYyhzdGF0
ZSwgYWNvbm5lY3Rvci0+cG9ydCwgZG1fY29ubl9zdGF0ZS0+cGJuKTsKKworCQlpZiAoZG1fY29u
bl9zdGF0ZS0+dmNwaV9zbG90cyA8IDApCisJCQlyZXR1cm4gZG1fY29ubl9zdGF0ZS0+dmNwaV9z
bG90czsKKwl9CisJcmV0dXJuIDA7Cit9CisKIHN0YXRpYyB2b2lkIGRtX2RybV9wbGFuZV9yZXNl
dChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkKIHsKIAlzdHJ1Y3QgZG1fcGxhbmVfc3RhdGUgKmFt
ZGdwdV9zdGF0ZSA9IE5VTEw7CkBAIC03Njg0LDExICs3NzQyLDYgQEAgc3RhdGljIGludCBhbWRn
cHVfZG1fYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJaWYgKHJldCkKIAkJ
Z290byBmYWlsOwogCi0JLyogUGVyZm9ybSB2YWxpZGF0aW9uIG9mIE1TVCB0b3BvbG9neSBpbiB0
aGUgc3RhdGUqLwotCXJldCA9IGRybV9kcF9tc3RfYXRvbWljX2NoZWNrKHN0YXRlKTsKLQlpZiAo
cmV0KQotCQlnb3RvIGZhaWw7Ci0KIAlpZiAoc3RhdGUtPmxlZ2FjeV9jdXJzb3JfdXBkYXRlKSB7
CiAJCS8qCiAJCSAqIFRoaXMgaXMgYSBmYXN0IGN1cnNvciB1cGRhdGUgY29taW5nIGZyb20gdGhl
IHBsYW5lIHVwZGF0ZQpAQCAtNzc2MCw2ICs3ODEzLDEwIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2Rt
X2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogI2lmZGVmIENPTkZJR19EUk1f
QU1EX0RDX0RTQ19TVVBQT1JUCiAJCWlmICghY29tcHV0ZV9tc3RfZHNjX2NvbmZpZ3NfZm9yX3N0
YXRlKGRtX3N0YXRlLT5jb250ZXh0KSkKIAkJCWdvdG8gZmFpbDsKKworCQlyZXQgPSBkbV91cGRh
dGVfbXN0X3ZjcGlfc2xvdHNfZm9yX2RzYyhzdGF0ZSwgZG1fc3RhdGUtPmNvbnRleHQpOworCQlp
ZiAocmV0KQorCQkJZ290byBmYWlsOwogI2VuZGlmCiAJCWlmIChkY192YWxpZGF0ZV9nbG9iYWxf
c3RhdGUoZGMsIGRtX3N0YXRlLT5jb250ZXh0LCBmYWxzZSkgIT0gRENfT0spIHsKIAkJCXJldCA9
IC1FSU5WQUw7CkBAIC03Nzg5LDYgKzc4NDYsMTAgQEAgc3RhdGljIGludCBhbWRncHVfZG1fYXRv
bWljX2NoZWNrKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCQkJZGNfcmV0YWluX3N0YXRlKG9s
ZF9kbV9zdGF0ZS0+Y29udGV4dCk7CiAJCX0KIAl9CisJLyogUGVyZm9ybSB2YWxpZGF0aW9uIG9m
IE1TVCB0b3BvbG9neSBpbiB0aGUgc3RhdGUqLworCXJldCA9IGRybV9kcF9tc3RfYXRvbWljX2No
ZWNrKHN0YXRlKTsKKwlpZiAocmV0KQorCQlnb3RvIGZhaWw7CiAKIAkvKiBTdG9yZSB0aGUgb3Zl
cmFsbCB1cGRhdGUgdHlwZSBmb3IgdXNlIGxhdGVyIGluIGF0b21pYyBjaGVjay4gKi8KIAlmb3Jf
ZWFjaF9uZXdfY3J0Y19pbl9zdGF0ZSAoc3RhdGUsIGNydGMsIG5ld19jcnRjX3N0YXRlLCBpKSB7
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
