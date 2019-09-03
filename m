Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114ADA7576
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 22:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A3D89C55;
	Tue,  3 Sep 2019 20:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE5E89C2C;
 Tue,  3 Sep 2019 20:48:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E3D5DC057F88;
 Tue,  3 Sep 2019 20:48:41 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C84B51001B02;
 Tue,  3 Sep 2019 20:48:40 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 22/27] drm/nouveau: Don't grab runtime PM refs for HPD IRQs
Date: Tue,  3 Sep 2019 16:46:00 -0400
Message-Id: <20190903204645.25487-23-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-1-lyude@redhat.com>
References: <20190903204645.25487-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 03 Sep 2019 20:48:42 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, Juston Li <juston.li@intel.com>,
 Harry Wentland <hwentlan@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gb3JkZXIgZm9yIHN1c3BlbmQvcmVzdW1lIHJlcHJvYmluZyB0byB3b3JrLCB3ZSBuZWVkIHRv
IGJlIGFibGUgdG8KcGVyZm9ybSBzaWRlYmFuZCBjb21tdW5pY2F0aW9ucyBkdXJpbmcgc3VzcGVu
ZC9yZXN1bWUsIGFsb25nIHdpdGgKcnVudGltZSBQTSBzdXNwZW5kL3Jlc3VtZS4gSW4gb3JkZXIg
dG8gZG8gc28sIHdlIGFsc28gbmVlZCB0byBtYWtlIHN1cmUKdGhhdCBub3V2ZWF1IGRvZXNuJ3Qg
Ym90aGVyIGdyYWJiaW5nIGEgcnVudGltZSBQTSByZWZlcmVuY2UgdG8gZG8gc28sCnNpbmNlIG90
aGVyd2lzZSB3ZSdsbCBzdGFydCBkZWFkbG9ja2luZyBydW50aW1lIFBNIGFnYWluLgoKTm90ZSB0
aGF0IHdlIHdlcmVuJ3QgYWJsZSB0byBkbyB0aGlzIGJlZm9yZSwgYmVjYXVzZSBvZiB0aGUgRFAg
TVNUCmhlbHBlcnMgcHJvY2Vzc2luZyBVUCByZXF1ZXN0cyBmcm9tIHRvcG9sb2dpZXMgaW4gdGhl
IHNhbWUgY29udGV4dCBhcwpkcm1fZHBfbXN0X2hwZF9pcnEoKSB3aGljaCB3b3VsZCBoYXZlIGNh
dXNlZCB1cyB0byBvcGVuIG91cnNlbHZlcyB1cCB0bwpyZWNlaXZpbmcgaG90cGx1ZyBldmVudHMg
YW5kIGRlYWRsb2NraW5nIHdpdGggcnVudGltZSBzdXNwZW5kL3Jlc3VtZS4KTm93IHRoYXQgdGhv
c2UgcmVxdWVzdHMgYXJlIGhhbmRsZWQgYXN5bmNocm9ub3VzbHksIHRoaXMgY2hhbmdlIHNob3Vs
ZApiZSBjb21wbGV0ZWx5IHNhZmUuCgpDYzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50ZWwuY29t
PgpDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpDYzogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxod2Vu
dGxhbkBhbWQuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
U2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jIHwgMzMgKysrKysrKysrKystLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3Iu
YyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMKaW5kZXggNTY4
NzFkMzRlM2ZiLi5mMjc2OTE4ZDNmM2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9jb25uZWN0b3IuYwpAQCAtMTEzMSw2ICsxMTMxLDE2IEBAIG5vdXZlYXVfY29ubmVjdG9y
X2hvdHBsdWcoc3RydWN0IG52aWZfbm90aWZ5ICpub3RpZnkpCiAJY29uc3QgY2hhciAqbmFtZSA9
IGNvbm5lY3Rvci0+bmFtZTsKIAlzdHJ1Y3Qgbm91dmVhdV9lbmNvZGVyICpudl9lbmNvZGVyOwog
CWludCByZXQ7CisJYm9vbCBwbHVnZ2VkID0gKHJlcC0+bWFzayAhPSBOVklGX05PVElGWV9DT05O
X1YwX1VOUExVRyk7CisKKwlpZiAocmVwLT5tYXNrICYgTlZJRl9OT1RJRllfQ09OTl9WMF9JUlEp
IHsKKwkJTlZfREVCVUcoZHJtLCAic2VydmljZSAlc1xuIiwgbmFtZSk7CisJCWRybV9kcF9jZWNf
aXJxKCZudl9jb25uZWN0b3ItPmF1eCk7CisJCWlmICgobnZfZW5jb2RlciA9IGZpbmRfZW5jb2Rl
cihjb25uZWN0b3IsIERDQl9PVVRQVVRfRFApKSkKKwkJCW52NTBfbXN0bV9zZXJ2aWNlKG52X2Vu
Y29kZXItPmRwLm1zdG0pOworCisJCXJldHVybiBOVklGX05PVElGWV9LRUVQOworCX0KIAogCXJl
dCA9IHBtX3J1bnRpbWVfZ2V0KGRybS0+ZGV2LT5kZXYpOwogCWlmIChyZXQgPT0gMCkgewpAQCAt
MTE1MSwyNSArMTE2MSwxNiBAQCBub3V2ZWF1X2Nvbm5lY3Rvcl9ob3RwbHVnKHN0cnVjdCBudmlm
X25vdGlmeSAqbm90aWZ5KQogCQlyZXR1cm4gTlZJRl9OT1RJRllfRFJPUDsKIAl9CiAKLQlpZiAo
cmVwLT5tYXNrICYgTlZJRl9OT1RJRllfQ09OTl9WMF9JUlEpIHsKLQkJTlZfREVCVUcoZHJtLCAi
c2VydmljZSAlc1xuIiwgbmFtZSk7Ci0JCWRybV9kcF9jZWNfaXJxKCZudl9jb25uZWN0b3ItPmF1
eCk7Ci0JCWlmICgobnZfZW5jb2RlciA9IGZpbmRfZW5jb2Rlcihjb25uZWN0b3IsIERDQl9PVVRQ
VVRfRFApKSkKLQkJCW52NTBfbXN0bV9zZXJ2aWNlKG52X2VuY29kZXItPmRwLm1zdG0pOwotCX0g
ZWxzZSB7Ci0JCWJvb2wgcGx1Z2dlZCA9IChyZXAtPm1hc2sgIT0gTlZJRl9OT1RJRllfQ09OTl9W
MF9VTlBMVUcpOwotCisJaWYgKCFwbHVnZ2VkKQorCQlkcm1fZHBfY2VjX3Vuc2V0X2VkaWQoJm52
X2Nvbm5lY3Rvci0+YXV4KTsKKwlOVl9ERUJVRyhkcm0sICIlc3BsdWdnZWQgJXNcbiIsIHBsdWdn
ZWQgPyAiIiA6ICJ1biIsIG5hbWUpOworCWlmICgobnZfZW5jb2RlciA9IGZpbmRfZW5jb2Rlcihj
b25uZWN0b3IsIERDQl9PVVRQVVRfRFApKSkgewogCQlpZiAoIXBsdWdnZWQpCi0JCQlkcm1fZHBf
Y2VjX3Vuc2V0X2VkaWQoJm52X2Nvbm5lY3Rvci0+YXV4KTsKLQkJTlZfREVCVUcoZHJtLCAiJXNw
bHVnZ2VkICVzXG4iLCBwbHVnZ2VkID8gIiIgOiAidW4iLCBuYW1lKTsKLQkJaWYgKChudl9lbmNv
ZGVyID0gZmluZF9lbmNvZGVyKGNvbm5lY3RvciwgRENCX09VVFBVVF9EUCkpKSB7Ci0JCQlpZiAo
IXBsdWdnZWQpCi0JCQkJbnY1MF9tc3RtX3JlbW92ZShudl9lbmNvZGVyLT5kcC5tc3RtKTsKLQkJ
fQotCi0JCWRybV9oZWxwZXJfaHBkX2lycV9ldmVudChjb25uZWN0b3ItPmRldik7CisJCQludjUw
X21zdG1fcmVtb3ZlKG52X2VuY29kZXItPmRwLm1zdG0pOwogCX0KIAorCWRybV9oZWxwZXJfaHBk
X2lycV9ldmVudChjb25uZWN0b3ItPmRldik7CisKIAlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5
KGRybS0+ZGV2LT5kZXYpOwogCXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGRybS0+ZGV2LT5k
ZXYpOwogCXJldHVybiBOVklGX05PVElGWV9LRUVQOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
