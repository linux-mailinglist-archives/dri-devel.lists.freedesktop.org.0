Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8DB751AF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 16:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711BB6E742;
	Thu, 25 Jul 2019 14:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3856E742
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 14:47:09 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id m14so10929179qka.10
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 07:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EpauZog8AJ0JP+jM70fncJTKaBzMsaQ9j0djN38srWU=;
 b=F1AwH50Z4rYbSHWqfpx2vhqmZUq1+owOdHIp2HtjIzlG7G2EhqKoFRXpj8g910y3hS
 XnwOo6Fl0O1moQi+/tXlDhnuyj8EI+BVafhgS7DpeRoZVNUDNgSC44b4t5rNZ7aeTfof
 WNFjkr3tce6wq8ievGoa3AQJQjhwF1iSr9dzofFwoBUYCwfTCU3xggQ487lDX8m5okqK
 rBmR9uhURhiltSXZ+w4l7B7wZnSVKWNknrAxVGaVwDxZkmu4Ysc0yZdQBoK0hpJsgMjI
 CYz3+gh1qVUC/TG7Q2rYFyiGRacVqX9ZfMcd3m+u21NrBFJwzkevupZWzOoDAQtYGfy6
 YQhA==
X-Gm-Message-State: APjAAAWiyoP0rPmQ4pCX4cFHJf+y1B1hKiFvBG1W7YGn2gVrtSGtN1Xm
 q7r88v8A3W0/bqiN6JqWQOUkb2khm10DFlIv+n1y9g==
X-Google-Smtp-Source: APXvYqwYX0b7/7Ql7NtzQjoaUIjjAeW642gLL+8VwcDRegxmXLgSOZ+3DpSyImxBEakEMyXESY2enVT+PzPCjvFI0MQ=
X-Received: by 2002:a05:620a:1286:: with SMTP id
 w6mr57362371qki.219.1564066028230; 
 Thu, 25 Jul 2019 07:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190624194908.121273-1-john.stultz@linaro.org>
 <20190624194908.121273-5-john.stultz@linaro.org>
 <20190718100840.GB19666@infradead.org>
 <CALAqxLWLx_tHVjZqrSNWfQ_M2RGGqh4qth3hi9GGRdSPov-gcw@mail.gmail.com>
 <20190724065958.GC16225@infradead.org>
 <CALAqxLUbsz+paJ=P2hwKecuN8DQjJt9Vj4MENCnFuEh6waxsXg@mail.gmail.com>
 <20190725125206.GE20286@infradead.org>
 <CA+M3ks52ADKVCw_pZP9=LSNt+vhiEFyrtB-Jm2x=p62kSV7qVA@mail.gmail.com>
 <20190725143335.GB21894@infradead.org>
In-Reply-To: <20190725143335.GB21894@infradead.org>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 25 Jul 2019 16:46:55 +0200
Message-ID: <CA+M3ks5s7GKdgUA1J3WDuRCdmQJkQ2t_CzqknAd5+S9FVynnfg@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] dma-buf: heaps: Add CMA heap to dmabuf heaps
To: Christoph Hellwig <hch@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EpauZog8AJ0JP+jM70fncJTKaBzMsaQ9j0djN38srWU=;
 b=pCIkimKBBofK2niPxQMPIL9oHxljTwswpTmsaxh50VBjjkBbyvgmRXJbRQpo1kJ2Qs
 lYIInkn3OZFH5TqZbEoY4M3KTunf8bZ8GXSveSRJX05tGUmoRmVpex5DGoxKP0JMenRW
 fUnYIw+JZTP4ygsXVOc33k2DdcVOvVvQMoWcvSiAehbWRnO7m9bH+fbwpLApwYROvBWy
 DKvzMA0GRpwcqr7EbI3fXGHn5sdej8kz4a5eDRkAN94n6INYGjQwbNYhNQ3UB6U4cb7O
 0BB/KYzB8tJT7HQs/Bo0pwr5oraUY2mY424OblaPNXFBLz5yHKy49xkkQI6414z5w/Q6
 SOwQ==
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
Cc: Yudongbin <yudongbin@hisilicon.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Xu YiPing <xuyiping@hisilicon.com>, Alistair Strachan <astrachan@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>,
 "Chenfeng \(puck\)" <puck.chen@hisilicon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Xiaqing \(A\)" <saberlily.xia@hisilicon.com>, "Andrew F . Davis" <afd@ti.com>,
 Pratik Patel <pratikp@codeaurora.org>, butao <butao@hisilicon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgamV1LiAyNSBqdWlsLiAyMDE5IMOgIDE2OjMzLCBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+IGEgw6ljcml0IDoKPgo+IE9uIFRodSwgSnVsIDI1LCAyMDE5IGF0IDAzOjIw
OjExUE0gKzAyMDAsIEJlbmphbWluIEdhaWduYXJkIHdyb3RlOgo+ID4gPiBCdXQgdGhhdCBqdXN0
IG1lYW5zIHdlIG5lZWQgYSBmbGFnIHRoYXQgbWVtb3J5IG5lZWRzIHRvIGJlIGNvbnRpZ3VvdXMs
Cj4gPiA+IHdoaWNoIHRvdGFsbHkgbWFrZXMgc2Vuc2UgYXQgdGhlIEFQSSBsZXZlbC4gIEJ1dCBD
TUEgaXMgbm90IHRoZSBvbmx5Cj4gPiA+IHNvdXJjZSBvZiBjb250aWdvdXMgbWVtb3J5LCBzbyB3
ZSBzaG91bGQgbm90IGNvbmZsYXRlIHRoZSB0d28uCj4gPgo+ID4gV2UgaGF2ZSBvbmUgZmlsZSBk
ZXNjcmlwdG9yIHBlciBoZWFwIHRvIGJlIGFibGUgdG8gYWRkIGFjY2VzcyBjb250cm9sCj4gPiBv
biBlYWNoIGhlYXAuCj4gPiBUaGF0IHdhc24ndCBwb3NzaWJsZSB3aXRoIElPTiBiZWNhdXNlIHRo
ZSBoZWFwIHdhcyBzZWxlY3RlZCBnaXZlbiB0aGUKPiA+IGZsYWdzIGluIGlvY3RsCj4gPiBzdHJ1
Y3R1cmUgYW5kIHdlIGNhbid0IGRvIGFjY2VzcyBjb250cm9sIGJhc2VkIG9uIHRoYXQuIElmIHdl
IHB1dCBmbGFnCj4gPiB0byBzZWxlY3QgdGhlCj4gPiBhbGxvY2F0aW9uIG1lY2hhbmlzbSAoc3lz
dGVtLCBDTUEsIG90aGVyKSBpbiBpb2N0bCB3ZSBjb21lIGJhY2sgdG8gSU9OIHN0YXR1cy4KPiA+
IEZvciBtZSBvbmUgYWxsb2NhdGlvbiBtZWNoYW5pc20gPSBvbmUgaGVhcC4KPgo+IFdlbGwsIEkg
YWdyZWUgd2l0aCB5b3VyIHNwbGl0IGZvciBkaWZmZXJlbnQgZnVuZGFtZW50YWxseSBkaWZmZXJl
bnQKPiBhbGxvY2F0b3JzLiAgQnV0IHRoZSBwb2ludCBpcyB0aGF0IENNQSAoYXQgbGVhc3QgdGhl
IHN5c3RlbSBjbWEgYXJlYSkKPiBmdW5kYW1lbnRhbGx5IGlzbid0IGEgZGlmZmVyZW50IGFsbG9j
YXRvci4gIFRoZSBwZXItZGV2aWNlIENNQSBhcmVhCj4gc3RpbGwgYXJlIGtpbmRhIHRoZSBzYW1l
LCBidXQgeW91IGNhbiBqdXN0IGhhdmUgb25lIGZkIGZvciBlYWNoCj4gcGVyLWRldmljZSBDTUEg
YXJlYSB0byBtYWtlIHlvdXIgbGlmZSBzaW1wbGUuCgpGb3JtIG15IHBvaW50IG9mIHZpZXcgZGVm
YXVsdCBjbWEgYXJlYSBpcyBhIHNwZWNpZmljIGFsbG9jYXRvciBiZWNhdXNlCml0IGNvdWxkIG1p
Z3JhdGUgcGFnZSB0byBnaXZlIHRoZW0gaW4gcHJpb3JpdHkgdG8gY29udGlnb3VzIGFsbG9jYXRp
b24uIEl0IGlzCmFsc28gb25lIG9mIHRoZSBsYXN0IHJlZ2lvbiB3aGVyZSBzeXN0ZW0gcGFnZSBh
cmUgZ29pbmcgdG8gYmUgYWxsb2NhdGVkLgpJIGRvbid0IHRoaW5rIHRoYXQgc3lzdGVtIGFsbG9j
YXRvciBkb2VzIGhhdmUgdGhlIHNhbWUgZmVhdHVyZXMsIGVpdGhlciB3ZQp3b3VsZCBoYXZlIHVz
ZSBpdCByYXRoZXIgZGV2ZWxvcCBDTUEgeWVhcnMgYWdvIDstKS4gSW4gc2hvcnQgQ01BIGhhZApz
b2x2ZWQgbG90IG9mIHByb2JsZW1zIG9uIG91ciBzaWRlIHNvIGl0IGhhZCB0byBoYXZlIGl0IG93
biBoZWFwLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
