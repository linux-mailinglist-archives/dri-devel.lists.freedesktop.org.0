Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4DE9C6C2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7571C89954;
	Mon, 26 Aug 2019 00:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCAD6E0FC
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 13:51:23 +0000 (UTC)
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 184EAC0003;
 Sun, 25 Aug 2019 13:51:18 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v3 14/14] drm: rcar-du: Force CMM enablement when resuming
Date: Sun, 25 Aug 2019 15:51:54 +0200
Message-Id: <20190825135154.11488-15-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:57 +0000
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
Cc: muroya@ksk.co.jp, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiByZXN1bWluZyBmcm9tIHN5c3RlbSBzdXNwZW5kLCB0aGUgRFUgZHJpdmVyIGlzIHJlc3Bv
bnNpYmxlIGZvcgpyZXByb2dyYW1taW5nIGFuZCBlbmFibGluZyB0aGUgQ01NIHVuaXQgaWYgaXQg
d2FzIGluIHVzZSBhdCB0aGUgdGltZQp0aGUgc3lzdGVtIGVudGVyZWQgdGhlIHN1c3BlbmQgc3Rh
dGUuCgpGb3JjZSB0aGUgY29sb3JfbWdtdF9jaGFuZ2VkIGZsYWcgdG8gdHJ1ZSBpZiBhbnkgb2Yg
dGhlIERSTSBjb2xvcgp0cmFuc2Zvcm1hdGlvbiBwcm9wZXJ0aWVzIHdhcyBzZXQgaW4gdGhlIENS
VEMgc3RhdGUgZHVwbGljYXRlZCBhdApzdXNwZW5kIHRpbWUsIGFzIHRoZSBDTU0gZ2V0cyByZXBy
b2dyYW1tZWQgb25seSBpZiBzYWlkIGZsYWcgaXMgYWN0aXZlIGluCnRoZSByY2FyX2R1X2F0b21p
Y19jb21taXRfdXBkYXRlX2NtbSgpIG1ldGhvZC4KClNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25k
aSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmNhci1k
dS9yY2FyX2R1X2Rydi5jIHwgMjEgKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMjEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfZHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5jCmlu
ZGV4IDAxODQ4MGE4ZjM1Yy4uNmUzODQ5NWZiNzhmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2R1X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3Jj
YXJfZHVfZHJ2LmMKQEAgLTE3LDYgKzE3LDcgQEAKICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAj
aW5jbHVkZSA8bGludXgvd2FpdC5oPgogCisjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWMuaD4KICNp
bmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2ZiX2Nt
YV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2ZiX2hlbHBlci5oPgpAQCAtNDgyLDYgKzQ4
MywyNiBAQCBzdGF0aWMgaW50IHJjYXJfZHVfcG1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYp
CiBzdGF0aWMgaW50IHJjYXJfZHVfcG1fcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlz
dHJ1Y3QgcmNhcl9kdV9kZXZpY2UgKnJjZHUgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKKwlzdHJ1
Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUgPSByY2R1LT5kZGV2LT5tb2RlX2NvbmZpZy5zdXNw
ZW5kX3N0YXRlOworCXVuc2lnbmVkIGludCBpOworCisJZm9yIChpID0gMDsgaSA8IHJjZHUtPm51
bV9jcnRjczsgKytpKSB7CisJCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9ICZyY2R1LT5jcnRjc1tp
XS5jcnRjOworCQlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGU7CisKKwkJY3J0Y19z
dGF0ZSA9IGRybV9hdG9taWNfZ2V0X2V4aXN0aW5nX2NydGNfc3RhdGUoc3RhdGUsIGNydGMpOwor
CQlpZiAoIWNydGNfc3RhdGUpCisJCQljb250aW51ZTsKKworCQkvKgorCQkgKiBGb3JjZSByZS1l
bmFibGVtZW50IG9mIENNTSBhZnRlciBzeXN0ZW0gcmVzdW1lIGlmIGFueQorCQkgKiBvZiB0aGUg
RFJNIGNvbG9yIHRyYW5zZm9ybWF0aW9uIHByb3BlcnRpZXMgd2FzIHNldCBpbgorCQkgKiB0aGUg
c3RhdGUgc2F2ZWQgYXQgc3lzdGVtIHN1c3BlbmQgdGltZS4KKwkJICovCisJCWlmIChjcnRjX3N0
YXRlLT5nYW1tYV9sdXQgfHwgY3J0Y19zdGF0ZS0+ZGVnYW1tYV9sdXQgfHwKKwkJICAgIGNydGNf
c3RhdGUtPmN0bSkKKwkJCWNydGNfc3RhdGUtPmNvbG9yX21nbXRfY2hhbmdlZCA9IHRydWU7CisJ
fQogCiAJcmV0dXJuIGRybV9tb2RlX2NvbmZpZ19oZWxwZXJfcmVzdW1lKHJjZHUtPmRkZXYpOwog
fQotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
