Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72FC845AA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9986E62D;
	Wed,  7 Aug 2019 07:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2216D6E388
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 14:11:53 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id l12so6126129oil.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 07:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KSZHR8G3MghKTiH3RE/z9t0oAkPmKdy9XO/QMCZqNZU=;
 b=jkYkgXYFuQNb29NTWWVAfvmVdpbXq/OydWczbLAIvFlNpoAS0aIaUkmheSThEbLaWU
 4/W7hGm1rUdZNWvhsM0w53Qb8QWiUen8CSWsMvjiymDM7SBIPlL6/fXjBbXsdwGVPiZz
 JlY6NYGtUzgxLg3zf0hIom6qn19AZ+FBClg3kmcgCfU26WbK+Pzk6mmushwohRB+7S78
 Uyy6K3aIlTGb0bAxnuJ5y6KGrDOO/gJzj4q1kzCxGMDWF5g4tqnG4K2ZB+AUWIZklKAf
 /5E0ILDKvcoapicYez7D8gGEOZr0KGSl4uy6Eh1tE2dAG/slift3Joa7UFFjy4rLNRnu
 ts2Q==
X-Gm-Message-State: APjAAAWnFGEjPbNPrnk7hahdU1pck/zmVCXoPSr1cOJ4ENTpijfQj3Gn
 Xf5akPvePibaYeT/TNzPWV7aolKAVnl+C92TzzWdjA==
X-Google-Smtp-Source: APXvYqytpvT8vaMFRA5kJCHz75f7m4Y8MAbUwJhZNd42scl1WSb2yxqI74afmLk/TEYBgez6jiANQdmqKzHF5x1pzu0=
X-Received: by 2002:a02:c916:: with SMTP id t22mr4302514jao.24.1565100712372; 
 Tue, 06 Aug 2019 07:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190805211451.20176-1-robdclark@gmail.com>
 <20190806084821.GA17129@lst.de>
In-Reply-To: <20190806084821.GA17129@lst.de>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 6 Aug 2019 07:11:41 -0700
Message-ID: <CAJs_Fx6eh1w7c=crMoD5XyEOMzP6orLhqUewErE51cPGYmObBQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: add cache support for arm64
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=KSZHR8G3MghKTiH3RE/z9t0oAkPmKdy9XO/QMCZqNZU=;
 b=SZo4fdmXeH8WXLZpaSB/sTV0Fj/AOoy8kq3bwOXiCeK8jvWHo70O+zD6FGjZ4ESlzG
 MJwNG4UTGW0T+1XmwKK1L0YCnIqCOJzMb+NEEP94tgXzPcO60WWioadGoDrAlJhawAxu
 C6B3hppVH+zXeBCt8Dxdu3vMqTF2xSy6yZ4Us=
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
Cc: Sean Paul <sean@poorly.run>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxOjQ4IEFNIENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0
LmRlPiB3cm90ZToKPgo+IFRoaXMgZ29lcyBpbiB0aGUgd3JvbmcgZGlyZWN0aW9uLiAgZHJtX2Nm
bHVzaF8qIGFyZSBhIGJhZCBBUEkgd2UgbmVlZCB0bwo+IGdldCByaWQgb2YsIG5vdCBhZGQgdXNl
IG9mIGl0LiAgVGhlIHJlYXNvbiBmb3IgdGhhdCBpcyB0d28tZm9sZDoKPgo+ICBhKSBpdCBkb2Vz
bid0IGFkZHJlc3MgaG93IGNhY2hlIG1haW50YWluY2UgYWN0dWFsbHkgd29ya3MgaW4gbW9zdAo+
ICAgICBwbGF0Zm9ybXMuICBXaGVuIHRhbGtpbmcgYWJvdXQgYSBjYWNoZSB3ZSB0aHJlZSBmdW5k
YW1lbnRhbCBvcGVyYXRpb25zOgo+Cj4gICAgICAgICAxKSB3cml0ZSBiYWNrIC0gdGhpcyB3cml0
ZXMgdGhlIGNvbnRlbnQgb2YgdGhlIGNhY2hlIGJhY2sgdG8gdGhlCj4gICAgICAgICAgICBiYWNr
aW5nIG1lbW9yeQo+ICAgICAgICAgMikgaW52YWxpZGF0ZSAtIHRoaXMgcmVtb3ZlIHRoZSBjb250
ZW50IG9mIHRoZSBjYWNoZQo+ICAgICAgICAgMykgd3JpdGUgYmFjayArIGludmFsaWRhdGUgLSBk
byBib3RoIG9mIHRoZSBhYm92ZQoKQWdyZWVkIHRoYXQgZHJtX2NmbHVzaF8qIGlzbid0IGEgZ3Jl
YXQgQVBJLiAgSW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UKKElJVUMpLCBJIG5lZWQgd2IraW52IHNv
IHRoYXQgdGhlcmUgYXJlbid0IGRpcnR5IGNhY2hlIGxpbmVzIHRoYXQgZHJvcApvdXQgdG8gbWVt
b3J5IGxhdGVyLCBhbmQgc28gdGhhdCBJIGRvbid0IGdldCBhIGNhY2hlIGhpdCBvbgp1bmNhY2hl
ZC93YyBtbWFwJ2luZy4KCj4gIGIpIHdoaWNoIG9mIHRoZSBhYm92ZSBvcGVyYXRpb24geW91IHVz
ZSB3aGVuIGRlcGVuZHMgb24gYSBjb3VwbGUgb2YKPiAgICAgZmFjdG9ycyBvZiB3aGF0IHlvdSB3
YW50IHRvIGRvIHdpdGggdGhlIHJhbmdlIHlvdSBkbyB0aGUgY2FjaGUKPiAgICAgbWFpbnRhaW5h
bmNlIG9wZXJhdGlvbnMKPgo+IFRha2UgYSBsb29rIGF0IHRoZSBjb21tZW50IGluIGFyY2gvYXJj
L21tL2RtYS5jIGFyb3VuZCBsaW5lIDMwIHRoYXQKPiBleHBsYWlucyBob3cgdGhpcyBhcHBsaWVz
IHRvIGJ1ZmZlciBvd25lcnNoaXAgbWFuYWdlbWVudC4gIE5vdGUgdGhhdAo+ICJmb3IgZGV2aWNl
IiBhcHBsaWVzIHRvICJmb3IgdXNlcnNwYWNlIiBpbiB0aGUgc2FtZSB3YXksIGp1c3QgdGhhdAo+
IHVzZXJzcGFjZSB0aGVuIGFsc28gbmVlZHMgdG8gZm9sbG93IHRoaXMgcHJvdG9jb2wuICBTbyB0
aGUgd2hvbGUgaWRlYQo+IHRoYXQgcmFuZG9tIGRyaXZlciBjb2RlIGNhbGxzIHJhbmRvbSBsb3ct
bGV2ZWwgY2FjaGUgbWFpbnRhaW5hbmNlCj4gb3BlcmF0aW9ucyAoYW5kIHVzZSB0aGUgbm9uLXNw
ZWNpZmljIHRlcm0gZmx1c2ggdG8gbWFrZSBpdCBhbGwgbW9yZQo+IGNvbmZ1c2luZykgaXMgYSBi
YWQgaWRlYS4gIEZvcnR1bmF0ZWx5IGVub3VnaCB3ZSBoYXZlIHJlYWxseSBnb29kCj4gYXJjaCBo
ZWxwZXJzIGZvciBhbGwgbm9uLWNvaGVyZW50IGFyY2hpdGVjdHVyZXMgKHRoaXMgZXhjbHVkZXMg
dGhlCj4gbWFnaWMgaTkxNSB3b24ndCBiZSBjb3ZlcmVkIGJ5IHRoYXQsIGJ1dCB0aGF0IGlzIGEg
c2VwYXJhdGUgaXNzdWUKPiB0byBiZSBhZGRyZXNzZWQgbGF0ZXIsIGFuZCB0aGUgZmFjdCB0aGF0
IHdoaWxlIGFybTMyIGRpZCBncmV3IHRoZW0KPiB2ZXJ5IHJlY2VudGx5IGFuZCBkb2Vzbid0IGV4
cG9zZSB0aGVtIGZvciBhbGwgY29uZmlncywgd2hpY2ggaXMgZWFzaWx5Cj4gZml4YWJsZSBpZiBu
ZWVkZWQpIHdpdGggYXJjaF9zeW5jX2RtYV9mb3JfZGV2aWNlIGFuZAo+IGFyY2hfc3luY19kbWFf
Zm9yX2NwdS4gIFNvIHdoYXQgd2UgbmVlZCBpcyB0byBmaWd1cmUgb3V0IHdoZXJlIHdlCj4gaGF2
ZSB2YWxpZCBjYXNlcyBmb3IgYnVmZmVyIG93bmVyc2hpcCB0cmFuc2ZlciBvdXRzaWRlIHRoZSBE
TUEKPiBBUEksIGFuZCBidWlsZCBwcm9wZXIgd3JhcHBlcnMgYXJvdW5kIHRoZSBhYm92ZSBmdW5j
dGlvbiBmb3IgdGhhdC4KPiBNeSBndWVzcyBpcyBpdCBzaG91bGQgcHJvYmFibHkgYmUgYnVpbGQg
dG8gZ28gd2l0aCB0aGUgaW9tbXUgQVBJCj4gYXMgdGhhdCBpcyB0aGUgb25seSBvdGhlciB3YXkg
dG8gbWFwIG1lbW9yeSBmb3IgRE1BIGFjY2VzcywgYnV0Cj4gaWYgeW91IGhhdmUgYSBiZXR0ZXIg
aWRlYSBJJ2QgYmUgb3BlbiB0byBkaXNjdXNzaW9uLgoKVHlpbmcgaXQgaW4gdy8gaW9tbXUgc2Vl
bXMgYSBiaXQgd2VpcmQgdG8gbWUuLiBidXQgbWF5YmUgdGhhdCBpcyBqdXN0Cm1lLCBJJ20gY2Vy
dGFpbmx5IHdpbGxpbmcgdG8gY29uc2lkZXIgcHJvcG9zYWxzIG9yIHRvIHRyeSB0aGluZ3MgYW5k
CnNlZSBob3cgdGhleSB3b3JrIG91dC4KCkV4cG9zaW5nIHRoZSBhcmNoX3N5bmNfKiBBUEkgYW5k
IHVzaW5nIHRoYXQgZGlyZWN0bHkgKGJ5cGFzc2luZwpkcm1fY2ZsdXNoXyopIGFjdHVhbGx5IHNl
ZW1zIHByZXR0eSByZWFzb25hYmxlIGFuZCBwcmFnbWF0aWMuICBJIGRpZApoYXZlIG9uZSBkb3Vi
dCwgYXMgcGh5c190b192aXJ0KCkgaXMgb25seSB2YWxpZCBmb3Iga2VybmVsIGRpcmVjdAptYXBw
ZWQgbWVtb3J5IChBRkFJVSksIHdoYXQgaGFwcGVucyBmb3IgcGFnZXMgdGhhdCBhcmUgbm90IGlu
IGtlcm5lbApsaW5lYXIgbWFwPyAgTWF5YmUgaXQgaXMgb2sgdG8gaWdub3JlIHRob3NlIHBhZ2Vz
LCBzaW5jZSB0aGV5IHdvbid0CmhhdmUgYW4gYWxpYXNlZCBtYXBwaW5nPwoKQlIsCi1SCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
