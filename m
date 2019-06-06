Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 711F337F53
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 23:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEE4897F5;
	Thu,  6 Jun 2019 21:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F79897F5
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 21:15:51 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id c26so5348996edt.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 14:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AvxQASCBsC5atD2r+eEtLSGh4Ly5gAtj0IWdStXo5q0=;
 b=XDyjK/IGaU1EwLGrct2E0SeF4S/s9COoqawU35u/tVeQGlBPHlAbF18e+gJlQsvUDu
 wEWnm53wJUeqNcN4jTKQCj4yqBIt11Lc2mEmYBOlLu0I5gJsedMJHN8kHGc90WjRmDDW
 451/okr3lgdd4wC66o1zX/y8NAXpYd7zZJ6prTrKH0P9URCNHiTJPtNx3cBWM1iuWbn8
 IS39V5HhZh+yuYldkMQUz8OhLZ0ax/QeypF4jQ/1gaJlHYCFAfMLNuEkgCdgVQJNvVm6
 TPX6YNMPA2TDJkfaa2XLuEtFq7quIF/zIDZg78zQdh6Ip7Ja++22breO5g5X2r3XyxXv
 dv/g==
X-Gm-Message-State: APjAAAVbgkqk97DnlHbQO9AO1QaJqMQUs73QtHWAnjVSY/qCTeRW7ZuY
 KlzDJjYWUAxK2MLGcBTcjo3g3tow1kY=
X-Google-Smtp-Source: APXvYqwf8zDtG4H9+0a6igXN7+Jc9fn/KRbTVx9a2kjLqwbkjJYr0ufe6lOmdXIIJAMPyIOvUMHsyA==
X-Received: by 2002:a50:972a:: with SMTP id c39mr17712634edb.46.1559855749653; 
 Thu, 06 Jun 2019 14:15:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y42sm12084ede.86.2019.06.06.14.15.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 14:15:48 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/crc-debugfs: Also sprinkle irqrestore over early exits
Date: Thu,  6 Jun 2019 23:15:44 +0200
Message-Id: <20190606211544.5389-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AvxQASCBsC5atD2r+eEtLSGh4Ly5gAtj0IWdStXo5q0=;
 b=Df9o85k1SQVivuewhgIh/5VzCQp2pFngZC7E+y2P2wiVOt1uSourLAjkyKPF7Agoyd
 Ue9QRorngcF0Sq6i2qBsIGo+8g4nOaWUmoLohOpaV0CsbUoDpVRkXk35S5vogisyK+Jf
 WcQstYlQuou1DIV4NSQ7omvrbbPEPm5ywfTk0=
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SS4gd2FzLiBibGluZC4KCkNhdWdodCB3aXRoIHZrbXMsIHdoaWNoIGhhcyBzb21lIHJlYWxseSBz
bG93IGNyYyBjb21wdXRhdGlvbiBmdW5jdGlvbi4KCkZpeGVzOiAxODgyMDE4YTcwZTAgKCJkcm0v
Y3JjLWRlYnVnZnM6IFVzZXIgaXJxc2FmZSBzcGlubG9jayBpbiBkcm1fY3J0Y19hZGRfY3JjX2Vu
dHJ5IikKQ2M6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1lbG9AZ21haWwuY29t
PgpDYzogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4KQ2M6IEVtaWwg
VmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CkNjOiBCZW5qYW1pbiBHYWlnbmFy
ZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmls
bGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdm
c19jcmMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKaW5kZXggN2YzNWI1YmExOTI0Li5k
MmYxMDJmMDE1MTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKQEAgLTQwMiw3ICs0MDIs
NyBAQCBpbnQgZHJtX2NydGNfYWRkX2NyY19lbnRyeShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGJv
b2wgaGFzX2ZyYW1lLAogCiAJLyogQ2FsbGVyIG1heSBub3QgaGF2ZSBub3RpY2VkIHlldCB0aGF0
IHVzZXJzcGFjZSBoYXMgc3RvcHBlZCByZWFkaW5nICovCiAJaWYgKCFjcmMtPmVudHJpZXMpIHsK
LQkJc3Bpbl91bmxvY2soJmNyYy0+bG9jayk7CisJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmNy
Yy0+bG9jaywgZmxhZ3MpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKQEAgLTQxMyw3ICs0MTMs
NyBAQCBpbnQgZHJtX2NydGNfYWRkX2NyY19lbnRyeShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGJv
b2wgaGFzX2ZyYW1lLAogCQlib29sIHdhc19vdmVyZmxvdyA9IGNyYy0+b3ZlcmZsb3c7CiAKIAkJ
Y3JjLT5vdmVyZmxvdyA9IHRydWU7Ci0JCXNwaW5fdW5sb2NrKCZjcmMtPmxvY2spOworCQlzcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZjcmMtPmxvY2ssIGZsYWdzKTsKIAogCQlpZiAoIXdhc19vdmVy
ZmxvdykKIAkJCURSTV9FUlJPUigiT3ZlcmZsb3cgb2YgQ1JDIGJ1ZmZlciwgdXNlcnNwYWNlIHJl
YWRzIHRvbyBzbG93LlxuIik7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
