Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF671737E6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 14:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7101E6F442;
	Fri, 28 Feb 2020 13:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8B96F442
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 13:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 960713F6E3;
 Fri, 28 Feb 2020 14:08:15 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=jiwAbnKM; 
 dkim-atps=neutral
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
 with ESMTP id WAuvgacn0XQ3; Fri, 28 Feb 2020 14:08:13 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 525103F3E7;
 Fri, 28 Feb 2020 14:08:04 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 8BB36360058;
 Fri, 28 Feb 2020 14:08:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1582895284; bh=9KuDoakzQU3d3CJvJMw+Ur864I+q1jzIXNDtCjFACGo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jiwAbnKM8mzmWh1+InaZhw89xfuYrm0p2buDYfV+mf+oEkZit27tONGBWmFD6zFhA
 /LYVlxqf8DII93sn+0XAzHNSkVtCaEgIE8EOFDOc9cNQGLzIw7vwq0km2nFbHdTdx5
 jGDo/81sGgrdfVlv41cUO5mhodivTGIhQPB2evoU=
Subject: Re: [PATCH v4 0/9] Huge page-table entries for TTM
To: Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>
References: <20200220122719.4302-1-thomas_os@shipmail.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <cc469a2a-e31c-4645-503a-f225fb101899@shipmail.org>
Date: Fri, 28 Feb 2020 14:08:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200220122719.4302-1-thomas_os@shipmail.org>
Content-Language: en-US
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, pv-drivers@vmware.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kcmV3LCBNaWNoYWwKCkknbSB3b25kZXJpbmcgd2hhdCdzIHRoZSBiZXN0IHdheSBoZXJlIHRv
IGdldCB0aGUgcGF0Y2hlcyB0b3VjaGluZyBtbSAKcmV2aWV3ZWQgYW5kIGFjY2VwdGVkPwpXaGls
ZSBkcm0gcGVvcGxlIGFuZCBWTXdhcmUgaW50ZXJuYWwgcGVvcGxlIGhhdmUgbG9va2VkIGF0IHRo
ZW0sIEkgdGhpbmsgCnRoZSBodWdlX2ZhdWx0KCkgZmFsbGJhY2sgc3BsaXR0aW5nIGFuZCB0aGUg
aW50cm9kdWN0aW9uIG9mIAp2bWFfaXNfc3BlY2lhbF9odWdlKCkgbmVlZHMgbG9va2luZyBhdCBt
b3JlIHRob3JvdWdobHkuCgpBcGFydCBmcm9tIHRoYXQsIGlmIHBvc3NpYmxlLCBJIHRoaW5rIHRo
ZSBiZXN0IHdheSB0byBtZXJnZSB0aGlzIHNlcmllcyAKaXMgYWxzbyB0aHJvdWdoIGEgRFJNIHRy
ZWUuCgpUaGFua3MsClRob21hcwoKCk9uIDIvMjAvMjAgMToyNyBQTSwgVGhvbWFzIEhlbGxzdHLD
tm0gKFZNd2FyZSkgd3JvdGU6Cj4gSW4gb3JkZXIgdG8gcmVkdWNlIFRMQiBtaXNzZXMgYW5kIENQ
VSB1c2FnZSB0aGlzIHBhdGNoc2V0IGVuYWJsZXMgaHVnZS0KPiBhbmQgZ2lhbnQgcGFnZS10YWJs
ZSBlbnRyaWVzIGZvciBUVE0gYW5kIFRUTS1lbmFibGVkIGdyYXBoaWNzIGRyaXZlcnMuCj4KPiBQ
YXRjaCAxIGFuZCAyIGludHJvZHVjZSBhIHZtYV9pc19zcGVjaWFsX2h1Z2UoKSBmdW5jdGlvbiB0
byBtYWtlIHRoZSBtbSBjb2RlCj4gdGFrZSB0aGUgc2FtZSBwYXRoIGFzIERBWCB3aGVuIHNwbGl0
dGluZyBodWdlLSBhbmQgZ2lhbnQgcGFnZSB0YWJsZSBlbnRyaWVzLAo+ICh3aGljaCBjdXJyZW50
bHkgbWVhbnMgemFwcGluZyB0aGUgcGFnZS10YWJsZSBlbnRyeSBhbmQgcmVseSBvbiByZS1mYXVs
dGluZykuCj4KPiBQYXRjaCAzIG1ha2VzIHRoZSBtbSBjb2RlIHNwbGl0IGV4aXN0aW5nIGh1Z2Ug
cGFnZS10YWJsZSBlbnRyaWVzCj4gb24gaHVnZV9mYXVsdCBmYWxsYmFja3MuIFR5cGljYWxseSBv
biBDT1cgb3Igb24gYnVmZmVyLW9iamVjdHMgdGhhdCB3YW50Cj4gd3JpdGUtbm90aWZ5LiBDT1cg
YW5kIHdyaXRlLW5vdGlmaWNhdGlvbiBpcyBhbHdheXMgZG9uZSBvbiB0aGUgbG93ZXN0Cj4gcGFn
ZS10YWJsZSBsZXZlbC4gU2VlIHRoZSBwYXRjaCBsb2cgbWVzc2FnZSBmb3IgYWRkaXRpb25hbCBj
b25zaWRlcmF0aW9ucy4KPgo+IFBhdGNoIDQgaW50cm9kdWNlcyBmdW5jdGlvbnMgdG8gYWxsb3cg
dGhlIGdyYXBoaWNzIGRyaXZlcnMgdG8gbWFuaXB1bGF0ZQo+IHRoZSBjYWNoaW5nLSBhbmQgZW5j
cnlwdGlvbiBmbGFncyBvZiBodWdlIHBhZ2UtdGFibGUgZW50cmllcyB3aXRob3V0IHVnbHkKPiBo
YWNrcy4KPgo+IFBhdGNoIDUgaW1wbGVtZW50cyB0aGUgaHVnZV9mYXVsdCBoYW5kbGVyIGluIFRU
TS4KPiBUaGlzIGVuYWJsZXMgaHVnZSBwYWdlLXRhYmxlIGVudHJpZXMsIHByb3ZpZGVkIHRoYXQg
dGhlIGtlcm5lbCBpcyBjb25maWd1cmVkCj4gdG8gc3VwcG9ydCB0cmFuc2h1Z2UgcGFnZXMsIGVp
dGhlciBieSBkZWZhdWx0IG9yIHVzaW5nIG1hZHZpc2UoKS4KPiBIb3dldmVyLCB0aGV5IGFyZSB1
bmxpa2VseSB0byBiZSBpbnNlcnRlZCB1bmxlc3MgdGhlIGtlcm5lbCBidWZmZXIgb2JqZWN0Cj4g
cGZucyBhbmQgdXNlci1zcGFjZSBhZGRyZXNzZXMgYWxpZ24gcGVyZmVjdGx5LiBUaGVyZSBhcmUg
dmFyaW91cyBvcHRpb25zCj4gaGVyZSwgYnV0IHNpbmNlIGJ1ZmZlciBvYmplY3RzIHRoYXQgcmVz
aWRlIGluIHN5c3RlbSBwYWdlcyB0eXBpY2FsbHkgc3RhcnQKPiBhdCBodWdlIHBhZ2UgYm91bmRh
cmllcyBpZiB0aGV5IGFyZSBiYWNrZWQgYnkgaHVnZSBwYWdlcywgd2UgdHJ5IHRvIGVuZm9yY2UK
PiBidWZmZXIgb2JqZWN0IHN0YXJ0aW5nIHBmbnMgYW5kIHVzZXItc3BhY2UgYWRkcmVzc2VzIHRv
IGJlIGh1Z2UgcGFnZS1zaXplCj4gYWxpZ25lZCBpZiB0aGVpciBzaXplIGV4Y2VlZHMgYSBodWdl
IHBhZ2Utc2l6ZS4gSWYgcHVkLXNpemUgdHJhbnNodWdlCj4gKCJnaWFudCIpIHBhZ2VzIGFyZSBl
bmFibGVkIGJ5IHRoZSBhcmNoLCB0aGUgc2FtZSBob2xkcyBmb3IgdGhvc2UuCj4KPiBQYXRjaCA2
IGltcGxlbWVudHMgYSBzcGVjaWFsaXplZCBodWdlX2ZhdWx0IGhhbmRsZXIgZm9yIHZtd2dmeC4K
PiBUaGUgdm13Z2Z4IGRyaXZlciBtYXkgcGVyZm9ybSBkaXJ0eS10cmFja2luZyBhbmQgbmVlZHMg
c29tZSBzcGVjaWFsIGNvZGUKPiB0byBoYW5kbGUgdGhhdCBjb3JyZWN0bHkuCj4KPiBQYXRjaCA3
IGltcGxlbWVudHMgYSBkcm0gaGVscGVyIHRvIGFsaWduIHVzZXItc3BhY2UgYWRkcmVzc2VzIGFj
Y29yZGluZwo+IHRvIHRoZSBhYm92ZSBzY2hlbWUsIGlmIHBvc3NpYmxlLgo+Cj4gUGF0Y2ggOCBp
bXBsZW1lbnRzIGEgVFRNIHJhbmdlIG1hbmFnZXIgZm9yIHZtd2dmeCB0aGF0IGRvZXMgdGhlIHNh
bWUgZm9yCj4gZ3JhcGhpY3MgSU8gbWVtb3J5LiBUaGlzIG1heSBsYXRlciBiZSByZXVzZWQgYnkg
b3RoZXIgZ3JhcGhpY3MgZHJpdmVycwo+IGlmIG5lY2Vzc2FyeS4KPgo+IFBhdGNoIDkgZmluYWxs
eSBob29rcyB1cCB0aGUgaGVscGVycyBvZiBwYXRjaCA3IGFuZCA4IHRvIHRoZSB2bXdnZnggZHJp
dmVyLgo+IEEgc2ltaWxhciBjaGFuZ2UgaXMgbmVlZGVkIGZvciBncmFwaGljcyBkcml2ZXJzIHRo
YXQgd2FudCBhIHJlYXNvbmFibGUKPiBsaWtlbHlob29kIG9mIGFjdHVhbGx5IHVzaW5nIGh1Z2Ug
cGFnZS10YWJsZSBlbnRyaWVzLgo+Cj4gSWYgYSBidWZmZXIgb2JqZWN0IHNpemUgaXMgbm90IGh1
Z2UtcGFnZSBvciBnaWFudC1wYWdlIGFsaWduZWQsCj4gaXRzIHNpemUgd2lsbCBOT1QgYmUgaW5m
bGF0ZWQgYnkgdGhpcyBwYXRjaHNldC4gVGhpcyBtZWFucyB0aGF0IHRoZSBidWZmZXIKPiBvYmpl
Y3QgdGFpbCB3aWxsIHVzZSBzbWFsbGVyIHNpemUgcGFnZS10YWJsZSBlbnRyaWVzIGFuZCB0aHVz
IG5vIG1lbW9yeQo+IG92ZXJoZWFkIG9jY3Vycy4gRHJpdmVycyB0aGF0IHdhbnQgdG8gcGF5IHRo
ZSBtZW1vcnkgb3ZlcmhlYWQgcHJpY2UgbmVlZCB0bwo+IGltcGxlbWVudCB0aGVpciBvd24gc2No
ZW1lIHRvIGluZmxhdGUgYnVmZmVyLW9iamVjdCBzaXplcy4KPgo+IFBNRCBzaXplIGh1Z2UgcGFn
ZS10YWJsZS1lbnRyaWVzIGhhdmUgYmVlbiB0ZXN0ZWQgd2l0aCB2bXdnZnggYW5kIGZvdW5kIHRv
Cj4gd29yayB3ZWxsIGJvdGggd2l0aCBzeXN0ZW0gbWVtb3J5IGJhY2tlZCBhbmQgSU8gbWVtb3J5
IGJhY2tlZCBidWZmZXIgb2JqZWN0cy4KPgo+IFBVRCBzaXplIGdpYW50IHBhZ2UtdGFibGUtZW50
cmllcyBoYXZlIHNlZW4gbGltaXRlZCAoZmF1bHQgYW5kIENPVykgdGVzdGluZwo+IHVzaW5nIGEg
bW9kaWZpZWQga2VybmVsICh0byBzdXBwb3J0IDFHQiBwYWdlIGFsbG9jYXRpb25zKSBhbmQgYSBm
YWtlIHZtd2dmeAo+IFRUTSBtZW1vcnkgdHlwZS4gVGhlIHZtd2dmeCBkcml2ZXIgZG9lcyBvdGhl
cndpc2Ugbm90IHN1cHBvcnQgMUdCLXNpemUgSU8KPiBtZW1vcnkgcmVzb3VyY2VzLgo+Cj4gQ29t
bWVudHMgYW5kIHN1Z2dlc3Rpb25zIHdlbGNvbWUuCj4gVGhvbWFzCj4KPiBDaGFuZ2VzIHNpbmNl
IFJGQzoKPiAqIENoZWNrIGZvciBidWZmZXIgb2JqZWN0cyBwcmVzZW50IGluIGNvbnRpZ291cyBJ
TyBNZW1vcnkgKENocmlzdGlhbiBLw7ZuaWcpCj4gKiBSZWJhc2VkIG9uIHRoZSB2bXdnZnggZW11
bGF0ZWQgY29oZXJlbnQgbWVtb3J5IGZ1bmN0aW9uYWxpdHkuIFRoYXQgcmViYXNlCj4gICAgYWRk
cyBwYXRjaCA1Lgo+IENoYW5nZXMgc2luY2UgdjE6Cj4gKiBNYWtlIHRoZSBuZXcgVFRNIHJhbmdl
IG1hbmFnZXIgdm13Z2Z4LXNwZWNpZmljLiAoQ2hyaXN0aWFuIEvDtm5pZykKPiAqIE1pbm9yIGZp
eGVzIGZvciBjb25maWdzIHRoYXQgZG9uJ3Qgc3VwcG9ydCBvciBvbmx5IHBhcnRpYWxseSBzdXBw
b3J0Cj4gICAgdHJhbnNodWdlIHBhZ2VzLgo+IENoYW5nZXMgc2luY2UgdjI6Cj4gKiBNaW5vciBj
b2Rpbmcgc3R5bGUgYW5kIGRvYyBmaXhlcyBpbiBwYXRjaCA1LzkgKENocmlzdGlhbiBLw7ZuaWcp
Cj4gKiBQYXRjaCA1LzkgZG9lc24ndCB0b3VjaCBtbS4gUmVtb3ZlIGZyb20gdGhlIHBhdGNoIHRp
dGxlLgo+IENoYW5nZXMgc2luY2UgdjM6Cj4gKiBBZGRlZCByZXZpZXdzIGFuZCBhY2tzCj4gKiBJ
bXBsZW1lbnRlZCB1Z2x5IGJ1dCBnZW5lcmljIHR0bV9wZ3Byb3RfaXNfd3Jwcm90ZWN0aW5nKCkg
aW5zdGVhZCBvZiBhcmNoCj4gICAgc3BlY2lmaWMgY29kZS4KPgo+IENjOiBBbmRyZXcgTW9ydG9u
IDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IENjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0Bz
dXNlLmNvbT4KPiBDYzogIk1hdHRoZXcgV2lsY294IChPcmFjbGUpIiA8d2lsbHlAaW5mcmFkZWFk
Lm9yZz4KPiBDYzogIktpcmlsbCBBLiBTaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5p
bnRlbC5jb20+Cj4gQ2M6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KPiBD
YzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiBDYzogIkNocmlzdGlh
biBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhbiBXaWxsaWFtcyA8
ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
