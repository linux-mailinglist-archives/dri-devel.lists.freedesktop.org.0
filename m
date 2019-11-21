Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD79104E40
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2276EBCE;
	Thu, 21 Nov 2019 08:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A6B6EBCE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 08:43:59 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id l202so2505286oig.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 00:43:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rNR/smRxmUHN2IbHA1TtqICDz24djOyCtlBFCTLO6CI=;
 b=WaXZpCeR8MJCJv2s1s89VNmf4nRGoNESks4tEP6VCRhthkVwIdy8PuhgVDWpXAvuaD
 TqStxFpuCbTkZrrCIZcLp2bJxM3bURrPfsoB/V9yOzUMIJ6dOG1leJtyJITUg1Cs8WN6
 poK/HPLMlfQB0373lejoFYEA5ltp8kDA7H0atuuqbVVztqALo/4sPjAT9XAT5mij+HVi
 Y9z0j03NO5yoMIMqJ1cLEdE4Q/xefZ8IGQD3hDU0e8/sIzggSQ15SAtyCVPsEM8CT2jO
 CGIUYF2L3IFGZYFC+hwsEfh1+HDgZtwXSvmihtG9EBXtr/xqATQ7I43Mx7S9kJEY0IT9
 IN/A==
X-Gm-Message-State: APjAAAUp6RMFp/v4zTPjnO+33SJQZ7YN1lXykzGV+EQyWDkp9t/H8Pg1
 7TgfaW9l/XcAE4xDXaFuEAFUUcfvATlmkeO8xSpXIA==
X-Google-Smtp-Source: APXvYqyWoa3aYrskb1GhA9DPHkgYWbB6gY6dN+55GyRDsQrUT8p+MUN7Eboc2B6RtZwAjrMlzLgGG/J88lbE1nWpeKE=
X-Received: by 2002:aca:3889:: with SMTP id f131mr6642204oia.14.1574325838837; 
 Thu, 21 Nov 2019 00:43:58 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uHagBk6nGKenWZfd-ufb0h=WjzDVhctJyZ7g0Pi+H0+5Q@mail.gmail.com>
 <07cf5eed-558c-0434-a2ed-6800271efaac@suse.de>
In-Reply-To: <07cf5eed-558c-0434-a2ed-6800271efaac@suse.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 21 Nov 2019 09:43:47 +0100
Message-ID: <CAKMK7uHWcReSJeRpxxXhxmj02YxViE10gAJ0pegjhcVFhsg5gw@mail.gmail.com>
Subject: Re: locking&resource refcounting for ttm_bo_kmap/dma_buf_vmap
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rNR/smRxmUHN2IbHA1TtqICDz24djOyCtlBFCTLO6CI=;
 b=GWzf2V6V1H2cP0LCfKLlfkmRRQMi9VGQuorq7CDOgjBlgeoC90xMVXI9a82i0wnoqZ
 +tvkv/NQhPPaGqg1HsPi5ogg93YGh6GiPbVmTDKJCFBEkco1HLwxIaktXYeTxHJiszCU
 QYgCtOhFtff//M1Yy5rRtr89ZCHJqFmIpkyV4=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgODo1OSBBTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBIaQo+Cj4gQW0gMjAuMTEuMTkgdW0gMTI6NDcgc2No
cmllYiBEYW5pZWwgVmV0dGVyOgo+ID4gSGkgYWxsLAo+ID4KPiA+IEkndmUgYmVlbiBsb29raW5n
IGF0IGRtYV9idWZfdih1biltYXAsIHdpdGggYSBnb2FsIHRvIHN0YW5kYXJkaXplCj4gPiBsb2Nr
aW5nIGZvciBhdCBsZWFzdCBkeW5hbWljIGRtYS1idWYgZXhwb3J0ZXJzL2ltcG9ydGVycywgbW9z
dCBsaWtlbHkKPiA+IGJ5IHJlcXVpcmluZyBkbWFfcmVzdl9sb2NrLiBBbmQgSSBnb3QgcXVlc3Rp
b25zIGFyb3VuZCBob3cgdGhpcyBpcwo+ID4gc3VwcG9zZWQgdG8gd29yaywgc2luY2UgYSBiaWcg
Y2h1bmsgb2YgZHJpdmVycyBzZWVtIHRvIGVudGlyZWx5IGxhY2sKPiA+IGxvY2tpbmcgYXJvdW5k
IHR0bV9ib19rbWFwLiBUd28gYmlnIG9uZXM6Cj4gPgo+ID4gLSB0dG1fYm9fa21hcCBsb29rcyBh
dCBiby0+bWVtIHRvIGZpZ3VyZSBvdXQgd2hhdC93aGVyZSB0byBrbWFwIHRvIGdldAo+ID4gYXQg
dGhhdCBidWZmZXIuIGJvLT5tZW0gaXMgc3VwcG9zZWQgdG8gYmUgcHJvdGVjdGVkIHdpdGgKPiA+
IGRtYV9yZXN2X2xvY2ssIGJ1dCBhdCBsZWFzdCBhbWdwdS9ub3V2ZWF1L3JhZGVvbi9xeGwgZG9u
J3QgZ3JhYiB0aGF0Cj4gPiBpbiB0aGVpciBwcmltZSB2bWFwIGZ1bmN0aW9uLgo+ID4KPiA+IC0g
YmV0d2VlbiB0aGUgdm1hcCBhbmQgdnVubWFwIHNvbWV0aGluZyBuZWVkcyB0byBtYWtlIHN1cmUg
dGhlIGJhY2tpbmcKPiA+IHN0b3JhZ2UgZG9lc24ndCBtb3ZlIGFyb3VuZC4gSSBkaWRuJ3QgZmlu
ZCB0aGF0IGVpdGhlciBhbnl3aGVyZSwKPiA+IHR0bV9ib19rbWFwIHNpbXBseSBzZWVtcyB0byBz
ZXQgdXAgdGhlIG1hcHBpbmcsIGxlYXZpbmcgbG9ja2luZyBhbmQKPiA+IHJlZmNvdW50aW5nIHRv
IGNhbGxlcnMuCj4KPiBZb3UgaGF2ZSB0byBwaW4gYW5kIHVucGluIHN0b3JhZ2UgYmVmb3JlIGFu
ZCBhZnRlciBtYXBwaW5nLgoKWWVhaCwgYnV0IHlvdSA9IHRoZSBleHBvcnRlciwgbm90IHRoZSBp
bXBvcnRlci4gSS5lLiB0aGUgdm1hcCBjYWxsYmFjawpzaG91bGQgcGluIGFuZCB2dW5tYXAgc2hv
dWxkIHVucGluLiBJdCdzIG5vdCBhIGh1Z2UgZGVhbCBzaW5jZQpjdXJyZW50bHkgYWxsIHVzZXJz
IG9mIGRtYV9idWZfdm1hcCBJJ3ZlIGZvdW5kIGRvIGEgZG1hX2J1Zl9hdHRhY2gKKGV2ZW4gaWYg
dGhleSBuZXZlciB1c2UgdGhlIGF0dGFjaG1lbnQgZGlyZWN0bHkpLCBhbmQgd2l0aCBkcm0gcHJp
bWUKaGVscGVycyB0aGUgYXR0YWNoIHJlc3VsdHMgaW4gYSBwaW4uIE9yIHRoYXQncyBhdCBsZWFz
dCB0aGUgc3RvcnkgSQp0b2xkIG15c2VsZiB0byBiZWxpZXZlIHRoaXMgaXMgYWxsIG5vdCBhIHRv
dGFsbHkgZmlyZXdvcmtzIHNob3cgcmlnaHQKbm93IDotKQoKPiA+IC0gdnJhbSBoZWxwZXJzIGhh
dmUgYXQgbGVhc3QgbG9ja2luZywgYnV0IEknbSBzdGlsbCBtaXNzaW5nIHRoZQo+ID4gcmVmY291
bnRpbmcuIHZtd2dmeCBkb2Vzbid0IGJvdGhlciB3aXRoIHZtYXAuCj4KPiBUaGVyZSdzIGEgcmVm
IGNvdW50ZXIgZm9yIHBpbm5pbmcgWzFdIGFuZCB0aGVyZSdzIGEgY291bnRlciBmb3IgbWFwcGlu
Zy4KPiBbMl0gQXJlIHlvdSBsb29raW5nIGZvciBzb21ldGhpbmcgZWxzZT8KCnZyYW0gaGVscGVy
cyBhY3R1YWxseSBsb29rZWQgcHJldHR5IGdvb2QgaW4gdGhpcyByZWdhcmQuIElmIHlvdSBsb29r
CmF0IG90aGVyIGNhbGxlcnMgb2YgdHRtX2JvX2ttYXAsIHRoZXkncmUgYSBsb3QgbW9yZSBmYXN0
Jmxvb3NlIGhlcmUuCi1EYW5pZWwKCj4KPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPgo+IFsxXQo+
IGh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS10aXAvdHJlZS9pbmNsdWRlL2Ry
bS9kcm1fZ2VtX3ZyYW1faGVscGVyLmg/aWQ9OGQzOTk2Y2VlZGNkNWM2NGY1YTM1NGU5ZGNjNjRk
YjRhMWY3MmRkNiNuNjkKPiBbMl0KPiBodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2RybS9k
cm0tdGlwL3RyZWUvaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oP2lkPThkMzk5NmNl
ZWRjZDVjNjRmNWEzNTRlOWRjYzY0ZGI0YTFmNzJkZDYjbjYzCj4KPiA+Cj4gPiBXaGF0IGFtIEkg
bWlzc2luZz8KPiA+Cj4gPiBUaGFua3MsIERhbmllbAo+ID4KPgo+IC0tCj4gVGhvbWFzIFppbW1l
cm1hbm4KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyCj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJICj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55
Cj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQo+IEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJ
bWVuZMO2cmZmZXIKPgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
