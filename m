Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D83ECBB8
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 23:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374196F898;
	Fri,  1 Nov 2019 22:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906C76E2EF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 19:49:13 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id h9so12160999ioh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 12:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KM5keI5JRBdsLMdvX/DXO4uxdl8v8GtwRSu6nk7FJlU=;
 b=nUR7FW80pL1g4l2pdndVUmcj522LJBhZ3NzrXSoBUYsdwgFgt98obk1GetJXm5sCnz
 NIMQdGFW26LtB87n7sqw3zn7VqRBXkm6Gz533xUs5E1vKDrIRsuJ8eRusCtNb9Sfv1dL
 7XDKGt9bFluCRH4neHOL0SbBX2wnGgritQ8YkOSl9n4Mp2KjKhUoMuKiwlHGM3t62T4G
 pHSN/flpx9AbWKsZMGxWo+qB09zdQ8uD2Yk2qTq9lNRB5C4fxub0PqjNTxdkwZ63q8dQ
 bmgSeLf+BwxxiBs9kZaZ/Ox/K9+5CKPlxQSzOHIXJ/sOSZZfcN8ACO6w0t8PSIibk9np
 bnFg==
X-Gm-Message-State: APjAAAWLzPMxm3O/SaXkabU1uY11eV2/E6Q1ft9UmkgUla2jw9a4oVg3
 ioqVei8QL+Q7YNHvbA55/1pj1Pp2sDjT4KH9nSSfNg==
X-Google-Smtp-Source: APXvYqzqj3T21Q8T+np0o4NhU2uvmqYRG5otyTj3dO3VfhI1dm5CqNDk7FXDrxrPGrD1LTFv+INtEsANSUVbr9CSNTQ=
X-Received: by 2002:a5e:d806:: with SMTP id l6mr8869892iok.299.1572637753039; 
 Fri, 01 Nov 2019 12:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191101180713.5470-1-robdclark@gmail.com>
 <20191101180713.5470-2-robdclark@gmail.com>
 <20191101192458.GI1208@intel.com>
In-Reply-To: <20191101192458.GI1208@intel.com>
From: Rob Clark <robdclark@chromium.org>
Date: Fri, 1 Nov 2019 12:49:02 -0700
Message-ID: <CAJs_Fx7u6VNDarYqUuUSMSsWK0jpS5ybse0h1X4AmtXO9Mia_w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/atomic: clear new_state pointers at hw_done
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-Mailman-Approved-At: Fri, 01 Nov 2019 22:51:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KM5keI5JRBdsLMdvX/DXO4uxdl8v8GtwRSu6nk7FJlU=;
 b=WH7hkZsGVqlyvgy5eyIZq0VMmSWdPAQmDiz1SlTrO23EGhHCT1CbLFFZcJB4B6IEee
 oLS8WgiWlGXRvpCVz4PsJo1taIesksi/9tYeCqa7/mJL6BTq7rUAXDvh4pUEK41uo5w1
 fSeGDBNetbusamqn67VFSQNGcezzc0VFMS88s=
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMSwgMjAxOSBhdCAxMjoyNSBQTSBWaWxsZSBTeXJqw6Rsw6QKPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgTm92IDAxLCAyMDE5IGF0
IDExOjA3OjEzQU0gLTA3MDAsIFJvYiBDbGFyayB3cm90ZToKPiA+IEZyb206IFJvYiBDbGFyayA8
cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiA+Cj4gPiBUaGUgbmV3IHN0YXRlIHNob3VsZCBub3Qg
YmUgYWNjZXNzZWQgYWZ0ZXIgdGhpcyBwb2ludC4gIENsZWFyIHRoZQo+ID4gcG9pbnRlcnMgdG8g
bWFrZSB0aGF0IGV4cGxpY2l0Lgo+ID4KPiA+IFRoaXMgbWFrZXMgdGhlIGVycm9yIGNvcnJlY3Rl
ZCBpbiB0aGUgcHJldmlvdXMgcGF0Y2ggbW9yZSBvYnZpb3VzLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiA+IC0tLQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCj4gPiBpbmRleCA3MzJiZDBjZTkyNDEuLjE3Njgz
MWRmODE2MyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBl
ci5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwo+ID4gQEAg
LTIyMzQsMTMgKzIyMzQsNDIgQEAgRVhQT1JUX1NZTUJPTChkcm1fYXRvbWljX2hlbHBlcl9mYWtl
X3ZibGFuayk7Cj4gPiAgICovCj4gPiAgdm9pZCBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfaHdf
ZG9uZShzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xkX3N0YXRlKQo+ID4gIHsKPiA+ICsgICAg
IHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3I7Cj4gPiArICAgICBzdHJ1Y3QgZHJtX2Nv
bm5lY3Rvcl9zdGF0ZSAqb2xkX2Nvbm5fc3RhdGUsICpuZXdfY29ubl9zdGF0ZTsKPiA+ICAgICAg
IHN0cnVjdCBkcm1fY3J0YyAqY3J0YzsKPiA+ICAgICAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAq
b2xkX2NydGNfc3RhdGUsICpuZXdfY3J0Y19zdGF0ZTsKPiA+ICsgICAgIHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lOwo+ID4gKyAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3BsYW5lX3N0
YXRlLCAqbmV3X3BsYW5lX3N0YXRlOwo+ID4gICAgICAgc3RydWN0IGRybV9jcnRjX2NvbW1pdCAq
Y29tbWl0Owo+ID4gKyAgICAgc3RydWN0IGRybV9wcml2YXRlX29iaiAqb2JqOwo+ID4gKyAgICAg
c3RydWN0IGRybV9wcml2YXRlX3N0YXRlICpvbGRfb2JqX3N0YXRlLCAqbmV3X29ial9zdGF0ZTsK
PiA+ICAgICAgIGludCBpOwo+ID4KPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBBZnRlciB0aGlz
IHBvaW50LCBkcml2ZXJzIHNob3VsZCBub3QgYWNjZXNzIHRoZSBwZXJtYW5lbnQgbW9kZXNldAo+
ID4gKyAgICAgICogc3RhdGUsIHNvIHdlIGFsc28gY2xlYXIgdGhlIG5ld19zdGF0ZSBwb2ludGVy
cyB0byBtYWtlIHRoaXMKPiA+ICsgICAgICAqIHJlc3RyaWN0aW9uIGV4cGxpY2l0Lgo+ID4gKyAg
ICAgICoKPiA+ICsgICAgICAqIEZvciB0aGUgQ1JUQyBzdGF0ZSwgd2UgZG8gdGhpcyBpbiB0aGUg
c2FtZSBsb29wIHdoZXJlIHdlIHNpZ25hbAo+ID4gKyAgICAgICogaHdfZG9uZSwgc2luY2Ugd2Ug
c3RpbGwgbmVlZCB0byBuZXdfY3J0Y19zdGF0ZSB0byBmaXNoIG91dCB0aGUKPiA+ICsgICAgICAq
IGNvbW1pdC4KPiA+ICsgICAgICAqLwo+ID4gKwo+ID4gKyAgICAgZm9yX2VhY2hfb2xkbmV3X2Nv
bm5lY3Rvcl9pbl9zdGF0ZShvbGRfc3RhdGUsIGNvbm5lY3Rvciwgb2xkX2Nvbm5fc3RhdGUsIG5l
d19jb25uX3N0YXRlLCBpKSB7Cj4gPiArICAgICAgICAgICAgIG9sZF9zdGF0ZS0+Y29ubmVjdG9y
c1tpXS5uZXdfc3RhdGUgPSBOVUxMOwo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgZm9yX2Vh
Y2hfb2xkbmV3X3BsYW5lX2luX3N0YXRlKG9sZF9zdGF0ZSwgcGxhbmUsIG9sZF9wbGFuZV9zdGF0
ZSwgbmV3X3BsYW5lX3N0YXRlLCBpKSB7Cj4gPiArICAgICAgICAgICAgIG9sZF9zdGF0ZS0+cGxh
bmVzW2ldLm5ld19zdGF0ZSA9IE5VTEw7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICBmb3Jf
ZWFjaF9vbGRuZXdfcHJpdmF0ZV9vYmpfaW5fc3RhdGUob2xkX3N0YXRlLCBvYmosIG9sZF9vYmpf
c3RhdGUsIG5ld19vYmpfc3RhdGUsIGkpIHsKPiA+ICsgICAgICAgICAgICAgb2xkX3N0YXRlLT5w
cml2YXRlX29ianNbaV0ubmV3X3N0YXRlID0gTlVMTDsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICAg
ICAgIGZvcl9lYWNoX29sZG5ld19jcnRjX2luX3N0YXRlKG9sZF9zdGF0ZSwgY3J0Yywgb2xkX2Ny
dGNfc3RhdGUsIG5ld19jcnRjX3N0YXRlLCBpKSB7Cj4gPiAgICAgICAgICAgICAgIG9sZF9zdGF0
ZS0+Y3J0Y3NbaV0ubmV3X3NlbGZfcmVmcmVzaF9hY3RpdmUgPSBuZXdfY3J0Y19zdGF0ZS0+c2Vs
Zl9yZWZyZXNoX2FjdGl2ZTsKPiA+ICsgICAgICAgICAgICAgb2xkX3N0YXRlLT5jcnRjc1tpXS5u
ZXdfc3RhdGUgPSBOVUxMOwo+Cj4gVGhhdCdzIGdvaW5nIHRvIGJlIGEgcmVhbCBQSVRBIHdoZW4g
ZG9pbmcgcHJvZ3JhbW1pbmcgYWZ0ZXIgdGhlIGZhY3QgZnJvbQo+IGEgdmJsYW5rIHdvcmtlci4g
SXQncyBhbHJlYWR5IGEgcGFpbiB0aGF0IHRoZSBuZXdfY3J0Y19zdGF0ZS0+c3RhdGUgaXMKPiBn
ZXR0aW5nIE5VTExlZCBzb21ld2hlcmUuCj4KCkkgdGhpbmsgeW91IGFscmVhZHkgaGF2ZSB0aGF0
IHByb2JsZW0sIHRoaXMganVzdCBtYWtlcyBpdCBleHBsaWNpdC4KCkJSLAotUgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
