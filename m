Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF90E158A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 11:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F27C6E12B;
	Wed, 23 Oct 2019 09:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97FA6E12B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 09:16:05 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a11so5119001wra.6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 02:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=eywcCaEl0jz6RGI5YWFAlnC1Cla8qjgA+dIAqYIUG7Y=;
 b=d3B1wbmYw+xu3Ndfaix8nVjsobMtweQElAOJAD4CF/0TVuq+dJ44Gz3uYeJ8ODeqbk
 PYc63fG/yX+2BNW+aidyMje4WNiSEphClbZTeBrH0lqjiZR1O+RSUHSgPZj2xiK5DfRr
 JSNSR+cMPekmeChqsCBBBQ2CLaMOVw3pc+c4nLFJcCYVIiW6xq7/o/6Sr0izqVIlHGSm
 wQ1ySaWEDqJ+MKWTCxWecfQ5J+1GQfKAogU8N255y4CsnKaxEsovEAFAaj2HpEsRRjU9
 mlhsLFcON8ekHe3md6SvkZfF+MS5UOVz+eGmNGVNLCBazUnfIohXQuDQ7hBAUsfsiaa5
 4oSg==
X-Gm-Message-State: APjAAAVj119C+H9tn38+yPOK0phyggdMT5gFrRzggpKiBldyh9Zc7p8Z
 3tgEdp/eWl51zmSfHyllKu3FCg==
X-Google-Smtp-Source: APXvYqyaF98maFdt+uzC2JWe68HL1C0ih9eBMEV/s9zDffMzTcLVvCxAL3+nYdCjPic9cQVAZAjlQQ==
X-Received: by 2002:a5d:424a:: with SMTP id s10mr7122969wrr.108.1571822164224; 
 Wed, 23 Oct 2019 02:16:04 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id c16sm7802240wrw.32.2019.10.23.02.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 02:16:03 -0700 (PDT)
Date: Wed, 23 Oct 2019 11:16:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH] drm/v3d: Fix memory leak in v3d_submit_cl_ioctl
Message-ID: <20191023091601.GX11828@phenom.ffwll.local>
Mail-Followup-To: Navid Emamdoost <navid.emamdoost@gmail.com>,
 Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
 Stephen McCamant <smccaman@umn.edu>, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20191021185250.26130-1-navid.emamdoost@gmail.com>
 <20191022093654.GF11828@phenom.ffwll.local>
 <CAEkB2ETFM7u6YiUOT3fz4UQ3U_za9iM1arTnYNg-rjs5+wxOfw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEkB2ETFM7u6YiUOT3fz4UQ3U_za9iM1arTnYNg-rjs5+wxOfw@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=eywcCaEl0jz6RGI5YWFAlnC1Cla8qjgA+dIAqYIUG7Y=;
 b=fgcbUMOFI8gUtVdMcTlFTKeyAVQfLshXZQANnWPhoGkW80jfOfruzvvp7zk+Vn1KOI
 8Q9j4ZI7cYxWWDdgqmbpPLx8jydPFisGCcnEayTl95BJUqOhn2KZgruUhepU0CJ6ks4c
 hBIPkxAnWKGsgtZ4NuRj6lgzwNAS7w6rR84jU=
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
Cc: David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMTA6NTM6NTdQTSAtMDUwMCwgTmF2aWQgRW1hbWRvb3N0
IHdyb3RlOgo+IE9uIFR1ZSwgT2N0IDIyLCAyMDE5IGF0IDQ6MzYgQU0gRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIE9jdCAyMSwgMjAxOSBhdCAw
MTo1Mjo0OVBNIC0wNTAwLCBOYXZpZCBFbWFtZG9vc3Qgd3JvdGU6Cj4gPiA+IEluIHRoZSBpbXBl
bGVtZW50YXRpb24gb2YgdjNkX3N1Ym1pdF9jbF9pb2N0bCgpIHRoZXJlIGFyZSB0d28gbWVtb3J5
Cj4gPiA+IGxlYWtzLiBPbmUgaXMgd2hlbiBhbGxvY2F0aW9uIGZvciBiaW4gZmFpbHMsIGFuZCB0
aGUgb3RoZXIgaXMgd2hlbiBiaW4KPiA+ID4gaW5pdGlhbGl6YXRpb24gZmFpbHMuIElmIGtjYWxs
b2MgZmFpbHMgdG8gYWxsb2NhdGUgbWVtb3J5IGZvciBiaW4gdGhlbgo+ID4gPiByZW5kZXItPmJh
c2Ugc2hvdWxkIGJlIHB1dC4gQWxzbywgaWYgdjNkX2pvYl9pbml0KCkgZmFpbHMgdG8gaW5pdGlh
bGl6ZQo+ID4gPiBiaW4tPmJhc2UgdGhlbiBhbGxvY2F0ZWQgbWVtb3J5IGZvciBiaW4gc2hvdWxk
IGJlIHJlbGVhc2VkLgo+ID4gPgo+ID4gPiBGaXhlczogYTc4M2EwOWVlNzZkICgiZHJtL3YzZDog
UmVmYWN0b3Igam9iIG1hbmFnZW1lbnQuIikKPiA+ID4gU2lnbmVkLW9mZi1ieTogTmF2aWQgRW1h
bWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZl
cnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jIHwgNSArKysrLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9n
ZW0uYwo+ID4gPiBpbmRleCA1ZDgwNTA3YjUzOWIuLjE5YzA5MmQ3NTI2NiAxMDA2NDQKPiA+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZ2VtLmMKPiA+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3YzZC92M2RfZ2VtLmMKPiA+ID4gQEAgLTU1NywxMyArNTU3LDE2IEBAIHYzZF9zdWJt
aXRfY2xfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiA+ID4KPiA+
ID4gICAgICAgaWYgKGFyZ3MtPmJjbF9zdGFydCAhPSBhcmdzLT5iY2xfZW5kKSB7Cj4gPiA+ICAg
ICAgICAgICAgICAgYmluID0ga2NhbGxvYygxLCBzaXplb2YoKmJpbiksIEdGUF9LRVJORUwpOwo+
ID4gPiAtICAgICAgICAgICAgIGlmICghYmluKQo+ID4gPiArICAgICAgICAgICAgIGlmICghYmlu
KSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICB2M2Rfam9iX3B1dCgmcmVuZGVyLT5iYXNl
KTsKPiA+Cj4gPiBUaGUgam9iIGlzbid0IGluaXRpYWxpemVkIHlldCwgdGhpcyBkb2Vzbid0IHdv
cmsuCj4gRG8geW91IG1lYW4gd2UgaGF2ZSB0byByZWxlYXNlIHJlbmRlciB2aWEga2ZyZWUoKSBo
ZXJlPwo+IAo+ID4KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+
ID4gPiArICAgICAgICAgICAgIH0KPiA+ID4KPiA+ID4gICAgICAgICAgICAgICByZXQgPSB2M2Rf
am9iX2luaXQodjNkLCBmaWxlX3ByaXYsICZiaW4tPmJhc2UsCj4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHYzZF9qb2JfZnJlZSwgYXJncy0+aW5fc3luY19iY2wpOwo+ID4g
PiAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHYz
ZF9qb2JfcHV0KCZyZW5kZXItPmJhc2UpOwo+ID4KPiA+IHYzZF9qb2JfcHV0IHdpbGwgY2FsbCBr
ZnJlZSwgaWYgeW91IGNoYXNlIHRoZSBjYWxsY2hhaW4gbG9uZyBlbm91Z2ggKGluCj4gPiB2M2Rf
am9iX2ZyZWUpLiBTbyBubyBidWcgaGVyZSwgdGhpcyB3b3VsZCBsZWFkIHRvIGEgZG91YmxlIGtm
cmVlIGFuZAo+ID4gY3Jhc2guCj4gWWVzLCB2M2Rfam9iX3B1dCgpIHRha2VzIGNhcmUgb2YgcmVu
ZGVyLAo+IAo+ID4gLURhbmllbAo+ID4KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGtmcmVl
KGJpbik7Cj4gYnV0IGhvdyBhYm91dCBsZWFraW5nIGJpbj8KClNvcnJ5LCBJIHRvdGFsbHkgbWlz
c2VkIHRoYXQgdGhpcyBpcyBiaW4sIG5vIHJlbmRlci4gUGF0Y2ggbG9va3MgY29ycmVjdAp0byBt
ZS4KClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoK
PiAKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+ICAgICAgICAg
ICAgICAgfQo+ID4gPgo+ID4gPiAtLQo+ID4gPiAyLjE3LjEKPiA+ID4KPiA+Cj4gPiAtLQo+ID4g
RGFuaWVsIFZldHRlcgo+ID4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4g
PiBodHRwOi8vYmxvZy5mZndsbC5jaAo+IAo+IAo+IAo+IC0tIAo+IE5hdmlkLgoKLS0gCkRhbmll
bCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9n
LmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
