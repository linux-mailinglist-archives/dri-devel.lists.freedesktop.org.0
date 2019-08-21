Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9B59850C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F406E9FD;
	Wed, 21 Aug 2019 20:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710086.outbound.protection.outlook.com [40.107.71.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C7F6E9FC;
 Wed, 21 Aug 2019 20:02:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkqXmST6UR4JCuM/ulEbdTSCcLyzCjKe5YXKpcVxSO45k2o+pwGA9sG9FmqyNaGhp1vFf9TMHwzBmxBfYgD2KPGfUUXnlLux+JN+Tb5REotFDSYCtXKi4cHXy/r4YM3LdRjCBh0aNUzfWdB2tlDNzAsP7mugMM0km4sigEBAXbyOZenwF7RAyu/czbVdpMiRh4vO1kv7FB0B6R6L84L2flMs0ElP28nlpVgADTUNLsFsONaGtuk9y9jQTtOuvdyURJTVzrUYQqrG8XUFEhE4wh/bA+8pTtar2f0Sc0F3PT69ggoXpyyLouh4Lf0U2dE8oczg7FaJYbh6UfqslDlyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDZmIeuxAdhv3JdG+5/rIPrOoW5tuDheLrJ9+wu6oL8=;
 b=cNnBS5n0nYFWNB92ClJLZICOhojzTeu6YPsEMpdT5dN6uVx0u4IDDlK/NBoKH0dJVF2t5TQ6SPCXJZxq6GnHAnhyhYxHH6sL9SveK/NaUWYkEr6pdEJ+r/lrXXGUKGG5tvw7UN8jSbWCndmn6erjHiw3vDR6xLrwwDUdO8OI8io6TFV1Zybk3Vw9J/RTLikoDkvmj8ingWsxO/gsZA4HmtmnWNavbwlV2EgqL4on2oCHNY1TeePmtvQyfhxRpO4FKX6EfxodxtL2rqR+IKuxl3tdf1vuHZfdUIXC6qsDU0AVpUAKR66UPMjtUAzSwuDEREa9JCKoU6lx1NqYTotsHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0005.namprd12.prod.outlook.com (2603:10b6:403:2::15)
 by CY4PR12MB1272.namprd12.prod.outlook.com (2603:10b6:903:3e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Wed, 21 Aug
 2019 20:02:14 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by BN4PR12CA0005.outlook.office365.com
 (2603:10b6:403:2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Wed, 21 Aug 2019 20:02:13 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 20:02:13 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 21 Aug 2019 15:01:45 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 16/16] drm/amd/display: Trigger modesets on MST DSC
 connectors
Date: Wed, 21 Aug 2019 16:01:29 -0400
Message-ID: <20190821200129.11575-17-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821200129.11575-1-David.Francis@amd.com>
References: <20190821200129.11575-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(396003)(376002)(346002)(136003)(2980300002)(428003)(199004)(189003)(8676002)(51416003)(76176011)(48376002)(2906002)(50466002)(81166006)(26005)(486006)(186003)(81156014)(36756003)(70206006)(4326008)(86362001)(49486002)(70586007)(54906003)(5660300002)(478600001)(305945005)(110136005)(316002)(16586007)(5024004)(14444005)(2616005)(53936002)(446003)(11346002)(47776003)(1076003)(426003)(50226002)(8936002)(336012)(356004)(6666004)(476003)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1272; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92aa492c-86cb-44fc-cfc4-08d726727582
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1272; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1272:
X-Microsoft-Antispam-PRVS: <CY4PR12MB12724B20D17238F0CABBEAE0EFAA0@CY4PR12MB1272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: F9md/bPzX8f6Rpr/53KOkGVw/CmFGG+GXJfpiExLTA0mcAPHT2n+zuZw6r5c58xXWe+Ev9gJ2HKTb0ADj+C9t8KlbJrqJJxRA0IWFv2dlakvHaFTOcHd/OE3AoJC/4t99miyHNyfx7uO+5vpW2SgQTVbOSJCOo8VWbAMB7vPKALahq5cRIeOq9zV0DE/asFDqD1UdiirYowM8JlJz7rsF2o6cm0oWPsXZLzR1vj5l0iGfikn6DaQRcDimZ5hBwTO7vlqwi8xTqrgv4lW+ToyqeLLuEU2bFgDBjXCmeQZRnnsjfcj1i9EGbv8ZDlXS8QmKJnvpvFNH21R0CK2tDcPm8Xc1kc5f08fcipxbVapVi2fsK2d+zUB/baBYtIGFn1YUBHKi1c7Qh0EML5prdWHqS7fDX570HJeAnXvX2sktP8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 20:02:13.3446 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92aa492c-86cb-44fc-cfc4-08d726727582
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1272
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDZmIeuxAdhv3JdG+5/rIPrOoW5tuDheLrJ9+wu6oL8=;
 b=xG+0WvEYiw9gHMgK3DLsGVROrRtv1VTViathUkmmvPmfpGV6/CGHb2CwZg7fVqQoJrckUmVg9PlSqq5qfTi7fku68opIWwyh3Q9Dvlry49lbmJOsY6Ff4E3+RmxKMRr/j+UkitUsVL3xsC8QEpI7vpsCGqp4cGhMOYY6xkMpqV0=
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbmV2ZXIgYSBjb25uZWN0b3Igb24gYW4gTVNUIG5ldHdvcmsgaXMgYXR0YWNoZWQsIGRldGFj
aGVkLCBvcgp1bmRlcmdvZXMgYSBtb2Rlc2V0LCB0aGUgRFNDIGNvbmZpZ3MgZm9yIGVhY2ggc3Ry
ZWFtIG9uIHRoYXQKdG9wb2xvZ3kgd2lsbCBiZSByZWNhbGN1bGF0ZWQuIFRoaXMgY2FuIGNoYW5n
ZSB0aGVpciByZXF1aXJlZApiYW5kd2lkdGgsIHJlcXVpcmluZyBhIGZ1bGwgcmVwcm9ncmFtbWlu
ZywgYXMgdGhvdWdoIGEgbW9kZXNldAp3YXMgcGVyZm9ybWVkLCBldmVuIGlmIHRoYXQgc3RyZWFt
IGRpZCBub3QgY2hhbmdlIHRpbWluZy4KClRoZXJlZm9yZSwgd2hlbmV2ZXIgYSBjcnRjIGhhcyBk
cm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldCwKZm9yIGVhY2ggY3J0YyB0aGF0IHNoYXJlcyBh
IE1TVCB0b3BvbG9neSB3aXRoIHRoYXQgc3RyZWFtIGFuZApzdXBwb3J0cyBEU0MsIGFkZCB0aGF0
IGNydGMgKGFuZCBhbGwgYWZmZWN0ZWQgY29ubmVjdG9ycyBhbmQKcGxhbmVzKSB0byB0aGUgYXRv
bWljIHN0YXRlIGFuZCBzZXQgbW9kZV9jaGFuZ2VkIG9uIGl0cyBzdGF0ZQoKdjI6IERvIHRoaXMg
Y2hlY2sgb25seSBvbiBOYXZpIGFuZCBiZWZvcmUgYWRkaW5nIGNvbm5lY3RvcnMKYW5kIHBsYW5l
cyBvbiBtb2Rlc2V0dGluZyBjcnRjcwoKQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpD
YzogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgpDYzog
THl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2aWQgRnJhbmNp
cyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYyB8IDc3ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA3NyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggMTQ1ZmQ3MzAyNWRjLi43MDJmYjBlMjkwNTMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYwpAQCAtNjQ3NSw3ICs2NDc1LDczIEBAIHN0YXRpYyBpbnQgZG9fYXF1aXJlX2dsb2JhbF9s
b2NrKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAKIAlyZXR1cm4gcmV0IDwgMCA/IHJldCA6IDA7
CiB9CisjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQKKy8qCisgKiBUT0RPOiBU
aGlzIGxvZ2ljIHNob3VsZCBhdCBzb21lIHBvaW50IGJlIG1vdmVkIGludG8gRFJNCisgKi8KK3N0
YXRpYyBpbnQgYWRkX2FmZmVjdGVkX21zdF9kc2NfY3J0Y3Moc3RydWN0IGRybV9hdG9taWNfc3Rh
dGUgKnN0YXRlLCBzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCit7CisJc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3RvcjsKKwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZTsK
KwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9saXN0X2l0ZXIgY29ubl9pdGVyOworCXN0cnVjdCBkcm1f
Y3J0Y19zdGF0ZSAqbmV3X2NydGNfc3RhdGU7CisJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3Ig
KmFjb25uZWN0b3IgPSBOVUxMLCAqYWNvbm5lY3Rvcl90b19hZGQ7CisJaW50IGksIGo7CisJc3Ry
dWN0IGRybV9jcnRjICpjcnRjc19hZmZlY3RlZFtBTURHUFVfTUFYX0NSVENTXSA9IHsgMCB9Owor
CisJZm9yX2VhY2hfbmV3X2Nvbm5lY3Rvcl9pbl9zdGF0ZShzdGF0ZSwgY29ubmVjdG9yLCBjb25u
X3N0YXRlLCBpKSB7CisJCWlmIChjb25uX3N0YXRlLT5jcnRjICE9IGNydGMpCisJCQljb250aW51
ZTsKKworCQlhY29ubmVjdG9yID0gdG9fYW1kZ3B1X2RtX2Nvbm5lY3Rvcihjb25uZWN0b3IpOwor
CQlpZiAoIWFjb25uZWN0b3ItPnBvcnQpCisJCQlhY29ubmVjdG9yID0gTlVMTDsKKwkJZWxzZQor
CQkJYnJlYWs7CisJfQorCisJaWYgKCFhY29ubmVjdG9yKQorCQlyZXR1cm4gMDsKKworCWkgPSAw
OworCWRybV9jb25uZWN0b3JfbGlzdF9pdGVyX2JlZ2luKHN0YXRlLT5kZXYsICZjb25uX2l0ZXIp
OworCWRybV9mb3JfZWFjaF9jb25uZWN0b3JfaXRlcihjb25uZWN0b3IsICZjb25uX2l0ZXIpIHsK
KwkJaWYgKCFjb25uZWN0b3ItPnN0YXRlIHx8ICFjb25uZWN0b3ItPnN0YXRlLT5jcnRjKQorCQkJ
Y29udGludWU7CisKKwkJYWNvbm5lY3Rvcl90b19hZGQgPSB0b19hbWRncHVfZG1fY29ubmVjdG9y
KGNvbm5lY3Rvcik7CisJCWlmICghYWNvbm5lY3Rvcl90b19hZGQtPnBvcnQpCisJCQljb250aW51
ZTsKKworCQlpZiAoYWNvbm5lY3Rvcl90b19hZGQtPnBvcnQtPm1nciAhPSBhY29ubmVjdG9yLT5w
b3J0LT5tZ3IpCisJCQljb250aW51ZTsKKworCQlpZiAoIWFjb25uZWN0b3JfdG9fYWRkLT5kY19z
aW5rKQorCQkJY29udGludWU7CisKKwkJaWYgKCFhY29ubmVjdG9yX3RvX2FkZC0+ZGNfc2luay0+
c2lua19kc2NfY2Fwcy5kc2NfZGVjX2NhcHMuaXNfZHNjX3N1cHBvcnRlZCkKKwkJCWNvbnRpbnVl
OworCisJCWlmIChpID49IEFNREdQVV9NQVhfQ1JUQ1MpCisJCQljb250aW51ZTsKKworCQljcnRj
c19hZmZlY3RlZFtpXSA9IGNvbm5lY3Rvci0+c3RhdGUtPmNydGM7CisJCWkrKzsKKwl9CisJZHJt
X2Nvbm5lY3Rvcl9saXN0X2l0ZXJfZW5kKCZjb25uX2l0ZXIpOworCisJZm9yIChqID0gMDsgaiA8
IGk7IGorKykgeworCQluZXdfY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X2NydGNfc3RhdGUo
c3RhdGUsIGNydGNzX2FmZmVjdGVkW2pdKTsKKwkJaWYgKElTX0VSUihuZXdfY3J0Y19zdGF0ZSkp
CisJCQlyZXR1cm4gUFRSX0VSUihuZXdfY3J0Y19zdGF0ZSk7CiAKKwkJbmV3X2NydGNfc3RhdGUt
Pm1vZGVfY2hhbmdlZCA9IHRydWU7CisJfQorCisJcmV0dXJuIDA7CisKK30KKyNlbmRpZgogc3Rh
dGljIHZvaWQgZ2V0X2ZyZWVzeW5jX2NvbmZpZ19mb3JfY3J0YygKIAlzdHJ1Y3QgZG1fY3J0Y19z
dGF0ZSAqbmV3X2NydGNfc3RhdGUsCiAJc3RydWN0IGRtX2Nvbm5lY3Rvcl9zdGF0ZSAqbmV3X2Nv
bl9zdGF0ZSkKQEAgLTcxNjAsNiArNzIyNiwxNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9hdG9t
aWNfY2hlY2soc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlpZiAocmV0KQogCQlnb3RvIGZhaWw7
CiAKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAorCWlmIChhZGV2LT5hc2lj
X3R5cGUgPj0gQ0hJUF9OQVZJMTApIHsKKwkJZm9yX2VhY2hfb2xkbmV3X2NydGNfaW5fc3RhdGUo
c3RhdGUsIGNydGMsIG9sZF9jcnRjX3N0YXRlLCBuZXdfY3J0Y19zdGF0ZSwgaSkgeworCQkJaWYg
KGRybV9hdG9taWNfY3J0Y19uZWVkc19tb2Rlc2V0KG5ld19jcnRjX3N0YXRlKSkgeworCQkJCXJl
dCA9IGFkZF9hZmZlY3RlZF9tc3RfZHNjX2NydGNzKHN0YXRlLCBjcnRjKTsKKwkJCQlpZiAocmV0
KQorCQkJCQlnb3RvIGZhaWw7CisJCQl9CisJCX0KKwl9CisjZW5kaWYKIAlmb3JfZWFjaF9vbGRu
ZXdfY3J0Y19pbl9zdGF0ZShzdGF0ZSwgY3J0Yywgb2xkX2NydGNfc3RhdGUsIG5ld19jcnRjX3N0
YXRlLCBpKSB7CiAJCWlmICghZHJtX2F0b21pY19jcnRjX25lZWRzX21vZGVzZXQobmV3X2NydGNf
c3RhdGUpICYmCiAJCSAgICAhbmV3X2NydGNfc3RhdGUtPmNvbG9yX21nbXRfY2hhbmdlZCAmJgot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
