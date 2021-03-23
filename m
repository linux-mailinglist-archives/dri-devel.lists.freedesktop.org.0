Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39582346245
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596536E947;
	Tue, 23 Mar 2021 15:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92826E947
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 8ADF93FBD2;
 Tue, 23 Mar 2021 16:05:15 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=FHZiIXFT; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bl9FkwmAFN1D; Tue, 23 Mar 2021 16:05:14 +0100 (CET)
Received: by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id A80863F84E;
 Tue, 23 Mar 2021 16:05:11 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.198.151.43])
 by mail1.shipmail.org (Postfix) with ESMTPSA id E31823602AF;
 Tue, 23 Mar 2021 16:05:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616511911; bh=ERRcOLv79yXvN5bQmSpWkBFFjvHOVmKGZWh48H3jXZg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FHZiIXFTZJTov+7Y6hz8XbGGOxxnA+/UU9rC1aJzGqUPG4RYqXwljopR6NAfvmX3B
 RiGxPJdgALXFMrqDKNaoxOdiQ5zhUMmji651p/Z0wqlmVOUtjqL+8HNcZGQvtU+1WP
 Rh5WLj/6apbPakGeqElDVHyhNnfY1yMSz79lQtEY=
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-2-thomas_os@shipmail.org>
 <20210323135217.GD2356281@nvidia.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <ea011a3d-d9f8-77b7-9624-f2ae4777f019@shipmail.org>
Date: Tue, 23 Mar 2021 16:05:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323135217.GD2356281@nvidia.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMjMvMjEgMjo1MiBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFN1biwgTWFy
IDIxLCAyMDIxIGF0IDA3OjQ1OjI4UE0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkg
d3JvdGU6Cj4+IGRpZmYgLS1naXQgYS9tbS9ndXAuYyBiL21tL2d1cC5jCj4+IGluZGV4IGU0MDU3
OTYyNGYxMC4uMWI2YTEyN2YwYmRkIDEwMDY0NAo+PiArKysgYi9tbS9ndXAuYwo+PiBAQCAtMTk5
Myw2ICsxOTkzLDE3IEBAIHN0YXRpYyB2b2lkIF9fbWF5YmVfdW51c2VkIHVuZG9fZGV2X3BhZ2Vt
YXAoaW50ICpuciwgaW50IG5yX3N0YXJ0LAo+PiAgIH0KPj4gICAKPj4gICAjaWZkZWYgQ09ORklH
X0FSQ0hfSEFTX1BURV9TUEVDSUFMCj4+ICsvKgo+PiArICogSWYgd2UgY2FuJ3QgZGV0ZXJtaW5l
IHdoZXRoZXIgb3Igbm90IGEgcHRlIGlzIHNwZWNpYWwsIHRoZW4gZmFpbCBpbW1lZGlhdGVseQo+
PiArICogZm9yIHB0ZXMuIE5vdGUsIHdlIGNhbiBzdGlsbCBwaW4gSHVnZVRMQiBhcyBpdCBpcyBn
dWFyYW50ZWVkIG5vdCB0byBiZQo+PiArICogc3BlY2lhbC4gRm9yIFRIUCwgc3BlY2lhbCBodWdl
IGVudHJpZXMgYXJlIGluZGljYXRlZCBieSB4eHhfZGV2bWFwKCkKPj4gKyAqIHJldHVybmluZyB0
cnVlLCBidXQgYSBjb3JyZXNwb25kaW5nIGNhbGwgdG8gZ2V0X2Rldl9wYWdlbWFwKCkgd2lsbAo+
PiArICogcmV0dXJuIE5VTEwuCj4+ICsgKgo+PiArICogRm9yIGEgZnV0ZXggdG8gYmUgcGxhY2Vk
IG9uIGEgVEhQIHRhaWwgcGFnZSwgZ2V0X2Z1dGV4X2tleSByZXF1aXJlcyBhCj4+ICsgKiBnZXRf
dXNlcl9wYWdlc19mYXN0X29ubHkgaW1wbGVtZW50YXRpb24gdGhhdCBjYW4gcGluIHBhZ2VzLiBU
aHVzIGl0J3Mgc3RpbGwKPj4gKyAqIHVzZWZ1bCB0byBoYXZlIGd1cF9odWdlX3BtZCBldmVuIGlm
IHdlIGNhbid0IG9wZXJhdGUgb24gcHRlcy4KPj4gKyAqLwo+IFdoeSBtb3ZlIHRoaXMgY29tbWVu
dD8gSSB0aGluayBpdCB3YXMgY29ycmVjdCB3aGVyZSBpdCB3YXMKClllcywgeW91J3JlIHJpZ2h0
LiBJIG1pc3JlYWQgaXQgdG8gcmVmZXIgdG8gdGhlIGFjdHVhbCBjb2RlIGluIHRoZSAKZ3VwX3B0
ZV9yYW5nZSBmdW5jdGlvbiByYXRoZXIgdGhhbiB0byB0aGUgZW1wdHkgdmVyc2lvbi4gSSdsbCBt
b3ZlIGl0IGJhY2suCgovVGhvbWFzCgoKPgo+IEphc29uCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
