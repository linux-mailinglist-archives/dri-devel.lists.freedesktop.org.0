Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7470223D19
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 18:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6460489269;
	Mon, 20 May 2019 16:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C34689269
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 16:20:04 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id p26so24756015edr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=KSrzh3dt8vGRx1GLhd3yv0hcGYGGYgdj29jMwPdTPyo=;
 b=HGtKFPCxoVfp7gctjRnFKGy1APE2H7b/dfFWoL2OOPsUXTZQ2OTi7MFuXpnYtvF4VU
 3uOMVmHnkuUKAP43en+I6E4ayqkumNQlmdnfPgIKlh6O8A2Wq4paQ0bUkxNK3vusAHc2
 GA/Uh3GFOZXOQR8Ol+zZUkfptf3FUiLIOCGgqhIndkkHslVnp5yFzlEDWuL/LUoPT+5r
 iIzj8+0yGf/LnoHt3WCDgfGkWZKX3NtZ2FXuQW8xUSv12b2ni8s8Z77AMv6y9BM4pIlQ
 QksB2vmSs6CB63c2rLlBgKnTG0CHFVdRQ8ZwmmJtabJQQIyrhD5Y1qkRKLxXmlmN32/M
 pnIg==
X-Gm-Message-State: APjAAAX/Ya4jYR7V/s6sSFPy6bZgXjDVXxQQN6E5iglW9W5K1jKrD6q1
 VO5i4avpfJQjKQ+jEiU9ofEmkQ==
X-Google-Smtp-Source: APXvYqwDpv00gFBm+Hge7QqAwV+moPF5WpEDAYQBH3Hgbz1pe4YNkJBMJ/G1cSK7PcP2uZiexwAPQA==
X-Received: by 2002:a50:a3b5:: with SMTP id s50mr77005198edb.149.1558369202967; 
 Mon, 20 May 2019 09:20:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id h9sm4951992edb.80.2019.05.20.09.20.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 09:20:01 -0700 (PDT)
Date: Mon, 20 May 2019 18:19:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/2] Add BO reservation to GEM VRAM
 pin/unpin/push_to_system
Message-ID: <20190520161959.GC21222@phenom.ffwll.local>
References: <20190516162746.11636-1-tzimmermann@suse.de>
 <20190517111703.j3qtk74awnnebupe@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190517111703.j3qtk74awnnebupe@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KSrzh3dt8vGRx1GLhd3yv0hcGYGGYgdj29jMwPdTPyo=;
 b=URPJu+icVm70ZncnIRWS9+vniz3rmUxjhmCwu7W4MToCzqBEsXtubl3Bkgm1tWc8Qn
 rD+hD5qQa6/zkUufit+dx40NQ3qvOXEAjKblpo4qIKcZAW7908Bjosr0KXZrSk57DjUP
 lcbmOIH4D8XzwkF/Gc8lgDqP/5VTAZXgci07c=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, z.liuxinliang@hisilicon.com,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
 zourongrong@gmail.com, sam@ravnborg.org, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDE6MTc6MDNQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiAgIEhpLAo+IAo+ID4gSXQgdHVybnMgb3V0IHRoYXQgdGhlIGJvY2hzIGFuZCB2Ym94
IGRyaXZlcnMgYXV0b21hdGljYWxseSByZXNlcnZlZCBhbmQKPiA+IHVucmVzZXJ2ZWQgdGhlIEJP
IGZyb20gd2l0aGluIHRoZWlyIHBpbiBhbmQgdW5waW4gZnVuY3Rpb25zLiBUaGUgb3RoZXIKPiA+
IGRyaXZlcnM7IGFzdCwgaGlibWMgYW5kIG1nYWcyMDA7IHBlcmZvcm1lZCByZXNlcnZhdGlvbiBl
eHBsaWNpdGx5LiBXaXRoIHRoZQo+ID4gR0VNIFZSQU0gY29udmVyc2lvbiwgYXV0b21hdGljIEJP
IHJlc2VydmF0aW9uIHdpdGhpbiBwaW4gYW5kIHVucGluIGZ1bmN0aW9ucwo+ID4gYWNjaWRlbnRh
bGx5IGdvdCBsb3N0LiBTbyBmb3IgYm9jaHMgYW5kIHZib3gsIHR0bV9ib192YWxpZGF0ZSgpIHdv
cmtlZCBvbgo+ID4gdW5sb2NrZWQgQk9zLgo+ID4gCj4gPiBUaGlzIHBhdGNoIHNldCBmaXhlcyB0
aGUgcHJvYmxlbSBieSBhZGRpbmcgYXV0b21hdGljIHJlc2VydmF0aW9uIHRvIHRoZQo+ID4gaW1w
bGVtZW50YXRpb24gb2YgZHJtX2dlbV92cmFtX3twaW4sdW5waW4scHVzaF90b19zeXN0ZW19KCkg
dG8gZml4IGJvY2hzCj4gPiBhbmQgdmJveC4gSXQgcmVtb3ZlcyBleHBsaWNpdCBCTyByZXNlcnZh
dGlvbiBhcm91bmQgdGhlIHBpbiwgdW5waW4gYW5kCj4gPiBwdXNoLXRvLXN5c3RlbSBjYWxscyBp
biB0aGUgYXN0LCBoaWJtYyBhbmQgbWdhZzIwMCBkcml2ZXJzLgo+ID4gCj4gPiBUaGUgb25seSBl
eGNlcHRpb24gaXMgdGhlIGN1cnNvciBoYW5kbGluZyBvZiBtZ2FnMjAwLiBJbiB0aGlzIGNhc2Us
IHRoZQo+ID4gbWdhZzIwMCBkcml2ZXIgbm93IGNhbGxzIGRybV9nZW1fdnJhbV97cGluLHVucGlu
fV9yZXNlcnZlZCgpLCB3aGljaCB3b3Jrcwo+ID4gd2l0aCByZXNlcnZlZCBCT3MuIFRoZSByZXNw
ZWN0aXZlIGNvZGUgc2hvdWxkIGJlIHJlZmFjdG9yZWQgaW4gYSBmdXR1cmUKPiA+IHBhdGNoIHRv
IHdvcmsgd2l0aCB0aGUgcmVndWxhciBwaW4gYW5kIHVucGluIGZ1bmN0aW9ucy4KPiAKPiBMb29r
cyBnb29kLCBwdXNoZWQgdG8gZHJtLW1pc2MtbmV4dC4KCkkgaGF2ZSBhIGJpdCBvZiBkZXNpZ24g
cmV2aWV3IChyZXBsaWVkIHRvIHBhdGNoIDEpLCB3b3VsZCBiZSBncmVhdCBpZgplaXRoZXIgb2Yg
eW91IGNvdWxkIGFkZHJlc3MgdGhhdCBhcyBhIGZvbGxvdyB1cC4KClRoYW5rcywgRGFuaWVsCi0t
IApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
