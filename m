Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D88993A5CC
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F3D89121;
	Sun,  9 Jun 2019 12:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19099891DD
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 01:35:32 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id u12so4485482qth.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 18:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UGOATcTaOKAluhrvGNEt0YBuzCUm7BqI1RnepYlBC8A=;
 b=MqN0T9xBP81rRLbAGYAzOJP17CpIkOsrU3uJsdTBVkZwr4DzqU0IyyQTTcCxqIhnSt
 E4e0BYbHoeGmmKX4FT5QAbv6Ct6kv5VgHwQQMrbTdQdyp1GUYnAYyqs/1Is6Ib16wpEW
 0E9ZQuh3RTfsefSm9pdtMF81+1duWja2E/IF0pk1Z46dwy1ROAC7STi7Pj5t/x1g1Fiz
 obljNk7Q/AXoJTtH3oGinrGntl8gOfKyBSvzbyMlUQQGc68hrKusY1vmBrmbsB/OU0+z
 m+DOcAb0Rb/yhrPc/sBQ0q9V73XRKEYdmV8jSrdZza4wFlRYQW2BxgFK8Q4auDG0mEZc
 7OvA==
X-Gm-Message-State: APjAAAX+TGas9EZh3o403yC5ZhNJ4hzMNGd9aUofayFVVACv++pYYpaT
 XRNAOXo9ftaw++5iBcytIXy4AamhE86uVA==
X-Google-Smtp-Source: APXvYqz4alB0pyXNzkKNUcsple2Jn80UBKfD2EM61r0Pq/XpSZdlSRxzdhI0YfjDFU7DVO4hGnKzdw==
X-Received: by 2002:ac8:644:: with SMTP id e4mr41209859qth.173.1559957731168; 
 Fri, 07 Jun 2019 18:35:31 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id i55sm2718956qtc.21.2019.06.07.18.35.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 18:35:30 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hZQGY-0002CD-9G; Fri, 07 Jun 2019 22:35:30 -0300
Date: Fri, 7 Jun 2019 22:35:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v2 12/11] mm/hmm: Fix error flows in
 hmm_invalidate_range_start
Message-ID: <20190608013530.GB7844@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190607160557.GA335@ziepe.ca>
 <439b5731-0b7e-b25b-ce1a-74b34e1f9bf5@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <439b5731-0b7e-b25b-ce1a-74b34e1f9bf5@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UGOATcTaOKAluhrvGNEt0YBuzCUm7BqI1RnepYlBC8A=;
 b=CdkBfA/6OXeGxOQDEpRrnGbh+YU1WVUIiGmE6ObF1BdvREX2rE28bzeff0LPskY6K4
 gH8oEUMS2jzBTG9XsYBCIU0vO1Ux0uZft+Dls2FU0cg84J1T5cWuvC3xVzcnYykyxzb2
 9Sn1gVGHLQLuaEUN/pivXD8Iv84MG+tX2OGN7ZFtplU058T10fMBEfPmBpaRj27D/szU
 6bOagpwU7gtPX7gLQVwEwO3C+KMvBhxC228Opejk20nbMWBEmUpgwzYLo64TfpaORJxD
 zwMpYHDMyYQ27YdaZMzdhHhTd5Jjv2muJmE75OMWYHj+iRrQByu7sYb/LL1vDmWqUmv6
 tinw==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDQ6NTI6NThQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gPiBAQCAtMTQxLDYgKzE0MiwyMyBAQCBzdGF0aWMgdm9pZCBobW1fcmVsZWFzZShz
dHJ1Y3QgbW11X25vdGlmaWVyICptbiwgc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4gPiAgIAlobW1f
cHV0KGhtbSk7Cj4gPiAgIH0KPiA+ICtzdGF0aWMgdm9pZCBub3RpZmllcnNfZGVjcmVtZW50KHN0
cnVjdCBobW0gKmhtbSkKPiA+ICt7Cj4gPiArCWxvY2tkZXBfYXNzZXJ0X2hlbGQoJmhtbS0+cmFu
Z2VzX2xvY2spOwo+ID4gKwo+ID4gKwlobW0tPm5vdGlmaWVycy0tOwo+ID4gKwlpZiAoIWhtbS0+
bm90aWZpZXJzKSB7Cj4gPiArCQlzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZTsKPiA+ICsKPiA+ICsJ
CWxpc3RfZm9yX2VhY2hfZW50cnkocmFuZ2UsICZobW0tPnJhbmdlcywgbGlzdCkgewo+ID4gKwkJ
CWlmIChyYW5nZS0+dmFsaWQpCj4gPiArCQkJCWNvbnRpbnVlOwo+ID4gKwkJCXJhbmdlLT52YWxp
ZCA9IHRydWU7Cj4gPiArCQl9Cj4gCj4gVGhpcyBqdXN0IGVmZmVjdGl2ZWx5IHNldHMgYWxsIHJh
bmdlcyB0byB2YWxpZC4KPiBJJ20gbm90IHN1cmUgdGhhdCBpcyBiZXN0LgoKVGhpcyBpcyBhIHRy
YWRlIG9mZiwgaXQgd291bGQgYmUgbXVjaCBtb3JlIGV4cGVuc2l2ZSB0byBoYXZlIGEgcHJlY2lz
ZQondmFsaWQgPSB0cnVlJyAtIGluc3RlYWQgdGhpcyBhbGdvcml0aG0gaXMgcHJlY2lzZSBhYm91
dCAndmFsaWQgPQpmYWxzZScgYW5kIGxhenkgYWJvdXQgJ3ZhbGlkID0gdHJ1ZScgd2hpY2ggaXMg
bXVjaCBsZXNzIGNvc3RseSB0bwpjYWxjdWxhdGUuCgo+IFNob3VsZG4ndCBobW1fcmFuZ2VfcmVn
aXN0ZXIoKSBzdGFydCB3aXRoIHJhbmdlLnZhbGlkID0gdHJ1ZSBhbmQKPiB0aGVuIGhtbV9pbnZh
bGlkYXRlX3JhbmdlX3N0YXJ0KCkgc2V0IGFmZmVjdGVkIHJhbmdlcyB0byBmYWxzZT8KCkl0IGtp
bmQgb2YgZG9lcywgZXhwZWN0IHdoZW4gaXQgZG9lc24ndCwgcmlnaHQ/IDopCgo+IFRoZW4gdGhp
cyBiZWNvbWVzIGp1c3Qgd2FrZV91cF9hbGwoKSBpZiAtLW5vdGlmaWVycyA9PSAwIGFuZAo+IGht
bV9yYW5nZV93YWl0X3VudGlsX3ZhbGlkKCkgc2hvdWxkIHdhaXQgZm9yIG5vdGlmaWVycyA9PSAw
LgoKQWxtb3N0Li4gYnV0IGl0IGlzIG1vcmUgdHJpY2t5IHRoYW4gdGhhdC4KClRoaXMgc2NoZW1l
IGlzIGEgY29sbGlzaW9uLXJldHJ5IGFsZ29yaXRobS4gVGhlIHBhZ2VmYXVsdCBzaWRlIHJ1bnMg
dG8KY29tcGxldGlvbiBpZiBubyBwYXJhbGxlbCBpbnZhbGlkYXRlIHN0YXJ0L2VuZCBoYXBwZW5z
LgoKSWYgYSBwYXJhbGxlbCBpbnZhbGlkYXRpb24gaGFwcGVucyB0aGVuIHRoZSBwYWdlZmF1bHQg
cmV0cmllcy4KClNlZWluZyBub3RpZmllcnMgPT0gMCBtZWFucyB0aGVyZSBpcyBhYnNvbHV0ZWx5
IG5vIGN1cnJlbnQgcGFyYWxsZWwKaW52YWxpZGF0aW9uLgoKU2VlaW5nIHJhbmdlLT52YWxpZCA9
PSB0cnVlICh1bmRlciB0aGUgZGV2aWNlIGxvY2spCm1lYW5zIHRoaXMgcmFuZ2UgZG9lc24ndCBp
bnRlcnNlY3Qgd2l0aCBhIHBhcmFsbGVsIGludmFsaWRhdGUuCgpTby4uIGhtbV9yYW5nZV93YWl0
X3VudGlsX3ZhbGlkKCkgY2hlY2tzIHRoZSBwZXItcmFuZ2UgdmFsaWQgYmVjYXVzZQppdCBkb2Vz
bid0IHdhbnQgdG8gc2xlZXAgaWYgKnRoaXMgcmFuZ2UqIGlzIG5vdCBpbnZvbHZlZCBpbiBhIHBh
cmFsbGVsCmludmFsaWRhdGlvbiAtIGJ1dCBvbmNlIGl0IGJlY29tZXMgaW52b2x2ZWQsIHRoZW4g
eWVzLCB2YWxpZCA9PSB0cnVlCmltcGxpZXMgbm90aWZpZXJzID09IDAuCgpJdCBpcyBlYXNpZXIv
c2FmZXIgdG8gdXNlIHVubG9ja2VkIHZhcmlhYmxlIHJlYWRzIGlmIHRoZXJlIGlzIG9ubHkgb25l
CnZhcmlhYmxlLCB0aHVzIHRoZSB3ZWlyZCBjb25zdHJ1Y3Rpb24uCgpJdCBpcyB1bmNsZWFyIHRv
IG1lIGlmIHRoaXMgbWljcm8gb3B0aW1pemF0aW9uIGlzIHJlYWxseQp3b3J0aHdoaWxlLiBJdCBp
cyB2ZXJ5IGV4cGVuc2l2ZSB0byBtYW5hZ2UgYWxsIHRoaXMgdHJhY2tpbmcsIGFuZCBubwpvdGhl
ciBtbXUgbm90aWZpZXIgaW1wbGVtZW50YXRpb24gcmVhbGx5IGRvZXMgc29tZXRoaW5nIGxpa2UK
dGhpcy4gRWxpbWluYXRpbmcgdGhlIHBlci1yYW5nZSB0cmFja2luZyBhbmQgdXNpbmcgdGhlIG5v
dGlmaWVyIGNvdW50CmFzIGEgZ2xvYmFsIGxvY2sgd291bGQgYmUgbXVjaCBzaW1wbGVyLi4uCgo+
IE90aGVyd2lzZSwgcmFuZ2UudmFsaWQgZG9lc24ndCByZWFsbHkgbWVhbiBpdCdzIHZhbGlkLgoK
UmlnaHQsIGl0IGRvZXNuJ3QgcmVhbGx5IG1lYW4gJ3ZhbGlkJwoKSXQgaXMgdHJhY2tpbmcgcG9z
c2libGUgY29sbGlkaW5nIGludmFsaWRhdGVzIHN1Y2ggdGhhdCB2YWxpZCA9PSB0cnVlCih1bmRl
ciB0aGUgZGV2aWNlIGxvY2spIG1lYW5zIHRoYXQgdGhlcmUgd2FzIG5vIGNvbGxpZGluZyBpbnZh
bGlkYXRlLgoKSSBzdGlsbCB0aGluayB0aGlzIGltcGxlbWVudGF0aW9uIGRvZXNuJ3QgcXVpdGUg
d29yaywgYXMgSSBkZXNjcmliZWQKaGVyZToKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LW1tLzIwMTkwNTI3MTk1ODI5LkdCMTgwMTlAbWVsbGFub3guY29tLwoKQnV0IHRoZSBpZGVhIGlz
IGJhc2ljYWxseSBzb3VuZCBhbmQgbWF0Y2hlcyB3aGF0IG90aGVyIG1tdSBub3RpZmllcgp1c2Vy
cyBkbywganVzdCB1c2luZyBhIHNlcWNvdW50IGxpa2Ugc2NoZW1lLCBub3QgYSBib29sZWFuLgoK
SmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
