Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F413276685
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 04:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FF86EA64;
	Thu, 24 Sep 2020 02:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D7A6EA64
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 02:36:00 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k14so1840087edo.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 19:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RUhXgnLJoawDx9qffc5ratCU+C+NSluRhyhoqmvHceA=;
 b=RXlQWm5ORBfK4F9VGyq3SOpozUNVOFA+U3ME9exQDUm0ZWKdBDXmDjHhjQrfzdk0pi
 Ypsomghr2qAUowX9R3nzgTahb3aNXgcOyxjU0lter4NKe6c7UNxQhhcsIIey6Q7627WL
 YVKoQQLXjl1+qaJTXl7GraPbzGLA5rX2KYL8S0qxTgdWxXCo0vIWa+QaAVS2doO+65OK
 KmKTQkmFw9vqLrA8XeoG986NWPcGYoTXzDZTShga+6bQi2LoQQEIyTU/6QLjldG3H0we
 TTnLTwFrW+WPn9QPg7SfnK2dyB2NF/SModXK3dnxUZdYpJB30NmdnafT4/9x/DJZayCq
 SteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RUhXgnLJoawDx9qffc5ratCU+C+NSluRhyhoqmvHceA=;
 b=ZqyGFZyrrTAMIz/K9FfvNEWutYSeUvk6+VWfph9/dNL9wT/Jp233xBf3YKlmts2jW2
 vj3vSKoiojtejXoI5wJirodiTdcMji/Grqq+B8FRV8a9YZMichiKA5LpyIzSsl+DRbyp
 A5KEi2FA0xjEep1camJa4aA588a65eCWTJgSFl+TaP41KVAKsgXlcszvZVRAOXzaxE5A
 xjSUB4GCCy28oAB+3LvHwgz+Ylk7G3tbDcN/xZdQeenTPlTfcKhug3MWueDa1cNJDgtQ
 i+sXEQuxnpgshBUXtox0D2E74VDlS3RqyFw4R/7mL2IzIp22CUdgNuKyfrLdqGARFo9O
 2urg==
X-Gm-Message-State: AOAM532jr8VVWOMGnY+MwxFCRjVo1En62mv5umUYzOM7yEuPnM4JaBuf
 DRJHeagm7Wd3bKJEKJ+y1GVmANXfiFst4qusUi3i3apV
X-Google-Smtp-Source: ABdhPJxqv17nS5Sb4+79JMkcWuZwbe+P/tPZsHH5vhQr1AK3KdAum8PqjgUpQndC54s8MCYtWsd/Iwcnyd2ZjAQsAuk=
X-Received: by 2002:a50:d987:: with SMTP id w7mr2341203edj.113.1600914959158; 
 Wed, 23 Sep 2020 19:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200923030454.362731-1-airlied@gmail.com>
 <20200923030454.362731-8-airlied@gmail.com>
 <51eae609-0ea5-d204-f34b-ea5d67989760@amd.com>
 <CAPM=9tyC7fjfGhY8Hz1UzSdjvigJou39nZ-cd9omqiMZJHi-3w@mail.gmail.com>
In-Reply-To: <CAPM=9tyC7fjfGhY8Hz1UzSdjvigJou39nZ-cd9omqiMZJHi-3w@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 24 Sep 2020 12:35:48 +1000
Message-ID: <CAPM=9tywhGvHVGNM7J5Fe8jx0GzrayMf6KphRpwKh+n3m5RTmg@mail.gmail.com>
Subject: Re: [PATCH 07/10] drm/amdgpu/ttm: handle tt moves properly.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNCBTZXAgMjAyMCBhdCAxMDo0NiwgRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwu
Y29tPiB3cm90ZToKPgo+IE9uIFRodSwgMjQgU2VwIDIwMjAgYXQgMDA6NDYsIENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQW0gMjMuMDku
MjAgdW0gMDU6MDQgc2NocmllYiBEYXZlIEFpcmxpZToKPiA+ID4gRnJvbTogRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAcmVkaGF0LmNvbT4KPiA+ID4KPiA+ID4gVGhlIGNvcmUgbW92ZSBjb2RlIGN1cnJl
bnRseSBoYW5kbGVzIHVzZV90dCBtb3ZlcywgZm9yIGFtZGdwdQo+ID4gPiB0aGlzIHdhcyBiZWlu
ZyBoYW5kbGVkIGFsc28gaW4gdGhlIGRyaXZlciwgYnV0IG5vdCB1c2luZyB0aGUgc2FtZQo+ID4g
PiBwYXRocy4KPiA+ID4KPiA+ID4gSWYgbW92aW5nIGJldHdlZW4gVFQvU1lTVEVNIChhbGwgdGhl
IHVzZV90dCBwYXRocyBvbiBhbWRncHUpIHVzZQo+ID4gPiB0aGUgY29yZSBtb3ZlIGZ1bmN0aW9u
Lgo+ID4gPgo+ID4gPiBFdmVudHVhbGx5IHRoZSBjb3JlIHdpbGwgYmUgZmxpcHBlZCBvdmVyIHRv
IGNhbGxpbmcgdGhlIGRyaXZlci4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJs
aWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMTIgKysrKysrKy0tLS0tCj4gPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+ID4gPiBpbmRleCBkYjVmNzYxZjM3
ZWMuLmQzYmQyZmQ0NDhiZSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3R0bS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYwo+ID4gPiBAQCAtNjcxLDE0ICs2NzEsMTYgQEAgc3RhdGljIGludCBhbWRn
cHVfYm9fbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29sIGV2aWN0LAo+ID4g
PiAgICAgICAgICAgICAgIHR0bV9ib19tb3ZlX251bGwoYm8sIG5ld19tZW0pOwo+ID4gPiAgICAg
ICAgICAgICAgIHJldHVybiAwOwo+ID4gPiAgICAgICB9Cj4gPiA+IC0gICAgIGlmICgob2xkX21l
bS0+bWVtX3R5cGUgPT0gVFRNX1BMX1RUICYmCj4gPiA+IC0gICAgICAgICAgbmV3X21lbS0+bWVt
X3R5cGUgPT0gVFRNX1BMX1NZU1RFTSkgfHwKPiA+ID4gLSAgICAgICAgIChvbGRfbWVtLT5tZW1f
dHlwZSA9PSBUVE1fUExfU1lTVEVNICYmCj4gPiA+IC0gICAgICAgICAgbmV3X21lbS0+bWVtX3R5
cGUgPT0gVFRNX1BMX1RUKSkgewo+ID4gPiAtICAgICAgICAgICAgIC8qIGJpbmQgaXMgZW5vdWdo
ICovCj4gPiA+ICsgICAgIGlmIChvbGRfbWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNICYm
Cj4gPiA+ICsgICAgICAgICBuZXdfbWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfVFQpIHsKPiA+ID4g
ICAgICAgICAgICAgICB0dG1fYm9fbW92ZV9udWxsKGJvLCBuZXdfbWVtKTsKPiA+Cj4gPiBJIHdv
dWxkIGZlZWwgYmV0dGVyIGlmIHdlIG51a2UgdHRtX2JvX21vdmVfbnVsbCgpIGFuZCBhbHdheXMg
dXNlCj4gPiB0dG1fYm9fbW92ZV90dG0oKS4KPgo+IEFueSByZWFzb24/IFRoZSBjb2RlIHBhdGgg
aW4gdGhlIGN1cnJlbnQgbW92ZSBjb2RlIHByZXR0eSBtdWNoCj4gaXMgdGhpcy4KPgo+IFRoZSBj
dXJyZW50IG1vdmUgcGF0aHMgYXJlCj4KPiBpZiAobmV3X3R0ICYmIG9sZF90dCkKPiAgIGlmIG9s
ZCBpcyBzeXN0ZW0KPiAgICAgIG1vdmUgbnVsbAo+ICAgZWxzZQo+ICAgICBtb3ZlIHR0bQo+IGVs
c2UKPiAgIGNhbGwgZHJpdmVyIG1vdmUuCj4KPiBTbyBJIHdhbnRlZCB0byBtYWludGFpbiB0aGF0
IG9yZGVyLiBjYWxsaW5nIHRoZSBtb3ZlIHR0bSB3aWxsIGp1c3QKPiBtYWtlIGEgcG9pbnRsZXNz
IGNhY2hpbmcsIHBvcHVsYXRlLCBiaW5kIHN0ZXAuCj4KPiBCdXQgSSdtIGdvaW5nIHRvIHRoaW5r
IGFib3V0IGl0IGEgYml0IG1vcmUuCgpJJ3ZlIGxvb2tlZCBpbnRvIG1vdmluZyB0aGUgY29kZSBv
dmVyIHRvIG1vdmVfdHRtIHRvIHNlZSBpZiBJIGNvdWxkCmNvbWJpbmUgdGhpbmdzIGJldHRlciwg
YnV0IGl0IGRvZXNuJ3QgcmVhbGx5IGZhbGwgb3V0IHRoYXQgbmljZWx5LgoKSSBtaWdodCB0cnkg
YWdhaW4gb24gdG9wIG9mIHRoZSByZWZhY3RvcmluZyBvbmNlIEknbSBnb25lIGZ1cnRoZXIuCgpE
YXZlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
