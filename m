Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C13219491D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 17:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844536E1F9;
	Mon, 19 Aug 2019 15:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710051.outbound.protection.outlook.com [40.107.71.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6193F6E1F3;
 Mon, 19 Aug 2019 15:50:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TR9RPBaxgYBGjDTe7PI7uLIY5tLtN8FFPZ9z7peDPp0B/qjXp2yKMnwiAyqXV6g1LSdChRtG/4P5yn2hbnF4dOPTExpDTloZ3NPafMltE/rp9NX2TToXPRNTZm3CnX9fIGrDNh7gyDlkKL6M1wqwITX8Eut5zXEiuyrQW/IyhGwATHIjzMFWFVDbPRknxmu5lmE58X0TUJihE6qbRl3x+1Axi1v9z4Jaf3nF0r5SrHtqZg7L9mfaUbQDawFfQnBME3YrVu59vuQqvSIoJ84kDBEEOlxsAsXA3LU/bwXWKlQvH5m0s5eu4PKpDqpWnJTo2ylLGBAhPNm/RWr9IPfUPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GFvOtddXCQAf/OBFxM32+ewiU65MASmgscCCRR9D6Q=;
 b=fwlPirTeOGgxzK4PJle0a9fIHRM4URnkJtB5QBTcUSsJzSdGkxvcG0vIS1VWSHyl5mi9xj4W6D+7otkogVrXH0q5E7OW0ZQkzCSFLcUpQv7uldzNMbQZP8XFfalkU3v9CRxw7CvMP0X/BEcrSobK1WU45DN44Q4D53JcwKoVOLSCv/4bd0cbiRqnkauCnWU2wGPiyJE73RfVHlegMgSmV6o+baZuhsZ8YMXkeMhNIoiPP/Kz99BuxzA3dRdg8genUWPDefTm44vi/D8wKloh0/hycTTwILwWvLoXmzSYpY0B21Xs86l61Ul8J+V8HrF41PgRXZ1ml2tSRw2ap1veyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0061.namprd12.prod.outlook.com (2603:10b6:0:56::29) by
 DM6PR12MB2713.namprd12.prod.outlook.com (2603:10b6:5:49::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 15:50:51 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM3PR12CA0061.outlook.office365.com
 (2603:10b6:0:56::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 15:50:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 15:50:50 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 19 Aug 2019 10:50:47 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/14] drm/amd/display: Enable SST DSC in DM
Date: Mon, 19 Aug 2019 11:50:29 -0400
Message-ID: <20190819155038.1771-6-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819155038.1771-1-David.Francis@amd.com>
References: <20190819155038.1771-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(2980300002)(428003)(189003)(199004)(6666004)(305945005)(356004)(47776003)(186003)(76176011)(51416003)(14444005)(70586007)(4326008)(81166006)(50466002)(426003)(486006)(11346002)(446003)(2616005)(476003)(126002)(48376002)(86362001)(26005)(54906003)(110136005)(478600001)(16586007)(316002)(49486002)(1076003)(336012)(36756003)(53936002)(2906002)(5660300002)(8936002)(450100002)(70206006)(50226002)(81156014)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2713; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e506c25d-c980-4b71-2861-08d724bd02b1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2713; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2713:
X-Microsoft-Antispam-PRVS: <DM6PR12MB27138A82B4FA2AF3DF9D39E9EFA80@DM6PR12MB2713.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:156;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: SkTzk9WZYR6GYm7+bEVr4riDoMR+iLigp4eY0VolJ1xnmnhRzMjcZAlJy3kPiyf5YuxqBIZGC4HhScBlTOgJsk5WqgQeoCk+xQRluv71a4rKlOaqZ7rVODz0JdqsfXakbJU1dAA/B0fx/FEOazZefjg2b3H1zftCqyCAoNmq30qFGMTCn3yyWMFn1Q5sgEymS1iz2IBvDPH7zqY4EeZi/OCGKUdk0cIhiBORrKIqzjX05DhnwKya0ESlm1v11/9UtSkeAqOg78T133Qc4D8gN5dHK9uUi4oj8W4xiEuoGl2MFdZRurcPjTnI59az8dw5T95ZZJxPPkAies4sET+jUWZQ/FRZ41a4gRaRk706RFzJ7YCwUTqCM7DRKUYrtbKoCJzD17Yv6ESxVYEVdR7UFRcjvX2/Cy0g4sTtsi86RFU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 15:50:50.7216 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e506c25d-c980-4b71-2861-08d724bd02b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2713
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GFvOtddXCQAf/OBFxM32+ewiU65MASmgscCCRR9D6Q=;
 b=YDXYrND1/FRAB+EdCunYOG0VGsg0WgLP/QkAFaoBMDN5Srujvpl2+bSrMfyruHx/HoY0Pnz7rQcqkNa/rB/pdZXVOlVcLm7SwAtweKpvg78lqxerAvjaoY+OK/BuIscuPU/NJeC8NdE2BHCeQWvL7vsTvo/+1yIdG/HC/mna4lY=
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
Cc: David Francis <David.Francis@amd.com>,
 Mikita Lipski <Mikita.Lipski@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gY3JlYXRlX3N0cmVhbV9mb3Jfc2luaywgY2hlY2sgZm9yIFNTVCBEUCBjb25uZWN0b3JzCgpQ
YXJzZSBEU0MgY2FwcyB0byBEQyBmb3JtYXQsIHRoZW4sIGlmIERTQyBpcyBzdXBwb3J0ZWQsCmNv
bXB1dGUgdGhlIGNvbmZpZwoKRFNDIGhhcmR3YXJlIHdpbGwgYmUgcHJvZ3JhbW1lZCBieSBkY19j
b21taXRfc3RhdGUKCkNjOiBNaWtpdGEgTGlwc2tpIDxNaWtpdGEuTGlwc2tpQGFtZC5jb20+ClNp
Z25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KLS0tCiAu
Li4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAzMiArKysrKysr
KysrKystLS0tLS0tCiAuLi4vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJz
LmMgfCAgNCArKy0KIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMKaW5kZXggOTExZmU3OGI0N2MxLi44NDI0OTA1N2UxODEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtMzU3Niw2
ICszNTc2LDEwIEBAIGNyZWF0ZV9zdHJlYW1fZm9yX3Npbmsoc3RydWN0IGFtZGdwdV9kbV9jb25u
ZWN0b3IgKmFjb25uZWN0b3IsCiAJYm9vbCBzY2FsZSA9IGRtX3N0YXRlID8gKGRtX3N0YXRlLT5z
Y2FsaW5nICE9IFJNWF9PRkYpIDogZmFsc2U7CiAJaW50IG1vZGVfcmVmcmVzaDsKIAlpbnQgcHJl
ZmVycmVkX3JlZnJlc2ggPSAwOworI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JU
CisJc3RydWN0IGRzY19kZWNfZHBjZF9jYXBzIGRzY19jYXBzOworCXVpbnQzMl90IGxpbmtfYmFu
ZHdpZHRoX2ticHM7CisjZW5kaWYKIAogCXN0cnVjdCBkY19zaW5rICpzaW5rID0gTlVMTDsKIAlp
ZiAoYWNvbm5lY3RvciA9PSBOVUxMKSB7CkBAIC0zNjQ4LDE3ICszNjUyLDIzIEBAIGNyZWF0ZV9z
dHJlYW1fZm9yX3Npbmsoc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IsCiAJ
CQkmbW9kZSwgJmFjb25uZWN0b3ItPmJhc2UsIGNvbl9zdGF0ZSwgb2xkX3N0cmVhbSk7CiAKICNp
ZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAotCS8qIHN0cmVhbS0+dGltaW5nLmZs
YWdzLkRTQyA9IDA7ICovCi0gICAgICAgIC8qICAqLwotCS8qIGlmIChhY29ubmVjdG9yLT5kY19s
aW5rICYmICovCi0JLyogCQlhY29ubmVjdG9yLT5kY19saW5rLT5jb25uZWN0b3Jfc2lnbmFsID09
IFNJR05BTF9UWVBFX0RJU1BMQVlfUE9SVCAjPHsofCYmICovCi0JLyogCQlhY29ubmVjdG9yLT5k
Y19saW5rLT5kcGNkX2NhcHMuZHNjX2NhcHMuZHNjX2Jhc2ljX2NhcHMuaXNfZHNjX3N1cHBvcnRl
ZHwpfT4jKSAqLwotCS8qIAlpZiAoZGNfZHNjX2NvbXB1dGVfY29uZmlnKGFjb25uZWN0b3ItPmRj
X2xpbmstPmN0eC0+ZGMsICovCi0JLyogCQkJJmFjb25uZWN0b3ItPmRjX2xpbmstPmRwY2RfY2Fw
cy5kc2NfY2FwcywgKi8KLQkvKiAJCQlkY19saW5rX2JhbmR3aWR0aF9rYnBzKGFjb25uZWN0b3It
PmRjX2xpbmssIGRjX2xpbmtfZ2V0X2xpbmtfY2FwKGFjb25uZWN0b3ItPmRjX2xpbmspKSwgKi8K
LQkvKiAJCQkmc3RyZWFtLT50aW1pbmcsICovCi0JLyogCQkJJnN0cmVhbS0+dGltaW5nLmRzY19j
ZmcpKSAqLwotCS8qIAkJc3RyZWFtLT50aW1pbmcuZmxhZ3MuRFNDID0gMTsgKi8KKwlzdHJlYW0t
PnRpbWluZy5mbGFncy5EU0MgPSAwOworCisJaWYgKGFjb25uZWN0b3ItPmRjX2xpbmsgJiYgc2lu
ay0+c2lua19zaWduYWwgPT0gU0lHTkFMX1RZUEVfRElTUExBWV9QT1JUKSB7CisJCWRjX2RzY19w
YXJzZV9kc2NfZHBjZChhY29ubmVjdG9yLT5kY19saW5rLT5kcGNkX2NhcHMuZHNjX2NhcHMuZHNj
X2Jhc2ljX2NhcHMucmF3LAorCQkJCSAgICAgIGFjb25uZWN0b3ItPmRjX2xpbmstPmRwY2RfY2Fw
cy5kc2NfY2Fwcy5kc2NfZXh0X2NhcHMucmF3LAorCQkJCSAgICAgICZkc2NfY2Fwcyk7CisJCWxp
bmtfYmFuZHdpZHRoX2ticHMgPSBkY19saW5rX2JhbmR3aWR0aF9rYnBzKGFjb25uZWN0b3ItPmRj
X2xpbmssCisJCQkJCQkJICAgICBkY19saW5rX2dldF9saW5rX2NhcChhY29ubmVjdG9yLT5kY19s
aW5rKSk7CisKKwkJaWYgKGRzY19jYXBzLmlzX2RzY19zdXBwb3J0ZWQpCisJCQlpZiAoZGNfZHNj
X2NvbXB1dGVfY29uZmlnKGFjb25uZWN0b3ItPmRjX2xpbmstPmN0eC0+ZGMsCisJCQkJCQkgICZk
c2NfY2FwcywKKwkJCQkJCSAgbGlua19iYW5kd2lkdGhfa2JwcywKKwkJCQkJCSAgJnN0cmVhbS0+
dGltaW5nLAorCQkJCQkJICAmc3RyZWFtLT50aW1pbmcuZHNjX2NmZykpCisJCQkJc3RyZWFtLT50
aW1pbmcuZmxhZ3MuRFNDID0gMTsKKwl9CiAjZW5kaWYKIAogCXVwZGF0ZV9zdHJlYW1fc2NhbGlu
Z19zZXR0aW5ncygmbW9kZSwgZG1fc3RhdGUsIHN0cmVhbSk7CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKaW5k
ZXggN2NmMDU3M2FiMjVmLi41ZjJjMzE1YjE4YmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKQEAgLTU0
OSw3ICs1NDksOSBAQCBib29sIGRtX2hlbHBlcnNfZHBfd3JpdGVfZHNjX2VuYWJsZSgKIAkJYm9v
bCBlbmFibGUKICkKIHsKLQlyZXR1cm4gZmFsc2U7CisJdWludDhfdCBlbmFibGVfZHNjID0gZW5h
YmxlID8gMSA6IDA7CisKKwlyZXR1cm4gZG1faGVscGVyc19kcF93cml0ZV9kcGNkKGN0eCwgc3Ry
ZWFtLT5zaW5rLT5saW5rLCBEUF9EU0NfRU5BQkxFLCAmZW5hYmxlX2RzYywgMSk7CiB9CiAjZW5k
aWYKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
