Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E379FB1D2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 14:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459466E0D3;
	Wed, 13 Nov 2019 13:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFBA6E0D3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 13:54:15 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A301222D0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 13:54:15 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id z23so1716106qkj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 05:54:15 -0800 (PST)
X-Gm-Message-State: APjAAAVdg9mltYrULsKDHCSwLH/UM8RnP+ja521Bckp1qUw5fw+dbdyQ
 epLkZVeWvcbjpQ+KRsHdbQRTFtYz/Slfgqopag==
X-Google-Smtp-Source: APXvYqykI/4n6uRDrkq9RYhcHFM7mC+cKteaY8nBS8ujCglSvMckl9xDXZio++Cv4k3vvNqi2LirjrfzfrQlPIbrjsQ=
X-Received: by 2002:a37:30b:: with SMTP id 11mr2580491qkd.254.1573653254573;
 Wed, 13 Nov 2019 05:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20191024191859.31700-1-robh@kernel.org>
 <20191025073042.GL11828@phenom.ffwll.local>
 <20191108162759.GY23790@phenom.ffwll.local>
 <d2146f86-ddb8-242e-025f-d29a43682487@suse.de>
 <20191112093246.GD23790@phenom.ffwll.local>
 <06f1f400-2e20-5c40-c0ea-967f1ab2b787@suse.de>
 <20191112103819.vcuhtqpfzbkta6ml@sirius.home.kraxel.org>
 <20191112144435.GK23790@phenom.ffwll.local>
 <20191113073902.343vfunbjuzy725y@sirius.home.kraxel.org>
 <CAKMK7uF7G_H3ZvMpFkqKdGXc5H8P=vAtfoREksJJyysQmxOYzQ@mail.gmail.com>
In-Reply-To: <CAKMK7uF7G_H3ZvMpFkqKdGXc5H8P=vAtfoREksJJyysQmxOYzQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 13 Nov 2019 07:53:56 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJmi+SE2ZufyP8tpMNNB9eqTMTJFsY5RXh5eCw30yr6GA@mail.gmail.com>
Message-ID: <CAL_JsqJmi+SE2ZufyP8tpMNNB9eqTMTJFsY5RXh5eCw30yr6GA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573653255;
 bh=T+boaWePTfTcdgeUPyfdG/aIRLLel5KnGek+SI7HM5Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Fmky2n3eFZ9uljM46U39Vt2AINl8xA54VoiHhEfTCl384U39JGFEWBJg1sYqg+Jb6
 JJn++Nrl/Ave51wNbMsvGc2OLg6og/fxEQ3PfkLl7gmFhqUc1wY/F0YqBZ3UrJFFGp
 CI431C/lfcNSn8iWzsNlDxmRDD9+TTe6A7NHgQaI=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMjoxOCBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgODozOSBBTSBHZXJkIEhv
ZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gICBIaSwKPiA+Cj4gPiA+
ID4gPiA+PiBWUkFNIGhlbHBlcnMgdXNlIGRybV9nZW1fdHRtX21tYXAoKSwgd2hpY2ggd3JhcHMg
dHRtX2JvX21tYXBfb2JqKCkuCj4gPiA+ID4gPiA+PiBUaGVzZSBjaGFuZ2VzIHNob3VsZCBiZSB0
cmFuc3BhcmVudC4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhlcmUncyBzdGlsbCB0aGUgaXNz
dWUgdGhhdCBmb3IgZG1hLWJ1ZiBtbWFwIHZzIGRybSBtbWFwIHlvdSB1c2UKPiA+ID4gPiA+ID4g
ZGlmZmVyZW50IGZfbWFwcGluZywgd2hpY2ggbWVhbnMgdHRtJ3MgcHRlIHNob290ZG93biB3b24n
dCB3b3JrIGNvcnJlY3RseQo+ID4gPiA+ID4gPiBmb3IgZG1hLWJ1ZiBtbWFwcy4gQnV0IHllYWgg
bm9ybWFsIG9wZXJhdGlvbiBmb3IgdHRtL3ZyYW0gaGVscGVycyBzaG91bGQKPiA+ID4gPiA+ID4g
YmUgZmluZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBWUkFNIGhlbHBlcnMgZG9uJ3Qgc3VwcG9ydCBk
bWFidWZzLgo+ID4gPiA+Cj4gPiA+ID4gSXQncyBub3QgdGhhdCBzaW1wbGUuICBFdmVuIHdoZW4g
bm90IHN1cHBvcnRpbmcgZG1hLWJ1ZiBleHBvcnQgYW5kCj4gPiA+ID4gaW1wb3J0IGl0IGlzIHN0
aWxsIHBvc3NpYmxlIHRvIGNyZWF0ZSBkbWEtYnVmcywgaW1wb3J0IHRoZW0gaW50byB0aGUKPiA+
ID4gPiBzYW1lIGRyaXZlciAod2hpY2ggZG9lc24ndCBhY3R1YWxseSBleHBvcnQraW1wb3J0IGJ1
dCBqdXN0IGdyYWJzIGEgZ2VtCj4gPiA+ID4gb2JqZWN0IHJlZmVyZW5jZSBpbnN0ZWFkKSBhbmQg
YWxzbyB0byBtbWFwIHRoZW0gdmlhIHByaW1lL2RtYS1idWYgY29kZQo+ID4gPiA+IHBhdGggLi4u
Cj4gPgo+ID4gLi4uIGJ1dCBhZnRlciBsb29raW5nIGFnYWluIEkgdGhpbmsgd2UgYXJlIGFsbCBn
cmVlbiBoZXJlLiAgR2l2ZW4gdGhhdAo+ID4gb25seSBzZWxmLWltcG9ydCB3b3JrcyB3ZSdsbCBv
bmx5IHNlZSB2cmFtIGdlbSBvYmplY3RzIGluIHRoZSBtbWFwIGNvZGUKPiA+IHBhdGgsIHdoaWNo
IHNob3VsZCBoYXZlIGV2ZXJ5dGhpbmcgc2V0IHVwIGNvcnJlY3RseS4gIFNhbWUgZ29lcyBmb3Ig
cXhsLgo+ID4KPiA+IEFsbCBvdGhlciB0dG0gZHJpdmVycyBzdGlsbCB1c2UgdGhlIG9sZCBtbWFw
IGNvZGUgcGF0aCwgc28gYWxsIGdyZWVuCj4gPiB0aGVyZSB0b28gSSB0aGluay4gIEFsc28gSSBz
b21laG93IGRvdWJ0IGRtYS1idWYgbW1hcCB2cy4gZHJtIG1tYXAgZW5kcwo+ID4gdXAgdXNpbmcg
ZGlmZmVyZW50IGZfbWFwcGluZywgdHRtIGNvZGUgaGFzIGEgV0FSTl9PTiBpbiB0dG1fYm9fdm1f
b3BlbigpCj4gPiB3aGljaCB3b3VsZCBmaXJlIHNob3VsZCB0aGF0IGJlIHRoZSBjYXNlLgo+ID4K
PiA+IERvIGltcG9ydGVkIGRtYS1idWZzIGhpdCB0aGUgZHJtIG1tYXAgY29kZSBwYXRoIGluIHRo
ZSBmaXJzdCBwbGFjZT8KPiA+IFdvdWxkbid0IG1tYXAgYmUgaGFuZGxlZCBieSB0aGUgZXhwb3J0
aW5nIGRyaXZlcj8KPgo+IGRybV9nZW1fZG1hYnVmX21tYXAgLT4gb2JqLT5mdW5jcy0+bW1hcCAt
PiB0dG1fYm9fbW1hcF9vYmoKPgo+IEFuZCBJJ20gbm90IHNlZWluZyBhbnlvbmUgYWRqdXN0aW5n
IHZtX2ZpbGUtPmZfbWFwcGluZyBhbnl3aGVyZSBoZXJlIGF0IGFsbC4KPgo+IE5vdGUgdG8gaGl0
IHRoaXMgeW91IG5lZWQgdXNlcnNwYWNlIHRvCj4gLSBoYW5kbGUyZmQgb24gYSBidWZmZXIgdG8g
Y3JlYXRlIGEgZG1hLWJ1ZiBmZAo+IC0gY2FsbCBtbWFwIGRpcmVjdGx5IG9uIHRoYXQgZG1hLWJ1
ZiBmZAoKVGhhdCB3YXMgZXhhY3RseSB0aGUgdmdlbSBJR1QgdGVzdCB0aGF0IHByb21wdGVkICRz
dWJqZWN0IGZpeC4gKFdpdGgKdmdlbSBtb2RpZmllZCB0byB1c2Ugc2htZW0gaGVscGVycykKClJv
YgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
