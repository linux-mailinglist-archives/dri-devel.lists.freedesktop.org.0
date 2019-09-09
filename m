Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB2FADAB9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 16:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF4289AD2;
	Mon,  9 Sep 2019 14:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D825889C63
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 14:06:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 45509AC8E;
 Mon,  9 Sep 2019 14:06:36 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, noralf@tronnes.org,
 rong.a.chen@intel.com, feng.tang@intel.com, ying.huang@intel.com
Subject: [PATCH 1/2] drm/fb-helper: Synchronize dirty worker with vblank
Date: Mon,  9 Sep 2019 16:06:32 +0200
Message-Id: <20190909140633.31260-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190909140633.31260-1-tzimmermann@suse.de>
References: <20190909140633.31260-1-tzimmermann@suse.de>
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
ZXIuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIHwgMTIgKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5j
CmluZGV4IGE3YmE1YjQ5MDJkNi4uMDE3ZTJmNmJkMWI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZiX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVy
LmMKQEAgLTQwMiw4ICs0MDIsMjAgQEAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9kaXJ0eV93
b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAkJCQkJCSAgICBkaXJ0eV93b3JrKTsKIAlz
dHJ1Y3QgZHJtX2NsaXBfcmVjdCAqY2xpcCA9ICZoZWxwZXItPmRpcnR5X2NsaXA7CiAJc3RydWN0
IGRybV9jbGlwX3JlY3QgY2xpcF9jb3B5OworCXN0cnVjdCBkcm1fY3J0YyAqY3J0YzsKIAl1bnNp
Z25lZCBsb25nIGZsYWdzOwogCXZvaWQgKnZhZGRyOworCWludCByZXQ7CisKKwkvKiByYXRlLWxp
bWl0IHVwZGF0ZSBmcmVxdWVuY3kgKi8KKwltdXRleF9sb2NrKCZoZWxwZXItPmxvY2spOworCWNy
dGMgPSBoZWxwZXItPmNsaWVudC5tb2Rlc2V0c1swXS5jcnRjOworCXJldCA9IGRybV9jcnRjX3Zi
bGFua19nZXQoY3J0Yyk7CisJaWYgKCFyZXQpIHsKKwkJZHJtX2NydGNfd2FpdF9vbmVfdmJsYW5r
KGNydGMpOworCQlkcm1fY3J0Y192YmxhbmtfcHV0KGNydGMpOworCX0KKwltdXRleF91bmxvY2so
JmhlbHBlci0+bG9jayk7CiAKIAlzcGluX2xvY2tfaXJxc2F2ZSgmaGVscGVyLT5kaXJ0eV9sb2Nr
LCBmbGFncyk7CiAJY2xpcF9jb3B5ID0gKmNsaXA7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
