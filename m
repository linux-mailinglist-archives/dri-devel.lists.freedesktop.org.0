Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 727267296E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 10:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE58A6E48C;
	Wed, 24 Jul 2019 08:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820077.outbound.protection.outlook.com [40.107.82.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02F06E48C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 08:02:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfOQYhV53TAMz1FFXScCFo3zPoIOOOZTXaVMXCmvjIDhXcUc4UQTozL/69VwjvzaxaisSUrsQDRA/Lrku7D16TcDYTgJVgN0os8upz/hZvI6nV1yR1WqtYHer+3OOp8CPt//I8f5vkxLY6ULJ1ZuY2UYWi9vBoBaQXjDzpjDZL/O0Sa2g8/e7XAzgm5UJNypAYIQ+9uG8TFqSO/MYGmss3p+rGUiTufMOQrtjMD26dcT/o35ekPH5arn1cyJfu9Me/TCRjF30KUWI76RWZoXgwTkX3CldEe26V89R8SycG8PEKa1GBWIU820+L/VsjmEdteeiwi/llifyWCOVbNXKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ckf0VPOn4ruoTvihxBmncx+KHdw6szUKg0b4dbZWACo=;
 b=MDGyQRJFq3R9Yqdx6K4yabYeWl5LoM89G/xKYQMIHCIMhIa8cwVTRTUk7NlrRKWeZp+ZAI6ufg+kyag+0QN32nT8SujnEjw/XOdKNqsGGauKny6cbjliJ3t2KPbJwsP3YYl1CVYAv8aUq6nh7pGT+AnlU1YjNuwt2974K6Thfuj1ZyXYikGaeSds2HEgFz4uULFjNI+i1MTL1zM/khB7muJfDV/VqoSsr4klCOHbKBK3NU9DbEXEY3EOjheAda73bg2enjS68aeOAhqYid6YWrM9iW7KCaNmWx4mvB+FJmP9rvOS/DL4A84SGDfiyfPXD5AFd/b57qCSMyHB8GjHwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0076.namprd12.prod.outlook.com (2603:10b6:0:57::20) by
 BN6PR12MB1572.namprd12.prod.outlook.com (2603:10b6:405:3::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 08:02:12 +0000
Received: from DM3NAM03FT018.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by DM3PR12CA0076.outlook.office365.com
 (2603:10b6:0:57::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.14 via Frontend
 Transport; Wed, 24 Jul 2019 08:02:11 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT018.mail.protection.outlook.com (10.152.82.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 24 Jul 2019 08:02:11 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 24 Jul 2019
 03:02:09 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm] libdrm: wrap new flexible syncobj query interface
Date: Wed, 24 Jul 2019 16:01:58 +0800
Message-ID: <20190724080158.13878-1-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(136003)(346002)(2980300002)(428003)(199004)(189003)(478600001)(6666004)(26005)(316002)(53416004)(356004)(186003)(8676002)(54906003)(305945005)(336012)(486006)(70586007)(6916009)(70206006)(5820100001)(2616005)(4326008)(86362001)(81156014)(476003)(81166006)(126002)(2351001)(2906002)(23676004)(426003)(47776003)(1076003)(7696005)(50226002)(66574012)(2870700001)(36756003)(8936002)(53936002)(68736007)(50466002)(14444005)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1572; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9681730-d3aa-40fc-6d37-08d7100d3b99
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1572; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1572:
X-Microsoft-Antispam-PRVS: <BN6PR12MB15721E6280D26E568D12E7ACB4C60@BN6PR12MB1572.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:199;
X-Forefront-PRVS: 0108A997B2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /zchNKfCeMDi4u1m5Wa2tcMz4r6FwLpHPogoFnAQdzFEEH68YgFJ0D3ZAwKpx8/CTJdcqiIJ6a0ps0dwDy27HZNqTntsUAUDSJf+A3/wTcMCW4JgKSz3FFH7EwPc/HhB8ix5MgovskOimqa8AbFkz6wjd5KrZESf00lb3FyD0F+1CQ8or59CiI3LA2P2ZRMgdn75aCPeZKrIDS5jvk5K1kx8T99PdCK7RZk/QFLk4OU7H7wfNG9ywtCpatJeiPmGz5uyEDeDZbNagRac2g5VAKywv7ONy5U10VBBpoT19TZEl5XOITCqGn6FklS6DvfbK56PNBwCdWHTytbWZCxzt5OexjfkR9zStPO2bu2uenHf/ZLP+4MxSc8DnEqwavnYUmymwRiHdPgZUu03tlAZK2z402M0cobDJMTq/DxnCA0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2019 08:02:11.2901 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9681730-d3aa-40fc-6d37-08d7100d3b99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1572
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ckf0VPOn4ruoTvihxBmncx+KHdw6szUKg0b4dbZWACo=;
 b=ijZ0EdWuOCz+YElNWjNGM0tEb0Lh1dq2lpFADB0UMv1ER1WpbZ3gUpuAc1aZ5FJtiR5Gb25mPUL9qo68D9yy/RdbLjwOuxBZdmZ8eUuuOoJZOawvdu9ONQTWz+v0yyp0bByV82ib6Feua0erYPyAIsTaTeZp6wOVzkqdhVt3TNI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4KQ2M6IExp
b25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4KQ2M6IENocmlz
dGlhbiBLw7ZuaWcgPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4KLS0tCiBhbWRncHUvYW1kZ3B1
LXN5bWJvbC1jaGVjayB8ICAxICsKIGFtZGdwdS9hbWRncHUuaCAgICAgICAgICAgIHwgMTggKysr
KysrKysrKysrKysrKysrCiBhbWRncHUvYW1kZ3B1X2NzLmMgICAgICAgICB8IDEwICsrKysrKysr
KysKIGluY2x1ZGUvZHJtL2RybS5oICAgICAgICAgIHwgIDMgKystCiB4Zjg2ZHJtLmMgICAgICAg
ICAgICAgICAgICB8IDE5ICsrKysrKysrKysrKysrKysrKysKIHhmODZkcm0uaCAgICAgICAgICAg
ICAgICAgIHwgIDIgKysKIDYgZmlsZXMgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRncHUtc3ltYm9sLWNoZWNrIGIvYW1kZ3B1
L2FtZGdwdS1zeW1ib2wtY2hlY2sKaW5kZXggMjc0YjRjNmQuLjNiYzFhOWYxIDEwMDc1NQotLS0g
YS9hbWRncHUvYW1kZ3B1LXN5bWJvbC1jaGVjaworKysgYi9hbWRncHUvYW1kZ3B1LXN5bWJvbC1j
aGVjawpAQCAtNTYsNiArNTYsNyBAQCBhbWRncHVfY3Nfc3luY29ial9leHBvcnRfc3luY19maWxl
MgogYW1kZ3B1X2NzX3N5bmNvYmpfaW1wb3J0X3N5bmNfZmlsZQogYW1kZ3B1X2NzX3N5bmNvYmpf
aW1wb3J0X3N5bmNfZmlsZTIKIGFtZGdwdV9jc19zeW5jb2JqX3F1ZXJ5CithbWRncHVfY3Nfc3lu
Y29ial9xdWVyeTEKIGFtZGdwdV9jc19zeW5jb2JqX3Jlc2V0CiBhbWRncHVfY3Nfc3luY29ial9z
aWduYWwKIGFtZGdwdV9jc19zeW5jb2JqX3RpbWVsaW5lX3NpZ25hbApkaWZmIC0tZ2l0IGEvYW1k
Z3B1L2FtZGdwdS5oIGIvYW1kZ3B1L2FtZGdwdS5oCmluZGV4IDlkOWIwODMyLi5jZTdlMmJiYiAx
MDA2NDQKLS0tIGEvYW1kZ3B1L2FtZGdwdS5oCisrKyBiL2FtZGdwdS9hbWRncHUuaApAQCAtMTU5
MSw2ICsxNTkxLDI0IEBAIGludCBhbWRncHVfY3Nfc3luY29ial90aW1lbGluZV93YWl0KGFtZGdw
dV9kZXZpY2VfaGFuZGxlIGRldiwKIGludCBhbWRncHVfY3Nfc3luY29ial9xdWVyeShhbWRncHVf
ZGV2aWNlX2hhbmRsZSBkZXYsCiAJCQkgICAgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpw
b2ludHMsCiAJCQkgICAgdW5zaWduZWQgbnVtX2hhbmRsZXMpOworLyoqCisgKiAgUXVlcnkgc3lu
YyBvYmplY3RzIHBheWxvYWRzLgorICoKKyAqIFxwYXJhbSAgIGRldgkgICAgLSBcYyBbaW5dIHNl
bGYtZXhwbGFuYXRvcnkKKyAqIFxwYXJhbSAgIGhhbmRsZXMgLSBcYyBbaW5dIGFycmF5IG9mIHN5
bmMgb2JqZWN0IGhhbmRsZXMKKyAqIFxwYXJhbSAgIHBvaW50cyAtIFxjIFtvdXRdIGFycmF5IG9m
IHN5bmMgcG9pbnRzIHJldHVybmVkLCB3aGljaCBwcmVzZW50cworICogc3luY29iaiBwYXlsb2Fk
LgorICogXHBhcmFtICAgbnVtX2hhbmRsZXMgLSBcYyBbaW5dIHNlbGYtZXhwbGFuYXRvcnkKKyAq
IFxwYXJhbSAgIGZsYWdzICAgLSBcYyBbaW5dIGEgYml0bWFzayBvZiBEUk1fU1lOQ09CSl9RVUVS
WV9GTEFHU18qCisgKgorICogXHJldHVybiAgIDAgb24gc3VjY2Vzc1xuCisgKiAgICAgICAgICAt
RVRJTUUgLSBUaW1lb3V0CisgKiAgICAgICAgICA8MCAtIE5lZ2F0aXZlIFBPU0lYIEVycm9yIGNv
ZGUKKyAqCisgKi8KK2ludCBhbWRncHVfY3Nfc3luY29ial9xdWVyeTEoYW1kZ3B1X2RldmljZV9o
YW5kbGUgZGV2LAorCQkJICAgICB1aW50MzJfdCAqaGFuZGxlcywgdWludDY0X3QgKnBvaW50cywK
KwkJCSAgICAgdW5zaWduZWQgbnVtX2hhbmRsZXMsIHVpbnQzMl90IGZsYWdzKTsKIAogLyoqCiAg
KiAgRXhwb3J0IGtlcm5lbCBzeW5jIG9iamVjdCB0byBzaGFyZWFibGUgZmQuCmRpZmYgLS1naXQg
YS9hbWRncHUvYW1kZ3B1X2NzLmMgYi9hbWRncHUvYW1kZ3B1X2NzLmMKaW5kZXggOTc3ZmEzY2Yu
LmUyMjg3ZmEwIDEwMDY0NAotLS0gYS9hbWRncHUvYW1kZ3B1X2NzLmMKKysrIGIvYW1kZ3B1L2Ft
ZGdwdV9jcy5jCkBAIC03MjEsNiArNzIxLDE2IEBAIGRybV9wdWJsaWMgaW50IGFtZGdwdV9jc19z
eW5jb2JqX3F1ZXJ5KGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwKIAlyZXR1cm4gZHJtU3luY29i
alF1ZXJ5KGRldi0+ZmQsIGhhbmRsZXMsIHBvaW50cywgbnVtX2hhbmRsZXMpOwogfQogCitkcm1f
cHVibGljIGludCBhbWRncHVfY3Nfc3luY29ial9xdWVyeTEoYW1kZ3B1X2RldmljZV9oYW5kbGUg
ZGV2LAorCQkJCQl1aW50MzJfdCAqaGFuZGxlcywgdWludDY0X3QgKnBvaW50cywKKwkJCQkJdW5z
aWduZWQgbnVtX2hhbmRsZXMsIHVpbnQzMl90IGZsYWdzKQoreworCWlmIChOVUxMID09IGRldikK
KwkJcmV0dXJuIC1FSU5WQUw7CisKKwlyZXR1cm4gZHJtU3luY29ialF1ZXJ5MShkZXYtPmZkLCBo
YW5kbGVzLCBwb2ludHMsIG51bV9oYW5kbGVzLCBmbGFncyk7Cit9CisKIGRybV9wdWJsaWMgaW50
IGFtZGdwdV9jc19leHBvcnRfc3luY29iaihhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsCiAJCQkJ
CXVpbnQzMl90IGhhbmRsZSwKIAkJCQkJaW50ICpzaGFyZWRfZmQpCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm0uaCBiL2luY2x1ZGUvZHJtL2RybS5oCmluZGV4IDUzMjc4N2JmLi5hZjM3YTgw
YiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtLmgK
QEAgLTc3MSwxMSArNzcxLDEyIEBAIHN0cnVjdCBkcm1fc3luY29ial9hcnJheSB7CiAJX191MzIg
cGFkOwogfTsKIAorI2RlZmluZSBEUk1fU1lOQ09CSl9RVUVSWV9GTEFHU19MQVNUX1NVQk1JVFRF
RCAoMSA8PCAwKSAvKiBsYXN0IGF2YWlsYWJsZSBwb2ludCBvbiB0aW1lbGluZSBzeW5jb2JqICov
CiBzdHJ1Y3QgZHJtX3N5bmNvYmpfdGltZWxpbmVfYXJyYXkgewogCV9fdTY0IGhhbmRsZXM7CiAJ
X191NjQgcG9pbnRzOwogCV9fdTMyIGNvdW50X2hhbmRsZXM7Ci0JX191MzIgcGFkOworCV9fdTMy
IGZsYWdzOwogfTsKIAogCmRpZmYgLS1naXQgYS94Zjg2ZHJtLmMgYi94Zjg2ZHJtLmMKaW5kZXgg
OTUzZmM3NjIuLmZiN2Q1Y2M1IDEwMDY0NAotLS0gYS94Zjg2ZHJtLmMKKysrIGIveGY4NmRybS5j
CkBAIC00MzE0LDYgKzQzMTQsMjUgQEAgZHJtX3B1YmxpYyBpbnQgZHJtU3luY29ialF1ZXJ5KGlu
dCBmZCwgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMsCiAgICAgcmV0dXJuIDA7
CiB9CiAKK2RybV9wdWJsaWMgaW50IGRybVN5bmNvYmpRdWVyeTEoaW50IGZkLCB1aW50MzJfdCAq
aGFuZGxlcywgdWludDY0X3QgKnBvaW50cywKKwkJCQl1aW50MzJfdCBoYW5kbGVfY291bnQsIHVp
bnQzMl90IGZsYWdzKQoreworICAgIHN0cnVjdCBkcm1fc3luY29ial90aW1lbGluZV9hcnJheSBh
cmdzOworICAgIGludCByZXQ7CisKKyAgICBtZW1jbGVhcihhcmdzKTsKKyAgICBhcmdzLmhhbmRs
ZXMgPSAodWludHB0cl90KWhhbmRsZXM7CisgICAgYXJncy5wb2ludHMgPSAodWludHB0cl90KXBv
aW50czsKKyAgICBhcmdzLmNvdW50X2hhbmRsZXMgPSBoYW5kbGVfY291bnQ7CisgICAgYXJncy5m
bGFncyA9IGZsYWdzOworCisgICAgcmV0ID0gZHJtSW9jdGwoZmQsIERSTV9JT0NUTF9TWU5DT0JK
X1FVRVJZLCAmYXJncyk7CisgICAgaWYgKHJldCkKKyAgICAgICAgcmV0dXJuIHJldDsKKyAgICBy
ZXR1cm4gMDsKK30KKworCiBkcm1fcHVibGljIGludCBkcm1TeW5jb2JqVHJhbnNmZXIoaW50IGZk
LAogCQkJCSAgdWludDMyX3QgZHN0X2hhbmRsZSwgdWludDY0X3QgZHN0X3BvaW50LAogCQkJCSAg
dWludDMyX3Qgc3JjX2hhbmRsZSwgdWludDY0X3Qgc3JjX3BvaW50LApkaWZmIC0tZ2l0IGEveGY4
NmRybS5oIGIveGY4NmRybS5oCmluZGV4IDNmYjFkMWNhLi4yOWMxZGY2ZCAxMDA2NDQKLS0tIGEv
eGY4NmRybS5oCisrKyBiL3hmODZkcm0uaApAQCAtODg0LDYgKzg4NCw4IEBAIGV4dGVybiBpbnQg
ZHJtU3luY29ialRpbWVsaW5lV2FpdChpbnQgZmQsIHVpbnQzMl90ICpoYW5kbGVzLCB1aW50NjRf
dCAqcG9pbnRzLAogCQkJCSAgdWludDMyX3QgKmZpcnN0X3NpZ25hbGVkKTsKIGV4dGVybiBpbnQg
ZHJtU3luY29ialF1ZXJ5KGludCBmZCwgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2lu
dHMsCiAJCQkgICB1aW50MzJfdCBoYW5kbGVfY291bnQpOworZXh0ZXJuIGludCBkcm1TeW5jb2Jq
UXVlcnkxKGludCBmZCwgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMsCisJCQkg
ICAgdWludDMyX3QgaGFuZGxlX2NvdW50LCB1aW50MzJfdCBmbGFncyk7CiBleHRlcm4gaW50IGRy
bVN5bmNvYmpUcmFuc2ZlcihpbnQgZmQsCiAJCQkgICAgICB1aW50MzJfdCBkc3RfaGFuZGxlLCB1
aW50NjRfdCBkc3RfcG9pbnQsCiAJCQkgICAgICB1aW50MzJfdCBzcmNfaGFuZGxlLCB1aW50NjRf
dCBzcmNfcG9pbnQsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
