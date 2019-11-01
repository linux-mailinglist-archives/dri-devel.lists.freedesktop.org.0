Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81866EC928
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 20:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77CB6F859;
	Fri,  1 Nov 2019 19:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760040.outbound.protection.outlook.com [40.107.76.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73D16E054;
 Fri,  1 Nov 2019 19:38:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OP1zmdoGBDDGNW1sh+M94+Z/DbYFXiBOoQRKxhU+de5Cpx7MbLBrJ0X3TsR8Fr97U/O/1gmXSVwG8B9CfV0zDFlzLphozOgKSpLBwPpP3AcQIT314gEyjzvb4i0khl7FeY7+ICnEc7m4xIPgzmsc8eqvsIYJSbUNoRFD3L7RUdR/N4ohN0s9waFiIAKec4QMZA/S/odSQNZMTZ/0gGMsbq/zeilP2tf+B2+Dbk+13/Z3SEzS8+4PColWznBGKQtaaxKCEZKJaqA46Nx350YgEm3ayEJrAn0fHgLBqXdki6+skeKCTwO45e7c7ayd4fnH+TzKwAFF05OB9VdW6B9c6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpFzxtISR0iHyMQ7azMxXkgewo0UuFBMdyBJZJp7PNI=;
 b=gThl5wS9dpehc3TZyw7XjBY3H69Z4BL++YXjKdWnaQk8LjOc/sS8FbgGQ1POO4HlWF6Q7uVascBaE7gxkYVgoFW/xx3/dhTUO58VRvTs3gUXe7JsWAIKAVW2viN6Y0T6Ft6+rVZpY7AWW5+vvQZXqVTDE26/PIGJ2EQG+B3Xj88k06i3+cKR3YOAnSCLvyLdcR9BN/BZN9MDpfQ+VTr4ZDT8pVlw/7+XTosr00GgSPoPOxjrMyk+vbknwGPL9SKFQbwDHq5OXwytm58RkX8XU5mS8+7vL8/bf8xiOEjG/EuyE+qyT+/uGUS6vBV0dBMFtpvaTeeDcn402xNSPQaoaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0012.namprd12.prod.outlook.com
 (2603:10b6:910:16::22) by BY5PR12MB4018.namprd12.prod.outlook.com
 (2603:10b6:a03:1a7::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.24; Fri, 1 Nov
 2019 19:38:44 +0000
Received: from DM3NAM03FT035.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by CY4PR1201CA0012.outlook.office365.com
 (2603:10b6:910:16::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.18 via Frontend
 Transport; Fri, 1 Nov 2019 19:38:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT035.mail.protection.outlook.com (10.152.82.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Fri, 1 Nov 2019 19:38:44 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 1 Nov 2019
 14:38:43 -0500
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 1 Nov 2019 14:38:43 -0500
From: "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 1/2] drm: Add support for DP 1.4 Compliance edid corruption
 test 4.2.2.6
Date: Fri, 1 Nov 2019 15:38:39 -0400
Message-ID: <20191101193839.25582-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20191030210844.19803-2-Jerry.Zuo@amd.com>
References: <20191030210844.19803-2-Jerry.Zuo@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(428003)(189003)(199004)(16586007)(53416004)(50466002)(426003)(336012)(48376002)(14444005)(110136005)(50226002)(54906003)(26005)(316002)(2906002)(1076003)(356004)(126002)(5660300002)(81156014)(70586007)(86362001)(11346002)(8936002)(186003)(6666004)(2616005)(76176011)(36756003)(4326008)(7696005)(305945005)(70206006)(486006)(47776003)(51416003)(446003)(8676002)(476003)(478600001)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4018; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 528ba9ae-ac93-4338-604e-08d75f031b73
X-MS-TrafficTypeDiagnostic: BY5PR12MB4018:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4018594452590C26ABE33B9AE5620@BY5PR12MB4018.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 020877E0CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YMy7pnazzUQ/ijL2dzduOoEqocncWVwu0XPQNg8LRR2vHh5jFCJKGgqmd2EmkWyFrYd8K1m7pnkSRRVX1PgeOFliUmgmxQs9eeRkhqRGIZL0ZkC6Gbi2Zqm7py0GIyqgTMOIRqx5K/FNY/TWMKgv5+SNDrbClzkOZ1wVZm3H0094OTl9dvQmBFLXAnHglheBko4xR9T0STyLKhUMSIEo4dTsQhIsRIuM946J3CvE4HMPyrpo3DLAsBVjZt2Qf2BxQ+eEvRtX3O3T+YhYDqQzu4DGmXumKkyZlg1ZbLHqQN02YKCZT+T/k2xdJDF7wGEJ0/5bk/dfHvEmDGXhImsBRjK1aDQH8hEcJXHBE4FASjq7WAqrg7Dqyyc0jbCIYwWd2uaq+pxr6Tcv1w8YPrTi5NocB+J1vHIHT5tKdaAbpxI65c2TyQM/VmnZ8KS+tDLK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2019 19:38:44.5380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 528ba9ae-ac93-4338-604e-08d75f031b73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4018
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpFzxtISR0iHyMQ7azMxXkgewo0UuFBMdyBJZJp7PNI=;
 b=kWNSBBzp7gZvOgAQAhQ85zlFacK343ULf7fILlQor13qignrKG3uY9Xp6PKsQvSc0VCg8YhGXLitItFPlcIlYsEnNUxGC6HLicTUko/KvGPFXGcBDXbX1m0A3dimosTKii/K2UHezAG9/0Dufwdfz8pTtgmirJwfimKqH+LHhkc=
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
Cc: manasi.d.navare@intel.com, "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RFAgMS40IGVkaWQgY29ycnVwdGlvbiB0ZXN0IHJlcXVpcmVzIHNvdXJjZSBEVVQgdG8gd3JpdGUg
Y2FsY3VsYXRlZApDUkMsIG5vdCB0aGUgY29ycnVwdGVkIENSQyBmcm9tIHJlZmVyZW5jZSBzaW5r
LgoKUmV0dXJuIHRoZSBjYWxjdWxhdGVkIENSQyBiYWNrLCBhbmQgaW5pdGlhdGUgdGhlIHJlcXVp
cmVkIHNlcXVlbmNlLgoKLXYyOiBIYXZlIHNlcGFyYXRlIHJvdXRpbmUgZm9yIHJldHVybmluZyBy
ZWFsIENSQwoKU2lnbmVkLW9mZi1ieTogSmVycnkgKEZhbmd6aGkpIFp1byA8SmVycnkuWnVvQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyB8IDM2ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMg
ICAgICB8IDE0ICsrKysrKysrKysrKysrCiBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggICAg
IHwgIDcgKysrKysrKwogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAgICB8ICAzICsrKwog
NCBmaWxlcyBjaGFuZ2VkLCA2MCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9kcF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMK
aW5kZXggZmZjNjhkMzA1YWZlLi43NWRiZDMwYzYyYTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIu
YwpAQCAtMzM2LDYgKzMzNiw0MiBAQCBpbnQgZHJtX2RwX2RwY2RfcmVhZF9saW5rX3N0YXR1cyhz
dHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAogfQogRVhQT1JUX1NZTUJPTChkcm1fZHBfZHBjZF9yZWFk
X2xpbmtfc3RhdHVzKTsKIAorLyoqCisgICogZHJtX2RwX3NlbmRfYmFkX2VkaWRfY2hlY2tzdW0o
KSAtIHNlbmQgYmFjayByZWFsIGVkaWQgY2hlY2tzdW0gdmFsdWUKKyAgKiBAYXV4OiBEaXNwbGF5
UG9ydCBBVVggY2hhbm5lbAorICAqIEBiYWRfZWRpZF9jaGVja3N1bTogcmVhbCBlZGlkIGNoZWNr
c3VtIGZvciB0aGUgbGFzdCBibG9jaworICAqCisgICogUmV0dXJucyB0cnVlIG9uIHN1Y2Nlc3MK
KyAgKi8KK2Jvb2wgZHJtX2RwX3NlbmRfYmFkX2VkaWRfY2hlY2tzdW0oc3RydWN0IGRybV9kcF9h
dXggKmF1eCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTggYmFkX2VkaWRfY2hl
Y2tzdW0pCit7CisgICAgICAgIHU4IGxpbmtfZWRpZF9yZWFkID0gMCwgYXV0b190ZXN0X3JlcSA9
IDA7CisgICAgICAgIHU4IHRlc3RfcmVzcCA9IDA7CisKKyAgICAgICAgZHJtX2RwX2RwY2RfcmVh
ZChhdXgsIERQX0RFVklDRV9TRVJWSUNFX0lSUV9WRUNUT1IsICZhdXRvX3Rlc3RfcmVxLCAxKTsK
KyAgICAgICAgYXV0b190ZXN0X3JlcSAmPSBEUF9BVVRPTUFURURfVEVTVF9SRVFVRVNUOworCisg
ICAgICAgIGRybV9kcF9kcGNkX3JlYWQoYXV4LCBEUF9URVNUX1JFUVVFU1QsICZsaW5rX2VkaWRf
cmVhZCwgMSk7CisgICAgICAgIGxpbmtfZWRpZF9yZWFkICY9IERQX1RFU1RfTElOS19FRElEX1JF
QUQ7CisKKyAgICAgICAgaWYgKCFhdXRvX3Rlc3RfcmVxIHx8ICFsaW5rX2VkaWRfcmVhZCkgewor
ICAgICAgICAgICAgICAgIERSTV9ERUJVR19LTVMoIlNvdXJjZSBEVVQgZG9lcyBub3Qgc3VwcG9y
dCBURVNUX0VESURfUkVBRFxuIik7CisgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOworICAg
ICAgICB9CisKKyAgICAgICAgZHJtX2RwX2RwY2Rfd3JpdGUoYXV4LCBEUF9ERVZJQ0VfU0VSVklD
RV9JUlFfVkVDVE9SLCAmYXV0b190ZXN0X3JlcSwgMSk7CisKKyAgICAgICAgLyogc2VuZCBiYWNr
IGNoZWNrc3VtIGZvciB0aGUgbGFzdCBlZGlkIGV4dGVuc2lvbiBibG9jayBkYXRhICovCisgICAg
ICAgIGRybV9kcF9kcGNkX3dyaXRlKGF1eCwgRFBfVEVTVF9FRElEX0NIRUNLU1VNLCAmYmFkX2Vk
aWRfY2hlY2tzdW0sIDEpOworCisgICAgICAgIHRlc3RfcmVzcCB8PSBEUF9URVNUX0VESURfQ0hF
Q0tTVU1fV1JJVEU7CisgICAgICAgIGRybV9kcF9kcGNkX3dyaXRlKGF1eCwgRFBfVEVTVF9SRVNQ
T05TRSwgJnRlc3RfcmVzcCwgMSk7CisKKyAgICAgICAgcmV0dXJuIHRydWU7Cit9CitFWFBPUlRf
U1lNQk9MKGRybV9kcF9zZW5kX2JhZF9lZGlkX2NoZWNrc3VtKTsKKwogLyoqCiAgKiBkcm1fZHBf
bGlua19wcm9iZSgpIC0gcHJvYmUgYSBEaXNwbGF5UG9ydCBsaW5rIGZvciBjYXBhYmlsaXRpZXMK
ICAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCmluZGV4IDgyYTRj
ZWVkM2ZjZi4uMDU5ODMxNGUzZjQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Vk
aWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwpAQCAtMTM1NCw2ICsxMzU0LDE3
IEBAIHN0YXRpYyBpbnQgZHJtX2VkaWRfYmxvY2tfY2hlY2tzdW0oY29uc3QgdTggKnJhd19lZGlk
KQogCXJldHVybiBjc3VtOwogfQogCitzdGF0aWMgaW50IGRybV9lZGlkX2Jsb2NrX3JlYWxfY2hl
Y2tzdW0oY29uc3QgdTggKnJhd19lZGlkKQoreworCWludCBpOworCXU4IGNzdW0gPSAwOworCisJ
Zm9yIChpID0gMDsgaSA8IEVESURfTEVOR1RIIC0gMTsgaSsrKQorCQljc3VtICs9IHJhd19lZGlk
W2ldOworCisJcmV0dXJuICgweDEwMCAtIGNzdW0pOworfQorCiBzdGF0aWMgYm9vbCBkcm1fZWRp
ZF9pc196ZXJvKGNvbnN0IHU4ICppbl9lZGlkLCBpbnQgbGVuZ3RoKQogewogCWlmIChtZW1jaHJf
aW52KGluX2VkaWQsIDAsIGxlbmd0aCkpCkBAIC0xNTcyLDYgKzE1ODMsOSBAQCBzdGF0aWMgdm9p
ZCBjb25uZWN0b3JfYmFkX2VkaWQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIAkJ
CSAgICAgICBwcmVmaXgsIERVTVBfUFJFRklYX05PTkUsIDE2LCAxLAogCQkJICAgICAgIGJsb2Nr
LCBFRElEX0xFTkdUSCwgZmFsc2UpOwogCX0KKworCS8qIENhbGN1bGF0ZSByZWFsIGNoZWNrc3Vt
IGZvciB0aGUgbGFzdCBlZGlkIGV4dGVuc2lvbiBibG9jayBkYXRhICovCisJY29ubmVjdG9yLT5i
YWRfZWRpZF9jaGVja3N1bSA9IGRybV9lZGlkX2Jsb2NrX3JlYWxfY2hlY2tzdW0oZWRpZCArIGVk
aWRbMHg3ZV0gKiBFRElEX0xFTkdUSCk7CiB9CiAKIC8qIEdldCBvdmVycmlkZSBvciBmaXJtd2Fy
ZSBFRElEICovCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggYi9pbmNs
dWRlL2RybS9kcm1fY29ubmVjdG9yLmgKaW5kZXggNjgxY2I1OTBmOTUyLi44NDQyNDYxNTQyYjkg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAorKysgYi9pbmNsdWRlL2Ry
bS9kcm1fY29ubmVjdG9yLmgKQEAgLTEzNDUsNiArMTM0NSwxMyBAQCBzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciB7CiAJICogcmV2MS4xIDQuMi4yLjYKIAkgKi8KIAlib29sIGVkaWRfY29ycnVwdDsKKwkv
KioKKyAgICAgICAgICogQGJhZF9lZGlkX2NoZWNrc3VtOiByZWFsIGVkaWQgY2hlY2tzdW0gdmFs
dWUgZm9yIGNvcnJ1cHRlZCBlZGlkIGJsb2NrLgorICAgICAgICAgKiBSZXF1aXJlZCBpbiBEaXNw
bGF5cG9ydCAxLjQgY29tcGxpYW5jZSB0ZXN0aW5nCisgICAgICAgICAqIHJldjEuMSA0LjIuMi42
CisgICAgICAgICAqLworICAgICAgICB1aW50OF90IGJhZF9lZGlkX2NoZWNrc3VtOworCiAKIAkv
KiogQGRlYnVnZnNfZW50cnk6IGRlYnVnZnMgZGlyZWN0b3J5IGZvciB0aGlzIGNvbm5lY3RvciAq
LwogCXN0cnVjdCBkZW50cnkgKmRlYnVnZnNfZW50cnk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKaW5kZXggNWE3
OTUwNzVkNWRhLi4yYTdlNTRiZWJiMTggMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9o
ZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKQEAgLTEzODMsNiArMTM4
Myw5IEBAIHN0YXRpYyBpbmxpbmUgc3NpemVfdCBkcm1fZHBfZHBjZF93cml0ZWIoc3RydWN0IGRy
bV9kcF9hdXggKmF1eCwKIGludCBkcm1fZHBfZHBjZF9yZWFkX2xpbmtfc3RhdHVzKHN0cnVjdCBk
cm1fZHBfYXV4ICphdXgsCiAJCQkJIHU4IHN0YXR1c1tEUF9MSU5LX1NUQVRVU19TSVpFXSk7CiAK
K2Jvb2wgZHJtX2RwX3NlbmRfYmFkX2VkaWRfY2hlY2tzdW0oc3RydWN0IGRybV9kcF9hdXggKmF1
eCwKKwkJCQl1OCBiYWRfZWRpZF9jaGVja3N1bSk7CisKIC8qCiAgKiBEaXNwbGF5UG9ydCBsaW5r
CiAgKi8KLS0gCjIuMTQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
