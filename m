Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B80BBBA01
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 18:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DBA6E979;
	Mon, 23 Sep 2019 16:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A276E978;
 Mon, 23 Sep 2019 16:53:53 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id r4so13585917edy.4;
 Mon, 23 Sep 2019 09:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Vx10m/Lm/wy8maAuBSI7giwMG2Vidy5dikUf4oqhTM=;
 b=mZrf3qrYzjtnGyW6ATasrr8Pe/jf7LFIRQvSGDz4Ne54vIg6n78P+UWrjK01OQI6Au
 ByziK2TuBOWn1EkkpW+xep0JV1LXzyVXRO87CYt7ioIoZfPjkZ9U0ajZflSCV9qIuPcn
 ROqmXPRVHgGmK3rqEoVZsUBd1yBmN5hXXV6Tp20kKEM8Mdkm3+stwpGvdfbgjZ9Ipc7u
 7w0swgEcbiA5Bpko14BieqOIqWUpKSMyo1/j7fGf4GrRjMv07SW0++rqA1ZJ/T9MaR+h
 Iskc0V5uEwNuqPrPreIwJ0O0pFi++/68imdsdvuCS2L5OTeS9vcMnZC8258oYaJPMkuT
 spWw==
X-Gm-Message-State: APjAAAX+RvRy0EMMSYKtm/My9hSWUqMj1rMoCAxSfs733kZUNFGHu4sH
 3JuQfh5U4h8LW9SmW4/RWsPJL+XBssBK8z4UIz1QCA==
X-Google-Smtp-Source: APXvYqxbBOuu3hw0QIpTFiEv+Mi/YVA/FXFTAT3e/DBdocyEZ+BEQIdCppRPGcSakXQ32XfSXojTeY9Vl6bzMHjEzk8=
X-Received: by 2002:a17:906:2542:: with SMTP id
 j2mr775950ejb.278.1569257632256; 
 Mon, 23 Sep 2019 09:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <1569242500-182337-7-git-send-email-hjc@rock-chips.com>
 <1569242500-182337-9-git-send-email-hjc@rock-chips.com>
In-Reply-To: <1569242500-182337-9-git-send-email-hjc@rock-chips.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 23 Sep 2019 09:53:40 -0700
Message-ID: <CAF6AEGvsE_hxYYA123=55uvXVsDMkhfwvXW+gBMQJksE1WoQeg@mail.gmail.com>
Subject: Re: [PATCH 08/36] drm/msm: use bpp instead of cpp for drm_format_info
To: Sandy Huang <hjc@rock-chips.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8Vx10m/Lm/wy8maAuBSI7giwMG2Vidy5dikUf4oqhTM=;
 b=YqGv8Br482S2VTJcI04+h9KF8ITUDIpyq75eXpGc9nitcFdXrIUzkdfRWKyIQ8Mn/b
 ckFPQIxMfRtjvnCf1+iVD0bkS7xSFQ7cF1v7p2BCcPbmj7B8SqpR/AYqYk3bmR1jjcE1
 fK/5wbGy+CcaeeaurWFJnZpdRXR9KFIonubI4XN4zRvgLv6pDY9yQjnSNzUja0fqNsVn
 bDH0LQOKOZ+ocjqUSxtMDZdGOxcKAc5E1T6vb5wypCUFyktOeYTEoX1WBzeXXZF3S1MX
 drfoRsQiM0IQAcaB9UT1oZx4cSZT/DJmdQBK3GIIXAxHcl11YpqfT3ofaCDMWW0dktPC
 ePVg==
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
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Clark <robdclark@chromium.org>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bruce Wang <bzwang@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Shayenne Moura <shayenneluzmoura@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgNTo0NCBBTSBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hp
cHMuY29tPiB3cm90ZToKPgo+IGNwcFtCeXRlUGVyUGxhbmVdIGNhbid0IGRlc2NyaWJlIHRoZSAx
MGJpdCBkYXRhIGZvcm1hdCBjb3JyZWN0bHksCj4gU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0g
dG8gaW5zdGVhZCBjcHAuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2st
Y2hpcHMuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0
Yy5jICB8IDQgKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NydGMu
YyB8IDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9zbXAuYyAgfCAy
ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2ZiLmMgICAgICAgICAgICAgIHwgMiArLQo+
ICA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jIGIvZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYwo+IGluZGV4IGIzNDE3ZDUuLmM1
NzczMWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2Ny
dGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMKPiBA
QCAtMTE0OCw4ICsxMTQ4LDggQEAgc3RhdGljIGludCBfZHB1X2RlYnVnZnNfc3RhdHVzX3Nob3co
c3RydWN0IHNlcV9maWxlICpzLCB2b2lkICpkYXRhKQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZmItPmJhc2UuaWQsIChjaGFyICopICZmYi0+Zm9ybWF0LT5mb3JtYXQsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYi0+d2lkdGgsIGZiLT5oZWlnaHQpOwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGZiLT5mb3Jt
YXQtPmNwcCk7ICsraSkKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNlcV9wcmlu
dGYocywgImNwcFslZF06JXUgIiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpLCBmYi0+Zm9ybWF0LT5jcHBbaV0pOwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc2VxX3ByaW50ZihzLCAiYnBwWyVkXToldSAiLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGksIGZiLT5mb3JtYXQtPmJwcFtp
XSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgc2VxX3B1dHMocywgIlxuXHQiKTsKPgo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHNlcV9wcmludGYocywgIm1vZGlmaWVyOiU4bGx1ICIsIGZi
LT5tb2RpZmllcik7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1
L21kcDVfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9jcnRjLmMK
PiBpbmRleCBmZjE0NTU1Li42MWFiNGRjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9tZHA1L21kcDVfY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L21kcDUvbWRwNV9jcnRjLmMKPiBAQCAtNzkwLDcgKzc5MCw3IEBAIHN0YXRpYyB2b2lkIG1kcDVf
Y3J0Y19yZXN0b3JlX2N1cnNvcihzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4gICAgICAgICB3aWR0
aCA9IG1kcDVfY3J0Yy0+Y3Vyc29yLndpZHRoOwo+ICAgICAgICAgaGVpZ2h0ID0gbWRwNV9jcnRj
LT5jdXJzb3IuaGVpZ2h0Owo+Cj4gLSAgICAgICBzdHJpZGUgPSB3aWR0aCAqIGluZm8tPmNwcFsw
XTsKPiArICAgICAgIHN0cmlkZSA9IHdpZHRoICogaW5mby0+YnBwWzBdIC8gODsKPgo+ICAgICAg
ICAgZ2V0X3JvaShjcnRjLCAmcm9pX3csICZyb2lfaCk7Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9zbXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9tZHA1L21kcDVfc21wLmMKPiBpbmRleCA3NzYzMzdmLi45OTI0NzdkIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfc21wLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X3NtcC5jCj4gQEAgLTE0Nyw3ICsxNDcsNyBA
QCB1aW50MzJfdCBtZHA1X3NtcF9jYWxjdWxhdGUoc3RydWN0IG1kcDVfc21wICpzbXAsCj4gICAg
ICAgICBmb3IgKGkgPSAwOyBpIDwgbnBsYW5lczsgaSsrKSB7Cj4gICAgICAgICAgICAgICAgIGlu
dCBuLCBmZXRjaF9zdHJpZGUsIGNwcDsKPgo+IC0gICAgICAgICAgICAgICBjcHAgPSBpbmZvLT5j
cHBbaV07Cj4gKyAgICAgICAgICAgICAgIGNwcCA9IGluZm8tPmJwcFtpXSAvIDg7CgpVbmxlc3Mg
SSBtaXNzZWQgc29tZXRoaW5nIGluIHlvdXIgZmlyc3QgcGF0Y2gsIEkgZG9uJ3QgdGhpbmsgdGhp
cwpzZXJpZXMgaXMgYmlzZWN0YWJsZSwgaWUuIHJlcGxhY2luZyBjcHAgdy8gYnBwIHdvdWxkIGNh
dXNlIGV2ZXJ5dGhpbmcKZWxzZSBub3QgdG8gY29tcGlsZS4gIExvb2tzIGxpa2UgdGhlcmUgd2Fz
IGFuIGFsdGVybmF0aXZlIHByb3Bvc2FsIG9uCnRoZSBmaXJzdCBwYXRjaCwgYnV0IGlmIHdlIGRv
IGVuZCB1cCBnb2luZyB0aGlzIHJvdXRlLCBJIHRoaW5rIHlvdQpzaG91bGQgYWRkIGJwcCBpbiB0
aGUgZmlyc3QgcGF0Y2gsIGFuZCByZW1vdmUgY3BwIGluIHRoZSBsYXN0IHBhdGNoLgooQW5kIGFs
c28gcHJvYmFibHkgc3ByaW5rbGUgYXJvdW5kIFdBUk5fT04oaW5mby0+YnBwW25dICUgOCkgaW4g
cGxhY2VzCndlcmUgaXQgaXMgZXhwZWN0ZWQgdG8gYmUgYSBtdWx0aXBsZSBvZiA4KQoKQlIsCi1S
CgoKPiAgICAgICAgICAgICAgICAgZmV0Y2hfc3RyaWRlID0gd2lkdGggKiBjcHAgLyAoaSA/IGhz
dWIgOiAxKTsKPgo+ICAgICAgICAgICAgICAgICBuID0gRElWX1JPVU5EX1VQKGZldGNoX3N0cmlk
ZSAqIG5saW5lcywgc21wLT5ibGtfc2l6ZSk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX2ZiLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9mYi5jCj4gaW5kZXggNWJj
ZDVlNS4uNDU0NWZhMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9mYi5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmIuYwo+IEBAIC0xNzIsNyArMTcyLDcg
QEAgc3RhdGljIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKm1zbV9mcmFtZWJ1ZmZlcl9pbml0KHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBtaW5f
c2l6ZTsKPgo+ICAgICAgICAgICAgICAgICBtaW5fc2l6ZSA9IChoZWlnaHQgLSAxKSAqIG1vZGVf
Y21kLT5waXRjaGVzW2ldCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICsgd2lkdGggKiBpbmZv
LT5jcHBbaV0KPiArICAgICAgICAgICAgICAgICAgICAgICAgKyB3aWR0aCAqIGluZm8tPmJwcFtp
XSAvIDgKPiAgICAgICAgICAgICAgICAgICAgICAgICAgKyBtb2RlX2NtZC0+b2Zmc2V0c1tpXTsK
Pgo+ICAgICAgICAgICAgICAgICBpZiAoYm9zW2ldLT5zaXplIDwgbWluX3NpemUpIHsKPiAtLQo+
IDIuNy40Cj4KPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
