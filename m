Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB122EFD92
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 04:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F003A6E416;
	Sat,  9 Jan 2021 03:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CEB6E416
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jan 2021 03:44:28 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id u25so7036914lfc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 19:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HD/4viRtfwM399mGOKfKs0Gn3g0BoLDsv4d+I17dgcw=;
 b=WK8ARnKNiOzvrjlOgn3JOdaq1kaUecOF/7zvSZnDR6+k0sE+pM3XL/wX0NhL8y+LWR
 maEu4/DnDNd6Q2i9XurgxLiK0jbfmB9uFbCEoxVVeYb1zN1XL7wnDdadzZoU54KkrivG
 4PRSAlLJw7a+esJO5ppq5/CXBeqLV1eEbMZFZ1/Qw7KuM3+JQchcDZP2jKK7vLuI90zw
 PHydTkyuaL6mpwSaiNwxIufYaZfiLBkaku5FGAtTxrz6RrGqR1LhkdP58evQ3+y0vvyP
 Ls+yUy3ZjGBlGylO2bUghiCwYk5RLN4GVrYP3mmPGbZOcUrtSFNZW7vKYHpIUS823ySd
 F5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HD/4viRtfwM399mGOKfKs0Gn3g0BoLDsv4d+I17dgcw=;
 b=p/5Ivpt4Nm+XJpUaeHXrA8f5sC6bwQyiWfVfC30j1inAx6SmHkjUKA9CAdAtglFtoh
 nEOWtirZn3AiUXj8vUpTkM8nDIBUTsbaiEMxAxX41ZAbu76pIaFkaJB3MFxDrfeRjbFy
 H0sDoh1DCVVUEgIigPbVrJ0UVH94YixhqJw8MkN5M24l4cRUf7fEmt6N0wx65jtL64Rr
 P7P3nopmEoDcFT0Hwg7t56yQ1yhgwko6VGpta4NdZcbvLbsu95pIZvDPhbSsrhHe+tFq
 9ZRonvBhdYuoCeNFCpv2/iYXryUHARtMCVaXWzGQeqGLB3A/9X8W3QIkQdLEsutNws28
 JmkQ==
X-Gm-Message-State: AOAM530jGERg3M5Uy5zHxxGN6C28XBUwg9DM4F7lIJ/AGhykAVkPxMm6
 QtgdkQy6yxQ18bQjyQKdiA9fg/skbqk5U89ssdxNIQ==
X-Google-Smtp-Source: ABdhPJyZXQilDKeEMaUqBwDSsXwImGMNtYgnwmPGpRArK1E1OR4/l0JkRDIUv/vXuXgmte5xrqEJ1m1RX8xMyQEYtVs=
X-Received: by 2002:a05:6512:61:: with SMTP id
 i1mr2683474lfo.343.1610163866124; 
 Fri, 08 Jan 2021 19:44:26 -0800 (PST)
MIME-Version: 1.0
References: <20210107202616.75170-1-john.stultz@linaro.org>
In-Reply-To: <20210107202616.75170-1-john.stultz@linaro.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Sat, 9 Jan 2021 09:14:14 +0530
Message-ID: <CAO_48GGyAhz_sXe22H6aZSiJQ2sSEgJ=HpaAkOfi-DmVmwvNtw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: cma_heap: Fix memory leak in CMA heap
To: John Stultz <john.stultz@linaro.org>
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
Cc: Sandeep Patil <sspatil@google.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Bing Song <bing.song@nxp.com>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9obiwKCk9uIEZyaSwgOCBKYW4gMjAyMSBhdCAwMTo1NiwgSm9obiBTdHVsdHogPGpvaG4u
c3R1bHR6QGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gQmluZyBTb25nIG5vdGljZWQgdGhlIENNQSBo
ZWFwIHdhcyBsZWFraW5nIG1lbW9yeSBkdWUgdG8gYSBmbHViCj4gSSBtYWRlIGluIGNvbW1pdCBh
NWQyZDI5ZTI0YmUgKCJkbWEtYnVmOiBoZWFwczogTW92ZSBoZWFwLWhlbHBlcgo+IGxvZ2ljIGlu
dG8gdGhlIGNtYV9oZWFwIGltcGxlbWVudGF0aW9uIiksIGFuZCBwcm92aWRlZCB0aGlzIGZpeAo+
IHdoaWNoIGVuc3VyZXMgdGhlIHBhZ2VsaXN0IGlzIGFsc28gZnJlZWQgb24gcmVsZWFzZS4KVGhh
bmtzIGZvciB5b3VyIHBhdGNoLgo+Cj4gQ2M6IEJpbmcgU29uZyA8YmluZy5zb25nQG54cC5jb20+
Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IExpYW0g
TWFyayA8bG1hcmtAY29kZWF1cm9yYS5vcmc+Cj4gQ2M6IExhdXJhIEFiYm90dCA8bGFiYm90dEBr
ZXJuZWwub3JnPgo+IENjOiBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5jb20+Cj4g
Q2M6IEhyaWR5YSBWYWxzYXJhanUgPGhyaWR5YUBnb29nbGUuY29tPgo+IENjOiBTdXJlbiBCYWdo
ZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPgo+IENjOiBTYW5kZWVwIFBhdGlsIDxzc3BhdGls
QGdvb2dsZS5jb20+Cj4gQ2M6IERhbmllbCBNZW50eiA8ZGFuaWVsbWVudHpAZ29vZ2xlLmNvbT4K
PiBDYzogQ2hyaXMgR29sZHN3b3J0aHkgPGNnb2xkc3dvQGNvZGVhdXJvcmEub3JnPgo+IENjOiDD
mHJqYW4gRWlkZSA8b3JqYW4uZWlkZUBhcm0uY29tPgo+IENjOiBSb2JpbiBNdXJwaHkgPHJvYmlu
Lm11cnBoeUBhcm0uY29tPgo+IENjOiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9y
YS5jb20+Cj4gQ2M6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KPiBDYzogSmFtZXMg
Sm9uZXMgPGpham9uZXNAbnZpZGlhLmNvbT4KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwu
b3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBSZXBvcnRlZC1ieTog
QmluZyBTb25nIDxiaW5nLnNvbmdAbnhwLmNvbT4KPiBGaXhlczogYTVkMmQyOWUyNGJlICgiZG1h
LWJ1ZjogaGVhcHM6IE1vdmUgaGVhcC1oZWxwZXIgbG9naWMgaW50byB0aGUgY21hX2hlYXAgaW1w
bGVtZW50YXRpb24iKQo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBs
aW5hcm8ub3JnPgoKSSB3aWxsIHF1ZXVlIGl0IHVwIHNvIGl0IGdldHMgaW4gdGhlIHY1LjExIGN5
Y2xlLgo+IC0tLQo+ICBkcml2ZXJzL2RtYS1idWYvaGVhcHMvY21hX2hlYXAuYyB8IDMgKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2RtYS1idWYvaGVhcHMvY21hX2hlYXAuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVh
cC5jCj4gaW5kZXggM2M0ZTM0MzAxMTcyLi4zNjRmYzJmM2U0OTkgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvaGVh
cHMvY21hX2hlYXAuYwo+IEBAIC0yNTEsNiArMjUxLDkgQEAgc3RhdGljIHZvaWQgY21hX2hlYXBf
ZG1hX2J1Zl9yZWxlYXNlKHN0cnVjdCBkbWFfYnVmICpkbWFidWYpCj4gICAgICAgICAgICAgICAg
IGJ1ZmZlci0+dmFkZHIgPSBOVUxMOwo+ICAgICAgICAgfQo+Cj4gKyAgICAgICAvKiBmcmVlIHBh
Z2UgbGlzdCAqLwo+ICsgICAgICAga2ZyZWUoYnVmZmVyLT5wYWdlcyk7Cj4gKyAgICAgICAvKiBy
ZWxlYXNlIG1lbW9yeSAqLwo+ICAgICAgICAgY21hX3JlbGVhc2UoY21hX2hlYXAtPmNtYSwgYnVm
ZmVyLT5jbWFfcGFnZXMsIGJ1ZmZlci0+cGFnZWNvdW50KTsKPiAgICAgICAgIGtmcmVlKGJ1ZmZl
cik7Cj4gIH0KPiAtLQo+IDIuMTcuMQo+CkJlc3QsClN1bWl0LgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
