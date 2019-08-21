Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4757497643
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 11:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFD76E940;
	Wed, 21 Aug 2019 09:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0A26E940
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 09:34:19 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id g128so1115824oib.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 02:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jrMnd9Dw4BIbl105NPubLNKMx+vt1yB2bVw1jRY/PoI=;
 b=bjHO6p6AIwtSyfEd3dcQ1DCz1nDePXUsebiISQlROvqLK4ABSqeJbbdQmhQnqJr8DU
 64wIlT48jJD3cUChSGvUNkWbNcxHTgXg224/ak0gh1F+i0h0KvyXd7kWWtohAPonxFlE
 Lys39Z7Qdq6tvStzx7Rp1J0qLtm0IuebigZJej/O9U9l/DNKDyMmFpb+wvqzzfljIJW6
 WinKC1QahT4V7tDpCL4hZzHfxTOsxKfFfUzFCmcNgp6tpKy+GMAahlAKChaGVowtAsWj
 uQYZp3FjBfGakFWEQQ/0nPzHnjDctJzAHlAyH3CBtwThtbYDGvlxWb6mojdFbPFnB/7a
 eJzQ==
X-Gm-Message-State: APjAAAWoXUUV0tKc92uIn/CCXkZYP0Cn3gQUj8iZpSuqJffzpbN02HII
 ExSJRugUa75wORm9LV6SEiqpkKAP3i7eVs6l/Y0xzw==
X-Google-Smtp-Source: APXvYqz6Xkt/CCbaeKtV6kQUpHjgnS2QNd5FOt7p4vifuidxlIYHRXgS2fDGVa3/892Mj7QMqJOfxhRNKJMmZoX5PgE=
X-Received: by 2002:aca:da08:: with SMTP id r8mr2776211oig.101.1566380058381; 
 Wed, 21 Aug 2019 02:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
 <20190820081902.24815-5-daniel.vetter@ffwll.ch>
 <20190820133418.GG29246@ziepe.ca>
 <20190820151810.GG11147@phenom.ffwll.local> <20190820152712.GH29246@ziepe.ca>
In-Reply-To: <20190820152712.GH29246@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 21 Aug 2019 11:34:06 +0200
Message-ID: <CAKMK7uGuH_Lvzf+M3Vast-RFS6Dr70F+Q4U_aSHuR1TpJg02SQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] mm, notifier: Catch sleeping/blocking for !blockable
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=jrMnd9Dw4BIbl105NPubLNKMx+vt1yB2bVw1jRY/PoI=;
 b=RWdDCknAmMlPEQ9u6yUMbaKojAWU9G+zSGrTlsA+5Fkb6D5PPhV3wXAdyHPQHxX3o2
 vq6qCQtWx7WMlW8Wcwk/fdYFN48LUhyp1O9fbzd3V40UTaKzdmNXguxv3DgFH0nqPlyM
 j37eomYfP4oBSb5y02UJPiGrztvAL9IJTDwk4=
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
Cc: Michal Hocko <mhocko@suse.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 David Rientjes <rientjes@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgOTozMyBBTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEF1ZyAyMCwgMjAxOSBhdCAwNToxODoxMFBNICswMjAw
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gPiA+IGRpZmYgLS1naXQgYS9tbS9tbXVfbm90aWZp
ZXIuYyBiL21tL21tdV9ub3RpZmllci5jCj4gPiA+ID4gaW5kZXggNTM4ZDNiYjg3ZjliLi44NTY2
MzZkMDZlZTAgMTAwNjQ0Cj4gPiA+ID4gKysrIGIvbW0vbW11X25vdGlmaWVyLmMKPiA+ID4gPiBA
QCAtMTgxLDcgKzE4MSwxMyBAQCBpbnQgX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9z
dGFydChzdHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlICpyYW5nZSkKPiA+ID4gPiAgIGlkID0gc3Jj
dV9yZWFkX2xvY2soJnNyY3UpOwo+ID4gPiA+ICAgaGxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KG1u
LCAmcmFuZ2UtPm1tLT5tbXVfbm90aWZpZXJfbW0tPmxpc3QsIGhsaXN0KSB7Cj4gPiA+ID4gICAg
ICAgICAgIGlmIChtbi0+b3BzLT5pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KSB7Cj4gPiA+ID4gLSAg
ICAgICAgICAgICAgICAgaW50IF9yZXQgPSBtbi0+b3BzLT5pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0
KG1uLCByYW5nZSk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgaW50IF9yZXQ7Cj4gPiA+ID4g
Kwo+ID4gPiA+ICsgICAgICAgICAgICAgICAgIGlmICghbW11X25vdGlmaWVyX3JhbmdlX2Jsb2Nr
YWJsZShyYW5nZSkpCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICBub25fYmxvY2tf
c3RhcnQoKTsKPiA+ID4gPiArICAgICAgICAgICAgICAgICBfcmV0ID0gbW4tPm9wcy0+aW52YWxp
ZGF0ZV9yYW5nZV9zdGFydChtbiwgcmFuZ2UpOwo+ID4gPiA+ICsgICAgICAgICAgICAgICAgIGlm
ICghbW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5nZSkpCj4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICBub25fYmxvY2tfZW5kKCk7Cj4gPiA+Cj4gPiA+IElmIHNvbWVvbmUg
QWNrcyBhbGwgdGhlIHNjaGVkIGNoYW5nZXMgdGhlbiBJIGNhbiBwaWNrIHRoaXMgZm9yCj4gPiA+
IGhtbS5naXQsIGJ1dCBJIHN0aWxsIHRoaW5rIHRoZSBleGlzdGluZyBwcmUtZW1wdGlvbiBkZWJ1
Z2dpbmcgaXMgZmluZQo+ID4gPiBmb3IgdGhpcyB1c2UgY2FzZS4KPiA+Cj4gPiBPaywgSSdsbCBw
aW5nIFBldGVyIFouIGZvciBhbiBhY2ssIGlpcmMgaGUgd2FzIGludm9sdmVkLgo+ID4KPiA+ID4g
QWxzbywgc2FtZSBjb21tZW50IGFzIGZvciB0aGUgbG9ja2RlcCBtYXAsIHRoaXMgbmVlZHMgdG8g
YXBwbHkgdG8gdGhlCj4gPiA+IG5vbi1ibG9ja2luZyByYW5nZV9lbmQgYWxzby4KPiA+Cj4gPiBI
bSwgSSB0aG91Z2h0IHRoZSBwYWdlIHRhYmxlIGxvY2tzIHdlJ3JlIGhvbGRpbmcgdGhlcmUgYWxy
ZWFkeSBwcmV2ZW50IGFueQo+ID4gc2xlZXBpbmcsIHNvIHdvdWxkIGJlIHJlZHVuZGFudD8KPgo+
IEFGQUlLIG5vLiBBbGwgY2FsbGVycyBvZiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0L2VuZCBwYWly
cyBkbyBzbyBhIGZldwo+IGxpbmVzIGFwYXJ0IGFuZCBkb24ndCBjaGFuZ2UgdGhlaXIgbG9ja2lu
ZyBpbiBiZXR3ZWVuIC0gdGh1cyBzaW5jZQo+IHN0YXJ0IGNhbiBibG9jayBzbyBjYW4gZW5kLgo+
Cj4gV291bGQgbG92ZSB0byBrbm93IGlmIHRoYXQgaXMgbm90IHRydWU/PwoKWWVhaCBJIHJldmll
d2VkIHRoZW0sIEkgdGhpbmsgSSBtaXhlZCB1cCBhIGRpc2N1c3Npb24gSSBoYWQgYSB3aGlsZQph
Z28gd2l0aCBKZXJvbWUuIEl0J3MgYSBiaXQgdHJpY2t5IHRvIGZvbGxvdyBpbiB0aGUgY29kZSBz
aW5jZSBpbiBzb21lCnBsYWNlcyAtPmludmFsaWRhdGVfcmFuZ2UgYW5kIC0+aW52YWxpZGF0ZV9y
YW5nZV9lbmQgc2VlbSB0byBiZSBjYWxsZWQKZnJvbSB0aGUgc2FtZSBwbGFjZSwgaW4gb3RoZXJz
IG5vdCBhdCBhbGwuCgo+IFNpbWlsYXJseSBJJ3ZlIGFsc28gYmVlbiBpZGx5IHdvbmRlcmluZyBp
ZiB3ZSBzaG91bGQgYWRkIGEKPiAnbWlnaHRfc2xlZXAoKScgdG8gaW52YWxpZGF0ZV9yYW5nZXN0
YXJ0L2VuZCgpIHRvIG1ha2UgdGhpcyBjb25zdHJhaW50Cj4gY2xlYXIgJiB0ZXN0ZWQgdG8gdGhl
IG1tIHNpZGU/CgpIbSwgc291bmRzIGxpa2UgYSB1c2VmdWwgaWRlYS4gU2luY2UgaW4gZ2VuZXJh
bCB5b3Ugd29udCB0ZXN0IHdpdGggbW11Cm5vdGlmaWVycywgYnV0IHRoZXkgY291bGQgaGFwcGVu
LCBhbmQgdGhlbiB0aGV5IHdpbGwgYmxvY2sgZm9yIGF0CmxlYXN0IHNvbWUgbXV0ZXggdXN1YWxs
eS4gSSdsbCB0aHJvdyB0aGF0IGFzIGFuIGlkZWEgb24gdG9wIGZvciB0aGUKbmV4dCByb3VuZC4K
LURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9y
YXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
