Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2E4109C1C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 11:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2F36E2D8;
	Tue, 26 Nov 2019 10:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1F06E2D8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 10:15:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DBF36BA58;
 Tue, 26 Nov 2019 10:15:31 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, john.p.donnelly@oracle.com,
 kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH v2 2/3] drm/mgag200: Store flags from PCI driver data in
 device structure
Date: Tue, 26 Nov 2019 11:15:28 +0100
Message-Id: <20191126101529.20356-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191126101529.20356-1-tzimmermann@suse.de>
References: <20191126101529.20356-1-tzimmermann@suse.de>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 stable@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZsYWdzIGZpZWxkIGluIHN0cnVjdCBtZ2FfZGV2aWNlIGhhcyBiZWVuIHVudXNlZCBzbyBm
YXIuIFdlIG5vdwp1c2UgaXQgdG8gc3RvcmUgZmxhZyBiaXRzIGZyb20gdGhlIFBDSSBkcml2ZXIu
CgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4K
UmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkZpeGVz
OiA4MWRhODdmNjNhMWUgKCJkcm06IFJlcGxhY2UgZHJtX2dlbV92cmFtX3B1c2hfdG9fc3lzdGVt
KCkgd2l0aCBrdW5tYXAgKyB1bnBpbiIpCkNjOiBKb2huIERvbm5lbGx5IDxqb2huLnAuZG9ubmVs
bHlAb3JhY2xlLmNvbT4KQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpDYzog
RGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxt
YWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJkIDxtcmlw
YXJkQGtlcm5lbC5vcmc+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiAiWS5DLiBDaGVuIiA8eWNfY2hlbkBh
c3BlZWR0ZWNoLmNvbT4KQ2M6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNv
bT4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDYzogIkpvc8OpIFJv
YmVydG8gZGUgU291emEiIDxqb3NlLnNvdXphQGludGVsLmNvbT4KQ2M6IEFuZHJ6ZWogUGlldHJh
c2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NS4zKwotLS0KIGRy
aXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmggIHwgOCArKysrKysrKwogZHJpdmVy
cy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tYWluLmMgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdh
ZzIwMF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmgKaW5kZXgg
OTc2NDA0NjM0MDkyLi40YjRmOWNlNzRhODQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
Z2FnMjAwL21nYWcyMDBfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIw
MF9kcnYuaApAQCAtMTUxLDYgKzE1MSw3IEBAIGVudW0gbWdhX3R5cGUgewogfTsKIAogI2RlZmlu
ZSBNR0FHMjAwX1RZUEVfTUFTSwkoMHgwMDAwMDBmZikKKyNkZWZpbmUgTUdBRzIwMF9GTEFHX01B
U0sJKDB4MDBmZmZmMDApCiAKICNkZWZpbmUgSVNfRzIwMF9TRShtZGV2KSAobWRldi0+dHlwZSA9
PSBHMjAwX1NFX0EgfHwgbWRldi0+dHlwZSA9PSBHMjAwX1NFX0IpCiAKQEAgLTE4OCw2ICsxODks
MTMgQEAgbWdhZzIwMF90eXBlX2Zyb21fZHJpdmVyX2RhdGEoa2VybmVsX3Vsb25nX3QgZHJpdmVy
X2RhdGEpCiB7CiAJcmV0dXJuIChlbnVtIG1nYV90eXBlKShkcml2ZXJfZGF0YSAmIE1HQUcyMDBf
VFlQRV9NQVNLKTsKIH0KKworc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nCittZ2FnMjAwX2Zs
YWdzX2Zyb21fZHJpdmVyX2RhdGEoa2VybmVsX3Vsb25nX3QgZHJpdmVyX2RhdGEpCit7CisJcmV0
dXJuIGRyaXZlcl9kYXRhICYgTUdBRzIwMF9GTEFHX01BU0s7Cit9CisKIAkJCQkvKiBtZ2FnMjAw
X21vZGUuYyAqLwogaW50IG1nYWcyMDBfbW9kZXNldF9pbml0KHN0cnVjdCBtZ2FfZGV2aWNlICpt
ZGV2KTsKIHZvaWQgbWdhZzIwMF9tb2Rlc2V0X2Zpbmkoc3RydWN0IG1nYV9kZXZpY2UgKm1kZXYp
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tYWluLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21haW4uYwppbmRleCA1MTdjNTY5M2FkNjku
LmUxYmM1YjBhYTc3NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIw
MF9tYWluLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tYWluLmMKQEAg
LTk0LDYgKzk0LDcgQEAgc3RhdGljIGludCBtZ2FnMjAwX2RldmljZV9pbml0KHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsCiAJc3RydWN0IG1nYV9kZXZpY2UgKm1kZXYgPSBkZXYtPmRldl9wcml2YXRl
OwogCWludCByZXQsIG9wdGlvbjsKIAorCW1kZXYtPmZsYWdzID0gbWdhZzIwMF9mbGFnc19mcm9t
X2RyaXZlcl9kYXRhKGZsYWdzKTsKIAltZGV2LT50eXBlID0gbWdhZzIwMF90eXBlX2Zyb21fZHJp
dmVyX2RhdGEoZmxhZ3MpOwogCiAJLyogSGFyZGNvZGUgdGhlIG51bWJlciBvZiBDUlRDcyB0byAx
ICovCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
