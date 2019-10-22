Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8136E13A8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACAD6E990;
	Wed, 23 Oct 2019 08:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585E16E454
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:36:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id i13so883899wmd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 01:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OjHvv8ZdSVaFl2j34zmQMRFMhFwh+26xUwIofDUAWMQ=;
 b=bHU0nFqp/1DUZ7f8hZ6YGj6BpicmFEp1jttJlogazXLds4oso5g+mFMY4YB1ZJAHHv
 loPrt7FMq4Nex4ISEi+wVxC/oL07bT7f64s3bh393UfsAvnyiBOqbAXJpKyDI70upTdy
 ubDCtRL5yrT2nlS3S2JoVq6WivpsLXyGFH80AYXkQZvX3e4Wqf5htDQ3SNTANinvl4fv
 Gwhu8FWsy2O24px4FlpJUHGjQBSJ6akOo1M2X2ZtP9SaSLrXrHNtWcBsqNXMAqTSfThF
 yFTywqsrxSUBWPjtN9iXRlDDi9wh7EE0f2rjmkPTnAnP9iys5jo6qIqjcGHSLv6egH8P
 EyUA==
X-Gm-Message-State: APjAAAU7p8XpUXIKMPjhCOTo4oi5ZDjW52b0TRMQbO9nmGlSXtO5no9t
 xbRxYn4xmwUfBLq6eZYD3Nn7vQ==
X-Google-Smtp-Source: APXvYqwKHDyg0m8WqC6lLMl8/nhXbBRKfJRxg4+8ou9ARo5YAW/NNdc3UuYo+8foYS7XDWsI6AWPPA==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr1840598wmj.126.1571733399937; 
 Tue, 22 Oct 2019 01:36:39 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id g17sm17115253wrq.58.2019.10.22.01.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 01:36:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v7 3/9] backlight: gpio: explicitly set the direction of the
 GPIO
Date: Tue, 22 Oct 2019 10:36:24 +0200
Message-Id: <20191022083630.28175-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022083630.28175-1-brgl@bgdev.pl>
References: <20191022083630.28175-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OjHvv8ZdSVaFl2j34zmQMRFMhFwh+26xUwIofDUAWMQ=;
 b=UkLVmhIaiNsxcswxRm7saAjEeStKBBF+NXde2AaAQaH3O4OXrI2JqpEeNiYtx1tT4k
 O3tmDJV08ouTAT18mpcXHM49waszOD09C3kcJoqJ1K3QN1xmklwP/eU7Hi3Da1KpH6+p
 xHzUd7cW8tvQpL0LdK8EzIbsEydpnZXp6EgfJ09/AxanR8iqfgD2W5clxItpQ1XlxvE1
 Y3NivMmlc1FI2uZ+h4mjPDpGg07DcZC5wE4UFYAR5q7HGQNTlYTFiD5P+jRs/sNoqlfW
 5Afs8sR94u+Uqox3JbfZuJfuKgrV7Pd2SzSCLdqv7UzJb6rRU5U+dBwxaIfjR8LqHfw9
 VMTA==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClRo
ZSBHUElPIGJhY2tsaWdodCBkcml2ZXIgY3VycmVudGx5IHJlcXVlc3RzIHRoZSBsaW5lICdhcyBp
cycsIHdpdGhvdXQKYWNpdmVseSBzZXR0aW5nIGl0cyBkaXJlY3Rpb24uIFRoaXMgY2FuIGxlYWQg
dG8gcHJvYmxlbXM6IGlmIHRoZSBsaW5lCmlzIGluIGlucHV0IG1vZGUgYnkgZGVmYXVsdCwgd2Ug
d29uJ3QgYmUgYWJsZSB0byBkcml2ZSBpdCBsYXRlciB3aGVuCnVwZGF0aW5nIHRoZSBzdGF0dXMg
YW5kIGFsc28gcmVhZGluZyBpdHMgaW5pdGlhbCB2YWx1ZSBkb2Vzbid0IG1ha2UKc2Vuc2UgZm9y
IGJhY2tsaWdodCBzZXR0aW5nLgoKUmVxdWVzdCB0aGUgbGluZSAnYXMgaXMnIGluaXRpYWxseSwg
c28gdGhhdCB3ZSBjYW4gcmVhZCBpdHMgdmFsdWUKd2l0aG91dCBhZmZlY3RpbmcgaXQgYnV0IHRo
ZW4gY2hhbmdlIHRoZSBkaXJlY3Rpb24gdG8gb3V0cHV0IGV4cGxpY2l0bHkKd2hlbiBzZXR0aW5n
IHRoZSBpbml0aWFsIGJyaWdodG5lc3MuCgpBbHNvOiBjaGVjayB0aGUgY3VycmVudCBkaXJlY3Rp
b24gYW5kIG9ubHkgcmVhZCB0aGUgdmFsdWUgaWYgaXQncyBvdXRwdXQuCgpTaWduZWQtb2ZmLWJ5
OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgotLS0KIGRy
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgfCAyMyArKysrKysrKysrKysr
KysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQu
YyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKaW5kZXggMzk1NWI1
MTNmMmY4Li41MmYxN2M5Y2ExYzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0
L2dwaW9fYmFja2xpZ2h0LmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNr
bGlnaHQuYwpAQCAtMjUsOSArMjUsOCBAQCBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgewogCWludCBk
ZWZfdmFsdWU7CiB9OwogCi1zdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMo
c3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJsKQorc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9n
ZXRfbmV4dF9icmlnaHRuZXNzKHN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpibCkKIHsKLQlzdHJ1
Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibCA9IGJsX2dldF9kYXRhKGJsKTsKIAlpbnQgYnJpZ2h0bmVz
cyA9IGJsLT5wcm9wcy5icmlnaHRuZXNzOwogCiAJaWYgKGJsLT5wcm9wcy5wb3dlciAhPSBGQl9C
TEFOS19VTkJMQU5LIHx8CkBAIC0zNSw2ICszNCwxNCBAQCBzdGF0aWMgaW50IGdwaW9fYmFja2xp
Z2h0X3VwZGF0ZV9zdGF0dXMoc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJsKQogCSAgICBibC0+
cHJvcHMuc3RhdGUgJiAoQkxfQ09SRV9TVVNQRU5ERUQgfCBCTF9DT1JFX0ZCQkxBTkspKQogCQli
cmlnaHRuZXNzID0gMDsKIAorCXJldHVybiBicmlnaHRuZXNzOworfQorCitzdGF0aWMgaW50IGdw
aW9fYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMoc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJsKQor
eworCXN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsID0gYmxfZ2V0X2RhdGEoYmwpOworCWludCBi
cmlnaHRuZXNzID0gZ3Bpb19iYWNrbGlnaHRfZ2V0X25leHRfYnJpZ2h0bmVzcyhibCk7CisKIAln
cGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAoZ2JsLT5ncGlvZCwgYnJpZ2h0bmVzcyk7CiAKIAlyZXR1
cm4gMDsKQEAgLTg1LDcgKzkyLDggQEAgc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9pbml0aWFs
X3Bvd2VyX3N0YXRlKHN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsKQogCQlyZXR1cm4gZ2JsLT5k
ZWZfdmFsdWUgPyBGQl9CTEFOS19VTkJMQU5LIDogRkJfQkxBTktfUE9XRVJET1dOOwogCiAJLyog
aWYgdGhlIGVuYWJsZSBHUElPIGlzIGRpc2FibGVkLCBkbyBub3QgZW5hYmxlIHRoZSBiYWNrbGln
aHQgKi8KLQlpZiAoZ3Bpb2RfZ2V0X3ZhbHVlX2NhbnNsZWVwKGdibC0+Z3Bpb2QpID09IDApCisJ
aWYgKGdwaW9kX2dldF9kaXJlY3Rpb24oZ2JsLT5ncGlvZCkgPT0gMCAmJgorCSAgICBncGlvZF9n
ZXRfdmFsdWVfY2Fuc2xlZXAoZ2JsLT5ncGlvZCkgPT0gMCkKIAkJcmV0dXJuIEZCX0JMQU5LX1BP
V0VSRE9XTjsKIAogCXJldHVybiBGQl9CTEFOS19VTkJMQU5LOwpAQCAtOTgsNyArMTA2LDcgQEAg
c3RhdGljIGludCBncGlvX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogCXN0cnVjdCBiYWNrbGlnaHRfcHJvcGVydGllcyBwcm9wczsKIAlzdHJ1Y3QgYmFja2xp
Z2h0X2RldmljZSAqYmw7CiAJc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpnYmw7Ci0JaW50IHJldDsK
KwlpbnQgcmV0LCBpbml0X2JyaWdodG5lc3M7CiAKIAlnYmwgPSBkZXZtX2t6YWxsb2MoJnBkZXYt
PmRldiwgc2l6ZW9mKCpnYmwpLCBHRlBfS0VSTkVMKTsKIAlpZiAoZ2JsID09IE5VTEwpCkBAIC0x
NTEsNyArMTU5LDEyIEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKIAlibC0+cHJvcHMucG93ZXIgPSBncGlvX2JhY2tsaWdodF9p
bml0aWFsX3Bvd2VyX3N0YXRlKGdibCk7CiAJYmwtPnByb3BzLmJyaWdodG5lc3MgPSAxOwogCi0J
YmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMoYmwpOworCWluaXRfYnJpZ2h0bmVzcyA9IGdwaW9fYmFj
a2xpZ2h0X2dldF9uZXh0X2JyaWdodG5lc3MoYmwpOworCXJldCA9IGdwaW9kX2RpcmVjdGlvbl9v
dXRwdXQoZ2JsLT5ncGlvZCwgaW5pdF9icmlnaHRuZXNzKTsKKwlpZiAocmV0KSB7CisJCWRldl9l
cnIoJnBkZXYtPmRldiwgImZhaWxlZCB0byBzZXQgaW5pdGlhbCBicmlnaHRuZXNzXG4iKTsKKwkJ
cmV0dXJuIHJldDsKKwl9CiAKIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBibCk7CiAJcmV0
dXJuIDA7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
