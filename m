Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32182E3898
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642706E4C1;
	Thu, 24 Oct 2019 16:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8BD6E49A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:45:59 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id n7so2776116wmc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lnMOXHki5l5YHT5nhAWPY1kZFjM9Z7XrrlTmxdNtDB8=;
 b=KnUmaB8upSrs6B9fhz848oRVJ7tVWeL9P47S0pn4oxI2rt+6HuNIffJgItNgnPa4EJ
 aUo0S+yW4Br6l0lpRGdX59jCP71qCHPn4irYcEJY3zCRgjH1LpOT6Jh+eATeUA7SIPNY
 uYss1bnSvAZMRboQQBKeNLQJGbxSM+kIXuKW9GmiPV/FNdxENaVkPWjjZn9vEHIbYzCq
 X2WuIUhWu6BvpP9SjsEyfoa1TJ2PwzPL0Cd7uUHgjJZMBUQjNQaLitYUZvViVhjkAsDg
 Rqi4L3C5S9Owg9bx1qwt7yzTunpwIx+WGzHeixjC/H2CHipjOHkL81qCwP7CZMtkKjNm
 PKwA==
X-Gm-Message-State: APjAAAWHqczdDdF3Kfwy7yyJgfBO8PndRjsGcu4ccOotBhlWqgZkmA6c
 WARxdnaOvshZOswpaEikDRc=
X-Google-Smtp-Source: APXvYqw+WRepsU1FlsCHgNAsAd5lm7lvHENMKSFTPWEDlyGF4qPLf0sAQvpgB3+/ezT1z1JCgjGw2w==
X-Received: by 2002:a7b:c846:: with SMTP id c6mr6040145wml.68.1571935557725;
 Thu, 24 Oct 2019 09:45:57 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id n1sm31200504wrg.67.2019.10.24.09.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:45:56 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 09/32] drm/tegra: dp: Read alternate scrambler reset
 capability from sink
Date: Thu, 24 Oct 2019 18:45:11 +0200
Message-Id: <20191024164534.132764-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lnMOXHki5l5YHT5nhAWPY1kZFjM9Z7XrrlTmxdNtDB8=;
 b=T1gviikxvQIZr4jUM5jOqCz7ZYaO2amBvBHkxQ9hUN7Gei22idMJIbafztcB1cr7xa
 Leg4mcQR+OYjxmkWE35DlP9bpJzLBz3aLVsW6H68iyWX/y+k1VW9q0SpRlVXiVafD3oX
 QWuY+IiIpRl0iyqNk2aHiUjMv7krelyaja2UVgCS0Un4+qA9GUQVwTDaTQXoz08p+Kjw
 xFC1jw3OuusUFT5PeL9u+GUzboK8lc/i72Sn2cwb2zPl6He04UuV3jsD+OKaQDMl9zWg
 Z2kWEewZqDKvnC5oc01HgDLjauQK9fxc4eABw+JR6R+oakdjBBsWEWyjgLm0W2imCPdA
 QjGQ==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClBhcnNlIGZyb20gdGhl
IHNpbmsgY2FwYWJpbGl0aWVzIHdoZXRoZXIgb3Igbm90IHRoZSBlRFAgYWx0ZXJuYXRlCnNjcmFt
YmxlciByZXNldCB2YWx1ZSBvZiAweGZmZmUgaXMgc3VwcG9ydGVkLgoKU2lnbmVkLW9mZi1ieTog
VGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
dGVncmEvZHAuYyB8IDUgKysrKysKIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5oIHwgNyArKysr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdGVncmEvZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5jCmluZGV4
IDBiZDg3Y2ZmNDU3NS4uMWY0OGMyMTkwZTNiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuYwpAQCAtMTQsNiArMTQs
NyBAQCBzdGF0aWMgdm9pZCBkcm1fZHBfbGlua19jYXBzX3Jlc2V0KHN0cnVjdCBkcm1fZHBfbGlu
a19jYXBzICpjYXBzKQogCWNhcHMtPnRwczNfc3VwcG9ydGVkID0gZmFsc2U7CiAJY2Fwcy0+ZmFz
dF90cmFpbmluZyA9IGZhbHNlOwogCWNhcHMtPmNoYW5uZWxfY29kaW5nID0gZmFsc2U7CisJY2Fw
cy0+YWx0ZXJuYXRlX3NjcmFtYmxlcl9yZXNldCA9IGZhbHNlOwogfQogCiB2b2lkIGRybV9kcF9s
aW5rX2NhcHNfY29weShzdHJ1Y3QgZHJtX2RwX2xpbmtfY2FwcyAqZGVzdCwKQEAgLTIzLDYgKzI0
LDcgQEAgdm9pZCBkcm1fZHBfbGlua19jYXBzX2NvcHkoc3RydWN0IGRybV9kcF9saW5rX2NhcHMg
KmRlc3QsCiAJZGVzdC0+dHBzM19zdXBwb3J0ZWQgPSBzcmMtPnRwczNfc3VwcG9ydGVkOwogCWRl
c3QtPmZhc3RfdHJhaW5pbmcgPSBzcmMtPmZhc3RfdHJhaW5pbmc7CiAJZGVzdC0+Y2hhbm5lbF9j
b2RpbmcgPSBzcmMtPmNoYW5uZWxfY29kaW5nOworCWRlc3QtPmFsdGVybmF0ZV9zY3JhbWJsZXJf
cmVzZXQgPSBzcmMtPmFsdGVybmF0ZV9zY3JhbWJsZXJfcmVzZXQ7CiB9CiAKIHN0YXRpYyB2b2lk
IGRybV9kcF9saW5rX3Jlc2V0KHN0cnVjdCBkcm1fZHBfbGluayAqbGluaykKQEAgLTcxLDYgKzcz
LDkgQEAgaW50IGRybV9kcF9saW5rX3Byb2JlKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsIHN0cnVj
dCBkcm1fZHBfbGluayAqbGluaykKIAlsaW5rLT5jYXBzLmZhc3RfdHJhaW5pbmcgPSBkcm1fZHBf
ZmFzdF90cmFpbmluZ19jYXAoZHBjZCk7CiAJbGluay0+Y2Fwcy5jaGFubmVsX2NvZGluZyA9IGRy
bV9kcF9jaGFubmVsX2NvZGluZ19zdXBwb3J0ZWQoZHBjZCk7CiAKKwlpZiAoZHJtX2RwX2FsdGVy
bmF0ZV9zY3JhbWJsZXJfcmVzZXRfY2FwKGRwY2QpKQorCQlsaW5rLT5jYXBzLmFsdGVybmF0ZV9z
Y3JhbWJsZXJfcmVzZXQgPSB0cnVlOworCiAJbGluay0+cmF0ZSA9IGxpbmstPm1heF9yYXRlOwog
CWxpbmstPmxhbmVzID0gbGluay0+bWF4X2xhbmVzOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdGVncmEvZHAuaCBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5oCmluZGV4IDk4NGRh
YzIxNTY4ZS4uNDVlOGZmMThhYjZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
ZHAuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuaApAQCAtNDIsNiArNDIsMTMgQEAg
c3RydWN0IGRybV9kcF9saW5rX2NhcHMgewogCSAqIEFOU0kgOEIvMTBCIGNoYW5uZWwgY29kaW5n
IGNhcGFiaWxpdHkKIAkgKi8KIAlib29sIGNoYW5uZWxfY29kaW5nOworCisJLyoqCisJICogQGFs
dGVybmF0ZV9zY3JhbWJsZXJfcmVzZXQ6CisJICoKKwkgKiBlRFAgYWx0ZXJuYXRlIHNjcmFtYmxl
ciByZXNldCBjYXBhYmlsaXR5CisJICovCisJYm9vbCBhbHRlcm5hdGVfc2NyYW1ibGVyX3Jlc2V0
OwogfTsKIAogdm9pZCBkcm1fZHBfbGlua19jYXBzX2NvcHkoc3RydWN0IGRybV9kcF9saW5rX2Nh
cHMgKmRlc3QsCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
