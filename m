Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1C9748D0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 10:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CAE6E68F;
	Thu, 25 Jul 2019 08:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0106E68F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 08:11:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFnQkovf6zJSsrVGsi+2reCExJCchBx0K8KGAxB4ZmA9C8K9PiyVuOJ9Mx+SLT9EZQkyM558OLPnV/jdXNyqTH1WcHuVztOA/7HSMg6r150cjgucdnYNw1J0OGKOqpv/ITqzscoQPGYERKfrpLTl6aDNErGGMBIVEyAX1zeNes2RfB/a4i9CAc03T6DKLST7eKEulAOCbiZ9al9Hoo+J34sQlGWr884VOMbG4KTBM9LpYOkyZQfigWeQMe648NL7gO/1+sthOmBfus/j+5hW8f3/U1S29uqoQWfXu78nWWCzCHbgmf/VbM0JecKn2AQ6oWwx4AZxaM47HsgFElQZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DkI9+35MPoc2GhXaDEQLzffwvnWettkE/S8u8oBvB8=;
 b=dZKGy6EU1B2p99XifN3NwZL+e9nKYiVRYf8UwtuKp5tFzMql1HtZr3aKbSzqHuAilWchgx/ExpAwxoKZwfrGMULbYr+M8geWZGMMqqrVHxydKJY0KF+46WTYULXDYTk6aOg8v8exYakmfk8q5E2xyiZdM6VPMXSOUtsURUFWa1tZbE0J5cMLwVuqA87RQo3Xwsgb9aLy4PJ7FntpHscXcd9vpUiWGh14TY0TWwcpOaoqRnScpITluDpmWEFzNplOujjGpBPktBqHuGBLl4+YRyJ7Hp7jycEnPdbRkEiDJQuCPmHPZq/fnslLtlQfFle9ZZ7nMt67AdZ7XvPToalvCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0112.namprd12.prod.outlook.com (2603:10b6:0:55::32) by
 DM5PR1201MB2489.namprd12.prod.outlook.com (2603:10b6:3:e2::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 08:11:21 +0000
Received: from BY2NAM03FT059.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by DM3PR12CA0112.outlook.office365.com
 (2603:10b6:0:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.15 via Frontend
 Transport; Thu, 25 Jul 2019 08:11:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT059.mail.protection.outlook.com (10.152.85.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Thu, 25 Jul 2019 08:11:20 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 25 Jul 2019
 03:11:19 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm] libdrm: wrap new flexible syncobj query interface v2
Date: Thu, 25 Jul 2019 16:11:11 +0800
Message-ID: <20190725081111.21568-1-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(2980300002)(428003)(199004)(189003)(68736007)(36756003)(2351001)(81156014)(53936002)(70206006)(6666004)(356004)(4326008)(70586007)(486006)(50466002)(81166006)(14444005)(2906002)(8936002)(53416004)(7696005)(478600001)(186003)(336012)(66574012)(23676004)(50226002)(1076003)(305945005)(5660300002)(8676002)(26005)(426003)(126002)(6916009)(316002)(2870700001)(2616005)(86362001)(54906003)(5820100001)(47776003)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2489; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b04d370-3cb7-45dd-4e6b-08d710d7ad54
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB2489; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2489:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2489AD01F082DE7DDF4749C9B4C10@DM5PR1201MB2489.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:383;
X-Forefront-PRVS: 0109D382B0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Q5M5FLnwebuCkPb2K66ia6aQQZ8l2ePn4HKfV+mRFlAGAU/3a77O91e2BeN0plsG/ZK1ncvUtSrRMlrSTn1QoxHVSkVAWHnqwzaYH7uUyvasXORHfrfISeNASUVUmNlG8tm4ndTYyP1cWv+2lA1evvb2CRx3s+7qbTGKCqGfbb9krSZlFmlqlaZadvWLYcdBUatpgm+natI5zh6VRL97qUvLZxAW636aUtXkuBrC4S+40N8nn40Vdh5IMSP7ce9cc88Jf+B+xohOI3vhkYConHx5iw0X9koviNHzd6/v6kaQkril9CzxQJw6ytqktyT8Vt1cf4E1cmP1WYPQPvIVwqRcQzaG9svB5SepGQCOlx9P8mZnq4L18gJ8ywZowXRjk3aht4Q16eMX9HIOcz7vlsne+pW0EB2B6l/8w6dU7tM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 08:11:20.6519 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b04d370-3cb7-45dd-4e6b-08d710d7ad54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2489
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DkI9+35MPoc2GhXaDEQLzffwvnWettkE/S8u8oBvB8=;
 b=vFLKohUiVigMPfLXzt2ZMtV7+aRBHuUC/Z2ChiC6N229HOOZysS+FBxNAZ61Xuyxh9PNSNauQJVuHAIm3dAKDQFNkg6flfYo8MCPJmuNvz/02aYPSb2oa/GRaQwRuILGSJ9QwqA3MPPVeyEQT4aE0G0co1qaIDeRmEhK7KVVrHQ=
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

djI6IG5pdC1waWNrcyBmaXgKClNpZ25lZC1vZmYtYnk6IENodW5taW5nIFpob3UgPGRhdmlkMS56
aG91QGFtZC5jb20+CkNjOiBMaW9uZWwgTGFuZHdlcmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBp
bnRlbC5jb20+CkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
CkZvciB0aGUgeGY4NmRybS5bY2hdIHBhcnQgOiBSZXZpZXdlZC1ieTogTGlvbmVsIExhbmR3ZXJs
aW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgotLS0KIGFtZGdwdS9hbWRncHUtc3lt
Ym9sLWNoZWNrIHwgIDEgKwogYW1kZ3B1L2FtZGdwdS5oICAgICAgICAgICAgfCAxOCArKysrKysr
KysrKysrKysrKysKIGFtZGdwdS9hbWRncHVfY3MuYyAgICAgICAgIHwgMTAgKysrKysrKysrKwog
aW5jbHVkZS9kcm0vZHJtLmggICAgICAgICAgfCAgMyArKy0KIHhmODZkcm0uYyAgICAgICAgICAg
ICAgICAgIHwgMTUgKysrKysrKysrKysrKysrCiB4Zjg2ZHJtLmggICAgICAgICAgICAgICAgICB8
ICAyICsrCiA2IGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9hbWRncHUvYW1kZ3B1LXN5bWJvbC1jaGVjayBiL2FtZGdwdS9hbWRncHUt
c3ltYm9sLWNoZWNrCmluZGV4IDI3NGI0YzZkLi41OTdhOTliMiAxMDA3NTUKLS0tIGEvYW1kZ3B1
L2FtZGdwdS1zeW1ib2wtY2hlY2sKKysrIGIvYW1kZ3B1L2FtZGdwdS1zeW1ib2wtY2hlY2sKQEAg
LTU2LDYgKzU2LDcgQEAgYW1kZ3B1X2NzX3N5bmNvYmpfZXhwb3J0X3N5bmNfZmlsZTIKIGFtZGdw
dV9jc19zeW5jb2JqX2ltcG9ydF9zeW5jX2ZpbGUKIGFtZGdwdV9jc19zeW5jb2JqX2ltcG9ydF9z
eW5jX2ZpbGUyCiBhbWRncHVfY3Nfc3luY29ial9xdWVyeQorYW1kZ3B1X2NzX3N5bmNvYmpfcXVl
cnkyCiBhbWRncHVfY3Nfc3luY29ial9yZXNldAogYW1kZ3B1X2NzX3N5bmNvYmpfc2lnbmFsCiBh
bWRncHVfY3Nfc3luY29ial90aW1lbGluZV9zaWduYWwKZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRn
cHUuaCBiL2FtZGdwdS9hbWRncHUuaAppbmRleCA5ZDliMDgzMi4uMTlmNzRiZDYgMTAwNjQ0Ci0t
LSBhL2FtZGdwdS9hbWRncHUuaAorKysgYi9hbWRncHUvYW1kZ3B1LmgKQEAgLTE1OTEsNiArMTU5
MSwyNCBAQCBpbnQgYW1kZ3B1X2NzX3N5bmNvYmpfdGltZWxpbmVfd2FpdChhbWRncHVfZGV2aWNl
X2hhbmRsZSBkZXYsCiBpbnQgYW1kZ3B1X2NzX3N5bmNvYmpfcXVlcnkoYW1kZ3B1X2RldmljZV9o
YW5kbGUgZGV2LAogCQkJICAgIHVpbnQzMl90ICpoYW5kbGVzLCB1aW50NjRfdCAqcG9pbnRzLAog
CQkJICAgIHVuc2lnbmVkIG51bV9oYW5kbGVzKTsKKy8qKgorICogIFF1ZXJ5IHN5bmMgb2JqZWN0
cyBsYXN0IHNpZ25hbGVkIG9yIHN1Ym1pdHRlZCBwb2ludC4KKyAqCisgKiBccGFyYW0gICBkZXYJ
ICAgIC0gXGMgW2luXSBzZWxmLWV4cGxhbmF0b3J5CisgKiBccGFyYW0gICBoYW5kbGVzIC0gXGMg
W2luXSBhcnJheSBvZiBzeW5jIG9iamVjdCBoYW5kbGVzCisgKiBccGFyYW0gICBwb2ludHMgLSBc
YyBbb3V0XSBhcnJheSBvZiBzeW5jIHBvaW50cyByZXR1cm5lZCwgd2hpY2ggcHJlc2VudHMKKyAq
IHN5bmNvYmogcGF5bG9hZC4KKyAqIFxwYXJhbSAgIG51bV9oYW5kbGVzIC0gXGMgW2luXSBzZWxm
LWV4cGxhbmF0b3J5CisgKiBccGFyYW0gICBmbGFncyAgIC0gXGMgW2luXSBhIGJpdG1hc2sgb2Yg
RFJNX1NZTkNPQkpfUVVFUllfRkxBR1NfKgorICoKKyAqIFxyZXR1cm4gICAwIG9uIHN1Y2Nlc3Nc
bgorICogICAgICAgICAgLUVUSU1FIC0gVGltZW91dAorICogICAgICAgICAgPDAgLSBOZWdhdGl2
ZSBQT1NJWCBFcnJvciBjb2RlCisgKgorICovCitpbnQgYW1kZ3B1X2NzX3N5bmNvYmpfcXVlcnky
KGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwKKwkJCSAgICAgdWludDMyX3QgKmhhbmRsZXMsIHVp
bnQ2NF90ICpwb2ludHMsCisJCQkgICAgIHVuc2lnbmVkIG51bV9oYW5kbGVzLCB1aW50MzJfdCBm
bGFncyk7CiAKIC8qKgogICogIEV4cG9ydCBrZXJuZWwgc3luYyBvYmplY3QgdG8gc2hhcmVhYmxl
IGZkLgpkaWZmIC0tZ2l0IGEvYW1kZ3B1L2FtZGdwdV9jcy5jIGIvYW1kZ3B1L2FtZGdwdV9jcy5j
CmluZGV4IDk3N2ZhM2NmLi4wMWUyYjJjOCAxMDA2NDQKLS0tIGEvYW1kZ3B1L2FtZGdwdV9jcy5j
CisrKyBiL2FtZGdwdS9hbWRncHVfY3MuYwpAQCAtNzIxLDYgKzcyMSwxNiBAQCBkcm1fcHVibGlj
IGludCBhbWRncHVfY3Nfc3luY29ial9xdWVyeShhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsCiAJ
cmV0dXJuIGRybVN5bmNvYmpRdWVyeShkZXYtPmZkLCBoYW5kbGVzLCBwb2ludHMsIG51bV9oYW5k
bGVzKTsKIH0KIAorZHJtX3B1YmxpYyBpbnQgYW1kZ3B1X2NzX3N5bmNvYmpfcXVlcnkyKGFtZGdw
dV9kZXZpY2VfaGFuZGxlIGRldiwKKwkJCQkJdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpw
b2ludHMsCisJCQkJCXVuc2lnbmVkIG51bV9oYW5kbGVzLCB1aW50MzJfdCBmbGFncykKK3sKKwlp
ZiAoIWRldikKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlyZXR1cm4gZHJtU3luY29ialF1ZXJ5Mihk
ZXYtPmZkLCBoYW5kbGVzLCBwb2ludHMsIG51bV9oYW5kbGVzLCBmbGFncyk7Cit9CisKIGRybV9w
dWJsaWMgaW50IGFtZGdwdV9jc19leHBvcnRfc3luY29iaihhbWRncHVfZGV2aWNlX2hhbmRsZSBk
ZXYsCiAJCQkJCXVpbnQzMl90IGhhbmRsZSwKIAkJCQkJaW50ICpzaGFyZWRfZmQpCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2RybS9kcm0uaCBiL2luY2x1ZGUvZHJtL2RybS5oCmluZGV4IDUzMjc4N2Jm
Li5hZjM3YTgwYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtLmgKKysrIGIvaW5jbHVkZS9k
cm0vZHJtLmgKQEAgLTc3MSwxMSArNzcxLDEyIEBAIHN0cnVjdCBkcm1fc3luY29ial9hcnJheSB7
CiAJX191MzIgcGFkOwogfTsKIAorI2RlZmluZSBEUk1fU1lOQ09CSl9RVUVSWV9GTEFHU19MQVNU
X1NVQk1JVFRFRCAoMSA8PCAwKSAvKiBsYXN0IGF2YWlsYWJsZSBwb2ludCBvbiB0aW1lbGluZSBz
eW5jb2JqICovCiBzdHJ1Y3QgZHJtX3N5bmNvYmpfdGltZWxpbmVfYXJyYXkgewogCV9fdTY0IGhh
bmRsZXM7CiAJX191NjQgcG9pbnRzOwogCV9fdTMyIGNvdW50X2hhbmRsZXM7Ci0JX191MzIgcGFk
OworCV9fdTMyIGZsYWdzOwogfTsKIAogCmRpZmYgLS1naXQgYS94Zjg2ZHJtLmMgYi94Zjg2ZHJt
LmMKaW5kZXggOTUzZmM3NjIuLjI4YTYxMjY0IDEwMDY0NAotLS0gYS94Zjg2ZHJtLmMKKysrIGIv
eGY4NmRybS5jCkBAIC00MzE0LDYgKzQzMTQsMjEgQEAgZHJtX3B1YmxpYyBpbnQgZHJtU3luY29i
alF1ZXJ5KGludCBmZCwgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMsCiAgICAg
cmV0dXJuIDA7CiB9CiAKK2RybV9wdWJsaWMgaW50IGRybVN5bmNvYmpRdWVyeTIoaW50IGZkLCB1
aW50MzJfdCAqaGFuZGxlcywgdWludDY0X3QgKnBvaW50cywKKwkJCQl1aW50MzJfdCBoYW5kbGVf
Y291bnQsIHVpbnQzMl90IGZsYWdzKQoreworICAgIHN0cnVjdCBkcm1fc3luY29ial90aW1lbGlu
ZV9hcnJheSBhcmdzOworCisgICAgbWVtY2xlYXIoYXJncyk7CisgICAgYXJncy5oYW5kbGVzID0g
KHVpbnRwdHJfdCloYW5kbGVzOworICAgIGFyZ3MucG9pbnRzID0gKHVpbnRwdHJfdClwb2ludHM7
CisgICAgYXJncy5jb3VudF9oYW5kbGVzID0gaGFuZGxlX2NvdW50OworICAgIGFyZ3MuZmxhZ3Mg
PSBmbGFnczsKKworICAgIHJldHVybiBkcm1Jb2N0bChmZCwgRFJNX0lPQ1RMX1NZTkNPQkpfUVVF
UlksICZhcmdzKTsKK30KKworCiBkcm1fcHVibGljIGludCBkcm1TeW5jb2JqVHJhbnNmZXIoaW50
IGZkLAogCQkJCSAgdWludDMyX3QgZHN0X2hhbmRsZSwgdWludDY0X3QgZHN0X3BvaW50LAogCQkJ
CSAgdWludDMyX3Qgc3JjX2hhbmRsZSwgdWludDY0X3Qgc3JjX3BvaW50LApkaWZmIC0tZ2l0IGEv
eGY4NmRybS5oIGIveGY4NmRybS5oCmluZGV4IDNmYjFkMWNhLi41NWNlYWVkOSAxMDA2NDQKLS0t
IGEveGY4NmRybS5oCisrKyBiL3hmODZkcm0uaApAQCAtODg0LDYgKzg4NCw4IEBAIGV4dGVybiBp
bnQgZHJtU3luY29ialRpbWVsaW5lV2FpdChpbnQgZmQsIHVpbnQzMl90ICpoYW5kbGVzLCB1aW50
NjRfdCAqcG9pbnRzLAogCQkJCSAgdWludDMyX3QgKmZpcnN0X3NpZ25hbGVkKTsKIGV4dGVybiBp
bnQgZHJtU3luY29ialF1ZXJ5KGludCBmZCwgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpw
b2ludHMsCiAJCQkgICB1aW50MzJfdCBoYW5kbGVfY291bnQpOworZXh0ZXJuIGludCBkcm1TeW5j
b2JqUXVlcnkyKGludCBmZCwgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMsCisJ
CQkgICAgdWludDMyX3QgaGFuZGxlX2NvdW50LCB1aW50MzJfdCBmbGFncyk7CiBleHRlcm4gaW50
IGRybVN5bmNvYmpUcmFuc2ZlcihpbnQgZmQsCiAJCQkgICAgICB1aW50MzJfdCBkc3RfaGFuZGxl
LCB1aW50NjRfdCBkc3RfcG9pbnQsCiAJCQkgICAgICB1aW50MzJfdCBzcmNfaGFuZGxlLCB1aW50
NjRfdCBzcmNfcG9pbnQsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
