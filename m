Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6F526E23D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 19:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F24689173;
	Thu, 17 Sep 2020 17:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E356989173
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 17:23:14 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id w16so3371360oia.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 10:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F86p0ud99YSiTMCN0ZfJJse9lFQfi+WRyzF06l3LfwA=;
 b=Oe+9XFyi4XwSdp0c08MIQlmhrPw1Z8ltKB2S7V3IMBblrL34HKoK0b4blCy3ZHSJxj
 7IaJJ0RwaRrjJztcw/95TWgK1iToMprnqvda3Cw5Rs+2ciTDAeh8nMCt44s2ulVhn6KN
 6sAVjFYZRVuJFjONKZdpeD53O77tF58gs1uyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F86p0ud99YSiTMCN0ZfJJse9lFQfi+WRyzF06l3LfwA=;
 b=RsvxR4LhHo+27ryWYQDEoQEqqH0KAJi0FVVErxEca05qTbEb2P6pppvC7SBERG2pHw
 WFyT1II9V4jyjVJNUNo4zMg77NpvpNc9XBP0JfCPFL1abfwqFZbySzkWPDk9Jja7VpUo
 vZNS/zgNTyidmcLPO2sxj6xI2pz0CFvabQii7fj+x6y1NIKtiTOhY1H/jc19B1fvPKm+
 nKmSUOiujbgqTj8aVhcGiOC/DOUSUmlrUkoGr58H4y9an1I9lu5C/UIhRBw74ksySEax
 xWV2xJVEm0bcz66gqxnOdfOHtcV4J6q6QSmXbIYS5E8IFy7+83MGUieHHw45YBhGGDEZ
 53og==
X-Gm-Message-State: AOAM5314fzHAfkXs2Dz1Q8g/6Rd3O+bJET5c8J040EHZ2m8AbBtg3qJg
 IQNtNUOTZNHVpQw3tqEjT3Y12F0e7rFOFPxYZL+new==
X-Google-Smtp-Source: ABdhPJwF3dNmQNnc08BdxH8My7DtOBpKWMR10LzO7dt3VFCMGmJE1UwcTFFGHLsdQ5ho5h5wrPc5sUf6w5ZuU6y8//k=
X-Received: by 2002:aca:6083:: with SMTP id u125mr7050119oib.14.1600363394219; 
 Thu, 17 Sep 2020 10:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
 <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
 <20200917121858.GF8409@ziepe.ca>
 <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
 <20200917143551.GG8409@ziepe.ca>
 <5b330920-c789-fac7-e9b1-49f3bc1097a8@gmail.com>
 <20200917152456.GH8409@ziepe.ca>
 <CAKMK7uHQLAHXC_aBZZco0e3tbAqnNuW8QdJk=-V-yM2khw5e=Q@mail.gmail.com>
 <b9e65f47-b5c8-db09-117a-a8e22a5b6c71@amd.com>
 <20200917163907.GI8409@ziepe.ca>
In-Reply-To: <20200917163907.GI8409@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 17 Sep 2020 19:23:03 +0200
Message-ID: <CAKMK7uHrQ13-0oxTGZERQeoJ7jQES9jeDf0FhY3qW-NHdZvZ4w@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTcsIDIwMjAgYXQgNjozOSBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBUaHUsIFNlcCAxNywgMjAyMCBhdCAwNjowNjoxNFBNICswMjAw
LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+ID4gPiA+IElmIGl0IGlzIGFscmVhZHkgdGFraW5n
IGEgcGFnZSBmYXVsdCBJJ20gbm90IHN1cmUgdGhlIGV4dHJhIGZ1bmN0aW9uCj4gPiA+ID4gY2Fs
bCBpbmRpcmVjdGlvbiBpcyBnb2luZyB0byBiZSBhIGJpZyBkZWFsLiBIYXZpbmcgYSB1bmlmb3Jt
IFZNQQo+ID4gPiA+IHNvdW5kcyBzYW5lciB0aGFuIGV2ZXJ5IGRyaXZlciBjdXN0b20gcm9sbGlu
ZyBzb21ldGhpbmcuCj4gPiA+ID4KPiA+ID4gPiBXaGVuIEkgdW53b3VuZCBhIHNpbWlsYXIgbWVz
cyBpbiBSRE1BIGFsbCB0aGUgY3VzdG9tIFZNQSBzdHVmZiBpbiB0aGUKPiA+ID4gPiBkcml2ZXJz
IHR1cm5lZCBvdXQgdG8gYmUgZ2VuZXJhbGx5IGJ1Z2d5LCBhdCBsZWFzdC4KPiA+ID4gPgo+ID4g
PiA+IElzIHZtYS0+dm1fZmlsZS0+cHJpdmF0ZV9kYXRhIHVuaXZlcnNhbGx5IGEgZG1hX2J1ZiBw
b2ludGVyIGF0IGxlYXN0Pwo+ID4gPiBOb3BlLiBJIHRoaW5rIGlmIHlvdSB3YW50IHRoaXMgd2l0
aG91dCBzb21lIGxhcmdlIHNjYWxlIHJld3JpdGUgb2YgYQo+ID4gPiBsb3Qgb2YgY29kZSB3ZSdk
IG5lZWQgYSB2bW9wcy0+Z2V0X2RtYWJ1ZiBvciBzaW1pbGFyLiBOb3QgcHJldHR5LCBidXQKPiA+
ID4gd291bGQgZ2V0IHRoZSBqb2IgZG9uZS4KPiA+Cj4gPiBZZWFoLCBhZ3JlZSB0aGF0IHNvdW5k
cyBsaWtlIHRoZSBzaW1wbGVzdCBhcHByb2FjaC4KPgo+IEkgZG9uJ3QgdGhpbmsgdGhhdCB3aWxs
IGZseSwgaXQgaXMgY2xlYXJseSBvbmx5IHBhcGVyaW5nIG92ZXIgYSBtZXNzCj4gaW5zaWRlIERS
TS9kbWEgYnVmIDpcCgpkbWEtYnVmIHN0YXJ0ZWQgb3V0IGFzIHNvbWV0aGluZyB0byBwYXBlciBv
dmVyIHRoZSBkaXNqb2ludCBtZXNzIG9mCmFsbG9jYXRvcnMsIHNpbmNlIGl0IHdhcyBwcmV0dHkg
Y2xlYXIgdG8gYW55b25lIGludm9sdmVkIHdlJ3JlIG5vdApnb2luZyB0byB1bmlmeSB0aGVtIGFu
eXRpbWUgc29vbiwgaWYgZXZlci4gU28gdGhlIG1lc3MgcHJldHR5IG11Y2ggaXMKYm91bmQgdG8g
c3RheS4KCkkgdGhpbmsgbW9zdCByZWFzb25hYmxlIHRoaW5nIHdvdWxkIGJlIHRvIHRocm93IGEg
Y29tbW9uIHZtb3BzIGluCnRoZXJlIHNvbWVob3csIGJ1dCBldmVuIHRoYXQgbWVhbnMgc29tZSBs
YXJnZSBzY2FsZSBzdXJnZXJ5IGFjcm9zcwpldmVyeSBkcml2ZXIvc3Vic3lzdGVtIGludm9sdmVk
IGluIGRtYS1idWYuIEl0IHdvdWxkbid0IHVuaWZ5CmFueXRoaW5nLCBhbGwgaXQgd291bGQgZ2l2
ZSB5b3UgaXMgYSBjb25zdGFudCB2bWEtPnZtX29wcyB0byBkbyBzb21lCmtpbmQgb2YgdXBjYXN0
aW5nLiBBbmQgdGhhdCB3b3VsZCBzdGlsbCBvbmx5IGdpdmUgeW91IGEgc2xpZ2h0bHkgbGVzcwpv
cGFxdWUgcG9pbnRlciB3aXRoIGEgY2FsbGJhY2sgdG8gdXBjYXN0IHRvIGEgZG1hLWJ1ZiBpbiBz
b21lCmRyaXZlci9zdWJzeXN0ZW0gc3BlY2lmaWMgd2F5LgotRGFuaWVsCi0tIApEYW5pZWwgVmV0
dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZnds
bC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
