Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB0ADC69F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 15:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE336EB56;
	Fri, 18 Oct 2019 13:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78086EB56
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 13:55:03 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IDsrP3114107;
 Fri, 18 Oct 2019 08:54:53 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9IDsrNu065857
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Oct 2019 08:54:53 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 08:54:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 08:54:53 -0500
Received: from [10.250.79.55] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IDsqJP036329;
 Fri, 18 Oct 2019 08:54:52 -0500
Subject: Re: [PATCH v12 4/5] dma-buf: heaps: Add CMA heap to dmabuf heaps
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, Brian Starkey
 <Brian.Starkey@arm.com>
References: <20191018052323.21659-1-john.stultz@linaro.org>
 <20191018052323.21659-5-john.stultz@linaro.org>
 <20191018112124.grjgqrn3ckuc7n4v@DESKTOP-E1NTVVP.localdomain>
 <CA+M3ks6KqqXCfqA6VDKnQOsvFLQfaGrUnA+eesnyzMRniFB00A@mail.gmail.com>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <5a172663-21d5-5f5d-c9d3-f643d8dadc34@ti.com>
Date: Fri, 18 Oct 2019 09:54:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CA+M3ks6KqqXCfqA6VDKnQOsvFLQfaGrUnA+eesnyzMRniFB00A@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1571406893;
 bh=gy7n9P0uBhu8M6TfOX+hY8VcIvOtD4Bt1FjdWFdP+lY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Prb4MoXRDxDZQQhH293iBAsVCyrlojpGcQS93wlZlwYmsrOkHkKfpwjYkH0DTx1iH
 1duOV3f3UkvIDIYVymxZz1aTXRGRLp1ZqDhvBHDwKUhIBpOaVMcprD4BlitFSoKcUW
 5MLN47MVbvK5Rh6hgxxPtl5yGkD0LBPZKwe/bSsE=
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Alistair Strachan <astrachan@google.com>,
 Christoph Hellwig <hch@infradead.org>, nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMTgvMTkgODowMyBBTSwgQmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6Cj4gTGUgdmVuLiAx
OCBvY3QuIDIwMTkgw6AgMTM6MjEsIEJyaWFuIFN0YXJrZXkgPEJyaWFuLlN0YXJrZXlAYXJtLmNv
bT4gYSDDqWNyaXQgOgo+Pgo+PiBPbiBGcmksIE9jdCAxOCwgMjAxOSBhdCAwNToyMzoyMkFNICsw
MDAwLCBKb2huIFN0dWx0eiB3cm90ZToKPj4+IFRoaXMgYWRkcyBhIENNQSBoZWFwLCB3aGljaCBh
bGxvd3MgdXNlcnNwYWNlIHRvIGFsbG9jYXRlCj4+PiBhIGRtYS1idWYgb2YgY29udGlndW91cyBt
ZW1vcnkgb3V0IG9mIGEgQ01BIHJlZ2lvbi4KPj4+Cj4+PiBUaGlzIGNvZGUgaXMgYW4gZXZvbHV0
aW9uIG9mIHRoZSBBbmRyb2lkIElPTiBpbXBsZW1lbnRhdGlvbiwgc28KPj4+IHRoYW5rcyB0byBp
dHMgb3JpZ2luYWwgYXV0aG9yIGFuZCBtYWludGFpbnRlcnM6Cj4+PiAgIEJlbmphbWluIEdhaWdu
YXJkLCBMYXVyYSBBYmJvdHQsIGFuZCBvdGhlcnMhCj4+Pgo+Pj4gTk9URTogVGhpcyBwYXRjaCBv
bmx5IGFkZHMgdGhlIGRlZmF1bHQgQ01BIGhlYXAuIFdlIHdpbGwgZW5hYmxlCj4+PiBzZWxlY3Rp
dmVseSBhZGRpbmcgb3RoZXIgQ01BIG1lbW9yeSByZWdpb25zIHRvIHRoZSBkbWFidWYgaGVhcHMK
Pj4+IGludGVyZmFjZSB3aXRoIGEgbGF0ZXIgcGF0Y2ggKHdoaWNoIHJlcXVpcmVzIGEgZHQgYmlu
ZGluZykKPiAKPiBNYXliZSB3ZSBjYW4gdXNlICJuby1tYXAiIERUIHByb3BlcnR5IHRvIHRyaWdn
ZXIgdGhhdC4gSWYgc2V0IGRvIG5vdCBleHBvc2UgdGhlCj4gY21hIGhlYXAuCgoKIm5vLW1hcCIg
bWVhbnMgaXQgY2FuJ3QgYmUgdXNlZCBhcyBhIHJlZ3VsYXIgQ01BIGVpdGhlciwgd2Ugd2FudCBz
b21lCndheSB0byBib3RoIGhhdmUgaXQgYXMgYSBkZXZpY2UgdXNhYmxlIENNQSBidXQgYWxzbyBu
b3QgYmUgZXhwb3NlZCB0bwp1c2Vyc3BhY2UgaWYgbmVlZGVkLgoKQW5kcmV3Cgo+IAo+IEJlbmph
bWluCj4+Cj4+IFRoYXQnbGwgdGVhY2ggbWUgZm9yIHJlYWRpbmcgbXkgZW1haWwgaW4gRklGTyBv
cmRlci4KPj4KPj4gVGhpcyBhcHByb2FjaCBtYWtlcyBzZW5zZSB0byBtZS4KPj4KPj4gLUJyaWFu
Cj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
