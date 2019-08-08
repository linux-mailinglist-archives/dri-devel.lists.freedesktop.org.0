Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5211D86DD5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 01:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1C76ECDC;
	Thu,  8 Aug 2019 23:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C779B6ECDC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 23:18:05 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id v6so64284911vsq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 16:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/fynsO0+p1YFQQP6MdFYCYBZDlTGCmmz2zx4AJsqjeI=;
 b=KMokxAgyv/uwICFx5ozk14rfBRHEwqlhCv0DzlgexdC5Qh7SozFIPf4zlMxJKRAdO8
 HEuN+ixcdK+6DF969PZFBu50sMYyjzr/JOs6tvK0GhVSZGKIiW4o74dl0WepW7WQaCP1
 xFOjQuFBATi3TNdtvnNWccCLUN69J3iyWZL8a/7gyILMvhXYW0CDFBiqKm2Z00qW2/3y
 u5h4JPxsRW0cMqQYsRts94y/urYIcTs/bznJWCu3R7TTsI7vwL6nm5zIS/b1RWuS4c6E
 gPjdySuRNpaD3eBFjZ6+COQrQR363jUc6F1T6iEtA4WezOtk05VbzEYL4MIaoL4MBNSu
 tPsg==
X-Gm-Message-State: APjAAAVCJUBqygtbl2Vk4XXHXYrArS8zZv6jJdfTiYufHb82TTdJP60B
 JkVgGAQFmt0B9e3a1S+2peqYpEWWOvd4QcF2PA0=
X-Google-Smtp-Source: APXvYqzUmL32xHNfQMt/Xb5iiSiAaBHK1UZHuTCYJJx2OhSdXX6iuiIqhoFwpxBOUf+nXTzyTL4Sm4pvlV5m3hGxv+I=
X-Received: by 2002:a67:dc1:: with SMTP id 184mr12110458vsn.164.1565306284710; 
 Thu, 08 Aug 2019 16:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190808222918.15153-1-robh@kernel.org>
In-Reply-To: <20190808222918.15153-1-robh@kernel.org>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 9 Aug 2019 00:17:38 +0100
Message-ID: <CAM0jSHNWDLOCw0EiS1f3Dt44B8mpQVW7unztWmev0G+kgHBjOg@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Implement per FD address spaces
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/fynsO0+p1YFQQP6MdFYCYBZDlTGCmmz2zx4AJsqjeI=;
 b=AzWV7D2r7oluY3lpJPSRGvLf6CupJuSIh87mfX4h0PoXsclK1MZ3icgJ8aVEzQ8kHX
 SMGcADY5ngyQPg4vudKcIL//Mvm8G/RqOWuEE1TAmyD4d6smxbS2JV0pFm2UZueSNZxP
 d/bn8PJSXjzCUngC/1WBereMEopOXBsUaMUQtX9TpG5tm1zhZi2W6R0XtmQTCrS/BSab
 NsxHn/r7NiznGisvI5gJh78oiL3MiirZ1cHEFc59++kvgHHw+wdKf6HdNrAc3ScoiLfC
 8BL8VQG8uMS2bqjpiToJ9piLszO9VUMnLw/1B8O15XxhbmbNAGqKDG4XxIhsjADNRVap
 t/Kw==
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA4IEF1ZyAyMDE5IGF0IDIzOjI5LCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IFVwIHVudGlsIG5vdywgYSBzaW5nbGUgc2hhcmVkIEdQVSBhZGRyZXNzIHNw
YWNlIHdhcyB1c2VkLiBUaGlzIGlzIG5vdAo+IGlkZWFsIGFzIHRoZXJlJ3Mgbm8gcHJvdGVjdGlv
biBiZXR3ZWVuIHByb2Nlc3NlcyBhbmQgZG9lc24ndCB3b3JrIGZvcgo+IHN1cHBvcnRpbmcgdGhl
IHNhbWUgR1BVL0NQVSBWQSBmZWF0dXJlLiBNb3N0IGltcG9ydGFudGx5LCB0aGlzIHdpbGwKPiBo
b3BlZnVsbHkgbWl0aWdhdGUgQWx5c3NhJ3MgZmVhciBvZiBXZWJHTCwgd2hhdGV2ZXIgdGhhdCBp
cy4KPgo+IE1vc3Qgb2YgdGhlIGNoYW5nZXMgaGVyZSBhcmUgbW92aW5nIHN0cnVjdCBkcm1fbW0g
YW5kIHN0cnVjdAo+IHBhbmZyb3N0X21tdSBvYmplY3RzIGZyb20gdGhlIHBlciBkZXZpY2Ugc3Ry
dWN0IHRvIHRoZSBwZXIgRkQgc3RydWN0Lgo+IFRoZSBjcml0aWNhbCBmdW5jdGlvbiBpcyBwYW5m
cm9zdF9tbXVfYXNfZ2V0KCkgd2hpY2ggaGFuZGxlcyBhbGxvY2F0aW5nCj4gYW5kIHN3aXRjaGlu
ZyB0aGUgaC93IGFkZHJlc3Mgc3BhY2VzLgo+Cj4gQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6
b3NvQGNvbGxhYm9yYS5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBSb2JpbiBNdXJwaHkg
PHJvYmluLm11cnBoeUBhcm0uY29tPgo+IENjOiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBh
cm0uY29tPgo+IENjOiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhLnJvc2VuendlaWdAY29sbGFi
b3JhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+
IC0tLQo+IFRoaXMgZGVwZW5kcyBvbiBtYWR2aXNlIHN1cHBvcnQgKG5vdyBpbiBkcm0tbWlzYykg
YW5kIHRoZSBoZWFwL25vLWV4ZWMKPiBzZXJpZXMgKGp1c3QgdGhlIHJld29yaykuIFNlZWVtcyB0
byBiZSB3b3JraW5nIHByZXR0eSB3ZWxsIGZvciBtZSwgYnV0Cj4gbW9yZSB0ZXN0aW5nIHdvdWxk
IGJlIGhlbHBmdWwuIEkndmUgcnVuIG11bHRpcGxlICdnbG1hcmsyLWVzMi1kcm0KPiAtLW9mZi1z
Y3JlZW4nIGluc3RhbmNlcyBhbmQgR25vbWUgU2hlbGwuIFJ1bm5pbmcgbW9yZSB0aGFuIDggY2xp
ZW50cyAoYXQKPiBsZWFzdCBmb3IgVDg2MCkgd2lsbCBoaXQgdGhlIGFkZHJlc3Mgc3BhY2Ugc3dp
dGNoIGNvZGUgcGF0aHMuCj4KPiBSb2IKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvVE9E
TyAgICAgICAgICAgICAgfCAgIDQgLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZGV2aWNlLmMgfCAgIDIgKwo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
ZGV2aWNlLmggfCAgMjQgKystCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9k
cnYuYyAgICB8ICAzMSArKy0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dl
bS5jICAgIHwgIDE1ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0u
aCAgICB8ICAgMyArCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYyAg
ICB8ICAxMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgICAg
fCAyMjAgKysrKysrKysrKysrKysrLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9tbXUuaCAgICB8ICAgOCArCj4gIDkgZmlsZXMgY2hhbmdlZCwgMjM5IGluc2VydGlv
bnMoKyksIDgwIGRlbGV0aW9ucygtKQoKW3NuaXBdCgo+IEBAIC00MTMsNyArNDE0LDI4IEBAIHBh
bmZyb3N0X29wZW4oc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9maWxlICpmaWxl
KQo+ICAgICAgICAgcGFuZnJvc3RfcHJpdi0+cGZkZXYgPSBwZmRldjsKPiAgICAgICAgIGZpbGUt
PmRyaXZlcl9wcml2ID0gcGFuZnJvc3RfcHJpdjsKPgo+IC0gICAgICAgcmV0dXJuIHBhbmZyb3N0
X2pvYl9vcGVuKHBhbmZyb3N0X3ByaXYpOwo+ICsgICAgICAgc3Bpbl9sb2NrX2luaXQoJnBhbmZy
b3N0X3ByaXYtPm1tX2xvY2spOwo+ICsKPiArICAgICAgIC8qIDRHIGVub3VnaCBmb3Igbm93LiBj
YW4gYmUgNDgtYml0ICovCj4gKyAgICAgICBwYW5mcm9zdF9wcml2LT5tbS5jb2xvcl9hZGp1c3Qg
PSBwYW5mcm9zdF9kcm1fbW1fY29sb3JfYWRqdXN0Owo+ICsgICAgICAgZHJtX21tX2luaXQoJnBh
bmZyb3N0X3ByaXYtPm1tLCBTWl8zMk0gPj4gUEFHRV9TSElGVCwgKFNaXzRHIC0gU1pfMzJNKSA+
PiBQQUdFX1NISUZUKTsKCkRyaXZlLWJ5LWNvbW1lbnQ6IGRybV9tbV9pbml0IHdpbGwgdHJhbXBs
ZSB5b3VyIGNvbG9yX2FkanVzdC4gSW50ZW50aW9uYWw/Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
