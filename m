Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7D874FFF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 15:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFC76E78D;
	Thu, 25 Jul 2019 13:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCBE6E78D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 13:47:38 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6PDlCSU120551;
 Thu, 25 Jul 2019 08:47:12 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6PDlCMr050293
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Jul 2019 08:47:12 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 08:47:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 25 Jul 2019 08:47:12 -0500
Received: from [10.250.86.29] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6PDlBud103612;
 Thu, 25 Jul 2019 08:47:11 -0500
Subject: Re: [PATCH v6 4/5] dma-buf: heaps: Add CMA heap to dmabuf heaps
To: Christoph Hellwig <hch@infradead.org>, Laura Abbott <labbott@redhat.com>
References: <20190624194908.121273-1-john.stultz@linaro.org>
 <20190624194908.121273-5-john.stultz@linaro.org>
 <20190718100840.GB19666@infradead.org>
 <CALAqxLWLx_tHVjZqrSNWfQ_M2RGGqh4qth3hi9GGRdSPov-gcw@mail.gmail.com>
 <20190724065958.GC16225@infradead.org>
 <25353c4f-5389-0352-b34e-78698b35e588@redhat.com>
 <20190725124820.GC20286@infradead.org>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <18975c1a-7e4e-fab3-eec8-387fbf9dcfe5@ti.com>
Date: Thu, 25 Jul 2019 09:47:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725124820.GC20286@infradead.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564062432;
 bh=w+T9dlJYQaD9FfO7esnlLeCqS7R5uSui0ZKYuPaxp58=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=uGcHOF0YgoXt79Yfr7hLsqm1JY3HTVLxjgkOILT/UaHSLWFV3ZaSmTVWbJziwnDRc
 BMagzBiPV3eu0wESHj12ybXkPTZuyJwm+5ZdPgibV9ewt0aPzmLYDA8uzTe1ZxzFuK
 1IwKDp01j1CbNfwK/+VJr6dVH6ehHecyGvmXWmaM=
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
Cc: Yudongbin <yudongbin@hisilicon.com>,
 Alistair Strachan <astrachan@google.com>, Xu YiPing <xuyiping@hisilicon.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>,
 "Chenfeng \(puck\)" <puck.chen@hisilicon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Xiaqing \(A\)" <saberlily.xia@hisilicon.com>,
 Sudipto Paul <Sudipto.Paul@arm.com>, Pratik Patel <pratikp@codeaurora.org>,
 butao <butao@hisilicon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yNS8xOSA4OjQ4IEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBXZWQsIEp1
bCAyNCwgMjAxOSBhdCAwNzozODowN0FNIC0wNDAwLCBMYXVyYSBBYmJvdHQgd3JvdGU6Cj4+IEl0
J3Mgbm90IGp1c3QgYW4gb3B0aW1pemF0aW9uIGZvciBJb24gdGhvdWdoLiBJb24gd2FzIGRlc2ln
bmVkIHRvCj4+IGxldCB0aGUgY2FsbGVycyBjaG9vc2UgYmV0d2VlbiBzeXN0ZW0gYW5kIG11bHRp
cGxlIENNQSBoZWFwcy4KPiAKPiBXaG8gY2FyZXMgYWJvdXQgaW9uPyAgVGhhdCBzb21lIG91dCBv
ZiB0cmVlIGFuZHJvaWQgY3JhcCB0aGF0IHNob3VsZAo+IG5vdCBiZSByZWxldmFudCBmb3IgdXBz
dHJlYW0gZXhjZXB0IGFzIGFuIGV4YW1wbGUgZm9yIGhvdyBub3QgdG8gZGVzaWduCj4gdGhpbmdz
Li4KPiAKClRlbGwgdXMgaG93IHlvdSByZWFsbHkgZmVlbCBhYm91dCBJT04gOikKCj4+IE9uIG90
aGVyCj4+IHN5c3RlbXMgdGhlcmUgbWF5IGJlIG11bHRpcGxlIENNQSByZWdpb25zIGRlZGljYXRl
ZCB0byBhIHNwZWNpZmljCj4+IHB1cnBvc2Ugb3IgcGxhY2VkIGF0IGEgc3BlY2lmaWMgYWRkcmVz
cy4gVGhlIGNhbGxlcnMgbmVlZCB0bwo+PiBiZSBhYmxlIHRvIGNob29zZSBleGFjdGx5IHdoZXRo
ZXIgdGhleSB3YW50IGEgcGFydGljdWxhciBDTUEgcmVnaW9uCj4+IG9yIGRpc2NvbnRpZ3VvdXMg
cmVnaW9ucy4KPiAKPiBBdCBsZWFzdCBpbiBjbWEgaXMgb25seSB1c2VkIGVpdGhlciB3aXRoIHRo
ZSBnbG9iYWwgcG9vbCBvciBhIHBlci1kZXZpY2UKPiBjbWEgcG9vbC4gIEkgdGhpbmsgaWYgeW91
IHdhbnQgdG8gbWFrZSB0aGlzIG5ldyBkbWEtYnVmIEFQSSBmaXQgaW4gd2l0aAo+IHRoZSByZXN0
IHdpdGggdGhlIGtlcm5lbCB5b3UgZm9sbG93IHRoYXQgbW9kZWwsIGFuZCBwYXNzIGluIGEgc3Ry
dWN0Cj4gZGV2aWNlIHRvIHNlbGVjdCB0aGUgcGFydGljdWxhciBjbWEgYXJlYSwgc2ltaWxhciBo
b3cgdGhlIERNQSBhbGxvY2F0b3IKPiB3b3Jrcy4KPiAKClRoaXMgaXMgYSBjZW50cmFsIGFsbG9j
YXRvciwgaXQgaXMgbm90IHRpZWQgdG8gYW55IG9uZSBkZXZpY2UuIElmIHdlCmtuZXcgdGhlIG9u
ZSBkZXZpY2UgYWhlYWQgb2YgdGltZSB3ZSB3b3VsZCBqdXN0IHVzZSB0aGUgZXhpc3RpbmcgZG1h
X2FsbG9jLgoKV2UgbWlnaHQgYmUgYWJsZSB0byBzb2x2ZSBzb21lIG9mIHRoYXQgd2l0aCBsYXRl
IG1hcHBpbmcgYWZ0ZXIgYWxsIHRoZQpkZXZpY2VzIGF0dGFjaCB0byB0aGUgYnVmZmVyLCBidXQg
ZXZlbiB0aGVuLCB3aGljaCBkZXZpY2UncyBDTUEgYXJlYQp3b3VsZCB3ZSBjaG9zZSB0byB1c2Ug
ZnJvbSBhbGwgdGhlIGF0dGFjaGVkIGRldmljZXM/CgpJIGNhbiBhZ3JlZSB0aGF0IGFsbG9jYXRp
bmcgZnJvbSBwZXItZGV2aWNlIENNQSB1c2luZyBIZWFwcyBkb2Vzbid0IG1ha2UKbXVjaCBzZW5z
ZSwgYnV0IGZvciBnbG9iYWwgcG9vbHMgSSdtIG5vdCBzdXJlIEkgc2VlIGFueSB3YXkgdG8gYWxs
b3cKZGV2aWNlcyB0byBzZWxlY3Qgd2hpY2ggcG9vbCBpcyByaWdodCBmb3IgYSBzcGVjaWZpYyB1
c2UuIFRoZXkgZG9uJ3QKaGF2ZSB0aGUgZnVsbCB1c2UtY2FzZSBpbmZvcm1hdGlvbiBsaWtlIHRo
ZSBhcHBsaWNhdGlvbiBkb2VzLCB0aGUKc2VsZWN0aW9uIG5lZWRzIHRvIGJlIG1hZGUgZnJvbSB0
aGUgYXBwbGljYXRpb24uCgpBbmRyZXcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
