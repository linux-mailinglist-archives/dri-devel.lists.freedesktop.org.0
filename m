Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53A4FF5E4
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 23:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FEE6E1B9;
	Sat, 16 Nov 2019 22:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770084.outbound.protection.outlook.com [40.107.77.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED166E054;
 Sat, 16 Nov 2019 22:01:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFURTdqsfYNbRZAzf1eQ0/fE9U6As15+TD0DQbSgudUM+EKHlJAtHAwU+wjM50GSTrIjqHCYmeIlg5IC9A6ucx7Wps0eIZ3sHRVMm2f3JFKfgzZDIyFMILhnFtWC2xtFbBkTs4w01Rfn+lR3W5OlA6VBB9ykUaXNtC0h/0lzlT3tJ8sutFDp2PWISPYinpYAuPYGD7da4UmxFwVDpW2ANPQHkftqwDp4M0c8NZ+G3QZjdJ9OJPFDGjZrwPg6hEmSxbGan01QggbbPg28EDfgDBxPp7Xoftn3EOvlVS0bQAwx3nisrnugrF0POXC4mmBxWS4wiL6ARUQvWW7rsVF69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNdUTtKZ1sW/55VPQ2xKYe/Mh8euES9APb8qlqbgb50=;
 b=Uu1/DylnCkhEUxZenzdIm3Yjc/FEhhby7O4qSxtOqzaYBb9dL0zcxzboTrXrRYrCZi1aOukr/MzylY4/phBwZz0uwBVG8HswjKOq6Yht+R84SbzkD6+3DNX+JjxxM6K0AXqcBFw7USrJjMPTAdL6N/TtnCuPAz38z5Rm3a0WpPWX1gD6nBKdB/PlVhOW4AOfV1j3RqflkrO7qAfW9nrgWtULg0KAYnnQNCaKQUlc26egQbCe0o1ogfWvms4DJ9QHYcnJpDoMZCwmCz2K/g4RoRkMNpdVsQhBgsggoU7oJHMZbviPRRVpFwfPoj1Ox8K6IQQES/SD4BpG0reCVi9FdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0007.namprd12.prod.outlook.com
 (2603:10b6:910:16::17) by BY5PR12MB4066.namprd12.prod.outlook.com
 (2603:10b6:a03:207::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Sat, 16 Nov
 2019 22:01:34 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::204) by CY4PR1201CA0007.outlook.office365.com
 (2603:10b6:910:16::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Sat, 16 Nov 2019 22:01:34 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Sat, 16 Nov 2019 22:01:33 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 16 Nov
 2019 16:01:32 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sat, 16 Nov 2019 16:01:32 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v7 02/17] drm/dp_mst: Parse FEC capability on MST ports
Date: Sat, 16 Nov 2019 17:01:13 -0500
Message-ID: <20191116220128.16598-3-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191116220128.16598-1-mikita.lipski@amd.com>
References: <20191116220128.16598-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(396003)(136003)(428003)(199004)(189003)(51416003)(54906003)(5660300002)(7696005)(26005)(2876002)(486006)(2616005)(126002)(11346002)(476003)(76176011)(6666004)(356004)(2351001)(50226002)(36756003)(1076003)(2906002)(8936002)(8676002)(81166006)(81156014)(316002)(305945005)(16586007)(336012)(4326008)(47776003)(50466002)(48376002)(6916009)(53416004)(70586007)(70206006)(478600001)(86362001)(426003)(186003)(446003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4066; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 330ff384-0a9c-4483-16cc-08d76ae08b53
X-MS-TrafficTypeDiagnostic: BY5PR12MB4066:
X-Microsoft-Antispam-PRVS: <BY5PR12MB40665B43DD5915E2ECEB192CE4730@BY5PR12MB4066.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 02234DBFF6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0F4gcQNhNqk7ZOBJevCuGyzR0mK64g8k68YUKp3mJGqZd1MRaEsB1FTL1w5LnT08/6z5ebaEOT2ssbWv2PdA2UU/mDLuNqtGME+En7Vag2vn9p6pECLGYdsE9SX2AonRdVE6qE3E0NY8hJZRmdJsPpIUdHBMGHWty3i7QQVTPm6Ag3ASILPKwJGk5CbDPb4HPCMJTtUXfWAMeVH/Emh8ToRmOnfh+wLzo/Kd0i6bm6iXwNhmEGJIX1btj6sjMG0kWmr8M9zMkJPK9aajBoDYBt6UQgTgFV9PbZAPJ7iewNW1aUjyTREPehM9wbsmd3MphnXeiUNIoh37b0TQG6Iws275WW/Kg2JFCXQxUsUhO9wLYJfaF2XZmqv+i2Fh9BLpiJxtitxE72rqoMkQvlBqTEZvFUdxL2HZ2LhQvUSD8HRoyMQ9YqyTai3skMIoghDF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2019 22:01:33.7320 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 330ff384-0a9c-4483-16cc-08d76ae08b53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4066
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNdUTtKZ1sW/55VPQ2xKYe/Mh8euES9APb8qlqbgb50=;
 b=BeLqNleHGoX9b+gr/lOtcQlB5Ae+XQmLPf4Z63ijKK7g1LF4VBDfCkGUl2KJuuNNmYCwNX/aJQl2A3DVoKh3Etun6en6QGPkqRFhAepgd6sMzWQ0MtdgdxDIPY4RxlNt1oHK9mBxjDeR6rc6VD/IJXXpiaXSkbCJn6qpJLgoPCY=
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
Cc: David Francis <David.Francis@amd.com>, Mikita
 Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKQXMgb2YgRFAxLjQs
IEVOVU1fUEFUSF9SRVNPVVJDRVMgcmV0dXJucyBhIGJpdCBpbmRpY2F0aW5nCmlmIEZFQyBjYW4g
YmUgc3VwcG9ydGVkIHVwIHRvIHRoYXQgcG9pbnQgaW4gdGhlIE1TVCBuZXR3b3JrLgoKVGhlIGJp
dCBpcyB0aGUgZmlyc3QgYnl0ZSBvZiB0aGUgRU5VTV9QQVRIX1JFU09VUkNFUyBhY2sgcmVwbHks
CmJvdHRvbS1tb3N0IGJpdCAocmVmZXIgdG8gc2VjdGlvbiAyLjExLjkuNCBvZiBEUCBzdGFuZGFy
ZCwKdjEuNCkKClRoYXQgdmFsdWUgaXMgbmVlZGVkIGZvciBGRUMgYW5kIERTQyBzdXBwb3J0CgpT
dG9yZSBpdCBvbiBkcm1fZHBfbXN0X3BvcnQKClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVk
ZUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5k
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAyICsrCiBpbmNs
dWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oICAgICAgIHwgMyArKysKIDIgZmlsZXMgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9t
c3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5k
ZXggM2U3Yjc1NTNjZjRkLi45ZjM2MDQzNTU3MDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3Rf
dG9wb2xvZ3kuYwpAQCAtNTUzLDYgKzU1Myw3IEBAIHN0YXRpYyBib29sIGRybV9kcF9zaWRlYmFu
ZF9wYXJzZV9lbnVtX3BhdGhfcmVzb3VyY2VzX2FjayhzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kCiB7
CiAJaW50IGlkeCA9IDE7CiAJcmVwbXNnLT51LnBhdGhfcmVzb3VyY2VzLnBvcnRfbnVtYmVyID0g
KHJhdy0+bXNnW2lkeF0gPj4gNCkgJiAweGY7CisJcmVwbXNnLT51LnBhdGhfcmVzb3VyY2VzLmZl
Y19jYXBhYmxlID0gcmF3LT5tc2dbaWR4XSAmIDB4MTsKIAlpZHgrKzsKIAlpZiAoaWR4ID4gcmF3
LT5jdXJsZW4pCiAJCWdvdG8gZmFpbF9sZW47CkBAIC0yMTgzLDYgKzIxODQsNyBAQCBzdGF0aWMg
aW50IGRybV9kcF9zZW5kX2VudW1fcGF0aF9yZXNvdXJjZXMoc3RydWN0IGRybV9kcF9tc3RfdG9w
b2xvZ3lfbWdyICptZ3IsCiAJCQlEUk1fREVCVUdfS01TKCJlbnVtIHBhdGggcmVzb3VyY2VzICVk
OiAlZCAlZFxuIiwgdHhtc2ctPnJlcGx5LnUucGF0aF9yZXNvdXJjZXMucG9ydF9udW1iZXIsIHR4
bXNnLT5yZXBseS51LnBhdGhfcmVzb3VyY2VzLmZ1bGxfcGF5bG9hZF9id19udW1iZXIsCiAJCQkg
ICAgICAgdHhtc2ctPnJlcGx5LnUucGF0aF9yZXNvdXJjZXMuYXZhaWxfcGF5bG9hZF9id19udW1i
ZXIpOwogCQkJcG9ydC0+YXZhaWxhYmxlX3BibiA9IHR4bXNnLT5yZXBseS51LnBhdGhfcmVzb3Vy
Y2VzLmF2YWlsX3BheWxvYWRfYndfbnVtYmVyOworCQkJcG9ydC0+ZmVjX2NhcGFibGUgPSB0eG1z
Zy0+cmVwbHkudS5wYXRoX3Jlc291cmNlcy5mZWNfY2FwYWJsZTsKIAkJfQogCX0KIApkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9k
cF9tc3RfaGVscGVyLmgKaW5kZXggOTExNmIyYzk1MjM5Li5mMTEzYWUwNGZhODggMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJt
X2RwX21zdF9oZWxwZXIuaApAQCAtMTA4LDYgKzEwOCw4IEBAIHN0cnVjdCBkcm1fZHBfbXN0X3Bv
cnQgewogCSAqIGF1ZGlvLWNhcGFibGUuCiAJICovCiAJYm9vbCBoYXNfYXVkaW87CisKKwlib29s
IGZlY19jYXBhYmxlOwogfTsKIAogLyoqCkBAIC0zMTIsNiArMzE0LDcgQEAgc3RydWN0IGRybV9k
cF9wb3J0X251bWJlcl9yZXEgewogCiBzdHJ1Y3QgZHJtX2RwX2VudW1fcGF0aF9yZXNvdXJjZXNf
YWNrX3JlcGx5IHsKIAl1OCBwb3J0X251bWJlcjsKKwlib29sIGZlY19jYXBhYmxlOwogCXUxNiBm
dWxsX3BheWxvYWRfYndfbnVtYmVyOwogCXUxNiBhdmFpbF9wYXlsb2FkX2J3X251bWJlcjsKIH07
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
