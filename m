Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B406F112D8B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 15:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FA06E912;
	Wed,  4 Dec 2019 14:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141486E912
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 14:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 720543F4CF;
 Wed,  4 Dec 2019 15:37:03 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sRSZ8Ap_cuBZ; Wed,  4 Dec 2019 15:37:02 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 6356F3F47A;
 Wed,  4 Dec 2019 15:36:58 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 8EFC2360608;
 Wed,  4 Dec 2019 15:36:58 +0100 (CET)
Subject: Re: [PATCH v2 2/2] drm/ttm: Fix vm page protection handling
To: Michal Hocko <mhocko@kernel.org>
References: <20191203104853.4378-1-thomas_os@shipmail.org>
 <20191203104853.4378-3-thomas_os@shipmail.org>
 <20191204135219.GH25242@dhcp22.suse.cz>
 <b29b166c-e9fe-f829-f533-b39f98b334a9@shipmail.org>
 <20191204143521.GJ25242@dhcp22.suse.cz>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <5c2658b6-b5ec-5747-c360-fada54d759ed@shipmail.org>
Date: Wed, 4 Dec 2019 15:36:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191204143521.GJ25242@dhcp22.suse.cz>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575470218; bh=TGnqQTPAKnacfdO2ZsLhS8SGD7K1wjqKiMBUEZMkVog=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nYyXuGow8yhW6nhPRKfXD1yrFTQfuF/NJtNJZeZI6ZT+BwxjAWGpPuqt5ljBjElIj
 ZixSoo7Z3EDNcj8ytbLiMlZgbLW/dggtICmzzvrwXZWmR6cAbBI/116NAG1712YOXP
 kCZ9E0laek7wL2eW5OKrMfFYYwWgkjhpvgBF87T8=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=nYyXuGow; 
 dkim-atps=neutral
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, pv-drivers@vmware.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvNC8xOSAzOjM1IFBNLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gT24gV2VkIDA0LTEyLTE5
IDE1OjE2OjA5LCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90ZToKPj4gT24gMTIvNC8x
OSAyOjUyIFBNLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4+PiBPbiBUdWUgMDMtMTItMTkgMTE6NDg6
NTMsIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpIHdyb3RlOgo+Pj4+IEZyb206IFRob21hcyBI
ZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPj4+Pgo+Pj4+IFRUTSBncmFwaGljcyBi
dWZmZXIgb2JqZWN0cyBtYXksIHRyYW5zcGFyZW50bHkgdG8gdXNlci1zcGFjZSwgIG1vdmUKPj4+
PiBiZXR3ZWVuIElPIGFuZCBzeXN0ZW0gbWVtb3J5LiBXaGVuIHRoYXQgaGFwcGVucywgYWxsIFBU
RXMgcG9pbnRpbmcgdG8gdGhlCj4+Pj4gb2xkIGxvY2F0aW9uIGFyZSB6YXBwZWQgYmVmb3JlIHRo
ZSBtb3ZlIGFuZCB0aGVuIGZhdWx0ZWQgaW4gYWdhaW4gaWYKPj4+PiBuZWVkZWQuIFdoZW4gdGhh
dCBoYXBwZW5zLCB0aGUgcGFnZSBwcm90ZWN0aW9uIGNhY2hpbmcgbW9kZS0gYW5kCj4+Pj4gZW5j
cnlwdGlvbiBiaXRzIG1heSBjaGFuZ2UgYW5kIGJlIGRpZmZlcmVudCBmcm9tIHRob3NlIG9mCj4+
Pj4gc3RydWN0IHZtX2FyZWFfc3RydWN0Ojp2bV9wYWdlX3Byb3QuCj4+Pj4KPj4+PiBXZSB3ZXJl
IHVzaW5nIGFuIHVnbHkgaGFjayB0byBzZXQgdGhlIHBhZ2UgcHJvdGVjdGlvbiBjb3JyZWN0bHku
Cj4+Pj4gRml4IHRoYXQgYW5kIGluc3RlYWQgdXNlIHZtZl9pbnNlcnRfbWl4ZWRfcHJvdCgpIGFu
ZCAvIG9yCj4+Pj4gdm1mX2luc2VydF9wZm5fcHJvdCgpLgo+Pj4+IEFsc28gZ2V0IHRoZSBkZWZh
dWx0IHBhZ2UgcHJvdGVjdGlvbiBmcm9tCj4+Pj4gc3RydWN0IHZtX2FyZWFfc3RydWN0Ojp2bV9w
YWdlX3Byb3QgcmF0aGVyIHRoYW4gdXNpbmcgdm1fZ2V0X3BhZ2VfcHJvdCgpLgo+Pj4+IFRoaXMg
d2F5IHdlIGNhdGNoIG1vZGlmaWNhdGlvbnMgZG9uZSBieSB0aGUgdm0gc3lzdGVtIGZvciBkcml2
ZXJzIHRoYXQKPj4+PiB3YW50IHdyaXRlLW5vdGlmaWNhdGlvbi4KPj4+IFNvIGVzc2VudGlhbGx5
IHRoaXMgc2hvdWxkIGhhdmUgYW55IG5ldyBzaWRlIGVmZmVjdCBvbiBmdW5jdGlvbmFsaXR5IGl0
Cj4+PiBpcyBqdXN0IG1ha2luZyBhIGhhY2t5L3VnbHkgY29kZSBsZXNzIHNvPwo+PiBGdW5jdGlv
bmFsaXR5IGlzIHVuY2hhbmdlZC4gVGhlIHVzZSBvZiBhIG9uLXN0YWNrIHZtYSBjb3B5IHdhcyBz
ZXZlcmVseQo+PiBmcm93bmVkIHVwb24gaW4gYW4gZWFybGllciB0aHJlYWQsIHdoaWNoIGFsc28g
cG9pbnRzIHRvIGFub3RoZXIgc2ltaWxhcgo+PiBleGFtcGxlIHVzaW5nIHZtZl9pbnNlcnRfcGZu
X3Byb3QoKS4KPj4KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDkwNTEwMzU0
MS40MTYxLTItdGhvbWFzX29zQHNoaXBtYWlsLm9yZy8KPj4KPj4+IEluIG90aGVyIHdvcmRzIHdo
YXQgYXJlIHRoZQo+Pj4gY29uc2VxdWVuY2VzIG9mIGhhdmluZyBwYWdlIHByb3RlY3Rpb24gaW5j
b25zaXN0ZW50IGZyb20gdm1hJ3M/Cj4+IER1cmluZyB0aGUgeWVhcnMsIGl0IGxvb2tzIGxpa2Ug
dGhlIGNhY2hpbmctIGFuZCBlbmNyeXB0aW9uIGZsYWdzIG9mCj4+IHZtYTo6dm1fcGFnZV9wcm90
IGhhdmUgYmVlbiBsYXJnZWx5IHJlbW92ZWQgZnJvbSB1c2FnZS4gRnJvbSB3aGF0IEkgY2FuCj4+
IHRlbGwsIHRoZXJlIGFyZSBubyBtb3JlIHBsYWNlcyBsZWZ0IHRoYXQgY2FuIGFmZmVjdCBUVE0u
IFdlIGRpc2N1c3NlZAo+PiBfX3NwbGl0X2h1Z2VfcG1kX2xvY2tlZCgpIHRvd2FyZHMgdGhlIGVu
ZCBvZiB0aGF0IHRocmVhZCwgYnV0IHRoYXQgZG9lc24ndAo+PiBhZmZlY3QgVFRNIGV2ZW4gd2l0
aCBodWdlIHBhZ2UtdGFibGUgZW50cmllcy4KPiBQbGVhc2Ugc3RhdGUgYWxsIHRob3NlIGRldGFp
bHMvYXNzdW1wdGlvbnMgeW91IGFyZSBvcGVyYXRpbmcgb24gaW4gdGhlCj4gY2hhbmdlbG9nLgoK
VGhhbmtzLiBJJ2xsIHVwZGF0ZSB0aGUgcGF0Y2hzZXQgYW5kIGFkZCB0aGF0LgoKL1Rob21hcwoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
