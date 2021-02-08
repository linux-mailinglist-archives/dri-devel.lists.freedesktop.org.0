Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A38C3140ED
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 21:51:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792BD6E9F8;
	Mon,  8 Feb 2021 20:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484E86E9F8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 20:51:05 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id f2so19054475ljp.11
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 12:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kTFr32bptu4tOZwE0ZuGkak5YWm4TyXH6EjCXCSCQOU=;
 b=fPkzJbfpY+rbqdzJyziCHL3LEul1WLLgf9TH3sO7UeY8/hZX3BuGEkSnMQTxrVxgmj
 ynhhO6rKYSPCXJzljB/G5dh6D/6Ab9HjYEOh0JNLDUnhL9Bikm3ewTtK18vfQq2JEyDk
 ZoW1LOAZ/DtcyppPbMaaXx48jvwDNvRjtHbftv8dLi2aOqVg0dhKdu5JcwKXY0Yfm8Wa
 3YV9RLPJldP9edDqzPioO0VvHZMQunOEaQW3flqc42qLTH3EUWMaagZsHCE/moBpwaxa
 3FBGgOlKrnB2Q2B7fz23YgzJDLywONpw9qFuo2JaPFyazzfndglQVbDBP++hmmXx2aqB
 7/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kTFr32bptu4tOZwE0ZuGkak5YWm4TyXH6EjCXCSCQOU=;
 b=T8QK2XOhu/RGtTjhM26UscWi3WjNgpCu8IBqEsWU+WMi9q68VqHcDfxs8uofcgfibd
 RSJ7yBaCo2ZM3JBmFJOgty20VNrWtGmehEP0xrL85xSK0WSq/cMxlT8xoiy0YDLE90A1
 sCqG8o5+bO6WZ72M5bTjGcMAGQg2WJLDy2yuU2k6Mts7SoDt21TXKfYZSwZg/S7WS3y4
 4+7dBzskVbsXKizD6BxWj/A+ohfk8eAH+znePyLVi7YfkAw+MKZrkLVX0Aebt93/tpUe
 gbBbWbqiiP0jWcSCZyMW8TZdplzdLPgxNVt6yfy11sgFcFa0m59KpgXs75O9OGDGH3DB
 ItcA==
X-Gm-Message-State: AOAM532i4RdYfgPJZvaSuWsa7M14kW6fKNMW/1OPOjdf4pqbHlJv4PMq
 IsEgNCm/amAz3/slhcBBa+aEhZudi5PgAPkbljOVZQ==
X-Google-Smtp-Source: ABdhPJzyLwGZIsnnaLCIXwnTE+bBhjn+823+aLJKw6/rPEzO6bZdXDtpP894AzuNEnj/AFCYBAmeFM6AKDOaToIttGM=
X-Received: by 2002:a2e:8090:: with SMTP id i16mr12425346ljg.257.1612817463364; 
 Mon, 08 Feb 2021 12:51:03 -0800 (PST)
MIME-Version: 1.0
References: <20210206054748.378300-1-john.stultz@linaro.org>
 <20210206054748.378300-2-john.stultz@linaro.org>
 <YCENrGofdwVg2LMe@phenom.ffwll.local>
In-Reply-To: <YCENrGofdwVg2LMe@phenom.ffwll.local>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 8 Feb 2021 12:50:49 -0800
Message-ID: <CALAqxLV2Sikxnr3-k94nqcF5vz+jsekhhUrmXEKkwzwwu4up8g@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/2] dma-buf: heaps: Fix the name used when exporting
 dmabufs to be the actual heap name
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Liam Mark <lmark@codeaurora.org>, 
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, 
 Brian Starkey <Brian.Starkey@arm.com>, Hridya Valsaraju <hridya@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Sandeep Patil <sspatil@google.com>, 
 Daniel Mentz <danielmentz@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>, 
 Robin Murphy <robin.murphy@arm.com>, Ezequiel Garcia <ezequiel@collabora.com>, 
 Simon Ser <contact@emersion.fr>, James Jones <jajones@nvidia.com>, 
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBGZWIgOCwgMjAyMSBhdCAyOjA4IEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4gd3JvdGU6Cj4gT24gU2F0LCBGZWIgMDYsIDIwMjEgYXQgMDU6NDc6NDhBTSArMDAwMCwg
Sm9obiBTdHVsdHogd3JvdGU6Cj4gPiBCeSBkZWZhdWx0IGRtYV9idWZfZXhwb3J0KCkgc2V0cyB0
aGUgZXhwb3J0ZXIgbmFtZSB0byBiZQo+ID4gS0JVSUxEX01PRE5BTUUuIFVuZm9ydHVuYXRlbHkg
dGhpcyBtYXkgbm90IGJlIGlkZW50aWNhbCB0byB0aGUKPiA+IHN0cmluZyB1c2VkIGFzIHRoZSBo
ZWFwIG5hbWUgKGllOiAic3lzdGVtIiB2cyAic3lzdGVtX2hlYXAiKS4KPiA+Cj4gPiBUaGlzIGNh
biBjYXVzZSBzb21lIG1pbm9yIGNvbmZ1c2lvbiB3aXRoIHRvb2xpbmcsIGFuZCB0aGVyZSBpcwo+
ID4gdGhlIGZ1dHVyZSBwb3RlbnRpYWwgd2hlcmUgbXVsdGlwbGUgaGVhcCB0eXBlcyBtYXkgYmUg
ZXhwb3J0ZWQKPiA+IGJ5IHRoZSBzYW1lIG1vZHVsZSAoYnV0IHdvdWxkIGFsbCBoYXZlIHRoZSBz
YW1lIG5hbWUpLgo+ID4KPiA+IFNvIHRvIGF2b2lkIGFsbCB0aGlzLCBzZXQgdGhlIGV4cG9ydGVy
IGV4cF9uYW1lIHRvIHRoZSBoZWFwIG5hbWUuCj4gPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KPiA+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8u
b3JnPgo+ID4gQ2M6IExpYW0gTWFyayA8bG1hcmtAY29kZWF1cm9yYS5vcmc+Cj4gPiBDYzogQ2hy
aXMgR29sZHN3b3J0aHkgPGNnb2xkc3dvQGNvZGVhdXJvcmEub3JnPgo+ID4gQ2M6IExhdXJhIEFi
Ym90dCA8bGFiYm90dEBrZXJuZWwub3JnPgo+ID4gQ2M6IEJyaWFuIFN0YXJrZXkgPEJyaWFuLlN0
YXJrZXlAYXJtLmNvbT4KPiA+IENjOiBIcmlkeWEgVmFsc2FyYWp1IDxocmlkeWFAZ29vZ2xlLmNv
bT4KPiA+IENjOiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPgo+ID4gQ2M6
IFNhbmRlZXAgUGF0aWwgPHNzcGF0aWxAZ29vZ2xlLmNvbT4KPiA+IENjOiBEYW5pZWwgTWVudHog
PGRhbmllbG1lbnR6QGdvb2dsZS5jb20+Cj4gPiBDYzogw5hyamFuIEVpZGUgPG9yamFuLmVpZGVA
YXJtLmNvbT4KPiA+IENjOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgo+ID4g
Q2M6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4KPiA+IENjOiBTaW1v
biBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+Cj4gPiBDYzogSmFtZXMgSm9uZXMgPGpham9uZXNA
bnZpZGlhLmNvbT4KPiA+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiA+IENjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIFN0
dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4KPgo+IExvb2tzIHJlYXNvbmFibGUgdG8gbWUu
Cj4KPiBJIGd1ZXNzIHRoZSBtYWluIHdvcnJ5IGlzICJkb2VzIHRoaXMgbWVhbiBoZWFwIG5hbWVz
IGJlY29tZSB1YXBpIiwgaW4KPiB3aGljaCBjYXNlIEknbSBtYXliZSBub3Qgc28gc3VyZSBhbnlt
b3JlIGhvdyB0aGlzIHdpbGwgdGllIGludG8gdGhlCj4gb3ZlcmFsbCBncHUgbWVtb3J5IGFjY291
bnRpbmcgc3RvcnkuCj4KPiBTaW5jZSBmb3IgZG1hLWJ1ZiBoZWFwcyBvbmUgbmFtZSBwZXIgYnVm
ZmVyIGlzIHBlcmZlY3RseSBmaW5lLCBzaW5jZQo+IGRtYS1idWYgaGVhcHMgYXJlbid0IHZlcnkg
ZHluYW1pYy4gQnV0IG9uIGRpc2NyZXRlIGdwdSBkcml2ZXJzIGJ1ZmZlcnMKPiBtb3ZlLCBzbyBi
YWtpbmcgaW4gdGhlIGFzc3VtcHRpb24gdGhhdCAiZXhwb3J0ZXIgbmFtZSA9IHJlc291cmNlIHVz
YWdlIGZvcgo+IHRoaXMgYnVmZmVyIiBpcyBicm9rZW4uCgpJIHN1c3BlY3QgSSdtIG1pc3Npbmcg
YSBzdWJ0bGV0eSBpbiB3aGF0IHlvdSdyZSBkZXNjcmliaW5nLiBNeSBzZW5zZQpvZiB0aGUgZXhw
b3J0ZXIgbmFtZSBkb2Vzbid0IGFjY291bnQgZm9yIGEgYnVmZmVyJ3MgdXNhZ2UsIGl0IGp1c3QK
ZGVzY3JpYmVzIHdoYXQgY29kZSBhbGxvY2F0ZWQgaXQgYW5kIGltcGxpY2l0bHkgd2hpY2ggZG1h
YnVmX29wcwpoYW5kbGVzIGl0LiAgTWF5YmUgY291bGQgeW91IGdpdmUgYSBtb3JlIHNwZWNpZmlj
IGV4YW1wbGUgb2Ygd2hhdAp5b3UncmUgaG9waW5nIHRvIGF2b2lkPwoKVG8gbWUgdGhpcyBwYXRj
aCBpcyBtb3N0bHkganVzdCBhIGNvbnNpc3RlbmN5L2xlYXN0LXN1cnByaXNlIHRoaW5nLCBzbwp0
aGUgaGVhcHMgZXhwb3J0ZXIgbmFtZSBtYXRjaGVzIHRoZSBzdHJpbmcgdXNlZCBmb3IgdGhlIGhl
YXAncyBjaGFyZGV2CmRldmljZSAodGhlIGludGVyZmFjZSB1c2VkIHRvIGFsbG9jYXRlIGl0KSBp
biBvdXRwdXQgbGlrZQpkZWJ1Z2ZzL2RtYV9idWYvYnVmaW5mby4KCnRoYW5rcwotam9obgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
