Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2687438598
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA0789A14;
	Fri,  7 Jun 2019 07:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863CA89780
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:22:29 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E7AB32000A;
 Thu,  6 Jun 2019 14:22:25 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 20/20] drm: rcar-du: kms: Update CMM in atomic commit tail
Date: Thu,  6 Jun 2019 16:22:20 +0200
Message-Id: <20190606142220.1392-21-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
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

VXBkYXRlIENNTSBzZXR0aW5ncyBhdCBpbiB0aGUgYXRvbWljIGNvbW1pdCB0YWlsIGhlbHBlciBt
ZXRob2QuCgpUaGUgQ01NIGlzIHVwZGF0ZWQgd2l0aCBuZXcgZ2FtbWEgdmFsdWVzIHByb3ZpZGVk
IHRvIHRoZSBkcml2ZXIKaW4gdGhlIEdBTU1BX0xVVCBibG9iIHByb3BlcnR5LgoKU2lnbmVkLW9m
Zi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMgfCAzNiArKysrKysrKysrKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfZHVfa21zLmMKaW5kZXggNWE5MTBhMDRlMWQ5Li4yOWEyMDIwYTQ2YjUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYwpAQCAtMjEsNiArMjEsNyBAQAogI2lu
Y2x1ZGUgPGxpbnV4L29mX3BsYXRmb3JtLmg+CiAjaW5jbHVkZSA8bGludXgvd2FpdC5oPgogCisj
aW5jbHVkZSAicmNhcl9jbW0uaCIKICNpbmNsdWRlICJyY2FyX2R1X2NydGMuaCIKICNpbmNsdWRl
ICJyY2FyX2R1X2Rydi5oIgogI2luY2x1ZGUgInJjYXJfZHVfZW5jb2Rlci5oIgpAQCAtMzY3LDYg
KzM2OCwzOCBAQCByY2FyX2R1X2ZiX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1
Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwKICAqIEF0b21pYyBDaGVjayBhbmQgVXBkYXRlCiAgKi8K
IAorc3RhdGljIHZvaWQgcmNhcl9kdV9hdG9taWNfY29tbWl0X3VwZGF0ZV9jbW0oc3RydWN0IGRy
bV9jcnRjICpjcnRjLAorCQkJCQkgICAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX3N0YXRl
KQoreworCXN0cnVjdCByY2FyX2R1X2NydGMgKnJjcnRjID0gdG9fcmNhcl9jcnRjKGNydGMpOwor
CXN0cnVjdCByY2FyX2NtbV9jb25maWcgY21tX2NvbmZpZyA9IHt9OworCisJaWYgKCFyY3J0Yy0+
Y21tIHx8ICFjcnRjLT5zdGF0ZS0+Y29sb3JfbWdtdF9jaGFuZ2VkKQorCQlyZXR1cm47CisKKwlp
ZiAoIWNydGMtPnN0YXRlLT5nYW1tYV9sdXQpIHsKKwkJY21tX2NvbmZpZy5sdXQuZW5hYmxlID0g
ZmFsc2U7CisJCXJjYXJfY21tX3NldHVwKHJjcnRjLT5jbW0sICZjbW1fY29uZmlnKTsKKworCQly
ZXR1cm47CisJfQorCisJY21tX2NvbmZpZy5sdXQuZW5hYmxlID0gdHJ1ZTsKKwljbW1fY29uZmln
Lmx1dC50YWJsZSA9IChzdHJ1Y3QgZHJtX2NvbG9yX2x1dCAqKQorCQkJICAgICAgIGNydGMtPnN0
YXRlLT5nYW1tYV9sdXQtPmRhdGE7CisKKwkvKiBTZXQgTFVUIHRhYmxlIHNpemUgdG8gMCBpZiBl
bnRyaWVzIHNob3VsZCBub3QgYmUgdXBkYXRlZC4gKi8KKwlpZiAoIW9sZF9zdGF0ZS0+Z2FtbWFf
bHV0IHx8CisJICAgIChvbGRfc3RhdGUtPmdhbW1hX2x1dC0+YmFzZS5pZCAhPQorCSAgICBjcnRj
LT5zdGF0ZS0+Z2FtbWFfbHV0LT5iYXNlLmlkKSkKKwkJY21tX2NvbmZpZy5sdXQuc2l6ZSA9IGNy
dGMtPnN0YXRlLT5nYW1tYV9sdXQtPmxlbmd0aAorCQkJCSAgICAvIHNpemVvZihjbW1fY29uZmln
Lmx1dC50YWJsZVswXSk7CisJZWxzZQorCQljbW1fY29uZmlnLmx1dC5zaXplID0gMDsKKworCXJj
YXJfY21tX3NldHVwKHJjcnRjLT5jbW0sICZjbW1fY29uZmlnKTsKK30KKwogc3RhdGljIGludCBy
Y2FyX2R1X2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQkJCXN0cnVjdCBk
cm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKIHsKQEAgLTQwOSw2ICs0NDIsOSBAQCBzdGF0aWMgdm9p
ZCByY2FyX2R1X2F0b21pY19jb21taXRfdGFpbChzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xk
X3N0YXRlKQogCQkJcmNkdS0+ZHBhZDFfc291cmNlID0gcmNydGMtPmluZGV4OwogCX0KIAorCWZv
cl9lYWNoX29sZF9jcnRjX2luX3N0YXRlKG9sZF9zdGF0ZSwgY3J0YywgY3J0Y19zdGF0ZSwgaSkK
KwkJcmNhcl9kdV9hdG9taWNfY29tbWl0X3VwZGF0ZV9jbW0oY3J0YywgY3J0Y19zdGF0ZSk7CisK
IAkvKiBBcHBseSB0aGUgYXRvbWljIHVwZGF0ZS4gKi8KIAlkcm1fYXRvbWljX2hlbHBlcl9jb21t
aXRfbW9kZXNldF9kaXNhYmxlcyhkZXYsIG9sZF9zdGF0ZSk7CiAJZHJtX2F0b21pY19oZWxwZXJf
Y29tbWl0X3BsYW5lcyhkZXYsIG9sZF9zdGF0ZSwKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
