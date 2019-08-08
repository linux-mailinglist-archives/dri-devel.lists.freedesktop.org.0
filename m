Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C074586D18
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 00:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6564D6ECD5;
	Thu,  8 Aug 2019 22:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38DC6ECD3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 22:22:12 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id r21so119114962otq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 15:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UpyT+Why+/m435rOz7NzCAgLp1lFXGESsqeBXgIEbKc=;
 b=ZsR63saxpVQTpbmPNS238OXBpGvdzi8vU+aoJ+Sx3vk885XFfUN5ewB1ewfhOjrd9u
 djSSThNFdWBOrUwcAJ7qOYGUiNkiBX8YqVxGOogg6J8QhiApBNV3YHDOAqeGi0QinOPc
 Pnw5VbeZYg1WzEm/Vwp1pKGsBcpJubnTOHLA9LwaQLzeR0nBsG+l/hTNlmEKkuQUT41o
 Uq52nzpo55QtzQBYabbmthS6ZZAoSK5Gng58/XyslIeterMYH6KKgmp4DjFh2PRTEoCe
 A9sLvKwyR9XPYlZDb6XAsZu+Z9un+BUHZ9KX/6cucP4D53YvFcpQwflC93C0w54DUB4u
 Skig==
X-Gm-Message-State: APjAAAUrxHElh5j5Pe0/8sbDhMIaUjq9qJkBxBrwbjRZANevp62gbh0c
 Vicb7GYVnt9k7Vl2erCrfbOqQyQ=
X-Google-Smtp-Source: APXvYqytFWG6uAus4JOrqXC/oDglnlTwSjKsXoOedSRP3zA9bgZTPb5FydPK5eePOGORmqFXBvmw5w==
X-Received: by 2002:a5d:924e:: with SMTP id e14mr16641446iol.215.1565302931039; 
 Thu, 08 Aug 2019 15:22:11 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id i4sm118528553iog.31.2019.08.08.15.22.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 15:22:10 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 7/9] drm/panfrost: Convert MMU IRQ handler to threaded
 handler
Date: Thu,  8 Aug 2019 16:21:58 -0600
Message-Id: <20190808222200.13176-8-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190808222200.13176-1-robh@kernel.org>
References: <20190808222200.13176-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gcHJlcGFyYXRpb24gdG8gaGFuZGxlIG1hcHBpbmcgb2YgcGFnZSBmYXVsdHMsIHdlIG5lZWQg
dGhlIE1NVSBoYW5kbGVyCnRvIGJlIHRocmVhZGVkIGFzIGNvZGUgcGF0aHMgdGFrZSBhIG11dGV4
LgoKQXMgdGhlIElSUSBtYXkgYmUgc2hhcmVkLCB3ZSBjYW4ndCB1c2UgdGhlIGRlZmF1bHQgaGFu
ZGxlciBhbmQgbXVzdApkaXNhYmxlIHRoZSBNTVUgaW50ZXJydXB0cyBsb2NhbGx5LgoKQ2M6IFRv
bWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+CkNjOiBCb3JpcyBCcmV6aWxs
b24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgpDYzogUm9iaW4gTXVycGh5IDxyb2Jp
bi5tdXJwaHlAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNl
QGFybS5jb20+CkFja2VkLWJ5OiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhLnJvc2VuendlaWdA
Y29sbGFib3JhLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgfCAyMCArKysr
KysrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X21tdS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCmluZGV4IDEz
NzU3NDI3Yjg4Ni4uYjYwOWVlNTVhODcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfbW11LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X21tdS5jCkBAIC0zMDUsMTIgKzMwNSwyMCBAQCBzdGF0aWMgY29uc3QgY2hhciAqYWNjZXNz
X3R5cGVfbmFtZShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiwKIHN0YXRpYyBpcnFyZXR1
cm5fdCBwYW5mcm9zdF9tbXVfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGF0YSkKIHsKIAlz
dHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiA9IGRhdGE7Ci0JdTMyIHN0YXR1cyA9IG1tdV9y
ZWFkKHBmZGV2LCBNTVVfSU5UX1NUQVQpOwotCWludCBpOwogCi0JaWYgKCFzdGF0dXMpCisJaWYg
KCFtbXVfcmVhZChwZmRldiwgTU1VX0lOVF9TVEFUKSkKIAkJcmV0dXJuIElSUV9OT05FOwogCisJ
bW11X3dyaXRlKHBmZGV2LCBNTVVfSU5UX01BU0ssIDApOworCXJldHVybiBJUlFfV0FLRV9USFJF
QUQ7Cit9CisKK3N0YXRpYyBpcnFyZXR1cm5fdCBwYW5mcm9zdF9tbXVfaXJxX2hhbmRsZXJfdGhy
ZWFkKGludCBpcnEsIHZvaWQgKmRhdGEpCit7CisJc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZk
ZXYgPSBkYXRhOworCXUzMiBzdGF0dXMgPSBtbXVfcmVhZChwZmRldiwgTU1VX0lOVF9SQVdTVEFU
KTsKKwlpbnQgaTsKKwogCWRldl9lcnIocGZkZXYtPmRldiwgIm1tdSBpcnEgc3RhdHVzPSV4XG4i
LCBzdGF0dXMpOwogCiAJZm9yIChpID0gMDsgc3RhdHVzOyBpKyspIHsKQEAgLTM1NSw2ICszNjMs
NyBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgcGFuZnJvc3RfbW11X2lycV9oYW5kbGVyKGludCBpcnEs
IHZvaWQgKmRhdGEpCiAJCXN0YXR1cyAmPSB+bWFzazsKIAl9CiAKKwltbXVfd3JpdGUocGZkZXYs
IE1NVV9JTlRfTUFTSywgfjApOwogCXJldHVybiBJUlFfSEFORExFRDsKIH07CiAKQEAgLTM3Myw4
ICszODIsOSBAQCBpbnQgcGFuZnJvc3RfbW11X2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAq
cGZkZXYpCiAJaWYgKGlycSA8PSAwKQogCQlyZXR1cm4gLUVOT0RFVjsKIAotCWVyciA9IGRldm1f
cmVxdWVzdF9pcnEocGZkZXYtPmRldiwgaXJxLCBwYW5mcm9zdF9tbXVfaXJxX2hhbmRsZXIsCi0J
CQkgICAgICAgSVJRRl9TSEFSRUQsICJtbXUiLCBwZmRldik7CisJZXJyID0gZGV2bV9yZXF1ZXN0
X3RocmVhZGVkX2lycShwZmRldi0+ZGV2LCBpcnEsIHBhbmZyb3N0X21tdV9pcnFfaGFuZGxlciwK
KwkJCQkJcGFuZnJvc3RfbW11X2lycV9oYW5kbGVyX3RocmVhZCwKKwkJCQkJSVJRRl9TSEFSRUQs
ICJtbXUiLCBwZmRldik7CiAKIAlpZiAoZXJyKSB7CiAJCWRldl9lcnIocGZkZXYtPmRldiwgImZh
aWxlZCB0byByZXF1ZXN0IG1tdSBpcnEiKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
