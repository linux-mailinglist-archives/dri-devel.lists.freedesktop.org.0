Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B84CA112E69
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 16:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8624D6E916;
	Wed,  4 Dec 2019 15:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDC36E916
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 15:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 7270D3F8F3;
 Wed,  4 Dec 2019 16:29:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LxC5UGT91HcE; Wed,  4 Dec 2019 16:29:13 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 111443F8A2;
 Wed,  4 Dec 2019 16:29:10 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 4081F360608;
 Wed,  4 Dec 2019 16:29:10 +0100 (CET)
Subject: Re: [PATCH v2 2/2] drm/ttm: Fix vm page protection handling
To: Michal Hocko <mhocko@kernel.org>
References: <20191203104853.4378-1-thomas_os@shipmail.org>
 <20191203104853.4378-3-thomas_os@shipmail.org>
 <20191204135219.GH25242@dhcp22.suse.cz>
 <b29b166c-e9fe-f829-f533-b39f98b334a9@shipmail.org>
 <20191204143521.GJ25242@dhcp22.suse.cz>
 <5c2658b6-b5ec-5747-c360-fada54d759ed@shipmail.org>
 <20191204144248.GK25242@dhcp22.suse.cz>
 <b7b3ba5a-f625-36bc-d9cf-d537ec60e592@shipmail.org>
 <20191204152644.GL25242@dhcp22.suse.cz>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <70d8fe46-2703-d0d4-d70e-abccf07e64b5@shipmail.org>
Date: Wed, 4 Dec 2019 16:29:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191204152644.GL25242@dhcp22.suse.cz>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575473350; bh=yHBICBBNQ0xElpVdR6AIUN8r0Xt8fA+KemiJ+/fl3xo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Rzdema0gbT4sovNyPVOJezOySXEW3YILI0pE4CjzAeyAuHOWqcJbymOFlOqPY2adU
 EBEAuAiIOZ52jwTe8zy/g3MMIbv2bv1j3OIW7Ls9NxtMFOyvsmNNSOIF6AnTMFXLl9
 +WWSDCbGDRd76MwdlkHEzVuWOQ2msjKXixkIN7cw=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Rzdema0g; 
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

T24gMTIvNC8xOSA0OjI2IFBNLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gT24gV2VkIDA0LTEyLTE5
IDE2OjE5OjI3LCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90ZToKPj4gT24gMTIvNC8x
OSAzOjQyIFBNLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4+PiBPbiBXZWQgMDQtMTItMTkgMTU6MzY6
NTgsIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpIHdyb3RlOgo+Pj4+IE9uIDEyLzQvMTkgMzoz
NSBQTSwgTWljaGFsIEhvY2tvIHdyb3RlOgo+Pj4+PiBPbiBXZWQgMDQtMTItMTkgMTU6MTY6MDks
IFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpIHdyb3RlOgo+Pj4+Pj4gT24gMTIvNC8xOSAyOjUy
IFBNLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4+Pj4+Pj4gT24gVHVlIDAzLTEyLTE5IDExOjQ4OjUz
LCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90ZToKPj4+Pj4+Pj4gRnJvbTogVGhvbWFz
IEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUVE0g
Z3JhcGhpY3MgYnVmZmVyIG9iamVjdHMgbWF5LCB0cmFuc3BhcmVudGx5IHRvIHVzZXItc3BhY2Us
ICBtb3ZlCj4+Pj4+Pj4+IGJldHdlZW4gSU8gYW5kIHN5c3RlbSBtZW1vcnkuIFdoZW4gdGhhdCBo
YXBwZW5zLCBhbGwgUFRFcyBwb2ludGluZyB0byB0aGUKPj4+Pj4+Pj4gb2xkIGxvY2F0aW9uIGFy
ZSB6YXBwZWQgYmVmb3JlIHRoZSBtb3ZlIGFuZCB0aGVuIGZhdWx0ZWQgaW4gYWdhaW4gaWYKPj4+
Pj4+Pj4gbmVlZGVkLiBXaGVuIHRoYXQgaGFwcGVucywgdGhlIHBhZ2UgcHJvdGVjdGlvbiBjYWNo
aW5nIG1vZGUtIGFuZAo+Pj4+Pj4+PiBlbmNyeXB0aW9uIGJpdHMgbWF5IGNoYW5nZSBhbmQgYmUg
ZGlmZmVyZW50IGZyb20gdGhvc2Ugb2YKPj4+Pj4+Pj4gc3RydWN0IHZtX2FyZWFfc3RydWN0Ojp2
bV9wYWdlX3Byb3QuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFdlIHdlcmUgdXNpbmcgYW4gdWdseSBoYWNr
IHRvIHNldCB0aGUgcGFnZSBwcm90ZWN0aW9uIGNvcnJlY3RseS4KPj4+Pj4+Pj4gRml4IHRoYXQg
YW5kIGluc3RlYWQgdXNlIHZtZl9pbnNlcnRfbWl4ZWRfcHJvdCgpIGFuZCAvIG9yCj4+Pj4+Pj4+
IHZtZl9pbnNlcnRfcGZuX3Byb3QoKS4KPj4+Pj4+Pj4gQWxzbyBnZXQgdGhlIGRlZmF1bHQgcGFn
ZSBwcm90ZWN0aW9uIGZyb20KPj4+Pj4+Pj4gc3RydWN0IHZtX2FyZWFfc3RydWN0Ojp2bV9wYWdl
X3Byb3QgcmF0aGVyIHRoYW4gdXNpbmcgdm1fZ2V0X3BhZ2VfcHJvdCgpLgo+Pj4+Pj4+PiBUaGlz
IHdheSB3ZSBjYXRjaCBtb2RpZmljYXRpb25zIGRvbmUgYnkgdGhlIHZtIHN5c3RlbSBmb3IgZHJp
dmVycyB0aGF0Cj4+Pj4+Pj4+IHdhbnQgd3JpdGUtbm90aWZpY2F0aW9uLgo+Pj4+Pj4+IFNvIGVz
c2VudGlhbGx5IHRoaXMgc2hvdWxkIGhhdmUgYW55IG5ldyBzaWRlIGVmZmVjdCBvbiBmdW5jdGlv
bmFsaXR5IGl0Cj4+Pj4+Pj4gaXMganVzdCBtYWtpbmcgYSBoYWNreS91Z2x5IGNvZGUgbGVzcyBz
bz8KPj4+Pj4+IEZ1bmN0aW9uYWxpdHkgaXMgdW5jaGFuZ2VkLiBUaGUgdXNlIG9mIGEgb24tc3Rh
Y2sgdm1hIGNvcHkgd2FzIHNldmVyZWx5Cj4+Pj4+PiBmcm93bmVkIHVwb24gaW4gYW4gZWFybGll
ciB0aHJlYWQsIHdoaWNoIGFsc28gcG9pbnRzIHRvIGFub3RoZXIgc2ltaWxhcgo+Pj4+Pj4gZXhh
bXBsZSB1c2luZyB2bWZfaW5zZXJ0X3Bmbl9wcm90KCkuCj4+Pj4+Pgo+Pj4+Pj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDkwNTEwMzU0MS40MTYxLTItdGhvbWFzX29zQHNoaXBt
YWlsLm9yZy8KPj4+Pj4+Cj4+Pj4+Pj4gSW4gb3RoZXIgd29yZHMgd2hhdCBhcmUgdGhlCj4+Pj4+
Pj4gY29uc2VxdWVuY2VzIG9mIGhhdmluZyBwYWdlIHByb3RlY3Rpb24gaW5jb25zaXN0ZW50IGZy
b20gdm1hJ3M/Cj4+Pj4+PiBEdXJpbmcgdGhlIHllYXJzLCBpdCBsb29rcyBsaWtlIHRoZSBjYWNo
aW5nLSBhbmQgZW5jcnlwdGlvbiBmbGFncyBvZgo+Pj4+Pj4gdm1hOjp2bV9wYWdlX3Byb3QgaGF2
ZSBiZWVuIGxhcmdlbHkgcmVtb3ZlZCBmcm9tIHVzYWdlLiBGcm9tIHdoYXQgSSBjYW4KPj4+Pj4+
IHRlbGwsIHRoZXJlIGFyZSBubyBtb3JlIHBsYWNlcyBsZWZ0IHRoYXQgY2FuIGFmZmVjdCBUVE0u
IFdlIGRpc2N1c3NlZAo+Pj4+Pj4gX19zcGxpdF9odWdlX3BtZF9sb2NrZWQoKSB0b3dhcmRzIHRo
ZSBlbmQgb2YgdGhhdCB0aHJlYWQsIGJ1dCB0aGF0IGRvZXNuJ3QKPj4+Pj4+IGFmZmVjdCBUVE0g
ZXZlbiB3aXRoIGh1Z2UgcGFnZS10YWJsZSBlbnRyaWVzLgo+Pj4+PiBQbGVhc2Ugc3RhdGUgYWxs
IHRob3NlIGRldGFpbHMvYXNzdW1wdGlvbnMgeW91IGFyZSBvcGVyYXRpbmcgb24gaW4gdGhlCj4+
Pj4+IGNoYW5nZWxvZy4KPj4+PiBUaGFua3MuIEknbGwgdXBkYXRlIHRoZSBwYXRjaHNldCBhbmQg
YWRkIHRoYXQuCj4+PiBBbmQgdGhpbmtpbmcgYWJvdXQgdGhhdCB0aGlzIGFsc28gYmVncyBmb3Ig
YSBjb21tZW50IGluIHRoZSBjb2RlIHRvCj4+PiBleHBsYWluIHRoYXQgc29tZSAod2hpY2g/KSBt
YXBwaW5ncyBtaWdodCBoYXZlIGEgbWlzbWF0Y2ggYW5kIHRoZQo+Pj4gZ2VuZXJpYyBjb2RlIGhh
dmUgdG8gYmUgY2FyZWZ1bC4gQmVjYXVzZSBhcyB0aGluZ3Mgc3RhbmQgbm93IHRoaXMgc2VlbXMK
Pj4+IHRvIGJlIHJlYWxseSBzdWJ0bGUgYW5kIGhhcHBlbiB0byB3b3JrIF9ub3dfIGFuZCBtaWdo
dCBicmVhayBpbiB0aGUgZnV0dXJlLgo+Pj4gT3Igd2hhdCBkb2VzIHByZXZlbnQgYSBnZW5lcmlj
IGNvZGUgdG8gc3R1bWJsZSBvdmVyIHRoaXMgZGlzY3JlcGFuY3k/Cj4+IFllcyB3ZSBoYWQgdGhh
dCBkaXNjdXNzaW9uIGluIHRoZSB0aHJlYWQgSSBwb2ludGVkIHRvLiBJIGluaXRpYWxseSBzdWdn
ZXN0ZWQKPj4gYW5kIGFyZ3VlZCBmb3IgdXBkYXRpbmcgdGhlIHZtYTo6dm1fcGFnZV9wcm90IHVz
aW5nIGEgV1JJVEVfT05DRSgpICh3ZSBvbmx5Cj4+IGhhdmUgdGhlIG1tYXBfc2VtIGluIHJlYWQg
bW9kZSksIHRoZXJlIHNlZW1zIHRvIGJlIG90aGVyIHBsYWNlcyBpbiBnZW5lcmljCj4+IGNvZGUg
dGhhdCBkb2VzIHRoZSBzYW1lLgo+Pgo+PiBCdXQgSSB3YXMgY29udmluY2VkIGJ5IEFuZHkgdGhh
dCB0aGlzIHdhcyB0aGUgcmlnaHQgd2F5IGFuZCBhbHNvIHdhcyB1c2VkCj4+IGVsc2V3aGVyZS4K
Pj4KPj4gKFNlZSBhbHNvIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9z
b3VyY2UvYXJjaC94ODYvZW50cnkvdmRzby92bWEuYyNMMTE2KQo+Pgo+PiBJIGd1ZXNzIHRvIGhh
dmUgdGhpcyBwcm9wZXJseSBmb3JtdWxhdGVkLCB3aGF0J3MgcmVxdWlyZWQgaXMgdGhhdCBnZW5l
cmljCj4+IGNvZGUgZG9lc24ndCBidWlsZCBwYWdlLXRhYmxlIGVudHJpZXMgdXNpbmcgdm1hOjp2
bV9wYWdlX3Byb3QgZm9yIFZNX1BGTk1BUAo+PiBhbmQgVk1fTUlYRURNQVAgb3V0c2lkZSBvZiBk
cml2ZXIgY29udHJvbC4KPiBMZXQgbWUgcmVwZWF0IHRoYXQgdGhpcyBiZWxvbmdzIHRvIGEgY29k
ZSBzb21ld2hlcmUgZXZlcnlib2R5IGNhbiBzZWUgaXQKPiByYXRoZXIgdGhhbiBhICJyYW5kb20i
IGRpc2N1c3Npb24gYXQgbWFpbGluZyBsaXN0Lgo+Cj4gVGhhbmtzIQoKWWVzLCBJIGFncmVlLiBJ
J2xsIG9mIGNvdXJzZSBmb2xsb3cgdXAgd2l0aCB0aGUgY29tbWVudHMgYWRkZWQgdG8gdGhlIGNv
ZGUuCgpUaG9tYXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
