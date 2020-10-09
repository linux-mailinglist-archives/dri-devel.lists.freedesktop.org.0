Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44231289FBE
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 12:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40CE6EE93;
	Sat, 10 Oct 2020 10:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B640D6EE2F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 22:25:12 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id b19so5536058qvm.6
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 15:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=8oWWXTJLgz6k0eoay/wZw+xNoGlz9otu+1gTZ3QYQTU=;
 b=JLw9cOIADbCSt30KyPOolp7D8T1ydtcphV5lvGpBdT0H+g77HDzGqjI0IhTwDtshej
 z8W9/A5rl7Fs73WAAOZCMBnYeiPIeODDdOK72bckk1yyjqKzGzJGpGNwVGUB0vRNaqG6
 ap064g18fjDLNTiIERClhqsAS5BC7X7bh6LtPx49QkjIsF0B7Xd4H4eYYxg/AdJF3NbQ
 6Q2Uw/NINPLSaXbo4JkZOxArbxVx5MKT8yoo5U7zqDz0bBWlEov3++WNlmduRS66dQKB
 STAnvBVe/E+zYOop/N5UjYdXTGAqyB9F1cQa/HvHMUIVc87d8UVxGlSEk0HwjL0aOg35
 Angg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8oWWXTJLgz6k0eoay/wZw+xNoGlz9otu+1gTZ3QYQTU=;
 b=h+AiCtXXz1icXgeoZJo4rK6Y0l7RYj43mXa5Wrv6xXAkXRR9rttnI6UfebNq3Sl33J
 NFI0bLSUdyueb3hbG880By/xesn7FoChxNT+Cs5kkRkEtYNFuM7pWb2W6cYJXZaTWcHL
 ZN47QboqB7A+GsrzgO8XxMRv4kgto/9s0IxQkNqYP1fUeIiVNH7nlc7Fye1KoGziwQ1M
 Tyr6WwXkTVl30s6VCp1v4TyN3YSXJpw8vlWR95SYaTOWqAwBYOpoWivsXRkNGAZcEVIi
 TX+yS+DqWsVZh6bN1Hazxo2lEUPK2havH2p2OOE0SoU3hHV48cv+z0q5ZuPbKnxr921A
 0X7A==
X-Gm-Message-State: AOAM531bF+XE1jk/A5zu/n+6RR2kLJTLc/5x7E5G1D6JxcGqT2QiZVA9
 501t7gqOOp2uPdNuMfk5SOL4GA==
X-Google-Smtp-Source: ABdhPJx4KrjLeEug0hrbNvxkGQnKMdvwXI9Ssl/PdIck48j/G9dQSZkfDxN9OyPFgyOzHX6NhQzoFg==
X-Received: by 2002:a0c:9a01:: with SMTP id p1mr14524630qvd.61.1602282310859; 
 Fri, 09 Oct 2020 15:25:10 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id t3sm7141813qtq.24.2020.10.09.15.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 15:25:10 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kR0p3-002qLD-KY; Fri, 09 Oct 2020 19:25:09 -0300
Date: Fri, 9 Oct 2020 19:25:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/6] mm: mmap: fix fput in error path
Message-ID: <20201009222509.GC5177@ziepe.ca>
References: <20201009150342.1979-1-christian.koenig@amd.com>
 <20201009150420.450833e3830b9d39a2385dd9@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009150420.450833e3830b9d39a2385dd9@linux-foundation.org>
X-Mailman-Approved-At: Sat, 10 Oct 2020 10:02:57 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Miaohe Lin <linmiaohe@huawei.com>,
 Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 willy@infradead.org, jhubbard@nvidia.com, airlied@redhat.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMDksIDIwMjAgYXQgMDM6MDQ6MjBQTSAtMDcwMCwgQW5kcmV3IE1vcnRvbiB3
cm90ZToKPiBPbiBGcmksICA5IE9jdCAyMDIwIDE3OjAzOjM3ICswMjAwICJDaHJpc3RpYW4gS8O2
bmlnIiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+IAo+ID4gUGF0
Y2ggIjQ5NWMxMGNjMWMwYyBDSFJPTUlVTTogZG1hLWJ1ZjogcmVzdG9yZSBhcmdzLi4uIgo+ID4g
YWRkcyBhIHdvcmthcm91bmQgZm9yIGEgYnVnIGluIG1tYXBfcmVnaW9uLgo+ID4gCj4gPiBBcyB0
aGUgY29tbWVudCBzdGF0ZXMgLT5tbWFwKCkgY2FsbGJhY2sgY2FuIGNoYW5nZQo+ID4gdm1hLT52
bV9maWxlIGFuZCBzbyB3ZSBtaWdodCBjYWxsIGZwdXQoKSBvbiB0aGUgd3JvbmcgZmlsZS4KPiA+
IAo+ID4gUmV2ZXJ0IHRoZSB3b3JrYXJvdW5kIGFuZCBwcm9wZXIgZml4IHRoaXMgaW4gbW1hcF9y
ZWdpb24uCj4gPiAKPiAKPiBEb2Vzbid0IHRoaXMgcGF0Y2ggc2VyaWVzIGFkZHJlc3MgdGhlIHNh
bWUgdGhpbmcgYXMKPiBodHRwczovL2xrbWwua2VybmVsLm9yZy9yLzIwMjAwOTE2MDkwNzMzLjMx
NDI3LTEtbGlubWlhb2hlQGh1YXdlaS5jb20/CgpTYW1lIGJhc2ljIGlzc3VlLCBsb29rcyBsaWtl
IGJvdGggb2YgdGhlc2UgcGF0Y2hlcyBzaG91bGQgYmUgY29tYmluZWQKdG8gcGx1ZyBpdCBmdWxs
eS4KCkphc29uIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
