Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA9528AFC6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 10:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D996E03A;
	Mon, 12 Oct 2020 08:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9EB6E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 08:13:17 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id p15so21938973ejm.7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 01:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ISkqozpSXsD9a8Oh/2Mwcyva57KxR87dIuzCIf+AzK4=;
 b=vLxLC2ao0L4Ivfe+BPwXRED7H586V1sSXEIbMF9LfxQwxO+Zj65QHw9YpnzzpNF+5s
 pe0SgL866UCiUr5PMln2kM/rXsQAiQwxm9xqBa1r/w5BcshC+iOmiozfO7Z4u6AwQfAz
 Vfx3PqBr4wY4D9HosTE8Wp76eUyQkFEjvjbUBNXO9p/9oGzOrrNit+i1xQ8rB5QbDjQs
 F9Ihv4Bw7KG4xGNRxT0nbSDmdL/1EJi1xqf/gG4FNU+OUu4iG+9rU7nADfRhvp4+8AAf
 HcdDZZMKxxCfFS+tSPVctDoJoYUswL6SPs0UcCi3bxYvLZGbno5o1HYN8rV+tCw9Xic+
 UV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ISkqozpSXsD9a8Oh/2Mwcyva57KxR87dIuzCIf+AzK4=;
 b=uFZkW7KQbK6hh/PbxPtXngvHJiDmwcd7PwXGQtuacxAto9VGz6IIqxMriYdpw5y+4P
 fiuAKrxnoAGW4EEAB7T717gWrgXZRhjh1JANohbAz5bLuzHL6YReacY24wc6n0rv4ntn
 GV3fgb+RUWSawYET2b7YN8dBprcVabrksHvMOXk+thkpDCTT1hBcRwtatWp782CtfTiz
 QP/DMOTu1U38oMHnLilhxcjqm1G+kZnqcEI4U5b1mqP2ttWFnfQzE1RJZwNJKQL/rkd0
 9/9hd6A3JFODG4tGDOL/OmHb4G17jwnXMuI49uvri29JXNOAXpwbqAeq/IimvhPn3HYY
 GciQ==
X-Gm-Message-State: AOAM532QMwl3/AfO3xr2/k/tpoCrBPTzUpCu4lDxTMspeRwV3JKFeGiY
 +5dxngmJc0hc6MzQPSjff4I=
X-Google-Smtp-Source: ABdhPJyESr76MyJXr7Jw9FX0sBn+vlDp7RU85Q8VgP3nIl7qNvty4ksx+a/gWI8+0WMbFKdXmfr7Ow==
X-Received: by 2002:a17:906:4e06:: with SMTP id
 z6mr28073702eju.370.1602490395918; 
 Mon, 12 Oct 2020 01:13:15 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id p16sm10218325ejz.103.2020.10.12.01.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 01:13:15 -0700 (PDT)
Subject: Re: [PATCH 1/6] mm: mmap: fix fput in error path
To: Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>
References: <20201009150342.1979-1-christian.koenig@amd.com>
 <20201009150420.450833e3830b9d39a2385dd9@linux-foundation.org>
 <20201009222509.GC5177@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <666ef8f3-6299-3c0b-6ebb-04e957a115a1@gmail.com>
Date: Mon, 12 Oct 2020 10:13:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201009222509.GC5177@ziepe.ca>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Miaohe Lin <linmiaohe@huawei.com>, jhubbard@nvidia.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 willy@infradead.org, airlied@redhat.com, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTAuMTAuMjAgdW0gMDA6MjUgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gT24gRnJpLCBP
Y3QgMDksIDIwMjAgYXQgMDM6MDQ6MjBQTSAtMDcwMCwgQW5kcmV3IE1vcnRvbiB3cm90ZToKPj4g
T24gRnJpLCAgOSBPY3QgMjAyMCAxNzowMzozNyArMDIwMCAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNr
b2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPj4KPj4+IFBhdGNoICI0OTVj
MTBjYzFjMGMgQ0hST01JVU06IGRtYS1idWY6IHJlc3RvcmUgYXJncy4uLiIKPj4+IGFkZHMgYSB3
b3JrYXJvdW5kIGZvciBhIGJ1ZyBpbiBtbWFwX3JlZ2lvbi4KPj4+Cj4+PiBBcyB0aGUgY29tbWVu
dCBzdGF0ZXMgLT5tbWFwKCkgY2FsbGJhY2sgY2FuIGNoYW5nZQo+Pj4gdm1hLT52bV9maWxlIGFu
ZCBzbyB3ZSBtaWdodCBjYWxsIGZwdXQoKSBvbiB0aGUgd3JvbmcgZmlsZS4KPj4+Cj4+PiBSZXZl
cnQgdGhlIHdvcmthcm91bmQgYW5kIHByb3BlciBmaXggdGhpcyBpbiBtbWFwX3JlZ2lvbi4KPj4+
Cj4+IERvZXNuJ3QgdGhpcyBwYXRjaCBzZXJpZXMgYWRkcmVzcyB0aGUgc2FtZSB0aGluZyBhcwo+
PiBodHRwczovL2xrbWwua2VybmVsLm9yZy9yLzIwMjAwOTE2MDkwNzMzLjMxNDI3LTEtbGlubWlh
b2hlQGh1YXdlaS5jb20/Cj4gU2FtZSBiYXNpYyBpc3N1ZSwgbG9va3MgbGlrZSBib3RoIG9mIHRo
ZXNlIHBhdGNoZXMgc2hvdWxkIGJlIGNvbWJpbmVkCj4gdG8gcGx1ZyBpdCBmdWxseS4KClllcywg
YWdyZWUgY29tcGxldGVseS4KCkl0J3MgYSBkaWZmZXJlbnQgZXJyb3IgcGF0aCwgYnV0IHdlIG5l
ZWQgdG8gZml4IGJvdGggb2NjYXNpb25zLgoKQ2hyaXN0aWFuLgoKPgo+IEphc29uCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
