Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D2715349
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 20:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B849889B96;
	Mon,  6 May 2019 18:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E2489B65;
 Mon,  6 May 2019 18:02:10 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52392
 helo=localhost.localdomain)
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hNhwG-0007OJ-Ue; Mon, 06 May 2019 20:02:08 +0200
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 04/11] drm/fb-helper: Remove drm_fb_helper_crtc->{x, y,
 desired_mode}
Date: Mon,  6 May 2019 20:01:32 +0200
Message-Id: <20190506180139.6913-5-noralf@tronnes.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506180139.6913-1-noralf@tronnes.org>
References: <20190506180139.6913-1-noralf@tronnes.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=Tsm1UgFeF7KHBx62tpF8IwClMs5Yznc4UqwSzb9hn8I=; 
 b=KpUJUW/LJsSj55TXsuf7Hfo0/W77guQeEl3tDtRRzDXdErGM8uWAZgrj0mvTAa+sC7RQmuzAcuhy3A9eYZ0yypMDmnEzBvuzjF5oY3ma8d2IFGEG9cr15aInNbDi8aOlRd5HhXHu+vK6X/oBMI8cZj6yT0yFXX9DuSR1mcr8qXoUpXPQH6MfhNnX7MzndPIWTMWlH2b6ryrLGrlb6xWV73ya90UaeUlAa0LxgwGT2JRwUErlq0jRKPPytrHUZDnJSnriVvGBG8c2dYTI/XkpOFbwc2WSIC/9OKE2pTdCSZc2/dkByRLjsFbWTpqpuPHz/1ulOTBrNSnegxcvqJyG4A==;
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHZhbHVlcyBhcmUgYWxyZWFkeSBwcmVzZW50IGluIHRoZSBtb2Rlc2V0LgoKVGhpcyBpcyBk
b25lIGluIHByZXBhcmF0aW9uIGZvciB0aGUgcmVtb3ZhbCBvZiBzdHJ1Y3QgZHJtX2ZiX2hlbHBl
cl9jcnRjLgoKU2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5v
cmc+ClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpS
ZXZpZXdlZC1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIHwgMTIgKysrKy0tLS0tLS0tCiBpbmNs
dWRlL2RybS9kcm1fZmJfaGVscGVyLmggICAgIHwgIDIgLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwppbmRl
eCA2NDY1MGJiMmE0NmIuLmFmMmU3NGM3NDJhNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9mYl9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCkBA
IC0yMDMxLDE2ICsyMDMxLDE2IEBAIHN0YXRpYyBpbnQgZHJtX2ZiX2hlbHBlcl9zaW5nbGVfZmJf
cHJvYmUoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwKIAkJICovCiAJCWJvb2wgbGFz
dHYgPSB0cnVlLCBsYXN0aCA9IHRydWU7CiAKLQkJZGVzaXJlZF9tb2RlID0gZmJfaGVscGVyLT5j
cnRjX2luZm9baV0uZGVzaXJlZF9tb2RlOwogCQltb2RlX3NldCA9ICZmYl9oZWxwZXItPmNydGNf
aW5mb1tpXS5tb2RlX3NldDsKKwkJZGVzaXJlZF9tb2RlID0gbW9kZV9zZXQtPm1vZGU7CiAKIAkJ
aWYgKCFkZXNpcmVkX21vZGUpCiAJCQljb250aW51ZTsKIAogCQljcnRjX2NvdW50Kys7CiAKLQkJ
eCA9IGZiX2hlbHBlci0+Y3J0Y19pbmZvW2ldLng7Ci0JCXkgPSBmYl9oZWxwZXItPmNydGNfaW5m
b1tpXS55OworCQl4ID0gbW9kZV9zZXQtPng7CisJCXkgPSBtb2RlX3NldC0+eTsKIAogCQlzaXpl
cy5zdXJmYWNlX3dpZHRoICA9IG1heF90KHUzMiwgZGVzaXJlZF9tb2RlLT5oZGlzcGxheSArIHgs
IHNpemVzLnN1cmZhY2Vfd2lkdGgpOwogCQlzaXplcy5zdXJmYWNlX2hlaWdodCA9IG1heF90KHUz
MiwgZGVzaXJlZF9tb2RlLT52ZGlzcGxheSArIHksIHNpemVzLnN1cmZhY2VfaGVpZ2h0KTsKQEAg
LTI4MTQsMTEgKzI4MTQsNyBAQCBzdGF0aWMgdm9pZCBkcm1fc2V0dXBfY3J0Y3Moc3RydWN0IGRy
bV9mYl9oZWxwZXIgKmZiX2hlbHBlciwKIAkJCURSTV9ERUJVR19LTVMoImRlc2lyZWQgbW9kZSAl
cyBzZXQgb24gY3J0YyAlZCAoJWQsJWQpXG4iLAogCQkJCSAgICAgIG1vZGUtPm5hbWUsIGZiX2Ny
dGMtPm1vZGVfc2V0LmNydGMtPmJhc2UuaWQsIG9mZnNldC0+eCwgb2Zmc2V0LT55KTsKIAotCQkJ
ZmJfY3J0Yy0+ZGVzaXJlZF9tb2RlID0gbW9kZTsKLQkJCWZiX2NydGMtPnggPSBvZmZzZXQtPng7
Ci0JCQlmYl9jcnRjLT55ID0gb2Zmc2V0LT55OwotCQkJbW9kZXNldC0+bW9kZSA9IGRybV9tb2Rl
X2R1cGxpY2F0ZShkZXYsCi0JCQkJCQkJICAgZmJfY3J0Yy0+ZGVzaXJlZF9tb2RlKTsKKwkJCW1v
ZGVzZXQtPm1vZGUgPSBkcm1fbW9kZV9kdXBsaWNhdGUoZGV2LCBtb2RlKTsKIAkJCWRybV9jb25u
ZWN0b3JfZ2V0KGNvbm5lY3Rvcik7CiAJCQltb2Rlc2V0LT5jb25uZWN0b3JzW21vZGVzZXQtPm51
bV9jb25uZWN0b3JzKytdID0gY29ubmVjdG9yOwogCQkJbW9kZXNldC0+eCA9IG9mZnNldC0+eDsK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2Ry
bV9mYl9oZWxwZXIuaAppbmRleCBiMGExNGFlZjJlMzkuLjJhZjFjNmQzZTE0NyAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9mYl9o
ZWxwZXIuaApAQCAtNDksOCArNDksNiBAQCBzdHJ1Y3QgZHJtX2ZiX29mZnNldCB7CiAKIHN0cnVj
dCBkcm1fZmJfaGVscGVyX2NydGMgewogCXN0cnVjdCBkcm1fbW9kZV9zZXQgbW9kZV9zZXQ7Ci0J
c3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmRlc2lyZWRfbW9kZTsKLQlpbnQgeCwgeTsKIH07CiAK
IC8qKgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
