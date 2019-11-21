Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF0D105050
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 11:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8A16E073;
	Thu, 21 Nov 2019 10:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A646E073
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 10:18:30 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-OeKaYbQnPmm2X-olafz9Zg-1; Thu, 21 Nov 2019 05:18:26 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7299EDBA5;
 Thu, 21 Nov 2019 10:18:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D0716CE50;
 Thu, 21 Nov 2019 10:18:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3C28C9D45; Thu, 21 Nov 2019 11:18:23 +0100 (CET)
Date: Thu, 21 Nov 2019 11:18:23 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191121101823.2774x3htreifdjqf@sirius.home.kraxel.org>
References: <20191113135145.itdsbojzrj5elzvu@sirius.home.kraxel.org>
 <20191113162729.GQ23790@phenom.ffwll.local>
 <20191115093738.kdi4qopah6hvntrb@sirius.home.kraxel.org>
 <CAKMK7uGq7-SpFrEXE2OJhnv66vxtJSifvSg4NUTFhLentQJ31w@mail.gmail.com>
 <20191115105601.i7ahtapysv4j7mn7@sirius.home.kraxel.org>
 <CAKMK7uHNOF5pAWCbQ1-eFWcxEOZmOoKOYL450ZJd7TOeVhMvjw@mail.gmail.com>
 <20191118104026.zg5pt5yg2wkulmrr@sirius.home.kraxel.org>
 <20191118164927.GF23790@phenom.ffwll.local>
 <20191121080259.7szddrq2bkecif7b@sirius.home.kraxel.org>
 <20191121084953.GB6236@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20191121084953.GB6236@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: OeKaYbQnPmm2X-olafz9Zg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574331509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OzqsyU0+fpSDvBn2TEGKRcCfl8x20SW2/7h/YKe4Z+o=;
 b=CpyXJ7lGmG+JL0qOs/hvSKn8tYeJfHhLpsaKiNAGR2FkLxH1NDgk44OjEwVEPuRH3y0XFP
 1PRTVctMkxPsUfskhE1ELzaSQg5zO0eiZxLkFNzpb47nXTFGav9sdUbJPmWFKdM3GuzRst
 ep7J1Q996IcHSaoAuDz3cyD6eDspHS8=
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
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDk6NDk6NTNBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCAwOTowMjo1OUFNICswMTAwLCBHZXJkIEhv
ZmZtYW5uIHdyb3RlOgo+ID4gICBIaSwKPiA+IAo+ID4gPiA+IHVwZGF0ZS1vYmplY3QtYWZ0ZXIt
bW92ZSB3b3JrcyBmaW5lLgo+ID4gPiA+IAo+ID4gPiA+IHRyeSB6YXAgbWFwcGluZ3Mgd2l0aCBt
YWR2aXNlKGRvbnRuZWVkKSBoYXMgbm8gYmFkIGVmZmVjdHMgKGFmdGVyIHZyYW0KPiA+ID4gPiBt
b3ZlLCB0cnlpbmcgdG8gZm9yY2UgcmUtY3JlYXRpbmcgdGhlIHB0ZXMpLgo+ID4gPiAKPiA+ID4g
V2VsbCBpZiBpdCdzIGJyb2tlbiB0aGUgemFwcGluZyB3b3VsZG4ndCB3b3JrIDotKQo+ID4gPiAK
PiA+ID4gPiBkaWRuJ3QgdHJ5IHRoZSBtZW1vcnkgcHJlc3N1cmUgdGhpbmcgeWV0Lgo+ID4gPiAK
PiA+ID4gSSdtIHN1cnByaXNlZCAuLi4gYW5kIEkgaGF2ZSBubyBpZGVhIGhvdy93aHkgaXQga2Vl
cHMgd29ya2luZy4KPiA+ID4gCj4gPiA+IEZvciBteSBwYXJhbm9pYSwgY2FuIHlvdSBpbnN0cnVt
ZW50IHRoZSB0dG0gcGFnZSBmYXVsdCBoYW5kbGVyLCBhbmQgZG91YmxlCj4gPiA+IGNoZWNrIHRo
YXQgd2UgZ2V0IG5ldyBmYXVsdHMgYWZ0ZXIgdGhlIG1vdmUsIGFuZCBzZXQgdXAgbmV3IHB0ZXMg
Zm9yIHRoZQo+ID4gPiBzYW1lIG9sZCBtYXBwaW5nLCBidXQgbm93IHBvaW50aW5nIGF0IHRoZSBu
ZXcgcGxhY2UgaW4gdnJhbT8KPiA+IAo+ID4gSG1tLCBvbmx5IHRoZSBkcm0gZGV2aWNlIG1hcHBp
bmcgaXMgZmF1bHRlZCBpbiBhZnRlciBtb3ZpbmcgaXQsCj4gPiB0aGUgZG1hLWJ1ZiBtYXBwaW5n
IGlzIG5vdC4gIEZpeGVkIGJ5Ogo+IAo+IEFoIHllcywgdGhhdCdzIG1vcmUgd2hhdCBJJ2QgZXhw
ZWN0IHRvIGhhcHBlbiwgYW5kIHRoZSBiZWxvdyBpcyB3aGF0IEknZAo+IGV4cGVjdCB0byBmaXgg
dGhpbmdzIHVwLiBJIHRoaW5rIHdlIHNob3VsZCBtb3ZlIGl0IHVwIGFoZWFkIG9mIHRoZSBkZXZp
Y2UKPiBjYWxsYmFjayAoc28gdGhhdCBkcml2ZXJzIGNhbiBvdmVyd3JpdGUpIGFuZCB0aGVuIHB1
c2ggYXMgYSBmaXguIFNlcGFyYXRlCj4gZnJvbSBhIHBvc3NpYmxlIHBhdGNoIHRvIHVuZG8gdGhl
IGZha2Ugb2Zmc2V0IHJlbW92YWwuCj4gLURhbmllbAoKSXMgdGhlcmUgYSBtb3JlIGVsZWdhbnQg
d2F5IHRoYW4gY29weWluZyB0aGUgaW50ZWwgbGlzdCBvbiBub24taW50ZWwKcGF0Y2hlcyB0byBr
aWNrIGludGVsIGNpPwoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
