Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5575049C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 10:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E16B8972D;
	Mon, 24 Jun 2019 08:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E2E8972D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 08:33:03 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a14so20483616edv.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 01:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rhq/A+Wmeu0M0xpQ5ggr38wrWajMw16Fcl2eXJ2cqCM=;
 b=qPdD3TZrXxLMNvQpix4IjkePBCST7Lua3t+r+Y7A7ISWkPN19vtjKQVBpu+tcJew2W
 y9ZvxlTPYcILnPadZ/28KJT0c6iIon5amWBcUZfPoR741NDDaPNmUTq1/vmAmhnHUL3H
 XSO9o1HR972RjznVjluRKf14i/DNSHW4RV7VkJskfMKEzo2ORJpkVd0E+7daN8WIjXvB
 6ATqgKXtZEACuh4yZw2q3TixeP/eV30yUYpU1OmiOZ1yCopeia+wUJ4hT1NweAboCaE9
 ozRIqqYilWI6Ks+6pYYBoHozwuRHzmhqDPvhwjPaPC/UuqsCwxKgNdm1K/ffSMM9BQNy
 2h/w==
X-Gm-Message-State: APjAAAXzC5U24N983O+6lfVDvncMDvN/qg/TQfNn6Qmme+eAq/+9einQ
 WZIsGUZ9Roiv8TCzV07QMR3IJRfDKwo=
X-Google-Smtp-Source: APXvYqyxQqcCOaClByMhs9zg429dU19NX8iT7BNkF349mthFHC5Eqv9G8GiIgew05iugGCQJDye1Bg==
X-Received: by 2002:a50:e612:: with SMTP id
 y18mr160702738edm.143.1561365181654; 
 Mon, 24 Jun 2019 01:33:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id s5sm3431668edh.3.2019.06.24.01.33.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 01:33:00 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] fbcon: Export fbcon_remap_all
Date: Mon, 24 Jun 2019 10:32:55 +0200
Message-Id: <20190624083255.13235-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rhq/A+Wmeu0M0xpQ5ggr38wrWajMw16Fcl2eXJ2cqCM=;
 b=Xl/UEKe4ZlQUG9JziPsm9bJPu2EwUbCisCgv19ADkWt/skBEuSaOrDxTyNaRZz7YyX
 4T1ON3POCGbrp06bokoC9KhzKCaNrCKtOjDsn0kqroRsiAqSl9aCec7I50oZT34BhC36
 2Nw5U0uZUXfzcDRYP5lBEypT/89qU86eBX/7w=
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
Cc: Sean Paul <sean@poorly.run>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Hans de Goede <hdegoede@redhat.com>, kbuild test robot <lkp@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-fbdev@vger.kernel.org, Yisheng Xie <ysxie@foxmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgbGlua2luZyBmYWlsIHdoZW4gZmJjb24vZmJkZXYgaXMgbW9kdWxlciBhbmQgdmdhc3dp
dGNoZXJvbyBpcwplbmFibGVkOgoKeDg2XzY0LWxpbnV4LWdudS1sZDogZHJpdmVycy9ncHUvdmdh
L3ZnYV9zd2l0Y2hlcm9vLm86IGluIGZ1bmN0aW9uIGB2Z2Ffc3dpdGNodG9fc3RhZ2UyJzoKdmdh
X3N3aXRjaGVyb28uYzooLnRleHQrMHg5OTcpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBmYmNv
bl9yZW1hcF9hbGwnCgpSZXBvcnRlZC1ieTogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1
Zy5vcmcuYXU+ClJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4K
Rml4ZXM6IDFjZDUxYjVkMjAwZCAoInZnYXN3aXRjaGVyb286IGNhbGwgZmJjb25fcmVtYXBfYWxs
IGRpcmVjdGx5IikKQ2M6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1PgpD
YzogTHVrYXMgV3VubmVyIDxsdWthc0B3dW5uZXIuZGU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+CkNjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4u
Y29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBCYXJ0bG9taWVqIFpvbG5p
ZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CkNjOiBIYW5zIGRlIEdvZWRlIDxo
ZGVnb2VkZUByZWRoYXQuY29tPgpDYzogWWlzaGVuZyBYaWUgPHlzeGllQGZveG1haWwuY29tPgpD
YzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnCkNjOiBEYW5pZWwgVGhvbXBzb24gPGRhbmll
bC50aG9tcHNvbkBsaW5hcm8ub3JnPgpDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9y
Zz4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LWZiZGV2QHZn
ZXIua2VybmVsLm9yZwotLQp3cnQgbWVyZ2luZyBwcm9iYWJseSBiZXN0IGlmIE1hYXJ0ZW4gYWRk
cyB0aGlzIHRvIHRoZSB0b3BpYyBicmFuY2ggd2UKaGF2ZSBhbHJlYWR5IGFuZCBzZW5kcyBvdXQg
YW4gdXBkYXRlZCBwdWxsIHJlcXVlc3QuCgpBcG9sb2dpZXMgZm9yIHRoZSBtZXNzLgotRGFuaWVs
Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29y
ZS9mYmNvbi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMKaW5kZXggYzkyMzVh
MmY0MmY4Li4xOTljYTcyM2M3NjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29y
ZS9mYmNvbi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jCkBAIC0zMTk0
LDYgKzMxOTQsNyBAQCB2b2lkIGZiY29uX3JlbWFwX2FsbChzdHJ1Y3QgZmJfaW5mbyAqaW5mbykK
IAl9CiAJY29uc29sZV91bmxvY2soKTsKIH0KK0VYUE9SVF9TWU1CT0woZmJjb25fcmVtYXBfYWxs
KTsKIAogI2lmZGVmIENPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xFX0RFVEVDVF9QUklNQVJZCiBz
dGF0aWMgdm9pZCBmYmNvbl9zZWxlY3RfcHJpbWFyeShzdHJ1Y3QgZmJfaW5mbyAqaW5mbykKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
