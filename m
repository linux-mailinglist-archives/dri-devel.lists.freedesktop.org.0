Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE191324DFC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 11:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EFC6EC8A;
	Thu, 25 Feb 2021 10:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5E26EC8A;
 Thu, 25 Feb 2021 10:28:34 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id h10so6142790edl.6;
 Thu, 25 Feb 2021 02:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=TVKAjWBFusaHyTtxALPIeACysl8qlhJqMmxF1Z/3BQc=;
 b=KvT6uHV3ltQQhKNAxhivu1WaoQNP6hJd5KdyNGhOZzV3MFX5tYjNtdWuTP9AjxAm9u
 t/N1MkyWh8kg69o8urHsk7zDck/zOgNio6qdWVGet3ki3S9ysgXQblGyreIP5Ph77p6y
 EwPT8y17+qmJx8LH1tG6oiIcwq9Fj8SGseVhOB8JKtsFaRnNkB7NJBmnWgRjKcT2iIOk
 S6xvGKbX/th/EYMn2UPD+kklrD1e3BQ7mEFUCSEdzwlviaulkxoq1JjKeX/we/Lid9ve
 thgLqK+DQ3yQv6sdq63aRRPiPRh+ux2fQvmPwRS+Faz0MZaG7bKGu328voC0IKZamAvr
 ujuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=TVKAjWBFusaHyTtxALPIeACysl8qlhJqMmxF1Z/3BQc=;
 b=YRnZEtoiox+TapmQIINPhq8ZWPkOGbKTScpaAIKViEJpRNRIKNJAzrkWcxH3J6+Q4Z
 4Q6eDKM4wCUPJk4h5NLJQgpNQ0FfPzAdYzM0n3Gzo91QWmaT7+wm7HATUX/hIKyE+X2E
 TagjGvks8l5mN8dwQBY4MiLHUJ0pvqFLDKLhc49gxrmWLEtj96wER2Mt/bqQdCcRk6Ll
 GdfJpSC620YSXqRJI4Xcu19hk2D/xEArNtuQzze6jg2xxOntEqgnt/5bHENmHBndQgyo
 jy15tpSnoG7GpdYslRAhM2dhxzmzf8B9RRGsH2g7cpwFmz5YKxDJMnUsohsN0mlHq4Jv
 vd+g==
X-Gm-Message-State: AOAM530jUGmOKhX+TPm7JlcFXDFIxahXI7gmnZ6RXCmCq0XnH1Evk5q/
 dgrwY+LYrpgukmKtR64WHEs=
X-Google-Smtp-Source: ABdhPJxQxWpA8AILfgr1cKP4yfsCw8NTRfhgVfgrxKucOL6WpWcAlGS0EyTXuI5Jrm/OQ3hF+5Bjbw==
X-Received: by 2002:a05:6402:c15:: with SMTP id
 co21mr2140459edb.115.1614248913374; 
 Thu, 25 Feb 2021 02:28:33 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:fc8:43:f4c0:95af?
 ([2a02:908:1252:fb60:fc8:43:f4c0:95af])
 by smtp.gmail.com with ESMTPSA id v11sm2635553eds.14.2021.02.25.02.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 02:28:32 -0800 (PST)
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
 <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
 <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
 <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com>
Date: Thu, 25 Feb 2021 11:28:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Matthew Wilcox <willy@infradead.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDIuMjEgdW0gMTA6MzEgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgRmVi
IDI0LCAyMDIxIGF0IDEwOjE2IEFNIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkKPiA8dGhvbWFz
X29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDIvMjQvMjEgOTo0NSBBTSwgRGFuaWVs
IFZldHRlciB3cm90ZToKPj4+IE9uIFdlZCwgRmViIDI0LCAyMDIxIGF0IDg6NDYgQU0gVGhvbWFz
IEhlbGxzdHLDtm0gKEludGVsKQo+Pj4gPHRob21hc19vc0BzaGlwbWFpbC5vcmc+IHdyb3RlOgo+
Pj4+IE9uIDIvMjMvMjEgMTE6NTkgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pj4+IHRsZHI7
IERNQSBidWZmZXJzIGFyZW4ndCBub3JtYWwgbWVtb3J5LCBleHBlY3RpbmcgdGhhdCB5b3UgY2Fu
IHVzZQo+Pj4+PiB0aGVtIGxpa2UgdGhhdCAobGlrZSBjYWxsaW5nIGdldF91c2VyX3BhZ2VzIHdv
cmtzLCBvciB0aGF0IHRoZXkncmUKPj4+Pj4gYWNjb3VudGluZyBsaWtlIGFueSBvdGhlciBub3Jt
YWwgbWVtb3J5KSBjYW5ub3QgYmUgZ3VhcmFudGVlZC4KPj4+Pj4KPj4+Pj4gU2luY2Ugc29tZSB1
c2Vyc3BhY2Ugb25seSBydW5zIG9uIGludGVncmF0ZWQgZGV2aWNlcywgd2hlcmUgYWxsCj4+Pj4+
IGJ1ZmZlcnMgYXJlIGFjdHVhbGx5IGFsbCByZXNpZGVudCBzeXN0ZW0gbWVtb3J5LCB0aGVyZSdz
IGEgaHVnZQo+Pj4+PiB0ZW1wdGF0aW9uIHRvIGFzc3VtZSB0aGF0IGEgc3RydWN0IHBhZ2UgaXMg
YWx3YXlzIHByZXNlbnQgYW5kIHVzZWFibGUKPj4+Pj4gbGlrZSBmb3IgYW55IG1vcmUgcGFnZWNh
Y2hlIGJhY2tlZCBtbWFwLiBUaGlzIGhhcyB0aGUgcG90ZW50aWFsIHRvCj4+Pj4+IHJlc3VsdCBp
biBhIHVhcGkgbmlnaHRtYXJlLgo+Pj4+Pgo+Pj4+PiBUbyBzdG9wIHRoaXMgZ2FwIHJlcXVpcmUg
dGhhdCBETUEgYnVmZmVyIG1tYXBzIGFyZSBWTV9QRk5NQVAsIHdoaWNoCj4+Pj4+IGJsb2NrcyBn
ZXRfdXNlcl9wYWdlcyBhbmQgYWxsIHRoZSBvdGhlciBzdHJ1Y3QgcGFnZSBiYXNlZAo+Pj4+PiBp
bmZyYXN0cnVjdHVyZSBmb3IgZXZlcnlvbmUuIEluIHNwaXJpdCB0aGlzIGlzIHRoZSB1YXBpIGNv
dW50ZXJwYXJ0IHRvCj4+Pj4+IHRoZSBrZXJuZWwtaW50ZXJuYWwgQ09ORklHX0RNQUJVRl9ERUJV
Ry4KPj4+Pj4KPj4+Pj4gTW90aXZhdGVkIGJ5IGEgcmVjZW50IHBhdGNoIHdoaWNoIHdhbnRlZCB0
byBzd2ljaCB0aGUgc3lzdGVtIGRtYS1idWYKPj4+Pj4gaGVhcCB0byB2bV9pbnNlcnRfcGFnZSBp
bnN0ZWFkIG9mIHZtX2luc2VydF9wZm4uCj4+Pj4+Cj4+Pj4+IHYyOgo+Pj4+Pgo+Pj4+PiBKYXNv
biBicm91Z2h0IHVwIHRoYXQgd2UgYWxzbyB3YW50IHRvIGd1YXJhbnRlZSB0aGF0IGFsbCBwdGVz
IGhhdmUgdGhlCj4+Pj4+IHB0ZV9zcGVjaWFsIGZsYWcgc2V0LCB0byBjYXRjaCBmYXN0IGdldF91
c2VyX3BhZ2VzIChvbiBhcmNoaXRlY3R1cmVzCj4+Pj4+IHRoYXQgc3VwcG9ydCB0aGlzKS4gQWxs
b3dpbmcgVk1fTUlYRURNQVAgKGxpa2UgVk1fU1BFQ0lBTCBkb2VzKSB3b3VsZAo+Pj4+PiBzdGls
bCBhbGxvdyB2bV9pbnNlcnRfcGFnZSwgYnV0IGxpbWl0aW5nIHRvIFZNX1BGTk1BUCB3aWxsIGNh
dGNoIHRoYXQuCj4+Pj4+Cj4+Pj4+ICAgIEZyb20gYXVkaXRpbmcgdGhlIHZhcmlvdXMgZnVuY3Rp
b25zIHRvIGluc2VydCBwZm4gcHRlIGVudGlyZXMKPj4+Pj4gKHZtX2luc2VydF9wZm5fcHJvdCwg
cmVtYXBfcGZuX3JhbmdlIGFuZCBhbGwgaXQncyBjYWxsZXJzIGxpa2UKPj4+Pj4gZG1hX21tYXBf
d2MpIGl0IGxvb2tzIGxpa2UgVk1fUEZOTUFQIGlzIGFscmVhZHkgcmVxdWlyZWQgYW55d2F5LCBz
bwo+Pj4+PiB0aGlzIHNob3VsZCBiZSB0aGUgY29ycmVjdCBmbGFnIHRvIGNoZWNrIGZvci4KPj4+
Pj4KPj4+PiBJZiB3ZSByZXF1aXJlIFZNX1BGTk1BUCwgZm9yIG9yZGluYXJ5IHBhZ2UgbWFwcGlu
Z3MsIHdlIGFsc28gbmVlZCB0bwo+Pj4+IGRpc2FsbG93IENPVyBtYXBwaW5ncywgc2luY2UgaXQg
d2lsbCBub3Qgd29yayBvbiBhcmNoaXRlY3R1cmVzIHRoYXQKPj4+PiBkb24ndCBoYXZlIENPTkZJ
R19BUkNIX0hBU19QVEVfU1BFQ0lBTCwgKHNlZSB0aGUgZG9jcyBmb3Igdm1fbm9ybWFsX3BhZ2Uo
KSkuCj4+PiBIbSBJIGZpZ3VyZWQgZXZlcnlvbmUganVzdCB1c2VzIE1BUF9TSEFSRUQgZm9yIGJ1
ZmZlciBvYmplY3RzIHNpbmNlCj4+PiBDT1cgcmVhbGx5IG1ha2VzIGFic29sdXRlbHkgbm8gc2Vu
c2UuIEhvdyB3b3VsZCB3ZSBlbmZvcmNlIHRoaXM/Cj4+IFBlcmhhcHMgcmV0dXJuaW5nIC1FSU5W
QUwgb24gaXNfY293X21hcHBpbmcoKSBhdCBtbWFwIHRpbWUuIEVpdGhlciB0aGF0Cj4+IG9yIGFs
bG93aW5nIE1JWEVETUFQLgo+Pgo+Pj4+IEFsc28gd29ydGggbm90aW5nIGlzIHRoZSBjb21tZW50
IGluICB0dG1fYm9fbW1hcF92bWFfc2V0dXAoKSB3aXRoCj4+Pj4gcG9zc2libGUgcGVyZm9ybWFu
Y2UgaW1wbGljYXRpb25zIHdpdGggeDg2ICsgUEFUICsgVk1fUEZOTUFQICsgbm9ybWFsCj4+Pj4g
cGFnZXMuIFRoYXQncyBhIHZlcnkgb2xkIGNvbW1lbnQsIHRob3VnaCwgYW5kIG1pZ2h0IG5vdCBi
ZSB2YWxpZCBhbnltb3JlLgo+Pj4gSSB0aGluayB0aGF0J3Mgd2h5IHR0bSBoYXMgYSBwYWdlIGNh
Y2hlIGZvciB0aGVzZSwgYmVjYXVzZSBpdCBpbmRlZWQKPj4+IHN1Y2tzLiBUaGUgUEFUIGNoYW5n
ZXMgb24gcGFnZXMgYXJlIHJhdGhlciBleHBlbnNpdmUuCj4+IElJUkMgdGhlIHBhZ2UgY2FjaGUg
d2FzIGltcGxlbWVudGVkIGJlY2F1c2Ugb2YgdGhlIHNsb3duZXNzIG9mIHRoZQo+PiBjYWNoaW5n
IG1vZGUgdHJhbnNpdGlvbiBpdHNlbGYsIG1vcmUgc3BlY2lmaWNhbGx5IHRoZSB3YmludmQoKSBj
YWxsICsKPj4gZ2xvYmFsIFRMQiBmbHVzaC4KClllcywgZXhhY3RseSB0aGF0LiBUaGUgZ2xvYmFs
IFRMQiBmbHVzaCBpcyB3aGF0IHJlYWxseSBicmVha3Mgb3VyIG5lY2sgCmhlcmUgZnJvbSBhIHBl
cmZvcm1hbmNlIHBlcnNwZWN0aXZlLgoKPj4+IFRoZXJlIGlzIHN0aWxsIGFuIGlzc3VlIGZvciBp
b21lbSBtYXBwaW5ncywgYmVjYXVzZSB0aGUgUEFUIHZhbGlkYXRpb24KPj4+IGRvZXMgYSBsaW5l
YXIgd2FsayBvZiB0aGUgcmVzb3VyY2UgdHJlZSAobG9sKSBmb3IgZXZlcnkgdm1faW5zZXJ0X3Bm
bi4KPj4+IEJ1dCBmb3IgaTkxNSBhdCBsZWFzdCB0aGlzIGlzIGZpeGVkIGJ5IHVzaW5nIHRoZSBp
b19tYXBwaW5nCj4+PiBpbmZyYXN0cnVjdHVyZSwgd2hpY2ggZG9lcyB0aGUgUEFUIHJlc2VydmF0
aW9uIG9ubHkgb25jZSB3aGVuIHlvdSBzZXQKPj4+IHVwIHRoZSBtYXBwaW5nIGFyZWEgYXQgZHJp
dmVyIGxvYWQuCj4+IFllcywgSSBndWVzcyB0aGF0IHdhcyB0aGUgaXNzdWUgdGhhdCB0aGUgY29t
bWVudCBkZXNjcmliZXMsIGJ1dCB0aGUKPj4gaXNzdWUgd2Fzbid0IHRoZXJlIHdpdGggdm1faW5z
ZXJ0X21peGVkKCkgKyBWTV9NSVhFRE1BUC4KPj4KPj4+IEFsc28gVFRNIHVzZXMgVk1fUEZOTUFQ
IHJpZ2h0IG5vdyBmb3IgZXZlcnl0aGluZywgc28gaXQgY2FuJ3QgYmUgYQo+Pj4gcHJvYmxlbSB0
aGF0IGh1cnRzIG11Y2ggOi0pCj4+IEhtbSwgYm90aCA1LjExIGFuZCBkcm0tdGlwIGFwcGVhcnMg
dG8gc3RpbGwgdXNlIE1JWEVETUFQPwo+Pgo+PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9s
aW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMjTDU1NAo+
IFVoIHRoYXQncyBiYWQsIGJlY2F1c2UgbWl4ZWQgbWFwcyBwb2ludGluZyBhdCBzdHJ1Y3QgcGFn
ZSB3b250IHN0b3AKPiBndXAuIEF0IGxlYXN0IGFmYWlrLgoKSHVpPyBJJ20gcHJldHR5IHN1cmUg
TUlYRURNQVAgc3RvcHMgZ3VwIGFzIHdlbGwuIE90aGVyd2lzZSB3ZSB3b3VsZCBoYXZlIAphbHJl
YWR5IHNlZW4gdG9ucyBvZiBwcm9ibGVtcyB3aXRoIHRoZSBwYWdlIGNhY2hlLgoKUmVnYXJkcywK
Q2hyaXN0aWFuLgoKPiBDaHJpc3RpYW4sIGRvIHdlIG5lZWQgdG8gcGF0Y2ggdGhpcyB1cCwgYW5k
IG1heWJlIGZpeCB1cCB0dG0gZmF1bHQKPiBoYW5kbGVyIHRvIHVzZSBpb19tYXBwaW5nIHNvIHRo
ZSB2bV9pbnNlcnRfcGZuIHN0dWZmIGlzIGZhc3Q/Cj4gLURhbmllbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
