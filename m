Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A90C8D93B1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 16:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48F26E98A;
	Wed, 16 Oct 2019 14:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F174B6E98D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 14:23:53 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id w6so20127240oie.11
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 07:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d8aADCgxmyZ8oHqypZxzKpNLEg+1j6m6hSEfD2bZZ6E=;
 b=Pb3AVaYlZnL0O3LvNWkZ/2EK0dLpfBHsC81oJW7lUbyf4Tf0xOBS2ckHfrkP9NPsrl
 avka/sB7dGI6XPKJfEUizL5AqDbNmXXnpfb35TOoG/Dz+bWSQSrtgCyosESHEWbo5dtf
 r7cZVAxbSdg8LltESyvhslxMpLe8sQipQ53Jpo4gyCij61AsuyDOdheqANY+ocJXekf0
 eDBHTNC+UWEI9T7hW2I+n+m+y0m/TBFtOUW2WhE0Py4x0Z/kEcY/q5eAvUt4WFsAYSiV
 iFOurPscczmL+ThtG6AR6tarhxkTnWIVbsWNSi+T+9DvOq1XjuYAzmf+Yh/KvOItaZpt
 r1iQ==
X-Gm-Message-State: APjAAAW8UToBDchNoKUMNJHnYPKtT3n1DXFlL3akRAHCc3Vv7KH3mZi6
 hGw5AWA2lVI8eskl+74kaTBl8gnYEE7673oODLms2w==
X-Google-Smtp-Source: APXvYqzuLOt/wM8T1nwBtZb4ftBB93wZ6RkfWTlrEa+aK9+l2ofte9m+yhSuuxpR8A539bjHtNN2/TZQcs64htoR5Ew=
X-Received: by 2002:aca:1719:: with SMTP id j25mr3568718oii.132.1571235833084; 
 Wed, 16 Oct 2019 07:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <88f748d2-43de-ae2a-b895-40d8b3be5c78@gmail.com>
 <20190917123150.GM3958@phenom.ffwll.local>
 <da55aa8d-f2b8-0428-ed22-23dc17f71d77@amd.com>
 <20190917131320.GU3958@phenom.ffwll.local>
 <e0e50037-df08-86e3-e8b2-768683e5cce0@amd.com>
 <20190917134524.GY3958@phenom.ffwll.local>
 <7de46ca8-8cb5-d545-42ad-6a7cb4cf753a@amd.com>
 <CAKMK7uFc6CKyF-dW6FE7Hzdz5La7N265DZu_PR7=rKXFjg4QBw@mail.gmail.com>
 <97bb8f03-7fa3-6e61-a1ff-0ffcadbc1a39@amd.com>
 <be8abe51-05f5-bd06-2633-0d32828e0e43@amd.com>
 <20191008085543.GF16989@phenom.ffwll.local>
 <511490ca-4370-6e31-8c73-13fbe3f9d893@amd.com>
In-Reply-To: <511490ca-4370-6e31-8c73-13fbe3f9d893@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 16 Oct 2019 16:23:41 +0200
Message-ID: <CAKMK7uF4vp5=Qs3QkQFKs1-ef9nG4XZFBkasbWn4N_7R4OpUbA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dma-buf: change DMA-buf locking convention
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d8aADCgxmyZ8oHqypZxzKpNLEg+1j6m6hSEfD2bZZ6E=;
 b=XbRhAuh2NWFaFuZe2gD5mCTyABY/fNonboBtyT26akymEycPckp21HRXpmlxB/4gZM
 HgNvu2ygFESo2XSroCL0+ewHUa4RFIxjbWVwNC2qrDJu8OyOr8cEHptQCvRkk/SICOOY
 OAPBoP3Q+aQAcsNLvzI0Y/uPWH/mQpt5cHOLk=
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMzo0NiBQTSBLb2VuaWcsIENocmlzdGlhbgo8Q2hyaXN0
aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDA4LjEwLjE5IHVtIDEwOjU1IHNjaHJp
ZWIgRGFuaWVsIFZldHRlcjoKPiA+IE9uIFdlZCwgT2N0IDAyLCAyMDE5IGF0IDA4OjM3OjUwQU0g
KzAwMDAsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOgo+ID4+IEhpIERhbmllbCwKPiA+Pgo+ID4+
IG9uY2UgbW9yZSBhIHBpbmcgb24gdGhpcy4gQW55IG1vcmUgY29tbWVudHMgb3IgY2FuIHdlIGdl
dCBpdCBjb21pdHRlZD8KPiA+IFNvcnJ5IGdvdCBhIGJpdCBzbWFzaGVkIHBhc3Qgd2Vla3MsIGJ1
dCBzaG91bGQgYmUgcmVzdXJyZWN0ZWQgbm93IGJhY2sKPiA+IGZyb20geGRjLgo+Cj4gQW5kIGFu
eSBtb3JlIHRob3VnaHRzIG9uIHRoaXM/IEkgbWVhbiB3ZSBhcmUgYmxvY2tlZCBmb3IgbW9udGgg
b24gdGhpcwo+IG5vdyA6KAoKSSByZXBsaWVkIHRvIGJvdGggMSBhbmQgMiBpbiB0aGlzIHNlcmll
cyBvbiA4dGggT2N0LiBZb3UgZXZlbiByZXBsaWVkCnRvIG1lIGluIHRoZSB0aHJlYWQgb24gcGF0
Y2ggMiAuLi4gYnV0IG5vdCBoZXJlIChJIHRvcCBwb3N0ZWQgc2luY2UKdGhpcyBkZXRvdXIgaGVy
ZSBqdXN0IG1lIGJlaW5nIGNvbmZ1c2VkKS4KLURhbmllbAoKPgo+IFRoYW5rcywKPiBDaHJpc3Rp
YW4uCj4KPiA+IC1EYW5pZWwKPiA+PiBUaGFua3MsCj4gPj4gQ2hyaXN0aWFuLgo+ID4+Cj4gPj4g
QW0gMjQuMDkuMTkgdW0gMTE6NTAgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+ID4+PiBBbSAx
Ny4wOS4xOSB1bSAxNjo1NiBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPj4+PiBbU05JUF0KPiA+
Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgKyAgICAvKiBXaGVuIGVpdGhlciB0aGUgaW1wb3J0ZXIgb3Ig
dGhlIGV4cG9ydGVyCj4gPj4+Pj4+Pj4+Pj4+Pj4gY2FuJ3QgaGFuZGxlIGR5bmFtaWMKPiA+Pj4+
Pj4+Pj4+Pj4+PiArICAgICAqIG1hcHBpbmdzIHdlIGNhY2hlIHRoZSBtYXBwaW5nIGhlcmUgdG8g
YXZvaWQgaXNzdWVzCj4gPj4+Pj4+Pj4+Pj4+Pj4gd2l0aCB0aGUKPiA+Pj4+Pj4+Pj4+Pj4+PiAr
ICAgICAqIHJlc2VydmF0aW9uIG9iamVjdCBsb2NrLgo+ID4+Pj4+Pj4+Pj4+Pj4+ICsgICAgICov
Cj4gPj4+Pj4+Pj4+Pj4+Pj4gKyAgICBpZiAoZG1hX2J1Zl9hdHRhY2htZW50X2lzX2R5bmFtaWMo
YXR0YWNoKSAhPQo+ID4+Pj4+Pj4+Pj4+Pj4+ICsgICAgICAgIGRtYV9idWZfaXNfZHluYW1pYyhk
bWFidWYpKSB7Cj4gPj4+Pj4+Pj4+Pj4+Pj4gKyAgICAgICAgc3RydWN0IHNnX3RhYmxlICpzZ3Q7
Cj4gPj4+Pj4+Pj4+Pj4+Pj4gKwo+ID4+Pj4+Pj4+Pj4+Pj4+ICsgICAgICAgIGlmIChkbWFfYnVm
X2lzX2R5bmFtaWMoYXR0YWNoLT5kbWFidWYpKQo+ID4+Pj4+Pj4+Pj4+Pj4+ICsgZG1hX3Jlc3Zf
bG9jayhhdHRhY2gtPmRtYWJ1Zi0+cmVzdiwgTlVMTCk7Cj4gPj4+Pj4+Pj4+Pj4+Pj4gKwo+ID4+
Pj4+Pj4+Pj4+Pj4+ICsgICAgICAgIHNndCA9IGRtYWJ1Zi0+b3BzLT5tYXBfZG1hX2J1ZihhdHRh
Y2gsCj4gPj4+Pj4+Pj4+Pj4+Pj4gRE1BX0JJRElSRUNUSU9OQUwpOwo+ID4+Pj4+Pj4+Pj4+Pj4g
Tm93IHdlJ3JlIGJhY2sgdG8gZW5mb3JjaW5nIERNQV9CSURJLCB3aGljaCB3b3JrcyBuaWNlbHkK
PiA+Pj4+Pj4+Pj4+Pj4+IGFyb3VuZCB0aGUKPiA+Pj4+Pj4+Pj4+Pj4+IGxvY2tpbmcgcGFpbiwg
YnV0IGFwcGFyZW50bHkgdXBzZXRzIHRoZSBhcm0tc29jIGZvbGtzIHdobwo+ID4+Pj4+Pj4+Pj4+
Pj4gd2FudCB0bwo+ID4+Pj4+Pj4+Pj4+Pj4gY29udHJvbAo+ID4+Pj4+Pj4+Pj4+Pj4gdGhpcyBi
ZXR0ZXIuCj4gPj4+Pj4+Pj4+Pj4+IFRha2UgYW5vdGhlciBsb29rIGF0IGRtYV9idWZfbWFwX2F0
dGFjaG1lbnQoKSwgd2Ugc3RpbGwgdHJ5Cj4gPj4+Pj4+Pj4+Pj4+IHRvIGdldCB0aGUKPiA+Pj4+
Pj4+Pj4+Pj4gY2FjaGluZyB0aGVyZSBmb3IgQVJNLgo+ID4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+
Pj4+PiBXaGF0IHdlIGRvIGhlcmUgaXMgdG8gYmlkaXJlY3Rpb25hbGx5IG1hcCB0aGUgYnVmZmVy
IHRvIGF2b2lkCj4gPj4+Pj4+Pj4+Pj4+IHRoZQo+ID4+Pj4+Pj4+Pj4+PiBsb2NraW5nIGh5ZHJh
IHdoZW4gaW1wb3J0ZXIgYW5kIGV4cG9ydGVyIGRpc2FncmVlIG9uIGxvY2tpbmcuCj4gPj4+Pj4+
Pj4+Pj4+Cj4gPj4+Pj4+Pj4+Pj4+IFNvIHRoZSBBUk0gZm9sa3MgY2FuIGVhc2lseSBhdm9pZCB0
aGF0IGJ5IHN3aXRjaGluZyB0bwo+ID4+Pj4+Pj4+Pj4+PiBkeW5hbWljIGxvY2tpbmcKPiA+Pj4+
Pj4+Pj4+Pj4gZm9yIGJvdGguCj4gPj4+Pj4+Pj4+PiBTbyB5b3Ugc3RpbGwgYnJlYWsgdGhlIGNv
bnRyYWN0IGJldHdlZW4gaW1wb3J0ZXIgYW5kIGV4cG9ydGVyLAo+ID4+Pj4+Pj4+Pj4gZXhjZXB0
IG5vdAo+ID4+Pj4+Pj4+Pj4gZm9yIGFueXRoaW5nIHRoYXQncyBydW4gaW4gaW50ZWwtZ2Z4LWNp
IHNvIGFsbCBpcyBnb29kPwo+ID4+Pj4+Pj4+PiBObywgdGhlIGNvbnRyYWN0IGJldHdlZW4gaW1w
b3J0ZXIgYW5kIGV4cG9ydGVyIHN0YXlzIGV4YWN0bHkgdGhlCj4gPj4+Pj4+Pj4+IHNhbWUgaXQK
PiA+Pj4+Pj4+Pj4gaXMgY3VycmVudGx5IGFzIGxvbmcgYXMgeW91IGRvbid0IHN3aXRjaCB0byBk
eW5hbWljIGRtYS1idWYKPiA+Pj4+Pj4+Pj4gaGFuZGxpbmcuCj4gPj4+Pj4+Pj4+Cj4gPj4+Pj4+
Pj4+IFRoZXJlIGlzIG5vIGZ1bmN0aW9uYWwgY2hhbmdlIGZvciB0aGUgQVJNIGZvbGtzIGhlcmUu
IFRoZSBvbmx5Cj4gPj4+Pj4+Pj4+IGNoYW5nZQo+ID4+Pj4+Pj4+PiB3aGljaCB0YWtlcyBlZmZl
Y3QgaXMgYmV0d2VlbiBpOTE1IGFuZCBhbWRncHUgYW5kIHRoYXQgaXMgcGVyZmVjdGx5Cj4gPj4+
Pj4+Pj4+IGNvdmVyZWQgYnkgaW50ZWwtZ2Z4LWNpLgo+ID4+Pj4+Pj4+IFRoZXJlJ3MgcGVvcGxl
IHdobyB3YW50IHRvIHJ1biBhbWRncHUgb24gQVJNPwo+ID4+Pj4+Pj4gU3VyZSB0aGVyZSBhcmUs
IHdlIGV2ZW4gcmVjZW50bHkgZml4ZWQgc29tZSBidWdzIGZvciB0aGlzLgo+ID4+Pj4+Pj4KPiA+
Pj4+Pj4+IEJ1dCBhcyBmYXIgYXMgSSBrbm93IHRoZXJlIGlzIG5vIG9uZSBjdXJyZW50bHkgd2hp
Y2ggaXMgYWZmZWN0IGJ5Cj4gPj4+Pj4+PiB0aGlzCj4gPj4+Pj4+PiBjaGFuZ2Ugb24gQVJNIHdp
dGggYW1kZ3B1Lgo+ID4+Pj4+PiBCdXQgZG9uJ3QgeW91IGJyZWFrIHRoZW0gd2l0aCB0aGlzIG5v
dz8KPiA+Pj4+PiBObywgd2Ugc2VlIHRoZSBiaWRpcmVjdGlvbmFsIGF0dGFjaG1lbnQgYXMgY29t
cGF0aWJsZSB3aXRoIHRoZSBvdGhlcgo+ID4+Pj4+IG9uZXMuCj4gPj4+Pj4KPiA+Pj4+Pj4gYW1k
Z3B1IHdpbGwgc29vbiBzZXQgdGhlIGR5bmFtaWMgZmxhZyBvbiBleHBvcnRzLCB3aGljaCBmb3Jj
ZXMgdGhlCj4gPj4+Pj4+IGNhY2hpbmcKPiA+Pj4+Pj4gYXQgY3JlYXRlIHRpbWUgKHRvIGF2b2lk
IHRoZSBsb2NraW5nIGZ1biksIHdoaWNoIHdpbGwgdGhlbiByZXN1bHQgaW4gYQo+ID4+Pj4+PiBF
QlVTWSBhdCBtYXBfYXR0YWNobWVudCB0aW1lIGJlY2F1c2Ugd2UgaGF2ZSBhIGNhY2hlZCBtYXBw
aW5nLCBidXQKPiA+Pj4+Pj4gaXQncwo+ID4+Pj4+PiB0aGUgd3JvbmcgdHlwZS4KPiA+Pj4+PiBT
ZWUgdGhlIGNoZWNrIGluIGRtYV9idWZfbWFwX2F0dGFjaG1lbnQoKToKPiA+Pj4+Pgo+ID4+Pj4+
ICAgICAgICBpZiAoYXR0YWNoLT5kaXIgIT0gZGlyZWN0aW9uICYmIGF0dGFjaC0+ZGlyICE9IERN
QV9CSURJUkVDVElPTkFMKQo+ID4+Pj4+ICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVCVVNZ
KTsKPiA+Pj4+IEhtLCBJIG1pc3JlYWQgdGhpcy4gU28geWVhaCBzaG91bGQgd29yaywgKy8tIHRo
ZSBpc3N1ZSB0aGF0IHdlIG1pZ2h0Cj4gPj4+PiBub3QgZmx1c2ggZW5vdWdoLiBCdXQgSSBndWVz
cyB0aGF0IGNhbiBiZSBmaXhlZCB3aGVuZXZlciwgaXQncyBub3QKPiA+Pj4+IGxpa2UgZG1hLWFw
aSBzZW1hbnRpY3MgYXJlIGEgZ3JlYXQgZml0IGZvciB1cy4gTWF5YmUgYSBmaXhtZSBjb21tZW50
Cj4gPj4+PiB3b3VsZCBiZSB1c2VmdWwgaGVyZSAuLi4gSSdsbCBsb29rIGF0IHRoaXMgdG9tb3Jy
b3cgb3Igc28gYmVjYXVzZSBhdG0KPiA+Pj4+IGJyYWluIGlzIHNsb3csIEknbSBkb3duIHdpdGgg
dGhlIHVzdWFsIHBvc3QtY29uZmVyZW5jZSBjb2xkIGl0IHNlZW1zCj4gPj4+PiA6LS8KPiA+Pj4g
SG9wZSB5b3VyIGFyZSBmZWVsaW5nIGJldHRlciBub3csIGFkZGluZyBhIGNvbW1lbnQgaXMgb2Yg
Y291cnNlIG5vdCBhCj4gPj4+IHByb2JsZW0uCj4gPj4+Cj4gPj4+IFdpdGggdGhhdCBmaXhlZCBj
YW4gSSBnZXQgYW4gcmV2aWV3ZWQtYnkgb3IgYXQgbGVhc3QgYW5kIGFja2VkLWJ5Pwo+ID4+Pgo+
ID4+PiBJIHdhbnQgdG8gbGFuZCBhdCBsZWFzdCBzb21lIHBhcnRzIG9mIHRob3NlIGNoYW5nZXMg
bm93Lgo+ID4+Pgo+ID4+PiBSZWdhcmRzLAo+ID4+PiBDaHJpc3RpYW4uCj4gPj4+Cj4gPj4+PiAt
RGFuaWVsCj4gPj4+Pgo+CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
