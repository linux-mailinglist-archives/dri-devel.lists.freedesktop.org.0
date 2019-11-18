Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B68101AE6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828866EBD8;
	Tue, 19 Nov 2019 08:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096FB6E483
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 11:39:02 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 011D0E533B7CE34D698E;
 Mon, 18 Nov 2019 19:39:00 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 19:38:50 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <treding@nvidia.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <jonathanh@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>
Subject: [PATCH 2/2] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code in
 tegra_gem_create
Date: Mon, 18 Nov 2019 19:46:12 +0800
Message-ID: <1574077572-59152-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com>
References: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgY29jY2ljaGVjayB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jOjM1
MDoxLTM6IFdBUk5JTkc6IFBUUl9FUlJfT1JfWkVSTyBjYW4gYmUgdXNlZAoKUmVwb3J0ZWQtYnk6
IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiB6aGVuZ2JpbiA8
emhlbmdiaW4xM0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyB8
IDUgKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvZHJtLmMKaW5kZXggNTZlNWU3YS4uOGI2YTFmN2QgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9kcm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMK
QEAgLTM0NywxMCArMzQ3LDcgQEAgc3RhdGljIGludCB0ZWdyYV9nZW1fY3JlYXRlKHN0cnVjdCBk
cm1fZGV2aWNlICpkcm0sIHZvaWQgKmRhdGEsCgogCWJvID0gdGVncmFfYm9fY3JlYXRlX3dpdGhf
aGFuZGxlKGZpbGUsIGRybSwgYXJncy0+c2l6ZSwgYXJncy0+ZmxhZ3MsCiAJCQkJCSAmYXJncy0+
aGFuZGxlKTsKLQlpZiAoSVNfRVJSKGJvKSkKLQkJcmV0dXJuIFBUUl9FUlIoYm8pOwotCi0JcmV0
dXJuIDA7CisJcmV0dXJuIFBUUl9FUlJfT1JfWkVSTyhibyk7CiB9Cgogc3RhdGljIGludCB0ZWdy
YV9nZW1fbW1hcChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB2b2lkICpkYXRhLAotLQoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
