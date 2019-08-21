Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48773984EF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0826B6E9E2;
	Wed, 21 Aug 2019 20:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690064.outbound.protection.outlook.com [40.107.69.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1718A6E9CB;
 Wed, 21 Aug 2019 20:01:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9nV95DQMGszIR9jgGGS6HOUVLX5Ji1EjBtsfv1hWoPfme0EyXMXpi/pYAaKNoLsJvk9AfFFmPd09Ne+oKnp8KpcoeljDRylsa37h9eoMcqthiERkFpIKK7fqEwA1inmD52VrMvOgPenrpzvJvReAdTqtmcyyEcDeYnLU8J1hTzDPnSvna0zFLhEQ+73rrg9ZTR/87yMHAZqgbgV949qKf42/WVqDbLNCPzFDFc/F+BGlORg0RN/z4S50jlT1XuM7k/0HzIQmyMelNsdpj3yfIumfdkEDVikmovuvXTStu1PalsgSgoF5hQ1VHckovLiigR4PoIWHFpyjPX49zwUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Od0FZ3hhYGiEL0dlp0VNNk+Yi6h4HbAKvOIjRzVVEZc=;
 b=gRBqMKsVpIsx+5eEnW6uKOOjbRgsawrpXeMOCu9zFZMi99PWzZRASq4ra/T0faU8Oc+G4RofmX9eaSxkK4ATkh4w2nGFgnQNFwrIxUS0EQd60Hf6VBRpouKwQFAtBaftxccA8OGInoG+63gsfv03w6KXftQWek9zejN3lIhXp6thuJnLdc+r7liKFJ3kgAvihsUks1qXmdJEEJFLeyJAi9sQZ1iXT7io52NWyoXWzgOb/DZw4IXn8avMGuoCxIpSN51Iph1/9p9viQS6oLjBbBrBzJm2T01MP4s8cuheWbdlHNRHm9/p0myuPfsT7Jph6cS5RcvbUkZHWOE85tYM7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0009.namprd12.prod.outlook.com (10.164.241.19) by
 BN6PR12MB1267.namprd12.prod.outlook.com (10.168.224.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 21 Aug 2019 20:01:48 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by BN4PR12CA0009.outlook.office365.com
 (2603:10b6:403:2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Wed, 21 Aug 2019 20:01:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 20:01:47 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 21 Aug 2019 15:01:37 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 05/16] drm/amd/display: Enable SST DSC in DM
Date: Wed, 21 Aug 2019 16:01:18 -0400
Message-ID: <20190821200129.11575-6-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821200129.11575-1-David.Francis@amd.com>
References: <20190821200129.11575-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(2980300002)(428003)(189003)(199004)(81156014)(70206006)(50226002)(6666004)(356004)(110136005)(476003)(14444005)(478600001)(36756003)(70586007)(5660300002)(486006)(86362001)(126002)(11346002)(446003)(316002)(53936002)(2616005)(16586007)(186003)(8936002)(51416003)(450100002)(49486002)(50466002)(426003)(8676002)(305945005)(4326008)(2906002)(1076003)(48376002)(26005)(81166006)(76176011)(336012)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1267; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d693f5a5-396f-4f6d-980e-08d726726653
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN6PR12MB1267; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1267:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1267CD6D37A102F6A2B2B68AEFAA0@BN6PR12MB1267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:156;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: xWMmWQtk5pvzMEN+duGpKYju3mlFvallZuYhy6DeQKqOpBN/LDTSSJQmVDbdlmI4v/9g0HB2rJCRl7L3pvADlBfKxjT2jWMKVIZFpgBFBdlrvnvNL6vOm+KnRRlbUOmxAVOolBeYMMrx1/oEEPjkJrN6CCTeaUHU7VA6ASWZJtmVrtmbtRuQZFripBCTX/P8aqzM4stQpDy3xHLnVSQfNqycIxxZGmzcKhT7C4Yd3bYvduoKF1JkOqxw2hWuPv81SIuvEdOCMoVdSLts3bJRhKz4fSxPr4OA/AYT/bNHGz7KoJNdBEUaMv8hpgje3c1ZDR4RMQDJXJI3iw+1TD2M5Gz9fsrH7sgqakGdoXWr0bM/SSvLhyWznG3qmRfJAYVQNNMhLynvLMeiyaU3ScdPF3LjsfuWLw+lcO36ivT4vGo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 20:01:47.9114 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d693f5a5-396f-4f6d-980e-08d726726653
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1267
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Od0FZ3hhYGiEL0dlp0VNNk+Yi6h4HbAKvOIjRzVVEZc=;
 b=T9pVIj48/GZo6usOvYqojo5we9igcVeHr8f4l90r+TlU+h8rJw7hwzy545xuFZYx3JsxoPlchLPo8JaLRKCjKRbmqK7+d2RMIHi0lrE4eB+2Mk5WUL+oEnEruLX26dUImObGsKKsHyeUJ05NEcFZbRhfeVPx4pNfvLOqsmklUek=
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
Cc: David Francis <David.Francis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gY3JlYXRlX3N0cmVhbV9mb3Jfc2luaywgY2hlY2sgZm9yIFNTVCBEUCBjb25uZWN0b3JzCgpQ
YXJzZSBEU0MgY2FwcyB0byBEQyBmb3JtYXQsIHRoZW4sIGlmIERTQyBpcyBzdXBwb3J0ZWQsCmNv
bXB1dGUgdGhlIGNvbmZpZwoKRFNDIGhhcmR3YXJlIHdpbGwgYmUgcHJvZ3JhbW1lZCBieSBkY19j
b21taXRfc3RhdGUKClRlc3RlZC1ieTogTWlraXRhIExpcHNraSA8TWlraXRhLkxpcHNraUBhbWQu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFt
ZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
IHwgMzIgKysrKysrKysrKysrLS0tLS0tLQogLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG1faGVscGVycy5jIHwgIDQgKystCiAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMo
KyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDkxMWZlNzhiNDdjMS4uODQyNDkwNTdlMTgxIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMKQEAgLTM1NzYsNiArMzU3NiwxMCBAQCBjcmVhdGVfc3RyZWFtX2Zvcl9zaW5rKHN0cnVjdCBh
bWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yLAogCWJvb2wgc2NhbGUgPSBkbV9zdGF0ZSA/
IChkbV9zdGF0ZS0+c2NhbGluZyAhPSBSTVhfT0ZGKSA6IGZhbHNlOwogCWludCBtb2RlX3JlZnJl
c2g7CiAJaW50IHByZWZlcnJlZF9yZWZyZXNoID0gMDsKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9E
Q19EU0NfU1VQUE9SVAorCXN0cnVjdCBkc2NfZGVjX2RwY2RfY2FwcyBkc2NfY2FwczsKKwl1aW50
MzJfdCBsaW5rX2JhbmR3aWR0aF9rYnBzOworI2VuZGlmCiAKIAlzdHJ1Y3QgZGNfc2luayAqc2lu
ayA9IE5VTEw7CiAJaWYgKGFjb25uZWN0b3IgPT0gTlVMTCkgewpAQCAtMzY0OCwxNyArMzY1Miwy
MyBAQCBjcmVhdGVfc3RyZWFtX2Zvcl9zaW5rKHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICph
Y29ubmVjdG9yLAogCQkJJm1vZGUsICZhY29ubmVjdG9yLT5iYXNlLCBjb25fc3RhdGUsIG9sZF9z
dHJlYW0pOwogCiAjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQKLQkvKiBzdHJl
YW0tPnRpbWluZy5mbGFncy5EU0MgPSAwOyAqLwotICAgICAgICAvKiAgKi8KLQkvKiBpZiAoYWNv
bm5lY3Rvci0+ZGNfbGluayAmJiAqLwotCS8qIAkJYWNvbm5lY3Rvci0+ZGNfbGluay0+Y29ubmVj
dG9yX3NpZ25hbCA9PSBTSUdOQUxfVFlQRV9ESVNQTEFZX1BPUlQgIzx7KHwmJiAqLwotCS8qIAkJ
YWNvbm5lY3Rvci0+ZGNfbGluay0+ZHBjZF9jYXBzLmRzY19jYXBzLmRzY19iYXNpY19jYXBzLmlz
X2RzY19zdXBwb3J0ZWR8KX0+IykgKi8KLQkvKiAJaWYgKGRjX2RzY19jb21wdXRlX2NvbmZpZyhh
Y29ubmVjdG9yLT5kY19saW5rLT5jdHgtPmRjLCAqLwotCS8qIAkJCSZhY29ubmVjdG9yLT5kY19s
aW5rLT5kcGNkX2NhcHMuZHNjX2NhcHMsICovCi0JLyogCQkJZGNfbGlua19iYW5kd2lkdGhfa2Jw
cyhhY29ubmVjdG9yLT5kY19saW5rLCBkY19saW5rX2dldF9saW5rX2NhcChhY29ubmVjdG9yLT5k
Y19saW5rKSksICovCi0JLyogCQkJJnN0cmVhbS0+dGltaW5nLCAqLwotCS8qIAkJCSZzdHJlYW0t
PnRpbWluZy5kc2NfY2ZnKSkgKi8KLQkvKiAJCXN0cmVhbS0+dGltaW5nLmZsYWdzLkRTQyA9IDE7
ICovCisJc3RyZWFtLT50aW1pbmcuZmxhZ3MuRFNDID0gMDsKKworCWlmIChhY29ubmVjdG9yLT5k
Y19saW5rICYmIHNpbmstPnNpbmtfc2lnbmFsID09IFNJR05BTF9UWVBFX0RJU1BMQVlfUE9SVCkg
eworCQlkY19kc2NfcGFyc2VfZHNjX2RwY2QoYWNvbm5lY3Rvci0+ZGNfbGluay0+ZHBjZF9jYXBz
LmRzY19jYXBzLmRzY19iYXNpY19jYXBzLnJhdywKKwkJCQkgICAgICBhY29ubmVjdG9yLT5kY19s
aW5rLT5kcGNkX2NhcHMuZHNjX2NhcHMuZHNjX2V4dF9jYXBzLnJhdywKKwkJCQkgICAgICAmZHNj
X2NhcHMpOworCQlsaW5rX2JhbmR3aWR0aF9rYnBzID0gZGNfbGlua19iYW5kd2lkdGhfa2Jwcyhh
Y29ubmVjdG9yLT5kY19saW5rLAorCQkJCQkJCSAgICAgZGNfbGlua19nZXRfbGlua19jYXAoYWNv
bm5lY3Rvci0+ZGNfbGluaykpOworCisJCWlmIChkc2NfY2Fwcy5pc19kc2Nfc3VwcG9ydGVkKQor
CQkJaWYgKGRjX2RzY19jb21wdXRlX2NvbmZpZyhhY29ubmVjdG9yLT5kY19saW5rLT5jdHgtPmRj
LAorCQkJCQkJICAmZHNjX2NhcHMsCisJCQkJCQkgIGxpbmtfYmFuZHdpZHRoX2ticHMsCisJCQkJ
CQkgICZzdHJlYW0tPnRpbWluZywKKwkJCQkJCSAgJnN0cmVhbS0+dGltaW5nLmRzY19jZmcpKQor
CQkJCXN0cmVhbS0+dGltaW5nLmZsYWdzLkRTQyA9IDE7CisJfQogI2VuZGlmCiAKIAl1cGRhdGVf
c3RyZWFtX3NjYWxpbmdfc2V0dGluZ3MoJm1vZGUsIGRtX3N0YXRlLCBzdHJlYW0pOwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVs
cGVycy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1f
aGVscGVycy5jCmluZGV4IDdjZjA1NzNhYjI1Zi4uNWYyYzMxNWIxOGJhIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVs
cGVycy5jCkBAIC01NDksNyArNTQ5LDkgQEAgYm9vbCBkbV9oZWxwZXJzX2RwX3dyaXRlX2RzY19l
bmFibGUoCiAJCWJvb2wgZW5hYmxlCiApCiB7Ci0JcmV0dXJuIGZhbHNlOworCXVpbnQ4X3QgZW5h
YmxlX2RzYyA9IGVuYWJsZSA/IDEgOiAwOworCisJcmV0dXJuIGRtX2hlbHBlcnNfZHBfd3JpdGVf
ZHBjZChjdHgsIHN0cmVhbS0+c2luay0+bGluaywgRFBfRFNDX0VOQUJMRSwgJmVuYWJsZV9kc2Ms
IDEpOwogfQogI2VuZGlmCiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
