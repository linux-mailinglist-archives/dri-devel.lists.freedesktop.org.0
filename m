Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF8DCFD11
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 17:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1EF6E825;
	Tue,  8 Oct 2019 15:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF756E825
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 15:03:36 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id x3so15071047oig.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 08:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OaOFshWGNlXt838UMDUv2X87Ta/vggPZXJmoZQRc8OU=;
 b=I5GM9Z+m7buqiPo1QwZgI1q5TerT015yd8HALFfmRoVTc9NPs5bjUFUmNv5C8OQZXF
 HLr6ELHjnuTrHwpi915q/QBXOzUEb1DHOpYbLG/ujt5O/ju9DEBtQZP6xFza/hl4eZSF
 R1PQfMi1cS2VkCEavJCxZ61ZwhWdydtNU3J8XqoiHDl/1IU+J/QHUEKLvzf+dNUKRBIF
 4ohcbIY/YAzrAQWFqGdDLYPnd/1SVLP8yZky4q7pbV7CtCl+9V8dM3N9xxFDbBS8Ig4l
 GtwMhRHzP6Qtu78qEL5gv7vi9RGChHKqTjkhSvNzacMX45Asm94lYcvjmHAlJJwMs/Fd
 OPEg==
X-Gm-Message-State: APjAAAXLRTnDDhFNRTjlGG04oV9thB95jN39OLD8JUW8uI2UpGAF2c9x
 fqTOxdMPi1H8XRLpi5kZ+a4wVPwaSi/dczpLTNkncQ==
X-Google-Smtp-Source: APXvYqw0Uw+GHxmrA/nV7xRq5fxea/nnabDY6Ny2JJtVdkWiG+lHNl/9x8w4UqgH3vQTKh9p6s/M2DxvXLb8kQOHSQY=
X-Received: by 2002:aca:eac5:: with SMTP id i188mr4412103oih.110.1570547015880; 
 Tue, 08 Oct 2019 08:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <3FTYuSJGBfAG_MnVn604lEDUu1q2h6tI--IJOCx5Yp1SRwQig7s2AfLuleVvOS9WN1lLqAlXCWJu_Z60u3BnZfqCgFHDd_nPOUCAipaNpLk=@emersion.fr>
 <20190929061549.GA28809@jamwan02-TSP300>
 <3q-AW_DkhdIpH9Ip7_2kdcVNHwdKnhIH4k2PjfN-80KlJ0Qe3jIVH6CxMSQc-niJGdLyzzKsUcXjUyu1z9fTjHwg5-eWvOWbhnblUurueKo=@emersion.fr>
 <20190930100707.178723d1@eldfell.localdomain>
 <20191008095904.GL16989@phenom.ffwll.local>
 <20191008143936.6f49b098@eldfell.localdomain>
In-Reply-To: <20191008143936.6f49b098@eldfell.localdomain>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 8 Oct 2019 17:03:24 +0200
Message-ID: <CAKMK7uG49xQ75MovfKHksq1WLiXj3SHYSjFHAUqg3SDPmrxvvA@mail.gmail.com>
Subject: Re: [v4] drm: two planes with the same zpos have undefined ordering
To: Pekka Paalanen <ppaalanen@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OaOFshWGNlXt838UMDUv2X87Ta/vggPZXJmoZQRc8OU=;
 b=UfVUDuSCXGzcA71A9rWE0Egsm58tI1wAkygqa34ayycBOz1bc+FPQY4WbXvOMFLmtE
 3b3nP/mvPfFk57eLsvvbRD3NXDHKdl9VNh1uLBUwQB0bzXr+ii/ysqvqW93L4PWsdZ6A
 s/B8w476KwPiAGwayNhb1tIFWOwg0ThFTo2Vs=
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
Cc: Simon Ser <contact@emersion.fr>, nd <nd@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Marius Vlad <marius.vlad@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgOCwgMjAxOSBhdCAxOjM5IFBNIFBla2thIFBhYWxhbmVuIDxwcGFhbGFuZW5A
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgOCBPY3QgMjAxOSAxMTo1OTowNCArMDIwMAo+
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4KPiA+IE9uIE1vbiwgU2Vw
IDMwLCAyMDE5IGF0IDEwOjA3OjA3QU0gKzAzMDAsIFBla2thIFBhYWxhbmVuIHdyb3RlOgo+ID4g
PiBPbiBTdW4sIDI5IFNlcCAyMDE5IDIwOjMwOjQ0ICswMDAwCj4gPiA+IFNpbW9uIFNlciA8Y29u
dGFjdEBlbWVyc2lvbi5mcj4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gSGksCj4gPiA+ID4KPiA+ID4g
PiA+IE9uIE1vbiwgU2VwIDIzLCAyMDE5IGF0IDEyOjM5OjIwUE0gKzAwMDAsIFNpbW9uIFNlciB3
cm90ZToKPiA+ID4gPiA+ID4gQ3VycmVudGx5IHRoZSBwcm9wZXJ0eSBkb2NzIGRvbid0IHNwZWNp
Znkgd2hldGhlciBpdCdzIG9rYXkgZm9yIHR3byBwbGFuZXMgdG8KPiA+ID4gPiA+ID4gaGF2ZSB0
aGUgc2FtZSB6cG9zIHZhbHVlIGFuZCB3aGF0IHVzZXItc3BhY2Ugc2hvdWxkIGV4cGVjdCBpbiB0
aGlzIGNhc2UuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoZSBydWxlIG1lbnRpb25uZWQgaW4g
dGhlIHBhc3Qgd2FzIHRvIGRpc2FtYmlndWF0ZSB3aXRoIG9iamVjdCBJRHMuIEhvd2V2ZXIKPiA+
ID4gPiA+ID4gc29tZSBkcml2ZXJzIGJyZWFrIHRoaXMgcnVsZSAodGhhdCdzIHdoeSB0aGUgb3Jk
ZXJpbmcgaXMgZG9jdW1lbnRlZCBhcwo+ID4gPiA+ID4gPiB1bnNwZWNpZmllZCBpbiBjYXNlIHRo
ZSB6cG9zIHByb3BlcnR5IGlzIG1pc3NpbmcpLiBBZGRpdGlvbmFsbHkgaXQgZG9lc24ndAo+ID4g
PiA+ID4gPiByZWFsbHkgbWFrZSBzZW5zZSBmb3IgYSBkcml2ZXIgdG8gdXNlciBpZGVudGljYWwg
enBvcyB2YWx1ZXMgaWYgaXQga25vd3MgdGhlaXIKPiA+ID4gPiA+ID4gcmVsYXRpdmUgcG9zaXRp
b246IHRoZSBkcml2ZXIgY2FuIGp1c3QgcGljayBkaWZmZXJlbnQgdmFsdWVzIGluc3RlYWQuCj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFNvIHR3byBzb2x1dGlvbnMgd291bGQgbWFrZSBzZW5zZTog
ZWl0aGVyIGRpc2FsbG93IGNvbXBsZXRlbHkgaWRlbnRpY2FsIHpwb3MKPiA+ID4gPiA+ID4gdmFs
dWVzIGZvciB0d28gZGlmZmVyZW50IHBsYW5lcywgZWl0aGVyIG1ha2UgdGhlIG9yZGVyaW5nIHVu
c3BlY2lmaWVkLiBUbyBhbGxvdwo+ID4gPiA+ID4gPiBkcml2ZXJzIHRoYXQgZG9uJ3Qga25vdyB0
aGUgcmVsYXRpdmUgb3JkZXJpbmcgYmV0d2VlbiB0d28gcGxhbmVzIHRvIHN0aWxsCj4gPiA+ID4g
PiA+IGV4cG9zZSB0aGUgenBvcyBwcm9wZXJ0eSwgY2hvb3NlIHRoZSBsYXR0ZXIgc29sdXRpb24u
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gU29tZSBBcm0ncyB1c2FnZSBjYXNlcyBhYm91dCB0d28gcGxh
bmVzIHdpdGggc2FtZSB6cG9zLgo+ID4gPiA+ID4KPiA+ID4gPiA+IC0gIlNtYXJ0IGxheWVyIgo+
ID4gPiA+ID4gd2hpY2ggY2FuIGFjY2VwdHMgNCBkaWZmZXJlbnQgZmJzIHdpdGggZGlmZmVyZW50
IHNyYy9kaXNwbGF5IHJlY3QsCj4gPiA+ID4gPiBidXQgdGhpcyBzbWFydCBsYXllciBoYXMgb25l
IHJlc3RyaWN0aW9uOgo+ID4gPiA+ID4KPiA+ID4gPiA+IDQgZGlzcGxheSByZWN0cyBtdXN0IGhh
dmUgbm8gb3ZlcmxhcHMgaW4gViBkaXJlY3Rpb24KPiA+ID4gPiA+IChBIG9wdGltaXphdGlvbiBm
b3IgYW5kcm9pZCB3aW5kb3cgbGlrZSBUb29sYmFyL05hdmlnYXRpb24gYmFyKQo+ID4gPiA+ID4K
PiA+ID4gPiA+IFNvIHdoZW4gbWFwIHRoaXMgU21hcnQtbGF5ZXIgdG8gZHJtIHdvcmxkLCBpdCBt
aWdodCBiZSA0IGRpZmZlcmVudAo+ID4gPiA+ID4gZHJtLXBsYW5lcywgYnV0IHdpdGggc2FtZSB6
b3JkZXIgdG8gaW5kaWNhdGUgdGhhdCB0aGVzZSA0IHBsYW5lcyBhcmUKPiA+ID4gPiA+IHNtYXJ0
LWxheWUgcGxhbmVzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IC0gIlZSLUxheWVyIgo+ID4gPiA+ID4g
T25lIFZSLWxheWVyIGNvbXByaXNlcyB0d28gZGlmZmVyZW50IHZpZXdwb3J0cyB3aGljaCBjYW4g
YmUgY29uZmlndXJlZAo+ID4gPiA+ID4gd2l0aCB0b3RvYWxseSBkaWZmZXJlbnQgZmJzLCBzcmMv
ZGlzcGxheSByZWN0Lgo+ID4gPiA+ID4gd2UgdXNlIHR3byBkaWZmZXJlcm50IGRybS1wbGFuZXMg
dG8gZHJpdmUgb24gSFcgIlZSLUxheWVyIiwgYW5kIHRoZXNlCj4gPiA+ID4gPiB0d28gZHJtLXBs
YW5lcyBtdXN0IGJlIGNvbmZpZ3VyZWQgd2l0aCBzYW1lIHpwb3MuCj4gPiA+ID4KPiA+ID4gPiBU
aGFua3MgYSBsb3QgZm9yIHlvdXIgZmVlZGJhY2sgSmFtZXMsIHRoYXQncyBleGFjdGx5IHdoYXQg
SSB3YXMgbG9va2luZyBmb3IuCj4gPiA+ID4gQm90aCBvZiB0aGVzZSB1c2UtY2FzZXMgbWFrZSBz
ZW5zZSB0byBtZS4KPiA+ID4gPgo+ID4gPiA+IEkgdGhpbmsgdXNlci1zcGFjZSBzaG91bGQgYmUg
cHJlcGFyZWQgdG8gaGFuZGxlIGlkZW50aWNhbCBpbW11dGFibGUgenBvcyB2YWx1ZXMuCj4gPiA+
ID4gUGVra2EgYW5kIERhbmllbCwgdGhvdWdodHM/Cj4gPiA+Cj4gPiA+IEhpLAo+ID4gPgo+ID4g
PiBnaXZlbiB0aG9zZSBleHBsYWluZWQgdXNlIGNhc2VzLCBzdXJlLCBJIGFncmVlLgo+ID4gPgo+
ID4gPiA+IEluIGFueSBjYXNlLCB0aGlzIGRvZXNuJ3QgY2hhbmdlIHRoZSBwYXRjaCBpdHNlbGYu
IFByb2JhYmx5IHNvbWV0aGluZyB3b3J0aAo+ID4gPiA+IG1lbnRpb25uaW5nIGluIHRoZSBjb21t
aXQgbWVzc2FnZS4KPiA+ID4KPiA+ID4gWWVzLCByZWNvcmRpbmcgdGhlc2UgdXNlIGNhc2VzIHdv
dWxkIGJlIHZlcnkgbmljZS4KPiA+Cj4gPiBUaGVyZSdzIGEgbG90IG1vcmUgaHcgdGhhdCBkb2Vz
IHRoZSBzYW1lIHRyaWNrcyAocXVhbGNvbSBpcyBvbmUgZm9yIHN1cmUpLgo+ID4gSW1vIGJlZm9y
ZSB3ZSBlbmNvZGUgdGhpcyB3ZSBzaG91bGQgbWFrZSBzdXJlIHRoYXQ6Cj4gPiBhKSBldmVyeW9u
ZSBpcyBoYXBweSB3aXRoIHRoaXMgbmV3IHVhcGkKPgo+IFNvcnJ5LCB3aGF0IG5ldyBVQVBJPwo+
Cj4gV2UncmUganVzdCB0cnlpbmcgdG8gbWFrZSB0aGUgZG9jdW1lbnRhdGlvbiBtYXRjaCB3aGF0
IGN1cnJlbnRseQo+IGhhcHBlbnMsIHJpZ2h0PwoKSXQncyBzbyBtdWNoIG5ldyB1YXBpIHRoYXQg
SSd2ZSBzZW50IG91dCBhIGZldyByZXZlcnRzIGZvciA1LjQgKGl0CmxhbmRlZCBpbiB0aGF0IG1l
cmdlIHdpbmRvdykgdG8gdW5kbyB0aGUgc3R1ZmYgdGhlIGFybSBkcml2ZXIgdGVhbSBoYXMKZG9u
ZSAoaXQgZGlkbid0IGNvbWUgd2l0aCB1c2Vyc3BhY2UsIHByb3BlciBkaXNjdXNzaW9uIG9uIGRy
aS1kZXZlbCwKZG9jcyBvciB0ZXN0Y2FzZXMgaW4gaWd0KS4gSSBhbHNvIGp1c3Qgc3BvdHRlZCB0
aGF0IGEgbGVmdG92ZXIgaXMgdGhhdAphcm0va29tZWRhIHN0aWxsIGNvbXB1dGVzIGl0cyBvd24g
dmVyc2lvbiBvZiBub3JtYWxpemVkX3pwb3MsIHdoaWNoCnByb2JhYmx5IHNob3VsZCBiZSBkaXRj
aGVkIHRvbyAoaXQncyBub3QgYWN0dWFsbHkgZGlmZmVyZW50IGZyb20gdGhlCm9uZSBpbiBoZWxw
ZXJzIHdpdGhvdXQgdGhlIHJldmVydGVkIHVhcGkpLgoKU28geWVhaCwgc2VwYXJhdGUgcGF0Y2gg
Oi0pCi1EYW5pZWwKLS0KRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
