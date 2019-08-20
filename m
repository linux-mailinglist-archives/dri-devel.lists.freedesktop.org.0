Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAB29738C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BF26E927;
	Wed, 21 Aug 2019 07:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEE46E82E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 15:27:15 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id i4so6454950qtj.8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 08:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yW4ipw+ijUAP2Q3jnbjwYqx48ceAaeyZl32HjbZvBF8=;
 b=qW4kV54btRzzkZYsl4+3IbciIOBCnj/ZY2AbrOLm3Xct60Uws3DaH+vZ2dPqZl3ITI
 Z1apMBhpfD0bUevTn4YhSPD0YWoWkrszosKOUZKJEFJzjEHdSmhAIv3ygSmdKvsHS7JV
 VZwQx3oIcN9+kxK8WwzUeKttEZ2Txo052thrAuJOfqOjnHJcBLhe1wagDqXJfaUvyTuD
 CSdH7uE+ThN5WNVS6NybqwDWV9QxH6h5jrQZ+sddnjJEM6ZR6hrCihlLUY8mJ+8Sh9t6
 P9gIu0y/XzFJSS3KYcKXJ4NFQtHLga9B55O27l1ml51wYKHabyEq/339XmdLtU46/AMA
 n8hg==
X-Gm-Message-State: APjAAAWECNVBIYWfYDqH77Sf/i4WfGQagBHtvgKO5CYRU/r0Fens6apG
 PVgolEp/w9mD7lXDaLxgXzZ2uw==
X-Google-Smtp-Source: APXvYqzLDWQu/fkE06n1IL3PlMALP6ghZ2NAMT8nSJjaAYIB+Oofjqoc+iLByXPCaoCuZbKxUT21Ng==
X-Received: by 2002:ac8:48c1:: with SMTP id l1mr27197055qtr.251.1566314833307; 
 Tue, 20 Aug 2019 08:27:13 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id d12sm8931802qkk.39.2019.08.20.08.27.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 20 Aug 2019 08:27:12 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1i062S-0000PN-G3; Tue, 20 Aug 2019 12:27:12 -0300
Date: Tue, 20 Aug 2019 12:27:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>,
 David Rientjes <rientjes@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH 4/4] mm, notifier: Catch sleeping/blocking for !blockable
Message-ID: <20190820152712.GH29246@ziepe.ca>
References: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
 <20190820081902.24815-5-daniel.vetter@ffwll.ch>
 <20190820133418.GG29246@ziepe.ca>
 <20190820151810.GG11147@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820151810.GG11147@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:33:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yW4ipw+ijUAP2Q3jnbjwYqx48ceAaeyZl32HjbZvBF8=;
 b=QqsPJhXRoBXVjmCrsAFdhiaITVfXqO2ZbJBdqsS+9/ZmosuBXqYxWmNMrXR9TnpuUi
 QlLlAbE7omSK3rDBbAA43cD05WXgrc1Cd6jrfMZkVfD3xtp91Pks6Q/39uGWa+yOwJ/U
 x4/6+nJFRPi5XiAxs8pJ0RCXRx4TaUPN34lZQGHafrWL31jEoG5n4NHsJbl1H3ahi4kl
 XvIe+6IfT7lC6koxxwohKTu2HPDLEzE7wDyPYYD4R51boRvsJeGqsyrtz9tg4s0g9Iqq
 c0bs9IDpm44eGml2+iL4uiImn7byYZ5Mvqulc8EmX+SnUiDF8j9kAMFrtlLv8QR2lihE
 8hmQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMDU6MTg6MTBQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiA+ID4gZGlmZiAtLWdpdCBhL21tL21tdV9ub3RpZmllci5jIGIvbW0vbW11X25vdGlm
aWVyLmMKPiA+ID4gaW5kZXggNTM4ZDNiYjg3ZjliLi44NTY2MzZkMDZlZTAgMTAwNjQ0Cj4gPiA+
ICsrKyBiL21tL21tdV9ub3RpZmllci5jCj4gPiA+IEBAIC0xODEsNyArMTgxLDEzIEBAIGludCBf
X21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHN0cnVjdCBtbXVfbm90aWZpZXJf
cmFuZ2UgKnJhbmdlKQo+ID4gPiAgCWlkID0gc3JjdV9yZWFkX2xvY2soJnNyY3UpOwo+ID4gPiAg
CWhsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdShtbiwgJnJhbmdlLT5tbS0+bW11X25vdGlmaWVyX21t
LT5saXN0LCBobGlzdCkgewo+ID4gPiAgCQlpZiAobW4tPm9wcy0+aW52YWxpZGF0ZV9yYW5nZV9z
dGFydCkgewo+ID4gPiAtCQkJaW50IF9yZXQgPSBtbi0+b3BzLT5pbnZhbGlkYXRlX3JhbmdlX3N0
YXJ0KG1uLCByYW5nZSk7Cj4gPiA+ICsJCQlpbnQgX3JldDsKPiA+ID4gKwo+ID4gPiArCQkJaWYg
KCFtbXVfbm90aWZpZXJfcmFuZ2VfYmxvY2thYmxlKHJhbmdlKSkKPiA+ID4gKwkJCQlub25fYmxv
Y2tfc3RhcnQoKTsKPiA+ID4gKwkJCV9yZXQgPSBtbi0+b3BzLT5pbnZhbGlkYXRlX3JhbmdlX3N0
YXJ0KG1uLCByYW5nZSk7Cj4gPiA+ICsJCQlpZiAoIW1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2Fi
bGUocmFuZ2UpKQo+ID4gPiArCQkJCW5vbl9ibG9ja19lbmQoKTsKPiA+IAo+ID4gSWYgc29tZW9u
ZSBBY2tzIGFsbCB0aGUgc2NoZWQgY2hhbmdlcyB0aGVuIEkgY2FuIHBpY2sgdGhpcyBmb3IKPiA+
IGhtbS5naXQsIGJ1dCBJIHN0aWxsIHRoaW5rIHRoZSBleGlzdGluZyBwcmUtZW1wdGlvbiBkZWJ1
Z2dpbmcgaXMgZmluZQo+ID4gZm9yIHRoaXMgdXNlIGNhc2UuCj4gCj4gT2ssIEknbGwgcGluZyBQ
ZXRlciBaLiBmb3IgYW4gYWNrLCBpaXJjIGhlIHdhcyBpbnZvbHZlZC4KPiAKPiA+IEFsc28sIHNh
bWUgY29tbWVudCBhcyBmb3IgdGhlIGxvY2tkZXAgbWFwLCB0aGlzIG5lZWRzIHRvIGFwcGx5IHRv
IHRoZQo+ID4gbm9uLWJsb2NraW5nIHJhbmdlX2VuZCBhbHNvLgo+IAo+IEhtLCBJIHRob3VnaHQg
dGhlIHBhZ2UgdGFibGUgbG9ja3Mgd2UncmUgaG9sZGluZyB0aGVyZSBhbHJlYWR5IHByZXZlbnQg
YW55Cj4gc2xlZXBpbmcsIHNvIHdvdWxkIGJlIHJlZHVuZGFudD8KCkFGQUlLIG5vLiBBbGwgY2Fs
bGVycyBvZiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0L2VuZCBwYWlycyBkbyBzbyBhIGZldwpsaW5l
cyBhcGFydCBhbmQgZG9uJ3QgY2hhbmdlIHRoZWlyIGxvY2tpbmcgaW4gYmV0d2VlbiAtIHRodXMg
c2luY2UKc3RhcnQgY2FuIGJsb2NrIHNvIGNhbiBlbmQuCgpXb3VsZCBsb3ZlIHRvIGtub3cgaWYg
dGhhdCBpcyBub3QgdHJ1ZT8/CgpTaW1pbGFybHkgSSd2ZSBhbHNvIGJlZW4gaWRseSB3b25kZXJp
bmcgaWYgd2Ugc2hvdWxkIGFkZCBhCidtaWdodF9zbGVlcCgpJyB0byBpbnZhbGlkYXRlX3Jhbmdl
c3RhcnQvZW5kKCkgdG8gbWFrZSB0aGlzIGNvbnN0cmFpbnQKY2xlYXIgJiB0ZXN0ZWQgdG8gdGhl
IG1tIHNpZGU/CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
