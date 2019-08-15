Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F9A8F604
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 22:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64B56EA7C;
	Thu, 15 Aug 2019 20:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AFF6EA79;
 Thu, 15 Aug 2019 20:52:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICKqRPK2x8DYlHugvqAGNhwnJ7sHDI4ngiqabCtvft12t6TyPhDUpn6zSLbKvkPE3ZdjRuHBBvfClP9X2kT6P/TjfAMlxwZ+Ojvpo2kR2k+GuFaMbuX+/pzM6OxC4PKRafKexsy4kv4Dx/czeCrNa5706I9ejBCorlJquJ5t5n7OsxoYGIXGVbLsp0jFZt+E9GNXEbDQLMQJZzrJhrYa9ACqn8aGd5dHsZU0hkB2HlFN93bN5fyWAxuOUyw0eGLai9lKj/6uBV6RKrU/HHO7SjlteILM5F/bLg26IhDj0QpazLaBAMKgpAdlECvnRpBx/9sRYaw5JNAeyEbyb2H69g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwlSdlmppSFwpZoQXUMtkLZgJLBSkUNbt3B+WLM0JFg=;
 b=YilvcRFPmCq8444pAfuYEy5GpZQj9XiIltG6MLrmQX2TmH0NbOIOWbCelFqIqaQ1DBHrJnDeI+9lXVTxmRVN+DTMYR7MC8uezW7k4YMfkzYcfD4enYooncvjrJBNziJxQvXK3G4htC98Fx09FeOC1nWEr1ggEdaqR7bCziKRrhe8vUlHkl4zzAAy7mLSau8iKLrpiWOd4RSGC4zxkP6s0dq9+nS23MASpnZDXLoUW5OnltNZwhnxj8hNWn7dZApu4woDzCZvP75fqQZhxkmmBYDjViR03YljL1AMXLhrfglRWuXRYhVQ0zGbNT7N13baq3zyff89FB6uZ7ZIgCfsDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1374.namprd12.prod.outlook.com (10.169.206.9) by
 MWHPR12MB1887.namprd12.prod.outlook.com (10.175.54.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Thu, 15 Aug 2019 20:52:57 +0000
Received: from MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::9c57:4338:ff8f:2cb8]) by MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::9c57:4338:ff8f:2cb8%12]) with mapi id 15.20.2157.022; Thu, 15 Aug
 2019 20:52:57 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "jglisse@redhat.com" <jglisse@redhat.com>, "alex.deucher@amd.com"
 <alex.deucher@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "jgg@mellanox.com" <jgg@mellanox.com>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] mm/hmm: hmm_range_fault handle pages swapped out
Thread-Topic: [PATCH] mm/hmm: hmm_range_fault handle pages swapped out
Thread-Index: AQHVU6tqPJgEXxIoEkOKYOi6xfC1FQ==
Date: Thu, 15 Aug 2019 20:52:56 +0000
Message-ID: <20190815205227.7949-1-Philip.Yang@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::18) To MWHPR12MB1374.namprd12.prod.outlook.com
 (2603:10b6:300:12::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f8d6143-b673-4cde-427b-08d721c28ce4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1887; 
x-ms-traffictypediagnostic: MWHPR12MB1887:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB18878402E5D80A9F338B26F8E6AC0@MWHPR12MB1887.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(199004)(189003)(6506007)(66446008)(14454004)(66556008)(8676002)(64756008)(99286004)(6436002)(386003)(66946007)(66476007)(81166006)(186003)(305945005)(486006)(102836004)(71190400001)(4326008)(1076003)(52116002)(6486002)(6116002)(81156014)(71200400001)(8936002)(2501003)(476003)(5660300002)(14444005)(110136005)(6512007)(478600001)(2201001)(7736002)(53936002)(316002)(25786009)(86362001)(2616005)(256004)(2906002)(50226002)(4744005)(3846002)(36756003)(66066001)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1887;
 H:MWHPR12MB1374.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bfG34piVXhyEJ4jeZ0/4bH5U0ZzhSRoDIX/JsNXT+UmGLpMQgRZT4exaEKP7oYsRo5785XOKqn3GikScvc4H72/zTT3stPNRpbAgi9pghm4cN9l8x30iyFyA28vge//ATrm+0thGna2I0RoUKTcQy5MVFFkrBtTc/Vf3xfYZErhhw7LJ7Yj1x++tB3szk9ZB/0QncxJVi8nrJFYzhgWz8uwk8OfjkcSb9z1AeLszBz64gurNeYs8L8WsXDN3MdgYnvvaNsW4bDUhULsw1h0u63xHsAMwmfYCG3n7qp8wd3EUUCWTGY0C2HCJ53IB375BCoSVoiw36br4HedkeW6199I0o7cblJbrcNALRRhgnoGKuaNXc2d4J/qysBgIyoXgsA/u4eBultV/vYeJB4332SwWBH3gBoVEJVCYcsaDVDI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8d6143-b673-4cde-427b-08d721c28ce4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 20:52:56.9914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 46NYgjV4tUtv0I0bZh/M0nJmUqIDdw8QWunUXRRQV+OZRRkuLgh8Cf7HkQ/f/FeA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1887
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwlSdlmppSFwpZoQXUMtkLZgJLBSkUNbt3B+WLM0JFg=;
 b=Os2CopjL/1EgWsIQtsXQyL4NPjvQyBgGoZBGKyuRHQfO6s6vSRT0vpEECFev1zHy2NQy8pafq1avqfDNa8eD1baL6D1WQDw+r10HFx3ByZ+ba7NOTYNUNi2CTd3p2rjvN9JdWvA2Ji0kcARQ8/qsHqo4tSZpmZQAitUIHUiOkbM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aG1tX3JhbmdlX2ZhdWx0IG1heSByZXR1cm4gTlVMTCBwYWdlcyBiZWNhdXNlIHNvbWUgb2YgcGZu
cyBhcmUgZXF1YWwgdG8KSE1NX1BGTl9OT05FLiBUaGlzIGhhcHBlbnMgcmFuZG9tbHkgdW5kZXIg
bWVtb3J5IHByZXNzdXJlLiBUaGUgcmVhc29uIGlzCmZvciBzd2FwcGVkIG91dCBwYWdlIHB0ZSBw
YXRoLCBobW1fdm1hX2hhbmRsZV9wdGUgZG9lc24ndCB1cGRhdGUgZmF1bHQKdmFyaWFibGUgZnJv
bSBjcHVfZmxhZ3MsIHNvIGl0IGZhaWxlZCB0byBjYWxsIGhtbV92YW1fZG9fZmF1bHQgdG8gc3dh
cAp0aGUgcGFnZSBpbi4KClRoZSBmaXggaXMgdG8gY2FsbCBobW1fcHRlX25lZWRfZmF1bHQgdG8g
dXBkYXRlIGZhdWx0IHZhcmlhYmxlLgoKQ2hhbmdlLUlkOiBJMmU4NjExNDg1NTYzZDExZDkzODg4
MWMxOGI3OTM1ZmExZTdjOTFlZQpTaWduZWQtb2ZmLWJ5OiBQaGlsaXAgWWFuZyA8UGhpbGlwLllh
bmdAYW1kLmNvbT4KLS0tCiBtbS9obW0uYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRleCA5ZjIyNTYy
ZTJjNDMuLjdjYTRmYjM5ZDNkOCAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1tLmMK
QEAgLTU0NCw2ICs1NDQsOSBAQCBzdGF0aWMgaW50IGhtbV92bWFfaGFuZGxlX3B0ZShzdHJ1Y3Qg
bW1fd2FsayAqd2FsaywgdW5zaWduZWQgbG9uZyBhZGRyLAogCQlzd3BfZW50cnlfdCBlbnRyeSA9
IHB0ZV90b19zd3BfZW50cnkocHRlKTsKIAogCQlpZiAoIW5vbl9zd2FwX2VudHJ5KGVudHJ5KSkg
eworCQkJY3B1X2ZsYWdzID0gcHRlX3RvX2htbV9wZm5fZmxhZ3MocmFuZ2UsIHB0ZSk7CisJCQlo
bW1fcHRlX25lZWRfZmF1bHQoaG1tX3ZtYV93YWxrLCBvcmlnX3BmbiwgY3B1X2ZsYWdzLAorCQkJ
CQkgICAmZmF1bHQsICZ3cml0ZV9mYXVsdCk7CiAJCQlpZiAoZmF1bHQgfHwgd3JpdGVfZmF1bHQp
CiAJCQkJZ290byBmYXVsdDsKIAkJCXJldHVybiAwOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
