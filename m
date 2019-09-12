Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF7AB08F8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 08:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4546EB59;
	Thu, 12 Sep 2019 06:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799DA6EA4C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 06:42:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BABD9AE6F;
 Thu, 12 Sep 2019 06:42:36 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, noralf@tronnes.org,
 rong.a.chen@intel.com, feng.tang@intel.com, ying.huang@intel.com,
 kraxel@redhat.com, ville.syrjala@linux.intel.com
Subject: [PATCH v2 1/3] drm/fb-helper: Synchronize dirty worker with vblank
Date: Thu, 12 Sep 2019 08:42:28 +0200
Message-Id: <20190912064230.27972-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190912064230.27972-1-tzimmermann@suse.de>
References: <20190912064230.27972-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmVmb3JlIHVwZGF0aW5nIHRoZSBkaXNwbGF5IGZyb20gdGhlIGNvbnNvbGUncyBzaGFkb3cgYnVm
ZmVyLCB0aGUgZGlydHkKd29ya2VyIG5vdyB3YWl0cyBmb3IgdmJsYW5rLiBUaGlzIGFsbG93cyBz
ZXZlcmFsIHNjcmVlbiB1cGRhdGVzIHRvIHBpbGUKdXAgYW5kIGFjdHMgYXMgYSByYXRlIGxpbWl0
ZXIuCgp2MjoKCSogZG9uJ3QgaG9sZCBoZWxwZXItPmxvY2sgd2hpbGUgd2FpdGluZyBmb3IgdmJs
YW5rCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIHwgMTAgKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZiX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwpp
bmRleCBhN2JhNWI0OTAyZDYuLmQwY2IxZmE0ZjkwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9mYl9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5j
CkBAIC00MDIsOCArNDAyLDE4IEBAIHN0YXRpYyB2b2lkIGRybV9mYl9oZWxwZXJfZGlydHlfd29y
ayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiAJCQkJCQkgICAgZGlydHlfd29yayk7CiAJc3Ry
dWN0IGRybV9jbGlwX3JlY3QgKmNsaXAgPSAmaGVscGVyLT5kaXJ0eV9jbGlwOwogCXN0cnVjdCBk
cm1fY2xpcF9yZWN0IGNsaXBfY29weTsKKwlzdHJ1Y3QgZHJtX2NydGMgKmNydGM7CiAJdW5zaWdu
ZWQgbG9uZyBmbGFnczsKIAl2b2lkICp2YWRkcjsKKwlpbnQgcmV0OworCisJLyogcmF0ZS1saW1p
dCB1cGRhdGUgZnJlcXVlbmN5ICovCisJY3J0YyA9IGhlbHBlci0+Y2xpZW50Lm1vZGVzZXRzWzBd
LmNydGM7CisJcmV0ID0gZHJtX2NydGNfdmJsYW5rX2dldChjcnRjKTsKKwlpZiAoIXJldCkgewor
CQlkcm1fY3J0Y193YWl0X29uZV92YmxhbmsoY3J0Yyk7CisJCWRybV9jcnRjX3ZibGFua19wdXQo
Y3J0Yyk7CisJfQogCiAJc3Bpbl9sb2NrX2lycXNhdmUoJmhlbHBlci0+ZGlydHlfbG9jaywgZmxh
Z3MpOwogCWNsaXBfY29weSA9ICpjbGlwOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
