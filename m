Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF0F34D165
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 15:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9B86E423;
	Mon, 29 Mar 2021 13:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6A36E420;
 Mon, 29 Mar 2021 13:37:52 +0000 (UTC)
IronPort-SDR: A+XQwwVI1J8g/0+KSPM7jZUZlV+CTyGR4QNzIZcqkH3XEL7vm0y3yzq7Zp+X93TgfdtVy0sYi6
 lJmJy6srPd5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="191016615"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; d="scan'208";a="191016615"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 06:37:52 -0700
IronPort-SDR: Su2dF2HaljA4wqHtE+q8q+q90O1XnUZdKdc1W5ca0T6rOzhVmkwWvNEqKyBz17WGa7wTqy/ypu
 ejHRX8efrpDg==
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; d="scan'208";a="393178825"
Received: from auchter-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.199])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 06:37:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/8] drm/edid: use the new displayid iterator for detailed
 modes
Date: Mon, 29 Mar 2021 16:37:18 +0300
Message-Id: <f6c69c545c553c4a616887540660a4b8aecf0f7f.1617024940.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617024940.git.jani.nikula@intel.com>
References: <cover.1617024940.git.jani.nikula@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmVhdGx5IHJlZHVjZSBkaXNwbGF5aWQgYm9pbGVycGxhdGUgaW4gY29kZS4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2VzLgoKUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBp
bnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCAyMyArKysrKystLS0t
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2VkaWQuYwppbmRleCA1OGU2MWY3OTJiYzcuLmZiYWE3ZDY3OWNiMiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9lZGlkLmMKQEAgLTUzMzMsMjcgKzUzMzMsMTYgQEAgc3RhdGljIGludCBhZGRfZGlzcGxh
eWlkX2RldGFpbGVkXzFfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIHN0
YXRpYyBpbnQgYWRkX2Rpc3BsYXlpZF9kZXRhaWxlZF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yLAogCQkJCQlzdHJ1Y3QgZWRpZCAqZWRpZCkKIHsKLQljb25zdCB1OCAqZGlz
cGxheWlkOwotCWludCBsZW5ndGgsIGlkeDsKIAljb25zdCBzdHJ1Y3QgZGlzcGxheWlkX2Jsb2Nr
ICpibG9jazsKKwlzdHJ1Y3QgZGlzcGxheWlkX2l0ZXIgaXRlcjsKIAlpbnQgbnVtX21vZGVzID0g
MDsKLQlpbnQgZXh0X2luZGV4ID0gMDsKLQotCWZvciAoOzspIHsKLQkJZGlzcGxheWlkID0gZHJt
X2ZpbmRfZGlzcGxheWlkX2V4dGVuc2lvbihlZGlkLCAmbGVuZ3RoLCAmaWR4LAotCQkJCQkJCSAm
ZXh0X2luZGV4KTsKLQkJaWYgKCFkaXNwbGF5aWQpCi0JCQlicmVhazsKIAotCQlpZHggKz0gc2l6
ZW9mKHN0cnVjdCBkaXNwbGF5aWRfaGRyKTsKLQkJZm9yX2VhY2hfZGlzcGxheWlkX2RiKGRpc3Bs
YXlpZCwgYmxvY2ssIGlkeCwgbGVuZ3RoKSB7Ci0JCQlzd2l0Y2ggKGJsb2NrLT50YWcpIHsKLQkJ
CWNhc2UgREFUQV9CTE9DS19UWVBFXzFfREVUQUlMRURfVElNSU5HOgotCQkJCW51bV9tb2RlcyAr
PSBhZGRfZGlzcGxheWlkX2RldGFpbGVkXzFfbW9kZXMoY29ubmVjdG9yLCBibG9jayk7Ci0JCQkJ
YnJlYWs7Ci0JCQl9Ci0JCX0KKwlkaXNwbGF5aWRfaXRlcl9lZGlkX2JlZ2luKGVkaWQsICZpdGVy
KTsKKwlkaXNwbGF5aWRfaXRlcl9mb3JfZWFjaChibG9jaywgJml0ZXIpIHsKKwkJaWYgKGJsb2Nr
LT50YWcgPT0gREFUQV9CTE9DS19UWVBFXzFfREVUQUlMRURfVElNSU5HKQorCQkJbnVtX21vZGVz
ICs9IGFkZF9kaXNwbGF5aWRfZGV0YWlsZWRfMV9tb2Rlcyhjb25uZWN0b3IsIGJsb2NrKTsKIAl9
CisJZGlzcGxheWlkX2l0ZXJfZW5kKCZpdGVyKTsKIAogCXJldHVybiBudW1fbW9kZXM7CiB9Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
