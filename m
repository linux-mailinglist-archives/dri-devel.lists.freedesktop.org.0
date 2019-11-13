Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E81FB50A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 17:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0936D89854;
	Wed, 13 Nov 2019 16:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3482689854
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 16:27:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b18so1612746wrj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 08:27:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=7KyEr5O2iKOeSo0zWwiLGs9eS/KZNXkRCtZGck0XBZ4=;
 b=FVm6Ybew4WwBsstb29UxMcFbq1zvT4v2vfw3kdR8lRSRCDs8Ke8h2lPt7zfjBX6zTB
 b6DQyLhs/ApiFczTng5su4dkzZDiJPiJYn0G/IUwse+0ZSKqWidgQYEEUGEFEEeG9cwt
 DQDf2l/SqzFwQz1gU7FYTvJ7PHmWXNuKkHjF6W9Rl7c1icKYjBYOkiPhkYj+VTdYr+7M
 Tv8V/LlkqJhAjyYETrohORRuDgDDTIOpzXAxs0qIUmppQjW+zTkYT4+lEpdSNo5YPSvk
 WxSDjbbwhg2TLCcYpnlxqdxSCSgEvSV66Cb5nWQkjLHaBcxCH+RMVUTnyFHxThr0RqTp
 RvEw==
X-Gm-Message-State: APjAAAVvZTFNrvFNJcgF4BN+2kgHadgOFZMPAqAONIkdkkNSfcp0nnUO
 PyX6YK1ng+Ddy9aWbwRLov/L6A==
X-Google-Smtp-Source: APXvYqzmTMu685CFV6oEWoRU5+rkNjM3VBsZWuy5ZMXqQ3HDvnaUhLvaQg9t/f08IEz8EpWplKbK2Q==
X-Received: by 2002:a5d:54c4:: with SMTP id x4mr3689731wrv.247.1573662452764; 
 Wed, 13 Nov 2019 08:27:32 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id u16sm3612740wrr.65.2019.11.13.08.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 08:27:31 -0800 (PST)
Date: Wed, 13 Nov 2019 17:27:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191113162729.GQ23790@phenom.ffwll.local>
References: <20191025073042.GL11828@phenom.ffwll.local>
 <20191108162759.GY23790@phenom.ffwll.local>
 <d2146f86-ddb8-242e-025f-d29a43682487@suse.de>
 <20191112093246.GD23790@phenom.ffwll.local>
 <06f1f400-2e20-5c40-c0ea-967f1ab2b787@suse.de>
 <20191112103819.vcuhtqpfzbkta6ml@sirius.home.kraxel.org>
 <20191112144435.GK23790@phenom.ffwll.local>
 <20191113073902.343vfunbjuzy725y@sirius.home.kraxel.org>
 <CAKMK7uF7G_H3ZvMpFkqKdGXc5H8P=vAtfoREksJJyysQmxOYzQ@mail.gmail.com>
 <20191113135145.itdsbojzrj5elzvu@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113135145.itdsbojzrj5elzvu@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7KyEr5O2iKOeSo0zWwiLGs9eS/KZNXkRCtZGck0XBZ4=;
 b=jAeMLXbuvZGYLY2kjS18hZrTVqYn2MSV5I57yzbdEsZbh8gonOrwlZRBtCtwGDaXs0
 PAjTEpI67fzUYpaCtT+eWgPHmMAn4VCnBj6EkhYBPQQQmB67bZTrNXKJB9KcJrnfAiZ6
 v45b6ERZySAons8pJRNJkywa7kepohlrCmYgM=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMDI6NTE6NDVQTSArMDEwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiAgIEhpLAo+IAo+ID4gPiAuLi4gYnV0IGFmdGVyIGxvb2tpbmcgYWdhaW4gSSB0aGlu
ayB3ZSBhcmUgYWxsIGdyZWVuIGhlcmUuICBHaXZlbiB0aGF0Cj4gPiA+IG9ubHkgc2VsZi1pbXBv
cnQgd29ya3Mgd2UnbGwgb25seSBzZWUgdnJhbSBnZW0gb2JqZWN0cyBpbiB0aGUgbW1hcCBjb2Rl
Cj4gPiA+IHBhdGgsIHdoaWNoIHNob3VsZCBoYXZlIGV2ZXJ5dGhpbmcgc2V0IHVwIGNvcnJlY3Rs
eS4gIFNhbWUgZ29lcyBmb3IgcXhsLgo+ID4gPgo+ID4gPiBBbGwgb3RoZXIgdHRtIGRyaXZlcnMg
c3RpbGwgdXNlIHRoZSBvbGQgbW1hcCBjb2RlIHBhdGgsIHNvIGFsbCBncmVlbgo+ID4gPiB0aGVy
ZSB0b28gSSB0aGluay4gIEFsc28gSSBzb21laG93IGRvdWJ0IGRtYS1idWYgbW1hcCB2cy4gZHJt
IG1tYXAgZW5kcwo+ID4gPiB1cCB1c2luZyBkaWZmZXJlbnQgZl9tYXBwaW5nLCB0dG0gY29kZSBo
YXMgYSBXQVJOX09OIGluIHR0bV9ib192bV9vcGVuKCkKPiA+ID4gd2hpY2ggd291bGQgZmlyZSBz
aG91bGQgdGhhdCBiZSB0aGUgY2FzZS4KPiA+ID4KPiA+ID4gRG8gaW1wb3J0ZWQgZG1hLWJ1ZnMg
aGl0IHRoZSBkcm0gbW1hcCBjb2RlIHBhdGggaW4gdGhlIGZpcnN0IHBsYWNlPwo+ID4gPiBXb3Vs
ZG4ndCBtbWFwIGJlIGhhbmRsZWQgYnkgdGhlIGV4cG9ydGluZyBkcml2ZXI/Cj4gPiAKPiA+IGRy
bV9nZW1fZG1hYnVmX21tYXAgLT4gb2JqLT5mdW5jcy0+bW1hcCAtPiB0dG1fYm9fbW1hcF9vYmoK
PiA+IAo+ID4gQW5kIEknbSBub3Qgc2VlaW5nIGFueW9uZSBhZGp1c3Rpbmcgdm1fZmlsZS0+Zl9t
YXBwaW5nIGFueXdoZXJlIGhlcmUgYXQgYWxsLgo+IAo+IFsgc29tZSBtb3JlIGNvZGUgYnJvd3Np
bmcgXQo+IAo+IE9rLCBJIHNlZS4gIGRtYS1idWZzIGdldCB0aGVpciBvd24gZmlsZSwgdGhlaXIg
b3duIGFub24gaW5vZGUgYW5kCj4gdGhlcmVieSB0aGVpciBvd24gYWRkcmVzcyBzcGFjZS4gIFNv
IHRoYXQgaXQgdXNlZCB3aGVuIG1tYXBpbmcgdGhlCj4gZG1hLWJ1Zi4KPiAKPiBkcm0gZmlsZWhh
bmRsZSdzIGdldCB0aGUgc2hhcmVkIGFkZHJlc3Mgc3BhY2UgaW5zdGVhZCwgZHJtX29wZW4oKSBz
ZXRzCj4gaXQuCj4gCj4gU28sIHllcywgSSBzZWUgdGhlIHByb2JsZW0uICBJdCdzIG5vdCBuZXcg
dGhvdWdoLCBhcyBmYXIgSSBjYW4gc2VlIHRoZQo+IG9sZCBkbWEtYnVmIG1tYXAgY29kZSBwYXRo
IGRvZXNuJ3QgYWRqdXN0IGZfbWFwcGluZyBhbnl3aGVyZSBlaXRoZXIgLi4uCj4gCj4gPiBOb3Rl
IHRvIGhpdCB0aGlzIHlvdSBuZWVkIHVzZXJzcGFjZSB0bwo+ID4gLSBoYW5kbGUyZmQgb24gYSBi
dWZmZXIgdG8gY3JlYXRlIGEgZG1hLWJ1ZiBmZAo+ID4gLSBjYWxsIG1tYXAgZGlyZWN0bHkgb24g
dGhhdCBkbWEtYnVmIGZkCj4gCj4gSG1tLCBzZWVtcyBmb3IgaGFuZGxlMmZkIEkgbmVlZCBhIGR1
bW15IGdlbV9wcmltZV9nZXRfc2dfdGFibGUgZnVuY3Rpb24KPiB3aXJlZCB1cCBldmVuIHdoZW4g
bm90IGFjdHVhbGx5IGV4cG9ydGluZy9pbXBvcnRpbmcgYW55dGhpbmcuICBTbyBJCj4gdGhpbmsg
bmVpdGhlciBxeGwgbm9yIGFueSBvZiB0aGUgdnJhbSBkcml2ZXJzIGFsbG93IHRvIHRyaWdnZXIg
dGhhdCAoYW5kCj4gbm8gb3RoZXIgdHRtIGRyaXZlciB1c2VzIHRoZSBuZXcgdHRtIG1tYXAgY29k
ZSB5ZXQpLgo+IAo+IFNvLCAkc3ViamVjdCBwYXRjaCBzaG91bGQgbm90IG1ha2UgdGhpbmdzIHdv
cnNlIGluIHR0bSBsYW5kLgo+IAo+IFdoZW4gaGFja2luZyB0aGUgYm9jaHMgZHJpdmVyIHRvIGhh
dmUgZXhwb3J0IGNhbGxiYWNrcyAod2l0aG91dAo+IHN1cHBvcnRpbmcgYWN0dWFsIGV4cG9ydHMp
IGhhbmRsZTJmZCArIG1tYXAoKSBjYWxsYmFjayB3b3JrcyBmaW5lLgo+IERpZG4ndCB2ZXJpZnkg
eWV0IEkgYWN0dWFsbHkgZ2V0IHRoZSBjb3JyZWN0IHBhZ2VzIG1hcHBlZC4gIEJ1dCBtYXliZQo+
IG1tYXAoKSBpc24ndCB0aGUgcHJvYmxlbSB3aGVuIHRoZSBjb3JyZWN0IGFkZHJlc3Mgc3BhY2Ug
aXMgaW1wb3J0YW50IGZvcgo+IHVubWFwIG9ubHkuCj4gCj4gSXMgdGhlcmUgYSBnb29kIHRlc3Qg
Y2FzZT8KCllvdSBuZWVkIG1lbW9yeSBwcmVzc3VyZSwgdG8gZm9yY2UgdHRtIHRvIHVubWFwIHRo
ZSBibywgbm90IHVzZXJzcGFjZS4gU28Kcm91Z2hseQoxLiBjcmVhdGUgYm8KMi4gbW1hcCBpdCB0
aHJvdWdoIGRybSBmZCwgd3JpdGUgc29tZSBzdHVmZgozLiBleHBvcnQgdG8gZG1hLWJ1ZiwgbW1h
cCBpdCwgdmVyaWZ5IHN0dWZmIGlzIHRoZXJlCjQuIGNyZWF0ZSBhIHBpbGUgbW9yZSBibywgbW1h
cCB0aGVtIHdyaXRlIHRvIHRoZW0KNS4gb25jZSB5b3UndmUgdGhyYXNoZWQgYWxsIG9mIHZyYW0g
ZW5vdWdoLCByZWNoZWNrIHlvdXIgb3JpZ2luYWwgYm8uIElmCkknbSByaWdodCB5b3Ugc2hvdWxk
IGdldCB0aGUgZm9sbG93aW5nOgogICAtIGRybSBmZCBtbWFwIHN0aWxsIHNob3cgcmlnaHQgY29u
dGVudAogICAtIGRtYS1idWYgZmQgbW1hcCBzaG93cyByYW5kb20gY3JhcCB0aGF0IHlvdSd2ZSB3
cml0dGVuIGludG8gb3RoZXIKICAgICBidWZmZXJzCgpPZmMgeW91IG5lZWQgdG8gbWFrZSBzdXJl
IHRoYXQgYW4gbW1hcCBhY3R1YWxseSBmb3JjZXMgdGhlIGJ1ZmZlciBpbnRvCnZyYW0uIFNvIG1p
Z2h0IG5lZWQgYSBjb21ibyBvZiBtb2Rlc2V0K21tYXAsIHRvIG1ha2UgdGhhdCBoYXBwZW4uIFBs
YWluCm1tYXAgbWlnaHQganVzdCBnaXZlIHlvdSBwdGVzIHRoYXQgcG9pbnQgaW50byBzeXN0ZW0g
bWVtb3J5LCB3aGljaCBpcyBub3QKbWFuYWdlZCBieSB0dG0gbGlrZSB2cmFtLgoKbXVubWFwIGNh
bGxlZCBieSB1c2Vyc3BhY2UgaXNuJ3QgYSBwcm9ibGVtLCBzaW5jZSB0aGF0IHN0YXJ0cyBmcm9t
IHRoZQpyaWdodCBzdHJ1Y3QgbW1fc3RydWN0LiBJdCdzIHdoZW4geW91IHN0YXJ0IHdpdGggdGhl
IG9iamVjdCAoaS5lLiBpbiB0aGUKZHJpdmVyKSwgYW5kIG5lZWQgdG8gZmlndXJlIG91dCB3aGVy
ZSBhbGwgdGhlIHZhcmlvdXMgdm1hIHRoYXQgbW1hcCBpdCBhcmUKd2hlcmUgdGhpcyBtYXR0ZXJz
LgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
