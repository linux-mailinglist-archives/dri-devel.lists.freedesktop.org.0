Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E06AFF915
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157136E356;
	Sun, 17 Nov 2019 11:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643E76E1F9
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 02:41:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 3820F28FA57
Received: by earth.universe (Postfix, from userid 1000)
 id 5934C3C0CB1; Sun, 17 Nov 2019 03:41:40 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [RFCv1 37/42] drm/omap: panel-dsi-cm: fix remove()
Date: Sun, 17 Nov 2019 03:40:23 +0100
Message-Id: <20191117024028.2233-38-sebastian.reichel@collabora.com>
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

VGhlIHJlbW92ZSBmdW5jdGlvbiBzaG91bGQgZGlzYWJsZSB0aGUgcGFuZWwgYnkKY2FsbGluZyB0
aGUgdW5wcmVwYXJlKCkgZnVuY3Rpb24gYmVmb3JlIHRoZSBwYW5lbAppcyBkaXNjb25uZWN0ZWQg
ZnJvbSBNSVBJIGJ1cyBpbnN0ZWFkIG9mIHRyeWluZwp0byByZXNldCBpdC4KClNpZ25lZC1vZmYt
Ynk6IFNlYmFzdGlhbiBSZWljaGVsIDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xsYWJvcmEuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWRzaS1jbS5jIHwgNSAr
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20u
YyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWRzaS1jbS5jCmluZGV4
IGY2MDdiM2RmYTMxZi4uOTAxMzJkMWQxZjVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYwpAQCAtNjA0LDYgKzYwNCw4IEBAIHN0YXRpYyBp
bnQgZHNpY21fcmVtb3ZlKHN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRzaSkKIAogCWRldl9kYmco
JmRzaS0+ZGV2LCAicmVtb3ZlXG4iKTsKIAorCWRybV9wYW5lbF91bnByZXBhcmUoJmRkYXRhLT5w
YW5lbCk7CisKIAltaXBpX2RzaV9kZXRhY2goZHNpKTsKIAogCWRybV9wYW5lbF9yZW1vdmUoJmRk
YXRhLT5wYW5lbCk7CkBAIC02MTMsOSArNjE1LDYgQEAgc3RhdGljIGludCBkc2ljbV9yZW1vdmUo
c3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogCWlmIChkZGF0YS0+ZXh0YmxkZXYpCiAJCXB1
dF9kZXZpY2UoJmRkYXRhLT5leHRibGRldi0+ZGV2KTsKIAotCS8qIHJlc2V0LCB0byBiZSBzdXJl
IHRoYXQgdGhlIHBhbmVsIGlzIGluIGEgdmFsaWQgc3RhdGUgKi8KLQlkc2ljbV9od19yZXNldChk
ZGF0YSk7Ci0KIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
