Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB48AAAAB6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 20:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AB56E0F8;
	Thu,  5 Sep 2019 18:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDE56E0E6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 18:18:43 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id i8so3536986edn.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 11:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=obFAoJjwX5LVICOlIHTt1Y/s9EsFMUSE1s849zGP32Q=;
 b=EcSToqVhQJIuaaUC3H9j7lBYJ4fA+Iruo6aAWi6HB7yxs0ecnEv3oZTqSKdyfSp6j5
 mPHJQFW9Tte0FvrObfkc26PeKpwuOUj1SJRz7lQfsfTyqNkR+BIPfFFVlZIw6NbXlAav
 S5k4og2aIcC/XBrYkSYaF3Pij3bqne+VPUbDxumP7XSBwWsAzNhzVY2sXZHu/CF1Kc6r
 9Y+tW7FO1JXcPTAEP4YjQVFhROI9MFeZlOXhO+wz6ekrG796IBnTsAJ2R4+MbtvN6kWH
 uyiYOCZjvhkk1wGAidcsMWsupXOJADoAfKu3Us8DwyWqc8xm9/8uVq+WJRM2VAQEbqJ4
 v0qw==
X-Gm-Message-State: APjAAAUebpZyJ3e89UFzRI6pREI3QBINZHvsbcQTiLPlSfqkkQbSsNbh
 onJuS4tL3clXoTf6N85rWMWVWt5GXUM=
X-Google-Smtp-Source: APXvYqyzaG6Yf4kQ2QY6XayOtQGL5hNQW9zxGYl73+F4ofPJ6wblCKH7JO8eJ2dauX6xy0MRG8TzBg==
X-Received: by 2002:aa7:d8c8:: with SMTP id k8mr5400533eds.8.1567707522004;
 Thu, 05 Sep 2019 11:18:42 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id v8sm305107ejk.29.2019.09.05.11.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 11:18:41 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/atomic: Take the atomic toys away from X
Date: Thu,  5 Sep 2019 20:18:34 +0200
Message-Id: <20190905181834.6234-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190903190642.32588-1-daniel.vetter@ffwll.ch>
References: <20190903190642.32588-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=obFAoJjwX5LVICOlIHTt1Y/s9EsFMUSE1s849zGP32Q=;
 b=fCjtWKHVKfNPVHweI4Dr39tiJQOVJ5Csyxs7DuVOxRDIxrjpp2gtRtuxU0N4SsSRj2
 cX52YmzJXNLBuI2D5qMYuo7im9kxNTogPs6pUJAlilJzDMBFSPWDmOF6lG518UPHrTUi
 hY81BqfZm6U1jwMN/BEPNL6bmMMme8hJhthkc=
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
cmUKCkNjOiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+ClJlZmVyZW5jZXM6IGh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy94b3JnL3hzZXJ2ZXIvaXNzdWVzLzYyOQpSZWZl
cmVuY2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcveG9yZy94c2VydmVyL21lcmdl
X3JlcXVlc3RzLzE4MApSZWZlcmVuY2VzOiBhYmJjMDY5N2Q1ZmIgKCJkcm0vZmI6IHJldmVydCB0
aGUgaTkxNSBBY3R1YWxseSBjb25maWd1cmUgdW50aWxlZCBkaXNwbGF5cyBmcm9tIG1hc3RlciIp
CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
PgpSZXZpZXdlZC1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4gKHYxKQpSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9s
YXMua2F6bGF1c2thc0BhbWQuY29tPiAodjEpCkNjOiBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PgpDYzogQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+CkNjOiBB
ZGFtIEphY2tzb24gPGFqYXhAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IEFkYW0gSmFja3NvbiA8YWph
eEByZWRoYXQuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5j
b20+CkFja2VkLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+CkNjOiBzdGFibGVA
dmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwuYyB8IDcgKysrKysr
LQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
aW9jdGwuYwppbmRleCAyYzEyMGM1OGY3MmQuLjU2YWE4YmJiM2E4YyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9pb2N0bC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwu
YwpAQCAtMzM2LDcgKzMzNiwxMiBAQCBkcm1fc2V0Y2xpZW50Y2FwKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2KQogCWNhc2UgRFJN
X0NMSUVOVF9DQVBfQVRPTUlDOgogCQlpZiAoIWRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBE
UklWRVJfQVRPTUlDKSkKIAkJCXJldHVybiAtRU9QTk9UU1VQUDsKLQkJaWYgKHJlcS0+dmFsdWUg
PiAxKQorCQkvKiBUaGUgbW9kZXNldHRpbmcgRERYIGhhcyBhIHRvdGFsbHkgYnJva2VuIGlkZWEg
b2YgYXRvbWljLiAqLworCQlpZiAoc3Ryc3RyKGN1cnJlbnQtPmNvbW0sICJYIikgJiYgcmVxLT52
YWx1ZSA9PSAxKSB7CisJCQlwcl9pbmZvKCJicm9rZW4gYXRvbWljIG1vZGVzZXQgdXNlcnNwYWNl
IGRldGVjdGVkLCBkaXNhYmxpbmcgYXRvbWljXG4iKTsKKwkJCXJldHVybiAtRU9QTk9UU1VQUDsK
KwkJfQorCQlpZiAocmVxLT52YWx1ZSA+IDIpCiAJCQlyZXR1cm4gLUVJTlZBTDsKIAkJZmlsZV9w
cml2LT5hdG9taWMgPSByZXEtPnZhbHVlOwogCQlmaWxlX3ByaXYtPnVuaXZlcnNhbF9wbGFuZXMg
PSByZXEtPnZhbHVlOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
