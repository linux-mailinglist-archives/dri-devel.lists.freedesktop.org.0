Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F14F8A3F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 09:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E806EA69;
	Tue, 12 Nov 2019 08:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700059.outbound.protection.outlook.com [40.107.70.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFB16E8D1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 11:47:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wrbm7MWibQ3Bwu2LUbYsEqY63FSpZsj7tPAbjUONq2uMAljPAL9BUxVL667ImhY2LSH7oEVV2U6nhOJuZm4ogiARRfpoosbtNhuJw7oA3mm8x1JEOHMhlF4DjyZdweeQvEScYRn0JWGZUz2CG6d6GWPQK6wz6WvosVpV8e5f2LXtXDeqquD7ShYh8YSr03MJQ4rNl0bHVxHEgEqSkVl/tmszS5OCgC5sfVRKU03EEKhS4JxQrQ7d1JstTJwdcVzmaSwDcba/VTONJBGy1aCHteeRHs5Tgigh9PJVOLX+kkH2n6oTKDyqnklHrhhltaYvwLYscWV7vMb81btyAioyzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmtzzjOjy6abm00nMZM9vg3bI6W3aD++x1jPwV06+Co=;
 b=J0CtU09iQlW1V5GISBDFW7Q9F1XLxp8oG0rZHeYwJCgTULmYVjB9/uSW+GDdNkyvP5GTRgsud7MNhHu4J8i6+7uTnU0+WBSiprt29VTeqMCoTGpOlvXDjyJXfXSW0IRxMkJOf+lAxv0/riQ/HcaH1K94D7OOPo1Xm0clu9FtKCiQ3WdnKjskXbpaDvx0nRSgAYniBV9Oqylsrhnji9cuW3tnp7eq27gMyqnqsdS2RzMlBzRx39PZHh/Tv5s2Jb1ZDg4VMRutpuh+5b1SfKjcV/L5HjEMhREXi+hw86e0GYAzVP08bIOTCcqObSSGjAhU0zqv2RNVnVc3R/JagTaYHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
Received: from MWHPR02CA0060.namprd02.prod.outlook.com (2603:10b6:301:60::49)
 by BY5PR02MB6098.namprd02.prod.outlook.com (2603:10b6:a03:1b4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22; Mon, 11 Nov
 2019 11:47:52 +0000
Received: from SN1NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::205) by MWHPR02CA0060.outlook.office365.com
 (2603:10b6:301:60::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.24 via Frontend
 Transport; Mon, 11 Nov 2019 11:47:52 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT050.mail.protection.outlook.com (10.152.72.128) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2430.20
 via Frontend Transport; Mon, 11 Nov 2019 11:47:52 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1iU8Ah-00043K-QI; Mon, 11 Nov 2019 03:47:51 -0800
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1iU8Ac-00055c-Mw; Mon, 11 Nov 2019 03:47:46 -0800
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xABBlamK011215; 
 Mon, 11 Nov 2019 03:47:36 -0800
Received: from [172.19.2.102] (helo=xsjanandash50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1iU8AS-00054O-1e; Mon, 11 Nov 2019 03:47:36 -0800
From: Devarsh Thakkar <devarsh.thakkar@xilinx.com>
To: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: [PATCH libdrm v3] modetest: Add support for setting mode having
 floating vertical refresh rate
Date: Mon, 11 Nov 2019 03:47:22 -0800
Message-Id: <1573472842-4626-1-git-send-email-devarsh.thakkar@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(39860400002)(346002)(189003)(199004)(51416003)(5660300002)(126002)(50466002)(81166006)(8746002)(47776003)(316002)(81156014)(48376002)(426003)(8676002)(44832011)(106002)(186003)(26005)(486006)(50226002)(7696005)(36756003)(2906002)(336012)(6666004)(356004)(9786002)(4326008)(478600001)(305945005)(70206006)(70586007)(2616005)(14444005)(5024004)(8936002)(476003)(36386004)(107886003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR02MB6098; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5b7baf5-6de5-4885-61fb-08d7669cfbe3
X-MS-TrafficTypeDiagnostic: BY5PR02MB6098:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6098EF14B281A65FD7FE5D0CBC740@BY5PR02MB6098.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:332;
X-Forefront-PRVS: 0218A015FA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6kz+y+WSdn0H3U4alnj09atjnnHhM4L542duwlJfdeNC1A3ZDT6Eh9FPY+CShEDy3IU9tN8GIkYptNU2w0A5rmtS2WErtQJ6F6EtfiI3Fu7l7YwBAFZfrBJi56mszSxny79aZ4Srpixt1w3NNQv40vgqNbnP4iJ00klEvEqxUdC85gMQsWY0yvhXWdH1I6m+J4bMyXqjG6tEQSmaEO8EFAOEdHwTa2nlDpf8IUmuOx0QdWUBpDYgOLeUsGbxM+6BbnGHST713yBDVGKmDb40yAakyRpndRSFjHXE0UtEJRxeesuTFSyAv5gQ8A9j8m3SKzrnSL17Veni6ArnwggAJG0Cdp2XsocuXVtYeapXacWQx6dq+aU0j8W3vE2pZFXEgKnTub4slHO4se5KdoN7XpogjzcfX6yTGA5ThKrLkEfbyyz9/1gHLklcBCInqCAi
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2019 11:47:52.1647 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b7baf5-6de5-4885-61fb-08d7669cfbe3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6098
X-Mailman-Approved-At: Tue, 12 Nov 2019 08:13:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmtzzjOjy6abm00nMZM9vg3bI6W3aD++x1jPwV06+Co=;
 b=QjZ5At/xPcY858NUS7Ox6y0JAH0ECa+zGyA3feoVsAXL21TTWeLdMc7ZZqre7VGzOlkKtpDnhCFGO124uDBZHX9OxSvcdQru8VmkyYLWd3h4zcNxrqjSrPx12Sgs0v/IN035qrRAxbU43goV2tKf8WtLcKntjkc3xQ68OqJQ4Fk=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is
 149.199.60.83)
 smtp.mailfrom=xilinx.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
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
Cc: rsk@xilinx.com, vcu-team@xilinx.com, dshah@xilinx.com,
 devarsh.thakkar@xilinx.com, varunkum@xilinx.com, satishna@xilinx.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIHRoZSBzY2VuYXJpbyB3aGVyZSB1c2VyIG1heSByZXF1aXJlIHRvIG1vZGVzZXQgd2l0aCBh
IG1vZGUKc3VwcG9ydGluZyBhIGZyYWN0aW9uYWwgdmFsdWUgZm9yIHZlcnRpY2FsIHJlZnJlc2gt
cmF0ZSwKYXBwcm9wcmlhdGUgbW9kZSBjYW4gYmUgc2VsZWN0ZWQgYnkgc2VhcmNoaW5nIGZvciBt
b2RlCmhhdmluZyBtYXRjaGluZyBmcmFjdGlvbmFsIHZlcnRpY2FsIHJlZnJlc2ggcmF0ZSB1c2lu
ZwpiZWxvdyBlcXVhdGlvbi4KCnZyZWZyZXNoID0gKDEwMDAgKiBwaXhlbCBjbG9jaykgLyAoaHRv
dGFsICogdnRvdGFsKSBIei4KCldlIGRvIHRoaXMgd2F5IHNpbmNlIGRyaXZlciBkb2Vzbid0IHJl
dHVybiBmbG9hdCB2YWx1ZSBvZiB2cmVmcmVzaAphcyBpdCB1c2UgaW50IGZvciB2cmVmcmVzaCBp
biBzdHJ1Y3QgZHJtX21vZGVfaW5mbywgYnV0IHdlIGNhbiBkZXJpdmUKdGhlIGFjdHVhbCB2YWx1
ZSB1c2luZyBwaXhlbCBjbG9jaywgaG9yaXpvbnRhbCB0b3RhbCBzaXplIGFuZAp2ZXJ0aWNhbCB0
b3RhbCBzaXplIHZhbHVlcy4KClNvIGZvciBlLmcuIGlmIHVzZXIgd2FudCB0byBzZWxlY3QgbW9k
ZSBoYXZpbmcgNTkuOTQgSHogYXMgcmVmcmVzaCByYXRlCnRoZW4gd2l0aCB0aGlzIHBhdGNoIGl0
IGJlIGNhbiBkb25lIGFzIHNob3duIGluIGJlbG93IGNvbW1hbmQsCmdpdmVuIHRoZXJlIGlzIGFu
IGFwcHJvcHJpYXRlIG1vZGUgaXMgYXZhaWxhYmxlIDoKCm1vZGV0ZXN0IC1NIHhsbnggLXMgMzk6
MTkyMHgxMDgwLTU5Ljk0QEJHMjQgLXYKCk5PVEU6IEFib3ZlIGNvbW1hbmQgd2FzIHRlc3RlZCBv
biB4aWxpbnggRFJNIGRyaXZlciB3aXRoIERQCm1vbml0b3Igd2hpY2ggd2FzIHN1cHBvcnRpbmcg
bW9kZSBoYXZpbmcgNTkuOTQgSHogcmVmcmVzaCByYXRlLgoKU2lnbmVkLW9mZi1ieTogRGV2YXJz
aCBUaGFra2FyIDxkZXZhcnNoLnRoYWtrYXJAeGlsaW54LmNvbT4KLS0tClYyOiBVcGRhdGUgY29t
bWl0IG1lc3NhZ2UKVjM6IFVwZGF0ZSB3aXRoIGJlbG93IGNoYW5nZXMgYXMgcGVyIHJldmlldyBj
b21tZW50cyA6CiAgMSkgVXNlIGVwc2lsb24gZm9yIHZyZWZyZXNoIGNvbXBhcmlzb24KICAyKSBV
c2UgaW1wbGljaXQgdHlwZS1jYXN0aW5nIHdoZXJldmVyIHBvc3NpYmxlCi0tLQogdGVzdHMvbW9k
ZXRlc3QvbW9kZXRlc3QuYyB8IDIwICsrKysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9t
b2RldGVzdC9tb2RldGVzdC5jIGIvdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYwppbmRleCBlNjZi
ZTY2Li5iNGVkZmNiIDEwMDY0NAotLS0gYS90ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jCisrKyBi
L3Rlc3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMKQEAgLTU0LDYgKzU0LDcgQEAKICNpZmRlZiBIQVZF
X1NZU19TRUxFQ1RfSAogI2luY2x1ZGUgPHN5cy9zZWxlY3QuaD4KICNlbmRpZgorI2luY2x1ZGUg
PG1hdGguaD4KCiAjaW5jbHVkZSAieGY4NmRybS5oIgogI2luY2x1ZGUgInhmODZkcm1Nb2RlLmgi
CkBAIC03OTUsNyArNzk2LDcgQEAgc3RydWN0IHBpcGVfYXJnIHsKICAgICAgICB1aW50MzJfdCBj
cnRjX2lkOwogICAgICAgIGNoYXIgbW9kZV9zdHJbNjRdOwogICAgICAgIGNoYXIgZm9ybWF0X3N0
cls1XTsKLSAgICAgICB1bnNpZ25lZCBpbnQgdnJlZnJlc2g7CisgICAgICAgZmxvYXQgdnJlZnJl
c2g7CiAgICAgICAgdW5zaWduZWQgaW50IGZvdXJjYzsKICAgICAgICBkcm1Nb2RlTW9kZUluZm8g
Km1vZGU7CiAgICAgICAgc3RydWN0IGNydGMgKmNydGM7CkBAIC04MjIsMTEgKzgyMywxMiBAQCBz
dHJ1Y3QgcGxhbmVfYXJnIHsKCiBzdGF0aWMgZHJtTW9kZU1vZGVJbmZvICoKIGNvbm5lY3Rvcl9m
aW5kX21vZGUoc3RydWN0IGRldmljZSAqZGV2LCB1aW50MzJfdCBjb25faWQsIGNvbnN0IGNoYXIg
Km1vZGVfc3RyLAotICAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQgdnJlZnJlc2gpCisgICAgICAg
Y29uc3QgZmxvYXQgdnJlZnJlc2gpCiB7CiAgICAgICAgZHJtTW9kZUNvbm5lY3RvciAqY29ubmVj
dG9yOwogICAgICAgIGRybU1vZGVNb2RlSW5mbyAqbW9kZTsKICAgICAgICBpbnQgaTsKKyAgICAg
ICBmbG9hdCBtb2RlX3ZyZWZyZXNoOwoKICAgICAgICBjb25uZWN0b3IgPSBnZXRfY29ubmVjdG9y
X2J5X2lkKGRldiwgY29uX2lkKTsKICAgICAgICBpZiAoIWNvbm5lY3RvciB8fCAhY29ubmVjdG9y
LT5jb3VudF9tb2RlcykKQEAgLTgzOSw5ICs4NDEsMTEgQEAgY29ubmVjdG9yX2ZpbmRfbW9kZShz
dHJ1Y3QgZGV2aWNlICpkZXYsIHVpbnQzMl90IGNvbl9pZCwgY29uc3QgY2hhciAqbW9kZV9zdHIs
CiAgICAgICAgICAgICAgICAgICAgICAgICAqIGZpcnN0IG1vZGUgdGhhdCBtYXRjaCB3aXRoIHRo
ZSBuYW1lLiBFbHNlLCByZXR1cm4gdGhlIG1vZGUgdGhhdCBtYXRjaAogICAgICAgICAgICAgICAg
ICAgICAgICAgKiB0aGUgbmFtZSBhbmQgdGhlIHNwZWNpZmllZCB2ZXJ0aWNhbCByZWZyZXNoIGZy
ZXF1ZW5jeS4KICAgICAgICAgICAgICAgICAgICAgICAgICovCisgICAgICAgICAgICAgICAgICAg
ICAgIG1vZGVfdnJlZnJlc2ggPSBtb2RlLT5jbG9jayAqIDEwMDAuMDAKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC8gKG1vZGUtPmh0b3RhbCAqIG1vZGUtPnZ0b3RhbCk7
CiAgICAgICAgICAgICAgICAgICAgICAgIGlmICh2cmVmcmVzaCA9PSAwKQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiBtb2RlOwotICAgICAgICAgICAgICAgICAgICAgICBl
bHNlIGlmIChtb2RlLT52cmVmcmVzaCA9PSB2cmVmcmVzaCkKKyAgICAgICAgICAgICAgICAgICAg
ICAgZWxzZSBpZiAoZmFicyhtb2RlX3ZyZWZyZXNoIC0gdnJlZnJlc2gpIDwgMC4wMDUpCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIG1vZGU7CiAgICAgICAgICAgICAgICB9
CiAgICAgICAgfQpAQCAtMTM5Myw4ICsxMzk3LDggQEAgc3RhdGljIHZvaWQgYXRvbWljX3NldF9t
b2RlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHBpcGVfYXJnICpwaXBlcywgdW5zaWduZWQK
ICAgICAgICAgICAgICAgIGlmIChwaXBlLT5tb2RlID09IE5VTEwpCiAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlOwoKLSAgICAgICAgICAgICAgIHByaW50Zigic2V0dGluZyBtb2RlICVz
LSVkSHogb24gY29ubmVjdG9ycyAiLAotICAgICAgICAgICAgICAgICAgICAgIHBpcGUtPm1vZGVf
c3RyLCBwaXBlLT5tb2RlLT52cmVmcmVzaCk7CisgICAgICAgICAgICAgICBwcmludGYoInNldHRp
bmcgbW9kZSAlcy0lLjJmSHogb24gY29ubmVjdG9ycyAiLAorICAgICAgICAgICAgICAgICAgICAg
IHBpcGUtPm1vZGVfc3RyLCBwaXBlLT52cmVmcmVzaCk7CiAgICAgICAgICAgICAgICBmb3IgKGog
PSAwOyBqIDwgcGlwZS0+bnVtX2NvbnM7ICsraikgewogICAgICAgICAgICAgICAgICAgICAgICBw
cmludGYoIiVzLCAiLCBwaXBlLT5jb25zW2pdKTsKICAgICAgICAgICAgICAgICAgICAgICAgYWRk
X3Byb3BlcnR5KGRldiwgcGlwZS0+Y29uX2lkc1tqXSwgIkNSVENfSUQiLCBwaXBlLT5jcnRjLT5j
cnRjLT5jcnRjX2lkKTsKQEAgLTE0NzYsOCArMTQ4MCw4IEBAIHN0YXRpYyB2b2lkIHNldF9tb2Rl
KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHBpcGVfYXJnICpwaXBlcywgdW5zaWduZWQgaW50
IGNvCiAgICAgICAgICAgICAgICBpZiAocGlwZS0+bW9kZSA9PSBOVUxMKQogICAgICAgICAgICAg
ICAgICAgICAgICBjb250aW51ZTsKCi0gICAgICAgICAgICAgICBwcmludGYoInNldHRpbmcgbW9k
ZSAlcy0lZEh6QCVzIG9uIGNvbm5lY3RvcnMgIiwKLSAgICAgICAgICAgICAgICAgICAgICBwaXBl
LT5tb2RlX3N0ciwgcGlwZS0+bW9kZS0+dnJlZnJlc2gsIHBpcGUtPmZvcm1hdF9zdHIpOworICAg
ICAgICAgICAgICAgcHJpbnRmKCJzZXR0aW5nIG1vZGUgJXMtJS4yZkh6QCVzIG9uIGNvbm5lY3Rv
cnMgIiwKKyAgICAgICAgICAgICAgICAgICAgICBwaXBlLT5tb2RlX3N0ciwgcGlwZS0+dnJlZnJl
c2gsIHBpcGUtPmZvcm1hdF9zdHIpOwogICAgICAgICAgICAgICAgZm9yIChqID0gMDsgaiA8IHBp
cGUtPm51bV9jb25zOyArK2opCiAgICAgICAgICAgICAgICAgICAgICAgIHByaW50ZigiJXMsICIs
IHBpcGUtPmNvbnNbal0pOwogICAgICAgICAgICAgICAgcHJpbnRmKCJjcnRjICVkXG4iLCBwaXBl
LT5jcnRjLT5jcnRjLT5jcnRjX2lkKTsKQEAgLTE3MTMsNyArMTcxNyw3IEBAIHN0YXRpYyBpbnQg
cGFyc2VfY29ubmVjdG9yKHN0cnVjdCBwaXBlX2FyZyAqcGlwZSwgY29uc3QgY2hhciAqYXJnKQog
ICAgICAgIHBpcGUtPm1vZGVfc3RyW2xlbl0gPSAnXDAnOwoKICAgICAgICBpZiAoKnAgPT0gJy0n
KSB7Ci0gICAgICAgICAgICAgICBwaXBlLT52cmVmcmVzaCA9IHN0cnRvdWwocCArIDEsICZlbmRw
LCAxMCk7CisgICAgICAgICAgICAgICBwaXBlLT52cmVmcmVzaCA9IHN0cnRvZihwICsgMSwgJmVu
ZHApOwogICAgICAgICAgICAgICAgcCA9IGVuZHA7CiAgICAgICAgfQoKLS0KMi43LjQKClRoaXMg
ZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgaW50ZW5kZWQgZm9yIHRoZSBzb2xlIHVzZSBv
ZiB0aGUgbmFtZWQgcmVjaXBpZW50KHMpIGFuZCBjb250YWluKHMpIGNvbmZpZGVudGlhbCBpbmZv
cm1hdGlvbiB0aGF0IG1heSBiZSBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCBvciBjb3B5cmlnaHRl
ZCB1bmRlciBhcHBsaWNhYmxlIGxhdy4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lw
aWVudCwgZG8gbm90IHJlYWQsIGNvcHksIG9yIGZvcndhcmQgdGhpcyBlbWFpbCBtZXNzYWdlIG9y
IGFueSBhdHRhY2htZW50cy4gRGVsZXRlIHRoaXMgZW1haWwgbWVzc2FnZSBhbmQgYW55IGF0dGFj
aG1lbnRzIGltbWVkaWF0ZWx5LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
