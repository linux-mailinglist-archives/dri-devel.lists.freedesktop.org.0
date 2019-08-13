Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7088E6AC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB3F6E904;
	Thu, 15 Aug 2019 08:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Tue, 13 Aug 2019 09:35:57 UTC
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EDB6E0D2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 09:35:57 +0000 (UTC)
Received: from ramsan ([84.194.98.4]) by michel.telenet-ops.be with bizsmtp
 id oZWn2000Y05gfCL06ZWnvJ; Tue, 13 Aug 2019 11:30:54 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hxT8h-0001Ef-Ny; Tue, 13 Aug 2019 11:30:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hxT8h-0001Iz-KD; Tue, 13 Aug 2019 11:30:47 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/bridge: dumb-vga-dac: Fix dereferencing -ENODEV DDC
 channel
Date: Tue, 13 Aug 2019 11:30:46 +0200
Message-Id: <20190813093046.4976-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Guenter Roeck <linux@roeck-us.net>,
 Emil Velikov <emil.velikov@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgdGhlIFZHQSBjb25uZWN0b3IgaGFzIG5vIEREQyBjaGFubmVsLCBhbiBlcnJvciBwb2ludGVy
IHdpbGwgYmUKZGVyZWZlcmVuY2VkLCBlLmcuIG9uIFNhbHZhdG9yLVhTOgoKICAgIFVuYWJsZSB0
byBoYW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCB2aXJ0dWFsIGFkZHJl
c3MgMDAwMDAwMDAwMDAwMDE3ZAogICAgLi4uCiAgICBDYWxsIHRyYWNlOgogICAgIHN5c2ZzX2Rv
X2NyZWF0ZV9saW5rX3NkLmlzcmEuMCsweDQwLzB4MTA4CiAgICAgc3lzZnNfY3JlYXRlX2xpbmsr
MHgyMC8weDQwCiAgICAgZHJtX3N5c2ZzX2Nvbm5lY3Rvcl9hZGQrMHhhOC8weGM4CiAgICAgZHJt
X2Nvbm5lY3Rvcl9yZWdpc3Rlci5wYXJ0LjMrMHg1NC8weGIwCiAgICAgZHJtX2Nvbm5lY3Rvcl9y
ZWdpc3Rlcl9hbGwrMHhiMC8weGQwCiAgICAgZHJtX21vZGVzZXRfcmVnaXN0ZXJfYWxsKzB4NTQv
MHg4OAogICAgIGRybV9kZXZfcmVnaXN0ZXIrMHgxOGMvMHgxZDgKICAgICByY2FyX2R1X3Byb2Jl
KzB4ZTQvMHgxNTAKICAgICAuLi4KClRoaXMgaGFwcGVucyBiZWNhdXNlIHZnYS0+ZGRjIGVpdGhl
ciBjb250YWlucyBhIHZhbGlkIEREQyBjaGFubmVsCnBvaW50ZXIsIG9yIC1FTk9ERVYsIGFuZCBk
cm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoKSBleHBlY3RzIGEgdmFsaWQKRERDIGNoYW5uZWwg
cG9pbnRlciwgb3IgTlVMTC4KCkZpeCB0aGlzIGJ5IHJlc2V0dGluZyB2Z2EtPmRkYyB0byBOVUxM
IGluIGNhc2Ugb2YgLUVOT0RFViwgYW5kIHJlcGxhY2luZwp0aGUgZXhpc3RpbmcgZXJyb3IgY2hl
Y2tzIGJ5IG5vbi1OVUxMIGNoZWNrcy4KVGhpcyBpcyBzaW1pbGFyIHRvIHdoYXQgdGhlIEhETUkg
Y29ubmVjdG9yIGRyaXZlciBkb2VzLgoKRml4ZXM6IGE0ZjkwODdlODVkZTE0MWUgKCJkcm0vYnJp
ZGdlOiBkdW1iLXZnYS1kYWM6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9yIHN5c2Zz
IGRpcmVjdG9yeSIpClNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmU+Ci0tLQpBbiBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBjaGVjayBpZiB2
Z2EtPmRkYyBjb250YWlucyBhbiBlcnJvciBwb2ludGVyLAphbmQgY2FsbGluZyBkcm1fY29ubmVj
dG9yX2luaXQoKSBpbnN0ZWFkIG9mCmRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYygpLCBsaWtl
IGJlZm9yZS4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1bWItdmdhLWRhYy5jIHwgNyAr
KysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVtYi12Z2EtZGFjLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL2R1bWItdmdhLWRhYy5jCmluZGV4IDhlZjY1MzlhZTc4YTZlYjMu
LjdhYTc4OWMzNTg4MjliMDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVt
Yi12Z2EtZGFjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1iLXZnYS1kYWMuYwpA
QCAtNDIsNyArNDIsNyBAQCBzdGF0aWMgaW50IGR1bWJfdmdhX2dldF9tb2RlcyhzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCXN0cnVjdCBlZGlkICplZGlkOwogCWludCByZXQ7CiAK
LQlpZiAoSVNfRVJSKHZnYS0+ZGRjKSkKKwlpZiAoIXZnYS0+ZGRjKQogCQlnb3RvIGZhbGxiYWNr
OwogCiAJZWRpZCA9IGRybV9nZXRfZWRpZChjb25uZWN0b3IsIHZnYS0+ZGRjKTsKQEAgLTg0LDcg
Kzg0LDcgQEAgZHVtYl92Z2FfY29ubmVjdG9yX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yLCBib29sIGZvcmNlKQogCSAqIHdpcmUgdGhlIEREQyBwaW5zLCBvciB0aGUgSTJD
IGJ1cyBtaWdodCBub3QgYmUgd29ya2luZyBhdAogCSAqIGFsbC4KIAkgKi8KLQlpZiAoIUlTX0VS
Uih2Z2EtPmRkYykgJiYgZHJtX3Byb2JlX2RkYyh2Z2EtPmRkYykpCisJaWYgKHZnYS0+ZGRjICYm
IGRybV9wcm9iZV9kZGModmdhLT5kZGMpKQogCQlyZXR1cm4gY29ubmVjdG9yX3N0YXR1c19jb25u
ZWN0ZWQ7CiAKIAlyZXR1cm4gY29ubmVjdG9yX3N0YXR1c191bmtub3duOwpAQCAtMTk3LDYgKzE5
Nyw3IEBAIHN0YXRpYyBpbnQgZHVtYl92Z2FfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAkJaWYgKFBUUl9FUlIodmdhLT5kZGMpID09IC1FTk9ERVYpIHsKIAkJCWRldl9kYmco
JnBkZXYtPmRldiwKIAkJCQkiTm8gaTJjIGJ1cyBzcGVjaWZpZWQuIERpc2FibGluZyBFRElEIHJl
YWRvdXRcbiIpOworCQkJdmdhLT5kZGMgPSBOVUxMOwogCQl9IGVsc2UgewogCQkJZGV2X2Vycigm
cGRldi0+ZGV2LCAiQ291bGRuJ3QgcmV0cmlldmUgaTJjIGJ1c1xuIik7CiAJCQlyZXR1cm4gUFRS
X0VSUih2Z2EtPmRkYyk7CkBAIC0yMTgsNyArMjE5LDcgQEAgc3RhdGljIGludCBkdW1iX3ZnYV9y
ZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWRybV9icmlkZ2VfcmVtb3Zl
KCZ2Z2EtPmJyaWRnZSk7CiAKLQlpZiAoIUlTX0VSUih2Z2EtPmRkYykpCisJaWYgKHZnYS0+ZGRj
KQogCQlpMmNfcHV0X2FkYXB0ZXIodmdhLT5kZGMpOwogCiAJcmV0dXJuIDA7Ci0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
