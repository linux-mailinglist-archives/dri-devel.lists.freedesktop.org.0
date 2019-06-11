Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C583C4D6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 09:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5121089154;
	Tue, 11 Jun 2019 07:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDDB8912B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 04:03:59 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id f25so6150971pgv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 21:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7l9eJCs2PeowUasvujNxJ+tq7unRBQcTxAKWiz4JMIE=;
 b=msNpL6WOguhjnRG7tdpvNr/9/KoCziRm2ZBL1/HU/DWVtHYB8AHxcb7eRkogFhRUAh
 slF0PNLQSXDJPMMh5mDeZvlWTPC2fKbQgl2g7qONM8/QKzxduE1aYUWNaufIA7bAJHTD
 KwN6+bApu/6j7Sy8/tPsWtpUBZAQ9djon2rSLmulrdu/IBXeIjmP3CZfUzUekGCNPSHH
 CpRr0vF4r8CSQv5qm87nR/q3Jntod0Dx0fgvolrckvNSw1+fPaPT3GOrlGhMq2kNY/gj
 efyUaqPQ5DUlC0veipC1BsS5RYWsJain2hilcUhr04ypEduimF6OMpMiO9cmJu60BYnw
 lmnw==
X-Gm-Message-State: APjAAAVADK9AdlkFZVFOthDqVyMS1yC5E2dUSwiTEgClvv+C0PXAvOXc
 whPuwZDNmXhgNvFJztV/YYG1jg==
X-Google-Smtp-Source: APXvYqy0yKQ/QJLsix4wmZz0w/0FdG7kg5sb5r7IYIEYAuT2TlsU8kQWgPqPuvCd1Bz2CLqyUw+bZA==
X-Received: by 2002:a62:5883:: with SMTP id
 m125mr15522265pfb.248.1560225838902; 
 Mon, 10 Jun 2019 21:03:58 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id y133sm13301185pfb.28.2019.06.10.21.03.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 21:03:58 -0700 (PDT)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] drm/panel: Add attach/detach callbacks
Date: Mon, 10 Jun 2019 21:03:48 -0700
Message-Id: <20190611040350.90064-4-dbasehore@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190611040350.90064-1-dbasehore@chromium.org>
References: <20190611040350.90064-1-dbasehore@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Jun 2019 07:21:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7l9eJCs2PeowUasvujNxJ+tq7unRBQcTxAKWiz4JMIE=;
 b=LeWcjnR+t+om64koZ6/R7cE71bujGm69PJfYXHwBJFGIEBgWa3nQCcjJskR2SOqfDx
 8FfVoU3o/Q7/B8eVi0j0M5VdkxdYsRjGxHm1O2i+Ynte0IiaoGGgyiP7Srs/0VHfY8pZ
 GoyR+VQn83u0DFekQcp1z2sEX3Qkb7x/WEOsw=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Derek Basehore <dbasehore@chromium.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-mediatek@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
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
