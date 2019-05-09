Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4CA19401
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 23:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1420789B95;
	Thu,  9 May 2019 21:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F85B89B95;
 Thu,  9 May 2019 21:04:48 +0000 (UTC)
Received: from MWHPR12CA0034.namprd12.prod.outlook.com (2603:10b6:301:2::20)
 by DM5PR1201MB0060.namprd12.prod.outlook.com (2603:10b6:4:54::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.15; Thu, 9 May
 2019 21:04:45 +0000
Received: from CO1NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by MWHPR12CA0034.outlook.office365.com
 (2603:10b6:301:2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Thu, 9 May 2019 21:04:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT005.mail.protection.outlook.com (10.152.80.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Thu, 9 May 2019 21:04:44 +0000
Received: from kho-5039A.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 9 May 2019
 16:04:42 -0500
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <Kenny.Ho@amd.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <sunnanyong@huawei.com>, <alexander.deucher@amd.com>,
 <brian.welty@intel.com>
Subject: [RFC PATCH v2 1/5] cgroup: Introduce cgroup for drm subsystem
Date: Thu, 9 May 2019 17:04:06 -0400
Message-ID: <20190509210410.5471-2-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509210410.5471-1-Kenny.Ho@amd.com>
References: <20181120185814.13362-1-Kenny.Ho@amd.com>
 <20190509210410.5471-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(396003)(346002)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(478600001)(47776003)(1076003)(72206003)(50226002)(81166006)(81156014)(8676002)(8936002)(6666004)(356004)(14444005)(305945005)(53416004)(5024004)(2616005)(476003)(11346002)(446003)(86362001)(126002)(486006)(426003)(186003)(26005)(77096007)(48376002)(110136005)(50466002)(5660300002)(2201001)(336012)(53936002)(68736007)(7696005)(2870700001)(76176011)(51416003)(2906002)(70586007)(70206006)(316002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0060; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 601a1d46-a0f3-4dd8-addd-08d6d4c1f6bd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR1201MB0060; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0060:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB00600348694940E6A69F2BD183330@DM5PR1201MB0060.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 003245E729
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /g/WIAAD+T/l6ZZpl8UZgSVYU8UKyRJEQ2kup3NZhBuClnD15gSy+XTg/vMLcQH1/9LRwXLVh2rDQ3H6GBCk4vsHZ9FfhGc853lKtJC2V48bNfrsjseWUQY9GrqKj9WZDijgjKLX94s/H5mNu5hlKlK83Eyyq4LZarImXXaPSIiuqX/FOIRq9PAB71egCxsF0aj9zy2v4/dmGOmuwLiuQY5DMiELMpi3UTec3PXspWwrX3GRyZwAxss+mDboeUdxDkYx04HbNKf7ecWRGnF5xoIRrsr60MqBMCuLTsIDiOaHgQgBRTLuC4WZqTJPHWg1nTsUww7Sys0CMchhs+IfX8OhqKNNq3NT8rLQ7+BWQ+vPcXRstOZvgAcJJ9m0qvK/6oE+D6EUlzG4YSpkHbh40jRejMEOiVqtiaPwRlOWgo0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2019 21:04:44.9608 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 601a1d46-a0f3-4dd8-addd-08d6d4c1f6bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0060
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YOVKDWqtsp3YOBhGBQhAAXk2OeBSRU2dQNs+Dfx/+U=;
 b=tXUFCw7oPwjifIZLe81w7Zc2oACV/bgrI6ivuuvl9Nv61IWawG9tdQmXwk1H8HYE1luoEj8fDQa1BiLUrgk06OPa1gqGuORgmDwh9VeJOptZHFipyafKxZQZom82DJA3WMPqx+uQ77/VQ+vFg1ZxFa6LyXtvyd71kyW28qUbSYw=
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

Q2hhbmdlLUlkOiBJNjgzMGQzOTkwZjYzZjBjMTNhYmViYTI5YjFkMzMwY2YyODg4MjgzMQpTaWdu
ZWQtb2ZmLWJ5OiBLZW5ueSBIbyA8S2VubnkuSG9AYW1kLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4
L2Nncm91cF9kcm0uaCAgICB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRl
L2xpbnV4L2Nncm91cF9zdWJzeXMuaCB8ICA0ICsrKysKIGluaXQvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgIHwgIDUgKysrKysKIGtlcm5lbC9jZ3JvdXAvTWFrZWZpbGUgICAgICAgIHwgIDEgKwog
a2VybmVsL2Nncm91cC9kcm0uYyAgICAgICAgICAgfCA0MiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmgKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBrZXJuZWwvY2dyb3VwL2RybS5jCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9jZ3JvdXBf
ZHJtLmggYi9pbmNsdWRlL2xpbnV4L2Nncm91cF9kcm0uaApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwMDAuLjEyMTAwMWJlMTIzMAotLS0gL2Rldi9udWxsCisrKyBiL2luY2x1
ZGUvbGludXgvY2dyb3VwX2RybS5oCkBAIC0wLDAgKzEsMzIgQEAKKy8qIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBNSVQKKyAqIENvcHlyaWdodCAyMDE5IEFkdmFuY2VkIE1pY3JvIERldmljZXMs
IEluYy4KKyAqLworI2lmbmRlZiBfQ0dST1VQX0RSTV9ICisjZGVmaW5lIF9DR1JPVVBfRFJNX0gK
KworI2lmZGVmIENPTkZJR19DR1JPVVBfRFJNCisKKyNpbmNsdWRlIDxsaW51eC9jZ3JvdXAuaD4K
Kworc3RydWN0IGRybWNncnAgeworCXN0cnVjdCBjZ3JvdXBfc3Vic3lzX3N0YXRlCWNzczsKK307
CisKK3N0YXRpYyBpbmxpbmUgc3RydWN0IGRybWNncnAgKmNzc19kcm1jZ3JwKHN0cnVjdCBjZ3Jv
dXBfc3Vic3lzX3N0YXRlICpjc3MpCit7CisJcmV0dXJuIGNzcyA/IGNvbnRhaW5lcl9vZihjc3Ms
IHN0cnVjdCBkcm1jZ3JwLCBjc3MpIDogTlVMTDsKK30KKworc3RhdGljIGlubGluZSBzdHJ1Y3Qg
ZHJtY2dycCAqZ2V0X2RybWNncnAoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKQoreworCXJldHVy
biBjc3NfZHJtY2dycCh0YXNrX2dldF9jc3ModGFzaywgZHJtX2NncnBfaWQpKTsKK30KKworCitz
dGF0aWMgaW5saW5lIHN0cnVjdCBkcm1jZ3JwICpwYXJlbnRfZHJtY2dycChzdHJ1Y3QgZHJtY2dy
cCAqY2cpCit7CisJcmV0dXJuIGNzc19kcm1jZ3JwKGNnLT5jc3MucGFyZW50KTsKK30KKworI2Vu
ZGlmCS8qIENPTkZJR19DR1JPVVBfRFJNICovCisjZW5kaWYJLyogX0NHUk9VUF9EUk1fSCAqLwpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9jZ3JvdXBfc3Vic3lzLmggYi9pbmNsdWRlL2xpbnV4
L2Nncm91cF9zdWJzeXMuaAppbmRleCBhY2I3N2RjZmYzYjQuLmRkZWRhZDgwOWU4YiAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9saW51eC9jZ3JvdXBfc3Vic3lzLmgKKysrIGIvaW5jbHVkZS9saW51eC9j
Z3JvdXBfc3Vic3lzLmgKQEAgLTYxLDYgKzYxLDEwIEBAIFNVQlNZUyhwaWRzKQogU1VCU1lTKHJk
bWEpCiAjZW5kaWYKIAorI2lmIElTX0VOQUJMRUQoQ09ORklHX0NHUk9VUF9EUk0pCitTVUJTWVMo
ZHJtKQorI2VuZGlmCisKIC8qCiAgKiBUaGUgZm9sbG93aW5nIHN1YnN5c3RlbXMgYXJlIG5vdCBz
dXBwb3J0ZWQgb24gdGhlIGRlZmF1bHQgaGllcmFyY2h5LgogICovCmRpZmYgLS1naXQgYS9pbml0
L0tjb25maWcgYi9pbml0L0tjb25maWcKaW5kZXggZDQ3Y2I3N2EyMjBlLi4wYjBmMTEyZWIyM2Ig
MTAwNjQ0Ci0tLSBhL2luaXQvS2NvbmZpZworKysgYi9pbml0L0tjb25maWcKQEAgLTgzOSw2ICs4
MzksMTEgQEAgY29uZmlnIENHUk9VUF9SRE1BCiAJICBBdHRhY2hpbmcgcHJvY2Vzc2VzIHdpdGgg
YWN0aXZlIFJETUEgcmVzb3VyY2VzIHRvIHRoZSBjZ3JvdXAKIAkgIGhpZXJhcmNoeSBpcyBhbGxv
d2VkIGV2ZW4gaWYgY2FuIGNyb3NzIHRoZSBoaWVyYXJjaHkncyBsaW1pdC4KIAorY29uZmlnIENH
Uk9VUF9EUk0KKwlib29sICJEUk0gY29udHJvbGxlciAoRVhQRVJJTUVOVEFMKSIKKwloZWxwCisJ
ICBQcm92aWRlcyBhY2NvdW50aW5nIGFuZCBlbmZvcmNlbWVudCBvZiByZXNvdXJjZXMgaW4gdGhl
IERSTSBzdWJzeXN0ZW0uCisKIGNvbmZpZyBDR1JPVVBfRlJFRVpFUgogCWJvb2wgIkZyZWV6ZXIg
Y29udHJvbGxlciIKIAloZWxwCmRpZmYgLS1naXQgYS9rZXJuZWwvY2dyb3VwL01ha2VmaWxlIGIv
a2VybmVsL2Nncm91cC9NYWtlZmlsZQppbmRleCBiZmNkYWU4OTYxMjIuLjZhZjE0YmQ5MzA1MCAx
MDA2NDQKLS0tIGEva2VybmVsL2Nncm91cC9NYWtlZmlsZQorKysgYi9rZXJuZWwvY2dyb3VwL01h
a2VmaWxlCkBAIC00LDUgKzQsNiBAQCBvYmoteSA6PSBjZ3JvdXAubyByc3RhdC5vIG5hbWVzcGFj
ZS5vIGNncm91cC12MS5vCiBvYmotJChDT05GSUdfQ0dST1VQX0ZSRUVaRVIpICs9IGZyZWV6ZXIu
bwogb2JqLSQoQ09ORklHX0NHUk9VUF9QSURTKSArPSBwaWRzLm8KIG9iai0kKENPTkZJR19DR1JP
VVBfUkRNQSkgKz0gcmRtYS5vCitvYmotJChDT05GSUdfQ0dST1VQX0RSTSkgKz0gZHJtLm8KIG9i
ai0kKENPTkZJR19DUFVTRVRTKSArPSBjcHVzZXQubwogb2JqLSQoQ09ORklHX0NHUk9VUF9ERUJV
RykgKz0gZGVidWcubwpkaWZmIC0tZ2l0IGEva2VybmVsL2Nncm91cC9kcm0uYyBiL2tlcm5lbC9j
Z3JvdXAvZHJtLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi42MjBj
ODg3ZDZkMjQKLS0tIC9kZXYvbnVsbAorKysgYi9rZXJuZWwvY2dyb3VwL2RybS5jCkBAIC0wLDAg
KzEsNDIgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQKKy8vIENvcHlyaWdodCAy
MDE5IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4KKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+
CisjaW5jbHVkZSA8bGludXgvY2dyb3VwLmg+CisjaW5jbHVkZSA8bGludXgvY2dyb3VwX2RybS5o
PgorCitzdGF0aWMgc3RydWN0IGRybWNncnAgKnJvb3RfZHJtY2dycCBfX3JlYWRfbW9zdGx5Owor
CitzdGF0aWMgdm9pZCBkcm1jZ3JwX2Nzc19mcmVlKHN0cnVjdCBjZ3JvdXBfc3Vic3lzX3N0YXRl
ICpjc3MpCit7CisJc3RydWN0IGRybWNncnAgKmRybWNncnAgPSBjc3NfZHJtY2dycChjc3MpOwor
CisJa2ZyZWUoY3NzX2RybWNncnAoY3NzKSk7Cit9CisKK3N0YXRpYyBzdHJ1Y3QgY2dyb3VwX3N1
YnN5c19zdGF0ZSAqCitkcm1jZ3JwX2Nzc19hbGxvYyhzdHJ1Y3QgY2dyb3VwX3N1YnN5c19zdGF0
ZSAqcGFyZW50X2NzcykKK3sKKwlzdHJ1Y3QgZHJtY2dycCAqcGFyZW50ID0gY3NzX2RybWNncnAo
cGFyZW50X2Nzcyk7CisJc3RydWN0IGRybWNncnAgKmRybWNncnA7CisKKwlkcm1jZ3JwID0ga3ph
bGxvYyhzaXplb2Yoc3RydWN0IGRybWNncnApLCBHRlBfS0VSTkVMKTsKKwlpZiAoIWRybWNncnAp
CisJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOworCisJaWYgKCFwYXJlbnQpCisJCXJvb3RfZHJt
Y2dycCA9IGRybWNncnA7CisKKwlyZXR1cm4gJmRybWNncnAtPmNzczsKK30KKworc3RydWN0IGNm
dHlwZSBmaWxlc1tdID0geworCXsgfQkvKiB0ZXJtaW5hdGUgKi8KK307CisKK3N0cnVjdCBjZ3Jv
dXBfc3Vic3lzIGRybV9jZ3JwX3N1YnN5cyA9IHsKKwkuY3NzX2FsbG9jCT0gZHJtY2dycF9jc3Nf
YWxsb2MsCisJLmNzc19mcmVlCT0gZHJtY2dycF9jc3NfZnJlZSwKKwkuZWFybHlfaW5pdAk9IGZh
bHNlLAorCS5sZWdhY3lfY2Z0eXBlcwk9IGZpbGVzLAorCS5kZmxfY2Z0eXBlcwk9IGZpbGVzLAor
fTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
