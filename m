Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C82417F1F4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 11:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6476ED93;
	Fri,  2 Aug 2019 09:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9276ED93
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 09:43:51 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id g7so56358154oia.8
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 02:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A+FPU/vGw66DQH6ItIezOEVqjuBIxZcPX9USWgAb1jM=;
 b=LGR+JsxJ+wiYKbwKsL5qbla0M4Z6t7m6OXklD6t979cL8wfPgEfNjJ6YmwlFdQdpHI
 noomr7Tdz0zUQELlMGZcgQcKDyd7h9c0wikuA8T2+EnbIX0x4rL19JANoTPKg/XfnHAT
 WBgT1co40+Hjj5sxdxshOD1ujx8gjDuaX8BqZiirg62/P6aJ02f89lWlP0Jmj54LGZKI
 XVySotoXAQCaYfRzm3pUAN4tBu03r8I4vWj3GVt+NrOuEr32wEfNdaoGDJqp7fxK7U0W
 BYffRUKiUqnIlm/8HYOo+nxEVaYsK9WMMB6uvjPH7e9GCNEO8nizbhh8dh2zViDZX0vN
 OLKA==
X-Gm-Message-State: APjAAAVRAh3+AUFQWyO9j2BBnoV2gNjrpGt1kJijipz0wBL2wOcCsw3h
 RpKXeljnvIqC/4ctF2KfGifNfi/niFIGmVQRtz1oag==
X-Google-Smtp-Source: APXvYqwrE1bn5ct0WaJ9P1S7sbbbgAxT5gZWv30BGTYJ1sG1vdgqFLWcTAJ+BcSNC7gWOTWkKRRExPmjXgf4HAnSNP0=
X-Received: by 2002:aca:b104:: with SMTP id a4mr2199449oif.14.1564739031061;
 Fri, 02 Aug 2019 02:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
 <20190731132002.dut5mdsqgh7b75iv@DESKTOP-E1NTVVP.localdomain>
 <20190802092920.4la5cwrltv2m6dke@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20190802092920.4la5cwrltv2m6dke@DESKTOP-E1NTVVP.localdomain>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 2 Aug 2019 11:43:39 +0200
Message-ID: <CAKMK7uEZaFEcs90+U3vzgH69+95BD58Dt=J=gT6=n6oah5Nbyg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
To: Brian Starkey <Brian.Starkey@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=A+FPU/vGw66DQH6ItIezOEVqjuBIxZcPX9USWgAb1jM=;
 b=SUOcFbPy5rxss1N6dYEveiIIOMKAwymDOUtmfTGkpGgQ/Xpr3UWjMsAcCCDkBnqdup
 1eq2a1R6v6DN0QkaPATZN5n0kE4ue5wnZyoBJTKNOqWawLO3d/A97+DsCdyNlpGcjyQZ
 XE6laiEawO4BJz5p9iAOjzFnHPln42mGtcH2k=
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMiwgMjAxOSBhdCAxMToyOSBBTSBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFy
a2V5QGFybS5jb20+IHdyb3RlOgo+Cj4gSGkgTG93cnksCj4KPiBPbiBUaHUsIEF1ZyAwMSwgMjAx
OSBhdCAwNjozNDowOEFNICswMDAwLCBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdy
b3RlOgo+ID4gSGkgQnJpYW4sCj4gPgo+ID4gT24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDk6MjA6
MDRQTSArMDgwMCwgQnJpYW4gU3RhcmtleSB3cm90ZToKPiA+ID4gSGkgTG93cnksCj4gPiA+Cj4g
PiA+IFRoYW5rcyBmb3IgdGhpcyBjbGVhbnVwLgo+ID4gPgo+ID4gPiBPbiBXZWQsIEp1bCAzMSwg
MjAxOSBhdCAxMTowNDo0NUFNICswMDAwLCBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEp
IHdyb3RlOgo+ID4gPiA+IER1cmluZyBpdCBzaWduYWxzIHRoZSBjb21wbGV0aW9uIG9mIGEgd3Jp
dGViYWNrIGpvYiwgYWZ0ZXIgcmVsZWFzaW5nCj4gPiA+ID4gdGhlIG91dF9mZW5jZSwgd2UnZCBj
bGVhciB0aGUgcG9pbnRlci4KPiA+ID4gPgo+ID4gPiA+IENoZWNrIGlmIGZlbmNlIGxlZnQgb3Zl
ciBpbiBkcm1fd3JpdGViYWNrX2NsZWFudXBfam9iKCksIHJlbGVhc2UgaXQuCj4gPiA+ID4KPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dy
eS5saUBhcm0uY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3dy
aXRlYmFjay5jIHwgMjMgKysrKysrKysrKysrKysrLS0tLS0tLS0KPiA+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPiA+ID4KPiA+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV93cml0ZWJhY2suYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fd3JpdGViYWNrLmMKPiA+ID4gPiBpbmRleCBmZjEzOGI2Li40M2Q5ZTNiIDEwMDY0
NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMKPiA+ID4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3dyaXRlYmFjay5jCj4gPiA+ID4gQEAgLTMyNCw2ICsz
MjQsOSBAQCB2b2lkIGRybV93cml0ZWJhY2tfY2xlYW51cF9qb2Ioc3RydWN0IGRybV93cml0ZWJh
Y2tfam9iICpqb2IpCj4gPiA+ID4gICBpZiAoam9iLT5mYikKPiA+ID4gPiAgICAgICAgICAgZHJt
X2ZyYW1lYnVmZmVyX3B1dChqb2ItPmZiKTsKPiA+ID4gPgo+ID4gPiA+ICsgaWYgKGpvYi0+b3V0
X2ZlbmNlKQo+ID4gPgo+ID4gPiBJJ20gdGhpbmtpbmcgaXQgbWlnaHQgYmUgYSBnb29kIGlkZWEg
dG8gc2lnbmFsIHRoZSBmZW5jZSB3aXRoIGFuIGVycm9yCj4gPiA+IGhlcmUsIGlmIGl0J3Mgbm90
IGFscmVhZHkgc2lnbmFsZWQuIE90aGVyd2lzZSwgaWYgdGhlcmUncyBzb21lb25lCj4gPiA+IHdh
aXRpbmcgKHdoaWNoIHRoZXJlIHNob3VsZG4ndCBiZSksIHRoZXkncmUgZ29pbmcgdG8gYmUgd2Fp
dGluZyBhIHZlcnkKPiA+ID4gbG9uZyB0aW1lIDotKQo+ID4gPgo+ID4gPiBUaGFua3MsCj4gPiA+
IC1Ccmlhbgo+ID4gPgo+ID4gSGVyZSBpdCBoYXBwZW5lZCBhdCBhdG9taWNfY2hlY2sgZmFpbGVk
IGFuZCB0ZXN0IG9ubHkgY29tbWl0LiBGb3IgYm90aAo+ID4gY2FzZXMsIHRoZSBjb21taXQgaGFz
IGJlZW4gZHJvcHBlZCBhbmQgaXQncyBvbmx5IGEgY2xlYW4gdXAuIFNvIGhlcmUgYmV0dGVyCj4g
PiBub3QgYmUgdHJlYXRlZCBhcyBhbiBlcnJvciBjYXNlOikKPgo+IElmIGFueW9uZSBlbHNlIGhh
cyBhIHJlZmVyZW5jZSBvbiB0aGUgZmVuY2UsIHRoZW4gSU1PIGl0IGFic29sdXRlbHkgaXMKPiBh
biBlcnJvciB0byByZWFjaCB0aGlzIHBvaW50IHdpdGhvdXQgdGhlIGZlbmNlIGJlaW5nIHNpZ25h
bGVkIC0KPiBiZWNhdXNlIGl0IG1lYW5zIHRoYXQgdGhlIGZlbmNlIHdpbGwgbmV2ZXIgYmUgc2ln
bmFsZWQuCj4KPiBJIGRvbid0IHRoaW5rIHRoZSBBUEkgZ2l2ZXMgeW91IGEgd2F5IHRvIGNoZWNr
IGlmIHRoaXMgaXMgdGhlIGxhc3QKPiByZWZlcmVuY2UsIHNvIGl0J3Mgc2FmZXN0IHRvIGp1c3Qg
bWFrZSBzdXJlIHRoZSBmZW5jZSBpcyBzaWduYWxsZWQKPiBiZWZvcmUgZHJvcHBpbmcgdGhlIHJl
ZmVyZW5jZS4KPgo+IEl0IGp1c3QgZmVlbHMgd3JvbmcgdG8gbWUgdG8gaGF2ZSB0aGUgcG9zc2li
aWxpdHkgb2YgYSBkYW5nbGluZyBmZW5jZQo+IHdoaWNoIGlzIG5ldmVyIGdvaW5nIHRvIGdldCBz
aWduYWxsZWQ7IGFuZCBpdCdzIGFuIGVhc3kgZGVmZW5zaXZlIHN0ZXAKPiB0byBtYWtlIHN1cmUg
aXQgY2FuIG5ldmVyIGhhcHBlbi4KPgo+IEkga25vdyBpdCBfc2hvdWxkbid0XyBoYXBwZW4sIGJ1
dCB3ZSBvZnRlbiBwdXQgaW4gaGFuZGxpbmcgZm9yIGNhc2VzCj4gd2hpY2ggc2hvdWxkbid0IGhh
cHBlbiwgYmVjYXVzZSB0aGV5IGZyZXF1ZW50bHkgZG8gaGFwcGVuIDotKQoKV2UncmUgbm90IGFz
IHBhcmFub2lkIHdpdGggdGhlIHZibGFuayBmZW5jZXMgZWl0aGVyLCBzbyBub3Qgc3VyZSB3aHkK
d2UgbmVlZCB0byBiZSB0aGlzIHBhcmFub2lkIHdpdGggd3JpdGViYWNrIGZlbmNlcy4gSWYgeW91
ciBkcml2ZXIKZ3JhYnMgYW55dGhpbmcgZnJvbSB0aGUgYXRvbWljIHN0YXRlIGluIC0+YXRvbWlj
X2NoZWNrIGl0J3MgYnVnZ3kKYW55d2F5LgoKSWYgeW91IHdhbnQgdG8gZml4IHRoaXMgcHJvcGVy
bHkgSSB0aGluayB3ZSBuZWVkIHRvIG1vdmUgdGhlIGNhbGwgdG8KcHJlcGFyZV9zaWduYWxsaW5n
KCkgaW4gYmV0d2VlbiBhdG9taWNfY2hlY2sgYW5kIGF0b21pY19jb21taXQuIFRoZW4gSQp0aGlu
ayBpdCBtYWtlcyBzZW5zZSB0byBhbHNvIGZvcmNlLWNvbXBsZXRlIHRoZSBmZW5jZSBvbiBlcnJv
ciAuLi4KLURhbmllbAoKPiA+IFNpbmNlIGZvciB1c2Vyc3BhY2UsIGl0IHNob3VsZCBoYXZlIGJl
ZW4gZmFpbGVkIG9yIGEgdGVzdCBvbmx5IGNhc2UsIHNvCj4gPiB3cml0ZWJhY2UgZmVuY2Ugc2hv
dWxkIG5vdCBiZSBzaWduYWxlZC4KPgo+IEl0J3Mgbm90IG9ubHkgdXNlcnNwYWNlIHRoYXQgY2Fu
IHdhaXQgb24gZmVuY2VzIChhbmQgaW4gZmFjdCB0aGlzCj4gZmVuY2Ugd2lsbCBuZXZlciBldmVu
IHJlYWNoIHVzZXJzcGFjZSBpZiB0aGUgY29tbWl0IGZhaWxzKSwgdGhlIGRyaXZlcgo+IG1heSBo
YXZlIHRha2VuIGEgY29weSB0byB1c2UgZm9yICJzb21ldGhpbmciLgo+Cj4gQ2hlZXJzLAo+IC1C
cmlhbgo+Cj4gPgo+ID4gQmVzdCByZWdhcmRzLAo+ID4gTG93cnkKPiA+ID4gPiArICAgICAgICAg
ZG1hX2ZlbmNlX3B1dChqb2ItPm91dF9mZW5jZSk7Cj4gPiA+ID4gKwo+ID4gPiA+ICAga2ZyZWUo
am9iKTsKPiA+ID4gPiAgfQo+ID4KPiA+IC0tCj4gPiBSZWdhcmRzLAo+ID4gTG93cnkKCgoKLS0g
CkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAo
MCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
