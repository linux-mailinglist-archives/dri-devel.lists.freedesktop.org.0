Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4E510AB6F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 09:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD0A6E24E;
	Wed, 27 Nov 2019 08:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.HINET-IP.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTP id 951636E2C7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 09:58:14 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 26 Nov 2019 17:58:12 +0800
Received: from csbcas.internal.ite.com.tw (csbcas2.internal.ite.com.tw
 [192.168.65.47]) by mse.ite.com.tw with ESMTP id xAQ9w0kU081586;
 Tue, 26 Nov 2019 17:58:00 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from allen-VirtualBox.internal.ite.com.tw (192.168.70.14) by
 csbcas2.internal.ite.com.tw (192.168.65.45) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Tue, 26 Nov 2019 17:58:01 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH] drm/edid: fixup EDID 1.3 and 1.4 judge reduced-blanking
 timings logic
Date: Tue, 26 Nov 2019 17:46:12 +0800
Message-ID: <1574761572-26585-1-git-send-email-allen.chen@ite.com.tw>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.70.14]
X-MAIL: mse.ite.com.tw xAQ9w0kU081586
X-Mailman-Approved-At: Wed, 27 Nov 2019 08:09:16 +0000
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
Cc: Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Allen Chen <allen.chen@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Pi-Hsun Shih <pihsun@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIFZFU0EgRU5IQU5DRUQgRVhURU5ERUQgRElTUExBWSBJREVOVElGSUNBVElP
TiBEQVRBIFNUQU5EQVJECihEZWZpbmVzIEVESUQgU3RydWN0dXJlIFZlcnNpb24gMSwgUmV2aXNp
b24gNCkgcGFnZTogMzkKSG93IHRvIGRldGVybWluZSB3aGV0aGVyIHRoZSBtb25pdG9yIHN1cHBv
cnQgUkIgdGltaW5nIG9yIG5vdD8KRURJRCAxLjQKRmlyc3Q6ICByZWFkIGRldGFpbGVkIHRpbWlu
ZyBkZXNjcmlwdG9yIGFuZCBtYWtlIHN1cmUgYnl0ZSAwID0gMHgwMCwKCWJ5dGUgMSA9IDB4MDAs
IGJ5dGUgMiA9IDB4MDAgYW5kIGJ5dGUgMyA9IDB4RkQKU2Vjb25kOiByZWFkIEVESUQgYml0IDAg
aW4gZmVhdHVyZSBzdXBwb3J0IGJ5dGUgYXQgYWRkcmVzcyAxOGggPSAxCglhbmQgZGV0YWlsZWQg
dGltaW5nIGRlc2NyaXB0b3IgYnl0ZSAxMCA9IDB4MDQKVGhpcmQ6ICBpZiBFRElEIGJpdCAwIGlu
IGZlYXR1cmUgc3VwcG9ydCBieXRlID0gMSAmJgoJZGV0YWlsZWQgdGltaW5nIGRlc2NyaXB0b3Ig
Ynl0ZSAxMCA9IDB4MDQKCXRoZW4gd2UgY2FuIGNoZWNrIGJ5dGUgMTUsIGlmIGJpdCA0IGluIGJ5
dGUgMTUgPSAxIGlzIHN1cHBvcnQgUkIKICAgICAgICBpZiBFRElEIGJpdCAwIGluIGZlYXR1cmUg
c3VwcG9ydCBieXRlICE9IDEgfHwKCWRldGFpbGVkIHRpbWluZyBkZXNjcmlwdG9yIGJ5dGUgMTAg
IT0gMHgwNCwKCXRoZW4gYnl0ZSAxNSBjYW4gbm90IGJlIHVzZWQKClRoZSBsaW51eCBjb2RlIGlz
X3JiIGZ1bmN0aW9uIG5vdCBmb2xsb3cgdGhlIFZFU0EncyBydWxlCgpTaWduZWQtb2ZmLWJ5OiBB
bGxlbiBDaGVuIDxhbGxlbi5jaGVuQGl0ZS5jb20udHc+ClJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVz
dCByb2JvdCA8bGtwQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8
IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDMwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwppbmRleCBmNTky
NmJmLi5lMTFlNTg1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwpAQCAtOTMsNiArOTMsMTIgQEAgc3RydWN0IGRl
dGFpbGVkX21vZGVfY2xvc3VyZSB7CiAJaW50IG1vZGVzOwogfTsKIAorc3RydWN0IGVkaWRfc3Vw
cG9ydF9yYl9jbG9zdXJlIHsKKwlzdHJ1Y3QgZWRpZCAqZWRpZDsKKwlib29sIHZhbGlkX3N1cHBv
cnRfcmI7CisJYm9vbCBzdXBwb3J0X3JiOworfTsKKwogI2RlZmluZSBMRVZFTF9ETVQJMAogI2Rl
ZmluZSBMRVZFTF9HVEYJMQogI2RlZmluZSBMRVZFTF9HVEYyCTIKQEAgLTIwMTcsMjMgKzIwMjMs
NDEgQEAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmRybV9tb2RlX2ZpbmRfZG10KHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsCiAJfQogfQogCitzdGF0aWMgYm9vbAoraXNfZGlzcGxheV9kZXNjcmlw
dG9yKGNvbnN0IHU4ICpyLCB1OCB0YWcpCit7CisJcmV0dXJuICghclswXSAmJiAhclsxXSAmJiAh
clsyXSAmJiByWzNdID09IHRhZykgPyB0cnVlIDogZmFsc2U7Cit9CisKIHN0YXRpYyB2b2lkCiBp
c19yYihzdHJ1Y3QgZGV0YWlsZWRfdGltaW5nICp0LCB2b2lkICpkYXRhKQogewogCXU4ICpyID0g
KHU4ICopdDsKLQlpZiAoclszXSA9PSBFRElEX0RFVEFJTF9NT05JVE9SX1JBTkdFKQotCQlpZiAo
clsxNV0gJiAweDEwKQotCQkJKihib29sICopZGF0YSA9IHRydWU7CisJc3RydWN0IGVkaWRfc3Vw
cG9ydF9yYl9jbG9zdXJlICpjbG9zdXJlID0gZGF0YTsKKwlzdHJ1Y3QgZWRpZCAqZWRpZCA9IGNs
b3N1cmUtPmVkaWQ7CisKKwlpZiAoaXNfZGlzcGxheV9kZXNjcmlwdG9yKHIsIEVESURfREVUQUlM
X01PTklUT1JfUkFOR0UpKSB7CisJCWlmIChlZGlkLT5mZWF0dXJlcyAmIEJJVCgwKSAmJiByWzEw
XSA9PSBCSVQoMikpIHsKKwkJCWNsb3N1cmUtPnZhbGlkX3N1cHBvcnRfcmIgPSB0cnVlOworCQkJ
Y2xvc3VyZS0+c3VwcG9ydF9yYiA9IChyWzE1XSAmIDB4MTApID8gdHJ1ZSA6IGZhbHNlOworCQl9
CisJfQogfQogCiAvKiBFRElEIDEuNCBkZWZpbmVzIHRoaXMgZXhwbGljaXRseS4gIEZvciBFRElE
IDEuMywgd2UgZ3Vlc3MsIGJhZGx5LiAqLwogc3RhdGljIGJvb2wKIGRybV9tb25pdG9yX3N1cHBv
cnRzX3JiKHN0cnVjdCBlZGlkICplZGlkKQogeworCXN0cnVjdCBlZGlkX3N1cHBvcnRfcmJfY2xv
c3VyZSBjbG9zdXJlID0geworCQkuZWRpZCA9IGVkaWQsCisJCS52YWxpZF9zdXBwb3J0X3JiID0g
ZmFsc2UsCisJCS5zdXBwb3J0X3JiID0gZmFsc2UsCisJfTsKKwogCWlmIChlZGlkLT5yZXZpc2lv
biA+PSA0KSB7Ci0JCWJvb2wgcmV0ID0gZmFsc2U7Ci0JCWRybV9mb3JfZWFjaF9kZXRhaWxlZF9i
bG9jaygodTggKillZGlkLCBpc19yYiwgJnJldCk7Ci0JCXJldHVybiByZXQ7CisJCWRybV9mb3Jf
ZWFjaF9kZXRhaWxlZF9ibG9jaygodTggKillZGlkLCBpc19yYiwgJmNsb3N1cmUpOworCQlpZiAo
Y2xvc3VyZS52YWxpZF9zdXBwb3J0X3JiKQorCQkJcmV0dXJuIGNsb3N1cmUuc3VwcG9ydF9yYjsK
IAl9CiAKIAlyZXR1cm4gKChlZGlkLT5pbnB1dCAmIERSTV9FRElEX0lOUFVUX0RJR0lUQUwpICE9
IDApOwotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
