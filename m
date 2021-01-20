Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 285C32FD731
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 18:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1916E0CD;
	Wed, 20 Jan 2021 17:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD136E0CD
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 17:42:08 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id 34so13313171otd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 09:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1PhAclZULQwbysk/mkrBuB0ypY2UFK2B9x9hQ0ArLyU=;
 b=PKnCL3c12xNtaUgxfTXl1AFHvQy3cYfP7plFtQx8ivsifTomD+7OyzVK3rNBiKx8Jp
 BfpdmStXrrd5YQjGo0eJibuoj0IEwDjxupUIVuiBk5RJC+OMsBVv/eWPFlfkIB45yBWA
 8QOlOVEpLIG1bWahHIV2Hy817oGTKYP9WX1vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1PhAclZULQwbysk/mkrBuB0ypY2UFK2B9x9hQ0ArLyU=;
 b=Yr05rMxQ5+phz6eMhTbyqHFfUCe9Nvc0He9HCwenM7dlqjXXAAIAlCFi14HDp+CMct
 FbCiUmGYajMYRiMsfb4g7syHU1sfHYidX+7Rf0oyzrHxUX+smKj10dzrsnCtjaGO04Eb
 f3BoETrgEetFEGtyppm4WpZtEheTAotJFV0yI4+O9PRtPdhFTrTixTQFkTlB2vATV/At
 /GWNoYWudh1Vysp4Ohsh0wGsLeT8P+YYH2582QIOhly6TZ+6IPPvOybACH/4ia7I+kLD
 CZGunH3GDWW15x9CoWn0CWVgnGD7hcFq4PF402sdQfRmdldmtnrjhzPH5ddIqaTkiq45
 gOSQ==
X-Gm-Message-State: AOAM532d3dbGOTy/TuJWR6X7zt/yWObZ1bC0pvPe6DymQijj+RTOn6eK
 qBCdgLypOGkaiYzmxKBmhDz9iaeJsGBUAB44KutKiNQGfKk=
X-Google-Smtp-Source: ABdhPJyQJxihaFNA4A53Zw4JJfauiFp1ByT3l2+b9XytEbEObkDahNtSovQIudpiKYScOGBh9rACIAdh0+OPg31F68w=
X-Received: by 2002:a05:6830:1bef:: with SMTP id
 k15mr7631084otb.303.1611164527608; 
 Wed, 20 Jan 2021 09:42:07 -0800 (PST)
MIME-Version: 1.0
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210120170033.38468-3-noralf@tronnes.org>
In-Reply-To: <20210120170033.38468-3-noralf@tronnes.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 20 Jan 2021 18:41:56 +0100
Message-ID: <CAKMK7uF62TrWhqBMM6qa+nXbKEs=sEGw6eF62S_NfTanyXc_Xg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] drm/probe-helper: Check epoch counter in
 output_poll_execute()
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: hudson@trmm.net, markus@raatikainen.cc, peter@stuge.se,
 USB list <linux-usb@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tyler Hardin <th020394@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, pontus.fuchs@gmail.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMjAsIDIwMjEgYXQgNjoxMCBQTSBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0
cm9ubmVzLm9yZz4gd3JvdGU6Cj4KPiBkcm1faGVscGVyX2hwZF9pcnFfZXZlbnQoKSBjaGVja3Mg
dGhlIGVwb2NoIGNvdW50ZXIgdG8gZGV0ZXJtaW5lCj4gY29ubmVjdG9yIHN0YXR1cyBjaGFuZ2Uu
IFRoaXMgd2FzIGludHJvZHVjZWQgaW4KPiBjb21taXQgNTE4NjQyMWNiZmUyICgiZHJtOiBJbnRy
b2R1Y2UgZXBvY2ggY291bnRlciB0byBkcm1fY29ubmVjdG9yIikuCj4gRG8gdGhlIHNhbWUgZm9y
IG91dHB1dF9wb2xsX2V4ZWN1dGUoKSBzbyBpdCBjYW4gZGV0ZWN0IG90aGVyIGNoYW5nZXMKPiBi
ZXNpZGUgY29ubmVjdGlvbiBzdGF0dXMgdmFsdWUgY2hhbmdlcy4KPgo+IFNpZ25lZC1vZmYtYnk6
IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jIHwgNyArKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcm9iZV9oZWxw
ZXIuYwo+IGluZGV4IGQ2MDE3NzI2Y2MyYS4uZTU0MzJkY2Y2OTk5IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3Byb2JlX2hlbHBlci5jCj4gQEAgLTYyMyw2ICs2MjMsNyBAQCBzdGF0aWMgdm9pZCBvdXRw
dXRfcG9sbF9leGVjdXRlKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgICAgICAgIHN0cnVj
dCBkcm1fY29ubmVjdG9yX2xpc3RfaXRlciBjb25uX2l0ZXI7Cj4gICAgICAgICBlbnVtIGRybV9j
b25uZWN0b3Jfc3RhdHVzIG9sZF9zdGF0dXM7Cj4gICAgICAgICBib29sIHJlcG9sbCA9IGZhbHNl
LCBjaGFuZ2VkOwo+ICsgICAgICAgdTY0IG9sZF9lcG9jaF9jb3VudGVyOwo+Cj4gICAgICAgICBp
ZiAoIWRldi0+bW9kZV9jb25maWcucG9sbF9lbmFibGVkKQo+ICAgICAgICAgICAgICAgICByZXR1
cm47Cj4gQEAgLTY1OSw4ICs2NjAsOSBAQCBzdGF0aWMgdm9pZCBvdXRwdXRfcG9sbF9leGVjdXRl
KHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPgo+ICAgICAgICAgICAgICAgICByZXBvbGwgPSB0
cnVlOwo+Cj4gKyAgICAgICAgICAgICAgIG9sZF9lcG9jaF9jb3VudGVyID0gY29ubmVjdG9yLT5l
cG9jaF9jb3VudGVyOwo+ICAgICAgICAgICAgICAgICBjb25uZWN0b3ItPnN0YXR1cyA9IGRybV9o
ZWxwZXJfcHJvYmVfZGV0ZWN0KGNvbm5lY3RvciwgTlVMTCwgZmFsc2UpOwo+IC0gICAgICAgICAg
ICAgICBpZiAob2xkX3N0YXR1cyAhPSBjb25uZWN0b3ItPnN0YXR1cykgewpXYXMgYWJvdXQgdG8g
YXNrIHdoZXRoZXIgd2UncmUgbm90IG1pc3NpbmcgY29ubmVjdG9yIHN0YXR1cyBjaGFuZ2VzCmhl
cmUsIGJ1dCB0aGF0J3MgYWxyZWFkeSBoYW5kbGVkLiBOb3Qgc3VyZSB3aHkgdGhpcyB3YXNuJ3Qg
ZG9uZSBhcwpwYXJ0IG9mIHRoZSBvcmlnaW5hbCBwYXRjaCwgSSdkIGluY2x1ZGUgYSBjYzogc3Rh
YmxlIGhlcmUuCgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZnds
bC5jaD4KCj4gKyAgICAgICAgICAgICAgIGlmIChvbGRfZXBvY2hfY291bnRlciAhPSBjb25uZWN0
b3ItPmVwb2NoX2NvdW50ZXIpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFy
ICpvbGQsICpuZXc7Cj4KPiAgICAgICAgICAgICAgICAgICAgICAgICAvKgo+IEBAIC02ODksNiAr
NjkxLDkgQEAgc3RhdGljIHZvaWQgb3V0cHV0X3BvbGxfZXhlY3V0ZShzdHJ1Y3Qgd29ya19zdHJ1
Y3QgKndvcmspCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25uZWN0
b3ItPmJhc2UuaWQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25u
ZWN0b3ItPm5hbWUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvbGQs
IG5ldyk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgRFJNX0RFQlVHX0tNUygiW0NPTk5FQ1RP
UjolZDolc10gZXBvY2ggY291bnRlciAlbGx1IC0+ICVsbHVcbiIsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25uZWN0b3ItPmJhc2UuaWQsIGNvbm5lY3Rvci0+bmFt
ZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZF9lcG9jaF9jb3Vu
dGVyLCBjb25uZWN0b3ItPmVwb2NoX2NvdW50ZXIpOwo+Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgY2hhbmdlZCA9IHRydWU7Cj4gICAgICAgICAgICAgICAgIH0KPiAtLQo+IDIuMjMuMAo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoKCi0t
IApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
