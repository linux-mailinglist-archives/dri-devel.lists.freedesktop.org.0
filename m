Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBD9109771
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 02:11:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6EF6E1C0;
	Tue, 26 Nov 2019 01:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289026E1C0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 01:11:24 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id q17so8088357pgt.9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 17:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VYehR7ge0dJ0V5YDxtQHoCeu/4KPNiIoIijqqvVzUv8=;
 b=T66tdZw9fpKAgYV34IngAJ9cvpKHw6/6aHZx8URaqXbaHoVGnDzjq1ptv9FGrz7yD9
 l61zwvt37nGViVX6JLd5+LfosBLV9gSdYFcCMGZPkQIzh+GTeO25P9u0lNoFSDy7YgYz
 uNUewXncydkqi6CZuPVZBY/taJlLNvaatlcZeD0UO4b40bKxdr4TdX/hwUFZ7LISe6ar
 UKqGdc3MP6Xw4biKqtIVZ/Q56da96BApszqJ7oF8sWp3Qa1GJq391Uno7YODM5g+Rv0x
 FZD5pL+nHbk5dGzjScD65Wo/6zD9CeWca2CpnNdWEkZS13xNdwDNYReHDao+uvYTEX5B
 Fr5A==
X-Gm-Message-State: APjAAAXg7rWF/wLC3zJL4trD08Mv3cWRDqZHH1TEWoxegyA55asN9tTW
 pCvv9gHahsmQ7ykFzoXksMeYlsmdIzE=
X-Google-Smtp-Source: APXvYqwAeOkvKOIZ4ckLkUBLHhgHANgpcWDCn9PKQtwRFO09qpK+SXJ8Avj54Cqsbpm146U2USqZmw==
X-Received: by 2002:aa7:9151:: with SMTP id 17mr38425576pfi.3.1574730683549;
 Mon, 25 Nov 2019 17:11:23 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id z10sm9672903pgg.39.2019.11.25.17.11.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Nov 2019 17:11:23 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] udmabuf: allow userspace to set map attributes
Date: Mon, 25 Nov 2019 17:10:53 -0800
Message-Id: <20191126011056.67928-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191126011056.67928-1-gurchetansingh@chromium.org>
References: <20191126011056.67928-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VYehR7ge0dJ0V5YDxtQHoCeu/4KPNiIoIijqqvVzUv8=;
 b=Btsg2bW+a8t0gyNaUtUCga87l14wOYfqsaV0lD955X4xE5lxMKbfEJ/lhQRymA7CqU
 Zenprsh8GUgawbZA8z0Cw/BjeyPQWQ2op80/Weqpx/7r2cdTjVG5IURnBNgYXdtm0Ogl
 bcAEA9DwEDv7x+NBFADIh2NG8EYjYC5iHkZHI=
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com,
 hch@lst.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG1haW4gdXNlIGZvciB1ZG1hYnVmIGlzIHNlbmRpbmcgZ3Vlc3QgbWVtb3J5IHBhZ2VzCnRv
IHRoZSBob3N0LgoKSXQncyBnZW5lcmFsbHkgYSBiYWQgaWRlYSB0byBoYXZlIHRvIHNlcGFyYXRl
IG1hcHBpbmdzIHdpdGgKZGlmZmVyZW50IGF0dHJpYnV0ZXMuIEZvciBleGFtcGxlLCBhIFdDIG1h
cHBpbmcgdGhlIGd1ZXN0Cmtlcm5lbCBhbmQgY2FjaGVkIG1hcHBpbmcgb24gdGhlIGhvc3QgaXMg
cHJvYmxlbWF0aWMuCgp2MjogQ2FjaGUgYXR0cmlidXRlIGZsYWdzIGluc3RlYWQgb2YgcmVhZC93
cml0ZSBmbGFncyAoa3JheGVsQCkKLS0tCiBkcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jICAgIHwg
MTIgKysrKysrKysrKysrCiBpbmNsdWRlL3VhcGkvbGludXgvdWRtYWJ1Zi5oIHwgIDIgKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1h
LWJ1Zi91ZG1hYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jCmluZGV4IGIzNDVlOTFk
ODMxYS4uY2U5Y2FhYWE5ZTRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5j
CisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMKQEAgLTE2LDYgKzE2LDcgQEAgc3RhdGlj
IGNvbnN0IHUzMiAgICBsaXN0X2xpbWl0ID0gMTAyNDsgIC8qIHVkbWFidWZfY3JlYXRlX2xpc3Qt
PmNvdW50IGxpbWl0ICovCiBzdGF0aWMgY29uc3Qgc2l6ZV90IHNpemVfbGltaXRfbWIgPSA2NDsg
LyogdG90YWwgZG1hYnVmIHNpemUsIGluIG1lZ2FieXRlcyAgKi8KIAogc3RydWN0IHVkbWFidWYg
eworCXUzMiBmbGFnczsKIAlwZ29mZl90IHBhZ2Vjb3VudDsKIAlzdHJ1Y3QgcGFnZSAqKnBhZ2Vz
OwogfTsKQEAgLTM3LDYgKzM4LDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9u
c19zdHJ1Y3QgdWRtYWJ1Zl92bV9vcHMgPSB7CiBzdGF0aWMgaW50IG1tYXBfdWRtYWJ1ZihzdHJ1
Y3QgZG1hX2J1ZiAqYnVmLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIHsKIAlzdHJ1Y3Qg
dWRtYWJ1ZiAqdWJ1ZiA9IGJ1Zi0+cHJpdjsKKwlwZ3Byb3RfdCBwZ3Byb3QgPSB2bV9nZXRfcGFn
ZV9wcm90KHZtYS0+dm1fZmxhZ3MpOworCisJaWYgKHVidWYtPmZsYWdzICYgVURNQUJVRl9GTEFH
U19XQykKKwkJdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3Rfd3JpdGVjb21iaW5lKHBncHJvdCk7
CisJZWxzZSBpZiAodWJ1Zi0+ZmxhZ3MgJiBVRE1BQlVGX0ZMQUdTX05PTkNBQ0hFRCkKKwkJdm1h
LT52bV9wYWdlX3Byb3QgPSBwZ3Byb3Rfbm9uY2FjaGVkKHBncHJvdCk7CiAKIAlpZiAoKHZtYS0+
dm1fZmxhZ3MgJiAoVk1fU0hBUkVEIHwgVk1fTUFZU0hBUkUpKSA9PSAwKQogCQlyZXR1cm4gLUVJ
TlZBTDsKQEAgLTEzMiw2ICsxMzksMTAgQEAgc3RhdGljIGxvbmcgdWRtYWJ1Zl9jcmVhdGUoY29u
c3Qgc3RydWN0IHVkbWFidWZfY3JlYXRlX2xpc3QgKmhlYWQsCiAJaW50IHNlYWxzLCByZXQgPSAt
RUlOVkFMOwogCXUzMiBpLCBmbGFnczsKIAorCWlmICgoaGVhZC0+ZmxhZ3MgJiBVRE1BQlVGX0ZM
QUdTX05PTkNBQ0hFRCkgJiYKKwkgICAgKGhlYWQtPmZsYWdzICYgVURNQUJVRl9GTEFHU19XQykp
CisJCXJldHVybiAtRUlOVkFMOworCiAJdWJ1ZiA9IGt6YWxsb2Moc2l6ZW9mKCp1YnVmKSwgR0ZQ
X0tFUk5FTCk7CiAJaWYgKCF1YnVmKQogCQlyZXR1cm4gLUVOT01FTTsKQEAgLTE4OCw2ICsxOTks
NyBAQCBzdGF0aWMgbG9uZyB1ZG1hYnVmX2NyZWF0ZShjb25zdCBzdHJ1Y3QgdWRtYWJ1Zl9jcmVh
dGVfbGlzdCAqaGVhZCwKIAlleHBfaW5mby5wcml2ID0gdWJ1ZjsKIAlleHBfaW5mby5mbGFncyA9
IE9fUkRXUjsKIAorCXVidWYtPmZsYWdzID0gaGVhZC0+ZmxhZ3M7CiAJYnVmID0gZG1hX2J1Zl9l
eHBvcnQoJmV4cF9pbmZvKTsKIAlpZiAoSVNfRVJSKGJ1ZikpIHsKIAkJcmV0ID0gUFRSX0VSUihi
dWYpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L3VkbWFidWYuaCBiL2luY2x1ZGUv
dWFwaS9saW51eC91ZG1hYnVmLmgKaW5kZXggNDZiNjUzMmVkODU1Li5mOTA4MzFmMmJiMGQgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC91ZG1hYnVmLmgKKysrIGIvaW5jbHVkZS91YXBp
L2xpbnV4L3VkbWFidWYuaApAQCAtNiw2ICs2LDggQEAKICNpbmNsdWRlIDxsaW51eC9pb2N0bC5o
PgogCiAjZGVmaW5lIFVETUFCVUZfRkxBR1NfQ0xPRVhFQwkweDAxCisjZGVmaW5lIFVETUFCVUZf
RkxBR1NfV0MJMHgwMgorI2RlZmluZSBVRE1BQlVGX0ZMQUdTX05PTkNBQ0hFRCAweDA0CiAKIHN0
cnVjdCB1ZG1hYnVmX2NyZWF0ZSB7CiAJX191MzIgbWVtZmQ7Ci0tIAoyLjI0LjAuNDMyLmc5ZDNm
NWY1YjYzLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
