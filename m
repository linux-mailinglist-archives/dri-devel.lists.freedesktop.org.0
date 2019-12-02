Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1EB10F971
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 09:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F5A6E409;
	Tue,  3 Dec 2019 08:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1526C6E19B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 11:28:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSH4A4z5zSxQQF2wgkgDiEh31v7DAxr+rfefHEELoTwjRJVHFWPP1CMhlobDJC0zNZN+BVePmL5ro4QbuO93ZiQCede+k0tjzdS8m1rVSqJcpsyPrRO0Yxh9KO+R04VbDnIKMVZXTYDLjgeTIwJmSdJbiGOomMkk7i1MugpjH45Yc1HlofgjniT56trr7UG8fROeKZdQHoB2ooKQCxoexXv8nfNZZLTEeA04nQU5fXn06UJXXjhj4i2hJf4iJy+Zv0mcNlOUvKOWt1hCNti9cpDeGs+ly8ISQME59xGVyt82WV4bwiw5kshUexZg2s/w26VWo3PVtoy7zhdV4RBsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eGb3qQO1DkQyUNu/iK4tJWdMbx/+1h+nhFfyGcgV6I=;
 b=TrtILDSIEjf9n3Mwq3uaxwOMJJltg1d6ixngF0nlANLfJdoMedphwpzJXznBFlzTSgVRdVL3WmIeX7nMi8eft4R9MjJhKY8pcgsenATzdZ7L26T0rSHF83GUa1aO4T5M1t3XZEvOdHmC91hmkl91zBLiYSDxX/Ib2nj8nHMWKgEJtBvE556UX7cvxRA2e4fJfv3EotRkePOpoHnmqhSkBDQ+InFgBxKl1EiChXVZZz3DlS/UCM3joei/IDRWmsefsJCbuzvWoUkhT120rvSMzvSM3+JUf6/vBrH3xKXuWCLMGMkEJozAwzOtISMpRP6KDB0c6HKGpTmMKC1augF3mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
Received: from CH2PR02CA0016.namprd02.prod.outlook.com (2603:10b6:610:4e::26)
 by BL0PR02MB5668.namprd02.prod.outlook.com (2603:10b6:208:82::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Mon, 2 Dec
 2019 11:28:14 +0000
Received: from BL2NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::209) by CH2PR02CA0016.outlook.office365.com
 (2603:10b6:610:4e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20 via Frontend
 Transport; Mon, 2 Dec 2019 11:28:14 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT033.mail.protection.outlook.com (10.152.77.163) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2474.17
 via Frontend Transport; Mon, 2 Dec 2019 11:28:13 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1ibjsD-0007Cz-BV; Mon, 02 Dec 2019 03:28:13 -0800
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1ibjs8-0007h5-8C; Mon, 02 Dec 2019 03:28:08 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xB2BRvm8032311; 
 Mon, 2 Dec 2019 03:27:57 -0800
Received: from [172.19.2.102] (helo=xsjanandash50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1ibjrx-0007ZJ-L6; Mon, 02 Dec 2019 03:27:57 -0800
From: Devarsh Thakkar <devarsh.thakkar@xilinx.com>
To: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: [PATCH libdrm v3] modetest: Use floating vrefresh while dumping mode
Date: Mon,  2 Dec 2019 03:27:51 -0800
Message-Id: <1575286071-19500-1-git-send-email-devarsh.thakkar@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(189003)(199004)(8936002)(81166006)(4326008)(36756003)(107886003)(48376002)(16586007)(106002)(44832011)(186003)(26005)(478600001)(336012)(2616005)(426003)(305945005)(9786002)(7696005)(81156014)(8676002)(316002)(50466002)(70586007)(6666004)(51416003)(70206006)(2906002)(36386004)(5660300002)(50226002)(14444005)(47776003)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB5668; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be5748a9-4768-4661-7e7d-08d7771ab852
X-MS-TrafficTypeDiagnostic: BL0PR02MB5668:
X-Microsoft-Antispam-PRVS: <BL0PR02MB566880EFE2BE52B7B1205D59BC430@BL0PR02MB5668.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-Forefront-PRVS: 0239D46DB6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FnULots+XTxx3PXf1EzDWEnfhvvpxgSKFWgzVzs2m/Qyg3DJZg7FyfczWX8yVgYxSfWxBNPkJABeJGcRyOh+Ji+xpUskac5E2zvzpg0eLxnyuOcOmp4enIUMHI9ROzJkLEVOBf1x/ieMQduoNdRS97uuen/gk+70ALS+fUTVLuygD0su0gSy1JLM66RKaOJk+X5HcNWtbccZCynKxVVln2f/z/YRFbAdPO6BbwcQoF5txTitr50TcgVfzmksPeRNJxRUXojsiXsbjbLDKf/hufTN2dz0Q+xhv15toQfL2Nk4YnM7rIBwkC/PBeT8z4uIbVGG0tXtmagayuWG9HCEIAkoaSc9FKH9mYjl2AVfyi/+KRPOSDfspO8Am5e3P16SFj0bnCHdC3+Z/ezI8CAvnVKLzWecU1TgAcpQLsu4/1U7FqLz7YsuuCcvb68YQOT+
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2019 11:28:13.9091 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be5748a9-4768-4661-7e7d-08d7771ab852
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5668
X-Mailman-Approved-At: Tue, 03 Dec 2019 08:05:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eGb3qQO1DkQyUNu/iK4tJWdMbx/+1h+nhFfyGcgV6I=;
 b=KY8HbSWquYxRuVK2I9mY8BDiejCdTdy/d5J1lEag7ecCyzIPd01bRyntUUb0/bLjmh9JDu/nLp+7Z2wlcJr9/ZpMf7MyQWsrKf/kQevxBmZxktI6iveIRuaqvg8Fe6UVqzOszhq+70OS+LQvDVFos/VX8MAjZJG3AkXJC1zcHy0=
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
 devarsh.thakkar@xilinx.com, varunkum@xilinx.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGZ1bmN0aW9uIHRvIGRlcml2ZSBmbG9hdGluZyB2YWx1ZSBvZiB2ZXJ0aWNhbApyZWZyZXNo
IHJhdGUgZnJvbSBkcm0gbW9kZSB1c2luZyBwaXhlbCBjbG9jaywKaG9yaXpvbnRhbCB0b3RhbCBz
aXplIGFuZCB2ZXJ0aWNhbCB0b3RhbCBzaXplLgoKVXNlIHRoaXMgZnVuY3Rpb24gdG8gZmluZCBz
dWl0YWJsZSBtb2RlIGhhdmluZyB2cmVmcmVzaAp2YWx1ZSB3aGljaCBpcyBtYXRjaGluZyB3aXRo
IHVzZXIgcHJvdmlkZWQgdnJlZnJlc2ggdmFsdWUuCgpJZiB1c2VyIGRvZXNuJ3QgcHJvdmlkZSBh
bnkgdnJlZnJlc2ggdmFsdWUgaW4gYXJncyB0aGVuCnVwZGF0ZSB2ZXJ0aWNhbCByZWZyZXNoIHJh
dGUgdmFsdWUgaW4gcGlwZSBhcmdzIHVzaW5nIHRoaXMKZnVuY3Rpb24uCgpBbHNvIHVzZSB0aGlz
IGZ1bmN0aW9uIGZvciBwcmludGluZyBmbG9hdGluZyB2cmVmcmVzaCB3aGlsZQpkdW1waW5nIGFs
bCBhdmFpbGFibGUgbW9kZXMuCgpUaGlzIHdpbGwgZ2l2ZSBtb3JlIGFjY3VyYXRlIHBpY3R1cmUg
dG8gdXNlciBmb3IgYXZhaWxhYmxlIG1vZGVzCmRpZmZlcmVudGlhdGVkIGJ5IGZsb2F0aW5nIHZl
cnRpY2FsIHJlZnJlc2ggcmF0ZSBhbmQgaGVscCB1c2VyCnNlbGVjdCBtb3JlIGFwcHJvcHJpYXRl
IG1vZGUgdXNpbmcgc3VpdGFibGUgcmVmcmVzaCByYXRlIHZhbHVlLgoKVjM6IENoYW5nZSBuYW1l
IG9mIGZ1bmN0aW9uIHVzZWQgdG8gZGVyaXZlIHJlZnJlc2ggcmF0ZS4KVjI6IDEpIERvbid0IHVz
ZSBpbmxpbmUgZnVuY3Rpb24gZm9yIGRlcml2aW5nIHJlZnJlc2ggcmF0ZSBmcm9tIG1vZGUuCiAg
ICAyKSBJZiByZXF1ZXN0ZWQgbW9kZSBub3QgZm91bmQsIHByaW50IHJlZnJlc2ggcmF0ZSBvbmx5
CiAgICAgICBpZiB1c2VyIGhhZCBwcm92aWRlZCBpdCBpbiBhcmdzLgoKU2lnbmVkLW9mZi1ieTog
RGV2YXJzaCBUaGFra2FyIDxkZXZhcnNoLnRoYWtrYXJAeGlsaW54LmNvbT4KLS0tCiB0ZXN0cy9t
b2RldGVzdC9tb2RldGVzdC5jIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3Rlc3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMgYi90ZXN0cy9tb2RldGVz
dC9tb2RldGVzdC5jCmluZGV4IGI0ZWRmY2IuLjE5Y2UyMGYgMTAwNjQ0Ci0tLSBhL3Rlc3RzL21v
ZGV0ZXN0L21vZGV0ZXN0LmMKKysrIGIvdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYwpAQCAtMTMz
LDYgKzEzMywxMiBAQCBzdGF0aWMgaW5saW5lIGludDY0X3QgVTY0Mkk2NCh1aW50NjRfdCB2YWwp
CiAJcmV0dXJuIChpbnQ2NF90KSooKGludDY0X3QgKikmdmFsKTsKIH0KIAorc3RhdGljIGZsb2F0
IG1vZGVfdnJlZnJlc2goZHJtTW9kZU1vZGVJbmZvICptb2RlKQoreworCXJldHVybiAgbW9kZS0+
Y2xvY2sgKiAxMDAwLjAwCisJCQkvIChtb2RlLT5odG90YWwgKiBtb2RlLT52dG90YWwpOworfQor
CiAjZGVmaW5lIGJpdF9uYW1lX2ZuKHJlcykJCQkJCVwKIGNvbnN0IGNoYXIgKiByZXMjI19zdHIo
aW50IHR5cGUpIHsJCQkJXAogCXVuc2lnbmVkIGludCBpOwkJCQkJCVwKQEAgLTIxMCw5ICsyMTYs
OSBAQCBzdGF0aWMgdm9pZCBkdW1wX2VuY29kZXJzKHN0cnVjdCBkZXZpY2UgKmRldikKIAogc3Rh
dGljIHZvaWQgZHVtcF9tb2RlKGRybU1vZGVNb2RlSW5mbyAqbW9kZSkKIHsKLQlwcmludGYoIiAg
JXMgJWQgJWQgJWQgJWQgJWQgJWQgJWQgJWQgJWQgJWQiLAorCXByaW50ZigiICAlcyAlLjJmICVk
ICVkICVkICVkICVkICVkICVkICVkICVkIiwKIAkgICAgICAgbW9kZS0+bmFtZSwKLQkgICAgICAg
bW9kZS0+dnJlZnJlc2gsCisJICAgICAgIG1vZGVfdnJlZnJlc2gobW9kZSksCiAJICAgICAgIG1v
ZGUtPmhkaXNwbGF5LAogCSAgICAgICBtb2RlLT5oc3luY19zdGFydCwKIAkgICAgICAgbW9kZS0+
aHN5bmNfZW5kLApAQCAtODIzLDEyICs4MjksMTEgQEAgc3RydWN0IHBsYW5lX2FyZyB7CiAKIHN0
YXRpYyBkcm1Nb2RlTW9kZUluZm8gKgogY29ubmVjdG9yX2ZpbmRfbW9kZShzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHVpbnQzMl90IGNvbl9pZCwgY29uc3QgY2hhciAqbW9kZV9zdHIsCi0JY29uc3QgZmxv
YXQgdnJlZnJlc2gpCisJZmxvYXQgKnZyZWZyZXNoKQogewogCWRybU1vZGVDb25uZWN0b3IgKmNv
bm5lY3RvcjsKIAlkcm1Nb2RlTW9kZUluZm8gKm1vZGU7CiAJaW50IGk7Ci0JZmxvYXQgbW9kZV92
cmVmcmVzaDsKIAogCWNvbm5lY3RvciA9IGdldF9jb25uZWN0b3JfYnlfaWQoZGV2LCBjb25faWQp
OwogCWlmICghY29ubmVjdG9yIHx8ICFjb25uZWN0b3ItPmNvdW50X21vZGVzKQpAQCAtODM3LDE2
ICs4NDIsMTkgQEAgY29ubmVjdG9yX2ZpbmRfbW9kZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHVpbnQz
Ml90IGNvbl9pZCwgY29uc3QgY2hhciAqbW9kZV9zdHIsCiAJZm9yIChpID0gMDsgaSA8IGNvbm5l
Y3Rvci0+Y291bnRfbW9kZXM7IGkrKykgewogCQltb2RlID0gJmNvbm5lY3Rvci0+bW9kZXNbaV07
CiAJCWlmICghc3RyY21wKG1vZGUtPm5hbWUsIG1vZGVfc3RyKSkgewotCQkJLyogSWYgdGhlIHZl
cnRpY2FsIHJlZnJlc2ggZnJlcXVlbmN5IGlzIG5vdCBzcGVjaWZpZWQgdGhlbiByZXR1cm4gdGhl
Ci0JCQkgKiBmaXJzdCBtb2RlIHRoYXQgbWF0Y2ggd2l0aCB0aGUgbmFtZS4gRWxzZSwgcmV0dXJu
IHRoZSBtb2RlIHRoYXQgbWF0Y2gKLQkJCSAqIHRoZSBuYW1lIGFuZCB0aGUgc3BlY2lmaWVkIHZl
cnRpY2FsIHJlZnJlc2ggZnJlcXVlbmN5LgorCQkJLyogSWYgdGhlIHZlcnRpY2FsIHJlZnJlc2gg
ZnJlcXVlbmN5IGlzIG5vdCBzcGVjaWZpZWQKKwkJCSAqIHRoZW4gcmV0dXJuIHRoZSBmaXJzdCBt
b2RlIHRoYXQgbWF0Y2ggd2l0aCB0aGUgbmFtZQorCQkJICogYW5kIHVwZGF0ZSBjb3JyZXNwb25k
aW5nIHZyZWZyZXNoIGluIHBpcGVfYXJnLgorCQkJICogRWxzZSwgcmV0dXJuIHRoZSBtb2RlIHRo
YXQgbWF0Y2ggdGhlIG5hbWUgYW5kCisJCQkgKiB0aGUgc3BlY2lmaWVkIHZlcnRpY2FsIHJlZnJl
c2ggZnJlcXVlbmN5LgogCQkJICovCi0JCQltb2RlX3ZyZWZyZXNoID0gbW9kZS0+Y2xvY2sgKiAx
MDAwLjAwCi0JCQkJCS8gKG1vZGUtPmh0b3RhbCAqIG1vZGUtPnZ0b3RhbCk7Ci0JCQlpZiAodnJl
ZnJlc2ggPT0gMCkKKwkJCWlmICgqdnJlZnJlc2ggPT0gMCkgeworCQkJCSp2cmVmcmVzaCA9IG1v
ZGVfdnJlZnJlc2gobW9kZSk7CiAJCQkJcmV0dXJuIG1vZGU7Ci0JCQllbHNlIGlmIChmYWJzKG1v
ZGVfdnJlZnJlc2ggLSB2cmVmcmVzaCkgPCAwLjAwNSkKKwkJCX0gZWxzZSBpZiAoZmFicyhtb2Rl
X3ZyZWZyZXNoKG1vZGUpCisJCQkJICAgLSAqdnJlZnJlc2gpIDwgMC4wMDUpIHsKIAkJCQlyZXR1
cm4gbW9kZTsKKwkJCX0KIAkJfQogCX0KIApAQCAtOTA5LDkgKzkxNywxNSBAQCBzdGF0aWMgaW50
IHBpcGVfZmluZF9jcnRjX2FuZF9tb2RlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHBpcGVf
YXJnICpwaXBlKQogCiAJZm9yIChpID0gMDsgaSA8IChpbnQpcGlwZS0+bnVtX2NvbnM7IGkrKykg
ewogCQltb2RlID0gY29ubmVjdG9yX2ZpbmRfbW9kZShkZXYsIHBpcGUtPmNvbl9pZHNbaV0sCi0J
CQkJCSAgIHBpcGUtPm1vZGVfc3RyLCBwaXBlLT52cmVmcmVzaCk7CisJCQkJCSAgIHBpcGUtPm1v
ZGVfc3RyLCAmcGlwZS0+dnJlZnJlc2gpOwogCQlpZiAobW9kZSA9PSBOVUxMKSB7Ci0JCQlmcHJp
bnRmKHN0ZGVyciwKKwkJCWlmIChwaXBlLT52cmVmcmVzaCkKKwkJCQlmcHJpbnRmKHN0ZGVyciwK
KwkJCQkiZmFpbGVkIHRvIGZpbmQgbW9kZSAiCisJCQkJIlwiJXMtJS4yZkh6XCIgZm9yIGNvbm5l
Y3RvciAlc1xuIiwKKwkJCQlwaXBlLT5tb2RlX3N0ciwgcGlwZS0+dnJlZnJlc2gsIHBpcGUtPmNv
bnNbaV0pOworCQkJZWxzZQorCQkJCWZwcmludGYoc3RkZXJyLAogCQkJCSJmYWlsZWQgdG8gZmlu
ZCBtb2RlIFwiJXNcIiBmb3IgY29ubmVjdG9yICVzXG4iLAogCQkJCXBpcGUtPm1vZGVfc3RyLCBw
aXBlLT5jb25zW2ldKTsKIAkJCXJldHVybiAtRUlOVkFMOwotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
