Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2507BFABE5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 09:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C20D6EC98;
	Wed, 13 Nov 2019 08:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED81C6EC98
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 08:22:48 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id l202so1041162oig.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 00:22:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ayY6gCXrrA3VgRAyrp2bK0EyrP0ektptyzgRBWzw5I=;
 b=KxsFUAFp4H7cKLkRZ1JUvc5kRGpVqlT1xwmpJUGj/0nJMiCdvRCxtDF5AYObtY4sfC
 D2V/i2wNvsnlNQGPSRbiN83J0y058dYHU5k5DomjFVq6G0K2pKtILa84Lutfi9QvT2YM
 MlgZFI4VNRRn8O26URKWKqzq69alKc2Y3z9tTpv8TzLtBBH4dGoKBQL9vyHfNBI/PIsZ
 G+3JkwgXCCDyOhAD60VC+kfKnHJjv6jadT/3INPLmauRJxRkmDlwUBgvKwN2Qm0efeq5
 yJaaZ+zzY/PA4MFmFaF5YBwil1gIcO0M+KD66gu50np3+ONpux01RA5t9WPFQE6f0nBJ
 FhJA==
X-Gm-Message-State: APjAAAVyBZSTUs4dp1aGDMyuEZJSiFqPBp/DApnWOJpZRJosGFQ647DI
 fE9y3uLq30fLuMiAoSvKfh0/we+qZlSLiIZ9grBuRw==
X-Google-Smtp-Source: APXvYqxfSdLpxppf1Yvj8Pnz7e2iZsxyqjYKBICjfkF8MEX8zkGbqRRzZo57EW2FfCAXfyKFCc6JsAljOesoFoCv0a8=
X-Received: by 2002:a05:6808:4cf:: with SMTP id
 a15mr1806257oie.132.1573633368138; 
 Wed, 13 Nov 2019 00:22:48 -0800 (PST)
MIME-Version: 1.0
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112203802.GD5584@ziepe.ca>
 <02fa935c-3469-b766-b691-5660084b60b9@nvidia.com>
In-Reply-To: <02fa935c-3469-b766-b691-5660084b60b9@nvidia.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 13 Nov 2019 09:22:36 +0100
Message-ID: <CAKMK7uHvk+ti00mCCF2006U003w1dofFg9nSfmZ4bS2Z2pEDNQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/23] mm/gup: track dma-pinned pages: FOLL_PIN,
 FOLL_LONGTERM
To: John Hubbard <jhubbard@nvidia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9ayY6gCXrrA3VgRAyrp2bK0EyrP0ektptyzgRBWzw5I=;
 b=A+5ZDAwm0sisXEXV26bplYhx0LMI9tSEqcz5XKqugaaiNBsieQDhWSu2ezHIxsk3ok
 PapqJ40EqXbuXexGXvb3dctMfbGHjaFuYDAai4pvCrk3ttwW8fkWJFMlnWK5Sh3WDfzP
 au9tTKQUHDCal3qSVw21r18Mu3ZTlLggTEjdE=
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
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

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMTA6MTAgUE0gSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPiB3cm90ZToKPgo+IE9uIDExLzEyLzE5IDEyOjM4IFBNLCBKYXNvbiBHdW50aG9y
cGUgd3JvdGU6Cj4gPiBPbiBNb24sIE5vdiAxMSwgMjAxOSBhdCAwNDowNjozN1BNIC0wODAwLCBK
b2huIEh1YmJhcmQgd3JvdGU6Cj4gPj4gSGksCj4gPj4KPiA+PiBUaGUgY292ZXIgbGV0dGVyIGlz
IGxvbmcsIHNvIHRoZSBtb3JlIGltcG9ydGFudCBzdHVmZiBpcyBmaXJzdDoKPiA+Pgo+ID4+ICog
SmFzb24sIGlmIHlvdSBvciBzb21lb25lIGNvdWxkIGxvb2sgYXQgdGhlIHRoZSBWRklPIGNsZWFu
dXAgKHBhdGNoIDgpCj4gPj4gICBhbmQgY29udmVyc2lvbiB0byBGT0xMX1BJTiAocGF0Y2ggMTgp
LCB0byBtYWtlIHN1cmUgaXQncyB1c2Ugb2YKPiA+PiAgIHJlbW90ZSBhbmQgbG9uZ3Rlcm0gZ3Vw
IG1hdGNoZXMgd2hhdCB3ZSBkaXNjdXNzZWQgZHVyaW5nIHRoZSByZXZpZXcKPiA+PiAgIG9mIHYy
LCBJJ2QgYXBwcmVjaWF0ZSBpdC4KPiA+Pgo+ID4+ICogQWxzbyBmb3IgSmFzb24gYW5kIElCOiBh
cyBub3RlZCBiZWxvdywgaW4gcGF0Y2ggMTEsIEkgYW0gKHRvbz8pIGJvbGRseQo+ID4+ICAgY29u
dmVydGluZyBmcm9tIHB1dF91c2VyX3BhZ2VzKCkgdG8gcmVsZWFzZV9wYWdlcygpLgo+ID4KPiA+
IFdoeSBhcmUgd2UgZG9pbmcgdGhpcz8gSSB0aGluayB0aGluZ3MgZ290IGNvbmZ1c2VkIGhlcmUg
c29tZXBsYWNlLCBhcwo+Cj4KPiBCZWNhdXNlOgo+Cj4gYSkgVGhlc2UgbmVlZCBwdXRfcGFnZSgp
IGNhbGxzLCAgYW5kCj4KPiBiKSB0aGVyZSBpcyBubyBwdXRfcGFnZXMoKSBjYWxsLCBidXQgdGhl
cmUgaXMgYSByZWxlYXNlX3BhZ2VzKCkgY2FsbCB0aGF0Cj4gaXMsIGFyZ3VhYmx5LCB3aGF0IHB1
dF9wYWdlcygpIHdvdWxkIGJlLgo+Cj4KPiA+IHRoZSBjb21tZW50IHN0aWxsIHNheXM6Cj4gPgo+
ID4gLyoqCj4gPiAgKiBwdXRfdXNlcl9wYWdlKCkgLSByZWxlYXNlIGEgZ3VwLXBpbm5lZCBwYWdl
Cj4gPiAgKiBAcGFnZTogICAgICAgICAgICBwb2ludGVyIHRvIHBhZ2UgdG8gYmUgcmVsZWFzZWQK
PiA+ICAqCj4gPiAgKiBQYWdlcyB0aGF0IHdlcmUgcGlubmVkIHZpYSBnZXRfdXNlcl9wYWdlcyoo
KSBtdXN0IGJlIHJlbGVhc2VkIHZpYQo+ID4gICogZWl0aGVyIHB1dF91c2VyX3BhZ2UoKSwgb3Ig
b25lIG9mIHRoZSBwdXRfdXNlcl9wYWdlcyooKSByb3V0aW5lcwo+ID4gICogYmVsb3cuCj4KPgo+
IE9oaGgsIEkgbWlzc2VkIHRob3NlIGNvbW1lbnRzLiBUaGV5IG5lZWQgdG8gYWxsIGJlIGNoYW5n
ZWQgb3ZlciB0bwo+IHNheSAicGFnZXMgdGhhdCB3ZXJlIHBpbm5lZCB2aWEgcGluX3VzZXJfcGFn
ZXMqKCkgb3IKPiBwaW5fbG9uZ3Rlcm1fcGFnZXMqKCkgbXVzdCBiZSByZWxlYXNlZCB2aWEgcHV0
X3VzZXJfcGFnZSooKS4iCj4KPiBUaGUgZ2V0X3VzZXJfcGFnZXMqKCkgcGFnZXMgbXVzdCBzdGls
bCBiZSByZWxlYXNlZCB2aWEgcHV0X3BhZ2UuCj4KPiBUaGUgY2h1cm4gaXMgZHVlIHRvIGEgZmFp
cmx5IHNpZ25pZmljYW50IGNoYW5nZSBpbiBzdHJhdGVneSwgd2hpcwo+IGlzOiBpbnN0ZWFkIG9m
IGNoYW5naW5nIGFsbCBnZXRfdXNlcl9wYWdlcyooKSBzaXRlcyB0byBjYWxsCj4gcHV0X3VzZXJf
cGFnZSgpLCBjaGFuZ2Ugc2VsZWN0ZWQgc2l0ZXMgdG8gY2FsbCBwaW5fdXNlcl9wYWdlcyooKSBv
cgo+IHBpbl9sb25ndGVybV9wYWdlcyooKSwgcGx1cyBwdXRfdXNlcl9wYWdlKCkuCgpDYW4ndCB3
ZSBjYWxsIHRoaXMgdW5waW5fdXNlcl9wYWdlIHRoZW4sIGZvciBzb21lIHN5bW1ldHJ5PyBPciBp
cyB0aGF0CmV2ZW4gbW9yZSBjaHVybj8KCkxvb2tpbmcgZnJvbSBhZmFyIHRoZSBuYW1pbmcgaGVy
ZSBzZWVtcyByZWFsbHkgY29uZnVzaW5nLgotRGFuaWVsCgo+IFRoYXQgYWxsb3dzIGluY3JlbWVu
dGFsbHkgY29udmVydGluZyB0aGUga2VybmVsIG92ZXIgdG8gdXNpbmcgdGhlCj4gbmV3IHBpbiBB
UElzLCB3aXRob3V0IHRha2luZyBvbiB0aGUgaHVnZSByaXNrIG9mIGEgYmlnIG9uZS1zaG90Cj4g
Y29udmVyc2lvbi4KPgo+IFNvLCBJJ3ZlIGVuZGVkIHVwIHdpdGggb25lIHBsYWNlIHRoYXQgYWN0
dWFsbHkgbmVlZHMgdG8gZ2V0IHJldmVydGVkCj4gYmFjayB0byBnZXRfdXNlcl9wYWdlcygpLCBh
bmQgdGhhdCdzIHRoZSBJQiBPRFAgY29kZS4KPgo+ID4KPiA+IEkgZmVlbCBsaWtlIGlmIHB1dF91
c2VyX3BhZ2VzKCkgaXMgbm90IHRoZSBjb3JyZWN0IHdheSB0byB1bmRvCj4gPiBnZXRfdXNlcl9w
YWdlcygpIHRoZW4gaXQgbmVlZHMgdG8gYmUgZGVsZXRlZC4KPiA+Cj4KPiBZZXMsIHlvdSdyZSBy
aWdodC4gSSdsbCBmaXggdGhlIHB1dF91c2VyX3BhZ2UgY29tbWVudHMoKSBhcyBkZXNjcmliZWQu
Cj4KPgo+IHRoYW5rcywKPgo+IEpvaG4gSHViYmFyZAo+IE5WSURJQQoKCgotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUg
NTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
