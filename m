Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CF62B3F3
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC7789948;
	Mon, 27 May 2019 12:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF356E102
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 12:44:57 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id u4so3433410uau.10
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 05:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=86zgAQfw8EJJS+UNpjxjOFPf8eRhOu/zVe65BnxqX6k=;
 b=A78Rhe08zLMHZpAdmfwTHDQh1J07X54nx2xvr+bmNpWBV46wOjf0bh2SAiThuShMRV
 wMIofqc2ap23pNbvCyFSyMKfOwho7nl6HyVdx04KbJhCcmHZy/6Vmqjq4rijwFTM4ekc
 3kz0sifS7m1xTr0vqZPMQc8Bqm598h5VQzgm3ZomSvwxpN6IOACr8QhO5J90DAzWRUGh
 wS2NilbR6RImLXlbkqI8dMA/pkgzCkIbyzaFolO9P7rl/pCPWtMgzqfHWY+cEPTwXcZ3
 cbCaBAQhUAst/kSoaG2llRNMnnvMjQHIxaDV5OhAJBDYVZsjjI22rgcCw0c1/X5tQdYC
 t3TA==
X-Gm-Message-State: APjAAAUTlmpkuTQZ617QjNWwaPtZZFfA1+mcs+rDELCRoiP0tlIat3V+
 jcRrkmHIoYQJhRiUWTxHvWFfHg==
X-Google-Smtp-Source: APXvYqyEylmmdkAB6AaIhsy3vhee0zusZnFo+WYBZWM/18FEIODicL7EA9MIafCvZ0ZYEzrSfr1ouA==
X-Received: by 2002:ab0:23cd:: with SMTP id c13mr14715196uan.77.1558701896809; 
 Fri, 24 May 2019 05:44:56 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-49-251.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.49.251])
 by smtp.gmail.com with ESMTPSA id x19sm453316vsq.9.2019.05.24.05.44.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 05:44:56 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hU9Z9-0004qz-Fc; Fri, 24 May 2019 09:44:55 -0300
Date: Fri, 24 May 2019 09:44:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>, akpm@linux-foundation.org,
 Dave Airlie <airlied@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: RFC: Run a dedicated hmm.git for 5.3
Message-ID: <20190524124455.GB16845@ziepe.ca>
References: <20190522235737.GD15389@ziepe.ca>
 <20190523150432.GA5104@redhat.com>
 <20190523154149.GB12159@ziepe.ca>
 <20190523155207.GC5104@redhat.com>
 <20190523163429.GC12159@ziepe.ca>
 <20190523173302.GD5104@redhat.com>
 <20190523175546.GE12159@ziepe.ca>
 <20190523182458.GA3571@redhat.com>
 <20190523191038.GG12159@ziepe.ca>
 <20190524064051.GA28855@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524064051.GA28855@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 27 May 2019 12:02:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=86zgAQfw8EJJS+UNpjxjOFPf8eRhOu/zVe65BnxqX6k=;
 b=OwAdPYWwIIhzKIrP9zacmHWALt7WHScrXTSOiHZlMka+qhZn/6McmfKFyb+5mt72A8
 4yZy3bxx8SNsfV/ezDuz1DHppIcgD8780P3ujAMHW+4K+f5RPN2e/31pnlevfPC9Lp+c
 IN1fRiPPUJUb5X4snek7Tvn/JK+pQvE5V97Id1Jk2wzSHpDtKmilz9caWuJ8z3mWEy9q
 AOt6arDl+8e3Fikr/N4U9ap3kxtcaR49d3FGq/xJ5hMQ0ZX/MhCAK0F6obNBUpuZOBis
 qEUp9M8syRwmD9qj3C+L+koiFfG+W4r4XUmdJ49PyV4KvxBT7r7Hdnt9AYt3p/P2fLLt
 SrEg==
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
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>, linux-mm@kvack.org,
 linux-rdma@vger.kernel.org, Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Doug Ledford <dledford@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 Leon Romanovsky <leonro@mellanox.com>, Jerome Glisse <jglisse@redhat.com>,
 Moni Shoua <monis@mellanox.com>, Artemy Kovalyov <artemyko@mellanox.com>,
 Kaike Wan <kaike.wan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMTE6NDA6NTFQTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDQ6MTA6MzhQTSAtMDMwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gCj4gPiBPbiBUaHUsIE1heSAyMywgMjAxOSBhdCAwMjoy
NDo1OFBNIC0wNDAwLCBKZXJvbWUgR2xpc3NlIHdyb3RlOgo+ID4gPiBJIGNhbiBub3QgdGFrZSBt
bWFwX3NlbSBpbiByYW5nZV9yZWdpc3RlciwgdGhlIFJFQURfT05DRSBpcyBmaW5lIGFuZAo+ID4g
PiB0aGV5IGFyZSBubyByYWNlIGFzIHdlIGRvIHRha2UgYSByZWZlcmVuY2Ugb24gdGhlIGhtbSBz
dHJ1Y3QgdGh1cwo+ID4gCj4gPiBPZiBjb3Vyc2UgdGhlcmUgYXJlIHVzZSBhZnRlciBmcmVlIHJh
Y2VzIHdpdGggYSBSRUFEX09OQ0Ugc2NoZW1lLCBJCj4gPiBzaG91bGRuJ3QgaGF2ZSB0byBleHBs
YWluIHRoaXMuCj4gPiAKPiA+IElmIHlvdSBjYW5ub3QgdGFrZSB0aGUgcmVhZCBtbWFwIHNlbSAo
d2h5IG5vdD8pLCB0aGVuIHBsZWFzZSB1c2UgbXkKPiA+IHZlcnNpb24gYW5kIHB1c2ggdGhlIHVw
ZGF0ZSB0byB0aGUgZHJpdmVyIHRocm91Z2ggLW1tLi4KPiAKPiBJIHRoaW5rIGl0IHdvdWxkIHJl
YWxseSBoZWxwIGlmIHdlIHF1ZXVlIHVwIHRoZXNlIGNoYW5nZXMgaW4gYSBnaXQgdHJlZQo+IHRo
YXQgY2FuIGJlIHB1bGxlZCBpbnRvIHRoZSBkcml2ZXIgdHJlZXMuICBHaXZlbiB0aGF0IHlvdSd2
ZSBiZWVuCj4gZG9pbmcgc28gbXVjaCB3b3JrIHRvIGFjdHVhbGx5IG1ha2UgaXQgdXNhYmxlIEkn
ZCBub21pbmF0ZSByZG1hIGZvciB0aGUKPiAibGVhZCIgdHJlZS4KClN1cmUsIEknbSB3aWxsaW5n
IHRvIGRvIHRoYXQuIFJETUEgaGFzIGV4cGVyaWVuY2Ugc3VjY2Vzc2Z1bGx5IHJ1bm5pbmcKc2hh
cmVkIGdpdCB0cmVlcyB3aXRoIG5ldGRldi4gSXQgY2FuIHdvcmsgdmVyeSB3ZWxsLCBidXQgcmVx
dWlyZXMKZGlzY2lwbGluZSBhbmQgdW5kZXJzdGFuZGluZyBvZiB0aGUgbGltaXRhdGlvbnMuCgpJ
IHJlYWxseSB3YW50IHRvIHNlZSB0aGUgY29tcGxldGUgSE1NIHNvbHV0aW9uIGZyb20gSmVyb21l
IChpZSB0aGUKa2NvbmZpZyBmaXhlcywgYXJtNjQsIGFwaSBmaXhlcywgZXRjKSBpbiBvbmUgY29o
ZXNpdmUgdmlldywgbm90CmZvcmNlZCB0byBiZSBzcHJpbmtsZWQgYWNyb3NzIG11bHRpcGxlIGtl
cm5lbCByZWxlYXNlcyB0byB3b3JrIGFyb3VuZAphIHN1Ym1pc3Npb24gcHJvY2Vzcy9jb29yZGlu
YXRpb24gcHJvYmxlbS4KCk5vdyB0aGF0IC1tbSBtZXJnZWQgdGhlIGJhc2ljIGhtbSBBUEkgc2tl
bGV0b24gSSB0aGluayBydW5uaW5nIGxpa2UKdGhpcyB3b3VsZCBnZXQgdXMgcXVpY2tseSB0byB0
aGUgcGxhY2Ugd2UgYWxsIHdhbnQ6IGNvbXByZWhlbnNpdmUgaW4gdHJlZQp1c2VycyBvZiBobW0u
CgpBbmRyZXcsIHdvdWxkIHRoaXMgYmUgYWNjZXB0YWJsZSB0byB5b3U/CgpEYXZlLCB3b3VsZCB5
b3UgYmUgd2lsbGluZyB0byBtZXJnZSBhIGNsZWFuIEhNTSB0cmVlIGludG8gRFJNIGlmIGl0IGlz
CnJlcXVpcmVkIGZvciBEUk0gZHJpdmVyIHdvcmsgaW4gNS4zPwoKSSdtIGZpbmUgdG8gbWVyZ2Ug
YSB0cmVlIGxpa2UgdGhpcyBmb3IgUkRNQSwgd2UgYWxyZWFkeSBkbyB0aGlzCnBhdHRlcm4gd2l0
aCBuZXRkZXYuCgpCYWNrZ3JvdW5kOiBUaGUgaXNzdWUgdGhhdCBpcyBtb3RpdmF0aW5nIHRoaXMg
aXMgd2Ugd2FudCB0byBtYWtlCmNoYW5nZXMgdG8gc29tZSBvZiB0aGUgQVBJJ3MgZm9yIGhtbSwg
d2hpY2ggbWVhbiBjaGFuZ2VzIGluIGV4aXN0aW5nCkRSTSwgY2hhbmdlcyBpbiB0by1iZS1hY2Nl
cHRlZCBSRE1BIGNvZGUsIGFuZCB0by1iZS1hY2NlcHRlZCBEUk0KZHJpdmVyIGNvZGUuIENvb3Jk
aW50YXRpbmcgdGhlIG1tL2htbS5jLCBSRE1BIGFuZCBEUk0gY2hhbmdlcyBpcyBiZXN0CmRvbmUg
d2l0aCB0aGUgcHJvdmVuIHNoYXJlZCBnaXQgdHJlZSBwYXR0ZXJuLiBBcyBDSCBleHBsYWlucyBJ
IHdvdWxkCnJ1biBhIGNsZWFuL21pbmltYWwgaG1tIHRyZWUgdGhhdCBjYW4gYmUgbWVyZ2VkIGlu
dG8gZHJpdmVyIHRyZWVzIGFzCnJlcXVpcmVkLCBhbmQgSSB3aWxsIGNvbW1pdCB0byBzZW5kaW5n
IGEgUFIgdG8gTGludXMgZm9yIHRoaXMgdHJlZQp2ZXJ5IGVhcmx5IGluIHRoZSBtZXJnZSB3aW5k
b3cgc28gdGhhdCBkcml2ZXIgUFIncyBhcmUgJ2NsZWFuJy4KClRoZSB0cmVlIHdpbGwgb25seSBj
b250YWluIHVuY29udHJvdmVyc2lhbCBobW0gcmVsYXRlZCBjb21taXRzLCBidWcKZml4ZXMsIGV0
Yy4KCk9idmlvdWlzbHkgSSB3aWxsIGFsc28gY29tbWl0IHRvIHByb3ZpZGluZyByZXZpZXcgZm9y
IHBhdGNoZXMgZmxvd2luZwp0aHJvdWdoIHRoaXMgdHJlZS4KClJlZ2FyZHMsCkphc29uCihyZG1h
IHN1YnN5c3RlbSBjby1tYWludGFpbmVyLCBGV0lXKQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
