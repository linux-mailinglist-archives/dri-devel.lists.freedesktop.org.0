Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 361867510C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 16:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C394C6E660;
	Thu, 25 Jul 2019 14:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294136E660
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 14:26:22 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6PEPqXp117924;
 Thu, 25 Jul 2019 09:25:52 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6PEPqDK099670
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Jul 2019 09:25:52 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 09:25:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 25 Jul 2019 09:25:52 -0500
Received: from [10.250.86.29] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6PEPobU051141;
 Thu, 25 Jul 2019 09:25:51 -0500
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
 <8e2ec315-5d18-68b2-8cb5-2bfb8a116d1b@ti.com>
 <20190725141144.GA14609@infradead.org>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <b2170efd-df80-b54b-9ffe-8183befe5e00@ti.com>
Date: Thu, 25 Jul 2019 10:25:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725141144.GA14609@infradead.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564064752;
 bh=zz+4xc5f556ik5dVIHkOBcpiQhkWRlNhJiib+8wLNDI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=i+C6MOf2C+7Ox6ak0GFOM3KZf2HLv2JdwWowGGpw+dStFh3oI9YR29IsZmMcKGJ16
 55xzh94E3MaN9HD/A3tuOnkgZzSxuozxGm0NTYUMknyRake0JaerdMNii1T6ymAUe5
 +TfCzJqEuH4pYmTq43p5uTgnQ3GWvObrtEWtR+eg=
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

T24gNy8yNS8xOSAxMDoxMSBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gVGh1LCBK
dWwgMjUsIDIwMTkgYXQgMTA6MTA6MDhBTSAtMDQwMCwgQW5kcmV3IEYuIERhdmlzIHdyb3RlOgo+
PiBQYWdlcyB5ZXMsIGJ1dCBub3QgIm5vcm1hbCIgcGFnZXMgZnJvbSB0aGUga2VybmVsIG1hbmFn
ZWQgYXJlYS4KPj4gcGFnZV90b19wZm4oKSB3aWxsIHJldHVybiBiYWQgdmFsdWVzIG9uIHRoZSBw
YWdlcyByZXR1cm5lZCBieSB0aGlzCj4+IGFsbG9jYXRvciBhbmQgc28gd2lsbCBhbnkgb2YgdGhl
IGtlcm5lbCBzeW5jL21hcCBmdW5jdGlvbnMuIFRoZXJlZm9yCj4+IHRob3NlIG9wZXJhdGlvbnMg
Y2Fubm90IGJlIGNvbW1vbiBhbmQgbmVlZCBzcGVjaWFsIHBlci1oZWFwIGhhbmRsaW5nLgo+IAo+
IFdlbGwsIHRoYXQgbWVhbnMgdGhpcyB0aGluZyBpcyBidWdneSBhbmQgYWJ1c2VzIHRoZSBzY2F0
dGVybGlzdCBBUEkKPiBhbmQgd2UgY2FuJ3QgbWVyZ2UgaXQgYW55d2F5LCBzbyBpdCBpcyBpcnJl
bGV2YW50Lgo+IAoKU2luY2Ugd2hlbiBkbyBzY2F0dGVybGlzdHMgbmVlZCB0byBvbmx5IGhhdmUg
a2VybmVsIHZpcnR1YWwgYmFja2VkCm1lbW9yeSBwYWdlcz8gRGV2aWNlIG1lbW9yeSBpcyBzdG9y
ZWQgaW4gc2NhdHRlcmxpc3RzIGFuZApkbWFfc3luY19zZ19mb3JfKiB3b3VsZCBmYWlsIGp1c3Qg
dGhlIHNhbWUgd2hlbiB0aGUgY2FjaGUgb3BzIHdlcmUKYXR0ZW1wdGVkLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
