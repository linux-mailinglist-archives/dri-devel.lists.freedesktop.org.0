Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3CE286F29
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 09:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF886EA30;
	Thu,  8 Oct 2020 07:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075EE6E98B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 19:00:25 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id db4so1792444qvb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 12:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=gwCbc+E55rt8fvg0Z5RrVkUNpQiUldF+rgqAtNMU+jY=;
 b=cMpNZVJG4K3eU3P6Jrd5CX0FOMJ/Il/vK4/7K8PoeJK7lgtOlsvjUxgy6GDWgBQ9D2
 Aw5daoxRX/jrMpwNlaXAoNbojcae9A3GOXghtCpRVV9HiqHG68GEdYZUDKJSzv88i+3p
 aFkcGAX3Swzr2MMkwPQxIHr1Vh0HtpCatuWCeA2XXODcHpk/xTpMM82sPz7LoWoj7YYW
 Luz6GqqQzWzkcXY5HEYy6sj4zsu7Bc3sA+CDzGGX0SAXYkf0OGAbHVxxlJGYn7JBpuJm
 7XOCU2H2Wb2aAXJ06fg5h12CT15LqHGmR1WX6xifpDWK1MH5EARIEabM4b4xkoRgWTA0
 GO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gwCbc+E55rt8fvg0Z5RrVkUNpQiUldF+rgqAtNMU+jY=;
 b=eUBnKNJ/i1li56NyfM2Q04hnH2lZ7wkkB+LVNUDSgv4BsEGWI8+6cYuP8eJT7pOh+W
 7E+QSEepoJbzMD4hrZDa6wun0hoAOKuVAVO/CEMWNKtEPDO4rpJd/U+hAs2A1MDE32ai
 L82hpJu18a9xIa0lju2fufu0yVLGB89j1dKgXbX0aX0mDeJUvw54qnC+fHQLWzcEjhYs
 eLE4Q757n7uTKQMqgJIBaxsbNxn/GuMD4+wJHI6gtZsBE2Ig4Y1+W3BEeSRmnRBJigyy
 LVUhlyzJQ/zI3GzIyzJNmjU5J8D0DEyRCcrr45DMWbIZfRGXiyxklwfTbvMYREWPNeCw
 tlqA==
X-Gm-Message-State: AOAM530E+EoLo2O7fFnPPPklbrFuuBzeYUoLwyylowC6ajfonX2YTTw/
 cgO8fuV/WuV4oRCuELXMm6elxw==
X-Google-Smtp-Source: ABdhPJzTPvAeI7la8FWGJoa8jqCaN28XQwmJorKlewk43J8Zj2TVezuTxCVG7tggprHbo9uup+dLjQ==
X-Received: by 2002:a0c:9d03:: with SMTP id m3mr4454155qvf.54.1602097224984;
 Wed, 07 Oct 2020 12:00:24 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id v65sm2143675qkb.88.2020.10.07.12.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 12:00:24 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQEfn-001EwU-Q3; Wed, 07 Oct 2020 16:00:23 -0300
Date: Wed, 7 Oct 2020 16:00:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 11/13] mm: add unsafe_follow_pfn
Message-ID: <20201007190023.GA5177@ziepe.ca>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-12-daniel.vetter@ffwll.ch>
 <20201007173647.GW5177@ziepe.ca>
 <CAKMK7uE9sbK_tGhJbsnHgD9rOnx-dr=2xmpMw7RvvvpPLnjVVA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uE9sbK_tGhJbsnHgD9rOnx-dr=2xmpMw7RvvvpPLnjVVA@mail.gmail.com>
X-Mailman-Approved-At: Thu, 08 Oct 2020 07:20:54 +0000
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
Cc: linux-s390@vger.kernel.org,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDcsIDIwMjAgYXQgMDg6MTA6MzRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIE9jdCA3LCAyMDIwIGF0IDc6MzYgUE0gSmFzb24gR3VudGhvcnBlIDxq
Z2dAemllcGUuY2E+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgT2N0IDA3LCAyMDIwIGF0IDA2OjQ0
OjI0UE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+IFdheSBiYWNrIGl0IHdhcyBh
IHJlYXNvbmFibGUgYXNzdW1wdGlvbnMgdGhhdCBpb21lbSBtYXBwaW5ncyBuZXZlcgo+ID4gPiBj
aGFuZ2UgdGhlIHBmbiByYW5nZSB0aGV5IHBvaW50IGF0LiBCdXQgdGhpcyBoYXMgY2hhbmdlZDoK
PiA+ID4KPiA+ID4gLSBncHUgZHJpdmVycyBkeW5hbWljYWxseSBtYW5hZ2UgdGhlaXIgbWVtb3J5
IG5vd2FkYXlzLCBpbnZhbGlkYXRpbmcKPiA+ID4gcHRlcyB3aXRoIHVubWFwX21hcHBpbmdfcmFu
Z2Ugd2hlbiBidWZmZXJzIGdldCBtb3ZlZAo+ID4gPgo+ID4gPiAtIGNvbnRpZ3VvdXMgZG1hIGFs
bG9jYXRpb25zIGhhdmUgbW92ZWQgZnJvbSBkZWRpY2F0ZWQgY2FydmV0b3V0cyB0bwo+ID4gPiBj
bWEgcmVnaW9ucy4gVGhpcyBtZWFucyBpZiB3ZSBtaXNzIHRoZSB1bm1hcCB0aGUgcGZuIG1pZ2h0
IGNvbnRhaW4KPiA+ID4gcGFnZWNhY2hlIG9yIGFub24gbWVtb3J5ICh3ZWxsIGFueXRoaW5nIGFs
bG9jYXRlZCB3aXRoIEdGUF9NT1ZFQUJMRSkKPiA+ID4KPiA+ID4gLSBldmVuIC9kZXYvbWVtIG5v
dyBpbnZhbGlkYXRlcyBtYXBwaW5ncyB3aGVuIHRoZSBrZXJuZWwgcmVxdWVzdHMgdGhhdAo+ID4g
PiBpb21lbSByZWdpb24gd2hlbiBDT05GSUdfSU9fU1RSSUNUX0RFVk1FTSBpcyBzZXQsIHNlZSAz
MjM0YWM2NjRhODcKPiA+ID4gKCIvZGV2L21lbTogUmV2b2tlIG1hcHBpbmdzIHdoZW4gYSBkcml2
ZXIgY2xhaW1zIHRoZSByZWdpb24iKQo+ID4gPgo+ID4gPiBBY2Nlc3NpbmcgcGZucyBvYnRhaW5l
ZCBmcm9tIHB0ZXMgd2l0aG91dCBob2xkaW5nIGFsbCB0aGUgbG9ja3MgaXMKPiA+ID4gdGhlcmVm
b3JlIG5vIGxvbmdlciBhIGdvb2QgaWRlYS4KPiA+ID4KPiA+ID4gVW5mb3J0dW5hdGVseSB0aGVy
ZSdzIHNvbWUgdXNlcnMgd2hlcmUgdGhpcyBpcyBub3QgZml4YWJsZSAobGlrZSB2NGwKPiA+ID4g
dXNlcnB0ciBvZiBpb21lbSBtYXBwaW5ncykgb3IgaW52b2x2ZXMgYSBwaWxlIG9mIHdvcmsgKHZm
aW8gdHlwZTEKPiA+ID4gaW9tbXUpLiBGb3Igbm93IGFubm90YXRlIHRoZXNlIGFzIHVuc2FmZSBh
bmQgc3BsYXQgYXBwcm9wcmlhdGVseS4KPiA+ID4KPiA+ID4gVGhpcyBwYXRjaCBhZGRzIGFuIHVu
c2FmZV9mb2xsb3dfcGZuLCB3aGljaCBsYXRlciBwYXRjaGVzIHdpbGwgdGhlbgo+ID4gPiByb2xs
IG91dCB0byBhbGwgYXBwcm9wcmlhdGUgcGxhY2VzLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiA+ID4gQ2M6IEphc29u
IEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgo+ID4gPiBDYzogS2VlcyBDb29rIDxrZWVzY29va0Bj
aHJvbWl1bS5vcmc+Cj4gPiA+IENjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVs
LmNvbT4KPiA+ID4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+
Cj4gPiA+IENjOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4gPiA+IENjOiBK
w6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiA+ID4gQ2M6IEphbiBLYXJhIDxq
YWNrQHN1c2UuY3o+Cj4gPiA+IENjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVs
LmNvbT4KPiA+ID4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+ID4gPiBDYzogbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiA+IENjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2Vy
Lmtlcm5lbC5vcmcKPiA+ID4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+ID4gPiBD
Yzoga3ZtQHZnZXIua2VybmVsLm9yZwo+ID4gPiAgaW5jbHVkZS9saW51eC9tbS5oIHwgIDIgKysK
PiA+ID4gIG1tL21lbW9yeS5jICAgICAgICB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystCj4gPiA+ICBtbS9ub21tdS5jICAgICAgICAgfCAxNyArKysrKysrKysrKysrKysrKwo+
ID4gPiAgc2VjdXJpdHkvS2NvbmZpZyAgIHwgMTMgKysrKysrKysrKysrKwo+ID4gPiAgNCBmaWxl
cyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gTWFrZXMg
c2Vuc2UgdG8gbWUuCj4gPgo+ID4gSSB3b25kZXIgaWYgd2UgY291bGQgY2hhbmdlIHRoZSBvcmln
aW5hbCBmb2xsb3dfcGZuIHRvIHJlcXVpcmUgdGhlCj4gPiBwdGVwIGFuZCB0aGVuIGxvY2tkZXBf
YXNzZXJ0X2hlbGQoKSBpdCBhZ2FpbnN0IHRoZSBwYWdlIHRhYmxlIGxvY2s/Cj4gCj4gVGhlIHNh
ZmUgdmFyaWFudCB3aXRoIHRoZSBwYWdldGFibGUgbG9jayBpcyBmb2xsb3dfcHRlX3BtZC4gVGhl
IG9ubHkKPiB3YXkgdG8gbWFrZSBmb2xsb3dfcGZuIHNhZmUgaXMgaWYgeW91IGhhdmUgYW4gbW11
IG5vdGlmaWVyIGFuZAo+IGNvcnJlc3BvbmRpbmcgcmV0cnkgbG9naWMuIFRoYXQgaXMgbm90IGNv
dmVyZWQgYnkgbG9ja2RlcCAoaXQgd291bGQKPiBzcGxhdCBpZiB3ZSBhbm5vdGF0ZSB0aGUgcmV0
cnkgc2lkZSksIHNvIEknbSBub3Qgc3VyZSBob3cgeW91J2QgY2hlY2sKPiBmb3IgdGhhdD8KClJp
Z2h0IE9LLgoKPiBDaGVja2luZyBmb3IgcHRlcCBsb2NrIGRvZXNuJ3Qgd29yayBoZXJlLCBzaW5j
ZSB0aGUgb25lIGxlZnRvdmVyIHNhZmUKPiB1c2VyIG9mIHRoaXMgKGt2bSkgZG9lc24ndCBuZWVk
IHRoYXQgYXQgYWxsLCBiZWNhdXNlIGl0IGhhcyB0aGUgbW11Cj4gbm90aWZpZXIuCgpBaCwgc28g
YSBiZXR0ZXIgbmFtZSBhbmQvb3IgZnVuY3Rpb24ga2RvYyBmb3IgZm9sbG93X3BmbiBpcyBwcm9i
YWJseSBhCmdvb2QgaWVhZCBpbiB0aGlzIHBhdGNoIGFzIHdlbGwuCgo+IFNvIEkgdGhpbmsgd2Un
cmUgYXMgZ29vZCBhcyBpdCBnZXRzLCBzaW5jZSBJIHJlYWxseSBoYXZlIG5vIGlkZWEgaG93Cj4g
dG8gbWFrZSBzdXJlIGZvbGxvd19wZm4gY2FsbGVycyBkbyBoYXZlIGFuIG1tdSBub3RpZmllciBy
ZWdpc3RlcmVkLgoKWWFoLCBjYW4ndCBiZSBkb25lLiBNb3N0IG1tdSBub3RpZmllciB1c2VycyBz
aG91bGQgYmUgdXNpbmcKaG1tX3JhbmdlX2ZhdWx0IGFueWhvdywga3ZtIGlzIHJlYWxseSB2ZXJ5
IHNwZWNpYWwgaGVyZS4KIAo+IEkndmUgZm9sbG93ZWQgdGhlIGZldyBvdGhlciBDT05GSUdfU1RS
SUNUX0ZPTyBJJ3ZlIHNlZW4sIHdoaWNoIGFyZSBhbGwKPiBleHBsaWNpdCBlbmFibGVzIGFuZCBk
ZWZhdWx0IHRvICJkbyBub3QgYnJlYWsgdWFwaSwgZGFtbiB0aGUKPiAoc2VjdXJpdHkpIGJ1Z3Mi
LiBXaGljaCBpcyBJIHRoaW5rIGhvdyB0aGlzIHNob3VsZCBiZSBkb25lLiBJdCBpcyBpbgo+IHRo
ZSBzZWN1cml0eSBzZWN0aW9uIHRob3VnaCwgc28gaG9wZWZ1bGx5IGNvbXBldGVudCBkaXN0cm9z
IHdpbGwKPiBlbmFibGUgdGhpcyBhbGwuCgpJIHRob3VnaHQgdGhlIHN0cmljdCBvbmVzIHdlcmUg
bW9yZSBnZW5lcmFsIGFuZCBsZXNzIGNsZWFyIHNlY3VyaXR5CndvcnJpZXMsIG5vdCBidWdzIGxp
a2UgdGhpcy4KClRoaXMgaXMgImFsbG93IGEgdXNlciB0cmlnZ2VyYWJsZSB1c2UgYWZ0ZXIgZnJl
ZSBidWcgdG8gZXhpc3QgaW4gdGhlCmtlcm5lbCIKCkphc29uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
