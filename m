Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9DA3C094
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 02:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539B389176;
	Tue, 11 Jun 2019 00:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CD089137
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 00:23:08 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id k187so5393782pga.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 17:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7l9eJCs2PeowUasvujNxJ+tq7unRBQcTxAKWiz4JMIE=;
 b=igyF/25eaC59ppeWzyDc46FobrfeR/P02LphcFBQuWhgLEhX1PQQTyq+osQfeI1/0i
 P7J6fWtyw3keXI3lGgzQPut7+T0/EKXSGJtVJZwKDug8nMGWdEsrDXyIo7UXDLCwjKnD
 la3itdt25G2ZbiO7K/YbpjMwrSahFMtoEXQSMhRTZNRSVNviG4GgpvubQ+mrKltmLH9Y
 8a6jLQ9pzTdeb3p75rijTjjY5McMp9MAwcHWDG5yDtirjMEXDzKF0RWbvSZ50HZtZcPV
 4FeJVWBJnNQNMSQnRkMWTPQR8BZbHlLygC5DQ8au6yTWG77+9wjqxjBuYCjBAXvMFaxT
 7amw==
X-Gm-Message-State: APjAAAXOnSL1ouf5EFr4qEy3JUsrcgRLFB51MxROH7y+Pp55BlRXqsZQ
 NUYUaGartuw+TnPYgDXQRear8g==
X-Google-Smtp-Source: APXvYqxXrwREiReNGSD5SzpOTe3czQMpgGRjtIlULxAPe0ldReXT1NS+YN+qsMaBOSYIsfxHYJn70A==
X-Received: by 2002:a62:2f87:: with SMTP id v129mr78643128pfv.9.1560212588496; 
 Mon, 10 Jun 2019 17:23:08 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id t4sm540317pjq.19.2019.06.10.17.23.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 17:23:07 -0700 (PDT)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] drm/panel: Add attach/detach callbacks
Date: Mon, 10 Jun 2019 17:22:54 -0700
Message-Id: <20190611002256.186969-4-dbasehore@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190611002256.186969-1-dbasehore@chromium.org>
References: <20190611002256.186969-1-dbasehore@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Jun 2019 00:29:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7l9eJCs2PeowUasvujNxJ+tq7unRBQcTxAKWiz4JMIE=;
 b=evokIjR4FgyjQ4UFLo9iswsV8vW4ne5f+ymL6lDggG9PK5MCubFk6GC/cJ93jctYsM
 VaPiJo+Rs9owKBfAdgdm9x/Qx065hL6/VManLQv5fJsFUhQWa5CSgM5J7VV5u4PffOoj
 05Sca9TKhk3F9uLQLzI9BpVrtyH3VMUHP7vWk=
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
Cc: Derek Basehore <dbasehore@chromium.org>, maxime.ripard@bootlin.com,
 sam@ravnborg.org, intel-gfx@lists.freedesktop.org, airlied@linux.ie,
 thierry.reding@gmail.com, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 linux-mediatek@lists.infradead.org, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIHRoZSBhdHRhY2gvZGV0YWNoIGNhbGxiYWNrcy4gVGhlc2UgYXJlIGZvciBzZXR0
aW5nIHVwCmludGVybmFsIHN0YXRlIGZvciB0aGUgY29ubmVjdG9yL3BhbmVsIHBhaXIgdGhhdCBj
YW4ndCBiZSBkb25lIGF0CnByb2JlIChzaW5jZSB0aGUgY29ubmVjdG9yIGRvZXNuJ3QgZXhpc3Qp
IGFuZCB3aGljaCBkb24ndCBuZWVkIHRvIGJlCnJlcGVhdGVkbHkgZG9uZSBmb3IgZXZlcnkgZ2V0
L21vZGVzLCBwcmVwYXJlLCBvciBlbmFibGUgY2FsbGJhY2suClZhbHVlcyBzdWNoIGFzIHRoZSBw
YW5lbCBvcmllbnRhdGlvbiwgYW5kIGRpc3BsYXkgc2l6ZSBjYW4gYmUgZmlsbGVkCmluIGZvciB0
aGUgY29ubmVjdG9yLgoKU2lnbmVkLW9mZi1ieTogRGVyZWsgQmFzZWhvcmUgPGRiYXNlaG9yZUBj
aHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jIHwgMTQgKysrKysr
KysrKysrKysKIGluY2x1ZGUvZHJtL2RybV9wYW5lbC5oICAgICB8ICA0ICsrKysKIDIgZmlsZXMg
Y2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fcGFuZWwuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWwuYwppbmRleCAzYjY4OWNlNGE1
MWEuLjcyZjY3Njc4ZDlkNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWwuYwpAQCAtMTA0LDEyICsxMDQsMjMgQEAg
RVhQT1JUX1NZTUJPTChkcm1fcGFuZWxfcmVtb3ZlKTsKICAqLwogaW50IGRybV9wYW5lbF9hdHRh
Y2goc3RydWN0IGRybV9wYW5lbCAqcGFuZWwsIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IpCiB7CisJaW50IHJldDsKKwogCWlmIChwYW5lbC0+Y29ubmVjdG9yKQogCQlyZXR1cm4gLUVC
VVNZOwogCiAJcGFuZWwtPmNvbm5lY3RvciA9IGNvbm5lY3RvcjsKIAlwYW5lbC0+ZHJtID0gY29u
bmVjdG9yLT5kZXY7CiAKKwlpZiAocGFuZWwtPmZ1bmNzLT5hdHRhY2gpIHsKKwkJcmV0ID0gcGFu
ZWwtPmZ1bmNzLT5hdHRhY2gocGFuZWwpOworCQlpZiAocmV0IDwgMCkgeworCQkJcGFuZWwtPmNv
bm5lY3RvciA9IE5VTEw7CisJCQlwYW5lbC0+ZHJtID0gTlVMTDsKKwkJCXJldHVybiByZXQ7CisJ
CX0KKwl9CisKIAlyZXR1cm4gMDsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX3BhbmVsX2F0dGFjaCk7
CkBAIC0xMjgsNiArMTM5LDkgQEAgRVhQT1JUX1NZTUJPTChkcm1fcGFuZWxfYXR0YWNoKTsKICAq
LwogaW50IGRybV9wYW5lbF9kZXRhY2goc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiB7CisJaWYg
KHBhbmVsLT5mdW5jcy0+ZGV0YWNoKQorCQlwYW5lbC0+ZnVuY3MtPmRldGFjaChwYW5lbCk7CisK
IAlwYW5lbC0+Y29ubmVjdG9yID0gTlVMTDsKIAlwYW5lbC0+ZHJtID0gTlVMTDsKIApkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmggYi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaApp
bmRleCAxMzYzMWIyZWZiYWEuLmUxMzZlM2EzYzk5NiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0v
ZHJtX3BhbmVsLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmgKQEAgLTM3LDYgKzM3LDgg
QEAgc3RydWN0IGRpc3BsYXlfdGltaW5nOwogICogc3RydWN0IGRybV9wYW5lbF9mdW5jcyAtIHBl
cmZvcm0gb3BlcmF0aW9ucyBvbiBhIGdpdmVuIHBhbmVsCiAgKiBAZGlzYWJsZTogZGlzYWJsZSBw
YW5lbCAodHVybiBvZmYgYmFjayBsaWdodCwgZXRjLikKICAqIEB1bnByZXBhcmU6IHR1cm4gb2Zm
IHBhbmVsCisgKiBAZGV0YWNoOiBkZXRhY2ggcGFuZWwtPmNvbm5lY3RvciAoY2xlYXIgaW50ZXJu
YWwgc3RhdGUsIGV0Yy4pCisgKiBAYXR0YWNoOiBhdHRhY2ggcGFuZWwtPmNvbm5lY3RvciAodXBk
YXRlIGludGVybmFsIHN0YXRlLCBldGMuKQogICogQHByZXBhcmU6IHR1cm4gb24gcGFuZWwgYW5k
IHBlcmZvcm0gc2V0IHVwCiAgKiBAZW5hYmxlOiBlbmFibGUgcGFuZWwgKHR1cm4gb24gYmFjayBs
aWdodCwgZXRjLikKICAqIEBnZXRfbW9kZXM6IGFkZCBtb2RlcyB0byB0aGUgY29ubmVjdG9yIHRo
YXQgdGhlIHBhbmVsIGlzIGF0dGFjaGVkIHRvIGFuZApAQCAtNzAsNiArNzIsOCBAQCBzdHJ1Y3Qg
ZGlzcGxheV90aW1pbmc7CiBzdHJ1Y3QgZHJtX3BhbmVsX2Z1bmNzIHsKIAlpbnQgKCpkaXNhYmxl
KShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCk7CiAJaW50ICgqdW5wcmVwYXJlKShzdHJ1Y3QgZHJt
X3BhbmVsICpwYW5lbCk7CisJdm9pZCAoKmRldGFjaCkoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwp
OworCWludCAoKmF0dGFjaCkoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpOwogCWludCAoKnByZXBh
cmUpKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKTsKIAlpbnQgKCplbmFibGUpKHN0cnVjdCBkcm1f
cGFuZWwgKnBhbmVsKTsKIAlpbnQgKCpnZXRfbW9kZXMpKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVs
KTsKLS0gCjIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMyLWdvb2cKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
