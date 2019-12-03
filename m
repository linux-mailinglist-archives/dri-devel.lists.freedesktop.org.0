Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCBD112419
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 09:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6BF6F44C;
	Wed,  4 Dec 2019 08:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750058.outbound.protection.outlook.com [40.107.75.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4434589D83
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 14:38:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIY0L2Psx1ekdrqd2+RaUBTv/5fg53TjuAcxs5NbisMDyvLjb0pMamXCHiJ8RKajfmwZ+37Wl9I2xS6fyqBtiA+96Upte+HAWeH3JJiwp67rUdHf8d9beTgv5trpGGRSQdamyaBTsolIYZKwtQhyW0akjAdeijh7QsCbHAEqqpuJxY/5f/TftQ+aAD9EWSAOQ2eRdzjmNSRbNJiBdDEJ3Ihegpon2z+QYl6JM1vuzetttUHEJtJ62gYz2XL/Yk8pMnK9vcqIYV1+9ujsiEYyWiYSrJrKkBFY/IhT+3K5gPINADAyFTeKeNaq8A7niWTwepYPbpYk1FUhDCbclVaiQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZR6WShsqO1HrSKB29dfX8BwtbJ9FSPXFUMnkWXDpFQ=;
 b=a+B2eZsP27fyySgNseaDhWhKsK3KmiSQHDDPv+KBLx4ExG+PHJilyFe4rwGtgQxl5hztPtC8XyU5E4lbyHk2/FpGwIxhQ3dQhp+K8ZRNEN9Jk23FwzNEw5Ersgf+H7lq5lFv9eAVPiDqtC4NMWsCBHh18zkpwEut2gyPAbdxlPJv7b8FvJugUruF34mpyokn8/bScahGvlHoe8zbnehMdYln/btM+6OgIUxAKVNuEnVL99lzY6bpfjFXmiJE895FLnTZNH/ieUTfcew1B5wHkr+eXj9hPps/V9NWXdOnexdjymQJ6W7gQz9ompZA0I6MQLraSeG9IpUmklXU05TbkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=baylibre.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
Received: from BL0PR02CA0052.namprd02.prod.outlook.com (2603:10b6:207:3d::29)
 by DM6PR02MB6155.namprd02.prod.outlook.com (2603:10b6:5:1fb::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18; Tue, 3 Dec
 2019 14:38:02 +0000
Received: from BL2NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::200) by BL0PR02CA0052.outlook.office365.com
 (2603:10b6:207:3d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.30 via Frontend
 Transport; Tue, 3 Dec 2019 14:38:02 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT041.mail.protection.outlook.com (10.152.77.122) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2474.17
 via Frontend Transport; Tue, 3 Dec 2019 14:38:02 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1ic9JR-0007Oi-G6; Tue, 03 Dec 2019 06:38:01 -0800
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1ic9JM-0001U8-Bu; Tue, 03 Dec 2019 06:37:56 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xB3Ebn2X005810; 
 Tue, 3 Dec 2019 06:37:50 -0800
Received: from [172.19.2.102] (helo=xsjanandash50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1ic9JF-0001Sk-N2; Tue, 03 Dec 2019 06:37:49 -0800
From: Devarsh Thakkar <devarsh.thakkar@xilinx.com>
To: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 narmstrong@baylibre.com
Subject: [PATCH libdrm v4] modetest: Use floating vrefresh while dumping mode
Date: Tue,  3 Dec 2019 06:37:36 -0800
Message-Id: <1575383856-29959-1-git-send-email-devarsh.thakkar@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(199004)(189003)(2616005)(50466002)(26005)(186003)(81156014)(305945005)(81166006)(478600001)(6666004)(426003)(356004)(50226002)(44832011)(316002)(48376002)(14444005)(51416003)(36386004)(336012)(8676002)(16586007)(106002)(9786002)(7696005)(8936002)(5660300002)(36756003)(107886003)(4326008)(2906002)(70586007)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB6155; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ea7f8de-3fb3-4a73-d1d1-08d777fe669c
X-MS-TrafficTypeDiagnostic: DM6PR02MB6155:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6155C9C3C348F07138FF81C9BC420@DM6PR02MB6155.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-Forefront-PRVS: 02408926C4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j7MhbxJB5ypbzJfLlzgFiJwxozuQoLP/4neEKF+EYI+vxrT+986cZB6YgCMqzS4V5ytUlZJ2MVHX+AJwRALUdfy5jlL/4d+WNLtF1bwTZKHSYQhFn9xaUzVs1NE1zumVSi/RKxaIEjy45p09gXnGyfnEbjxEXat5zKgiy/gxFgcYAWdcPYaZSaUOJkvT0xJc/vuplulghg8gGUGA2ddTMCF7bGxypfDIIDzjxXTRAP/CIUloDMbp647u2fdYUz/9e5EsrdZ9f9g2x7UVATW+lctzfetLOfzkgrgV5tn2VjaWjZ4Ahg/crGIY0WCXGzvW4cfo0duA0SV0gEW8ZiL8PknFeK53Rl8+AWaM7Xacq6aLy7g91eN2eKN9P6s26N03mvaDNgc2n/sZ7HNLfnLLR8yA40C3ySHrhzNywfAqZ0CWoLsEDMzOTIV05vBHUkhK
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 14:38:02.0744 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea7f8de-3fb3-4a73-d1d1-08d777fe669c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6155
X-Mailman-Approved-At: Wed, 04 Dec 2019 08:01:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZR6WShsqO1HrSKB29dfX8BwtbJ9FSPXFUMnkWXDpFQ=;
 b=WghV7+u0peJXAtjAPn4P6M2nh7NyRV8KqJs7hdU8bknKdMw/OdOB8O/eMmE+Wfrb4vBnUyUNAxJ6F6JPu1UM5GHE231q6YUOU9pGoMoQ3DsJaDaN8/NjntvXiwV5V2wcR9+xoKtlf1xew3zKnAoy6VLFGfI+jRUJVUcQMzVwWxc=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is
 149.199.60.83)
 smtp.mailfrom=xilinx.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=bestguesspass action=none
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
 devarsh.thakkar@xilinx.com, varunkum@xilinx.com, rvisaval@xilinx.com
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
IG1vZGUgdXNpbmcgc3VpdGFibGUgcmVmcmVzaCByYXRlIHZhbHVlLgoKVjQ6CjEpIFdoaWxlIHNl
dHRpbmcgbW9kZSwgcHJpbnQgbW9kZSBuYW1lIGFuZCB2cmVmcmVzaCB1c2luZyBzdHJ1Y3QKICAg
ZHJtTW9kZU1vZGVJbmZvIGluc3RlYWQgb2Ygc3RydWN0IHBpcGVfYXJncy4KMikgUmV2ZXJ0IGJh
Y2sgdG8gdXNpbmcgYSBmbG9hdCB2YWx1ZSBpbnN0ZWFkIG9mIGZsb2F0ICoKICAgZm9yIHZyZWZy
ZXNoIGFyZyBpbiBjb25uZWN0b3JfZmluZF9tb2RlKCkuCgpWMzoKMSkgQ2hhbmdlIG5hbWUgb2Yg
ZnVuY3Rpb24gdXNlZCB0byBkZXJpdmUgcmVmcmVzaCByYXRlLgoKVjI6CjEpIERvbid0IHVzZSBp
bmxpbmUgZnVuY3Rpb24gZm9yIGRlcml2aW5nIHJlZnJlc2ggcmF0ZSBmcm9tIG1vZGUuCjIpIElm
IHJlcXVlc3RlZCBtb2RlIG5vdCBmb3VuZCwgcHJpbnQgcmVmcmVzaCByYXRlIG9ubHkKICAgaWYg
dXNlciBoYWQgcHJvdmlkZWQgaXQgaW4gYXJncy4KClNpZ25lZC1vZmYtYnk6IERldmFyc2ggVGhh
a2thciA8ZGV2YXJzaC50aGFra2FyQHhpbGlueC5jb20+ClJldmlld2VkLWJ5OiBOZWlsIEFybXN0
cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Ci0tLQogdGVzdHMvbW9kZXRlc3QvbW9kZXRl
c3QuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVz
dHMvbW9kZXRlc3QvbW9kZXRlc3QuYyBiL3Rlc3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMKaW5kZXgg
YjRlZGZjYi4uZTk5OGU4ZSAxMDA2NDQKLS0tIGEvdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYwor
KysgYi90ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jCkBAIC0xMzMsNiArMTMzLDEyIEBAIHN0YXRp
YyBpbmxpbmUgaW50NjRfdCBVNjQySTY0KHVpbnQ2NF90IHZhbCkKIAlyZXR1cm4gKGludDY0X3Qp
KigoaW50NjRfdCAqKSZ2YWwpOwogfQogCitzdGF0aWMgZmxvYXQgbW9kZV92cmVmcmVzaChkcm1N
b2RlTW9kZUluZm8gKm1vZGUpCit7CisJcmV0dXJuICBtb2RlLT5jbG9jayAqIDEwMDAuMDAKKwkJ
CS8gKG1vZGUtPmh0b3RhbCAqIG1vZGUtPnZ0b3RhbCk7Cit9CisKICNkZWZpbmUgYml0X25hbWVf
Zm4ocmVzKQkJCQkJXAogY29uc3QgY2hhciAqIHJlcyMjX3N0cihpbnQgdHlwZSkgewkJCQlcCiAJ
dW5zaWduZWQgaW50IGk7CQkJCQkJXApAQCAtMjEwLDkgKzIxNiw5IEBAIHN0YXRpYyB2b2lkIGR1
bXBfZW5jb2RlcnMoc3RydWN0IGRldmljZSAqZGV2KQogCiBzdGF0aWMgdm9pZCBkdW1wX21vZGUo
ZHJtTW9kZU1vZGVJbmZvICptb2RlKQogewotCXByaW50ZigiICAlcyAlZCAlZCAlZCAlZCAlZCAl
ZCAlZCAlZCAlZCAlZCIsCisJcHJpbnRmKCIgICVzICUuMmYgJWQgJWQgJWQgJWQgJWQgJWQgJWQg
JWQgJWQiLAogCSAgICAgICBtb2RlLT5uYW1lLAotCSAgICAgICBtb2RlLT52cmVmcmVzaCwKKwkg
ICAgICAgbW9kZV92cmVmcmVzaChtb2RlKSwKIAkgICAgICAgbW9kZS0+aGRpc3BsYXksCiAJICAg
ICAgIG1vZGUtPmhzeW5jX3N0YXJ0LAogCSAgICAgICBtb2RlLT5oc3luY19lbmQsCkBAIC04Mjgs
NyArODM0LDYgQEAgY29ubmVjdG9yX2ZpbmRfbW9kZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHVpbnQz
Ml90IGNvbl9pZCwgY29uc3QgY2hhciAqbW9kZV9zdHIsCiAJZHJtTW9kZUNvbm5lY3RvciAqY29u
bmVjdG9yOwogCWRybU1vZGVNb2RlSW5mbyAqbW9kZTsKIAlpbnQgaTsKLQlmbG9hdCBtb2RlX3Zy
ZWZyZXNoOwogCiAJY29ubmVjdG9yID0gZ2V0X2Nvbm5lY3Rvcl9ieV9pZChkZXYsIGNvbl9pZCk7
CiAJaWYgKCFjb25uZWN0b3IgfHwgIWNvbm5lY3Rvci0+Y291bnRfbW9kZXMpCkBAIC04MzcsMTUg
Kzg0MiwxNCBAQCBjb25uZWN0b3JfZmluZF9tb2RlKHN0cnVjdCBkZXZpY2UgKmRldiwgdWludDMy
X3QgY29uX2lkLCBjb25zdCBjaGFyICptb2RlX3N0ciwKIAlmb3IgKGkgPSAwOyBpIDwgY29ubmVj
dG9yLT5jb3VudF9tb2RlczsgaSsrKSB7CiAJCW1vZGUgPSAmY29ubmVjdG9yLT5tb2Rlc1tpXTsK
IAkJaWYgKCFzdHJjbXAobW9kZS0+bmFtZSwgbW9kZV9zdHIpKSB7Ci0JCQkvKiBJZiB0aGUgdmVy
dGljYWwgcmVmcmVzaCBmcmVxdWVuY3kgaXMgbm90IHNwZWNpZmllZCB0aGVuIHJldHVybiB0aGUK
LQkJCSAqIGZpcnN0IG1vZGUgdGhhdCBtYXRjaCB3aXRoIHRoZSBuYW1lLiBFbHNlLCByZXR1cm4g
dGhlIG1vZGUgdGhhdCBtYXRjaAotCQkJICogdGhlIG5hbWUgYW5kIHRoZSBzcGVjaWZpZWQgdmVy
dGljYWwgcmVmcmVzaCBmcmVxdWVuY3kuCisJCQkvKiBJZiB0aGUgdmVydGljYWwgcmVmcmVzaCBm
cmVxdWVuY3kgaXMgbm90IHNwZWNpZmllZAorCQkJICogdGhlbiByZXR1cm4gdGhlIGZpcnN0IG1v
ZGUgdGhhdCBtYXRjaCB3aXRoIHRoZSBuYW1lLgorCQkJICogRWxzZSwgcmV0dXJuIHRoZSBtb2Rl
IHRoYXQgbWF0Y2ggdGhlIG5hbWUgYW5kCisJCQkgKiB0aGUgc3BlY2lmaWVkIHZlcnRpY2FsIHJl
ZnJlc2ggZnJlcXVlbmN5LgogCQkJICovCi0JCQltb2RlX3ZyZWZyZXNoID0gbW9kZS0+Y2xvY2sg
KiAxMDAwLjAwCi0JCQkJCS8gKG1vZGUtPmh0b3RhbCAqIG1vZGUtPnZ0b3RhbCk7CiAJCQlpZiAo
dnJlZnJlc2ggPT0gMCkKIAkJCQlyZXR1cm4gbW9kZTsKLQkJCWVsc2UgaWYgKGZhYnMobW9kZV92
cmVmcmVzaCAtIHZyZWZyZXNoKSA8IDAuMDA1KQorCQkJZWxzZSBpZiAoZmFicyhtb2RlX3ZyZWZy
ZXNoKG1vZGUpIC0gdnJlZnJlc2gpIDwgMC4wMDUpCiAJCQkJcmV0dXJuIG1vZGU7CiAJCX0KIAl9
CkBAIC05MTEsNyArOTE1LDEzIEBAIHN0YXRpYyBpbnQgcGlwZV9maW5kX2NydGNfYW5kX21vZGUo
c3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcGlwZV9hcmcgKnBpcGUpCiAJCW1vZGUgPSBjb25u
ZWN0b3JfZmluZF9tb2RlKGRldiwgcGlwZS0+Y29uX2lkc1tpXSwKIAkJCQkJICAgcGlwZS0+bW9k
ZV9zdHIsIHBpcGUtPnZyZWZyZXNoKTsKIAkJaWYgKG1vZGUgPT0gTlVMTCkgewotCQkJZnByaW50
ZihzdGRlcnIsCisJCQlpZiAocGlwZS0+dnJlZnJlc2gpCisJCQkJZnByaW50ZihzdGRlcnIsCisJ
CQkJImZhaWxlZCB0byBmaW5kIG1vZGUgIgorCQkJCSJcIiVzLSUuMmZIelwiIGZvciBjb25uZWN0
b3IgJXNcbiIsCisJCQkJcGlwZS0+bW9kZV9zdHIsIHBpcGUtPnZyZWZyZXNoLCBwaXBlLT5jb25z
W2ldKTsKKwkJCWVsc2UKKwkJCQlmcHJpbnRmKHN0ZGVyciwKIAkJCQkiZmFpbGVkIHRvIGZpbmQg
bW9kZSBcIiVzXCIgZm9yIGNvbm5lY3RvciAlc1xuIiwKIAkJCQlwaXBlLT5tb2RlX3N0ciwgcGlw
ZS0+Y29uc1tpXSk7CiAJCQlyZXR1cm4gLUVJTlZBTDsKQEAgLTEzOTgsNyArMTQwOCw3IEBAIHN0
YXRpYyB2b2lkIGF0b21pY19zZXRfbW9kZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBwaXBl
X2FyZyAqcGlwZXMsIHVuc2lnbmVkCiAJCQljb250aW51ZTsKIAogCQlwcmludGYoInNldHRpbmcg
bW9kZSAlcy0lLjJmSHogb24gY29ubmVjdG9ycyAiLAotCQkgICAgICAgcGlwZS0+bW9kZV9zdHIs
IHBpcGUtPnZyZWZyZXNoKTsKKwkJICAgICAgIHBpcGUtPm1vZGUtPm5hbWUsIG1vZGVfdnJlZnJl
c2gocGlwZS0+bW9kZSkpOwogCQlmb3IgKGogPSAwOyBqIDwgcGlwZS0+bnVtX2NvbnM7ICsraikg
ewogCQkJcHJpbnRmKCIlcywgIiwgcGlwZS0+Y29uc1tqXSk7CiAJCQlhZGRfcHJvcGVydHkoZGV2
LCBwaXBlLT5jb25faWRzW2pdLCAiQ1JUQ19JRCIsIHBpcGUtPmNydGMtPmNydGMtPmNydGNfaWQp
OwpAQCAtMTQ4MSw3ICsxNDkxLDggQEAgc3RhdGljIHZvaWQgc2V0X21vZGUoc3RydWN0IGRldmlj
ZSAqZGV2LCBzdHJ1Y3QgcGlwZV9hcmcgKnBpcGVzLCB1bnNpZ25lZCBpbnQgY28KIAkJCWNvbnRp
bnVlOwogCiAJCXByaW50Zigic2V0dGluZyBtb2RlICVzLSUuMmZIekAlcyBvbiBjb25uZWN0b3Jz
ICIsCi0JCSAgICAgICBwaXBlLT5tb2RlX3N0ciwgcGlwZS0+dnJlZnJlc2gsIHBpcGUtPmZvcm1h
dF9zdHIpOworCQkgICAgICAgcGlwZS0+bW9kZS0+bmFtZSwgbW9kZV92cmVmcmVzaChwaXBlLT5t
b2RlKSwKKwkJICAgICAgIHBpcGUtPmZvcm1hdF9zdHIpOwogCQlmb3IgKGogPSAwOyBqIDwgcGlw
ZS0+bnVtX2NvbnM7ICsraikKIAkJCXByaW50ZigiJXMsICIsIHBpcGUtPmNvbnNbal0pOwogCQlw
cmludGYoImNydGMgJWRcbiIsIHBpcGUtPmNydGMtPmNydGMtPmNydGNfaWQpOwotLSAKMi43LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
