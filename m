Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 236D374F86
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 15:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E6C6E751;
	Thu, 25 Jul 2019 13:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B576E751
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 13:32:17 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6PDVqIt074564;
 Thu, 25 Jul 2019 08:31:52 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6PDVql1073481
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Jul 2019 08:31:52 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 08:31:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 25 Jul 2019 08:31:51 -0500
Received: from [10.250.86.29] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6PDVo6N082317;
 Thu, 25 Jul 2019 08:31:50 -0500
Subject: Re: [PATCH v6 4/5] dma-buf: heaps: Add CMA heap to dmabuf heaps
To: Christoph Hellwig <hch@infradead.org>
References: <20190624194908.121273-1-john.stultz@linaro.org>
 <20190624194908.121273-5-john.stultz@linaro.org>
 <20190718100840.GB19666@infradead.org>
 <CALAqxLWLx_tHVjZqrSNWfQ_M2RGGqh4qth3hi9GGRdSPov-gcw@mail.gmail.com>
 <20190724065958.GC16225@infradead.org>
 <8e6f8e4f-20fc-1f1f-2228-f4fd7c7c5c1f@ti.com>
 <20190725125014.GD20286@infradead.org>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <0eae0024-1fdf-bd06-a8ff-1a41f0af3c69@ti.com>
Date: Thu, 25 Jul 2019 09:31:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725125014.GD20286@infradead.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564061512;
 bh=B/ntLJ2e1bIKShYP2qLtMwAe3jOvq47HHoEw6r4s2ZA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Ip6hXMPL4GiG/YNz0lIukcvAkp/BqHTNVXLtqtwTWZvDh3xsO4c9kteivrfZmAiEB
 QUzcDPwqZj9HSlvBM+ZyC7PovEIcxAsqzqfVowgMbmbsJACjBO4EdlBZa5c257g+EK
 vbtBslAD/tq6XsA/Cjk9N9zv7D04+VmLjp19dKT0=
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

T24gNy8yNS8xOSA4OjUwIEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBXZWQsIEp1
bCAyNCwgMjAxOSBhdCAxMTo0NjowMUFNIC0wNDAwLCBBbmRyZXcgRi4gRGF2aXMgd3JvdGU6Cj4+
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA4NjM5NTcvCj4+Cj4+IEl0J3Mg
YWN0dWFsbHkgYSBtb3JlIHNpbXBsZSBoZWFwIHR5cGUgSU1ITywgYnV0IHRoZSBsb2dpYyBpbnNp
ZGUgaXMKPj4gaW5jb21wYXRpYmxlIHdpdGggdGhlIHN5c3RlbS9DTUEgaGVhcHMsIGlmIHlvdSBt
b3ZlIGFueSBvZiB0aGVpciBjb2RlCj4+IGludG8gdGhlIGNvcmUgZnJhbWV3b3JrIHRoZW4gdGhp
cyBoZWFwIHN0b3BzIHdvcmtpbmcuIExlYWRpbmcgdG8gb3V0IG9mCj4+IHRyZWUgaGFja3Mgb24g
dGhlIGNvcmUgdG8gZ2V0IGl0IGJhY2sgZnVuY3Rpb25hbC4gSSBzZWUgdGhlIHNhbWUgZm9yIHRo
ZQo+PiAiY29tcGxleCIgaGVhcHMgd2l0aCBJT04uCj4gCj4gV2VsbCwgdGhpcyBtb3N0bHkgaXMg
anVzdCBhbm90aGVyIGFsbG9jYXRvciAoZ2VuX3Bvb2wpLiAgQW5kIGdpdmVuIHRoYXQKPiB0aGUg
d2hvbGUgZG1hLWJ1ZiBpbmZyYXN0dWN0dXJlIGFzc3VtZXMgdGhpbmdzIGFyZSBiYWNrZWQgYnkg
cGFnZXMgd2UKPiByZWFsbHkgc2hvdWxkbid0IG5lZWQgbXVjaCBtb3JlIHRoYW4gYW4gYWxsb2Mg
YW5kIGEgZnJlZSBjYWxsYmFjayAoYW5kCj4gbWF5YmUgdGhlIHBncHJvdCB0byBtYXAgaXQpIGFu
ZCBoYW5kbGUgdGhlIHJlc3QgaW4gY29tbW9uIGNvZGUuCj4gCgpCdXQgdGhhdCdzIGp1c3QgaXQs
IGRtYS1idWYgZG9lcyBub3QgYXNzdW1lIGJ1ZmZlcnMgYXJlIGJhY2tlZCBieSBub3JtYWwKa2Vy
bmVsIG1hbmFnZWQgbWVtb3J5LCBpdCBpcyB1cCB0byB0aGUgYnVmZmVyIGV4cG9ydGVyIHdoZXJl
IGFuZCB3aGVuIHRvCmFsbG9jYXRlIHRoZSBtZW1vcnkuIFRoZSBtZW1vcnkgYmFja2VkIGJ5IHRo
aXMgU1JBTSBidWZmZXIgZG9lcyBub3QgaGF2ZQp0aGUgbm9ybWFsIHN0cnVjdCBwYWdlIGJhY2tp
bmcuIFNvIG1vdmluZyB0aGUgbWFwLCBzeW5jLCBldGMgZnVuY3Rpb25zCnRvIGNvbW1vbiBjb2Rl
IHdvdWxkIGZhaWwgZm9yIHRoaXMgYW5kIG1hbnkgb3RoZXIgaGVhcCB0eXBlcy4gVGhpcyB3YXMg
YQptYWpvciBwcm9ibGVtIHdpdGggSW9uIHRoYXQgcHJvbXB0ZWQgdGhpcyBuZXcgZGVzaWduLgoK
RWFjaCBoZWFwIHR5cGUgbWF5IG5lZWQgdG8gZG8gc29tZXRoaW5nIGRpZmZlcmVudCBkZXBlbmRp
bmcgb24gaXRzCmJhY2tpbmcgbWVtb3J5LCBtb3ZpbmcgZXZlcnl0aGluZyB0byBjb21tb24gY29k
ZSB0aGF0IGlzIGNvbW1vbiB0bwpTeXN0ZW0gYW5kIENNQSBoZWFwcyBpcyB3b3VsZCBsZWFkIHRo
b3NlIGJlaW5nIHRoZSBvbmx5IHVwc3RyZWFtYWJsZSBoZWFwcy4KCkFuZHJldwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
