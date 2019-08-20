Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961BC96923
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 21:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CBC6E868;
	Tue, 20 Aug 2019 19:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740054.outbound.protection.outlook.com [40.107.74.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DDD6E85E;
 Tue, 20 Aug 2019 19:12:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAoFxnM41fcXgi2ch+y24SqDG40Wj/ZCwHoHwnryuGV7wCli31rSqNmftmOHTd6WuX1tGmdTnXP/WJH4Q77s5hVC9bEwgiNL88Qxp9BmnJTVz+CvdHsDLMPIgJ4rVvURsZgWdCqLdCgTGgO+JHuA1hMpQGe0AxvIGPMmv4it0DPBjDJScIZgjSSJrBi2UkAx9+P/Y1o78O3+dZeSL9Vj6A3Kwrv5DqPYwM1YCgl/oFzXaWyAtKM7ISLGz7CSvpAxnlHuMzJZ3guLNKYeohsRuL96q0VcF4z5vb23+uND2dkAUGMTdP1y8lX89KENvQvLfzrZqA1tEsKsQ7jHOmsQdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Od0FZ3hhYGiEL0dlp0VNNk+Yi6h4HbAKvOIjRzVVEZc=;
 b=kfrg48KfWSv0FgymOQNtZq8inawI5ZLPcw7GCzOawF9OAh+Xo1cDFzw1eKbki3VT5xfbbk6uNKgGIFzoawnK0X0FajseY2PPlMh5RGDuuNtjAf/Um21k7CXTl2ifRsixNtu8EnsqHZSGJiugP7hvy7ZBE36cL/xfBZIbbT36D0A3KoVTjUtXraq0gUjL/6HiyTI7J8vO+5EuzluWmqXbs5KETTAXRemCj094St2SDXAXVlObg8pDOYH05imrg8FUW1UAU+QxNHPTIJ6X+oGxwu2yED36C/eXpIqwenMP+GB5nIGQQPKG2zZa4JytwsPLmpu0Z6Zgt8bAaRbN6yWZow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0044.namprd12.prod.outlook.com (2603:10b6:301:2::30)
 by BYAPR12MB2709.namprd12.prod.outlook.com (2603:10b6:a03:68::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Tue, 20 Aug
 2019 19:12:20 +0000
Received: from BY2NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by MWHPR12CA0044.outlook.office365.com
 (2603:10b6:301:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 19:12:20 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT046.mail.protection.outlook.com (10.152.85.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 19:12:20 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 20 Aug 2019 14:12:19 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 05/14] drm/amd/display: Enable SST DSC in DM
Date: Tue, 20 Aug 2019 15:11:54 -0400
Message-ID: <20190820191203.25807-6-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820191203.25807-1-David.Francis@amd.com>
References: <20190820191203.25807-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(16586007)(316002)(186003)(8936002)(50226002)(81156014)(8676002)(53936002)(81166006)(49486002)(26005)(450100002)(305945005)(47776003)(86362001)(4326008)(2906002)(36756003)(70586007)(50466002)(446003)(356004)(110136005)(48376002)(6666004)(11346002)(426003)(14444005)(70206006)(51416003)(76176011)(478600001)(126002)(486006)(5660300002)(2616005)(476003)(1076003)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2709; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4050ef65-8e46-4ff5-bb91-08d725a2532f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2709; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2709:
X-Microsoft-Antispam-PRVS: <BYAPR12MB27093F43298FA877D01CD51BEFAB0@BYAPR12MB2709.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:156;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: erAy70kEM4XYnzub4rTaTg5V0euGEux8o3LWuAC1Vo2Mf0TDkq8ndFyhjDgrNWdioQ2SuQ9ucCVqGVoC7gY/pdqHCbwQ38SYtxDLoCI9S809Gcd6UL9LxYagmmztmM4kFb5PNVEzDZtv6JqDeV2jnDWwnmyk0ctrEvoK5IbPMEaP/IpFtAEdTPBqTfl3X6wlXiETHiNAwZrhCm5yM4T8xeYQdJXc6xwdHGNWDxyNC3UozcHyLeT8ZK9VR+ti0QQpZGZYG9BmLpab/X80sd/QxMUD3P37SqPfuXmayxPKc0fo2/bH4tR6aSK9s23MS509Q8e9PgWP1TsTVoXnUWNoEBF/Oys+DxujsDTBXUizHJCajzfyMi6S5yE6O2nc+lGTT38ypQDIgT6Jw5DCpE2EOUNyR3nWVn7OAB03jNQk1ZQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 19:12:20.5139 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4050ef65-8e46-4ff5-bb91-08d725a2532f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2709
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Od0FZ3hhYGiEL0dlp0VNNk+Yi6h4HbAKvOIjRzVVEZc=;
 b=zrFui8jyJUm7jT63glG6iUoM0fxwkcJrRkRZsEpIQ53/OLg5bUeVPe77shmfEgSc/ojogi5u93WxIcExL5l+yPPOAgmF9ztF8xe9pdSmoMBf3UYUrlzhyAjEbEwkp16F25u1ON+/C1qa41RIhs0LQNbzd096fw7UUCFGbbJ73lk=
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
