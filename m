Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0484FFB50E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 17:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8413F6ED85;
	Wed, 13 Nov 2019 16:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F8D6ED85
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 16:28:48 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n1so3080441wra.10
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 08:28:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=R9HHsTcSBWkei3DIKvirZSOv3PLv/v23ob21Tj7MuHA=;
 b=dejN6DCAmN5yZ7LrqqecEHp3c1Yh9FlG/W7JmMafRhQ+oDR2tWycUOw5DYCRuEYyuY
 IPnOFlTKyhTGVNLkNJtPmnh50eeB/XW3PIH79VAlz1uq/h6wX0dX1kkPJTyfDQb9CrMK
 7R14qAD3V/JqXXc8alKJPB3QB7GNtTIKRN6D5inBQbdIlyI8BVEL3tmWpBdYTrtSIHkv
 OVjJHjHbP4YYbzY6YWfiMSB+fpzqZRi/UVKOD6QN/9giMN84FHOZU/4CgqscnG6C8etK
 72gE6riUjwCTfy5ZeFCXFd6l0hwMNEtVPpbj8h5CknZdKBHPyMrqneWLzdX79hT4MdBO
 CzbQ==
X-Gm-Message-State: APjAAAUXcAtz0FfQAVyjAxG8NJYm6HJDRs8+nR6oYPGbVOWqTRD+7kVT
 77P5EtITK6Q7gZ36+l3AI3rx47bFBbo=
X-Google-Smtp-Source: APXvYqwj/q+bOaOf8a21qX9OiJD4bhga/z9cd+c4Hsufv705NPlxPzNVwXAX0wjPLfmsLessZZ83iQ==
X-Received: by 2002:adf:cd0a:: with SMTP id w10mr3536476wrm.4.1573662526561;
 Wed, 13 Nov 2019 08:28:46 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id u203sm2830696wme.34.2019.11.13.08.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 08:28:45 -0800 (PST)
Date: Wed, 13 Nov 2019 17:28:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191113162843.GR23790@phenom.ffwll.local>
References: <20191025073042.GL11828@phenom.ffwll.local>
 <20191108162759.GY23790@phenom.ffwll.local>
 <d2146f86-ddb8-242e-025f-d29a43682487@suse.de>
 <20191112093246.GD23790@phenom.ffwll.local>
 <06f1f400-2e20-5c40-c0ea-967f1ab2b787@suse.de>
 <20191112103819.vcuhtqpfzbkta6ml@sirius.home.kraxel.org>
 <20191112144435.GK23790@phenom.ffwll.local>
 <20191113073902.343vfunbjuzy725y@sirius.home.kraxel.org>
 <CAKMK7uF7G_H3ZvMpFkqKdGXc5H8P=vAtfoREksJJyysQmxOYzQ@mail.gmail.com>
 <CAL_JsqJmi+SE2ZufyP8tpMNNB9eqTMTJFsY5RXh5eCw30yr6GA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJmi+SE2ZufyP8tpMNNB9eqTMTJFsY5RXh5eCw30yr6GA@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=R9HHsTcSBWkei3DIKvirZSOv3PLv/v23ob21Tj7MuHA=;
 b=CEdBPdd5ZnYkhvowEjA786rZXLUTBUt1vVP10JGtYsIJFtgT4CuiQgl6cn2jfydMmi
 VPKnAf3ZeR0XInad76uqXNxfpK/dZ/VHGoAhbCmiquH91AYkD0ujcSAqjRCUXvrapZCL
 I19wm6vUkyUtaOju8Pt+JniUzkNpYHTcphOvU=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMDc6NTM6NTZBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMjoxOCBBTSBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgTm92IDEzLCAyMDE5IGF0IDg6Mzkg
QU0gR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiAg
IEhpLAo+ID4gPgo+ID4gPiA+ID4gPiA+PiBWUkFNIGhlbHBlcnMgdXNlIGRybV9nZW1fdHRtX21t
YXAoKSwgd2hpY2ggd3JhcHMgdHRtX2JvX21tYXBfb2JqKCkuCj4gPiA+ID4gPiA+ID4+IFRoZXNl
IGNoYW5nZXMgc2hvdWxkIGJlIHRyYW5zcGFyZW50Lgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gVGhlcmUncyBzdGlsbCB0aGUgaXNzdWUgdGhhdCBmb3IgZG1hLWJ1ZiBtbWFwIHZzIGRybSBt
bWFwIHlvdSB1c2UKPiA+ID4gPiA+ID4gPiBkaWZmZXJlbnQgZl9tYXBwaW5nLCB3aGljaCBtZWFu
cyB0dG0ncyBwdGUgc2hvb3Rkb3duIHdvbid0IHdvcmsgY29ycmVjdGx5Cj4gPiA+ID4gPiA+ID4g
Zm9yIGRtYS1idWYgbW1hcHMuIEJ1dCB5ZWFoIG5vcm1hbCBvcGVyYXRpb24gZm9yIHR0bS92cmFt
IGhlbHBlcnMgc2hvdWxkCj4gPiA+ID4gPiA+ID4gYmUgZmluZS4KPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gVlJBTSBoZWxwZXJzIGRvbid0IHN1cHBvcnQgZG1hYnVmcy4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiBJdCdzIG5vdCB0aGF0IHNpbXBsZS4gIEV2ZW4gd2hlbiBub3Qgc3VwcG9ydGluZyBkbWEt
YnVmIGV4cG9ydCBhbmQKPiA+ID4gPiA+IGltcG9ydCBpdCBpcyBzdGlsbCBwb3NzaWJsZSB0byBj
cmVhdGUgZG1hLWJ1ZnMsIGltcG9ydCB0aGVtIGludG8gdGhlCj4gPiA+ID4gPiBzYW1lIGRyaXZl
ciAod2hpY2ggZG9lc24ndCBhY3R1YWxseSBleHBvcnQraW1wb3J0IGJ1dCBqdXN0IGdyYWJzIGEg
Z2VtCj4gPiA+ID4gPiBvYmplY3QgcmVmZXJlbmNlIGluc3RlYWQpIGFuZCBhbHNvIHRvIG1tYXAg
dGhlbSB2aWEgcHJpbWUvZG1hLWJ1ZiBjb2RlCj4gPiA+ID4gPiBwYXRoIC4uLgo+ID4gPgo+ID4g
PiAuLi4gYnV0IGFmdGVyIGxvb2tpbmcgYWdhaW4gSSB0aGluayB3ZSBhcmUgYWxsIGdyZWVuIGhl
cmUuICBHaXZlbiB0aGF0Cj4gPiA+IG9ubHkgc2VsZi1pbXBvcnQgd29ya3Mgd2UnbGwgb25seSBz
ZWUgdnJhbSBnZW0gb2JqZWN0cyBpbiB0aGUgbW1hcCBjb2RlCj4gPiA+IHBhdGgsIHdoaWNoIHNo
b3VsZCBoYXZlIGV2ZXJ5dGhpbmcgc2V0IHVwIGNvcnJlY3RseS4gIFNhbWUgZ29lcyBmb3IgcXhs
Lgo+ID4gPgo+ID4gPiBBbGwgb3RoZXIgdHRtIGRyaXZlcnMgc3RpbGwgdXNlIHRoZSBvbGQgbW1h
cCBjb2RlIHBhdGgsIHNvIGFsbCBncmVlbgo+ID4gPiB0aGVyZSB0b28gSSB0aGluay4gIEFsc28g
SSBzb21laG93IGRvdWJ0IGRtYS1idWYgbW1hcCB2cy4gZHJtIG1tYXAgZW5kcwo+ID4gPiB1cCB1
c2luZyBkaWZmZXJlbnQgZl9tYXBwaW5nLCB0dG0gY29kZSBoYXMgYSBXQVJOX09OIGluIHR0bV9i
b192bV9vcGVuKCkKPiA+ID4gd2hpY2ggd291bGQgZmlyZSBzaG91bGQgdGhhdCBiZSB0aGUgY2Fz
ZS4KPiA+ID4KPiA+ID4gRG8gaW1wb3J0ZWQgZG1hLWJ1ZnMgaGl0IHRoZSBkcm0gbW1hcCBjb2Rl
IHBhdGggaW4gdGhlIGZpcnN0IHBsYWNlPwo+ID4gPiBXb3VsZG4ndCBtbWFwIGJlIGhhbmRsZWQg
YnkgdGhlIGV4cG9ydGluZyBkcml2ZXI/Cj4gPgo+ID4gZHJtX2dlbV9kbWFidWZfbW1hcCAtPiBv
YmotPmZ1bmNzLT5tbWFwIC0+IHR0bV9ib19tbWFwX29iago+ID4KPiA+IEFuZCBJJ20gbm90IHNl
ZWluZyBhbnlvbmUgYWRqdXN0aW5nIHZtX2ZpbGUtPmZfbWFwcGluZyBhbnl3aGVyZSBoZXJlIGF0
IGFsbC4KPiA+Cj4gPiBOb3RlIHRvIGhpdCB0aGlzIHlvdSBuZWVkIHVzZXJzcGFjZSB0bwo+ID4g
LSBoYW5kbGUyZmQgb24gYSBidWZmZXIgdG8gY3JlYXRlIGEgZG1hLWJ1ZiBmZAo+ID4gLSBjYWxs
IG1tYXAgZGlyZWN0bHkgb24gdGhhdCBkbWEtYnVmIGZkCj4gCj4gVGhhdCB3YXMgZXhhY3RseSB0
aGUgdmdlbSBJR1QgdGVzdCB0aGF0IHByb21wdGVkICRzdWJqZWN0IGZpeC4gKFdpdGgKPiB2Z2Vt
IG1vZGlmaWVkIHRvIHVzZSBzaG1lbSBoZWxwZXJzKQoKU2VlIG15IG90aGVyIG1haWwsIHRoaXMg
b25seSBoaXRzIHRoZSByaWdodCBtbWFwIHBhdGhzLiBGb3IgdGhlIHVubWFwIHNpZGUKeW91IG5l
ZWQgZXZlbiBtb3JlIChhbmQgdGhhdCBwYXJ0IGlzIGRyaXZlciBkZXBlbmRlbnQsIGFuZCB2Z2Vt
IHdvdWxkIG5lZWQKc29tZSBkZWJ1ZyB0cmlja3MgdG8gZXhwb3NlIHRoYXQgZm9yIHRlc3Rpbmcp
LgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
