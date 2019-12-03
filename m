Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA9A110053
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 15:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3AE6E7BD;
	Tue,  3 Dec 2019 14:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750089.outbound.protection.outlook.com [40.107.75.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1745C6E7AD;
 Tue,  3 Dec 2019 14:35:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiF0454mXBXXL3BH1Zd7XiGo1q0nB8uRSoWMvE4hAAmXiclDDcF1bF/20Nxjmjh5ByNE3IthLiO7nSJcbNf1TOdhdlsHbhTRWyfazHiFjd/ZTjYbiN2qACbSWB9PMXsRXI1DHmfZXo0BtbIe+WLgLb85AWWAAR6lFJun6ngowpz5VZQDvvVn3XwqiwELne56pNjlr0HJjOkyoS/OAmDw4s6tljXpAsKwMfApNo15ZB1mNDJBlDHcVS1n+cTrW62KeaSnjbNupLq7DojzjPjyzm0aGGJfOIqyY3Kfis5DFXSAnHP9ZVnmQmHE6Vflm6kh/DjMiUI+HOpLUbxwCThqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83SoNAC0jTM6aVE4hAwsT2MeLkJoIL8Pvx6Aqg8fnWM=;
 b=A5NqA4CHuOjEgdzH8RE385+kTvdSjfmIcOGh1fy/WO+uMOKMjzkJqfl86P4F3cY4F9a1kruV0E0sG/ap2mEeSuJ7Kk9Ul6CAl6oUxDtouegPead+9iPKlmEcsn8Q7d3MMGPCugBzvmDJNmomHPOdR5zXkCvUc1kBreP79Roh/qLQD3fnnzRcw/h4WN1EJ+1Inqq/9T2vjQdQOBP9H8Ds+vxZYFh01cxT260IiNfiynfPJwQyX8eYhY09N7OF2+OatYnL3U2N/03wuFDFqdIV8DVkcuf3XhDflvVVe191oIF8Q3mhOVFknfWxHVGdnM7nzRFbmb13cB/G04uR1oQH8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0022.namprd12.prod.outlook.com (2603:10b6:5:1c0::35)
 by BN6PR12MB1683.namprd12.prod.outlook.com (2603:10b6:405:3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20; Tue, 3 Dec
 2019 14:35:47 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::205) by DM6PR12CA0022.outlook.office365.com
 (2603:10b6:5:1c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 14:35:47 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Tue, 3 Dec 2019 14:35:47 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 08:35:45 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 08:35:45 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8 10/17] drm/dp_mst: Manually overwrite PBN divider for
 calculating timeslots
Date: Tue, 3 Dec 2019 09:35:23 -0500
Message-ID: <20191203143530.27262-11-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203143530.27262-1-mikita.lipski@amd.com>
References: <20191203143530.27262-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(428003)(189003)(199004)(478600001)(446003)(50466002)(14444005)(48376002)(53416004)(6916009)(5660300002)(305945005)(70206006)(70586007)(26005)(4326008)(186003)(450100002)(1076003)(2616005)(36756003)(16586007)(54906003)(8676002)(51416003)(7696005)(316002)(2906002)(76176011)(86362001)(2876002)(2351001)(8936002)(336012)(81156014)(81166006)(6666004)(356004)(426003)(50226002)(11346002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1683; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7a747dd-8037-467f-8e25-08d777fe1654
X-MS-TrafficTypeDiagnostic: BN6PR12MB1683:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1683A08FFDFB36768B0A69F8E4420@BN6PR12MB1683.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xAYY69rsCH9icHmyUkgXSowzNdqJIDIEpvCdpYCp0yG+VLQEgCsr8iO16R//ybxC1oOD3tQAsoYJvLled/q+wet7iGn+EACK/edFsP0TUdrJ3k27uRdzTppATtJhSb+NMT+raHxnsKD65ZE9dZG7ARqzx+cWoxAnPXP4u3M4LETdh9izQ0jKaHNB9Ec5tod/jEzBDclybBKT+H6xNsSA+TVn54AF69P1YqvNftL8O4K1O2NE7hvOxvU4erdCGC+7fBIb1tclIcxe32UjAWZ6SVhpK5GvQvpCSJL5w8zyiyblLld8+CYkMpmi5n6h2Y43BuZ7z9gMSJhipoBpH3ahC2+U0Uzm0aD9P0d8Ibx9xaSk4jOGh8GsWw0nPXr+uBLandYBoa9z/rx6On5G62JBu3CGZ4j8E5CFrPIe0MoLtZLiyhwvPkXYVnA8XzYAbnFD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 14:35:47.5412 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a747dd-8037-467f-8e25-08d777fe1654
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1683
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83SoNAC0jTM6aVE4hAwsT2MeLkJoIL8Pvx6Aqg8fnWM=;
 b=qegw5uMm7Jn3w9hB3y1UOWPgmgDQeCboX15n8RHsW/jg4tZmvKN26Uuy7Wy3C5AI65MN5cPNruwZQkHz/Ktd9j+1x+21z3IeYD3AXz64iPIQ0tKmY1PHjta2LUiscNWU00TyVJ5HvKGsqCeIll5W7C/FsMi586QqZ8gBxtZgrsg=
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

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKW3doeV0KRm9yIERT
QyBjYXNlIHdlIGNhbm5vdCBhbHdheXMgdXNlIHRvcG9sb2d5IG1hbmFnZXIncyBQQk4gZGl2aWRl
cgp2YXJpYWJsZS4gVGhlIGRlZmF1bHQgZGl2aWRlciBkb2VzIG5vdCB0YWtlIEZFQyBpbnRvIGFj
Y291bnQuClRoZXJlZm9yZSB3ZSBzaG91bGQgYWxsb3cgZHJpdmVyIHRvIGNhbGN1bGF0ZSBpdHMg
b3duIGRpdmlkZXIgYmFzZWQKb24gdGhlIGxpbmsgcmF0ZSBhbmQgY291bnQgaXRzIGhhbmRsaW5n
LCBhcyBpdCBpcyBodyBzcGVjaWZpYy4KW2hvd10KUGFzcyBwYm5fZGl2IGFzIGFuIGFyZ3VtZW50
LCB3aGljaCB3aWxsIGJlIHVzZWQgaWYgaXRzIG1vcmUgdGhhbgp6ZXJvLCBvdGhlcndpc2UgZGVm
YXVsdCB0b3BvbG9neSBtYW5hZ2VyJ3MgcGJuX2RpdiB3aWxsIGJlIHVzZWQuCgpTaWduZWQtb2Zm
LWJ5OiBNaWtpdGEgTGlwc2tpIDxtaWtpdGEubGlwc2tpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDMgKystCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jICAgICAgICAgICAgIHwgOSArKysrKysrLS0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMgICAgICAgfCAyICst
CiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgICAgICAgICAgIHwgMyAr
Ky0KIGluY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggICAgICAgICAgICAgICAgICAgfCAz
ICsrLQogNSBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
CmluZGV4IDlmYzAzZmMxMDE3ZC4uNzUzYTc5NzM0ODE3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTQ5NzIsNyArNDk3Miw4
IEBAIHN0YXRpYyBpbnQgZG1fZW5jb2Rlcl9oZWxwZXJfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1f
ZW5jb2RlciAqZW5jb2RlciwKIAlkbV9uZXdfY29ubmVjdG9yX3N0YXRlLT52Y3BpX3Nsb3RzID0g
ZHJtX2RwX2F0b21pY19maW5kX3ZjcGlfc2xvdHMoc3RhdGUsCiAJCQkJCQkJCQkgICBtc3RfbWdy
LAogCQkJCQkJCQkJICAgbXN0X3BvcnQsCi0JCQkJCQkJCQkgICBkbV9uZXdfY29ubmVjdG9yX3N0
YXRlLT5wYm4pOworCQkJCQkJCQkJICAgZG1fbmV3X2Nvbm5lY3Rvcl9zdGF0ZS0+cGJuLAorCQkJ
CQkJCQkJICAgMCk7CiAJaWYgKGRtX25ld19jb25uZWN0b3Jfc3RhdGUtPnZjcGlfc2xvdHMgPCAw
KSB7CiAJCURSTV9ERUJVR19BVE9NSUMoImZhaWxlZCBmaW5kaW5nIHZjcGkgc2xvdHM6ICVkXG4i
LCAoaW50KWRtX25ld19jb25uZWN0b3Jfc3RhdGUtPnZjcGlfc2xvdHMpOwogCQlyZXR1cm4gZG1f
bmV3X2Nvbm5lY3Rvcl9zdGF0ZS0+dmNwaV9zbG90czsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jCmluZGV4IDAxODkyMWM0YmE5OC4uZjFkODgzOTYwODMxIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTQwMjAsNiArNDAyMCw3IEBAIHN0YXRpYyBpbnQg
ZHJtX2RwX2luaXRfdmNwaShzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKICAq
IEBtZ3I6IE1TVCB0b3BvbG9neSBtYW5hZ2VyIGZvciB0aGUgcG9ydAogICogQHBvcnQ6IHBvcnQg
dG8gZmluZCB2Y3BpIHNsb3RzIGZvcgogICogQHBibjogYmFuZHdpZHRoIHJlcXVpcmVkIGZvciB0
aGUgbW9kZSBpbiBQQk4KKyAqIEBwYm5fZGl2OiBkaXZpZGVyIGZvciBEU0MgbW9kZSB0aGF0IHRh
a2VzIEZFQyBpbnRvIGFjY291bnQKICAqCiAgKiBBbGxvY2F0ZXMgVkNQSSBzbG90cyB0byBAcG9y
dCwgcmVwbGFjaW5nIGFueSBwcmV2aW91cyBWQ1BJIGFsbG9jYXRpb25zIGl0CiAgKiBtYXkgaGF2
ZSBoYWQuIEFueSBhdG9taWMgZHJpdmVycyB3aGljaCBzdXBwb3J0IE1TVCBtdXN0IGNhbGwgdGhp
cyBmdW5jdGlvbgpAQCAtNDA0Niw3ICs0MDQ3LDggQEAgc3RhdGljIGludCBkcm1fZHBfaW5pdF92
Y3BpKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAogICovCiBpbnQgZHJtX2Rw
X2F0b21pY19maW5kX3ZjcGlfc2xvdHMoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAog
CQkJCSAgc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCi0JCQkJICBzdHJ1Y3Qg
ZHJtX2RwX21zdF9wb3J0ICpwb3J0LCBpbnQgcGJuKQorCQkJCSAgc3RydWN0IGRybV9kcF9tc3Rf
cG9ydCAqcG9ydCwgaW50IHBibiwKKwkJCQkgIGludCBwYm5fZGl2KQogewogCXN0cnVjdCBkcm1f
ZHBfbXN0X3RvcG9sb2d5X3N0YXRlICp0b3BvbG9neV9zdGF0ZTsKIAlzdHJ1Y3QgZHJtX2RwX3Zj
cGlfYWxsb2NhdGlvbiAqcG9zLCAqdmNwaSA9IE5VTEw7CkBAIC00MDc5LDcgKzQwODEsMTAgQEAg
aW50IGRybV9kcF9hdG9taWNfZmluZF92Y3BpX3Nsb3RzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRl
ICpzdGF0ZSwKIAlpZiAoIXZjcGkpCiAJCXByZXZfc2xvdHMgPSAwOwogCi0JcmVxX3Nsb3RzID0g
RElWX1JPVU5EX1VQKHBibiwgbWdyLT5wYm5fZGl2KTsKKwlpZiAocGJuX2RpdiA8PSAwKQorCQlw
Ym5fZGl2ID0gbWdyLT5wYm5fZGl2OworCisJcmVxX3Nsb3RzID0gRElWX1JPVU5EX1VQKHBibiwg
cGJuX2Rpdik7CiAKIAlEUk1fREVCVUdfQVRPTUlDKCJbQ09OTkVDVE9SOiVkOiVzXSBbTVNUIFBP
UlQ6JXBdIFZDUEkgJWQgLT4gJWRcbiIsCiAJCQkgcG9ydC0+Y29ubmVjdG9yLT5iYXNlLmlkLCBw
b3J0LT5jb25uZWN0b3ItPm5hbWUsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RwX21zdC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kcF9tc3QuYwppbmRleCA5MmJlMTc3MTEyODcuLmEwNjhmNTRhNjc5MyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jCkBAIC02NSw3ICs2NSw3IEBAIHN0
YXRpYyBpbnQgaW50ZWxfZHBfbXN0X2NvbXB1dGVfbGlua19jb25maWcoc3RydWN0IGludGVsX2Vu
Y29kZXIgKmVuY29kZXIsCiAJCQkJCQkgICAgICAgZmFsc2UpOwogCiAJCXNsb3RzID0gZHJtX2Rw
X2F0b21pY19maW5kX3ZjcGlfc2xvdHMoc3RhdGUsICZpbnRlbF9kcC0+bXN0X21nciwKLQkJCQkJ
CSAgICAgIHBvcnQsIGNydGNfc3RhdGUtPnBibik7CisJCQkJCQkgICAgICBwb3J0LCBjcnRjX3N0
YXRlLT5wYm4sIDApOwogCQlpZiAoc2xvdHMgPT0gLUVERUFETEspCiAJCQlyZXR1cm4gc2xvdHM7
CiAJCWlmIChzbG90cyA+PSAwKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
ZGlzcG52NTAvZGlzcC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5j
CmluZGV4IDFjOWUyM2Q1YTZmZC4uZWRiNzg5NjZjNWI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvZGlzcG52NTAvZGlzcC5jCkBAIC03ODcsNyArNzg3LDggQEAgbnY1MF9tc3RvX2F0b21pY19j
aGVjayhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCiAKIAkJc2xvdHMgPSBkcm1fZHBfYXRv
bWljX2ZpbmRfdmNwaV9zbG90cyhzdGF0ZSwgJm1zdG0tPm1nciwKIAkJCQkJCSAgICAgIG1zdGMt
PnBvcnQsCi0JCQkJCQkgICAgICBhc3loLT5kcC5wYm4pOworCQkJCQkJICAgICAgYXN5aC0+ZHAu
cGJuLAorCQkJCQkJICAgICAgMCk7CiAJCWlmIChzbG90cyA8IDApCiAJCQlyZXR1cm4gc2xvdHM7
CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggYi9pbmNsdWRl
L2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCmluZGV4IDMyZTYwYjlkNzA5OC4uMGY4MTNkNjM0NmFh
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCisrKyBiL2luY2x1
ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKQEAgLTc3MSw3ICs3NzEsOCBAQCBzdHJ1Y3QgZHJt
X2RwX21zdF90b3BvbG9neV9zdGF0ZSAqZHJtX2F0b21pY19nZXRfbXN0X3RvcG9sb2d5X3N0YXRl
KHN0cnVjdCBkcm1fYQogaW50IF9fbXVzdF9jaGVjawogZHJtX2RwX2F0b21pY19maW5kX3ZjcGlf
c2xvdHMoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAogCQkJICAgICAgc3RydWN0IGRy
bV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCi0JCQkgICAgICBzdHJ1Y3QgZHJtX2RwX21zdF9w
b3J0ICpwb3J0LCBpbnQgcGJuKTsKKwkJCSAgICAgIHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBv
cnQsIGludCBwYm4sCisJCQkgICAgICBpbnQgcGJuX2Rpdik7CiBpbnQgX19tdXN0X2NoZWNrCiBk
cm1fZHBfYXRvbWljX3JlbGVhc2VfdmNwaV9zbG90cyhzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAq
c3RhdGUsCiAJCQkJIHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
