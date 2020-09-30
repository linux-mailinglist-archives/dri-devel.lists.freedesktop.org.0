Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D426627FB39
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1ADB6E85D;
	Thu,  1 Oct 2020 08:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19056E212;
 Wed, 30 Sep 2020 15:05:25 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f749e4f0002>; Wed, 30 Sep 2020 08:03:43 -0700
Received: from [172.27.13.156] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Sep
 2020 15:05:17 +0000
Subject: Re: [PATCH rdma-next v4 4/4] RDMA/umem: Move to allocate SG table
 from pages
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20200927064647.3106737-1-leon@kernel.org>
 <20200927064647.3106737-5-leon@kernel.org>
 <20200929195929.GA803555@nvidia.com> <20200930095321.GL3094@unreal>
 <20200930114527.GE816047@nvidia.com>
 <80c49ff1-52c7-638f-553f-9de8130b188d@nvidia.com>
 <20200930115837.GF816047@nvidia.com>
From: Maor Gottlieb <maorg@nvidia.com>
Message-ID: <7e09167f-c57a-cdfe-a842-c920e9421e53@nvidia.com>
Date: Wed, 30 Sep 2020 18:05:15 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20200930115837.GF816047@nvidia.com>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601478223; bh=1C8k0Jr4P7T3F40hyRgF1mLm/eFVC81ePiQovbxLYos=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=FnhAMOP0S4xv7P035nhKcJ09owUIHEJm0fdJzUAsp5xXZeAz9aHTRsdc0guKBSzNY
 UJSI63M1yJ1IqsIvCZzYRtzx/VOcWpl1A6F5XaK6rYuh7LZ5GQaSsjtNulEfBVXTaZ
 zFFrmULj7NxzCU5KYKBkNDMxBU1F9gZbvhFkaIA3lHlHRgSt/AC9PyE8ghIZuR364+
 eHQBBMC53WfQKlWsCjwa1vXprX1ZtHK00GwWRNSfPxemwEk1WncdT0F7HFpGOZzkU1
 ++u4BuvZEuqxruTWvVoqFEt7fFjGzu1GYqmJQxdWcT8DGgtP5rGslMn0aqktEZTBxo
 cdV094gt5U8IA==
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, Tvrtko
 Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDkvMzAvMjAyMCAyOjU4IFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gV2VkLCBT
ZXAgMzAsIDIwMjAgYXQgMDI6NTM6NThQTSArMDMwMCwgTWFvciBHb3R0bGllYiB3cm90ZToKPj4g
T24gOS8zMC8yMDIwIDI6NDUgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4+IE9uIFdlZCwg
U2VwIDMwLCAyMDIwIGF0IDEyOjUzOjIxUE0gKzAzMDAsIExlb24gUm9tYW5vdnNreSB3cm90ZToK
Pj4+PiBPbiBUdWUsIFNlcCAyOSwgMjAyMCBhdCAwNDo1OToyOVBNIC0wMzAwLCBKYXNvbiBHdW50
aG9ycGUgd3JvdGU6Cj4+Pj4+IE9uIFN1biwgU2VwIDI3LCAyMDIwIGF0IDA5OjQ2OjQ3QU0gKzAz
MDAsIExlb24gUm9tYW5vdnNreSB3cm90ZToKPj4+Pj4+IEBAIC0yOTYsMTEgKzIyMywxNyBAQCBz
dGF0aWMgc3RydWN0IGliX3VtZW0gKl9faWJfdW1lbV9nZXQoc3RydWN0IGliX2RldmljZSAqZGV2
aWNlLAo+Pj4+Pj4gICAgCQkJZ290byB1bWVtX3JlbGVhc2U7Cj4+Pj4+Pgo+Pj4+Pj4gICAgCQlj
dXJfYmFzZSArPSByZXQgKiBQQUdFX1NJWkU7Cj4+Pj4+PiAtCQlucGFnZXMgICAtPSByZXQ7Cj4+
Pj4+PiAtCj4+Pj4+PiAtCQlzZyA9IGliX3VtZW1fYWRkX3NnX3RhYmxlKHNnLCBwYWdlX2xpc3Qs
IHJldCwKPj4+Pj4+IC0JCQlkbWFfZ2V0X21heF9zZWdfc2l6ZShkZXZpY2UtPmRtYV9kZXZpY2Up
LAo+Pj4+Pj4gLQkJCSZ1bWVtLT5zZ19uZW50cyk7Cj4+Pj4+PiArCQlucGFnZXMgLT0gcmV0Owo+
Pj4+Pj4gKwkJc2cgPSBfX3NnX2FsbG9jX3RhYmxlX2Zyb21fcGFnZXMoCj4+Pj4+PiArCQkJJnVt
ZW0tPnNnX2hlYWQsIHBhZ2VfbGlzdCwgcmV0LCAwLCByZXQgPDwgUEFHRV9TSElGVCwKPj4+Pj4+
ICsJCQlkbWFfZ2V0X21heF9zZWdfc2l6ZShkZXZpY2UtPmRtYV9kZXZpY2UpLCBzZywgbnBhZ2Vz
LAo+Pj4+Pj4gKwkJCUdGUF9LRVJORUwpOwo+Pj4+Pj4gKwkJdW1lbS0+c2dfbmVudHMgPSB1bWVt
LT5zZ19oZWFkLm5lbnRzOwo+Pj4+Pj4gKwkJaWYgKElTX0VSUihzZykpIHsKPj4+Pj4+ICsJCQl1
bnBpbl91c2VyX3BhZ2VzX2RpcnR5X2xvY2socGFnZV9saXN0LCByZXQsIDApOwo+Pj4+Pj4gKwkJ
CXJldCA9IFBUUl9FUlIoc2cpOwo+Pj4+Pj4gKwkJCWdvdG8gdW1lbV9yZWxlYXNlOwo+Pj4+Pj4g
KwkJfQo+Pj4+Pj4gICAgCX0KPj4+Pj4+Cj4+Pj4+PiAgICAJc2dfbWFya19lbmQoc2cpOwo+Pj4+
PiBEb2VzIGl0IHN0aWxsIG5lZWQgdGhlIHNnX21hcmtfZW5kPwo+Pj4+IEl0IGlzIHByZXNlcnZl
ZCBoZXJlIGZvciBjb3JyZWN0bmVzcywgdGhlIHJlbGVhc2UgbG9naWMgZG9lc24ndCByZWx5IG9u
Cj4+Pj4gdGhpcyBtYXJrZXIsIGJ1dCBpdCBpcyBiZXR0ZXIgdG8gbGVhdmUgaXQuCj4+PiBJIG1l
YW4sIG15IHJlYWQgb2YgX19zZ19hbGxvY190YWJsZV9mcm9tX3BhZ2VzKCkgaXMgdGhhdCBpdCBh
bHJlYWR5Cj4+PiBwbGFjZWQgaXQsIHRoZSBmaW5hbCBfX2FsbG9jX3RhYmxlKCkgZG9lcyBpdD8K
Pj4gSXQgbWFya3MgdGhlIGxhc3QgYWxsb2NhdGVkIHNnZSwgYnV0IG5vdCB0aGUgbGFzdCBwb3B1
bGF0ZWQgc2dlICh3aXRoIHBhZ2UpLgo+IFdoeSBhcmUgdGhvc2UgZGlmZmVyZW50Pwo+Cj4gSXQg
bG9va3MgbGlrZSB0aGUgbGFzdCBpdGVyYXRpb24gY2FsbHMgX19hbGxvY190YWJsZSgpIHdpdGgg
YW4gZXhhY3QKPiBudW1iZXIgb2Ygc2dlcwo+Cj4gKwlpZiAoIXBydikgewo+ICsJCS8qIE9ubHkg
dGhlIGxhc3QgYWxsb2NhdGlvbiBjb3VsZCBiZSBsZXNzIHRoYW4gdGhlIG1heGltdW0gKi8KPiAr
CQl0YWJsZV9zaXplID0gbGVmdF9wYWdlcyA/IFNHX01BWF9TSU5HTEVfQUxMT0MgOiBjaHVua3M7
Cj4gKwkJcmV0ID0gc2dfYWxsb2NfdGFibGUoc2d0LCB0YWJsZV9zaXplLCBnZnBfbWFzayk7Cj4g
KwkJaWYgKHVubGlrZWx5KHJldCkpCj4gKwkJCXJldHVybiBFUlJfUFRSKHJldCk7Cj4gKwl9Cj4K
PiBKYXNvbgoKVGhpcyBpcyByaWdodCBvbmx5IGZvciB0aGUgbGFzdCBpdGVyYXRpb24uIEUuZy4g
aW4gdGhlIGZpcnN0IGl0ZXJhdGlvbiAKaW4gY2FzZSB0aGF0IHRoZXJlIGFyZSBtb3JlIHBhZ2Vz
IChsZWZ0X3BhZ2VzKSwgdGhlbiB3ZSBhbGxvY2F0ZSAKU0dfTUFYX1NJTkdMRV9BTExPQy7CoCBX
ZSBkb24ndCBrbm93IGhvdyBtYW55IHBhZ2VzIGZyb20gdGhlIHNlY29uZCAKaXRlcmF0aW9uIHdp
bGwgYmUgc3F1YXNoZWQgdG8gdGhlIFNHRSBmcm9tIHRoZSBmaXJzdCBpdGVyYXRpb24uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
