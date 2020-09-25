Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3840C27A82A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1CA6E3E3;
	Mon, 28 Sep 2020 07:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD156ECB0;
 Fri, 25 Sep 2020 12:13:49 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f6dde9b0000>; Fri, 25 Sep 2020 05:12:11 -0700
Received: from [172.27.0.140] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Sep
 2020 12:13:30 +0000
Subject: Re: [Intel-gfx] [PATCH rdma-next v3 1/2] lib/scatterlist: Add support
 in dynamic allocation of SG table from pages
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Leon Romanovsky
 <leon@kernel.org>
References: <20200922083958.2150803-1-leon@kernel.org>
 <20200922083958.2150803-2-leon@kernel.org>
 <118a03ef-d160-e202-81cc-16c9c39359fc@linux.intel.com>
 <20200925071330.GA2280698@unreal>
 <adff5752-582c-2065-89e2-924ef732911a@linux.intel.com>
From: Maor Gottlieb <maorg@nvidia.com>
Message-ID: <a8cca9f0-58ec-654d-939e-8568d17d4c60@nvidia.com>
Date: Fri, 25 Sep 2020 15:13:27 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <adff5752-582c-2065-89e2-924ef732911a@linux.intel.com>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601035931; bh=OOxZYaeyrnTeUKolTNHANplbexAqSviLCY+bHC09/Hg=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=HYmkm8xCiVsEWw4dyNi+Djz5rk4y7teGKYpjvtAVH5SihKKT0eSxXfGiZvQTX7iWg
 PFvEwPjW3jL84//v1jjMU/5QXGHzXMlfUxFOMxDqiqj94VsaICGmdRPFU7DPO4TC7/
 ZpdnfqdNWnZFfhZuNM7NRq/BTnoKS1U8DVwRpUNEO5+FmGLfl9nK53ra2MXnsu5N3K
 YVPYZmtU/YqjUpm1Fr5Eafxu7TaMR+d+aym6WkJWJJDnhtc9efmBxR0gDQNKBzwU6n
 Xb+2y4LNG3tJx/NqWDyygyZD7GluQjDlpYoQWZS22uuls+E52NaLCCDjA9zY0UzJPd
 ZID+Pru1blUYA==
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: linux-rdma@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org,
 Maor Gottlieb <maorg@mellanox.com>, David Airlie <airlied@linux.ie>,
 Doug Ledford <dledford@redhat.com>, VMware
 Graphics <linux-graphics-maintainer@vmware.com>, Jason
 Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDkvMjUvMjAyMCAyOjQxIFBNLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToKPgo+IE9uIDI1LzA5
LzIwMjAgMDg6MTMsIExlb24gUm9tYW5vdnNreSB3cm90ZToKPj4gT24gVGh1LCBTZXAgMjQsIDIw
MjAgYXQgMDk6MjE6MjBBTSArMDEwMCwgVHZydGtvIFVyc3VsaW4gd3JvdGU6Cj4+Pgo+Pj4gT24g
MjIvMDkvMjAyMCAwOTozOSwgTGVvbiBSb21hbm92c2t5IHdyb3RlOgo+Pj4+IEZyb206IE1hb3Ig
R290dGxpZWIgPG1hb3JnQG1lbGxhbm94LmNvbT4KPj4+Pgo+Pj4+IEV4dGVuZCBfX3NnX2FsbG9j
X3RhYmxlX2Zyb21fcGFnZXMgdG8gc3VwcG9ydCBkeW5hbWljIGFsbG9jYXRpb24gb2YKPj4+PiBT
RyB0YWJsZSBmcm9tIHBhZ2VzLiBJdCBzaG91bGQgYmUgdXNlZCBieSBkcml2ZXJzIHRoYXQgY2Fu
J3Qgc3VwcGx5Cj4+Pj4gYWxsIHRoZSBwYWdlcyBhdCBvbmUgdGltZS4KPj4+Pgo+Pj4+IFRoaXMg
ZnVuY3Rpb24gcmV0dXJucyB0aGUgbGFzdCBwb3B1bGF0ZWQgU0dFIGluIHRoZSB0YWJsZS4gVXNl
cnMgCj4+Pj4gc2hvdWxkCj4+Pj4gcGFzcyBpdCBhcyBhbiBhcmd1bWVudCB0byB0aGUgZnVuY3Rp
b24gZnJvbSB0aGUgc2Vjb25kIGNhbGwgYW5kIAo+Pj4+IGZvcndhcmQuCj4+Pj4gQXMgYmVmb3Jl
LCBuZW50cyB3aWxsIGJlIGVxdWFsIHRvIHRoZSBudW1iZXIgb2YgcG9wdWxhdGVkIFNHRXMgCj4+
Pj4gKGNodW5rcykuCj4+Pgo+Pj4gU28gaXQncyBhcHBlbmRpbmcgYW5kIGdyb3dpbmcgdGhlICJs
aXN0IiwgZGlkIEkgZ2V0IHRoYXQgcmlnaHQ/IAo+Pj4gU291bmRzIGhhbmR5Cj4+PiBpbmRlZWQu
IFNvbWUgY29tbWVudHMvcXVlc3Rpb25zIGJlbG93Lgo+Pgo+PiBZZXMsIHdlIChSRE1BKSB1c2Ug
dGhpcyBmdW5jdGlvbiB0byBjaGFpbiBjb250aWd1b3VzIHBhZ2VzLgo+Cj4gSSB3aWxsIGV2ZWx1
YXRlIGlmIGk5MTUgY291bGQgc3RhcnQgdXNpbmcgaXQuIFdlIGhhdmUgc29tZSBsb29wcyB3aGlj
aCAKPiBidWlsZCBwYWdlIGJ5IHBhZ2UgYW5kIGNvYWxlc2NlLgo+Cj4gW3NuaXBdCj4KPj4+PiDC
oMKgwqDCoMKgwqAgaWYgKHVubGlrZWx5KHJldCkpCj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rl
c3Rpbmcvc2NhdHRlcmxpc3QvbWFpbi5jIAo+Pj4+IGIvdG9vbHMvdGVzdGluZy9zY2F0dGVybGlz
dC9tYWluLmMKPj4+PiBpbmRleCAwYTE0NjQxODEyMjYuLjQ4OTkzNTlhMzFhYyAxMDA2NDQKPj4+
PiAtLS0gYS90b29scy90ZXN0aW5nL3NjYXR0ZXJsaXN0L21haW4uYwo+Pj4+ICsrKyBiL3Rvb2xz
L3Rlc3Rpbmcvc2NhdHRlcmxpc3QvbWFpbi5jCj4+Pj4gQEAgLTU1LDE0ICs1NSwxMyBAQCBpbnQg
bWFpbih2b2lkKQo+Pj4+IMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAwLCB0ZXN0ID0gdGVzdHM7IHRl
c3QtPmV4cGVjdGVkX3NlZ21lbnRzOyB0ZXN0KyssIAo+Pj4+IGkrKykgewo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHN0cnVjdCBwYWdlICpwYWdlc1tNQVhfUEFHRVNdOwo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHN0cnVjdCBzZ190YWJsZSBzdDsKPj4+PiAtwqDCoMKgwqDCoMKgwqAgaW50
IHJldDsKPj4+PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IHNjYXR0ZXJsaXN0ICpzZzsKPj4+Pgo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9wYWdlcyhwYWdlcywgdGVzdC0+cGZuLCB0ZXN0
LT5udW1fcGFnZXMpOwo+Pj4+Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9IF9fc2dfYWxsb2Nf
dGFibGVfZnJvbV9wYWdlcygmc3QsIHBhZ2VzLCAKPj4+PiB0ZXN0LT5udW1fcGFnZXMsCj4+Pj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAsIHRl
c3QtPnNpemUsIHRlc3QtPm1heF9zZWcsCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9LRVJORUwpOwo+Pj4+IC3CoMKgwqDCoMKgwqDC
oCBhc3NlcnQocmV0ID09IHRlc3QtPmFsbG9jX3JldCk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNn
ID0gX19zZ19hbGxvY190YWJsZV9mcm9tX3BhZ2VzKCZzdCwgcGFnZXMsIAo+Pj4+IHRlc3QtPm51
bV9wYWdlcywgMCwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRlc3QtPnNp
emUsIHRlc3QtPm1heF9zZWcsIE5VTEwsIDAsIEdGUF9LRVJORUwpOwo+Pj4+ICvCoMKgwqDCoMKg
wqDCoCBhc3NlcnQoUFRSX0VSUl9PUl9aRVJPKHNnKSA9PSB0ZXN0LT5hbGxvY19yZXQpOwo+Pj4K
Pj4+IFNvbWUgdGVzdCBjb3ZlcmFnZSBmb3IgcmVsYXRpdmVseSBjb21wbGV4IGNvZGUgd291bGQg
YmUgdmVyeSAKPj4+IHdlbGNvbWVkLiBTaW5jZQo+Pj4gdGhlIHRlc3RpbmcgZnJhbWV3b3JrIGlz
IGFscmVhZHkgdGhlcmUsIGV2ZW4gaWYgaXQgYml0LXJvdHRlZCBhIGJpdCwgCj4+PiBidXQKPj4+
IHNob3VsZG4ndCBiZSBoYXJkIHRvIGZpeC4KPj4+Cj4+PiBBIGZldyB0ZXN0cyB0byBjaGVjayBh
cHBlbmQvZ3JvdyB3b3JrcyBhcyBleHBlY3RlZCwgaW4gdGVybXMgb2YgaG93IAo+Pj4gdGhlIGVu
ZAo+Pj4gdGFibGUgbG9va3MgbGlrZSBnaXZlbiB0aGUgaW5pdGlhbCBzdGF0ZSBhbmQgc29tZSBk
aWZmZXJlbnQgcGFnZSAKPj4+IHBhdHRlcm5zCj4+PiBhZGRlZCB0byBpdC4gQW5kIGJvdGggY3Jv
c3NpbmcgYW5kIG5vdCBjcm9zc2luZyBpbnRvIHNnIGNoYWluaW5nIAo+Pj4gc2NlbmFyaW9zLgo+
Pgo+PiBUaGlzIGZ1bmN0aW9uIGlzIGJhc2ljIGZvciBhbGwgUkRNQSBkZXZpY2VzIGFuZCB3ZSBh
cmUgcHJldHR5IGNvbmZpZGVudAo+PiB0aGF0IHRoZSBvbGQgYW5kIG5ldyBmbG93cyBhcmUgdGVz
dGVkIHRob3JvdWdobHkuCj4+Cj4+IFdlIHdpbGwgYWRkIHByb3BlciB0ZXN0IGluIG5leHQga2Vy
bmVsIGN5Y2xlLgo+Cj4gUGF0Y2ggc2VlbXMgdG8gYmUgYWRkaW5nIGEgcmVxdWlyZW1lbnQgdGhh
dCBhbGwgY2FsbGVycyBvZiAKPiAoX18pc2dfYWxsb2NfdGFibGVfZnJvbV9wYWdlcyBwYXNzIGlu
IHplcm9lZCBzdHJ1Y3Qgc2dfdGFibGUsIHdoaWNoIAo+IHdhc24ndCB0aGUgY2FzZSBzbyBmYXIu
Cj4KPiBIYXZlIHlvdSBhdWRpdGVkIGFsbCB0aGUgY2FsbGVycyBhbmQvb3IgZml4ZWQgdGhlbT8g
VGhlcmUgc2VlbXMgdG8gYmUgCj4gcXVpdGUgYSBmZXcuIEd1dCBmZWVsIHNheXMgcHJvYmxlbSB3
b3VsZCBwcm9iYWJseSBiZSBiZXR0ZXIgc29sdmVkIGluIAo+IGxpYi9zY2F0dGVybGlzdC5jIGFu
ZCBub3QgYnkgbWFraW5nIGFsbCB0aGUgY2FsbGVycyBtZW1zZXQuIFNob3VsZCBiZSAKPiBwb3Nz
aWJsZSBpZiB5b3UgbWFrZSBzdXJlIHlvdSBvbmx5IHJlYWQgc3QtPm5lbnRzIGlmIHByZXYgd2Fz
IHBhc3NlZCBpbj8KPgo+IEkndmUgZml4ZWQgdGhlIHVuaXQgdGVzdCBhbmQgd2l0aCB0aGlzIGNo
YW5nZSB0aGUgZXhpc3RpbmcgdGVzdHMgZG8gCj4gcGFzcy4gQnV0IHdpdGhvdXQgemVyb2luZyBp
dCBkb2VzIGZhaWwgb24gdGhlIHZlcnkgZmlyc3QsIHNpbmdsZSBwYWdlLCAKPiB0ZXN0IHNjZW5h
cmlvLgo+Cj4gWW91IGNhbiBwdWxsIHRoZSB1bml0IHRlc3QgaGFja3MgZnJvbSAKPiBnaXQ6Ly9w
ZW9wbGUuZnJlZWRlc2t0b3Aub3JnL350dXJzdWxpbi9kcm0taW50ZWwgc2d0ZXN0Lgo+Cj4gUmVn
YXJkcywKPgo+IFR2cnRrbwoKVGhhbmtzIGZvciBmaW5kaW5nIHRoaXMgaXNzdWUuwqAgSW4gdGhl
IHJlZ3VsYXIgZmxvdywgCl9fc2dfYWxsb2NfdGFibGVfZnJvbV9wYWdlcyBtZW1zZXQgdGhlIHNn
X3RhYmxlIHN0cnVjdCwgYnV0IGN1cnJlbnRseSAKdGhlIGNvZGUgYWNjZXNzIHRoaXMgc3RydWN0
IGJlZm9yZS4gV2lsbCBiZSBmaXhlZCBpbnRlcm5hbGx5IGluIHNjYXR0ZXJsaXN0LgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
