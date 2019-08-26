Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FC19D8D1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 00:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF006E115;
	Mon, 26 Aug 2019 22:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0FA6E115
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 22:06:19 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id p12so41341759iog.5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j2+X7ZLdUUxNkcBQNBfyLlM7Bq5bjsdY0IjjmtqCq8s=;
 b=Bdsz/tDdj2i7isZ21/f3pAgyZMlRqmh/hQpn9O9EXgSQDeddwDwAUoystIjMNpyoKB
 K7weu67HnH210evdowYnfgcn4NcKXfag1xM4mH6U9tIsgRvMvAzR6tDOK5Psbmj2KU4r
 XVwt45TMVatFXH4JM3njkB6fibT2hnttERSFgHj8lWp49AVuh7Uj0DCCHgsJcAg6Xljm
 AtF6crrA9hbPFzugKxaemHxgdPlsfhlkk8Dp6a50hvXlD+DSnfgcjS+/hRVeDPlf0so5
 dXFv7ChYbWDrMcJMt0XkqGm7sWm5ukCGAiY8hgo7XPHW77DHdn5F1Uv0u5ZnnXVdj/+d
 NxVA==
X-Gm-Message-State: APjAAAUj/6zKUx4PZzucHXw3mT+wHcpbjb7SH4DkBgJCN+YK4MU7x9zY
 N5h8z5L9rLoPR+rKhI2/u36vy7t/176F+Rpw+EM=
X-Google-Smtp-Source: APXvYqwcYevweKqMNjHTJ83mj+kVwgsdYNMqCFj1IF88/5p1L/AzW1r6mX95/4ulDgCHTIUECfPGxzod9HEYB/twqAs=
X-Received: by 2002:a5e:df06:: with SMTP id f6mr16773354ioq.93.1566857178737; 
 Mon, 26 Aug 2019 15:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190822102614.18164-1-kraxel@redhat.com>
In-Reply-To: <20190822102614.18164-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 26 Aug 2019 15:06:07 -0700
Message-ID: <CAPaKu7Q+T1qf4jboXSV-jsXHrvqSxG+MrJGJzFf7qNisaZj3Wg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: make resource id workaround runtime
 switchable.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=j2+X7ZLdUUxNkcBQNBfyLlM7Bq5bjsdY0IjjmtqCq8s=;
 b=lQSN7pQhTCM28br9rSgxowCmfZmsljVskLhGMUN8q9JRAPHK5tkMcdA4AhKA+ezKGf
 qcEEG70QEoiTsJhZkfOW57KexZaK/Np9tIm3WFU1t0QflRoTMSSWKK6EKoa/oeZECM9v
 fgpa1tg+tGUUhSa43lab1By1HWWM78GpZ1C8BjBzh9x6I0UTiFwAHzrUCuxuNCjvJSLn
 vn+AI5TRT8NmBBGBr8ySszqREymrYNaOgZp5QoY5dt7BZKnH361RVhA5ON3uoxJSEwV8
 Nb/+SsuAVFcRCdMd9bkdDoor3f5LDZapyZbl7ErJI+Gvy8Uqa29OSSHCZ3EjSRZ8QJdd
 q4nw==
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMzoyNiBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBBbHNvIHVwZGF0ZSB0aGUgY29tbWVudCB3aXRoIGEgcmVmZXJl
bmNlIHRvIHRoZSB2aXJnbHJlbmRlcmVyIGZpeC4KPgo+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9m
Zm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogQ2hpYS1JIFd1IDxvbHZhZmZl
QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVj
dC5jIHwgNDQgKysrKysrKysrKysrKystLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjQg
aW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X29iamVjdC5jCj4gaW5kZXggYjJkYTMxMzEwZDI0Li5lOThhYWEwMDU3OGQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCj4gQEAgLTI3LDM0ICsyNywz
OCBAQAo+Cj4gICNpbmNsdWRlICJ2aXJ0Z3B1X2Rydi5oIgo+Cj4gK3N0YXRpYyBpbnQgdmlydGlv
X2dwdV92aXJnbHJlbmRlcmVyX3dvcmthcm91bmQgPSAxOwo+ICttb2R1bGVfcGFyYW1fbmFtZWQo
dmlyZ2xoYWNrLCB2aXJ0aW9fZ3B1X3ZpcmdscmVuZGVyZXJfd29ya2Fyb3VuZCwgaW50LCAwNDAw
KTsKPiArCj4gIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9yZXNvdXJjZV9pZF9nZXQoc3RydWN0IHZp
cnRpb19ncHVfZGV2aWNlICp2Z2RldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1aW50MzJfdCAqcmVzaWQpCj4gIHsKPiAtI2lmIDAKPiAtICAgICAgIGludCBoYW5k
bGUgPSBpZGFfYWxsb2MoJnZnZGV2LT5yZXNvdXJjZV9pZGEsIEdGUF9LRVJORUwpOwo+IC0KPiAt
ICAgICAgIGlmIChoYW5kbGUgPCAwKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gaGFuZGxlOwo+
IC0jZWxzZQo+IC0gICAgICAgc3RhdGljIGludCBoYW5kbGU7Cj4gLQo+IC0gICAgICAgLyoKPiAt
ICAgICAgICAqIEZJWE1FOiBkaXJ0eSBoYWNrIHRvIGF2b2lkIHJlLXVzaW5nIElEcywgdmlyZ2xy
ZW5kZXJlcgo+IC0gICAgICAgICogY2FuJ3QgZGVhbCB3aXRoIHRoYXQuICBOZWVkcyBmaXhpbmcg
aW4gdmlyZ2xyZW5kZXJlciwgYWxzbwo+IC0gICAgICAgICogc2hvdWxkIGZpZ3VyZSBhIGJldHRl
ciB3YXkgdG8gaGFuZGxlIHRoYXQgaW4gdGhlIGd1ZXN0Lgo+IC0gICAgICAgICovCj4gLSAgICAg
ICBoYW5kbGUrKzsKPiAtI2VuZGlmCj4gLQo+IC0gICAgICAgKnJlc2lkID0gaGFuZGxlICsgMTsK
PiArICAgICAgIGlmICh2aXJ0aW9fZ3B1X3ZpcmdscmVuZGVyZXJfd29ya2Fyb3VuZCkgewo+ICsg
ICAgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgICAgKiBIYWNrIHRvIGF2b2lkIHJlLXVz
aW5nIHJlc291cmNlIElEcy4KPiArICAgICAgICAgICAgICAgICoKPiArICAgICAgICAgICAgICAg
ICogdmlyZ2xyZW5kZXJlciB2ZXJzaW9ucyB1cCB0byAoYW5kIGluY2x1ZGluZykgMC43LjAKPiAr
ICAgICAgICAgICAgICAgICogY2FuJ3QgZGVhbCB3aXRoIHRoYXQuICB2aXJnbHJlbmRlcmVyIGNv
bW1pdAo+ICsgICAgICAgICAgICAgICAgKiAiZjkxYTlkZDM1NzE1IEZpeCB1bmxpbmtpbmcgcmVz
b3VyY2VzIGZyb20gaGFzaAo+ICsgICAgICAgICAgICAgICAgKiB0YWJsZS4iIChGZWIgMjAxOSkg
Zml4ZXMgdGhlIGJ1Zy4KPiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIHN0
YXRpYyBpbnQgaGFuZGxlOwo+ICsgICAgICAgICAgICAgICBoYW5kbGUrKzsKPiArICAgICAgICAg
ICAgICAgKnJlc2lkID0gaGFuZGxlICsgMTsKPiArICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAg
ICAgICAgIGludCBoYW5kbGUgPSBpZGFfYWxsb2MoJnZnZGV2LT5yZXNvdXJjZV9pZGEsIEdGUF9L
RVJORUwpOwo+ICsgICAgICAgICAgICAgICBpZiAoaGFuZGxlIDwgMCkKPiArICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gaGFuZGxlOwo+ICsgICAgICAgICAgICAgICAqcmVzaWQgPSBoYW5k
bGUgKyAxOwo+ICsgICAgICAgfQo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICBzdGF0aWMg
dm9pZCB2aXJ0aW9fZ3B1X3Jlc291cmNlX2lkX3B1dChzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2Ug
KnZnZGV2LCB1aW50MzJfdCBpZCkKPiAgewo+IC0jaWYgMAo+IC0gICAgICAgaWRhX2ZyZWUoJnZn
ZGV2LT5yZXNvdXJjZV9pZGEsIGlkIC0gMSk7Cj4gLSNlbmRpZgo+ICsgICAgICAgaWYgKCF2aXJ0
aW9fZ3B1X3ZpcmdscmVuZGVyZXJfd29ya2Fyb3VuZCkgewo+ICsgICAgICAgICAgICAgICBpZGFf
ZnJlZSgmdmdkZXYtPnJlc291cmNlX2lkYSwgaWQgLSAxKTsKPiArICAgICAgIH0KPiAgfQo+Cj4g
IHN0YXRpYyB2b2lkIHZpcnRpb19ncHVfdHRtX2JvX2Rlc3Ryb3koc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0ICp0Ym8pCj4gLS0KPiAyLjE4LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
