Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0176B112B83
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 13:32:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E796E0A0;
	Wed,  4 Dec 2019 12:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF5D6E0A0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 12:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 5B7EE48749;
 Wed,  4 Dec 2019 13:32:13 +0100 (CET)
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
 with ESMTP id CXe1WEAFpsSI; Wed,  4 Dec 2019 13:32:12 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 4CEC048748;
 Wed,  4 Dec 2019 13:32:08 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 4B4E2360608;
 Wed,  4 Dec 2019 13:32:08 +0100 (CET)
Subject: Re: [PATCH 6/8] drm: Add a drm_get_unmapped_area() helper
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20191203132239.5910-1-thomas_os@shipmail.org>
 <20191203132239.5910-7-thomas_os@shipmail.org>
 <e091063c-2c4a-866e-acdb-9efb1e20d737@amd.com>
 <98af5b11-1034-91fa-aa38-5730f116d1cd@shipmail.org>
 <3cc5b796-20c6-9f4c-3f62-d844f34d81b7@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <90a8d09a-b3ab-cd00-0cfb-1a4c72e91836@shipmail.org>
Date: Wed, 4 Dec 2019 13:32:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3cc5b796-20c6-9f4c-3f62-d844f34d81b7@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575462728; bh=LYhit8ToubKk0QgCgXtdE9QywuXKbd7AYpsvoNTHpF8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VtOUQDUSHGDnRjVQQTOXPWOKG1GPg7X3aXX24xXApU5wpb2efYc4q2cjNC507RBm2
 H7vQ2x06V5nvSi44lD232WnoVbZmVpnYArHV9VkQX0vv6yRGUDzXpWuV/2v7uP60cu
 acj+1pbggGd0tzLuFJhSWXOo3pL6Ds2HANrQiE8o=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=VtOUQDUS; 
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvNC8xOSAxOjA4IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFtIDA0LjEyLjE5
IHVtIDEyOjM2IHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk6Cj4+IE9uIDEyLzQv
MTkgMTI6MTEgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+PiBBbSAwMy4xMi4xOSB1bSAx
NDoyMiBzY2hyaWViIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpOgo+Pj4+IEZyb206IFRob21h
cyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPj4+Pgo+Pj4+IFRoaXMgaGVscGVy
IGlzIHVzZWQgdG8gYWxpZ24gdXNlci1zcGFjZSBidWZmZXIgb2JqZWN0IGFkZHJlc3NlcyB0bwo+
Pj4+IGh1Z2UgcGFnZSBib3VuZGFyaWVzLCBtaW5pbWl6aW5nIHRoZSBjaGFuY2Ugb2YgYWxpZ25t
ZW50IG1pc21hdGNoCj4+Pj4gYmV0d2VlbiB1c2VyLXNwYWNlIGFkZHJlc3NlcyBhbmQgcGh5c2lj
YWwgYWRkcmVzc2VzLgo+Pj4KPj4+IE1obSwgSSdtIHdvbmRlcmluZyBpZiB0aGF0IGlzIHJlYWxs
eSBzdWNoIGEgZ29vZCBpZGVhLgo+Pgo+PiBDb3VsZCB5b3UgZWxhYm9yYXRlPyBXaGF0IGRyYXdi
YWNrcyBkbyB5b3Ugc2VlPwo+Cj4gTWFpbiBwcm9ibGVtIGZvciBtZSBzZWVtcyB0byBiZSB0aGF0
IEkgZG9uJ3QgZnVsbHkgdW5kZXJzdGFuZCB3aGF0IHRoZSAKPiBnZXRfdW5tYXBwZWRfYXJlYSBj
YWxsYmFjayBpcyBkb2luZy4KCkl0IG1ha2VzIHN1cmUgdGhhdCwgaWYgdGhlcmUgaXMgYSBjaGFu
Y2UgdGhhdCB3ZSBjb3VsZCB1c2UgaHVnZSAKcGFnZS10YWJsZSBlbnRyaWVzLCB2aXJ0dWFsIGFk
ZHJlc3MgaHVnZSBwYWdlIGJvdW5kYXJpZXMgYXJlIHBlcmZlY3RseSAKYWxpZ25lZCB0byBwaHlz
aWNhbCBhZGRyZXNzIGh1Z2UgcGFnZSBib3VuZGFyaWVzLCB3aGljaCBpcyBpZiBub3QgYSBDUFUg
CmhhcmR3YXJlIHJlcXVpcmVtZW50LCBhdCBsZWFzdCBhIGtlcm5lbCByZXF1aXJlbWVudCBjdXJy
ZW50bHkuCgoKPgo+IEZvciBleGFtcGxlIHdoeSBkbyB3ZSBuZWVkIHRvIHVzZSBkcm1fdm1hX29m
ZnNldF9sb29rdXBfbG9ja2VkKCkgdG8gCj4gYWRqdXN0IHRoZSBwZ29mZj8KPgo+IFRoZSBtYXBw
ZWQgb2Zmc2V0IHNob3VsZCBiZSBjb21wbGV0ZWx5IGlycmVsZXZhbnQgZm9yIGZpbmRpbmcgc29t
ZSAKPiBwaWVjZSBvZiB1c2Vyc3BhY2UgYWRkcmVzcyBzcGFjZSBvciBhbSBJIHRvdGFsbHkgb2Zm
IGhlcmU/CgoKQmVjYXVzZSB0aGUgdW5tb2RpZmllZCBwZ29mZiBhc3N1bWVzIHRoYXQgcGh5c2lj
YWwgYWRkcmVzcyBib3VuZGFyaWVzIAphcmUgcGVyZmVjdGx5IGFsaWduZWQgd2l0aCBmaWxlIG9m
ZnNldCBib3VuZGFyaWVzLCB3aGljaCBpcyB0eXBpY2FsIGZvciAKYWxsIG90aGVyIHN1YnN5c3Rl
bXMuCgpUaGF0J3Mgbm90IHRydWUgZm9yIFRUTSwgaG93ZXZlciwgd2hlcmUgYSBidWZmZXIgb2Jq
ZWN0IHN0YXJ0IHBoeXNpY2FsIAphZGRyZXNzIG1heSBiZSBodWdlIHBhZ2UgYWxpZ25lZCwgYnV0
IHRoZSBmaWxlIG9mZnNldCBpcyBhbHdheXMgcGFnZSAKYWxpZ25lZC4gV2UgY291bGQgb2YgY291
cnNlIGNoYW5nZSB0aGF0IHRvIGFsaWduIGFsc28gZmlsZSBvZmZzZXRzIHRvIApodWdlIHBhZ2Ug
c2l6ZSBib3VuZGFyaWVzLCBidXQgd2l0aCB0aGUgYWJvdmUgYWRqdXN0bWVudCwgdGhhdCdzIG5v
dCAKbmVlZGVkLiBJIG9wdGVkIGZvciB0aGUgYWRqdXN0bWVudC4KClRoYW5rcywKClRob21hcwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
