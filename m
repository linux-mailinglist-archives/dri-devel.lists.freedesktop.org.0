Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE4010687C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 10:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FABD6F4EC;
	Fri, 22 Nov 2019 09:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B94E6F374
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 14:36:46 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id w11so1457982qvu.13
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 06:36:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rv5c3PJEtM2ffNdfZuVl2p9Xs+FPDxJaOjEmQ2G8DAo=;
 b=jErith64FHFZLuG9BXO01RPU2PfkhiLXyiWY4Jvqd0GnduQAKCL2nthHVk8NsyEtn8
 bA7JpwfeeN1mk1hV4PK6At/+yOkXE5HK3SxoHKzPsfqsgc2YYCZ0zZdAcs/zHExKEzcH
 d7Q+lGKis0DdtNjC+gSP6s7UAXshgIHqnR7Dp8QYLS9s9+FJM/QqIudVaPZ+v4SF0iZw
 qRv/b5kKuikSj4tqQ78DCvod3gKkMT2v2TQNP2oY7UDaiO3Sat4k/GutW3XjHAVxe0l6
 M3W/lwhXQS1Tp0uDfJQIzq53SJrbZHQw9NGt9AA6ONGy5TNXvPdjgfcTD6xg++4Tc58e
 QGrQ==
X-Gm-Message-State: APjAAAW2w79IzOSyGC+lkEbytW9K+ujdPIYVoKgI91eqKwbP9dBJFC5k
 Vfhnrneoo4BSszaO5ngf3WkbAg==
X-Google-Smtp-Source: APXvYqxiPTD6uqfSlGreW7CNwXwCXJOA4tNSbO40QzzV7IhKLzuaPAx4PWY7OQoHdNILaiGopmJlAA==
X-Received: by 2002:a0c:e74a:: with SMTP id g10mr8540002qvn.29.1574347005412; 
 Thu, 21 Nov 2019 06:36:45 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id 40sm1584912qtc.95.2019.11.21.06.36.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 21 Nov 2019 06:36:44 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iXnZb-0004bF-SZ; Thu, 21 Nov 2019 10:36:43 -0400
Date: Thu, 21 Nov 2019 10:36:43 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v7 07/24] IB/umem: use get_user_pages_fast() to pin DMA
 pages
Message-ID: <20191121143643.GC7448@ziepe.ca>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-8-jhubbard@nvidia.com>
 <20191121080746.GC30991@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121080746.GC30991@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 22 Nov 2019 09:00:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rv5c3PJEtM2ffNdfZuVl2p9Xs+FPDxJaOjEmQ2G8DAo=;
 b=XkP12c/ibS/aRyryTCd4qjn/PXxyYCusK1THaNAzNjypEGkjhmCt9LtT+qYEnSe3fB
 R0spZ8YqysCDI95uGLLvFVswmZUjEqJ9cNCyHcavEFwClRwZ6y4PKDy88MyzZlAfM967
 hisIg3vRQPZ469GZRWnqA3CNAZUY/hKDr+kXV7+2R0BibPU9CM1KGy5uODfMlNXxTJJo
 tHEs5mFWOzUwzAdEjcr2fH3dCNIBIBIgehoNt8ki1/1o3yu01BkPAihfF+3/v5R6c6NG
 mm7J2IKwvLhTCpGsMr85umCSjimcUeH9XgLjTylXIMq1THOPpUYiNcR9NxoGX25nyfzV
 YKKQ==
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
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Vlastimil Babka <vbabka@suse.cz>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTI6MDc6NDZBTSAtMDgwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTE6MTM6MzdQTSAtMDgwMCwgSm9o
biBIdWJiYXJkIHdyb3RlOgo+ID4gQW5kIGdldCByaWQgb2YgdGhlIG1tYXBfc2VtIGNhbGxzLCBh
cyBwYXJ0IG9mIHRoYXQuIE5vdGUKPiA+IHRoYXQgZ2V0X3VzZXJfcGFnZXNfZmFzdCgpIHdpbGws
IGlmIG5lY2Vzc2FyeSwgZmFsbCBiYWNrIHRvCj4gPiBfX2d1cF9sb25ndGVybV91bmxvY2tlZCgp
LCB3aGljaCB0YWtlcyB0aGUgbW1hcF9zZW0gYXMgbmVlZGVkLgo+ID4gCj4gPiBSZXZpZXdlZC1i
eTogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPiA+IFJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9y
cGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogSXJhIFdlaW55IDxpcmEud2Vp
bnlAaW50ZWwuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPgo+IAo+IExvb2tzIGZpbmUsCj4gCj4gUmV2aWV3ZWQtYnk6IENocmlzdG9waCBI
ZWxsd2lnIDxoY2hAbHN0LmRlPgo+IAo+IEphc29uLCBjYW4geW91IHF1ZXVlIHRoaXMgdXAgZm9y
IDUuNSB0byByZWR1Y2UgdGhpcyBwYXRjaCBzdGFjayBhIGJpdD8KClllcywgSSBzYWlkIEknZCBk
byB0aGlzIGluIGFuIGVhcmxpZXIgcmV2aXNpb24uIE5vdyB0aGF0IGl0IGlzIGNsZWFyIHRoaXMK
d29uJ3QgZ28gdGhyb3VnaCBBbmRyZXcncyB0cmVlLCBhcHBsaWVkIHRvIHJkbWEgZm9yLW5leHQK
ClRoYW5rcywKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
