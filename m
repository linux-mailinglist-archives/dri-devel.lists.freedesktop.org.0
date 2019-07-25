Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6370F750A2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 16:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0BB6E69E;
	Thu, 25 Jul 2019 14:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B209E6E69E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 14:10:42 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6PEAAd8113214;
 Thu, 25 Jul 2019 09:10:10 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6PEAAwj121944
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Jul 2019 09:10:10 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 09:10:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 25 Jul 2019 09:10:10 -0500
Received: from [10.250.86.29] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6PEA8Zk034771;
 Thu, 25 Jul 2019 09:10:09 -0500
Subject: Re: [PATCH v6 4/5] dma-buf: heaps: Add CMA heap to dmabuf heaps
To: Christoph Hellwig <hch@infradead.org>
References: <20190624194908.121273-1-john.stultz@linaro.org>
 <20190624194908.121273-5-john.stultz@linaro.org>
 <20190718100840.GB19666@infradead.org>
 <CALAqxLWLx_tHVjZqrSNWfQ_M2RGGqh4qth3hi9GGRdSPov-gcw@mail.gmail.com>
 <20190724065958.GC16225@infradead.org>
 <8e6f8e4f-20fc-1f1f-2228-f4fd7c7c5c1f@ti.com>
 <20190725125014.GD20286@infradead.org>
 <0eae0024-1fdf-bd06-a8ff-1a41f0af3c69@ti.com>
 <20190725140448.GA25010@infradead.org>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <8e2ec315-5d18-68b2-8cb5-2bfb8a116d1b@ti.com>
Date: Thu, 25 Jul 2019 10:10:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725140448.GA25010@infradead.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564063810;
 bh=mVv1nDWtq6/1PWlhIk1q4KK71i681umUf+79EFLyBFw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=yvFj1CULd+JqphxDYLptg+cY4QAlhkwlcybiAuiIpLD3ZiwvXbgwH46H2bL7zBrKv
 36SFJLJLWpE//7+VGXqtssZKckCQ4+lQU6N7LvYNyYetXHpO3jmmesX0DyVKF0IYUn
 gYJErN5sBT/UMqrhxSj+M41yjqEkHuQxv/rAQyh8=
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

T24gNy8yNS8xOSAxMDowNCBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gVGh1LCBK
dWwgMjUsIDIwMTkgYXQgMDk6MzE6NTBBTSAtMDQwMCwgQW5kcmV3IEYuIERhdmlzIHdyb3RlOgo+
PiBCdXQgdGhhdCdzIGp1c3QgaXQsIGRtYS1idWYgZG9lcyBub3QgYXNzdW1lIGJ1ZmZlcnMgYXJl
IGJhY2tlZCBieSBub3JtYWwKPj4ga2VybmVsIG1hbmFnZWQgbWVtb3J5LCBpdCBpcyB1cCB0byB0
aGUgYnVmZmVyIGV4cG9ydGVyIHdoZXJlIGFuZCB3aGVuIHRvCj4+IGFsbG9jYXRlIHRoZSBtZW1v
cnkuIFRoZSBtZW1vcnkgYmFja2VkIGJ5IHRoaXMgU1JBTSBidWZmZXIgZG9lcyBub3QgaGF2ZQo+
PiB0aGUgbm9ybWFsIHN0cnVjdCBwYWdlIGJhY2tpbmcuIFNvIG1vdmluZyB0aGUgbWFwLCBzeW5j
LCBldGMgZnVuY3Rpb25zCj4+IHRvIGNvbW1vbiBjb2RlIHdvdWxkIGZhaWwgZm9yIHRoaXMgYW5k
IG1hbnkgb3RoZXIgaGVhcCB0eXBlcy4gVGhpcyB3YXMgYQo+PiBtYWpvciBwcm9ibGVtIHdpdGgg
SW9uIHRoYXQgcHJvbXB0ZWQgdGhpcyBuZXcgZGVzaWduLgo+IAo+IFRoZSBjb2RlIGNsZWFybHkg
c2hvd3MgaXQgaGFzIHBhZ2UgYmFja2luZywgZS5nLiB0aGlzOgo+IAo+ICsJc2dfc2V0X3BhZ2Uo
dGFibGUtPnNnbCwgcGZuX3RvX3BhZ2UoUEZOX0RPV04oYnVmZmVyLT5wYWRkcikpLCBidWZmZXIt
PmxlbiwgMCk7Cj4gCj4gYW5kIHRoZSBmYWN0IHRoYXQgaXQgKGFuZCB0aGUgZG1hLWJ1ZiBBUEkp
IHVzZXMgc2NhdHRlcmxpc3RzLCB3aGljaCAKPiByZXF1aXJlcyBwYWdlcy4KPiAKClBhZ2VzIHll
cywgYnV0IG5vdCAibm9ybWFsIiBwYWdlcyBmcm9tIHRoZSBrZXJuZWwgbWFuYWdlZCBhcmVhLgpw
YWdlX3RvX3BmbigpIHdpbGwgcmV0dXJuIGJhZCB2YWx1ZXMgb24gdGhlIHBhZ2VzIHJldHVybmVk
IGJ5IHRoaXMKYWxsb2NhdG9yIGFuZCBzbyB3aWxsIGFueSBvZiB0aGUga2VybmVsIHN5bmMvbWFw
IGZ1bmN0aW9ucy4gVGhlcmVmb3IKdGhvc2Ugb3BlcmF0aW9ucyBjYW5ub3QgYmUgY29tbW9uIGFu
ZCBuZWVkIHNwZWNpYWwgcGVyLWhlYXAgaGFuZGxpbmcuCgpBbmRyZXcKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
