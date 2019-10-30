Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 858FEEA41A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 20:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DAE6ED1D;
	Wed, 30 Oct 2019 19:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40516ED19;
 Wed, 30 Oct 2019 19:24:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8gIZ5DEP3N3H8YkOpwz5M0/maKjPhnoZrgkBxYFUBQVP73CbliE1Axj/HxKvvoPKF+Le4PsoWU87sJKH3V2MKXfqqIsXddwqdv1C7Qah8h84UG5ZqUlFV4e/WfN3aFENwxFvqe8y9GB4FDquq+Qw2z84Uw9SqMEOHqyW8NhmEVgoeBEDZxN1SYLHtptWC0PWsakjV2WgYoJ8rvfaOaBu77HvRwVFQ1UP7LXmXMI8CczBJvnxBOp1Xclr6Lut05ldXF4zLgbG81f2MmY4Uj0/TAkiux4JpDqfycq+rU7lXDHnRsJf0u1+Me5g3iHSJfg5Osh5EtyqbuBuNQHugwPPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtUHwiSB+5ThPSMYYFafCbyqjBOcl+keepUKwIkBAYA=;
 b=m2LPCiSkxrLvPNR/n96GRykxJBGXSkiqpZ64esycdELzegfUKNugyash0uz+JZvxsqG6ln3yc6pfxrd7a/EuCcOvAQLg8zgcvdBpNKdIFNA5RHcJVJ2vNT0oVocDEY35jhyfj3mpXFS/XGjAcnSQVZWEwfp6AZZq1ZNfH3lZlDDU9VnlCl9MM1S50v2bXWi+9AkCKRPSk4C8yc05dUG/QK2CTPFuIuH3PBLDQMn9HnUZbDYdTnU6uF9Q6T5yto1TIXYGNDp9dw+r+YmbZsa8GROeg/eJ7wdQkIc1t5feVXWBxf2vkd+tkyYZY9GX0FXV0L3wtXwBiodSzN+FuEc7Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0024.namprd12.prod.outlook.com
 (2603:10b6:301:4a::34) by BYAPR12MB3237.namprd12.prod.outlook.com
 (2603:10b6:a03:13a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.22; Wed, 30 Oct
 2019 19:24:43 +0000
Received: from CO1NAM03FT019.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by MWHPR1201CA0024.outlook.office365.com
 (2603:10b6:301:4a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.20 via Frontend
 Transport; Wed, 30 Oct 2019 19:24:43 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM03FT019.mail.protection.outlook.com (10.152.80.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Wed, 30 Oct 2019 19:24:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 14:24:42 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 14:24:41 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 30 Oct 2019 14:24:41 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/13] drm/amd/display: Initialize DSC PPS variables to 0
Date: Wed, 30 Oct 2019 15:24:26 -0400
Message-ID: <20191030192431.5798-9-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191030192431.5798-1-mikita.lipski@amd.com>
References: <20191030192431.5798-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(428003)(199004)(189003)(356004)(16586007)(81166006)(6666004)(316002)(1076003)(70586007)(70206006)(36756003)(50466002)(4326008)(486006)(2876002)(8936002)(446003)(2616005)(186003)(50226002)(48376002)(26005)(336012)(426003)(51416003)(2351001)(476003)(2906002)(305945005)(5660300002)(126002)(11346002)(478600001)(47776003)(86362001)(76176011)(81156014)(7696005)(54906003)(8676002)(53416004)(6916009)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3237; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f59c376-1eea-489e-04df-08d75d6ed159
X-MS-TrafficTypeDiagnostic: BYAPR12MB3237:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3237BF528AC36F64FD6AABD5E4600@BYAPR12MB3237.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-Forefront-PRVS: 02065A9E77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p3mrT7MYxvWDZzpXydZkmbU20vUHMbauonOD0G54iR0zOgbpa8xixvTsOpJYzHBDQ0j5MPcxnH5upi/dfA45F1IWbimhJrVYpBpLUNpx3OsxkvuOVp0poB80GQjD8+WaSQdUbMnFaVpoDWOuM2MCtJwhMezGn2V+bb48W1bFc7FAbsCLJlMci1qGv0YkcrCE62k/7bYCUljGygvi9WYFWaKvmK1I5o9vy1lxMEsTU/a0RUSDAKHpYOAT+tr9yarplL9ixmnkQrAhCQvhHF+1Wu/TCe9BYowWWnSRvNWvCEIfiXhoPf2h8Xcai0pGah65+hhRvQ1i3Lfe+FkARYQg6ut54sOtmRMGZgJ1T3qYhDTJuzM3ZGn2t4WaIeuO+ubdSTTvEZ1eQgeW97wvUOlUSNqjxql7MMgOxzLQXI1NPSmr/zS6ecVE1TWZtHk9z8Mo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2019 19:24:43.4354 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f59c376-1eea-489e-04df-08d75d6ed159
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3237
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtUHwiSB+5ThPSMYYFafCbyqjBOcl+keepUKwIkBAYA=;
 b=vqHZRdfhpoOanXqdTilipPPWiLKXNEruYed40zF46nzG1Y5BiiQ3FDrq6LvB9/jgjk0hPWBgApe8De2oaKurkgy00HtYyXYl8g8kl/Vz+EZ6nMV5Ro0neKstBdaiuLRxpFKgBRlUD7lHHyHU1F3cYmfog4Szoj0NEa1wmE+dE38=
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
Cc: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKRm9yIERTQyBNU1Qs
IHNvbWV0aW1lcyBtb25pdG9ycyB3b3VsZCBicmVhayBvdXQKaW4gZnVsbC1zY3JlZW4gc3RhdGlj
LiBUaGUgaXNzdWUgdHJhY2VkIGJhY2sgdG8gdGhlClBQUyBnZW5lcmF0aW9uIGNvZGUsIHdoZXJl
IHRoZXNlIHZhcmlhYmxlcyB3ZXJlIGJlaW5nIHVzZWQKdW5pbml0aWFsaXplZCBhbmQgd2VyZSBw
aWNraW5nIHVwIGdhcmJhZ2UuCgptZW1zZXQgdG8gMCB0byBhdm9pZCB0aGlzCgpSZXZpZXdlZC1i
eTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19od3NzLmMgfCAzICsrKwog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jICAgfCAzICsr
KwogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfaHdzcy5jCmluZGV4IGE1MTlkYmM1ZWNi
Ni4uNWQ2Y2JhZWJlYmMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rX2h3c3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rX2h3c3MuYwpAQCAtNDk2LDYgKzQ5Niw5IEBAIGJvb2wgZHBfc2V0X2Rz
Y19wcHNfc2RwKHN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgsIGJvb2wgZW5hYmxlKQogCQlzdHJ1
Y3QgZHNjX2NvbmZpZyBkc2NfY2ZnOwogCQl1aW50OF90IGRzY19wYWNrZWRfcHBzWzEyOF07CiAK
KwkJbWVtc2V0KCZkc2NfY2ZnLCAwLCBzaXplb2YoZHNjX2NmZykpOworCQltZW1zZXQoZHNjX3Bh
Y2tlZF9wcHMsIDAsIDEyOCk7CisKIAkJLyogRW5hYmxlIERTQyBodyBibG9jayAqLwogCQlkc2Nf
Y2ZnLnBpY193aWR0aCA9IHN0cmVhbS0+dGltaW5nLmhfYWRkcmVzc2FibGUgKyBzdHJlYW0tPnRp
bWluZy5oX2JvcmRlcl9sZWZ0ICsgc3RyZWFtLT50aW1pbmcuaF9ib3JkZXJfcmlnaHQ7CiAJCWRz
Y19jZmcucGljX2hlaWdodCA9IHN0cmVhbS0+dGltaW5nLnZfYWRkcmVzc2FibGUgKyBzdHJlYW0t
PnRpbWluZy52X2JvcmRlcl90b3AgKyBzdHJlYW0tPnRpbWluZy52X2JvcmRlcl9ib3R0b207CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNj
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMKaW5k
ZXggNjNlYjM3N2VkOWMwLi4yOTZlZWZmMDAyOTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMKQEAgLTIwNyw2ICsyMDcsOSBAQCBzdGF0
aWMgYm9vbCBkc2MyX2dldF9wYWNrZWRfcHBzKHN0cnVjdCBkaXNwbGF5X3N0cmVhbV9jb21wcmVz
c29yICpkc2MsIGNvbnN0IHN0cgogCXN0cnVjdCBkc2NfcmVnX3ZhbHVlcyBkc2NfcmVnX3ZhbHM7
CiAJc3RydWN0IGRzY19vcHRjX2NvbmZpZyBkc2Nfb3B0Y19jZmc7CiAKKwltZW1zZXQoJmRzY19y
ZWdfdmFscywgMCwgc2l6ZW9mKGRzY19yZWdfdmFscykpOworCW1lbXNldCgmZHNjX29wdGNfY2Zn
LCAwLCBzaXplb2YoZHNjX29wdGNfY2ZnKSk7CisKIAlEQ19MT0dfRFNDKCJHZXR0aW5nIHBhY2tl
ZCBEU0MgUFBTIGZvciBEU0MgQ29uZmlnOiIpOwogCWRzY19jb25maWdfbG9nKGRzYywgZHNjX2Nm
Zyk7CiAJRENfTE9HX0RTQygiRFNDIFBpY3R1cmUgUGFyYW1ldGVyIFNldCAoUFBTKToiKTsKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
