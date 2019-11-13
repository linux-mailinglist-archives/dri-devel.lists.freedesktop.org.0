Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFF7FAB21
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4F36E2CA;
	Wed, 13 Nov 2019 07:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CDB6E2CA
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 07:39:49 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-OnmZLSbWOPG7p4x-zPCj8Q-1; Wed, 13 Nov 2019 02:39:05 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D49C801FD2;
 Wed, 13 Nov 2019 07:39:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3587528DC9;
 Wed, 13 Nov 2019 07:39:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0F1D611AAA; Wed, 13 Nov 2019 08:39:02 +0100 (CET)
Date: Wed, 13 Nov 2019 08:39:02 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
Message-ID: <20191113073902.343vfunbjuzy725y@sirius.home.kraxel.org>
References: <20191024191859.31700-1-robh@kernel.org>
 <20191025073042.GL11828@phenom.ffwll.local>
 <20191108162759.GY23790@phenom.ffwll.local>
 <d2146f86-ddb8-242e-025f-d29a43682487@suse.de>
 <20191112093246.GD23790@phenom.ffwll.local>
 <06f1f400-2e20-5c40-c0ea-967f1ab2b787@suse.de>
 <20191112103819.vcuhtqpfzbkta6ml@sirius.home.kraxel.org>
 <20191112144435.GK23790@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20191112144435.GK23790@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: OnmZLSbWOPG7p4x-zPCj8Q-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573630788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Nu2nV4CNF8dHD6VQggPyRH5eMY1J0ucTQHCrTooV4s=;
 b=UINjG37RMjqtHQboj/V7b4sTjpBMLu3mfkX1T4PMCpvwl1ICnaKqQB1WG0TaaYYLnFuOvK
 Uc8ArWvVrlKgi7pNXb1lv3CwrBvOWPuRU0VOoM9bYD7yJ6QtRMAXI/RuQJ/FYwJwnNwnh1
 9J87Jl7mALMpeaUR8nd9ss9MBVWpT7w=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiA+ID4+IFZSQU0gaGVscGVycyB1c2UgZHJtX2dlbV90dG1fbW1hcCgpLCB3aGlj
aCB3cmFwcyB0dG1fYm9fbW1hcF9vYmooKS4KPiA+ID4gPj4gVGhlc2UgY2hhbmdlcyBzaG91bGQg
YmUgdHJhbnNwYXJlbnQuCj4gPiA+ID4gCj4gPiA+ID4gVGhlcmUncyBzdGlsbCB0aGUgaXNzdWUg
dGhhdCBmb3IgZG1hLWJ1ZiBtbWFwIHZzIGRybSBtbWFwIHlvdSB1c2UKPiA+ID4gPiBkaWZmZXJl
bnQgZl9tYXBwaW5nLCB3aGljaCBtZWFucyB0dG0ncyBwdGUgc2hvb3Rkb3duIHdvbid0IHdvcmsg
Y29ycmVjdGx5Cj4gPiA+ID4gZm9yIGRtYS1idWYgbW1hcHMuIEJ1dCB5ZWFoIG5vcm1hbCBvcGVy
YXRpb24gZm9yIHR0bS92cmFtIGhlbHBlcnMgc2hvdWxkCj4gPiA+ID4gYmUgZmluZS4KPiA+ID4g
Cj4gPiA+IFZSQU0gaGVscGVycyBkb24ndCBzdXBwb3J0IGRtYWJ1ZnMuCj4gPiAKPiA+IEl0J3Mg
bm90IHRoYXQgc2ltcGxlLiAgRXZlbiB3aGVuIG5vdCBzdXBwb3J0aW5nIGRtYS1idWYgZXhwb3J0
IGFuZAo+ID4gaW1wb3J0IGl0IGlzIHN0aWxsIHBvc3NpYmxlIHRvIGNyZWF0ZSBkbWEtYnVmcywg
aW1wb3J0IHRoZW0gaW50byB0aGUKPiA+IHNhbWUgZHJpdmVyICh3aGljaCBkb2Vzbid0IGFjdHVh
bGx5IGV4cG9ydCtpbXBvcnQgYnV0IGp1c3QgZ3JhYnMgYSBnZW0KPiA+IG9iamVjdCByZWZlcmVu
Y2UgaW5zdGVhZCkgYW5kIGFsc28gdG8gbW1hcCB0aGVtIHZpYSBwcmltZS9kbWEtYnVmIGNvZGUK
PiA+IHBhdGggLi4uCgouLi4gYnV0IGFmdGVyIGxvb2tpbmcgYWdhaW4gSSB0aGluayB3ZSBhcmUg
YWxsIGdyZWVuIGhlcmUuICBHaXZlbiB0aGF0Cm9ubHkgc2VsZi1pbXBvcnQgd29ya3Mgd2UnbGwg
b25seSBzZWUgdnJhbSBnZW0gb2JqZWN0cyBpbiB0aGUgbW1hcCBjb2RlCnBhdGgsIHdoaWNoIHNo
b3VsZCBoYXZlIGV2ZXJ5dGhpbmcgc2V0IHVwIGNvcnJlY3RseS4gIFNhbWUgZ29lcyBmb3IgcXhs
LgoKQWxsIG90aGVyIHR0bSBkcml2ZXJzIHN0aWxsIHVzZSB0aGUgb2xkIG1tYXAgY29kZSBwYXRo
LCBzbyBhbGwgZ3JlZW4KdGhlcmUgdG9vIEkgdGhpbmsuICBBbHNvIEkgc29tZWhvdyBkb3VidCBk
bWEtYnVmIG1tYXAgdnMuIGRybSBtbWFwIGVuZHMKdXAgdXNpbmcgZGlmZmVyZW50IGZfbWFwcGlu
ZywgdHRtIGNvZGUgaGFzIGEgV0FSTl9PTiBpbiB0dG1fYm9fdm1fb3BlbigpCndoaWNoIHdvdWxk
IGZpcmUgc2hvdWxkIHRoYXQgYmUgdGhlIGNhc2UuCgpEbyBpbXBvcnRlZCBkbWEtYnVmcyBoaXQg
dGhlIGRybSBtbWFwIGNvZGUgcGF0aCBpbiB0aGUgZmlyc3QgcGxhY2U/CldvdWxkbid0IG1tYXAg
YmUgaGFuZGxlZCBieSB0aGUgZXhwb3J0aW5nIGRyaXZlcj8KCj4gPiBDYW4gdHRtIHVzZSB0aGUg
c2FtZSB0cmljayBtc20gdXNlcz8gIE5vdyB0aGF0IHR0bSBibydzIGFyZSBhIGdlbSBvYmplY3QK
PiA+IHN1cGVyY2xhc3MgSSB0aGluayB3ZSBzaG91bGQgYmUgYWJsZSB0byBzd2l0Y2ggdm1hLT52
bV9maWxlIHRvCj4gPiBiby0+YmFzZS5maWxwLCBzaW1saWFyIHRvIG1zbV9nZW1fbW1hcF9vYmoo
KSwgcHJvYmFibHkgYmVzdCBkb25lIGluCj4gPiBkcm1fZ2VtX3R0bV9tbWFwKCkuCj4gCj4gYm8t
PmJhc2UuZmlscCBpcyB0aGUgc2htZW0gaW5vZGUgZmlsZSwgYW5kIEknbSBub3QgdG9vIHN1cmUg
aG93IG11Y2ggc2htZW0KPiBhcHByb3ZlcyBvZiB1cyBtaXNhcHByb3ByaWF0aW5nIHRoZSBtYXBw
aW5nLiBGb3Igc2htZW0gb25seSBvYmplY3RzIGl0Cj4gcHJvYmFibHkgZG9lc24ndCBtYXR0ZXIg
KHNpbmNlIGJvdGggZ2VtIG1tYXBzIGFuZCBzaG1lbSBtbWFwcyB3aWxsIHBvaW50Cj4gYXQgdGhl
IHNhbWUgdW5kZXJseWluZyBzdHJ1Y3QgcGFnZSksIGJ1dCBmb3IgdnJhbS90dG0vYW55dGhpbmcg
ZWxzZSB0aGUKPiBnZW0gbW1hcCBtaWdodCBwb2ludCBpbnRvIGlvbWVtLCBhbmQgc2htZW0gdGhl
biBtaWdodCBnbyBib29tIHRyeWluZyB0byBkbwo+IHN0dWZmIHdpdGggdGhhdC4KClllcywgYWdy
ZWVpbmcgaGVyZSBhZnRlciB3YWRpbmcgdGhyb3VnaCB0aGUgY29kZSAuLi4KCj4gSSB0aGluayBo
YXZpbmcgb3VyIG93biBtYXBwaW5nIHdvdWxkIGJlIHRoZSBjbGVhbmVzdAo+IGxvbmctdGVybSBh
cHByb2FjaCAuLi4KCllvdSBtZWFuIHVzaW5nIHBlciBkcm0gb2JqZWN0IChpbnN0ZWFkIG9mIHBl
ciBkcm0gZGV2aWNlKSBhZGRyZXNzIHNwYWNlcz8KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
