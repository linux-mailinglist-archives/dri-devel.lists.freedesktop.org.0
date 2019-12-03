Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8912110055
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 15:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164EA6E7A3;
	Tue,  3 Dec 2019 14:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720063.outbound.protection.outlook.com [40.107.72.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D64A6E79E;
 Tue,  3 Dec 2019 14:35:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaxHuG08XDq2RLJjjdD36EekvU6hyNyowzhWmlWWslZcSoCh2mYZal4PwVv7+l+KpHAJvhnriYfhU/fui9GVwtA9bwcuI5DTd4JGIaD+MxYmgQyMsmOQYhqRJGkSK/MUpA/fP7z7P44dx2FTpbBQT61WHNiiRLnZG+3J2jDYYXa3+CVSOc213o5X4YuP3v+cWELxhmLRkwE//tCddVB7TT5lgzDIGJA+ONmEAoHnWdwbKICWh4nYNSwahIpw3fcVV9AuyP9TThLMUIys4CEKOzoxrG/Fioqge0pBzopVijnMS/FHVwKot4TX77sjHam7YiJVa+EnrpaL1+6uWdVcnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bAGsSniVhFgIW3uf4W2luVTmKF9bUZ/zY5deUTc8DM=;
 b=mbN3moCN3FmiCTFQHOzM0cGSqH1auzRZieTq1Zm7VZ7v/FnhhFRH9jvTM2nsd1cKfW15z4u70fSl1eq32HqdrUHE7U/YQBlcgwJ9bokJjLIsHXyzHR7YvcebNrMJcvnX3nqG5+rP6T/EJJ68JtomT2xGr+JE4X+WH1zzzGet9Qfd0jMq1HcotgMvdYBm8oZTcHswXUmRwpL8UDoXcoUsW1kpFQtcz6jGKkGvVYC8o/4CH7+ohZpLoK7LSIwxLADS4VoqWtLY1X6fU/cPb0WKvX/pmt7GStHG6q6w415zkKb85UXVaz/iajwBtnmF/jEAjgMrwMAwdM/juRyOn1P6jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0022.namprd12.prod.outlook.com (2603:10b6:5:1c0::35)
 by BN8PR12MB3377.namprd12.prod.outlook.com (2603:10b6:408:46::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Tue, 3 Dec
 2019 14:35:46 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::205) by DM6PR12CA0022.outlook.office365.com
 (2603:10b6:5:1c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 14:35:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Tue, 3 Dec 2019 14:35:46 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 08:35:44 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 08:35:44 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8 08/17] drm/amd/display: Validate DSC caps on MST endpoints
Date: Tue, 3 Dec 2019 09:35:21 -0500
Message-ID: <20191203143530.27262-9-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203143530.27262-1-mikita.lipski@amd.com>
References: <20191203143530.27262-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(428003)(199004)(189003)(16586007)(26005)(54906003)(186003)(86362001)(316002)(15650500001)(356004)(70586007)(14444005)(76176011)(50466002)(51416003)(7696005)(70206006)(478600001)(1076003)(2906002)(11346002)(5660300002)(2876002)(336012)(426003)(446003)(48376002)(2616005)(8676002)(8936002)(50226002)(81156014)(4326008)(81166006)(2351001)(6666004)(36756003)(6916009)(450100002)(305945005)(53416004)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3377; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd3bfc05-54be-494a-cceb-08d777fe15b6
X-MS-TrafficTypeDiagnostic: BN8PR12MB3377:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3377224E9E54802897A88089E4420@BN8PR12MB3377.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MPb7iE3O20OcaPu7tsQj7Ye4QN1rWH2ENn0RKO7SXh1GHIdcxyvAEvDdRzNIF0bcSQSx6oBMY5Z02ETJdPvTIbl4pJxzU32QR5cLJXspn9YxioCsIjF+iyTj6hlp5PrI2qU2w8XokTaDadwTLh48alyMU39KW313H9lH90Fej2qGdsSB7hJzITBtJ59x8qJBGI/8CP9y8Kof5p7JtEmOh5Hso5XOHuQf3fGDbmTdR/5gXtlbCBFl8ovUCelnA9xyFWYflWZ3GxfVLkkUVGG3gpkK9oVwzOkje1hUSqAqCHNe2VqF5VPcwDGpT1UT7q7VwIZNIKYh6OE4Y4VP4CQ5ZcfHFYuHwCPxAzixHd0R9UaGKIQGvGbSU4+P3TdItA9oo4FBAcqW17yR6sP7mLocOr68YZMRxxtdS7bLKpUK34slUMiWxVMLuhJy5ePecPXfndDJGeTCAVi+OUAKhAi1WS9r7FG5CDbuo9sFpclRe0akny/ci3fE3x2Pkk0d+LR9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 14:35:46.5094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3bfc05-54be-494a-cceb-08d777fe15b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3377
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bAGsSniVhFgIW3uf4W2luVTmKF9bUZ/zY5deUTc8DM=;
 b=g6N4g1c9zShHy4NEca2PZpvjXDfqIbQVVGBt4JNqMhCW1nz3lhxLk526HIQzawTJWSKDi/x6XkFNAJbzP86jXoLInVOe+QkIsnbtT0nQDehNHcS44ZHoQicppba5rYMOpTt6ceNx3CJgdE6XfqSNe4wdz+l4jbATN70Rz+o0P4Q=
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
 Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKRHVyaW5nIE1TVCBt
b2RlIGVudW1lcmF0aW9uLCBpZiBhIG5ldyBkY19zaW5rIGlzIGNyZWF0ZWQsCnBvcHVsYXRlIGl0
IHdpdGggZHNjIGNhcHMgYXMgYXBwcm9wcmlhdGUuCgpVc2UgZHJtX2RwX21zdF9kc2NfYXV4X2Zv
cl9wb3J0IHRvIGdldCB0aGUgcmF3IGNhcHMsCnRoZW4gcGFyc2UgdGhlbSBvbnRvIGRjX3Npbmsg
d2l0aCBkY19kc2NfcGFyc2VfZHNjX2RwY2QuCgpSZXZpZXdlZC1ieTogV2VuamluZyBMaXUgPFdl
bmppbmcuTGl1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZy
YW5jaXNAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNr
aUBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uaCB8ICAxICsKIC4uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMg
ICB8IDI3ICsrKysrKysrKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5oCmluZGV4IGFlMzZkOTlkMGZiMi4uYjU0NDQ5OGQ0MzVlIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmgKQEAgLTMyMyw2ICszMjMsNyBAQCBzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciB7CiAJc3Ry
dWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydDsKIAlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAq
bXN0X3BvcnQ7CiAJc3RydWN0IGFtZGdwdV9lbmNvZGVyICptc3RfZW5jb2RlcjsKKwlzdHJ1Y3Qg
ZHJtX2RwX2F1eCAqZHNjX2F1eDsKIAogCS8qIFRPRE8gc2VlIGlmIHdlIGNhbiBtZXJnZSB3aXRo
IGRkY19idXMgb3IgbWFrZSBhIGRtX2Nvbm5lY3RvciAqLwogCXN0cnVjdCBhbWRncHVfaTJjX2Fk
YXB0ZXIgKmkyYzsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMKaW5kZXggODEzNjdjODY5MTM0Li43NTU3
ZWRlZTdkYjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCkBAIC0yNSw2ICsyNSw3IEBACiAKICNp
bmNsdWRlIDxsaW51eC92ZXJzaW9uLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVy
Lmg+CisjaW5jbHVkZSA8ZHJtL2RybV9kcF9tc3RfaGVscGVyLmg+CiAjaW5jbHVkZSAiZG1fc2Vy
dmljZXMuaCIKICNpbmNsdWRlICJhbWRncHUuaCIKICNpbmNsdWRlICJhbWRncHVfZG0uaCIKQEAg
LTE4MCw2ICsxODEsMjYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNz
IGRtX2RwX21zdF9jb25uZWN0b3JfZnVuY3MgPSB7CiAJLmVhcmx5X3VucmVnaXN0ZXIgPSBhbWRn
cHVfZG1fbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyLAogfTsKIAorc3RhdGljIGJvb2wg
dmFsaWRhdGVfZHNjX2NhcHNfb25fY29ubmVjdG9yKHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9y
ICphY29ubmVjdG9yKQoreworCXN0cnVjdCBkY19zaW5rICpkY19zaW5rID0gYWNvbm5lY3Rvci0+
ZGNfc2luazsKKwlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0ID0gYWNvbm5lY3Rvci0+cG9y
dDsKKwl1OCBkc2NfY2Fwc1sxNl0gPSB7IDAgfTsKKworCWFjb25uZWN0b3ItPmRzY19hdXggPSBk
cm1fZHBfbXN0X2RzY19hdXhfZm9yX3BvcnQocG9ydCk7CisKKwlpZiAoIWFjb25uZWN0b3ItPmRz
Y19hdXgpCisJCXJldHVybiBmYWxzZTsKKworCWlmIChkcm1fZHBfZHBjZF9yZWFkKGFjb25uZWN0
b3ItPmRzY19hdXgsIERQX0RTQ19TVVBQT1JULCBkc2NfY2FwcywgMTYpIDwgMCkKKwkJcmV0dXJu
IGZhbHNlOworCisJaWYgKCFkY19kc2NfcGFyc2VfZHNjX2RwY2QoZHNjX2NhcHMsIE5VTEwsICZk
Y19zaW5rLT5zaW5rX2RzY19jYXBzLmRzY19kZWNfY2FwcykpCisJCXJldHVybiBmYWxzZTsKKwor
CXJldHVybiB0cnVlOworfQorCiBzdGF0aWMgaW50IGRtX2RwX21zdF9nZXRfbW9kZXMoc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIHsKIAlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3Rv
ciAqYWNvbm5lY3RvciA9IHRvX2FtZGdwdV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKTsKQEAgLTIy
MiwxMCArMjQzLDE0IEBAIHN0YXRpYyBpbnQgZG1fZHBfbXN0X2dldF9tb2RlcyhzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCQkvKiBkY19saW5rX2FkZF9yZW1vdGVfc2luayByZXR1
cm5zIGEgbmV3IHJlZmVyZW5jZSAqLwogCQlhY29ubmVjdG9yLT5kY19zaW5rID0gZGNfc2luazsK
IAotCQlpZiAoYWNvbm5lY3Rvci0+ZGNfc2luaykKKwkJaWYgKGFjb25uZWN0b3ItPmRjX3Npbmsp
IHsKIAkJCWFtZGdwdV9kbV91cGRhdGVfZnJlZXN5bmNfY2FwcygKIAkJCQkJY29ubmVjdG9yLCBh
Y29ubmVjdG9yLT5lZGlkKTsKIAorCQkJaWYgKCF2YWxpZGF0ZV9kc2NfY2Fwc19vbl9jb25uZWN0
b3IoYWNvbm5lY3RvcikpCisJCQkJbWVtc2V0KCZhY29ubmVjdG9yLT5kY19zaW5rLT5zaW5rX2Rz
Y19jYXBzLAorCQkJCSAgICAgICAwLCBzaXplb2YoYWNvbm5lY3Rvci0+ZGNfc2luay0+c2lua19k
c2NfY2FwcykpOworCQl9CiAJfQogCiAJZHJtX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0
eSgKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
