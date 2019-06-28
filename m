Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9B65A720
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2019 00:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDA86E938;
	Fri, 28 Jun 2019 22:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F016E938
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 22:47:33 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3448208E3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 22:47:32 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id s22so6264643qkj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 15:47:32 -0700 (PDT)
X-Gm-Message-State: APjAAAXFpayUXxXRWaa8nnKkaPlUqZe26PHsCiis796etEp4r/XjP/MJ
 qv9px2hBy0SgtgZWyqgmbz744rkzhKfd+Egk+g==
X-Google-Smtp-Source: APXvYqwZcAEztIfeJKR/l+OjGkLbDrNoV6cF8P4jA29+W4ejMA1/eHHgTvyF8p5wO1lb6pP/HPBIb+yXObkLHpBk8lg=
X-Received: by 2002:a37:a48e:: with SMTP id
 n136mr11138414qke.223.1561762052134; 
 Fri, 28 Jun 2019 15:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190627172414.27231-1-boris.brezillon@collabora.com>
In-Reply-To: <20190627172414.27231-1-boris.brezillon@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 28 Jun 2019 16:47:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKFP2Z1B3oOK9DBZpmVN=tuK-RqqNWbg4=nKCH_cAZPzg@mail.gmail.com>
Message-ID: <CAL_JsqKFP2Z1B3oOK9DBZpmVN=tuK-RqqNWbg4=nKCH_cAZPzg@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Fix a double-free error
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561762052;
 bh=d1ga57vWxujYj83xEsaBg10bKl0FEJJQU18PfYyt+GU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wCO6H8OedIkHRnSE3Z3aI72N/v0zoMhqjbQYnH9d4NrvhzxjoUB6qpEn3WKgU27G9
 ygB36yDKcWUUJkauWpAVH43zBwgjlgYJFJDtDdyl3OsxOaTGyAwzq4ucfvCX/TulMs
 6tuEOhAvXjokVuryvI9YZ7KxPhowUN2hMpMD56Dg=
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
Cc: stable <stable@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMTE6MjQgQU0gQm9yaXMgQnJlemlsbG9uCjxib3Jpcy5i
cmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBkcm1fZ2VtX3NobWVtX2NyZWF0ZV93
aXRoX2hhbmRsZSgpIHJldHVybnMgYSBHRU0gb2JqZWN0IGFuZCBhdHRhY2ggYQo+IGhhbmRsZSB0
byBpdC4gV2hlbiB0aGUgdXNlciBjbG9zZXMgdGhlIERSTSBGRCwgdGhlIGNvcmUgcmVsZWFzZXMg
YWxsCj4gR0VNIGhhbmRsZXMgYWxvbmcgd2l0aCB0aGVpciBiYWNraW5nIEdFTSBvYmpzLCB3aGlj
aCBjYW4gbGVhZCB0byBhCj4gZG91YmxlLWZyZWUgaXNzdWUgaWYgcGFuZnJvc3RfaW9jdGxfY3Jl
YXRlX2JvKCkgZmFpbGVkIGFuZCB3ZW50Cj4gdGhyb3VnaCB0aGUgZXJyX2ZyZWUgcGF0aCB3aGVy
ZSBkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQoKSBpcwo+IGNhbGxlZCB3aXRob3V0IGRlbGV0
aW5nIHRoZSBhc3NvY2lhdGUgaGFuZGxlLgo+Cj4gUmVwbGFjZSB0aGlzIGRybV9nZW1fb2JqZWN0
X3B1dF91bmxvY2tlZCgpIGNhbGwgYnkgYQo+IGRybV9nZW1faGFuZGxlX2RlbGV0ZSgpIG9uZSB0
byBmaXggdGhhdC4KPgo+IEZpeGVzOiBmM2JhOTEyMjhlOGUgKCJkcm0vcGFuZnJvc3Q6IEFkZCBp
bml0aWFsIHBhbmZyb3N0IGRyaXZlciIpCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+
IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9y
YS5jb20+Cj4gLS0tCj4gUmVwcm9kdWNlZCBmb3IgcmVhbCB3aGVuIEJPIG1hcHBpbmcgZmFpbHMg
YmVjYXVzZSB3ZSByYW4gb3V0IG9mCj4gbWVtb3J5Lgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKQXBwbGllZCB0byBkcm0tbWlzYy1maXhlcy4KClJvYgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
