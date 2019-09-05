Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A72DAAB8B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 20:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35016E12C;
	Thu,  5 Sep 2019 18:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F6B6E12B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 18:53:25 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id z9so3695412edq.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 11:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PQeFos5dHMrq1QyvsxRU9KaZUvVgl+UF+wkglNOgXTc=;
 b=jzCsDw70rUaquKsjoaXOg6OMhqub1va5wzLAuR8tdmNBFvdRuAL3MhFVuxbmk+XBcG
 6Jj0AlZ2kwCxBGGZG4QzlV//EgRbLDyW5n+k/sSleSyCvnJc1xBtfqXKVy300ASPRO8K
 10QV40VDKjZGtgMILAkdUGzkHmc8J2DQ7IInTkBBezVl+cvTrzgLYlJ8DAmYEOonV5LU
 uWK/M/ov+XYDYcjv8V0YnZf59zG+kM8VzKw4/BuBcugvM8YCifuYZLvpUie/QD942+Jy
 /emMnoZ5I9nqcP5//rX4IxtvN6Rbr31bbvG0lH+u4t00fSBdVkKlvCoZ/4w4Hmi8Eekn
 fEjQ==
X-Gm-Message-State: APjAAAXTKProYpigGDZDNsIjDF8T972nBNHHRjsMPRQtVie+7NfMKKha
 QZKrAjsyv8d2tFixxCnRzv0OZxxX+rM=
X-Google-Smtp-Source: APXvYqw/qeqJ90GTBMm9LQFEy/eGq2lELQxwGPslg00RTBOPhHSaK1tR2cqXBIs7fmuxHyp+9v8Usg==
X-Received: by 2002:a50:9eab:: with SMTP id a40mr5542013edf.20.1567709604223; 
 Thu, 05 Sep 2019 11:53:24 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id l10sm518621edd.5.2019.09.05.11.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 11:53:23 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/atomic: Take the atomic toys away from X
Date: Thu,  5 Sep 2019 20:53:18 +0200
Message-Id: <20190905185318.31363-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190903190642.32588-1-daniel.vetter@ffwll.ch>
References: <20190903190642.32588-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PQeFos5dHMrq1QyvsxRU9KaZUvVgl+UF+wkglNOgXTc=;
 b=a94Gft9eUVy9aLOkyzu/V4F/CuD31ejiZCG3pal2mdLR8NSElitN7Plhg0qnE2mWL8
 xgaLyLAOJUk1bNy5vj+edeQQmiZnUbWy9r0f023Ec04+0IJ3P+Ocj0NGGgfE4CC4jwoo
 QEmD9Ra/JxF5wLtw+LMdg4XouOIM7eros7jbg=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>, stable@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIC1tb2Rlc2V0dGluZyBkZHggaGFzIGEgdG90YWxseSBicm9rZW4gaWRlYSBvZiBob3cgYXRv
bWljIHdvcmtzOgotIGRvZXNuJ3QgZGlzYWJsZSBvbGQgY29ubmVjdG9ycywgYXNzdW1pbmcgdGhl
eSBnZXQgYXV0by1kaXNhYmxlIGxpa2UKICB3aXRoIHRoZSBsZWdhY3kgc2V0Y3J0YwotIGFzc3Vt
ZXMgQVNZTkNfRkxJUCBpcyB3aXJlZCB0aHJvdWdoIGZvciB0aGUgYXRvbWljIGlvY3RsCi0gbm90
IGEgc2luZ2xlIGNhbGwgdG8gVEVTVF9PTkxZCgpJb3cgdGhlIGltcGxlbWVudGF0aW9uIGlzIGEg
MToxIHRyYW5zbGF0aW9uIG9mIGxlZ2FjeSBpb2N0bHMgdG8KYXRvbWljLCB3aGljaCBpcyBhKSBi
cm9rZW4gYikgcG9pbnRsZXNzLgoKV2UgYWxyZWFkeSBoYXZlIGJ1Z3MgaW4gYm90aCBpOTE1IGFu
ZCBhbWRncHUtREMgd2hlcmUgdGhpcyBwcmV2ZW50cyB1cwpmcm9tIGVuYWJsaW5nIG5lYXQgZmVh
dHVyZXMuCgpJZiBhbnlvbmUgZXZlciBjYXJlcyBhYm91dCBhdG9taWMgaW4gWCB3ZSBjYW4gZWFz
aWx5IGFkZCBhIG5ldyBhdG9taWMKbGV2ZWwgKHJlcS0+dmFsdWUgPT0gMikgZm9yIFggdG8gZ2V0
IGJhY2sgdGhlIHNoaW55IHRveXMuCgpTaW5jZSB0aGVzZSBicm9rZW4gdmVyc2lvbnMgb2YgLW1v
ZGVzZXR0aW5nIGhhdmUgYmVlbiBzaGlwcGluZywKdGhlcmUncyByZWFsbHkgbm8gb3RoZXIgd2F5
IHRvIGdldCBvdXQgb2YgdGhpcyBiaW5kLgoKdjI6Ci0gYWRkIGFuIGluZm9ybWF0aW9uYWwgZG1l
c2cgb3V0cHV0IChSb2IsIEFqYXgpCi0gcmVvcmRlciBhZnRlciB0aGUgRFJJVkVSX0FUT01JQyBj
aGVjayB0byBhdm9pZCB1c2VsZXNzIG5vaXNlIChJbGlhKQotIGFsbG93IHJlcS0+dmFsdWUgPiAy
IHNvIHRoYXQgWCBjYW4gZG8gYW5vdGhlciBhdHRlbXB0IGF0IGF0b21pYyBpbgogIHRoZSBmdXR1
cmUKCnYzOiBHbyB3aXRoIHBhcmFub2lkLCBpbnNpc3QgdGhhdCB0aGUgWCBzaG91bGQgYmUgZmly
c3QgKHN1Z2dlc3RlZCBieQpSb2IpCgpDYzogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQu
ZWR1PgpSZWZlcmVuY2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcveG9yZy94c2Vy
dmVyL2lzc3Vlcy82MjkKUmVmZXJlbmNlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L3hvcmcveHNlcnZlci9tZXJnZV9yZXF1ZXN0cy8xODAKUmVmZXJlbmNlczogYWJiYzA2OTdkNWZi
ICgiZHJtL2ZiOiByZXZlcnQgdGhlIGk5MTUgQWN0dWFsbHkgY29uZmlndXJlIHVudGlsZWQgZGlz
cGxheXMgZnJvbSBtYXN0ZXIiKQpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFy
dGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+ICh2MSkKUmV2aWV3ZWQtYnk6IE5pY2hvbGFz
IEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4gKHYxKQpDYzogTWljaGVs
IETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGRldWNo
ZXJAZ21haWwuY29tPgpDYzogQWRhbSBKYWNrc29uIDxhamF4QHJlZGhhdC5jb20+CkFja2VkLWJ5
OiBBZGFtIEphY2tzb24gPGFqYXhAcmVkaGF0LmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29y
bHkucnVuPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogUm9iIENsYXJr
IDxyb2JkY2xhcmtAZ21haWwuY29tPgpBY2tlZC1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21h
aWwuY29tPgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2lvY3RsLmMgfCA3ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMKaW5kZXggMmMxMjBjNThmNzJkLi4xY2Q1Y2M0OTJk
ZjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2lvY3RsLmMKQEAgLTMzNiw3ICszMzYsMTIgQEAgZHJtX3NldGNsaWVudGNh
cChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZp
bGVfcHJpdikKIAljYXNlIERSTV9DTElFTlRfQ0FQX0FUT01JQzoKIAkJaWYgKCFkcm1fY29yZV9j
aGVja19mZWF0dXJlKGRldiwgRFJJVkVSX0FUT01JQykpCiAJCQlyZXR1cm4gLUVPUE5PVFNVUFA7
Ci0JCWlmIChyZXEtPnZhbHVlID4gMSkKKwkJLyogVGhlIG1vZGVzZXR0aW5nIEREWCBoYXMgYSB0
b3RhbGx5IGJyb2tlbiBpZGVhIG9mIGF0b21pYy4gKi8KKwkJaWYgKGN1cnJlbnQtPmNvbW1bMF0g
PT0gJ1gnICYmIHJlcS0+dmFsdWUgPT0gMSkgeworCQkJcHJfaW5mbygiYnJva2VuIGF0b21pYyBt
b2Rlc2V0IHVzZXJzcGFjZSBkZXRlY3RlZCwgZGlzYWJsaW5nIGF0b21pY1xuIik7CisJCQlyZXR1
cm4gLUVPUE5PVFNVUFA7CisJCX0KKwkJaWYgKHJlcS0+dmFsdWUgPiAyKQogCQkJcmV0dXJuIC1F
SU5WQUw7CiAJCWZpbGVfcHJpdi0+YXRvbWljID0gcmVxLT52YWx1ZTsKIAkJZmlsZV9wcml2LT51
bml2ZXJzYWxfcGxhbmVzID0gcmVxLT52YWx1ZTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
