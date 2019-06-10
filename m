Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD133C087
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 02:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B1C89149;
	Tue, 11 Jun 2019 00:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DD48919A;
 Mon, 10 Jun 2019 00:16:09 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cfda1490000>; Sun, 09 Jun 2019 17:16:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 09 Jun 2019 17:16:08 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 09 Jun 2019 17:16:08 -0700
Received: from [10.110.48.28] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Jun
 2019 00:16:07 +0000
Subject: Re: [RFC] mm/hmm: pass mmu_notifier_range to
 sync_cpu_device_pagetables
To: Jason Gunthorpe <jgg@mellanox.com>, Christoph Hellwig <hch@infradead.org>
References: <20190608001452.7922-1-rcampbell@nvidia.com>
 <20190608091008.GC32185@infradead.org> <20190608114133.GA14873@mellanox.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <2be4987a-eede-c864-c69c-382698641d25@nvidia.com>
Date: Sun, 9 Jun 2019 17:16:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190608114133.GA14873@mellanox.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Tue, 11 Jun 2019 00:29:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1560125769; bh=xcBhzlVW6R3gFNBTrQqz4x9pqkklyqjUIKM1o42kpyM=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=E6X87sdu/LBn60CmN02yYjx0e4LyL+XQ/EpyrSmFXI2fQ5Zb+Gh+JZPwwwFyhR9/T
 DR8oJjqqMJ9r+VrKVwUG2o3JczcXZgsbMi07n3RJ7p29qYbn9AWfErKW4mHKk2FRpv
 7+ufnoxySLzKTlkINeZdmFMs9VXRW0J/FG4cJKrSvuAOgP6EdI3FxQrq6Z4C9QnMCw
 zKTDzopKQehlzGuMNc9bmY5FRAUDEloQCDHXi95cyZWmUE2V0UpuPOonrNC/A7AMs4
 gdRNwHonTHKYQRUAtWc6IMPZ4/G46btrcTuhnh6Q5ec1u46swkktkF4Xs0TKPrStrX
 C0pK3ycdPHRrA==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi84LzE5IDQ6NDEgQU0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBTYXQsIEp1biAw
OCwgMjAxOSBhdCAwMjoxMDowOEFNIC0wNzAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPj4g
T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDU6MTQ6NTJQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4+PiBITU0gZGVmaW5lcyBpdHMgb3duIHN0cnVjdCBobW1fdXBkYXRlIHdoaWNoIGlz
IHBhc3NlZCB0byB0aGUKPj4+IHN5bmNfY3B1X2RldmljZV9wYWdldGFibGVzKCkgY2FsbGJhY2sg
ZnVuY3Rpb24uIFRoaXMgaXMKPj4+IHN1ZmZpY2llbnQgd2hlbiB0aGUgb25seSBhY3Rpb24gaXMg
dG8gaW52YWxpZGF0ZS4gSG93ZXZlciwKPj4+IGEgZGV2aWNlIG1heSB3YW50IHRvIGtub3cgdGhl
IHJlYXNvbiBmb3IgdGhlIGludmFsaWRhdGlvbiBhbmQKPj4+IGJlIGFibGUgdG8gc2VlIHRoZSBu
ZXcgcGVybWlzc2lvbnMgb24gYSByYW5nZSwgdXBkYXRlIGRldmljZSBhY2Nlc3MKPj4+IHJpZ2h0
cyBvciByYW5nZSBzdGF0aXN0aWNzLiBTaW5jZSBzeW5jX2NwdV9kZXZpY2VfcGFnZXRhYmxlcygp
Cj4+PiBjYW4gYmUgY2FsbGVkIGZyb20gdHJ5X3RvX3VubWFwKCksIHRoZSBtbWFwX3NlbSBtYXkg
bm90IGJlIGhlbGQKPj4+IGFuZCBmaW5kX3ZtYSgpIGlzIG5vdCBzYWZlIHRvIGJlIGNhbGxlZC4K
Pj4+IFBhc3MgdGhlIHN0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UgdG8gc3luY19jcHVfZGV2aWNl
X3BhZ2V0YWJsZXMoKQo+Pj4gdG8gYWxsb3cgdGhlIGZ1bGwgaW52YWxpZGF0aW9uIGluZm9ybWF0
aW9uIHRvIGJlIHVzZWQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUmFscGggQ2FtcGJlbGwgPHJj
YW1wYmVsbEBudmlkaWEuY29tPgo+Pj4KPj4+IEknbSBzZW5kaW5nIHRoaXMgb3V0IG5vdyBzaW5j
ZSB3ZSBhcmUgdXBkYXRpbmcgbWFueSBvZiB0aGUgSE1NIEFQSXMKPj4+IGFuZCBJIHRoaW5rIGl0
IHdpbGwgYmUgdXNlZnVsLgo+Pgo+PiBUaGlzIGlzIHRoZSByaWdodCB0aGluZyB0byBkby4gIEJ1
dCB0aGUgcmVhbGx5IHJpZ2h0IHRoaW5nIGlzIHRvIGp1c3QKPj4ga2lsbCB0aGUgaG1tX21pcnJv
ciBBUEkgZW50aXJlbHkgYW5kIG1vdmUgdG8gbW11X25vdGlmaWVycy4gIEF0IGxlYXN0Cj4+IGZv
ciBub3ZlYXUgdGhpcyBhbHJlYWR5IGlzIHdheSBzaW1wbGVyLCBhbHRob3VnaCByaWdodCBub3cg
aXQgZGVmZWF0cwo+PiBKYXNvbnMgcGF0Y2ggdG8gYXZvaWQgYWxsb2NhdGluZyB0aGUgc3RydWN0
IGhtbSBpbiB0aGUgZmF1bHQgcGF0aC4KPj4gQnV0IGFzIHNhaWQgYmVmb3JlIHRoYXQgY2FuIGJl
IGF2b2lkZWQgYnkganVzdCBraWxsaW5nIHN0cnVjdCBobW0sCj4+IHdoaWNoIGZvciBtYW55IHJl
YXNvbnMgaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGFueXdheS4KPj4KPj4gSSd2ZSBnb3QgYSBz
ZXJpZXMgaGVyZSwgd2hpY2ggaXMgYSBiaXQgYnJva2VuIChlcGVjaWFsbHkgdGhlIGxhc3QKPj4g
cGF0Y2ggY2FuJ3Qgd29yayBhcy1pcyksIGJ1dCBzaG91bGQgZXhwbGFpbiB3aGVyZSBJJ20gdHJ5
aW5nIHRvIGhlYWQ6Cj4+Cj4+IGh0dHA6Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vycy9oY2gvbWlz
Yy5naXQvc2hvcnRsb2cvcmVmcy9oZWFkcy9obW0tbWlycm9yLXNpbXBsaWZpY2F0aW9uCj4gCj4g
QXQgbGVhc3QgdGhlIGN1cnJlbnQgaG1tIGFwcHJvYWNoIGRvZXMgcmVseSBvbiB0aGUgY29sbGlz
aW9uIHJldHJ5Cj4gbG9ja2luZyBzY2hlbWUgaW4gc3RydWN0IGhtbS9zdHJ1Y3QgaG1tX3Jhbmdl
IGZvciB0aGUgcGFnZWZhdWx0IHNpZGUKPiB0byB3b3JrIHJpZ2h0Lgo+IAo+IFNvLCBiZWZvcmUg
d2UgY2FuIGFwcGx5IHBhdGNoIG9uZSBpbiB0aGlzIHNlcmllcyB3ZSBuZWVkIHRvIGZpeAo+IGht
bV92bWFfZmF1bHQoKSBhbmQgYWxsIGl0cyB2YXJpZW50cy4gT3RoZXJ3aXNlIHRoZSBkcml2ZXIg
d2lsbCBiZQo+IGJyb2tlbi4KPiAKPiBJJ20gaG9waW5nIHRvIGZpcnN0IGRlZmluZSB3aGF0IHRo
aXMgbG9ja2luZyBzaG91bGQgYmUgKHNlZSBvdGhlcgo+IGVtYWlscyB0byBSYWxwaCkgdGhlbiwg
aWRlYWxseSwgc2VlIGlmIHdlIGNhbiBleHRlbmQgbW11IG5vdGlmaWVycyB0bwo+IGdldCBpdCBk
aXJlY3RseSB3aXRob3V0aCBobW0gc3R1ZmYuCj4gCj4gVGhlbiB3ZSBhcHBseSB5b3VyIHBhdGNo
IG9uZSBhbmQgdGhlIGhtbSBvcHMgd3JhcHBlciBkaWVzLgo+IAoKVGhpcyBhbGwgbWFrZXMgc2Vu
c2UsIGFuZCB0aGFua3MgZm9yIGFsbCB0aGlzIHdvcmsgdG8gc2ltcGxpZnkgYW5kIGNsYXJpZnkK
SE1NLiBJdCdzIGdvaW5nIHRvIG1ha2UgaXQgYSBsb3QgZWFzaWVyIHRvIHdvcmsgd2l0aCwgd2hl
biB0aGUgZHVzdCBzZXR0bGVzLgoKdGhhbmtzLAotLSAKSm9obiBIdWJiYXJkCk5WSURJQQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
