Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1A873301
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 17:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BFF6E5D9;
	Wed, 24 Jul 2019 15:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F5A6E5D9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 15:46:35 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6OFk3g0070578;
 Wed, 24 Jul 2019 10:46:03 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6OFk3jV046078
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 24 Jul 2019 10:46:03 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 24
 Jul 2019 10:46:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 24 Jul 2019 10:46:03 -0500
Received: from [10.250.86.29] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6OFk2qF032690;
 Wed, 24 Jul 2019 10:46:02 -0500
Subject: Re: [PATCH v6 4/5] dma-buf: heaps: Add CMA heap to dmabuf heaps
To: Christoph Hellwig <hch@infradead.org>, John Stultz <john.stultz@linaro.org>
References: <20190624194908.121273-1-john.stultz@linaro.org>
 <20190624194908.121273-5-john.stultz@linaro.org>
 <20190718100840.GB19666@infradead.org>
 <CALAqxLWLx_tHVjZqrSNWfQ_M2RGGqh4qth3hi9GGRdSPov-gcw@mail.gmail.com>
 <20190724065958.GC16225@infradead.org>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <8e6f8e4f-20fc-1f1f-2228-f4fd7c7c5c1f@ti.com>
Date: Wed, 24 Jul 2019 11:46:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724065958.GC16225@infradead.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1563983163;
 bh=lOtsy9iEeGzWh5ylO4v/a04ehlOrwbMbdn7UL2Ddbrg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=VzLnvQJdtFsU8gh8xZW4og7tS+2gLDEUOpGiPoFQzpyWkyjuKjgzj0Vh2fnuO2eeU
 91AiiB3Nwjs5rCppmcOgWSZJSm/aGHM+7v5odY7mugVWv05rjXMDQSF+9yVBR4FZOS
 QNVaFQCsOSQwQaOSYDxuLwyfM8iTvRK1+DHxihl8=
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
 Xu YiPing <xuyiping@hisilicon.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>,
 "Chenfeng \(puck\)" <puck.chen@hisilicon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Alistair Strachan <astrachan@google.com>,
 "Xiaqing \(A\)" <saberlily.xia@hisilicon.com>,
 Pratik Patel <pratikp@codeaurora.org>, butao <butao@hisilicon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yNC8xOSAyOjU5IEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBNb24sIEp1
bCAyMiwgMjAxOSBhdCAxMDowNDowNlBNIC0wNzAwLCBKb2huIFN0dWx0eiB3cm90ZToKPj4gQXBv
bG9naWVzLCBJJ20gbm90IHN1cmUgSSdtIHVuZGVyc3RhbmRpbmcgeW91ciBzdWdnZXN0aW9uIGhl
cmUuCj4+IGRtYV9hbGxvY19jb250aWd1b3VzKCkgZG9lcyBoYXZlIHNvbWUgaW50ZXJlc3Rpbmcg
b3B0aW1pemF0aW9ucwo+PiAoYXZvaWRpbmcgYWxsb2NhdGluZyBzaW5nbGUgcGFnZSBmcm9tIGNt
YSksIHRob3VnaCBpdHMgZm9jdXMgb24KPj4gZGVmYXVsdCBhcmVhIHZzIHNwZWNpZmljIGRldmlj
ZSBhcmVhIGRvZXNuJ3QgcXVpdGUgbWF0Y2ggdXAgdGhlIHVzYWdlCj4+IG1vZGVsIGZvciBkbWEg
aGVhcHMuICBJbnN0ZWFkIG9mIGFsbG9jYXRpbmcgbWVtb3J5IGZvciBhIHNpbmdsZQo+PiBkZXZp
Y2UsIHdlIHdhbnQgdG8gYmUgYWJsZSB0byBhbGxvdyB1c2VybGFuZCwgZm9yIGEgZ2l2ZW4gdXNh
Z2UgbW9kZSwKPj4gdG8gYmUgYWJsZSB0byBhbGxvY2F0ZSBhIGRtYWJ1ZiBmcm9tIGEgc3BlY2lm
aWMgaGVhcCBvZiBtZW1vcnkgd2hpY2gKPj4gd2lsbCBzYXRpc2Z5IHRoZSB1c2FnZSBtb2RlIGZv
ciB0aGF0IGJ1ZmZlciBwaXBlbGluZSAoYWNyb3NzIG11bHRpcGxlCj4+IGRldmljZXMpLgo+Pgo+
PiBOb3csIGluZGVlZCwgdGhlIHN5c3RlbSBhbmQgY21hIGhlYXBzIGluIHRoaXMgcGF0Y2hzZXQg
YXJlIGEgYml0Cj4+IHNpbXBsZS90cml2aWFsICh0aG91Z2ggdXNlZnVsIHdpdGggbXkgZGV2aWNl
cyB0aGF0IHJlcXVpcmUgY29udGlndW91cwo+PiBidWZmZXJzIGZvciB0aGUgZGlzcGxheSBkcml2
ZXIpLCBidXQgbW9yZSBjb21wbGV4IElPTiBoZWFwcyBoYXZlCj4+IHRyYWRpdGlvbmFsbHkgc3Rh
eWVkIG91dCBvZiB0cmVlIGluIHZlbmRvciBjb2RlLCBpbiBtYW55IGNhc2VzIG1ha2luZwo+PiBp
bmNvbXBhdGlibGUgdHdlYWtzIHRvIHRoZSBJT04gY29yZSBkbWFidWYgZXhwb3J0ZXIgbG9naWMu
Cj4gCj4gU28gd2hhdCB3b3VsZCB0aGUgbW9yZSBjb21wbGljYXRlZCBoZWFwcyBiZT8KPiAKCgpo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwODYzOTU3LwoKSXQncyBhY3R1YWxs
eSBhIG1vcmUgc2ltcGxlIGhlYXAgdHlwZSBJTUhPLCBidXQgdGhlIGxvZ2ljIGluc2lkZSBpcwpp
bmNvbXBhdGlibGUgd2l0aCB0aGUgc3lzdGVtL0NNQSBoZWFwcywgaWYgeW91IG1vdmUgYW55IG9m
IHRoZWlyIGNvZGUKaW50byB0aGUgY29yZSBmcmFtZXdvcmsgdGhlbiB0aGlzIGhlYXAgc3RvcHMg
d29ya2luZy4gTGVhZGluZyB0byBvdXQgb2YKdHJlZSBoYWNrcyBvbiB0aGUgY29yZSB0byBnZXQg
aXQgYmFjayBmdW5jdGlvbmFsLiBJIHNlZSB0aGUgc2FtZSBmb3IgdGhlCiJjb21wbGV4IiBoZWFw
cyB3aXRoIElPTi4KCkFuZHJldwoKCj4+IFRoYXQncyB3aHkKPj4gZG1hYnVmIGhlYXBzIGlzIHRy
eWluZyB0byBkZXN0YWdlIElPTiBpbiBhIHdheSB0aGF0IGFsbG93cyBoZWFwcyB0bwo+PiBpbXBs
ZW1lbnQgdGhlaXIgZXhwb3J0ZXIgbG9naWMgdGhlbXNlbHZlcywgc28gd2UgY2FuIHN0YXJ0IHB1
bGxpbmcKPj4gdGhvc2UgbW9yZSBjb21wbGljYXRlZCBoZWFwcyBvdXQgb2YgdGhlaXIgdmVuZG9y
IGhpZGV5LWhvbGVzIGFuZCBnZXQKPj4gc29tZSBwcm9wZXIgdXBzdHJlYW0gcmV2aWV3Lgo+Pgo+
PiBCdXQgSSBzdXNwZWN0IEkganVzdCBhbSBjb25mdXNlZCBhcyB0byB3aGF0IHlvdXIgc3VnZ2Vz
dGluZy4gTWF5YmUKPj4gY291bGQgeW91IGV4cGFuZCBhIGJpdD8gQXBvbG9naWVzIGZvciBiZWlu
ZyBhIGJpdCBkZW5zZS4KPiAKPiBNeSBzdWdnZXN0aW9uIGlzIHRvIG1lcmdlIHRoZSBzeXN0ZW0g
YW5kIENNQSBoZWFwcy4gIENNQSAoYXQgbGVhc3QKPiB0aGUgc3lzdGVtLXdpZGUgQ01BIGFyZWEp
IGlzIHJlYWxseSBqdXN0IGFuIG9wdGltaXphdGlvbiB0byBnZXQKPiBsYXJnZSBjb250aWdvdXMg
cmVnaW9ucyBtb3JlIGVhc2lseS4gIFdlIHNob3VsZCBtYWtlIHVzZSBvZiBpdCBhcwo+IHRyYW5z
cGFyZW50IGFzIHBvc3NpYmxlLCBqdXN0IGxpa2Ugd2UgZG8gaW4gdGhlIERNQSBjb2RlLgo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
