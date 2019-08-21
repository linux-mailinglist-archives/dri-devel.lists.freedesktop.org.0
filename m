Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D031798D54
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABF76EAA9;
	Thu, 22 Aug 2019 08:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A816E454
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 16:16:37 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id t12so3688981qtp.9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 09:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rSelPuss6Rio+zLxmeT3lHQjONOPz6ghCteSl79uvc4=;
 b=Fk4ASB7OgXoJOIDxCGSfP/LheuyMz+cZ4KnVxR28VM+rqTY/boDf3uqPhbvX0ZdR3w
 bApH36DbY7hq1/7LaZOA+aE+aBwmPhDMsUrH+ex5LnzVT5J/rvHQQiEN2WwhDXQ/U0Gw
 76GV/GFKdd8TtE4kfTcUKOBpQh8dDsM6Z325tt9QfanJ3DoEzcfoNPQvJo2BSXJgzPfu
 NmuAIHzeGJ/wrsBSOCNCgmmUNM1gJqbOM8aDYN3icEZKcF51sj0bwWY6J8TIdwLM25jf
 Km5SY4zHvkJmHmYUEj8Pm/DdVHkUBgKMYIjipw7JqCqpBQ8RLaHS9m1zgbqw1jWysB4X
 pcYg==
X-Gm-Message-State: APjAAAWZ76rXeWr/Brzw5/VbI4eZ2/gSTgCYf27S/r55pecO6x04QtkC
 IxgtCEP4vPix9uqRc4J8aFm9zA==
X-Google-Smtp-Source: APXvYqypokR94+w8NKN6DkdxQ9oFTavnyiG1VlybQkUXWne93Jd3wfqkFsQtWY3s57Jl+U7ZTrZ3aQ==
X-Received: by 2002:ac8:7696:: with SMTP id g22mr31568522qtr.208.1566404196241; 
 Wed, 21 Aug 2019 09:16:36 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id y194sm10143420qkb.111.2019.08.21.09.16.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Aug 2019 09:16:35 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1i0THn-0008UM-3g; Wed, 21 Aug 2019 13:16:35 -0300
Date: Wed, 21 Aug 2019 13:16:35 -0300
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
Message-ID: <20190821161635.GC8653@ziepe.ca>
References: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
 <20190820081902.24815-5-daniel.vetter@ffwll.ch>
 <20190820133418.GG29246@ziepe.ca>
 <20190820151810.GG11147@phenom.ffwll.local>
 <20190821154151.GK11147@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821154151.GK11147@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rSelPuss6Rio+zLxmeT3lHQjONOPz6ghCteSl79uvc4=;
 b=lecystT5pa2A6yo8Axdj1KSsLU40VESQnnpU2Rk1L1SzDdZmYUbd4PsiNU+5iLOE7j
 zbD6bbLCGebQwx9lcXa2B+HW9DoD5q7uBa/gZ7ygQPx77wQQIQ1GmTexMMrPCdK7kyCX
 dcyjDO+jw/ZpT3eBIlbTDS/F9lvZmJkfsIhEr9N+LJxXNscIOIrGwF+RrgQg/pAcfw/v
 C6mD6PK7XpC9IuEvG2lpMuOD0oHl5qpDhT5vYuAjCVMq7SKO6jJn1/Yli0UUb+PtB3VS
 3uspvkistGavDwQta/lD1VQQk7IwUnquCu4OISrFvHvchWTZq1eeFmMkErGSgo9qyGp1
 hN0Q==
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

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMDU6NDE6NTFQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKCj4gPiBIbSwgSSB0aG91Z2h0IHRoZSBwYWdlIHRhYmxlIGxvY2tzIHdlJ3JlIGhvbGRp
bmcgdGhlcmUgYWxyZWFkeSBwcmV2ZW50IGFueQo+ID4gc2xlZXBpbmcsIHNvIHdvdWxkIGJlIHJl
ZHVuZGFudD8gQnV0IHJlYWRpbmcgdGhyb3VnaCBjb2RlIEkgdGhpbmsgdGhhdCdzCj4gPiBub3Qg
Z3VhcmFudGVlZCwgc28geWVhaCBtYWtlcyBzZW5zZSB0byBhZGQgaXQgZm9yIGludmFsaWRhdGVf
cmFuZ2VfZW5kCj4gPiB0b28uIEknbGwgcmVzcGluIG9uY2UgSSBoYXZlIHRoZSBhY2svbmFjayBm
cm9tIHNjaGVkdWxlciBwZW9wbGUuCj4gCj4gU28gSSBzdGFydGVkIHRvIGxvb2sgaW50byB0aGlz
LCBhbmQgSSdtIGEgYml0IGNvbmZ1c2VkLiBUaGVyZSdzIG5vCj4gX25vbmJsb2NrIHZlcnNpb24g
b2YgdGhpcywgc28gZG9lcyB0aGlzIG1lYW5zIGJsb2NraW5nIGlzIG5ldmVyIGFsbG93ZWQsCj4g
b3IgYWx3YXlzIGFsbG93ZWQ/CgpSRE1BIGhhcyBhIG11dGV4OgoKaWJfdW1lbV9ub3RpZmllcl9p
bnZhbGlkYXRlX3JhbmdlX2VuZAogIHJidF9pYl91bWVtX2Zvcl9lYWNoX2luX3JhbmdlCiAgIGlu
dmFsaWRhdGVfcmFuZ2Vfc3RhcnRfdHJhbXBvbGluZQogICAgaWJfdW1lbV9ub3RpZmllcl9lbmRf
YWNjb3VudAogICAgICBtdXRleF9sb2NrKCZ1bWVtX29kcC0+dW1lbV9tdXRleCk7CgpJJ20gd29y
a2luZyB0byBkZWxldGUgdGhpcyBwYXRoIHRob3VnaCEKCm5vbmJsb2NraW5nIG9yIG5vdCBmb2xs
b3dzIHRoZSBzdGFydCwgdGhlIHNhbWUgZmxhZyBnZXRzIHBsYWNlZCBpbnRvCnRoZSBtbXVfbm90
aWZpZXJfcmFuZ2Ugc3RydWN0IHBhc3NlZCB0byBlbmQuCgo+IEZyb20gYSBxdWljayBsb29rIHRo
cm91Z2ggaW1wbGVtZW50YXRpb25zIEkndmUgb25seSBzZWVuIHNwaW5sb2NrcywgYW5kCj4gb25l
IHVwX3JlYWQuIFNvIEkgZ3Vlc3MgSSBzaG91bGQgd3JhcGUgdGhpcyBjYWxsYmFjayBpbiBzb21l
IHVuY29uZGl0aW9uYWwKPiBub25fYmxvY2tfc3RhcnQvZW5kLCBidXQgSSdtIG5vdCBzdXJlLgoK
Rm9yIG5vdywgd2Ugc2hvdWxkIGtlZXAgaXQgdGhlIHNhbWUgYXMgc3RhcnQsIGNvbmRpdGlvbmFs
bHkgYmxvY2tpbmcuCgpIb3BlZnVsbHkgYmVmb3JlIExQQyBJIGNhbiBzZW5kIGEgUkZDIHNlcmll
cyB0aGF0IGVsaW1pbmF0ZXMgbW9zdAppbnZhbGlkYXRlX3JhbmdlX2VuZCB1c2VycyBpbiBmYXZv
ciBvZiBjb21tb24gbG9ja2luZy4uCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
