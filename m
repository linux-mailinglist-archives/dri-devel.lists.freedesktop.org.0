Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F571D5DC4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 10:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25056E144;
	Mon, 14 Oct 2019 08:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACAB6E144
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 08:45:51 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r9so14060264edl.10
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 01:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=qfgrbYH1+Qt6+4oZT3BPWRVcTmbUQJZWhnOi/NpBY/4=;
 b=IZBwC8y/uU5VwZqtNE2a/K+VxsTTu/U6mhOZUaMurETWLMRNqBioSduoDdaQB2nnbb
 Ktvb1JgvkgaTRJuYEzhtW0XS3k34RwfwXuZ9BwdD7puzGihMYThlPzrFeDJqnIWbM8vH
 xP1eCJHEud6UHQhghMX+f53GBeY8Ecm/gMo8XSt2jIs/PKkBtF87TJ8sBmtkxyfJUXq8
 vIxafLVAfT90WrsA9lYINxjlkGylJ5zdCvYpQJguHATFcyxP2gqyZTUVhKPoh+CxgZQx
 FSrfGw6QfgzalKMXNIUKNqmNfGQcH7uV1I0hSup7gN06lpFoNGfS+GlPTY1br2aoisED
 pqsA==
X-Gm-Message-State: APjAAAUCCGRuIRSfC22ppn/7vxc69+6pcyhFUjrqJdiHc28pHviFueLw
 FZaMcghO7ld2gm4QvrDo7+Ahbw==
X-Google-Smtp-Source: APXvYqxMYI9P+ELFrNEs6vU+Obg/0CR90yO1CX8yikQurVmanWbIPtM+hfjhnpszkt+MYSlR3cHx8A==
X-Received: by 2002:a50:f296:: with SMTP id f22mr27071657edm.69.1571042750453; 
 Mon, 14 Oct 2019 01:45:50 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id q9sm2233587eja.31.2019.10.14.01.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 01:45:49 -0700 (PDT)
Date: Mon, 14 Oct 2019 10:45:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 5/6] drm/amdgpu/dm/mst: Report possible_crtcs
 incorrectly, for now
Message-ID: <20191014084547.GC11828@phenom.ffwll.local>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
 Sean Paul <sean@poorly.run>, amd-gfx@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Francis <David.Francis@amd.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20190926225122.31455-1-lyude@redhat.com>
 <20190926225122.31455-6-lyude@redhat.com>
 <20190927152741.GU218215@art_vandelay>
 <20191009150155.GD16989@phenom.ffwll.local>
 <2d813b2fdf39756ebee087d97f9ee4b2965f4193.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d813b2fdf39756ebee087d97f9ee4b2965f4193.camel@redhat.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=qfgrbYH1+Qt6+4oZT3BPWRVcTmbUQJZWhnOi/NpBY/4=;
 b=FVKPK+Fc3WT2iladk3fxhpqANtN8IWklmkrylPuR/vKDuX04/NiuzR5mDdRCcufjoM
 g/pwRVuRLc0GLqQcnnBg+lWu/WTSrzZovsRQtzQbjm3HZwp5JF098kLwpJGXb52o5wEs
 x0AYnJu4yuMIOT/n+l5F+OSNJTUoDT0zJfMM0=
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDQ6NTE6MTNQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBhIGxpdHRsZSBsYXRlIGJ1dDogaTkxNSBkb2VzIGhhdmUgdGhpcyBoYWNrIChvciByYXRo
ZXItcG9zc2libGVfY3J0Y3Mgd2l0aCBNU1QKPiBpbiBpOTE1IGhhcyBiZWVuIGJyb2tlbiBmb3Ig
YSB3aGlsZSBhbmQgZ290IGZpeGVkLCBidXQgaGFkIHRvIGdldCByZXZlcnRlZAo+IGJlY2F1c2Ug
b2YgdGhpcyBpc3N1ZSksIGl0J3Mgd2hlcmUgdGhpcyBvcmlnaW5hbGx5IGNhbWUgZnJvbS4KCkht
IHNpbmNlIHRoaXMgaXMgd2lkZXNwcmVhZCBJIHRoaW5rIHdlIHNob3VsZCBjaGVjayBmb3IgdGhp
cyB3aGVuIHdlCnJlZ2lzdGVyIGNvbm5lY3RvcnMgKGVpdGhlciBpbiBkcm1fZGV2X3JlZ2lzdGVy
LCBvciBob3RwbHVnZ2VkIG9uZXMpLiBJCnRoaW5rIGp1c3QgdmFsaWRhdGluZyB0aGF0IGFsbCBl
bmNvZGVyLT5wb3NzaWJsZV9jcnRjIG1hdGNoIGFuZCBXQVJOX09OIGlmCm5vdCB3b3VsZCBiZSBy
ZWFsbHkgZ29vZC4KCjJuZCBvcHRpb24gd291bGQgYmUgdG8gZG8gdGhhdCBpbiB0aGUgR0VURU5D
T0RFUlMgaW9jdGwuIFRoYXQgd291bGQgYXQKbGVhc3Qga2VlcCB0aGUgZW5jb2RlcnMgdXNlZnVs
IGZvciBkcml2ZXItaW50ZXJuYWwgc3R1ZmYuIFdlIGNvdWxkIHRoZW4KdW4tcmV2ZXJ0IHRoZSBp
OTE1IHBhdGNoIGFnYWluLgoKRWl0aGVyIHdheSBJIHRoaW5rIHdlIHNob3VsZCBoYXZlIHRoaXMg
aGFjayArIGNvbW1lbnQgd2l0aCBsaW5rcyB0byB0aGUKb2ZmZW5kaW5nIHVzZXJzcGFjZSBpbiBj
b21tb24gY29kZSwgbm90IGR1cGxpY2F0ZWQgb3ZlciBhbGwgZHJpdmVycy4KLURhbmllbAoKPiAK
PiBPbiBXZWQsIDIwMTktMTAtMDkgYXQgMTc6MDEgKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6
Cj4gPiBPbiBGcmksIFNlcCAyNywgMjAxOSBhdCAxMToyNzo0MUFNIC0wNDAwLCBTZWFuIFBhdWwg
d3JvdGU6Cj4gPiA+IE9uIFRodSwgU2VwIDI2LCAyMDE5IGF0IDA2OjUxOjA3UE0gLTA0MDAsIEx5
dWRlIFBhdWwgd3JvdGU6Cj4gPiA+ID4gVGhpcyBjb21taXQgaXMgc2VwZXJhdGUgZnJvbSB0aGUg
cHJldmlvdXMgb25lIHRvIG1ha2UgaXQgZWFzaWVyIHRvCj4gPiA+ID4gcmV2ZXJ0IGluIHRoZSBm
dXR1cmUuIEJhc2ljYWxseSwgdGhlcmUncyBtdWx0aXBsZSB1c2Vyc3BhY2UgYXBwbGljYXRpb25z
Cj4gPiA+ID4gdGhhdCBpbnRlcnByZXQgcG9zc2libGVfY3J0Y3MgdmVyeSB3cm9uZzoKPiA+ID4g
PiAKPiA+ID4gPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcveG9yZy94c2VydmVyL21l
cmdlX3JlcXVlc3RzLzI3Nwo+ID4gPiA+IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9t
dXR0ZXIvaXNzdWVzLzc1OQo+ID4gPiA+IAo+ID4gPiA+IFdoaWxlIHdvcmsgaXMgb25nb2luZyB0
byBmaXggdGhlc2UgaXNzdWVzIGluIHVzZXJzcGFjZSwgd2UgbmVlZCB0bwo+ID4gPiA+IHJlcG9y
dCAtPnBvc3NpYmxlX2NydGNzIGluY29ycmVjdGx5IGZvciBub3cgaW4gb3JkZXIgdG8gYXZvaWQK
PiA+ID4gPiBpbnRyb2R1Y2luZyBhIHJlZ3Jlc3Npb24gaW4gaW4gdXNlcnNwYWNlLiBPbmNlIHRo
ZXNlIGlzc3VlcyBnZXQgZml4ZWQsCj4gPiA+ID4gdGhpcyBjb21taXQgc2hvdWxkIGJlIHJldmVy
dGVkLgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJl
ZGhhdC5jb20+Cj4gPiA+ID4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAxMSArKysrKysrKysrKwo+ID4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gPiA+
ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4g
PiA+ID4gaW5kZXggYjQwNGYxYWU2ZGY3Li5mZThhYzgwMWQ3YTUgMTAwNjQ0Cj4gPiA+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+ID4g
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMKPiA+ID4gPiBAQCAtNDgwNyw2ICs0ODA3LDE3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2Ny
dGNfaW5pdChzdHJ1Y3QKPiA+ID4gPiBhbWRncHVfZGlzcGxheV9tYW5hZ2VyICpkbSwKPiA+ID4g
PiAgCWlmICghYWNydGMtPm1zdF9lbmNvZGVyKQo+ID4gPiA+ICAJCWdvdG8gZmFpbDsKPiA+ID4g
PiAgCj4gPiA+ID4gKwkvKgo+ID4gPiA+ICsJICogRklYTUU6IFRoaXMgaXMgYSBoYWNrIHRvIHdv
cmthcm91bmQgdGhlIGZvbGxvd2luZyBpc3N1ZXM6Cj4gPiA+ID4gKwkgKgo+ID4gPiA+ICsJICog
aHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL211dHRlci9pc3N1ZXMvNzU5Cj4gPiA+ID4g
KwkgKiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcveG9yZy94c2VydmVyL21lcmdlX3Jl
cXVlc3RzLzI3Nwo+ID4gPiA+ICsJICoKPiA+ID4gPiArCSAqIE9uZSB0aGVzZSBpc3N1ZXMgYXJl
IGNsb3NlZCwgdGhpcyBzaG91bGQgYmUgcmVtb3ZlZAo+ID4gPiAKPiA+ID4gRXZlbiB3aGVuIHRo
ZXNlIGlzc3VlcyBhcmUgY2xvc2VkLCB3ZSdsbCBzdGlsbCBiZSBpbnRyb2R1Y2luZyBhIHJlZ3Jl
c3Npb24KPiA+ID4gaWYgd2UKPiA+ID4gcmV2ZXJ0IHRoaXMgY2hhbmdlLiBUaW1lIGZvciBhY3R1
YWxseV9wb3NzaWJsZV9jcnRjcz8gOikKPiA+ID4gCj4gPiA+IFlvdSBhbHNvIG1pZ2h0IHdhbnQg
dG8gYnJpZWZseSBleHBsYWluIHRoZSB1L3MgYnVnIGluIGNhc2UgdGhlIGxpbmtzIGdvCj4gPiA+
IHNvdXIuCj4gPiA+IAo+ID4gPiA+ICsJICovCj4gPiA+ID4gKwlhY3J0Yy0+bXN0X2VuY29kZXIt
PmJhc2UucG9zc2libGVfY3J0Y3MgPQo+ID4gPiA+ICsJCWFtZGdwdV9kbV9nZXRfZW5jb2Rlcl9j
cnRjX21hc2soZG0tPmFkZXYpOwo+ID4gPiAKPiA+ID4gV2h5IGRvbid0IHdlIHB1dCB0aGlzIGhh
Y2sgaW4gYW1kZ3B1X2RtX2RwX2NyZWF0ZV9mYWtlX21zdF9lbmNvZGVyKCk/Cj4gPiAKPiA+IElm
IHdlIGRvbid0IGhhdmUgdGhlIHNhbWUgaGFjayBmb3IgaTkxNSBtc3QgSSB0aGluayB3ZSBzaG91
bGRuJ3QgbWVyZ2UKPiA+IHRoaXMgLi4uIGJyb2tlbiB1c2Vyc3BhY2UgaXMgYnJva2VuLgo+ID4g
LURhbmllbAo+IC0tIAo+IENoZWVycywKPiAJTHl1ZGUgUGF1bAo+IAoKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xs
LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
