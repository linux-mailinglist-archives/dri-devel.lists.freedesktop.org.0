Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 255EE1002A6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 11:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635C26E42A;
	Mon, 18 Nov 2019 10:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9A16E441
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 10:40:37 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-mMzl2RmRN020I61Yu_uShg-1; Mon, 18 Nov 2019 05:40:29 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6746B1802CE1;
 Mon, 18 Nov 2019 10:40:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D84828DC8;
 Mon, 18 Nov 2019 10:40:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E02A116E2D; Mon, 18 Nov 2019 11:40:26 +0100 (CET)
Date: Mon, 18 Nov 2019 11:40:26 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191118104026.zg5pt5yg2wkulmrr@sirius.home.kraxel.org>
References: <20191112103819.vcuhtqpfzbkta6ml@sirius.home.kraxel.org>
 <20191112144435.GK23790@phenom.ffwll.local>
 <20191113073902.343vfunbjuzy725y@sirius.home.kraxel.org>
 <CAKMK7uF7G_H3ZvMpFkqKdGXc5H8P=vAtfoREksJJyysQmxOYzQ@mail.gmail.com>
 <20191113135145.itdsbojzrj5elzvu@sirius.home.kraxel.org>
 <20191113162729.GQ23790@phenom.ffwll.local>
 <20191115093738.kdi4qopah6hvntrb@sirius.home.kraxel.org>
 <CAKMK7uGq7-SpFrEXE2OJhnv66vxtJSifvSg4NUTFhLentQJ31w@mail.gmail.com>
 <20191115105601.i7ahtapysv4j7mn7@sirius.home.kraxel.org>
 <CAKMK7uHNOF5pAWCbQ1-eFWcxEOZmOoKOYL450ZJd7TOeVhMvjw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHNOF5pAWCbQ1-eFWcxEOZmOoKOYL450ZJd7TOeVhMvjw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: mMzl2RmRN020I61Yu_uShg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574073636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jYEmARUdc5GpwVsrPbXGesQTkrhO+zGgC0gyEzr3e+c=;
 b=GMUT7Tw5H7LJXfuPQSZvs9C5Th8G8JpkSLg6qPBvvyPGLs/yJouuZYvUowATw7GT8tgF/r
 OvYwttCG+RmGCumKkWkOIWb+/tZud+2WJ0dLtA+ZB57nlHErej2AJ1xU6WSd7A3BIuCQlv
 5MGRDt6NRMN5saxvTKRMWP3PAiAzFSg=
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

ICBIaSwKCj4gPiA+ID4gSXMgYW55IG1vdmUgYnVmZmVyIGdvb2QgZW5vdWdoIHRvIHRyaWdnZXIg
dGhpcywgaS5lLiB3aWxsIFNZU1RFTSAtPiBWUkFNCj4gPiA+ID4gd29yayB0b28/ICBUaGF0J2xs
IGJlIGVhc2llciBiZWNhdXNlIGFsbCBJIG5lZWQgdG8gZG8gaXMgbWFwIHRoZSBidWZmZXIKPiA+
ID4gPiB0byBhIGNydGMgdG8gZm9yY2UgcGlubmluZyB0byB2cmFtLCB0aGVuIGNoZWNrIGlmIHRo
ZSBtYXBwaW5ncyBhcmUKPiA+ID4gPiBpbnRhY3Qgc3RpbGwgLi4uCj4gPiA+Cj4gPiA+IEkgdGhp
bmsgdGhhdCBzaG91bGQgd29yayB0b28uCj4gPgo+ID4gU2VlbXMgdG8gd29yayBvayBmb3IgdHRt
L3ZyYW0uCj4gPgo+ID4gVGVzdCBjb2RlOgo+ID4gICBodHRwczovL2dpdC5rcmF4ZWwub3JnL2Nn
aXQvZHJtaW5mby9jb21taXQvP2lkPWE5ZWI5NjUwNGRjMTczNzZlMDdiNWM2ZWRmNTI5NmI0MWE0
OGJiZmUKPiAKPiBJIHRoaW5rIHRoYXQncyBub3QgbmFzdHkgZW5vdWdoLiBJZiB0aGUgbWFwcGlu
Z3MgYXJlbid0IHVwZGF0ZWQsIHRoZW4KPiB5b3UnbGwgc3RpbGwgc2VlIHRoZSB0aGUgc2FtZSBv
bGQgcGFnZXMgd2l0aCB0aGUgcmlnaHQgY29udGVudHMuIFlvdQo+IG5lZWQgdG8gY2hhbmdlIHRo
ZW0gc29tZWhvdyBhZnRlciB0aGV5IG1pZ3JhdGVkICh3aXRoIHZyYW0gZXZpY3Rpb24KPiB0aGF0
IGhhcHBlbnMgYXV0b21hdGljYWxseSBzaW5jZSB0aGVyZSdsbCBiIGFub3RoZXIgb2JqZWN0IGlu
IHRoZSBzYW1lCj4gc3BvdCwgZm9yIHN5c3RlbSBtZW1vcnkgSSB0aGluayB5b3UgbmVlZCB0aGUg
c2hyaW5rZXIgdG8ga2ljayBpbiBhbmQKPiBmcmVlIHRoZSBwYWdlcyBmaXJzdCkuIEVhc2llc3Qg
cHJvYmFibHkgdG8gd2FpdCBmb3IgYSBrZXkgcHJlc3Mgc28geW91Cj4gY2FuIGFwcHJlY2lhdGUg
dGhlIGNvbG9yLCB0aGVuIHdyaXRlIGEgZGlmZmVyZW50IGNvbG9yIChmdWxsIHNjcmVlbikKPiB3
aGVuIHRoZSBidWZmZXIgaXMgaW4gdnJhbS4KCnVwZGF0ZS1vYmplY3QtYWZ0ZXItbW92ZSB3b3Jr
cyBmaW5lLgoKdHJ5IHphcCBtYXBwaW5ncyB3aXRoIG1hZHZpc2UoZG9udG5lZWQpIGhhcyBubyBi
YWQgZWZmZWN0cyAoYWZ0ZXIgdnJhbQptb3ZlLCB0cnlpbmcgdG8gZm9yY2UgcmUtY3JlYXRpbmcg
dGhlIHB0ZXMpLgoKZGlkbid0IHRyeSB0aGUgbWVtb3J5IHByZXNzdXJlIHRoaW5nIHlldC4KCj4g
WW91J2QgbmVlZCB0byBjaGVjayB0aGUgcHRlcyB0aGVtc2VsdmVzLiBXaGljaCBJIHRoaW5rIG5v
dCBldmVuIHByb2MKPiBzaG93cyBieSBkZWZhdWx0IChvbmx5IHRoZSBmaWxlIHRoYXQncyBzdXBw
b3NlZCB0byBiZSBtYXBwZWQpLiBCdXQKPiBnb29kIHRvIGNvbmZpcm0gdGhhdCB0aGUgYnVmZmVy
IG1vdmVkIGF0IGxlYXN0LgoKT25lIHJlcHJvZHVjYWJsZSBnbGl0Y2ggZm91bmQ6ICBmb3JrKCkg
d2hpbGUgaGF2aW5nIGEgZG1hLWJ1ZiBtYXBwZWQKdHJpZ2dlcnMgdGhlIFdBUk5fT04gaW4gdHRt
X2JvX3ZtX29wZW4oKS4gIEJvdGggb2xkICYgbmV3IG1tYXAgY29kZQpwYXRocywgc28gdGhpcyBp
c24ndCBzb21ldGhpbmcgbmV3IGNvbWluZyBmcm9tIHRoZQpkcm1fZ2VtX29iamVjdF9mdW5jcy5t
bWFwIHN3aXRjaC4gIEluc3RlYWQgaXQgaXMgYW4gb2xkIGlzc3VlIGNvbWluZwpmcm9tIHRoZSBh
ZGRyZXNzIHNwYWNlIGhhbmRsaW5nIGJlaW5nIGRpZmZlcmVudCBpbiBkcm0gbW1hcCBhbmQgZG1h
YnVmCm1tYXAgY29kZSBwYXRocy4KCkkgY2FuIHNlZSBub3cgd2h5IHlvdSB3YW50IGEgcHJpdmF0
ZSBhZGRyZXNzIHNwYWNlIGZvciBlYWNoIG9iamVjdC4KRG9lcyB0aGF0IGltcGx5IHdlIG5lZWQg
YW4gYW5vbl9pbm9kZSBmb3IgZWFjaCBnZW0gb2JqZWN0PyAgT3IgaXMKdGhlcmUgc29tZSBtb3Jl
IGxpZ2h0d2VpZ2h0IHdheSB0byBkbyB0aGlzPwoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
