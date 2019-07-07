Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E45D06160F
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 20:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DA689C14;
	Sun,  7 Jul 2019 18:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8CD89C14
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 18:40:39 +0000 (UTC)
Received: from pendragon.nordic-sky.finnair.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4017AAF9;
 Sun,  7 Jul 2019 20:40:23 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 57/60] drm/omap: Simplify connector implementation
Date: Sun,  7 Jul 2019 21:19:34 +0300
Message-Id: <20190707181937.6250-54-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562524837;
 bh=v87Qb4sTswiUU+N5ehwulZWAJgrcVqdqfSmeTv6oueg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GFkAegvKlgJPiSJs8sIr7tXUdOMea82p0X1U8lWLvdSLy3OuRHSqPJ0AgClOIRQLN
 3nicLjkLdopnSrMCFgqE41n5qD58RH8zlYYVVr8i60K1EM1Mrf12hxNJ7Avkh6T26l
 xtH2D6bYWIQWi1mnWwsq6zTxNzA2zeym9SWP1UYQ=
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
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgdGhlIG9tYXBfY29ubmVjdG9yIGlzIHVzZWQgZm9yIERTSSBvbmx5IHdlIGNhbiBz
aW1wbGlmeSBpdHMKaW1wbGVtZW50YXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNo
YXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vb21hcF9jb25uZWN0b3IuYyB8IDMxICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jb25uZWN0b3IuYyBiL2RyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY29ubmVjdG9yLmMKaW5kZXggNGI4YTk5YmUyMDg2Li5i
OGYzZTI0NmIwMWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY29u
bmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jb25uZWN0b3IuYwpA
QCAtMzUsMjIgKzM1LDcgQEAgc3RydWN0IG9tYXBfY29ubmVjdG9yIHsKIHN0YXRpYyBlbnVtIGRy
bV9jb25uZWN0b3Jfc3RhdHVzIG9tYXBfY29ubmVjdG9yX2RldGVjdCgKIAkJc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvciwgYm9vbCBmb3JjZSkKIHsKLQllbnVtIGRybV9jb25uZWN0b3Jf
c3RhdHVzIHN0YXR1czsKLQotCXN3aXRjaCAoY29ubmVjdG9yLT5jb25uZWN0b3JfdHlwZSkgewot
CWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX0RQSToKLQljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9M
VkRTOgotCWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX0RTSToKLQkJc3RhdHVzID0gY29ubmVjdG9y
X3N0YXR1c19jb25uZWN0ZWQ7Ci0JCWJyZWFrOwotCWRlZmF1bHQ6Ci0JCXN0YXR1cyA9IGNvbm5l
Y3Rvcl9zdGF0dXNfdW5rbm93bjsKLQkJYnJlYWs7Ci0JfQotCi0JVkVSQigiJXM6ICVkIChmb3Jj
ZT0lZCkiLCBjb25uZWN0b3ItPm5hbWUsIHN0YXR1cywgZm9yY2UpOwotCi0JcmV0dXJuIHN0YXR1
czsKKwlyZXR1cm4gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQ7CiB9CiAKIHN0YXRpYyB2b2lk
IG9tYXBfY29ubmVjdG9yX2Rlc3Ryb3koc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikK
QEAgLTE0OSwxOCArMTM0LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2hl
bHBlcl9mdW5jcyBvbWFwX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MgPSB7CiAJLm1vZGVfdmFsaWQg
PSBvbWFwX2Nvbm5lY3Rvcl9tb2RlX3ZhbGlkLAogfTsKIAotc3RhdGljIGludCBvbWFwX2Nvbm5l
Y3Rvcl9nZXRfdHlwZShzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpvdXRwdXQpCi17Ci0Jc3RydWN0
IG9tYXBfZHNzX2RldmljZSAqZGlzcGxheTsKLQllbnVtIG9tYXBfZGlzcGxheV90eXBlIHR5cGU7
Ci0KLQlkaXNwbGF5ID0gb21hcGRzc19kaXNwbGF5X2dldChvdXRwdXQpOwotCXR5cGUgPSBkaXNw
bGF5LT50eXBlOwotCW9tYXBkc3NfZGV2aWNlX3B1dChkaXNwbGF5KTsKLQotCXJldHVybiBvbWFw
ZHNzX2RldmljZV9jb25uZWN0b3JfdHlwZSh0eXBlKTsKLX0KLQogLyogaW5pdGlhbGl6ZSBjb25u
ZWN0b3IgKi8KIHN0cnVjdCBkcm1fY29ubmVjdG9yICpvbWFwX2Nvbm5lY3Rvcl9pbml0KHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsCiAJCQkJCSAgc3RydWN0IG9tYXBfZHNzX2RldmljZSAqb3V0cHV0
LApAQCAtMTgyLDcgKzE1NSw3IEBAIHN0cnVjdCBkcm1fY29ubmVjdG9yICpvbWFwX2Nvbm5lY3Rv
cl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJY29ubmVjdG9yLT5kb3VibGVzY2FuX2Fs
bG93ZWQgPSAwOwogCiAJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgY29ubmVjdG9yLCAmb21hcF9j
b25uZWN0b3JfZnVuY3MsCi0JCQkgICBvbWFwX2Nvbm5lY3Rvcl9nZXRfdHlwZShvdXRwdXQpKTsK
KwkJCSAgIERSTV9NT0RFX0NPTk5FQ1RPUl9EU0kpOwogCWRybV9jb25uZWN0b3JfaGVscGVyX2Fk
ZChjb25uZWN0b3IsICZvbWFwX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCiAJcmV0dXJuIGNv
bm5lY3RvcjsKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
