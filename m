Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D77B251A7
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 16:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA89289361;
	Tue, 21 May 2019 14:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B156489361;
 Tue, 21 May 2019 14:13:25 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l2so18803730wrb.9;
 Tue, 21 May 2019 07:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F6tVtGsR/ZL3+L2Loim54+DJs9BSN+XwPzuOvX3M5OQ=;
 b=mviNtpjxhVvtpe2Rkvq2HKcyD6W4wKmu5ci799aFm5yxZEXzFBxINs80X1dK/kLcGS
 8HBEB8BsXFtehjoN+2FHtgKDScYg0OpUrycQEexxTIJ8DvpeEsj6Bgx2KqAqtDpDM/3k
 +69n9dt/CZkIjq2CglbqO6RcDDZw9h0jD8VHLgsNLtuRd8ck0Vf+wW2M4gI2hwzoqv5y
 0h7+q5nrNr+g//egj+cGoW0S52wizywOVrnZzKuy/1xX66qDyv9zneHNQmG0nTPF0Mpu
 7vCcri7+swa8N3G8x+j5gvfQaPxO1IqpYCNE2cUQMho05LJTi8PgTdERwO18/WWPJ2zw
 SWtw==
X-Gm-Message-State: APjAAAX+3a8PIAagsjm0gZymHqnHAgfeE4WOzZoFnd/UOFCwMOIp1lXQ
 WILKqmlPBakMpMXIPpt4oEJ5qSWMrfP/JceAL4f1HLUUcI4=
X-Google-Smtp-Source: APXvYqwZXkcH9vf9kjxt2zERyn49xFXY3cK+lcAXOY5s9eInQVyXJtketaWVLef7eW0OmdmhGlPDD35ymx8Q0S5/uJg=
X-Received: by 2002:adf:e2c7:: with SMTP id d7mr14126718wrj.272.1558448004317; 
 Tue, 21 May 2019 07:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190520231649.24595-1-nunes.erico@gmail.com>
 <cff4f34a-c604-b662-c250-15c426062601@amd.com>
In-Reply-To: <cff4f34a-c604-b662-c250-15c426062601@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 21 May 2019 10:13:10 -0400
Message-ID: <CADnq5_NzJbcqe5vs52AXus0V9Cm1nxX6NGey1FUMi__mb6QCzg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/scheduler: Fix job cleanup without timeout handler
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F6tVtGsR/ZL3+L2Loim54+DJs9BSN+XwPzuOvX3M5OQ=;
 b=F+msoC4lQQG08euYCWvcwFlEL0pn8w5MZXZkXc5JewIwzPmQ2vdBCbMALa5+2t9H14
 mZNEwamiN9jP2+yKHZXJDhGr0RdEnDAxWFhUAbGXDnlboBcVn9wN5W+9jTCK+rKSJ42i
 VMOPNtSs2EV9yZyx4szNxJBqPX+2OzkpYTTIkh4XlYxb+l7VO3xFvViPjgiOiysAtrLD
 Qg1iMVBQTD2eB9WL25KEv+OvbD+piuIgO0vjpdTHpJ360kjpsyeZr62kErKEgL9oT1g+
 eQmBhTQpoTZFjnzvy4zA+BEItypxSass0BXNuhKBjOC9aJKuTim95Jhdn+OftZjtBFll
 bAYA==
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
Cc: "lima@lists.freedesktop.org" <lima@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Sharat Masetty <smasetty@codeaurora.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Nayan Deshmukh <nayan26deshmukh@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMjo0OCBBTSBLb2VuaWcsIENocmlzdGlhbgo8Q2hyaXN0
aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDIxLjA1LjE5IHVtIDAxOjE2IHNjaHJp
ZWIgRXJpY28gTnVuZXM6Cj4gPiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdCj4gPgo+ID4gQWZ0
ZXIgIjU5MTgwNDVjNGVkNCBkcm0vc2NoZWR1bGVyOiByZXdvcmsgam9iIGRlc3RydWN0aW9uIiwg
am9icyBhcmUKPiA+IG9ubHkgZGVsZXRlZCB3aGVuIHRoZSB0aW1lb3V0IGhhbmRsZXIgaXMgYWJs
ZSB0byBiZSBjYW5jZWxsZWQKPiA+IHN1Y2Nlc3NmdWxseS4KPiA+Cj4gPiBJbiBjYXNlIG5vIHRp
bWVvdXQgaGFuZGxlciBpcyBydW5uaW5nICh0aW1lb3V0ID09IE1BWF9TQ0hFRFVMRV9USU1FT1VU
KSwKPiA+IGpvYiBjbGVhbnVwIHdvdWxkIGJlIHNraXBwZWQgd2hpY2ggbWF5IHJlc3VsdCBpbiBt
ZW1vcnkgbGVha3MuCj4gPgo+ID4gQWRkIHRoZSBoYW5kbGluZyBmb3IgdGhlICh0aW1lb3V0ID09
IE1BWF9TQ0hFRFVMRV9USU1FT1VUKSBjYXNlIGluCj4gPiBkcm1fc2NoZWRfY2xlYW51cF9qb2Jz
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEVyaWNvIE51bmVzIDxudW5lcy5lcmljb0BnbWFpbC5j
b20+Cj4gPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+
Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPgo+IEdvaW5nIHRvIHBpY2sgdGhhdCB1cCBsYXRlciB0b2RheSBpbnRvIG91ciBpbnRlcm5h
bCBicmFuY2guCgpQbGVhc2UgYXBwbHkgaXQgdG8gZHJtLW1pc2MtbmV4dC4gIHRoYXQgaXMgd2hl
cmUgdGhlIG90aGVyIGdwdQpzY2hlZHVsZXIgY2hhbmdlcyBhcmUuICBUaGV5IGFyZSBub3QgaW4g
NS4yLgoKQWxleAoKPgo+IFRoYW5rcyBmb3IgdGhlIGhlbHAsCj4gQ2hyaXN0aWFuLgo+Cj4gPiAt
LS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCAzICsrLQo+
ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIGIv
ZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPiA+IGluZGV4IGY4ZjBlMWMx
OTAwMi4uMTBkMWQzN2U2NDRhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVk
dWxlci9zY2hlZF9tYWluLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfbWFpbi5jCj4gPiBAQCAtNjMwLDcgKzYzMCw4IEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9j
bGVhbnVwX2pvYnMoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkKPiA+ICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gPgo+ID4gICAgICAgICAgLyogRG9uJ3QgZGVzdHJveSBq
b2JzIHdoaWxlIHRoZSB0aW1lb3V0IHdvcmtlciBpcyBydW5uaW5nICovCj4gPiAtICAgICAgIGlm
ICghY2FuY2VsX2RlbGF5ZWRfd29yaygmc2NoZWQtPndvcmtfdGRyKSkKPiA+ICsgICAgICAgaWYg
KHNjaGVkLT50aW1lb3V0ICE9IE1BWF9TQ0hFRFVMRV9USU1FT1VUICYmCj4gPiArICAgICAgICAg
ICAhY2FuY2VsX2RlbGF5ZWRfd29yaygmc2NoZWQtPndvcmtfdGRyKSkKPiA+ICAgICAgICAgICAg
ICAgICAgcmV0dXJuOwo+ID4KPiA+Cj4gPiAtLQo+ID4gMi4yMC4xCj4gPgo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
