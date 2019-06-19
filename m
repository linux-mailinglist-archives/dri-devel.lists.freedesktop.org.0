Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 892284C7F1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650FB6E4F3;
	Thu, 20 Jun 2019 07:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B3D6E44B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 18:19:25 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id n11so148845qtl.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 11:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j+sIitK0Ja8Ov8ieeJfPWbN0YkrvgCIASmHhWLMuHLw=;
 b=UeAtXC4e+JoQAoJnAf03yLms5OJ5JiLGOuqUkWvOnUZ13pj7R4ibtEZ+3JZOHF5u9P
 s1e2K08Q6BotRQbswzC+PgIST6XBJBCkQUSXjvX6gxwNuhWve5ZexrNAWrJ59Y0zCiOc
 8tqiEY7yxvY46GQkBpAPyd1/wciOYszn49/rL50keddXP8hBxBGFFO8hKRr8cwpZ98V3
 2Ft9U/nCF+8sGu4/L3z7BlhL6YYIlnxg14DCUHLIyvSOvyoxuYItWjSTh6z9AwN7V56W
 DRO9qBFsAn1gukwyDYLNWpn8yF2RyrbNpLEGStJGzcpwB4CeHS0A9Gpi2vyUPa8bclul
 ylYw==
X-Gm-Message-State: APjAAAXOQkf6Mzmp69wMVNENzb/hYMI+wqP6osJtmO5lGka7/2Afzzin
 LZg+bSxUCKvM8BXrsv1Vllbo4w==
X-Google-Smtp-Source: APXvYqwc1d95Ltcmqx/CriKy9P5GUR2ZkHf3pjzc5gWGdXWLliAR4hpwJBxDIhEgyrqz+pevhmgebw==
X-Received: by 2002:aed:3e7c:: with SMTP id
 m57mr102301688qtf.204.1560968364678; 
 Wed, 19 Jun 2019 11:19:24 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id 15sm10668885qtf.2.2019.06.19.11.19.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Jun 2019 11:19:23 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hdfB5-0002ic-8m; Wed, 19 Jun 2019 15:19:23 -0300
Date: Wed, 19 Jun 2019 15:19:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: dev_pagemap related cleanups v2
Message-ID: <20190619181923.GJ9360@ziepe.ca>
References: <20190617122733.22432-1-hch@lst.de>
 <CAPcyv4hBUJB2RxkDqHkfEGCupDdXfQSrEJmAdhLFwnDOwt8Lig@mail.gmail.com>
 <20190619094032.GA8928@lst.de> <20190619163655.GG9360@ziepe.ca>
 <CAPcyv4hYtQdg0DTYjrJxCNXNjadBSWQ5QaMJYsA-QSribKuwrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4hYtQdg0DTYjrJxCNXNjadBSWQ5QaMJYsA-QSribKuwrQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=j+sIitK0Ja8Ov8ieeJfPWbN0YkrvgCIASmHhWLMuHLw=;
 b=EoBDSvdHfhYd93z8CePBywWHH5bXHAGcXWzOuMLu3/Uzv0MQq7Oam+sAX1Fb7CAk0c
 TJxbr4Wv0/dsOhypCrBG1Gfvu19Gzh1Rl4YrdYTtyiZDVpGot3JGHQS4tKbhDA26+wlS
 NHg9l8u9uVqf2htEjwoSE6SLxVUtPcB5jBlkv236SpPAneNbIGgeXlwOnBB5O/O/foEB
 sQIAgR9sw9NI31785FF4XFeb1aYwjw7IbmedaRaHIZxAz3ePgaJLV84aScqYjsfBC/4L
 bnWCVKMh/fD+HbDYkyAoE78LoiM2L5ceAP3zZNYP8wXBSrgjxJLnv97UmhMOWJKLoWl3
 j/rQ==
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDk6NDY6MjNBTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+IE9uIFdlZCwgSnVuIDE5LCAyMDE5IGF0IDk6MzcgQU0gSmFzb24gR3VudGhvcnBlIDxq
Z2dAemllcGUuY2E+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgSnVuIDE5LCAyMDE5IGF0IDExOjQw
OjMyQU0gKzAyMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gPiBPbiBUdWUsIEp1biAx
OCwgMjAxOSBhdCAxMjo0NzoxMFBNIC0wNzAwLCBEYW4gV2lsbGlhbXMgd3JvdGU6Cj4gPiA+ID4g
PiBHaXQgdHJlZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgZ2l0Oi8vZ2l0LmluZnJhZGVhZC5v
cmcvdXNlcnMvaGNoL21pc2MuZ2l0IGhtbS1kZXZtZW0tY2xlYW51cC4yCj4gPiA+ID4gPgo+ID4g
PiA+ID4gR2l0d2ViOgo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICBodHRwOi8vZ2l0LmluZnJhZGVh
ZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0L3Nob3J0bG9nL3JlZnMvaGVhZHMvaG1tLWRldm1lbS1j
bGVhbnVwLjIKPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEF0dGFjaGVkIGlzIG15IGluY3JlbWVudGFs
IGZpeHVwcyBvbiB0b3Agb2YgdGhpcyBzZXJpZXMsIHdpdGggdGhvc2UKPiA+ID4gPiBpbnRlZ3Jh
dGVkIHlvdSBjYW4gYWRkOgo+ID4gPgo+ID4gPiBJJ3ZlIGZvbGRlZCB5b3VyIGluY3JlbWVudGFs
IGJpdHMgaW4gYW5kIHB1c2hlZCBvdXQgYSBuZXcKPiA+ID4gaG1tLWRldm1lbS1jbGVhbnVwLjMg
dG8gdGhlIHJlcG8gYWJvdmUuICBMZXQgbWUga25vdyBpZiBJIGRpZG4ndCBtZXNzCj4gPiA+IHVw
IGFueXRoaW5nIGVsc2UuICBJJ2xsIHdhaXQgZm9yIGEgZmV3IG1vcmUgY29tbWVudHMgYW5kIEph
c29uJ3MKPiA+ID4gcGxhbm5lZCByZWJhc2Ugb2YgdGhlIGhtbSBicmFuY2ggYmVmb3JlIHJlcG9z
dGluZy4KPiA+Cj4gPiBJIHNhaWQgSSB3b3VsZG4ndCByZWJhc2UgdGhlIGhtbS5naXQgKGFzIGl0
IG5lZWRzIHRvIGdvIHRvIERSTSwgQU1ECj4gPiBhbmQgUkRNQSBnaXQgdHJlZXMpLi4KPiA+Cj4g
PiBJbnN0ZWFkIEkgd2lsbCBtZXJnZSB2NS4yLXJjNSB0byB0aGUgdHJlZSBiZWZvcmUgYXBwbHlp
bmcgdGhpcyBzZXJpZXMuCj4gPgo+ID4gSSd2ZSB1bmRlcnN0b29kIHRoaXMgdG8gYmUgTGludXMn
cyBwcmVmZXJlZCB3b3JrZmxvdy4KPiA+Cj4gPiBTbywgcGxlYXNlIHNlbmQgdGhlIG5leHQgaXRl
cmF0aW9uIG9mIHRoaXMgYWdhaW5zdCBlaXRoZXIKPiA+IHBsYWludjUuMi1yYzUgb3IgdjUuMi1y
YzUgbWVyZ2VkIHdpdGggaG1tLmdpdCBhbmQgSSdsbCBzb3J0IGl0IG91dC4KPiAKPiBKdXN0IG1h
a2Ugc3VyZSB0aGF0IHdoZW4geW91IGJhY2ttZXJnZSB2NS4yLXJjNSB5b3UgaGF2ZSBhIGNsZWFy
Cj4gcmVhc29uIGluIHRoZSBtZXJnZSBjb21taXQgbWVzc2FnZSBhYm91dCB3aHkgeW91IG5lZWRl
ZCB0byBkbyBpdC4KPiBXaGlsZSBuZWVkbGVzcyByZWJhc2luZyBpcyB0b3Agb2YgdGhlIHBldCBw
ZWV2ZSBsaXN0LCBzZWNvbmQgcGxhY2UsIGFzCj4gSSBmb3VuZCBvdXQsIGlzIG15c3RlcnkgbWVy
Z2VzIHdpdGhvdXQgZXhwbGFuYXRpb25zLgoKWWVzLCBJIGFsd2F5cyBkZXNjcmliZSB0aGUgbWVy
Z2UgY29tbWl0cy4gTGludXMgYWxzbyBwYXJ0aWN1bGFyIGFib3V0CmhhdmluZyAqZ29vZCByZWFz
b25zKiBmb3IgbWVyZ2VzLgoKVGhpcyBpcyB3aHkgSSBjYW4ndCBmaXggdGhlIGhtbS5naXQgdG8g
aGF2ZSByYzUgdW50aWwgSSBoYXZlIHBhdGNoZXMKdG8gYXBwbHkuLgoKUHJvYmJhbHkgSSB3aWxs
IGp1c3QgcHV0IENIJ3Mgc2VyaWVzIG9uIHJjNSBhbmQgbWVyZ2UgaXQgd2l0aCB0aGUKY292ZXIg
bGV0dGVyIGFzIHRoZSBtZXJnZSBtZXNzYWdlLiBUaGlzIGF2b2lkIGJvdGggcmViYXNpbmcgYW5k
IGdpdmVzCnB1cnBvc2VmdWwgbWVyZ2VzLgoKVGhhbmtzLApKYXNvbgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
