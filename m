Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A6F2DA913
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 09:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAAF6E193;
	Tue, 15 Dec 2020 08:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D708A894DD
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 08:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 6B601FB02;
 Tue, 15 Dec 2020 09:23:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NTYryB4XnR6q; Tue, 15 Dec 2020 09:23:39 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id A05ED40261; Tue, 15 Dec 2020 09:23:38 +0100 (CET)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] drm: mxsfb: Silence -EPROBE_DEFER while waiting for
 bridge
Date: Tue, 15 Dec 2020 09:23:38 +0100
Message-Id: <d5761eb871adde5464ba112b89d966568bc2ff6c.1608020391.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608020391.git.agx@sigxcpu.org>
References: <cover.1608020391.git.agx@sigxcpu.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgY2FuIHRha2UgbXVsdGlwbGUgaXRlcmF0aW9ucyB1bnRpbCBhbGwgY29tcG9uZW50cyBmb3Ig
YW4gYXR0YWNoZWQgRFNJCmJyaWRnZSBhcmUgdXAgbGVhZGluZyB0byBzZXZlcmFsOgoKWyAgICAz
Ljc5NjQyNV0gbXhzZmIgMzAzMjAwMDAubGNkLWNvbnRyb2xsZXI6IENhbm5vdCBjb25uZWN0IGJy
aWRnZTogLTUxNwpbICAgIDMuODE2OTUyXSBteHNmYiAzMDMyMDAwMC5sY2QtY29udHJvbGxlcjog
W2RybTpteHNmYl9wcm9iZSBbbXhzZmJdXSAqRVJST1IqIGZhaWxlZCB0byBhdHRhY2ggYnJpZGdl
OiAtNTE3CgpTaWxlbmNlIHRoaXMgYnkgY2hlY2tpbmcgZm9yIC1FUFJPQkVfREVGRVIgYW5kIHVz
aW5nIGRldl9lcnJfcHJvYmUoKSBzbwp3ZSBzZXQgYSBkZWZlcnJlZCByZWFzb24gaW4gY2FzZSBh
IGRlcGVuZGVuY3kgZmFpbHMgdG8gcHJvYmUgKHdoaWNoCnF1aWNrbHkgaGFwcGVucyBvbiBzbWFs
bCBjb25maWcvRFQgY2hhbmdlcyBkdWUgdG8gdGhlIHJhdGhlciBsb25nIHByb2JlCmNoYWluIHdo
aWNoIGNhbiBpbmNsdWRlIGJyaWRnZXMsIHBoeXMsIHBhbmVscywgYmFja2lnaHRzLCBsZWRzLCBl
dGMuKS4KClRoaXMgYWxzbyByZW1vdmVzIHRoZSBvbmx5IERSTV9ERVZfRVJST1IoKSB1c2FnZSwg
dGhlIHJlc3Qgb2YgdGhlIGRyaXZlcgp1c2VzIGRldl9lcnIoKS4KClNpZ25lZC1vZmYtYnk6IEd1
aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+CkZpeGVzOiBjNDIwMDFlMzU3ZjcgKCJkcm06
IG14c2ZiOiBVc2UgZHJtX3BhbmVsX2JyaWRnZSIpCi0tLQogZHJpdmVycy9ncHUvZHJtL214c2Zi
L214c2ZiX2Rydi5jIHwgMTAgKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIv
bXhzZmJfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMKaW5kZXggNmZh
ZjE3YjY0MDhkLi42ZGE5MzU1MWUyZTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9teHNm
Yi9teHNmYl9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMKQEAg
LTEzNCwxMSArMTM0LDggQEAgc3RhdGljIGludCBteHNmYl9hdHRhY2hfYnJpZGdlKHN0cnVjdCBt
eHNmYl9kcm1fcHJpdmF0ZSAqbXhzZmIpCiAJCXJldHVybiAtRU5PREVWOwogCiAJcmV0ID0gZHJt
X2JyaWRnZV9hdHRhY2goJm14c2ZiLT5lbmNvZGVyLCBicmlkZ2UsIE5VTEwsIDApOwotCWlmIChy
ZXQpIHsKLQkJRFJNX0RFVl9FUlJPUihkcm0tPmRldiwKLQkJCSAgICAgICJmYWlsZWQgdG8gYXR0
YWNoIGJyaWRnZTogJWRcbiIsIHJldCk7Ci0JCXJldHVybiByZXQ7Ci0JfQorCWlmIChyZXQpCisJ
CXJldHVybiBkZXZfZXJyX3Byb2JlKGRybS0+ZGV2LCByZXQsICJGYWlsZWQgdG8gYXR0YWNoIGJy
aWRnZVxuIik7CiAKIAlteHNmYi0+YnJpZGdlID0gYnJpZGdlOwogCkBAIC0yMTIsNyArMjA5LDgg
QEAgc3RhdGljIGludCBteHNmYl9sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sCiAKIAlyZXQg
PSBteHNmYl9hdHRhY2hfYnJpZGdlKG14c2ZiKTsKIAlpZiAocmV0KSB7Ci0JCWRldl9lcnIoZHJt
LT5kZXYsICJDYW5ub3QgY29ubmVjdCBicmlkZ2U6ICVkXG4iLCByZXQpOworCQlpZiAocmV0ICE9
IC1FUFJPQkVfREVGRVIpCisJCQlkZXZfZXJyKGRybS0+ZGV2LCAiQ2Fubm90IGNvbm5lY3QgYnJp
ZGdlOiAlZFxuIiwgcmV0KTsKIAkJZ290byBlcnJfdmJsYW5rOwogCX0KIAotLSAKMi4yOS4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
