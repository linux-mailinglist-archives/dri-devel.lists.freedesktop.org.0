Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DF64A39B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 16:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C833D6E1BD;
	Tue, 18 Jun 2019 14:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD27B6E1BD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 14:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 05D2E3F53E;
 Tue, 18 Jun 2019 16:14:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.099
X-Spam-Level: 
X-Spam-Status: No, score=-3.099 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vaxay3a2GfPG; Tue, 18 Jun 2019 16:14:28 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 145DF3F4F6;
 Tue, 18 Jun 2019 16:14:27 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A7BAC360195;
 Tue, 18 Jun 2019 16:14:27 +0200 (CEST)
Subject: Re: [PATCH 1/4] drm/vmwgfx: Assign eviction priorities to resources
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190618062442.14647-1-thomas@shipmail.org>
 <20190618105408.GB29642@arch-x1c3>
 <20190618121950.GW12905@phenom.ffwll.local>
 <a9b1154c-448d-65f2-7e74-a942933562dc@shipmail.org>
 <20190618132718.GX12905@phenom.ffwll.local>
From: Thomas Hellstrom <thomas@shipmail.org>
Message-ID: <75a1a9de-8bc4-6e33-9f85-66a637e6ef91@shipmail.org>
Date: Tue, 18 Jun 2019 16:14:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190618132718.GX12905@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1560867267; bh=6l4kIhmaMgTWHyOqaGUEbv4pKdsvyonz5M9yJ2GU6po=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HIXz3iS6J6Zo6CEjbS1wthHJcutKzl9ql0MTMvrCFRBCBUnFPT4G44PeIa7MD94xt
 U+HKuJauMY9j7WE3HN4TJmW9Yo5oiJs0Q/hH5nmFd3IuNtM5H48vIGwSHmEQnMzLuM
 lkdPmwVhzyIPsKfxeU8A7du8Fkt43ZEEaeQis2ds=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=HIXz3iS6; 
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
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com, Deepak Rawat <drawat@vmware.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xOC8xOSAzOjI3IFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDE4
LCAyMDE5IGF0IDAzOjA4OjAxUE0gKzAyMDAsIFRob21hcyBIZWxsc3Ryb20gd3JvdGU6Cj4+IE9u
IDYvMTgvMTkgMjoxOSBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+IE9uIFR1ZSwgSnVuIDE4
LCAyMDE5IGF0IDExOjU0OjA4QU0gKzAxMDAsIEVtaWwgVmVsaWtvdiB3cm90ZToKPj4+PiBIaSBU
aG9tYXMsCj4+Pj4KPj4+PiBPbiAyMDE5LzA2LzE4LCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJl
KSB3cm90ZToKPj4+Pj4gRnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUu
Y29tPgo+Pj4+Pgo+Pj4+PiBUVE0gcHJvdmlkZXMgYSBtZWFucyB0byBhc3NpZ24gZXZpY3Rpb24g
cHJpb3JpdGllcyB0byBidWZmZXIgb2JqZWN0LiBUaGlzCj4+Pj4+IG1lYW5zIHRoYXQgYWxsIGJ1
ZmZlciBvYmplY3RzIHdpdGggYSBsb3dlciBwcmlvcml0eSB3aWxsIGJlIGV2aWN0ZWQgZmlyc3QK
Pj4+Pj4gb24gbWVtb3J5IHByZXNzdXJlLgo+Pj4+PiBVc2UgdGhpcyB0byBtYWtlIHN1cmUgc3Vy
ZmFjZXMgYW5kIGluIHBhcnRpY3VsYXIgbm9uLWRpcnR5IHN1cmZhY2VzIGFyZQo+Pj4+PiBldmlj
dGVkIGZpcnN0LiBFdmljdGluZyBpbiBwYXJ0aWN1bGFyIHNoYWRlcnMsIGNvdGFibGVzIGFuZCBj
b250ZXh0cyBpbXBseQo+Pj4+PiBhIHNpZ25pZmljYW50IHBlcmZvcm1hbmNlIGhpdCBvbiB2bXdn
ZngsIHNvIG1ha2Ugc3VyZSB0aGVzZSByZXNvdXJjZXMgYXJlCj4+Pj4+IGV2aWN0ZWQgbGFzdC4K
Pj4+Pj4gU29tZSBidWZmZXIgb2JqZWN0cyBhcmUgc3ViLWFsbG9jYXRlZCBpbiB1c2VyLXNwYWNl
IHdoaWNoIG1lYW5zIHdlIGNhbiBoYXZlCj4+Pj4+IG1hbnkgcmVzb3VyY2VzIGF0dGFjaGVkIHRv
IGEgc2luZ2xlIGJ1ZmZlciBvYmplY3Qgb3IgcmVzb3VyY2UuIEluIHRoYXQgY2FzZQo+Pj4+PiB0
aGUgYnVmZmVyIG9iamVjdCBpcyBnaXZlbiB0aGUgaGlnaGVzdCBwcmlvcml0eSBvZiB0aGUgYXR0
YWNoZWQgcmVzb3VyY2VzLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0
cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4+Pj4+IFJldmlld2VkLWJ5OiBEZWVwYWsgUmF3
YXQgPGRyYXdhdEB2bXdhcmUuY29tPgo+Pj4+IEZ3aXcgcGF0Y2hlcyAxLTMgYXJlOgo+Pj4+IFJl
dmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+Pj4+
Cj4+Pj4gUGF0Y2ggNCBpczoKPj4+PiBBY2tlZC1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlr
b3ZAY29sbGFib3JhLmNvbT4KPj4+Pgo+Pj4+IEh1Z2UgdGhhbmtzIGZvciBzb3J0aW5nIHRoaXMg
b3V0Lgo+Pj4gT2gsIGRvZXMgdGhpcyBtZWFuIHdlIGNhbiByZW1vdmUgdGhlIHZhcmlvcyBtYXN0
ZXIqIGNhbGxiYWNrcyBmcm9tCj4+PiBkcm1fZHJpdmVyIG5vdz8gSWlyYyB2bXdnZnggd2FzIHRo
ZSBvbmx5IHVzZXIsIGFuZCB0aG9zZSBjYWxsYmFja3Mgc2VlbQo+Pj4gdmVyeSB0ZW1wdGluZyB0
byB2YXJpb3VzIGZvbGtzIGZvciBpbXBsZW1lbnRpbmcgcXVlc3Rpb25hYmxlIGRyaXZlciBoYWNr
cwo+Pj4gLi4uIEhhcHB5IHRvIHR5cGUgdGhlIHBhdGNoZXMsIGJ1dCBtYXliZSBzaW1wbGVyIGlm
IHlvdSBkbyB0aGF0IHNpbmNlIGFsbAo+Pj4gdGhpcyBnZXRzIG1lcmdlZCB0aHJvdWdoIHRoZSB2
bXdnZnggdHJlZS4KPj4+Cj4+PiBDaGVlcnMsIERhbmllbAo+PiBJbiBjYXNlIHNvbWVvbmUgZm9s
bG93IHRoaXMsIEknbGwgcGFzdGUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIG9mIDQvNCB3aGljaAo+
PiBpcyB0aGUgcmVsZXZhbnQgb25lIGhlcmUuLgo+Pgo+PiA4PC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Cj4+IEF0IG9uZSBwb2ludCwgdGhlIEdQVSBjb21t
YW5kIHZlcmlmaWVyIGFuZCB1c2VyLXNwYWNlIGhhbmRsZSBtYW5hZ2VyCj4+IGNvdWxkbid0IHBy
b3Blcmx5IHByb3RlY3QgR1BVIGNsaWVudHMgZnJvbSBhY2Nlc3NpbmcgZWFjaCBvdGhlcidzIGRh
dGEuCj4+IEluc3RlYWQgdGhlcmUgd2FzIGFuIGVsYWJvcmF0ZSBtZWNoYW5pc20gdG8gbWFrZSBz
dXJlIG9ubHkgdGhlIGFjdGl2ZQo+PiBtYXN0ZXIncyBwcmltYXJ5IGNsaWVudHMgY291bGQgcmVu
ZGVyLiBUaGUgb3RoZXIgY2xpZW50cyB3ZXJlIGVpdGhlcgo+PiBwdXQgdG8gc2xlZXAgb3IgZXZl
biBraWxsZWQgKGlmIHRoZSBtYXN0ZXIgaGFkIGV4aXRlZCkuIFZSQU0gd2FzCj4+IGV2aWN0ZWQg
b24gbWFzdGVyIHN3aXRjaC4gV2l0aCB0aGUgYWR2ZW50IG9mIHJlbmRlci1ub2RlIGZ1bmN0aW9u
YWxpdHksCj4+IHdlIHJlbGF4ZWQgdGhlIFZSQU0gZXZpY3Rpb24sIGJ1dCB0aGUgb3RoZXIgbWVj
aGFuaXNtcyBzdGF5ZWQgaW4gcGxhY2UuCj4+Cj4+IE5vdyB0aGF0IHRoZSBHUFUgIGNvbW1hbmQg
dmVyaWZpZXIgYW5kIHR0bSBvYmplY3QgbWFuYWdlciBwcm9wZXJseQo+PiBpc29sYXRlcyBwcmlt
YXJ5IGNsaWVudHMgZnJvbSBkaWZmZXJlbnQgbWFzdGVyIHJlYWxtcyB3ZSBjYW4gcmVtb3ZlIHRo
ZQo+PiBtYXN0ZXIgc3dpdGNoIHJlbGF0ZWQgY29kZSBhbmQgZHJvcCB0aG9zZSBsZWdhY3kgZmVh
dHVyZXMuCj4+Cj4+IDg8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+Pgo+PiBJIHRoaW5rIHdlIGNhbiBhdCBsZWFzdCB0YWtlIGEgbG9vay4gSSdtIG91dCBvbiBh
IGZhaXJseSBsb25nIHZhY2F0aW9uIHNvb24KPj4gc28gaW4gYW55IGNhc2UgaXQgd29uJ3QgYmUg
YmVmb3JlIEF1Z3VzdCBvciBzby4KPiBBaCBkb24ndCB3b3JyeSwgaWYgdGhpcyBhbGwgbGFuZHMg
aW4gdGhlIDUuMyBtZXJnZSB3aW5kb3cgSSBjYW4gdGFrZSBhCj4gbG9vayBpbiBhIGZldyB3ZWVr
cy4KPgo+PiBPbmUgdXNlIHdlIHN0aWxsIGhhdmUgZm9yIG1hc3Rlcl9zZXQoKSBpcyB0aGF0IGlm
IGEgbWFzdGVyIGlzIHN3aXRjaGVkIGF3YXksCj4+IGFuZCB0aGVuIHRoZSBtb2RlIGxpc3QgY2hh
bmdlcywgYW5kIHRoZW4gdGhlIG1hc3RlciBpcyBzd2l0Y2hlZCBiYWNrLCBpdAo+PiB3aWxsIHR5
cGljYWxseSBub3QgcmVtZW1iZXIgdG8gYWN0IG9uIHRoZSBzeXNmcyBldmVudCByZWNlaXZlZCB3
aGlsZQo+PiBzd2l0Y2hlZCBvdXQsIGFuZCBjb21lIGJhY2sgaW4gYW4gaW5jb3JyZWN0IG1vZGUu
IFNpbmNlIG1vZGUtbGlzdCBjaGFuZ2VzCj4+IGhhcHBlbiBxdWl0ZSBmcmVxdWVudGx5IHdpdGgg
dmlydHVhbCBkaXNwbGF5IGFkYXB0ZXJzIHRoYXQncyBiYWQuCj4+Cj4+IEJ1dCBwZXJoYXBzIHdl
IGNhbiBjb25zaWRlciBtb3ZpbmcgdGhhdCB0byBjb3JlLCBpZiB0aGF0J3Mgd2hhdCBuZWVkZWQg
dG8KPj4gZ2V0IHJpZCBvZiB0aGUgbWFzdGVyIHN3aXRjaCBjYWxsYmFja3MuCj4gSG0sIHRoaXMg
c291bmRzIGEgYml0IGxpa2UgcGFwZXJpbmcgb3ZlciB1c2Vyc3BhY2UgYnVncywgYXQgbGVhc3Qg
aWYKPiB5b3UncmUgcmVmZXJyaW5nIHRvIGRybV9zeXNmc19ob3RwbHVnX2V2ZW50KCkuIFVzZXJz
cGFjZSBpcyBzdXBwb3NlZCB0bwo+IGVpdGhlciBrZWVwIGxpc3RlbmluZyBvciB0byByZS1hY3F1
aXJlIGFsbCB0aGUga21zIG91dHB1dCBzdGF0ZSBhbmQgZG8gdGhlCj4gaG90cGx1Z2cgcHJvY2Vz
c2luZyBpbiBvbmUgZ28gd2hlbiBiZWNvbWluZyBhY3RpdmUgYWdhaW4uCj4KPiBPZmMgaXQgZXhp
c3RzLCBzbyB3ZSBjYW4ndCBqdXN0IHJlbW92ZSBpdC4gSSB3b3VsZG4ndCB3YW50IHRvIG1ha2Ug
dGhpcwo+IHBhcnQgb2YgdGhlIHVhcGkgdGhvdWdoLCBmZWVscyBsaWtlIGR1Y3QtdGFwaW5nIGFy
b3VuZCBzbG9wcHkgdXNlcnNwYWNlLgo+IE1heWJlIHdlIGNvdWxkIHdvcmsgb24gYSBncmFkdWFs
IHBsYW4gdG8gZGVwcmVjYXRlIHRoaXMsIHdpdGggbGltaXRpbmcgaXQKPiBvbmx5IHRvIG9sZGVy
IHZtd2dmeCB2ZXJzaW9ucyBhcyBhIHN0YXJ0PwoKU291bmRzIG9rIHdpdGggbWUuIEZpcnN0IEkg
Z3Vlc3MgSSBuZWVkIHRvIGZpZ3VyZSBvdXQgd2hhdCBjb21wb3NpdG9ycyAvIAp1c2VyLXNwYWNl
IGRyaXZlcnMgYWN0dWFsbHkgc3VmZmVyIGZyb20gdGhpcy4gSWYgdGhlcmUgYXJlIG1hbnksIGl0
IAptaWdodCBiZSBhIHBhaW4gdHJ5aW5nIHRvIGZpeCB0aGVtIGFsbC4KClRoYW5rcywKClRob21h
cwoKCj4KPiBUaGVzZSBraW5kIG9mIHRpbnkgYnV0IGltcG9ydGFudCBkaWZmZXJlbmNlcyBpbiBo
b3cgZHJpdmVycyBpbXBsZW1lbnQga21zCj4gaXMgd2h5IEknZCBtdWNoLCBtdWNoIHByZWZlciBp
dCdzIG5vdCBldmVuIHBvc3NpYmxlIHRvIGRvIHN0dWZmIGxpa2UgdGhpcy4KPgo+IFRoYW5rcywg
RGFuaWVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
