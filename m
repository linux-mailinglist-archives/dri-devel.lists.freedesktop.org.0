Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96229484F8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 16:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190E489263;
	Mon, 17 Jun 2019 14:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF10C89274
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 14:11:53 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w13so16390947eds.4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 07:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=zlCo9TC98c5FZkjUzIf1KLkN5UgmU6J99oGWDzFXHpI=;
 b=f+rNWH/4wmdqbphkpZlFtaXFRtz0BabNO3YusLmZwY45D39EQRlbFCdwRhfpu3ooJ9
 VYeYprPzMnvfR9pOurQu5ogVvYgMW7ObsivLQsrP/zfbgyi5Iav/UTj8ecyMdIikEpte
 B+REy4ISi1IHxh61U4InxescrP/udGD4Dznk8bUWzXbLykqENdnXDpcqKyFpvlf0hB4o
 XnIqEsq56y6XX54DtFjdGndX8OfOJDPKE7cRxsw7mv0Xb/D5ALb9U9/nwI4rgwpswB2f
 chwhPMLgfswP3TNtXFh4l/xm3yI/k0KcRF1KBYDqeC8+FwOszoGfqucgYDNn35OLBYWq
 7GCQ==
X-Gm-Message-State: APjAAAXdro9sVYjMWKfOtSxqkceTPP9LAm02yQrEQrETYIQe6ijiUh8N
 23xNW1dtFODrrQyDmK7ZJBRDSg==
X-Google-Smtp-Source: APXvYqyFOj7EMYy9qivyoZv6/j9iQIWwU8H2myH8qg8E6iBR3g1ZdPTuAJd2zbKKIw0TxP9ixHftTQ==
X-Received: by 2002:aa7:c486:: with SMTP id m6mr54266304edq.298.1560780712473; 
 Mon, 17 Jun 2019 07:11:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id m19sm2186424eje.30.2019.06.17.07.11.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 07:11:50 -0700 (PDT)
Date: Mon, 17 Jun 2019 16:11:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] drm/virtio: pass gem reservation object to ttm init
Message-ID: <20190617141148.GE12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20190617111406.14765-1-kraxel@redhat.com>
 <20190617111406.14765-2-kraxel@redhat.com>
 <20190617140825.GD12905@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617140825.GD12905@phenom.ffwll.local>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zlCo9TC98c5FZkjUzIf1KLkN5UgmU6J99oGWDzFXHpI=;
 b=E1lV/u7o1nMu/5qcTlwV2LMql4XhweKWVE452oSFGI9R9SjCnpHHJnbxQXIKoXvsmz
 MjEC7OHqO9/kJOeec+mu0Z8koL5fprasZn58JKAQBBN+0wxWXoJYVbr7u+ap7ulflBy9
 qPQrTUudwz+GPCINTlkK6HQ+6xSffoDX3Zgzg=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDQ6MDg6MjVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBNb24sIEp1biAxNywgMjAxOSBhdCAwMToxNDowM1BNICswMjAwLCBHZXJkIEhv
ZmZtYW5uIHdyb3RlOgo+ID4gV2l0aCB0aGlzIGdlbSBhbmQgdHRtIHdpbGwgdXNlIHRoZSBzYW1l
IHJlc2VydmF0aW9uIG9iamVjdCwKPiA+IHNvIG1peGluZyBhbmQgbWF0Y2hpbmcgdHRtIC8gZ2Vt
IHJlc2VydmF0aW9uIGhlbHBlcnMgc2hvdWxkCj4gPiB3b3JrIGZpbmUuCj4gPiAKPiA+IFNpZ25l
ZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+IAo+IFdoaWxlIGRv
aW5nIG15IHByaW1lIGRvYytjbGVhbnVwIHNlcmllcyBJIHdvbmRlcmVkIHdoZXRoZXIgd2Ugc2hv
dWxkIGRvCj4gdGhpcyBmb3IgZXZlcnlvbmUsIGFuZCBwZXJoYXBzIGV2ZW4gcmVtb3ZlIHR0bV9i
by50dG1fcmVzdi4gT25seSBkcml2ZXIKPiB3aGljaCBkb2Vzbid0IHlldCBoYXZlIGEgZ2VtX2Jv
IGVtYmVkZGVkIGluIHRoZSBzYW1lIGFsbG9jYXRpb24gaXMgdm13Z2Z4LAo+IGFuZCB0aGF0IHdv
dWxkIGJlIGVhc3kgdG8gZml4IGJ5IGFkZGluZyBhIHZtd2dmeF9yZXN2IHNvbWVod2VyZS4KPiAK
PiBBbnl3YXksIGxvb2tzIGxpa2UgYSBzb2xpZCBzdGFydCBpbnRvIHRoZSBjb252ZXJnZW5jZSBz
dG9yeS4KPiAKPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZnds
bC5jaD4KCkFzaWRlOiBpZiB2aXJ0aW8gZXZlciBhbGxvd3MgZG1hLWJ1ZiBzaGFyaW5nIHdpdGgg
c29tZXRoaW5nIGVsc2UgKG9yCm11bHRpcGxlIHZpcnRpby1ncHUgaW5zdGFuY2VzKSwgdGhlbiB0
b2dldGhlciB3aXRoIG15IHBhdGNoIHNlcmllcyB0aGlzCndpbGwgZml4IGRtYS1idWYgaW1wb3J0
LiBBdG0gdmlydGlvIGlnbm9yZXMgdGhlIHJlc2VydmF0aW9uIG9iamVjdCBvZiB0aGUKaW1wb3J0
ZWQgZG1hLWJ1Ziwgd2hpY2ggZm9yIGZvcmVpbmcgb2JqZWN0cyByZWFsbHkgaXNuJ3QgY29ycmVj
dC4KLURhbmllbAoKPiAKPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV9vYmplY3QuYyB8IDMgKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVj
dC5jCj4gPiBpbmRleCBiMmRhMzEzMTBkMjQuLjI0Mjc2NmQ2NDRhNyAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYwo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCj4gPiBAQCAtMTMyLDcgKzEzMiw4IEBA
IGludCB2aXJ0aW9fZ3B1X29iamVjdF9jcmVhdGUoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2
Z2RldiwKPiA+ICAJdmlydGlvX2dwdV9pbml0X3R0bV9wbGFjZW1lbnQoYm8pOwo+ID4gIAlyZXQg
PSB0dG1fYm9faW5pdCgmdmdkZXYtPm1tYW4uYmRldiwgJmJvLT50Ym8sIHBhcmFtcy0+c2l6ZSwK
PiA+ICAJCQkgIHR0bV9ib190eXBlX2RldmljZSwgJmJvLT5wbGFjZW1lbnQsIDAsCj4gPiAtCQkJ
ICB0cnVlLCBhY2Nfc2l6ZSwgTlVMTCwgTlVMTCwKPiA+ICsJCQkgIHRydWUsIGFjY19zaXplLCBO
VUxMLAo+ID4gKwkJCSAgYm8tPmdlbV9iYXNlLnJlc3YsCj4gPiAgCQkJICAmdmlydGlvX2dwdV90
dG1fYm9fZGVzdHJveSk7Cj4gPiAgCS8qIHR0bV9ib19pbml0IGZhaWx1cmUgd2lsbCBjYWxsIHRo
ZSBkZXN0cm95ICovCj4gPiAgCWlmIChyZXQgIT0gMCkKPiA+IC0tIAo+ID4gMi4xOC4xCj4gPiAK
PiAKPiAtLSAKPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
