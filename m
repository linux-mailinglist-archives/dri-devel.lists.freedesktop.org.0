Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B669ABC7D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 17:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECAD6E2EE;
	Fri,  6 Sep 2019 15:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E20E6E2EE;
 Fri,  6 Sep 2019 15:29:30 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id z67so5933702qkb.12;
 Fri, 06 Sep 2019 08:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=b/OO1E7LJG7tbWcZdjZZ/ZvJB7xoR1AfPJejmKq9KUI=;
 b=cQQm/nBwixs49RfQl+Wk1O0kLvLjH4Lgl1BPThQBGz6XX8q2A+8jC2wOJa1hXOheSN
 eopWudNmSPqE5C2yqfcbHLCj0U0vqRrNku0T5ujSAis+3rMfG59ocvpisnfW03LJ063F
 aCBLito2alC2PEw2gzOIqmxfzImIBiqyatbgXwSCL6p9p7Kav03GPuTljxZR6L2fOr5D
 Ob/UMZrG0lhJnOqyAtoEBUc78B1wP+AfqDhbaObp+aftUS4QZOKYOdV8id5D9dkD2sfp
 cVvQ293kRYz+kcWg0tm52RnSscNSj5FXQ8qA3FaQfy6rGDaaF3xiBQItCOY3Mzx4db9g
 tYNQ==
X-Gm-Message-State: APjAAAUJCEnva3xUkHOcZFrt9OOyQ1YoWSbBTVnSOrtzvYzmEsftFlzC
 uIJOEbhp1qrpbzB1KSqzIeA=
X-Google-Smtp-Source: APXvYqzDUt/HLbUz5nMnb5lDEIlxnPoyo5pcHHv7+84TuScHqxwTG6/IxqfiMB4xhsuHP3hUlqM3SQ==
X-Received: by 2002:a37:4c9:: with SMTP id 192mr9732279qke.177.1567783769321; 
 Fri, 06 Sep 2019 08:29:29 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::e7cb])
 by smtp.gmail.com with ESMTPSA id j17sm3492093qta.0.2019.09.06.08.29.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Sep 2019 08:29:27 -0700 (PDT)
Date: Fri, 6 Sep 2019 08:29:25 -0700
From: Tejun Heo <tj@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH RFC v4 01/16] drm: Add drm_minor_for_each
Message-ID: <20190906152925.GN2263813@devbig004.ftw2.facebook.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190829060533.32315-2-Kenny.Ho@amd.com>
 <20190903075719.GK2112@phenom.ffwll.local>
 <CAOWid-dxxDhyxP2+0R0oKAk29rR-1TbMyhshR1+gbcpGJCAW6g@mail.gmail.com>
 <CAKMK7uEofjdVURu+meonh_YdV5eX8vfNALkW3A_+kLapCV8j+w@mail.gmail.com>
 <CAOWid-eUVztW4hNVpznnJRcwHcjCirGL2aS75p4OY8XoGuJqUg@mail.gmail.com>
 <20190904085434.GF2112@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904085434.GF2112@phenom.ffwll.local>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=b/OO1E7LJG7tbWcZdjZZ/ZvJB7xoR1AfPJejmKq9KUI=;
 b=qTRFHmFQimhNPTGJfIbGiQhea4mqqdyjlzhlY+Idm+aSLkpc7AYdXxIdUAzy3Q08AT
 cwvhXSv1nrv1OzbBLOw/SvSmOgiW3O6H1osyJVZUBi/B1srB/J35Oyoxi8S2GInDRzo0
 OyLatA0rMLYZVWpvbcQd2Yjgn5HPyOfx+eSBwZULfmVVVMYGYVKcohoUk3WxUNOISt+G
 ht/zbqIFqp7D+yvTK1uNzHop8RpurCw0RVvB93dfpwdx25fXCvsSgaRwMu6RCY7XYmTM
 fBNaIgO7X5xImNsKIFTYEXrg4qd65aKSTEWeXhLCS6NGmCg+chp1ExU97nx7PJVN5V51
 6HcA==
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 lkaplan@cray.com, Kenny Ho <y2kenny@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpPbiBXZWQsIFNlcCAwNCwgMjAxOSBhdCAxMDo1NDozNEFNICswMjAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+IEFueXdheSwgSSBkb24ndCB0aGluayByZXVzaW5nIHRoZSBkcm1fbWlu
b3IgcmVnaXN0cmF0aW9uIG1ha2VzIHNlbnNlLAo+IHNpbmNlIHdlIHdhbnQgdG8gYmUgb24gdGhl
IGRybV9kZXZpY2UsIG5vdCBvbiB0aGUgbWlub3IuIFdoaWNoIGlzIGEgYml0Cj4gYXdrd2FyZCBm
b3IgY2dyb3Vwcywgd2hpY2ggd2FudHMgdG8gaWRlbnRpZnkgZGV2aWNlcyB1c2luZyBtYWpvci5t
aW5vcgo+IHBhaXJzLiBCdXQgSSBndWVzcyBkcm0gaXMgdGhlIGZpcnN0IHN1YnN5c3RlbSB3aGVy
ZSAxIGRldmljZSBjYW4gYmUKPiBleHBvc2VkIHRocm91Z2ggbXVsdGlwbGUgbWlub3JzIC4uLgo+
IAo+IFRlanVuLCBhbnkgc3VnZ2VzdGlvbnMgb24gdGhpcz8KCkknbSBub3QgZXh0cmVtZWx5IGF0
dGFjaGVkIHRvIG1hajptaW4uICBJdCdzIG5pY2UgaW4gdGhhdCBpdCdkIGJlCmNvbnNpc3RlbnQg
d2l0aCBibGtjZyBidXQgaXQgYWxyZWFkeSBpc24ndCB0aGUgbmljZXN0IG9mIGlkZW50aWZpZXJz
CmZvciBibG9jayBkZXZpY2VzLiAgSWYgdXNpbmcgbWFqOm1pbiBpcyByZWFzb25hYmx5IHN0cmFp
Z2h0IGZvcndhcmQKZm9yIGdwdXMgZXZlbiBpZiBub3QgcGVyZmVjdCwgSSdkIHByZWZlciBnb2lu
ZyB3aXRoIG1hajptaW4uCk90aGVyd2lzZSwgcGxlYXNlIGZlZWwgZnJlZSB0byB1c2UgdGhlIElE
IGJlc3QgZm9yIEdQVXMgLSBob3BlZnVsbHkKc29tZXRoaW5nIHdoaWNoIGlzIGVhc3kgdG8gdW5k
ZXJzdGFuZCwgY29uc2lzdGVudCB3aXRoIElEcyB1c2VkCmVsc2V3aGVyZSBhbmQgZWFzeSB0byBi
dWlsZCB0b29saW5nIGFyb3VuZC4KClRoYW5rcy4KCi0tIAp0ZWp1bgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
