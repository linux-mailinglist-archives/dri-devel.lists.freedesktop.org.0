Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF0FC1C03
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 09:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B0F6E143;
	Mon, 30 Sep 2019 07:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBFA6E143
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 07:22:15 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id k20so10247803oih.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 00:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=svnk0kf5Xru68vE4BD29OUahoTO1J+C23zLdUFz0Myw=;
 b=RQS1o6LKdv9V2vA40JHM+5meocZRAaaFgvVHB4ncHKKFNK22WWtiUuYEAEvwnfzlGE
 j9qwCO8j6ziClVHODiJOxEwfpoFlOjh+kD0t0QMfCQ0D52KL8hshdzu3BDI/9oJOQGeG
 2TnTWft5i6hGYnjsNvf11SX0lG+MYjec65mH2C1ljg0F341tzfS9EVt5BEcbn799avfP
 /QpkhKESt/q3RnWsExGlEKUIfHOvx8UN6LoGZapYVLzsv3nVDDUpa1gVU4zkEnpWCr0b
 JuW4P3x/GLTpTqPDwRqg637H396cvzAMDFHraj9kwMRfApnPZ6kGSB7GDnKDaF8Zmn5U
 nnVw==
X-Gm-Message-State: APjAAAVk8LI6WSf3S3rQVLAnGy192oHhdSQsFaQP/lhKwRtjSSmJU50w
 tHHOLPwcZYed7LZ4qcAiyO+z/LRwdbCB1sdDqE2sMA==
X-Google-Smtp-Source: APXvYqxwKR+QPHNX2ok2B2LSkEYN+8FGUtI+tPxhseBR9iydwvwshhXowsojDK1gwteppSZgpQVoGbplLypHZsMXfkU=
X-Received: by 2002:aca:d841:: with SMTP id p62mr17233434oig.128.1569828134719; 
 Mon, 30 Sep 2019 00:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190922074900.853-1-yuq825@gmail.com>
In-Reply-To: <20190922074900.853-1-yuq825@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 30 Sep 2019 09:22:03 +0200
Message-ID: <CAKMK7uHro9W8GqvuVf0Ruji691U7Trc_jmS3U-OEacLFDH6P1A@mail.gmail.com>
Subject: Re: [PATCH] dma-buf/resv: fix exclusive fence get
To: Qiang Yu <yuq825@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=svnk0kf5Xru68vE4BD29OUahoTO1J+C23zLdUFz0Myw=;
 b=gvCsGY20HmK23Zn7UQJ2DiSuKibbzJrFEPNKg/RmOp/IXYuO0XbNtvnD1z0vsvIGfS
 nE6tcMWi78f/6X409tUKii7nh7mDrhTKrVgciIDQayzNrfna1/dKb7AsHE20gZKmRtYQ
 PY4hFu77EvVnAI5iyhluhAxuoVlIs62M2ZD/s=
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 lima@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMjIsIDIwMTkgYXQgMjowOCBQTSBRaWFuZyBZdSA8eXVxODI1QGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiBUaGlzIGNhdXNlcyBrZXJuZWwgY3Jhc2ggd2hlbiB0ZXN0aW5nIGxpbWEg
ZHJpdmVyLgo+Cj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPiBGaXhlczogYjhjMDM2ZGZjNjZmICgiZG1hLWJ1Zjogc2ltcGxpZnkgcmVzZXJ2YXRpb25f
b2JqZWN0X2dldF9mZW5jZXNfcmN1IGEgYml0IikKPiBTaWduZWQtb2ZmLWJ5OiBRaWFuZyBZdSA8
eXVxODI1QGdtYWlsLmNvbT4KClNlbGZ0ZXN0IGZvciB0aGlzIHdvdWxkIGJlIGxvdmVseSwgbm93
IHRoYXQgdGhlIGJhc2ljIGluZnJhc3RydWN0dXJlCmlzIGluIHBsYWNlIC4uLgotRGFuaWVsCgo+
IC0tLQo+ICBkcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9kbWEtYnVmL2RtYS1yZXN2LmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYwo+IGluZGV4
IDQyYThmM2YxMTY4MS4uNzA5MDAyNTE1NTUwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1
Zi9kbWEtcmVzdi5jCj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKPiBAQCAtNDcx
LDcgKzQ3MSw3IEBAIGludCBkbWFfcmVzdl9nZXRfZmVuY2VzX3JjdShzdHJ1Y3QgZG1hX3Jlc3Yg
Km9iaiwKPiAgICAgICAgIGlmIChwZmVuY2VfZXhjbCkKPiAgICAgICAgICAgICAgICAgKnBmZW5j
ZV9leGNsID0gZmVuY2VfZXhjbDsKPiAgICAgICAgIGVsc2UgaWYgKGZlbmNlX2V4Y2wpCj4gLSAg
ICAgICAgICAgICAgIHNoYXJlZFsrK3NoYXJlZF9jb3VudF0gPSBmZW5jZV9leGNsOwo+ICsgICAg
ICAgICAgICAgICBzaGFyZWRbc2hhcmVkX2NvdW50KytdID0gZmVuY2VfZXhjbDsKPgo+ICAgICAg
ICAgaWYgKCFzaGFyZWRfY291bnQpIHsKPiAgICAgICAgICAgICAgICAga2ZyZWUoc2hhcmVkKTsK
PiAtLQo+IDIuMTcuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
