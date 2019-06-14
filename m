Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB9946B06
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54B08930F;
	Fri, 14 Jun 2019 20:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C27897E7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:22 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id d4so5187695edr.13
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WzT6U0WhgobdeP303rEiKhwYgKLzSzO8WG/ZfKn+9Ns=;
 b=Qnxw+Cof+ltu0Pgqr6Ltzj4yq4hAdyryrwj+FDILUSEdWjWX5lZ01a5uiJKmm+h/lk
 UFb0oUluLisp0mhu6k8enUIOXD+88jZfe+k7TIoAY/AtCLl02vi/BnIDIQOcmClMAugK
 JfED7Trjh4Ymp3pJ0k27Zsn4n2pLfs14JOvaUN61F0x51pFV60zq/razmjd4jXCM6kvE
 wHxM5tmSIaRx9ADXR79LCgIem6POkSTqygGcH2Rnd9icVv3HZeVPSC0S86Sy4lwGLKli
 WE0QFtxgfkoStfCC103kX6zBRFJpsabq5lcAIXPNnSorb/e+q9TQBN0YgE4P70pXeICz
 lJDQ==
X-Gm-Message-State: APjAAAUBXNjENCtvhFAoH83CbKzsm9VNdn3coVruDF//WhxOCKITfxOv
 PCqVySUIct0CklxwLIEWI+02RPBXeoc=
X-Google-Smtp-Source: APXvYqylEP6VyuIhHG5p3/sL+186wPgoa2pmMLwABLQV0tmBldXeHZ4unRx2OIkygJ0mAII9+YulCg==
X-Received: by 2002:a50:b13b:: with SMTP id k56mr62380262edd.192.1560544639295; 
 Fri, 14 Jun 2019 13:37:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:18 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 50/59] drm/vc4: Use drm_gem_fb_prepare_fb
Date: Fri, 14 Jun 2019 22:36:06 +0200
Message-Id: <20190614203615.12639-51-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WzT6U0WhgobdeP303rEiKhwYgKLzSzO8WG/ZfKn+9Ns=;
 b=fUYqy5EX7S68buoXknbSdujJXaPoDAre4KSzShpXZfYThrGGy9PdcaIqxb1nz1sRMk
 EWImsJ3LOqnEGRIRuNyMp2FKO45TaUP+a/pxN5Smn/AKpy4hRkC9voLQAlyTwTpOSlLE
 T4KHaZZR8/P1bE6FX7aKhQO0ij0AeqVs22XQU=
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

dmM0IGhhcyBzd2l0Y2hlZCB0byB1c2luZyBkcm1fZmItPm9ialtdLCBzbyB3ZSBjYW4ganVzdCB1
c2UgdGhlIGhlbHBlcgp1bmNoYW5nZWQuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfcGxhbmUuYyB8IDUgKy0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfcGxh
bmUuYwppbmRleCA0NDFlMDZkNDVjODkuLmY1OWY4YzQwNGQ4MCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3ZjNC92YzRfcGxhbmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9w
bGFuZS5jCkBAIC0xMTMyLDEwICsxMTMyLDcgQEAgc3RhdGljIGludCB2YzRfcHJlcGFyZV9mYihz
dHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAlpZiAoIXN0YXRlLT5mYikKIAkJcmV0dXJuIDA7CiAK
LQlibyA9IHRvX3ZjNF9ibygmZHJtX2ZiX2NtYV9nZXRfZ2VtX29iaihzdGF0ZS0+ZmIsIDApLT5i
YXNlKTsKLQotCWZlbmNlID0gcmVzZXJ2YXRpb25fb2JqZWN0X2dldF9leGNsX3JjdShiby0+YmFz
ZS5iYXNlLnJlc3YpOwotCWRybV9hdG9taWNfc2V0X2ZlbmNlX2Zvcl9wbGFuZShzdGF0ZSwgZmVu
Y2UpOworCWRybV9nZW1fZmJfcHJlcGFyZV9mYihwbGFuZSwgc3RhdGUpOwogCiAJaWYgKHBsYW5l
LT5zdGF0ZS0+ZmIgPT0gc3RhdGUtPmZiKQogCQlyZXR1cm4gMDsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
