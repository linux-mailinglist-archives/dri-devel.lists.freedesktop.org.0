Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9AC43396
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D57F894E7;
	Thu, 13 Jun 2019 07:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF8D89322
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:16:03 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 81so9176152pfy.13
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=l4AptQ/lp/40HceSKPfzGNYkbh2nIq8GF58tsuXwpVM=;
 b=SGiCEOlSWinF6Z1bcMlpafi/LDXXA+xWYmPyjhsrtHg7bAcsAfYGqbk/n49P1V+2ED
 Bmp/iu3Y4KX2M3JrSLnq1n3C1Q4tnkMy2otFoyvybE236ZM36rtSYI/5jZUjYtl8WRU6
 YpfXCqS+VFyHV4vX8grFx1TE1UzMCJtkvB85n6K4/Zha7TNXBessIpKsiaZ5fmPt+w9X
 g9rIowjbz+kkF9nGvYBDmaA7q65GokvmZK4eiM3sDdxNwWHbEmi/tIasGg0kQqFXOcAf
 Gqf7LyOyRrQEhgy2/Vuz9pSbmoYDmiGe2TcE8X0bTJIOgMRp5MyuSZM/moswCurDK5oh
 zvAw==
X-Gm-Message-State: APjAAAViN041FmnZZ5RZwQ1cyIdF9w3MmNuW64ac7RHjVNyoTF+fjeiA
 8Y9+6VGUAY9F2tfbnjtUXrs=
X-Google-Smtp-Source: APXvYqyHNMtcfEGWDtb5uxEj3HmmDu4AqP01gbIb1yLs8zGnDR9CaSVWAjn+4niP8Ae6MJ3PWyv7AQ==
X-Received: by 2002:a65:4806:: with SMTP id h6mr23286286pgs.299.1560327363279; 
 Wed, 12 Jun 2019 01:16:03 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
 by smtp.gmail.com with ESMTPSA id
 d5sm18174050pfn.25.2019.06.12.01.16.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 01:16:03 -0700 (PDT)
Date: Wed, 12 Jun 2019 01:15:54 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH] dma-buf: refcount the attachment for cache_sgt_mapping
Message-ID: <20190612081554.GB8876@Asurada>
References: <20190612012219.21652-1-nicoleotsuka@gmail.com>
 <261b46c7-0c5e-4268-619d-f8381fbc3aeb@amd.com>
 <20190612080214.GA8876@Asurada>
 <170c3828-115b-38e5-35fc-1b88c08c492a@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <170c3828-115b-38e5-35fc-1b88c08c492a@amd.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=l4AptQ/lp/40HceSKPfzGNYkbh2nIq8GF58tsuXwpVM=;
 b=h9aaMqXO9mqsSq6/NERYGEDB3ZRdlE7WRXesAHzRiGrGWxIWLuIu0wx+0IQ5W6tYkd
 X/N/DRdjcE7yMQJBlIeKxq3RzqszGF17TC8kDoY/ODFFxA/Ma1iGRRQsAD2sap8VWoy5
 1LWrmN7Vg2evNc7g9EXfrBmiTXWyyou1AJMq6rutcmKGzCeW2E02spIlgEvmDzg9RNGb
 tTQ3hNJif6eSfnx2SgyzENLn5Ck1SvGlXQS+SrSxRxfEs6U+ntYBQ1HqkzXI/KS1FfDz
 82D+Exkuxp/+JOeUSuwWW7DEJZrDSHHFFwCNyirD1ithDHDdP0k0HqMRf3tmT9pkuCp/
 jzWw==
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLAoKT24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDg6MDU6NTNBTSArMDAwMCwg
S29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gQW0gMTIuMDYuMTkgdW0gMTA6MDIgc2NocmllYiBO
aWNvbGluIENoZW46Cj4gPiBIaSBDaHJpc3RpYW4sCj4gPgo+ID4gVGhhbmtzIGZvciB0aGUgcXVp
Y2sgcmVwbHkuCj4gPgo+ID4gT24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDc6NDU6MzhBTSArMDAw
MCwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gPj4gQW0gMTIuMDYuMTkgdW0gMDM6MjIgc2No
cmllYiBOaWNvbGluIENoZW46Cj4gPj4+IENvbW1pdCBmMTNlMTQzZTc0NDQgKCJkbWEtYnVmOiBz
dGFydCBjYWNoaW5nIG9mIHNnX3RhYmxlIG9iamVjdHMgdjIiKQo+ID4+PiBhZGRlZCBhIHN1cHBv
cnQgb2YgY2FjaGluZyB0aGUgc2d0IHBvaW50ZXIgaW50byBhbiBhdHRhY2ggcG9pbnRlciB0bwo+
ID4+PiBsZXQgdXNlcnMgcmV1c2UgdGhlIHNndCBwb2ludGVyIHdpdGhvdXQgYW5vdGhlciBtYXBw
aW5nLiBIb3dldmVyLCBpdAo+ID4+PiBtaWdodCBub3QgdG90YWxseSB3b3JrIGFzIG1vc3Qgb2Yg
ZG1hLWJ1ZiBjYWxsZXJzIGFyZSBkb2luZyBhdHRhY2goKQo+ID4+PiBhbmQgbWFwX2F0dGFjaG1l
bnQoKSBiYWNrLXRvLWJhY2ssIHVzaW5nIGRybV9wcmltZS5jIGZvciBleGFtcGxlOgo+ID4+PiAg
ICAgICBkcm1fZ2VtX3ByaW1lX2ltcG9ydF9kZXYoKSB7Cj4gPj4+ICAgICAgICAgICBhdHRhY2gg
PSBkbWFfYnVmX2F0dGFjaCgpIHsKPiA+Pj4gICAgICAgICAgICAgICAvKiBBbGxvY2F0aW5nIGEg
bmV3IGF0dGFjaCAqLwo+ID4+PiAgICAgICAgICAgICAgIGF0dGFjaCA9IGt6YWxsb2MoKTsKPiA+
Pj4gICAgICAgICAgICAgICAvKiAuLi4uICovCj4gPj4+ICAgICAgICAgICAgICAgcmV0dXJuIGF0
dGFjaDsKPiA+Pj4gICAgICAgICAgIH0KPiA+Pj4gICAgICAgICAgIGRtYV9idWZfbWFwX2F0dGFj
aG1lbnQoYXR0YWNoLCBkaXJlY3Rpb24pIHsKPiA+Pj4gICAgICAgICAgICAgICAvKiBhdHRhY2gt
PnNndCB3b3VsZCBiZSBhbHdheXMgZW1wdHkgYXMgYXR0YWNoIGlzIG5ldyAqLwo+ID4+PiAgICAg
ICAgICAgICAgIGlmIChhdHRhY2gtPnNndCkgewo+ID4+PiAgICAgICAgICAgICAgICAgICAvKiBS
ZXVzZSBhdHRhY2gtPnNndCAqLwo+ID4+PiAgICAgICAgICAgICAgIH0KPiA+Pj4gICAgICAgICAg
ICAgICAvKiBPdGhlcndpc2UsIG1hcCBpdCAqLwo+ID4+PiAgICAgICAgICAgICAgIGF0dGFjaC0+
c2d0ID0gbWFwKCk7Cj4gPj4+ICAgICAgICAgICB9Cj4gPj4+ICAgICAgIH0KPiA+Pj4KPiA+Pj4g
U28sIGZvciBhIGNhY2hlX3NndF9tYXBwaW5nIHVzZSBjYXNlLCBpdCB3b3VsZCBuZWVkIHRvIGdl
dCB0aGUgc2FtZQo+ID4+PiBhdHRhY2htZW50IHBvaW50ZXIgaW4gb3JkZXIgdG8gcmV1c2UgaXRz
IHNndCBwb2ludGVyLiBTbyB0aGlzIHBhdGNoCj4gPj4+IGFkZHMgYSByZWZjb3VudCB0byB0aGUg
YXR0YWNoKCkgZnVuY3Rpb24gYW5kIGxldHMgaXQgc2VhcmNoIGZvciB0aGUKPiA+Pj4gZXhpc3Rp
bmcgYXR0YWNoIHBvaW50ZXIgYnkgbWF0Y2hpbmcgdGhlIGRldiBwb2ludGVyLgo+ID4+IEkgZG9u
J3QgdGhpbmsgdGhhdCB0aGlzIGlzIGEgZ29vZCBpZGVhLgo+ID4+Cj4gPj4gV2UgdXNlIHNndCBj
YWNoaW5nIGFzIHdvcmthcm91bmQgZm9yIGxvY2tpbmcgb3JkZXIgcHJvYmxlbXMgYW5kIHdhbnQg
dG8KPiA+PiByZW1vdmUgaXQgYWdhaW4gaW4gdGhlIGxvbmcgdGVybS4KPiA+IE9oLiBJIHRob3Vn
aHQgaXQgd2FzIGZvciBhIHBlcmZvcm1hbmNlIGltcHJvdmluZyBwdXJwb3NlLiBJdCBtYXkKPiA+
IGJlIGEgbWlzdW5kZXJzdGFuZGluZyB0aGVuLgo+ID4KPiA+PiBTbyB3aGF0IGlzIHRoZSBhY3R1
YWwgdXNlIGNhc2Ugb2YgdGhpcz8KPiA+IFdlIGhhdmUgc29tZSBzaW1pbGFyIGRvd25zdHJlYW0g
Y2hhbmdlcyBhdCBkbWFfYnVmIHRvIHJlZHVjZSB0aGUKPiA+IG92ZXJoZWFkIGZyb20gbXVsdGlw
bGUgY2xpZW50cyBvZiB0aGUgc2FtZSBkZXZpY2UgZG9pbmcgYXR0YWNoKCkKPiA+IGFuZCBtYXBf
YXR0YWNobWVudCgpIGNhbGxzIGZvciB0aGUgc2FtZSBkbWFfYnVmLgo+IAo+IEkgZG9uJ3QgdGhp
bmsgdGhhdCB0aGlzIGlzIGEgZ29vZCBpZGVhIG92ZXIgYWxsLiBBIGRyaXZlciBjYWxsaW5nIGF0
dGFjaCAKPiBmb3IgdGhlIHNhbWUgYnVmZmVyIGlzIGRvaW5nIHNvbWV0aGluZyB3cm9uZyBpbiB0
aGUgZmlyc3QgcGxhY2UgYW5kIHdlIAo+IHNob3VsZCBub3Qgd29yayBhcm91bmQgdGhpcyBpbiB0
aGUgRE1BLWJ1ZiBoYW5kbGluZy4KPiAKPiA+IFdlIGhhdmVuJ3QgdXNlZCBEUk0vR1JNX1BSSU1F
IHlldCBidXQgSSBhbSBhbHNvIGN1cmlvdXMgd291bGQgaXQKPiA+IGJlbmVmaXQgRFJNIGFsc28g
aWYgd2UgcmVkdWNlIHRoaXMgb3ZlcmhlYWQgaW4gdGhlIGRtYV9idWY/Cj4gCj4gTm8sIG5vdCBh
dCBhbGwuCgpGcm9tIHlvdSByZXBsaWVzLCBpbiBhIHN1bW1hcnksIGRvZXMgaXQgbWVhbnMgdGhh
dCB0aGVyZSB3b24ndCBiZSBhIGNhc2UKb2YgRFJNIGhhdmluZyBhIGRtYV9idWYgYXR0YWNoaW5n
IHRvIHRoZSBzYW1lIGRldmljZSwgaS5lLiBtdWx0aXBsZSBjYWxscwpvZiBkcm1fZ2VtX3ByaW1l
X2ltcG9ydCgpIGZ1bmN0aW9uIHdpdGggc2FtZSBwYXJhbWV0ZXJzIG9mIGRldiArIGRtYV9idWY/
CgpJZiBzbywgd2UgY2FuIGp1c3QgaWdub3JlL2Ryb3AgdGhpcyBwYXRjaC4gU29ycnkgZm9yIHRo
ZSBtaXN1bmRlcnN0YW5kaW5nLgoKVGhhbmtzCk5pY29saW4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
