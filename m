Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9B1288A94
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 16:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBBD6ECFA;
	Fri,  9 Oct 2020 14:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69136ECFA
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 14:19:05 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id d28so9160150ote.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 07:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MM70QuqTQsUBVq7gYXvXBZty2HeYwYo1AwlGqBndKzc=;
 b=TXHPzxH9Da/xVr/PCQoDGy8c0zPWy+ggD3CN9+uIIarhuboqtJeD+WQppuYxHsd6Lw
 Y7BHU63LYKcn8Q19C0ojPAIbHvLgUU7idHjBxl/cqvgWdtq9sYwq7aJadM3ewUTikvYS
 Or+ZtapYPyo5QGIWg5F96VAf0fQY9D81hLV+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MM70QuqTQsUBVq7gYXvXBZty2HeYwYo1AwlGqBndKzc=;
 b=VSSsx6gZuX2B+D4t6ds7974I1tZH9WRqLBD18AFu5jRJA89sKAOgcvoV2ufEJOfHpO
 4LV3/4S2mxPlO1D3mdS1hn7+4+m1nRAR7VORZp9/LaamqlDXHj/vHgVerZNkCfOsHeSa
 DbxRw+9qsxXaMgL0Uz9rUOeMlMxKJH+GDXAvHV6v1qZh37yU6aHlRP1yY3duD72Am9n9
 Zig4BcnBqLqHHwIsnbI1LHum0YiUAkSSRxkF9E7oTm7DWQMq2ADfNVdHf6KR4Agu6zI8
 2CP1OtMJWX8nQEAw3VJzuvQfiOgoihhlxAbUzcfUGajFivLW41NNIwiH6Dr3Pqr8dyhE
 UzXw==
X-Gm-Message-State: AOAM532VEJyOb7Mgs44xGIUDumXOoHb60Cki+gmx1orVloWuiaqudEbb
 RAB/Lg3bkSh7R4Q3l5F2/shJBzwoVC4IxtiCa0B/2A==
X-Google-Smtp-Source: ABdhPJzNidxPOYe2uXf9i2kyX3nO4EFb7XRxsxlaQUOxC+n0ejMSsQdbIKmUu2me6/FBsUnaPi9FuwTaAIvXBztd7mE=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id
 f28mr9534834ote.188.1602253144991; 
 Fri, 09 Oct 2020 07:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-18-daniel.vetter@ffwll.ch>
 <20201009094750.GQ6112@intel.com>
 <CAKMK7uH3o3hnRkTDqr93PR=wuRejpty+AbyMacoEFDDb6OgJeQ@mail.gmail.com>
 <20201009104154.GR6112@intel.com>
In-Reply-To: <20201009104154.GR6112@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 9 Oct 2020 16:18:53 +0200
Message-ID: <CAKMK7uEp71+B3EVTezog8U3VY=DUYAbe1QeqZH9NEG8T37M_Cw@mail.gmail.com>
Subject: Re: [PATCH v2 17/17] drm/i915: Properly request PCI BARs
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, KVM list <kvm@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Linux PCI <linux-pci@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgOSwgMjAyMCBhdCAxMjo0MiBQTSBWaWxsZSBTeXJqw6Rsw6QKPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgT2N0IDA5LCAyMDIwIGF0
IDEyOjAxOjM5UE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBGcmksIE9jdCA5
LCAyMDIwIGF0IDExOjQ3IEFNIFZpbGxlIFN5cmrDpGzDpAo+ID4gPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gRnJpLCBPY3QgMDksIDIwMjAgYXQg
MDk6NTk6MzRBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gPiBXaGVuIHRyeWlu
ZyB0byB0ZXN0IG15IENPTkZJR19JT19TVFJJQ1RfREVWTUVNIGNoYW5nZXMgSSByZWFsaXplZCB0
aGV5Cj4gPiA+ID4gZG8gbm90aGluZyBmb3IgaTkxNS4gQmVjYXVzZSBpOTE1IGRvZXNuJ3QgcmVx
dWVzdCBhbnkgcmVnaW9ucywgbGlrZQo+ID4gPiA+IHByZXR0eSBtdWNoIGFsbCBkcm0gcGNpIGRy
aXZlcnMuIEkgZ3Vlc3MgdGhpcyBpcyBzb21lIHZlcnkgb2xkCj4gPiA+ID4gcmVtbmFudHMgZnJv
bSB0aGUgdXNlcnNwYWNlIG1vZGVzZXR0aW5nIGRheXMsIHdoZW4gd2Ugd2FudGVkIHRvCj4gPiA+
ID4gY28tZXhpc3Qgd2l0aCB0aGUgZmJkZXYgZHJpdmVyLiBXaGljaCB1c3VhbGx5IHJlcXVlc3Rl
ZCB0aGVzZQo+ID4gPiA+IHJlc291cmNlcy4KPiA+ID4gPgo+ID4gPiA+IEJ1dCBtYWtlcyBtZSB3
b25kZXIgd2h5IHRoZSBwY2kgc3Vic3lzdGVtIGRvZXNuJ3QganVzdCByZXF1ZXN0Cj4gPiA+ID4g
cmVzb3VyY2UgYXV0b21hdGljYWxseSB3aGVuIHdlIG1hcCBhIGJhciBhbmQgYSBwY2kgZHJpdmVy
IGlzIGJvdW5kPwo+ID4gPiA+Cj4gPiA+ID4gS25vd2xlZGdlIGFib3V0IHdoaWNoIHBjaSBiYXJz
IHdlIG5lZWQga2x1ZGdlZCB0b2dldGhlciBmcm9tCj4gPiA+ID4gaW50ZWxfdW5jb3JlLmMgYW5k
IGludGVsX2d0dC5jIGZyb20gaTkxNSBhbmQgaW50ZWwtZ3R0LmMgb3ZlciBpbiB0aGUKPiA+ID4g
PiBmYWtlIGFncCBkcml2ZXIuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiA+ID4gPiBDYzogSmFzb24gR3VudGhv
cnBlIDxqZ2dAemllcGUuY2E+Cj4gPiA+ID4gQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21p
dW0ub3JnPgo+ID4gPiA+IENjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNv
bT4KPiA+ID4gPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4K
PiA+ID4gPiBDYzogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+ID4gPiA+IENj
OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiA+ID4gPiBDYzogSmFuIEth
cmEgPGphY2tAc3VzZS5jej4KPiA+ID4gPiBDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFt
c0BpbnRlbC5jb20+Cj4gPiA+ID4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+ID4gPiA+IENjOiBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+ID4gPiBDYzogbGludXgtc2Ft
c3VuZy1zb2NAdmdlci5rZXJuZWwub3JnCj4gPiA+ID4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2Vy
bmVsLm9yZwo+ID4gPiA+IENjOiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgo+
ID4gPiA+IENjOiBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnCj4gPiA+ID4gLS0tCj4gPiA+ID4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3VuY29yZS5jIHwgMjUgKysrKysrKysrKysrKysr
KysrKysrKystLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pbnRlbF91bmNvcmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3VuY29yZS5j
Cj4gPiA+ID4gaW5kZXggNTRlMjAxZmRlYmE0Li5jZTM5MDQ5ZDg5MTkgMTAwNjQ0Cj4gPiA+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfdW5jb3JlLmMKPiA+ID4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF91bmNvcmUuYwo+ID4gPiA+IEBAIC0xNjkyLDEwICsx
NjkyLDEzIEBAIHN0YXRpYyBpbnQgdW5jb3JlX21taW9fc2V0dXAoc3RydWN0IGludGVsX3VuY29y
ZSAqdW5jb3JlKQo+ID4gPiA+ICAgICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gaTkxNS0+ZHJt
LnBkZXY7Cj4gPiA+ID4gICAgICAgaW50IG1taW9fYmFyOwo+ID4gPiA+ICAgICAgIGludCBtbWlv
X3NpemU7Cj4gPiA+ID4gKyAgICAgaW50IGJhcl9zZWxlY3Rpb247Cj4gPiA+Cj4gPiA+IFNpZ25l
ZCBiaXRtYXNrcyBhbHdheXMgbWFrZSBtZSB1bmVhc3kuIEJ1dCBsb29rcyBsaWtlCj4gPiA+IHRo
YXQncyB3aGF0IGl0IGlzIGluIHRoZSBwY2kgYXBpLiBTbyBtZWguCj4gPgo+ID4gWWVhaCBpdCdz
IHN1cnByaXNpbmcuCj4gPgo+ID4gPiA+ICsgICAgIGludCByZXQ7Cj4gPiA+ID4KPiA+ID4gPiAg
ICAgICBtbWlvX2JhciA9IElTX0dFTihpOTE1LCAyKSA/IDEgOiAwOwo+ID4gPiA+ICsgICAgIGJh
cl9zZWxlY3Rpb24gPSBCSVQgKDIpIHwgQklUKG1taW9fYmFyKTsKPiA+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXgo+ID4gPiBzcHVyaW91cyBzcGFjZQo+ID4gPgo+ID4gPiBUaGF0J3Mg
YWxzbyBub3QgY29ycmVjdCBmb3IgZ2VuMiBJIHRoaW5rLgo+ID4gPgo+ID4gPiBnZW4yOgo+ID4g
PiAwID0gR01BRFIKPiA+ID4gMSA9IE1NQURSCj4gPiA+IDIgPSBJT0JBUgo+ID4gPgo+ID4gPiBn
ZW4zOgo+ID4gPiAwID0gTU1BRFIKPiA+ID4gMSA9IElPQkFSCj4gPiA+IDIgPSBHTUFEUgo+ID4g
PiAzID0gR1RUQURSCj4gPiA+Cj4gPiA+IGdlbjQrOgo+ID4gPiAwKzEgPSBHVFRNTUFEUgo+ID4g
PiAyKzMgPSBHTUFEUgo+ID4gPiA0ID0gSU9CQVIKPiA+ID4KPiA+ID4gTWF5YmUgd2Ugc2hvdWxk
IGp1c3QgaGF2ZSBhbiBleHBsaWNpdCBsaXN0IG9mIGJhcnMgbGlrZSB0aGF0IGluIGEKPiA+ID4g
Y29tbWVudD8KPiA+ID4KPiA+ID4gSSdkIGFsc28gc3VnZ2VzdCBzdWNraW5nIHRoaXMgYml0bWFz
ayBjYWxjdWxhdGlvbiBpbnRvIGEgc21hbGwgaGVscGVyCj4gPiA+IHNvIHlvdSBjYW4gcmV1c2Ug
aXQgZm9yIHRoZSByZWxlYXNlLgo+ID4KPiA+IHRiaCBJIGp1c3QgaGFja2VkIHRoaXMgdXAgZm9y
IHRlc3RpbmcuIEdpdmVuIGhvdyBhbG1vc3Qgbm8gb3RoZXIgZHJtCj4gPiBkcml2ZXIgZG9lcyB0
aGlzLCBJJ20gd29uZGVyaW5nIHdoZXRoZXIgd2Ugc2hvdWxkIG9yIG5vdC4KPiA+Cj4gPiBBbHNv
IHRoZSBvbmx5IHJlYXNvbiB3aHkgSSBkaWRuJ3QganVzdCB1c2UgdGhlIHBjaV9yZXF1ZXN0X3Jl
Z2lvbnMKPiA+IGhlbHBlciBpcyB0byBhdm9pZCB0aGUgdmdhIGlvcG9ydCByYW5nZSwgc2luY2Ug
dGhhdCdzIG1hbmFnZWQgYnkKPiA+IHZnYWFyYml0ZXIuCj4KPiBWR0EgaW8gcmFuZ2UgaXNuJ3Qg
cGFydCBvZiBhbnkgYmFyLiBPciBkbyB5b3UgbWVhbiBqdXN0IHRoZSBpbyBkZWNvZGUKPiBlbmFi
bGUgYml0IGluIHRoZSBwY2kgY29tbWFuZCByZWdpc3Rlcj8gVGhhdCBzaG91bGQgYmUganVzdCBh
IG1hdHRlcgo+IG9yIHBjaV9lbmFibGVfZGV2aWNlKCkgdnMuIHBjaV9lbmFibGVfZGV2aWNlX21l
bSgpIEkgdGhpbmsuIFNvIG5vdGhpbmcKPiB0byBkbyB3aXRoIHdoaWNoIGJhcnMgd2UndmUgcmVx
dWVzdGVkIElJUkMuCj4KPiA+Cj4gPiBTbyBJIHRoaW5rIGlmIHdlIGdvIGZvciB0aGlzIGZvciBy
ZWFsIHdlIHNob3VsZDoKPiA+IC0gcmVnaXN0ZXIgdGhlIHZnYSBpb3BvcnQgcmFuZ2UgaW4gdGhl
IHZnYWFyYml0ZXIKPiA+IC0gaGF2ZSBhIHBjaV9yZXF1ZXN0X2lvbWVtX3JlZ2lvbnMgaGVscGVy
IHRoYXQgZ3JhYnMgYWxsIG1lbSBiYXJzCj4gPiAtIHJvbGwgdGhhdCBvdXQgdG8gYWxsIGRybSBw
Y2kgZHJpdmVycwo+ID4KPiA+IE9yIHNvbWV0aGluZyBsaWtlIHRoYXQuIFRoZSBvdGhlciBjb21w
bGljYXRpb24gaXMgd2hlbiB3ZSByZXNpemUgdGhlCj4gPiBpb2Jhci4gU28gbm90IHJlYWxseSBz
dXJlIHdoYXQgdG8gZG8gaGVyZS4KPgo+IFdlIHJlc2l6ZSBpdD8KCkJ5IGRlZmF1bHQgSSB0aG91
Z2h0IGZpcm13YXJlIHB1dHMgZXZlcnl0aGluZyAod2VsbCwgc3F1ZWV6ZXMpIGludG8KdGhlIGxv
d2VyIDMyYml0LiBNYXliZSB0aGV5IHN0b3BwZWQgZG9pbmcgdGhhdC4gU28gd2hlbiB3ZSB3YW50
IHRoZQpmdWxsIGJhciAoZm9yIGRpc2NyZXRlIGF0IGxlYXN0KSB3ZSBuZWVkIHRvIHJlc2l6ZSBp
dCBhbmQgcHV0IGl0CnNvbWV3aGVyZSBpbiB0aGUgNjRiaXQgcmFuZ2UgYWJvdmUgZW5kIG9mIHN5
c3RlbSBtZW1vcnkuCgpTbyBJIGd1ZXNzIGNvcnJlY3QgcGhyYXNpbmcgaXMgIndlIHdpbGwgcmVz
aXplIGl0IiA6LSkKLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwg
SW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
