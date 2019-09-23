Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72002BB513
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 15:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C344D89CBE;
	Mon, 23 Sep 2019 13:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889216E222
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 08:15:32 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id l21so7165164edr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 01:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YrphDalHhzS/eEcKq6pAk4HWzVaxWmV1yXuQ1gyWfUo=;
 b=CTYKcqJcvLVn38iziYem1G3kLd4+eF6X3313x8ysagdnj2vPVvSQ+7N5asvPZ4V4ew
 0jX/6a4b9+l+ADZ8eTuhEEO9dw1fWXC+cif5gbR11g4Ox0GOGfnSzhE2p3B9QUf3qv+/
 P2DgM5geQ1iNfzSaL/WhnWwq2Tcbl5JKt4l8wAG1qH5FFP/zJeWs/oCI8qFv9eMUcFo4
 FrCq4O9PxitJYMTJj9FWcpAdk3PXnT8VmsveZ4wl8eoz6myRnrJD0NDiurew+xo0/4ZD
 RN9wZ920l55o/jZcL8vm8BeRaK4luNbUAeUvtOF6BGhoGz8WkuHtiiIynaq/6WNH8jqx
 ip5A==
X-Gm-Message-State: APjAAAU7uCnt9FQuP36dITms+LKiLY5AedECGUDtINiWwl9mAcU5U281
 ROfT2Wi/gyTWchMqIoYvPHbqNr4WD6nYKxym6T8Udw==
X-Google-Smtp-Source: APXvYqzVI45ag269E7dBFRpSiMPbDjXntVzL2o19/1Lnor6BCjBJy2beWlf+y8GGpI0LGcSqflkxyaky8ooirXFogWY=
X-Received: by 2002:a50:f391:: with SMTP id g17mr32700852edm.163.1569226531020; 
 Mon, 23 Sep 2019 01:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190830074103.16671-1-bibby.hsieh@mediatek.com>
 <20190830074103.16671-3-bibby.hsieh@mediatek.com>
In-Reply-To: <20190830074103.16671-3-bibby.hsieh@mediatek.com>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Mon, 23 Sep 2019 16:14:55 +0800
Message-ID: <CANdKZ0du8unMedhmdjCyXR7xKYBoWEZ7YLmrvd6Y_W-Y=u3TfQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mediatek: Apply CMDQ control flow
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
X-Mailman-Approved-At: Mon, 23 Sep 2019 13:17:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YrphDalHhzS/eEcKq6pAk4HWzVaxWmV1yXuQ1gyWfUo=;
 b=PJL7bIGC0ZYBHvwVyYt2LJ5y887xECL9EXUH3kVh2gitdKh2PIj+LjzBO3LVxGro1P
 L45a/oCt5B7UKTTPbz8ClvwE8+bChE4KQP9p5SPpAnRpS9BKt7SQQpJAcS9rEmvpsy8w
 7Xt0OLUHniWm243JJOhB8bgzU99a89+rosGY0=
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Tomasz Figa <tfiga@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQmliYnksCgpPbiBGcmksIEF1ZyAzMCwgMjAxOSBhdCAzOjQxIFBNIEJpYmJ5IEhzaWVoIDxi
aWJieS5oc2llaEBtZWRpYXRlay5jb20+IHdyb3RlOgo+IC4uLgo+ICtzdGF0aWMgdm9pZCBkZHBf
Y21kcV9jYihzdHJ1Y3QgY21kcV9jYl9kYXRhIGRhdGEpCj4gK3sKPiArCj4gKyNpZiBJU19FTkFC
TEVEKENPTkZJR19NVEtfQ01EUSkKPiArICAgICAgIHN0cnVjdCBtdGtfY21kcV9jYl9kYXRhICpj
Yl9kYXRhID0gZGF0YS5kYXRhOwo+ICsgICAgICAgc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRj
X3N0YXRlID0gY2JfZGF0YS0+c3RhdGU7Cj4gKyAgICAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0
ZSAqYXRvbWljX3N0YXRlID0gY3J0Y19zdGF0ZS0+c3RhdGU7Cj4gKyAgICAgICBzdHJ1Y3QgZHJt
X2NydGMgKmNydGMgPSBjcnRjX3N0YXRlLT5jcnRjOwo+ICsgICAgICAgc3RydWN0IG10a19kcm1f
Y3J0YyAqbXRrX2NydGMgPSB0b19tdGtfY3J0YyhjcnRjKTsKPiArCj4gKyAgICAgICBEUk1fREVC
VUdfRFJJVkVSKCIlc1xuIiwgX19mdW5jX18pOwpUaGlzIGRlYnVnIG1lc3NhZ2UgaXMgcHJpbnRl
ZCBhYm91dCB0d2ljZSBwZXIgc2Vjb25kIHdoZW4gZW5hYmxlZCwKd2hpY2ggbWFrZXMgZGVidWdn
aW5nIG90aGVyIHRoaW5ncyB0aGF0IGFsc28gdXNlIERSTV9ERUJVR19EUklWRVIKaGFyZGVyLiBD
YW4gdGhpcyBiZSByYXRlLWxpbWl0ZWQgb3IgcmVtb3ZlZD8KCj4gKwo+ICsgICAgICAgaWYgKG10
a19jcnRjLT5wZW5kaW5nX25lZWRzX3ZibGFuaykgewo+ICsgICAgICAgICAgICAgICAvKiBjbWRx
X3ZibGFua19ldmVudCBtdXN0IGJlIHJlYWQgYWZ0ZXIgY21kcV9uZWVkc19ldmVudCAqLwo+ICsg
ICAgICAgICAgICAgICBzbXBfcm1iKCk7Cj4gKwo+IC4uLgo+ICt2b2lkIG10a19kcm1fY3J0Y19w
bGFuZV91cGRhdGUoc3RydWN0IGRybV9jcnRjICpjcnRjLCBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFu
ZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG10a19wbGFuZV9zdGF0
ZSAqc3RhdGUpCj4gK3sKPiArICAgICAgIHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjID0g
dG9fbXRrX2NydGMoY3J0Yyk7Cj4gKyAgICAgICBzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wID0g
bXRrX2NydGMtPmRkcF9jb21wWzBdOwo+ICsgICAgICAgc3RydWN0IGRybV9jcnRjX3N0YXRlICpj
cnRjX3N0YXRlID0gY3J0Yy0+c3RhdGU7Cj4gKyAgICAgICBzdHJ1Y3QgbXRrX2NydGNfc3RhdGUg
Km10a19jcnRjX3N0YXRlID0gdG9fbXRrX2NydGNfc3RhdGUoY3J0Y19zdGF0ZSk7Cj4gKyAgICAg
ICBzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfaGFuZGxlID0gbXRrX2NydGNfc3RhdGUtPmNtZHFfaGFu
ZGxlOwo+ICsgICAgICAgdW5zaWduZWQgaW50IGNvbXBfbGF5ZXJfbnIgPSBtdGtfZGRwX2NvbXBf
bGF5ZXJfbnIoY29tcCk7Cj4gKyAgICAgICB1bnNpZ25lZCBpbnQgbG9jYWxfbGF5ZXI7Cj4gKyAg
ICAgICB1bnNpZ25lZCBpbnQgcGxhbmVfaW5kZXggPSBwbGFuZSAtIG10a19jcnRjLT5wbGFuZXM7
Cj4gKwo+ICsgICAgICAgRFJNX0RFQlVHX0RSSVZFUigiJXNcbiIsIF9fZnVuY19fKTsKU2FtZSB3
aXRoIHRoaXMgb25lLgoKPiArICAgICAgIGlmIChtdGtfY3J0Yy0+Y21kcV9jbGllbnQpIHsKPiAr
ICAgICAgICAgICAgICAgaWYgKHBsYW5lX2luZGV4ID49IGNvbXBfbGF5ZXJfbnIpIHsKPiArICAg
ICAgICAgICAgICAgICAgICAgICBjb21wID0gbXRrX2NydGMtPmRkcF9jb21wWzFdOwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGxvY2FsX2xheWVyID0gcGxhbmVfaW5kZXggLSBjb21wX2xheWVy
X25yOwo+IC4uLgo+IEBAIC00OTQsMTMgKzU5OSwyOSBAQCBzdGF0aWMgdm9pZCBtdGtfZHJtX2Ny
dGNfYXRvbWljX2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX2NydGNfc3Rh
dGUpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpvbGRfYXRvbWljX3N0
YXRlID0gb2xkX2NydGNfc3RhdGUtPnN0YXRlOwo+ICsgICAgICAgc3RydWN0IGRybV9jcnRjX3N0
YXRlICpjcnRjX3N0YXRlID0gY3J0Yy0+c3RhdGU7Cj4gKyAgICAgICBzdHJ1Y3QgbXRrX2NydGNf
c3RhdGUgKnN0YXRlID0gdG9fbXRrX2NydGNfc3RhdGUoY3J0Y19zdGF0ZSk7Cj4gKyAgICAgICBz
dHJ1Y3QgY21kcV9wa3QgKmNtZHFfaGFuZGxlID0gc3RhdGUtPmNtZHFfaGFuZGxlOwo+ICAgICAg
ICAgc3RydWN0IG10a19kcm1fY3J0YyAqbXRrX2NydGMgPSB0b19tdGtfY3J0YyhjcnRjKTsKPiAg
ICAgICAgIHN0cnVjdCBtdGtfZHJtX3ByaXZhdGUgKnByaXYgPSBjcnRjLT5kZXYtPmRldl9wcml2
YXRlOwo+ICsgICAgICAgc3RydWN0IG10a19jbWRxX2NiX2RhdGEgKmNiX2RhdGE7Cj4gICAgICAg
ICB1bnNpZ25lZCBpbnQgcGVuZGluZ19wbGFuZXMgPSAwOwo+ICAgICAgICAgaW50IGk7Cj4KPiAt
ICAgICAgIGlmIChtdGtfY3J0Yy0+ZXZlbnQpCj4gLSAgICAgICAgICAgICAgIG10a19jcnRjLT5w
ZW5kaW5nX25lZWRzX3ZibGFuayA9IHRydWU7Cj4gKyAgICAgICBEUk1fREVCVUdfRFJJVkVSKCJb
Q1JUQzoldV0gW1NUQVRFOiVwKCVwKS0+JXAoJXApXVxuIiwgY3J0Yy0+YmFzZS5pZCwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgb2xkX2NydGNfc3RhdGUsIG9sZF9jcnRjX3N0YXRlLT5zdGF0
ZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgY3J0Y19zdGF0ZSwgY3J0Y19zdGF0ZS0+c3Rh
dGUpOwpTYW1lIHdpdGggdGhpcyBvbmUuCgo+ICsKPiArICAgICAgIGlmIChJU19FTkFCTEVEKENP
TkZJR19NVEtfQ01EUSkgJiYgbXRrX2NydGMtPmNtZHFfY2xpZW50KSB7Cj4gKyAgICAgICAgICAg
ICAgIGRybV9hdG9taWNfc3RhdGVfZ2V0KG9sZF9hdG9taWNfc3RhdGUpOwo+ICsgICAgICAgICAg
ICAgICBjYl9kYXRhID0ga21hbGxvYyhzaXplb2YoKmNiX2RhdGEpLCBHRlBfS0VSTkVMKTsKPiAr
ICAgICAgICAgICAgICAgY2JfZGF0YS0+c3RhdGUgPSBvbGRfY3J0Y19zdGF0ZTsKPiAuLi4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
