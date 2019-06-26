Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3220056D3E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 17:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BED76E467;
	Wed, 26 Jun 2019 15:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780051.outbound.protection.outlook.com [40.107.78.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F37C6E462;
 Wed, 26 Jun 2019 15:05:41 +0000 (UTC)
Received: from MWHPR12CA0058.namprd12.prod.outlook.com (2603:10b6:300:103::20)
 by CY4PR12MB1701.namprd12.prod.outlook.com (2603:10b6:903:121::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16; Wed, 26 Jun
 2019 15:05:39 +0000
Received: from DM3NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by MWHPR12CA0058.outlook.office365.com
 (2603:10b6:300:103::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.16 via Frontend
 Transport; Wed, 26 Jun 2019 15:05:39 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT041.mail.protection.outlook.com (10.152.83.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2032.15 via Frontend Transport; Wed, 26 Jun 2019 15:05:38 +0000
Received: from kho-5039A.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 26 Jun 2019
 10:05:33 -0500
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <joseph.greathouse@amd.com>, <jsparks@cray.com>, <lkaplan@cray.com>
Subject: [RFC PATCH v3 08/11] drm, cgroup: Add TTM buffer peak usage stats
Date: Wed, 26 Jun 2019 11:05:19 -0400
Message-ID: <20190626150522.11618-9-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626150522.11618-1-Kenny.Ho@amd.com>
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(396003)(376002)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(110136005)(186003)(26005)(77096007)(316002)(4326008)(70586007)(70206006)(5660300002)(51416003)(7696005)(50466002)(53936002)(47776003)(86362001)(36756003)(2201001)(48376002)(76176011)(53416004)(8936002)(81166006)(14444005)(68736007)(72206003)(305945005)(81156014)(8676002)(2870700001)(486006)(2906002)(6666004)(478600001)(1076003)(356004)(476003)(126002)(426003)(50226002)(336012)(2616005)(446003)(11346002)(921003)(83996005)(2101003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1701; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cbdd77e-30bf-47f3-0f36-08d6fa47c01f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1701; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1701:
X-Microsoft-Antispam-PRVS: <CY4PR12MB17013AE43CD2A7C0E5335EE583E20@CY4PR12MB1701.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 00808B16F3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: wI8Jq3oRrXKJO6ZGXAfL0HdaLcEjwXUPls+9ZTrADgy4rHhIQDtrucjv4SbSpHm22pb2sUEpAWhziVlfSGU/EyL4JUsaLQ7E9pxItC+cBTaV7NpOsQsHNWy6OfuVueyjBVhXZqLLqhhEhH1CDvby3sWxmd5DWQpNKZ4dpxAIwyzVBXzISkhZ9SIUucsYZ8L2NIVfl0yvCWlzmzOyVEWWmSziK7vpoedyrOOVJoT47i8yBmTy7/wc4kP2HpUYG0+KdRcf7p0YUI0nme9nt8ftP48sxv9WXk/XLcX1BkMAEkcin/GezSnfHJatxp3qcg0t+xKBFe+Dr5kf8JhNZrHczWPy12JHmw8jJ85rly9WP9XLbgPQyaM0eFodfnDe7OG9IKlsC/KCNLPB5C92scJkHYm0P05Qb/OWt4sgXCW/44c=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2019 15:05:38.8373 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbdd77e-30bf-47f3-0f36-08d6fa47c01f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1701
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1V3DSHiL6emfOa52C6ir4zWzrOls98N76v201ss0MIY=;
 b=jhIGRbtrGqdtPIIgBw999Ft4O1R2LDhrnaDbnRYYE0ypwIjwatEtaqKuhEjMJdoNRO9JZXWcSRxpHwneQ4IWCeUrlWsB6pkTPHWOMirklcJWVDtc1sP5FUrvzB2ycI1TV8lnz76ORgPn6alIjObaln78KiU6nTghx5bR9HWjagQ=
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

ZHJtLm1lbW9yeS5wZWFrLnN0YXRzCiAgICAgICAgQSByZWFkLW9ubHkgbmVzdGVkLWtleWVkIGZp
bGUgd2hpY2ggZXhpc3RzIG9uIGFsbCBjZ3JvdXBzLgogICAgICAgIEVhY2ggZW50cnkgaXMga2V5
ZWQgYnkgdGhlIGRybSBkZXZpY2UncyBtYWpvcjptaW5vci4gIFRoZQogICAgICAgIGZvbGxvd2lu
ZyBuZXN0ZWQga2V5cyBhcmUgZGVmaW5lZC4KCiAgICAgICAgICA9PT09PT0gICAgICAgICA9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAgICAgICAgICBzeXN0
ZW0gICAgICAgICBQZWFrIGhvc3QgbWVtb3J5IHVzZWQKICAgICAgICAgIHR0ICAgICAgICAgICAg
IFBlYWsgaG9zdCBtZW1vcnkgdXNlZCBieSB0aGUgZGV2aWNlIChHVFQvR0FSVCkKICAgICAgICAg
IHZyYW0gICAgICAgICAgIFBlYWsgVmlkZW8gUkFNIHVzZWQgYnkgdGhlIGRybSBkZXZpY2UKICAg
ICAgICAgIHByaXYgICAgICAgICAgIE90aGVyIGRybSBkZXZpY2Ugc3BlY2lmaWMgbWVtb3J5IHBl
YWsgdXNhZ2UKICAgICAgICAgID09PT09PSAgICAgICAgID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KCiAgICAgICAgUmVhZGluZyByZXR1cm5zIHRoZSBmb2xs
b3dpbmc6OgoKICAgICAgICAyMjY6MCBzeXN0ZW09MCB0dD0wIHZyYW09MCBwcml2PTAKICAgICAg
ICAyMjY6MSBzeXN0ZW09MCB0dD05MDM1Nzc2IHZyYW09MTc3Njg0NDggcHJpdj0xNjgwOTk4NAog
ICAgICAgIDIyNjoyIHN5c3RlbT0wIHR0PTkwMzU3NzYgdnJhbT0xNzc2ODQ0OCBwcml2PTE2ODA5
OTg0CgpDaGFuZ2UtSWQ6IEk5ODZlNDQ1MzM4NDhmNjY0MTE0NjViZGQ1MjEwNWU3ODEwNWE3MDlh
ClNpZ25lZC1vZmYtYnk6IEtlbm55IEhvIDxLZW5ueS5Ib0BhbWQuY29tPgotLS0KIGluY2x1ZGUv
bGludXgvY2dyb3VwX2RybS5oIHwgIDEgKwoga2VybmVsL2Nncm91cC9kcm0uYyAgICAgICAgfCAy
MCArKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmggYi9pbmNsdWRlL2xpbnV4
L2Nncm91cF9kcm0uaAppbmRleCAxNDFiZWEwNmY3NGMuLjkyMjUyOTY0MWRmNSAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmgKKysrIGIvaW5jbHVkZS9saW51eC9jZ3JvdXBf
ZHJtLmgKQEAgLTI1LDYgKzI1LDcgQEAgc3RydWN0IGRybWNncnBfZGV2aWNlX3Jlc291cmNlIHsK
IAlzNjQJCQlib19zdGF0c19jb3VudF9hbGxvY2F0ZWQ7CiAKIAlzNjQJCQltZW1fc3RhdHNbVFRN
X1BMX1BSSVYrMV07CisJczY0CQkJbWVtX3BlYWtzW1RUTV9QTF9QUklWKzFdOwogCXM2NAkJCW1l
bV9zdGF0c19ldmljdDsKIH07CiAKZGlmZiAtLWdpdCBhL2tlcm5lbC9jZ3JvdXAvZHJtLmMgYi9r
ZXJuZWwvY2dyb3VwL2RybS5jCmluZGV4IDVhZWU0MmE2MjhjMS4uNWY1ZmE2YTJiMDY4IDEwMDY0
NAotLS0gYS9rZXJuZWwvY2dyb3VwL2RybS5jCisrKyBiL2tlcm5lbC9jZ3JvdXAvZHJtLmMKQEAg
LTM4LDYgKzM4LDcgQEAgZW51bSBkcm1jZ3JwX3Jlc190eXBlIHsKIAlEUk1DR1JQX1RZUEVfQk9f
Q09VTlQsCiAJRFJNQ0dSUF9UWVBFX01FTSwKIAlEUk1DR1JQX1RZUEVfTUVNX0VWSUNULAorCURS
TUNHUlBfVFlQRV9NRU1fUEVBSywKIH07CiAKIGVudW0gZHJtY2dycF9maWxlX3R5cGUgewpAQCAt
MTcxLDYgKzE3MiwxMyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZHJtY2dycF9wcmludF9zdGF0cyhz
dHJ1Y3QgZHJtY2dycF9kZXZpY2VfcmVzb3VyY2UgKmRkciwKIAljYXNlIERSTUNHUlBfVFlQRV9N
RU1fRVZJQ1Q6CiAJCXNlcV9wcmludGYoc2YsICIlbGxkXG4iLCBkZHItPm1lbV9zdGF0c19ldmlj
dCk7CiAJCWJyZWFrOworCWNhc2UgRFJNQ0dSUF9UWVBFX01FTV9QRUFLOgorCQlmb3IgKGkgPSAw
OyBpIDw9IFRUTV9QTF9QUklWOyBpKyspIHsKKwkJCXNlcV9wcmludGYoc2YsICIlcz0lbGxkICIs
IHR0bV9wbGFjZW1lbnRfbmFtZXNbaV0sCisJCQkJCWRkci0+bWVtX3BlYWtzW2ldKTsKKwkJfQor
CQlzZXFfcHV0cyhzZiwgIlxuIik7CisJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCXNlcV9wdXRzKHNm
LCAiXG4iKTsKIAkJYnJlYWs7CkBAIC00NDAsNiArNDQ4LDEyIEBAIHN0cnVjdCBjZnR5cGUgZmls
ZXNbXSA9IHsKIAkJLnByaXZhdGUgPSBEUk1DR19DVEZfUFJJVihEUk1DR1JQX1RZUEVfTUVNX0VW
SUNULAogCQkJCQkJRFJNQ0dSUF9GVFlQRV9TVEFUUyksCiAJfSwKKwl7CisJCS5uYW1lID0gIm1l
bW9yeS5wZWFrcy5zdGF0cyIsCisJCS5zZXFfc2hvdyA9IGRybWNncnBfYm9fc2hvdywKKwkJLnBy
aXZhdGUgPSBEUk1DR19DVEZfUFJJVihEUk1DR1JQX1RZUEVfTUVNX1BFQUssCisJCQkJCQlEUk1D
R1JQX0ZUWVBFX1NUQVRTKSwKKwl9LAogCXsgfQkvKiB0ZXJtaW5hdGUgKi8KIH07CiAKQEAgLTYw
OCw2ICs2MjIsOCBAQCB2b2lkIGRybWNncnBfY2hnX21lbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKnRibykKIAlmb3IgKCA7IGRybWNncnAgIT0gTlVMTDsgZHJtY2dycCA9IHBhcmVudF9kcm1j
Z3JwKGRybWNncnApKSB7CiAJCWRkciA9IGRybWNncnAtPmRldl9yZXNvdXJjZXNbZGV2SWR4XTsK
IAkJZGRyLT5tZW1fc3RhdHNbbWVtX3R5cGVdICs9IHNpemU7CisJCWRkci0+bWVtX3BlYWtzW21l
bV90eXBlXSA9IG1heChkZHItPm1lbV9wZWFrc1ttZW1fdHlwZV0sCisJCQkJZGRyLT5tZW1fc3Rh
dHNbbWVtX3R5cGVdKTsKIAl9CiAJbXV0ZXhfdW5sb2NrKCZrbm93bl9kcm1jZ3JwX2RldnNbZGV2
SWR4XS0+bXV0ZXgpOwogfQpAQCAtNjYyLDYgKzY3OCwxMCBAQCB2b2lkIGRybWNncnBfbWVtX3Ry
YWNrX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpvbGRfYm8sIGJvb2wgZXZpY3QsCiAJ
CWRkci0+bWVtX3N0YXRzW29sZF9tZW1fdHlwZV0gLT0gbW92ZV9pbl9ieXRlczsKIAkJZGRyLT5t
ZW1fc3RhdHNbbmV3X21lbV90eXBlXSArPSBtb3ZlX2luX2J5dGVzOwogCisJCWRkci0+bWVtX3Bl
YWtzW25ld19tZW1fdHlwZV0gPSBtYXgoCisJCQkJZGRyLT5tZW1fcGVha3NbbmV3X21lbV90eXBl
XSwKKwkJCQlkZHItPm1lbV9zdGF0c1tuZXdfbWVtX3R5cGVdKTsKKwogCQlpZiAoZXZpY3QpCiAJ
CQlkZHItPm1lbV9zdGF0c19ldmljdCsrOwogCX0KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
