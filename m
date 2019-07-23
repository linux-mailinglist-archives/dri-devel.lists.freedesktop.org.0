Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C126D72309
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 01:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6BF6E3EF;
	Tue, 23 Jul 2019 23:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770085.outbound.protection.outlook.com [40.107.77.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408706E3DB;
 Tue, 23 Jul 2019 23:29:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUmR0pzEwUYmhd9GeO/gcz/kgmnqcpzdxvRuM5Xjei1xQ7VL95sVUXs3zR+3HrUTxVvg5bXY/7nYis/7D3grgFXiRqdCxji3Jiyz/MawJBM82z9fBnghg0O9nhrhJ63j9ng4vb7K3vBJ1ySXxCld6lUUAjy/2yHIKltfu+nV25ZJravVqjHSbfN76os0l5VW4c/9NRvZ+6JXw7sYQyYX1xjVcB4znIxndX97NR2nrOFz1usQs5rZ1LUw3EzpLqrqfhpZ48GVxMrVuUNcnnHvwGC/CbFnt5gyAbCvnk6eIufd3IM9pkXmShGEVl+d2WA1FlJuulWwaXFXo0exdHlsjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JsCXW5vE2UQN0bNHktwEhab0TAdTOIi/NCdKK+Ns+Q=;
 b=jviHkCyYHhEFT977nKwd4shFiiomD4jRjqI5wWQNb36QwwvNEFI8IHrdFRUYzHH1YnIwq4G1rLQzqGBnvB4scpiNdOkTL9k3QwMnT5Sk32me1opq2fdgpSLgtT2/Uf1TrTnycIzCVvrwfsSaVT+6hBaGDEZlBUSWFuk2pzHHsrwd8fHGbvUinAXf2XFj2CFBkVpGsOuLX++Ec/p46mhR8x0MGgW5hAoEzspI9vBzb8QKdCR3J9/XsB/cu67OKSmi094c/reJ9NnH5B5kmwqSEOi4VVYxyN1wwDW5gXPU4e6ZplK+FoxzCdo4Qwtzz/JkDK0JLlxIbW0FnSI/bwifJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0018.namprd12.prod.outlook.com
 (2603:10b6:910:16::28) by MWHPR12MB1583.namprd12.prod.outlook.com
 (2603:10b6:301:11::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.17; Tue, 23 Jul
 2019 23:29:08 +0000
Received: from DM3NAM03FT038.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by CY4PR1201CA0018.outlook.office365.com
 (2603:10b6:910:16::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12 via Frontend
 Transport; Tue, 23 Jul 2019 23:29:07 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT038.mail.protection.outlook.com (10.152.83.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 23:29:07 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 23 Jul 2019 18:29:04 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/9] drm/amd/display: Use connector kdev as aux device parent
Date: Tue, 23 Jul 2019 19:28:04 -0400
Message-ID: <20190723232808.28128-6-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190723232808.28128-1-sunpeng.li@amd.com>
References: <20190723232808.28128-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(39860400002)(2980300002)(428003)(199004)(189003)(54906003)(53936002)(110136005)(2906002)(50226002)(36756003)(51416003)(48376002)(76176011)(446003)(478600001)(5660300002)(70206006)(476003)(2876002)(86362001)(70586007)(14444005)(26005)(186003)(47776003)(2616005)(1076003)(4326008)(305945005)(336012)(68736007)(11346002)(49486002)(8936002)(126002)(316002)(81166006)(81156014)(8676002)(2870700001)(356004)(50466002)(486006)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1583; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0280393-861a-4e6c-603b-08d70fc58efb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1583; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1583:
X-Microsoft-Antispam-PRVS: <MWHPR12MB158316364C6D8EBCB5825B9D82C70@MWHPR12MB1583.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: DrUQJu7HDv9S/ZzKCydqWZNblVGf+O7r/YvmBhrEBAhG0+7KTRv5wk3Jwi2h0pBP9WL8cWzaem08ipWzPTSLL+DrAs094unXvCKayiEuBpsbSYz2Im5+Eu28PW29fu+rro1DTuri4/iCBan0YQIcxJEctX4e7IY22uW1l9YbpJ7Eny1po27Ozqf2cGCqbaUVGgdiSecMIf51rOclafR16VRuNlr/AaM9RFZjVruMvRsIt3CLJsyMAWvqqxvII4MkNvt6N/OkFibvC22zsYiu7SLZB1wBwHSxO6D2F6ULPFWBxafzFbITTwd2vHUPl/zDLudyHGNww87E8U4vXmYlk2ZictQ4r0QzIIMw7HIt7tz9JyzncBxOwOj/jZ5UO6nrNiWNy2OOM2JDanGgJEwoadTrfJ1YtUj1dPs1rbaIyAg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 23:29:07.5675 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0280393-861a-4e6c-603b-08d70fc58efb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1583
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JsCXW5vE2UQN0bNHktwEhab0TAdTOIi/NCdKK+Ns+Q=;
 b=hz58JWWgOc+tY++8Rh4bh0Z7jF5Ni+CclrS2LA5i/+pEjpTPBJrIHK06TOkzUw0ttleASKOrMxSj3+bmy1hxJ2bIaqEzYCK3BkFlVaN/H6p27BDUVqxJvFLziQx1MzDIgzBZmVVBzEQPSKJhG9Ve2iHRz6uN6NsHq+b0opgUxIQ=
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

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpTZXQgdGhlIGNvbm5lY3RvcidzIGtl
cm5lbCBkZXZpY2UgYXMgdGhlIHBhcmVudCBmb3IgdGhlIGF1eCBrZXJuZWwKZGV2aWNlLiBUaGlz
IGFsbG93cyB1ZGV2IHJ1bGVzIHRvIGFjY2VzcyBjb25uZWN0b3IgYXR0cmlidXRlcyB3aGVuCmNy
ZWF0aW5nIHN5bWxpbmtzIHRvIGF1eCBkZXZpY2VzLgoKRm9yIGV4YW1wbGUsIHRoZSBmb2xsb3dp
bmcgdWRldiBydWxlOgoKU1VCU1lTVEVNPT0iZHJtX2RwX2F1eF9kZXYiLCBTVUJTWVNURU1TPT0i
ZHJtIiwgQVRUUlN7ZWRpZH09PSIqIiwKCVNZTUxJTksrPSJkcm1fZHBfYXV4L2J5LW5hbWUvJGlk
IgoKV2lsbCBjcmVhdGUgdGhlIGZvbGxvd2luZyBzeW1saW5rcyB1c2luZyB0aGUgY29ubmVjdG9y
J3MgbmFtZToKCiQgbHMgL2Rldi9kcm1fZHBfYXV4L2J5LW5hbWUvCmNhcmQwLURQLTEgIGNhcmQw
LURQLTIgIGNhcmQwLURQLTMKCkNjOiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXps
YXVza2FzQGFtZC5jb20+CkNjOiBKZXJyeSAoRmFuZ3poaSkgWnVvIDxKZXJyeS5adW9AYW1kLmNv
bT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVz
LmMKaW5kZXggNmUyMDVlZTM2YWMzLi41M2QyY2ZlNjJlMTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBl
cy5jCkBAIC0zODgsNyArMzg4LDcgQEAgdm9pZCBhbWRncHVfZG1faW5pdGlhbGl6ZV9kcF9jb25u
ZWN0b3Ioc3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtLAogCQkJCSAgICAgICBzdHJ1
Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvcikKIHsKIAlhY29ubmVjdG9yLT5kbV9k
cF9hdXguYXV4Lm5hbWUgPSAiZG1kYyI7Ci0JYWNvbm5lY3Rvci0+ZG1fZHBfYXV4LmF1eC5kZXYg
PSBkbS0+YWRldi0+ZGV2OworCWFjb25uZWN0b3ItPmRtX2RwX2F1eC5hdXguZGV2ID0gYWNvbm5l
Y3Rvci0+YmFzZS5rZGV2OwogCWFjb25uZWN0b3ItPmRtX2RwX2F1eC5hdXgudHJhbnNmZXIgPSBk
bV9kcF9hdXhfdHJhbnNmZXI7CiAJYWNvbm5lY3Rvci0+ZG1fZHBfYXV4LmRkY19zZXJ2aWNlID0g
YWNvbm5lY3Rvci0+ZGNfbGluay0+ZGRjOwogCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
