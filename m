Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B372103553
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 08:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F476E172;
	Wed, 20 Nov 2019 07:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770133.outbound.protection.outlook.com [40.107.77.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FE06E05D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 07:14:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xq13QLAsTgqtDCV/8YuQHmcwah/7lb44JNF4Tzv62X7JaUY7kiQ3IEbTPqBEeatPpRlM8Z2dyjoeaxrt/x7SKtAiCu7ctwEaSQlqvDoc1ZmRy6CEUGhMQ3HhQRpbMda+p+xHW+WqGmxEwNbeTpxhJsQiPxu9u7r/pfwXbsaxEp25gYnpinOwQwz9T0vnNdF8357+VvW34GV0tmgSBK/NW2iF83mgJO8ZY3iS8h6r2c6viqvSh1Tacy3grrPZzg8ASNuzSmbL2O/k9++fAmfmG7nwEKnlx2KEiBrJEuAK9ZmByOW4+WK0R93tVWwA4AUSpZ8aBf8sM6v5DRtyIp4Cjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuUHlBhzm7IKhGB4vUjVfMhdQ8MxbsV4EdOKiil7yjI=;
 b=O/l9MtBSQkB1JOXbB9s+JalEqQC8y7toUd8sMFqxxDGzb4mxSeh7LUoWPsh2YWy42EXYRq6sZ0Y0JeyEBQaYyxNHL9WzTweS/68LQdEv8sFrItEqOUEnpvs1tGA+SEnjV79ddSV4Lbz6j+OK9GOwxK2cMo92UmggPinVUWuufsLfXV/nbq5wM4RMi29PLt7TShwHSgXZ5Mcrzic4sl8HEO5zo8ONhGwVylzx0e2OgYgU3OYEFjYt6Av67BazB3j967F4CZ9CBPhER4rhJmmPjGgTiNMDRhmSCQ0l15S4kyaMtIucrhjaJB/LXTrfrMxXxM6ZDsU9nN3TS2E0kCJFAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from BN8PR21MB1137.namprd21.prod.outlook.com (20.179.72.96) by
 BN8PR21MB1251.namprd21.prod.outlook.com (20.179.74.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.3; Wed, 20 Nov 2019 07:14:06 +0000
Received: from BN8PR21MB1137.namprd21.prod.outlook.com
 ([fe80::c596:ecf5:7a6:734d]) by BN8PR21MB1137.namprd21.prod.outlook.com
 ([fe80::c596:ecf5:7a6:734d%2]) with mapi id 15.20.2495.006; Wed, 20 Nov 2019
 07:14:05 +0000
From: Dexuan Cui <decui@microsoft.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 sashal@kernel.org, b.zolnierkie@samsung.com, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mikelley@microsoft.com,
 Alexander.Levin@microsoft.com
Subject: [PATCH] video: hyperv_fb: Fix hibernation for the deferred IO feature
Date: Tue, 19 Nov 2019 23:13:48 -0800
Message-Id: <1574234028-48574-1-git-send-email-decui@microsoft.com>
X-Mailer: git-send-email 1.8.3.1
X-ClientProxiedBy: MWHPR1001CA0019.namprd10.prod.outlook.com
 (2603:10b6:301:2a::32) To BN8PR21MB1137.namprd21.prod.outlook.com
 (2603:10b6:408:71::32)
MIME-Version: 1.0
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (13.77.154.182) by MWHPR1001CA0019.namprd10.prod.outlook.com
 (2603:10b6:301:2a::32) with Microsoft SMTP Server (version=TLS1_2, cipher=)
 via Frontend Transport; Wed, 20 Nov 2019 07:14:04 +0000
X-Mailer: git-send-email 1.8.3.1
X-Originating-IP: [13.77.154.182]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 451143ff-78f0-4401-d96f-08d76d893a84
X-MS-TrafficTypeDiagnostic: BN8PR21MB1251:|BN8PR21MB1251:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR21MB1251749AB264DB134FBC633EBF4F0@BN8PR21MB1251.namprd21.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 02272225C5
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(396003)(136003)(39860400002)(366004)(199004)(189003)(10090500001)(36756003)(8936002)(50226002)(81166006)(81156014)(8676002)(14444005)(6436002)(6486002)(1511001)(86362001)(7736002)(2906002)(5660300002)(478600001)(10290500003)(966005)(4720700003)(6636002)(3846002)(6116002)(25786009)(3450700001)(66946007)(66556008)(66476007)(305945005)(316002)(386003)(6666004)(4326008)(6506007)(22452003)(26005)(16586007)(186003)(16526019)(107886003)(51416003)(52116002)(66066001)(48376002)(47776003)(50466002)(43066004)(956004)(2616005)(476003)(486006)(6512007)(6306002)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR21MB1251;
 H:BN8PR21MB1137.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bhK2dSNKGGYPc6e53IRI99ioTy/zaMDzStkmpjIVmnRE3Ps+SZTe08LZByFbdtGm0/bdp4AXKku1vCxfQTzBpiSFFZxfA7RBdFNVgWqpw2F7hr6K834Xcl79Dddprx+8ksawTlipejcd0j3hfHD5I4wW0w2dBTK+TxiPnnZGM9mtWg9AQ1n2687CuLm5pQYkRciWQoRWRCkkuSlMhYHwKiPV63dRi4BCKSQmEeJv3wlPsiqXLdKjJGDyqYA4d9Dd0aj9DJ0qqU3Jfe7uHdXCU7YVXtKZLgSHx+naznXUXOPHWvzm9ZvKUf8WrXhwyur63hZMUjWjDIWhy4cvMx+MmKicW0yqBXcziM7+OGV6H4RpYoe85KALfkavJzp6kRhcjl5FGMReHNpaK2tqbVsq56s1zJPzJEioJRxnVFQ37DuoKLPTRPOkYAuw5M9wEDkwSOJ6M1ZdE3gnHk2Vch02holbzrUORAnzNDiseNtNVLQ=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451143ff-78f0-4401-d96f-08d76d893a84
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2019 07:14:05.8958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cef0C17Jcp7ONq0+MijjLeilYGW4g0sAQ3fdpHiBR3Tfhiw/pJ+d54nH+yTOe5/0CsvYuNkAz/u0bK7cGLBfsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR21MB1251
X-Mailman-Approved-At: Wed, 20 Nov 2019 07:41:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuUHlBhzm7IKhGB4vUjVfMhdQ8MxbsV4EdOKiil7yjI=;
 b=HAMmQ+zkD/78U7iP5e3Z5mx0XzofnLbn7Xto9FFzcntaAKI9zVBGaxSyVpYWWWVfuJHtYckEMKsxpsAcs23/0ubphPMz6vcnSvybaNQBDZLx3b0xiF7BGsSFchjXM8So0ai5Njy3Tep9J6nlaFYNMC46LxN6JrVuwuxSOmGB6E8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=decui@microsoft.com; 
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
Reply-To: decui@microsoft.com
Cc: Dexuan Cui <decui@microsoft.com>, weh@microsoft.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZmJfZGVmZXJyZWRfaW9fd29yaygpIGNhbiBhY2Nlc3MgdGhlIHZtYnVzIHJpbmdidWZmZXIgYnkg
Y2FsbGluZwpmYmRlZmlvLT5kZWZlcnJlZF9pbygpIC0+IHN5bnRodmlkX2RlZmVycmVkX2lvKCkg
LT4gc3ludGh2aWRfdXBkYXRlKCkuCgpCZWNhdXNlIHRoZSB2bWJ1cyByaW5nYnVmZmVyIGlzIGlu
YWNjZXNzaWJsZSBiZXR3ZWVuIGh2ZmJfc3VzcGVuZCgpCmFuZCBodmZiX3Jlc3VtZSgpLCB3ZSBt
dXN0IGNhbmNlbCBpbmZvLT5kZWZlcnJlZF93b3JrIGJlZm9yZSBjYWxsaW5nCnZtYnVzX2Nsb3Nl
KCkgYW5kIHRoZW4gcmVzY2hlZHVsZSBpdCBhZnRlciB3ZSByZW9wZW4gdGhlIGNoYW5uZWwKaW4g
aHZmYl9yZXN1bWUoKS4KCkZpeGVzOiBhNGRkYjExZDI5N2UgKCJ2aWRlbzogaHlwZXJ2OiBoeXBl
cnZfZmI6IFN1cHBvcnQgZGVmZXJyZWQgSU8gZm9yIEh5cGVyLVYgZnJhbWUgYnVmZmVyIGRyaXZl
ciIpCkZpeGVzOiA4MjQ5NDZhOGI2ZmIgKCJ2aWRlbzogaHlwZXJ2X2ZiOiBBZGQgdGhlIHN1cHBv
cnQgb2YgaGliZXJuYXRpb24iKQpTaWduZWQtb2ZmLWJ5OiBEZXh1YW4gQ3VpIDxkZWN1aUBtaWNy
b3NvZnQuY29tPgotLS0KClRoaXMgcGF0Y2ggZml4ZXMgdGhlIDIgYWZvcmVtZW50aW9uZWQgcGF0
Y2hlcyBvbiBTYXNoYSBMZXZpbidzIEh5cGVyLVYgdHJlZSdzCmh5cGVydi1uZXh0IGJyYW5jaDoK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvaHlwZXJ2L2xp
bnV4LmdpdC9sb2cvP2g9aHlwZXJ2LW5leHQKClRoZSAyIGFmb3JlbWVudGlvbmVkIHBhdGNoZXMg
aGF2ZSBub3QgYXBwZWFyZWQgaW4gdGhlIG1haW5saW5lIHlldCwgc28KcGxlYXNlIHBpY2sgdXAg
dGhpcyBwYXRjaCBvbnRvIGhlIHNhbWUgaHlwZXJ2LW5leHQgYnJhbmNoLgoKIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvaHlwZXJ2X2ZiLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9oeXBlcnZfZmIuYyBiL2RyaXZl
cnMvdmlkZW8vZmJkZXYvaHlwZXJ2X2ZiLmMKaW5kZXggNGNkMjdlNTE3MmExLi4wOGJjMGRmYjVj
ZTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvaHlwZXJ2X2ZiLmMKKysrIGIvZHJp
dmVycy92aWRlby9mYmRldi9oeXBlcnZfZmIuYwpAQCAtMTE5NCw2ICsxMTk0LDcgQEAgc3RhdGlj
IGludCBodmZiX3N1c3BlbmQoc3RydWN0IGh2X2RldmljZSAqaGRldikKIAlmYl9zZXRfc3VzcGVu
ZChpbmZvLCAxKTsKIAogCWNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmcGFyLT5kd29yayk7CisJ
Y2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZpbmZvLT5kZWZlcnJlZF93b3JrKTsKIAogCXBhci0+
dXBkYXRlX3NhdmVkID0gcGFyLT51cGRhdGU7CiAJcGFyLT51cGRhdGUgPSBmYWxzZTsKQEAgLTEy
MjcsNiArMTIyOCw3IEBAIHN0YXRpYyBpbnQgaHZmYl9yZXN1bWUoc3RydWN0IGh2X2RldmljZSAq
aGRldikKIAlwYXItPmZiX3JlYWR5ID0gdHJ1ZTsKIAlwYXItPnVwZGF0ZSA9IHBhci0+dXBkYXRl
X3NhdmVkOwogCisJc2NoZWR1bGVfZGVsYXllZF93b3JrKCZpbmZvLT5kZWZlcnJlZF93b3JrLCBp
bmZvLT5mYmRlZmlvLT5kZWxheSk7CiAJc2NoZWR1bGVfZGVsYXllZF93b3JrKCZwYXItPmR3b3Jr
LCBIVkZCX1VQREFURV9ERUxBWSk7CiAKIAkvKiAwIG1lYW5zIGRvIHJlc3VtZSAqLwotLSAKMi4x
OS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
