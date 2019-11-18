Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B15101AEF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CB56EBC9;
	Tue, 19 Nov 2019 08:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EBA6E483
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 11:39:03 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id F0562ABE5B338D6644BE;
 Mon, 18 Nov 2019 19:38:59 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 19:38:49 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <treding@nvidia.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <jonathanh@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>
Subject: [PATCH 1/2] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code in
 tegra_bo_dumb_create
Date: Mon, 18 Nov 2019 19:46:11 +0800
Message-ID: <1574077572-59152-2-git-send-email-zhengbin13@huawei.com>
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

Rml4ZXMgY29jY2ljaGVjayB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jOjQ1
NzoxLTM6IFdBUk5JTkc6IFBUUl9FUlJfT1JfWkVSTyBjYW4gYmUgdXNlZAoKUmVwb3J0ZWQtYnk6
IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiB6aGVuZ2JpbiA8
emhlbmdiaW4xM0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYyB8
IDUgKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2VtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvZ2VtLmMKaW5kZXggNzQ2ZGFlMy4uZGFlM2VmZSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3RlZ3JhL2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwpA
QCAtNDU0LDEwICs0NTQsNyBAQCBpbnQgdGVncmFfYm9fZHVtYl9jcmVhdGUoc3RydWN0IGRybV9m
aWxlICpmaWxlLCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLAoKIAlibyA9IHRlZ3JhX2JvX2NyZWF0
ZV93aXRoX2hhbmRsZShmaWxlLCBkcm0sIGFyZ3MtPnNpemUsIDAsCiAJCQkJCSAmYXJncy0+aGFu
ZGxlKTsKLQlpZiAoSVNfRVJSKGJvKSkKLQkJcmV0dXJuIFBUUl9FUlIoYm8pOwotCi0JcmV0dXJu
IDA7CisJcmV0dXJuIFBUUl9FUlJfT1JfWkVSTyhibyk7CiB9Cgogc3RhdGljIHZtX2ZhdWx0X3Qg
dGVncmFfYm9fZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCi0tCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
