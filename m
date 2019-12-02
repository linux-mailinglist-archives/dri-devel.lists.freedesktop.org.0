Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE15810EFC0
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E98E6E128;
	Mon,  2 Dec 2019 19:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760080.outbound.protection.outlook.com [40.107.76.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB0C6E128;
 Mon,  2 Dec 2019 19:05:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpEOwRL4v1TGetrhGxA2i+XFc610mbln/rW/kx9Hjwoo//70BS3L8z1IaVCsqYPxwsepxNbxO6CpQ88bi3/T4esqZRpe/NPab6NxU6BzvH4gfCMpMANnUb60+9ipqejMh5DA8wpl8mFyHVvHqpetIc7tNRq2nU64efgCZOI61MtszX0EvhT1xSrOH6YfB4dA9HOWY+CtUMPhcIJq2JLjJdCDKb76gEoRilto982GbnYz0l6mz4bR67A777ptdFP0Aq8e0oaaJ02qGddN8UNW+poEKRAihlRM697eR8cob7wmH6pcJ4y1jis8b+UniAsMy4/HCkzldK91ESsXrz8WZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2aWJGRSwQ5vJq2KfMboSu7jgBMW4tOjWyjhXfLglI2M=;
 b=gxmVSd2fN0QnS1kOvEKDhPRwIpYeSxrKlpch8ufxfMJqEpOjTObtbO50ZltderIeY3eZuxqnwuopn4pyvbPV0rie2JD/c7efCVvW9tJ0IiGIkHrPpb2XvKWOxTEPmlYybhSWZaJebUwsNVRjHjoIwTr4QImzh3jHcUrvKbw+qDg9++eOpORcf28ng0co5p1E8k+2WhtaYrpVu2ajhCTBT7t+G61WWh0cA+oM4oB2xaBesuRnKVkYwWbtVq8mtZv4o0S5w6Xa4TiPxIIoP5jnabHsw4LfoFdWVsGYQSMUXej2bFgfXmTQKo1EAVgG67+ah5GahoNwnf3skcjzHtUU/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0062.namprd12.prod.outlook.com (2603:10b6:0:56::30) by
 MN2PR12MB3391.namprd12.prod.outlook.com (2603:10b6:208:c3::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Mon, 2 Dec 2019 19:05:00 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::201) by DM3PR12CA0062.outlook.office365.com
 (2603:10b6:0:56::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20 via Frontend
 Transport; Mon, 2 Dec 2019 19:05:00 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Mon, 2 Dec 2019 19:04:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 2 Dec 2019
 13:04:59 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 2 Dec 2019
 13:04:58 -0600
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 2 Dec 2019 13:04:58 -0600
From: "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [RESEND 1/2] drm: Add support for DP 1.4 Compliance edid corruption
 test 4.2.2.6
Date: Mon, 2 Dec 2019 14:04:48 -0500
Message-ID: <20191202190449.2864-2-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20191202190449.2864-1-Jerry.Zuo@amd.com>
References: <20191202190449.2864-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(428003)(189003)(199004)(48376002)(54906003)(1076003)(2616005)(70586007)(478600001)(26005)(426003)(305945005)(50226002)(86362001)(8936002)(81156014)(81166006)(70206006)(36756003)(336012)(8676002)(4326008)(2201001)(16586007)(6666004)(186003)(356004)(5660300002)(11346002)(7696005)(50466002)(2906002)(316002)(446003)(51416003)(110136005)(47776003)(76176011)(53416004)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3391; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62322f1b-aa40-4603-84d2-08d7775a8769
X-MS-TrafficTypeDiagnostic: MN2PR12MB3391:
X-Microsoft-Antispam-PRVS: <MN2PR12MB339136C6D1E1CBBF4ACD12F4E5430@MN2PR12MB3391.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 0239D46DB6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QDWFep+QOTkCum2pHCybE94cPjOv7CkctarwfOObFIYFFemffzf4NK9dy86Za+Osc3Xn7si48uCe41Ju8UT4QoIeJLZC4Za++22cIZ4Dldh+nHMCpWpLbyHUsRTN4/H6baq/C0bVqmVhWdK/6GGebIZmyWni2Al7Z7x2pqBj0++8w7yO+pnTfu4vluTHT2bPQVA4I9x3C/S6ICKnlsbth68v90sq7coxvnVJK+dBja/jh+mJg3iCaW/y0cPLAdTK/OEUVPRleHRhz9Ln5TLFZ/O8Ee7l6LgbSsK5H5CKrBjNrg6o0K68DV11txM8XwSpP/OtyoBuFeDbLf0tNEROMIdjvzXhazQzNJ/35XB9oD1+MhKlNRrejOYsSUs8hvh685uBgniDfwMUupcg5nZ/fi+Vxy6BwdCdhzjAZMUO1mN+PYdm66IYCi5eZLbARk1m
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2019 19:04:59.8395 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62322f1b-aa40-4603-84d2-08d7775a8769
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3391
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2aWJGRSwQ5vJq2KfMboSu7jgBMW4tOjWyjhXfLglI2M=;
 b=onKN8LhvgKFqclEufbrAhC0RdNWEjkNDILW1/lDqFtTrzts2oCf5DJR/wy2X3eQlBHA0/ifcWqnCr8U2PxccwJUe5jVGe1rZQJiDIT72qxUDtFM2JQrR3cuL7rf1whpPS0zqod8IRIcv2Eks9HNcNUdY14l9PR2Jr9O2HOGkI70=
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
Cc: rodrigo.siqueira@amd.com, manasi.d.navare@intel.com, Jerry.Zuo@amd.com,
 Alexander.Deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RFAgMS40IGVkaWQgY29ycnVwdGlvbiB0ZXN0IHJlcXVpcmVzIHNvdXJjZSBEVVQgdG8gd3JpdGUg
Y2FsY3VsYXRlZApDUkMsIG5vdCB0aGUgY29ycnVwdGVkIENSQyBmcm9tIHJlZmVyZW5jZSBzaW5r
LgoKUmV0dXJuIHRoZSBjYWxjdWxhdGVkIENSQyBiYWNrLCBhbmQgaW5pdGlhdGUgdGhlIHJlcXVp
cmVkIHNlcXVlbmNlLgoKLXYyOiBIYXZlIHNlcGFyYXRlIHJvdXRpbmUgZm9yIHJldHVybmluZyBy
ZWFsIENSQwoKLXYzOiBSZXdyaXRlIGNoZWNrc3VtIGNvbXB1dGF0aW9uIHJvdXRpbmUgdG8gYXZv
aWQgZHVwbGljYXRlZCBjb2RlLgogICAgIFJlbmFtZSB0byBhdm9pZCBjb25mdXNpb24KCi12NDog
Rml4IGEgbWlub3IgdHlwby4KClNpZ25lZC1vZmYtYnk6IEplcnJ5IChGYW5nemhpKSBadW8gPEpl
cnJ5Llp1b0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRs
YW5kQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyB8IDM2ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2RybV9l
ZGlkLmMgICAgICB8IDE4ICsrKysrKysrKysrKysrKy0tLQogaW5jbHVkZS9kcm0vZHJtX2Nvbm5l
Y3Rvci5oICAgICB8ICA3ICsrKysrKysKIGluY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCAgICAg
fCAgMyArKysKIDQgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwppbmRleCBmZmM2OGQzMDVhZmUuLjIyYTBlOTY2ZWE5
ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCkBAIC0zMzYsNiArMzM2LDQyIEBAIGludCBkcm1f
ZHBfZHBjZF9yZWFkX2xpbmtfc3RhdHVzKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCiB9CiBFWFBP
UlRfU1lNQk9MKGRybV9kcF9kcGNkX3JlYWRfbGlua19zdGF0dXMpOwogCisvKioKKyAgKiBkcm1f
ZHBfc2VuZF9yZWFsX2VkaWRfY2hlY2tzdW0oKSAtIHNlbmQgYmFjayByZWFsIGVkaWQgY2hlY2tz
dW0gdmFsdWUKKyAgKiBAYXV4OiBEaXNwbGF5UG9ydCBBVVggY2hhbm5lbAorICAqIEByZWFsX2Vk
aWRfY2hlY2tzdW06IHJlYWwgZWRpZCBjaGVja3N1bSBmb3IgdGhlIGxhc3QgYmxvY2sKKyAgKgor
ICAqIFJldHVybnMgdHJ1ZSBvbiBzdWNjZXNzCisgICovCitib29sIGRybV9kcF9zZW5kX3JlYWxf
ZWRpZF9jaGVja3N1bShzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1OCByZWFsX2VkaWRfY2hlY2tzdW0pCit7CisgICAgICAgIHU4IGxpbmtf
ZWRpZF9yZWFkID0gMCwgYXV0b190ZXN0X3JlcSA9IDA7CisgICAgICAgIHU4IHRlc3RfcmVzcCA9
IDA7CisKKyAgICAgICAgZHJtX2RwX2RwY2RfcmVhZChhdXgsIERQX0RFVklDRV9TRVJWSUNFX0lS
UV9WRUNUT1IsICZhdXRvX3Rlc3RfcmVxLCAxKTsKKyAgICAgICAgYXV0b190ZXN0X3JlcSAmPSBE
UF9BVVRPTUFURURfVEVTVF9SRVFVRVNUOworCisgICAgICAgIGRybV9kcF9kcGNkX3JlYWQoYXV4
LCBEUF9URVNUX1JFUVVFU1QsICZsaW5rX2VkaWRfcmVhZCwgMSk7CisgICAgICAgIGxpbmtfZWRp
ZF9yZWFkICY9IERQX1RFU1RfTElOS19FRElEX1JFQUQ7CisKKyAgICAgICAgaWYgKCFhdXRvX3Rl
c3RfcmVxIHx8ICFsaW5rX2VkaWRfcmVhZCkgeworICAgICAgICAgICAgICAgIERSTV9ERUJVR19L
TVMoIlNvdXJjZSBEVVQgZG9lcyBub3Qgc3VwcG9ydCBURVNUX0VESURfUkVBRFxuIik7CisgICAg
ICAgICAgICAgICAgcmV0dXJuIGZhbHNlOworICAgICAgICB9CisKKyAgICAgICAgZHJtX2RwX2Rw
Y2Rfd3JpdGUoYXV4LCBEUF9ERVZJQ0VfU0VSVklDRV9JUlFfVkVDVE9SLCAmYXV0b190ZXN0X3Jl
cSwgMSk7CisKKyAgICAgICAgLyogc2VuZCBiYWNrIGNoZWNrc3VtIGZvciB0aGUgbGFzdCBlZGlk
IGV4dGVuc2lvbiBibG9jayBkYXRhICovCisgICAgICAgIGRybV9kcF9kcGNkX3dyaXRlKGF1eCwg
RFBfVEVTVF9FRElEX0NIRUNLU1VNLCAmcmVhbF9lZGlkX2NoZWNrc3VtLCAxKTsKKworICAgICAg
ICB0ZXN0X3Jlc3AgfD0gRFBfVEVTVF9FRElEX0NIRUNLU1VNX1dSSVRFOworICAgICAgICBkcm1f
ZHBfZHBjZF93cml0ZShhdXgsIERQX1RFU1RfUkVTUE9OU0UsICZ0ZXN0X3Jlc3AsIDEpOworCisg
ICAgICAgIHJldHVybiB0cnVlOworfQorRVhQT1JUX1NZTUJPTChkcm1fZHBfc2VuZF9yZWFsX2Vk
aWRfY2hlY2tzdW0pOworCiAvKioKICAqIGRybV9kcF9saW5rX3Byb2JlKCkgLSBwcm9iZSBhIERp
c3BsYXlQb3J0IGxpbmsgZm9yIGNhcGFiaWxpdGllcwogICogQGF1eDogRGlzcGxheVBvcnQgQVVY
IGNoYW5uZWwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9lZGlkLmMKaW5kZXggODJhNGNlZWQzZmNmLi5mZjY0ZTVmMWZlYjYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZWRpZC5jCkBAIC0xMzQ4LDEwICsxMzQ4LDE5IEBAIHN0YXRpYyBpbnQgZHJtX2VkaWRf
YmxvY2tfY2hlY2tzdW0oY29uc3QgdTggKnJhd19lZGlkKQogewogCWludCBpOwogCXU4IGNzdW0g
PSAwOwotCWZvciAoaSA9IDA7IGkgPCBFRElEX0xFTkdUSDsgaSsrKQorCisJZm9yIChpID0gMDsg
aSA8IEVESURfTEVOR1RIIC0gMTsgaSsrKQogCQljc3VtICs9IHJhd19lZGlkW2ldOwogCi0JcmV0
dXJuIGNzdW07CisJcmV0dXJuICgweDEwMCAtIGNzdW0pOworfQorCitzdGF0aWMgYm9vbCBkcm1f
ZWRpZF9ibG9ja19jaGVja3N1bV9kaWZmKGNvbnN0IHU4ICpyYXdfZWRpZCwgdTggcmVhbF9jaGVj
a3N1bSkKK3sKKwlpZiAocmF3X2VkaWRbRURJRF9MRU5HVEggLSAxXSAhPSByZWFsX2NoZWNrc3Vt
KQorCQlyZXR1cm4gdHJ1ZTsKKwllbHNlCisJCXJldHVybiBmYWxzZTsKIH0KIAogc3RhdGljIGJv
b2wgZHJtX2VkaWRfaXNfemVybyhjb25zdCB1OCAqaW5fZWRpZCwgaW50IGxlbmd0aCkKQEAgLTE0
MDksNyArMTQxOCw3IEBAIGJvb2wgZHJtX2VkaWRfYmxvY2tfdmFsaWQodTggKnJhd19lZGlkLCBp
bnQgYmxvY2ssIGJvb2wgcHJpbnRfYmFkX2VkaWQsCiAJfQogCiAJY3N1bSA9IGRybV9lZGlkX2Js
b2NrX2NoZWNrc3VtKHJhd19lZGlkKTsKLQlpZiAoY3N1bSkgeworCWlmIChkcm1fZWRpZF9ibG9j
a19jaGVja3N1bV9kaWZmKHJhd19lZGlkLCBjc3VtKSkgewogCQlpZiAoZWRpZF9jb3JydXB0KQog
CQkJKmVkaWRfY29ycnVwdCA9IHRydWU7CiAKQEAgLTE1NzIsNiArMTU4MSw5IEBAIHN0YXRpYyB2
b2lkIGNvbm5lY3Rvcl9iYWRfZWRpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAog
CQkJICAgICAgIHByZWZpeCwgRFVNUF9QUkVGSVhfTk9ORSwgMTYsIDEsCiAJCQkgICAgICAgYmxv
Y2ssIEVESURfTEVOR1RILCBmYWxzZSk7CiAJfQorCisJLyogQ2FsY3VsYXRlIHJlYWwgY2hlY2tz
dW0gZm9yIHRoZSBsYXN0IGVkaWQgZXh0ZW5zaW9uIGJsb2NrIGRhdGEgKi8KKwljb25uZWN0b3It
PnJlYWxfZWRpZF9jaGVja3N1bSA9IGRybV9lZGlkX2Jsb2NrX2NoZWNrc3VtKGVkaWQgKyBlZGlk
WzB4N2VdICogRURJRF9MRU5HVEgpOwogfQogCiAvKiBHZXQgb3ZlcnJpZGUgb3IgZmlybXdhcmUg
RURJRCAqLwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oIGIvaW5jbHVk
ZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCmluZGV4IDY4MWNiNTkwZjk1Mi4uZWIwZDhjN2IzNWZkIDEw
MDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKKysrIGIvaW5jbHVkZS9kcm0v
ZHJtX2Nvbm5lY3Rvci5oCkBAIC0xMzQ1LDYgKzEzNDUsMTMgQEAgc3RydWN0IGRybV9jb25uZWN0
b3IgewogCSAqIHJldjEuMSA0LjIuMi42CiAJICovCiAJYm9vbCBlZGlkX2NvcnJ1cHQ7CisJLyoq
CisgICAgICAgICAqIEByZWFsX2VkaWRfY2hlY2tzdW06IHJlYWwgZWRpZCBjaGVja3N1bSB2YWx1
ZSBmb3IgY29ycnVwdGVkIGVkaWQgYmxvY2suCisgICAgICAgICAqIFJlcXVpcmVkIGluIERpc3Bs
YXlwb3J0IDEuNCBjb21wbGlhbmNlIHRlc3RpbmcKKyAgICAgICAgICogcmV2MS4xIDQuMi4yLjYK
KyAgICAgICAgICovCisgICAgICAgIHVpbnQ4X3QgcmVhbF9lZGlkX2NoZWNrc3VtOworCiAKIAkv
KiogQGRlYnVnZnNfZW50cnk6IGRlYnVnZnMgZGlyZWN0b3J5IGZvciB0aGlzIGNvbm5lY3RvciAq
LwogCXN0cnVjdCBkZW50cnkgKmRlYnVnZnNfZW50cnk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKaW5kZXggNWE3
OTUwNzVkNWRhLi44NDcwOWQ3ODEwZjggMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9o
ZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKQEAgLTEzODMsNiArMTM4
Myw5IEBAIHN0YXRpYyBpbmxpbmUgc3NpemVfdCBkcm1fZHBfZHBjZF93cml0ZWIoc3RydWN0IGRy
bV9kcF9hdXggKmF1eCwKIGludCBkcm1fZHBfZHBjZF9yZWFkX2xpbmtfc3RhdHVzKHN0cnVjdCBk
cm1fZHBfYXV4ICphdXgsCiAJCQkJIHU4IHN0YXR1c1tEUF9MSU5LX1NUQVRVU19TSVpFXSk7CiAK
K2Jvb2wgZHJtX2RwX3NlbmRfcmVhbF9lZGlkX2NoZWNrc3VtKHN0cnVjdCBkcm1fZHBfYXV4ICph
dXgsCisJCQkJICAgIHU4IHJlYWxfZWRpZF9jaGVja3N1bSk7CisKIC8qCiAgKiBEaXNwbGF5UG9y
dCBsaW5rCiAgKi8KLS0gCjIuMTQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
