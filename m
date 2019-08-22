Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D9198EF4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 11:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287D6898F0;
	Thu, 22 Aug 2019 09:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A4A89206
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 09:14:31 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id y8so4654645wrn.10
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 02:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=XtOL8gNtG+hmvgLUTNARZ9IJPPatmS0hR06XQs4cIx8=;
 b=uE5/HY+Is6iqH1qkawLp+GHotr3UCdmLpJuw59J5kCgGz/8cPh2TGvAr9Viix6U7qa
 zyIaN5VBppYBYTkq/5+KWf7zIuJm6+WZXlFxeBRLVu4DPMYMbLXSU9my31q/rG6aE+os
 Gvvh5Ei/Jcdf5VSY4aycgZY8dRRXCdECauzvCcgda3//ytj/YusIg/xB3A23dGLo3aYQ
 spZdwlDG08RNqFOl2gRyRlrApyvHWIUMvAqfYzzHsDRL5cRmrKe44E2WOmrrMDqlCDQS
 SHTH870DbEAtGmYAWARaeO35giI/8ENWeVNrF6IFzLVbnUbZ4gK8OmAXde7DwkaNeTiw
 ai5w==
X-Gm-Message-State: APjAAAXTsvK52K8+UJCHwRw4YyhRXHhDBoZguwzGJgt8STq78kQlEZL8
 mapRsQUvBlysTx617mwQG8c=
X-Google-Smtp-Source: APXvYqy+KJzFiStV4RUvRR1wqwN49akFiyyYPp9S1YCSkTvE81mGV9LfPJTLQHYZqIkHYJsJIezaGA==
X-Received: by 2002:adf:ecc3:: with SMTP id s3mr46614516wro.302.1566465269850; 
 Thu, 22 Aug 2019 02:14:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c187sm7114923wmd.39.2019.08.22.02.14.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 02:14:29 -0700 (PDT)
Subject: Re: [RFC] replacing dma_resv API
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Chris Wilson <chris@chris-wilson.co.uk>
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <156641829139.20466.3485292236947741339@skylake-alporthouse-com>
 <CAKMK7uFAreLt64Y9btk4VNxo6a2YMgXrg136z0uuyy5B3SMS+A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <03244148-a560-47e2-e992-a3ea873e7bd1@gmail.com>
Date: Thu, 22 Aug 2019 11:14:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFAreLt64Y9btk4VNxo6a2YMgXrg136z0uuyy5B3SMS+A@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XtOL8gNtG+hmvgLUTNARZ9IJPPatmS0hR06XQs4cIx8=;
 b=md3I0Cf2sYPPrCeWRJx/YU455jLgbpfe32HlAwsUrXyp79by/dCLP1FlpJInnIHmG4
 tEobR0ezLBX49CbNR+BED3nKNO9xzL8t4cWeGfvcoXtchBfccKlmy9jktgTOHpi/f/mP
 lpFo6YdLl8V/LY2IEPRYNxyJQstTCzhJFWA2srYzWPyZR569A8m8eprSuS6QimaJdC0r
 XDx6o5bvSILXY/khZVMmMg8/9CAfRC/H/OfwF+1h0YCblXmuKN4KHNd20qpsVN/iM8A3
 a+VLslsforNI7/+PEo1n07c5wTqOk0xBP/QP89ddu8FIDYQdNN40ZdQDQ8qkN7RckoFb
 qUsg==
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
Reply-To: christian.koenig@amd.com
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDguMTkgdW0gMjI6MjIgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgQXVn
IDIxLCAyMDE5IGF0IDEwOjExIFBNIENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNv
LnVrPiB3cm90ZToKPj4gUXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE5LTA4LTIxIDEzOjMx
OjM3KQo+Pj4gSGkgZXZlcnlvbmUsCj4+Pgo+Pj4gSW4gcHJldmlvdXMgZGlzY3Vzc2lvbiBpdCBz
dXJmYWNlZCB0aGF0IGRpZmZlcmVudCBkcml2ZXJzIHVzZSB0aGUgc2hhcmVkIGFuZCBleHBsaWNp
dCBmZW5jZXMgaW4gdGhlIGRtYV9yZXN2IG9iamVjdCB3aXRoIGRpZmZlcmVudCBtZWFuaW5ncy4K
Pj4+Cj4+PiBUaGlzIGlzIHByb2JsZW1hdGljIHdoZW4gd2Ugc2hhcmUgYnVmZmVycyBiZXR3ZWVu
IHRob3NlIGRyaXZlcnMgYW5kIHJlcXVpcmVtZW50cyBmb3IgaW1wbGljaXQgYW5kIGV4cGxpY2l0
IHN5bmNocm9uaXphdGlvbiBsZWFkZWQgdG8gcXVpdGUgYSBudW1iZXIgb2Ygd29ya2Fyb3VuZHMg
cmVsYXRlZCB0byB0aGlzLgo+Pj4KPj4+IFNvIEkgc3RhcnRlZCBhbiBlZmZvcnQgdG8gZ2V0IGFs
bCBkcml2ZXJzIGJhY2sgdG8gYSBjb21tb24gdW5kZXJzdGFuZGluZyBvZiB3aGF0IHRoZSBmZW5j
ZXMgaW4gdGhlIGRtYV9yZXN2IG9iamVjdCBtZWFuIGFuZCBiZSBhYmxlIHRvIHVzZSB0aGUgb2Jq
ZWN0IGZvciBkaWZmZXJlbnQga2luZCBvZiB3b3JrbG9hZHMgaW5kZXBlbmRlbnQgb2YgdGhlIGNs
YXNzaWMgRFJNIGNvbW1hbmQgc3VibWlzc2lvbiBpbnRlcmZhY2UuCj4+Pgo+Pj4gVGhlIHJlc3Vs
dCBpcyB0aGlzIHBhdGNoIHNldCB3aGljaCBtb2RpZmllcyB0aGUgZG1hX3Jlc3YgQVBJIHRvIGdl
dCBhd2F5IGZyb20gYSBzaW5nbGUgZXhwbGljaXQgZmVuY2UgYW5kIG11bHRpcGxlIHNoYXJlZCBm
ZW5jZXMsIHRvd2FyZHMgYSBub3RhdGlvbiB3aGVyZSB3ZSBoYXZlIGV4cGxpY2l0IGNhdGVnb3Jp
ZXMgZm9yIHdyaXRlcnMsIHJlYWRlcnMgYW5kIG90aGVycy4KPj4gRndpdywgSSB3b3VsZCBsaWtl
IHRoZSBkaXN0aW5jdGlvbiBoZXJlIGJldHdlZW4gb3B0aW9uYWwgZmVuY2VzCj4+ICh3cml0ZXJz
LCByZWFkZXJzKSBhbmQgbWFuZGF0b3J5IGZlbmNlcyAob3RoZXJzKS4gVGhlIG9wdGlvbmFsIGZl
bmNlcwo+PiBhcmUgd2hlcmUgd2UgcHV0IHRoZSBpbXBsaWNpdCBmZW5jZSB0cmFja2luZyB0aGF0
IGNsZXZlciB1c2Vyc3BhY2Ugd291bGQKPj4gcmF0aGVyIGF2b2lkLiBUaGUgbWFuZGF0b3J5IGZl
bmNlcyAoSSB3b3VsZCBjYWxsIGludGVybmFsKSBpcyB3aGVyZSB3ZQo+PiBwdXQgdGhlIGZlbmNl
cyBmb3IgdHJhY2tpbmcgbWlncmF0aW9uIHRoYXQgdXNlcnNwYWNlIGNhbiBub3Qgb3B0IG91dCBv
Zi4KPiBJIHRoaW5rIHRoaXMgd291bGQgbWFrZSBzZW5zZSwgYW5kIGlzIGtpbmRhIHdoYXQgSSBl
eHBlY3RlZCBoZXJlLgoKWWVhaCwgZXhhY3RseSB0aGF0J3MgdGhlIGludGVudGlvbiBoZXJlLgoK
QmFzaWMgaWRlYSBpcyB0byBncm91cCB0aGUgZmVuY2VzIGludG8gdGhlIGNhdGVnb3JpZXMgb2Yg
InlvdSBhbHdheXMgCm5lZWQgdG8gd2FpdCBmb3Igd2hlbiBkb2luZyBpbXBsaWNpdCBzeW5jaHJv
bml6YXRpb24iICh3cml0ZXJzKSwgInlvdSAKb25seSBuZWVkIHRvIHdhaXQgZm9yIHRoZW0gd2hl
biB5b3Ugd2FudCB0byB3cml0ZSB0byB0aGUgb2JqZWN0IiAKKHJlYWRlcnMpIGFuZCAiaWdub3Jl
IHRoZW0gZm9yIGltcGxpY2l0IHN5bmNocm9uaXphdGlvbiIuCgo+IElmIChhbmQgSSB0aGluayB0
aGF0J3MgYSBodWdlIGlmKSB3ZSBjYW4gYWdyZWUgb24gd2hhdCB0aG9zZSBpbnRlcm5hbAo+IGZl
bmNlcyBhcmUuIFRoZXJlJ3MgYSBodWdlIGRpZmZlcmVuY2UgYmV0d2VlbiBpbnRlcm5hbCBmZW5j
ZXMgZm9yCj4gYnVmZmVyIG1vdmVzIChiZXR0ZXIgbm90IGlnbm9yZSB0aG9zZSkgYW5kIGludGVy
bmFsIGZlbmNlcyBsaWtlCj4gYW1ka2ZkJ3MgZXZpY3Rpb24gZmVuY2UgKGJldHRlciBpZ25vcmUg
dGhvc2UpLgoKWWVhaCwgdGhhdCdzIGV4YWN0bHkgd2h5IEkgd2FudCB0byBnZXQgYXdheSBmcm9t
IHRob3NlIGV4Y2x1c2l2ZS9zaGFyZWQgCm5hbWluZy4KCkZvciByZWFkZXJzL3dyaXRlcnMgSSBo
b3BlZCB0aGUgc2VtYW50aWMgd291bGQgYmUgbW9yZSBjbGVhciwgYnV0IHRoYXQncyAKZG9lc24n
dCBzZWVtcyB0byBiZSB0aGUgY2FzZS4KCj4gU28gd2hhdGV2ZXIgd2UgZG8gYWRkLCBpdCBiZXR0
ZXIgY29tZSB3aXRoIHJlYWxseSBjbGVhciBkb2NzIGFuZCBwcmV0dHkgZGlhZ3JhbXMgYWJvdXQg
d2hhdAo+IGl0J3Mgc3VwcG9zZWQgdG8gZG8sIGFuZCBob3cgaXQncyBzdXBwb3NlZCB0byBiZSB1
c2VkLiBPciB3ZSdyZSBqdXN0Cj4gYmFjayB0byB0aGUgY3VycmVudCBtZXNzIHdlJ3JlIGluLCB0
aW1lcyB0d28uCgpXZWxsIGRvY3VtZW50aW5nIGl0IGluIHRoZSBlbmQgaXMgY2xlYXJseSBhIGdv
b2QgaWRlYSwgYnV0IEkgZG9uJ3QgdGhpbmsgCndlIHNob3VsZCBzdGFydCB3aXRoIHRoYXQgYmVm
b3JlIHdlIGFjdHVhbGx5IGtub3cgd2hhdCB3ZSB3YW50IHRvIAppbXBsZW1lbnQgYW5kIGhvdyB3
ZSB3YW50IHRvIGltcGxlbWVudCBpdC4KCk90aGVyd2lzZSBJIHdvdWxkIHdyaXRlIHRvbnMgb2Yg
ZG9jdW1lbnRhdGlvbiB3aGljaCBjYW4gYmUgdGhyb3duIGF3YXkgCmFnYWluIGluIHRoZSBlbmQg
YmVjYXVzZSB3ZSBkZWNpZGVkIHRvIGRvbid0IGRvIGl0IHRoaXMgd2F5LgoKQ2hyaXN0aWFuLgoK
PiAtRGFuaWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
