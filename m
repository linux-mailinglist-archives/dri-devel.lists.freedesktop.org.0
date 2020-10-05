Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58291283E2C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 20:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B29899E9;
	Mon,  5 Oct 2020 18:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F215899A5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 18:20:34 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id w141so9644768oia.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 11:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kZPEXkmRFhKPxE4UsJ1anlhQ3+0vTVsGBvgPlUPbE7w=;
 b=digCacwGUHn+oARFLUlEEiRTDoPXLO1xnxIuBum/VKhKQK7BCTulEUnSODFeCvDgqR
 ONx+Ygs1zeRud/eBv0KktRHkZij8UcSubxt6fRsWSbSb5URyynq9bUJ9Z1mPNuVzys6O
 B7+ktxEVlNZMJZvzGUecbDLxWpbn9fJMLuzr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kZPEXkmRFhKPxE4UsJ1anlhQ3+0vTVsGBvgPlUPbE7w=;
 b=XcS1aIEYKgnAzo5rtYDTAKnbBAz6xpHOUcqY369vneR3DEsfGGhd9Q1WO+3sapARHu
 igQZC4/k5ghVDXT+hr3ksxWaB0OXqbqz2nOei/DL2RmQgBAOVTZ2JmvdrDtiOdhzJFlx
 KkIacEIor692haJtuZ5J9ifPEAAbLsePJhKPqCP+R006e7QH8qaE2OuHv6+UUs+dNfCC
 0Bg+uQat64Caha/xmAjIinehQdOmggPgr3qwGKdGmp+fTajdeyBm38eUWTBvsl7gwqMq
 QKd2MpVT/7rBNUdlshgm4OjxI5RgndTdv6PIn1jXujJpoN0NLO2SPyIfmQP2vx/300zz
 t16w==
X-Gm-Message-State: AOAM531/MDBjRwuNHiyt1hDwQhN4tiRuFVO4BfAThklaQCW2Qtv0CQin
 Ee3/Lq/Y5HxweLkZl3rWM8HySC/lHa8ReOMgRkbrRQ==
X-Google-Smtp-Source: ABdhPJyJa7U8SQQEss3scNAd++32yQJ9inG+jtPNdgXpwnwGtNsOIHLVfEr4vMOsbMx/1Epql3rutItK4vq4Q/a+KbE=
X-Received: by 2002:aca:6083:: with SMTP id u125mr418733oib.14.1601922033920; 
 Mon, 05 Oct 2020 11:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <CAOeoa-d4-KyuVjwPCBcau6yp6sxeeHN4K0cQzZ=H+OQVgHsLFw@mail.gmail.com>
In-Reply-To: <CAOeoa-d4-KyuVjwPCBcau6yp6sxeeHN4K0cQzZ=H+OQVgHsLFw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 5 Oct 2020 20:20:22 +0200
Message-ID: <CAKMK7uHeZptOKWKTanBB_c2ek2emNjs9fFCbTwgafS19rL1sww@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 00/14] drm/msm: de-struct_mutex-ification
To: =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Jonathan Marek <jonathan@marek.ca>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Sam Ravnborg <sam@ravnborg.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgNSwgMjAyMCBhdCA2OjI0IFBNIEtyaXN0aWFuIEjDuGdzYmVyZyA8aG9lZ3Ni
ZXJnQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBTdW4sIE9jdCA0LCAyMDIwIGF0IDk6MjEgUE0g
Um9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBSb2Ig
Q2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gPgo+ID4gVGhpcyBkb2Vzbid0IHJlbW92
ZSAqYWxsKiB0aGUgc3RydWN0X211dGV4LCBidXQgaXQgY292ZXJzIHRoZSB3b3JzdAo+ID4gb2Yg
aXQsIGllLiBzaHJpbmtlci9tYWR2aXNlL2ZyZWUvcmV0aXJlLiAgVGhlIHN1Ym1pdCBwYXRoIHN0
aWxsIHVzZXMKPiA+IHN0cnVjdF9tdXRleCwgYnV0IGl0IHN0aWxsIG5lZWRzICpzb21ldGhpbmcq
IHNlcmlhbGl6ZSBhIHBvcnRpb24gb2YKPiA+IHRoZSBzdWJtaXQgcGF0aCwgYW5kIGxvY2tfc3Rh
dCBtb3N0bHkganVzdCBzaG93cyB0aGUgbG9jayBjb250ZW50aW9uCj4gPiB0aGVyZSBiZWluZyB3
aXRoIG90aGVyIHN1Ym1pdHMuICBBbmQgdGhlcmUgYXJlIGEgZmV3IG90aGVyIGJpdHMgb2YKPiA+
IHN0cnVjdF9tdXRleCB1c2FnZSBpbiBsZXNzIGNyaXRpY2FsIHBhdGhzIChkZWJ1Z2ZzLCBldGMp
LiAgQnV0IHRoaXMKPiA+IHNlZW1zIGxpa2UgYSByZWFzb25hYmxlIHN0ZXAgaW4gdGhlIHJpZ2h0
IGRpcmVjdGlvbi4KPgo+IFdoYXQgYSBncmVhdCBwYXRjaCBzZXQuIERhbmllbCBoYXMgc29tZSBn
b29kIHBvaW50cyBhbmQgbm90aGluZyB0aGF0Cj4gcmVxdWlyZXMgYmlnIGNoYW5nZXMsIGJ1dCBv
biB0aGUgb3RoZXIgaGFuZCwgSSdtIG5vdCBzdXJlIGl0J3MKPiBzb21ldGhpbmcgdGhhdCBuZWVk
cyB0byBibG9jayB0aGlzIHNldCBlaXRoZXIuCgpQZXJzb25hbGx5IEknZCB0aHJvdyB0aGUgbG9j
a2RlcCBwcmltaW5nIG9uIHRvcCB0byBtYWtlIHN1cmUgdGhpcwpzdGF5cyBjb3JyZWN0IChpdCdz
IDMgbGluZXMpLCBidXQgeWVzIGltbyB0aGlzIGlzIGFsbCBnb29kIHRvIGdvLiBKdXN0CmZpZ3Vy
ZWQgSSdsbCBzcHJpbmtsZSB0aGUgbGF0ZXN0IGluIHRlcm1zIG9mIGdlbSBsb2NraW5nIG92ZXIg
dGhlCnNlcmllcyB3aGlsZSBpdCdzIGhlcmUgOi0pCi1EYW5pZWwKCj4gRWl0aGVyIHdheSwgZm9y
IHRoZSBzZXJpZXMKPgo+IFJldmlld2VkLWJ5OiBLcmlzdGlhbiBILiBLcmlzdGVuc2VuIDxob2Vn
c2JlcmdAZ29vZ2xlLmNvbT4KPgo+ID4gUm9iIENsYXJrICgxNCk6Cj4gPiAgIGRybS9tc206IFVz
ZSBjb3JyZWN0IGRybV9nZW1fb2JqZWN0X3B1dCgpIGluIGZhaWwgY2FzZQo+ID4gICBkcm0vbXNt
OiBEcm9wIGNoYXR0eSB0cmFjZQo+ID4gICBkcm0vbXNtOiBNb3ZlIHVwZGF0ZV9mZW5jZXMoKQo+
ID4gICBkcm0vbXNtOiBBZGQgcHJpdi0+bW1fbG9jayB0byBwcm90ZWN0IGFjdGl2ZS9pbmFjdGl2
ZSBsaXN0cwo+ID4gICBkcm0vbXNtOiBEb2N1bWVudCBhbmQgcmVuYW1lIHByZWVtcHRfbG9jawo+
ID4gICBkcm0vbXNtOiBQcm90ZWN0IHJpbmctPnN1Ym1pdHMgd2l0aCBpdCdzIG93biBsb2NrCj4g
PiAgIGRybS9tc206IFJlZmNvdW50IHN1Ym1pdHMKPiA+ICAgZHJtL21zbTogUmVtb3ZlIG9iai0+
Z3B1Cj4gPiAgIGRybS9tc206IERyb3Agc3RydWN0X211dGV4IGZyb20gdGhlIHJldGlyZSBwYXRo
Cj4gPiAgIGRybS9tc206IERyb3Agc3RydWN0X211dGV4IGluIGZyZWVfb2JqZWN0KCkgcGF0aAo+
ID4gICBkcm0vbXNtOiByZW1vdmUgbXNtX2dlbV9mcmVlX3dvcmsKPiA+ICAgZHJtL21zbTogZHJv
cCBzdHJ1Y3RfbXV0ZXggaW4gbWFkdmlzZSBwYXRoCj4gPiAgIGRybS9tc206IERyb3Agc3RydWN0
X211dGV4IGluIHNocmlua2VyIHBhdGgKPiA+ICAgZHJtL21zbTogRG9uJ3QgaW1wbGljaXQtc3lu
YyBpZiBvbmx5IGEgc2luZ2xlIHJpbmcKPiA+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9hZHJl
bm8vYTV4eF9ncHUuYyAgICAgfCAgNCArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5v
L2E1eHhfcHJlZW1wdC5jIHwgMTIgKy0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8v
YTZ4eF9ncHUuYyAgICAgfCAgNCArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2RlYnVn
ZnMuYyAgICAgICAgIHwgIDcgKysKPiA+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYyAg
ICAgICAgICAgICB8IDE1ICstLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuaCAg
ICAgICAgICAgICB8IDE5ICsrKy0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMg
ICAgICAgICAgICAgfCA3NiArKysrKystLS0tLS0tLS0tLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
bXNtL21zbV9nZW0uaCAgICAgICAgICAgICB8IDUzICsrKysrKysrKy0tLS0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0vbXNtL21zbV9nZW1fc2hyaW5rZXIuYyAgICB8IDU4ICsrLS0tLS0tLS0tLS0tCj4g
PiAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3N1Ym1pdC5jICAgICAgfCAxNyArKy0tCj4g
PiAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMgICAgICAgICAgICAgfCA5NiArKysrKysr
KysrKysrKy0tLS0tLS0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dwdS5oICAgICAg
ICAgICAgIHwgIDUgKy0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9yaW5nYnVmZmVyLmMg
ICAgICB8ICAzICstCj4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fcmluZ2J1ZmZlci5oICAg
ICAgfCAxMyArKy0KPiA+ICAxNCBmaWxlcyBjaGFuZ2VkLCAxODggaW5zZXJ0aW9ucygrKSwgMTk0
IGRlbGV0aW9ucygtKQo+ID4KPiA+IC0tCj4gPiAyLjI2LjIKPiA+Cj4gPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gRnJlZWRyZW5vIG1haWxpbmcg
bGlzdAo+ID4gRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCgoKLS0gCkRhbmllbCBW
ZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZm
d2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
