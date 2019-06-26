Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF9556D3F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 17:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB576E46B;
	Wed, 26 Jun 2019 15:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739016E462;
 Wed, 26 Jun 2019 15:05:39 +0000 (UTC)
Received: from MWHPR12CA0058.namprd12.prod.outlook.com (2603:10b6:300:103::20)
 by CY4PR12MB1751.namprd12.prod.outlook.com (2603:10b6:903:121::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16; Wed, 26 Jun
 2019 15:05:37 +0000
Received: from DM3NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by MWHPR12CA0058.outlook.office365.com
 (2603:10b6:300:103::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.16 via Frontend
 Transport; Wed, 26 Jun 2019 15:05:36 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT041.mail.protection.outlook.com (10.152.83.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2032.15 via Frontend Transport; Wed, 26 Jun 2019 15:05:36 +0000
Received: from kho-5039A.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 26 Jun 2019
 10:05:31 -0500
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <joseph.greathouse@amd.com>, <jsparks@cray.com>, <lkaplan@cray.com>
Subject: [RFC PATCH v3 06/11] drm,
 cgroup: Add GEM buffer allocation count stats
Date: Wed, 26 Jun 2019 11:05:17 -0400
Message-ID: <20190626150522.11618-7-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626150522.11618-1-Kenny.Ho@amd.com>
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(346002)(376002)(396003)(2980300002)(428003)(199004)(189003)(53416004)(426003)(77096007)(36756003)(26005)(5660300002)(336012)(186003)(2201001)(70586007)(70206006)(86362001)(47776003)(8936002)(68736007)(4326008)(8676002)(110136005)(316002)(1076003)(81156014)(81166006)(72206003)(478600001)(486006)(50466002)(76176011)(305945005)(50226002)(2616005)(48376002)(476003)(126002)(11346002)(6666004)(446003)(2906002)(53936002)(7696005)(51416003)(14444005)(356004)(2870700001)(921003)(1121003)(2101003)(83996005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1751; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77ed1547-d3dc-44cd-e4b1-08d6fa47be98
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1751; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1751:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1751D3D5B555690FF5B3CCFB83E20@CY4PR12MB1751.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 00808B16F3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +XMNoG4oqpvuqahA2k6RjT4YJDlnccDQJToDnhvOiKarrneRZXcLuDqSxQ6rshwCYlpbIw98mPW8xVYWGK09AfJI3I7dxIetzOQ9tjvnHHEq3ovbV1rr10VhzgWXBaV0WHMx2MqRA7QKbIUHu+LhJlc+LkgP1fp4JvWO7mDfBeOi+5b8lNHyEap8WUBnhV0GlBqQWwr/SwqQ1l2XYWglXN43OJ6HcAEi8g0kq2VGBoRuwrvGKVWv3mC9X4ZsQ3AnAQ/XXrRzaErKLJPOnuyJ8Zc0KASRtH+wdkNuzQnWFvq4+G/sFpXV5X8ZeAzcL/BA5AvXhVqC892SBIBJ3J3esxTEL4ZvJw0YAlu7iPqLd6kTiChJXvcQ1xs81KxJY6FYd2Y9Mt46e40pIqqZr39YTm7+QCLO2OSkvlDGbDPHylM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2019 15:05:36.2493 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ed1547-d3dc-44cd-e4b1-08d6fa47be98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1751
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oy70+PsSIFW3ia6hp19FBTQnzI35FoEFw66qRWkUfP8=;
 b=uJfjBQ+Xvo2Juc0ogtNJZAPsvKsUmZFBlTjLia6ENxHTcskhU+1cdO/4RWOOW5qBnX8u4O9nN/CeT0UE33XcMPBppI2ATKWLmWXeUrdOBmuCbfHVMalarqlLNO621/W2fT+8CUJTjotND0xD2dL5kOANDiscdmJvyndzPEhtqoo=
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

ZHJtLmJ1ZmZlci5jb3VudC5zdGF0cwogICAgICAgIEEgcmVhZC1vbmx5IGZsYXQta2V5ZWQgZmls
ZSB3aGljaCBleGlzdHMgb24gYWxsIGNncm91cHMuICBFYWNoCiAgICAgICAgZW50cnkgaXMga2V5
ZWQgYnkgdGhlIGRybSBkZXZpY2UncyBtYWpvcjptaW5vci4KCiAgICAgICAgVG90YWwgbnVtYmVy
IG9mIEdFTSBidWZmZXIgYWxsb2NhdGVkLgoKQ2hhbmdlLUlkOiBJZDNlMTgwOWQ1ZmVlODU2MmU0
N2E3ZDJiOTYxNjg4OTU2ZDg0NGVjNgpTaWduZWQtb2ZmLWJ5OiBLZW5ueSBIbyA8S2VubnkuSG9A
YW1kLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L2Nncm91cF9kcm0uaCB8ICAyICsrCiBrZXJuZWwv
Y2dyb3VwL2RybS5jICAgICAgICB8IDIzICsrKysrKysrKysrKysrKysrKysrLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmggYi9pbmNsdWRlL2xpbnV4L2Nncm91cF9kcm0uaApp
bmRleCAxMjZjMTU2ZmZkNzAuLmU0NDAwYjIxYWI4ZSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51
eC9jZ3JvdXBfZHJtLmgKKysrIGIvaW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmgKQEAgLTIwLDYg
KzIwLDggQEAgc3RydWN0IGRybWNncnBfZGV2aWNlX3Jlc291cmNlIHsKIAogCXNpemVfdAkJCWJv
X3N0YXRzX3BlYWtfYWxsb2NhdGVkOwogCXNpemVfdAkJCWJvX2xpbWl0c19wZWFrX2FsbG9jYXRl
ZDsKKworCXM2NAkJCWJvX3N0YXRzX2NvdW50X2FsbG9jYXRlZDsKIH07CiAKIHN0cnVjdCBkcm1j
Z3JwIHsKZGlmZiAtLWdpdCBhL2tlcm5lbC9jZ3JvdXAvZHJtLmMgYi9rZXJuZWwvY2dyb3VwL2Ry
bS5jCmluZGV4IDI2NTAwODE5NzY1NC4uOTE0NGY5M2I4NTFmIDEwMDY0NAotLS0gYS9rZXJuZWwv
Y2dyb3VwL2RybS5jCisrKyBiL2tlcm5lbC9jZ3JvdXAvZHJtLmMKQEAgLTMzLDYgKzMzLDcgQEAg
c3RydWN0IGRybWNncnBfZGV2aWNlIHsKIGVudW0gZHJtY2dycF9yZXNfdHlwZSB7CiAJRFJNQ0dS
UF9UWVBFX0JPX1RPVEFMLAogCURSTUNHUlBfVFlQRV9CT19QRUFLLAorCURSTUNHUlBfVFlQRV9C
T19DT1VOVCwKIH07CiAKIGVudW0gZHJtY2dycF9maWxlX3R5cGUgewpAQCAtMTQ1LDYgKzE0Niw5
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBkcm1jZ3JwX3ByaW50X3N0YXRzKHN0cnVjdCBkcm1jZ3Jw
X2RldmljZV9yZXNvdXJjZSAqZGRyLAogCWNhc2UgRFJNQ0dSUF9UWVBFX0JPX1BFQUs6CiAJCXNl
cV9wcmludGYoc2YsICIlenVcbiIsIGRkci0+Ym9fc3RhdHNfcGVha19hbGxvY2F0ZWQpOwogCQli
cmVhazsKKwljYXNlIERSTUNHUlBfVFlQRV9CT19DT1VOVDoKKwkJc2VxX3ByaW50ZihzZiwgIiVs
bGRcbiIsIGRkci0+Ym9fc3RhdHNfY291bnRfYWxsb2NhdGVkKTsKKwkJYnJlYWs7CiAJZGVmYXVs
dDoKIAkJc2VxX3B1dHMoc2YsICJcbiIpOwogCQlicmVhazsKQEAgLTM5Niw2ICs0MDAsMTIgQEAg
c3RydWN0IGNmdHlwZSBmaWxlc1tdID0gewogCQkucHJpdmF0ZSA9IERSTUNHX0NURl9QUklWKERS
TUNHUlBfVFlQRV9CT19QRUFLLAogCQkJCQkJRFJNQ0dSUF9GVFlQRV9MSU1JVCksCiAJfSwKKwl7
CisJCS5uYW1lID0gImJ1ZmZlci5jb3VudC5zdGF0cyIsCisJCS5zZXFfc2hvdyA9IGRybWNncnBf
Ym9fc2hvdywKKwkJLnByaXZhdGUgPSBEUk1DR19DVEZfUFJJVihEUk1DR1JQX1RZUEVfQk9fQ09V
TlQsCisJCQkJCQlEUk1DR1JQX0ZUWVBFX1NUQVRTKSwKKwl9LAogCXsgfQkvKiB0ZXJtaW5hdGUg
Ki8KIH07CiAKQEAgLTUxOCw2ICs1MjgsOCBAQCB2b2lkIGRybWNncnBfY2hnX2JvX2FsbG9jKHN0
cnVjdCBkcm1jZ3JwICpkcm1jZ3JwLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCiAJCWlmIChk
ZHItPmJvX3N0YXRzX3BlYWtfYWxsb2NhdGVkIDwgKHNpemVfdClzaXplKQogCQkJZGRyLT5ib19z
dGF0c19wZWFrX2FsbG9jYXRlZCA9IChzaXplX3Qpc2l6ZTsKKworCQlkZHItPmJvX3N0YXRzX2Nv
dW50X2FsbG9jYXRlZCsrOwogCX0KIAltdXRleF91bmxvY2soJmtub3duX2RybWNncnBfZGV2c1tk
ZXZJZHhdLT5tdXRleCk7CiB9CkBAIC01MjYsMTUgKzUzOCwyMCBAQCBFWFBPUlRfU1lNQk9MKGRy
bWNncnBfY2hnX2JvX2FsbG9jKTsKIHZvaWQgZHJtY2dycF91bmNoZ19ib19hbGxvYyhzdHJ1Y3Qg
ZHJtY2dycCAqZHJtY2dycCwgc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJc2l6ZV90IHNpemUp
CiB7CisJc3RydWN0IGRybWNncnBfZGV2aWNlX3Jlc291cmNlICpkZHI7CiAJaW50IGRldklkeCA9
IGRldi0+cHJpbWFyeS0+aW5kZXg7CiAKIAlpZiAoZHJtY2dycCA9PSBOVUxMIHx8IGtub3duX2Ry
bWNncnBfZGV2c1tkZXZJZHhdID09IE5VTEwpCiAJCXJldHVybjsKIAogCW11dGV4X2xvY2soJmtu
b3duX2RybWNncnBfZGV2c1tkZXZJZHhdLT5tdXRleCk7Ci0JZm9yICggOyBkcm1jZ3JwICE9IE5V
TEw7IGRybWNncnAgPSBwYXJlbnRfZHJtY2dycChkcm1jZ3JwKSkKLQkJZHJtY2dycC0+ZGV2X3Jl
c291cmNlc1tkZXZJZHhdLT5ib19zdGF0c190b3RhbF9hbGxvY2F0ZWQKLQkJCS09IChzNjQpc2l6
ZTsKKwlmb3IgKCA7IGRybWNncnAgIT0gTlVMTDsgZHJtY2dycCA9IHBhcmVudF9kcm1jZ3JwKGRy
bWNncnApKSB7CisJCWRkciA9IGRybWNncnAtPmRldl9yZXNvdXJjZXNbZGV2SWR4XTsKKworCQlk
ZHItPmJvX3N0YXRzX3RvdGFsX2FsbG9jYXRlZCAtPSAoczY0KXNpemU7CisKKwkJZGRyLT5ib19z
dGF0c19jb3VudF9hbGxvY2F0ZWQtLTsKKwl9CiAJbXV0ZXhfdW5sb2NrKCZrbm93bl9kcm1jZ3Jw
X2RldnNbZGV2SWR4XS0+bXV0ZXgpOwogfQogRVhQT1JUX1NZTUJPTChkcm1jZ3JwX3VuY2hnX2Jv
X2FsbG9jKTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
