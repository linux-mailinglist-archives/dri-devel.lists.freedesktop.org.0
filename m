Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B140FE144
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 16:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980146E855;
	Fri, 15 Nov 2019 15:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BE66E855
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 15:31:31 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id m15so8326572otq.7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 07:31:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YeHu9XWL+ayT9q216TM5I+naDHU6SISXAVmPrQ30i4c=;
 b=YzGU7HQ0wV8LUlJVYmiFsFrFtoNRb88kXUvAGxVdamWGz4tOhW1UaUVPsACfYbfBRf
 VruMnrVtmdALltC2eBjsbWHnHnVKNeVG3kOXH88a4Lkq09vx50Cf20p7bteVR4LRKAzn
 Ukpaik7KlTxQ0qdO2cK9cMHVZOgcyuJdW+s31qKX1UXLKs/3/YEj8kdQi+fS1Dx6vZxT
 1OjjIncxd7NmANnzn32Xpp7L3E0irw6Pv5cLek08jtcPBf+40w39zYsX40xDHsApZWdI
 hEcrZe3pJlnb0+0fIemJHD7o8zY/f/b3JvUiDiD8Tw6tZ6XZxJ4cWwPuNaVgfZ5cS0SX
 gq7w==
X-Gm-Message-State: APjAAAXHtXSP6N9gYGXF0R9qmReSuCowssn8IXvbAYyMlVsIAoJfVqTV
 lVxtLsGkAF/0AVRoSDalg9/7AYqU3uewRTmsBNK4Gw==
X-Google-Smtp-Source: APXvYqy+//3N+h9o7FkUlDxVqGJ7Ui/8XyeKNBk4e/92T/nnm6eRlVC6nCIMVSaSMnkUodF0sm9gr4mjhyXjU3g+BtE=
X-Received: by 2002:a05:6830:1649:: with SMTP id
 h9mr4481115otr.281.1573831890530; 
 Fri, 15 Nov 2019 07:31:30 -0800 (PST)
MIME-Version: 1.0
References: <20191112093246.GD23790@phenom.ffwll.local>
 <06f1f400-2e20-5c40-c0ea-967f1ab2b787@suse.de>
 <20191112103819.vcuhtqpfzbkta6ml@sirius.home.kraxel.org>
 <20191112144435.GK23790@phenom.ffwll.local>
 <20191113073902.343vfunbjuzy725y@sirius.home.kraxel.org>
 <CAKMK7uF7G_H3ZvMpFkqKdGXc5H8P=vAtfoREksJJyysQmxOYzQ@mail.gmail.com>
 <20191113135145.itdsbojzrj5elzvu@sirius.home.kraxel.org>
 <20191113162729.GQ23790@phenom.ffwll.local>
 <20191115093738.kdi4qopah6hvntrb@sirius.home.kraxel.org>
 <CAKMK7uGq7-SpFrEXE2OJhnv66vxtJSifvSg4NUTFhLentQJ31w@mail.gmail.com>
 <20191115105601.i7ahtapysv4j7mn7@sirius.home.kraxel.org>
In-Reply-To: <20191115105601.i7ahtapysv4j7mn7@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 15 Nov 2019 16:31:18 +0100
Message-ID: <CAKMK7uHNOF5pAWCbQ1-eFWcxEOZmOoKOYL450ZJd7TOeVhMvjw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YeHu9XWL+ayT9q216TM5I+naDHU6SISXAVmPrQ30i4c=;
 b=GK3K3m/F6q7Vu27BvcZX4ISsfPILPSUAKU+/JHVELQtKyR4z3qQa2aFrHwMH09l61p
 /9+kDQtFl43p157McmphCijEOT4QG/hlXYAB23elopiayeoN6YxBtf0IO/cr9tETC9Pd
 AselbcvKLVnJRKXfN+XXW1HIMk9PaTNQOVz58=
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

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMTE6NTYgQU0gR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMTE6MTg6MjhBTSAr
MDEwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIEZyaSwgTm92IDE1LCAyMDE5IGF0IDEw
OjM3IEFNIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4KPiA+
ID4gPiBZb3UgbmVlZCBtZW1vcnkgcHJlc3N1cmUsIHRvIGZvcmNlIHR0bSB0byB1bm1hcCB0aGUg
Ym8sIG5vdCB1c2Vyc3BhY2UuIFNvCj4gPiA+ID4gcm91Z2hseQo+ID4gPiA+IDEuIGNyZWF0ZSBi
bwo+ID4gPiA+IDIuIG1tYXAgaXQgdGhyb3VnaCBkcm0gZmQsIHdyaXRlIHNvbWUgc3R1ZmYKPiA+
ID4gPiAzLiBleHBvcnQgdG8gZG1hLWJ1ZiwgbW1hcCBpdCwgdmVyaWZ5IHN0dWZmIGlzIHRoZXJl
Cj4gPiA+ID4gNC4gY3JlYXRlIGEgcGlsZSBtb3JlIGJvLCBtbWFwIHRoZW0gd3JpdGUgdG8gdGhl
bQo+ID4gPiA+IDUuIG9uY2UgeW91J3ZlIHRocmFzaGVkIGFsbCBvZiB2cmFtIGVub3VnaCwgcmVj
aGVjayB5b3VyIG9yaWdpbmFsIGJvLiBJZgo+ID4gPiA+IEknbSByaWdodCB5b3Ugc2hvdWxkIGdl
dCB0aGUgZm9sbG93aW5nOgo+ID4gPiA+ICAgIC0gZHJtIGZkIG1tYXAgc3RpbGwgc2hvdyByaWdo
dCBjb250ZW50Cj4gPiA+ID4gICAgLSBkbWEtYnVmIGZkIG1tYXAgc2hvd3MgcmFuZG9tIGNyYXAg
dGhhdCB5b3UndmUgd3JpdHRlbiBpbnRvIG90aGVyCj4gPiA+ID4gICAgICBidWZmZXJzCj4gPiA+
ID4KPiA+ID4gPiBPZmMgeW91IG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgYW4gbW1hcCBhY3R1YWxs
eSBmb3JjZXMgdGhlIGJ1ZmZlciBpbnRvCj4gPiA+ID4gdnJhbS4gU28gbWlnaHQgbmVlZCBhIGNv
bWJvIG9mIG1vZGVzZXQrbW1hcCwgdG8gbWFrZSB0aGF0IGhhcHBlbi4gUGxhaW4KPiA+ID4gPiBt
bWFwIG1pZ2h0IGp1c3QgZ2l2ZSB5b3UgcHRlcyB0aGF0IHBvaW50IGludG8gc3lzdGVtIG1lbW9y
eSwgd2hpY2ggaXMgbm90Cj4gPiA+ID4gbWFuYWdlZCBieSB0dG0gbGlrZSB2cmFtLgo+ID4gPgo+
ID4gPiBJcyBhbnkgbW92ZSBidWZmZXIgZ29vZCBlbm91Z2ggdG8gdHJpZ2dlciB0aGlzLCBpLmUu
IHdpbGwgU1lTVEVNIC0+IFZSQU0KPiA+ID4gd29yayB0b28/ICBUaGF0J2xsIGJlIGVhc2llciBi
ZWNhdXNlIGFsbCBJIG5lZWQgdG8gZG8gaXMgbWFwIHRoZSBidWZmZXIKPiA+ID4gdG8gYSBjcnRj
IHRvIGZvcmNlIHBpbm5pbmcgdG8gdnJhbSwgdGhlbiBjaGVjayBpZiB0aGUgbWFwcGluZ3MgYXJl
Cj4gPiA+IGludGFjdCBzdGlsbCAuLi4KPiA+Cj4gPiBJIHRoaW5rIHRoYXQgc2hvdWxkIHdvcmsg
dG9vLgo+Cj4gU2VlbXMgdG8gd29yayBvayBmb3IgdHRtL3ZyYW0uCj4KPiBUZXN0IGNvZGU6Cj4g
ICBodHRwczovL2dpdC5rcmF4ZWwub3JnL2NnaXQvZHJtaW5mby9jb21taXQvP2lkPWE5ZWI5NjUw
NGRjMTczNzZlMDdiNWM2ZWRmNTI5NmI0MWE0OGJiZmUKCkkgdGhpbmsgdGhhdCdzIG5vdCBuYXN0
eSBlbm91Z2guIElmIHRoZSBtYXBwaW5ncyBhcmVuJ3QgdXBkYXRlZCwgdGhlbgp5b3UnbGwgc3Rp
bGwgc2VlIHRoZSB0aGUgc2FtZSBvbGQgcGFnZXMgd2l0aCB0aGUgcmlnaHQgY29udGVudHMuIFlv
dQpuZWVkIHRvIGNoYW5nZSB0aGVtIHNvbWVob3cgYWZ0ZXIgdGhleSBtaWdyYXRlZCAod2l0aCB2
cmFtIGV2aWN0aW9uCnRoYXQgaGFwcGVucyBhdXRvbWF0aWNhbGx5IHNpbmNlIHRoZXJlJ2xsIGIg
YW5vdGhlciBvYmplY3QgaW4gdGhlIHNhbWUKc3BvdCwgZm9yIHN5c3RlbSBtZW1vcnkgSSB0aGlu
ayB5b3UgbmVlZCB0aGUgc2hyaW5rZXIgdG8ga2ljayBpbiBhbmQKZnJlZSB0aGUgcGFnZXMgZmly
c3QpLiBFYXNpZXN0IHByb2JhYmx5IHRvIHdhaXQgZm9yIGEga2V5IHByZXNzIHNvIHlvdQpjYW4g
YXBwcmVjaWF0ZSB0aGUgY29sb3IsIHRoZW4gd3JpdGUgYSBkaWZmZXJlbnQgY29sb3IgKGZ1bGwg
c2NyZWVuKQp3aGVuIHRoZSBidWZmZXIgaXMgaW4gdnJhbS4KCj4gPiBKdXN0IG1ha2Ugc3VyZSB5
b3UgYWN0dWFsbHkgd3JpdGUKPiA+IHRocm91Z2ggU1lTVEVNIGZpcnN0IChtYXliZSB3aXRoIHNv
bWUgcHJpbnRrIG9yIHdoYXRldmVyKS4KPgo+IFRoYXQgd29ya3MgZmluZS4gIFNwcmlua2xlZCAu
Li4KPgo+ICAgICAgICAgc3lzdGVtKCJjYXQgL3N5cy9rZXJuZWwvZGVidWcvZHJpLzAvdnJhbS1t
bSIpOwo+Cj4gLi4uIGludG8gdGhlIHRlc3QgY29kZSwgYW5kIGRybU1vZGVTZXRDcnRjKCkgaW5k
ZWVkIG1ha2VzIHRoZSBnZW0gb2JqZWN0IHNob3cKPiB1cCB0aGVyZS4KCllvdSdkIG5lZWQgdG8g
Y2hlY2sgdGhlIHB0ZXMgdGhlbXNlbHZlcy4gV2hpY2ggSSB0aGluayBub3QgZXZlbiBwcm9jCnNo
b3dzIGJ5IGRlZmF1bHQgKG9ubHkgdGhlIGZpbGUgdGhhdCdzIHN1cHBvc2VkIHRvIGJlIG1hcHBl
ZCkuIEJ1dApnb29kIHRvIGNvbmZpcm0gdGhhdCB0aGUgYnVmZmVyIG1vdmVkIGF0IGxlYXN0Lgot
RGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
