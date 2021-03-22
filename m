Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F00003445E9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 14:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38E76E47B;
	Mon, 22 Mar 2021 13:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C5D6E471
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 13:36:53 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id k25so13027663oic.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 06:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IKX91CVLsysBuqgW2IV9FPxIuN4MJbVJi9aSymCIVIQ=;
 b=H99tmx948javoOPGemI0niAxhCXvwULc1m0MNoOM/sV2Uo6iIIS4gcGod74jWC3Ds2
 wcfdwbs2M7CP4pKtgtxZd/D44H9MxoO4ZByJbYgp2X4q38AWNqH7p5F/EO/aZLvPwfXW
 jP+gh0Mpa0DmCd+9zO/qcwpT0sAmBOaLx5/a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IKX91CVLsysBuqgW2IV9FPxIuN4MJbVJi9aSymCIVIQ=;
 b=NxUtaDOVWJkSwrFyXj2bO9GZjW7Yx6Zw3Zhgdbt3ZA9Hdib1pWVx0Cn4pYcB116S9f
 sQKPxhVtn39d6UgzAz7V26Vc4UuF0bBNttB8lp5o+6KVVx6pV/Qv0y89HObiG5X/WiYj
 X5RcfSR9uatdHRv1jFT21/mR8KS5WduUX6IFkKkpaoihZAqaVxN2CZzv29fxnOVHsX9o
 5iX6o2p7Hb7k8tflB1bN6nQ8YetFHu+liUJl9Q/GxizvC3PYH40WJ25fQm0Q4AgeiwPR
 Js+YI0gjTRfEpBI3AkseSF90e9V4r3/COCF0qHPp+nlKXJ8f9iWfs9qN35+Cz/V6AiAb
 uJyQ==
X-Gm-Message-State: AOAM531W4/uHVxOrmUnp89XozOGdS7SV1oDG+H9W+VpdgAvVIJsTKxqi
 1ZvrqptttHQAUKQsLHhbIh6v+LsOkqjN2DAWkuFTWQ==
X-Google-Smtp-Source: ABdhPJz1OoCXWxHQ6O1CtSMOOkxlolkptb9qETkrT32wtHPg1v5F+sC2LqHgUKcgQ1JkOXWJlLU6ZeO7uvAkGar8d+Y=
X-Received: by 2002:aca:4188:: with SMTP id o130mr9706845oia.101.1616420213155; 
 Mon, 22 Mar 2021 06:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210322112206.4574-1-christian.koenig@amd.com>
In-Reply-To: <20210322112206.4574-1-christian.koenig@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 22 Mar 2021 14:36:41 +0100
Message-ID: <CAKMK7uEesyYzDy+MfhN5YeS=XaChBaGxrhDjo1bu7EP8-fwrFw@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Liang.Liang@amd.com, dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgMjIsIDIwMjEgYXQgMTI6MjIgUE0gQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5p
Zy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRG9uJ3QgcHJpbnQgYSB3YXJu
aW5nIHdoZW4gd2UgZmFpbCB0byBhbGxvY2F0ZSBhIHBhZ2UgZm9yIHN3YXBwaW5nIHRoaW5ncyBv
dXQuCj4KPiB2Mjogb25seSBzdG9wIHRoZSB3YXJuaW5nCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpSZXZpZXdlZC1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCkl0IGlzIGtpbmRhIHN1cnByaXNp
bmcgdGhhdCBwYWdlIGFsbG9jYXRvciB3YXJucyBoZXJlIGV2ZW4gdGhvdWdoIHdlCmV4cGxpY2l0
bHkgYXNrZWQgZm9yIG5vbi1HRlBfS0VSTkVMICh3aGljaCBpcyB0aGUgb25seSBvbmUgd2hlcmUg
eW91CnByZXR0eSBtdWNoIGNhbiBhc3N1bWUgeW91IHdpbGwgZ2V0IG1lbW9yeSBubyBtYXR0ZXIg
d2hhdCwgc2luY2Ugd29yc3QKY2FzZSB0aGUgT09NIGtpbGxlciBtYWtlcyBzcGFjZSBmb3IgeW91
KS4KCkJ1dCB0aGVuIHdpdGggbWVtYWxsb2Nfbm8qIGFuZCBmcmllbmRzIHRoZXNlIGZhaWx1cmVz
IGNvdWxkIGhhcHBlbiBpbgp1bmV4cGVjdGVkIHBsYWNlcywgYW5kIEkgdGhpbmsgdGhlIGNvZGUg
dGhhdCB3YXJucyBpc24ndCBhd2FyZSBvZiB0aGUKb3JpZ2luYWwgZ2ZwIGZsYWdzLCBzbyBtYWtl
cyBzb21lIHNlbnNlIGZyb20gYW4gaW1wbGVtZW50YXRpb24gcG92LgotRGFuaWVsCgoKPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fdHQuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKPiBpbmRl
eCAyZjA4MzNjOThkMmMuLjQ4YjlhNjUwNjMwYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV90dC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+IEBA
IC0zNjksNyArMzY5LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgdHRtX3R0X3Nocmlua2VyX3Nj
YW4oc3RydWN0IHNocmlua2VyICpzaHJpbmssCj4gICAgICAgICB9Owo+ICAgICAgICAgaW50IHJl
dDsKPgo+IC0gICAgICAgcmV0ID0gdHRtX2JvX3N3YXBvdXQoJmN0eCwgR0ZQX05PRlMpOwo+ICsg
ICAgICAgcmV0ID0gdHRtX2JvX3N3YXBvdXQoJmN0eCwgR0ZQX05PRlMgfCBfX0dGUF9OT1dBUk4p
Owo+ICAgICAgICAgcmV0dXJuIHJldCA8IDAgPyBTSFJJTktfRU1QVFkgOiByZXQ7Cj4gIH0KPgo+
IC0tCj4gMi4yNS4xCj4KCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50
ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
