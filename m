Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65924CE911
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 18:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F776E21E;
	Mon,  7 Oct 2019 16:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9406E21E;
 Mon,  7 Oct 2019 16:23:41 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o18so16019884wrv.13;
 Mon, 07 Oct 2019 09:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OFlhJbSi23b2NFiSK6+YKaIl+Aw85wcuS6pgAqIhXRY=;
 b=uEY1Bcx19Yzup6B+EY+q1PujZfv829jwIny8AeoyhIO10VtAuizaGGmVU8R2UBWINP
 g3JU5gbSyGfbp7JdwePYF86dTQqcOvaZlFo7df3im35+DDHFduaKgMH6THat9mkG0k75
 Y/7kOuzOGlWf/6Tn3S//D6+IF4os8mltUWUFpxdVR8GUIqNRff8meDoP3tBbwIu/ybEG
 gJYnEq0KX8oHPULDwKAz3ye2XBpsUDG1ru+Tc5aqgMOk7sQFEoZHD+dvrgTX8KV7iEn6
 lRTuur1cN3awv2IBypASeI8eD6uuMDyeajyVPPM/w+ZUxOuNqLPYp91RTyjKXoWMAjNh
 /BTQ==
X-Gm-Message-State: APjAAAVhlp6+PbVaJgXQui03kEBNyjQqTORw22aRsjQwslc6lvQWzJFD
 RirMWC9IkcP8lr4hDrwQiUKpksUR4mmJ/zc7rEg=
X-Google-Smtp-Source: APXvYqzHtsoox7+vQL8r8xNyNG2fI+P4YKL+4ELMDUE83Kc1Res1M3I9ltfd6U++IXXqArcxJLCXAg9VkSYS6k/8ba8=
X-Received: by 2002:a5d:6052:: with SMTP id j18mr12936827wrt.40.1570465420545; 
 Mon, 07 Oct 2019 09:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191007090454.GE3865@mwanda>
 <MN2PR12MB3296695EB3D9799B10971184A29B0@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3296695EB3D9799B10971184A29B0@MN2PR12MB3296.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Oct 2019 12:23:27 -0400
Message-ID: <CADnq5_N3=qpKJ2YaP4h=SMnNU1jP8Y9VhwqfhzYZos7txQgcMw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: unlock on error in smu_resume()
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OFlhJbSi23b2NFiSK6+YKaIl+Aw85wcuS6pgAqIhXRY=;
 b=SItsYgREmxzYuNcynIf8NfPJgmDqq38v6u6tdKmMTV7HpHdcXnEkL+ntMCEn720gsB
 VoGn8j+nU4yJl7L0akvUFNooPq4Iaa7B3GhUk9K6uqTqohMFGd9itxWhUITLfNq6jWv0
 l/hutITWJ7OGMJfdMQdGzsCOtg9QsLrt06R3GSx4Db4ZmNs96ywSjjVkM4rq6kE8HVVA
 9CAOl5mt9erRDCZ0YwY1pbi1U03U4ae6iR6MqM+oytK6LKkFunia7PamfsO7RkDXqip9
 bGJxvWJlXcdgDhRxsr04sQob4zFX+/OPpamIa1j+d74+Ek5BxzdLAgsTfEFgpI+Nwiiz
 ikWw==
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgT2N0IDcsIDIwMTkgYXQgNjoyOSBBTSBX
YW5nLCBLZXZpbihZYW5nKSA8S2V2aW4xLldhbmdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBSZXZpZXdl
ZC1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KPgo+IEJlc3QgUmVnYXJkcywK
PiBLZXZpbgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gRnJvbTogYW1kLWdm
eCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gb24gYmVoYWxmIG9mIERh
biBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPiBTZW50OiBNb25kYXksIE9j
dG9iZXIgNywgMjAxOSA1OjA0IFBNCj4gVG86IFJleCBaaHUgPHJleC56aHVAYW1kLmNvbT47IFF1
YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPgo+IENjOiBaaG91LCBEYXZpZChDaHVuTWluZykg
PERhdmlkMS5aaG91QGFtZC5jb20+OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+OyBr
ZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnIDxrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJu
ZWwub3JnPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgPGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyA8ZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47
IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IEtvZW5pZywg
Q2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+Cj4gU3ViamVjdDogW1BBVENIXSBk
cm0vYW1kL3Bvd2VycGxheTogdW5sb2NrIG9uIGVycm9yIGluIHNtdV9yZXN1bWUoKQo+Cj4gVGhp
cyBmdW5jdGlvbiBuZWVkcyB0byBkcm9wIHRoZSBtdXRleCBiZWZvcmUgcmV0dXJuaW5nLgo+Cj4g
Rml4ZXM6IGY3ZTNhNTc3NmZhNiAoImRybS9hbWQvcG93ZXJwbGF5OiBjaGVjayBTTVUgZW5naW5l
IHJlYWRpbmVzcyBiZWZvcmUgcHJvY2VlZGluZyBvbiBTMyByZXN1bWUiKQo+IFNpZ25lZC1vZmYt
Ynk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKPiBpbmRleCA2YTY0Zjc2NWZjZDQuLmYxZmJi
YzhiNzdlZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRn
cHVfc211LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211
LmMKPiBAQCAtMTM4NCw3ICsxMzg0LDcgQEAgc3RhdGljIGludCBzbXVfcmVzdW1lKHZvaWQgKmhh
bmRsZSkKPiAgICAgICAgICByZXQgPSBzbXVfc3RhcnRfc21jX2VuZ2luZShzbXUpOwo+ICAgICAg
ICAgIGlmIChyZXQpIHsKPiAgICAgICAgICAgICAgICAgIHByX2VycigiU01VIGlzIG5vdCByZWFk
eSB5ZXQhXG4iKTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiArICAgICAgICAgICAg
ICAgZ290byBmYWlsZWQ7Cj4gICAgICAgICAgfQo+Cj4gICAgICAgICAgcmV0ID0gc211X3NtY190
YWJsZV9od19pbml0KHNtdSwgZmFsc2UpOwo+IC0tCj4gMi4yMC4xCj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0
Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
