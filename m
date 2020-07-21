Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2450227BE6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 11:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42866E550;
	Tue, 21 Jul 2020 09:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438D56E54C;
 Tue, 21 Jul 2020 09:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 2E7FE3F3E9;
 Tue, 21 Jul 2020 11:38:00 +0200 (CEST)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="en/VWZSM";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q15ipVI6XZhD; Tue, 21 Jul 2020 11:37:58 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id C30833F3B9;
 Tue, 21 Jul 2020 11:37:55 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id E425936014B;
 Tue, 21 Jul 2020 11:37:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1595324275; bh=rdzugGQ6Q9Agqo6R+Fh5pEZGhB20QIfSEgKjrW00F48=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=en/VWZSMbYYN7d820IYSTfPIg3fhtGHvwFmwCEDY854RehayzBtDZ/qc0p1IDDASl
 rt5w6NoqrBbdMP/4trFe26XK2u9uHHmjFK/sYw/EMbSeVkt03+IATpYq4ZXwRn+Az7
 6QetESjqQbQJ8zr9+16q7NP1Cm/wLXJ+s++ICCrQ=
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf.rst: Document why indefinite
 fences are a bad idea
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
 <93b673b7-bb48-96eb-dc2c-bd4f9304000e@shipmail.org>
 <20200721074157.GB3278063@phenom.ffwll.local>
 <3603bb71-318b-eb53-0532-9daab62dce86@amd.com>
 <57a5eb9d-b74f-8ce4-7199-94e911d9b68b@shipmail.org>
 <2ca2c004-1e11-87f5-4bd8-761e1b44d21f@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <74727f17-b3a5-ca12-6db6-e47543797b72@shipmail.org>
Date: Tue, 21 Jul 2020 11:37:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2ca2c004-1e11-87f5-4bd8-761e1b44d21f@amd.com>
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
Cc: Daniel Stone <daniels@collabora.com>, linux-rdma@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Steve Pronovost <spronovo@microsoft.com>,
 amd-gfx@lists.freedesktop.org, Jason Ekstrand <jason@jlekstrand.net>,
 Jesse Natalie <jenatali@microsoft.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMjEvMjAgMTA6NTUgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMjEuMDcu
MjAgdW0gMTA6NDcgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpOgo+Pgo+PiBPbiA3
LzIxLzIwIDk6NDUgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+PiBBbSAyMS4wNy4yMCB1
bSAwOTo0MSBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+Pj4gT24gTW9uLCBKdWwgMjAsIDIwMjAg
YXQgMDE6MTU6MTdQTSArMDIwMCwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSAKPj4+PiB3cm90
ZToKPj4+Pj4gSGksCj4+Pj4+Cj4+Pj4+IE9uIDcvOS8yMCAyOjMzIFBNLCBEYW5pZWwgVmV0dGVy
IHdyb3RlOgo+Pj4+Pj4gQ29tZXMgdXAgZXZlcnkgZmV3IHllYXJzLCBnZXRzIHNvbWV3aGF0IHRl
ZGlvdXMgdG8gZGlzY3VzcywgbGV0J3MKPj4+Pj4+IHdyaXRlIHRoaXMgZG93biBvbmNlIGFuZCBm
b3IgYWxsLgo+Pj4+Pj4KPj4+Pj4+IFdoYXQgSSdtIG5vdCBzdXJlIGFib3V0IGlzIHdoZXRoZXIg
dGhlIHRleHQgc2hvdWxkIGJlIG1vcmUgCj4+Pj4+PiBleHBsaWNpdCBpbgo+Pj4+Pj4gZmxhdCBv
dXQgbWFuZGF0aW5nIHRoZSBhbWRrZmQgZXZpY3Rpb24gZmVuY2VzIGZvciBsb25nIHJ1bm5pbmcg
Cj4+Pj4+PiBjb21wdXRlCj4+Pj4+PiB3b3JrbG9hZHMgb3Igd29ya2xvYWRzIHdoZXJlIHVzZXJz
cGFjZSBmZW5jaW5nIGlzIGFsbG93ZWQuCj4+Pj4+IEFsdGhvdWdoIChpbiBteSBodW1ibGUgb3Bp
bmlvbikgaXQgbWlnaHQgYmUgcG9zc2libGUgdG8gY29tcGxldGVseSAKPj4+Pj4gdW50YW5nbGUK
Pj4+Pj4ga2VybmVsLWludHJvZHVjZWQgZmVuY2VzIGZvciByZXNvdXJjZSBtYW5hZ2VtZW50IGFu
ZCBkbWEtZmVuY2VzIAo+Pj4+PiB1c2VkIGZvcgo+Pj4+PiBjb21wbGV0aW9uLSBhbmQgZGVwZW5k
ZW5jeSB0cmFja2luZyBhbmQgbGlmdCBhIGxvdCBvZiByZXN0cmljdGlvbnMgCj4+Pj4+IGZvciB0
aGUKPj4+Pj4gZG1hLWZlbmNlcywgaW5jbHVkaW5nIHByb2hpYml0aW5nIGluZmluaXRlIG9uZXMs
IEkgdGhpbmsgdGhpcyAKPj4+Pj4gbWFrZXMgc2Vuc2UKPj4+Pj4gZGVzY3JpYmluZyB0aGUgY3Vy
cmVudCBzdGF0ZS4KPj4+PiBZZWFoIEkgdGhpbmsgYSBmdXR1cmUgcGF0Y2ggbmVlZHMgdG8gdHlw
ZSB1cCBob3cgd2Ugd2FudCB0byBtYWtlIHRoYXQKPj4+PiBoYXBwZW4gKGZvciBzb21lIGNyb3Nz
IGRyaXZlciBjb25zaXN0ZW5jeSkgYW5kIHdoYXQgbmVlZHMgdG8gYmUKPj4+PiBjb25zaWRlcmVk
LiBTb21lIG9mIHRoZSBuZWNlc3NhcnkgcGFydHMgYXJlIGFscmVhZHkgdGhlcmUgKHdpdGggCj4+
Pj4gbGlrZSB0aGUKPj4+PiBwcmVlbXB0aW9uIGZlbmNlcyBhbWRrZmQgaGFzIGFzIGFuIGV4YW1w
bGUpLCBidXQgSSB0aGluayBzb21lIGNsZWFyIAo+Pj4+IGRvY3MKPj4+PiBvbiB3aGF0J3MgcmVx
dWlyZWQgZnJvbSBib3RoIGh3LCBkcml2ZXJzIGFuZCB1c2Vyc3BhY2Ugd291bGQgYmUgcmVhbGx5
Cj4+Pj4gZ29vZC4KPj4+Cj4+PiBJJ20gY3VycmVudGx5IHdyaXRpbmcgdGhhdCB1cCwgYnV0IHBy
b2JhYmx5IHN0aWxsIG5lZWQgYSBmZXcgZGF5cyAKPj4+IGZvciB0aGlzLgo+Pgo+PiBHcmVhdCEg
SSBwdXQgZG93biBzb21lICh2ZXJ5KSBpbml0aWFsIHRob3VnaHRzIGEgY291cGxlIG9mIHdlZWtz
IGFnbyAKPj4gYnVpbGRpbmcgb24gZXZpY3Rpb24gZmVuY2VzIGZvciB2YXJpb3VzIGhhcmR3YXJl
IGNvbXBsZXhpdHkgbGV2ZWxzIGhlcmU6Cj4+Cj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnBy
b3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGxhYi5mcmVlZGVza3Rv
cC5vcmclMkZ0aG9tYXNoJTJGZG9jcyUyRi0lMkZibG9iJTJGbWFzdGVyJTJGVW50YW5nbGluZyUy
NTIwZG1hLWZlbmNlJTI1MjBhbmQlMjUyMG1lbW9yeSUyNTIwYWxsb2NhdGlvbi5vZHQmYW1wO2Rh
dGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDODk3OGJiZDc4MjNlNGI0
MTY2MzcwOGQ4MmQ1MmFkZDMlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAl
N0MwJTdDNjM3MzA5MTgwNDI0MzEyMzkwJmFtcDtzZGF0YT10VHh4MnZmemZ3TE0xSUJKU3FxQVpS
dzE2MDRSJTJGMGJJM013TjElMkZCZjJWUSUzRCZhbXA7cmVzZXJ2ZWQ9MCAKPj4KPgo+IEkgZG9u
J3QgdGhpbmsgdGhhdCB0aGlzIHdpbGwgZXZlciBiZSBwb3NzaWJsZS4KPgo+IFNlZSB0aGF0IERh
bmllbCBkZXNjcmliZXMgaW4gaGlzIHRleHQgaXMgdGhhdCBpbmRlZmluaXRlIGZlbmNlcyBhcmUg
YSAKPiBiYWQgaWRlYSBmb3IgbWVtb3J5IG1hbmFnZW1lbnQsIGFuZCBJIHRoaW5rIHRoYXQgdGhp
cyBpcyBhIGZpeGVkIGZhY3QuCj4KPiBJbiBvdGhlciB3b3JkcyB0aGUgd2hvbGUgY29uY2VwdCBv
ZiBzdWJtaXR0aW5nIHdvcmsgdG8gdGhlIGtlcm5lbCAKPiB3aGljaCBkZXBlbmRzIG9uIHNvbWUg
dXNlciBzcGFjZSBpbnRlcmFjdGlvbiBkb2Vzbid0IHdvcmsgYW5kIG5ldmVyIHdpbGwuCgpXZWxs
IHRoZSBpZGVhIGhlcmUgaXMgdGhhdCBtZW1vcnkgbWFuYWdlbWVudCB3aWxsICpuZXZlciogZGVw
ZW5kIG9uIAppbmRlZmluaXRlIGZlbmNlczogQXMgc29vbiBhcyBzb21lb25lIHdhaXRzIG9uIGEg
bWVtb3J5IG1hbmFnZXIgZmVuY2UgCihiZSBpdCBldmljdGlvbiwgc2hyaW5rZXIgb3IgbW11IG5v
dGlmaWVyKSBpdCBicmVha3Mgb3V0IG9mIGFueSAKZG1hLWZlbmNlIGRlcGVuZGVuY2llcyBhbmQg
L29yIHVzZXItc3BhY2UgaW50ZXJhY3Rpb24uIFRoZSB0ZXh0IHRyaWVzIHRvIApkZXNjcmliZSB3
aGF0J3MgcmVxdWlyZWQgdG8gYmUgYWJsZSB0byBkbyB0aGF0IChzYXZlIGZvciBub24tcHJlZW1w
dGlibGUgCmdwdXMgd2hlcmUgc29tZW9uZSBzdWJtaXRzIGEgZm9yZXZlci1ydW5uaW5nIHNoYWRl
cikuCgpTbyB3aGlsZSBJIHRoaW5rIHRoaXMgaXMgcG9zc2libGUgKHVudGlsIHNvbWVvbmUgY29t
ZXMgdXAgd2l0aCBhIGNhc2UgCndoZXJlIGl0IHdvdWxkbid0IHdvcmsgb2YgY291cnNlKSwgSSBn
dWVzcyBEYW5pZWwgaGFzIGEgcG9pbnQgaW4gdGhhdCBpdCAKd29uJ3QgaGFwcGVuIGJlY2F1c2Ug
b2YgaW5lcnRpYSBhbmQgdGhlcmUgbWlnaHQgYmUgYmV0dGVyIG9wdGlvbnMuCgovVGhvbWFzCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
