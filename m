Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A763347890
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 13:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FB86E20C;
	Wed, 24 Mar 2021 12:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F29A6E20C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 12:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 9493F3F574;
 Wed, 24 Mar 2021 13:35:23 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="QigSJZff";
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
 with ESMTP id oWq415IovtAT; Wed, 24 Mar 2021 13:35:22 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 591003F32B;
 Wed, 24 Mar 2021 13:35:20 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.198.151.43])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 25E073605CC;
 Wed, 24 Mar 2021 13:35:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616589319; bh=ulzxMU6+shpkADnMm3wMHLD8eiDD9ikAuWk9WZlen0w=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=QigSJZff6JKO3p0Xch+Q1YyglVcIF9n2zCvDKAzxxDOwQ3wuNCLdJKOGZCtPCvVmM
 YUAw3ZUGlMS9F3M7dXJ0mQ/b1TbjBHRoJy6J9YEJUqlfQ4xQu8iDiAygGCvnind8k4
 +g1Hkk8p0j0KQabTuAxi32oz4o/AmQkZNU8YptiI=
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-2-thomas_os@shipmail.org>
 <YFnST5VLcEgv9q+s@phenom.ffwll.local>
 <314fc020-d243-dbf0-acb3-ecfcc9c2443c@shipmail.org>
 <20210323163715.GJ2356281@nvidia.com>
 <5824b731-ca6a-92fd-e314-d986b6a7b101@shipmail.org>
 <YFsM23t2niJwhpM/@phenom.ffwll.local> <20210324122430.GW2356281@nvidia.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <e12e2c49-afaf-dbac-b18c-272c93c83e06@shipmail.org>
Date: Wed, 24 Mar 2021 13:35:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210324122430.GW2356281@nvidia.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMjQvMjEgMToyNCBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFdlZCwgTWFy
IDI0LCAyMDIxIGF0IDEwOjU2OjQzQU0gKzAxMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+IE9u
IFR1ZSwgTWFyIDIzLCAyMDIxIGF0IDA2OjA2OjUzUE0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7Zt
IChJbnRlbCkgd3JvdGU6Cj4+PiBPbiAzLzIzLzIxIDU6MzcgUE0sIEphc29uIEd1bnRob3JwZSB3
cm90ZToKPj4+PiBPbiBUdWUsIE1hciAyMywgMjAyMSBhdCAwNTozNDo1MVBNICswMTAwLCBUaG9t
YXMgSGVsbHN0csO2bSAoSW50ZWwpIHdyb3RlOgo+Pj4+Cj4+Pj4+Pj4gQEAgLTIxMCw2ICsyMTEs
MjAgQEAgc3RhdGljIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2luc2VydF9odWdlKHN0cnVjdCB2bV9m
YXVsdCAqdm1mLAo+Pj4+Pj4+ICAgICAJaWYgKChwZm4gJiAoZmF1bHRfcGFnZV9zaXplIC0gMSkp
ICE9IDApCj4+Pj4+Pj4gICAgIAkJZ290byBvdXRfZmFsbGJhY2s7Cj4+Pj4+Pj4gKwkvKgo+Pj4+
Pj4+ICsJICogSHVnZSBlbnRyaWVzIG11c3QgYmUgc3BlY2lhbCwgdGhhdCBpcyBtYXJraW5nIHRo
ZW0gYXMgZGV2bWFwCj4+Pj4+Pj4gKwkgKiB3aXRoIG5vIGJhY2tpbmcgZGV2aWNlIG1hcCByYW5n
ZS4gSWYgdGhlcmUgaXMgYSBiYWNraW5nCj4+Pj4+Pj4gKwkgKiByYW5nZSwgRG9uJ3QgaW5zZXJ0
IGEgaHVnZSBlbnRyeS4KPj4+Pj4+PiArCSAqIElmIHRoaXMgY2hlY2sgdHVybnMgb3V0IHRvIGJl
IHRvbyBtdWNoIG9mIGEgcGVyZm9ybWFuY2UgaGl0LAo+Pj4+Pj4+ICsJICogd2UgY2FuIGluc3Rl
YWQgaGF2ZSBkcml2ZXJzIGluZGljYXRlIHdoZXRoZXIgdGhleSBtYXkgaGF2ZQo+Pj4+Pj4+ICsJ
ICogYmFja2luZyBkZXZpY2UgbWFwIHJhbmdlcyBhbmQgaWYgbm90LCBza2lwIHRoaXMgbG9va3Vw
Lgo+Pj4+Pj4+ICsJICovCj4+Pj4+PiBJIHRoaW5rIHdlIGNhbiBkbyB0aGlzIHN0YXRpY2FsbHk6
Cj4+Pj4+PiAtIGlmIGl0J3Mgc3lzdGVtIG1lbW9yeSB3ZSBrbm93IHRoZXJlJ3Mgbm8gZGV2bWFw
IGZvciBpdCwgYW5kIHdlIGRvIHRoZQo+Pj4+Pj4gICAgICB0cmljayB0byBibG9jayBndXBfZmFz
dAo+Pj4+PiBZZXMsIHRoYXQgc2hvdWxkIHdvcmsuCj4+Pj4+PiAtIGlmIGl0J3MgaW9tZW0sIHdl
IGtub3cgZ3VwX2Zhc3Qgd29udCB3b3JrIGFueXdheSBpZiBkb24ndCBzZXQgUEZOX0RFViwKPj4+
Pj4+ICAgICAgc28gbWlnaHQgYXMgd2VsbCBub3QgZG8gdGhhdAo+Pj4+PiBJIHRoaW5rIGd1cF9m
YXN0IHdpbGwgdW5mb3J0dW5hdGVseSBtaXN0YWtlIGEgaHVnZSBpb21lbSBwYWdlIGZvciBhbgo+
Pj4+PiBvcmRpbmFyeSBwYWdlIGFuZCB0cnkgdG8gYWNjZXNzIGEgbm9uLWV4aXN0YW50IHN0cnVj
dCBwYWdlIGZvciBpdCwgdW5sZXNzIHdlCj4+Pj4+IGRvIHRoZSBkZXZtYXAgdHJpY2suCj4+Pj4+
Cj4+Pj4+IEFuZCB0aGUgbG9va3VwIHdvdWxkIHRoZW4gYmUgZm9yIHRoZSByYXJlIGNhc2Ugd2hl
cmUgYSBkcml2ZXIgd291bGQgaGF2ZQo+Pj4+PiBhbHJlYWR5IHJlZ2lzdGVyZWQgYSBkZXZfcGFn
ZW1hcCBmb3IgYW4gaW9tZW0gYXJlYSB3aGljaCBtYXkgYWxzbyBiZSBtYXBwZWQKPj4+Pj4gdGhy
b3VnaCBUVE0gKGxpa2UgdGhlIHBhdGNoIGZyb20gRmVsaXggYSBjb3VwbGUgb2Ygd2Vla3MgYWdv
KS4gSWYgYSBkcml2ZXIKPj4+Pj4gY2FuIHByb21pc2Ugbm90IHRvIGRvIHRoYXQsIHRoZW4gd2Ug
Y2FuIHNhZmVseSByZW1vdmUgdGhlIGxvb2t1cC4KPj4+PiBJc24ndCB0aGUgZGV2bWFwIFBURSBm
bGFnIGFyY2ggb3B0aW9uYWw/IERvZXMgdGhpcyBmYWxsIGJhY2sgdG8gbm90Cj4+Pj4gdXNpbmcg
aHVnZSBwYWdlcyBvbiBhcmNoZXMgdGhhdCBkb24ndCBzdXBwb3J0IGl0Pwo+Pj4gR29vZCBwb2lu
dC4gTm8sIGN1cnJlbnRseSBpdCdzIG9ubHkgY29uZGl0aW9uZWQgb24gdHJhbnNodWdlIHBhZ2Ug
c3VwcG9ydC4KPj4+IE5lZWQgdG8gY29uZGl0aW9uIGl0IG9uIGFsc28gZGV2bWFwIHN1cHBvcnQu
Cj4+Pgo+Pj4+IEFsc28sIEkgZmVlbCBsaWtlIHRoaXMgY29kZSB0byBpbnN0YWxsICJwdGVfc3Bl
Y2lhbCIgaHVnZSBwYWdlcyBkb2VzCj4+Pj4gbm90IGJlbG9uZyBpbiB0aGUgZHJtIHN1YnN5c3Rl
bS4uCj4+PiBJIGNvdWxkIGFkZCBoZWxwZXJzIGluIGh1Z2VfbWVtb3J5LmM6Cj4+Pgo+Pj4gdm1m
X2luc2VydF9wZm5fcG1kX3Byb3Rfc3BlY2lhbCgpIGFuZAo+Pj4gdm1mX2luc2VydF9wZm5fcHVk
X3Byb3Rfc3BlY2lhbCgpCj4+IFRoZSBzb21ld2hhdCBhbm5veWluZyB0aGluZyBpcyB0aGF0IHdl
J2QgbmVlZCBhbiBlcnJvciBjb2RlIHNvIHdlIGZhbGwKPj4gYmFjayB0byBwdGUgZmF1bHQgaGFu
ZGxpbmcuIFRoYXQncyBhdCBsZWFzdCBteSB1bmRlcnN0YW5kaW5nIG9mIGhvdwo+PiBwdWQvcG1k
IGZhdWx0IGhhbmRsaW5nIHdvcmtzLiBOb3Qgc3VyZSBob3cgYXdrd2FyZCB0aGF0IGlzIGdvaW5n
IHRvIGJlCj4+IHdpdGggdGhlIG92ZXJhbGwgZmF1bHQgaGFuZGxpbmcgZmxvdy4KPj4KPj4gQnV0
IGFzaWRlIGZyb20gdGhhdCBJIHRoaW5rIHRoaXMgbWFrZXMgdG9ucyBvZiBzZW5zZS4KPiBXaHkg
c2hvdWxkIHRoZSBkcml2ZXIgYmUgc28gc3BlY2lmaWM/Cj4KPiB2bWZfaW5zZXJ0X3Bmbl9yYW5n
ZV9YWFgoKQo+Cj4gQW5kIGl0IHdpbGwgZmlndXJlIG91dCB0aGUgb3B0aW1hbCB3YXkgdG8gYnVp
bGQgdGhlIHBhZ2UgdGFibGVzLgo+Cj4gRHJpdmVyIHNob3VsZCBwcm92aWRlIHRoZSBsYXJnZXN0
IHBoeXNpY2FsbHkgY29udGlndW91cyByYW5nZSBpdCBjYW4KCkkgZmlndXJlIHRoYXQgd291bGQg
cHJvYmFibHkgd29yaywgYnV0IHNpbmNlIHRoZSBodWdlX2ZhdWx0KCkgaW50ZXJmYWNlIAppcyBh
bHJlYWR5IHByb3ZpZGluZyB0aGUgc2l6ZSBvZiB0aGUgZmF1bHQgYmFzZWQgb24gaG93IHRoZSBw
YWdldGFibGUgaXMgCmN1cnJlbnRseSBwb3B1bGF0ZWQgSSBmaWd1cmUgdGhhdCB3b3VsZCBoYXZl
IHRvIG1vdmUgYSBsb3Qgb2YgdGhhdCBsb2dpYyAKaW50byB0aGF0IGhlbHBlci4uLgoKL1Rob21h
cwoKCj4KPiBKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
