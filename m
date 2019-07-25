Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1824A74F01
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 15:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5522F6E750;
	Thu, 25 Jul 2019 13:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2586E753
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 13:18:37 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k8so50184057edr.11
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 06:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=EybCq2BZwZOOdm05Tj1kvi7vew6SM4gUFISBfZCS31U=;
 b=oqBTQ/RoxwdmhufMe+UuCIyI6xMDzBcl1Ydrt3P5VWANYOUGp0glXCEAGrqZcrzNQ9
 wotDGG3gkp5DnXFmy5AD+TBWercS5GdQ7Dyvr9SkdOJcO5UMbXIEF5E/OHEtAkxKxfoi
 AJjkCNKRZQg9LdhmvdraznVM4Dx8D7A2mlqXxksukiSBpqnCVGva8TFNWxFYclScXTX+
 6AMjovfxbmZA9V21hAG518YS0/3SCp8N4XfXcfuoTzqosIyPtXzvgNTy7vbElD9Zyrjj
 mVt2CrtHADj9KkjHdOijOEoosiglC8K7YLRLiQZAkqmPoc3/UY/Euwqu0CMFgHOP9ojd
 nSaQ==
X-Gm-Message-State: APjAAAUF427lyXt3A+gNrLhajEDS9A5O/4mLb5tgckfRQ+GG7GPnIQaR
 8Ap1eV55LNZMG402l5dBeP8=
X-Google-Smtp-Source: APXvYqywk9joM4ST3SX75PKrwWozcuJWgWpnp3GpmWE4NgS3Zoa/QvE5QwSdx0UymNIcIF+SoYW6dQ==
X-Received: by 2002:a50:97ac:: with SMTP id e41mr77082703edb.27.1564060715988; 
 Thu, 25 Jul 2019 06:18:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id u22sm9730597eja.56.2019.07.25.06.18.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 06:18:35 -0700 (PDT)
Date: Thu, 25 Jul 2019 15:18:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 4/7] drm/radeon: Fill out gem_object->resv
Message-ID: <20190725131832.GG15868@phenom.ffwll.local>
References: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
 <20190625204208.5614-5-daniel.vetter@ffwll.ch>
 <20190625205217.GC19279@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625205217.GC19279@ravnborg.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EybCq2BZwZOOdm05Tj1kvi7vew6SM4gUFISBfZCS31U=;
 b=Zq2QVpfHilOZRQolhEJ3f6oWaKxp02A041eb4VmYdhu0b5GRhYQ2kg6T0GIbrF1B4n
 TRfZmUmti+MDm3szAdUyZ9PaFz/MpeJJa8brxhiQfSyMnUJVviCqVtEU9N5NRg0ErBA0
 hnsZq0spPNTAS0DmWgY6YQHeI+O5c8aBB268w=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTA6NTI6MTdQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDEwOjQyOjA1UE0gKzAyMDAsIERhbmllbCBW
ZXR0ZXIgd3JvdGU6Cj4gPiBUaGF0IHdheSB3ZSBjYW4gZGl0Y2ggb3VyIGdlbV9wcmltZV9yZXNf
b2JqIGltcGxlbWVudGF0aW9uLiBTaW5jZSB0dG0KPiA+IGFic29sdXRlbHkgbmVlZHMgdGhlIHJp
Z2h0IHJlc2VydmF0aW9uIG9iamVjdCBhbGwgdGhlIGJvaWxlcnBsYXRlIGlzCj4gPiBhbHJlYWR5
IHRoZXJlIGFuZCB3ZSBqdXN0IGhhdmUgdG8gd2lyZSBpdCB1cCBjb3JyZWN0bHkuCj4gPiAKPiA+
IE5vdGUgdGhhdCBnZW0vcHJpbWUgZG9lc24ndCBjYXJlIHdoZW4gd2UgZG8gdGhpcywgYXMgbG9u
ZyBhcyB3ZSBkbyBpdAo+ID4gYmVmb3JlIHRoZSBibyBpcyByZWdpc3RlcmVkIGFuZCBzb21lb25l
IGNhbiBjYWxsIHRoZSBoYW5kbGUyZmQgaW9jdGwKPiA+IG9uIGl0Lgo+ID4gCj4gPiBBc2lkZTog
dHRtX2J1ZmZlcl9vYmplY3QudHRtX3Jlc3YgY291bGQgcHJvYmFibHkgYmUgZGl0Y2hlZCBpbiBm
YXZvdXIKPiA+IG9mIGFsd2F5cyBwYXNzaW5nIGEgbm9uLU5VTEwgcmVzdiB0byB0dG1fYm9faW5p
dCgpLiBBdCBsZWFzdCBmb3IgZ2VtCj4gPiBkcml2ZXJzIHRoYXQgd291bGQgYXZvaWQgaGF2aW5n
IHR3byBvZiB0aGVzZSwgb24gaW4gdHRtX2J1ZmZlcl9vYmplY3QKPiA+IGFuZCB0aGUgb3RoZXIg
aW4gZHJtX2dlbV9vYmplY3QsIG9uZSBqdXN0IHRoZXJlIGZvciBjb25mdXNpb24uCj4gU29tZXRo
aW5nIGZvciB0b2RvLnJzdCAtIHNvIHRoaXMgZG9lcyBub3QgZ2V0IGxvc3QgaW4gYSBjaGFuZ2Vs
b2cKPiBwZW9wbGUgd2lsbCBzb29uIGZvcmdldD8KCkdlcmQgYWxyZWFkeSBoYXMgYSBuaWNlIHBh
dGNoIHNlcmllcyAocmViYXNlZCBvbnRvIHRoaXMgb25lKSwgc28gSSBkb24ndAp0aGluayB3ZSBu
ZWVkIGEgdG9kby5yc3QgZm9yIHRoaXMuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
