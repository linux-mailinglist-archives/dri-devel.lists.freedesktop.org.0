Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9667D3809F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 00:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0675B89A14;
	Thu,  6 Jun 2019 22:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEECF899DE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 22:28:05 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id h10so5506510edi.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 15:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9n5T0pbK/9rbszfRHEajQrYFqsuCJNcrkzXFCxa/AyY=;
 b=kEhRSGMZrllwWnTQ1WlO0ru9bd4sEdK9MGK9w5dlaRm0kOSCH+g9aTyRYInL8vaqkc
 wTI7oBsKCP7hwuTRP6BHA8/pN/SOAYAavWTc7N5y5Dpvp/wA0Evj7ac2++ua2tATU1av
 rNbKoOg66FuHIv6sYXBgzDK+0oq4xwXLMUfZgfHgupCqpHxsPmH+vi+XKfEeBK+bdB1S
 29DivXlFL4CQvIl6GYnwFJjlaKyYHhU/AWvOLxdy8+F9Een/4DKVNM3KV2nW41C28qHK
 VU92+MhGlFyqu4O2Vciz2uTcrr1/eA7sE2w4ef2L6yy7PvH/aX7NsHr5jl/vJwJZzVdO
 COkQ==
X-Gm-Message-State: APjAAAW25JIQe5mIhEZtvjnU+eQ51Wbuxw5Ast9KANb7D0mj95vEyqQT
 4pDq4vamL3ZR7GcdQwv548+S67eUZkI=
X-Google-Smtp-Source: APXvYqwVqUVWJSHJFusu/dy8XDlUe4N/K9Wog41VFGlqNQbqhzS1lOwUoFiiJ809Zp303ry9UzXaNg==
X-Received: by 2002:aa7:c717:: with SMTP id i23mr14970613edq.26.1559860084188; 
 Thu, 06 Jun 2019 15:28:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z10sm54228edl.35.2019.06.06.15.28.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 15:28:03 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/10] drm/vkms: Rename vkms_output.state_lock to crc_lock
Date: Fri,  7 Jun 2019 00:27:44 +0200
Message-Id: <20190606222751.32567-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
References: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9n5T0pbK/9rbszfRHEajQrYFqsuCJNcrkzXFCxa/AyY=;
 b=a7PaLcaS03UrDMYAKB1DcTc0yxCI6chmpmTiQivH3ATj4rXAEcldIfRDxl25JD06ha
 O1RJkt/5YMWFrF7Bhtx4HxetqKW2Pe9OzkWjdrl4LW/lcKp+xDDYW4d3KIa/SpUIxIdD
 7ru7Up2c20Tj8zrvo1MxBKQSQR3NNXdqJqiFQ=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGx1cyBhZGQgYSBjb21tZW50IGFib3V0IHdoYXQgaXQgYWN0dWFsbHkgcHJvdGVjdHMuIEl0J3Mg
dmVyeSBsaXR0bGUuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGludGVsLmNvbT4KQ2M6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1lbG9AZ21h
aWwuY29tPgpDYzogSGFuZWVuIE1vaGFtbWVkIDxoYW1vaGFtbWVkLnNhQGdtYWlsLmNvbT4KQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmtt
cy92a21zX2NyYy5jICB8IDQgKystLQogZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcnRjLmMg
fCA2ICsrKy0tLQogZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuaCAgfCA1ICsrKy0tCiAz
IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NyYy5jIGIvZHJpdmVycy9ncHUvZHJtL3Zr
bXMvdmttc19jcmMuYwppbmRleCA4ODNlMzZmZTdiNmUuLjk2ODA2Y2QzNWFkNCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
dmttcy92a21zX2NyYy5jCkBAIC0xNjgsMTQgKzE2OCwxNCBAQCB2b2lkIHZrbXNfY3JjX3dvcmtf
aGFuZGxlKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAl1NjQgZnJhbWVfc3RhcnQsIGZyYW1l
X2VuZDsKIAlib29sIGNyY19wZW5kaW5nOwogCi0Jc3Bpbl9sb2NrX2lycSgmb3V0LT5zdGF0ZV9s
b2NrKTsKKwlzcGluX2xvY2tfaXJxKCZvdXQtPmNyY19sb2NrKTsKIAlmcmFtZV9zdGFydCA9IGNy
dGNfc3RhdGUtPmZyYW1lX3N0YXJ0OwogCWZyYW1lX2VuZCA9IGNydGNfc3RhdGUtPmZyYW1lX2Vu
ZDsKIAljcmNfcGVuZGluZyA9IGNydGNfc3RhdGUtPmNyY19wZW5kaW5nOwogCWNydGNfc3RhdGUt
PmZyYW1lX3N0YXJ0ID0gMDsKIAljcnRjX3N0YXRlLT5mcmFtZV9lbmQgPSAwOwogCWNydGNfc3Rh
dGUtPmNyY19wZW5kaW5nID0gZmFsc2U7Ci0Jc3Bpbl91bmxvY2tfaXJxKCZvdXQtPnN0YXRlX2xv
Y2spOworCXNwaW5fdW5sb2NrX2lycSgmb3V0LT5jcmNfbG9jayk7CiAKIAkvKgogCSAqIFdlIHJh
Y2VkIHdpdGggdGhlIHZibGFuayBocnRpbWVyIGFuZCBwcmV2aW91cyB3b3JrIGFscmVhZHkgY29t
cHV0ZWQKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3J0Yy5jIGIvZHJp
dmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcnRjLmMKaW5kZXggYzcyN2Q4NDg2ZTk3Li41NWIxNmQ1
NDVmZTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3J0Yy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3J0Yy5jCkBAIC0yOSw3ICsyOSw3IEBAIHN0YXRp
YyBlbnVtIGhydGltZXJfcmVzdGFydCB2a21zX3ZibGFua19zaW11bGF0ZShzdHJ1Y3QgaHJ0aW1l
ciAqdGltZXIpCiAJCS8qIHVwZGF0ZSBmcmFtZV9zdGFydCBvbmx5IGlmIGEgcXVldWVkIHZrbXNf
Y3JjX3dvcmtfaGFuZGxlKCkKIAkJICogaGFzIHJlYWQgdGhlIGRhdGEKIAkJICovCi0JCXNwaW5f
bG9jaygmb3V0cHV0LT5zdGF0ZV9sb2NrKTsKKwkJc3Bpbl9sb2NrKCZvdXRwdXQtPmNyY19sb2Nr
KTsKIAkJaWYgKCFzdGF0ZS0+Y3JjX3BlbmRpbmcpCiAJCQlzdGF0ZS0+ZnJhbWVfc3RhcnQgPSBm
cmFtZTsKIAkJZWxzZQpAQCAtMzcsNyArMzcsNyBAQCBzdGF0aWMgZW51bSBocnRpbWVyX3Jlc3Rh
cnQgdmttc192Ymxhbmtfc2ltdWxhdGUoc3RydWN0IGhydGltZXIgKnRpbWVyKQogCQkJCQkgc3Rh
dGUtPmZyYW1lX3N0YXJ0LCBmcmFtZSk7CiAJCXN0YXRlLT5mcmFtZV9lbmQgPSBmcmFtZTsKIAkJ
c3RhdGUtPmNyY19wZW5kaW5nID0gdHJ1ZTsKLQkJc3Bpbl91bmxvY2soJm91dHB1dC0+c3RhdGVf
bG9jayk7CisJCXNwaW5fdW5sb2NrKCZvdXRwdXQtPmNyY19sb2NrKTsKIAogCQlyZXQgPSBxdWV1
ZV93b3JrKG91dHB1dC0+Y3JjX3dvcmtxLCAmc3RhdGUtPmNyY193b3JrKTsKIAkJaWYgKCFyZXQp
CkBAIC0yMjQsNyArMjI0LDcgQEAgaW50IHZrbXNfY3J0Y19pbml0KHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsIHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAlkcm1fY3J0Y19oZWxwZXJfYWRkKGNydGMs
ICZ2a21zX2NydGNfaGVscGVyX2Z1bmNzKTsKIAogCXNwaW5fbG9ja19pbml0KCZ2a21zX291dC0+
bG9jayk7Ci0Jc3Bpbl9sb2NrX2luaXQoJnZrbXNfb3V0LT5zdGF0ZV9sb2NrKTsKKwlzcGluX2xv
Y2tfaW5pdCgmdmttc19vdXQtPmNyY19sb2NrKTsKIAogCXZrbXNfb3V0LT5jcmNfd29ya3EgPSBh
bGxvY19vcmRlcmVkX3dvcmtxdWV1ZSgidmttc19jcmNfd29ya3EiLCAwKTsKIAlpZiAoIXZrbXNf
b3V0LT5jcmNfd29ya3EpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Ry
di5oIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuaAppbmRleCAzYzdlMDZiMTllZmQu
LjQzZDNmOTgyODlmZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5oCkBAIC01Nyw2ICs1Nyw3IEBA
IHN0cnVjdCB2a21zX2NydGNfc3RhdGUgewogCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSBiYXNlOwog
CXN0cnVjdCB3b3JrX3N0cnVjdCBjcmNfd29yazsKIAorCS8qIGJlbG93IHRocmVlIGFyZSBwcm90
ZWN0ZWQgYnkgdmttc19vdXRwdXQuY3JjX2xvY2sgKi8KIAlib29sIGNyY19wZW5kaW5nOwogCXU2
NCBmcmFtZV9zdGFydDsKIAl1NjQgZnJhbWVfZW5kOwpAQCAtNzQsOCArNzUsOCBAQCBzdHJ1Y3Qg
dmttc19vdXRwdXQgewogCXN0cnVjdCB3b3JrcXVldWVfc3RydWN0ICpjcmNfd29ya3E7CiAJLyog
cHJvdGVjdHMgY29uY3VycmVudCBhY2Nlc3MgdG8gY3JjX2RhdGEgKi8KIAlzcGlubG9ja190IGxv
Y2s7Ci0JLyogcHJvdGVjdHMgY29uY3VycmVudCBhY2Nlc3MgdG8gY3J0Y19zdGF0ZSAqLwotCXNw
aW5sb2NrX3Qgc3RhdGVfbG9jazsKKworCXNwaW5sb2NrX3QgY3JjX2xvY2s7CiB9OwogCiBzdHJ1
Y3Qgdmttc19kZXZpY2UgewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
