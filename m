Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4A810F96D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 09:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA686E3FE;
	Tue,  3 Dec 2019 08:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720079.outbound.protection.outlook.com [40.107.72.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9058B89258
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 10:50:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMndAwwMc4CAtWGFXLTD5kThRjXj3q/9zWuGWiGGv8CnU8y5ptV+IMiexr8+V6h698RofFMMf7tPS9GnQLgrXPLwwgZCjlY461Q9Twu4TflUdT0gE4oyTQs5Rpo6TQ5ZM5lZheQf7ENeAhlbkizSiLdYfocaPuXGUuywtiSf2AzCoKKtwoLRbR+3QW9rtdLKPxOwMi52xgzwEHzx71TnJgoSEpMvyDHDgv3SQBejsscfXS66JJwtzD0RQFp1T07mU3QpeNgAcs2izuQmEZVhxNu6wMCWl3Xd6eQY2k5myhOGqeaM4/1VZN2TQaMKYSmNFR9/x0GxzoamWjGCo3YMOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSAe+bSyTbt/nLxVQyc+5B0H12EAgPMvGdbiNG+utf0=;
 b=NpVljHd5BlJG76EUVWpkvBv6Y4//l2n/tkPCt2ed2eS1xoNsyBrgiDJueP11TvyiqFjeL6cLS7+JFON2aKQQBtPctP9El/qKTDF43yZhBiFavRcuttOYho0XuO8b+lKLwcsar46AnKY4rfDo9HbHxhhpzkDr3bEcECiD4g0FksEF8oVOfb/ERhhQGNt2UbUX4nmSIm7HgOZK5fHl74YiAE4gQ6oqTuDOXC0mPdyoFngWNJv79Uq5UkJDsbKvfaeXCSLJrgfrXsIJ9aeqWm8HVnpAtbjZ9H4rgCNgi0D4wfMO+nVgZBPMv9BZro1EobZt1QqHFxGniPUiBRt+3Xv5Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
Received: from SN4PR0201CA0048.namprd02.prod.outlook.com
 (2603:10b6:803:2e::34) by CY4PR0201MB3619.namprd02.prod.outlook.com
 (2603:10b6:910:8c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17; Mon, 2 Dec
 2019 10:50:18 +0000
Received: from BL2NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::207) by SN4PR0201CA0048.outlook.office365.com
 (2603:10b6:803:2e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18 via Frontend
 Transport; Mon, 2 Dec 2019 10:50:18 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT003.mail.protection.outlook.com (10.152.76.204) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2474.17
 via Frontend Transport; Mon, 2 Dec 2019 10:50:17 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1ibjHV-00071g-0O; Mon, 02 Dec 2019 02:50:17 -0800
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1ibjHP-0004I8-Ri; Mon, 02 Dec 2019 02:50:11 -0800
Received: from [172.19.2.102] (helo=xsjanandash50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1ibjHO-0004G4-UC; Mon, 02 Dec 2019 02:50:10 -0800
From: Devarsh Thakkar <devarsh.thakkar@xilinx.com>
To: dri-devel@lists.freedesktop.org,
	ville.syrjala@linux.intel.com
Subject: [PATCH libdrm v2] modetest: Use floating vrefresh while dumping mode
Date: Mon,  2 Dec 2019 02:50:01 -0800
Message-Id: <1575283801-17859-1-git-send-email-devarsh.thakkar@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(199004)(189003)(478600001)(305945005)(70206006)(70586007)(7696005)(48376002)(14444005)(356004)(6666004)(16586007)(316002)(106002)(2616005)(426003)(336012)(50226002)(44832011)(5660300002)(36756003)(81166006)(81156014)(8936002)(47776003)(36386004)(4326008)(2906002)(9786002)(107886003)(26005)(186003)(8676002)(51416003)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0201MB3619; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91e3810e-631e-4601-a65f-08d777156b9b
X-MS-TrafficTypeDiagnostic: CY4PR0201MB3619:
X-Microsoft-Antispam-PRVS: <CY4PR0201MB3619A41F8274CA9586057C89BC430@CY4PR0201MB3619.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-Forefront-PRVS: 0239D46DB6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8yAvGTQ6CoweyUPluv4AplqPfQxcTpisRHdWKPjD5RArPdrRyv5U1Zg1cRztOqHA0s4Ak8EpZ7/JEWAijv0bKuwyDc5x1ITQVJAsSwB7DYXv6vj7Ab+Bu4FC1IulXX9bLWi+JBLyL86qPzgXIpFSDFKQcDwgRijRSzO1hCSLlSj2vjQ07mfOER6KJdLA85RD6sKK546RyU5Jd1FspmLJatA9+2swkn9SzD2uUoxk0gP1d+MSlV4x0vB/d07HNdfqVcq14n+wwsdR34i3oH+QS5X3Pt4hjMO5d6cBE2PPkZrQrCydp93COvekyw/lau99zG53HKUvL/CYjZHWzgfGAICiv564Gkq3vxvztO7MQQ0fZTBGdijHhNwXsX7Vk8Ybr6JKhECPJbvAh/bYQn4Ni6EZaH6vnh56/n59KW+gbB8YLwoEBY18q0eGNCfp4oR+
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2019 10:50:17.7203 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e3810e-631e-4601-a65f-08d777156b9b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0201MB3619
X-Mailman-Approved-At: Tue, 03 Dec 2019 08:05:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSAe+bSyTbt/nLxVQyc+5B0H12EAgPMvGdbiNG+utf0=;
 b=mdWoS0ahgLvpv5LKsjQJGsojo92/GSJu/DWu/NSTIgZBxuooSq/SQzY9vb3sVLDlKd5yMXYwpHnyh5K8YjhFRHwfVrhcw44PoI4gJsQe7K+vvD/uWUfTiRdj5b2iTevSeIW3uP0IRQivkaS+OC09jkpvjJJZB8AP1PVFBHrim34=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is
 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=bestguesspass action=none
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
 devarsh.thakkar@xilinx.com, varunkum@xilinx.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGlubGluZSBmdW5jdGlvbiB0byBkZXJpdmUgZmxvYXRpbmcgdmFsdWUgb2YgdmVydGljYWwK
cmVmcmVzaCByYXRlIGZyb20gcGl4ZWwgY2xvY2ssIGhvcml6b250YWwgdG90YWwgc2l6ZSBhbmQK
dmVydGljYWwgdG90YWwgc2l6ZS4KClVzZSB0aGlzIGZ1bmN0aW9uIHRvIGZpbmQgc3VpdGFibGUg
bW9kZSBoYXZpbmcgdnJlZnJlc2gKdmFsdWUgd2hpY2ggaXMgbWF0Y2hpbmcgd2l0aCB1c2VyIHBy
b3ZpZGVkIHZyZWZyZXNoIHZhbHVlLgoKSWYgdXNlciBkb2Vzbid0IHByb3ZpZGUgYW55IHZyZWZy
ZXNoIHZhbHVlIGluIGFyZ3MgdGhlbgp1cGRhdGUgdmVydGljYWwgcmVmcmVzaCByYXRlIHZhbHVl
IGluIHBpcGUgYXJncyB1c2luZyB0aGlzCmZ1bmN0aW9uIHNvIHRoYXQgaXQgd2lsbCBiZSB1c2Vk
IGZvciBwcmludGluZyBmbG9hdGluZyB2cmVmcmVzaAp3aGlsZSBkdW1waW5nIG1vZGUuCgpUaGlz
IHdpbGwgZ2l2ZSBtb3JlIGFjY3VyYXRlIHBpY3R1cmUgdG8gdXNlciBmb3IgYXZhaWxhYmxlIG1v
ZGVzCmRpZmZlcmVudGlhdGVkIGJ5IGZsb2F0aW5nIHZlcnRpY2FsIHJlZnJlc2ggcmF0ZSBhbmQg
aGVscCB1c2VyCnNlbGVjdCBtb3JlIGFwcHJvcHJpYXRlIG1vZGUgdXNpbmcgc3VpdGFibGUgcmVm
cmVzaCByYXRlIHZhbHVlLgoKU2lnbmVkLW9mZi1ieTogRGV2YXJzaCBUaGFra2FyIDxkZXZhcnNo
LnRoYWtrYXJAeGlsaW54LmNvbT4KLS0tCiB0ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jIHwgNDAg
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDI3IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL21v
ZGV0ZXN0L21vZGV0ZXN0LmMgYi90ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jCmluZGV4IGI0ZWRm
Y2IuLmMzZTNiZmEgMTAwNjQ0Ci0tLSBhL3Rlc3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMKKysrIGIv
dGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYwpAQCAtMTMzLDYgKzEzMywxMiBAQCBzdGF0aWMgaW5s
aW5lIGludDY0X3QgVTY0Mkk2NCh1aW50NjRfdCB2YWwpCiAJcmV0dXJuIChpbnQ2NF90KSooKGlu
dDY0X3QgKikmdmFsKTsKIH0KIAorc3RhdGljIGZsb2F0IGdldF9mbG9hdGluZ192cmVmcmVzaChk
cm1Nb2RlTW9kZUluZm8gKm1vZGUpCit7CisJcmV0dXJuICBtb2RlLT5jbG9jayAqIDEwMDAuMDAK
KwkJCS8gKG1vZGUtPmh0b3RhbCAqIG1vZGUtPnZ0b3RhbCk7Cit9CisKICNkZWZpbmUgYml0X25h
bWVfZm4ocmVzKQkJCQkJXAogY29uc3QgY2hhciAqIHJlcyMjX3N0cihpbnQgdHlwZSkgewkJCQlc
CiAJdW5zaWduZWQgaW50IGk7CQkJCQkJXApAQCAtMjEwLDkgKzIxNiw5IEBAIHN0YXRpYyB2b2lk
IGR1bXBfZW5jb2RlcnMoc3RydWN0IGRldmljZSAqZGV2KQogCiBzdGF0aWMgdm9pZCBkdW1wX21v
ZGUoZHJtTW9kZU1vZGVJbmZvICptb2RlKQogewotCXByaW50ZigiICAlcyAlZCAlZCAlZCAlZCAl
ZCAlZCAlZCAlZCAlZCAlZCIsCisJcHJpbnRmKCIgICVzICUuMmYgJWQgJWQgJWQgJWQgJWQgJWQg
JWQgJWQgJWQiLAogCSAgICAgICBtb2RlLT5uYW1lLAotCSAgICAgICBtb2RlLT52cmVmcmVzaCwK
KwkgICAgICAgZ2V0X2Zsb2F0aW5nX3ZyZWZyZXNoKG1vZGUpLAogCSAgICAgICBtb2RlLT5oZGlz
cGxheSwKIAkgICAgICAgbW9kZS0+aHN5bmNfc3RhcnQsCiAJICAgICAgIG1vZGUtPmhzeW5jX2Vu
ZCwKQEAgLTgyMywxMiArODI5LDExIEBAIHN0cnVjdCBwbGFuZV9hcmcgewogCiBzdGF0aWMgZHJt
TW9kZU1vZGVJbmZvICoKIGNvbm5lY3Rvcl9maW5kX21vZGUoc3RydWN0IGRldmljZSAqZGV2LCB1
aW50MzJfdCBjb25faWQsIGNvbnN0IGNoYXIgKm1vZGVfc3RyLAotCWNvbnN0IGZsb2F0IHZyZWZy
ZXNoKQorCWZsb2F0ICp2cmVmcmVzaCkKIHsKIAlkcm1Nb2RlQ29ubmVjdG9yICpjb25uZWN0b3I7
CiAJZHJtTW9kZU1vZGVJbmZvICptb2RlOwogCWludCBpOwotCWZsb2F0IG1vZGVfdnJlZnJlc2g7
CiAKIAljb25uZWN0b3IgPSBnZXRfY29ubmVjdG9yX2J5X2lkKGRldiwgY29uX2lkKTsKIAlpZiAo
IWNvbm5lY3RvciB8fCAhY29ubmVjdG9yLT5jb3VudF9tb2RlcykKQEAgLTgzNywxNiArODQyLDE5
IEBAIGNvbm5lY3Rvcl9maW5kX21vZGUoc3RydWN0IGRldmljZSAqZGV2LCB1aW50MzJfdCBjb25f
aWQsIGNvbnN0IGNoYXIgKm1vZGVfc3RyLAogCWZvciAoaSA9IDA7IGkgPCBjb25uZWN0b3ItPmNv
dW50X21vZGVzOyBpKyspIHsKIAkJbW9kZSA9ICZjb25uZWN0b3ItPm1vZGVzW2ldOwogCQlpZiAo
IXN0cmNtcChtb2RlLT5uYW1lLCBtb2RlX3N0cikpIHsKLQkJCS8qIElmIHRoZSB2ZXJ0aWNhbCBy
ZWZyZXNoIGZyZXF1ZW5jeSBpcyBub3Qgc3BlY2lmaWVkIHRoZW4gcmV0dXJuIHRoZQotCQkJICog
Zmlyc3QgbW9kZSB0aGF0IG1hdGNoIHdpdGggdGhlIG5hbWUuIEVsc2UsIHJldHVybiB0aGUgbW9k
ZSB0aGF0IG1hdGNoCi0JCQkgKiB0aGUgbmFtZSBhbmQgdGhlIHNwZWNpZmllZCB2ZXJ0aWNhbCBy
ZWZyZXNoIGZyZXF1ZW5jeS4KKwkJCS8qIElmIHRoZSB2ZXJ0aWNhbCByZWZyZXNoIGZyZXF1ZW5j
eSBpcyBub3Qgc3BlY2lmaWVkCisJCQkgKiB0aGVuIHJldHVybiB0aGUgZmlyc3QgbW9kZSB0aGF0
IG1hdGNoIHdpdGggdGhlIG5hbWUKKwkJCSAqIGFuZCB1cGRhdGUgY29ycmVzcG9uZGluZyB2cmVm
cmVzaCBpbiBwaXBlX2FyZy4KKwkJCSAqIEVsc2UsIHJldHVybiB0aGUgbW9kZSB0aGF0IG1hdGNo
IHRoZSBuYW1lIGFuZAorCQkJICogdGhlIHNwZWNpZmllZCB2ZXJ0aWNhbCByZWZyZXNoIGZyZXF1
ZW5jeS4KIAkJCSAqLwotCQkJbW9kZV92cmVmcmVzaCA9IG1vZGUtPmNsb2NrICogMTAwMC4wMAot
CQkJCQkvIChtb2RlLT5odG90YWwgKiBtb2RlLT52dG90YWwpOwotCQkJaWYgKHZyZWZyZXNoID09
IDApCisJCQlpZiAoKnZyZWZyZXNoID09IDApIHsKKwkJCQkqdnJlZnJlc2ggPSBnZXRfZmxvYXRp
bmdfdnJlZnJlc2gobW9kZSk7CiAJCQkJcmV0dXJuIG1vZGU7Ci0JCQllbHNlIGlmIChmYWJzKG1v
ZGVfdnJlZnJlc2ggLSB2cmVmcmVzaCkgPCAwLjAwNSkKKwkJCX0gZWxzZSBpZiAoZmFicyhnZXRf
ZmxvYXRpbmdfdnJlZnJlc2gobW9kZSkKKwkJCQkgICAtICp2cmVmcmVzaCkgPCAwLjAwNSkgewog
CQkJCXJldHVybiBtb2RlOworCQkJfQogCQl9CiAJfQogCkBAIC05MDksOSArOTE3LDE1IEBAIHN0
YXRpYyBpbnQgcGlwZV9maW5kX2NydGNfYW5kX21vZGUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1
Y3QgcGlwZV9hcmcgKnBpcGUpCiAKIAlmb3IgKGkgPSAwOyBpIDwgKGludClwaXBlLT5udW1fY29u
czsgaSsrKSB7CiAJCW1vZGUgPSBjb25uZWN0b3JfZmluZF9tb2RlKGRldiwgcGlwZS0+Y29uX2lk
c1tpXSwKLQkJCQkJICAgcGlwZS0+bW9kZV9zdHIsIHBpcGUtPnZyZWZyZXNoKTsKKwkJCQkJICAg
cGlwZS0+bW9kZV9zdHIsICZwaXBlLT52cmVmcmVzaCk7CiAJCWlmIChtb2RlID09IE5VTEwpIHsK
LQkJCWZwcmludGYoc3RkZXJyLAorCQkJaWYgKHBpcGUtPnZyZWZyZXNoKQorCQkJCWZwcmludGYo
c3RkZXJyLAorCQkJCSJmYWlsZWQgdG8gZmluZCBtb2RlICIKKwkJCQkiXCIlcy0lLjJmSHpcIiBm
b3IgY29ubmVjdG9yICVzXG4iLAorCQkJCXBpcGUtPm1vZGVfc3RyLCBwaXBlLT52cmVmcmVzaCwg
cGlwZS0+Y29uc1tpXSk7CisJCQllbHNlCisJCQkJZnByaW50ZihzdGRlcnIsCiAJCQkJImZhaWxl
ZCB0byBmaW5kIG1vZGUgXCIlc1wiIGZvciBjb25uZWN0b3IgJXNcbiIsCiAJCQkJcGlwZS0+bW9k
ZV9zdHIsIHBpcGUtPmNvbnNbaV0pOwogCQkJcmV0dXJuIC1FSU5WQUw7Ci0tIAoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
