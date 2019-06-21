Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D26144E3A3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 11:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3246E854;
	Fri, 21 Jun 2019 09:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064726E855
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 09:35:21 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id b7so5649511otl.11
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 02:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DQv4G5klIFNEvtT9cKclv8hlNJu3g24fpVbPaELuxVM=;
 b=M56Y78YeweQtoPm2fCgIZo6IeEzsBgqTqa/O+UlVRstLF11x5MhK9vTnxU9nRAoln/
 wOtKvn2WWwZSdzl7qAeWwsaPkn97o/yeay3+LV1m8LMvN76DPapjxwPnJ3RafnqaWf7X
 ca0SKIeRfZeFsDKfY6omOTrZQltVFCJ8QzIkkmnKVZ2lzi5tdr6LKMRBxDvY6gvBIm2j
 M3wihp3tVEZUPdd8Ktv4B52hue6xkA9RMSploc2/+Mnr1ulk0PWbRHE74bMYLr4tjF3b
 pk1yM7JLEPDzeHxjUOO4jAHSxUyDzy/PFYB68nEOWgfwdB/MAFa8exUzFmDU4OQBDG3G
 geog==
X-Gm-Message-State: APjAAAU3fMCKuMFMiRFqcAmnhZTgy0uozosYMazsD7MldwyK7jROrIhF
 m3VA9atxe55ncThAb0yal0HBp2wcFyc+4ogBb5oG3g==
X-Google-Smtp-Source: APXvYqywHLDinsLgR4xGXQKJyNMFIMURQsonQvmmGhn7ZMZV90Sl+2COxowy7NRlp1s8QlDwkEWKma5xw2z+/ERyZ28=
X-Received: by 2002:a05:6830:ce:: with SMTP id
 x14mr12011285oto.188.1561109720204; 
 Fri, 21 Jun 2019 02:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190614120927.GA32412@arch-x1c3>
 <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
 <20190614155325.GC32412@arch-x1c3>
 <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
 <20190620163012.GF1896@arch-x1c3>
 <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
 <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
In-Reply-To: <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 21 Jun 2019 11:35:04 +0200
Message-ID: <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DQv4G5klIFNEvtT9cKclv8hlNJu3g24fpVbPaELuxVM=;
 b=jfDK+BIm7oOzyCoMpnynStNa6qFr9V5IFhOHpNtfO9XJULndQkR/wHv6es6G0D3ktY
 BWBTYNpN+KxT5q+hSRHqRPenTE7r3YqfSOU8luQquuzT5GVvOu2c7+PaCJ2yQixRnsRY
 BKEaE/SQdnPFW7F5pS2UrYcGI08nC/ltUoTB4=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTE6MjUgQU0gS29lbmlnLCBDaHJpc3RpYW4KPENocmlz
dGlhbi5Lb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBBbSAyMS4wNi4xOSB1bSAxMTowOSBzY2hy
aWViIERhbmllbCBWZXR0ZXI6Cj4gPiBPbiBGcmksIEp1biAyMSwgMjAxOSBhdCAwNzoxMjoxNEFN
ICswMDAwLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToKPiA+PiBBbSAyMC4wNi4xOSB1bSAxODoz
MCBzY2hyaWViIEVtaWwgVmVsaWtvdjoKPiA+Pj4gT24gMjAxOS8wNi8xNCwgS29lbmlnLCBDaHJp
c3RpYW4gd3JvdGU6Cj4gPj4+PiBBbSAxNC4wNi4xOSB1bSAxNzo1MyBzY2hyaWViIEVtaWwgVmVs
aWtvdjoKPiA+Pj4+PiBPbiAyMDE5LzA2LzE0LCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToKPiA+
Pj4+Pj4gQW0gMTQuMDYuMTkgdW0gMTQ6MDkgc2NocmllYiBFbWlsIFZlbGlrb3Y6Cj4gPj4+Pj4+
PiBPbiAyMDE5LzA1LzI3LCBFbWlsIFZlbGlrb3Ygd3JvdGU6Cj4gPj4+Pj4+PiBbU05JUF0KPiA+
Pj4+Pj4+IEhpIENocmlzdGlhbiwKPiA+Pj4+Pj4+Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gSW4gdGhl
IGZvbGxvd2luZywgSSB3b3VsZCBsaWtlIHRvIHN1bW1hcmlzZSBhbmQgZW1waGFzaXplIHRoZSBu
ZWVkIGZvcgo+ID4+Pj4+Pj4gRFJNX0FVVEggcmVtb3ZhbC4gSSB3b3VsZCBraW5kbHkgYXNrIHlv
dSB0byBzcGVuZCBhIGNvdXBsZSBvZiBtaW51dGVzCj4gPj4+Pj4+PiBleHRyYSByZWFkaW5nIGl0
Lgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBUb2RheSBEUk0gZHJpdmVycyogZG8gbm90
IG1ha2UgYW55IGRpc3RpbmN0aW9uIGJldHdlZW4gcHJpbWFyeSBhbmQKPiA+Pj4+Pj4+IHJlbmRl
ciBub2RlIGNsaWVudHMuCj4gPj4+Pj4+IFRoYXQgaXMgYWN0dWFsbHkgbm90IDEwMCUgY29ycmVj
dC4gV2UgaGF2ZSBhIHNwZWNpYWwgY2FzZSB3aGVyZSBhIERSTQo+ID4+Pj4+PiBtYXN0ZXIgaXMg
YWxsb3dlZCB0byBjaGFuZ2UgdGhlIHByaW9yaXR5IG9mIHJlbmRlciBub2RlIGNsaWVudHMuCj4g
Pj4+Pj4+Cj4gPj4+Pj4gQ2FuIHlvdSBwcm92aWRlIGEgbGluaz8gSSBjYW5ub3QgZmluZCB0aGF0
IGNvZGUuCj4gPj4+PiBTZWUgYW1kZ3B1X3NjaGVkX2lvY3RsKCkuCj4gPj4+Pgo+ID4+Pj4+Pj4g
VGh1cyBmb3IgYSByZW5kZXIgY2FwYWJsZSBkcml2ZXIsIGFueSBwcmVtaXNlIG9mCj4gPj4+Pj4+
PiBzZXBhcmF0aW9uLCBzZWN1cml0eSBvciBvdGhlcndpc2UgaW1wb3NlZCB2aWEgRFJNX0FVVEgg
aXMgYSBmYWxsYWN5Lgo+ID4+Pj4+PiBZZWFoLCB0aGF0J3Mgd2hhdCBJIGFncmVlIG9uLiBJIGp1
c3QgZG9uJ3QgdGhpbmsgdGhhdCByZW1vdmluZyBEUk1fQVVUSAo+ID4+Pj4+PiBub3cgaXMgdGhl
IHJpZ2h0IGRpcmVjdGlvbiB0byB0YWtlLgo+ID4+Pj4+Pgo+ID4+Pj4+IENvdWxkIGhhdmUgYmVl
biBjbGVhcmVyIC0gSSdtIHRhbGtpbmcgYWJvdXQgRFJNX0FVVEggfCBEUk1fUkVOREVSX0FMTE9X
Cj4gPj4+Pj4gaW9jdGxzLgo+ID4+Pj4+Cj4gPj4+Pj4gVGhhdCBhc2lkZSwgY2FuIHlvdSBwcm9w
b3NlIGFuIGFsdGVybmF0aXZlIHNvbHV0aW9uIHRoYXQgYWRkcmVzc2VzIHRoaXMKPiA+Pj4+PiBh
bmQgdGhlIHNlY29uZCBwb2ludCBqdXN0IGJlbG93Pwo+ID4+Pj4gR2l2ZSBtZSBhIGZldyBkYXlz
IHRvIHdvcmsgb24gdGhpcywgaXQncyBhbHJlYWR5IEZyaWRheSA2cG0gaGVyZS4KPiA+Pj4+Cj4g
Pj4+IEhpIENocmlzdGlhbiwKPiA+Pj4KPiA+Pj4gQW55IHByb2dyZXNzPyBBcyBtZW50aW9uZWQg
ZWFybGllciwgSSdtIE9LIHdpdGggd3JpdGluZyB0aGUgcGF0Y2hlcyBhbHRob3VnaAo+ID4+PiBJ
IHdvdWxkIGxvdmUgdG8gaGVhciB5b3VyIHBsYW4uCj4gPj4gRmlyc3Qgb2YgYWxsIEkgdHJpZWQg
dG8gZGlzYWJsZSBEUk0gYXV0aGVudGljYXRpb24gY29tcGxldGVseSB3aXRoIGEKPiA+PiBrZXJu
ZWwgY29uZmlnIG9wdGlvbi4gU3VycHJpc2luZ2x5IHRoYXQgYWN0dWFsbHkgd29ya3Mgb3V0IG9m
IHRoZSBib3ggYXQKPiA+PiBsZWFzdCBvbiB0aGUgQU1ER1BVIHN0YWNrLgo+ID4+Cj4gPj4gVGhp
cyBlZmZlY3RpdmVseSBhbGxvd3MgdXMgdG8gZ2V0IHJpZCBvZiBEUkkyIGFuZCB0aGUgcmVsYXRl
ZCBzZWN1cml0eQo+ID4+IHByb2JsZW1zLiBPbmx5IHRoaW5nIGxlZnQgZm9yIHRoYXQgaXMgdGhh
dCBJJ20ganVzdCBub3Qgc3VyZSBob3cgdG8KPiA+PiBzaWduYWwgdGhpcyB0byB1c2Vyc3BhY2Ug
c28gdGhhdCB0aGUgRERYIHdvdWxkbid0IGFkdmVydGlzZSBEUkkyIGF0IGFsbAo+ID4+IGFueSBt
b3JlLgo+ID4+Cj4gPj4KPiA+PiBBcyBhIG5leHQgc3RlcCBJIGxvb2tlZCBpbnRvIGlmIHdlIGNh
biBkaXNhYmxlIHRoZSBjb21tYW5kIHN1Ym1pc3Npb24KPiA+PiBmb3IgRFJNIG1hc3Rlci4gVHVy
bmVkIG91dCB0aGF0IHRoaXMgaXMgcmVsYXRpdmVseSBlYXN5IGFzIHdlbGwuCj4gPj4KPiA+PiBB
bGwgd2UgaGF2ZSB0byBkbyBpcyB0byBmaXggdGhlIGJ1ZyBNaWNoZWwgcG9pbnRlZCBvdXQgYWJv
dXQgS01TIGhhbmRsZXMKPiA+PiBmb3IgZGlzcGxheSBhbmQgbGV0IHRoZSBERFggdXNlIGEgcmVu
ZGVyIG5vZGUgaW5zdGVhZCBvZiB0aGUgRFJNIG1hc3Rlcgo+ID4+IGZvciBHbGFtb3IuIFN0aWxs
IG5lZWQgdG8gc3luYyB1cCB3aXRoIE1pY2hlbCBhbmQvb3IgTWFyZWsgd2hhdHMgdGhlCj4gPj4g
YmVzdCB3YXkgb2YgZG9pbmcgdGhpcy4KPiA+Pgo+ID4+Cj4gPj4gVGhlIGxhc3Qgc3RlcCAoYW5k
IHRoYXQncyB3aGF0IEkgaGF2ZW4ndCB0cmllZCB5ZXQpIHdvdWxkIGJlIHRvIGRpc2FibGUKPiA+
PiBEUk0gYXV0aGVudGljYXRpb24gZm9yIE5hdmkgZXZlbiB3aGVuIGl0IGlzIHN0aWxsIGNvbXBp
bGVkIGludG8gdGhlCj4gPj4ga2VybmVsLiBCdXQgdGhhdCBpcyBtb3JlIG9yIGxlc3MganVzdCBh
IHR5cGluZyBleGVyY2lzZS4KPiA+IFNvIGp1c3QgdG8gZ2V0IHRoaXMgc3RyYWlnaHQsIHdlJ3Jl
IG5vdyBmdWxsIG9uIGVtYnJhY2luZyBhIHN1YnN5c3RlbQo+ID4gc3BsaXQgaGVyZToKPiA+IC0g
YW1kZ3B1IHBsYW5zIHRvIGRpdGNoIGRyaTIvcmVuZGVyaW5nIG9uIHByaW1hcnkgbm9kZXMKPiA+
IC0gYnVuY2ggb2YgZHJpdmVycyAoSSB0aGluayBtb3JlIHRoYW4gaTkxNSBieSBub3cpIG1lcmdl
ZCB0aGUgRFJNX0FVVEgKPiA+ICAgIHJlbW92YWwKPiA+IC0gb3RoZXJzIGFyZSBqdXN0IGhhbmdp
bmcgaW4gdGhlcmUgc29tZWhvdwo+ID4KPiA+ICJiZXN0IG9mIGJvdGheVyB3b3JsZHMiIGZ0dz8K
Pgo+IFllcywgZXhhY3RseSEKPgo+IFRoaW5rIGEgc3RlcCBmdXJ0aGVyLCB3aGVuIHRoaXMgaXMg
dXBzdHJlYW0gd2UgY2FuIGFwcGx5IHRoZSBEUk1fQVVUSAo+IHJlbW92YWwgdG8gYW1kZ3B1IGFz
IHdlbGwuCj4KPiBCZWNhdXNlIHdlIHNpbXBseSBtYWRlIHN1cmUgdGhhdCB1c2Vyc3BhY2UgaXMg
dXNpbmcgdGhlIHJlbmRlciBub2RlIGZvcgo+IGNvbW1hbmQgc3VibWlzc2lvbiBhbmQgbm90IHRo
ZSBwcmltYXJ5IG5vZGUuCj4KPiBTbyBub2JvZHkgY2FuIGdvIGFoZWFkIGFuZCByZW1vdmUgcmVu
ZGVyIG5vZGUgc3VwcG9ydCBhbnkgbW9yZSA6KQoKSG93IGRvZXMgdGhpcyB3b3JrPyBJIHRob3Vn
aHQgdGhlIGVudGlyZSBwcm9ibGVtIG9mIERSTV9BVVRIIHJlbW92YWwKZm9yIHlvdSB3YXMgdGhh
dCBpdCBicm9rZSBzdHVmZiwgYW5kIHlvdSBkaWRuJ3Qgd2FudCB0byBkZWFsIHdpdGgKdGhhdC4g
V2Ugc3RpbGwgaGF2ZSB0aGF0IGV4YWN0IHByb2JsZW0gYWZhaWNzIC4uLiBvbGQgdXNlcnNwYWNl
CmRvZXNuJ3Qgc2ltcGx5IHZhbmlzaCwgZXZlbiBpZiB5b3UgZW50aXJlbHkgbnVrZSBpdCBnb2lu
ZyBmb3J3YXJkLgoKQWxzbywgdGVzdGluZyBvbiB0aGUgYW1kZ3B1IHN0YWNrIGlzbid0IHJlYWxs
eSB0ZXN0aW5nIGEgaG9sZSBsb3QKaGVyZSwgaXQncyBhbGwgdGhlIHZhcmlvdXMgc2lsbHkgY29t
cG9zaXRvcnMgb3V0IHRoZXJlIEknZCBleHBlY3QgdG8KZmFsbCBvdmVyLiBXaWxsIGdibS9yYWRl
b25zaS93aGF0ZXZlciBqdXN0IGludGVybmFsbHkgZG8gYWxsIHRoZQpuZWNlc3NhcnkgZG1hLWJ1
ZiBpbXBvcnQvZXhwb3J0IGJldHdlZW4gdGhlIHByaW1hcnkgbm9kZSBhbmQgZGlzcGxheQpub2Rl
IHRvIGtlZXAgdGhpcyBhbGwgd29ya2luZz8KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
