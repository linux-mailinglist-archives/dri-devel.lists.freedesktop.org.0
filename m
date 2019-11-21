Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3D2105886
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 18:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5A36F4B9;
	Thu, 21 Nov 2019 17:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A4C6F4B9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 17:22:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 851F7291CCD
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv3/RFC 3/4] drm/komeda: Use afbc helper
Date: Thu, 21 Nov 2019 18:22:46 +0100
Message-Id: <20191121172247.31150-4-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191121172247.31150-1-andrzej.p@collabora.com>
References: <20191119083429.GA2881@jamwan02-TSP300>
 <20191121172247.31150-1-andrzej.p@collabora.com>
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QUZCQyBoZWxwZXJzIGFyZSBhdmFpbGFibGUuIFVzZSB0aG9zZSB3aGljaCBpbmNyZWFzZSBjb2Rl
IHJlYWRhYmlsaXR5LgoKU2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRy
emVqLnBAY29sbGFib3JhLmNvbT4KLS0tCiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfZnJhbWVidWZmZXIuYyB8IDE3ICsrKy0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZlci5jIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYwppbmRleCAxYjAx
YTYyNWY0MGUuLmY3ZWRkZTNhYzMxOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZlci5jCkBAIC00LDYgKzQsNyBAQAog
ICogQXV0aG9yOiBKYW1lcy5RaWFuLldhbmcgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgogICoK
ICAqLworI2luY2x1ZGUgPGRybS9kcm1fYWZiYy5oPgogI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNl
Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9mYl9jbWFfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2Ry
bV9nZW0uaD4KQEAgLTUyLDIwICs1Myw4IEBAIGtvbWVkYV9mYl9hZmJjX3NpemVfY2hlY2soc3Ry
dWN0IGtvbWVkYV9mYiAqa2ZiLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsCiAJCXJldHVybiAtRU5P
RU5UOwogCX0KIAotCXN3aXRjaCAoZmItPm1vZGlmaWVyICYgQUZCQ19GT1JNQVRfTU9EX0JMT0NL
X1NJWkVfTUFTSykgewotCWNhc2UgQUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJWkVfMzJ4ODoKLQkJ
YWxpZ25tZW50X3cgPSAzMjsKLQkJYWxpZ25tZW50X2ggPSA4OwotCQlicmVhazsKLQljYXNlIEFG
QkNfRk9STUFUX01PRF9CTE9DS19TSVpFXzE2eDE2OgotCQlhbGlnbm1lbnRfdyA9IDE2OwotCQlh
bGlnbm1lbnRfaCA9IDE2OwotCQlicmVhazsKLQlkZWZhdWx0OgotCQlXQVJOKDEsICJJbnZhbGlk
IEFGQkNfRk9STUFUX01PRF9CTE9DS19TSVpFOiAlbGxkLlxuIiwKLQkJICAgICBmYi0+bW9kaWZp
ZXIgJiBBRkJDX0ZPUk1BVF9NT0RfQkxPQ0tfU0laRV9NQVNLKTsKLQkJYnJlYWs7Ci0JfQorCWlm
ICghZHJtX2FmYmNfZ2V0X3N1cGVyYmxrX3doKGZiLT5tb2RpZmllciwgJmFsaWdubWVudF93LCAm
YWxpZ25tZW50X2gpKQorCQlyZXR1cm4gLUVJTlZBTDsKIAogCS8qIHRpbGVkIGhlYWRlciBhZmJj
ICovCiAJaWYgKGZiLT5tb2RpZmllciAmIEFGQkNfRk9STUFUX01PRF9USUxFRCkgewotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
