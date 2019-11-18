Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBCB1008B6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 16:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2E66E5E3;
	Mon, 18 Nov 2019 15:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612916E5D4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 15:52:09 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-AxaN9lVNMMmNz8DH4_Qwmg-1; Mon, 18 Nov 2019 10:52:04 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DCEFDBF7;
 Mon, 18 Nov 2019 15:52:03 +0000 (UTC)
Received: from shalem.localdomain.com (unknown [10.36.118.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 580D9600CD;
 Mon, 18 Nov 2019 15:52:00 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 13/13] drm/connector: Hookup the new drm_cmdline_mode
 panel_orientation member
Date: Mon, 18 Nov 2019 16:51:34 +0100
Message-Id: <20191118155134.30468-13-hdegoede@redhat.com>
In-Reply-To: <20191118155134.30468-1-hdegoede@redhat.com>
References: <20191118155134.30468-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: AxaN9lVNMMmNz8DH4_Qwmg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574092328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3dx18nUSzDPD8xT4FR8i4HfUk0fgYKfTzekpwXlHQhI=;
 b=f8c8KWh3hv1/K5oiQRA0rJo9HwYru3hxS0mY/v0G5wTA8KbVBy56+/IzTa6dckdv1N4bZm
 +9IZywBaXuAkg46VBxV624YKPKRVkxmnbNff02Lpla2NbbF5m4YvRxZaeo+Y8D1M/DT92v
 oxHTDCWL0HVxM73rC/SYQ/T3hrtniAs=
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Derek Basehore <dbasehore@chromium.org>,
 =?UTF-8?q?Mathieu=20Alexandre-T=C3=A9treault?= <alexandretm@amotus.ca>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgdGhlIG5ldyB2aWRlbz0uLi4gcGFuZWxfb3JpZW50YXRpb24gb3B0aW9uIGlzIHNldCBmb3Ig
YSBjb25uZWN0b3IsIGhvbm9yCml0IGFuZCBzZXR1cCBhIG1hdGNoaW5nICJwYW5lbCBvcmllbnRh
dGlvbiIgcHJvcGVydHkgb24gdGhlIGNvbm5lY3Rvci4KCkJ1Z0xpbms6IGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9wbHltb3V0aC9wbHltb3V0aC9tZXJnZV9yZXF1ZXN0cy84MwpBY2tl
ZC1ieTogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBI
YW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9k
cm1fY29ubmVjdG9yLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwppbmRleCA0MGE5ODVjNDExYTYuLjU5MTkxNGYwMWNk
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCkBAIC0xNDAsNiArMTQwLDEzIEBAIHN0YXRpYyB2
b2lkIGRybV9jb25uZWN0b3JfZ2V0X2NtZGxpbmVfbW9kZShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yKQogCQljb25uZWN0b3ItPmZvcmNlID0gbW9kZS0+Zm9yY2U7CiAJfQogCisJaWYg
KG1vZGUtPnBhbmVsX29yaWVudGF0aW9uICE9IERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9OX1VO
S05PV04pIHsKKwkJRFJNX0lORk8oInNldHRpbmcgY29ubmVjdG9yICVzIHBhbmVsX29yaWVudGF0
aW9uIHRvICVkXG4iLAorCQkJIGNvbm5lY3Rvci0+bmFtZSwgbW9kZS0+cGFuZWxfb3JpZW50YXRp
b24pOworCQlkcm1fY29ubmVjdG9yX3NldF9wYW5lbF9vcmllbnRhdGlvbihjb25uZWN0b3IsCisJ
CQkJCQkgICAgbW9kZS0+cGFuZWxfb3JpZW50YXRpb24pOworCX0KKwogCURSTV9ERUJVR19LTVMo
ImNtZGxpbmUgbW9kZSBmb3IgY29ubmVjdG9yICVzICVzICVkeCVkQCVkSHolcyVzJXNcbiIsCiAJ
CSAgICAgIGNvbm5lY3Rvci0+bmFtZSwgbW9kZS0+bmFtZSwKIAkJICAgICAgbW9kZS0+eHJlcywg
bW9kZS0+eXJlcywKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
