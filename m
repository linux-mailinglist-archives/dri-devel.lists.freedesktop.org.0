Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA8A112C70
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 14:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34746E8FD;
	Wed,  4 Dec 2019 13:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AAB6E8F9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 13:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id D8AF9467CA;
 Wed,  4 Dec 2019 14:18:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EIqWR5aWcPAF; Wed,  4 Dec 2019 14:18:41 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id BE2FA44746;
 Wed,  4 Dec 2019 14:18:32 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id EC98F360608;
 Wed,  4 Dec 2019 14:18:31 +0100 (CET)
Subject: Re: [PATCH 7/8] drm/ttm: Introduce a huge page aligning TTM range
 manager.
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20191203132239.5910-1-thomas_os@shipmail.org>
 <20191203132239.5910-8-thomas_os@shipmail.org>
 <39b9d651-6afd-1926-7302-aa2a8d4ca626@amd.com>
 <7223bee1-cb3f-3d88-a70b-f4e1a5088b76@shipmail.org>
 <f87a03da-ea9d-fe2b-8069-8fe0bda57c12@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <6ae46281-195c-2803-fc3d-16e7bc830639@shipmail.org>
Date: Wed, 4 Dec 2019 14:18:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f87a03da-ea9d-fe2b-8069-8fe0bda57c12@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575465512; bh=IKSdOffMMCGw4BKLa9MTKdFtfJNsTX9WSr6dGqHn/g4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=frJKjwFt6rB457iADirl6My28RdJmsbR31/M+st6rbeAkliu7b/3kmLdCxyW62zCN
 j7Sr1oKys01bpK8z8xzh3s1kXh+HQOVehS8ZiosK9VB4rMZOw/sThilyRG8pTQKl0e
 n4AsVcxAdxWwIqDO8em4ciUk92BUSVYlnLHlafZ8=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=frJKjwFt; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=shipmail.org
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

T24gMTIvNC8xOSAxOjE2IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFtIDA0LjEyLjE5
IHVtIDEyOjQ1IHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk6Cj4+IE9uIDEyLzQv
MTkgMTI6MTMgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+PiBBbSAwMy4xMi4xOSB1bSAx
NDoyMiBzY2hyaWViIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpOgo+Pj4+IEZyb206IFRob21h
cyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPj4+Pgo+Pj4+IFVzaW5nIGh1Z2Ug
cGFnZS10YWJsZSBlbnRyaWVzIHJlcXVpcmUgdGhhdCB0aGUgc3RhcnQgb2YgYSBidWZmZXIgCj4+
Pj4gb2JqZWN0Cj4+Pj4gaXMgaHVnZSBwYWdlIHNpemUgYWxpZ25lZC4gU28gaW50cm9kdWNlIGEg
dHRtX2JvX21hbl9nZXRfbm9kZV9odWdlKCkKPj4+PiBmdW5jdGlvbiB0aGF0IGF0dGVtcHRzIHRv
IGFjY29tcGxpc2ggdGhpcyBmb3IgYWxsb2NhdGlvbnMgdGhhdCBhcmUgCj4+Pj4gbGFyZ2VyCj4+
Pj4gdGhhbiB0aGUgaHVnZSBwYWdlIHNpemUsIGFuZCBwcm92aWRlIGEgbmV3IHJhbmdlLW1hbmFn
ZXIgaW5zdGFuY2UgdGhhdAo+Pj4+IHVzZXMgdGhhdCBmdW5jdGlvbi4KPj4+Cj4+PiBJIHN0aWxs
IGRvbid0IHRoaW5rIHRoYXQgdGhpcyBpcyBhIGdvb2QgaWRlYS4KPj4KPj4gQWdhaW4sIGNhbiB5
b3UgZWxhYm9yYXRlIHdpdGggc29tZSBzcGVjaWZpYyBjb25jZXJucz8KPgo+IFlvdSBzZWVtcyB0
byBiZSBzZWVpbmcgUFVEIGFzIHNvbWV0aGluZyBvcHRpb25hbC4KPgo+Pj4KPj4+IFRoZSBkcml2
ZXIvdXNlcnNwYWNlIHNob3VsZCBqdXN0IHVzZSBhIHByb3BlciBhbGlnbm1lbnQgaWYgaXQgd2Fu
dHMgCj4+PiB0byB1c2UgaHVnZSBwYWdlcy4KPj4KPj4gVGhlcmUgYXJlIGRyYXdiYWNrcyB3aXRo
IHRoaXMgYXBwcm9hY2guIFRoZSBUVE0gYWxpZ25tZW50IGlzIGEgaGFyZCAKPj4gY29uc3RyYWlu
dC4gQXNzdW1lIHRoYXQgeW91IHdhbnQgdG8gZml0IGEgMUdCIGJ1ZmZlciBvYmplY3QgaW50byAK
Pj4gbGltaXRlZCBWUkFNIHNwYWNlLCBhbmQgX2lmIHBvc3NpYmxlXyB1c2UgUFVEIHNpemUgaHVn
ZSBwYWdlcy4gTGV0J3MgCj4+IHNheSB0aGVyZSBpcyAxR0IgYXZhaWxhYmxlLCBidXQgbm90IDFH
QiBhbGlnbmVkLiBUaGUgcHJvcGVyIGFsaWdubWVudCAKPj4gYXBwcm9hY2ggd291bGQgZmFpbCBh
bmQgcG9zc2libHkgc3RhcnQgdG8gZXZpY3Qgc3R1ZmYgZnJvbSBWUkFNIGp1c3QgCj4+IHRvIGJl
IGFibGUgdG8gYWNjb21vZGF0ZSB0aGUgUFVEIGFsaWdubWVudC4gVGhhdCdzIGJhZC4gVGhlIGFw
cHJvYWNoIAo+PiBJIHN1Z2dlc3Qgd291bGQgaW5zdGVhZCBmYWxsIGJhY2sgdG8gUE1EIGFsaWdu
bWVudCBhbmQgdXNlIDJNQiBwYWdlIAo+PiB0YWJsZSBlbnRyaWVzIGlmIHBvc3NpYmxlLCBhbmQg
YXMgYSBsYXN0IHJlc29ydCB1c2UgNEsgcGFnZSB0YWJsZSAKPj4gZW50cmllcy4KPgo+IEFuZCBl
eGFjdGx5IHRoYXQgc291bmRzIGxpa2UgYSBiYWQgaWRlYSB0byBtZS4KPgo+IFVzaW5nIDFHQiBh
bGlnbm1lbnQgaXMgaW5kZWVkIHVucmVhbGlzdGljIGluIG1vc3QgY2FzZXMsIGJ1dCBmb3IgMk1C
IAo+IGFsaWdubWVudCB3ZSBzaG91bGQgcmVhbGx5IHN0YXJ0IHRvIGV2aWN0IEJPcy4KPgo+IE90
aGVyd2lzZSB0aGUgYWRkcmVzcyBzcGFjZSBjYW4gYmVjb21lIGZyYWdtZW50ZWQgYW5kIHdlIHdv
bid0IGJlIGFibGUgCj4gZGUtZnJhZ21lbnQgaXQgaW4gYW55IHdheS4KCkFoLCBJIHNlZSwgWWVh
aCB0aGF0J3MgdGhlIFRIUCB0cmFkZW9mZiBiZXR3ZWVuIGZyYWdtZW50YXRpb24gYW5kIAptZW1v
cnktdXNhZ2UuIEZyb20gbXkgcG9pbnQgb2YgdmlldywgaXQncyBub3Qgc2VsZi1ldmlkZW50IHRo
YXQgZWl0aGVyIAphcHByb2FjaCBpcyB0aGUgYmVzdCBvbmUsIGJ1dCB0aGUgbmljZSB0aGluZyB3
aXRoIHRoZSBzdWdnZXN0ZWQgY29kZSBpcyAKdGhhdCB5b3UgY2FuIHZpZXcgaXQgYXMgYW4gb3B0
aW9uYWwgaGVscGVyLiBGb3IgZXhhbXBsZSwgdG8gYXZvaWQgCmZyYWdtZW50YXRpb24gYW5kIGhh
dmUgYSBoaWdoIGh1Z2UtcGFnZSBoaXQgcmF0aW8gZm9yIDJNQiBwYWdlcywgWW91J2QgCmVpdGhl
ciBpbmZsYXRlIHRoZSBidWZmZXIgb2JqZWN0IHNpemUgdG8gYmUgMk1CIGFsaWduZWQsIHdoaWNo
IHdvdWxkIAphZmZlY3QgYWxzbyBzeXN0ZW0gbWVtb3J5LCBvciB5b3UnZCBzZXQgdGhlIFRUTSBt
ZW1vcnkgYWxpZ25tZW50IHRvIDJNQi4gCklmIGluIGFkZGl0aW9uIHlvdSdkIGxpa2UgInNvZnQi
IChub24tZXZpY3RpbmcpIGFsaWdubWVudCBhbHNvIGZvciAxR0IgCnBhZ2VzLCB5b3UnZCBhbHNv
IGhvb2sgdXAgdGhlIG5ldyByYW5nZSBtYW5hZ2VyLiBJIGZpZ3VyZSBkaWZmZXJlbnQgCmRyaXZl
cnMgd291bGQgd2FudCB0byB1c2UgZGlmZmVyZW50IHN0cmF0ZWdpZXMuCgpJbiBhbnkgY2FzZSwg
dm13Z2Z4IHdvdWxkLCBkdWUgdG8gaXRzIHZlcnkgbGltaXRlZCBWUkFNIHNpemUsIHdhbnQgdG8g
CnVzZSB0aGUgInNvZnQiIGFsaWdubWVudCBwcm92aWRlZCBieSB0aGlzIHBhdGNoLCBidXQgaWYg
eW91IGRvbid0IHNlZSAKYW55IG90aGVyIGRyaXZlcnMgd2FudGluZyB0aGF0LCBJIGNvdWxkIGRl
ZmluaXRlbHkgbW92ZSBpdCB0byB2bXdnZnguCgovVGhvbWFzCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
