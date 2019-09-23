Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE276BB446
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093F86E8B9;
	Mon, 23 Sep 2019 12:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 459 seconds by postgrey-1.36 at gabe;
 Mon, 23 Sep 2019 12:51:45 UTC
Received: from smtphy.263.net (syd-smtp02.263.net [13.237.61.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEE86E8B9;
 Mon, 23 Sep 2019 12:51:45 +0000 (UTC)
Received: from regular2.263xmail.com (unknown [211.157.147.162])
 by smtphy.263.net (Postfix) with ESMTPS id 6E2961200B8;
 Mon, 23 Sep 2019 20:44:03 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.114])
 by regular2.263xmail.com (Postfix) with ESMTP id 549861B5C;
 Mon, 23 Sep 2019 20:44:00 +0800 (CST)
Received: from hjc?rock-chips.com (unknown [192.168.167.16])
 by regular1.263xmail.com (Postfix) with ESMTP id 1CF38452;
 Mon, 23 Sep 2019 20:43:56 +0800 (CST)
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
 P3051T140289744058112S1569242621440080_; 
 Mon, 23 Sep 2019 20:43:57 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <fe5a9893bb74d8c2b2afc522284afcec>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jeykumar Sankaran <jsanka@codeaurora.org>,
 Bruce Wang <bzwang@chromium.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Shayenne Moura <shayenneluzmoura@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Allison Randal <allison@lohutok.net>, Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 08/36] drm/msm: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:41:12 +0800
Message-Id: <1569242500-182337-9-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569242500-182337-7-git-send-email-hjc@rock-chips.com>
References: <1569242500-182337-7-git-send-email-hjc@rock-chips.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMgIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NydGMuYyB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9tZHA1L21kcDVfc21wLmMgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmIu
YyAgICAgICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1
MS9kcHVfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYwpp
bmRleCBiMzQxN2Q1Li5jNTc3MzFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvZHB1MS9kcHVfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2Rw
dV9jcnRjLmMKQEAgLTExNDgsOCArMTE0OCw4IEBAIHN0YXRpYyBpbnQgX2RwdV9kZWJ1Z2ZzX3N0
YXR1c19zaG93KHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqZGF0YSkKIAkJCQlmYi0+YmFzZS5p
ZCwgKGNoYXIgKikgJmZiLT5mb3JtYXQtPmZvcm1hdCwKIAkJCQlmYi0+d2lkdGgsIGZiLT5oZWln
aHQpOwogCQkJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoZmItPmZvcm1hdC0+Y3BwKTsgKytp
KQotCQkJCXNlcV9wcmludGYocywgImNwcFslZF06JXUgIiwKLQkJCQkJCWksIGZiLT5mb3JtYXQt
PmNwcFtpXSk7CisJCQkJc2VxX3ByaW50ZihzLCAiYnBwWyVkXToldSAiLAorCQkJCQkJaSwgZmIt
PmZvcm1hdC0+YnBwW2ldKTsKIAkJCXNlcV9wdXRzKHMsICJcblx0Iik7CiAKIAkJCXNlcV9wcmlu
dGYocywgIm1vZGlmaWVyOiU4bGx1ICIsIGZiLT5tb2RpZmllcik7CmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9tZHA1L21kcDVfY3J0Yy5jCmluZGV4IGZmMTQ1NTUuLjYxYWI0ZGMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfY3J0Yy5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfY3J0Yy5jCkBAIC03OTAsNyArNzkwLDcgQEAg
c3RhdGljIHZvaWQgbWRwNV9jcnRjX3Jlc3RvcmVfY3Vyc29yKHN0cnVjdCBkcm1fY3J0YyAqY3J0
YykKIAl3aWR0aCA9IG1kcDVfY3J0Yy0+Y3Vyc29yLndpZHRoOwogCWhlaWdodCA9IG1kcDVfY3J0
Yy0+Y3Vyc29yLmhlaWdodDsKIAotCXN0cmlkZSA9IHdpZHRoICogaW5mby0+Y3BwWzBdOworCXN0
cmlkZSA9IHdpZHRoICogaW5mby0+YnBwWzBdIC8gODsKIAogCWdldF9yb2koY3J0YywgJnJvaV93
LCAmcm9pX2gpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9t
ZHA1X3NtcC5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9zbXAuYwppbmRl
eCA3NzYzMzdmLi45OTI0NzdkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
bWRwNS9tZHA1X3NtcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVf
c21wLmMKQEAgLTE0Nyw3ICsxNDcsNyBAQCB1aW50MzJfdCBtZHA1X3NtcF9jYWxjdWxhdGUoc3Ry
dWN0IG1kcDVfc21wICpzbXAsCiAJZm9yIChpID0gMDsgaSA8IG5wbGFuZXM7IGkrKykgewogCQlp
bnQgbiwgZmV0Y2hfc3RyaWRlLCBjcHA7CiAKLQkJY3BwID0gaW5mby0+Y3BwW2ldOworCQljcHAg
PSBpbmZvLT5icHBbaV0gLyA4OwogCQlmZXRjaF9zdHJpZGUgPSB3aWR0aCAqIGNwcCAvIChpID8g
aHN1YiA6IDEpOwogCiAJCW4gPSBESVZfUk9VTkRfVVAoZmV0Y2hfc3RyaWRlICogbmxpbmVzLCBz
bXAtPmJsa19zaXplKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2ZiLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9mYi5jCmluZGV4IDViY2Q1ZTUuLjQ1NDVmYTEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2ZiLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9tc21fZmIuYwpAQCAtMTcyLDcgKzE3Miw3IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyICptc21fZnJhbWVidWZmZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAog
CQl1bnNpZ25lZCBpbnQgbWluX3NpemU7CiAKIAkJbWluX3NpemUgPSAoaGVpZ2h0IC0gMSkgKiBt
b2RlX2NtZC0+cGl0Y2hlc1tpXQotCQkJICsgd2lkdGggKiBpbmZvLT5jcHBbaV0KKwkJCSArIHdp
ZHRoICogaW5mby0+YnBwW2ldIC8gOAogCQkJICsgbW9kZV9jbWQtPm9mZnNldHNbaV07CiAKIAkJ
aWYgKGJvc1tpXS0+c2l6ZSA8IG1pbl9zaXplKSB7Ci0tIAoyLjcuNAoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
