Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 411C82292F0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 10:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB70D6E7D0;
	Wed, 22 Jul 2020 08:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6816E6E7D0;
 Wed, 22 Jul 2020 08:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 80C113F89C;
 Wed, 22 Jul 2020 10:05:32 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=r+A/yXu5; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LtesimML5tCB; Wed, 22 Jul 2020 10:05:31 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 5B1263FA05;
 Wed, 22 Jul 2020 10:05:28 +0200 (CEST)
Received: from [192.168.0.100] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id BEE22362551;
 Wed, 22 Jul 2020 10:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1595405130; bh=VTus/6AbWlsqqDyaiMd7dlOgvwrBywZ/lvDt+28dCLo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=r+A/yXu5rtcZQfoAKsafVO1QlKXWNGPFT6uP5+exKqizL8J/rQF8uiKJQ0zVlPbIK
 FP0AJc/S0rSKtFRE2FqJff27OQ3sWeh3/qtxGAcuh3DzYaek2xCKQXWbnIHjLcE8ek
 /LXRFJt0OoVOz7g0k5t0JMTWBWAG81ghURGd4Q9U=
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf.rst: Document why indefinite
 fences are a bad idea
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
 <93b673b7-bb48-96eb-dc2c-bd4f9304000e@shipmail.org>
 <20200721074157.GB3278063@phenom.ffwll.local>
 <3603bb71-318b-eb53-0532-9daab62dce86@amd.com>
 <57a5eb9d-b74f-8ce4-7199-94e911d9b68b@shipmail.org>
 <CAPM=9twUWeenf-26GEvkuKo3wHgS3BCyrva=sNaWo6+=A5qdoQ@mail.gmail.com>
 <805c49b7-f0b3-45dc-5fe3-b352f0971527@shipmail.org>
 <CAKMK7uHhhxBC2MvnNnU9FjxJaWkEcP3m5m7AN3yzfw=wxFsckA@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <92393d26-d863-aac6-6d27-53cad6854e13@shipmail.org>
Date: Wed, 22 Jul 2020 10:05:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHhhxBC2MvnNnU9FjxJaWkEcP3m5m7AN3yzfw=wxFsckA@mail.gmail.com>
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Daniel Stone <daniels@collabora.com>, linux-rdma <linux-rdma@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Steve Pronovost <spronovo@microsoft.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Jesse Natalie <jenatali@microsoft.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMjAtMDctMjIgMDk6MTEsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gV2VkLCBKdWwg
MjIsIDIwMjAgYXQgODo0NSBBTSBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpCj4gPHRob21hc19v
c0BzaGlwbWFpbC5vcmc+IHdyb3RlOgo+Pgo+PiBPbiAyMDIwLTA3LTIyIDAwOjQ1LCBEYXZlIEFp
cmxpZSB3cm90ZToKPj4+IE9uIFR1ZSwgMjEgSnVsIDIwMjAgYXQgMTg6NDcsIFRob21hcyBIZWxs
c3Ryw7ZtIChJbnRlbCkKPj4+IDx0aG9tYXNfb3NAc2hpcG1haWwub3JnPiB3cm90ZToKPj4+PiBP
biA3LzIxLzIwIDk6NDUgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+IEFtIDIxLjA3
LjIwIHVtIDA5OjQxIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+Pj4+IE9uIE1vbiwgSnVsIDIw
LCAyMDIwIGF0IDAxOjE1OjE3UE0gKzAyMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkKPj4+
Pj4+IHdyb3RlOgo+Pj4+Pj4+IEhpLAo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gNy85LzIwIDI6MzMgUE0s
IERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pj4+Pj4+IENvbWVzIHVwIGV2ZXJ5IGZldyB5ZWFycywg
Z2V0cyBzb21ld2hhdCB0ZWRpb3VzIHRvIGRpc2N1c3MsIGxldCdzCj4+Pj4+Pj4+IHdyaXRlIHRo
aXMgZG93biBvbmNlIGFuZCBmb3IgYWxsLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBXaGF0IEknbSBub3Qg
c3VyZSBhYm91dCBpcyB3aGV0aGVyIHRoZSB0ZXh0IHNob3VsZCBiZSBtb3JlIGV4cGxpY2l0IGlu
Cj4+Pj4+Pj4+IGZsYXQgb3V0IG1hbmRhdGluZyB0aGUgYW1ka2ZkIGV2aWN0aW9uIGZlbmNlcyBm
b3IgbG9uZyBydW5uaW5nIGNvbXB1dGUKPj4+Pj4+Pj4gd29ya2xvYWRzIG9yIHdvcmtsb2FkcyB3
aGVyZSB1c2Vyc3BhY2UgZmVuY2luZyBpcyBhbGxvd2VkLgo+Pj4+Pj4+IEFsdGhvdWdoIChpbiBt
eSBodW1ibGUgb3BpbmlvbikgaXQgbWlnaHQgYmUgcG9zc2libGUgdG8gY29tcGxldGVseQo+Pj4+
Pj4+IHVudGFuZ2xlCj4+Pj4+Pj4ga2VybmVsLWludHJvZHVjZWQgZmVuY2VzIGZvciByZXNvdXJj
ZSBtYW5hZ2VtZW50IGFuZCBkbWEtZmVuY2VzIHVzZWQKPj4+Pj4+PiBmb3IKPj4+Pj4+PiBjb21w
bGV0aW9uLSBhbmQgZGVwZW5kZW5jeSB0cmFja2luZyBhbmQgbGlmdCBhIGxvdCBvZiByZXN0cmlj
dGlvbnMKPj4+Pj4+PiBmb3IgdGhlCj4+Pj4+Pj4gZG1hLWZlbmNlcywgaW5jbHVkaW5nIHByb2hp
Yml0aW5nIGluZmluaXRlIG9uZXMsIEkgdGhpbmsgdGhpcyBtYWtlcwo+Pj4+Pj4+IHNlbnNlCj4+
Pj4+Pj4gZGVzY3JpYmluZyB0aGUgY3VycmVudCBzdGF0ZS4KPj4+Pj4+IFllYWggSSB0aGluayBh
IGZ1dHVyZSBwYXRjaCBuZWVkcyB0byB0eXBlIHVwIGhvdyB3ZSB3YW50IHRvIG1ha2UgdGhhdAo+
Pj4+Pj4gaGFwcGVuIChmb3Igc29tZSBjcm9zcyBkcml2ZXIgY29uc2lzdGVuY3kpIGFuZCB3aGF0
IG5lZWRzIHRvIGJlCj4+Pj4+PiBjb25zaWRlcmVkLiBTb21lIG9mIHRoZSBuZWNlc3NhcnkgcGFy
dHMgYXJlIGFscmVhZHkgdGhlcmUgKHdpdGggbGlrZSB0aGUKPj4+Pj4+IHByZWVtcHRpb24gZmVu
Y2VzIGFtZGtmZCBoYXMgYXMgYW4gZXhhbXBsZSksIGJ1dCBJIHRoaW5rIHNvbWUgY2xlYXIgZG9j
cwo+Pj4+Pj4gb24gd2hhdCdzIHJlcXVpcmVkIGZyb20gYm90aCBodywgZHJpdmVycyBhbmQgdXNl
cnNwYWNlIHdvdWxkIGJlIHJlYWxseQo+Pj4+Pj4gZ29vZC4KPj4+Pj4gSSdtIGN1cnJlbnRseSB3
cml0aW5nIHRoYXQgdXAsIGJ1dCBwcm9iYWJseSBzdGlsbCBuZWVkIGEgZmV3IGRheXMgZm9yCj4+
Pj4+IHRoaXMuCj4+Pj4gR3JlYXQhIEkgcHV0IGRvd24gc29tZSAodmVyeSkgaW5pdGlhbCB0aG91
Z2h0cyBhIGNvdXBsZSBvZiB3ZWVrcyBhZ28KPj4+PiBidWlsZGluZyBvbiBldmljdGlvbiBmZW5j
ZXMgZm9yIHZhcmlvdXMgaGFyZHdhcmUgY29tcGxleGl0eSBsZXZlbHMgaGVyZToKPj4+Pgo+Pj4+
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy90aG9tYXNoL2RvY3MvLS9ibG9iL21hc3Rl
ci9VbnRhbmdsaW5nJTIwZG1hLWZlbmNlJTIwYW5kJTIwbWVtb3J5JTIwYWxsb2NhdGlvbi5vZHQK
Pj4+IFdlIGFyZSBzZWVpbmcgSFcgdGhhdCBoYXMgcmVjb3ZlcmFibGUgR1BVIHBhZ2UgZmF1bHRz
IGJ1dCBvbmx5IGZvcgo+Pj4gY29tcHV0ZSB0YXNrcywgYW5kIHNjaGVkdWxlciB3aXRob3V0IHNl
bWFwaG9yZXMgaHcgZm9yIGdyYXBoaWNzLgo+Pj4KPj4+IFNvIGEgc2luZ2xlIGRyaXZlciBtYXkg
aGF2ZSB0byBleHBvc2UgYm90aCBtb2RlbHMgdG8gdXNlcnNwYWNlIGFuZAo+Pj4gYWxzbyBpbnRy
b2R1Y2VzIHRoZSBwcm9ibGVtIG9mIGhvdyB0byBpbnRlcm9wZXJhdGUgYmV0d2VlbiB0aGUgdHdv
Cj4+PiBtb2RlbHMgb24gb25lIGNhcmQuCj4+Pgo+Pj4gRGF2ZS4KPj4gSG1tLCB5ZXMgdG8gYmVn
aW4gd2l0aCBpdCdzIGltcG9ydGFudCB0byBub3RlIHRoYXQgdGhpcyBpcyBub3QgYQo+PiByZXBs
YWNlbWVudCBmb3IgbmV3IHByb2dyYW1taW5nIG1vZGVscyBvciBBUElzLCBUaGlzIGlzIHNvbWV0
aGluZyB0aGF0Cj4+IHRha2VzIHBsYWNlIGludGVybmFsbHkgaW4gZHJpdmVycyB0byBtaXRpZ2F0
ZSBtYW55IG9mIHRoZSByZXN0cmljdGlvbnMKPj4gdGhhdCBhcmUgY3VycmVudGx5IGltcG9zZWQg
b24gZG1hLWZlbmNlIGFuZCBkb2N1bWVudGVkIGluIHRoaXMgYW5kCj4+IHByZXZpb3VzIHNlcmll
cy4gSXQncyBiYXNpY2FsbHkgdGhlIGRyaXZlci1wcml2YXRlIG5hcnJvdyBjb21wbGV0aW9ucwo+
PiBKYXNvbiBzdWdnZXN0ZWQgaW4gdGhlIGxvY2tkZXAgcGF0Y2hlcyBkaXNjdXNzaW9ucyBpbXBs
ZW1lbnRlZCB0aGUgc2FtZQo+PiB3YXkgYXMgZXZpY3Rpb24tZmVuY2VzLgo+Pgo+PiBUaGUgbWVt
b3J5IGZlbmNlIEFQSSB3b3VsZCBiZSBsb2NhbCB0byBoZWxwZXJzIGFuZCBtaWRkbGUtbGF5ZXJz
IGxpa2UKPj4gVFRNLCBhbmQgdGhlIGNvcnJlc3BvbmRpbmcgZHJpdmVycy4gIFRoZSBvbmx5IGNy
b3NzLWRyaXZlci1saWtlCj4+IHZpc2liaWxpdHkgd291bGQgYmUgdGhhdCB0aGUgZG1hLWJ1ZiBt
b3ZlX25vdGlmeSgpIGNhbGxiYWNrIHdvdWxkIG5vdCBiZQo+PiBhbGxvd2VkIHRvIHdhaXQgb24g
ZG1hLWZlbmNlcyBvciBzb21ldGhpbmcgdGhhdCBkZXBlbmRzIG9uIGEgZG1hLWZlbmNlLgo+IEJl
Y2F1c2Ugd2UgY2FuJ3QgcHJlZW1wdCAob24gc29tZSBlbmdpbmVzIGF0IGxlYXN0KSB3ZSBhbHJl
YWR5IGhhdmUKPiB0aGUgcmVxdWlyZW1lbnQgdGhhdCBjcm9zcyBkcml2ZXIgYnVmZmVyIG1hbmFn
ZW1lbnQgY2FuIGdldCBzdHVjayBvbiBhCj4gZG1hLWZlbmNlLiBOb3QgZXZlbiB0YWtpbmcgaW50
byBhY2NvdW50IHRoZSBob3Jyb3JzIHdlIGRvIHdpdGgKPiB1c2VycHRyLCB3aGljaCBhcmUgY3Jv
c3MgZHJpdmVyIG5vIG1hdHRlciB3aGF0LiBMaW1pdGluZyBtb3ZlX25vdGlmeQo+IHRvIG1lbW9y
eSBmZW5jZXMgb25seSBkb2Vzbid0IHdvcmssIHNpbmNlIHRoZSBwdGUgY2xlYXJpbmcgbWlnaHQg
bmVlZAo+IHRvIHdhaXQgZm9yIGEgZG1hX2ZlbmNlIGZpcnN0LiBIZW5jZSB0aGlzIGJlY29tZXMg
YSBmdWxsIGVuZC1vZi1iYXRjaAo+IGZlbmNlLCBub3QganVzdCBhIGxpbWl0ZWQga2VybmVsLWlu
dGVybmFsIG1lbW9yeSBmZW5jZS4KCkZvciBub24tcHJlZW1wdGlibGUgaGFyZHdhcmUgdGhlIG1l
bW9yeSBmZW5jZSB0eXBpY2FsbHkgKmlzKiB0aGUgCmVuZC1vZi1iYXRjaCBmZW5jZS4gKFVubGVz
cywgYXMgZG9jdW1lbnRlZCwgdGhlcmUgaXMgYSBzY2hlZHVsZXIgCmNvbnN1bWluZyBzeW5jLWZp
bGUgZGVwZW5kZW5jaWVzIGluIHdoaWNoIGNhc2UgdGhlIG1lbW9yeSBmZW5jZSB3YWl0IApuZWVk
cyB0byBiZSBhYmxlIHRvIGJyZWFrIG91dCBvZiB0aGF0KS4gVGhlIGtleSB0aGluZyBpcyBub3Qg
dGhhdCB3ZSBjYW4gCmJyZWFrIG91dCBvZiBleGVjdXRpb24sIGJ1dCB0aGF0IHdlIGNhbiBicmVh
ayBvdXQgb2YgZGVwZW5kZW5jaWVzLCBzaW5jZSAKd2hlbiB3ZSdyZSBleGVjdXRpbmcgYWxsIGRl
cGVuZGVjaWVzIChtb2R1bG8gc2VtYXBob3JlcykgYXJlIGFscmVhZHkgCmZ1bGZpbGxlZC4gVGhh
dCdzIHdoYXQncyBlbGltaW5hdGluZyB0aGUgZGVhZGxvY2tzLgoKPgo+IFRoYXQncyBraW5kYSB3
aHkgSSB0aGluayBvbmx5IHJlYXNvbmFibGUgb3B0aW9uIGlzIHRvIHRvc3MgaW4gdGhlCj4gdG93
ZWwgYW5kIGRlY2xhcmUgZG1hLWZlbmNlIHRvIGJlIHRoZSBtZW1vcnkgZmVuY2UgKGFuZCBzdWNr
IHVwIGFsbAo+IHRoZSBjb25zZXF1ZW5jZXMgb2YgdGhhdCBkZWNpc2lvbiBhcyB1YXBpLCB3aGlj
aCBpcyBraW5kYSB3aGVyZSB3ZQo+IGFyZSksIGFuZCBjb25zdHJ1Y3Qgc29tZXRoaW5nIG5ldyZl
bnRpcmVseSBmcmVlLXdoZWVsaW5nIGZvciB1c2Vyc3BhY2UKPiBmZW5jaW5nLiBCdXQgb25seSBm
b3IgZW5naW5lcyB0aGF0IGFsbG93IGVub3VnaCBwcmVlbXB0L2dwdSBwYWdlCj4gZmF1bHRpbmcg
dG8gbWFrZSB0aGF0IHBvc3NpYmxlLiBGcmVlIHdoZWVsaW5nIHVzZXJzcGFjZSBmZW5jZXMvZ3B1
Cj4gc2VtYXBob3JlcyBvciB3aGF0ZXZlciB5b3Ugd2FudCB0byBjYWxsIHRoZW0gKG9uIHdpbmRv
d3MgSSB0aGluayBpdCdzCj4gbW9uaXRvcmVkIGZlbmNlKSBvbmx5IHdvcmsgaWYgeW91IGNhbiBw
cmVlbXB0IHRvIGRlY291cGxlIHRoZSBtZW1vcnkKPiBmZW5jZXMgZnJvbSB5b3VyIGdwdSBjb21t
YW5kIGV4ZWN1dGlvbi4KPgo+IFRoZXJlJ3MgdGhlIGluLWJldHdlZW4gc3RlcCBvZiBqdXN0IGRl
Y291cGxpbmcgdGhlIGJhdGNoYnVmZmVyCj4gc3VibWlzc2lvbiBwcmVwIGZvciBodyB3aXRob3V0
IGFueSBwcmVlbXB0IChidXQgYSBzY2hlZHVsZXIpLCBidXQgdGhhdAo+IHNlZW1zIGtpbmRhIHBv
aW50bGVzcy4gTW9kZXJuIGV4ZWNidWYgc2hvdWxkIGJlIE8oMSkgZmFzdHBhdGgsIHdpdGgKPiBh
bGwgdGhlIGFsbG9jYXRpb24vbWFwcGluZyB3b3JrIHB1bGxlZCBvdXQgYWhlYWQuIHZrIGV4cG9z
ZXMgdGhhdAo+IG1vZGVsIGRpcmVjdGx5IHRvIGNsaWVudHMsIEdMIGRyaXZlcnMgY291bGQgdXNl
IGl0IGludGVybmFsbHkgdG9vLCBzbwo+IEkgc2VlIHplcm8gdmFsdWUgaW4gc3BlbmRpbmcgbG90
cyBvZiB0aW1lIGVuZ2luZWVyaW5nIHZlcnkgdHJpY2t5Cj4ga2VybmVsIGNvZGUganVzdCBmb3Ig
b2xkIHVzZXJzcGFjZS4gTXVjaCBtb3JlIHJlYXNvbmFibGUgdG8gZG8gdGhhdCBpbgo+IHVzZXJz
cGFjZSwgd2hlcmUgd2UgaGF2ZSByZWFsIGRlYnVnZ2VycyBhbmQgbm8gcGFuaWNzIGFib3V0IHNl
Y3VyaXR5Cj4gYnVncyAob3Igd2VsbCwgYSBsb3QgbGVzcywgd2ViZ2wgaXMgc3RpbGwgYSB0aGlu
ZywgYnV0IGF0IGxlYXN0Cj4gYnJvd3NlcnMgcmVhbGl6ZWQgeW91IG5lZWQgdG8gY29udGFpbmVy
IHRoYXQgY29tcGxldGVseSkuCgpTdXJlLCBpdCdzIGRlZmluaXRlbHkgYSBiaWcgY2h1bmsgb2Yg
d29yay4gSSB0aGluayB0aGUgYmlnIHdpbiB3b3VsZCBiZSAKYWxsb3dpbmcgbWVtb3J5IGFsbG9j
YXRpb24gaW4gZG1hLWZlbmNlIGNyaXRpY2FsIHNlY3Rpb25zLiBCdXQgSSAKY29tcGxldGVseSBi
dXkgdGhlIGFib3ZlIGFyZ3VtZW50LiBJIGp1c3Qgd2FudGVkIHRvIHBvaW50IG91dCB0aGF0IG1h
bnkgCm9mIHRoZSBkbWEtZmVuY2UgcmVzdHJpY3Rpb25zIGFyZSBJTUhPIGZpeGFibGUsIHNob3Vs
ZCB3ZSBuZWVkIHRvIGRvIAp0aGF0IGZvciB3aGF0ZXZlciByZWFzb24uCgovVGhvbWFzCgoKPgo+
IENoZWVycywgRGFuaWVsCj4KPj4gU28gd2l0aCB0aGF0IGluIG1pbmQsIEkgZG9uJ3QgZm9yZXNl
ZSBlbmdpbmVzIHdpdGggZGlmZmVyZW50Cj4+IGNhcGFiaWxpdGllcyBvbiB0aGUgc2FtZSBjYXJk
IGJlaW5nIGEgcHJvYmxlbS4KPj4KPj4gL1Rob21hcwo+Pgo+Pgo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
