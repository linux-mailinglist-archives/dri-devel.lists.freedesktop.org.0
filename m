Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EE310E4F1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 04:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE9789F24;
	Mon,  2 Dec 2019 03:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760085.outbound.protection.outlook.com [40.107.76.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE3D89F0A;
 Mon,  2 Dec 2019 03:58:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bqgmu9io+dbCl6gfzMvJqMgyo6wrCA1JEZagzwJNCCnXpihxX+Lg+OEp7vaabyWcn6x7tCh3wC7ka7sMqSiEJ5LDyipTZRw3ccBIgbRNhzAnlwd4zr6E9CGz2Yh52kb88EEzei7KSidjgkQD8f35VvbuF9JD/hqbJ5N5ESId+eE/+d4Uub0pjyqEWGjzSEipH3ASAI5oVgJLfuj0nzLy2a3UmfwGlTsQ7LTDYucS8u6L+LWz3mIqAiThERIAuQVWBggrhXx7rYSePD9j7J2XVTBY6havgJjnL4OYR0LEY1/Ewq/VCocW26ipMO/3jlUMFE5yJ0c/67mrWiOc403Y4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+jfBQooAkZcQMyeI/yEy+9xlqwiX2OGioFZRvCBIxc=;
 b=n14V5MsCL18IDYtq/zhlQW0pkQWaE7nSxwerQ8gXjVSZ7fld1ES3e7iRef97bAUawuyd+QVoVCwOvpQoT7XMIPv0CDcsMwLA3ENsSzHUKDSHhZV1QNj6Dyn0wAuqs86UolcGMOobATeCvU051Ou6rX9RXNXXdWvyc5votnlO+vrke8Ql+QKgtbiVsHMyUFZ+r348S2J/Arv8PiNpQf41dFwODKz4ue5TUMOaCOrimfSX2CZnva7nMA6LkLDc1rzUW0pK13Or2ydnMCQGkddfWvfpAF9v0LDhUbobOXMiFZVf25o+kfeaihW2vOF0VzOhpKNAyQ/+b4L5ERgZgZI39g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0025.namprd12.prod.outlook.com (2603:10b6:405:70::11)
 by DM6PR12MB3995.namprd12.prod.outlook.com (2603:10b6:5:1c6::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18; Mon, 2 Dec
 2019 03:58:53 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::200) by BN6PR12CA0025.outlook.office365.com
 (2603:10b6:405:70::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.18 via Frontend
 Transport; Mon, 2 Dec 2019 03:58:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Mon, 2 Dec 2019 03:58:53 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 1 Dec 2019
 21:58:53 -0600
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sun, 1 Dec 2019 21:58:51 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/dp_mst: Correct the bug in drm_dp_update_payload_part1()
Date: Mon, 2 Dec 2019 11:58:41 +0800
Message-ID: <20191202035841.16984-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(428003)(199004)(189003)(4326008)(48376002)(26005)(305945005)(81156014)(186003)(81166006)(356004)(50466002)(478600001)(6666004)(2616005)(426003)(50226002)(86362001)(316002)(110136005)(54906003)(14444005)(51416003)(336012)(8676002)(16586007)(7696005)(8936002)(53416004)(36756003)(5660300002)(2906002)(1076003)(70206006)(70586007)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3995; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74d98505-8810-4204-6b3d-08d776dbf29f
X-MS-TrafficTypeDiagnostic: DM6PR12MB3995:
X-Microsoft-Antispam-PRVS: <DM6PR12MB39954DBCBCF4262826B74808FC430@DM6PR12MB3995.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0239D46DB6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gtFcWV++p99pamSQ06Je20izqJH7zxN5jDGuzlljrY63coSwnamVhfhbPeUKzUx2hsivYHZ2okcflC1HFAfmalFTzeSCwhoJ7Lwnriy1jAHQwP8/rdq7bHVPtbgL8SrOqlwWnIHGOMyy/e7GQ0JrrJucrdHftWg9HtVLWEumeK5hkl+zJaz4Lx94AihvbVuUy3kXdKJBT8RAA/bkVhso3yGi8MBjCZkxABYX8ST2QmOuDp1NlFQSVw+BLqj8AzvXYxBm3bvCCcpU+0X4kJtM5LEQc/Vv+CZNlDjbOP8cK3VP0hSEv/eTdLCYZW1dEzafwv7FyYsA4SpPtocHI1EVpPaok3UF+2oRyr2glSwKYOSfrDXHH2W9S3DG6v2p1Aa1mFSJ16ud00YpkO741F1ZH84xcwCjaMYOamjRcDbOHGZUFXcTw9VXA7rFFAdE1CJ9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2019 03:58:53.6233 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d98505-8810-4204-6b3d-08d776dbf29f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3995
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+jfBQooAkZcQMyeI/yEy+9xlqwiX2OGioFZRvCBIxc=;
 b=P+0KiGu51+x6tfl4V31rNLQqBMa5MhBq5j9XJ5fPKQ6Lk8iATsnIiy32BvrFc2HehoozPIJaswUbwSPcVB2UMgN9mWr8qLepoE7kZKt7IiXz2tW6EG2BeBPmY1suaB+ervAfqsJW1HNvhgUOHA6aC1in2/e0c6RpQ+zqo810LEs=
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
Cc: Jerry.Zuo@amd.com, Nicholas.Kazlauskas@amd.com,
 Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1doeV0KSWYgdGhlIHBheWxvYWRfc3RhdGUgaXMgRFBfUEFZTE9BRF9ERUxFVEVfTE9DQUwgaW4g
c2VyaWVzLCBjdXJyZW50CmNvZGUgZG9lc24ndCBkZWxldGUgdGhlIHBheWxvYWQgYXQgY3VycmVu
dCBpbmRleCBhbmQganVzdCBtb3ZlIHRoZQppbmRleCB0byBuZXh0IG9uZSBhZnRlciBzaHVmZmxp
bmcgcGF5bG9hZHMuCgpbSG93XQpBZnRlciBzaHVmZmxpbmcgcGF5bG9hZHMsIGRlY2lkZSB3aGV0
aGVyIHRvIG1vdmUgb24gaW5kZXggb3Igbm90CmFjY29yZGluZyB0byBwYXlsb2FkX3N0YXRlIG9m
IGN1cnJlbnQgcGF5bG9hZC4KClNpZ25lZC1vZmYtYnk6IFdheW5lIExpbiA8V2F5bmUuTGluQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDMgKyst
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5kZXggODFlOTJiMjYwZDdhLi44ZGE1ZDQ2MWVh
MDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwpAQCAtMzE3Niw3ICszMTc2
LDggQEAgaW50IGRybV9kcF91cGRhdGVfcGF5bG9hZF9wYXJ0MShzdHJ1Y3QgZHJtX2RwX21zdF90
b3BvbG9neV9tZ3IgKm1ncikKIAkJCWRybV9kcF9tc3RfdG9wb2xvZ3lfcHV0X3BvcnQocG9ydCk7
CiAJfQogCi0JZm9yIChpID0gMDsgaSA8IG1nci0+bWF4X3BheWxvYWRzOyBpKyspIHsKKwlmb3Ig
KGkgPSAwOyBpIDwgbWdyLT5tYXhfcGF5bG9hZHM7CisJCShtZ3ItPnBheWxvYWRzW2ldLnBheWxv
YWRfc3RhdGUgPT0gRFBfUEFZTE9BRF9ERUxFVEVfTE9DQUwpID8gaSA6IGkrKykgewogCQlpZiAo
bWdyLT5wYXlsb2Fkc1tpXS5wYXlsb2FkX3N0YXRlICE9IERQX1BBWUxPQURfREVMRVRFX0xPQ0FM
KQogCQkJY29udGludWU7CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
