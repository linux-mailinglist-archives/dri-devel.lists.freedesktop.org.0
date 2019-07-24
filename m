Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEBC7482D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DA56E686;
	Thu, 25 Jul 2019 07:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7BE6E618
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 18:01:56 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id l9so46355957qtu.6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NHrhrhDMfOD8855Z/WzNY5buipYXjy+AC0JGYKIcbF8=;
 b=aaOxFNmPCjrWiQXjxVH42DzD4/2o9TGrTEvZQsSwiwAAt7rIWP/UvrDVUY6T6wyQim
 23Gjb9+MwtHE5/LIRwUP27tSrEBwmgbl19DVhnW/D3ePGWTSom6QjBAXyMJ0OzX3HU2i
 E3AqPN5EOhRSh8d2SB0Ry6+QNTPpdJXXmBfVTlGdEzeeKuj0qsD+7Spu8RDZkGnR0+NK
 hEuG4rIN4OmmRPIiEp574k/E+TatP9ggkuU9gPrRsWPC+NBuRvQ/p4WXqTcTUzlX5vNy
 9fMdHid5t74CEs4Dq90iHP4l3+D6737cm2k2AzttgXalwIfBI/KM3fPU7Dn34JBhbGdT
 N9dA==
X-Gm-Message-State: APjAAAV9gR7DUiweyXR1D46EH5RJo5orHgmpKhHGaqs91CQB6r0ZXaj0
 /BfkGHaKFCeKWHcDDciPqoxaxw==
X-Google-Smtp-Source: APXvYqwh9oIClfhj+Xu8Ca6v+JnH5wuP+h6Sc8J95We/ArJyD9/rby1kOqJsMt32kMVWN+JOLxYozw==
X-Received: by 2002:a0c:f193:: with SMTP id m19mr60859511qvl.20.1563991315101; 
 Wed, 24 Jul 2019 11:01:55 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id r4sm32015444qta.93.2019.07.24.11.01.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 11:01:54 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hqLaL-0003Qv-NY; Wed, 24 Jul 2019 15:01:53 -0300
Date: Wed, 24 Jul 2019 15:01:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] mm/hmm: replace hmm_update with mmu_notifier_range
Message-ID: <20190724180153.GE28493@ziepe.ca>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
 <20190724070553.GA2523@lst.de> <20190724152858.GB28493@ziepe.ca>
 <20190724153305.GA10681@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724153305.GA10681@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NHrhrhDMfOD8855Z/WzNY5buipYXjy+AC0JGYKIcbF8=;
 b=dPDOwqvvcar2QZyrIWmnpS9kSbPHrR/wGiHoOguWcVWXL2QB4EbGlIpDh3GEhsu5Ui
 n8DvGZHMQ345DUYe/IKC+YM0nSeJddxkNt+S0YsC7V+nopWE6ScCmbBtAr9p8b7zuqMS
 yY6K83rBY7uS/1zb8JLsSuLsaZshzgZRKjMl6YdJRTawKHyG7IfOhH0vdHKybWcVN7ax
 GxFiQtZPpBb9p7N9LWeYpM2uz0JC6GufyTb6S7aDM2vJh8BzaSTgMbXeFslyg867My9K
 zrKo9Xi9joxNJiWv358sWE53cKRje+sKwuovXQ00SzRkhk+wqTRybQ1JEfewFmBiBsMW
 xDjQ==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDU6MzM6MDVQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTI6Mjg6NThQTSAtMDMwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gSHVtbS4gQWN0dWFsbHkgaGF2aW5nIGxvb2tlZCB0aGlz
IHNvbWUgbW9yZSwgSSB3b25kZXIgaWYgdGhpcyBpcyBhCj4gPiBwcm9ibGVtOgo+IAo+IFdoYXQg
YSBtZXNzLgo+IAo+IFF1ZXN0aW9uOiBkbyB3ZSBldmVuIGNhcmUgZm9yIHRoZSBub24tYmxvY2tp
bmcgZXZlbnRzPyAgVGhlIG9ubHkgcGxhY2UKPiB3aGVyZSBtbXVfbm90aWZpZXJfaW52YWxpZGF0
ZV9yYW5nZV9zdGFydF9ub25ibG9jayBpcyBjYWxsZWQgaXMgdGhlIG9vbQo+IGtpbGxlciwgd2hp
Y2ggbWVhbnMgdGhlIHByb2Nlc3MgaXMgYWJvdXQgdG8gZGllIGFuZCB0aGUgcGFnZXRhYmxlIHdp
bGwKPiBnZXQgdG9ybiBkb3duIEFTQVAuICBTaG91bGQgd2UganVzdCBza2lwIHRoZW0gdW5jb25k
aXRpb25hbGx5PyAgbm91dmVhdQo+IGFscmVhZHkgZG9lcyBzbywgYnV0IGFtZGdwdSBjdXJyZW50
bHkgdHJpZXMgdG8gaGFuZGxlIHRoZSBub24tYmxvY2tpbmcKPiBub3RpZmljYXRpb25zLgoKSSB0
aGluayB0aGUgaXNzdWUgaXMgdGhlIHBhZ2VzIG5lZWQgdG8gZ2V0IGZyZWVkIHRvIG1ha2UgdGhl
IG1lbW9yeQphdmFpbGFibGUgd2l0aG91dCBiZWNvbWluZyBlbnRhbmdsZWQgaW4gcmlza3kgbG9j
a3MgYW5kIGRlYWRsb2NrLgoKUHJlc3VtYWJseSBpZiB3ZSBnbyB0byB0aGUgJ3Rvcm4gZG93biBB
U0FQJyB0aGluZ3MgZ2V0IG1vcmUgcmlza3kgdGhhdAp0aGUgd2hvbGUgdGhpbmcgZGVhZGxvY2tz
PwoKSSdtIGd1ZXNzaW5nIGEgYml0LCBidXQgSSAqdGhpbmsqIG5vbi1ibG9ja2luZyBoZXJlIHJl
YWxseSBtZWFucwpzb21ldGhpbmcgY2xvc2VyIHRvIFdRX01FTV9SRUNMQUlNLCBpZSB5b3UgY2Fu
J3QgZG8gYW55dGhpbmcgdGhhdCB3b3VsZApiZWNvbWUgZW50YW5nbGVkIHdpdGggbG9ja3MgaW4g
dGhlIGFsbG9jYXRvciB0aGF0IGFyZSBwZW5kaW5nIG9uIE9PTT8/CgooaWYgc28gd2UgcmVhbGx5
IHNob3VsZCBjYWxsIHRoaXMgcmVjbGFpbSBub3Qgbm9uLWJsb2NraW5nKQoKaWUgZm9yIE9EUCB1
bWVtX3J3c2VtIGlzIGhlbGQgYnkgdGhyZWFkcyB3aGlsZSBjYWxsaW5nIGludG8ga21hbGxvYywK
c28gd2hlbiB3ZSBnbyB0byBkbyB0aGUgZXhpdF9tbWFwIHdlIHN0aWxsIGRvIHRoZQppbnZhbGlk
YXRlX3JhbmdlX3N0YXJ0IGFuZCBjYW4gc3RpbGwgZW5kIHVwIGJsb2NrZWQgb24gYSBsb2NrIHRo
YXQgaXMKaGVsZCBieSBhIHRocmVhZCB3YWl0aW5nIGZvciBrbWFsbG9jIHRvIHJldHVybi4KCldv
dWxkIGJlIG5pY2UgdG8ga25vdyBpZiB0aGlzIGd1ZXNzIGlzIHJpZ2h0IG9yIG5vdC4KCkphc29u
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
