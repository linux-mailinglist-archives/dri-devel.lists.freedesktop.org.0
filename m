Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 942734335C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42214892D5;
	Thu, 13 Jun 2019 07:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F77E89468
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:33:26 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 83so8524774pgg.8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ww6brkr59ulFad1KL7LWJRPTHM4vzJU/q/AyY2cW8Es=;
 b=qniLSZgDsqGE9/OlfcgHAUIikLxW0p0ixFyyM8pooYY5QtyJx48eEUPPBxhoumuAPo
 etiqSXsR8q55UbalFFPfiwsEzYXjhBxvqbFIj2Y7d4+YOkEyCnHOgz4aB+xLz1ifrExj
 xHHvJtGNYDVSOAGLAy4HCj/KqkSux7JQCYn4cI6UX/mYtqfPaFiuV5c1E/aHmUYt0Jyy
 kGZpZFlfgM2QIknz+N70dKkJTj63Ty1uhmTZF0D6wZn177CImEX+gHeDKCwT4wl0mZt8
 vsW3nsBonzdG3Cyyo02cbJnPqLTfu6ajBNZUBtJtOqp0PjRym53264FtW6QT4ztkLSjD
 BAVw==
X-Gm-Message-State: APjAAAXB4VKLO503IePVqtQVQHqa1TXL2zMXpaSWbvFZsxr6mxVLCeiw
 fJhjMPl/aM1508Rdxf7gr70aAbPkUbU=
X-Google-Smtp-Source: APXvYqyxl34p06cYUEj4S/jd5SfPoeVgMlKjFMraSOKtxEop59Si1HJYqH2IDxpdPh58M5IZ3/z9iA==
X-Received: by 2002:a17:90a:8a10:: with SMTP id
 w16mr31528113pjn.133.1560328405864; 
 Wed, 12 Jun 2019 01:33:25 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d21sm18845991pfr.162.2019.06.12.01.33.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 01:33:25 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 13/15] drm/bridge: tc358767: Simplify tc_aux_wait_busy()
Date: Wed, 12 Jun 2019 01:32:50 -0700
Message-Id: <20190612083252.15321-14-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612083252.15321-1-andrew.smirnov@gmail.com>
References: <20190612083252.15321-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ww6brkr59ulFad1KL7LWJRPTHM4vzJU/q/AyY2cW8Es=;
 b=nW+E4KDzpmgWAUJ0Tpc6bOnHwrdWhmDOOQ0VZRQktRWGal0aB80LNVmsUJ8rixGYBf
 J42Qgvq1YrTh+vt47FXanyjj4cREHnqIgyCLpDUKRJ6NsReiH/Dwio1JGu0ErqIicQLm
 EaThXafTHKYS1bqZlSqJCJRRJ66+p3xB9Z1kHHsf5WhUhkzMhzxmCiFrM/CX5jZiTmZT
 dUFUmQEm2akdXAArBrV8XCemHKKV37Vg25pMl1aI9Dx2fpTjdFtD0lTieSLCvLUSGZ1J
 88EaQK0IKTCoOZ9dB+gsHEV8Nt38oBZRNek1VmLFL4KusxMcjUFGEPNdP+QFRd+F98cg
 Ledg==
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
aW5kZXggMjhkZjUzZjdjMzQ5Li4wMWNhOTJhNmQ5YzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4
NzY3LmMKQEAgLTI5NCwxMCArMjk0LDkgQEAgc3RhdGljIGlubGluZSBpbnQgdGNfcG9sbF90aW1l
b3V0KHN0cnVjdCB0Y19kYXRhICp0YywgdW5zaWduZWQgaW50IGFkZHIsCiAJCQkJCXNsZWVwX3Vz
LCB0aW1lb3V0X3VzKTsKIH0KIAotc3RhdGljIGludCB0Y19hdXhfd2FpdF9idXN5KHN0cnVjdCB0
Y19kYXRhICp0YywgdW5zaWduZWQgaW50IHRpbWVvdXRfbXMpCitzdGF0aWMgaW50IHRjX2F1eF93
YWl0X2J1c3koc3RydWN0IHRjX2RhdGEgKnRjKQogewotCXJldHVybiB0Y19wb2xsX3RpbWVvdXQo
dGMsIERQMF9BVVhTVEFUVVMsIEFVWF9CVVNZLCAwLAotCQkJICAgICAgIDEwMDAsIDEwMDAgKiB0
aW1lb3V0X21zKTsKKwlyZXR1cm4gdGNfcG9sbF90aW1lb3V0KHRjLCBEUDBfQVVYU1RBVFVTLCBB
VVhfQlVTWSwgMCwgMTAwMCwgMTAwMDAwKTsKIH0KIAogc3RhdGljIGludCB0Y19hdXhfd3JpdGVf
ZGF0YShzdHJ1Y3QgdGNfZGF0YSAqdGMsIGNvbnN0IHZvaWQgKmRhdGEsCkBAIC0zNTAsNyArMzQ5
LDcgQEAgc3RhdGljIHNzaXplX3QgdGNfYXV4X3RyYW5zZmVyKHN0cnVjdCBkcm1fZHBfYXV4ICph
dXgsCiAJdTMyIGF1eHN0YXR1czsKIAlpbnQgcmV0OwogCi0JcmV0ID0gdGNfYXV4X3dhaXRfYnVz
eSh0YywgMTAwKTsKKwlyZXQgPSB0Y19hdXhfd2FpdF9idXN5KHRjKTsKIAlpZiAocmV0KQogCQly
ZXR1cm4gcmV0OwogCkBAIC0zNzcsNyArMzc2LDcgQEAgc3RhdGljIHNzaXplX3QgdGNfYXV4X3Ry
YW5zZmVyKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsK
IAotCXJldCA9IHRjX2F1eF93YWl0X2J1c3kodGMsIDEwMCk7CisJcmV0ID0gdGNfYXV4X3dhaXRf
YnVzeSh0Yyk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotLSAKMi4yMS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
