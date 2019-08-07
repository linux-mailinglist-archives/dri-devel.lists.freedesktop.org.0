Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F53185657
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 01:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1DB6E775;
	Wed,  7 Aug 2019 23:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C4E6E775
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 23:09:50 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id a15so90140666qtn.7
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 16:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=UET7SY8fA8PxxfxiGjhHIWC769osh0HwkIUA8kcq50A=;
 b=IXDnoSRCjIzI2xz2KTyFWTymmv1DQr+kHiBncjrgqOIlZjgKkJNnq6IgFaFKmUtRvz
 hiL0ISrXRJOaar3csqoM0GUnoH4tw87SZA6eZ0ve0l/kaNcPxpaJSwxmJj4AsYW35sxo
 SPTKs4HBvizAOy2kW7YLhUvU43AqF524vZacyLp7tEXfkDah9+Iay/bonriw3KdLBWTj
 OtxjM8y/SO/+OD7E1ynVTqNQFnEQ4MEJW8Xwsj+IA2ddaNbyWp8qBHUxuR814M6aQqz2
 T2rcWPjK0ws9jnUXqe9JSKH2+eGRKvZlpUT9XZXWEUqPUZXzWkhN7JwitxGVpfLDvjZk
 Kolg==
X-Gm-Message-State: APjAAAUH84q08eCl0zueQT0i6QoUT1mKNTdZ9eSRSzMRCMxdk+uI80mr
 K80K0LLUb/Q8nRDQLewwrFMOTA==
X-Google-Smtp-Source: APXvYqyPb2sxJrEPwD0S5bbm/JsGXpzEjIDHe5rBlBUk8ad3O/wvpazANeOwyUwov8yRaZ2XTtoH8A==
X-Received: by 2002:ac8:1750:: with SMTP id u16mr10024185qtk.90.1565219389278; 
 Wed, 07 Aug 2019 16:09:49 -0700 (PDT)
Received: from whitewolf.lyude.net
 (static-173-76-190-23.bstnma.ftas.verizon.net. [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id z19sm41926894qkg.28.2019.08.07.16.09.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 16:09:48 -0700 (PDT)
Message-ID: <2a454d971a6c2bc3da730333aacaa420ecddefd6.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau/dispnv04: Grab/put runtime PM refs on
 DPMS on/off
From: Lyude Paul <lyude@redhat.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>, nouveau
 <nouveau@lists.freedesktop.org>,  Ben Skeggs <bskeggs@redhat.com>, David
 Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Date: Wed, 07 Aug 2019 19:09:47 -0400
In-Reply-To: <CAKb7UviCg7jeEyWqsHxygfPuqTg4ybFgTH8cRdx2O==tTEUD9Q@mail.gmail.com>
References: <20190807213304.9255-1-lyude@redhat.com>
 <20190807213304.9255-2-lyude@redhat.com>
 <20190807215508.GK7444@phenom.ffwll.local>
 <CAKb7UviCg7jeEyWqsHxygfPuqTg4ybFgTH8cRdx2O==tTEUD9Q@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
Reply-To: lyude@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA4LTA3IGF0IDE5OjA2IC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiBP
biBXZWQsIEF1ZyA3LCAyMDE5IGF0IDU6NTUgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPiB3cm90ZToKPiA+IE9uIFdlZCwgQXVnIDA3LCAyMDE5IGF0IDA1OjMzOjAwUE0gLTA0MDAs
IEx5dWRlIFBhdWwgd3JvdGU6Cj4gPiA+IFRoZSBjb2RlIGNsYWltcyB0byBncmFiIGEgcnVudGlt
ZSBQTSByZWYgd2hlbiBhdCBsZWFzdCBvbmUgQ1JUQyBpcwo+ID4gPiBhY3RpdmUsIGJ1dCB0aGF0
J3Mgbm90IGFjdHVhbGx5IHRoZSBjYXNlIGFzIHdlIGdyYWIgYSBydW50aW1lIFBNIHJlZgo+ID4g
PiB3aGVuZXZlciBhIENSVEMgaXMgZW5hYmxlZCByZWdhcmRsZXNzIG9mIGl0J3MgRFBNUyBzdGF0
ZS4gTWVhbmluZyB0aGF0Cj4gPiA+IHdlIGNhbiBlbmQgdXAga2VlcGluZyB0aGUgR1BVIGF3YWtl
IHdoZW4gdGhlcmUgYXJlIG5vIHNjcmVlbnMgZW5hYmxlZCwKPiA+ID4gc29tZXRoaW5nIHdlIGRv
bid0IHJlYWxseSB3YW50IHRvIGRvLgo+ID4gPiAKPiA+ID4gTm90ZSB0aGF0IHdlIGZpeGVkIHRo
aXMgc2FtZSBpc3N1ZSBmb3IgbnY1MCBhIHdoaWxlIGFnbyBpbjoKPiA+ID4gCj4gPiA+IGNvbW1p
dCBlNWQ1NGYxOTM1NzIgKCJkcm0vbm91dmVhdS9kcm0vbm91dmVhdTogRml4IHJ1bnRpbWUgUE0g
bGVhayBpbgo+ID4gPiBudjUwX2Rpc3BfYXRvbWljX2NvbW1pdCgpIikKPiA+ID4gCj4gPiA+IFNp
bmNlIHdlJ3JlIGFib3V0IHRvIHJlbW92ZSBub3V2ZWF1X2RybS0+aGF2ZV9kaXNwX3Bvd2VyX3Jl
ZiBpbiB0aGUgbmV4dAo+ID4gPiBjb21taXQsIGxldCdzIGFsc28gc2ltcGxpZnkgdGhlIFJQTSBj
b2RlIGhlcmUgd2hpbGUgd2UncmUgYXQgaXQ6IGdyYWIgYQo+ID4gPiByZWYgZHVyaW5nIGEgbW9k
ZXNldCwgZ3JhYiBhZGRpdGlvbmFsIFJQTSByZWZzIGZvciBlYWNoIENSVEMgZW5hYmxlZCBieQo+
ID4gPiBzYWlkIG1vZGVzZXQsIGFuZCBkcm9wIGFuIFJQTSByZWYgZm9yIGVhY2ggQ1JUQyBkaXNh
YmxlZCBieSBzYWlkCj4gPiA+IG1vZGVzZXQuIFRoaXMgYWxsb3dzIHVzIHRvIGtlZXAgdGhlIEdQ
VSBhd2FrZSB3aGVuZXZlciBzY3JlZW5zIGFyZQo+ID4gPiB0dXJuZWQgb24sIHdpdGhvdXQgbmVl
ZGluZyB0byB1c2Ugbm91dmVhdV9kcm0tPmhhdmVfZGlzcF9wb3dlcl9yZWYuCj4gPiA+IAo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+ID4gPiAtLS0K
PiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L2NydGMuYyB8IDE4ICsrKyst
LS0tLS0tLS0tLS0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTQg
ZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvZGlzcG52MDQvY3J0Yy5jCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlz
cG52MDQvY3J0Yy5jCj4gPiA+IGluZGV4IGYyMmYwMTAyMDYyNS4uMDhhZDhlM2I5Y2QyIDEwMDY0
NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC9jcnRjLmMKPiA+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvY3J0Yy5jCj4gPiA+IEBA
IC0xODMsNiArMTgzLDEwIEBAIG52X2NydGNfZHBtcyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGlu
dCBtb2RlKQo+ID4gPiAgICAgICAgICAgICAgIHJldHVybjsKPiA+ID4gCj4gPiA+ICAgICAgIG52
X2NydGMtPmxhc3RfZHBtcyA9IG1vZGU7Cj4gPiA+ICsgICAgIGlmIChtb2RlID09IERSTV9NT0RF
X0RQTVNfT04pCj4gPiA+ICsgICAgICAgICAgICAgcG1fcnVudGltZV9nZXRfbm9yZXN1bWUoZGV2
LT5kZXYpOwo+ID4gPiArICAgICBlbHNlCj4gPiA+ICsgICAgICAgICAgICAgcG1fcnVudGltZV9w
dXRfbm9pZGxlKGRldi0+ZGV2KTsKPiA+IAo+ID4gaXQncyBhZnRlciB3ZSBmaWx0ZXIgb3V0IGR1
cGxpY2F0ZSBvcGVyYXRpb25zLCBzbyB0aGF0IHBhcnQgbG9va3MgZ29vZC4KPiA+IEJ1dCBub3Qg
YWxsIG9mIG5vdXZlYXUncyBsZWdhY3kgaGVscGVyIGNydGMgY2FsbGJhY2tzIGdvIHRocm91aCAt
PmRwbXMgSQo+ID4gdGhpbms6IG52X2NydGNfZGlzYWJsZSBkb2Vzbid0LCBhbmQgY3J0YyBoZWxw
ZXJzIHVzZSB0aGF0IGluIHByZWZlcmVuY2UKPiA+IG92ZXIgLT5kcG1zIGluIHNvbWUgY2FzZXMu
Cj4gPiAKPiA+IEkgdGhpbmsgdGhlIG9ubHkgd2F5IHRvIGFjdHVhbGx5IGhpdCB0aGF0IHBhdGgg
aXMgaWYgeW91IHN3aXRjaCBhbiBhY3RpdmUKPiA+IGNvbm5lY3RvciBmcm9tIGFuIGFjdGl2ZSBD
UlRDIHRvIGFuIGluYWN0aXZlIG9uZS4gVGhpcyBpbXBsaWNpdGx5IGRpc2FibGVzCj4gPiB0aGUg
Y3J0YyAod2VsbCwgc2hvdWxkLCBudl9jcnRjX2Rpc2FibGUgZG9lc24ndCBzZWVtIHRvIHNodXQg
ZG93biBodyksIGFuZAo+ID4gSSB0aGluayB3b3VsZCBsZWFrIHlvdXIgcnVudGltZSBQTSByZWZl
cmVuY2UgaGVyZS4gQXQgbGVhc3QgdGVtcG9yYXJpbHkuCj4gPiAKPiA+IE5vIGlkZWEgaG93IHRv
IGJlc3QgZml4IHRoYXQuIEFzaWRlIGZyb20gInVzZSBhdG9taWMiIDotKQo+IAo+IE5vdCBzdXJl
IGlmIHRoaXMgaXMgcmVsZXZhbnQgdG8gdGhlIGRpc2N1c3Npb24gYXQgaGFuZCwgYnV0IEknZCBs
aWtlCj4gdG8gcG9pbnQgb3V0IHRoYXQgZGlzcG52MDQgaXMgZm9yIHByZS1udjUwIHRoaW5ncywg
d2hpY2ggZGVmaW5pdGVseQo+IGRpZG4ndCBzdXBwb3J0IGFueSBraW5kIG9mIEFDUEktYmFzZWQg
cnVudGltZSBzdXNwZW5kLgoKSSB0aG91Z2h0IGl0IHdhcyByZWFsbHkgc3VzcGljaW91cyB0aGF0
IHN1Y2ggYW4gb2xkIGNoaXBzZXQgaGFkIGFueSBraW5kIG9mCnJ1bnRpbWUgUE0sIGJ1dCBkaWRu
J3QgcXVlc3Rpb24gdGhlIGNvZGUgbG9sLiBJIGd1ZXNzIGEgbW9yZSBhcHByb3ByaWF0ZSBwYXRj
aAp3b3VsZCBiZSB0byBqdXN0IHJlbW92ZSBydW50aW1lIFBNIHN1cHBvcnQgZW50aXJlbHkgZm9y
IHByZS1udjUwLiBXaWxsIHJlc3Bpbgpzb29uIGFuZCBkbyB0aGlzLgoKPiAKPiAgIC1pbGlhCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
