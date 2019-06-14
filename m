Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C647546AEC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0513389872;
	Fri, 14 Jun 2019 20:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4F389612
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:17 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a14so5201446edv.12
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KFPSYVwN3kk9QZ4sKRltB7QwR18X686gyXUMlqrYsrY=;
 b=jlpYUZKxdpmvhfqP5JVqEKUvVNGuWW8o+pOASl3rRC5lz9+0F513frUnc4QvtTp8es
 inVb35EG9w4kjQnOd38rs/hO7ft4dwzShPQItp222i4GKZ8NIuXRiOdyO07u9aeAdklq
 yq4apkSiL0bdNWRjRAE0/TaRI6hgGgMXoo5GfvCl0IQlsbHn9HQT00VxMKau0QDiFROO
 BOhO5NjRgbff6Tl5vad/hcUKIPU2cuoMsxl+p1S+EjEsycF8nEC8F8eaRmCfONqbGxlY
 E4h0JofGsFxBSbJZSvxZLnnsQGFzwpghdxQVVif0oDca9SgIQQCOS/ZDPwRWh5XIK+xu
 z0Ow==
X-Gm-Message-State: APjAAAX1lW1bLl65jX3KQjNGuv+GtRgEeQdWyJEogp2CvBMvpIiL9X1o
 18Kr3Wb/lTHX/Iw0edxG8wF7M6ZNwpA=
X-Google-Smtp-Source: APXvYqx6f03vXMhDJunlmmOY4VivqbA2U9HTxczdzhG2kOU+jL8CIwcPl1B1GkGGY+Ooq04DMb4KOQ==
X-Received: by 2002:a50:b1e7:: with SMTP id n36mr55073451edd.227.1560544635843; 
 Fri, 14 Jun 2019 13:37:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:15 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 47/59] drm/vc4: Don set gem_obj->resv in prime import anymore
Date: Fri, 14 Jun 2019 22:36:03 +0200
Message-Id: <20190614203615.12639-48-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KFPSYVwN3kk9QZ4sKRltB7QwR18X686gyXUMlqrYsrY=;
 b=IsOqiwSAcFTgXxTRrpMpQV8o5pikcwR33RNFL991UaWuy+f+6Ck3xYHOCTtC/taWha
 efSVJaCFMHu0fgTtriz8xJGibqGfbafRU29u7gWBy1cUCJmjnTjZIvso+HTfMJ0ojgdP
 vXjYBS4GPya21gswLI+3oP9Tsiz6nQtj9zYyI=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBkb25lIGluIGRybV9wcmltZS5jIG5vdy4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogRXJpYyBBbmhvbHQgPGVyaWNAYW5o
b2x0Lm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9iby5jIHwgMiAtLQogMSBmaWxl
IGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Zj
NC92YzRfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2JvLmMKaW5kZXggYjBmOWViNjYz
MmEyLi43MDdiY2Q5OTI3ZjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2Jv
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfYm8uYwpAQCAtNzkzLDggKzc5Myw2IEBA
IHZjNF9wcmltZV9pbXBvcnRfc2dfdGFibGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlpZiAo
SVNfRVJSKG9iaikpCiAJCXJldHVybiBvYmo7CiAKLQlvYmotPnJlc3YgPSBhdHRhY2gtPmRtYWJ1
Zi0+cmVzdjsKLQogCXJldHVybiBvYmo7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
