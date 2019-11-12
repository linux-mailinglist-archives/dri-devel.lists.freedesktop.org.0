Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 199C0F8CEA
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 11:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA848892DE;
	Tue, 12 Nov 2019 10:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D03B892DE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 10:38:26 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-ZspBaPe9PdKcwrGinVT_Jw-1; Tue, 12 Nov 2019 05:38:22 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 092BD1005509;
 Tue, 12 Nov 2019 10:38:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8198F10027B8;
 Tue, 12 Nov 2019 10:38:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 827EA17535; Tue, 12 Nov 2019 11:38:19 +0100 (CET)
Date: Tue, 12 Nov 2019 11:38:19 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191112103819.vcuhtqpfzbkta6ml@sirius.home.kraxel.org>
References: <20191024191859.31700-1-robh@kernel.org>
 <20191025073042.GL11828@phenom.ffwll.local>
 <20191108162759.GY23790@phenom.ffwll.local>
 <d2146f86-ddb8-242e-025f-d29a43682487@suse.de>
 <20191112093246.GD23790@phenom.ffwll.local>
 <06f1f400-2e20-5c40-c0ea-967f1ab2b787@suse.de>
MIME-Version: 1.0
In-Reply-To: <06f1f400-2e20-5c40-c0ea-967f1ab2b787@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: ZspBaPe9PdKcwrGinVT_Jw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573555105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LKn1HARA94EmTqpJVU74Zqmg0hLnTmm9cjImHeiV76o=;
 b=SqGBTCmzwc9c57vKnpfiX8ZrYfFtHhULopSH71TcxybDIVycWJ2FOk5p+t690k3QbXxb7A
 /wu8b1oKIQh4eQqEPOS0BMH3do/YQx4/TYBlzvrz74LK16s+r/uoPNTYLEx898XVQ4QQkb
 ze08AmjSiTdNV+EXtdJZgYLwdmqqlxQ=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMTA6NDk6MjFBTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAxMi4xMS4xOSB1bSAxMDozMiBzY2hyaWViIERhbmllbCBW
ZXR0ZXI6Cj4gPiBPbiBUdWUsIE5vdiAxMiwgMjAxOSBhdCAxMDoyNjo0NEFNICswMTAwLCBUaG9t
YXMgWmltbWVybWFubiB3cm90ZToKPiA+PiBIaQo+ID4+Cj4gPj4gQW0gMDguMTEuMTkgdW0gMTc6
Mjcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+ID4+PiBPbiBGcmksIE9jdCAyNSwgMjAxOSBhdCAw
OTozMDo0MkFNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4+Pj4gT24gVGh1LCBPY3Qg
MjQsIDIwMTkgYXQgMDI6MTg6NTlQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPj4+Pj4g
Q29tbWl0IGM0MDA2OWNiN2JkNiAoImRybTogYWRkIG1tYXAoKSB0byBkcm1fZ2VtX29iamVjdF9m
dW5jcyIpCj4gPj4+Pj4gaW50cm9kdWNlZCBhIEdFTSBvYmplY3QgbW1hcCgpIGhvb2sgd2hpY2gg
aXMgZXhwZWN0ZWQgdG8gc3VidHJhY3QgdGhlCj4gPj4+Pj4gZmFrZSBvZmZzZXQgZnJvbSB2bV9w
Z29mZi4gSG93ZXZlciwgZm9yIG1tYXAoKSBvbiBkbWFidWZzLCB0aGVyZSBpcyBub3QKPiA+Pj4+
PiBhIGZha2Ugb2Zmc2V0Lgo+ID4+Pj4+Cj4gPj4+Pj4gVG8gZml4IHRoaXMsIGxldCdzIGFsd2F5
cyBjYWxsIG1tYXAoKSBvYmplY3QgY2FsbGJhY2sgd2l0aCBhbiBvZmZzZXQgb2YgMCwKPiA+Pj4+
PiBhbmQgbGVhdmUgaXQgdXAgdG8gZHJtX2dlbV9tbWFwX29iaigpIHRvIHJlbW92ZSB0aGUgZmFr
ZSBvZmZzZXQuCj4gPj4+Pj4KPiA+Pj4+PiBUVE0gc3RpbGwgbmVlZHMgdGhlIGZha2Ugb2Zmc2V0
LCBzbyB3ZSBoYXZlIHRvIGFkZCBpdCBiYWNrIHVudGlsIHRoYXQncwo+ID4+Pj4+IGZpeGVkLgo+
ID4+Pj4+Cj4gPj4+Pj4gRml4ZXM6IGM0MDA2OWNiN2JkNiAoImRybTogYWRkIG1tYXAoKSB0byBk
cm1fZ2VtX29iamVjdF9mdW5jcyIpCj4gPj4+Pj4gQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEBy
ZWRoYXQuY29tPgo+ID4+Pj4+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPgo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
Cj4gPj4+Pj4gLS0tCj4gPj4+Pj4gdjI6Cj4gPj4+Pj4gLSBNb3ZlIHN1YnRyYWN0aW5nIHRoZSBm
YWtlIG9mZnNldCBvdXQgb2YgbW1hcCgpIG9iaiBjYWxsYmFja3MuCj4gPj4+Pj4KPiA+Pj4+PiBJ
J3ZlIHRlc3RlZCBzaG1lbSwgYnV0IG5vdCB0dG0uIEhvcGVmdWxseSwgSSB1bmRlcnN0b29kIHdo
YXQncyBuZWVkZWQgCj4gPj4+Pj4gZm9yIFRUTS4KPiA+Pj4KPiA+Pj4gU28gdW5mb3J0dW5hdGVs
eSBJJ20gYWxyZWFkeSBoYXZpbmcgcmVncmV0cyBvbiB0aGlzLiBXZSBtaWdodCBldmVuIGhhdmUK
PiA+Pj4gYnJva2VuIHNvbWUgb2YgdGhlIHR0bSBkcml2ZXJzIGhlcmUuCj4gPj4+Cj4gPj4+IFRy
b3VibGUgaXMsIGlmIHlvdSBuZWVkIHRvIHNob290IGRvd24gdXNlcnNwYWNlIHB0ZXMgb2YgYSBi
byAoYmVjYXVzZSBpdCdzCj4gPj4+IGdldHRpbmcgbW92ZWQgb3Igd2hhdGV2ZXIpLCB0aGVuIHdl
IGRvIHRoYXQgd2l0aCB1bm1hcF9tYXBwaW5nX3JhbmdlLgo+ID4+PiBXaGljaCBtZWFucyBlYWNo
IGJvIG5lZWRzIHRvIGJlIG1hcHBpbmcgd2l0aCBhIHVuaXF1ZSAob2Zmc2V0LAo+ID4+PiBhZHJl
c3Nfc3BhY2UpLCBvciBpdCB3b24ndCB3b3JrLiBCeSByZW1hcHBpbmcgYWxsIHRoZSBibyB0byAw
IHdlJ3ZlIGJyb2tlbgo+ID4+PiB0aGlzLiBXZSd2ZSBhbHNvIGhhZCB0aGlzIGJyb2tlbiB0aGlz
IGZvciBhIHdoaWxlIGZvciB0aGUgc2ltcGxpc3RpYwo+ID4+PiBkbWEtYnVmIG1tYXAsIHNpbmNl
IHdpdGhvdXQgYW55IGZ1cnRoZXIgYWN0aW9uIHdlJ2xsIHJldXNlIHRoZSBhZGRyZXNzCj4gPj4+
IHNwYWNlIG9mIHRoZSBkbWEtYnVmIGlub2RlLCBub3Qgb2YgdGhlIGRybV9kZXZpY2UuCj4gPj4+
Cj4gPj4+IFN0cmFuZ2VseSBib3RoIGV0bmF2aXYgYW5kIG1zbSBoYXZlIGEgY29tbWVudCB0byB0
aGF0IGVmZmVjdCAtIGdyZXAgZm9yCj4gPj4+IHVubWFwX21hcHBpbmdfcmFuZ2UuIEJ1dCBuZWl0
aGVyIGFjdHVhbGx5IHVzZXMgaXQuCj4gPj4+Cj4gPj4+IE5vdCBleGFjdGx5IHN1cmUgd2hhdCdz
IHRoZSBiZXN0IGNvdXJzZSBvZiBhY3Rpb24gaGVyZSBub3cuCj4gPj4+Cj4gPj4+IEFsc28gYWRk
aW5nIFRob21hcyBaaW1tZXJtYW5uLCB3aG8ncyB3b3JrZWQgb24gYWxsIHRoZSB2cmFtIGhlbHBl
cnMuCj4gPj4KPiA+PiBWUkFNIGhlbHBlcnMgdXNlIGRybV9nZW1fdHRtX21tYXAoKSwgd2hpY2gg
d3JhcHMgdHRtX2JvX21tYXBfb2JqKCkuCj4gPj4gVGhlc2UgY2hhbmdlcyBzaG91bGQgYmUgdHJh
bnNwYXJlbnQuCj4gPiAKPiA+IFRoZXJlJ3Mgc3RpbGwgdGhlIGlzc3VlIHRoYXQgZm9yIGRtYS1i
dWYgbW1hcCB2cyBkcm0gbW1hcCB5b3UgdXNlCj4gPiBkaWZmZXJlbnQgZl9tYXBwaW5nLCB3aGlj
aCBtZWFucyB0dG0ncyBwdGUgc2hvb3Rkb3duIHdvbid0IHdvcmsgY29ycmVjdGx5Cj4gPiBmb3Ig
ZG1hLWJ1ZiBtbWFwcy4gQnV0IHllYWggbm9ybWFsIG9wZXJhdGlvbiBmb3IgdHRtL3ZyYW0gaGVs
cGVycyBzaG91bGQKPiA+IGJlIGZpbmUuCj4gCj4gVlJBTSBoZWxwZXJzIGRvbid0IHN1cHBvcnQg
ZG1hYnVmcy4KCkl0J3Mgbm90IHRoYXQgc2ltcGxlLiAgRXZlbiB3aGVuIG5vdCBzdXBwb3J0aW5n
IGRtYS1idWYgZXhwb3J0IGFuZAppbXBvcnQgaXQgaXMgc3RpbGwgcG9zc2libGUgdG8gY3JlYXRl
IGRtYS1idWZzLCBpbXBvcnQgdGhlbSBpbnRvIHRoZQpzYW1lIGRyaXZlciAod2hpY2ggZG9lc24n
dCBhY3R1YWxseSBleHBvcnQraW1wb3J0IGJ1dCBqdXN0IGdyYWJzIGEgZ2VtCm9iamVjdCByZWZl
cmVuY2UgaW5zdGVhZCkgYW5kIGFsc28gdG8gbW1hcCB0aGVtIHZpYSBwcmltZS9kbWEtYnVmIGNv
ZGUKcGF0aCAuLi4KCkNhbiB0dG0gdXNlIHRoZSBzYW1lIHRyaWNrIG1zbSB1c2VzPyAgTm93IHRo
YXQgdHRtIGJvJ3MgYXJlIGEgZ2VtIG9iamVjdApzdXBlcmNsYXNzIEkgdGhpbmsgd2Ugc2hvdWxk
IGJlIGFibGUgdG8gc3dpdGNoIHZtYS0+dm1fZmlsZSB0bwpiby0+YmFzZS5maWxwLCBzaW1saWFy
IHRvIG1zbV9nZW1fbW1hcF9vYmooKSwgcHJvYmFibHkgYmVzdCBkb25lIGluCmRybV9nZW1fdHRt
X21tYXAoKS4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
