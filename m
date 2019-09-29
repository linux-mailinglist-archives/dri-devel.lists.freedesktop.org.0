Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 822A7C13D1
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2019 09:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6066E0EB;
	Sun, 29 Sep 2019 07:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680048.outbound.protection.outlook.com [40.107.68.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C7C6E0DE;
 Sun, 29 Sep 2019 07:40:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNdQlHzgX3IIjyxiCeTZaSj6QCnvjzzfnbbFf8y8GG4sINDNboSXD55sdiqSMbgU3cTV6kc9G6I8AbrigiUzgu2y6yh6felrRW1QVlsRqydu11v8qRz9P5Xgv9lyMEL6gXNT2h2vdUP3SJ3QntTZS8OKWBa1gvAkC22n//5zexujOKbMXJjYbUGJKXVfr9rUKWJY3Rq7U5B21T21SMRXQe9Wdvr0OX4IZUxN8qQWzBRmovwbO9IsFLhCvlwltbT75ZDngMMTGfHG/tJLC14OgHzMawVCZ7McmTDEt81cybJH75MN60X5dbPc0DBUJDfu3sp4SVraul2Rx3FEPc5sxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gv4kV6yZSp0z/Lk16KSEhQLXgUhthRgEUK38z4YCzJ0=;
 b=TnRvFd8wFIbc/535+/PhQVQHh9gzJR7TrfOMmOYwm0ya+F6IHbE14jLxnMREKRaAG04YE+S0lvRrsK1BNnY4zugB95GN8fb1HDlbUfktepZZIiHJug3bhJ93I43BNSm4kCSdvOFbnj1hqxxlzlncmL6bIYbbx68Flnwd70KlYwENbntB/CSXMlqdmzmg5Uyn88m/ozK1HwDRcV1eGPqSaX/eeXSZqtrp54TeVZB/ap6JhlgSQAgbSVLA2CMciWVZhmQZHzY+7L6MBHh/9fTHSOl6BaIjXA1Oqh7SknhfLeoDw0pYHRDqZfnCrRnMM+jM9A7o1cyrgvFfT38Re7CLhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3583.namprd12.prod.outlook.com (20.178.241.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Sun, 29 Sep 2019 07:40:04 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.017; Sun, 29 Sep 2019
 07:40:03 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH v4 10/11] drm/amdgpu: job is secure iff CS is secure (v5)
Thread-Topic: [PATCH v4 10/11] drm/amdgpu: job is secure iff CS is secure (v5)
Thread-Index: AQHVdpkb/kM7cMOqjkOEMc19r/BP2A==
Date: Sun, 29 Sep 2019 07:40:03 +0000
Message-ID: <1569742788-22429-1-git-send-email-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK0PR03CA0002.apcprd03.prod.outlook.com
 (2603:1096:203:2e::14) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c47eac87-62a9-4b0d-19db-08d744b03da1
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3583:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB35834A972389B47E720FEA42EC830@MN2PR12MB3583.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 017589626D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(189003)(199004)(81166006)(2906002)(6486002)(26005)(3846002)(6636002)(6116002)(25786009)(50226002)(102836004)(6436002)(8676002)(14454004)(81156014)(4326008)(186003)(71200400001)(71190400001)(305945005)(2501003)(66446008)(256004)(316002)(66476007)(478600001)(66066001)(476003)(5660300002)(99286004)(2616005)(8936002)(450100002)(110136005)(486006)(66556008)(6506007)(386003)(66946007)(86362001)(54906003)(7736002)(52116002)(64756008)(36756003)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3583;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AQ8J/RsrlRKzC8E8tdxjTfiyG2+ZnxFXClKYrcTqjwoiY9KvUXH/uXkvLj95c0ARJyjI2WXrN7YWIuxSmNuuRS8Eur2D5EX/YzscI+Cz/i21+a9IOtC/nCzqYp3RpafJxIC2U92eIFJg96tJdgW1+vyQLHQ1RfiIAR5n7LisjR/qB65s/5lQqeEoOE0zXOgM/vr9OGN+a+86yAmbPzhVdWIVUln+fn/Ucx2Kb/ftdzG0aaup2Y50aRGjJrwvyiaj6PhPoUjrKw5E1ip8kqRyvtcP8O7jtBA9wDrRUWrIhg5GSzPYQ74YHyeCThu0wShyfcXIcbhkWUv7Zh4KU6lJb2pWUzRwUj4WSRI7slj/0oV7iErdkP/GPCXiNv0myMPhUN5sSm3jqfF6IgTFSv2uNCLwrT7NihgVJmo4x5O1Ekw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c47eac87-62a9-4b0d-19db-08d744b03da1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2019 07:40:03.6604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DrgEJ6lgZTk15/10oYmpwda24iKOwWvAEM1jHgbGvNa0lYRJ90qmYIQ6tfU0W2r5rRQoxqI/hu/kG5XZ0TvQvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3583
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gv4kV6yZSp0z/Lk16KSEhQLXgUhthRgEUK38z4YCzJ0=;
 b=bFeeqMgme9/bpQehKXOX3Tt3sQ9FwYNJANdYQOeNMOgelzG2tzhBjHIutkVbkucRTCXgi1EUxjsySj9VweF7lX5e1ESdgRv9Me1Ry6jpB0MTkcDq+yhkahLkSrVZpHKdqWR+AAcLsxeqpDFYfC1imMxKCvhKmWhkWOTuVmHWh1M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu,
 Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFyayBhIGpvYiBhcyBzZWN1cmUsIGlmIGFuZCBvbmx5IGlmIHRoZSBjb21tYW5kCnN1Ym1pc3Np
b24gZmxhZyBoYXMgdGhlIHNlY3VyZSBmbGFnIHNldC4KCnYyOiBmaXggdGhlIG51bGwgam9iIHBv
aW50ZXIgd2hpbGUgaW4gdm1pZCAwCnN1Ym1pc3Npb24uCnYzOiBDb250ZXh0IC0tPiBDb21tYW5k
IHN1Ym1pc3Npb24uCnY0OiBmaWxsaW5nIGNzIHBhcnNlciB3aXRoIGNzLT5pbi5mbGFncwp2NTog
bW92ZSB0aGUgam9iIHNlY3VyZSBmbGFnIHNldHRpbmcgb3V0IG9mIGFtZGdwdV9jc19zdWJtaXQo
KQoKU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KQ28tZGV2ZWxv
cGVkLWJ5OiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9jcy5jICB8IDIgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9pYi5jICB8IDQgKystLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2pvYi5oIHwgMiArKwogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Nz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwppbmRleCA0OWI3Njdi
Li5jMThhMTUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Y3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwpAQCAtMjMx
LDYgKzIzMSw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3BhcnNlcl9pbml0KHN0cnVjdCBhbWRn
cHVfY3NfcGFyc2VyICpwLCB1bmlvbiBkcm1fYW1kZ3B1X2NzCiAJaWYgKHJldCkKIAkJZ290byBm
cmVlX2FsbF9rZGF0YTsKIAorCXAtPmpvYi0+c2VjdXJlID0gY3MtPmluLmZsYWdzICYgQU1ER1BV
X0NTX0ZMQUdTX1NFQ1VSRTsKKwogCWlmIChwLT5jdHgtPnZyYW1fbG9zdF9jb3VudGVyICE9IHAt
PmpvYi0+dnJhbV9sb3N0X2NvdW50ZXIpIHsKIAkJcmV0ID0gLUVDQU5DRUxFRDsKIAkJZ290byBm
cmVlX2FsbF9rZGF0YTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9pYi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMKaW5kZXgg
OWE2ZGJmMy4uNmUwZjk3YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2liLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMK
QEAgLTIxMyw3ICsyMTMsNyBAQCBpbnQgYW1kZ3B1X2liX3NjaGVkdWxlKHN0cnVjdCBhbWRncHVf
cmluZyAqcmluZywgdW5zaWduZWQgbnVtX2licywKIAlpZiAoam9iICYmIHJpbmctPmZ1bmNzLT5l
bWl0X2NudHhjbnRsKSB7CiAJCXN0YXR1cyB8PSBqb2ItPnByZWFtYmxlX3N0YXR1czsKIAkJc3Rh
dHVzIHw9IGpvYi0+cHJlZW1wdGlvbl9zdGF0dXM7Ci0JCWFtZGdwdV9yaW5nX2VtaXRfY250eGNu
dGwocmluZywgc3RhdHVzLCBmYWxzZSk7CisJCWFtZGdwdV9yaW5nX2VtaXRfY250eGNudGwocmlu
Zywgc3RhdHVzLCBqb2ItPnNlY3VyZSk7CiAJfQogCiAJZm9yIChpID0gMDsgaSA8IG51bV9pYnM7
ICsraSkgewpAQCAtMjMyLDcgKzIzMiw3IEBAIGludCBhbWRncHVfaWJfc2NoZWR1bGUoc3RydWN0
IGFtZGdwdV9yaW5nICpyaW5nLCB1bnNpZ25lZCBudW1faWJzLAogCX0KIAogCWlmIChyaW5nLT5m
dW5jcy0+ZW1pdF90bXopCi0JCWFtZGdwdV9yaW5nX2VtaXRfdG16KHJpbmcsIGZhbHNlLCBmYWxz
ZSk7CisJCWFtZGdwdV9yaW5nX2VtaXRfdG16KHJpbmcsIGZhbHNlLCBqb2IgPyBqb2ItPnNlY3Vy
ZSA6IGZhbHNlKTsKIAogI2lmZGVmIENPTkZJR19YODZfNjQKIAlpZiAoIShhZGV2LT5mbGFncyAm
IEFNRF9JU19BUFUpKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2pvYi5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5oCmluZGV4
IGRjN2VlOTMuLmFhMGUzNzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9qb2IuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9i
LmgKQEAgLTYzLDYgKzYzLDggQEAgc3RydWN0IGFtZGdwdV9qb2IgewogCXVpbnQ2NF90CQl1Zl9h
ZGRyOwogCXVpbnQ2NF90CQl1Zl9zZXF1ZW5jZTsKIAorCS8qIHRoZSBqb2IgaXMgZHVlIHRvIGEg
c2VjdXJlIGNvbW1hbmQgc3VibWlzc2lvbiAqLworCWJvb2wJCQlzZWN1cmU7CiB9OwogCiBpbnQg
YW1kZ3B1X2pvYl9hbGxvYyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdW5zaWduZWQgbnVt
X2licywKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
