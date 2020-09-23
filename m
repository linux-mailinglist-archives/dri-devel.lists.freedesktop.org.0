Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245BF276256
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 22:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7136E9FA;
	Wed, 23 Sep 2020 20:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD496E9FA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 20:43:39 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id i26so1403338ejb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 13:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kEJOxl8qRQk8cHYmwpwCgwbc9GJVQBmxdSKpqHFlptA=;
 b=ZCTd53IDbXanPUFM91qhKTi6q6z+czlijar0wsTq6qCKvRGMoA50Rwfly/u9CXYELo
 E+3sik74tJJT+pDk4kuXmfngA6jTE29Vr72hiBSIzsuX9fYGqsa3wWGoHo3LIt6/HoKa
 5YeQ8A9nSNiB8oPwQWceX5uT2tJQZ7QgiA/NRYQFw4vPREdiF9mGdACG1QWHioAVOHJ3
 jZUew6PdtvNSEE9wA10J0+aZ0vLa5QKWaK1HJAX7QIHwk+bbeVF5eMIMCWsQhmupoISL
 Az+/YuAUZHniMqsSzgzUbIUU9Itp4mTmJpEvhGb/+N8CWLJYFrFASqLLx0INrpAKbXEI
 6FrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kEJOxl8qRQk8cHYmwpwCgwbc9GJVQBmxdSKpqHFlptA=;
 b=gfJHSV5VAdoRngiVGPqcDrkYN3h+Blkx/rezRYWMMla9wFN39cCLB6wHIH4VCASc0w
 JDBhVAVD22Uqn8xIWWvby9NooS2vY8SJO6TdtSknzqS7whHdyAvvrReNmC7RwpeEs2r3
 9kHS8MiPyRm4Two6/HgeuNyk0ui+u/n+IE4RBJspMA1djOh+/eVLtCaoBIgWQES0Gw89
 BbMXFw6RzUiiTyq7g2ZVne6I+KyfwfDj0Gjrk3wELr9vPa44kaHFhDNeUiZcdgTUowoD
 U8rphvmQIxOT1HN+wpIqeIWM9Q6fImJJWvdazWJjpY9X+69iE4prte4EbUiV+kkD3w8k
 tiAQ==
X-Gm-Message-State: AOAM530KTRf/HLq0DR4utxjUauctC8SIxjsFBckza6MYO0sm6b7yyFVn
 hR7+h+N8Bk/sghB4GTg/ExVCaqLXjIR27KuOT8E=
X-Google-Smtp-Source: ABdhPJzilz14W/WWMfUl0Xc9oQr9WaeEiB9uh5PJEvKZQ4AxEiPI1SuFIM+sxvYv36+BQGMJeTVDsrvsKDK90MvxPnE=
X-Received: by 2002:a17:906:d787:: with SMTP id
 pj7mr1372647ejb.340.1600893817871; 
 Wed, 23 Sep 2020 13:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200923030454.362731-1-airlied@gmail.com>
 <20200923030454.362731-11-airlied@gmail.com>
 <a66afa9c-2f3c-3e0a-8637-2cea7e7918c1@amd.com>
In-Reply-To: <a66afa9c-2f3c-3e0a-8637-2cea7e7918c1@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 24 Sep 2020 06:43:26 +1000
Message-ID: <CAPM=9tzO6F8BGE==a8PLLFvhGqgc0E_H1zrH1xBqWySF6_iunQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] drm/ttm: reverse move calling pattern.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNCBTZXAgMjAyMCBhdCAwMDo0NSwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDIzLjA5LjIwIHVtIDA1OjA0IHNjaHJpZWIg
RGF2ZSBBaXJsaWU6Cj4gPiBGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+
ID4KPiA+IENhbGwgdGhlIGRyaXZlciBtb3ZlIGZ1bmN0aW9uIGlmIGl0IGV4aXN0cywgb3RoZXJ3
aXNlIHVzZSB0aGUKPiA+IGZhbGxiYWNrIHR0bS9tZW1jcHkgcGF0aHMuCj4KPiBJIHdvdWxkIHJh
dGhlciBsaWtlIHRvIHNlZSB0aGUgbW92ZSBjYWxsYmFjayBtYWRlIG1hbmRhdG9yeSBpbnN0ZWFk
LgoKSW5kZWVkIHRoaXMgbWFrZXMgc29tZSBzdHVmZiBqdXN0IGVhc2llciB0byBkZWFsIHdpdGgu
CgpEYXZlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
