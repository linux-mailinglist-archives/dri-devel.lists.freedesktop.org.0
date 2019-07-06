Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2061AFD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDAB89A34;
	Mon,  8 Jul 2019 07:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB6F6E56E
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 14:07:29 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0F6B5C0004;
 Sat,  6 Jul 2019 14:07:25 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 19/19] drm: rcar-du: kms: Update CMM in atomic commit tail
Date: Sat,  6 Jul 2019 16:07:46 +0200
Message-Id: <20190706140746.29132-20-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
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
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMgfCAzNSArKysrKysrKysrKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfZHVfa21zLmMKaW5kZXggYjc5Y2RhMmY1NTMxLi5mOWFlY2U3OGNhNWYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYwpAQCAtMjEsNiArMjEsNyBAQAogI2lu
Y2x1ZGUgPGxpbnV4L29mX3BsYXRmb3JtLmg+CiAjaW5jbHVkZSA8bGludXgvd2FpdC5oPgogCisj
aW5jbHVkZSAicmNhcl9jbW0uaCIKICNpbmNsdWRlICJyY2FyX2R1X2NydGMuaCIKICNpbmNsdWRl
ICJyY2FyX2R1X2Rydi5oIgogI2luY2x1ZGUgInJjYXJfZHVfZW5jb2Rlci5oIgpAQCAtMjg3LDYg
KzI4OCwzNyBAQCByY2FyX2R1X2ZiX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1
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
bHV0IHx8CisJICAgIG9sZF9zdGF0ZS0+Z2FtbWFfbHV0LT5iYXNlLmlkICE9IGNydGMtPnN0YXRl
LT5nYW1tYV9sdXQtPmJhc2UuaWQpCisJCWNtbV9jb25maWcubHV0LnNpemUgPSBjcnRjLT5zdGF0
ZS0+Z2FtbWFfbHV0LT5sZW5ndGgKKwkJCQkgICAgLyBzaXplb2YoY21tX2NvbmZpZy5sdXQudGFi
bGVbMF0pOworCWVsc2UKKwkJY21tX2NvbmZpZy5sdXQuc2l6ZSA9IDA7CisKKwlyY2FyX2NtbV9z
ZXR1cChyY3J0Yy0+Y21tLCAmY21tX2NvbmZpZyk7Cit9CisKIHN0YXRpYyBpbnQgcmNhcl9kdV9h
dG9taWNfY2hlY2soc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJCQlzdHJ1Y3QgZHJtX2F0b21p
Y19zdGF0ZSAqc3RhdGUpCiB7CkBAIC0zMjksNiArMzYxLDkgQEAgc3RhdGljIHZvaWQgcmNhcl9k
dV9hdG9taWNfY29tbWl0X3RhaWwoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0ZSkK
IAkJCXJjZHUtPmRwYWQxX3NvdXJjZSA9IHJjcnRjLT5pbmRleDsKIAl9CiAKKwlmb3JfZWFjaF9v
bGRfY3J0Y19pbl9zdGF0ZShvbGRfc3RhdGUsIGNydGMsIGNydGNfc3RhdGUsIGkpCisJCXJjYXJf
ZHVfYXRvbWljX2NvbW1pdF91cGRhdGVfY21tKGNydGMsIGNydGNfc3RhdGUpOworCiAJLyogQXBw
bHkgdGhlIGF0b21pYyB1cGRhdGUuICovCiAJZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X21vZGVz
ZXRfZGlzYWJsZXMoZGV2LCBvbGRfc3RhdGUpOwogCWRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9w
bGFuZXMoZGV2LCBvbGRfc3RhdGUsCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
