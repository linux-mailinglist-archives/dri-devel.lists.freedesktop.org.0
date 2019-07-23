Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3237172308
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 01:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4501A6E3E7;
	Tue, 23 Jul 2019 23:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770085.outbound.protection.outlook.com [40.107.77.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E0A6E3D2;
 Tue, 23 Jul 2019 23:29:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBskeBSrWMeKDpj0kLG5RThLi/G92S9kIldE08t3tZ80by518LUab6cBZBt52oF5zIzQ7pZdrkS8mOoyfgjl/w9nZbC7WqKI22A9WS2XyulkuFV4k3o0PJLdEQPBxsxC6Wv7Pq8ncqRTLy/cma2+KL4v70jDlmjVjjrbrmyFxYF4khvNL1KL0tGszL53vjtuGRwloxaa6sBPpGKQoudAU+dr0GFjBJvsmkEEmOmUznzzZWkjK/4Iku6ZX0O11jkDzwXU0YwQzj5trUSTvt7wshqrorpWYbFUhYhuLRRlpDmuEzQjwWju4YIel7SRrrgjv2wZJf6eHaPZRCrKuR7Osg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+1U3k9GYsWrEV/m0WSElHM9u8VbSWfg9n36hVgrw/U=;
 b=H7MuwMu7nhnGHX3H4w6q0go0JLk3Bmr17NmhEF+Rrpk3AqI1jws/yACnMG57hLKr4xgO7VTNN7GVnnwCYvuW206mUl4sDXt/XPwy8jFOqPhdHvjs55CYJz6IE4nq9LKRYm9LLcathmhe6erfbglXA+US9/OobdGYdfrS/+/Qmd/Pn2JClwQDWGSD9FE9DdKo2lGne9LaAsucY1tSJvqSrajd24N0sJj2wAwpOiyrIYNkET8PCslk+56IQiGgZ7Aa0c+wS2hOBfSKKRFh7jAlWuoDeZBP0u3P2EoqtJ3mtcieJPETk8tti6lxufbIjOKU1p5ZBXgrT8+Ly70w+K8+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0018.namprd12.prod.outlook.com
 (2603:10b6:910:16::28) by MWHPR12MB1583.namprd12.prod.outlook.com
 (2603:10b6:301:11::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.17; Tue, 23 Jul
 2019 23:29:07 +0000
Received: from DM3NAM03FT038.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by CY4PR1201CA0018.outlook.office365.com
 (2603:10b6:910:16::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12 via Frontend
 Transport; Tue, 23 Jul 2019 23:29:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT038.mail.protection.outlook.com (10.152.83.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 23:29:06 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 23 Jul 2019 18:29:04 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/9] drm/bridge/analogix-anx78xx: Use connector kdev as aux
 device parent
Date: Tue, 23 Jul 2019 19:28:03 -0400
Message-ID: <20190723232808.28128-5-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190723232808.28128-1-sunpeng.li@amd.com>
References: <20190723232808.28128-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(39860400002)(2980300002)(428003)(199004)(189003)(54906003)(53936002)(110136005)(2906002)(50226002)(36756003)(51416003)(48376002)(76176011)(446003)(478600001)(5660300002)(70206006)(476003)(2876002)(5024004)(86362001)(70586007)(14444005)(26005)(186003)(47776003)(2616005)(1076003)(4326008)(305945005)(336012)(68736007)(11346002)(49486002)(8936002)(126002)(316002)(81166006)(81156014)(8676002)(2870700001)(356004)(50466002)(486006)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1583; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65c42161-7b3d-474d-275d-08d70fc58e6a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1583; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1583:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1583C8AD91918C26D8099F7482C70@MWHPR12MB1583.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: QUdcxC14ZHnHLWp6CStNJixUWkBmtJTJTeAYqzmatiMsJV3FIRsLKguiLMtu+kwVsnMX/UHs0exnAWcEMAtz4UOnvgCs2b89YXMJmRbMW7EWy/GM1pMdqhVfOmFwrZFWZrh5OJ4E/UybMon23DNQkhTE17GuUqaBKxJOM4wxVKqhtGm3rNwv0dsYcXR75Vcf3FxQLVyy2nmFXKIaf06I30zTxVGWqtfQEWm66gfqN4xAMpL0zmja9KPSispbpBkbN1d8oQsuVHVXgV3uXG/eW7/C4fXYhF5wKLjNSFrN2WLJFuujQq7Uu8WBIVEQsAXv958X1ZKkwZh9LzhZNBQYUB1UrxwKaiB/N8RfE5/5XgyMeAk7WQVEkI6nu0sWHmFxBdcAp/vd/jxj47fU2Z+R1hsIj+54ZYuN7ufLPCMA6l0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 23:29:06.5958 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c42161-7b3d-474d-275d-08d70fc58e6a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1583
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+1U3k9GYsWrEV/m0WSElHM9u8VbSWfg9n36hVgrw/U=;
 b=QgNSmzjgJsfhf8oBJKj2f7I4h1j1mzxHu1+rWt7rJ7Wv9MWJQnWbyL/R/4Gx1cmue6n6o2OafV4M3Zz7V9JKNY1NkX+x9c/nmhGAYLubHv7NtPfv+2WIN7rdYnl0vl3AVh+xc+AfENeHQOn4yN2h8/jL8Gec43yfj/XlGD4ILK0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=permerror action=none
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, Leo Li <sunpeng.li@amd.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpTZXQgdGhlIGNvbm5lY3RvcidzIGtl
cm5lbCBkZXZpY2UgYXMgdGhlIHBhcmVudCBmb3IgdGhlIGF1eCBrZXJuZWwKZGV2aWNlLiBUaGlz
IGFsbG93cyB1ZGV2IHJ1bGVzIHRvIGFjY2VzcyBjb25uZWN0b3IgYXR0cmlidXRlcyB3aGVuCmNy
ZWF0aW5nIHN5bWxpbmtzIHRvIGF1eCBkZXZpY2VzLgoKVG8gZG8gc28sIHRoZSBjb25uZWN0b3Ig
bmVlZHMgdG8gYmUgcmVnaXN0ZXJlZCBiZWZvcmVoYW5kLiBUaGVyZWZvcmUsCnNoaWZ0IGF1eCBy
ZWdpc3RyYXRpb24gdG8gYmUgYWZ0ZXIgY29ubmVjdG9yIHJlZ2lzdHJhdGlvbi4KCkNjOiBFbnJp
YyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgpDYzogTmlj
b2xhcyBCb2ljaGF0IDxkcmlua2NhdEBjaHJvbWl1bS5vcmc+ClNpZ25lZC1vZmYtYnk6IExlbyBM
aSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9n
aXgtYW54Nzh4eC5jIHwgMjIgKysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDExIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9hbmFsb2dpeC1hbng3OHh4LmMKaW5kZXggM2M3Y2M1YWY3MzVjLi5jMjgwMGNkM2UyZWUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jCkBAIC0xMDA4LDE3ICsx
MDA4LDYgQEAgc3RhdGljIGludCBhbng3OHh4X2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9icmlk
Z2UgKmJyaWRnZSkKIAkJcmV0dXJuIC1FTk9ERVY7CiAJfQogCi0JLyogUmVnaXN0ZXIgYXV4IGNo
YW5uZWwgKi8KLQlhbng3OHh4LT5hdXgubmFtZSA9ICJEUC1BVVgiOwotCWFueDc4eHgtPmF1eC5k
ZXYgPSAmYW54Nzh4eC0+Y2xpZW50LT5kZXY7Ci0JYW54Nzh4eC0+YXV4LnRyYW5zZmVyID0gYW54
Nzh4eF9hdXhfdHJhbnNmZXI7Ci0KLQllcnIgPSBkcm1fZHBfYXV4X3JlZ2lzdGVyKCZhbng3OHh4
LT5hdXgpOwotCWlmIChlcnIgPCAwKSB7Ci0JCURSTV9FUlJPUigiRmFpbGVkIHRvIHJlZ2lzdGVy
IGF1eCBjaGFubmVsOiAlZFxuIiwgZXJyKTsKLQkJcmV0dXJuIGVycjsKLQl9Ci0KIAllcnIgPSBk
cm1fY29ubmVjdG9yX2luaXQoYnJpZGdlLT5kZXYsICZhbng3OHh4LT5jb25uZWN0b3IsCiAJCQkJ
ICZhbng3OHh4X2Nvbm5lY3Rvcl9mdW5jcywKIAkJCQkgRFJNX01PREVfQ09OTkVDVE9SX0Rpc3Bs
YXlQb3J0KTsKQEAgLTEwMzgsNiArMTAyNywxNyBAQCBzdGF0aWMgaW50IGFueDc4eHhfYnJpZGdl
X2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogCiAJYW54Nzh4eC0+Y29ubmVjdG9y
LnBvbGxlZCA9IERSTV9DT05ORUNUT1JfUE9MTF9IUEQ7CiAKKwkvKiBSZWdpc3RlciBhdXggY2hh
bm5lbCAqLworCWFueDc4eHgtPmF1eC5uYW1lID0gIkRQLUFVWCI7CisJYW54Nzh4eC0+YXV4LmRl
diA9IGFueDc4eHgtPmNvbm5lY3Rvci5rZGV2OworCWFueDc4eHgtPmF1eC50cmFuc2ZlciA9IGFu
eDc4eHhfYXV4X3RyYW5zZmVyOworCisJZXJyID0gZHJtX2RwX2F1eF9yZWdpc3RlcigmYW54Nzh4
eC0+YXV4KTsKKwlpZiAoZXJyIDwgMCkgeworCQlEUk1fRVJST1IoIkZhaWxlZCB0byByZWdpc3Rl
ciBhdXggY2hhbm5lbDogJWRcbiIsIGVycik7CisJCXJldHVybiBlcnI7CisJfQorCiAJZXJyID0g
ZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2RlcigmYW54Nzh4eC0+Y29ubmVjdG9yLAogCQkJCQkg
ICBicmlkZ2UtPmVuY29kZXIpOwogCWlmIChlcnIpIHsKLS0gCjIuMjIuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
