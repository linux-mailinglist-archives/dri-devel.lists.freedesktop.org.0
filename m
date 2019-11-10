Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EE3F69DA
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 16:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2B26E750;
	Sun, 10 Nov 2019 15:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457826E6A5
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 15:41:33 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-ZvyzGTY1MGeljVA4PNCghg-1; Sun, 10 Nov 2019 10:41:29 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCFA2801E5F;
 Sun, 10 Nov 2019 15:41:27 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-82.ams2.redhat.com
 [10.36.116.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4232C608BB;
 Sun, 10 Nov 2019 15:41:26 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH 12/12] drm/connector: Hookup the new drm_cmdline_mode
 panel_orientation member
Date: Sun, 10 Nov 2019 16:41:01 +0100
Message-Id: <20191110154101.26486-13-hdegoede@redhat.com>
In-Reply-To: <20191110154101.26486-1-hdegoede@redhat.com>
References: <20191110154101.26486-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: ZvyzGTY1MGeljVA4PNCghg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573400492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l7dexyr6XG+PEFyZz8QYb0razKgDalgKjygV9sAi6xo=;
 b=flrKdx7zlPfrw9yMK6VTfPxyP+XFM4zNTRyP7i+Fvu3XlDnP+EYpx0bSvX76trZQcxxmE+
 Q8+1fsP5fGkfg5SYEMkcGNQPsFuAG/U9D1YhvhSo5Ayw7+7ezTNnkMR7bPGaH8R+9lnge1
 cqT72CN5f2ztJDvF73jGjHHLQh79V6I=
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
