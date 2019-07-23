Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F229D7230D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 01:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F7E6E3F3;
	Tue, 23 Jul 2019 23:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780048.outbound.protection.outlook.com [40.107.78.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE1C6E3EE;
 Tue, 23 Jul 2019 23:29:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ar9rBP/zRchJSeeL4/HA17BfuVCbMeVLiar5qad0QRy/Cmihe/oODmUWA/K9CX3yPWsdhijZ5zjXyhHTAbgjp259PcZyOxfNBgA0PpEwj+wZfFSyC8ozZ1NO1Va3hMwkHSjUGkFIn2UX99GfVBY3jptlIqi/6bEJyuBF4XMT3yRCQRLNnr001sSSpjlKjSEvuHlHg+SdDoaiY3TfNLgt/Nz/Eb/mVJEdLEL6RTMvs4aMN+kb0cgBN1ODTozKi0/1pTs1M4hKFMP8sVRBHjaJYICF6vfstOwzWi22xQPc1FwmL9jF3Ir48shwlHA0cpMyokJlX28AeytuR6Ef2hdXWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMX4HAXE+QcWiKCXNX0dXCSqR4+GVXr4+usrboA0ERU=;
 b=QI68YjSc+BydECHgUxvc8XYuSpBz1xKKqilwfJTep6J+zy2+qTl3nYl58tq67DXXZpFMF7fyCf/sPT3uG1agbNK/bqABReiRXA5fXe+53/JFX8FC0Cz8uD7ZKVXX0I/7dVYmala5Vei/TeAEyPVFsfNQ5bIYwmGeh43aCla10+lsRxQ1yanseSlLztR21+pzUC/KH0booYb3hEnLBdMMJe5gHd/Lelq5NTDazchMDlJOrt476ANTUaHrJp8ZEvKf9wG6RD/wLBpMjS2GUKuyEPzIoMiLjhW1rt4PWcYcxMuESmE0Zq27l7+Z/d+5HKHvfPF3QRVIsvLGCD8X0kTG1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0019.namprd12.prod.outlook.com
 (2603:10b6:910:16::29) by MWHPR1201MB2494.namprd12.prod.outlook.com
 (2603:10b6:300:de::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Tue, 23 Jul
 2019 23:29:14 +0000
Received: from DM3NAM03FT038.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by CY4PR1201CA0019.outlook.office365.com
 (2603:10b6:910:16::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.14 via Frontend
 Transport; Tue, 23 Jul 2019 23:29:14 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT038.mail.protection.outlook.com (10.152.83.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 23:29:13 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 23 Jul 2019 18:29:07 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 9/9] drm/amd/display: Implement MST Aux device registration
Date: Tue, 23 Jul 2019 19:28:08 -0400
Message-ID: <20190723232808.28128-10-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190723232808.28128-1-sunpeng.li@amd.com>
References: <20190723232808.28128-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(486006)(51416003)(70206006)(76176011)(70586007)(336012)(36756003)(356004)(478600001)(47776003)(86362001)(26005)(68736007)(305945005)(50226002)(2870700001)(53936002)(2906002)(50466002)(2876002)(81156014)(110136005)(4326008)(14444005)(81166006)(316002)(54906003)(126002)(446003)(1076003)(2616005)(49486002)(11346002)(426003)(48376002)(5660300002)(186003)(8676002)(8936002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB2494; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b2c677e-b4bc-4e13-89ac-08d70fc592b3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR1201MB2494; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2494:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2494409386B8E9BC235A263382C70@MWHPR1201MB2494.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rIEsI88elqxG2KqfNOq8B9CKDLycMoxOgN8UbYnB/991j5RrdBNg6pAWqQMTdw1G0so+RkzWHPeWM/wrEttFCNA47VqgS9q9rKD8PO0AxDRe2ng15k+r93OEBGj4SZmSV2IUyUpjIG7kPEOlKwd2XYoR76SsiR2GJVcQlYuxMJPwz4BQuP7KU4ZNLG60kgvjOSyR7pr7SyL9Kgq4xj8+8pK3+RnEcQ2RHpKdNsfGii9j+VDJn3pVVmpHkkE4Mv9Rz8oymt1wrcCSWU7VIch9vrAx9R3LYNJTw2SiSYK6AnoOwzdN3C5C03GpwwqrTMOmJj0SiBqFbBrxooIGZ8ITg4KfkKaFrirAgTQWlept2yF8oBXY8YMVpMtsYyYlMP5IVkgm4YTDwm/3uOIIX9YfOttnGj4PXU5X+Ld/Jr8h+6s=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 23:29:13.7535 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2c677e-b4bc-4e13-89ac-08d70fc592b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2494
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMX4HAXE+QcWiKCXNX0dXCSqR4+GVXr4+usrboA0ERU=;
 b=uCIgJCZ92AkjdVTkiDnmjBUGuLuhVltfbFMlVC/5LOzhMKC8yWR54qNdl1ormvnYIOCpw9DfWLg3bFVPDwY8zkN5AM/feJ8mjD0CNeIwdidVfo7t+lQkWrC0F29BghhK4b+dhlAEGxUZS0qzscqNnlHYD6r4C84l2KDcycGCu0E=
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
Cc: Leo Li <sunpeng.li@amd.com>, Jerry Zuo <Jerry.Zuo@amd.com>,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpJbXBsZW1lbnQgbGF0ZV9yZWdpc3Rl
ciBhbmQgZWFybHlfdW5yZWdpc3RlciBob29rcyBmb3IgTVNUIGNvbm5lY3RvcnMuCkNhbGwgZHJt
IGhlbHBlcnMgZm9yIE1TVCBjb25uZWN0b3IgcmVnaXN0cmF0aW9uLCB3aGljaCByZWdpc3RlcnMg
dGhlCkFVWCBkZXZpY2VzLgoKQ2M6IEplcnJ5IFp1byA8SmVycnkuWnVvQGFtZC5jb20+CkNjOiBO
aWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+CkNjOiBIYXJy
eSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogTGVvIExp
IDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogLi4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bV9tc3RfdHlwZXMuYyAgIHwgMjQgKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQs
IDIzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCmlu
ZGV4IDUzZDJjZmU2MmUxMy4uMTYyMThhMjAyYjU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYwpA
QCAtMTU2LDYgKzE1NiwyNiBAQCBkbV9kcF9tc3RfY29ubmVjdG9yX2Rlc3Ryb3koc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAlrZnJlZShhbWRncHVfZG1fY29ubmVjdG9yKTsKIH0K
IAorc3RhdGljIGludAorYW1kZ3B1X2RtX21zdF9jb25uZWN0b3JfbGF0ZV9yZWdpc3RlcihzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQoreworCXN0cnVjdCBhbWRncHVfZG1fY29ubmVj
dG9yICphbWRncHVfZG1fY29ubmVjdG9yID0KKwkJdG9fYW1kZ3B1X2RtX2Nvbm5lY3Rvcihjb25u
ZWN0b3IpOworCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQgPSBhbWRncHVfZG1fY29ubmVj
dG9yLT5wb3J0OworCisJcmV0dXJuIGRybV9kcF9tc3RfY29ubmVjdG9yX2xhdGVfcmVnaXN0ZXIo
Y29ubmVjdG9yLCBwb3J0KTsKK30KKworc3RhdGljIHZvaWQKK2FtZGdwdV9kbV9tc3RfY29ubmVj
dG9yX2Vhcmx5X3VucmVnaXN0ZXIoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKK3sK
KwlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYW1kZ3B1X2RtX2Nvbm5lY3RvciA9CisJCXRv
X2FtZGdwdV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKTsKKwlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0
ICpwb3J0ID0gYW1kZ3B1X2RtX2Nvbm5lY3Rvci0+cG9ydDsKKworCWRybV9kcF9tc3RfY29ubmVj
dG9yX2Vhcmx5X3VucmVnaXN0ZXIoY29ubmVjdG9yLCBwb3J0KTsKK30KKwogc3RhdGljIGNvbnN0
IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIGRtX2RwX21zdF9jb25uZWN0b3JfZnVuY3MgPSB7
CiAJLmRldGVjdCA9IGRtX2RwX21zdF9kZXRlY3QsCiAJLmZpbGxfbW9kZXMgPSBkcm1faGVscGVy
X3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMsCkBAIC0xNjQsNyArMTg0LDkgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIGRtX2RwX21zdF9jb25uZWN0b3JfZnVu
Y3MgPSB7CiAJLmF0b21pY19kdXBsaWNhdGVfc3RhdGUgPSBhbWRncHVfZG1fY29ubmVjdG9yX2F0
b21pY19kdXBsaWNhdGVfc3RhdGUsCiAJLmF0b21pY19kZXN0cm95X3N0YXRlID0gZHJtX2F0b21p
Y19oZWxwZXJfY29ubmVjdG9yX2Rlc3Ryb3lfc3RhdGUsCiAJLmF0b21pY19zZXRfcHJvcGVydHkg
PSBhbWRncHVfZG1fY29ubmVjdG9yX2F0b21pY19zZXRfcHJvcGVydHksCi0JLmF0b21pY19nZXRf
cHJvcGVydHkgPSBhbWRncHVfZG1fY29ubmVjdG9yX2F0b21pY19nZXRfcHJvcGVydHkKKwkuYXRv
bWljX2dldF9wcm9wZXJ0eSA9IGFtZGdwdV9kbV9jb25uZWN0b3JfYXRvbWljX2dldF9wcm9wZXJ0
eSwKKwkubGF0ZV9yZWdpc3RlciA9IGFtZGdwdV9kbV9tc3RfY29ubmVjdG9yX2xhdGVfcmVnaXN0
ZXIsCisJLmVhcmx5X3VucmVnaXN0ZXIgPSBhbWRncHVfZG1fbXN0X2Nvbm5lY3Rvcl9lYXJseV91
bnJlZ2lzdGVyLAogfTsKIAogc3RhdGljIGludCBkbV9kcF9tc3RfZ2V0X21vZGVzKHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3IpCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
