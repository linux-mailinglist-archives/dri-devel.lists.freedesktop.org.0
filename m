Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C58457298B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 10:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D609A6E499;
	Wed, 24 Jul 2019 08:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A75D6E499
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 08:09:06 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id w17so277218qto.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9Lpd+hOfQ/hSysjd4WRfKNMZK+VOhGnP5t1TFXShC7M=;
 b=VWSLTGgkj/8yn4xH1eS2mmHJKfEDrxvmqZrPw5tI3vT55aocnbhzMfyLVpqdjZwhsp
 Bkw1MC5vyUYUhCRVMdYNFfNpT1ouvmxwWY4LtkjkQlqoAv7387CIQhnSVX28X+ssvCHe
 pznVycbogisSRlbwpH38I+i6oanYjSAhd0lpaszu5p1U8dWvThuvGePPbgs507pYICpt
 i+7ix362nwKBwbFwhfYPj8LsayjexsWftzEB0fnDjnZI3Ll1IFZqmCBBMQuZdyD7Mu3g
 1idVHf9K547rk3VGqd6xnck3vXdf3mPOTx81YoBmZVWeSFrfcy/Q+vWF4f0FzLI5vD1m
 ncAg==
X-Gm-Message-State: APjAAAUPYGnZL/Jdep/VMs4uKdNn248Sf45cm3km6mYo69Bc3ickVTy9
 dWH41aswTolDKXffEMHRMGrOq3n8cK/EPzCwoosTcQ==
X-Google-Smtp-Source: APXvYqwhaR/vZAZ4Pspx2z7Xquj9JBXVTtZ3bp2S/aQJ83tPbQMPL0PZne0WPPs+ZPh0DWRYluwOZumHkN+9N+cgrXA=
X-Received: by 2002:a0c:d003:: with SMTP id u3mr59212119qvg.112.1563955745710; 
 Wed, 24 Jul 2019 01:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190624194908.121273-1-john.stultz@linaro.org>
 <20190624194908.121273-5-john.stultz@linaro.org>
 <20190718100840.GB19666@infradead.org>
 <CALAqxLWLx_tHVjZqrSNWfQ_M2RGGqh4qth3hi9GGRdSPov-gcw@mail.gmail.com>
 <20190724065958.GC16225@infradead.org>
In-Reply-To: <20190724065958.GC16225@infradead.org>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Wed, 24 Jul 2019 10:08:54 +0200
Message-ID: <CA+M3ks6yPTV4i=wEu41bHqMsn_VkYUj=y9BXGmgDgovnT9ESfA@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] dma-buf: heaps: Add CMA heap to dmabuf heaps
To: Christoph Hellwig <hch@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9Lpd+hOfQ/hSysjd4WRfKNMZK+VOhGnP5t1TFXShC7M=;
 b=VOQcbBOVW81gEk6UYdrISLr70kaZw7smJ93fG1k88v2CiADBQEGhOjdDrUVccAJ53f
 iis1zZNkYW8Ssai/XzSxFDoA/0X7+Xtv8H1HSftMVx+JHagoHr3iqjwcnloS+UJgjYdn
 vay/OWRz4LA3IZIIEnhiINZfTnCvMW358OdlNW0G0+UcvmfM3NY4LS3/RAbYpyi720/6
 /I0JoRE9RTyoGAKJa3jmDAuPx/4YAOfqSsOYNMNtYNyhXqIR0HG6vt0XrzuFptZWqyTY
 HIb5bqcET3ZOyf+wJldrySHQcJOIxg4PPRWsNHswPosnAir5E6PMWMzbq0Jr7gLCAK4P
 /LYQ==
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

TGUgbWVyLiAyNCBqdWlsLiAyMDE5IMOgIDA5OjAwLCBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+IGEgw6ljcml0IDoKPgo+IE9uIE1vbiwgSnVsIDIyLCAyMDE5IGF0IDEwOjA0
OjA2UE0gLTA3MDAsIEpvaG4gU3R1bHR6IHdyb3RlOgo+ID4gQXBvbG9naWVzLCBJJ20gbm90IHN1
cmUgSSdtIHVuZGVyc3RhbmRpbmcgeW91ciBzdWdnZXN0aW9uIGhlcmUuCj4gPiBkbWFfYWxsb2Nf
Y29udGlndW91cygpIGRvZXMgaGF2ZSBzb21lIGludGVyZXN0aW5nIG9wdGltaXphdGlvbnMKPiA+
IChhdm9pZGluZyBhbGxvY2F0aW5nIHNpbmdsZSBwYWdlIGZyb20gY21hKSwgdGhvdWdoIGl0cyBm
b2N1cyBvbgo+ID4gZGVmYXVsdCBhcmVhIHZzIHNwZWNpZmljIGRldmljZSBhcmVhIGRvZXNuJ3Qg
cXVpdGUgbWF0Y2ggdXAgdGhlIHVzYWdlCj4gPiBtb2RlbCBmb3IgZG1hIGhlYXBzLiAgSW5zdGVh
ZCBvZiBhbGxvY2F0aW5nIG1lbW9yeSBmb3IgYSBzaW5nbGUKPiA+IGRldmljZSwgd2Ugd2FudCB0
byBiZSBhYmxlIHRvIGFsbG93IHVzZXJsYW5kLCBmb3IgYSBnaXZlbiB1c2FnZSBtb2RlLAo+ID4g
dG8gYmUgYWJsZSB0byBhbGxvY2F0ZSBhIGRtYWJ1ZiBmcm9tIGEgc3BlY2lmaWMgaGVhcCBvZiBt
ZW1vcnkgd2hpY2gKPiA+IHdpbGwgc2F0aXNmeSB0aGUgdXNhZ2UgbW9kZSBmb3IgdGhhdCBidWZm
ZXIgcGlwZWxpbmUgKGFjcm9zcyBtdWx0aXBsZQo+ID4gZGV2aWNlcykuCj4gPgo+ID4gTm93LCBp
bmRlZWQsIHRoZSBzeXN0ZW0gYW5kIGNtYSBoZWFwcyBpbiB0aGlzIHBhdGNoc2V0IGFyZSBhIGJp
dAo+ID4gc2ltcGxlL3RyaXZpYWwgKHRob3VnaCB1c2VmdWwgd2l0aCBteSBkZXZpY2VzIHRoYXQg
cmVxdWlyZSBjb250aWd1b3VzCj4gPiBidWZmZXJzIGZvciB0aGUgZGlzcGxheSBkcml2ZXIpLCBi
dXQgbW9yZSBjb21wbGV4IElPTiBoZWFwcyBoYXZlCj4gPiB0cmFkaXRpb25hbGx5IHN0YXllZCBv
dXQgb2YgdHJlZSBpbiB2ZW5kb3IgY29kZSwgaW4gbWFueSBjYXNlcyBtYWtpbmcKPiA+IGluY29t
cGF0aWJsZSB0d2Vha3MgdG8gdGhlIElPTiBjb3JlIGRtYWJ1ZiBleHBvcnRlciBsb2dpYy4KPgo+
IFNvIHdoYXQgd291bGQgdGhlIG1vcmUgY29tcGxpY2F0ZWQgaGVhcHMgYmU/Cj4KPiA+IFRoYXQn
cyB3aHkKPiA+IGRtYWJ1ZiBoZWFwcyBpcyB0cnlpbmcgdG8gZGVzdGFnZSBJT04gaW4gYSB3YXkg
dGhhdCBhbGxvd3MgaGVhcHMgdG8KPiA+IGltcGxlbWVudCB0aGVpciBleHBvcnRlciBsb2dpYyB0
aGVtc2VsdmVzLCBzbyB3ZSBjYW4gc3RhcnQgcHVsbGluZwo+ID4gdGhvc2UgbW9yZSBjb21wbGlj
YXRlZCBoZWFwcyBvdXQgb2YgdGhlaXIgdmVuZG9yIGhpZGV5LWhvbGVzIGFuZCBnZXQKPiA+IHNv
bWUgcHJvcGVyIHVwc3RyZWFtIHJldmlldy4KPiA+Cj4gPiBCdXQgSSBzdXNwZWN0IEkganVzdCBh
bSBjb25mdXNlZCBhcyB0byB3aGF0IHlvdXIgc3VnZ2VzdGluZy4gTWF5YmUKPiA+IGNvdWxkIHlv
dSBleHBhbmQgYSBiaXQ/IEFwb2xvZ2llcyBmb3IgYmVpbmcgYSBiaXQgZGVuc2UuCj4KPiBNeSBz
dWdnZXN0aW9uIGlzIHRvIG1lcmdlIHRoZSBzeXN0ZW0gYW5kIENNQSBoZWFwcy4gIENNQSAoYXQg
bGVhc3QKPiB0aGUgc3lzdGVtLXdpZGUgQ01BIGFyZWEpIGlzIHJlYWxseSBqdXN0IGFuIG9wdGlt
aXphdGlvbiB0byBnZXQKPiBsYXJnZSBjb250aWdvdXMgcmVnaW9ucyBtb3JlIGVhc2lseS4gIFdl
IHNob3VsZCBtYWtlIHVzZSBvZiBpdCBhcwo+IHRyYW5zcGFyZW50IGFzIHBvc3NpYmxlLCBqdXN0
IGxpa2Ugd2UgZG8gaW4gdGhlIERNQSBjb2RlLgoKQ01BIGhhcyBtYWRlIHBvc3NpYmxlIHRvIGdl
dCBsYXJnZSByZWdpb25zIG9mIG1lbW9yaWVzIGFuZCB0byBnaXZlIHNvbWUKcHJpb3JpdHkgb24g
ZGV2aWNlIGFsbG9jYXRpbmcgcGFnZXMgb24gaXQuIEkgZG9uJ3QgdGhpbmsgdGhhdCBwb3NzaWJs
ZQp3aXRoIHN5c3RlbQpoZWFwIHNvIEkgc3VnZ2VzdCB0byBrZWVwIENNQSBoZWFwIGlmIHdlIHdh
bnQgdG8gYmUgYWJsZSB0byBwb3J0IGEgbWF4aW11bQpvZiBhcHBsaWNhdGlvbnMgb24gZG1hLWJ1
Zi1oZWFwLgoKQmVuamFtaW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
