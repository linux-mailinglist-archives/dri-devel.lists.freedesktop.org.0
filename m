Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81D3BB452
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC236E8BA;
	Mon, 23 Sep 2019 12:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFFD6E8BA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:52:24 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.128])
 by regular1.263xmail.com (Postfix) with ESMTP id 773B922F;
 Mon, 23 Sep 2019 20:52:22 +0800 (CST)
X-263anti-spam: KSV:0;BIG:0;
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-KSVirus-check: 0
X-ADDR-CHECKED4: 1
X-ABS-CHECKED: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P15436T140160991741696S1569243121384240_; 
 Mon, 23 Sep 2019 20:52:21 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <100cee606d44a935076a63a8b3b5c1cb>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>, Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 23/36] drm/cirrus: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:51:46 +0800
Message-Id: <1569243119-183293-3-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569243119-183293-1-git-send-email-hjc@rock-chips.com>
References: <1569243119-183293-1-git-send-email-hjc@rock-chips.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9jaXJydXMvY2lycnVzLmMgfCAxMCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9jaXJydXMvY2lycnVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jCmlu
ZGV4IDg5ZDllNmYuLmJhNDdmZGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMv
Y2lycnVzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYwpAQCAtMTIxLDcg
KzEyMSw3IEBAIHN0YXRpYyB2b2lkIHdyZWdfaGRyKHN0cnVjdCBjaXJydXNfZGV2aWNlICpjaXJy
dXMsIHU4IHZhbCkKIAogc3RhdGljIGludCBjaXJydXNfY29udmVydF90byhzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyICpmYikKIHsKLQlpZiAoZmItPmZvcm1hdC0+Y3BwWzBdID09IDQgJiYgZmItPnBp
dGNoZXNbMF0gPiBDSVJSVVNfTUFYX1BJVENIKSB7CisJaWYgKGZiLT5mb3JtYXQtPmJwcFswXSA9
PSAzMiAmJiBmYi0+cGl0Y2hlc1swXSA+IENJUlJVU19NQVhfUElUQ0gpIHsKIAkJaWYgKGZiLT53
aWR0aCAqIDMgPD0gQ0lSUlVTX01BWF9QSVRDSCkKIAkJCS8qIGNvbnZlcnQgZnJvbSBYUjI0IHRv
IFJHMjQgKi8KIAkJCXJldHVybiAzOwpAQCAtMTM4LDcgKzEzOCw3IEBAIHN0YXRpYyBpbnQgY2ly
cnVzX2NwcChzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYikKIAogCWlmIChjb252ZXJ0X2NwcCkK
IAkJcmV0dXJuIGNvbnZlcnRfY3BwOwotCXJldHVybiBmYi0+Zm9ybWF0LT5jcHBbMF07CisJcmV0
dXJuIGZiLT5mb3JtYXQtPmJwcFswXSAvIDg7CiB9CiAKIHN0YXRpYyBpbnQgY2lycnVzX3BpdGNo
KHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiKQpAQCAtMzA2LDE2ICszMDYsMTYgQEAgc3RhdGlj
IGludCBjaXJydXNfZmJfYmxpdF9yZWN0KHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLAogCWlm
ICghdm1hcCkKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQlpZiAoY2lycnVzLT5jcHAgPT0gZmItPmZv
cm1hdC0+Y3BwWzBdKQorCWlmIChjaXJydXMtPmNwcCA9PSBmYi0+Zm9ybWF0LT5icHBbMF0gLyA4
KQogCQlkcm1fZmJfbWVtY3B5X2RzdGNsaXAoY2lycnVzLT52cmFtLAogCQkJCSAgICAgIHZtYXAs
IGZiLCByZWN0KTsKIAotCWVsc2UgaWYgKGZiLT5mb3JtYXQtPmNwcFswXSA9PSA0ICYmIGNpcnJ1
cy0+Y3BwID09IDIpCisJZWxzZSBpZiAoZmItPmZvcm1hdC0+YnBwWzBdID09IDMyICYmIGNpcnJ1
cy0+Y3BwID09IDIpCiAJCWRybV9mYl94cmdiODg4OF90b19yZ2I1NjVfZHN0Y2xpcChjaXJydXMt
PnZyYW0sCiAJCQkJCQkgIGNpcnJ1cy0+cGl0Y2gsCiAJCQkJCQkgIHZtYXAsIGZiLCByZWN0LCBm
YWxzZSk7CiAKLQllbHNlIGlmIChmYi0+Zm9ybWF0LT5jcHBbMF0gPT0gNCAmJiBjaXJydXMtPmNw
cCA9PSAzKQorCWVsc2UgaWYgKGZiLT5mb3JtYXQtPmJwcFswXSA9PSAzMiAmJiBjaXJydXMtPmNw
cCA9PSAzKQogCQlkcm1fZmJfeHJnYjg4ODhfdG9fcmdiODg4X2RzdGNsaXAoY2lycnVzLT52cmFt
LAogCQkJCQkJICBjaXJydXMtPnBpdGNoLAogCQkJCQkJICB2bWFwLCBmYiwgcmVjdCk7Ci0tIAoy
LjcuNAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
