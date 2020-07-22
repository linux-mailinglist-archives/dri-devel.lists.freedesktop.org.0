Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3565229123
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 08:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3FA6E321;
	Wed, 22 Jul 2020 06:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706546E321;
 Wed, 22 Jul 2020 06:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id BA2DC3FA20;
 Wed, 22 Jul 2020 08:45:49 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=IdhAYh9/; 
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
 with ESMTP id DfDVw8gpZJyP; Wed, 22 Jul 2020 08:45:48 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 4BF723FA0A;
 Wed, 22 Jul 2020 08:45:44 +0200 (CEST)
Received: from [192.168.0.100] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id C3EB3362551;
 Wed, 22 Jul 2020 08:45:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1595400345; bh=CfYWORW5irF9hSdSvqJ1BW8dv25ifAxkvvNEXf35iGE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=IdhAYh9/iCj3hv8jgW4r4N66W3AM5qTSwCTUvlztwUg+zQtwpneu0WAQnOqzeqnp2
 Q7tdq0RClmP0P1gtrXnq0t2oaCou4Pps5e9OM1DmmS8VMEi0gIPsQnLGnZltZKZ8QP
 cVXIdTX2jhjJ+l0Lbzu9x8QeAknalbSuh2hW/xHc=
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf.rst: Document why indefinite
 fences are a bad idea
To: Dave Airlie <airlied@gmail.com>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
 <93b673b7-bb48-96eb-dc2c-bd4f9304000e@shipmail.org>
 <20200721074157.GB3278063@phenom.ffwll.local>
 <3603bb71-318b-eb53-0532-9daab62dce86@amd.com>
 <57a5eb9d-b74f-8ce4-7199-94e911d9b68b@shipmail.org>
 <CAPM=9twUWeenf-26GEvkuKo3wHgS3BCyrva=sNaWo6+=A5qdoQ@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <805c49b7-f0b3-45dc-5fe3-b352f0971527@shipmail.org>
Date: Wed, 22 Jul 2020 08:45:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPM=9twUWeenf-26GEvkuKo3wHgS3BCyrva=sNaWo6+=A5qdoQ@mail.gmail.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Steve Pronovost <spronovo@microsoft.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Jesse Natalie <jenatali@microsoft.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Mika Kuoppala <mika.kuoppala@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMjAtMDctMjIgMDA6NDUsIERhdmUgQWlybGllIHdyb3RlOgo+IE9uIFR1ZSwgMjEgSnVs
IDIwMjAgYXQgMTg6NDcsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkKPiA8dGhvbWFzX29zQHNo
aXBtYWlsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDcvMjEvMjAgOTo0NSBBTSwgQ2hyaXN0aWFuIEvD
tm5pZyB3cm90ZToKPj4+IEFtIDIxLjA3LjIwIHVtIDA5OjQxIHNjaHJpZWIgRGFuaWVsIFZldHRl
cjoKPj4+PiBPbiBNb24sIEp1bCAyMCwgMjAyMCBhdCAwMToxNToxN1BNICswMjAwLCBUaG9tYXMg
SGVsbHN0csO2bSAoSW50ZWwpCj4+Pj4gd3JvdGU6Cj4+Pj4+IEhpLAo+Pj4+Pgo+Pj4+PiBPbiA3
LzkvMjAgMjozMyBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+Pj4+IENvbWVzIHVwIGV2ZXJ5
IGZldyB5ZWFycywgZ2V0cyBzb21ld2hhdCB0ZWRpb3VzIHRvIGRpc2N1c3MsIGxldCdzCj4+Pj4+
PiB3cml0ZSB0aGlzIGRvd24gb25jZSBhbmQgZm9yIGFsbC4KPj4+Pj4+Cj4+Pj4+PiBXaGF0IEkn
bSBub3Qgc3VyZSBhYm91dCBpcyB3aGV0aGVyIHRoZSB0ZXh0IHNob3VsZCBiZSBtb3JlIGV4cGxp
Y2l0IGluCj4+Pj4+PiBmbGF0IG91dCBtYW5kYXRpbmcgdGhlIGFtZGtmZCBldmljdGlvbiBmZW5j
ZXMgZm9yIGxvbmcgcnVubmluZyBjb21wdXRlCj4+Pj4+PiB3b3JrbG9hZHMgb3Igd29ya2xvYWRz
IHdoZXJlIHVzZXJzcGFjZSBmZW5jaW5nIGlzIGFsbG93ZWQuCj4+Pj4+IEFsdGhvdWdoIChpbiBt
eSBodW1ibGUgb3BpbmlvbikgaXQgbWlnaHQgYmUgcG9zc2libGUgdG8gY29tcGxldGVseQo+Pj4+
PiB1bnRhbmdsZQo+Pj4+PiBrZXJuZWwtaW50cm9kdWNlZCBmZW5jZXMgZm9yIHJlc291cmNlIG1h
bmFnZW1lbnQgYW5kIGRtYS1mZW5jZXMgdXNlZAo+Pj4+PiBmb3IKPj4+Pj4gY29tcGxldGlvbi0g
YW5kIGRlcGVuZGVuY3kgdHJhY2tpbmcgYW5kIGxpZnQgYSBsb3Qgb2YgcmVzdHJpY3Rpb25zCj4+
Pj4+IGZvciB0aGUKPj4+Pj4gZG1hLWZlbmNlcywgaW5jbHVkaW5nIHByb2hpYml0aW5nIGluZmlu
aXRlIG9uZXMsIEkgdGhpbmsgdGhpcyBtYWtlcwo+Pj4+PiBzZW5zZQo+Pj4+PiBkZXNjcmliaW5n
IHRoZSBjdXJyZW50IHN0YXRlLgo+Pj4+IFllYWggSSB0aGluayBhIGZ1dHVyZSBwYXRjaCBuZWVk
cyB0byB0eXBlIHVwIGhvdyB3ZSB3YW50IHRvIG1ha2UgdGhhdAo+Pj4+IGhhcHBlbiAoZm9yIHNv
bWUgY3Jvc3MgZHJpdmVyIGNvbnNpc3RlbmN5KSBhbmQgd2hhdCBuZWVkcyB0byBiZQo+Pj4+IGNv
bnNpZGVyZWQuIFNvbWUgb2YgdGhlIG5lY2Vzc2FyeSBwYXJ0cyBhcmUgYWxyZWFkeSB0aGVyZSAo
d2l0aCBsaWtlIHRoZQo+Pj4+IHByZWVtcHRpb24gZmVuY2VzIGFtZGtmZCBoYXMgYXMgYW4gZXhh
bXBsZSksIGJ1dCBJIHRoaW5rIHNvbWUgY2xlYXIgZG9jcwo+Pj4+IG9uIHdoYXQncyByZXF1aXJl
ZCBmcm9tIGJvdGggaHcsIGRyaXZlcnMgYW5kIHVzZXJzcGFjZSB3b3VsZCBiZSByZWFsbHkKPj4+
PiBnb29kLgo+Pj4gSSdtIGN1cnJlbnRseSB3cml0aW5nIHRoYXQgdXAsIGJ1dCBwcm9iYWJseSBz
dGlsbCBuZWVkIGEgZmV3IGRheXMgZm9yCj4+PiB0aGlzLgo+PiBHcmVhdCEgSSBwdXQgZG93biBz
b21lICh2ZXJ5KSBpbml0aWFsIHRob3VnaHRzIGEgY291cGxlIG9mIHdlZWtzIGFnbwo+PiBidWls
ZGluZyBvbiBldmljdGlvbiBmZW5jZXMgZm9yIHZhcmlvdXMgaGFyZHdhcmUgY29tcGxleGl0eSBs
ZXZlbHMgaGVyZToKPj4KPj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3Rob21hc2gv
ZG9jcy8tL2Jsb2IvbWFzdGVyL1VudGFuZ2xpbmclMjBkbWEtZmVuY2UlMjBhbmQlMjBtZW1vcnkl
MjBhbGxvY2F0aW9uLm9kdAo+IFdlIGFyZSBzZWVpbmcgSFcgdGhhdCBoYXMgcmVjb3ZlcmFibGUg
R1BVIHBhZ2UgZmF1bHRzIGJ1dCBvbmx5IGZvcgo+IGNvbXB1dGUgdGFza3MsIGFuZCBzY2hlZHVs
ZXIgd2l0aG91dCBzZW1hcGhvcmVzIGh3IGZvciBncmFwaGljcy4KPgo+IFNvIGEgc2luZ2xlIGRy
aXZlciBtYXkgaGF2ZSB0byBleHBvc2UgYm90aCBtb2RlbHMgdG8gdXNlcnNwYWNlIGFuZAo+IGFs
c28gaW50cm9kdWNlcyB0aGUgcHJvYmxlbSBvZiBob3cgdG8gaW50ZXJvcGVyYXRlIGJldHdlZW4g
dGhlIHR3bwo+IG1vZGVscyBvbiBvbmUgY2FyZC4KPgo+IERhdmUuCgpIbW0sIHllcyB0byBiZWdp
biB3aXRoIGl0J3MgaW1wb3J0YW50IHRvIG5vdGUgdGhhdCB0aGlzIGlzIG5vdCBhIApyZXBsYWNl
bWVudCBmb3IgbmV3IHByb2dyYW1taW5nIG1vZGVscyBvciBBUElzLCBUaGlzIGlzIHNvbWV0aGlu
ZyB0aGF0IAp0YWtlcyBwbGFjZSBpbnRlcm5hbGx5IGluIGRyaXZlcnMgdG8gbWl0aWdhdGUgbWFu
eSBvZiB0aGUgcmVzdHJpY3Rpb25zIAp0aGF0IGFyZSBjdXJyZW50bHkgaW1wb3NlZCBvbiBkbWEt
ZmVuY2UgYW5kIGRvY3VtZW50ZWQgaW4gdGhpcyBhbmQgCnByZXZpb3VzIHNlcmllcy4gSXQncyBi
YXNpY2FsbHkgdGhlIGRyaXZlci1wcml2YXRlIG5hcnJvdyBjb21wbGV0aW9ucyAKSmFzb24gc3Vn
Z2VzdGVkIGluIHRoZSBsb2NrZGVwIHBhdGNoZXMgZGlzY3Vzc2lvbnMgaW1wbGVtZW50ZWQgdGhl
IHNhbWUgCndheSBhcyBldmljdGlvbi1mZW5jZXMuCgpUaGUgbWVtb3J5IGZlbmNlIEFQSSB3b3Vs
ZCBiZSBsb2NhbCB0byBoZWxwZXJzIGFuZCBtaWRkbGUtbGF5ZXJzIGxpa2UgClRUTSwgYW5kIHRo
ZSBjb3JyZXNwb25kaW5nIGRyaXZlcnMuwqAgVGhlIG9ubHkgY3Jvc3MtZHJpdmVyLWxpa2UgCnZp
c2liaWxpdHkgd291bGQgYmUgdGhhdCB0aGUgZG1hLWJ1ZiBtb3ZlX25vdGlmeSgpIGNhbGxiYWNr
IHdvdWxkIG5vdCBiZSAKYWxsb3dlZCB0byB3YWl0IG9uIGRtYS1mZW5jZXMgb3Igc29tZXRoaW5n
IHRoYXQgZGVwZW5kcyBvbiBhIGRtYS1mZW5jZS4KClNvIHdpdGggdGhhdCBpbiBtaW5kLCBJIGRv
bid0IGZvcmVzZWUgZW5naW5lcyB3aXRoIGRpZmZlcmVudCAKY2FwYWJpbGl0aWVzIG9uIHRoZSBz
YW1lIGNhcmQgYmVpbmcgYSBwcm9ibGVtLgoKL1Rob21hcwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
