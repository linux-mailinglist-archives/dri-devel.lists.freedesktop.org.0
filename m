Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413ABB6DA7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 22:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68AE72AED;
	Wed, 18 Sep 2019 20:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790075.outbound.protection.outlook.com [40.107.79.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1457E72AF0;
 Wed, 18 Sep 2019 20:27:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asa2SGZeycI+ofGG2pJWkPpEzE6aiYI3Bx3B7VeOGhL38yG6mVruiYftv6JKq8Ybxp6OsK8Cmi1hns0FId2M4apCpV68Qf9ldSXEDZAkuhLIpaqjcIq6IST38mOeFXn+DBUd2rGcHYX+YCCmU1oYpcUIUFLnJK8UpcoiI5uXddoUqccgDIWAUuP3cM5Yzr2G9deKompvhHk/noisyGsrPFdHLvSBYJ3ILQY73EEAeAAsCNhT003m80g1eXil3b0i/Po0w+6LBYJulMYBEt1THM2G4WJSn89XAMpIjt9TBgawICnwvQ7OP3ohVDEXMdSO3o/2Iy9qvtqbT5YN6+1k3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUfZgIwD1rePH/tVdrGcC1P2b9Ue3WC2kRCiLT12iUY=;
 b=HVk69+/CofBcvFNT5VBxb97upqeztcCNz9JXr8kFl2w+NHeQfzzOcq+rqDfnCQqJvQTa+5Vn3wB82F9ooqLwZu4DVuAR81BWfgFHI4bIVZ8oFZQVsha4kBRLtnsj+jfFvLr7qdWKP1NV5/y9oimQ7hdu9DMuV2VEvGtQSPMcRBC4L21b3mC1+XcmmeOx4RhlHdvoIU6bpwu1reyKJdt1XYf+ApBQ7kxxcVmE2XZiiXXNEG4+Us/5xjb/HtitG12Dqung66OMAbXPvqfyPRQgGcKtJMscHSLly+MPmilOqR9O9dyEa4Xzj4L6RSzyxpKssSpTvgG5Ju5P3ULin+atbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0006.namprd12.prod.outlook.com
 (2603:10b6:301:4a::16) by MN2PR12MB3631.namprd12.prod.outlook.com
 (2603:10b6:208:c2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.17; Wed, 18 Sep
 2019 20:27:38 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by MWHPR1201CA0006.outlook.office365.com
 (2603:10b6:301:4a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.20 via Frontend
 Transport; Wed, 18 Sep 2019 20:27:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Wed, 18 Sep 2019 20:27:37 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 18 Sep 2019
 15:27:37 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/15] drm/amd/display: Trigger modesets on MST DSC connectors
Date: Wed, 18 Sep 2019 16:26:52 -0400
Message-ID: <fbff57f89938557aed2dda72881b9cc1d95802ab.1568833906.git.mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568833906.git.mikita.lipski@amd.com>
References: <cover.1568833906.git.mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(428003)(199004)(189003)(76176011)(2351001)(478600001)(70586007)(54906003)(26005)(186003)(7696005)(16586007)(51416003)(8676002)(81166006)(70206006)(50226002)(4326008)(81156014)(47776003)(316002)(118296001)(14444005)(53416004)(5024004)(126002)(8936002)(36756003)(6916009)(2616005)(48376002)(305945005)(50466002)(6666004)(2906002)(476003)(336012)(86362001)(356004)(486006)(426003)(2876002)(446003)(11346002)(5660300002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3631; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa1beeda-044a-40c8-adc3-08d73c76a585
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MN2PR12MB3631; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3631:
X-Microsoft-Antispam-PRVS: <MN2PR12MB363126A96CBE7683C1BC6D69E48E0@MN2PR12MB3631.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 01644DCF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: IoVgZT9tmJFrQfOqrUWBCtQsywwbfUQ12TttxcMhf+b/5FmZ1znL+g1VxyhO9Xl2ziturqRyq66wLDx4S++Z/rAP3VtEw7DqnAvZC840ORv6aw160oEDoI4jBE8aP8dAErPanyb4unqakHQ4+6ENm3fgpfw77yimO111i0m0ye0A6tTL7iqLPmgaC7ueOF22xVIAg9BM0F1DFJ/u7rRglFZVTzNUXjuohLFOvmtUL+ozTxI5ZWQMM8H2+qBg6Nzpa26jKmBnwtRZ9myKQZWaK/vaQI0zbyTbCSSPFeXhPZx7qQRg03EzNJFFe4aJx7DGOieq7OyTmRVqYp9I9QcjRKMnnxinx5L8z8ENX4fSHIb8wqweJiRJv8PaFxTUEcQj2fCfBhqaWMYKDmapyBo/QKBEM4EdQYFNgr0y5byHkzg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 20:27:37.6052 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1beeda-044a-40c8-adc3-08d73c76a585
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3631
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUfZgIwD1rePH/tVdrGcC1P2b9Ue3WC2kRCiLT12iUY=;
 b=a80rVA7/oyOB6NK9ui/lq88ZKPf+oint7uayiyv4IYnHlOAvCgOLQMcMVcDt1Ypvi9EhNu8YhPwVbeF4XKQDGJ1uvsYJZl3pGHsEj6W/FvUVcRhIkS0DWT2D7hpobkDJQEui5kiW6fR9Im6BCFa1nfN6bRHygCoQvOPeyJqKbvM=
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
YW1kZ3B1X2RtLmMKaW5kZXggYmEwMTdlNmJmMGI0Li5mNjUzMjZlODViODYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtNjcw
NCw2ICs2NzA0LDc0IEBAIHN0YXRpYyBpbnQgZG9fYXF1aXJlX2dsb2JhbF9sb2NrKHN0cnVjdCBk
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
QCAtNzM4OCw2ICs3NDU2LDE3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2F0b21pY19jaGVjayhz
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
