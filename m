Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07672312AC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409736E3A2;
	Tue, 28 Jul 2020 19:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Tue, 28 Jul 2020 17:13:37 UTC
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4866E130
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 17:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595956417;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=NhQlpfgEzw5uIL26d7//uQgtQ8+lTO6nNMY87duUokQ=;
 b=ItxK7iUcqVNi0QDTDK7aahuyM2skzKNHSisegkcmyliL2G8LB7QeU4Xn
 xn+UhpfzaDzTvu9Q93X3Wo7sq7ypxyPKGXTABRZm1pXTTWH2ytVqyX4TO
 G0CzT6RiJOWexUfUGbmJpK0weVWu4GasvmecPxfSnsAobtUDED8nRSCOh 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Zv07BbGuPhsiZuK1RAL+MXQS7+DkALPbSOLVSZU6zFhcWsNovWd2ezPA0u0r1ydAx+ftO+5rIq
 NYZIB7Ir83eaSN5NLUnEQUwpkSM93rbTHf5FdDjDIWKAeHW5XlIoRUumb0e9wguAvIvp4K7b+H
 wj1PKHL59HxgJHNABW9nSYRmjho8ubni3kkx1ZFgHlasMw2iQH4TLZsXntv6C0nojnpI0osC1H
 P4GfMlvA6ODgHDaodR3qUiDDbVxaEHvhgheUl2K9TujfOtvBGncUzSfPj+3oWbSEcATqj0RXdv
 ExM=
X-SBRS: 2.7
X-MesageID: 23700460
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23700460"
Subject: Re: [PATCH v3 4/4] xen: add helpers to allocate unpopulated memory
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Julien Grall
 <julien@xen.org>
References: <20200727091342.52325-1-roger.pau@citrix.com>
 <20200727091342.52325-5-roger.pau@citrix.com>
 <b5460659-88a5-c2aa-c339-815d5618bcb5@xen.org>
 <20200728165919.GA7191@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cb1790b3-2ad0-2c1b-a632-e4fea4b6bcfa@citrix.com>
Date: Tue, 28 Jul 2020 18:06:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728165919.GA7191@Air-de-Roger>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan
 Yankovskyi <yyankovskyi@gmail.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Michal
 Hocko <mhocko@kernel.org>, linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjgvMDcvMjAyMCAxNzo1OSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEp1
bCAyOCwgMjAyMCBhdCAwNTo0ODoyM1BNICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhp
LAo+Pgo+PiBPbiAyNy8wNy8yMDIwIDEwOjEzLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+PiBU
byBiZSB1c2VkIGluIG9yZGVyIHRvIGNyZWF0ZSBmb3JlaWduIG1hcHBpbmdzLiBUaGlzIGlzIGJh
c2VkIG9uIHRoZQo+Pj4gWk9ORV9ERVZJQ0UgZmFjaWxpdHkgd2hpY2ggaXMgdXNlZCBieSBwZXJz
aXN0ZW50IG1lbW9yeSBkZXZpY2VzIGluCj4+PiBvcmRlciB0byBjcmVhdGUgc3RydWN0IHBhZ2Vz
IGFuZCBrZXJuZWwgdmlydHVhbCBtYXBwaW5ncyBmb3IgdGhlIElPTUVNCj4+PiBhcmVhcyBvZiBz
dWNoIGRldmljZXMuIE5vdGUgdGhhdCBvbiBrZXJuZWxzIHdpdGhvdXQgc3VwcG9ydCBmb3IKPj4+
IFpPTkVfREVWSUNFIFhlbiB3aWxsIGZhbGxiYWNrIHRvIHVzZSBiYWxsb29uZWQgcGFnZXMgaW4g
b3JkZXIgdG8KPj4+IGNyZWF0ZSBmb3JlaWduIG1hcHBpbmdzLgo+Pj4KPj4+IFRoZSBuZXdseSBh
ZGRlZCBoZWxwZXJzIHVzZSB0aGUgc2FtZSBwYXJhbWV0ZXJzIGFzIHRoZSBleGlzdGluZwo+Pj4g
e2FsbG9jL2ZyZWV9X3hlbmJhbGxvb25lZF9wYWdlcyBmdW5jdGlvbnMsIHdoaWNoIGFsbG93cyBm
b3IgaW4tcGxhY2UKPj4+IHJlcGxhY2VtZW50IG9mIHRoZSBjYWxsZXJzLiBPbmNlIGEgbWVtb3J5
IHJlZ2lvbiBoYXMgYmVlbiBhZGRlZCB0byBiZQo+Pj4gdXNlZCBhcyBzY3JhdGNoIG1hcHBpbmcg
c3BhY2UgaXQgd2lsbCBubyBsb25nZXIgYmUgcmVsZWFzZWQsIGFuZCBwYWdlcwo+Pj4gcmV0dXJu
ZWQgYXJlIGtlcHQgaW4gYSBsaW5rZWQgbGlzdC4gVGhpcyBhbGxvd3MgdG8gaGF2ZSBhIGJ1ZmZl
ciBvZgo+Pj4gcGFnZXMgYW5kIHByZXZlbnRzIHJlc29ydGluZyB0byBmcmVxdWVudCBhZGRpdGlv
bnMgYW5kIHJlbW92YWxzIG9mCj4+PiByZWdpb25zLgo+Pj4KPj4+IElmIGVuYWJsZWQgKGJlY2F1
c2UgWk9ORV9ERVZJQ0UgaXMgc3VwcG9ydGVkKSB0aGUgdXNhZ2Ugb2YgdGhlIG5ldwo+Pj4gZnVu
Y3Rpb25hbGl0eSB1bnRhbmdsZXMgWGVuIGJhbGxvb24gYW5kIFJBTSBob3RwbHVnIGZyb20gdGhl
IHVzYWdlIG9mCj4+PiB1bnBvcHVsYXRlZCBwaHlzaWNhbCBtZW1vcnkgcmFuZ2VzIHRvIG1hcCBm
b3JlaWduIHBhZ2VzLCB3aGljaCBpcyB0aGUKPj4+IGNvcnJlY3QgdGhpbmcgdG8gZG8gaW4gb3Jk
ZXIgdG8gYXZvaWQgbWFwcGluZ3Mgb2YgZm9yZWlnbiBwYWdlcyBkZXBlbmQKPj4+IG9uIG1lbW9y
eSBob3RwbHVnLgo+PiBJIHRoaW5rIHRoaXMgaXMgZ29pbmcgdG8gYnJlYWsgRG9tMCBvbiBBcm0g
aWYgdGhlIGtlcm5lbCBoYXMgYmVlbiBidWlsdCB3aXRoCj4+IGhvdHBsdWcuIFRoaXMgaXMgYmVj
YXVzZSB5b3UgbWF5IGVuZCB1cCB0byByZS11c2UgcmVnaW9uIHRoYXQgd2lsbCBiZSB1c2VkCj4+
IGZvciB0aGUgMToxIG1hcHBpbmcgb2YgYSBmb3JlaWduIG1hcC4KPj4KPj4gTm90ZSB0aGF0IEkg
ZG9uJ3Qga25vdyB3aGV0aGVyIGhvdHBsdWcgaGFzIGJlZW4gdGVzdGVkIG9uIFhlbiBvbiBBcm0g
eWV0LiBTbwo+PiBpdCBtaWdodCBiZSBwb3NzaWJsZSB0byBiZSBhbHJlYWR5IGJyb2tlbi4KPj4K
Pj4gTWVhbndoaWxlLCBteSBzdWdnZXN0aW9uIHdvdWxkIGJlIHRvIG1ha2UgdGhlIHVzZSBvZiBo
b3RwbHVnIGluIHRoZSBiYWxsb29uCj4+IGNvZGUgY29uZGl0aW9uYWwgKG1heWJlIHVzaW5nIENP
TkZJR19BUk02NCBhbmQgQ09ORklHX0FSTSk/Cj4gUmlnaHQsIHRoaXMgZmVhdHVyZSAoYWxsb2Nh
dGlvbiBvZiB1bnBvcHVsYXRlZCBtZW1vcnkgc2VwYXJhdGVkIGZyb20KPiB0aGUgYmFsbG9vbiBk
cml2ZXIpIGlzIGN1cnJlbnRseSBnYXRlZCBvbiBDT05GSUdfWk9ORV9ERVZJQ0UsIHdoaWNoIEkK
PiB0aGluayBjb3VsZCBiZSB1c2VkIG9uIEFybS4KPgo+IElNTyB0aGUgcmlnaHQgc29sdXRpb24g
c2VlbXMgdG8gYmUgdG8gc3VidHJhY3QgdGhlIHBoeXNpY2FsIG1lbW9yeQo+IHJlZ2lvbnMgdGhh
dCBjYW4gYmUgdXNlZCBmb3IgdGhlIGlkZW50aXR5IG1hcHBpbmdzIG9mIGZvcmVpZ24gcGFnZXMK
PiAoYWxsIFJBTSBvbiB0aGUgc3lzdGVtIEFGQUlDVCkgZnJvbSBpb21lbV9yZXNvdXJjZSwgYXMg
dGhhdCB3b3VsZCBtYWtlCj4gdGhpcyBhbmQgdGhlIG1lbW9yeSBob3RwbHVnIGRvbmUgaW4gdGhl
IGJhbGxvb24gZHJpdmVyIHNhZmU/CgpUaGUgcmlnaHQgc29sdXRpb24gaXMgYSBtZWNoYW5pc20g
Zm9yIHRyYW5zbGF0ZWQgZ3Vlc3RzIHRvIHF1ZXJ5IFhlbiB0bwpmaW5kIHJlZ2lvbnMgb2YgZ3Vl
c3QgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSB3aGljaCBhcmUgdW51c2VkLCBhbmQgY2FuCmJlIHNh
ZmVseSBiZSB1c2VkIGZvciBmb3JlaWduL2dyYW50L290aGVywqAgbWFwcGluZ3MuCgpQbGVhc2Ug
ZG9uJ3Qgd2FzdGUgYW55IG1vcmUgdGltZSBhcHBseWluZyBtb3JlIGR1Y3QgdGFwZSB0byBhIGJy
b2tlbgpzeXN0ZW0sIGFuZCBpbnN0ZWFkIHNwZW5kIHRoZSB0aW1lIG9yZ2FuaXNpbmcgc29tZSBw
cm9wZXIgZm91bmRhdGlvbnMuCgp+QW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
