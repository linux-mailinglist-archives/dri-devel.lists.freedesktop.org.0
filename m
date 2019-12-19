Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AE2126B2B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 19:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104416E3B5;
	Thu, 19 Dec 2019 18:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9B26E3B5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 18:55:04 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 09F132465E;
 Thu, 19 Dec 2019 18:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576781704;
 bh=I4FicGF1nduQhWKADf+S3DKjlXW9oqIQD8OotutLefg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2wSHA+3p2yCqgBTvysPl5M0dF6auMbTECHKj4jiCODJQhPoLNDsEEssHaePUO6Kq/
 pwflQ6I4+lH9SxZ6tinWN+0v32c78VVkOzGMP9m2vi7Zw9Zy+jg2ASLedryfFuyAER
 Hc1er0BWoYyLOEPAIVh6kfHoMd02q/+oen/ZZ2lI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.4 47/80] drm/mgag200: Store flags from PCI driver data in
 device structure
Date: Thu, 19 Dec 2019 19:34:39 +0100
Message-Id: <20191219183114.978179449@linuxfoundation.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219183031.278083125@linuxfoundation.org>
References: <20191219183031.278083125@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: John Donnelly <john.p.donnelly@oracle.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Dave Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cgpjb21taXQgZDZk
NDM3ZDk3ZDU0Yzg1YTFhOTM5NjdiMjc0NWUzMWRmZjAzMzY1YSB1cHN0cmVhbS4KClRoZSBmbGFn
cyBmaWVsZCBpbiBzdHJ1Y3QgbWdhX2RldmljZSBoYXMgYmVlbiB1bnVzZWQgc28gZmFyLiBXZSBu
b3cKdXNlIGl0IHRvIHN0b3JlIGZsYWcgYml0cyBmcm9tIHRoZSBQQ0kgZHJpdmVyLgoKU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+ClJldmlld2Vk
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpGaXhlczogODFkYTg3
ZjYzYTFlICgiZHJtOiBSZXBsYWNlIGRybV9nZW1fdnJhbV9wdXNoX3RvX3N5c3RlbSgpIHdpdGgg
a3VubWFwICsgdW5waW4iKQpDYzogSm9obiBEb25uZWxseSA8am9obi5wLmRvbm5lbGx5QG9yYWNs
ZS5jb20+CkNjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KQ2M6IERhdmUgQWly
bGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJu
ZWwub3JnPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogU2FtIFJhdm5i
b3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogIlkuQy4gQ2hlbiIgPHljX2NoZW5AYXNwZWVkdGVj
aC5jb20+CkNjOiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+CkNjOiBU
aG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KQ2M6ICJKb3PDqSBSb2JlcnRvIGRl
IFNvdXphIiA8am9zZS5zb3V6YUBpbnRlbC5jb20+CkNjOiBBbmRyemVqIFBpZXRyYXNpZXdpY3og
PGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjUuMysKTGluazogaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkxMTI2MTAxNTI5LjIwMzU2
LTMtdHppbW1lcm1hbm5Ac3VzZS5kZQpTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4g
PGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgoKLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWdhZzIw
MC9tZ2FnMjAwX2Rydi5oICB8ICAgIDggKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAw
L21nYWcyMDBfbWFpbi5jIHwgICAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KQoKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5oCkBAIC0xNjAsNiArMTYwLDcgQEAgZW51
bSBtZ2FfdHlwZSB7CiB9OwogCiAjZGVmaW5lIE1HQUcyMDBfVFlQRV9NQVNLCSgweDAwMDAwMGZm
KQorI2RlZmluZSBNR0FHMjAwX0ZMQUdfTUFTSwkoMHgwMGZmZmYwMCkKIAogI2RlZmluZSBJU19H
MjAwX1NFKG1kZXYpIChtZGV2LT50eXBlID09IEcyMDBfU0VfQSB8fCBtZGV2LT50eXBlID09IEcy
MDBfU0VfQikKIApAQCAtMTk1LDYgKzE5NiwxMyBAQCBtZ2FnMjAwX3R5cGVfZnJvbV9kcml2ZXJf
ZGF0YShrZXJuZWxfdWxvCiB7CiAJcmV0dXJuIChlbnVtIG1nYV90eXBlKShkcml2ZXJfZGF0YSAm
IE1HQUcyMDBfVFlQRV9NQVNLKTsKIH0KKworc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nCitt
Z2FnMjAwX2ZsYWdzX2Zyb21fZHJpdmVyX2RhdGEoa2VybmVsX3Vsb25nX3QgZHJpdmVyX2RhdGEp
Cit7CisJcmV0dXJuIGRyaXZlcl9kYXRhICYgTUdBRzIwMF9GTEFHX01BU0s7Cit9CisKIAkJCQkv
KiBtZ2FnMjAwX21vZGUuYyAqLwogaW50IG1nYWcyMDBfbW9kZXNldF9pbml0KHN0cnVjdCBtZ2Ff
ZGV2aWNlICptZGV2KTsKIHZvaWQgbWdhZzIwMF9tb2Rlc2V0X2Zpbmkoc3RydWN0IG1nYV9kZXZp
Y2UgKm1kZXYpOwotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21haW4uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21haW4uYwpAQCAtOTQsNiArOTQs
NyBAQCBzdGF0aWMgaW50IG1nYWcyMDBfZGV2aWNlX2luaXQoc3RydWN0IGRyCiAJc3RydWN0IG1n
YV9kZXZpY2UgKm1kZXYgPSBkZXYtPmRldl9wcml2YXRlOwogCWludCByZXQsIG9wdGlvbjsKIAor
CW1kZXYtPmZsYWdzID0gbWdhZzIwMF9mbGFnc19mcm9tX2RyaXZlcl9kYXRhKGZsYWdzKTsKIAlt
ZGV2LT50eXBlID0gbWdhZzIwMF90eXBlX2Zyb21fZHJpdmVyX2RhdGEoZmxhZ3MpOwogCiAJLyog
SGFyZGNvZGUgdGhlIG51bWJlciBvZiBDUlRDcyB0byAxICovCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
