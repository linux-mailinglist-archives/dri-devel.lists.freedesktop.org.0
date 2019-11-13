Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 718C3FABD9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 09:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74796EC95;
	Wed, 13 Nov 2019 08:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DCA6EC95
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 08:17:59 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id y194so1018505oie.4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 00:17:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1vNQzlrPxZ4is+Ac1eE+qqMXngmCKwekAAqVCdjBoNA=;
 b=B7Y595FGKUwQaGXu2ymCbx0TPN7rn78+fKllwFrtbykv6SQr4SShoBfDcvex8yqw7G
 YtthZCv7KN4tKQwqBHJ2h1Ge+nNJiraBCO8dz6PnVjHY62Ucfhujko1nRci4YhPA29m5
 x1LT934BkHNA9mE23jSH6DSAQwRSWxBmXkZsRsiwJCzVaOV6eN1I+clu1YpXcLE/ahhj
 etjz7WV5dYwUG8XqT5C5kP6azYrFQmf+ouUqryR06LWC+dRZqPG0KJd0ODz6cBzcamoF
 yPbb0Gp3DURauTHrZFKh0cDgcMBM/LCiHnPBrxVMUN9XJIyi8eRcP9rFKwGw47dcdPIM
 MzLg==
X-Gm-Message-State: APjAAAWAzgwB0OH+tpQ/2YEh1L+d2rpzAvDPv80dxTrkT0uQrurp1/Ys
 7AEeaHY9ryARFtkoU2nYPcpFFflgHVuCD+NQvOl/oQ==
X-Google-Smtp-Source: APXvYqzWDciq8sEAcHML1Lf46cYzWXvs31PSMPzn/eYZ7dbvoSqtHISlMkLSiaP3kWsAOjl/Rj85l5NWIQnkhP6VGpI=
X-Received: by 2002:aca:39d7:: with SMTP id g206mr1780903oia.101.1573633078800; 
 Wed, 13 Nov 2019 00:17:58 -0800 (PST)
MIME-Version: 1.0
References: <20191024191859.31700-1-robh@kernel.org>
 <20191025073042.GL11828@phenom.ffwll.local>
 <20191108162759.GY23790@phenom.ffwll.local>
 <d2146f86-ddb8-242e-025f-d29a43682487@suse.de>
 <20191112093246.GD23790@phenom.ffwll.local>
 <06f1f400-2e20-5c40-c0ea-967f1ab2b787@suse.de>
 <20191112103819.vcuhtqpfzbkta6ml@sirius.home.kraxel.org>
 <20191112144435.GK23790@phenom.ffwll.local>
 <20191113073902.343vfunbjuzy725y@sirius.home.kraxel.org>
In-Reply-To: <20191113073902.343vfunbjuzy725y@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 13 Nov 2019 09:17:47 +0100
Message-ID: <CAKMK7uF7G_H3ZvMpFkqKdGXc5H8P=vAtfoREksJJyysQmxOYzQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1vNQzlrPxZ4is+Ac1eE+qqMXngmCKwekAAqVCdjBoNA=;
 b=MZSv+440LhuwSTcbO3G/5+8MNuhCzwyZzpvRpVp3jLhA2zOrVIsc28vuLydzUn+pAf
 fkfZwIk+7ZzJGNCLMh7/lcuvYFjVo2KFDrvsXVt+iFqqxdjoRhBUNrMJAOjCW/+xbP0i
 KsuJ1udpx4crBrhftMtrw1p2dS60UTB5YN/1Q=
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

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgODozOSBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiAgIEhpLAo+Cj4gPiA+ID4gPj4gVlJBTSBoZWxwZXJzIHVzZSBk
cm1fZ2VtX3R0bV9tbWFwKCksIHdoaWNoIHdyYXBzIHR0bV9ib19tbWFwX29iaigpLgo+ID4gPiA+
ID4+IFRoZXNlIGNoYW5nZXMgc2hvdWxkIGJlIHRyYW5zcGFyZW50Lgo+ID4gPiA+ID4KPiA+ID4g
PiA+IFRoZXJlJ3Mgc3RpbGwgdGhlIGlzc3VlIHRoYXQgZm9yIGRtYS1idWYgbW1hcCB2cyBkcm0g
bW1hcCB5b3UgdXNlCj4gPiA+ID4gPiBkaWZmZXJlbnQgZl9tYXBwaW5nLCB3aGljaCBtZWFucyB0
dG0ncyBwdGUgc2hvb3Rkb3duIHdvbid0IHdvcmsgY29ycmVjdGx5Cj4gPiA+ID4gPiBmb3IgZG1h
LWJ1ZiBtbWFwcy4gQnV0IHllYWggbm9ybWFsIG9wZXJhdGlvbiBmb3IgdHRtL3ZyYW0gaGVscGVy
cyBzaG91bGQKPiA+ID4gPiA+IGJlIGZpbmUuCj4gPiA+ID4KPiA+ID4gPiBWUkFNIGhlbHBlcnMg
ZG9uJ3Qgc3VwcG9ydCBkbWFidWZzLgo+ID4gPgo+ID4gPiBJdCdzIG5vdCB0aGF0IHNpbXBsZS4g
IEV2ZW4gd2hlbiBub3Qgc3VwcG9ydGluZyBkbWEtYnVmIGV4cG9ydCBhbmQKPiA+ID4gaW1wb3J0
IGl0IGlzIHN0aWxsIHBvc3NpYmxlIHRvIGNyZWF0ZSBkbWEtYnVmcywgaW1wb3J0IHRoZW0gaW50
byB0aGUKPiA+ID4gc2FtZSBkcml2ZXIgKHdoaWNoIGRvZXNuJ3QgYWN0dWFsbHkgZXhwb3J0K2lt
cG9ydCBidXQganVzdCBncmFicyBhIGdlbQo+ID4gPiBvYmplY3QgcmVmZXJlbmNlIGluc3RlYWQp
IGFuZCBhbHNvIHRvIG1tYXAgdGhlbSB2aWEgcHJpbWUvZG1hLWJ1ZiBjb2RlCj4gPiA+IHBhdGgg
Li4uCj4KPiAuLi4gYnV0IGFmdGVyIGxvb2tpbmcgYWdhaW4gSSB0aGluayB3ZSBhcmUgYWxsIGdy
ZWVuIGhlcmUuICBHaXZlbiB0aGF0Cj4gb25seSBzZWxmLWltcG9ydCB3b3JrcyB3ZSdsbCBvbmx5
IHNlZSB2cmFtIGdlbSBvYmplY3RzIGluIHRoZSBtbWFwIGNvZGUKPiBwYXRoLCB3aGljaCBzaG91
bGQgaGF2ZSBldmVyeXRoaW5nIHNldCB1cCBjb3JyZWN0bHkuICBTYW1lIGdvZXMgZm9yIHF4bC4K
Pgo+IEFsbCBvdGhlciB0dG0gZHJpdmVycyBzdGlsbCB1c2UgdGhlIG9sZCBtbWFwIGNvZGUgcGF0
aCwgc28gYWxsIGdyZWVuCj4gdGhlcmUgdG9vIEkgdGhpbmsuICBBbHNvIEkgc29tZWhvdyBkb3Vi
dCBkbWEtYnVmIG1tYXAgdnMuIGRybSBtbWFwIGVuZHMKPiB1cCB1c2luZyBkaWZmZXJlbnQgZl9t
YXBwaW5nLCB0dG0gY29kZSBoYXMgYSBXQVJOX09OIGluIHR0bV9ib192bV9vcGVuKCkKPiB3aGlj
aCB3b3VsZCBmaXJlIHNob3VsZCB0aGF0IGJlIHRoZSBjYXNlLgo+Cj4gRG8gaW1wb3J0ZWQgZG1h
LWJ1ZnMgaGl0IHRoZSBkcm0gbW1hcCBjb2RlIHBhdGggaW4gdGhlIGZpcnN0IHBsYWNlPwo+IFdv
dWxkbid0IG1tYXAgYmUgaGFuZGxlZCBieSB0aGUgZXhwb3J0aW5nIGRyaXZlcj8KCmRybV9nZW1f
ZG1hYnVmX21tYXAgLT4gb2JqLT5mdW5jcy0+bW1hcCAtPiB0dG1fYm9fbW1hcF9vYmoKCkFuZCBJ
J20gbm90IHNlZWluZyBhbnlvbmUgYWRqdXN0aW5nIHZtX2ZpbGUtPmZfbWFwcGluZyBhbnl3aGVy
ZSBoZXJlIGF0IGFsbC4KCk5vdGUgdG8gaGl0IHRoaXMgeW91IG5lZWQgdXNlcnNwYWNlIHRvCi0g
aGFuZGxlMmZkIG9uIGEgYnVmZmVyIHRvIGNyZWF0ZSBhIGRtYS1idWYgZmQKLSBjYWxsIG1tYXAg
ZGlyZWN0bHkgb24gdGhhdCBkbWEtYnVmIGZkCgo+ID4gPiBDYW4gdHRtIHVzZSB0aGUgc2FtZSB0
cmljayBtc20gdXNlcz8gIE5vdyB0aGF0IHR0bSBibydzIGFyZSBhIGdlbSBvYmplY3QKPiA+ID4g
c3VwZXJjbGFzcyBJIHRoaW5rIHdlIHNob3VsZCBiZSBhYmxlIHRvIHN3aXRjaCB2bWEtPnZtX2Zp
bGUgdG8KPiA+ID4gYm8tPmJhc2UuZmlscCwgc2ltbGlhciB0byBtc21fZ2VtX21tYXBfb2JqKCks
IHByb2JhYmx5IGJlc3QgZG9uZSBpbgo+ID4gPiBkcm1fZ2VtX3R0bV9tbWFwKCkuCj4gPgo+ID4g
Ym8tPmJhc2UuZmlscCBpcyB0aGUgc2htZW0gaW5vZGUgZmlsZSwgYW5kIEknbSBub3QgdG9vIHN1
cmUgaG93IG11Y2ggc2htZW0KPiA+IGFwcHJvdmVzIG9mIHVzIG1pc2FwcHJvcHJpYXRpbmcgdGhl
IG1hcHBpbmcuIEZvciBzaG1lbSBvbmx5IG9iamVjdHMgaXQKPiA+IHByb2JhYmx5IGRvZXNuJ3Qg
bWF0dGVyIChzaW5jZSBib3RoIGdlbSBtbWFwcyBhbmQgc2htZW0gbW1hcHMgd2lsbCBwb2ludAo+
ID4gYXQgdGhlIHNhbWUgdW5kZXJseWluZyBzdHJ1Y3QgcGFnZSksIGJ1dCBmb3IgdnJhbS90dG0v
YW55dGhpbmcgZWxzZSB0aGUKPiA+IGdlbSBtbWFwIG1pZ2h0IHBvaW50IGludG8gaW9tZW0sIGFu
ZCBzaG1lbSB0aGVuIG1pZ2h0IGdvIGJvb20gdHJ5aW5nIHRvIGRvCj4gPiBzdHVmZiB3aXRoIHRo
YXQuCj4KPiBZZXMsIGFncmVlaW5nIGhlcmUgYWZ0ZXIgd2FkaW5nIHRocm91Z2ggdGhlIGNvZGUg
Li4uCj4KPiA+IEkgdGhpbmsgaGF2aW5nIG91ciBvd24gbWFwcGluZyB3b3VsZCBiZSB0aGUgY2xl
YW5lc3QKPiA+IGxvbmctdGVybSBhcHByb2FjaCAuLi4KPgo+IFlvdSBtZWFuIHVzaW5nIHBlciBk
cm0gb2JqZWN0IChpbnN0ZWFkIG9mIHBlciBkcm0gZGV2aWNlKSBhZGRyZXNzIHNwYWNlcz8KCll1
cC4gQnV0IEkgdGhpbmsgdGhhdCB3b3VsZCBiZSBxdWl0ZSBhIHBpbGUgb2Ygd29yaywgc2luY2Ug
d2UgbmVlZCBhbgphbm9uIGlub2RlIGZvciBlYWNoIGdlbSBiby4KLURhbmllbAotLSAKRGFuaWVs
IFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAz
NjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
