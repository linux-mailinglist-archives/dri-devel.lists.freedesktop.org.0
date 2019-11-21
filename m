Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04217104D1E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A826EB85;
	Thu, 21 Nov 2019 08:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1445D6EB85
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 08:03:05 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-SO-g87OMNSSxsGrQk2ptyQ-1; Thu, 21 Nov 2019 03:03:01 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83FEB1005509;
 Thu, 21 Nov 2019 08:03:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12F9260BC0;
 Thu, 21 Nov 2019 08:02:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2A90216E08; Thu, 21 Nov 2019 09:02:59 +0100 (CET)
Date: Thu, 21 Nov 2019 09:02:59 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191121080259.7szddrq2bkecif7b@sirius.home.kraxel.org>
References: <20191113073902.343vfunbjuzy725y@sirius.home.kraxel.org>
 <CAKMK7uF7G_H3ZvMpFkqKdGXc5H8P=vAtfoREksJJyysQmxOYzQ@mail.gmail.com>
 <20191113135145.itdsbojzrj5elzvu@sirius.home.kraxel.org>
 <20191113162729.GQ23790@phenom.ffwll.local>
 <20191115093738.kdi4qopah6hvntrb@sirius.home.kraxel.org>
 <CAKMK7uGq7-SpFrEXE2OJhnv66vxtJSifvSg4NUTFhLentQJ31w@mail.gmail.com>
 <20191115105601.i7ahtapysv4j7mn7@sirius.home.kraxel.org>
 <CAKMK7uHNOF5pAWCbQ1-eFWcxEOZmOoKOYL450ZJd7TOeVhMvjw@mail.gmail.com>
 <20191118104026.zg5pt5yg2wkulmrr@sirius.home.kraxel.org>
 <20191118164927.GF23790@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20191118164927.GF23790@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: SO-g87OMNSSxsGrQk2ptyQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574323385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WIufA4TzA0uRQ4O5X6lgpAiCNllgUbTt2+DqpdtZa9g=;
 b=hKfhvbJhqBBJraKOf/kBwkU+XOqqZZhLA/MKVB0NPAcVcg1l1OuePWxH0laLnk3vZS+/Ce
 K/TE19eoEAA9ixQYyOs+89bFfP/AhurJU+VVTbsu5ff6wIitfbDdbPzUvC1yeA4ydKQsaT
 djQC9k8osihqyXuIxu+akV63SY7lz8U=
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

ICBIaSwKCj4gPiB1cGRhdGUtb2JqZWN0LWFmdGVyLW1vdmUgd29ya3MgZmluZS4KPiA+IAo+ID4g
dHJ5IHphcCBtYXBwaW5ncyB3aXRoIG1hZHZpc2UoZG9udG5lZWQpIGhhcyBubyBiYWQgZWZmZWN0
cyAoYWZ0ZXIgdnJhbQo+ID4gbW92ZSwgdHJ5aW5nIHRvIGZvcmNlIHJlLWNyZWF0aW5nIHRoZSBw
dGVzKS4KPiAKPiBXZWxsIGlmIGl0J3MgYnJva2VuIHRoZSB6YXBwaW5nIHdvdWxkbid0IHdvcmsg
Oi0pCj4gCj4gPiBkaWRuJ3QgdHJ5IHRoZSBtZW1vcnkgcHJlc3N1cmUgdGhpbmcgeWV0Lgo+IAo+
IEknbSBzdXJwcmlzZWQgLi4uIGFuZCBJIGhhdmUgbm8gaWRlYSBob3cvd2h5IGl0IGtlZXBzIHdv
cmtpbmcuCj4gCj4gRm9yIG15IHBhcmFub2lhLCBjYW4geW91IGluc3RydW1lbnQgdGhlIHR0bSBw
YWdlIGZhdWx0IGhhbmRsZXIsIGFuZCBkb3VibGUKPiBjaGVjayB0aGF0IHdlIGdldCBuZXcgZmF1
bHRzIGFmdGVyIHRoZSBtb3ZlLCBhbmQgc2V0IHVwIG5ldyBwdGVzIGZvciB0aGUKPiBzYW1lIG9s
ZCBtYXBwaW5nLCBidXQgbm93IHBvaW50aW5nIGF0IHRoZSBuZXcgcGxhY2UgaW4gdnJhbT8KCkht
bSwgb25seSB0aGUgZHJtIGRldmljZSBtYXBwaW5nIGlzIGZhdWx0ZWQgaW4gYWZ0ZXIgbW92aW5n
IGl0LAp0aGUgZG1hLWJ1ZiBtYXBwaW5nIGlzIG5vdC4gIEZpeGVkIGJ5OgoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0gY3V0IGhlcmUgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkZyb20gM2E3
ZjZjNmRiZjNiMWU0YjQxMmMyYjI4M2IyZWE0ZWRmZjlmMzNiNSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKRnJvbTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkRhdGU6IFRodSwg
MjEgTm92IDIwMTkgMDg6Mzk6MTcgKzAxMDAKU3ViamVjdDogW1BBVENIXSBkcm06IHNoYXJlIGFk
ZHJlc3Mgc3BhY2UgZm9yIGRtYSBidWZzCgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUu
YyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fcHJpbWUuYwppbmRleCAwODE0MjExYjBmM2YuLjA3Yzg4ZDJhZWRlZSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fcHJpbWUuYwpAQCAtMjQwLDYgKzI0MCw3IEBAIHZvaWQgZHJtX3ByaW1lX2Rlc3Ryb3lfZmls
ZV9wcml2YXRlKHN0cnVjdCBkcm1fcHJpbWVfZmlsZV9wcml2YXRlICpwcmltZV9mcHJpdikKIHN0
cnVjdCBkbWFfYnVmICpkcm1fZ2VtX2RtYWJ1Zl9leHBvcnQoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwKIAkJCQkgICAgICBzdHJ1Y3QgZG1hX2J1Zl9leHBvcnRfaW5mbyAqZXhwX2luZm8pCiB7CisJ
c3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSBleHBfaW5mby0+cHJpdjsKIAlzdHJ1Y3QgZG1h
X2J1ZiAqZG1hX2J1ZjsKIAogCWRtYV9idWYgPSBkbWFfYnVmX2V4cG9ydChleHBfaW5mbyk7CkBA
IC0yNDcsNyArMjQ4LDggQEAgc3RydWN0IGRtYV9idWYgKmRybV9nZW1fZG1hYnVmX2V4cG9ydChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQlyZXR1cm4gZG1hX2J1ZjsKIAogCWRybV9kZXZfZ2V0
KGRldik7Ci0JZHJtX2dlbV9vYmplY3RfZ2V0KGV4cF9pbmZvLT5wcml2KTsKKwlkcm1fZ2VtX29i
amVjdF9nZXQob2JqKTsKKwlkbWFfYnVmLT5maWxlLT5mX21hcHBpbmcgPSBvYmotPmRldi0+YW5v
bl9pbm9kZS0+aV9tYXBwaW5nOwogCiAJcmV0dXJuIGRtYV9idWY7CiB9Ci0tIAoyLjE4LjEKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIGN1dCBoZXJlIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQoKZ2l0IGJyYW5jaDogaHR0cHM6Ly9naXQua3JheGVsLm9yZy9jZ2l0L2xpbnV4L2xvZy8/aD1k
cm0tbW1hcC1kZWJ1ZwoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
