Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B2174F11
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 15:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6206E758;
	Thu, 25 Jul 2019 13:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875546E758
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 13:20:23 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id n11so48992201qtl.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 06:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hksOcYMTFsQQXxPG74pF4Ev5omBJ6BpaQhz1gWRfnWA=;
 b=oqkzzYt0oOzLwbmts3K72C3Lh4NS2zOwvj2PV7HWpPKYZPF+h8o58WEDEdFyuHCXaP
 +24Z80T0OvtKAA34Hzk9bPilrFzKJieQIwSzL/aTE7s8/PlsHZIOJ52EboknyPLp+E8o
 WKMxOn44bRcBX2G2HVmvoLG9ag+SlY6zJTL+7zg+50TJngMghazENW8RJo6W8fe5UhW6
 90TUK8MsYYvnwX+fRxseIGz+QAOrCQ/bNxvCehmA229awrjoIOu/pHzOzWTMX1nJghSD
 thjRO3aidQGI8w+WiZcc0SZnevRcM4RrMC0gsPVjklTNGr6IMMBJ1GXG50SSrOB3gVzt
 6aFw==
X-Gm-Message-State: APjAAAUYOOOgLNabf+DtTXnO4uOOYEkrWFjirGJJwtjJSnOoyHYZ9kso
 UJwFs6JKSWQ0sXbc7svCU2Exeeqdu5QZmxW9supSDA==
X-Google-Smtp-Source: APXvYqzbohpFc3U6eGc+1t9EcQe7Xduc50XTK8rY2fyUI8XmNmk8NGB9t9ex3V+pUZPDY5hCm9tEx+NwkrM8pQoP8Kg=
X-Received: by 2002:ac8:7219:: with SMTP id a25mr61991427qtp.234.1564060822527; 
 Thu, 25 Jul 2019 06:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190624194908.121273-1-john.stultz@linaro.org>
 <20190624194908.121273-5-john.stultz@linaro.org>
 <20190718100840.GB19666@infradead.org>
 <CALAqxLWLx_tHVjZqrSNWfQ_M2RGGqh4qth3hi9GGRdSPov-gcw@mail.gmail.com>
 <20190724065958.GC16225@infradead.org>
 <CALAqxLUbsz+paJ=P2hwKecuN8DQjJt9Vj4MENCnFuEh6waxsXg@mail.gmail.com>
 <20190725125206.GE20286@infradead.org>
In-Reply-To: <20190725125206.GE20286@infradead.org>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 25 Jul 2019 15:20:11 +0200
Message-ID: <CA+M3ks52ADKVCw_pZP9=LSNt+vhiEFyrtB-Jm2x=p62kSV7qVA@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] dma-buf: heaps: Add CMA heap to dmabuf heaps
To: Christoph Hellwig <hch@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hksOcYMTFsQQXxPG74pF4Ev5omBJ6BpaQhz1gWRfnWA=;
 b=mtl8aXY6om467I/IRPDfWhsEihgtMKaOYEz8QL8yLJvBwx9xKAmAQPrkOp1Vo38B9/
 aQ9vOKurZmrzM8ZpTDLNbxQyxjavPEGh6EErSqOnbi8Nb6NihoL2oXkGjD5xpSAVAID6
 KjtwDJ3aVfk5Sbm9+llQAEo+pjUNBXgC3xcgI995HebYCYdNc4igLjlGb74aR6k0tuD3
 W+3FF2JHUzwCx9wpYbINO+Ons8sA/FNu226bVz+6xWI1igdZGir0lIFg+5siubDUKTBv
 9I+pykPeBgve2ZbuvF8QNefQzEEQwQ0i7ERiaS+D1vKyhdhwlu99yOb2iuPsy3gvS5bF
 H34g==
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

TGUgamV1LiAyNSBqdWlsLiAyMDE5IMOgIDE0OjUyLCBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+IGEgw6ljcml0IDoKPgo+IE9uIFdlZCwgSnVsIDI0LCAyMDE5IGF0IDExOjQ2
OjI0QU0gLTA3MDAsIEpvaG4gU3R1bHR6IHdyb3RlOgo+ID4gSSdtIHN0aWxsIG5vdCB1bmRlcnN0
YW5kaW5nIGhvdyB0aGlzIHdvdWxkIHdvcmsuIEJlbmphbWluIGFuZCBMYXVyYQo+ID4gYWxyZWFk
eSBjb21tZW50ZWQgb24gdGhpcyBwb2ludCwgYnV0IGZvciBhIHNpbXBsZSBleGFtcGxlLCB3aXRo
IHRoZQo+ID4gSGlLZXkgYm9hcmRzLCB0aGUgRFJNIGRyaXZlciByZXF1aXJlcyBjb250aWd1b3Vz
IG1lbW9yeSBmb3IgdGhlCj4gPiBmcmFtZWJ1ZmZlciwgYnV0IHRoZSBHUFUgY2FuIGhhbmRsZSBu
b24tY29udGlndW91cy4gVGh1cyB0aGUgdGFyZ2V0Cj4gPiBmcmFtZWJ1ZmZlcnMgdGhhdCB3ZSBw
YXNzIHRvIHRoZSBkaXNwbGF5IGhhcyB0byBiZSBDTUEgYWxsb2NhdGVkLCBidXQKPiA+IGFsbCB0
aGUgb3RoZXIgZ3JhcGhpY3MgYnVmZmVycyB0aGF0IHRoZSBHUFUgd2lsbCByZW5kZXIgdG8gYW5k
Cj4gPiBjb21wb3NpdGUgY2FuIGJlIHN5c3RlbS4KCk5vIHdlIGhhdmUgdXNlcyBjYXNlcyB3aGVy
ZSBncmFwaGljIGJ1ZmZlcnMgY2FuIGdvIGRpcmVjdGx5IHRvIGRpc3BsYXkgd2l0aG91dAp1c2lu
ZyBHUFUuIEZvciBleGFtcGxlIHdlIGNhbiBncmFiIGZyYW1lcyBmcm9tIHRoZSBjYW1lcmEgYW5k
IHNlbmQgdGhlbSBkaXJlY3RseQppbiBkaXNwbGF5IChzYW1lIGZvciB2aWRlbyBkZWNvZGVyKSBi
ZWNhdXNlIHdlIGhhdmUgcGxhbmVzIGZvciB0aGF0LgoKPgo+IEJ1dCB0aGF0IGp1c3QgbWVhbnMg
d2UgbmVlZCBhIGZsYWcgdGhhdCBtZW1vcnkgbmVlZHMgdG8gYmUgY29udGlndW91cywKPiB3aGlj
aCB0b3RhbGx5IG1ha2VzIHNlbnNlIGF0IHRoZSBBUEkgbGV2ZWwuICBCdXQgQ01BIGlzIG5vdCB0
aGUgb25seQo+IHNvdXJjZSBvZiBjb250aWdvdXMgbWVtb3J5LCBzbyB3ZSBzaG91bGQgbm90IGNv
bmZsYXRlIHRoZSB0d28uCgpXZSBoYXZlIG9uZSBmaWxlIGRlc2NyaXB0b3IgcGVyIGhlYXAgdG8g
YmUgYWJsZSB0byBhZGQgYWNjZXNzIGNvbnRyb2wKb24gZWFjaCBoZWFwLgpUaGF0IHdhc24ndCBw
b3NzaWJsZSB3aXRoIElPTiBiZWNhdXNlIHRoZSBoZWFwIHdhcyBzZWxlY3RlZCBnaXZlbiB0aGUK
ZmxhZ3MgaW4gaW9jdGwKc3RydWN0dXJlIGFuZCB3ZSBjYW4ndCBkbyBhY2Nlc3MgY29udHJvbCBi
YXNlZCBvbiB0aGF0LiBJZiB3ZSBwdXQgZmxhZwp0byBzZWxlY3QgdGhlCmFsbG9jYXRpb24gbWVj
aGFuaXNtIChzeXN0ZW0sIENNQSwgb3RoZXIpIGluIGlvY3RsIHdlIGNvbWUgYmFjayB0byBJT04g
c3RhdHVzLgpGb3IgbWUgb25lIGFsbG9jYXRpb24gbWVjaGFuaXNtID0gb25lIGhlYXAuCgo+Cj4g
PiBMYXVyYSBhbHJlYWR5IHRvdWNoZWQgb24gdGhpcywgYnV0IHNpbWlsYXIgbG9naWMgY2FuIGJl
IHVzZWQgZm9yCj4gPiBjYW1lcmEgYnVmZmVycywgd2hpY2ggY2FuIG1ha2Ugc3VyZSB3ZSBhbGxv
Y2F0ZSBmcm9tIGEgc3BlY2lmaWNhbGx5Cj4gPiByZXNlcnZlZCBDTUEgcmVnaW9uIHRoYXQgaXMg
b25seSB1c2VkIGZvciB0aGUgY2FtZXJhIHNvIHdlIGNhbiBhbHdheXMKPiA+IGJlIHN1cmUgdG8g
aGF2ZSBOIGZyZWUgYnVmZmVycyBpbW1lZGlhdGVseSB0byBjYXB0dXJlIHdpdGgsIGV0Yy4KPgo+
IEFuZCBmb3IgdGhhdCB3ZSBhbHJlYWR5IGhhdmUgcGVyLWRldmljZSBDTUEgYXJlYXMgaGFuZ2lu
ZyBvZmYgc3RydWN0Cj4gZGV2aWNlLCB3aGljaCB0aGlzIHNob3VsZCByZXVzZSBpbnN0ZWFkIG9m
IGFkZGluZyBhbm90aGVyIGR1cGxpY2F0ZQo+IENNQSBhcmVhIGxvb2t1cCBzY2hlbWUuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
