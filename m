Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91354281AB8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 20:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F296E9BB;
	Fri,  2 Oct 2020 18:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EFC6E9BB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 18:16:59 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id s66so2262260otb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 11:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3HxwxxjOyUFsHnvZd90so4n7HtMcvrp+2NDYk+teChw=;
 b=UroveKdEgKPvYhDgIRFBP6hGaOMHl0KhWjPmr7h+me9Xj+hsNqVEe+KzxfQ5R752mW
 Q39uBXtohsZOj34gGmK/hanyDQGQMTFvEwg1txwSCZatYOYvpHfVCUEfTc1tX+5qw+e4
 lhr2S+yleRha4sKjZin5W1q02Y1XO7J4/uNO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3HxwxxjOyUFsHnvZd90so4n7HtMcvrp+2NDYk+teChw=;
 b=sw+jsZqnbacsEDIri4HbtQgvMkRlX2hsnOjOj2QsrZnlY12qVyulwuNd08dyYIoe4J
 eigGfZwAmMKRZ75p3tSVuJG4vkxc1zSpntaw4cK4PF+j3Oibc3ZzWmxi77TGDrdO7HV3
 nvaYzFEP+/j5KLZ03WN44xJpVXr23wm2hBF2FdL87IjPbT71i49ktAxs2GBvMsfdQImh
 N5KKoZTU7NVQciKXWd0KpZRaKBMMXRc+iyQ/sX23TU2Pk/xlMqa5iEJ9r6QN+wb+u0a+
 +HcCBmpyk75g39oQcxJCNkOV3TSahCKF4uh/7dpvmetcFom50Q1qKYFFXDuoKnJEZvbr
 6E4w==
X-Gm-Message-State: AOAM532BTPAzROZyNBLOd1EhBL5LKZeEi+dVzDX70sHzS8QqnipTL5+u
 Pnvr1vCOWd8j56CJ8bLNw+xD3v5+r31eIBBSsModjw==
X-Google-Smtp-Source: ABdhPJz/iLpxd0MKJvGez6uG++167T4Nd3ZEU24lIiueGBImWGdkODsxyKl+FpR0pn01MP2E0GHPOCfnbU7WfP4NbAY=
X-Received: by 2002:a9d:4b99:: with SMTP id k25mr2747483otf.281.1601662619231; 
 Fri, 02 Oct 2020 11:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <20201002180603.GL9916@ziepe.ca>
In-Reply-To: <20201002180603.GL9916@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 2 Oct 2020 20:16:48 +0200
Message-ID: <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMiwgMjAyMCBhdCA4OjA2IFBNIEphc29uIEd1bnRob3JwZSA8amdnQHppZXBl
LmNhPiB3cm90ZToKPiBPbiBGcmksIE9jdCAwMiwgMjAyMCBhdCAwNzo1MzowM1BNICswMjAwLCBE
YW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gRm9yICRyZWFzb25zIEkndmUgc3R1bWJsZWQgb3ZlciB0
aGlzIGNvZGUgYW5kIEknbSBub3Qgc3VyZSB0aGUgY2hhbmdlCj4gPiB0byB0aGUgbmV3IGd1cCBm
dW5jdGlvbnMgaW4gNTVhNjUwYzM1ZmVhICgibW0vZ3VwOiBmcmFtZV92ZWN0b3I6Cj4gPiBjb252
ZXJ0IGdldF91c2VyX3BhZ2VzKCkgLS0+IHBpbl91c2VyX3BhZ2VzKCkiKSB3YXMgZW50aXJlbHkg
Y29ycmVjdC4KPiA+Cj4gPiBUaGlzIGhlcmUgaXMgdXNlZCBmb3IgbG9uZyB0ZXJtIGJ1ZmZlcnMg
KG5vdCBqdXN0IHF1aWNrIEkvTykgbGlrZQo+ID4gUkRNQSwgYW5kIEpvaG4gbm90ZXMgdGhpcyBp
biBoaXMgcGF0Y2guIEJ1dCBJIHRob3VnaHQgdGhlIHJ1bGUgZm9yCj4gPiB0aGVzZSBpcyB0aGF0
IHRoZXkgbmVlZCB0byBhZGQgRk9MTF9MT05HVEVSTSwgd2hpY2ggSm9obidzIHBhdGNoCj4gPiBk
aWRuJ3QgZG8uCj4gPgo+ID4gVGhlcmUgaXMgYWxyZWFkeSBhIGRheCBzcGVjaWZpYyBjaGVjayAo
YWRkZWQgaW4gYjdmMDU1NGE1NmYyICgibW06Cj4gPiBmYWlsIGdldF92YWRkcl9mcmFtZXMoKSBm
b3IgZmlsZXN5c3RlbS1kYXggbWFwcGluZ3MiKSksIHNvIHRoaXMgc2VlbXMKPiA+IGxpa2UgdGhl
IHBydWRlbnQgdGhpbmcgdG8gZG8uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBs
aW51eC1mb3VuZGF0aW9uLm9yZz4KPiA+IENjOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRp
YS5jb20+Cj4gPiBDYzogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4gPiBD
YzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPiA+IENjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndp
bGxpYW1zQGludGVsLmNvbT4KPiA+IENjOiBsaW51eC1tbUBrdmFjay5vcmcKPiA+IENjOiBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IENjOiBsaW51eC1zYW1zdW5nLXNv
Y0B2Z2VyLmtlcm5lbC5vcmcKPiA+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiA+
IEhpIGFsbCwKPiA+Cj4gPiBJIHN0dW1ibGVkIG92ZXIgdGhpcyBhbmQgZmlndXJlZCB0eXBpbmcg
dGhpcyBwYXRjaCBjYW4ndCBodXJ0LiBSZWFsbHkKPiA+IGp1c3QgdG8gbWF5YmUgbGVhcm4gYSBm
ZXcgdGhpbmdzIGFib3V0IGhvdyBndXAvcHVwIGlzIHN1cHBvc2VkIHRvIGJlCj4gPiB1c2VkICh3
ZSBoYXZlIGEgYml0IG9mIHRoYXQgaW4gZHJpdmVycy9ncHUpLCB0aGlzIGhlcmUgaXNuJ3QgcmVh
bGx5Cj4gPiByYWxhdGVkIHRvIGFueXRoaW5nIEknbSBkb2luZy4KPgo+IEZPTExfRk9SQ0UgaXMg
YSBwcmV0dHkgYmlnIGNsdWUgaXQgc2hvdWxkIGJlIEZPTExfTE9OR1RFUk0sIElNSE8KClNpbmNl
IHlvdSdyZSBoZXJlIC4uLiBJJ3ZlIG5vdGljZWQgdGhhdCBpYiBzZXRzIEZPTExfRk9SQ0Ugd2hl
biB0aGUgaWIKdmVyYiBhY2Nlc3MgbW9kZSBpbmRpY2F0ZXMgcG9zc2libGUgd3JpdGVzLiBJJ20g
bm90IHJlYWxseSBjbGVhciBvbgp3aHkgRk9MTF9XUklURSBpc24ndCBlbm91Z2ggYW55IHdoeSB5
b3UgbmVlZCB0byBiZSBhYmxlIHRvIHdyaXRlCnRocm91Z2ggYSB2bWEgdGhhdCdzIHdyaXRlIHBy
b3RlY3RlZCBjdXJyZW50bHkuCgo+ID4gSSdtIGFsc28gd29uZGVyaW5nIHdoZXRoZXIgdGhlIGV4
cGxpY2l0IGRheCBjaGVjayBzaG91bGQgYmUgcmVtb3ZlZCwKPiA+IHNpbmNlIEZPTExfTE9OR1RF
Uk0gc2hvdWxkIHRha2UgY2FyZSBvZiB0aGF0IGFscmVhZHkuCj4KPiBZZXAhIENvbmZpcm1zIHRo
ZSBhYm92ZSEKPgo+IFRoaXMgZ2V0X3ZhZGRyX2ZyYW1lcygpIHRoaW5nIGxvb2tzIGltcG9zc2li
bGUgdG8gdXNlIHByb3Blcmx5LiBIb3cgb24KPiBlYXJ0aCBkb2VzIGEgZHJpdmVyIGd1YXJlbnRl
ZQo+Cj4gICJJZiBAc3RhcnQgYmVsb25ncyB0byBWTV9JTyB8IFZNX1BGTk1BUCB2bWEsIHdlIGRv
bid0IHRvdWNoIHBhZ2UKPiAgc3RydWN0dXJlcyBhbmQgdGhlIGNhbGxlciBtdXN0IG1ha2Ugc3Vy
ZSBwZm5zIGFyZW4ndCByZXVzZWQgZm9yCj4gIGFueXRoaW5nIGVsc2Ugd2hpbGUgaGUgaXMgdXNp
bmcgdGhlbS4iCj4KPiBUaGUgb25seSBwb3NzaWJsZSB3YXkgdG8gZG8gdGhhdCBpcyBpZiB0aGUg
ZHJpdmVyIHJlc3RyaWN0cyB0aGUgVk1Bcwo+IHRvIG9uZXMgaXQgb3ducyBhbmQgaW50ZXJhY3Rz
IHdpdGggdGhlIHZtX3ByaXZhdGUgZGF0YSB0byByZWZjb3VudAo+IHNvbWV0aGluZy4KPgo+IFNp
bmNlIGV2ZXJ5IGRyaXZlciBkb2VzIHRoaXMgd3JvbmcgYW55dGhpbmcgdGhhdCB1c2VzIHRoaXMg
aXMgY3JlYXRpbmcKPiB0ZXJyaWZ5aW5nIHNlY3VyaXR5IGlzc3Vlcy4KPgo+IElNSE8gdGhpcyB3
aG9sZSBBUEkgc2hvdWxkIGJlIGRlbGV0ZWQgOigKClllYWggdGhhdCBwYXJ0IEkganVzdCB0cmll
ZCB0byBjb252ZW5pZW50bHkgaWdub3JlLiBJIGd1ZXNzIHRoaXMgZGF0ZXMKYmFjayB0byBhIHRp
bWUgd2hlbiBpb3JlbWFwcyB3aGVyZSBhdCBiZXN0IGZpeGVkLCBhbmQgdGhlcmUgd2Fzbid0CmFu
eXRoaW5nIGxpa2UgYSBncHUgZHJpdmVyIGR5bmFtaWNhbGx5IG1hbmFnaW5nIHZyYW0gYXJvdW5k
LCByZXN1bHRpbmcKaW4gcmFuZG9tIGVudGlyZWx5IHVucmVsYXRlZCB0aGluZ3MgcG9zc2libHkg
YmVpbmcgbWFwcGVkIHRvIHRoYXQgc2V0Cm9mIHBmbnMuCgpUaGUgdW5kZXJseWluZyBmb2xsb3df
cGZuIGlzIGFsc28gdXNlZCBpbiBvdGhlciBwbGFjZXMgd2l0aGluCmRyaXZlcnMvbWVkaWEsIHNv
IHRoaXMgZG9lc24ndCBzZWVtIHRvIGJlIGFuIGFjY2lkZW50LCBidXQgYWN0dWFsbHkKaW50ZW50
aW9uYWwuCgpJIGd1ZXNzIG1pbmltYWxseSB3ZSdkIG5lZWQgYSBWTV9QRk5NQVAgZmxhZyBmb3Ig
ZHluYW1pY2FsbHkgbWFuZ2VkCmRyaXZlcnMgbGlrZSBtb2Rlcm4gZHJtIGdwdSBkcml2ZXJzLCB0
byBtYWtlIHN1cmUgZm9sbG93X3BmbiBkb2Vzbid0CmZvbGxvdyB0aGVzZT8KLURhbmllbAotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
