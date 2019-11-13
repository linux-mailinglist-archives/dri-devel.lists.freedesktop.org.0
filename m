Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63681FB1C6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 14:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117646ED11;
	Wed, 13 Nov 2019 13:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D30E6ED11
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 13:51:51 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-CZ4zirGwPvmKtmbJ2ilbDA-1; Wed, 13 Nov 2019 08:51:48 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A9921010AB1;
 Wed, 13 Nov 2019 13:51:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 555F55E25B;
 Wed, 13 Nov 2019 13:51:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2511C11AAA; Wed, 13 Nov 2019 14:51:45 +0100 (CET)
Date: Wed, 13 Nov 2019 14:51:45 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191113135145.itdsbojzrj5elzvu@sirius.home.kraxel.org>
References: <20191024191859.31700-1-robh@kernel.org>
 <20191025073042.GL11828@phenom.ffwll.local>
 <20191108162759.GY23790@phenom.ffwll.local>
 <d2146f86-ddb8-242e-025f-d29a43682487@suse.de>
 <20191112093246.GD23790@phenom.ffwll.local>
 <06f1f400-2e20-5c40-c0ea-967f1ab2b787@suse.de>
 <20191112103819.vcuhtqpfzbkta6ml@sirius.home.kraxel.org>
 <20191112144435.GK23790@phenom.ffwll.local>
 <20191113073902.343vfunbjuzy725y@sirius.home.kraxel.org>
 <CAKMK7uF7G_H3ZvMpFkqKdGXc5H8P=vAtfoREksJJyysQmxOYzQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uF7G_H3ZvMpFkqKdGXc5H8P=vAtfoREksJJyysQmxOYzQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: CZ4zirGwPvmKtmbJ2ilbDA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573653110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m1J7AR3DfrFpJb8tYdZKU6cJXCNDQ7pWYb/odbD9F9U=;
 b=I4VlNJK5g0jBUJcGlQytiOLxI8Om+2qrY/oEj3yZx2PGj0CRFInWFXWnDEKdqyQ5msmouk
 X8QLlTlAhAueCUK1/NZSUHJfFiZh7jYNFnCAxktztCEI3wSCAlyuCCGPen0gYE8LnqbflX
 SQfiz+dXIoHYf3ZcK7NX76vMaqcnHh4=
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

ICBIaSwKCj4gPiAuLi4gYnV0IGFmdGVyIGxvb2tpbmcgYWdhaW4gSSB0aGluayB3ZSBhcmUgYWxs
IGdyZWVuIGhlcmUuICBHaXZlbiB0aGF0Cj4gPiBvbmx5IHNlbGYtaW1wb3J0IHdvcmtzIHdlJ2xs
IG9ubHkgc2VlIHZyYW0gZ2VtIG9iamVjdHMgaW4gdGhlIG1tYXAgY29kZQo+ID4gcGF0aCwgd2hp
Y2ggc2hvdWxkIGhhdmUgZXZlcnl0aGluZyBzZXQgdXAgY29ycmVjdGx5LiAgU2FtZSBnb2VzIGZv
ciBxeGwuCj4gPgo+ID4gQWxsIG90aGVyIHR0bSBkcml2ZXJzIHN0aWxsIHVzZSB0aGUgb2xkIG1t
YXAgY29kZSBwYXRoLCBzbyBhbGwgZ3JlZW4KPiA+IHRoZXJlIHRvbyBJIHRoaW5rLiAgQWxzbyBJ
IHNvbWVob3cgZG91YnQgZG1hLWJ1ZiBtbWFwIHZzLiBkcm0gbW1hcCBlbmRzCj4gPiB1cCB1c2lu
ZyBkaWZmZXJlbnQgZl9tYXBwaW5nLCB0dG0gY29kZSBoYXMgYSBXQVJOX09OIGluIHR0bV9ib192
bV9vcGVuKCkKPiA+IHdoaWNoIHdvdWxkIGZpcmUgc2hvdWxkIHRoYXQgYmUgdGhlIGNhc2UuCj4g
Pgo+ID4gRG8gaW1wb3J0ZWQgZG1hLWJ1ZnMgaGl0IHRoZSBkcm0gbW1hcCBjb2RlIHBhdGggaW4g
dGhlIGZpcnN0IHBsYWNlPwo+ID4gV291bGRuJ3QgbW1hcCBiZSBoYW5kbGVkIGJ5IHRoZSBleHBv
cnRpbmcgZHJpdmVyPwo+IAo+IGRybV9nZW1fZG1hYnVmX21tYXAgLT4gb2JqLT5mdW5jcy0+bW1h
cCAtPiB0dG1fYm9fbW1hcF9vYmoKPiAKPiBBbmQgSSdtIG5vdCBzZWVpbmcgYW55b25lIGFkanVz
dGluZyB2bV9maWxlLT5mX21hcHBpbmcgYW55d2hlcmUgaGVyZSBhdCBhbGwuCgpbIHNvbWUgbW9y
ZSBjb2RlIGJyb3dzaW5nIF0KCk9rLCBJIHNlZS4gIGRtYS1idWZzIGdldCB0aGVpciBvd24gZmls
ZSwgdGhlaXIgb3duIGFub24gaW5vZGUgYW5kCnRoZXJlYnkgdGhlaXIgb3duIGFkZHJlc3Mgc3Bh
Y2UuICBTbyB0aGF0IGl0IHVzZWQgd2hlbiBtbWFwaW5nIHRoZQpkbWEtYnVmLgoKZHJtIGZpbGVo
YW5kbGUncyBnZXQgdGhlIHNoYXJlZCBhZGRyZXNzIHNwYWNlIGluc3RlYWQsIGRybV9vcGVuKCkg
c2V0cwppdC4KClNvLCB5ZXMsIEkgc2VlIHRoZSBwcm9ibGVtLiAgSXQncyBub3QgbmV3IHRob3Vn
aCwgYXMgZmFyIEkgY2FuIHNlZSB0aGUKb2xkIGRtYS1idWYgbW1hcCBjb2RlIHBhdGggZG9lc24n
dCBhZGp1c3QgZl9tYXBwaW5nIGFueXdoZXJlIGVpdGhlciAuLi4KCj4gTm90ZSB0byBoaXQgdGhp
cyB5b3UgbmVlZCB1c2Vyc3BhY2UgdG8KPiAtIGhhbmRsZTJmZCBvbiBhIGJ1ZmZlciB0byBjcmVh
dGUgYSBkbWEtYnVmIGZkCj4gLSBjYWxsIG1tYXAgZGlyZWN0bHkgb24gdGhhdCBkbWEtYnVmIGZk
CgpIbW0sIHNlZW1zIGZvciBoYW5kbGUyZmQgSSBuZWVkIGEgZHVtbXkgZ2VtX3ByaW1lX2dldF9z
Z190YWJsZSBmdW5jdGlvbgp3aXJlZCB1cCBldmVuIHdoZW4gbm90IGFjdHVhbGx5IGV4cG9ydGlu
Zy9pbXBvcnRpbmcgYW55dGhpbmcuICBTbyBJCnRoaW5rIG5laXRoZXIgcXhsIG5vciBhbnkgb2Yg
dGhlIHZyYW0gZHJpdmVycyBhbGxvdyB0byB0cmlnZ2VyIHRoYXQgKGFuZApubyBvdGhlciB0dG0g
ZHJpdmVyIHVzZXMgdGhlIG5ldyB0dG0gbW1hcCBjb2RlIHlldCkuCgpTbywgJHN1YmplY3QgcGF0
Y2ggc2hvdWxkIG5vdCBtYWtlIHRoaW5ncyB3b3JzZSBpbiB0dG0gbGFuZC4KCldoZW4gaGFja2lu
ZyB0aGUgYm9jaHMgZHJpdmVyIHRvIGhhdmUgZXhwb3J0IGNhbGxiYWNrcyAod2l0aG91dApzdXBw
b3J0aW5nIGFjdHVhbCBleHBvcnRzKSBoYW5kbGUyZmQgKyBtbWFwKCkgY2FsbGJhY2sgd29ya3Mg
ZmluZS4KRGlkbid0IHZlcmlmeSB5ZXQgSSBhY3R1YWxseSBnZXQgdGhlIGNvcnJlY3QgcGFnZXMg
bWFwcGVkLiAgQnV0IG1heWJlCm1tYXAoKSBpc24ndCB0aGUgcHJvYmxlbSB3aGVuIHRoZSBjb3Jy
ZWN0IGFkZHJlc3Mgc3BhY2UgaXMgaW1wb3J0YW50IGZvcgp1bm1hcCBvbmx5LgoKSXMgdGhlcmUg
YSBnb29kIHRlc3QgY2FzZT8KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
