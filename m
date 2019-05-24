Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE87029677
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 12:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7AC6E0E1;
	Fri, 24 May 2019 10:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FAF6E0E1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 10:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id C2E603F3EA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 12:56:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.099
X-Spam-Level: 
X-Spam-Status: No, score=-3.099 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6WXERF-w92Yb for <dri-devel@lists.freedesktop.org>;
 Fri, 24 May 2019 12:56:45 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id F2B793F35D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 12:56:44 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id C359C3600B5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 12:56:44 +0200 (CEST)
Subject: Re: [PATCH 3/5] drm/vmwgfx: use core drm to extend/check
 vmw_execbuf_ioctl
To: dri-devel@lists.freedesktop.org
References: <20190522164119.24139-1-emil.l.velikov@gmail.com>
 <20190522164119.24139-3-emil.l.velikov@gmail.com>
 <6c2d4e6c1554e59bfcf1b58fdc42c54bbe59b4c0.camel@vmware.com>
 <CAKMK7uH1=r=2pO-KbNUDw2dSmgATMUZchQo-8u1EoFb9d_YKHQ@mail.gmail.com>
 <2bb52a5a9d0ed61e79d6f93573fde98f9bec7365.camel@vmware.com>
 <CAKMK7uFeLV5eP3r6bjqaOYV-MTdHuA64CmCk6YXM3-_OfnaOPg@mail.gmail.com>
 <20190524105313.GA6233@arch-x1c3>
From: Thomas Hellstrom <thomas@shipmail.org>
Message-ID: <c8895fa1-2ea0-b02f-16e0-c26790cdfc75@shipmail.org>
Date: Fri, 24 May 2019 12:56:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524105313.GA6233@arch-x1c3>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1558695404; bh=5b/vsyPvYXQmbgzSW6BHyT39/++lAYhSdV6F5HLs1+M=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=C9CaYVpbbDB+Mkj/KJgPVh1mQwFBlxmxPwB2zBEa7LA/2cVnOiJeH5a7zzLA9U3yV
 LdDm75lFQ3kDRhdEVD0uky6swCIDDB7wXI54xsYh3rrGwMLMoPzM/gw1n6D0s5px51
 i2n2B3DKtciSvVG3ruFLdldbOxbWVN4ZDKtmmjNU=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=C9CaYVpb; 
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8yNC8xOSAxMjo1MyBQTSwgRW1pbCBWZWxpa292IHdyb3RlOgo+IE9uIDIwMTkvMDUvMjQs
IERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+IE9uIEZyaSwgTWF5IDI0LCAyMDE5IGF0IDg6MDUgQU0g
VGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPiB3cm90ZToKPj4+IE9uIFdl
ZCwgMjAxOS0wNS0yMiBhdCAyMTowOSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+PiBP
biBXZWQsIE1heSAyMiwgMjAxOSBhdCA5OjAxIFBNIFRob21hcyBIZWxsc3Ryb20gPAo+Pj4+IHRo
ZWxsc3Ryb21Adm13YXJlLmNvbT4gd3JvdGU6Cj4+Pj4+IEhpLCBFbWlsLAo+Pj4+Pgo+Pj4+PiBP
biBXZWQsIDIwMTktMDUtMjIgYXQgMTc6NDEgKzAxMDAsIEVtaWwgVmVsaWtvdiB3cm90ZToKPj4+
Pj4+IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4+Pj4+
Pgo+Pj4+Pj4gQ3VycmVudGx5IHZtd19leGVjYnVmX2lvY3RsKCkgb3Blbi1jb2RlcyB0aGUgcGVy
bWlzc2lvbiBjaGVja2luZywKPj4+Pj4+IHNpemUKPj4+Pj4+IGV4dGVuZGluZyBhbmQgY29weWlu
ZyB0aGF0IGlzIGFscmVhZHkgZG9uZSBpbiBjb3JlIGRybS4KPj4+Pj4+Cj4+Pj4+PiBLaWxsIGFs
bCB0aGUgZHVwbGljYXRpb24sIGFkZGluZyBhIGZldyBjb21tZW50cyBmb3IgY2xhcml0eS4KPj4+
Pj4gQWgsIHRoZXJlIGlzIGNvcmUgZnVuY3Rpb25hbGl0eSBmb3IgdGhpcyBub3cuCj4+Pj4+Cj4+
Pj4+IFdoYXQgd29ycmllcyBtZSB0aG91Z2ggd2l0aCB0aGUgY29yZSBhcHByb2FjaCBpcyB0aGF0
IHRoZSBzaXplcyBhcmUKPj4+Pj4gbm90Cj4+Pj4+IGNhcHBlZCBieSB0aGUgc2l6ZSBvZiB0aGUg
a2VybmVsIGFyZ3VtZW50IGRlZmluaXRpb24sIHdoaWNoIG1ha2VzCj4+Pj4+IG1haWxpY2lvdXMg
dXNlci1zcGFjZSBiZWluZyBhYmxlIHRvIGZvcmNlIGttYWxsb2NzKCkgdGhlIHNpemUgb2YKPj4+
Pj4gdGhlCj4+Pj4+IG1heGltdW0gaW9jdGwgc2l6ZS4gU2hvdWxkIHByb2JhYmx5IGJlIGZpeGVk
IGJlZm9yZSBwdXNoaW5nIHRoaXMuCj4+Pj4gSG0gSSBhbHdheXMgd29ya2VkIHVuZGVyIHRoZSBh
c3N1bXB0aW9uIHRoYXQga21hbGxvYyBhbmQgZnJpZW5kcwo+Pj4+IHNob3VsZCBiZSB1c2Vyc3Bh
Y2UgaGFyZGVuZWQuIE90aGVyd2lzZSBzdHVmZiBsaWtlIGttYWxsb2NfYXJyYXkKPj4+PiBkb2Vz
bid0IG1ha2UgYW55IHNlbnNlLCBldmVyeW9uZSBqdXN0IGZlZWRzIGl0IHVuY2hlY2tlZCBpbnB1
dCBhbmQKPj4+PiBleHBlY3RzIHRoYXQgaGVscGVyIHRvIGhhbmRsZSBvdmVyZmxvd3MuCj4+Pj4K
Pj4+PiBJZiB3ZSBhc3N1bWUga21hbGxvYyBpc24ndCBoYXJkZW5lZCBhZ2FpbnN0IHRoYXQsIHRo
ZW4gd2UgaGF2ZSBhIG11Y2gKPj4+PiBiaWdnZXIgcHJvYmxlbSB0aGFuIGp1c3Qgdm13Z2Z4IGlv
Y3RscyAuLi4KPj4+IEFmdGVyIGNoZWNraW5nIHRoZSBkcm1faW9jdGwgY29kZSBJIHJlYWxpemUg
dGhhdCB3aGF0IEkgdGhvdWdodCB3YXMgbmV3Cj4+PiBiZWhhdmlvdXIgYWN0dWFsbHkgaGFzIGJl
ZW4gYXJvdW5kIGZvciBhIGNvdXBsZSBvZiB5ZWFycywgc28KPj4+IGZpeGluZyBpc24ndCByZWFs
bHkgdGllZCB0byB0aGlzIHBhdGNoIHNlcmllcy4uLgo+Pj4KPj4+IFdoYXQgY2F1c2VkIG1lIHRv
IHJlYWN0IHdhcyB0aGF0IHByZXZpb3VzbHkgd2UgdXNlZCB0byBoYXZlIHRoaXMKPj4+Cj4+PiBl
NGZkYTlmMjY0ZTEgKCJkcm06IFBlcmZvcm0gaW9jdGwgY29tbWFuZCB2YWxpZGF0aW9uIG9uIHRo
ZSBzdG9yZWQKPj4+IGtlcm5lbCB2YWx1ZXMiKQo+Pj4KPj4+IGFuZCB3ZSBzZWVtIHRvIGhhdmUg
bG9zdCB0aGF0IG5vdywgaWYgbm90IGZvciB0aGUgaW8gZmxhZ3MgdGhlbiBhdAo+Pj4gbGVhc3Qg
Zm9yIHRoZSBzaXplIHBhcnQuIEZvciB0aGUgc2l6ZSBvZiB0aGUgaW9jdGwgYXJndW1lbnRzLCBJ
IHRoaW5rCj4+PiBpbiBnZW5lcmFsIGlmIHRoZSBrZXJuZWwgb25seSB0b3VjaGVzIGEgc3Vic2V0
IG9mIHRoZSB1c2VyLXNwYWNlCj4+PiBzcGVjaWZpZWQgc2l6ZSBJIHNlZSBubyByZWFzb24gd2h5
IHdlIHNob3VsZCBtYWxsb2MgLyBjb3B5IG1vcmUgdGhhbgo+Pj4gdGhhdD8KPj4gSSBndWVzcyB3
ZSBjb3VsZCBvcHRpbWl6ZSB0aGF0LCBidXQgd2UnZCBwcm9iYWJseSBzdGlsbCBuZWVkIHRvIHpl
cm8KPj4gY2xlYXIgdGhlIGFkZGVkIHNpemUgZm9yIGZvcndhcmQgY29tcGF0IHdpdGggbmV3ZXIg
dXNlcnNwYWNlLiBJaXJjCj4+IHdlJ3ZlIGhhZCBzb21lIGlzc3VlcyBpbiB0aGlzIGFyZWEuCj4+
Cj4+PiBOb3csIGdpdmVuIHRoZSBmYWN0IHRoYXQgdGhlIG1heGltdW0gaW9jdGwgYXJndW1lbnQg
c2l6ZSBpcyBxdWl0ZQo+Pj4gbGltaXRlZCwgdGhhdCBtaWdodCBub3QgYmUgYSBiaWcgcHJvYmxl
bSBvciBhIHByb2JsZW0gYXQgYWxsLiBPdGhlcndpc2UKPj4+IGl0IHdvdWxkIGJlIHByZXR0eSBl
YXN5IGZvciBhIG1hbGljaW91cyBwcm9jZXNzIHRvIGFsbG9jYXRlIG1vc3Qgb3IgYWxsCj4+PiBv
ZiBhIHN5c3RlbSdzIHJlc2lkZW50IG1lbW9yeT8KPj4gVGhlIGJpZ2dlc3QgeW91IGNhbiBhbGxv
Y2F0ZSBmcm9tIGttYWxsb2MgaXMgbGltaXRlZCBieSB0aGUgbGFyZ2VzdAo+PiBjb250aWd1b3Vz
IGNodW5rIGFsbG9jX3BhZ2VzIGdpdmVzIHlvdSwgd2hpY2ggaXMgbGltaXRlZCBieSBNQVhfT1JE
RVIKPj4gZnJvbSB0aGUgcGFnZSBidWRkeSBhbGxvY2F0b3IuIFlvdSBuZWVkIGxvdHMgb2YgcHJv
Y2VzcyB0byBiZSBhYmxlIHRvCj4+IGV4aGF1c3QgbWVtb3J5IGxpa2UgdGhhdCAoYW5kIGxpa2Ug
SSBzYWlkLCB0aGUgZW50aXJlIGtlcm5lbCB3b3VsZCBiZQo+PiBicm9rZW4gaWYgd2UnZCBjb25z
aWRlciB0aGlzIGEgc2VjdXJpdHkgaXNzdWUpLiBJZiB5b3Ugd2FudCB0byBtYWtlCj4+IHN1cmUg
dGhhdCBhIHByb2Nlc3MgZ3JvdXAgY2FuJ3QgZXhoYXVzdCBtZW1vcnkgdGhpcyB3YXkgdGhlbiB5
b3UgbmVlZAo+PiB0byBzZXQgYXBwcm9wcmlhdGUgY2dyb3VwcyBsaW1pdHMuCj4gSSBkbyBhZ3Jl
ZSB3aXRoIGFsbCB0aGUgc2VudGltZW50cyB0aGF0IGRybV9pb2N0bCgpIGNvdWxkIHVzZSBzb21l
IGV4dHJhCj4gb3B0aW1pc2F0aW9uIGFuZCBoYXJkZW5pbmcuIEF0IHRoZSBzYW1lIHRpbWUgSSB3
b3VsZCByZW1pbmQgdGhhdCB0aGUKPiBjb2RlIGhhcyBiZWVuIHVzZWQgYXMtaXMgYnkgdm13Z2Z4
IGFuZCBvdGhlciBkcml2ZXJzIGZvciB5ZWFycy4KPgo+IEluIG90aGVyIHdvcmRzOiBsZXQncyBr
ZWVwIHRoYXQgd29yayBhcyBvcnRob2dvbmFsIHNlcmllcy4KPgo+IFdoYXQgZG8geW91IGd1eXMg
dGhpbms/CgpJIGFncmVlLiBUaGVuIEkgb25seSBoYWQgYSBjb25jZXJuIHdpdGggb25lIG9mIHRo
ZSBwYXRjaGVzLgoKL1Rob21hcwoKCj4gRW1pbAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
