Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7408B61B08
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DEC89A57;
	Mon,  8 Jul 2019 07:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A7D6E497
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 12:33:39 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s145so4164547qke.7
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 05:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=SM8/4exhoEHGZvFQb+ptk62AOWI2rKv8kDwMIolo8dI=;
 b=tVy7UrVbc4uncAisLIHQPi3JVHkRfinEQlhwUOKUjzbxMM19xA3X0roDs1lFpwtbQI
 dbmWJCvmVarjilgG1jE8n53T1gxY1pj73f4ZBiLJpgjy1nJ2GEc6Y7zlukTK96a29NvX
 DluVzDCk6HYxspYpjq6yxHu16V49hmxa2u1OKwYYqJbiDWSaMmAsbX5eZl8rO87K48H+
 ztmAHAJdrhoqqKscPIgbN0TDQHYM8Z9BOsgmCBT8WdLtv4Fz7t51LXqB58WTsSUETyaM
 uxyeb0viZ5V8AlukwsAj/cuyx7PZ7TBZ+ONK64tG/umozseW6WBjt27+L8ycRxdcmm5K
 ywKg==
X-Gm-Message-State: APjAAAXvEbGWtZq8JHgcS1g768lAFF594E8Xs7qgguDcyPCUYQlM/6qz
 +fUWe1myLIdD8ZYknYOle3ox1A==
X-Google-Smtp-Source: APXvYqyX4DTV+YYFhT5OJ/l0wgbSemi0wOkZLMZP/Jtfy+M9HG6Dx7KgQV0v8jgq8UDEfu8Mwq0uQg==
X-Received: by 2002:a37:a1d6:: with SMTP id k205mr2848006qke.171.1562330018204; 
 Fri, 05 Jul 2019 05:33:38 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id z33sm2504614qtc.56.2019.07.05.05.33.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 05 Jul 2019 05:33:37 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hjNPE-0008UP-St; Fri, 05 Jul 2019 09:33:36 -0300
Date: Fri, 5 Jul 2019 09:33:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: hmm_range_fault related fixes and legacy API removal v2
Message-ID: <20190705123336.GA31543@ziepe.ca>
References: <20190703220214.28319-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703220214.28319-1-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=SM8/4exhoEHGZvFQb+ptk62AOWI2rKv8kDwMIolo8dI=;
 b=ckYufb+JTejpyz8pDQLhV2fiq+FAfmAMJXOQOHzRQuW89WYkHU4Lnaf8DM+LDzsQly
 7DR9KgHXKyZJ5SQnARXpB7b0GDPR+IzumhAhjFElKZoaWbVQqBzOGuOt2mXTD7nzuXt5
 rht4Mpc03KaerdCaAGd9Zz+VR1Rrl9rREPc+1J7nPBLLCwdHhPvxkD51oec3BWxH/q5A
 8y8smn0+FXxH8Gikf6Oak6WiJwqqFwAOKVh2vW+4toDJIiGZgqAhD4f+Uc2n5IztDsqL
 u3oZpE+TduYcqojeNfFd5skXHK2hBtPlP72gQxG0RENMyEEMZ5xl0dJFmnFf9EpIr4ix
 WIHQ==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDM6MDI6MDhQTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gSGkgSsOpcsO0bWUsIEJlbiBhbmQgSmFzb24sCj4gCj4gYmVsb3cgaXMgYSBz
ZXJpZXMgYWdhaW5zdCB0aGUgaG1tIHRyZWUgd2hpY2ggZml4ZXMgdXAgdGhlIG1tYXBfc2VtCj4g
bG9ja2luZyBpbiBub3V2ZWF1IGFuZCB3aGlsZSBhdCBpdCBhbHNvIHJlbW92ZXMgbGVmdG92ZXIg
bGVnYWN5IEhNTSBBUElzCj4gb25seSB1c2VkIGJ5IG5vdXZlYXUuCgpBcyBtdWNoIGFzIEkgbGlr
ZSB0aGlzIHNlcmllcywgaXQgd29uJ3QgbWFrZSBpdCB0byB0aGlzIG1lcmdlIHdpbmRvdywKc29y
cnkuCgpMZXQncyByZXZpc2l0IGl0IGluIGEgZmV3IHdlZWtzIGF0IHJjMS4KClJlZ2FyZHMsCkph
c29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
