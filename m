Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B0016308
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 13:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCA56E7B7;
	Tue,  7 May 2019 11:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810085.outbound.protection.outlook.com [40.107.81.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6726E7B7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 11:45:42 +0000 (UTC)
Received: from CY4PR12CA0048.namprd12.prod.outlook.com (2603:10b6:903:129::34)
 by BN6PR12MB1139.namprd12.prod.outlook.com (2603:10b6:404:1d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.12; Tue, 7 May
 2019 11:45:40 +0000
Received: from CO1NAM03FT043.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by CY4PR12CA0048.outlook.office365.com
 (2603:10b6:903:129::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 7 May 2019 11:45:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT043.mail.protection.outlook.com (10.152.81.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 7 May 2019 11:45:39 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 7 May 2019
 06:45:38 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <Christian.Koenig@amd.com>, <Prike.Liang@amd.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/display: use ttm_eu_reserve_buffers instead of
 amdgpu_bo_reserve
Date: Tue, 7 May 2019 19:45:31 +0800
Message-ID: <20190507114531.26089-2-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507114531.26089-1-david1.zhou@amd.com>
References: <20190507114531.26089-1-david1.zhou@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(376002)(346002)(39860400002)(136003)(396003)(2980300002)(428003)(189003)(199004)(2201001)(68736007)(316002)(336012)(356004)(86362001)(50226002)(6666004)(11346002)(23676004)(66574012)(426003)(446003)(7696005)(110136005)(305945005)(36756003)(126002)(50466002)(70586007)(70206006)(4326008)(476003)(2616005)(47776003)(8936002)(186003)(486006)(77096007)(2870700001)(72206003)(14444005)(1076003)(5660300002)(5820100001)(26005)(53416004)(478600001)(2906002)(53936002)(8676002)(81166006)(76176011)(81156014)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1139; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fb29475-6607-4e62-c97a-08d6d2e1876e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN6PR12MB1139; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1139:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1139EB2D0B4BBE6191CB6D77B4310@BN6PR12MB1139.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-Forefront-PRVS: 0030839EEE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: DddHhpF8vmZotctPOuQ68sl04DqDZkxjG3AC5OOIyH2zI9u6gkYPcp9alff/O0jWDPTYWJtaM/zpzTZMoUkp6jAftvRDVUTwB4wFZyGr+7DeVbbJ9Ar8HR2m3azbQc9b1FwSIw9xKcQSB9+0SbM+ezvhSVJPd/dtivbiQ60DWGbJL5NYRhYENHxLeih5JRa7KfLwG8Bpll+HOIimmhwqPDzHwbXLyglhqsNILt3Da04YFNYAQB2QeVzGxgsbkbXPdyd7hvinBdAET92hyV4pkk002ZM1JpRScey0ThPdeLA7EtWE6Tib6UpEwvLZCsrCCaRizj+a3gah7LrdPjqaswOVxEMELXK7tJuPj3S6fqU32zyNlCwufmhgy7uap38FkW3GEbRID88V5qdMjndYr/EcMoYUTET3uzj2bt9+zV4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2019 11:45:39.9051 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb29475-6607-4e62-c97a-08d6d2e1876e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1139
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/Xhccrei5fSQ334N5V8NxnwK3o+GpD5t+cXvw4sj4I=;
 b=CzgZD25FDjg6CbRmfdMSyUvGJGByyMqEif4rmNXvlvqYh14O/Ut9GeeaB3WR/L/oHqGfZjMYWV8+fTqCyWgTyxbzDf/j85Orl2jmXezD0i/0BVxR6iuAkSi12VSij1XU8XD1zbcJjJAYS+MWz3G4T6PLZPLKUPHA3YViaDyS5ww=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YWRkIHRpY2tldCBmb3IgZGlzcGxheSBibywgc28gdGhhdCBpdCBjYW4gcHJlZW1wdCBidXN5IGJv
LgoKQ2hhbmdlLUlkOiBJOWYwMzFjZGNjODI2N2RlMDBlODE5YWUzMDNiYWEwYTUyZGY4ZWJiOQpT
aWduZWQtb2ZmLWJ5OiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhvdUBhbWQuY29tPgpSZXZpZXdl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIC4u
Li9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDIxICsrKysrKysr
KysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jCmluZGV4IGFjMjJmNzM1MWE0Mi4uM2YzNjc3MDk0NmFiIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTQxNzYsNiAr
NDE3Niw5IEBAIHN0YXRpYyBpbnQgZG1fcGxhbmVfaGVscGVyX3ByZXBhcmVfZmIoc3RydWN0IGRy
bV9wbGFuZSAqcGxhbmUsCiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXY7CiAJc3RydWN0IGFt
ZGdwdV9ibyAqcmJvOwogCXN0cnVjdCBkbV9wbGFuZV9zdGF0ZSAqZG1fcGxhbmVfc3RhdGVfbmV3
LCAqZG1fcGxhbmVfc3RhdGVfb2xkOworCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsKKwlzdHJ1Y3Qg
dHRtX3ZhbGlkYXRlX2J1ZmZlciB0djsKKwlzdHJ1Y3Qgd3dfYWNxdWlyZV9jdHggdGlja2V0Owog
CXVpbnQ2NF90IHRpbGluZ19mbGFnczsKIAl1aW50MzJfdCBkb21haW47CiAJaW50IHI7CkBAIC00
MTkyLDkgKzQxOTUsMTcgQEAgc3RhdGljIGludCBkbV9wbGFuZV9oZWxwZXJfcHJlcGFyZV9mYihz
dHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAlvYmogPSBuZXdfc3RhdGUtPmZiLT5vYmpbMF07CiAJ
cmJvID0gZ2VtX3RvX2FtZGdwdV9ibyhvYmopOwogCWFkZXYgPSBhbWRncHVfdHRtX2FkZXYocmJv
LT50Ym8uYmRldik7Ci0JciA9IGFtZGdwdV9ib19yZXNlcnZlKHJibywgZmFsc2UpOwotCWlmICh1
bmxpa2VseShyICE9IDApKQorCUlOSVRfTElTVF9IRUFEKCZsaXN0KTsKKworCXR2LmJvID0gJnJi
by0+dGJvOworCXR2Lm51bV9zaGFyZWQgPSAxOworCWxpc3RfYWRkKCZ0di5oZWFkLCAmbGlzdCk7
CisKKwlyID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygmdGlja2V0LCAmbGlzdCwgZmFsc2UsIE5V
TEwpOworCWlmIChyKSB7CisJCWRldl9lcnIoYWRldi0+ZGV2LCAiZmFpbCB0byByZXNlcnZlIGJv
ICglZClcbiIsIHIpOwogCQlyZXR1cm4gcjsKKwl9CiAKIAlpZiAocGxhbmUtPnR5cGUgIT0gRFJN
X1BMQU5FX1RZUEVfQ1VSU09SKQogCQlkb21haW4gPSBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRf
ZG9tYWlucyhhZGV2KTsKQEAgLTQyMDUsMjEgKzQyMTYsMjEgQEAgc3RhdGljIGludCBkbV9wbGFu
ZV9oZWxwZXJfcHJlcGFyZV9mYihzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAlpZiAodW5saWtl
bHkociAhPSAwKSkgewogCQlpZiAociAhPSAtRVJFU1RBUlRTWVMpCiAJCQlEUk1fRVJST1IoIkZh
aWxlZCB0byBwaW4gZnJhbWVidWZmZXIgd2l0aCBlcnJvciAlZFxuIiwgcik7Ci0JCWFtZGdwdV9i
b191bnJlc2VydmUocmJvKTsKKwkJdHRtX2V1X2JhY2tvZmZfcmVzZXJ2YXRpb24oJnRpY2tldCwg
Jmxpc3QpOwogCQlyZXR1cm4gcjsKIAl9CiAKIAlyID0gYW1kZ3B1X3R0bV9hbGxvY19nYXJ0KCZy
Ym8tPnRibyk7CiAJaWYgKHVubGlrZWx5KHIgIT0gMCkpIHsKIAkJYW1kZ3B1X2JvX3VucGluKHJi
byk7Ci0JCWFtZGdwdV9ib191bnJlc2VydmUocmJvKTsKKwkJdHRtX2V1X2JhY2tvZmZfcmVzZXJ2
YXRpb24oJnRpY2tldCwgJmxpc3QpOwogCQlEUk1fRVJST1IoIiVwIGJpbmQgZmFpbGVkXG4iLCBy
Ym8pOwogCQlyZXR1cm4gcjsKIAl9CiAKIAlhbWRncHVfYm9fZ2V0X3RpbGluZ19mbGFncyhyYm8s
ICZ0aWxpbmdfZmxhZ3MpOwogCi0JYW1kZ3B1X2JvX3VucmVzZXJ2ZShyYm8pOworCXR0bV9ldV9i
YWNrb2ZmX3Jlc2VydmF0aW9uKCZ0aWNrZXQsICZsaXN0KTsKIAogCWFmYi0+YWRkcmVzcyA9IGFt
ZGdwdV9ib19ncHVfb2Zmc2V0KHJibyk7CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
