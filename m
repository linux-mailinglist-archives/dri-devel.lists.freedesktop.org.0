Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF954B2D0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100F66E2DE;
	Wed, 19 Jun 2019 07:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CBB6E297
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 05:27:51 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id w10so4326122pgj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 22:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ATz0PKN5mMI3tZTn9m6sVSXJRibqX2VwjRpjRqO0NpI=;
 b=XpWFFYCCk7Vn5zRMi/EhpdC/nqFkGFmVKm9rxysLSaiUqH5m9T0pZz1H3MFjI7vZ5M
 RKAI1LOQbSDi82zjyiT+kUZaz+9xpInWdFoVGNtbYQz1MYW+ZrgOyg3AtTRwOdwiMPFy
 2viUFIOBQOsMVDebS6G10TryG9Lgmydp7hhMdCZpIbyalA5gmOagInKYlOYPLGvlLw2y
 Wl5rwt6IdwBSDtpPB4+25CEj5g98eTzoEBJa7NglA80bjxcKSDbV4/XJ/MKoF2lOR7JC
 wWZFOR7pTd4Ke1NF4GRGMGRNJ8E/NxSAwYVJUxNmwMi2atARwmBys2HbRVP4ihI8TlVU
 0HZw==
X-Gm-Message-State: APjAAAX3asj77+h/pmb8yv17SdCzBKklRX3Xo9YhMupJ1eeiT6RjBciZ
 dziCBml6x9eFsCAtdb0dk06jy2Elx/o=
X-Google-Smtp-Source: APXvYqyIjCuk5pABgGgNn0ewTnJGgTKriaInZyUbbTGmzPKqXlHj7H8C7t8R81dnpBNAO8bPNF9U7Q==
X-Received: by 2002:a63:195b:: with SMTP id 27mr6112948pgz.223.1560922070504; 
 Tue, 18 Jun 2019 22:27:50 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id l44sm534742pje.29.2019.06.18.22.27.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 22:27:49 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 12/15] drm/bridge: tc358767: Simplify tc_aux_wait_busy()
Date: Tue, 18 Jun 2019 22:27:13 -0700
Message-Id: <20190619052716.16831-13-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619052716.16831-1-andrew.smirnov@gmail.com>
References: <20190619052716.16831-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ATz0PKN5mMI3tZTn9m6sVSXJRibqX2VwjRpjRqO0NpI=;
 b=m4fgvRqa4w0gKfGgr7Tb09fl1z18of53RtVPlYZGhKyS7wbkFjCIRgIS+vyRIt6SuR
 YW+IiW8RaYLcJxH2wyJblqm9nDO9wXTN036Vd1hgBAiJp96t7VrLWOksoNlN2rT8/PNh
 jOd0EpBkFzw6LEB+bMVWcik61tXwq5f/oV6bMEIhTYZ0NSxJcxOKpjmC0VUaKCu3TCRU
 m6nWe540I40nzXXmB+eYMfP9tRSsSgpqEumt/2fznRqYh1S0FYGuFmXhwtkJAi6Jbb4z
 rto8IX/dIU8lE7JfZ74NFMjoQHspso0MRGd8eagvxSUChfq7IvtTRpecoKlLuW75FiF+
 jBQg==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgbmV2ZXIgcGFzcyBhbnl0aGluZyBidXQgMTAwIGFzIHRpbWVvdXRfbXMgdG8gdGNfYXV4X3dh
aXRfYnVzeSgpLCBzbwp3ZSBtYXkgYXMgd2VsbCBoYXJkY29kZSB0aGF0IHZhbHVlIGFuZCBzaW1w
bGlmeSBmdW5jdGlvbidzIHNpZ25hdHVyZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBTbWlybm92
IDxhbmRyZXcuc21pcm5vdkBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxh
LmhhamRhQHNhbXN1bmcuY29tPgpDYzogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNv
bT4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4KQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+CkNjOiBBbmRyZXkg
R3VzYWtvdiA8YW5kcmV5Lmd1c2Frb3ZAY29nZW50ZW1iZWRkZWQuY29tPgpDYzogUGhpbGlwcCBa
YWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KQ2M6IENvcnkgVHVzYXIgPGNvcnkudHVzYXJA
emlpLmFlcm8+CkNjOiBDaHJpcyBIZWFseSA8Y3BoZWFseUBnbWFpbC5jb20+CkNjOiBMdWNhcyBT
dGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgfCA5ICsrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMK
aW5kZXggZmU2NzJmNmJiYTczLi43Y2MyNmUyNmYzNzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4
NzY3LmMKQEAgLTI5MiwxMCArMjkyLDkgQEAgc3RhdGljIGlubGluZSBpbnQgdGNfcG9sbF90aW1l
b3V0KHN0cnVjdCB0Y19kYXRhICp0YywgdW5zaWduZWQgaW50IGFkZHIsCiAJCQkJCXNsZWVwX3Vz
LCB0aW1lb3V0X3VzKTsKIH0KIAotc3RhdGljIGludCB0Y19hdXhfd2FpdF9idXN5KHN0cnVjdCB0
Y19kYXRhICp0YywgdW5zaWduZWQgaW50IHRpbWVvdXRfbXMpCitzdGF0aWMgaW50IHRjX2F1eF93
YWl0X2J1c3koc3RydWN0IHRjX2RhdGEgKnRjKQogewotCXJldHVybiB0Y19wb2xsX3RpbWVvdXQo
dGMsIERQMF9BVVhTVEFUVVMsIEFVWF9CVVNZLCAwLAotCQkJICAgICAgIDEwMDAsIDEwMDAgKiB0
aW1lb3V0X21zKTsKKwlyZXR1cm4gdGNfcG9sbF90aW1lb3V0KHRjLCBEUDBfQVVYU1RBVFVTLCBB
VVhfQlVTWSwgMCwgMTAwMCwgMTAwMDAwKTsKIH0KIAogc3RhdGljIGludCB0Y19hdXhfd3JpdGVf
ZGF0YShzdHJ1Y3QgdGNfZGF0YSAqdGMsIGNvbnN0IHZvaWQgKmRhdGEsCkBAIC0zMzksNyArMzM4
LDcgQEAgc3RhdGljIHNzaXplX3QgdGNfYXV4X3RyYW5zZmVyKHN0cnVjdCBkcm1fZHBfYXV4ICph
dXgsCiAJaWYgKHNpemUgPT0gMCkKIAkJcmV0dXJuIDA7CiAKLQlyZXQgPSB0Y19hdXhfd2FpdF9i
dXN5KHRjLCAxMDApOworCXJldCA9IHRjX2F1eF93YWl0X2J1c3kodGMpOwogCWlmIChyZXQpCiAJ
CXJldHVybiByZXQ7CiAKQEAgLTM2Nyw3ICszNjYsNyBAQCBzdGF0aWMgc3NpemVfdCB0Y19hdXhf
dHJhbnNmZXIoc3RydWN0IGRybV9kcF9hdXggKmF1eCwKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0
OwogCi0JcmV0ID0gdGNfYXV4X3dhaXRfYnVzeSh0YywgMTAwKTsKKwlyZXQgPSB0Y19hdXhfd2Fp
dF9idXN5KHRjKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0tIAoyLjIxLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
