Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 337D235C75E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 15:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDD56E595;
	Mon, 12 Apr 2021 13:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE0E6E57E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 13:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618233545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ZXD0Vjr7M6pXQoqoYaNJ9fIJMRtCGqZKUK6a7IbIAM=;
 b=IfujdcitXd9kYzsj+8DDlnMxAEjGbadVBza3cHUTz9FUaG8Yd9XzCtltvTBh5btJ4Md062
 e0XtzAvn94j3qcrWUUs9/h5aYJj1WyfjDRc2XzXDp1kM6+av/4bR/79iKg9neQZiE19BVq
 x94D0YPCfff5/1n++f+Di2qy3WWhCgE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-dIuv9mXWMz6ShCEPv00iTA-1; Mon, 12 Apr 2021 09:19:03 -0400
X-MC-Unique: dIuv9mXWMz6ShCEPv00iTA-1
Received: by mail-wm1-f72.google.com with SMTP id
 h10-20020a05600c350ab029010cff8d09edso2102671wmq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 06:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7ZXD0Vjr7M6pXQoqoYaNJ9fIJMRtCGqZKUK6a7IbIAM=;
 b=Lrsz293giYJoGUH8+WOK0AqeQElMZMuyf85z0Dcan4YLTBAZ8uuEJksAMyvplwGZP4
 6cUujzbjkcALSARaJOJCYaitJCChBlAzg6Xl5USrB9vE9XFmVA3ylcjwAC+/tjZB+Mi1
 +dQ3BlqaOVRdRq8v4F3LqjX5BvSKUy6zJ0eMCty1rt2i9Knp0GIYZqTEU8tnPf6Po4gj
 tIq+jNZLQesMl1hKcVc4vQzu4kdi7xRvH/9TdVSHd9qIv/WeUEIByb1JlkQhmCzImqfc
 nTO2KMzulBavMesNR8vG9xnVGTLIRQ/xPOpuFCk5fpteopfvEtBA1k7bT/YWKOgVGxdW
 m9zg==
X-Gm-Message-State: AOAM530TxfaKA1ngrauznH4ALKw23LlKdwkIBcdhtRpPTxa5fAaWr1Ej
 KXfUa4WZ7KumqCoInLexIIrQTfqRaSyLou/DyQfg72tELPW8Ko/CnTPrlQlu52BwkQtsDHAxdID
 D5tUotC/VXwDnECV/R6OY46RzmqGO
X-Received: by 2002:a5d:40c1:: with SMTP id b1mr14516014wrq.33.1618233542680; 
 Mon, 12 Apr 2021 06:19:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7xYSMl1mhv7IAg348AjhAJnlfD0ElxtQIBjiZbX8gXBrQUGHbbh/j9IzPlcTzIMjQzJv+hg==
X-Received: by 2002:a5d:40c1:: with SMTP id b1mr14515964wrq.33.1618233542418; 
 Mon, 12 Apr 2021 06:19:02 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c66cb.dip0.t-ipconnect.de. [91.12.102.203])
 by smtp.gmail.com with ESMTPSA id c8sm14836856wmb.34.2021.04.12.06.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 06:19:02 -0700 (PDT)
Subject: Re: [PATCH v3] drivers: introduce and use WANT_DMA_CMA for soft
 dependencies on DMA_CMA
To: Robin Murphy <robin.murphy@arm.com>, Arnd Bergmann <arnd@arndb.de>
References: <20210409112035.27221-1-david@redhat.com>
 <CAK8P3a31uKNcim0n99=yt3zjZ+LQSw4V4+8PS8daLsBdS0iSYg@mail.gmail.com>
 <53ec94ac-ffe3-d0bc-d081-3489fa03daa1@redhat.com>
 <34350446-0e0e-6947-40bd-fabdccdc835f@arm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <e996ca72-7857-ba50-0e7e-f0c3dab3a931@redhat.com>
Date: Mon, 12 Apr 2021 15:19:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <34350446-0e0e-6947-40bd-fabdccdc835f@arm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Christoph Hellwig <hch@lst.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Joel Stanley <joel@jms.id.au>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Peter Collingbourne <pcc@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux-MM <linux-mm@kvack.org>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIuMDQuMjEgMTU6MTIsIFJvYmluIE11cnBoeSB3cm90ZToKPiBPbiAyMDIxLTA0LTA5IDE0
OjM5LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4gT24gMDkuMDQuMjEgMTU6MzUsIEFybmQg
QmVyZ21hbm4gd3JvdGU6Cj4+PiBPbiBGcmksIEFwciA5LCAyMDIxIGF0IDE6MjEgUE0gRGF2aWQg
SGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Cj4+PiB3cm90ZToKPj4+Pgo+Pj4+IFJhbmRv
bSBkcml2ZXJzIHNob3VsZCBub3Qgb3ZlcnJpZGUgYSB1c2VyIGNvbmZpZ3VyYXRpb24gb2YgY29y
ZSBrbm9icwo+Pj4+IChlLmcuLCBDT05GSUdfRE1BX0NNQT1uKS4gQXBwbGljYWJsZSBkcml2ZXJz
IHdvdWxkIGxpa2UgdG8gdXNlIERNQV9DTUEsCj4+Pj4gd2hpY2ggZGVwZW5kcyBvbiBDTUEsIGlm
IHBvc3NpYmxlOyBob3dldmVyLCB0aGVzZSBkcml2ZXJzIGFsc28gaGF2ZSB0bwo+Pj4+IHRvbGVy
YXRlIGlmIERNQV9DTUEgaXMgbm90IGF2YWlsYWJsZS9mdW5jdGlvbmluZywgZm9yIGV4YW1wbGUs
IGlmIG5vIENNQQo+Pj4+IGFyZWEgZm9yIERNQV9DTUEgdXNlIGhhcyBiZWVuIHNldHVwIHZpYSAi
Y21hPVgiLiBJbiB0aGUgd29yc3QgY2FzZSwgdGhlCj4+Pj4gZHJpdmVyIGNhbm5vdCBkbyBpdCdz
IGpvYiBwcm9wZXJseSBpbiBzb21lIGNvbmZpZ3VyYXRpb25zLgo+Pj4+Cj4+Pj4gRm9yIGV4YW1w
bGUsIGNvbW1pdCA2M2Y1Njc3NTQ0YjMgKCJkcm0vZXRuYXZpdjogc2VsZWN0IENNQSBhbmQKPj4+
PiBETUFfQ01BIGlmCj4+Pj4gYXZhaWxhYmxlIikgZG9jdW1lbnRzCj4+Pj4gIMKgwqDCoMKgwqDC
oMKgwqAgV2hpbGUgdGhpcyBpcyBubyBidWlsZCBkZXBlbmRlbmN5LCBldG5hdml2IHdpbGwgb25s
eSB3b3JrCj4+Pj4gY29ycmVjdGx5Cj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgb24gbW9zdCBzeXN0
ZW1zIGlmIENNQSBhbmQgRE1BX0NNQSBhcmUgZW5hYmxlZC4gU2VsZWN0IGJvdGgKPj4+PiBvcHRp
b25zCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgaWYgYXZhaWxhYmxlIHRvIGF2b2lkIHVzZXJzIGVu
ZGluZyB1cCB3aXRoIGEgbm9uLXdvcmtpbmcgR1BVCj4+Pj4gZHVlIHRvCj4+Pj4gIMKgwqDCoMKg
wqDCoMKgwqAgYSBsYWNraW5nIGtlcm5lbCBjb25maWcuCj4+Pj4gU28gZXRuYXZpdiByZWFsbHkg
d2FudHMgdG8gaGF2ZSBETUFfQ01BLCBob3dldmVyLCBjYW4gZGVhbCB3aXRoIHNvbWUKPj4+PiBj
YXNlcwo+Pj4+IHdoZXJlIGl0IGlzIG5vdCBhdmFpbGFibGUuCj4+Pj4KPj4+PiBMZXQncyBpbnRy
b2R1Y2UgV0FOVF9ETUFfQ01BIGFuZCB1c2UgaXQgaW4gbW9zdCBjYXNlcyB3aGVyZSBkcml2ZXJz
Cj4+Pj4gc2VsZWN0IENNQS9ETUFfQ01BLCBvciBkZXBlbmQgb24gRE1BX0NNQSAoaW4gYSB3cm9u
ZyB3YXkgdmlhIENNQSBiZWNhdXNlCj4+Pj4gb2YgcmVjdXJzaXZlIGRlcGVuZGVuY3kgaXNzdWVz
KS4KPj4+Pgo+Pj4+IFdlJ2xsIGFzc3VtZSB0aGF0IGFueSBkcml2ZXIgdGhhdCBzZWxlY3RzIERS
TV9HRU1fQ01BX0hFTFBFUiBvcgo+Pj4+IERSTV9LTVNfQ01BX0hFTFBFUiB3b3VsZCBsaWtlIHRv
IHVzZSBETUFfQ01BIGlmIHBvc3NpYmxlLgo+Pj4+Cj4+Pj4gV2l0aCB0aGlzIGNoYW5nZSwgZGlz
dHJpYnV0aW9ucyBjYW4gZGlzYWJsZSBDT05GSUdfQ01BIG9yCj4+Pj4gQ09ORklHX0RNQV9DTUEs
IHdpdGhvdXQgaXQgc2lsZW50bHkgZ2V0dGluZyBlbmFibGVkIGFnYWluIGJ5IHJhbmRvbQo+Pj4+
IGRyaXZlcnMuIEFsc28sIHdlJ2xsIG5vdyBhdXRvbWF0aWNhbGx5IHRyeSB0byBlbmFibGVkIGJv
dGgsIENPTkZJR19DTUEKPj4+PiBhbmQgQ09ORklHX0RNQV9DTUEgaWYgdGhleSBhcmUgdW5zcGVj
aWZpZWQgYW5kIGFueSBkcml2ZXIgaXMgYXJvdW5kIHRoYXQKPj4+PiBzZWxlY3RzIFdBTlRfRE1B
X0NNQSAtLSBhbHNvIGltcGxpY2l0bHkgdmlhIERSTV9HRU1fQ01BX0hFTFBFUiBvcgo+Pj4+IERS
TV9LTVNfQ01BX0hFTFBFUi4KPj4+Pgo+Pj4+IEZvciBleGFtcGxlLCBpZiBhbnkgZHJpdmVyIHNl
bGVjdHMgV0FOVF9ETUFfQ01BIGFuZCB3ZSBkbyBhCj4+Pj4gIm1ha2Ugb2xkZGVmY29uZmlnIjoK
Pj4+Pgo+Pj4+IDEuIFdpdGggIiMgQ09ORklHX0NNQSBpcyBub3Qgc2V0IiBhbmQgbm8gc3BlY2lm
aWNhdGlvbiBvZgo+Pj4+ICDCoMKgwqAgIkNPTkZJR19ETUFfQ01BIgo+Pj4+Cj4+Pj4gLT4gQ09O
RklHX0RNQV9DTUEgd29uJ3QgYmUgcGFydCBvZiAuY29uZmlnCj4+Pj4KPj4+PiAyLiBXaXRoIG5v
IHNwZWNpZmljYXRpb24gb2YgQ09ORklHX0NNQSBvciBDT05GSUdfRE1BX0NNQQo+Pj4+Cj4+Pj4g
Q29udGlndW91cyBNZW1vcnkgQWxsb2NhdG9yIChDTUEpIFtZL24vP10gKE5FVykKPj4+PiBETUEg
Q29udGlndW91cyBNZW1vcnkgQWxsb2NhdG9yIChETUFfQ01BKSBbWS9uLz9dIChORVcpCj4+Pj4K
Pj4+PiAzLiBXaXRoICIjIENPTkZJR19DTUEgaXMgbm90IHNldCIgYW5kICIjIENPTkZJR19ETUFf
Q01BIGlzIG5vdCBzZXQiCj4+Pj4KPj4+PiAtPiBDT05GSUdfRE1BX0NNQSB3aWxsIGJlIHJlbW92
ZWQgZnJvbSAuY29uZmlnCj4+Pj4KPj4+PiBOb3RlOiBkcml2ZXJzL3JlbW90ZXByb2Mgc2VlbXMg
dG8gYmUgc3BlY2lhbDsgY29tbWl0IGM1MWU4ODJjZDcxMQo+Pj4+ICgicmVtb3RlcHJvYy9kYXZp
bmNpOiBVcGRhdGUgS2NvbmZpZyB0byBkZXBlbmQgb24gRE1BX0NNQSIpIGV4cGxhaW5zCj4+Pj4g
dGhhdAo+Pj4+IHRoZXJlIGlzIGEgcmVhbCBkZXBlbmRlbmN5IHRvIERNQV9DTUEgZm9yIGl0IHRv
IHdvcms7IGxlYXZlIHRoYXQKPj4+PiBkZXBlbmRlbmN5Cj4+Pj4gaW4gcGxhY2UgYW5kIGRvbid0
IGNvbnZlcnQgaXQgdG8gYSBzb2Z0IGRlcGVuZGVuY3kuCj4+Pgo+Pj4gSSBkb24ndCB0aGluayB0
aGlzIGRlcGVuZGVuY3kgaXMgZnVuZGFtZW50YWxseSBkaWZmZXJlbnQgZnJvbSB0aGUgb3RoZXJz
LAo+Pj4gdGhvdWdoIGRhdmluY2kgbWFjaGluZXMgdGVuZCB0byBoYXZlIGxlc3MgbWVtb3J5IHRo
YW4gYSBsb3Qgb2YgdGhlCj4+PiBvdGhlciBtYWNoaW5lcywgc28gaXQncyBtb3JlIGxpa2VseSB0
byBmYWlsIHdpdGhvdXQgQ01BLgo+Pj4KPj4KPj4gSSB3YXMgYWxzbyB1bnN1cmUgLSBhbmQgTHVj
YXMgaGFkIHNpbWlsYXIgdGhvdWdodHMuIElmIHlvdSB3YW50LCBJIGNhbgo+PiBzZW5kIGEgdjQg
YWxzbyB0YWtpbmcgY2FyZSBvZiB0aGlzLgo+IAo+IFRCSCBJIHRoaW5rIGl0IHNob3VsZCBhbGwg
anVzdCBiZSByZW1vdmVkLiBETUFfQ01BIGlzIGVmZmVjdGl2ZWx5IGFuCj4gaW50ZXJuYWwgZmVh
dHVyZSBvZiB0aGUgRE1BIEFQSSwgYW5kIGRyaXZlcnMgd2hpY2ggc2ltcGx5IHVzZSB0aGUgRE1B
Cj4gQVBJIHNob3VsZG4ndCByZWFsbHkgYmUgdHJ5aW5nIHRvIGFzc3VtZSAqaG93KiB0aGluZ3Mg
bWlnaHQgYmUgYWxsb2NhdGVkCj4gYXQgcnVudGltZSAtIENNQSBpcyBoYXJkbHkgdGhlIG9ubHkg
d2F5LiBQbGF0Zm9ybS1sZXZlbCBhc3N1bXB0aW9ucwo+IGFib3V0IHRoZSBwcmVzZW5jZSBvciBu
b3Qgb2YgSU9NTVVzLCBtZW1vcnkgY2FydmVvdXRzLCBldGMuLCBhbmQgd2hldGhlcgo+IGl0IGV2
ZW4gbWF0dGVycyAtIGUuZy4gYSBkZXZpY2Ugd2l0aCBhIHRpbnkgTENEIG1heSBvbmx5IG5lZWQg
ZGlzcGxheQo+IGJ1ZmZlcnMgd2hpY2ggc3RpbGwgZml0IGluIGEgcmVndWxhciBNQVhfT1JERVIg
YWxsb2NhdGlvbiAtIGNvdWxkIGdvIGluCj4gcGxhdGZvcm0tc3BlY2lmaWMgY29uZmlncywgYnV0
IEkgcmVhbGx5IGRvbid0IHRoaW5rIHRoZXkgYmVsb25nIGF0IHRoZQo+IGdlbmVyaWMgc3Vic3lz
dGVtIGxldmVsLgo+IAo+IFdlIGFscmVhZHkgaGF2ZSB2YXJpb3VzIGV4YW1wbGVzIGxpa2UgSTJT
IGRyaXZlcnMgdGhhdCB3b24ndCBldmVuIHByb2JlCj4gd2l0aG91dCBhIGRtYWVuZ2luZSBwcm92
aWRlciBiZWluZyBwcmVzZW50LCBvciBob3N0IGNvbnRyb2xsZXIgZHJpdmVycwo+IHdoaWNoIGFy
ZSB1c2VsZXNzIHdpdGhvdXQgdGhlaXIgY29ycmVzcG9uZGluZyBwaHkgZHJpdmVyIChhbmQgSSdt
Cj4gZ3Vlc3NpbmcgeW91IGNhbiBwcm9iYWJseSBhbHNvIGRvIGhpZ2hlci1sZXZlbCB0aGluZ3Mg
bGlrZSBpbmNsdWRlIHRoZQo+IGJsb2NrIGxheWVyIGJ1dCBvbWl0IGFsbCBmaWxlc3lzdGVtIGRy
aXZlcnMpLiBJIGRvbid0IGJlbGlldmUgaXQncwo+IEtjb25maWcncyBqb2IgdG8gdHJ5IHRvIGd1
ZXNzIHdoZXRoZXIgYSBnaXZlbiBjb25maWd1cmF0aW9uIGlzICp1c2VmdWwqLAo+IG9ubHkgdG8g
ZW5mb3JjZSB0aGF0J3MgaXQncyB2YWxpZCB0byBidWlsZC4KClRoYXQgd291bGQgbWVhbjogaWYg
aXQncyBub3QgYSBidWlsdC10aW1lIGRlcGVuZGVuY3ksIGRvbid0IG1lbnRpb24gaXQgCmluIEtj
b25maWcuCgpJZiB0aGF0IHdlcmUgdHJ1ZSwgd2h5IGRvIHdlIGhhdmUgaGF2ZSBkZWZhdWx0cyBt
b2RlbGVkIGluIEtjb25maWcgdGhlbj8KCklNSE8sIHNvbWUgcGFydCBvZiBLY29uZmlnIGlzIHRv
IGdpdmUgeW91IHNhbmUgZGVmYXVsdHMuCgotLSAKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
