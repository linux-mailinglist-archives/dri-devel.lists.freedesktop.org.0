Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD7EF8B22
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 09:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473896EA81;
	Tue, 12 Nov 2019 08:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D556EA7E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 08:53:01 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-Yb4XiwRmMaOF9f7JACI93w-1; Tue, 12 Nov 2019 03:52:57 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B82A9107ACC4;
 Tue, 12 Nov 2019 08:52:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C76E661075;
 Tue, 12 Nov 2019 08:52:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A0AF111AAA; Tue, 12 Nov 2019 09:52:54 +0100 (CET)
Date: Tue, 12 Nov 2019 09:52:54 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191112085254.nzemljr3co4l5k2e@sirius.home.kraxel.org>
References: <20191024191859.31700-1-robh@kernel.org>
 <20191025073042.GL11828@phenom.ffwll.local>
 <20191108162759.GY23790@phenom.ffwll.local>
 <20191108165528.GC23790@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20191108165528.GC23790@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: Yb4XiwRmMaOF9f7JACI93w-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573548780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oh6DmQqJM/6aD3irzBMU//vzKmXkL28r0XGZt9kW+po=;
 b=EzJCVkTYDGX39Lu9yqDbUizEGJFdeSTwBQp6CJ8QBnfbn14qcm3mzquuADy+ztBiZqXZKy
 YE1686I95tnKf6MwO2APIR6moac6OtafHD/39ph5p2sHGsxz/fMxbKUUifxffzroo3kQaF
 h0AS9MIBXSS2ZvCsfEJsq5EubPj5BX4=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMDU6NTU6MjhQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIE5vdiAwOCwgMjAxOSBhdCAwNToyNzo1OVBNICswMTAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gT24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMDk6MzA6NDJBTSArMDIw
MCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gT24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDI6
MTg6NTlQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+ID4gQ29tbWl0IGM0MDA2OWNi
N2JkNiAoImRybTogYWRkIG1tYXAoKSB0byBkcm1fZ2VtX29iamVjdF9mdW5jcyIpCj4gPiA+ID4g
aW50cm9kdWNlZCBhIEdFTSBvYmplY3QgbW1hcCgpIGhvb2sgd2hpY2ggaXMgZXhwZWN0ZWQgdG8g
c3VidHJhY3QgdGhlCj4gPiA+ID4gZmFrZSBvZmZzZXQgZnJvbSB2bV9wZ29mZi4gSG93ZXZlciwg
Zm9yIG1tYXAoKSBvbiBkbWFidWZzLCB0aGVyZSBpcyBub3QKPiA+ID4gPiBhIGZha2Ugb2Zmc2V0
Lgo+ID4gPiA+IAo+ID4gPiA+IFRvIGZpeCB0aGlzLCBsZXQncyBhbHdheXMgY2FsbCBtbWFwKCkg
b2JqZWN0IGNhbGxiYWNrIHdpdGggYW4gb2Zmc2V0IG9mIDAsCj4gPiA+ID4gYW5kIGxlYXZlIGl0
IHVwIHRvIGRybV9nZW1fbW1hcF9vYmooKSB0byByZW1vdmUgdGhlIGZha2Ugb2Zmc2V0Lgo+ID4g
PiA+IAo+ID4gPiA+IFRUTSBzdGlsbCBuZWVkcyB0aGUgZmFrZSBvZmZzZXQsIHNvIHdlIGhhdmUg
dG8gYWRkIGl0IGJhY2sgdW50aWwgdGhhdCdzCj4gPiA+ID4gZml4ZWQuCj4gPiA+ID4gCj4gPiA+
ID4gRml4ZXM6IGM0MDA2OWNiN2JkNiAoImRybTogYWRkIG1tYXAoKSB0byBkcm1fZ2VtX29iamVj
dF9mdW5jcyIpCj4gPiA+ID4gQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+
ID4gPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiA+ID4gLS0t
Cj4gPiA+ID4gdjI6Cj4gPiA+ID4gLSBNb3ZlIHN1YnRyYWN0aW5nIHRoZSBmYWtlIG9mZnNldCBv
dXQgb2YgbW1hcCgpIG9iaiBjYWxsYmFja3MuCj4gPiA+ID4gCj4gPiA+ID4gSSd2ZSB0ZXN0ZWQg
c2htZW0sIGJ1dCBub3QgdHRtLiBIb3BlZnVsbHksIEkgdW5kZXJzdG9vZCB3aGF0J3MgbmVlZGVk
IAo+ID4gPiA+IGZvciBUVE0uCj4gPiAKPiA+IFNvIHVuZm9ydHVuYXRlbHkgSSdtIGFscmVhZHkg
aGF2aW5nIHJlZ3JldHMgb24gdGhpcy4gV2UgbWlnaHQgZXZlbiBoYXZlCj4gPiBicm9rZW4gc29t
ZSBvZiB0aGUgdHRtIGRyaXZlcnMgaGVyZS4KPiA+IAo+ID4gVHJvdWJsZSBpcywgaWYgeW91IG5l
ZWQgdG8gc2hvb3QgZG93biB1c2Vyc3BhY2UgcHRlcyBvZiBhIGJvIChiZWNhdXNlIGl0J3MKPiA+
IGdldHRpbmcgbW92ZWQgb3Igd2hhdGV2ZXIpLCB0aGVuIHdlIGRvIHRoYXQgd2l0aCB1bm1hcF9t
YXBwaW5nX3JhbmdlLgo+ID4gV2hpY2ggbWVhbnMgZWFjaCBibyBuZWVkcyB0byBiZSBtYXBwaW5n
IHdpdGggYSB1bmlxdWUgKG9mZnNldCwKPiA+IGFkcmVzc19zcGFjZSksIG9yIGl0IHdvbid0IHdv
cmsuIEJ5IHJlbWFwcGluZyBhbGwgdGhlIGJvIHRvIDAgd2UndmUgYnJva2VuCj4gPiB0aGlzLiBX
ZSd2ZSBhbHNvIGhhZCB0aGlzIGJyb2tlbiB0aGlzIGZvciBhIHdoaWxlIGZvciB0aGUgc2ltcGxp
c3RpYwo+ID4gZG1hLWJ1ZiBtbWFwLCBzaW5jZSB3aXRob3V0IGFueSBmdXJ0aGVyIGFjdGlvbiB3
ZSdsbCByZXVzZSB0aGUgYWRkcmVzcwo+ID4gc3BhY2Ugb2YgdGhlIGRtYS1idWYgaW5vZGUsIG5v
dCBvZiB0aGUgZHJtX2RldmljZS4KPiA+IAo+ID4gU3RyYW5nZWx5IGJvdGggZXRuYXZpdiBhbmQg
bXNtIGhhdmUgYSBjb21tZW50IHRvIHRoYXQgZWZmZWN0IC0gZ3JlcCBmb3IKPiA+IHVubWFwX21h
cHBpbmdfcmFuZ2UuIEJ1dCBuZWl0aGVyIGFjdHVhbGx5IHVzZXMgaXQuCj4gPiAKPiA+IE5vdCBl
eGFjdGx5IHN1cmUgd2hhdCdzIHRoZSBiZXN0IGNvdXJzZSBvZiBhY3Rpb24gaGVyZSBub3cuCj4g
PiAKPiA+IEFsc28gYWRkaW5nIFRob21hcyBaaW1tZXJtYW5uLCB3aG8ncyB3b3JrZWQgb24gYWxs
IHRoZSB2cmFtIGhlbHBlcnMuCj4gCj4gQ29ycmVjdGlvbiwgSSBtaXNzZWQgdGhlIHVubWFwX21h
cHBpbmdfcmFuZ2UgaW4gdGhlIHZtYSBub2RlIG1hbmFnZXIKPiBoZWFkZXIsIHNvIGRpZG4ndCBz
cG90IHRoZSBkcml2ZXJzIHVzaW5nIGRybV92bWFfbm9kZV91bm1hcC4gV2UgZGlkIGJyZWFrCj4g
YWxsIHRoZSB0dG0gc3R1ZmYgOi0vCgp0dG0gc3RpbGwgdXNlcyB0aGUgb2Zmc2V0LCBub3cgYWRk
ZWQgaW4gdHRtX2JvX21tYXBfb2JqKCkuICBTbywgZm9yCm5vcm1hbCBtbWFwIGJlaGF2aW9yIGRp
ZCBub3QgY2hhbmdlIEkgdGhpbmsuICBUaGUgc2ltcGxpc3RpYyBkbWEtYnVmCm1tYXAgZGlkIGNo
YW5nZSwgaXQgbm93IHVzZXMgdGhlIG9mZnNldCBiZWNhdXNlIGl0IGdvZXMgdGhyb3VnaAp0dG1f
Ym9fbW1hcF9vYmooKSB0b28uCgpOb3QgZnVsbHkgc3VyZSB3aGljaCBhZGRyZXNzIHNwYWNlIGlz
IHVzZWQgZm9yIGRtYS1idWZzIHRob3VnaC4gIEFzIGZhcgpJIGNhbiBzZWUgbmVpdGhlciB0aGUg
b2xkIG5vciB0aGUgbmV3IGRtYS1idWYgbW1hcCBjb2RlIHBhdGggdG91Y2gKdm1hLT52bV9maWxl
ICh1bmxlc3MgdGhlIGRyaXZlciBkb2VzIGV4cGxpY2l0bHkgY2FyZSwgbGlrZSBtc20gZG9lcyBp
bgptc21fZ2VtX21tYXBfb2JqKS4KCj4gUGx1cyBwYW5mcm9zdCwgd2hpY2ggaXMgdXNpbmcgZHJt
X2dlbV9zaG1lbV9wdXJnZV9sb2NrZWQuCgpIbW0sIGxvb2tpbmcgYXQgZHJtX2dlbV9zaG1lbV9w
dXJnZV9sb2NrZWQgSSdtIHdvbmRlcmluZyB3aHkgaXQgdXNlcyBhCm1peCBvZiBkZXYtPmFub25f
aW5vZGUtPmlfbWFwcGluZyBhbmQgZmlsZV9pbm9kZShvYmotPmZpbHApLT5pX21hcHBpbmcuCgpB
bHNvIHNobWVtIGhlbHBlcnMgdXNlZCBhIHplcm8gdm1fcGdvZmYgYmVmb3JlLCBvbmx5IGRpZmZl
cmVuY2UgaXMgdGhlCmNoYW5nZSBpcyBhcHBsaWVkIGluIGRybV9nZW1fbW1hcF9vYmooKSBub3cg
aW5zdGVhZCBvZiBzb21ld2hlcmUgaW4gdGhlCnNobWVtIGhlbHBlciBjb2RlLgoKc2xpZ2h0bHkg
Y29uZnVzZWQsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
