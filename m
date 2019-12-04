Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD47112E2D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 16:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437136E906;
	Wed,  4 Dec 2019 15:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D686E906
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 15:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 77FAC3F418;
 Wed,  4 Dec 2019 16:19:32 +0100 (CET)
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
 with ESMTP id GMt9AI3aLq8w; Wed,  4 Dec 2019 16:19:31 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 58EA03F413;
 Wed,  4 Dec 2019 16:19:27 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 8C0DC360608;
 Wed,  4 Dec 2019 16:19:27 +0100 (CET)
Subject: Re: [PATCH v2 2/2] drm/ttm: Fix vm page protection handling
To: Michal Hocko <mhocko@kernel.org>
References: <20191203104853.4378-1-thomas_os@shipmail.org>
 <20191203104853.4378-3-thomas_os@shipmail.org>
 <20191204135219.GH25242@dhcp22.suse.cz>
 <b29b166c-e9fe-f829-f533-b39f98b334a9@shipmail.org>
 <20191204143521.GJ25242@dhcp22.suse.cz>
 <5c2658b6-b5ec-5747-c360-fada54d759ed@shipmail.org>
 <20191204144248.GK25242@dhcp22.suse.cz>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <b7b3ba5a-f625-36bc-d9cf-d537ec60e592@shipmail.org>
Date: Wed, 4 Dec 2019 16:19:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191204144248.GK25242@dhcp22.suse.cz>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575472767; bh=YgSZucqCNwJPIVx9FkQL9howdBrm5GEYzP1TK7lj8f4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BIzth5pmvF4LmI9Ct05xwXwGYvq1ClqzfKX6OlROHfo+dfi3odLmEnYt7wOSE4MBk
 rzIsPiJ9OxjHKRqUaQbG/9n9uqAIq5sBub4hHmylLYR/UmHlWjKXc7ld9jzNkIqwC7
 RhQQzxPlcJxlNKlI4pKtwb3bHoRKJN+FyWGmQBFg=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=BIzth5pm; 
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

T24gMTIvNC8xOSAzOjQyIFBNLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gT24gV2VkIDA0LTEyLTE5
IDE1OjM2OjU4LCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90ZToKPj4gT24gMTIvNC8x
OSAzOjM1IFBNLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4+PiBPbiBXZWQgMDQtMTItMTkgMTU6MTY6
MDksIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpIHdyb3RlOgo+Pj4+IE9uIDEyLzQvMTkgMjo1
MiBQTSwgTWljaGFsIEhvY2tvIHdyb3RlOgo+Pj4+PiBPbiBUdWUgMDMtMTItMTkgMTE6NDg6NTMs
IFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpIHdyb3RlOgo+Pj4+Pj4gRnJvbTogVGhvbWFzIEhl
bGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+Pj4+Pj4KPj4+Pj4+IFRUTSBncmFwaGlj
cyBidWZmZXIgb2JqZWN0cyBtYXksIHRyYW5zcGFyZW50bHkgdG8gdXNlci1zcGFjZSwgIG1vdmUK
Pj4+Pj4+IGJldHdlZW4gSU8gYW5kIHN5c3RlbSBtZW1vcnkuIFdoZW4gdGhhdCBoYXBwZW5zLCBh
bGwgUFRFcyBwb2ludGluZyB0byB0aGUKPj4+Pj4+IG9sZCBsb2NhdGlvbiBhcmUgemFwcGVkIGJl
Zm9yZSB0aGUgbW92ZSBhbmQgdGhlbiBmYXVsdGVkIGluIGFnYWluIGlmCj4+Pj4+PiBuZWVkZWQu
IFdoZW4gdGhhdCBoYXBwZW5zLCB0aGUgcGFnZSBwcm90ZWN0aW9uIGNhY2hpbmcgbW9kZS0gYW5k
Cj4+Pj4+PiBlbmNyeXB0aW9uIGJpdHMgbWF5IGNoYW5nZSBhbmQgYmUgZGlmZmVyZW50IGZyb20g
dGhvc2Ugb2YKPj4+Pj4+IHN0cnVjdCB2bV9hcmVhX3N0cnVjdDo6dm1fcGFnZV9wcm90Lgo+Pj4+
Pj4KPj4+Pj4+IFdlIHdlcmUgdXNpbmcgYW4gdWdseSBoYWNrIHRvIHNldCB0aGUgcGFnZSBwcm90
ZWN0aW9uIGNvcnJlY3RseS4KPj4+Pj4+IEZpeCB0aGF0IGFuZCBpbnN0ZWFkIHVzZSB2bWZfaW5z
ZXJ0X21peGVkX3Byb3QoKSBhbmQgLyBvcgo+Pj4+Pj4gdm1mX2luc2VydF9wZm5fcHJvdCgpLgo+
Pj4+Pj4gQWxzbyBnZXQgdGhlIGRlZmF1bHQgcGFnZSBwcm90ZWN0aW9uIGZyb20KPj4+Pj4+IHN0
cnVjdCB2bV9hcmVhX3N0cnVjdDo6dm1fcGFnZV9wcm90IHJhdGhlciB0aGFuIHVzaW5nIHZtX2dl
dF9wYWdlX3Byb3QoKS4KPj4+Pj4+IFRoaXMgd2F5IHdlIGNhdGNoIG1vZGlmaWNhdGlvbnMgZG9u
ZSBieSB0aGUgdm0gc3lzdGVtIGZvciBkcml2ZXJzIHRoYXQKPj4+Pj4+IHdhbnQgd3JpdGUtbm90
aWZpY2F0aW9uLgo+Pj4+PiBTbyBlc3NlbnRpYWxseSB0aGlzIHNob3VsZCBoYXZlIGFueSBuZXcg
c2lkZSBlZmZlY3Qgb24gZnVuY3Rpb25hbGl0eSBpdAo+Pj4+PiBpcyBqdXN0IG1ha2luZyBhIGhh
Y2t5L3VnbHkgY29kZSBsZXNzIHNvPwo+Pj4+IEZ1bmN0aW9uYWxpdHkgaXMgdW5jaGFuZ2VkLiBU
aGUgdXNlIG9mIGEgb24tc3RhY2sgdm1hIGNvcHkgd2FzIHNldmVyZWx5Cj4+Pj4gZnJvd25lZCB1
cG9uIGluIGFuIGVhcmxpZXIgdGhyZWFkLCB3aGljaCBhbHNvIHBvaW50cyB0byBhbm90aGVyIHNp
bWlsYXIKPj4+PiBleGFtcGxlIHVzaW5nIHZtZl9pbnNlcnRfcGZuX3Byb3QoKS4KPj4+Pgo+Pj4+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA5MDUxMDM1NDEuNDE2MS0yLXRob21h
c19vc0BzaGlwbWFpbC5vcmcvCj4+Pj4KPj4+Pj4gSW4gb3RoZXIgd29yZHMgd2hhdCBhcmUgdGhl
Cj4+Pj4+IGNvbnNlcXVlbmNlcyBvZiBoYXZpbmcgcGFnZSBwcm90ZWN0aW9uIGluY29uc2lzdGVu
dCBmcm9tIHZtYSdzPwo+Pj4+IER1cmluZyB0aGUgeWVhcnMsIGl0IGxvb2tzIGxpa2UgdGhlIGNh
Y2hpbmctIGFuZCBlbmNyeXB0aW9uIGZsYWdzIG9mCj4+Pj4gdm1hOjp2bV9wYWdlX3Byb3QgaGF2
ZSBiZWVuIGxhcmdlbHkgcmVtb3ZlZCBmcm9tIHVzYWdlLiBGcm9tIHdoYXQgSSBjYW4KPj4+PiB0
ZWxsLCB0aGVyZSBhcmUgbm8gbW9yZSBwbGFjZXMgbGVmdCB0aGF0IGNhbiBhZmZlY3QgVFRNLiBX
ZSBkaXNjdXNzZWQKPj4+PiBfX3NwbGl0X2h1Z2VfcG1kX2xvY2tlZCgpIHRvd2FyZHMgdGhlIGVu
ZCBvZiB0aGF0IHRocmVhZCwgYnV0IHRoYXQgZG9lc24ndAo+Pj4+IGFmZmVjdCBUVE0gZXZlbiB3
aXRoIGh1Z2UgcGFnZS10YWJsZSBlbnRyaWVzLgo+Pj4gUGxlYXNlIHN0YXRlIGFsbCB0aG9zZSBk
ZXRhaWxzL2Fzc3VtcHRpb25zIHlvdSBhcmUgb3BlcmF0aW5nIG9uIGluIHRoZQo+Pj4gY2hhbmdl
bG9nLgo+PiBUaGFua3MuIEknbGwgdXBkYXRlIHRoZSBwYXRjaHNldCBhbmQgYWRkIHRoYXQuCj4g
QW5kIHRoaW5raW5nIGFib3V0IHRoYXQgdGhpcyBhbHNvIGJlZ3MgZm9yIGEgY29tbWVudCBpbiB0
aGUgY29kZSB0bwo+IGV4cGxhaW4gdGhhdCBzb21lICh3aGljaD8pIG1hcHBpbmdzIG1pZ2h0IGhh
dmUgYSBtaXNtYXRjaCBhbmQgdGhlCj4gZ2VuZXJpYyBjb2RlIGhhdmUgdG8gYmUgY2FyZWZ1bC4g
QmVjYXVzZSBhcyB0aGluZ3Mgc3RhbmQgbm93IHRoaXMgc2VlbXMKPiB0byBiZSByZWFsbHkgc3Vi
dGxlIGFuZCBoYXBwZW4gdG8gd29yayBfbm93XyBhbmQgbWlnaHQgYnJlYWsgaW4gdGhlIGZ1dHVy
ZS4KPiBPciB3aGF0IGRvZXMgcHJldmVudCBhIGdlbmVyaWMgY29kZSB0byBzdHVtYmxlIG92ZXIg
dGhpcyBkaXNjcmVwYW5jeT8KClllcyB3ZSBoYWQgdGhhdCBkaXNjdXNzaW9uIGluIHRoZSB0aHJl
YWQgSSBwb2ludGVkIHRvLiBJIGluaXRpYWxseSAKc3VnZ2VzdGVkIGFuZCBhcmd1ZWQgZm9yIHVw
ZGF0aW5nIHRoZSB2bWE6OnZtX3BhZ2VfcHJvdCB1c2luZyBhIApXUklURV9PTkNFKCkgKHdlIG9u
bHkgaGF2ZSB0aGUgbW1hcF9zZW0gaW4gcmVhZCBtb2RlKSwgdGhlcmUgc2VlbXMgdG8gYmUgCm90
aGVyIHBsYWNlcyBpbiBnZW5lcmljIGNvZGUgdGhhdCBkb2VzIHRoZSBzYW1lLgoKQnV0IEkgd2Fz
IGNvbnZpbmNlZCBieSBBbmR5IHRoYXQgdGhpcyB3YXMgdGhlIHJpZ2h0IHdheSBhbmQgYWxzbyB3
YXMgCnVzZWQgZWxzZXdoZXJlLgoKKFNlZSBhbHNvIApodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC9sYXRlc3Qvc291cmNlL2FyY2gveDg2L2VudHJ5L3Zkc28vdm1hLmMjTDExNikKCkkg
Z3Vlc3MgdG8gaGF2ZSB0aGlzIHByb3Blcmx5IGZvcm11bGF0ZWQsIHdoYXQncyByZXF1aXJlZCBp
cyB0aGF0IApnZW5lcmljIGNvZGUgZG9lc24ndCBidWlsZCBwYWdlLXRhYmxlIGVudHJpZXMgdXNp
bmcgdm1hOjp2bV9wYWdlX3Byb3QgCmZvciBWTV9QRk5NQVAgYW5kIFZNX01JWEVETUFQIG91dHNp
ZGUgb2YgZHJpdmVyIGNvbnRyb2wuCgovVGhvbWFzCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
