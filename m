Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DB29FCF9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEF0899E9;
	Wed, 28 Aug 2019 08:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB30889BB0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 22:48:06 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id q64so811628qtd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 15:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jAdr+PRt2FqgbS5XOOCJ9tvwJq0Sqr672g8uyJKHQxE=;
 b=TkintA/Ic3PSCbBgKTKbcLrZyHEluKEYtbhg57tYkfOBsVYRiVH4vg6ICTFwKWdqkn
 OuWmMJh4LqBcCuMbJzKWbmuoXE2ItQdUkhPF2a0xfcdsdmtB6Fi8geV95JfpDDO4PzFQ
 nESUd3W6kXs9+swJEXF2yEafoneKlo0HF84560m5nmynV40nna+wGWVPQpgqX7Vy62u/
 Br3UFC6mQovNU+WgP9qJxeG79yhQVs17DKaf/xyLpU9aLCNuhnrS/5/tt76woiPuQxoM
 8tehkxuK1JatEn/2ABWZ/+dJjBNFwSQWHPYine71aK0nIeHE25aoafqDvHm7DA77VJnj
 gfWA==
X-Gm-Message-State: APjAAAUd1n7ShBUMOifN+26lZZ32sQMzh/kTNHtPwn3wLGFsVAYTAjEY
 vhFDvr7tKG9tPsmbiBRBOIn+Nw==
X-Google-Smtp-Source: APXvYqyjKFWmKMA8MMlDR3xLrO67hCPYAWB96imqMAMJ3ql8fO8EwALYjIVqzuf6Fw3X4axT++r5lQ==
X-Received: by 2002:a0c:da11:: with SMTP id x17mr841622qvj.197.1566946085712; 
 Tue, 27 Aug 2019 15:48:05 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-216-168.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.216.168])
 by smtp.gmail.com with ESMTPSA id y5sm462004qkj.64.2019.08.27.15.48.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Aug 2019 15:48:05 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1i2kFw-0003mf-RO; Tue, 27 Aug 2019 19:48:04 -0300
Date: Tue, 27 Aug 2019 19:48:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 0/2] mm/hmm: two bug fixes for hmm_range_fault()
Message-ID: <20190827224804.GA31299@ziepe.ca>
References: <20190823221753.2514-1-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190823221753.2514-1-rcampbell@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jAdr+PRt2FqgbS5XOOCJ9tvwJq0Sqr672g8uyJKHQxE=;
 b=aSF2iwwBLFQuLQ3N3kNXqi4CQ/GTjnkvkPNw4aniyErIM3MO0qE94JDqgop+jXAoq3
 jHHWiV4hBrwmm2iTgCoiRlhwqpzuD3mb9GMj1eDsOI+G8Gw4AuMgNGE4i/bvRk5AXep4
 3QR+vmYkm6GNw7pLeIbfet89BHMr+yn7nrfaAqOOgrIEOmAm9QShaaPeo4Zh7ka1jkS0
 flHWhhQqdnPpw9YrY1Gz1VVlC/3jJZCLzkDGaOrcdJt3Ym2wbgyWdfXAsDkVJEeCfsxi
 HzmxAs0pTu4mFFQrGjFlWSK845EFVbxXJ63cZlv39gtlVKZj9nxayW/KPLVEPcmjfZNr
 cT/w==
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 amd-gfx@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMDM6MTc6NTFQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gSSBoYXZlIGJlZW4gd29ya2luZyBvbiBjb252ZXJ0aW5nIEplcm9tZSdzIGhtbV9k
dW1teSBkcml2ZXIgYW5kIHNlbGYKPiB0ZXN0cyBpbnRvIGEgc3RhbmQtYWxvbmUgc2V0IG9mIHRl
c3RzIHRvIGJlIGluY2x1ZGVkIGluCj4gdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdm0gYW5kIGNh
bWUgYWNyb3NzIHRoZXNlIHR3byBidWcgZml4ZXMgaW4gdGhlCj4gcHJvY2Vzcy4gVGhlIHRlc3Rz
IGFyZW4ndCBxdWl0ZSByZWFkeSB0byBiZSBwb3N0ZWQgYXMgYSBwYXRjaC4KPiBJJ20gcG9zdGlu
ZyB0aGUgZml4ZXMgbm93IHNpbmNlIEkgdGhvdWdodCB0aGV5IHNob3VsZG4ndCB3YWl0Lgo+IFRo
ZXkgc2hvdWxkIHByb2JhYmx5IGhhdmUgYSBmaXhlcyBsaW5lIGJ1dCB3aXRoIGFsbCB0aGUgSE1N
IGNoYW5nZXMsCj4gSSB3YXNuJ3Qgc3VyZSBleGFjdGx5IHdoaWNoIGNvbW1pdCB0byB1c2UuCj4g
Cj4gVGhlc2UgYXJlIGJhc2VkIG9uIHRvcCBvZiBKYXNvbidzIGxhdGVzdCBobW0gYnJhbmNoLgo+
IAo+IFJhbHBoIENhbXBiZWxsICgyKToKPiAgIG1tL2htbTogaG1tX3JhbmdlX2ZhdWx0KCkgTlVM
TCBwb2ludGVyIGJ1Zwo+ICAgbW0vaG1tOiBobW1fcmFuZ2VfZmF1bHQoKSBpbmZpbml0ZSBsb29w
CgpBcHBsaWVkIHRvIGhtbS5naXQKClRoYW5rcywKSmFzb24KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
