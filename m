Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E2FF3322
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CE96F6FE;
	Thu,  7 Nov 2019 15:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700054.outbound.protection.outlook.com [40.107.70.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA2E6F6FD;
 Thu,  7 Nov 2019 15:32:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1MSNJCTXQIXWM5TG2bUs8TJhFTmdpULt5+RckzucEermfj+7Xofw2+3k42rcOHUF48XnjRYrY9gnCWQiXvLUSOgoeBWcSlTfnaNWQB3cysmzYEaWlmXv/t0JOkLTkR/cSC/jYGG9IDXtmQmMm4aCg4VON/sIXMbvXNdcq6QyUNTSETWIVCDq+jAWgo2W6laczz5HUZt9ZgpRDXWoaMmWzTWHQoq8hmYkvmxufdSpKeYAFvLup+mXYMjU/e7nDsKtIGGwi74BMJVY7u0HfDpuWOxeNzDdxlOMaG9YzS7WXjKZsSe6EFxq4C4gnCXlo9cRlu54vAGuFUtjk1nUAk9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezE+IKck+Q2kcoJwpEDNe5TBwAjzRlxrEtMMZofmD8Q=;
 b=a895bzM36gegSLwND0ZB20jm98NIenpj2Fbv8p10aNozK6Oig8nAUHX0xbiC9julRx6roQYcqm4Bsavvn3HTIv05FNlNKwMjF0BiZOA/g+BbTSlhSpU2Wn3EW3relXx3zniqvihNsjBwRgPF9hop/eBaVudfm4bxCESzeHw4OUwOBVV4BOC0m0wpmZV4JeDMzVAezsCFikail5lr+9bB5fVGPptavu13C4W1i10DQF+AFuYAZUbNU07eFqt7r6KEd3ynR7mTB1KqzO4P8TdGFBJC1E8gAK50VosIrc40D9uvqQQmH2xksqCkyiom36iNe7bcn0eRP+Ku472k6r1EVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0036.namprd12.prod.outlook.com (2603:10b6:408:60::49)
 by BN8PR12MB3540.namprd12.prod.outlook.com (2603:10b6:408:6c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24; Thu, 7 Nov
 2019 15:32:18 +0000
Received: from DM3NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by BN8PR12CA0036.outlook.office365.com
 (2603:10b6:408:60::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.23 via Frontend
 Transport; Thu, 7 Nov 2019 15:32:18 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT051.mail.protection.outlook.com (10.152.83.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2430.20 via Frontend Transport; Thu, 7 Nov 2019 15:32:18 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 7 Nov 2019
 09:32:17 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 7 Nov 2019 09:32:17 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 00/13] DSC MST support for DRM and AMDGPU
Date: Thu, 7 Nov 2019 10:31:59 -0500
Message-ID: <20191107153212.1145-1-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(346002)(39860400002)(428003)(189003)(199004)(36756003)(336012)(16586007)(4326008)(478600001)(81156014)(50466002)(450100002)(316002)(51416003)(476003)(8936002)(53416004)(2616005)(47776003)(54906003)(48376002)(81166006)(6916009)(50226002)(86362001)(5660300002)(2906002)(2876002)(305945005)(14444005)(356004)(486006)(186003)(2351001)(6666004)(26005)(70586007)(426003)(126002)(70206006)(8676002)(1076003)(7696005)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3540; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f96c37b4-da74-4155-c1ed-08d76397acbf
X-MS-TrafficTypeDiagnostic: BN8PR12MB3540:
X-Microsoft-Antispam-PRVS: <BN8PR12MB35404D683535E493855CB4E8E4780@BN8PR12MB3540.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0214EB3F68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yR4rW87h/M4grE/4reJVwRbFBVxNeiX05DWddL8nYpKgj3odcJHudTXK10i8yo+OcIDn6s4KRQH3ChBnVIHiJDVEXGP19lFBsjXxXlBfqRJR+1bfU57wKnkhNODwF/MmNcnWn6v2IR6y0pxiztOUogxIEI1ANd6/f2Qq6Y4oarFXyJm7+ORXgw1Rqzl1+hHV0Ly6606HzRr8/FGczyJwJgkwEArqPV/q+MD5CB1QxqpCOs6mRKvX7UK1r1/4fMLhokcu2XkTivSISsS787jZDUnEcjEbfIMqk42Bt1HS0YmPVug1zuTw44Nt7hJoehS21Gh8DKN0/f0C8eeTMNqRQ1/JhCL9Uqf5ntI/CaQ5DRb3YMEn4AycXn7W3Ok4w/o0NmSsgyC3aOnaovtJbsZPWnZ2IZW7/pMx3t7Y155oSicgyq/ult6dqThzZrIamNw8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 15:32:18.4823 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f96c37b4-da74-4155-c1ed-08d76397acbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezE+IKck+Q2kcoJwpEDNe5TBwAjzRlxrEtMMZofmD8Q=;
 b=xYQkRZAmNrzSQEboXX+dNx2qlTu07JzS5XeJ7n5IoBf++TTc3XbmIv4hNEckxT8npaYM2Y1SC+ed+g5+d2MXnIGefmjn0BXrBd/awwTYpc8cu34vCGCOmywE9CbxH09mYolUlG7PZS+PqpwvplXsK9siZk2UEdVZ/7Yb8aHcaZk=
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKUGF0Y2hlcyBhcmUg
YmFzZWQgb2YgYW1kLXN0YWdpbmctZHJtLW5leHQsIHRoZSBmb2xsb3cgdXAKc2V0IG9mIHBhdGNo
ZXMgd2lsbCBiZSBzZW50IGZvciBkcm0tdGlwCgpUaGlzIHNldCBvZiBwYXRjaGVzIGlzIGEgY29u
dGludWF0aW9uIG9mIERTQyBlbmFibGVtZW50CnBhdGNoZXMgZm9yIEFNREdQVS4gVGhpcyBzZXQg
ZW5hYmxlcyBEU0Mgb24gTVNULiBJdCBhbHNvCmNvbnRhaW5zIGltcGxlbWVudGF0aW9uIG9mIGJv
dGggZW5jb2RlciBhbmQgY29ubmVjdG9yCmF0b21pYyBjaGVjayByb3V0aW5lcy4KCkZpcnN0IDEw
IHBhdGNoZXMgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gbXVsdGlwbGUKaXRlcmF0aW9ucyB0byB0
aGUgbWFpbGluZyBsaXN0IGJlZm9yZS4gVGhlc2UgcGF0Y2hlcyB3ZXJlCmRldmVsb3BlZCBieSBE
YXZpZCBGcmFuY2lzIGFzIHBhcnQgb2YgaGlzIHdvcmsgb24gRFNDLgoKdjI6IHNxdWFzaGVkIHBy
ZXZpb3VzbHkgMyBzZXBhcmF0ZSBhdG9taWMgY2hlY2sgcGF0Y2hlcywKc2VwYXJhdGUgYXRvbWlj
IGNoZWNrIGZvciBkc2MgY29ubmVjdG9ycywgdHJhY2sgdmNwaSBhbmQKcGJuIG9uIGNvbm5lY3Rv
cnMuCgp2MzogTW92ZWQgbW9kZXNldCB0cmlnZ2VyIG9uIGFmZmVjdGVkIE1TVCBkaXNwbGF5cyB0
byBEUk0KCnY0OiBGaXggd2FybmluZ3MsIHVzZSBjdXJyZW50IG1vZGUncyBicGMgcmF0aGVyIHRo
YW4gZGlzcGxheSdzCm1heGltdW0gY2FwYWJsZSBvbmUKCnY1OiBNb3ZpbmcgYnJhbmNoJ3MgYmFu
ZHdpZHRoIHZhbGlkYXRpb24gdG8gRFJNLApBZGRlZCBmdW5jdGlvbiB0byBlbmFibGUgRFNDIHBl
ciBwb3J0IGluIERSTQoKRGF2aWQgRnJhbmNpcyAoMTApOgogIGRybS9kcF9tc3Q6IEFkZCBQQk4g
Y2FsY3VsYXRpb24gZm9yIERTQyBtb2RlcwogIGRybS9kcF9tc3Q6IFBhcnNlIEZFQyBjYXBhYmls
aXR5IG9uIE1TVCBwb3J0cwogIGRybS9kcF9tc3Q6IEFkZCBNU1Qgc3VwcG9ydCB0byBEUCBEUENE
IFIvVyBmdW5jdGlvbnMKICBkcm0vZHBfbXN0OiBGaWxsIGJyYW5jaC0+bnVtX3BvcnRzCiAgZHJt
L2RwX21zdDogQWRkIGhlbHBlcnMgZm9yIE1TVCBEU0MgYW5kIHZpcnR1YWwgRFBDRCBhdXgKICBk
cm0vYW1kL2Rpc3BsYXk6IEluaXRpYWxpemUgRFNDIFBQUyB2YXJpYWJsZXMgdG8gMAogIGRybS9h
bWQvZGlzcGxheTogVmFsaWRhdGUgRFNDIGNhcHMgb24gTVNUIGVuZHBvaW50cwogIGRybS9hbWQv
ZGlzcGxheTogV3JpdGUgRFNDIGVuYWJsZSB0byBNU1QgRFBDRAogIGRybS9hbWQvZGlzcGxheTog
TVNUIERTQyBjb21wdXRlIGZhaXIgc2hhcmUKICBkcm0vZHBfbXN0OiBBZGQgbmV3IHF1aXJrIGZv
ciBTeW5hcHRpY3MgTVNUIGh1YnMKCk1pa2l0YSBMaXBza2kgKDMpOgogIGRybS9kcF9tc3Q6IEFk
ZCBEU0MgZW5hYmxlbWVudCBoZWxwZXJzIHRvIERSTQogIGRybS9kcF9tc3Q6IEFkZCBicmFuY2gg
YmFuZHdpZHRoIHZhbGlkYXRpb24gdG8gTVNUIGF0b21pYyBjaGVjawogIGRybS9hbWQvZGlzcGxh
eTogUmVjYWxjdWxhdGUgVkNQSSBzbG90cyBmb3IgbmV3IERTQyBjb25uZWN0b3JzCgogLi4uL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgIDYyICsrLQogLi4uL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oIHwgICAzICsKIC4uLi9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyB8ICAxOSArLQogLi4uL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyAgIHwgNDI4ICsrKysrKysrKysrKysr
KysrLQogLi4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuaCAgIHwgICA1
ICsKIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYyAgICB8ICAgMyAr
CiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYyAgfCAgIDMgKwog
Li4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIHwgICAzICsKIC4u
Li9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuaCB8ICAgMSArCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9kZXYuYyAgICAgICAgICAgICAgfCAgMTIgKy0KIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgICAgICAgICAgICAgICB8ICAzMyArLQogZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyAgICAgICAgIHwgMzE4ICsrKysrKysrKysr
Ky0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMgICB8ICAgMyAr
LQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jICAgICAgIHwgICAzICst
CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcF9tc3QuYyAgICAgICAgfCAgIDIgKy0K
IGluY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCAgICAgICAgICAgICAgICAgICB8ICAgNyArCiBp
bmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oICAgICAgICAgICAgICAgfCAgMTQgKy0KIDE3
IGZpbGVzIGNoYW5nZWQsIDg3OSBpbnNlcnRpb25zKCspLCA0MCBkZWxldGlvbnMoLSkKCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
