Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB1643366
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5DC8931D;
	Thu, 13 Jun 2019 07:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21338908E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:02:25 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 81so9153892pfy.13
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SXiUTg8P9kKRgYZobjR73yxrvyBI+QR3gHSn3xV2sNk=;
 b=rhVjUKcmnweJFOBWEL4m6dKfEw0TWS5+0bJbFPXfgMD2n637inggLgZZ8hh0eEf321
 gqm7xtQehBPfPFFQf090rQCjxtYcZ6cBKapBeKYZ0MDqgCLCmVdgG2nq+KhMy2K3rQxe
 inEWk6mbLNWkLK4UyFFmSKDtNKEubXSiU21RmhmHHKAIvGkQs3NESqNGxFq+pJh6qH63
 DwfVJ/uNL2Ex7Nrf5DOlHCqhwjYwFVHidRn9JDggEbjVcasbCVRwLvBznQcsftUYTb9G
 kKkM15OAg7K+SOyJwWmvnOQUcpP0kyPdDI86Cw1TRWP/GmPzVFrNh3SvXELF31jS3TL7
 hcoA==
X-Gm-Message-State: APjAAAWpPRxxoVG8ZRbAW7ofmCk55nx6p18RDprh+es/C4tRx95tuZY9
 r5nOUgJqXGPm+ZTJXsvSvU8=
X-Google-Smtp-Source: APXvYqyXLoIbAePeHwNO0OOIUhplzQIrUNiANS5SrI0lvbzh0NuVJupyWFCAT364ZRU/Gs+muPfmOQ==
X-Received: by 2002:aa7:972a:: with SMTP id k10mr52413613pfg.116.1560326545252; 
 Wed, 12 Jun 2019 01:02:25 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
 by smtp.gmail.com with ESMTPSA id
 w62sm18263465pfw.132.2019.06.12.01.02.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 01:02:25 -0700 (PDT)
Date: Wed, 12 Jun 2019 01:02:14 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH] dma-buf: refcount the attachment for cache_sgt_mapping
Message-ID: <20190612080214.GA8876@Asurada>
References: <20190612012219.21652-1-nicoleotsuka@gmail.com>
 <261b46c7-0c5e-4268-619d-f8381fbc3aeb@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <261b46c7-0c5e-4268-619d-f8381fbc3aeb@amd.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SXiUTg8P9kKRgYZobjR73yxrvyBI+QR3gHSn3xV2sNk=;
 b=P9M1dR9nnALM0dwbM3XxQXTmmeCHWxxCR3IdHx6vDUqJrBbj3MJw+iS5S5/t9RDNy8
 VXM0Wep6hlSbFgGcCd4t1g+rTd06lxmB90ehFdzKpl/nfPQkkJaaLXID0bb++uh5ZRWb
 4f+eIAuGIQnSryRWwgi45NBtdSPkdKegHBuGbZYbDgDdACaI3HsmF2yZ1mkdDte/HPTn
 MA7CPzCi+udHsV8KE61Vy23DzLpjmpJlkHiXrnQzduJsR8hnjOL988mxO+N43knNyH4j
 MEQOEY/QXxjH4Gk8+6G3M0peyt8kYn4YW85dLcb2p55BwVIImhoBA+TvMkPFoCTVvEj/
 pTxg==
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLAoKVGhhbmtzIGZvciB0aGUgcXVpY2sgcmVwbHkuCgpPbiBXZWQsIEp1biAx
MiwgMjAxOSBhdCAwNzo0NTozOEFNICswMDAwLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToKPiBB
bSAxMi4wNi4xOSB1bSAwMzoyMiBzY2hyaWViIE5pY29saW4gQ2hlbjoKPiA+IENvbW1pdCBmMTNl
MTQzZTc0NDQgKCJkbWEtYnVmOiBzdGFydCBjYWNoaW5nIG9mIHNnX3RhYmxlIG9iamVjdHMgdjIi
KQo+ID4gYWRkZWQgYSBzdXBwb3J0IG9mIGNhY2hpbmcgdGhlIHNndCBwb2ludGVyIGludG8gYW4g
YXR0YWNoIHBvaW50ZXIgdG8KPiA+IGxldCB1c2VycyByZXVzZSB0aGUgc2d0IHBvaW50ZXIgd2l0
aG91dCBhbm90aGVyIG1hcHBpbmcuIEhvd2V2ZXIsIGl0Cj4gPiBtaWdodCBub3QgdG90YWxseSB3
b3JrIGFzIG1vc3Qgb2YgZG1hLWJ1ZiBjYWxsZXJzIGFyZSBkb2luZyBhdHRhY2goKQo+ID4gYW5k
IG1hcF9hdHRhY2htZW50KCkgYmFjay10by1iYWNrLCB1c2luZyBkcm1fcHJpbWUuYyBmb3IgZXhh
bXBsZToKPiA+ICAgICAgZHJtX2dlbV9wcmltZV9pbXBvcnRfZGV2KCkgewo+ID4gICAgICAgICAg
YXR0YWNoID0gZG1hX2J1Zl9hdHRhY2goKSB7Cj4gPiAgICAgICAgICAgICAgLyogQWxsb2NhdGlu
ZyBhIG5ldyBhdHRhY2ggKi8KPiA+ICAgICAgICAgICAgICBhdHRhY2ggPSBremFsbG9jKCk7Cj4g
PiAgICAgICAgICAgICAgLyogLi4uLiAqLwo+ID4gICAgICAgICAgICAgIHJldHVybiBhdHRhY2g7
Cj4gPiAgICAgICAgICB9Cj4gPiAgICAgICAgICBkbWFfYnVmX21hcF9hdHRhY2htZW50KGF0dGFj
aCwgZGlyZWN0aW9uKSB7Cj4gPiAgICAgICAgICAgICAgLyogYXR0YWNoLT5zZ3Qgd291bGQgYmUg
YWx3YXlzIGVtcHR5IGFzIGF0dGFjaCBpcyBuZXcgKi8KPiA+ICAgICAgICAgICAgICBpZiAoYXR0
YWNoLT5zZ3QpIHsKPiA+ICAgICAgICAgICAgICAgICAgLyogUmV1c2UgYXR0YWNoLT5zZ3QgKi8K
PiA+ICAgICAgICAgICAgICB9Cj4gPiAgICAgICAgICAgICAgLyogT3RoZXJ3aXNlLCBtYXAgaXQg
Ki8KPiA+ICAgICAgICAgICAgICBhdHRhY2gtPnNndCA9IG1hcCgpOwo+ID4gICAgICAgICAgfQo+
ID4gICAgICB9Cj4gPgo+ID4gU28sIGZvciBhIGNhY2hlX3NndF9tYXBwaW5nIHVzZSBjYXNlLCBp
dCB3b3VsZCBuZWVkIHRvIGdldCB0aGUgc2FtZQo+ID4gYXR0YWNobWVudCBwb2ludGVyIGluIG9y
ZGVyIHRvIHJldXNlIGl0cyBzZ3QgcG9pbnRlci4gU28gdGhpcyBwYXRjaAo+ID4gYWRkcyBhIHJl
ZmNvdW50IHRvIHRoZSBhdHRhY2goKSBmdW5jdGlvbiBhbmQgbGV0cyBpdCBzZWFyY2ggZm9yIHRo
ZQo+ID4gZXhpc3RpbmcgYXR0YWNoIHBvaW50ZXIgYnkgbWF0Y2hpbmcgdGhlIGRldiBwb2ludGVy
Lgo+IAo+IEkgZG9uJ3QgdGhpbmsgdGhhdCB0aGlzIGlzIGEgZ29vZCBpZGVhLgo+IAo+IFdlIHVz
ZSBzZ3QgY2FjaGluZyBhcyB3b3JrYXJvdW5kIGZvciBsb2NraW5nIG9yZGVyIHByb2JsZW1zIGFu
ZCB3YW50IHRvIAo+IHJlbW92ZSBpdCBhZ2FpbiBpbiB0aGUgbG9uZyB0ZXJtLgoKT2guIEkgdGhv
dWdodCBpdCB3YXMgZm9yIGEgcGVyZm9ybWFuY2UgaW1wcm92aW5nIHB1cnBvc2UuIEl0IG1heQpi
ZSBhIG1pc3VuZGVyc3RhbmRpbmcgdGhlbi4KCj4gU28gd2hhdCBpcyB0aGUgYWN0dWFsIHVzZSBj
YXNlIG9mIHRoaXM/CgpXZSBoYXZlIHNvbWUgc2ltaWxhciBkb3duc3RyZWFtIGNoYW5nZXMgYXQg
ZG1hX2J1ZiB0byByZWR1Y2UgdGhlCm92ZXJoZWFkIGZyb20gbXVsdGlwbGUgY2xpZW50cyBvZiB0
aGUgc2FtZSBkZXZpY2UgZG9pbmcgYXR0YWNoKCkKYW5kIG1hcF9hdHRhY2htZW50KCkgY2FsbHMg
Zm9yIHRoZSBzYW1lIGRtYV9idWYuCgpXZSBoYXZlbid0IHVzZWQgRFJNL0dSTV9QUklNRSB5ZXQg
YnV0IEkgYW0gYWxzbyBjdXJpb3VzIHdvdWxkIGl0CmJlbmVmaXQgRFJNIGFsc28gaWYgd2UgcmVk
dWNlIHRoaXMgb3ZlcmhlYWQgaW4gdGhlIGRtYV9idWY/CgpUaGFua3MKTmljb2xpbgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
