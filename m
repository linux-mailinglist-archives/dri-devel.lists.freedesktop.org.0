Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E3D751CC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 16:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389086E768;
	Thu, 25 Jul 2019 14:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203F26E768
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 14:52:23 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6PEpwLH089026;
 Thu, 25 Jul 2019 09:51:58 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6PEpwex070194
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Jul 2019 09:51:58 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 09:51:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 25 Jul 2019 09:51:58 -0500
Received: from [10.250.86.29] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6PEpucs096397;
 Thu, 25 Jul 2019 09:51:57 -0500
Subject: Re: [PATCH v6 4/5] dma-buf: heaps: Add CMA heap to dmabuf heaps
To: Christoph Hellwig <hch@infradead.org>
References: <20190718100840.GB19666@infradead.org>
 <CALAqxLWLx_tHVjZqrSNWfQ_M2RGGqh4qth3hi9GGRdSPov-gcw@mail.gmail.com>
 <20190724065958.GC16225@infradead.org>
 <8e6f8e4f-20fc-1f1f-2228-f4fd7c7c5c1f@ti.com>
 <20190725125014.GD20286@infradead.org>
 <0eae0024-1fdf-bd06-a8ff-1a41f0af3c69@ti.com>
 <20190725140448.GA25010@infradead.org>
 <8e2ec315-5d18-68b2-8cb5-2bfb8a116d1b@ti.com>
 <20190725141144.GA14609@infradead.org>
 <b2170efd-df80-b54b-9ffe-8183befe5e00@ti.com>
 <20190725143040.GA21894@infradead.org>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <ba731cf6-97cb-0499-e092-26031e202e55@ti.com>
Date: Thu, 25 Jul 2019 10:51:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725143040.GA21894@infradead.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564066318;
 bh=6eVBtz7pC5rPsO60ddc64kp9iSy+XJZAc+HuTFyJ08s=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Z5lSewpCrBq60eVRn9ewoGY9sYcen7BfsGC5Ryho9b2zDeuf6W4TBq4LtUXOClE7A
 2oZ8CbyMXq+O9xHqPrGY9XK0VwlRgc3O8IvVZyPvOEUpCVodA9wMfpkYqkM/dhpr+2
 kRdTvW4xMnTvzmLV1QF/PUFQ+0el5ryqp5Nfs74Q=
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
 "Xiaqing \(A\)" <saberlily.xia@hisilicon.com>,
 Pratik Patel <pratikp@codeaurora.org>, butao <butao@hisilicon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yNS8xOSAxMDozMCBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gVGh1LCBK
dWwgMjUsIDIwMTkgYXQgMTA6MjU6NTBBTSAtMDQwMCwgQW5kcmV3IEYuIERhdmlzIHdyb3RlOgo+
PiBPbiA3LzI1LzE5IDEwOjExIEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPj4+IE9uIFRo
dSwgSnVsIDI1LCAyMDE5IGF0IDEwOjEwOjA4QU0gLTA0MDAsIEFuZHJldyBGLiBEYXZpcyB3cm90
ZToKPj4+PiBQYWdlcyB5ZXMsIGJ1dCBub3QgIm5vcm1hbCIgcGFnZXMgZnJvbSB0aGUga2VybmVs
IG1hbmFnZWQgYXJlYS4KPj4+PiBwYWdlX3RvX3BmbigpIHdpbGwgcmV0dXJuIGJhZCB2YWx1ZXMg
b24gdGhlIHBhZ2VzIHJldHVybmVkIGJ5IHRoaXMKPj4+PiBhbGxvY2F0b3IgYW5kIHNvIHdpbGwg
YW55IG9mIHRoZSBrZXJuZWwgc3luYy9tYXAgZnVuY3Rpb25zLiBUaGVyZWZvcgo+Pj4+IHRob3Nl
IG9wZXJhdGlvbnMgY2Fubm90IGJlIGNvbW1vbiBhbmQgbmVlZCBzcGVjaWFsIHBlci1oZWFwIGhh
bmRsaW5nLgo+Pj4KPj4+IFdlbGwsIHRoYXQgbWVhbnMgdGhpcyB0aGluZyBpcyBidWdneSBhbmQg
YWJ1c2VzIHRoZSBzY2F0dGVybGlzdCBBUEkKPj4+IGFuZCB3ZSBjYW4ndCBtZXJnZSBpdCBhbnl3
YXksIHNvIGl0IGlzIGlycmVsZXZhbnQuCj4+Pgo+Pgo+PiBTaW5jZSB3aGVuIGRvIHNjYXR0ZXJs
aXN0cyBuZWVkIHRvIG9ubHkgaGF2ZSBrZXJuZWwgdmlydHVhbCBiYWNrZWQKPj4gbWVtb3J5IHBh
Z2VzPyBEZXZpY2UgbWVtb3J5IGlzIHN0b3JlZCBpbiBzY2F0dGVybGlzdHMgYW5kCj4+IGRtYV9z
eW5jX3NnX2Zvcl8qIHdvdWxkIGZhaWwganVzdCB0aGUgc2FtZSB3aGVuIHRoZSBjYWNoZSBvcHMg
d2VyZQo+PiBhdHRlbXB0ZWQuCj4gCj4gSSdtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4gd2l0aCB2
aXJ0dWFsIGJhY2tlZCBtZW1vcnkgcGFnZXMsIGFzIHdlCj4gZG9uJ3QgcmVhbGx5IGhhdmUgdGhh
dCBjb25jZXB0Lgo+IAo+IEJ1dCBhIHBhZ2UgaW4gdGhlIHNjYXR0ZXJsaXN0IG5lZWRzIHRvIGJl
IGFibGUgdG8gYmUgdXNlZCBldmVyeXdoZXJlCj4gd2UnZCBub3JtYWxseSB1c2UgYSBwYWdlLCBl
LmcuIHBhZ2VfdG9fcGh5cywgcGFnZV90b19wZm4sIGttYXAsCj4gcGFnZV9hZGRyZXNzIChpZiAh
aGlnaG1lbSkgYXMgY29uc3VtZXJzIGluY2x1ZGluZyB0aGUgZG1hIG1hcHBpbmcKPiBpbnRlcmZh
Y2UgZG8gYWxsIHRoYXQuCj4gCj4gSWYgeW91IHdhbnQgdG8gZG1hIG1hcCBtZW1vcnkgdGhhdCBk
b2VzIG5vdCBoYXZlIHBhZ2UgYmFja2luZyB5b3UKPiBuZWVkIHRvIHVzZSBkbWFfbWFwX3Jlc291
cmNlLgo+IAoKSSBwcm9iYWJseSBzaG91bGQgaGF2ZSB3b3JkZWQgdGhhdCBiZXR0ZXIuCgpJdCBk
b2VzIGhhdmUgcGFnZSBiYWNraW5nLCB3aGF0IEkgbWVhbnQgYnkgInBhZ2VfdG9fcGZuKCkgd2ls
bCByZXR1cm4KYmFkIHZhbHVlcyIgaXMgbm90IHRoYXQgaXQgd29uJ3QgZ2l2ZSB5b3UgdGhlIGNv
cnJlY3QgcGZuLCBpdCB3aWxsLCBidXQKdGhhdCB0aGVuIHRoYXQgcGZuIGlzIG5vdCBwYXJ0IG9m
IHRoZSBub3JtYWwgbWVtb3J5IHNwYWNlCihsb3dtZW0vaGlnaG1lbSkgaXQncyBkZXZpY2UgbWVt
b3J5LCBzbyBjYWNoZSBvcHMgd29uJ3Qgd29yay4gQnV0IHlvdQpzaG91bGQgbm90IGJlIGRvaW5n
IHRoYXQgb24gZGV2aWNlIG1lbW9yeSBhbnl3YXkuCgpUaGF0IGlzIGEgcHJvYmxlbSB3aXRoIElv
biBJIHdhbnQgdG8gYXZvaWQsIGl0IGFzc3VtZWQgYWxsIGJ1ZmZlcnMgd2VyZQppbiBERFIgYW5k
IHNvIHdvdWxkIGRvIGNhY2hlIG9wZXJhdGlvbnMgb24gdGhlbSB1bmNvbmRpdGlvbmFsbHksIHRv
bwptYW55IGFzc3VtcHRpb25zIHdlcmUgbWFkZSBhcyB0b28gbXVjaCB3YXMgbW92ZWQgaW50byB0
aGUgY29tbW9uIGNvcmUKY29kZSBhbmQgbm90IGVub3VnaCB3YXMgbGVmdCBmb3IgdGhlIGhlYXBz
IHRoZW1zZWx2ZXMgdG8gZGVjaWRlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
