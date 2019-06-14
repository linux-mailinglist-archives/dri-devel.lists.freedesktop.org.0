Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E1945613
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AB1898D9;
	Fri, 14 Jun 2019 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9340892EA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 00:36:45 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id v129so656382vsb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 17:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kvz44rB7tgJ0lFfHfKXCBCgyFSEqMN4h+J2Mv3vvphI=;
 b=pjdpvRRpt6SRNJ+Cz9Cn1077KSvYzNqxHy8HrFli0IXacYVnbMKRsrWxtYsgvtIL9e
 pLIPBvl4xYIIhY8rwijBN7umA2dXGZ/IzZaaeDXe9b/yiVwTz/efZhoJXGyo1rI3XZ6P
 pqbWYyS/K+/1RK8ni5o/SnOEYURASga531d7A06QxppTfcYQhaTu5cKZT/+Z1f7wvDHg
 WITw0CsvrgF7Jrx/nusspbTOOufnKiZTYPIqd891BUVAj8SwyhI7CLIjvjCc7Zh+XyWd
 IHDT79HNA4sAAaKVYojaBV0l1MGmU11ZkLs4h7qXaYpna8jCNwOIO9qOtRNruvUeeoWQ
 L2DQ==
X-Gm-Message-State: APjAAAWnNGwAWJuc30oeQNwFLcPifeShC9ZRvg3JOArSayGCZ7l6PKSi
 CR5eXJ8749xeIcafOo58JLaEWyjs8zlI9RwvvAqNzA==
X-Google-Smtp-Source: APXvYqwTL6POXul88bkWpISrGlVLaKAoVDJaFXMv89Ef1GdZT2k2cGQZJDTzBLr/6j7plsyb3Poj9HWMfiJa4fFKTHk=
X-Received: by 2002:a67:ea42:: with SMTP id r2mr40062385vso.207.1560472604694; 
 Thu, 13 Jun 2019 17:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190611040350.90064-1-dbasehore@chromium.org>
 <20190611040350.90064-5-dbasehore@chromium.org> <87zhmoy270.fsf@intel.com>
 <01636500-0be5-acf8-5f93-a57383bf4b20@redhat.com>
 <CAGAzgsoxpsft-vmVOuKSAbLJqR-EZvcceLpMeWkz6ikJEKGJHg@mail.gmail.com>
 <fe774952-6fd5-b4ec-56c9-32fd30546313@redhat.com>
In-Reply-To: <fe774952-6fd5-b4ec-56c9-32fd30546313@redhat.com>
From: "dbasehore ." <dbasehore@chromium.org>
Date: Thu, 13 Jun 2019 17:36:33 -0700
Message-ID: <CAGAzgsrYAaHTuxpt2rQAVbCtx_fCZAd99hX19H4V4h6ZyHwbkw@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/connector: Split out orientation quirk detection
To: Hans de Goede <hdegoede@redhat.com>
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Kvz44rB7tgJ0lFfHfKXCBCgyFSEqMN4h+J2Mv3vvphI=;
 b=YRTBrlE2LA8uxN3PfDev4WOSZ4TCRgathqM3/1KwUpGO755YbZ7mnN+QeS3kbrUx+m
 Z4HBVjV4H2pV1hTuQOtYcKJkpVd8+sXJdy4ASJAr8xzPotDqIxxySu2jgYytgEpTQ0vq
 Bl7zFudutTrWJYi7GuLOXu6X27Uc6/ypFvM9Q=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgNTozMyBBTSBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMTItMDYtMTkgMDI6MTYsIGRiYXNlaG9y
ZSAuIHdyb3RlOgo+ID4gT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTo1NCBBTSBIYW5zIGRlIEdv
ZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPiB3cm90ZToKPiA+Pgo+ID4+IEhpLAo+ID4+Cj4gPj4g
T24gMTEtMDYtMTkgMTA6MDgsIEphbmkgTmlrdWxhIHdyb3RlOgo+ID4+PiBPbiBNb24sIDEwIEp1
biAyMDE5LCBEZXJlayBCYXNlaG9yZSA8ZGJhc2Vob3JlQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4g
Pj4+PiBUaGlzIHJlbW92ZXMgdGhlIG9yaWVudGF0aW9uIHF1aXJrIGRldGVjdGlvbiBmcm9tIHRo
ZSBjb2RlIHRvIGFkZAo+ID4+Pj4gYW4gb3JpZW50YXRpb24gcHJvcGVydHkgdG8gYSBwYW5lbC4g
VGhpcyBpcyB1c2VkIG9ubHkgZm9yIGxlZ2FjeSB4ODYKPiA+Pj4+IHN5c3RlbXMsIHlldCB3ZSdk
IGxpa2UgdG8gc3RhcnQgdXNpbmcgdGhpcyBvbiBkZXZpY2V0cmVlIHN5c3RlbXMgd2hlcmUKPiA+
Pj4+IHF1aXJrIGRldGVjdGlvbiBsaWtlIHRoaXMgaXMgbm90IG5lZWRlZC4KPiA+Pj4KPiA+Pj4g
Tm90IG5lZWRlZCwgYnV0IG5vIGhhcm0gZG9uZSBlaXRoZXIsIHJpZ2h0Pwo+ID4+Pgo+ID4+PiBJ
IGd1ZXNzIEknbGwgZGVmZXIganVkZ2VtZW50IG9uIHRoaXMgdG8gSGFucyBhbmQgVmlsbGUgKENj
J2QpLgo+ID4+Cj4gPj4gSG1tLCBJJ20gbm90IGJpZyBmYW4gb2YgdGhpcyBjaGFuZ2UuIEl0IGFk
ZHMgY29kZSBkdXBsaWNhdGlvbiBhbmQgYXMKPiA+PiBvdGhlciBtb2RlbHMgd2l0aCB0aGUgc2Ft
ZSBpc3N1ZSB1c2luZyBhIGRpZmZlcmVudCBkcml2ZXIgb3IgcGFuZWwtdHlwZQo+ID4+IHNob3cg
dXAgd2Ugd2lsbCBnZXQgbW9yZSBjb2RlIGR1cGxpY2F0aW9uLgo+ID4+Cj4gPj4gQWxzbyBJJ20g
bm90IGNvbnZpbmNlZCB0aGF0IGRldmljZXRyZWUgYmFzZWQgcGxhdGZvcm1zIHdpbGwgbm90IG5l
ZWQKPiA+PiB0aGlzLiBUaGUgd2hvbGUgZGV2aWNldHJlZSBhcyBhbiBBQkkgdGhpbmcsIHdoaWNo
IG1lYW5zIHRoYXQgYWxsCj4gPj4gZGV2aWNldHJlZSBiaW5kaW5ncyBuZWVkIHRvIGJlIHNldCBp
biBzdG9uZSBiZWZvcmUgdGhpbmdzIGFyZSBtZXJnZWQKPiA+PiBpbnRvIHRoZSBtYWlubGluZSwg
aXMgZG9uZSBzb2xlbHkgc28gdGhhdCB3ZSBjYW4gZ2V0IHZlbmRvcnMgdG8gc2hpcAo+ID4+IGhh
cmR3YXJlIHdpdGggdGhlIGR0YiBmaWxlcyBpbmNsdWRlZCBpbiB0aGUgZmlybXdhcmUuCj4gPgo+
ID4gV2UndmUgcG9zdGVkIGZpeGVzIHRvIHRoZSBkZXZpY2V0cmVlIHdlbGwgYWZ0ZXIgdGhlIGlu
aXRpYWwgbWVyZ2UgaW50bwo+ID4gbWFpbmxpbmUgYmVmb3JlLCBzbyBJIGRvbid0IHNlZSB3aGF0
IHlvdSBtZWFuIGFib3V0IHRoZSBiaW5kaW5ncyBiZWluZwo+ID4gc2V0IGluIHN0b25lLgo+Cj4g
VGhhdCB3YXMganVzdCBtZSByZXBlYXRpbmcgdGhlIG9mZmljaWFsIHBhcnR5IGxpbmUgYWJvdXQg
ZGV2aWNldHJlZS4KPgo+ID4gSSBhbHNvIGRvbid0IHJlYWxseSBzZWUgdGhlIHBvaW50LiBUaGUg
ZGV2aWNldHJlZSBpcyBpbgo+ID4gdGhlIGtlcm5lbC4gSWYgdGhlcmUncyBzb21lIHNldHRpbmcg
aW4gdGhlIGRldmljZXRyZWUgdGhhdCB3ZSB3YW50IHRvCj4gPiBjaGFuZ2UsIGl0J3MgZWZmZWN0
aXZlbHkgdGhlIHNhbWUgdG8gbWFrZSB0aGUgY2hhbmdlIGluIHRoZSBkZXZpY2V0cmVlCj4gPiB2
ZXJzdXMgc29tZSBxdWlyayBzZXR0aW5nLiBUaGUgb25seSBkaWZmZXJlbmNlIHNlZW1zIHRvIGJl
IHRoYXQgbWFraW5nCj4gPiB0aGUgY2hhbmdlIGluIHRoZSBkZXZpY2V0cmVlIGlzIGNsZWFuZXIu
Cj4KPiBJIGFncmVlIHdpdGggeW91IHRoYXQgZGV2aWNldHJlZSBpbiBwcmFjdGljZSBpcyBlYXN5
IHRvIHVwZGF0ZSBhZnRlcgo+IHNoaXBwaW5nLiBCdXQgYXQgbGVhc3Qgd2hlbmV2ZXIgSSB0cmll
ZCB0byBnZXQgbmV3IGJpbmRpbmdzIHJldmlld2VkCj4gSSB3YXMgYWx3YXlzIHRvbGQgdGhhdCBJ
IHdhcyBub3QgYWxsb3dlZCB0byBjb3VudCBvbiB0aGF0Lgo+Cj4gPj4gSSdtIDEwMCUgc3VyZSB0
aGF0IHRoZXJlIGlzIGUuZy4gQVJNIGhhcmR3YXJlIG91dCB0aGVyZSB3aGljaCB1c2VzCj4gPj4g
bm9uIHVwcmlnaHQgbW91bnRlZCBMQ0QgcGFuZWxzIChJIHVzZWQgdG8gaGF2ZSBhIGZldyBBbGx3
aW5uZXIKPiA+PiB0YWJsZXRzIHdoaWNoIGRpZCB0aGlzKS4gQW5kIGdpdmVuIG15IGV4cGVyaWVu
Y2Ugd2l0aCB0aGUgcXVhbGl0eQo+ID4+IG9mIGZpcm13YXJlIGJ1bmRsZWQgdGFibGVzIGxpa2Ug
QUNQSSB0YWJsZXMgSSdtIHF1aXRlIHN1cmUgdGhhdAo+ID4+IGlmIHdlIGV2ZXIgbW92ZSB0byBm
aXJtd2FyZSBpbmNsdWRlZCBkdGIgZmlsZXMgdGhhdCB3ZSB3aWxsIG5lZWQKPiA+PiBxdWlya3Mg
Zm9yIHRob3NlIHRvby4KPiA+Cj4gPiBJcyB0aGVyZSBhIHRpbWVsaW5lIHRvIHN0YXJ0IHVzaW5n
IGZpcm13YXJlIGJ1bmRsZWQgdGFibGVzPwo+Cj4gTm9wZSwgYXMgSSBzYWlkICJpZiB3ZSBldmVy
IG1vdmUgdG8gLi4uIi4KPgo+ID4gU2luY2UgdGhlCj4gPiBxdWlyayBjb2RlIG9ubHkgdXNlcyBE
TUksIGl0IHdpbGwgbmVlZCB0byBiZSBjaGFuZ2VkIGFueXdheXMgZm9yCj4gPiBmaXJtd2FyZSBi
dW5kbGVkIGRldmljZXRyZWUgZmlsZXMgYW55d2F5cy4KPiA+Cj4gPiBXZSBjb3VsZCBjb25zb2xp
ZGF0ZSB0aGUgZHVwbGljYXRlZCBjb2RlIGludG8gYW5vdGhlciBmdW5jdGlvbiB0aGF0Cj4gPiBj
YWxscyBkcm1fZ2V0X3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcyB0b28uIFRoZSBvbmx5IHJlYXNv
biBpdCdzIGxpa2UKPiA+IGl0IGlzIGlzIGJlY2F1c2UgSSBpbml0aWFsbHkgb25seSBoYWQgdGhl
IGNhbGwgdG8KPiA+IGRybV9nZXRfcGFuZWxfb3JpZW50YXRpb25fcXVpcmsgb25jZSBpbiB0aGUg
Y29kZS4KPgo+IFllcyBpZiB5b3UgY2FuIGFkZCBhIG5ldyBoZWxwZXIgZm9yIHRoZSBjdXJyZW50
IGNhbGxlcnMsIHRoZW4KPiBJJ20gZmluZSB3aXRoIGRyb3BwaW5nIHRoZSBxdWlyayBoYW5kbGlu
ZyBmcm9tCj4gZHJtX2Nvbm5lY3Rvcl9pbml0X3BhbmVsX29yaWVudGF0aW9uX3Byb3BlcnR5KCkK
PgoKT2ssIGl0IHNvdW5kcyBsaWtlIGhhdmluZyBhIHNwZWNpYWwgY2FsbGJhY2sgZm9yIHF1aXJr
cyBpbiB0aGUgcGFuZWwKb3JpZW50YXRpb24gcHJvcGVydHkgaXMgdGhlIGJlc3Qgd2F5IHRvIGdv
LiBUaGUgaGFuZGxlcyB0aGUgZHVwbGljYXRlCmNvZGUgYW5kIGRldmljZXRyZWUgYnVuZGxlcy4g
SWYgd2UgbmVlZCB0byBmaXggc29tZXRoaW5nIHRoYXQncwpzcGVjaWZpZWQgaW4gYSBkZXZpY2V0
cmVlLCBhbmQgd2UgYXJlbid0IHdpbGxpbmcgdG8gY2hhbmdlIGl0LCB3ZSBjYW4Kd3JpdGUgdGhl
IHF1aXJrIGNvZGUgZm9yIHRoYXQgbGF0ZXIuCgo+IFJlZ2FyZHMsCj4KPiBIYW5zCgpUaGFua3Mg
Zm9yIHRoZSBmZWVkYmFjawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
