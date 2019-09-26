Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CFEC0031
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 09:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4456EE91;
	Fri, 27 Sep 2019 07:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E682A6ECFF;
 Thu, 26 Sep 2019 10:53:22 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r3so2182568wrj.6;
 Thu, 26 Sep 2019 03:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CKKmk9TqN2/1MoLYTAYc8amHX7J752W+bLMGWqOdUCw=;
 b=uadUL6zLaKc64urH4CDjgyzj8lJRC6uUDdoqwBGn17beMMmhntz316LqvQlQ/pwzix
 rL4HM6N/3mAroDWB2dFS6iI/WQ7M6LaWpdOlMFhpG3Fy6qiwYsjCFth+WXOtoFd7NZoR
 YgRpYFdobXYzEmEhsFapUDvBQeYJ3fNHURxbgZIs0DfQ6y3w7GiBmShvldu0SSMb7xjH
 Z0EZFDmw1dr6wI67ZGqeIMr/I/Q6zupNEImetXYlNzyyrCHHn3cmrGjNUGjBrNmpb3E+
 viijgXIvA+LnIPV6CFw2gkbzyQJpcUq9ci4+olZBFAVlQRS9gEidFijlzUM5cV3X1Fz8
 9O/Q==
X-Gm-Message-State: APjAAAWXjUm83hlGcnrfUYzWnTBOWm58bb4/0jvM/CyAv/IKsoUOPyZS
 mdCKrzVprNS4c97BjAb+uvI=
X-Google-Smtp-Source: APXvYqwy1oWChQ9Uund4z/W26hcuQXiVLnJhbwhH4d3zXGNVZ8qQK40Iek3tF9TqYcoRsvv/WiAF8A==
X-Received: by 2002:a5d:43d0:: with SMTP id v16mr2439959wrr.390.1569495201303; 
 Thu, 26 Sep 2019 03:53:21 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id d9sm3468412wrc.44.2019.09.26.03.53.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Sep 2019 03:53:20 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/5] drm/msm/mdp5: Add optional TBU and TBU_RT clocks
Date: Thu, 26 Sep 2019 12:52:52 +0200
Message-Id: <20190926105256.61412-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190926105256.61412-1-kholk11@gmail.com>
References: <20190926105256.61412-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Sep 2019 07:40:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CKKmk9TqN2/1MoLYTAYc8amHX7J752W+bLMGWqOdUCw=;
 b=LUQtQYPNhY0Y8JsBeVR/RZ5ikxtFjF/YrS5ERMIfpbwxuVZzRIe6O4x7pjW3OKQj1W
 E3IbmiY6tQp7089/ieoUmEFWCYKq1NnnyfSk0Rcx3WRoDmX/Xl0FyuHmyZW8kELgU272
 hN7rV3gbNhWI1ziIzLJeWO1yZlZOJTQ+ykEbGpLaEtsJBn/9oVCBX7OttgXYQOWaCvE0
 YsxmLX1xJLpDQQJJIM/LXprkcgfhgZyK8T7IzbkrucMCGxtTyBAv7rsJRj8QqP1Ojck0
 tr8diW3pAcCGkYRE40P5g6uQsjoWdHancAJDQ69r+hXdTwXK7xbzngwthFkRPZ4le6kg
 BTqQ==
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, marijns95@gmail.com,
 jonathan@marek.ca, airlied@linux.ie, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, tglx@linutronix.de, kholk11@gmail.com, sean@poorly.run,
 georgi.djakov@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkFuZ2VsbyBHLiBEZWwgUmVnbm8iIDxraG9sazExQGdtYWlsLmNvbT4KClNvbWUgU29D
cywgbGlrZSBNU004OTU2Lzg5NzYgKGFuZCBBUFEgdmFyaWFudHMpLCBkbyBmZWF0dXJlIHRoZXNl
CmNsb2NrcyBhbmQgd2UgbmVlZCB0byBlbmFibGUgdGhlbSBpbiBvcmRlciB0byBnZXQgdGhlIGhh
cmR3YXJlIHRvCnByb3Blcmx5IHdvcmsuCgpTaWduZWQtb2ZmLWJ5OiBBbmdlbG8gRy4gRGVsIFJl
Z25vIDxraG9sazExQGdtYWlsLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9tc20vbWRwNS50eHQgfCAgMiArKwogZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL21kcDUvbWRwNV9rbXMuYyAgICAgICAgICAgICAgIHwgMTAgKysrKysrKysrKwogZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuaCAgICAgICAgICAgICAgIHwgIDIgKysK
IDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9tZHA1LnR4dCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9tZHA1LnR4dAppbmRleCA0ZTEx
MzM4NTQ4YWEuLjQzZDExMjc5YzkyNSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL21kcDUudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9tZHA1LnR4dApAQCAtNzYsNiArNzYsOCBAQCBS
ZXF1aXJlZCBwcm9wZXJ0aWVzOgogT3B0aW9uYWwgcHJvcGVydGllczoKIC0gY2xvY2stbmFtZXM6
IHRoZSBmb2xsb3dpbmcgY2xvY2tzIGFyZSBvcHRpb25hbDoKICAgKiAibHV0IgorICAqICJ0YnUi
CisgICogInRidV9ydCIKIAogRXhhbXBsZToKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1
L21kcDVfa21zLmMKaW5kZXggZmVjNmVmMWFlM2I5Li4yM2JlOWI5NWRkN2UgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYwpAQCAtMjkzLDYgKzI5MywxMCBAQCBpbnQg
bWRwNV9kaXNhYmxlKHN0cnVjdCBtZHA1X2ttcyAqbWRwNV9rbXMpCiAJbWRwNV9rbXMtPmVuYWJs
ZV9jb3VudC0tOwogCVdBUk5fT04obWRwNV9rbXMtPmVuYWJsZV9jb3VudCA8IDApOwogCisJaWYg
KG1kcDVfa21zLT50YnVfcnRfY2xrKQorCQljbGtfZGlzYWJsZV91bnByZXBhcmUobWRwNV9rbXMt
PnRidV9ydF9jbGspOworCWlmIChtZHA1X2ttcy0+dGJ1X2NsaykKKwkJY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKG1kcDVfa21zLT50YnVfY2xrKTsKIAljbGtfZGlzYWJsZV91bnByZXBhcmUobWRwNV9r
bXMtPmFoYl9jbGspOwogCWNsa19kaXNhYmxlX3VucHJlcGFyZShtZHA1X2ttcy0+YXhpX2Nsayk7
CiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG1kcDVfa21zLT5jb3JlX2Nsayk7CkBAIC0zMTMsNiAr
MzE3LDEwIEBAIGludCBtZHA1X2VuYWJsZShzdHJ1Y3QgbWRwNV9rbXMgKm1kcDVfa21zKQogCWNs
a19wcmVwYXJlX2VuYWJsZShtZHA1X2ttcy0+Y29yZV9jbGspOwogCWlmIChtZHA1X2ttcy0+bHV0
X2NsaykKIAkJY2xrX3ByZXBhcmVfZW5hYmxlKG1kcDVfa21zLT5sdXRfY2xrKTsKKwlpZiAobWRw
NV9rbXMtPnRidV9jbGspCisJCWNsa19wcmVwYXJlX2VuYWJsZShtZHA1X2ttcy0+dGJ1X2Nsayk7
CisJaWYgKG1kcDVfa21zLT50YnVfcnRfY2xrKQorCQljbGtfcHJlcGFyZV9lbmFibGUobWRwNV9r
bXMtPnRidV9ydF9jbGspOwogCiAJcmV0dXJuIDA7CiB9CkBAIC05NDgsNiArOTU2LDggQEAgc3Rh
dGljIGludCBtZHA1X2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwgc3RydWN0IGRy
bV9kZXZpY2UgKmRldikKIAogCS8qIG9wdGlvbmFsIGNsb2NrczogKi8KIAlnZXRfY2xrKHBkZXYs
ICZtZHA1X2ttcy0+bHV0X2NsaywgImx1dCIsIGZhbHNlKTsKKwlnZXRfY2xrKHBkZXYsICZtZHA1
X2ttcy0+dGJ1X2NsaywgInRidSIsIGZhbHNlKTsKKwlnZXRfY2xrKHBkZXYsICZtZHA1X2ttcy0+
dGJ1X3J0X2NsaywgInRidV9ydCIsIGZhbHNlKTsKIAogCS8qIHdlIG5lZWQgdG8gc2V0IGEgZGVm
YXVsdCByYXRlIGJlZm9yZSBlbmFibGluZy4gIFNldCBhIHNhZmUKIAkgKiByYXRlIGZpcnN0LCB0
aGVuIGZpZ3VyZSBvdXQgaHcgcmV2aXNpb24sIGFuZCB0aGVuIHNldCBhCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5oIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL21kcDUvbWRwNV9rbXMuaAppbmRleCBkMWJmNGZkZmM4MTUuLjEyODg2Njc0MjU5
MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5oCkBAIC01Myw2ICs1
Myw4IEBAIHN0cnVjdCBtZHA1X2ttcyB7CiAJc3RydWN0IGNsayAqYWhiX2NsazsKIAlzdHJ1Y3Qg
Y2xrICpjb3JlX2NsazsKIAlzdHJ1Y3QgY2xrICpsdXRfY2xrOworCXN0cnVjdCBjbGsgKnRidV9j
bGs7CisJc3RydWN0IGNsayAqdGJ1X3J0X2NsazsKIAlzdHJ1Y3QgY2xrICp2c3luY19jbGs7CiAK
IAkvKgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
