Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E046FAB5E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14B56E260;
	Wed, 13 Nov 2019 07:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B61A6E260
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 07:54:08 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-Ik-_hM7NNUqcI6cGtS7D3g-1; Wed, 13 Nov 2019 02:54:03 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4CF4800A1A;
 Wed, 13 Nov 2019 07:54:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3E3B601B7;
 Wed, 13 Nov 2019 07:54:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DAD6E16E08; Wed, 13 Nov 2019 08:53:59 +0100 (CET)
Date: Wed, 13 Nov 2019 08:53:59 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191113075359.pb47uekfkqrclvac@sirius.home.kraxel.org>
References: <20191024191859.31700-1-robh@kernel.org>
 <20191025073042.GL11828@phenom.ffwll.local>
 <20191108162759.GY23790@phenom.ffwll.local>
 <20191108165528.GC23790@phenom.ffwll.local>
 <20191112085254.nzemljr3co4l5k2e@sirius.home.kraxel.org>
 <20191112093518.GE23790@phenom.ffwll.local>
 <CAL_JsqL1qghRUQu2QuVwkCszuLPzqy_1eTDCu9_tpc0euy3TcQ@mail.gmail.com>
 <20191112190635.GM23790@phenom.ffwll.local>
 <CAL_Jsq+P6aVRpwZfjdWAQSxTh9BPN0cAp2qozx0o73NNzt7LMg@mail.gmail.com>
 <CAKMK7uFYHh1uEjUDDqZ5aSOp4sVycNB=W25J5vGo92QEr5A_7g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFYHh1uEjUDDqZ5aSOp4sVycNB=W25J5vGo92QEr5A_7g@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Ik-_hM7NNUqcI6cGtS7D3g-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573631647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4cDvSFxJEZNaNPlSvmbTMFBPkYmsWF+ifpto5tI4NNM=;
 b=c+ILMNaE1S8FAsFTA3vX+6XzTAW/iXOZ5lWOsx30tF3eShMUA+eRK/g/gp3YN+x6/xrOZA
 VO5QxYvWfVpEsY6l/Xxda9iWM1esfNe5JUjxEJZviS47Tq2C8ZDfB5+i+thRNAK/nNuIq/
 U7mODafkGoRfhQ2Ebc4lTePJv+cZdIo=
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

ICBIaSwKCj4gPiA+IEkgZ3Vlc3MgLi4uIGJ1dCBraW5kYSBhd2t3YXJkIHRvIGxlYXZlIHRoaXMg
aXNzdWUgaW4gaGVyZSwgaXQncyByZWFsbHkKPiA+ID4gc3VycHJpc2luZyBpZiB5b3UgY2FsbCB0
aGUgcHRlIHNob290ZG93biBmdW5jdGlvbiwgYW5kIGl0IGRvZXNuJ3Qgd29yayBhcwo+ID4gPiBh
ZHZlcnRpc2VkLgo+ID4KPiA+IEkgd2FzIG1haW5seSB3b25kZXJpbmcgaG93IHRoaXMgd29ya2Vk
IGZvciB1cyBhbmQgaG93IHRvIGhpdCBpdCBub3QKPiA+IHdvcmtpbmcgdG8gdGVzdCBmaXhpbmcg
aXQuCj4gPgo+ID4gSXMgdGhlcmUgYSBzaW1wbGUgd2F5IHRvIGNoZWNrIGlmIGEgQk8gaXMgbW1h
cHBlZCBvciBub3Q/IEknZCBhc3N1bWUKPiA+IHNvLCBqdXN0IGRvbid0IGtub3cgdGhlIGFuc3dl
ciBvZmYgaGFuZC4gQSBzaW1wbGUgZml4IHdvdWxkIGJlIHRvCj4gPiBlaXRoZXIgcmVxdWlyZSBi
dWZmZXIgaXMgbm90IG1hcHBlZCBiZWZvcmUgbWFkdmlzZSBvciBza2lwIHB1cmdpbmcgaWYKPiA+
IGl0IGlzIG1hcHBlZC4KPiAKPiBJbW8gc2ltcGxlc3QgZml4IGlzIHRvIGp1c3QgZ28gYmFjayBh
bmQgcmVhZGQgdGhlIGZha2Ugb2Zmc2V0LiBVZ2x5LAo+IGJ1dCB3b3JrcyBhdCBsZWFzdC4KCldl
bGwsIHNobWVtIGhlbHBlcnMgcmVtb3ZlZCB0aGUgZmFrZSBvZmZzZXQgYmVmb3JlLCBzbyBJJ20g
bGlrZXdpc2UKc3RhcnRpbmcgdG8gd29uZGVyIHdoYXQgZXhhY3RseSBicm9rZSBieSByZW1vdmlu
ZyB0aGUgb2Zmc2V0IGVsc2V3aGVyZS4KCk1heWJlIHNobWVtIGhlbHBlcnMgd2hlcmUgYWxyZWFk
eSBicm9rZW4gYmVmb3JlIHRoYXQgcGF0Y2guICBJIGNhbiBzZWUKdGhhdCByZW1vdmluZyB0aGUg
ZmFrZSBvZmZzZXQgYW5kIGNvbnRpbnVpbmcgdG8gdXNlIGEgc2hhcmVkIGFkZHJlc3MKc3BhY2Ug
aXNuJ3QgZ29pbmcgdG8gZmx5LiAgVW5saWtlIHR0bSB0aGUgc2htZW0gaGVscGVycyBzaG91bGQg
aGF2ZSBubwpwcm9ibGVtcyB1c2luZyBvYmotPmZpbHAsIGJ1dCBJIGNhbid0IHNlZSB0aGUgc2ht
ZW0gaGVscGVyIGNvZGUKc3dpdGNoaW5nIHZtYS0+dm1fZmlsZSBvdmVyIHRvIG9iai0+ZmlscCBh
bnl3aGVyZSAuLi4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
