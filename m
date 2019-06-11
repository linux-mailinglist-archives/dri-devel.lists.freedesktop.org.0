Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C9A41CCF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCB7892B0;
	Wed, 12 Jun 2019 06:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0755189179
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 11:09:48 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:35468 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1haeXy-0004mY-AR; Tue, 11 Jun 2019 12:02:34 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1haeXs-0001yn-LP; Tue, 11 Jun 2019 12:02:28 +0100
In-Reply-To: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Sven Van Asbroeck <thesven73@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>
Subject: [PATCH 11/13] drm/i2c: tda998x: add support for pixel repeated modes
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1haeXs-0001yn-LP@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Jun 2019 12:02:28 +0100
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r8zCBcllMSISqSO7+dVxuICDI8xRiXxC8Jt9yA0qdGc=; b=Ng6VPSv7W7OKtJljQ+OxfmjGEk
 bBc0KEdWXoVXO9W3Ncu6hfYJSOBQRzsEX173ScP95cZtB07UREBktPekULKuNWGD5SgRMTis/Xb8m
 fjhyF4+dF8Z4Gn9CQJJOxUwOUs/btWyFLlT9IHqt6EZdaz1o6Y36Qf1AO6f0AjnoGjw/YD3G7iWcW
 WfuVl5pYKsgrDfoyuRXiee9Ab3c/muE0NE6TTZxIRf3ir8+B5Q9gR4mkEvm9t+WKjvTgphKY2yO9U
 loUk3eq/4YDB/kbSSd8/ahulJpJXzGvDJ/fbefNBn2auF5E3M2JDkY0l7nOUNNP2qKIRRUqYFZ170
 6A4lTuTw==;
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VERBOTk4eCBoYXMgbm8gc3VwcG9ydCBmb3IgcGl4ZWwgcmVwZWF0ZWQgbW9kZXMsIGFuZCB0aGUg
Y29kZSBub3RlcyB0aGlzCmFzIGEgIlRPRE8iIGl0ZW0uICBUaGUgaW1wbGVtZW50YXRpb24gYXBw
ZWFycyB0byBiZSByZWxhdGl2ZWx5IHNpbXBsZSwKc28gbGV0cyBhZGQgaXQuCgpXZSBuZWVkIHRv
IGNhbGN1bGF0ZSB0aGUgc2VyaWFsaXplciBjbG9jayBkaXZpc29yIGJhc2VkIG9uIHRoZSBUTURT
CmNsb2NrIHJhdGUsIHNldCB0aGUgcmVwZWF0IGNvbnRyb2wsIGFuZCBzZXQgdGhlIHNlcmlhbGl6
ZXIgcGl4ZWwKcmVwZWF0IGNvdW50LiAgU2luY2UgdGhlIGF1ZGlvIGNvZGUgbmVlZHMgdGhlIGFj
dHVhbCBUTURTIGNsb2NrLApyZWNvcmQgdGhhdC4KClNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2lu
ZyA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2kyYy90
ZGE5OTh4X2Rydi5jIHwgMjYgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxNiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5
OHhfZHJ2LmMKaW5kZXggNzgzY2JjOWM5N2IyLi40MTc5NDlmYzY5ZDEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTJj
L3RkYTk5OHhfZHJ2LmMKQEAgLTI1OCw2ICsyNTgsNyBAQCBzdHJ1Y3QgdGRhOTk4eF9wcml2IHsK
ICMgZGVmaW5lIEhWRl9DTlRSTF8xX1BBRCh4KSAgICAgICAoKCh4KSAmIDMpIDw8IDQpCiAjIGRl
ZmluZSBIVkZfQ05UUkxfMV9TRU1JX1BMQU5BUiAgKDEgPDwgNikKICNkZWZpbmUgUkVHX1JQVF9D
TlRSTCAgICAgICAgICAgICBSRUcoMHgwMCwgMHhmMCkgICAgIC8qIHdyaXRlICovCisjIGRlZmlu
ZSBSUFRfQ05UUkxfUkVQRUFUKHgpICAgICAgKCh4KSAmIDE1KQogI2RlZmluZSBSRUdfSTJTX0ZP
Uk1BVCAgICAgICAgICAgIFJFRygweDAwLCAweGZjKSAgICAgLyogcmVhZC93cml0ZSAqLwogIyBk
ZWZpbmUgSTJTX0ZPUk1BVF9QSElMSVBTICAgICAgICgwIDw8IDApCiAjIGRlZmluZSBJMlNfRk9S
TUFUX0xFRlRfSiAgICAgICAgKDIgPDwgMCkKQEAgLTE0MjMsNyArMTQyNCw3IEBAIHN0YXRpYyB2
b2lkIHRkYTk5OHhfYnJpZGdlX21vZGVfc2V0KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCiAJ
dTE2IHZ3aW4xX2xpbmVfcywgdndpbjFfbGluZV9lOwogCXUxNiB2d2luMl9saW5lX3MsIHZ3aW4y
X2xpbmVfZTsKIAl1MTYgZGVfcGl4X3MsIGRlX3BpeF9lOwotCXU4IHJlZywgZGl2LCByZXA7CisJ
dTggcmVnLCBkaXYsIHJlcCwgc2VsX2NsazsKIAogCS8qCiAJICogSW50ZXJuYWxseSBUREE5OTh4
IGlzIHVzaW5nIElUVS1SIEJULjY1NiBzdHlsZSBzeW5jIGJ1dApAQCAtMTQ4Niw3ICsxNDg3LDE2
IEBAIHN0YXRpYyB2b2lkIHRkYTk5OHhfYnJpZGdlX21vZGVfc2V0KHN0cnVjdCBkcm1fYnJpZGdl
ICpicmlkZ2UsCiAJCQkgICAgICAgKG1vZGUtPnZzeW5jX2VuZCAtIG1vZGUtPnZzeW5jX3N0YXJ0
KS8yOwogCX0KIAotCXRtZHNfY2xvY2sgPSBtb2RlLT5jbG9jazsKKwkvKgorCSAqIFNlbGVjdCBw
aXhlbCByZXBlYXQgZGVwZW5kaW5nIG9uIHRoZSBkb3VibGUtY2xvY2sgZmxhZworCSAqICh3aGlj
aCBtZWFucyB3ZSBoYXZlIHRvIHJlcGVhdCBlYWNoIHBpeGVsIG9uY2UuKQorCSAqLworCXJlcCA9
IG1vZGUtPmZsYWdzICYgRFJNX01PREVfRkxBR19EQkxDTEsgPyAxIDogMDsKKwlzZWxfY2xrID0g
U0VMX0NMS19FTkFfU0NfQ0xLIHwgU0VMX0NMS19TRUxfQ0xLMSB8CisJCSAgU0VMX0NMS19TRUxf
VlJGX0NMSyhyZXAgPyAyIDogMCk7CisKKwkvKiB0aGUgVE1EUyBjbG9jayBpcyBzY2FsZWQgdXAg
YnkgdGhlIHBpeGVsIHJlcGVhdCAqLworCXRtZHNfY2xvY2sgPSBtb2RlLT5jbG9jayAqICgxICsg
cmVwKTsKIAogCS8qCiAJICogVGhlIGRpdmlzb3IgaXMgcG93ZXItb2YtMi4gVGhlIFREQTk5ODNC
IGRhdGFzaGVldCBnaXZlcwpAQCAtMTUwMiw2ICsxNTEyLDggQEAgc3RhdGljIHZvaWQgdGRhOTk4
eF9icmlkZ2VfbW9kZV9zZXQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKIAogCW11dGV4X2xv
Y2soJnByaXYtPmF1ZGlvX211dGV4KTsKIAorCXByaXYtPnRtZHNfY2xvY2sgPSB0bWRzX2Nsb2Nr
OworCiAJLyogbXV0ZSB0aGUgYXVkaW8gRklGTzogKi8KIAlyZWdfc2V0KHByaXYsIFJFR19BSVBf
Q05UUkxfMCwgQUlQX0NOVFJMXzBfUlNUX0ZJRk8pOwogCkBAIC0xNTI0LDEyICsxNTM2LDggQEAg
c3RhdGljIHZvaWQgdGRhOTk4eF9icmlkZ2VfbW9kZV9zZXQoc3RydWN0IGRybV9icmlkZ2UgKmJy
aWRnZSwKIAlyZWdfd3JpdGUocHJpdiwgUkVHX1NFUklBTElaRVIsIDApOwogCXJlZ193cml0ZShw
cml2LCBSRUdfSFZGX0NOVFJMXzEsIEhWRl9DTlRSTF8xX1ZRUigwKSk7CiAKLQkvKiBUT0RPIGVu
YWJsZSBwaXhlbCByZXBlYXQgZm9yIHBpeGVsIHJhdGVzIGxlc3MgdGhhbiAyNU1zYW1wL3MgKi8K
LQlyZXAgPSAwOwotCXJlZ193cml0ZShwcml2LCBSRUdfUlBUX0NOVFJMLCAwKTsKLQlyZWdfd3Jp
dGUocHJpdiwgUkVHX1NFTF9DTEssIFNFTF9DTEtfU0VMX1ZSRl9DTEsoMCkgfAotCQkJU0VMX0NM
S19TRUxfQ0xLMSB8IFNFTF9DTEtfRU5BX1NDX0NMSyk7Ci0KKwlyZWdfd3JpdGUocHJpdiwgUkVH
X1JQVF9DTlRSTCwgUlBUX0NOVFJMX1JFUEVBVChyZXApKTsKKwlyZWdfd3JpdGUocHJpdiwgUkVH
X1NFTF9DTEssIHNlbF9jbGspOwogCXJlZ193cml0ZShwcml2LCBSRUdfUExMX1NFUklBTF8yLCBQ
TExfU0VSSUFMXzJfU1JMX05PU0MoZGl2KSB8CiAJCQlQTExfU0VSSUFMXzJfU1JMX1BSKHJlcCkp
OwogCkBAIC0xNTk3LDggKzE2MDUsNiBAQCBzdGF0aWMgdm9pZCB0ZGE5OTh4X2JyaWRnZV9tb2Rl
X3NldChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAogCS8qIG11c3QgYmUgbGFzdCByZWdpc3Rl
ciBzZXQ6ICovCiAJcmVnX3dyaXRlKHByaXYsIFJFR19UQkdfQ05UUkxfMCwgMCk7CiAKLQlwcml2
LT50bWRzX2Nsb2NrID0gYWRqdXN0ZWRfbW9kZS0+Y2xvY2s7Ci0KIAkvKiBDRUEtODYxQiBzZWN0
aW9uIDYgc2F5cyB0aGF0OgogCSAqIENFQSB2ZXJzaW9uIDEgKENFQS04NjEpIGhhcyBubyBzdXBw
b3J0IGZvciBpbmZvZnJhbWVzLgogCSAqIENFQSB2ZXJzaW9uIDIgKENFQS04NjFBKSBzdXBwb3J0
cyB2ZXJzaW9uIDEgQVZJIGluZm9mcmFtZXMsCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
