Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964DCECBB6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 23:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370FC6F897;
	Fri,  1 Nov 2019 22:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 586 seconds by postgrey-1.36 at gabe;
 Fri, 01 Nov 2019 08:15:16 UTC
Received: from ironport.ite.com.tw (60-251-196-230.HINET-IP.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5259B6F774
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 08:15:16 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 01 Nov 2019 16:05:28 +0800
Received: from csbcas.internal.ite.com.tw (csbcas1.internal.ite.com.tw
 [192.168.65.46]) by mse.ite.com.tw with ESMTP id xA185M3K074232;
 Fri, 1 Nov 2019 16:05:22 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from allen-VirtualBox.internal.ite.com.tw (192.168.70.14) by
 csbcas1.internal.ite.com.tw (192.168.65.45) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Fri, 1 Nov 2019 16:05:22 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH] drm/edid: fixup EDID 1.3 and 1.4 judge reduced-blanking
 timings logic
Date: Fri, 1 Nov 2019 16:04:22 +0800
Message-ID: <1572595463-30970-1-git-send-email-allen.chen@ite.com.tw>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.70.14]
X-MAIL: mse.ite.com.tw xA185M3K074232
X-Mailman-Approved-At: Fri, 01 Nov 2019 22:51:09 +0000
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
ZyBkZXNjcmlwdG9yIGFuZCBtYWtlIHN1cmUgYnl0ZTAgPSAwLAoJYnl0ZTEgPSAwLCBieXRlMiA9
IDAgYW5kIGJ5dGUzID0gMHhGRApTZWNvbmQ6IHJlYWQgZGV0YWlsZWQgdGltaW5nIGRlc2NyaXB0
b3IgYnl0ZTEwID0gMHgwNCBhbmQKCUVESUQgYnl0ZTE4aCBiaXQwID0gMQpUaGlyZDogIGlmIEVE
SUQgYnl0ZTE4aCBiaXQwID09IDEgJiYgYnl0ZTEwID09IDB4MDQsCgl0aGVuIHdlIGNhbiBjaGVj
ayBieXRlMTUsIGlmIGJ5dGUxNSBiaXQ0ID0xIGlzIHN1cHBvcnQgUkIKICAgICAgICBpZiBFRElE
IGJ5dGUxOGggYml0MCAhPSAxIHx8IGJ5dGUxMCAhPSAweDA0LAoJdGhlbiBieXRlMTUgY2FuIG5v
dCBiZSB1c2VkCgpUaGUgbGludXggY29kZSBpc19yYiBmdW5jdGlvbiBub3QgZm9sbG93IHRoZSBW
RVNBJ3MgcnVsZQoKRURJRCAxLjMKTENE4oCCZmxhdOKAgnBhbmVscyBkb+KAgm5vdOKAgnJlcXVp
cmXigIJsb25n4oCCYmxhbmtpbmfigIJpbnRlcnZhbHPigIJhc+KAgmHigIJyZXRyYWNlCnBlcmlv
ZCBzbyBkZWZhdWx0IHN1cHBvcnQgcmVkdWNlZC1ibGFua2luZyB0aW1pbmdzLgoKU2lnbmVkLW9m
Zi1ieTogQWxsZW4gQ2hlbiA8YWxsZW4uY2hlbkBpdGUuY29tLnR3PgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZWRpZC5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwpp
bmRleCBlNWU3ZTY1Li4wOGU5MTRkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Vk
aWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwpAQCAtOTMsNiArOTMsMTEgQEAg
c3RydWN0IGRldGFpbGVkX21vZGVfY2xvc3VyZSB7CiAJaW50IG1vZGVzOwogfTsKIAorc3RydWN0
IGVkaWRfc3VwcG9ydF9yYl9jbG9zdXJlIHsKKwlzdHJ1Y3QgZWRpZCAqZWRpZDsKKwl1OCBzdXBw
b3J0X3JiOworfTsKKwogI2RlZmluZSBMRVZFTF9ETVQJMAogI2RlZmluZSBMRVZFTF9HVEYJMQog
I2RlZmluZSBMRVZFTF9HVEYyCTIKQEAgLTIwMTgsMjIgKzIwMjMsMzEgQEAgc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKmRybV9tb2RlX2ZpbmRfZG10KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiBp
c19yYihzdHJ1Y3QgZGV0YWlsZWRfdGltaW5nICp0LCB2b2lkICpkYXRhKQogewogCXU4ICpyID0g
KHU4ICopdDsKLQlpZiAoclszXSA9PSBFRElEX0RFVEFJTF9NT05JVE9SX1JBTkdFKQotCQlpZiAo
clsxNV0gJiAweDEwKQotCQkJKihib29sICopZGF0YSA9IHRydWU7CisJc3RydWN0IGVkaWRfc3Vw
cG9ydF9yYl9jbG9zdXJlICpjbG9zdXJlID0gZGF0YTsKKwlzdHJ1Y3QgZWRpZCAqZWRpZCA9IGNs
b3N1cmUtPmVkaWQ7CisKKwlpZiAoIXJbMF0gJiYgIXJbMV0gJiYgIXJbMl0gJiYgclszXSA9PSBF
RElEX0RFVEFJTF9NT05JVE9SX1JBTkdFKSB7CisJCWlmIChlZGlkLT5mZWF0dXJlcyAmIEJJVCgw
KSAmJiByWzEwXSA9PSBCSVQoMikpCisJCQljbG9zdXJlLT5zdXBwb3J0X3JiID0gKHJbMTVdICYg
MHgxMCkgPyAxIDogMDsKKwl9CiB9CiAKIC8qIEVESUQgMS40IGRlZmluZXMgdGhpcyBleHBsaWNp
dGx5LiAgRm9yIEVESUQgMS4zLCB3ZSBndWVzcywgYmFkbHkuICovCiBzdGF0aWMgYm9vbAogZHJt
X21vbml0b3Jfc3VwcG9ydHNfcmIoc3RydWN0IGVkaWQgKmVkaWQpCiB7CisJc3RydWN0IGVkaWRf
c3VwcG9ydF9yYl9jbG9zdXJlIGNsb3N1cmUgPSB7CisJCS5lZGlkID0gZWRpZCwKKwkJLnN1cHBv
cnRfcmIgPSAtMSwKKwl9OworCiAJaWYgKGVkaWQtPnJldmlzaW9uID49IDQpIHsKLQkJYm9vbCBy
ZXQgPSBmYWxzZTsKLQkJZHJtX2Zvcl9lYWNoX2RldGFpbGVkX2Jsb2NrKCh1OCAqKWVkaWQsIGlz
X3JiLCAmcmV0KTsKLQkJcmV0dXJuIHJldDsKKwkJZHJtX2Zvcl9lYWNoX2RldGFpbGVkX2Jsb2Nr
KCh1OCAqKWVkaWQsIGlzX3JiLCAmY2xvc3VyZSk7CisJCWlmIChjbG9zdXJlLnN1cHBvcnRfcmIg
Pj0gMCkKKwkJCXJldHVybiBjbG9zdXJlLnN1cHBvcnRfcmI7CiAJfQogCi0JcmV0dXJuICgoZWRp
ZC0+aW5wdXQgJiBEUk1fRURJRF9JTlBVVF9ESUdJVEFMKSAhPSAwKTsKKwlyZXR1cm4gdHJ1ZTsK
IH0KIAogc3RhdGljIHZvaWQKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
