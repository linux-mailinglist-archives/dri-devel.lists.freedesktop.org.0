Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75D490814
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 21:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE186E321;
	Fri, 16 Aug 2019 19:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476D66E321
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 19:07:36 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id z17so10462077otk.13
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 12:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=clq02sQph7LBUXQcaONgRZ/uSbs2cyoyHTZkgj2xiFo=;
 b=ONfPLglX/v4OTZQsjrhqPRzHENbjuGDo2kpG79DT/bSkqQEMdhSWGx0sNc+lQLz9Kx
 8GkQON9YJOwdbZmEiHW9vpfCDJgUINjVA0ti7fl9CgLnCU8a5wYLDy+kYpdpzIkKC27p
 E891GNjKqtz7b19EQOEMmm2Il8TWbTibsUepbyV0voF8Q75kV0FFLL79sVw4Cl+pai14
 how3FslsRd+BBXQyJcNBRbX0ba2pWgOgqPEYS2HFI7zWKtVpTlgZs1P1cwZ0xGzu0kNG
 jUD877rzJ1gPscvo4S2IjoMC+j1WeneFmrcvy4P26JeI3OfI4JGMqPbrHUTxtWJdAuAP
 4Qqg==
X-Gm-Message-State: APjAAAWyFkshQZz+aJihN8KYTQZqkbYV0ik0/C3TTv7/p+BYE7L7VEkk
 VtsVN69fxiIwcv2lzJnKWzyfglNPPM63Ncv3n8o2Dys40WE=
X-Google-Smtp-Source: APXvYqyg23RL5yL8swQNWMmW8M0Gjbpv37f4ZfsB1cqtQTZP/I7lV2O1WlJluQ0VJAPwVD90pYZl8O/DC/q41zwbNA8=
X-Received: by 2002:a9d:7cc9:: with SMTP id r9mr9218263otn.188.1565982455548; 
 Fri, 16 Aug 2019 12:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190816152152.27550-1-chris@chris-wilson.co.uk>
 <20190816152152.27550-2-chris@chris-wilson.co.uk>
 <77eab42b-2404-0ba4-b323-948c040c3759@amd.com>
In-Reply-To: <77eab42b-2404-0ba4-b323-948c040c3759@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 16 Aug 2019 21:07:24 +0200
Message-ID: <CAKMK7uGWV431+Ru7qTMWk72dHPXe_UJDj-PA02p64PET0XYZEg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dma-fence: Simply wrap dma_fence_signal_locked with
 dma_fence_signal
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=clq02sQph7LBUXQcaONgRZ/uSbs2cyoyHTZkgj2xiFo=;
 b=EJVo+gYNfjE84XHdUmTUb6PhOE2/in3istJ0ZMqivCsfT5DXXhN5hDhP+jAFQzVSt3
 1nmWNRacSPYp3JXjrnJHVKCnQxw0e85zNxUgqvOwSnFakp/T3p/ov/658ibb+fMUZ0Lv
 6Aic666xi5MhaI1YAkS6VocbYvfVZb1OlmKwA=
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgOTowMiBQTSBLb2VuaWcsIENocmlzdGlhbgo8Q2hyaXN0
aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDE2LjA4LjE5IHVtIDE3OjIxIHNjaHJp
ZWIgQ2hyaXMgV2lsc29uOgo+ID4gQ3VycmVudGx5IGRtYV9mZW5jZV9zaWduYWwoKSB0cmllcyB0
byBhdm9pZCB0aGUgc3BpbmxvY2sgYW5kIG9ubHkgdGFrZXMKPiA+IGl0IGlmIGFic29sdXRlbHkg
cmVxdWlyZWQgdG8gd2FsayB0aGUgY2FsbGJhY2sgbGlzdC4gSG93ZXZlciwgdG8gYWxsb3cKPiA+
IGZvciBzb21lIHVzZXJzIHRvIHN1cnJlcHRpdGlvdXNseSBpbnNlcnQgbGF6eSBzaWduYWwgY2Fs
bGJhY2tzIHRoYXQKPiA+IGRvIG5vdCBkZXBlbmQgb24gZW5hYmxpbmcgdGhlIHNpZ25hbGluZyBt
ZWNoYW5pc20gYXJvdW5kIGV2ZXJ5IGZlbmNlLAo+ID4gd2UgYWx3YXlzIG5lZWQgdG8gbm90aWZ5
IHRoZSBjYWxsYmFja3Mgb24gc2lnbmFsaW5nLiBBcyBzdWNoLCB3ZSB3aWxsCj4gPiBhbHdheXMg
bmVlZCB0byB0YWtlIHRoZSBzcGlubG9jayBhbmQgZG1hX2ZlbmNlX3NpZ25hbCgpIGVmZmVjdGl2
ZWx5Cj4gPiBiZWNvbWVzIGEgY2xvbmUgb2YgZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQoKS4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51
az4KPiA+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4g
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiA+IC0tLQo+ID4g
ICBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgfCAxOSArKysrKy0tLS0tLS0tLS0tLS0tCj4g
PiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgYi9kcml2ZXJzL2Rt
YS1idWYvZG1hLWZlbmNlLmMKPiA+IGluZGV4IGZmMGNkNmVhZTc2Ni4uZjIzZWI5ZjE5YjRlIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jCj4gPiArKysgYi9kcml2
ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKPiA+IEBAIC0xNzYsNiArMTc2LDcgQEAgRVhQT1JUX1NZ
TUJPTChkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZCk7Cj4gPiAgIGludCBkbWFfZmVuY2Vfc2lnbmFs
KHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKQo+ID4gICB7Cj4gPiAgICAgICB1bnNpZ25lZCBsb25n
IGZsYWdzOwo+ID4gKyAgICAgaW50IHJldDsKPiA+Cj4gPiAgICAgICBpZiAoIWZlbmNlKQo+ID4g
ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+IEBAIC0xODMsMjEgKzE4NCwxMSBAQCBp
bnQgZG1hX2ZlbmNlX3NpZ25hbChzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkKPiA+ICAgICAgIGlm
ICh0ZXN0X2FuZF9zZXRfYml0KERNQV9GRU5DRV9GTEFHX1NJR05BTEVEX0JJVCwgJmZlbmNlLT5m
bGFncykpCj4gPiAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Cj4gSSBuZWVkIHRvIHRh
a2UgbXkgcmV2aWV3IGJhY2suIFlvdSBhbHNvIG5lZWQgdG8gZHJvcCB0aGlzCj4gdGVzdF9hbmRf
c2V0X2JpdCBoZXJlIG9yIHlvdXIgY29tcGxldGVseSBicmVhayBkcml2ZXJzIHVzaW5nIHRoaXMu
CgpUaW1lIGZvciBhIHBpbGUgb2YgZG1hX2ZlbmNlIHNlbGZ0ZXN0cz8gTWF5YmUgd2l0aCBhIGJp
dCBvZiBkbWFfcmVzdgp0aHJvd24gaW4gZm9yIGdvb2Q/IFRoaXMgc3R1ZmYgaXMgdHJpY2t5LCBh
bmQgaXQgZmVlbHMgbGlrZSB3ZSBoYWQgYQpmZXcgb29wc2llcyBpbiByZXZpZXcgcmVjZW50bHkg
Li4uCi1EYW5pZWwKCj4gUmVnYXJkcywKPiBDaHJpc3RpYW4uCj4KPiA+Cj4gPiAtICAgICBmZW5j
ZS0+dGltZXN0YW1wID0ga3RpbWVfZ2V0KCk7Cj4gPiAtICAgICBzZXRfYml0KERNQV9GRU5DRV9G
TEFHX1RJTUVTVEFNUF9CSVQsICZmZW5jZS0+ZmxhZ3MpOwo+ID4gLSAgICAgdHJhY2VfZG1hX2Zl
bmNlX3NpZ25hbGVkKGZlbmNlKTsKPiA+IC0KPiA+IC0gICAgIGlmICh0ZXN0X2JpdChETUFfRkVO
Q0VfRkxBR19FTkFCTEVfU0lHTkFMX0JJVCwgJmZlbmNlLT5mbGFncykpIHsKPiA+IC0gICAgICAg
ICAgICAgc3RydWN0IGRtYV9mZW5jZV9jYiAqY3VyLCAqdG1wOwo+ID4gKyAgICAgc3Bpbl9sb2Nr
X2lycXNhdmUoZmVuY2UtPmxvY2ssIGZsYWdzKTsKPiA+ICsgICAgIHJldCA9IGRtYV9mZW5jZV9z
aWduYWxfbG9ja2VkKGZlbmNlKTsKPiA+ICsgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoZmVu
Y2UtPmxvY2ssIGZsYWdzKTsKPiA+Cj4gPiAtICAgICAgICAgICAgIHNwaW5fbG9ja19pcnFzYXZl
KGZlbmNlLT5sb2NrLCBmbGFncyk7Cj4gPiAtICAgICAgICAgICAgIGxpc3RfZm9yX2VhY2hfZW50
cnlfc2FmZShjdXIsIHRtcCwgJmZlbmNlLT5jYl9saXN0LCBub2RlKSB7Cj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgbGlzdF9kZWxfaW5pdCgmY3VyLT5ub2RlKTsKPiA+IC0gICAgICAgICAgICAg
ICAgICAgICBjdXItPmZ1bmMoZmVuY2UsIGN1cik7Cj4gPiAtICAgICAgICAgICAgIH0KPiA+IC0g
ICAgICAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZShmZW5jZS0+bG9jaywgZmxhZ3MpOwo+
ID4gLSAgICAgfQo+ID4gLSAgICAgcmV0dXJuIDA7Cj4gPiArICAgICByZXR1cm4gcmV0Owo+ID4g
ICB9Cj4gPiAgIEVYUE9SVF9TWU1CT0woZG1hX2ZlbmNlX3NpZ25hbCk7Cj4gPgo+CgoKLS0gCkRh
bmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkg
NzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
