Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31714FAFE9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 12:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8B489D02;
	Wed, 13 Nov 2019 11:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095486ECE5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 11:43:15 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z10so1952558wrs.12
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 03:43:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=NWmx5zlrVzI636UV5zn7jwNNYyPpT2kzazOSeqZFCPQ=;
 b=I07dfz+TLbOTgKzgN2GaZbWqbu1VuHjot0X+Bu9eP+0qhxecIgj33yTVU+NQkIo61e
 1o10hNsEFJMU6qz3L5zR2+3JVVMPOVXZCbSA3oLPAkq5uIHiZGY0ZzUvz7rJsxVzI579
 +fCPTNwL/6UHdSgER3f55rMJsQQ67kHzKR4/bfWVQ7Kyjg62EqN4xkmkdazRaFCv6gCP
 AM0ZgyudHmsgWshAk7MXY3i3YmwYXbXsmKUQQto84IQz2YMwB8oMcTg+ptbgFRy1u26q
 hApe5KrnIuQ4uOcr0qUc8BAIYsExFy5u5pkEZBiAPNf5yKId8BJPuSteuP+yMlhKrQQh
 z4CQ==
X-Gm-Message-State: APjAAAVOyCSojYpQmhEcaFAeccoNV8M+23W7LFMpOHPpeihRkFJWEcCJ
 pGvaqUlx1ydlapvtudoaay51aA==
X-Google-Smtp-Source: APXvYqw4ALVmGTh9KFISsJCvLVpFEzXuyu2WMWEkcAdM7khXUlUWKA93QR1nKFP8k/o5YdLFIE0ItA==
X-Received: by 2002:a5d:50ce:: with SMTP id f14mr2625324wrt.219.1573645394576; 
 Wed, 13 Nov 2019 03:43:14 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id w4sm2544060wrs.1.2019.11.13.03.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 03:43:13 -0800 (PST)
Date: Wed, 13 Nov 2019 12:43:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v3 00/23] mm/gup: track dma-pinned pages: FOLL_PIN,
 FOLL_LONGTERM
Message-ID: <20191113114311.GP23790@phenom.ffwll.local>
Mail-Followup-To: Jan Kara <jack@suse.cz>,
 John Hubbard <jhubbard@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Alex Williamson <alex.williamson@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 Christoph Hellwig <hch@infradead.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Chinner <david@fromorbit.com>, David Airlie <airlied@linux.ie>,
 "David S . Miller" <davem@davemloft.net>,
 Ira Weiny <ira.weiny@intel.com>, Jens Axboe <axboe@kernel.dk>,
 Jonathan Corbet <corbet@lwn.net>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Paul Mackerras <paulus@samba.org>, Shuah Khan <shuah@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, bpf <bpf@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kvm@vger.kernel.org,
 linux-block@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 linux-rdma@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 netdev <netdev@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112203802.GD5584@ziepe.ca>
 <02fa935c-3469-b766-b691-5660084b60b9@nvidia.com>
 <CAKMK7uHvk+ti00mCCF2006U003w1dofFg9nSfmZ4bS2Z2pEDNQ@mail.gmail.com>
 <7b671bf9-4d94-f2cc-8453-863acd5a1115@nvidia.com>
 <20191113101210.GD6367@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113101210.GD6367@quack2.suse.cz>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=NWmx5zlrVzI636UV5zn7jwNNYyPpT2kzazOSeqZFCPQ=;
 b=C0Dbe7TCduZqSim4I/9b7E74bGQO34GH/iKoO+dE+3EHLfWv1lLPGbvorBCoaRGMDb
 48v7HTSQHP1LaVgvLNGy/yOxyJTlvTeKuq2CZR/Q7GIgmnQIbkvYhHi8TV/Ec+0WSA8P
 awH+k+k5IQBNK5RO6uqKbJl7dFmz19ED4sy2I=
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
Cc: Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf <bpf@vger.kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev <netdev@vger.kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMTE6MTI6MTBBTSArMDEwMCwgSmFuIEthcmEgd3JvdGU6
Cj4gT24gV2VkIDEzLTExLTE5IDAxOjAyOjAyLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gPiBPbiAx
MS8xMy8xOSAxMjoyMiBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IC4uLgo+ID4gPiA+ID4g
V2h5IGFyZSB3ZSBkb2luZyB0aGlzPyBJIHRoaW5rIHRoaW5ncyBnb3QgY29uZnVzZWQgaGVyZSBz
b21lcGxhY2UsIGFzCj4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gQmVjYXVzZToKPiA+ID4gPiAK
PiA+ID4gPiBhKSBUaGVzZSBuZWVkIHB1dF9wYWdlKCkgY2FsbHMsICBhbmQKPiA+ID4gPiAKPiA+
ID4gPiBiKSB0aGVyZSBpcyBubyBwdXRfcGFnZXMoKSBjYWxsLCBidXQgdGhlcmUgaXMgYSByZWxl
YXNlX3BhZ2VzKCkgY2FsbCB0aGF0Cj4gPiA+ID4gaXMsIGFyZ3VhYmx5LCB3aGF0IHB1dF9wYWdl
cygpIHdvdWxkIGJlLgo+ID4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+ID4gdGhlIGNvbW1lbnQgc3Rp
bGwgc2F5czoKPiA+ID4gPiA+IAo+ID4gPiA+ID4gLyoqCj4gPiA+ID4gPiAgICogcHV0X3VzZXJf
cGFnZSgpIC0gcmVsZWFzZSBhIGd1cC1waW5uZWQgcGFnZQo+ID4gPiA+ID4gICAqIEBwYWdlOiAg
ICAgICAgICAgIHBvaW50ZXIgdG8gcGFnZSB0byBiZSByZWxlYXNlZAo+ID4gPiA+ID4gICAqCj4g
PiA+ID4gPiAgICogUGFnZXMgdGhhdCB3ZXJlIHBpbm5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCkg
bXVzdCBiZSByZWxlYXNlZCB2aWEKPiA+ID4gPiA+ICAgKiBlaXRoZXIgcHV0X3VzZXJfcGFnZSgp
LCBvciBvbmUgb2YgdGhlIHB1dF91c2VyX3BhZ2VzKigpIHJvdXRpbmVzCj4gPiA+ID4gPiAgICog
YmVsb3cuCj4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gT2hoaCwgSSBtaXNzZWQgdGhvc2UgY29t
bWVudHMuIFRoZXkgbmVlZCB0byBhbGwgYmUgY2hhbmdlZCBvdmVyIHRvCj4gPiA+ID4gc2F5ICJw
YWdlcyB0aGF0IHdlcmUgcGlubmVkIHZpYSBwaW5fdXNlcl9wYWdlcyooKSBvcgo+ID4gPiA+IHBp
bl9sb25ndGVybV9wYWdlcyooKSBtdXN0IGJlIHJlbGVhc2VkIHZpYSBwdXRfdXNlcl9wYWdlKigp
LiIKPiA+ID4gPiAKPiA+ID4gPiBUaGUgZ2V0X3VzZXJfcGFnZXMqKCkgcGFnZXMgbXVzdCBzdGls
bCBiZSByZWxlYXNlZCB2aWEgcHV0X3BhZ2UuCj4gPiA+ID4gCj4gPiA+ID4gVGhlIGNodXJuIGlz
IGR1ZSB0byBhIGZhaXJseSBzaWduaWZpY2FudCBjaGFuZ2UgaW4gc3RyYXRlZ3ksIHdoaXMKPiA+
ID4gPiBpczogaW5zdGVhZCBvZiBjaGFuZ2luZyBhbGwgZ2V0X3VzZXJfcGFnZXMqKCkgc2l0ZXMg
dG8gY2FsbAo+ID4gPiA+IHB1dF91c2VyX3BhZ2UoKSwgY2hhbmdlIHNlbGVjdGVkIHNpdGVzIHRv
IGNhbGwgcGluX3VzZXJfcGFnZXMqKCkgb3IKPiA+ID4gPiBwaW5fbG9uZ3Rlcm1fcGFnZXMqKCks
IHBsdXMgcHV0X3VzZXJfcGFnZSgpLgo+ID4gPiAKPiA+ID4gQ2FuJ3Qgd2UgY2FsbCB0aGlzIHVu
cGluX3VzZXJfcGFnZSB0aGVuLCBmb3Igc29tZSBzeW1tZXRyeT8gT3IgaXMgdGhhdAo+ID4gPiBl
dmVuIG1vcmUgY2h1cm4/Cj4gPiA+IAo+ID4gPiBMb29raW5nIGZyb20gYWZhciB0aGUgbmFtaW5n
IGhlcmUgc2VlbXMgcmVhbGx5IGNvbmZ1c2luZy4KPiA+IAo+ID4gCj4gPiBUaGF0IGxvb2sgZnJv
bSBhZmFyIGlzIHZhbHVhYmxlLCBiZWNhdXNlIEknbSB0b28gY2xvc2UgdG8gdGhlIHByb2JsZW0g
dG8gc2VlCj4gPiBob3cgdGhlIG5hbWluZyBsb29rcy4gOikKPiA+IAo+ID4gdW5waW5fdXNlcl9w
YWdlKCkgc291bmRzIHN5bW1ldHJpY2FsLiBJdCdzIHRydWUgdGhhdCBpdCB3b3VsZCBjYXVzZSBt
b3JlCj4gPiBjaHVybiAod2hpY2ggaXMgd2h5IEkgc3RhcnRlZCBvZmYgd2l0aCBhIHByb3Bvc2Fs
IHRoYXQgYXZvaWRzIGNoYW5naW5nIHRoZQo+ID4gbmFtZXMgb2YgcHV0X3VzZXJfcGFnZSooKSBB
UElzKS4gQnV0IE9UT0gsIHRoZSBhbW91bnQgb2YgY2h1cm4gaXMgcHJvcG9ydGlvbmFsCj4gPiB0
byB0aGUgY2hhbmdlIGluIGRpcmVjdGlvbiBoZXJlLCBhbmQgaXQncyByZWFsbHkgb25seSAxMCBv
ciAyMCBsaW5lcyBjaGFuZ2VkLAo+ID4gaW4gdGhlIGVuZC4KPiA+IAo+ID4gU28gSSdtIG9wZW4g
dG8gY2hhbmdpbmcgdG8gdGhhdCBuYW1pbmcuIEl0IHdvdWxkIGJlIG5pY2UgdG8gaGVhciB3aGF0
IG90aGVycwo+ID4gcHJlZmVyLCB0b28uLi4KPiAKPiBGV0lXIEknZCBmaW5kIHVucGluX3VzZXJf
cGFnZSgpIGFsc28gYmV0dGVyIHRoYW4gcHV0X3VzZXJfcGFnZSgpIGFzIGEKPiBjb3VudGVycGFy
dCB0byBwaW5fdXNlcl9wYWdlcygpLgoKT25lIG1vcmUgcG9pbnQgZnJvbSBhZmFyIG9uIHBpbi91
bnBpbjogV2UgdXNlIHRoYXQgYSBsb3QgaW4gZ3JhcGhpY3MgZm9yCnBlcm1hbmVudGx5IHBpbm5l
ZCBncmFwaGljcyBidWZmZXIgb2JqZWN0cy4gV2hpY2ggcmVhbGx5IG9ubHkgc2hvdWxkIGJlCnVz
ZWQgZm9yIHNjYW5vdXQuIFNvIGF0IGxlYXN0IGdyYXBoaWNzIGZvbGtzIHNob3VsZCBoYXZlIGFu
IGFwcHJvcHJpYXRlCm1pbmRzZXQgYW5kIHRyeSB0byBtYWtlIHN1cmUgd2UgZG9uJ3Qgb3ZlcnVz
ZSB0aGlzIHN0dWZmLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVy
LCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
