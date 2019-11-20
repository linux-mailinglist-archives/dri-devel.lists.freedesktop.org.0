Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBCB1035CB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 09:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA2B6E03D;
	Wed, 20 Nov 2019 08:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEB96E03D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 08:05:37 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-qvYX4wclN1KoCOM_EF3gOA-1; Wed, 20 Nov 2019 03:05:35 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D889A1005510;
 Wed, 20 Nov 2019 08:05:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99BA727BDC;
 Wed, 20 Nov 2019 08:05:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B251016E08; Wed, 20 Nov 2019 09:05:32 +0100 (CET)
Date: Wed, 20 Nov 2019 09:05:32 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191120080532.hjjjddxrsikozlpq@sirius.home.kraxel.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: qvYX4wclN1KoCOM_EF3gOA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574237136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K4axRnySGgOnkKZEar5S/zHPmbRyxJhJ4FwCB3TWgm8=;
 b=XFPORvngw4s9m9uchxi9dYih7Lk5Xvl9kxc9kwAyhw+GSN298dKSWgUXHT5GnzakoFpGiF
 KJ9VRyJNiiG6/Ha2rxuJXfWP1sogCzvgqwQGYwYtGQxwIhU6dOInJ+2yc8LME7Objm8z8F
 KH8/7HyXzeF11fqbQve4/ckpq5RPQs8=
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

ICBIaSwKCj4gPiBJIGNhbiBzZWUgbm93IHdoeSB5b3Ugd2FudCBhIHByaXZhdGUgYWRkcmVzcyBz
cGFjZSBmb3IgZWFjaCBvYmplY3QuCj4gPiBEb2VzIHRoYXQgaW1wbHkgd2UgbmVlZCBhbiBhbm9u
X2lub2RlIGZvciBlYWNoIGdlbSBvYmplY3Q/ICBPciBpcwo+ID4gdGhlcmUgc29tZSBtb3JlIGxp
Z2h0d2VpZ2h0IHdheSB0byBkbyB0aGlzPwo+IAo+IEkgaGF2ZSBubyBpZGVhIHdoZXRoZXIgd2Ug
Y2FuIGdldCBhIGFkZHJlc3Nfc3BhY2Ugc3RydWN0IHdpdGhvdXQgYW4gaW5vZGUKPiAoYW5kIG5v
IGRpc2FzdGVycykuCgpBbnl0aGluZyBidWlsZGluZyBvbiBzaG1lbSBoZWxwZXJzIHNob3VsZCBi
ZSBhYmxlIHRvIHVzZQpvYmotPmZpbHAtPmZfbWFwcGluZywgcmlnaHQ/ICBTbyBhbGxvY2F0aW5n
IGFuIGlub2RlIHVuY29uZGl0aW9uYWxseQpkb2Vzbid0IGxvb2sgbGlrZSBhIGdvb2QgcGxhbi4K
Ckd1ZXNzIEknbGwgZ28gbG9vayBhdCB0dG0tbG9jYWwgY2hhbmdlcyBmb3Igc3RhcnRlcnMgYW5k
IHNlZSBob3cgaXQKZ29lcy4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
