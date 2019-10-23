Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2225BE22FC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 21:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3AD6EB7C;
	Wed, 23 Oct 2019 19:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E537E6EB7C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 18:59:59 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n15so12474565wrw.13
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 11:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=+OWjpvr+IZedd7nljlYA8XWBRBItw4xtW0mvQ/KD8Fk=;
 b=l3Na/90OW8dq1Ga5qkDNzOGPzn3tUP9ilIpHVS0sJNsk5qlpjS1coEp7EmZViSK5aw
 bqpT6lqUKOkgZlof+G13TlWwFsDQRhhwiA6jGLEtBXKS+CWCynbYUJ5TSKODWXAfxqPM
 RJBJcRX5S/E9x7YgAYUEg/DMTEAFcysPlx/gHN2W+ZwmSvXPP4iM5Yi9WQ5oh5Gp9K2C
 pQ/x9UnfpifpYu72p9P0WxAMfSS7UuIplcMbZ53AL4wyPNB+ePl9qkOr59QjYYmd+H5U
 Sew9EOF2i6hX3OtzBnjd8CTawMIDe0TPLHC9yML3QlyMziJt/lfPgcW0O802VAG5l9vS
 RiQg==
X-Gm-Message-State: APjAAAVGWnN49Rn6g1eqfDA+e8xh6mkvukU63rnv0dn/VuHJJPd6mPMI
 hUm634rAF/H4kKhzk/hDdO2XKQ==
X-Google-Smtp-Source: APXvYqwQW7fShJRSiaDGCH+qmp4vWbgbdvriTea73n3kmGp5rVj6c+beXl6Ds2NKz1NgdfjTGKBsmA==
X-Received: by 2002:a5d:4a8a:: with SMTP id o10mr205718wrq.101.1571857198467; 
 Wed, 23 Oct 2019 11:59:58 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id r3sm38184702wre.29.2019.10.23.11.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 11:59:55 -0700 (PDT)
Date: Wed, 23 Oct 2019 20:59:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Navid Emamdoost <navid.emamdoost@gmail.com>,
 Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
 Stephen McCamant <smccaman@umn.edu>, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/v3d: Fix memory leak in v3d_submit_cl_ioctl
Message-ID: <20191023185952.GZ11828@phenom.ffwll.local>
Mail-Followup-To: Navid Emamdoost <navid.emamdoost@gmail.com>,
 Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
 Stephen McCamant <smccaman@umn.edu>, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20191021185250.26130-1-navid.emamdoost@gmail.com>
 <20191022093654.GF11828@phenom.ffwll.local>
 <CAEkB2ETFM7u6YiUOT3fz4UQ3U_za9iM1arTnYNg-rjs5+wxOfw@mail.gmail.com>
 <20191023091601.GX11828@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023091601.GX11828@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+OWjpvr+IZedd7nljlYA8XWBRBItw4xtW0mvQ/KD8Fk=;
 b=M95LDREgblcKjvAHssdy4GOnOy+idPXh9WTEOZZdiOlwBVlvkmYF8XPlBP0lSR3FUJ
 PhSUgbLA9MuLMfPxCT7kyPf4tDIinnMjcd6POSe8NgDzz7Tux6+w57eymqpz9vtYVSB3
 30QGpwWmCbAdm1D3IBvAg+C2kg9CjJSyUfU9I=
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

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMTE6MTY6MDFBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIE9jdCAyMiwgMjAxOSBhdCAxMDo1Mzo1N1BNIC0wNTAwLCBOYXZpZCBF
bWFtZG9vc3Qgd3JvdGU6Cj4gPiBPbiBUdWUsIE9jdCAyMiwgMjAxOSBhdCA0OjM2IEFNIERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgT2N0
IDIxLCAyMDE5IGF0IDAxOjUyOjQ5UE0gLTA1MDAsIE5hdmlkIEVtYW1kb29zdCB3cm90ZToKPiA+
ID4gPiBJbiB0aGUgaW1wZWxlbWVudGF0aW9uIG9mIHYzZF9zdWJtaXRfY2xfaW9jdGwoKSB0aGVy
ZSBhcmUgdHdvIG1lbW9yeQo+ID4gPiA+IGxlYWtzLiBPbmUgaXMgd2hlbiBhbGxvY2F0aW9uIGZv
ciBiaW4gZmFpbHMsIGFuZCB0aGUgb3RoZXIgaXMgd2hlbiBiaW4KPiA+ID4gPiBpbml0aWFsaXph
dGlvbiBmYWlscy4gSWYga2NhbGxvYyBmYWlscyB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIGJpbiB0
aGVuCj4gPiA+ID4gcmVuZGVyLT5iYXNlIHNob3VsZCBiZSBwdXQuIEFsc28sIGlmIHYzZF9qb2Jf
aW5pdCgpIGZhaWxzIHRvIGluaXRpYWxpemUKPiA+ID4gPiBiaW4tPmJhc2UgdGhlbiBhbGxvY2F0
ZWQgbWVtb3J5IGZvciBiaW4gc2hvdWxkIGJlIHJlbGVhc2VkLgo+ID4gPiA+Cj4gPiA+ID4gRml4
ZXM6IGE3ODNhMDllZTc2ZCAoImRybS92M2Q6IFJlZmFjdG9yIGpvYiBtYW5hZ2VtZW50LiIpCj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogTmF2aWQgRW1hbWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21h
aWwuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9nZW0u
YyB8IDUgKysrKy0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92
M2QvdjNkX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZ2VtLmMKPiA+ID4gPiBpbmRl
eCA1ZDgwNTA3YjUzOWIuLjE5YzA5MmQ3NTI2NiAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdjNkL3YzZF9nZW0uYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92M2Qv
djNkX2dlbS5jCj4gPiA+ID4gQEAgLTU1NywxMyArNTU3LDE2IEBAIHYzZF9zdWJtaXRfY2xfaW9j
dGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiA+ID4gPgo+ID4gPiA+ICAg
ICAgIGlmIChhcmdzLT5iY2xfc3RhcnQgIT0gYXJncy0+YmNsX2VuZCkgewo+ID4gPiA+ICAgICAg
ICAgICAgICAgYmluID0ga2NhbGxvYygxLCBzaXplb2YoKmJpbiksIEdGUF9LRVJORUwpOwo+ID4g
PiA+IC0gICAgICAgICAgICAgaWYgKCFiaW4pCj4gPiA+ID4gKyAgICAgICAgICAgICBpZiAoIWJp
bikgewo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICB2M2Rfam9iX3B1dCgmcmVuZGVyLT5i
YXNlKTsKPiA+ID4KPiA+ID4gVGhlIGpvYiBpc24ndCBpbml0aWFsaXplZCB5ZXQsIHRoaXMgZG9l
c24ndCB3b3JrLgo+ID4gRG8geW91IG1lYW4gd2UgaGF2ZSB0byByZWxlYXNlIHJlbmRlciB2aWEg
a2ZyZWUoKSBoZXJlPwo+ID4gCj4gPiA+Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiAtRU5PTUVNOwo+ID4gPiA+ICsgICAgICAgICAgICAgfQo+ID4gPiA+Cj4gPiA+ID4gICAg
ICAgICAgICAgICByZXQgPSB2M2Rfam9iX2luaXQodjNkLCBmaWxlX3ByaXYsICZiaW4tPmJhc2Us
Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdjNkX2pvYl9mcmVlLCBh
cmdzLT5pbl9zeW5jX2JjbCk7Cj4gPiA+ID4gICAgICAgICAgICAgICBpZiAocmV0KSB7Cj4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgIHYzZF9qb2JfcHV0KCZyZW5kZXItPmJhc2UpOwo+ID4g
Pgo+ID4gPiB2M2Rfam9iX3B1dCB3aWxsIGNhbGwga2ZyZWUsIGlmIHlvdSBjaGFzZSB0aGUgY2Fs
bGNoYWluIGxvbmcgZW5vdWdoIChpbgo+ID4gPiB2M2Rfam9iX2ZyZWUpLiBTbyBubyBidWcgaGVy
ZSwgdGhpcyB3b3VsZCBsZWFkIHRvIGEgZG91YmxlIGtmcmVlIGFuZAo+ID4gPiBjcmFzaC4KPiA+
IFllcywgdjNkX2pvYl9wdXQoKSB0YWtlcyBjYXJlIG9mIHJlbmRlciwKPiA+IAo+ID4gPiAtRGFu
aWVsCj4gPiA+Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGtmcmVlKGJpbik7Cj4gPiBi
dXQgaG93IGFib3V0IGxlYWtpbmcgYmluPwo+IAo+IFNvcnJ5LCBJIHRvdGFsbHkgbWlzc2VkIHRo
YXQgdGhpcyBpcyBiaW4sIG5vIHJlbmRlci4gUGF0Y2ggbG9va3MgY29ycmVjdAo+IHRvIG1lLgo+
IAo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoK
RG91YmxlLWNoZWNrZWQgd2l0aCBFcmljIGFuZCBhcHBsaWVkIHRvIGRybS1taXNjLWZpeGVzLgot
RGFuaWVsCgo+IAo+ID4gCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7
Cj4gPiA+ID4gICAgICAgICAgICAgICB9Cj4gPiA+ID4KPiA+ID4gPiAtLQo+ID4gPiA+IDIuMTcu
MQo+ID4gPiA+Cj4gPiA+Cj4gPiA+IC0tCj4gPiA+IERhbmllbCBWZXR0ZXIKPiA+ID4gU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gPiA+IGh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cj4gPiAKPiA+IAo+ID4gCj4gPiAtLSAKPiA+IE5hdmlkLgo+IAo+IC0tIAo+IERhbmllbCBWZXR0
ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiBodHRwOi8vYmxvZy5m
ZndsbC5jaAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
