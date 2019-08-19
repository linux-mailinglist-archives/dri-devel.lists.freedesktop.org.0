Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DAA94927
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 17:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052976E218;
	Mon, 19 Aug 2019 15:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9309A6E201;
 Mon, 19 Aug 2019 15:50:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYyQiIs+X5Na/3my8KnwBMMHCidoxsgRrO3HOene32Db1PRAp+yN+q5nM5HhyIPDijaV828CTAxoKujW9qiCTEn95WKcyIYtdIJrn9GXFbCnuCbIakfD4u9rpuWG1VXWJ8Ga0+18uVPAVMWsHK5PzBGfIpYJdzEb3ZHkHXVegcwS0uFaCANecqHqcZClRP+QqRoKSjvLPx+F8V6nNLtaLEovFXRAzirmQeAt76C8REEhLIW0YYJwF4mdbosMS24fQHOHVhT8GwGcxYFWO6o//FiVM92ZS77e9ehkU97/FBiA7ZYyNVBaEnSon573+bFPGvkUROy7ocB9YuJc1uP5Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MO7CLL5M6vQiq6kAWtP7nNrvi1G+A1By5gFiBwUeEms=;
 b=WzEqo3SkfQT4MId0xfSC7+2xou6+aVfx4iJ0VlvXKY2xgEFvWezNHqto/aU+rC1Y1wjvIShP8SNwsIRjswPWFwizOv6Uy3MDnuEmKXB7gV3Z8itOIUBmvvwIPZmfqC45c+nH8ctYtXeDlReQok7ZhHVTR3ZKV7gxr1GJcwOmsxlJFdj2ktJkOzT7q1nccoIRX+cPXBUtWptmViL+kzxp4dBHjc+/yJzcC/Ha8wxXrgDhVCuKwNhZansxAw6iUlO2eV/xdeykMgcF7aMjPTdWJ54NU4U//H5354VKVYC/ut3U9p8sWBbXIY0xbrh9Mvp91+d1o2D2vG3Bv3/Hbhb1Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0045.namprd12.prod.outlook.com (2603:10b6:0:56::13) by
 CY4PR12MB1525.namprd12.prod.outlook.com (2603:10b6:910:11::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 15:50:57 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by DM3PR12CA0045.outlook.office365.com
 (2603:10b6:0:56::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 15:50:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 15:50:57 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 19 Aug 2019 10:50:50 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 12/14] drm/amd/display: Write DSC enable to MST DPCD
Date: Mon, 19 Aug 2019 11:50:36 -0400
Message-ID: <20190819155038.1771-13-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819155038.1771-1-David.Francis@amd.com>
References: <20190819155038.1771-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(396003)(2980300002)(428003)(199004)(189003)(478600001)(110136005)(54906003)(70586007)(5660300002)(4326008)(47776003)(53936002)(70206006)(16586007)(2906002)(316002)(1076003)(11346002)(450100002)(446003)(486006)(2616005)(476003)(126002)(426003)(305945005)(8676002)(49486002)(14444005)(8936002)(81166006)(356004)(6666004)(81156014)(51416003)(26005)(48376002)(86362001)(186003)(50226002)(336012)(36756003)(50466002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1525; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55092fbf-5fc9-43e4-7af0-08d724bd06b5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1525; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1525:
X-Microsoft-Antispam-PRVS: <CY4PR12MB15253CC220C1C0474607D4E4EFA80@CY4PR12MB1525.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: hvgqj/jSSYq1i7lMrnOuDzxHBC8H/Pxn3De2jm0PlQ/EiQGglOBg/gMQ+taVrUEzJ7tKwOvojorc+o9LkTKNHEN3BSJFCiv221+x9yy3Tk9Unxp7LdTPiUsw6VFE+pR8p4rS/OJaeNoB39aqwF5y8eJNWbW4aejxAuRRQPOKFyo577eLyuOzWqJV4FoFppqecevZJAtsg25AflwWhYTCbLOu7hVDdXabcFD2JdpHwbZI7eYHUQMgv080FT2QnPZQqxhdnZJHkNwGER51rWJEaeDpuVyogQckNDYmuYkYFosqXtT67flTJqpPAXTtQ0djpGJohuGEbOfFuHX+aJSXm2/P1oDOHO1UaVMwTQ6XZJN761TLrNGPKYiHq5pRfYc3/XtTRKQd0Wxn0mpuCwoR/PN/caO9aXjPnz1aTkDEQUw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 15:50:57.4538 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55092fbf-5fc9-43e4-7af0-08d724bd06b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1525
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MO7CLL5M6vQiq6kAWtP7nNrvi1G+A1By5gFiBwUeEms=;
 b=UuaR5Il79yBBH6LsN85SnRmA3SLDIXZNKbQ7RuJKOjMXwonFzP+tP6pH4dRWe/8IbBITJl8QoHzdK8Dsf8eCybhdqNJqzLR2PYhIUJ+eF8OukXLqpmPLfw4CDUbEuVw5TqcTZRgM1UoaUaGF+I9x+UMVAk5TbbB3H1gaL/KtDhw=
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
Cc: David Francis <David.Francis@amd.com>, Wenjing Liu <Wenjing.Liu@amd.com>,
 Nikola Cornij <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV3b3JrIHRoZSBkbV9oZWxwZXJzX3dyaXRlX2RzY19lbmFibGUgY2FsbGJhY2sgdG8KaGFuZGxl
IHRoZSBNU1QgY2FzZQoKRGVwZW5kaW5nIG9uIGhvdyBEU0MgaXMgZG9uZSwgdGhlIERQX0RTQ19F
TkFCTEUgYml0Cm5lZWRzIHRvIGJlIHNldCBvbiBhIGRpZmZlcmVudCBwb2ludAoKRm9yIFNTVCwg
dXNlIHRoZSBsaW5rIGF1eAoKRm9yIGVuZHBvaW50IERTQyBvdmVyIERQLXRvLURQIHBlZXIgZGV2
aWNlcywKdXNlIHRoZSBvdXRwdXQgcG9ydAoKRm9yIHBlZXIgZGV2aWNlIERTQyBvdmVyIERQLXRv
LURQIHBlZXIgZGV2aWNlcywKdXNlIHRoZSB1cHN0cmVhbSAocGVlcikgZGV2aWNlCgpGb3IgRFAt
dG8tSERNSSBvciB2aXJ0dWFsIERQIHBlZXIgZGV2aWNlcywKdXNlIHRoZSBvdXRwdXQgcG9ydAoK
Rm9yIHRoZSBTeW5hcHRpeCB3b3JrYXJvdW5kLCB1c2UgdGhlIGxpbmsgYXV4CgpDYzogV2Vuamlu
ZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+CkNjOiBOaWtvbGEgQ29ybmlqIDxOaWtvbGEuQ29y
bmlqQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNA
YW1kLmNvbT4KLS0tCiAuLi4vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJz
LmMgfCAzMCArKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwppbmRleCBiMzJjMDc5MDM5OWEu
LjNkNWRlZWVkODM2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwpAQCAtMzgsNiArMzgsNyBAQAogI2lu
Y2x1ZGUgImRjLmgiCiAjaW5jbHVkZSAiYW1kZ3B1X2RtLmgiCiAjaW5jbHVkZSAiYW1kZ3B1X2Rt
X2lycS5oIgorI2luY2x1ZGUgImFtZGdwdV9kbV9tc3RfdHlwZXMuaCIKIAogI2luY2x1ZGUgImRt
X2hlbHBlcnMuaCIKIApAQCAtNTI1LDggKzUyNiwzNSBAQCBib29sIGRtX2hlbHBlcnNfZHBfd3Jp
dGVfZHNjX2VuYWJsZSgKICkKIHsKIAl1aW50OF90IGVuYWJsZV9kc2MgPSBlbmFibGUgPyAxIDog
MDsKKwlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvcjsKKworCWlmICghc3Ry
ZWFtKQorCQlyZXR1cm4gZmFsc2U7CisKKwlpZiAoc3RyZWFtLT5zaWduYWwgPT0gU0lHTkFMX1RZ
UEVfRElTUExBWV9QT1JUX01TVCkgeworCQlhY29ubmVjdG9yID0gKHN0cnVjdCBhbWRncHVfZG1f
Y29ubmVjdG9yICopc3RyZWFtLT5kbV9zdHJlYW1fY29udGV4dDsKKworCQlpZiAoIWFjb25uZWN0
b3IgfHwgIWFjb25uZWN0b3ItPmRjX3NpbmspCisJCQlyZXR1cm4gZmFsc2U7CisKKwkJaWYgKCFh
Y29ubmVjdG9yLT5kY19zaW5rLT5zaW5rX2RzY19jYXBzLmlzX3ZpcnR1YWxfZHBjZF9kc2MpCisJ
CQlyZXR1cm4gZHJtX2RwX21zdF9kcGNkX3dyaXRlKCZhY29ubmVjdG9yLT5wb3J0LT5hdXgsCisJ
CQkJCQkgICAgRFBfRFNDX0VOQUJMRSwgJmVuYWJsZV9kc2MsIDEpID49IDA7CisJCWVsc2UgaWYg
KGlzX3ZpcnR1YWxfZHBjZChhY29ubmVjdG9yLT5wb3J0LT5wYXJlbnQtPnBvcnRfcGFyZW50KSkK
KwkJCXJldHVybiBkcm1fZHBfbXN0X2RwY2Rfd3JpdGUoJmFjb25uZWN0b3ItPnBvcnQtPnBhcmVu
dC0+cG9ydF9wYXJlbnQtPmF1eCwKKwkJCQkJCSAgICBEUF9EU0NfRU5BQkxFLCAmZW5hYmxlX2Rz
YywgMSkgPj0gMDsKKwkJZWxzZSBpZiAoaXNfdmlydHVhbF9kcGNkKGFjb25uZWN0b3ItPnBvcnQp
KQorCQkJcmV0dXJuIGRybV9kcF9tc3RfZHBjZF93cml0ZSgmYWNvbm5lY3Rvci0+cG9ydC0+YXV4
LAorCQkJCQkJICAgIERQX0RTQ19FTkFCTEUsICZlbmFibGVfZHNjLCAxKSA+PSAwOworCQllbHNl
IGlmIChzeW5hcHRpeF93b3JrYXJvdW5kKGFjb25uZWN0b3IpKQorCQkJcmV0dXJuIGRtX2hlbHBl
cnNfZHBfd3JpdGVfZHBjZChjdHgsIHN0cmVhbS0+bGluaywKKwkJCQkJCURQX0RTQ19FTkFCTEUs
ICZlbmFibGVfZHNjLCAxKTsKKwl9CisKKwlpZiAoc3RyZWFtLT5zaWduYWwgPT0gU0lHTkFMX1RZ
UEVfRElTUExBWV9QT1JUKQorCQlyZXR1cm4gZG1faGVscGVyc19kcF93cml0ZV9kcGNkKGN0eCwg
c3RyZWFtLT5saW5rLCBEUF9EU0NfRU5BQkxFLCAmZW5hYmxlX2RzYywgMSk7CiAKLQlyZXR1cm4g
ZG1faGVscGVyc19kcF93cml0ZV9kcGNkKGN0eCwgc3RyZWFtLT5zaW5rLT5saW5rLCBEUF9EU0Nf
RU5BQkxFLCAmZW5hYmxlX2RzYywgMSk7CisJcmV0dXJuIGZhbHNlOwogfQogI2VuZGlmCiAKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
