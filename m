Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA7C5D74D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 22:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EC66E03A;
	Tue,  2 Jul 2019 20:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CD66E03A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 20:26:57 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id m29so41949qtu.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 13:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J/H70/FePQbdKZEz0YI3H5/o3CPPkZQZGrIygUbL5uE=;
 b=AjsxAMBJx2Qo3Nhcu1OdJXzdBC9c8pd9Seg8I615EIKGF+oN+8fLLXEi8OcpwqhAgU
 JlYaYdJQbUGqpMNPyX6HbAGrXoH+1UgVNUY3MZ6HpkzWKUSyn5OM5EgTkQqnjscHvgBz
 XcbpV7dinjniIqmhFrfJavTHFaKf0CWVLTuFBgw1c0jkxSx1UtUwBL/cubWwq5GnbIhh
 51nwF4sfHTyMTdJhAVywiPEdDar6tCOGZ/c26HQ5V+7Pq5WUsg6Gi0tBMeGVOgh+UJKG
 bFhIlUoSRD+nA75HoE5VJrduWX8Vkn73vvy/rE2hPvVwIJYbg9swamZFkTMFKGZznjHz
 o5mA==
X-Gm-Message-State: APjAAAU7xlresv0fl7jx6dRxoYq2VMQmwU43y+S8+gBWlcgWEhZ30I5/
 mkBamTMluDnwoJTV5gbPqG4=
X-Google-Smtp-Source: APXvYqwBpRrG3Pu/9gU8tjH7/kzX84pSdwZg+HHw7dt535o3fbveN8pbp8WelpaRmR8Le4djtZu+DQ==
X-Received: by 2002:ac8:36b9:: with SMTP id a54mr27547900qtc.300.1562099216912; 
 Tue, 02 Jul 2019 13:26:56 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id d38sm7249904qtb.95.2019.07.02.13.26.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:26:56 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] iommu: add support for drivers that manage iommu
 explicitly
Date: Tue,  2 Jul 2019 13:26:18 -0700
Message-Id: <20190702202631.32148-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202631.32148-1-robdclark@gmail.com>
References: <20190702202631.32148-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J/H70/FePQbdKZEz0YI3H5/o3CPPkZQZGrIygUbL5uE=;
 b=TCnekBuPYD3hUrz8zIp0zu2L4/GpJvf48ABFai2kUMx5JRSj+cJ9F4qllXaSyBUW3P
 jUaysD401DDUnfOo3Klccf/XsoXJ16g19L5I8D93FmKem3TenRjTAPawa623RFJCL6qK
 d63Y6sMyeBjwYA4P/+VM58+DDKEo538UFqKZCsoF75gu8J+6hJVvOWOGyd58UpTYAb57
 q5Ld3cG0P/Xnf8kMmLLMqTAZ1oqG80KTqDM7j+N5I9qC+N6LWOdROwCPko32+cCB7Ltn
 Y3vEBK04m3JwgwmnrrbIBtdJmXO9XPmSAo0oShklDieS2klivlvOqFdhJBLIoDcBywvk
 KvSQ==
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Joe Perches <joe@perches.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKQXZvaWQgYXR0YWNoaW5n
IGFueSBub24tZHJpdmVyIG1hbmFnZWQgZG9tYWluIGlmIHRoZSBkcml2ZXIgaW5kaWNhdGVzCnRo
YXQgaXQgbWFuYWdlcyB0aGUgaW9tbXUgZGlyZWN0bHkuCgpUaGlzIHNvbHZlcyBhIGNvdXBsZSBw
cm9ibGVtcyB0aGF0IGRybS9tc20gKyBhcm0tc21tdSBoYXMgd2l0aCB0aGUgaW9tbXUKZnJhbWV3
b3JrOgoKMSkgSW4gc29tZSBjYXNlcyB0aGUgYm9vdGxvYWRlciB0YWtlcyB0aGUgaW9tbXUgb3V0
IG9mIGJ5cGFzcyBhbmQKICAgZW5hYmxlcyB0aGUgZGlzcGxheS4gIFRoaXMgaXMgaW4gcGFydGlj
dWxhciBhIHByb2JsZW0gb24gdGhlIGFhcmNoNjQKICAgbGFwdG9wcyB0aGF0IGV4aXN0IHRoZXNl
IGRheXMsIGFuZCBtb2Rlcm4gc25hcGRyYWdvbiBhbmRyb2lkIGRldmljZXMuCiAgIChPbGRlciBk
ZXZpY2VzIGFsc28gZW5hYmxlZCB0aGUgZGlzcGxheSBpbiBib290bG9hZGVyIGJ1dCBkaWQgbm90
CiAgIHRha2UgdGhlIGlvbW11IG91dCBvZiBieXBhc3MuKSAgQXR0YWNoaW5nIGEgRE1BIG9yIElE
RU5USVRZIGRvbWFpbgogICB3aGlsZSBzY2Fub3V0IGlzIGFjdGl2ZSwgYmVmb3JlIHRoZSBkcml2
ZXIgaGFzIGEgY2hhbmNlIHRvIGludGVydmVuZSwKICAgbWFrZXMgdGhpbmdzIGdvICpib29tKgoK
MikgV2UgYXJlIGN1cnJlbnRseSBibG9ja2VkIG9uIGxhbmRpbmcgc3VwcG9ydCBmb3IgR1BVIHBl
ci1jb250ZXh0CiAgIHBhZ2V0YWJsZXMgYmVjYXVzZSBvZiB0aGUgZG9tYWluIGF0dGFjaGVkIGJl
Zm9yZSBkcml2ZXIncyAtPnByb2JlKCkKICAgaXMgY2FsbGVkLgoKVGhpcyBzb2x2ZXMgYm90aCBw
cm9ibGVtcy4KClNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9y
Zz4KLS0tCiBkcml2ZXJzL2lvbW11L2lvbW11LmMgIHwgMTEgKysrKysrKysrKysKIGluY2x1ZGUv
bGludXgvZGV2aWNlLmggfCAgMyArKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvaW9tbXUuYyBiL2Ry
aXZlcnMvaW9tbXUvaW9tbXUuYwppbmRleCAwYzY3NGQ4MGMzN2YuLmVmYTA5NTdmOTc3MiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9pb21tdS9pb21tdS5jCisrKyBiL2RyaXZlcnMvaW9tbXUvaW9tbXUu
YwpAQCAtMTU3Myw2ICsxNTczLDE3IEBAIHN0YXRpYyBpbnQgX19pb21tdV9hdHRhY2hfZGV2aWNl
KHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbiwKIAkgICAgZG9tYWluLT5vcHMtPmlzX2F0dGFj
aF9kZWZlcnJlZChkb21haW4sIGRldikpCiAJCXJldHVybiAwOwogCisJLyoKKwkgKiBJZiBkcml2
ZXIgaXMgZ29pbmcgdG8gbWFuYWdlIGlvbW11IGRpcmVjdGx5LCB0aGVuIGF2b2lkCisJICogYXR0
YWNoaW5nIGFueSBub24gZHJpdmVyIG1hbmFnZWQgZG9tYWluLiAgVGhlcmUgY291bGQKKwkgKiBi
ZSBhbHJlYWR5IGFjdGl2ZSBkbWEgdW5kZXJ3YXkgKGllLiBzY2Fub3V0IGluIGNhc2Ugb2YKKwkg
KiBib290bG9hZGVyIGVuYWJsZWQgZGlzcGxheSksIGFuZCBpbnRlcmZlcmluZyB3aXRoIHRoYXQK
KwkgKiB3aWxsIG1ha2UgdGhpbmdzIGdvICpib29tKgorCSAqLworCWlmICgoZG9tYWluLT50eXBl
ICE9IElPTU1VX0RPTUFJTl9VTk1BTkFHRUQpICYmCisJICAgIGRldi0+ZHJpdmVyICYmIGRldi0+
ZHJpdmVyLT5kcml2ZXJfbWFuYWdlc19pb21tdSkKKwkJcmV0dXJuIDA7CisKIAlpZiAodW5saWtl
bHkoZG9tYWluLT5vcHMtPmF0dGFjaF9kZXYgPT0gTlVMTCkpCiAJCXJldHVybiAtRU5PREVWOwog
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RldmljZS5oIGIvaW5jbHVkZS9saW51eC9kZXZp
Y2UuaAppbmRleCBlMTM4YmFhYmUwMWUuLmQ5OGFhNGQzYzhjMyAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9saW51eC9kZXZpY2UuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RldmljZS5oCkBAIC0yODIsNyAr
MjgyLDggQEAgc3RydWN0IGRldmljZV9kcml2ZXIgewogCXN0cnVjdCBtb2R1bGUJCSpvd25lcjsK
IAljb25zdCBjaGFyCQkqbW9kX25hbWU7CS8qIHVzZWQgZm9yIGJ1aWx0LWluIG1vZHVsZXMgKi8K
IAotCWJvb2wgc3VwcHJlc3NfYmluZF9hdHRyczsJLyogZGlzYWJsZXMgYmluZC91bmJpbmQgdmlh
IHN5c2ZzICovCisJYm9vbCBzdXBwcmVzc19iaW5kX2F0dHJzOjE7CS8qIGRpc2FibGVzIGJpbmQv
dW5iaW5kIHZpYSBzeXNmcyAqLworCWJvb2wgZHJpdmVyX21hbmFnZXNfaW9tbXU6MTsJLyogZHJp
dmVyIG1hbmFnZXMgSU9NTVUgZXhwbGljaXRseSAqLwogCWVudW0gcHJvYmVfdHlwZSBwcm9iZV90
eXBlOwogCiAJY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZAkqb2ZfbWF0Y2hfdGFibGU7Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
