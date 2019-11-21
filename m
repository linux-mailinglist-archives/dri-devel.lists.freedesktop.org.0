Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB46104D6A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D162C6EB8E;
	Thu, 21 Nov 2019 08:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4476EB8E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 08:10:27 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-DjEIwON3MjG-URx7kkkc5g-1; Thu, 21 Nov 2019 03:10:23 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70C9CDB21;
 Thu, 21 Nov 2019 08:10:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 307E25DAB0;
 Thu, 21 Nov 2019 08:10:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3E34016E2D; Thu, 21 Nov 2019 09:10:21 +0100 (CET)
Date: Thu, 21 Nov 2019 09:10:21 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191121081021.ehm27mlsst76wtmk@sirius.home.kraxel.org>
References: <20191118104026.zg5pt5yg2wkulmrr@sirius.home.kraxel.org>
 <20191118164927.GF23790@phenom.ffwll.local>
 <20191120080532.hjjjddxrsikozlpq@sirius.home.kraxel.org>
 <20191120103913.GH30416@phenom.ffwll.local>
 <20191120114038.6ytbvc3hc4fzb5aa@sirius.home.kraxel.org>
 <CAKMK7uFhFi7F9RZ=Jyf5qG2Bfss9N8UbCr=kVAoNWOsnmTZrtw@mail.gmail.com>
 <20191120121848.eq5jeh3qgpendm7l@sirius.home.kraxel.org>
 <CAKMK7uGNStNfNnyh2BZJ4kXEZYAnjcTq67jRd2W-1TvSc3tv7Q@mail.gmail.com>
 <20191120130841.3ajf6pho4zyqqcwg@sirius.home.kraxel.org>
 <CAKMK7uG5D9YeYgSx+H0v+g7uGt5bEnDyAij=mokQS8Qgez4Ukw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uG5D9YeYgSx+H0v+g7uGt5bEnDyAij=mokQS8Qgez4Ukw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: DjEIwON3MjG-URx7kkkc5g-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574323826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1hTu2ZlBr0wAOP9Py7RO20CE2BIDMALf5PP3HRYvUo4=;
 b=BqMYszR/p6SrUgUWdoMA3pmdyAw/byVDI8PBjUbbbNwDSwThZe0W2ulG4eF4nverGuM4I3
 Rx1ztiUrqPu40m2+9CY4Q3Jr97oCC3okRMKiR3fXOr6a+8xFWkyt5NvpV/FlpC7qgIizv4
 L8j+bX1EqweALPQ1pNDxdeOq1ZBKSj4=
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

ICBIaSwKCj4gQXNpZGU6IHRoZSBhbWRncHUgaXNuJ3QgZ3JlYXQgYmVjYXVzZSBpdCdzIHJhY3ks
IHVzZXJzcGFjZSBjb3VsZCBoYXZlCj4gZ3Vlc3NlZCB0aGUgZmQgYW5kIGFscmVhZHkgc3RhcnRl
ZCBhbiBtbWFwIGJlZm9yZSB3ZSBtYW5hZ2VkIHRvIHVwZGF0ZQo+IHN0dWZmLgoKQ2FuJ3Qgc2Vl
IHRoYXQgcmFjZS4gIFdoZW4gSSByZWFkIHRoZSBjb2RlIGNvcnJlY3RseSB0aGUgZmQgaXMgY3Jl
YXRlZAphbmQgaW5zdGFsbGVkICh1c2luZyBkbWFfYnVmX2ZkKSBvbmx5IGFmdGVyIGRtYWJ1ZiBz
ZXR1cCBpcyBmaW5pc2hlZC4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
