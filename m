Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5AB97F29
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 17:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2282589C13;
	Wed, 21 Aug 2019 15:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C83E899BE
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 15:41:56 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id x19so3425253eda.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 08:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=TzES47saF8NKSoTAe4F4vrhi3jlFL+ouHP/sqVU4VOA=;
 b=iEV6Ied8uUVinndtEogxrvQ65MaJc0avxCfSyE0cbludcU561R5zN8R2yz5WUBXI4c
 5gHuZtIKmXAm3b0D37IKMiXUFh+GXp3eJtHXGjK1lgbRx4pfiAoWPzv97mqJDM2Vy+fQ
 oUJy0ImyMh5mDHmBOw7KtkMVHDQ854Mar8NNXZtMqn9uUaVtgvtwctyiYzbc8BRgO419
 s37jnvfCqsL4M8tPUhKhn7FyqvvrVjRQblXU4fniX2ykb4Oot4BjLhkvggfgJ2zKGNMM
 vOm1bfh33EbcKLElDklZ3JLbCAfmPDgPCwxmCvFjDZIv+jqGy/B6vKKRFFpLSB6qtT5R
 5C3A==
X-Gm-Message-State: APjAAAUMLKgxohaZUwZGgrtOGEgw2oFoYxKc8lRSDGNAtOeCjfyy0NTJ
 EOlSJHmnN6kE6/MJjPEOYpGVgw==
X-Google-Smtp-Source: APXvYqwWJhWck0Z/MmVSLXaA3iVsv5ZDCiK9fhLd/PhSRNH0psxEEEcoafaHzeMpQpUIWsBpQto6SA==
X-Received: by 2002:a50:ef04:: with SMTP id m4mr37875974eds.155.1566402114914; 
 Wed, 21 Aug 2019 08:41:54 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id a18sm3193136ejp.2.2019.08.21.08.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 08:41:53 -0700 (PDT)
Date: Wed, 21 Aug 2019 17:41:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>, LKML <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>,
 David Rientjes <rientjes@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH 4/4] mm, notifier: Catch sleeping/blocking for !blockable
Message-ID: <20190821154151.GK11147@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michal Hocko <mhocko@suse.com>,
 David Rientjes <rientjes@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
References: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
 <20190820081902.24815-5-daniel.vetter@ffwll.ch>
 <20190820133418.GG29246@ziepe.ca>
 <20190820151810.GG11147@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820151810.GG11147@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=TzES47saF8NKSoTAe4F4vrhi3jlFL+ouHP/sqVU4VOA=;
 b=YgkSS7DQjqyYKcGQZhqNTt8KsjkNcU3e15Siy/lp1QKKNznQVEuAuek7xiD5HvGQ3l
 rxKMLveu/keUgwkclgC0bHPMJ9WDbcN9mWMtNyKF9IzS4GD6/KDOhpxdW1J/mMNlAtpQ
 EQnf1dtH5RzQdObCyV79VbVjMHs6ycyH1m2+c=
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

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMDU6MTg6MTBQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIEF1ZyAyMCwgMjAxOSBhdCAxMDozNDoxOEFNIC0wMzAwLCBKYXNvbiBH
dW50aG9ycGUgd3JvdGU6Cj4gPiBPbiBUdWUsIEF1ZyAyMCwgMjAxOSBhdCAxMDoxOTowMkFNICsw
MjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gPiBXZSBuZWVkIHRvIG1ha2Ugc3VyZSBpbXBs
ZW1lbnRhdGlvbnMgZG9uJ3QgY2hlYXQgYW5kIGRvbid0IGhhdmUgYQo+ID4gPiBwb3NzaWJsZSBz
Y2hlZHVsZS9ibG9ja2luZyBwb2ludCBkZWVwbHkgYnVycmllZCB3aGVyZSByZXZpZXcgY2FuJ3QK
PiA+ID4gY2F0Y2ggaXQuCj4gPiA+IAo+ID4gPiBJJ20gbm90IHN1cmUgd2hldGhlciB0aGlzIGlz
IHRoZSBiZXN0IHdheSB0byBtYWtlIHN1cmUgYWxsIHRoZQo+ID4gPiBtaWdodF9zbGVlcCgpIGNh
bGxzaXRlcyB0cmlnZ2VyLCBhbmQgaXQncyBhIGJpdCB1Z2x5IGluIHRoZSBjb2RlIGZsb3cuCj4g
PiA+IEJ1dCBpdCBnZXRzIHRoZSBqb2IgZG9uZS4KPiA+ID4gCj4gPiA+IEluc3BpcmVkIGJ5IGFu
IGk5MTUgcGF0Y2ggc2VyaWVzIHdoaWNoIGRpZCBleGFjdGx5IHRoYXQsIGJlY2F1c2UgdGhlCj4g
PiA+IHJ1bGVzIGhhdmVuJ3QgYmVlbiBlbnRpcmVseSBjbGVhciB0byB1cy4KPiA+ID4gCj4gPiA+
IHYyOiBVc2UgdGhlIHNoaW55IG5ldyBub25fYmxvY2tfc3RhcnQvZW5kIGFubm90YXRpb25zIGlu
c3RlYWQgb2YKPiA+ID4gYWJ1c2luZyBwcmVlbXB0X2Rpc2FibGUvZW5hYmxlLgo+ID4gPiAKPiA+
ID4gdjM6IFJlYmFzZSBvbiB0b3Agb2YgR2xpc3NlJ3MgYXJnIHJld29yay4KPiA+ID4gCj4gPiA+
IHY0OiBSZWJhc2Ugb24gdG9wIG9mIG1vcmUgR2xpc3NlIHJld29yay4KPiA+ID4gCj4gPiA+IENj
OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KPiA+ID4gQ2M6IEFuZHJldyBNb3J0b24g
PGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gPiA+IENjOiBNaWNoYWwgSG9ja28gPG1ob2Nr
b0BzdXNlLmNvbT4KPiA+ID4gQ2M6IERhdmlkIFJpZW50amVzIDxyaWVudGplc0Bnb29nbGUuY29t
Pgo+ID4gPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
Cj4gPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4gPiBD
YzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiA+ID4gQ2M6IGxpbnV4
LW1tQGt2YWNrLm9yZwo+ID4gPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxq
Z2xpc3NlQHJlZGhhdC5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+ID4gPiAgbW0vbW11X25vdGlmaWVyLmMgfCA4ICsrKysr
KystCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvbW0vbW11X25vdGlmaWVyLmMgYi9tbS9tbXVfbm90
aWZpZXIuYwo+ID4gPiBpbmRleCA1MzhkM2JiODdmOWIuLjg1NjYzNmQwNmVlMCAxMDA2NDQKPiA+
ID4gKysrIGIvbW0vbW11X25vdGlmaWVyLmMKPiA+ID4gQEAgLTE4MSw3ICsxODEsMTMgQEAgaW50
IF9fbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoc3RydWN0IG1tdV9ub3RpZmll
cl9yYW5nZSAqcmFuZ2UpCj4gPiA+ICAJaWQgPSBzcmN1X3JlYWRfbG9jaygmc3JjdSk7Cj4gPiA+
ICAJaGxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KG1uLCAmcmFuZ2UtPm1tLT5tbXVfbm90aWZpZXJf
bW0tPmxpc3QsIGhsaXN0KSB7Cj4gPiA+ICAJCWlmIChtbi0+b3BzLT5pbnZhbGlkYXRlX3Jhbmdl
X3N0YXJ0KSB7Cj4gPiA+IC0JCQlpbnQgX3JldCA9IG1uLT5vcHMtPmludmFsaWRhdGVfcmFuZ2Vf
c3RhcnQobW4sIHJhbmdlKTsKPiA+ID4gKwkJCWludCBfcmV0Owo+ID4gPiArCj4gPiA+ICsJCQlp
ZiAoIW1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2FibGUocmFuZ2UpKQo+ID4gPiArCQkJCW5vbl9i
bG9ja19zdGFydCgpOwo+ID4gPiArCQkJX3JldCA9IG1uLT5vcHMtPmludmFsaWRhdGVfcmFuZ2Vf
c3RhcnQobW4sIHJhbmdlKTsKPiA+ID4gKwkJCWlmICghbW11X25vdGlmaWVyX3JhbmdlX2Jsb2Nr
YWJsZShyYW5nZSkpCj4gPiA+ICsJCQkJbm9uX2Jsb2NrX2VuZCgpOwo+ID4gCj4gPiBJZiBzb21l
b25lIEFja3MgYWxsIHRoZSBzY2hlZCBjaGFuZ2VzIHRoZW4gSSBjYW4gcGljayB0aGlzIGZvcgo+
ID4gaG1tLmdpdCwgYnV0IEkgc3RpbGwgdGhpbmsgdGhlIGV4aXN0aW5nIHByZS1lbXB0aW9uIGRl
YnVnZ2luZyBpcyBmaW5lCj4gPiBmb3IgdGhpcyB1c2UgY2FzZS4KPiAKPiBPaywgSSdsbCBwaW5n
IFBldGVyIFouIGZvciBhbiBhY2ssIGlpcmMgaGUgd2FzIGludm9sdmVkLgo+IAo+ID4gQWxzbywg
c2FtZSBjb21tZW50IGFzIGZvciB0aGUgbG9ja2RlcCBtYXAsIHRoaXMgbmVlZHMgdG8gYXBwbHkg
dG8gdGhlCj4gPiBub24tYmxvY2tpbmcgcmFuZ2VfZW5kIGFsc28uCj4gCj4gSG0sIEkgdGhvdWdo
dCB0aGUgcGFnZSB0YWJsZSBsb2NrcyB3ZSdyZSBob2xkaW5nIHRoZXJlIGFscmVhZHkgcHJldmVu
dCBhbnkKPiBzbGVlcGluZywgc28gd291bGQgYmUgcmVkdW5kYW50PyBCdXQgcmVhZGluZyB0aHJv
dWdoIGNvZGUgSSB0aGluayB0aGF0J3MKPiBub3QgZ3VhcmFudGVlZCwgc28geWVhaCBtYWtlcyBz
ZW5zZSB0byBhZGQgaXQgZm9yIGludmFsaWRhdGVfcmFuZ2VfZW5kCj4gdG9vLiBJJ2xsIHJlc3Bp
biBvbmNlIEkgaGF2ZSB0aGUgYWNrL25hY2sgZnJvbSBzY2hlZHVsZXIgcGVvcGxlLgoKU28gSSBz
dGFydGVkIHRvIGxvb2sgaW50byB0aGlzLCBhbmQgSSdtIGEgYml0IGNvbmZ1c2VkLiBUaGVyZSdz
IG5vCl9ub25ibG9jayB2ZXJzaW9uIG9mIHRoaXMsIHNvIGRvZXMgdGhpcyBtZWFucyBibG9ja2lu
ZyBpcyBuZXZlciBhbGxvd2VkLApvciBhbHdheXMgYWxsb3dlZD8KCkZyb20gYSBxdWljayBsb29r
IHRocm91Z2ggaW1wbGVtZW50YXRpb25zIEkndmUgb25seSBzZWVuIHNwaW5sb2NrcywgYW5kCm9u
ZSB1cF9yZWFkLiBTbyBJIGd1ZXNzIEkgc2hvdWxkIHdyYXBlIHRoaXMgY2FsbGJhY2sgaW4gc29t
ZSB1bmNvbmRpdGlvbmFsCm5vbl9ibG9ja19zdGFydC9lbmQsIGJ1dCBJJ20gbm90IHN1cmUuCgpU
aGFua3MsIERhbmllbAoKCj4gPiBBbnlob3csIHNpbmNlIHRoaXMgc2VyaWVzIGhhcyBjb25mbGlj
dHMgd2l0aCBobW0uZ2l0IGl0IHdvdWxkIGJlIGJlc3QKPiA+IHRvIGZsb3cgdGhyb3VnaCB0aGUg
d2hvbGUgdGhpbmcgdGhyb3VnaCB0aGF0IHRyZWUuIElmIHRoZXJlIGFyZSBubwo+ID4gcmVtYXJr
cyBvbiB0aGUgZmlyc3QgdHdvIHBhdGNoZXMgSSdsbCBncmFiIHRoZW0gaW4gYSBmZXcgZGF5cy4K
PiAKPiBUaGFua3MsIERhbmllbAo+IC0tIAo+IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2FyZSBFbmdp
bmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiBodHRwOi8vYmxvZy5mZndsbC5jaAoKLS0gCkRhbmll
bCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9n
LmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
