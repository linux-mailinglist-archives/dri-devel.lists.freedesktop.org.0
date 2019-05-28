Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD7C2CBCD
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 18:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6B36E227;
	Tue, 28 May 2019 16:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0AA89F99;
 Tue, 28 May 2019 16:26:02 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l17so12534248wrm.10;
 Tue, 28 May 2019 09:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H1DBpie83K6hVXAyMME3hPzCU6uC+f31L+bIwmOxc8A=;
 b=Trjc2RjBYByIOzJR1ght22wduAQR8ry7ugVgExzwjom5U5udOK2iulRVPxqfOJmSP5
 s0fmTJKMDmBg4qTWxY1FEpyWQ+AzuCL0SD5sME3hBpA19ej++Hm9E3NTR+K+/5qFty0i
 IGoqOp5k6EPvwToewGU3Bac+DICl/5QhmoUktfEaBEgfrNcZLHzNGMTELWauKrU+WmJ0
 9yiA8VgYNDfbSFzqUKgGKRuEB+uP43/0RkqR9i2k619RUf1ri070fF6UzyhwBBPK5o4/
 TUs1mi+1F5oyBX/dY8clwszSzJqDrohpgFAxGlZcdiGC/V9y38nQAjDXJbcIs8TJuqXP
 iu1w==
X-Gm-Message-State: APjAAAWpgpYs2Sjw8H6elQ4ubZ1b8I8vK3dwLoabN8ZjuWGNyOr1Mjv/
 olH2gD0yOWj0fJzQaxgEZeY1tSRb
X-Google-Smtp-Source: APXvYqzdeFYxR8ORwXrGRyBGbJtqI0jqad0WTO4/bT0kWJFi7gbyD8zzvhSxXMX60vOXoE9iGozZsQ==
X-Received: by 2002:a5d:6807:: with SMTP id w7mr12443584wru.336.1559060761110; 
 Tue, 28 May 2019 09:26:01 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3163:ab92:73d9:6693])
 by smtp.gmail.com with ESMTPSA id f10sm28835470wrg.24.2019.05.28.09.26.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 09:26:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: David1.Zhou@amd.com, Marek.Olsak@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 03/10] drm/ttm: remove manual placement preference
Date: Tue, 28 May 2019 18:25:50 +0200
Message-Id: <20190528162557.1280-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528162557.1280-1-christian.koenig@amd.com>
References: <20190528162557.1280-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=H1DBpie83K6hVXAyMME3hPzCU6uC+f31L+bIwmOxc8A=;
 b=rTJnTWQeqBt3cG6Wcl91FoNi+KuYn/AMZb2EG6hCYJDXskGPKy7jHaPs0GJGH3wxo/
 Ksqz51/tHBTmdhPJNjvWG8bnTbXoQsp0fJ45SfhN5nV2rfyWN+7KcuWKAlL2/j1YnbGK
 e9ko15EaKtX6kvQ7XtWJYMrdr7LqJL6D74r6H53VujNkQqoC97Q++z3+H3H7FJXuZU7o
 ElwNfcmRH+QbjdpO1+tVEglbL5EZHQTelypuE1lci1kegduZuBC/N/a1KplA+bTAOsMs
 tYO5/1s6r56+A9KlE8Fa7/QuaB25qCRssI2Qg46sU3HnlN4qvrikHL15eeJZRVLa7ctV
 X/nA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgZHJpdmVycyBkb24ndCBwcmVmZXIgYSBzeXN0ZW0gbWVtb3J5IHBsYWNlbWVudAp0aGV5IHNo
b3VsZCBub3QgYnV0IGl0IGludG8gdGhlIHBsYWNlbWVudCBsaXN0IGZpcnN0LgoKU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCAxOCArKysrKysrKystLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmMKaW5kZXggN2I1OWU1ZWNkZTdmLi43MDJjZDg5YWRiZjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwpA
QCAtMTAxMiw4ICsxMDEyLDEyIEBAIGludCB0dG1fYm9fbWVtX3NwYWNlKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8sCiAJCXR0bV9mbGFnX21hc2tlZCgmY3VyX2ZsYWdzLCBwbGFjZS0+Zmxh
Z3MsCiAJCQkJflRUTV9QTF9NQVNLX01FTVRZUEUpOwogCi0JCWlmIChtZW1fdHlwZSA9PSBUVE1f
UExfU1lTVEVNKQotCQkJYnJlYWs7CisJCWlmIChtZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNKSB7
CisJCQltZW0tPm1lbV90eXBlID0gbWVtX3R5cGU7CisJCQltZW0tPnBsYWNlbWVudCA9IGN1cl9m
bGFnczsKKwkJCW1lbS0+bW1fbm9kZSA9IE5VTEw7CisJCQlyZXR1cm4gMDsKKwkJfQogCiAJCXJl
dCA9ICgqbWFuLT5mdW5jLT5nZXRfbm9kZSkobWFuLCBibywgcGxhY2UsIG1lbSk7CiAJCWlmICh1
bmxpa2VseShyZXQpKQpAQCAtMTAyNSwxNiArMTAyOSwxMiBAQCBpbnQgdHRtX2JvX21lbV9zcGFj
ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQkJCSgqbWFuLT5mdW5jLT5wdXRfbm9k
ZSkobWFuLCBtZW0pOwogCQkJCXJldHVybiByZXQ7CiAJCQl9Ci0JCQlicmVhazsKKwkJCW1lbS0+
bWVtX3R5cGUgPSBtZW1fdHlwZTsKKwkJCW1lbS0+cGxhY2VtZW50ID0gY3VyX2ZsYWdzOworCQkJ
cmV0dXJuIDA7CiAJCX0KIAl9CiAKLQlpZiAoKHR5cGVfb2sgJiYgKG1lbV90eXBlID09IFRUTV9Q
TF9TWVNURU0pKSB8fCBtZW0tPm1tX25vZGUpIHsKLQkJbWVtLT5tZW1fdHlwZSA9IG1lbV90eXBl
OwotCQltZW0tPnBsYWNlbWVudCA9IGN1cl9mbGFnczsKLQkJcmV0dXJuIDA7Ci0JfQotCiAJZm9y
IChpID0gMDsgaSA8IHBsYWNlbWVudC0+bnVtX2J1c3lfcGxhY2VtZW50OyArK2kpIHsKIAkJY29u
c3Qgc3RydWN0IHR0bV9wbGFjZSAqcGxhY2UgPSAmcGxhY2VtZW50LT5idXN5X3BsYWNlbWVudFtp
XTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
