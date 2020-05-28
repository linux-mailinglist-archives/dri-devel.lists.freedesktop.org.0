Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273EF1E6209
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 15:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5622D6E52F;
	Thu, 28 May 2020 13:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C72BA6E52C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 13:22:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F57FD6E;
 Thu, 28 May 2020 06:22:42 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF0223F52E;
 Thu, 28 May 2020 06:22:40 -0700 (PDT)
Subject: Re: [PATCH 03/15] drm/panfrost: don't use pfdevfreq.busy_count to
 know if hw is idle
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
References: <20200510165538.19720-1-peron.clem@gmail.com>
 <20200510165538.19720-4-peron.clem@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <3c108f43-67bd-8056-879d-36aea2d66a60@arm.com>
Date: Thu, 28 May 2020 14:22:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200510165538.19720-4-peron.clem@gmail.com>
Content-Language: en-GB
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMDUvMjAyMCAxNzo1NSwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+IFRoaXMgdXNlIGRl
dmZyZXEgdmFyaWFibGUgdGhhdCB3aWxsIGJlIGxvY2sgd2l0aCBzcGlubG9jayBpbiBmdXR1cmUK
PiBwYXRjaGVzLiBXZSBzaG91bGQgZWl0aGVyIGludHJvZHVjZSBhIGZ1bmN0aW9uIHRvIGFjY2Vz
cyB0aGlzIG9uZQo+IGJ1dCBhcyBkZXZmcmVxIGlzIG9wdGlvbmFsIGxldCdzIGp1c3QgcmVtb3Zl
IGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFp
bC5jb20+CgpBcyBmYXIgYXMgSSBjYW4gdGVsbCB0aGlzIHNob3VsZCBiZSBzYWZlLiBBcyB5b3Ug
bm90ZSB0aGlzIHdvdWxkbid0IHdvcmsgCndpdGhvdXQgZGV2ZnJlcSBhbnl3YXkuCgpSZXZpZXdl
ZC1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KCj4gLS0tCj4gICBkcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgfCA0IC0tLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3Rfam9iLmMKPiBpbmRleCA3OTE0YjE1NzA4NDEuLjYzZTMyYTlmMjc0OSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKPiBAQCAtNTgxLDEwICs1ODEsNiBAQCBp
bnQgcGFuZnJvc3Rfam9iX2lzX2lkbGUoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4g
ICAJc3RydWN0IHBhbmZyb3N0X2pvYl9zbG90ICpqcyA9IHBmZGV2LT5qczsKPiAgIAlpbnQgaTsK
PiAgIAo+IC0JLyogQ2hlY2sgd2hldGhlciB0aGUgaGFyZHdhcmUgaXMgaWRsZSAqLwo+IC0JaWYg
KGF0b21pY19yZWFkKCZwZmRldi0+ZGV2ZnJlcS5idXN5X2NvdW50KSkKPiAtCQlyZXR1cm4gZmFs
c2U7Cj4gLQo+ICAgCWZvciAoaSA9IDA7IGkgPCBOVU1fSk9CX1NMT1RTOyBpKyspIHsKPiAgIAkJ
LyogSWYgdGhlcmUgYXJlIGFueSBqb2JzIGluIHRoZSBIVyBxdWV1ZSwgd2UncmUgbm90IGlkbGUg
Ki8KPiAgIAkJaWYgKGF0b21pY19yZWFkKCZqcy0+cXVldWVbaV0uc2NoZWQuaHdfcnFfY291bnQp
KQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
