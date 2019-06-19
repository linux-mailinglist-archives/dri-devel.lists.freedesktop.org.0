Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A15C4C7ED
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D264C6E4EC;
	Thu, 20 Jun 2019 07:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE2D6E439
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 16:29:05 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id g18so11318503qkl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 09:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qnUOwWGBCAXAVLri1Ul0fDjUeERWKjKVp0Rio+t6Mw0=;
 b=oBEQbcsH1a9Jg3lM9qM8CCG1pR6zNuuVz/8onfnpv4uOTGjK4VxlXwRFrZTEiThnYi
 Xgri4g3u37gv2sKTxItK+p4A25ch6MGFaFV9HjjCePRNeoA4HS1cugjiwLwyY6Ho6g+S
 vcFqB8jj5q4clSPV4ZKG9+kDGIaBx532i/K8VBrgZsk2OqtpArLCLFX2IC3tpGHQw0H9
 UZ6FpGD6fNWTivmVTPr0IATl8VF+9EpIq5qZQ6He6mC4WWpJdlPozB5SZCulNoLxi8VY
 GV2w+ERmwuDPn2gIQI+9PdegnnkgYunFqLCmREMb6tKaPkaLNR+ZH/xVJjUVEd4JKrZB
 uj2g==
X-Gm-Message-State: APjAAAUSiR5y4Nu0vsh38ehu53ra5hXwR8A6vYx67khDKjysItVfb5+F
 kf4R0wXYy38ebSYRRGxyoeiIYg==
X-Google-Smtp-Source: APXvYqxI2A2AbFb1+ZoFRIh7H3fg512a+PNV8rhMF80/TQ7Ui3RJ5j2fJJDqC3jWu2+hRHD8V09puw==
X-Received: by 2002:a37:5444:: with SMTP id i65mr23556982qkb.263.1560961744340; 
 Wed, 19 Jun 2019 09:29:04 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id n5sm11854916qta.29.2019.06.19.09.29.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Jun 2019 09:29:03 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hddSJ-0001sf-Di; Wed, 19 Jun 2019 13:29:03 -0300
Date: Wed, 19 Jun 2019 13:29:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>,
	Potnuri Bharat Teja <bharat@chelsio.com>
Subject: Re: use exact allocation for dma coherent memory
Message-ID: <20190619162903.GF9360@ziepe.ca>
References: <20190614134726.3827-1-hch@lst.de> <20190617082148.GF28859@kadam>
 <20190617083342.GA7883@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617083342.GA7883@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qnUOwWGBCAXAVLri1Ul0fDjUeERWKjKVp0Rio+t6Mw0=;
 b=Mu7sgXi6O1BEfTzeAxDFiZq9WYAU+8GuA+frzMgX9hRk0/2Eo2VPU9VKN7SPqn7GLw
 BMmvCbBlMZt8BrrdyjrzJb5mIwmN+Un5ohC6uh52oLeiu3fM9lYGSfsBxw2N/in8YFn5
 94JBdMTWXqhPkHC5ogDkAk30Vj3tK2OB7FH+D8RuRjkNrh4KSwvNzZkKLQDt1o6UXnKk
 akxzg79p5LQYrNgI6wQWhEDCa4i3Wr2Q3GuDm1M6C6XhuTkbEI5dQ8Rzs09QxzMXG/yv
 86i6u7h1UReQ+1KLg8ARX3o5vtg8COFFdiinD/3xnzFLxOpaxmET6WHLpP1penmwv6Fz
 qw4w==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 linux-rdma@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
 Intel Linux Wireless <linuxwifi@intel.com>, intel-gfx@lists.freedesktop.org,
 Ian Abbott <abbotti@mev.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, H Hartley Sweeten <hsweeten@visionengravers.com>,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTA6MzM6NDJBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gPiBkcml2ZXJzL2luZmluaWJhbmQvaHcvY3hnYjQvcXAuYwo+ID4gICAgMTI5
ICBzdGF0aWMgaW50IGFsbG9jX2hvc3Rfc3Eoc3RydWN0IGM0aXdfcmRldiAqcmRldiwgc3RydWN0
IHQ0X3NxICpzcSkKPiA+ICAgIDEzMCAgewo+ID4gICAgMTMxICAgICAgICAgIHNxLT5xdWV1ZSA9
IGRtYV9hbGxvY19jb2hlcmVudCgmKHJkZXYtPmxsZGkucGRldi0+ZGV2KSwgc3EtPm1lbXNpemUs
Cj4gPiAgICAxMzIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICYoc3Et
PmRtYV9hZGRyKSwgR0ZQX0tFUk5FTCk7Cj4gPiAgICAxMzMgICAgICAgICAgaWYgKCFzcS0+cXVl
dWUpCj4gPiAgICAxMzQgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiA+ICAgIDEz
NSAgICAgICAgICBzcS0+cGh5c19hZGRyID0gdmlydF90b19waHlzKHNxLT5xdWV1ZSk7Cj4gPiAg
ICAxMzYgICAgICAgICAgZG1hX3VubWFwX2FkZHJfc2V0KHNxLCBtYXBwaW5nLCBzcS0+ZG1hX2Fk
ZHIpOwo+ID4gICAgMTM3ICAgICAgICAgIHJldHVybiAwOwo+ID4gICAgMTM4ICB9Cj4gPiAKPiA+
IElzIHRoaXMgYSBidWc/Cj4gCj4gWWVzLiAgVGhpcyB3aWxsIGJsb3cgdXAgYmFkbHkgb24gbWFu
eSBwbGF0Zm9ybXMsIGFzIHNxLT5xdWV1ZQo+IG1pZ2h0IGJlIHZtYXBwZWQsIGlvcmVtYXBwZWQs
IGNvbWUgZnJvbSBhIHBvb2wgd2l0aG91dCBwYWdlIGJhY2tpbmcuCgpHYWgsIHRoaXMgYWRkciBn
ZXRzIGZlZCBpbnRvIGlvX3JlbWFwX3Bmbl9yYW5nZS9yZW1hcF9wZm5fcmFuZ2UgdG9vLi4KClBv
dG51cmksIHlvdSBzaG91bGQgZml4IHRoaXMuLiAKCllvdSBwcm9iYWJseSBuZWVkIHRvIHVzZSBk
bWFfbW1hcF9mcm9tX2Rldl9jb2hlcmVudCgpIGluIHRoZSBtbWFwID8KCkphc29uCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
