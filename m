Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F6C9C6C8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF0E89A4E;
	Mon, 26 Aug 2019 00:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F33D6E102
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 13:51:20 +0000 (UTC)
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BFBABC000B;
 Sun, 25 Aug 2019 13:51:15 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v3 13/14] drm: rcar-du: kms: Update CMM in atomic commit tail
Date: Sun, 25 Aug 2019 15:51:53 +0200
Message-Id: <20190825135154.11488-14-jacopo+renesas@jmondi.org>
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
 Harsha.ManjulaMallikarjun@in.bosch.com, Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXBkYXRlIENNTSBzZXR0aW5ncyBhdCBpbiB0aGUgYXRvbWljIGNvbW1pdCB0YWlsIGhlbHBlciBt
ZXRob2QuCgpUaGUgQ01NIGlzIHVwZGF0ZWQgd2l0aCBuZXcgZ2FtbWEgdmFsdWVzIHByb3ZpZGVk
IHRvIHRoZSBkcml2ZXIKaW4gdGhlIEdBTU1BX0xVVCBibG9iIHByb3BlcnR5LgoKUmV2aWV3ZWQt
Ynk6IFVscmljaCBIZWNodCA8dWxpK3JlbmVzYXNAZnBvbmQuZXU+ClJldmlld2VkLWJ5OiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jIHwgMzUgKysrKysrKysrKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0v
cmNhci1kdS9yY2FyX2R1X2ttcy5jCmluZGV4IDYxY2ExZDNjMzc5YS4uMDQ3ZmRiOTgyYTExIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMKQEAgLTIyLDYgKzIyLDcgQEAKICNp
bmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPgogI2luY2x1ZGUgPGxpbnV4L3dhaXQuaD4KIAor
I2luY2x1ZGUgInJjYXJfY21tLmgiCiAjaW5jbHVkZSAicmNhcl9kdV9jcnRjLmgiCiAjaW5jbHVk
ZSAicmNhcl9kdV9kcnYuaCIKICNpbmNsdWRlICJyY2FyX2R1X2VuY29kZXIuaCIKQEAgLTM2OCw2
ICszNjksMzcgQEAgcmNhcl9kdV9mYl9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3Ry
dWN0IGRybV9maWxlICpmaWxlX3ByaXYsCiAgKiBBdG9taWMgQ2hlY2sgYW5kIFVwZGF0ZQogICov
CiAKK3N0YXRpYyB2b2lkIHJjYXJfZHVfYXRvbWljX2NvbW1pdF91cGRhdGVfY21tKHN0cnVjdCBk
cm1fY3J0YyAqY3J0YywKKwkJCQkJICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9sZF9zdGF0
ZSkKK3sKKwlzdHJ1Y3QgcmNhcl9kdV9jcnRjICpyY3J0YyA9IHRvX3JjYXJfY3J0YyhjcnRjKTsK
KwlzdHJ1Y3QgcmNhcl9jbW1fY29uZmlnIGNtbV9jb25maWcgPSB7fTsKKworCWlmICghcmNydGMt
PmNtbSB8fCAhY3J0Yy0+c3RhdGUtPmNvbG9yX21nbXRfY2hhbmdlZCkKKwkJcmV0dXJuOworCisJ
aWYgKCFjcnRjLT5zdGF0ZS0+Z2FtbWFfbHV0KSB7CisJCWNtbV9jb25maWcubHV0LmVuYWJsZSA9
IGZhbHNlOworCQlyY2FyX2NtbV9zZXR1cChyY3J0Yy0+Y21tLCAmY21tX2NvbmZpZyk7CisKKwkJ
cmV0dXJuOworCX0KKworCWNtbV9jb25maWcubHV0LmVuYWJsZSA9IHRydWU7CisJY21tX2NvbmZp
Zy5sdXQudGFibGUgPSAoc3RydWN0IGRybV9jb2xvcl9sdXQgKikKKwkJCSAgICAgICBjcnRjLT5z
dGF0ZS0+Z2FtbWFfbHV0LT5kYXRhOworCisJLyogU2V0IExVVCB0YWJsZSBzaXplIHRvIDAgaWYg
ZW50cmllcyBzaG91bGQgbm90IGJlIHVwZGF0ZWQuICovCisJaWYgKCFvbGRfc3RhdGUtPmdhbW1h
X2x1dCB8fAorCSAgICBvbGRfc3RhdGUtPmdhbW1hX2x1dC0+YmFzZS5pZCAhPSBjcnRjLT5zdGF0
ZS0+Z2FtbWFfbHV0LT5iYXNlLmlkKQorCQljbW1fY29uZmlnLmx1dC5zaXplID0gY3J0Yy0+c3Rh
dGUtPmdhbW1hX2x1dC0+bGVuZ3RoCisJCQkJICAgIC8gc2l6ZW9mKGNtbV9jb25maWcubHV0LnRh
YmxlWzBdKTsKKwllbHNlCisJCWNtbV9jb25maWcubHV0LnNpemUgPSAwOworCisJcmNhcl9jbW1f
c2V0dXAocmNydGMtPmNtbSwgJmNtbV9jb25maWcpOworfQorCiBzdGF0aWMgaW50IHJjYXJfZHVf
YXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCQkJc3RydWN0IGRybV9hdG9t
aWNfc3RhdGUgKnN0YXRlKQogewpAQCAtNDEwLDYgKzQ0Miw5IEBAIHN0YXRpYyB2b2lkIHJjYXJf
ZHVfYXRvbWljX2NvbW1pdF90YWlsKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpvbGRfc3RhdGUp
CiAJCQlyY2R1LT5kcGFkMV9zb3VyY2UgPSByY3J0Yy0+aW5kZXg7CiAJfQogCisJZm9yX2VhY2hf
b2xkX2NydGNfaW5fc3RhdGUob2xkX3N0YXRlLCBjcnRjLCBjcnRjX3N0YXRlLCBpKQorCQlyY2Fy
X2R1X2F0b21pY19jb21taXRfdXBkYXRlX2NtbShjcnRjLCBjcnRjX3N0YXRlKTsKKwogCS8qIEFw
cGx5IHRoZSBhdG9taWMgdXBkYXRlLiAqLwogCWRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9tb2Rl
c2V0X2Rpc2FibGVzKGRldiwgb2xkX3N0YXRlKTsKIAlkcm1fYXRvbWljX2hlbHBlcl9jb21taXRf
cGxhbmVzKGRldiwgb2xkX3N0YXRlLAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
