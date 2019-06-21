Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7D84EC25
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 17:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB226E8E0;
	Fri, 21 Jun 2019 15:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B39A6E8AB
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 15:37:09 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k8so10688569eds.7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 08:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=bQTtb1YJReUCyDVinPAukt8becP3QomKmtAqB8GJ0Hk=;
 b=dgnXnjAy2+qgq/WLj+rqi6yoMK8QkTe2h4fxnuU7psuKBisURVjPFzGVLfbqN2xWXX
 RO8jBPptoeh/HuZkPK49/PU5PQzo3HrDBEoUNeOV4KZRR5qik22zKH/0C84C6nk6TvtD
 MoTY5XCs3x/jtZEG4H3fsAbKdWIe7KamjbHJOk041oFF1Zg4/x5jzF4zBY4duwgussAA
 Ln9FR56D+XJf+sdJM4mSBuUXkPKCL6tFU3ygo+AJUXh9zaaHp5ax1bcU/tjIKOqN7f2h
 QRkLcQ3on8fehlfclRxim90ztJ1JzQMAs4TEYx9IbEhPqXrA2lx57uEXv39Ev2RqKYkP
 4yqA==
X-Gm-Message-State: APjAAAXeWFO7brtNq76j9kpARhP+k5GBK8UJNBBguD0WQX4wue8MYb9N
 qdwaLALP/LSnOUAiJrQYYwDOCA==
X-Google-Smtp-Source: APXvYqzt3jvXScbJS3JjvUwJtQpcW6QGHm/AdnNN1Z2KBBmE9KuapNOH/E/ZhjnVobNqKDDQVchV+g==
X-Received: by 2002:a50:940b:: with SMTP id p11mr36781963eda.194.1561131427791; 
 Fri, 21 Jun 2019 08:37:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id h10sm930269ede.93.2019.06.21.08.37.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 08:37:06 -0700 (PDT)
Date: Fri, 21 Jun 2019 17:37:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Message-ID: <20190621153700.GD12905@phenom.ffwll.local>
References: <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
 <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
 <20190621102015.GA21486@arch-x1c3>
 <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
 <20190621105347.GB21486@arch-x1c3>
 <338bb519-05f1-cb76-d965-81237f432937@amd.com>
 <20190621115845.GC21486@arch-x1c3>
 <76158d1f-676d-2afa-244b-934967a9cb75@amd.com>
 <20190621124751.GE21486@arch-x1c3>
 <7d6f5ea5-bf36-3a68-ef1e-2d1b5d12178e@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d6f5ea5-bf36-3a68-ef1e-2d1b5d12178e@amd.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bQTtb1YJReUCyDVinPAukt8becP3QomKmtAqB8GJ0Hk=;
 b=I0uvbBaLhspMyN/4oECrmuLzb+geLvAsw2NAPuOh5tEquEbO8OAjI70lInHYBn77Rt
 N8B8Q43naCQ33MKePWhgA74wDpXJtnF2v7r1sd3MCa30KLNxlN/DSnxzTtPG8H+XaSFG
 amplTK8+76XW7XsO+GRRxf6ocrC94YZ6DurUI=
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
Cc: David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMDE6MDA6MTdQTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gQW0gMjEuMDYuMTkgdW0gMTQ6NDcgc2NocmllYiBFbWlsIFZlbGlrb3Y6Cj4g
PiBPbiAyMDE5LzA2LzIxLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToKPiA+PiBBbSAyMS4wNi4x
OSB1bSAxMzo1OCBzY2hyaWViIEVtaWwgVmVsaWtvdjoKPiA+Pj4gT24gMjAxOS8wNi8yMSwgS29l
bmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gPj4+PiBBbSAyMS4wNi4xOSB1bSAxMjo1MyBzY2hyaWVi
IEVtaWwgVmVsaWtvdjoKPiA+Pj4+PiBPbiAyMDE5LzA2LzIxLCBLb2VuaWcsIENocmlzdGlhbiB3
cm90ZToKPiA+Pj4+Pj4gW1NOSVBdCj4gPj4+Pj4+IFdlbGwgcGFydGlhbGx5LiBUaGF0IFJBRFYg
YnJva2UgaXMgdW5mb3J0dW5hdGUsIGJ1dCB3ZSBoYXZlIGRvbmUgc28gbWFueQo+ID4+Pj4+PiBj
dXN0b21pemVkIHVzZXJzcGFjZSBzdHVmZiBib3RoIGJhc2VkIG9uIE1lc2EvRERYIGFzIHdlbGwg
YXMgY2xvc2VkCj4gPj4+Pj4+IHNvdXJjZSBjb21wb25lbnRzIHRoYXQgaXQgaXMganVzdCBoaWdo
bHkgbGlrZWx5IHRoYXQgd2Ugd291bGQgYnJlYWsKPiA+Pj4+Pj4gc29tZXRoaW5nIGVsc2UgYXMg
d2VsbC4KPiA+Pj4+Pj4KPiA+Pj4+PiBBcyBhbiBlbmdpbmVlciBJIGxpa2UgdG8gd29yayB3aXRo
IHRhbmdpYmxlcy4gVGhlIGhpZ2hseSBsaWtlbHkgcGFydCBpcwo+ID4+Pj4+IHByb2JhYmxlLCBi
dXQgYXMgbWVudGlvbmVkIG11bHRpcGxlIHRpbWVzIHRoZSBzZXJpZXMgYWxsb3dzIGZvciBhIF9k
ZWFkXwo+ID4+Pj4+IHRyaXZpYWwgd2F5IHRvIGFkZHJlc3MgYW55IHN1Y2ggcHJvYmxlbXMuCj4g
Pj4+PiBXZWxsIHRvIGNsYXJpZnkgbXkgY29uY2VybiBpcyB0aGF0IHRoaXMgd29uJ3QgYmUgc28g
dHJpdmlhbC4KPiA+Pj4+Cj4gPj4+PiBZb3UgaW1wbGVtZW50ZWQgb24gd29ya2Fyb3VuZCBmb3Ig
b25lIHNwZWNpZmljIGNhc2UgYW5kIGl0IGlzIHBlcmZlY3RseQo+ID4+Pj4gcG9zc2libGUgdGhh
dCBmb3Igb3RoZXIgY2FzZXMgd2Ugd291bGQgaGF2ZSB0byBjb21wbGV0ZWx5IHJldmVydCB0aGUK
PiA+Pj4+IHJlbW92YWwgb2YgRFJNX0FVVEguCj4gPj4+Pgo+ID4+PiBJIHdvdWxkIGVuY291cmFn
ZSB5b3UgdG8gdGFrZSBhIGNsb3NlciBsb29rIGF0IG15IHBhdGNoIGFuZCBwb2ludCBvdXQKPiA+
Pj4gaG93IHBhcmNpY3VsYXIgY2FzZXMgY2Fubm90IGJlIGhhbmRsZWQuCj4gPj4gV2VsbCB0aGUg
bGFzdCB0aW1lIEkgbG9va2VkIGl0IG9ubHkgYmxvY2tlZCB0aGUgZmlyc3QgY2FsbCB0byB0aGUg
SU9DVEwuCj4gPj4KPiA+IEhtbSBpbnRlcmVzdGluZywgeW91J3JlIHJlcGxpZWQgdG8gbXkgcGF0
Y2ggd2l0aG91dCBldmVuIHJlYWRpbmcgaXQgOictKAo+IAo+IFdlbGwgSSd2ZSBOQUtlZCB0aGUg
c2VyaWVzIGJlY2F1c2Ugb2YgdGhlIGV4cG9zdXJlIG9mIHRoZSByZW5kZXIgbm9kZSAKPiBmdW5j
dGlvbmFsaXR5Cj4gCj4gPiBDYW4geW91IHBsZWFzZSBnaXZlIGl0IGEgY2xvc2UgbG9vayBhbmQg
cmVwbHkgaW5saW5lPwo+ID4KPiA+IFsxXSBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9h
cmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1NYXkvMjE5MjM4Lmh0bWwKPiAKPiBTbyB0aGUgd29ya2Fy
b3VuZCBubyBsb25nZXIganVzdCBibG9ja3MgdGhlIGZpcnN0IElPQ1RMLgo+IAo+IEJ1dCB0aGVu
IHRoZSBxdWVzdGlvbiBpcyB3aHkgZG9uJ3QgeW91IGp1c3Qga2VlcCB0aGUgRFJNX0FVVEggZmxh
ZyAKPiBpbnN0ZWFkIG9mIGFkZGluZyB0aGUgc2FtZSBmdW5jdGlvbmFsaXR5IHdpdGggYSBuZXcg
b25lPwo+IAo+ID4+PiAgIEZyb20geW91ciBleHBlcmllbnNlLCBkbyB1c2VyLXNwYWNlIGRldmVs
b3BlcnMgY2FyZSBhYm91dCBkb2luZyAob3IKPiA+Pj4gZ2VuZXJhbGx5IGRvKSB0aGUgcmlnaHQg
dGhpbmc/Cj4gPj4gTm8sIG5vdCBhdCBhbGwuIEV4Y2VwdCBmb3IgTWFyZWsgYW5kIE1pY2hlbCB0
aGV5IGp1c3QgdGFrZSB3aGF0IHdvcmtzCj4gPj4gYW5kIGV2ZW4gTWFyZWsgaXMgb2Z0ZW4gc2hv
cnQtY3V0dGluZyBvbiB0aGlzLgo+ID4+Cj4gPiBJbnRlcmVzdGluZywgZ3Vlc3MgSSBzaG91bGQg
aGF2ZSBhc2tlZCB0aGlzIHF1ZXN0aW9uIGZyb20gdGhlIHN0YXJ0Lgo+IAo+IFdlbGwgc291bmRz
IGxpa2UgeW91IGRvbid0IGhhdmUgdG8gd29yayB3aXRoIGEgY2xvc2VkIHNvdXJjZSBkcml2ZXIg
Cj4gdGVhbS4gQnV0IGFzIEkgc2FpZCBJIGhvbmVzdGx5IHdvdWxkIGRvIHRoZSBzYW1lIGFzIHVz
ZXIgc3BhY2UgZGV2ZWxvcGVyLgoKRnJvbSBhbiB1cHN0cmVhbSBrZXJuZWwgcG92IEkndmUgbmV2
ZXIgY2FyZWQgYWJvdXQgdGhlIGJsb2JzLiBJIGRvbid0CnVwc3RyZWFtIHNob3VsZCB0ZXJyaWJs
eSBzdGFydCBjYXJpbmcgYWJvdXQgYmxvYnMgLSBpZiB0aGV5IHNoaXAgaGFja3MKdGhhdCBkb24n
dCByZWZsZWN0IHdoYXQgdGhlIG9wZW4gc3RhY2sgZG9lcywgdGhlaXIgcHJvYmxlbS4KIApTcGVh
a2luZyBhcyBzb21lb25lIHdobydzIHBpc3NlZCBvZmYgY2xvc2VkIHNvdXJjZSBkcml2ZXIgdGVh
bXMgdG8gbm8gZW5kLgpJJ20gaGFwcHkgdG8gYmUgb2Ygc2VydmljZSBoZXJlIHRvbyA6LSkKCj4g
SSBtZWFuIGl0J3MgcmVhbGx5IGEgYnVuY2ggb2YgbW9yZSBjb2RlIHRvIG1haW50YWluLCBhbmQg
Z2V0dGluZyByaWQgb2YgCj4gY29kZSBpcyBhbHdheXMgbGVzcyB3b3JrIGluIHRoZSBsb25nIHRl
cm0gdGhlbiBrZWVwaW5nIGl0Lgo+IAo+IFRoYXQga2VybmVsIGRldmVsb3BlcnMgc2NyZWFtOiBO
byBubywgcGxlYXNlIGRvbid0IGRvIHRoYXQgd2Ugd2FudCB0byAKPiBrZWVwIHVzaW5nIGl0IGlz
IGNvbXBsZXRlbHkgaXJyZWxldmFudCBmb3IgdGhpcy4KCkpva2VzIGFzaWRlLCBJIHRoaW5rIHdl
IHNob3VsZCBsb29rIGF0IHdoYXQncyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8KbG9va2luZyBhdCBv
cGVuIHNvdXJjZSBvbmx5LCBhbmQgaWYgdGhhdCBnZXRzIHRoZSBibG9iYnkgZm9sa3Mgc2hhZnRl
ZCwKd2VsbCBzbyBiZSBpdC4gUmVhbGx5IG5vdCBteSBwcm9ibGVtLCBhbmQgSSdtIHByZXR0eSBz
dXJlIERhdmUgZG9lc24ndApjYXJlIG9uZSBoYWlyIG9mIGFuIGluY2ggbW9yZS4KLURhbmllbAot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
