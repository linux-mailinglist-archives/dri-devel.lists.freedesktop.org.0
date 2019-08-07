Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFC385532
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 23:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAE96E76B;
	Wed,  7 Aug 2019 21:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABC26E76B;
 Wed,  7 Aug 2019 21:33:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8AE053DE02;
 Wed,  7 Aug 2019 21:33:20 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-121-222.rdu2.redhat.com
 [10.10.121.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F0ED600C6;
 Wed,  7 Aug 2019 21:33:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 1/2] drm/nouveau/dispnv04: Grab/put runtime PM refs on DPMS
 on/off
Date: Wed,  7 Aug 2019 17:33:00 -0400
Message-Id: <20190807213304.9255-2-lyude@redhat.com>
In-Reply-To: <20190807213304.9255-1-lyude@redhat.com>
References: <20190807213304.9255-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 07 Aug 2019 21:33:20 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNvZGUgY2xhaW1zIHRvIGdyYWIgYSBydW50aW1lIFBNIHJlZiB3aGVuIGF0IGxlYXN0IG9u
ZSBDUlRDIGlzCmFjdGl2ZSwgYnV0IHRoYXQncyBub3QgYWN0dWFsbHkgdGhlIGNhc2UgYXMgd2Ug
Z3JhYiBhIHJ1bnRpbWUgUE0gcmVmCndoZW5ldmVyIGEgQ1JUQyBpcyBlbmFibGVkIHJlZ2FyZGxl
c3Mgb2YgaXQncyBEUE1TIHN0YXRlLiBNZWFuaW5nIHRoYXQKd2UgY2FuIGVuZCB1cCBrZWVwaW5n
IHRoZSBHUFUgYXdha2Ugd2hlbiB0aGVyZSBhcmUgbm8gc2NyZWVucyBlbmFibGVkLApzb21ldGhp
bmcgd2UgZG9uJ3QgcmVhbGx5IHdhbnQgdG8gZG8uCgpOb3RlIHRoYXQgd2UgZml4ZWQgdGhpcyBz
YW1lIGlzc3VlIGZvciBudjUwIGEgd2hpbGUgYWdvIGluOgoKY29tbWl0IGU1ZDU0ZjE5MzU3MiAo
ImRybS9ub3V2ZWF1L2RybS9ub3V2ZWF1OiBGaXggcnVudGltZSBQTSBsZWFrIGluCm52NTBfZGlz
cF9hdG9taWNfY29tbWl0KCkiKQoKU2luY2Ugd2UncmUgYWJvdXQgdG8gcmVtb3ZlIG5vdXZlYXVf
ZHJtLT5oYXZlX2Rpc3BfcG93ZXJfcmVmIGluIHRoZSBuZXh0CmNvbW1pdCwgbGV0J3MgYWxzbyBz
aW1wbGlmeSB0aGUgUlBNIGNvZGUgaGVyZSB3aGlsZSB3ZSdyZSBhdCBpdDogZ3JhYiBhCnJlZiBk
dXJpbmcgYSBtb2Rlc2V0LCBncmFiIGFkZGl0aW9uYWwgUlBNIHJlZnMgZm9yIGVhY2ggQ1JUQyBl
bmFibGVkIGJ5CnNhaWQgbW9kZXNldCwgYW5kIGRyb3AgYW4gUlBNIHJlZiBmb3IgZWFjaCBDUlRD
IGRpc2FibGVkIGJ5IHNhaWQKbW9kZXNldC4gVGhpcyBhbGxvd3MgdXMgdG8ga2VlcCB0aGUgR1BV
IGF3YWtlIHdoZW5ldmVyIHNjcmVlbnMgYXJlCnR1cm5lZCBvbiwgd2l0aG91dCBuZWVkaW5nIHRv
IHVzZSBub3V2ZWF1X2RybS0+aGF2ZV9kaXNwX3Bvd2VyX3JlZi4KClNpZ25lZC1vZmYtYnk6IEx5
dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
ZGlzcG52MDQvY3J0Yy5jIHwgMTggKysrKy0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9kaXNwbnYwNC9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnYwNC9jcnRjLmMKaW5kZXggZjIyZjAxMDIwNjI1Li4wOGFkOGUzYjljZDIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L2NydGMuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC9jcnRjLmMKQEAgLTE4Myw2ICsxODMsMTAgQEAgbnZf
Y3J0Y19kcG1zKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywgaW50IG1vZGUpCiAJCXJldHVybjsKIAog
CW52X2NydGMtPmxhc3RfZHBtcyA9IG1vZGU7CisJaWYgKG1vZGUgPT0gRFJNX01PREVfRFBNU19P
TikKKwkJcG1fcnVudGltZV9nZXRfbm9yZXN1bWUoZGV2LT5kZXYpOworCWVsc2UKKwkJcG1fcnVu
dGltZV9wdXRfbm9pZGxlKGRldi0+ZGV2KTsKIAogCWlmIChudl90d29faGVhZHMoZGV2KSkKIAkJ
TlZTZXRPd25lcihkZXYsIG52X2NydGMtPmluZGV4KTsKQEAgLTEwNDUsNyArMTA0OSw2IEBAIG5v
dXZlYXVfY3J0Y19zZXRfY29uZmlnKHN0cnVjdCBkcm1fbW9kZV9zZXQgKnNldCwKIAogCWRldiA9
IHNldC0+Y3J0Yy0+ZGV2OwogCi0JLyogZ2V0IGEgcG0gcmVmZXJlbmNlIGhlcmUgKi8KIAlyZXQg
PSBwbV9ydW50aW1lX2dldF9zeW5jKGRldi0+ZGV2KTsKIAlpZiAocmV0IDwgMCAmJiByZXQgIT0g
LUVBQ0NFUykKIAkJcmV0dXJuIHJldDsKQEAgLTEwNjEsMTkgKzEwNjQsNiBAQCBub3V2ZWF1X2Ny
dGNfc2V0X2NvbmZpZyhzdHJ1Y3QgZHJtX21vZGVfc2V0ICpzZXQsCiAJfQogCiAJcG1fcnVudGlt
ZV9tYXJrX2xhc3RfYnVzeShkZXYtPmRldik7Ci0JLyogaWYgd2UgaGF2ZSBhY3RpdmUgY3J0Y3Mg
YW5kIHdlIGRvbid0IGhhdmUgYSBwb3dlciByZWYsCi0JICAgdGFrZSB0aGUgY3VycmVudCBvbmUg
Ki8KLQlpZiAoYWN0aXZlICYmICFkcm0tPmhhdmVfZGlzcF9wb3dlcl9yZWYpIHsKLQkJZHJtLT5o
YXZlX2Rpc3BfcG93ZXJfcmVmID0gdHJ1ZTsKLQkJcmV0dXJuIHJldDsKLQl9Ci0JLyogaWYgd2Ug
aGF2ZSBubyBhY3RpdmUgY3J0Y3MsIHRoZW4gZHJvcCB0aGUgcG93ZXIgcmVmCi0JICAgd2UgZ290
IGJlZm9yZSAqLwotCWlmICghYWN0aXZlICYmIGRybS0+aGF2ZV9kaXNwX3Bvd2VyX3JlZikgewot
CQlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChkZXYtPmRldik7Ci0JCWRybS0+aGF2ZV9kaXNw
X3Bvd2VyX3JlZiA9IGZhbHNlOwotCX0KLQkvKiBkcm9wIHRoZSBwb3dlciByZWZlcmVuY2Ugd2Ug
Z290IGNvbWluZyBpbiBoZXJlICovCiAJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoZGV2LT5k
ZXYpOwogCXJldHVybiByZXQ7CiB9Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
