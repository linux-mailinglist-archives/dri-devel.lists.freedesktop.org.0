Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92952B6D8F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 22:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7D972AC3;
	Wed, 18 Sep 2019 20:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730065.outbound.protection.outlook.com [40.107.73.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0197472AD8;
 Wed, 18 Sep 2019 20:27:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+KOzAhX9SqJHQC2/a7dUb0yzuwGKMMPW0rDymuJcAVEQd23EfKO+sB5Oc4wVoDjzhRzasFfuBVxQ+XB46/g/dzGj11wVwkf3EJ/CR6U7GslXizrEwUkqzXP/aD5/MqQhuCJGHIkB8yhc64vQaMr0amXtrdRebtnn7WlEkw8yWy/LjZOOThZtMzUpLGBZM0q3DEoo5TxXXg7Ysoq+Jp8x8lKVNidCmOw/C5fVka63IN/RncX3TZPsjZI603JgWS+cPkaLhAUAVZ89fcViZyRf2CR3Ht/hR0jsmHJRHuxIUSFunJXr6HjHjbyiZVFfHWvE9k4zbE3dMMqSItqXK26Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Olb7hYTQ65JfNzHNOUKdpjS4WPwQh/LAAPhfYyCLeN0=;
 b=bDdB1oyoqEyspsZJnmQtOIrsiKFyt4wKkeEae/pWH80U24OjG1hsdcdZa8iGcPkIO7c3eZ6ZTs/l44a0AsCf/eiikn6uZ7JJUQ5gVDJXbGbtDuZ9zQNBUoctLUttLqgy9TRLOT48So6qvvptmXc61jkgI1sYhvpmg+ZF1MU4HOlE8FF4Jg4kihHfouxWBM58b/3B01HeJneEWfG2/iQ+t1Kk+IIw+lc6E77Gq9Ok7t0KLNvltEwvvmt/URykD1MNsAlQqJFyfhMN/Pob7eu0QFjxbjXAP/i+h/czOiQSk7u0Lbe20ydPaxMfh6O+qU2lO2QTzWfx0XuaydlXTO2X7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0025.namprd12.prod.outlook.com (2603:10b6:610:57::35)
 by CY4PR1201MB2535.namprd12.prod.outlook.com (2603:10b6:903:db::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.26; Wed, 18 Sep
 2019 20:27:20 +0000
Received: from DM3NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by CH2PR12CA0025.outlook.office365.com
 (2603:10b6:610:57::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.17 via Frontend
 Transport; Wed, 18 Sep 2019 20:27:20 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT014.mail.protection.outlook.com (10.152.82.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Wed, 18 Sep 2019 20:27:19 +0000
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 18 Sep 2019
 15:27:17 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/15] drm/amdgpu: validate mst topology in atomic check
Date: Wed, 18 Sep 2019 16:26:40 -0400
Message-ID: <12913419239b363a0c20c0c013b2dc3cfd4effb6.1568833906.git.mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568833906.git.mikita.lipski@amd.com>
References: <cover.1568833906.git.mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(39860400002)(346002)(428003)(189003)(199004)(356004)(81156014)(8676002)(81166006)(50226002)(36756003)(8936002)(26005)(4326008)(15650500001)(478600001)(14444005)(6916009)(48376002)(50466002)(76176011)(51416003)(7696005)(53416004)(186003)(476003)(2616005)(336012)(126002)(47776003)(426003)(118296001)(2351001)(6666004)(2876002)(70206006)(2906002)(5660300002)(86362001)(16586007)(446003)(11346002)(54906003)(305945005)(70586007)(486006)(316002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2535; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3eb749d7-9ec9-4dd3-1c8b-08d73c769acd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CY4PR1201MB2535; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2535:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB25354FE56B55BF7352671E58E48E0@CY4PR1201MB2535.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:121;
X-Forefront-PRVS: 01644DCF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: LtriZz1Jdp7WmlSGHv/AjZVL9KDtNlqPoQeXdxeOlJSrLYLlhsh2bZ85T2lYLwpq0S1UjuAlI4ddKkLkMjQLlt06S1olsx/vTYHVXE/dCdhV/RvoQMSOm6lqmuWKcxmnQj+Yo2stdU5XMESZ/JzZZU4I5kuZrNmSeK53MnJW56IBEfKdbDK4Ut1Ad3dxaAgilzqZw8SAaeOItjARKTwkzjFpCGYR93AXYhOwsIIBTp0N7iqbvVvwUoR3R1M0BUSCT90HdKiNsTBU11b0Ki1r+COht776i+Dk7ZtDLJvZkUoMTRu9yW0XbueVR5YPLL8amCNj5oKjzFhOh5cz+RuigpIag0aRS9mbk+7Tnfpfrhwz5lwgh0UvkR/3fWf1LOvT/lyBlDo8L2GK1YiLwzbKbIl40BQm2sElahSwssea0LA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 20:27:19.5824 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb749d7-9ec9-4dd3-1c8b-08d73c769acd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2535
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Olb7hYTQ65JfNzHNOUKdpjS4WPwQh/LAAPhfYyCLeN0=;
 b=F6SaLxZ9sCJ4hglKkSYg+WS9vt/XqKXP4fur+O3DGpl/PISeWZt7+mq0IErKTgGNCCCp2y+KgjsSVULasEsxxcUD6WYEwQsGYiUraWTIjYVEDV6A3zUoJF3hw+BeSaR0V28EPa6MHZHIsPjKbgm79OIyiCC2tpJ86UekOaFfWhg=
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKW3doeV0KVmFsaWRh
dGUgbXN0IHRvcG9sb2d5IGFuZCB0aGUgbnVtYmVyIG9mIFZDUEkgc2xvdHMgYXZhaWxhYmxlCmZv
ciBhIG5ldyBzdGF0ZS4gRmFpbCBpZiB0b3BvbG9neSBoYXMgbm8gbW9yZSBiYW5kd2lkdGggZm9y
CmEgbmV3IHN0YXRlLgpbaG93XQpQYXNzIHRoZSBhdG9taWMgc3RhdGUgdG8gZHJtX2RwX21zdF9h
dG9taWNfY2hlY2sgdG8gdmVyaWZ5CmlmIHRoZSBuZXcgdG9wb2xvZ3kgaXMgcG9zc2libGUuCgpD
YzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogTWlraXRhIExp
cHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMKaW5kZXggZDcwMGI5NjJkMzM4Li4zOWMyMzlhMDg2MzMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAt
NzQ4NSw2ICs3NDg1LDExIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2F0b21pY19jaGVjayhzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LAogCWlmIChyZXQpCiAJCWdvdG8gZmFpbDsKIAorCS8qIFBlcmZv
cm0gdmFsaWRhdGlvbiBvZiBNU1QgdG9wb2xvZ3kgaW4gdGhlIHN0YXRlKi8KKwlyZXQgPSBkcm1f
ZHBfbXN0X2F0b21pY19jaGVjayhzdGF0ZSk7CisJaWYgKHJldCkKKwkJZ290byBmYWlsOworCiAJ
aWYgKHN0YXRlLT5sZWdhY3lfY3Vyc29yX3VwZGF0ZSkgewogCQkvKgogCQkgKiBUaGlzIGlzIGEg
ZmFzdCBjdXJzb3IgdXBkYXRlIGNvbWluZyBmcm9tIHRoZSBwbGFuZSB1cGRhdGUKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
