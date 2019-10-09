Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5DCD13E7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 18:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A22E6EA08;
	Wed,  9 Oct 2019 16:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B1B6EA09
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 16:22:15 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id p10so2602316edq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 09:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=JtgO+8vzr/9TpSly+AhzIs3sCwolVOMferKQODctL4k=;
 b=MywI8CGIeCk8CM3Q2l88Z8pxIZRSurMMnpDhPVAY+wZX0suQlBDuJ+FeBta5OOZkUf
 VLxKSgt8splFz/RgKdYHnnrWjA42gsTVrIjOuZRs0AruPHBcT/MLSBO2ZvA4H63AomHg
 crEyCBSNIGyPPjuB8pO91PHGAQboRGYyS0YS8Nte8P49FpB05iy6SThgy2phDJJatGjL
 JWFHPfYA7c1zHKIsCa2WOutNCFxPlc3ZuLi5swEGMH0LDUiOYCcylAQThcgGEOLmqneE
 8e0aMh/Tlp+1drLBwREAuhfcCzxVqnN0idkj8uD9I7yJ0z2xIQ+yM6iAK5ttjRV8lIMr
 2JXw==
X-Gm-Message-State: APjAAAV6WCYv77EvSdQ1d4El+Cv4XWfw4ihYSsRTVtkcBuiXwFYap5iQ
 jALrBDENuwyB1XMGkB9fnBlUEtsDJKk=
X-Google-Smtp-Source: APXvYqzbEMYodoBETVm1ElCZo/Ak7NERVcNUPhsLISv668OadOeNBSoZS3O6iHCQzKil9trm3pAl7Q==
X-Received: by 2002:a05:6402:13d5:: with SMTP id
 a21mr3882916edx.242.1570638133539; 
 Wed, 09 Oct 2019 09:22:13 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id a18sm325719ejy.88.2019.10.09.09.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 09:22:12 -0700 (PDT)
Date: Wed, 9 Oct 2019 18:22:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/6] drm/gem: refine drm_gem_objects_lookup
Message-ID: <20191009162210.GS16989@phenom.ffwll.local>
References: <20190927134616.21899-1-yuq825@gmail.com>
 <20190927134616.21899-2-yuq825@gmail.com>
 <20191009150708.GE16989@phenom.ffwll.local>
 <CAL_Jsq+dz1fU0TsiPB9qhCJpumf8Qz=ANmPyEL0SJiX+q1TXWw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+dz1fU0TsiPB9qhCJpumf8Qz=ANmPyEL0SJiX+q1TXWw@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JtgO+8vzr/9TpSly+AhzIs3sCwolVOMferKQODctL4k=;
 b=PNmm/uC4nF4oVQjbU1yjZy/N6W36a/ydYcFe1xfGWOtSRR6ym2+dypKiLJp0oUkZtE
 KxQ3g2LQTtEIG3oT1L2xfeAhisLqf0PmYydVH+UDQ0IVRFuBf6iaDS6iC7sygstj5EbF
 nN/fdCSEecQVgood19Z6DM0FL6LcKUJomSGMw=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, lima@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Qiang Yu <yuq825@gmail.com>, Sean Paul <sean@poorly.run>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMTE6MDU6MzFBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gV2VkLCBPY3QgOSwgMjAxOSBhdCAxMDowNyBBTSBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgU2VwIDI3LCAyMDE5IGF0IDA5OjQ2
OjExUE0gKzA4MDAsIFFpYW5nIFl1IHdyb3RlOgo+ID4gPiBkcm1fZ2VtX29iamVjdHNfbG9va3Vw
IGRvZXMgbm90IHVzZSB1c2VyIHNwYWNlIGJvIGhhbmRsZXMKPiA+ID4gZGlyZWN0bHkgYW5kIGxl
ZnQgdGhlIHVzZXIgdG8ga2VybmVsIGNvcHkgd29yayB0byBhIG5ldwo+ID4gPiBpbnRlcmZhY2Ug
ZHJtX2dlbV9vYmplY3RzX2xvb2t1cF91c2VyLgo+ID4gPgo+ID4gPiBUaGlzIGlzIGZvciBkcml2
ZXIgbGlrZSBsaW1hIHdoaWNoIGRvZXMgbm90IHBhc3MgZ2VtIGJvCj4gPiA+IGhhbmRsZXMgY29u
dGlub3VzbHkgaW4gYW4gYXJyYXkgaW4gaW9jdGwgYXJndW1lbnQuCj4gPiA+Cj4gPiA+IHYyOgo+
ID4gPiAxLiBhZGQgZHJtX2dlbV9vYmplY3RzX2xvb2t1cF91c2VyCj4gPiA+IDIuIHJlbW92ZSBu
b25lLXplcm8gY2hlY2sgYXMgYWxsIGNhbGxlciB3aWxsIGNoZWNrIGJlZm9yZQo+ID4gPiAgICBj
YWxsaW5nIHRoaXMgZnVuY3Rpb24KPiA+ID4KPiA+ID4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+Cj4gPiA+IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEu
Y29tPgo+ID4gPiBDYzogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KPiA+ID4g
Q2M6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgo+
ID4gPiBTdWdnZXN0ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiA+IFNp
Z25lZC1vZmYtYnk6IFFpYW5nIFl1IDx5dXE4MjVAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgICAgICAgICAgICAgICB8IDU3ICsrKysrKysrKysr
KysrKysrKystLS0tLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9k
cnYuYyB8ICA2ICstLQo+ID4gPiAgaW5jbHVkZS9kcm0vZHJtX2dlbS5oICAgICAgICAgICAgICAg
ICAgIHwgIDQgKy0KPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKSwgMTgg
ZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwo+ID4gPiBpbmRleCA2ODU0ZjU4Njdk
NTEuLmE1ZTg4YzNlNmQyNSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW0uYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCj4gPiA+IEBAIC02Nzks
MTEgKzY3OSwxMSBAQCBzdGF0aWMgaW50IG9iamVjdHNfbG9va3VwKHN0cnVjdCBkcm1fZmlsZSAq
ZmlscCwgdTMyICpoYW5kbGUsIGludCBjb3VudCwKPiA+ID4gIC8qKgo+ID4gPiAgICogZHJtX2dl
bV9vYmplY3RzX2xvb2t1cCAtIGxvb2sgdXAgR0VNIG9iamVjdHMgZnJvbSBhbiBhcnJheSBvZiBo
YW5kbGVzCj4gPiA+ICAgKiBAZmlscDogRFJNIGZpbGUgcHJpdmF0ZSBkYXRlCj4gPiA+IC0gKiBA
Ym9faGFuZGxlczogdXNlciBwb2ludGVyIHRvIGFycmF5IG9mIHVzZXJzcGFjZSBoYW5kbGUKPiA+
ID4gKyAqIEBib19oYW5kbGVzOiBhcnJheSBvZiBHRU0gb2JqZWN0IGhhbmRsZXMKPiA+ID4gICAq
IEBjb3VudDogc2l6ZSBvZiBoYW5kbGUgYXJyYXkKPiA+ID4gICAqIEBvYmpzX291dDogcmV0dXJu
ZWQgcG9pbnRlciB0byBhcnJheSBvZiBkcm1fZ2VtX29iamVjdCBwb2ludGVycwo+ID4gPiAgICoK
PiA+ID4gLSAqIFRha2VzIGFuIGFycmF5IG9mIHVzZXJzcGFjZSBoYW5kbGVzIGFuZCByZXR1cm5z
IGEgbmV3bHkgYWxsb2NhdGVkIGFycmF5IG9mCj4gPiA+ICsgKiBUYWtlcyBhbiBhcnJheSBvZiBH
RU0gb2JqZWN0IGhhbmRsZXMgYW5kIHJldHVybnMgYSBuZXdseSBhbGxvY2F0ZWQgYXJyYXkgb2YK
PiA+ID4gICAqIEdFTSBvYmplY3RzLgo+ID4gPiAgICoKPiA+ID4gICAqIEZvciBhIHNpbmdsZSBo
YW5kbGUgbG9va3VwLCB1c2UgZHJtX2dlbV9vYmplY3RfbG9va3VwKCkuCj4gPiA+IEBAIC02OTUs
MjYgKzY5NSw1NiBAQCBzdGF0aWMgaW50IG9iamVjdHNfbG9va3VwKHN0cnVjdCBkcm1fZmlsZSAq
ZmlscCwgdTMyICpoYW5kbGUsIGludCBjb3VudCwKPiA+ID4gICAqIGZhaWx1cmUuIDAgaXMgcmV0
dXJuZWQgb24gc3VjY2Vzcy4KPiA+ID4gICAqCj4gPiA+ICAgKi8KPiA+ID4gLWludCBkcm1fZ2Vt
X29iamVjdHNfbG9va3VwKHN0cnVjdCBkcm1fZmlsZSAqZmlscCwgdm9pZCBfX3VzZXIgKmJvX2hh
bmRsZXMsCj4gPiA+ICtpbnQgZHJtX2dlbV9vYmplY3RzX2xvb2t1cChzdHJ1Y3QgZHJtX2ZpbGUg
KmZpbHAsIHUzMiAqYm9faGFuZGxlcywKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIGlu
dCBjb3VudCwgc3RydWN0IGRybV9nZW1fb2JqZWN0ICoqKm9ianNfb3V0KQo+ID4KPiA+IFlvdSBj
YW4ndCBkbyB0aGlzIGNoYW5nZSB3aXRob3V0IHVwZGF0aW5nIGFsbCB0aGUgZHJpdmVycy4gU2lt
cGxlciB0byBrZWVwCj4gPiB0aGlzIG9uZSBhcy1pcywgYW5kIGNyZWF0ZSBhIG5ldyBmdW5jdGlv
biB3aXRoIGFuIF9pbnRlcm5hbCBzdWZmaXguCj4gCj4gVGhlIG9ubHkgZHJpdmVyIGN1cnJlbnRs
eSBpcyBwYW5mcm9zdCBhbmQgaXQgaXMgdXBkYXRlZCBpbiB0aGlzIHBhdGNoLgoKT29wcyBzcnkg
bWlzc2VkIHRoYXQgaW4gdGhlIGRpZmZzdGF0IHNvbWVob3cuCi1EYW5pZWwKLS0gCkRhbmllbCBW
ZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZm
d2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
