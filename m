Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B98E42DD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 07:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180A76E890;
	Fri, 25 Oct 2019 05:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D896E890
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 05:25:11 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-acuR04tJN2OLFxN6jcWz-g-1; Fri, 25 Oct 2019 01:25:05 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CD99476;
 Fri, 25 Oct 2019 05:25:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23E49600C8;
 Fri, 25 Oct 2019 05:25:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4299411AAA; Fri, 25 Oct 2019 07:25:03 +0200 (CEST)
Date: Fri, 25 Oct 2019 07:25:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/prime: Fix mmap fake offset for
 drm_gem_object_funcs.mmap
Message-ID: <20191025052503.f6uhyg6bwvf6ekep@sirius.home.kraxel.org>
References: <20191023222226.9064-1-robh@kernel.org>
 <20191024090240.jnmbo5ikivdbkbbg@sirius.home.kraxel.org>
 <20191024123214.GE11828@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20191024123214.GE11828@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: acuR04tJN2OLFxN6jcWz-g-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571981110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EnfiVeVJShGhjx6caaXDKa8WpQlOWClTJhOdx67pshM=;
 b=AsyTtDn9FKXVpT8JVwnn51PRAEUqXxRcZUbLstRcWp+nlILiDOVwQvEC2CpE26ySvVdeOX
 nKxn877G2FsB8DguXcY5nsA/zXxxwokdZFhLmhROrdPUvadn/joSZ0jek/KgnwMoWYOuqR
 qREqPr3ebXVDUcLd2a963X8os1Lk3DQ=
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
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDI6MzI6MTRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIE9jdCAyNCwgMjAxOSBhdCAxMTowMjo0MEFNICswMjAwLCBHZXJkIEhv
ZmZtYW5uIHdyb3RlOgo+ID4gT24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMDU6MjI6MjZQTSAtMDUw
MCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+IENvbW1pdCBjNDAwNjljYjdiZDYgKCJkcm06IGFk
ZCBtbWFwKCkgdG8gZHJtX2dlbV9vYmplY3RfZnVuY3MiKQo+ID4gPiBpbnRyb2R1Y2VkIGEgR0VN
IG9iamVjdCBtbWFwKCkgaG9vayB3aGljaCBpcyBleHBlY3RlZCB0byBzdWJ0cmFjdCB0aGUKPiA+
ID4gZmFrZSBvZmZzZXQgZnJvbSB2bV9wZ29mZi4KPiA+IAo+ID4gTG9uZy10ZXJtIGl0IGlzIHBy
b2JhYmx5IGEgZ29vZCBpZGVhIHRvIGp1c3QgcmVtb3ZlIHRoZSBmYWtlIG9mZnNldAo+ID4gaGFu
ZGxpbmcgZnJvbSBkcml2ZXJzLiAgQnV0IHRoYXQnbGwgb25seSB3b3JrIG9uY2UgYWxsIGRyaXZl
cnMgc3dpdGNoZWQKPiA+IGF3YXkgZnJvbSBjdXN0b20gZm9wcy0+bW1hcCBoYW5kbGVycyBzbyB3
ZSBjYW4gaGFuZGxlIHRoZSBvZmZzZXQgLT4gb2JqCj4gPiBsb29rdXAgaW4gdGhlIGRybSBjb3Jl
IGZvciBldmVyeWJvZHkuCj4gPiAKPiA+IFNvIGxldCdzIGdvIHRoaXMgd2F5IGZvciBub3cuCj4g
PiAKPiA+IEFja2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiAKPiBV
aCB0aGlzIHNvdW5kcyBsaWtlIGRvdWJsaW5nIGRvd24gb24gcmF0aGVyIGhvcnJpYmxlIHNlbWFu
dGljcy4gQ2FuIHdlIGF0Cj4gbGVhc3Qgc3RvcCB0aGUgbWVzcyBpbnN0ZWFkIG9mIGJha2luZyBp
dCBpbiBmb3IgcmVhbD8gVGhlIGhvb2sgaXMgdmVyeQo+IHZlcnkgbmV3IGFmdGVyIGFsbC4gSS5l
Lgo+IC0gRG9jdW1lbnQgdGhhdCBvYmotPmZ1bmNzLT5tbWFwIHdpbGwgaGF2ZSAwIG9mZnNldCBp
biB0aGUga2VybmVsZG9jLgo+IC0gUmVtb3ZlIHRoZSBzdWJ0cmFjdGluZyBmcm9tIHRoZSBzaG1l
bSBoZWxwZXIKPiAtIEluIHR0bV9ib19tbWFwX29iaiByZS1hZGQgdGhlIG9mZnNldCB3aXRoIGEg
aHVnZSBGSVhNRSBjb21tZW50LgoKQWgsIHJpZ2h0LCB3ZSBjYW4gYWxzbyB0d2VhayB0aGUgZHJp
dmVycyB3aGljaCBuZWVkIGl0IGluc3RlYWQgb2YgZG9pbmcKaXQgZm9yIGV2ZXJ5Ym9keSBpbiBk
cm1fZ2VtX21tYXBfb2JqKCkuCgo+IEFsc28gSSBndWVzcyBHZXJkIGRpZG4ndCByZWFsbHkgdGVz
dCB0aGlzIHByaW1lIG1tYXAgc3VwcG9ydD8KCkkgZGlkLCBidXQgSSB0aGluayB0aGUgdGVzdFsx
XSBpcyB0b28gc2ltcGxlLiAgSXQnbGwgb25seSB0cnkgdG8gbW1hcCgpCnRoZSBkbWEtYnVmLCBi
dXQgZG9lc24ndCB0b3VjaCB0aGUgcGFnZXMsIHNvIGl0IGRvZXNuJ3Qgc2VlIHRoZSBzaG1lbQpm
YXVsdCBjYWxsYmFjayB0aHJvd2luZyBTSUdCVVMuCgpjaGVlcnMsCiAgR2VyZAoKWzFdIGh0dHBz
Oi8vZ2l0LmtyYXhlbC5vcmcvY2dpdC9kcm1pbmZvL3RyZWUvcHJpbWUuYwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
