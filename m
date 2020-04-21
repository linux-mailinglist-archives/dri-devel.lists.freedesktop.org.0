Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AC51B3833
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22AE6E9BE;
	Wed, 22 Apr 2020 06:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E816E3EF
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 12:50:34 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id j3so13790490ljg.8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 05:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hardline-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=31DLqDGppfY8uxFAvP53qi9Sl1vs7JVUgc/ygd71uoc=;
 b=nQCr8/26WzE/vq5IepXYp5cSS9Ff8RHaUHv05pE9r8zoaryoqdzHpeWzxtqQY0WwkH
 5wFUG6QSlqaslIAhW3iwRcOCYQ/4zYuMc/WeSP5McqhLNX1MKrfOxBRwCTzObftpuJoZ
 zP8NFpIiQf13WmEDlLgYS3yvsiptxKdCeYqByYBOfi29U3JdInX/pkHv8cqK+US+rx9U
 BZpbd6SEZZHDvwtlkFJxmjasPfMgt3bUlK0iiPxYGdjX5rzFaNQDzVscHl0UQTIwbLr+
 i6kuvC1QJWfu7t3hQDnMiILdfg2BQLlzK7A6HbRO70wZEVS+e0d6LR4mbkO3k5jyTUrH
 Pv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=31DLqDGppfY8uxFAvP53qi9Sl1vs7JVUgc/ygd71uoc=;
 b=OKXmBEgKeeuM0nnhPzBAKKa1TDgvtSpNTNSqEVezi0J3JCysvJZDGehptzLWKARYtl
 iAr+Rt0iOsjhxL61JzxQASSyQEthua9S/TuB9OHUcFqkPniow6l1cNs5ADsX8HdY5dwJ
 cNxlY7QECzU15J04GK/pOIKIE9L+0nbYXI0yS8cU7C5EU1i7KzZLFENAaSmuVYc7Ppxd
 igejhMYo+I+mmGSd8ZupHCyK8Fdz4zibh3P8TjxTCHnbFo+2mrfc3i5IpkZVPbCPn9M+
 23GBkeQstzGBPkdBU6ZMimf0cfDlikm5d6GorK8MmjjFCW9vSgoqpcAaeso1vox4Djqf
 pZUg==
X-Gm-Message-State: AGi0PubIs2OlQnXz5E1MzJ5k1Cv2o/awmozj9yIqrwKLyN2MOAMfm9PS
 pSqz8d/DQ+uAEHNOqQnNdUy42+b2GgU=
X-Google-Smtp-Source: APiQypIAT+CGJxZBQkOF71h3rApmbBPSfw/uauIwzXB1+7IQzI3zr6l7afcLsuizMpkERWQDdusdVQ==
X-Received: by 2002:a2e:9bc3:: with SMTP id w3mr1533530ljj.170.1587473432841; 
 Tue, 21 Apr 2020 05:50:32 -0700 (PDT)
Received: from localhost (109241244009.gdansk.vectranet.pl. [109.241.244.9])
 by smtp.gmail.com with ESMTPSA id c21sm2073528lfh.16.2020.04.21.05.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 05:50:32 -0700 (PDT)
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal@hardline.pl>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Don't reserve minors for control nodes
Date: Tue, 21 Apr 2020 14:49:22 +0200
Message-Id: <20200421124922.136191-1-michal@hardline.pl>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWljaGHFgiBXaW5pYXJza2kgPG1pY2hhbC53aW5pYXJza2lAaW50ZWwuY29tPgoKQ29u
dHJvbCBub2RlcyBhcmUgbm8gbG9uZ2VyIHdpdGggdXMuCldoaWxlIHdlIHN0aWxsIG5lZWQgdG8g
cHJlc2VydmUgcmVuZGVyIG5vZGVzIG51bWJlcmluZywgdGhlcmUncyBubyBuZWVkCnRvIHJlc2Vy
dmUgdGhlIHJhbmdlIGZvcm1lcmx5IHVzZWQgZm9yIGNvbnRyb2wuIExldCdzIHJlcHVycG9zZSBp
dCB0byBiZQp1c2VkIGJ5IHByaW1hcnkgYW5kIHJlbW92ZSBjb250cm9sIHJlbWFpbnMgZnJvbSB0
aGUgY29kZSBlbnRpcmVseS4KClJlZmVyZW5jZXM6IDBkNDlmMzAzZThhNyAoImRybTogcmVtb3Zl
IGFsbCBjb250cm9sIG5vZGUgY29kZSIpClJlZmVyZW5jZXM6IGM5YWMzNzFkNGI1OSAoImRybTog
Rml4IHJlbmRlciBub2RlIG51bWJlcmluZyByZWdyZXNzaW9uIGZyb20gY29udHJvbCBub2RlIHJl
bW92YWwuIikKU2lnbmVkLW9mZi1ieTogTWljaGHFgiBXaW5pYXJza2kgPG1pY2hhbC53aW5pYXJz
a2lAaW50ZWwuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
Q2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+CkNjOiBNYXJjaW4gQmVybmF0b3dpY3og
PG1hcmNpbi5iZXJuYXRvd2ljekBpbnRlbC5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNo
cm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jIHwgNCArKy0tCiBpbmNs
dWRlL2RybS9kcm1fZmlsZS5oICAgIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Ry
di5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYwppbmRleCBjMTVjOWI0NTQwZTEuLjM2NmE3
NjBiYmMyOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2Rydi5jCkBAIC0xMjQsOCArMTI0LDggQEAgc3RhdGljIGludCBkcm1f
bWlub3JfYWxsb2Moc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHR5cGUpCiAJ
c3Bpbl9sb2NrX2lycXNhdmUoJmRybV9taW5vcl9sb2NrLCBmbGFncyk7CiAJciA9IGlkcl9hbGxv
YygmZHJtX21pbm9yc19pZHIsCiAJCSAgICAgIE5VTEwsCi0JCSAgICAgIDY0ICogdHlwZSwKLQkJ
ICAgICAgNjQgKiAodHlwZSArIDEpLAorCQkgICAgICAxMjggKiB0eXBlLAorCQkgICAgICAxMjgg
KiAodHlwZSArIDEpLAogCQkgICAgICBHRlBfTk9XQUlUKTsKIAlzcGluX3VubG9ja19pcnFyZXN0
b3JlKCZkcm1fbWlub3JfbG9jaywgZmxhZ3MpOwogCWlkcl9wcmVsb2FkX2VuZCgpOwpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaCBiL2luY2x1ZGUvZHJtL2RybV9maWxlLmgKaW5k
ZXggNzE2OTkwYmFjZTEwLi40NWU2ZGFlNjkyOTMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9maWxlLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaApAQCAtNTQsNyArNTQsNiBAQCBz
dHJ1Y3QgZmlsZTsKICAqLwogZW51bSBkcm1fbWlub3JfdHlwZSB7CiAJRFJNX01JTk9SX1BSSU1B
UlksCi0JRFJNX01JTk9SX0NPTlRST0wsCiAJRFJNX01JTk9SX1JFTkRFUiwKIH07CiAKLS0gCjIu
MjYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
