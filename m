Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE692AD10C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DB7898FD;
	Tue, 10 Nov 2020 08:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A6B88EA3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 20:19:47 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id ek7so987360qvb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 12:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=HHHYB1ExYLieT1XHJGJI8HPhRjnPWnLekqDHsJKHIQY=;
 b=JXgaaqDOW62GJeK6LF9p9QXp4arZzjT+9gOkdgDMbbBoFO+8sUD00sB0JqVlcQZSxV
 vl2psYZJGXUFO5mwdAm7RkY4hAKaDkxQqxt9cCodVKzEWjgN2Avsu8bajD/+E6QYqqdC
 A1tRfbBTXbInfICRoJGTOSrrECkpnxpkzxbI7e/1OJCxzWq7kFD95wrfiSB8nZ6UecOk
 dClV/5rDLoThnRxwB0KwY4Vkv6oNJCO+A0hAlZU2ZqdpITWBVjpnAPdneJ9qCIAXfZVP
 ty/uyz1FELwQ29ayrN7FVG+4y3r6CEdfAZ6dA9hGacXCCPrSnv8g+b6mYWP6EPJDPMhi
 BDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HHHYB1ExYLieT1XHJGJI8HPhRjnPWnLekqDHsJKHIQY=;
 b=ObtK38xmCyugzM/mmnLHtRGRjizUoADJoLBeTV/xIBPaghoGaJGlEsdBXYLPbXF5Wp
 we8mW0jG7bax4TW59kfS7w+7e3M7k5Jv4GUc9A7lKfwfUd88EIUkL25IS7EoZ8bFk1Nx
 E8EjRdc9fSVqmYs7ydmh43XpAZPsoQTu50KW4whKjEe21c+a/UX3ATMd0jYE4K0yR98E
 oaG6HaET+DwcLfhfdY3t+403jQMifQlKlz6OIaGqTVu5yubJUx3knbXAB7/alM39Vfqi
 AwxKOZfisTGOEAL5CZfE0hnrGA27FdxEC9en9UrNpWSBvNJnbn19fXzi5ApxStcwbrvJ
 keXA==
X-Gm-Message-State: AOAM531xvjaEla/Y4wzfEHNbncbEZCkBznu7ymF5zcO3366eiwzgGiTU
 GJrlIeYmDFIq22b8qiGA0IPafQ==
X-Google-Smtp-Source: ABdhPJzK9dM3acw0STrCk9csKCfXW/JXgGf/mN+se1YyATHnQetQCofOE1QIpslDFg5IZrWXLNthmQ==
X-Received: by 2002:a0c:edb1:: with SMTP id h17mr15177616qvr.7.1604953186119; 
 Mon, 09 Nov 2020 12:19:46 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id l28sm6916468qkl.7.2020.11.09.12.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 12:19:45 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kcDdg-0026FV-KT; Mon, 09 Nov 2020 16:19:44 -0400
Date: Mon, 9 Nov 2020 16:19:44 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201109201944.GG244516@ziepe.ca>
References: <20201104164119.GA18218@infradead.org>
 <20201104181708.GU36674@ziepe.ca>
 <d3497583-2338-596e-c764-8c571b7d22cf@nvidia.com>
 <20201105092524.GQ401619@phenom.ffwll.local>
 <20201105124950.GZ36674@ziepe.ca>
 <7ae3486d-095e-cf4e-6b0f-339d99709996@nvidia.com>
 <CAKMK7uGRw=xXE+D=JJsNeRav9+hdO4tcDSvDbAuWfc3T4VkoJw@mail.gmail.com>
 <CAKMK7uFb2uhfRCwe1y5Kafd-WWqE_F3_FfpHR9f8-X-aHhgjOQ@mail.gmail.com>
 <20201106125505.GO36674@ziepe.ca>
 <504d77b87c81b7027157e0c7b5286e17123c59d9.camel@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <504d77b87c81b7027157e0c7b5286e17123c59d9.camel@linux.intel.com>
X-Mailman-Approved-At: Tue, 10 Nov 2020 08:16:57 +0000
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, KVM list <kvm@vger.kernel.org>,
 Pawel Osciak <pawel@osciak.com>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Christoph Hellwig <hch@infradead.org>,
 Linux MM <linux-mm@kvack.org>, J??r??me Glisse <jglisse@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDksIDIwMjAgYXQgMDk6NDQ6MDJBTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gd3JvdGU6Cj4gc3RhdGljIGlubGluZSBib29sIHZtYV9pc19zcGVjaWFsX2h1Z2UoY29uc3Qg
c3RydWN0IHZtX2FyZWFfc3RydWN0Cj4gKnZtYSkKPiB7Cj4gCXJldHVybiB2bWFfaXNfZGF4KHZt
YSkgfHwgKHZtYS0+dm1fZmlsZSAmJgo+IAkJCQkgICAodm1hLT52bV9mbGFncyAmIChWTV9QRk5N
QVAgfCBWTV9NSVhFRE1BUCkpKTsKPiB9CgpUaGF0IGlzIHRlc3RpbmcgYSBWTUEsIG5vdCBhIFBU
RSwgd2hpY2ggZG9lc24ndCBoZWxwIHByb3RlY3QKZ2V0X3VzZXJfcGFnZXNfZmFzdC4KClNvdW5k
cyBsaWtlIGlzIGhhcyBvcGVuZWQgYSBiaWcgdXNlciBjcmFzaHkgcHJvYmxlbSBpbiBEUk0gYW5k
IHRoZQpodWdlIHBhZ2Ugc3R1ZmYgbmVlZHMgdG8gYmUgcmV2ZXJldGVkLi4KCkRhbj8KCkphc29u
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
