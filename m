Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1294C3A45
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 18:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96776E862;
	Tue,  1 Oct 2019 16:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770055.outbound.protection.outlook.com [40.107.77.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4896E85F;
 Tue,  1 Oct 2019 16:17:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AC2EpuHKmrgl9HGET1LnEtL1tlUPJj1TV1nWbGLBuE6b4W5uyi7sxLqWFGrOnvbzNBwmKSiXAcxMC7m/5NkaFzV4UpyZtVWVt4JvMx67iK3CvblpU61+NT3E2d5LR5lFu6GBg/Rf1HnO/GKn+GbfdpqZvAAOFD6kvLL+ARd8u9f5IC47cGy7kXjdx8mhshwGrXha1ulYxzb1GZ4VA5xW6XfIHriF935XDQf+OcowcAdINrO0PMjgrDEOjjFWWpovyadg4SDE+8dmMV7AYmh2TV8F78i2mWPhxj+zC65FnRZWGKthHQ37Jqm48eJf/f4x4y1zuTjJp9F6zOAI4LCL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sggqry2rHdBKGLVlluhu/5dBl0eopBo0TyVURrldDDI=;
 b=OnXPPjnuHk2ZXUpuq5o+lx9OkhCJvVsbljwYPBaGY9NiBjYgqhZqeWS6T2u42R1jLnh7Hla5FL7NSJDOtkEW0twgCUKm6I2VqSyACk7E6XipjA6ii4G2g9zju/xGrhahDhc4WXw2uRdcmHbnrkhgpzZPrzaPEujcKMmLwJJDXTHNLw0S/y/bHy5MwolTb1cDQ+ZB3vAhf5UJUV5Fg71cQc6kWrfP6S7QLgKckNUMeodm+OXLLYo6GWWeUcO4dah1+eKSp2I91NAVGD8QXD52vC8KL+7m2TlEjqdcAOV1TpZf9e7MsdldvyMqCr1Cg3k/EgkZT9f8FOd3hy7oGX/vdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0016.namprd12.prod.outlook.com (2603:10b6:408:60::29)
 by DM6PR12MB3196.namprd12.prod.outlook.com (2603:10b6:5:184::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Tue, 1 Oct
 2019 16:17:50 +0000
Received: from CO1NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by BN8PR12CA0016.outlook.office365.com
 (2603:10b6:408:60::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.18 via Frontend
 Transport; Tue, 1 Oct 2019 16:17:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT027.mail.protection.outlook.com (10.152.80.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 16:17:48 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 1 Oct 2019
 11:17:41 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 14/14] drm/amd/display: Trigger modesets on MST DSC connectors
Date: Tue, 1 Oct 2019 12:17:21 -0400
Message-ID: <20191001161721.13793-15-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001161721.13793-14-mikita.lipski@amd.com>
References: <20191001161721.13793-1-mikita.lipski@amd.com>
 <20191001161721.13793-2-mikita.lipski@amd.com>
 <20191001161721.13793-3-mikita.lipski@amd.com>
 <20191001161721.13793-4-mikita.lipski@amd.com>
 <20191001161721.13793-5-mikita.lipski@amd.com>
 <20191001161721.13793-6-mikita.lipski@amd.com>
 <20191001161721.13793-7-mikita.lipski@amd.com>
 <20191001161721.13793-8-mikita.lipski@amd.com>
 <20191001161721.13793-9-mikita.lipski@amd.com>
 <20191001161721.13793-10-mikita.lipski@amd.com>
 <20191001161721.13793-11-mikita.lipski@amd.com>
 <20191001161721.13793-12-mikita.lipski@amd.com>
 <20191001161721.13793-13-mikita.lipski@amd.com>
 <20191001161721.13793-14-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(428003)(199004)(189003)(76176011)(70586007)(7696005)(486006)(5660300002)(476003)(26005)(11346002)(50466002)(446003)(6666004)(126002)(356004)(305945005)(51416003)(70206006)(1076003)(478600001)(2616005)(36756003)(47776003)(336012)(16586007)(86362001)(8936002)(8676002)(2906002)(81166006)(81156014)(4326008)(53416004)(186003)(48376002)(426003)(2351001)(50226002)(54906003)(316002)(2876002)(6916009)(14444005)(5024004)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3196; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e3a807f-4be2-4e2b-32f3-08d7468ae6f6
X-MS-TrafficTypeDiagnostic: DM6PR12MB3196:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3196686BF161928671774975E49D0@DM6PR12MB3196.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0177904E6B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DVB8tJpU2YoI2x1AbWKfKAuDy8NkfgA1ZPEScMctLAKOaKBQjBHJeLGZDyU//FhYi77ewAB4hi9YVuY3CcLvkiDgeYP1Vk0TtDj4C0Mula2wQeMmHB80rnkEx6hj+QnGkn3FT5IhwrfJiD/2QocKBSYtX6GbrjXfY1zBSJ6Fhp0JL3g4PQtpd57CYmX//Ug50ibwgFdUal3DpYISUrYWejNMfEsKhUNNYxFYDgwmaR9Y4FRseLhhLQuf6S4zYBXQVa2K58C82LkOVbm+HGMmOlir/4kU/MfNzC8NlCCx8Yi7QLHVEx5caI2QsjvwYrtKM0jpegDY9g67GVNfQkEhB0jEky70saB+jCbuHoD++omKgRY4JnUDXevj0RthXVX2f5yN1jcNOMd5myFE0zmhswHzbr6sXN5RsKLMxYRovfY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 16:17:48.8428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3a807f-4be2-4e2b-32f3-08d7468ae6f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3196
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sggqry2rHdBKGLVlluhu/5dBl0eopBo0TyVURrldDDI=;
 b=1v3gfv4wfKCMhF90KrX/C6K1ZfEE5Kb/DpHdi0oorbpIXjrJ4UN5XHxyPJnk2PB3yYYm67Xay5Zka3rQbLgtMkKP2Y2LhUck9wtOe/O3RSG7sgfomenJ88keUKxzwKzLzzk4bIUV7tIgoKO/U4nRE/CP0TmTvjRmEq6+sVNAbwk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKV2hlbmV2ZXIgYSBj
b25uZWN0b3Igb24gYW4gTVNUIG5ldHdvcmsgaXMgYXR0YWNoZWQsIGRldGFjaGVkLCBvcgp1bmRl
cmdvZXMgYSBtb2Rlc2V0LCB0aGUgRFNDIGNvbmZpZ3MgZm9yIGVhY2ggc3RyZWFtIG9uIHRoYXQK
dG9wb2xvZ3kgd2lsbCBiZSByZWNhbGN1bGF0ZWQuIFRoaXMgY2FuIGNoYW5nZSB0aGVpciByZXF1
aXJlZApiYW5kd2lkdGgsIHJlcXVpcmluZyBhIGZ1bGwgcmVwcm9ncmFtbWluZywgYXMgdGhvdWdo
IGEgbW9kZXNldAp3YXMgcGVyZm9ybWVkLCBldmVuIGlmIHRoYXQgc3RyZWFtIGRpZCBub3QgY2hh
bmdlIHRpbWluZy4KClRoZXJlZm9yZSwgd2hlbmV2ZXIgYSBjcnRjIGhhcyBkcm1fYXRvbWljX2Ny
dGNfbmVlZHNfbW9kZXNldCwKZm9yIGVhY2ggY3J0YyB0aGF0IHNoYXJlcyBhIE1TVCB0b3BvbG9n
eSB3aXRoIHRoYXQgc3RyZWFtIGFuZApzdXBwb3J0cyBEU0MsIGFkZCB0aGF0IGNydGMgKGFuZCBh
bGwgYWZmZWN0ZWQgY29ubmVjdG9ycyBhbmQKcGxhbmVzKSB0byB0aGUgYXRvbWljIHN0YXRlIGFu
ZCBzZXQgbW9kZV9jaGFuZ2VkIG9uIGl0cyBzdGF0ZQoKdjI6IERvIHRoaXMgY2hlY2sgb25seSBv
biBOYXZpIGFuZCBiZWZvcmUgYWRkaW5nIGNvbm5lY3RvcnMKYW5kIHBsYW5lcyBvbiBtb2Rlc2V0
dGluZyBjcnRjcwoKQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogTmljaG9sYXMg
S2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgpDYzogTHl1ZGUgUGF1bCA8
bHl1ZGVAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJh
bmNpc0BhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYyB8IDc5ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3OSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMKaW5kZXggNzUwMWNlMjIzM2VkLi4zNzEwODZhNjdjNjggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtNjg4
OCw2ICs2ODg4LDc0IEBAIHN0YXRpYyBpbnQgZG9fYXF1aXJlX2dsb2JhbF9sb2NrKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsCiAJcmV0dXJuIHJldCA8IDAgPyByZXQgOiAwOwogfQogCisjaWZkZWYg
Q09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQKKy8qCisgKiBUT0RPOiBUaGlzIGxvZ2ljIHNo
b3VsZCBhdCBzb21lIHBvaW50IGJlIG1vdmVkIGludG8gRFJNCisgKi8KK3N0YXRpYyBpbnQgYWRk
X2FmZmVjdGVkX21zdF9kc2NfY3J0Y3Moc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLCBz
dHJ1Y3QgZHJtX2NydGMgKmNydGMpCit7CisJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
cjsKKwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZTsKKwlzdHJ1Y3QgZHJt
X2Nvbm5lY3Rvcl9saXN0X2l0ZXIgY29ubl9pdGVyOworCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAq
bmV3X2NydGNfc3RhdGU7CisJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3Ig
PSBOVUxMLCAqYWNvbm5lY3Rvcl90b19hZGQ7CisJaW50IGksIGo7CisJc3RydWN0IGRybV9jcnRj
ICpjcnRjc19hZmZlY3RlZFtBTURHUFVfTUFYX0NSVENTXSA9IHsgMCB9OworCisJZm9yX2VhY2hf
bmV3X2Nvbm5lY3Rvcl9pbl9zdGF0ZShzdGF0ZSwgY29ubmVjdG9yLCBjb25uX3N0YXRlLCBpKSB7
CisJCWlmIChjb25uX3N0YXRlLT5jcnRjICE9IGNydGMpCisJCQljb250aW51ZTsKKworCQlhY29u
bmVjdG9yID0gdG9fYW1kZ3B1X2RtX2Nvbm5lY3Rvcihjb25uZWN0b3IpOworCQlpZiAoIWFjb25u
ZWN0b3ItPnBvcnQpCisJCQlhY29ubmVjdG9yID0gTlVMTDsKKwkJZWxzZQorCQkJYnJlYWs7CisJ
fQorCisJaWYgKCFhY29ubmVjdG9yKQorCQlyZXR1cm4gMDsKKworCWkgPSAwOworCWRybV9jb25u
ZWN0b3JfbGlzdF9pdGVyX2JlZ2luKHN0YXRlLT5kZXYsICZjb25uX2l0ZXIpOworCWRybV9mb3Jf
ZWFjaF9jb25uZWN0b3JfaXRlcihjb25uZWN0b3IsICZjb25uX2l0ZXIpIHsKKwkJaWYgKCFjb25u
ZWN0b3ItPnN0YXRlIHx8ICFjb25uZWN0b3ItPnN0YXRlLT5jcnRjKQorCQkJY29udGludWU7CisK
KwkJYWNvbm5lY3Rvcl90b19hZGQgPSB0b19hbWRncHVfZG1fY29ubmVjdG9yKGNvbm5lY3Rvcik7
CisJCWlmICghYWNvbm5lY3Rvcl90b19hZGQtPnBvcnQpCisJCQljb250aW51ZTsKKworCQlpZiAo
YWNvbm5lY3Rvcl90b19hZGQtPnBvcnQtPm1nciAhPSBhY29ubmVjdG9yLT5wb3J0LT5tZ3IpCisJ
CQljb250aW51ZTsKKworCQlpZiAoIWFjb25uZWN0b3JfdG9fYWRkLT5kY19zaW5rKQorCQkJY29u
dGludWU7CisKKwkJaWYgKCFhY29ubmVjdG9yX3RvX2FkZC0+ZGNfc2luay0+c2lua19kc2NfY2Fw
cy5kc2NfZGVjX2NhcHMuaXNfZHNjX3N1cHBvcnRlZCkKKwkJCWNvbnRpbnVlOworCisJCWlmIChp
ID49IEFNREdQVV9NQVhfQ1JUQ1MpCisJCQljb250aW51ZTsKKworCQljcnRjc19hZmZlY3RlZFtp
XSA9IGNvbm5lY3Rvci0+c3RhdGUtPmNydGM7CisJCWkrKzsKKwl9CisJZHJtX2Nvbm5lY3Rvcl9s
aXN0X2l0ZXJfZW5kKCZjb25uX2l0ZXIpOworCisJZm9yIChqID0gMDsgaiA8IGk7IGorKykgewor
CQluZXdfY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X2NydGNfc3RhdGUoc3RhdGUsIGNydGNz
X2FmZmVjdGVkW2pdKTsKKwkJaWYgKElTX0VSUihuZXdfY3J0Y19zdGF0ZSkpCisJCQlyZXR1cm4g
UFRSX0VSUihuZXdfY3J0Y19zdGF0ZSk7CisKKwkJbmV3X2NydGNfc3RhdGUtPm1vZGVfY2hhbmdl
ZCA9IHRydWU7CisJfQorCisJcmV0dXJuIDA7CisKK30KKyNlbmRpZgorCiBzdGF0aWMgdm9pZCBn
ZXRfZnJlZXN5bmNfY29uZmlnX2Zvcl9jcnRjKAogCXN0cnVjdCBkbV9jcnRjX3N0YXRlICpuZXdf
Y3J0Y19zdGF0ZSwKIAlzdHJ1Y3QgZG1fY29ubmVjdG9yX3N0YXRlICpuZXdfY29uX3N0YXRlKQpA
QCAtNzU3Nyw2ICs3NjQ1LDE3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2F0b21pY19jaGVjayhz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCWlmIChyZXQpCiAJCWdvdG8gZmFpbDsKIAorI2lmZGVm
IENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCisJaWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBD
SElQX05BVkkxMCkgeworCQlmb3JfZWFjaF9vbGRuZXdfY3J0Y19pbl9zdGF0ZShzdGF0ZSwgY3J0
Yywgb2xkX2NydGNfc3RhdGUsIG5ld19jcnRjX3N0YXRlLCBpKSB7CisJCQlpZiAoZHJtX2F0b21p
Y19jcnRjX25lZWRzX21vZGVzZXQobmV3X2NydGNfc3RhdGUpKSB7CisJCQkJcmV0ID0gYWRkX2Fm
ZmVjdGVkX21zdF9kc2NfY3J0Y3Moc3RhdGUsIGNydGMpOworCQkJCWlmIChyZXQpCisJCQkJCWdv
dG8gZmFpbDsKKwkJCX0KKwkJfQorCX0KKyNlbmRpZgogCWZvcl9lYWNoX29sZG5ld19jcnRjX2lu
X3N0YXRlKHN0YXRlLCBjcnRjLCBvbGRfY3J0Y19zdGF0ZSwgbmV3X2NydGNfc3RhdGUsIGkpIHsK
IAkJaWYgKCFkcm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldChuZXdfY3J0Y19zdGF0ZSkgJiYK
IAkJICAgICFuZXdfY3J0Y19zdGF0ZS0+Y29sb3JfbWdtdF9jaGFuZ2VkICYmCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
