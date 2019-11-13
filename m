Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21109FB580
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 17:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8409A6EDAE;
	Wed, 13 Nov 2019 16:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515456EDA9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 16:45:04 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-wB16Xj1zMBOQhxAGABCY_Q-1; Wed, 13 Nov 2019 11:45:01 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 554C29CF6F9;
 Wed, 13 Nov 2019 16:45:00 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-143.ams2.redhat.com
 [10.36.116.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B608C10592A1;
 Wed, 13 Nov 2019 16:44:58 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 13/13] drm/connector: Hookup the new drm_cmdline_mode
 panel_orientation member
Date: Wed, 13 Nov 2019 17:44:34 +0100
Message-Id: <20191113164434.254159-13-hdegoede@redhat.com>
In-Reply-To: <20191113164434.254159-1-hdegoede@redhat.com>
References: <20191113164434.254159-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: wB16Xj1zMBOQhxAGABCY_Q-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573663503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l7dexyr6XG+PEFyZz8QYb0razKgDalgKjygV9sAi6xo=;
 b=dALxliEr5OuJUSCegGge4SD1hw60WqYc40mMufPpdFl2j5MCZ0uRU1c4lnNj94w9S0q/WE
 LYKrY8JZKAfrQ/FE58WGyR8mHGcyjOMpekLtgjwfVNLSZConSiVYbZLGjl+9IF4v8Pc55A
 D0K7Zo73Yvc6ERp/7BEvziDl9BOgj9I=
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
LmZyZWVkZXNrdG9wLm9yZy9wbHltb3V0aC9wbHltb3V0aC9tZXJnZV9yZXF1ZXN0cy84MwpTaWdu
ZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rv
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwppbmRleCA0MGE5ODVjNDExYTYu
LjU5MTkxNGYwMWNkNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3Iu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCkBAIC0xNDAsNiArMTQwLDEz
IEBAIHN0YXRpYyB2b2lkIGRybV9jb25uZWN0b3JfZ2V0X2NtZGxpbmVfbW9kZShzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCQljb25uZWN0b3ItPmZvcmNlID0gbW9kZS0+Zm9yY2U7
CiAJfQogCisJaWYgKG1vZGUtPnBhbmVsX29yaWVudGF0aW9uICE9IERSTV9NT0RFX1BBTkVMX09S
SUVOVEFUSU9OX1VOS05PV04pIHsKKwkJRFJNX0lORk8oInNldHRpbmcgY29ubmVjdG9yICVzIHBh
bmVsX29yaWVudGF0aW9uIHRvICVkXG4iLAorCQkJIGNvbm5lY3Rvci0+bmFtZSwgbW9kZS0+cGFu
ZWxfb3JpZW50YXRpb24pOworCQlkcm1fY29ubmVjdG9yX3NldF9wYW5lbF9vcmllbnRhdGlvbihj
b25uZWN0b3IsCisJCQkJCQkgICAgbW9kZS0+cGFuZWxfb3JpZW50YXRpb24pOworCX0KKwogCURS
TV9ERUJVR19LTVMoImNtZGxpbmUgbW9kZSBmb3IgY29ubmVjdG9yICVzICVzICVkeCVkQCVkSHol
cyVzJXNcbiIsCiAJCSAgICAgIGNvbm5lY3Rvci0+bmFtZSwgbW9kZS0+bmFtZSwKIAkJICAgICAg
bW9kZS0+eHJlcywgbW9kZS0+eXJlcywKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
