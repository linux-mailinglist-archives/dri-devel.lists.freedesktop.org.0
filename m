Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24145274AF6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 23:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12AD892FE;
	Tue, 22 Sep 2020 21:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B073892FE
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 21:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600809297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mf4ET5A6pTrj1XKJ2ODwFO2BG7xSVsbhE8JSNbeonVk=;
 b=KYghOLKrfvDQicfRlE0xxj5/5lkyTvOB0/9dF8aL72v4smpii9hQIuEzNaFbMS4RwWWi/V
 PamNarr0aFWbucGH/6r/szqNlXmPd4qJtkhQy0pvcvPHUCTd0kPzLgDOUsfPkwjKOYtpc9
 i8FjUVFvLisH539teds0U9bilY7IWsc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-zjN7eStSNTuBPMzLk0XLPg-1; Tue, 22 Sep 2020 17:14:51 -0400
X-MC-Unique: zjN7eStSNTuBPMzLk0XLPg-1
Received: by mail-qt1-f199.google.com with SMTP id t56so17333779qtt.19
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 14:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Mf4ET5A6pTrj1XKJ2ODwFO2BG7xSVsbhE8JSNbeonVk=;
 b=kOTO66ZxMX+8Y6lWi5UzpeLzMbhRSmN/NkMkI8AIPtGOxFaBjcaaDIEV6E3h2K6vzJ
 s+quXD4rw6KfBPPOrevaFDGlAb26P6ZrM6bNljuIj7Jgl8HodogNa9Fj57cbKvoX0eoD
 ycZ1IOvTAnyMwtXBQ268CLMQysng0+IbN/VKj3mg/QViQ9PG15/ypC8Hz8UoHl2pfGjH
 HF1atGaN5Ec7Rh5vWzw5UH+UGyVm4k6s/N2pUnp9zX31D5tobbfnd0R0PDStHBWcMdz/
 BMiiVAlAsDBGmSbIhMwmCaW6GUjsKFW9VQ6pdX6jjBhSx820FkRk/WQ5lHVit3hqW4PT
 VWEg==
X-Gm-Message-State: AOAM530C5x3UUA1jeMHyLO/P7wSFD8CacuHl1kALezX/uuK/KxUnVgqB
 NhBISGnkQLlFgyKi6wioocrrKH9siAlyCggx9F/tBQsQgErmiwR25u5V1JUCR2d9KEGnRaUvxrM
 ofW3o1yBnRsb7NtC6krQnOib0tbAn
X-Received: by 2002:a0c:e904:: with SMTP id a4mr7914300qvo.24.1600809290649;
 Tue, 22 Sep 2020 14:14:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwv6gSFioEwHgineyjomjrnvy/onWXozophZU2EmPW55rL8svms5nqe+QTj+1TwMznKFQcpaA==
X-Received: by 2002:a0c:e904:: with SMTP id a4mr7914282qvo.24.1600809290396;
 Tue, 22 Sep 2020 14:14:50 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id d22sm6495452qkj.93.2020.09.22.14.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 14:14:49 -0700 (PDT)
Message-ID: <7b10668ee337e531b14705ebecb1f6c1004728d6.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/kms/nv50-: Fix clock checking algorithm in
 nv50_dp_mode_valid()
From: Lyude Paul <lyude@redhat.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 22 Sep 2020 17:14:48 -0400
In-Reply-To: <CAKb7UvhAb0wFd9Qi1FGJ=TAYZJ9DYXL6XXMfnG49xEO=a9TuYg@mail.gmail.com>
References: <20200922210510.156220-1-lyude@redhat.com>
 <CAKb7UvhAb0wFd9Qi1FGJ=TAYZJ9DYXL6XXMfnG49xEO=a9TuYg@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, "open
 list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIwLTA5LTIyIGF0IDE3OjEwIC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiBD
YW4gd2UgdXNlIDZicGMgb24gYXJiaXRyYXJ5IERQIG1vbml0b3JzLCBvciBpcyB0aGVyZSBhIGNh
cGFiaWxpdHkgZm9yCj4gaXQ/IE1heWJlIG9ubHkgdXNlIDZicGMgaWYgZGlzcGxheV9pbmZvLmJw
YyA9PSA2IGFuZCBvdGhlcndpc2UgdXNlIDg/CgpJIGRvbid0IHRoaW5rIHRoYXQgZGlzcGxheV9p
bmZvLmJwYyBhY3R1YWxseSBpbXBsaWVzIGEgbWluaW11bSBicGMsIG9ubHkgYQptYXhpbXVtIGJw
YyBpaXJjIChWaWxsZSB3b3VsZCBrbm93IHRoZSBhbnN3ZXIgdG8gdGhpcyBvbmUpLiBUaGUgb3Ro
ZXIgdGhpbmcgdG8Kbm90ZSBoZXJlIGlzIHRoYXQgd2Ugd2FudCB0byBhc3N1bWUgdGhlIGxvd2Vz
dCBwb3NzaWJsZSBicGMgaGVyZSBzaW5jZSB3ZSdyZQpvbmx5IGNvbmNlcm5lZCBpZiB0aGUgbW9k
ZSBwYXNzZWQgdG8gLT5tb2RlX3ZhbGlkIGNhbiBiZSBzZXQgdW5kZXIgLWFueS0KY29uZGl0aW9u
cyAoaW5jbHVkaW5nIHRob3NlIHRoYXQgcmVxdWlyZSBsb3dlcmluZyB0aGUgYnBjIGJleW9uZCBp
dCdzIG1heGltdW0KdmFsdWUpLCBzbyB3ZSBkZWZpbml0ZWx5IGRvIHdhbnQgdG8gYWx3YXlzIHVz
ZSA2YnBjIGhlcmUgZXZlbiBvbmNlIHdlIGdldApzdXBwb3J0IGZvciBvcHRpbWl6aW5nIHRoZSBi
cGMgYmFzZWQgb24gdGhlIGF2YWlsYWJsZSBkaXNwbGF5IGJhbmR3aWR0aC4KPiAKPiBPbiBUdWUs
IFNlcCAyMiwgMjAyMCBhdCA1OjA2IFBNIEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+IHdy
b3RlOgo+ID4gV2hpbGUgSSB0aG91Z2h0IEkgaGFkIHRoaXMgY29ycmVjdCAoc2luY2UgaXQgYWN0
dWFsbHkgZGlkIHJlamVjdCBtb2Rlcwo+ID4gbGlrZSBJIGV4cGVjdGVkIGR1cmluZyB0ZXN0aW5n
KSwgVmlsbGUgU3lyamFsYSBmcm9tIEludGVsIHBvaW50ZWQgb3V0Cj4gPiB0aGF0IHRoZSBsb2dp
YyBoZXJlIGlzbid0IGNvcnJlY3QuIG1heF9jbG9jayByZWZlcnMgdG8gdGhlIG1heCBzeW1ib2wK
PiA+IHJhdGUgc3VwcG9ydGVkIGJ5IHRoZSBlbmNvZGVyLCBzbyBsaW1pdGluZyBjbG9jayB0byBk
c19jbG9jayB1c2luZyBtYXgoKQo+ID4gZG9lc24ndCBtYWtlIHNlbnNlLiBBZGRpdGlvbmFsbHks
IHdlIHdhbnQgdG8gY2hlY2sgYWdhaW5zdCA2YnBjIGZvciB0aGUKPiA+IHRpbWUgYmVpbmcgc2lu
Y2UgdGhhdCdzIHRoZSBtaW5pbXVtIHBvc3NpYmxlIGJwYyBoZXJlLCBub3QgdGhlIHJlcG9ydGVk
Cj4gPiBicGMgZnJvbSB0aGUgY29ubmVjdG9yLiBTZWU6Cj4gPiAKPiA+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDIwLVNlcHRlbWJlci8yODAyNzYu
aHRtbAo+ID4gCj4gPiBGb3IgbW9yZSBpbmZvLgo+ID4gCj4gPiBTbywgbGV0J3MgcmV3cml0ZSB0
aGlzIHVzaW5nIFZpbGxlJ3MgYWR2aWNlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQ
YXVsIDxseXVkZUByZWRoYXQuY29tPgo+ID4gRml4ZXM6IDQwOWQzODEzOWI0MiAoImRybS9ub3V2
ZWF1L2ttcy9udjUwLTogVXNlIGRvd25zdHJlYW0gRFAgY2xvY2sKPiA+IGxpbWl0cyBmb3IgbW9k
ZSB2YWxpZGF0aW9uIikKPiA+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPgo+ID4gQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gPiBD
YzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcC5jIHwgMjMgKysrKysrKysrKysrKy0tLS0tLS0tLS0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RwLmMK
PiA+IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcC5jCj4gPiBpbmRleCA3YjY0
MGUwNWJkNGNkLi4yNGM4MWU0MjNkMzQ5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9kcC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2RwLmMKPiA+IEBAIC0yMzEsMjMgKzIzMSwyNiBAQCBudjUwX2RwX21vZGVfdmFsaWQo
c3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKPiA+ICAgICAgICAgICAgICAgICAgICBj
b25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwKPiA+ICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCAqb3V0X2Nsb2NrKQo+ID4gIHsKPiA+IC0gICAgICAgY29uc3QgdW5zaWduZWQg
bWluX2Nsb2NrID0gMjUwMDA7Cj4gPiAtICAgICAgIHVuc2lnbmVkIG1heF9jbG9jaywgZHNfY2xv
Y2ssIGNsb2NrOwo+ID4gKyAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQgbWluX2Nsb2NrID0gMjUw
MDA7Cj4gPiArICAgICAgIHVuc2lnbmVkIGludCBtYXhfY2xvY2ssIGRzX2Nsb2NrLCBjbG9jazsK
PiA+ICsgICAgICAgY29uc3QgdTggYnBwID0gMTg7IC8qIDYgYnBjICovCj4gPiAgICAgICAgIGVu
dW0gZHJtX21vZGVfc3RhdHVzIHJldDsKPiA+IAo+ID4gICAgICAgICBpZiAobW9kZS0+ZmxhZ3Mg
JiBEUk1fTU9ERV9GTEFHX0lOVEVSTEFDRSAmJiAhb3V0cC0KPiA+ID5jYXBzLmRwX2ludGVybGFj
ZSkKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gTU9ERV9OT19JTlRFUkxBQ0U7Cj4gPiAKPiA+
ICAgICAgICAgbWF4X2Nsb2NrID0gb3V0cC0+ZHAubGlua19uciAqIG91dHAtPmRwLmxpbmtfYnc7
Cj4gPiAtICAgICAgIGRzX2Nsb2NrID0gZHJtX2RwX2Rvd25zdHJlYW1fbWF4X2RvdGNsb2NrKG91
dHAtPmRwLmRwY2QsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIG91dHAtCj4gPiA+ZHAuZG93bnN0cmVhbV9wb3J0cyk7Cj4gPiAtICAgICAgIGlm
IChkc19jbG9jaykKPiA+IC0gICAgICAgICAgICAgICBtYXhfY2xvY2sgPSBtaW4obWF4X2Nsb2Nr
LCBkc19jbG9jayk7Cj4gPiAtCj4gPiAtICAgICAgIGNsb2NrID0gbW9kZS0+Y2xvY2sgKiAoY29u
bmVjdG9yLT5kaXNwbGF5X2luZm8uYnBjICogMykgLyAxMDsKPiA+IC0gICAgICAgcmV0ID0gbm91
dmVhdV9jb25uX21vZGVfY2xvY2tfdmFsaWQobW9kZSwgbWluX2Nsb2NrLCBtYXhfY2xvY2ssCj4g
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZjbG9jayk7Cj4g
PiArICAgICAgIGNsb2NrID0gbW9kZS0+Y2xvY2sgKiBicHAgLyA4Owo+ID4gKyAgICAgICBpZiAo
Y2xvY2sgPiBtYXhfY2xvY2spCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIE1PREVfQ0xPQ0tf
SElHSDsKPiA+ICsKPiA+ICsgICAgICAgZHNfY2xvY2sgPSBkcm1fZHBfZG93bnN0cmVhbV9tYXhf
ZG90Y2xvY2sob3V0cC0+ZHAuZHBjZCwgb3V0cC0KPiA+ID5kcC5kb3duc3RyZWFtX3BvcnRzKTsK
PiA+ICsgICAgICAgaWYgKGRzX2Nsb2NrICYmIG1vZGUtPmNsb2NrID4gZHNfY2xvY2spCj4gPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIE1PREVfQ0xPQ0tfSElHSDsKPiA+ICsKPiA+ICsgICAgICAg
cmV0ID0gbm91dmVhdV9jb25uX21vZGVfY2xvY2tfdmFsaWQobW9kZSwgbWluX2Nsb2NrLCBtYXhf
Y2xvY2ssCj4gPiAmY2xvY2spOwo+ID4gICAgICAgICBpZiAob3V0X2Nsb2NrKQo+ID4gICAgICAg
ICAgICAgICAgICpvdXRfY2xvY2sgPSBjbG9jazsKPiA+ICsKPiA+ICAgICAgICAgcmV0dXJuIHJl
dDsKPiA+ICB9Cj4gPiAtLQo+ID4gMi4yNi4yCj4gPiAKPiA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAotLSAKQ2hlZXJzLAoJTHl1ZGUg
UGF1bCAoc2hlL2hlcikKCVNvZnR3YXJlIEVuZ2luZWVyIGF0IFJlZCBIYXQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
