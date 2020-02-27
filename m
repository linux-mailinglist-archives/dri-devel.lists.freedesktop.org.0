Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C321726C0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B128B6ED17;
	Thu, 27 Feb 2020 18:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02E76ECF8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:16:24 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j7so4577818wrp.13
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e0NrAeo742GtYJsP1J7drvhzD/Rn6FMwjhD+0aWDX4k=;
 b=KJgEHNSKRzmWG1ROOUJWSPAW6LaFm30bkbc+7RjA36QodUvk91oeK9+wcRjQej90JR
 h6nKGy7pz921iPFB0Fy2LeYLsXe9E4zBr6Tn2hQq/Cw3McczFxVx1M/y5M0h1F1pBmTq
 61nC0UfUqGZP81Aevt3Xv81bxSjD3PLz3hXSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e0NrAeo742GtYJsP1J7drvhzD/Rn6FMwjhD+0aWDX4k=;
 b=pZf/HCTrWjsMeTlib7irf7xkDtYkb5K7zj8cm/JoB0oE9ImjYmGpo+GEuqx3sph4Lz
 xq6VKIkOdrDRyvGwEJ+/aPCW8fa0npXFmeb9YDtqgOquWxggYBRBnm5PINmlV/2SSjqi
 KhzOVH5gi0IEf6mEIf000FsOFfqFNQLI3MSQjgYz0IcKwLYPbMBWRNs9QK76DLGbElgA
 6se0fsVCpjIzMWcQeHMBfLgpCoU4csoAwYkB9N/ASpg3SjzfESmRicLE3RGnDsuoRVqw
 tVvpPu5Ty1Iu6u/7Spm1cF8VLDUHlbmLMwbYfBoI2hvTShKZqDNy7abbRi5QAP7tfW46
 tUCQ==
X-Gm-Message-State: APjAAAWscNUmwqsp/7reGiUqcCUFpw9qD0yTfBH+5NNb/N8CNJj5rIsP
 ioRIpstpb2/ouhx8GZMVZ+UxwNBYccc=
X-Google-Smtp-Source: APXvYqzP4ly7eaYScN8w6ZDoXkPnsIZRX7XGpI5tMuuelMvYxqc+sgK2VmkoJoNPHO+Z7tdc9LFPJw==
X-Received: by 2002:adf:ab4e:: with SMTP id r14mr133622wrc.350.1582827383052; 
 Thu, 27 Feb 2020 10:16:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:16:22 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 42/51] drm/gm12u320: More drmm_
Date: Thu, 27 Feb 2020 19:15:13 +0100
Message-Id: <20200227181522.2711142-43-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, Hans de Goede <hdegoede@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRybV9tb2RlX2NvbmZpZ19jbGVhbnVwIGNhbGwgd2UgY2FuIGRyb3AsIGFuZCBhbGwgdGhl
IGFsbG9jYXRpb25zCndlIGNhbiBzd2l0Y2ggb3ZlciB0byBkcm1tX2t6YWxsb2MuIFVuZm9ydHVu
YXRlbHkgdGhlIHdvcmsgcXVldWUgaXMKc3RpbGwgcHJlc2VudCwgc28gY2FuJ3QgZ2V0IHJpZCBv
ZiB0aGUgZHJtX2RyaXZlci0+cmVsZWFzZSBmdW5jdGlvbgpvdXRyaWdodC4KClJldmlld2VkLWJ5
OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IEhhbnMgZGUgR29lZGUgPGhk
ZWdvZWRlQHJlZGhhdC5jb20+CkNjOiAiTm9yYWxmIFRyw7hubmVzIiA8bm9yYWxmQHRyb25uZXMu
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90aW55L2dtMTJ1MzIwLmMgfCAxOCArKysrKysrLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aW55L2dtMTJ1MzIwLmMgYi9kcml2ZXJz
L2dwdS9kcm0vdGlueS9nbTEydTMyMC5jCmluZGV4IDM5MjhmNjliYmQzZC4uNWJkMjZmYzZmYWZh
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9nbTEydTMyMC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS90aW55L2dtMTJ1MzIwLmMKQEAgLTE2MCw3ICsxNjAsNyBAQCBzdGF0aWMgaW50
IGdtMTJ1MzIwX3VzYl9hbGxvYyhzdHJ1Y3QgZ20xMnUzMjBfZGV2aWNlICpnbTEydTMyMCkKIAlp
bnQgaSwgYmxvY2tfc2l6ZTsKIAljb25zdCBjaGFyICpoZHI7CiAKLQlnbTEydTMyMC0+Y21kX2J1
ZiA9IGttYWxsb2MoQ01EX1NJWkUsIEdGUF9LRVJORUwpOworCWdtMTJ1MzIwLT5jbWRfYnVmID0g
ZHJtbV9rbWFsbG9jKCZnbTEydTMyMC0+ZGV2LCBDTURfU0laRSwgR0ZQX0tFUk5FTCk7CiAJaWYg
KCFnbTEydTMyMC0+Y21kX2J1ZikKIAkJcmV0dXJuIC1FTk9NRU07CiAKQEAgLTE3Myw3ICsxNzMs
OCBAQCBzdGF0aWMgaW50IGdtMTJ1MzIwX3VzYl9hbGxvYyhzdHJ1Y3QgZ20xMnUzMjBfZGV2aWNl
ICpnbTEydTMyMCkKIAkJCWhkciA9IGRhdGFfYmxvY2tfaGVhZGVyOwogCQl9CiAKLQkJZ20xMnUz
MjAtPmRhdGFfYnVmW2ldID0ga3phbGxvYyhibG9ja19zaXplLCBHRlBfS0VSTkVMKTsKKwkJZ20x
MnUzMjAtPmRhdGFfYnVmW2ldID0gZHJtbV9remFsbG9jKCZnbTEydTMyMC0+ZGV2LAorCQkJCQkJ
ICAgICBibG9ja19zaXplLCBHRlBfS0VSTkVMKTsKIAkJaWYgKCFnbTEydTMyMC0+ZGF0YV9idWZb
aV0pCiAJCQlyZXR1cm4gLUVOT01FTTsKIApAQCAtMTkyLDE1ICsxOTMsOCBAQCBzdGF0aWMgaW50
IGdtMTJ1MzIwX3VzYl9hbGxvYyhzdHJ1Y3QgZ20xMnUzMjBfZGV2aWNlICpnbTEydTMyMCkKIAog
c3RhdGljIHZvaWQgZ20xMnUzMjBfdXNiX2ZyZWUoc3RydWN0IGdtMTJ1MzIwX2RldmljZSAqZ20x
MnUzMjApCiB7Ci0JaW50IGk7Ci0KIAlpZiAoZ20xMnUzMjAtPmZiX3VwZGF0ZS53b3JrcSkKIAkJ
ZGVzdHJveV93b3JrcXVldWUoZ20xMnUzMjAtPmZiX3VwZGF0ZS53b3JrcSk7Ci0KLQlmb3IgKGkg
PSAwOyBpIDwgR00xMlUzMjBfQkxPQ0tfQ09VTlQ7IGkrKykKLQkJa2ZyZWUoZ20xMnUzMjAtPmRh
dGFfYnVmW2ldKTsKLQotCWtmcmVlKGdtMTJ1MzIwLT5jbWRfYnVmKTsKIH0KIAogc3RhdGljIGlu
dCBnbTEydTMyMF9taXNjX3JlcXVlc3Qoc3RydWN0IGdtMTJ1MzIwX2RldmljZSAqZ20xMnUzMjAs
CkBAIC02MzYsNyArNjMwLDYgQEAgc3RhdGljIHZvaWQgZ20xMnUzMjBfZHJpdmVyX3JlbGVhc2Uo
c3RydWN0IGRybV9kZXZpY2UgKmRldikKIAlzdHJ1Y3QgZ20xMnUzMjBfZGV2aWNlICpnbTEydTMy
MCA9IGRldi0+ZGV2X3ByaXZhdGU7CiAKIAlnbTEydTMyMF91c2JfZnJlZShnbTEydTMyMCk7Ci0J
ZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZGV2KTsKIH0KIAogREVGSU5FX0RSTV9HRU1fRk9QUyhn
bTEydTMyMF9mb3BzKTsKQEAgLTY5Myw3ICs2ODYsMTAgQEAgc3RhdGljIGludCBnbTEydTMyMF91
c2JfcHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGVyZmFjZSwKIAlkZXYtPmRldl9wcml2
YXRlID0gZ20xMnUzMjA7CiAJZHJtbV9hZGRfZmluYWxfa2ZyZWUoZGV2LCBnbTEydTMyMCk7CiAK
LQlkcm1fbW9kZV9jb25maWdfaW5pdChkZXYpOworCXJldCA9IGRybV9tb2RlX2NvbmZpZ19pbml0
KGRldik7CisJaWYgKHJldCkKKwkJZ290byBlcnJfcHV0OworCiAJZGV2LT5tb2RlX2NvbmZpZy5t
aW5fd2lkdGggPSBHTTEyVTMyMF9VU0VSX1dJRFRIOwogCWRldi0+bW9kZV9jb25maWcubWF4X3dp
ZHRoID0gR00xMlUzMjBfVVNFUl9XSURUSDsKIAlkZXYtPm1vZGVfY29uZmlnLm1pbl9oZWlnaHQg
PSBHTTEyVTMyMF9IRUlHSFQ7Ci0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
