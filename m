Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA5D6CD2A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 13:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C46D6E394;
	Thu, 18 Jul 2019 11:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780043.outbound.protection.outlook.com [40.107.78.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1552A6E394
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 11:13:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVB5Wzvn1Pz3v4XarWOFWvHYUvZZPD6Yx/+VlKK9o1Cza0yg9apmzO7L5ivUKd2wIIYiPqtAlsHjIjRDE8ho3S01fDGV+vqrc0xoWvgRtMdp+135UDKZbWSnRGbqOVFPHSiDZD6XxDGEYCRicUP+MkPa70oEC+qbVqoJp7myF2xI7oTYBK06HMJV8F6fdd0zX1IR7PeopzIgu3SG9HqJI3BlQqJM3bDVKg7Kt4wFy1wpovAon4c+ilgDpOhdpiKprfQY17PuGkdSNxCbwuQDJC/JR83hy1//jS8QUQBwuCohPqvLENGBHoiHHv5vQtqKXNLy+gJ5ii9HdCpXlI4Cyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AURTgNC6YpS5N7FgGOiiVcs4jnTUwoxgiPG4ur0v3ic=;
 b=lRRaNMf6K7VbEVE1Haht46Ag2QSqiXXMuxicd97H+KmstrJ3bpWLpY81yoXy/IxsL3e6sVc9kFrIP+IKOvZqXXeoWkYX/a104S6mpsgaYCPuu+Ez71QFI6iKjSGZu5fFWfTLyxgljmYwJWrnc0AgiiwZ4xeEsvoB8OnFJgBmRVNYaZAjPMibHTdDDn7nQYFb5Nhhphxr+XyBuq5+Jv6Lob5rSuwvJhFvfKdA0Hw3pFpLOqeiE+ScEmnM4ABYTDkWKSTU24dLVGcPRAY3nI0LRCOPxdCscPQLNR/9eZMKdGT/VgzSCsOw3PqzLjqTG2gYdjXYTiBxG55hbgPq/Go1CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from SN1PR12CA0061.namprd12.prod.outlook.com (2603:10b6:802:20::32)
 by MWHPR12MB1935.namprd12.prod.outlook.com (2603:10b6:300:113::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Thu, 18 Jul
 2019 11:13:47 +0000
Received: from BY2NAM03FT047.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by SN1PR12CA0061.outlook.office365.com
 (2603:10b6:802:20::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10 via Frontend
 Transport; Thu, 18 Jul 2019 11:13:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT047.mail.protection.outlook.com (10.152.85.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 18 Jul 2019 11:13:46 +0000
Received: from zhoucm1.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 18 Jul 2019
 06:13:45 -0500
From: Chunming Zhou <david1.zhou@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/syncobj: return meaningful value to user space
Date: Thu, 18 Jul 2019 19:13:39 +0800
Message-ID: <20190718111339.25126-1-david1.zhou@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(346002)(39860400002)(2980300002)(428003)(199004)(189003)(70586007)(186003)(70206006)(4326008)(5660300002)(1076003)(126002)(51416003)(7696005)(81156014)(81166006)(486006)(2906002)(356004)(36756003)(8676002)(2616005)(6666004)(6916009)(47776003)(8936002)(86362001)(476003)(26005)(50226002)(16586007)(53936002)(336012)(53416004)(305945005)(68736007)(48376002)(316002)(478600001)(50466002)(2351001)(4744005)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1935; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce4a640e-7c0e-419b-9cef-08d70b71009c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1935; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1935:
X-Microsoft-Antispam-PRVS: <MWHPR12MB193543E0C6F26859D45528C1B4C80@MWHPR12MB1935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-Forefront-PRVS: 01026E1310
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: j1TWyPWhusc2m3/bqbOxWIzZjs1KTZ3Tn8uVVAMY4pSAFJsHlLlX9bBFWbAEfeRiGq5aLENmJsw6fg6Zh4RbClJumsVCAljSqkfbtUROv9kA7MaSTYZotRj/+ziFip8BbS8vMpjl6K15QLOaSioD65FGRIadQxuPpU8JBt2C0Dzh7yt22sqffs9orbqp1XOsTlpfjYpJs8JLvpNKv2VEy9nGqGtbX49vw+h1otB4FOUSORibzEKGjpVlj2GOfgnZT0WFmVpl45HeQcr3MBSYI/QqKPlCpnJKr4qMT5eyHu1t/gRwZCJJ8fppu3ae2bSNWr7PA0kM6syw3Ed+TAs+2Li6u/nyUn2m+/sgOEPjH4rjkryVP+DimAhE382StdRdbW5RmjmTDg9w2l9Q4rqoqMMst2BuXakax7JuIf/IA5c=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2019 11:13:46.4117 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4a640e-7c0e-419b-9cef-08d70b71009c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1935
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AURTgNC6YpS5N7FgGOiiVcs4jnTUwoxgiPG4ur0v3ic=;
 b=wUFLQpqYpAOV9FqGQtwBupo0O0fneHMWMrxrz1bH+H4el7EmfPM0WVpFxGaGq6MpimLYhkh51ko9AtV6DhZljH1FZVsRLwwKdXC0t7dho580lGj9lxxb4B1cdPlHa283hwWD+MyfKg7ZqorOGDuiU683e0anDXwfOgPJ3S7ZMuc=
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

aWYgV0FJVF9GT1JfU1VCTUlUIGlzbid0IHNldCBhbmQgaW4gdGhlIG1lYW53aGlsZSBubyB1bmRl
cmx5aW5nIGZlbmNlIG9uIHN5bmNvYmosCnRoZW4gcmV0dXJuIG5vbi1ibG9jayBlcnJvciBjb2Rl
IHRvIHVzZXIgc2FwY2UuCgpTaWduZWQtb2ZmLWJ5OiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhv
dUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIHwgNCArKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9z
eW5jb2JqLmMKaW5kZXggMzYxYTAxYTA4YzE4Li45MjlmN2M2NGY5YTIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lu
Y29iai5jCkBAIC0yNTIsNyArMjUyLDcgQEAgaW50IGRybV9zeW5jb2JqX2ZpbmRfZmVuY2Uoc3Ry
dWN0IGRybV9maWxlICpmaWxlX3ByaXZhdGUsCiAJCQlyZXR1cm4gMDsKIAkJZG1hX2ZlbmNlX3B1
dCgqZmVuY2UpOwogCX0gZWxzZSB7Ci0JCXJldCA9IC1FSU5WQUw7CisJCXJldCA9IC1FTk9UQkxL
OwogCX0KIAogCWlmICghKGZsYWdzICYgRFJNX1NZTkNPQkpfV0FJVF9GTEFHU19XQUlUX0ZPUl9T
VUJNSVQpKQpAQCAtODMyLDcgKzgzMiw3IEBAIHN0YXRpYyBzaWduZWQgbG9uZyBkcm1fc3luY29i
al9hcnJheV93YWl0X3RpbWVvdXQoc3RydWN0IGRybV9zeW5jb2JqICoqc3luY29ianMsCiAJCQlp
ZiAoZmxhZ3MgJiBEUk1fU1lOQ09CSl9XQUlUX0ZMQUdTX1dBSVRfRk9SX1NVQk1JVCkgewogCQkJ
CWNvbnRpbnVlOwogCQkJfSBlbHNlIHsKLQkJCQl0aW1lb3V0ID0gLUVJTlZBTDsKKwkJCQl0aW1l
b3V0ID0gLUVOT1RCTEs7CiAJCQkJZ290byBjbGVhbnVwX2VudHJpZXM7CiAJCQl9CiAJCX0KLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
