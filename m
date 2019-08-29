Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 159F0A1177
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 08:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D7C89FC8;
	Thu, 29 Aug 2019 06:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731A689FA9;
 Thu, 29 Aug 2019 06:05:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P60zMQj+bQj4QjvRocDDnveHdK+D9t82WtmwIXh9jWdhL384CiVfc8DZCIl5kC9OGSXD63Pl1crwRzDPTEGsGN+yGNmrSBV05afPsb+F3voP9Cb07x7c54GShNekQVuv19noCMUb2X4wqvYGSonkmYpl2vPc9YLetQV4s5BO2jF2nHHCKweuqURsDhTSmuBkgIYoml5UX6XyONvEgtBn9JRg5UhOkMA7xNm1oYCHFySw79D7WmsHYdWF2lrHWh78cpa8+iqCp740V501iqol4w+dC2ezf34KpDRbWJCAvBbvEeRe5XltyXzYQlU9jJO4rXPj+u1Bk06vLgEylwNL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSYRmemse+JptUHNNHUIBq5v/9pLXrIRh71iG7WhWWk=;
 b=QiCITqSXNfFVlMCFf4MJhf7QGo6u5hEzA2+hb+YkPPOS/csxAT2QPSvYhrZa+99zm8eDW9/o2qwhbvP0xdc/uMjnJK1R1BrzbfTtyZLMUWtzVY73xWepbcdcw8oExdcjKgXy47u1k/a/McMWCjQyjDLME3gk0ROyOVI+gMtDSnsQcbmjCbrAqGJHE+9xfzU47XrnAnArrSE5t6TuurzuAa4YE+g1tLuA0YovGPESv4ay+ft+2smQQggctycCq3kB2++IpMK8iWv7OPLxR+2EqOSoBAij4qqqpAgfJBgIp5lVMXqVO8XxC8sxy9YGQLkL8hOo6q57owpzAIgjuDOFXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=cray.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0011.namprd12.prod.outlook.com (2603:10b6:610:57::21)
 by BYAPR12MB2712.namprd12.prod.outlook.com (2603:10b6:a03:68::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Thu, 29 Aug
 2019 06:05:56 +0000
Received: from CO1NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by CH2PR12CA0011.outlook.office365.com
 (2603:10b6:610:57::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18 via Frontend
 Transport; Thu, 29 Aug 2019 06:05:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT045.mail.protection.outlook.com (10.152.81.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 06:05:55 +0000
Received: from kho-5039A.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 29 Aug 2019
 01:05:48 -0500
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>,
 <lkaplan@cray.com>, <daniel@ffwll.ch>
Subject: [PATCH RFC v4 10/16] drm, cgroup: Add TTM buffer peak usage stats
Date: Thu, 29 Aug 2019 02:05:27 -0400
Message-ID: <20190829060533.32315-11-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829060533.32315-1-Kenny.Ho@amd.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39860400002)(2980300002)(428003)(189003)(199004)(126002)(2906002)(476003)(446003)(11346002)(2616005)(486006)(478600001)(305945005)(426003)(50466002)(336012)(8936002)(48376002)(70206006)(2870700001)(50226002)(81166006)(81156014)(186003)(26005)(8676002)(14444005)(53936002)(70586007)(2201001)(316002)(110136005)(4326008)(1076003)(86362001)(47776003)(76176011)(5660300002)(7696005)(51416003)(6666004)(356004)(53416004)(36756003)(921003)(1121003)(83996005)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2712; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b54cefe8-ef75-4b19-6c00-08d72c46f466
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BYAPR12MB2712; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2712:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2712FC6165DCBBC6F4F6081D83A20@BYAPR12MB2712.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: oUHkZpezSqzK6Stn8Fg7f7GgTkTE5ieEf3SQ9YCqWy/5UfHXn5MYm2Ch6tWkt6eNMLw5D22rM7WzO52WcCP3e/6Z/s3kQCR+lLkyBqheTMYIIH7jwFSjWrDde3M87IUwTu+lmnKgMJcQZHnbhh+xmKl9a2gDpIm2odUnX7tXD2E7VCDezSR87lfUWUbY1ivoj4zVciXaVfI2XiY/U51E8TfYU3qdKBxA5HIGY5dFhDo+++4QvCB6Wki/ROJlO2emcuH9AhEiYiz6mIONSVdtJi63mNbgt36qGOcfV4P/kg72wC/vprIHD0sYMpSlodsFRDbpSDKh8/taKOZxJ5rPf1xlYkW5LAYbyahIr/Ed93VMQf9A5w3E3K0MLyZP9mKHkt6EuoSB3v+FTj1usWkUj9NlWw7woVpNK9P2KqpTLtw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 06:05:55.1880 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b54cefe8-ef75-4b19-6c00-08d72c46f466
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2712
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSYRmemse+JptUHNNHUIBq5v/9pLXrIRh71iG7WhWWk=;
 b=MPsxzYwkwNnhTYZP1Ai5kIvOhvqJWMi4TD8pv1ehjhNtrDJ1AX6T2EseXMD5wkLagQSV421/0XKHQqmY49DWybnSL7nOf7qh6U/rCDgB7V/NmPNHEpcTPoNzLFJ9AygP2To6yd/aDZEZy+N8JrIfoh1cmwQLS5e6m8HHxuHpcaw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; cray.com; dkim=none (message not signed)
 header.d=none;cray.com; dmarc=permerror action=none header.from=amd.com;
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
bGludXgvY2dyb3VwX2RybS5oIHwgIDIgKysKIGtlcm5lbC9jZ3JvdXAvZHJtLmMgICAgICAgIHwg
MTkgKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmggYi9pbmNsdWRlL2xpbnV4
L2Nncm91cF9kcm0uaAppbmRleCA0YzI3OTRjOTMzM2QuLjk1NzllMmEwYjcxZCAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmgKKysrIGIvaW5jbHVkZS9saW51eC9jZ3JvdXBf
ZHJtLmgKQEAgLTIwLDYgKzIwLDcgQEAgZW51bSBkcm1jZ19yZXNfdHlwZSB7CiAJRFJNQ0dfVFlQ
RV9CT19DT1VOVCwKIAlEUk1DR19UWVBFX01FTSwKIAlEUk1DR19UWVBFX01FTV9FVklDVCwKKwlE
Uk1DR19UWVBFX01FTV9QRUFLLAogCV9fRFJNQ0dfVFlQRV9MQVNULAogfTsKIApAQCAtMzcsNiAr
MzgsNyBAQCBzdHJ1Y3QgZHJtY2dfZGV2aWNlX3Jlc291cmNlIHsKIAlzNjQJCQlib19zdGF0c19j
b3VudF9hbGxvY2F0ZWQ7CiAKIAlzNjQJCQltZW1fc3RhdHNbVFRNX1BMX1BSSVYrMV07CisJczY0
CQkJbWVtX3BlYWtzW1RUTV9QTF9QUklWKzFdOwogCXM2NAkJCW1lbV9zdGF0c19ldmljdDsKIH07
CiAKZGlmZiAtLWdpdCBhL2tlcm5lbC9jZ3JvdXAvZHJtLmMgYi9rZXJuZWwvY2dyb3VwL2RybS5j
CmluZGV4IDQ5NjBhOGQxZThmNC4uODk5ZGM0NDcyMmMzIDEwMDY0NAotLS0gYS9rZXJuZWwvY2dy
b3VwL2RybS5jCisrKyBiL2tlcm5lbC9jZ3JvdXAvZHJtLmMKQEAgLTE2Miw2ICsxNjIsMTMgQEAg
c3RhdGljIHZvaWQgZHJtY2dfcHJpbnRfc3RhdHMoc3RydWN0IGRybWNnX2RldmljZV9yZXNvdXJj
ZSAqZGRyLAogCWNhc2UgRFJNQ0dfVFlQRV9NRU1fRVZJQ1Q6CiAJCXNlcV9wcmludGYoc2YsICIl
bGxkXG4iLCBkZHItPm1lbV9zdGF0c19ldmljdCk7CiAJCWJyZWFrOworCWNhc2UgRFJNQ0dfVFlQ
RV9NRU1fUEVBSzoKKwkJZm9yIChpID0gMDsgaSA8PSBUVE1fUExfUFJJVjsgaSsrKSB7CisJCQlz
ZXFfcHJpbnRmKHNmLCAiJXM9JWxsZCAiLCB0dG1fcGxhY2VtZW50X25hbWVzW2ldLAorCQkJCQlk
ZHItPm1lbV9wZWFrc1tpXSk7CisJCX0KKwkJc2VxX3B1dHMoc2YsICJcbiIpOworCQlicmVhazsK
IAlkZWZhdWx0OgogCQlzZXFfcHV0cyhzZiwgIlxuIik7CiAJCWJyZWFrOwpAQCAtNDQzLDYgKzQ1
MCwxMiBAQCBzdHJ1Y3QgY2Z0eXBlIGZpbGVzW10gPSB7CiAJCS5wcml2YXRlID0gRFJNQ0dfQ1RG
X1BSSVYoRFJNQ0dfVFlQRV9NRU1fRVZJQ1QsCiAJCQkJCQlEUk1DR19GVFlQRV9TVEFUUyksCiAJ
fSwKKwl7CisJCS5uYW1lID0gIm1lbW9yeS5wZWFrcy5zdGF0cyIsCisJCS5zZXFfc2hvdyA9IGRy
bWNnX3NlcV9zaG93LAorCQkucHJpdmF0ZSA9IERSTUNHX0NURl9QUklWKERSTUNHX1RZUEVfTUVN
X1BFQUssCisJCQkJCQlEUk1DR19GVFlQRV9TVEFUUyksCisJfSwKIAl7IH0JLyogdGVybWluYXRl
ICovCiB9OwogCkBAIC02MTcsNiArNjMwLDggQEAgdm9pZCBkcm1jZ19jaGdfbWVtKHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqdGJvKQogCWZvciAoIDsgZHJtY2cgIT0gTlVMTDsgZHJtY2cgPSBk
cm1jZ19wYXJlbnQoZHJtY2cpKSB7CiAJCWRkciA9IGRybWNnLT5kZXZfcmVzb3VyY2VzW2Rldklk
eF07CiAJCWRkci0+bWVtX3N0YXRzW21lbV90eXBlXSArPSBzaXplOworCQlkZHItPm1lbV9wZWFr
c1ttZW1fdHlwZV0gPSBtYXgoZGRyLT5tZW1fcGVha3NbbWVtX3R5cGVdLAorCQkJCWRkci0+bWVt
X3N0YXRzW21lbV90eXBlXSk7CiAJfQogCW11dGV4X3VubG9jaygmZGV2LT5kcm1jZ19tdXRleCk7
CiB9CkBAIC02NjgsNiArNjgzLDEwIEBAIHZvaWQgZHJtY2dfbWVtX3RyYWNrX21vdmUoc3RydWN0
IHR0bV9idWZmZXJfb2JqZWN0ICpvbGRfYm8sIGJvb2wgZXZpY3QsCiAJCWRkci0+bWVtX3N0YXRz
W29sZF9tZW1fdHlwZV0gLT0gbW92ZV9pbl9ieXRlczsKIAkJZGRyLT5tZW1fc3RhdHNbbmV3X21l
bV90eXBlXSArPSBtb3ZlX2luX2J5dGVzOwogCisJCWRkci0+bWVtX3BlYWtzW25ld19tZW1fdHlw
ZV0gPSBtYXgoCisJCQkJZGRyLT5tZW1fcGVha3NbbmV3X21lbV90eXBlXSwKKwkJCQlkZHItPm1l
bV9zdGF0c1tuZXdfbWVtX3R5cGVdKTsKKwogCQlpZiAoZXZpY3QpCiAJCQlkZHItPm1lbV9zdGF0
c19ldmljdCsrOwogCX0KLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
