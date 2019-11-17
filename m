Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253D7FF92B
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A286E3F9;
	Sun, 17 Nov 2019 11:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAD66E1F7
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 02:41:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 350AD28FA28
Received: by earth.universe (Postfix, from userid 1000)
 id 548783C0CB0; Sun, 17 Nov 2019 03:41:40 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [RFCv1 36/42] drm/omap: panel-dsi-cm: support unbinding
Date: Sun, 17 Nov 2019 03:40:22 +0100
Message-Id: <20191117024028.2233-37-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93LCB0aGF0IHRoZSBkcml2ZXIgaW1wbGVtZW50cyB0aGUgY29tbW9uIERSTSBwYW5lbCBBUEkK
dGhlIHVuYmluZCBubyBsb25nZXIgbmVlZHMgdG8gYmUgc3VwcHJlc3NlZC4KClNpZ25lZC1vZmYt
Ynk6IFNlYmFzdGlhbiBSZWljaGVsIDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xsYWJvcmEuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWRzaS1jbS5jIHwgNSAr
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20u
YyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWRzaS1jbS5jCmluZGV4
IDAxNDhmNDBlY2ViMi4uZjYwN2IzZGZhMzFmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYwpAQCAtNTk4LDcgKzU5OCw3IEBAIHN0YXRpYyBp
bnQgZHNpY21fcHJvYmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogCXJldHVybiByOwog
fQogCi1zdGF0aWMgaW50IF9fZXhpdCBkc2ljbV9yZW1vdmUoc3RydWN0IG1pcGlfZHNpX2Rldmlj
ZSAqZHNpKQorc3RhdGljIGludCBkc2ljbV9yZW1vdmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAq
ZHNpKQogewogCXN0cnVjdCBwYW5lbF9kcnZfZGF0YSAqZGRhdGEgPSBtaXBpX2RzaV9nZXRfZHJ2
ZGF0YShkc2kpOwogCkBAIC02MjgsMTEgKzYyOCwxMCBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9m
LCBkc2ljbV9vZl9tYXRjaCk7CiAKIHN0YXRpYyBzdHJ1Y3QgbWlwaV9kc2lfZHJpdmVyIGRzaWNt
X2RyaXZlciA9IHsKIAkucHJvYmUgPSBkc2ljbV9wcm9iZSwKLQkucmVtb3ZlID0gX19leGl0X3Ao
ZHNpY21fcmVtb3ZlKSwKKwkucmVtb3ZlID0gZHNpY21fcmVtb3ZlLAogCS5kcml2ZXIgPSB7CiAJ
CS5uYW1lID0gInBhbmVsLWRzaS1jbSIsCiAJCS5vZl9tYXRjaF90YWJsZSA9IGRzaWNtX29mX21h
dGNoLAotCQkuc3VwcHJlc3NfYmluZF9hdHRycyA9IHRydWUsCiAJfSwKIH07CiBtb2R1bGVfbWlw
aV9kc2lfZHJpdmVyKGRzaWNtX2RyaXZlcik7Ci0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
