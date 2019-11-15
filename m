Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2056DFDBCB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 11:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE136E41B;
	Fri, 15 Nov 2019 10:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FD96E41B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 10:56:10 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-Ys9ua8kxMVWWp6LE8a9YjQ-1; Fri, 15 Nov 2019 05:56:04 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E1A38048E5;
 Fri, 15 Nov 2019 10:56:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC7F85D6BE;
 Fri, 15 Nov 2019 10:56:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DA06C17536; Fri, 15 Nov 2019 11:56:01 +0100 (CET)
Date: Fri, 15 Nov 2019 11:56:01 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191115105601.i7ahtapysv4j7mn7@sirius.home.kraxel.org>
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
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGq7-SpFrEXE2OJhnv66vxtJSifvSg4NUTFhLentQJ31w@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: Ys9ua8kxMVWWp6LE8a9YjQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573815369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iHPva1BGkcv/Hkhj6Zy8z3aVbHcuf37MrbBmg/322r4=;
 b=ECO2utL38hj9SHCSJIBJ4LMn04WtkQypiFE7ZuoIIwPFjnBErF5hnpJ5Mlco1k+ir7eLVX
 zrBee5yK8H+YyUM7zDNb6Tqh2FrdeamFFLT59XhzTjhh9OSi8HezN6kbM+D0FUvnZsqjyQ
 mXtultHJt31p6L9JXDVNaOnyK28m0Vw=
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

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMTE6MTg6MjhBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIE5vdiAxNSwgMjAxOSBhdCAxMDozNyBBTSBHZXJkIEhvZmZtYW5uIDxr
cmF4ZWxAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gPiBZb3UgbmVlZCBtZW1vcnkgcHJlc3N1
cmUsIHRvIGZvcmNlIHR0bSB0byB1bm1hcCB0aGUgYm8sIG5vdCB1c2Vyc3BhY2UuIFNvCj4gPiA+
IHJvdWdobHkKPiA+ID4gMS4gY3JlYXRlIGJvCj4gPiA+IDIuIG1tYXAgaXQgdGhyb3VnaCBkcm0g
ZmQsIHdyaXRlIHNvbWUgc3R1ZmYKPiA+ID4gMy4gZXhwb3J0IHRvIGRtYS1idWYsIG1tYXAgaXQs
IHZlcmlmeSBzdHVmZiBpcyB0aGVyZQo+ID4gPiA0LiBjcmVhdGUgYSBwaWxlIG1vcmUgYm8sIG1t
YXAgdGhlbSB3cml0ZSB0byB0aGVtCj4gPiA+IDUuIG9uY2UgeW91J3ZlIHRocmFzaGVkIGFsbCBv
ZiB2cmFtIGVub3VnaCwgcmVjaGVjayB5b3VyIG9yaWdpbmFsIGJvLiBJZgo+ID4gPiBJJ20gcmln
aHQgeW91IHNob3VsZCBnZXQgdGhlIGZvbGxvd2luZzoKPiA+ID4gICAgLSBkcm0gZmQgbW1hcCBz
dGlsbCBzaG93IHJpZ2h0IGNvbnRlbnQKPiA+ID4gICAgLSBkbWEtYnVmIGZkIG1tYXAgc2hvd3Mg
cmFuZG9tIGNyYXAgdGhhdCB5b3UndmUgd3JpdHRlbiBpbnRvIG90aGVyCj4gPiA+ICAgICAgYnVm
ZmVycwo+ID4gPgo+ID4gPiBPZmMgeW91IG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgYW4gbW1hcCBh
Y3R1YWxseSBmb3JjZXMgdGhlIGJ1ZmZlciBpbnRvCj4gPiA+IHZyYW0uIFNvIG1pZ2h0IG5lZWQg
YSBjb21ibyBvZiBtb2Rlc2V0K21tYXAsIHRvIG1ha2UgdGhhdCBoYXBwZW4uIFBsYWluCj4gPiA+
IG1tYXAgbWlnaHQganVzdCBnaXZlIHlvdSBwdGVzIHRoYXQgcG9pbnQgaW50byBzeXN0ZW0gbWVt
b3J5LCB3aGljaCBpcyBub3QKPiA+ID4gbWFuYWdlZCBieSB0dG0gbGlrZSB2cmFtLgo+ID4KPiA+
IElzIGFueSBtb3ZlIGJ1ZmZlciBnb29kIGVub3VnaCB0byB0cmlnZ2VyIHRoaXMsIGkuZS4gd2ls
bCBTWVNURU0gLT4gVlJBTQo+ID4gd29yayB0b28/ICBUaGF0J2xsIGJlIGVhc2llciBiZWNhdXNl
IGFsbCBJIG5lZWQgdG8gZG8gaXMgbWFwIHRoZSBidWZmZXIKPiA+IHRvIGEgY3J0YyB0byBmb3Jj
ZSBwaW5uaW5nIHRvIHZyYW0sIHRoZW4gY2hlY2sgaWYgdGhlIG1hcHBpbmdzIGFyZQo+ID4gaW50
YWN0IHN0aWxsIC4uLgo+IAo+IEkgdGhpbmsgdGhhdCBzaG91bGQgd29yayB0b28uCgpTZWVtcyB0
byB3b3JrIG9rIGZvciB0dG0vdnJhbS4KClRlc3QgY29kZToKICBodHRwczovL2dpdC5rcmF4ZWwu
b3JnL2NnaXQvZHJtaW5mby9jb21taXQvP2lkPWE5ZWI5NjUwNGRjMTczNzZlMDdiNWM2ZWRmNTI5
NmI0MWE0OGJiZmUKCj4gSnVzdCBtYWtlIHN1cmUgeW91IGFjdHVhbGx5IHdyaXRlCj4gdGhyb3Vn
aCBTWVNURU0gZmlyc3QgKG1heWJlIHdpdGggc29tZSBwcmludGsgb3Igd2hhdGV2ZXIpLgoKVGhh
dCB3b3JrcyBmaW5lLiAgU3ByaW5rbGVkIC4uLgoKCXN5c3RlbSgiY2F0IC9zeXMva2VybmVsL2Rl
YnVnL2RyaS8wL3ZyYW0tbW0iKTsgCgouLi4gaW50byB0aGUgdGVzdCBjb2RlLCBhbmQgZHJtTW9k
ZVNldENydGMoKSBpbmRlZWQgbWFrZXMgdGhlIGdlbSBvYmplY3Qgc2hvdwp1cCB0aGVyZS4KCmNo
ZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
