Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 289CA76E7D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 18:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28806EDBA;
	Fri, 26 Jul 2019 16:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam04on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4e::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3DB6EDBA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 16:05:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpuGuyVuD6YMXHPHHHMeOk6asJtas0QkyMppn8Zz/WrZsJcOUrj+sJUc6AcWREiYwToDzQ2KaTZT41/ryyVMnsrj7UllHpg4u+VEjx/tpZjQC1gMT0QeOh/+lynrotyoPtcukMD/qjntcRIdkaRx0mjPtrqU2G60PSOrIY3ZKoVtuj8km0W8UfB4HlMdP0Ol+Fpfv6WbFQDBxu1W8VouuCN3PuihxMzogoC6fisdrXgI8aSxFTF7Mja9YdmjBcXKnieAO3NSHWNcmTW7X6BnbTrXqT/x6GyC91pk4ALzKc9RH6o6gJ6Zl6NlCUmwwF89YR/NJF3nzuZVn5kGi1I2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/E6T5KkdB1mysgz1RyEyd+z7X9GYue0ArY+sRmPXkEw=;
 b=XwCcSPkSzFw/SlFDzrMQbV9BAquo+GniVPHOihigvYEEzFUOs8ROAjSfdlZD4k3vvH2wZMzqi8SYHTjGU5oawsRKgoHp3aTSbhZph71GS/0PAqY/I7/w4ynNdEm97PPnLIhmdTH5ZDxDAfzEk6M6yyi+wK8pAWUbcDHXZTvMNWvhf8iumNb1p14gPVoEDJzGw6AwFQxQlPstpyO+6ntKBXF+xBQ/yNeRtWjiSJh1D7hrQCo4l7bL816IQxLvzvqjrhyfO7faHOWe/eYf1jf2+Gs4M1teFKf1f/+JjjoMerGrYSE2/B8SnWpZPKfnsbWR7aaviRHmlF781RAYwh0GsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0045.namprd12.prod.outlook.com (2603:10b6:301:2::31)
 by MWHPR12MB1312.namprd12.prod.outlook.com (2603:10b6:300:11::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.17; Fri, 26 Jul
 2019 16:05:51 +0000
Received: from CO1NAM03FT042.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by MWHPR12CA0045.outlook.office365.com
 (2603:10b6:301:2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.15 via Frontend
 Transport; Fri, 26 Jul 2019 16:05:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT042.mail.protection.outlook.com (10.152.81.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Fri, 26 Jul 2019 16:05:50 +0000
Received: from Jiraiya.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 26 Jul 2019
 11:05:49 -0500
From: "David (Dingchen) Zhang" <dingchen.zhang@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm: Set crc->opened to false before setting crc source to
 NULL.
Date: Fri, 26 Jul 2019 12:02:19 -0400
Message-ID: <20190726160219.8021-1-dingchen.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(346002)(396003)(2980300002)(428003)(199004)(189003)(186003)(6666004)(14444005)(36756003)(53936002)(305945005)(4326008)(54906003)(50226002)(81156014)(316002)(26005)(51416003)(50466002)(81166006)(336012)(16586007)(356004)(8936002)(486006)(426003)(86362001)(1076003)(126002)(48376002)(47776003)(68736007)(2906002)(8676002)(6916009)(53416004)(476003)(2351001)(478600001)(2616005)(70586007)(7696005)(70206006)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1312; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6790efab-589e-4781-cf7b-08d711e3213f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1312; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1312:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1312C8772BAE3DF21F88B3278DC00@MWHPR12MB1312.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 01106E96F6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 2pRETsc5uHGJ5Oje3uK/Hmj0evTAe1FLEVbCeSiWu3WfE+dLtspljpHmmydynWe+pt0uszsqOqKm/cho6ISM8wKh0gCI2VrDprBUR8lOZJVwUC6/uAe4Pp2vehxnzL0M0Ifd61cBR7h5DPgfd7ai4kRlWjBWoMxIgpEzfR2V/apSP0EhS+ObIw4jyEVMIiBhmR4rkvUITpAzpXbOHHa6QWbgWU6qXt0davvaFUnOrOZHhiV2BL9NLcHqyuEMDWn0pUEMCcycTQIH3eYeK0gtnPL7U0U5kN+zZxzUaRGjBSAjgKsD10xMWm5QfQJjr+YVoXlw5LOLXDbA9oU2/Vq0q9gK19Q/67P8LUwpTiL9wEhXORq5YFfZnb2hMqi8GDExPGXXjkjlY0k9lNntS+K41mryreQeQP66DJFY16E3x88=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2019 16:05:50.7261 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6790efab-589e-4781-cf7b-08d711e3213f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1312
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/E6T5KkdB1mysgz1RyEyd+z7X9GYue0ArY+sRmPXkEw=;
 b=1HUBz/N4Kj/sDm5LkP8sJdVHjiJF5rOts1wzHhoLtnk4ZVUvGcyggs4OBKOL3v7VOaKwVAk3ZJc7JasREdDc5AlbW+j7OsiqpnD/TGJjY5eRoQd85MlGpO1ajI9aP6OkMLvPA6QT4TW3v76T/fZrpwyIgG/js7nzv4egTUYTnck=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=permerror action=none header.from=amd.com;
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
Cc: Dingchen Zhang <dingchen.zhang@amd.com>,
 Nick Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGluZ2NoZW4gWmhhbmcgPGRpbmdjaGVuLnpoYW5nQGFtZC5jb20+Cgp0byB0ZXJtaW5h
dGUgdGhlIHdoaWxlLWxvb3AgaW4gZHJtX2RwX2F1eF9jcmNfd29yayB3aGVuCmRybV9kcF9zdGFy
dC9zdG9wX2NyYyBhcmUgY2FsbGVkIGluIHRoZSBob29rIHRvIHNldCBjcmMgc291cmNlLgoKdjI6
IE1vdmUgc3Bpbl9sb2NrIGFyb3VuZCBlbnRpcmUgY3JjLT5vcGVuZWQgdXNlIChEYW5pZWwpCgpD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogSGFycnkgV2VudGxhbmQgPEhh
cnJ5LldlbnRsYW5kQGFtZC5jb20+CkNjOiBOaWNrIEthemxhdXNrYXMgPE5pY2hvbGFzLkthemxh
dXNrYXNAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogRGluZ2NoZW4gWmhhbmcgPGRpbmdjaGVuLnpo
YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jIHwgNiAr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVn
ZnNfY3JjLmMKaW5kZXggZGFjMjY3ZTg0MGFmLi5mODcxNDgyMDM1OTkgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RlYnVnZnNfY3JjLmMKQEAgLTI0OSw2ICsyNDksMTIgQEAgc3RhdGljIGludCBjcnRjX2NyY19y
ZWxlYXNlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxlcCkKIAlzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGMgPSBmaWxlcC0+Zl9pbm9kZS0+aV9wcml2YXRlOwogCXN0cnVjdCBkcm1f
Y3J0Y19jcmMgKmNyYyA9ICZjcnRjLT5jcmM7CiAKKwkvKiB0ZXJtaW5hdGUgdGhlIGluZmluaXRl
IHdoaWxlIGxvb3AgaWYgJ2RybV9kcF9hdXhfY3JjX3dvcmsnIHJ1bm5pbmcgKi8KKwlzcGluX2xv
Y2tfaXJxKCZjcmMtPmxvY2spOworCWlmIChjcmMtPm9wZW5lZCkKKwkJY3JjLT5vcGVuZWQgPSBm
YWxzZTsKKwlzcGluX3VubG9ja19pcnEoJmNyYy0+bG9jayk7CisKIAljcnRjLT5mdW5jcy0+c2V0
X2NyY19zb3VyY2UoY3J0YywgTlVMTCk7CiAKIAlzcGluX2xvY2tfaXJxKCZjcmMtPmxvY2spOwot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
