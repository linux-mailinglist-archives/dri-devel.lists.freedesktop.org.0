Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7830ECB30
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 23:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1606E0AA;
	Fri,  1 Nov 2019 22:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972286E0AA
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 22:14:22 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id b72so8649587edf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 15:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QvyUOnCPDzDncgYUYYWR7jovyh1VoufcneVERJJM/xk=;
 b=od/Y1fMmXYtcoe69nObQJPKAojepFSd/nleliYgpjNYSZhdAJHYOBSxIlvZo2PSWMi
 Zz1tJ8ZJs6JSvVIX9kj0z73Im8IbglC6B7esBczL3vft5NPLPxRhsFLmZRX+ei89XU54
 I/NbotQGw/u+mS7q3FHH7DeEGaLuJOp6PHCH/Pk5hD4xiSQfPVBYk+mjUES+ckQeV50b
 1L43UT4lzwGSeg81e2PWMDWi9fg9A/6XP5b1C+z2lLv4JDGUPH93NERGVLBxC+RFaA4o
 DMsM+pHzG7PpDQwPSMHMpV4cLcj54+ZFjxWJYC2SjRUVjAWIdZ7F/sDjMsr04to94Enh
 9tRg==
X-Gm-Message-State: APjAAAXaAr78aVn9/B7ML6FTITZWjtHe7PaJyHHLnciyZpOWWi/HidgA
 R3OKPzX+j0WZe/awcRrRfXp0LthrTC4UUt4xD2M=
X-Google-Smtp-Source: APXvYqxNyJXUzP9gqvfdr0qqrrP93pIpZ7h8Rc35DY0kTbK1wnzbOnCYGe1OfAQB2WpUeuBugJxLKE+BM2I8OsY5cBA=
X-Received: by 2002:a17:906:e212:: with SMTP id
 gf18mr12222737ejb.90.1572646460987; 
 Fri, 01 Nov 2019 15:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20191101180713.5470-1-robdclark@gmail.com>
 <20191101180713.5470-2-robdclark@gmail.com>
 <20191101192458.GI1208@intel.com>
 <CAJs_Fx7u6VNDarYqUuUSMSsWK0jpS5ybse0h1X4AmtXO9Mia_w@mail.gmail.com>
 <20191101214431.GJ1208@intel.com>
In-Reply-To: <20191101214431.GJ1208@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 1 Nov 2019 15:14:09 -0700
Message-ID: <CAF6AEGsHQ-V9aVvxLE6VeV2Ld+1_QOh7LS6GBsd6Lsr4qPZNMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/atomic: clear new_state pointers at hw_done
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QvyUOnCPDzDncgYUYYWR7jovyh1VoufcneVERJJM/xk=;
 b=Np9oSpVBax/Jy6y6l7TV2WU11Y6jOVq1AVCCZwGRV9Jn7chNfW54O9xi7EIr5LhD8V
 Z4EtYwCqcbrWE+owXXFWuvfSrmF3Lrv1rK0K/S8q3sUusmfPn4+giBuYsuQ6qcyNnsYH
 gliZpctGD2F85ionOIZ5H9m1BIB6xZT8V5xklP6MhXhRwOnhO+7UPUOQL+9tbPz+vJK2
 B7jJjBZ5qkM7VggrsKhifmRbaMi84i9hJcSi2FFnxZoXl+oy++ISJIa2fhgXpGjagOpX
 kWbEA7vRUjSybnZNbNHgNuiZSZqg+s1VXRRkHQfoCVbMeu1/1YMSz99u6aW14zhzD413
 rQyw==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMSwgMjAxOSBhdCAyOjQ0IFBNIFZpbGxlIFN5cmrDpGzDpAo8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBOb3YgMDEsIDIwMTkgYXQg
MTI6NDk6MDJQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3RlOgo+ID4gT24gRnJpLCBOb3YgMSwgMjAx
OSBhdCAxMjoyNSBQTSBWaWxsZSBTeXJqw6Rsw6QKPiA+IDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIEZyaSwgTm92IDAxLCAyMDE5IGF0IDExOjA3
OjEzQU0gLTA3MDAsIFJvYiBDbGFyayB3cm90ZToKPiA+ID4gPiBGcm9tOiBSb2IgQ2xhcmsgPHJv
YmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gPiA+ID4KPiA+ID4gPiBUaGUgbmV3IHN0YXRlIHNob3Vs
ZCBub3QgYmUgYWNjZXNzZWQgYWZ0ZXIgdGhpcyBwb2ludC4gIENsZWFyIHRoZQo+ID4gPiA+IHBv
aW50ZXJzIHRvIG1ha2UgdGhhdCBleHBsaWNpdC4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgbWFrZXMg
dGhlIGVycm9yIGNvcnJlY3RlZCBpbiB0aGUgcHJldmlvdXMgcGF0Y2ggbW9yZSBvYnZpb3VzLgo+
ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21p
dW0ub3JnPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19o
ZWxwZXIuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2F0b21pY19oZWxwZXIuYwo+ID4gPiA+IGluZGV4IDczMmJkMGNlOTI0MS4uMTc2ODMxZGY4MTYz
IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5j
Cj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMKPiA+ID4g
PiBAQCAtMjIzNCwxMyArMjIzNCw0MiBAQCBFWFBPUlRfU1lNQk9MKGRybV9hdG9taWNfaGVscGVy
X2Zha2VfdmJsYW5rKTsKPiA+ID4gPiAgICovCj4gPiA+ID4gIHZvaWQgZHJtX2F0b21pY19oZWxw
ZXJfY29tbWl0X2h3X2RvbmUoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0ZSkKPiA+
ID4gPiAgewo+ID4gPiA+ICsgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3I7Cj4g
PiA+ID4gKyAgICAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKm9sZF9jb25uX3N0YXRlLCAq
bmV3X2Nvbm5fc3RhdGU7Cj4gPiA+ID4gICAgICAgc3RydWN0IGRybV9jcnRjICpjcnRjOwo+ID4g
PiA+ICAgICAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX2NydGNfc3RhdGUsICpuZXdfY3J0
Y19zdGF0ZTsKPiA+ID4gPiArICAgICBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZTsKPiA+ID4gPiAr
ICAgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRfcGxhbmVfc3RhdGUsICpuZXdfcGxhbmVf
c3RhdGU7Cj4gPiA+ID4gICAgICAgc3RydWN0IGRybV9jcnRjX2NvbW1pdCAqY29tbWl0Owo+ID4g
PiA+ICsgICAgIHN0cnVjdCBkcm1fcHJpdmF0ZV9vYmogKm9iajsKPiA+ID4gPiArICAgICBzdHJ1
Y3QgZHJtX3ByaXZhdGVfc3RhdGUgKm9sZF9vYmpfc3RhdGUsICpuZXdfb2JqX3N0YXRlOwo+ID4g
PiA+ICAgICAgIGludCBpOwo+ID4gPiA+Cj4gPiA+ID4gKyAgICAgLyoKPiA+ID4gPiArICAgICAg
KiBBZnRlciB0aGlzIHBvaW50LCBkcml2ZXJzIHNob3VsZCBub3QgYWNjZXNzIHRoZSBwZXJtYW5l
bnQgbW9kZXNldAo+ID4gPiA+ICsgICAgICAqIHN0YXRlLCBzbyB3ZSBhbHNvIGNsZWFyIHRoZSBu
ZXdfc3RhdGUgcG9pbnRlcnMgdG8gbWFrZSB0aGlzCj4gPiA+ID4gKyAgICAgICogcmVzdHJpY3Rp
b24gZXhwbGljaXQuCj4gPiA+ID4gKyAgICAgICoKPiA+ID4gPiArICAgICAgKiBGb3IgdGhlIENS
VEMgc3RhdGUsIHdlIGRvIHRoaXMgaW4gdGhlIHNhbWUgbG9vcCB3aGVyZSB3ZSBzaWduYWwKPiA+
ID4gPiArICAgICAgKiBod19kb25lLCBzaW5jZSB3ZSBzdGlsbCBuZWVkIHRvIG5ld19jcnRjX3N0
YXRlIHRvIGZpc2ggb3V0IHRoZQo+ID4gPiA+ICsgICAgICAqIGNvbW1pdC4KPiA+ID4gPiArICAg
ICAgKi8KPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgZm9yX2VhY2hfb2xkbmV3X2Nvbm5lY3Rvcl9p
bl9zdGF0ZShvbGRfc3RhdGUsIGNvbm5lY3Rvciwgb2xkX2Nvbm5fc3RhdGUsIG5ld19jb25uX3N0
YXRlLCBpKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICBvbGRfc3RhdGUtPmNvbm5lY3RvcnNbaV0u
bmV3X3N0YXRlID0gTlVMTDsKPiA+ID4gPiArICAgICB9Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAg
IGZvcl9lYWNoX29sZG5ld19wbGFuZV9pbl9zdGF0ZShvbGRfc3RhdGUsIHBsYW5lLCBvbGRfcGxh
bmVfc3RhdGUsIG5ld19wbGFuZV9zdGF0ZSwgaSkgewo+ID4gPiA+ICsgICAgICAgICAgICAgb2xk
X3N0YXRlLT5wbGFuZXNbaV0ubmV3X3N0YXRlID0gTlVMTDsKPiA+ID4gPiArICAgICB9Cj4gPiA+
ID4gKwo+ID4gPiA+ICsgICAgIGZvcl9lYWNoX29sZG5ld19wcml2YXRlX29ial9pbl9zdGF0ZShv
bGRfc3RhdGUsIG9iaiwgb2xkX29ial9zdGF0ZSwgbmV3X29ial9zdGF0ZSwgaSkgewo+ID4gPiA+
ICsgICAgICAgICAgICAgb2xkX3N0YXRlLT5wcml2YXRlX29ianNbaV0ubmV3X3N0YXRlID0gTlVM
TDsKPiA+ID4gPiArICAgICB9Cj4gPiA+ID4gKwo+ID4gPiA+ICAgICAgIGZvcl9lYWNoX29sZG5l
d19jcnRjX2luX3N0YXRlKG9sZF9zdGF0ZSwgY3J0Yywgb2xkX2NydGNfc3RhdGUsIG5ld19jcnRj
X3N0YXRlLCBpKSB7Cj4gPiA+ID4gICAgICAgICAgICAgICBvbGRfc3RhdGUtPmNydGNzW2ldLm5l
d19zZWxmX3JlZnJlc2hfYWN0aXZlID0gbmV3X2NydGNfc3RhdGUtPnNlbGZfcmVmcmVzaF9hY3Rp
dmU7Cj4gPiA+ID4gKyAgICAgICAgICAgICBvbGRfc3RhdGUtPmNydGNzW2ldLm5ld19zdGF0ZSA9
IE5VTEw7Cj4gPiA+Cj4gPiA+IFRoYXQncyBnb2luZyB0byBiZSBhIHJlYWwgUElUQSB3aGVuIGRv
aW5nIHByb2dyYW1taW5nIGFmdGVyIHRoZSBmYWN0IGZyb20KPiA+ID4gYSB2Ymxhbmsgd29ya2Vy
LiBJdCdzIGFscmVhZHkgYSBwYWluIHRoYXQgdGhlIG5ld19jcnRjX3N0YXRlLT5zdGF0ZSBpcwo+
ID4gPiBnZXR0aW5nIE5VTExlZCBzb21ld2hlcmUuCj4gPiA+Cj4gPgo+ID4gSSB0aGluayB5b3Ug
YWxyZWFkeSBoYXZlIHRoYXQgcHJvYmxlbSwgdGhpcyBqdXN0IG1ha2VzIGl0IGV4cGxpY2l0Lgo+
Cj4gSSBkb24ndCB5ZXQuIEV4Y2VwdCBvbiBhIGJyYW5jaCB3aGVyZSBJIGhhdmUgbXkgdmJsYW5r
IHdvcmtlcnMuCj4gQW5kIEkgdGhpbmsgdGhlIG9ubHkgcHJvYmxlbSBpcyBoYXZpbmcgdGhlIGhl
bHBlcnMvY29yZSBjbG9iYmVyCj4gdGhlIHBvaW50ZXJzIHdoZW4gaXQgc2hvdWxkIG5vdC4gSSBk
b24ndCBzZWUgd2h5IGl0IGNhbid0IGp1c3QKPiBsZWF2ZSB0aGVtIGJlIGFuZCBsZXQgbWUgdXNl
IHRoZW0uCj4KCkkgZ3Vlc3MgaXQgY29tZXMgZG93biB0byB3aGF0IGFzc3VtcHRpb25zIHlvdSBj
YW4gbWFrZSBpbiBkcml2ZXIKYmFja2VuZC4gIEJ1dCBpZiB5b3UgY2FuLCBmb3IgZXhhbXBsZSwg
bW92ZSBwbGFuZXMgYmV0d2VlbiBjcnRjcywgSQp0aGluayB5b3UgY2FuJ3QgbWFrZSBhc3N1bXB0
aW9ucyBhYm91dCB0aGUgb3JkZXIgaW4gd2hpY2ggdGhpbmdzCmNvbXBsZXRlIGV2ZW4gaWYgeW91
IGRvbid0IGhhdmUgY29tbWl0cyBvdmVydGFraW5nIGVhY2ggb3RoZXIgb24gYQpzaW5nbGUgY3J0
Yy4uCgpCUiwKLVIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
