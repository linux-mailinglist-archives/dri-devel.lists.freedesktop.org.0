Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A161D56D33
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 17:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91F76E45F;
	Wed, 26 Jun 2019 15:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750085.outbound.protection.outlook.com [40.107.75.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CB66E456;
 Wed, 26 Jun 2019 15:05:32 +0000 (UTC)
Received: from MWHPR12CA0058.namprd12.prod.outlook.com (2603:10b6:300:103::20)
 by CY4PR1201MB0021.namprd12.prod.outlook.com (2603:10b6:910:1a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16; Wed, 26 Jun
 2019 15:05:30 +0000
Received: from DM3NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by MWHPR12CA0058.outlook.office365.com
 (2603:10b6:300:103::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.16 via Frontend
 Transport; Wed, 26 Jun 2019 15:05:30 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT041.mail.protection.outlook.com (10.152.83.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2032.15 via Frontend Transport; Wed, 26 Jun 2019 15:05:29 +0000
Received: from kho-5039A.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 26 Jun 2019
 10:05:26 -0500
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <joseph.greathouse@amd.com>, <jsparks@cray.com>, <lkaplan@cray.com>
Subject: [RFC PATCH v3 01/11] cgroup: Introduce cgroup for drm subsystem
Date: Wed, 26 Jun 2019 11:05:12 -0400
Message-ID: <20190626150522.11618-2-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626150522.11618-1-Kenny.Ho@amd.com>
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(396003)(136003)(2980300002)(428003)(189003)(199004)(2616005)(77096007)(81156014)(26005)(186003)(8936002)(305945005)(2201001)(53936002)(86362001)(8676002)(81166006)(36756003)(2870700001)(50226002)(4326008)(110136005)(47776003)(316002)(5024004)(14444005)(53416004)(356004)(5660300002)(50466002)(6666004)(2906002)(48376002)(1076003)(7696005)(72206003)(426003)(76176011)(11346002)(70586007)(446003)(70206006)(478600001)(476003)(486006)(51416003)(68736007)(126002)(336012)(921003)(1121003)(83996005)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0021; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a14e9f9e-d050-4a0d-5060-08d6fa47ba88
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR1201MB0021; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0021:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00219720F8CD3DAC8950E16583E20@CY4PR1201MB0021.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 00808B16F3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +Qeg+w7YJ5KoXzLpoJo0Xvde4SYeofwx/Mt3lKrz/vdX4bdCJBULC1/VBCWiKJlb7wyw/MV1r6m5UFm4Bi3wOO2L6ojkjTK6zdGR6vBCdWpA79bcQhjr8NRgBBY3u6qXFPU88meIGv4Xoyzv43wWCuyZCD1Z8AmF0zNdHwS7PWiodNjeOYeTogK0cR4CYzzO9jighKNAP9maKL21AgMGxCMUV6Z1QBgzftvoxZ2yifLnqD7wUoWmhBKLe19sfimsmLmJ+ewmj4zaRPAehRxeRZ/Ud0H+OM9JGK70ZRqCWeodvTWkJT6lQhILKT1rJTEZZImWCul8MWsaJluBDYawSrUUAHgjeEp5KbtvgXGIYLuZuDIB4iqPlFrOkn88lxxReaE6Qu/SPIP6K5bGSUiEmwH1v1LkJeB5wQLuxLXHWH4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2019 15:05:29.3147 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a14e9f9e-d050-4a0d-5060-08d6fa47ba88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0021
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8Vkkh6EI+Jvy+fTB+fueJFxoa5pBliRjRlepUuST+I=;
 b=mKcJYS/q+sq1YxpbmeiFzXFZ/qgWUbH/8UQ6pqPYJrtGqBG8nRqyk5MsQlFr/7OfhxFIyzv498EdF+OlAFn+PYelqyHMv6Rzd2zgL2PInLKFf6LCbU0Ht+ML7y/fMRm5LMCYXBEje6j9pesUN0UsHD0iRsGK+zaHzOUBA9Lv6+s=
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

Q2hhbmdlLUlkOiBJNjgzMGQzOTkwZjYzZjBjMTNhYmViYTI5YjFkMzMwY2YyODg4MjgzMQpTaWdu
ZWQtb2ZmLWJ5OiBLZW5ueSBIbyA8S2VubnkuSG9AYW1kLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4
L2Nncm91cF9kcm0uaCAgICB8IDc2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiBpbmNsdWRlL2xpbnV4L2Nncm91cF9zdWJzeXMuaCB8ICA0ICsrCiBpbml0L0tjb25maWcgICAg
ICAgICAgICAgICAgICB8ICA1ICsrKwoga2VybmVsL2Nncm91cC9NYWtlZmlsZSAgICAgICAgfCAg
MSArCiBrZXJuZWwvY2dyb3VwL2RybS5jICAgICAgICAgICB8IDQyICsrKysrKysrKysrKysrKysr
KysKIDUgZmlsZXMgY2hhbmdlZCwgMTI4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBpbmNsdWRlL2xpbnV4L2Nncm91cF9kcm0uaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGtlcm5lbC9j
Z3JvdXAvZHJtLmMKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Nncm91cF9kcm0uaCBiL2lu
Y2x1ZGUvbGludXgvY2dyb3VwX2RybS5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAwMC4uOTkyOGU2MDAzN2E1Ci0tLSAvZGV2L251bGwKKysrIGIvaW5jbHVkZS9saW51eC9j
Z3JvdXBfZHJtLmgKQEAgLTAsMCArMSw3NiBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IE1JVAorICogQ29weXJpZ2h0IDIwMTkgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgorICov
CisjaWZuZGVmIF9DR1JPVVBfRFJNX0gKKyNkZWZpbmUgX0NHUk9VUF9EUk1fSAorCisjaWZkZWYg
Q09ORklHX0NHUk9VUF9EUk0KKworI2luY2x1ZGUgPGxpbnV4L2Nncm91cC5oPgorCitzdHJ1Y3Qg
ZHJtY2dycCB7CisJc3RydWN0IGNncm91cF9zdWJzeXNfc3RhdGUJY3NzOworfTsKKworc3RhdGlj
IGlubGluZSBzdHJ1Y3QgZHJtY2dycCAqY3NzX2RybWNncnAoc3RydWN0IGNncm91cF9zdWJzeXNf
c3RhdGUgKmNzcykKK3sKKwlyZXR1cm4gY3NzID8gY29udGFpbmVyX29mKGNzcywgc3RydWN0IGRy
bWNncnAsIGNzcykgOiBOVUxMOworfQorCitzdGF0aWMgaW5saW5lIHN0cnVjdCBkcm1jZ3JwICpk
cm1jZ3JwX2Zyb20oc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKQoreworCXJldHVybiBjc3NfZHJt
Y2dycCh0YXNrX2dldF9jc3ModGFzaywgZHJtX2NncnBfaWQpKTsKK30KKworc3RhdGljIGlubGlu
ZSBzdHJ1Y3QgZHJtY2dycCAqZ2V0X2RybWNncnAoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKQor
eworCXN0cnVjdCBjZ3JvdXBfc3Vic3lzX3N0YXRlICpjc3MgPSB0YXNrX2dldF9jc3ModGFzaywg
ZHJtX2NncnBfaWQpOworCisJaWYgKGNzcykKKwkJY3NzX2dldChjc3MpOworCisJcmV0dXJuIGNz
c19kcm1jZ3JwKGNzcyk7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCBwdXRfZHJtY2dycChzdHJ1
Y3QgZHJtY2dycCAqZHJtY2dycCkKK3sKKwlpZiAoZHJtY2dycCkKKwkJY3NzX3B1dCgmZHJtY2dy
cC0+Y3NzKTsKK30KKworc3RhdGljIGlubGluZSBzdHJ1Y3QgZHJtY2dycCAqcGFyZW50X2RybWNn
cnAoc3RydWN0IGRybWNncnAgKmNnKQoreworCXJldHVybiBjc3NfZHJtY2dycChjZy0+Y3NzLnBh
cmVudCk7Cit9CisKKyNlbHNlIC8qIENPTkZJR19DR1JPVVBfRFJNICovCisKK3N0cnVjdCBkcm1j
Z3JwIHsKK307CisKK3N0YXRpYyBpbmxpbmUgc3RydWN0IGRybWNncnAgKmNzc19kcm1jZ3JwKHN0
cnVjdCBjZ3JvdXBfc3Vic3lzX3N0YXRlICpjc3MpCit7CisJcmV0dXJuIE5VTEw7Cit9CisKK3N0
YXRpYyBpbmxpbmUgc3RydWN0IGRybWNncnAgKmRybWNncnBfZnJvbShzdHJ1Y3QgdGFza19zdHJ1
Y3QgKnRhc2spCit7CisJcmV0dXJuIE5VTEw7Cit9CisKK3N0YXRpYyBpbmxpbmUgc3RydWN0IGRy
bWNncnAgKmdldF9kcm1jZ3JwKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaykKK3sKKwlyZXR1cm4g
TlVMTDsKK30KKworc3RhdGljIGlubGluZSB2b2lkIHB1dF9kcm1jZ3JwKHN0cnVjdCBkcm1jZ3Jw
ICpkcm1jZ3JwKQoreworfQorCitzdGF0aWMgaW5saW5lIHN0cnVjdCBkcm1jZ3JwICpwYXJlbnRf
ZHJtY2dycChzdHJ1Y3QgZHJtY2dycCAqY2cpCit7CisJcmV0dXJuIE5VTEw7Cit9CisKKyNlbmRp
ZgkvKiBDT05GSUdfQ0dST1VQX0RSTSAqLworI2VuZGlmCS8qIF9DR1JPVVBfRFJNX0ggKi8KZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvY2dyb3VwX3N1YnN5cy5oIGIvaW5jbHVkZS9saW51eC9j
Z3JvdXBfc3Vic3lzLmgKaW5kZXggYWNiNzdkY2ZmM2I0Li5kZGVkYWQ4MDllOGIgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvbGludXgvY2dyb3VwX3N1YnN5cy5oCisrKyBiL2luY2x1ZGUvbGludXgvY2dy
b3VwX3N1YnN5cy5oCkBAIC02MSw2ICs2MSwxMCBAQCBTVUJTWVMocGlkcykKIFNVQlNZUyhyZG1h
KQogI2VuZGlmCiAKKyNpZiBJU19FTkFCTEVEKENPTkZJR19DR1JPVVBfRFJNKQorU1VCU1lTKGRy
bSkKKyNlbmRpZgorCiAvKgogICogVGhlIGZvbGxvd2luZyBzdWJzeXN0ZW1zIGFyZSBub3Qgc3Vw
cG9ydGVkIG9uIHRoZSBkZWZhdWx0IGhpZXJhcmNoeS4KICAqLwpkaWZmIC0tZ2l0IGEvaW5pdC9L
Y29uZmlnIGIvaW5pdC9LY29uZmlnCmluZGV4IGQ0N2NiNzdhMjIwZS4uMGIwZjExMmViMjNiIDEw
MDY0NAotLS0gYS9pbml0L0tjb25maWcKKysrIGIvaW5pdC9LY29uZmlnCkBAIC04MzksNiArODM5
LDExIEBAIGNvbmZpZyBDR1JPVVBfUkRNQQogCSAgQXR0YWNoaW5nIHByb2Nlc3NlcyB3aXRoIGFj
dGl2ZSBSRE1BIHJlc291cmNlcyB0byB0aGUgY2dyb3VwCiAJICBoaWVyYXJjaHkgaXMgYWxsb3dl
ZCBldmVuIGlmIGNhbiBjcm9zcyB0aGUgaGllcmFyY2h5J3MgbGltaXQuCiAKK2NvbmZpZyBDR1JP
VVBfRFJNCisJYm9vbCAiRFJNIGNvbnRyb2xsZXIgKEVYUEVSSU1FTlRBTCkiCisJaGVscAorCSAg
UHJvdmlkZXMgYWNjb3VudGluZyBhbmQgZW5mb3JjZW1lbnQgb2YgcmVzb3VyY2VzIGluIHRoZSBE
Uk0gc3Vic3lzdGVtLgorCiBjb25maWcgQ0dST1VQX0ZSRUVaRVIKIAlib29sICJGcmVlemVyIGNv
bnRyb2xsZXIiCiAJaGVscApkaWZmIC0tZ2l0IGEva2VybmVsL2Nncm91cC9NYWtlZmlsZSBiL2tl
cm5lbC9jZ3JvdXAvTWFrZWZpbGUKaW5kZXggYmZjZGFlODk2MTIyLi42YWYxNGJkOTMwNTAgMTAw
NjQ0Ci0tLSBhL2tlcm5lbC9jZ3JvdXAvTWFrZWZpbGUKKysrIGIva2VybmVsL2Nncm91cC9NYWtl
ZmlsZQpAQCAtNCw1ICs0LDYgQEAgb2JqLXkgOj0gY2dyb3VwLm8gcnN0YXQubyBuYW1lc3BhY2Uu
byBjZ3JvdXAtdjEubwogb2JqLSQoQ09ORklHX0NHUk9VUF9GUkVFWkVSKSArPSBmcmVlemVyLm8K
IG9iai0kKENPTkZJR19DR1JPVVBfUElEUykgKz0gcGlkcy5vCiBvYmotJChDT05GSUdfQ0dST1VQ
X1JETUEpICs9IHJkbWEubworb2JqLSQoQ09ORklHX0NHUk9VUF9EUk0pICs9IGRybS5vCiBvYmot
JChDT05GSUdfQ1BVU0VUUykgKz0gY3B1c2V0Lm8KIG9iai0kKENPTkZJR19DR1JPVVBfREVCVUcp
ICs9IGRlYnVnLm8KZGlmZiAtLWdpdCBhL2tlcm5lbC9jZ3JvdXAvZHJtLmMgYi9rZXJuZWwvY2dy
b3VwL2RybS5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNjZjYjFk
ZGEwMjNkCi0tLSAvZGV2L251bGwKKysrIGIva2VybmVsL2Nncm91cC9kcm0uYwpAQCAtMCwwICsx
LDQyIEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUCisvLyBDb3B5cmlnaHQgMjAx
OSBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuCisjaW5jbHVkZSA8bGludXgvc2xhYi5oPgor
I2luY2x1ZGUgPGxpbnV4L2Nncm91cC5oPgorI2luY2x1ZGUgPGxpbnV4L2Nncm91cF9kcm0uaD4K
Kworc3RhdGljIHN0cnVjdCBkcm1jZ3JwICpyb290X2RybWNncnAgX19yZWFkX21vc3RseTsKKwor
c3RhdGljIHZvaWQgZHJtY2dycF9jc3NfZnJlZShzdHJ1Y3QgY2dyb3VwX3N1YnN5c19zdGF0ZSAq
Y3NzKQoreworCXN0cnVjdCBkcm1jZ3JwICpkcm1jZ3JwID0gY3NzX2RybWNncnAoY3NzKTsKKwor
CWtmcmVlKGRybWNncnApOworfQorCitzdGF0aWMgc3RydWN0IGNncm91cF9zdWJzeXNfc3RhdGUg
KgorZHJtY2dycF9jc3NfYWxsb2Moc3RydWN0IGNncm91cF9zdWJzeXNfc3RhdGUgKnBhcmVudF9j
c3MpCit7CisJc3RydWN0IGRybWNncnAgKnBhcmVudCA9IGNzc19kcm1jZ3JwKHBhcmVudF9jc3Mp
OworCXN0cnVjdCBkcm1jZ3JwICpkcm1jZ3JwOworCisJZHJtY2dycCA9IGt6YWxsb2Moc2l6ZW9m
KHN0cnVjdCBkcm1jZ3JwKSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFkcm1jZ3JwKQorCQlyZXR1cm4g
RVJSX1BUUigtRU5PTUVNKTsKKworCWlmICghcGFyZW50KQorCQlyb290X2RybWNncnAgPSBkcm1j
Z3JwOworCisJcmV0dXJuICZkcm1jZ3JwLT5jc3M7Cit9CisKK3N0cnVjdCBjZnR5cGUgZmlsZXNb
XSA9IHsKKwl7IH0JLyogdGVybWluYXRlICovCit9OworCitzdHJ1Y3QgY2dyb3VwX3N1YnN5cyBk
cm1fY2dycF9zdWJzeXMgPSB7CisJLmNzc19hbGxvYwk9IGRybWNncnBfY3NzX2FsbG9jLAorCS5j
c3NfZnJlZQk9IGRybWNncnBfY3NzX2ZyZWUsCisJLmVhcmx5X2luaXQJPSBmYWxzZSwKKwkubGVn
YWN5X2NmdHlwZXMJPSBmaWxlcywKKwkuZGZsX2NmdHlwZXMJPSBmaWxlcywKK307Ci0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
