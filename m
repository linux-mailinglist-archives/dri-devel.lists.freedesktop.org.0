Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5FA50617
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 11:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34C689823;
	Mon, 24 Jun 2019 09:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93EE899FF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 09:48:48 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id v186so9290895oie.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 02:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CWe3sgHO5eaf6cmbcjGFeGsZzgHQ4SnbajdVeSc5/jA=;
 b=bl7W4zPjEMImEEKOq3Z5Aba4BieIx7lQIlybQTqQcOGtk2zDjeDqUnBPS5suY4Uo2c
 7uPCEv7gqQZIFk1A8TIP9QIMbXj1RWlQ+qYL/9extMpEho8lNUZlhvoV+VU5T9K0DU5a
 WEoqhr7gjt1DAQYJIh50erANPrE4x+mHr0kXdk0pEnDgDDMTDSEIuObTm0sR0ddv82f0
 zw4Y7m1+xyb5y8pgbcKjwgz87j1LhfeAtrUPkT20KhIoI1i9B0y0aQns+N998oWjQI8L
 GOTxd+3j/t+94+D+YN7nsQ+trKK9z+QiDM8OgYTzqSipemfr5hSs3hUjm635QqDrbykK
 ZXow==
X-Gm-Message-State: APjAAAUBa/I/bSYYaxKUi2AFpSyfyeCViwPc3C2bg/uTJB67sSG24UgD
 gXv+J6F4bq4wDv8Ly/t205eKzfEwTlGzGiBs8fHP6w==
X-Google-Smtp-Source: APXvYqyzAyvxtFtZrAwuGokfKNGyZvap6+grW1wdXlAFaEdJzSKGOpwzRTSmOhYIWvCPslCwxekNkX2k9IiLLq4BlYY=
X-Received: by 2002:aca:b2d5:: with SMTP id b204mr9490097oif.101.1561369727889; 
 Mon, 24 Jun 2019 02:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
 <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
 <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
 <20190621102015.GA21486@arch-x1c3>
 <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
 <CAKMK7uEVziNZJES9=JFBUu=LpmubS8=-A654cMN+QqhEmc8Fvw@mail.gmail.com>
 <c92dc683-6815-dc5a-dc2b-54517cc027de@gmail.com>
 <CAKMK7uHsv3HOXOQq=GGRkx6f+ssRg7dO7qEoBqRS9V_KiTN3Hg@mail.gmail.com>
 <b182c8e3-c060-71f0-2b3b-62600d825c9f@daenzer.net>
 <20190621154416.GE12905@phenom.ffwll.local>
 <13024821-4767-eeaf-86eb-9ae1056f8931@daenzer.net>
 <b03e8977-c51a-9606-383f-cf4ba674dcdd@daenzer.net>
In-Reply-To: <b03e8977-c51a-9606-383f-cf4ba674dcdd@daenzer.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 24 Jun 2019 11:48:35 +0200
Message-ID: <CAKMK7uHqWY=nWMHi8mOqrjRCwyy_WoHvY4_4w8ESvm8SoKuapg@mail.gmail.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CWe3sgHO5eaf6cmbcjGFeGsZzgHQ4SnbajdVeSc5/jA=;
 b=UcXnXfHAeb/TRjPF/LN8FlVw3zm0kZhraVyuKkTPExGrhWAzZJySHvj+sinbtqFHAY
 hsLf1ClFQCrE97VbVMpuzWDiLnBvOVA7jaXC6yzpgQRrAXKGCHLJRwEJctQhh/ZEVTZE
 8iNr+ZUsjeAPGpFdndShU0UPA0ZDmI1xrUbPE=
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
Cc: David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTE6MzcgQU0gTWljaGVsIETDpG56ZXIgPG1pY2hlbEBk
YWVuemVyLm5ldD4gd3JvdGU6Cj4gT24gMjAxOS0wNi0yMSA1OjUyIHAubS4sIE1pY2hlbCBEw6Ru
emVyIHdyb3RlOgo+ID4+IFRoYXQgd2FzIHRoZSBlbnRpcmUgcG9pbnQgb2Yga21zLCBhbmQgaXQg
c3VjY2VlZCByZWFsbHkgd2VsbC4gVGhhdCdzCj4gPj4gd2h5IEkgZG9uJ3QgdGhpbmsgYW1kZ3B1
IGRvaW5nIHRoZWlyIG93biBmbGF2b3VyIHBpY2sgaXMgZ29pbmcgdG8gaGVscAo+ID4+IGFueW9u
ZSBoZXJlLAo+ID4gT3RoZXIgZHJpdmVycyBhcmUgd2VsY29tZSB0byBlbXVsYXRlIGFtZGdwdSdz
IGRlc2lnbiBtYWtpbmcgdGhlIGFib3ZlCj4gPiBwb3NzaWJsZS4gOikKPgo+IFNlcmlvdXNseSB0
aG91Z2gsIEkgZG9uJ3QgdGhpbmsgYW55IGNoYW5nZXMgb3V0c2lkZSBvZiBsaWJkcm0vTWVzYQo+
IHNob3VsZCBiZSBuZWVkZWQgd2l0aCBvdGhlciBkcml2ZXJzIGVpdGhlci4gRnVuZGFtZW50YWxs
eSB0aGVyZSdzCj4gbm90aGluZyBtYWdpYyBhYm91dCBpdCwganVzdCBzaGFyaW5nIEJPcyB2aWEg
UFJJTUUgYmV0d2VlbiB0aGUgcmVuZGVyCj4gbm9kZSBmaWxlIGRlc2NyaXB0aW9uIGFuZCB0aGF0
IHBhc3NlZCBpbiB2aWEgdGhlIEVHTC9HQk0vLi4uIEFQSS4KClRoZSBsaWJkcm0vbWVzYSBkZXNp
Z24gaXNuJ3QgdGhlIGhhcmQgcGFydCwgd2UgaGF2ZSB0aGF0IGV2ZW4gYXMgYQpoZWxwZXIgZm9y
IGV0bmF2aXYgYW5kIGFsbCB0aG9zZSBkcml2ZXJzLiBCZWluZyBpbmNvbnNpc3RlbnQgaGVyZSBp
cyBhCnRoaW5rIG1vcmUgYSBudWlzYW5jZSBmb3IgaW50ZWdyYXRvcnMsIHdobyBtaWdodCB3YW50
IHRvIHNhbmRib3ggZ3B1CmNsaWVudHMgcmVhbCBoYXJkIGFuZCByZWFsbHkgd2FudCB0byBrbm93
IHdoYXQgYWNjZXNzIHJpZ2h0cyB0aGV5IG5lZWQKdG8gZ2l2ZSBvdXQuCgpCdXQgdGhlbiB3ZSBo
YXZlIG11Y2gsIG11Y2ggYmlnZ2VyIGZpc2ggdG8gZnJ5IGZyb20gYSBjcm9zcy1kcml2ZXIKY29u
c2lzdGVuY3kgcG92LCBzbyAqc2hydWcqLiBKdXN0IGZlZWxzIHNvbWV3aGF0IHNpbGx5IHdlIGNh
bid0IGV2ZW4KZ2V0IGFncmVlbWVudCBvciBzb21lIGtpbmQgb2YgY29uc2lzdGVudCBwbGFuIG9u
IHNvbWV0aGluZyBmYWlybHkKc2ltcGxlIGxpa2UgdGhpcy4KLURhbmllbAotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUg
NTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
